Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0D500FB0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B7510FC7B;
	Thu, 14 Apr 2022 13:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A2D10FC5E;
 Thu, 14 Apr 2022 13:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbPnPS4tKUM9Clki11LM18cgFin0AfcO601nlTd5IjWR18VdpAK9+/b8GQBvhEFjcBtZX5wZIUAahRRyRG8Z2DfL55o2dhK2wJypb1wxvGtQf6Ry0iyCqCG1dU0HyiXcHCsJLnzaYv5Lkvj3ufkSTP5pYuUwqTej/oNbivvaGHfu2qZoWjszWOm4aoQ8tAdpz4GqJ6NpptdeLweLmPUGgxnG3COAT7jdU8pLkPfz3wXhpcvNRSzGYiMfI2m/VQbdJ7ClsljkcCTV52fl9zcQhc9f/SuTDmbiRi3Namp5VStcU+txR/clmqXEeR/bU60Z1ayZGq7sjvI0XKqbtgHrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3rFdEw8veW/hMIdRI37qjfDFfg9Jltw8K+uQ/DVtR8=;
 b=bhrF6vnBJKlYi/FZgxeVoaLcO2HmHLtj/xpVA3kOP7HmA2+mrFbrmy00brN9tx5j7lZaltebR9UaD8avgWu8SqEdrGRfe7/h5zdMLQ7qdNjZcbiJPSGuLwqyp+ZhoMCORI4p8nysB9zwEYgmMwH8VvBANCJW8akf+0ltCqyQGta2JYruRjiuT8wF+8qPbMcqumrvYDiS/sSdoKUZPOqqrw9jNuzmk2o5BYjAErsEx+IfOHRJwANp/FoRdAODlDAA8zCBY9oQgW8jBRj0cR1KpVxbgvrGn58ZGzjXfD2BUMR8+Fd4l+utCIPQb2wcaOzKhp/xsh5NnMfYdVYnfb4IGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3rFdEw8veW/hMIdRI37qjfDFfg9Jltw8K+uQ/DVtR8=;
 b=TScbf58T5pGT6zGe9/9csawo3D9Q2TswU7Cbe4lfZ5c9LOY/Wpz5ti04Xw+s5RIgA4buc5SGMwPKmRM6GXD92H0tyb4uwcDQJYrScdekFFVH+41dYUfo09ZmyWzZuS/ljKM41i/JZal8vaWueoiRakvnBq4FHZH4LBfvD9Lj5vVWTAbiorDW37qt4MIMsac6tOtTQ0r5lHAP79q73+VMs+VR+XO16dIxLw7wT8v+nhlw3JEeULpGigpSo4fB+ghJ/yCdGKVjxC1LYwsqjzKZlEgowo35ypZQcm+cQWzPpzhUxnZnVBDBVg3gBm/Mt/eOlDNGHK8T4b54NgAnbLq51w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 13:41:31 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 13:41:31 +0000
Date: Thu, 14 Apr 2022 10:41:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Message-ID: <20220414134129.GC2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com>
 <ae3bec3f-b89a-2845-a924-046874fa38c7@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3bec3f-b89a-2845-a924-046874fa38c7@intel.com>
