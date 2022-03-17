Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1E4DC74A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B957A10EBB1;
	Thu, 17 Mar 2022 13:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD7A10EBB3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 13:13:05 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DF32EE;
 Thu, 17 Mar 2022 14:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1647522782;
 bh=7ZonxhVkbDxjYzF5FzF6x21UH8D7bWtEKmXTk5qLEVg=;
 h=From:To:Cc:Subject:Date:From;
 b=WA533GR2Qm518vzLdN6xcntpO6911BzxIiFw5eSiT/R1xpo0DTjvuExi1Xqr8eJXw
 7FUtGJTLWywb50K8J3p4HKagMgM+oEEUr7dLXPCXJTaEtHqXoO5YwIyaB/sX/54Dva
 lIBoXSQDXQULQmtpU4JyxghRbF6s7tfL6X4r6EZ0=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/bridge: ti-sn65dsi86: Support non-eDP DisplayPort
 connectors
Date: Thu, 17 Mar 2022 13:12:47 +0000
Message-Id: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement support for non eDP connectors on the TI-SN65DSI86 bridge, and
provide IRQ based hotplug detect to identify when the connector is
present.

no-hpd is extended to be the default behaviour for non DisplayPort
connectors.

This series is based upon Sam Ravnborgs and Rob Clarks series [0] to
support DRM_BRIDGE_STATE_OPS and NO_CONNECTOR support on the SN65DSI86,
however some extra modifications have been made on the top of Sam's
series to fix compile breakage and the NO_CONNECTOR support.

A full branch with these changes is available at [1]

As in v3, I have not taken ownership of the patches at [0], so it would
be good to hear if Sam has any plans to revive or push this series.
These patches are not expected to be integrated without [0].

[0] https://lore.kernel.org/all/20220206154405.1243333-1-sam@ravnborg.org/
[1] git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
    branch: kbingham/drm-misc/next/sn65dsi86/hpd

Kieran Bingham (1):
  drm/bridge: ti-sn65dsi86: Support hotplug detection

Laurent Pinchart (2):
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 191 ++++++++++++++++++++++++--
 1 file changed, 176 insertions(+), 15 deletions(-)

-- 
2.32.0

