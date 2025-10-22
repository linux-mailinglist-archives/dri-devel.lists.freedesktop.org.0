Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B61BFBE86
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DECB10E778;
	Wed, 22 Oct 2025 12:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="nfiP1ZBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915E10E776
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:46:37 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-78f3bfe3f69so5955893b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761137197; x=1761741997; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DYmui300xmsOqVGhM5Jgeku6egbsvMIV9ovTXTcHC2I=;
 b=nfiP1ZBi3cBiqdhnqNP8O5PkG6iuen8n1nTz/i5iJLyJRr1L6I56RE6vFC1pAhqs4A
 ZRl+iw+H5jM3MmmzZN5SRwTP7Qwx+fBrAN+8U0juBIAq6ovu0atFOlJelWuPc2sDfP/s
 8ZQssc/G0RBi8fmW6rQC8wsRhdmbCx0L0DJ36DHElVR9kvEG/DcZBEn2gTmH2MX/lout
 fsYhp3BR7clZbi2jIWoebjloWF5+i0Ck/pD13+mQYefAkI3LwC/2iyvM5i/L0DHyyYKf
 k0k8Zf3VJJhqIvnUDN49+zNtcBd9Y5fAN9sI+jBkB4eGYv1Pr7v+7IyCrLg8rdOeCnhy
 yxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761137197; x=1761741997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DYmui300xmsOqVGhM5Jgeku6egbsvMIV9ovTXTcHC2I=;
 b=no0o3UST8xYl5y0HgKmc9W9pIVy3qWwv4lXowJ5vWTCNRVdJ7ZOOFSPhItpF2mxDSs
 8PIw1AqM988/NmCsRK7PeMpXcRwzkr3QEnoINdzBHEOuVACDifA6INpN1iLdaVEsOLEW
 EJHD3YvVp71Secpp6hwX844i+MnXsAwGpdfakAqZ2m7GmYl1hygmfOBw0t849EqMbyF6
 0LH2u7GP+KIDJkYoCBxIWowpABIgSM3xznKs9W4c+qAhobilO6dXD1looWiufsmU77PT
 3MKwwXA86YI3f6HJEpdAji4CTG2t52ZeFP5S9UugScxJSbGzJkoV14Ot9/nJM7iVfVDv
 T4Lw==
X-Gm-Message-State: AOJu0YwhJYnfvKI+thrPVgbJ9h+0TLgNRaH1BxEK3xcPqlk5wgUqCpV1
 1ehiaDXBuH5vd0fkcxz7g0x5zB+FYWBCDu2YQTmTfqkpQAHFUUnniugx/OAiQ1obWwA=
X-Gm-Gg: ASbGnctVwf/dsLt+JShPYboeAhBHqeuwhCWYZSs1CgVWv6JoNqQTU+H502J5j/iL5EF
 4Ss/JEVyFLzNZRD/Y9qD455ytnyU+0XwOYNyOryvOKrq9V1ANAjJXrVuabeB5goMKYaHB3PycgB
 A5zhD1lx/Q7RESIPRXs3mcG+se3ufQpQJszt6gjol8+yeMvQjMZzl/nVImYxbQn1omGDCDOtB+a
 yUmN5NrScoDUZXLNdj5S0A8NfY+gSkxWwVP3L+v8UW4V31XZ2ZDzZSakUiN631z3EkkPEjBqMvA
 Uwba9Bp33fMu9SLAmbirt6YK6SSwHCE2JMOqD3Za8exWmcVmfJcBkEIcv5XQ7/BouCr86IcmMwX
 Wxjk/24qWA1IPRY98V/v16apTbt7NEwWy8h1TdaeGhj8HXha7GxgC9kJcXS2L3jgK4/AN7XTVHy
 suFEBvkhRHeN1nBizoeDqrbLVQKyno1S4YIcgHgPuZAItBJdQsl8mgjS7VLQ==
X-Google-Smtp-Source: AGHT+IGSJSxaOUKpYiZ60vtbFdEMCWPb89iyz1DbTd1qZJyxQRWM+oUSWq9CrrRKfdrQfK3NOdLXgw==
X-Received: by 2002:a05:6a00:3cc6:b0:781:239d:f2da with SMTP id
 d2e1a72fcca58-7a220acb30cmr24901864b3a.31.1761137197031; 
 Wed, 22 Oct 2025 05:46:37 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23010e25asm14363935b3a.56.2025.10.22.05.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 05:46:36 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/2] drm/panel: Add Ilitek IL79900A controller and bindings
Date: Wed, 22 Oct 2025 20:46:26 +0800
Message-Id: <20251022124628.311544-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series adds device tree bindings and a DRM panel driver for
the Ilitek IL79900A MIPI-DSI LCD controller, which is used in the
Tianma TL121BVMS07-00 12.1-inch panel.

Changes in v4:
- PATCH 1/2: Rename compatible to "tianma,tl121bvms07-00" and update example accordingly.
- PATCH 2/2: Update driver to use new compatible and rename related data structure.
- Link to v3: https://lore.kernel.org/all/20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Fix DT schema error for `backlight` property.
- PATCH 2/2: Address review feedback (use mipi_dsi_msleep/_multi, move init sequence to mode, minor cleanups).
- Link to v2: https://lore.kernel.org/all/20251010093751.2793492-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/2: Address Rob Herring’s review comments and align with panel-common.yaml conventions.
- PATCH 2/2: Rename driver to panel-ilitek-il79900a and align naming and structure with existing Ilitek panel drivers.
- Link to v1: https://lore.kernel.org/all/20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (2):
  dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
  drm/panel: Add driver for Ilitek IL79900A-based panels

 .../display/panel/ilitek,il79900a.yaml        |  68 ++++
 drivers/gpu/drm/panel/panel-ilitek-il79900a.c | 358 ++++++++++++++++++
 2 files changed, 426 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-il79900a.c

-- 
2.34.1

