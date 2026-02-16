Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIVNNt5Ek2kP3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:25:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD91461B3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45AC10E3B5;
	Mon, 16 Feb 2026 16:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EkjfIpQ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C44110E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:24:58 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43638a33157so3283647f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771259097; x=1771863897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=srYlY+UBKbck4YZkSnxZ2WyELTpV/5G0eCzsk4tYfvE=;
 b=EkjfIpQ9/NyMxZtmUgAHtl0enemHg6gFqGE4zXUOzhWqL9JnQyaCaF6zCbbY0f+tyL
 DZRjBS5ZX7Qf4DH/fzNWeo9E77INO3A+X45q++1zD6O9CGoD/WFkLxJ61/muy7n4VSQQ
 BDIsXIxZvkduGhRmjoDq6PgX24YQod9XZQ8ioTWuEVgJdFrCvm/qRGdVazPFuJMI2A9E
 bBOON6LDCzoo+1iWOcDMuDpeCSjmdeuVfuZUo0csO/4yHZPfgpHTcqezTiq7BwtkZllP
 41TOumbwrZ6IAj2F4i/QIu+bvWutrAid4bj5sM7zb0AmC0yCUro3ekXsZErCXKBMNUnE
 xaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771259097; x=1771863897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=srYlY+UBKbck4YZkSnxZ2WyELTpV/5G0eCzsk4tYfvE=;
 b=j5mWhhnIWqtE6I0sa8TpVWuUlhZ9vPtkUYeCvq0rug3QiUI5XPYMGjQFvRDCFXEHMV
 EZQ3ZTNFWjTA1qMoAeaLUsqq1Jlh3JwKO/uWoEHe0DnREnzwsdG71Gvwkkqhd06t43S0
 VsCztu1yLi094kz58tfy71WFxW6nIWZGWRxLQ7ELgc/Ykw94hZfnl8BI0n9GJNH2G55E
 Y6G8vfDgDfpZWVBew6/s04P2DMftnwdYKd6HTBbiHxd2CPNpyaEteNkPgIqBe19NWEiJ
 YRMwJ7kuC78S9dp+7C+An1dHBbX+9BpRIbo2BGITY9tmKb0ruAGKREiRqmQklX/hIhMC
 HmXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5lHNj6dT/nY9zXvMlvzkXVYsVFlJhGXRRSyzONU7LzZD4B9A0Im9zCGV7oqUFyyRYloBnS9Q1Euo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFv/ZTCILZXYlCTL9f2ylJHtDtIv87REsXUnl2DkAiLrSquzut
 UY/ScmanGQa6SjPCSDPJhwGvA6p4sq5z9RKPKJXYeEc4kr2cw6293ydj
X-Gm-Gg: AZuq6aKHRWvvdn/Yw+44BjsLDUet8WO+//9hFTBb8Zlz30oBG5sQMfcGCELgkOfH/Us
 3/pfmdWAB/DnV9ka4ILEIQAmK/JX/AknfelvSFqIVWXxdnBsGVS/mfDeImSSb/l3+k7vEz22Vrd
 E9lUK6gtFSZzdUqzU+Y5/izw73x2ZRyvuTrWr/CnPVEa+HDLXMR7dVrqeX8cr6mYnnmzGQy/Hdb
 VgXE+3G1O0tehYBq2ly+YRL6HUFXUFxGYes2P99wkToABXKYlUv9z5u8NVbB6hCgVrxnIWVVOw0
 aKFvVk7pd5ljtn0JKhfZMXCX4BTqMsmvvDoi9tqrkrzqTyNbwqmLUTSvJQK7FqlAVjlctGqmNAJ
 GDvY4CUZbjOhDv6FTgLFHzC7gnfPm4QFa6YuO0wBJm1y+bmjPgs/7VdMAd+ym6uxcm5Gej/XPOi
 QRRDuVScSbsQwmWD5wndRPMV0hId7o7A==
X-Received: by 2002:a05:6000:4014:b0:436:3563:499c with SMTP id
 ffacd0b85a97d-437978c75d4mr14802043f8f.8.1771259096696; 
 Mon, 16 Feb 2026 08:24:56 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:24:56 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct compatibility
 for mt8167-dsi
Date: Mon, 16 Feb 2026 16:22:14 +0000
Message-ID: <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,collabora.com,baylibre.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8EFD91461B3
X-Rspamd-Action: no action

Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
describe it as compatible with mt2701 instead. It is safe to do so because:

- Bootloader doesn't rely on this single compatible; and
- There was never any upstreamed devicetree using this single compatible; and
- The MT8167 DSI Controller is fully compatible with the one found in MT2701.

Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 27ffbccc2a08..bcbde16648c0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -25,11 +25,14 @@ properties:
       - enum:
           - mediatek,mt2701-dsi
           - mediatek,mt7623-dsi
-          - mediatek,mt8167-dsi
           - mediatek,mt8173-dsi
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
           - mediatek,mt8188-dsi
+      - items:
+          - enum:
+              - mediatek,mt8167-dsi
+          - const: mediatek,mt2701-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
-- 
2.43.0

