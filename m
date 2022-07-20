Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E257B9CB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220F8EDD5;
	Wed, 20 Jul 2022 15:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC0C8EDD5;
 Wed, 20 Jul 2022 15:32:57 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n7so14536512ioo.7;
 Wed, 20 Jul 2022 08:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPNh34U+sqtG6x3Rqc7e7njlWizKyk0P6OLkXAqGKGA=;
 b=ZIYeJrysPQpFf3pGaSYo4BJNjXIEeR6rQRYbtMg6XTDQiIGgeVljsQF3GWdfbfIvTB
 ziV30c0Z1FIoZMUKpHuhJwGMZL60U/YQqniGO7GvYSI4zZAUAPmgmoWwrH4VPoSAmJh7
 i0c3bjLZlkkVeEK8KaGCq0nCPwYPdH6X/GfQzcwMtPrCf/DNGdaQHFvRSSlJHiQn2xT3
 c3bhZ6N/mE6PRIyqSloJQ4VD+5LQBU+ucYrz/PCXsCvEjsr9LetwNQAg7+Ofxd2U7MGW
 Fj8uufqjr9SXmUFYNVaT+DlAYlsCfaujD2BRhxm5GOiuUrSrLonSuwlEPDsjaa9DM+as
 O5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPNh34U+sqtG6x3Rqc7e7njlWizKyk0P6OLkXAqGKGA=;
 b=qD5UnbAT3xqoSvRVOJqyo0Cvb94TeFbg3Mbyf0REfFRfZSyeogsxy+3gInaz0qCPou
 81tnHiJN1Iz+YW5oMkay2rjM1n7Yn6zTg8jyfIUmQ1vHQ2hoeNiTz5ZqxTXcJzppxAS/
 u9Wm/QfmDia8csXT3RzDgY9M0j7Rb8Sgk91KhoSyIK5FW9IGQxwwwzUe+jBXcl+9GLiz
 +FP9t9pMyXJFi3OC3+AM2gnkruipmmccXCsZd8NAeGvtaZtCfoTn/tVXfD9yBZSILAB/
 7Nqk3hon2eVh7W8EbZaEYCNKukkRyrid7fyywfJLIjJ5oA3zzNSPhl9jyI434qrMRjHf
 9ySw==
X-Gm-Message-State: AJIora/XbMsFHOOcKnV+Z8oSjzIRGNDNnKZK3LwHtlPH2j9L7ff0pD/1
 tacDdqvBb29XKU50+u33srhKY1QQhE3Xqg==
X-Google-Smtp-Source: AGRyM1stJYq4q8rMxuTj7cBJdviq+nbyU7N4d+960oyxYVu6BYP4Zle7oLFZlR7a+jqT2vYKrud4Jw==
X-Received: by 2002:a05:6638:1b09:b0:33f:6d9e:89d0 with SMTP id
 cb9-20020a0566381b0900b0033f6d9e89d0mr20104525jab.113.1658331176135; 
 Wed, 20 Jul 2022 08:32:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:32:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 02/41] dyndbg: fix module.dyndbg handling
Date: Wed, 20 Jul 2022 09:31:54 -0600
Message-Id: <20220720153233.144129-3-jim.cromie@gmail.com>
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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

