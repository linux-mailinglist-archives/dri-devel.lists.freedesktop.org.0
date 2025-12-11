Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BBCB75B5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A7E10E8B1;
	Thu, 11 Dec 2025 23:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A5OL6V7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B6D10E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=;
 b=A5OL6V7vr/Gn/Kx8sIwBSz1T4nXxTeSlN3VSVTcrVcwVtK9/9p7t03j6v8JwuFnjNsI2QN
 R7jHqyVG9ZaipW8RFKT1MscjvbWg56NLjOh+s1zPXeSPl9P4kKDPKTFf2FVcfiRmKGLsIY
 QwxwWbcR8nXqVJRWndeEhqEYqb7aoTY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-JVujNhH5MwuUPdy8KAlGzQ-1; Thu, 11 Dec 2025 18:17:45 -0500
X-MC-Unique: JVujNhH5MwuUPdy8KAlGzQ-1
X-Mimecast-MFC-AGG-ID: JVujNhH5MwuUPdy8KAlGzQ_1765495065
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8bb3388703dso49218185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495065; x=1766099865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=;
 b=PrAfFjkZgPxumHkrpA7X2wKP9gWmbC6WRit0w/D6K79WGKQA61+L+fv0J1RQAp3Pdb
 aKnRsv1pJ3KnVc/YBDTdN+eNSZmQTUmJyyatSk8PP3V+uR7DCgzoOJ9x3aUh/3prSu7t
 sUuEVyUQ5hYG2RwwcJTHPOus86Z/weYOhAOzKcmdCKBbxfvADpbjqsqPXPws6RflJu49
 V+Xg5pAcUv5EQQQ/zZxnPYIK5vVQye5UZu1D6laXPXnWH/ABoAdko68j0/xYxzl8It+C
 KRUk/788SH9tLV/GuYiqVIVURgfxylwaHNTP6j8yfopGZN0LbyodbR86wf6iZkpkyYlr
 z6hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8wyFTh7/w6pIbS6q4PQLQ2jqZWwPK2yX/AGZr31FyASZkITUG2ZRckxrF3fbZPc5wcTS4iVf+hUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEmThql+5D0pCjUAMzOkVILC2J93sw0fHDdmDH4ZT6t6WlFZom
 bFsxXh8VFNXxZ/gbj6T5iB+FZMPIgwnXeKU+N6hS1EzrbV9vLO0RmvXWZOX9E0LdOkz2WdMNp+p
 bFytNRd0yo8+Eo8qaxGu5qwmsg/YvSsbHVIFSwla3lBOrWyxvcGcyOJOYhuMouNXppXSI7g==
X-Gm-Gg: AY/fxX7a9+rO2Vy6YR8q08UgNUvXGkwMKYF8ueay3k1icdqlfzfEpVJLaTp74IYqCjM
 6NC59OV/5wkUXNryP4SW5bXeiNJwLy0X2Z1Y9T+yO/d+uCoE+fuEUiYZqEYOe62RFtESHbRW1Cq
 qqVwC/vreAFDzPprWjwMSeSzqbB08Dv5tahxxqQ1tiByG+8vi9K3p3y8PvTFDog7e/3Txdrul7C
 loxMqnNZK/5JZ42ptMD/BcInPCONKxFfAm2f2Ask4SQd7lxwqzNGcLSru/OC11Hy6TLo9eSjLka
 OjPuuBEUvjKM1sWw+m5cP/0yz/cjps4bz6kaUW+iNm7bSL5GzxvylnQwYqsf4DTUazKFhTi+LPR
 STGM+iBhNxsrAwrjRUJuOu3svKq9DKnEI3uqH7JH7SCuK/f7jKuhFVw==
X-Received: by 2002:a05:620a:4416:b0:89e:c659:3f99 with SMTP id
 af79cd13be357-8bb398d703bmr36053285a.6.1765495065294; 
 Thu, 11 Dec 2025 15:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLYKRP7lHhgawU3OEaYHk6OghheRQMM/cwXxtpO8QhTtXeryEcvWYjXWc+lMjIJt9Bnf4lfQ==
X-Received: by 2002:a05:620a:4416:b0:89e:c659:3f99 with SMTP id
 af79cd13be357-8bb398d703bmr36048785a.6.1765495064870; 
 Thu, 11 Dec 2025 15:17:44 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:17:44 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:27 +0900
Subject: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=NfOJan9Myaz8PWi/tdBEvmDwiM4IlBdU+UqmIR/UHpw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy71PRfV83r1eE1XcMbr4193OXztck+aIzTF0fIwx
 8OmyOXFHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkcBnDT8bgg94/bv76LP98
 asNWnk3r2i7mlX2fL39CbHOvzuf29BCGP/wVmU95Y0IeCWi+VV+bOlm/YtKFpXbSLZp8AR0a0lV
 hPAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4OmMpKbD-WVJlR277mlcvpUvOfx4pNAWp_i11a8ZMco_1765495065
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index a8b440c6c46bb0c754845655f9c2c0ba6b435b8d..cbc98d4dec74560e6403fb899ebe2bb916440f45 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.52.0

