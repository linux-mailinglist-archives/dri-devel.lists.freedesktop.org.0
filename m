Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7866393EB9E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E1510E2C7;
	Mon, 29 Jul 2024 02:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A5cuHR9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265610E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:47:55 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7ae3d7222d4so622375a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722221275; x=1722826075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YS5JkKLpH7rBBlezu3RsuBopuhXkHEJwrCmaySM0BwQ=;
 b=A5cuHR9Isl2N5KJv2dpVHpXcKMl36D01ObD5CPbUkPA1HbRwIltWn92LLyPBtYDUVU
 cpOBqfMzB2j7RSUF/RZoYnEN/EnQ4HcZHG+8O4dW0DmugZ8bBkhgcPPxb/Vo/4g6Vt6p
 NcEnNZIB8qioAEC16JYDx+lsqiKwOqRAKSivvqZr8zj2/yc03138pYDRyvYyJMixUsON
 SQGd1pMLqAY/AYsm23C+BKdrANWf5IPPaimBzpe5P4uqEi4JXbqeSKZzqYEgsjXiTfO2
 hleTXrLUYpxYf/DvebK5I8ZTPgMIf3oxYphJb4yqdJdGiWBHEPCQ43tJV7t0Ey4bQVGg
 uBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722221275; x=1722826075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YS5JkKLpH7rBBlezu3RsuBopuhXkHEJwrCmaySM0BwQ=;
 b=qtWXUNDwOxmOQ+jd4vf9wANt1RnRXzSoTnri838Iq+TV1+LGBYnlYAziLJv5qnHVVC
 12RdpF1taO+yh+jvMx3ML9iPHFOo43XNxQxUQqaiI5zlAJosYYxR9dy1VYc9RPYtOPMV
 m9DhbV9kGZYq1gLFHtCXGwyx3k5vUbNDRycZLfhO0Pc5ENtEU70+fM1XEXgn+Nzi8Ydd
 ZXWIE+1NYfkd7JaWH8EIu+h64Rk2g2MyhUeg5nPoNDiNMGKtreGl7rEG82y+ezSWYt+a
 k4OgftTEI9k1jnJKefkWhVK6LnVEBfG1+8SZgNwsmo2KDD6Z4XOyhLGte97kJdkGoAj6
 H7xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmhWfKTWOkcdtw6y8Dj4KPZBMWP75vUEhyARd6xKPlzrlTtNAUQ4DOVYeE0dJ7H23M8O4r6qx4vILh/9e2QNDNxWB/fq0u+C/DGWSFe4o/
X-Gm-Message-State: AOJu0YxMEqXzfN5RlwOJuNpJNUt3kF33Ypt75z7YfrxHgjYgmI0LYGRg
 5qsJzfNKczkoC5HgvSHxiQIy7tig2P7CitsoJsGU3eu+OOhNtPDD
X-Google-Smtp-Source: AGHT+IGXxWNnJLIJ5uPecbp6KsT2OOK8/ZuVg1FUEXn71WfglTXG9UPP1KLmHGuFVJ6pD1f6J8wciA==
X-Received: by 2002:a17:90a:e00f:b0:2c9:7aa6:e15d with SMTP id
 98e67ed59e1d1-2cf7e1fac4fmr7206984a91.20.1722221274655; 
 Sun, 28 Jul 2024 19:47:54 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.47.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:47:54 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v4 10/11] net: Replace strcpy() with __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:18 +0800
Message-Id: <20240729023719.1933-11-laoar.shao@gmail.com>
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

To prevent errors from occurring when the src string is longer than the dst
string in strcpy(), we should use __get_task_comm() instead. This approach
also facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: David Ahern <dsahern@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/ipv6/ndisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index 254b192c5705..10d8e8c6ca02 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1942,7 +1942,7 @@ static void ndisc_warn_deprecated_sysctl(const struct ctl_table *ctl,
 	static char warncomm[TASK_COMM_LEN];
 	static int warned;
 	if (strcmp(warncomm, current->comm) && warned < 5) {
-		strcpy(warncomm, current->comm);
+		__get_task_comm(warncomm, TASK_COMM_LEN, current);
 		pr_warn("process `%s' is using deprecated sysctl (%s) net.ipv6.neigh.%s.%s - use net.ipv6.neigh.%s.%s_ms instead\n",
 			warncomm, func,
 			dev_name, ctl->procname,
-- 
2.43.5

