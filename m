Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1FC6230D0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 17:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228710E057;
	Wed,  9 Nov 2022 16:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7310E1CB;
 Wed,  9 Nov 2022 16:57:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtadcU5EnhqlSM03YlANsz/PlSLLdB9E9HTy2/1o/Y4O9W3MAyuhyXt4GKaBOYDJbCpzvSFyll+eroF4hjzhFdavSVW2QfT0V6KI4Dtx+lx6CrmVFVC/Ky4BR+yyIsKe8nP5G9Zw6Xfstn3RAmq+2wBMJkWkUzy9BiqMqexcUOsGhC/y8pd7K8I40taMO/+M+sw7H8FCkUjer25XTJrWWGyv85OpS7j7k4M8ptxOxKOdG2i4AIsaY2rCxahSrTLjD0d+WpKb322grDNA1kDB9zn/Nt3XENgX53B2en4tLnc9PGl4aUV5/ORkS3xWoRjt/WiJXcMpZ3lNdunxp31ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NaILbdXEOUsBgsNonZBm14hn+tHEOCDDpQia64xEog=;
 b=KB9Iz1TtL8OrHifxlw4ERF5vdt0mJVFoZ4E4Y4Fgy0m7efSJ9WzF6inKBJJ9c/ZKTiMkM8CDAPsp+HxERz7t+Lqw690Saq4QdvlsqGok0YLE8OtxIrmAkDnFduJNMa/Leq6n0C7ExiN6IOiZpY7W5+CxtuPtPRfy6FWNXU7YdzJDbcxSzRV+GnMaTWPdKaYkjWTz6yb8keEyKjMY1nSQ+HhkJFCSwFN0GYun0KRgbaqh9yL1orrJu1C4jQJvIKdXCpikQHG1Q6W96cjCll6+3uv2iIttEs7rP0eTKqMhbLQiyeGD1g9bDtzkXU6lUgYiIi04uuqhLViBQw3eFDh0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NaILbdXEOUsBgsNonZBm14hn+tHEOCDDpQia64xEog=;
 b=j6ANuyolkuznK/XlaWIISOgqMELbm8UdBBCHUvtrf0CyUah0B5gl2vlVl4iLjwdkS1vjqptRfT6Se97ID+uvwnJK1mV9sXNMD00mLkO05bJNLm7f2r7akSnMP+dPpk6HpIG/2RIjl+BnQ7b4TaagXjZIl6/+rH6uO54J37x27N6RmJ6P+CCj4se6pP04E0uUNOQrnO1cNgxq/QjE20tJ4zky0xQXSd+MFpnpti4XisKZu9zXzLJiVjrEV+Dh74jPYyc4MIIvjdHOa8I8JnGiY3q5YvWo0TPasT35QbW1NY5OPU9EFP0A2YhB2pT1O4JknCA+/hLXmHuCHgYxsKPoTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Wed, 9 Nov
 2022 16:57:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%7]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 16:57:07 +0000
Date: Wed, 9 Nov 2022 12:57:05 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Message-ID: <Y2vb4fuPZdYKR1M1@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
 <9b2bb9f2-fc82-dd01-84ff-c2fe45e1a48a@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b2bb9f2-fc82-dd01-84ff-c2fe45e1a48a@intel.com>
