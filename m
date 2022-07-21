Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F557D087
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 18:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9167110E713;
	Thu, 21 Jul 2022 16:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E7D10E2E6;
 Thu, 21 Jul 2022 16:01:59 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LFhinO024568;
 Thu, 21 Jul 2022 16:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=TaPE8p4zRacJwxm8CjbGhlNhxea5fkhzEN8EU5aQYyE=;
 b=cBmM9Eqp4ZQsP2j0tXMM8GUwxATdykM3MV9wR/h9f64IG0oaQrLqvK/SmrUNMRuqMh7H
 dWK0um6oD73AIPzzyFLZ3Y8OvWVl1U3IQbTxzb99SAGO8Fk1MN+hjgrraqjmeu7JKo2Q
 NBOtHVA9pRF4xIV89WDY1cIIIGurnoDBDH3Py/tI5eTB/QCcF/a+TLkbiwAYg3ZR+2AP
 E4oL+Z7WDVL0ayz0OdKz/TSqp/7hUej6Sr+vvuKX13WVJXBRPgYlmDlr7eWIquXPGi6y
 aN1TBqAh3FVx+ROukA0r2dpf6ZYvT+02Pjdbij0PQCvh0OJ0/YeQZc+QyAo/2llrR2BK GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf9pp8ghk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 16:01:54 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LFj2Zh029463;
 Thu, 21 Jul 2022 16:01:53 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf9pp8gh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 16:01:53 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LFpggq032003;
 Thu, 21 Jul 2022 16:01:52 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3hbmy9gu1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 16:01:52 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LG1pHj42336690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 16:01:51 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 683B26E054;
 Thu, 21 Jul 2022 16:01:51 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0E3D6E04E;
 Thu, 21 Jul 2022 16:01:48 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.146.30])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 16:01:48 +0000 (GMT)
Message-ID: <d4b7abce8ef8646819d32fef57ea51e38cd53f1b.camel@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
From: Eric Farman <farman@linux.ibm.com>
To: Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>
Date: Thu, 21 Jul 2022 12:01:47 -0400
In-Reply-To: <20220720170457.39cda0d0.alex.williamson@redhat.com>
References: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <1-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <20220720134113.4225f9d6.alex.williamson@redhat.com>
 <20220720200829.GW4609@nvidia.com>
 <20220720170457.39cda0d0.alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j8vE10XrFQQgyuYkPEtpHYy1GdUqgbS6
X-Proofpoint-ORIG-GUID: Vz-1MomDKDuiP-p2pkQwTSfVtBTRxQgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_18,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210061
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-07-20 at 17:04 -0600, Alex Williamson wrote:
> On Wed, 20 Jul 2022 17:08:29 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Wed, Jul 20, 2022 at 01:41:13PM -0600, Alex Williamson wrote:
> >  
> > > ie. we don't need the gfn, we only need the iova.  
> > 
> > Right, that makes sense
> >  
> > > However then I start to wonder why we're passing in 1 for the
> > > number of
> > > pages because this previously notifier, now callback is called
> > > for the
> > > entire vfio_dma range when we find any pinned pages.    
> > 
> > Well, it is doing this because it only ever pins one page.
> 
> Of course that page is not necessarily the page it unpins given the
> contract misunderstanding below.
>  
> > The drivers are confused about what the contract is. vfio is
> > calling
> > the notifier with the entire IOVA range that is being unmapped and
> > the
> > drivers are expecting to receive notifications only for the IOVA
> > they
> > have actually pinned.
> > 
> > > Should ap and ccw implementations of .dma_unmap just be replaced
> > > with a
> > > BUG_ON(1)?  
> > 
> > The point of these callbacks is to halt concurrent DMA, and ccw
> > does
> > that today.
> 
> ccw essentially only checks whether the starting iova of the unmap is
> currently mapped.  If not it does nothing, if it is it tries to reset
> the device and unpin everything.  Chances are the first iova is not
> the
> one pinned, so we don't end up removing the pinned page and type1
> will
> eventually BUG_ON after a few tries.
> 
> > It looks like AP is missing a call to ap_aqic(), so it is
> > probably double wrong.
> 
> Thankfully the type1 unpinning path can't be tricked into unpinning
> something that wasn't pinned, so chances are the unpin call does
> nothing, with a small risk that it unpins another driver's pinned
> page,
> which might not yet have been notified and could still be using the
> page.  In the end, if ap did have a page pinned in the range, we'll
> hit
> the same BUG_ON as above.
> 
> > What I'd suggest is adding a WARN_ON that the dma->pfn_list is not
> > empty and leave these functions alone.
> 
> The BUG_ON still exists in type1.
> 
> Eric, Matt, Tony, Halil, JasonH, any quick fixes here?  ccw looks
> like
> it would be pretty straightforward to test against a range rather
> than
> a single iova.

Agreed, ccw looks pretty easy. Should I send something to go before
this series to make stable easier? (It's a trivial change in either
direction, so either is fine to me.)

Eric

>  
> > Most likely AP should be fixed to call vfio_ap_irq_disable() and to
> > check the q->saved_pfn against the IOVA.
> 
> Right, the q->saved_iova, perhaps calling vfio_ap_irq_disable() on
> finding a matching queue.
> 
> > But I'm inclined to leave this as-is for this series given we are
> > at
> > rc7.
> 
> On the grounds that it's no worse, maybe, but given the changes
> around this code hopefully we can submit fixes patches to stable if
> the
> backport isn't obvious and the BUG_ON in type1 is reachable.  Thanks,
> 
> Alex
> 

