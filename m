Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK52GMh/nGmLIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:26:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5E179BB9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B69D10E3E6;
	Mon, 23 Feb 2026 16:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OX6b9f1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F83810E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:26:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4837634de51so20259095e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771864001; x=1772468801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qf/+YOrO2BrvqafNFjJO+GVFFHfE339w5tpogT6PGGo=;
 b=OX6b9f1AJRizirDhgkzPsQ0jInPhrixeNEr4Q6DgSHg0m8aT8YuV6+e+1hZXGE1RRX
 U+oIgsFJHv3nGN0aMI+pIKP0A1bVO/RiSTRV30AeCXkhSYjrmSyeFKnhB19lb5uiuQX7
 L6ikOTeD3D4CL8YQPyH8awJDzFPbMMC3VLWqMBgSqBwetsfp4EjKdmj0LFiycWsh+PJ4
 2+9j0EwSDh5aFlDQHv9LffCbCLEN8mkQEk186zgz2Yc6f7jNLj950KM50eUtoTCBPpqt
 l5XXev9K/GVY9484Ht/MmEofGJwa5uM5wO9+Y88hlVJjg9+U/iK7T1yTUKd7bsxuaFUQ
 cVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771864001; x=1772468801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qf/+YOrO2BrvqafNFjJO+GVFFHfE339w5tpogT6PGGo=;
 b=mdK71cJWjKADDYvM7SH0fooqNE0YlotZQqSoPHhM46jB3ItYyXX6BtVFEOTpFTH5+/
 wfqTpXfwPsY+DmtDg8N+SqToQfThT1BBt9pOBweVHlLJa5XDrKCtxa+dzrxPxmcfrryy
 6cBh5p5+SifkKUBKL9GTIRH4MZeI1+DzqveMjR7/+N9bJ+H9xaEVLoaIdzYe9/B/9QH9
 xYzSNIqtyqX0739sYE0lPwpq8+cxohIRQ9dzTzQUfFiJWLmFY+c8GzThjK1Ffvr9gLI6
 V5S969KR8gPskaJ4G0CNmkBKb6BmH74bJmvQCBf/NC+vO5V298+zKtF5Rts+WXr7gYTF
 BKaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1teaVhmVXZhNb9UMQoMB2hAp6i2HCNbsAFmxz76ezWRT2WFPPt3axKeJcVRL/2PU9/ONRbOBtcPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHK622S7g5XJNzv41UgiGKj9UF89iyxAf4L1ry7KrFTmitaPBZ
 wEf/Ha41LIvF/ffaU7fx8POCrq84FYiTKQMegH3ZjYXy48Y+j2vJbUbE
X-Gm-Gg: AZuq6aLNbVpaoJN4ONbKqedF5Yk9zs12DqrDLz+SJ36epYUR/q/5YZr9CCSpV/k7jMf
 R3sFdrUg79fJuNtD1RWsyYcULbDTdhNeYNxprCopsHZevUZMeuU0YC4OhuYxhct6HIjVj1r+e0d
 2flgaCz4e0WfPSZ3nuQOue2JG10VHVhZSY5Ryno1VsBM2fWFcnFwClnh7qb0sNpNeOgmxJ6jRnl
 0pu1k/XuFGEYNzHyX2MyW3PhaR7RKvTSZd6xDjnk4pganh9jaR1DWxvYznBDH5WdzUI1x93FCe8
 +DA/Us8ujifqT3HRusFtppGf0CC243S3PB9m8Sj1GLLENtvsT6nZDANCbfE1JV250SKGHL1QvTA
 kYcFGVwSGl3z9vZd0GOiGOpoaIJjUgPP+T6KGw1Xt+SdAptVF0js2fUEoITvf1KuP/6aHrpp+XX
 51YbJRnmjNp3vmftYNWLI=
X-Received: by 2002:a05:600c:154b:b0:483:7ae2:1737 with SMTP id
 5b1f17b1804b1-483a962e486mr129723295e9.17.1771864001041; 
 Mon, 23 Feb 2026 08:26:41 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 08:26:40 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
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
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 3/6] dt-bindings: phy: mediatek,
 dsi-phy: Add support for mt8167
Date: Mon, 23 Feb 2026 16:22:47 +0000
Message-ID: <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
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
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:angelogioacchino.delregno@collabora.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,oss.qualcomm.com,kernel.org,pengutronix.de,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CDB5E179BB9
X-Rspamd-Action: no action

Add support for the MediaTek mt8167 SoC: the DSI PHY found
in this chip is fully compatible with the one found in the mt2701 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index acdbce937b0a..c6d0bbdbe0e2 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt7623-mipi-tx
+              - mediatek,mt8167-mipi-tx
           - const: mediatek,mt2701-mipi-tx
       - items:
           - enum:
-- 
2.43.0

