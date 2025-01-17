Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B35A14906
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BAD10EA49;
	Fri, 17 Jan 2025 05:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ZQ0kq8Ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF7A10EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 05:04:18 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-2156e078563so21777325ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 21:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737090258; x=1737695058; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9VXIW+/Ah0bfLKo43QBBwQ3IY5mJkkpC11skIN3TLZM=;
 b=ZQ0kq8IpQUftoWBchtveeF0zwpm/o0qp9KvmmUTz6GaPBMCS1oOLwN7SJq/EMsgXQ6
 wseh1csOqFri+A9FqPskGmAZCFyQ0VC5jfqBvDBlk2B2xlHLS1OWmCysRUqnnSM7Uyxg
 F3pSbFxg5jpwLol0mlU3bLGKp2VriWI4QXiJE9lZUVp+g2aOerGJ9FPPaOPhsL7lKKtw
 vWZLJ7+B+CYWqsM5JbfZKNpAT3VjSSEFOfKIr5JsGsgsd7H2J3XHaiUMpO2MLdShKlm2
 F1ICqiHmCmHY0wZU75zKRK3MVU2a+KWymyGrFevQHWpH3SCDMiS+FjRBkx3ORZdah+l9
 ekTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737090258; x=1737695058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9VXIW+/Ah0bfLKo43QBBwQ3IY5mJkkpC11skIN3TLZM=;
 b=ikT5jbLjWxEE94er8H4zZI9Qpn8ctWTDh+m7JDT0fkjU0SyzEXUxrjWn6qMHVgXgtJ
 XZq1fFGL8mRhLO7PiRzTXgGd3wzdUle52G1vDx9qXbSkfADowR5bouNL3vL1V5ZtvhC7
 I6sImGQUI6XQAqGjfFMtiQrqYHbvXPyqGX6NfzqhPwgDm0q1kz3M8/EWIQMCNuGEKXxE
 DdVWz4jYlxAQqVtUu8ZA7w6Q/cr0gbSY9l/vQ4kBUymz7FVHilt+0WTpwAPY79ARyISb
 r1SXrJy4K5rcLZ7F12cR/u7i1wwn2aRuYexVBSG8V2FZrpk8FP5/jCAT3vHcIuwW7+UF
 4dEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoNpNyugTrVUABjFx0db9qG6rwci7hE1FwrbV7vB0ivokrWmBRPWiYd6U/zeC/XZwIxVAnHrIvYr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPt/NWJ+lVjNwhRKRdWnvA1qd4gzuaFoMlGRRjpN+0FfKkyEyB
 N6w552Hq4aboWCSU4pzuu7PPK0sQZTykM+4wBiVnRBluwkPOE/oFVqBQTfVqPTo=
X-Gm-Gg: ASbGncuPd+UGPj2poXiWVlQ88EO5TZbrVMomjFTp1tl4mGJepMP8QNXRnVTIrlmCJpD
 1gMi7Vi0nYFPY2v9k++PmPkiEehNgAJ99+ubxMwrSCvAyt45dKsZSiOuNPm9dPAdaz2522mH9/S
 T+0zEc6B1wbqEuH+bZFTM3VgSjiw6KSaZMx9ILln7TpmSphC6tg3rDraRykKv4w+c/+XBv0Y+dk
 hn//VuMhE0Ed9sCf13+Gs964o8H7MDWhQACgXHInXv1mlwYA6C2/kDfRrtZZQnpddDuPoM4z8yY
 8CmdMzesHto82iWHrk2WVnI1VKId
X-Google-Smtp-Source: AGHT+IGX9e8El3Mzccfzdgd1zOEDd19niEPcwNlqnE03+mia0KvaJTcH+Y6/G20qZe4tszo8kJe58A==
X-Received: by 2002:a17:903:2282:b0:212:514:b30a with SMTP id
 d9443c01a7336-21c353ed2b9mr25013635ad.12.1737090257746; 
 Thu, 16 Jan 2025 21:04:17 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d404303sm7667705ad.241.2025.01.16.21.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 21:04:17 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/4] Add kd110n11-51ie and 2082109qfh040022-50e bindings
Date: Fri, 17 Jan 2025 13:04:10 +0800
Message-Id: <20250117050410.933312-1-yelangyan@huaqin.corp-partner.google.com>
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

KINGDISPLAY KD110N11-51IE and STARRY 2082109QFH040022-50E are 10.95" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Changes in v1:
- PATCH 1/2: support for kingdisplay-kd110n11-51ie MIPI-DSI panel
- PATCH 2/2: support for support for starry-2082109qfh040022-50e MIPI-DSI panel
- Link to v1: https://lore.kernel.org/all/20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (4):
  dt-bindings: display: panel: Add compatible for KINGDISPLAY
    KD110N11-51IE
  dt-bindings: display: panel: Add compatible for STARRY
    2082109QFH040022-50E
  drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie
    MIPI-DSI panel
  drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e
    MIPI-DSI panel

 .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 270 ++++++++++++++++++
 2 files changed, 274 insertions(+)

-- 
2.34.1

