Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD71C56BFA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD9B10E7E7;
	Thu, 13 Nov 2025 10:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VN5oVOhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3579A10E715
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:06:39 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-297ec50477aso4306075ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763028399; x=1763633199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tYSrKGa1rNdgtFI/Qoa2b1aIEVZpmii09qZSfHx++jc=;
 b=VN5oVOhD3DgHXjHnsQvRdDNrU4K3nVAz7/hIKblr9lBNCIpsSagjdUpfD2ySUa5xcd
 oti+Bf4IH2F4BNwCCuiQp+tyMGb1uKn1n8P3TV+BAaThf0YPrK/NLtPZXJyFVFm/94Wu
 lrLFVLnHAkAR44ZfAuNUWuKR58CmXFdQz4e5IUfb5bTVBjaP4xvlwqtt8gfdNp3Vkwpg
 6GjcPmPKINTRQbNTwmQLXIBSDCtKIWxbAdoYEqvlOyhIjLFnWSyGwHv+OB6xv6Z1q1OV
 Kpd9sc3PFvLqZ2Hrslxm6Wx3cy0AG9eroY5hvgizQH0wflya8aHgSVSirrd4OfKk3VS1
 njOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763028399; x=1763633199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYSrKGa1rNdgtFI/Qoa2b1aIEVZpmii09qZSfHx++jc=;
 b=CJ66oUeLvBzcbpaBXJnsl7Shy9OhyZgIoc+YtIwlpiMrIOYKerw2t2fmnoexXDQVc/
 Rj2s63OOst0Y8CwF91jKGPmYhKuVKzCSDfbgzko7kI1AMRWOEaYeB+ZjcuXfRFOwR3ze
 5/05rxtjA36q4wvybaldIgSjnOY1O+38WEfHYU6wEY9OrH3qFiJ1LffCQdY5mq9Lg8uw
 ecVFmR7q5kr9NQpISook9EZpzIp+uQjM+qn6GLfDaB3hr/uMdPiue/1ll/cPdY0n28Y/
 h8bO/NYVM2xj1BpXiauCvpPeOQ68tl8hJlN5EIGQcMxj6NM0PkJ5BApZDpQ/XVHR5G/e
 evXQ==
X-Gm-Message-State: AOJu0Yy/LpxHqQsu2ZmSw8+Y2bq5d84m2gU24ZH4TN35vU3tqft7R1Sg
 /8BgBh34C5RiCMAuhXXc+VxDXB65OHUnPegV5eoWWYm2H7uKmz9Txa+pEyurqK3d
X-Gm-Gg: ASbGncvhd0MkjFRzHVr2Gb8rUhR8ce53X1EzxH7NCImVDxr1jgnC0AfELpuPa7nKE/B
 q7LOo9ZsFSxlazg/J9mniovZBHsez8ADApQ+9FpxZRcYTE6jchB+7Ya1kFq3DXcVPf5Uc1cU9Ag
 QocOCv/iwU0uMdxWU7s7YvDGgyHbRdXX1hSjpia5qipcZzuW32UMUyLFhjFyyM2p4FrwsWcQwkB
 WZgo8JDUSWp9ofXl0MYdEPsEWuzYSLIZDqGVs2Jq9g9EZ57NOSw1x2zjME/xCWUY3/STfOaUWA6
 vs7Z7trKoO5TNhOFWWz9ughAl73Xz0exfy5yMqCnTGuJoniInjClRiON8njqr2SvzMg2GyOM8tF
 NU8a7bCT2cawklVdGsxHRZl4k09Ap1JevpI0rNaQhzuZAwohNoPM1MDoLrlkS5UwcHY2Hs4qoJt
 Kz/IiQvM+Nxp/XULWDauuJum2jh6E41PtNylBmzhE=
X-Google-Smtp-Source: AGHT+IEEyMa9j30aX/mgMTS2wPaz/NVQWJWp+CviAg7X8u1EOXR8+UYWej9l4oKIwkJIk81gGTVEPg==
X-Received: by 2002:a17:902:d590:b0:297:e1da:6fd6 with SMTP id
 d9443c01a7336-2985a4ce247mr33677335ad.8.1763028398582; 
 Thu, 13 Nov 2025 02:06:38 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2bed23sm20110235ad.87.2025.11.13.02.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:06:38 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhiraj21put@gmail.com
Subject: [PATCH] drm/komeda: Convert logging in komeda_event.c to drm_* with
Date: Thu, 13 Nov 2025 15:36:23 +0530
Message-ID: <20251113100623.162327-1-abhiraj21put@gmail.com>
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

Replace the DRM_ERROR() call in
drivers/gpu/drm/arm/display/komeda/komeda_event.c with the corresponding
drm_err() helper that uses the existing drm_device parameter.

Using drm_err() allows the DRM core to prefix log messages with the
specific DRM device name and instance, which helps distinguish logs when
multiple display controllers are present.

This change aligns komeda_event.c with the DRM TODO item:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_event.c b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
index 53f944e66dfc..78a4a78d1fab 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_event.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
@@ -148,7 +148,7 @@ void komeda_print_events(struct komeda_events *evts, struct drm_device *dev)
 		komeda_sprintf(&str, ", pipes[1]: ");
 		evt_str(&str, evts->pipes[1]);
 
-		DRM_ERROR("err detect: %s\n", msg);
+		drm_err(dev, "err detect: %s\n", msg);
 		if ((err_verbosity & KOMEDA_DEV_PRINT_DUMP_STATE_ON_EVENT) &&
 		    (evts_mask & (KOMEDA_ERR_EVENTS | KOMEDA_WARN_EVENTS)))
 			drm_state_dump(dev, &p);
-- 
2.43.0

