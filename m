Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAJDFYtwfWmzSAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 04:01:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0541C074F
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 04:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D901710E1CF;
	Sat, 31 Jan 2026 03:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rAcNXItA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3173C10E1E4;
 Sat, 31 Jan 2026 03:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtH3ShsN4Su7O6K5cWBsLCxC2d9KwrVqB+joarlzIcVGajZxv3dGuScnGtKC915Jn9Xke5wSfmESReCLgXSXXU/eSXsPeK7EYfywVgIwtY/Lo57Fq2xO24Vyb7rSZQc9VRLwQpg9wJ0JsvWeXfsKCMQ19ttR0HhOYIajkpE7I6EdOP1QIE7C6JITEwZOHqHr6feKeJWiQj6Fc/T9VSE7WchrZRO2LGEJ6B6eS4ifA/G7HIiOwgQRGhlKCR4IheXuOIyNLVD+6BTWq6kbTrTU00xjbQOlW/N8MjZ6XPgrHUhkDqA/ceHRZVYxEXW166IXpJ0tdHb8Fe8aFFP8jPxplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXXgolPotg+N0ILa+3OBCMeuxPWl3FAeZcugG6mexnw=;
 b=Hkm0Frsh+sTLkDWVDq5H6MvC6P/Z18eCYul9BH6Q/OaMJIMoY2Lqo5jLmYV6lhRm1ek/6kkd/q3vqTU7Fb82RuFDTfKJ4Ac6IYJAQmPBa3wMyVsy9Vvup9kF1ceUMM2iT+bfKoOh8zIa3pCeQJuJ7T1xcqSuhR6n3k942PFx+f4RWnkA6Q4DT3bX/rwxR4CMX+mSnA1hKLXxsGoPq85QJQnblkU8jMWxu69742NL900MS1l106x/RBmwKCyVRg9ujCRfUiAFlU77fbV3e/FHzFU8CZSwWcnLRulUGiIH/7rJpY1AowT3cx8NoQPWiiDibimIiDJhHksLuFOxov6F2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXXgolPotg+N0ILa+3OBCMeuxPWl3FAeZcugG6mexnw=;
 b=rAcNXItAZScbEKf+r2cCYcXnxh30vpaLOExxZeL/2jrz7iYX+0ILjOixw3W/nS76aJxBaVyHh9Xdx7I0uZjSKSrOUhes6ABEI4vosf7eFMklmuVegoVH7ZI0FPz1vwCk5dnTSKjfQdixqA3go5H5V30Xsxpw4xb9XLQp3KwnXLQqODz7S/TssRMsnOLa9p3sOdq7qwmelg+rHNrS7qcCWAmiDzOQOUkhQ9MMzCFf0uXQVltaWS/Y7IZvDHw3ZaXmULeb00shGOnSec6IVuukudDFoHhsVXFxBxvxp2loxoIRioBiNevtHvz755BpU1j8cYXGvOwdkWTmi7jslNOWuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 31 Jan
 2026 03:01:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.013; Sat, 31 Jan 2026
 03:01:24 +0000
