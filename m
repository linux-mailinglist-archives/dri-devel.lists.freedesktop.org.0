Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1C7F68EA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 23:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015E710E361;
	Thu, 23 Nov 2023 22:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012BA10E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 22:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700777610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MuULYoz5ao+rLNA+YbUecP2cAJXv6WyavKrHjMaHS4=;
 b=Lw069V045Q40ZCCCf0olSpqv/078aPMnmerNylcMSLroA5fjVB1Yv8n3FtHY653WvI+Lhd
 rVksgz41qNMWKc9Y40PpcIaxHrRv6Zn3xohHB3FLpjMTfqYPHwWfHZNJu/ald3xGJMs0dV
 9WZ/Evhp96TssYQsFjFhHGuIi3QT890=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-0ZzLWPzVMTGbIPEn8zFcrQ-1; Thu, 23 Nov 2023 17:13:28 -0500
X-MC-Unique: 0ZzLWPzVMTGbIPEn8zFcrQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-332e2e0b98bso640084f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700777607; x=1701382407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7MuULYoz5ao+rLNA+YbUecP2cAJXv6WyavKrHjMaHS4=;
 b=iC5uTCKnVlQn6dhG5/e9f5A9wcxXxQ+SeTtwybWgRnYkkA+39R6GLVWnBCHkWlxb5r
 nRM/gwNb+Ei3S42Cd2BoNxAiloWyJ9DYFC0iHH460A7arlWh8PP4zUvMAx1yBb/ZqixK
 dEPr7qbcnkO1X7XEdTTu2Hu8sJ2nsWkByL56b0BVuiuZ6C4Z7aqby6g5wRT5zUP3+5qR
 YMwa4xtMzzK2UkP3GHitKNttJ00ZBcDFW1JZMNNTZ+WEP5yVwkO27mq4Vfe6COrgCplN
 C3w+LptRDdKqObpy0jMxxe8rcIrhzcWqF+Piiq7Dyq9OO5ebcjplrTw9bHJ8Q4Wjx6Yl
 NdiQ==
X-Gm-Message-State: AOJu0YwgWorvpV/bGNxtEdzW8HpegGbehHWVbMjzoxD7u8ni5UvAu7Cg
 CXGPtJM/5QPeT1iAqlfMTpbeubK/QrDzEKVPdPK9V9eHlJUKKMXdPH/MTP4iLNwYj3kywLzdq8/
 7T3W4rKHXePyYwX/FKKnVpGJImwUP
X-Received: by 2002:a5d:40c8:0:b0:332:e777:a8d4 with SMTP id
 b8-20020a5d40c8000000b00332e777a8d4mr565983wrq.36.1700777607605; 
 Thu, 23 Nov 2023 14:13:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbblMAN+hzDoQaplfSW1Ls9XUsnDbl4YuadfKrIq6lj50fMHkQHToWy2rbRvbEJLq7TAFUoA==
X-Received: by 2002:a5d:40c8:0:b0:332:e777:a8d4 with SMTP id
 b8-20020a5d40c8000000b00332e777a8d4mr565964wrq.36.1700777607350; 
 Thu, 23 Nov 2023 14:13:27 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d5107000000b00332c6a52040sm2681153wrt.100.2023.11.23.14.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 14:13:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] drm/todo: Add entry about implementing buffer age for
 damage tracking
Date: Thu, 23 Nov 2023 23:13:04 +0100
Message-ID: <20231123221315.3579454-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123221315.3579454-1-javierm@redhat.com>
References: <20231123221315.3579454-1-javierm@redhat.com>
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
 Jonathan Corbet <corbet@lwn.net>, Bilal Elmoussaoui <belmouss@redhat.com>,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, only damage tracking for frame damage is supported. If a driver
needs to do buffer damage (e.g: the framebuffer attached to plane's state
has changed since the last page-flip), the damage helpers just fallback to
a full plane update.

Add en entry in the TODO about implementing buffer age or any other damage
accumulation algorithm for buffer damage handling.

Suggested-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Sima Vetter <daniel.vetter@ffwll.ch>
---

Changes in v4:
- Reference the &drm_plane_state.ignore_damage_clips and the damage helpers
  in the buffer damage TODO entry (Sima Vetter).

 Documentation/gpu/todo.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index b62c7fa0c2bc..503d57c75215 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -782,6 +782,29 @@ Contact: Hans de Goede
 
 Level: Advanced
 
+Buffer age or other damage accumulation algorithm for buffer damage
+===================================================================
+
+Drivers that do per-buffer uploads, need a buffer damage handling (rather than
+frame damage like drivers that do per-plane or per-CRTC uploads), but there is
+no support to get the buffer age or any other damage accumulation algorithm.
+
+For this reason, the damage helpers just fallback to a full plane update if the
+framebuffer attached to a plane has changed since the last page-flip. Drivers
+set &drm_plane_state.ignore_damage_clips to true as indication to
+drm_atomic_helper_damage_iter_init() and drm_atomic_helper_damage_iter_next()
+helpers that the damage clips should be ignored.
+
+This should be improved to get damage tracking properly working on drivers that
+do per-buffer uploads.
+
+More information about damage tracking and references to learning materials can
+be found in :ref:`damage_tracking_properties`.
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Advanced
+
 Outside DRM
 ===========
 
-- 
2.41.0

