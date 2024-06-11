Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC19040AA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 18:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13D910E16E;
	Tue, 11 Jun 2024 16:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="Lw8jFDwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jun 2024 16:01:28 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECDF10E69C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1718121682;
 bh=I7oWEAwMzJYg1QixLY8LSRS5H8hWf0Fter8AOhPGR/A=;
 b=Lw8jFDwg6qDCtV07qf8YqddnAPL/h7HQp/ZTs1DParTTyZcs7fWnrqVukbyo81BRKO7jPp9LW
 4HpV0KyrIfy/qLGEIBLgWs8IPIs+R7SyG8Dd8JIdnUjMNzO97VsEljOIoQuIHelvA7ACzxaY/fA
 AF9/g+Z+HzYQtYt8+kXPSTIfPvzpYlZBkz898Uh35/AlZgOM1NMr7w1NbqMeaqTWpK8IlbU4XVn
 x20nI9ACQSundsIq/mGLJncdSY77A/er7xbiBfkjRzc62f10r1XNKeCtclTBicAmUdS6sg6pwZY
 FO4WPpb250iViboPKFmwmbsfsqnVwmDM6FkFrj7E1vOw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] drm: bridge: dw_hdmi: Misc enable/disable,
 CEC and EDID cleanup
Date: Tue, 11 Jun 2024 15:50:52 +0000
Message-ID: <20240611155108.1436502-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66687273b913b04293b6dc1e
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
forthcoming series that add HDMI 2.0 4K@60Hz support to RK3228, RK3328,
RK3399 and RK3568.

Rockchip use the dw-hdmi connector so this should also be validated with
a driver that use the bridge connector.

Jonas Karlman (8):
  drm: bridge: dw_hdmi: Call poweron/poweroff from atomic enable/disable
  drm: bridge: dw_hdmi: Use passed mode instead of stored previous_mode
  drm: bridge: dw_hdmi: Fold poweron and setup functions
  drm: bridge: dw_hdmi: Remove previous_mode and mode_set
  drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
  drm: bridge: dw_hdmi: Remove cec_notifier_mutex
  drm: bridge: dw_hdmi: Update EDID during hotplug processing
  drm: bridge: dw_hdmi: Use display_info is_hdmi and has_audio

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 145 ++++++----------------
 1 file changed, 39 insertions(+), 106 deletions(-)

-- 
2.45.2

