Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811C15AD657
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795C910EA47;
	Mon,  5 Sep 2022 15:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C4310EA44
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEM+8qA1l934tBlwuTsd8qBaVhltlHSYDFpUMi13koI=;
 b=Zj+un6D/xc3HOI0QjcuAEn3gSqGK9mivVOY6lmGf97Jjawrr4UcT/feqMJdAAOm5lucxF1
 bqbTRmHH6oMVbUQdX/Wd78XmrUFKqpQdFpzzF4dmkB5z1/jGOk1SEwjXxu7UEzOfJ1voOE
 XPX0b5KtQhR4Y47tj+l3jcSnFG8j6RI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-d5YHdsuGNIeQh5iv7KWGIQ-1; Mon, 05 Sep 2022 11:27:37 -0400
X-MC-Unique: d5YHdsuGNIeQh5iv7KWGIQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 jg40-20020a170907972800b0074148cdc7baso2446781ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NEM+8qA1l934tBlwuTsd8qBaVhltlHSYDFpUMi13koI=;
 b=lpgQ+P28BsLvev0lOaQlMuA7OG2m2vHcKPUwzJXwdSbowuWyG10rAmvXtlg59fFRhF
 iKFpSlL7+XkC1ULddVI0Y9kRiKEd/7j+vCVJFhwZcw+xqz1OJCMhOKT5Jp3jB+KtlOWu
 cTGcywMcnWZ3gINu6eNEhMitz53P6p45LLfak2dmHRwuFoILNR5EsH4F78ytYSRl2HB0
 /gw7rbaP+x9W6ZC4sYKZaoDl9ND/pUOq9DDx0J7iVIhmgCjL7CvCZn0EZEL00idnYYYg
 +bxllvPT3qBojy4lIUbM4FuMlpy6OcG9t8U8KS+J6trSyi567CH7yL69k1Mib/1G5Qe9
 LRTA==
X-Gm-Message-State: ACgBeo1V2kyn4NM7EXVHmTedrm0RG2qiidhWX7kkeWpBNRXxMFlbVsul
 U35Sp7R2E7c8UwEMivMflpGjnMtklTZIRq352jggWTK3VD6GEhHggk3k0tLQKKGT6wVYja+6rNc
 s5KTM0qVWcQLfFsFLog6tdWciEJcF
X-Received: by 2002:a17:907:2bce:b0:73d:dd00:9ced with SMTP id
 gv14-20020a1709072bce00b0073ddd009cedmr33121654ejc.739.1662391656689; 
 Mon, 05 Sep 2022 08:27:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ZkK+8F2F9/wkZzegh9qRMurglKs44lIEA7p306fDAZ+htrVC8A6RHorF7fdbKZuptgiaRlA==
X-Received: by 2002:a17:907:2bce:b0:73d:dd00:9ced with SMTP id
 gv14-20020a1709072bce00b0073ddd009cedmr33121642ejc.739.1662391656544; 
 Mon, 05 Sep 2022 08:27:36 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 kw19-20020a170907771300b0073c5192cba6sm5175398ejc.114.2022.09.05.08.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:27:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 4/7] drm/arm/hdlcd: plane: use drm
 managed resources
Date: Mon,  5 Sep 2022 17:27:16 +0200
Message-Id: <20220905152719.128539-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905152719.128539-1-dakr@redhat.com>
References: <20220905152719.128539-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/hdlcd_crtc.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index c0a5ca7f578a..17d3ccf12245 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -289,7 +289,6 @@ static const struct drm_plane_helper_funcs hdlcd_plane_helper_funcs = {
 static const struct drm_plane_funcs hdlcd_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
@@ -297,24 +296,19 @@ static const struct drm_plane_funcs hdlcd_plane_funcs = {
 
 static struct drm_plane *hdlcd_plane_init(struct drm_device *drm)
 {
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
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
2.37.2

