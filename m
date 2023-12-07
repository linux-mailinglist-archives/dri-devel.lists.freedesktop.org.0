Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C8808C3A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A3C10E023;
	Thu,  7 Dec 2023 15:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE9E10E8E5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:49:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D5D3A6213E;
 Thu,  7 Dec 2023 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502AAC433C7;
 Thu,  7 Dec 2023 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964176;
 bh=N/byJx61MB/G+xPer+BE3L2kaBiCkfIycNZTFhMyqxU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Qn0IYS+xXVt98u5JQmLzprmafaUmc+Nx31sQTVta/7A2h3no627Ry6GGHeFEZr3Nc
 ktJbQb+xgyB5b8rT260XmhMkVqt+QzCc2oF5RvWfXsYhTk3qIDuAbn1tL78yrCbF4/
 85UDnN5nw3bk8rwbzejxP8au4gckM4Jl0If3zT2nR0n/raVZRQvKN0U73594I2NRXP
 S2XOeRkecUJ7zw+NdBACCN3cdZzPr4F/+W90MIG1RSJLED+gTAdK5pPIwaPuksHvGX
 7obGPzVKmTKbF1XRinWyWkhwOYDTUQVeak0Q8r6eeOA84UcKtAi28pp8Gr2pGdsquB
 rOaZ3GoMDh9jQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:25 +0100
Subject: [PATCH v5 02/44] drm/tests: helpers: Add atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-2-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=mripard@kernel.org;
 h=from:subject:message-id; bh=N/byJx61MB/G+xPer+BE3L2kaBiCkfIycNZTFhMyqxU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1t6VRXK5zR87DjjniA9T8ugxan7yJL1sd/0Iyrms
 +5s7JbpKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwETqXjIyLJgvWqj2ajLr7ik7
 3JPmRZ05zvXM4GPQ6TxrNvVb9dIZ/xgZzt39UPM7/u7z6yLMG1jzGVZsSo+9v1Zzsr3MYZVzn/d
 UcwEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mock device we were creating was missing any of the driver-wide
helpers. That was fine before since we weren't testing the atomic state
path, but we're going to start, so let's use the default
implementations.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index bccb33b900f3..272a3ba46d60 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
@@ -13,6 +14,8 @@
 #define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
 
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+	.atomic_check	= drm_atomic_helper_check,
+	.atomic_commit	= drm_atomic_helper_commit,
 };
 
 static int fake_probe(struct platform_device *pdev)

-- 
2.43.0

