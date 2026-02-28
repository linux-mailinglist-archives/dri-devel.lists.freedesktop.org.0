Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD4ZOmDBomls5QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 11:20:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7111C1F7C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 11:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26DD10E033;
	Sat, 28 Feb 2026 10:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LRNEh61T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E223010E281
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 10:20:12 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2aaecf9c325so19341885ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 02:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772274012; x=1772878812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9q4+vzHqt/9/I9Wl5SgvfIE9/kAMERYBCx5YTj2gss=;
 b=LRNEh61TETxbpMnivPlNK6YixuhVKUc8P1vXuN0kZpLIEtUczUHHGnkvo5xCCNYzBO
 CWNNcMN5i36Pw9Be+pi0irl3Wjn7XlLnmvfqUJtACjz1yOf/GSR9RnjOXPjY1ZL8g5Wo
 IB4AW41mXQKFzes+Pg7t/sEiaslD14YVbLdzw7zfpgucZBPCGPXzGbiTQNr/K9hQD421
 yMvbzZ8EW/qfJBp9a17d6UcVYCfAvI0hvDUkpdH5qcC4LvGG/lCbv0T8lsLbMrcpkvAO
 +7Q7UTJoC2PvhCYWsRWdwrPP7YXkye+QYD7WSDEODrUqtO4kOBki1+Rl+vAk0tfH3qxT
 dLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772274012; x=1772878812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q9q4+vzHqt/9/I9Wl5SgvfIE9/kAMERYBCx5YTj2gss=;
 b=QTg3tOZZKbCEoaP728/TckF5JZO+iiA61i+RfokTg5i0woVOZ48k2euEEhY9VG7HgP
 BIJWT5cpxIttbtNG62vbwdLippgznkZu05zvZChJtZJ/IsPQS/xq8opREjUktx3/7Y0u
 OBT8o/b9S1vOJe3VFdu6riHSv3dr8f4uSdNMZmYazOeTUeL9LXR2vGPO+KgnxB7GkxxG
 R66rs09ktTVyE2gmVBqCKMIfzew7KlI0SJNRW1EtxAYgxgSzigdsxuAZMh/pQuBwGwVc
 Z78sGL5oZDPcbK4o1kp+6K7qktmHKZAFZGAsxrjoHDm0KZ5Wui/FbYY1zGmDwkR5lBZk
 KKwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbm1UuPDzFT3cn8ixYxhQSbuRnvV0DHayr3i47t4IwpyWd1vQH7cyaTaRYBGRrJKp/01evPI3AcGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9QAE0Afym3jI4wVXAr+0U9NLQWmPbXocc/fdqiNfhPj6Lfe6J
 0R/FPvXcWUNhtLNnC86pGg/0bTLdh2LxAX7ndw7kitCU+l+qSekPAwbV
X-Gm-Gg: ATEYQzxb9YHRv4EOCEgKXTtHrWRU8KbtpRMRrlZkmeNksYJk779vMS7FRXS3HLR45ep
 EgpzCdqHsGOdcu4DxPogHuLL7QW+fwnGHa8ZKVEx9roTQbzXcSS9/u8HPojmMFg2a4AITDuwUQn
 y8sh5nK3ZJdDTdYmB/VdKNbHoAzYz8BxOgZqKIay8mSZFC7+Bi3fL4bSJnbhWb6NDM9tGQSXFBM
 qp9/AA2kvtAm0l2Cqva8elQ7S8SEnyfowmoJPK5pwP2+qtz1R4SbpMjLhP80I4yWz7xEf+JPu45
 UmbBtSEAbPed90DFjOGVmpGtuinsgE85SubPGhgSCexflGLHqAzshuhXY18cEPJ0g5fUc6VgH55
 aAsf64hpRIFioBc2hKH6fVVPPuiUNeDgdycHfBSDXQvPW9mDdKZVGk30PUCtCaLKzTlwgB7NVdu
 UhTvc9xJiC8tUyITRVfefDe72ipch5SHzj
X-Received: by 2002:a17:903:2f46:b0:2aa:d2f4:9c11 with SMTP id
 d9443c01a7336-2adf78db637mr98480975ad.5.1772274012379; 
 Sat, 28 Feb 2026 02:20:12 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 02:20:12 -0800 (PST)
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
Subject: [PATCH v2 2/4] dt-bindings: display/msm: dsi-controller-main: Add
 SC8280XP
Date: Sat, 28 Feb 2026 18:19:05 +0800
Message-ID: <20260228101907.18043-3-mitltlatltl@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9C7111C1F7C
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same DSI version(2.5.1), then we
fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dab..617dd110d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
-- 
2.53.0

