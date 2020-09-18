Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B8926FE2E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 15:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC0F6E14F;
	Fri, 18 Sep 2020 13:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E9E6E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 13:23:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IDNZQv079956;
 Fri, 18 Sep 2020 08:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600435415;
 bh=QAD9s+VLeCd2Hro5Hhz3PJVG5qgwt7yucas+t6eVGoY=;
 h=From:To:CC:Subject:Date;
 b=MyWr7fg1ml9qnU0sO0iIY0u35M+IsxbJZJCWHuq5d4rum6dD6C3caolk/VZ29GMSH
 W8C5c2m48ZqgwGfTFRccIk0da7c5Gd2tV8eqF6Be6qmq9NCLmXhJ37cXSextPKwo9k
 mWbhFjr7DBGHYWTxELZsA6qrDebtvU107o8dOtzo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IDNZQt111786;
 Fri, 18 Sep 2020 08:23:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 08:23:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 08:23:35 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IDNWks017529;
 Fri, 18 Sep 2020 08:23:33 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, ML
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [GIT PULL] cdns-mhdp bridge for 5.10
Message-ID: <5dd15e3c-51ed-49c0-cf49-88c7af38d6b0@ti.com>
Date: Fri, 18 Sep 2020 16:23:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Yuti Amonkar <yamonkar@cadence.com>,
 Neil Armstrong <narmstrong@baylibre.com>, "Nori, Sekhar" <nsekhar@ti.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Here's a pull requests for Cadence MHDP DisplayPort bridge driver. It's almost
-rc6, but I'd like to see this merged in 5.10 to make it easier to get the last
bits (mainly dts files) merged in 5.11.

The MHDP driver compile-time-depends on two PHY patches (queued in phy tree),
for which there's a stable git branch based on -rc1 provided by Vinod:

git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy phy-attrs-5.10

I have merged this stable branch here to keep MHDP compiling.

This is based on latest drm-next.

 Tomi	

The following changes since commit b40be05ed255d9a0257fb66ab2728ecca2c9d597:

  Merge branch 'for-5.10-drm-sg-fix' of https://github.com/mszyprow/linux into drm-next (2020-09-17 16:07:11 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git tags/cdns-mhdp-5.10

for you to fetch changes up to afba7e6c5fc190b687f3d87bc6d1029d1500c059:

  drm: bridge: cdns-mhdp8546: Add TI J721E wrapper (2020-09-18 15:16:02 +0300)

----------------------------------------------------------------
Cadence MHDP8546 DisplayPort bridge driver

----------------------------------------------------------------
Swapnil Jakhade (4):
      phy: Add new PHY attribute max_link_rate
      phy: cadence-torrent: Set Torrent PHY attributes
      drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge
      drm: bridge: cdns-mhdp8546: Add TI J721E wrapper

Tomi Valkeinen (1):
      Merge tag 'phy-attrs-5.10' of git://git.kernel.org/.../phy/linux-phy into 5.10/dp-pull

Yuti Amonkar (1):
      dt-bindings: drm/bridge: Document Cadence MHDP8546 bridge bindings

 .../bindings/display/bridge/cdns,mhdp8546.yaml     |  169 ++
 drivers/gpu/drm/bridge/Kconfig                     |    2 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/cadence/Kconfig             |   24 +
 drivers/gpu/drm/bridge/cadence/Makefile            |    4 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 2532 ++++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |  400 ++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c   |   78 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h   |   19 +
 drivers/phy/cadence/phy-cadence-torrent.c          |    4 +
 include/linux/phy/phy.h                            |    2 +
 11 files changed, 3235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/cadence/Makefile
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
