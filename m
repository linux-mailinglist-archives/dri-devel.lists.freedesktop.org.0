Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D405AA06E8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 11:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF78410E2F9;
	Tue, 29 Apr 2025 09:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="NF3h05+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8803110E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:20:37 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-739ab4447c7so705375b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745918437; x=1746523237; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvaliSErUYZ24zOy24oW0l9inFOug0V/EfItbz4+qJY=;
 b=NF3h05+8dIlIrH9Pp0Y+RcVyF2/m4ljcrrqAX9xLgCWPbBCCk3G4zkqdMMBD/AgBta
 ArMfMDvLkpUBGEvJnJ6KUdIuyl4gq/m+2conom1fCu0TsMIqZ3ZHBiBZvItTRfaeOlNO
 a2bwm7ib4hIRWkLtaGI6P2+FCyEjiBAhz+DA8gN/DNYpmkrTEad+TGZAbV7FwjzWuyvR
 gQG9Ky6VLEQC9jlW4JEneVI7OBVdDRoO7pwwIV2kludf1rtUOOSUlmgWLZS0cOdIf7LN
 0dVphHhMRxMekwODcB3gRz0HEMJ7IaYYjZ/FVjx4SLJo6h2NpWwOT+tZCq2CMH1+akcu
 +wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745918437; x=1746523237;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvaliSErUYZ24zOy24oW0l9inFOug0V/EfItbz4+qJY=;
 b=WRZBDJrl5+Q29Rx4R0YkvdshGgMAmXpXRfXfjhwuRYqH4hHGWxH8X+Pcz7TibhoI4Z
 uvgCzOi3c9H2dncLu6FJLAOPxa4ao2c1oBp9zKMC98MqYllXM70LiaIEILhRhtqN99M7
 Ro7UCT5FFfP/DXe/PQP2Muucb/o3QEJdVWTX8d1+y9wPe05T3MMW73bSQSVR1aM4rE0c
 VN8tO5XmfIWXzrZIV/X2DiAMGcic9hP6bVoCWgeCx8KkGD6rhu5qMScrD8N9Crj3ugUV
 ylkGoCG1x8ZF7jl8w4GSKWYivZa+Gzd+siMBt7EpGKSYMgZ4v/lgTAstRlovAuld6HjB
 JemQ==
X-Gm-Message-State: AOJu0YzaDEiTFuRrDLdjj+kJCTgzvRK7PN9h37QZc3JLADw6XVNWPEB7
 D+LPP6uaNtNgWiSDkxyn+yrrLOGld2k3z3eFmeQ83VAAhtTrSu3thtTGPfZduPLq0IEMOz9aAd2
 yK5aGUQ==
X-Gm-Gg: ASbGnctlxtpk6feM5P/XnYbwufUPQwuuiwkWiH1Ext9kUTGNAh3GOmlsgEo5jTmk0fs
 ZWBbVgqgJSU1Q+p0Z7FkqhvV/7dfWs0FOySlFbxIpvpzS0H0r2FuWS3VZ3esHOirNOOZ6Oxaxv4
 iH3RJt/Le6JU0zRNwdQRuWnBQ2K30bSx2A7Oe3yN+ebT2zy3UzEEufBU3xDTswhaYUIHNjSTnOJ
 x3g5Ucyg8F4FfalY5uvHUAFcSrMhslRp302lzDOdlMnBXPya0/fCyZVreZNgOgR/rxjWBtYMlGF
 wOxuXCjHNwi4a7MKzyyFCnrgdiOUGcJ5qC5XZ7+Izwdjb9Df9somhlzB7rmF/5dQud9IA7UOsA+
 Lv6sJbKvQhmKm78g=
X-Google-Smtp-Source: AGHT+IEV5ogys0l2vXW3zP5HCQ1ycfry815W3wpmmpb0QJkuLBL078T8CYF88qMpcAKeaw6hSxPNRA==
X-Received: by 2002:a05:6a21:1349:b0:1ee:d047:ec23 with SMTP id
 adf61e73a8af0-20942f162f0mr1518908637.11.1745918436818; 
 Tue, 29 Apr 2025 02:20:36 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 02:20:36 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/3] drm/panel-edp: Add support for several panels
Date: Tue, 29 Apr 2025 17:20:27 +0800
Message-Id: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

AUO B140QAN08.H
BOE NE140WUM-N6S
CSW MNE007QS3-8

Changes in v3:
- PATCH 1/3: Sort the list
- PATCH 2/3: remove delay_200_500_e80_p2e80 and Sort the list
- PATCH 3/3: The test timing of hpd_absent meets spec, don't modify
- Link to v2: https://patchwork.kernel.org/project/dri-devel/cover/20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com/

Zhengqiao Xia (3):
  drm/panel-edp: Add support for AUO B140QAN08.H panel
  drm/panel-edp: Add support for BOE NE140WUM-N6S panel
  drm/panel-edp: Add support for CSW MNE007QS3-8 panel

 drivers/gpu/drm/panel/panel-edp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.17.1

