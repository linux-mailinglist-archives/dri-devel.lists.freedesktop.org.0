Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF498A2B4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B03A10E434;
	Mon, 30 Sep 2024 12:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WExihSNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F5010E431;
 Mon, 30 Sep 2024 12:37:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42cbe624c59so34207835e9.3; 
 Mon, 30 Sep 2024 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699843; x=1728304643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfE03GoB2dUE0X7JHaqSm0tKtFoPw6ruHh5YI8xKL2k=;
 b=WExihSNvGaTURc41w9ZT2LyoebiJ4C1yQhEs4Y75chGloB3EnOZho6VAb3Bs5rpM8y
 zm3oe1nOPxuhl7buw/5LsZp4tmqjLRaRdZL+fBD3Ft9585rvrl1oFhuPlcbGRpqjpbhc
 dgGEzVPL8Bq2wTj0qERDxLQb8HzBusDftiy0ggcmdybc0MRftqxXeph0e6n8BFBFJA+e
 pn2oIWc2NSIMFLFY6H6G9OeaCMNiZ6GApijwrR55aiJc40Ixzr2aHCXIEHKZ5+YMpoaK
 AJdyxIIjpNN/nX7QPNKUnInlsjbbdKPo7hHK2qtjPz7czCCVtQtRGucsEulcDKK8yxDY
 NYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699843; x=1728304643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tfE03GoB2dUE0X7JHaqSm0tKtFoPw6ruHh5YI8xKL2k=;
 b=QzwYTNYTxjP/riS+nHnPVmX1UNO1lV3IlObx59XysWkc9fvBmCO+/M5oJ7TwhITUDj
 9BRT7OVxZP9PO8kqPJ8J8EK+I2QV8DKP4d6S0K57Jnwod5zuKFa17CiJA/pp2Sq/5Q0n
 8+vMTqu3hHmC5+/NOvz8KTRZUn3aiP427Zkq8zdXmF82senOZe2mJHPDIag9Y5sRNTrV
 qByh24Ua/GrcuKt4kDYGf5WjnfPUqQa4uuCxck7/bpTjaAKeT89R9Hi4okN9VFsDT0DJ
 37AbL+GmN9PyHBIJnDKWrgLGXNTDKEqJavxsukhX7IZXgee9adsF+Oe6W3wcQi7rcNk4
 M5yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUejXgCLOd/mUDIEoOsd8eKyp1uNrvI+/qqWhBj/YgbsSRUygQ8jU9k3tF4OY6SXQnN1c4tVP/Q2XoT@lists.freedesktop.org,
 AJvYcCXkxalszHaW4dYaZo/cxKiIF0Q2ScmhWptYa9dI3az3egM/qMnngSCgRuftXIy5WmRen0vQtD8uPgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXJ56yb7vc0wfoMJoVMBXhNAOg4TWdyR64+CF+E3zflR1JhOqL
 FpM2qH4XXcaoFWMmDFY3o6qUV++c0vZhhgC64IuEq4rdmlAi0KZH
X-Google-Smtp-Source: AGHT+IHyexJvOjpRbo21AjAs38QcS8a1X8lQ/VRW02l+0t4b6bl/r6U8twtDvjQga2qNTvuV88EQdA==
X-Received: by 2002:a05:600c:4454:b0:42c:b58d:98ad with SMTP id
 5b1f17b1804b1-42f5843312amr86700225e9.14.1727699843491; 
 Mon, 30 Sep 2024 05:37:23 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:22 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Subject: [PATCH v3 11/19] kunit: string-stream-test: Include <linux/prandom.h>
Date: Mon, 30 Sep 2024 14:33:22 +0200
Message-ID: <20240930123702.803617-12-ubizjak@gmail.com>
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

Include <linux/random.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

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
2.46.2

