Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647C529468
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAF610F760;
	Mon, 16 May 2022 22:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162D10F279;
 Mon, 16 May 2022 22:57:27 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e3so17604991ios.6;
 Mon, 16 May 2022 15:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=275OPBiQ2XPDTBRqKvoZzw/+Pf2YOYW8BZL5aogRIAM=;
 b=erXw/YodA3OXO6nPINUovqh61wUerUIUtr0unKej/ygKy09BntPa7b2Ga/snFnWqRN
 mtoKDgBhHIuI18S7owrD22QKbctFTy/M6o9shAJ6+0ouzudUyjANzXNDMc0Q3hIV+f5q
 XnYixuoQFoJZCiCQDsXoPHqPdfWbeEA0c/7106IbTnzOiTQOCS35fre1X9yfUACWftd8
 LgQfxHSO1ccHM7ZFABS+oM9u+ZYIQfZXUVXowulqyibhSPLwsJiSFjdYhvpsOOygWG+u
 n6kLxDSr0CYelPk7OPO3/RynfWIFOXZ/aAUWpWWu1hoV6RWlrK08yikqaaHJMadlmP8H
 L6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=275OPBiQ2XPDTBRqKvoZzw/+Pf2YOYW8BZL5aogRIAM=;
 b=My5MC/ELjX8A4W3l6x7SCU9L8Chi/yvUfPHLfAOhL3lxt8SsrdQaWgGXThRjZR9nSB
 S1Iij5VoROjvaoIyEuG8Laf6ksGNtM8ZG0Rj2CPHT+hyl7FUkTQzM4OPNTc5ikd5XpLj
 RLXEDN7OyuwwdW0LJwlRICSfCZeOhldiZ+OIwlVUWzf/1VSWJNy2pedTNm9oUNtdGGB0
 /uRdXHf5CQ/HQJndGfBM4p8GdkPNjuYMtdlmgqEjchfSYMYOkS97PaXsoa6ZJDmypUXS
 bv1p5l14mJju7x0dKGsY9OiEcevWpD2eaQzs/oUDvWBTKJeCHSSbQWnyrum4utsrf9MS
 2cgw==
X-Gm-Message-State: AOAM532iq52CH1+i25vLdgZKbqz97AKEJNupC7qzjeIJI2wRdXqKCZpt
 k8Pqb5AyzxfwTHeAASxtIqs=
X-Google-Smtp-Source: ABdhPJz8ja5KMGhfVRvrrgjeLgWG6Cp8mO/6M9ENzbru9N3/0pmPE3IQ+As/ImX5TSoW3EuTo0LvtA==
X-Received: by 2002:a05:6638:b:b0:32e:3b8d:3e5d with SMTP id
 z11-20020a056638000b00b0032e3b8d3e5dmr2979106jao.91.1652741847355; 
 Mon, 16 May 2022 15:57:27 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 21/27] drm_print: prefer bare printk KERN_DEBUG on generic
 fn
Date: Mon, 16 May 2022 16:56:34 -0600
Message-Id: <20220516225640.3102269-22-jim.cromie@gmail.com>
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
 462583   36604   54592 553779   87333 /kernel/drivers/gpu/drm/drm.ko
 462515   36532   54592 553639   872a7 -dirty/kernel/drivers/gpu/drm/drm.ko

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 22b7ab1c5c40..1b11a15366b7 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -23,8 +23,6 @@
  * Rob Clark <robdclark@gmail.com>
  */
 
-#define DEBUG /* for pr_debug() */
-
 #include <linux/stdarg.h>
 
 #include <linux/io.h>
@@ -172,7 +170,8 @@ EXPORT_SYMBOL(__drm_printfn_info);
 
 void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
 {
-	pr_debug("%s %pV", p->prefix, vaf);
+	/* pr_debug callsite decorations are unhelpful here */
+	printk(KERN_DEBUG "%s %pV", p->prefix, vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_debug);
 
-- 
2.35.3

