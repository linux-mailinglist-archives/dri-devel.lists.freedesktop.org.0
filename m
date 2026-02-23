Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFHgON/qm2km9gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:51:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F0171ED2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9572610E225;
	Mon, 23 Feb 2026 05:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S0LHSHxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD7A10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 05:51:23 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c710439535so277924485a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 21:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771825882; x=1772430682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=S0LHSHxDPripHb5PY3VKNgyzJ2SWbdyOTrOetA3+KDP2QLq4PDCcSz7aMVcxfir25R
 PWKc7OGerp5m6qk0XITRp0mKh2eUrq9QfZu/mPi5X18M/xQVUWZVnx4PHvkxRuKHkXgC
 1PBcNckEFjkbuKMqzOCHDuWOaDZTdpNvXYfBDYthKPBl8FbdZBnitTYe5CqMX+GjhqBT
 Uf7dpVska3CGASLveQW2z9GVHaGvfKGRSiDjUAVI27yRt9XPpVqTnl89CHGEwkUueDMx
 XNU6weaBtps67kG1258S6KylFYf+RVSxrFumJ0pSz/BoaugsppHrsn92EoSBh1ke5mZt
 CHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771825882; x=1772430682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=uo4H7bMwWs7SnqCWfPgwHS5WUdxZ/oV+uer8PbkGJ5m/yEnDNA1px3Q7wuLZ4hqi9V
 aDascclwu/ZC9qy0AjuNrP4NachmcqngAmDlfZoZZNJr+oFVGBJTF/ER0TG+FcDxX57z
 tuidT/Ce+q5EI4sln7A9bU5un+03pAORuZ2JUMjQr6zvlB3u5oQrve5oaL9TUbbZeWnr
 aUxra0RFptybGje3BVvSajXw2S2o6AeoUqCdISlAKRSIfD/NgC3KFVBn0fRP7iykKZmL
 ybq1W78IV/DWvKQ9S17wOZCC/ziZLoJwDu5zNKUal7KFeYKGLslP/n3BQ62H20s48QwX
 R3TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSBAAbLBBe1t1uDF2+0LDTedzZ4FwX4h8q9NFfsCRUmKvuLC/JcPmCVe6OEicYCGxUJWXHhNw4uzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0P+tmqHcIp+ffNRBr72HSbH6k6wjYP4ezBcsdRxsViiQui7cO
 6bf9k+79v+MAQPFf5893TmRj+g3gqbvZman5Rr5aeHN0EXz/aHXqmf3a
X-Gm-Gg: AZuq6aIA/tDsuQuo8A0Gt5S0EaGwJ4zTHJAKD/uRKNuYDlzaVfH48SjputAp8j4D7yn
 MoaE/7oLmy9PumDBv5s6CD8FIz2xYrcAcTYAx4vFmG49kui+uC0hZGKg6KvcJUGDtbNa/BBsH7A
 kRKATSODxugyjQ4xz0yaXnani9BMjaTuaCb6tlxnkvvuGGXXSp3sMM5KfyOEr9+Cq2haiZYUQL1
 p+Jm/l65kyHAFVhONyddfnRmlHLOU5vQBfq1KQcVlQ38i/oGfvZzUxe2RcjBaChhH5+wpwoJsIA
 a/w20t4sJwUTfM7mQwGmKVDhg5XtzgdgWPAD7UiCnLDWJd4sVPb3rlUQx7miB0MhqX4ofPAZbZ3
 BBfHkQlR1LDhsvAa4LMKZTqV0AUntXyCfCclubtHoT/tIGLDN6k3KbXyfy+kLWyF245WJW2Dgm8
 pPNCJB/JWZytMSehdQQBpEJ/kKcq2N8nw2S/Jx6hDi+VyPbypLWvsmHd379FSK178x84OV8vAf9
 9mVHrJFvqat5pEnhLpTBw==
X-Received: by 2002:a05:620a:4610:b0:8c5:38c3:7cca with SMTP id
 af79cd13be357-8cb8ca03109mr1014138385a.31.1771825881899; 
 Sun, 22 Feb 2026 21:51:21 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62f453sm59459096d6.36.2026.02.22.21.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 21:51:21 -0800 (PST)
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
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 2/8] dt-bindings: vendor-prefixes: Add Doestek
Date: Mon, 23 Feb 2026 00:51:07 -0500
Message-ID: <20260223055113.1288-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223055113.1288-1-bavishimithil@gmail.com>
References: <20260223055113.1288-1-bavishimithil@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,doestek.co.kr:url]
X-Rspamd-Queue-Id: 3F0F0171ED2
X-Rspamd-Action: no action

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2ae..70a195fc6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -437,6 +437,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,.*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0

