Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B18970ED5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B30910E2E8;
	Mon,  9 Sep 2024 07:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="foUI5KS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFACA10E2E3;
 Mon,  9 Sep 2024 07:08:26 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so2402909f8f.3; 
 Mon, 09 Sep 2024 00:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865705; x=1726470505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
 b=foUI5KS9gCLiVU2BbTCwa2Xka/GGYE8sBePDJrasbHlEAIy92BhAYc08eRPQIBge+k
 0nT3Nkih93C0Gp5sqezU0Edydq/NrlAhZz0osnkpBwOC2FWoDSj1Y4zg15EMMIq4cxtb
 sgprr4ubwdekZbLkS/tl4XI+kRI+ifdJ5QO5DwLxijck7k9aiASD1XIbe3rXlNXBFRqY
 eq6WC8K+QrA1/8xcazb+kF0pPYgKnc4fZjnf+mzCOQ+p42vXbc9Uqh3/BbTERI+fw4CW
 /UsHk80uNrtSuuhBhdGv8kcvEC18eqDDvALOR4YQBBkXjMM0GhUCXFANK5aQVKfAzljj
 I+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865705; x=1726470505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
 b=mcMfR0DMpHx4bzIGZ3u2OQ7Coe0r+USwSS6HhNEHDTNTcuu3VXTWzw2igM1N9PPwGH
 9KmiomPHk8TZtV5THMN/rl/ZZzim7GNIt5EokeOORsAe/8COfqid9kuXyFXEYw/eMpZs
 SMhLTpICzkgLW9ChCyWPFu1k13Vfjl2Oh963/wEc7G37geRKDdYHBs36JLYHJiL5S+Qw
 QRoptD82jt0IFMGH9wAWifRq9SsPeHxD912J7d2w97G7lSumJuIb5o0cc32CJ221Rok0
 +NqNVeIyfauVjiYey/XpkMGaGUAVGYP3J1Y9kafb+QRjQsgVHiU9syl5Ar5RmdFRv5I+
 DSQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Q6LJSDD81OB2BlkQfdpnhdrhbDfajyEYWhnpQT+ffrRfa5ts/82OpG/HMBhWyslhHVy5lFCfEkA=@lists.freedesktop.org,
 AJvYcCXikHi/BLjA7U8LHSPAPIp3r/4/frKNPyR56bDShoE1Ij6xIThPFh5sjTW81VWMBLRuCamFF69K22Cr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGpaITBHewtqtRafeN8vwxYSbeulduxsMUq2NX0usOa2CbxvvF
 WRR0o6hDIb05lHEJ8XsOljjCy4I8ov9QMD3rGghUoIVT+BVJjk4q
X-Google-Smtp-Source: AGHT+IENAg1lx4hzfxdNZ9tmKUR4RCTP87aohUUWb/KE3Nn7ukR11EcqHzf0iJoeJH4fmxJ9dQt47A==
X-Received: by 2002:a5d:5c87:0:b0:378:89d8:822e with SMTP id
 ffacd0b85a97d-37889d883e2mr5832530f8f.27.1725865704068; 
 Mon, 09 Sep 2024 00:08:24 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:22 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 05/19] media: vivid: Include <linux/prandom.h> in
 vivid-vid-cap.c
Date: Mon,  9 Sep 2024 09:05:19 +0200
Message-ID: <20240909070742.75425-6-ubizjak@gmail.com>
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

