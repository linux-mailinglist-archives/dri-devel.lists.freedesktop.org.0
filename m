Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF2B49B8C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E0610E21A;
	Mon,  8 Sep 2025 21:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Ip98w3po";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-74.smtpout.orange.fr
 [80.12.242.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5289110E207
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 21:09:15 +0000 (UTC)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id vj6puzqdeoTLUvj6puozOR; Mon, 08 Sep 2025 23:09:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1757365753;
 bh=6ltswrdyQEQpMWiYuSVRDKy5ajUU0upafr0DRYZj5dU=;
 h=Message-ID:Date:MIME-Version:Subject:From:To;
 b=Ip98w3po82tDFo78WFreoHDqqSTKQUvoEDNszK2zWi2rPiCt36agSQ7A+d4ZvaSwP
 RamEvrAl303pcRErS0TjhS5RHHA6iZh1+gQFULZB4LPDlN6GQkKqpR25DMe4h4xHc+
 5RKsqzcnWD5B2tj8gbMs467I/v47QnQV5QSnh7TXb+5fliGMc4NinF060yTtb7QGzG
 DglYg7jNHH6qr3PNyWaGhASvBsDuHa0poldyMxkZZNIC3Un7MzxkFR1ZCVXJKCav6K
 PkWFuHBzk0GpBkZfbbkSvQDRC0e42JJd9EGFhKs16fNEWSn/bvGwXuv1HhZDuS1UTG
 Ali2P3MY8035g==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 08 Sep 2025 23:09:13 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
Date: Mon, 8 Sep 2025 23:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
To: "dmitry.baryshkov@oss.qualcomm.com >> Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, geert+renesas@glider.be,
 harry.wentland@amd.com, jani.nikula@linux.intel.com,
 jessica.zhang@oss.qualcomm.com, kernel-list@raspberrypi.com,
 kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 liviu.dudau@arm.com, louis.chauvet@bootlin.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com,
 marijn.suijten@somainline.org, mcanal@igalia.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, suraj.kandpal@intel.com,
 tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de
In-Reply-To: <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw@public.gmane.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw@public.gmane.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>   	.reset = drm_atomic_helper_connector_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
> @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>   
>   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
>   
> -	/* DPU initializes the encoder and sets it up completely for writeback
> -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> -	 * to initialize the writeback connector
> -	 */
> -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> -			&dpu_wb_conn_funcs, format_list, num_formats);
> +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> +					   &dpu_wb_conn_funcs, enc,
> +					   format_list, num_formats);
>   
>   	if (!rc)
>   		dpu_wb_conn->wb_enc = enc;
> 

dpu_wb_conn is allocated a few lines above using devm_kzalloc().

Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.

Is it correct here?
If the explanation at [1] is correct, then &dpu_wb_conn->base would 
point to some released memory, IIUC.


just my 2c.

CJ

[1]: 
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
