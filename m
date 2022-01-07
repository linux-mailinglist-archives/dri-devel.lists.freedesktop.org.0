Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19948729C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78011323A;
	Fri,  7 Jan 2022 05:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50ED113257;
 Fri,  7 Jan 2022 05:30:13 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id y11so5825934iod.6;
 Thu, 06 Jan 2022 21:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQJWjrpvTcrk4L61/TAk/KIkMk45wkVxi65EcBB2wtY=;
 b=d2IudHU+bG8/bgad7PeXNNcoFRsOkHVCShVHm/vs56LEwWSHNLuOiFpEy9DKP9l6Tr
 NRBxvirumd6cXxSnkNLyfQ8A+72NlcNsvL7hvZj4qmTJqiiF7Csdbvt56vxPZKgm+KVa
 LrSlrBhRhlCqqGdxdNHqwGpDCyTnA+YPYbfsQ7G96lw32cSPWQqyRz6ZiwfsJR6RI6by
 O/u4dN98TOOAoUCbAY7mPaIye9Ia4ZItYtBJMihh1+Ydm/s5SHgsKj5zmzh/47Sa491b
 AMMv+xW6DkrMNDF0c1KBxG7IMcy/cHwsIMDRlFUpK5z1bz9+nVuZCJuiiCAmG8ZEJ5nx
 Qodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQJWjrpvTcrk4L61/TAk/KIkMk45wkVxi65EcBB2wtY=;
 b=apIvMQ2vnGgCsmgiVxVk0ZbYyosGw/22RAQomiwgh49lrthjZCHrrUFoeVPEFMXgZh
 H5Q7D/UNjkfB1tNkxqLubzOd8zX+vbH3aK0LceGe3v+vnSImLHlYd3S7feHiNqZLpAWA
 C6O3P/wOa7GkYaeqQsRvTE5UCqaoO+dHeAGAtiYTeMorVXdiSL1CQyHQbKsJ/rxdSAX6
 2OoPnrmfPasHZZFsPOGcbrvCCcN1V4Fkva932N/NjzFt8ZnxbWMtOB+A5B3Y5f78CZFH
 wScCxTIFQNAlfYMdQOcMIY86FMD8FfqxwiR1zqv02DMl4QLSDUwFJyXqxjclgQDtYAa1
 /BSg==
X-Gm-Message-State: AOAM533AnTV4gW9j/kF3+upt8ap8/oeetkyPhzGpqyfTU1zSjvT5tXaQ
 wVB0A78KtkXk+gGA8ulNd/k=
X-Google-Smtp-Source: ABdhPJyGlqD7G+Do4+iTOVF8S6gJU+ENiyjS7KIHnyFyCqamp+AFbBw5NgCHK7Jn+6e1D4PE8CKoHg==
X-Received: by 2002:a05:6602:2218:: with SMTP id
 n24mr29175293ion.182.1641533413048; 
 Thu, 06 Jan 2022 21:30:13 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:30:12 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 19/19] drm_print: use DEFINE_DYNAMIC_DEBUG_CLASSBITS for
 drm.debug
Date: Thu,  6 Jan 2022 22:29:42 -0700
Message-Id: <20220107052942.1349447-20-jim.cromie@gmail.com>
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

if CONFIG_DRM_USE_DYNDBG=y, use new macro to create the sysfs bitmap
to control drm.debug callsites.

DEFINE_DYNAMIC_DEBUG_CLASSBITS( debug, __drm_debug,
	"drm.debug - control summary",
	/* inline vector of dyndbg.class_id (uint:4, 0 is reserved) */
	DRM_UT_CORE,
	DRM_UT_DRIVER,
	DRM_UT_KMS,
	DRM_UT_PRIME,
	DRM_UT_ATOMIC,
	DRM_UT_VBL,
	DRM_UT_STATE,
	DRM_UT_LEASE,
	DRM_UT_DP,
	DRM_UT_DRMRES );

NOTES:

dyndbg.class_id is uint:4, values 1-15 are valid. 0 is reserved
primarily for non-classified callsites (aka: prdbgs), and is thus
available to mark the end of the vector (and is added by the macro).

RFC: how to fold this in, with multiple macro expansion ?
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 20 ++++++++++++++++++--
 include/drm/drm_print.h     |  2 +-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 0a15a4ec5ead..0de562e5306a 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -41,7 +41,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned int __drm_debug;
+unsigned long __drm_debug;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
@@ -53,7 +53,23 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
 "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
-module_param_named(debug, __drm_debug, int, 0600);
+
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+module_param_named(debug, __drm_debug, ulong, 0600);
+#else
+DEFINE_DYNAMIC_DEBUG_CLASSBITS(debug, __drm_debug,
+	"enable drm.debug categories - 1 bit per category",
+	DRM_UT_CORE,
+	DRM_UT_DRIVER,
+	DRM_UT_KMS,
+	DRM_UT_PRIME,
+	DRM_UT_ATOMIC,
+	DRM_UT_VBL,
+	DRM_UT_STATE,
+	DRM_UT_LEASE,
+	DRM_UT_DP,
+	DRM_UT_DRMRES);
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 6d43b81a0ee4..ebed5ba2dc24 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -36,7 +36,7 @@
 #include <drm/drm.h>
 
 /* Do *not* use outside of drm_print.[ch]! */
-extern unsigned int __drm_debug;
+extern unsigned long __drm_debug;
 
 /**
  * DOC: print
-- 
2.33.1

