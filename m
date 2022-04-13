Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9524FF5DB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 13:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A63710E172;
	Wed, 13 Apr 2022 11:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22A410E0CA;
 Wed, 13 Apr 2022 11:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3HZ6bOBIaUZ2w8ponh8vfOdkbkf2xvAXqpSigBYQ+wdTpc4W7ZRnCaq472l7A9KGRxBuj3uTa1jrtJRVq8YPtZ6+wyOo3a/oK3LbsmnpBoDWl/MAE8ckWVLy9ZzkciD+qL8dbkjFePR4KMV0J5Ljbla+drB3DlGQ6xCcUmGjbvtc/xc1490BJ7Mt6L3C7jcbPThplt7XAm3iNfY8cRcgi/cDk2lZKnbXU01J0Dlxf2Iq0RJIul6zQ04+TwDPasLRCPSkgeQ2R4iscj3hkSJMd3zegNRCEK4WcUexEWksgoObMHKUmNTlffgO8z0AibRIigiZxeH2fiC60upnwQp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5Q0j+aLiqhDmQaXXvceM/RAGyCvT1VUIwSoSQqtz3A=;
 b=BkB2uLr9nfxUyChgqIjYIShp74+JcvPUV1LlAPjtmeFkI12o0AOd1BiJWyW7Oj2IuptP7aJrkhppF6rbzPWBv2UJ9VwbMlXxWAYKtCudii7p+2wFmsKYW5i2oLirZKPqF8e6cPBwOFXs6VJFOA4Px6Ax28QDsxCxpO+VRRC7GW57mZuxW2tzUWZIZxw4JV10rjLba3MllwbataH5N/SoV0eb1LD5/hwlIQ8yqKUI+OeuDx83hKUBVMJI8acUZWgG9IBc9HGpHhYJRn1haZkBnMGj+JmCWskPpozgPHZCauEjnb6c/qqH1soe+sW5A9X5zDiZ/GOzg2dwLqDcRSITLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5Q0j+aLiqhDmQaXXvceM/RAGyCvT1VUIwSoSQqtz3A=;
 b=XRy9XZ9bHiJCp+ByDmrt7PV4ysdTgvSRkO+1nNQMFpH4pBkbHY86DCqq1wxWZS4mgYBSGZqTU+fA+EUR9wFS3pC0H/R5DXs15rZfB8meN+iTXmMwI4g05FITV3uo5vOIBQ/wiZwLemm5zl755EsFM3MH6QDwuzwdFCGxfkDIIB3Zi8II7+ssBMICawHgCjzDN1c6Sg9ZpKRXCy/w4NivIxwdrLGnE5wic7pNc8uIrNYicEoEe99p3ciBwX0QwW8+VmT+HrFmtcnqCqSxMtGoua/3oR3huncjLuW7KisWt5PlYm4TkvtlGTQY4HorbmjaLm5k0TWjmKoFhsYljXbnQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN9PR12MB5148.namprd12.prod.outlook.com (2603:10b6:408:119::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 11:39:54 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 11:39:54 +0000
Date: Wed, 13 Apr 2022 08:39:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Message-ID: <20220413113952.GN2120790@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413055524.GB32092@lst.de>
X-ClientProxiedBy: MN2PR15CA0046.namprd15.prod.outlook.com
 (2603:10b6:208:237::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ccda88-a36d-4160-d828-08da1d4253c9
X-MS-TrafficTypeDiagnostic: BN9PR12MB5148:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB51488E8AF3DC57F08C08D233C2EC9@BN9PR12MB5148.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R4hXUUIy9ivPSNdkhYqFxRtLGDwVlhn/ugh0DrgItmVLDmfm+Kd2pFQ59nZBv8ZiRq1JIF/Sb2FO++40GcijNl2x5dqAU/MDXgcu9cceMOw0DNui2EoGhi2i73i5qhPniqBPHjV/fcSDJaF3re9vgz25QxDukZC7K/IRwJHAh9PhFLnsdC/P1L7CUb/hdQSkU7IccPg3gu0C0FF3QwtHQ83kVUqE6RyjdkwCYWvODC6JKNRPw0zAHMXSD5uYP/5Y5QLPNJhCHWFCeeoJTVfNuX2z6kZ8C1XNMhj0u33Z+nsS/UA67oQSdoWWkKbYHAnBSlKTH+upJpBEz14Xu7G29a0+TztdM8VuxzRdoS3Hvte+ZE9xMc1HM9eAPCgqfONbyWZqssFmgNs9ThfHHksa1aK9rUeC5w93T4Nvp6qu9b19S5N8DFjQS+GHQVp/3YvAVLuVNOr/zeuxTiGp8yUpNGvaJhf32k0BxEMAqXyopiFWewBWm2ssTXr4ak9gp6pHXFV7iiaSLh+M3fUlOxfUvjqcnYU2BN0KnAhf5nBitHfIr3a2l8Cuz7hzwumZRO+2bPjlqZOaO58XB/1ZoZi1wj9/8GyNQCI4TPUKV5RnlS/i5x6VadiGevqIqRebX0Neal/qcdz5FVTCQlH7pwYAWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(83380400001)(4326008)(6486002)(66476007)(8676002)(316002)(6916009)(54906003)(1076003)(2616005)(38100700002)(508600001)(66946007)(26005)(86362001)(186003)(6506007)(36756003)(6512007)(5660300002)(4744005)(33656002)(7406005)(7416002)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+n8UpI0BA7ukBCmVFyWHTpsR35zqWQX8XwU5nxOm34NRoNAqMpDEHu9Sb+bA?=
 =?us-ascii?Q?kYcOubnSRmMfB7A3xtiiwaS9oVNOGmZoyWzJQBGGDsqE4/lEeB7IwzVKMAnR?=
 =?us-ascii?Q?BiDeFeEeCs713251F65WHZ5cJxaAH+8xHn4xIoVCEy2fTPzCZ0Z4iE3/rTsw?=
 =?us-ascii?Q?sv8fLzsYMVngFwDiUUoVksUmbzXBw4h43gBDDzoI8Z3QFDPWLNq9qolyXIUV?=
 =?us-ascii?Q?GqNJyIxMaOVH8WUWAlU6puW4vQv5nEtXBA+tjm82elXhINJavtr4tyawLMqZ?=
 =?us-ascii?Q?l0VG0ze64XCoVMDqdb5fbFtdc9P3stVdK0fsuhjhhnM1ci1hdudymdGECn97?=
 =?us-ascii?Q?rL8nwjI6MTNGZhReF0tSfzqdb1GFawHXwsRC2saf42U9U3CLuxnWiAMtGe5R?=
 =?us-ascii?Q?y63S6nPdqZ9ickygApGnjvX+2PkFkdy1SUz8NW6gwRe36+7X0tWqvOHwyX9I?=
 =?us-ascii?Q?3NWtn+csq3exgr6vu6v0NhOAruQwFKapUyKXFDeCu+l6cfGxzbtaX2RY1hvx?=
 =?us-ascii?Q?aJFHPguBBdynLmCwRchS/t2D85Icxms6folenRG5xfeC/kIjJkGKN1+x2mhU?=
 =?us-ascii?Q?EbBYw/hQ+NjL9fJYLmXRd2bkYCm/KJqnU0ufc7KyMKY3oCnt66QFYy9IMOQE?=
 =?us-ascii?Q?jjcV+yonM8Dyk3XoCVxTzzHMxek9gZl9veLzerAzgMBk7ybgz97YQae1oNdQ?=
 =?us-ascii?Q?Y1/HnNkIgmF8/jtIPi57CQFY7SAC0uMxhOi20LVcIA4EadulyeZXuU/CVAFf?=
 =?us-ascii?Q?l4CwQdS1EPmGZnmsUgYhyDHoPfgzLGL1kmlHNMHEzfKnadnkGfmxlN+qIYZ9?=
 =?us-ascii?Q?yVvfYFnQwmVpVmBbVza64DMLTyEnlhhm4m/eT3UNtwLzLx6JQGgTX+g7Y+Lp?=
 =?us-ascii?Q?2poZ9mgGKGZBOD+o0TrsKn7AC+VqZ91ocBTYBGr/KNWN+WyIPXztLW/4exwb?=
 =?us-ascii?Q?W3g9GtoDLaeQWLQ5yUaFGczaecBmwOvpIp/pc2MwuTN47vi+p67gAxJlbdzN?=
 =?us-ascii?Q?j/MkumA87r0vJHKR2Qe40eM5JYMYlcfFMeTjqMWrOLeyKcA4+CetFwqlaSqj?=
 =?us-ascii?Q?7we3pVaauFCXpeSt+fw/cWcu06dqzz5nAu2XWUBtGWep49EA3gtyAHWYYfCe?=
 =?us-ascii?Q?grTVoMbA0gpMxkqY4f1kPugqXzv2/7dpclbffiBpNOyiBpf0pEhXDEd4s/xN?=
 =?us-ascii?Q?hcCHbTTobExHlorMfHqPaXVpWTR+Oo/ChJxr4o63QkM0lZrbHIt+G5kfwUAX?=
 =?us-ascii?Q?zybo9v8WlD2a/ymqF7v4aZXbRBlhkRIcJeTuQeP77aea4g8syDgKiptUe7nJ?=
 =?us-ascii?Q?qhL4m1j2m6JA+NGkT3+cRrYAL9NtaULjx7fs0k+/p8XTxO91M8x8s/mj9Wcc?=
 =?us-ascii?Q?BglnudBypUbBuryMXIoiyW+G5sobpQkzB148ecKKx6zqUTwJkVW7h7gu4i6H?=
 =?us-ascii?Q?htIO2lXfz4ynWsKJeAA6h289cCL32WruWFgupyFogbdtx8zMUI0FznK7xC+e?=
 =?us-ascii?Q?YFDTBQY2Mq+x+ywP3B/4/faW7gTR78nmi+7KkjpSeh1Pna+FvDHi3yYA3sFo?=
 =?us-ascii?Q?qI4YGZFSzpRYbEGJopKJ0/HBLPw7kGPjz4LRERPBjymUZkZfw+x2CJ6ZlNZd?=
 =?us-ascii?Q?aRAve9GPypjxKSyGfV11hNGFQM6il7h8AMJ02Wchcp3GB2IU6tbZxgx+tYWz?=
 =?us-ascii?Q?Oa7YEmLxQ2rdhWt5fIrPFAb1/n/A4NS0aqzF0NlS8Yx5+fxlZmRzEat9VyiX?=
 =?us-ascii?Q?LWUi2J2+CQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ccda88-a36d-4160-d828-08da1d4253c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 11:39:53.9786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9wQGQ5qytmzG1MBuQAg7iDfwbe7rVzVDE3HCF1UVPh8rBVDlSdanL2oCvlVuJXE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5148
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
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 07:55:24AM +0200, Christoph Hellwig wrote:
> On Tue, Apr 12, 2022 at 12:53:28PM -0300, Jason Gunthorpe wrote:
> > All callers have a struct vfio_device trivially available, pass it in
> > directly and avoid calling the expensive vfio_group_get_from_dev().
> 
> Instead of bothering the drivers with the notifiers at all, the two
> notifier_blocks should move into struct vfio_device, and the
> vfio_ops should just grow two new dma_unmap and set_kvm methods.
> 
> This will isolate the drives from the whole notifiers mess and it's
> boilerplate code.

I already looked into that for a while, it is a real mess too because
of how the notifiers are used by the current drivers, eg gvt assumes
the notifier is called during its open_device callback to setup its
kvm.

The unmap is less convoluted and I might still try to do that..

For this series I prefer to leave it alone

Jason
