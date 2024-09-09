Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE58970EEB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BFC10E2F0;
	Mon,  9 Sep 2024 07:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SA6bO+Ra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E09F10E2E9;
 Mon,  9 Sep 2024 07:08:44 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-374bd059b12so2372270f8f.1; 
 Mon, 09 Sep 2024 00:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865723; x=1726470523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
 b=SA6bO+Ra16E+bhsbD0sc0TWt66dJHvB2GHWbFy2pICX0KzqesewrE5Mjv0mj5HYlb3
 z1AG5UJsXiedICLxyksW/3c5f+LbAJ14GEJrrzqT9lkBAmQFzPgvK6mDrn95M8Khujaf
 Dbz151bo4TnN9m33e9bkTSTd/65FDbMJlT+Q+3nSN5AL0MwQI1GaXZp21I+nOJ/IVwK8
 USMjOIE9Rrc46G/5kVvp8MucXgW8KV90mB8AdB/+ffejPLLcVzODXy7V28RicKePDp1y
 O0apjXcGIXcmEPB9LTAzFnb1OmCsyqTWg6FEumgHkZo7c5ZC0szCoD7Kc3VOgY0/wBZk
 nPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865723; x=1726470523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
 b=WBuDh06IANMRvcL/DCHO6JaAkN5Y6MEvJKFXuElmNdpSqECZJMzMrCgHzrcS41PMHJ
 quo9PE56ZNwhw86Jwh6ViqUeUbD9XTwzbZTb1+8LyToybhOj4aoUGLCvvGykUoiZE7Iu
 cGoughS2nF+BEWBlkBHQox0b0rMebAd3bOenQA5TYxe90G7V5JZLHNczJfdO7naT++tS
 aPCClEBL7vVEOvwN5NnoSJ69EABWm9xsx+eZd68yHxR9IGx+mnBjuAgTTfkJPID5C+m+
 jfSbYxFdXzEvcFefDYTc1b6QwlFsqULFISFwD3dn2QrUNgAv0HoR6CnbEmVN+YW1IiHu
 kRZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOb4rhVSQlXWhoNy+EY2krLExF/9aTW6u8iK48SFuu1v9Y+R68u+onA/TLDzZwZXO4ZFAIq1vN3/4=@lists.freedesktop.org,
 AJvYcCVV63ph68SbDTA0zOqXnKJ2RuscJOtAyGub6sJwNDR/1QPQdMgtjFokh87f25flzh+DrDi8hNQtZ+3M@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza797rG/hSGn2vbhJRnofV3yINZF2E9DKAPjTpRtq6BggjDGFY
 Zy47N8ID8FUs+LhcT+IMgM86g2Uvn0ZAquvNPyRKfdiQRq4DbImW
X-Google-Smtp-Source: AGHT+IF/jsmfALn+XbJWo7DbJRUOtQ19Xtb/ZppZO8Lnb9QwaZtsxMP8/xIAWo66GB7XqojzBH2ExQ==
X-Received: by 2002:adf:fd12:0:b0:374:baeb:2fb with SMTP id
 ffacd0b85a97d-37894a0d0b6mr3746464f8f.35.1725865722690; 
 Mon, 09 Sep 2024 00:08:42 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:42 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 17/19] netem: Include <linux/prandom.h> in sch_netem.c
Date: Mon,  9 Sep 2024 09:05:31 +0200
Message-ID: <20240909070742.75425-18-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
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

Include <linux/prandom.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/sched/sch_netem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 0f8d581438c3..2d919f590772 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -17,6 +17,7 @@
 #include <linux/errno.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
+#include <linux/prandom.h>
 #include <linux/rtnetlink.h>
 #include <linux/reciprocal_div.h>
 #include <linux/rbtree.h>
-- 
2.46.0

