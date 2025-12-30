Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE9CEA4D0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 18:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9088E10E17C;
	Tue, 30 Dec 2025 17:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71B4710E17C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:20:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F1D0497;
 Tue, 30 Dec 2025 09:20:40 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9064D3F63F;
 Tue, 30 Dec 2025 09:20:45 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Properly support FriendlyElec HD702E
Date: Tue, 30 Dec 2025 17:20:30 +0000
Message-Id: <cover.1767111804.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I've been using the HD702E LCD/touchscreen on my NanoPC-T4 for a few
years using my own DT with the "simple-panel" binding, but now we have
upstream overlays I figured it's about time to try doing it properly.
The screen itself doesn't seem to want to work as a generic "edp-panel",
as it appears the EDID isn't readable until after the whole lot is
enabled - I'm guessing this might be to do with the Analogix driver's
force-hpd behaviour - but since we do already have the legacy data, it
doesn't seem unreasonable to keep using it.

Thanks,
Robin.


Robin Murphy (4):
  dt-bindings: display: panel: Move FriendlyElec HD702E to eDP
  drm/panel-edp: Move FriendlyELEC HD702E
  arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
  arm64: dts: rockchip: Add overlay for FriendlyElec HD702E

 .../display/panel/panel-edp-legacy.yaml       |  2 +
 .../bindings/display/panel/panel-simple.yaml  |  2 -
 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  2 -
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  2 +
 .../dts/rockchip/rk3399-nanopc-t4-hd702e.dtso | 62 +++++++++++++++++++
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts |  2 -
 .../rockchip/rk3399-sapphire-excavator.dts    |  2 +
 drivers/gpu/drm/panel/panel-edp.c             | 26 ++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 25 --------
 10 files changed, 99 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso

-- 
2.34.1

