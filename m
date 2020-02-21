Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9E168883
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3546F517;
	Fri, 21 Feb 2020 21:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF286F513
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so3309346wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mg8MQhpDniZSvhe/KMHyobjCQHqxkcIv4ikm1JiaTho=;
 b=JBKIhx7RDMTVl/p0ySSJzAO7UPdqB7wNpCuANw7WGB8C+9vPVPyWv8d7S/wmUDvwwN
 xK+mlZ+Jq0U+uzz/93mJwZ/n+h8KSNlC2Oj0iFldv+Hg/Najbnrkc0k5I83Ley0SRWyW
 9myXxpmg4051GJF05vRJkkgBiWC+lrcrleko0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mg8MQhpDniZSvhe/KMHyobjCQHqxkcIv4ikm1JiaTho=;
 b=rgEeeKp/q0AjlengTaaS+spG9L/u5Xbz+oZj+1r0GYgMAfWYN+JNZzxOotlMw6tbiB
 VnpCxez5+792J0XCNmb3Z4+Wm+iNNmZbh/khU/mHhI1TmZ9klJE0fe6XFegLM9qoKHrP
 ACa00rl0IJgG15j4e7YQGFk42GriP01vkUq4wcmX9EVt+DPAqFUHmkai799AYJMfQl0B
 2xJKOuYYQP2enA58j8TVH6/UhsCk5+H9bTd8qaOrRCR/raIYSVF/ir0sCqMc46XDwrfi
 qnCA+S3fB/zQlDSIbmmkELJPZgWUuuiWbktI1M2kJPvJOiG/CklbijvEctljK9TC5snK
 uv0A==
X-Gm-Message-State: APjAAAVDSG6b1xSi7W+9NcYMDvmmcHBHCmegb1eor7d3FWOeT7h3jzHH
 BlLdfKv/6Npny0i/HCo3ewjS92PivoY=
X-Google-Smtp-Source: APXvYqwNtnMC1G7gQdNa0AnnrnSm7DxP9gDuPdJNrNjIFXPTzHe4w3ySgr6gfCW1jHN9tTftZRQApw==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr5533717wmd.23.1582319010518;
 Fri, 21 Feb 2020 13:03:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:29 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/51] drm/i915: Don't clear drvdata in ->release
Date: Fri, 21 Feb 2020 22:02:30 +0100
Message-Id: <20200221210319.2245170-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 759d333448e1..8b8a9c9a9b2a 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1391,9 +1391,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 
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
