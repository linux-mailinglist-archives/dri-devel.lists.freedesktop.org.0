Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC65F1DBB
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7E210E662;
	Sat,  1 Oct 2022 16:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CA910E65F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zds5b/EQDqkx7Pyf1ZJFBZj3XHxRFNCLAcjtw1LYg8w=;
 b=ZOqsHv9k2SV2uOYRiK4KlKt660PmDG2NQLOU8XizLUrlNwur0VaTePxiG7Q+6WV3PCezZC
 rq4eUFIakPYGP05naVEKVRWZzWilXIN8Vw0eZvi1yHqbNH8EsXhy/ACNiJ4wTQRbMg7qmT
 f/6NiAtefNrk1bFkTdal+ekdiHna1N8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-B-PSix-KMjWdBz6QK0o7lw-1; Sat, 01 Oct 2022 12:40:01 -0400
X-MC-Unique: B-PSix-KMjWdBz6QK0o7lw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z9-20020a05640240c900b00458dae4ed9cso94560edb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zds5b/EQDqkx7Pyf1ZJFBZj3XHxRFNCLAcjtw1LYg8w=;
 b=lLg+XMH3L5+3uV2THZIH/55ZegCpILNHRLFN8xn+gp+BgNrQHGil1SOmN1CmBE7jfR
 CtrozNqa4EpYfwmOh26CguZbUhsqUPkTyBaKMrpCoYbbd/tcabj1C9J9imZkSRx0WbCi
 DB8SOUs97fi4sklnFNVfqRIWE8PMY6UmoPU7RLA8PUWIZpqnfubXJOYw8ivX5jjIiTCq
 fCaPrDHiINDJH2DUGSHRiKzYzqTZlsf9s4fJ+da0/P8Hl33HMzc4qNvyrus9Yn8UfZBr
 IBMYLWwlUVHXbBaAT10eJ5gLgHfGMhshm3K4uiONHIpAoR83KSwpBMZskR7sZR4QGg4I
 nDrg==
X-Gm-Message-State: ACrzQf1YVdwEJPkWn1Ellb5AbExbBADk+RChgpgAfVu+NsHoQg58UByc
 6jJjLpigaEuoBmOLgWtu3l4GnndbxXUR0zpGBCRL/vGHj1zuznYHM6WGcYeSqryBca3sISoxXHa
 SdBa/p9rTwrYQN6hmz0yuTAD+STK1
X-Received: by 2002:a05:6402:90c:b0:457:b5ce:5f18 with SMTP id
 g12-20020a056402090c00b00457b5ce5f18mr12517590edz.309.1664642400682; 
 Sat, 01 Oct 2022 09:40:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oFsJ5/vkjCjrOH42LhRQl7FKzQpDN5xpPB29HBBbAof6bb+X69T6LRMlsEyBBdMK9vS++Ng==
X-Received: by 2002:a05:6402:90c:b0:457:b5ce:5f18 with SMTP id
 g12-20020a056402090c00b00457b5ce5f18mr12517575edz.309.1664642400495; 
 Sat, 01 Oct 2022 09:40:00 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 bi6-20020a170906a24600b00782cd82db09sm2923342ejb.106.2022.10.01.09.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:40:00 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 3/9] drm/arm/malidp: crtc: use
 drmm_crtc_init_with_planes()
Date: Sat,  1 Oct 2022 18:39:40 +0200
Message-Id: <20221001163946.534067-4-dakr@redhat.com>
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

