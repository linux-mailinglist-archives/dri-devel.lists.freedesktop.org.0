Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F127579A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 13:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BA76E991;
	Wed, 23 Sep 2020 11:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC156E992
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 11:58:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwMZp029746;
 Wed, 23 Sep 2020 06:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600862302;
 bh=EwdEk7Y5MUEuIRITAQmwSKAV2UC5/jJzgkIVlGxgMAg=;
 h=From:To:CC:Subject:Date;
 b=WqiIEd8z4a9M/bEopi2DLXiGEwOE+jxjukTTQdbs6gNC/PETflWq1At1KrqfcwvKu
 H1MPnkB9mDPxwctF3mUWt4fUUh1Md5uAcuyOBjI1vhm5QWyo4DnWpMynl4MkjX9zIP
 um8qxGG8OIwa0/ixRWFy85D/Vh47VLHckLeLS4lY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NBwMdZ097971
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 06:58:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 06:58:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 06:58:21 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwJhu038765;
 Wed, 23 Sep 2020 06:58:20 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jyri Sarha <jsarha@ti.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 0/5] drm/omap: add color mgmt support
Date: Wed, 23 Sep 2020 14:57:22 +0300
Message-ID: <20200923115727.248705-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series is based on patches sent about a year ago:

https://lists.freedesktop.org/archives/dri-devel/2019-September/233966.html
https://lists.freedesktop.org/archives/dri-devel/2019-September/233967.html

I've fixed the minor issues reported, and according to the recent
discussions with Pekka and Daniel, I have changed how the gamma works.

After these patches omapdrm will expose DEGAMMA_LUT (and no GAMMA_LUT),
and the legacy gamma-set ioctl will use DEGAMMA_LUT underneath. And on
top of that, we have the CTM and plane color mgmt.

 Tomi

Jyri Sarha (2):
  drm/omap: Implement CTM property for CRTC using OVL managers CPR
    matrix
  drm/omap: Enable COLOR_ENCODING and COLOR_RANGE properties for planes

Tomi Valkeinen (3):
  drm: add legacy support for using degamma for gamma
  drm/omap: use degamma property for gamma table
  drm/omap: rearrange includes in omapdss.h

 drivers/gpu/drm/drm_atomic_helper.c   |  81 +++++++++++++++-----
 drivers/gpu/drm/omapdrm/dss/dispc.c   | 104 ++++++++++++++++----------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  12 ++-
 drivers/gpu/drm/omapdrm/omap_crtc.c   |  51 +++++++++++--
 drivers/gpu/drm/omapdrm/omap_plane.c  |  30 ++++++++
 include/drm/drm_atomic_helper.h       |   4 +
 6 files changed, 209 insertions(+), 73 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
