Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1873B5711E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F18910E135;
	Mon, 15 Sep 2025 07:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="bJtv7tc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E717C10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 06:48:57 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-32e3726e2bbso940414a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1757918937; x=1758523737; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fiUtUPpKH3GTS21MnIohX80aiXP/6F0+dIepjp0LO+E=;
 b=bJtv7tc/Cp3YyaYUlujKbMxZvZIbiXrhxR9/ellgfQpS8ATGXg3Qq8wAFrEH8PtfYf
 GLAH/foMQuLHA2bDoy0ztBidI+QnxU4n21UR1Pj/B3jrSMYqJE06ulCTefs8v8dhtWnf
 qsLGDYEjya+PE5kQspUjZkWbDeb7qzz8kFSlaR5IQmxNSis44EkEFdhm9aX0TangzhmT
 23JhwME08XU+5+0IP+9gqJYnsQRKybl9V3pAp9ODCbXg+z6XqdTeaTbnmPSF8Ukeg+rp
 LjlWOl8dFH6N0WBhF5e4u9mgZ7O6Eaq1LdCqhnRt6Wy18CCpH6HMUdOA3ZMVMilz2HRz
 gqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757918937; x=1758523737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fiUtUPpKH3GTS21MnIohX80aiXP/6F0+dIepjp0LO+E=;
 b=nvSvYX11+fU0+aDWLRu8lZ3zqLFfSP6eKfhLTln5ESmAoSUUG30Om6B7R9nFCln03P
 NWJQ7ZgvC//nGUJedgGUk+CiK+UwSkfyZ0rg/fT41ZVufSSzB4zuZbEoe7Svo4sGExVO
 McvNtYT+HNUVaJtTCe3H7LCSh9CnoDHcTdR3H4dnz9dMSulCwhx/1pvvHBMx1dmJRHy6
 eQEWYS+CtsOarPqbypBaM0EIc6mMvbRPN3xs0DL7sp6JfaUSOL+YFV+1xSqGqN/Z8kBG
 dwVGIeFTc3HRT8YqvOWg/9DJjAC0c7wMU2eCTBN+VoOgMBDG1N48yVPgNFg/Te4Io/fz
 l+lg==
X-Gm-Message-State: AOJu0Yw2YZ/Zo0ZGWhCT6Yvgkjs24U0t6VpfE3eMlXqPam3BeA08WEQw
 mV8yyQ8MrXn1NBaOTEhx9VyZ0UGM1Y8IzuaIGaYz3D8tzDB5Q8F5o+9Yh6X4UhFQqS0=
X-Gm-Gg: ASbGnct4Rez88pNuQE9fl4bqSYzL2l8H2WpmspoJrCjM0b0txE27/byQOKnzqq4uogW
 fX8u17cKfC2snv9Vzn/X7HyxACaxVs2y28UPNe1MJvQAW2NFY3zCsDVxPVKbYnhLczWs8eLOsg9
 N+OBTmfe7vs3emhcvriPYm7+GIOXKLdlmW0SwK4glskQji0zvwSrDIPodHcN0oVoFWLoelRVobr
 rZzT06uXldseQy+PzoZCqh0WAjueOsHSq6lvAHLshG2r3BptBG+KnPezngWuEZvcq5XvKAPQC5J
 4J/Li+3SkK7DfkTmLr9n1CehYozZU1Qe3LU2HGkXMWAfEsn94StXwudt41AyuCUi8x/ogV6Qcd3
 /FDC0ULx6xoeMapW1k085P765CBgY43fZ2J2NntwGreFzahtOcVaSjZv8gVuGERktLD581Q==
X-Google-Smtp-Source: AGHT+IEtIy+Hi5uuKxac8S0s2Kwt21jsETnnkrvc/UZLJ8TEi/PCM+nYkRL0KblqTptdD8le+aZKYg==
X-Received: by 2002:a17:90b:1d0c:b0:329:d50e:2f10 with SMTP id
 98e67ed59e1d1-32de4f5cde5mr11445513a91.22.1757918937437; 
 Sun, 14 Sep 2025 23:48:57 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54d3f4d40bsm929084a12.0.2025.09.14.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 23:48:56 -0700 (PDT)
From: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
Subject: [PATCH v2] drm/panel: Add support for KD116N3730A07
Date: Mon, 15 Sep 2025 14:47:14 +0800
Message-ID: <20250915064715.662312-1-yanzhijian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Sep 2025 07:21:06 +0000
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

Add panel driver support for the KD116N3730A07 11.6" eDP panel.
This includes initialization sequence and compatible string, the
enable timimg required 50ms.

KD116N3730A07:
edid-decode (hex):

00 ff ff ff ff ff ff 00 2c 83 10 01 00 00 00 00
02 23 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 4b 44 31 31 36 4e 33 37 33 30 41 30 37 00 2e

Signed-off-by: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
---
Change since V1:

-Add edid in commit message.

V1:https://lore.kernel.org/all/20250912131104.1726775-1-yanzhijian@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 62435e3cd9f4..2c8536c64c19 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2046,6 +2046,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1212, &delay_200_500_e50, "KD116N0930A16"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1707, &delay_200_150_e50, "KD116N2130B12"),
 
+	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0110, &delay_200_500_e50, "KD116N3730A07"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
-- 
2.48.1

