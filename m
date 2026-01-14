Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D8D1BE59
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C3410E58E;
	Wed, 14 Jan 2026 01:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9AVi85s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B74D10E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:19:24 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a0d5c365ceso54616255ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768353564; x=1768958364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dlOXF98nQWsAI+xBrlydKqrONWGhVbP1fEx5oYHqnV4=;
 b=W9AVi85sDEJbTOgAFaPOBECgMhjcPTc3GdLuEpAsEqvG11XenJHcZRYxVqokq5J6kR
 HWhCjYN7rB2slcDRh+tS0NxcWznkcHvm4oxYNiUErb2rtKEOAHLZXbhDnGVfN1KOaKsq
 QhWtjTkjBk8rxBU2jP4J+/F1D/GsfPPSDti5sT3F76RIMPo/HqACFsuRbbcfku5IZNfY
 eLE/2YU9buTydHH/Y6ooGODoI1YxVX6uhblFk0oqy0KNHAgG5jsUuJT9kdyeBRpr28Lb
 kBbmqwpQZMOiG1IN7lVV4iP9l94gsyNtBEZAlwHJQIurT5gllTNMHRLELBqJMj8H3zJZ
 C7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768353564; x=1768958364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dlOXF98nQWsAI+xBrlydKqrONWGhVbP1fEx5oYHqnV4=;
 b=bFHnmkSC4HuK63W2d8fwNo+5EymQwvj932EkASJnwrqdvomHFBKgexeUaFGEOif3SS
 y6XD3K2wxjEXRcb0F5dQTu5msqaB/JqMIKZzd6BZublO98q5UDXxHL8Y/XWjS6yKvcay
 UqE2oKPmPlIqmMd5niMteaQ09oagEk+mPV62DgJmn29ELI4Ry8Nqx84bX19ch3KphgJu
 s/pvnl0TaAolg7oiOMw9HNuQhnANpqNMN4Zr/l/B5BNE6u+E6FRg3boITPYzWfz6uc+U
 rrzAVz3+W2B5vuFseRXR6M4tPFhL6P3bJ+KcBK8bFCNGYst5FZ3346CqpatsIzUhzPJz
 X0gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDRTwHuQPdqwx9lP/8jjFAPIrbABn5rCYOaVe/VTm6uSKFkqZKVrG4kPFnKvg2b2cgdS8qnosYzG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9dgQSEumTkRGR53ZeclBbaC92YHO13f96KGnuAjUKwrKYBbB/
 cY2aT5WVe+gou755ygYik/B61iL+/5zEocvWU5ZQY66x1vIEVurYTab1ztEUJgeg
X-Gm-Gg: AY/fxX59byPhG2qTNe3qDCjFjIwJ9q3AGM1y3C2r/JTtUpZ+rhf+bklSw5Psg1PvHL1
 sZqn/bZbTSuAXJhTrbuzuYGTe6dCfi06L8SQJylRRr551X2qbZ6xB8cTUQgn1D9bogZ977WYo/e
 kcuMeCewYFQeyV0ef3Sx6/PuLWfrALwX7b/Ec1OSXYPYywEGoSFedujEykKZNp58XrZEtm6Y4/u
 zKLdmIpr2AQDtXheTURVdsP0qgZuSohBMe7OzJXvvyc83O8lWnXqwHKemXfKRTu7r452M9g735j
 IRj+HVLN4QcXM0SfVPf/RdRJwwAGplR1EwYKr05d1o9KpqDUypml8gYi34HKyF5dy3weIlh1ojX
 /HfQWls3CKCkvB2k76DpGrMWe/KSBhhETPjttlCUQdUzcLGKQ2YCwdt58+VqdfNXRMTPPndk6jy
 /3rO6t
X-Received: by 2002:a17:902:c410:b0:29e:a615:f508 with SMTP id
 d9443c01a7336-2a599e23086mr9306655ad.28.1768353563768; 
 Tue, 13 Jan 2026 17:19:23 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2e26sm208067015ad.48.2026.01.13.17.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:19:23 -0800 (PST)
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on dmabuf filesystem
Date: Wed, 14 Jan 2026 09:19:16 +0800
Message-ID: <20260114011917.241196-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.51.0
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

The VFS now warns if an inode flagged with S_ANON_INODE is located on a
filesystem that does not have SB_I_NOEXEC set. dmabuf inodes are
created using alloc_anon_inode(), which sets S_ANON_INODE.

This triggers a warning in path_noexec() when a dmabuf is mmapped, for
example by GStreamer's v4l2src element.

[   60.061328] WARNING: CPU: 2 PID: 2803 at fs/exec.c:125 path_noexec+0xa0/0xd0
...
[   60.061637]  do_mmap+0x2b5/0x680

The warning was introduced by commit 1e7ab6f67824 ("anon_inode: rework
assertions") which added enforcement that anonymous inodes must be on
filesystems with SB_I_NOEXEC set.

Fix this by setting SB_I_NOEXEC and SB_I_NODEV on the dmabuf filesystem
context, following the same pattern as commit ce7419b6cf23d ("anon_inode:
raise SB_I_NODEV and SB_I_NOEXEC") and commit 98f99394a104c ("secretmem:
use SB_I_NOEXEC").

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/dma-buf/dma-buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a4d8f2ff94e46..dea79aaab10ce 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -221,6 +221,8 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 	if (!ctx)
 		return -ENOMEM;
 	ctx->dops = &dma_buf_dentry_ops;
+	fc->s_iflags |= SB_I_NOEXEC;
+	fc->s_iflags |= SB_I_NODEV;
 	return 0;
 }
 
-- 
2.51.0

