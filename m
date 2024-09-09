Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154EA971075
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB2410E310;
	Mon,  9 Sep 2024 07:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F2nCXErF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA6310E30E;
 Mon,  9 Sep 2024 07:57:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42cb8dac900so4665175e9.3; 
 Mon, 09 Sep 2024 00:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868623; x=1726473423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
 b=F2nCXErFmdqlh9vmUvsqonYrjtJrwMeZ8QUYm8wJdN7EqRS0qJ6wzy2Ks8DoFIJTtP
 CxvZ6tLw7kBE05QLvVkawGy62RnsgtZZhQnuUheSVRB8tH/QWfv6wuN+oLR85wPVm30a
 l5gJMMjLZE5v2NptMk0WHM8tqBtHWwkvTFY1NWnU28bIodYJsXsOr9oEMFr+vdm0om57
 a3yxffZovr/e9hNiANJZToWJJJzMZ3W6wUyzzdXPhgBLZDmJrHkfZBXW44ePW8J4zPPr
 44fbk8GkL3dwqi4331ss68oacEE+DERPQuit8JHjCGpOYmeTPUDGw4Uc1CgE7d16y9yB
 4PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868623; x=1726473423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
 b=oiUjcQYLRKZJvNton6d+2MWwQN25h2ujDJ4ZGs2SIx1ovNizEyhHLv0QLJtmFXZY8v
 PJZ1zNDwcJz5iuhSpR/NzUEegZ3wVfMoR/ZfCE1+sqEdVQ/zdVue4l713D+tH0qHdKq6
 8aNEAWe8j5vsIo/pBeOG+/oBQQHrxyh4G5zpirQkaOu8D+RVm922xU/pnge5/3zxRGfc
 COHgFBkdZFEKV7WhdBcvUlFTqD4mHY1/aEsqivbeT5maDyc0lg63TGirjx69LpT+6TXc
 ECLscQxMjxKB0vIwtp7VgcOcFEe596DZl6K2qOYH3gTQe9yEqCzZUduAlD5Xa3dCaU5m
 +5aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOyj/82Le/EKl0YFe2QMeKm/1dZmOJfE7MxZzwgMFWS8DA1G1RtnjKhaRYazx7rxa9Ugx0E5FhsNw=@lists.freedesktop.org,
 AJvYcCWohzYcYEvbxcCcLSYi7LkgPYQpVjCy7WqXwHW3uWVklFQDYvU+0Egp+zrH8IYgfJrvzefxuIUDU4oR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTyS+WzxJh8a16IZBAtUWmoULObk7FaSPid5Q5yt0FLyc8ng42
 DeW8X5GTps+6UILwzXRSfael+LEqZ7oAtWg75uCuvTR0e7Hisn/q
X-Google-Smtp-Source: AGHT+IE9kxClsfj4lFt+9I6K+XsyLZJIMNPvzQQtiREHo0bljCJBd8rPdnCe8AqgSk7kgXsrHagO9w==
X-Received: by 2002:a5d:460c:0:b0:374:c35e:de72 with SMTP id
 ffacd0b85a97d-378895c53e2mr5981884f8f.2.1725868622808; 
 Mon, 09 Sep 2024 00:57:02 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:01 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RESEND v2 10/19] lib/interval_tree_test.c: Include
 <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:53 +0200
Message-ID: <20240909075641.258968-11-ubizjak@gmail.com>
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
 lib/interval_tree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index f37f4d44faa9..837064b83a6c 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interval_tree.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.0

