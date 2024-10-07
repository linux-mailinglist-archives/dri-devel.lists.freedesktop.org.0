Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CC992FDA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBF910E3C4;
	Mon,  7 Oct 2024 14:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCMHC2UX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F4710E3C7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:50:20 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7e9fd82f1a5so1045752a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312620; x=1728917420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=lCMHC2UXxFVlMijAQ2KEMXdFjPUOvPB4LhpvWxpjkIncWjAVexgTH7QncdDy9H89VR
 mn7yKD8mn3vD7bHsHQh0xUAv8kiCRARo5xaWz3s13GBdU+SHadw/tRt7GLlc5t83brbU
 xLrtInLQjHM5o56D5ioi6sS5HqQaCk8zzbXOBnl1qGUh+wcFFhF+TfmoJVxs7s3AKFXe
 SNU7ftv1DDNh7VV1yZH+p3Yoebqu3mz3+cTlCkGXLtHCBCzf01andjYYot8XYPQ/DGSe
 udnPTrlG+odIMw6PAuO3InCohiG23ErqfN7xlVDZ9OToMMIug+tynHHey30zUlmbUt8T
 wrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312620; x=1728917420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=OhZCsxjsjBNNGCHL7ICf7wr5qQqFNsxj+C9lBfOZlFhQMj1xWd0ZftX3Y0FiyodZW8
 t5VqUmYfG1s6+yck8n9tdNeM7/4GPaqLzvuYc9EECKnvGW0xGygIKp+8tAlWGRLRyb64
 yns5B/HjYtoa9OcgHcK8CaPjRDtm7+MDKfDzR0Oj/hl2CUNZHkBnaHWMA09duaMB+6D8
 3F50n1GcJcV66riCAr+uKxC7QEdA9yeISvbDOlMEVoy5oahSxTjswReyyKnnH3zdk/X/
 IKCO4tNQXzdZDxi7mnxLc0uCquruzkXJ6apF9ygeizwxRA65x/IE1c4c2uSyEW9pu3UI
 QMtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGDUwfS0beoi9cP1kKMmWNuAJVKxCHquCZ9fWiT4Zk6bbqDpy8qOs3hreQ5K5Sb4rr33W+HYPiLog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAsXG3jNQp4y6JpThutddWuhR5VsDk/0dWsTFVNKsGAFrSlyYt
 0E4I+bJBTioVLvo6Y8NSRGoTo0uV0+QTmlJBljpVZBz/+L4KyQNZ
X-Google-Smtp-Source: AGHT+IGdJ8333QIHr9VJupVLpNtoPXxXbiV/WsIALKPyiyHXyFn3qrINZ3iUgrsX4T7ZKXd0XBWepw==
X-Received: by 2002:a05:6a21:9201:b0:1d5:1729:35ec with SMTP id
 adf61e73a8af0-1d6dfa27a24mr21138343637.7.1728312619784; 
 Mon, 07 Oct 2024 07:50:19 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.50.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:50:19 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, keescook@chromium.org, alx@kernel.org,
 justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Quentin Monnet <qmo@kernel.org>
Subject: [PATCH v9 4/7] bpftool: Ensure task comm is always NUL-terminated
Date: Mon,  7 Oct 2024 22:49:08 +0800
Message-Id: <20241007144911.27693-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20241007144911.27693-1-laoar.shao@gmail.com>
References: <20241007144911.27693-1-laoar.shao@gmail.com>
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

