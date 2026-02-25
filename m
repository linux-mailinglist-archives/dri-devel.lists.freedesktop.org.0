Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DfSIZmMnmltWAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:46:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D9192211
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C92710E69B;
	Wed, 25 Feb 2026 05:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RzIb/IYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157B810E699
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 05:45:58 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso4166835ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 21:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771998357; x=1772603157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UcwLimubQBfiLX8st4sqZlervVty0bzM6m9RsnitoWg=;
 b=RzIb/IYlqxfBcd/g+4oXDiAr+j+EDVOcvF47WaOlmFbG4kPuz6Qn8+0sb1XhSPYJO7
 KzV1VXGK0SwfBdbOSBil9tDWaM/uHe1eQsx0GkoKexsGgH8sfmpNEm3SrFNmLuJpZuG0
 O73YmIFx8cnRYjgB2Vh1igeJ+/R9i6OVL/MF/s7+norppbXWCaLVKWoJXBgTJk3E6fGx
 wvvE4o+m0lNi6P9oG7bwDZvThuahR1LqWu4+x4bwTgYvZmupvKcjOQTtuy8P7Zx1rSon
 Cwl9KLjnjA5qS/qe4V63eskJTvrD9zA9C9e0/i5AX5QA2KUkx1JSRdTRwpZTyj0YEY1o
 zg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771998357; x=1772603157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UcwLimubQBfiLX8st4sqZlervVty0bzM6m9RsnitoWg=;
 b=H7P/l8WTJf9DKZpi8INYLABMNPJGmGCMCy+1tcxVy1bR++RmD755aGJzktb4n5MND1
 pF4oZOcRXRXU/9RKjpbu/B+2d/tEQcXZEZEv3uZ29A4N/TSicG1i8Ew+8oo1M6C8nIIo
 yGzwpmPCVvuP3ZB2Jj7ncAHJKisujCl5HqmGbYbo4ouk1F6Us+VeHlQ/QDnxqEKJxomR
 Yneewk6eh/4rkAv/R6XoA1tHcIEjzMDQERbwqb0kJSGOwaKFamn61E/XIqUnYGjTRjCj
 eTZxBxNTdxhbzPQy20IAlcjrqEzhjcqubYoE3nozge+erTwtcipHihSnuuJo9/EimHUo
 m9qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcdCmRmrzWG8EGFna1ybGbQhtqxa3qtPfRds0AzR71tO+t3ygOybf3MROih2y9mj4MdW50rRewVAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxymahPUiOLi8kAvLH5FyVrVCMOd2TF72hgHShH/WW68uCWZCIK
 gYbqL3kyJEreoOZfrgMnL4Gm3VfPBX3r+0t62ysqNae/YmkzV9AOR9DZ
X-Gm-Gg: ATEYQzxi1PCIwOJrt796qqkO6gsDrPs0q7i7UqQatd5xleC4yMyWRpCMycZlXep67mN
 PMHQT04UK5fQm1skee6J8UGiERpf61cqBGpOdT2yqMkV7NZ13FFYQ6P2c4AiEMqbywJy52MEGVW
 X7c+UT456JaJ2KyPjH6jmYKy/MZTVQEcB+7If2Se55mIwVM++q3kiQfwq45raRjPeYnzaMeZCME
 wdTHF787hwk4C2XI3YkIJHMhaq3jRDK49tmK46vH0qs8g0TbOEFrcj3oOKJArXp8N6H3Brkoe9l
 a6pjr4UUEszMb1EL6id6HWnG1XxOSVyZI8QbhZybQxN1BBtNgzktNhJpMDuL3npllDJ0FLejPMv
 XLzBf5Pm80qRUTfvIWi8Me3hzMyBYaJOG1kpyZEESKh7omXN/CMP31Q/pnhJP5e9cti7K6IoBXM
 RMqt5gtfrrMHP9YC/z
X-Received: by 2002:a17:903:acb:b0:299:daf0:e044 with SMTP id
 d9443c01a7336-2adbdccd7a7mr24913605ad.18.1771998357542; 
 Tue, 24 Feb 2026 21:45:57 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 21:45:57 -0800 (PST)
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
Subject: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Wed, 25 Feb 2026 13:45:21 +0800
Message-ID: <20260225054525.6803-2-mitltlatltl@gmail.com>
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
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 398D9192211
X-Rspamd-Action: no action

Document DSI PHY on SC8280XP Platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4ab..9223af1f4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm
+              - qcom,sc8280xp-dsi-phy-5nm
               - qcom,sm6375-dsi-phy-7nm
               - qcom,sm8350-dsi-phy-5nm
               - qcom,sm8450-dsi-phy-5nm
-- 
2.53.0