Message-ID: <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
Date: Fri, 30 Jan 2026 19:01:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
To: Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, linux-mm@kvack.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d1b117-4f0d-4041-fdf5-08de60750504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnZpVG1veXlHUTVSM0RKNWlSSWEzTkZCOGlEZDVTb0c2aFFMWHQxWGxMckJv?=
 =?utf-8?B?TmU2eUJkM2FOUTh6bjZyNzhUdHAzK1gyNVJ4UFZsem45dG9FTmovcWRrdDE3?=
 =?utf-8?B?TC9BbVN1bkUxWkVMSUx0eWJmZUdnNGc3T0dBa2R4SWxEYWJNZzRvdjRvMnNl?=
 =?utf-8?B?U2tzZ1RtK1RiaW1JSFQ1U0Z4SlJGSFR0alRrRnJXSEpMYWt5bXp0SHZJaHgz?=
 =?utf-8?B?Wmp3MEZlZWMyZThDek1UVGFQQzh2d2VpT2RvZFJ1eWtPMUFGdWp2YlR5UVdy?=
 =?utf-8?B?Mjh6RWJuMWR4dW5LZGZ3VHVTZDVnZ0RQMzcrV1Q3eUZrV3Y4ZlhLbyswdmZG?=
 =?utf-8?B?VG9ZSllGRDZGSVp3OTM4UG9ZYnNHQnJsMUM2dHRBWUZVNzR4dDIrK0xBMld0?=
 =?utf-8?B?TFREcjN0cXZuMGU1OVRxS2QvT29lVVBqTXVUTTYxZlVqc1V5UUNob1FzeWts?=
 =?utf-8?B?cHNVbEwrOUJjZmdWVzdrWWFSV2w5dGRGSnhrR2tFYjFucEVZK2Y3STV5dFEy?=
 =?utf-8?B?d0l6eU9YemNjVlFuV0tKOVE1Y29LWVdBZXpUcm9Ca2MvY3pJNXlDOU9qNE9D?=
 =?utf-8?B?elRlNEJaR1RWSHByM0lvbzlsM0xhd0JqR04yMzNaVkZYcEwyZXNLaWxjcUJG?=
 =?utf-8?B?VHVjLzUzNUxlaXBZYWZVZEdYSU5WUXNKVlVNK21YRGI2TFJRd1JQbzdyQjlq?=
 =?utf-8?B?eHVKd2V0Yk9jMnFLS3dzT1REVFBDaTFFM0ZhZEtxS3J0ckJ6Vi9zcHFvWE41?=
 =?utf-8?B?UU0wL3dFbmJ6T1hhc3dRTHNsRXYvc0NLRWloeFhRbG1YNVlZNzRzaGpTeEQ1?=
 =?utf-8?B?Y2xHamxmdSt6akRmTzhOcElnV0JPZWN2WXBSQXpWc1NLdU5sZ29FUUNVLzdR?=
 =?utf-8?B?ZW0wclBpcFdLc2tLeWsreWc2YThVZG1aTmdiMStsakZuOG4zaCs0SjVqRmJ3?=
 =?utf-8?B?TU1BMDc0WXpUVnlTZUI4TVZWRzV4ZVpQRzUwLzVBRFlUYU02akdVN2lVUENj?=
 =?utf-8?B?dlZMK1B4SjFYU3JDd0lCZjIvYjJadkxvSFBqRzNKZnlqdlFrTytjY2xaUTU1?=
 =?utf-8?B?SkVXcUQzZVNRcUQ4THk4allzWGtJNDhHSmZvTzFKdmU1VWNXWHpxR21tZUQ4?=
 =?utf-8?B?MDhLUDJmMEQ4RW1pUEU5dU9Md0E2WFgwTzdIdXBWQ3RrYmVEY21lblBTbWlO?=
 =?utf-8?B?Q3MvOE1YWFpiZEtLUDdNWnBSV1NPN3hrY091TEhUUkdvWW5kVFd5Y0JDdDhk?=
 =?utf-8?B?bFFFSmhmS1VhZVhQaFhiMU5JTmNYV2s2YUtiSUQvSjNoSWlUZE04aDVUZXJU?=
 =?utf-8?B?VEE3djJqaWF6QisyMHV2V3hUTUZHbytlMGFaY1BPUisrclFQOExuWk9VY1Fk?=
 =?utf-8?B?T2thV3pxZU1oSTM4UW5DTHZzNHBLZFJqV05kUFhVSWNId1lXRWxuZWZWUmVQ?=
 =?utf-8?B?c085U0E3MGI5RE1tWjNQS3N1V0lHQ2tjQW1XbmloN1lnYlVwYmRPVHhYRGx2?=
 =?utf-8?B?ckU2bUxrNkoweW54ZjZCOWJWTzdKOVBvc0tBSkRuYWdhU09zSU5NdjZQbW9Z?=
 =?utf-8?B?ODFneWxQSlBNYVY4TUxkT1NUYXlwYnZ3czFFN0szMDJXVjVjQW9lN0wxY0F6?=
 =?utf-8?B?cFJFRzl2UE01K3JBWDZlZW1TQzZTcmRQZ2hBNW5aMnEyd1Jkc3E1QUI3V3RF?=
 =?utf-8?B?ajhnQWpITDRwQjE5RForQWZIUm9OSmxKWnBlWXpIU3pNRWY1L0ZaOHBsVnF2?=
 =?utf-8?B?dUpRNG1IaVpzcUxWNDJwOXVrcklUSW13ZzFpZzQ5ekR5Y2h6WHh3ZmRpdkd5?=
 =?utf-8?B?eGRTZ0dOUG5XdlRPandWS0xnM2x3QXlsckc5TXZQVmRQTFpQS0xlSDV2Nk5R?=
 =?utf-8?B?NmF4dC96M2RpWUw0elVmM3BZOXRvc1QvSXVzbTE5R0ZUNHltQi90bWx0WTht?=
 =?utf-8?B?QlFqVnBYc2FPQXVmeEVZNVpWM05yUVR0djE2WXlCbktxckxoVFc4S0U2KzdQ?=
 =?utf-8?B?SFVZR1VlMXcvRUZBOU95L3RWc3hUTXdSSGRLb1M3VnlDZ0dDUjBqMjROSlpM?=
 =?utf-8?B?d0VORERJeTZhQUZQb21oTnQrc29Gb1I3Z0h0RGQwZWVOYnJJbFdiQjdSNWxi?=
 =?utf-8?Q?RxpU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXJiRzRGUlhXajJRS2JJZ3BJeVFSMTNsSTh0dGs0dDRncENBOS9BM1NvNWVM?=
 =?utf-8?B?VTlFdVNteXZTZlUwaXJmZ2xpK1hBU0J5UlB5VlIyRjZCM3J3ejdSMGF6UEI4?=
 =?utf-8?B?STBMTFpPc2tnZmtVdzMxUHBvKzBqZytIc2VvMGRtdGEzNWpUa3lRejRzd2sz?=
 =?utf-8?B?aWNUZURoc1NVTUZRV2Vkbm9JVVJHK05uU3c5RWFxbjh2WE90bFRMV2JUNmZ0?=
 =?utf-8?B?YVU1eGFGTkFXbEpvTWxiYmR2VkxDYmJLcUtDbWVxZ1dYVXk4dHhxR0dZekNY?=
 =?utf-8?B?ZXdGOXR3YllUdlIvcVBFeFZsLzlXaG5QK1RTSk1zOXkxUk44cTEwWmlnWisx?=
 =?utf-8?B?NGpFSnFyb3Y1ZkJqdldWY1YxMndJa2J1Z0s0Q082T1pMRTNCVXFkZk9QMXIr?=
 =?utf-8?B?RDgwUm0vaGhNYy84OEFLOTJZekNBTEZGbm1Cdlg5VHprY1BSVFZnNGJZT1VZ?=
 =?utf-8?B?VjczTyt1NkRRMEJhTDM2Yk1RYk5kRlJlZDFMUFhmRUYzMDZldVc1TnJqVXdo?=
 =?utf-8?B?OG5oaGRUTjkyeEhkNGh3U3ZsT1ZWTXNhOEE2SytiWjI3Z1U0Vkh5VmY0ZDFv?=
 =?utf-8?B?aHRtUlM5bnRTcE5kSTlnZDRQa3hQdG10dlBMNlFGR2J3WVlkWm1ueUV5S1Qz?=
 =?utf-8?B?clgzSHZUVDduKzZLTjFYTjh3MkgwNTJ2RnVEV1VGcWhLckVZT1c0a3V0UUo5?=
 =?utf-8?B?NW5hLzljSDdhbnNOU2x4WXJ5TDdLWHorMURtbnBZOHBwL1AvQ21zYmlsNnZa?=
 =?utf-8?B?a3RwbHdYMm9HNE5pbW03ZmlDQ3lZQjJvRHorUU5WaFQxU3J1TDlEWmg4VWRS?=
 =?utf-8?B?RjR6cWJqandOdjU1eU5uNFpkVXlUUnZLZGp1enBCbzdIeWliRTBpQ0JhR3B4?=
 =?utf-8?B?cEVRQXhTMk96T2t2b2I5SSt1MVQzWHBuWU5hYTdHcUc5cEVSa3BkUU5ZSklp?=
 =?utf-8?B?anh4WGNNVm42SzZ6ME53NTdrZk9HOGtNNnhBZDZUQlpoK3NkREtnRmMweDBC?=
 =?utf-8?B?YzlQRk5PS0RLZE5vdjN4djdCVmZhZEFLTzVJQ00vcXdoZHRvT3BxYXdaSkRh?=
 =?utf-8?B?RmswUjdwVy8xTWZIL3B3d0JlV04yMW0waFJ5WlBjY3VNOS9xa0dycTJiSnJR?=
 =?utf-8?B?YXIvWWJMeUNaNDIrMzVjb3dUUnZNMEhjWGlxMi83SkhrVmZIUjV2aDk3OHkr?=
 =?utf-8?B?UUtsVHRGR3BzNHpiOHQ4M0NnWDlJNUtxNTNQbktNQkpxOGFTS01SdVNQMURU?=
 =?utf-8?B?SzdGMlBGRTNDd3RJYVVTNG5ZSXVkV3dNZWFsMExUTitya0IrWGQ4R0JwUjY4?=
 =?utf-8?B?YXpwZzE5ZGZKREhPcUQzY3FGM3ZZeW1Nb1dHTVdDbmhTZGJIRTFtcHdzcmt5?=
 =?utf-8?B?Uy8zTFZsUUpINEx5YldoYVhLemFtbVVVaHNMamlUT0I4bitESW1Cb2owWXYy?=
 =?utf-8?B?OE5xelFyWFBTOVc5UkRqY2pUMEVPckF0VDFrdHJiOXQ3U3BXM0NEdktUZnhr?=
 =?utf-8?B?Ty9pZWliMGdiN1JFd0MwYjlScmdrSXUxZzMzK05sVk1keHFBRGFYWDRibThI?=
 =?utf-8?B?V1NHZGxUMzkweEM0SzJkdHFHK2cvZnI4cjhhOTVjQ2xRVEJpajh0L1pvV2VM?=
 =?utf-8?B?Y2hQQ3JDdXd1M0FKa2NkbU03aHl5OUpxdHQzdytYNUVibFRwLzM5V25rekl1?=
 =?utf-8?B?V2F6SlZlT1hGSWllMEd1bVo1NUd0RFB4T3JSSjRKZlhtZEsxWEp0TldvUkR4?=
 =?utf-8?B?cnNHR2NqZEFVVThnOGUxRWc5ZVpyQVRGQ0JiaStxVXZmNzQ0dGhhbUIrUmdr?=
 =?utf-8?B?Mm9rdjZSWEp5ZEdkWWU1SDNsSVBxVzV3UHlQaEd1VzdUT2o0Y3dKSm51V1pU?=
 =?utf-8?B?aTNRQm1ZR3pxMmVRVGx4NTRRakJDeWMzME9VM1ovcUNoWFJxQjloVGNzcTEv?=
 =?utf-8?B?MHBLcHpLdUdFVHRadXJnbkJjVkV3ZE5Nc3Jad0UzUGc4dEdXNGpJTFc2b0Vp?=
 =?utf-8?B?Y2xiUCtqbjRmL0pDL1d1MzBranc5WGVYd2Nxa2ZqeWJjbCt6NjNOTkcxd1dQ?=
 =?utf-8?B?cXRhVUlIY2RlTXJnaHFERm41OG94THY0YmJrd0lxbE9WajM1TlJxQlZnRjJo?=
 =?utf-8?B?dGNWQ2djYm5xeXNrTkcvT1hmbHRkV2k0TTQwZDVDMWJ1ZjAvVERMcUhrRS9T?=
 =?utf-8?B?U3hMYUJQZU5Xa0VMTEI5c1FpWjZBaWZhZDE4MUgzeTBPWkZXUlBpV0pvZDZL?=
 =?utf-8?B?aXFKZkc1V0x0dUlmc29Va2prbXRkYVhjbHZpeVZsMktmTFJ5S1lvbFdSanRC?=
 =?utf-8?B?dHVNODBQVFhsYUtyeld6Wk9kSUVOZjhhOGUvdnhXVktSb1JuVWhEUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d1b117-4f0d-4041-fdf5-08de60750504
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 03:01:24.6303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdQVve67o7fuuFzUe7S7XKTJ8gM2DMFx58AxYj2CFElF2ADXLin1cazAfusUSOUCMxC6M+Ez3nvWEr0EO29rMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: C0541C074F
X-Rspamd-Action: no action

