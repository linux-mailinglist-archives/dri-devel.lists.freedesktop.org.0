Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96716A97451
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 20:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB3010E201;
	Tue, 22 Apr 2025 18:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nCr08dv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF9310E201
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 18:16:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysxq1ZOQYhoMeaPKsMG95UxGlxgopTXbiWjr9oOcoTSLNGdG6OHxmdyyDG3Kail9VVA0l+S3ISpTnqc3JIRAqY4yO8zD1EwgUd90EMswPkBX3sZJRFslY8a/Nlwoy18BmSKrZ14xuuJjjOivYuGO8Fn6+GJEtPkQXZusdw5hjQUJUWGKVPzWahVZOzqxmL3oPfuIskOCCq6PiTFa2Du76cX/F3opbwOm51mwkbg3RXycj0+pgFUZZfQMFj15DiG7TxZAP5PphTOfsqK66+YHq9/EKIoDBbo7o6uMGUC1twBwQoVMZb46uSYKWG8N4CUWqtw3iU9LyyJY+VrlTqphoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBkCIzevkBjTZtpIkw4endoWkwvGHIIT+mHw3K7Pe6M=;
 b=rcDRIumkaPt/EJbAkI+wK1oXVwr6THQDlNs5Coim+QzPcrKmFbpZC9ZzjMGmTTZ8xlWl5MVBxaLIK3K/yGBfnC4jH4FzPIht8JrgatwUqTkaz8/qXODFymvzZUgzpUUnSffnveNOca4AJ3T7LbW/svPTYtb1J2iskrYBULtNp5phyfD9vWUyj+C1ErksZFnf7U7gIsEtDrsx65Wzui7nGcpwpAF4gee3lEvoRxIecVefWqhxZvz66viqc9k9blqD6l3+krGATD/qHz0ZZaj8H1SXgQWnSvldz7HLasqzqX/ZaCjlSAQwlcSKXr6BvILwJ9DeQqn6Weawf4t6FzY1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBkCIzevkBjTZtpIkw4endoWkwvGHIIT+mHw3K7Pe6M=;
 b=nCr08dv5qOmONo4Bdmt3T6qo6Vo8ApPzjdJZylNgsxHWK2f6Z4wSwBLG2ww5Msp/rAXAABt2xlDIVLBZp2BDbfiYThTQyUXZRWyzrjVQap7mHuQkfAs9xmm9KE314Gd3PnoC64sDZqkzRD89VYAarIqr0n4pjJDRwEJEWVX5tqy6JsLUnZLA9h8VkicVo4ITguuicB7yLqrBBVwSlWjnhNr4vXWLPWfKSFWG0dvx7ohJTsNvCkoHwlBYvFO0Ot2r5XrHwhp2nls1ultufkcThqWrQIKJAPpm2Zs4QwHIFWr9BmXQuuxa92oICFNLgpshTo+yOpDrk1hCL8NfzdeilQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 18:16:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8632.030; Tue, 22 Apr 2025
 18:16:23 +0000
Date: Tue, 22 Apr 2025 15:16:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Andrew Davis <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Message-ID: <20250422181622.GA1648391@nvidia.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org> <20250414102455.03331c0f@windsurf>
 <Z_zwZYBO5Txz6lDF@infradead.org> <20250414134831.20b04c77@windsurf>
 <8f55367e-45c0-4280-b1ed-7ce9160c1fad@ti.com>
 <20250414212125.4b3e6f33@windsurf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414212125.4b3e6f33@windsurf>
