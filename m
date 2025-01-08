Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB24A054EF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7AE10E7FB;
	Wed,  8 Jan 2025 08:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lANAToRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AB310E7FB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ys4RzlzH+qm+py6CSFJ6koZ257c165r5GO2wT5mQmoUiYbKq6CLdxKEFSPZCiW8pvTOqqp9M+r7uYkElx6y2b5QPWwRM5j9Izy3tDxgAOnml8ypeY3pz4zxqLYJsHkg+O3JFDUqXXF8D6ToY6RvhVYzONMVfD7PkBieQV4d727UPkk6iwtM9/dDSU4DswfqvUTV2TkR53NQc7yEKskyTznrjL48fXXKYDv4zgZx2ZCpG1JIUd/r+N6bKmcqO7RAcIDrSAR3KVLcl2g75AMw/gHFVCgBg87SzVTPYQ1YOHTZcsFzSJL1Un5OasupBfleOZQoDdueJQw5UlkQz5qmzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79WM7Tidi4oEUYY8vULnr6zxhn4JGCzxDHdvTcqPNTQ=;
 b=dH0vo81dLd7nWqkZnMDQzfT7ch2MWNmkPLsLclfoJ30ceXPT0iznjHpzXaYE81NhStpbhnhKu+AY5lE6azvOONzFtqB56D8Ahow5wf3M3my7aWJvsuEijk1NjkWQr22CqWKOocRREBg2OOBpRfL195JI3axQbW3UESlIKGFwjGgzWiJITKdEzCdHsw+ezTF6pUjU2txw1jE2JMSsBAep/NH7SolMqkgq6GOuNJ/NvN4Zrf04/W3rtbf/mScysCgkIfoGoSzdhyK/CS9y3GokIvXfSgy3aMcuV3y31YsDmchJI3OBECIGkEMXHpIJoukVrkUQSCP1nyvytQPWmiZhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79WM7Tidi4oEUYY8vULnr6zxhn4JGCzxDHdvTcqPNTQ=;
 b=lANAToRB3LhBMtQpYJUAr8m0nEuwsWMT6CZ4inla5P+Ufgy6pjT4X6PYAvb58NR6aI02BO88jM3AEc1Y9vVNO5hZfE08DGsXcD+jtBd90SI+I6v6Wtenfj219m383b3JYJTfBMTvVDAthrC0aomX8aUMQRLGQ4XIyx7CnYMxkV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 08:01:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 08:01:55 +0000
