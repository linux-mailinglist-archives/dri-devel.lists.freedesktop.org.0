Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DBC9F0457
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287AA10E673;
	Fri, 13 Dec 2024 05:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N9q6gLfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C332610E673;
 Fri, 13 Dec 2024 05:47:20 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2167141dfa1so12331935ad.1; 
 Thu, 12 Dec 2024 21:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068840; x=1734673640; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQpRmGydqcdMOxZRzmLm98GnY2wtgMQ5ZotZeI2M2YQ=;
 b=N9q6gLfVavC1GU2+eutoMhVmrqo+SE0dOsUv7F9/ws+UP6mUtV4i3ctUhi1kuuEALu
 RBKoP5eUBROiDQ39IeupNpIGKbBkCEvjVw4oXon3+7jCG+kvLuH+vKs/kf2v7dd3ecJK
 yD00N96UNWm28N+PBB7w2xwFgPOSnB1eW1Hegaemsql0wHow5Dd7ldXl9GmnglK7nd+R
 B7M5jQ/LQJ0STlXtrhVrinZhtjO4ploPFZPkO9qASztB416PiFY7nA7FW7WxFD8zfWBP
 3GPhvc+J5xLwZ9J2Jt++mXo0IfTCIBKa9rOtCJpxu0zswXP1NhgLuXNLoUbLOgsdpYjh
 Eayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068840; x=1734673640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQpRmGydqcdMOxZRzmLm98GnY2wtgMQ5ZotZeI2M2YQ=;
 b=cxSTIPUnKLZVg56gKALiaed32yVcoCyXM3V3BemlhPOIblqdQ9icL5cjGdwRgsbb3p
 g9Cjk85KuPlnni+ucBfVJeDXNm8U16GDtrVsapB5VUpjn7qw6/h2/FkNjiIopshiuG7c
 Qay9qBRT7kAZO0yFe+6SgUVg3PMKEAUYgOBwjhjpvNSol964VAR3xIkroyVWLl7mJkdy
 n9DvN+I+F3CGanI+FSFoYyGk8ZLll3/pStWhZpQCD2e1tPaSfPnpTbStZF1vWprnsHIs
 qQDcCsCFJbOooZIjoR5D9br/PXy/Jr62COyZ60RS+zZiWamJ9te3fjGIgNHLtJJ2WqtW
 iSUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrDVCLNoT5fMKFamAMMLvdnzvfeFfaSHSkZHOIIn8MKCYt0dEcFnppElSSd8CAutC1FpkhpDGb5io=@lists.freedesktop.org,
 AJvYcCVY6w+CWG+vllLd/2Mkk/B151yekpaMezTloz4NV72wdS2t/WiCyiUSO43EufLFnUriv8XSCCZVgg==@lists.freedesktop.org,
 AJvYcCWWt79O9naidYazTZOPUK7CUL2uCdOgfruN7fCzIhQYNqp9EPjEGypVP1pa+Niegt+syv6fX1KkpCMt@lists.freedesktop.org,
 AJvYcCWyUbzVEhr0YJ00tl7X4QDsDlB3nMZWfOPXxqdsH4fre08YUWJFwM/+QlbEarHIZ57w0EfceOk+fsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNWx73xPXbujSiq6uWHuWLj2zmD75laaCpSQ9cP8bLQ8+KeKOu
 XzWcGX3AxSjqM4VzetjBwq890qDGOvqLU4jaz+ln4wcAsZ+93Q9y
X-Gm-Gg: ASbGncsszJnjEmCpcigJS5PU4FbIuJcVJK9bj9mmrwp8zY2H88cNQO9bL64N035BDh2
 3fJFh0EnwHzNaH0O+c4jaNHm9leqcd2rV1nfthoZjqbfpFRs59YE+oZA1egnyNE/4Dj9LrOjXqO
 IATMBHjBUpmJhQhQva+kEjmgl8hYdNKvDIHXjwzFq5av/paHHeUGZ6HO8Niv00+xkEy+1SwI2uA
 cnycd3lQaVoFBYmg2f5RpbQimKrHi0XZ4ps9Z/waaO8LCavDZL6QkuBTUTq902TUbEMEsUxpect
 2ixtDRc=
X-Google-Smtp-Source: AGHT+IGy5lWO5x7q/SCrL+dH9NQnv1Rp0u2NkmqEtY14rjHQEczQdhUClmCmrxdf9miFcIspK1e1uA==
X-Received: by 2002:a17:902:d506:b0:215:9c06:272a with SMTP id
 d9443c01a7336-2178c872102mr82765085ad.24.1734068840305; 
 Thu, 12 Dec 2024 21:47:20 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:47:19 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Kees Cook <kees@kernel.org>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH 5/7] security: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:08 +0800
Message-Id: <20241213054610.55843-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
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
Cc: Kees Cook <kees@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
---
 security/yama/yama_lsm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index e1a5e13ea269..4bdfa51ea6fd 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -76,7 +76,6 @@ static void report_access(const char *access, struct task_struct *target,
 				struct task_struct *agent)
 {
 	struct access_report_info *info;
-	char agent_comm[sizeof(agent->comm)];
 
 	assert_spin_locked(&target->alloc_lock); /* for target->comm */
 
@@ -85,9 +84,8 @@ static void report_access(const char *access, struct task_struct *target,
 		 * Imagine angry ranting about procfs here.
 		 */
 		pr_notice_ratelimited(
-		    "ptrace %s of \"%s\"[%d] was attempted by \"%s\"[%d]\n",
-		    access, target->comm, target->pid,
-		    get_task_comm(agent_comm, agent), agent->pid);
+		    "ptrace %s of \"%pTN\"[%d] was attempted by \"%pTN\"[%d]\n",
+		    access, target, target->pid, agent, agent->pid);
 		return;
 	}
 
-- 
2.43.5

