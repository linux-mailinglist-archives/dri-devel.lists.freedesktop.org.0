Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE6604D45
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DEE10F28F;
	Wed, 19 Oct 2022 16:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E319210E810;
 Wed, 19 Oct 2022 16:21:50 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JGC381014500;
 Wed, 19 Oct 2022 16:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ueHhensO89tMZ5aZeuuWx+fIGWz1CSWGE0UZFzQ8/3k=;
 b=mEVvrGRCJPg0Ad7IK0WXlo5/iBCR8zS8Tf6Z1Ir9mldutxVRRyYHJ5o2F0TM5+iRaQ7w
 DGg4z/Q6tnucXy5yvQ57aOrPQJA7nN72j8/Yao+dX03yZQuwyBHMRY86BiRDxxonw+Hp
 9fp9j9x4HtP9yx8S0ZnnGnClEh7zMUVd/2xCRIk6UWD+VPElTTKqFPZq2vzNtVd81Yra
 Stt7h4ZR9LlM/86msftcY7I5RiyyfbjrvFbHkzeOIVZU9SrpHBarfI7rRru9UnLpdTLR
 mlgxgBT2GFya+aO8YVkup8ZOwkK9SfEG7jbjVTY0Hw0ZfYm+ofyZ0zHeRMotYDpCD3Gm ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kamhx0b9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:48 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JGCDwx016440;
 Wed, 19 Oct 2022 16:21:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kamhx0b65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JGKFOV000526;
 Wed, 19 Oct 2022 16:21:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3kajmrr62g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29JGGbVt41288134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 16:16:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26420A4060;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F61AA405C;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id C2ACAE023C; Wed, 19 Oct 2022 18:21:37 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v1 0/7] vfio-ccw parent rework
Date: Wed, 19 Oct 2022 18:21:28 +0200
Message-Id: <20221019162135.798901-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QVeqQa4fNXWqhRly__j8I7Qai_FQvnJM
X-Proofpoint-GUID: tk4o-9iVTqbbG68tiiPnDNh-ZUS3ib5b
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_09,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190091
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

There have been discussions and attempts [1][2] to rework the vfio-ccw device
lifecycle to better align with the needs/expectations of vfio and mdev.
While those languished, commit cb9ff3f3b84c ("vfio: Add helpers for unifying
vfio_device life cycle") implemented a couple of tricks that help vfio and the
drivers that interact with it, while keeping vfio-ccw as-is. A handful of
commits titled "vfio/xxx: Use the new device life cycle helpers" implemented
those tricks for each of the drivers.

This series attempts to address the oddities/shortcomings of vfio-ccw, such
that vfio-ccw can use the same helpers as everyone else, and the tricks that
were implemented by the other drivers can be removed. It is built on 6.1-rc1,
and thus includes the various changes [3][4] that have occurred in and around
these parts.

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
[3] https://lore.kernel.org/kvm/20220923092652.100656-1-hch@lst.de/
[4] https://lore.kernel.org/kvm/20220921104401.38898-1-kevin.tian@intel.com/

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
 drivers/s390/cio/vfio_ccw_drv.c       | 182 ++++++++++----------------
 drivers/s390/cio/vfio_ccw_fsm.c       |  27 ++--
 drivers/s390/cio/vfio_ccw_ops.c       | 108 ++++++++++-----
 drivers/s390/cio/vfio_ccw_parent.h    |  28 ++++
 drivers/s390/cio/vfio_ccw_private.h   |  22 ++--
 drivers/s390/crypto/vfio_ap_ops.c     |   6 -
 drivers/vfio/fsl-mc/vfio_fsl_mc.c     |   1 -
 drivers/vfio/pci/vfio_pci_core.c      |   1 -
 drivers/vfio/platform/vfio_amba.c     |   1 -
 drivers/vfio/platform/vfio_platform.c |   1 -
 drivers/vfio/vfio_main.c              |  25 +---
 include/linux/vfio.h                  |   1 -
 samples/vfio-mdev/mbochs.c            |   1 -
 samples/vfio-mdev/mdpy.c              |   1 -
 samples/vfio-mdev/mtty.c              |   1 -
 17 files changed, 204 insertions(+), 208 deletions(-)
 create mode 100644 drivers/s390/cio/vfio_ccw_parent.h

-- 
2.34.1

