Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290050C0DF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 22:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC0F10E5E2;
	Fri, 22 Apr 2022 20:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C408D10E379;
 Fri, 22 Apr 2022 20:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgiBommJ2JnhDvWVZaTY19+vyG/LMZEL4pKenxM6S/OwAryRDxJXChnmj1AHu0i7OnnMVApQnTNDpO9GhAP1V6yJ1zBfxwSgZ943JNPVLbqc97O4gPFpCW1bSYJAg3UY4UGBeJv6Ra/SMA8cl6U8ojJCnzicLORDRMQOUBzMxv2dckqWAMBWYkKotCnW2wkcaYRlqeFmIximOxgfXaiYqBhVI78RoUbZuQkIMsDUpnSbQ+OAba03RiHYVbamWI7tGnLFaGO4ewZKU2QMdDUR53yCxCYjnsOTQPLIPJAVSWLSUKYPzIcQImjdPtLwxh2+8mzoVovaeZaNpUfE6g8YaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxibsf8cByjjZeGnUn4z+BlsXvPhTa2oK+uo8+uLxGo=;
 b=V8+Dcw9Rf+VvBBOa8AQveSTETERal3LiAShcDILh1r1btwv4KklVOk754AnoCU5Afg7FgPMtHuRULtvc0xWsCyZo7eNwc2KH47kAIm8r1eLOFh3n5eBrQjM5tC5XejpSFSWqMKGTkMjDrtt9p9SGxHPYWhlso8OEIoAUOGJHXIUL1iykV4I2h++o1caovsGnRH1Oe01I0pa4OXI8jgMnSnuMOmh/7FKwIvGxWhozDv/65p5cOdSz3hELmYmfUKaIpG8LoDSrrYkDLWrvy1cJMLHiJFr8W4dWHp5WjUPO51gUMLlaxnuVavgfurULOOFg8MNiTVPssPKdyHb5bs++SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxibsf8cByjjZeGnUn4z+BlsXvPhTa2oK+uo8+uLxGo=;
 b=dsgMNyx/jfV21NRwCjWpMbEMQSalRhTk2E96mGglYvX9jb8RABBOlB9DDoWi59A4QvfzTuOdh34YDRtLM2vB67wZFxjxITt0yysTqXMIYl8C50FkOX2XZKgyEzLu1dSuH8ABIcBS1nDaJO11003O7FFIRKRdqVQLh5F3R7yyrSYo13nuJmGLATsx2SCQbYm1BSxzX5RTxm/5ZIj0GhHYdS35LN72MagGgHvhS0beO0RFYel3/Xcu6DJy4gIkCXmnKhgO2nDgU9Terfxi0CBSZgaXi1/QeTpRdVeGRfAk0x2HUGaRrcZC4GYfzfkCB2PptR2FJXEnEf/qDrlcMOu8SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 20:56:52 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 20:56:52 +0000
