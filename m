Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC393EB72
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FD310E214;
	Mon, 29 Jul 2024 02:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZT50cd18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB15B10E214
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:40:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-70d1cbbeeaeso1794404b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722220801; x=1722825601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rSpj4+mjUH2uIm/J6/DitPwV6C8fJ6cAywoYkpJrFY=;
 b=ZT50cd18oJh/PY9poWqQ4o7iRf9PmUwzYuibj0JWQGksOMad4sdI7J6xfQ0MB4u4qy
 twwPtRjW6fnrPyh39ITbwxf1BjrJ6Whql+xSjErKYzom4tEUk1wdKeHrbr3UfIo4+yZP
 zAwjHHklz/VA5otsFacbzaV2PgHEaIrR+FqSSO+S5ofqNLh5csd7SChP1B9Vr8VdmqHJ
 czgNLjuONm1i1LPLd1ukMfqLcLwKxRXos7ggd74DyPpQKfVmptmA8Yoy1jQqqeC7u6x4
 nzDcsKc3Cc09VIruxPof3pvz6Lo8oA2OL2as1iZNgmEaTCwbVnMYdGpXWfgiEJB6tdcF
 iLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722220801; x=1722825601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rSpj4+mjUH2uIm/J6/DitPwV6C8fJ6cAywoYkpJrFY=;
 b=kmVEWxi3ww2zSUG8Q2yO4nUBTKqrdWqZZCrlbRNtYCP/50ut3v4u/gi/diPGvYXyNz
 CRnlWOeQA24B4MLd7401s65zgaWoZn/kBh+MmtUW7DdKRyS7YZbTT9ucRSZxA8CvXv+u
 UhjLuz0iu+FqyJJpEjNnk7FYer+5SMeXUsxfFgr8o5ZnJ9tiKFctp7k/l0z+IL/eRl2B
 +V5+CRGsB+U+Ug5mbt6ugq3Dfnxd2tpPygE8zmX43lqY1d3mg0pckVMDEFe990bpBsqV
 J0xtVAsErAh2d+dEr9UJy9W2xV71JHgWjZa/fGSeu/rh7n4/dSiDikX6O30IvWpCCEId
 4bXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6oiU0fVlLiA09qs3RU4GeYFmq+rRNf9VU0JXAVaFjk2kQvOEBFGvOZZt06+A8fa+Vs5jZl2XLRiuy4McZV7dirFmdV7bkNawODj6XipN7
X-Gm-Message-State: AOJu0YzQbUWcSYZVtCVtsPf9yv3RCSdu6+tdaUKt77T24Yf9/O3xDq/C
 DGiXTdlgX76XTURlsgjWx3o7+H6g5toysBrm+8Uo2Oi80G124s5x
X-Google-Smtp-Source: AGHT+IGTYP+13dgbaXUTcOaiyJPHukRZsfD9pPSgLtBCe0th4rvzpLqZDHRAsUFno3V6NU5AaOlIiQ==
X-Received: by 2002:a05:6a20:a105:b0:1c0:f2d9:a452 with SMTP id
 adf61e73a8af0-1c4a12a2e61mr4874235637.13.1722220801130; 
 Sun, 28 Jul 2024 19:40:01 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.39.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:40:00 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v4 05/11] mm/util: Fix possible race condition in kstrdup()
Date: Mon, 29 Jul 2024 10:37:13 +0800
Message-Id: <20240729023719.1933-6-laoar.shao@gmail.com>
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
index c9e519e6811f..41c7875572ed 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -60,8 +60,14 @@ char *kstrdup(const char *s, gfp_t gfp)
 
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
2.43.5

