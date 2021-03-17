Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E721233FBF0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 00:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AD56E865;
	Wed, 17 Mar 2021 23:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042BB6E865
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 23:40:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x26so2194736pfn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 16:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmHS2y60rTDgtSz42Ly3Q4aYmzkC3eRySaxOqwoqXEo=;
 b=EUw242Z7XmH2phygwrbtCa8TeIXb1rDyeYWziKWlSTnvVxB+0w+6a0uhvrKDSVmzTK
 p2dWWUNadQSFLYWHrUmK4TEFZKjP0kYfdTMgQfj8URkXum9h/fxIrFXNIOJ9aSHRUnnB
 PH+U19SuQKgPKhtU7Y6qwyWT2/PHPdLw2Yp95hGdcAudCi322w6fmLKslersSI3EuFdD
 TjySItHdRO2SbM8D/m667DZytlNgzPXVlp9wn3uG1hDMw/CwRlbyY1tXGAp05GTpwboi
 Fe5BHsopNC4uJiO7c8PR0RYOGKZCG9P9tPBD7b2OKbpHijtD0w/WSPNbNVwcdbw7p+0x
 WJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmHS2y60rTDgtSz42Ly3Q4aYmzkC3eRySaxOqwoqXEo=;
 b=kVzRe3zHNJeGYxd5DlVTCQ2hSSdSBjB5T+9+hzzrj2G/Jj4KSRcvcLyUAalHIHAhtG
 VFvzIWJqRNIH7dd/9gP+Om82WhTR5+j0e+ULnX24qxTF93/5G2RcU07M6+WAcmnJuhzX
 sLBoHy6ZaQkwHLg4VohYsi6Q2mPGUGXZjpUJ/RmYohtf4M2RYICp4asOhCFxD+s7+eiZ
 jOpsRxLCOO7i+5S6W1LHOOy4irOfMz60J2RU8e6WI+RHMgO7ebHbzNP5mXBt849cpYpC
 psJ/ka1FodyM8r+/m57v2ySND9ReZjfpioTxDcxuxdDX3CR9S4OP5FWGCXYG44wqLMhL
 lcAA==
X-Gm-Message-State: AOAM5308dM609S+QPyQ1CVRbFFLQ8uvAzxq0l/VmDXzyMVrjw36qiQ2D
 l89PRQuMs/E2YO0/jylkT2wk0ETpOvwBlQ==
X-Google-Smtp-Source: ABdhPJyPGtRtzBYwjFZ8HfuDYUO22TgfTNEulbT8aVxmfK4MdwPD70eYDopUjCJZGwCPyJWYnxaojg==
X-Received: by 2002:a62:e812:0:b029:1fa:e965:5564 with SMTP id
 c18-20020a62e8120000b02901fae9655564mr1291879pfi.68.1616024427064; 
 Wed, 17 Mar 2021 16:40:27 -0700 (PDT)
Received: from omlet.lan (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id p3sm148399pgi.24.2021.03.17.16.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:40:26 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Disable pread/pwrite ioctl's for future
 platforms (v3)
Date: Wed, 17 Mar 2021 18:40:12 -0500
Message-Id: <20210317234014.2271006-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317234014.2271006-1-jason@jlekstrand.net>
References: <20210315143428.1471489-1-jason@jlekstrand.net>
 <20210317234014.2271006-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

The rationale for this change is roughly as follows:

 1. The functionality can be done entirely in userspace with a
    combination of mmap + memcpy

 2. The only reason anyone in userspace is still using it is because
    someone implemented bo_subdata that way in libdrm ages ago and
    they're all too lazy to write the 5 lines of code to do a map.

 3. This falls cleanly into the category of things which will only get
    more painful with local memory support.

These ioctls aren't used much anymore by "real" userspace drivers.
Vulkan has never used them and neither has the iris GL driver.  The old
i965 GL driver does use PWRITE for glBufferSubData but it only supports
up through Gen11; Gen12 was never enabled in i965.  The compute driver
has never used PREAD/PWRITE.  The only remaining user is the media
driver which uses it exactly twice and they're easily removed [1] so
expecting them to drop it going forward is reasonable.

IGT changes which handle this kernel change have also been submitted [2].

[1] https://github.com/intel/media-driver/pull/1160
[2] https://patchwork.freedesktop.org/series/81384/

v2 (Jason Ekstrand):
 - Improved commit message with the status of all usermode drivers
 - A more future-proof platform check

v3 (Jason Ekstrand):
 - Drop the HAS_LMEM checks as they're already covered by the version
   checks

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/i915_gem.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index b2e3b5cfccb4a..80915467e0d84 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -374,10 +374,17 @@ int
 i915_gem_pread_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file)
 {
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_pread *args = data;
 	struct drm_i915_gem_object *obj;
 	int ret;
 
+	/* PREAD is disallowed for all platforms after TGL-LP.  This also
+	 * covers all platforms with local memory.
+	 */
+	if (INTEL_GEN(i915) >= 12 && !IS_TIGERLAKE(i915))
+		return -EOPNOTSUPP;
+
 	if (args->size == 0)
 		return 0;
 
@@ -675,10 +682,17 @@ int
 i915_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 		      struct drm_file *file)
 {
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_pwrite *args = data;
 	struct drm_i915_gem_object *obj;
 	int ret;
 
+	/* PWRITE is disallowed for all platforms after TGL-LP.  This also
+	 * covers all platforms with local memory.
+	 */
+	if (INTEL_GEN(i915) >= 12 && !IS_TIGERLAKE(i915))
+		return -EOPNOTSUPP;
+
 	if (args->size == 0)
 		return 0;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
