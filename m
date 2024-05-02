Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BEE8B9712
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 11:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9243810E296;
	Thu,  2 May 2024 09:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZrWZ6R+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0997610E296
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 09:03:38 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e4266673bbso69658335ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714640618; x=1715245418;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f4N8GU+d1mV2wTgjb+Tth4J8cXkQOLnlslwrqaEwJL4=;
 b=ZrWZ6R+e1N2wzPAK4YUojIQ8ZCeWzRyKxGrhQfO7VkSwEVK6YyDhcfcTMgxtAEEo52
 vGrEozFa2dDH2aAf5lITJjNcHzipAZsKFtcMGWpJnG4CA9KkVJ6nkKaIUjtPkFiCKfno
 09dx/0c9ZvLUyV3wmXRPbAYfX5pAEo9G7Dg7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714640618; x=1715245418;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4N8GU+d1mV2wTgjb+Tth4J8cXkQOLnlslwrqaEwJL4=;
 b=Lo+IawN3Xu5J8ud6Iys46MGHvbMhayhA3AzC52+nBahApp9NubtvJVmTkY9TW9Sbi7
 tQ1JfzrgNmbrgUTl0v28xh6DM2wjZx5T0igZfc/1wLXppHYYHBbBDWJfd3CVleK0fBRO
 HNCJqwajYmScxJcEXpd54mtXaGqsPdGLZQ5bldfVGEfs3bNOePp4UinLexstUWohT9Pr
 OFmS7MK1pPSoxDfA0ZvAcL1tsGESjrZvqFSH/O2o+7raOdWGW/z5nlN/azEUL8XUQR5W
 jv8gbCpH7MZsnDpLafFTsAig2YjLIVVivsiFfx6J8RRG9cE1KJTsA7QOXNvkBt5I0blw
 rU1A==
X-Gm-Message-State: AOJu0YwDx50WLsE43sB3K3zEZRZKJ0MidDhSBB8nqknsqeB9bC6HSmPt
 E5dbHapi4Tnk/hoK0tsw3HZPeit9OAqnmibDrzFpcGTfqIIxo2EAk2E6mxFLgeWPEfSnDQ0CkJ+
 LSQ==
X-Google-Smtp-Source: AGHT+IFRnWDNjDH+SOdNczIrPriuznm+C9bqK1WVko8EGJDcbadaa3IFubaLd6ulXbchx0tVQ9aiWQ==
X-Received: by 2002:a17:902:e551:b0:1dd:bf6a:2b97 with SMTP id
 n17-20020a170902e55100b001ddbf6a2b97mr5140711plf.60.1714640618092; 
 Thu, 02 May 2024 02:03:38 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com
 (150.221.124.34.bc.googleusercontent.com. [34.124.221.150])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170902d49100b001ebd73f61fcsm764983plg.121.2024.05.02.02.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 02:03:37 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH 0/2] Add TDM setting support
Date: Thu, 02 May 2024 09:03:30 +0000
Message-Id: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJWM2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE2MD3cS8Ct2SlFxd8+RUE8NEg0RLA8MUJaDqgqLUtMwKsEnRsbW1AER
 23e1ZAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
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

The anx7625 supports two different TDM settings, which determine whether
or not the first audio data bit should be shifted. This series adds the
support for configuring TDM setting through a property in the device
tree.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Hsin-Te Yuan (2):
      dt-bindings: drm/bridge: anx7625: Add a perporty to change TDM setting
      drm/bridge: anx7625: Change TDM setting accroding to dt property

 .../devicetree/bindings/display/bridge/analogix,anx7625.yaml      | 4 ++++
 drivers/gpu/drm/bridge/analogix/anx7625.c                         | 8 ++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h                         | 1 +
 3 files changed, 13 insertions(+)
---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240430-anx-tdm-7ce41a0a901d

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

