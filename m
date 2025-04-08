Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF86A814C3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 20:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C20510E2D3;
	Tue,  8 Apr 2025 18:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FpV3hQTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BB510E2CC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 18:37:02 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-736c1138ae5so5889680b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744137422; x=1744742222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GNk2zZpC65xRherJZoi8fazJtKf8aShkVrAnPTjrn2Y=;
 b=FpV3hQTtYJn+bGcDrgQpyZ717QXDuQAMhbuuz8ODoQL61C1/AJskf0PQB1zGPXagMr
 OUgd6Pps6JZ3+zTs3hDB4PCK+lSSj9xgg+kZks79yoX6gFe+yqNG2jxxeEfPhlt2UiKH
 tk1djdRFXZNBsBOT28Fn+bm7dgwc0BpxRRbP/BSfAsBjy5w8/EcIOJVAehWHlIWLr7L1
 gTyBebYBzAuUa3D/4L0+JbTGyB7oU5sIOLQOuKs0CXB5HMQ4A8C08H585r4Dh1EwrmfK
 7B4JKdNwZnoLcSqGonl1apyzyP7noDp/U+Ep8RJvJCep7EX4I+oj627u9stJisIxOEW8
 J2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744137422; x=1744742222;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GNk2zZpC65xRherJZoi8fazJtKf8aShkVrAnPTjrn2Y=;
 b=GJTgOICzQmzfVjOD/NHWLUrbfZzvzqfjo1iCuu2hRwnqrtmI6f8tTLEfYkOC23cTTX
 vJSWrcEPDWiXv3Z1J9VK2YBpkR7G5gwF7sPp9pNFzhDi8S30FggHKbiEb1IgOJJUMd1j
 qFjgPRCu5sP/DDcC7Bx/fhtWUB0wjE9ggEyS5do9xf7pUpz9a58DChOvDR7VWzueKWQH
 bWvcRln50iLpUyewj159Ai/KGAFwUGspzaG77VJGSsuPkWBG6VPRZoHyc1xSg7HchGSk
 E+o9GIbBBcb27PEjFQ5g3bLYRYLGRD20ppLVl9VJkRP501sGHEmq+oquFDnf5YabQvXC
 PXLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqp4tGlUHBfZUpcOfepNAcemcB0gMUMNxc7az8ebS/Lts44cc27+iSYAv/IIuczK+oTMWUv/bocso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBvQMp0oRE3Bc7akQYcqhSourSE5mj6e9uW/fCm/tUp3WZpWut
 9xyPiNX43eEcECE2Cu/oWzRnFKWc7WTxq8fgQRog4IiFIO928apq
X-Gm-Gg: ASbGnct6j7kx+J2PRySEchoykGh5kT246veZhX6yJEyLTD6EbmkUgBkeDn3okGtm2DO
 d0YW2DTbPpN/Qd8JEmm62XLbR7EiHPb3Mj4nyneexpK7BMkURySuadYAO41iiI1sJXLE5g69ysv
 /8c6OgvkFfKV0kAZ4F2rgDH4n8M6FAEk0YsB8BFJ0XzuJ1ArBHClrRb6iwSQmndGxxmsXzADiS5
 A9sBf6YzX6H3nNzmOpiV0lbLsJpACDUqbo6UviTXII5kEHrFTRMhxdbg283GcbsFEgmv2BmsReg
 9TIIA0+nPrN7hZkopFC7tZTESAxaZ47NaetPQlD4M1EyKqyJC64U1VVrKlZie1N9/p7VVjAwpAk
 29hGRXfRaZKwmTZWMeIxDL5M=
X-Google-Smtp-Source: AGHT+IFoxxArLlbdFj00rZFAC5VSPOC5ZnT2KxxJEAFIcKSD0E+nUXdTHUx2/AnLXQqCMh8+l9gjPg==
X-Received: by 2002:a05:6a00:2408:b0:737:e73:f64b with SMTP id
 d2e1a72fcca58-73bae497469mr99517b3a.1.1744137421614; 
 Tue, 08 Apr 2025 11:37:01 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d97d32b2sm10960469b3a.5.2025.04.08.11.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 11:37:01 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: jayalk@intworks.biz, simona@ffwll.ch, deller@gmx.de,
 haiyangz@microsoft.com, kys@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH 3/3] fbdev: hyperv_fb: Fix mmap of framebuffers allocated
 using alloc_pages()
Date: Tue,  8 Apr 2025 11:36:46 -0700
Message-Id: <20250408183646.1410-4-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408183646.1410-1-mhklinux@outlook.com>
References: <20250408183646.1410-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Framebuffer memory allocated using alloc_pages() was added to hyperv_fb in
commit 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb
on HyperV Gen 1 VMs.") in kernel version 5.6. But mmap'ing such
framebuffers into user space has never worked due to limitations in the
kind of memory that fbdev deferred I/O works with. As a result of the
limitation, hyperv_fb's usage results in memory free lists becoming corrupt
and Linux eventually panics.

With support for framebuffers allocated using alloc_pages() recently added
to fbdev deferred I/O, fix the problem by setting the flag telling fbdev
deferred I/O to use the new support.

Fixes: 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/video/fbdev/hyperv_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 75338ffc703f..1698221f857e 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1020,6 +1020,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			info->fix.smem_len = screen_fb_size;
 			info->screen_base = par->mmio_vp;
 			info->screen_size = screen_fb_size;
+			info->flags |= FBINFO_KMEMFB;
 
 			par->need_docopy = false;
 			goto getmem_done;
-- 
2.25.1