On 1/30/26 10:00 AM, Andrew Morton wrote:
> On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
...
>> This can happen, for example if the process holding the
>> device-private folio lock is stuck in
>>    migrate_device_unmap()->lru_add_drain_all()
>> The lru_add_drain_all() function requires a short work-item
>> to be run on all online cpus to complete.
> 
> This is pretty bad behavior from lru_add_drain_all().

Yes. And also, by code inspection, it seems like other folio_batch
items (I was going to say pagevecs, heh) can leak in after calling
lru_add_drain_all(), making things even worse.

Maybe we really should be calling lru_cache_disable/enable()
pairs for migration, even though it looks heavier weight.

This diff would address both points, and maybe fix Matthew's issue,
although I haven't done much real testing on it other than a quick
run of run_vmtests.sh:

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..3c55a766dd33 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -570,7 +570,6 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 	struct folio *fault_folio = fault_page ?
 		page_folio(fault_page) : NULL;
 	unsigned long i, restore = 0;
-	bool allow_drain = true;
 	unsigned long unmapped = 0;
 
 	lru_add_drain();
@@ -595,12 +594,6 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 		/* ZONE_DEVICE folios are not on LRU */
 		if (!folio_is_zone_device(folio)) {
-			if (!folio_test_lru(folio) && allow_drain) {
-				/* Drain CPU's lru cache */
-				lru_add_drain_all();
-				allow_drain = false;
-			}
-
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
@@ -759,11 +752,15 @@ int migrate_vma_setup(struct migrate_vma *args)
 	args->cpages = 0;
 	args->npages = 0;
 
+	lru_cache_disable();
+
 	migrate_vma_collect(args);
 
 	if (args->cpages)
 		migrate_vma_unmap(args);
 
+	lru_cache_enable();
+
 	/*
 	 * At this point pages are locked and unmapped, and thus they have
 	 * stable content and can safely be copied to destination memory that
@@ -1395,6 +1392,8 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 {
 	unsigned long i, j, pfn;
 
+	lru_cache_disable();
+
 	for (pfn = start, i = 0; i < npages; pfn++, i++) {
 		struct page *page = pfn_to_page(pfn);
 		struct folio *folio = page_folio(page);
@@ -1413,6 +1412,8 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
+	lru_cache_enable();
+
 	return 0;
 }
 EXPORT_SYMBOL(migrate_device_range);
@@ -1429,6 +1430,8 @@ int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 {
 	unsigned long i, j;
 
+	lru_cache_disable();
+
 	for (i = 0; i < npages; i++) {
 		struct page *page = pfn_to_page(src_pfns[i]);
 		struct folio *folio = page_folio(page);
@@ -1446,6 +1449,8 @@ int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
+	lru_cache_enable();
+
 	return 0;
 }
 EXPORT_SYMBOL(migrate_device_pfns);




thanks,
-- 
John Hubbard

