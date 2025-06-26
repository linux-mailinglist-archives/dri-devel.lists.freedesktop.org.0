Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258CAE9D72
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 14:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE6110E2B6;
	Thu, 26 Jun 2025 12:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="OrcBkxkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2C910E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 12:29:03 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-748f5a4a423so671911b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1750940942; x=1751545742; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DlJYTL71/uAz1u7d/EHP8CqzSYQGGLACwb736n4vqIY=;
 b=OrcBkxkWctc4GNg6Z6l0tRE0kVMpYCjMO6CrdHzJDkoocm0LfjAgnTW/gh6zieGvIA
 FX/222s4zN7MtCMsMl7PmA7HzP0zFnejiwJP6b5TIe9izxXZHbMWIlfLhQvXhs7y5evf
 bjkP0rkvvrycinXSpdvZsU2Iy+OKnXkXYzkxpt/qhCv8yTwIegVkLGxp0MjpeY3Xd987
 0q5baojwdEKvI7fGQrBiTGPw6VbUynzIdmkV3SIUF46j0Q44igmPVqnX9yXH3uHWDbHO
 anLRdFRCkMbkTLQVnPbmPaSB/m9QSXHnPzGYU54/DTafMAavWYMaPXl5Dj1zRKWF1MF5
 VjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750940942; x=1751545742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DlJYTL71/uAz1u7d/EHP8CqzSYQGGLACwb736n4vqIY=;
 b=I4uGca86CDDMR1n4hsy4jgsLRBafvcR7wTDYKE3eA9r1LcruPOImUfrJUpgiPiSZYF
 kJwNMArw5NcDckX/Rc6PnuDFU8Tu42x8N2t6Qy7cxx0edHm8iOTMZZtSV6iijCR16o4V
 HtJt8rvE4K/2PYctK+kjw14lYEOaSC535QPU23ZIKwAkUcKs0OuBOdhBSK8k7i7T8uRo
 6ZYz9QLtyEOMi8xMjRt5mVzszls7efAYc6ZCPeZvMJYpOBlH0QAe4LumU4C7XJoNYU70
 Rd8h2OJCXBYEKiZGboSWlShmHd8u+JG+aZhs+uzsxmoUQklug2y4M+7EV164fFwRIo0o
 WASw==
X-Gm-Message-State: AOJu0Yw25HD+aESaVN1xOXSm04wYwXe+OMPPlNzIW3RiwcAP+1lQbVZj
 d1A0aediRVs80WeZ2IsNs+ik9YCIQo06GlOwMNg9omuWd34Spiz/scapj1LY5tVfzY8=
X-Gm-Gg: ASbGncsKhc7e6DvJDfXsuJ8+3ZAZqoJWYcs4s6s5Je7ABMfgz+G2HVZl+tnZGaIm9oH
 pYgkUYNSOTA/7F3QNf1baViH8Sxro3eHFn4pOsmAH6kZICs6wfINpPjDeaD0QT5NImfF3ihd5wU
 FeWR+18tEdW36gB9O5fN6vcYcwQ3hM9yES3iLnmYU5xZexKkM2GFmkpZ2oU+D9vNwvfgciy7eB9
 3csp0MdIXYpwE1LbcJajicmpJv+FMWAXZOw1oBttB5kptMepc9nFcJTaPRxV4R52KfWcP9R4VdO
 u2G4H/GjRnHg/njS9AzKfSfXbw50iQADaBsezQz1eMmKuMAQlx47VufvAopOHbJYtTQLSjMspNf
 7JOChJ/NoD2y10t7QikxwbWR+aWWk2VAVe5/2NXfC8EgF
X-Google-Smtp-Source: AGHT+IHFFcG/GMI0g35/DAzgIDspUjp27oCkusKnYgLyEdL2QPjdYyJLZIGQPZjr9B7yRsrrDflIiQ==
X-Received: by 2002:aa7:8893:0:b0:748:68dd:eb8c with SMTP id
 d2e1a72fcca58-74ad45817abmr10696205b3a.23.1750940942511; 
 Thu, 26 Jun 2025 05:29:02 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e217afsm7298432b3a.55.2025.06.26.05.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 05:29:01 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add CMN N116BCJ-EAK
Date: Thu, 26 Jun 2025 20:28:54 +0800
Message-Id: <20250626122854.193239-1-yelangyan@huaqin.corp-partner.google.com>
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

Add support for the CMN N116BCJ-EAK, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 0d ae 63 11 00 00 00 00
19 22 01 04 95 1a 0e 78 02 67 75 98 59 53 90 27
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
a6 00 00 90 10 00 00 18 00 00 00 fe 00 4e 31 31
36 42 43 4a 2d 45 41 4b 0a 20 00 00 00 fe 00 43
4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 4e 31 31 36 42 43 4a 2d 45 41 4b 0a 20 00 80

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6c45c9e879ec..3796c41629cc 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1967,6 +1967,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116BCP-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
-- 
2.34.1