X-ClientProxiedBy: BN8PR15CA0017.namprd15.prod.outlook.com
 (2603:10b6:408:c0::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7cf494-b44a-4e7e-a3c4-08dd81c9ca10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l2Lud94ESAJxMiXagNTgzdyESYUIBtjoQ6cwxeRggnPFN4yLdDewoxgqIIf8?=
 =?us-ascii?Q?pCNWrph5OQ/2Dc6ArAyLn4wUjoo+FwL0Z1t8Ax1UPUsi5gNMxd/zO8g9uJ2R?=
 =?us-ascii?Q?SK/PEj0YwovJQFyBQK+Zuu8aOd4c3UxuEju0Hr2zSObMtFW+p6LiT7x3M56R?=
 =?us-ascii?Q?GA2Z99Q10/QZo3W2EugJ+kISUcWR2LHJZGjyYA5hMWq+RkNqFCM89n5wpLai?=
 =?us-ascii?Q?eqTmwRXwtiyoox2n6i/By0yZxF9iMEz7H8MeMMghKxe5W0oPehJwFndHrAr2?=
 =?us-ascii?Q?yHDgesy4/OiPQBOS8IpHss+KRrjsy5HFX+erxPKG3Lp8ln/6VEmacR9ITMYG?=
 =?us-ascii?Q?LTZfK7Jv4Iig76wOmg6FO1+5nlD0JiYIELiyN8/1Y8QM/WpDqUcIlHs3EcV6?=
 =?us-ascii?Q?xut74uw9Tp0FhyrBAiKS+b0lR3ynrX0j23i1eEQwAkCtgL96vVy9qPL1+KsH?=
 =?us-ascii?Q?i40lcSg7M2W326Mj5NT2TDS89O3fFHRqGqb5Uwrpb3yMOYKT0p1lG8I4LDD3?=
 =?us-ascii?Q?PGCQOQuTgcdWeLvsVwQitUC7nf/kKyF/dFA7ieXxKTs2ia+hDWty0NxdLmF7?=
 =?us-ascii?Q?EsKZjNXn9htnl7DHJ6zVB+2obkuOqmfmq6xn4dl2jOg28kO8krZ4Eld+cE8g?=
 =?us-ascii?Q?VuiuIW+B6dSrNHSWheewNZuRUFN1oIooH1hFPlUiwpEPTyrbuyaoN5hY5rCw?=
 =?us-ascii?Q?R84IIxY1HRHrsj96GPtWsdzDeU73/FFQhPUc+R1g3W8lOSMeqkVYarCTgCz5?=
 =?us-ascii?Q?kGiHq8C3h5Yy6WXUGN2ND11HiFf0pfqrxu7N+QdQe14slQOFBko1RQ3cGDMA?=
 =?us-ascii?Q?xHC8V8MLwfoRZfgTCEFvyOaTqjFmTbiX/xziQxBuk7gMHqe42wqFUzbCtcEq?=
 =?us-ascii?Q?t/AtgJrpVenukyHdLlJKFzCb3FigdGtAdHAflXWMfNQpVafi6jsGaN5frTyG?=
 =?us-ascii?Q?ZfdVQfJZBtPKtMoRMZWRHIxG44Bf4z763lQOlfhexXAsV/CgiEdozTxe+Xh3?=
 =?us-ascii?Q?H3YjhQivkI3fOUSagw7SrhsU8Z5Ejhznj4+5EnfDnvaaIJkH5TZ5YaBhmDEG?=
 =?us-ascii?Q?WV789JxdI6bt3jr8lHjW6JrA982iPFpJQvOaEJYcYbkodHl3md2KMYpUJH4+?=
 =?us-ascii?Q?OMDB6iNOSeF8L4870mdxGlQC1IPiTl7AppvHPmaU8EjJ5PZqydZEiENiBgo9?=
 =?us-ascii?Q?klWxzhFUyWgzJ+nUDbJsGrYJ24x+yrvDfSvEPuqZsNy5O6+QoMTTVEsbsSOk?=
 =?us-ascii?Q?yNbTB/VX3bfNV5Tc8ykOBe+yxmF+zsa52RBcaiJblflMm3cNW2qnZB8Sq8m4?=
 =?us-ascii?Q?rRy1+P9NSvFQmTbj5ZhUy0n2h+oPOXDEvj0kxGOkKJlLaLzJBz+J0tSBizuI?=
 =?us-ascii?Q?f9MWeSFx7DCJDR0a3eGgaaixbRoZ7p1Q5acAIgwXR/O49TrDKlM+uRzN/J27?=
 =?us-ascii?Q?YKuSiFNzUU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FtCiHo3joPRXil0q3mo4g05bI4jDk2SnJPonZv6YmkpuxtDkAKx0ldVBGAaM?=
 =?us-ascii?Q?Lpr7Bt47J3q8A/ges2UWVgqwog3IeJ51bnRrIruBD7R/zipaUR0yIu1uCsm2?=
 =?us-ascii?Q?xkNMW9eASWcwjzpjqqX7EUkDV3EQKMijTKlomC18HSKxh904R1vW5iHOS5K8?=
 =?us-ascii?Q?44Ck8cOzOlilhVN5Pvz9j8XDWnUxh7NhI0Jf8SwAbTPMRR/BHN2FJ49SaH5e?=
 =?us-ascii?Q?V2HlX+SSYYiYsA+S+k8eC9RwWvg7VG5/fq1g2Xs6nTJfpfEPOFeOpzur2JzD?=
 =?us-ascii?Q?lzthHj5IxTYIyMkpV/uIViWS+wsh6CNPnGa3Gydp8agWeAMZ/YT5KnOR16Gx?=
 =?us-ascii?Q?tzHG0D22XpgzMIPr4+uy6bqqAlSauemfNzjlwTwEij32PSXIZ1fN4dDfbdgS?=
 =?us-ascii?Q?coNVBTiIzI+1aZEi6myuQajuj0eN6KyMCH/218KDXK+/f7Xqm4xevnjFddfL?=
 =?us-ascii?Q?Dece0ftuMVI7WEl/Z7n4kBPGCiQT4GumGABycytxXf3VZs02BVLpaGirhLN1?=
 =?us-ascii?Q?L95R8PImoWBvqOBw049ipqABw+TQWBB7ndcG3IjWuP/U67S+96kzGjsHiRBK?=
 =?us-ascii?Q?gHUatyftjW2jTEiMerEcBSkeJUqYgWEJTLR0Sq58ZcKcZsW1+qW0IGX9hVCX?=
 =?us-ascii?Q?U4nhCgiZ1iDJYkpi4HsbuuCIoTzdwV79gKCRYXFpuRVhCVBjlt+Iyz4iK7kB?=
 =?us-ascii?Q?b0qmNjmUV7Tpet5TgPGPiWqy1rE5PGzdItMRdRdZk1zZvbk6agtveXcT8UPX?=
 =?us-ascii?Q?WZ2X927dRIGPxk4TwRV+m0eHKkD+kjhZjELwH7Zk6zYU/1Wo7VGLiBR7mpt6?=
 =?us-ascii?Q?OKkoK8YQVsYBEtoZbhm2osNaeI1Z+bc1WVcEpxBdaRs7270qbdMzlmKO/h5Z?=
 =?us-ascii?Q?0kfMxImqIQFj9kCboLcU/AIQxscRsMQL6aXvxDjxBie4APaI1UyWUtZdnEZz?=
 =?us-ascii?Q?iYJGTgThGldXlm2lJdlgwY2qE5pSg4xce9/4gRin50NaV4P6il4j67d6QmUE?=
 =?us-ascii?Q?TjAdKjKdFJzCQQsW9FPAUooWkagi/ZzzeEVFTzUwvspiTcXqI8KdpJYWndWK?=
 =?us-ascii?Q?bXE7oL7RcgOA3+EU4TbxZZC6kJDMMhk7nAFIZt4uRhI/5exhf43t8FUlttEW?=
 =?us-ascii?Q?aJMcySG19Onvc2tmz4mphy2O453oK9xhpOxIB94O3uVAY8L+7lLDEateRfAI?=
 =?us-ascii?Q?TF734SfXtdPl0O2U149Ki11XDnMIiY0hd7BLEPndAdasras+/AuZ4Drembs7?=
 =?us-ascii?Q?dLluOlhdr8+p2lptNcn7FHCqphGI5eH84mtR4R9OtT1Z2B62xDVNgnz5EIri?=
 =?us-ascii?Q?Wuf+nQ0l9IirUmNY61SuAoQJk1bhiJ+YL8VB53v+uQ8FiAnfA3f+3psTp/yA?=
 =?us-ascii?Q?For79XmRxZUlWBqvGnE/QAXO6G8lchVfk8bUVtSylDKsh4oMgxcYTd4Pbu/M?=
 =?us-ascii?Q?Vaw9ICdpHd0Gwabyx8UaUSgsDoYjp9jD35fKlxu8bKDpLh6c7rWBX/is12yL?=
 =?us-ascii?Q?vyyjzoVRAdFwydIbQhpoP56q8P6gzs0luBM5AQsJ9Rd6dpr33OOuDCg2HTyl?=
 =?us-ascii?Q?cwaT/2qV//uGrJvbEBHJQt+kuhVRTXHfncHJotBw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7cf494-b44a-4e7e-a3c4-08dd81c9ca10
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 18:16:23.8185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA3tAjtEeGMYIfzTvGLvmRz6okCBQ8zTXWilotist8O1oYnPNZmY62OP42LlCbQg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005
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

On Mon, Apr 14, 2025 at 09:21:25PM +0200, Thomas Petazzoni wrote:

> > "UIO is a broken legacy mess, so let's add more broken things
> > to it as broken + broken => still broken, so no harm done", am I
> > getting that right?
> 
> Who says UIO is a "broken legacy mess"? Only you says so. I don't see
> any indication anywhere in the kernel tree suggesting that UIO is
> considered a broken legacy mess.

Explain what the difference is between UIO and VFIO, especially VFIO
no-iommu mode?

I've always understood that UIO is for very simple devices that cannot
do DMA. So it's very simple operating model and simple security work
fine.

IMHO, if the can use DMA it should use VFIO. If you have no iommu then
you should use the VFIO unsafe no-iommu path. It still provides a
solid framework.

As to this series, I have seen a number of requests to improve the
VFIO no-iommu path to allow working with the existing IOAS scheme to
register memory but to allow the kernel the return the no-iommu
DMAable address of the IOAS pinned memory. This would replace the
hacky use of mlock and /proc/XX/pagemap that people use today.

If that were done, could you use VFIO no-iommu?

> Keep in mind that when you're running code as root, you can load a
> kernel module, which can do anything on the system security-wise. So
> letting UIO expose MMIO registers of devices to userspace applications
> running as root is not any worse than that.

That isn't fully true.. UIO isn't fitting into the security model by
allowing DMA capable devices to be exposed without checking for
CAP_SYS_RAW_IO first.

Jason
