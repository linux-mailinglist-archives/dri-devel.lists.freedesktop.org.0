Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BAB9F72A6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 03:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788B10E45F;
	Thu, 19 Dec 2024 02:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XnKOXrpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAFA10E45F;
 Thu, 19 Dec 2024 02:35:20 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-725f4623df7so304803b3a.2; 
 Wed, 18 Dec 2024 18:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575720; x=1735180520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=35FnTfH4WG+K4PY792luJMCXMpwCP4Hox12oxUuAxYU=;
 b=XnKOXrpyyMJ90nTU4ulBubzGWGrL8xvYjRBxAxcSe7cNdRSKDHxGo089gzZUh3WdKQ
 ErRO/ijaOnCwu04z3q/8UwxeoaH2tyU245QO7mUoMqpeC/V/JyaQlwhwYpX8yN5mHPR6
 X5jMLkPXTwYmRPrTCj96aT/S5ge/8zy+KG/ncCnutAzELLGbJqmRVRO0IyyL6PWG7rq7
 ymOGawNvCiSLBe0KBhpNIUqJuOcp5Sz065wm46Ut09kTvJqvVldf1nsyYQHMRcIljNrr
 Hi3XhQ8fqM0uSTuw+/Y+ozMGqfT2J7huZTDnvTbSTCp+Om/iw+xH+cSMzgI7vmCYpTrT
 MQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575720; x=1735180520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=35FnTfH4WG+K4PY792luJMCXMpwCP4Hox12oxUuAxYU=;
 b=nm83KaayWIy0f3DM6FdspQ0IL7NIqpqvFL2PeGqiwMHR7RgTt4jvCIXLFNQJ5sGVv5
 Tpi1XmsD2U3gnyxb772rFwCMo8yIPARmyrM+jAKPyfELZ4Jlm79YViTw/PITylZKllzr
 SxsuIvjYtI9fbDXVnz8q6A5QGqcfoJW8XerdrV53y6FL2yr1FvqLda92a295CwMY42fq
 PQXDd/ZUkRuPVBc7jhbeEGDKRQ1SAiaYmEvaJyJGz2ysRjwOeBj62QUOQvYS7j/s/0/6
 XGyXqGV+fllB6Gsd3AxUP0wRj07hvWkIo3xlX3IP27h8+KE0o7/mia5NordO+NLm5r72
 1VwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOXVSQc0WnC1ewZBBsczT9ULiPOK3zy9vqdas4toF0uBVCyjT5Ps2OMXOphrt9XlevqVDxKwnW1Q==@lists.freedesktop.org,
 AJvYcCVPkWhsJfCNzr3f4TmMG611T0aA5s+jEZz7pUejdDqg2/Wi1ktOQe/DBzQGSKUetAbTxsKTlV3x4pc=@lists.freedesktop.org,
 AJvYcCVTj0uYfXlvRzxptyccUGlou6pvrNFg+LKcQNxnqGmrYIkWNBPi6Pg8Lbp9qPoqDLY98DcWoCEWr4s=@lists.freedesktop.org,
 AJvYcCWh57IqC9rUSn2W5U289Le5+d72mcMGLSJ+J3fKJ8+kRg40aq1z+BcnA62EzFpybjRmpOOOLsR2Qu4h@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbzQIL/AXNzj5/1VyHYV+wpT6rVHtTjLpHfsDoTf4ogTuUM3I4
 uIBwMWInoR13eUE/2oUwsOokShBx77n9OtXI23hfdZNjdUlx0NBF
X-Gm-Gg: ASbGncv4QUcxRkO9MAuPNsG7aCY+zpCSaJrQAWDUZLWZmu3NUEVFXFIgjoBOkV7LeYN
 CKo36YG0vF6u4T5XZM3jkaYcX1SB/27Gc4ZC8/JdTNHSNbLIREnWG66cOd11HOA6PHBEW+2SHrr
 6NKaG9uIOkp19xDcHluH5FT3PZNu/tNMbKzZaio881yU5rCy0ysgEYTw88/XHQzNHJqzxAQwYiJ
 aVt8DIumXbJXu51FytgDRUwPeLLlcXwS2i0Lmjep203UOxJY/SYq7R17i1wHBMm3uFObo/7TiIx
 3V3g7hU=
X-Google-Smtp-Source: AGHT+IEYa8/cPCrPUtV+8BluujgYPFlXKrKcInk+YdaLokr+l/jazm3QEi9WUGXKVKTvc9yKVja0nA==
X-Received: by 2002:a05:6a00:9096:b0:725:e37d:cd35 with SMTP id
 d2e1a72fcca58-72a8d2c2269mr8262629b3a.18.1734575720422; 
 Wed, 18 Dec 2024 18:35:20 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 18:35:20 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, pmladek@suse.com, kvalo@kernel.org,
 bp@alien8.de, andriy.shevchenko@linux.intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Paul Moore <paul@paul-moore.com>,
 Kees Cook <kees@kernel.org>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH v2 4/5] security: Remove get_task_comm() and print task comm
 directly
Date: Thu, 19 Dec 2024 10:34:51 +0800
Message-Id: <20241219023452.69907-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
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
Reviewed-by: Paul Moore <paul@paul-moore.com>
Acked-by: Kees Cook <kees@kernel.org>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
---
 security/yama/yama_lsm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index e1a5e13ea269..1a2d02fee09b 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -76,7 +76,6 @@ static void report_access(const char *access, struct task_struct *target,
 				struct task_struct *agent)
 {
 	struct access_report_info *info;
-	char agent_comm[sizeof(agent->comm)];
 
 	assert_spin_locked(&target->alloc_lock); /* for target->comm */
 
@@ -86,8 +85,7 @@ static void report_access(const char *access, struct task_struct *target,
 		 */
 		pr_notice_ratelimited(
 		    "ptrace %s of \"%s\"[%d] was attempted by \"%s\"[%d]\n",
-		    access, target->comm, target->pid,
-		    get_task_comm(agent_comm, agent), agent->pid);
+		    access, target->comm, target->pid, agent->comm, agent->pid);
 		return;
 	}
 
-- 
2.43.5

