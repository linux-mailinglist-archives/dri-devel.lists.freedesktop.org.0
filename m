Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB165F1DC4
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592410E66B;
	Sat,  1 Oct 2022 16:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E813410E668
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnX59dffWK1EQ9RPt7g3flEI99/gWclWQ2eDM1z8XdM=;
 b=gg6J/etSzXuyP5NJFmYSLgnVu7JsHnWG/Yj2YifQzpKsiMprrgC3efC2aG/NcMTD42XB0M
 shGBuXN28U/hen2nKhn5BM1dS+DuJ0Zu5r7llYlj/2ZQzv1jRdOwXWw036aHqD5IX0yQdE
 UF5Tj0FaNtrdUQIZ1OA8eX6qxB93BrA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-9XsbaJA9Mpu_UJq6KrdSJw-1; Sat, 01 Oct 2022 12:40:20 -0400
X-MC-Unique: 9XsbaJA9Mpu_UJq6KrdSJw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso5701504edc.18
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dnX59dffWK1EQ9RPt7g3flEI99/gWclWQ2eDM1z8XdM=;
 b=dQEkjUOFkb9S+grAx1fA2IiSPc2QHDR/kOhuuv4+xLynhDlUG9kkmvhF6V+kxkN/wK
 BMiCjxFQdUeGlTzLBzHXs77eLa2+32nqKVGktg/cEyYmF/6qIL8FKDZo86+FX2FZHKjq
 qPxhup8OKBJqz7AbZmeCnEJkvWM2XT9KHO9UWAScZxaNOB2NWW4F852cgHlzSzoJAzks
 g8kIfUOxkXTWYpKloF9dyQbAs/iJ+R5rZrgJ7U4VuGavcID7VANHOgYyhNbC0iiV7ry3
 dDBTyXqTRvHcq4oIXyXGXJAdJEfyww+MyuKSUiETj/U3J2bA+Dat0mo/lUfJdblWBH8b
 +gFw==
X-Gm-Message-State: ACrzQf10gG6gB5XXPLFMTvWYDb9l8b5hMlAqzDRXmcQ+EWuSgCrvz5Sc
 2VBtIa7ymv/vIF+PXe9ZleIUWDDqrxbP5o8s4NSw5cWGDmrfwyq95w2MB2ahFi9RCHNkT5NmKmc
 csoVjaiQ+HpBk06h8rH7MPnq7oQnU
X-Received: by 2002:a17:907:97cd:b0:787:ccc3:fde1 with SMTP id
 js13-20020a17090797cd00b00787ccc3fde1mr9121358ejc.334.1664642419224; 
 Sat, 01 Oct 2022 09:40:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55Xp3BW3rc7QOk4esgcgUFW3Z9EOPnOO6tbl7W/JvSQU5pKXlUjMPacZd1NQ3DBccPKxweZQ==
X-Received: by 2002:a17:907:97cd:b0:787:ccc3:fde1 with SMTP id
 js13-20020a17090797cd00b00787ccc3fde1mr9121349ejc.334.1664642419069; 
 Sat, 01 Oct 2022 09:40:19 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a1709060fd400b0078167cb4536sm2886785ejk.118.2022.10.01.09.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:40:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 8/9] drm/arm/malidp: drv: protect device
 resources after removal
Date: Sat,  1 Oct 2022 18:39:45 +0200
Message-Id: <20221001163946.534067-9-dakr@redhat.com>
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
 drivers/gpu/drm/arm/malidp_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index aedd30f5f451..8bb8e8d14461 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -234,9 +234,12 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
-	int i;
+	int i, idx;
 	bool fence_cookie = dma_fence_begin_signalling();
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	pm_runtime_get_sync(drm->dev);
 
 	/*
@@ -267,6 +270,8 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 	pm_runtime_put(drm->dev);
 
 	drm_atomic_helper_cleanup_planes(drm, state);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_mode_config_helper_funcs malidp_mode_config_helpers = {
-- 
2.37.3

