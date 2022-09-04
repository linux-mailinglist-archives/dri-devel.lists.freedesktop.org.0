Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133215AC701
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2857210E23F;
	Sun,  4 Sep 2022 21:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED28A10E140;
 Sun,  4 Sep 2022 21:42:22 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e195so5690458iof.1;
 Sun, 04 Sep 2022 14:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9SzKct1HE2F9SFFHU0qV3d4yTS+Vy3tZKPhpRiWkMoE=;
 b=keVbDAqmRl0RyYCgYBZ9vpqCQmkMyk7el0JhW316fk9lzXS1Qp8s1NvY5dl+0KhmSp
 ibqXTnOnHqVsgbVNxEqbtv43vgYRsJvWCMIHnYD2MdOnweaxtJ/6lJmRUKioxtauNnK3
 MAOa5YY5NhAaVnZUHf9WjVTMmFZFR8zfXvqsn6ug0qyuxgGFFgrtJhQLojNKtMyGeGVu
 +yc9Lpue47auQ2O1yq9JKZ+AL+lsysQCM4CP52NRtG4YNpaMNSOR2BmwDKNu/vEgwcNy
 CzChZLaOzOawknlDJ4jxM+ihj0KwR+efhIg2T10h1eobX6skVdqLap7sQsWzIfHZi9ST
 UvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9SzKct1HE2F9SFFHU0qV3d4yTS+Vy3tZKPhpRiWkMoE=;
 b=MJqOY3vUCTIeirzHwFXaYmcvYDeo2kaKFQkPCgr6IxA9KYbxj1yTHGvoYvDQXVXicH
 O2OBwLt4HVLvKKecAy4tlP6UotjtxervYfH79QIG4kC6s5qN+pj9p0KTk/C4Zkp3Khc2
 HBMWaVqYpmT3Xn8xomjOmbZ8aRODLb4swQsIdec98bVRqlMs0ua02azLiyIL0uufpYA4
 sb4v2boSQak0JaGSPc/nnI23xn0SJy5lNjw09/1VPRh6FIiSI/HvklWnuF/bkUfmG6zJ
 GOeALwzjBcFlBH/LOZxxZu8xVSpTsnmLtxXtRlCgKabSsevWyEaEe6dNbuEEpoXpdI1N
 qOxg==
X-Gm-Message-State: ACgBeo3rCDzaEDobkh5nsxUUrdiZyFqtVzoufTE4BAf8D0NJmmXNVChy
 LcNJmaRUCVgnMea7RkIxGYw=
X-Google-Smtp-Source: AA6agR6jMolGXndfzGgA0ZvJd/LMfHAfLgpxQDVqtziCymaTm3c0Mj4mJvOTk/aEeCbTagH4y5NkEA==
X-Received: by 2002:a5e:8407:0:b0:689:ff32:84d3 with SMTP id
 h7-20020a5e8407000000b00689ff3284d3mr21836771ioj.180.1662327742655; 
 Sun, 04 Sep 2022 14:42:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/57] dyndbg: add __pr_debug_cls for testing
Date: Sun,  4 Sep 2022 15:40:50 -0600
Message-Id: <20220904214134.408619-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For selftest purposes, add __pr_debug_cls(class, fmt, ...)

I didn't think we'd need to define this, since DRM effectively has it
already in drm_dbg, drm_devdbg.  But test_dynamic_debug needs it in
order to demonstrate all the moving parts.

Note the __ prefix; its not intended for general use, at least until a
need emerges.  ISTM the drm.debug model (macro wrappers inserting enum
const 1st arg) is the baseline approach.

That said, nouveau might want it for easy use in its debug macros. TBD.

NB: it does require a builtin-constant class, __pr_debug_cls(i++, ...)
is disallowed by compiler.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 633f4e463766..3c9690da44d9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -221,6 +221,13 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
2.37.2

