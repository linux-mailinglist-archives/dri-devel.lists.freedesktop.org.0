Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFsXMPntimmUOwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:36:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92911849C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AA010E010;
	Tue, 10 Feb 2026 08:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gCL7ki9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E4510E259
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 08:36:04 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-436333dcc42so359483f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770712563; x=1771317363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p6XI8q1fFGx5WhbwxSZeL59bQVB27jLicC8f3KiU06c=;
 b=gCL7ki9eIHrze0YsCLBeKAH8ULwMOTRSMqJnLc4dD1RgJX0W5V3ez615vlcODwcAyR
 uTu493QA4di9FFuNfUwkBsxoecsLl1w1kZ1Y1oImQxpvvovW0dofS5/pmhMnIO0FUjgt
 /p5EyfLnlGGG4gKarNWBvBKHMHetpoamT0l83ibCXFPeUpo+vUIfh46Dc9SRo24h3gwR
 wjaPG6scGEAvBn/mdGvPCW3pofVYPESQunFTvs0wYcYIqlOO6hWc61yYWaCKOtliUnVI
 uEBF+DCJX75o/aQj4noVSa2UvSjUVIjB6yuUYGLbw3Xd3+a3g1cw1B7hsFfrCGUy2K+9
 UWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770712563; x=1771317363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6XI8q1fFGx5WhbwxSZeL59bQVB27jLicC8f3KiU06c=;
 b=KDetqyuETDy5j4a5qlJ+tOduvu0nhee+/uSmGS3hYPD5Y03Dxe/3xqKgMmP/K6OoFy
 mhGih3rRDD6r1slQngw7SAKFuj+V1brfLTFJUuBzHfMFDgmv6oaLqKrrnKue6DO6hpCb
 Em+r+7kzrX2NRL5kNjCZ8OwMhYhkhLYPa689K8ybc8qjSt9xCjESJ6oxXDZRL2z0nqr8
 xw8Vy9flJXaQLsISrfoqdZTR6Bqj8RCf6paB0knJzqf6I+lqYboFYfMORIt8IJhcfDDr
 L0maRIaBPK0edzAygToiP6F24MSCCU5FvO3i1/wotFpn3kINrJ1Py5Z74hASmhSZCZoM
 vbiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpIqedoYnE0IHl8RFgj6dNQ8KnE64bQO1Zmvy43De8mSruH8h7SOX8HvEMovCDHWaajeaUja0WWOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+7KBn36Vlp22MHDVlpYKzhW494x96Z0Ty/UtdxM7c6Dr3jAHO
 x0dHIgut535zV0ftfYqRF48/7uYxb0OEL73Jhn1k/XA5BuVJjWjQ2fVg
X-Gm-Gg: AZuq6aKavJZUBXKBRjsCltLMrL8v0KKzyc+B94tzj50p9FSOUFuGT/9WpFPrprY3+/P
 bp0zuhDRovnNldtFCNHmBFtHsm8+mVUzSFAJp3/sijM/tb9MRviRMrzX+kwqeWnDvnoB+kaCk4U
 9HVYdy3L0wHIeh0vcLaxJOINcFZJAlDPrDrck2YdpDmpSgQtWFWRBVz3bn7iKcY19KoZazWAWnY
 I+15lWkObzPycHnMHrHwpa31rdOM/ZsD+4JQG6YWc/5fG1V+XkP2JW83A/opJluIGPp19kfV6q/
 OtoKQhuMNj/3b7pUs/DDjQh30NhDPTG/SVODBc6y0aOBaaE9UxKa8z/o4j5+P3BGnm9DZhaRo9p
 5wYZs6UACKPnQM/dSO6EbrlJrEGfKZaoOh+y/N8h0FH80Bsh7Boe3P9Jgdkjxy86z8SCFzoX1eE
 Ch5Q19o8lof850eP3fpy5t5Ak3HWnipIDAuEXYu5cc7ex1FsdFSEl5IFyNoB5wLe/KLIYXa46Z8
 in8zi1Ma9EYxmdkWPc=
X-Received: by 2002:a05:600c:4f43:b0:477:a977:b8a0 with SMTP id
 5b1f17b1804b1-483519c9dafmr7521405e9.3.1770712562678; 
 Tue, 10 Feb 2026 00:36:02 -0800 (PST)
Received: from thomas-precision3591..
 (cust-east-par-46-193-67-14.cust.wifirst.net. [46.193.67.14])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm71911485e9.2.2026.02.10.00.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 00:36:02 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] accel/qaic: Fix dma_free_attrs() buffer size
Date: Tue, 10 Feb 2026 09:35:27 +0100
Message-ID: <20260210083529.22059-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:stable@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[fourierthomas@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2F92911849C
X-Rspamd-Action: no action

The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
a2xx_gpummu_new() but freed with size TABLE_SIZE in
a2xx_gpummu_destroy().

Change the free size to match the allocation.

Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 0407c9bc8c1b..4467b04527cd 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -78,7 +78,7 @@ static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 
-	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
+	dma_free_attrs(mmu->dev, TABLE_SIZE + 32, gpummu->table, gpummu->pt_base,
 		DMA_ATTR_FORCE_CONTIGUOUS);
 
 	kfree(gpummu);
-- 
2.43.0

