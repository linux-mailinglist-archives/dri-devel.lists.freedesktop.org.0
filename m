Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C61B25497
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 22:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2203B10E7BC;
	Wed, 13 Aug 2025 20:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ll/6m25Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0610E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 20:41:17 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DKfAQu2154325;
 Wed, 13 Aug 2025 15:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755117670;
 bh=Wdvf/jNhiHmkxjIEZx3swrAG0Wn7qiN5MEB1zX7qGEY=;
 h=From:To:CC:Subject:Date;
 b=ll/6m25QMS4TjdFp35YDDcLZTp3XyH2Z81YAe75gG2palTt5f0IS1JHddm7zpDCQS
 F3oFkkoOyytR8sNnVWAv1iH+ls1kFtoZwqgRjZqLY1H833Z81joZ8cxmPOZ4JscaOt
 sOp71q32S4BelEJk7H0MkE36DA6U2uwG3Tm8lf08=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DKfAC71329210
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 13 Aug 2025 15:41:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 15:41:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 15:41:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DKf9AM2853509;
 Wed, 13 Aug 2025 15:41:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, <afd@ti.com>, Nishanth Menon
 <nm@ti.com>
Subject: [PATCH V2 0/3] drm/bridge: it66121: Add it66122 support
Date: Wed, 13 Aug 2025 15:41:03 -0500
Message-ID: <20250813204106.580141-1-nm@ti.com>
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

Add support for IT66122, which for all practical purposes is
drop in replacement for IT66121 except for the ID register
definition.

BeagleY-AI uses this new part as the old part is no longer in production
as far as I understand.

Now, BeaglePlay uses it66121 at the moment, but at some point, it might
end up flipping over to the new part.

Quick boot log on BeaglePlay for compatibility check:
https://gist.github.com/nmenon/6cb8b8a00bcce1755628d131df878840

Changes since V1:
* Picked up Krystoff's binding ack
* Switched over to a vid/pid list

V1: https://lore.kernel.org/all/20250813190835.344563-1-nm@ti.com/

Nishanth Menon (3):
  dt-bindings: display: bridge: it66121: Add compatible string for
    IT66122
  drm/bridge: it66121: Convert the vid/pid entries into a list
  drm/bridge: it66121: Add it66122 support

 .../bindings/display/bridge/ite,it66121.yaml  |  1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 32 ++++++++++++++-----
 2 files changed, 25 insertions(+), 8 deletions(-)

-- 
2.47.0

