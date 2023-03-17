Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD86BF63E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 00:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9456610E285;
	Fri, 17 Mar 2023 23:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ECA10E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 23:24:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2B8DB826E4;
 Fri, 17 Mar 2023 23:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C00C433EF;
 Fri, 17 Mar 2023 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679095440;
 bh=4Yw10iXA3NoEkVqayhQQ1JuzywOyCVtcyLkwaw2zmhE=;
 h=From:To:Cc:Subject:Date:From;
 b=BbLp5kHCIK6GwfvSIOqpcLdY11l4T3yskCPHCkNzYE56Hd0o5jd1alqnuQV5k23KR
 TDfx0RrIYJZ/5ogVLr5qhtPbF36IRgSgOtxiVO8yc2t8M6c38dGkIKc7wnfiwa4NUz
 20SEtDb+vUESCxxjb4c/8H644ZYhUDvZGA7A58J6DJdKuRwswC2GVx2plOZsQiQ0Wo
 b3YvSCh3OS1fNZjsiGZcRJoPup2a7FlOJgzrKM4zh5tvzrX8ST7lJLbcRPEvg7e8mR
 EFNduRS1cBcO9IUOBY8Vf0xZ3uyBQd2ZP3QJ7rAx9HpL3TkDGiRMnfZ7ocVovmQoez
 H8VQxbbrb2tHA==
Received: by mercury (Postfix, from userid 1000)
 id D8C1310620FE; Sat, 18 Mar 2023 00:23:57 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv1 0/7] Add Inanbo T28CP45TN89 panel support
Date: Sat, 18 Mar 2023 00:23:48 +0100
Message-Id: <20230317232355.1554980-1-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This adds panel support for Inanbo T28CP45TN89, which I found inside of a
handheld thermal camera. The panel is based on the st7789v controller. All
information is based on reverse engineering.

The series conflicts with [0] ("Add timing override to sitronix,st7789v").
I can rebase, but did not want to delay getting some review feedback :)

[0] https://lore.kernel.org/all/20230314115644.3775169-1-gerald.loacker@wolfvision.net/

-- Sebastian

Sebastian Reichel (7):
  dt-bindings: vendor-prefixes: add Inanbo
  dt-bindings: display: st7789v: add Inanbo T28CP45TN89
  drm/panel: sitronix-st7789v: add SPI ID table
  drm/panel: sitronix-st7789v: remove unused constants
  drm/panel: sitronix-st7789v: make reset GPIO optional
  drm/panel: sitronix-st7789v: prepare for additional panels
  drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89 support

 .../display/panel/sitronix,st7789v.yaml       |   5 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 251 +++++++++++++++---
 3 files changed, 213 insertions(+), 45 deletions(-)

-- 
2.39.2

