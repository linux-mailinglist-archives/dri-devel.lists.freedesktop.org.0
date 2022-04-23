Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93850CA1D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 14:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68D3112116;
	Sat, 23 Apr 2022 12:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516B3112116;
 Sat, 23 Apr 2022 12:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li8PcwZjfbWVHN7xA/oatSMxcXPxn36fbusg/+mVdIU9JXkjhhzEA+vVRvq6lDJpH42OzzXY3dXahBhnjK/odqZKWslokZeDL9ei29n95F/d+pDkFwI/AerBzSx2/ElP4srVeblAjB9amfbvtxlTtsDKksGlhciLnW02hfqdsUxAxe+fTcPzvZvUvA8UguttDS1FygMO1cWBuZFTC/j7OWkmyen2ELSdAC42IjyupZD13CJ7GeLjLNS7kPM45+7pOJa2PZhpmg1NFuNe5aeP3xdquUCPqZv19loJMb3XKeQowcV54f4BhErc7eAQievvjkrKNLrYqNDY89yhUE2R8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LU1z22KXlDpV5Kfz7jKeG3fM2JH1nfPsDZpNyua6n/w=;
 b=Jei0IT6azEPBkU8mTiGlqSfgqjY3qCfFvz3mXefENNStVfFZmCKRFO1S8pd/CI/Idjw5V+HhL8fpw4Gp6sc3Kd8hPWagAy7LVWSU3KyiFkXmeLa46B19dDmOW2Dcp+65D/z9vwQSBoAiDZ3hVfnKkAt/dzOQIvznn36QFPGqg/N7gOoQU3s4AHd2XPn9eohwOUy8pQc5Pqv/gLGb1ieZgS3M3e21RiU1HO5Mpw+CpR4Dd2Hc6BZJGobBlCb8QsVChGtC58KWlqJ0qwAueFgBjCH+VOhkKiFzH359LdcMIwx58Rv5u+TxGRfGwpDMX53JXO74jJ6oce7q2v6zF/ZGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU1z22KXlDpV5Kfz7jKeG3fM2JH1nfPsDZpNyua6n/w=;
 b=klSuTCWNK0Oa/PaN0sB4J564YR8LL7YdyIjdLJRqm1HX3l3bDCvrBAStl0WTW6aIwnQBRoocEfgjDtoRIzh0GMPh/RZEjPKHZ9eUQgL8sUmlVEEnLVGQm1kNjI52sSL1oaMn9o+q/037aOVSjGUcq/ycOyYxfc216HMS0FpGa/wYIpmOV3/us3gXT5n7K7zN4B/l8FrgRFW++pXw5uaRC/B8ZaChMy5av+tk27hSF2ydEDFenE046iihLV01RniPtd8ycPWATbW7WDMmz3H8D4vxkJr9pxbxw+fW/IhBLx5WJv5ee2NtS9X1kOmTPuu/VrRBJLNYPs0n7wKGQM9xQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sat, 23 Apr
 2022 12:49:14 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.020; Sat, 23 Apr 2022
 12:49:14 +0000
Date: Sat, 23 Apr 2022 09:49:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 3/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Message-ID: <20220423124912.GM2120790@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <3-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <20220422062232.GB11926@lst.de>
 <20220422205651.GF1951132@nvidia.com>
 <20220423051551.GA17488@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423051551.GA17488@lst.de>
