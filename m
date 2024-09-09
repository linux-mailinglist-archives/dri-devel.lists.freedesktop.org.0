Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A91A970EDA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0E610E2EB;
	Mon,  9 Sep 2024 07:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h5PwV+XT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A8210E2EA;
 Mon,  9 Sep 2024 07:08:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374bd0da617so2425709f8f.3; 
 Mon, 09 Sep 2024 00:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865715; x=1726470515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
 b=h5PwV+XTim6YlxENJcfkPRDSPZop2VPjCHgz+W6ngh4ttM3xp7xsPlg0oG3MiS+BuA
 be1Xv9PkEavb7OxByi0oWoXu+cf6yna/zj+VZqNjN8oeSdYeNNTq1D/xYxubfbdNBadV
 Zv2L9VnVG0sEAoknfZD8tEyjZd4lyjjTZaYz6ykSTY8th0TVUKnh8bwAOeoQjTN2LrHG
 J5IA8RjEEcdb2zuWS5n+LySnlij5sqFUZaANO3dS6aHsa0J9ANwxr7wmnzhEeXwVKTR7
 MICBaNlZz5LAF2j/PLwNLHuiPEI70AlLPyKpBYYpjJrEH6stvxUdvzB4zDKjAlqC9Qq3
 kF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865715; x=1726470515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
 b=a/orZHa2plAqfiDW4dmWhgJftamlpA6k8NL7U5Ifvzz+UaeYBkwTov1FDU+QqpondX
 tPKTDQIuv5EDHKcTz5cYxvqs43WUWPKEtZhkSexUWLpfMPjrvQc265MOjjiSHKeT/aQ9
 ZMQXWMvjmnDQa4gNnUOfNaVkVUnmlxZcGkaSX4/a7KQmQokRk2Trl0yWehykgW7Ev0z2
 rGNUb+AY5l6PA/lS87jsqU+q3aF/bwcBGDQEA8w9baZw9Rjf4GDkItjGGGhLYUIf+V1u
 giEx7gJsyIRmTorHRvUYDDuyqWSdWSxq7OkDP1nXFhyUGIpQejUXhDNg6srNSuJcoBoC
 pAAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSzvA4loMNktbDVwCaIpGHWceR11zboFs55VN1l+LkNjAohLoSfadEw8JwUoF74AMo/iYed1ipsHMy@lists.freedesktop.org,
 AJvYcCWDjDQ1aJdM6qOziNQSyG7RH1YOWcMK+5ogwoGXZttEALjTqxKtNNhWDw04HyHu9CzQNY8hZ8tn2W8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu3DR298ilHKo+0gsVSqSXN5bpwCt1zh3+C3+6mne2XJdF/3+7
 NLH3JqtW/ygl2zCJBWKRdPKJEg+oxpLncvnEZfnhLU0gBfU8Yqw7ObF+Uma6kIA=
X-Google-Smtp-Source: AGHT+IHM6W5yPkPlE3JV0r3wTbIThg1ONa11NIP8C20CX17/Y0zQWpFJHw7ZEl2cY8rMzCAWatYYQw==
X-Received: by 2002:a5d:6b91:0:b0:367:9d2c:95ea with SMTP id
 ffacd0b85a97d-378896a9992mr5949005f8f.56.1725865715399; 
 Mon, 09 Sep 2024 00:08:35 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:34 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 12/19] random32: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:26 +0200
Message-ID: <20240909070742.75425-13-ubizjak@gmail.com>
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
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 lib/random32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/random32.c b/lib/random32.c
index 32060b852668..31fc2ca68856 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -36,7 +36,7 @@
 #include <linux/percpu.h>
 #include <linux/export.h>
 #include <linux/jiffies.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/sched.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-- 
2.46.0

