Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C193359805E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 10:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202AAC537F;
	Thu, 18 Aug 2022 08:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8886C53BB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 08:54:44 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oObIZ-0001Iu-3G; Thu, 18 Aug 2022 10:54:43 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oObIU-0008RM-BW; Thu, 18 Aug 2022 10:54:38 +0200
Date: Thu, 18 Aug 2022 10:54:38 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v4 5/7] drm/msm/a6xx: Ensure CX collapse during gpu
 recovery
Message-ID: <20220818085438.GA29793@pengutronix.de>
References: <1660749261-7602-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220817204224.v4.5.I176567525af2b9439a7e485d0ca130528666a55c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817204224.v4.5.I176567525af2b9439a7e485d0ca130528666a55c@changeid>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Akhil,

On Wed, Aug 17, 2022 at 08:44:18PM +0530, Akhil P Oommen wrote:
> Because there could be transient votes from other drivers/tz/hyp which
> may keep the cx gdsc enabled, we should poll until cx gdsc collapses.
> We can use the reset framework to poll for cx gdsc collapse from gpucc
> clk driver.
> 
> This feature requires support from the platform's gpucc driver.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Use reset interface from gpucc driver to poll for cx gdsc collapse
>   https://patchwork.freedesktop.org/series/106860/
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>  drivers/gpu/drm/msm/msm_gpu.c         | 4 ++++
>  drivers/gpu/drm/msm/msm_gpu.h         | 4 ++++
>  3 files changed, 12 insertions(+)
> 
[...]
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 07e55a6..4a57627 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
[...]
> @@ -903,6 +904,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	if (IS_ERR(gpu->gpu_cx))
>  		gpu->gpu_cx = NULL;
>  
> +	gpu->cx_collapse = devm_reset_control_get_optional(&pdev->dev,
> +			"cx_collapse");

Please use devm_reset_control_get_optional_exclusive() instead.

With that,
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
