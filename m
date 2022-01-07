Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339BB487288
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA089113249;
	Fri,  7 Jan 2022 05:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D11113245;
 Fri,  7 Jan 2022 05:30:04 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id e128so5859218iof.1;
 Thu, 06 Jan 2022 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agBSgkgkW/lOUa/a1e2VO231rW5BNQTBTfk7cJDbplk=;
 b=HAk3291JdByrBv+FlaCYSm7Og7Bv51IGb1/URK9sxt4hUoGrvKjKdIty96hALwR/56
 hez4koMRHtjeS7rnGaNo6hBBnYB7M2baJcHRYh7mUipsSy2UXAENXWDvUWyAzZhodemo
 G+KsjM6aTfXFF2lCIyhxEjxyPXjVGvrKg/SXNvf7Xy0QWtieoBRZC5kWZX1ycVJwwxVc
 pV+JJQgTPFZpraYMQMqfpixURgyaJfQ38P/IMQU9z13yeIVMizzfKazBnAdAvJDxGWze
 EBJ0fniTa40LiDCC2M3o4sbSaBLDCVSksKcXd3oU/6WKoHmfR58b4Pxc5t15V75MJu6S
 kXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agBSgkgkW/lOUa/a1e2VO231rW5BNQTBTfk7cJDbplk=;
 b=bKKm3k9iXNjkEhrgpbJJdzUkHQ0zQ2nUB22nmrHELZFVlZdZoXM1Mx8mGUmtLDtaPP
 hL5AE4UbxZfMUi3McKADKsC168QC6197YEGuUZ2Lf9uACLIDJUVqv5PpzxP5EWO+uJ8x
 fWbHFl5/5uBbLfWg1c/tPGnrjJ1bNp9SFlSKhg6HRQYVwSjcDtxnC7CnpUFmAb2MlrVJ
 VWqeyGhQ+FL6RtzvSwVFP/m8IgrZDs91oi+TtgYd18woaKZQBJ1w+8Cv2izDy6VGg+mG
 xe7nhFVbgV6uCnrESZVnxLg9Y0z1f0jmlsgKgw3FW5kUcRdfXKzR3C0jo51G1RHI6HP/
 7w8g==
X-Gm-Message-State: AOAM530ATEQ9kQKAb57b1fpRF3P+d0RlshdcLkizXnWyPxb+DYJKS9vL
 fSlfQmE6L3kj3QDqlvcokIg=
X-Google-Smtp-Source: ABdhPJz5Pwl1TXvRhFAHC/C/RtcA8HwmVdUMjfOUZVBgrqnxSM4Fa/HYaYOvHoAIy1tgjh4vXNkRfA==
X-Received: by 2002:a05:6602:493:: with SMTP id
 y19mr29526904iov.126.1641533403267; 
 Thu, 06 Jan 2022 21:30:03 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:30:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 11/19] drm_print: wrap drm_dev_dbg in
 _dynamic_func_call_no_desc
Date: Thu,  6 Jan 2022 22:29:34 -0700
Message-Id: <20220107052942.1349447-12-jim.cromie@gmail.com>
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

make drm_dev_dbg() macro CONFIG_DRM_USE_DYNAMIC_DEBUG dependent:

 =N  direct forwarding: drm_dev_dbg -> __drm_dev_dbg()
 =Y  wrap __drm_dev_dbg in _dynamic_func_call_no_desc().

This adds the metadata which creates a /proc/dynamic_debug/control
entry for each callsite, and exposes it for selective enablement.

NB: include header in header so wrapper is available

proof of function:

bash-5.1# grep 'ring test' /proc/dynamic_debug/control
drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:453 [amdgpu]amdgpu_ring_test_helper =xf "ring test on %s succeeded\012"

less
    452         else
    453                 DRM_DEV_DEBUG(adev->dev, "ring test on %s succeeded\n",
    454                               ring->name);
drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c lines 417-454/458 byte 12536/12575 100%  (press RETURN)

new prdbg callsite counts:
bash-5.1# drms_load
[   20.533990] dyndbg:   1 debug prints in module drm
[   20.535637] ACPI: bus type drm_connector registered
[   20.624951] dyndbg:   2 debug prints in module ttm
[   20.627853] dyndbg:   8 debug prints in module video
[   20.922442] dyndbg: 127 debug prints in module i915
[   20.984159] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
[   21.310216] dyndbg: 2196 debug prints in module amdgpu
[   21.324537] [drm] amdgpu kernel modesetting enabled.
[   21.325092] amdgpu: CRAT table not found
[   21.325512] amdgpu: Virtual CRAT table created for CPU
[   21.326009] amdgpu: Topology: Add CPU node
[   21.401137] dyndbg:   3 debug prints in module wmi
[   21.532540] dyndbg:   3 debug prints in module nouveau

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f8fa5af11310..1eef315a0a65 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -383,8 +383,14 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	}								\
 })
 
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 #define drm_dev_dbg(dev, eCat, fmt, ...)				\
 	__drm_dev_dbg(dev, eCat, fmt, ##__VA_ARGS__)
+#else
+#define drm_dev_dbg(dev, eCat, fmt, ...)				\
+	_dynamic_func_call_no_desc(fmt, __drm_dev_dbg,			\
+				   dev, eCat, fmt, ##__VA_ARGS__)
+#endif
 
 /**
  * DRM_DEV_DEBUG() - Debug output for generic drm code
-- 
2.33.1

