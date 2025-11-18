Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69383C68F18
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 11:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583E310E17E;
	Tue, 18 Nov 2025 10:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8uGz98i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4786B10E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:59:51 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2981f9ce15cso67596395ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763463591; x=1764068391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rL9rgwFbswl+c0DClDLGLy0gAc4qUP5ddlMm1DHepnQ=;
 b=h8uGz98iETDSwO6mTMRWE3yw8YxF1H9kFb90HK1a/a2F23+s1GqZoig0to01haOHdZ
 Hf6/wuuU0T8Wn2rXcFOdXZGzzoY+QrJE9j/M3kcqpDKC/Rsvj1JVEu5y9JeZN/2HSI15
 VHSXmMSkBBSY1LAb9C9N6aa4sAle2LCnnnxL9DJ5vyLPcQZhm1uxV6VVqrZ/BfigCKZW
 LpzTiNsje/oCcefeUC2FcOmyOky8GFoOH9Qo7nTx5UCDfl/J8z5moR+Kl56/E3XSNmQo
 U0Gm28wq5maBDXDInh0bmuy9w5/C4njNwARxN5X62jLWUIhvLaUUpOJurwSOBUqSXT8b
 lMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763463591; x=1764068391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL9rgwFbswl+c0DClDLGLy0gAc4qUP5ddlMm1DHepnQ=;
 b=GW7C/oKNkkcP1lBDqvnNFpESttnkkKT2ZgSvpxYuqwLtw0IdWFPDPuAZbAUuD4kjyL
 0AGB6ayLAAEC2EVGCbzZ64AsYmqq3lr/0d+HRSH48SWuf4PI5xNSP+kgCyGIgrq60AnD
 WPTACw4QzeSrDU6QIEVrL9vbPi4NjkYZAATu6mRVsIq8dx/2EqglX1R7NFi/OQSLPJlQ
 y14vkaR/yfAQWtdTCgnDQ4IJPN32Eii19jfHpP5eiS21eXkjILtjDiyFOnYqLboFMK+8
 FwYTkfpZRyrYy3cPheQmLkrbFn0a+7IZVRWVjgpOGGDn/cYfKZ/TLrNaz/Qmqd2zZkuY
 SfWw==
X-Gm-Message-State: AOJu0Yz5uKUOiURMBkaMWnoy5fF6JaoisxoyVBhy74K9tzd8uajtMqfn
 6v5Zocex/FaFhmALNB8mXCNeH6YzOksUYo4NR1zYse0EXC7S9iffc1NU
X-Gm-Gg: ASbGnctR2LJTxQu5nW2P1eqzAQ8I3L6y0XLip4fpUR8Hme5l4QANfwjqFyy/uqZ3lRK
 +wXkgr09l1OLTIERrb+RKAYQgEOgkrdjxHS2UnGrWUHpY09avk4xFJl0cjJb+DQCwMB4/zs2wo+
 f+IQ5pIv0m4pDVuTx1oDGKkbNLZDHtBOWW6dKp2FQn2BGWQ7DkftRawaDyh21SoR6J2DfLizC0S
 SSN6qKv7arKWaZ954/EuL3eyIQMVFQkmBZpdgovaK6K18np48pMlfBTmMtCEpPq/W6vVrlHYnEK
 bt7Shag0FNWL6oWK2d3hp+AJwNW/qSF30epIh8EOMr6PyrXotOukjbnBy9eSOXA466JCYq318LQ
 6ahU58+ykXQQMNfaGudAemIJW5iNGd/l3yAky4NQvPLvo1anx50e4aEs6qH8Du9pqWPMR9N0XtB
 X8MAKOPzsaVOdUdL/mIeKEd+hL
X-Google-Smtp-Source: AGHT+IFjvpLEePrV4iOmblr+NCwHaK//66OG3ahZppi2Iic31WKlDUiu+vTh09A05zqzf3A/p/KLKQ==
X-Received: by 2002:a17:903:88e:b0:298:29e0:5f32 with SMTP id
 d9443c01a7336-2986a6bfa0cmr131254105ad.15.1763463590549; 
 Tue, 18 Nov 2025 02:59:50 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c241f89sm168012035ad.28.2025.11.18.02.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 02:59:50 -0800 (PST)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rk0006818@gmail.com
Subject: [PATCH v2 0/3] drm/komeda: Convert logging to drm_* helpers
Date: Tue, 18 Nov 2025 16:29:31 +0530
Message-ID: <20251118105934.748955-1-rk0006818@gmail.com>
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

This series converts Komeda logging from the legacy DRM_ERROR/WARN/INFO()
and DRM_DEBUG() macros to the modern drm_*() helpers. The drm_*() helpers
take a struct drm_device * and allow the DRM core to include device
information in the log output. This improves readability and brings the
driver in line with current DRM logging guidelines.

To support this conversion, a small Komeda internal header
(komeda_drv.h) is introduced to provide access to struct komeda_drv
where needed. No functional changes are intended.

Changes in v2:
- Corrected the use of dev_get_drvdata(); it returns struct komeda_drv *,
  not struct komeda_kms_dev *.
- Added komeda_drv.h to make struct komeda_drv available for logging
  conversion.
- Split the series into 3 small patches as requested.

Rahul Kumar (3):
  drm/komeda: Add komeda_drv.h to make struct komeda_drv available
  drm/komeda: Convert logging in komeda_pipeline.c to drm_* with
  drm_device parameter
  drm/komeda: Convert logging in d71_dev.c to drm_* with drm_device
  parameter

 .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 24 +++++---
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 +-
 .../gpu/drm/arm/display/komeda/komeda_drv.h   | 24 ++++++++
 .../drm/arm/display/komeda/komeda_pipeline.c  | 61 +++++++++++++------
 4 files changed, 84 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/arm/display/komeda/komeda_drv.h

-- 
2.43.0

