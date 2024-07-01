Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F491DACB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 10:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE1A10E154;
	Mon,  1 Jul 2024 08:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="xCTAsNKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6058910E14B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719824355; x=1751360355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sabomtZUjVsNbbWpDbVJPR/Q2916OvcV2yNhBaRDqMk=;
 b=xCTAsNKTn9fvripQk4P44bVaUXdiDvccc0qq3/+iAxwx8Pi59aMGJiGS
 iMhyQd8FjhgfbpcAYEvBK1gafewQWtz7gkvWEFtVbz27QqnuN0gabp3jN
 DZbFjcSvZC6iYz2+uuWvkwwU3imU/Za9dijame4vQ0ndYP6L/HQv5CBfr
 MBupfVcNK2oS+vdGQUtQhX3X5ZDbLU1l6liig5v1Licr0AJnK5oxpjRsp
 VncetC6MlwiQA+NfgYlr6GVimIQFw9iQlpC5hRdBjmZokkSuI2PIMU0L1
 CTYGMc6KIvpwWX0Pp3sDo+g3YAujsYc4USuewJXHs8Z4SYt+XH8AdfydS Q==;
X-CSE-ConnectionGUID: T3Ozs11LSS25nP8hYlNUig==
X-CSE-MsgGUID: e2+G/LfdTWWlbtGRJ2gvXQ==
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="29328369"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2024 01:59:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 01:58:45 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 01:58:39 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <quic_jesszhan@quicinc.com>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 0/3] Panel HIMAX support for Microchip's AC40T08A MIPI
 display
Date: Mon, 1 Jul 2024 14:28:34 +0530
Message-ID: <20240701085837.50855-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

This patch series adds panel himax display controller support for the
Microchip's AC40T08A MIPI display.

yaml file is validated using the following commands

make dt_binding_check DT_SCHEMA_FILES=<converted_yaml_file>
make CHECK_DTBS=y DT_SCHEMA_FILES=<converted_yaml_file>

Changelogs are available in respective patches.

Manikandan Muralidharan (3):
  dt-bindings: display: himax-hx8394: Add Microchip AC40T08A MIPI
    Display panel
  drm/panel: himax-hx8394: switch to devm_gpiod_get_optional() for
    reset_gpio
  drm/panel: himax-hx8394: Add Support for Microchip AC40T08A MIPI
    Display Panel

 .../bindings/display/panel/himax,hx8394.yaml  |  17 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 153 +++++++++++++++++-
 2 files changed, 165 insertions(+), 5 deletions(-)

-- 
2.25.1

