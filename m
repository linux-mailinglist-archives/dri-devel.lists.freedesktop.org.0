Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOS/Kt5TkGmbYgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 11:52:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10513BB90
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 11:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6649210E012;
	Sat, 14 Feb 2026 10:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+90pqhF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F4A10E012
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 10:52:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-823081bb15fso964859b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771066330; x=1771671130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JKZRzgUme6pMax6EEp9xxfwcIn80zii3ZHbrvX9cB3c=;
 b=c+90pqhFzxaCTUWsRrtT1FRDXZght0MXoWhT/wMXvVLeEsbZbyDK7fCxlCPy1tozIY
 G7lBe92ifkOCsLOdXB8KzPfIotd/FljjtmkBSN6oYe78w5GfFvFKUuumlJBMEKYYospG
 BwuNsm7uAhGiWSL6zvhx0oZ+aNo/yWMYtng0VL9CkyKygSJmAy+G0WsQxDXcUsEs2wyn
 eR7CJxC5S9lucSHI7q6RHiuBOX2PJe5hWUX8/zk2nht2zEZ1vBI/vGCSHIeM4E4IRMoC
 LoOIS/gpTYwyfUC1Fb2qM3l8uPPRC1pqIQ7LTHU+FUus/d2j8lCymamqJ7/0Pqf+YHuv
 YTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771066330; x=1771671130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKZRzgUme6pMax6EEp9xxfwcIn80zii3ZHbrvX9cB3c=;
 b=wpuBHSi5JJojTB4yh3K3PJ1i0YRX4MZKJWYw1Ctog3N/SzDnFvELN7/EERZ820itGc
 h5HtK2fVS9rtAw6cQsL8eVHPz0BaV/PyfmxQa5ZMp4p9D1cNg4BDIsv+MiHa99EjiZ0v
 ur4eM04LOVsrtMZmrVfUi+azTFrbepJegElC/elyRzNymiFI+9dOvi2sdNhlcAnBEt+V
 9jofGjwM/p6tm133JO8FO1+W4hZtKZnvFx2nkHHEma3pn37WtJEG0UFHoM7wkys2xZPC
 mFEKJ4/Ssjieo9/9MvlIliFtyTjVLwqYxh77Twdcqmbm9COmrtswVRVXGzzIpWJXM+/W
 48AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlFRxtYliCPP1n07BuRPm312CHrZoHoCP4GGYwqCjtXb/+mZzOPYEHAlYLgbbI/bOGLc0xZCkt6Hs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPIok6ODuDbasYtJD9Jh2zjBJIWMlY7LeKuXKoQpIRe0aFfFzX
 51/CiiGeNo5kxfCS+QQJ37TDWxJscJmIRzxoz2APwO/fO7JVHh97UGjd
X-Gm-Gg: AZuq6aJXzGfrX9ffeOL1K86My+YNBI/XfMixppcbQiJGAzVHag6dGp+asjaOr2XrqPC
 LmW2AC7i/Hev2nCyBVJZJHYX1WV6pfxDUll77u6x6jsoqOA7fM76WkEXMzqmwgXD2v1ig7APr5F
 ViZ1ZtHBPajpI/BzzR8Wuk17Vk+jvO9RAidriednOMvAT2kqBczESt52OOlnIJGepxh/kr1eNIV
 d3F8jc3+/DSTk9ynKz02PSAqRzax4fFlcQzTuxyPgOtU0SES0aEEckoya2Qql8qdVHu5XSe6n/Q
 emUgr2kcLu1uOkMNYWswM4Wn9AunLuubXKR9JiI/ymb5OPsWBnIvUt5ZL8KPNMmbX0Imh5WM2be
 dDPzEV4Emu6L7Lc8Uo63b//0tRDr84mBqeRHcc9jknaB9m+aPNR4PctCAjSAzIEFWW0yzopp41N
 dATEjaRa0eZZtkxopE
X-Received: by 2002:a05:6a21:1798:b0:35d:5d40:6d79 with SMTP id
 adf61e73a8af0-3948376c311mr2406124637.12.1771066329667; 
 Sat, 14 Feb 2026 02:52:09 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a13:29e0::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a6f9d34sm18436865ad.11.2026.02.14.02.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 02:52:09 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming dsi
 registers
Date: Sat, 14 Feb 2026 18:51:28 +0800
Message-ID: <20260214105145.105308-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5E10513BB90
X-Rspamd-Action: no action

Recently, the hdisplay calculation is working for 3:1 compressed ratio
only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
can draw the conclusion by cross-comparing the calculation with the
calculation in dsi_adjust_pclk_for_compression().

Since CMD mode does not use this, we can remove
!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e0de545d4..e8e83ee61 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -993,7 +993,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	if (msm_host->dsc) {
 		struct drm_dsc_config *dsc = msm_host->dsc;
-		u32 bytes_per_pclk;
+		u32 bits_per_pclk;
 
 		/* update dsc params with timing params */
 		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
@@ -1015,7 +1015,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 		/*
 		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
-		 * enabled, bus width is extended to 6 bytes.
+		 * enabled, MDP always sends out 48-bit compressed data per
+		 * pclk and on average, DSI consumes an amount of compressed
+		 * data equivalent to the uncompressed pixel depth per pclk.
 		 *
 		 * Calculate the number of pclks needed to transmit one line of
 		 * the compressed data.
@@ -1027,12 +1029,12 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * unused anyway.
 		 */
 		h_total -= hdisplay;
-		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
-			bytes_per_pclk = 6;
+		if (wide_bus_enabled)
+			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
 		else
-			bytes_per_pclk = 3;
+			bits_per_pclk = 24;
 
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
 
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
-- 
2.53.0

