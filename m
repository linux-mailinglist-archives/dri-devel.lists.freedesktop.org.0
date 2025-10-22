Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF7BFA2AD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A617310E6B0;
	Wed, 22 Oct 2025 06:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ssn.edu.in header.i=@ssn.edu.in header.b="nLeIAYCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2072A10E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:31:16 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id
 98e67ed59e1d1-33bc2178d6aso4454762a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ssn.edu.in; s=ssn; t=1761107476; x=1761712276; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9f3uvbf2qrrt/ziC3rimn8Y/fAQpzGjeRz5deOCQI/U=;
 b=nLeIAYCWJMCvELcqPUPatUlD8UBrnz8WRQOjvXIWoWjuIOMJm4N0vPofCc3KDMG85V
 M4rJbx/WtPNUsduAKjK3yIQG0hJDNc4kDWAgqetS1qPil72V1Zc6A6szksKJ1XbkkSrJ
 RRcBbSoAyQ+qeKJKAnOGo57PhJuLE+TRZxLoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761107476; x=1761712276;
 h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9f3uvbf2qrrt/ziC3rimn8Y/fAQpzGjeRz5deOCQI/U=;
 b=c/o6RI5IG0x2cSM4ugdMtRq/dSzG5NSIwupsgKbj3i29wucD/FNeS/Dt+r5K8VHkLH
 aqRep1XCc7OU2/4CgXUkNnSSBn8Vixyg5m5qsXi9WNRi8oB18m30sn6LQ+rukpJ6qWRP
 JpydytV3rweIceC7jdo+4BteWUtSOChG4W31P3NdMkHdjmVg7MbPLXxflPb8/LL/9Z/h
 eYliMH1VAfiZDWux8iRyRtw/fqkfctd516dX0rCQ2jI7hUyFKs1pHoq45K+ExSOH+GBX
 Xe80+LMjFCLpZAOAFiR1H53nfKTkTnpzU5A829PiE+dt7o8KM9E1oJlVJAr0WSu1fSfC
 EKGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQhn6/3bMkQZ7nXQcmLrSvn+uCWGCgVfOWVaAO2mjOBAMke/YTsgBK1cOfUmC8K3uSB3UCs/FE1P4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxK1DbogwIYDEJyxYtmVtBy+qqF+JX6Y2PeBAjlWOaKxlk1iD8G
 Lu874DdkhPE72SUfKHGd9BtRgO+jI9t9Pkc/QHD1KeBkNqwXdi+9Psu6OP5yzdg4HMzwmVSFzoy
 lBpw8OygMJN0bJ1Cuqwg26YaVku+ERqCrNghIRsZf1IV/zJ8Tvp3jasOBsgz1
X-Gm-Gg: ASbGncvYlxDM+N3Nhq9RhDqKPj+8ESRXWx+kDoKviLL0oBdsUMwdxlJoRUFo56ZYIpq
 1t0GRHQpuHbQuvcAuUwS8r8Nu27zpNQUuf6g5wpZpecasgNhoC8AR47FAOfzJtv4WS0lI6Kl88S
 6IOWBQwtCZrjb8kOM5zZvqRpxoO8V4fmQGiXZHU8yug4/+7SbsE2ZnmXiMze/Z2TkGzXjuUO2iY
 poBgte0mPSTfNFqYjBQt2TWh3gyJwISlLHjFfyvTMS1hSnjX3J1/NG+j5INc9rft1n3fxipnVg6
 3OmXVMT/eXjG/YA3v/enHNf6O8HgBR/nwiQxW3w/XLKuUCmRj6Jr5/TEuRvzJEUVisF2EUKkebo
 MwYAauFee5MeTa+8nTOm7COcdCelSx42Nehep6JlKOMIdNMgvGDNkKon4X7d1Q6LOKdXUbXP25X
 i5MDDyFsLVIGq2k+ToMiNfGnh1nrq5ooeghLpnIkcOdMOT6HxF0b2KyLz3BcqE7nGImPfGY7wsH
 Uhu9oBKWvyDqrU=
