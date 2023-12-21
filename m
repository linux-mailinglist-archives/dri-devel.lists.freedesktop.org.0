Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7069F81B980
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 15:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70A10E44E;
	Thu, 21 Dec 2023 14:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8118010E44E;
 Thu, 21 Dec 2023 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703168771;
 bh=vbn1EXleyZtDuKIke5KjfSmPkONCiF542/aWo5ip2Jk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fB/4g4yOJMpQcH6ewX7Xagioop7Ych+Y1RJftKahCduDTcXMz23/t/HANQilLvoAW
 GCoAopo4J6TTU+Nf6+9CmVbtSmHKQj1SAvqkHoYyi8PHNrh5BxPaa0O3sBgNBeV8h2
 eGCUk8AcomhsE4NP6yMxFxrInBgMABF0qHxUxDhf8eAAQSuc+q2P+GiT9o+mDtvpn+
 k8xp5Z2yXyzZL4iDgufqcKlGPGzlrQwov6lgrOgU+smk5+MQvSWdUY8N+j5Unn7Raf
 ZT0e6HNciac8L29nbBbCNO+5fbtJwqEI09C42m3ke4K4FOxdH9DVOHLz31J1BpLiaw
 5w3XvSdXdivHA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B5A63781FD5;
 Thu, 21 Dec 2023 14:26:07 +0000 (UTC)
Message-ID: <981a49d2-19ed-21fb-77af-ba9684a60cc3@collabora.com>
Date: Thu, 21 Dec 2023 19:56:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ci: uprev mesa version: fix kdl commit fetch
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231212160448.883358-1-vignesh.raman@collabora.com>
 <CAA8EJpro5Hb0yRaxPWzBQBikKjw9JnNVkUuPFvWeXjegzCuxHw@mail.gmail.com>
 <e747581b-d5e0-4622-827b-48fb51fa9711@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <e747581b-d5e0-4622-827b-48fb51fa9711@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 14/12/23 17:50, Helen Koike wrote:
> 
> 
> On 14/12/2023 05:00, Dmitry Baryshkov wrote:
>> On Tue, 12 Dec 2023 at 18:04, Vignesh Raman 
>> <vignesh.raman@collabora.com> wrote:
>>>
>>> build-kdl.sh was doing a `clone --depth 1` of the default branch,
>>> then checking out a commit that might not be the latest of that
>>> branch, resulting in container build error.
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/commit/5efa4d56 fixes
>>> kdl commit fetch issue. Uprev mesa in drm-ci to fix this.
>>>
>>> This commit also updates the kernel tag and adds .never-post-merge-rules
>>> due to the mesa uprev.
>>>
>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 

With this mesa uprev, the virtio-gpu jobs are not getting created and
other jobs are not affected. The issue is identified and fixed, will be 
sending a v2.

Regards,
Vignesh
