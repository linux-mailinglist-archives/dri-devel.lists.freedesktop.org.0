Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6C51991A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E24010F21F;
	Wed,  4 May 2022 08:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2740910F230
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651651338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7zXu34IG6COwbjtsWuh3VVUA+veouEEkv29/Xam+Los=;
 b=CpDsuLwosWS4MdnTIs4LIfzodcoqLDrkiGOILGmkKo7vc4YqaCDrKokHyXlKks9Cq8U6lw
 LxYBswvrkRQXec42zkIHo0zGzP4LUTPbIe8AQPQHyq4MN1uxPVijhct1upqQYFMTUbPm/E
 Rc7OqIww0IhqJrRZZR96HfnrWjs069o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-VLxia4GKOJWKzPZEP-Trmg-1; Wed, 04 May 2022 04:02:17 -0400
X-MC-Unique: VLxia4GKOJWKzPZEP-Trmg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so2647453wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 01:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7zXu34IG6COwbjtsWuh3VVUA+veouEEkv29/Xam+Los=;
 b=Xzh0/o9XeyVcVUDdFBP4LPFxntfmyVIjo7V//k6YBlbkOWIjdRwzq6x1O7hIe1+Z5w
 NuXH4zvaJVgD73k1daej/GIND5EgPdbZFNjImoPUNkoRPcaSQ2hnWVtm1xDv1air2xAY
 Wblci+baLPKNmJaoOfRAZsCl/TOekGHm9OyaQAfyR80RfElZKX6egx7HOk5PXdqRBfyg
 UmUS4IBccJxkNYsnTG98iz4pXBsky9hBtewig8qJ9FtrTBLnT2PIE3wokEjx0buRomJI
 93mMNqNAiPThsYfmdTEFUqgaoZArGrv1GJH5fGzcOl7MB3XFlhQt1y8XevZ2LD/nwniu
 PN2Q==
X-Gm-Message-State: AOAM531/pGEqZmnhzsYCo1lTjlNYKDKXjHrGynOMRMevIuKvnOSZ5cgE
 n8mKnsw84CZOOmU2HSOKMlQjeFGZRf4E3YysEPHPI51UXjHVfYItV5QvCaCmA/tFfr2XpleV11Q
 q46gZFA3fezMdgy3W8hCmoUnoIfyi
X-Received: by 2002:a05:600c:281:b0:394:1075:fe3e with SMTP id
 1-20020a05600c028100b003941075fe3emr6526500wmk.155.1651651336081; 
 Wed, 04 May 2022 01:02:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN1muJJMfdooSCi4Oc6vFk6sijHuLsxaZY4H7nGBDH4+1JhjDY7R1Xp0Vb46jIg79cFINiwA==
X-Received: by 2002:a05:600c:281:b0:394:1075:fe3e with SMTP id
 1-20020a05600c028100b003941075fe3emr6526478wmk.155.1651651335844; 
 Wed, 04 May 2022 01:02:15 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020adfa30a000000b0020c5253d8f4sm10872601wrb.64.2022.05.04.01.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:02:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/todo: Add entry for using kunit in the subsystem
Date: Wed,  4 May 2022 10:02:12 +0200
Message-Id: <20220504080212.713275-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Kernel Unit Testing (KUnit) framework provides a common framework for
unit tests within the Linux kernel. Having a test suite would allow to
identify regressions earlier.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/gpu/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 127e76ee0b2d..10bfb50908d1 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -603,6 +603,20 @@ Level: Advanced
 Better Testing
 ==============
 
+Add unit tests using the Kernel Unit Testing (KUnit) framework
+--------------------------------------------------------------
+
+The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
+provides a common framework for unit tests within the Linux kernel. Having a
+test suite would allow to identify regressions earlier.
+
+A good candidate for the first unit tests are the format-conversion helpers in
+``drm_format_helper.c``.
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Intermediate
+
 Enable trinity for DRM
 ----------------------
 
-- 
2.35.1

