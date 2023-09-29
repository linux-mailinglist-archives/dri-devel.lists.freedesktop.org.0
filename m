Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD407B3899
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 19:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCF010E124;
	Fri, 29 Sep 2023 17:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF5518910E;
 Fri, 29 Sep 2023 17:25:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666101FB;
 Fri, 29 Sep 2023 10:26:12 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96DD3F59C;
 Fri, 29 Sep 2023 10:25:32 -0700 (PDT)
Message-ID: <70d975d0-8ee7-9f08-7fae-4652a18df598@arm.com>
Date: Fri, 29 Sep 2023 18:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
 <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
 <20230929154507.GA30764@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230929154507.GA30764@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2023 4:45 pm, Will Deacon wrote:
> On Mon, Sep 25, 2023 at 06:54:42PM +0100, Robin Murphy wrote:
>> On 2023-04-10 19:52, Dmitry Baryshkov wrote:
>>> If the Adreno SMMU is dma-coherent, allocation will fail unless we
>>> disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
>>> coherent SMMUs (like we have on sm8350 platform).
>>
>> Hmm, but is it right that it should fail in the first place? The fact is
>> that if the SMMU is coherent then walks *will* be outer-WBWA, so I honestly
>> can't see why the io-pgtable code is going out of its way to explicitly
>> reject a request to give them the same attribute it's already giving then
>> anyway :/
>>
>> Even if the original intent was for the quirk to have an over-specific
>> implication of representing inner-NC as well, that hardly seems useful if
>> what we've ended up with in practice is a nonsensical-looking check in one
>> place and then a weird hacky bodge in another purely to work around it.
>>
>> Does anyone know a good reason why this is the way it is?
> 
> I think it was mainly because the quick doesn't make sense for a coherent
> page-table walker and we could in theory use that bit for something else
> in that case.

Yuck, even if we did want some horrible notion of quirks being 
conditional on parts of the config rather than just the format, then the 
users would need to be testing for the same condition as the pagetable 
code itself (i.e. cfg->coherent_walk), rather than hoping some other 
property of something else indirectly reflects the right information - 
e.g. there'd be no hope of backporting this particular bodge before 5.19 
where the old iommu_capable(IOMMU_CAP_CACHE_COHERENCY) always returned 
true, and in future we could conceivably support coherent SMMUs being 
configured for non-coherent walks on a per-domain basis.

Furthermore, if we did overload a flag to have multiple meanings, then 
we'd have no way of knowing which one the caller was actually expecting, 
thus the illusion of being able to validate calls in the meantime isn't 
necessarily as helpful as it seems, particularly in a case where the 
"wrong" interpretation would be to have no effect anyway. Mostly though 
I'd hope that if we ever got anywhere near the point of running out of 
quirk bits we'd have already realised that it's time for a better 
interface :(

Based on that, I think that when I do get round to needing to touch this 
code, I'll propose just streamlining the whole quirk.

Cheers,
Robin.
