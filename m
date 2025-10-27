Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1464CC11B0C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A79410E563;
	Mon, 27 Oct 2025 22:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CRF4vxI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E0C10E563
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 22:26:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi
 [82.203.161.16])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 497B0E9B;
 Mon, 27 Oct 2025 23:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761603907;
 bh=JtCpqLjogAgnkkq5jEJlUF7nafrHhCAohKr6UYuwGKw=;
 h=From:To:Cc:Subject:Date:From;
 b=CRF4vxI36CsIYxjAJZ1og3kWsZnLsKbKMcxr4oc5Lfcu8tqRYNv2ncgl32mQv5u5D
 0DHMXg6uF4J4ebQCIzAPpJ0SXAuWQCTmGgZBhM+G5L5EiJIShmM1LnG3+IyCfXg9U1
 STKoTKjhTLI+fhZgaLmj65pY57Qw2UDJQg8eBQ9U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/2] drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio
Date: Tue, 28 Oct 2025 00:26:39 +0200
Message-ID: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
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

Hello,

The dw_hdmi_qp driver supports a "enable-gpios" DT property that is not
documented in the corresponding DT bindings, and is not used in any
upstream device tree sources. This patch series renames the property to
"frl-enable-gpios" to express its purpose more clearly, and documents it
in the bindings.

In the previous these two patches were part of "[PATCH v2 0/5] arm64:
dts: rockchip: Add device tree for the Orange Pi CM5 Base board" ([1]).
I have split them from the Orange Pi CM5 Base DT and rebased them on top
of the drm-misc-next branch to ease integration.

The other main change compared to v2 is the rename of the property from
"tmds-enable-gpios" to "frl-enable-gpios".

[1] https://lore.kernel.org/all/20251005235542.1017-1-laurent.pinchart@ideasonboard.com/

Cristian Ciocaltea (2):
  dt-bindings: display: rk3588-dw-hdmi-qp: Add frl-enable-gpios property
  drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main
    struct

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       | 11 +++++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 14 +++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)


base-commit: 18ff1dc462ef6dacba76ea9cb9a4fadb385d6ec4
-- 
Regards,

Laurent Pinchart

