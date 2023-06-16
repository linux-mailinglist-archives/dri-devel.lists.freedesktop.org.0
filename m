Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424C7330EF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCA910E606;
	Fri, 16 Jun 2023 12:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BAA10E606
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:13:46 +0000 (UTC)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B378F3F84C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686917624;
 bh=jjkvjCGEAka4RH5igFy+6Ctmq+VoeIh047CD5mFgF2Q=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=ihpz2129s7nzWiWff+40TiX4Ji/wAWeYyb6POaPA1A55KCDg7ZIy5KzFKBXqM25M1
 3Ogj9cffT3syOdNeZARnUHiaNMF7D2CD22DaX9zAT9gHQGxTrUHtI0NbJTLVtuWjBw
 U3IsOl6Pr+i1paz42lTRxRyEmbA73Hlqi31K9H4kPoi/3ep4P4hf/QvxnELTQ0p8D+
 YWDIxiRtKdOoza7q/qPOUNDlw2OTrGp31XaxBQ5sBtgYpJbIgrqTgQWEr7LOa2d9bJ
 kh2rWfvlRX73AMA3pRQUGRQwq1MTqop8K1rI3OSMt80jzZE/eEGH+oG2RSfQv5yODD
 4e/iNTzO7lgkg==
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4f6275fdb9eso502405e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686917624; x=1689509624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjkvjCGEAka4RH5igFy+6Ctmq+VoeIh047CD5mFgF2Q=;
 b=dgBhNhH8GPSDRorRxWlAlvphtqHRX77S2vXVzSUggqL+SOCbvualQux+IPnxUh+v5h
 pTU6UPITMNwiskSXGKNQX+j78cAkk33nUWgmhaefbI/Fvswl7MBvYwUyE/8bgkb/UbxG
 KF59281+UTk3/+5x5GDhtSUpePezUYJA9ogB6HzxR/dU/wrAUiOBEq03/VaMoO/ywwjU
 +h/rsS2elxZerzPCu5MIeuYdhn/UosA66GYB8Wk00UbbJPlX+9DgGlc+pm6phQFGtAmk
 LJHby+H/lgoLs5yHks88yDFpjhnK3ExAr+aZDlv+92EtGObQPwjQmYP8C5I05A5ROrOB
 z6JA==
X-Gm-Message-State: AC+VfDwXNm2HKMh6JHxIsT5tOVJll5u2Jmf3J++FNTWXnllZDLQBIPbt
 SelnBuRmjZuXp5x4H9kwQd69K6qgUwRdyL2cYhVf3HIw4NhHk2ePJlOZYpHsFCqc+ZBvgftjK9E
 rCkwXTmvTmqSJvbGMtqzFaKRDybjzXMz4dWdXUor/gjmg+A==
X-Received: by 2002:a19:6d0e:0:b0:4f8:4240:5308 with SMTP id
 i14-20020a196d0e000000b004f842405308mr1048762lfc.42.1686917624164; 
 Fri, 16 Jun 2023 05:13:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ700sMZllYAWkxyIgKy/64sfYN91WIU+FJW9c47JxophbF/4xNj1sw9O0R778sGm02TsDe1mw==
X-Received: by 2002:a19:6d0e:0:b0:4f8:4240:5308 with SMTP id
 i14-20020a196d0e000000b004f842405308mr1048751lfc.42.1686917623807; 
 Fri, 16 Jun 2023 05:13:43 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 f13-20020a7bcd0d000000b003f7ba52eeccsm2047601wmj.7.2023.06.16.05.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 05:13:43 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: lt9611uxc: Add MODULE_FIRMWARE macro
Date: Fri, 16 Jun 2023 14:13:41 +0200
Message-Id: <20230616121341.1032187-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The module loads firmware so add a MODULE_FIRMWARE macro to provide that
information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 583daacf3705..6b2a4f8d6f78 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -1019,3 +1019,5 @@ module_i2c_driver(lt9611uxc_driver);
 
 MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
 MODULE_LICENSE("GPL v2");
+
+MODULE_FIRMWARE("lt9611uxc_fw.bin");
-- 
2.37.2

