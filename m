Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9F5F1D0C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033B010E40B;
	Sat,  1 Oct 2022 14:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E18C10E5C9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuGypoVnJNhzQ829OSUgv+IQ/uot1AKSMTgWYQGrHy8=;
 b=RDWTtjoluaYFPWRekYrQlHvK5UB3V3HOcdgNQMV4VUPjN5tWPPnsYnsqfdWmCYQ4HAGITl
 4HzC9OMf3AD1zrWqF0deRAzlfkObl7fSBABIM6MGFOqcn5qB8rHNiWAoW3UrI1aJfxEiBm
 oSf0ISv42VTnbmWN6B3L+b2lbabiOi0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-yLv-o96jMWSLNaOyBd1Ndg-1; Sat, 01 Oct 2022 10:58:24 -0400
X-MC-Unique: yLv-o96jMWSLNaOyBd1Ndg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v11-20020a056402348b00b004516e0b7eedso5622400edc.8
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OuGypoVnJNhzQ829OSUgv+IQ/uot1AKSMTgWYQGrHy8=;
 b=deD/MCjbuwNl4/h0bKnrcuLmCh48MDPgAOfTFeEJbEPMvMB9eFDuSbAfJ7n0SCrNMX
 QOwzMoBVknTcp/3tPU0E99b3VsWlSLPMLTCxyfTdOJ9ZXA86nIjIxGvhwAHOkqMyxwjA
 sKi6UuLqZajnPN0WAHMXc1KNVI5hA6QCLox7xL7WCzvuOR3dQEDNJTIi68CN9wkSlSOk
 zAdbbFOeZts+F+AZjtZvuQSuC7qOKGZLNqRHsiWJVqh8tmx7uoNda7G2BAD1dL8nrfI9
 EE8xvomX/N9oQG6yn47OG4HybZBET6DjFoZII5Koj9/wIKChe0xdMk3hZYTk6lebdBAL
 iaeg==
X-Gm-Message-State: ACrzQf1Ir0WHBX/GR/iY0HmrpgtCmmGOFHZdcRocMye6exXxefcqUJOb
 OBlnKnde4bBPCO2yWrdG+MalzgRvg0I6Tv25W+kEZFpojsb8nSxI1x8uYoBsh60RBIrXN4vimu4
 e0ICGvCDZ6el6IyLZhAcMAH3Pk0l3
X-Received: by 2002:a17:907:75c6:b0:788:e57b:e809 with SMTP id
 jl6-20020a17090775c600b00788e57be809mr3735263ejc.381.1664636302381; 
 Sat, 01 Oct 2022 07:58:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6tYvJN/BoUijgGJpiQA9gruyLcr6e+s4NgjahO10nZI7Z+Sz0VARMJ4HyrIlczlfiZU4mzZw==
X-Received: by 2002:a17:907:75c6:b0:788:e57b:e809 with SMTP id
 jl6-20020a17090775c600b00788e57be809mr3735257ejc.381.1664636302172; 
 Sat, 01 Oct 2022 07:58:22 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a056402358800b0044dbecdcd29sm3761029edc.12.2022.10.01.07.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:21 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 4/9] drm/fsl-dcu: plane: use drm managed
 resources
Date: Sat,  1 Oct 2022 16:57:57 +0200
Message-Id: <20221001145802.515916-5-dakr@redhat.com>
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

Use drm managed resource allocation (drmm_universal_plane_alloc()) in
order to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c  |  4 ++--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 25 ++++++++-------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index 0b70624260fc..1dad90f701c8 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -176,8 +176,8 @@ int fsl_dcu_drm_crtc_create(struct fsl_dcu_drm_device *fsl_dev)
 	fsl_dcu_drm_init_planes(drm);
 
 	primary = fsl_dcu_drm_primary_create_plane(drm);
-	if (!primary)
-		return -ENOMEM;
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
 
 	ret = drmm_crtc_init_with_planes(drm, crtc, primary, NULL,
 					 &fsl_dcu_drm_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 91865956da02..23ff285da477 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -174,7 +174,6 @@ static const struct drm_plane_helper_funcs fsl_dcu_drm_plane_helper_funcs = {
 static const struct drm_plane_funcs fsl_dcu_drm_plane_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
-	.destroy = drm_plane_helper_destroy,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.reset = drm_atomic_helper_plane_reset,
 	.update_plane = drm_atomic_helper_update_plane,
@@ -206,24 +205,18 @@ void fsl_dcu_drm_init_planes(struct drm_device *dev)
 struct drm_plane *fsl_dcu_drm_primary_create_plane(struct drm_device *dev)
 {
 	struct drm_plane *primary;
-	int ret;
-
-	primary = kzalloc(sizeof(*primary), GFP_KERNEL);
-	if (!primary) {
-		DRM_DEBUG_KMS("Failed to allocate primary plane\n");
-		return NULL;
-	}
 
 	/* possible_crtc's will be filled in later by crtc_init */
-	ret = drm_universal_plane_init(dev, primary, 0,
-				       &fsl_dcu_drm_plane_funcs,
-				       fsl_dcu_drm_plane_formats,
-				       ARRAY_SIZE(fsl_dcu_drm_plane_formats),
-				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret) {
-		kfree(primary);
-		primary = NULL;
+	primary = drmm_universal_plane_alloc(dev, struct drm_plane, dev, 0,
+					     &fsl_dcu_drm_plane_funcs,
+					     fsl_dcu_drm_plane_formats,
+					     ARRAY_SIZE(fsl_dcu_drm_plane_formats),
+					     NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary)) {
+		DRM_DEBUG_KMS("Failed to create primary plane\n");
+		return primary;
 	}
+
 	drm_plane_helper_add(primary, &fsl_dcu_drm_plane_helper_funcs);
 
 	return primary;
-- 
2.37.3

