Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D386D42B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 21:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5510E5B6;
	Thu, 29 Feb 2024 20:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZOKPJWWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F351010E5B6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709238518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SmIHX6Y7vZxIL5GaMIQETwxnKgF7XXugu9W+eqW/pI8=;
 b=ZOKPJWWuGa4wm9K8KSK5OXMBkarQiAFqyn8+q18BIgxsTgbygWqY7Pl4NrKHl/37VU7yl/
 hhPB3Upy6n0i4i/IcWSkC7ZJoyFxK9qKO+jx9wNfM05csTH8B3FaGpJWOvtRmoSqDdNgWc
 rJx6DM/EVdp0HU7BNrMBNueiXPddiT8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-agJYizi_OuqMAU6iJ4oqlg-1; Thu, 29 Feb 2024 15:28:36 -0500
X-MC-Unique: agJYizi_OuqMAU6iJ4oqlg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33d29de76abso692060f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709238515; x=1709843315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SmIHX6Y7vZxIL5GaMIQETwxnKgF7XXugu9W+eqW/pI8=;
 b=l/h1fzMVDjWPt+geTlsPc4T97jMr4LVvQ9Bm7CXiFmPXvlY5v9iUayD/EGe5CJ5P6Z
 ZVvbUQBL5yuedU+IPBn5zLxW3k9uUTBnaGkgWq//8YnDdmkFj4SCz9tVWyWCabOZUB5j
 k2n92MVsH0RmHS2oPGPNxD+VaoAjHf4fUdCqQKlTQud0HsxrywVfLfFm8LJ2v+cnMuVF
 GvRrHLQwzATqIFO30Lc/HIiKSdHDkkZYfYSln2ONm1s1sewAZLneYswacNwALvJoxCZd
 H5KFBLJM3Wi88R36WGWfOqVA5+m13LUkLYl4K4Ke1kyG8lu1C+x36BJsnFpvzgmpANUu
 wPrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoGOw5C42Y2CUs4MMgTjYk2Vq9WlJ2f59cj+Y01Z3wwMDqK6SLt5Ucs6ZXsnBmXrGl+e1KkXYMSGzzwq/zZqnGx0GPNIBrQA4NOa3t4JFb
X-Gm-Message-State: AOJu0YwYQsHb4XEnrRBRGWbI7iqPtln7uzUtUtMWtsENTwQUB/lVuUEH
 oYfHCzR/+aSosB5tqpa/t9T2LJCflRlXlNlPXwydiBDfYET5TpkNMqgWilUPEll3ysACuAVHZUg
 a+FKPM8ApH6e/sa3CyQV1F5rW4UnDcnDUrEOIWUbD6OwqeDfntzLuKEfClcTAgQdfkw==
X-Received: by 2002:a5d:49cb:0:b0:33e:1818:7956 with SMTP id
 t11-20020a5d49cb000000b0033e18187956mr86355wrs.5.1709238515387; 
 Thu, 29 Feb 2024 12:28:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5Jx2+Irv/obGwjeP9whbDMr+s9YId14EB3u4zXUdHLaSwpMrti0IWA9JKGqUMoV8obWO77Q==
X-Received: by 2002:a5d:49cb:0:b0:33e:1818:7956 with SMTP id
 t11-20020a5d49cb000000b0033e18187956mr86343wrs.5.1709238515052; 
 Thu, 29 Feb 2024 12:28:35 -0800 (PST)
Received: from toolbox.fritz.box ([2001:9e8:8984:bd00:2340:7b35:5e60:4abd])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adf9cc5000000b0033dd9b050f9sm2604385wre.14.2024.02.29.12.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 12:28:34 -0800 (PST)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: 
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Document requirements for driver-specific KMS props in
 new drivers
Date: Thu, 29 Feb 2024 21:28:31 +0100
Message-ID: <20240229202833.198691-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
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

When extending support for a driver-specific KMS property to additional
drivers, we should apply all the requirements for new properties and
make sure the semantics are the same and documented.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 Documentation/gpu/drm-kms.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..afa10a28035f 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -496,6 +496,11 @@ addition to the one mentioned above:
 
 * An IGT test must be submitted where reasonable.
 
+For historical reasons, non-standard, driver-specific properties exist. If a KMS
+driver wants to add support for one of those properties, the requirements for
+new properties apply where possible. Additionally, the documented behavior must
+match the de facto semantics of the existing property to ensure compatibility.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.43.0

