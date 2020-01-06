Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A61313AC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA63A6E2C0;
	Mon,  6 Jan 2020 14:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B196E047
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 14:34:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z3so49865227wru.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 06:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfzLlWDHZs0nRWa1AeZZK3nWR8mwh2sShfYcCjkmm94=;
 b=RbkbJELnMcEHhnoLZ1B/KyaQGIx2adMgSiaZzTlbkYgLK8n4rp6Wvy6uJPOmk+t91o
 QXzCHGyMRKlQGf5R2wSJYl2S0AMmYrnKdRY3mWTr7XNUwLZk6+kb1U+6vO11PQvP+WTY
 /srb39lL98ZTqXHjGhOc9GqjdKN6z62OkH/fkACVYegLaO2GcS2/xjfPEEVmnMgQoEN+
 ucwFfbvG9PH0p2nJn/RGgQdmxgzaTPuMSiBGzY51cGfbWuq+L81Ca/vxKgpmnz9illel
 q80SnTMw6rkRCwCWJrHxCoCN3KGKwwKhuwVRGnav3rVzJdfyYTJ819QSZ92kPLipRJjc
 y8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfzLlWDHZs0nRWa1AeZZK3nWR8mwh2sShfYcCjkmm94=;
 b=BAzcg/SuwF8CdlIMkJyTZ+3+WEFPiDjPXUbMXCsmhgqEnuoedq/d7yud3cBsAb5S7h
 Le61DGyrqWeqLh9TFm1RuBMJbj8Yy/OC1vRMrX8KoU5gaY/vYr24oviKHuGjE0/dEavI
 ZP2xEBU2rpr64i/BFiHW9FrmkiXgnIqNog+hdyYnM1pT3prrpHeP34TM/yukbup0CzAb
 c90ijNpLOe0P/XM/YRS5DIZRJfUc5tYm5SqlXvgzhCEtZlV0a5VKxQtKD4PznpSWGWXF
 nm0rdRK1vRj3i8wUvry5peOGzbRQeFergekZsUj98XcymcN0LYvcxbDG5ssmcb+6UOnV
 XToQ==
X-Gm-Message-State: APjAAAXIONFufco6drPukykJHeWuj42eP5/weNslM4kkwLsdrP39YlLu
 rwed/xH5UuSpsoE9kYOpJTlJO/HzLwfGDg==
X-Google-Smtp-Source: APXvYqzh2B1Byd10zubAScJR0e/cluorIdCuDhuq66T46jQf9pzK3USjAoRAn1tPU+U+lRAwzUpS9g==
X-Received: by 2002:adf:f990:: with SMTP id
 f16mr106154548wrr.185.1578321254833; 
 Mon, 06 Jan 2020 06:34:14 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v17sm73297659wrt.91.2020.01.06.06.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 06:34:14 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/4] drm: Add support for bus-format negotiation
Date: Mon,  6 Jan 2020 15:34:05 +0100
Message-Id: <20200106143409.32321-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims at adding support for runtime bus-format
negotiation between all elements of the
'encoder -> bridges -> connector/display' section of the pipeline.

In order to support that, we need drm bridges to fully take part in the
atomic state validation process, which requires adding a
drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
Once those basic building blocks are in place, we can add new hooks to
allow bus format negotiation (those are called just before
->atomic_check()). The bus format selection is done at runtime by
testing all possible combinations across the whole bridge chain until
one is reported to work.

No Major changes in this v6, I addressed the slight changed requested
by Boris from Laurent on the patch 1, and rebased on drm-misc-next. 
Note that this version only contains core changes.
Once those changes are merged I'll send the imx/panel/lvds-codec specific bits.

A more detailed changelog is provided in each patch.

This patch series is also available here [1].

Thanks,

~Boris~ Neil

[1] https://github.com/superna9999/linux/commits/drm-bridge-busfmt-v6

Boris Brezillon (4):
  drm/bridge: Add a drm_bridge_state object
  drm/bridge: Patch atomic hooks to take a drm_bridge_state
  drm/bridge: Add an ->atomic_check() hook
  drm/bridge: Add the necessary bits to support bus format negotiation

 .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
 drivers/gpu/drm/drm_atomic.c                  |  39 ++
 drivers/gpu/drm/drm_atomic_helper.c           |  32 +-
 drivers/gpu/drm/drm_bridge.c                  | 527 +++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |   5 +-
 include/drm/drm_atomic.h                      |   3 +
 include/drm/drm_bridge.h                      | 275 ++++++++-
 7 files changed, 874 insertions(+), 48 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
