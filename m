Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15205F1844
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AC010EDF9;
	Sat,  1 Oct 2022 01:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E861110EDF8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664587162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NFp4VgvnrWlpf0cR1jJD5RUagyd6mZ8BYx1FSeEHWg=;
 b=HjLcwA5kDeYRRwkwpqMbREEgV11ngXiv3p2I0ZMEvOkkbc6bgb29qSp/uRjPdV8cp7oyth
 homz4zRz89pSqfXiORPfKAa0oYS4TsvpyRtdS+qs+JtGm/cfxgcME8T7KyhEB+1ApvKMw7
 zT2BGkwowtSjIN+ENLd+BBnkmByAfxQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-s_AtS4EhOM-UGTYZKOiHUQ-1; Fri, 30 Sep 2022 21:19:21 -0400
X-MC-Unique: s_AtS4EhOM-UGTYZKOiHUQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso4607658edc.18
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3NFp4VgvnrWlpf0cR1jJD5RUagyd6mZ8BYx1FSeEHWg=;
 b=YbOTphouMhvhoTdyurtUKbCSLPh7Am2YBtXhTXi0rkMesVF6zc6WE1MlNsmMU9uUdn
 dBilG9C/fnIvwAK4deblFHjL+NS5fy90yGtmvt/bQNv5RS5cPq+f4BLFz9o+b5F8wWyw
 0LfvPFSeiqrTiPm6CIb6h8f5I0QG76SPP/1SZnz7I5fi0IW14b1G1o3DjvWUCEUWr9EF
 rpzYnpsYUG0fIwP6ddrWV/Zk8wYueQw5qIaOe9GBE1dDwgmhRqplLn9+TdWOMrc1om3s
 IAFNXlhXtq2pZwOnluXgFJIRK61SMu1qG+Dqm3aaY/uoGOEBYP4CZCoZwwo+gSQWQ0Ft
 /olg==
X-Gm-Message-State: ACrzQf1NJGQsH8ycoKcy5GarCjgRtQ5baXCvkmOuxFDlFRPvMiMFtgUi
 RagntwpY+r1iDaenQUqhVvSECzfBBDjpV6wO9nwQN+stTPSAjzZ35ChOZajlp8dSnUUsHBLDlAN
 tgjOml/2upDgm8CnR0iGYjETSbvHo
X-Received: by 2002:a17:907:9812:b0:781:bbff:1d20 with SMTP id
 ji18-20020a170907981200b00781bbff1d20mr8193515ejc.33.1664587160117; 
 Fri, 30 Sep 2022 18:19:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CQSQnjdvUmSQnJbZMdXRbmz2WBI2YEXp3z+zGa5bI24ZgAEiRi9g+ipz6Q5+W+HezYugKOw==
X-Received: by 2002:a17:907:9812:b0:781:bbff:1d20 with SMTP id
 ji18-20020a170907981200b00781bbff1d20mr8193507ejc.33.1664587159964; 
 Fri, 30 Sep 2022 18:19:19 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 rk14-20020a170907214e00b0078238c1c182sm1870090ejb.222.2022.09.30.18.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 18:19:19 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 3/7] drm/arm/hdlcd: plane: use drm managed
 resources
Date: Sat,  1 Oct 2022 03:19:01 +0200
Message-Id: <20221001011905.433408-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001011905.433408-1-dakr@redhat.com>
References: <20221001011905.433408-1-dakr@redhat.com>
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
index 4a8959d0b2a6..1de0f7b23766 100644
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
@@ -298,24 +297,19 @@ static const struct drm_plane_funcs hdlcd_plane_funcs = {
 
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
2.37.3

