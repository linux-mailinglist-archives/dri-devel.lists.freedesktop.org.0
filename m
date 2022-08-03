Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8572E588EF7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 16:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F73F10EF8B;
	Wed,  3 Aug 2022 14:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B77110E7DD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659538529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=btnKjqAfvrYASatlMv3xFFZePE1Rwy613UtGW6tgQSI=;
 b=Fg32YRWn2jXQ7Y/9lyvDXamJEZIQ6TgZe78mpXWauuJpZuEQ+V3bvAnYQvzuGMqskXeL3a
 GcIsh0B1nbON14oJcYAU8KrK6fK2iiK3YnTbBFed3iX4VPIRnPksb0i0LEHGRb73VrsuQT
 Q9BmzT5apaW0ykqq5eKoOqX4L+IVeWI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-6u9SZGFBPP6DRlvGqx5xow-1; Wed, 03 Aug 2022 10:55:25 -0400
X-MC-Unique: 6u9SZGFBPP6DRlvGqx5xow-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb41-20020a170907962900b00730961131a7so2802766ejc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 07:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=btnKjqAfvrYASatlMv3xFFZePE1Rwy613UtGW6tgQSI=;
 b=Xm+ItyWN2lkqQXeDnrbNDCOOqYohq1Kmxei9Vpov9Cv7S8KX19PdVx2ROszZkksoLi
 BvcwqY3RVek9njGpaRAM2usq+oBbyqgu7TtPsNR72TxqGfJR/v1Qa4tiJoF/GyhfeLd4
 zyf5LV7DcCCI6ccJb7xchCD6mDV8SzZzd3XVmNcmnhVfX0NuckS397xhM2qtHUA8llxY
 jzsbtYA2xtfR2Di09khz7RBeaJXRKAvrrkOflrQl22rm6UsL0FF8OnvxXHy9kxH0sGZs
 tHBLllmGj2g8dgZqHAJygBIfy8MjPDnWeD5E6tDSwVN95j/RmSJ7UjNJPUJrE9tgIlo+
 X2JQ==
X-Gm-Message-State: ACgBeo3rCHC8XaaqS3NQYPTQl9R3ONVv7wGszvlUfZhYqrLpfDG8laxF
 9T9gPE3iw5ueld1lJcafXHndzSB+d4bhmRmMj4K3lCSufpoMUJElWND+dHivzCO+DS3Pxf3rtXH
 kOJ0MtGFm81OoB1gGZ79aWMDASoA4
X-Received: by 2002:a05:6402:5190:b0:43d:da02:566a with SMTP id
 q16-20020a056402519000b0043dda02566amr11104232edd.187.1659538523936; 
 Wed, 03 Aug 2022 07:55:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5s4zMhUjmOaivVKJvZlnxd4uVknAmV6FyDAlsR9bf/U30Fy3lBijhaCbHZBP38GENWJOfkYg==
X-Received: by 2002:a05:6402:5190:b0:43d:da02:566a with SMTP id
 q16-20020a056402519000b0043dda02566amr11104217edd.187.1659538523722; 
 Wed, 03 Aug 2022 07:55:23 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ee24-20020a056402291800b0043b7917b1a4sm9698411edb.43.2022.08.03.07.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 07:55:23 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com,
	sam@ravnborg.org
Subject: [PATCH] drm/virtio: remove drm_plane_cleanup() destroy hook
Date: Wed,  3 Aug 2022 16:55:20 +0200
Message-Id: <20220803145520.1143208-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.1
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

drmm_universal_plane_alloc() already registers drm_plane_cleanup() as
managed release action via drmm_add_action_or_reset(). Hence,
drm_plane_cleanup() should not be set as drm_plane_funcs.destroy hook.

Fixes: 7847628862a8 ("drm/virtio: plane: use drm managed resources")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index c599c99f228e..4c09e313bebc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -69,7 +69,6 @@ uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
 static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
-- 
2.37.1

