Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F898971080
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A3F10E316;
	Mon,  9 Sep 2024 07:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m7P82AW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AE110E312;
 Mon,  9 Sep 2024 07:57:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-374c1120a32so2325597f8f.1; 
 Mon, 09 Sep 2024 00:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868633; x=1726473433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
 b=m7P82AW8Xl3oVaZ/ea63MLLokFdPX9AVTA8REzhfrENfyGyi/L77fKYaB6eugrxbpn
 zlXhI4CQbwOWaF/F5pfO0cjZ5qki+3X3CLiKSzrxUefhRFTPkSkNzVDVEGc0zCSstS5d
 P/jn3E2dBqU2UTMex6OQzsACZ8dG9MoupyBlih1AnwNBFQIEXP6dKpShsYSvx9532GPD
 nOZeGFSAW0juZOCJRUt/nUTLK1Ui4rGVLkcK9TApXxYMqqTCnoW002OATj4eJBaV9c1L
 1nZPgo4x6Xu4LlHFfoTor0fKcSRjG8ukJICvX92D77j3wiFrsiZ23f/tu38PkZe5fyUx
 pU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868633; x=1726473433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
 b=jTtlsHzs2lnZetf+otsOuTdpTv7H3b5Va98h1QekBdxfKfMNyDhCbjLxw3HAlAi5UR
 kDt9Zj59iytAJA2Hw0brhn+vC0Jsaq+kdXCpCc9zVI+9+1RKi9SXr7FTRPVJt2nxhalU
 yMJkVuW8PT1qWXDqQ1U6WQKplfN+4ntxrSF+Mc+cqJtyQgYkyiXACKoFw1QAlrEhDCD9
 azPaqIAHeUgO2yu9tfxM/Clh9lFdmy8+S5s6URxiZ9jPW7q/6sfdfJD05NFnd/JI3VoV
 5Iym0mKq0eo/JJ+TRkHaKfa7ivTbjqqCTMGeNZgMZ2n9VFnLaEeoXEJIKKgyIqO4mtL0
 nhBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUh+Caxp6tQTeXW8Qm+DjuMcjR0F8vW31WqUv1ksOHeu3E8VVcGIpVgj8h2Fsp/6CrI4BUa9no/DM=@lists.freedesktop.org,
 AJvYcCWWp2OlIg3PiK1xKH7TzFhBLqywz0mBFCWudoUtyMXInWoWMe0EH9rIFz6fJm8VAcbh9qdzSBxID8qt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPxv2hmeaDxFriCL0vtN0X4+CPYdvHmkp7ChXv1pXyWcGW3FsA
 o+Ok9wmwFm/s+4tFKimlhJn1qpXBkm5jnUv170qXMrHyrQXYtBVl
X-Google-Smtp-Source: AGHT+IFm2UQfjMo+cDUf0j3lnU/Cm4mT7+HmOHGv2OWxiL1EKdqFzUE8umAkuhmwVoyX5BX+6CelaQ==
X-Received: by 2002:a5d:6184:0:b0:368:64e:a7dd with SMTP id
 ffacd0b85a97d-378896a5c88mr6503932f8f.53.1725868633211; 
 Mon, 09 Sep 2024 00:57:13 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:12 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RESEND v2 17/19] netem: Include <linux/prandom.h> in
 sch_netem.c
Date: Mon,  9 Sep 2024 09:54:00 +0200
Message-ID: <20240909075641.258968-18-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

