Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59029A4B577
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 00:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01B110E0E7;
	Sun,  2 Mar 2025 23:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XKUvJgrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344610E0E7
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 23:01:44 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-548409cd2a8so4007705e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740956503; x=1741561303; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+6tLHwT02MdyiarYGqAftjy+FZoaHm2RQy2amBFDQNM=;
 b=XKUvJgrY6IUMdgIGKtTPVyq394ojb70GWi1UjS+rbjQOIYKPOwnV2yNwHwSvlV5gAC
 ozl822VOsPl3coUnfEpeKA6I5dVA320HH08VJ3RJbg5+3j1ELZk6F2pGd2G5XeqIeQpX
 2ku6UpEC7TiPLNn5TFXHInVPxkPzYt/9wypmnWKnOAMAOEieAFOYsBdvuvkF3+lR3Knp
 ggzW4eU1OGVkLmSdkupiks1h4xrnmxGpHVkNxadLVzWU6OozRnEREB7Hm0a1F8KlS71V
 y2sZ5Zf9PheEilcAVul2N9ICfPXZQE1G5opCyeHpG0pka39WcYqoX8EeTUF6pkGobz+Y
 TGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740956503; x=1741561303;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6tLHwT02MdyiarYGqAftjy+FZoaHm2RQy2amBFDQNM=;
 b=jGqvc4ktwA/122w4mBy+lEfmkQ9yste0kDxrh439iQTTLSQqi+d5tBEqNm6Q01PwFc
 iFf9D8Jp+mZB7nBDPho8fMarGRWgB4Xtw1DTA8y8SBrbe+Rohn8QsIeXxXJ+An4An+E3
 3iL9YdVGssKYL4P0ad/2pIevA7nxiDwE3wznlUsLG0vfNPJxku7h1mKi40CXLjSTjpPE
 CosVNlYSB1HVbqr156CCSr2T/nIzg44vjlwWRtrvkCuEeZM2YYawfNz0BvIbDe2NrIx1
 ec66ciNXBRIfeYGAtSjojcYFx3ASPxM8Znu0Y4E4ZJzVVu1yLGJi3ARlNUFJ4wyTVs4K
 8m/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN/g2XYGIxdpfOKvjW9kZXKb+g8kgDa6F3PuAmNjlUs0fjAUyJ+VExvpBWPxJ2jcuFND1kYito1Vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKZexoRyYLQCWwiRIymFo2mG4kRQPfLHbUU14rn3yRyFMrPVwo
 5+BIMNx9t0ye9dxWAbJuxkr5pR2e+NrJW+DdkKrTvamVPsjCOP9J6UJk84yOIZY=
X-Gm-Gg: ASbGncsNDYAjgviISj37Qpg92D2prEgZiZkOO7/mZL8YSwX/ztItw+ZZnWYc1n+WLEA
 Rz3ZsgnHJXyFivDciwf0B28sdChswa61XVu0DQK5Eb7uguTKxvMpL1KZu7YxgE8JmkoRHxSY4Gs
 8KRRGw+95Hoj0+e3uq0zFH/RsYxpnfsZIlYcDZ3dxcHlMTllzNq+T5CD0vIY28Vv6t6oBTjSWkJ
 RM0F4uN2k8CDntBzd8IoXcTyB868bNPSWdsGTDvQ56sdja3TnNM2KZQzI9nmTw9IhGlFgc4j0Hs
 gPo13JVvmIUq1LDJJXumnsWgKrAb8bwkKNGw0Z8uqRBz7SBEjXQ9ypOiBJKh7YgDUZpzAudQ+Hq
 V9DvCAl80v/vpwMD3YgY0SKwh
X-Google-Smtp-Source: AGHT+IE6iJ6MJULbhVODlhEs0Uz3Bo0Jahq2KVUfeiM0dMjeCLZC5DbHiJxY2q28Q7dzFsOZ3W5T5w==
X-Received: by 2002:a05:6512:3b11:b0:545:2f48:d524 with SMTP id
 2adb3069b0e04-5494c320d25mr3513353e87.29.1740956502909; 
 Sun, 02 Mar 2025 15:01:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54956a2c610sm747244e87.4.2025.03.02.15.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 15:01:41 -0800 (PST)
Date: Mon, 3 Mar 2025 01:01:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
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

On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 11 Apr 2023 18:24:24 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> 
> Thus avoid the risk for undefined behaviour by removing extra
> initialisations for the variable “c” (also because it was already
> reassigned with the same value behind this pointer check).
> 
> This issue was detected by using the Coccinelle software.

Please don't send resends and/or new iterations in response to your
previous patchsets. Otherwise they have a pretty high chance to be
ignored by the maintainers. Use a fresh git-send-email command to send
new patchset.

> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..870ab3ebbc94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -176,7 +176,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
>  static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
>  		bool enable_external_te)
>  {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>  	u32 cfg;
>  	int orig;
> 
> @@ -221,7 +221,7 @@ static int dpu_hw_pp_get_vsync_info(struct dpu_hw_pingpong *pp,
> 
>  static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>  {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>  	u32 height, init;
>  	u32 line = 0xFFFF;
> 
> --
> 2.40.0
> 

-- 
With best wishes
Dmitry