Message-ID: <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
Date: Wed, 8 Jan 2025 09:01:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 aik@amd.com
Cc: yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250107142719.179636-2-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0328.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bc9b84-6ccd-455f-a33e-08dd2fbab7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGtwNlZHcExvNVFMcTk0QW9rUDJtWEM0Z3Jqd1hmRUNLaThFcjdDTEpCQi9F?=
 =?utf-8?B?N0F6NnYrMFNVK25jS0lpeThsSE9MRU96T0MwTDdsd3Bhdm5BRHJkY1JnWk5m?=
 =?utf-8?B?ajExZmtuWWYwRmMxQk42ZFdldTVLeEdoTUNZd0huZlJCNkJjTnNEcGFRWG5I?=
 =?utf-8?B?WmFhQ3FjMDF0UUMvUGhTb0U5MGh3Wm5Za0Nnd0xjWWJVTmljUnU3N3RPdnpE?=
 =?utf-8?B?R0RmaUoyTTYxVVlWM3dtcWE4d0VMdW9uZ3dWMFpvbTBIOXJHSzIrbnlMZ1hP?=
 =?utf-8?B?dXFHT3hMSzJyb0hZYXRhVExEVlA2emppY3FNYnpIVU5YV3FmTjJydGw5Y3Bt?=
 =?utf-8?B?dFlqTVZrMHltcjVBMFdHaGtHbXBtQ1poT2pyUUVzcmp2Q1dMclF2UUNzUER6?=
 =?utf-8?B?dEcvWjJJVE9QVWVIbTJDRUx0TVppKzhVU2ZTV2YyTUpkdzRDNWRNQmd6aGZq?=
 =?utf-8?B?UGpkUncxYVJLWUxvVm96RFpmVWpUaXJiTkVpS3dsSHc3ZHhoLzdKekppTGRR?=
 =?utf-8?B?a0Y0S1JKeTJ4ZjIrdDNPYjFsSUsraFRhQWp6azI3bTZVU09nRGt1eCtjQ2lz?=
 =?utf-8?B?aXFNS2FTb2o0N3dkUjJRMnE2MnhFQXVkam5kakE5Sld1dzdmZGZZR29aZm9M?=
 =?utf-8?B?OHYvRW52M0VKYVlCZU5tMm5HYzJxYk5USGg1c2ZGUDFYVVRKZTJqdnJGdUlW?=
 =?utf-8?B?RE01RHRKTkpCanZjY01OQXhwOWRjL2k3NXNNSkYwNGFtV0tUb1Y3TW1EaVBU?=
 =?utf-8?B?TUUzOXZHTHhHb0ZiOGZJVG1ML29GQkJOTnRmV0x0dWhkait2Mnd3Qk5MdUlp?=
 =?utf-8?B?bkVRbWNKTkFXWEZBUEpySndINWZPcDFqUTYyU3VQU2UwYVdFWnNoR2FiYjJj?=
 =?utf-8?B?eEdzTEFLNzZ3R1N5Yy9GbWx4L1ZWa04vQ1hUR3hHZXlnajZTRW1XWlZTR0pN?=
 =?utf-8?B?cmJoK245UXRxcVB6RE52YWthVy8wVngzMkttWkYyZ2cveWJxbC9pR1FueVBK?=
 =?utf-8?B?YVpOVnRDYTQyb3Z1N1V5dVM5c01xOWhJMml4TXJIdXFDdWR0eGpraHNRZ2N6?=
 =?utf-8?B?Nm5UVlkxajh3MUNxRGJSZ2pJSXFqRzd4NFRxVUlVNldZenpnVXBUOGQyNGtL?=
 =?utf-8?B?T1ZVbTBlV251UHVmSElrWWNJUm9kYm1URlcxRG03c3JQbXBWTjUyVHkrS1hR?=
 =?utf-8?B?VG1oVW8wT2UxbW9nWWxhYXdmd1VQbTlZeGdRZnNrbHVmREVqdWxnZExpLzJZ?=
 =?utf-8?B?NGY3YWRFU0laRURKeXpvU291U283S0xOVnRGUVQrajdjSmZudGVnT2kxdzdQ?=
 =?utf-8?B?YUI1N1lVSGFXekhVcVVmS2R2c21XUERuOGNCMU1lcFhaZG4xWTg1RVR5T3Rh?=
 =?utf-8?B?RGxMRU9nbWhTT3pPVmFFUGZzMUsvTTJVVElFTlE4czRCbzJpdFh4OXQyVDFO?=
 =?utf-8?B?dkVSM0o4MENuMzZ4akI2dDlqRXVDazd6SzF2LzhnY25RUkdRRllPR2xwRXh6?=
 =?utf-8?B?MVRCM0F2bmdZbE42bkEzcnMyMEFacnpzMTVHNDdXU21VeDMyY3ZHaGVtM1FD?=
 =?utf-8?B?aFY1S0dVczBGUFhhK2lvUERFS1JuZFFnYXZzNWxDK2JPWTRtZVRseTY0bGNn?=
 =?utf-8?B?MjZLWTJWWDUzOXNjQVAxRHQrMjUwTGhpd0MyK3d5QjU3LzdhR3FMRVZKSG1t?=
 =?utf-8?B?YUF5MTRaOXE5K21IWm1JL2RBSktiUktzdG9lTUoxeCtFRTUyZEZid01CN2kx?=
 =?utf-8?B?ZkovRWg5bFFnTWVWNC9rZnJEL09oOGdyRGh6Z0o5OG1qaGd1WklOMGd2dkho?=
 =?utf-8?B?TVRjTTh1Mk1WeWpnb21nT0Y1cjdTUllPcmlWUDdWN2FXbHhiNlhOR3FBS2dy?=
 =?utf-8?B?Z1NEamIyWitNcEVTNklUemEvNDUvQ0drMHdwaVR5NzYzT1BkTFhCc0xEWXFD?=
 =?utf-8?Q?a8kzwOWDJcY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWw0NmlYR1hXZkJINjA1S2ZBS2MwTXlkN0hRcDVTdG15NkJQa2cwRTlEYWM5?=
 =?utf-8?B?Q3BHZUJhZDR0UlV6NUxabkFmc09tbFRRUFcyNXdJNllWVG5hWlNTbmczRU9C?=
 =?utf-8?B?ZU9RMDBkWlVsbmhocWNxb3pzWE9yenpVRFV4MW1jdWlWUEdVNUFVTUFEejlz?=
 =?utf-8?B?RkpNTFFNeVN4Ykt6cVB3NDIxWEVzT2wzQmNnWC9zMHZva0oreEFTeTZXR0U0?=
 =?utf-8?B?cjlDeld5amlQQVovZmxqaFV6b0IyTHJMUkxFdXRTWm9SYjB4QXRLRVpOcTlw?=
 =?utf-8?B?bCtKSFVmMjF5YmdrOVlkWXEydE82eHNqUlpSMnQ4VXVvQ1gzTGo2Z05ncHcr?=
 =?utf-8?B?Vzg5Ky9UODcyWWdzVXptdVo5SzQxYm5Idi9sQmdpSDhlb0g5NW4wWTNJNHNw?=
 =?utf-8?B?TUQrWTBqSUJsR0MzWEcxQ1FXK2tDTzNlcFFsNlpkTzVmYnEwMDlSNWJhLzdk?=
 =?utf-8?B?aGNhaHZzcnpia2hDVk90VjNLcGxjcitnYm9ncUQ2U0M3M21yeEYzQ0FydkpJ?=
 =?utf-8?B?eDFGak1uRTdWOHhEempLeGMybC9tYVJDWmNrbnZoeEFJSXdQY2UyTnFzcXhQ?=
 =?utf-8?B?VkVCejQzOWtaSlo0L1JhMTdPeUxWWWg5UWZSamFyNk4yWTU2YTZ2MEI2dFRY?=
 =?utf-8?B?S0tKRE9zMkg1N3VaeTJQbFgzRkJrTnBvVzBlVWtXSkZTRVZFL2xBd0ROKzRM?=
 =?utf-8?B?YzVsampzZmJGaml2eG5TTGRuc0ZNWEVYSmZ1QmpRTmthbEJ6T0d2QjJIb2Rs?=
 =?utf-8?B?RHFtdzdNbEhkLzlER21NRXlRUzBxYmUremlQazNDSmM1WWpHR0hveDc2QjFD?=
 =?utf-8?B?SUR4WXZQZ0VWTkZ3bVh5WHZkS3JWd3ZGWGJJVy9rSFR2M20zRUlLeWxQU1RW?=
 =?utf-8?B?b1RUYURVWFRUcXY3UlB3c0lMekNCUWF0MnNQVWlpamxWZUg0L2hNM1BtdEpY?=
 =?utf-8?B?ek43VUlKQ2pYbFlxTzR3dmpTcXdQeEM0NFFkaUsxbjI3dEFscVZYSHczVGZ2?=
 =?utf-8?B?YktvZ1ZWNHdTa3k2aXF1K3dEdkVaL2dpRHdBdXFvZWd0TlR4QWMyMk8wdTh1?=
 =?utf-8?B?WXlFM1p6VENrL0xmVFAzWnVWNXpKZ1cwZUJIdEtqc2hudGJub2dpbzhBZTBU?=
 =?utf-8?B?Z0xJMnB3Q0ppRjgxRGxNc1JPVWphejR2bGxMbEl1cWFGYkJDRXo5SDg1V1Jy?=
 =?utf-8?B?QVNvQUNiRmhCN1dicHhHdDF5dmRLVjFTUDBRQTg0K3NvU2FlQWJ3OVI3TDcx?=
 =?utf-8?B?KzdtL1FjeVJkYTZYWWY4VkFBVnpEZFdFY0JXMGJwb0Y0Wk9SdkdJQ0RCQVdj?=
 =?utf-8?B?aUJHeE13Y29EUGV4T1JTeHQxUzVrUW9nM0Z3ZXo2TEphVFNvVGhzei90dVVB?=
 =?utf-8?B?M0pjcmE0c0VGTUVudHZzbU5DL1psOWhSL1REa3BDQy9JbkFDTG02TUlmYk5S?=
 =?utf-8?B?OGoxdkpjTy9lemVhM0llZG1HSU9YYTBFaWYzbDUvbFd6ZXhXeVFPak9VODUx?=
 =?utf-8?B?KzZTOFZjV0hydEVBeVpvT3ErZFNvclRGQVgvOGlnOWxzRTcvUDQ4bW1vcFhE?=
 =?utf-8?B?NTByajlLU0FzRlQvQldUcGJocGJ3b0p2MkMwSGY4Y2x2a1JVcE5zb0Z3M0kx?=
 =?utf-8?B?bFl1ODBMNHpnRFUwaDlHb0t0OEJjc09Wa1lIYTRGVnNzaGhLNjljWHRoN1Uy?=
 =?utf-8?B?ajZqenNTOUdZRjdhZGhhbGlsdkFUaUN2eFFWVDRSVTF6RDdDcEJVN3c2QTJC?=
 =?utf-8?B?MUZvNXdEOXdUNVRlK0hiWXp4Q0lIa2FFcGZwblNzM09abU85WDd5UUFBUGNQ?=
 =?utf-8?B?QkhkNkdRSktGNnpLbDdTcDkxSkpNSHFNZlBBMFNqakcyY0R6RXd6S1RQdGRU?=
 =?utf-8?B?aDY1QVF2clpvM2JvUGVBUGdGaU1PUFYzRlR1MUpZZEZOTkh6SWVjQ2x0QU9F?=
 =?utf-8?B?eGM0b2N0eVVYUlpYZXkyVFZ2eWNualh5MjdPM1pKVkxTd2paQ3lJK0JoQ1d3?=
 =?utf-8?B?QVF0eDgvOU1pdjlBZE0zMW5nNFRLWWJ4dVR5aGtKd0VXZXFEalVYWDZDcjM0?=
 =?utf-8?B?enl2NmJYazE5QkpRb0dXOXhGcFhGejVET1hBeC8rMGdtS2lIOXVzSjZNRFVL?=
 =?utf-8?Q?lbFdYem4kxhUbU8ulY/L/P8fw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bc9b84-6ccd-455f-a33e-08dd2fbab7f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 08:01:55.4377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLQoaPkGVY/mtnQd/kTUAWROY4KoIYsyyLGU1Uxcj6joYuaPs7Ta2iDGffKDyn1x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
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

