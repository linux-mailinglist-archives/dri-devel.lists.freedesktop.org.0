Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D190688D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2264E10E242;
	Thu, 13 Jun 2024 09:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j26kbFOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EE710E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:32:16 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f6559668e1so4960675ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245936; x=1718850736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wLV4tdtvKwjUMxvLd3MjEerWvvi0S3KYqORy/5kgs/I=;
 b=j26kbFOVBEMkD+7ZSOT95JukQsT8YjCJht6UEoar2RXsu2jGPkKc7LVNqlPFKrgNJr
 WwQfhmGjay1hbSDI6wtGnNYkNvCRQY3/aqujOpEaC3EK5VianReETC8JchPOr8hdqRS+
 1G+Xg+xgodW7h4Dv2fBDpuHEtzPKU79L9dVLmbkb5+d69/8xHRVgxOUTpq/9u/h1lKXQ
 bR/GL4XV7Uz6EcaKWH5noCtI0O8Wn6PJylzou4LUwHJXzQtLQgrBpNnIfkVRrJKJitOV
 WwbVXPyFTkgk78+sve7JWv7vC4AkADQr50tz3dvgkHph3AX3m4+73HQ/l+Ndt97C5IEM
 TnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245936; x=1718850736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wLV4tdtvKwjUMxvLd3MjEerWvvi0S3KYqORy/5kgs/I=;
 b=LvwwA4ZRmi9ff6ilZoldtV/c3zMfPH+zN5GPDMquDMwuYtE/TPi/bundrxfH5GnQcT
 dKj/k4D2N2QvGTamt4RD/euDam//vjU/7yRR1gHv0GFhiNktD7qUUZuunmQ/hy2EWwNL
 DuJCq9qdXZiu8lxa4PH49DO2wjL5jXg7y/yEjHEdwjb5/ankD6k1Bswxo5DeX2kKedk0
 9yYMpJJNOz4RANx+sIDcABVVOFwABAyE3pFTpBP4BaKttuBcH5wCKrN30wp2N4wThcfn
 bPPPnqfNWh1w+lH+jCO3AeWKv49mDsZ/dtAePFKrx6arQ9oLvL6osihbUbQpUExUIBdu
 9kLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXogyg0XK6aTaDK9hru/3UaTVDuLiZwPE8nJRfQTCKEBzk1vPFGOCIb2yH9zrolFGJupNmu1/nuhpuDtG0rDAijy9ZXZ+OFuyxPAba3DDx1
X-Gm-Message-State: AOJu0Yx4Plm+hpxKsDnNesfvcDY2pmFkLEhJbhnNNoIaWqQyU47vKiZD
 LowptuQ0NXGoIrsv4DJW00FXGC60EH+6frctagdtT+wXaW0ErJA8
X-Google-Smtp-Source: AGHT+IHU8nljO/XpjX7VaEB7PAOC5fyOplOexRJH9EcW/3foBQqPSTf9j2DyRFgOTFj3wqtthRwoDg==
X-Received: by 2002:a17:902:d4cb:b0:1f7:3763:5ffb with SMTP id
 d9443c01a7336-1f83b74d134mr37873815ad.59.1718245935611; 
 Wed, 12 Jun 2024 19:32:15 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.32.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:32:15 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 09/10] net: Replace strcpy() with __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:43 +0800
Message-Id: <20240613023044.45873-10-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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
index d914b23256ce..37fa3b69df45 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1942,7 +1942,7 @@ static void ndisc_warn_deprecated_sysctl(struct ctl_table *ctl,
 	static char warncomm[TASK_COMM_LEN];
 	static int warned;
 	if (strcmp(warncomm, current->comm) && warned < 5) {
-		strcpy(warncomm, current->comm);
+		__get_task_comm(warncomm, TASK_COMM_LEN, current);
 		pr_warn("process `%s' is using deprecated sysctl (%s) net.ipv6.neigh.%s.%s - use net.ipv6.neigh.%s.%s_ms instead\n",
 			warncomm, func,
 			dev_name, ctl->procname,
-- 
2.39.1

