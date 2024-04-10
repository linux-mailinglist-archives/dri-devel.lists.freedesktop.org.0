Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF189F1E9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3C411330D;
	Wed, 10 Apr 2024 12:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xx4Pj4VZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD3011330D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712751613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cJwZCdGn/12kQ3EbOPpSAbOJTYEctOWbdv/HkZkwxS0=;
 b=Xx4Pj4VZdsAWkbAJcK1QqHEuzh4VhHzRT/CkiLB+SizG6neCBDK9ZbsctPcWU9pcb4Vmc6
 VtxoFvnHoaDGDzvry2c4aTtrCZl2ZMva3t6IrbGuqrtizYA5sFvVG+7JwK2Opprcts17XS
 KgTaYtKnNcFHX9l4GuSRZ3QcKcpIiH4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-IW5h1KQhP3GPWYcogULNUA-1; Wed, 10 Apr 2024 08:20:12 -0400
X-MC-Unique: IW5h1KQhP3GPWYcogULNUA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-345fa9052b7so1254973f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 05:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712751609; x=1713356409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cJwZCdGn/12kQ3EbOPpSAbOJTYEctOWbdv/HkZkwxS0=;
 b=iOsQu7veD2Dwkm37teHGzQzToEPESFUWShP68H/27ZvbrIbkZIUYO12ohkYC61Qgy+
 CgsUD5tsjH+XZEQ/r/EsY47rQosP/j4sCma8HsI5YhS+UK9HBiE1S2v+Dc9/ZoGkD4AF
 ea4w9UQHKglkbj3K/nuvuyNNPu6beTcR5fPmthuoikQw2KcCPSULL7QXx1r/8zQbetNc
 A2ouSD5+QqLdN9Sdkb/Q90GdxC9rRVBcqAorgECBcUuodxCbRyCLDW6Uorec+MKmYMoQ
 O0GZG9lVu5q1R33cOJrayB10XbZklyhIFBSfa14TO2HEn/czS+h5GrMk6ujn1VkZsg4p
 4sVQ==
X-Gm-Message-State: AOJu0YyEdO7o/AuYjUgCIEmnRcbWwDQsvLKZBjFdd/qhzR+DsKnO0uYb
 Wm6WljSGsILf2Plin7y6E7w2O0GDOxF15iMuOcbva4LI4i9szdmYCJzMI3YwAvWASCJme9nsJPy
 NhDxK9EXNt62i2NrzxyFtkqOK90gZvVspBkrv5X3Pm2HNBYhS0nwGGUPxetjwQ6AHUfOVmKAQX7
 b8942Geod0yfqypRkveIsEGzAwfiYE/Ghymb/IDZzRTVX5sW8VoCRIp9z61Q==
X-Received: by 2002:adf:e7c6:0:b0:343:96b2:c121 with SMTP id
 e6-20020adfe7c6000000b0034396b2c121mr1792557wrn.63.1712751609557; 
 Wed, 10 Apr 2024 05:20:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaEsfMBRsLWsO8CaeP+0eZlxRSkArpY8F3KRxzPp8gsPyxbWZ3n+PeTBB4gyznMOHXT2ieZQ==
X-Received: by 2002:adf:e7c6:0:b0:343:96b2:c121 with SMTP id
 e6-20020adfe7c6000000b0034396b2c121mr1792531wrn.63.1712751609137; 
 Wed, 10 Apr 2024 05:20:09 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:89a5:e800:aa3c:ae70:b589:bfe8])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000180c00b00341de3abb0esm13678098wrh.20.2024.04.10.05.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 05:20:08 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2] drm: Document requirements for driver-specific KMS props
 in new drivers
Date: Wed, 10 Apr 2024 14:20:06 +0200
Message-ID: <20240410122008.38207-1-sebastian.wick@redhat.com>
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

v2: devs of the driver which introduced property shall help and ack

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/drm-kms.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..b98b98359c90 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -496,6 +496,13 @@ addition to the one mentioned above:
 
 * An IGT test must be submitted where reasonable.
 
+For historical reasons, non-standard, driver-specific properties exist. If a KMS
+driver wants to add support for one of those properties, the requirements for
+new properties apply where possible. Additionally, the documented behavior must
+match the de facto semantics of the existing property to ensure compatibility.
+Developers of the driver that first added the property should help with those
+tasks and must ACK the documented behavior if possible.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.44.0

