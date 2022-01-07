Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4748728E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF91B113254;
	Fri,  7 Jan 2022 05:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A3211322E;
 Fri,  7 Jan 2022 05:30:08 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id u8so5832527iol.5;
 Thu, 06 Jan 2022 21:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fs9SXvpvEEnkA+pZj7l54+pYQd7M1OVNoq6NoKKp5pE=;
 b=BPvCeyaEsfkyYHJplLo278shtoIIb9ttoxvNbZHAmTThf0T7b3rtFx2a9vUqNjwfch
 nioeXn9/nQgokrJmOmYK7+lr0g8nICaJBJ3Q4VI6rRotAKLBeTIMbxum2W3CpjVblIYE
 M1NTdeWOTZn7ugu7aIsCs4JuwjgHyVnQTbaPdKo4G+cox7pD7igqayZaElp86ZUk496Q
 kL7oKgoL7MofSKtlH8pkHPDrmGVacnLJTs3AuN2KCdUUYu5tRSweIKgg7xAq1gdSJjnK
 JtZZ+tfuAwxsJ0/GoTVV2w7fUuyWt5NZSSib698HNisxorA4k54ln+rMEUBH9shuVVKj
 Ut6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fs9SXvpvEEnkA+pZj7l54+pYQd7M1OVNoq6NoKKp5pE=;
 b=sOsujmx9RmbV+wOQUgoLOgbwddh+l6AYFDArRd4CVj9mlpgWeHAgRvTjMAxTbYfCNY
 61UH8m69XEoIW06d9THfJiPE37dBXpipzhGUc0uqQ6H6mp3li4aCjH/uXUKSL93ikO4v
 dNAoNlJHKwc9qThiJAT35wptKFYqSo9rRaZlyKQ9qFemJBxZpaVVSKoJcmW+d/p7Epno
 c5d5C/5YxHOTmOD+KAzcfCHi4VpmO4QKdZGxg5YVDBMYjfFI8sX0UEa2RWB4Ts+avVcG
 2scDVg8xLILl4KtnRAcvygDpPE3+HFBxkjq6V+tEpfQJxs5YgDv7Sy3LUkgwaIRXihLK
 gt4g==
X-Gm-Message-State: AOAM532zy9mBPeWI0NL0HCk0D294aBokzrHizUdWquJERk8E01AYPnmP
 DMqmUAQxNAgfQ7TY7TbcoGA=
X-Google-Smtp-Source: ABdhPJx7+AElBptGJel+f8XWKrTSvq1aQzmSbXkyUTKq/TkWKsGnfjRusoZRcHuw2zq/ku/ipdX6lA==
X-Received: by 2002:a05:6638:1244:: with SMTP id
 o4mr26844964jas.80.1641533406977; 
 Thu, 06 Jan 2022 21:30:06 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:30:06 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 14/19] drm_print: prefer bare printk KERN_DEBUG on generic
 fn
Date: Thu,  6 Jan 2022 22:29:37 -0700
Message-Id: <20220107052942.1349447-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.c calls pr_debug() just once, from __drm_printfn_debug(),
which is a generic/service fn.  The callsite is compile-time enabled
by DEBUG in both DYNAMIC_DEBUG=y/n builds.

For dyndbg builds, reverting this callsite back to bare printk is
correcting a few anti-features:

1- callsite is generic, serves multiple drm users.
   its hardwired on currently
   could accidentally: #> echo -p > /proc/dynamic_debug/control

2- optional "decorations" by dyndbg are unhelpful/misleading
   they describe only the generic site, not end users

IOW, 1,2 are unhelpful at best, and possibly confusing.

reverting yields a nominal data and text shrink:

   text    data     bss     dec     hex filename
 462583   36604   54592 553779   87333 /lib/modules/5.16.0-rc4-lm1-00008-ged3eac8ceeea/kernel/drivers/gpu/drm/drm.ko
 462515   36532   54592 553639   872a7 /lib/modules/5.16.0-rc4-lm1-00009-g6ce0b88d2539-dirty/kernel/drivers/gpu/drm/drm.ko

NB: this was noticed using _drm_debug_enabled(), added earlier.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index aab29dd6cad1..b911f949af5b 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -23,8 +23,6 @@
  * Rob Clark <robdclark@gmail.com>
  */
 
-#define DEBUG /* for pr_debug() */
-
 #include <linux/stdarg.h>
 
 #include <linux/io.h>
@@ -165,7 +163,8 @@ EXPORT_SYMBOL(__drm_printfn_info);
 
 void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
 {
-	pr_debug("%s %pV", p->prefix, vaf);
+	/* pr_debug callsite decorations are unhelpful here */
+	printk(KERN_DEBUG "%s %pV", p->prefix, vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_debug);
 
-- 
2.33.1

