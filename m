Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D34614AE8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8C710E3A4;
	Tue,  1 Nov 2022 12:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F2510E3A1;
 Tue,  1 Nov 2022 12:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9oF0bjJEOmfyl+o2ygh3Zj6jErb26i4eGvB72tNl8VASZIg151nKXAIskwitT78Q13A3bN6XysXhWLrJypqxCpSXHQryRdC4eEr9CXcklcbANQ+Ft14PC6U9tZeha89S4rBafruMWZ24ParP1+a7dL0Pq5G935HlcEd+CnCIdVw/8x7OwZWoy+CpCKsDc0GVlZMY08Ssh3CY9/BqTJUxhS819pcBVyQX0K9GYwn22HBAebIL13EMXiVaVJ4zCwtQcEcnX/HWDc2kd1bZxoruJq1dO+JcPNna/0IRhF0QI/HXHMUVSKT7Q8OynsHf8XUzkJyRBPMZQP2B/FSMeLLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9eiyN8NIK9mndoZ5V9gUPMmsTI5to2at9Wm7aPhN+o=;
 b=UShR1BhAvCzgLZ2jjQ+Mp09RcGflzLXcnditRPxdVnY+Sfu8t1Pj/gheiSX4cndBt28KPbC9nMQhZtgaAz0IpDVxtFdGfQsfRJNLf9XxfCdcOGsWg/rFRq0hzFj0m5BY+kpwYAlI7m6VV9+5ux5qadyzpnwbFa/svF3Fdyi8CV9+y3lty5iYifyuOZHinA2CksHCn1IwSgtrtV9vZ2Zx31yLlxOXIwOOvi2C9fn+hyLdlOTJLtmObDTon9AWPp+6tsH6Nvb3GJetnu/q67HIyAmwJtg3usu+4bV0ujrkCTe0EWNqUqZeUNJNL7aUXYSENlUL8UwFoWSo32I8MboXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9eiyN8NIK9mndoZ5V9gUPMmsTI5to2at9Wm7aPhN+o=;
 b=Pn/21QUWAD2dios2cH33JO1/THAgLKYOmJg12BFKlsw3+vm1F68US2ongQPBdd8GbFzEUKjstln5TTfis6dg1qioyxdAlkHQPcQZ/V5KQFIuvBlGMeBYo9WfJ6FQusQh+FHzfNbTlYq/hWpKPrIUCkE0uRIZ0rGYfP3vQGGsTfzS+SDIDPXZ0LLFEy0Xf3JMT6SEUe7NQxjQRDiEDeVIgq4fGEQK1GmjQTugsJnuYFqlG/gBkcVbN0xf+M4C389AYw5crUQDe8yRZ0lQ0rylP6zPbG7+Lpj9529stwJW3ipC4OzQCDLeeiJolRUv2b9iJUBASHZFAgg0hdrWkef0lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 12:40:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 12:40:27 +0000
