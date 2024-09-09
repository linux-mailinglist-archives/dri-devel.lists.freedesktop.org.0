Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F40C97106C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E81310E306;
	Mon,  9 Sep 2024 07:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L+CA8KUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDC310E309;
 Mon,  9 Sep 2024 07:56:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42bb6d3e260so35806165e9.1; 
 Mon, 09 Sep 2024 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868615; x=1726473415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
 b=L+CA8KUNpaNWvMaVLf8HGqTSqKDY3O6S/LvNdstvRDKz6dgPDSEqL8MSujAnLi1Gi4
 aRcHVI9t8ew32jJ1yBQSgkuWwEvdMm8leES1KmSJJk7qVm4iMue+Mqi3mdjFemGs4sse
 fcABZQsPcgIbzZopKIHrIeS+ri4nYfRfoIMs1W6Qm8JLn1GjJQoDs0Q3j5cyV7haFCMh
 6Orapn3ls1QxQ2la4xqulUWkuI2DeFnGTf5a4b5ddQ2quZX99mKhGax+fOXlAq8RI48q
 BsVImqB9hPFFQRt0MYHBVOTfB1DMk09POqawN1ivU9JkpqnlYYUin63QlMi+g9yY4jaC
 7K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868615; x=1726473415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
 b=YW/p/9mTgUmSGGx6N135urrMYZJx/pz2GRP4SPcI5HTcqDlxrzGAYILyQv+F1V1yju
 v4l/rwtcFRz6sK3LIjwoUh6+zXfnlscpXwQ9rwvT92OvkXezqoQabIUkITns0F+5Q3u0
 YY/EiJW/Ki2xx0iRXHs84VT7MwyU+wtwqh48H+YvIW1nQ6RKBgPS6J7yFNDXBSWuag4D
 uJ5JO2Svuz4B10TU4ag3XLrT5k+Ibcvhjh0l8TrcNIrY+MyjNSM77iZAI+X3T0gjEZsa
 MWkICZIbmmt02gNPHbCdQhDlb7Kf/3c7v9dRgnn4v968Osu5PFsQwKjqYkNPLJvYsqjP
 2E+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFOok9bqeg7yV7li/Zq9uf7CslKmGHTeT8Uc8sp9ViA/SM5Nq61qIbaaNzkdwNgOOnp5dZHtsgmuc=@lists.freedesktop.org,
 AJvYcCXWH1/4EFM5yKTrtSHTVG/aKpbyXWzgS/MTRmutQMlz8bMOVyAeYcnrmwOs90KIy2ITDc7L24zazT0i@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/ZqpWGECnwdzxlLAgswbcS6fXyZJ7j24dKn+0sxeMMkwKKXbv
 0L+s3FrhM600YLmaXVQ+N175qEFJ5T1EdJTNg7pZ9ksf7zrFYBWL
X-Google-Smtp-Source: AGHT+IHjtALJXHfeHvlFfFIGF/Jv7NubOC1i9OVehC29v/06Ma4HBUto2Yd3NbJZOwnM97uKL0s69Q==
X-Received: by 2002:a05:600c:511f:b0:42c:bb41:a077 with SMTP id
 5b1f17b1804b1-42cbb41a1b2mr1246555e9.23.1725868614984; 
 Mon, 09 Sep 2024 00:56:54 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:53 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH RESEND v2 05/19] media: vivid: Include <linux/prandom.h> in
 vivid-vid-cap.c
Date: Mon,  9 Sep 2024 09:53:48 +0200
Message-ID: <20240909075641.258968-6-ubizjak@gmail.com>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 69620e0a35a0..184460eb356e 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -10,6 +10,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/videodev2.h>
+#include <linux/prandom.h>
 #include <linux/v4l2-dv-timings.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
-- 
2.46.0

