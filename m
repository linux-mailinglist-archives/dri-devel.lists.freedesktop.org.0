Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5C7E039C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 14:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C4E10E9E0;
	Fri,  3 Nov 2023 13:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002A910E9E3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 13:14:23 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FC349D5;
 Fri,  3 Nov 2023 14:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699017244;
 bh=i2C16ss8SU23ICZxAiGfhvextYtfxnWVPgHeWfkSoRU=;
 h=From:Subject:Date:To:Cc:From;
 b=Czwzs11/X/yNWBecRFQ1k/8kIRRYWLNB4sqLYl7UzRQ5EznDeUI0dRBQS2F7q6dww
 tJA5HEcsS3z+WXeZ909xvH8YeNAnH1UTd8txGvvkDojy1vxpMHgBsvbrQfV56+2JVJ
 Hv9Xbtyw4vjMceoR6d8WLSr1B8kZ8zfxe1jxom2s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/4] drm: Fix errors about uninitialized/wrong variables
Date: Fri, 03 Nov 2023 15:14:02 +0200
Message-Id: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABryRGUC/3WMQQ7CIBBFr9LMWsxAa4uuvIfpgsLUzkIwUImm4
 e5i9y7f/3lvg0SRKcGl2SBS5sTBV1CHBuxi/J0Eu8qgULWosRMvz55XMfObkpBaz2flejS2hao
 8I+1HNW5j5YXTGuJnr2f5W/+EshQoTI/DoCx2bjpd2ZFJwU/BRHe04QFjKeUL5z3L1a8AAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Parshuram Thombare <pthombar@cadence.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=i2C16ss8SU23ICZxAiGfhvextYtfxnWVPgHeWfkSoRU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlRPInF+kKt7naFwfYCihEN2y1q/8QD8VR4B6jh
 tiU8k7GmC+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUTyJwAKCRD6PaqMvJYe
 9fEJD/9FBGxkHooXw4umZF29JT0XLb5YXar9XWLXKOla2GhqNST6Sro5x6m36XcRYuHr/IPze8S
 QdEvDj6DrAd8c8X2/SlSoL+AJntyzIFsVZIqlt7HyDk8rc+ffhsV5k8IjPLFTVgGsgL5h1GW02q
 82V2vBWFPrZN1RJ95SsQcSUjQh0Hu8v+SC3I7BpSokgDUJNIJZ47NIb4V0O53/gg5/nr+GXM67Y
 ZxvVnSrdZU5MNIHy857asHYIojQH6BZ22niEO1DyXTC/HU9j5wUZ9x5Z95Tvrve0pEYU+AzMq9Q
 gWmynWaeZ4f+QkWCeVFbzlYhbojldHXbMiBgkGU04D/K3f1MuwHm35YmhRaS0CSO5MNBrR1kciu
 zx4R1C4esg15e/9+YV+WJoL9EDOD3x7R5CzQMncjYKZp3JWcMUZIp85YdPXc4AQ9ACenjtdQRXx
 ZJxWp0nID/lPlkI09kESHg0qiEe9Ll3Cv4EzJuzOm9fv7E3Fxxsd3zbsXimKFsb1mWGFB74GZS9
 NtrGux3zp89lzOh/zQOWCnNYQaGqerVYK05wnPVXtjP6LGG+M1aKXkzJN3z9Wv3ILsFQ2F+jCt0
 MNmbnylidgRnjhYNzSgENDt/ZhrWuc2eSN0vK2Gk1j6hUXhAoEjfjimL+YBgRv+KgbkTZn9hSMA
 KzKntri/ApWsOug==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix cases where smatch reports a use of an uninitialized variable, and
one where the variable is initialized but contains wrong value.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Added two more fixes
- Link to v1: https://lore.kernel.org/r/20230804-uninit-fixes-v1-0-a60772c04db5@ideasonboard.com

---
Tomi Valkeinen (4):
      drm/drm_file: fix use of uninitialized variable
      drm/framebuffer: Fix use of uninitialized variable
      drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
      drm/bridge: tc358767: Fix return value on error case

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c | 3 ++-
 drivers/gpu/drm/bridge/tc358767.c                   | 2 +-
 drivers/gpu/drm/drm_file.c                          | 2 +-
 drivers/gpu/drm/drm_framebuffer.c                   | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)
---
base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
change-id: 20230804-uninit-fixes-188f92d60ac3

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

