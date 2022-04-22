Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F850BF21
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 19:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E50110E66F;
	Fri, 22 Apr 2022 17:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B2910E29C;
 Fri, 22 Apr 2022 17:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeGNC9wFyLeyejn9BWPCqs37DyPepTfVYlPI+ZARpnYLf3bLOxVbq97ljGJv4opzjuOMeEk/T1VlX/D7TsLFppNPWXoKYJi7FcHbjFd1xIwyqapZfVCbKzFpZ7a6daSkdGdSbaki88xyLmXKHA0sSHim7GHjFL+eXR86aLbzm4aZNX4nawnVUMenekmP2GesFZRRmTmHchTCaaZRAeS2cqB7tlhlt9uSDwkAy1axtUaTvkulUdGRKb7StvAfmTJ+x5THnvwq88zCkFT4GPnHuPsVFdSdRkkgQ7RIrpynzeNV6G2Iux23E9D67/WBVs2F8hbMPCDAcmcsoUvOucBM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db69jfkaQztvPP+2IgMS01L+HE/MOg6arRHICeMRt90=;
 b=j/zQA/z+WHrOTgPoQTDlnle5KKpNevh9lhkw4iQt6FfVmwfysHY/0fjDVtmGmdAj3DTCyMLHU5u2ZZfMLuxrmn/6WSf959mPWqGPgjpzyMGhgEVFZMDsdXCwtxm+6FWeXTyZ0uZVWdJfRIfztg4BO6uaaF06iDUtHuOtZOa78hC/41RahCE/Tp3+YWfV/5zIHmebxNU3lbevqckT4hxvt4A1jH7c9izbg7TvdzZFkZb502/zFVFDyO6Ht8U8yEwZ/n0pBx/wJRgfZUAPehfARKI66hD7SSAZTeM0TkOhaeO8dHbac4SmNNXKC0XWjdYHewSlyoI3Sdxdn8X4BTh0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db69jfkaQztvPP+2IgMS01L+HE/MOg6arRHICeMRt90=;
 b=F6bAF0FeGi5FeoDwAhQAtKE9bjfd2UKcSz+nUHa8MHGDQh//00+FPJEtU10mSKyAsjpIdZqLh8a6fdTMQe9xP9CxyPJCjzzNdZUeNVbbQIlgeuQv9C+gaWbkxMlVVdv+iqlbn/u3vxGi+v2xH2xyjL6UrZnrXjDehA6+FiTKLQ40mAph2IDO43T6dGAedtom27mD/hRGEZMKq5zHByo7ageklua8fBNsVsknY6Yerauwf8dTq83vhk7ma6TAgdKkkgIUAUoOijb1wJiooJdAK1S91VHLGr6z0JBYjmpiF8AqpsZ9peieDfT80pKt60weSCDdUVaVunRedrxldYbO2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 17:59:39 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 17:59:39 +0000
