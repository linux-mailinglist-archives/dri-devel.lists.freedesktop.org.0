Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EE3934B73
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD2010E70A;
	Thu, 18 Jul 2024 10:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="Pt0ZNOcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E2410E039
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 09:39:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1fb3b7d0d56so36352585ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721209170; x=1721813970; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=udi6vuEL8EfSoejC7wROBHfbEhYrKfbRvcH4IT6/Cfo=;
 b=Pt0ZNOcPFFBRF4tukrrHwZP+XyHlQP4ODWm00QHOM/AVvRXKOj3RKdPT45UitE72jt
 Sma+bIPYoEpXfgj3q62wKNlzWa48VtlEUWQ4s9/R1JzrmxqlCSctb+46btw3jkbaMnhZ
 rRlAhb4+TqmcPoolOvcoqqtlnoyxAsMb0F7aJdwqhpavHzYIFwlIfb/mH7qGW4k51XH/
 PanCRpzgHfc0g2nntjYyeFGqgcFfN/sgRqUshSZUSaYw0v++CeEZP2tnBMJENBciieEI
 HrXyUxC00nIMI9xgaVcWwc5b01WZYgr7EhN5kHFv1mvmVUim6wE0rP98O3iWAqioiutd
 5O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721209170; x=1721813970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=udi6vuEL8EfSoejC7wROBHfbEhYrKfbRvcH4IT6/Cfo=;
 b=CXnPzOS0gSCrPbQS/+CeTDrfplIjjj8999VFtCHETwI5oJtJrLYEl+sPS5ML2qZTXv
 c821I8lpE/OMabT6i/0Me9kpUxddy98jAhvmK4NMLWU9Z5D3XqgRO3xotmBORCs0l3o+
 VWNx4okvtAPCTWPvCQFLBG6HtEYlLBn8S25gV4RxN9I462DOy45sb9pSxMWaCqk3jWGs
 w5+4CPcE//nvtU2EXow3qyXgUWUNb4ZV8ODyQSDDtz5OwysWwonbAntiRntW7+4Iuxo+
 QFuduiwPhxt1XdtsMKeE/qTRTtiHkqalh3v5xIRsSAWaDOPM1SgAsCcY+7d4jHXbYqlF
 xCOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9nfugva5wjRgCJw4uq9RL7jOlfRs8Ya9sjnnfj+bB8H1yqr7z5MKVYETQlTYMkjZLMsNJ6KJ9tvC6ie+zZIpFgKj72W6qgvtotpLBxgC4
X-Gm-Message-State: AOJu0YxSK/J7RW9Fkr7PdXNR41g3lPY75Fhz3erRBJ2w/HC35ncgkKw0
 nq6E/sGxFZ2qTi5BAhPURu2u38FmGk/CHlgcfn39t3MNQ8sQnB3gc7N/RO7hRdw=
X-Google-Smtp-Source: AGHT+IEAwPTOPdboUqTGUd/gpnnVP+Cf23wdFQDk+oEjHsSJVsdqw+rn5rtdH92Al63psF5p75j6Wg==
X-Received: by 2002:a17:902:f684:b0:1fb:358a:2f65 with SMTP id
 d9443c01a7336-1fc4e1500c1mr8894425ad.37.1721209170382; 
 Wed, 17 Jul 2024 02:39:30 -0700 (PDT)
Received: from terryhsiao-Latitude-5490..
 (2001-b011-2016-5634-6781-be1d-335b-1af9.dynamic-ip6.hinet.net.
 [2001:b011:2016:5634:6781:be1d:335b:1af9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bb702fbsm71628145ad.28.2024.07.17.02.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 02:39:30 -0700 (PDT)
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v1] drm/panel-edp: Add panels with conservative timings
Date: Wed, 17 Jul 2024 17:39:25 +0800
Message-Id: <20240717093925.3017-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Jul 2024 10:03:59 +0000
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

The 6 panels are used on Mediatek MT8186 Chromebooks
- B116XAT04.1  (06AF/B4C4)
- NV116WHM-A4D (09E5/FA0C)
- N116BCP-EA2  (0DAE/6111)
- B116XTN02.3  (06AF/AA73)
- B116XAN06.1  (06AF/99A1)
- N116BCA-EA2  (0DAE/5D11)

Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f85a6404ba58..ac280607998f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1845,8 +1845,11 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
@@ -1901,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
@@ -1916,8 +1920,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1156, &delay_200_500_e80_d50, "Unknown"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115d, &delay_200_500_e80_d50, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N116BCJ-EAK"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116BCP-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
-- 
2.34.1

