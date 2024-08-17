Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DFB955504
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD5310E86E;
	Sat, 17 Aug 2024 02:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RBK4AKAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBCB10E86E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:57:25 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-20208830de8so10213245ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863444; x=1724468244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=RBK4AKAgNTP+Ejk0iV4lMDCUwuE9ErX2swKTB4Lbi3iTmalmafc3ACN1wbzn2fpead
 aJedxKO40AldhilCZwJf+GuNfF94Vz+j/cDNweNzMr/ixLGtzbDOIPzs7Lb9PUVL5mLp
 chd849gSRfQ9BZNf+eLu5q0tUkkJL05eBWhvxWxySt0DsoLByaHF6X0zHK81QMUGLKpT
 i8BirKm5gqdB35LSb9oUJ2drMPji/k0yAswZwxrzN0t4s45aXt2VuIA/LJVE+xLCxGh2
 ey2h3WqaGlZvS68oB9a+UJ/0oCOSYqGuZ3stTZuC33O4Ym8yLpT5jxZdY8mCVsrf1tRy
 GndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863444; x=1724468244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=PgKaGVoa6AUwL4Mi8yTGCRPZnrXwjcW8Z2qLcyDxCb6p/AF6VOgUJUMip7B+lDiKRa
 60uN+kih0eZafntRST4uSt3Uk9ggr+kjLQGd1Rl4zoylufWcULj3xi9Zl/fyjAML2kAB
 4xChdM+aiGIIKWSc7cVLBqKwKMSVf5Q91oHuhLdZnemksrMUmQi31EbjWHng7SGg+JAV
 l1XG41oDCYn/cChSK5O/EzSPadApgmK4nR5s5AnNR7MpMC6LpYIXGvBNCbnQO7KDJMoL
 lXnv4MVQbqXFlqLLSxVmOJTG6c1E8yj/Sa8QVG7IPKqKZi4JyBubATOV/H42M0PpRiRu
 YkSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0I2IMDpAd98SEcOvi5CM7/mTqFfKaR/aZS9BH6V44pQoQZ70XicqvLvFrdLNxmVIzGX83AkIBW4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0CBMYdqeDqHi2kbqXgHi9JUeQHziqr2GlDcQCdv0eUR5w+g+5
 o6yzuHg7HDSKe3VEFkhWLlWeL7Zo2WUGenllEL/2HYEnGO9O0mr/
X-Google-Smtp-Source: AGHT+IGimEn6HMsvkqgHYM+kruqPW+JJG9kJGgyigEFWYmxee2uabObu84uvkyN6MQRp9Qx9ywJBnQ==
X-Received: by 2002:a17:903:2281:b0:201:febc:4366 with SMTP id
 d9443c01a7336-2021969a77dmr17762915ad.55.1723863444544; 
 Fri, 16 Aug 2024 19:57:24 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.57.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:57:24 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Quentin Monnet <qmo@kernel.org>
Subject: [PATCH v7 4/8] bpftool: Ensure task comm is always NUL-terminated
Date: Sat, 17 Aug 2024 10:56:20 +0800
Message-Id: <20240817025624.13157-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240817025624.13157-1-laoar.shao@gmail.com>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
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

