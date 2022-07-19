Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856DA57AA90
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 01:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4481127B8;
	Tue, 19 Jul 2022 23:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319951122EF;
 Tue, 19 Jul 2022 23:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7pSYIXOVdwXkxKsU+x5V7cLKnXidegKiKT6pH7B3qZquSV6I3i4f4N8Lz1bHnV+/q0+q2v4q7j2iCvBAYekoPosD1FYFxWljd/DahGTljMSSUGdAJiKp13cLKTYfKmW1dqkTQMczwi+/ELygocH/b/TQZZc3H/OOfS7QEgnYB4CRpwng9e3yOQirwApnwbv5/rmk3gH01N1ziIbj/vBEoe5xi8Wl1zU7EoCq8XSMloPYT6YLUjKXx6Dzh1ISQkVNIhZfGzguOHhBhhbt+Eaz527hDRPv8ZR6ToaTaDVWIMTSyBM3Gfe16t5278+JgJFpPyNBONMbKCCXoVIA0U97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXnNys0O1DqtDFw4CkWzjzHLuk+wqaQe4/3Fi/PiGQA=;
 b=Li0RKi9t1UCD/mMiKSZ6ub/WS9wM4SZAQ/kqorJa96ky9RHZjqXWd4dVPRCn8elMcN4BMIjYiWvXaPm30StPT5DzvXD6qKF3gdu/0Bo+Sv5fApum+dHg1dz1CO5ZWwxKPM7qmd+SdSITBIBitlMjEgsTxvOBpitTK0ouerCz7JQ+oYSt64S+757ZSM37v5PHFfQ0M5lHsdpg/KUh1Ptxs5PDnz6R/zfW1e2lBRhltbARS7mAwkCTyrTXDRchgk6XjqxukWOjAzrBUIKVdR4VLvSHEEkqNbIgVwSU5G5pnEFVxv/NiSNWbN+u+Wmx2GQjOz5IP9qByHZ67qtBEocjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXnNys0O1DqtDFw4CkWzjzHLuk+wqaQe4/3Fi/PiGQA=;
 b=C+WNj5hOKTdvubpvqcKLCSue6GKNNnBBhbFM+WS9LZA2RvUqrXjQ6GPkLJedyHVAQ2yAWDQYIeOKiILONQI1UQB29RVpqeFFGr9W8i8FlFbpiPkbI24Yn/YeFmOFmH/sy31TriC4iqeKb0OpCnBEVqrsxovGw5pvTtWFJAeQLYKa+u3Hgbmukv03j+CJK6qh6pKVTRJxom3atxDkbWhH2ueK/FdBMzJqENWG4KCkiYCdevfrYjDgYdBgIEj4Si93tZnHMjGFp5pRaOAreDFj9dOohPtjjNhIsk9BpuZOhSJGW0icxPBQxmC10ZtTv1OOQjPh0gkj77i8v9CArmbzwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR12MB1826.namprd12.prod.outlook.com (2603:10b6:404:106::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 19 Jul
 2022 23:44:21 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 23:44:21 +0000
Date: Tue, 19 Jul 2022 20:44:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220719234419.GN4609@nvidia.com>
References: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <20220707153716.70f755ab.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707153716.70f755ab.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR19CA0023.namprd19.prod.outlook.com
 (2603:10b6:208:178::36) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88512fab-cb7b-4212-2c1d-08da69e09a53
X-MS-TrafficTypeDiagnostic: BN6PR12MB1826:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vk6/QX301/at567oC9cB3L7LQ5l7vO9sw7P2AsVEOE1d3eF11Nzg8ANM3EWg3etR67V9FD2A18JnCy6Pod8D9/cSRG6BSRzfLExJ+S6zaXlSwWG7q+0Nki9cWfEPRLEV75Q8+LVvdekVoMDh98I8TQ2Z5zmzxJ1EOMoy5UBB2Z68JwSks+qdKDjnEBLYcEBoSM1YCU/ii5rdzk0ZNjKMv6PmB+XDE8bsDPbPq0QNp0Dwmr6J3soHuWKFkOJ470u3g/7GCYjCdkM8/Pcb5F4fwu/+v+Pu5/mI5709j3CGfk2IdoFxok9qP9PzY3Zk4f4pHgS5cWoZLCsJIBhFkqCbPI9pJLWaP1z+zbCIS1olnNFGoQwugVUKYchh7zoPS9/1CD+ERSGeklC3wklJV2G/Yb66ukf/qB8MOz0VjS3avGrKX2L0gBaPoSAuYIYGrd45+VaB7MvpV41aHUf8IFebKvZa+F7LnNDSBQT/oDEkZjc51578+AEuASFwA/ZvwM7qAzhBly4l6wQoA0mw9FWaR2WeaItQD33VZwNi5SaW15ujBfONzp81iJIbw0sOpvegYtHko9/HWafrzsn8+c7LlvWW7aFkiTa7VW3VVrLBcZabmakBNgPsKPLS42HHuxchoaN3fCLxomcEn5OTvZCSrVhrMja7XvtmKwOV6/9QOIkm6ILC+tofWvVGlJKSIvDtPXY9jgeCETszyGrlPsAJjOnQaGVOaC5rPSZ5/eLxJKiB+uD+4QVJo8l1TwVq9aHg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(6486002)(478600001)(54906003)(33656002)(36756003)(86362001)(186003)(26005)(6506007)(38100700002)(6512007)(41300700001)(316002)(2616005)(6916009)(1076003)(66556008)(7406005)(5660300002)(66476007)(66946007)(7416002)(8936002)(8676002)(4326008)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ya5nanjx24DbVYlPZHDEIkFaXmzqJKqsi9nVVhnCRfNptdyXN+M5Q9mCf+O?=
 =?us-ascii?Q?/qJLBMvN66wKwWvAzjCvdX9OU1nFEWDW0XVja+wOnQ+wg14ccpWjac3wvv6y?=
 =?us-ascii?Q?R2imo848jusZWlDrSj40fI+QfreUtWS3H0VXU+eW07wfHj2tZhUH54KmiTtt?=
 =?us-ascii?Q?MRPrNDNt+am8slasV9Zs9+bdl2b/Q2r6S+bWyNMPMtPXNKfKGm7Eux7oZJZv?=
 =?us-ascii?Q?Tro1b+YiM/ZXAJi0+0ShEh+vZEgfr3VUHSatLXTKMoWTCj4UWpv/6yI0yXZ9?=
 =?us-ascii?Q?6rxZrVSaP18SV0pOyBu7KgRt8FxIpA3EfwLzPY39pSJzGmx7AmTXDTzWQsm6?=
 =?us-ascii?Q?AhryHfpmPmz5lg2mM17IUJN8NbB+PD/xsGGKo7e74HUHd2h5FQ6EinwHTw6i?=
 =?us-ascii?Q?mgxsiQkg6AvXSxG3IIcEGh0w3dhymNeNB6I+nAeVFzDm0BQfq0T9MQtK5wBQ?=
 =?us-ascii?Q?ZavSHCZ/Je29ebwuPconclZZ1qQn+APgszQC5ARG54ukUAb4OUKEqUzdyI7A?=
 =?us-ascii?Q?GdEfKkCKB9Pftvjgn9fvEWoFSn1X3s9r9mqXtngSoBThDKhchSBMdXdCoMxW?=
 =?us-ascii?Q?kvGZuhCjOKAkbE2nxCrjP42JyjWAe5vDob6HxB1TIO7U8lwSr/1O0MzZ/5LE?=
 =?us-ascii?Q?q4YjKx3Qe2CkTgwpTs+d276OmOG1Yyfz6U1HsDd3UheU7kY0P42u/spyn/Mm?=
 =?us-ascii?Q?agp3jWAMuL4LNursIxK7tc3aeGlZ6UisAqYma94J1iUmUE2nS5FoK7eAxN6N?=
 =?us-ascii?Q?2gzZbIHtXGKflDfjPOLmEEc30FMU7rOBGOcKGvLS6ErAuuQvXxR3tgV7VBAg?=
 =?us-ascii?Q?SaLQ6llwdtZODk+3By+3R4wKn/Zk6iFb2tmvLdSb/W6VNuP6FUu8EqpTncUi?=
 =?us-ascii?Q?CesmHIG4EBOT9OkjuD4Aut/Sp2V90gf++5pP8SD5UKvkqpFatopqAOXwfHFt?=
 =?us-ascii?Q?wEiW0jvBMT9CZi7DhCFOg6kua/JIBav5ExSpvJkaavgHQo1IR/Lav0b3qUAW?=
 =?us-ascii?Q?jSvbkz+CL6WyBeYEleXAN79Ek39qxt++kKBR0rADLST/JTH/FcaQVpnnkjT3?=
 =?us-ascii?Q?J9DdrXeQN7mbLkoGTxxodbLy8/RBODU9QhjqH1+euOz7b/uEDDCJucSUCxVY?=
 =?us-ascii?Q?7Seknt13PvbJ7kj1Fmn6E+H1l1KO4gmAd1Xe0XHcWa8JWmDbAtGMp3GE5dRn?=
 =?us-ascii?Q?nT++DD66PU08XveabrTWY3GC/pTxKnJbEw8ekIETNyTgnzGGoxLbIPEASXLs?=
 =?us-ascii?Q?ew5KkCK2zV8cPR8MZe57USr+B8/S7yERjTkbzfqrkNw6xWZ9pIrC8fbntiga?=
 =?us-ascii?Q?LPGXa0MbW9nyzzbDj50PZb/0Z4GrnRBf9yRBJbJRH3omoj58z/kUuR44l9mS?=
 =?us-ascii?Q?j9OqFwdSH8zVUH2PIj6Rb0piCbphGg7q5LqL0bgpU6yVwcTBwa97du52Qecj?=
 =?us-ascii?Q?qQqSukCjCvxsY2uPhEwc7+rrq0K8j6q4JXLMuI4sw76V6c8XDHUCaxvynkLz?=
 =?us-ascii?Q?UzQfwAiFbfKdT9tv459auonpZpnprB89oIKmRAhDBkn58AA/bGYFadtTVa4f?=
 =?us-ascii?Q?WmZREERcqHOjb0tnpi8cFhSobr3zJCPct37AfxCS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88512fab-cb7b-4212-2c1d-08da69e09a53
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 23:44:21.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 095s79ywBMGwhsiW1V75hCNhjAhNzvpXW07SrNdfel2ueXd7B4SVPbbi/vGMKc5x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1826
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
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 03:37:16PM -0600, Alex Williamson wrote:
> On Mon,  4 Jul 2022 21:59:03 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> > diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> > index b49e2e9db2dc6f..09e0ce7b72324c 100644
> > --- a/drivers/s390/cio/vfio_ccw_ops.c
> > +++ b/drivers/s390/cio/vfio_ccw_ops.c
> > @@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
> >  	return ret;
> >  }
> >  
> > -static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
> > -				  unsigned long action,
> > -				  void *data)
> > +static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 length)
> >  {
> >  	struct vfio_ccw_private *private =
> > -		container_of(nb, struct vfio_ccw_private, nb);
> > -
> > -	/*
> > -	 * Vendor drivers MUST unpin pages in response to an
> > -	 * invalidation.
> > -	 */
> > -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> > -		struct vfio_iommu_type1_dma_unmap *unmap = data;
> > -
> > -		if (!cp_iova_pinned(&private->cp, unmap->iova))
> > -			return NOTIFY_OK;
> > +		container_of(vdev, struct vfio_ccw_private, vdev);
> >  
> > -		if (vfio_ccw_mdev_reset(private))
> > -			return NOTIFY_BAD;
> > +	/* Drivers MUST unpin pages in response to an invalidation. */
> > +	if (!cp_iova_pinned(&private->cp, iova))
> > +		return;
> >  
> > -		cp_free(&private->cp);
> > -		return NOTIFY_OK;
> > -	}
> > +	if (vfio_ccw_mdev_reset(private))
> > +		return;
> >  
> > -	return NOTIFY_DONE;
> > +	cp_free(&private->cp);
> >  }
> 
> 
> The cp_free() call is gone here with [1], so I think this function now
> just ends with:
> 
> 	...
> 	vfio_ccw_mdev_reset(private);
> }
> 
> There are also minor contextual differences elsewhere from that series,
> so a quick respin to record the changes on list would be appreciated.
> 
> However the above kind of highlights that NOTIFY_BAD that silently gets
> dropped here.  I realize we weren't testing the return value of the
> notifier call chain and really we didn't intend that notifiers could
> return a failure here, but does this warrant some logging or suggest
> future work to allow a device to go offline here?  Thanks.

It looks like no.

If the FSM trapped in a bad state here, such as
VFIO_CCW_STATE_NOT_OPER, then it means it should have already unpinned
the pages and this is considered a success for this purpose

The return code here exists only to return to userspace so it can
detect during a VFIO_DEVICE_RESET that the device has crashed
irrecoverably.

Thus just continuing to silently ignore it seems like the best thing.

Jason
