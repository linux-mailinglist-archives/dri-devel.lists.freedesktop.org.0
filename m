Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25B961C81
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D8310E488;
	Wed, 28 Aug 2024 03:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uq2arMJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7131410E488
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:04:06 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7cd830e0711so132540a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814246; x=1725419046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=Uq2arMJ6Bk8aUPb6qUPqWAkywJJIq/EfBN19I5jq0xbZMPqfXJoomcB3UmZnPaYLV6
 BJBmBAlMPhz8TK3FGXJYz+W4I54TSJLFK8svLAPi6JD+sdyskp321A3BgeyUmnD8DHWx
 gZGLc6wRs/jaKT+qg2/OnllyjhJrM9a1kyzkfTDYX+sumfbDw8qTlecmCopS3z1sDYvO
 1O/4NaX90EQbmsmKvFPy53f+r16i7cvgRZgYFkCn3CclAQrDTQJ5PbrdIKYehHJaKQpS
 xbUhBXmOp/9Im77l7LVz2zL5cv3/EKoHDljSZWV4wJnoDPGttK7G7lYwWL3/y+ZGB05W
 730Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814246; x=1725419046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=cqhgCedpHFN4Q+eSy6dB0aWirIadsUnvIS2dqXWJzz1/wBqPL2CuHnzSIKFS0GCN9u
 mXDFnGe8/jMcMh9QMkYBjNh5O2H1U1/b7rIGAj4TU2T12+6He44hIinJCi4Mht2nLti3
 pIDZ2Jma0bYpcJB+H2V3hGTw0hQ2Um6sorcRz1XI4MkwWans5Y6RNCfDJ7t5GhAUjKPt
 XAvt1sHInsKPtGVLBYyv6rcpDGVUScvHQNjJRXt/F9E5Z02vFET97rcoS5xHLzMx38im
 vposhHmNuXctA2rAk4708u4THYFYbb3MG5CV8Dm0QDWtCYFA6pLydqgk1gHR/4EYZZzM
 3M6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFh/ZB7E6N6T09Fylua+/Pm9f5+zClgGdU4wiNkl9sK5Ln88XqnwbFNuGoSZWanQSH2i6RqnJwy8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIrM0XH8AVxXgGrO0t149sPx6cNlmlUFp0FCBCB3ZWKnkfEh2F
 LMgcxeDutdqT4Ny8vyDYJ9TnS85MZYeWgrnShT1ltF0D621c44KD
X-Google-Smtp-Source: AGHT+IHxaydVqwv10Tfh2ak5vjo3hT38eMV2JYlayqlM6cQqHxMPAOmu6Mb/QjPRAxpmFPgYrqTvlA==
X-Received: by 2002:a17:90a:304b:b0:2cf:f860:f13b with SMTP id
 98e67ed59e1d1-2d843da1884mr1305336a91.17.1724814245904; 
 Tue, 27 Aug 2024 20:04:05 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.04.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:04:05 -0700 (PDT)
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
Subject: [PATCH v8 4/8] bpftool: Ensure task comm is always NUL-terminated
Date: Wed, 28 Aug 2024 11:03:17 +0800
Message-Id: <20240828030321.20688-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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

