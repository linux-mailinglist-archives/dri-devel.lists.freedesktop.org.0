Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EDE76BA3C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BE710E13C;
	Tue,  1 Aug 2023 17:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC7910E346;
 Tue,  1 Aug 2023 17:03:08 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-790c24db283so30190239f.3; 
 Tue, 01 Aug 2023 10:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909388; x=1691514188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EpDVIlDX2H9hcBKUU2bnV2uAgz8tLVHVeXAEtG+jYc=;
 b=EBuJ9EqPoVpoheDdtsOWVahtooQlAWC/0GmlNOPjHSXcBXs3RtWyz0MGpOl0DZe4zh
 4HV0hnWXIIrJsYmaKz8XvDUNzTMyQDhfGG5TEfjT+tpsf6nzPj3P2LuzafdI3kyqroGU
 wEnif67Dn2TzPnBx88OVBRRCZPO4KnV2hL5L312AUzusWTZ8zUjTU2Xk/cEnkdOb9LML
 Ti2qV3ZYguUtIDNp/SmpEEAkjfOEOmvadmdFvWn8h18aVVvochY6bOEJJlyjiJY8aYg3
 QqofLxeXoMuz7w+CVrNw954tOHnNugudCFfnXd6NXxexYYA6PLh9J3TVsxL+ccGHlnzb
 6mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909388; x=1691514188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EpDVIlDX2H9hcBKUU2bnV2uAgz8tLVHVeXAEtG+jYc=;
 b=IdAmpDkhYPGsm/D73TLMb0yXjGSQQ0x+tfW4KnxrBBNjW/erAlT1ULrHhC+EAf1Qwg
 cx23oKXj+Lry57tLy9ZUbpJ+JpMMKHcYDcjT1WRtiWNvhz1e8r/ZL/GFtr5YXtAP62fk
 724RyliOXc0Z7E834AhYIyavetudzKYngFA+yUkggDAonYSVXJV5dZs1TRzrz4bO4fU3
 BQ1HFg3UzAG+PORf9qIags7Nhx8nbJMRys0e6sPu7CYUeo90XjuTqhXUY+cAAIHSJqmj
 Mx/kyqbYs6yCkVJvqDhNcPZh60gnB+EuWaFj4jaC+MZaFZyZ4l0tf6gj4TwYZ6X+9EVI
 1SoQ==
X-Gm-Message-State: ABy/qLYxzxHnJcyCnDQz8nUHebjRs9T0h0VhN9+iPbZ41Hx8FoHkCfEk
 s6XBvIL4jJ4bdKZqX3nzCO8=
X-Google-Smtp-Source: APBJJlHD22NIyad1rUCJiM9vnDDanZtWLqeBb86Y7gK7+SSGru+LJO/PR8MDfI6ZS36Oc1EVndTaoA==
X-Received: by 2002:a05:6e02:1c26:b0:348:b910:313d with SMTP id
 m6-20020a056e021c2600b00348b910313dmr13137612ilh.14.1690909388176; 
 Tue, 01 Aug 2023 10:03:08 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 01/22] drm: use correct ccflags-y syntax
Date: Tue,  1 Aug 2023 11:02:33 -0600
Message-ID: <20230801170255.163237-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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

