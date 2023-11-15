Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1F7EC36C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AE810E0E6;
	Wed, 15 Nov 2023 13:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76BA10E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700054164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJqsY2/QsCenwJh5W290HFz55lPASu6G1HsKVTRTOh0=;
 b=iNqUGwk6ovhPI9j3S81idxU3y9mYxur8EyhSiJw7er3PlElH11MJD9a5st3oKN3D/6mlwW
 uKuOmFyXMTYACTFQ5HmeRKTAsHXBnjJTgInCxMp8Z9lmU6SwSqxe2/5LpWMQAGlku0RnBY
 nqXiv4Pq2WXp0IN2zo5dykJhKrqi83M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-E8yKVtlBNpKgnNyIQi6Ajw-1; Wed, 15 Nov 2023 08:16:02 -0500
X-MC-Unique: E8yKVtlBNpKgnNyIQi6Ajw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4083fec2c30so43727955e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700054161; x=1700658961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJqsY2/QsCenwJh5W290HFz55lPASu6G1HsKVTRTOh0=;
 b=apPA6nqlBn1J9SdkRLqywdBvyo241Qoqp7gArCBTP67K60e3uSPEr4QlKcmacFDJ1n
 2DACF/Sgz0HDRGUQXovzQutj+ZhzsBZoVPykjvLXAOK3r06Gr904tXdBCS62nS1Torgk
 mbJEpBE6qPdXXCQl1StHYrffyrSTGXm6UP5OUdWS72DcXlK+JlfRMLxD5WtqK9NyxXEL
 A0aDBQcnYqPvaomLRH5dDaqou7LKY/jsAdYk5KhFI1EFTcMss95FTMHxtIPr5wfqXS2i
 2wiwd0Zv6pWR4KoBPzIxBrYiqKvzoF/lRxZa6SSmjdySMRIX115jZJz/cfI+TTXAmEiu
 CnpA==
X-Gm-Message-State: AOJu0Yzup6yKqzvxYRUZ/UVVCspzVuLCE+9YbyIMytgSvzHps1cUCFz9
 h+GiCG1Klx8kIyyQm/RVpNXC9iW3cgjLoofmjwnGv20h8mZc+Mo5rHOWAcchf9DA1JMv6nhoEd8
 VlNJ/shEdiHtjUpRjK+XyjXodqEez
X-Received: by 2002:a05:600c:4fd2:b0:408:434c:dae7 with SMTP id
 o18-20020a05600c4fd200b00408434cdae7mr11319523wmq.2.1700054161291; 
 Wed, 15 Nov 2023 05:16:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeDdWdtJ7aB4xucaGXBN4YZIdjMA0MwwhEfRrMy5dCuiFqOT3NDoUGtQljuQes2A4j3nnCww==
X-Received: by 2002:a05:600c:4fd2:b0:408:434c:dae7 with SMTP id
 o18-20020a05600c4fd200b00408434cdae7mr11319502wmq.2.1700054161047; 
 Wed, 15 Nov 2023 05:16:01 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b00405959bbf4fsm15025163wmp.19.2023.11.15.05.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 05:16:00 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
Date: Wed, 15 Nov 2023 14:15:43 +0100
Message-ID: <20231115131549.2191589-5-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115131549.2191589-1-javierm@redhat.com>
References: <20231115131549.2191589-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "Damage Tracking Properties" section in the documentation doesn't have
info about the two type of damage handling: frame damage vs buffer damage.

Add it to the section and mention that helpers only support frame damage,
and how drivers handling buffer damage can indicate that the damage clips
should be ignored.

Also add references to further documentation about the two damage types.

Suggested-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
- Dropped Simon Ser's Reviwed-by tag because the text changed to adapt
  to the approach Thomas Zimmermann suggested for v2.

(no changes since v1)

 drivers/gpu/drm/drm_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..3b1b8bca3065 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1442,6 +1442,26 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
  * Drivers implementing damage can use drm_atomic_helper_damage_iter_init() and
  * drm_atomic_helper_damage_iter_next() helper iterator function to get damage
  * rectangles clipped to &drm_plane_state.src.
+ *
+ * Note that there are two types of damage handling: frame damage and buffer
+ * damage. The type of damage handling implemented depends on a driver's upload
+ * target. Drivers implementing a per-plane or per-CRTC upload target need to
+ * handle frame damage while drivers implementing a per-buffer upload target
+ * need to handle buffer damage.
+ *
+ * The existing damage helpers only support the frame damage type, there is no
+ * buffer age support or similar damage accumulation algorithm implemented yet.
+ *
+ * Only drivers handling frame damage can use the mentiored damage helpers to
+ * iterate over the damaged regions. Drivers that handle buffer damage, need to
+ * set &struct drm_plane_state.ignore_damage_clips as an indication to
+ * drm_atomic_helper_damage_iter_init() that the damage clips should be ignored.
+ * In that case, the returned damage rectangle is the &drm_plane_state.src since
+ * a full plane update should happen.
+ *
+ * For more information about the two type of damage, see:
+ *     https://registry.khronos.org/EGL/extensions/KHR/EGL_KHR_swap_buffers_with_damage.txt
+ *     https://emersion.fr/blog/2019/intro-to-damage-tracking/
  */
 
 /**
-- 
2.41.0

