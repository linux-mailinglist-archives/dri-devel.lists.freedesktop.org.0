Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0D50BDFC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 19:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97D410E31B;
	Fri, 22 Apr 2022 17:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C4410E31B;
 Fri, 22 Apr 2022 17:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+k1BrvwWiF4mAbty5pUL2NlV34KmuJniyT6mQB1xELBPwzxe/o7XJXmfb4nm8UuEcvkMbuHukWPqaLbyVP6i4XH+dmdKRjHUs/7r1N924tU/TxEdEGam68QkWcQUz7b2GwHjOtKFwVzwg163+iRJIx7kVasBuy+LE5rW6C/miKxVm7aiqrliVkchfuyV9tWoHXzTfNX+dCmzfF7NUXPG+PP690kWb1QhscKXoss18yZx+U1XJtlGrGaIZXaeJaYS7B9ua0R+ixjenzvwNefCbfqE8A+6YNhmTkNQY345heMFn/n865UH4lTx1YmpS82JlItjxaLOlZ/xEtNODatog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ0N48isBBjl4mYf3MBM4cXtZYCFuHG1fvmK17jPbK0=;
 b=Zh3jLAgqgIxwerSaZwUP5+Rm94gaSeyVC4YTQDbCSUiS6gl7dRtFgo7lYuWcCa6/MqopisA1gbVtjzz02uh8GcBqg1d0xkQEQfwDlXwT3ApsT5vmMfbcw4EsB81lrtAqLfBn//Bzvg+RO5AhCXO30YpqBXAzKy5RG3RtpxHh8urRwxjgunw0pUe995eIpiYBLxfmt+nBHQyaSJp3/1JKDc7lE7dPvplZ3etsy3L/vFReVO0fkvHBbpHvz41nGVHkJGRX56ij+8wgr+0401el+vpx632p3DJbgws0OhF0vx3XNPAAHF/ftsZJgb9kaQBvGzVuLbgmD79rHy2cZRsoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZ0N48isBBjl4mYf3MBM4cXtZYCFuHG1fvmK17jPbK0=;
 b=P3EFKWMAejQ5NLwM/+YzQIC3SOnnOgFpLMu078AkQRMBYb1fwZs6CQ9DP4YA6wh5MZmzQD7Yc1Smm+jLU08DxWwBIl1REHGtkPi/FUrKNovsenQby0B9+BimZXALX9qXXZa+3Mq3bDiWgFLZ/lXwmaPAeKKG/nMPrIAbsijoep3KWM37oTyKrTVlQaNfonvtEASKF6W2nIuuMj7ZM/6tb73WWRPbBKS97pnQ4pl0RWBSpBz2EdUCaHUEkSgsz1Db1mSmx9gVllBCsJzURpe1AO8WxdgOJC2y+OZ53Ed1sSsC4pW62T91p9+5/Q1a6CT/jGPPhNQ+6shcp+HPSevDXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4581.namprd12.prod.outlook.com (2603:10b6:208:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 17:07:44 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 17:07:44 +0000
Date: Fri, 22 Apr 2022 14:07:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/7] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Message-ID: <20220422170743.GC1951132@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <BN9PR11MB52761D81DA24CD00E0FFA7728CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52761D81DA24CD00E0FFA7728CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:208:2d::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1540dd32-3312-48b1-accd-08da24829e34
X-MS-TrafficTypeDiagnostic: MN2PR12MB4581:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4581F116E309745B82185371C2F79@MN2PR12MB4581.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzA8hQrBO1UcPWRq4UAtEKS+SXERVG7u26j/FO9FPgyUzIWoJXAYXvql7k+BPEmlJNCN1LhILqJ3fL7Hu/BcFmoiJLapBuyBPLQoFMgtdGmEqnCiBg9M35FF/20eXpmjwRGeq/0f8oxnBrZ6zDwCTHh+baU5iSqJPiMS53RAIbd2StIR6rqWENc8d6CzsBezV8rD32ZvpllYnSalyMK9Uin96ZDeL+AcgxRurapMvbt0M1I9rKC4mj02XQifhZcjzCywlgiQV2klaB9e6PViiLOm2Kvk6nmIR2A6tTV/3eQUoDj0Alv9ZWidKZU0/fsN2TJGmSZQqxy9bGffqkjPuhNZE18tWZ0mYXZ7XCzgoK3ozQkJTPPbFbSasHMPdp7c8E0BXr7UZOxtNzVoc/tn/i4c9rde0yMbeofKP8ULKYXuVDam/IyIN8CnirChmNE+PzCKpJPP6RBbsI/URAVdw38zEInVnRWH36pU2Lr4FT68NdIwONCWYhbdwh++d0HB8q2cps/nDfrsf5s/PIHrcZLjNF+7nk5CKis9w9dmNVhjGlZyYsD6oxyRtAYvi6wu1/XCzjK4TTkoTpymterMYbDhAugWDNR/xcOhNb4DI8ivDMgVF+DoooAngcTI+j4jOn5wmy/pMh8KOfVLBFUibw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(4744005)(7406005)(7416002)(4326008)(6512007)(6486002)(33656002)(2906002)(6506007)(86362001)(38100700002)(1076003)(508600001)(2616005)(186003)(5660300002)(26005)(54906003)(6916009)(316002)(66476007)(8676002)(36756003)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ar6lKZZMJ5G7phiXBS56TRR66sypS4OLy/4DVk8xy33K5n6+8vKkxqCTp4FQ?=
 =?us-ascii?Q?VTdsZ60bDRkCkVoIp8gkZCRsJjb4gW+RcofieItJHwXwObYtNrYM5SyuDKqM?=
 =?us-ascii?Q?63GWDyXo2i/sA68Z54OS39xQzwT1Dydcc7nwxKARR/RRvR1rGYc8rq34MZwZ?=
 =?us-ascii?Q?IGSnMAMlwWfd4uZIi8K+jppt4YsqYCXPSviwhuxTVQhv7oqBh4jdXBANQKPC?=
 =?us-ascii?Q?1qkRuPhhDtgahk35OEvGIjcoAwAusK0ENOcDIxvEPNK3sxb+Goomq8Wd2xk4?=
 =?us-ascii?Q?iEASSEBrQsXALgKEvs6jvCunmmpsbbxL0GCG/xJGd0BPDeZMnyPZFxrk5Feo?=
 =?us-ascii?Q?Ah4DF9RTn7oGsEHhHG7ZY9brzFLuE5P2m2uPx1PYuhnxzJ98G4T1DKmDBVOU?=
 =?us-ascii?Q?IL6n+5P1ipsuJkBf0qiQlD3K4yJ8jRsbMMnyOLeRc2vO/hyTxi/ycPmTD66p?=
 =?us-ascii?Q?RE16F2p74dGOCwcNY6rgSSwPrMYl1pKoplwpnH0ZYv56EvNRseIwOmu83u37?=
 =?us-ascii?Q?UiiMBBUO4F/A0Rio4iVyEweQMsjY4yPRIGNRbBOOn3noooJKTaMKr61Pem+E?=
 =?us-ascii?Q?PPmg9LQPbq2Rn7M5E5DF/sveWeePSrlIuHx40HcdCXr+H/UbZct8yRy5veph?=
 =?us-ascii?Q?GeBC4reSfUS8HVYp6AgJzbmLBftZ110ZQvonbhoYVVtpvuw3nU/UL/5M0iSf?=
 =?us-ascii?Q?b3ZdjNYXRi02ESK6C6o7xJPuBiPa/250NUKb0WBFgPEwFGZEsXS2q9F5lU5p?=
 =?us-ascii?Q?+HoVSeNl0QaYVce2lEzHnKBWpGutmvC9QvcPiOg1HL6qYyZRWvAU7hUT4kXk?=
 =?us-ascii?Q?fiKoYL4+Wy+YKXETixNjRWS2XdU4WORwTiElzvIozPiGOOSX0YFrwawdMmPL?=
 =?us-ascii?Q?+SMRnJvC/9dupw7FLQiFX89cprPhlNOt3gwO67t9CAOSdt5WnVyxjpsBSkH8?=
 =?us-ascii?Q?raaSu0I7l64w7FoNc0WNpbFepykQugEAFkltJY4BEX0zcalBgc6khoXPYHDs?=
 =?us-ascii?Q?P2vLuLcZ4dIfUIOWMeCPtIAfUhiwwzwgIqd8AuDPY2pCbkb69KTVmxOHV/Hl?=
 =?us-ascii?Q?XE3njFb4G21+PPYTMBgN0Hvn0ixtFXmQqADghweNSgMY5v583mkJzFHzHCDe?=
 =?us-ascii?Q?BiJSuAsxCPClTnQyGxjUvUERWAtEkMrTbzXi3i3wimRY+ZZF3vY6Oqa9YfSR?=
 =?us-ascii?Q?/YBVLLTVf8dSci8LsFE8kWCuxd9mrv09U3yMBoVcrRm0nhvhlv57HVvI72XT?=
 =?us-ascii?Q?MEHsiKqdGEW4+RYBz66/78sp61V9iqOjlCHdD54fQlH42N0D6M7/SIPk3HBR?=
 =?us-ascii?Q?kdS/64tzxYJdp25nIL55KkCdGcU7Sd1rlMPl7msUuTQ84cKjBKrYQDo4z6LT?=
 =?us-ascii?Q?Mg+wJXasyTCXIJOTOYYxAdP1x7c9pZrfbQYE5UyeRdRLgv1cVKSMmrxzbM8G?=
 =?us-ascii?Q?TkWhs3m135LxgaLu6/Hqk1m7eQH+fMgwq6OMvCLZxnc9vpsIzRLYFAupjsRT?=
 =?us-ascii?Q?ttPjNdcqYAL4iEZe/jzjAa9UrglsnWGM/wwTvHU2i67GmMNt1Bn78ynB4qQq?=
 =?us-ascii?Q?oROsORZE1BiKSFcbqDchJdpqr/OFQ0qvfnrcBf2Bp6azXUjup4JcpAgdhV5B?=
 =?us-ascii?Q?l9LxAGCredDPFaHBrQBOOa7ckgHZRoubwTfWHTIDvZEnTnuLW81Zi0kJ0bLN?=
 =?us-ascii?Q?kTf8k8Ro1A01akdot+7iaRiZJCC7lEA38GXvP72YfKostCROvoHwTsbUpbYQ?=
 =?us-ascii?Q?U9Oxql2Bgw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1540dd32-3312-48b1-accd-08da24829e34
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 17:07:44.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26SDuPgO9NMELp+CMmwpE61DJQqVPUH7W+8Uw414pIls8PRgNSg68DAx6LD6WmvG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4581
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 01:39:09AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe
> > Sent: Friday, April 22, 2022 12:29 AM
> > 
> > All callers have a struct vfio_device trivially available, pass it in
> > directly and avoid calling the expensive vfio_group_get_from_dev().
> > 
> > To support the unconverted kvmgt mdev driver add
> > mdev_legacy_get_vfio_device() which will return the vfio_device pointer
> > vfio_mdev.c puts in the drv_data.
> 
> stale comment

woops, done

Thanks,
Jason
