Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA82377074
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 09:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389B86E85B;
	Sat,  8 May 2021 07:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227CD6E85B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 07:41:20 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 b14-20020a17090a6e0eb0290155c7f6a356so5804491pjk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 May 2021 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QXDnjyKB879WWu5HcCyEpj+JYchBF3522PxjAdZvJYs=;
 b=F/4YnN8yxt//sE9DlamHWHTc96qn/GPkfoyWB1/Py1GREbXZdWUqoPnB5jaMbga8/D
 7gSPWOn9cIqCRsNZw+w8TygZdrAQS5F8Themq5i0WUd9ct2Jc7se2LLPbMlrzkFDTftF
 WkXjhkvO2D/Q8yxMpaCpcqqni61GUERQomCLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QXDnjyKB879WWu5HcCyEpj+JYchBF3522PxjAdZvJYs=;
 b=S86VHMyX83fWkUZXDU4mVVljq/AeDbq0Scf7cL4X7B6bb22HXrXReSpsNjNbuIA2VK
 L86v7pG5WajxIeh0PP8nqV0TCjpocYgm950DrhpXezDY39P8zGVzaK0+YTpLF7Ge086X
 Hp3TV0s/ZOXnbDPddFQtEZTMnSgf3dFSilM/LxDxOv5TgIpj0nw3Oz0FB+8427r8vb6m
 0e7jLGR4wK7Fe7borpadxd2gc/Tidypf7rnvxkUxG3uK7S116bi6sUe4PYkLyxNMySXP
 YLE1DZooxVLH7s3NPmvyIWGmJwHamHGYxnNkQyg4NbYu3x5zCUHJ7Q3sqo5wR2CddSxq
 1Srw==
X-Gm-Message-State: AOAM531WioPzSVBAQ/Xmf0jQ7Q/d/ImmjEEtw+QltlQZyhkwrhAc3zqc
 FScsJ9aRnAewvY57uBWAFlLoRg==
X-Google-Smtp-Source: ABdhPJwDAIUQ5Bm3lnAj91OHtapwoTD9/ukTdlyybiBqXZum5GZVgyBBhkyHT9Pyg7QZlOAx5whsiw==
X-Received: by 2002:a17:90b:1055:: with SMTP id
 gq21mr27086958pjb.91.1620459679691; 
 Sat, 08 May 2021 00:41:19 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id w1sm6769687pgh.26.2021.05.08.00.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 00:41:19 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] component: Move host device to end of device lists on binding
Date: Sat,  8 May 2021 00:41:18 -0700
Message-Id: <20210508074118.1621729-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device lists are poorly ordered when the component device code is
used. This is because component_master_add_with_match() returns 0
regardless of component devices calling component_add() first. It can
really only fail if an allocation fails, in which case everything is
going bad and we're out of memory. The host device (called master_dev in
the code), can succeed at probe and be put on the device lists before
any of the component devices are probed and put on the lists.

Within the component device framework this usually isn't that bad
because the real driver work is done at bind time via
component{,master}_ops::bind(). It becomes a problem when the driver
core, or host driver, wants to operate on the component device outside
of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
driver core doesn't understand the relationship between the host device
and the component devices and could possibly try to operate on component
devices when they're already removed from the system or shut down.

Normally, device links or probe defer would reorder the lists and put
devices that depend on other devices in the lists at the correct
location, but with component devices this doesn't happen because this
information isn't expressed anywhere. Drivers simply succeed at
registering their component or host with the component framework and
wait for their bind() callback to be called once the other components
are ready. We could make various device links between 'master_dev' and
'component->dev' but it's not necessary. Let's simply move the hosting
device to the end of the device lists when the component device fully
binds. This way we know that all components are present and have probed
properly and now the host device has really probed so it's safe to
assume the host driver ops can operate on any component device.

This fixes the msm display driver shutdown path when the DSI controller
is connected to a DSI bridge that is controlled via i2c. In this case,
the msm display driver wants to tear down the display pipeline on
shutdown at msm_pdev_shutdown() by calling drm_atomic_helper_shutdown(),
and it can't do that unless the whole display chain is still probed and
active in the system. When a display bridge is on i2c, the i2c device
for the bridge will be created whenever the i2c controller probes, which
could be before or after the msm display driver probes. If the i2c
controller probes after the display driver, then the i2c controller will
be shutdown before the display controller during system wide shutdown
and thus i2c transactions will stop working before the display pipeline
is shut down. This means we'll have the display bridge trying to access
an i2c bus that's shut down because drm_atomic_helper_shutdown() is
trying to disable the bridge after the bridge is off.

Moving the host device to the end of the lists at bind time moves the
drm_atomic_helper_shutdown() call before the i2c bus is shutdown.
This fixes the immediate problem, but we could improve it a bit by
modeling device links from the component devices to the host device
indicating that they supply something, although it is slightly different
because the consumer doesn't need the suppliers to probe to succeed.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Rob Clark <robdclark@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index dcfbe7251dc4..de645420bae2 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -15,6 +15,8 @@
 #include <linux/slab.h>
 #include <linux/debugfs.h>
 
+#include "base.h"
+
 /**
  * DOC: overview
  *
@@ -657,6 +659,14 @@ int component_bind_all(struct device *master_dev, void *data)
 				c = master->match->compare[i - 1].component;
 				component_unbind(c, master, data);
 			}
+	} else {
+		/*
+		 * Move to the tail of the list so that master_dev driver ops
+		 * like 'shutdown' or 'remove' are called before any of the
+		 * dependencies that the components have are shutdown or
+		 * removed.
+		 */
+		device_pm_move_to_tail(master_dev);
 	}
 
 	return ret;

base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
-- 
https://chromeos.dev

