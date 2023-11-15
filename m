Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD87EC36E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225F210E554;
	Wed, 15 Nov 2023 13:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5610E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700054165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LPNZAc6r0CSSO6lMN8bwDAougMdgFH11dwZvW1JyD1g=;
 b=Qt7njRPfKbr36Z9bQFi6mkCg54Oje1peMIZov8cojk9CJHA7o8oVr/5ra6pZ2fG7FNCj+y
 Y5Ww49CMxaJgeijnmv/pZeqtGcxtHU5PLp8jf+H3FQIVoPu0QNiUzBSBP2n3WC78KrFr9p
 Gdyrrh65y0X+ZE9q92JviWEJ6eCOJgI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-56MJ3-m8Mvu-BdNT18EDmA-1; Wed, 15 Nov 2023 08:16:04 -0500
X-MC-Unique: 56MJ3-m8Mvu-BdNT18EDmA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32d9751ca2cso3205391f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700054163; x=1700658963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPNZAc6r0CSSO6lMN8bwDAougMdgFH11dwZvW1JyD1g=;
 b=Bz4GsjF3oGkyxMquRJvpTAaXyPTu3h15bfW+PzORBULdQihLv+PMwb27bVXe/3gGJA
 +bm/Bw9+lpI90ssQDyEALuQpc5YiFFwaaoHnTmeDBBTROpVoshniNPEnKPkpIQsvIieZ
 RXZ7URIiQJzVXIkbeJkU8cYQ3TkUcSCahOE4XXQy5urvKWN8OP9+BeQ3//ihNCHETeB0
 nKgsgLDVsOJb+5hOLuvguZ7GtZRgXX3d8ujh3k+T5BtEMdixpd7r6NpitdKKITXPhSsn
 0bltHhHukj+MEKZy87okkRwNJvuXzEaLHB5RDzP47gd4jMjOUvCsSybmkiD4FIOEUFWf
 OiSQ==
X-Gm-Message-State: AOJu0Ywkxpvmdv911lBlj5aHeUkstXsE8MQhrlSwS8g0RZ0bk5ahWlHS
 LhUXzcWu2+cpMOiSIJ/8Bm0TYib6RECInEvYVO3achDw2h77QF2SX9BAQLkxl2FzB6s6CtFEr2H
 PhzfFgdW0ExwcTLrSc/tfVGRCVWNL
X-Received: by 2002:a5d:6b8f:0:b0:331:4e5e:d9e7 with SMTP id
 n15-20020a5d6b8f000000b003314e5ed9e7mr5201126wrx.34.1700054163333; 
 Wed, 15 Nov 2023 05:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH90wwQXO1DSYdUi0fT0muUxSLgnxdRuPpEfFKAh1lwXIDvxopHNTDogbaEw6FCwpQCc2B74A==
X-Received: by 2002:a5d:6b8f:0:b0:331:4e5e:d9e7 with SMTP id
 n15-20020a5d6b8f000000b003314e5ed9e7mr5201118wrx.34.1700054163127; 
 Wed, 15 Nov 2023 05:16:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b1-20020a5d6341000000b00323293bd023sm10579306wrw.6.2023.11.15.05.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 05:16:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] drm/todo: Add entry about implementing buffer age for
 damage tracking
Date: Wed, 15 Nov 2023 14:15:44 +0100
Message-ID: <20231115131549.2191589-6-javierm@redhat.com>
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
---

(no changes since v1)

 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index b62c7fa0c2bc..5c43a958814b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -782,6 +782,26 @@ Contact: Hans de Goede
 
 Level: Advanced
 
+Buffer age or other damage accumulation algorithm for buffer damage handling
+============================================================================
+
+Drivers that do per-buffer uploads, need a buffer damage handling (rather than
+frame damage like drivers that do per-plane or per-CRTC uploads), but there is
+no support to get the buffer age or any other damage accumulation algorithm.
+
+For this reason, the damage helpers just fallback to a full plane update if the
+framebuffer attached to a plane has changed since the last page-flip.
+
+This should be improved to get damage tracking properly working on drivers that
+do per-buffer uploads.
+
+More information about damage tracking and references to learning materials in
+`Damage Tracking Properties <https://docs.kernel.org/gpu/drm-kms.html#damage-tracking-properties>`_
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Advanced
+
 Outside DRM
 ===========
 
-- 
2.41.0

