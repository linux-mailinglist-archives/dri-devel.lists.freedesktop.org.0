Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ANKIqKMnmltWAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:46:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B8192228
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8313010E1C1;
	Wed, 25 Feb 2026 05:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sf0JPAxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9386F10E69E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 05:46:07 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-c636487ccaeso2363280a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 21:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771998367; x=1772603167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKkr4eeTfN7wADREvjdWZpjwmy9o6+cZb2Ap/abwYj4=;
 b=Sf0JPAxpxhAuDVbmxtaFr1P1uwd6YqK9Xbdna/l10EuG7niCtPGv3/sKAIl3ZWmkru
 XTSdEEUtH0kfTjFzSr9RYfczcqEcHeuo2uBQy1QMKROQnhx6X/qT06ZwXXD96Z9+IYJP
 wg7pnvJeHwBqc8SbiA+skh+7+JQhvV7emJOeHLY4PZcuD27FWumm8zhY+Z0v8hVRyuNO
 dE1cp7+WVIQdk6ULZ5v5qKXFVm8uuqMIAOT6M5R3sJWSv+1+ej2TRpg/wxyBC1ijOZas
 6b2i4/naWsLoV09OFyIf/dSd+kForVbcrFoRyXbOoHaWx7uXTYkbzOg5sfBnBe7hYvPb
 0SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771998367; x=1772603167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EKkr4eeTfN7wADREvjdWZpjwmy9o6+cZb2Ap/abwYj4=;
 b=DEo9csDell0EnN5adP0OfU01tcE6eF2+jrp7h3BwaQPU2S3uat8q/Lun78zX0RJAgp
 EQj/wzw6jC6DvQ4syAW84BaTXtIEtHLW8n7Fi1OyyHJYPaHUN+YtPcHcZwTgVZHP/zCS
 DzZWcW4zU77XNtospk2yffcJdtRcDC8jQ/Ikv9pDX8DPxMtmebbAXBjjDNnbQFU1hZHQ
 ZSS7/b3qi3vwmQnnH9EMDcxI/ElMeHNcYemsWNQjECXvdc5mGLF3SwT9kuSrwqLKRURB
 7E+XNwJ2c9YU+A5cCJ7j/g5HToROTMeNf3gWWI9/Py0QJDkLAzFeXoLfPpgeHrLe2pdi
 guhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwhYAogNT0ohcSzX4xqf1W7u8xJjVggRE+P8QMAD7Pmd5aPsOIZTnhgGCZL3WSiAhn3j3DIGJGoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxtlm/cXs18BnrUw4DrcVNPF/NcyRTiR377Mv3rKp6CwWp9fou
 ACNeW+1++yr4L1rP0yBdODavzZAaN4QVm0LPa8dQ5+NLJEhdiN21rLR7
X-Gm-Gg: ATEYQzxBjD6ApHVQdxLIJA0/nAi8W3I3owNOXK+SqoIJRexzhtFWTMJGiAyXVohCmJN
 oTg6EwlScshkK5a/CVPGo8vmWqY9GiYy90QThwKvB71FSg87AAxlpQkw6gOWBELlV4ddf4yhLJ7
 v4kxdXC2Bzr0wKoaYSKWlOVs4Z9JrsRmtbw/X0MbFLVSpLawLVpC5bHfVwq3swtsTYfe1MMjbxX
 31DT7NmYTNf8W/c0GfxAhmjTGfEE4m5Wa2nQyrSNIbZAtUbKHapTsvuYkqk3/Mc9PlH2q0kHv5a
 ym1Ey94/DC6TjV384Bb/RLNnBaN5W41LUBZmBy4z/CNqaIfSQSCwBltuu4HFZMMWtGWejxcfbZ3
 Nsflffr6wr1re0lzBDM51UIwVqJBx9c5cICt6eFIaYE6cEIEeTu2DhrlVH1lC/5/Fqmq6LsUzwI
 f7F2bjOQ==
X-Received: by 2002:a17:903:1210:b0:2aa:f9d7:68a8 with SMTP id
 d9443c01a7336-2ad74511d60mr126836005ad.28.1771998366891; 
 Tue, 24 Feb 2026 21:46:06 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 21:46:06 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/5] dt-bindings: display/msm: dsi-controller-main: Add
 SC8280XP
Date: Wed, 25 Feb 2026 13:45:22 +0800
Message-ID: <20260225054525.6803-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225054525.6803-1-mitltlatltl@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3C9B8192228
X-Rspamd-Action: no action

Document DSI controller on SC8280XP Platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dab..e6aab0e6f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sc8180x-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
@@ -340,6 +341,7 @@ allOf:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sc8180x-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
-- 
2.53.0

