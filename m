Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514FB619953
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5E210E805;
	Fri,  4 Nov 2022 14:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DFC10E802;
 Fri,  4 Nov 2022 14:20:18 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4E0NQY015429;
 Fri, 4 Nov 2022 14:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=9SGw4OzVldCITXhtlQ5um7jPtHCDf0S7mHMQ3DIbAZo=;
 b=Mtf25NG0LYLuOhmyJNQtWAGEvvB//A14sQwkXKzMw2gPkEiczn9O7kP4sjBvXEFLMV1A
 iaWCWvoSWv7iNdsEHwVM4NA/gDnWvIQFIOu9f5B6Xluy9I1DC+FEdOSIo9YbJhmL3r+u
 TnVeXJHshI3nXiWPEEzcM0AcnU/JzqS4hL2ofqxFo2Rc2rmhm8EORzVlwBVhLVv2GyDT
 LvJRU8itgCH1bLV/SJXUnro0gMQm3JRdZwAbt/xCNZrDO3Zs7J+TZO7RjiXx1WR6tEnP
 ZM0qF38Yb+VugVqMpfJ55LapR2yi4m0w9cH/cHtzQkzoDqfET6RBFC9fAn2H6MHj+/oG kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kn2464yvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:16 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4C90df032034;
 Fri, 4 Nov 2022 14:20:15 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kn2464ytu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:15 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4E5Mr5027381;
 Fri, 4 Nov 2022 14:20:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3kjepedmae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A4EEYpV47645158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 14:14:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 393FCA4053;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 207D9A4051;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id BE473E01BC; Fri,  4 Nov 2022 15:20:08 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v3 0/7] vfio-ccw parent rework
Date: Fri,  4 Nov 2022 15:20:00 +0100
Message-Id: <20221104142007.1314999-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mtzOvMNnvG5ubfdM535qaNh-GmE-TSgU
X-Proofpoint-GUID: VajN9RXUiMm1XBh1WxxH70KNT97wipk5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_09,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040093
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

Hi Alex,

Here's the (last?) update to the vfio-ccw lifecycle changes that I've sent
recently, and were previously discussed at various points [1][2].

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

I believe this covers everything in this space; let me know if not!

Thanks,
Eric

[1] https://lore.kernel.org/kvm/0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
[2] https://lore.kernel.org/kvm/20220602171948.2790690-1-farman@linux.ibm.com/

v2->v3:
 - [MR] Added r-b to remaining patches (Thank you!)
 - Patch 1:
   [gfx checkpatch] Whitespace
   [EF] Remove put_device(&parent->dev)
   [MR] Fix error exit when alloc of parent fails
   [MR] Check for !private on sch_probe error path
 - Patch 3:
   [EF] Fix error exit when alloc of private fails
 - Patch 6:
   [AW] Added ack (Thank you!)
 - Patch 7:
   [CH, AK] Added r-b (Thank you!)
   [AW] Added ack (Thank you!)
v2: https://lore.kernel.org/kvm/20221102150152.2521475-1-farman@linux.ibm.com/
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
 drivers/s390/cio/vfio_ccw_drv.c       | 173 +++++++++++---------------
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
 16 files changed, 196 insertions(+), 202 deletions(-)

-- 
2.34.1

