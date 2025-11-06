Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78AC3D604
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD28710E9C9;
	Thu,  6 Nov 2025 20:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tdJDXDcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423F110E9C8;
 Thu,  6 Nov 2025 20:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+KQAr9DC9mJabtNxPkzcvMFWWmlGwUebLkRaBGKeAVxJW3yrk9EJ5T4cl0fNYoM21aO09eZyxGCKXY8A39vKIkbnYpvcn+GCy8X3mazEEIdbBIXx6XRFizNsfvlq3gyeP0tAybfHxbjIb/p4s2TSb7R+VCecPaEGRI0J6QFMRcbcPjynTxFGPjpuxiruHSJ7fGjPt3pErbEU9nuEKxEut7cHdIjIfbmruMEjCw2dKV5Zj2MslXxcsR5r+oxNHIURDX8XQlYGPo95kwKTgE9hm/7VWtUzCortR3bueAXMgJHyxH7lsH8rHWCTtxbwr/cwhMStOHFnaj+IPyc9aL1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkUtyqX3nJpBQC11Y8c3g5Y606BWIS3BkyBHkbnQVEs=;
 b=Ce/lB1CS7AbzwVtQXsDaLHTKegIqWO57nTw0cuvZmjpIkwe7ObYhueFa5J79IPZ21C+uuI88eOk82q0KNTBExkzX1Xn1k79rr1vE33Tr/ZvpW0wq8XhCqLkkQYReXvOfz7Vx0omXb5HQ72e/lNEJ9FFzGiwvWSIyUrQ3ROYfIt19tk13xrwWwC44fRiQWl3GHjrit9DWhKrK0h7KNDf9BolksHQHd9HIJhS1QA0gA2AxeyaWGk6TEzGhOCKijjithOVckSu+S4dt5cqPvyNgP6uUPE5XlLo8SDIM+jedqP2p/4qyhNgD8MRFfqAW9I6t9RXbo0TVPAhKdmnwPcxNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkUtyqX3nJpBQC11Y8c3g5Y606BWIS3BkyBHkbnQVEs=;
 b=tdJDXDcZrVOECC+D1EavieBP3HO7HnpVwmxIXJtB60rydsGJpu054YBGSVf3CDsnY2XQ9WcLXQUX6L06y//pmaaI/ZTzIadJQxsc78uYe+SrOmucIPB2C/H++PueCWNzekmN060DDAKLFIinW2/ARSanCx5dO+oNSHpnr/yg8rceRmXN/bLSu3UjI8r/DgDkjbDJdonYv/dvyimpscEiYBK/WLDCPOk/0MmupadjGlo00IPeNQRwKHSSP0twOAU81co+UAYpmc16XPyrMiCkRNHFLeLTFSUsSqGvEFFaUc6zZU0cl6TPFTKWPoKldX2j3KgJdKuj2gpCIiQqkBc7Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SN7PR12MB7108.namprd12.prod.outlook.com (2603:10b6:806:2a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 6 Nov
 2025 20:37:28 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 20:37:27 +0000
Date: Thu, 6 Nov 2025 16:37:21 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Mostafa Saleh <smostafa@google.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Message-ID: <20251106203721.GH1732817@nvidia.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <aQh7gG3IAEgEaKY_@google.com>
 <20251105135804.0cb3b340.alex@shazbot.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105135804.0cb3b340.alex@shazbot.org>
