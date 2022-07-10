Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB856CE10
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C730C11200B;
	Sun, 10 Jul 2022 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60E910FBBD
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=nOo7GckdQGPzkdQwE4TBc8mrAUIVfMYsYdKRw+6XYes=;
 b=Y2mqr/gIxcdnMSUHKO3DyVXIJpZ3Pr2YCEYHAYact3enJXGsNRYTjTrMIubk474qQmjwEG64JwqSq
 hHHFP5c73m9CGxOV3oYbQuYWyIfA71pxyhSSoI6LwwS/PEpTyeyqSYwU6CnAyKY0EgwLaxYtLUcevW
 smP+Dy2lAJbYGTMqkfZBdOFQclyJiwHKVhH5BzIvtRd154XzsShJJxS6XiG+hP/I/l2LkrDILlZXco
 qWKZKRKpllRRkSW/uySxW5nY2Vl/H7I9Sga22sEnkRxrfPiAEPf+YJyOsG+RODAyxhMB6bSYgOcIrk
 dT4CzZ8gRA9ZGNOveA6miXVdL3zhRYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=nOo7GckdQGPzkdQwE4TBc8mrAUIVfMYsYdKRw+6XYes=;
 b=UhCqcL/jn7edl04/LmcCdRwkBy7DE+gkVmGMbnAMN6eAKi7DEzdjxyFaro+VftM2qXY9ZixcEDnt3
 jssiyC0BA==
X-HalOne-Cookie: 52b0fd4229b0ac4db97c5286416896317db99443
X-HalOne-ID: 085708ba-002e-11ed-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 085708ba-002e-11ed-a6c6-d0431ea8a283;
 Sun, 10 Jul 2022 08:55:22 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 01/11] drm/via: Rename via_drv to via_dri1
Date: Sun, 10 Jul 2022 10:54:56 +0200
Message-Id: <20220710085506.1384056-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220710085506.1384056-1-sam@ravnborg.org>
References: <20220710085506.1384056-1-sam@ravnborg.org>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The via driver implements the DRI1 interface, and we have a new
implementation of the via driver coming that supports atomic
modesetting.

It is not acceptable just to replace the existing driver so
this is first step to make it a single-file implementation allowing
it to stay without interfering with the new driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/via/Makefile                  | 2 +-
 drivers/gpu/drm/via/{via_drv.c => via_dri1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/via/{via_drv.c => via_dri1.c} (100%)

diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/via/Makefile
index 84db4eee7828..acfd916541ea 100644
--- a/drivers/gpu/drm/via/Makefile
+++ b/drivers/gpu/drm/via/Makefile
@@ -3,6 +3,6 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-via-y    := via_irq.o via_drv.o via_map.o via_mm.o via_dma.o via_verifier.o via_video.o via_dmablit.o
+via-y    := via_irq.o via_dri1.o via_map.o via_mm.o via_dma.o via_verifier.o via_video.o via_dmablit.o
 
 obj-$(CONFIG_DRM_VIA)	+=via.o
diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_dri1.c
similarity index 100%
rename from drivers/gpu/drm/via/via_drv.c
rename to drivers/gpu/drm/via/via_dri1.c
-- 
2.34.1

