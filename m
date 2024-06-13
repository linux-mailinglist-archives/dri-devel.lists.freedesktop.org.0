Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B9906896
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4910E9C4;
	Thu, 13 Jun 2024 09:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QQiiG90p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E6B10E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:58 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f8507aac31so3954265ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245918; x=1718850718; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MqSWr/pfZwtTIRxMBQN6sYuDk2R2VvioPDgEPjsCPow=;
 b=QQiiG90pLTi+L8oP4+dBjRDwp7hilcdeeO4rh6yxnB+ksG80laAdwSiKSuu9YSgu4c
 9s6+J7GwEWrE3CRgSSNTkPWyr3LVKn+qmKKVfk2OYVX5/uPg4d+NMnMqjwD2YGgJ1L9B
 ixteH6PuRJczORQeth97AmjdWeWuaOsvINGMvX4ahLglARiyWj2Wyxa5Obg514dWGBGP
 8WUqeOa+zilAVU6t1eN7XluSlgnY5XQfaGyWzNhtAJW7Qzy5/4GoTUN/Dpiprtgbjiar
 absWIgZUQ31GVAD0P3QQVHL183GupzgXWZ+v0B+rY3fIKf/W86V9Ouig0v0sfFCd3kXB
 V/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245918; x=1718850718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MqSWr/pfZwtTIRxMBQN6sYuDk2R2VvioPDgEPjsCPow=;
 b=EQRiCf9K5PUno65aJrGbU7jVzsH1uCMcnY1RJRAbFCccj8u7p6qtL8pKJhtHti8gDk
 e1DGGJR+uiXb8HGQKXwr5uUudZcDEjMn6TmbsTgFoh3WBGJvDK90m065+Qmxv/aj/6D8
 2l1kLbCmr0X/8x/XjJGPDst+FQ6Lx+do97bzudJDVWT5JYz0qUQsWLUhoHe2d0zeVV27
 Odry25dVnQZsdO4ubtugRmZXYK93JYVUPDCyWuxb5v7I+51E0kjuUWx4GyJqseGqLl8j
 Nc1wUlUp3vewhjFOELVnFEWYSwp4BxZAyqxcWf+vta5VDzucsUDjz9AeO5hn/x45zisK
 A+nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPCLpVcfIq+N8XQSFlouOsjJblQGn2RpGlyAwf3UaG/X9ARFJJ9qYnpuBMvz5GFxSAAy8iDhPgLDNaT2u6bmXF7gRIF0B9gUdOTIROlFTL
X-Gm-Message-State: AOJu0Ywsm0f/rWaD65x/PRaOTOvHqnnfHnu05Gun65fi9otpl5QCJIGQ
 opPQJrUNKFZ5MSVjLAg4wVarMbbqV+nKpX9GCfVn+NUEi9srn7qx
X-Google-Smtp-Source: AGHT+IF+JYjBn0OjZmgrQWU2wgsy8ofTmlVYqxM2KmLwEfyu1c8K7LtQBzzKH0FH1zCzrNJ76ASDQQ==
X-Received: by 2002:a17:902:d4c6:b0:1f7:1893:2587 with SMTP id
 d9443c01a7336-1f83b55b817mr42002945ad.14.1718245918153; 
 Wed, 12 Jun 2024 19:31:58 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:57 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v2 07/10] tsacct: Replace strncpy() with __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:41 +0800
Message-Id: <20240613023044.45873-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:30 +0000
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

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/tsacct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 4252f0645b9e..6b094d5d9135 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -76,7 +76,7 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	stats->ac_minflt = tsk->min_flt;
 	stats->ac_majflt = tsk->maj_flt;
 
-	strncpy(stats->ac_comm, tsk->comm, sizeof(stats->ac_comm));
+	__get_task_comm(stats->ac_comm, sizeof(stats->ac_comm), tsk);
 }
 
 
-- 
2.39.1

