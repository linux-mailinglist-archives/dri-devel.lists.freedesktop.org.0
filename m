Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FF93EB6C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E079210E1CC;
	Mon, 29 Jul 2024 02:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fRKuB2rT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A582310E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:39:42 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-75a6c290528so1648396a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722220782; x=1722825582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=fRKuB2rTJ1d/I99FRtL/8UsRzyg3zJuq9mn7P/ojQ0ShTDPOAYtTJqbRpLk+VXoOUY
 nh+/eESY2Bnc+E0U9YDGX+Qt5KO4gam3G/kvCPwqpird+cWYcAjpIpfBrIl7mRK/IbIW
 iTITJcXO50QrxXTP9k4PyCN3xH0ndD52QkXMr7QGfasH73pKy/kLdt/PdVNoOzT57nBW
 Nyk4qRSh6zYbgPUdSf85GG4DEkbgGSvTkKpiqLepmYAEysQuYSxlIjMr3cnpF/dB/OKR
 rLYJxpQayEta/72hyJaDGEDWC2DxK3uMMJZmVnhDUCLr3OiHVP33VluwSxj1jS2ckcza
 R8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722220782; x=1722825582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQdkC9XISn7BWPlTE5/iE7aUj/L2jeLonKoaBsbNpS0=;
 b=rZvubKu1kyJK/SU9gqmAbewaOfFFl6B5jnw4XPmStYTy+clFAD/2pdLeFqNItqQPh7
 MYrpmAzhu4Fw4MSl7wcq6qPR02DKkykby67ROcQ+DJrmDcfBnSjmofkiEj0cjOwdA8+i
 SI8CPE3FTFdYwCpG/V9VNfRUyfYvTnOluZCwkoBbnr79TJgaeFN9Ctl5qdJBkq3IqtCr
 6Y/KDzoD5NbTv8DTP8hjLZMH5nRb8zZszIO/d0htEBKMZ4OnMQsgG0Jn4ulac2vwP5B6
 YOrJKb5C1scGzWOU7tFe/qj78/FHqbO0JLNkYv5DyGyHIU0VeRlPmQCBB3EQw9YFaDb6
 MYgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1UKyKaZfLZijCMobwk/ubWhNs3Pdt+5kRnZfitCpKNPLZFLgQAqlPfw/yvitTGtAUDH8gbh4mPao19zzMFC37n6opwA+kcDF+cuXwHZWD
X-Gm-Message-State: AOJu0YzjTmi/0C2OibirIti8OtnRzvb4T7MWbs/Ezi3MgJ56mn/JOnhu
 fo1q0qAZBywR8CsMa67p0iAXG1QSBaVgJ0IYFXwtPUhHxa/CIal/
X-Google-Smtp-Source: AGHT+IEB8l3Gwpw2EoLQWPXs9e5ig3IiPuxqtfGfuMuw62eXKcBpM2d5t6Uy/en6iDAcfcY1gaCpLA==
X-Received: by 2002:a17:90a:6581:b0:2ca:8684:401a with SMTP id
 98e67ed59e1d1-2cf7e5f27a9mr4176294a91.32.1722220782084; 
 Sun, 28 Jul 2024 19:39:42 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.39.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:39:41 -0700 (PDT)
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
Subject: [PATCH v4 04/11] bpftool: Ensure task comm is always NUL-terminated
Date: Mon, 29 Jul 2024 10:37:12 +0800
Message-Id: <20240729023719.1933-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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

