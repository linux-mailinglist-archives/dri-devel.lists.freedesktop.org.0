Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B030AC2750
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9983210E83D;
	Fri, 23 May 2025 16:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M6Hl5vv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22F10E836
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:15:47 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3109fb9f941so148121a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748016947; x=1748621747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GNk2zZpC65xRherJZoi8fazJtKf8aShkVrAnPTjrn2Y=;
 b=M6Hl5vv/NI+ui6qOeqZo7dic+xiZOyJi8caq2DW0IrSEcWtyIlQefMYMRAGHc3sVmp
 lwEOSPhDu3tBBP8SO2MqPqe3rGuVj0QWSc8FrLATRYXIXas4scqARGYl8eCPCRixUwNp
 LvWkOGeQH12yJntfBWiW2PGm8ZnTiWJ+4LdvXriAwa/5kVYM9Oi5vD1pjgFLXpN1lzoB
 fFvyeHSz2lfvDMoJRfHxArRqsxnuEuFAWXOGxWttIREOW65iH5OJ0DgYXq8h31XrPtzW
 ZxGdBS3YjeNm0mwWUNCBt0apVjweeLmLEwlT0xT9Qe/+c4kB2A+6BrimvPxpVuRwhvpC
 Nznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016947; x=1748621747;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GNk2zZpC65xRherJZoi8fazJtKf8aShkVrAnPTjrn2Y=;
 b=HGKsbhcfXrbOv6Bz/a3ovGwyfN7HJ0NqdGW2SZRPhzDAvrPhEA7ylY79cKzxIDM0r1
 kxhNO2orfJvI2rsCfsfd+9DZRJpefwdtX/W0U7CMW4GWbnQ3ysYwuIHMWseFAeK+/k33
 fOpxrx7HL7RZ2Iy0MKILyxWuyl29DNedBhDdfaaLcZ4J8BFRYJCvh4QgW+tRUHLOho9/
 1he65BBZvrBopk15P3evIokR9NnPm3gw0XKuMquE+P73LbDCbf0Evgg2q3CTJiRAVqy3
 kZG1i4SUaNrIJwLoxb8DBi/bQ7rUgenGgriTpJTaiy4x1ypdvwo7oXIwi76mhavPPJl0
 ZBZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTB4crPWFpBL6ZkSMCZ2LxQXiIYKp9IxppcO1g6Ckhsw9lbFtPsNK6N267tyuzYkBApLVpUVRDhN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhvH4Qu2cJfnC+hz22EVad/xgcr7PNmA30+VyJGLkYytFSxv97
 TW8HUWOO3zMshojlw3dvpVs2sAdgFOSUGQDaG3ZkhzO5wHgEIbbpTzjS
X-Gm-Gg: ASbGncvXpPj6l7llFzMYq87r84rGj8gcefeAKCBayDDq1KmjVk01MUuObEAcEreBiDZ
 TlhkcJ95Ze2+Q/dfAsOiMpaAWQmDg1qVIvRw+ptVOydX8iGcFANKsDOaUyX2DGGm6GXuui/35OT
 iWH2lqMGe4vwz1t7DzS3gHyssoutRJGWLsdnF6d6wTnFZe1oz1BWRLUdWimuv5jUtLUUvECwY3v
 6SEAqhlut48a/atTpNCL5ZAKW/JNecQXFks3tP7mZNK8ZkAoB8Efz0c/X48Y+NdQR5SGWbvSImp
 0oZXeNihJYg2V6MzK8AHQ8U1RinBKpNojDlZfQg49bdH8TLSFFpeFJfU2HLILoAY+BiEZKkSjcc
 mXY+ncXvLJhzw3D5CVz0PDpHO6TjzYQ==
X-Google-Smtp-Source: AGHT+IFx/FJsdG8AnNi6eg+BilBglUFlrj6JEqa2pyvzhIeq+c199ROzKQxdHjIHsfWSCrtByMxf5Q==
X-Received: by 2002:a17:90b:394d:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-30e7d5bb433mr53256647a91.33.1748016946693; 
 Fri, 23 May 2025 09:15:46 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f365d46ffsm7526565a91.25.2025.05.23.09.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:15:46 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v3 4/4] fbdev: hyperv_fb: Fix mmap of framebuffers allocated
 using alloc_pages()
Date: Fri, 23 May 2025 09:15:22 -0700
Message-Id: <20250523161522.409504-5-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250523161522.409504-1-mhklinux@outlook.com>
References: <20250523161522.409504-1-mhklinux@outlook.com>
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

