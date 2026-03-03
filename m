Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GLYEvmZpmnfRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CA1EAB35
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2B910E656;
	Tue,  3 Mar 2026 08:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NNcpEr1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6B510E656
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:21:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-389f173b91fso92085421fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772526068; x=1773130868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VSTYwE59cdM0X+83Cupw2VCvDy7g8S/i6/wXCW+hROU=;
 b=NNcpEr1b4LFvYVWO/TlkT2HsFKKQ5PDajYsEmxrnjIaXOu+IXZEctvpC3RhGbaEwrR
 wMjRhr40trTMezkWMlUFSFQlaL+ysQ4TY/ESdUyRmUSUMdj7othoNJ/240yMSm4cJGbB
 Y+JoCsW3RDJeO6YifM6h8tYAhB+MiuXz1Yea6Ob4gM/1+yn2iWJyjjCbw0d01CpWtCzH
 OXhqR4bLHM9as5sqqoAdFqlDxsxHfplKAi7BGGn7RCNEg7FpX5RK7Yu3rjeAr++N3o+l
 qDi/keX8vFeuIRpUNKQYlkPE5KRs5cwZWeS73GyCDTzZSvZjlkb4v+ktkihGMPLpdndT
 TOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772526068; x=1773130868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VSTYwE59cdM0X+83Cupw2VCvDy7g8S/i6/wXCW+hROU=;
 b=st+YgDQLx62xJXBN2Z8OMe55Z/ADbs3S91AptGUY2uJErEoC1ah7IDFgqmqKZebhUM
 8xSMfD2h+h2x+7WutWZJvZnMS2cHAdT6MdrueSBvboR/n4RCI+Tea11gvTpLKB5XDF1g
 f2QKVRkSiHJxMUUe4IX/t0V8Rnzs+f2+XlCGvoGRPkygQkoxxaFDaNqNh907edqVLBpF
 9kcLqkn2sEXv2/61ZWgLdsma5U8qCDFse8sfrZMjfTo73rBW4a/snBZN5kKQedI4Q2x3
 6ARHvjFYTuoxqKLKkUsgJO0YlHe1E0d9klhciWjEBnH0q9YM0G5ajxe38n18FxPQ87ZF
 rbnQ==
X-Gm-Message-State: AOJu0Yzw5DeSYXvWUeP6NuVM/VEWt06fBzJAGijlzqnA550YSFWZ5Kbo
 k8F4uN66DtAeigb+coMvwWX3nCMFV73zJOAzBNE9+EPTC6R5hooxAMXg
X-Gm-Gg: ATEYQzxP1NqY2f7yym8H8ge25CQLwcq/OedEAzwCLXp+3rYkJpxVorNVxrREWE5VFm4
 I5BSvL3jiiEgfeoAnEu1upsfKN4wRnnp1SqpEXuHhgomngCM1mM/IXxWzR58BnW6gRv+nY1nBrs
 Msrzhr8HhPzdwJqD/4CbDF4OB8XDCkVqWUBKyMRH0d62wwQASZtz8p8lm3zfcagy+qzzc6PRdQd
 YX9lNGP/zux1QUbS713akPpD/hREsgB6KNqiZybMyKjiqxejXyW4Rfz25igpszkTBUqI0r19+cb
 uaPlfU27k/Li1Sze2yFelub/TY9b4JRAGluOjShDKbHhiX33BgfRG+hd+NKIs+Vey1JxtHzB0da
 Wcu1n7sUOPM+T/ov3azt05cUZQeh6THgnsBl6jIEwNsAN4tQ9zqohaDW8ikosXzVEYLVtnQViTt
 UYhPvJwnIN04Q1
X-Received: by 2002:a2e:bd82:0:b0:386:ee99:6cc4 with SMTP id
 38308e7fff4ca-389ff1159c4mr99375251fa.3.1772526068340; 
 Tue, 03 Mar 2026 00:21:08 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffe02bsm30856171fa.27.2026.03.03.00.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:21:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindigs: display: extend the simple bridge with
 MStar TSUMU88ADT3-LF-1 bridge
Date: Tue,  3 Mar 2026 10:20:37 +0200
Message-ID: <20260303082038.11352-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303082038.11352-1-clamor95@gmail.com>
References: <20260303082038.11352-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: A86CA1EAB35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

A simple bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index e6808419f625..7636c24906ba 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,6 +30,7 @@ properties:
           - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
+          - mstar,tsumu88adt3-lf-1
           - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
-- 
2.51.0

