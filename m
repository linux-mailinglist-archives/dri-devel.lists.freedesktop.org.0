Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IECH3cFoGmgfQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:33:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D01A2A06
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B79F10E16C;
	Thu, 26 Feb 2026 08:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="YysziFZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C0910E16C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:33:54 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso4070665ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1772094834; x=1772699634; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3+tls+29t8Eq2fTLz/EMcwd9DbA8zxeJ8fFeF/eoOPY=;
 b=YysziFZ4+4a4rtJ+vmTjH8wZM3tERb7V0M7upO4GPlGCEITiaw1iQd6v1pyd+exBVp
 5SaljrajKXAQeuKOk4IcGplbG9o+UP4W/1ej2/uWiv9IyikXek596M4e+jl2uNKWtPFd
 OOQVtklRZ0719SJwtjb3ifsHgk8kZbyz7zcDioiPLDg3nX5JmxLjBZpfrzmKgz6v3qSQ
 IA1G/DF36wdPZwFk0ct0T9k8+Oi6x2M8wT11E0tfbEu5CBk8piuFdH0IzOQTN3OEzxBN
 vznWPbTiK4dNBJjE7aawRe5UgJS3uUrozni78j6Dn2um5DVGU6Bl3lMXizbgBJ65bFZ6
 FPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772094834; x=1772699634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+tls+29t8Eq2fTLz/EMcwd9DbA8zxeJ8fFeF/eoOPY=;
 b=G/d7+PftF1ngNnkV+dHhvbNfMBB6wXSa+9MTEt9Eh0GyBgEck8AOV1Xt113RVVGPwv
 AwX23KQZgLn0MgN+Z0HoK4rdjz6VZtWnR6gF767XcpJn1ihMt/dxcmecGjHjdNKQTN/3
 0sMsoCN3EIQRB/Hc33JBLqHHGVQMxg4T1JSl4vMfUQhnkQChrb2OWg+hpvhdt1Oz6zcR
 s0E3UVpH0idfufB/X768wyx5Hpr5ymr721s6IcQgb4EMPv++nXoeRfGU6XEvdN1XSTSl
 GW3X4r34jfIWnRY+5DcdzY9YsDdaPtotUjoZRyXFcOIxHDTeDrv0ew8STcr6VftNpbQB
 3vAQ==
X-Gm-Message-State: AOJu0YyhgD5h7Y3hAjChIxxdnIEfRJS4nxPp9WfvPW3B2p36ygwNCA+Q
 vonBKLPvEM0Lxy3P/7AlpOrWqD2/nlbDB9F1N3xY1voE2r4Sz4K6RcnfQ7Sq4U0XwhI=
X-Gm-Gg: ATEYQzzrvoO8durmni73dOHgXocFLl4tfgR2ZWOpNajg7Mzn23gTvO7soZRvkyQTZR+
 eUo9MXwYMq5nx8VJpzJORJY4l0y+5+wAN9lcljlghjD9qjZYTmgg4XdMuWIjVEp0qa7rone/KAz
 1J/EcDFXygNS+eNTXIRjkPKiAdnHk/q/5gDy+9EaF52fe96Pwhe+rKhYgBs861dqbHU7gMmi/p4
 5Cv9bOo7tplDSY2de0233e7wcrNdtNtXVFv5nDJBIb7Rkx2b8Jnan2p7nQ/xSZO1Kmd79+Ddgs9
 REQWKUbeHsRXYEtooRKoE94WzDrQywvU0AW+VsPQ78dAWdywrUOkicJT6JXtBQVt5VW+ZDpHQNK
 ZfKV0R/dfvvf0zc4IPLhj9qwPQy6mLnqUwjv3UcfAjxz/MwMWaoy9EXOsTBB4sl+4bfn5aTIgTU
 P4andOuhyS7cVjfxverHpTgWp8iblkyAdFrP2ZAxE6XHU3O4o8gcHzvfUmZtaf+Wt7I0IKv2Eag
 g==
X-Received: by 2002:a17:902:e550:b0:2a0:d454:5372 with SMTP id
 d9443c01a7336-2adf7932b1fmr22766435ad.22.1772094834051; 
 Thu, 26 Feb 2026 00:33:54 -0800 (PST)
Received: from zhk-CBG100025892.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6b416bsm16810345ad.61.2026.02.26.00.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:33:53 -0800 (PST)
From: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Change BOE NV140WUM-N64 timings
Date: Thu, 26 Feb 2026 16:32:35 +0800
Message-Id: <20260226083235.2176689-1-zhouhaikun5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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
X-Spamd-Result: default: False [2.69 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:zhouhaikun5@huaqin.corp-partner.google.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[zhouhaikun5@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+];
	FROM_NEQ_ENVFROM(0.00)[zhouhaikun5@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huaqin.corp-partner.google.com:mid];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US]
X-Rspamd-Queue-Id: CC9D01A2A06
X-Rspamd-Action: no action

This screen timing requires a backlight off time of more than 100ms
from the end of the data stream to avoid screen flickering and red
light caused by screen material limitations.

Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 13fcf896ca832..436983fdd1139 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1935,6 +1935,13 @@ static const struct panel_delay delay_200_500_e200 = {
 	.enable = 200,
 };
 
+static const struct panel_delay delay_200_500_e200_d100 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 200,
+	.disable = 100,
+};
+
 static const struct panel_delay delay_200_500_e200_d200 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -2125,7 +2132,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
-	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200, "NV140WUM-N64"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200_d100, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d45, &delay_200_500_e80, "NV116WHM-N4B"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ddf, &delay_200_500_e80, "NV116WHM-T01"),
-- 
2.34.1

