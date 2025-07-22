Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC878B0E46D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513EC10E15A;
	Tue, 22 Jul 2025 19:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OTkSwdlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139E10E15A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753214084;
 bh=yE8FP2dB5XJGvL/8C5raEX/QIQT7yEmjwtR6o2JvdoQ=;
 h=From:To:Cc:Subject:Date:From;
 b=OTkSwdlZMtfFENnUxJx3F2UDbuMZFafwndv5GqGePHeD7MraPK7g8dw3pvqFdQFFr
 pZbmKpoZnUe0qE51afm4imeM2c1+nIpHl+B0GUKuZE2SCqtcFXpRJLTDv1QGpfof/7
 pV/ouUvkkf8mgAns6DrGf+yv51JGr5acLRSYE9ptym7h2rdw/vaNdIK6Pr2M0Khglg
 2ZEszpyDWZV1nZHyyYHqxe+9sY09AaFkx6UWSthhATE39L8BOSGPto1ADLTW/QeJut
 +LvN8Jm2vUuMvhr3hzb6tmYkqZWxEEVC9HdZghmntdiIdqgJ6Vm8VlenzG8SpqaEqn
 lyq0H/2pF42gQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A3BF17E0497;
 Tue, 22 Jul 2025 21:54:41 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Raag Jadav <raag.jadav@intel.com>, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v2 0/3] Clean some logs on rockchip hdmi audio
Date: Tue, 22 Jul 2025 15:54:34 -0400
Message-ID: <20250722195437.1347865-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
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

HDMI audio is showing lots of logs, particularly when HDMI is
disconnected.

It doubled on RK3588 with the addition of the second HDMI TX port, so
clean it up to avoid missing important log lines.

Changes since v1:
 - Add comment about clock requirements
 - Add Fixes tags to the drm/bridge commits
 - Link to v1: https://lore.kernel.org/all/20250717215620.288651-1-detlev.casanova@collabora.com/

Detlev Casanova (3):
  drm/bridge: dw-hdmi-qp: Return 0 in audio prepare when disconnected
  ASoC: hdac_hdmi: Use dev_info on invalid ELD version
  drm/bridge: synopsys: Do not warn about audio params computation

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 13 ++++++++++---
 sound/soc/codecs/hdac_hdmi.c                 |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.50.1

