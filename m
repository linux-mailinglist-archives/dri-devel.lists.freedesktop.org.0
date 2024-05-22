Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F118CC6A4
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 21:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F36710E339;
	Wed, 22 May 2024 18:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ra4bYDEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2DF10E339
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 18:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716404393;
 bh=lm8k6cSxbN2GrVxuYEbg4VxWMDNFrajpEdmYY4k5qro=;
 h=From:To:Cc:Subject:Date:From;
 b=ra4bYDEHRutYlU5PzUg3VvmAEBtFGOnvMe/9zxuILkGD0Y5YUT+QV33nXgCq8wou0
 qJnJtouYSY14vbxON0F0KuN5O0pQ5pZ3uo/SVpzKy4JVQ7OUbWmcpcl2scL59bfAfA
 YacR+6fQBFLMZ7bvovO8M3T40PI15R51sFI1zCsAV34EI7I5/+BjohdHQGzf1WEwM/
 hSnkp3iOMLWBYifFHE7XkpwW5VAWrraoE6QsqhBbwgy/MifoKnMvB8cxkIYNtJAnlD
 lagTyE9BGW4QpyYerxqSosKKifXFuT8utl3Jp80PS63b4ZtW8ifjEF45X+/ODOYt1i
 37AQdquoNdkNQ==
Received: from arisu.mtl.collabora.ca (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BA6AA3782169;
 Wed, 22 May 2024 18:59:50 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/3] drm: rockchip: vop2: Add VP clock resets support
Date: Wed, 22 May 2024 14:57:47 -0400
Message-ID: <20240522185924.461742-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.44.1
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

The clock reset must be used when the VOP is configured. Skipping it can
put the VOP in an unknown state where the HDMI signal is either lost or
not matching the selected mode.

This adds support for rk3588(s) based SoCs.

Changes since v1:
- Add AXI and AHB clock resets
- Set maxItems for !rk3588 in vop2 bindings

Detlev Casanova (3):
  vop2: Add clock resets support
  arm64: dts: rockchip: Add VOP clock resets for rk3588s
  dt-bindings: display: vop2: Add VP clock resets

 .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 12 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 30 ++++++++++++++
 3 files changed, 82 insertions(+)

-- 
2.44.1

