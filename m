Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA975287D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D7B10E70F;
	Thu, 13 Jul 2023 16:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D7210E060;
 Thu, 13 Jul 2023 16:36:48 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3476d0b5295so3766495ab.1; 
 Thu, 13 Jul 2023 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266207; x=1691858207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EpDVIlDX2H9hcBKUU2bnV2uAgz8tLVHVeXAEtG+jYc=;
 b=ScYmlxUqCGHtoYkCe/XAPIYLYXG3kX1g+sGc64KIc1SPlphq1iH3iLFxyNaQBB652f
 hklDrCTTYlW92m6CVnwtS0cEz78sbOuxuzeOu08ZcspU6NOI6P1F8PdWKgGbnFtecvzS
 GrmN5EGlNJ/oBdbvs9E6fELTDXD4FiHOtHKM/Lp3fAxM9aeJsDhGjW28UGtL3zIjYIjB
 enDjJsx+6UOF551dJI3KRt49ObrxSOddSYnnYM4BpZp2Nst0oOcMQVvPoYypaDWrC7HK
 D8DLgRmFCnb4Np40k53LjcQDwnJALjI4wEx5gmjsmbmyWw25obaPUSxuiSCu4CdKYdDP
 ZnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266207; x=1691858207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EpDVIlDX2H9hcBKUU2bnV2uAgz8tLVHVeXAEtG+jYc=;
 b=h5TIf4iSfSMdy7GMipaipPj1f2PPNXZGq/vSd8faac3m/EGdq3Wyd5yphOtILLsrsS
 1XMKwTuLmy/By0RneeXOHdVD3uS6VZSpt03d/thIwptt2M/tB9qihXJjGEhfyIJveAdF
 FphBDiima4iUZmmKWhO1QkL0Rn+lr2+4Pqg18EzuDsjLHDW3pIAylHaaFG6ZcCyLovjV
 eZ/sUfrnYvIEnZBYvn227t7PJ9Oehr6RPsq/Qw1JReXcm130hO9lw341qiUNI5+3Vs1F
 x3CEuNGT78suiDI/LgnGCfWMb8L0sg007tAHm8EGbymcUXloUegeL5Zl7TkCuctXEOCO
 Wrhw==
X-Gm-Message-State: ABy/qLZC2nrS21JcbYplzrlhZL/TrtPUwijfv5p/y/yKy/fgrRF/U3fj
 RF8LlR9/3XZrvPbX3YLaqcs=
X-Google-Smtp-Source: APBJJlEKbFktiFQ/78FtlpMN0cgiNpYvultfFSQZab8UdWpq20qsbPfbNKW5a6SBlQ9oXjRJlEalhA==
X-Received: by 2002:a92:d4cb:0:b0:346:7502:aeaa with SMTP id
 o11-20020a92d4cb000000b003467502aeaamr1751455ilm.18.1689266206905; 
 Thu, 13 Jul 2023 09:36:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 01/21] drm: use correct ccflags-y syntax
Date: Thu, 13 Jul 2023 10:36:06 -0600
Message-ID: <20230713163626.31338-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Incorrect CFLAGS- usage failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
but without DYNAMIC_DEBUG

Nobody noticed because a larger regression emerged.

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a33257d2bc7f..670bf046019e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0

