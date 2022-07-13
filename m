Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7796573BB0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051A7908BA;
	Wed, 13 Jul 2022 17:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996D78F62B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 17:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=k5QiiCYW1jdXFKhS0hdQ3BOEf7yvGky4yfkgOaDuqkg=;
 b=ltiE1+q2GPMq6RLU+cWE6lhbml6WIAsyLjWo+FabKHP36DRK+QUdIVuWL0hx6j5NAc5xKU92qkbRv
 /RALZz/J3iOuuOD7w8MjZQ+wvPgaMGcdXYFBIFOHtNd/X1RYE+LfEueG2Cckh7Ha0GWZrfYSJFtK5t
 Aa9Y7zk/16RXw4KHeyfeeYRZdE/HPiQzf0gKH25wQTZkuOhxqVMKrBlNWS8L1r5TzO8l4Q3M1hxF2O
 7LBK8FmLSl7eDHI0HIiB1ql1nrlnfl92iJcfrHTO4/0AoEkpKOYN+LRgJSJZNsX/XB7gUQSLl0SqzC
 u7z8bSFgK2p06Qt2dv7uYqggqchXgwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=k5QiiCYW1jdXFKhS0hdQ3BOEf7yvGky4yfkgOaDuqkg=;
 b=05q70pPdkWQ8NPqueFWwnLNPpap9gKr9e1fzgw+m/i6dmYa7S9DxpVXLvoYvE9hRhTZ2Br6cUGVxK
 nEeC/XOBQ==
X-HalOne-Cookie: 0b83547bd51ca0e7f62e55d56b403f8dc5c64ace
X-HalOne-ID: 879b59fd-02cd-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 879b59fd-02cd-11ed-be7e-d0431ea8bb03;
 Wed, 13 Jul 2022 17:02:08 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/13] drm/via: Rename via_drv to via_dri1
Date: Wed, 13 Jul 2022 19:01:50 +0200
Message-Id: <20220713170202.1798216-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713170202.1798216-1-sam@ravnborg.org>
References: <20220713170202.1798216-1-sam@ravnborg.org>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
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