X-ClientProxiedBy: MN2PR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:208:fc::48) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f34df3e2-6220-4ede-62f3-08da1e1c7ba3
X-MS-TrafficTypeDiagnostic: CO6PR12MB5425:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5425BB81EF45A48ED9BD7216C2EF9@CO6PR12MB5425.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAte1TwmVXfF/bPkaaLGRvXXVDk9Jjq0f9lBRLAQnJRKuWHjO2VNaBfSrPt4Yf7AibW3RXI03caFZ68bCMqtrJIl3sVTf0JZY9pt91GxgR8nfgaH0hJGVrGQV3OvY60sDMbJ2vp8JLfy2ID/+/yh80DaT/Q5CdBeYvyd+arxDfbpC2gHbYrIDy0r7C3anhbmFDFKNNUvrgKjJBIflhlw1S1pmNjQNWVSC2Wn5WefD8jl9KpsHp4ZzdftZJVVwyuIIX2527xXAxdNiKml0ba3hpwL8eqsOMTcYebhwxYUHIT5nCU6o0XfNUSduYjlvJY+F6cwKGRc3zXp2yvLICcwHuZR8zfbD8cCIn98sT0EcZWpwaf5JiM8/SAIjpnzto21Ovfj5t0sGKSmtA/ksm51AJg1SoTInHLh+W8M8AvIAwyxI9aae20aedAWeT8ra4SYK2/yeYEWz3bhvLwMGVaLr1M4v78uAanRfmHdc93WomlmBDx2rS1wtbELJHmgErebL3fwDU/xkMO3xsdBAwzZ9vzJPTyHEBPCezxDjpdiBuOyuWZKJaS4H52NddZb8yMGr+y88b207gKHrDsQlqUOpKX9GbyOAqTd0blHKeuxQZKplcez1jPXtHmXrOTrH2KPbnPEhNUW+ykWseB7sSEkKYFpChbP8UH27HG4XM5DQROv69arXvxiqj9gsSnHGNi2+nUCl23Y+aQXVuTx/MzpYaPRNuYbgO3f75W1PXcxRoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6506007)(83380400001)(316002)(8676002)(186003)(38100700002)(86362001)(2616005)(1076003)(53546011)(6512007)(2906002)(26005)(508600001)(66946007)(66476007)(66556008)(33656002)(7416002)(8936002)(966005)(6486002)(54906003)(6916009)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xEAsV8FzIF91J91olkAh6e5UIeRAZHeZ8bQQhPhrjRiA4fEXbuAc63cuMzq2?=
 =?us-ascii?Q?Xr3QBQMv5lHI5aVTQzcrgVah1BdFCgZFpKPEEoIRcDaa9RefVQL2bv+RRqLL?=
 =?us-ascii?Q?Lg4G3s0ny6w746+JYUHuWVdZnD1vigRFfls/uNeQbK2pzQ/XnJkduybRlTBi?=
 =?us-ascii?Q?B4bTUBT8U7UuAPdnlcQ3XcKoPmZ11shHgMyJ60WiYF/RsQ7I00ZreRFCk2cI?=
 =?us-ascii?Q?uEWJ8kKTMf/k+8cJqvnWr64B8MmT+ZX0cV5JL5BYGq1Rt6zcd0FXFgoCYk5y?=
 =?us-ascii?Q?i/NUsTPV0GKw5JIe2usyiMGnhX0stDRn8v/2i5iDvL2BKlk81x+MrYC1yL1Z?=
 =?us-ascii?Q?qFup+D36fSj5IDq5m67VpNZHXNf/L4R0jZjOcF7PZ0rbV4JedZ3OUr2bxiuI?=
 =?us-ascii?Q?VPrqupFXB3fJNjxx4brf/vbm2UkEexyj7XlcA4tbD+YWI1Gy1JqyWRTbRm4e?=
 =?us-ascii?Q?YAk8VCJv0u3Wvp2biIvg0+4DSSPdsUQE+bfL87DHua9MhuX+5nA9uvugrZCv?=
 =?us-ascii?Q?JJ5vZta2ObScJ0V7nmAvTr6CwXPKSo9HS9RZHqDGVCaRH2hxoQRKFEuwSZvK?=
 =?us-ascii?Q?t/UKQudnZfJrQk29awtBJEiDLOEL1DW8rB6Onz+dmqppCiskwjMt6nYdgHXU?=
 =?us-ascii?Q?F95FisxoIxkS8D7NueOjtXr3TpJENkwdt606gAh+A5pFmKrsMUauxfrQ5gob?=
 =?us-ascii?Q?YUtuqsjKLpbXQ6R68BFHXJadOW3dbHRgU8hOakQRJpmxfE5SOwwgmCeC01E7?=
 =?us-ascii?Q?Ahz2FuWUmvK2spYDEdqVLZHh0KB4jdHZLodfw1iuxuNyWpR7mjVByZURfATt?=
 =?us-ascii?Q?Zl22xlhHkBSh0ArCL9fNlApLJC2kU6+2tMM1siyCaEOdh0UMdsaMY7DxX/EI?=
 =?us-ascii?Q?7P6ILYWn27Nqc2ULnK5GDsfJ9o24R4THpnDlbDjrVzUb8KpC/3wKaRr4MeEl?=
 =?us-ascii?Q?WruMJ5/EMS5sM9Xl4RJCYIbXkZxQAolNixLaFD/ixjeXjFsGKn7C2j2ph1bk?=
 =?us-ascii?Q?TAJXiM+vEveX5vdLWqLYYfSwKpiZCTviX0iZSsOrthPvIqYlLMowef0BDOAd?=
 =?us-ascii?Q?jbP0cHKcServHyHXvvN9V7XQkeL0MTo8D+A5eG1RAoJVgeFVYPFNtCR8t8j6?=
 =?us-ascii?Q?aBx6P2w26yKTYpbSHhdJ/dp35jyQHchuwAEbHeHST465z7ToOmQdJX6Gp/By?=
 =?us-ascii?Q?Zs4p4a+zT3bqTpDFDW2ltqAsvNMHiPAPgPhFHOF8OKIHxXoggb0SwBZAATHW?=
 =?us-ascii?Q?5esMEdMCT8iKJPCc1Yry3U6HXQXplv+PS2jsj0ssGhOaJVPZedOYwnzpEPFP?=
 =?us-ascii?Q?MbM+kOO1tvm9IaAkGS+YNsZn6TAPXNCQZ/KWaPvI8eEnwqX9Hz4U6WDPwcFu?=
 =?us-ascii?Q?iNJZP1AFAU1j3EG1N1g5kggoyNKEfhMkwg54Y8/chddOv6cQZUzUzor/wOuK?=
 =?us-ascii?Q?1VmL5YOgpf/s6PjDZybYMoo9PLVGvKdHF5LVDAOUtwWlwiJanSaOelXR3vdo?=
 =?us-ascii?Q?E425LYgD7siJIp7pamOuHOU5Y2WS65X0OkQWvF3SxmY/JFgFyh3TgElZMwbU?=
 =?us-ascii?Q?NpjZ1Fz+WVXoBtU4cMOBBbGSOjLXAOUwXqi8b5y23VvTeDaOPX/Yuvg05Yuv?=
 =?us-ascii?Q?rAgTtZ9MOCsKnd2IOJ4ZzjeMAE7oLa6tVdZuoOP4gffUZ4dotWcHnugrKON0?=
 =?us-ascii?Q?xdgHQToWtC1oIVzWr0eYjzZ/0r5Jql55bJzrP9a03MN7Fgzq8jMQ8iJMqN0J?=
 =?us-ascii?Q?QhYLJCDlNQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34df3e2-6220-4ede-62f3-08da1e1c7ba3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:41:30.9508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewH1SFzVAbPB2JjlbpCvuLyUtQW0JtGIWGF6/y8wyikNe312hoLaW/Vsd5vU4Gv3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 01:39:11PM +0000, Wang, Zhi A wrote:
