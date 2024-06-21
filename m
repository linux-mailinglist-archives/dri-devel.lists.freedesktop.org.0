Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7619118A5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46DA10E902;
	Fri, 21 Jun 2024 02:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YWX+Oc1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E6110E902
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:32:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-704090c11easo1257625b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937158; x=1719541958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mM/1S9T2tBYoZCgE31Q/lEbGdBggp1bwKT3yTD3UzMc=;
 b=YWX+Oc1/1ig+bgb1GJd4zVQcl8nnaqEg0qWWyl8TpXc206zELwVgboetpQQzWMPyGV
 glDO5dJ8fdG1+pMw/9hqLIEpL3kBb3uJW92EVdEGu50ZT5EcCBgQMxhOCXWeQAWPSg1k
 gi9cWFy55ZpVXqgiDlAiVjW9PbuJx8FbrHJPIjOkjuPdeWH5FrZ4BBWXYV4ETy1po3uC
 xtymNnM+ZVweYVy0T8wlO4RZKkQo9MJyvCs3FDxVtGBah/YMM6fQ+5E9NuJp4aIsNJ5i
 2u5rccl0L/HPlKX/6ek7e7TrHctWdP14YaJj9E0iSj5HHJe+yIqHABKi0D2FhAHyVWFd
 RvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937158; x=1719541958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mM/1S9T2tBYoZCgE31Q/lEbGdBggp1bwKT3yTD3UzMc=;
 b=nlAFXGKiHo6rPGAz4rI9weID8WNIw/BZsQ0teF7q1mIf6P9Uy7nhnzC9Vx/+SgvpT0
 Lx8mySHPyPI7FDkDf2TY8PJV/6ZJ/swSSxdbjTBhd0Zl0fbGqQ8/I90zQQYiFokqUOWp
 1usePoPRvnNlcq1RYptJX/WQ1Z/0U8MksOocJ8aA5H4NZteh1QNZGqMSaol8A8K2Wjxb
 y8JhAhYKT9SrW3rUzr9+HOyn/6f7LW3AQ0JC8Y/Tx//jX3GPxkxa5iIYBzBiKYsSd7xI
 JkcOAUJ881ykfDIThKE49X0S54POQtQBv2zzcb2PtlrQ6PAWxbgXNBJnjgV59WHzhIlz
 4gvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz/TK7T161fq5L/Ku0HVh/6dudnLwMA9JYjN3WT2trCrjc+eP7wyPbI0XHiWnaKe+K+WTXTk5Z2dGnAJ1KgILzNVHGeVARQNawEZlvG7V4
X-Gm-Message-State: AOJu0YygZIQBKcFZ6xEGi5Hx7/MbB7Y3qVifEr1SrbsIb+6COHXv+snZ
 3vhhFhEZ69CUaLA89gkxfQBGb0w0o6uKhhcx2Umu5y4snmbjufH6
X-Google-Smtp-Source: AGHT+IHxOQrDg8mR1N6VheTp8u8eV+XoRh0OG7Yl/1zkogSK0YkzXLknkEls7rTyfvffHbYdw2ahAQ==
X-Received: by 2002:a05:6a00:9289:b0:705:9992:d8ad with SMTP id
 d2e1a72fcca58-70629c6de86mr9102308b3a.19.1718937157754; 
 Thu, 20 Jun 2024 19:32:37 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.32.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:32:37 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v3 10/11] net: Replace strcpy() with __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:58 +0800
Message-Id: <20240621022959.9124-11-laoar.shao@gmail.com>
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
2.39.1