X-ClientProxiedBy: BLAPR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:208:32f::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe8dbb5-d659-4a0f-2354-08dac2736f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgF/iJOs5C2a6kNcwF+9DBygzi70STP4NqzQgxyqrtKqdoSDxl8njbVCNzHG0OB2TKVOs9SZ+RCVqsS3sse8D3JJFwBuYSqZ655xFfKKPoTQubzYw11cJi5rqSr1Vqn8ToseRherARxr4tgc/oWPf/wZU70TGuOhUCJac/tsKmm002T3u9CL8RXXhvgFc/D1FcaJseukddw6peV78AOKwwf9uDXoH+WvboZtXQnqIzHS5etBKQ49UJ6StayYs4YQpvu7rqDaIFZEjikwf86fl36PYGMXtYtwPSB6ri8KljPz4IjT7UxD0OBx5Y5J/Sdx3i3QgA88xzsjVx4MqDzuFt5AVneK0DNzX+B01KHiVtCmg8qFYfuIBX2TrS+z2QDuofNvn2M8KTykmJdBCCV/A3h2rl+uU2wlA6Ka8piDrmLH+novLipkL3mHzmKBwRoP3qH1Ye+ZcjNECtuXJCpsDqFYMo3Zd3tb2y2ik/CTgO+ffQfmspWtdaYRr5o7WPBg/i8mfp2wXCSO1gLiFtuhAfZqCHZLfC1u2b24tWMXK5vfX/QPOOLM1cL7HNgyoASXBN+RrlmbQSQpzOwNN4ahN6RH840AzxOdUS/HXzG2SUPTk9P3nh6FlSJynHPjO78LHIUaDDegCEhoNs+SZwe+G8YwPjF4xlfrw4w0BDUMAlTfvfbgplbcx7Zl4ateC2tdlM5rYfW2oV/zVfF086mQp6LKlz81ypB76jFTrf/y3SDBS8qty6DxjQwoLbqJOLRbUOnd3M5i3EXjRmPDoj2giBeE2TzbgI9gwfSwJLFc6hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(966005)(6486002)(478600001)(54906003)(2906002)(6916009)(8676002)(7416002)(53546011)(7406005)(5660300002)(2616005)(6506007)(4326008)(36756003)(66476007)(66946007)(41300700001)(38100700002)(316002)(83380400001)(186003)(66556008)(86362001)(6512007)(26005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUojz8Xd3pjGCpkinGs14AdtuYzr1axK+4SzlfLnQh1bvrciciH0B/QIRCi1?=
 =?us-ascii?Q?YD+M9UQYKDG8WTnTCfYDGp4E/Xocm5I7I7+YrudwC952jlQK5SMIDH2ReNxc?=
 =?us-ascii?Q?f6ETsyqKEpb8Qe5q0pCQeNjrNJBWBcsCfVZi1XNUj/pugTIEG9/WiN1D9/sf?=
 =?us-ascii?Q?NRsrrtJaTH0Kb5eX3KL8cg7c4FZqIiqYUn6s25bGTCa6am9BwxB4FN24rUkj?=
 =?us-ascii?Q?TAkYNS5JV42lmXDsSZ/ULQSKzcKfMr/pj/5oxTYQKuixoyRZ9Ud6aW3r5b7v?=
 =?us-ascii?Q?3q7f8h4qlAZ9Xqd9sNpRJJ1nnmlv9kg/gk1bfY0lTayz+aTVBPcJGF892I4P?=
 =?us-ascii?Q?D17rOB/b3lLECpHKVnAhZ4qA2qSoOxgXMr9DJKYmxvsmlVc8nt/LYMxHYWu/?=
 =?us-ascii?Q?mH65j0ELvrxtWCIHghgtOmtNb9xOrzN1oSvXe+M6wJDGNiVuwvGDSLuNXZDH?=
 =?us-ascii?Q?m1bCezK+lMkWnxGjad+7XBiZF+IoTkiJpFFdv/y/J4YsB+w4ASeyH7oddcfM?=
 =?us-ascii?Q?zIlJ9z2PmZy9LKG7j31SEDrRh9ErhpnqRXaoFrsqY0Mb2T4mCLKpj9Vm/Mhx?=
 =?us-ascii?Q?kg9JZ8BwGyv6aKaZha9S6R44G+Ruk1gY1hRsKqwMf1O4lRReoJ3r1kBY40b3?=
 =?us-ascii?Q?eTEL9yfKwmDSIlFrHG5O9WYoxVaHgs6NyY/i7mbGiay7K9mE4ji0637IMv4W?=
 =?us-ascii?Q?46lLUlftep7oxfBz0X3hZeI9Ihhdc+wGlNkZULfndcgD85av7YE/9YXpikmD?=
 =?us-ascii?Q?1tdq8G+bgpN3nqhy/6F2njZB/2ujCXJHX4hynxT3IU4oDBwWPCTRYK52LpO7?=
 =?us-ascii?Q?FOMBjkow/aNoyb40q0jR4Iq8dwswrQCjdz+ruBi6iSLiLofZg1N6O5/2PR2Z?=
 =?us-ascii?Q?iaD4TTENRglEliJc3MeCd7JbNo6SQNct5AHquuwO0z53TB26cJF1UGJmJebm?=
 =?us-ascii?Q?OSiqQdXnzrz/yF6TFAVEq4yAsieoRG4T5Wifjul9OK9MPtjKq75gCCofpIS1?=
 =?us-ascii?Q?pqJyVAuZdyrJStJPLSx/LeKQNfLKBbroj8hBKwKYnZtIFHv3CSf9G+SUIUdq?=
 =?us-ascii?Q?0BFc5ugCW/lgYLI2gQCfLyAeWWzm08Ft1ig/rx8J95XKiQuuaDLb0104EygW?=
 =?us-ascii?Q?7aAB7O8/SdQdrCu0FKdsltOUG5Ckq7BmAs04xHGMh7Z5zcT1L6mPjLXzq5W9?=
 =?us-ascii?Q?njq4ooY65s8+25KOYUh7O7OQI34reyn9bSyyElbaKqZTMpM8qouEKkA3dZVc?=
 =?us-ascii?Q?3XBZw7PWMN/xi9XNMLw3rf8yAU/ztLpsG7x8x7R6QiocSctuBa7dy/lRnqa1?=
 =?us-ascii?Q?jI4nRJhDgp4vPMx+Ahs+Au9SWRXZKx027pIFPARv+qS1M/vV/wRaXve+KlS5?=
 =?us-ascii?Q?RVkPUl+sTyRCI0JSaZNJwJLtbUF0uW5SZuRMep/SgVKIh95YE4/Bo0uRuZ4F?=
 =?us-ascii?Q?Pl3X59fRczM2qxymG0c/lr1OaZIv6gUMDFQqn9AKu8p78Nvd7fY06PoNl0HI?=
 =?us-ascii?Q?9wtbeMp+hpdBpIerdoJCuwqmb+Nkap0mhdX1l+3KOnO+39UsZ6hGtEsLlwfE?=
 =?us-ascii?Q?yWBNAVQNDgKVIZZr0aw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe8dbb5-d659-4a0f-2354-08dac2736f07
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 16:57:06.8456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vk5H97gK13RTf2AhDkDIssQzkTPbzkIr9zHSVIeIyvCKteANM7ZqWlyVrswpVBZd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
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
 Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
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

On Tue, Nov 08, 2022 at 11:18:03PM +0800, Yi Liu wrote:
> On 2022/11/8 17:19, Nicolin Chen wrote:
> > On Mon, Nov 07, 2022 at 08:52:44PM -0400, Jason Gunthorpe wrote:
> > 
> > > This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd
> > [...]
> > > v2:
> > >   - Rebase to v6.1-rc3, v4 iommufd series
> > >   - Fixup comments and commit messages from list remarks
> > >   - Fix leaking of the iommufd for mdevs
> > >   - New patch to fix vfio modaliases when vfio container is disabled
> > >   - Add a dmesg once when the iommufd provided /dev/vfio/vfio is opened
> > >     to signal that iommufd is providing this
> > 
> > I've redone my previous sanity tests. Except those reported bugs,
> > things look fine. Once we fix those issues, GVT and other modules
> > can run some more stressful tests, I think.
> 
> our side is also starting test (gvt, nic passthrough) this version. need to
> wait a while for the result.

I've updated the branches with the two functional fixes discussed on
the list plus all the doc updates.

Thanks,
Jason
