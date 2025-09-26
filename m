Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A08ABA2786
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 07:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2797810E9D6;
	Fri, 26 Sep 2025 05:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f8Myd0Rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB27310E065;
 Fri, 26 Sep 2025 05:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx0ynPKLH4lHiU7Rc5Z46D2op1dKGcnk9KlFkrH+5Pco1g34Fq+lE1t4GVSMGiwP/WJDy72H/xrZp3qsfNiiqyL05Ri9I2EWUL3khtZwGTCXoj2G/cglr4DbyoHbRZDvKC3gMgu0W9R0Itm1NuadGy5GCOUR33DUguqGmI9/ifFHlBJGXGAwPCkxMSLu/eHcDiCxECZVrWeUh00Y0J1lLevD6I4D8DjOot9N6GcaSwc/LsSzEbU9ajaKD8CfAM40KYHYsBTtrsnjFrw0mknKq0Itq2CS6W5gRIrSYC9LTkq1hshr9xkGb1g1qtm4iiLQ0g/+JnP15/c1+owKJjN5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z38cae2i7FrMmxgKqPK1D+7X5vtcLAlfnvY21tH1+LA=;
 b=KIMDDNn5oEeYEpR8pcFFbgndkfb9oFvPicygkqocnTnVpSfGNIxREPzTReqU1Ikr6FLghbW6gWPr8hfLDYD32SWlIy8j8xz5rL/wdTcgbK0mmqhWwC7cL+osEJQjpkE34O+ZCNpF5QDmZYDXNXCA3KPF0iECoSCH6XN2CmQMtrCHLiUfD0Ibz++4P8WileauCWh/Ca3dQdI86qHFsS3sJIF95cml1+Sh4Zh6keVLSqvcYBaEpo2de/W1IIcsokZFYnyVo1U2/uIeRzZu0kcHIEzi9r/lBfIy5BZqWe62Tn3qarAPFtJ52rGXc6imCldleQOA/pTE6Z1+6IA3a8BmVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z38cae2i7FrMmxgKqPK1D+7X5vtcLAlfnvY21tH1+LA=;
 b=f8Myd0Rv1S8LPWWuNxa+Q3WqTdtt1elAdEEO3IPSyDbCBMArP96JoDwZPSAnhESXcmQz4kJ61bAsvIfDjECEgAsBPr/h7vi6j08QTRWN4CuBsM3Yph5M0RS0Ov1SkX4tbHK+8QAQZqNFDai4xtCpOgN9IW/IA4j60CPXUpAXQjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 05:41:36 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 05:41:34 +0000
Message-ID: <ec00b611-f104-40be-8b4d-61efe72798b9@amd.com>
Date: Fri, 26 Sep 2025 11:11:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/buddy: Optimize free block management with RB
 tree
