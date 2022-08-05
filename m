Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268EB58B19F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10C912AD89;
	Fri,  5 Aug 2022 21:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE08931AA;
 Fri,  5 Aug 2022 21:54:15 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id c185so2856651iof.7;
 Fri, 05 Aug 2022 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dW/qowRKwpSX+eB9zQgpcFjLzbW7/9zpGPg2Go1FHeI=;
 b=pQqact85NoRb+xtdb4neqHJ2MSf9lwR+gCDz0zUVVjYSEELKbLwImAE6CSqgl+Q4XM
 /dOHKlBwUpeC9a8Kj6oBimwhLi3DHsK4O7zQm0pwLrcX3ZopEjW6HZIbh6YyUFVaafZr
 5szL5MQBQwSMH6R3xf437A6KKteGEzAGGiy7gbo8AlKfmlJRbUz1IBy9CwCiAbuPknfT
 e4D/JLSz4pesGI29pQZJh6dO5qlsWwfDg/FTM/7hrS1PjqPn4Ghoe084pBnGzOmJ/PYX
 0xmtTY4hBf2zQIPotw1GI23q+epE7LZx9a7RP/txZjlmC6Ra0OXTYFDlot7BqDZmDYEk
 VVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dW/qowRKwpSX+eB9zQgpcFjLzbW7/9zpGPg2Go1FHeI=;
 b=wzdXhDGHT5op8lvA60RqdXWK0e0/C12oDmGzct3bcE9YaycbqhWJlL2V9OZTIawcA+
 CEB6s1AlfH2M/Qx/GE8hReu09Ij2gXC1QZVBtFIynNyO+2LIQVEFmoQWWchohecoP4/o
 /gzlnOy81HpwAX+ungS5xZUNVW+JcctuTEGaF5lx66z6JPoqQ5yuQ1PZMB9rruaKZ8L3
 vFGFQSd/COsOvLpvd9IMBtXFjIAcCsxkvKZi+947dTh3c5WYln4KyqJ11m4SgIigEOid
 TD6x0HV+Efi2Xw4j5na6iCDQ50fziMsyFPX91bg7f5NJa526qSB7/h312CvWmFalpbCe
 qVJA==
X-Gm-Message-State: ACgBeo2V/t79MCP6rTLDNWl5ORSUSwIQ2n+N6g4BXzKt3aQelEPzBSCu
 YJeykA2cRueySELRqmxWZSs=
X-Google-Smtp-Source: AA6agR6g0h/uRqkZBCEfyjVwXC4v1QUrTS31if9Ucl65W+giIN8r0CzRcZcoL+STwGJBx/6L7Fqtaw==
X-Received: by 2002:a05:6638:3792:b0:342:b241:13c2 with SMTP id
 w18-20020a056638379200b00342b24113c2mr3231037jal.257.1659736454304; 
 Fri, 05 Aug 2022 14:54:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 02/33] dyndbg: fix module.dyndbg handling
Date: Fri,  5 Aug 2022 15:53:24 -0600
Message-Id: <20220805215355.3509287-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For CONFIG_DYNAMIC_DEBUG=N, the ddebug_dyndbg_module_param_cb()
stub-fn is too permissive:

bash-5.1# modprobe drm JUNKdyndbg
bash-5.1# modprobe drm dyndbgJUNK
[   42.933220] dyndbg param is supported only in CONFIG_DYNAMIC_DEBUG builds
[   42.937484] ACPI: bus type drm_connector registered

This caused no ill effects, because unknown parameters are either
ignored by default with an "unknown parameter" warning, or ignored
because dyndbg allows its no-effect use on non-dyndbg builds.

But since the code has an explicit feedback message, it should be
issued accurately.  Fix with strcmp for exact param-name match.

Reported-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Fixes: b48420c1d301 dynamic_debug: make dynamic-debug work for module initialization
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Acked-by: Jason Baron <jbaron@akamai.com>
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
2.37.1

