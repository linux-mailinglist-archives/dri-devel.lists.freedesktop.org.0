Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AB9F0466
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BBD10EEF6;
	Fri, 13 Dec 2024 05:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LA5W3T47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E0710EEF6;
 Fri, 13 Dec 2024 05:49:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-728f1e66418so1225252b3a.2; 
 Thu, 12 Dec 2024 21:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068967; x=1734673767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m2jUPvsdlfQUhZsdbtI4Ke1sLD5+tvHbQzW9Gl1gyas=;
 b=LA5W3T47PvwIf7VmXGnZPFB39WUEhKo7m2Em+r8J6qf0S0I93mTrVAOLaGapaKH64V
 Pdww8aFHJm+jIK3org0dLcJ86lyic4eVqOtJ761bKG5Wx75KbXpwbkl9ITYsZo4FErcg
 wEov1VhKGY02TQkbxDkBg5gQm0r32u2hlCif/sVMgYn0hIqi1rkKd6FMIrDTuZjqFhFl
 BA5Xl9dcm9QkikNplPXQjsW4/MLSMN6GcygJrhIKlnuPcoTGHr4OGztiYQDb9RRq3WQe
 UXu289hLPU+hQyDdab6ZY5raguxeNZQQrmFCIw7XVs3mW/E0jqQaJoh6EVVsjSAHx4Vh
 LoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068967; x=1734673767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2jUPvsdlfQUhZsdbtI4Ke1sLD5+tvHbQzW9Gl1gyas=;
 b=XkP/L/JedEfzX5KOsJxsQt1D7wyv6NdIWDZSaVzAX38Wx1ZAaqG7YH4ial1sK8dEZ5
 oXlp77x/1FqqHKYdugp85J5Mcqq5nMNfoKWvNlhWr+55FgNVXOajC/TLZjui+yBeiVsp
 eEAb2Z0BxBYAT/bYyYhIWDabnSS3ZxYynUN2jaGOWfNAa4Rb2S8+hkHL8YLTmMcpm8hi
 XopNBGaM7Whd0fuiCJ9SKmsPbH2zahsz3ubci6P/5e0dB7tjJtTfxStxU7L5d9yELRY5
 20PMBdYLgzqfSTV9nDt6DMcUk40WS2Sn/OaEek4voIYmz4XnK9XLinSOhliGcVJoavWM
 jxzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPtdmGsbYDus5geJXj4hyaK1Jl/fXX1RptTx0hj7ayu0mFFKrzed4OwNW0RZ19r5DSoKfXy9eXW0I=@lists.freedesktop.org,
 AJvYcCVfN45mQASctwiPvmwMuAdZN3Y/hFq3GN+PmOUX0wNEXfCWjvUPGIYdYkYOV4i2ZXqFbEzkIAMjf9b7@lists.freedesktop.org,
 AJvYcCVvTuMRknmT83sk/vF+2N0dL4v7An/BVz0bzO4PRN+Ms/n6uG0Alr9MIKiHzJNu5G8sk1aBQtP1aQ==@lists.freedesktop.org,
 AJvYcCXcCyTitm5nQN2G6N6whO0J+dCqHA3XpQvoPQYaEyh/JzEUkqIuZUsZNZiwg+iQsSG2nVCsjxlYsDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5QI0Ey7lM1SYcy9g1M6pPdxTIJPBL5opRhAIHocac0gpr4Cx2
 6qW2OUHmzSlgCt1cfJA6hO9PR0wq+sdy0WhuFbsVRlsGihluDTlY
X-Gm-Gg: ASbGncsxj/I6srSDlns1syc9CIa6r+Fzw2wJB3PHSAAAl4PjfDaJJYlVTmT7clOyOXi
 Z++v/fbpooShycVHUjN3DRv8bW+bJ93e2ZG82bdoI2W3vWi4b4cqtYfQOj+EeTfepUl2J023Ib4
 2oZqqneVKZYpcKNIHluyxjSQtZIReHUcSBcTe4jfgUJggDN+dNSYAlo1aGhWPnzvDQbRZCHTJWg
 Uk7AMFXdXjpwG6lD/eIwyGaolqIxicaI07ar8HnaLkPNPACi4sUAoTeOjADjojfVY4crELiCln3
 mqtk8Fk=
X-Google-Smtp-Source: AGHT+IGsjn2HsD9B470GSaZ7/WuS4a1ciiqbzWwWUR77XR0Zla03DKiQ+x82aV6yWtJ1LuxULtoYsw==
X-Received: by 2002:a05:6a00:b46:b0:71e:4786:98ee with SMTP id
 d2e1a72fcca58-7290c2702e3mr2257553b3a.21.1734068967116; 
 Thu, 12 Dec 2024 21:49:27 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725ee10f928sm8166032b3a.32.2024.12.12.21.49.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:49:26 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 7/7] fs: Use %pTN to print task name
Date: Fri, 13 Dec 2024 13:49:18 +0800
Message-Id: <20241213054918.56441-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copy it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/cluster/netdebug.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/cluster/netdebug.c b/fs/ocfs2/cluster/netdebug.c
index bc27301eab6d..039d99f951ea 100644
--- a/fs/ocfs2/cluster/netdebug.c
+++ b/fs/ocfs2/cluster/netdebug.c
@@ -122,11 +122,10 @@ static int nst_seq_show(struct seq_file *seq, void *v)
 	send = ktime_to_us(ktime_sub(now, nst->st_send_time));
 	status = ktime_to_us(ktime_sub(now, nst->st_status_time));
 
-	/* get_task_comm isn't exported.  oh well. */
 	seq_printf(seq, "%p:\n"
 		   "  pid:          %lu\n"
 		   "  tgid:         %lu\n"
-		   "  process name: %s\n"
+		   "  process name: %pTN\n"
 		   "  node:         %u\n"
 		   "  sc:           %p\n"
 		   "  message id:   %d\n"
@@ -137,7 +136,7 @@ static int nst_seq_show(struct seq_file *seq, void *v)
 		   "  wait start:   %lld usecs ago\n",
 		   nst, (unsigned long)task_pid_nr(nst->st_task),
 		   (unsigned long)nst->st_task->tgid,
-		   nst->st_task->comm, nst->st_node,
+		   nst->st_task, nst->st_node,
 		   nst->st_sc, nst->st_id, nst->st_msg_type,
 		   nst->st_msg_key,
 		   (long long)sock,
-- 
2.43.5

