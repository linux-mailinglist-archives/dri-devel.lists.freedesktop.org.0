Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23D49B87A3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 01:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CA110E116;
	Fri,  1 Nov 2024 00:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cFmEwYnR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049A010E116
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 00:25:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53c779ef19cso1814657e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730420716; x=1731025516; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Oz8IVPHbbVKsM7ENVrxAMUhoPK6SMfJXrPI8pxkC7X8=;
 b=cFmEwYnRYwAxkryr6w0G2XX4VDe78PPfwNar+0TBMoPtYtE1tZINW82dgGE1IBGOkE
 YM61zrjGos+luj/Jz+11TZ+UQo5iQO8LhAnPCK5sw1CUGY5TsYSpyrv1ewnxsA/gn0Mj
 gNspf1iI5G+TqHHM2FmnG8Cn7YYFwlqwvP/qus8lvXyz+6gG2QPTKq2CM8/8vdsKom7V
 lYSKAFiwD/laRdTCC9bEQbJyuPDtAYUb9wexiDpn/0TXiHV5JAtg/Oteq79kTP709bNx
 J7LfzcV9gKQU3Wno7vedOL3RzGIKoUGRCTHlTn4C1VzlajTRWINfVGtETUU4v1x3BSDD
 i72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730420716; x=1731025516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oz8IVPHbbVKsM7ENVrxAMUhoPK6SMfJXrPI8pxkC7X8=;
 b=Sj+CQlpMUI15rPDNAsceSJVsscOEcLwhnTDFCHI9LGCRhK0ZeuBxIVbHa+PeN4Lu0A
 YNHKnW6JSBN1u5HKSga8DSUqwZtwwv3MiH+jFqfm1Rc8EwQwBO40BFB4PTsNcJ9BDF9i
 9EpSuqx81MKRiSG4c+ml/gV8BrMLpabuxXVisgSNjcthCQmvbiO+habCcRDoSRcKOO0u
 LjnRVgqY4mNQ/V+qntvuDSp1zEWtbllyzcZT9hcNJTth1yxcwckSA1ak5ORr6fMMICMB
 o69FQI/Q7C3LyHKKlOU9dRPPT/r+hUfuSZ94lkXlM5zfDhb6ghx5DFg1uVDRBfeO5a9l
 jReA==
X-Gm-Message-State: AOJu0YxYZAi9/QOHNuccLgpaDTSwMVNCPyDHn0qyqkcLWhZxv/hztbre
 bPgrS8Chp0nNVuBNB+ZqIADv9YnVex+IadyOSh3y03uj6Vi39In1TycqngXbqR4=
X-Google-Smtp-Source: AGHT+IHcnRqxSLmcfcXWYuLKSdTWcQFnoMfz9gg3tI8jWHEyOYxomQLugov09w4G+e8FKbd9IggEGQ==
X-Received: by 2002:a05:6512:2214:b0:539:fb49:c489 with SMTP id
 2adb3069b0e04-53c79e16c2emr2460125e87.9.1730420716030; 
 Thu, 31 Oct 2024 17:25:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 17:25:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:06 +0200
Subject: [PATCH v2 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j8Ztg9arYN1ELRagVfF2elNxB8pJWUt6BffPwIK5vkY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hBB9KzuzMuq6rZPVIIyhq0/H5DKznjnvjc
 mWPqbE1GVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1SHmB/wLX9KwONfQBArsPgo8Qz/Mgw1Z4L54OL1ZshkDnVR+j6A1CHLrTiAn9haUM9+bgg1kAdT
 mJ5lQ2iexzQSb+vqQ6TPriswRPmiJPhsRJ8Hrt/j7l7zjpf00cpdDUCc0xX4hq2FGgi2OnwrGH9
 8t/FOZqEZsmzrkkDf5Brms3bEZHmxOsYdt9C3Cr+6DGf/B41PgSXAgbp4X64iQN1BlkEly/Otaj
 vLINazwB3mxY9sN4JmhaZfrTWHNbe/39wV4Y7rA7ZCZ696ZvbGQULrGumY5jceHeqNseiYK8cB1
 UvP4ZZBU5mNKzwSAMaXF0LHzTr5DeBG8s4VVaM5S3ylORuQO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

