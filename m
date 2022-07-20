Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066D57BA37
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CB48F559;
	Wed, 20 Jul 2022 15:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD428F23D;
 Wed, 20 Jul 2022 15:33:08 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n7so14537087ioo.7;
 Wed, 20 Jul 2022 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ujNUtXONPnMVcLXef+++mbRuDWoeb2nKdw2O66vA/k=;
 b=OVAp6U+A3bTUFTFxx0gnyP2NsvAZ1BsQNqNbWZ2Ks3TgvyvXUr/+FW599T0r0yj2iD
 Aq1SzcdGG3HOeZ7u8ZYVVyRNnh78/bVLcm6rvHJfgpPB4aZWYk8ynvffDyb/Ze++NmBx
 1Svo3kKZy65sCY8dfIFMZGeD+c6tso1SEHz0aH76v4R6hiOMCu5e8fBUSIVIuZXKEgP3
 HyLRBI5BGL5vXc5hJOQVrqpk1onW4N+Dn62bLcPZZUqdxvX2yKwjnGM3XcDCh6PkRNrM
 CyLOAOShrGWq+CmQbK2BwO1izvyjW+2EO8NncvxOgnDbswvglj2Hg2Q0H0WC3sWAAJJ6
 ofMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ujNUtXONPnMVcLXef+++mbRuDWoeb2nKdw2O66vA/k=;
 b=RNjJ5IePHMUGOcdQ2dIO0JMZZVuOfdQaAaJMu+gqlPzPvAMEM7M6EO25kMOTXISSRu
 PWPg6YW2V9FWJQOO96q+JUmvXFSXZ7p1JOQJolpWtjJKGGuoMWFuZ4C4wlLhRtYAeP/d
 ilrjNVf0/KskxXnVlwbfwx/IQJrP6ItfaL5X3bS5igeK1vHd3EXlT6JlckVDYdqNmX2G
 DEMFjLXhZS054kTMHKCDmu3R9POR3RXzuENmh3iWnNnAxffN9qkr/0Yyyz10ehKEW1sC
 L0gwOgHUJ8lDJvAffUTdjEAIxygjps5g3cLzDubdZGiqPVHuKMlkzWqODiaz8AmSXvPd
 1ltQ==
X-Gm-Message-State: AJIora8jAqT6mDvC6A8EM/xdvfKfosDGwmLiCOQtiUuiA/khI21Lj6XY
 m40D/NaXhaLM+utB9AFn//ZPMK6bhI79jQ==
X-Google-Smtp-Source: AGRyM1vbeD6gsXALczpMOneWlzruDjgfZLxUh7rc9V3cIc/ITF/nEdtv1SpWy6J9C7Zz2FtgylVvrA==
X-Received: by 2002:a05:6638:2614:b0:33f:5bc2:b385 with SMTP id
 m20-20020a056638261400b0033f5bc2b385mr20284885jat.246.1658331188155; 
 Wed, 20 Jul 2022 08:33:08 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 11/41] dyndbg: add __pr_debug_cls for testing
Date: Wed, 20 Jul 2022 09:32:03 -0600
Message-Id: <20220720153233.144129-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

For selftest purposes, add __pr_debug_cls(class, fmt, ...)

I didn't think we'd need to define this, since DRM effectively has it
already in drm_dbg, drm_devdbg.  But test_dynamic_debug needs it in
order to demonstrate all the moving parts.

Note the __ prefix; its not intended for general use, at least until a
need emerges.  ISTM the drm.debug model (macro wrappers inserting enum
const 1st arg) is the baseline approach.

NB: it does require a builtin-constant class, no __pr_debug_cls(i"",...)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d1429812be2e..0f7ad6cecf05 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,6 +217,13 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+/* for test only, generally expect drm.debug style macro wrappers */
+#define __pr_debug_cls(cls, fmt, ...) do {			\
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(cls),		\
+			 "expecting constant class int/enum");	\
+	dynamic_pr_debug_cls(cls, fmt, ##__VA_ARGS__);		\
+	} while (0)
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
-- 
2.36.1

