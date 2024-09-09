Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0870897107F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1A710E312;
	Mon,  9 Sep 2024 07:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SfoQ78GO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDB310E313;
 Mon,  9 Sep 2024 07:57:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so19139915e9.3; 
 Mon, 09 Sep 2024 00:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868630; x=1726473430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
 b=SfoQ78GO1OqetDf2HKy4Uz/pJu0XmRFxhYRceDMnmF+LSxWojv+b7HgNZI3WYrz7+I
 0tRx9UI9N/LjdA2UX1Bu/+GRcjja33c6z00M94hRCxDFzOLUefR77NIT828FO1+GMaoX
 hcOLI9AbGAFADtjDwKdHkZqZdsRgYB0RM7g1LWsQpi3yjPpiaj+Ap+qW1ZOIAoGnaRAf
 kZP5mYCE9yVt9O+FPuSZTV7PTxNI7zPpm/xgAruieKfnva32yGtrwORwppzBT4mWRaBk
 gG3HEQ+OzgeGEeWMWVbsB6+Rc/bc3qaQY/Q9vPVq+lDKDG13GCumcRLKNExjjabxuHhZ
 uidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868630; x=1726473430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
 b=eYVp3kuI4xnK02x9svnsgcQvPXepmD4Y7LmFKkH3onnzRSIsiyj7H/eEdi4vacdahl
 SbU3QxtgZsCBhYK246st15A+I4AkhK4Sh0Fl01UYZoGU0DbumFM0Gv1puwEYWVw44Xjm
 bynbkqNQ2OUduJmw2yy0Vm1WaKEEp5Su7JkxdMHOapAizXGtwpx8CNmpbC8xndK+1pLt
 vpe8a4tbQki5g1wm3JwU6qtmea+npYWZjdZZGu8dtu8wpI299/vgjLHWT5Mb4ftg1kfK
 k8BK/cIonhajlt84BwIf0HKQV4kUt2zhLPjG+v4Te7aWOytNBvunq7fG3/mIj/pNAC+O
 bOQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVijVFMydv8aXobvTvl4y/xaumtmAh61wMmti3oUI6hKlfxhkl1N5/LUsUvLSz10tewski7tGrdmIc=@lists.freedesktop.org,
 AJvYcCVtTiYO3wNzeRivS5y8KIg0WN+Js8/Ipo9wrtfhHXA9S8nwkNgW3p5F4NbvyNoEPru3/1Lj7nH7apD+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKfzV1nL/UvV3ZVSXE6lkUhzy83tUa4t63PcaoidjV2vAaZwOP
 fAofx/3YkhbkZmm5hgQhXi+2T5Qmyt3JqnQKdxswstaC+oiEs8M2
X-Google-Smtp-Source: AGHT+IE10L70PE21eNLD25lAB8aBB8jSN0E1SHrHS6kqOQxmGH/7X/EdRl1RCvLCQcBxps/pONHtBA==
X-Received: by 2002:adf:e8c5:0:b0:374:bf62:bc91 with SMTP id
 ffacd0b85a97d-378895db711mr6586624f8f.25.1725868630119; 
 Mon, 09 Sep 2024 00:57:10 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:09 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH RESEND v2 15/19] lib/test_parman: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:58 +0200
Message-ID: <20240909075641.258968-16-ubizjak@gmail.com>
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
Cc: Jiri Pirko <jiri@resnulli.us>
---
 lib/test_parman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_parman.c b/lib/test_parman.c
index 35e32243693c..f9b97426a337 100644
--- a/lib/test_parman.c
+++ b/lib/test_parman.c
@@ -39,7 +39,7 @@
 #include <linux/slab.h>
 #include <linux/bitops.h>
 #include <linux/err.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/parman.h>
 
 #define TEST_PARMAN_PRIO_SHIFT 7 /* defines number of prios for testing */
-- 
2.46.0

