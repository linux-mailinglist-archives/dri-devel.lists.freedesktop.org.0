Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED8622C2E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EC310E0A1;
	Wed,  9 Nov 2022 13:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA0010E0A1;
 Wed,  9 Nov 2022 13:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM5vvOe7G3Hsv5aHQHXJ0Q3e1ljowc9Dv7v4OuPeVaUNUpNZsEOoQEY/+usCfZL43MmWyoaeWpzDydR2YtM6exbJuEPCdn4JjDwAKcTNMUSIQem6r9I14E5I9XG2Yw2Riyu+k1NCB2UPortH3+icG5ou0z7Tbhvy6wvcNRBEneHqvnAbH5URYAGtqESWe54S6knvCsG9Z0JB8i1w7rc8ynvOvVdAMrQAhY4fbMaKggfhZIu5Yntgxzboq1366Ma0tMfiRN8j8CH4elT8z8MKlfV6VGN1VzjMT3LTd9Ssvg12DcXS7DMWXdhaUhXAJZtTOqGWHnWoHM78g2xkdjB2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ygj82IuGYoSFK5CoQxaZ+CzO4f47Y+oU/2AXgyocPs=;
 b=l55yde8AxKMooiv5dp79TMs7ty5ZNdgj+wGatkC4PvMgbiAi8Izsb8/tNGoMqzUREPtpISoJbw5iKQFUNlMU2jRRZo7YaImyMqtjfvRA4ylRzbIpSGvGYhuiSsBB9Yflo01gvjySTb0jSUrthkMJ529bn2Y76xYh0yFDfGs9vzD9pT3Mxfd3rXPR6UZtTHGSfXEdGEFOuz/C5vUF6OD701vmm6ermrjvDib+HekrJES1x36ZU2/YEauWzUEAKD3frneai1boNJSxYhkZMyuSZgdb12KGCPkCtteAXinc7j1B9noK+HN4JOomwyRTWMQnhqawvq4/AxVxC3cKzgew5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ygj82IuGYoSFK5CoQxaZ+CzO4f47Y+oU/2AXgyocPs=;
 b=WW26OYoVRXWuwP4XMP2wQwsbX3IPcR6vS8mVpK9UUtU6y/tQ6Hb2Nhq4XDYnGoe2todFP+i+50k+6CjY+b0u7IfiwGBg2EOveDV2/7MV7+I30t6iP23P+l0pzK1lueNtms3QA50owOiOXHE8CM+lX00a88vVa6G+OBRmLK5EbGETWlITT24CSLAUivI0ER8gt2LPFH12dio/4huniLJXqBot9VBKOYfZCCcQ0nQoL3aDfd3T0MNPMOD0PbT6U+AWrwiYO8xbfk6pqjqsZuiq8h7Baw3wn02/ZcfMVfQpQ1CU4unEXIV74WbQ29gjhNBfgEdcLU7lEquAr0kwRjWvBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 9 Nov
 2022 13:11:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%7]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 13:11:23 +0000
