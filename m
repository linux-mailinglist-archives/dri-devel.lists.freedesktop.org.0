Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1C62894A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 20:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BBA10E30F;
	Mon, 14 Nov 2022 19:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EF410E10A;
 Mon, 14 Nov 2022 19:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej2KCiXwc2HrAjamcwlI1W5OOoH3YZLssl9u7BKdCSGVtXLkwnsBCTDzPPISR4JoHoGvq+hXnsA8L+WUTgLfR0eu94AF4Ch+T0fxq3TgpYwVe2ygewu8gj3SlYhP2FyMu0iLUFkayNWGqoUOMXuj7aM1NvUBqh9zWcNTA6XD457gIXibWT2okazQxgdK00aR3XWSxFMNLBP1kATjHBKIcZFiPbwkTp5YWzX7n9KpkYZloaKz/cnyMvf85JGz57MVwZh1KWFBRUCJrK1xsfzymLKsK/LsMCB1F1PPj/0+T9E0L1cZ8ZnBQMa8UyVS9YZq1xH3HlWu30N6lzJmtk2cFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zKVFqQqhZY/OiET+OVleXDDPf9FjhLqX1tPTK51Se4=;
 b=OAU6+LmwS4fgIydPM33d0FCcvIBTKz3RsPU9pj77i+H42PdtpjjnkgJPXKME6x3ICylHV8SnOp//Ec/6R9OLM4zDqgrD+wGkMgYYxDvXckfuhobVPzZ+Y1ph0RJw5vigm2ap3KMeYRk1ZQOAVAA0aeOBMkU8AROFC4OagU6FRD7g78LWxfABU9SGNFyiMN9nU+Dc/4KxIhuaKewuS1EOYLblYPteQ0I3PemEXAKUwIIHkd7anCiJyYN/EJHOgOmGDhby5ZZBwCyJL5OGVKTqXuoN6XFpHjyW4GiS62PD6QCF6Wc18O93wxkk2WEqN3HXeLUWvfVDupbDzIdPf959Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zKVFqQqhZY/OiET+OVleXDDPf9FjhLqX1tPTK51Se4=;
 b=Tc3xUpzlh8Q+8aM1XIJMtrJzv4iC5FFE2lf9L36bf6yzTtg5MLdqyzRhInLLa+HL2z4hbbYinnKGSx4EGcz5p6GmIQWtihkBCnRTeM4VGYH+XGEJ4aoV2LlcUwYzxHLkguxb7peVJd5VJDScIDpz3kNO7udv5R+ORCmJulXCU6Q66VJpRjJ8PbWl9cFYXVDc7JxooslEqGG904kM+t59/DNtlYMHFEB02+GhEA3DUrLu+pODkrMx+/yE3ccgiJRwX+sP1SbYo+NxyZ6bTLRl0x9WMxeiQxloNsZLYjBeB6koaskuIfc8ZxVOf99YHMlL/WBbHdFUnQ1VFPfw6lN3DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6321.namprd12.prod.outlook.com (2603:10b6:930:22::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 19:27:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 19:27:30 +0000
Date: Mon, 14 Nov 2022 15:27:28 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Message-ID: <Y3KWoEwmHvbIJFLX@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <f54c2a93-539f-4520-0561-fbe5cea7772f@linux.ibm.com>
 <Y3JPZwEHjGDU4Oyq@nvidia.com>
 <2890d53a-2437-c74c-2082-1ee29414878f@linux.ibm.com>
 <Y3JXwd4sZJfm/Il2@nvidia.com>
 <5ab00688-aa61-171c-13b4-e9aea7a6a09d@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab00688-aa61-171c-13b4-e9aea7a6a09d@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0285.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4557b227-d605-4d6a-9f7a-08dac6764570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWD20hV2L3Nd9E95Ye8IFDMuxkaCt+2eblq/gRvoyHxUOgw80ZC278Gw/aOcDv4R71tih878Q1TOEMh9JLG1sQrIyh3ZP/gYMqGNSu5Cjk8cYT5tnpLkAOtbec5mkbCcjqwWBrQropzor3Nys3BHezZMYVp4aTMrqSjYH6kaWMcCJh22M5zKM9Ueg/7YDw4cOhfGU8N9JjlATBBzswf9mqDDc4fOizh5XdZPRXKkb5LW+1pqSzkua9IIyRLsAaohO1YflBsmRIrM9/bTnrbt0QCxYq9nVY3AWaseaYC4najqwQkyOOlr9YvyKyly5A63tp7mE8COL19odJ3XQWldztf76iUTh/61gdAk/6F4wfdV8qH6jpror2eqknw8heEhIpvOjEuCfB3jsWiZ2jQE4qI1RoLna/24QmBV1HG4LD11bxxTXjPCO1LP9h9eCFdozQt801jn1v5vkbXO0JI858MA2ApS9sDosj2/80P/hE5+OjMQsWfRNSkVVq6J3HHEIGBSoOUu+6HJyFzoCm0Eg43hPky1p+UrhH6ZlpTgk0fi6RXirkhC76qyVwq4RE92Zs/9gUg3U/YHnG5WcqhlJR1GZOyGKzY3guWaL2NNDZ37TI3bDFLx/J6CQSoVfcOtG5ATqX4yevQlezRxVQqpcKuc44CDhOKfxBQfCYn70YZ/ECqoC1EjHIXJw/1CzX2ZavVGJKxpbIx48m4HnmFfxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(5660300002)(186003)(2616005)(7406005)(83380400001)(8936002)(36756003)(4326008)(41300700001)(7416002)(6916009)(54906003)(8676002)(66556008)(66946007)(66476007)(316002)(38100700002)(2906002)(478600001)(6506007)(26005)(6512007)(53546011)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G7Oh+nzcHfPc8Mlb00BBI++bzAw5qqTzYyLVKPPOlqwdIYDB/mya5K0C6JT/?=
 =?us-ascii?Q?3avT//VL97DAhamUyv8aSoZA6SK5/7c1KZH2/DAt0cFtqFaalQCn9dC5iumU?=
 =?us-ascii?Q?kcnrESydLRKKfoGGHynVcuIjnua3QBs6Ence/nAH0NAl6/oyCt9gMuK8te50?=
 =?us-ascii?Q?hfwW9oRSX1XG2VLkKzm7G/28VnErQ/NKPX7kFrdFHX2L/VYB7kncJ37Ht/3G?=
 =?us-ascii?Q?dsT16RWun6eLc+lTlzOdDWOntgtlYeUEQ6emhFUjN47HwIG4YF8e2PXkmuoj?=
 =?us-ascii?Q?7xudM9T8cArRa8Qh6EvTaM80MTdRVMtgXLDp7NMfJPpw2SI+ZwqQSwegXitI?=
 =?us-ascii?Q?pDNnYgbb6q9RH5fOdwdeq7MWHLp61PhA3XaS3hV1tpwR0T9zOLD6g9LJLTpB?=
 =?us-ascii?Q?ZGH0AtOTnQzKe/P2cS+U1xlnTTHPanuRj5agVm0Mi67yHJZLsYQzrZGktigg?=
 =?us-ascii?Q?nFErofgn7xXNAHQkFthkooA8zcSBjtrQguyuEhGcH9E29ODR8HzNS/rIXz66?=
 =?us-ascii?Q?z5dlpaBwOY3VIp2FvzIIChWtQk07kzj1l5yn3OJe1K91PqGSxoJG+X92AX5x?=
 =?us-ascii?Q?rZVwJaFWun/Nys1rnD1Tc/SOQsHdJeIEfijctJM1W1xehiAj5BTHiv4Yy1Ir?=
 =?us-ascii?Q?tVqX2kPqWD461C7iLvEn6h+OUDmffEUF5s8p6dtdNpNTQWHcKTUJsXpWmKwu?=
 =?us-ascii?Q?KDWGGbeOaDFcLKGivlplWQ+LS6LQp0L9XvoeHLcZjkfrZjasCmhxQGX0aLqn?=
 =?us-ascii?Q?nlinMAaGc1wNqykycytxB2dtSasdTWqU7zAO2iJo9D+y/LX4rtggmZIzJvMz?=
 =?us-ascii?Q?uDl50dqgsOR7mJnj9xGbDVJJT5adRieydUpyVqK6xbgaOxqvishhKVNeNzIG?=
 =?us-ascii?Q?pQ0hrQ2CAypJE0LyrdKKSEyDtu2Knf39ot2tN0obFqp3RnxWRty+6xPSKtTL?=
 =?us-ascii?Q?diWVs8jBoWcV18dD9lK7VOc45wPs+0/D26+eJD87DTQe/Bg5u5jhdIonoMMD?=
 =?us-ascii?Q?KP4HV7Ik65KRGCpEnrd67mcjnAw8F2L1sVEpSlfQpgZr7OCx2Ug2DzIn6AlD?=
 =?us-ascii?Q?4K1PY8uc4xdd+jJKKSvmkRQ06KuDPwrzRapIQiMm2YStTIjkKllkOZZhRqR6?=
 =?us-ascii?Q?ZTw6ZY9w4COkiq9YlFXa5+jcJnbqXS9PqY1j+/p+9NBAF4SpeG2+abqF2HO3?=
 =?us-ascii?Q?3UB05aRI7ztb5SNm/qi1Ztl0IYb2ipyBlMhIDB2/Gc1DNu66Mcz7XBhbuTub?=
 =?us-ascii?Q?vF/dalAImCuYlc4Ph3HwVMz/9duxmbN6amx/d+/fatmWZ3wyRArno2lMtIT9?=
 =?us-ascii?Q?W5Qc7hU2DBKZk5q+Q05zX9Eu4ojuCfG51x8E67fAF5JDZqHmfFNjvnxqCCZy?=
 =?us-ascii?Q?bC8y0nJVfyr9UiaXsvLXnDtTYgIrdZAAz80xCm6kxWcfYRUSbwxmi9tVQOQk?=
 =?us-ascii?Q?cMSE6n71lOHUE54pdglNZs2NYVbcKmofpsa/LYN3pK+4KgXGWoS6zwDGHksB?=
 =?us-ascii?Q?/LhfdFC1D27ewQIYm5TjeGhbmSF5bMIWseY9rVnQqgiJ5AujQ0MmeEUFuJ2v?=
 =?us-ascii?Q?FMqrqNEob7rcIOv/hIs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4557b227-d605-4d6a-9f7a-08dac6764570
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 19:27:30.1045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmNLPrzqENNUERZpS2o3VytbLNn5CcYG3HxTCWP3LXQm2LR7UDejtaw/h+6+CI8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6321
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
 Yi L" <yi.l.liu@intel.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
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

On Mon, Nov 14, 2022 at 10:21:50AM -0500, Matthew Rosato wrote:
> On 11/14/22 9:59 AM, Jason Gunthorpe wrote:
> > On Mon, Nov 14, 2022 at 09:55:21AM -0500, Matthew Rosato wrote:
> >>>> AFAICT there is no equivalent means to specify
> >>>> vfio_iommu_type1.dma_entry_limit when using iommufd; looks like
> >>>> we'll just always get the default 65535.
> >>>
> >>> No, there is no arbitary limit on iommufd
> >>
> >> Yeah, that's what I suspected.  But FWIW, userspace checks the
> >> advertised limit via VFIO_IOMMU_GET_INFO /
> >> VFIO_IOMMU_TYPE1_INFO_DMA_AVAIL, and this is still being advertised
> >> as 65535 when using iommufd.  I don't think there is a defined way
> >> to return 'ignore this value'.
> > 
> > Is something using this? Should we make it much bigger?
> 
> Yes, s390 when doing lazy unmapping likes to use larger amounts of
> concurrent DMA, so there can be cases where we want to raise this
> limit.
> 
> The initial value of 65535 is already pretty arbitrary (U16_MAX) --

It was choosen to match VFIO's default

> If iommufd is doing its own management and this value becomes
> deprecated in this scenario, and we can't set it to a magic value
> that says 'ignore me' then maybe it just makes sense for now to set
> it arbitrarily larger when using iommufd e.g. U32_MAX?

Sure

		/*
		 * iommufd's limit is based on the cgroup's memory limit.
		 * Normally vfio would return U16_MAX here, and provide a module
		 * parameter to adjust it. Since S390 qemu userspace actually
		 * pays attention and needs a value bigger than U16_MAX return
		 * U32_MAX.
		 */
		.avail = U32_MAX,

Thanks,
Jason
