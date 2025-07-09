Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B928AFEE95
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 18:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5C610E2A3;
	Wed,  9 Jul 2025 16:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="krE6JAQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052D510E040;
 Wed,  9 Jul 2025 16:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paVZzkqw6zpDt9mJvkCal93+KJQUHK6r/QElTneDTlaqHup0sB5hiGsMs+N3zWTzUIF3TCxVnDDqcOSUim1Ob9GNu4kulubdHaet0jxohrvHHtyjQBCmRzdwf1btbgg2UPOkub1m84KIeOjHcnUxonGxhgQUkMmX5JX2+IzxQqoEg7/D8flsx9ydwt9vzDxtbqqTDS120UKw6qtY2BznwoAPvMORZB1Nmip8bZc1D0Bt2fArI3QCtArDs7C/rLCZsFEbcyKsogmvyMjjjFlRcamukpSF4QDWp8HU/rVkdYCMtXHemp6iEPO1eL7FaM8hPCl5M1IDyIBvl2BndE/l8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTQT6tjIcTxLOP+rt8mYSXY194FXA0G44x9W+kz/IcI=;
 b=Z5VtlUh1W/QPrdiSnKnrbTNCVMawbP/5vUIyjDJYUQZQZHavmDI0hY4F2y/MA/Z9reRFF2P2t/17yp6Pjt2iNvKOJi7Nf9s5c1QHWWqS1ZYnefaDNao0PFth5D3310Y85fgN1pK6dyYJCds5nMTTUTJGZS5i9QdNIFWPbaNK7T1/Ay2Lj1tgn0dVQLmlQVa97IKPowaEhMzERAM/Uaj0mUJ5ckX/JJK6BM5Awpw3yMRcJHyt+mEY0tcRGmVT/9Gd24Ew9XIyINsrJnW0Cs7HdAZvW7uBT5027DcRP/b1/1x9vqSq+BCs5k/8n2nj+xRDI97bYVTq6ARjfnuFwE7fxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTQT6tjIcTxLOP+rt8mYSXY194FXA0G44x9W+kz/IcI=;
 b=krE6JAQ0OZVHWVWC1nNKQBIM0kq3ujcF8o1RX3BwwG1LiN0Tv71PBTQRsaoP3RhxlVuJ5G68B0ViAtPryGXdi4IDZxL/jU/LKLphBHzvWmXmcjUFhHb0DsV7oQGz5hPf94Z6lX+UmyEN8U/x5/2RPLsohMjX8hgMqpCZILJdLMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 9 Jul
 2025 16:08:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 16:08:52 +0000
