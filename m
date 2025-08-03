Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C1B19235
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8474110E4D3;
	Sun,  3 Aug 2025 03:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pli8V0Kj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E9710E4D7;
 Sun,  3 Aug 2025 03:59:54 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3e3f152700fso12489585ab.0; 
 Sat, 02 Aug 2025 20:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193594; x=1754798394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7JGVPkiEV50TUkm9gkR7fN/RD0dLhNLulKstVZuKxw=;
 b=Pli8V0KjkHaEy6sPxUqVR1wteSp2LOP32EQrMWRQNon1ky/EHbZ52mB/L+jssHX1nv
 sjj6Lh3SiH4kX648buPKUCqpz9xqlFc9Yep89yeYZ+rsbBwLObcC9ndRxC2n4EJ7qVUp
 aFlFey8kIObYh42kf7I6dUvQ216kg615A79VT4gMK7+6juto8rp291j5CZsklf2FgSX2
 WgdHOjCPtdTXJGfiXLZKa86fNjR3GomtKQhcl9+wBhUIMru9utYk2ybdyBaxL3IhbqLx
 l9DoblMl4ctE2HnfRcbK6LqQt9dKW8EipxuZPE47tTAPJpdhro0RPxzEzhj+ckWn+SLG
 SPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193594; x=1754798394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7JGVPkiEV50TUkm9gkR7fN/RD0dLhNLulKstVZuKxw=;
 b=TzF2Xjk7BG9iRiX6e1YCRJVizyZtCiarJxGsgu28EWHPXR064Qtie+lAPvv8L9PdFo
 Fqb4A2t4lMZuC38g5zsa92I3gnw+biEO/2CThJu1IhwRdoY8M+EBWp+unwtSoqiA16fu
 4m5zTUGkZ6FFQGikFyvctj2kSQrk7InU5lZfCyirGbRv3i7xmUboc0ySRWCRtGDs9dxm
 whBr7+7rNXqMuOP50gb4XMiZWTj+L1W86Une0syCzKZm3TVBA6sqoO77qB3YjfUL2pca
 KU9hAoG7H92EVyGVFk4ayTS0A0t2MNDWhZrrJjICg1pdpx5If1vJufPpMx2X84NVwj1S
 MJeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPDy3B93JxJI/FIzk0ojFl1KvvQG/LthNcmvyaBmRarGif+TbGwCeplFcQF2NbzrWLiZv4XyaY@lists.freedesktop.org,
 AJvYcCW/TZrJZ5cLh6Ugkwj84iZHYEY1AotvjwoIxXdaTVvluMhtc1xY7SwZRMtYRFBgGsyKXxhaPMcAx6OQ@lists.freedesktop.org,
 AJvYcCX7qyScPtyCMJW3o8K0Z8HlE9coCLOq+93+Py/gVkmjP4HK+OP24+NDYiQi4TJOQgZxWTDNVl8pr4SpmM5JLw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3Z+1FhjZC8gUqwx/pMxw4MV6HHurVqgog5V0g539f6CVKTUMH
 klWhbDHtSgBSHnr8TXCVL4vfI/Inkay5EVW3Nq4xf9xwj7xptQzeytuP
X-Gm-Gg: ASbGncvsTEC/ANrnyEGRGTHJr27j8wslK3/2ZecZOiW7HNOgHmNUzZ2beck3wVIiUWg
 OClt0vsbq8WnXb9RQw0QfYAqDqyo09bk+ITTkJJrfFd4c+TeJXUx89Noby7JB1JkspBewj853hI
 B0JNYvMQ9d9I4sJtjiby+Z7j9D9JJDjx3w83BCOUmYXGKHnwETpSa0wHyKaBVlnViIf8DZb8Cyw
 uTS7/5BLSjR3GKk2czr/28z+DWKzUUlkcEbcwwLrKyLRwidm6H26tjejyQ7nJNkWiqnmX8529mS
 oz0eK+6RHQfNGyZo7EOd7Tt0X0H3eHCe92Vg9T8eC5/Nd9duvl2m0ULe4xZU5agiOXxbeVt+AmZ
 MpjZAWfQX2wzrabgjDKRxdHsAg0cgV7oa79rtpwsw6FHIDOWl4gYw8tbEZwoZPkyZ9AQ3DM414t
 LSoA==
X-Google-Smtp-Source: AGHT+IER1czj1M603T/fh8PrgV2njv/OOVXJjWBlMXOa06xUmclYSmV1HU1IjXDssYCVHfDYAb/JPg==
X-Received: by 2002:a05:6e02:e46:b0:3e3:cc1b:2b5e with SMTP id
 e9e14a558f8ab-3e4161b0466mr69757435ab.15.1754193594065; 
 Sat, 02 Aug 2025 20:59:54 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 56/58] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Sat,  2 Aug 2025 21:58:14 -0600
Message-ID: <20250803035816.603405-57-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index fa6ee76f4d3c5..333df32c2e181 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.50.1

