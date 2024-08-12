Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6994E4E1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBE910E043;
	Mon, 12 Aug 2024 02:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DY+jNv+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212C510E043
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:30:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1fc5296e214so37046575ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429858; x=1724034658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=DY+jNv+jBrK4rC1PAHUO/6IgbHMJCk6v0hgplTXBDEYALNbwSbPAkfr82kRrzh4Llt
 uKoQDkUVLY75Q+aRWjfjzRTNtZe4hupbqGl1eGrlE26jO7Az/p4yndnw9VV4kVAOGHU3
 mcXlaYSL4VPyzi5Dtkyf3qfYZbZAepr7USYZYAhwvZLGfVmO/0NbsPTs7fzQ/eOMRJDh
 4a3RaqRAzWxGZ+lII1AIOjj51Vy0zXjHsVoMpsh5zs3SBGpQR2voGJ5nbsbFdTAj0ymD
 JSVcF310/7JbML84vgQCG9l7f7VLNDuiRnb5jDGtDecikJUgYXaXXWbZV4q7osHgVuAs
 XwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429858; x=1724034658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=JXxMmmPoN6QuBlSEiuCE2P9NAQwMWb0bSY0C6iTvtHKVEGc4po4+v5eZoALHOOzItu
 52rM5qD7h3/NRizxQ+38Jip35wXi79JiU2OTlRRXUXQeSK0ikEov2PSCtxRnUV5aPReF
 8YMzxGhcYxaVw53cJzee+EqJuZuLDp5pTMwdH4qMh1OCMst7dHeHiYstm6GRDzk+94Sf
 06aKLdjWLmLrHBP2JskizD2Olp/DGr8zsb05rK5DVKoTp2+vCAucOpTmdKRe5mXw8dWX
 q+QIYITsdhp0l/ngZcJFGqyS8W7Ax6Zm3PoAi0EgXNqssz052VbCGfMRWkOqqjXrvVHt
 mJGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaa6Thj1KfNe0jl18v85FOYkDjmwuclkFJsF7MkgsjZAaWIkcjKS9eKrJsFN+FJNS34fiwqbIkRTenDrBN9D/neWrD3m0O1rrtRfz0IUH1
X-Gm-Message-State: AOJu0Yw0BONLW5PsKKqH7GIbgUuuIUYVW/2fzDScD6L826yP2eFADXZw
 ud7yYxrrqMoxMvBHCs6A5Zxsj4FhuqqanZZK1Jp57QztWucssYqH
X-Google-Smtp-Source: AGHT+IEa9lv8MoV6zk/9zF8wCzjKsRZm15PR0yRidIjcflgd8FgwO2+8+6fP26BlJQqb1WyA3rzQJQ==
X-Received: by 2002:a17:902:f54b:b0:1fd:d7cd:ee53 with SMTP id
 d9443c01a7336-200ae540e2fmr93875475ad.28.1723429858561; 
 Sun, 11 Aug 2024 19:30:58 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.30.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:30:58 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Quentin Monnet <qmo@kernel.org>
Subject: [PATCH v6 4/9] bpftool: Ensure task comm is always NUL-terminated
Date: Mon, 12 Aug 2024 10:29:28 +0800
Message-Id: <20240812022933.69850-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240812022933.69850-1-laoar.shao@gmail.com>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
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

