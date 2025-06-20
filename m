Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E4AE2932
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 15:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3FA10E0A1;
	Sat, 21 Jun 2025 13:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="WrtB6T4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEE710E0BF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:03:10 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-748e378ba4fso2878787b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1750442589; x=1751047389;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
 b=WrtB6T4QeW1qCbFvQpGSDlaCCzEWSGg3ZDyZllpGjtHY3JjXvIO9Yox+/neYfqKw79
 Wn1+x4Wjb+IiRDRUdKrvSBB8orUhWiEcONZwF0LuyUXoOroekfs1vPuYTmEorBuOaG77
 X/YDGvojjvmzX/38SZDMKyML6SBFBqeiuY2KvqEnloVR/989dIxKDE/6W0jwAr/bDpqo
 mJSI6DD0xILWEhjUT2fpwcxdI4K2oOtdq/XuhLllnfM6MvzscyNpsySWgbVpkpjsUZTa
 fdfkY+EGLfnchwZv8+GbOPNBZJeycuUp3bTXD6KtaWOaXM6TfHHB80kbL+QR+xE2YKTb
 SmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750442589; x=1751047389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
 b=nVdpDJPuJrO1Ahabr/A6l9eXGmbkZGybjdaXi7gsZt9+jmtFeX2eQyaXzz2rB/wA9i
 lHDw3w7yWrSkqo6DAHXUcS2aCdelW00En8u+nVCF7Wm8nsIh07msjVO2A33GsGmilTx4
 AIKJVe1JqUiw7Qnl9u1TB5dKJoho8mdbUAN5vnPjjrV7b+pAtvra4ZGRy7Gn/JCx9v/u
 XSMhIEdE/+hdGUSDbGOATt2Ke+uPETXiNU3zKa3V67kwan26Y8Ty0nsrzI2zOINpEIYr
 aNgaOr1AJF4tzB5xR1NAvVH72B9ypuqDwL89QtdBvsiWrHM/t7jy9Pkj2jLB23Qoqgp2
 YBQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtu3TGIBwZ7qu4OVrVbaczbiyJFs8Cb3XIsyV1k5vyaX/ccgvAV6s7MpRjuskbj6ROWgE4Z1h7LN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVEzZ8AQAM913w8K6U+sHUWJ7ApHFlnRJMvIfBzbBvBwkgO1PQ
 BLpQEvErfQsqzumYqLaGgF17U+qt2Ll7mpEOfdzRtZsPj6+7RxGN29ANO28bc4lAGME=
X-Gm-Gg: ASbGncvvu+j4aSCl76KjifSPb1cp84DIX1ulkcVEUlybprHsj4+5gQv5uFwe0l57KU/
 VyR7CaNj1AGKIko0AHb97lhwc+DZeQhA0ELGLwoGXaVpJURwCYeInMd3YXayG4vYswiqaahMNyQ
 yloXQcN84dP+CvDWMp3RIbkFzIDNm92+SSC/eyUdxKTM2TrOLv6veDgHNL4wys2KhI8aCnKjeOk
 FsHgIu4RSfgx7fcSUhy79ryVig9CuxrrJrzIWN7mxFpF4M6FnA66thzZGspF+C8x7jSq3/nv2gO
 yq+MjFkF95jE/NJ/jN20TEi6Ue9u0V+J7a5pdcV+8gZ/mC0N4VIubeYu70ATQdz3xRLXCE7GXT9
 HNsT4Q+/YdrAEwrp2ZA==
X-Google-Smtp-Source: AGHT+IFlM8cNRiBkGT187wOeWcfkfeb30/gPkHi7Ft0d5GjTVFgLhRQpzSohSUSYFxFeTwX7y0TLjg==
X-Received: by 2002:a05:6a20:72a5:b0:203:bb65:995a with SMTP id
 adf61e73a8af0-22026f007fcmr6414483637.30.1750442589385; 
 Fri, 20 Jun 2025 11:03:09 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f1256f03sm2131724a12.51.2025.06.20.11.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:03:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] Fix typo in drm docs
Date: Fri, 20 Jun 2025 12:02:58 -0600
Message-ID: <20250620180258.132160-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Jun 2025 13:44:37 +0000
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

Fix typo in Documentation/gpu/introduction.rst

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b94..39b4c943fa00 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -32,7 +32,7 @@ member, only the structure.
 
 Except in special situations (to separate locked from unlocked variants)
 locking requirements for functions aren't documented in the kerneldoc.
-Instead locking should be check at runtime using e.g.
+Instead locking should be checked at runtime using e.g.
 ``WARN_ON(!mutex_is_locked(...));``. Since it's much easier to ignore
 documentation than runtime noise this provides more value. And on top of
 that runtime checks do need to be updated when the locking rules change,
-- 
2.49.0

