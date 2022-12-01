Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5E063F4B6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 17:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF07B10E63E;
	Thu,  1 Dec 2022 16:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de
 [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5C710E63C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 16:03:54 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 4D22D1C0049;
 Thu,  1 Dec 2022 17:03:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on srv01.abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by srv01.abscue.de (Postfix) with ESMTPSA id 367D91C0048;
 Thu,  1 Dec 2022 17:03:51 +0100 (CET)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/tiny: panel-mipi-dbi: Support separate I/O voltage
 supply
Date: Thu,  1 Dec 2022 17:02:42 +0100
Message-Id: <20221201160245.2093816-1-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As stated in Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yml,
the MIPI DBI specification defines two power supplies, one for powering
the panel and one for the I/O voltage. The panel-mipi-dbi driver
currently only supports specifying a single "power-supply" in the
device tree.

Add support for a second power supply defined in a new "io-supply"
device tree property to make the driver properly configure the voltage
regulators on platforms where separate supplies are used.

Changes in v2:
 - Don't list power-supply in the properties section of
   panel-mipi-dbi-spi.yaml because it is already in panel-common.yaml

Otto Pflüger (3):
  drm/mipi-dbi: Support separate I/O regulator
  drm/tiny: panel-mipi-dbi: Read I/O supply from DT
  dt-bindings: display: panel: mipi-dbi-spi: Add io-supply

 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |  8 +++++++-
 drivers/gpu/drm/drm_mipi_dbi.c                     | 14 ++++++++++++++
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |  5 +++++
 include/drm/drm_mipi_dbi.h                         |  7 ++++++-
 4 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.30.2