Date: Tue, 1 Nov 2022 09:40:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
Message-ID: <Y2ETuVOuhm6S0o+Z@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB527655AB662598A9D5F9F1778C369@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527655AB662598A9D5F9F1778C369@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: CH0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:610:119::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c7e3e2-d7f5-4c59-01a8-08dabc06409b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3K0oHBal6decdWNh4m8HKAWnxueudKAxqnJ425OitE6ZgdkSx3k4yt0hF8764NjCfEWDv6SPcX17expLT8q5XZJk1+UnQUZ5OCt9LpW9hA882G1loY1yPyZ2h8I1i2RlAs5R/oZ9B0J8USVLMyqC2HC868DfEECvtUcq1nWarTflZzu9lTTqozFTUYdIE0boShAgMUj6nkSgWV/5YwsC5tA1e1zTp6JfIKH8SdCRDNcx8GNqxl4iIBlg5oH9tzynpLIHjDjXwfK8xg4LWRBmU7nMP1LAeNEXkFfvxie/kP4itNRlhoaSPTJjpyRGo/j37F1BCBj0gnRwjuaXcKThSIdeJX63Y672moTFBnBHd1JQSs5ENInjiVaywd1nuHy2EE77WalpEbSZ7ICMyE16ovs49tvP8W2ZyP0YWVYW1vsoCVAegGz6XMxK3VUsJvFh2rbfllwRc75ln5Kq4/bZTYilHd7rkLqjRxl0HKdHeKdJPTvDkthd2iborAFIxdT5Fi68CaCN3N/q7nOINFqQmh92ZS9GQsCzuJBbTa0yeSee1CHHGs4TKLpSCcbswFBtbuPeTk8pnlpN3yNIjOO128cu3oPeNoO9TWYLClwL+PYXSyj8pipo7rX4wXGKsj5LK5lvU1Rfsh7z7oOCQU6W6PrOHIAstOJ9K7PmZ+oU1dujeKXC8QvLoaP9C/rOajw0BrDM4sBx7xs3IgOSxD4cbCDsufGx3h+unMfGHbpdnvFz9iObIBalXrGWBgY4EaWI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(36756003)(66556008)(4326008)(66476007)(8676002)(6486002)(6916009)(41300700001)(83380400001)(8936002)(316002)(7416002)(5660300002)(54906003)(478600001)(2906002)(7406005)(6512007)(26005)(186003)(86362001)(38100700002)(2616005)(6506007)(66946007)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vldi/6BT+vFv0brYYHbqKUHpgvRku2AYzJpO26ncHw1B1xATujUIo6kNSm/P?=
 =?us-ascii?Q?sBpidp3sp3X4sgBLlDbdJKrIak80zFKagIcf86MHqepPUOf88BoJ3FE1o8xs?=
 =?us-ascii?Q?kMdWxVBqOYkAiD3lLMMdjS9fQhQPcnghW8J1eUoKgilfoLz2swyXHTfuCho3?=
 =?us-ascii?Q?mnvpkq/xNAl+0w6getwJTqbEi5TfVbO7tV2Sc8av0/bIwpMxdoH0UXGHmUoD?=
 =?us-ascii?Q?LttN8MHYWbHxRix/vfBrXGzhBfr175RRuTh33Bs/utPJMqDEc5N67lvUNjHi?=
 =?us-ascii?Q?7U63hvKlHia8S9IFBgssVMwpDPsHq5AooOZ05zUOrBNmGJG0GupEMs1DDsMq?=
 =?us-ascii?Q?pHsPq2ohT/ACkJmW8VC4IP7xOgN26CeY5/6yu4eCTyFYpVMtuWTlxjNrnDb9?=
 =?us-ascii?Q?KZFR4fqct4p0OpxM3n6nvhKOe+zdev9fQ6ZThW/Q1SgG4vepcQTJzVVXltfE?=
 =?us-ascii?Q?ncawvLWMGznbQqhLwdIscNW2T92WJ0+mHCbQaNbeTZIXk37hjVVUOY4qe9d4?=
 =?us-ascii?Q?gbdVjR4d3P+OxKAE0EQKs5UlTjGOAQZ5WxC0LdoS0Fpsv7CsFIV9arqay4qV?=
 =?us-ascii?Q?Qu4TZQcnYQE2YQsHQDGqvHORPheRlmECMFB7NAzCZRHHxyHltog7reB4mGQk?=
 =?us-ascii?Q?PQ5TVYOOi7FbiiKk4iqkmBOO+0I+rq53YQtrnXWeSx3I/E3LBDH3MeLLGKjP?=
 =?us-ascii?Q?fmpJJYJAP4xm+yyAb0U1BH+HJOmS5szaAaK5a1TRET6qbe9gZz33hAH2CipG?=
 =?us-ascii?Q?EP9iMSvcPCFS4cJ0zFjwBznTM849SkXuMsvsLLD6Jl5JWzMuFJzahf/l0AFE?=
 =?us-ascii?Q?pqWOumlGpdFDpQ4MgyQgWVRg7SDbDpVUI16dg34SjvqjLzoFQlmS5BV9+CE5?=
 =?us-ascii?Q?2yOlgtaBimf5LIN+VORjxpYQCa41vMV+S1UF7pmm+gfMPuuuAeXPoQ/p2ocf?=
 =?us-ascii?Q?Qubm3D3j+LAx2ef/oI7gv0qr8MczuYY+RDLyoPO1Yz5pHR3Ekzwr9f3bAK6i?=
 =?us-ascii?Q?gbVasipDzZw6Uz/eQcLwdGelDkKCfmU3roZgSuaRswJRsjIYcmku0rMqKR2e?=
 =?us-ascii?Q?JMO3JlkE7v6s7QaXT13yRvRlSiXR0N0sDijkAvc0Qa3eZv8NGeogWKhUsfiQ?=
 =?us-ascii?Q?A6lu6SWsUdTOH6y+jlMC+sZ+60gkVvoUb7eSQD4YcBWx7TDmL4JSHfaZ6rb0?=
 =?us-ascii?Q?2j4b4YrA9bYQhdextiypcbYK4VWdkuaZFlbFzmjWZrug3m0r+BfvRnYjKleP?=
 =?us-ascii?Q?W934ETT+wJ1OFMBk0aedtKqhRklSpPArdr0kJg6zMA+Y/dTCbaYAU94wNGv5?=
 =?us-ascii?Q?fpSYxiMR5okwiDFt1ZmXt2kbfEzBk7t8xUg8JTxS7NUlzFLIFqgGOYpOrAwl?=
 =?us-ascii?Q?F7/VZVF+71R1gf59gyD//WZstVQFlJ6trVnnwTBzcoe0z+aeCgaMUXI/0hqZ?=
 =?us-ascii?Q?uYbVkgqB1KuMDNAR1aXZRKBFjw12DTqWyKiFMEEmyq/MbbY1YU6Eo9/cYooi?=
 =?us-ascii?Q?yPIICmQH3l36f9ppW6B5Rvnz5ybo2oBDpE9iKIpfyRAKCJ5frWaNQDUd3D0g?=
 =?us-ascii?Q?/JwqxSWJjR71sAPRsMy+cmwMX6RMTUnV85cqSpH5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c7e3e2-d7f5-4c59-01a8-08dabc06409b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:40:26.9040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1M2vaQbDffeiKmeK17xbhQjLkU297BBvaSwKQ1IhOl+n/bMOTTVaRGP51Om7esC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 08:09:52AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Wednesday, October 26, 2022 2:51 AM
