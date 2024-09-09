Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8FF97107B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4385A10E314;
	Mon,  9 Sep 2024 07:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/y1YH0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126410E30F;
 Mon,  9 Sep 2024 07:57:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3787e067230so2476703f8f.1; 
 Mon, 09 Sep 2024 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868629; x=1726473429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
 b=Z/y1YH0NH0BMGy40n68jt16BAbBcdZLBSzWJ4jfLDFyv225AvwGHR5AfT5qC5uazGO
 DZiAH8r8NQObwmGRU+tyhl1Bk/8cWnpMtIeUFTIuH539tAm/+k/fN5zTlV6KlOQStGn3
 I3eHDX33sXGoLgx9J7XR28lh+58pUW95gLcXfhkBs3pumM2PA30NRAQcqiIWP5JSMkuR
 izGqo/TbwT2v+cvlObT3PygE+PgwtKBsjmQl0JGyFHzZIyUDD/eAj7fQbNQoekmTgNtS
 kNw1hQV/OHgIiJGqmyjce8e4ZIYSKPsPnpbrtKdiRfM6hKJrIZvpli80EFWY00tShPSA
 3/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868629; x=1726473429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
 b=UlgLWDJQsVLWSGvC8hcpKObSa+VNxXGJvyBwG4nDz+mzWJEt+FOf4QKtKzw+BUNMgW
 +3SPDfEd48xLJT/mfJRj6rGfhlN1ZGIfKowzp81u7GLbpNRSRnVVIyic6MdBI0sKAf2S
 USyRbA1DCpMi3OK8wvXJc3TDPChjIUl7sYTNyuVlZIKBgJJy7sKVxV93nFXvTenI2Br4
 5iAEjWwhvxWiqla8cdRgX6u6EE2aOb/M1e2Otn1ujUUGOJU1FOVDwGmAUv7ya668qgOa
 DKdv0xs0k7o3bGh88dH/3SYI9kTqoY18dLV0S2MJ/cWM1qUWH3Rj0ZYgkhUDDaQ5GZnG
 75kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU53bkTp21S1PFFbqOq9Fq5rsIKCAMWIa4gJmEMSzfrhv+6ZehOz6yN+fpw5o5LHKF5Avu9jCbviSkR@lists.freedesktop.org,
 AJvYcCUK0EYPWr1/z85gfjha0tmKiBG+c1vP5gl4OHWZ5pQV90bX4jTvfkUS9OHKjMYfweh7lIdNexSEIDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF+T5rcgLv6kJf9b6nnsDxAnl3oPLNw2feMxZYYEUdbeVEKa+r
 nrtsnI9yYBrAKNHZYz/Q2h9lqvRZpbfLbf4LOhvnU2ps8pijz1PI
X-Google-Smtp-Source: AGHT+IETjLR+Br4j1eN9qUmeGiXMn0hxIOR/FMqY6EotNIPlACrNl22bd9oFTjuVkMYBJaH0OQXWXQ==
X-Received: by 2002:a05:6000:136e:b0:374:c911:7749 with SMTP id
 ffacd0b85a97d-3788967950bmr5536942f8f.49.1725868628808; 
 Mon, 09 Sep 2024 00:57:08 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:08 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH RESEND v2 14/19] bpf/tests: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:57 +0200
Message-ID: <20240909075641.258968-15-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
---
 lib/test_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index ca4b0eea81a2..eb4a1915e4d2 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -14,7 +14,7 @@
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
 #include <linux/if_vlan.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/highmem.h>
 #include <linux/sched.h>
 
-- 
2.46.0

