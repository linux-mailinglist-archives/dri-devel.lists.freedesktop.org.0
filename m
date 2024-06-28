Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E391BAD5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D4310EBEC;
	Fri, 28 Jun 2024 09:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I3ljRlru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B7A10EBEC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:06:29 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-706b14044cbso318680b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565589; x=1720170389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YS5JkKLpH7rBBlezu3RsuBopuhXkHEJwrCmaySM0BwQ=;
 b=I3ljRlruVY6B2fYVOlLjINeswQfEtpv4FknxuUrFDFNThOGgncfnDsledGS3g+OU+X
 fEFqcD6VwmMxrTMo1VMmN5+dWKD0Oq8kjGbrFPmFQtEMk3+w+LoLF7Vj0P8LkQPNfF7B
 eqpuPsOlizRfvijEs0BW0wYPOUgCy8LNfdaCZ4WMHR3FURPuVDsE98em78D1o0xf6XIL
 +tN4IlCVJNCpzBpAqmSffnSikXPl+qJfa/AKKcPVAfR5S/C1r2237oRngxYpNe/MWE9I
 N1tMpqY4Oo0xmu/FkVUkXE6eGpq1vSyUAFKieoVRNdslrqGowv+ln27PoifaYtqjbqSZ
 vTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565589; x=1720170389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YS5JkKLpH7rBBlezu3RsuBopuhXkHEJwrCmaySM0BwQ=;
 b=ePm8Ga2UFF4okkyuK7w+aw4EjgRK6ERI5uM5e5bMVfb22+NVqhG+4VcVVqQ5eMgMyk
 Z8MoUuLV86zU8t1kxUwgsrkzX72JnuNJWgnwPlb5RjU7bLzR7XxeUDHG1mZkHsAemj/1
 tC82qCcHE1KOuNVybw63jkmsmY1Qus6sA19VNR80JKPpduSaEVb/LN+aRCLbFfOCsH2+
 OKgF9KEvW+YSX/qC4/34oLF0mDQi7VH8ZeXmyhtFRwiPLPrOCzTs6cQ6aSDQhMLN/It7
 T9q2ORUMO8kT5hUVDUlJcbOnNIuux5p68y12gpZikTWs7QdX0R9gz87AU8jsNiy0HXwT
 Em9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmrtXmQ/9ubh05eF8pHQIOn+pEeQZRQ9Fvxt7EWHEUxob1YCQ0IG+9G9D1b1eFDmQ2aGfoz60xQ7J0bOX/bw6yRnMGXser7pJFfK33fi+
X-Gm-Message-State: AOJu0YwWU8mwdsjCp+M3tLsARM+oR6PYvwUnKU2vKSGIPLg8IHJnXcJO
 w0/hT1O3qCTbIvueARfFkbLAdTwa4KemQM5+fxDG7JuBY+UnRdgR
X-Google-Smtp-Source: AGHT+IGOKlpBVO+d+BglzrA1U38WRrINDjYkTk3SrZCioD4n2rLQ44T0idrxtclcQs0Zl0I35xoQFQ==
X-Received: by 2002:a05:6a20:b391:b0:1bd:2200:23f5 with SMTP id
 adf61e73a8af0-1bd2200244amr8943793637.39.1719565589157; 
 Fri, 28 Jun 2024 02:06:29 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.06.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:06:28 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v4 10/11] net: Replace strcpy() with __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:16 +0800
Message-Id: <20240628090517.17994-10-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628090517.17994-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
 <20240628090517.17994-1-laoar.shao@gmail.com>
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
string in strcpy(), we should use __get_task_comm() instead. This approach
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
index 254b192c5705..10d8e8c6ca02 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1942,7 +1942,7 @@ static void ndisc_warn_deprecated_sysctl(const struct ctl_table *ctl,
 	static char warncomm[TASK_COMM_LEN];
 	static int warned;
 	if (strcmp(warncomm, current->comm) && warned < 5) {
-		strcpy(warncomm, current->comm);
+		__get_task_comm(warncomm, TASK_COMM_LEN, current);
 		pr_warn("process `%s' is using deprecated sysctl (%s) net.ipv6.neigh.%s.%s - use net.ipv6.neigh.%s.%s_ms instead\n",
 			warncomm, func,
 			dev_name, ctl->procname,
-- 
2.43.5

