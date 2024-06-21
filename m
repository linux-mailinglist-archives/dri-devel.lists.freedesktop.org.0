Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1F911897
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824B410E8CE;
	Fri, 21 Jun 2024 02:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eX4t3Aeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3691610E8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:31:52 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-704189f1225so1617178b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937111; x=1719541911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYd5YNknE07k5DuwDR8qZLFs+IUn8eRucnjF7OV4ohA=;
 b=eX4t3AegPdKScYIDGhZS7Z93Ja7Iu5yFzBKQngUfgmkgbFk0Gjdu/ugGq24DFXYCE3
 4y2D/mEt/G/PG5ZBaMy+jH4GbUzdK+3hRetoVQn9Lw/FqNAC4AlXPYrRl8wIKCxQiLP0
 KRV+Mnr0v3PJn5cs7kMxpk9b2XcNv/oXZiCb1PKG1tymU5YaOx7RFh/W5If6wM1hidiS
 7OAxsDOo+x0u6sFGS2a+AfC2epeMPQMrL9BLUoZkykzkW0CGFYmcFEFQWXXthUJeEsNy
 HSHmncBHVU+grusqe9uq4Qg1DRe7wyljIJbRpKo309j37HgCxP89cLP58q5byLJ8Ucp2
 Zgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937111; x=1719541911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYd5YNknE07k5DuwDR8qZLFs+IUn8eRucnjF7OV4ohA=;
 b=m7LraPEMDjZnI4QV96RYjvWHSIxOimyYYwcwPhAVWJvQED7jK1eH8nosx76Q/pFQxk
 FdAXx6YnaZ1BPMoXEEEWIoW1hyVDf7yhjTjWTU4wOlr+5nfT8/RIF7kbTL9dhjNYBzQm
 3kNd+4nclegVr90FXhvbs3j9lnEh3llkhra+kUpA0AK6p5m1CM+Ue6OASCpIIzL10ZKN
 9HwcnKzMU3hCWjGDEjExc6BBGK6m68M2brrPFcz9SxUtsxfg+2qlJTK1yxbIhEznRrWj
 6/K7gAGowCcrUbdWOQ2Mjaz/NElU9Ktip5Vwk6YTJCLQ+KbxL6S22NeZTq/39rSF4DQk
 xvGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKtqMno1DKszcq7YacYthaCjLtvjGivenjoYV8hsaymJUW76Iqss8hiwybkzSzNqXtaSRsqTN8Lg2huxrIUDTHdxvP5o2e0AOR9nhfDrQU
X-Gm-Message-State: AOJu0YzC9e2c7Kn/HZa6H+DN1eX4OtbilWVjuKT93eWM05uwPZhA0CpJ
 4d6S6j4IyyfOC1eMiu6bnopMaZpHjUiRbumYFopU/GS/x1J434zI
X-Google-Smtp-Source: AGHT+IE3vqRU4TDjYUtGu1BjTuY8WxnNKb7eQY82UPvhwXZyWJtswQi4+ta6VB9SmiN5potLRkiFDg==
X-Received: by 2002:a05:6a00:853:b0:705:ed06:cc64 with SMTP id
 d2e1a72fcca58-70629c521cfmr9225541b3a.16.1718937111523; 
 Thu, 20 Jun 2024 19:31:51 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.31.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:31:51 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3 07/11] mm/kmemleak: Replace strncpy() with __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:55 +0800
Message-Id: <20240621022959.9124-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240621022959.9124-1-laoar.shao@gmail.com>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
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

Since task lock was dropped from __get_task_comm(), it's safe to call it
from kmemleak.

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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

