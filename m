Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04B946D4C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6549D10E0D6;
	Sun,  4 Aug 2024 07:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FHT5ay+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444AE10E0D6
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:58:53 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3db130a872fso6647051b6e.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758332; x=1723363132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iy8s8HUuCpYYzqYVYDLibKnXKIG+UtFNyRBbbBdMpkI=;
 b=FHT5ay+7zz7IIMKjZC7MdQWmxuO/zD/q3PKmJ1H3xMsm0yv0nQLna6PdCSu7AMlrSh
 joJ8MUzR5zEZxfnb1I6fpPx604ETzd0eSnm+AMrR9BMLuv7VuKKrg5cvpyIMn5WtZ9DO
 md0iOXvZESIMT3eFual0nm60oek+FdM0c8/AWRce/h4B0Z0dWqexY6vy73SfFVYfyY/+
 a2SWt3uRQYZsygdmxk6dYSKnlva8xcgLa5CrfdQoW8R3o1Wl+l35orGVeC342hdfckeK
 CFcGPeNKDW2R2z3Jbr/qq6uFy4ol6FHI+p8r1OKZS9cop1dDneGMZfVe+OFFodCKPGrG
 LFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758332; x=1723363132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iy8s8HUuCpYYzqYVYDLibKnXKIG+UtFNyRBbbBdMpkI=;
 b=EXkOKwthoynKsxH14s2RN3ahgdXn28QJJtXlPeIWtFYihfsBbuQABhQCTBkW7Cvalp
 kIV3Onz1dsEpbbM+DyaoBWozMaRgcaqh7AIwMhvotSEnTh5JV0LzszVsCqQzyhA86mQv
 xsG/MdKDQacXIpwujNWMcYABj6L/umIO1n+NppoEDACKxo5cI8FEN3+8NUgk8sDOoexW
 0Mt7P3OULGnCmsjTwH5udayeaFwPTb4wBwUqQQf/Wd74TM27CM9fkfn4KlDdsZDxcUQx
 YJi3LD0nicEsrVEdWhhx4ZvmWZYl+U23ryWs388uF9X4itGtCiAJEEOwx2hxxtTvdlVR
 WK6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsHwvEC3moV0gQtmnUyoYXB5zF6JO3qHHetVxeIN2QMVAdnJLZ27PO0b8Da0nHSSsJO6E+XHE+23k6a75b722mlg9ymlRLQbsHRcJ154j7
X-Gm-Message-State: AOJu0YxMdPo1tvtxv/9QJ5XQll7D/7rc6E4rSFPqBqS+Sz89b9BQ1oKX
 +foDQLPX/btxZnQgMwFolzeSSBEXWKN3+gBvEAvOMLcWezA2+eFq
X-Google-Smtp-Source: AGHT+IEAdxuBVNyLOuAyS4g3ON7ORD29wxk4r6CpWYYml3q2XeTU12w4OJdy/NnFgIlYXJGGtsOOlw==
X-Received: by 2002:a05:6808:1984:b0:3d9:9e78:420c with SMTP id
 5614622812f47-3db5583270amr9335216b6e.38.1722758332352; 
 Sun, 04 Aug 2024 00:58:52 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.58.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:58:51 -0700 (PDT)
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
Subject: [PATCH v5 8/9] net: Replace strcpy() with __get_task_comm()
Date: Sun,  4 Aug 2024 15:56:18 +0800
Message-Id: <20240804075619.20804-9-laoar.shao@gmail.com>
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
index 70a0b2ad6bd7..fa3a91e36ba0 100644
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
2.34.1

