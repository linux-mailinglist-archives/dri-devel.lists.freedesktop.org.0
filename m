Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A89298A2AA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E8110E40F;
	Mon, 30 Sep 2024 12:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ddb6UUmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35A910E40F;
 Mon, 30 Sep 2024 12:37:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37ccdc0d7f6so2206333f8f.0; 
 Mon, 30 Sep 2024 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699838; x=1728304638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzOLLRPC71jtL2OjNuAlvY4gjd1poR9VKDBddhyc4rA=;
 b=Ddb6UUmjUjel80GJLaFrEcpPvUrBh2J9LJ6rTMy140Gto5xMFsx4kuTwr1wxhnG6fz
 rNccTbx0CvLR6At785YzaXKsP/tRX/irXZHDZeuQyjBi0e8x0YSOl2M0SBN/WDUBlc/7
 YJO3+9oioS1XY2FV++LrZt6J+p1dwL4EP9Qj3nkF2sYjSyDUxujArLf6zF1G2FIXGrg9
 izwZmBrTnX7OdGcSlf6KCD4l9vEeFvf09u7JWawuvSz2Rmg0zsOmASu73PPlW2Ip0Ci+
 5aX8s5PKvCBp7rCYtYLnnbLYcR9Zsn7EPeLvleIa3J7wbrx1wlrQxn4dZuIdbhvj+H1J
 jvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699838; x=1728304638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzOLLRPC71jtL2OjNuAlvY4gjd1poR9VKDBddhyc4rA=;
 b=kBa5Wz/Uo+0DDCn10FFGV3Y+ldtr7ga1n/Sxso0QUOC5870aDkTiAQWhp6I6LEh3Ve
 DxCeatYxi5MvNQZSSr3sYMRinE/d+ownlbqs2IutPsJesn1YmjkWkcqVUgze/uerg4sl
 iUOCx31AIzqFFKNKaq5Yitc7lAuVY7DdpUj91GY4wFXjhNc/Hz4NB/pmc6D1FvSNmjC8
 TAvj/tH8NdHakmUeW5glQbpDLvm41xdKNzxlvAH+jy0pNJdaSFSDyRlO2v1yM1Qbetb+
 dgZ52eenEQ+m6dU4KqGvFlpMjNhOgvn+cOq2jOWq9IZ1k4nEFtIBe4yn40P6635MDiW0
 5j+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8P+AGrjWCsm6zFqiCyEmJPCnxTEqrq6+T/nCq7XCkYJBUEziHqtD+XkUsqzZT8xlffqlUi+MT/3bf@lists.freedesktop.org,
 AJvYcCVyW8BtV7TtvY+iGAi3gqY638PTD0bGAEnCKHWMTkjs3DeXdUPXvLVxQEJ4/6U2cu7RdgZsM6GWJnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySj8F4ULr6JjyWYXFcxSyCMEWuNoYMuFG0PKbHhS4fzxkEIgvr
 T7j9xEhDqABXQjaObSOXvx1Fj34PHhcNH3wBx/FLcHIz5XaJe7YX
X-Google-Smtp-Source: AGHT+IGh71qi0qyayzgI7eFDFpBLWxTr/OTyditWnrNY5k5QUB6Kmr2d+RBqzeFs+cdbH+f8p3vxFQ==
X-Received: by 2002:a05:6000:108f:b0:37c:cd0d:3437 with SMTP id
 ffacd0b85a97d-37cd5b09c91mr5194049f8f.58.1727699837996; 
 Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH v3 07/19] fscrypt: Include <linux/once.h> in
 fs/crypto/keyring.c
Date: Mon, 30 Sep 2024 14:33:18 +0200
Message-ID: <20240930123702.803617-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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

Include <linux/once.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2: Include <linux/once.h> instead of <linux/prandom.h>
---
 fs/crypto/keyring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 6681a71625f0..82fcc5683649 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -22,6 +22,7 @@
 #include <crypto/skcipher.h>
 #include <linux/key-type.h>
 #include <linux/random.h>
+#include <linux/once.h>
 #include <linux/seq_file.h>
 
 #include "fscrypt_private.h"
-- 
2.46.2

