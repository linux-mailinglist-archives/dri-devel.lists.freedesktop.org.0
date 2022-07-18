Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00154577B2D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14383A9C2C;
	Mon, 18 Jul 2022 06:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D813BA9C30;
 Mon, 18 Jul 2022 06:38:04 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l24so8516288ion.13;
 Sun, 17 Jul 2022 23:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPNh34U+sqtG6x3Rqc7e7njlWizKyk0P6OLkXAqGKGA=;
 b=CWXNKUl2oC0JpFs9jqDa87Vno3+RLCLA6G0xNcdbl9BsR13Af/NvZhMVBVoe63cJYq
 3R+NWb2lxBavblo6hskj1ilGw69u6auGquaudxOHrEKKnNZ569QiuEkrC2aqB4EwuUYf
 MRnuPjV/0Y7cAAkzYx3FNF6GP+2sAcNFf64Gja6eDowYRKqmWJ/rNj3cTHRtb0SRefbS
 Mvmh3bkuuM8sAtyjy7FIhawYuB3B2cSEkse1sd7i7/0BELbUO5cV64a8VnmlkTk17Wmh
 gLrpCigv3DhBVdHEK7Yt2UtRZfPUElRDIBj9eRc4k8n5I7x1Th0KKOP3un/GC2q0JgOJ
 1jPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPNh34U+sqtG6x3Rqc7e7njlWizKyk0P6OLkXAqGKGA=;
 b=RhFWJ/n7v8JjsgV4DBsiYMsXUMxPbCQ3sC7AQlXm/wenk4or4PQKP2/zqfU3lIVdOR
 YEZXtiDkXJ78FawOVePglrSJNMPN27I0cuQYJWfvQfivVsLIlvuHoDd/A4ikurSumfL1
 4Lt/esh50yRS8Gdrz3+EKJfhyNSYXCyq1iqH5s2mzCWF5X+BD/pawZ9KTeoLFUYDe3D4
 xvgyXRjsCGJzFuUos97Q++A0uE/m+6noXMwuFlJBoJ1dspkJvls8GIlg13o4Enwwgd7y
 zh40/n72YZYJD1VN32hJNn041VO+XLmC8+ZzOV+Jw8KL+HyA9plspdjrjNi1zhLQRDXe
 5nKQ==
X-Gm-Message-State: AJIora87jYdt/PSaWEV48jMSyCTzrk7GVhIVhxGKV0dCCA9JU8/NULZg
 iq8H//8Mr/l/OyuY3/8d3hI=
X-Google-Smtp-Source: AGRyM1v/pX/7Q8RmuMwku5MwbEOexJrr5+k20FEB1/CnVJgnuaZGT4QPo0FJy0hNYZERNtFzRe3RIA==
X-Received: by 2002:a05:6638:d54:b0:33f:8e41:a3b3 with SMTP id
 d20-20020a0566380d5400b0033f8e41a3b3mr11626785jak.251.1658126284089; 
 Sun, 17 Jul 2022 23:38:04 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 02/41] dyndbg: fix module.dyndbg handling
Date: Mon, 18 Jul 2022 00:35:46 -0600
Message-Id: <20220718063641.9179-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For CONFIG_DYNAMIC_DEBUG=N, the ddebug_dyndbg_module_param_cb()
stub-fn is too permissive:

bash-5.1# modprobe drm JUNKdyndbg
bash-5.1# modprobe drm dyndbgJUNK
[   42.933220] dyndbg param is supported only in CONFIG_DYNAMIC_DEBUG builds
[   42.937484] ACPI: bus type drm_connector registered

This caused no ill effects, because unknown parameters are either
ignored by default (with an "unknown parameter" warning, see below),
or ignored because dyndbg allows its no-effect use on non-dyndbg builds.

But since the code has an explicit feedback message, it should be
issued accurately.  Fix with strcmp for exact param-name match.

Reported-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Fixes: b48420c1d301 dynamic_debug: make dynamic-debug work for module initialization
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..f30b01aa9fa4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -201,7 +201,7 @@ static inline int ddebug_remove_module(const char *mod)
 static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 						const char *modname)
 {
-	if (strstr(param, "dyndbg")) {
+	if (!strcmp(param, "dyndbg")) {
 		/* avoid pr_warn(), which wants pr_fmt() fully defined */
 		printk(KERN_WARNING "dyndbg param is supported only in "
 			"CONFIG_DYNAMIC_DEBUG builds\n");
-- 
2.36.1

