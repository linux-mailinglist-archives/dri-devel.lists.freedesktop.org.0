Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37B3971079
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8610E30F;
	Mon,  9 Sep 2024 07:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfI0ZIFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545910E311;
 Mon,  9 Sep 2024 07:57:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374bfc395a5so2284012f8f.0; 
 Mon, 09 Sep 2024 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868626; x=1726473426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
 b=UfI0ZIFuN41qN3HGANVEqdQnmmJ29LzNJzYczFA7Zq0EHYR6H0BaSRsIvcR3IgXuO8
 va5sK7rkNzUKTgrvwuX6wCaLXOSlZmgSiFTZHPCzGG+LDqD1d2uEi8VewzL/bYYCu3SQ
 VP24DX7PIVhHhWA6Pxx8H7M46CdMObRwt9jxaPUVzfpw5P/OVgvvZYJCHarrnrXtiWbZ
 UJnWzqXi+4i8jH8//GfJc0myG6agV9FC/tgy4UXJOyRRXc8dSbYpYeYW1RYczYrbigcw
 o6+lLTVN47cpaKTZuzA8QQq1Qk3By+H01TETM0e9j4FbpbqaexIIK+1I544X0J7C6gFv
 rWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868626; x=1726473426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
 b=H7pQY13e4ILbHcF4nv9/x8V5b5chZtzENzvmoqWbSuoNTOd/3j768mxWyW/09cScJd
 0Mipeua6iyRGAma3SZLwgApkNERUdGoLtd7sfGYzRNV7ZZgr8cfooNaNrYdVtATrqSzu
 r9Z2BN6p+m/J8PJsLDDdOrwg8Kdy0uxR/nPABx0GTP/VXnYXCNrLvvmB4fwlxgDysZiQ
 UdksuYye3VSoeaZd0BTpZEyT1cbjnE899KRCquVm5XBYk7VWlsn/OFcuGSCA/p0qRcTX
 YpEGGlRFU+6F8MisSVlbDrKgulByK6nSyVJEzcSDchQeDPtpHVtLIej++HQaFTc9YUq+
 9Xwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMmVhH/TaOMUGzI/J+ptV/a7v5y4eOGjIQiLi7KPEPX7naClvCXn9HBlLhRrWJjh5yJXRuJwYt/x0=@lists.freedesktop.org,
 AJvYcCWbMrPGQf0keNYu3t929PX42HbYjGFsY2vkBiNpBrtJumZ60NNgB+Wnj2pFVI9diUN8hTuyfmIaBsCk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYmANH7mcYOLiN87gpvkTFI+5/B/cU641K7ZqJFIxSNj6CULIo
 XS++EgcYoWz1fGokRkPaEgif3xGEE1+s4O5mGxNfzQG3RSZqhMvuNHJd9O+/9bE=
X-Google-Smtp-Source: AGHT+IFPgZJXpjY5OiDYTjI08iQ6tSwI+j2L4W948bn3btzf96vyOqo41buC3MxpwztDunJSgtrhpQ==
X-Received: by 2002:adf:a395:0:b0:374:adf1:9232 with SMTP id
 ffacd0b85a97d-378885f1a1bmr5455621f8f.19.1725868625748; 
 Mon, 09 Sep 2024 00:57:05 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:04 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RESEND v2 12/19] random32: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:55 +0200
Message-ID: <20240909075641.258968-13-ubizjak@gmail.com>
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
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 lib/random32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/random32.c b/lib/random32.c
index 32060b852668..31fc2ca68856 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -36,7 +36,7 @@
 #include <linux/percpu.h>
 #include <linux/export.h>
 #include <linux/jiffies.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/sched.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-- 
2.46.0