X-Google-Smtp-Source: AGHT+IEd+bNYS6vl4w16DgOMSV/S7pPkiZN6xIuC+GDZaXXvAtfmV3zwE5YULJyf3rlJMlDMMOTqoQ==
X-Received: by 2002:a17:902:ce0e:b0:273:c463:7b2c with SMTP id
 d9443c01a7336-290c9c89680mr216879095ad.3.1761107476259; 
 Tue, 21 Oct 2025 21:31:16 -0700 (PDT)
Received: from biancaa-HP-Pavilion-Laptop-15-eg2xxx..
 ([2406:7400:1c3:33f3:2f80:d146:31b0:93aa])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-293113c1f4fsm2240455ad.116.2025.10.21.21.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 21:31:15 -0700 (PDT)
From: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
To: sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, lkp@intel.com,
 Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: [PATCH v2] Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Date: Wed, 22 Oct 2025 10:01:07 +0530
Message-ID: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Wed, 22 Oct 2025 06:07:43 +0000
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

dma-buf: improve dma_buf_show_fdinfo output

Improve the readability of /proc/<pid>/fdinfo output for DMA-BUF by
including file flags and ensuring consistent format specifiers for size
and other fields.

This patch also fixes incorrect format specifiers and removes references
to obsolete struct members (num_attachments and num_mappings) that no
longer exist in the DMA-BUF framework.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510220802.svbgdYsJ-lkp@intel.com/
---
 drivers/dma-buf/dma-buf.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1c0035601c4f..4541f8ec5d62 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -571,24 +571,22 @@ static long dma_buf_ioctl(struct file *file,
 	}
 }
 
-static void dma_buf_show_fdinfo(struct seq_file *s, struct file *f)
+static void dma_buf_show_fdinfo(struct seq_file *s, struct file *file)
 {
-    struct dma_buf *dmabuf = f->private_data;
+	struct dma_buf *dmabuf;
 
-    if (!dmabuf)
-        return;
+	dmabuf = file->private_data;
+	if (!dmabuf)
+		return;
 
-    seq_printf(s, "flags:\t%lu\n", f->f_flags);
-    seq_printf(s, "size:\t%llu\n", dmabuf->size);
-    seq_printf(s, "count:\t%ld\n", file_count(dmabuf->file) - 1);
-    seq_printf(s, "attachments:\t%d\n", atomic_read(&dmabuf->num_attachments));
-    seq_printf(s, "mappings:\t%d\n", atomic_read(&dmabuf->num_mappings));
-    seq_printf(s, "exp_name:\t%s\n", dmabuf->exp_name ? dmabuf->exp_name : "N/A");
+	seq_printf(s, "size:\t%zu\n", dmabuf->size);
+	seq_printf(s, "count:\t%ld\n", file_count(dmabuf->file) - 1);
+	seq_printf(s, "exp_name:\t%s\n", dmabuf->exp_name ? dmabuf->exp_name : "N/A");
 
-    spin_lock(&dmabuf->name_lock);
-    if (dmabuf->name)
-        seq_printf(s, "name:\t%s\n", dmabuf->name);
-    spin_unlock(&dmabuf->name_lock);
+	spin_lock(&dmabuf->name_lock);
+	if (dmabuf->name)
+		seq_printf(s, "name:\t%s\n", dmabuf->name);
+	spin_unlock(&dmabuf->name_lock);
 }
 
 
-- 
2.43.0


-- 
::DISCLAIMER::

---------------------------------------------------------------------
The 
contents of this e-mail and any attachment(s) are confidential and
intended 
for the named recipient(s) only. Views or opinions, if any,
presented in 
this email are solely those of the author and may not
necessarily reflect 
the views or opinions of SSN Institutions (SSN) or its
affiliates. Any form 
of reproduction, dissemination, copying, disclosure,
modification, 
distribution and / or publication of this message without the
prior written 
consent of authorized representative of SSN is strictly
prohibited. If you 
have received this email in error please delete it and
notify the sender 
immediately.
---------------------------------------------------------------------
Header of this mail should have a valid DKIM signature for the domain 
ssn.edu.in <http://www.ssn.edu.in/>
