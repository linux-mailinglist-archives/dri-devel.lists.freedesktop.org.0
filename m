Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9203F611A42
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A45210E8AD;
	Fri, 28 Oct 2022 18:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F79410E8AD;
 Fri, 28 Oct 2022 18:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwEPPVCw9qPgTTzznYcr9ApbUWsmcQ9rg8JiApoB9MD/CJMb4xH7QQkcytAbtyT0q0yn/r6ukYirYBsP1M+mYTha+onaMexlWLVylhgrb/ctu13PRHEVP4SQLfRQ7h8qizEux0XPU/8SB7RwSpuNh/QjrEYCaovZUoRCTkOfM1RgVxmvGDEwqCKT781Eb45C+KtCeamO0fw5Yqlfd8Y5RtsdDhzJqrwXeDgRww+mydqXu3Cqe7WA7E+BbLwkP6Pz8c8Ob1LkHexzd0mVNzVhtjCaYXTVwlldcPiKQUaruyfNo92fJqJNAOgX24oKy1YU0WSAObOOThJ4jrYm4rpgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htcZIqepCP6hsVb4IF2PQt1e4QeaSDSrXJLOFoA3PkM=;
 b=cE1PZeS79RJlDHgzAx+mFx2ePTB7eVF9eQUxmgMX+mdqe3lls6lmkXne7QpvqEALxx32PzjUILI9MjWqnIKsJQPm0mJ7+DFd7V7mAgt1SBY+8CeWAaQyNeul4x7mB6xBBhS3h8A53x4M1m/YvjiP4S6iug1ZbnVY4lQXUZhvPEU7m5OSRDY9TIEePzDz2xsDgeK4UBaw+tW2kODAg4+INu39uzWoR3G6ZP+OdqFMWLMTzFnZ1T0+YXDetdfUT48VhiY5eVxZe5Co8EnKITBFxhDZV4iyuWzrinjBuLRdGGwh897JiYKTXOHtU1PddrJhj5O1jrka6SdRiB2D5o1PoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htcZIqepCP6hsVb4IF2PQt1e4QeaSDSrXJLOFoA3PkM=;
 b=rPOooY+pWsI2tMY0DrlARW1dRGAwJwBOJwN+EPvNCy/wQJliSKaathR4QvlBcql75sXBDPlKevWlCzsHm+I+W0o3OWFH7sdGSlV4tQYjdbCdLlt9FMMowevFJREqy8gAoy8dwbzXyiUEuSlJMdySEJ/yJ7sSouyKv+z6+iyfhYxaezAKpPlRvu/krAPRSlEPUojimMweVpnm488V81ZFiQzkAJ0PPL1TsJG4aP7JI2ultUU57pQLYll3Vt3HmlCEaCaxZkDsGlo3saNxI+rW5biIdka0JhopFNnd4UzU9e52uRJaB6Qw+Scuq00nUiH/kLjGs6DCQmKls1uO7O6cCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 18:40:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:40:10 +0000
