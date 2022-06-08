Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590454380F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CE210E6BC;
	Wed,  8 Jun 2022 15:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFE810E541;
 Wed,  8 Jun 2022 15:51:43 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258Ee8Pd017857;
 Wed, 8 Jun 2022 15:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Lk0It611U/P8w0OoOgtqUslrDxiX8rH2mlYcAYsbsS0=;
 b=DBmOimV5vskk/4O0H+ASMGsNH63DhJtNCLTnFgqZRUTK+X7zMc3lzDikf4MIzRHvOo+n
 CVuXtMEUwvjuCMOsUvQCLxzvDPxq7MQJe7nH+QxMrKvnDdWtXb8oyiJThMyDSNmQyxD3
 ijL4l1DZuEndT6CwVj7RjePrrfdNownPuIdFcAe2iz7z67jgpwlpo6+o3tw5AN4Gu+24
 pg+OxytyddKWHjnLb8mNA5mmg0dpDiOFrVNo/85Pv/lEsOcOUlXsqNxyxX9Z1qi04T0N
 kBV8kNOLpxfageJqTysUeV/gNjQBlwj1yN5Oz04VInZCZj3AJdqMbvLCgosERRxiDkCE ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjum6cr0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 15:50:38 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 258E4HP3023930;
 Wed, 8 Jun 2022 15:50:37 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjum6cr01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 15:50:37 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 258FoSB1013311;
 Wed, 8 Jun 2022 15:50:36 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3gfy19v6w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 15:50:36 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 258FoZtr41419236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jun 2022 15:50:35 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 346DC6A04D;
 Wed,  8 Jun 2022 15:50:35 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A70566A054;
 Wed,  8 Jun 2022 15:50:32 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.94.47])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jun 2022 15:50:32 +0000 (GMT)
Message-ID: <1ae0abaaa4fc7959ba25cf59b3ef0da39bfc7f36.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Date: Wed, 08 Jun 2022 11:50:31 -0400
In-Reply-To: <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
References: <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c5zZRiJ_GxhZY7_iHg0OAYza3tR4OGQ2
X-Proofpoint-ORIG-GUID: Etbix-epMN6oZyGKbVGn0eVZ0GN7YlSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206080065
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-07 at 20:02 -0300, Jason Gunthorpe wrote:
> Instead of having drivers register the notifier with explicit code
> just
> have them provide a dma_unmap callback op in their driver ops and
> rely on
> the core code to wire it up.
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------
>  drivers/s390/cio/vfio_ccw_ops.c       |  41 ++-------
>  drivers/s390/cio/vfio_ccw_private.h   |   1 -
>  drivers/s390/crypto/vfio_ap_ops.c     |  53 ++---------
>  drivers/s390/crypto/vfio_ap_private.h |   3 -
>  drivers/vfio/vfio.c                   | 126 +++++++++---------------
> --
>  drivers/vfio/vfio.h                   |   5 +
>  include/linux/vfio.h                  |  21 +----
>  9 files changed, 87 insertions(+), 239 deletions(-)
> 
> 

...snip...

> diff --git a/drivers/s390/cio/vfio_ccw_private.h
> b/drivers/s390/cio/vfio_ccw_private.h
> index 7272eb78861244..2627791c9006d4 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -98,7 +98,6 @@ struct vfio_ccw_private {
>  	struct completion	*completion;
>  	atomic_t		avail;
>  	struct mdev_device	*mdev;
> -	struct notifier_block	nb;

Could you also remove this from the comment block above the struct?
Besides that, this is fine for -ccw.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

>  	struct ccw_io_region	*io_region;
>  	struct mutex		io_mutex;
>  	struct vfio_ccw_region *region;
> 

...snip...

