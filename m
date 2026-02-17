Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ds8LIyxk2kK7wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:08:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B914832F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8B210E40F;
	Tue, 17 Feb 2026 00:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UoyRM0h6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B170510E40F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 00:08:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id
 af79cd13be357-8cb3e0093e3so357566685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771286921; x=1771891721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OyU+RQGolTTl+pL9xn1xmUSpDZLlt9dF+KwDZqgIB8M=;
 b=UoyRM0h6rRU69SnnD4h9+azM6Fj1FMMTB2IOPZBDH7EF65aXm48WNoGOTYhsulOpRx
 iUhw4WQWIjAglIhjohn02aaxKkeLivTtmtBfNtIE4xn/FFXLBii0JvcDy7yMedP26Av9
 hExxMVLANvuNqblL1A32uFyHCXe6P4v0xj9aZ3qRaOQJcRklj4HbnLUVaefmUpy3NFAn
 3aW3hazlK3junQXvvXYJxCucGB6z1zx2CBQlxoy8EFR+CnktaK2oWfRF6euKMJ02VnN7
 5nk4eVUHNe2OSOUXCVOx27d8v0V3KPa//C6WwGaDCs6kby6NFTXNLijlD1KFtoQFjTrA
 LC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771286921; x=1771891721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OyU+RQGolTTl+pL9xn1xmUSpDZLlt9dF+KwDZqgIB8M=;
 b=qHfPmRWnXclVKQLStUbyzQEZGDpBUzKAT0QPqB2ZV7agx/E5Dp2I9slKYE+8GrusKF
 MyKHpc6SlD5b6pA3bPwzba6z1v+08GQ/s1vEFD29Tgfm3c7Xs2keUAP0opzpdllU9fUo
 zHw5BLvFTxwpBwE3pFE+J8ncUFJJ4V9fW8hJbHqN5yjVEZFC3JkccRhHGXg/1yoSbmLT
 VT/BDhSah/9erkLD6EPj+sJNZmU6BYbOng8F+LM5ouqg/NlGFeXMAmSsa39noU0Jm/i/
 ceRnQqkXNaIo3zac7tAB0Ht4TxrAev1m9bf0514jOCTPPd7q/gCKFVZDh0Q3xvSYunA/
 BsCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnVEe+SsOZc91JfRBXR9O/6kU2h5PlNYwMeDCd+UFARJhI1o6ANaHxuJnNnHS5GCHiptnZ6AZftB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyyO41tcwDq9mx2nwsdZo5GVMy+qFm5vpz2SM8bTv9l9mrarp8
 JI9m1WGrc9yTDBvu5TNolTAFKmvP0arqVA8c2msiFTfDC/0PpLLNsCjF
X-Gm-Gg: AZuq6aIgPixFw6RPPHWSh62o67/iozHBud9ic7cDoY+EW27faty+3cS+j/g2tjuOZp8
 KrRX63tA5Ak1zXBxO4+0C8jZXHH1e3vG+UdQISUhHJH/6EyEaKiz2Hy6jkbEDn4bRJNz5uONOI0
 V4vNRsDnJjKCGowc3WM7bBnsKp0vL0KVIZggSLUCU+clOFWvcRmz7WjH9umCIT1KOmd7f+tyE9c
 mLcIJS5texh0TEIH/+BQ+9i0kwD7fDPCrTgX6MTJqTNemHgV+42qd45nqX+MobYcAbTqwzkWP/7
 L1CU+rZ9ol858EIL7x4VBpQdng+kY57Ml+VvfBY96aV3UFLbvmgwzV/fwOlT3Z/qqB7FwyX1QkS
 K629zlUtn9tnCm5twEYyRWUzZHQqZFh8DfTvLlmwZfhVflZ0QM+xPlMjdpr5dGDOFbQanflimZe
 ROGa4MwmFp4X6Z9g7bX1TJkxW/w4LvM9QB/VonzdaA
X-Received: by 2002:a05:620a:3710:b0:8c7:fdc:e853 with SMTP id
 af79cd13be357-8cb4225fbe0mr1517757685a.1.1771286920626; 
 Mon, 16 Feb 2026 16:08:40 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb2b004eecsm1380960685a.0.2026.02.16.16.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 16:08:40 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/6] dt-bindings: arm: qcom: document google,
 bonito-tianma board
Date: Mon, 16 Feb 2026 19:08:49 -0500
Message-ID: <20260217000854.131242-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 190B914832F
X-Rspamd-Action: no action

The Pixel 3a XL is code-named by Google as "bonito". The
google,bonito-tianma compatible represents a variant of the Pixel 3a XL
board with a Tianma/Novatek NT37700F panel. Document the google,bonito
board compatible and the google,bonito-tianma variant in the bindings.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..59118faffb02 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -831,6 +831,12 @@ properties:
               - google,sargo
           - const: qcom,sdm670
 
+      - items:
+          - enum:
+              - google,bonito-tianma
+          - const: google,bonito
+          - const: qcom,sdm670
+
       - items:
           - enum:
               - qcom,sdx55-mtp
-- 
2.53.0

