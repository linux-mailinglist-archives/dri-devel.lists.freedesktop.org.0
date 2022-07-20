Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5AD57B605
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 13:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2CE2B840;
	Wed, 20 Jul 2022 11:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C969F18BE2F;
 Wed, 20 Jul 2022 11:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDwZ3g4wmyIREWHFpWTu6esFbUyl2Hy2t1rsos0MTkbi1Yg0oHFoonnJH0t1L2CnBXRitBpyhiRZ1XIYKforVztUtIyj33o2eus523XY1IEdi4auQxfF0yTASZL1j0382JCrZ+TN2Fc2GuGAQQ+TpnPVDmLQ7e+Q2bUoO443+xmrtw8V9Dbfx+c1Em0aDrL2Zx+FIHiHLVSH4oUGbTdGfCHJTIH2vUKwsy2VHMnpaI0bsFeaWWKAAKWoy+Hzk4wIBm8I3Ty7eK7DNkjI0nLEzjfR6aTImKU4gojFUXI/1i3Q/DMPEHzqGLHR/FQWi6khmN/PAdg/IUV0rno1fbPnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBGuGQluS4qtJ32TWbsIvdtDjeW0gVEMiGnXS66AwWQ=;
 b=c7X3NsoU+Pu1dn6bY1VEKpO68vNgWc+C3eg1Ie+DR+IBPo1xfuNdh0e3407xWRRVKI1/21rO6lQ4LmDbyGJsWEJdwyuWQaBJSqvtaKFQsgNp8Zszx7OZGUn8/YL9GoYOKf54ENUKAwvetDSrXvzHxesQY6nLh+MC+anEsIpV2w8CRXywVbflN1iHELn3ehMlwGMP+OLXzBvsFF3yX5Lu6giL47b59zMquJSBgRF90M6TALhnMOuZZHwVKzklxYsJ72YKnDd4GhB+2vpATdBx+HUrx/Bnz7FV+1i0Ex+1t6pqPLXVCcJJVhJfbf8k9375sMjGvQv79e4pfjzeTv2W3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBGuGQluS4qtJ32TWbsIvdtDjeW0gVEMiGnXS66AwWQ=;
 b=kC+zuhNj83w3ryD0jvi7BA5G6OFtgyoxJKK5X7K8YApeRKFueYZILvsv9woiHwsMhuKdWkDhl3bgOINr7humOm+01fSrWWttq0qRRgYIltuiJ6j7dC2YLqoyBcy5128ZTpSRz1TXEX8LOE3VNGrvnC5qPASSkcW8JTqyvMg3URWj+fIbv/YMi6uNtcmiJ49Bp8U2V9gishlA9iHPpUJoUAGic07NHD3aj0ke4S2orriJgUQvqDHR8+Um8LDz3m+aCBALSEdozXJiYhj8WcR1cMS/EWHdfexB0voRLjeKgP4drGdt3Ub7l5/O4xTyq/Ejv5E3t7/Y/WoTgBczeolsYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2664.namprd12.prod.outlook.com (2603:10b6:a03:69::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 11:56:51 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 11:56:51 +0000
Date: Wed, 20 Jul 2022 08:56:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220720115649.GS4609@nvidia.com>
References: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <20220707153716.70f755ab.alex.williamson@redhat.com>
 <20220719234419.GN4609@nvidia.com> <874jzcp6nz.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jzcp6nz.fsf@redhat.com>
X-ClientProxiedBy: BL0PR02CA0106.namprd02.prod.outlook.com
 (2603:10b6:208:51::47) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6c24d82-b685-4736-460b-08da6a46ee7d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2664:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /M2q4I7UvKRCm77mMESsGC5y7i9UnpJmld3uYNlQ9k4eXu87S8234zlFkBmQlD2wCdsjKBWQqHHsFQ8SYhWvFjeohlUXCh0XG1C0/NktvnWBPY8T6PuRUAgK+fZc32NAG7QKXyAKTAlIe8WvqUUQudCUvhrTXO4c6Ri9C5cPQ0zF9XJIqdA0dtF2N5fdVAvvnF19APvR8j+DuaZdJ+18vPBRKU5b3elZGVfnxePdpfxMq8ba3J7n4ll23z2Z6n0I/aAZZkzX9gaHck/nhv0pOhJcaAI4Unf4qGOxSdgTc9ZwBCV/nzuwzND6yTYZf35yEkt2RMmcT0Mz2kxbyC1lSFmkGi1S+yz4Pqt+O5bs1txvTGJNXZNPvQfHEfp0XJejFQXxSQIWbq+sPaJas2u33fn552I1ts3C4Ta4eA+a4Q3QDOE9+sBRbdhYzo2TDC/ooW6SAt3W1DjkezdVTTsGAFaYb/OO8b4u+i9iovV8LnCTL+057pdn7mRMekaDg2Y6cemYHDbaSgvoR9mGPLhu7Lkr7uwg86H+xgaGGuT7tZaD/O0Q+aI8pun///R3s0mrBE0AUk2als2txWJckuADPmtM6NX8T7wS/yW3wO7r81tHC/R1IFq4wL23sYESB3LbPzdURXqvvvvNKNYflMP6w9sF7WPst9lFeNLjUgRibsdA6Lpd10z7V2DBC6hKNy+3e63E9L9XF8ooAgJT0Jjwm8dKggfdX5ufVKjO/7vm6ahHbJ5NhYVlyinFIEbXFpLJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(2616005)(1076003)(6512007)(186003)(41300700001)(26005)(478600001)(6486002)(86362001)(5660300002)(54906003)(83380400001)(66946007)(38100700002)(7416002)(2906002)(36756003)(6506007)(66476007)(8676002)(7406005)(33656002)(316002)(8936002)(4326008)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z/AsMisV/r5MQMB6Y2AoopSiBm1CkQ+VAGESjuLr17rqi54GGK6Y28ItKjU/?=
 =?us-ascii?Q?4V6JB4jjaubi7R0wK9ZfQHCrpne+w7/M0Dj0iKJCBvTiGBZnPbvMJQSNgQ8V?=
 =?us-ascii?Q?JQMVySniGJmsNeovtZ3mXPdg0nIsvBOjFM9txUwNHCYmENfOZwvIXVuUHAWo?=
 =?us-ascii?Q?afS3U5X88afztwQBXaXbiyN9Zz08jCYmiML2Qwm+O0WPD+CiIEIhLFy0mAN1?=
 =?us-ascii?Q?q36RCOtCARDR6xeE9tHEkBaevNU0VkNkhMtRVWKWWoCSGkddyA9l4Y1C5LQe?=
 =?us-ascii?Q?fUsVYvI/brFcYBxKz8jxNnK7fpGDEs8psHbdb19aThnSZwxD/txh4FS81jNv?=
 =?us-ascii?Q?08EtukVp8+EluiyVyNaeTSglfsaSKjp2mdS+lD111Zm4GtYxRC4DPAGawAnY?=
 =?us-ascii?Q?jx7z1Hh4jnDXf/KsGseanWfOjWqXWbZGgSNWXxfaW+tfExU+7kvLymQYSVKa?=
 =?us-ascii?Q?AG3TKrDpp6Swst373qGT1qE8n59sVV3OfVyNDZsSxfuluOcZ+TWjd1WxBJNs?=
 =?us-ascii?Q?IKDbWUNcz2oeymJCllGu9yn6+99tC530nmnwrBmc4lSIXjK7fAwhnXxc15+I?=
 =?us-ascii?Q?UjPd5XfawCEhRwBIMRXVaimtAhExF+2erboJ/3QH92tbNe0v1e7Mmaa1N+Px?=
 =?us-ascii?Q?7zSQ7aotsgjSv8hlRXH/miSh2BCgyRi40qyJRF3/1SYeIAea3pWGlIbCDe4s?=
 =?us-ascii?Q?S+mcODxJ0s/WyEbMsHV9g/iHomxmBpSMJKHaQRav1pJudXIvx19JWmQq+N3Q?=
 =?us-ascii?Q?FuBQn4gSl5Wd4dipjoRpKJsaNWIJnfRK5b28twLRz8d4tkGwnd5F5qVSmrnS?=
 =?us-ascii?Q?Vi392Gg2Xyta7xHCGfB+vjTTMu0WosPHCMI+NHjH0wRhWfGUm4rk9LiZvMuJ?=
 =?us-ascii?Q?D5PZV4yXsdzcDcBjYh7dXC4p2Sba7eBKZWNEdD6FjCpIVgLNWf0Pt7w3stSM?=
 =?us-ascii?Q?27iDOPduAtN+0x7MZF34WdcFL5PwHKTZVK2CtkKwK9va97bOBLt4lG3DvAyU?=
 =?us-ascii?Q?Cj4Nu6vFnPS4visB8Mpc8kwGEzU6kVg+DxahdN1YLTGYyrc+kUxWjtrg1mMD?=
 =?us-ascii?Q?dwHmJr1ITQ8xlxfrO0hn1U1bPguM9KM085z4v4qP6Nw/GaKafKqSHJi5VSmX?=
 =?us-ascii?Q?DlwObcrg7pmWiwYImSIDfQaT7Key661/4WJA6aa/uT6rmA+Q9s0oIHD4T0wL?=
 =?us-ascii?Q?3ISCHT60xWTjrqNIX47BDbgyX8UTuS8Opl3+p3mfwOtUo9/AmKNHBHyHJeuL?=
 =?us-ascii?Q?V8QMgCV5FmaRK7prsJx4WNW55NN7oUgiDjY0+MbDu7m8n8yjvz0bZs0Z4Pdl?=
 =?us-ascii?Q?6/RptaIADq2VrX37Ks9l+zEgPTzLS6THRre5hJeNMmfUo+P+M4fAG9AsyupD?=
 =?us-ascii?Q?8IUPtKvRABsX9TiFasFcwDLid5/W6nd7kBSnYM2tjOLWQQX0LyPV5CodWRaS?=
 =?us-ascii?Q?k34VtMZCGRPd+PKJD/58AV344rt1ZY0cHVqpH4lQQzKqpuv/38lu/7fSYUR4?=
 =?us-ascii?Q?3FKM9Ssg4QM1LC8h823PXA4TFvuGliE0DUhaAUCLPABsPuN0KPfJmlWou2pZ?=
 =?us-ascii?Q?855k7gCeF/yiZlTDfKiLbmlVSO5sDCAB3VEsZaGw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c24d82-b685-4736-460b-08da6a46ee7d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 11:56:50.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9db/j5Vi3F4ndoo73BxpERTSb7cKiHwNaGhXg/4jMYSm62au2aXQ0vFX4UbS5DB3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2664
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
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 09:47:12AM +0200, Cornelia Huck wrote:

> > If the FSM trapped in a bad state here, such as
> > VFIO_CCW_STATE_NOT_OPER, then it means it should have already unpinned
> > the pages and this is considered a success for this purpose
> 
> A rather pathological case would be a subchannel that cannot be
> quiesced and does not end up being non-operational; in theory, the
> hardware could still try to access the buffers we provided for I/O. I'd
> say that is extremely unlikely, we might log it, but really cannot do
> anything else.

I think if the FSM can't reach NOT_OPER then it would be appropriate
to panic the kernel when it realizes it has lost control of the
device.

> > The return code here exists only to return to userspace so it can
> > detect during a VFIO_DEVICE_RESET that the device has crashed
> > irrecoverably.
> 
> Does it imply only that ("it's dead, Jim"), or can it also imply a
> runaway device? Not that userspace can do much in any case.

The kernel cannot permit a runaway device, the driver must panic if it
unable to quiet the device's DMA.

I assume this return from RESET is for cases where quieting was
successful.

Jason
