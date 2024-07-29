Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10C93EB90
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C085510E2A4;
	Mon, 29 Jul 2024 02:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U8+nIz0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716FD10E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:46:27 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7515437ff16so2242486a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722221187; x=1722825987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aN2V+duoRLP5mjQclolxXRJl1PN7YZIwA2PLtFFVKQo=;
 b=U8+nIz0HHhqKXLzBTSNvA2SRSQ9cccKWMSloHPNCAnh18EtJyI78z+/r2efToqm8+b
 SUqvB18Ih0IO1zRbuEh7wBDGx46uU7YCG1bE/9y2WZlFCFf57nUzHgF0DAenj3v+npoY
 eJn0eYOhb5TU0JNStMPp314XQxunsAUwiuOJ0Zd7x1zDlU7aXDuS3cUocu8fkTQG6aqs
 k+5G11PQidXI6Wi9q0jFH3GaPD2Cq8/Kaf09XvJu13hlTgOQkwSpYdEH6AbOLCn1tbQg
 GdrH+3jBn6X2KoA3LmXFskeA798weg0bh1zk5qEzV9uZxB/cF5dnbwVQY6kWgzgQdt5R
 A89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722221187; x=1722825987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aN2V+duoRLP5mjQclolxXRJl1PN7YZIwA2PLtFFVKQo=;
 b=xHqVWO/6ozZI2ZNLwhA13o9QP+lPcehUuUWW2dDbqvCE1jw8RaNuufy1e9wGJezTvZ
 QTcFyFnJCFzoTXf0MyJqNYo63upZeNbwqvWnm0xdnYZcuFuTHsnm6LMfSCm/ZK4W8fQR
 sxthCDll+0uKmcT6hWy2IasPK8MKja/8tllIO0jpnB2suLYOTlSw67F6+38M9kwu+RDC
 1IQVbEe2Hk2WmGjVYBg/i3N7hMByAGk+HAD/DbUa6t1F6sE3UIndDkWn96sfRLfevSN5
 ToffZo9x2BCjixnLx7cH+VxyuSyRAG9rPJlwQd0CUHzxDJP8gXs43/Pr4CoL+i1eK6m9
 uJQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc/yJdYcJgThI8uodXspMJrxETaJ3qR0uQRuhhzhxtX1Ek3lqi+mihyASTti2zmUi7QVU7av1H0ECED5zDwOpLB/OU73YehEhiCDWekdTx
X-Gm-Message-State: AOJu0YxXGe/Rh6GW8fLpQLIiGGmfEVRDahvgLaLJW7VvMdq5mcgNbIgV
 g4zpjsWYznfv6TtSDlhIBUtlbg5y6hNItSgf0X1PsTiN7qqkDzPN
X-Google-Smtp-Source: AGHT+IFg6cYKlkoyAPcpyLktfLarITyb9Rzi/fq7hOtiqCqd30rMJ+pCgZRrHbxyCAgQM++WsL2P3A==
X-Received: by 2002:a05:6a20:7fa6:b0:1c3:a55e:6199 with SMTP id
 adf61e73a8af0-1c4a14ded25mr9866605637.44.1722221186954; 
 Sun, 28 Jul 2024 19:46:26 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.45.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:46:26 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v4 08/11] tsacct: Replace strncpy() with __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:16 +0800
Message-Id: <20240729023719.1933-9-laoar.shao@gmail.com>
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

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/tsacct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 4252f0645b9e..6b094d5d9135 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -76,7 +76,7 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	stats->ac_minflt = tsk->min_flt;
 	stats->ac_majflt = tsk->maj_flt;
 
-	strncpy(stats->ac_comm, tsk->comm, sizeof(stats->ac_comm));
+	__get_task_comm(stats->ac_comm, sizeof(stats->ac_comm), tsk);
 }
 
 
-- 
2.43.5

