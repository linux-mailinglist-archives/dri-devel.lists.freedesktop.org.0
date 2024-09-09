Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47A970ED6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C010E2E7;
	Mon,  9 Sep 2024 07:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gRGaFlR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253AC10E2E7;
 Mon,  9 Sep 2024 07:08:33 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374d29ad8a7so2552187f8f.2; 
 Mon, 09 Sep 2024 00:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865711; x=1726470511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
 b=gRGaFlR480QElrsw4BtHqTS+q6PzbwfHnHpwkUyJDiPLjZh7UmcbfjOlkyL00+e9xh
 FC9wTeBjQFLKneO0s+phF2hhGlu0gkN0azmUXVYku1Imednijo5Vf1F4Mwn5c7kLQAKF
 Y0FFYNiuh9oFYpDCve/3386pGXGWCn+pqyWZD3iy87jVKQ/fBZQXazvhqYgY7g7tFsjp
 KxuVaeM9OYQAq7Sg6dsWwXQtAzK40F3+C2DNj6rsNkHBaYTCZeEUKB5O9Q/wFIpDHKQs
 ToXj95VOYlEoCgJoXvlVENqCZ3d42I1zqJb/3cLdG6NzWGfiSjZzMBoBE8BB76TV8AbL
 XBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865711; x=1726470511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
 b=Ff8NES4oph4KJr2UPUNyiRcIis69BW50mxXIt4z7BToLVp80Y85zsFZA/Dnw4j/H/B
 FzpJZ5At5g4c96LCBHvSWuSxLjPUpO4kaN5fQ5xXKi49pKbnPoDPuJvi4c3yg60Yh0tn
 kHuc8H0Eye4Qz0D9jl83HW8WOzWs7xHkIaR1VHVQI9qN9GM2nYQdSTClNhxyQREzyAbu
 Dzp6efCBiVpZPt1GAQ9mWxeyFmTEwsWVp0KVMjRx+7iZkPYcO0FGFDB7hx8Gn+ifQn3Y
 +cP+RF1qpZM5xBpJob4vKoGtsJEeWebhKBez2kogKK59gMbSf9vX7nTLvVngaiP7ryWj
 7DDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBxZwc9kAktAYRFKW6jMmFosFE8AKS5h7GmouzfT+5/mC5WkOCcFZcr1g17sTWUdtbtdsy9da4Y47v@lists.freedesktop.org,
 AJvYcCVyfF40CdU3OI+EImtV0LskhHfajGC2zpI6RfHx0ECTbcKK/WnZWKKSLaYqm/CcgzJceO8lUy0Esjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfkaWptlwh1NSCXrqZTKGIy1rW0MTQlAMueqIkIrwluPL4+REi
 a7GTjzLNM7c+MBAcEHANKanTc5a9pHOp1wRKKmLHwOoqH0ZzhwE1
X-Google-Smtp-Source: AGHT+IHjuyDeJOTuWU6U99A+nUhTDj2Ftw6vRJiQ+Ht+n2ZbU24Uupr5vdNYk+vcq93VCNsDOFt8cQ==
X-Received: by 2002:adf:b305:0:b0:374:ba70:5525 with SMTP id
 ffacd0b85a97d-378895c32e3mr7328314f8f.12.1725865711376; 
 Mon, 09 Sep 2024 00:08:31 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:30 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH v2 09/19] bpf: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:23 +0200
Message-ID: <20240909070742.75425-10-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
---
 kernel/bpf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 7ee62e38faf0..3f0d1eb7f5b0 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -21,7 +21,7 @@
 #include <linux/filter.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/bpf.h>
 #include <linux/btf.h>
 #include <linux/objtool.h>
-- 
2.46.0

