Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49FC3E147
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 02:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04B10E04D;
	Fri,  7 Nov 2025 01:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kP9wSHmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815FD10E04D;
 Fri,  7 Nov 2025 01:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPI6i1CQ2Bl/B8dndMJl0S/rWTQe4OosPt1ZPyIEYRVePtVoktHgkc6uX2VctaXn7tbPNwVTgq1eiqWivSbqTL9fwXX6S+UccIwFqGkdeEHoYww38RBFNNZXFHQPiiL3z96TNYlJjnI4VaIV40ZddZDCmjFLFcztJvDkjVqjGMCKz+Wqpm054dNEmdU07J25TabfQP/cN16OmxdJT/G1RonEnisLUnupTNjff4qfi8s6e9aTRqCyJfV9Olpkt4yvzsGU4TOJ1NB7GC4IiKXLN4MyhAMdNY1bkxUVJxH1bjR5g2+MAjSiRkcgyKGh14pcIGcNqtnbdaKBzwIyQwUB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTC50Wmu7S/tiYBpj/Vado3wSrJv48jHAgXy0zKUjy0=;
 b=s5v+1Einvry3wxlw1E7YLWsUt+QwAcCMD7lDrQUYV00WWKyH8qb4i9awKFmnl7d1iDgl+158/8BFMxly5zQ24/ElMjXHkJIbDbLg5dO/jSjlrp5abgH3KKkKjj6MDY+v012zHH9+uBHkDM+oZEeguEx7wi8FwkmOlzXwyRjmiV+pF5zxfBMFn6NF5Rz30+udrjQLV2WpfeccM5VH35cON4tdKPCOzLdr5+3L8NYjQWXGou/vxHnbSOYAHgspSCpKHwRSJOiQBthSd4sMB3wDKievdgJ7nHTn2TxShsCqyWY88+FC3ogQRuA0iSIibH/FtqXtifNrYlFuVq0NL/Sudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTC50Wmu7S/tiYBpj/Vado3wSrJv48jHAgXy0zKUjy0=;
 b=kP9wSHmB5fsPuwIFGnfHWKc4znpsCclzaOoHUwTyDADINtfCuR7q8ZUoI6/9NLyUmzurr95hV2a+tTr4DaMyxkgt93ZDdIHEpEywEdjFsZo1mqwQWduOVyZt7Mg3hkViKHweyK4STtxH7FPsGHnMxjVt/JvYhHG0/5gYWnY5QmY1Sq0q60fuRPPmWGSptN5oyLM0G9rHMUDL57Tw8TkNFAdMJE0gfChA/RemPoAq5dWrxXPeOm3tBOYJzOetdzyUXJVoAci7p4kQxz0MMRl24v5hzPM2uqpPdKBHmqc1FayS/PnbUto9gf4lW+NF6Py34UHc6dOIMUjYVrMqbC4tgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 01:05:52 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 01:05:51 +0000
