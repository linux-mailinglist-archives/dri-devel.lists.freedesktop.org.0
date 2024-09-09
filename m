Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D18D971077
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F9810E311;
	Mon,  9 Sep 2024 07:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ErijuGjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C1210E311;
 Mon,  9 Sep 2024 07:57:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3787f30d892so2469732f8f.0; 
 Mon, 09 Sep 2024 00:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868628; x=1726473428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
 b=ErijuGjcvonMiK+kOMgr1S3u9ZKezurhV+IOOZCISKYbEilXG+6I3tuhCuxPlK8cbc
 b4oR/oAzMGPWcpr4d9DBQpnruxTD0h9Z/LYzrOoS5f1XwEBWOrL03rwKHR1dnN5i3mZH
 2uQQ1YDCIIgvscOpTFAa8ZrYT4tmAurn34n4in69RZwwRiGKEnDDRp+uv+sCuc8y/pOB
 fI5LyKdHEdENEL/QQ5U0ehFsD/WXuqsRecF9bi5IDef0kFSKTOFtjGte9q9rTCGyBwiU
 l9CUxp38cv/oj2Aa/ORac2UgAYHjBsRzrjJG+2T8SBum9O6Gp8phdXYu5XgTkLSjXa7j
 zgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868628; x=1726473428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
 b=iVB0HiWrNBn10oKYivE+nzFTN5fjr6bQirjap+A0e1/eaEZDwCXmsVPYdGRnV9Jl3b
 4PMJyZqA5DARxqAGaGXL1UdL87PxM408G3Go/hpRNcpNzl+TW19lBJXaiRtl8d95gziu
 yeuVfK03nqkTla20pTS7+mx/KeY4TF/gzL3yA3D1AvoOi8RoLxUJ90VG1Ym2/ZCAWjMW
 bgoV/5W3NuL6R3YW2tB+C0PhctWywJyvpypHw+Eg01yXjK4EwdKSqw+ocu755unjT9kO
 PHutjAjlNWqS84lPMTALjot6ez/EP4m1Lk7gGa7f4EhVOM8M8Zh/TDxV9mBvwxss3Q/P
 qgDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7mll8n0fVhTAccZqd3mBETqILbpgGYWGkSADfFjpESKTez/amyTias/9/rINE0pudr5g6lRnl1Nfx@lists.freedesktop.org,
 AJvYcCWxIVk7gRhgLRvFp0oGwLTvDdisK5c1E3JsSFgPL3ACbafLExPW9AmyrGhWGWnqnraUXvUGj1QgaFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSpAbw0b2VItdlQPYp9k+aSKu1EPSe6Ts+4Gjy+ItUD46DJIGn
 2zdg4+H7RYp2NYypQZy37CefEeJXA28pNVEv2w3ShpdpnZA6hIDK
X-Google-Smtp-Source: AGHT+IF890nGYevdgrqUf7UHJ87LKcir0BiPP7YH573XiCGqtakWSqkvGhsMvBroQEOSJMo347DAIA==
X-Received: by 2002:a5d:4fc7:0:b0:374:bad2:6a5e with SMTP id
 ffacd0b85a97d-378895d4894mr6553002f8f.28.1725868627558; 
 Mon, 09 Sep 2024 00:57:07 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:06 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RESEND v2 13/19] lib/rbtree-test: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:56 +0200
Message-ID: <20240909075641.258968-14-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/rbtree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index 41ae3c7570d3..8655a76d29a1 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/rbtree_augmented.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.0

