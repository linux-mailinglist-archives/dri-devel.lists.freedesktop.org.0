Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1A5293FF
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C8610E7EC;
	Mon, 16 May 2022 22:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC35F10E66F;
 Mon, 16 May 2022 22:57:04 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id f9so1820998ils.7;
 Mon, 16 May 2022 15:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PoO/FHr0Tzfzf5P1B6XW1SDDzBeQTtD4lR71J35fVB4=;
 b=hc4BLkqpCT9R4W4i7l0zefNNlEKY2zz43aOLOytEmIYryaqtFTXD70GWmf0k7ytBSm
 PJqH1duNIjfaYz/dZu9lsTxRmq5rdkLB7Z5H4aiGjvlDvnq1O/sJxzCKbR9TGOBycAyj
 YdFdyAGyiRyLaUCLyQnuZUzm7eymIHnN13wrUv+Ew5wXPQxZhXnhhBOfw7exNw7pSQSz
 XNO3vMkVaXZUdfkfQSkLejRUdXE3fHM5Z8+efXpPJh3fM+yEvN81wzneSgdN2aB6Y8Iy
 3gppEV7yEv86QkoDdeYF3eQZNX5wy+pbp41VoYuA9IxX4Md64KSW12G9/JddFlYNgSEn
 8HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PoO/FHr0Tzfzf5P1B6XW1SDDzBeQTtD4lR71J35fVB4=;
 b=tuV/LqkrP7kDgWVcqhHcaVfWFwB/ylXwUVNjKedFC7AVzZi16Q400jtq6/yRcI2zVp
 ITaNDecJ1pLZjPKhM5pADDxfhl/vAC9BKrYlNStPm9IKKaCc9uAQZj2KYONvVt7LugH9
 CTZWxTMrVRw2ib71alZ7F8thdelpMN5Ipq9BHn8UiAXMUsZ2KDV4yu0LOUzE1wTP+r95
 AdJzS9+iaJFR90epLWdBdgA/NVV/LLcM5D3MtF3oOgwnH8G8bJskpGxxU0OG5dh2QvVF
 ZHIG2YBPcv14E8AhOGM/neMGZ6xqpKytmhlo3fBvl5kKkXXXhaEhEUg/Q3+1bGby+c0Y
 JhLQ==
X-Gm-Message-State: AOAM53116xPPsd47C2WtHhm9KRU/EPTDwQmA8y4KBT/h9AcFe/WcleHY
 X+NUY5e734Ty2Ui456P4VHo=
X-Google-Smtp-Source: ABdhPJwuNA8eYlVKbPRsQ7MSW422HjHltNMa6MYgzwzBN3oyRsIKn3be980+iuLjBzfHqKn+YxCiwQ==
X-Received: by 2002:a05:6e02:216c:b0:2cf:3b9f:72c5 with SMTP id
 s12-20020a056e02216c00b002cf3b9f72c5mr10013301ilv.225.1652741824045; 
 Mon, 16 May 2022 15:57:04 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/27] dyndbg: fix module.dyndbg handling
Date: Mon, 16 May 2022 16:56:16 -0600
Message-Id: <20220516225640.3102269-4-jim.cromie@gmail.com>
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, rostedt@goodmis.org,
 mingo@redhat.com, mathieu.desnoyers@efficios.com, quic_psodagud@quicinc.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

That said, the code has an explicit feedback message, which should be
issued accurately.  Fix with strcmp, for exact param-name match.

Here is fixed behavior:

bash-5.1# modprobe drm dyndbgJUNK
[   20.127473] drm: unknown parameter 'dyndbgJUNK' ignored
[   20.128835] ACPI: bus type drm_connector registered
bash-5.1# rmmod drm
[   37.961656] ACPI: bus type drm_connector unregistered
bash-5.1# modprobe drm dyndbg
[   42.933220] dyndbg param is supported only in CONFIG_DYNAMIC_DEBUG builds
[   42.937484] ACPI: bus type drm_connector registered

Reported-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
2.35.3

