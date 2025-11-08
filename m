Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D754BC42A5E
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 10:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928A410E120;
	Sat,  8 Nov 2025 09:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KlMq8yBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7041710E120
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 09:33:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so952190f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 01:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762594432; x=1763199232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiApigOOG8LHPEXfDKXbVktrWsjTUfreGKJRz4Nc8lA=;
 b=KlMq8yBAx0rIZ7NwxdlcbcGdg9SDdaHtFpHtxC+kKAXPmVz606tqJ61+0/TyU7vqji
 7I/FttE5UkKZoq0+ViKz8UdmWBpWzw4UIFh6RYPKslBRjKY0aODw56A9GH4or7uLXlne
 FyRk+A3lCBVCQFJsZ52OfeGLbwjayS96yNoqafHgMgV9SK3AkYLtX+qK9IAjTtVl/ol8
 c+G1IxmbSghuDyVL89l0ITqbPbesY/GHKWnuWRNarWbeSU2tlRzXRPUyn+3UA69jkpEv
 yFGvIq3fqb3xIS1o9i82W60mL/BrU4isQ3VyzormyjI9guoIl3fUSTUVnwChl/EG8nUu
 iN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762594432; x=1763199232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QiApigOOG8LHPEXfDKXbVktrWsjTUfreGKJRz4Nc8lA=;
 b=qjvN0RM2BRjq/taUSeJ6T9o3ZtYgnyhe3I2z+tSsQA9qaoaFN2WkeKb0zwuWqK2MjT
 hJHLhkeCYxYzix0tG8a7Jwn3v7df7skGRsvdzRMCkO+aNszwDokjg6dc5m2FBzc6eS+4
 rLbE+EiMxfDZ8CbYGB515J+2IKnRBevo287QRK3oWEfCL1ApPxXQE8/mEh9mv1p97f9s
 OMVYPQT/UT2dP3GFNG1W32vRn06jBQEy8IoMzLm0sQAimPsiVhTBkGFrLa5wHBARFzPC
 kC+/ZJTjtMPR/WfHLlesYTKjFm/AAfB5UNsQki0T2PdjdtlfKYU7cVCwsc1rx9z4CzEZ
 tPwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdgBP0n89XwbYV/HOnNPaUsKLvMc0jKbKDQpLHXGMDgMzS1ZbqiTZS8BmdfcAZzYV+svACBHEBFxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy17A8pciOTn4rIrZRNnOf2c1RIk1IOIV91zXy7gchL/mlMYJu1
 rEJPeOdwl3gVyodNiCpqY9FDEOVGJ3M1ImMWeizl/httNsI9KtjyLDII
X-Gm-Gg: ASbGncuzub+ZUH7pQ0DM0/Ln76l8/XRsCMEe9Iia6GgGpLNITS2tJ+92LM1yCxvqSd1
 81Oj3a76iUQpmB6KKXghK0/PkN1dH/Nv6Dkh0Df9vZpkh/+TDKekAOyR3F34ZT7JXxsOD4WavXB
 kf0tgJMDt5WLkMWggaObDKbv+LUsH8+h6fZmZZ3gKje6icD9Bz5u47lkIGaeFU+BXoqSq+QG3JY
 hVfPPj11qGA8Nog4lI8hKHRylLwzqAab4nvY5fkxU/ady52JU5N/oQ2NY0xeVfiPohQt7/xBap2
 KpzK227/qaXyMKdc784MpJeU6QV403njeQIvG270IqV2GSPj9RrUjMH7iD7N86jm06zMFZlkJ6T
 XJVO8Gb3vTL9oa6x7kXiIQk2aWn781CX+ENap+fw43tdHGWwskhbXN0Qm59hALI6q+zHNRjxdt4
 NlL/vJ1eHuAFB9u5o8igtIz4VRmGgDVKrflP1d1DMTIJrtgDqxWGL71LW8REQqGdjQZ6+USIERK
 g9zVsR9
X-Google-Smtp-Source: AGHT+IEd4XyN6o1k4yt4rMN5pB+/mSHIFBxKb+L3mgiOpSENoQYSE80ZfJu9ZJL1EDqCKgK7GtsnaQ==
X-Received: by 2002:a05:6000:2681:b0:429:cacf:1064 with SMTP id
 ffacd0b85a97d-42b2dc877f3mr1621212f8f.29.1762594431704; 
 Sat, 08 Nov 2025 01:33:51 -0800 (PST)
Received: from dell (229.red-88-1-12.dynamicip.rima-tde.net. [88.1.12.229])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67920fcsm10435119f8f.39.2025.11.08.01.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 01:33:51 -0800 (PST)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH v3] fbdev: vga16fb: Request memory region.
Date: Sat,  8 Nov 2025 10:33:48 +0100
Message-ID: <20251108093348.2842180-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <f9998d60-e532-48ae-8e03-d867cc0ec847@gmx.de>
References: <f9998d60-e532-48ae-8e03-d867cc0ec847@gmx.de>
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

This patch reserve and release VGA memory region.

This align with Documentation/drm/todo.rst
"Request memory regions in all fbdev drivers"

I've tested with 32bits kernel and qemu.

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
v1 -> v3:
      * Add space after comma.
      * v2 https://lore.kernel.org/lkml/20251028191615.2765711-1-rampxxxx@gmail.com/
v1 -> v2:
      * Add release in vga16fb_remove , thanks Helge Deller.
      * v1 https://lore.kernel.org/lkml/20251016171845.1397153-1-rampxxxx@gmail.com/
 drivers/video/fbdev/vga16fb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index eedab14c7d51..3b4c50d98ba6 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1319,6 +1319,11 @@ static int vga16fb_probe(struct platform_device *dev)
 	if (ret)
 		return ret;
 
+	if (!request_mem_region(vga16fb_fix.smem_start, vga16fb_fix.smem_len,
+				"vga16b")) {
+		dev_err(&dev->dev, "vga16b: cannot reserve video memory at 0x%lx\n",
+		       vga16fb_fix.smem_start);
+	}
 	printk(KERN_DEBUG "vga16fb: initializing\n");
 	info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
 
@@ -1398,6 +1403,8 @@ static int vga16fb_probe(struct platform_device *dev)
  err_ioremap:
 	framebuffer_release(info);
  err_fb_alloc:
+	release_mem_region(vga16fb_fix.smem_start,
+		    vga16fb_fix.smem_len);
 	return ret;
 }
 
@@ -1407,6 +1414,8 @@ static void vga16fb_remove(struct platform_device *dev)
 
 	if (info)
 		unregister_framebuffer(info);
+	release_mem_region(vga16fb_fix.smem_start,
+		    vga16fb_fix.smem_len);
 }
 
 static const struct platform_device_id vga16fb_driver_id_table[] = {
-- 
2.50.1

