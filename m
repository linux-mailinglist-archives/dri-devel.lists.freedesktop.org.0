Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828443F41F2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996E989CD3;
	Sun, 22 Aug 2021 22:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC35D89CD3;
 Sun, 22 Aug 2021 22:20:47 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso16407250ota.8; 
 Sun, 22 Aug 2021 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EX0kJLbWPO/gGvtWZrYlXdMUmieVpPmj3inuxYZYEK8=;
 b=X905vpcVix5dUgIXcsYBm48sGOvY6Q9tAbuMJ2FITzzDKkNhvDuVF1Bjpu1CsY2e4B
 ia5jh5z8Dzml8Y6oAhfulLubQTeCQk0gpgNdxvOUxbNf9eVph0fUmjZAtkqEVKzedBOB
 PRaJYB5VS1a0Lfr71gVkdZgJju8OCPzsnlctQijn8TohOgNxIl+NIq33lrVfvGfaCyNj
 0gue81LwfmJdROMdiu+D9KMp5gpcb7wNUeZtAnzZZ5XTxnqj4oOqqlK9rGJ6bRMh0E++
 SpvofwwTSa3O5fGQNKhp6Wd5pBAJgk6/1P0d9AaznKGm5pHG7V7/ctt/vgvr1z6Zq0yt
 BGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EX0kJLbWPO/gGvtWZrYlXdMUmieVpPmj3inuxYZYEK8=;
 b=M+v0iXLTXFckqU7zdPOT7hbhAgVa883Ft2Vy7qxB8AlF0XBD3lw02fF+wx2uRd7Rnk
 vO1JbQx/qI/Mmodm7x75qe0ku2LHfOEhAlOllXLtKTBeccKJ0lMrF7XiaZojbsjWECCp
 zg/rSP3tXE4t9ixYxP6NRULyljCeELQbkP+Jaaf8dlOx0X0jqsK2fQTgPQQ+U9Ygl+VV
 +OnhRaBPTmL5IoOhkLcvH2u4kXgdDVBha7CqgZxrCMjs5JlokY2sPDSThoEUHlIBoMMi
 i0m3vSikWDUR7mHS85dM04Jqv2UiAMGxU27625rML8Ez0dLjjBvBcWy/kMDEG1arYh4l
 FcrQ==
X-Gm-Message-State: AOAM532tokoaZ1KT5Uwz7ElhvFAterp8dnTBDMpjERtSVzwtQ5toyC2e
 XHOfLlwy1QR4Mn29ldkXWHE=
X-Google-Smtp-Source: ABdhPJwE15NCa8WKtdgeR3/dbe7hhgznsV40g1M14s3dtqtT45Pgz97wR93Mn+yQFFpQHuuV4Xgv3g==
X-Received: by 2002:a9d:6c48:: with SMTP id g8mr26939243otq.199.1629670847204; 
 Sun, 22 Aug 2021 15:20:47 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 01/11] moduleparam: add data member to struct kernel_param
Date: Sun, 22 Aug 2021 16:19:59 -0600
Message-Id: <20210822222009.2035788-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822222009.2035788-1-jim.cromie@gmail.com>
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
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

Add a const void* data member to the struct, to allow attaching
private data that will be used soon by a setter method (via kp->data)
to perform more elaborate actions.

To attach the data at compile time, add new macros:

module_param_cb_data() derives from module_param_cb(), adding data
param, and latter is redefined to use former.

It calls __module_param_call_with_data(), which accepts new data param
and inits .data with it. Re-define __module_param_call() to use it.

Use of this new data member will be rare, it might be worth redoing
this as a separate/sub-type to de-bloat the base case.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v6:
. const void* data - <emil.l.velikov@gmail.com>
. better macro names s/_cbd/_cb_data/, s/_wdata/_with_data/
. more const, no cast - Willy
---
 include/linux/moduleparam.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index eed280fae433..b8871e514de5 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -78,6 +78,7 @@ struct kernel_param {
 		const struct kparam_string *str;
 		const struct kparam_array *arr;
 	};
+	const void *data;
 };
 
 extern const struct kernel_param __start___param[], __stop___param[];
@@ -175,6 +176,9 @@ struct kparam_array
 #define module_param_cb(name, ops, arg, perm)				      \
 	__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)
 
+#define module_param_cb_data(name, ops, arg, perm, data)			\
+	__module_param_call_with_data(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0, data)
+
 #define module_param_cb_unsafe(name, ops, arg, perm)			      \
 	__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
 			    KERNEL_PARAM_FL_UNSAFE)
@@ -284,14 +288,17 @@ struct kparam_array
 
 /* This is the fundamental function for registering boot/module
    parameters. */
-#define __module_param_call(prefix, name, ops, arg, perm, level, flags)	\
+#define __module_param_call(prefix, name, ops, arg, perm, level, flags) \
+	__module_param_call_with_data(prefix, name, ops, arg, perm, level, flags, NULL)
+
+#define __module_param_call_with_data(prefix, name, ops, arg, perm, level, flags, data) \
 	/* Default value instead of permissions? */			\
 	static const char __param_str_##name[] = prefix #name;		\
 	static struct kernel_param __moduleparam_const __param_##name	\
 	__used __section("__param")					\
 	__aligned(__alignof__(struct kernel_param))			\
 	= { __param_str_##name, THIS_MODULE, ops,			\
-	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
+	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg }, data }
 
 /* Obsolete - use module_param_cb() */
 #define module_param_call(name, _set, _get, arg, perm)			\
-- 
2.31.1

