Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B982621B0D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BD410E4E2;
	Tue,  8 Nov 2022 17:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574F010E4E0;
 Tue,  8 Nov 2022 17:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7XdmydpDAvUjoP4oIUpWJPKAFChx3xeBHEuAhO+ztuXIQjzJW9/Ewo7VjMXnjugEmT3/uoKKdNmRjooihQLYD/9HcvjIjkCzedxsUxOC8PGY6ygG1f+lW5EUai1gZFFmaMLkSU6+fasifMqQ5P0/NXyJtwHpFZ7mn/cYNjCFEe1WEWS5XdaJ7Ewsek1mfs0MNCmjn1Wonlg6dNuis4nvjce4Vo0Unu0itMeZWS9KXSYXHtOCWN6EO/WrRf8MTNWkFgq8fkDiEW+hr1mnBpcOaCqiERySqfxqaNDVJ6DipC2RBMUeqP1C4ylnpaq1drF+Sw41maENr03mc2ClQEKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeHYlu9SAGt/Mosgtf686dCJHqTcHN5+/ExDmhkfBMo=;
 b=Hui8e4ppHyyYdy3DdATjLyA4LntWJa5SbMx8bzaNeEvMooYulRwTwb2q/9k3KkTevkbXae5fxrGwDJ/u0CjM/+Hfa7z2MpA2pJXj1YMcaQwfZUnEr0gnv5v3UxUaW2JnbVhcYmiALOP5gKJZteSPEAokgYL2p6G7pvlGZuZCAk9jDpm0OKKRBgFgFHNgF111PgammXJTFAQHD6u1MChSQn07AeFYYqI4DeFM6eBsUBrpCS4qDVwfkmdnAe8D3JgLNgR+8gRI0l5WRv0Bl1QcRc7kKh43HcEnyW9DihbN6cn6kR7p21ZHLpsepzoHxmJmyReeVi1i/ABnrOxorCPX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeHYlu9SAGt/Mosgtf686dCJHqTcHN5+/ExDmhkfBMo=;
 b=sd4kd+ypgWSjrXhqd+MPGnmgUYMgoHRdQ1HP5fQLxyr7wrx+U6cWjaeTTuxINiwB3+n1BBeyv802H+5u0g2v0lWYjP2iV/5MOC+HV2zls0Ex70PeyLQgquZyDaHWFVg1GksIyQ5EB5C3LnXz2dMrOj7s9iK6GbCkIDocubUqAFvsiYrKTHIobj//jCTC/hk9Cn/RM2WgjsScwhPEmC47pLXI9UbQPUih58x8bBF3XQe1bfBC86VorDl01ivYpp5o1U7gB7GHW/3l0wvgdjk5wicTOvq88NMYeQsct47+CmMjntd6IfDun5AXLuMM2jm2Ot9lASyoDg4kpfWH75sSUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 17:48:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 17:48:02 +0000
