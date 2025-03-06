Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D79A5551E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9AB10EA65;
	Thu,  6 Mar 2025 18:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="Af/Yq6H1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Thu, 06 Mar 2025 09:21:45 UTC
Received: from mta-64-226.siemens.flowmailer.net
 (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258D110E91C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:21:45 +0000 (UTC)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id
 2025030609113487d3306ddd8a0962f9
 for <dri-devel@lists.freedesktop.org>;
 Thu, 06 Mar 2025 10:11:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=551wx5oTEqfZyjay5LJbEZtGjB9vzpZh1VRl3hD8kLg=;
 b=Af/Yq6H1MQjdSf52ulEnsWhK6tfSzLeb/Lz3pfIb8I4aRvtYEdIVh2CglTXnHtnS7QKRXZ
 AsXlbKT7ImaVTPTT/2H8rUJcXLpNdtCU6gtJ931JJgdkXUx4vZ2fh7bBEG65d47/+MGWi4yY
 MSe0whRMPE8sG0XVYxKYkIIbcgsZSmTOlAKlX4fgJGnovt96hLCJsBLvRh7cJRbmhiHzV0T7
 zzdFNZ73Fe4XSSbN/5/P3euVbusEtY79E5D0OVanGv4/K4Z4Sakf5i70W0HW2lbXHBQUkPXV
 NhRKDE8zIhgbJH3hxQ3bRPhaNIpGhrI50eJqX3CN1iLgSnCBd/ByGt5g==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: Andrej Picej <andrej.picej@norik.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 0/2] Introduce h/vsync-disable properties for ti-sn65dsi83
Date: Thu,  6 Mar 2025 10:11:31 +0100
Message-ID: <20250306091133.46888-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-Mailman-Approved-At: Thu, 06 Mar 2025 18:35:34 +0000
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

From: Alessandro Zini <alessandro.zini@siemens.com>

This patch series adds support for disabling the generation of h/vsync signals
on the ti-sn65dsi83 bridge.

This is required on some panels which are driven in DE-only mode but do not
ignore sync packets, and instead require them to be low-voltage level or ground.

A discussion (1) on TI's E2E forum confirms that this may be required for some
panels.

(1) https://e2e.ti.com/support/interface-group/interface/f/interface-forum/1475734/sn65dsi84-disable-hsync-and-vsync

Alessandro Zini (2):
  dt-bindings: drm/bridge: ti-sn65dsi83: add h/vsync-disable bindings
  drm/bridge: ti-sn65dsi83: add h/vsync-disable support

 .../bindings/display/bridge/ti,sn65dsi83.yaml    | 12 ++++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c            | 16 ++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.48.1
