Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EA9A1C17C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877510EA6A;
	Sat, 25 Jan 2025 06:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nX0CVOzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CE910EA69;
 Sat, 25 Jan 2025 06:47:19 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3a9cdcec53fso20128925ab.1; 
 Fri, 24 Jan 2025 22:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787639; x=1738392439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7okjdo4kzf0n9cj5qoEk7NZRKgM0oBuQJfNPebCfII0=;
 b=nX0CVOzNDT72G7+Un7lC18JrRvvohT7pA1bUqmPPM4hFBaVGHL+O9lvvzW+Bb/euFz
 26xLakncBe096FwwWegluOH65ASeodtznBhQJ6KeiakeS7uI7JJ/O5L8bkxoZa4PC9Zg
 FZZIVYtrNVNoMgn7cqfzWtmwzWj5yjKx1vdx7/t4QAZJIiIg4Yd70WjIc2qFgSijxg7O
 4sV/cq7ZSNy5mu9mq0yBUoHyLSwjCKyGTgbcRodiakgyexl6rvFoLuGzU0D8kWmi4FFh
 eUoIdYz4U3tjPN8v58PvcJw+KfKd04bdu7VaUP34UotfOI8dkbPlv5H+gR3J//jhM4Bp
 FvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787639; x=1738392439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7okjdo4kzf0n9cj5qoEk7NZRKgM0oBuQJfNPebCfII0=;
 b=OPaQNBV3ptBo+s/JEhHY7RiB528ToUIsSnGchBUH2iav55qoUe7R2+ibbdV5p4QBek
 hG3eCN7bFvqx6XmTGMuw3KSSj6/1szWCJ5tPNSoVqpNRgnDMuOz9U2g3aB4tkvTQn+o4
 KQ/aSNzfdz41R5BN+HlpRWhm2j9BqmOlhmBwBripddoRpInarCsUQuE5smcW/IdgkMmA
 VM9DFbrotcMhn1wceCQVNkLIR/OON6na43/XCtQYtkZSQkXL7Sbv3VLUf+TcQOTSc47x
 OzmoiwXKYwgGC5wxL0W5S7rJSpy4VyVoE8ogqbsqj+DPGgoXfCFsUl9mZSSm3VhBU2Pl
 7qlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/EKF3HC+qn8Pnbo2wC9D37KU4EkgsTQWkwTk63gMlDHDvT9u4jNuig4gcVbCm5+sZGi1UOI5fXdZcR7Z2SQ==@lists.freedesktop.org,
 AJvYcCVHyh0OGVl/YgjSYuKFBs+lSVF6S5tS2ylz460viN29XTTvDA4CpalYeodtvq5Cv8ZDXhSqqe7qmsdV@lists.freedesktop.org,
 AJvYcCWzGhzt8bJO7VP0vPG/Y/8D/ZGCjh6Hiry4x+3QmIgR5xY1Qv0BqnE3D8TfBHeYeSYxGcuuXiDW8HwG@lists.freedesktop.org,
 AJvYcCX+XsCuI6lHeRmKhAHAmoASQW58lYtOg15ltAdJTfX+Y5HGN6quu7c5Q/ra6q4XDxAPvEhR9njt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkel2eW03LVOM/6E3fn8cHZE5IzLKNjAb6cHJLzos1hR3kQjWi
 EJ4Q1UvrDtNtHBYo0Kzgq0Lf5nmyUAMDM3z2hTwMS+If9G1vhEqW
X-Gm-Gg: ASbGncttToJ4ML0ebCGhuE2Ha8IXLmIXUK3RgJ9fLrmQAZE/lpWsro3uht91BD/QSIs
 JHidYVd3nJjj1fq9fq/DSaXwkhbPdmPFvvYhdgzd5PVOuKqP+y9g7mKEQZdgmhpINJ0zTWnXzMR
 hsy1dhf3k6pwstvMdEsI4UkBnD0NFX/zJr6aahqnZZ8YQij/xEZvXhzTPNxdrwZUPvyK7PuqpjB
 GUq6HaDpVIH2JPSMBjX/hg57ATdx6FDcriIiH1e1afzVjJpWUGSBo2n8tkwLyVkxMxG/US3G+4J
 6xgk1X5VTgB3SxAlJnvWvMx7JzSg/HIcBIJQTQ==
X-Google-Smtp-Source: AGHT+IGSUM1TcDKPGhb3XRzoRxMh1RMpP2YSvbe13uSEF4aIKxZI5TTMJsRkfxieViI/wN1pm23ceQ==
X-Received: by 2002:a05:6e02:1c28:b0:3cf:ba60:e2fd with SMTP id
 e9e14a558f8ab-3cfba60e6f9mr102334885ab.12.1737787639218; 
 Fri, 24 Jan 2025 22:47:19 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:18 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 39/63] drm: use correct ccflags-y spelling
Date: Fri, 24 Jan 2025 23:45:53 -0700
Message-ID: <20250125064619.8305-40-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 463afad1b5ca..2d68e6841cde 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.48.1

