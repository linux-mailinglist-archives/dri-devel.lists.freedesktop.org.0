Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E612F2A3F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA876E14D;
	Tue, 12 Jan 2021 08:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7A96E139
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q18so1569467wrn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oIh/8x9tUcSMZQg8sHPIHBpg/EOFB0Bj5BeFwAlTvF8=;
 b=dyNo52iGs5duAyeKqUc4Knjz8niIx0V9snOn8uZoCLgAX9l82SwuzYUTT9Ec5EQyzV
 IC51uFExXFdUw3WaoD9JTj0zLFB3wbs7slcVTENdV04B8gsPzOfADYW7WXlA6jm5G1w9
 bRuDYrKFm8G6n0LYtMKRiOY+T/L/oK7XKuDa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oIh/8x9tUcSMZQg8sHPIHBpg/EOFB0Bj5BeFwAlTvF8=;
 b=LnhGUUEXj8n//0KJZI3K6GOqh+0N1PXKQMeeWRh42MbwN5+ZJUQfgY665IGJn/fVkT
 wbFJ3+LsLb5IY5fNcrVJ9eILFf7702rH5AB2rg0moPG5JCfCIxpzQAEro9RvNLAT1v5O
 xtMsUWO9Kts8WFpv1UMeOqNuIRFqP8yR02DbAY9ujRd6v8+CA4bNEDV4aD9zMxKF4eMk
 QsZjQghosAcfGjnV+1HjGGDOBvCrXPpNh4UdxnUh3hvD9Oet+ZlZneFJ4A8oVVe8FLB6
 dpp6idU6GtUb0kgJ4T9Td7LyEEJaPI0TX1Razk9V1f524WagL7Ep0t/fZBaO1vcmFMEu
 jltg==
X-Gm-Message-State: AOAM531yltfPMrCaDMMkbqWKS4WuhXeVRtUbUXNapTelXPHlRCYQUvbH
 oslZmJQNIBAeuTtuo7aTfaDxvrXZMEC2zstX
X-Google-Smtp-Source: ABdhPJyjz2UJYjEW/Fj8bKQDD7W9dJkAwvhZBD37/IVq0yCXmR/j0wRlo2L8jyWwnnb3ep0Aisvk4w==
X-Received: by 2002:adf:df08:: with SMTP id y8mr3007860wrl.278.1610441053530; 
 Tue, 12 Jan 2021 00:44:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/15] drm/arc: Align with simple pipe helpers
Date: Tue, 12 Jan 2021 09:43:51 +0100
Message-Id: <20210112084358.2771527-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simple pipe helpers only have an enable and disable hook, no more
mode_set_nofb. Call it from our enable hook to align with that
conversions.

Atomic helpers always call mode_set_nofb and enable together, so
there's no functional change here.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 43313adb1981..3538c1686ca4 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -73,10 +73,9 @@ static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
 	return MODE_NOCLOCK;
 }
 
-static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
+static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
-	struct drm_display_mode *m = &crtc->state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -110,7 +109,7 @@ static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
 
-	arc_pgu_set_pxl_fmt(crtc);
+	arc_pgu_set_pxl_fmt(&arcpgu->pipe.crtc);
 
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
@@ -120,6 +119,8 @@ static void arc_pgu_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
 
+	arc_pgu_mode_set(arcpgu);
+
 	clk_prepare_enable(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
 		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
@@ -139,7 +140,6 @@ static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 	.mode_valid	= arc_pgu_crtc_mode_valid,
-	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
 	.atomic_enable	= arc_pgu_crtc_atomic_enable,
 	.atomic_disable	= arc_pgu_crtc_atomic_disable,
 };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