> On 4/14/22 1:34 PM, Jason Gunthorpe wrote:
> > On Thu, Apr 14, 2022 at 12:20:42PM +0000, Wang, Zhi A wrote:
> >> On 4/13/22 11:20 PM, Jason Gunthorpe wrote:
> >>> On Wed, Apr 13, 2022 at 11:13:06PM +0000, Wang, Zhi A wrote:
> >>>> Hi folks:
> >>>>
> >>>> Thanks so much for the efforts. I prepared a branch which contains all our patches.The aim of the branch is for the VFIO maintainers to pull the whole bunch easily after the drm-intel-next got merged through drm (as one of the MMIO patches depends on a patch in drm-intel-next).
> >>>>
> >>>> I dropped patch 4 and patch 5 as they have been covered by Jani's patches. Some conflicts was solved.
> >>>> QA is going to test it today. 
> >>>>
> >>>> You can find it here:
> >>>>
> >>>> git clone https://github.com/intel/gvt-linux -b for-christoph
> >>>
> >>> There are alot of extra commits on there - is it possible to base this
> >>> straight on rc1 not on some kind of existing DRM tree?
> >>>
> >>> Why did you choose drm/i915/fbc: Call intel_fbc_activate() directly
> >>> from frontbuffer flush  as a base?
> >>>
> >>> Jason
> >>>
> >>
> >> Hi Jason:
> >>
> This one belongs to i915, which has already been queued in drm-intel-next, but
> not yet reached to the top. When it is landed in -rc, I will rebase this branch
> on it, then we can drop this patch in this branch.

A commit called 'split out dmc registers' with no Fixes: will be sent
to a rc?

Jason
