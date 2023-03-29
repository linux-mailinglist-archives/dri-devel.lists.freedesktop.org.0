Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779D6CDCC1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 16:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E56310EB11;
	Wed, 29 Mar 2023 14:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C558E10EB15;
 Wed, 29 Mar 2023 14:36:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17F49B8229F;
 Wed, 29 Mar 2023 14:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A314CC433D2;
 Wed, 29 Mar 2023 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680100614;
 bh=XTkKPvBNieDl9RE+ktDyCOV9yI/ueyrxbrxjm76EYQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TctY+jPB/3xa2j7YZCroyr0fotSU9F7EJu8GC3R392Ync5I4rrZRahdVOad6ww3dz
 oCt3oX3wF/WpVf0vQciRPn0n8IEXZXM5T/4aPsYr+PQyIu2saPvtgacdyRVLGe9HBo
 HVHj88QnuWdkEjelE2lXTl8g76BJ069LVtPt0vSnph+xeYBXgxS5Lh9O93haYsiacE
 UHEfIqlt2ei0/z02iEpUzZY8HWBLA2xbduECCwEGLoBLrR6HnP1/eITY4anzJfY4XU
 yCtFfIn3t0zp/YCLmCiHAVFWq/TrXnaBwEe7ZBr4LhQrxayuwrz0Y35Xl6AdmA0We9
 YVtw0leYx9a6g==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1phWvG-0000IY-4t; Wed, 29 Mar 2023 16:37:10 +0200
Date: Wed, 29 Mar 2023 16:37:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
Message-ID: <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
References: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>, agross@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 04:04:44PM +0200, Konrad Dybcio wrote:
> If we fail to initialize the GPU for whatever reason (say we don't
> embed the GPU firmware files in the initrd), the error path involves
> pm_runtime_put_sync() which then calls idle() instead of suspend().
> 
> This is suboptimal, as it means that we're not going through the
> clean shutdown sequence. With at least A619_holi, this makes the GPU
> not wake up until it goes through at least one more start-fail-stop
> cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
> shutdown.

This does not sound right. If pm_runtime_put_sync() fails to suspend the
device when the usage count drops to zero, then you have a bug somewhere
else.

Also since commit 2c087a336676 ("drm/msm/adreno: Load the firmware
before bringing up the hardware") the firmware is loaded before even
hitting these paths so the above description does not sound right in
that respect either (or is missing some details).

> Test cases:
> 1. firmware baked into kernel
> 2. error loading fw in initrd -> load from rootfs at DE start
> 
> Both succeed on A619_holi (SM6375) and A630 (SDM845).
> 
> Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu load")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index f61896629be6..59f3302e8167 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -477,7 +477,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>  	return gpu;
>  
>  err_put_rpm:
> -	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_put_sync_suspend(&pdev->dev);
>  err_disable_rpm:
>  	pm_runtime_disable(&pdev->dev);

Johan
