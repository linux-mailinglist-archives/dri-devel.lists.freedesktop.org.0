Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7498A2B0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1512510E431;
	Mon, 30 Sep 2024 12:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="foTRiJDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F343E10E42F;
 Mon, 30 Sep 2024 12:37:23 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so39962275e9.1; 
 Mon, 30 Sep 2024 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699842; x=1728304642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqCZlFa0k9WmJz/BFH863M+r457tyeztRr2WseZe9PM=;
 b=foTRiJDA2vm1+0lhZ1rp/209VP6Az8gJlSnGIDoptdovVLqVpGiafx0SWwF6UymVyL
 wM0a39s/AjqLKiY0V92JPgU6I3Xoy6Eu2jub2gJvWL+NPrgSBkb7uZcgoG+jSSGBu8gi
 wqDdX+G0Hlh1uiYaPJrhjeeMdH+ib2kAKBrGpx21ROBU1/fudW7B2CddV0gW0sdedbXp
 lygc0zn+iN+DVq7hyCtyR1jXHur8Gop8zn1GHy7rolurlxE59s1ivlpfAvEgfF9387li
 YnwZwE3xL737nP7JY4OwatWMB6ZIsxhBAob01P9n23vwBbllzzHz4DeVxF4KbbSR1zAy
 1Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699842; x=1728304642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqCZlFa0k9WmJz/BFH863M+r457tyeztRr2WseZe9PM=;
 b=NMcvpd3+Ok9n6/95v9OoLGxjaBgnXON3CXhApiTe29pMxpAI94jtgqMQbP8E2YHYEH
 ZgKibcTVK+xPxWoUCshdsNyNEYBfZXJWNkL5xCvqcZNfpwbjXQEdaSNmb7QguU9gba4g
 mcBzXlfIiLdp03WNrrXwwWDnqdj30oIyvbcIwah9r6/ywvzKdsG1IAxbMltPJVC7PUQ7
 B4MlComH9XTpONo37+4KnoD/r+LFboyyA5xH0TcXI+v/paPQl9/xOvRGH61pNIUqzKQr
 78z+7n2r4nvzcOVxuOSe8GPCXu2C5Ju4L31Ck4jy+9ojBtd3CSHWKmXjEfhsNM/QYUZc
 cjuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO4h1nUIzEkArEuEmFtzubOwiCFIGuNR/fDCRs1YzVGRZ9t3LxX7aU6x7uxPRTcvZr5MdwWRYkqCs=@lists.freedesktop.org,
 AJvYcCXIXZ4ZWQWX69QSLSuW5vOmzYQj+C/dTpBrzsc7JYcG/4WzGjFWAceU2FM3ssHhiIeVU9it89OvXHyX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAzpfQ8kLvXGlt1j8FkIZP0QeU41afNzQwaOqtF13QlDRYu4fy
 osFUzazbpaYbuZvoUMrNKNGztmZRTS9i2a4iRpwKCr/Q+39WlqUs
X-Google-Smtp-Source: AGHT+IHDSczxlpNlMjqYJQ/J5lvvp+MGxNHf3VyEwPU2HocH3ahQJeDUV9edXRytld8Js+EVeXOtyQ==
X-Received: by 2002:a05:600c:350a:b0:42c:b74c:d8c3 with SMTP id
 5b1f17b1804b1-42f584a2da9mr83108865e9.32.1727699841971; 
 Mon, 30 Sep 2024 05:37:21 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:21 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 10/19] lib/interval_tree_test.c: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:21 +0200
Message-ID: <20240930123702.803617-11-ubizjak@gmail.com>
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
---
 lib/interval_tree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index f37f4d44faa9..837064b83a6c 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interval_tree.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.2