Am 07.01.25 um 15:27 schrieb Xu Yilun:
> Introduce a new API for dma-buf importer, also add a dma_buf_ops
> callback for dma-buf exporter. This API is for subsystem importers who
> map the dma-buf to some user defined address space, e.g. for IOMMUFD to
> map the dma-buf to userspace IOVA via IOMMU page table, or for KVM to
> map the dma-buf to GPA via KVM MMU (e.g. EPT).
>
> Currently dma-buf is only used to get DMA address for device's default
> domain by using kernel DMA APIs. But for these new use-cases, importers
> only need the pfn of the dma-buf resource to build their own mapping
> tables.

As far as I can see I have to fundamentally reject this whole approach.

It's intentional DMA-buf design that we don't expose struct pages nor 
PFNs to the importer. Essentially DMA-buf only transports DMA addresses.

In other words the mapping is done by the exporter and *not* the importer.

What we certainly can do is to annotate those DMA addresses to a better 
specify in which domain they are applicable, e.g. if they are PCIe bus 
addresses or some inter device bus addresses etc...

But moving the functionality to map the pages/PFNs to DMA addresses into 
the importer is an absolutely clear NO-GO.

Regards,
Christian.

>   So the map_dma_buf() callback is not mandatory for exporters
> anymore. Also the importers could choose not to provide
> struct device *dev on dma_buf_attach() if they don't call
> dma_buf_map_attachment().
>
> Like dma_buf_map_attachment(), the importer should firstly call
> dma_buf_attach/dynamic_attach() then call dma_buf_get_pfn_unlocked().
> If the importer choose to do dynamic attach, it also should handle the
> dma-buf move notification.
>
> Only the unlocked version of dma_buf_get_pfn is implemented for now,
> just because no locked version is used for now.
>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
>
> ---
> IIUC, Only get_pfn() is needed but no put_pfn(). The whole dma-buf is
> de/referenced at dma-buf attach/detach time.
>
> Specifically, for static attachment, the exporter should always make
> memory resource available/pinned on first dma_buf_attach(), and
> release/unpin memory resource on last dma_buf_detach(). For dynamic
> attachment, the exporter could populate & invalidate the memory
> resource at any time, it's OK as long as the importers follow dma-buf
> move notification. So no pinning is needed for get_pfn() and no
> put_pfn() is needed.
> ---
>   drivers/dma-buf/dma-buf.c | 90 +++++++++++++++++++++++++++++++--------
>   include/linux/dma-buf.h   | 13 ++++++
>   2 files changed, 86 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 7eeee3a38202..83d1448b6dcc 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -630,10 +630,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   	size_t alloc_size = sizeof(struct dma_buf);
>   	int ret;
>   
> -	if (WARN_ON(!exp_info->priv || !exp_info->ops
> -		    || !exp_info->ops->map_dma_buf
> -		    || !exp_info->ops->unmap_dma_buf
> -		    || !exp_info->ops->release))
> +	if (WARN_ON(!exp_info->priv || !exp_info->ops ||
> +		    (!!exp_info->ops->map_dma_buf != !!exp_info->ops->unmap_dma_buf) ||
> +		    (!exp_info->ops->map_dma_buf && !exp_info->ops->get_pfn) ||
> +		    !exp_info->ops->release))
>   		return ERR_PTR(-EINVAL);
>   
>   	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
> @@ -909,7 +909,10 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	struct dma_buf_attachment *attach;
>   	int ret;
>   
> -	if (WARN_ON(!dmabuf || !dev))
> +	if (WARN_ON(!dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (WARN_ON(dmabuf->ops->map_dma_buf && !dev))
>   		return ERR_PTR(-EINVAL);
>   
>   	if (WARN_ON(importer_ops && !importer_ops->move_notify))
> @@ -941,7 +944,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	 */
>   	if (dma_buf_attachment_is_dynamic(attach) !=
>   	    dma_buf_is_dynamic(dmabuf)) {
> -		struct sg_table *sgt;
> +		struct sg_table *sgt = NULL;
>   
>   		dma_resv_lock(attach->dmabuf->resv, NULL);
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
> @@ -950,13 +953,16 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   				goto err_unlock;
>   		}
>   
> -		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
> -		if (!sgt)
> -			sgt = ERR_PTR(-ENOMEM);
> -		if (IS_ERR(sgt)) {
> -			ret = PTR_ERR(sgt);
> -			goto err_unpin;
> +		if (dmabuf->ops->map_dma_buf) {
> +			sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
> +			if (!sgt)
> +				sgt = ERR_PTR(-ENOMEM);
> +			if (IS_ERR(sgt)) {
> +				ret = PTR_ERR(sgt);
> +				goto err_unpin;
> +			}
>   		}
> +
>   		dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
> @@ -1119,7 +1125,8 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   
>   	might_sleep();
>   
> -	if (WARN_ON(!attach || !attach->dmabuf))
> +	if (WARN_ON(!attach || !attach->dmabuf ||
> +		    !attach->dmabuf->ops->map_dma_buf))
>   		return ERR_PTR(-EINVAL);
>   
>   	dma_resv_assert_held(attach->dmabuf->resv);
> @@ -1195,7 +1202,8 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   
>   	might_sleep();
>   
> -	if (WARN_ON(!attach || !attach->dmabuf))
> +	if (WARN_ON(!attach || !attach->dmabuf ||
> +		    !attach->dmabuf->ops->map_dma_buf))
>   		return ERR_PTR(-EINVAL);
>   
>   	dma_resv_lock(attach->dmabuf->resv, NULL);
> @@ -1222,7 +1230,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   {
>   	might_sleep();
>   
> -	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> +	if (WARN_ON(!attach || !attach->dmabuf ||
> +		    !attach->dmabuf->ops->unmap_dma_buf || !sg_table))
>   		return;
>   
>   	dma_resv_assert_held(attach->dmabuf->resv);
> @@ -1254,7 +1263,8 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>   {
>   	might_sleep();
>   
> -	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> +	if (WARN_ON(!attach || !attach->dmabuf ||
> +		    !attach->dmabuf->ops->unmap_dma_buf || !sg_table))
>   		return;
>   
>   	dma_resv_lock(attach->dmabuf->resv, NULL);
> @@ -1263,6 +1273,52 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>   
> +/**
> + * dma_buf_get_pfn_unlocked -
> + * @attach:	[in]	attachment to get pfn from
> + * @pgoff:	[in]	page offset of the buffer against the start of dma_buf
> + * @pfn:	[out]	returns the pfn of the buffer
> + * @max_order	[out]	returns the max mapping order of the buffer
> + */
> +int dma_buf_get_pfn_unlocked(struct dma_buf_attachment *attach,
> +			     pgoff_t pgoff, u64 *pfn, int *max_order)
> +{
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	int ret;
> +
> +	if (WARN_ON(!attach || !attach->dmabuf ||
> +		    !attach->dmabuf->ops->get_pfn))
> +		return -EINVAL;
> +
> +	/*
> +	 * Open:
> +	 *
> +	 * When dma_buf is dynamic but dma_buf move is disabled, the buffer
> +	 * should be pinned before use, See dma_buf_map_attachment() for
> +	 * reference.
> +	 *
> +	 * But for now no pin is intended inside dma_buf_get_pfn(), otherwise
> +	 * need another API to unpin the dma_buf. So just fail out this case.
> +	 */
> +	if (dma_buf_is_dynamic(attach->dmabuf) &&
> +	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> +		return -ENOENT;
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	ret = dmabuf->ops->get_pfn(attach, pgoff, pfn, max_order);
> +	/*
> +	 * Open:
> +	 *
> +	 * Is dma_resv_wait_timeout() needed? I assume no. The DMA buffer
> +	 * content synchronization could be done when the buffer is to be
> +	 * mapped by importer.
> +	 */
> +	dma_resv_unlock(attach->dmabuf->resv);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_get_pfn_unlocked, "DMA_BUF");
> +
>   /**
>    * dma_buf_move_notify - notify attachments that DMA-buf is moving
>    *
> @@ -1662,7 +1718,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   		attach_count = 0;
>   
>   		list_for_each_entry(attach_obj, &buf_obj->attachments, node) {
> -			seq_printf(s, "\t%s\n", dev_name(attach_obj->dev));
> +			seq_printf(s, "\t%s\n", attach_obj->dev ? dev_name(attach_obj->dev) : NULL);
>   			attach_count++;
>   		}
>   		dma_resv_unlock(buf_obj->resv);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 36216d28d8bd..b16183edfb3a 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -194,6 +194,17 @@ struct dma_buf_ops {
>   	 * if the call would block.
>   	 */
>   
> +	/**
> +	 * @get_pfn:
> +	 *
> +	 * This is called by dma_buf_get_pfn(). It is used to get the pfn
> +	 * of the buffer positioned by the page offset against the start of
> +	 * the dma_buf. It can only be called if @attach has been called
> +	 * successfully.
> +	 */
> +	int (*get_pfn)(struct dma_buf_attachment *attach, pgoff_t pgoff,
> +		       u64 *pfn, int *max_order);
> +
>   	/**
>   	 * @release:
>   	 *
> @@ -629,6 +640,8 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>   				       struct sg_table *sg_table,
>   				       enum dma_data_direction direction);
> +int dma_buf_get_pfn_unlocked(struct dma_buf_attachment *attach,
> +			     pgoff_t pgoff, u64 *pfn, int *max_order);
>   
>   int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>   		 unsigned long);

