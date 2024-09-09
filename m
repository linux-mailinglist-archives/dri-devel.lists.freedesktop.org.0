Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC816970EDF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CAC10E2EE;
	Mon,  9 Sep 2024 07:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kAn9XVh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF2E10E2ED;
 Mon,  9 Sep 2024 07:08:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so2573753f8f.1; 
 Mon, 09 Sep 2024 00:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865719; x=1726470519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
 b=kAn9XVh6KjepPKmrpl3LPJ8O8/CTtpIQpGCKJ7jlbIE9RDtWT2IV6ITGM/bOzeRyvK
 cmJ0TWsz5Vg5kpaO6tjnBlnfiF4epD04Fir8/h7WJhXURSfqPRyCfM8LZtQF0+4yn93q
 k4iSiuQqXKFiNLhsTnd/VL6BAOa7cXzODyIRVx33ju1mOCVXFcOpijcreSbf0WJ/2+cx
 Wb6H857OReC6Y+z4kBla5sEHJlNZeAOAIHwWzmuqraGj074Rap39nIjWhoLVMbsJ2ovP
 vNfmhev8ROOzWoH7kzNPxVoU65AudV/RD2uAHssZWLUC+v1RmiDlRbeS1HhJcU6keHeo
 CRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865719; x=1726470519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
 b=GU8U4kS1cRpSKGV5fuIBidlBG+m5y5+HEwpm1rMmHzDSOCfzaf6IqDK58jZmZ2gAyf
 w6clcxsLL5MYBi0C06H8VcnkV9oTkam4gkVzWf+IsQIPJ9jD0xx92/2ls1DrNDA0B28Q
 sgtvIxoOFpTBr031XLKIQ/8Ua3icexd9Is9F4sQQq+1M7ecvRLupuV8vEnfxvKEFynXg
 LgnpmC0e4RnoxEOLW4dkK7HH9Lyk1knRW/THHR0nCUWxpR3KOZywly5HPLtfAAvW9vQF
 /5w8H36HJz4lEHdV9zjjlCaq8bbja8mhzCjh/CjgG8Mxxk5mETaVR+u5qG+84FYIFStZ
 BN1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1cbwxqA4UNcYdydOM3rPRY9KKN7sjtRWZf6/DdblaNV1SCRDH2IABJQ679XubnsJLFgszMqShrSQ=@lists.freedesktop.org,
 AJvYcCWhB9bL/b2hXs5pvAV1ZYJjJqWVQoW5t9zGFj0NvP+f1Wtnue3G8qYMMcHvPSDS7mMb0u6blYOAYaUi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwPIt2tLQ141rWV5UO3U5tBFlZMDNIXt18wCyGaRSLq6N8MgnR
 u/QppvCZ7KZWpt6PeSzJ9Zr6gapsb4RjEBL94g4moPmUVZ5pwW7/
X-Google-Smtp-Source: AGHT+IEQLNSW+PIzTLcAW22XrPAIo5gWgIG/codxPwAybXuXAtbQozQUICUfaqd7uB8QyM9Iess0AA==
X-Received: by 2002:a5d:46ca:0:b0:377:9867:9028 with SMTP id
 ffacd0b85a97d-3788967aaffmr6190593f8f.44.1725865718527; 
 Mon, 09 Sep 2024 00:08:38 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:38 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
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
Subject: [PATCH v2 14/19] bpf/tests: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:28 +0200
Message-ID: <20240909070742.75425-15-ubizjak@gmail.com>
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

