Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0987E7031
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3EA10E8EC;
	Thu,  9 Nov 2023 17:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E316010E8EC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699550721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQsLMrBO0s8gsbhcurrkAKTlTUKc8bmHZW0Ex5lVbpk=;
 b=O/99XKW6UPPlRJFdA39uAFOLDNoDPnIKUn5IKpRZsYFFnuhGUkOgg0PDA4bOmhZ2tcK+pT
 B/KBBktJSscaKARbSyvq9LmIjXa7Lm71TDWXFbblZVmQVeHJfeLp7Lavc9HORjO7X832fX
 Um3ujoLyXPYOpDxzOpEW1wkuXaxgcl4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-UnsYbZebMImWqtwpdM67Dw-1; Thu, 09 Nov 2023 12:25:19 -0500
X-MC-Unique: UnsYbZebMImWqtwpdM67Dw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32d9751ca2cso564904f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 09:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699550718; x=1700155518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQsLMrBO0s8gsbhcurrkAKTlTUKc8bmHZW0Ex5lVbpk=;
 b=vsC/wzAnwkbk0qv2gB13Ijp4xKh5cJVW4d3QGEhXwnb+gq04zamgIHnrAczKAwfWle
 4U/ThYfGXGCcS5kiy9MGZmNrx/SVoVYNtkyQS+NGCVCFuh4dyQyRAX8y+x38zRMY3nOm
 aBMkUvOP6zuPGZRJESsFsyUIZfDUWGc7VXE/9Mk1SxeT0uTuJoKpsY8lheF/4u/tZ41I
 MkAexsbvkHrB0mkCnalFXiO6oC1j0JpBuYuZ4NloyTfdBWwWiwvvcvflGMn7Gs3SHcW2
 FqpPjiun1TGFHfTQV90qZtK8tfAgJQIt8q/GJuO/eamEmuyWYMwUznxa8LLCFoxrpKkL
 4LNA==
X-Gm-Message-State: AOJu0YyQTmeOyo+1CBbz3l63CpgJZ26tFz1m/A2nX/aOBdan9QU+Qjjh
 nwVTnE6NXX7R//Tedz1N9MqNAG8sifu7bfFSooftDXDzd7onIl6io/D90Qbqjx1w9fkkUE6mM3Z
 hO6s2v9vwuTdvXS46TsJuKVmkKyRL
X-Received: by 2002:a05:6000:1cb:b0:32f:7963:8493 with SMTP id
 t11-20020a05600001cb00b0032f79638493mr4461558wrx.37.1699550718114; 
 Thu, 09 Nov 2023 09:25:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD/Ij413ZeKujXk6kJlWHHEPZiWIxqmSIPmvd4/ZL4FLHzk3PoQZkslp1/W1fbI9IJfywcfQ==
X-Received: by 2002:a05:6000:1cb:b0:32f:7963:8493 with SMTP id
 t11-20020a05600001cb00b0032f79638493mr4461536wrx.37.1699550717778; 
 Thu, 09 Nov 2023 09:25:17 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d6e88000000b0032db430fb9bsm121425wrz.68.2023.11.09.09.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:25:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] drm/todo: Add entry about implementing buffer age for
 damage tracking
Date: Thu,  9 Nov 2023 18:24:40 +0100
Message-ID: <20231109172449.1599262-7-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109172449.1599262-1-javierm@redhat.com>
References: <20231109172449.1599262-1-javierm@redhat.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Erico Nunes <nunes.erico@gmail.com>
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
---

 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 03fe5d1247be..adaa154210a0 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -765,6 +765,26 @@ Contact: Hans de Goede
 
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

