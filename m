Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD1970EEC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9330B10E2F2;
	Mon,  9 Sep 2024 07:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XBvgC57F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3894710E2F0;
 Mon,  9 Sep 2024 07:08:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42ba9b47f4eso22360075e9.1; 
 Mon, 09 Sep 2024 00:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865724; x=1726470524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
 b=XBvgC57F2MAMlBZqVjD4CotBWcpC9d9VFMNH2FcCZZElhts0mSV5HWvqFab1wylL+/
 oqrjqZN61GWCoMmyIyxNHXK7qDRfLShg4yMkwOTnZyr2XHkrALi36ZVRiqeSZZOA3cfp
 X7D4eL9E5kuGtRm0yYw4eChGz7sU+GL+YjEWAmnQLHksP4bdXl+FUxOLAjdiM1UH5ZtM
 y4QH+RfabAu3QY8F761gedRwcozJ9/ZAuBAFBidTAPErWp0Vels/J4PZXvo2jjD7U2KY
 cKWFLc0a6fv+hS1ybwtnRluMR3SISjCt5GS3luReJVQGq1WJ/db04DbXEyBZWCItrXFf
 mkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865724; x=1726470524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
 b=ntZmEbI3pSS2lXkbAD4pLjrKnfPURuug9z3StkKFgkVqWxPqnSLDny0HPS3CJtZifO
 FM4Z8rAfjK2ANcg67H5Qu0Bu8eIVaU6Rq8RiErh0ZuG7/HFBCHo8NIZLBWlevZVwuHD/
 2OnA7CInGG6U7/6KaDur+Ez8MKuZgfoTH2LjNKbk/rcYdrwRb8RIpbwzlEV2TCFJcRZy
 0NQoVtY2ADyH+A751j4pxvZh0vmuMk3vbvMvt8+pvZKn23aUf2poT1W/BhwOv5gRzmW/
 xtLekn3aBvuhJacCBXLQI9oMFkUZOf1JMou/xaqoIKzOPcqfApZzJ38t7E0CXrgTIm97
 /XsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEydmN2Rn1gfaCmxgoNrtH0LzXyRgpc+qVEINkyABjjTLtZdVhnDCB//Dsh3440XZQCAhJ4LgkaYs=@lists.freedesktop.org,
 AJvYcCWbxgfMK6OBWMsikMt57G+8b4tNf7OGHJSfC5a5cmop/vYDb5K5Z0eLo1yl+p9bJuuDKUTPhGpms0JX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIv9ujFSoe9+WAAMXLWvgq4KWZJ0c9CmnKHU3YrjmlQDgxneBz
 o9iwlAZNLc8ld76HEhVmBaOkYrlKqm/TTpFsU8lqfUCMVR1DDa1E
X-Google-Smtp-Source: AGHT+IHr6jnt3r1zP3GHq+t+AZJwdIrHH6hLL5Qy5jAi/UzNGLkV9sIPHS79jlfQirVSgFmx9JKzEA==
X-Received: by 2002:a05:600c:4e94:b0:426:5b17:8458 with SMTP id
 5b1f17b1804b1-42c9f6d1d95mr61186805e9.12.1725865724488; 
 Mon, 09 Sep 2024 00:08:44 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:43 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 18/19] random: Do not include <linux/prandom.h> in
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:32 +0200
Message-ID: <20240909070742.75425-19-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
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

