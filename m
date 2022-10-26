Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCF60E4DE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6666310E2DA;
	Wed, 26 Oct 2022 15:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3610E556
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666798491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3W/r9ElK7sh/SFf0M/t1SVrs5dFd+1CxEY7lkRSmLhk=;
 b=DRM6D9bvQ/XQguMygKSFRHa+u6MKl5u/onsCWjNIhl+ZVUZyWanX6OsxV7theh8ODxh2Mu
 WCgq+9NAYN0Kgo4Izf0ypvvlpLgB4VVQASQ3XfWLPxJEjJoCvAFur/A5YxFbMZb9w4KcM9
 ttrwLFAHSJ6PUol4DVqBtndwnKZ7dRo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-m8q1zUFmNP6Y_GeBwCqzqg-1; Wed, 26 Oct 2022 11:34:50 -0400
X-MC-Unique: m8q1zUFmNP6Y_GeBwCqzqg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr26-20020a1709073f9a00b007a20c586f1eso3738666ejc.20
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3W/r9ElK7sh/SFf0M/t1SVrs5dFd+1CxEY7lkRSmLhk=;
 b=UdaV2Ru4lLc+thYYTjT8uThDPNVEzE+tDqT395L66G7bUkkrxcdDS5xUGxugFNpcV0
 8DmaoTVNNyMLqOzy1wqyD/ZbonokOCezPVwbTFNKYt6Z3kqpf7c3DyGnxxfd25W0PqMm
 xZ0rkQTjcg4wvyjXw5ODPULRMlLQ0Rnd+aZqDQE4J53vWCg/WS3mcx79BqhjDEtDS2h4
 6lSSCvaHSsVyeLPEWgkciL6ZY/U5SyJgZzVCJlQGYuYl+NLMh40uPTdX/PEIrG1z3zze
 +UPfTxBctqzpRo3f3CrOeKCPTr3ih6yrSErHoXy3so97HfFdXqBOB0flXblGUayQVi+z
 +FNA==
X-Gm-Message-State: ACrzQf3R0hT3Jo8HeF17dlA4pNxHjpUAO5X8vdhG7UIg1oAcBME56a4+
 vkS2v/0XcqBQb6J45d8lmZUM5ADWflvd8zUO/9An++58g54+cFEmt9wxf4pIyuEO8lvGp4ffbHq
 JNebwK1N7txEcWT0EDnhrFF4rCEsx
X-Received: by 2002:a17:906:8a65:b0:7ad:88f8:7ecc with SMTP id
 hy5-20020a1709068a6500b007ad88f87eccmr205487ejc.535.1666798489134; 
 Wed, 26 Oct 2022 08:34:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7hZV+nzwBhtCJNCfdWd9aTbL+g+XhULTYvMLCYKRB9T7riygaPgFJlt+DyvtV2u2xPOacYiQ==
X-Received: by 2002:a17:906:8a65:b0:7ad:88f8:7ecc with SMTP id
 hy5-20020a1709068a6500b007ad88f87eccmr205472ejc.535.1666798489007; 
 Wed, 26 Oct 2022 08:34:49 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a056402051800b00459e3a3f3ddsm3684370edv.79.2022.10.26.08.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:34:48 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v4 3/4] drm/arm/hdlcd: plane: use drm managed
 resources
Date: Wed, 26 Oct 2022 17:34:30 +0200
Message-Id: <20221026153431.72033-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026153431.72033-1-dakr@redhat.com>
References: <20221026153431.72033-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/hdlcd_crtc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 2055b1abcec3..1de0f7b23766 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -290,7 +290,6 @@ static const struct drm_plane_helper_funcs hdlcd_plane_helper_funcs = {
 static const struct drm_plane_funcs hdlcd_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
@@ -301,21 +300,16 @@ static struct drm_plane *hdlcd_plane_init(struct drm_device *drm)
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	struct drm_plane *plane = NULL;
 	u32 formats[ARRAY_SIZE(supported_formats)], i;
-	int ret;
-
-	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
-	if (!plane)
-		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
 		formats[i] = supported_formats[i].fourcc;
 
-	ret = drm_universal_plane_init(drm, plane, 0xff, &hdlcd_plane_funcs,
-				       formats, ARRAY_SIZE(formats),
-				       NULL,
-				       DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret)
-		return ERR_PTR(ret);
+	plane = drmm_universal_plane_alloc(drm, struct drm_plane, dev, 0xff,
+					   &hdlcd_plane_funcs,
+					   formats, ARRAY_SIZE(formats),
+					   NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(plane))
+		return plane;
 
 	drm_plane_helper_add(plane, &hdlcd_plane_helper_funcs);
 	hdlcd->plane = plane;
-- 
2.37.3

