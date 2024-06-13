Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2285490688F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0D010E9BF;
	Thu, 13 Jun 2024 09:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A8wGD3NY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D0810E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:50 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-6c4f3e0e3d2so377934a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245910; x=1718850710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rI/qiwYumUf9WdznWs8PjjNV1aSEYVRYeuHEKQmKc7Y=;
 b=A8wGD3NYYYL0h4lyfDQOcrX8EgfLep3e/sLLjNw5RO2vUQyA7BtsrWyO+BD1fHG719
 imMc8ddnbbUNKG3yjxQQ5GhRoEgAIbsEMB2Tqql5Gepr5gnSuRz8S4SiwGQ0TyDHDQzv
 3+HF8C8qCs0arBOEziYRz2ZVDkBF3sjwr0TtnTwkh0wzmYVaprfCkSCcR8tM8m/NVx9b
 0Z05WkG5ANYfh3+D1YiTxtrgtUFuqaaMCaEkzb5MLTbCpaHStXbcIyGtYL41EiyMmN5g
 0y5HaeeqHdX2HoPiMZhvzB2be5Bh32Ox9E3R4q2wxF/oV6092rHQHr1mquTdKZiNejCR
 Qt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245910; x=1718850710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rI/qiwYumUf9WdznWs8PjjNV1aSEYVRYeuHEKQmKc7Y=;
 b=BV6udoB5iE0oF+R7Zoab50N9+pvpWeDf6LMdc+VQkWFg6EurhYAbJN0hPauNxQj1HL
 Bg2d6rJIkl3lZzGruOmnx/34ZT7jqKl7sus6hHJa9VFfwHRpFn+GfxyFWrb8dRGUcEXl
 tu6Oa86l27EKHwXDkbcPLIsKh23zWU1TDtm2easaaxM6riEVagF5U35mUIaK7Mi6WJQF
 STKVLFfPLIy+KlKfly1BgwHPMA3AOkpXHLjH70JAvtbkZAzR8t6GQsZkjWFWKkv19XFB
 h7M4GR7DQsb3ouQtmS3RlogblFknT43v5mOtnXQhsdwB9Of3xVpomKjcB8B1NnfJAmvJ
 q8OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHz3Hv/ogxmILkL0JE9howmh3QepZsCOWK9z9Cr1Ym7nk2nozkTncU3j2ttMBlzmVU4QJmBJquSo3SB5ycspjtkxjOAxN9uBVr9ToA+VXs
X-Gm-Message-State: AOJu0YwetiobHmNds3wGe5Zjw5xcHI3uFxwlDhst6b4dahIKcQb++qEz
 061lhZsMpEpPd9bCWFnQWysGIVw/O2ntMvzpy2o+X85KxOGxllb0
X-Google-Smtp-Source: AGHT+IEHZPxKX/RP4SBm4cAnIghTfWMy7FOuVWWLSjXVUtL6OKmdClkmrYCnnZGc6EFhsF+GbPMHHg==
X-Received: by 2002:a17:902:d2c9:b0:1f7:22bf:57f4 with SMTP id
 d9443c01a7336-1f83b730b3dmr43536295ad.55.1718245910002; 
 Wed, 12 Jun 2024 19:31:50 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:49 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 06/10] mm/kmemleak: Replace strncpy() with __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:40 +0800
Message-Id: <20240613023044.45873-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/kmemleak.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index d5b6fba44fc9..ef29aaab88a0 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -663,13 +663,7 @@ static struct kmemleak_object *__alloc_object(gfp_t gfp)
 		strncpy(object->comm, "softirq", sizeof(object->comm));
 	} else {
 		object->pid = current->pid;
-		/*
-		 * There is a small chance of a race with set_task_comm(),
-		 * however using get_task_comm() here may cause locking
-		 * dependency issues with current->alloc_lock. In the worst
-		 * case, the command line is not correct.
-		 */
-		strncpy(object->comm, current->comm, sizeof(object->comm));
+		__get_task_comm(object->comm, sizeof(object->comm), current);
 	}
 
 	/* kernel backtrace */
-- 
2.39.1

