Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D293EB87
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D50310E253;
	Mon, 29 Jul 2024 02:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RU4yPuEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BD910E253
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:45:46 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2cb510cd097so2074538a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722221146; x=1722825946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/nz1JHR4z8p+ajw1D912vGA5V6XqUcGmzMFKN4JA2M=;
 b=RU4yPuEk7KS+lowDW/TZZgoFdSR30ur5YqNSMs0ybXSt59UaWbI4teBsc4zURbcnOF
 xLSWel0hdSXWCvBCjkCZxoS2HMVW09dSiPGwGo0zIkofW/I9J+8UxdxUauPVjVzUoeU9
 GTqWxBNm2I/IsSh6vpCQUc0D+/qDpayKEIzz88I26R2DQozfIyS3I+yBGdv1ZXCXRj6h
 kgZaZG0/Sg6Qxt3+jRiL4aNtlZ8y1MKZC1TkQlJYPJzN4V6Yu2I0M8xEtlUStP3btZnZ
 77idOJJ9MZR+lI3LM1JvSxdT20qJAs31EFAduDvA2/FsvSWjkgKwa5KQ8s3PXGuH8v3I
 spRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722221146; x=1722825946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/nz1JHR4z8p+ajw1D912vGA5V6XqUcGmzMFKN4JA2M=;
 b=GLhUC3HGb51Osx4hKPtL7wDoHSpfRLJRnJYkM48tlrNfTnLfxkick9E6+Vo00PGMsX
 YltvJrUwyonRQqjgvF0G6K8mWEVwVtN3bryIvojJnDrekrL+Ng2zKKGbv7vaNnkdd4j/
 3t9dgfrIUeNIP4Fx5B3qhXfP8k6297tEaUAGYoTQSHPiDsEUZUrU6fGQ4gbHmrOp4Rpb
 EFDerL+0FJVXlRfNaCwlqWUtYs1yQTZ+ic1A+sRhkpq8Ekg5CK94Dd8X8OnQVLzHWSdO
 TKgSBfTH+ccP5EcS/BedTese5g54w1LY27l9IoLvMy29R90qpk3/VMvv+WB8fvc+GH5o
 PReQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Fjil5VlTwWSU6aiAHhdqqey1KnZdryLjF+Joqh3TsXbxd+dDs2DnrAo3Hm+E3sGj5PfV/H5LqAJTZ1OrvzpLvduCtdUGEgkFHP+EV+tQ
X-Gm-Message-State: AOJu0YwJm5PEfwtC+Q5JW3Ot2flEkxjHZhSHH6QZRbkSaphapQWAARfw
 Ocwqbvc5K4vBiZZQ9YOLzWStRkkiCldxwtybUTAUpfJe/RF//Ptr
X-Google-Smtp-Source: AGHT+IENkAKdnpSBtIYs5HSWqyoiT1QcCfPMYBJH+JoZ3TUHyUdae/0TZfvoMrDMQbplggd9XcCiAw==
X-Received: by 2002:a17:90b:4a03:b0:2ca:4fca:2892 with SMTP id
 98e67ed59e1d1-2cf7e095c49mr6901128a91.7.1722221145808; 
 Sun, 28 Jul 2024 19:45:45 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.44.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:45:45 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v4 07/11] mm/kmemleak: Replace strncpy() with __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:15 +0800
Message-Id: <20240729023719.1933-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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
2.43.5

