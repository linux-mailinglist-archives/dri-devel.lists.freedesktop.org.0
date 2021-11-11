Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F7644DD9F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC296E97E;
	Thu, 11 Nov 2021 22:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F436E94F;
 Thu, 11 Nov 2021 22:02:35 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h23so7204276ila.4;
 Thu, 11 Nov 2021 14:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVDfl7PAAJaLkVdQfsH1Ap16lLUYnqL6SHocbYPYy0A=;
 b=QIaAOKQD3K6w68OGcvhtdX8JJHS9l6Ts1A8K/I1zgB4iL/DMasjJKvKpUZiJn1DlTW
 sa0BifWTQb1oeG02aPFxLvqh2unuTcVXWbAzqEr80b3HhoV5SsPzK84ueS8GCp0DV6uL
 OGpqptjAjo5s9aFMe8+pXhQqgl/sLqGCD/Pg+4tinvrnrFWjxYzFujslKtgmGdhMzFYc
 /1KZvL6ckuLggzF0oJa7dW0aNrAJ1HdUarze0Tbn877MWur1Sk2TfcRX7OFRFmMBwH69
 KpXmsseNM4u17L1pOPgdKUop2RKaQEc5wb9qx/AldTDEPVfgGQjx83qgV9QkgTyACnHa
 WZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVDfl7PAAJaLkVdQfsH1Ap16lLUYnqL6SHocbYPYy0A=;
 b=CpomUAFZOxofCpEqJohAiN0GKiy5H5GHSZ9sMLXB7XzrZnnibFg7QEUQFDSvEiRRHF
 TpOoQhknICqN1ZLBErKkPVrzE92J5KYdTZjSy9CxPXqdvYGL0IpjZlGuahYVH9yHGoSG
 auH13+T37mWvzwswXJWE7e0Z6YuSHFKEE8gzCvYbB+UFNwE5QVvEfxmKRJrXVJG1ZaX8
 K+Rw9Bbv3Xu0LyGpgyvNWQP+EgWU9C4AIYD/t8Z0OJKryYJ5oVscjenOIgikkSNm3WKg
 xZW0F/idbEwT4Wte7ST7cgYEowwdcFnz92UdelMFfPBIxtpfvkKjQ8Dk+UNAB1FKs0f6
 BOeQ==
X-Gm-Message-State: AOAM5317rXzxu6je5VGXaRngAhwmh9qF22chNAcUWbXiTL3s9C7IQP0e
 sILVsiR7qwe0DgcgYAfBHuU=
X-Google-Smtp-Source: ABdhPJzYkCLrsFr8YHPHR/GOuUjhp5MAi9XjfhqQa6ueQHpc0HfFVmpFa0g7rZgW2hHn0w7x56LbLw==
X-Received: by 2002:a05:6e02:194e:: with SMTP id
 x14mr6316649ilu.245.1636668154621; 
 Thu, 11 Nov 2021 14:02:34 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:02:34 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
 sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 05/10] i915/gvt: use dyndbg.BITGRPS for existing pr_debugs
Date: Thu, 11 Nov 2021 15:02:01 -0700
Message-Id: <20211111220206.121610-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
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

The gvt component of this driver has ~120 pr_debugs with formats using
one of 9 fixed string prefixes, which are quite similar to those
enumerated in DRM debug categories.  Following the interface model of
drm.debug, add a parameter to map bits to these format prefixes.

static struct dyndbg_bitdesc i915_bitmap[] = {
	[0] = { "gvt:cmd:" },
	[1] = { "gvt:core:" },
	[2] = { "gvt:dpy:" },
	[3] = { "gvt:el:" },
	[4] = { "gvt:irq:" },
	[5] = { "gvt:mm:" },
	[6] = { "gvt:mmio:" },
	[7] = { "gvt:render:" },
	[8] = { "gvt:sched:" }
};
DEFINE_DYNAMIC_DEBUG_BITGRPS(debug_gvt, __gvt_debug,
	"dyndbg bitmap desc",

If CONFIG_DYNAMIC_DEBUG_CORE=y, then gvt/Makefile adds
-DDYNAMIC_DEBUG_MODULE to cflags, which CONFIG_DYNAMIC_DEBUG=n
(CORE-only) builds need.  This is redone more comprehensively soon.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/Makefile    |  2 ++
 drivers/gpu/drm/i915/intel_gvt.c | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 660bb03de6fc..0fa5f53312a8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -317,6 +317,8 @@ i915-y += intel_gvt.o
 include $(src)/gvt/Makefile
 endif
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 4e70c1a9ef2e..efaac5777873 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -162,3 +162,41 @@ void intel_gvt_resume(struct drm_i915_private *dev_priv)
 	if (intel_gvt_active(dev_priv))
 		intel_gvt_pm_resume(dev_priv->gvt);
 }
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+
+unsigned long __gvt_debug;
+EXPORT_SYMBOL(__gvt_debug);
+
+static struct dyndbg_bitdesc i915_dyndbg_bitmap[] = {
+	[0] = { "gvt:cmd:" },
+	[1] = { "gvt:core:" },
+	[2] = { "gvt:dpy:" },
+	[3] = { "gvt:el:" },
+	[4] = { "gvt:irq:" },
+	[5] = { "gvt:mm:" },
+	[6] = { "gvt:mmio:" },
+	[7] = { "gvt:render:" },
+	[8] = { "gvt:sched:" }
+};
+
+#define help_(_N, _cat)	"\t  Bit-" #_N ":\t" _cat "\n"
+
+#define I915_GVT_CATEGORIES(name) \
+	" Enable debug output via /sys/module/i915/parameters/" #name	\
+	", where each bit enables a debug category.\n"			\
+	help_(0, "gvt:cmd:")						\
+	help_(1, "gvt:core:")						\
+	help_(2, "gvt:dpy:")						\
+	help_(3, "gvt:el:")						\
+	help_(4, "gvt:irq:")						\
+	help_(5, "gvt:mm:")						\
+	help_(6, "gvt:mmio:")						\
+	help_(7, "gvt:render:")						\
+	help_(8, "gvt:sched:")
+
+DEFINE_DYNAMIC_DEBUG_BITGRPS(debug_gvt, __gvt_debug,
+			     I915_GVT_CATEGORIES(debug_gvt),
+			     i915_dyndbg_bitmap);
+
+#endif
-- 
2.31.1