X-ClientProxiedBy: BLAP220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::12) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SN7PR12MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a41b10-b9d2-47a0-bffb-08de1d744a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G3rVEdXWNWrdUYWP2uC2vijH4VnN0Yc5fIkyMyG89CNlB9WlBDOqM2fa0jJn?=
 =?us-ascii?Q?wLz8eUTV8Pm6BdEyB6a+bQKPZs6s2+phca/qZvvU0MtXFhZwJxkgSB5mI0LI?=
 =?us-ascii?Q?hjh6A1k+OpcyA7j2C9jJvW7es2YWAbClvnyWmsTbnYzI9bEjzzXiAqff9Mg3?=
 =?us-ascii?Q?crkgWWImbbiPZc8ZFCoRZnjGMHdRX1wIfIIAjSMMOgtU7IR7DkT1BdRbRwMN?=
 =?us-ascii?Q?qG8XDuJE6iWAuS4q9tfED1k0yF7wjnfw6bF4vGUQnYrigXBzzsTffkiVAHPI?=
 =?us-ascii?Q?RKbyN7GyiQwKY/ckRbKVfdbz/Hd7jdmt+80TkkX2MV6seAaR5+mcP5/LYrc9?=
 =?us-ascii?Q?tz/pFB37AuYug59ArdVXzPcw955MambibJebqZJfVubrkpHjz3uUxqJ+MN8/?=
 =?us-ascii?Q?2k9QWl5DqIQCabdYe0wzxiHAlfKEGzK9QejL7pE7AE6DNSuFLdI7p6N3DhZZ?=
 =?us-ascii?Q?8VbyBKq5qOZ39rDeCeR9+S3K296L6fcX7oNogljA4gTWWcTDSoycJy3idTH5?=
 =?us-ascii?Q?yKA8gdWLVTVCrvjzC59vmPaiKiEid9tA1V+5pS/95ej23SMhpVRDqgCf7OnC?=
 =?us-ascii?Q?co4jU1hcf8KybjqvZR14DoNaMOz7NANQRaZQnRsTOmdNvzfAozwI60N6nIW4?=
 =?us-ascii?Q?sOvS3htyfhluTUOAFSAjDXgPjz6sfhehzxH6tks6qdq9JNj8dxaG/Z7Xptix?=
 =?us-ascii?Q?9NnG6oTfxDWqqghobqWqZKDMBTjtrvbZKPDfoDVqei068KdsCnG2rVslCOf/?=
 =?us-ascii?Q?nFYifa2eacDY8n1d9wMcLLzWHjPKpas66oj28RYfFOEJ5w7XPFH9zKFWnTFD?=
 =?us-ascii?Q?OS7AvRMj0w0aN7jxZb7lFxJJQIOAcJ222Gnt376H6mzB2opY/3lxhf3I4Bc7?=
 =?us-ascii?Q?suxkncZYv5n9xLhrQlxZEOM738v/E4e9DBhSyP9ON1McpkRaSE3SJTm5U/4Y?=
 =?us-ascii?Q?7i+eUgnhz9h6E6fXWDGmnnDSxctzNL+jJ6wVJKXY6mSBYXBv8OPSSaiCPIOE?=
 =?us-ascii?Q?b3zww4XudlgTECC+ungfJBcauQL+EdW/9t658SWkMtXe/xkAhM9reW0mIMw9?=
 =?us-ascii?Q?XtcHKfb7wGT6KUWbV2QMQ0bpP1fvjA0zkLEnOKvSAxxh9tW+nW6vIEFP8m1F?=
 =?us-ascii?Q?0d+jokt/dom4DB9EjD5G55xiild708pXCuA8BFKp2frcMGY3Is2sDANVmf1S?=
 =?us-ascii?Q?u+q2n2UevE4QmzH1p47GzjVqIZj3GqaF7niYqaQNznIOtaYox6qnJZ3pPTkx?=
 =?us-ascii?Q?8ZAKIk/w8da3yVRB0btdlJ39MDLRYYrwl6jZFiEo1pNN7ajxv1y1fGDolAQP?=
 =?us-ascii?Q?hNfaIHFc1G5vma1L3XLY6npgSgdqdtbFPWjePWIw3E5pvNAVfMUxwO2xLk3X?=
 =?us-ascii?Q?xy+fxmcT8jMp941hY7eP6g/jrmYe8gw/gOoSLGPMovucfgKDPGwmp8k7WtOm?=
 =?us-ascii?Q?NE2ui52SrmiuZcQ/BKb+QePXSk8qEFOj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vbpq4bZ4ejcembgna0TBuNMaQy8j7PLMEq/HDg82STai6NsB1MmFSL9iZ4YO?=
 =?us-ascii?Q?TA+K4ft0XB0JjyQXUuWrMo/mieR98GDFhykPEeqq/bymZXmSqWxUkGpPwp4B?=
 =?us-ascii?Q?+apVSbY3SQMK6k04OdeoEt0VNG22A4r55/NuQ3uzXO6FPNkGlbJfuaCP0ipK?=
 =?us-ascii?Q?LGAsg3+FK4mWui8RYe4aTnes3VuHDTN0HFUfwDp5oKJPYhpj3AfQFDC+/XEZ?=
 =?us-ascii?Q?fQFrhDnXTpocVBz3eCUMHE8BRADOl6e9yujDFlz9SkswcIgAa7zVKxi5N3cJ?=
 =?us-ascii?Q?Sfvayvpgg2rWGCuz81qH2jaZKZltFlj+QqqegMb0LnwAmKXE+o6554xAx0tu?=
 =?us-ascii?Q?TBftGja7Cth5/CgFuBou6dBHW+M3mCanaIBZsABJkMCUqvHyx9sIEsRwfsPe?=
 =?us-ascii?Q?O1p19ljkAenmzdHQW0tVF+g5HlKa4nqMJOx5Y4573XmHdrGXPiBAFWeZCLDc?=
 =?us-ascii?Q?vUrewXz/aFwTl6AYK4v37MGexmn9p2alEg01j60mQcnsn1PEpWA8w1DM8Gsh?=
 =?us-ascii?Q?UQ9gPE13/Ti6YEeI2dNiQhVf28BEA1gVTcXn+8E4PCKXPmKb3cKREDWV7U/T?=
 =?us-ascii?Q?gwz1N+wuykOGS2yNLsylPjTgF3tTwiMkpf/BGFcmSZV671UEcNBhvrXI864H?=
 =?us-ascii?Q?Eh47bgN7lUI+NTwjohPobbBqOODhJpTKSgpYyZwKLGbfwfzkJwHSqja8HlUs?=
 =?us-ascii?Q?NO2RD8blNyQ2C9QRSUxFTx2F/AVvK6LChegDKv6qeGAQqC0t+dr/EfZ+7mOD?=
 =?us-ascii?Q?CJ/rtltqPrrpIBRpuH8rqOw6MR89QkKK/dXFrSkkbb2fPQ97b0dYNODoqPHN?=
 =?us-ascii?Q?1MtFcwlubS6fgfWnDd9oQ+tSEyHeYWjMSkRB8dYthrU+w1iWTkjFcGp4i3OC?=
 =?us-ascii?Q?QpD1W0tqjztccHRM3jB9q5wNBJvzK4+Q1qz5VML0ZDsk2U6rtSC9FBxfzbYo?=
 =?us-ascii?Q?dBQ2sVSZpuoiC+7vESVB7Tbm46RGXjRAptireIpnaDeMJZx3RHcq9tx/+FPy?=
 =?us-ascii?Q?0bnkmNoKWBM7eH+IJPaXX76jibXAJLEI6kJqJfxC3TdWGJkmWf5Z14liZAjQ?=
 =?us-ascii?Q?QfIfTtBxUzGQMNcD+Yl2+mPvcBnvj2Y8P9yHkI5wCWfJtnlfmw8tEjJYVD4M?=
 =?us-ascii?Q?u+vL67m5xdSdM0/d4THE1eSSYqLHP6kUeAZgyekcOZoyUSByyO4c+S4ZTuJC?=
 =?us-ascii?Q?sMZhDSJQbyTROXGceVkJncHQtI+UpiUfJmMhmN7A61ki+EJUdTi6gOdYlKd7?=
 =?us-ascii?Q?sDSbVuURshTNtyaX5iJ3FXzEjp0MGXPoOyu0DWGCNjCA6B21QjwrcXet4s3L?=
 =?us-ascii?Q?wRho0KcC69cQxC8AIlhLd/szRFSHvekG7P7pvVYpFCSopCojreKgrLpyHCpJ?=
 =?us-ascii?Q?RZ20ooIMQmYv+bnkxTl207G6NL9O4BN0We5aBYMCoxkqx6F3o69GhNS6J0IN?=
 =?us-ascii?Q?6SCniI2a6EI4N/Twtm4KVoqZVjzE3PuzQDGFlJOMx4nf0IvLT2gtuAxl1n5y?=
 =?us-ascii?Q?TCmSo7wh74I0UcH2RvabJLpMB1zoHhi+PkdcTY/+bjPRgFueBMpec9TpNYCm?=
 =?us-ascii?Q?ZdmnUOzw+IvwYd0wR+k=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a41b10-b9d2-47a0-bffb-08de1d744a96
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 20:37:26.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3pLKo3KQueBf7+vRQ3qOcnO3Ni7/4Ro2tlYtYjy+Gp/LUf0AILJxL9iGkliQIVi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7108
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 05, 2025 at 01:58:04PM -0700, Alex Williamson wrote:
> On Mon, 3 Nov 2025 09:53:04 +0000
> Mostafa Saleh <smostafa@google.com> wrote:
> 
> > On Thu, Oct 23, 2025 at 08:09:14PM -0300, Jason Gunthorpe wrote:
> > > There is alot of duplicated code in the drivers for processing
> > > VFIO_DEVICE_GET_REGION_INFO. Introduce a new op get_region_info_caps()
> > > which provides a struct vfio_info_cap and handles the cap chain logic
> > > to write the caps back to userspace and remove all of this duplication
> > > from drivers.
> > > 
> > > This is done in two steps, the first is a largely mechanical introduction
> > > of the get_region_info(). These patches are best viewed with the diff
> > > option to ignore whitespace (-b) as most of the lines are re-indending
> > > things.
> > > 
> > > Then drivers are updated to remove the duplicate cap related code. Some
> > > drivers are converted to use vfio_info_add_capability() instead of open
> > > coding a version of it.  
> > 
> > The series as a whole looks good.
> > However, I got confused walking through it as almost all non-PCI drivers
> > had to transition to get_region_info then get_region_info_caps then
> > removing get_region_info completely from core code after introducing
> > it in this series.

This makes it alot easier to read as most of the lines are just
re-indenting code. If you try to do it in one shot the patches would
be much more dense. The stopping point at get_region_info() lets it be
more incremental..

> > IMO, the series should start with just consolidating PCI based implementation
> > and then add get_region_info_caps for all drivers at the end.
> > Anyway, no really strong opinion as the final outcome makes sense.
> 
> I agree it was a bit indirect to get there, but the result still makes
> sense and I don't think it's worth reworking the series.
>
> I think Eric has some outstanding naming concerns and Praan noted that
> either a comment or gratuitous kfree(caps.buf) might be worthwhile to
> keep call-outs in check regarding cap buffer leaks.  I don't think we
> have any such cases, but it can't hurt to note the policy at least.
> 
> Otherwise, LGTM.  Should these be addressed as follow-ups rather than a
> re-spin?  Thanks,

I was planning to respin it but time keeps ticking away..

Jason
