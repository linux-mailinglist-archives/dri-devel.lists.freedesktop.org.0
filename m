Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC79732A5CE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 17:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB2D6E1FB;
	Tue,  2 Mar 2021 16:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478296E1F2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 16:24:15 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id H7oZlNjwSOruFH7odlAWMi; Tue, 02 Mar 2021 17:24:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614702253; bh=VtC7GTkBG2WhDcVnnTw3UXgMnGhDtHHBmjRC4T4mQZs=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=MwPqEHaOvO8LUVDYUtfvZX7yRfbAnP5emQqHkX1hwxOb7UKKUK6vUfnQLGXg4v8xu
 kLszxJUEHtEDyFWMJA+CKRWHOAG2cWuBpHSTl7rKj+1r2fW9KGgGyyOTJ3pfLE1EDz
 8/6v/UvknmHfuMSUqqfWZekMvBC3nXe49ABVhUFrCHXczCsu9G83xp4CQkNHa/Ea05
 EXfCfnussBW8aE5GakYi6vhXCrtlwtbMwthW/xOnTYGnZGCxGpCkFZr2Wii0/JkCGk
 nWDZi2BeBgvNLcTNSoX2I5AcLBHTa0nl3/o7I5Ry/p/NAd+6MF78kzhJ0OXR+x/uYO
 uqrqPmHpyDy1w==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 0/6] drm/omap: hdmi: improve hdmi4 CEC, add CEC for hdmi5
Date: Tue,  2 Mar 2021 17:23:57 +0100
Message-Id: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH1WztQd5puTGwx9jr7Qnb4a6LSVKsuJG9LXZaF/19eoi/zr0o+zEmykIrlunj4rGbDj3oLAAcpap3fmA4yi700pShKgsJ36UmKM8zK0vFiMwowA0McA
 p0X7zcRF1f0Bt80pqq+QxNP57ZdF+6DcZteipsPrtf0MpRJWmg/YoAtzPfTOAtJbMi9ani09XzV3DhPqjwDjUJ9Ny2cjHca34nTE+1WsZq4beI45Eo6w9OCt
 9fSguGiPru6OyPrqXedv9aWlX0N3USTGqyKQ647NmJhgfzNy13cTErdyRkDoWTSkL3p57FxtrK55siVAeJHapfEg+gIkxBTNL/7MKSX9ghml2NNoO+QI/a3K
 cendEyr9bcjZCKYo5f12N0igPjrLxTdaTWVzTO8SilIuNEXLP3Q45V8Db5rvnAdmebZ2s2ERm0IBbL3dLgKJPW0rAnwOfMKkQf9d9h9lF4h1CuBPrCteunAh
 SizYOiESX0NgPN7i
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series improves the drm_bridge support for CEC by introducing two
new bridge ops in the first patch, and using those in the second patch.

This makes it possible to call cec_s_conn_info() and set
CEC_CAP_CONNECTOR_INFO for the CEC adapter, so userspace can associate
the CEC adapter with the corresponding DRM connector.

The third patch simplifies CEC physical address handling by using the
cec_s_phys_addr_from_edid helper function that didn't exist when this
code was originally written.

The fourth patch adds the cec clock to ti,omap5-dss.txt.

The fifth patch the missing cec clock to the dra7 and omap5 device tree,
and the last patch adds CEC support to the OMAP5 driver.

Tested with a Pandaboard and a Beagle X15 board.

Regards,

	Hans

Changes since v1:

- as per suggestion from Laurent, changed cec_init/exit to
  connector_attach/_detach which are just called for all
  bridges. The DRM_BRIDGE_OP_CEC was dropped.

- added patch to add the cec clock to ti,omap5-dss.txt

- swapped the order of the last two patches

- incorporated Tomi's suggestions for the hdmi5 CEC support.

Hans Verkuil (6):
  drm: drm_bridge: add connector_attach/detach bridge ops
  drm/omapdrm/dss/hdmi4: switch to the connector bridge ops
  drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
  dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
  dra7.dtsi/omap5.dtsi: add cec clock
  drm/omapdrm/dss/hdmi5: add CEC support

 .../bindings/display/ti/ti,omap5-dss.txt      |   4 +-
 arch/arm/boot/dts/dra7.dtsi                   |   5 +-
 arch/arm/boot/dts/omap5.dtsi                  |   5 +-
 drivers/gpu/drm/drm_bridge_connector.c        |   9 +
 drivers/gpu/drm/omapdrm/Kconfig               |   8 +
 drivers/gpu/drm/omapdrm/Makefile              |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi.h            |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  40 ++--
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  13 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  12 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           |  63 +++++-
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c       | 209 ++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h       |  42 ++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  35 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |  33 ++-
 include/drm/drm_bridge.h                      |  27 +++
 16 files changed, 453 insertions(+), 54 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h

-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
