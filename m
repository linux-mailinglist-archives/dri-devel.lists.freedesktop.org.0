Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56C594E4ED
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD6810E03D;
	Mon, 12 Aug 2024 02:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j9Ufc7Pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515EC10E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:31:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fd90c2fc68so25809985ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429885; x=1724034685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lQq52x1okLoFlEdSdcWpS9opM5nCjcuUg5Jqdy6Utiw=;
 b=j9Ufc7PgM8RLwnWVCv+2JM/eNcDY08TNnKVlBE8HODIVAHICy0W0hEDR3LoXIZ8dbR
 qNHJFpazZKuZUL/oRcK+/v5LA2xw7EjDsPJnDu4gMaSvmXcPNYPFVx4NW9KYXcSHh6QN
 V5UXAiocbVxgfRkdcdbsMmpz0KY2J6wQ2X8Cs3RYsejaVGMYCNDHHqwXdODy0fY29Upc
 9tnVfLhR0Cx6PIX6en9m83I1o+a3n1c9ER9hHmWXZnslu/uTbDo8xO3dbVE4qbzH1g+C
 F6H4oCP4wrahey1oVdpKwGlQVkHUUo+Rfp4uwqRI7u4biiSkRiaHKuP/X6u4Z156/7V+
 s/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429885; x=1724034685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQq52x1okLoFlEdSdcWpS9opM5nCjcuUg5Jqdy6Utiw=;
 b=YTuHpEs5OX1nmOkqJ2HXQmJsbzkp9qr4wjEVXT64uGLXtv569R8EWFWv2TII44oMRk
 8+ZUEVa0MV74zslBCCfohDGiUcF1fJMwtPuKs+oHJVe6oZFWahCbNbUOLI3V0qTEl4EE
 JSXqMQSqAFM9BD5EbhB5bD9F4pVqBwnPZhfrSONj0S4juFRPCPlljfEdi+2WgA/UE43R
 3gKefBKEuNw1qLnHj/N8bhjavho4qqCB4kvq+MWOegWucMWdXa2IpRlTdpA5HF189UMk
 x6UPXftI5OT/d9PVSdvn4gfNh5P+NWNtlvpeoy9/QIEX9EhLpooQq4WajYSiWAO2TXZI
 V2dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUEHprmGOea6MvNHf9g5dxBhLbeGxgOLKZY9XTwu27OjFqeHIcXSjuh+7OnRxODiJnyi9+E3UBZy83kvpbgdOJ8s66somO7ETs8QJu/2JJ
X-Gm-Message-State: AOJu0YyJpWPQiaFyu7phpfZgSRVQpVgE/06+qCqGrbQO44R1U7/D3TSm
 t+zPCoWMta6MVe4kUOFJgZ/9E4Gm9juLrZJh3bsJMWJRAJcKzGr6
X-Google-Smtp-Source: AGHT+IHaetHTBTCym7N0t424xRy6qtmLiFL/7ctUucHwtwIF7cfl/lI/MF8VrMeOi3ytURGCyHANzQ==
X-Received: by 2002:a17:903:249:b0:1fd:7664:d891 with SMTP id
 d9443c01a7336-200ae5cfb6amr57289655ad.44.1723429884796; 
 Sun, 11 Aug 2024 19:31:24 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.31.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:31:24 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v6 8/9] net: Replace strcpy() with strscpy()
Date: Mon, 12 Aug 2024 10:29:32 +0800
Message-Id: <20240812022933.69850-9-laoar.shao@gmail.com>
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

To prevent errors from occurring when the src string is longer than the dst
string in strcpy(), we should use strscpy() instead. This approach
also facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: David Ahern <dsahern@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/ipv6/ndisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index 254b192c5705..bf969a4773c0 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1942,7 +1942,7 @@ static void ndisc_warn_deprecated_sysctl(const struct ctl_table *ctl,
 	static char warncomm[TASK_COMM_LEN];
 	static int warned;
 	if (strcmp(warncomm, current->comm) && warned < 5) {
-		strcpy(warncomm, current->comm);
+		strscpy(warncomm, current->comm, sizeof(warncomm));
 		pr_warn("process `%s' is using deprecated sysctl (%s) net.ipv6.neigh.%s.%s - use net.ipv6.neigh.%s.%s_ms instead\n",
 			warncomm, func,
 			dev_name, ctl->procname,
-- 
2.43.5

