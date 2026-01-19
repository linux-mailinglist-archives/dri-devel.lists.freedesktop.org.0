Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81190D39F89
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC32C10E373;
	Mon, 19 Jan 2026 07:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="O8wSW5O2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBE310E334
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:40:02 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34aa62f9e74so2690219a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1768794002; x=1769398802; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rN+cGtEsyYS/EFfYbYyjlnFh1HSWT6FWD6gjpSK2Mv4=;
 b=O8wSW5O2064EhB1nmtSFX8eacxBYBtpQtY1bWM2MexVs60pT7fL2f9+4MZMZOO9nIQ
 M3CrHDGnGfQramYGR2u+ArjFWG1hF+LB1elpJRfcqY9RzbBY7H4+DHHjbHcWoKzvHTHo
 pQr24EjI0fh7B7jUVX7Cjckfkav9AHjAIK45R0EKRSrAgQ0l/jUeRVAKDlddBDYgPZ0p
 +hAbbAAUbEx5xCXrvBemYLlZE10hgPoce3rzPIIrlaZyaN3E0CC0ZVCa4vfyqG66fS08
 isIXKft9dV8eaueKnivFnlOKRtx6Q91Ts1+T3+By71m4dhJmrvj51RoeLvEHOP3wcJtT
 ROaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768794002; x=1769398802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rN+cGtEsyYS/EFfYbYyjlnFh1HSWT6FWD6gjpSK2Mv4=;
 b=cXHhplm09LCf54Jv1X7E+nq1dA/xZv+e00vnnuX5LPni7Ur93XS0nYMBtOyS7BvG6h
 jQiXOJj2TrwMde5Z7yMSrejKvmeNl3PP9f47ihgOpqkqsLIzUhBd3Pb9A1CQkGzRdP2l
 Mkmc55cMHPKppKAaeIiWXZC3t7nhERoFQ2tkhf8/oydgtlGkPE/mIHMwJR28ELg8HFy3
 rXAWPsRBIJQLSGQC2sRRiHHLjocahxxTeG0JUugKFuNwzJQdDx56BGAbwkeJdJ+jLctF
 BBdyFphRZCIq+938ghd8qj0jQGsPwpkAjKiUa2OxNkVmStp/5lhsHgJNybrP6Emf8xs/
 NAGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIOhKOQwtRpX8JDFJs0aDSvyKxrGqUDWfwUrVcufBXLyB2M6cLM8L6n9npRKiSXuwgzHVYRj+cUX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvdBqBlR3bcfcq3drg69JMMe/EaXRRmF69cfEAe0BhBs7SN3Z1
 DH+VcCl28KniqLzkjasDuoktdO64VvQUKCKnYTh8nWoL96FmxM8v9p8yRkt+CQ8fMxE=
X-Gm-Gg: AY/fxX6OjRqBW+prOEbCQ5O0cXHJVlM8tPPf1qOYN6p57t565qY34/VUmVWkWIqle+p
 dsRgsctNGu1InN/03wN1daQvb5NbBy9YBY++BNfLYvKVLJFyEN5VyqEIrKziCtscfQT9mYvk5sF
 EmpVDsvN3gjNJMYKuziUKSXRj2N4HlVULIx4zIOcqdH+8/o2P45VdZGLtAAgC4uN7pzs4VtoTbQ
 xtcI2vG+ulxC5ckRBv3h4issWekjNP6Dvz74SmxqCHaksFcUSP1z51WTTpDuRItodvspwbBTSuJ
 oMls7gPRiBGWeDnvqvJ/tNmpmZeJvbdf7opo8BXCnMKJLsHxxz1Cd8JZeItloVYJ7ZMZtxR5vyT
 URVGuWjOrFNmgjg9x77S55MW75zNzZVims8mjYlaKbuCIDPHEQ/J+ogRXKP9JwE9HkIuXsCvVAf
 YTYtyc4P2X0g6F0e9jFrl+e9VumS1S3uk/FJgnbWAxjlj6+snaHfvCn+eVlu0eUhie3J7youj/U
 zf0Rtry+bNcfjyyKue2/NT3JGA=
X-Received: by 2002:a17:90b:57cf:b0:32b:c9c0:2a11 with SMTP id
 98e67ed59e1d1-35272ec4d6amr7533049a91.4.1768794001940; 
 Sun, 18 Jan 2026 19:40:01 -0800 (PST)
Received: from terryhsiao-Latitude-5490..
 (36-231-136-165.dynamic-ip.hinet.net. [36.231.136.165])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf249bdcsm7610192a12.8.2026.01.18.19.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:40:01 -0800 (PST)
From: "terry_hsiao@compal.corp-partner.google.com"
 <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 "terry_hsiao@compal.corp-partner.google.com"
 <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v1] drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)
Date: Mon, 19 Jan 2026 11:39:52 +0800
Message-Id: <20260119033952.9970-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Jan 2026 07:18:11 +0000
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

Add support for the AUO - B116XAT04.1 (HW: 1A) panel.
This panel is used on MT8186 Chromebooks

The raw EDID:
00 ff ff ff ff ff ff 00 06 af ba 89 00 00 00 00
0c 23 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 21

---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 679f4af5246d..108569490ed5 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x89ba, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e50, "B140UAN08.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
-- 
2.34.1

