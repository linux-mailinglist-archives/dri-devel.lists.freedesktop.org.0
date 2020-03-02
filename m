Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BED1766E9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D2F6E863;
	Mon,  2 Mar 2020 22:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFFE6E862
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:26:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so1857577wrn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEx0yhuE5cScKXaCEVNrk3SBemRwVMwmgNM6/6Cje8Y=;
 b=EBzm1UzGbqy2VRtggiY723Q19CNjZhDjzHgXZJGWqH1uCMn5DErwf6romcNLe+C4Mb
 O52j8lr2HMlCafoB2zYVFM5c3xM5oNiHRf/X3QQWp2k/DOBHoEhy4o5rOCeYYc1TUe/4
 n8WJC0PQOc3XrIOkB6B4DGlTdYBnwbrdRyEZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEx0yhuE5cScKXaCEVNrk3SBemRwVMwmgNM6/6Cje8Y=;
 b=U+rrTFKLWu3XmWWVcFaqesltCaPIXBMdwisdi5Hk6HOQSI8vC0chu9CEfFqbq5U3KE
 qpiXTzXB6KhmkR4ZXgw9zRP4hRjCpsGVZcD09ThPo2fHGb24xiL+4Ejs0gR2X6A4HMbr
 fRBhh/GR6DsdNjAh6X1cfLxbi3rFg0gMV9ceW4DN2VNLlQjI+qLfiSLGuc2+XPXwwBrf
 /z26Rt2LJ4tqNWUy33PflHEi1L1BLSTaeBOKkI/S3UOSJQu0Urio8UxFJTqqAg0F9D6t
 MB5T6symq1k8xgnvTINd3wqba7BCRyMYe76/+JAeVqM2W3bcWDjZ+bd3FbZ7yEciNy/r
 o73w==
X-Gm-Message-State: ANhLgQ27sdHSVotUp4g4TQjVClsotLKVhBjePo9BpZIQzyPxCBjP/Asu
 C47imS1cD/LXBZ5Clx6K8uPPIu4Wxh8=
X-Google-Smtp-Source: ADFU+vutr6RAp596P9k5KhUX4GAr8w/IxrjFC5Om0eqE5/OCizgq4YjuMdLAQQL7APJywJ7D8FQilg==
X-Received: by 2002:adf:fd11:: with SMTP id e17mr1463045wrr.195.1583188003522; 
 Mon, 02 Mar 2020 14:26:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:42 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/51] drm/i915: Don't clear drvdata in ->release
Date: Mon,  2 Mar 2020 23:25:42 +0100
Message-Id: <20200302222631.3861340-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For two reasons:

- The driver core clears this already for us after we're unloaded in
  __device_release_driver().

- It's way too late, the drm_device ->release callback might massively
  outlive the underlying physical device, since a drm_device can't be
  kept alive by open drm_file or well really anything else userspace
  is still hanging onto. So if we clear this ourselves, we should
  clear it in the pci ->remove callback, not in the drm_device
  ->relase callback.

Looking at git history this was fixed in the driver core with

commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
Author: Hans de Goede <hdegoede@redhat.com>
Date:   Wed May 23 00:09:34 2012 +0200

    device-core: Ensure drvdata = NULL when no driver is bound

v2: Cite the core fix in the commit message (Chris).

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index e7c339255de5..5997b4507f29 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -914,9 +914,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 
 	drm_dev_fini(&i915->drm);
 	kfree(i915);
-
-	/* And make sure we never chase our dangling pointer from pci_dev */
-	pci_set_drvdata(pdev, NULL);
 }
 
 /**
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