> >
> >  menuconfig VFIO
> >  	tristate "VFIO Non-Privileged userspace driver framework"
> >  	select IOMMU_API
> > +	depends on IOMMUFD || !IOMMUFD
> 
> Out of curiosity. What is the meaning of this dependency claim?
> 
> > @@ -717,12 +735,23 @@ static int vfio_group_ioctl_set_container(struct
> > vfio_group *group,
> >  	}
> > 
> >  	container = vfio_container_from_file(f.file);
> > -	ret = -EINVAL;
> 
> this changes the errno from -EINVAL to -EBADF for the original container
> path. Is it desired?

Yes, EBADFD is the right error code (it is a typo it was EBADF)

> >  	if (container) {
> >  		ret = vfio_container_attach_group(container, group);
> >  		goto out_unlock;
> >  	}
> > 
> > +	iommufd = iommufd_ctx_from_file(f.file);
> > +	if (!IS_ERR(iommufd)) {
> 
> The only errno which iommufd_ctx_from_file() may return is -EBADFD
> which duplicates with -EBADF assignment in following line.

The concept is that other places using iommufd_ctx_from_file() should
forward the return code directly. vfio is probably the only thing that
is going to be multiplexing like this.

> > +		u32 ioas_id;
> > +
> > +		group->iommufd = iommufd;
> > +		ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
> 
> exchange the order of above two lines and only assign group->iommufd
> when the compat call succeeds.

Yeah, that is probably a small bug:

-               group->iommufd = iommufd;
                ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
+               if (ret) {
+                       iommufd_ctx_put(group->iommufd);
+                       goto out_unlock;
+               }
+
+               group->iommufd = iommufd;
                goto out_unlock;


> > @@ -900,7 +940,7 @@ static int vfio_group_ioctl_get_status(struct
> > vfio_group *group,
> >  		return -ENODEV;
> >  	}
> > 
> > -	if (group->container)
> > +	if (group->container || group->iommufd)
> >  		status.flags |= VFIO_GROUP_FLAGS_CONTAINER_SET |
> >  				VFIO_GROUP_FLAGS_VIABLE;
> 
> Copy some explanation from commit msg to explain the subtle difference
> between container and iommufd.

	/*
 	 * With the container FD the iommu_group_claim_dma_owner() is done
	 * during SET_CONTAINER but for IOMMFD this is done during
	 * VFIO_GROUP_GET_DEVICE_FD. Meaning that with iommufd
	 * VFIO_GROUP_FLAGS_VIABLE could be set but GET_DEVICE_FD will fail due
	 * to viability.
	 */

Thanks,
Jason
