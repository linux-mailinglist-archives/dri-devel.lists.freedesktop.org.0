Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6720B318875
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 11:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF926EDF9;
	Thu, 11 Feb 2021 10:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836D86E5B2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 10:37:10 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id A9LMlXsw2Zvk6A9LPlud1a; Thu, 11 Feb 2021 11:37:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1613039828; bh=4+4N0PoDWgsVbg1mOoPtcBrFgTjs96ZvYYEmf7iiKU0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=fsb/RaQ7pHAGpuumHgGX/00jeitAcU2lZ0Y9CSs4Kd7FhQvrwZQrWSQQxb2b5y6rH
 R6OE9UexUCAON/ET1GHIFfOif3IQRG6c7AfJRNPe1N41A6xMLqP3ud4EoeRBza0wG4
 GRUf7HQySs/8VElYxh8Sb1aALEK1Uvc4um+P/YDs7VnID15DjANCVNY0GX3KpJzqA+
 +cZo1GMXMcQLG9qDuILCFAeCbfqX1mdg3yK1HWsY9C1VV1YYqC8y6pRyQ4q+E4RD8F
 YBj0/NXHvHjJ2+S7xn2VZFds79mJGdzMLLXrB5yXZcMVQ61wxneLJYSLqPWwp0Vham
 M/m38S8a3CJ/A==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/5] drm/omap: hdmi: improve hdmi4 CEC, add CEC for hdmi5
Date: Thu, 11 Feb 2021 11:36:58 +0100
Message-Id: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEpPuZfHrv3ScUk8i5acH1/+xpv+JQkYulPlSP9klHaiTLJnvoGeqywczB9nhmp8NrXq89BNNgFFzgEWAY1NcrXoyx9ColwZ/pzFSOk7VMXGprxvTFo+
 wZRrhBLye8ylSEI4swbQsl3cygFiXC00BdqOyh28919lGwFsrA7hCo412J1045HK7FAuXhXeP0a65iscs+CXw06zy/nFRhKxJyVDTsNGAaiY+e44EwXg4mKB
 m45GVpOLBJqvcsYhtFUUas4Vpz3fN2GhS5jnIQcH7Q7bFT0Ur2sF12FAlxa53pd5OcCKK2nr3uLbB09yp/WJAN1/6XKw1YI+Cne9aeOOKCPxCeUNnRM4H1Bk
 C+OFUj/MMdUs9zt8LDJHtJO7ISEq4ntlKKUUdSSma0jrH0w9cix0Ax3LoZROJklQ0VciJgue
X-Mailman-Approved-At: Thu, 11 Feb 2021 10:45:19 +0000
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
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

The fourth patch adds CEC support to the OMAP5 driver and the last
patch adds the missing cec clock to the dra7 and omap5 device tree.

Tested with a Pandaboard and a Beagle X15 board.

Regards,

	Hans

Hans Verkuil (5):
  drm: drm_bridge: add cec_init/exit bridge ops
  drm/omap: hdmi4: switch to the cec bridge ops
  drm/omap: hdmi4: simplify CEC Phys Addr handling
  drm/omap: hdmi5: add CEC support
  ARM: dts: dra7/omap5: add cec clock

 arch/arm/boot/dts/dra7.dtsi              |   5 +-
 arch/arm/boot/dts/omap5.dtsi             |   5 +-
 drivers/gpu/drm/drm_bridge_connector.c   |  23 +++
 drivers/gpu/drm/omapdrm/dss/Kconfig      |   8 +
 drivers/gpu/drm/omapdrm/dss/Makefile     |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi4.c      |  41 ++---
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c  |  12 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h  |  12 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  63 +++++--
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 201 +++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  28 +++-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
 include/drm/drm_bridge.h                 |  31 ++++
 15 files changed, 453 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
