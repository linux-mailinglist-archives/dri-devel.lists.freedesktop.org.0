Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C59502EB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F58B10E2FC;
	Tue, 13 Aug 2024 10:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHJxoQ7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C9E10E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:52:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so39558605e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546319; x=1724151119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZftJBc7W5kwvvNABWDGPxvru4sevjwR+IU4HN2kbDT8=;
 b=lHJxoQ7aLXhBKEMBOHtBy+I1CW01q/P2g5JJ16V+WU5RJbtPMYe5maGsJWJexyTao0
 V8t1yLP/YQAppdIUYViJNPC8+uKtu4ZgobfYuEFAMo6yFwqryk4NRBEenwkCz96xChXS
 syb/yxT2CUclV2/bOzCg+GWenNfY9e9j5YtKR5zxXha6PboRFMuJu/yJIycVcEq+sie6
 CTfED+Vmn6PU4JGN5xUG30gq1leimoTVot5ETYtobi9+ijKaRb/olfKSOs7mDtcrJkIX
 +0z84kkufvI29lP/zFl9cawoosgx2LeI5DVM7+z0eLbu2diimMGyabjS3CdGaPWWkKmp
 eZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546319; x=1724151119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZftJBc7W5kwvvNABWDGPxvru4sevjwR+IU4HN2kbDT8=;
 b=ItHv+3+SR0RtrDxayiNREI1b0VueXYVfk+fjfQAtv1gpl1WNDWuLYajYcbZyafDXMj
 4kZBRobl+u4+YCcCk9e9tk8E1qjXDuAHfGabIPjMIemypU3wOJjhb8gfDY0L3G1bgK4H
 2PNMq748+w429z/UwX0fVNIkGHO97EvHJRwHb5KLw/1gjXiGmEkgbK/DDhpnPpx4cvQp
 ZD9ee3n5J/92Xi/3nv0DPjwz1N5HjMLipoo6YCALB2vj+eHOv1ed/sFl+/DAsDSixTq2
 Hg588t/Y2/3A0P1v521RE6KzaD98cTzOZocuSZGSmNbbsVCp1bIk5eNGpxQr6Qjv8asj
 iIxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaM3qeGGdN0bz/ct07aAxjU8nel10hT2ZGVKNOPk97IwBUpcHUQNVFWZdNfqnBqWA/bcdhD01Og3UTeRruEEdD5W9rBR+q7m+6X85ow3sV
X-Gm-Message-State: AOJu0YxckIs8rFaoH1TcTXGmtbWm+yweYngboRrL/XBh4OiV//PmF9St
 6NtUv8/RhGOnIRZkEYaPrak8izCaiQubBVHd5YSO8ttq1Q6T5TPI
X-Google-Smtp-Source: AGHT+IGmYYsdBOSQGdHs8roYpDqyGK4MJTVsNTujjltjUQNx3CKHicYkYjxIfPWC0fDyWxdLgRP2XA==
X-Received: by 2002:a05:600c:4453:b0:428:f1b4:3473 with SMTP id
 5b1f17b1804b1-429d486e85fmr22635355e9.26.1723546319268; 
 Tue, 13 Aug 2024 03:51:59 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:58 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 17/17] drm/vkms: Remove completed task from the TODO list
Date: Tue, 13 Aug 2024 12:44:28 +0200
Message-ID: <20240813105134.17439-18-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Remove the configfs related TODO items from the "Runtime Configuration"
section.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ee71d1a569dd..a8c187f6c0af 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -229,19 +229,12 @@ Runtime Configuration
 We want to be able to reconfigure vkms instance without having to reload the
 module. Use/Test-cases:
 
-- Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
-  of compositors).
-
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
+- Hotremove connectors on the fly (to be able to test DP MST handling of
+  compositors).
 
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
-- 
2.46.0

