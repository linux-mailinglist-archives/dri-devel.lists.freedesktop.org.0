Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25EBABE5B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33F810E519;
	Tue, 30 Sep 2025 07:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vsN7hAVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CCE10E519
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:50:56 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-26c209802c0so59195025ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1759218656; x=1759823456; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0RGErcP5iIWaAYOH1EdzfokXK7+mdWRIaYg5XseTui0=;
 b=vsN7hAVU78lU5TKW2K1yc4Po7OuC4/yWSWY6I3tf4RRQX71iOUaUcCGPJsFm3eSheY
 aK3Cvlj46+SPlBiDOokHsaIbNf4/D2aXwc9Xr6dUbgcZ4v/pGCRI0xWwjIn6lzq4Ud3e
 hHYm5CWJtjegPUCGLSKNrSOVGbcdETjm0hZeYiZiLXecewM6a8tsILfdut9R823fPlrN
 6JdGhB6b2lyPgBn2TTiKunuzyisGrwI8Gjyivw0dVJSjqQE7rljWMF+kevBK7ghgLKCx
 3e+qaCnOtKT9vGAZViLnBnZ9RVvOB7a5iSrgbdsCmNIMqqCjWPC62ltMJcsdRdi6THC8
 r4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218656; x=1759823456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0RGErcP5iIWaAYOH1EdzfokXK7+mdWRIaYg5XseTui0=;
 b=Q5CcmjwNBy4ctdkObyRK0CF0X0lJfiY0q37yqI8QI6XFYHhcsfehO2cXvEx2hYliHt
 ofuYxVPKm2b4zu4OilpJgNWMRwAFGLSq9LsKJ9Q9e+p3rCJesYTuEBN5s4Nb/B4ZvOTQ
 2RAwzOZFaCDhWe9oOsxY6wscoMcUwZ1FaY4HuYEW2xbl2xFL8y2sdjT/+NkYkCTaens0
 Tf4vPhq1M06cqbQuRCPWrqx6Aj/zvXIccJz9aq3C0MDu0GNY8lAEctT4mpEDThL1kyMk
 tQLNYU0fgxl+Vz7h0Zm76x2IPUQ9F7zCkkOfUSI6HSb3DHOr6aUzqmGGTHAGyPqVTuiC
 PR/Q==
X-Gm-Message-State: AOJu0YyZILuRCppiuFz08+t2t7x4YRt19RAjPc+pZBQQnRYs4HdrVXvH
 RxQuHVC5bfsZM0MkH53n4KZ0gZXSu7tjk2iouGAiPVOyKbFzUZkGnD4cttcKDsK8Mmw=
X-Gm-Gg: ASbGncv+WXh7DnlZMWCaXD6FgBBTtemh2NFkOj1Flq6DL8v5spM4VlXf+a9KGnIpyQX
 R5UnPLsw2M1V9fvyiWaJXdy0sMF0Pp9xfw07TXyUhYZPIMFvjz5epQYSQnFUxBDEBVKcwAnZA2q
 WJNbefy/Si3bQUE4Qmb/1itP65u06EEbdY+Gp9Q2k2K1bmMkXF+rPsTJKMCxCOYwqDN2BM7aE1J
 ZxpmDuMHosRzgpQbM3OJgyv2hPIVUfc7EG6HD+M06onYwvaDfv44NGuGaZd27aA/XUs95lCpX4i
 XSCq8rrAra/2U5aBFBf9Y37bwrNe1ooV/OmUaJYm0nTrv0CT4WcE+DR0JJVbLxo2TySm3iuh891
 RlwCPXOniucvF4s3FgseCOximq9sSz+Al4+hloljHMaz+fP+uGqkiPVS9/ixyFlrVmsHtUigEJK
 d9OxlwA/kwgUvp1pZaA6HX8iW7a/hk
X-Google-Smtp-Source: AGHT+IHkjlHtYzmiPHDe8EY7GT2BmQZoEPe0VhhME3S6IElawm+J6e6S+KLLCXGrXpgMSliALMEWUg==
X-Received: by 2002:a17:902:ef44:b0:246:a543:199 with SMTP id
 d9443c01a7336-27ed596f868mr225436925ad.54.1759218655779; 
 Tue, 30 Sep 2025 00:50:55 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed688223dsm152313565ad.86.2025.09.30.00.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:50:55 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Add support for Tianma TL121BVMS07-00 panel
Date: Tue, 30 Sep 2025 15:50:42 +0800
Message-Id: <20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com>
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

This patch series adds device tree bindings and a DRM panel driver
for the Tianma TL121BVMS07-00 12.1" MIPI-DSI TFT LCD panel.

The panel requires multiple power supplies (AVDD, AVEE, and 1.8V
logic), an enable GPIO, and a backlight device. It is based on the
Ilitek IL79900A controller.

Tested on a MediaTek platform.

Langyan Ye (2):
  dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
  drm/panel: Add driver for Tianma TL121BVMS07-00 panel

 .../display/panel/tianma,tl121bvms07-00.yaml  |  85 ++++
 .../drm/panel/panel-tianma-tl121bvms07-00.c   | 419 ++++++++++++++++++
 2 files changed, 504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tl121bvms07-00.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c

-- 
2.34.1

