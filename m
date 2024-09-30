Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2C98A2B7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F7A10E43A;
	Mon, 30 Sep 2024 12:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SMpFApbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F28710E431;
 Mon, 30 Sep 2024 12:37:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cb9a0c300so33354015e9.0; 
 Mon, 30 Sep 2024 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699849; x=1728304649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=It3uv8+V16fpn+saBfVIlpi9seKMH0hwPDwquZC7SM8=;
 b=SMpFApbpbeVNZBWN6+7rNNJCd03NTUw0tOrxtu+FYDHWaVSCXHbBv713/KSCv1MqHT
 NvYqNillD9W7KST+eXH8pIaynBlkIPSiQFpbESjahlOldgoOCi/xx4F/FUkwI5d2Sd5B
 u+6iZf5XXDqRlesQ7Yzvk64ZpvZ5QuXmUJp/KfnX0jgnSTMzElbFozTxon1lJguIDM0J
 4eT+H36yCfkS6l6MZE3dHr7N+KA52furX+ERKV5wj+7DV46t0zC9rlObakmGRp/vFz7Y
 VY3Vddd9Nxc02kuKfMG/nTqGJwTPo4cSenf/F5zq3q/3LwkZrF+YwbNamjWJi6BSvd3W
 vuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699849; x=1728304649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=It3uv8+V16fpn+saBfVIlpi9seKMH0hwPDwquZC7SM8=;
 b=h/+ZqR0vepbZMD2Iuf606Qgs027tuxLLQzDQvTQ9RfW6cX/DvdZBkY4JzoaOyLFAfk
 eSnLS2LOvoYlJ+vZ5uOxMM7UhQurqe83t1UCKO10EMW1wCznvkKNAx5kyhEgvVYVc89z
 yl96R7lv8tpi5Y0r36a7005llnqsqTBaEwtWqhLAiD0gJ/roEQlXtCOOsA1M+EnozTWd
 n5L0ukcBCas/ZqNozXiZdAX7TmNCQvsEot+T/vk/uCh3mC/FtGdfJtzg2jngoq4uCiqj
 ekiNF02DoHIA8+YAZWl8xrPUsYerCbM3QetBrXT81Zm+IQYHXE6Lc0axzquxaXvk2HTv
 qpAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoPdL0uubOG/1ltRyqSZP9iyQ5lMv7hYCJ8jvEeo0Ca6vCLEx1DpAKIrCz+FMLDzGFgzmp/1I3+DJ1@lists.freedesktop.org,
 AJvYcCWYZvaKLApOqkEL1OpNUhicGv7HmVkp2h7oRrF8kQ1tUirmczj0HoIDJLmyLl8fy0luTHAXmuLz1dM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfF/TEtpgascYfpI4HdJShQPIBE6PJV5iiCPezgm5hu8wocZvf
 Bh8Ab9zA2aK8Dwa8zJN1CglCpTrn1EHdG10R9TKptRbPpDAG9aXK
X-Google-Smtp-Source: AGHT+IEqfXUL1BfL9uwnKBRwxBvUK5HW+SKSYQE3kTn+gocX4MXts0u3yymxZU+7jyC+w/S3B15WBQ==
X-Received: by 2002:adf:e888:0:b0:37c:d344:8b42 with SMTP id
 ffacd0b85a97d-37cd5a874bdmr6237784f8f.15.1727699848530; 
 Mon, 30 Sep 2024 05:37:28 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:27 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH v3 15/19] lib/test_parman: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:26 +0200
Message-ID: <20240930123702.803617-16-ubizjak@gmail.com>
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
Cc: Jiri Pirko <jiri@resnulli.us>
---
 lib/test_parman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_parman.c b/lib/test_parman.c
index 35e32243693c..f9b97426a337 100644
--- a/lib/test_parman.c
+++ b/lib/test_parman.c
@@ -39,7 +39,7 @@
 #include <linux/slab.h>
 #include <linux/bitops.h>
 #include <linux/err.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/parman.h>
 
 #define TEST_PARMAN_PRIO_SHIFT 7 /* defines number of prios for testing */
-- 
2.46.2

