Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC53A9CDE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B156E580;
	Wed, 16 Jun 2021 14:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2058.outbound.protection.outlook.com [40.107.212.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9561E6E55C;
 Wed, 16 Jun 2021 14:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=athq9NGXV3/vGhQqON/nvki9tfdOl/UJnB1LJGHWaLtDuN2sCIul5lLyGems9CuFpG+2yjO+qTL8+R1Ydd982H2nY2VbaM3avGHz5gmw2wqruF3jcKImWBEVl5LebFL4rD4+YsSdJikCOLc0Ut5VyzQxExSRzG8xgKY4iPdAoiSsDpTIYvdJK09lETqU2hgNQexs5CpyYAkxiwsTmuMmnbJ+gt+Al24Nv5Zdii8FvLtcd7+8cg1pjqoPXpEWq4kJQUyYKAwQl41ohF0LuouK8VXfBWJI3FO8G9+SO5TVEPhGFP9Vd93E+Oz7qLBAaC3H8ErxZMgM/EvKL1nx+8cAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkY905WSelHxEk07oIMVRpwtg/moepptJeR6ybI8AOk=;
 b=gZhSrNx1edBQk0ZrkbQBClvpAbZmy6axXlvfABGhqvLPZZQExUeDGN07pK6sstoMqeEodSidMQ9f9dhSSis94OZBBd6XAx7mCpS78eih2D4QIxEEKYKDHp81hweQRTlVJfFIkVT3Lwq7Z3AgcIwRhfx/idM1LP7MA5U3BMzCBJmSqF/JlT7gq5SM98SmoTwuZSmkQVvTxZyVDPllsHMZm5/gmVkL56Xmd10Rrq7HwayNpGFr98Xevw2ZO24cWml2InLUApqyjJach8exr7RvGb1wHVnmARlo/dTeqhdcUkcFSDKxHDs9c0zi/Py2m30rWUUxqVtdRMmPNYYssGEs3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkY905WSelHxEk07oIMVRpwtg/moepptJeR6ybI8AOk=;
 b=kJdK5htLE+OoEpQU4SGpnLOAbq9huwb/shFkqgB9UN9GsFDyP+zrx+iVuLnQu/th0GRMRxHympS0BFXTzn2oAgu9S/sCpq/bYxrv4C0y2b6V11LBbBAiEbVW30cY67XM+QN+wjlVtKpn1yX1Ycp+jUwaKZ6jcsIlQDCwzTFMVDhvf7BE3bMWSI5Qb1vvsC4hwCGMjuxUax+sf8RAyslGYSdaPqq1SR5CVTg2cmFQSgdzxLICDmwjpLHu97Bk15M5oHrWLNaHBytGy328slY9o8Iu9zys42l8m0LuJOqz/jYZMeshzWPH1Tt/ckaNsUpn4mQKDYdc/q7oHYRlZrjQDQ==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) by
 DM4PR12MB5118.namprd12.prod.outlook.com (2603:10b6:5:391::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18; Wed, 16 Jun 2021 14:03:15 +0000
Received: from DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::18b7:5b87:86c1:afdb]) by DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::18b7:5b87:86c1:afdb%8]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 14:03:15 +0000
Date: Wed, 16 Jun 2021 11:03:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: Allow mdev drivers to directly create the vfio_device (v3)
Message-ID: <20210616140313.GI1002214@nvidia.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133549.362e5a9e.alex.williamson@redhat.com>
 <20210615203515.GW1002214@nvidia.com>
 <20210616031313.GA24992@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616031313.GA24992@lst.de>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0287.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::22) To DM6PR12MB5520.namprd12.prod.outlook.com
 (2603:10b6:5:208::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0287.namprd13.prod.outlook.com (2603:10b6:208:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Wed, 16 Jun 2021 14:03:15 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1ltW8Q-007Uw1-04; Wed, 16 Jun 2021 11:03:14 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76082a6b-0c14-4d46-7e2c-08d930cf7c40
X-MS-TrafficTypeDiagnostic: DM4PR12MB5118:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB51184A3BFF13F173FC53B538C20F9@DM4PR12MB5118.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ZwhPTYfVQlDs/SZn/gaC3ClQt0I+K8Jqbn40Ca0BGgsLiOloWD+CCKxN0hcSvJ6jJa/jEQsqBYMRDJcXu/+o8s05lEBZyYekikljeIsVZArB+WIAdTaYIVkw3/ce9pzB2W0B977oiyLYegdXuxe6qvOoZlg2NF+17hCKK3lJDtJACs7gedcGRjbubYk/wDLa60ObkiXzbGyR2+fHM8NNzdsCkwoh3gnPN0lhp89UMc4L6MHpcwtbiF0xlsoQrJCw3vb75x5Kzw2usuOrop18C6zR/YsS5aVXlW5oKVKdRcQvkC2xcETiBZ9bZQONgUam0rcx0eoUlmpPJ4X2ReUMYlkkPrj32gGh8gt0uaVhjg86HmKRNYJrdn7vgNGCc+szHW7ww5bcJityRm506ckNTb+QERs9c5XL6iJ2HOsCE2rPcuLWdSGPVWm7Qo7MLBasd869zDVrBsxVwXCluoprs5osaOwfRM25QLmMOe8tcJxVBbndYA0J+i4AvctaFYv3lxSYHniITc+ECJBJhNqEE/OcXLFGvMq+uO/XfMnquYb9SCMIe48a0ET072d4L2PPZa9ACaKKsx0t+vpQ0VLKxQMy4QWti9T3UKCng1Ecnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5520.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(54906003)(38100700002)(316002)(6916009)(2616005)(5660300002)(86362001)(9786002)(186003)(26005)(9746002)(8936002)(478600001)(36756003)(7416002)(4744005)(426003)(2906002)(66556008)(4326008)(66946007)(66476007)(1076003)(33656002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nu95HeBa8KQiIunRBI9vrj9BE9pTAAH/V1YF3Yh+jGBBCUopKg+sIeg9JOxv?=
 =?us-ascii?Q?K5gvMkWxFZb/KCxXwQKR60/q2E6cwLtTrk6haCM0B9BFu9n89jxF5bOt32EW?=
 =?us-ascii?Q?XA5zP2CgFlk+KpjyBerA8jwoE/m231bHPYtrip0awWiQF1qqrbJnoNi3UHVE?=
 =?us-ascii?Q?I7Mqd3nUo3Zxp/ne9YxvMRJdz0ZFKEQhCFJJJibmo+2HvXVo6NLgJMNx5O96?=
 =?us-ascii?Q?ENNT7FixZMS/gw10fO4KPn9D/QFInlcgiXk35/bx52YFDOZVW+e/9hQoFmuD?=
 =?us-ascii?Q?19VYf+nUPSl/4V/0h+Cpy17Nqd0yXm9vt1Kk3sGACq0aq0wtN7FNTYWpzxoB?=
 =?us-ascii?Q?godwi0Q1d8Ls3uy/WYIIBapMX+i6gHezQErW+MC8n1/NeL1pSG7qlIMrmyaE?=
 =?us-ascii?Q?A0T2/O9h6eoXLb7DYAV1eUohs8KrpMBYBWy2wOMPGNPIlqLZE4BZxpm8l05p?=
 =?us-ascii?Q?lpvQpJ+J1j44w3NqqAPoo2KpS7WzzNRDUb67sKknRhWFuTcBhe9kDo9P6UPA?=
 =?us-ascii?Q?wxUdUFswb3kT3DHYTLsKJf2cgyvMDxvHRf3ztVwtu6efmnMzp9lHAc46lLHB?=
 =?us-ascii?Q?aA3a6G/Q1hEGCOm8bj4qiSErlG0oNqPgnkMrC+Y1a88xpA8a18woPjXcGEYF?=
 =?us-ascii?Q?JUQy1eVncYYLhmVot86yP0lWIA7GkbpQOhzQjYrt71Jad7D5QfHXI3OI+G9e?=
 =?us-ascii?Q?IJBEUxaHwfJppFBKvNa2OxEMQCRd2nJ5oIFT9Ee6uNPi/127KaaRKkCa3NvD?=
 =?us-ascii?Q?f5aAuyaiacc7XlQm3qQG6KGCyYF4wrAW3BH3osNFLfxLOSMzOkeKycbQ7/tP?=
 =?us-ascii?Q?gqaH/UkPAkGoVMMS7Vb5RhoKehYOoruP65BEWnbz2UtQcv02K4970juu+F0+?=
 =?us-ascii?Q?HjljOCLNzKentNPBfP4LbHlkadtsu6gZuPsmNhM41KOLlCWEm0V9D183sTbD?=
 =?us-ascii?Q?ODz+g5iadz/rrOJYQXSgeEenflvM2egsMcZafoVwEFK1jF3yAMfMJOsWKX+0?=
 =?us-ascii?Q?pnI8qC0ptvnavEVaFk05NiEp6theZCOcR9mocc1xKRl40MrS4nxFHxZ41E43?=
 =?us-ascii?Q?Ywi7OHdBVcZoHqiL9AnDniLQvHtN7HL6bFHZGyZU57nqJxHlnVMbs41Ii7xP?=
 =?us-ascii?Q?i1rUSvkhm0lu3A9iy7TG074vboUhQ+JkuO51GpnVgLXYS/0M4hbEcKqVoo0Q?=
 =?us-ascii?Q?kKgqXmJ9jsP4nhHFDA1bcWOPfqdnNVCz/JjmP608ci3neKmr39/uzmWD6VIi?=
 =?us-ascii?Q?nLbiDEQn6t8rDWWIkvSq/ugzdvk3RXp0BVkXsV9NkhT2bN6PfaUWz/rMpH/C?=
 =?us-ascii?Q?WjecWbet3lc7fH4URjem8mBn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76082a6b-0c14-4d46-7e2c-08d930cf7c40
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5520.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 14:03:15.5140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUxwU9JnHc9272MuWEwD/IrRPeAW8T0PPqYQr+FVFbwpiFW/9Ix64DCz10mtkxRd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5118
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 05:13:13AM +0200, Christoph Hellwig wrote:
> On Tue, Jun 15, 2021 at 05:35:15PM -0300, Jason Gunthorpe wrote:
> > Yes, the rest of the drivers will get converted eventually too. There
> > is no reason to hold things back. Depending on timelines we might be
> > able to get AP into this cycle too...
> 
> And I have a WIP tree to get rid of the weird indirections in i915/gvt.
> Once I find some cycles to test that I'll also test the vfio interface
> conversion.  This will probably be for next cycle, though.

Wow, that is a major project cool

I was going to ping the gvt guys once we get this landed

Jason
