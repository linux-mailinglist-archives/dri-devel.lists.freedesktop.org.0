Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBA43632C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264736EC6C;
	Thu, 21 Oct 2021 13:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AD36EC6C;
 Thu, 21 Oct 2021 13:36:16 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LCIK0Y030906; 
 Thu, 21 Oct 2021 09:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=rs7R+EiNjmdY8sMr0oV+kI64B8ZDQE3tLnPovcEdSAM=;
 b=S8zZVe0anNGtrAwU9E8v0WetfHo8OdVyw1dy1AbgugU9krPM9dlUQmzpO7i3o/D6xejY
 7U5wUTnxoEOHpiU61xdUzDG4tLN1qrp0B74G6b/+t5Zg7kcjk3e22aUKwGddrAIOoaqr
 /yKGpjUtSlmu9yyGyd9yv9QcukG9JuStdhc5UyOIEOhUvUojtuyKxWvAuiXzPiYW/r7G
 Z73xl5UFMUwMOo+ZfogY9vZ2imjPA2KYgHigmlcc7ww7cl23wT2OgnWo6/0uPNEOQiGe
 /qH0I7o8+qNiCQdhC8a3zv8k3S5gK6WoiGZuBb96aZ3geKl8uKqL14VflklidoMW4qUm dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bu83hsux5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 09:36:06 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19LD6pHp029080;
 Thu, 21 Oct 2021 09:36:06 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bu83hsuwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 09:36:06 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LDYeiT005103;
 Thu, 21 Oct 2021 13:36:05 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3bqpccwfq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 13:36:05 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LDa4aN29229334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 13:36:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAD9912405A;
 Thu, 21 Oct 2021 13:36:03 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3BB7124058;
 Thu, 21 Oct 2021 13:35:58 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.26.166])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 13:35:58 +0000 (GMT)
Message-ID: <128368c7888e7c681a2cdd37b9e3849924192512.camel@linux.ibm.com>
Subject: Re: [PATCH v3 00/10] Move vfio_ccw to the new mdev API
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>
Date: Thu, 21 Oct 2021 09:35:56 -0400
In-Reply-To: <20211020224826.GA21930@nvidia.com>
References: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
 <20211020224826.GA21930@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1kMhTByJrhqIjR1FANx7dICLpiseNn90
X-Proofpoint-ORIG-GUID: 8vGcbmOJAtSQOrE9wcjUeYWPaF7Lt51C
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_04,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210072
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

On Wed, 2021-10-20 at 19:48 -0300, Jason Gunthorpe wrote:
> On Fri, Oct 01, 2021 at 02:52:41PM -0300, Jason Gunthorpe wrote:
> > This addresses Cornelia's remark on the earlier patch that ccw has
> > a
> > confusing lifecycle. While it doesn't seem like the original
> > attempt was
> > functionally wrong, the result can be made better with a lot of
> > further
> > work.
> > 
> > Reorganize the driver so that the mdev owns the private memory and
> > controls the lifecycle, not the css_driver. The memory associated
> > with the
> > css_driver lifecycle is only the mdev_parent/mdev_type
> > registration.
> > 
> > Along the way we change when the sch is quiescent or not to be
> > linked to
> > the open/close_device lifetime of the vfio_device, which is sort of
> > what
> > it was tring to do already, just not completely.
> > 
> > The troublesome racey lifecycle of the css_driver callbacks is made
> > clear
> > with simple vfio_device refcounting so a callback is only delivered
> > into a
> > registered vfio_device and has obvious correctness.
> > 
> > Move the only per-css_driver state, the "available instance"
> > counter, into
> > the core code and share that logic with many of the other drivers.
> > The
> > value is kept in the mdev_type memory.
> > 
> > This is on github: 
> > https://github.com/jgunthorpe/linux/commits/vfio_ccw
> > 
> > v3:
> >  - Rebase to Christoph's group work & rc3; use
> >    vfio_register_emulated_iommu_dev()
> >  - Remove GFP_DMA
> >  - Order mdev_unregister_driver() symmetrically with init
> >  - Rework what is considered a BROKEN event in fsm_close()
> >  - NOP both CCW_EVENT_OPEN/CLOSE
> >  - Documentation updates
> >  - Remane goto label to err_init vfio_ccw_mdev_probe()
> >  - Fix NULL pointer deref in mdev_device_create()
> > v2: 
> > https://lore.kernel.org/r/0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com
> >  - Clean up the lifecycle in ccw with 7 new patches
> >  - Rebase
> > v1: 
> > https://lore.kernel.org/all/7-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com
> > 
> > Jason Gunthorpe (10):
> >   vfio/ccw: Remove unneeded GFP_DMA
> >   vfio/ccw: Use functions for alloc/free of the vfio_ccw_private
> >   vfio/ccw: Pass vfio_ccw_private not mdev_device to various
> > functions
> >   vfio/ccw: Convert to use vfio_register_emulated_iommu_dev()
> 
> IBM folks, what do you want to do with this? I would like to go ahead
> with these patches so we can get closer to unblocking some of the
> VFIO
> core work.

I'll try to look at these today. (I'm presuming I'm still fine with 2
and 3 :)

> 
> These patches:
> 
> >   vfio/ccw: Make the FSM complete and synchronize it to the mdev
> >   vfio/mdev: Consolidate all the device_api sysfs into the core
> > code
> >   vfio/mdev: Add mdev available instance checking to the core
> >   vfio/ccw: Remove private->mdev
> >   vfio: Export vfio_device_try_get()
> >   vfio/ccw: Move the lifecycle of the struct vfio_ccw_private to
> > the
> >     mdev
> 
> Where made to show how to structure this more cleanly as Cornelia
> asked but are not essential and IBMers could test and fix to get this
> cleanup when time permits..

Sadly, these ones dragged the whole series down my todo list, because
of the scope of rework it entailed. Will keep it on the list, but
agree it doesn't need to be bound to the first group.

Eric

> 
> Thoughts?
> 
> Thanks,
> Jason

