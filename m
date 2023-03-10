Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6316B36B6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 07:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ED510E95D;
	Fri, 10 Mar 2023 06:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33210E95D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 06:39:21 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 w5-20020a253005000000b00aedd4305ff2so4954308ybw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 22:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678430360;
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uLEOf97Xcxe+idb9j43TbpyCGCu1DdozmCjBlybGEn0=;
 b=GtwM2EdlA4ehep+DcS/mVf6iahVW5PU5kUGpRLeTDCFwmGAks1UukIZrkwmitMR5N4
 pHiLMiddhHaSMUxCa1oQp+jL/D5xiCMRzK29mS7Hf2zx0Q9DVyeu4052Kxn2aZy/Jxb7
 HpxdE2h5krayCuAkvEUPqs8FkPQgJsClGEuaH1WZrZiRmnQtjgCBFVOhOS0r0gCImDud
 g90ZQyRH/SgbAtZEmnpbslZ1JhC/ZejHmroLF7KBbp+TB2pYWmZc/yOytpP29klk0TTv
 yu5PZCuhA2U2hqrey+ljUPwPr9p/qQjGMKh06LLZyuM8PCKe4BaL4oUuAtABOOQB2ari
 ed5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678430360;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLEOf97Xcxe+idb9j43TbpyCGCu1DdozmCjBlybGEn0=;
 b=c4FGMiSTqd4asOMsyxnLY/S2PemdvB0rgKQcKTHNtY0Y2bmpYsE6pSqdc9U5BIru+h
 O+Z1zrLCzkMEOBTXb04lc7rvkU6HT6Fy7yzhpq/kUt3jWSyrixwg4a2fDXaitny+XazI
 z9M0o4X5woYHSqrL280T1T8liH1lSs8/WmK7qgnZoZ2dbBvZYCxFUWnllXxrdYmah+6T
 ibRlcL0fZd2DhU3OzWzVADF3usgCmELFMQ9r/eN+DecW8I2GWTXMiH1AabLgNRf1bmdk
 4HRil6hD25luqVRr8rs+GilokBFdibfoSkTYkL9xKdyrYhd2l9Ytt7nXalrl0gLp4Cay
 30VA==
X-Gm-Message-State: AO0yUKWvcJ/IiQ6Jk8rR437tTJvVVTdGBwQgb6EHzPp05DHxVb4uy/Zx
 +UNo8oxgppJx5jLbQDQ0hI+skM+mSn1vl0I=
X-Google-Smtp-Source: AK7set9lWWd7FEtVovPBRfs0EtlhKEus2Tr4Xst+bTDGT+Xv+XGL3GsmSkvhgntdlqkdKL+5PbCof7F4V3L0z7g=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:1274:2857:8749:6af3])
 (user=saravanak job=sendgmr) by 2002:a05:6902:151:b0:afa:d8b5:8e82 with SMTP
 id p17-20020a056902015100b00afad8b58e82mr12849163ybh.6.1678430360695; Thu, 09
 Mar 2023 22:39:20 -0800 (PST)
Date: Thu,  9 Mar 2023 22:39:09 -0800
Message-Id: <20230310063910.2474472-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Subject: [PATCH v1] drm/mipi-dsi: Set the fwnode for mipi_dsi_device
From: Saravana Kannan <saravanak@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Thierry Reding <treding@nvidia.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 3fb16866b51d ("driver core: fw_devlink: Make cycle
detection more robust"), fw_devlink prints an error when consumer
devices don't have their fwnode set. This used to be ignored silently.

Set the fwnode mipi_dsi_device so fw_devlink can find them and properly
track their dependencies.

This fixes errors like this:
[    0.334054] nwl-dsi 30a00000.mipi-dsi: Failed to create device link with regulator-lcd-1v8
[    0.346964] nwl-dsi 30a00000.mipi-dsi: Failed to create device link with backlight-dsi

Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Link: https://lore.kernel.org/lkml/2a8e407f4f18c9350f8629a2b5fa18673355b2ae.camel@puri.sm/
Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index b41aaf2bb9f1..7923cc21b78e 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -221,7 +221,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 		return dsi;
 	}
 
-	dsi->dev.of_node = info->node;
+	device_set_node(&dsi->dev, of_fwnode_handle(info->node));
 	dsi->channel = info->channel;
 	strlcpy(dsi->name, info->type, sizeof(dsi->name));
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

