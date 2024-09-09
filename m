Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927DD970EC6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DF010E2DF;
	Mon,  9 Sep 2024 07:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ROZQnEDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D655D10E2DE;
 Mon,  9 Sep 2024 07:08:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3770320574aso2386902f8f.2; 
 Mon, 09 Sep 2024 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865697; x=1726470497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
 b=ROZQnEDNUMguFUa6uJ9ZZSoFyHlRz9hXm3W6/a6pQpKU44FM9oWmgy/jLCkJ0x4tCV
 9WyjFF69k1+Cy5hY+n4rftEyJpobD6bbV7XRu8Kg0aXgE9C2M7sI1KpYTAQK/aQsxTtq
 msN5t6F24fwHKeIfiHsA+MayQT+zgNRWZJIifBPUBQ60KA0XrdMeAsIrTrrbNnyG7tji
 D2A9AhNMvedZZzAcGSZKGo2L3U7nP7hXpxZuAq9CQNmmZLCKIdiXDa+/BTVEngXCH6Zc
 Pbzbf6hHkDTCQLl0dx4x1X5z186NOvg9fYhHgT2N6jnM26vkh5AQSSbCuoq0YDBAQ5UC
 KQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865697; x=1726470497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
 b=RSijTBzaNS1xlFVoMDqJACbHFvh2AeyUbCGt1dhMOVhMUnKJ9e4Co1MhK1H616ClOY
 Yolev5s+9bDUb2O1f2QbirOET6DLDm2jcwC4iajKWPWYSK7BjBabCgEJf0C43zcjvQGf
 6n8R3KEOHrlM16tlN9I5rQGCzAusPVzzvWRODUaR+24/EAXGucXw8izGYFBAVM88FsK0
 401R+XQCNN7nM21Zb4JojhXcuNkh65Qhy9mCMkMAFu2sotcwfof/acqu7x+zkyZYHg1D
 maO4SVcB9Brgbngd7TxANpfB8wtll0oFCplJ7sWdA5MfrSkUMqUPGuOZHPENrUzbVT0r
 ulhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoUKuL5s+6l2zba+xF4wdGHrpeijg5Dn0hqvzAAoLzBUIzHluE4k2lVKRrVRYiyg6rjeeKrZZ0WWXT@lists.freedesktop.org,
 AJvYcCX0V6mkTvqWOSssGcK+mq92OSgHltd7Wq4r1o1lC37jPDfe2pnmhPqP8NZovhI512InMRy6imzlYEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQjRt28TUev8NbsNuZjQnu5GH8oxFuA1hl7EFN4h2QU9flqaex
 J6rKy7Z0WmncWTevSu8cB2TPM4zEDz325T8cQVruQ9skNrrvhGEz
X-Google-Smtp-Source: AGHT+IGYyMu3Vg6t0QKAaHpT+Zfos7iWqitbr5XWvfDWFMrJwqorNUfbV12tuLSocQgEo0BB8LI95Q==
X-Received: by 2002:adf:fe84:0:b0:371:8e3c:59 with SMTP id
 ffacd0b85a97d-378895c2578mr7304772f8f.5.1725865697132; 
 Mon, 09 Sep 2024 00:08:17 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:16 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 01/19] x86/kaslr: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:15 +0200
Message-ID: <20240909070742.75425-2-ubizjak@gmail.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/mm/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index 230f1dee4f09..e17e6e27b7ec 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -22,7 +22,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/memblock.h>
 #include <linux/pgtable.h>
 
-- 
2.46.0

