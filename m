Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C6911899
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3993E10E8F1;
	Fri, 21 Jun 2024 02:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZkLGjn+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5817710E8F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:32:02 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3c9cc681ee4so754034b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937121; x=1719541921; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MqSWr/pfZwtTIRxMBQN6sYuDk2R2VvioPDgEPjsCPow=;
 b=nZkLGjn+YADZsL/AYM91rwdVPy9HeI5Sfm8bLBThWOjbbkavHpOrJ7i1AyKx47ThNo
 pSXHht4YJJeJ7sJIvocgZqGIwHQb3fZnWNwLcDNZkkD6KHs/nrGivgtzxq8v9qXhu5Np
 TEMykjFtwadpkNQB0jtrjW0JrKVrc5kFVhH6swMz0IFsDVHiQlSRrxyCIO3IkQqhwdpx
 c+lmGp1Lz+bQMSuR+ACGqpKOtl3Gs2fnTZtpf2LWLVctyVsJ0eNfCM4R1KKP+QQLvwSY
 0RErOAMrGOxm6zyArMCorY5znBfXqZPTtsoMXMlM0Ko8zvTtVhEh2qQhR0gaVGCcRI1E
 UmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937121; x=1719541921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MqSWr/pfZwtTIRxMBQN6sYuDk2R2VvioPDgEPjsCPow=;
 b=p3YFn0lg/4/EY8TRQ9//QIYiBX/G7+RQ4/DBHNr4zGebQnRF/tYlVV9ye0IhzJyx9Q
 m6qW8A2RVvrK4Z/DwCRuC03rdlL6cf1G2bc+7TkOyd4ZIplNyPUeXBHRuDjtf7BedQXr
 ctE68P9psbed+cPtObDxADt5b/FAdtjWSPvczD0+CdGIa4vlhvcgmwfJyz1snsnrQMR/
 SFtaoHtHTfJFSYHMbFCtCO7C8svWX4h0MWsJ+6QvS4EunEvmN0UNsqWDhOZMDGnCmckh
 Q384wK2o059LaydfEXMir1md/wBG1TUtP9Y6l6jlw/qKvvhFzav0YIO0Fr7kZArQh04u
 L1EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9jo/l2EZwBwIXvaVCm37ycj0NskR7WvXqRxAqWk85j3bwOcqpIBLNqaTH58aOcEqOfGxAFxTWZK/TbRH7RzSd8tmScbEBsNNKY7EPklx+
X-Gm-Message-State: AOJu0YzXY9uhQkj68pGIn6AYiVwXfJd4hja7gnIqSKIa4dAvK0nm1iKs
 bPW91c+Eehor7dw+Lfr3mL1x/E8XoENRedwj88dQ/sxq00qwzLxi
X-Google-Smtp-Source: AGHT+IEDLpdYIw99Uz7LWzb9Zy/b+1+lbeIcbqra7aNgXOpLlSyDlDvG9wKvxKsFRnB2arbPqu9IVw==
X-Received: by 2002:a05:6808:130b:b0:3d2:4a08:2cc8 with SMTP id
 5614622812f47-3d51b9b4558mr8069073b6e.23.1718937121450; 
 Thu, 20 Jun 2024 19:32:01 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.31.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:32:00 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3 08/11] tsacct: Replace strncpy() with __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:56 +0800
Message-Id: <20240621022959.9124-9-laoar.shao@gmail.com>
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

