Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E971A94DB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558776E8C7;
	Wed, 15 Apr 2020 07:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A926E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d17so10953731wrg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ErqAPDoOJa+uxnCEi1URGTXLvWxTkdElex0XBYjuXO4=;
 b=j7mtc0xmdKZW9qMg7k3eBuXx6ezKMnYYdjfwtONG4c+c5/qpfNfnIrEoVUuAj0pVPb
 A5Cpd2lxcCAy1rSDeI1/Kgf6G/YuklOBIkt6b9ObjjfLyXOKA31KYbeqZGWnRngrt3LA
 j02fL0t8GzLzd3k9M5GdqtoMN9sn60kuZsO2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ErqAPDoOJa+uxnCEi1URGTXLvWxTkdElex0XBYjuXO4=;
 b=Mk2O1Uw58fGo/0fn+k2Dh0KgBD95AhvqyX2E0AOJfiF+vNfnFwU9bcpQHY5kL3JaEQ
 d9FnuaJjUD+ZEO/TeKHSSPiwpEi410JS7YpDH0ik2L9iYH6MUTCTMz77SxGxoiy5UQYJ
 SjFIWrglnJsVYBpacYI2DzEqXRx7Ye1Y5FvB8HDEMgGHTXootx1nqiwAIqUIkJ/i8m3L
 YzLiJ+QTeUpSs41G3tV+pXEOT+aoPgEvrRwyKDsl+r8nmNjUZySy69NVKOhi14CYuvag
 JceN1//O1GRBo8oyU7xdLVR/nzrHo3Lny6EPNuIpgJR5d5Uo7fp0/dd/YM5q1wW9XK6R
 079w==
X-Gm-Message-State: AGi0PuaDeIolDzqjFeHjBjl6nOdHfsvSqI8VGDVeZRIwXzamY8DfLseK
 sbVxIXI3hRMwUrv+HuPkG31m/w==
X-Google-Smtp-Source: APiQypJRZxb+X2VegasnSmOxlc3ZAjX52A4MsW84iYJ1BYd2vY6ncjQ9puMutSVvp952RtzskHnXJA==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr4426193wro.36.1586936482676; 
 Wed, 15 Apr 2020 00:41:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 40/59] drm/arcpgu: Stop using drm_device->dev_private
Date: Wed, 15 Apr 2020 09:40:15 +0200
Message-Id: <20200415074034.175360-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h      | 2 ++
 drivers/gpu/drm/arc/arcpgu_crtc.c | 4 ++--
 drivers/gpu/drm/arc/arcpgu_drv.c  | 4 +---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index cd9e932f501e..87821c91a00c 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -17,6 +17,8 @@ struct arcpgu_drm_private {
 	struct drm_plane	*plane;
 };
 
+#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
+
 #define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index be7c29cec318..ba796a216244 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -178,7 +178,7 @@ static const struct drm_plane_funcs arc_pgu_plane_funcs = {
 
 static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
 {
-	struct arcpgu_drm_private *arcpgu = drm->dev_private;
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	struct drm_plane *plane = NULL;
 	int ret;
 
@@ -202,7 +202,7 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
 
 int arc_pgu_setup_crtc(struct drm_device *drm)
 {
-	struct arcpgu_drm_private *arcpgu = drm->dev_private;
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	struct drm_plane *primary;
 	int ret;
 
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index bbd7acb150f3..81b8d7ae6623 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -50,8 +50,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct resource *res;
 	int ret;
 
-	drm->dev_private = arcpgu;
-
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
 	if (IS_ERR(arcpgu->clk))
 		return PTR_ERR(arcpgu->clk);
@@ -120,7 +118,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *drm = node->minor->dev;
-	struct arcpgu_drm_private *arcpgu = drm->dev_private;
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
 	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
