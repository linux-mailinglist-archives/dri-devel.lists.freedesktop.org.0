Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4791826A8F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A44B10E1DC;
	Mon,  8 Jan 2024 09:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDA010E1EF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704705653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=48TtFxmkBLq08biP3z1ck/nyrB9vsB9Au4Xw4KzideY=;
 b=fHp8+r1nZ63qrJyL80R6750k+Wh5SXeiAmOhwuwMQwSIaQWT94G+dnzTvtmwvC9lfNECyP
 fHyVTw6I0USbSiV9/1yfcfVw+qtDek7poujRcREPQraLtuNnUbTaMVbXF1wizh99pUDhvG
 jG/BleN3AXiUdnNimTUy9RND3YgCeoY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-gZd4eA7RNCmfVSzhRW5LDg-1; Mon, 08 Jan 2024 04:20:52 -0500
X-MC-Unique: gZd4eA7RNCmfVSzhRW5LDg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-429841b3070so3795081cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704705652; x=1705310452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48TtFxmkBLq08biP3z1ck/nyrB9vsB9Au4Xw4KzideY=;
 b=buKtKWjwFD9uuBBU4zuXPZ6wTAgCGdbXZxEp8YDm9GFMqNnzq/9vBgYU98AhXi98GV
 VG7fFB4PwF9Vy1mGseGzb6Pz8ZztMqJlRvjEEsZ8+EPf2+fFs8HqOCR5EWsQ2NCAtzZG
 YpLEJK86/HcMVZRuu8+9ANpwe1l7oxtkOjK+OZe4PMpuKKiKN3PSGgWD/tzWNVVA8Y82
 pwePQbSLKUvNqrI56iD73ema72ydIUthXDj8G3guD5jEJsdniwdnjTgEjyZZVRM/Riv/
 9I3GMlSslg+uw+mYUJptn06wUEoVELJqbV2B7Hvm9Tv5pWDCJGHLEO1UxByRsPMBIhXk
 9RKg==
X-Gm-Message-State: AOJu0YwnfB5OrUcTpvvuxcQ9i6bIuJxgsb2ymKAEH8iZThBOyeFONWI7
 0DcJ04zIVfNDcu8tfUiVINhvklhVaFWFDdcuz146WllNsNukbu6E8q7djWmdgA+KVhoDLo4TXdd
 Yu+Ri6aIge58IEiKUpsr3hEZ/eaE4kXHQn0uY
X-Received: by 2002:a05:6214:2305:b0:681:7ea:7ac2 with SMTP id
 gc5-20020a056214230500b0068107ea7ac2mr1913612qvb.1.1704705652248; 
 Mon, 08 Jan 2024 01:20:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSYTkeF6XSZKtSHbVgPwqgjaTeSq0UBVxgUw+1xaqYnJhub7w67LhH5GVVx/wDOpiGTWPBmA==
X-Received: by 2002:a05:6214:2305:b0:681:7ea:7ac2 with SMTP id
 gc5-20020a056214230500b0068107ea7ac2mr1913588qvb.1.1704705651960; 
 Mon, 08 Jan 2024 01:20:51 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 dm4-20020ad44e24000000b00680613267d5sm2732554qvb.115.2024.01.08.01.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:20:51 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2 0/2] platform_device: add new devres function
Date: Mon,  8 Jan 2024 10:20:41 +0100
Message-ID: <20240108092042.16949-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
- Fix wrong function name in docstring (Uwe)
- Change devres function name so it becomes obvious that it's requesting

Patch #1 adds a new devres function that I found could be useful for the
driver dcss in drm. Patch #2 makes that driver use the new function.

I compiled this successfully but unfortunately don't have the hardware
to test it for dcss.
So you might want to have a closer look.

Greetings,
P.

Philipp Stanner (2):
  platform_device: add devres function region-reqs
  drm/dcss: request memory region

 drivers/base/platform.c             | 38 +++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.c |  9 ++++---
 include/linux/platform_device.h     |  3 +++
 3 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.43.0

