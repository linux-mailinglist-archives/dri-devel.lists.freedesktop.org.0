Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B08C7198
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D064F10E0F2;
	Thu, 16 May 2024 06:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="lDg5s1+m";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sVPj6oH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE7C10E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1715840705; x=1747376705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FnBWymedJjKyiLa7wqfQJM2clRoi20uCvIeRkE4sZxI=;
 b=lDg5s1+mZklyZBxT/IchCGi8N6xM/DkIPUuyU1vthynZncRVV7PMMqpG
 SiOd2H/JLx0iBpdrZx4qF/y9x5lDU5H3f4iHxr0VFL4n066Gwd5myBIpV
 0wuUhnl0r5Omm+jPFSIoKU29M7XgKwG1FqmXz1oB1UzLCx27xUpDcNxb5
 Qubb/4ctRpdPEd7c/ellcwENpbPxTN3FbcAUyd3xr0fCmCrTbf2mViwEh
 phVQWKuUYpaT8rGi3gJ/RgvFYF2U+A2PZJACa3mhxSeDPTJ7WMs0Mm3sM
 6oANHPxlMlg7vzuMZQ78Y90watd5V7A7v6V48qfGPhH2PPnpEOLnADOJE Q==;
X-CSE-ConnectionGUID: BhAH7Qd5Truskt5wD/Deaw==
X-CSE-MsgGUID: Xcc14FPeSu6hl/qb4Ys6ew==
X-IronPort-AV: E=Sophos;i="6.08,163,1712613600"; d="scan'208";a="36926958"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 16 May 2024 08:25:01 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2F65170DD3; Thu, 16 May 2024 08:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1715840697; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=FnBWymedJjKyiLa7wqfQJM2clRoi20uCvIeRkE4sZxI=;
 b=sVPj6oH5+DaTlWrKy0zFjGMSnkzkVp+abKxZez/0FBj26fcBDq0exQh6E+67RF2QdcRfbc
 wvDp37wQJW1Q9n2yHv1KnwGlEAFNE07NvHHXaylguU/QP0g2PU9XAaLfF7RG98cN+w0ebP
 GDWUhoPXiyLYimzhj8RWneMv7mCyomVFJaFc/EKq8IHn1nsFHVHNrt1ei+KyXAuqnPsSc9
 eDWfvGBYC16Cy/YDs6bAij/NUds/rvo8U1UDPSfgQkqrS3NB1oQ3zEkk6EQOFu6UiqSiHF
 5bVlHN06WSgIEK3iSuSNmzurSEDk405Huu7+e49pT/9TdtZzq3fg0/lnrF8o0A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Improve tc358767 debugging
Date: Thu, 16 May 2024 08:24:52 +0200
Message-Id: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

this small series improves debugging the tc358767 driver by using
dev_err_probe for additional information (patch 1) and print IRQ
debug output only if hotplug status actually changed.

Changes in v2:
* Added patch for supporting write-only registers

Best regards,
Alexander

Alexander Stein (3):
  drm/bridge: tc358767: Use dev_err_probe
  drm/bridge: tc358767: Only print GPIO debug output if they actually
    occur
  drm/bridge: tc358767: Support write-only registers

 drivers/gpu/drm/bridge/tc358767.c | 56 +++++++++++++++++++------------
 1 file changed, 35 insertions(+), 21 deletions(-)

-- 
2.34.1

