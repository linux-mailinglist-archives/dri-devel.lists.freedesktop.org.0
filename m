Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENHiIuxEp2kNgAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B91F6CBF
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC26B10E8BC;
	Tue,  3 Mar 2026 20:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U03ibYoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5307610E8B9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 20:30:32 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-89a06bc2f1bso28460016d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 12:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772569831; x=1773174631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQOnOVlc3pYD0aAOF8E7RKpLdhabU91Eut/dNYt+XQA=;
 b=U03ibYohRAquXC98A6/MtvgxQ6B6lwvGJQr+g8W+wgI3YIFrNvJfNGRiHL8+OUe9Ja
 5NqgdXid+1U1gx0czVc+1e4Rd4X8bYETHJ6A9ex/HzizT0NUG5CJELR5NnL7RHGM7Fgu
 RT+FFf2m5OUYUcfRaNYrRS+hpAK1+HVX0v0VdhE4BdqYQU5eP0FTaIxJ56N5IKfSqAoO
 HbCoPuSHsmdJzgQgKVIt8ibcwskg8iQFFLwkwQ9X7/9Mx0xjYCQAJMkSCO7zytU2YFUV
 cD7p8QHnvMoIN+MaQFE2Dchyiz55QoIA8mz7INpTkmWFgn2/zh1ztGxUB8TdfMEYI2S6
 rBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772569831; x=1773174631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TQOnOVlc3pYD0aAOF8E7RKpLdhabU91Eut/dNYt+XQA=;
 b=ajLKn6tysnGtwNL7tXMU4FJXnqzm0ElWXAZrQ/0mpSltqGuROZe0sXkmnYaAc7do1+
 /171yKn2dX0B3a65goB9ViNeMqky5fTcjKvNyuc+ZcnyRqSubEgaaPkxC01stcnOmeW8
 lDqzSxPvfkdUfumQ6Y11n3nUK1EfXoN8+4A/gXLzNWOAyx6NkNFL1IKPbnFY8aOL5lol
 l6jz6G1kF9/xFcuNfvy5DQwVYMzRN9WXfVLQmesNOberntwlc6Lv6xhkPL6Dzuq6eiCD
 YCNnZZhyJ/u7MT1WpJiCZZ9K14YflpbgelaqZV1/9BHJvTLV05F75/eIgXdKEYaq8O8g
 U+Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj6wmE//0fSAvipxY33cbHPDFNSTaZFThD6AV3v5s63P/GdeTvxEADUqCfNkRc32K7n2D/+bHMVS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/BtxvnKBWHqqUIpqFrBiXGjRV01f7bNgDCr6cJdyaQ82Su6EE
 M0kjOHsz18Qf9FqP9GbS0oAwp703BxXdTeJcpVyVPUpA7nB/MjdKG8hl
X-Gm-Gg: ATEYQzxz7n8MxNICoB1IwzIZXG0sKsLo55B6KXk1gUC15ISdLzefFeUtMigCcE6z8u1
 7xrszgYXrd/6Bdwume3GvrqnBDiqqHG9GA+a0QYZtGHdUB5FoCn3tMJtZ69fs5OZjadoQMTaxfz
 mLmqqmUwVzZX3j0gsyIMQqhJ1bj/ph6LAm61UlMXLEcs4wwWOz0gOMQvY4GOo9LSEXRCLu79ZIl
 CYYRo2H4/3BlG3pph/f10eHYSBf1yUNlf/FiGrqYV8pt3BFdE3VIH9vvKtkFPKZMDfxpiJif4AZ
 eIAGJD0vivwsKTBzBXUsDtA7Bcyg4z6ZcWb3NtM8OQnN1KD7O+n1x4K2MfYWysV0fYq/vamyRxn
 yaNCviFbY17OFvC2OWuW/pRIDwgYz+E4XEvERZ152ZSz98mLQQnv/6rv1TVJ+0ydQGE3srgCJRk
 YGAr4XuXUSvvNgD64ueq6Qb3tRc7Ggm04frYMpKXZ8YWV7OnkXu24M1zxLuIIfGN1kubwpvS227
 mbKeTQ5R/g=
X-Received: by 2002:a05:6214:17c5:b0:89a:9b1:a21a with SMTP id
 6a1803df08f44-89a09b1a2edmr39390026d6.25.1772569831011; 
 Tue, 03 Mar 2026 12:30:31 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cbbf564c27sm1465032085a.0.2026.03.03.12.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 12:30:30 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 3/8] dt-bindings: display: bridge: lvds-codec: add doestek,
 dtc34lm85am
Date: Tue,  3 Mar 2026 15:30:12 -0500
Message-ID: <20260303203017.511-4-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303203017.511-1-bavishimithil@gmail.com>
References: <20260303203017.511-1-bavishimithil@gmail.com>
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
X-Rspamd-Queue-Id: DB6B91F6CBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.218];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:email]
X-Rspamd-Action: no action

Add compatible strings for the Doestek DTC34LM85AM Flat Panel Display
Transmitter

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 4f52e35d0..7586d681b 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
               - onnn,fin3385  # OnSemi FIN3385
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
-- 
2.43.0

