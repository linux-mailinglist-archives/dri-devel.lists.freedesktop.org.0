Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B628C3DD2B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C38F10EA18;
	Thu,  6 Nov 2025 23:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RRoGXhRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D46910E9FD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FAJMsAfnDQTxhU296hQyXnd4WVpQmvZ3EitymZm2I2M=;
 b=RRoGXhRRzcwPH6H7aqcj14SzuSU1w+1pyMvvRbLl8KlmRqJ8ybyC1j//JmcnAqCoImj1HH
 JkAOlfdv84F4BYQdLzE3nShpA+yw5o+MNsBkoMGVdDcwjsm69UsUjkvGZLa8ekrP7jnecm
 1Tg5XDhN7fCzwXs/AAS8FAOACwza6QM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-eH7cxcDHO5qdLcmPhbfpiQ-1; Thu, 06 Nov 2025 18:26:32 -0500
X-MC-Unique: eH7cxcDHO5qdLcmPhbfpiQ-1
X-Mimecast-MFC-AGG-ID: eH7cxcDHO5qdLcmPhbfpiQ_1762471591
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88051c72070so4346206d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471591; x=1763076391;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FAJMsAfnDQTxhU296hQyXnd4WVpQmvZ3EitymZm2I2M=;
 b=NLxR25084QKA9/d6FTsXMfp3BHvG9dgzDxj1syUeQ+c0Ub6NgF/ApfnfAl/yDJT3aJ
 e0V43NGuztNHfmkFJBRh4HuLmy96rXp0fXeVrRx8ca6fitAfk5NnSKO3NPZCYS+fEGqX
 QVh3YifyiNCs+Hn+Qk2YB7Zgtf0WHfwUvEf6el2EvFV8+wqRpOTTrQiBRELpIxDuZHcK
 IaN1AM7S61Ph2ogVMfiGblc+xWd9rJD1Y9KhLS4kIQcGpHC4/C+uKN/tcw7fBZTSa1wQ
 a3+T0KEJHMjmUzvQbsliwwHKSX7wKozBnB1jtTKlQVJCnd0DS5AqbP9UJHdIotSAGrP/
 lAAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2e+2EBO9yj9kM0Cuk0ffe5Y9BRyg4GicwHOdpC73VoTVe9QKefDfwls0WJ6tFBck6ZXYyq5l3Lxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL4dgFGlxwCVuK/GLaGXJbIs4ytHPHNOVuDONkOAIZVo8rMgvy
 hyvBvVK4mFnvs66RXBltpB5eb8JEJZfm203UhYOqV6/nghHbDbsx9nkMECU7ZMVKMua4w6QJ52/
 zj7VyDWCKq6TM8GIZOkTGKAWHfeAK6FR0svxBQyaxh3cGUq4lUotYnCZJyW/ZBKKXA/i2oQ==
X-Gm-Gg: ASbGnctMvqIEVkzvBz0P6JgaKiC/o9QgR6T0b5gw+fMfeTU6Z/U7ZpK6W9jYGXghfko
 Mxg8owV5cFdbxF3fUOCAWdgsljIxXnRZPeQmrQqR9SpwnjEkdxsIv2qoI5CI56fq7ohgU1obVmY
 tdC7LtwoJRK5FKA7t9dzz1WcLL/FZ/zvAbhBz+akLL4Lh38nWBUxjxdPgb1MqKbcHJhHtKqEBCB
 KncPmGC4WFY3sMBMi1YLF9jecTw7lwU4uAJwqEJ4px3qxCHcHlx5dCNcp79H5IqwRd/4dQ1KBXJ
 f31BqTKzHvJoF38GArgiMrvQVsiAlbN+D4P9CxRAJTRAFCpR9Q60H3/J2Xc0DOs5hxf7CXIIlIW
 m0d/3Z1sVfRR5mzkLe7GbPD9RFPPbG8/qjAgT+E4YOg==
X-Received: by 2002:a05:6214:b6c:b0:880:5d38:5411 with SMTP id
 6a1803df08f44-881834dfe09mr19201146d6.57.1762471591441; 
 Thu, 06 Nov 2025 15:26:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+ZOm7tarylyJioRDN+UtrP4l5Py54SY0NPKQjKouDoS43pKzvH1MTEWiaIrH2Yah85AxhDw==
X-Received: by 2002:a05:6214:b6c:b0:880:5d38:5411 with SMTP id
 6a1803df08f44-881834dfe09mr19200796d6.57.1762471591096; 
 Thu, 06 Nov 2025 15:26:31 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:26:30 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH RESEND v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Date: Thu, 06 Nov 2025 18:25:46 -0500
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHsuDWkC/x3MsQrCMBCA4VcJN3uQCxjU2a4OdRSHND3toaTl0
 gal9N0NLj98y79CZhXOcDIrKBfJMqYK2hmIQ0hPRumrwVm3J7Iep+GL8f1CHZeZUUNNcaicOfU
 YDj52jiwdfQd1MSk/5PPf36A40zbX5nKG+7b9AEy+0JR5AAAA
X-Change-ID: 20251106-phy-clk-route-rate-v2-resend-a86cb210196b
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6371; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jDqYCzSqbnGJibZ0TWHt2xeNKFTolxoBt5YB5hnyZ0M=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Rb4nLOympMWNK85V7P7kd+6ig8Z8iyrkpyO9LTVv
 L2wiNO+o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgImYr2P4nzJZcP7j4OSiJU++
 3zk4k8+2/Frr8mwdjUeuGTeL89leCzH8U557+Ny5Q6xsLO8TtE7MrRS0OtKyeXV28qwN2VKNB9I
 aWAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: woqiWP27MOVuNwOOwHTN55tMrQK-PpT3QYi9qUW0WqU_1762471591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

This is a resend of my previous v2 series since I haven't receieved any
feedback.

https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/

I'm hoping to get this merged for v6.19 so that I can remove the
round_rate() clk op from the clk core for v6.20. The clk maintainer
(Stephen) mentioned this work in his last pull to Linus:

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the phy subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v2 RESEND:
- Collected up 3 Reviewed-by tags

Changes since v1:
- Patch 8 (phy-rockchip-samsung-hdptx): fix returning error code
  (Cristian)

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c      | 13 ++++++----
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c        |  8 +++---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c        | 16 ++++++------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c        | 10 ++++----
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 10 +++++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    | 10 +++++---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c     | 30 ++++++++++++-----------
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 68 insertions(+), 54 deletions(-)
---
base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
change-id: 20251106-phy-clk-route-rate-v2-resend-a86cb210196b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

