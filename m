Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B06E281F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857A10E070;
	Fri, 14 Apr 2023 16:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9832410E070
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 16:13:02 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so12528209a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681488780; x=1684080780; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AcrAdIw/i6wIDG+6jUQ7koxeYwprIkhWuT5Y0B8uUwI=;
 b=ZFKVk02nkwQNmmAWsmzpGY8TY+1AhNP8xYmZV/zZ9EznqK0yZzEC+2S4dZ5R5A8hPE
 iKeZA8/Qrsj9G2/YZQXdptJTCtZ2Iv6To98gRUSOC1XXU8/JiKp/wDI7D+hyz6tfyLqg
 ZmIkzWrMlW2HlU0sGq7qqzCp26eJsBTZyo8cgkcSm3WFMzHLK8vGtzYRVa08CpYbAqGh
 3HbTxw7QcibwIV7JmOnj7px4GJmXAZI+XUk9oz+U2dqmOZJwI8396A/I9NNy8hcXyztP
 bG7uqrID9wJQ/VC3DyuSQCRO/7bpiEsmtZQnuMmc3eU7gLZIasQ2OK+o55DtspdhPqcm
 Q1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488780; x=1684080780;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AcrAdIw/i6wIDG+6jUQ7koxeYwprIkhWuT5Y0B8uUwI=;
 b=AYAQhG6/GINdogi5cEyMZz3Uf1fFR8osNcd93cJ6FqXG8HpNyd1rN5XbdD4tghyFCJ
 RQh/2n6OgDrn3NGEwpiI9nkPqby9t9aqzIstavRDAbGzoJigqUyHBtBfi5rVyuupZKD2
 eKC9+t2ntYZv1wtStQkoWhn5ztrcvoCAorsNVuo6m7NFbzeUF0qwdb7WfvhbpMXC+05n
 1JczcssTzxi7uolPPcqGnGF5SdUMxo6WI05Zhfy692zeTTcR0PedWMSpXVk7PdW5EQBz
 1kBA7jesmZFi7/cl83fbvL2ltCDHVsL7z2JgzG998rjIOkUMornexy/7vdh1ZFpnn8Wq
 7t/Q==
X-Gm-Message-State: AAQBX9fNUy453nMa7EItwLgLHTFkWJWg2Fhm2hCDqOrOUBm1zgTiEQjg
 wclk1p4mWMaqbpvue87pLsVDz2y6LKiCn8wm/wY=
X-Google-Smtp-Source: AKy350bTTtV3eiXQaZt+7LNqJuzWYVK/Xb40ZkXwpYfIWzEF9hAsIrNLItup7M8+Miq7hsucxZgeeg==
X-Received: by 2002:a05:6402:3554:b0:506:74f5:876f with SMTP id
 f20-20020a056402355400b0050674f5876fmr5591216edd.6.1681488780212; 
 Fri, 14 Apr 2023 09:13:00 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-d20f-2c76-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:d20f:2c76:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 h23-20020aa7c957000000b005066ca60b2csm2242687edt.63.2023.04.14.09.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:12:59 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v2 0/2] Fix mtk-hdmi-mt8195 unitialized variable usage and
 clock rate calculation
Date: Fri, 14 Apr 2023 18:07:45 +0200
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFF6OWQC/42OSw6DIBCGr9Kw7jSAkmBXXXTRLnqCxhiQsZBUM
 GCMxnj3oifo8vtfMytJGB0mcj2tJOLkkgs+Az+fSGuV/yA4k5lwygtasgI6N2OCLkToR8kqAdb
 0Dga7QIVMsEILrZQhua9VQtBR+dbuCznSeJzH5nF/PXd/iHiMZfNdZ7YujSEuxysT29V/rk4MK
 GhZSl4KaTpqblotX6cjXtrQk3rbth+qabgq5QAAAA==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've received a report from kernel test report [1] that a variable was used
unitialized in the mtk8195 hdmi phy code.

I've upon fixing that issue found out that the clock rate calculation
was erroneous since the calculus was moved to div_u64.

I'm providing those two fixes on top of 45810d486bb44 from the linux-phy
repository [2].

[1] https://lore.kernel.org/oe-kbuild-all/202304130304.gMtrUdbd-lkp@intel.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes in v2:
- Propagate return value of mtk_hdmi_pll_set_hw() as suggested by Angelo

---
Guillaume Ranquet (2):
      phy: mediatek: hdmi: mt8195: fix uninitialized variable usage in pll_calc
      phy: mediatek: hdmi: mt8195: fix wrong pll calculus

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
---
base-commit: 45810d486bb44bd60213d5f09a713df81b987972
change-id: 20230413-fixes-for-mt8195-hdmi-phy-9e1513b5baad

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

