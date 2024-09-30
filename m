Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D230898A2B3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D96510E433;
	Mon, 30 Sep 2024 12:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cyceD2hd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7396C10E40F;
 Mon, 30 Sep 2024 12:37:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42cb1758e41so31426475e9.1; 
 Mon, 30 Sep 2024 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699841; x=1728304641; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6rs5JfkaX4vjLfXsqAZRoDkbs0NL2Tu6uf8tfOBZdKA=;
 b=cyceD2hdl1K4gFOuvlOugO4HaLTVYyb6d+LoaiXuQ+4dRSBGQToi8rrU7o6glnkzQJ
 HRIU4IVxjaAHJ8EFvoOSypE2MXnsqaTkyE/Purcquj0b40K6u2HGn4k9dbIIMbEHMfjT
 OnJA7Zeh4lbmupDQShMiPfeTb9xOxv79+TaB0IPgCViU9SNafsudb7u4DM1mMM/sAds2
 2/mxsLO6V2nJMJZ1ShT8+vI6/BNupvQUuHj9XruAOupT64aE/8XByqmMTwJCy5sSqLV/
 jPK4YLO2BtsmrCMPro97HGmC1JPsB++Ggu2BB2aXOIPtewpBEaUZ/q2gU880j71Lhsmb
 FI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699841; x=1728304641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6rs5JfkaX4vjLfXsqAZRoDkbs0NL2Tu6uf8tfOBZdKA=;
 b=kUV1tvOLasezifeO99jaLuSd8Y0ZbunATkgwbVj+GYufL3ysBKfoxbR0yGj5xZNiuO
 8ZCkqlSPO7HKXnO+vz8WPP+DxgD/3gshN27K+rrsOi9JyuWFG4QHiUBck0luRFIA0d2/
 hc4JNiOHTMKF00U9hK33MmoxFqAFFMTAf6kdevFrA2ou7woF8G+ETfGYa8rOhuxDbwRN
 y4oKYuN05FbwPy9CK3L6IRl9Wsr3KsZ7usK5zEZMrGK/+rzBHWqToF2hyyREBwrUBTd9
 tsh9m+flz8jh4JwUs5gFVlPPpUCFMAInzYxZ63SIYb7MPv6LXDZ4+J8eyjX2qXClcCk/
 JKyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOFv5RgOSdzeUVj1Gy8ZtInPi/tI9uL/d1gvZLEJLKiWUTdvPFqphDnlHzzJQazfOhhKQ+/xKP+OZ5@lists.freedesktop.org,
 AJvYcCVZvRqWI50h1qMEuk3XGVBMmZ0pddRysHKJv3UZKtJjMOpjjXGrgEpRpxN42cY0lF9UMrCUj9novV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjMWUwoHjFf22RNTuJCzfdfzQdvknK5xpZyHdS1GGcn0UfUG/O
 NRPfbrFfoaeUZlIjVNLl0VIWWEffivOnEF0dHUGPDL2VBip8iAnr
X-Google-Smtp-Source: AGHT+IFHgMvS9GhqstV2aQ3xEgJPZmWF5RO5X6f+ra7fPCRYNUY7uUx6XjXf5I/swT371oPEEJv2gg==
X-Received: by 2002:a05:600c:1d8a:b0:426:593c:935d with SMTP id
 5b1f17b1804b1-42f58409f9dmr84281535e9.5.1727699840695; 
 Mon, 30 Sep 2024 05:37:20 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:20 -0700 (PDT)
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
Subject: [PATCH v3 09/19] bpf: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:20 +0200
Message-ID: <20240930123702.803617-10-ubizjak@gmail.com>
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
index 4e07cc057d6f..66474021f84e 100644
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
2.46.2

