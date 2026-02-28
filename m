Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDM6Fm/Bomls5QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 11:20:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32221C1FAB
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 11:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E6D10E27F;
	Sat, 28 Feb 2026 10:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AolEgDSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4195810E281
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 10:20:28 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-c70bb8ffb24so1118580a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 02:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772274028; x=1772878828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
 b=AolEgDSLcaRcJBqXfdtQ27yhW3keocpjuQ5+pzvAyr9eBvImRbkde0WtnJO2d23NRY
 M8vWz1CZPEqYZyizMLqIaZdNZvpIrD2AdaKhBgvmjVsa7eUSOxQFB1AnELPH0aEUnYLW
 ScGrZVuvTRx/wl+3NcsJeoOX17dMSEOrTnb/ZM542bWvxZkOqwj6O1RiBxbulVKsi/nP
 wbMPhZxEo+mqCB7S3zqpWyjtd5mjz7KC6tyrIESL78b468qb/zQKS2YKzWAk9rbUWYoa
 l2E4X2i2nMTGfWrsN00E9A3AGXNsWmIDng7rZF30Lvgjmsr+ZuvjJea/U2gaX/xpZmy8
 hCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772274028; x=1772878828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
 b=oFwLp5mco963BCHxlJq78qpf5L5ntk2KnPWYiqZE1lYudy97xdQ8bM4o+yIiLtWMQV
 eM/CxjRotaBJfW6BPa+SJoK4kFKKJNsGUC9yQ3ONc/SZrbwRrOe8wSALgVcy/y6FeFdi
 R9sypKBudPulkKy+XejGgZFUMvrWgiLLWxBropQKOzZ6zGAxbuNw1H+6ZEanjJ0nYXcK
 QzUqnIfsR01tCMqlkxQIZjXhMnv1yTFiP/kZxTQDCKE5j4/0lLYvYuJbjEyA+p5FDkwU
 +iVCKWCMDYR22XcFnewr9mOBR0l1N030RxcqjxqbZULF/RjIgl1V9+J+viTYP5DxV6CO
 NcJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyBWXS6B3KCurvgp2DGcWZeHOn5nFiJlYN+VkXGr0xxYRuFUdZb+98eh8zHOYnmXNpcSxlxyMMBjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZRe59kDwSR4QG6nMc/QXKWj2nE9r9PVJ+1C4ufFVVl4dwO072
 Kc3Dhnrf0iyQBfgHeIvOoYwIUd0KO1A0qFpTg9iNIMl9h6zLFKNzakLHxAcMx31bUQSwOQ==
X-Gm-Gg: ATEYQzw50vwEARR2XlOTorSZ02ejdPWpDdgfoG6FdP43Mv2qTUisyQyJsXmQxRST82f
 xzvnP+6wcCy53R+VMOkXeY0lrrANKFb3c1CpNM+aabR9SiBhMnSiF4oE0JYRX0tLRl3VPwEpB9c
 v38UXzu6HyEkFHwSPcPXhtZIDY2UYT60LqaURtBP1aurM/bwwGUtnGmhgIaDXlp75QVBtP72j3f
 a4yNDUXngbqkEtYIrrxGpMoCe0qmP2Q3Jeg0oj0NsL3e/3vdtwbLc1enl5ssS82BCmjImMR4NI4
 JIXJhyWlct+sYacMSpyLrRsDwANHp1CpW+eku0z+phQnLXubtVMWpmz8gOGdsJhCNk8P50AX3sg
 Z8t3ajIh0+QoefjFAbYY6/5/GmCAryPQFlGmAUyj1iKsGYkdjB/PYTteyF7AyDMy2liKVP9DkYj
 HbAcyM7fKEYyAJEFX1v0MiUQ==
X-Received: by 2002:a17:902:e30e:b0:2a9:5f11:3a26 with SMTP id
 d9443c01a7336-2ae2e3e7061mr41831665ad.7.1772274027740; 
 Sat, 28 Feb 2026 02:20:27 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 02:20:27 -0800 (PST)
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
Subject: [PATCH v2 3/4] dt-bindings: display: msm: Document DSI controller and
 DSI PHY on SC8280XP
Date: Sat, 28 Feb 2026 18:19:06 +0800
Message-ID: <20260228101907.18043-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228101907.18043-1-mitltlatltl@gmail.com>
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.2:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: B32221C1FAB
X-Rspamd-Action: no action

Document DSI controller and DSI phy on SC8280XP platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../display/msm/qcom,sc8280xp-mdss.yaml       | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index af79406e1..a710cc84e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -50,6 +50,22 @@ patternProperties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-phy-5nm
+
 unevaluatedProperties: false
 
 examples:
@@ -129,6 +145,20 @@ examples:
                     };
                 };
 
+                port@1 {
+                    reg = <1>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi1_in>;
+                    };
+                };
+
                 port@4 {
                     reg = <4>;
                     endpoint {
-- 
2.53.0

