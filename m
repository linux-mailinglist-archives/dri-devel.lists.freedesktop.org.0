Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D293312B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765FF10E85A;
	Tue, 16 Jul 2024 19:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BPIeR3rW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9946510E844;
 Tue, 16 Jul 2024 18:59:19 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-816d9285ebdso1261139f.0; 
 Tue, 16 Jul 2024 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156359; x=1721761159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIsdMzCagTnPqkjtDJJFzcS6RuUfrVRwKo+d8V5q9yk=;
 b=BPIeR3rWK68sWLSMzXgfVzHEOQDHc2D+s9i5or/ljWms9NFkUqSLbXZEl3dAK4NFal
 mvYgUXef1fLstj5CfHhiz/2V5raY9Wl0+F8rumTrQz5ZSfgClNGyEYb66zmg9y8s44lK
 m/kH+4nf02dbhWZVAZD5TDHFMkDfJYARiE5f8QbrS9NEeZCQz+/S8LouaAunM7CwvU/0
 MMmgR/zQ9QNb2jaIsSt3WlKmNf2KD6uIn0M4Wrbih7D7PvBu+mb5cAh2rx+1h9tWeDLF
 dyCdEsebulHn+5iK/hwcTgyq+bsATFyCGfu9t5ud07AQkDjK201ep/CDHkzV0js2++z9
 esEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156359; x=1721761159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIsdMzCagTnPqkjtDJJFzcS6RuUfrVRwKo+d8V5q9yk=;
 b=d0BPZL8nsbgaKaGz5tzqlvt8nusewoQzr4PBweLGjv9Sw2uc6LqFdHeQAlGdBnQ+lo
 OFNRnUiHWTOx/HpWDPhvuB6OZQCqSW0w7w8DsusYAPBWDYvFNBpIZ/kGPEUQJlQfjoAe
 i0qUN9wyuJpFI34qe0cIKQU6ZVH5BHR1BykfnX2SnfNkqRHw2aXqKVt1v1ot5baB4U64
 5ZYY/XiGXW1Y3Hxj/wh4HIguZlh70Hp6Wwbvh3HA5KgBSHalg7UsY4/Od4TRZG4AATkP
 j/Mr2FZ+3hf9fF6RmoFT+KDl4kWg9+atHatKNFaYoz5+G3VERhUsU+Tt41b5vZGCbg+n
 vrdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFMazxP8+jlO1H/CYEoJ18v9XElYu+k1CRZrDSt+9M9APFlMrjheGKpjZ55VlC+M87Gh/4I+qCvgC5/fp7M1pyCW/4Fiwa1Le4+tPjkoBwYvG2f//PxraQLKEzkh8ivMhTgSugevsp/vJpmDk/0TuwRmS25kDi0zcpt0OMNS6xtRb3SU7JcktUSAWl/hTrLlKdzrkv+gTQs2qZC32BjuL+zLk9FUczc2v6jatP6Oy/FUwsq1c=
X-Gm-Message-State: AOJu0YyP91pTXzcz9iWVE7bVJBqn2dC4Z3Yv0vKtDr80eE39OmO7hgqY
 yYfWj17FZ3QAQwSYmbWgJryvKcBoQj2AvMqlQ6US8DyY4IKRDa9p
X-Google-Smtp-Source: AGHT+IHNiuOywTynIegoUOvJ19aVvPGNEUWBbbHPTejWdZydJpz41aRG2QF6opmLXH5eEouAFJcPxg==
X-Received: by 2002:a05:6602:3fc7:b0:7f9:bef6:2068 with SMTP id
 ca18e2360f4ac-816c35dac54mr41725439f.10.1721156358829; 
 Tue, 16 Jul 2024 11:59:18 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 42/54] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Tue, 16 Jul 2024 12:57:54 -0600
Message-ID: <20240716185806.1572048-43-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..1d1ddbedcb5a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.45.2

