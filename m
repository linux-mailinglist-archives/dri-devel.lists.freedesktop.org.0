Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BDA40CAC6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471726E98F;
	Wed, 15 Sep 2021 16:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7232D6E98F;
 Wed, 15 Sep 2021 16:40:44 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id n128so4273603iod.5;
 Wed, 15 Sep 2021 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDBpZYzyfsOqK+11ijg+a75kY42bBVtFKRaRrgH1FO8=;
 b=DVICViiuPnjZpQqGsNBIlpx0DXfDVwzwfXtPCJr3cNuvsGci/Tp0gAtHtDJlEOJ8t7
 gKVMRt2YK8TpwiWUEaTxXmMqxaCu9WzJDPDC8Po2Jo9CGDCFhVjg8ZEvrZPeupqFbM73
 S+aWvmJYnxwM7y2fiZqgGos4DESURPoFO5o0lgmeSfeBDpv7scIQyvjiElK5t4iH9nsS
 Mg+X8qv8bQrpB3E9v2d2x7tVwP5GLqmNH1Xj++UET2hjrt/z7mX3sDi9yuhRhD5NXcPS
 R25Ovo609ecesIsEhSV7FxoA7wYu8OlLhEd7rKV10y0bXncp7HdxtZZXLYXmvvCavJAd
 cQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDBpZYzyfsOqK+11ijg+a75kY42bBVtFKRaRrgH1FO8=;
 b=ZxmFXid2HWJrnzsasRCr5WgbExmHLges2eTyL8LmgDuAB0Ck4dkaW38exYIKQwXxnb
 FMfiGpBn9Ifaq1jR+RDfMrmb0s1heOte/dsr/PYYqXxGCXpHN9X5zMnMkY3lZyyz1sKk
 kB6mCzssQokO/BsJlj1cjwObW4qyanz0apO05n6xiE2bQlxf+f1capuoJnIKGjE1DFiS
 Gyr//zUY/XBvC2vncKqTFN3uS41JvwKCIxNH2xkdFi3F1bQPKaTSRKG3vtR9htIagnM2
 l+lvn9hYBBmZUcrtBu2zWJVhpyeUDKLiFobAB69KEv+kNVfzMzFaxDFr95AVtNlHjdiH
 dW1Q==
X-Gm-Message-State: AOAM533mYEh++/pEjzszSydsT+aJKvKiK0ZYD52oRZBna4vJd22YrzJt
 M5bdTyZOiPb2BBR2WMFd1v0=
X-Google-Smtp-Source: ABdhPJyMJU47mJz+Hw8YkwZorXgD50Cw4vn6wJLPu3FeV1Lpa1FuwQv1qXG65pqT47+WIRDYPv496g==
X-Received: by 2002:a05:6602:2ac7:: with SMTP id
 m7mr805009iov.66.1631724043738; 
 Wed, 15 Sep 2021 09:40:43 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 11/16] i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES for
 existing prdbgs
Date: Wed, 15 Sep 2021 10:39:52 -0600
Message-Id: <20210915163957.2949166-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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

The gvt component of this driver has ~120 pr_debugs, in 9 categories
quite similar to those in DRM.  Following the interface model of
drm.debug, add a parameter to map bits to these categorizations.

DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
	"dyndbg bitmap desc",
	_DD_cat_(0, "gvt:cmd:"),
	_DD_cat_(1, "gvt:core:"),
	_DD_cat_(2, "gvt:dpy:"),
	_DD_cat_(3, "gvt:el:"),
	_DD_cat_(4, "gvt:irq:"),
	_DD_cat_(5, "gvt:mm:"),
	_DD_cat_(6, "gvt:mmio:"),
	_DD_cat_(7, "gvt:render:"),
	_DD_cat_(8, "gvt:sched:"));

If CONFIG_DYNAMIC_DEBUG_CORE=y, then gvt/Makefile adds
-DDYNAMIC_DEBUG_MODULE to cflags, which CONFIG_DYNAMIC_DEBUG=n
(CORE-only) builds need.  This is redone more comprehensively soon.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5:
. static decl of vector of bit->class descriptors - Emil.V
. relocate gvt-makefile chunk from elsewhere

v7:
. move ccflags addition up to i915/Makefile from i915/gvt

v8:
. relocate DDD_CAT decl code into intel_gvt.c - Tvrtko
  cflags back to i915/Makefile
. add -DDYNAMIC_DEBUG_MODULE to support DYNAMIC_DEBUG_CORE-only builds

heres unchanged? footprint:

bash-5.1# for m in i915 amdgpu nouveau; do modprobe $m; done
dyndbg:   1 debug prints in module drm
dyndbg:   2 debug prints in module ttm
dyndbg:   8 debug prints in module video
dyndbg: 167 debug prints in module i915
dyndbg: 2339 debug prints in module amdgpu
[drm] amdgpu kernel modesetting enabled.
amdgpu: CRAT table disabled by module option
amdgpu: Virtual CRAT table created for CPU
amdgpu: Topology: Add CPU node
dyndbg:   3 debug prints in module wmi
dyndbg:   3 debug prints in module nouveau
---
 drivers/gpu/drm/i915/Makefile    |  2 ++
 drivers/gpu/drm/i915/intel_gvt.c | 34 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4f22cac1c49b..038fd29c89d4 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -295,6 +295,8 @@ i915-y += intel_gvt.o
 include $(src)/gvt/Makefile
 endif
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 4e70c1a9ef2e..eb0da9173b23 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -162,3 +162,37 @@ void intel_gvt_resume(struct drm_i915_private *dev_priv)
 	if (intel_gvt_active(dev_priv))
 		intel_gvt_pm_resume(dev_priv->gvt);
 }
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+
+unsigned long __gvt_debug;
+EXPORT_SYMBOL(__gvt_debug);
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
+DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
+				I915_GVT_CATEGORIES(debug_gvt),
+				_DD_cat_(0, "gvt:cmd:"),
+				_DD_cat_(1, "gvt:core:"),
+				_DD_cat_(2, "gvt:dpy:"),
+				_DD_cat_(3, "gvt:el:"),
+				_DD_cat_(4, "gvt:irq:"),
+				_DD_cat_(5, "gvt:mm:"),
+				_DD_cat_(6, "gvt:mmio:"),
+				_DD_cat_(7, "gvt:render:"),
+				_DD_cat_(8, "gvt:sched:"));
+
+#endif
-- 
2.31.1

