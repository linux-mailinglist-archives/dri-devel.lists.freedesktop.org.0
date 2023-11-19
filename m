Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55027F058B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E148910E1CA;
	Sun, 19 Nov 2023 10:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338C10E1C8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700391447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paKcR4aagnq4OR4cFFNyGyCczT8YfM2615gwz6U/Ifs=;
 b=eqqagPN1rqWAkzWwuneyLotHOQKZqRjtxFx6swn9AcqY2YGELwlqqr/WZRtyJL6BFrMql0
 3CbwZk8VWMnIN/K6gaQNIBpSx9hM/FMe493gjzG8jw+C3Kxm8gWUkDpFzZc8++aTsDgGhy
 rwgEO581W9T4TdQhOSrACC2uTnL5DIE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-7YWHVxt3OeCypjWhHNGhjA-1; Sun, 19 Nov 2023 05:57:26 -0500
X-MC-Unique: 7YWHVxt3OeCypjWhHNGhjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40853e14f16so6119275e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700391444; x=1700996244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=paKcR4aagnq4OR4cFFNyGyCczT8YfM2615gwz6U/Ifs=;
 b=Durb6TGCAi1O2UBIzhkNKk98/mtz62D0bqFRjLan8VpAJjGdi3VYmL718hcQ0TVp84
 QjQoJnTjLAXh3iCrfW3xZGVcwHSvxwVtZQRG4RzBZ4tFe/DBsoPCZJRcSuVEFJPq+2yZ
 8QsOVQBFxulPMKwO6KxVe46K7d7YFt1j+57v3Cr+qgFFZ7mMnI5uG7cfk+8pfShvAPve
 Xp9R0FCmU7z+Dy1CzvHMRaPWW/UDqesNfaJO0CyNkwHaSkIrLTNH/8KjDtQ5bA7EFFV9
 0Y3uGb7odj5H12PQUxmplBw+ZmVjzwW9VFPQNgvGKfT28kLgjSLNsMS0VMujU3oq1bH0
 d6bQ==
X-Gm-Message-State: AOJu0YzRc+4S6n13wbQ8jNAfcewZuJhimwfneN5TE6TyY/KWbma6XVsP
 XNvNjUR1p1OJoTQuAeTv6EoGSI6+1cbFPHjoS1sayxfOiZ0sSOgO3Rhi60i8nVUdHVHsrOnTT15
 JVkGBS91S9qK+iuiu6iC5uhv7LuWnNv74KZuS
X-Received: by 2002:adf:e58b:0:b0:32d:b051:9a27 with SMTP id
 l11-20020adfe58b000000b0032db0519a27mr2879796wrm.20.1700391444493; 
 Sun, 19 Nov 2023 02:57:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7SRJ7y81uoAdnNo/STFG3TuDFoHARhcCF0tpowHTWIp4MigNAbZkJfZ0hoizOoIOzIYjFQ==
X-Received: by 2002:adf:e58b:0:b0:32d:b051:9a27 with SMTP id
 l11-20020adfe58b000000b0032db0519a27mr2879785wrm.20.1700391444248; 
 Sun, 19 Nov 2023 02:57:24 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 dm15-20020a0560000bcf00b0032d81837433sm7796649wrb.30.2023.11.19.02.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:57:23 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] drm/todo: Add entry about implementing buffer age for
 damage tracking
Date: Sun, 19 Nov 2023 11:57:01 +0100
Message-ID: <20231119105709.3143489-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231119105709.3143489-1-javierm@redhat.com>
References: <20231119105709.3143489-1-javierm@redhat.com>
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
 Jonathan Corbet <corbet@lwn.net>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
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

