Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A8A59A79F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 23:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D940C10E6D3;
	Fri, 19 Aug 2022 21:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD3410E485
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSUtWAzK0ahA+zp/L7/UclMHTS5yPU+3r+RqIP2CU10=;
 b=UfFksivwZiNIZHt5OWJ3WOakYkDz+QfRK63Y4MmEZNaUNEqFvx4K5PMA//a77lZtA7ISHY
 r3/p6/YMS+j0If3XXu6FYJtTi9yEBb6D2L+hM9yo/E9BZn+nyDwj6KSK1aiGFpDTPBcjgO
 kf2z9V1fYg+vuNP2+P2PhTLWCXU5xqE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-rLHdpjx9MCKngVbiGsGbfA-1; Fri, 19 Aug 2022 17:24:54 -0400
X-MC-Unique: rLHdpjx9MCKngVbiGsGbfA-1
Received: by mail-ed1-f69.google.com with SMTP id
 i5-20020a05640242c500b0043e50334109so3358408edc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xSUtWAzK0ahA+zp/L7/UclMHTS5yPU+3r+RqIP2CU10=;
 b=XI/DvWoXRxcbX2AwrjSV062coBXTPwhl0fkrAUoUSuvSAAFNToUM1cufw3kQgneWqH
 63JZpZ/5YuiNX5NidfDKgDgGCYu9CEr2PbuumIMx8hy5kYZFh0fAzid6wbgb7wV86SFa
 dp6h7PV1TD/MrE01BelBAhcWk6nuKadtaOULxbP8n+RFB9KziqT+6EVLANyVoDzNm2cy
 TtIs/Cn58XSe/cQk2fluV7SVtdcbxexDNnA2bt+LJBujs6deohby3lsV3bOOxkZgV3+r
 bSsYYtER0jKyFPGKWxuUoGF+xWbrXwlCkga5Ln5dghQ0xHdHI9QL/W2mXbzzXGi7bcPS
 Fbzg==
X-Gm-Message-State: ACgBeo0ejeQY62s+fgTgU1Qolt7VtURVHG7+nibXyQ3cPqD9/cKtN1Ty
 au/wOw3PdEC83RqOOCEXqFqJLqFIMor5o01BjJDxSS0+lW0FxvYGo3rCHO8rwTQGZaFonVMIrZl
 YRfw3isc9kd42WDLTNZlretDCVBJk
X-Received: by 2002:a17:907:2c64:b0:730:defe:a419 with SMTP id
 ib4-20020a1709072c6400b00730defea419mr5801922ejc.680.1660944292904; 
 Fri, 19 Aug 2022 14:24:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6oYyJVdeZhoxUxsoyFexqgp6rNALbs/+7bSlswTqyu+9Ql2HoaivzZUuTjOC23Kgx1o/fEZg==
X-Received: by 2002:a17:907:2c64:b0:730:defe:a419 with SMTP id
 ib4-20020a1709072c6400b00730defea419mr5801915ejc.680.1660944292766; 
 Fri, 19 Aug 2022 14:24:52 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a170906579500b0072fa24c2ecbsm2842999ejq.94.2022.08.19.14.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:24:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 6/8] drm/arm/malidp: plane: protect device
 resources after removal
Date: Fri, 19 Aug 2022 23:24:43 +0200
Message-Id: <20220819212445.559790-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819212015.556220-1-dakr@redhat.com>
References: <20220819212015.556220-1-dakr@redhat.com>
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

