Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76236B38AC9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723C410E8B1;
	Wed, 27 Aug 2025 20:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="euLhcl90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C5210E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 20:24:06 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RKNvp81825109;
 Wed, 27 Aug 2025 15:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756326237;
 bh=l2kumuCMLlBCJKAinXlyJgLWFRWFnmkwqXm+yzlGKgc=;
 h=From:To:CC:Subject:Date;
 b=euLhcl90UmAP6JPogxrdYfsXvuEeQFvw02QsxLt2OGBZroIQoKGO8TVnfgxXSXGMt
 FCb99EywBWCegcvpqBOeFU5tFGOeHETl9VDGN7kPSLKeaF2WIpPfpuTQwMikTrqtKJ
 icrDy7wX0am3FxxqMk0AdKW2lapiPq+i8pDeEwAE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RKNv122382663
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 27 Aug 2025 15:23:57 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 15:23:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 15:23:56 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RKNvFS3643386;
 Wed, 27 Aug 2025 15:23:57 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, <afd@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH V5 0/5] drm/bridge: it66121: Add initial it66122 support
Date: Wed, 27 Aug 2025 15:23:49 -0500
Message-ID: <20250827202354.2017972-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi,

Add initial support for IT66122, which seems to be compatible to it66121
but probably has additional functionality.

BeagleY-AI uses this it66122 as the old part is no longer in production
as far as I understand.

Now, BeaglePlay uses it66121 at the moment, but at some point, it might
end up flipping over to the new part. Additionally, it also looks like
Revision D of BeagleBone Black switched over to it66122 as well.

Series is based on next-20250827

Bootlog: BeaglePlay: https://gist.github.com/nmenon/65afb917ee1818979d338cf25732a920

Changes in V5:
* Switched over to ARRAY_SIZE
* Picked up Andrew's Reviewed-by

Changes in V4:
* Added patch to sort the compatibles alpha-numerically
* vid/pid lookup is done without using the match_data.
* picked reviews

Changes in V3:
Based on Tomi's and Devarsh's reviews, and searching online (and failing
to find) for a public data sheet, I have refactored the series to:
a) Detect the ID by matching vid/pid
b) Introduce it66122 basic support which seems to work based on
   empirical testing evidence on BeagleY-AI. This allows incremental
   patches in the future by someone who might have access to the data
   sheet to add additional features for the chip.
c) Irritated by checkpatch --strict warnings, added a patch to fix
   existing warnings as part of this series, but it could probably go
   in independent of everything else.
d) Stopped claiming it66122 is drop in replacement of it66121 :)

Changes in V2:
* Picked up Krystoff's binding ack
* Switched over to a vid/pid list

V4: https://lore.kernel.org/all/20250819130807.3322536-1-nm@ti.com/
V3: https://lore.kernel.org/all/20250815034105.1276548-1-nm@ti.com/
V2: https://lore.kernel.org/all/20250813204106.580141-1-nm@ti.com/
V1: https://lore.kernel.org/all/20250813190835.344563-1-nm@ti.com/

Nishanth Menon (5):
  dt-bindings: display: bridge: it66121: Add compatible string for
    IT66122
  drm/bridge: it66121: Drop ftrace like dev_dbg() prints
  drm/bridge: it66121: Sort the compatibles
  drm/bridge: it66121: Use vid/pid to detect the type of chip
  drm/bridge: it66121: Add minimal it66122 support

 .../bindings/display/bridge/ite,it66121.yaml  |  1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 68 +++++++++----------
 2 files changed, 34 insertions(+), 35 deletions(-)

-- 
2.47.0

