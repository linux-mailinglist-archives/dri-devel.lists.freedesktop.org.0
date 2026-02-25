Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD2cLbSMnmltWAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:46:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6487B19225D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74CF10E6A3;
	Wed, 25 Feb 2026 05:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GqudOyKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D2010E6A3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 05:46:26 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so3337245ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 21:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771998385; x=1772603185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kz+La1wGtHFyZ5mH4/H9qP4gjS7EzfFPspxjfpbovWA=;
 b=GqudOyKJb/tFqLMrM5bFEzwiMRpi0/OVAIVWjw2w2pvgNIm1StdtXrR10T40eFUWcV
 6+gvaXfImHGaABmtla3ItpvexlbQS/zJGl7rYjtf6o2ZmJmEui0Bhdo1oCa3TcCHtadl
 UnNchpcoBaIxkAYGIYHrznc7cyWBeiSdnHbwmjBL6RZNZBxZziRUpxlzcYiADmwSxUIE
 ViHCD3fgl4Uml7rcSh1jTdrss8Z/JB/fuuDIWl03gkWxM2cQ1pgI0c8DaBLIULNTCbh9
 vQY5JYTu1RmOWBL1pW1bKXN/l0x66m2YbHF1I9D9/IC9x5ximGVPfSq7ZxgteSPncWfy
 io2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771998385; x=1772603185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kz+La1wGtHFyZ5mH4/H9qP4gjS7EzfFPspxjfpbovWA=;
 b=uTSSXccUccDC4Q6KoeNn1+99lIAPWh2TTLh6CQ9uDWWRVDQ4VegjKMqqJpRAfLyVIA
 bWm1IZ1GXRdtWY69ZoLg/YG3Pltl97WapBF22aWsoLQM4TKgLldLzwjoIRSFjm0Allbx
 F/P0iJOWv3L/WzNfF0y9/b10qvzGinRkxtQlIiPRgjrYw2eMtB/KvtAkh04rcoj7alzQ
 sijo7d7UmSUIP3eHg7RvnaQmcp1+5hTSQAvBLJ3IsqsTTmzLlBRlkK3z7clRpY6MzycP
 08UY04Hs2pwPUitDCl63fkUTUr5yS7PHIoWTj3kU0KLPp1RxtpA+G99uVBYyFPtMTA+Y
 9eag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR+4Buy95MXf45jhPPtVfpUChqMuGY3Ygs7KIDvScRn9RSHWpj1cJ+icfz0ieTknRweYy76rcY0iE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWgOGMK7zpJ/Jcaaj6Mjmnjn69iZaqF9Slb82cbXGnOFVuM6pt
 S5smk+ljF8UyDCYXI1ezclRQk8ZHQ7ibCmdgXoUo3DjjHLoLkGOdBXEh
X-Gm-Gg: ATEYQzylBd45GWJRHznrdZASO/7kbboYMs3+p2JbYRwhutPEp87KPKHjOear2wIqOR7
 7EEiBbki+L8f+/gC+vnzGGTWmRpKWeperxBgPj8chvRZD6p4zCTb9cBWlw3jhfBMw+Xg+LB0OJA
 LM1RSjGKKv09n8qj4krPmAlX1vSaRYEkhhJANkUanJlkvttpJXPtPDx8rrxnXURclDGaheFp4Xb
 EbBs7WXdt68YWFq4rOG77WRcG2pbI3flqaf+2KGnyE0yJZyz7vJfPuRGwG/tkI/DzoiHURrq6XV
 vi1PQxoTtrZmp5C5Kbq21xQ99DN/N96mn8lLoe9CmLLh6ilb2mWLKnVV+/+nq/DJayZAkF3GG2g
 El50/FkxtGVqMvZEoAEoX6vn4of2OtdQltMqEM6xemy91iFeMKpm1OpuRnMiwYDvxvUbE231eN/
 jh2MwrGg==
X-Received: by 2002:a17:903:f83:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2adbdc3f5d7mr22946505ad.7.1771998385565; 
 Tue, 24 Feb 2026 21:46:25 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 21:46:25 -0800 (PST)
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
Subject: [PATCH 4/5] drm/msm/dsi: Add DSI PHY configuration on SC8280XP
Date: Wed, 25 Feb 2026 13:45:24 +0800
Message-ID: <20260225054525.6803-5-mitltlatltl@gmail.com>
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
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 6487B19225D
X-Rspamd-Action: no action

According to the REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL
value(0x3c) on Windows OS, we can confirm that the SC8280XP uses the
5nm (v4.2) DSI PHY.

Since SC8280XP and SA8775P have the same DSI version (v2.5.1), using
SA8775P configuration.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7937266de..4a37c50d9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -565,6 +565,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_5nm_sar2130p_cfgs },
 	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_7280_cfgs },
+	{ .compatible = "qcom,sc8280xp-dsi-phy-5nm",
+	  .data = &dsi_phy_5nm_8775p_cfgs },
 	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_6375_cfgs },
 	{ .compatible = "qcom,sm8350-dsi-phy-5nm",
-- 
2.53.0