Date: Wed, 9 Nov 2022 09:11:22 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <Y2um+i8+H4z4/qR9@nvidia.com>
References: <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
 <Y2lSZwNT8f/RMoZf@nvidia.com>
 <20221108155520.4429c2e5.alex.williamson@redhat.com>
 <Y2r80RgytKpPtK58@nvidia.com>
 <BN9PR11MB5276121DEB01705B9A25D1208C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276121DEB01705B9A25D1208C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BLAP220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e29c7f-a584-433a-c35a-08dac253e6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJwIWOxkRlB0nP2kbs2TPsTo9N52EK8WbRLzbZlXRn3Z0CIde7pDhLP506BM3qHbOrm5inbcCwyPjgVwyVWpw2RRi/Q2ftREjAAaZnwl/Ef9dt8ov8qxyLNiedXmBiJal01jB9LQRmufY0OAUo3o5pofZxfAMgmrdQwc2pyEMauQG/YxjclaWKdQRzrMaAGoBn6MEbhAhKw5mjpwJSIHnqleh3ny5udrL2BDiFE7BhiPQP0t+Qjf2fdCWAF3I9vVrDI8Qg3K8TZHta43OqdKZazS7BmrSA+JTfdAmd37ri4iXdhp/6E0LX4JlscAqwYsneAcwGc1xRKUb2v0Qnl3+HqB6piLjG27F2g7r7+f9FjTlCjzNhzE+b2kbO6xrR7B6/H/5Z8pkJSzDuFeUPAGeZZDpOLIwdCnNP/7HchqLhvbGDE7kTH+caZSSzpgL2n83UXLRDxico79pzhr9DzLH3t96H9jc8BwM7hvZmAWLG/KBy+1DDnUhKez6gHNRB4xkGW598IGldVYzghaafthvwm6Zj/L5r+cP8yADEFCgrTcm7ekGHic56Dl5sCAE7iPPJCj9Kl6jt8/Mc8khESdzOGioIuKaRziFb9SviQmINFurRAcmSwSVBbOYleA5nUX7T+VOD806RwMnps+SLcUBL/i2TIwsyVdGAPtkZTFEjqPwtuFt3SwD2eOoHTLkR5RjpeMzUStTY0avYcsrNs8Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(54906003)(66476007)(4326008)(66946007)(7416002)(5660300002)(7406005)(6916009)(66556008)(83380400001)(478600001)(8676002)(41300700001)(86362001)(8936002)(6506007)(38100700002)(6512007)(316002)(26005)(186003)(2616005)(6486002)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GWUB3CM+lXEr2Y7rGLiqLcmbka5BlLdXpyhCwUm/VAXUO09pP5ArBJzL4Wgi?=
 =?us-ascii?Q?emhrlmURPcr/NHVAXLo7wisn/CW8IXtmyL2FJgP85lfknX9Pnx4j5Tu06ZNv?=
 =?us-ascii?Q?oTGOIdKOEBMb0ExyU6lYrBNrjCjYeVZRy+zMcL5ZHQftm3BZ/5Ei3t6939SM?=
 =?us-ascii?Q?mAlwpAHNyZEjcJ9kUBnzITErUB6T+uKsVC5BS0AX7DpLnp1VGKYDqGWIPGTx?=
 =?us-ascii?Q?Dg9yq34I9mlwY5oV1D/b6za8VYMgh2grZZWqXhKMkVPXYw6vrqvnC5Ev+At0?=
 =?us-ascii?Q?a4CTvj4Dc+Y80WQo9nng5LBe+Rt5d9tG8+unpb50L//2IHu0iV96fRkwLjhL?=
 =?us-ascii?Q?mVf7bk4IYrqsDALfwidnMylpIbubNQtCwKQDx2vl/DNimxHh2MsVbvUtNyzW?=
 =?us-ascii?Q?hWAOy+mZgxtJnoY7fVToPKEubBppSQjiGPbdST01X5XrncyXQO7hL9gGiZBu?=
 =?us-ascii?Q?nwuqFFs6o2HwoX/WwZUGXgQ9Acvn9LsjBGN2OLY/UUdtq7oSX9uj7OBgAYXE?=
 =?us-ascii?Q?3aZg+F3BCb5pfY0i7YAsx2eIHlUrcss354yFUBmKBd4CJI+NjNuUzsZMX4/i?=
 =?us-ascii?Q?TTO3h4BnvLhDCdbOnMAPuuvCjcrisYYCWY01QVqJE+XaBdwuFjoKyU3kxxcE?=
 =?us-ascii?Q?8OOpevMt2H5pQr6+ZklfcYTeQPor84cVrTaYDTGE3FxgPy7sHDkMQ/uQ4mXc?=
 =?us-ascii?Q?zLcw13mk2Lz4aULHjtexYAkFdxU9UQXsXVfiSFGYv6Uz6BXukxNq2Aqvj3wM?=
 =?us-ascii?Q?VtdwS3HN7Rt8CYYwuWbR6phRXvHm5c6m6r5+ft5JP325f/ZqRsVl8yH9kZVQ?=
 =?us-ascii?Q?I4I3+NqNx2CS77W0SBLl971PTO18vnrSdEqItH4fMpMOJBtyEPLqTgShQHVV?=
 =?us-ascii?Q?YONEsiV38xS8Vkq08s+22p3C12c/K40OpN1GhGrFISf4R4PFo+K1m/fTx1zv?=
 =?us-ascii?Q?onFov+7FCWFKK6ctxMD2TQF4jZ1H7P9kucBzPUPgWDsZPg6WUOOqYKg6UxSj?=
 =?us-ascii?Q?C5eH5ssZS7LunqvcxcYwlihJrvauulb5+5OkkhtwICyU2c9AZR+AbRixghMI?=
 =?us-ascii?Q?RPgzMHCketWcUkIIFmLxzuKu7YyCcEhChZJJMRuImXsdV5KJUboxakn95hOF?=
 =?us-ascii?Q?BSLve4L8GhTneJupgIjPwzEPyhkn1N7T/h17NfOGvYvxp1WCAS7JveflJwfh?=
 =?us-ascii?Q?j37HyPuTzclviTic9uIIk6Ha3OBvIwm5hqRJ83c8XluSWo8T3f+uWrkXpdRi?=
 =?us-ascii?Q?ZULeHC+ve6a+9ZVAlXgBdfOrGS3ZF3QlYFu73c/n2BBO06gi7xveq0B4o4JS?=
 =?us-ascii?Q?dvkO81O8bx+80NeYLJyXkr7SrOywMGjPqFsmH3qKvZI2ZqteWYiH+9PjD3fU?=
 =?us-ascii?Q?TKq7EFGX9JNDiLVJwrV6tmYUlJ1XOVAPlrMNVLRJX2yddKSv7EHpXj3OuEN8?=
 =?us-ascii?Q?vloChrespNUauTFaN90mxm/sH4jRtxp61XCLe1CVZ+/4RYJlZ52eoJWsbMBu?=
 =?us-ascii?Q?E8PL9/986MqNU9PFtaUCVie4ybjITwRewErIhOkJZexRAlSI6uW2t3w/8rFI?=
 =?us-ascii?Q?P+tV1dBdu4qdQKZfxZI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e29c7f-a584-433a-c35a-08dac253e6ad
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 13:11:23.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w27My2HLJr11ntt6XGSEzL0ORHIn72LOk0UACgIhd9+aigN2PmMOhcVnYmIpV+ED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 03:21:29AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Wednesday, November 9, 2022 9:05 AM
> > 
> > On Tue, Nov 08, 2022 at 03:55:20PM -0700, Alex Williamson wrote:
> > 
> > > > > So why exactly isn't this an issue for VDPA?  Are we just burying our
> > > > > head in the sand that such platforms exists and can still be useful
> > > > > given the appropriate risk vs reward trade-off?
> > > >
> > > > Simply that nobody has asked for it, and might never ask for it. This
> > > > is all support for old platforms, and there just doesn't seem to be a
> > > > "real" use case for very new (and actually rare) NIC hardware stuck
> > > > into ancient platforms with this security problem.
> > >
> > > vIOMMU support for interrupt remapping is relatively new, the nesting
> > > case is important as well.
> > 
> > This is where we got hit. In the end we fixed the qemu..
> 
> but the point is that old qemu could have a much longer lifespan than
> old platforms then when running newer kernel which supports vdpa
> on old qemu the same tradeoff consideration is then not vfio
> specific...

I think we are reaching into incredible hypotheticals here. We don't
know of any real uses cases where a very new VDPA capable device would
be assinged into a VM using an old qemu and the entire system is
expected to work. What we are seeing is people using this stuff are
making highly engineered systems and will meet the constraints.

Today VDPA doesn't support allow_unsafe_interrupts, and I don't see a
compelling reason to change that.

The threshold for introducing a kernel security hole should be much
higher than "someone could possibly do this".

> If all agree that VFIO_CONTAINER=n is a process to evolve, does it make
> more sense to remove this patch from this series i.e. let it buried in
> VFIO_CONTAINER=y for now? Then resolve it in a follow up patch if
> no consensus can be made quickly at this point.

This is worse, it would make iommufd completely unusable in situations
where we need allow_unsafe_interrupts. If we belive that is important
we should keep this patch so existing systems on kernels with
VFIO_CONTAINER=y continue to work after libvirt/qemu are upgraded to
iommufd.

Jason
