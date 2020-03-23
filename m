Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A215118F737
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EC16E135;
	Mon, 23 Mar 2020 14:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D3A6E134
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m3so15130961wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcmBK1cUXpb2AukNNuBGatxvJwqs04jt1DOiiyzm5hE=;
 b=kQG+AiMtkiPZntaXzKg4DLduZo4SNb8CenqPQ68/vqfhlOu1l69HP0QlfpNgud0d61
 uEPrFC/uWt5uaJ1tsM7re76O4zFyaxecfQuFioIunlw2sMfoV64gdRQ8vJ1z72YNkpT4
 rWXRdZ3EEakE8NX2mAx4YLxGCQy2ZAqFM/JEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tcmBK1cUXpb2AukNNuBGatxvJwqs04jt1DOiiyzm5hE=;
 b=ZRqHuFJEe8Es6eNwSu+Nr1agjMQnF7t0G7i10hW5rAeDFtgxLNsP7AvbrWj99gXaD4
 wUb+wC9Oj27Afex6gz4RtxGbCZ5Vq6fAkG48fDga1jvVeSSARnQr2qmFw/id4Mm3ojET
 Ls9K7te9U8DxlPPtd3Zo/BXIDcK/XVxMSmVYbXtQXazXcaGzFm7Xwz4hQ82+9NPDXTWd
 4PKik4Xt7rTpFu0faif5RADxEu/6BeTAeKzhZrAqAmXOdCDI1t74fkqKqoqy0MC2bzzy
 aR1bUcFHKLraT4efgfpKhxaouMVyJpj9fjwWldhlvqeT0oloKI92JQRFMV0dJ22sh/tR
 5Aag==
X-Gm-Message-State: ANhLgQ2p/i23oCLCSCiY/vmHHZYSsc0HQCgMjQpTdES+QeuvsYs2kZQg
 s07L5pa6FlBudoYWFySpE5IztfyH8wCzEQ==
X-Google-Smtp-Source: ADFU+vsG/j/kSec8KLdXDJFaoxEVisRWQYLP6F5qV52N4Cn28M8h5b5aOsUS9AZqRPyqNvkhKFe07A==
X-Received: by 2002:a05:600c:20c7:: with SMTP id
 y7mr28557771wmm.38.1584974999427; 
 Mon, 23 Mar 2020 07:49:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:49:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/51] drm/i915: Don't clear drvdata in ->release
Date: Mon, 23 Mar 2020 15:49:01 +0100
Message-Id: <20200323144950.3018436-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
index 48ba37e35bea..4792051e9e2e 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -909,9 +909,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
 
 	drm_dev_fini(&i915->drm);
 	kfree(i915);
-
-	/* And make sure we never chase our dangling pointer from pci_dev */
-	pci_set_drvdata(pdev, NULL);
 }
 
 /**
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
