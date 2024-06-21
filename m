Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105691188B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405010E870;
	Fri, 21 Jun 2024 02:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E8uuk/Wd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ECD10E308
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:31:20 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3d21e00d9cfso904662b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937079; x=1719541879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7QH8g7nY2INvVrL4NU75ftNhN6FL7HL04IiCAjwJmE=;
 b=E8uuk/Wdr7qPNMwhZfSrNag4a23QAmoa/8RZf1ynYy16QX6ClLRsBZbDPdM6eEtT6S
 HxhADMPkeE6kneqlXHReCnmuSBmnmWnBaMZcFY6jUwwqvHbUFzprGhS62fnqDTUayrMv
 3cgFiXuxhXDKb/GtsZdX7r6el18uVJ5UqNsl7AbX4aIFGLm43fDtu1KEecFSR7sjnDAU
 129WjIfepIwwAhcuOGu82vOT3WAGjcPOw2gUoSsOzQMdYZRZUUdAN+Yg/TMXW2wOCTfr
 g1hMxlLso335bAcPdq+wOeKQZXg9hrKr1irq6hnMTOqNWSwAzh81XA5guOULHfx3s9Gs
 2OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937079; x=1719541879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7QH8g7nY2INvVrL4NU75ftNhN6FL7HL04IiCAjwJmE=;
 b=ePciBBk9QyPKuRPvKB53fNNdcG8+eerdpWcBocgXSBCmMdsRgN+umPI/xDFk2E49VI
 yYiEZpWVopTD2qi9I/1yB/PNclTUNbp/U7Y3AI/gYp9/C4iVNORuo4I1+/uNrBQctXyn
 eD7dTi5BMxbIwi/I6RrTF9twfUv248qmmaFHhY8DHbx2B3qeMDSMoxdA7c6W0zn3RJdx
 pVjUexEoOHoGsTpNPV9eHqH5Y/j46FcmqcjM1iiUaZdkty7qilqlf890tgIr+CQpWDGJ
 gV4kQSNORWRbZzXumWwydD+gmLexBKrKad/dYBJ0WPVB2RStpBozNeqnYtL0gYYH1StI
 6uLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxaaAWXH9FCclkeKDgyH9VChpqR24PVw6RgjVj1rT8XDeAJt8TaL2qu0GM4VcM2lw7K+7UH7ro97JxbsSb8sFNuiAZvhtyQbEf2ZThNN83
X-Gm-Message-State: AOJu0YzO5S+Dk5/NkqtVe2vYMqJX9kO/y7DmiJHoerUFb6RbZ0e9uWdb
 R3XWVD2ialzFN2USRh0uCTOBc9Wy/x8Iyi1UGR4XgyojibOb4gxh
X-Google-Smtp-Source: AGHT+IED/biJ/4HZ3XKtIPvcAUdQBx9cm4PcU9a703LBYQtgmllriwsa8W5+N5BARKh/qYuDuJagiw==
X-Received: by 2002:a05:6808:f07:b0:3d2:21a7:8629 with SMTP id
 5614622812f47-3d51bac4b56mr7794777b6e.41.1718937079354; 
 Thu, 20 Jun 2024 19:31:19 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.31.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:31:18 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Quentin Monnet <qmo@kernel.org>
Subject: [PATCH v3 04/11] bpftool: Ensure task comm is always NUL-terminated
Date: Fri, 21 Jun 2024 10:29:52 +0800
Message-Id: <20240621022959.9124-5-laoar.shao@gmail.com>
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
2.39.1

