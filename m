Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3379CF2D2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 18:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEDC10E069;
	Fri, 15 Nov 2024 17:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NZ2hqJNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2048E10E069
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 17:26:19 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id C05Jt9hymPqyaC05Kt0Z2L; Fri, 15 Nov 2024 18:26:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1731691578;
 bh=Ce50d8CDL8pg9VTVcidQUBBsONObBsW+KaLtOOzdVmw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=NZ2hqJNv2eCYVEVfD1tsEf/FLmfCewP29Mf1t2i3jQsyTkXpfwRDcyiuxyS54v9Fh
 dvq4IRHa/tZ/EG8KpTtW5HAbiCA8bqT7DcdGeKpDlfv5gEcfMlCLfVhMTA0M221cT2
 5s54yS9WbD+hknJcqgrfEPNPUg4vFQlfPK8tufcmFEDIQ4xg1bWyA9rdYb/68nSUbS
 g5WpsvA309ZWjRAIl2m5sbmK0cck8tZ3sAGOlbB20Gubj7OEzPvnx+dVoiXLY/ev4/
 4R2VEdBbOMmICY/dzLmckO2wv85NLHloMdPYj55kOP0rkyMzrR6Kzz0WktBWhxFFcf
 h8yE2eOY1kodQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Nov 2024 18:26:18 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linux@weissschuh.net, broonie@kernel.org, lee@kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: Constify struct pci_device_id
Date: Fri, 15 Nov 2024 18:26:06 +0100
Message-ID: <039846c0278276e7c652395730f36051216fd4c3.1731691556.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
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

'struct pci_device_id' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  11984	  28672	     44	  40700	   9efc	drivers/gpu/drm/radeon/radeon_drv.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  40000	    664	     44	  40708	   9f04	drivers/gpu/drm/radeon/radeon_drv.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/gpu/drm/radeon/radeon_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 23d6d1a2586d..5e958cc223f4 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -248,10 +248,9 @@ int radeon_cik_support = 1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled (default), 0 = disabled)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
-static struct pci_device_id pciidlist[] = {
+static const struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
-
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static const struct drm_driver kms_driver;
-- 
2.47.0