To: christian.koenig@amd.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, jani.nikula@linux.intel.com,
 peterz@infradead.org, samuel.pitoiset@gmail.com, stable@vger.kernel.org
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::33) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f34f102-98ad-46d6-1844-08ddfcbf5a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWpvdGhQdjVna21WUGlFQStRb3M2K1VjMWZyZEc2MVluKzNBRUpCNHl1YmZq?=
 =?utf-8?B?a3Q5UldSRk5nSDU2ZDB0cGw1VHc1MXI1anJBZmp4QWUxMTRYVlpjM2k4Rk1I?=
 =?utf-8?B?ZWxvakR1MjlHSXNWa0RnMkx1MjU0Tm5abVJTYWM4UmE2MHN0TElEL01vRnFJ?=
 =?utf-8?B?akFTanBuVEtHZEE4eEZzOTBZYlB2NXJublZYc3ozODI4azY3Tnhrbk84M2hT?=
 =?utf-8?B?c1ZjbG1uVk1NRjBQbTFZaDJ2bTVKL2JwYXFpZGlIWmdwWjRLdkZtbVZZTG9Y?=
 =?utf-8?B?VVVBa1FqSnFoWlNHVGhWYUVRd2pYNjNFbDQ5ekhCcWJYamtDMmFiYlFvbFhj?=
 =?utf-8?B?SEF4WTU5bGQ3TlBKZDZZODg5VVMvUWJwZHNPTDZGeUZwTkxzaWVidGZJd3JY?=
 =?utf-8?B?S1Y0NUo1Q3dLRTRLd0J3OGViTzZQMXVUS1FVOXl3am5QZDNuMDk3R2dIMDNL?=
 =?utf-8?B?YXdhNlV4MlQ1Vm9YSEI1UHZoN252Qmd3bk5OWWhmeUZka3Y2Z1p5UlJBYmVw?=
 =?utf-8?B?VFBMQkdxV0czTmRMOGY1UStsWFYxbmVBNFM3T2ZCaWJ6VHIzTnlDWm5zUENL?=
 =?utf-8?B?OUcwWVBRNkdjQ21aNGR1UjNwR09TY2srK2EzRkNNNjZYTlhPT3ErYTNyejJ4?=
 =?utf-8?B?KzMrRDhIUTRxLzNCcVRMZUtvdWJDWTdqZ0Y1VVowOHlPZTRwTEpIYXZ5RTlw?=
 =?utf-8?B?V0xBVDQwWHhsNGh6VzRubmEvbTBKTVV6UjhBNWFZcnFicUlGQ21aY1VwdTZm?=
 =?utf-8?B?MXdNeTB4Wjh2ZTBuQU5ieXJqQ3J2S3pBMS9GRE14YU10dlFCay9RVW83a1Fo?=
 =?utf-8?B?NjVSR2N1ZlNvK3RFQzZhaHMwTFZEYndrQldwN0RzSzNacHhTL25Sb1IrMEpV?=
 =?utf-8?B?NjNnNzFRUGhmRGlYNW5Nd0NDYUV2NnVCQm5wdk91ejRjdkNNQ254VWI2YkEr?=
 =?utf-8?B?cmhyWitObFhSeVBwN0tWOVg0eXJJNnJYZHhWS1M2ZHN0U25Zb3dmcU5vZllr?=
 =?utf-8?B?RE5TSG0xMkxrTDhKWmMzemx3Y1dPNnpLZUlNVWhCeTM4VzEyTkRGYU5DVEtM?=
 =?utf-8?B?b1hYVVZFbjZiRVh6QVU0YzVMcUVoK3BXTW5tb1pPY3luRmtkbjVtOU8yaStT?=
 =?utf-8?B?Y2p5L3VTR0ZWc0xvelZpaEZNTjlYYnRjNHBJWUZOUFNXQldnUHplRnVBdzFq?=
 =?utf-8?B?U0oxRUNOVmlUV1Z0cE1MU3hEaFdaOW5tbU5RTlh6dTQ5T2N5eTB1Tm8yV3Z0?=
 =?utf-8?B?Sm1vRGhEZkdhZWt3MFMyMjQwK0tuWGs0ODMzaWVhODJ0VUhmSkhtUGdFZW1F?=
 =?utf-8?B?RFE2RkNnVnBlZ1d1QmlxcUIvY2thYUJQTTN1YmdwWXg2emRmN1JrWlhONGcz?=
 =?utf-8?B?RXNTMnJ2bHBrejBCSVExVDFQdndRY05rbVhpSlRhQndDcVM2dFl3YXpzaUtz?=
 =?utf-8?B?eHpleElJemkvQld0WmZmTWFzWFNFZloxYU1CaXJIeStvcWV1LzF6OHNmNlpp?=
 =?utf-8?B?SW9LZFpDQVRDcnJ0RndVT2RTNjRWOVBjM3pXN2gwUHFsazBGQTVUNmRwbGdo?=
 =?utf-8?B?QU1BNnZxV3ZKQXZRc0JHRVhEaTBnWk0rdVhWSWkyNk5PWG5ZT2NuVktBWW5t?=
 =?utf-8?B?S2RIKzdsdnJZRVo4ajdIb0d2Slpuc0xiOUpiRlR4aXdRQzJlRnR1SFc5RU83?=
 =?utf-8?B?TnUrV3FyQWU4V3B1cVIxOEpsdXQ0Tkg5MU01M1J2aHZ5aEM2NlFnVVhSUWF1?=
 =?utf-8?B?amdzaDgxWG5TY3lIZUJ6Y3ljSTQ4dDFTQjdTRitadFRLZHRKVjJ6RlpLN2R0?=
 =?utf-8?B?QnJwSDl3RmJEbDMrb0xjNENoYkIxSDJMTFJMQ05ka1hmMU9CcXpCVVQ4MEhs?=
 =?utf-8?B?cFUxODdNV3VuTVQ4R0VSVHp3R1Q5Wk1hbnZpak5nZUd3UVZoVGxIYkcvL0kw?=
 =?utf-8?Q?yY/RalOfkZg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTlZZVJTMjZoa1Z2clZXbHcyQUEySjhKcTNISGp4TVhLRk5qNWw3bW10T2p0?=
 =?utf-8?B?QktSRDlTZ0lHVGJSUFpHY0J1eW9GK1c4TTQzV2kxbkplYStWekx0OFhzdThs?=
 =?utf-8?B?eWF4M2crRVdhSE5XQkU0eThFVG1LVlFqYXo4bXhyanJkdFd0OTNOMEhJZWhu?=
 =?utf-8?B?R0ZHc2R4L3c4VXhyNjJSQTVQSDR4WmxydDByRk80ZGNYOHF0TTlrV1JISk5J?=
 =?utf-8?B?akVoc0xpRlg2NGh3czduTHZ0N0xKYy84d3dNK2NwK05KY1J4bE14ZlpZaDJJ?=
 =?utf-8?B?TlFmdmd3Z0xnWkZadTZaVTFQYUswVCtJUTBpZkoyVDI5WHFITm1wcytOWDZn?=
 =?utf-8?B?TzNKRGdVT1VidUdtb0ticFFCL0hiTVhONElJeXcrcG5NLzA5TlliOEFjWmxk?=
 =?utf-8?B?MmMxT2JPeW5peklqdnNFVEFvcC9YQis2dUQrdzhmdzduY1ZBcWFla0F2Z2ZQ?=
 =?utf-8?B?OEJwQmJjTnlHSzZyeHEwSGVFZ05DOHh0N3Q2QSt6RUljYzcrODdtQmxhcC9I?=
 =?utf-8?B?SWk4bkd6UklWSGtMak5yVkxnYm1aM0VNN0lFUmw1RFNsZGh1amZHVXltME9K?=
 =?utf-8?B?SW96QjRmNm5kRng3WUlaeUpYQ0U3S3grVUw1YXZXVHZ0bi9BNFE0RGljKytp?=
 =?utf-8?B?VUNHb1lubVBIeE5wYlNpcnJKT0ZBeldvNFBUeHBqRmFiSUI2OGJmTkNuNDJL?=
 =?utf-8?B?R3JhTXdJS3BOUDE0Y3dub0kxdE9OOE4wVms4elgydE9DYU8zcmcrblRRcU94?=
 =?utf-8?B?WWt6RmsrRCtiUXpuSjZ4M0Z2TE5kdis0OUNWSG9tTU5leDA4U3psS0VvY0ZO?=
 =?utf-8?B?NnBGWjg0RDhET2JqeGVQOEl4dkpMbnhSQU1scm1Za1J2cWhzdSsvSy9mWUd4?=
 =?utf-8?B?MW4zN2pWc2w1cGRwN3lpV2JJUldGMTYzcEF1WmE0OXFSRTFFdFpHQlhiMDFW?=
 =?utf-8?B?WVRoYzJmOFVKUDNYTm14OXVyQ2R6VWUzRTE1dFNvSW1jeS9GbWovQVdZVnd2?=
 =?utf-8?B?VWJhR3FJVCs3ZThmSUYzMzBsNmpDUUdBeGJJQUdVZS9LckIzazNXUnN3eHc5?=
 =?utf-8?B?MXVYYVRaUVE2M2NUTXR0TVZlN3BEbzArcWwreXBMOFIyczRSVVRWS2xBQzNy?=
 =?utf-8?B?QzZGSDJJWUxqdWdFWWV0UXZ0Q0lIcUY5OGg3bmIxWGpxSWhmYVdqVExZNWdS?=
 =?utf-8?B?VTljSzN2M2N3UkttWk0zeWJoL1U2aG5Nb3hCcHBqa3FxZG13dFMwRGpaMWJJ?=
 =?utf-8?B?MmpuTGs3bCtsMG5Ibm9IcU1zdWVsazFicFc2S1FWYWZKOGE5SWJ6eTRHTGJG?=
 =?utf-8?B?SGhpaWhkblhtSndlMzNselozSmxXUDR3Q0JrNlo4eWJlaFFxbGhEdEhGaEly?=
 =?utf-8?B?NlJVbWUvNE14cWJXd2hpd0tVMGE2NWZYTldTbmQvWE5rNVEwQlJWOE14MDdM?=
 =?utf-8?B?K3FJMDE4aDNDQVlTSWJEZUkyVXRRTWlxVm0wRmFXUE91SmNOYzlTTlBYVEti?=
 =?utf-8?B?T3BOODZzUGljamRkU2QvdFZ6T0o2N29ic1RGejB1MDhHb0poLzEwU3ZwWjNL?=
 =?utf-8?B?QXp6YktUOEFTT0k1VjgvbHR2bHNjMkF4azBpZ21WZ0Z2RjZaOXhLVHlhMG5Z?=
 =?utf-8?B?S0xxOXdualp5Z3NJTi9rb2ZrQlF6Ymo4QXF3SDhxMHlYYzBNa2ZnRDRjYlBU?=
 =?utf-8?B?cnZQQ2ZVQjMwOXU0NDFBd2dQa3UxL0lwSUNYdlFRZ0J1MThidk1WdU41TVNs?=
 =?utf-8?B?VWtac3pMT21iMzBwUUFCRVRyb2NoVTZ6ajVrRnZvWjVRVGg3WGorSmk5bVNE?=
 =?utf-8?B?SW9wSGdMM2J1OUk5dkVQTXZFZDFmQmRmbEcwVDRkQkFOZktvTE1xZ2lTL1hV?=
 =?utf-8?B?ZDdQMFdJc0JlUW9YcFpUTXBYU01VcUoyc2tKVUR0L0VoVnJlZ2pwbi9rUVow?=
 =?utf-8?B?Zkl0dERMSS9ZeXFEVzlSNW1iM0hxeGR4VjU4WjZERXV4c0hhZWRhckZRUXh5?=
 =?utf-8?B?UUxaSXhZOThZeXhKOUVVNzg3b2duaW1oc1BMZnNBbUZHYTdNRG1JQmJWNlgw?=
 =?utf-8?B?MGZhanNmUDBkeFhaVU1mL2ZBenlFaDhQL2hGSFk5amNQMjNjcW5sbXMrNm5q?=
 =?utf-8?Q?Zn4pmhPS6YaLN/GiYjlmwEkcE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f34f102-98ad-46d6-1844-08ddfcbf5a46
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 05:41:34.3672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wb6cNXWA5tUHljnJqptJ0miUhJQEvLTnso1h83QWxkSpMsP3m77GuJR641eZiPr8nBYuWAaGytEZNgut6Iyz+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763
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

