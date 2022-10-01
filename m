Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5C15F1D0F
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CACB10E645;
	Sat,  1 Oct 2022 14:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F1E10E638
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbBek+DLo1uAiT4bxT5GcOfjUqanpBLVsNY+19U/h8w=;
 b=YC+ozLuBdsAZbA68YtxHi57xxIPawhrMmCUm4OSUWXX/pWC0Fwge9yjFECWAROMVCo3Z0a
 +oC/ImQjQzHlJUoF+ZgMgXcJk1qGkXklNgpYUEzQAvGvhgBeMnk52qr2c76HaqsX6PnQbU
 ZR87HwqqKPKdapoDu1VUb3KhDsnqQ+8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-Jx-qTyIeN9qwwN6159dklg-1; Sat, 01 Oct 2022 10:58:30 -0400
X-MC-Unique: Jx-qTyIeN9qwwN6159dklg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z16-20020a05640235d000b0045485e4a5e0so5635716edc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fbBek+DLo1uAiT4bxT5GcOfjUqanpBLVsNY+19U/h8w=;
 b=29l2idM/Cdcsp1CFdnviqzONEgbQ2KtQrtrT+k7c+wzvklT4mkCeuqySBBrkroM3vo
 aoRjiPc/iRewYed9vXeZIQFIKaJMBuogr6LzYWswb1MrWfYJjcpsTqs7Li6OgruGTx9E
 qd5pRF4J2G348abgAmY9PN+C4ZHzYFtSXY3h/3UW/LGkmXyRLh4pOPmXX2f7cfmWfslx
 bAsgGsJAEzKnzPx++2oqt2bMrrHkRiX2His52wlk0nwmKpL0y+5Ir8eQSzXGWBi5de5H
 E+UkNGGnu+AeAayFIN54z1ZxZnp9Q0XYVEvVwl3bHdj/6627lBafGvX8hI9EGPLt62i0
 jmSg==
X-Gm-Message-State: ACrzQf2H59JQlU9b6xTJkdaJ69roqcmCjmPFuy2W+ixvqPcgJCra9x0w
 Hee8khJRG1pz2dzhUetc7pIi1KPT4YtTvyegUCdawDpx1+GleTESFfWFJuYpr2q2f5oGYGGnrE/
 RdsxChrT4ZI79vEhLDtSPPxwq11QC
X-Received: by 2002:a17:907:845:b0:731:2f6c:6dbd with SMTP id
 ww5-20020a170907084500b007312f6c6dbdmr9754608ejb.551.1664636309689; 
 Sat, 01 Oct 2022 07:58:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77lcdC7sJsRPEhN5747tLtzHdni0e5EG5ogppqYZX80M+PrQk5aORErJsk4Ntf6tTYwo6zXw==
X-Received: by 2002:a17:907:845:b0:731:2f6c:6dbd with SMTP id
 ww5-20020a170907084500b007312f6c6dbdmr9754596ejb.551.1664636309517; 
 Sat, 01 Oct 2022 07:58:29 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb15-20020a0564020b6f00b004576e3aee69sm3768376edb.4.2022.10.01.07.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:29 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 6/9] drm/fsl-dcu: plane: protect device
 resources after removal
Date: Sat,  1 Oct 2022 16:57:59 +0200
Message-Id: <20221001145802.515916-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001145802.515916-1-dakr@redhat.com>
References: <20221001145802.515916-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 24 +++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 23ff285da477..b1305f0af9d5 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -65,15 +66,21 @@ static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
 {
 	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(plane->dev);
 	unsigned int value;
-	int index;
+	int index, idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	index = fsl_dcu_drm_plane_index(plane);
 	if (index < 0)
-		return;
+		goto out;
 
 	regmap_read(fsl_dev->regmap, DCU_CTRLDESCLN(index, 4), &value);
 	value &= ~DCU_LAYER_EN;
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 4), value);
+
+out:
+	drm_dev_exit(idx);
 }
 
 static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
@@ -86,14 +93,17 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane->state->fb;
 	struct drm_gem_dma_object *gem;
 	unsigned int alpha = DCU_LAYER_AB_NONE, bpp;
-	int index;
+	int index, idx;
 
-	if (!fb)
+	if (!drm_dev_enter(plane->dev, &idx))
 		return;
 
+	if (!fb)
+		goto out;
+
 	index = fsl_dcu_drm_plane_index(plane);
 	if (index < 0)
-		return;
+		goto out;
 
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
@@ -126,7 +136,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 		bpp = FSL_DCU_YUV422;
 		break;
 	default:
-		return;
+		goto out;
 	}
 
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 1),
@@ -162,6 +172,8 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 			     DCU_LAYER_PRE_SKIP(0));
 	}
 
+out:
+	drm_dev_exit(idx);
 	return;
 }
 
-- 
2.37.3