Date: Fri, 22 Apr 2022 17:56:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 3/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Message-ID: <20220422205651.GF1951132@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <3-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <20220422062232.GB11926@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422062232.GB11926@lst.de>
X-ClientProxiedBy: BLAP220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c84d5a39-6ffb-4726-9798-08da24a2a06a
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00586ED21E7521728645EDBEC2F79@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqNRQPF5q8Z6cxNuQ5T2DxvSKHn2SQzP/Co6GBYI5+xWSut65VCmcmYs3wZAhWx02pCLfvusnC82Zl5QC1g0+7r5ZJ6BFQ65fbIXR4KaVn2C74fju9nKX8sRAjJ3L/Q9E5ABtMT6x9XB3ASr7yrYmoK42PF88l/GJCs59Y3sABWbk0/lzl7jnfbpcfola2lgm/NvFDk1Jl2NnD73waRLHZ+MdEw8gtvIYBmhY0EkwK9ujAtZDOPQoVfxB/cWT0V8zskDSfbpW63czmew2fWB0zZPmVX6OLtHsKMjBKFKaudfAZruGWWzrqVm7JNJIIUGTAX80qb2Uj28NpVQT3hQ/ALMOS4nCHykTDey9xZhCHq97lzlZnfOTqM1TEG/ZnombVZEEY04NqUBv2Uw+yvArUZh66sgZunggUoG4CSfnuhXeTPPeV6HIYo/mEmCaLHcgYJthdqyimTilNZ+AhV+n3t6ui3iw1uDvevqP2jUW3KD09ZmKZ/eig8d1aVhqi7TmRvvGxSJp/tkhihmp3E0LVYUA63W44CQGSCH204nOjMHtd/JI7naHpEwD0OuX22qzJKR+DmUT/D/AZY1aRgeTGXO6QjJVPsidnbyLZe9Ru1QzsmSQhg+LAnWwgmrZI6dshaln+1nuNahup8v2NirWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(316002)(66476007)(66946007)(66556008)(5660300002)(6506007)(6512007)(7406005)(36756003)(558084003)(54906003)(33656002)(6916009)(2906002)(86362001)(8936002)(7416002)(4326008)(508600001)(2616005)(38100700002)(186003)(1076003)(26005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Dp2SnMdGu6/U5GYIaacIevp35Cv1pPnlTUN8SnLA/Euar2VfabSKS6rUTpJ?=
 =?us-ascii?Q?4gY5MI5+h0zmvn581/9WVoYO9tAEInJCO8e18ilhzNJRR4z/L+Ll0VYL1Ju2?=
 =?us-ascii?Q?/nFzeKdx0rGkkY358BK5ezfuMmQGqP/Vl+2txIF+UvVI+iKjgDM3UvPEltjo?=
 =?us-ascii?Q?gqT8x0XS2J0hV1ac7C7/QzFGRlN5/NYuoSlMnVzM3O1uNJs9hGbNchh+HVwN?=
 =?us-ascii?Q?xpKGDkZYfb1EaHgZPESdAHjYd+BhkuKtTUIplPazbzrmpDifb2azLq1br1fc?=
 =?us-ascii?Q?T2ab3Owk4W8g648HkvI6X1AUL9tiwICVayNlLBjQDLFCEvKFwfe8Gc4XNY7S?=
 =?us-ascii?Q?GS5/hS5Da/ovH3YF9SRgGQpOCkNxI/tWvnRnxsR6GBM/fDMpLD5TmcFbZwer?=
 =?us-ascii?Q?cgbdj+AwPvjrRzg/Uy4UotwVkpg6UeLJDP2eZASKJ0QpKwadT5LIBIxEuLBE?=
 =?us-ascii?Q?E8tVV/NFLiEBFDcJnSw/Y16PUgpX1JNdZSNZ9kHLX4aL/KtHRajN1iIemcVj?=
 =?us-ascii?Q?pTgZT0FGMBrlwO8MMEJ2vp0VR5oh/LrVqkeUY5GtuKv4Uyxcgtl1mRkRU14o?=
 =?us-ascii?Q?cQKD5Gx9i5kkMBFN728+GCgLN3r4/FeiERqQVqFj2pkm3OnvXwoOk1bR3ctH?=
 =?us-ascii?Q?mWUr3dm5D2B9ddVLD765qfhbWCetk5zqkM41w5x0odunl9vjGIdvD+rPNuOR?=
 =?us-ascii?Q?A7D8Sf7xN8/6OhfldnWb2TPkOPQo6tL/1XakiTIN3cE4QxESL2BPD1bs11Pv?=
 =?us-ascii?Q?rDTdsvvd8cJ4N31Ar2swFdWVSdg+c2ZsxZfTCNtpNq9zouF6Jj/rfKMOydZD?=
 =?us-ascii?Q?XoXcdOBaTmSNuSLTSAfW68lz/Kyq/fvulgFJz8FyylZVLQb6OTPpPB7ZINz0?=
 =?us-ascii?Q?ADj0eZZGEsqwGyhRN8bO06m5etdIRPhGfFwfiWoCfJFCPTrrIwE7B9rMJsOb?=
 =?us-ascii?Q?Lk2YCX0Pgjfm+XEyzOYeCpoSuqkLwoI694iZldHbTBYI9e/MzHeeTkFUxRBt?=
 =?us-ascii?Q?8qq1AuUKVfiNCd/Y6sbdfaIwG4k+/2BGLIPuopTmbEvbgueJ/3HyPOQHKnBJ?=
 =?us-ascii?Q?eFiPK0SPCcVz3QCVu0sdhVny0jPnc5s56f5ESKtadLvD8oNg9wlRtwiQIsKL?=
 =?us-ascii?Q?0erRSX2mNqw4YIjYcyQMQkLQuwpgMa5a1f+b1JoHO7QjgtUmJLpYpBJSWlCU?=
 =?us-ascii?Q?tb3+OzrFAa8J97xuA8XaYgRa18BrFsCa0DazboNJUpmmqyu48Fc/LzEiSjCG?=
 =?us-ascii?Q?jZ1HlViVzUsvryLD2KKXYXeBe9t9MOF+c3q3QYgb/GbfstpOPjy0nzJDtzSF?=
 =?us-ascii?Q?9iIflEeS/vSGaNunP5MBswdFiNqjsSv4P5bLA099fBh0Uju4r7UB6UC780Tg?=
 =?us-ascii?Q?d+ULQfJKp4NhFaQ1c5aFKiXFDV5NyXBO9uViTaLlS56pyaWMROEjwfbWxNip?=
 =?us-ascii?Q?VLlDcd3mcwVNoq1mPiU5qn+dzb18VPEgPLIyG6+iBEHFAgzC6yaAfbNgHmQB?=
 =?us-ascii?Q?GrFNUMiY3pN2fR0l6/OGidpn0yUQtCil83fGScHyv3kCbZqqp3GwUYUXRkqn?=
 =?us-ascii?Q?uefKzflsZXroy5bGYH69JQdm1wAIg83UkW89nEkZCYB3yrt1XxLc472kyTdR?=
 =?us-ascii?Q?aStkwRNLaW7D1yfKjqoRWBsewGWd63DtKGZCU/cdfa3sZBfZDwuEuw6nbL06?=
 =?us-ascii?Q?BjeamQExXAbcIMUuKH0zBm2rCJ5JQxwRvVWSasGEe4EmOfUyUNML1FvIn3xW?=
 =?us-ascii?Q?zAlpbq8fug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84d5a39-6ffb-4726-9798-08da24a2a06a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 20:56:52.3946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LraedenmxSI/WHtDUsG/RkFTn5baIwGiFDC7VK63dHPKFBEM8SoSnRpEehPT9F8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
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
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 08:22:32AM +0200, Christoph Hellwig wrote:
> Nit: why do some of these patches that don't touch the mdev code
> mdev in the subject?

I consider these APIs to be 'mdev apis' because only mdev drivers
should call them.

Jason
