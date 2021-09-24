Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D563416A39
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 04:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77C36EDDB;
	Fri, 24 Sep 2021 02:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAED6EDDA;
 Fri, 24 Sep 2021 02:55:09 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18O2cCaa002980; 
 Thu, 23 Sep 2021 22:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=+HcicDOcrWyKCsbaNcrukRSHl9ZaDa0GrVwFF00Sqqo=;
 b=Nlko0ltP8mWBzUD+vP2yi/Y0hGdL75yhScmrPOVGAUK4me3KJgrkWOl6R7DQEiuOiFrr
 +MDyYV7HOEWVMAUupoTlcZ4lPFNXuRBbal03VM9oRC6Z7Ka7g6LmRgACUFKSZvG8w3br
 mzoFvmqVRoO2u/+tm2H0Hs1WClvXAmzRXby1HQeLKRc5CuAtZJ7DpLxvNhfyDCzBV2zt
 sPBgIKSJZ804Rr9ly4f9Za2WLRYmh7SgdM65+LgZjLElOEJQA0CmeNah3eGiVoeS7Jzl
 Mh+svmCacG/xw7zr6DZA6dDbyO5wp40P8gmTUeMNDaHkv3SJ2Y54Buzd47jU7b3UW5ri ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b93sqjs0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 22:54:04 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18O2iYYP012633;
 Thu, 23 Sep 2021 22:54:03 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b93sqjs0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 22:54:03 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18O2lXBg002397;
 Fri, 24 Sep 2021 02:54:02 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3b93g1u8qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 02:54:02 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18O2s0W313107584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 02:54:01 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE8066A069;
 Fri, 24 Sep 2021 02:54:00 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D24E96A051;
 Fri, 24 Sep 2021 02:53:58 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.34.14])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 02:53:58 +0000 (GMT)
Message-ID: <5ddac3486877e7cb23b4331c13abc48958c326b7.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/9] vfio/ccw: Pass vfio_ccw_private not mdev_device
 to various functions
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Date: Thu, 23 Sep 2021 22:53:57 -0400
In-Reply-To: <2-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: <2-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e26MlDt-Sg6HXet34ekUjWZrsFf_C0Ew
X-Proofpoint-ORIG-GUID: l1ABnL7r5vRRX0SOepswbbYveqytuYNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_07,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240011
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

On Thu, 2021-09-09 at 16:38 -0300, Jason Gunthorpe wrote:
> mdev_device should only be used in functions assigned to ops
> callbacks,
> interior functions should use the struct vfio_ccw_private instead of
> repeatedly trying to get it from the mdev.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_ops.c | 37 +++++++++++++----------------
> ----
>  1 file changed, 15 insertions(+), 22 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>

