Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCPBB8KYimkvMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EFB1164E0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FA410E4A4;
	Tue, 10 Feb 2026 02:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqjW8QGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867FA10E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:32:29 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id
 6a1803df08f44-896f9397ecdso3550066d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 18:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770690748; x=1771295548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PSoxtKDAWbmBnHW0acUqKVLWDTWmJDzblYpOm4IMQw=;
 b=MqjW8QGCpmr10eZYzat44pKG5bAHE/dNdA5iOcvjcg+8QtS64WVBJl2lhMw2uuEaNP
 eZ2j4fX5hzXikKBxG3A2OY3+/qFpPgK7R/wBQKBpMhUPa6joyugK2fq+0T9MWzs+jcLM
 DTdrJLYrMq1Y7hgrxV8M3X98gBkqp3wQrFwer77FOtTWPHmt4T8bhboGaaWYvkwMz93Q
 ZMNqTMnhZbY3mJdJLTIJdcCsJp7uUURWvhDrQhqzfREZ3zXWhjfylu9kTqGO/3+fMx5D
 4kx15MQ3KTIng/UoCFLwDuQbHssvHluYIfkOqz5o1UNFV9mXFWyf4/aqnXY1TBHf1dIb
 GfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770690748; x=1771295548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5PSoxtKDAWbmBnHW0acUqKVLWDTWmJDzblYpOm4IMQw=;
 b=EbTxF/Myfhx4bAqcoAWSp8r72ohvFSucnoBZRVp9UUI/wzm3S++H3CVLwzqPqdp6Dv
 mn8VmTYypaWudTt91SbOxjyJB+8NMCjJOknhxCoSnDYshzw4IcFy2g+KqZ1A4R7TvFYW
 HKs3Ws2HBJV2R08wrZDB4yRwt0aMjJUTOZhsbSpRMn+zeNMTXb3Ql3EJD10Kmoa4hZyH
 QPpu0R1Af0WNLATf0wZT+dAAcjnrmQtgmAjfgD1mmTWrf8i0vDSobbp9N3/GyUE/xUHL
 91Q+gidI8mgLhfPjZEwscPI3UOZQUOBpiN3Tru2w2DGDDW1QAt2kiSyyCY9Eyv89yfF1
 fcQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6RzuczAB0euDXx537+J/zuXadF3DoJ/+mwwOhiQDVQH9X2uRwdFP9F+ICLEj2HakuEV9KqF5F2fE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw24BeT84lGF+o9qrkQOnSnYaCNt0xVS8b1LtER0xcI4A5TeUGZ
 DuamxH2J7Drry+oN/kRhzkB5/Bel2eIYofa24bigSm45vTcO2/DRnhQH
X-Gm-Gg: AZuq6aJtWvb0OzRku3jc8psyzjT8HLWFpjhIXUq3kq04Ez9cPbl4gYhtwBVBM0eahdX
 jkConUaGWMIrRRpQ2otyXG5MJTYwuU6DikadlTt4o3XsTLQ2CejgMDDhKDJs+YoD8jKzzVnaBqa
 LXpHlYv5dHZeWQRT9nkp/WZ7Z69T/wc1Ur8Vs4EEnyfba+/NMtZOMQXeQmAJ0VRqfEoPKIm+O2U
 4aC4/rfi0IYssWKSMJ4GmwF1NaNxxXlnVyaQWw5yq3fRM/k9GUIiqnvfJGvjFJFwgR+VX56bX9P
 XJtfA/VEqUxhwvwmpJiIaCpjNswZZ0l27xpEmnwxkpFQxIGdFVny6uE0Ds9vpVMR6r+kpeuCcTY
 cTEcIV/WtnZtGyxAAOkhjufWbA4xAn1yzSi6gkqL+MjFXIE38LnWndD/XA+YVIMNpUVY57UVPza
 t2WIuUqcWN5s3NdnJOIEGqL5bnDo8VekHjeuP1hNcKXV6fV/TCk2b5imb7Q55h4maVp1D9lSVpk
 RS6UMb0/QHRdGM=
X-Received: by 2002:a05:6214:cab:b0:892:e3c3:94df with SMTP id
 6a1803df08f44-8953c83ce72mr197156876d6.28.1770690748508; 
 Mon, 09 Feb 2026 18:32:28 -0800 (PST)
Received: from localhost
 (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8953c0574a0sm92056316d6.40.2026.02.09.18.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 18:32:28 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: arm: qcom: document google,
 bonito-tianma board
Date: Mon,  9 Feb 2026 21:32:55 -0500
Message-ID: <20260210023300.15785-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210023300.15785-1-mailingradian@gmail.com>
References: <20260210023300.15785-1-mailingradian@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A7EFB1164E0
X-Rspamd-Action: no action

The google,bonito-sdc board compatible represents the Google Pixel 3a XL
with a Tianma/Novatek NT37700F panel. Document it in the bindings.

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

