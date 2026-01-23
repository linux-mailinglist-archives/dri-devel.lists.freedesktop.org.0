Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eErkCI8kc2nCsgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 08:34:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD5671C4F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 08:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1C610EA52;
	Fri, 23 Jan 2026 07:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hW7zSwFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D942A10E279
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 07:34:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso21894455e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 23:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769153671; x=1769758471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDEJVJtmtwtgoNe2JvesAZgbd1f1a9AaL7tdOeiXPUM=;
 b=hW7zSwFOwgMk6nIoIsoHHiqZRBdrPgTY0kfCkdmdlIvtiy0UVzzp7JhVBoDHPoabvf
 vpQiWerc4VKhSA5yhix528OnVSVVG8mGxhmJcMv7x0r1ej/DI8ShXjnt95jahtvgEyaO
 AB+3VBkb0sjB/rLQRx2ZeyV63LRwDbwbXXG3Vc+FX9WmNy0Ps4IhR9HXGL3twCs83DhN
 iniaWA/r2n8xC4pAQn6zaA/Xb1iY25hl4JY0VHeTTXiuk+/G1O+E86WORD2RZ7h/e6Yb
 8L44LaLQUu58LcDlGUIK3L/lfcu5S/RqfffG7lRLfOahzI+RtJ9woLIUi7h+JMiP18yd
 1YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769153671; x=1769758471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vDEJVJtmtwtgoNe2JvesAZgbd1f1a9AaL7tdOeiXPUM=;
 b=ZQ2zb7pW+Tz2dgpQupGnSAeSFfxiHlCRQUcPBSLtjz9L410WdRK9NXwz3sksEoRi1R
 NCkIgpfJp9volxntnsR316pUmmOoa5ad4nW+r8r/KtKSrCJERrgqH5Wij/sQvg2EV3Ws
 x+Bcg+/ofqLSpgj+Gc050zlZr19g5irNiTZR91W7z8VvDtTQJxIOX7nh9GMUAnyETIkb
 UiIpmvKniXZtzFYuIjo2aBgP8gonrIhWLFeYOdDevKXOo9Z+ByR4VlhebOaGD8neHvFX
 D1D67Aetqjf7c5vUhxZJzt5/UiH6dm/3CtLJECOXRmWwRt9Sgg0lQmidYszXFUAn+Y5O
 +26A==
X-Gm-Message-State: AOJu0YyTHntOIS4y3J7HdeNPYlYWJr+nVFelm9mO0fqmUtbdFFF1n3F5
 /qLlqhm0uVwXLYHl9N+YhEqABCAGw4f3hV51OYJP3qQg2/TUpTUdGlaj
X-Gm-Gg: AZuq6aJCnnj14oPimTQMjjfdx1QMdXQvz9p17RxttWNx3Fi5/ERM4fbbfyCg6x0Nenu
 ntIG0nHw0UjK8uDoAvWMAkllzTXzCFCXr48GP90ncBbkaQg57wAjsHrjtAkxIVFV5uCTLvKukta
 6Hwi7LriIxjbuEPCgRETdO9lDZ3y7mhKSXeHDvtpLHhgaUhdNSJ/eE/w3pyhSo6BAPgar7C1tEc
 xTDxUB3zaugoMYKPn0IYW3gq/+W+VZOpGwmhTiFy6+QAr0wpmKkmgO+YsrwT2rvid5T0YHEC9H2
 gW7JN2EJN3XnJlwGm2edid3ZdWunEI7RsVichGLkhh5eIzmdtadvNNTjd5l4ftzpzbyRwVAWpBy
 zWwZLedwb5F4mCWQ3EsmgUu27zFuNOTS6RfQmxVugP53Evn1OiUZYPocF0Wc3Rd/y5gFEkcaIk5
 fi
X-Received: by 2002:a05:600c:609b:b0:47d:403e:4eaf with SMTP id
 5b1f17b1804b1-4804c9596bcmr36514675e9.10.1769153671345; 
 Thu, 22 Jan 2026 23:34:31 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d627871sm15890265e9.6.2026.01.22.23.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 23:34:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] dt-bindings: display: bridge: ssd2825: inherit
 dsi-controller properties
Date: Fri, 23 Jan 2026 09:34:10 +0200
Message-ID: <20260123073411.7736-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123073411.7736-1-clamor95@gmail.com>
References: <20260123073411.7736-1-clamor95@gmail.com>
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ADD5671C4F
X-Rspamd-Action: no action

SSD2825 being RGB-DSI bridge should inherit dsi-controller properties same
way other DSI controllers and DSI bridges do.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/bridge/solomon,ssd2825.yaml    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
index e2d293d623b8..760645493031 100644
--- a/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Svyatoslav Ryhel <clamor95@gmail.com>
 
 allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
@@ -86,7 +87,7 @@ required:
   - compatible
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.51.0