Date: Tue, 8 Nov 2022 13:48:01 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Message-ID: <Y2qWUdCD/zJ9JoXC@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ny84qOFQhtYVPF@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2ny84qOFQhtYVPF@Asurada-Nvidia>
X-ClientProxiedBy: BL1PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:208:2be::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 6404cb71-e7e9-46b1-0533-08dac1b161ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5eKNYVY3b4AmJmouEWv3bsyDSoEwu8/lyu+21Xx+lXn+Ce/aAmzdSAK9joJtuBn0FywYgr3yJBzSOcJKI8XkKlDkrx9UIH0d3rB8bdrvWADTFSEGD2WpcZe8PbsxeBT3Tb27YoO/+zbMcCcRd43ULLv8YHbjltfPdxrgyGe+m+cXodh1iQXZiZikw3lFWCGC0papLB6/4ehzrML46hG6J50kanDqS1QiTYFlPEgunPrATkBEpSk7jfT8wUT/oA/NOAwPB8ZMt5lQUjiqxZFOBjzNH2VvWL/wBtPBLHbw7g8WWbasvgdTzsK6zATs+onZ3X4v8eYanZHPmfqou7f/wgPSOPNaAbvEmt8AY2NSaUh6RiKSJ1TzoRvcFdklT+LaNUU5Vnis4Zhdio3AS4ju7WO7QkcSHZsyDxFcO0k3g9+eGtOk9xiN29Dh5ZF7qXllUBC1hiy2Y92UHRjmj9pwIDArdtCxV1LE/7L1gMPGS4eq7LomhXYtrTubwc8uPpK0jXgSWtEObCmzXgmyB/7hUvOar4O4H2+/yJjpEVdHvfbF/K2jtn/sVWO3Is0A82ky1bFd05O7boP69GoMQBLG2JhqvTbsX5YN1Bieh9Wyb1ryhmu3zFNi5oCul61okS8/aV9Qt0UKbp5M3q1MpTmjq44SuH8srMiY3HGcfLUxXeYnujwYL76wXqnqi21/MyuMG9Uddx92rNXjfUgPdoeMYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36756003)(86362001)(26005)(2906002)(6636002)(2616005)(186003)(6506007)(6512007)(83380400001)(66476007)(4326008)(8936002)(66946007)(66556008)(54906003)(8676002)(37006003)(7416002)(38100700002)(316002)(478600001)(6486002)(6862004)(5660300002)(41300700001)(7406005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z52fAHGoHJ/Lr4LfYLT9oTKwPPKj3zUOS6mGCVAa7ENBmxwFrTloSIppD/Cd?=
 =?us-ascii?Q?qAwTpAUxOkzJnQy4aBm6JPXkO1P1qdmzAlapQJXyuMuo8eCZxNLUt/L2z2cg?=
 =?us-ascii?Q?/s8wTa94ID/DqsEpk9rLU58xdZZKqMLkmQgctAEmWkk8oC7a+uzZEzYKGfh/?=
 =?us-ascii?Q?fbjRgm5lyWog0vJc3qOAzRrsrzPSzA0/CCX3O9dAxoJOKhmXRIkVRuf5qrxT?=
 =?us-ascii?Q?+BM22fI/gApFVyCEjYaVRjZlBCXnto6rfy4YIy2qLJT3ikqyBTei5X92wmx7?=
 =?us-ascii?Q?z0MIJ60FUWeEIfqdMASmUsua75CeSQtbWls5fjG/igCb43U1jT7tSH891BV0?=
 =?us-ascii?Q?6vH7mNFgNAuhOU2Zi2f7LnzCe078msSuDqONNVbMRo1rjfv7Z1nW6kUP2ucc?=
 =?us-ascii?Q?yE1WHUbx0AZ7P09Uj3WN94nsq2Y0McQjtDdw80ZZ3tp457q7/PJ9JO+KkN5X?=
 =?us-ascii?Q?t/21vuiv0bXZRhnAzxYu+SojpiujYm3j4ZZIuYGql+8UpGwIrNurZLEe5YvJ?=
 =?us-ascii?Q?ETH/sK9gh8gpCC9ciqqpJmdXZ7ppG5zQZERiGZW5OzPedfpJ/Ogevj9Xi44f?=
 =?us-ascii?Q?dhszuOPhpRLuem5Kibm/Q+Q0k/ETmtcCVdbQ30pz948d4rcQ6cfzEdmCa0dJ?=
 =?us-ascii?Q?NcwC1Bjh7n3vkGwN9K8PCmlntLnAE7ZZPeS4tdHj8FdUGw1oMqRYf3B5tceZ?=
 =?us-ascii?Q?ZL+WlxWYjkWjESfVbECxvMrbRN7GYCRFzPxudaNjF7cJhVJwdTv6hOTqCyAq?=
 =?us-ascii?Q?SqVqyaxqYPi68HITAym4apxYgHlSAQYqZeWrJYJxfPif3sWFj53SMiYCapCf?=
 =?us-ascii?Q?4+NorpAkC/E7JPDxmKUgTY8gvbqQ2BOTqs7SAWOP9psGD5eJSOjqtNkGARMR?=
 =?us-ascii?Q?APZvScrwYoQ+Hx9Z6Z95SE22aZAy/g6Jo+T0WXJkF970T++J3mfznObjRW0C?=
 =?us-ascii?Q?gP0+Y/Mmf8nT0a4Bf6UuAsYlj1ppbsIq4SgCCaAfLmdQ2pJFNCnqBWbmbf9i?=
 =?us-ascii?Q?qXfVBaUqWo/d5qnXuZgUdCVYw+96vYEarTUSaY7OzGsmb2l8COPzy0TXjDvF?=
 =?us-ascii?Q?606iOjSlAOAhCZALxYoq0zhkUQKdSi/AYI23hbrk4rgJ3x8xL07ie65uvEUy?=
 =?us-ascii?Q?wXkFVQM3d+CJ1eoqjTcSb1vE+3ppHlRUpVjQtf3FOcUjmUVnMb2m0fAt3SZu?=
 =?us-ascii?Q?F4CIfgxnw+NU1D2x8Sn0KBkeBzBw2Lx9m0yz7pqJBn6Hhw7/I4AfR3q0CgZz?=
 =?us-ascii?Q?YPjT35HU8XTnxoB3mbTPLrs4w3lSsZTHpOnpEUgJHEOnHwWgSP1+9kX5c/S2?=
 =?us-ascii?Q?ShagY/s3qBN/RxHuemJGRPpAZMKEuGSPIb5FndVYD5CL23fedfw1oswCP2bI?=
 =?us-ascii?Q?JAgndo6CzFKHY+Gz+gqg0A0tr7YelGCPtObobeRHta+tiiQLhF37PF4DbZ26?=
 =?us-ascii?Q?XRGF93zhT3Eov25vfF5aInbIrxaDi8NY4iDWwkv/z03HkRE3uKdQDOykJswu?=
 =?us-ascii?Q?p/VOr9k+dDwZOqosMj0XktHT/XbUzZD36IPy9Xu/NiuG4RdReSiReBDWiIFa?=
 =?us-ascii?Q?OAecH7ffuu3fLzMknPY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6404cb71-e7e9-46b1-0533-08dac1b161ed
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:48:02.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSWnIRCHmntKAaIjxldk7JtNXiaKa5x26gbY370CeUs5fGxtBmGXSVT2zABBP13g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357
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
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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

On Mon, Nov 07, 2022 at 10:10:59PM -0800, Nicolin Chen wrote:

> > @@ -812,6 +821,7 @@ static int vfio_device_first_open(struct vfio_device *device)
> >  	device->kvm = NULL;
> >  	if (device->group->container)
> >  		vfio_group_unuse_container(device->group);
> > +	vfio_iommufd_unbind(device);
> 
> ...yet, missing here, which could result in kernel oops.
> 
> Should probably add something similar:
> +	if (device->group->iommufd)
> +		vfio_iommufd_unbind(device);
> 
> Or should check !vdev->iommufd_device inside the ->unbind.

Lets keep it symmetric since the container is checked:

@@ -821,7 +821,8 @@ static int vfio_device_first_open(struct vfio_device *device)
        device->kvm = NULL;
        if (device->group->container)
                vfio_group_unuse_container(device->group);
-       vfio_iommufd_unbind(device);
+       else if (device->group->iommufd)
+               vfio_iommufd_unbind(device);
 err_module_put:
        mutex_unlock(&device->group->group_lock);
        module_put(device->dev->driver->owner);
@@ -840,7 +841,8 @@ static void vfio_device_last_close(struct vfio_device *device)
        device->kvm = NULL;
        if (device->group->container)
                vfio_group_unuse_container(device->group);
-       vfio_iommufd_unbind(device);
+       else if (device->group->iommufd)
+               vfio_iommufd_unbind(device);
        mutex_unlock(&device->group->group_lock);
        module_put(device->dev->driver->owner);

Thanks,
Jason
