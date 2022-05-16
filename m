Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4AB52943D
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FDD10EC6B;
	Mon, 16 May 2022 22:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E9C10F090;
 Mon, 16 May 2022 22:57:17 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id d3so11532957ilr.10;
 Mon, 16 May 2022 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFgHG2tewJsN9CYAlq+NJbyhVM4qxnXd9vUi/EQochg=;
 b=APwWUbR7WCm/vV2bYkZXreJGyjTXBdujWBM/SmErqdwxgUV0hDj0LLMU6s9poeH5iT
 FXKjac2KPaRmv5i79zC0mhsAUsVXiwZqRh6viD88comH/LsImmGjEPd5EKvJJjjGwetm
 dtdMPDlrGdED1Igfq+1ncnqB3mLuF8AnEA9mwLdvjf74BU6/WlsaIU1uqRVA/gkYJFFJ
 xzX5VE9gHbP7E5WIC99KeZ8T7SwN6qhNeEUFjOZvi3imC2ZnFxskOMGw/wC7PKgEVeW4
 mB7B32fpSnKhf5ymmcNfiMKYx2Mfx1TPQo9gLZcNV3R/rJU9tIZ4TCYpnFCG1zTWOu3n
 UjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFgHG2tewJsN9CYAlq+NJbyhVM4qxnXd9vUi/EQochg=;
 b=0Ls9D6YOU7tIDczTra4OsV/pvn8BEwf1fu0eitGmW6xEKnVWzE+xUU+cWTCJUa1UnH
 WXhJp1W3Dyxmu8LuHnxe0ngz7TbtzJ8h9KHDrVxhRgiVF2Y/QctFaOx1Pl11xRHiy2N2
 +xlWgFYACQsSj9JGZV2UVorXQUv7Vrt6SC3IHy91biucIRWJnCUQOYUfpreWoX5oHbFl
 pBoN33Cqxx/T1Rz/uN6oz6pNySo8EwjshUAb8mB6Eqhr1Y0gpZQcL6b2qU10/I3dAryR
 pPgZ8tA7VAuYDHC959Je598pPQmhlYTiPgTGM7pR2f6v20kXrr4cceVR4XyWP/BJyyGi
 KMtA==
X-Gm-Message-State: AOAM531ku8AI3f8ZzCWNcVVUsJ32HguwPPW5xCm1akkTlzk2tfFY5UuL
 dAHClZJkKnnK3QS77Qbz37k=
X-Google-Smtp-Source: ABdhPJwTljlWB+rSMPzyqgN07gjHdFBLaJfrHnMONzCrRckPACxxE9mLZ+oS1CTCjNd2OY7YFa1OSw==
X-Received: by 2002:a05:6e02:1587:b0:2c2:5c48:a695 with SMTP id
 m7-20020a056e02158700b002c25c48a695mr10131603ilu.169.1652741836722; 
 Mon, 16 May 2022 15:57:16 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/27] dyndbg: add __pr_debug_cls(class, fmt, ...)
Date: Mon, 16 May 2022 16:56:26 -0600
Message-Id: <20220516225640.3102269-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For selftest purposes, add __pr_debug_cls(class, fmt, ...)

I didn't think we'd need to define this, since DRM effectively has it
already.  But test_dynamic_debug needs it in order to demonstrate all
the moving parts.

Note the __ prefix; its not intended for general use, and doesn't
include any builtin-constant checks that could pertain.  I'd prefer to
see a use-case where copying the drm.debug model isn't better.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index e9e6d0f503f3..abf43e28d8d3 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -216,6 +216,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 					_DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
 
+#define dynamic_pr_debug_cls(cls, fmt, ...)				\
+	_dynamic_func_call_cls(cls, fmt, __dynamic_pr_debug,		\
+			   pr_fmt(fmt), ##__VA_ARGS__)
+
 #define dynamic_pr_debug(fmt, ...)				\
 	_dynamic_func_call(fmt,	__dynamic_pr_debug,		\
 			   pr_fmt(fmt), ##__VA_ARGS__)
@@ -246,6 +250,9 @@ struct kernel_param;
 int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp);
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp);
 
+#define __pr_debug_cls(cls, fmt, ...)		\
+	dynamic_pr_debug_cls(cls, fmt, ##__VA_ARGS__)
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
-- 
2.35.3

