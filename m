Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLpHFGQIrGkWjQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:13:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2A22B609
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4888C10E358;
	Sat,  7 Mar 2026 11:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U+oOPbng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A1B10E358
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:13:36 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so69492065ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772882016; x=1773486816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfZvykbj+Munv01zyroOwx0N1ICA5mAYoReNuZjedZg=;
 b=U+oOPbngC1sFiQwPwBR6ghgqctUS7IO9IQXEUwGgteTmk1QNh/g8cRj02RAM5xU2nv
 WbN5C87tirBeN2abnmK80+OYxiOfORpox532LUmSPPXAlvUn95zSpfOwiUNmdfuTqdfE
 QnuEXLoVVNcrWxfQph8jGF5G4KDC4hvAvH/7exSK5DIokuE7GTE1grYsSOAY4HRRSKZH
 hK64Jf2mTHJyXSXxD1DiCnLIjv0K0EfF+e7KaI29mHnWj7OHuCOBjDLuQRgLgOhfeTBu
 rNYeRw6y9tlYXcAzh6rFKB5/Gf9oIsfQNNKLhNtrYHjWvWTLhYc1xSlV5nrM25JdSVH8
 J2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772882016; x=1773486816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RfZvykbj+Munv01zyroOwx0N1ICA5mAYoReNuZjedZg=;
 b=wW1vTz/LV4SyxhzPYgqvDqTB9e44uyPy8H7kZEQlZTtfLvNJOTXVlq2SoiQy/iM1N8
 z8qa+iSwL1LH51BvcF0gn6N6UpoESqc8LMvhIwQPo+ImmiL6IebB4NXIZUda4if4ncwO
 mcKe7NcV9jq/PE0a6UMd322cxWe1jSi5jUbjv4zAm9g+KnsDGbUVnymI1v+Abt1A98O4
 TwacE7sDDlpnFk2vCA9MZ18ZBMJBe7ASDtOjewIvN4kxro6gpUPs0cFMRW1GuBNCQPeI
 o6EcidU+NZgOIMWdkm5VSRrebAORxT8hyKPF60zayEAiZ2hIwXoGFIs7Vt9+rboGA4m0
 Q3Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRbgDEAlh0JkgCe0EDgPNlcfPPsOUMhG1UfxuJq8QSqZu0KB5yi2Ol1lwzjvLppJgSyjpzMv8/mBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZcA62hlFE7sluBd6IENip4Y43NxNacmqj3nPi+7WKT9jQFJE9
 4yhgqXiNZlcJ0GLCv67wcpHXZQFIusIQ2he64DpZk+zkHCGAFkFw473w
X-Gm-Gg: ATEYQzzQ3NG+42aws4RIMbmiskdLfy49H1w93wMkA1l6h/1wpEwhds4ZPodV/bpHdSa
 A+zeCnygEqkMW0MVUwwnfu82wfoxB2pURze6C/1AXliAfqzL30RM9WaF7wSwUk7xlBNH+wBDfqn
 MGIJOo22CMvUvuEi9K12l1kudAmO+bAQoSYBYx9/xxqHzbZUo8LxrvO4SuT8YnR/knHM7L333k7
 jYfM6ahHlW2gOUXxwc0j4NEUF5H8MbCUFCUre0lg9xsVk5AQnVpxls5sMykQC7XXBCoUgs+9Txt
 t7EJpw/yDF0HFV3sybgG7D2DgYtRIAK3ucI6e9B1dDFEs1CLKJMx3s29An9ZK5zkCNdBrTkbseE
 weAde90WJw1aGTn+IBaDdmbpFtuq78nT4OC1uDlSo9y86GcBqbd2Bpp0H38ZEH7nOCOCgK6yzM3
 90wvDXAxLRwBm7WYApTA==
X-Received: by 2002:a17:903:1a07:b0:2ae:5d90:9d95 with SMTP id
 d9443c01a7336-2ae829cdecbmr51388105ad.14.1772882016362; 
 Sat, 07 Mar 2026 03:13:36 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f74e7bsm47350265ad.46.2026.03.07.03.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:13:35 -0800 (PST)
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
Subject: [PATCH 2/2] drm/msm/dsi: fix hdisplay calculation for CMD mode panel
Date: Sat,  7 Mar 2026 19:12:49 +0800
Message-ID: <20260307111250.105772-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307111250.105772-1-mitltlatltl@gmail.com>
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 01C2A22B609
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

ac47870fd795 incorrecly broke hdisplay calculation for CMD mode, fix
it.

Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7c16216e8b..f63165c7ce 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1016,8 +1016,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		/*
 		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
 		 * enabled, MDP always sends out 48-bit compressed data per
-		 * pclk and on average, DSI consumes an amount of compressed
-		 * data equivalent to the uncompressed pixel depth per pclk.
+		 * pclk and on average, for video mode, DSI consumes only an
+		 * amount of compressed data equivalent to the uncompressed
+		 * pixel depth per pclk.
 		 *
 		 * Calculate the number of pclks needed to transmit one line of
 		 * the compressed data.
@@ -1029,10 +1030,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * unused anyway.
 		 */
 		h_total -= hdisplay;
-		if (wide_bus_enabled)
-			bits_per_pclk = dsc->bits_per_component * 3;
-		else
+		if (wide_bus_enabled) {
+			if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+				bits_per_pclk = dsc->bits_per_component * 3;
+			else
+				bits_per_pclk = 48;
+		} else {
 			bits_per_pclk = 24;
+		}
 
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
 
-- 
2.53.0

