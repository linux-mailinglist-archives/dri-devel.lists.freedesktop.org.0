Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94365AD620
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC72210E853;
	Mon,  5 Sep 2022 15:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC6310E8A2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSUtWAzK0ahA+zp/L7/UclMHTS5yPU+3r+RqIP2CU10=;
 b=ErAfJEEyJtG9xWrjK4QNl1L5ArtjXorxjTN0F/Qns+FnZAsNPvPrmFcliUthi6b2cRtvys
 v83pbQmuVEZdtBqK1dJI0QMaLfAnJe/Bij2+JgfkOMnReKlo4G6KNQo2CGb2G0HA8tFCdO
 /1HGsk1SL7L0ZcVqhhbKsOlolDtcrSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-PZ3T3njsPAuFavaAyOTvEg-1; Mon, 05 Sep 2022 11:19:32 -0400
X-MC-Unique: PZ3T3njsPAuFavaAyOTvEg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f18-20020a05600c4e9200b003a5f81299caso5477003wmq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xSUtWAzK0ahA+zp/L7/UclMHTS5yPU+3r+RqIP2CU10=;
 b=i2MLizD3N5QOhWf6czF/1VTNiYwewluMPjZjH6cx6/TfzDyFhU/7Rj+lHdsHmSf5jj
 Bzcd5RqQrrzk/CzqAavUBIkd0+lgopOpiq3+x3mzamHNXzm2wrLrmzHPsFXjBmGkjz81
 urEF7jpfxriyzwJFoq1ghPrND7dTHcA80t9Jh+a1JRwPxNJ+0f0hgmxvWjzk1A5sprfF
 llTqZ6u8Tm1zMdt12VlH1W9vm0vDShzzp/TZDxpiIE4BLUZ2svC3Sq//YGg1PhCNI1Mq
 d7+/uZ8W9fXdbUuUIrMExiqUpoNx5vbE5SC3dZgNeJkM4y7oDcY8Jxe7KA/1Uad2zHyU
 A9Rg==
X-Gm-Message-State: ACgBeo2EGDsF4a0eBmtF0oCATe/X79sXKNmf68qYCOyP8uQddDgnzOQ5
 XUfDsGwTOiWl6WbkMWtWb3Y/sZvssCphdVOoDeQzJJG/NzrD7EnZkLp2B1vp1CCWnXqNH263a5G
 qAOfXuSJ+AOCPig0qMphZWXVNhTgR
X-Received: by 2002:a5d:48c7:0:b0:228:62d5:2818 with SMTP id
 p7-20020a5d48c7000000b0022862d52818mr5341886wrs.13.1662391171542; 
 Mon, 05 Sep 2022 08:19:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6KG28G6zxF6nBeebEbFNRpsDbrJRMcxpQj5CeuggUPfErxOJ+G3x3zAgSIgPxcSWg6+XzDqQ==
X-Received: by 2002:a5d:48c7:0:b0:228:62d5:2818 with SMTP id
 p7-20020a5d48c7000000b0022862d52818mr5341871wrs.13.1662391171390; 
 Mon, 05 Sep 2022 08:19:31 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a5d4532000000b00220592005edsm9227024wra.85.2022.09.05.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:31 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 6/8] drm/arm/malidp: plane: protect
 device resources after removal
Date: Mon,  5 Sep 2022 17:19:08 +0200
Message-Id: <20220905151910.98279-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/malidp_planes.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 34547edf1ee3..d2ea60549454 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -790,9 +790,12 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 	u16 pixel_alpha = new_state->pixel_blend_mode;
 	u8 plane_alpha = new_state->alpha >> 8;
 	u32 src_w, src_h, dest_w, dest_h, val;
-	int i;
+	int i, idx;
 	struct drm_framebuffer *fb = plane->state->fb;
 
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
+
 	mp = to_malidp_plane(plane);
 
 	/*
@@ -897,16 +900,24 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 
 	malidp_hw_write(mp->hwdev, val,
 			mp->layer->base + MALIDP_LAYER_CONTROL);
+
+	drm_dev_exit(idx);
 }
 
 static void malidp_de_plane_disable(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
 	struct malidp_plane *mp = to_malidp_plane(plane);
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	malidp_hw_clearbits(mp->hwdev,
 			    LAYER_ENABLE | LAYER_FLOWCFG(LAYER_FLOWCFG_MASK),
 			    mp->layer->base + MALIDP_LAYER_CONTROL);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_plane_helper_funcs malidp_de_plane_helper_funcs = {
-- 
2.37.2

