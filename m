Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCE599A6B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CEA10E91F;
	Fri, 19 Aug 2022 11:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF54C10E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660907338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnEk9MrA+hzYjtEm67vAGY8w0ZNE3V5OyctQYUJSNY0=;
 b=UZggyhZdfUdyoBhX6hWS4ZHmQt87O3pcKmu05J6cywnBJwhtzv+WWR+skyPEvri6SHTdRe
 zZPycFkNXeG6knie/PB03WrWRpsq2iiF7j78AzPRkY76ZEbpwgAxldBm1dklogaCpTUKzR
 sIiq6hzbRJAsIYUwPsBrqlP5YvrtUL0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-IaZCrKboPk2dYOp9hZWWig-1; Fri, 19 Aug 2022 07:08:57 -0400
X-MC-Unique: IaZCrKboPk2dYOp9hZWWig-1
Received: by mail-ed1-f71.google.com with SMTP id
 b6-20020a056402278600b0043e686058feso2643694ede.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 04:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bnEk9MrA+hzYjtEm67vAGY8w0ZNE3V5OyctQYUJSNY0=;
 b=OX10TYYAze0INbbo0WLvr7poChveLPyJLWI1fBOLQTGKdHEHp4o11pEe+SMJCJ4Ynx
 /6fuwGaETk5yGYYjcmaoJg3SNA59GxJo+l04jz5lFE3OpkLii6x7/t7fCch4QJn3X0Gg
 daLqWlQX0nFWDObCk0pJMY1Jz62bO0+Ww8Ouxcy5uroUsdR5WHr+W5KNmO1NMaoBCNiX
 tr9uxlm92TdDi5CImgtxnJfnImCBfr+u3Tkab1+XCMYWD9QqhCaWDRgtPUgaf/wbfw5M
 SVCxZy9llUGP73RGILxDzr6TGGPPZFXmaKhrOTQnbsFKSFwYAPgLEgtHrR36OQt9YfiF
 aRQg==
X-Gm-Message-State: ACgBeo0DMxqlGKys/Jy/nd3C8tbJsoDZk0JWP7jgWjZuSeplLXy0BqjU
 BfogmPkQGATSx87f/JUC0WcM42dsShpPGj7vODn1/XSfyOh1x+Q40JsAaKxgCYj7EDvM6plIRZ/
 S/V+5MAY92RR5rwg7v7YHIpNKJb7m
X-Received: by 2002:a17:907:9694:b0:73c:4e5c:fd33 with SMTP id
 hd20-20020a170907969400b0073c4e5cfd33mr3189986ejc.331.1660907336024; 
 Fri, 19 Aug 2022 04:08:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IFFav8FqlP0liaFDWjQPBAHizE1g8lUigMsowQvbddBjddRYveYE9uBswm+NtsueITuzvIQ==
X-Received: by 2002:a17:907:9694:b0:73c:4e5c:fd33 with SMTP id
 hd20-20020a170907969400b0073c4e5cfd33mr3189971ejc.331.1660907335876; 
 Fri, 19 Aug 2022 04:08:55 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709060cd100b007308fab3eb7sm2167827ejh.195.2022.08.19.04.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:08:55 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v2 2/4] drm/vc4: plane: protect device resources
 after removal
Date: Fri, 19 Aug 2022 13:08:47 +0200
Message-Id: <20220819110849.192037-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819110849.192037-1-dakr@redhat.com>
References: <20220819110849.192037-1-dakr@redhat.com>
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

However, the DRM device isn't freed as long as the last user closed it,
hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Fixes: 9872c7a31921 ("drm/vc4: plane: Switch to drmm_universal_plane_alloc()")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index eff9c63adfa7..c46acb770036 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -19,6 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -1219,6 +1220,10 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
 	int i;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		goto out;
 
 	vc4_state->hw_dlist = dlist;
 
@@ -1226,6 +1231,9 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 	for (i = 0; i < vc4_state->dlist_count; i++)
 		writel(vc4_state->dlist[i], &dlist[i]);
 
+	drm_dev_exit(idx);
+
+out:
 	return vc4_state->dlist_count;
 }
 
@@ -1245,6 +1253,7 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
 	struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
 	uint32_t addr;
+	int idx;
 
 	/* We're skipping the address adjustment for negative origin,
 	 * because this is only called on the primary plane.
@@ -1252,12 +1261,17 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	WARN_ON_ONCE(plane->state->crtc_x < 0 || plane->state->crtc_y < 0);
 	addr = bo->dma_addr + fb->offsets[0];
 
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
+
 	/* Write the new address into the hardware immediately.  The
 	 * scanout will start from this address as soon as the FIFO
 	 * needs to refill with pixels.
 	 */
 	writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
 
+	drm_dev_exit(idx);
+
 	/* Also update the CPU-side dlist copy, so that any later
 	 * atomic updates that don't do a new modeset on our plane
 	 * also use our updated address.
@@ -1271,6 +1285,10 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct vc4_plane_state *vc4_state, *new_vc4_state;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	swap(plane->state->fb, new_plane_state->fb);
 	plane->state->crtc_x = new_plane_state->crtc_x;
@@ -1333,6 +1351,8 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	       &vc4_state->hw_dlist[vc4_state->pos2_offset]);
 	writel(vc4_state->dlist[vc4_state->ptr0_offset],
 	       &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
+
+	drm_dev_exit(idx);
 }
 
 static int vc4_plane_atomic_async_check(struct drm_plane *plane,
-- 
2.37.2

