Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54437970EDB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5B910E2EC;
	Mon,  9 Sep 2024 07:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BcrgmaoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0A810E2EA;
 Mon,  9 Sep 2024 07:08:35 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42cba6cdf32so1475875e9.1; 
 Mon, 09 Sep 2024 00:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865714; x=1726470514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
 b=BcrgmaoVbO76BY6pVfpXezRjUffg3zD6/VBQcNCgVzKOG/UsF9RYEiwITzS5ofm85h
 fgo4kT7QpRiu0CjAyhspHFA6gNjEngnVJAmdjqqZsdFNXMVs47zz/ENbrqVKSg4WXEZW
 X4aCUNOzYAPpnFnuC+SIXUtVJaxI0l+AN221yNXMOo5rnteajqYiLPVWuLNtuY6TtK5l
 SIw+BXzxeFamwmveqP9IXlcj3YUr3Ghki8cEQUSurpTX/i54NM9N6Sl557oQ0C7Ggy3B
 quKyn9XcZhAmpF5jMBEc8HPo9gESi3ipmRBcVZAqQdgWQ5VvU6b67mWKuM3oK4SyrCO+
 uXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865714; x=1726470514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
 b=LPiZ0NN5wMWV6mrhsOUv5UPWL94fhbB+z2GPps3sFukW80qO2fVZ3y5ixmJBW6RQOt
 m5I4BLEp1Xpc+8lDbgpKNDzESgm1+1QxJyqc0ROFw+KcQvq1wWl5LIoThGCXcSna8Kk+
 aGaBAqQhlkVnP7O5KSYLjaueN7F+LIcEm22vd90jDY2XNFVP/ANZVgT5K/mO3Umv4nUU
 ULgQ7sVtbzGDB+qfHRa9G02hH1E/ADTkkfcv3SJBr3LYjKeKPcNsjwXMsuj3GJfo6cPQ
 HsxYqzHOgxPIZ6WQYhnLKIWCSrdtmfGdVea8/QNsfTxG7i62rb87m01iezP+0F8auBnB
 6kog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqfF2TJ3swxuA0omZLrxgTTPo6n2H0s00kZ3NhC3Pnu9fLOVOMGJlOYzk+nWvxmIPcPV9NBwmCzEg=@lists.freedesktop.org,
 AJvYcCUzQWhsjxxeG3OyM1rOrhGG4BnsM9x8WeSHOBGaLtHnHySKh1nnXK28tyHjs7JfU+/HS3I47CzE0zay@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2jftVgNC2K/BEywy/WCNen+7xp6MLn16asCWDZ7G8wj/WFIDL
 7MZ6UDEppsvRt2PqxysjokFDd56ac8Ddpi0b2vrrJPfsI9mSfj0i
X-Google-Smtp-Source: AGHT+IGX2jPMfg9AUfAU2IcCFjSCwUfQ3UDJSxJNlu3hawnJCsbpvG54Tw49u6Zx7j4nUhAvEOwTXQ==
X-Received: by 2002:a05:600c:4446:b0:42c:ac9f:b505 with SMTP id
 5b1f17b1804b1-42cac9fb8fbmr45303025e9.31.1725865714158; 
 Mon, 09 Sep 2024 00:08:34 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:33 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Subject: [PATCH v2 11/19] kunit: string-stream-test: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:25 +0200
Message-ID: <20240909070742.75425-12-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>
Cc: Rae Moar <rmoar@google.com>
---
 lib/kunit/string-stream-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/string-stream-test.c b/lib/kunit/string-stream-test.c
index 7511442ea98f..7734e33156f9 100644
--- a/lib/kunit/string-stream-test.c
+++ b/lib/kunit/string-stream-test.c
@@ -9,6 +9,7 @@
 #include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/ktime.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 
-- 
2.46.0

