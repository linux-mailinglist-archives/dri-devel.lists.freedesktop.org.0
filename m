Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771B5AEF38C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D9C10E060;
	Tue,  1 Jul 2025 09:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B18e9h0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1037E10E570
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:41:10 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-749248d06faso5567839b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751362869; x=1751967669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6VPondI9s6Ps40JI4paXgB0FQE9DZBVRKYHGloiqBo=;
 b=B18e9h0Kt8uPz5YI2LUcl7WUnlY0Ba8FB8dZgzrE3oivNtUnoyvmJxagcIEW92OyWx
 Va6Hy+vOlJuxcsaduchWTn/NKRkXOO9/pnquotPK2OwzsJwXhCO/m2ypC+PRBGQBWxB/
 GWkujucGcZp7bfoY+tiwJ7/Ye4tJ6GWWjLvjLXG7pFm+eHULkCdgH/3E9Pqp68sh5GyQ
 w/3H+W6z5idWsY1i3kWZLFXiWiBo3BoRPypshulX8519KLHvijz+IDyjnKaNlw0aDS1n
 8l1Kir+jGPku8Sbz9PVuditA65x2yORwDn+Xt2pIdjMvxw++AFwCjC0O1Q+Pt8tdaJy6
 Lt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751362869; x=1751967669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6VPondI9s6Ps40JI4paXgB0FQE9DZBVRKYHGloiqBo=;
 b=YzyBBIwdOFS/Prn0Id11uuLUhApXYTUm+RhgLHAI0SyuUof3JsSyfP7DpFlkEZRenW
 5FKN6z27ei3DuT4h2XE6951Nt1epJvHEJXg/xITMNjPZaMTnyn904pU+6hRrDR1CMqPF
 ZfQO35xIZItN0+QpshZ2dzkKYg+0/JNJKXRdbKsJ7r1QhlDwf0Flhnm+f8NbEU3mZkfd
 DENT0sml3S8LVVDJ7/R01livloj5xNYbft6l2OwSoOXCxBbieigIDV9CiSzuXAbxlJ/R
 FrwaNAdbP8Z8y6epqFl2Vi1cNBeStu35rc2IE9EB/lggS796rnbW525ZVoCZEK7x4axu
 1/Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi7Kiln8eDJFhL4UmNZMxVBVOimISGroRhm2r3+uJ62tMzO5DVgla7bP489CHAot9JlHmbPb4FjpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGV2vk3X36dBXBMwY2ss+vk03/jH8VPgLiw9XbH+/HZ4dAfRQ8
 7jFwN6rrMwjoYY/wQ2xnhNzZpc79EgT/hn3Ld6qhydmd2o2TW23S9oBV
X-Gm-Gg: ASbGncuoG5KkM8N3ksFXu2VY2gDOB0lKEUgs1tV1Ze3DDsAbZtwTJ8K476meqWz+hsU
 hUJLkvter3KSUCQABGkuRnUSQHUOxLTaWKrmRMMHZkyurpSEnREeJe716SPSWLezlql9vb89TII
 FKx8XZvp/kv/wCNna6LKQcV2SzKxv2NpjLsU40F5pycvkfpQOE0eRTDecEUxtaAOjzZaP3/8ygY
 PCAFF6ZeRx6Vp94SKhGNbexJ/Fou2usNkbD6Byw3bvzzgpU5b0m7AXnaqpbEf0S+5b+R0nFHqFn
 YyyQyH4rOGWIyP2yJBeBrl5j2AlrJnGzDI5s59oZ4tgjGNdB3PlAG+UKu+h8FtmMM3e251lyYcP
 0CA==
X-Google-Smtp-Source: AGHT+IGCUJ6tlUrEWS8XsccIwNxw4AUXaAE5LiMgz6vheF+DRB+JBGiWDglKUzh32UvkY9tpeCODvQ==
X-Received: by 2002:a05:6a00:1302:b0:736:43d6:f008 with SMTP id
 d2e1a72fcca58-74af6f40a01mr24461769b3a.12.1751362869457; 
 Tue, 01 Jul 2025 02:41:09 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-74af57e7279sm10945766b3a.150.2025.07.01.02.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 02:41:08 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()"
Date: Tue,  1 Jul 2025 15:10:22 +0530
Message-ID: <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751361715.git.abdun.nihaal@gmail.com>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
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

This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
leak in fbtft_framebuffer_alloc()").

An updated patch has been added as commit 505bffe21233 ("staging:
fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
and so reverting the old patch.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
Newly added in v4.

 drivers/staging/fbtft/fbtft-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index d920164e7710..8538b6bab6a5 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -695,7 +695,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 cleanup_deferred:
 	fb_deferred_io_cleanup(info);
 release_framebuf:
-	fb_deferred_io_cleanup(info);
 	framebuffer_release(info);
 
 alloc_fail:
-- 
2.43.0

