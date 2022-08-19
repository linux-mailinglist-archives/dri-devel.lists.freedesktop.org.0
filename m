Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5859A911
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2310EE0C;
	Fri, 19 Aug 2022 23:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C5910E2A8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEM+8qA1l934tBlwuTsd8qBaVhltlHSYDFpUMi13koI=;
 b=iYHmoAkb5J55xsl5qCm8HSDA7lpg5xBB78ANEy2x+7AJBh1cS0xAFZdYo+hC1h6ik25Ze4
 oKrAtBZAr8975PD2x8j6wuomIrP/urlR2vMWQqv8cFGXuda1rzb4f4huzj6riKEAc9EmND
 l0MxnXL9PN99csbv4FOPonenHKqXpPc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-hBiLaaiXPeWnavmRkKNTSQ-1; Fri, 19 Aug 2022 19:11:13 -0400
X-MC-Unique: hBiLaaiXPeWnavmRkKNTSQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne41-20020a1709077ba900b00730cde40757so1981258ejc.23
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=NEM+8qA1l934tBlwuTsd8qBaVhltlHSYDFpUMi13koI=;
 b=rkHEiHiAGDGy6BVVxPabwk9c6KNf+tg4IpnRXeAhOwK4R4MaeewMO4MvuI3t2xg7uF
 lvdYWVi+JYnFDMOkHK8IwxPl+P54fl2ErcZTLpYD+0Vjz0uPDLmrs1Ah5UJRXQJ/TsSd
 7IvnOnA5nmgn8aB1dkJPQcUKSTNrNn54UKDZ5WEeIgAYQQdw++xVd0w8lAZkGERwsS+K
 vIcoa94Ipxx3Mk7X5/mWRVemhSIQOBPv6AZ0K3S5irXqsl2dMvdOtm1w+zW/RKQU/J6C
 6gH41mc07MddB7ZOHT1kYC66ldMzBVFqhu8ixdZqsEtdnOaXHfhRj9mJetUm9Oo7wQg+
 NwNw==
X-Gm-Message-State: ACgBeo3vt8zAiJqtbH86qgZnKH5mcweY/+t9uKsW1ICxx0NynRvBwhcX
 AhfLmg/S4R8GmqtSNpLTYLsX8LZddK4+wLzZIAzrpB68eK1CyHEFjAK7DZZRt28CugIGvguAsL6
 0MUSrr3rHrEE+9mQm/NjgiLRN85vQ
X-Received: by 2002:a17:907:2cc8:b0:731:53a3:4a33 with SMTP id
 hg8-20020a1709072cc800b0073153a34a33mr6108586ejc.319.1660950672267; 
 Fri, 19 Aug 2022 16:11:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6GbQdWDrH/DBv3IsFTvk98vTg0mBEa1EE3Vrq8PDQzt77Aq61RsfVlf+iGoDPMkaLpdChNgg==
X-Received: by 2002:a17:907:2cc8:b0:731:53a3:4a33 with SMTP id
 hg8-20020a1709072cc800b0073153a34a33mr6108579ejc.319.1660950672150; 
 Fri, 19 Aug 2022 16:11:12 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 da7-20020a056402176700b0043a61f6c389sm3761651edb.4.2022.08.19.16.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 4/7] drm/arm/hdlcd: plane: use drm managed
 resources
Date: Sat, 20 Aug 2022 01:10:55 +0200
Message-Id: <20220819231058.647658-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819231058.647658-1-dakr@redhat.com>
References: <20220819231058.647658-1-dakr@redhat.com>
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

