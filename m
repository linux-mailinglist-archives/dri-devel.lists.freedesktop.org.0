Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C575560E51E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06810E53C;
	Wed, 26 Oct 2022 16:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC45810E3A8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666799994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zds5b/EQDqkx7Pyf1ZJFBZj3XHxRFNCLAcjtw1LYg8w=;
 b=TUPBXG/fkwbaM+COw29yWLIciRQvYf7sa7zC0NB7LB84Ejy+ZhzYvVfMYNJ7bnJKrd0XCz
 yCg23J6n73tzWqzOgB36AbV+A/MSwCfPz+4faML5P5j0XhagOhCHmpk7kAfORUn2Mq8vtm
 dcosc8Z08ldafVg7bQ6ZsQL8+Pu2pvU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-Z6xGXlqUMIyAHX9xrJ4o1w-1; Wed, 26 Oct 2022 11:59:52 -0400
X-MC-Unique: Z6xGXlqUMIyAHX9xrJ4o1w-1
Received: by mail-ej1-f70.google.com with SMTP id
 sd8-20020a1709076e0800b007ac2e1693abso3146377ejc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zds5b/EQDqkx7Pyf1ZJFBZj3XHxRFNCLAcjtw1LYg8w=;
 b=PbHII8ZViAf5o5CKfrWLLa7iW0sU9vFj8vP0FqiWzYccE0rjYV+P4+JNwuWTxSVuI0
 Zw31J+5sMnDngUchiB8d5UsPhE3r3jhd7Nz5SJE3a8Tt81REN0q/LBIGkijAAJ6w2Kf2
 0YwYWgkAgpSTCyqVPLoHHQ7PqEFhs6Q0PkX4rM6Fb6nLmauViHtIRLmHtslrsTSL7MhK
 /XOHLnDboK09FqFFhWGzPU93KZYIG5z6pI06jDip4wbc4w3ReQB3Fidp/bZrwuUs7s/o
 6dZTW2ZDyGlz/tWFqcYXrJlRdf2IriMwWD3Nu9nT8M7EulpaViGZ/W+IIKrNxkR8etT8
 bcUg==
X-Gm-Message-State: ACrzQf3nBefFIqxZaPgi5JzSB38mw4+Q7+8czC1Iyd0qKnPNxi8THdI8
 6KxVBHf5fN7Y2TTWJKMBy4/Q7jotER2308znISgB8rH/FJhPKz40+RLvh9tSpWN+F75oXerDE0N
 zUxk1Ioxn5BMxBOw7JVplYiHn6oEy
X-Received: by 2002:a17:907:7f25:b0:7aa:acf9:c07e with SMTP id
 qf37-20020a1709077f2500b007aaacf9c07emr11861162ejc.280.1666799991737; 
 Wed, 26 Oct 2022 08:59:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WRefB+4uZiJzq4JmOLaBwL3ie2XJ4MVLpXX9v2tYlWPKvm20oby9JWTOy7syw9NVzzMm8tQ==
X-Received: by 2002:a17:907:7f25:b0:7aa:acf9:c07e with SMTP id
 qf37-20020a1709077f2500b007aaacf9c07emr11861142ejc.280.1666799991498; 
 Wed, 26 Oct 2022 08:59:51 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b8-20020aa7d488000000b00461a6997c5dsm3708285edr.83.2022.10.26.08.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:59:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 3/5] drm/arm/malidp: crtc: use
 drmm_crtc_init_with_planes()
Date: Wed, 26 Oct 2022 17:59:32 +0200
Message-Id: <20221026155934.125294-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026155934.125294-1-dakr@redhat.com>
References: <20221026155934.125294-1-dakr@redhat.com>
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

Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 34ad7e1cd2b8..dc01c43f6193 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -514,7 +514,6 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_funcs malidp_crtc_funcs = {
-	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = malidp_crtc_reset,
@@ -548,8 +547,8 @@ int malidp_crtc_init(struct drm_device *drm)
 		return -EINVAL;
 	}
 
-	ret = drm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL,
-					&malidp_crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL,
+					 &malidp_crtc_funcs, NULL);
 	if (ret)
 		return ret;
 
-- 
2.37.3

