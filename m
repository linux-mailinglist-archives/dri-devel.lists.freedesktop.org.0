Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806C164169
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943176EB2C;
	Wed, 19 Feb 2020 10:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F88C6E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s10so5851789wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6aOT+sbC9DZkRChDIl2noB6bauE+8omFJe+Kq00qYM=;
 b=JF62FFIAryWtPf148i9ciEp9/HBlyh9O1YZdZsAG+j88VdqVoxM1cCppdqahV8Y3N0
 kLCnM7dr2T1sMqrZz6+F38qw9t7eXg3Yt+qMBAhMLO1YVEecdmrNEKviKdBUrb46yagA
 PnfdfeMLJJA+qkZQt0B6V/iYa+GM/DYM9s+E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6aOT+sbC9DZkRChDIl2noB6bauE+8omFJe+Kq00qYM=;
 b=lh1PKaEprBwcrX2tO2LN7ZhM4e0MM9d47ui0OzDNP1RR/Th2BWs43KjHKMRb1cstnL
 b0meGZie7ozVcDZ3sf2DxorYmHOwlPNwbzlz9h1aFkG29rut9IMjOA/9n+1D7J+PzFX5
 wBQgqq2MnLYzHhAxb6akUI5aX1WwPvf/HYNz2y42fmHiPTCJ3DsHZ1d8LmSOeCKbAl8I
 /YYc/A8hzksAqRiJdJYUb3jhEL1XnsGsRyneuOlw2qszFh6sLH48V5pR7tcR2CYtRnMT
 nYHv/0Lt4ckhbzRYKdUt27SrqgKBJl7LWwbdCLxd9wSyh3HXrKGl0mrhzLY9K5I2G4Sz
 UdvA==
X-Gm-Message-State: APjAAAXL3KtGdLABxMQ1e0XzCYK70Y556HFX3lXyFuofuWRgh4VeddR9
 WwNzOtyQqHdjBK5O6iTTHy2VLLKQR/4=
X-Google-Smtp-Source: APXvYqzKloE5ECBWtNOeC8OQUuQuE8lAE26FmjwV0odki1tPx4Kg0TkZad5+KQmHhVnsRWjzYgo1QQ==
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr9026840wma.24.1582107693331; 
 Wed, 19 Feb 2020 02:21:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:32 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/52] drm/i915: Don't clear drvdata in ->release
Date: Wed, 19 Feb 2020 11:20:32 +0100
Message-Id: <20200219102122.1607365-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
index f7a1c33697b7..050e4d7c6723 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1383,9 +1383,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 
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
