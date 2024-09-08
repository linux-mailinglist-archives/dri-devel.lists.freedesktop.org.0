Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563C9707C1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 15:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A16110E25C;
	Sun,  8 Sep 2024 13:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="QbzNxNnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148610E25C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1725802110;
 bh=GBZtSa7NV3xr9PArtmtkDJNem8kQ3e2llQ47ktafnlQ=;
 b=QbzNxNnwSbAb4TQ0yFDTzC/y6DCt00xusYXBD0R775cQFANiwsAxdsWUidwdgFnVI/q9VQAHb
 ecYAQkXR8UTg+RAoSPT39McuBqkm2XuMiEI6O8WMWJH7WT6VuTsSIMbVGeUKjPoqBWmxcRi5ZgP
 og27kIcMHxUjoxSfvSDRTfuBm6sY8wb+ttpc95L4LkPekY9rRqPb29dw6vIqMiBMFW2GGtoZoNt
 GS7xC0b94GAvEcaHrB65JqOK1rl0snStDeHcUwnY1/KHZAGUfJPToHdc6lSrEDQF0sdBm86uMk0
 uD315y37RqcRausvaNHsn+kHR2g2ipfTSt6MTiCsxOqg==
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Christopher Obbard <chris.obbard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 00/10] drm: bridge: dw_hdmi: Misc enable/disable,
 CEC and EDID cleanup
Date: Sun,  8 Sep 2024 13:28:02 +0000
Message-ID: <20240908132823.3308029-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66dda67e3c9877b4595878e3
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

This series ensure poweron/poweroff and CEC phys addr invalidation is
happening under drm mode_config mutex lock, and also ensure EDID is
updated (when the dw-hdmi connector is used) after a hotplug pulse.

These changes has mainly been tested on Rockchip devices together with a
series [1] that add HDMI 2.0 4K@60Hz support to RK3228, RK3328, RK3399
and RK3568.

Rockchip use the dw-hdmi connector so this should also be validated with
a driver that use the bridge connector.

Changes in v2:
- Add patch to disable scrambler feature when not supported
- Add patch to only notify connected status on HPD interrupt
- Update commit messages
- Collect r-b tags
- Rebased on next-20240906

[1] https://lore.kernel.org/r/20240615170417.3134517-1-jonas@kwiboo.se/

Jonas Karlman (10):
  drm: bridge: dw_hdmi: Disable scrambler feature when not supported
  drm: bridge: dw_hdmi: Only notify connected status on HPD interrupt
  drm: bridge: dw_hdmi: Call poweron/poweroff from atomic enable/disable
  drm: bridge: dw_hdmi: Use passed mode instead of stored previous_mode
  drm: bridge: dw_hdmi: Fold poweron and setup functions
  drm: bridge: dw_hdmi: Remove previous_mode and mode_set
  drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
  drm: bridge: dw_hdmi: Remove cec_notifier_mutex
  drm: bridge: dw_hdmi: Update EDID during hotplug processing
  drm: bridge: dw_hdmi: Use display_info is_hdmi and has_audio

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 150 +++++++---------------
 1 file changed, 43 insertions(+), 107 deletions(-)

-- 
2.46.0