Message-ID: <0bb800f5-fa0b-4fb1-8a8b-f65e698d587a@amd.com>
Date: Wed, 9 Jul 2025 12:08:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
 <20250709100512.3762063-4-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250709100512.3762063-4-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d07ea60-75f5-421a-7718-08ddbf02e584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnFmUHNIQ253dVROMVRJMnBVeXc4TU12L2tFU3pKMHp0UC9VVklRRFBsSjY2?=
 =?utf-8?B?NWljTmZDZ2dtRHM4a0NjU21OeGF0eitvKys4ZzlqaEtKMUJlakp2akRKUUFN?=
 =?utf-8?B?RGg5YUNUemhiTDFkMUd0TURSWnZQNUhoTGpsaVBZallrZmlSVjVOalc3U2RT?=
 =?utf-8?B?bWZTTFhzM0xLdEk3THVuUGp2cllTQnhtb0l0OHdNZkswNUxGUnpKQy9rd3Ay?=
 =?utf-8?B?VGpwL1k1RGRyTmRESWxJczFjOVg1ZHljWUE2U3RsV1BsMjQ0V3Y3T01wUTBp?=
 =?utf-8?B?d3JPMzYySXJuUGhjK2VvNEd4K1FyTXlYdDd6LytqN3cvM0hiZWZlVDBwZGxh?=
 =?utf-8?B?bHRXWUd4MzhTQXI2TkZuTmV2K01qNlMxd3dNalBMdGF3ZW5DOVRCUkluTWN5?=
 =?utf-8?B?YmdIS0o3OTZ1V1NEdUZjOFIyRHVaUmZPclg5U3Fna2wvOXlsUVV4RU54S2Ft?=
 =?utf-8?B?cDUxaldZNDRtNFRTUHFBZ1BYQnc1OUlXYTNndiszaG1qU2JHUk5DT2gxWWV0?=
 =?utf-8?B?cHlDMDNXY0RQYkx1dzJwUnozdkVmdFZlbGIrZERINlI0YTlISVA0bnhqZmQ0?=
 =?utf-8?B?cGxkUElpSjhzOFJDcXNYTnJBa1FjSjBHV2REakZ1UURhVDdmOE1EUVMxT2c3?=
 =?utf-8?B?WDBHM2cwcXFqVEdET2xHN2ZGWmJGNGVaL1pZMHdURmZjNnFrN3RXd0xJbUtj?=
 =?utf-8?B?ZVh1VnJYNnVkOTY3cDJJMzNNcE9PL3l6L2NZTGF5KzNNM0hISW13bHMvMWZ1?=
 =?utf-8?B?b2ZRMUdNZUJ5a3RCemVxeU1BeWl2MXc1bW95V1FaSlB5dnAwTGU2cnhXdlVk?=
 =?utf-8?B?bDBpOVIwSHRYVlQxSlRqZWFHaGlFeGJUaWpyOTBab3lGKytJelBscU1EVm9o?=
 =?utf-8?B?MnJacXNrR2UyUFBTamRRM24xSEpPaUFHWWpxWVFZeEoxYTdyRDZEWExQNnJt?=
 =?utf-8?B?c0FoSWxpMkJ3QWF3RkswUFNsN29UVjhQc2l4Rzd1Nkg4ZUk0OHhlbUdWVlhO?=
 =?utf-8?B?Z1g2Tkx1cUFwQUVqY21iU3FFSkdxVmtZL3FHUVJwSjhieUg5T1llYnB6VERV?=
 =?utf-8?B?QWlVNzczOHQwK3hqUkF4dlBTeThtY0E3dEFxNDRXMXl4dGVTd2FnME96bHZl?=
 =?utf-8?B?T2ZYT3VMNnNjTVBwdTNBTnBzcWZOUElLY0xGenRJRnVFSExQSGZLeS9mVjJR?=
 =?utf-8?B?eFNLMEhxaGdGS29nclRHWm1NY3hwaUtUU1NqRENMOEY4STh4YkZ4SkhHR3NV?=
 =?utf-8?B?eXlHcmZscEI0bCs5ajF0SnBwdElJSVl0bG9SYTdxSzJmMVUzQ2hRMjlMeVJl?=
 =?utf-8?B?b2E5Z0tDNHRrRnA1OHdjZXJ0STY3WTE4NC9RRHptVUJmbmtvNXJ6M0JSTVNG?=
 =?utf-8?B?aWNDKyt0YVB0M3c2WDR3aDFsNENZMUpWR0dnR1A2T3pxSWFxVGpiOHlaSjgx?=
 =?utf-8?B?azhDQ3VUWFM4OUtHTGRzdk1IVXRJT2dnallHV1pleUZSZlFGc1RDUENJYjdF?=
 =?utf-8?B?ZnZVTDU4UnlKRjRpNEliR0QraEtFQldzWjExc09nV3ZCU1Y1SDVLUGVoR3hL?=
 =?utf-8?B?YmIzYTdzNDFlSy9ZMWY4bXhtK0E3MWlRT0ZMNnA1Znd5Z0lMd3c5VlhHZlFr?=
 =?utf-8?B?MmFuQUc5elc3YTF0YktsL0tOcFZvT1NhYk0vWFBSQVNTRDhVMEMwVm5takFV?=
 =?utf-8?B?dTVTNjQ1Ty9uU2FIaFVxcnU3VnphZlJGNVpWM0hnelZGdzVtRHNBSnpVYXdV?=
 =?utf-8?B?a0c0T1hleVV0V2FmaEZmT09kaUd5Vk81dVRONGt5MHlyTll3TE9vS1hpUWRu?=
 =?utf-8?B?RTNCaUJGcnNFVGIxdFQ4YVg5a0V4ay9xbGlzUHBuajBqQnJZVURPU01oSHc2?=
 =?utf-8?B?ZVgzMmNQT3Z3TzY0T05YREZWeUhnZUJNUnRJeCtsS3Q0cGYrclpQUUR1a0ZN?=
 =?utf-8?B?eXNGdjBUU2ZnR3dkbFYvTEh3Zk13ZlU0R20vQ0FSVytRNmZMVDQ4ckYzcTVQ?=
 =?utf-8?B?c0U5STJPd1V3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clNqRWVEbWZFUmJ6cmMyV2MvaEd5TEFoSEU3aHRkM3VUYUZqcXdNbkl3cGNy?=
 =?utf-8?B?cE40ZHZaSWdya2NYc0VHOWphNWdGbFppa1diUTFlRHA2VVlUS0w1MDZZZXZB?=
 =?utf-8?B?dnlBbDJtUWllV0dOMHd3RW9MNFRqYjhwSjVGeFVSOU44WkpzR0Q4UGZOUXB4?=
 =?utf-8?B?VUVUU3MwT2ZpWlgxcGFyTk5iMERaeUZ6bHNIQm5ZWko2RUNPdG1XNy9CYzRF?=
 =?utf-8?B?VEdqUndkQmpwNG1kUlB6NEFCYmdYemc2b1NmbnFsZzdhVEhTTkJPTSt6Wmpv?=
 =?utf-8?B?R0dlTUhJeDZCNTV2VnRQLzFzOWRObWdPclA4anBxb2NnWVFGbnZTaU52emZK?=
 =?utf-8?B?eHZhTnk4SjV5SGJBYTBtUjR4dFBqeFZtazBQZFIxMitPd01EQmRvN0NKbGdQ?=
 =?utf-8?B?cnVKbzNQbGkrd2tOY0FHaWhXNm5RK2wzL3ZjeFA2VlJTeGRYOVkwczV6Y1ll?=
 =?utf-8?B?VjhsYzhjT2tHWDFqR3N2cDROY3pIVXVXNmxiQ3FucytVVFUvN1FoNFFmdGtu?=
 =?utf-8?B?Y2FwMTVsSGdITnNYZ0I5UjJmVmNTcW5sU1Y0KzJUaTJmS3VTZTRpOTlnZzJn?=
 =?utf-8?B?aXdsMm1TMkdyWjFoQzAzRFhPc0pTRVFHMmhDcG9lNDRRSzdpaVc0dTZuZTdk?=
 =?utf-8?B?ZC9BTlZXSWYxMUcvMXBOYWt4QURTbmo1NkM0eVBXT3lWdTVZVU1lblV6K3Ar?=
 =?utf-8?B?MmJTQy8xSGZ0YUJiRU92TDJkZHE2c2pZbnhSNHJlc281QjR0QWVtNmk0Q0Y1?=
 =?utf-8?B?Vk1rQldwTm9kYW96UlJldkg4ZVpjWWdTUk11TitKL2wxWmlzTHBJRWxnTnpo?=
 =?utf-8?B?VG5SM1EzcTd3K3VMM0ExRndzWE45N2psWUVUc3k0RDIzZHRub2NiWEFSRnZh?=
 =?utf-8?B?STYzMGJpQWl1Ri81UW56Z05oeVN3WXhWemt1RzRjYkgwekNnZzVWUnQxbGJP?=
 =?utf-8?B?TitMbmt0QVhvdzk0MVptNHVIaXhLaUxhZVFlUVdhalNVak1GOFo4K0dTbXZz?=
 =?utf-8?B?NkdscFVzV1FQOERQOFEwR3B4MFowZ3B2R2RsaE5VRGdjZ1RQdzhsOWlzNmVE?=
 =?utf-8?B?Tys0ZWgxZk4rVWFlLytFYk9RekM3bDVlajRiUXRCc1hyQlRabHBFTThidU5s?=
 =?utf-8?B?NldkZDg3dU9XQk8vN084b245YXRzdnc1Y3hTcmVLRkRFMEJURzhIL3dYZVFU?=
 =?utf-8?B?RWd5ODdwSHErWEdwdGRwbkY0RjRGUit4K0kwU0xnNUY1UUEvd2RuR3gyL0tL?=
 =?utf-8?B?SG1lOFlBRWRzbU50TWkveEFiUFRYZWptZnNYOWRhY202dlFyYllWYUpPaTdo?=
 =?utf-8?B?Q2dORFlYR01rVnFZRnBTSW1hZFFsRTN5NkhMMnV2eStCNUtoZUdQblFycDA5?=
 =?utf-8?B?N2ZQKzlGL3JnZ2ZXbzBTRldBYktoNHFDRmV1bTI4Sjk3d3YxQTI0NXNCVVNl?=
 =?utf-8?B?NUcrMEhFa1BIbmdjMEFlc3ZRQ00zNFVPOHRlVitRZWVlNXlsZVNZSWUyU3VO?=
 =?utf-8?B?dGVlcHdFZFdLVFJweWlwLzFJTEpGUFNpMjVKVEJnZGJEVEl6bC9FNGZWVWpi?=
 =?utf-8?B?VEVoSFJod1FFKzVRUTJUMmFhU3RRN3BhWTQ1Z1hRaGEyT0N3UUVmUW9KdGFD?=
 =?utf-8?B?MG5iNGNGWjhwT0x4c1g2YW85bUh5RW1JR1RXYXVBdnl1SDJTYnczNXU1Nkk0?=
 =?utf-8?B?MStmdXJpY3FoWXkvWmVsbnRiWWhkTXB1NmIvdUhMV1lxcGxNenRmK0cwQkJY?=
 =?utf-8?B?V2c5Q0tyWnIwOERLRTdRQzBaRjBDQmd0UkhEOCtLNjhQMEpta1pIcmRyVXZD?=
 =?utf-8?B?RUMzVkFVa2pMcFZNSm1DQkZyZEFqNkRQbVk5QlBDNXA2WjZVV01oWXlZN29n?=
 =?utf-8?B?bFhydUNtSUcvK0s5MmZPd3JFOWhXbmdaV2tSYUszVkFhMDdlc2VvM2Z0S3RS?=
 =?utf-8?B?WUU5T2xCUmRwNTNkejBST2Jna1pVcjZ6NC95SzJ3K0U0NnBSV3ppWEZ5Rmls?=
 =?utf-8?B?WjZLSjRCYkswb1hCQ2t6RnlYY1FHYm9CaHF6OXJ5SFBEaWdRRTArK0ZKZUty?=
 =?utf-8?B?cEk2K2w1eUp3eFNpeFAxbTJwZlV0cEg4YVFEYkJWVzdReFk5Y0owVEVoek1k?=
 =?utf-8?Q?gBvXxyD87hQQ7wP2YfIA5lyeF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d07ea60-75f5-421a-7718-08ddbf02e584
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 16:08:52.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1DWhScYPYhX4A2ebgWX6mIST5U/Ca+kLNgXn3cwJOo3XXcs0eTwDp7tCSjpf5Zd9N8YnG5qEifUs6OhTDr6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
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