Date: Fri, 28 Oct 2022 15:40:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <Y1wiCc33Jh5QY+1f@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026152442.4855c5de.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18)
 To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 1735e01d-c6a0-42e5-9a48-08dab913d7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2B2/Gl1XVGcTdsvsBaXbvdyHdcUuhuxMszLsbqyo3UUfxKiuPJl4zam8IFRmNvPCSnbD0eo4IQtGU3U5HeI5+feFN98yGX/7Fv1yeWwys65jNHGl9AK1M8btuvPoiOFcA2DFjt2NOlGU8ATeQsrVl+zZqHMnLq+Eija7ALfZ9XRZgjB0xqiTjTRUIaUHBLzCYdTbMwNvlmxURrE+UXwAb/2NyIqrtQ8nHi8tWMLIzuom9N3djzL2aEpR9ahks0syxKdOJzNRU9rETBOpZtEDnwUGLY/r9dRDgNyuuj+OIaTobN/vjmk9/quAwjqEHat2hAhBXwtMTWlWC5u2fLnCP+iW3nXZAqvJmoQl7ZlvOpkRZINHVMAzhIC1aJLcl5APvwWBd6hDxV5jAdldOyVCq8XhrgO01Phu59NGLkVctdUhnzts4HWULueJKyb+G+SLFrbWDeOpChinWc/PdRzTGiBSHe7udoWQESEbsUTCfniTEcTa8D0yU2gHSlxtY1oIWAeEx8v89PWhTuoA4wYWNbPplLcoiZVoJthkTroCKA3GKSGbE0nfyAIG1wIxetZaJtDCMjkVqwkwkcVuJW4kOhfOuSJ1p0o9/x+8410+U2Kcnufy5xe3dP5YB0zANdijySX1OYXl0x1O1wxrB308+KC/wzkIHjjkDUpv6XAzDaF1QJs0iBjGdVpLEwZCDPgumyvicGgxKNPJ1HXP2i/niQTYqWDnfFpJA59iQFZIcdwFSWXElrH3d0yJJ/XQUvYD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(86362001)(36756003)(38100700002)(6916009)(83380400001)(7406005)(7416002)(2906002)(26005)(6512007)(2616005)(186003)(6506007)(66946007)(6486002)(478600001)(5660300002)(54906003)(8936002)(8676002)(316002)(4326008)(66476007)(66556008)(41300700001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ykAtMpZ1+tW7tE0VcOCwqTfsH44Iy0iFw04E86pYqkHDHBEmFtEuJJzyH4iF?=
 =?us-ascii?Q?RGL4Lgy9UEGAIWhCOBIlBFka6dxL9UKrfrxB1djqIaA9j2yVTKZGwR9TSl2I?=
 =?us-ascii?Q?2RXoWlhgqXhhE7HHV5zRITfc8YljyOWDWkJW0b3NI3sOdUhto1f5tpfNsM/1?=
 =?us-ascii?Q?gb6v10F5C7u5L5fLmKVD4DhZwmPhB74bxCzJjNSte29MBH5NnfanmdF/Cj8j?=
 =?us-ascii?Q?U25c7g1K7sqDQGvTWJRdunT+/30GhHURUUpuSjEMBMHbvvKdAQUgOEnvO2g1?=
 =?us-ascii?Q?mJQRzjfOe7ORyMo3Wq/ZfK7pfDHMj33aSLcCesGKwuj5xnvc1qUXONajrDTi?=
 =?us-ascii?Q?WfJ4LxS+A8bP2JEFjRL3Fw/eOjdPhKq0Pdp8beeDy0jX/VI2SSjtISxw3ClT?=
 =?us-ascii?Q?UPvnmiYSzKh/jXiAdweHO1G2kjrYC2I8V4vgUorh++Wd70A+/9q4KqciXwiv?=
 =?us-ascii?Q?5aXJlB/fJOwG8j+ueWqmE8vDdmLT+FCzhwLAw15dB4OgEOkKGuhJrPtemaQZ?=
 =?us-ascii?Q?dkFEZVMZerGQx3GimHs7GQEK4LhWkakszC1GiFHSEcFZyCZtr+kPgJ0F7QBc?=
 =?us-ascii?Q?Yq0K9beM2ojLdHyUvpTRdisX/zx4JvykRHhG1UGo+yVQjHXEL1WgDpJ/Nwrq?=
 =?us-ascii?Q?EtOE0Afyo7yPQEh9Xbtos2isTfA7LkZU1hhV+cS8JKyEs+ULP9JCdCB7zmMz?=
 =?us-ascii?Q?wX6a/WWOxqY8lok5Rrdb/XxtGYghaPpPimyy+9AylN7cx3PT7lOCl9yfrY5s?=
 =?us-ascii?Q?RV5cUttNiftTN3soSoh/fBLEwVcmaHk2rQCOQr1g91NCNtX381ym2K9zmt+W?=
 =?us-ascii?Q?T85cVRXf+Mt9cvr9CF212Unos3M0fWqMwff2d0OcXo7c2ZJ5vIaBeJFdLdBv?=
 =?us-ascii?Q?PI0iaBdeD6dmALTQ9UiC0zX8bnsXdJWFNbl4icSYaIUdkJ3d6oy/PDcO5faT?=
 =?us-ascii?Q?HSE95i1g4Lnrb/Rr77VbLtGnjcVVNOj4I5QoN+sEDpLVIK2lVkXEdFHN23Ea?=
 =?us-ascii?Q?B8UJCD1jDCyTKnE3GgxhemKOCVFqw8tOSjsSaMrymt/3XViCmzsGW/THFS9q?=
 =?us-ascii?Q?h/pp6QyTxZ5pyTah1w4LZvKP/rib4im4gcLe+2MxKIP8tpUHM+IquJJWgbEk?=
 =?us-ascii?Q?Ha2yjEP+eXsn3btqpfgDGZkgkM7E0s1i+O1Qj7FyTC3ViuGZZkl5areUcdYa?=
 =?us-ascii?Q?XSAc+L1izQGYsY5e7qhX/8qYuss78wQCDBhm4U94J44Kmj1Erg1VBuLMhcro?=
 =?us-ascii?Q?i9Fb0/i3WCzgSUaBDXuJAySUqJTWzDnUI6wS9EA3+eAwdPnkKfwtAcG3FGu9?=
 =?us-ascii?Q?kJdTtAWCfkwKVOIz3SXC3SqTCMKAcOWWH3ttHt9014TtPs6byeQ5OHId11F1?=
 =?us-ascii?Q?Mk/PzipL1NRneXu21Yx0kohNbmVBUgmsjkkqrpaz0z4mxLQ2y7ySeYvJkwFm?=
 =?us-ascii?Q?hfNiSXlca09NgokrradO9wUd1st9QYRjBmaHSqpzkE1/nTmFAQHcYFw918cc?=
 =?us-ascii?Q?xj7UI93Sys749pi5gMjUA/GSX97IeROga1jZJiwRuu+Y7HpRD5Oe1UbOhZQd?=
 =?us-ascii?Q?bXk/bpGryTypXY4f+LU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1735e01d-c6a0-42e5-9a48-08dab913d7e0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 18:40:10.6196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BPcD6yXZbeioRHkziyRdz2pdqwxBxB3zpdMCH3Q3Ymoag27MsZ3nsxHeztTfKHM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 03:24:42PM -0600, Alex Williamson wrote:
> On Tue, 25 Oct 2022 15:17:10 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > This legacy module knob has become uAPI, when set on the vfio_iommu_type1
> > it disables some security protections in the iommu drivers. Move the
> > storage for this knob to vfio_main.c so that iommufd can access it too.
> 
> I don't really understand this, we're changing the behavior of the
> iommufd_device_attach() operation based on the modules options of
> vfio_iommu_type1, 

The specific reason it was done is that we had a misconfigured test VM
in the farm that needed it, and that VM has since been fixed. But it
did highlight we should try to preserve this in some way.

> which may not be loaded or even compiled into the
> kernel.  Our compatibility story falls apart when VFIO_CONTAINER is not
> set, iommufd sneaks in to usurp /dev/vfio/vfio, and the user's module
> options for type1 go unprocessed.

There are two aspects here, trying to preseve the
allow_unsafe_interrupts knob as it is already as some ABI in the best
way we can.

And the second is how do we make this work in the new world where
there may be no type 1 module at all. This patch is not trying to
address that topic. I am expecting a range of small adjustments before
VFIO_CONTAINER=n becomes really fully viable.

> I hate to suggest that type1 becomes a module that does nothing more
> than maintain consistency of this variable when the full type1 isn't
> available, but is that what we need to do?

It is one idea, it depends how literal you want to be on "module
parameters are ABI". IMHO it is a weak form of ABI and the need of
this paramter in particular is not that common in modern times, AFAIK.

So perhaps we just also expose it through vfio.ko and expect people to
migrate. That would give a window were both options are available.

Jason
