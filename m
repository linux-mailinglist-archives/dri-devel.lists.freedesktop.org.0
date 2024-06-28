Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E9D91BAC0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2807B10EBE2;
	Fri, 28 Jun 2024 09:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BB25ohRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBBC10EBE2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:05:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7066f68e22cso281571b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565548; x=1720170348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=BB25ohRCQsuGfI1AnsZ5DpFBR3cEWxuKXqHOPum7C6zkC5F6JesTU9RKiZu7zf/BGE
 8CgtvQlP4Lz0vZSQ94vf1175tQmwY6mXZdhSGyl7owZXBlzAqZbpJLXCEn+JBJo+KaFB
 0wBJAwlMSDmhSpd9U0bb9a0pHmeTkB2p95dqCZoc1G/5PrXVGi/NjhyKG3Q5gCSi4RMq
 yRKUuHKglJcy03rY5SpsHBjfdjeSz/UberQBbPuiN8j+zzW30yOhNds46kwbwZ11liZY
 Yb3n3VXonNeNldo5VwuOroF87Lpfb9e8t+9wox7xZTST3xrMmCYV8h1qHCHDqiM1VGPx
 fNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565548; x=1720170348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=uB3z6tJbEUgvAYddGIXeYvILxSr5LcUTU+Q9RDk1wBClAqKiXaE6Lmoor32dnwTHPQ
 PC2s+zC38qpPM7oyMQ0n/lT/zxbSEOyr8afkbENm3yeqofNNalPPdZnFfSsEK+9urtnE
 VIIFQYeqTnhjfP3oQKrjvvNGQAarPP9NsyMFd8g/++GfReNrEvAnWpcXekFx4wX6wGr/
 qxF2YZ/xmHF4H2n9czNP+Y/q5RmXsbFji7UTC+NzdzCctqqzEC4DkZ9fHcFpWIJCZNz8
 Y8H5xK9SZDsh81g1DFIvFgkFoVi68fv5x71f47iYq3FdtErOsJE2g96EniOk26mRXddr
 y0GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7AS0JtSgQdnWYyWfoU6VxCGqVMCNQHcPjeUVMVHKtlMYpXUo/x8PFVNUf3en0XiuVNY729llXNmt59W296sAUM1/c32Qb1mCJHJWDeA2/
X-Gm-Message-State: AOJu0YyTywlq7Ivrw6W9cZXJz0vRclSglqTVqDZ6DfruxfPUpf10F6rQ
 +Nh3PLubadt2k6f52ct4fP21vp6ZxNT0eboR0QODEyDyP2ZEXINc
X-Google-Smtp-Source: AGHT+IFMoCwH/epxCGvG8TCVrNgBjmP2Ft1l1xXAwKN56cpOIayJsWQPU41hiw8mZOfUPZaXevc3Mg==
X-Received: by 2002:a05:6a20:6a04:b0:1be:d9fc:7f03 with SMTP id
 adf61e73a8af0-1bed9fc824fmr4655522637.23.1719565548310; 
 Fri, 28 Jun 2024 02:05:48 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.05.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:05:47 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org,
 Quentin Monnet <qmo@kernel.org>
Subject: [PATCH v4 04/11] bpftool: Ensure task comm is always NUL-terminated
Date: Fri, 28 Jun 2024 17:05:10 +0800
Message-Id: <20240628090517.17994-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628090517.17994-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
 <20240628090517.17994-1-laoar.shao@gmail.com>
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

Let's explicitly ensure the destination string is NUL-terminated. This way,
it won't be affected by changes to the source string.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Quentin Monnet <qmo@kernel.org>
---
 tools/bpf/bpftool/pids.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/bpf/bpftool/pids.c b/tools/bpf/bpftool/pids.c
index 9b898571b49e..23f488cf1740 100644
--- a/tools/bpf/bpftool/pids.c
+++ b/tools/bpf/bpftool/pids.c
@@ -54,6 +54,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
 		ref = &refs->refs[refs->ref_cnt];
 		ref->pid = e->pid;
 		memcpy(ref->comm, e->comm, sizeof(ref->comm));
+		ref->comm[sizeof(ref->comm) - 1] = '\0';
 		refs->ref_cnt++;
 
 		return;
@@ -77,6 +78,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
 	ref = &refs->refs[0];
 	ref->pid = e->pid;
 	memcpy(ref->comm, e->comm, sizeof(ref->comm));
+	ref->comm[sizeof(ref->comm) - 1] = '\0';
 	refs->ref_cnt = 1;
 	refs->has_bpf_cookie = e->has_bpf_cookie;
 	refs->bpf_cookie = e->bpf_cookie;
-- 
2.43.5