On 7/9/2025 6:05 AM, Samuel Zhang wrote:
> When hibernate with data center dGPUs, huge number of VRAM data will be
> moved to shmem during dev_pm_ops.prepare(). These shmem pages take a lot
> of system memory so that there's no enough free memory for creating the
> hibernation image. This will cause hibernation fail and abort.
> 
> After dev_pm_ops.prepare(), call shrink_all_memory() to force move shmem
> pages to swap disk and reclaim the pages, so that there's enough system
> memory for hibernation image and less pages needed to copy to the image.
> 
> This patch can only flush and free about half shmem pages. It will be
> better to flush and free more pages, even all of shmem pages, so that
> there're less pages to be copied to the hibernation image and the overall
> hibernation time can be reduced.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>

What is your base for this patch?  I wanted to get it tested but I tried 
on top of the latest 6.16-rc as well as linux-next but couldn't apply it 
on either.

I suspect you're missing both 12ffc3b1513ebc1f11ae77d053948504a94a68a6 
and e9cec4487cb789645a8c84b13a9ce54c2d89e3bb in your base.

Could you please rebase on something newer?

> ---
>   kernel/power/hibernate.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index 10a01af63a80..7ae9d9a7aa1d 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -370,6 +370,23 @@ static int create_image(int platform_mode)
>   	return error;
>   }
>   
> +static void shrink_shmem_memory(void)
> +{
> +	struct sysinfo info;
> +	unsigned long nr_shmem_pages, nr_freed_pages;
> +
> +	si_meminfo(&info);
> +	nr_shmem_pages = info.sharedram; /* current page count used for shmem */
> +	/*
> +	 * The intent is to reclaim all shmem pages. Though shrink_all_memory() can
> +	 * only reclaim about half of them, it's enough for creating the hibernation
> +	 * image.
> +	 */
> +	nr_freed_pages = shrink_all_memory(nr_shmem_pages);
> +	pr_debug("requested to reclaim %lu shmem pages, actually freed %lu pages\n",
> +			nr_shmem_pages, nr_freed_pages);
> +}
> +
>   /**
>    * hibernation_snapshot - Quiesce devices and create a hibernation image.
>    * @platform_mode: If set, use platform driver to prepare for the transition.
> @@ -411,6 +428,15 @@ int hibernation_snapshot(int platform_mode)
>   		goto Thaw;
>   	}
>   
> +	/*
> +	 * Device drivers may move lots of data to shmem in dpm_prepare(). The shmem
> +	 * pages will use lots of system memory, causing hibernation image creation
> +	 * fail due to insufficient free memory.
> +	 * This call is to force flush the shmem pages to swap disk and reclaim
> +	 * the system memory so that image creation can succeed.
> +	 */
> +	shrink_shmem_memory();
> +
>   	suspend_console();
>   	pm_restrict_gfp_mask();
>   

