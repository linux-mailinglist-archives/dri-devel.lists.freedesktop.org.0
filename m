Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A55F1DC0
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7575310E65F;
	Sat,  1 Oct 2022 16:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFF210E666
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4+Ptu+qDGFqb0SHVblFALZEdZlh0sqNqyuMfzJpFUM=;
 b=IU6qOcdsHc4sdS+PK/KsA2WMfvWvByxJpjJBQZ2bj7m18rFH+xghKWDEaqMQDJkVFXzl2M
 x6GAbMHGWpMV23/H6wfy+G10vTMkKx1h0ZX+O0vDtT14//dUMm6Iyw575bOiKfTk1Pywoq
 TCE7WgSwDWlMpIfPvFO8cp3R+sJXHjg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-mc5muNS7Oz22ei_H2nIdIg-1; Sat, 01 Oct 2022 12:40:14 -0400
X-MC-Unique: mc5muNS7Oz22ei_H2nIdIg-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz21-20020a0564021d5500b0045217702048so5685078edb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=X4+Ptu+qDGFqb0SHVblFALZEdZlh0sqNqyuMfzJpFUM=;
 b=R+Xuxwo6TRKxSnikCORYPKseCnOOwKG7jlOISBX6gJ9759OphyVc0Tc0wJNOd9GJHN
 Z5T2mLg3kSV2uxIWl66yY1X5+dO5BH7ZRyC+v9aMNVzHhU4u9W4AY2gdZqBwYFf9YGNG
 nzhPoNvJiXTn6lwHFbaye9w1+/2A8cieI8ZWy2V43IvVxBiDVuV0aiRBfxlVFgY2lxO0
 PFyZUTUK4fgrj6agSwql7TMHLdhJ6SdCii1+dpE0Q3nhTLp1CORXr3Cr6sGE1V570VE+
 Nq+texuPJSl+L4Ha2RcBZFNsDBsCUOy7yrEllW5DrQWzT7EJ0dnDa0JnzIhaBfey5o9k
 hD7Q==
X-Gm-Message-State: ACrzQf3fcSSqHDRaI3bqxgyVD9KZA4pFzCBUVCOhYpCiXgKUeGrQHI1i
 R4zXKlmdrzABzOnP7oEwYylDkjGIiUVCeIn+lE93iBuhNQQkc5dOvRGikz7AZdgnr7ERhYBqwwO
 bL3VUybGwe7/TJ4w0Lb+mivQnfUEo
X-Received: by 2002:a17:906:db02:b0:780:24e:cf9 with SMTP id
 xj2-20020a170906db0200b00780024e0cf9mr10115648ejb.460.1664642411750; 
 Sat, 01 Oct 2022 09:40:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sqRzShEvzcXK3sHQwN9XIDX9ReJ+nLvVhphfWZ1v1LAlyL8kh4A0p/0J+VR7oZU5jC9b3Sw==
X-Received: by 2002:a17:906:db02:b0:780:24e:cf9 with SMTP id
 xj2-20020a170906db0200b00780024e0cf9mr10115640ejb.460.1664642411595; 
 Sat, 01 Oct 2022 09:40:11 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a17090630d200b0073dd8e5a39fsm2888945ejb.156.2022.10.01.09.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:40:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 6/9] drm/arm/malidp: plane: protect device
 resources after removal
Date: Sat,  1 Oct 2022 18:39:43 +0200
Message-Id: <20221001163946.534067-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001163946.534067-1-dakr@redhat.com>
References: <20221001163946.534067-1-dakr@redhat.com>
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
2.37.3

