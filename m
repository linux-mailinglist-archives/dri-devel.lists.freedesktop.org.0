Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613932A3E4D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBCE6E84E;
	Tue,  3 Nov 2020 08:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71B889CCE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:04:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A384C9b124203;
 Tue, 3 Nov 2020 02:04:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604390652;
 bh=Rah7rgX2pfAl/KKs9MFywV7uODYRxtRUVJYNB55xYkk=;
 h=From:To:CC:Subject:Date;
 b=Tj401V6ldlkYcqqeWMYt+Qn9bHjUI/2nrC4xjNdgITn8z+8XiwCwTnOYvmLMB9Pxt
 nooynZ130QD4XHZ/cQyKRGRhf7R5NStrG/gLxoi4tskaUqeCFDkfbQdy43lQVZu7ml
 NgdNieYPP1JgSeEVR4DhJ9gtIeCWMk/3EJ+2Gr7w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A384CKx108366
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 02:04:12 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 02:04:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 02:04:11 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3849es095622;
 Tue, 3 Nov 2020 02:04:09 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
Subject: [PATCH v2 0/5] drm/omap: add color mgmt support
Date: Tue, 3 Nov 2020 10:03:05 +0200
Message-ID: <20201103080310.164453-1-tomi.valkeinen@ti.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sekhar Nori <nsekhar@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is a resend of the v1, after adding Pekka's reviewed-by, rebasing
to latest drm-misc, and re-testing. The cover letter from v1:

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
