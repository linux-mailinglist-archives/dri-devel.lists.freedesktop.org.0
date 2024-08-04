Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F091946D32
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F0B10E0C2;
	Sun,  4 Aug 2024 07:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OvfJXiNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0610E0C3
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:57:50 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3db130a872fso6646666b6e.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758270; x=1723363070; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQQ3mmtZRuc+UzgaTIbXRCgMjfWu2etwx8M84uu2mcE=;
 b=OvfJXiNhf5NsIEHT/+lw4HvUUjNzmKk+HmYLFCvbktUr+/iKnKVmSn/f/qN2NHUWe9
 UHq82TiLt9N08Q6+FKA+Kt6hyKtO67f9sJm0izl0mh1WS52v87ptb8lPzxgfnyyGpfkA
 knpJjrTkt6ikrEdpOhF5YdnwOvSKjXuDiFWN0Cs/ME1ywVGsRlXlhYdASQiv3b6VUGIQ
 GB4KIb+kkK83BxAnHnTE+HvVuB3PHhHNO9HF4KjSNG/mX9QbqwMVOHbXnxSPMTY0RmCg
 u3iF23+SgTAOAnqpUBo15a6hO/Do47HsFz1upc3U/bxoUrSMtkfYvj2NG5sNlDuT+A+x
 NiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758270; x=1723363070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eQQ3mmtZRuc+UzgaTIbXRCgMjfWu2etwx8M84uu2mcE=;
 b=naBHVOV74kxzcJ5ShhYaPZWSzJZHoNRRSmbDLQ6pJaLISaD6G1a8tQjvTZAnZHj5v0
 pTGP8QG/r4gOooGR8co0EDGmBS5AmiU8QZiAVkSjoSK8CNcy992O0nVd2rZgQKnjCMzC
 Rgzzfiyxn1nGtwplxGHR6WIQbwBI4yXech2zcngk64Z/03xpFloBVGfsUyzIFONViBV2
 jGz+7gV7z6KDDA40XDPjPXInE08jQkFQF1xjmBXVTu7IzEqQ8/xUJUh5u5t6DnNkuq53
 5y1w9CLOVVxDSJRx8zTWiVnCubW8EslUEmOk9tB66bCPeRCnoRx/HRTRhIJSLffLI7Kj
 M3eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb2RQMzkgsUQgi4AFhzjBwu1+iK2XWARR6kRyMB9rLMU84uNT+VQnwFC7VxXBjJwQUhs8DzjazTMcvS+gzeqv4SVZn9mluzP3HE4Z2csM5
X-Gm-Message-State: AOJu0YziFmAVmpel9ZAffsMOzgo4udS/E2khvTJ5m2z06iUfSqFYfOtN
 8T2DgFD2cby/Of+NXomxoH3svBxkrxMNAN9iMKK3Bc2/PRu95kJz
X-Google-Smtp-Source: AGHT+IEnK16jBONqPu6EI1AggsrrDpNbP1fkcELTlG1wIUqkHXvdRtx4NsDiXlOwAOqcDTPz63EQbg==
X-Received: by 2002:a05:6808:159d:b0:3da:ac85:3bd5 with SMTP id
 5614622812f47-3db557ef9bemr11482423b6e.8.1722758269943; 
 Sun, 04 Aug 2024 00:57:49 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.57.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:57:49 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Quentin Monnet <qmo@kernel.org>
Subject: [PATCH v5 4/9] bpftool: Ensure task comm is always NUL-terminated
Date: Sun,  4 Aug 2024 15:56:14 +0800
Message-Id: <20240804075619.20804-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240804075619.20804-1-laoar.shao@gmail.com>
References: <20240804075619.20804-1-laoar.shao@gmail.com>
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

Let's explicitly ensure the destination string is NUL-terminated. This way,
it won't be affected by changes to the source string.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Quentin Monnet <qmo@kernel.org>
---
 tools/bpf/bpftool/pids.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/bpf/bpftool/pids.c b/tools/bpf/bpftool/pids.c
index 9b898571b49e..23f488cf1740 100644
--- a/tools/bpf/bpftool/pids.c
+++ b/tools/bpf/bpftool/pids.c
@@ -54,6 +54,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
 		ref = &refs->refs[refs->ref_cnt];
 		ref->pid = e->pid;
 		memcpy(ref->comm, e->comm, sizeof(ref->comm));
+		ref->comm[sizeof(ref->comm) - 1] = '\0';
 		refs->ref_cnt++;
 
 		return;
@@ -77,6 +78,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
 	ref = &refs->refs[0];
 	ref->pid = e->pid;
 	memcpy(ref->comm, e->comm, sizeof(ref->comm));
+	ref->comm[sizeof(ref->comm) - 1] = '\0';
 	refs->ref_cnt = 1;
 	refs->has_bpf_cookie = e->has_bpf_cookie;
 	refs->bpf_cookie = e->bpf_cookie;
-- 
2.34.1

