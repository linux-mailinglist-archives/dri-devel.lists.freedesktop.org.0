Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCwQKtesb2nxEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B7477DB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958110E5DF;
	Tue, 20 Jan 2026 12:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YxuaNIGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6340810E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:50:51 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a75a4a140eso4228275ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 04:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768913451; x=1769518251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QnR4PJhsaUjZWZn+C6vALPZ6Lj3dxWE4L9BjOpkr0AY=;
 b=YxuaNIGrNDv2BsoAWaEfoKSzMOEGmVrUrWzLU0AH2Ralp0AS//+soeywY6syFw4PN4
 SFEYEZDVQWERRqkv9XwXLDW1W++dn/6jr+V0jT0U6ORiNHlwaG7MauAbGqZxTiTYR7sh
 SX1oCvNAdadI39Za3RkF+DMiNOcos71NnLBZSOeEfxaaoNojK1XKJY0p+Hw+FyrRQsu6
 h7UuaNWrEiWceIyajSvTXpCdVxBh4Alf0doxL8EaQAPN6rJBJDcESWGsdZwnY6m4SHeW
 GSwL3necQ5zaKO5tTIg+SECHXZE7ipT95nCmQCYWxyRkBStYodglu8+NLDveDEgjWmP7
 WWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768913451; x=1769518251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QnR4PJhsaUjZWZn+C6vALPZ6Lj3dxWE4L9BjOpkr0AY=;
 b=kZo1OKFh7Tlv3egiKfucX8N0mxRwIauONy+XJbut6bljMDRSVdb/1c0TFQ9wZc2oyH
 lFkSSE3kuoZGDXLcA9XpGV/zRp997pMxCgmtS4yMrzKp22o/yTbcj8j+7vQsF+NfPibb
 0ZEYzrJnwI/9TyZNWjjlX9p3DKwLgSlgArroUx8KUT6bGgm10Ge4xudY7U3C1AE4ndgU
 CLWoBnhxyukYbrkXYV1gM5IR4Mqj2GIekuV6TTP0+swez5KauiLyD/g4LohPcYVD0AgE
 4hBlTuPVBhgUlIcTEa5aIhu1VYLbKVp6t2OriyYDKbyYsPfSL0SKpnADq5hguUo7PT5a
 ShFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKgBCqRHSBuHgXvQUl/LjQirP67mCFhA8vVtfLM9u/8rFXQOLX6VZOcXPyq9Tx1JvOItpUYBU/X0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc3gecOmkRfn964mZVO99pOT07yqSzM0WDWLC8Fzu4VBkHKjXq
 TZ+xAiqF+eq2xdGJpGWRVlOhpVCwNZGE6EDinGZxI5Ru0CyeaexbjQXO
X-Gm-Gg: AZuq6aKP/z38jUt4gMyp/5tCNbYMa+XoK93JUWwcHGBjRFU9lufwE6hz87aaS0uSPOq
 ZzfEsKyAXLetzNvE41jttt61VAWNROYm0JV92DbVbFHlaGgC56MrJj+bFy5EpJI807eF3/J1gWj
 n/RNLuIj1KaXpLO3O7hy0mL8rpack3ysOvZ/4YI4HjZpmoQ416Hr+yNjR+gY10RBwlDO/LIxw4D
 ikqeQFSU3H8bkUXn4JL+RNLs6NzKDfBlq/FotoPl1sUrjzWJS4ll/RAgEctBv8k5FbB133zygWf
 QJDgFVRayEWCNy7NeXD272yZNVlf1WAK34qJDZuHJzXAfQl3JtE/LTQQctr3AlW3yjWcyhA5nby
 pJJ5SjIPxvdj4AZDiUNbFylmr12R4Uq1f/y7W9pnNGl/aY3xXWp3352HrLTSKrranzo/cYDpSzJ
 2d9pN5n71/19+m4rVwdAwEdRNAV/1UAoslJGiN
X-Received: by 2002:a17:902:e842:b0:2a0:ccef:a5d3 with SMTP id
 d9443c01a7336-2a768b7a68amr16787195ad.3.1768913450709; 
 Tue, 20 Jan 2026 04:50:50 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193dd582sm124973815ad.52.2026.01.20.04.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 04:50:50 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow multiple
 GPIOs
Date: Tue, 20 Jan 2026 18:20:35 +0530
Message-Id: <20260120125036.2203995-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120125036.2203995-1-tessolveupstream@gmail.com>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tessolveupstream@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 5A2B7477DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gpio-backlight binding to support configurations that require
more than one GPIO for enabling/disabling the backlight.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 .../leds/backlight/gpio-backlight.yaml        | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 584030b6b0b9..4e4a856cbcd7 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -16,8 +16,18 @@ properties:
     const: gpio-backlight
 
   gpios:
-    description: The gpio that is used for enabling/disabling the backlight.
-    maxItems: 1
+    description: |
+      The gpio that is used for enabling/disabling the backlight.
+      Multiple GPIOs can be specified for panels that require several
+      enable signals. All GPIOs are controlled together.
+    type: array
+    minItems: 1
+    items:
+      type: array
+      minItems: 3
+      maxItems: 3
+      items:
+        type: integer
 
   default-on:
     description: enable the backlight at boot.
@@ -38,4 +48,14 @@ examples:
         default-on;
     };
 
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+      compatible = "gpio-backlight";
+      gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>,
+              <&gpio3 5 GPIO_ACTIVE_HIGH>,
+              <&gpio3 6 GPIO_ACTIVE_HIGH>;
+      default-on;
+    };
+
 ...
-- 
2.34.1

