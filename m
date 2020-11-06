Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451AF2A9CB6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81E46EAE2;
	Fri,  6 Nov 2020 18:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304906EADF;
 Fri,  6 Nov 2020 18:52:07 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 062A720071;
 Fri,  6 Nov 2020 19:52:03 +0100 (CET)
Date: Fri, 6 Nov 2020 19:52:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] drm: Use IS_ERR() instead of null pointer check
Message-ID: <20201106185202.GA808798@ravnborg.org>
References: <1604629881-557-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604629881-557-1-git-send-email-wangqing@vivo.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=1WtWmnkvAAAA:8 a=e5mUnYsNAAAA:8
 a=u0hbGyvj-nib5C6JQ3MA:9 a=CjuIK1q_8ugA:10 a=-_UHfarfsM-RsASml2Jt:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang.

Thanks for the fix.

On Fri, Nov 06, 2020 at 10:31:19AM +0800, Wang Qing wrote:
> a6xx_gmu_get_mmio() never return null in case of error, but ERR_PTR(),
> so we should use IS_ERR() instead of null pointer check
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

In the future please put "drm/<driver-dir>:" in the subject.
See git log . in said directory for normal practice - this let the
readers see this is an msm related patch.



> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 491fee4..8c81a89
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -492,7 +492,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>  	uint32_t pdc_address_offset;
>  
> -	if (!pdcptr || !seqptr)
> +	if (IS_ERR(pdcptr) || IS_ERR(seqptr))
>  		goto err;

When the pointer is checked after the err: label the function
IS_ERR_OR_NULL() is used. Please update both places so they match.

	Sam

>  
>  	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
