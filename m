Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9490A16C25
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 13:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A525510E10D;
	Mon, 20 Jan 2025 12:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PRNnkbK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B6110E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 12:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFj+jNarWaZieliOmBcPiW2SZoJsWuSEK2OZOWmRlphuOY6oOPKLzyxSmQQj2IlOwiSzHlRXlvMLCqbUMR29YeskdQbNtIX3cAP1Xki4NVywGEPIrZkM03gtE2tiCBj6yfhiBXsjV05kDm3DCnoHmfqlDZQxJ6AJuecuNVzFNCV9UmQIQ0n+B0l+feJrFdh2r9lTUQk+YQ6lQt235fWxI0WeNsFnCLUou7ee+8FJbOg/SfV8ytw8PZnVxbptKC3IrlcClYCQUynJVtFuPDCqrabDAbkveLrdBxrRzI4wznY+mOKoPeNjsVZwfn1fz9JTUc8kKoxvhVM26Hx+wtnowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmIGCcCxV+InFu8lURi95xI1fXXLJQsB6Yaw1WuvoDo=;
 b=C+7L7OARr6XPG/Hg7BpmuOGeMKfS3NFKql0iLx5R9MSrANZaj5/nHE1PyaKXp6U8PZjZbx6dUZHekdUwGLB1yMk2/u1zbjsfg2sAOAE8O9m/MXJC5n9VpqwiW+n0r//HNAgzHYtHWrVUyoboS3r8OmDFSOhxaaZyu/zvL5ROSolSjd+YlXBqiC9kCtbTwueMIfwjjM3dB36v4n80hCldXLfVCSFEkYChzO+62ghohvTowRDoA3+9ml7QoAjCH7fw2HF2PDCP3kz6jWZQjqwSVx0ZOGymKtGJkhnDQ41klevp7yGbZGvh3AduRjqZ5c3kFA4ngkNks+G+ci4o8b5i2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmIGCcCxV+InFu8lURi95xI1fXXLJQsB6Yaw1WuvoDo=;
 b=PRNnkbK2iejoh8WzojUIZhuUotvgEtQPSlzaKLCAjC2+Dwb35Gmq5WNUHdSZCFFUG4Lz4baDdHluaKgZB8rZYVxOnj+IYkxouYCaJ1+wxno5dREE4KHxRPtXKcD78DuqYxlUXAT9UwoaEFd+6rblPYES5NNwWspcRGg187F3/+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7939.namprd12.prod.outlook.com (2603:10b6:510:278::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 12:14:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 12:14:20 +0000
Message-ID: <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
Date: Mon, 20 Jan 2025 13:14:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local> <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local> <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d39f5df-542e-4ef6-caf9-08dd394bf7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG1FVFZYbGtRMy92UmEwQm1kMW1NZzZtNVhBUEZDTFZ5MXpvWkR5M3RKbWVF?=
 =?utf-8?B?SEw1UE1sRU9IU3RnMXdBNFd4MU5LU2ZFaGVYQWV4a2FjbFBNNEtlYXdjQlNP?=
 =?utf-8?B?MFNTcWltVy9LSzg5YW1EZ08vUVdhVWVJZENXQUJFS3pBRVhEQ0t2dkRFejVT?=
 =?utf-8?B?bXdRK2QyQTlxSVdncU9uL04xTVlTUGpvVjFQdnFvQWlyNHpZQUE0UUFUODMv?=
 =?utf-8?B?cUplNFJXMkhRZ1l3K2tFdytOWVdRck15djk3VzZQSWVzQXZ4M2NmWk9WaGxq?=
 =?utf-8?B?MFdqOElvbVA3ZjBrakhUY2FpZ1Zvbk50M1RuZHpYLzZ5WGZoa01sb1dFcEZ0?=
 =?utf-8?B?aklEa2RmcVRRczJzUmVnVUdrWDR2ZGovc24xNFgyZGxicWRUTlM2dEw2Zlhh?=
 =?utf-8?B?TFdzSWpnS1V4SXU4MHpvaDByaFVnY3BDZ1N5eFpINGVyQ21acU9xVGJrN2lV?=
 =?utf-8?B?TXhFZE1YZHNQQVI1ck1maExhQjhDMVJkMTcyU2hxU2hCc3Y4Q0E0b1NrKzF5?=
 =?utf-8?B?ckwweWZkNGJnL1dEKzFjc3lOaWZHT1F6Z25TNytGMC85dGNTaGFpeU1VM2pW?=
 =?utf-8?B?NWhyeXFUOVFjYW1mQ3RzN0RYaGFyc29pZjZGblJ5ZEZ5SkxwbWJ0VHBwckx2?=
 =?utf-8?B?K0ZTOWZWdm02d0Q0dTRveElxWEgwbWwxMGUrcEtFMkNreW1INE5aTFRraW9s?=
 =?utf-8?B?NGF3cXBrbTFUWUthcjNLUnIvNVJqdDZFTlJQTHNvdk8zZE5vSmd6eGpmMGZO?=
 =?utf-8?B?M0NkVWxUd0tCS0Vlam9BQXBma0poK0JLVnpNWVA1Z3U1LzR3V1AwQXdMOGMy?=
 =?utf-8?B?YWlJZHdZaTFEWVRCWi9VQk1PR3pEV1ZKTTNFVEg2QkNoenhESTFod0g2TU9T?=
 =?utf-8?B?TldpZGR3dWJxaitWOFBiWW1GWFk2VzNMU2d1a2J6a2ZiQ2dWcUl3ZENoSUIx?=
 =?utf-8?B?Rjh4NlhwN0ppY3NmcWE3eDVHZC9ZOTRlWTRHNk1CcjdFcHVwWFZLY3BXaFB4?=
 =?utf-8?B?OG5lQVIvRWlFMk1kaWMweUFjb0E3WEp2VmNIR0NWTG1MVWFwaGRJcm5tanZR?=
 =?utf-8?B?UGlZbTg1UWZFMUlvOGpCLzJ4c2RxbHdQTnNqNnllamx6SGNtZy9lbEZsY1ZN?=
 =?utf-8?B?cWkrbFNYRGFBWFZWbFY0U3h3VWw5WHp0c2RjOUw1VWhneGwxUWdqMTlGVlQ2?=
 =?utf-8?B?eTlneHFLQkFKRVdtN2RVNWZMNDlOYnBrdGQ2WTcyaGlQWHRJRFU4MUtmRlhW?=
 =?utf-8?B?bmhQT2hINDJLbUFmSFlSWTFiZkxRUm5qZmlldzJHeXE2L2hMckd1cTExR0JI?=
 =?utf-8?B?bmNjS0V3Nld3Z0huOE9FMzBSSERMQjdvYTRtSUdxMGluWCtab3ZYaXVhTTJz?=
 =?utf-8?B?cm80TnRDbzRPakpFRnJDSU15WVJqN2paeGg4STRkcFlHQm1GY3NseGVUc1c0?=
 =?utf-8?B?R2RmZUlnZVRmeVYwSHRPN3JzcXgrd3RlZW94dEloRGxQYlBXYkJ4YUttb0VG?=
 =?utf-8?B?UkZRNDloaW1EUnE1OTg2UXZvS3M4czNyRit5M1lMYXJkbDFCZWppdXk3T080?=
 =?utf-8?B?TnN2T2gwWEwxWFMzSy84a2JMWFEzS2kyVncxdko3a2I2MXhUTCtCTjFYK09p?=
 =?utf-8?B?ZUFsZTdkVFhYSWxIYm1qcXExbkV0UWNHcVZUM2l3MEphdkVhRWVHZWRzem9q?=
 =?utf-8?B?UTh6NzQvanlKQ2NjaURTSFJWSmp3VXZXUlA2WWhyeWlwSHo0akZqdCtRREhX?=
 =?utf-8?B?NUd1Qmx2SzVkYllXd2xrVFh1ZXZQZThzRUs3L3RLbDNuNnNteHpPRjhxaW1H?=
 =?utf-8?B?Q0h6NmRrVEpoVUZsUFVTZVJsYVNJUFpIRnBoY25GSnRKS25Oc3dySnA5bkdq?=
 =?utf-8?B?TDlkV3VybkhHMk12YitVeGNNMFlHNkFiZ0Zva3pMb0ozS1NnVkNnei9YcjZj?=
 =?utf-8?Q?77K7bp9bG2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHkxYWQrVW9mUnAxQjNkUTJNb0tzRmMvQWtaYStiVjNBZG81VWNTSDM0eko1?=
 =?utf-8?B?bXFtM21DOW1yNGM3MGMxTXJIVEs3dHFxY1EyZWVtY0ppK3ZCTnBpOHV5QUJN?=
 =?utf-8?B?OFFwL0RjQ0IwSklBNWRINkd5WDdLWnIzQy9YclByL25CRHY2RmlqS0J0Z1RI?=
 =?utf-8?B?ak9UaHA4NUR0bzFFYkFGdWxDV0pyYWQ2cXR4dmhPR0VQbC95UkY1Z2dvMkFP?=
 =?utf-8?B?Mk9UVlA1QS9XUXlZSmxlUkZtUU1TQ1FsMmgxMlExNEZrMVdMcG1FVnY4NHRl?=
 =?utf-8?B?Snhjd2RTcXY1ek5MY3RqRWdnMHhzeEJ1R2hyVHlmUnJQaWh2ajNpS3NOeW1t?=
 =?utf-8?B?ZlAvQ2EzYU9DNU1xWUJYSzA5OHR0VnAzTjF4R0ErVVB2Tm9tR29OQ1RIbFB3?=
 =?utf-8?B?QkFadEFuNGQvWTU2NmVCbU1Yb0FnRzRkU0EvZVZPSGRQREZaUWdPR0JuMmN3?=
 =?utf-8?B?S2tGQTU2SitmMDZBMm1BSFRwc0J4NVptOFVEYklqY3k4dFRqL2FvZVBQUlVk?=
 =?utf-8?B?U1FpcTNxRGVrYVRQSUVKV2RZMVA5TC9uTENjRWk5ZVh2cCt3b3IwNlVSRjFI?=
 =?utf-8?B?Ym5tUVN4VzFiNjc0VkVncFk0QVdiZzA1S1dEOHZNd29FRnlEYU0yeTByOWdz?=
 =?utf-8?B?NnN6T0tJb0tUcy9zZk9uc2pmV1RqT09tTUNrZTdHZ3MzZmhkR3RTaTNwcm5a?=
 =?utf-8?B?enBETktUK2hIUkIxRHphMzB0OXJpWGpRenBKZ1p1VWNBckZtcitVRU85dW9I?=
 =?utf-8?B?OUNhTkh1Nk93eXllWG0wcDMvQ0toYVF6NWhhc2tXaXFyZ1Z5U2Y3Q2pTc0xT?=
 =?utf-8?B?c1hUNmJFVU5oMUdVNmZUaFFsdjJoWTRrNDlIcngwMmRjN01RWUNnbUlvTnFl?=
 =?utf-8?B?SjNPZ0FLU0xuRnlwMGsyN1Rycy9iV3o3WmNaUU1rVDVZelJnYTlwTE1lcGxs?=
 =?utf-8?B?VlcybU1TOG44Rk92ellFaG9uRXJrck9ZTjZpWlFRT3FVMDI3WGFUU2I1ay9W?=
 =?utf-8?B?bkZRMFBiMVVRUW4zRCtEYmN1OWFVVUFvM1ZQOUhZWkVXWFJ3c1RIOVpQVm5h?=
 =?utf-8?B?K3lXekZCZVlzb1FBYUdjZi8zM0VnU1BpVXlqZFM0QndEVWZDNjJxNElYRWtJ?=
 =?utf-8?B?dzJLZlRSZUtpK09ELzRuMDVUdmpTWklqSHZpN3hJeDZrNzJqTjNPRkYyU2R4?=
 =?utf-8?B?bHpCMzRVYmZOeE9jZktLRGYyUnIrdzBPRmhvWWlqcmVrZkJmbWhQQmdTL3lu?=
 =?utf-8?B?a09FSS9SMjNWcnBhcE1jTUpJWVFmWTBqRmNwc2h1YTArcVgvWkN1Mi9obUtT?=
 =?utf-8?B?S3BpaVZTWUJnaFFVL1lyRGpZSHY3ZkhkeDZ5M044RFo4T05KdmJvS0x2OWV2?=
 =?utf-8?B?M3dkalhDTjhHblZ0NU4vaVVza3JXemoreW5TMVI1S2hCLzdONXA5NStoVDdK?=
 =?utf-8?B?VWhuVHdNQWxNRmRQUDNUNEJEcTh4bjRaanFieUFwa2JGZHFpUFlwOGlneU1D?=
 =?utf-8?B?UFhjdnhxblBUNjBCRWcxVmxxN3pObVZ4am52TnVUK2RIR2RGcFBsYWFSMytl?=
 =?utf-8?B?cVVsODhVQmFNOXFEbzIrZXpJRGhRTzB4YXkxVTBLSElpKy9YS01ud0dpK0pH?=
 =?utf-8?B?R0FzM0t5YVF1d2ZoazhkQ1ZYdnQxaVJjS3ZTdzl6QXNOWldIeFpJRWRZdkx2?=
 =?utf-8?B?dGxBYWJrZkdjTS9tN0ZQUU92Y2xIbDY1QVFJODhGR1NidzdTUW1nNWRxUGx3?=
 =?utf-8?B?emVSWW5aczQ2WjM2V3dRejV1UmpnN0lzck1WRGMzQ2pkR05FR3JuTkhubGlQ?=
 =?utf-8?B?a0dBRXJTN214a0FOV2QwMi9kYjZCS2tpdXdLM21MTE5HbWxRRGJpVEhpSjM1?=
 =?utf-8?B?bng3L2FpeFI0b2w4bld2VE40S1RrNGI4R1RKMVJxRVNxN1R1UWZ3a3hEQzZi?=
 =?utf-8?B?dHNLN0xrU1ljbTNiZHBSMFo3NmZOSmgxRGFod29hSmNJZlZQYUpxMDU0Qkxp?=
 =?utf-8?B?ZitKVHdGU25rcVRpUVRTVUdWRGdqRjRGK2FTd29BWWQ1VXg0eXNlZ0FvdURi?=
 =?utf-8?B?TnF3TlY0Vis1Z2loejdaUFFBemhZODRqWE1RRkxBR3VJbHBPMS9ZYlFPTW9n?=
 =?utf-8?Q?ilSMAZ69PU9GTZ8aEIlURhAts?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d39f5df-542e-4ef6-caf9-08dd394bf7cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 12:14:20.1430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCg5MDHSaLmhNtSb7zdMWB6acTN50eINlgukuXhnMc1x+h7PrIFU2Vlwjaarv4zS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7939
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

Am 17.01.25 um 15:42 schrieb Simona Vetter:
> On Wed, Jan 15, 2025 at 11:06:53AM +0100, Christian König wrote:
>> [SNIP]
>>> Anything missing?
>> Well as far as I can see this use case is not a good fit for the DMA-buf
>> interfaces in the first place. DMA-buf deals with devices and buffer
>> exchange.
>>
>> What's necessary here instead is to give an importing VM full access on some
>> memory for their specific use case.
>>
>> That full access includes CPU and DMA mappings, modifying caching
>> attributes, potentially setting encryption keys for specific ranges etc....
>> etc...
>>
>> In other words we have a lot of things the importer here should be able to
>> do which we don't want most of the DMA-buf importers to do.
> This proposal isn't about forcing existing exporters to allow importers to
> do new stuff. That stays as-is, because it would break things.
>
> It's about adding yet another interface to get at the underlying data, and
> we have tons of those already. The only difference is that if we don't
> butcher the design, we'll be able to implement all the existing dma-buf
> interfaces on top of this new pfn interface, for some neat maximal
> compatibility.

That sounds like you missed my concern.

When an exporter and an importer agree that they want to exchange PFNs 
instead of DMA addresses then that is perfectly fine.

The problems start when you define the semantics how those PFNs, DMA 
address, private bus addresses, whatever is echanged different to what 
we have documented for DMA-buf.

This semantics is very well defined for DMA-buf now, because that is 
really important or otherwise things usually seem to work under testing 
(e.g. without memory pressure) and then totally fall apart in production 
environments.

In other words we have defined what lock you need to hold when calling 
functions, what a DMA fence is, when exchanged addresses are valid etc...

> But fundamentally there's never been an expectation that you can take any
> arbitrary dma-buf and pass it any arbitrary importer, and that is must
> work. The fundamental promise is that if it _does_ work, then
> - it's zero copy
> - and fast, or as fast as we can make it
>
> I don't see this any different than all the much more specific prposals
> and existing code, where a subset of importers/exporters have special
> rules so that e.g. gpu interconnect or vfio uuid based sharing works.
> pfn-based sharing is just yet another flavor that exists to get the max
> amount of speed out of interconnects.

Please take another look at what is proposed here. The function is 
called dma_buf_get_pfn_*unlocked* !

This is not following DMA-buf semantics for exchanging addresses and 
keeping them valid, but rather something more like userptrs.

Inserting PFNs into CPU (or probably also IOMMU) page tables have a 
different semantics than what DMA-buf usually does, because as soon as 
the address is written into the page table it is made public. So you 
need some kind of mechanism to make sure that this addr you made public 
stays valid as long as it is public.

The usual I/O operation we encapsulate with DMA-fences have a 
fundamentally different semantics because we have the lock which 
enforces that stuff stays valid and then have a DMA-fence which notes 
how long the stuff needs to stay valid for an operation to complete.

Regards,
Christian.

>
> Cheers, Sima
>
>> The semantics for things like pin vs revocable vs dynamic/moveable seems
>> similar, but that's basically it.
>>
>> As far as I know the TEE subsystem also represents their allocations as file
>> descriptors. If I'm not completely mistaken this use case most likely fit's
>> better there.
>>
>>> I feel like this is small enough that m-l archives is good enough. For
>>> some of the bigger projects we do in graphics we sometimes create entries
>>> in our kerneldoc with wip design consensus and things like that. But
>>> feels like overkill here.
>>>
>>>> My general desire is to move all of RDMA's MR process away from
>>>> scatterlist and work using only the new DMA API. This will save *huge*
>>>> amounts of memory in common workloads and be the basis for non-struct
>>>> page DMA support, including P2P.
>>> Yeah a more memory efficient structure than the scatterlist would be
>>> really nice. That would even benefit the very special dma-buf exporters
>>> where you cannot get a pfn and only the dma_addr_t, altough most of those
>>> (all maybe even?) have contig buffers, so your scatterlist has only one
>>> entry. But it would definitely be nice from a design pov.
>> Completely agree on that part.
>>
>> Scatterlist have a some design flaws, especially mixing the input and out
>> parameters of the DMA API into the same structure.
>>
>> Additional to that DMA addresses are basically missing which bus they belong
>> to and details how the access should be made (e.g. snoop vs no-snoop
>> etc...).
>>
>>> Aside: A way to more efficiently create compressed scatterlists would be
>>> neat too, because a lot of drivers hand-roll that and it's a bit brittle
>>> and kinda silly to duplicate. With compressed I mean just a single entry
>>> for a contig range, in practice thanks to huge pages/folios and allocators
>>> trying to hand out contig ranges if there's plenty of memory that saves a
>>> lot of memory too. But currently it's a bit a pain to construct these
>>> efficiently, mostly it's just a two-pass approach and then trying to free
>>> surplus memory or krealloc to fit. Also I don't have good ideas here, but
>>> dma-api folks might have some from looking at too many things that create
>>> scatterlists.
>> I mailed with Christoph about that a while back as well and we both agreed
>> that it would probably be a good idea to start defining a data structure to
>> better encapsulate DMA addresses.
>>
>> It's just that nobody had time for that yet and/or I wasn't looped in in the
>> final discussion about it.
>>
>> Regards,
>> Christian.
>>
>>> -Sima