Date: Fri, 22 Apr 2022 14:59:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_dma_rw()
Message-ID: <20220422175937.GD1951132@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <4-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <BN9PR11MB52764597BDC02C88E855EA808CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52764597BDC02C88E855EA808CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR18CA0023.namprd18.prod.outlook.com
 (2603:10b6:208:23c::28) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868565b8-a5d0-43c0-b923-08da2489de8c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438BE9237B33D60BEC0C4B6C2F79@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xdu/e4jkZ30O6qvf+ucXg3ePlY0stCg9E5Y4OHA4KWORvWVABhd+lDyPEOqujeyQlHGzUlQPA1ueJEaWn1IR4PzWE6BKa/xSIwk3AV6B9Tgugxi61SdkoH8GuHeXjfXSptVSx86IyXzbLwXa+StREYo8CGg82jpZG9ud3BIDMRP40ryyhUa2lLgsABOzDjtQ4vkekIwb44fmmu5NhQvorRfCIaZgJGII/ccDtWS2gHbPbHX3epAFztUaaRCJFalPKswz6mFicHrhTLfSo4/9hh6Hqch03owuvWWG1jxpOGwlbXvTmlHlpZ5+H+PzhJASbwqFLiwEpKK3dqV00imq9bldg2AdjoPKDYtJ5G3D1FF9mm2OQYkQN0qlz7xywvFxxEbTEfkqPT9v6H1TjsnTY884U1tkm2CGojRnOKlL/1HVig8gdedCsc2oifMyfDyCCRiBdcRWiw5QQ89mhAd0lxvJKdhkEGRABJ4VYwJ8twxGVG+9DcqDOWbpbQNhM8tJVMJEFXprlAEcVNNq7p6+VJQwpVVzQVRWAHh40XAjvtGsEqayQ/4gooRzVEMD4guwB4K2SEzRoTn21Ca6OQIHvfh6lRBm13a0IlyRZTJs1fHLd4UlrJ+Yl89E4hmUb5Pnu9LcwRwcoSMN/Iu37zoTLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(54906003)(6916009)(38100700002)(508600001)(8936002)(1076003)(2616005)(6506007)(316002)(33656002)(26005)(6512007)(36756003)(5660300002)(4326008)(8676002)(6486002)(7416002)(7406005)(186003)(66946007)(66476007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWPhWj9KJpX6Rtl1/1q3+5ics6JoqHS7DCJcZhpuFuDpuVk1cAFfBeLAxkHC?=
 =?us-ascii?Q?1QXkSe9jhk52e1u4T/AZ7izDlFiY4MSF0gu36t4lHvu9fQ8bNwtNh3z5569B?=
 =?us-ascii?Q?lsMI+3fLmxdRr3eSp2nRJtVMvaNGMHwKvbQ+74HqLC9UBqy4PCGx36l0lOYr?=
 =?us-ascii?Q?aqeK81DThRgjBfkd21BILvPO1nyGMysM+5Y4piOfl5uClxSgDPV0aA8wRtAy?=
 =?us-ascii?Q?8EFxCbwOzymfnhxTTQ4HDh1nUWccSLnA70+QKMk0wzYcLXR9OcoSOORq+4qo?=
 =?us-ascii?Q?REXXcp1umFJwOoh9mQpOz2K0JZc323I9y0cP6DlI1ckyl0GzKFEpu/krxLpS?=
 =?us-ascii?Q?sXhbX09Q0NHQDXJ1XdVSVRDT0kExmyglpFnpMMWTNZwRNy4BaSEg3VjpM7JQ?=
 =?us-ascii?Q?mtdARMWHB60VS6uFW+Kg7dqCzavAOdPccNDQHMsRkIYRxj+6DMjCi8RYSaEd?=
 =?us-ascii?Q?OX92C5Ym7GiY4gjtgSM0Rupt5oynPZeiVYBHsVQ7XZOGfxx5lbuxn3STQIma?=
 =?us-ascii?Q?ybG37AhHCwSbouXbgiqo7Wa3H1p2ZA4tA6TJlAcal0EdDJZWS8c0zzIhmhI3?=
 =?us-ascii?Q?1zNLi8SH38cbfApUbx/p4HRPogcw0I9elgQ6ywaIncNM786P3jzfcE0QmSLx?=
 =?us-ascii?Q?0SFIcRmmabBGLYpU/DVKzedt4YSNpduMOMSx9jomvCZGK+Cvp4mb6PSlcG7c?=
 =?us-ascii?Q?t1Ngm9bjSloZpGjBP7uGym132g5EPQojRRo75+mc0wAhYADRHRmG77HiJVnO?=
 =?us-ascii?Q?kBz/V/za73rHxjbX+NQXUaeUJDOREKRoqQl++tojugNNsWj18K7JoKr1A7/6?=
 =?us-ascii?Q?3tBWs5W3fe8KzIHT97cPAxw+A+AUZCiyhVJ1yjNnNo7Ue1QA8XKMrEac/fhl?=
 =?us-ascii?Q?DiK9bYMUcmqH1nmPAFGn6jYrzJou/dkpB9hItAgb3NnUMgXap/PwBhF9q6gi?=
 =?us-ascii?Q?R8obcRvG+l4tBBSCsXams3GoCCM7FkLH749ajXHY8kZ5jL8WWnOSZvgwy5tB?=
 =?us-ascii?Q?79wH350yHZeZ1EOwKna0kDZYcXs3eFCb+ipoid9bst/3xrt94LU4dxVAYj3n?=
 =?us-ascii?Q?2itN9KQRGPenPGTbml/ZUHme6tYVRbQRO5eAdjB4XlC+LhU/Uy+YpS8oiSsL?=
 =?us-ascii?Q?xpGdRQEnxYUU8eJRJxSqbNBYFRyIgBdHH9kWF7yxA84H4Mif20QqlfOGXUcE?=
 =?us-ascii?Q?sb1agbcW0/YlfQJO0caOk9nhNz2AQlTQ7t6pZhsE6BXetzOX60IYzrj4LHid?=
 =?us-ascii?Q?rRS/cixVQHoP9rD+t9gvSxGkv9d4yEGTLUkoqcy8Ja7oWLX5uXxEpYn7QP0i?=
 =?us-ascii?Q?5B03yfK9Qr7nRniIzQfI+KARunozlo1IQ9iRpJXDhH59fwXje1hOqeBBFKvc?=
 =?us-ascii?Q?AeBV1Zke4WThszkWryR5MaKNct8rwhwL0K2uUTZBjat4xwqB73e1Zv0ekyuC?=
 =?us-ascii?Q?+XqQp9gFSMap26yi/rnq5iGTuZ43eKe2eUZz0Wikyu1mus/wsMSsXDbBGYfS?=
 =?us-ascii?Q?QNGrO1d7nwmQFvyy5cgIH+91OxjcL6gGkw4hOnYaQNaUoq90CDCX0xJOD3zg?=
 =?us-ascii?Q?Z3azVAT5O9CWKl8mOrSAvsVQKyZCadslOZ4Nn+0QbM/vV1MLiWJIclBJSBbT?=
 =?us-ascii?Q?FpC5m2fMUGDx1xWuUEg/b58yAG1v+W77U4AwyQlEvt0tMRotoJpWmKZl/Z3q?=
 =?us-ascii?Q?49gvmqeEzsHCTqmWaIcF0NltwTG8SzHirMiK+maRCUV0GHVFnBZtKWa4xTSq?=
 =?us-ascii?Q?NpuUhUFxxA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868565b8-a5d0-43c0-b923-08da2489de8c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 17:59:39.1729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /b89+m3GmnhDUaBFnfnquy/xSPLE9aoKCGOMaFaQKpgLmC8mz+l/EC8anVcwda1T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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

On Fri, Apr 22, 2022 at 01:50:00AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Friday, April 22, 2022 12:29 AM
> > 
> > Every caller has a readily available vfio_device pointer, use that instead
> > of passing in a generic struct device. The struct vfio_device already
> > contains the group we need so this avoids complexity, extra refcountings,
> > and a confusing lifecycle model.
> 
> Using the same description as last patch leaves the impression that
> the two patches do the exactly same type of change. But this
> patch actually includes one more change to grab a reference on the
> container. This is worth an explanation.

How about this:

Every caller has a readily available vfio_device pointer, use that instead
of passing in a generic struct device. Change vfio_dma_rw() to take in the
struct vfio_device and move the container users that would have been held
by vfio_group_get_external_user_from_dev() to vfio_dma_rw() directly, like
vfio_pin/unpin_pages().

Thanks,
Jason
