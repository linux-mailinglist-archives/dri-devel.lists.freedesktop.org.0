Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB59946D38
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E389F10E0CB;
	Sun,  4 Aug 2024 07:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jra3C+K4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810CD10E0CB
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:58:03 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3db1270da60so6745490b6e.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758283; x=1723363083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVkI7ws3sH8SytGBGHon98LlMkqoO/ooAo5HpqnjZFY=;
 b=Jra3C+K4300j2uVF4CTupJStLMn2jSgRYHSdrhs3F/2Fm5lcZc2s5BK9fqTIYdw3kC
 VF7STgAbf2TkUk/c4R/jeSPRLiTxRjrQYy2dAdLbhXlOBd1G+8G7JM2L5DkgFnmChppc
 KD/C2xey3aJLRosAyHvKxvWP1649nANm8GKxujAuA+ejXo3mR27nKPqsqOYvVdtt8K5H
 /6I+f6xZEp6hlQw6PDpjdEdhPDkMKN0nBz3AiCS1Yd5RAecGYNF4fs0GHdwTvVwFVyqr
 JeTIQ3NcDlZTzE3u0sxo+3pZn7zBUXMGeshEvnc7zcZ2AdSYhbra1aP7Nx4mT6k3/ght
 C1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758283; x=1723363083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FVkI7ws3sH8SytGBGHon98LlMkqoO/ooAo5HpqnjZFY=;
 b=Ur1xvfgwMtnu9CSrmrtthpihouw70t0v9HDC4LLyWQsRlN9USJcj6435sYnIKhSRrB
 Zse9VWYLI5kyOXaDZZ/v+klCU6YBKFqXeLzndrqOOZ5yzjqBGG7lruGr5nFsbT05y6Co
 /cU+/2NIRDvYl0VGIo31E++WxZr0uVmCaDYp1cFeCA0A7A32BebreAykPYX0eSV58ArO
 oeNnleKGCIUD0/mQ0fkf/ePmlDF+Y3S3KSeSeijJ7CpyGDzUIqMSrAX3aQOfS7+fmj9G
 oJ+yS9LPFRUc+ixM7Grxv7ibFpRY530kC5pPOlaZ9sW50GfhnaGoDYpKTVX3sG9Mfpnq
 9X4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUibeIlb2CivxaIQOUiy2V1HxkVNgcleapI6hlJjjGAtwV9hO7CQ/c4GxsyxvxhwCtqkjGBbfOsBfX3qL+p8p+yRZ6U0uFyJ5BprmrVWlCL
X-Gm-Message-State: AOJu0YxvrGsoSDy59U/J9IDLIIkW3VY3K9arS4Zw+YRIr1/2B3LWsy9p
 nb8FRZlr/giuGn/O+rSbyxwR274XpU6Tia1wbcXdKEvNdMqXqB0r
X-Google-Smtp-Source: AGHT+IGvj96nN6G8dNTQwO1gCnAi0LCFIOOEmeeyoUDneJo+nlGiP3jzVP2As4CYicNVTrPVKHFDvw==
X-Received: by 2002:a05:6808:16ac:b0:3da:e587:3e1d with SMTP id
 5614622812f47-3db557fc2cfmr11867023b6e.4.1722758282670; 
 Sun, 04 Aug 2024 00:58:02 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.57.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:58:02 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v5 5/9] mm/util: Fix possible race condition in kstrdup()
Date: Sun,  4 Aug 2024 15:56:15 +0800
Message-Id: <20240804075619.20804-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240804075619.20804-1-laoar.shao@gmail.com>
References: <20240804075619.20804-1-laoar.shao@gmail.com>
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

In kstrdup(), it is critical to ensure that the dest string is always
NUL-terminated. However, potential race condidtion can occur between a
writer and a reader.

Consider the following scenario involving task->comm:

    reader                    writer

  len = strlen(s) + 1;
                             strlcpy(tsk->comm, buf, sizeof(tsk->comm));
  memcpy(buf, s, len);

In this case, there is a race condition between the reader and the
writer. The reader calculate the length of the string `s` based on the
old value of task->comm. However, during the memcpy(), the string `s`
might be updated by the writer to a new value of task->comm.

If the new task->comm is larger than the old one, the `buf` might not be
NUL-terminated. This can lead to undefined behavior and potential
security vulnerabilities.

Let's fix it by explicitly adding a NUL-terminator.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/util.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 678c647b778f..912d64ede234 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -62,8 +62,14 @@ char *kstrdup(const char *s, gfp_t gfp)
 
 	len = strlen(s) + 1;
 	buf = kmalloc_track_caller(len, gfp);
-	if (buf)
+	if (buf) {
 		memcpy(buf, s, len);
+		/* During memcpy(), the string might be updated to a new value,
+		 * which could be longer than the string when strlen() is
+		 * called. Therefore, we need to add a null termimator.
+		 */
+		buf[len - 1] = '\0';
+	}
 	return buf;
 }
 EXPORT_SYMBOL(kstrdup);
-- 
2.34.1

