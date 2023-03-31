Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FBC6D1827
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 09:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF6B10F10D;
	Fri, 31 Mar 2023 07:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A498910F10D;
 Fri, 31 Mar 2023 07:09:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C6E2B82C54;
 Fri, 31 Mar 2023 07:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0673EC433D2;
 Fri, 31 Mar 2023 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680246556;
 bh=8B9ggKbgJA0nMokqNAZYgf88QhUL8VJ/Zq2eCjzoNns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t5fJSmjupmwdDWJpAN7hBA7/D6nOMSjgzJ+EuX0R++HOqcOMtQjTSU+RQ6n0aJFGv
 n4Blc4il4vSJTRgvA9CCdoal+VrKP31DmARfFmke3c+jLrAbSsGYG/TrKg8dpd/vmD
 gBm8zP6mk4aMh3Y50XULT8nxKrbBROx+YV114lomPOH6k3VKvwAFxVOST8ve7AkXUn
 s8E4s81+gkdcv/FvVLRSnXXijWlxG9XnZbYd5/HwChG7B0MPLPkCT9iIJ2AvS32fKR
 xRXMTdzF2PB4itrmnbPY47Z+CHQ0spNUkBcepXeiIDAXEBhMZs3/gded0AQ30YefhQ
 yOcIYXZHEmi3w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pi8tE-0005uP-2j; Fri, 31 Mar 2023 09:09:36 +0200
Date: Fri, 31 Mar 2023 09:09:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
Message-ID: <ZCaHMOS0m5UoBJ1k@hovoldconsulting.com>
References: <20230330231517.2747024-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330231517.2747024-1-konrad.dybcio@linaro.org>
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

On Fri, Mar 31, 2023 at 01:15:16AM +0200, Konrad Dybcio wrote:
> The adreno_load_gpu() path is guarded by an error check on
> adreno_load_fw(). This function is responsible for loading
> Qualcomm-only-signed binaries (e.g. SQE and GMU FW for A6XX), but it
> does not take the vendor-signed ZAP blob into account.
> 
> By embedding the SQE (and GMU, if necessary) firmware into the
> initrd/kernel, we can trigger and unfortunate path that would not bail
> out early and proceed with gpu->hw_init(). That will fail, as the ZAP
> loader path will not find the firmware and return back to
> adreno_load_gpu().
> 
> This error path involves pm_runtime_put_sync() which then calls idle()
> instead of suspend(). This is suboptimal, as it means that we're not
> going through the clean shutdown sequence. With at least A619_holi, this
> makes the GPU not wake up until it goes through at least one more
> start-fail-stop cycle. The pm_runtime_put_sync that appears in the error
> path actually does not guarantee that because of the earlier enabling of
> runtime autosuspend.
> 
> Fix that by using pm_runtime_put_sync_suspend to force a clean shutdown.
> 
> Test cases:
> 1. All firmware baked into kernel
> 2. error loading ZAP fw in initrd -> load from rootfs at DE start
> 
> Both succeed on A619_holi (SM6375) and A630 (SDM845).
> 
> Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu load")

As this one is marked for stable, you also need:

Cc: stable@vger.kernel.org	# 6.0

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

> ---
> v1 -> v2:
> - Improve the commit message and the reasoning within
> 
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
