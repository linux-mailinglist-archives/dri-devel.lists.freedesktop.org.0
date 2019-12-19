Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B23125E9E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BADC89DA6;
	Thu, 19 Dec 2019 10:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456F489DA6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:12:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so5000628wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 02:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2vukPTY6TMIDnDN5oMJx3TVhD6ZcioJVJfMMNPJQ1g=;
 b=IuUMWbuIj8EKKGMPBmldpeqYAhBnnwPMu0MkViF4+qedXpY4EI4FLAAjCpRB2gR+HY
 hx7By2u7A/KZC/awj3zXgQ03nJx2J13BVSZGngujEu5HvOCHhL+5bY7JBSGFBkkizK8u
 XLXM5+mzEFZjq/WXIbjV3ig7hLy/W46nGM9RXdx4dq4zj1CGrS6+uVwpWZBtfSF0CU51
 nnza2fJaxy5+1MgVyZFJm1yAbpob58J70QpBR1Miy5pFNBwu6k8nOfIJWuHcLu/CLgyl
 uSrLB34wy+jQv/EeMb/By1k27+5W/qccfyZ5IPYKaPpFhuT5JDQi/RXr29mmztXBudCo
 ePOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2vukPTY6TMIDnDN5oMJx3TVhD6ZcioJVJfMMNPJQ1g=;
 b=pUPj9temcj7A0T8zfHq+x/aCc+IUYfMr28PjONY+elc6gnJd35yL7XLzE0xTH1CvGB
 hWiM6Rs8NXUKIm6muNR0zO7duyp0B6RwIBhO+ODTVpLCbO1QgsfGIUjd8tThXfArPHNQ
 inMPOUupzGK12I3b2rLqLl8wIOZvwTUo97esOoROIN6RK2blwixoWNePjcxf/F/kDR0d
 Ba5UhvzunFYaTubev34LjEsshNkpsV5daFHORrQhveOQAKnG/Wc7f2G5Zxr/ZLpsInOh
 8pHsJ5F8DYlqbcmmsioKMQhDekRkSN3Ud4Z9WepNicmPnnTL71+s3V8TLqNYDUDMKU3Y
 CG9Q==
X-Gm-Message-State: APjAAAUcw2/+41TXRtzWvaDCxT8cpjsnAaGbaQQkzIxY3s+tFEM1oLSb
 G6xh40lpFdRGV+xT24Lha7WHXSaZO9ZuUQ==
X-Google-Smtp-Source: APXvYqwisIuwmRbJpVaj6J4WVHhyVjB3ZoBC8TtfIYr9jR+zDOH8/LORXB6QMRAWv3TZZwRgwUuLEw==
X-Received: by 2002:a05:600c:24ca:: with SMTP id
 10mr8728096wmu.4.1576750319558; 
 Thu, 19 Dec 2019 02:11:59 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id o4sm5750059wrx.25.2019.12.19.02.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:11:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/4] drm: Add support for bus-format negotiation
Date: Thu, 19 Dec 2019 11:11:47 +0100
Message-Id: <20191219101151.28039-1-narmstrong@baylibre.com>
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

Already applied patch from v4 were removed.
No Major changes in this v5, I addressed the slight changed requested
by Laurent on the patch 1. Note that this version only contains core changes.
Once those changes are merged I'll send the imx/panel/lvds-codec specific bits.

A more detailed changelog is provided in each patch.

This patch series is also available here [1].

Thanks,

~Boris~ Neil

[1] https://github.com/superna9999/linux/commits/drm-bridge-busfmt-v5

Boris Brezillon (4):
  drm/bridge: Add a drm_bridge_state object
  drm/bridge: Patch atomic hooks to take a drm_bridge_state
  drm/bridge: Add an ->atomic_check() hook
  drm/bridge: Add the necessary bits to support bus format negotiation

 .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
 drivers/gpu/drm/drm_atomic.c                  |  39 ++
 drivers/gpu/drm/drm_atomic_helper.c           |  32 +-
 drivers/gpu/drm/drm_bridge.c                  | 557 +++++++++++++++++-
 include/drm/drm_atomic.h                      |   3 +
 include/drm/drm_bridge.h                      | 281 ++++++++-
 6 files changed, 907 insertions(+), 46 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
