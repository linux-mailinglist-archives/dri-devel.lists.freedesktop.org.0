Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5798A2AC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76D010E430;
	Mon, 30 Sep 2024 12:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="du2iaEOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E6010E431;
 Mon, 30 Sep 2024 12:37:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cde6b5094so38075035e9.3; 
 Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699836; x=1728304636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NOB1xBCChyVodl1AKBCRn0/gjY8Cy4B28eaNVB3ngoA=;
 b=du2iaEOeBHChvnaA75+ncmekVt9gL0efh1b2xTFmLIAhYgW7El09NhnbL+mnfMXfD/
 imBB4/j/uOS5A9qGvWAEAVfjlze+t6B7ndW5B7PXib9Hvksw3T0moILzYmvbqYimoHhQ
 up4+JE3Ee839BrxCINcSf4aTtCSYF7gPOa4iKWOPgPM4+SF03f9byLyOmtAMtL1BPXpp
 deAqvU8A+BjemeZXkIWjVtB/W8oXPL+GAh0FTJqDXN2RgQmmmKoehT+zvQMoLeRu7njC
 OGHQQwrWMKe5p9zREz59/EvjWJhbftsDU+JCSqjcf+w17ODv44PaLOZRbwWpmDlEWCn/
 TCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699836; x=1728304636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOB1xBCChyVodl1AKBCRn0/gjY8Cy4B28eaNVB3ngoA=;
 b=X6KP2xkCBpmIblxqMeJOmARhmCiyo6LgKAeBaUp+2/xovA3ivwCsmSxddnM+YbOpVx
 o6cXux3fFknpagwmiAat0CYsJJ35n/FGrTBa1Dno68TQPuzNt/yfRi9hQEql+bLLxMwv
 PgvbPW3ReOJtccMX2nqnGnlV+p4a9aJBjK16Gd3pyA0hQY0O47ZzIiHwzzaq2sw374ux
 3lFfSwzG36v5+8QuPTegj4otneyvrvFzDhxQZXBn9/PQmbVxGyAQcq7V/nHEpAkdHn6y
 3jiqVVsFCSsPXUKET7R6+OhGk/TEUH18eqdnTsgeWxgLrWUYwIST/XpUuyeV67YgQF9k
 eO0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk/MQdWLNYWa7YqdpE6bb82YgPO4/wJSEX3wWfFETuLywVV6lpPjoFFACNB4uWqha5xG2KOGl53hTf@lists.freedesktop.org,
 AJvYcCWF414HDXfKKMn9hCX+gWv6KVGdqWxWSzSJRgscQheyKuWmLQ4I9LE+BNkCHOPLBRt/hqhWrvvRG1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCE3LsMr4SemUtL9+dRLjLnJ+Xh3JdqyNUBQGVXAeGfsRrXwma
 Yduz7bEp9M3AY7QTdRuD0ERnEmhWPjz2ndnDIa34CNUemGEzy/aI
X-Google-Smtp-Source: AGHT+IFX7UFFJ9mFBZg+bn1buBc9cHhJrMVxmqzrsXfLIQStfn4WgdL6i0BO6HCbDChBmeLhRHv16g==
X-Received: by 2002:a05:600c:1c85:b0:42c:c073:412b with SMTP id
 5b1f17b1804b1-42f58490786mr95354705e9.30.1727699835819; 
 Mon, 30 Sep 2024 05:37:15 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:15 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 05/19] media: vivid: Include <linux/prandom.h> in
 vivid-vid-cap.c
Date: Mon, 30 Sep 2024 14:33:16 +0200
Message-ID: <20240930123702.803617-6-ubizjak@gmail.com>
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

Include <linux/prandom.h> to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Acked-by: Hans Verkuil <hverkuil@xs4all.nl>
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
2.46.2

