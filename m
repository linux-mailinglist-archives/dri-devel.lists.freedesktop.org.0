Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0596165A2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A766A10E4BC;
	Wed,  2 Nov 2022 15:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0069510E4B5;
 Wed,  2 Nov 2022 15:02:10 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2DnJ1C025757;
 Wed, 2 Nov 2022 15:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=UB/R2lgefHPHQSvdUiaAq3ILQiFWcLwsNx4+zmWhhIk=;
 b=HEX9/r0SygZ8TgGETmJhlnB/H7l18W8JWWZbeZI5fR3gbjkBX0L4oDxMCVVVJ68n0ZTb
 c7pNw5485XMaFKGhsSyo9QqM3P8HsubfzVJiWT97MsXQD3ORmkh7kZ4/5CLyMGZWTXMW
 nJWBRFXSYDsqC/po6x+TfRNOImBIXRFIyG0vEoUIG3ycWtDFo5UWMbdvp+JLOrAPynCB
 55JSmYBekMDX5IgZX5XjCWGu1L7m7xp37Sj3fzIAQ3QcWwbZZfPAAA7/s6Ll/XfW5rVw
 FKHs5YyEmUZPuJsbtkApbY+Nm7/gNRad0SHl4jiREAQyMiuewr2Q0C6m+mssrdb5qi6I aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkss6b9en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 15:02:02 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2DnKsm025848;
 Wed, 2 Nov 2022 15:02:02 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkss6b9cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 15:02:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2EosbR017404;
 Wed, 2 Nov 2022 15:01:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3kgut9706a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 15:01:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A2F1sXs25559570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Nov 2022 15:01:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21EE152052;
 Wed,  2 Nov 2022 15:01:54 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 0BD955204F;
 Wed,  2 Nov 2022 15:01:54 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id C9E6BE01BC; Wed,  2 Nov 2022 16:01:53 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v2 0/7] vfio-ccw parent rework
Date: Wed,  2 Nov 2022 16:01:45 +0100
Message-Id: <20221102150152.2521475-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: giE1FvulF18FIx78kR1PLtIr11DWW1b8
X-Proofpoint-ORIG-GUID: ld2AgWS6yzQppxgLjXXl59g3Tl71O3Gi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_11,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020093
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Here is an update to the vfio-ccw lifecycle changes that have been discussed
in various forms over the past year [1][2] or so, and which I dusted off
recently.

Patches 1-5 rework the behavior of the vfio-ccw driver's private struct.
In summary, the mdev pieces are split out of vfio_ccw_private and into a
new vfio_ccw_parent struct that will continue to follow today's lifecycle.
The remainder (bulk) of the private struct moves to follow the mdev
probe/remove pair. There's opportunity for further separation of the
things in the private struct, which would simplify some of the vfio-ccw
code, but it got too hairy as I started that. Once vfio-ccw is no longer
considered unique, those cleanups can happen at our leisure. 

Patch 6 removes the trickery where vfio-ccw uses vfio_init_device instead of
vfio_alloc_device, and thus removes vfio_init_device from the outside world.

Patch 7 removes vfio_free_device from vfio-ccw and the other drivers (hello,
CC list!), letting it be handled by vfio_device_release directly.

Looking forward to the feedback.

Thanks,
Eric

[1] https://lore.kernel.org/kvm/0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
[2] https://lore.kernel.org/kvm/20220602171948.2790690-1-farman@linux.ibm.com/

v1->v2:
 - Rebase to 6.1-rc3
 - Patch 1:
   [EF] s/device_initialize/device_register/ and associated adjustments
   [MR] Add WARN_ON(!private) in vfio_ccw_sch_quiesce()
   [MR] Move struct vfio_ccw_parent to _private.h, instead of standalone file
 - Patch 2:
   [MR] Added r-b (Thank you!)
 - Patch 3:
   [MR] Update commit message to point to introduction of private->release_comp
   [MR] Replace the remnants of vfio_ccw_alloc_private with a straight kzalloc
   [MR] Added r-b (Thank you!)
 - Patch 5:
   [KT] Added r-b (Thank you!)
 - Patch 6:
   [JG] Make vfio_init_device static
   [KT] Added r-b (Thank you!)
 - Patch 7:
   [JG, KT] Added r-b (Thank you!)
v1: https://lore.kernel.org/kvm/20221019162135.798901-1-farman@linux.ibm.com/

Eric Farman (7):
  vfio/ccw: create a parent struct
  vfio/ccw: remove private->sch
  vfio/ccw: move private initialization to callback
  vfio/ccw: move private to mdev lifecycle
  vfio/ccw: remove release completion
  vfio/ccw: replace vfio_init_device with _alloc_
  vfio: Remove vfio_free_device

 drivers/gpu/drm/i915/gvt/kvmgt.c      |   1 -
 drivers/s390/cio/vfio_ccw_chp.c       |   5 +-
 drivers/s390/cio/vfio_ccw_drv.c       | 174 +++++++++++---------------
 drivers/s390/cio/vfio_ccw_fsm.c       |  27 ++--
 drivers/s390/cio/vfio_ccw_ops.c       | 107 +++++++++++-----
 drivers/s390/cio/vfio_ccw_private.h   |  37 ++++--
 drivers/s390/crypto/vfio_ap_ops.c     |   6 -
 drivers/vfio/fsl-mc/vfio_fsl_mc.c     |   1 -
 drivers/vfio/pci/vfio_pci_core.c      |   1 -
 drivers/vfio/platform/vfio_amba.c     |   1 -
 drivers/vfio/platform/vfio_platform.c |   1 -
 drivers/vfio/vfio_main.c              |  32 ++---
 include/linux/vfio.h                  |   3 -
 samples/vfio-mdev/mbochs.c            |   1 -
 samples/vfio-mdev/mdpy.c              |   1 -
 samples/vfio-mdev/mtty.c              |   1 -
 16 files changed, 197 insertions(+), 202 deletions(-)

-- 
2.34.1

