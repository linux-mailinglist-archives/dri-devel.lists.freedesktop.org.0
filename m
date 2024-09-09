Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C1970EE1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FCC10E2EF;
	Mon,  9 Sep 2024 07:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eJNQMv3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8E10E2ED;
 Mon,  9 Sep 2024 07:08:41 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3770320574aso2387263f8f.2; 
 Mon, 09 Sep 2024 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865720; x=1726470520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
 b=eJNQMv3MmkOIdvBcJqnZut5sIH2nhY3fhMFvSY5i06MV+2qnhNGXRp6jGCOYnCusEa
 UArCVYXB0pSVsoYDhJTh3OoiOK3m0MeanHmIeSQBc24OOF5mn2G5zp8odN4Zy4tgNhkP
 GA85wGXnjlLyIkLC50PNOMMCnMmmZatyOHECHnwcla0pQnMa9WJk29mmiuSWI+ZmzZfm
 PZaHX7pbKEAJq6Sfl0ywWHutgtvFKba3k+6Xm55V/1+GMoM7ZL/yJ926Hvimv6R5pGwO
 OaoHW78lDs6QJwipos8AbM8jIhbDt+9OpyM4HNzYVNkR5BdoPoKgCuyG2t9aGUgAp12j
 IRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865720; x=1726470520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
 b=FMoK1PLSkvjxBTge884puI2oAKV74vUIJjLvli61vGCkS4kCKi1Ccmhg9zENmPC2sI
 +u4Q7glqipHCNyUGL57Ria0bZxf+vZ8BSLSmNHqPC0VGfn7Svl0xuq9jDSxlJl1+gyzK
 ZSV0VTqPhoREzSIL4gmX+EIeq3nU0Ynm7Acsvul3PlJEI9KmaBrgPZjm4Mi23VbYk9Mv
 e2TFb0wiKk3CYBeTmzTV5Qe47Q7pFByiwNmAqIjbieY0VahjvIEoFpiShz+Gb5JscHOD
 dw32nWuB1HEsCPngkAgrydK5X+KwIcpaXvXuBDj1W20vVIREcgVj+8+SD3hscOdYOzzd
 VyNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+oBIXcdIo2RyTALtrPnFccCug4eJ0qjBaXPFFhXTMqE3syywACsvtKpSzmAcYDKln5ebbcffBudZr@lists.freedesktop.org,
 AJvYcCWrW/Qp9M4YsfDRHt8sVCqAjH2NFgKmnCEiuteOm2mVnsshCKBw8clclRGde3uX/9kpTtnzLIoKUMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD81r1Cd7BE9BLDfDdhzny2i93MAg07lusQe/VX5Z8lclt/MHx
 OiRoF7Ce5X5SxY7QWRR1T7PsBZkjYsExWpbqaKwyx7g9Tsxi5V4E
X-Google-Smtp-Source: AGHT+IFpMMDkjMFVxEERLEIpvXz5Qb9C8Ij9QoDrxVBU1SpY+XXWpwkv4/0Rcz/ipgLNBmIk031jQg==
X-Received: by 2002:adf:f6c2:0:b0:374:cbc4:53b1 with SMTP id
 ffacd0b85a97d-3788967e494mr7339886f8f.40.1725865719787; 
 Mon, 09 Sep 2024 00:08:39 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:39 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH v2 15/19] lib/test_parman: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:29 +0200
Message-ID: <20240909070742.75425-16-ubizjak@gmail.com>
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

