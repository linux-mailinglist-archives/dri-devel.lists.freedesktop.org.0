Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC2B32F2D3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1D86EC0D;
	Fri,  5 Mar 2021 18:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5B56E2B8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:39:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ci14so5361478ejc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 10:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bIJdIGKj6HKNSz+mFrNMaUm/bPZqpcnizzIMsRqYuoY=;
 b=RiVWhR/OvXOcja8xhoQiGT5PENPEhs6J6857L37rppeYpLlOTH6et5xlvA4+/l13oB
 IgaRlZNmLThTUY36AbheXvHSUyptu/w4y/kNgRcH8BW+s6CZe7PZdF95iLM6XL4YUwLu
 bJ5qmvSmOLTEitH66jN4etv4LydMPbJeyRZJOiSrnoNQ87xaKYAOrt4ceqRRnsKCTuZn
 PCbHjZbHpdMRs7LdBdfWzQ9cW2YM7fRq/AMFje8ieYX7bQmjk4zRyp8l84iR6+uMTHvU
 X4J3apTH6S5zqMHdBsLR8zyjSlsmmzFgUGJmcjUv5/89r+kPcSIBo8ohwOm8mnurXhst
 yoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIJdIGKj6HKNSz+mFrNMaUm/bPZqpcnizzIMsRqYuoY=;
 b=uAiBRSJAFFLCfBHoi19KunwY+Tc676ZU/ojfmmMphQh5HuHhkXbiy72ugpEKCRwdaM
 +1u65jM9F0ftkTxw6DktlVGLNE5HE+9XKnORMJz29bBRqla36rdmMlRTu2PVtY5CUiqc
 Tsh41UaJJrpADUKPute6CuIOlqW5EHIu0HW+R2cTt5t0KQ1JI/G93MusK8sLOEpOqZ9m
 q0LTpTHNgXfH042gCX8rpEa0DUC3XOPsg5U0MzkZZMoPC0JhDOp0zDztnwvr/76I2LVP
 b3t6hbkbhQqLUTixSEJzbrPZ+G6ByO9DmpyuNEiC4qqOfBIoS6+8IDhDvsnFZVbgJPe3
 mZZQ==
X-Gm-Message-State: AOAM532AHtcfmdOgS4a9QjTtlmXD+pPq+g60N5cEI3gHvnBJdmvHkanE
 VxgUU2uUnsu5Pw90ZF2eYaOP4QQ7HTcjNA==
X-Google-Smtp-Source: ABdhPJyYrwPZqYJTonz4hUccXLXjyd7w2XNt8KWKQ+V7zyILnAlCiP4HpU6o6QjjEkD32oC9F2oRPg==
X-Received: by 2002:a17:906:c210:: with SMTP id
 d16mr3539327ejz.187.1614969576258; 
 Fri, 05 Mar 2021 10:39:36 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:39:35 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
Date: Fri,  5 Mar 2021 18:39:18 +0000
Message-Id: <20210305183924.1754026-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Use the register directly over the existing SWREG().

Ideally we'll port the driver away from the local registers, but for
now this is enough. For context - I was reading through the IRQ register
handling across the variants.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 6386a3989bfe..0fd306806f16 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -10,6 +10,7 @@
 #include <media/v4l2-mem2mem.h>
 #include "hantro.h"
 #include "hantro_hw.h"
+#include "hantro_g1_regs.h"
 
 #define G1_SWREG(nr)			((nr) * 4)
 
@@ -20,7 +21,6 @@
 #define G1_REG_REFER2_BASE		G1_SWREG(16)
 #define G1_REG_REFER3_BASE		G1_SWREG(17)
 #define G1_REG_QTABLE_BASE		G1_SWREG(40)
-#define G1_REG_DEC_E(v)			((v) ? BIT(0) : 0)
 
 #define G1_REG_DEC_AXI_RD_ID(v)		(((v) << 24) & GENMASK(31, 24))
 #define G1_REG_DEC_TIMEOUT_E(v)		((v) ? BIT(23) : 0)
@@ -246,6 +246,5 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	hantro_end_prepare_run(ctx);
 
-	reg = G1_REG_DEC_E(1);
-	vdpu_write(vpu, reg, G1_SWREG(1));
+	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
 }
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
