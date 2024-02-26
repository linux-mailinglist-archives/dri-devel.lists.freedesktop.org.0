Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE9E86726E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DF010F066;
	Mon, 26 Feb 2024 11:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aGFUM/OX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A4210F066
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708945235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7fb8qhMyQWkNKGZ69wxb0HTmiSSDFyd3jGrND6S725A=;
 b=aGFUM/OXx8RnIyYJYEFV5wkz3Q26sN37LfaCkVFrVhZbL8QKNGhb8xj8jeRm7Mp8K5ZIcP
 MRy173fLNtu5AbRqeDEkrXHjeZgPU/1i0YAtS9NF0H4PP0j4upYdRL91r8jcYf8FYtS2D1
 cF7DQPRYYUAV5+rfPI5tj4slI4vgqVM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-6CM12_Q9M6yGvDOLmN1ZcQ-1; Mon, 26 Feb 2024 06:00:34 -0500
X-MC-Unique: 6CM12_Q9M6yGvDOLmN1ZcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41294023628so8297255e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 03:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708945233; x=1709550033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7fb8qhMyQWkNKGZ69wxb0HTmiSSDFyd3jGrND6S725A=;
 b=pGbfFtWzk962twEvkQ2ynbZXzEqm4NxOjuxQUXNQEl6gzwJsm9eBlnp8VPmmCDyU5B
 fWKs1NymUAL7pQosNTi5NxGxgiTOc5TYz0ODk2bP1gHLLTercLKP1JsmaKTF3rs+n3AB
 aW3unFUNe5Qz4Hb9FD8Ouj680KwsjO77gSW3dJJSITPniVzMADPegXn55uMA1roIYdKq
 SZux4zm1w8d0kMzr83DrnWTYGP7wx8surxQtjJL3QKVQh/T/JGe1vsBuEfFlUAmNFPjG
 LTWh6zNPffEzMVHUf13AiAnqGm2IkXPkzfiM2X7o44Z0dpooCOjUGrIdy5NTE867oKR8
 jf0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJsvBCGIHpGW0hTv/HIcsVVYZX3bUtEzzkgZI6+NEAcJVKu77WZzUmphGXqxM2GYU8Po9PivbmO8x6Qi3divcCK9Q7ZUBXMKeRIU5ViQzQ
X-Gm-Message-State: AOJu0YyIE5HxcZJsrRh7OGw0rOJ3EEDF9VJWeveri0gdu+zgzuQgTx6I
 p2y6F2l4aUmAuCEZB36JdBq3G9tA7jrTNK7fd5GUN0MsFqmBcE/gafCfCkHRYE3xqJpBu9WCBn7
 jUvrJedMyklJA81/kG4X/22V1AjbWzEgmkXqNOTl5aFzYh/1XBN3wCEAwf7iTFBQS
X-Received: by 2002:a05:600c:34c7:b0:412:989a:f6f5 with SMTP id
 d7-20020a05600c34c700b00412989af6f5mr4897724wmq.38.1708945233172; 
 Mon, 26 Feb 2024 03:00:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsaJaZApkXnvNVxhpqzjSveNDzIfwy1pLjTKBTKYns49hQffucMV+7Jcfbr8ymuqx+Tc/ISQ==
X-Received: by 2002:a05:600c:34c7:b0:412:989a:f6f5 with SMTP id
 d7-20020a05600c34c700b00412989af6f5mr4897708wmq.38.1708945232843; 
 Mon, 26 Feb 2024 03:00:32 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-30-118.cust.vodafonedsl.it.
 [2.34.30.118]) by smtp.gmail.com with ESMTPSA id
 jt2-20020a05600c568200b0041290cd9483sm11620043wmb.28.2024.02.26.03.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:00:32 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Marco Pagani <marpagan@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/test/shmem: set a DMA mask for the mock device
Date: Mon, 26 Feb 2024 12:00:27 +0100
Message-ID: <20240226110028.28009-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.43.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set a DMA mask for the mock device to avoid warnings generated in
dma_map_sgtable().

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 91202e40cde9..d691b29a4312 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -341,11 +341,15 @@ static int drm_gem_shmem_test_init(struct kunit *test)
 {
 	struct device *dev;
 	struct drm_device *drm_dev;
+	int ret;
 
 	/* Allocate a parent device */
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
+	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
 	/*
 	 * The DRM core will automatically initialize the GEM core and create
 	 * a DRM Memory Manager object which provides an address space pool
-- 
2.43.2

