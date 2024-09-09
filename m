Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB318971074
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A866210E30E;
	Mon,  9 Sep 2024 07:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j6PVeRRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B582710E30E;
 Mon,  9 Sep 2024 07:57:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so19139175e9.3; 
 Mon, 09 Sep 2024 00:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868624; x=1726473424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
 b=j6PVeRRo5e2GuWTjthO0qmRwnosliyAr0ROqmtSh+4bq9QPVmHLFclg+5IVXCFespE
 4bo44GDHFjy+wY7PslmlyMeadavAkua+giKQNKPUKslgZ4zDhK68Kc8m2DcxcTKiVJRn
 bXJPr7EOk9Yza9ESA8TcmmDirpqEtQWj4z8yWpa3V9QqbRaMGeTozWTxGZKhaCYneQVm
 Jk9SL6IJ2DMPIvNZI2wA4V9kTaiIampzmM2ZuWvzXviBa7w+FWqXMajNw1GgNALHLUKE
 YBL4Pkx0ZLwLxPMucf+3zDmLnHWba58VluO5AQ9VOmSKY6XVfly3bBC5scD2DH61s+ZO
 JMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868624; x=1726473424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
 b=DlMSVQKcMcCwmT6eGRHZh+YotKq6VcCRwg4RoZZlznks2mSvAMTKkGbcLiEGSXEGHm
 Wor7o8wY2kqe31xlzfeJs0l7R/ZpDARxKXNVQ9jExP71L9+V1iPmEZmN513jBtdgh105
 UwLk4aZlNsKAu34tCAA02CYhNc+wpUJpePNIvYeydz4CxxLcZ+2bmqeSMhJ8twonp+vU
 me2MEn8FOqbiVSE3QK6U4SHexIiwH0LEmCupXKXCFnC0WtikucS7mE5QOSY9Heu7/Hlr
 9uzaDAbRLRvyYEjl/RSUL8BrFhUnZ7dOq04YqRQdd6uOm4Jajfs6lTTukLTdIvgJ7Wmk
 ABtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYBbwGB8jlJpO0Y31e4UgQdZGPydUZ8jKU73kVajJQQhJ8M1SNgNg7W+bAIUlM6tAGkTR6lWeBk+c4@lists.freedesktop.org,
 AJvYcCUhhd9LzxgmqCI/odYyaNpti05jUy4VlTSKZdVad44tE6tjTLeIU0qln0aZ50pVTt085BxfbRrt6R0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzlt8bLziYTri/n0P9DBO5Pc3kvUnrIdTp3PgkHRBay5wA5HExW
 9A8XVB3wAqasndxjWVMTJmiC/p1dxAJUQFastbh0d91nHc3TgVwI
X-Google-Smtp-Source: AGHT+IHsh4JSj0n795jllGPCHtcshmYEB9h2vcO7+qPsciOrvVvisGOWJv6LsOPnSs3/6a6/hCfK3Q==
X-Received: by 2002:a05:6000:bca:b0:374:c847:848 with SMTP id
 ffacd0b85a97d-378896a5c24mr6994466f8f.36.1725868623978; 
 Mon, 09 Sep 2024 00:57:03 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:03 -0700 (PDT)
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
Subject: [PATCH RESEND v2 11/19] kunit: string-stream-test: Include
 <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:54 +0200
Message-ID: <20240909075641.258968-12-ubizjak@gmail.com>
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

