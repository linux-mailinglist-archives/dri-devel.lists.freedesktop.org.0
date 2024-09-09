Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B66971081
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306A010E313;
	Mon,  9 Sep 2024 07:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GJOxAxcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5438510E316;
 Mon,  9 Sep 2024 07:57:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374c8cef906so2607334f8f.2; 
 Mon, 09 Sep 2024 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868635; x=1726473435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
 b=GJOxAxcNJqzSJfplJzdMi6qg2MKaR9tXMgm7J3LgNl1GdyIvPx8LwFgD26l/ZHb2Ws
 upzWKEqY2QftNnbEHbr41ZA8Ro2ssIWAhaSL67S5sQHIzfw0++F2R/vOG4suRQNulfcd
 Fe9EoF+jiId4XVTrRPircjSSlIspv8GHhtIL06TQT322DDj4oLeCfuClbgwiCJ+tzP+y
 4nt3bfilbZNbldUptvFJ2jqoA7QHuCrvLo5jLEX01UYGXIN8ooiwAXwbz2qY4QEQgzum
 vYvj180G33qKQ/hxxFSKfu2upri5I3w5DWYeFikzyWPiEB2SQeDnmT4F2GD6wtEzQWQV
 cUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868635; x=1726473435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
 b=MZ/E3mjNxQDcUtHphx8W87kQ/OGujAmXjqGtXSvZEqK9frqiKvdeOMxCDNEoZK1xEY
 ZXVx8ZSUdIiuFRlB2i7yUn3FBXXLNLsLpiIqzZD3Li4HAmovntKiT7E5N9GjE24yaHaq
 nB+eaA6qz+BkA8kt8KXu86wlSeDU8QO/vdjkjxvDB8WqTr2To391XQ2C6LjuUA2B400P
 chyB01uKlikU8s8c3oGBrrdMpUpwNxzUfHKk/ZRuH7JNp8sgA9zkWgqrqMogwzXSIqKp
 piexPzyD8l4jJ+YCD6jVane6EXAH3glXhdmhTM3W2zh7xzAwfjX653ZuNbwustSbRAYb
 CYFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTrKBi+h1UMO9U1Gx248RR0DSdjAiIobfTL6OlIKMcRts8OEGbGPry65MFwpc0CCl+pORiKCxS/hw=@lists.freedesktop.org,
 AJvYcCVG+WNVDr+nUOtza8zM8oAW0zUpdyssNIkYlX1XF/QaewUka0rAvwdIWqlU4bzhm8bhZNjcBrvuRTog@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJMVR3NbguhSuwB6CmKW4SrUtqJVQxQDmzRhm6nzlU8lFa62J5
 /O/YLano/0OCybahyJYxHfMnCLXHYwK8YftQsdq48DzKq7eODmWn
X-Google-Smtp-Source: AGHT+IGFn7bjhhziiFk7ZlVWXk6e2N6wsS1IlnWqQqC142aEHDE+lRu2u+3J5phDWkNcaysihDjQtA==
X-Received: by 2002:a5d:4101:0:b0:374:cbdd:480d with SMTP id
 ffacd0b85a97d-37889654c77mr5657546f8f.36.1725868634534; 
 Mon, 09 Sep 2024 00:57:14 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:13 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH RESEND v2 18/19] random: Do not include <linux/prandom.h> in
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:54:01 +0200
Message-ID: <20240909075641.258968-19-ubizjak@gmail.com>
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

Files that use prandom infrastructure are now converted to
use <linux/prandom.h> header instead of <linux/random.h>.
Remove the legacy inclusion of <linux/prandom.h> from
<linux/random.h>.

This is the "nice cleanup" part, wished in c0842fbc1b18.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Fixes: c0842fbc1b18 ("random32: move the pseudo-random 32-bit definitions to prandom.h")
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/random.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index b0a940af4fff..333cecfca93f 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -145,13 +145,6 @@ declare_get_random_var_wait(u64, u32)
 declare_get_random_var_wait(long, unsigned long)
 #undef declare_get_random_var
 
-/*
- * This is designed to be standalone for just prandom
- * users, but for now we include it from <linux/random.h>
- * for legacy reasons.
- */
-#include <linux/prandom.h>
-
 #ifdef CONFIG_SMP
 int random_prepare_cpu(unsigned int cpu);
 int random_online_cpu(unsigned int cpu);
-- 
2.46.0

