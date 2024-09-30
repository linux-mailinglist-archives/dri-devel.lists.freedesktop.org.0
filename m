Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF798A2C7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3E910E441;
	Mon, 30 Sep 2024 12:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hv5xfeLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926F810E431;
 Mon, 30 Sep 2024 12:37:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42e5e758093so34290535e9.1; 
 Mon, 30 Sep 2024 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699846; x=1728304646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=padwceDith9kH638WiD07J9lxW9cmsB/QyloZLAGT/8=;
 b=hv5xfeLnnjUOjc8l7mDqb5zyDzb+e0yfO3h4fnIATR/M+P4cIKt+8dlPefiF7f5563
 +fJ2uwgkJZMTWl1NMOyT3nHiBsP6NETJTjLrMylBAOfqC9eauqs9Ck/8HNfL1E1ZJxVt
 +f46VkTO4TFdvzHOlrhRlUv345qIg8mkH1SQqp+SJAjdcRt5jUVTcn61cSTr8Y878QA8
 GZhL3dZ+IECekyRziQ+unzNuBRWpk1IvPWXaUFKyiKilPI7uXZL2aXmzZ9f9K8AAB7kU
 ikuv2uE3OElncVhuh9tZukrw3G2Bed7Vr+I5So6bbUi7psxB4HgPRf9hr1nP4pzuLlyK
 FCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699846; x=1728304646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=padwceDith9kH638WiD07J9lxW9cmsB/QyloZLAGT/8=;
 b=U0+Zq6k+qWqUBLHZmosW5n5Q/jouQrWfhBEkUBAcWnNCFHAJeizxBe6iBDP1yZHhTM
 +C/jh+nV84ei3Ni8345YAt5NrnsIoNCqBI0s7gsALUqOCDod8L+dYc3zX8XNSN+v6KkG
 qjd7pVZeHW79QYE56Cp0nCYiMhAQH8N1AJnvmJYh9eGxmvTAaPmgadD1bqsQXW8OSMdu
 JN70MCK4yQNkma1VJ4Vq8cvnjQY9b3yA/jUkTMXcdYvnnv1O/lJ9LVbd3LgLe70YbXPP
 GyfgbeoYtTYjXF/VFMbipMOLRRsYbauAai7PyQrwkscG1A5NaRUPhRF3BLDYYArSqF9h
 s0vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtTo6U1zODPt8XY3wNOkSgNmBB30u2ulcj5TcEaQRkzV5+57EvZoESXzCfJuBjqux3Xfb4razHHXA=@lists.freedesktop.org,
 AJvYcCWBmXyKAjpFMrdBudFxqZHcD7f5e5s5AGtbGy30TIEXFQ69pCBOymkM/ZQz/8PcoM1NsQ/xdMh5EJaX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysRWu4lyxpBzfh+rwEWA6i6YBpayTT3XohfabOUYBFcBoHFvHF
 TI+Wj0SLJkPWOEBubRg+NXCOxIAIghXPaszy6KI5WKHjhETztNfY
X-Google-Smtp-Source: AGHT+IHAZnkMewglqQ/9HzMtHISIRMWUmH9Pj6F7fJL+aYx8/KhkKe4NnWnDTfk2bHUTjX5xhdBmkg==
X-Received: by 2002:a05:600c:5292:b0:42c:cd88:d0f7 with SMTP id
 5b1f17b1804b1-42f6df6d212mr10003285e9.10.1727699845853; 
 Mon, 30 Sep 2024 05:37:25 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:25 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 13/19] lib/rbtree-test: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:24 +0200
Message-ID: <20240930123702.803617-14-ubizjak@gmail.com>
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
2.46.2

