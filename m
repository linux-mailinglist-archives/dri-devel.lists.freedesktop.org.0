Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84198A2C5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFABB10E43E;
	Mon, 30 Sep 2024 12:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BKwnoPVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB2110E431;
 Mon, 30 Sep 2024 12:37:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cbc22e1c4so31362165e9.2; 
 Mon, 30 Sep 2024 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699845; x=1728304645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrMbRs6ImQWe+o4vD+CgIqmMsoPFPKHQYE/g1FviBLg=;
 b=BKwnoPVEb/gaMV2shV9O+PP1mllFkO+pvOVSoBwhof59VOBZjeVHtZcAl46sFS4jFI
 8gpgC8vJ1NJYdZv4VvkGSZYPHe0Hw5jShyvMQ04DL+/EgRFgX7bxkxpsWbjUhK3rhyDc
 /4pZPrztxn6fZO2GHAATR4swCv/13YKYaaQ1BE3dYIUzDzvU8Py3clxb3uOWVJCkGuq4
 EB4OFjXKkcXrPhi/TWrSGK+fINY1EnDdc51v+7n03Dz5g6SEPQh2SFbgbtLoNbR+iqmV
 MQgfHzdNmIJXDwVnbH+7KEeNsenjt/A6AJbWnyto65Ci2rSPzEfQUlnLfQrbhwt4odSQ
 qK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699845; x=1728304645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YrMbRs6ImQWe+o4vD+CgIqmMsoPFPKHQYE/g1FviBLg=;
 b=uP6wBc8IM00louxsp8BB3IswmMU3yvQzR/nvYTeCgCmfliHN4qgPYfWQ2/HirIQGW7
 HQ5T2t41An7QNqZSHK80npr7By5WcCa/Zr2ktWTf1znSfaopMcL02u4QJiIWcD/Yq6PE
 g7hZ2W0q4Kt5wpzsAVsg9Y+Y9hz4CJ3ehDJhZ8hapiTYQ1gywce0cpPI82Li4igZhd4q
 PzWushw+/7rcPuCi56HNFXcOaSI1RUtwpeVTSKtDXs3d0T/HODF4lh8c/vHiWuJhuqgv
 7G/tD6Nb1by4V+94yIJxq66aLcRu5sa2IkbO1P/MWcndgbSyrjFRVMHYHLid9nKtsDwu
 0l7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4RMpmEOWLwToQm5Dkot9umD/QH8d3HKhcUtU1IjhdjwiVZuLPBe0dRaO2zpaytjVbKU65boKs3SE=@lists.freedesktop.org,
 AJvYcCXuOD3TcRDo5qqvP6NGHH4i133HX+UKq80+75zToJzS3agU0X219sRN+iMObXcSQlQd40tx13SohIt+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGresuupZuWa10DO5Ba+cUnNs5Ojtm5uvOv8QJlSjuc/8TkpKq
 HNhnrRhDtofYGQ8F+E0fpPkh4qh4iLJLtZTnAjYG8l8YU04QJyQM
X-Google-Smtp-Source: AGHT+IGTpcbHJYLBsw4P9dpJsKy6t/gAtufuejfRIApDiA0V+yz1rvy5JdCXyTqQXYKOI2mgKeAbTw==
X-Received: by 2002:a05:600c:4f96:b0:426:616e:db8d with SMTP id
 5b1f17b1804b1-42f6ded6a45mr9817345e9.15.1727699844581; 
 Mon, 30 Sep 2024 05:37:24 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:24 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v3 12/19] random32: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:23 +0200
Message-ID: <20240930123702.803617-13-ubizjak@gmail.com>
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
2.46.2

