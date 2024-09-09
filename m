Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D8B971071
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0C510E30C;
	Mon,  9 Sep 2024 07:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JgoSOADb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADE210E30C;
 Mon,  9 Sep 2024 07:57:02 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-374b5f27cf2so2312522f8f.1; 
 Mon, 09 Sep 2024 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868621; x=1726473421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
 b=JgoSOADbNpd9t69ycP30ifD1B3JBUluYWQsnWXPQ00yo+u2o/VYcI38LuoyjsDkYyO
 yzo1C9AX/PsKkomhKtWI4N3pB8AzVK3UKDabVvcE+Lefzqz9Qq32gv+nsEcj4mcoUMrL
 LtVZMojWXw+AAH5U4z2ClgV0oNIfUkhvULf+PITiDlp+jC8wh9nc3DMXjJ4rR5dW32Ja
 ZuBgves9sdLh2DqHG5BpAgp0m5F3LgJUe55U50LOET7DCoZi3K80G2NoNWjO2jJmna+8
 ebvvhCkQGJF8Yb5qPOXRf5uZh0jtSImd64LX+Eilh00b1v9Mq7AAtRvYanso96HtFyB6
 Kr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868621; x=1726473421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
 b=KqAB3gPOKPSvnU8rhuV3YpEv8gdPbnJXTcVfEjiHlvY5RvlvEyHgCdwckhoBVOw6jO
 Kzhrb+Nm6HA27sHUqeS9X7GVHHKNcXR8sTje2bVBWaS+g72WlqB+hIUKodsj0Zx1XBl2
 JY3r0QUeIeAjYap7ZhMNcfznB3Zx/8uask5XZJ0BSeKupCTyI/qXK0uL/w+SIjqAUwkV
 HciVf/qVCX/lFb8nBiBGqRjociAV+YctAiM4c5f3MAdpkGvTHGSQqJuge0Ozl8H0qg6S
 a34ByDkJEeMqHCvnz4UzLbDW/wEwFQ07z61bRHOXqZ4k3RkxevvPoiKkFzHIPW7DR5UN
 lNng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyp5zcCr2YemQWzDaXL88Q42GXCEhOMCBBfbPdkM5RYZQBGdpix80IbSc3HqK/nCwMSrIgZOf51A4=@lists.freedesktop.org,
 AJvYcCWAP7RbfdgektWdwVNQKMP0nhct8U6IPg5sR99SfD3GSQKUa8dsbgsN79Uzcx6kN4njAdGVXi1sfgWH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHTWp4fAVPSrERxx+PNs8MuYCXBLqvq2xJPB7SXfCo6MbWcFfn
 rAFbPsTat88JrvDnAD/Zfqb5fNMbc636edP3aLz4jBsyVv/AshVF
X-Google-Smtp-Source: AGHT+IEqjD0pfE9Tv+DdK7SKAV5je4YjRSRbb8e9vECs6S3GOh1jf14emjKYBkmnsY1RroQpxtUgAg==
X-Received: by 2002:adf:f64f:0:b0:374:c977:363 with SMTP id
 ffacd0b85a97d-3789268f0a6mr3668337f8f.24.1725868621057; 
 Mon, 09 Sep 2024 00:57:01 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:00 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH RESEND v2 09/19] bpf: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:52 +0200
Message-ID: <20240909075641.258968-10-ubizjak@gmail.com>
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

