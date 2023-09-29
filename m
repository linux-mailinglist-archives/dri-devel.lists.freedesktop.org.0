Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D2D7B3731
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 17:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C843E10E155;
	Fri, 29 Sep 2023 15:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5884110E155;
 Fri, 29 Sep 2023 15:45:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 785A961F65;
 Fri, 29 Sep 2023 15:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF5EC433C8;
 Fri, 29 Sep 2023 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696002313;
 bh=0hDyT9MUh8730O65k81LE+Nwv/GSPLBC8hZOSfjcJio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L89p6HObshK63IiZfGBnFLEiyJRV5qx5Ylk0YL8Em55VwmFMHeCK2rH3SCRf+qpHc
 r+1rMwkT+ur98q+lKztETgV8XwMUJBrwY9LDe++xxAjkVQp3i2KOzh2+7VepJnf/jx
 jBQ65yqRLTapKyLmIucukAd5W70gfCcaz060PYGVONOjzpLkz+AclAREjr8nC3sZE7
 bkSxXw6SOnJ88nPHQkfTl/nhjvPRicb369IojHETjWINtL9Awbi031+LrxTVoE5Dr4
 uv+UfTKKyEw489m3VNPwVWM3ttRZtrMVISqRNSEOcNgHQKgxs50+wQHICadF9X5G/D
 fH2LHeuhwIsww==
Date: Fri, 29 Sep 2023 16:45:07 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Message-ID: <20230929154507.GA30764@willie-the-truck>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
 <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Sep 25, 2023 at 06:54:42PM +0100, Robin Murphy wrote:
> On 2023-04-10 19:52, Dmitry Baryshkov wrote:
> > If the Adreno SMMU is dma-coherent, allocation will fail unless we
> > disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> > coherent SMMUs (like we have on sm8350 platform).
> 
> Hmm, but is it right that it should fail in the first place? The fact is
> that if the SMMU is coherent then walks *will* be outer-WBWA, so I honestly
> can't see why the io-pgtable code is going out of its way to explicitly
> reject a request to give them the same attribute it's already giving then
> anyway :/
> 
> Even if the original intent was for the quirk to have an over-specific
> implication of representing inner-NC as well, that hardly seems useful if
> what we've ended up with in practice is a nonsensical-looking check in one
> place and then a weird hacky bodge in another purely to work around it.
> 
> Does anyone know a good reason why this is the way it is?

I think it was mainly because the quick doesn't make sense for a coherent
page-table walker and we could in theory use that bit for something else
in that case.

Will
