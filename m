Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEGjN0s4qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9D200AFA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB210EA18;
	Wed,  4 Mar 2026 13:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Of7Vevym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D670110E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:48:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439a89b6fd0so3839168f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772632128; x=1773236928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7FCkxbz0uuB2WpYGMfhNmyuLtfIktURdr7cmvLKcyY=;
 b=Of7VevymoJQ6XsGpMp4nNEeoBiayguHuVQXezX++HdSTCIWKcVkw3V0Ow8ad/vfNdV
 MDGfxVP2sCMipyU8RrpH1WchuxeMvMD+vlK7YcCtrSCbycXJHWwWrgSX6JCwPm7144FK
 v0ZDxqTUDyU5yR7KxAFHw3Is1HIW9eVBXhiuAbTC2e4b17A4LQH57Jmujg7Nodya/xKn
 9pxeZpMkcShbx89uOIP5nvauuS6iJjwh9HwP4j9ziBhGNDGlwq2BpRUhz6oiCKWQfcWQ
 cbuHtbdUGVG9Xyb4HUacPty5iaJ5TmIiXvqFzNI6/MLP+YHoXINDo7iLtnKKZJjRChNh
 nzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772632128; x=1773236928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h7FCkxbz0uuB2WpYGMfhNmyuLtfIktURdr7cmvLKcyY=;
 b=ch1sW35bqm+R3/6N2iGu2CwmeTpFy47fFE80gpwmABKRGt5y7+dSer14dChlhf63hP
 XkmsiZLD+pWIboJ0EmS8EaoXJzFq6o5ahwcC7m5ZlRsBN6J/cT3nVcJNmwwpytmqxkgd
 mL/1A5W8p5qyGo/d9OmrvpEA+BhDz95qzJh3CQDA1CnpY2DIUdy08TD2CPxNSGAE5VuN
 K73w0MjVQn5fKkPSEodBgHtMh8+zcnOJsb8QQ+7Lo/qJMeRoDzAM1pEj8Ac7QHbIPnA1
 1FarTDpTTbRu9lGdKXxXhVtp7TUdJUU97mwp3AnL5WOZZxVstz5pfQnFe/Lnl8pZGCcl
 +Npg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdHF2SVNcdEaH7XxFy15GJP6ISJnwwxcIyVZcYYXzuneyX84Sur/+HH85S98CAec6pDKpbprO4qXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxswapTXcw/kE0E1e9fPVrK+aofF2ZGGvJ6fW6kvHYKTbuBFzvQ
 +d6zwF2oU/sMPZpGSJEY86tf0F06Tl2MNeJkNMqCv1E8Vg+I+r8H/l1X
X-Gm-Gg: ATEYQzyOJwwlu9UV3nJctbeGCeiPwX8xw+ZohHJmZ7tNt/VJ0s8xXSch0/qRNEfu7un
 nxRC8zD3Y/5LlzmLI0UENNTi0FlsPcRajntGbyEBwtxBOL85xERxNA7J+07FPUddVSn3uBXeVmm
 1zwTJMEVJ6mqRLMNowl/gs/UwJyaDKTqz+mHfunfog3X96iSH8j5ddJR1JBsPa0J/29Ve4eBfs/
 a7UFcv3JthySw9wdEWswXKTxPuIWpApoUpINF2lKm+0T0QLLA8A51qd2OqTJu77VOEG3O2XXyRp
 aUbNj9CtNc67WihPgbr5erMw25h6fwzeHPkjBUNi7SV477Q0KIcprCnOdmA2YYyELDJyTRHG7DA
 Remh6inF8GWWK3iEhKUUmzpZ2J+ERV8haM7iMQ8FUdtqdT+otovcgmVUpJgNsoe93F6W5xB82wI
 4xEQWfURRP0e+cb6sYuclEGSj1w1z0OKgW+qauNVZHOw==
X-Received: by 2002:a05:6000:430e:b0:439:be82:1fd9 with SMTP id
 ffacd0b85a97d-439c7f99994mr3850514f8f.12.1772632128092; 
 Wed, 04 Mar 2026 05:48:48 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 05:48:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/4] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L
 SoC
Date: Wed,  4 Mar 2026 13:48:36 +0000
Message-ID: <20260304134845.267030-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: 92A9D200AFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a compatible string for the Renesas RZ/G3L SoC variants that include a
Mali-G31 GPU. These variants share the same restrictions on interrupts,
clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
validation accordingly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index db49b8ff8c74..9db9f84ad964 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -26,6 +26,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a08g046-mali
               - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
@@ -150,6 +151,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a08g046-mali
               - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
-- 
2.43.0