Hi Matthew,

Ping ?

Regards,
Arun.

On 9/23/2025 2:32 PM, Arunpravin Paneer Selvam wrote:
> Replace the freelist (O(n)) used for free block management with a
> red-black tree, providing more efficient O(log n) search, insert,
> and delete operations. This improves scalability and performance
> when managing large numbers of free blocks per order (e.g., hundreds
> or thousands).
>
> In the VK-CTS memory stress subtest, the buddy manager merges
> fragmented memory and inserts freed blocks into the freelist. Since
> freelist insertion is O(n), this becomes a bottleneck as fragmentation
> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
> with the freelist, compared to just 0.03% with the RB tree
> (rbtree_insert.isra.0), despite performing the same sorted insert.
>
> This also improves performance in heavily fragmented workloads,
> such as games or graphics tests that stress memory.
>
> As the buddy allocator evolves with new features such as clear-page
> tracking, the resulting fragmentation and complexity have grown.
> These RB-tree based design changes are introduced to address that
> growth and ensure the allocator continues to perform efficiently
> under fragmented conditions.
>
> The RB tree implementation with separate clear/dirty trees provides:
> - O(n log n) aggregate complexity for all operations instead of O(n^2)
> - Elimination of soft lockups and system instability
> - Improved code maintainability and clarity
> - Better scalability for large memory systems
> - Predictable performance under fragmentation
>
> v3(Matthew):
>    - Remove RB_EMPTY_NODE check in force_merge function.
>    - Rename rb for loop macros to have less generic names and move to
>      .c file.
>    - Make the rb node rb and link field as union.
>
> v4(Jani Nikula):
>    - The kernel-doc comment should be "/**"
>    - Move all the rbtree macros to rbtree.h and add parens to ensure
>      correct precedence.
>
> v5:
>    - Remove the inline in a .c file (Jani Nikula).
>
> v6(Peter Zijlstra):
>    - Add rb_add() function replacing the existing rbtree_insert() code.
>
> v7:
>    - A full walk iteration in rbtree is slower than the list (Peter Zijlstra).
>    - The existing rbtree_postorder_for_each_entry_safe macro should be used
>      in scenarios where traversal order is not a critical factor (Christian).
>
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 188 ++++++++++++++++++++++--------------
>   include/drm/drm_buddy.h     |  11 ++-
>   2 files changed, 124 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index a94061f373de..67aa67229cc3 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -14,6 +14,8 @@
>   
>   static struct kmem_cache *slab_blocks;
>   
> +#define rbtree_get_free_block(node) rb_entry((node), struct drm_buddy_block, rb)
> +
>   static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>   					       struct drm_buddy_block *parent,
>   					       unsigned int order,
> @@ -31,6 +33,8 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>   	block->header |= order;
>   	block->parent = parent;
>   
> +	RB_CLEAR_NODE(&block->rb);
> +
>   	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>   	return block;
>   }
> @@ -41,23 +45,49 @@ static void drm_block_free(struct drm_buddy *mm,
>   	kmem_cache_free(slab_blocks, block);
>   }
>   
> -static void list_insert_sorted(struct drm_buddy *mm,
> -			       struct drm_buddy_block *block)
> +static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
> +					const struct drm_buddy_block *node)
>   {
> -	struct drm_buddy_block *node;
> -	struct list_head *head;
> +	return drm_buddy_block_offset(block) < drm_buddy_block_offset(node);
> +}
>   
> -	head = &mm->free_list[drm_buddy_block_order(block)];
> -	if (list_empty(head)) {
> -		list_add(&block->link, head);
> -		return;
> -	}
> +static bool rbtree_block_offset_less(struct rb_node *block,
> +				     const struct rb_node *node)
> +{
> +	return drm_buddy_block_offset_less(rbtree_get_free_block(block),
> +					   rbtree_get_free_block(node));
> +}
>   
> -	list_for_each_entry(node, head, link)
> -		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
> -			break;
> +static void rbtree_insert(struct drm_buddy *mm,
> +			  struct drm_buddy_block *block)
> +{
> +	rb_add(&block->rb,
> +	       &mm->free_tree[drm_buddy_block_order(block)],
> +	       rbtree_block_offset_less);
> +}
> +
> +static void rbtree_remove(struct drm_buddy *mm,
> +			  struct drm_buddy_block *block)
> +{
> +	struct rb_root *root;
> +
> +	root = &mm->free_tree[drm_buddy_block_order(block)];
> +	rb_erase(&block->rb, root);
>   
> -	__list_add(&block->link, node->link.prev, &node->link);
> +	RB_CLEAR_NODE(&block->rb);
> +}
> +
> +static struct drm_buddy_block *
> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
> +{
> +	struct rb_node *node = rb_last(&mm->free_tree[order]);
> +
> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> +}
> +
> +static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
> +{
> +	return RB_EMPTY_ROOT(&mm->free_tree[order]);
>   }
>   
>   static void clear_reset(struct drm_buddy_block *block)
> @@ -70,12 +100,13 @@ static void mark_cleared(struct drm_buddy_block *block)
>   	block->header |= DRM_BUDDY_HEADER_CLEAR;
>   }
>   
> -static void mark_allocated(struct drm_buddy_block *block)
> +static void mark_allocated(struct drm_buddy *mm,
> +			   struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_ALLOCATED;
>   
> -	list_del(&block->link);
> +	rbtree_remove(mm, block);
>   }
>   
>   static void mark_free(struct drm_buddy *mm,
> @@ -84,15 +115,16 @@ static void mark_free(struct drm_buddy *mm,
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_FREE;
>   
> -	list_insert_sorted(mm, block);
> +	rbtree_insert(mm, block);
>   }
>   
> -static void mark_split(struct drm_buddy_block *block)
> +static void mark_split(struct drm_buddy *mm,
> +		       struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_SPLIT;
>   
> -	list_del(&block->link);
> +	rbtree_remove(mm, block);
>   }
>   
>   static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> @@ -148,7 +180,7 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>   				mark_cleared(parent);
>   		}
>   
> -		list_del(&buddy->link);
> +		rbtree_remove(mm, buddy);
>   		if (force_merge && drm_buddy_block_is_clear(buddy))
>   			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>   
> @@ -179,13 +211,19 @@ static int __force_merge(struct drm_buddy *mm,
>   		return -EINVAL;
>   
>   	for (i = min_order - 1; i >= 0; i--) {
> -		struct drm_buddy_block *block, *prev;
> +		struct rb_root *root = &mm->free_tree[i];
> +		struct rb_node *iter;
> +
> +		iter = rb_last(root);
>   
> -		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
> -			struct drm_buddy_block *buddy;
> +		while (iter) {
> +			struct drm_buddy_block *block, *buddy;
>   			u64 block_start, block_end;
>   
> -			if (!block->parent)
> +			block = rbtree_get_free_block(iter);
> +			iter = rb_prev(iter);
> +
> +			if (!block || !block->parent)
>   				continue;
>   
>   			block_start = drm_buddy_block_offset(block);
> @@ -201,15 +239,10 @@ static int __force_merge(struct drm_buddy *mm,
>   			WARN_ON(drm_buddy_block_is_clear(block) ==
>   				drm_buddy_block_is_clear(buddy));
>   
> -			/*
> -			 * If the prev block is same as buddy, don't access the
> -			 * block in the next iteration as we would free the
> -			 * buddy block as part of the free function.
> -			 */
> -			if (prev == buddy)
> -				prev = list_prev_entry(prev, link);
> +			if (iter == &buddy->rb)
> +				iter = rb_prev(iter);
>   
> -			list_del(&block->link);
> +			rbtree_remove(mm, block);
>   			if (drm_buddy_block_is_clear(block))
>   				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   
> @@ -258,14 +291,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   
>   	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>   
> -	mm->free_list = kmalloc_array(mm->max_order + 1,
> -				      sizeof(struct list_head),
> +	mm->free_tree = kmalloc_array(mm->max_order + 1,
> +				      sizeof(struct rb_root),
>   				      GFP_KERNEL);
> -	if (!mm->free_list)
> +	if (!mm->free_tree)
>   		return -ENOMEM;
>   
>   	for (i = 0; i <= mm->max_order; ++i)
> -		INIT_LIST_HEAD(&mm->free_list[i]);
> +		mm->free_tree[i] = RB_ROOT;
>   
>   	mm->n_roots = hweight64(size);
>   
> @@ -273,7 +306,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   				  sizeof(struct drm_buddy_block *),
>   				  GFP_KERNEL);
>   	if (!mm->roots)
> -		goto out_free_list;
> +		goto out_free_tree;
>   
>   	offset = 0;
>   	i = 0;
> @@ -312,8 +345,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   	while (i--)
>   		drm_block_free(mm, mm->roots[i]);
>   	kfree(mm->roots);
> -out_free_list:
> -	kfree(mm->free_list);
> +out_free_tree:
> +	kfree(mm->free_tree);
>   	return -ENOMEM;
>   }
>   EXPORT_SYMBOL(drm_buddy_init);
> @@ -323,7 +356,7 @@ EXPORT_SYMBOL(drm_buddy_init);
>    *
>    * @mm: DRM buddy manager to free
>    *
> - * Cleanup memory manager resources and the freelist
> + * Cleanup memory manager resources and the freetree
>    */
>   void drm_buddy_fini(struct drm_buddy *mm)
>   {
> @@ -350,7 +383,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   	WARN_ON(mm->avail != mm->size);
>   
>   	kfree(mm->roots);
> -	kfree(mm->free_list);
> +	kfree(mm->free_tree);
>   }
>   EXPORT_SYMBOL(drm_buddy_fini);
>   
> @@ -383,7 +416,7 @@ static int split_block(struct drm_buddy *mm,
>   		clear_reset(block);
>   	}
>   
> -	mark_split(block);
> +	mark_split(mm, block);
>   
>   	return 0;
>   }
> @@ -412,7 +445,7 @@ EXPORT_SYMBOL(drm_get_buddy);
>    * @is_clear: blocks clear state
>    *
>    * Reset the clear state based on @is_clear value for each block
> - * in the freelist.
> + * in the freetree.
>    */
>   void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>   {
> @@ -431,9 +464,9 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>   	}
>   
>   	for (i = 0; i <= mm->max_order; ++i) {
> -		struct drm_buddy_block *block;
> +		struct drm_buddy_block *block, *tmp;
>   
> -		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
> +		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[i], rb) {
>   			if (is_clear != drm_buddy_block_is_clear(block)) {
>   				if (is_clear) {
>   					mark_cleared(block);
> @@ -639,14 +672,18 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
>   	unsigned int i;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> +		struct rb_node *iter = rb_last(&mm->free_tree[i]);
>   		struct drm_buddy_block *tmp_block;
>   
> -		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
> -			if (block_incompatible(tmp_block, flags))
> -				continue;
> +		while (iter) {
> +			tmp_block = rbtree_get_free_block(iter);
>   
> -			block = tmp_block;
> -			break;
> +			if (!block_incompatible(tmp_block, flags)) {
> +				block = tmp_block;
> +				break;
> +			}
> +
> +			iter = rb_prev(iter);
>   		}
>   
>   		if (!block)
> @@ -667,7 +704,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
>   }
>   
>   static struct drm_buddy_block *
> -alloc_from_freelist(struct drm_buddy *mm,
> +alloc_from_freetree(struct drm_buddy *mm,
>   		    unsigned int order,
>   		    unsigned long flags)
>   {
> @@ -682,14 +719,18 @@ alloc_from_freelist(struct drm_buddy *mm,
>   			tmp = drm_buddy_block_order(block);
>   	} else {
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +			struct rb_node *iter = rb_last(&mm->free_tree[tmp]);
>   			struct drm_buddy_block *tmp_block;
>   
> -			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
> -				if (block_incompatible(tmp_block, flags))
> -					continue;
> +			while (iter) {
> +				tmp_block = rbtree_get_free_block(iter);
>   
> -				block = tmp_block;
> -				break;
> +				if (!block_incompatible(tmp_block, flags)) {
> +					block = tmp_block;
> +					break;
> +				}
> +
> +				iter = rb_prev(iter);
>   			}
>   
>   			if (block)
> @@ -700,10 +741,8 @@ alloc_from_freelist(struct drm_buddy *mm,
>   	if (!block) {
>   		/* Fallback method */
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			if (!list_empty(&mm->free_list[tmp])) {
> -				block = list_last_entry(&mm->free_list[tmp],
> -							struct drm_buddy_block,
> -							link);
> +			if (!rbtree_is_empty(mm, tmp)) {
> +				block = rbtree_last_entry(mm, tmp);
>   				if (block)
>   					break;
>   			}
> @@ -771,7 +810,7 @@ static int __alloc_range(struct drm_buddy *mm,
>   
>   		if (contains(start, end, block_start, block_end)) {
>   			if (drm_buddy_block_is_free(block)) {
> -				mark_allocated(block);
> +				mark_allocated(mm, block);
>   				total_allocated += drm_buddy_block_size(mm, block);
>   				mm->avail -= drm_buddy_block_size(mm, block);
>   				if (drm_buddy_block_is_clear(block))
> @@ -849,8 +888,8 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   {
>   	u64 rhs_offset, lhs_offset, lhs_size, filled;
>   	struct drm_buddy_block *block;
> -	struct list_head *list;
>   	LIST_HEAD(blocks_lhs);
> +	struct rb_node *iter;
>   	unsigned long pages;
>   	unsigned int order;
>   	u64 modify_size;
> @@ -862,11 +901,14 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   	if (order == 0)
>   		return -ENOSPC;
>   
> -	list = &mm->free_list[order];
> -	if (list_empty(list))
> +	if (rbtree_is_empty(mm, order))
>   		return -ENOSPC;
>   
> -	list_for_each_entry_reverse(block, list, link) {
> +	iter = rb_last(&mm->free_tree[order]);
> +
> +	while (iter) {
> +		block = rbtree_get_free_block(iter);
> +
>   		/* Allocate blocks traversing RHS */
>   		rhs_offset = drm_buddy_block_offset(block);
>   		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
> @@ -891,6 +933,8 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   		}
>   		/* Free blocks for the next iteration */
>   		drm_buddy_free_list_internal(mm, blocks);
> +
> +		iter = rb_prev(iter);
>   	}
>   
>   	return -ENOSPC;
> @@ -976,7 +1020,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	list_add(&block->tmp_link, &dfs);
>   	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>   	if (err) {
> -		mark_allocated(block);
> +		mark_allocated(mm, block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
>   		if (drm_buddy_block_is_clear(block))
>   			mm->clear_avail -= drm_buddy_block_size(mm, block);
> @@ -999,8 +1043,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		return  __drm_buddy_alloc_range_bias(mm, start, end,
>   						     order, flags);
>   	else
> -		/* Allocate from freelist */
> -		return alloc_from_freelist(mm, order, flags);
> +		/* Allocate from freetree */
> +		return alloc_from_freetree(mm, order, flags);
>   }
>   
>   /**
> @@ -1017,8 +1061,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>    * alloc_range_bias() called on range limitations, which traverses
>    * the tree and returns the desired block.
>    *
> - * alloc_from_freelist() called when *no* range restrictions
> - * are enforced, which picks the block from the freelist.
> + * alloc_from_freetree() called when *no* range restrictions
> + * are enforced, which picks the block from the freetree.
>    *
>    * Returns:
>    * 0 on success, error code on failure.
> @@ -1120,7 +1164,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			}
>   		} while (1);
>   
> -		mark_allocated(block);
> +		mark_allocated(mm, block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
>   		if (drm_buddy_block_is_clear(block))
>   			mm->clear_avail -= drm_buddy_block_size(mm, block);
> @@ -1201,10 +1245,10 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
>   
>   	for (order = mm->max_order; order >= 0; order--) {
> -		struct drm_buddy_block *block;
> +		struct drm_buddy_block *block, *tmp;
>   		u64 count = 0, free;
>   
> -		list_for_each_entry(block, &mm->free_list[order], link) {
> +		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[order], rb) {
>   			BUG_ON(!drm_buddy_block_is_free(block));
>   			count++;
>   		}
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 513837632b7d..9ee105d4309f 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -10,6 +10,7 @@
>   #include <linux/list.h>
>   #include <linux/slab.h>
>   #include <linux/sched.h>
> +#include <linux/rbtree.h>
>   
>   #include <drm/drm_print.h>
>   
> @@ -53,7 +54,11 @@ struct drm_buddy_block {
>   	 * a list, if so desired. As soon as the block is freed with
>   	 * drm_buddy_free* ownership is given back to the mm.
>   	 */
> -	struct list_head link;
> +	union {
> +		struct rb_node rb;
> +		struct list_head link;
> +	};
> +
>   	struct list_head tmp_link;
>   };
>   
> @@ -68,7 +73,7 @@ struct drm_buddy_block {
>    */
>   struct drm_buddy {
>   	/* Maintain a free list for each order. */
> -	struct list_head *free_list;
> +	struct rb_root *free_tree;
>   
>   	/*
>   	 * Maintain explicit binary tree(s) to track the allocation of the
> @@ -94,7 +99,7 @@ struct drm_buddy {
>   };
>   
>   static inline u64
> -drm_buddy_block_offset(struct drm_buddy_block *block)
> +drm_buddy_block_offset(const struct drm_buddy_block *block)
>   {
>   	return block->header & DRM_BUDDY_HEADER_OFFSET;
>   }
>
> base-commit: 3a9cf301794c1a49d95eeb13119ff490fb5cfe88