X-ClientProxiedBy: BL1PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66951928-5e1c-4992-01ee-08da2527ab6c
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5805331FC83E0085514F2402C2F69@PH7PR12MB5805.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ubtX0keUHbsZ+RF6ZxcWLoGuVq/FaeinJRZrw1Qh4wnVw1gCKK6WlysTMtYOCTbK5psC1eKrVp6Zxp8UBPmsJs81cNPcKxoYUzZSB9FBoKrMoh7LXF7ZQI+DEEWKCIqTjwX0NdNKA7H9VIbL/xUMJsv4TUSu+DFXucen4TrNNOnET51VDpbDu4fq6zAbifZCcjWdDKu5ahhcb8WL4T4GpmzSq983g5BU0kxQm93JKJzah5n7ReosIzRr2Q0SnTmQoyUTE7xkZZE/2aSGoczMxjW9/TDOqn0yA7qI3TErFGlUsvSVPEO16e1EGaR+1a1HylHQv21VNTbaZKapS0Q9hQg8NP43qQk5dmYk2D5zQmQ1jivZWzg9M/QuDBRe1iP/JQmQP0ratCA40uoEw+5KpzkZWfLg5iLd6thoORL3suv1g+5cnl1xpKmluZq/M8kK1mKUGP1faeziuUv4h8Jsnlr7XCChAtUoNFPCiK408RYlOZQNzjS8o+POdxWH+H5UQCanMT4Z41sQsu0Sq6dIt+QjRT1H6nTpQxnen+o7gMnL40VPTiUPgnwpLTYv0EM8WMnw6860fEVZICGgJJzdXFnOmIPzRd53fjURmuhI87IsdMKXqi2Htn6r85325a7z0erZvJak87Nnu2dhK0OYXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6512007)(66556008)(6506007)(5660300002)(2616005)(8676002)(36756003)(4326008)(54906003)(6916009)(38100700002)(86362001)(2906002)(8936002)(66946007)(66476007)(33656002)(316002)(7416002)(6486002)(7406005)(4744005)(1076003)(186003)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+JXR+9hf/Iq3AVIFoPWaSTjV7PKo/QU+hiwKyzCnjvW28iYNDEu+itKr8zAx?=
 =?us-ascii?Q?PxzafGtPGjlblRi3J7hjxX0r1Z9wlVV2/NALSzA9S+JxvjY+y4JSLQ/oTBts?=
 =?us-ascii?Q?cQhHZTq+pNVsud5ER3gdNZ82GfhGzd8sf8nUegRzLcvFt+AnJc5XnHoNTSPQ?=
 =?us-ascii?Q?wvzkofzqtth0IJTad9VUXpzMQr/nQ3lklOZFwyLpeR+5XsCtMan80Av0zC/Y?=
 =?us-ascii?Q?dO5kYnpQrEoWNoMZ8pGPtj3JQyiTi77LmpHMLqLe5+nZYzJliJ6cpoe0Otej?=
 =?us-ascii?Q?kQiC4rmoO/7Iqqx66GyjOj3JEGEG5vll6ZRSyvPBzPX4fLJ2jrLLSmhjObdc?=
 =?us-ascii?Q?agv9paQPVe8EcLvrtL86Tpz0DoToqQ5hFDIG4IUwN+H1JxVi2gOBJkq6QMOo?=
 =?us-ascii?Q?qCbZY9mT92KUnWCaEVfxeLfzV6Lvvd0aZ34yOXeu4q6xo6UTCyymX7hFGPSH?=
 =?us-ascii?Q?++N+bfI3pIE66UVGo4pqZEp2UWFftdlWqJTJlsHL4CvhfRJyHnRD40l/aoFK?=
 =?us-ascii?Q?YhU7OcKqBJ8Dkr6O+Y6kRfdlOlqB0dO3GmYzrUPrh7QYwX0WpY+9dWlC78W1?=
 =?us-ascii?Q?eSngDe1QHkoYNJgm5DF7tms5XACeyk0UbIC9S+QyCh2DcuypqobkBg1Wjbn4?=
 =?us-ascii?Q?LSXxtD8I72fWcVsa7IKKB7EXjuPtXWvUamrgJ1v00mhMIuvpnNajC0YsklP6?=
 =?us-ascii?Q?ZneacGoF6ZoHqKgfhDA5cLva9YCNtVbkicneJj8eNjky/kBK+hJ7ES/yYP0I?=
 =?us-ascii?Q?bf0DYbaAy0141h7T2I9eT5/5CkF9a+m9ZZ/Ums4LbtzzRpU7mcDFRZU/p62p?=
 =?us-ascii?Q?jiz4h+JSViAf0mOKSxwygBIKkCC4V3iPM9beUqRquVEV2dvJ3PmCOBvQO8ku?=
 =?us-ascii?Q?uEF3Igh0SjZFtbC+f5PL6CsClGNk99P8M+VJvdv0N/O44DJ9H7YXLY+k6sZi?=
 =?us-ascii?Q?VwFHBWAX/2m4+g4PF7aiMLxyLxfnEpOVC9LD6PvYAk8mBmHa735cW0n+KzDu?=
 =?us-ascii?Q?2XTNdk4gqAGjYcEJ2OEEmZruT22ds5qxwS+0eR6phGa/BshAq48L5qeAOCz+?=
 =?us-ascii?Q?Xb/e9HPA3/Bf0iV9AD6WjWoJERDYrr9JYUpNzkqGCRWHTTxxKGk5eSSUw1KZ?=
 =?us-ascii?Q?k928kKCGbSi08fBQHZOReQbDYPQgdQA3Cu/2RdCLQxOfLYPUBUG2P9Tzf5Z0?=
 =?us-ascii?Q?Dg22ljFLF8uZJ8iO2jREUh+7oHEXmz3ijW+0ixrrVqNLjUM14XaEccYuBUPr?=
 =?us-ascii?Q?WC7SMZmUEh42Hwbm3vGOqUOmPOEeXwhvtoSqdzntTSzz7ppE4kCeMCWAuCjh?=
 =?us-ascii?Q?6oa0KCmoFkhqeh/kHjhyIvtJFr7AOgV61cVsGqoayWoxJf6O2TS7qCOHvI0Q?=
 =?us-ascii?Q?3a6EDBSmojDnhTnh2FoO1wMKkqDE3TrOLjnI4JqYNvhi6pijKMp423MH73Wg?=
 =?us-ascii?Q?S0tYPIQifz3PvVOFNl5tmuGG9tx//6HtRnIMP1gbB0gGcYo2jod0KZ69m/s6?=
 =?us-ascii?Q?0gAnd/qQotCZEOztKCgejdq0ROSN9CJI1c4TokUydM0lUHZ2++Jwh0SCDH22?=
 =?us-ascii?Q?CN1Ctrh/iSDJysHI80UGFt5P4cYUdQsrqXlP67BVp0C+ozwlRRygc0M2qT3Q?=
 =?us-ascii?Q?LTqywR/97yL12+19+H4ASKT/vCHEu5ToA75AV+TmuLjE8hOhSI1jtHaIcwc/?=
 =?us-ascii?Q?sI8+jTQR5H1hAaijAb89co5TbkOSZEA4KAlYhhn2AnQdZp4p4GN4Gh0Cn6AW?=
 =?us-ascii?Q?crYm6U3tyA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66951928-5e1c-4992-01ee-08da2527ab6c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2022 12:49:14.0187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLdN2WccaPZGCSqsZ+KH7BiV9yIysu1uF7jvV3dGQpzCaODOrX6LcyVgZNy0Ptq1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 23, 2022 at 07:15:52AM +0200, Christoph Hellwig wrote:
> On Fri, Apr 22, 2022 at 05:56:51PM -0300, Jason Gunthorpe wrote:
> > On Fri, Apr 22, 2022 at 08:22:32AM +0200, Christoph Hellwig wrote:
> > > Nit: why do some of these patches that don't touch the mdev code
> > > mdev in the subject?
> > 
> > I consider these APIs to be 'mdev apis' because only mdev drivers
> > should call them.
> 
> I thought we settled on 'emulated IOMMU device' in the VFIO core for
> them, leaving mdev just for the odd lifecycle management glue.

Yes

vfio/emulated

?

Jason
