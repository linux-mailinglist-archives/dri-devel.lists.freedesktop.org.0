Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E10A81C693
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 09:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F5910E13E;
	Fri, 22 Dec 2023 08:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8804F10E71F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 00:39:20 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3bb732e7d78so947197b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 16:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1703205560;
 x=1703810360; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FvBycHxiyxAxWwzvQi+SXabOjPJ6utrXr2SoxBa7h+E=;
 b=MV8q4JaPovJo6g+LwVxhEdE9j1Oa6N36KdTRiLQvHbD+Qj2k+YLLsfy3ZhEPStMH1r
 juRWJJBj25wKt+xKtBxYBZLSAJbK6e7UBYXgGvLiQO57dNfGAvoYFPcvHfWhON9SfACH
 HFZSVC/yHTe4u4aVU5u3CzVEGoNZXwflb/BfV50zO4KRsNDkG7Thh1t7+t4G9/iyMIlm
 nYRp5V3+BBF0L1xUyXvqz5x6tbDIjYXthFwR/6FkVSsbWLwXIOBzUdbQJGSoriFk3L4W
 obqQoQfURnzu0X926mS7oVttkSyz+20xA6IwdLC7AODlTdj9c1T7oAbvqtfjd1NOUksI
 9d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703205560; x=1703810360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FvBycHxiyxAxWwzvQi+SXabOjPJ6utrXr2SoxBa7h+E=;
 b=jKrv77WrfDCPfjuqy8Bo5vTN+JPB1ZxRM1dO4noSUE72FnIwrbGq9G/Ew18Bgim+UJ
 7Ptf21dEIeQJyQ8GjXaBcWZueCiTajBEz4JPUBoJDXz5GNFNtEln+ovlFJeQuef1vmps
 v3JeBteuTedcpv0WNR0J2eZVHLA1T4XIq3ahxMT4WpgoQ4yj3viuCapnYgBdzgCNhi5e
 aMQkQNixlhBM9G2Bd+mNIYKClm2tG5T3kR0mS8L3IYmUaF1QP0PsdJunNbhMhTiqKNQ+
 MHcp2WbN8/VlrJbVwzrJkLOUED42vbdJRExe4RbwRBUbCrccnc0aw/qOt9wPBBfz8YAv
 kDmQ==
X-Gm-Message-State: AOJu0Yx65KOa+jhDb0FlkAcWkTWilo0VPoaNuKqaEYdSqKbiaSIgH8eb
 rzHe1QHqe5eQZ5zR07FUfW7gz7y54jwl
X-Google-Smtp-Source: AGHT+IHQRIskVW0NcklyqymEhtyN0B0USfhteB48zp4ZQnVTXipQ0h15Ru0U5WO75hizH8cS0jSgag==
X-Received: by 2002:a05:6808:1303:b0:3b8:b063:6665 with SMTP id
 y3-20020a056808130300b003b8b0636665mr481640oiv.92.1703205559750; 
 Thu, 21 Dec 2023 16:39:19 -0800 (PST)
Received: from localhost.localdomain (135-23-195-66.cpe.pppoe.ca.
 [135.23.195.66]) by smtp.gmail.com with ESMTPSA id
 fv11-20020a056214240b00b0067f7f73d632sm936651qvb.138.2023.12.21.16.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 16:39:19 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for GPD Win Mini
Date: Thu, 21 Dec 2023 19:38:30 -0500
Message-ID: <20231222003830.3733310-1-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Dec 2023 08:27:45 +0000
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
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3d92f66e550c3..f730886ae10df 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -279,6 +279,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
 		},
 		.driver_data = (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Mini */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1617-01")
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* I.T.Works TW891 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
-- 
2.42.0