Date: Thu, 6 Nov 2025 21:05:50 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
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
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 20/22] vfio/platform: Convert to get_region_info_caps
Message-ID: <20251107010550.GE1708009@nvidia.com>
References: <20-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <e3eb5b90-5f56-4669-8c89-1f405d23c5d6@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3eb5b90-5f56-4669-8c89-1f405d23c5d6@redhat.com>
X-ClientProxiedBy: MN2PR20CA0052.namprd20.prod.outlook.com
 (2603:10b6:208:235::21) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MN2PR12MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3a3ed4-0cd4-4a51-51f9-08de1d99cb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AHFvuvzEYejYCPsWcrOAFEYgjU76IOiN2vP9eKCGFUMm3n3s+nWfNk0qYdmr?=
 =?us-ascii?Q?WshZ6vGNj4b8oJFH2d/qim8CYznC40/g32yEkQ06XmlakPArfTkgSwFYSOfB?=
 =?us-ascii?Q?CK0RgYF+rCGDZ2j2S9Bh+SvuuX6KiorQnT0lOLRT1SV82kii6gdmYWApp3Eq?=
 =?us-ascii?Q?sAe027UXkYutGVkBr0hQ9OHXDcjE9chi1tIsr7QHDAC6DeUJIFmgqPAyaKgY?=
 =?us-ascii?Q?yrE+NvyLB6Qlg/Acu8d7s4QMDCZqDznM4HnftZstPqnGl7FlFJdFbqtqeuHl?=
 =?us-ascii?Q?UIeLT9xq7UH8mw6b3Slhs2VM2m/S7xi/vVZB+nPcHtJcPC6ZxWdKAWAj0scS?=
 =?us-ascii?Q?cgAGya4rGZ6NuqKAi051SUdViTA+dp4EVCVKDWkJ+61oS3qFlHhfPJZwR0qw?=
 =?us-ascii?Q?pJv9NaEvYBI96FCvkE7hQeSO5GmdufJBOKKs8heVO9dwtc5C3uaOPHtqyH4z?=
 =?us-ascii?Q?YF6xCqEaBl5ed1mI9kZSfcpIf5D5ZJB+IMMUK3oxGJC1gOpo+5TROrE7nCTg?=
 =?us-ascii?Q?izT0SkQP9+y+mIInLSBbZ7GhzOriHY20yAGofT1puCQ1vAx7SSwaUPdt2tCX?=
 =?us-ascii?Q?ROBBY92GXrGanuep6aLvypPip5X1fnd8MwaC60u/CnWVC9sA6vP/5INMiopP?=
 =?us-ascii?Q?jd5D/Bt3DfWkVBWOTu1bbut8GtgZRGG6Afd+zJd58q8w8pT0ibU1d6h3yfKa?=
 =?us-ascii?Q?7K3Vu3WcmPeBJ0FPRRtK5sN/LkYfaWYr3I2aORHPdrNAOtEnK6gC8Sjz+9fx?=
 =?us-ascii?Q?jICXZrpn2HG1wutKidUGchPzLIwmYvXpY9EwaUzeKlWVNQosOMrZNN/B4nLj?=
 =?us-ascii?Q?W4o5+KDRQxqC9Oze9SConPNEQFPwzOC6hnxnZV3kl8na3QzCIBf7jkjnBS6F?=
 =?us-ascii?Q?wfZWiP2DvOFh3VjGqoGtNXwgalwqpJCWKn8/NdpidwWFCFDl2uA7EErpXHOM?=
 =?us-ascii?Q?sWFIITer/m6UVfx2cJyTrGwQfuZfbW/LJH8X9Wa0VFU+N95Xx9Qhz/wONIdQ?=
 =?us-ascii?Q?v+wzeGile5v4c5hw3CbJ9R4XqrvvOHsfhvJfj3wT17tpfHfL7ztLJaeLLi53?=
 =?us-ascii?Q?a5udnC1L28twO/9AlEYAbcy7Jn8AKyILsKuVwd8VMf78S9NxCrgqH+nStA7C?=
 =?us-ascii?Q?eLYisKJW/lJBZfLGhYjWiz+XXpQ/S4ciB8ooR1Ew/J7hj4RJW8BMyB2t5DSy?=
 =?us-ascii?Q?mTszelkqA7O5RWW9MqtvsYP1x2E6BHYQDQJzwLlOjK+sTBCcBiLDpgHX4yvm?=
 =?us-ascii?Q?CalXkvCQIsnH9QCvj2oanKyXNLmo5TG4MJNv6aBe2KJCNUq6Iws3lZA6120J?=
 =?us-ascii?Q?0EfJnpsjoo2dwyDfB3sWH35b82GUicgCGXNs7Fg3t/MtUI2ysrjV76t9UIkJ?=
 =?us-ascii?Q?2cWtTxsf0OGdgb0TVwR9GQOZgD3VZyMnoWKSVShy9KFTXX/gGi5rMf7nEUvq?=
 =?us-ascii?Q?39mQ+hPslYTDky/HteIVpkSF1DXmoYbT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oa8enG+jXKIxoI/WkYiJ0bRt2YGAcw4V6aFoQAnP9odj0ukdRntTs+L4qoQK?=
 =?us-ascii?Q?hoax93sAVFj4T6uSavookRJcaCOUrpF9SCDP+lvPtzDchAh38Q1ueA68QDEJ?=
 =?us-ascii?Q?nHRzxmSV3WpFm2K6jDwAHpXTmDEx5FtTgY91Oo1MyD3/9HM0vmS+2Ug0yeQN?=
 =?us-ascii?Q?+US8aqxdKvq7YhhBlyakJjI9js+Rv9FwV4+BnUFnu3WN/LbB3bBwWi5YrYIV?=
 =?us-ascii?Q?2fG6OC/B96iAGKuMPxlTXkgRNzZfVvw1KCmEEzRsNvtckO+Jak74XQeR8gl8?=
 =?us-ascii?Q?ZZvxkZUwPyhbOOE7qmclk5bodyycbyh2Brp1jqVe8SE0ie9jJjxjbLw0qsM5?=
 =?us-ascii?Q?DG+ole1xx99wLP5n1ZjBSArn4dXT0i2KfIB5cEouHsKHsRAA+0AskUblsubo?=
 =?us-ascii?Q?+S1oM/sxE6MoK1FN3Eh3dfogkgdHvVTwjkcCW+B+zg3fcc0znMqQxt4ZfQat?=
 =?us-ascii?Q?5SrJHZSUQOF6O6GaEVk9+D0wAawsgtoeP68tHjO7YACTHjDtcZWRNXCSh9B7?=
 =?us-ascii?Q?gMp9XFdg2WavG7y5KtR7ZN76SSkHZUP4/x9404MgEd5axTq/mDhz7ozasStU?=
 =?us-ascii?Q?9+fFes0S0ZFpEWQDD1mFUneD+FOiXTXQvKBkcisH1A8jooUkXG6UJcHD9x3+?=
 =?us-ascii?Q?pOBN7sO4EZ1Gi1Tc5I9VTKD7PvWVWFWyGvfzozwved8uVsXUbz+AAQdOeoum?=
 =?us-ascii?Q?T283TLGVWm+J6CtobP5Y1dIvx6q9VxMHNLkOuv07wrr1MVtx7ilG9ktNAKZP?=
 =?us-ascii?Q?cvx5kYe8o0s9Xx84SyXftzaZHs8FTnlY40l1835jHfbYbh+Z7u7QpSsFiZsb?=
 =?us-ascii?Q?MvLuSOARQZazq3bmYhjyHNKhx2Drzw+E3lUG1XuOJGOdw/wf4IAkZIi7ADlW?=
 =?us-ascii?Q?pae70bg0EkvRn8LxasJezV+Ru/HRlLUXTaweHHRITofCLl/qLrRIUf/6Uq4r?=
 =?us-ascii?Q?Mmdx4ZE0kY5YWzvUgxv/X8uhS507DwYneX25ALz6EKdspfV9bWB11vefWxJq?=
 =?us-ascii?Q?mzpFCx7FmGLhJzPyjKlFicTf/x2aiwDvImY+mR+YjEa5c9qiiuVO2OsTtliq?=
 =?us-ascii?Q?LgWI+pU6fmC9GIPnf32Dui/hLxHc3ed816k50ywstN2nOX5zufcjR1EQ1jDo?=
 =?us-ascii?Q?jDkJwr9KyoFalgCfgAKGDEOPKaZ+aA+jq/oEyi8EeololQQCHkcOzURQDcm4?=
 =?us-ascii?Q?oOie0QJ+sXvKhlaj8ATKgiZq59ElNS6gHzv5prLL+U4k4uBpMjI7uibCFLUg?=
 =?us-ascii?Q?wq/fzMjx2uBLkjHLDRWbAn3cx7jOEyA/4ORDxddxc7RXnRszgOzv3l9uPIFv?=
 =?us-ascii?Q?0mfI3XuT0KOOA8jBoEqejGUuWQ1arW/9qHQvlnJS/8dYNlhMxTuPSuhpNwz9?=
 =?us-ascii?Q?X2s439JMmyhliYSVzs/R/wXFHUZdBBQBbmOePfvIhArxaIZXe/dZzhW6AkJY?=
 =?us-ascii?Q?27q/APzD848xK0KrUbj2uXOx9BAHLcBpRs42thrZcAGc1WZuqrkdG1YHyLkW?=
 =?us-ascii?Q?mdJmGDUiFNRsbrFvwpQxKWaOL2RM0uDDEw1CSQuKLK9I5eQnO0dqnnKU4k4D?=
 =?us-ascii?Q?6B9sT9nxilThJ+c261U=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3a3ed4-0cd4-4a51-51f9-08de1d99cb1e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:05:51.1225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwzCa909zelrF2pn40hiXtnr/XYTw46qemnuBndmUfDRDouuWJBCFgcXP8MM4UaL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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

On Mon, Nov 03, 2025 at 03:20:52PM +0100, Eric Auger wrote:
> > @@ -115,7 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
> >  	.open_device	= vfio_platform_open_device,
> >  	.close_device	= vfio_platform_close_device,
> >  	.ioctl		= vfio_platform_ioctl,
> > -	.get_region_info = vfio_platform_ioctl_get_region_info,
> > +	.get_region_info_caps = vfio_platform_ioctl_get_region_info,
> This would be nicer if called vfio_platform_get_region_info_caps I think

Maybe, but I pretty consistently did not use the _caps name for any of
the function names.

Maybe we should rename .get_region_info_caps back to just
.get_region_info?

Jason
