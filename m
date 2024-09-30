Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3F98A2B6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D332110E438;
	Mon, 30 Sep 2024 12:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CA409fsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C3010E431;
 Mon, 30 Sep 2024 12:37:28 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso33245175e9.1; 
 Mon, 30 Sep 2024 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699847; x=1728304647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GlV+nN18yw3drRT6eHy6/2hr4o+8F6xizJomHusoOY8=;
 b=CA409fsjLCrTR7uFZHbF/lG/JhqXdsvf0QAaDHP2WulvgRZ2oDHUxYwqiMGTfvvBpK
 GE3I/EtRAAWMdW0vIcqAETcxO6yXNt73nMYV46I7Cx/QKEAVsZWyIncNo6Z9VzZNqLfH
 TmJ55tdEqIx9oPGAKYXHQIryE/qt2qFCZcUJHsh3nJZbOs1UK+kijTHarWV3qPB8nZqs
 1mCFIW+kMc7ZeMvlVsUD8BjumjEIaL8M5DEdpp54+WdZFXjgYruG6l5A/KtsJD4c5kKU
 4zKeNncShQpjAKjYhO4ZVx7KQ/LSzLq+h1q8NWE/somlhemvchhen/+vggNnhnORgCBj
 bFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699847; x=1728304647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GlV+nN18yw3drRT6eHy6/2hr4o+8F6xizJomHusoOY8=;
 b=aAFYqkeT9CdOZqasGBIizx1c89ClNhDlgPjznyIICNxgnD6OKJgfHP7Kcz0kIfP3Ow
 G6tC72q+rz6VTMqFxwRBI0GPNEdmQj6+YkBBamC1+zVFjd5uH4pxdSZUhb86vJyqFB7z
 BYJ3j0uyJWeL6QD2SYTZGEP0kPyQiB+O5Ue/DAe8fevqI5L8H3iCCI7M/WogqdzjoDhD
 dCZCQra72Gex3F4KrJwyBM0AGxL7wIuUc1Z2j6+Fd1zWOiQu0YXC3lauHpDX321QT8U2
 sBokRvzup3YjyJOHW04AKNppqTOPUYKt6hOTfi4e5rvbIYUhFRj3+WEkKffekfuyZ/sH
 rRSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUYpPFEQB6VNM0pNU3fNkpnNJ94ApJPYFDy7h08WHLqFgM3tu4sGOl83nMeuYgn61cu0b7b7WyaIjb@lists.freedesktop.org,
 AJvYcCVWA7dsjndzz7LdncRoOYGIaZpx6lK3VeQSe5LODjugp3B5ZtTNgj5Go1/niRO/OvoXzA9AA41+jhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1TTFxoji5+VvKYRz2UK1bJuqzoQ92zhqVD6BRugEPf1nu/dQ+
 DxBTA1fD29oMo5tILmrMnOaL47UczZSKOGzFUr0AnOVp6oyr7PKl
X-Google-Smtp-Source: AGHT+IE0AKmAHzGMSeF7N4UA2hEqVXGKPVEVP5SK27gagSW7PpUlsTlU5xb3Nv2RVaMagE1IaBh5yw==
X-Received: by 2002:a05:600c:6d4c:b0:42c:b995:20ca with SMTP id
 5b1f17b1804b1-42f648a27f0mr40922015e9.24.1727699847144; 
 Mon, 30 Sep 2024 05:37:27 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:26 -0700 (PDT)
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
Subject: [PATCH v3 14/19] bpf/tests: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:25 +0200
Message-ID: <20240930123702.803617-15-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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
index fa5edd6ef7f7..2eed1ad958e9 100644
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
2.46.2

