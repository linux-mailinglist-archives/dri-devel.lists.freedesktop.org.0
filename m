Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C4DAA4F00
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831D710E2D5;
	Wed, 30 Apr 2025 14:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DPAsUiIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1C910E2D5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 14:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEpOCeJdPcj/iLjf4vefLd3lbpXqY2M0pA6BYDONbjmwhWZ3MoAWlIfpK2ZGladSYw/gneMAOnfh6s5vXYzkTveqhP/TOrKXcthMkWeLS8En+S8ig5P3n5n5N35PhUajifULvLe5+7xEJZazkGk/ka+7pmsxBQ1ZasLkA0iA+SiSbjx4wfECG+44dZzLGl/Xv9dypeKsEI2Slrv2RL/S5YnVeoUmt5Kd9oevhalq1wTc+CD5mjMaCihSzzzKzR4LLNhgwkRKuPDhCGGEkNHlVetnIfc794w/Tu1W9MCRkWhQuoj3XegVDPnjbH5Zb1D1xgclwCdnUHwvoUWAUH+APw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y9yKD+mk626hD4vYHZo1DXaucWJYuZLYnn57YesJPY=;
 b=fDDMmk2xDQFr1rDTIzy3ZpB5aCbbuKu87eftw1oR91ed0n6LqKjqijlF+ZAtytnuxTH2+E74hZC+fmtos0z+361fQzuJ5k/EhX0vkMzPQfUAEAlopSqhN53vOoeVLt1RhTUuBfZ/KPdMj7q8N30TUIYxXAXdnsskRBPVIc9axHb3vXlND8gYdRAvTG5/B6w2AdpoJJBRX6MZmgd4z0n10AlmRKWZpR4NOKncyniBmWls/N/yIWHGlFQRV9BWeEr24J2OubKBAJ/SiI1GY7cfSi1g1yg4AvIkEgeKjiATot6bKgY2zgvJRxUC7hQvi0/30mBX62b9zx+94MAEgXXVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y9yKD+mk626hD4vYHZo1DXaucWJYuZLYnn57YesJPY=;
 b=DPAsUiIwfPxT7TRy6eaevPdwGr3et20amttN1CLSv6+LGsD/lJcWww3hmzfusE8V/etqjr5oDiDon9ZacOHzB5YLDL4GnCXLzUOvz/+nsTpHtU+BAw/f8HLto/RVRhosrNHxfYpkZbZkQ1uBBqX1M8hYKppL5QoLmz5KsgileOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 14:48:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 14:48:23 +0000
Message-ID: <ef261695-79fa-4c0e-9894-6fe19de823bb@amd.com>
Date: Wed, 30 Apr 2025 16:48:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
To: oushixiong <oushixiong1025@163.com>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250430085658.540746-1-oushixiong1025@163.com>
 <20250430085658.540746-2-oushixiong1025@163.com>
 <daaf1445-f0b8-490a-b87b-dab219f13571@amd.com>
 <c93177d7-be53-4f37-96d4-d09323737581@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c93177d7-be53-4f37-96d4-d09323737581@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a956af-f23c-4cb6-d664-08dd87f60e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHUwVFhrdWRBczhOK0xzS2hQNFJiWEkyNnJ4RFF5UnBWejFUSVRMZWVLbFcy?=
 =?utf-8?B?NFdpTVpwMWFFNXlZbm5zbXhYVzVoNE4wK1RUcXVXeXBlSVVWMlR4dFNTdm44?=
 =?utf-8?B?NCtMVnEvclNXNTY2dnlaQnpzSWVvd0VPWFgxSzRJcnNHR2xEZUdUZ1hTVk9O?=
 =?utf-8?B?a2pKWWNDVTJlcVRXL3pWaHlFUDdMNkxjc3d0K1JTcllPKzY0YkRTOW5rQzBT?=
 =?utf-8?B?TkJSRzFBaHhFWnE4d2JOVFltRHYwaGpBUnVPUXQ0aGl5QjdKVUwvaVVaaHJn?=
 =?utf-8?B?eFZKVjR1V0sxbHRTWjBOd2I2OGN0VjdSdkxMWFJ0d3VYZVVJb01LUzVDZlh6?=
 =?utf-8?B?YjVaeTU2ZlFlSHlha0FZeEh3dnEvSDVKeWdEbWhSS0FMRk1aajhsY2kzWTdt?=
 =?utf-8?B?YlQrT0tSN2JKSzZOSDlYZlczNXJNWStEQ25uMW5kbTh4WWMzTDN0OG5oNVZa?=
 =?utf-8?B?U2RpZVJHSEswa2VGSGJVbU9TRTR6VXlxRUhxNWQ0Sy95UUxVTzZ4TytGSThh?=
 =?utf-8?B?QmJhS2YyUEJwYUNwMUxmTm5MczlDMEdOajVJQytoTFVTT2Y4OTR6U01GNDRw?=
 =?utf-8?B?VDc0a29oZnZHSDIrcVpIN0dGckYwdzlhTlh5UzlnTkhqZ3pOWVVZS0xWaEJv?=
 =?utf-8?B?Nkgxa1hlWGVVU1AyN2lHZ0Y1bkVkNG9PV2hXR1lnUmVwbWRzQkNlaWMyNE44?=
 =?utf-8?B?YlpUYStFL05laG9OVzQrVzRvL2diSkRPVXRqNHdhL2lheXpoTkYvTXlKZnNL?=
 =?utf-8?B?dXJZMURrMnpocmFjS0JNODB5dGVFVDByc05oYndQT1VaQlVIcE1mZTdRcjZn?=
 =?utf-8?B?Y3dlcHhGc0ZhcDZLT3hWUnFSSVJVN1dXMThhZlUxeUxtazJRVTR3VmNobEVM?=
 =?utf-8?B?dWdzTnAzSVA4MXJjMzhXK2YzR0FJa05OT3luT3dFeThPalFjT2pNKzFjM2pJ?=
 =?utf-8?B?U0E4M1FsYkFGSXV1U1RlSG1uTmxNUzI1bXRmOG5saXJwUGtBUjMvdCttaGI5?=
 =?utf-8?B?UXRhUTY0bnR6bmJqalRyalBhVVZWVGtCZWdLdDA4dnVwM0lTY0NjVjNiMDE0?=
 =?utf-8?B?Y0hFVTM5bTdHNFhSTFZzRldpUTg5Rm96WUIyQ2dvbkR2dUVWM0FVbXFubjA4?=
 =?utf-8?B?NkhWdk5hQTYxL1VSZGR6bE1XTUtDcE00dHZPdHdRZUg2MzFmYzd0UGdCVlNU?=
 =?utf-8?B?NGN0dHU3Z3F3ZnU5S2oxOWZHSDVtdGgxaW5FUTJxTU02aXh5TDkzOGtiS3kr?=
 =?utf-8?B?MlhNYkRhUnBmRTltQVFDNHJFaXc5OGtIaHZ3S2JKUHdvSjZSMk43eVJuZ2Rt?=
 =?utf-8?B?QjJiS3ptbWlRMlFzZEhwcVR1NTlVK3FJZ290Y2phaWVKOGt0ZjJ3YkNkZkQ4?=
 =?utf-8?B?c3N0UW9Rd25sVUQ2bGVJVnJjdE1wN3piZEtsMTRZdFl3ejZmbjExRmZwMzVC?=
 =?utf-8?B?NFNNa056REtCRXk4RHJHdS94Rmd1d0ZxcXVIVXE1ZFdzTjRWcnhXOVlFRUt2?=
 =?utf-8?B?ZGpaYS9lZGRtSDJDbWZ6SjdGb2YzQ1gyd3F1NWZWNkFoZDdRWm1GYjd2WEIv?=
 =?utf-8?B?UEN3NjFvcnN1OUZ1NTM5VkkvQW5vWjNuMm1ybkp6ZHMxUTA2ZDZleFo1bzVM?=
 =?utf-8?B?QkRXWE9ZNUlkUzlKekU1ZHJmeG4veFhZNjdrbHdIeEt0VTNVWWk1UW0xa1gw?=
 =?utf-8?B?WjJFTEgvT2lhUnRxakI1Q1hNUTJwM3JKdWlad1Qxc3A5OUN5WHpaS2M1a09w?=
 =?utf-8?B?dzFoOWt4Q05renRuUnJKaDhaUjIxd1VjYUxCblhudFFEMVdGMXMwSDdqZTFr?=
 =?utf-8?B?dmZ0SkJ3K0d4QU9KNU5Ma1hLYUtPa0IrSTR3UTM5WHprdkdqSS9XSStzdFFR?=
 =?utf-8?B?dDcvbEJrRWNjY3VUSzlZdWpVK2tIQmo5Y29Wb05MRGpKbytBUTQyTFZkR2Fs?=
 =?utf-8?Q?MT8tC7Ei34o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUVublhMU2JMMDRnK1htWDc0V3NjbjNwUVZLZ1drZ3k3SzNieFRZVEdrcFIx?=
 =?utf-8?B?UUsyTXc5WWp2N2gyRHNmazhWbGV6RXlZeWFxV2R1SUJmd2VZcEFobzRLV1BI?=
 =?utf-8?B?R0JUR3I1bXFXa0pXeWNYNXFmVUkzR0xXMGdJNXJ0aElEZ3ppWVF6N1FLbExz?=
 =?utf-8?B?MGdmclh5VWxpZUk3bG1BeUNnYXIrRnlLUTNLMENsY1VDeXdIckFXOWFLR0g1?=
 =?utf-8?B?SDg3OHlBczlweG9VWG1yRDgwQXpLN2ZkR0IxK0wzTzJZa1Q5aFFrdFFPYVEw?=
 =?utf-8?B?NzJEY1MrVkp2WEdTRDB2czRGZnVZdlNMZ29ZRGk5NW9CQXV6cVNsS1hCZWJj?=
 =?utf-8?B?UWhOUDdsVUxreFByMFZlYVR0cjNNZHF2cmlXYkFRQm02amF1OEd3RFhMWkdF?=
 =?utf-8?B?VWRhbDIydXpEOEt1TE1oaUF5YXg3cnExQk83eHQ3ZVliME5ZVFZ5VjdnZmht?=
 =?utf-8?B?aGNPdVlNM1NudnN0RjBJdTZzNGdNSExNSEtaVjQ1eEFRcmhibG1pRXBrRW16?=
 =?utf-8?B?eWxCVFVacGJSL1JKSjRQdm54aHlyK0lsV2ZmRENkNlkvNExaU1ZzUGFJUVBK?=
 =?utf-8?B?MnJsMm1NbHFXQUF3MkhlWWtlbzU4cEM0R2RUSVFyZzF6N29tWDZZMDVud1Uv?=
 =?utf-8?B?S041OVlzTFZla2ZCRGViaXVvU2dnY0YwYzY0NEMyTE1ETVRVbGNUbkhzUEd5?=
 =?utf-8?B?Q21TWGplNkxHL2hvNERhU1BnZFIxbVdTdzU2SmZ1bVg0YWdQaVlUUFVJRjlH?=
 =?utf-8?B?VjNvS1BFNnpqcGxxVE9HWURHZzNpa2YyOU5GUVVPUmpweUhqcDFRSitWZFk4?=
 =?utf-8?B?UktOSjBtUk5GMEN3eW9vTGpXRTR5ZzVnU3lqNGpQVXdXV3BFcVdoRG5HbVFY?=
 =?utf-8?B?WC9QUnppYkZWQWl1NmhWOGh3aFFFOW03V3VmVHY4cWZlNkVNcHBZU3haaU1B?=
 =?utf-8?B?cUphMVBsTVRWQXc1RWhGS3BsTFArVEtwU0VFRjBjeEJJZG93WU0vOVpLVHJ4?=
 =?utf-8?B?TUEyQWdWdXZPMkZ6NUw1VUxYcEVnbGU3WEN2OGZ6ZzBqY0o4c3FXd1U1MXU5?=
 =?utf-8?B?NGk1dUREZ0R3dmovcVBOc0Z2cDl0SUFJQXVWZXVDMGl0SUhoZ0FyeTFsMFA4?=
 =?utf-8?B?c0ZCTXhxelFKaHh6L1BiVENFUWltbHJicTNGOHpLM2FKR2N3V0YyR0VrbGtV?=
 =?utf-8?B?eVdVQnNJTklQd2FVcHZleFFjK0xyakpJUjhQbWFMaERCZFRQOVpsaTdYTUgr?=
 =?utf-8?B?S3RBUzRnYmx4NjVReUJNT014WlR2UElhSFpwUTdsMjU5d1A1bEZrbDM2dHBm?=
 =?utf-8?B?b2NyMVRzR0I4dUtPT0FtZWdHNHlyVllWRldXRDc5dkJJTkFKSUdCN2hjT05Q?=
 =?utf-8?B?aWFpenQ2UnlkWXdvcjNwaWZHUmFsMUFkS29MU2VmYlVtajZWcjdhc1lMTnFh?=
 =?utf-8?B?U1A3OWhSNXB6SXdySnkzemdhYU9xTFdNR1VlM2NaOGhzRkxwME9mNWRJWng5?=
 =?utf-8?B?c1NhaWZjbEJiOHl2TkdwTHpIU09Xb1d6b250dUtjc0IxVnBOeUFvRWE3TWdy?=
 =?utf-8?B?U21Ra1ZJQVZFYlh3djRVNEpKeUd5VlZQZUJiYTcxTjZEcGwrQWFZQUtCWkJE?=
 =?utf-8?B?aDdUanBLNEh1c0loY3RLbG5ZQ3pwNG9CaDJNUmVFdjdwVFpVZk5HRWhvbFpi?=
 =?utf-8?B?Wkw3cC9lMmswaFF6UTU1MURhOHBJTFVxSGFYVm5iVWtSRW91d2NxRjRiL3RK?=
 =?utf-8?B?cG51VEFGbGZZTUU5ZUNGRHBQQWZqb1JnbUx1WjVNZ1N5emE2c0R6TTVNcXhx?=
 =?utf-8?B?VEE1YXBVa2xFWk5OTVRTTVJiV3ZpS1M3R3JXckJaYXd0QlNHTXFiVnZGMUdX?=
 =?utf-8?B?WFRyUFZVNUFvazZMcmZRbXhsa05DZVRrWW9KQkVZalhkKzFzUHBmOXgrZ3lS?=
 =?utf-8?B?QWdKTGljZmlkeSs0ZGFEakJ4RDhuZDhTL3dEa0xSTHdBRGYwaC9SdjRZakVx?=
 =?utf-8?B?aStlNS9LejQveFVaVmxCREhwaklubmNMSVVpL3ByV2hNNGJPUy82WnFkZFFG?=
 =?utf-8?B?Vlo0UkRoMi9VVSt2WlRvaDR0akZiVzBHWTNZNEkzVWFwU09La3czVDAzK2hK?=
 =?utf-8?Q?fVyCDBSsSWVWbE0n40WVw135t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a956af-f23c-4cb6-d664-08dd87f60e71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:48:23.3476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6xi/qkQJTTAvk9ucabhgqAcsz6P6d5rNLTAvRmmc7vlz1qqCtHS9KUC2UMFDFhf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021
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

On 4/30/25 16:13, oushixiong wrote:
> 
> 在 2025/4/30 19:03, Christian König 写道:
>> On 4/30/25 10:56,oushixiong1025@163.com wrote:
>>> From: Shixiong Ou<oushixiong@kylinos.cn>
>>>
>>> [WHY]
>>> On some boards, the dma_mask of Aspeed devices is 0xffff_ffff, this
>>> quite possibly causes the SWIOTLB to be triggered when importing dmabuf.
>>> However IO_TLB_SEGSIZE limits the maximum amount of available memory
>>> for DMA Streaming Mapping, as dmesg following:
>>>
>>> [   24.885303][ T1947] ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>>>
>>> [HOW] Provide an interface so that attachment is not mapped when
>>> importing dma-buf.
>> This is unecessary. The extra abstraction in DRM is only useful when you want to implement the obj->funcs->get_sg_table() callback.
>>
>> When a driver doesn't want to expose an sg_table for a buffer or want some other special handling it can simply do so by implementing the DMA-buf interface directly.
>>
>> See drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c for an example on how to do this.
>>
>> Regards,
>> Christian.
> 
> 
> Thanks for the reminder,
> 
> most drivers that use DRM_GEM_SHADOW_PLANE_HELPER_FUNCSand DRM_GEM_SHMEM_DRIVER_OPS
> 
> don't need to import the sg_table, such as the udl and the ast and so on at the moment.
> 
> They just need to call dma_buf_vmap() to get the kernel virtual address of the shared buffer.
> 
> So I wondered if there was a simple generic PRIME implementation for these drivers.
> 
> If you don't recommend this, Maybe try to implement it in DRM_GEM_SHMEM_DRIVER_OPS ?

Well if you only want to implement vmap/vunmap the necessary code in the driver would look something like this:

const struct dma_buf_ops amdgpu_dmabuf_ops = {
        .map_dma_buf = dummy_map_function,
        .release = drm_gem_dmabuf_release,
        .mmap = drm_gem_dmabuf_mmap,
        .vmap = drm_gem_dmabuf_vmap,
        .vunmap = drm_gem_dmabuf_vunmap,
};

struct dma_buf *drv_gem_prime_export(struct drm_gem_object *gobj,
                                        int flags)
{
        struct dma_buf *buf;

        buf = drm_gem_prime_export(gobj, flags);
        if (!IS_ERR(buf))
                buf->ops = &amdgpu_dmabuf_ops;

        return buf;
}

The only thing which could be improved is the dummy_map_function. As far as I can see we could make the map function optional in DMA-buf now.

Apart from that you could make a DRM helper from that few lines, but to be honest I don't think it's worth it. It reduces the loc a bit, but there is no real complexity here which drivers could share.

Regards,
Christian.


> 
> Regards,
> 
> Shixiong Ou.
> 
>>> Signed-off-by: Shixiong Ou<oushixiong@kylinos.cn>
>>> ---
>>>   drivers/gpu/drm/ast/ast_drv.c          |  2 +-
>>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 17 +++++++
>>>   drivers/gpu/drm/drm_prime.c            | 67 ++++++++++++++++++++++++--
>>>   drivers/gpu/drm/udl/udl_drv.c          |  2 +-
>>>   include/drm/drm_drv.h                  |  3 ++
>>>   include/drm/drm_gem_shmem_helper.h     |  6 +++
>>>   6 files changed, 91 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
>>> index 6fbf62a99c48..2dac6acf79e7 100644
>>> --- a/drivers/gpu/drm/ast/ast_drv.c
>>> +++ b/drivers/gpu/drm/ast/ast_drv.c
>>> @@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
>>>       .minor = DRIVER_MINOR,
>>>       .patchlevel = DRIVER_PATCHLEVEL,
>>>   -    DRM_GEM_SHMEM_DRIVER_OPS,
>>> +    DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
>>>       DRM_FBDEV_SHMEM_DRIVER_OPS,
>>>   };
>>>   diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index d99dee67353a..655d841df933 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -799,6 +799,23 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>>   +struct drm_gem_object *
>>> +drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
>>> +                      struct dma_buf_attachment *attach)
>>> +{
>>> +    size_t size = PAGE_ALIGN(attach->dmabuf->size);
>>> +    struct drm_gem_shmem_object *shmem;
>>> +
>>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>>> +    if (IS_ERR(shmem))
>>> +        return ERR_CAST(shmem);
>>> +
>>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>>> +
>>> +    return &shmem->base;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_attachment);
>>> +
>>>   MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>>   MODULE_IMPORT_NS("DMA_BUF");
>>>   MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index 8e70abca33b9..522cf974e202 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -911,6 +911,62 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_prime_export);
>>>   +/**
>>> + * drm_gem_prime_import_dev_skip_map - core implementation of the import callback
>>> + * @dev: drm_device to import into
>>> + * @dma_buf: dma-buf object to import
>>> + * @attach_dev: struct device to dma_buf attach
>>> + *
>>> + * This function exports a dma-buf without get it's scatter/gather table.
>>> + *
>>> + * Drivers who need to get an scatter/gather table for objects need to call
>>> + * drm_gem_prime_import_dev() instead.
>>> + */
>>> +struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
>>> +                             struct dma_buf *dma_buf,
>>> +                             struct device *attach_dev)
>>> +{
>>> +    struct dma_buf_attachment *attach;
>>> +    struct drm_gem_object *obj;
>>> +    int ret;
>>> +
>>> +    if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
>>> +        obj = dma_buf->priv;
>>> +        if (obj->dev == dev) {
>>> +            /*
>>> +             * Importing dmabuf exported from our own gem increases
>>> +             * refcount on gem itself instead of f_count of dmabuf.
>>> +             */
>>> +            drm_gem_object_get(obj);
>>> +            return obj;
>>> +        }
>>> +    }
>>> +
>>> +    attach = dma_buf_attach(dma_buf, attach_dev, true);
>>> +    if (IS_ERR(attach))
>>> +        return ERR_CAST(attach);
>>> +
>>> +    get_dma_buf(dma_buf);
>>> +
>>> +    obj = dev->driver->gem_prime_import_attachment(dev, attach);
>>> +    if (IS_ERR(obj)) {
>>> +        ret = PTR_ERR(obj);
>>> +        goto fail_detach;
>>> +    }
>>> +
>>> +    obj->import_attach = attach;
>>> +    obj->resv = dma_buf->resv;
>>> +
>>> +    return obj;
>>> +
>>> +fail_detach:
>>> +    dma_buf_detach(dma_buf, attach);
>>> +    dma_buf_put(dma_buf);
>>> +
>>> +    return ERR_PTR(ret);
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_prime_import_dev_skip_map);
>>> +
>>>   /**
>>>    * drm_gem_prime_import_dev - core implementation of the import callback
>>>    * @dev: drm_device to import into
>>> @@ -946,9 +1002,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>>>           }
>>>       }
>>>   -    if (!dev->driver->gem_prime_import_sg_table)
>>> -        return ERR_PTR(-EINVAL);
>>> -
>>>       attach = dma_buf_attach(dma_buf, attach_dev, false);
>>>       if (IS_ERR(attach))
>>>           return ERR_CAST(attach);
>>> @@ -998,7 +1051,13 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>>   struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>>>                           struct dma_buf *dma_buf)
>>>   {
>>> -    return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
>>> +    if (dev->driver->gem_prime_import_sg_table)
>>> +        return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
>>> +    else if (dev->driver->gem_prime_import_attachment)
>>> +        return drm_gem_prime_import_dev_skip_map(dev, dma_buf, dev->dev);
>>> +    else
>>> +        return ERR_PTR(-EINVAL);
>>> +
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_prime_import);
>>>   diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
>>> index 05b3a152cc33..c00d8b8834f2 100644
>>> --- a/drivers/gpu/drm/udl/udl_drv.c
>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>>> @@ -72,7 +72,7 @@ static const struct drm_driver driver = {
>>>         /* GEM hooks */
>>>       .fops = &udl_driver_fops,
>>> -    DRM_GEM_SHMEM_DRIVER_OPS,
>>> +    DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
>>>       .gem_prime_import = udl_driver_gem_prime_import,
>>>       DRM_FBDEV_SHMEM_DRIVER_OPS,
>>>   diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index a43d707b5f36..aef8d9051fcd 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -326,6 +326,9 @@ struct drm_driver {
>>>                   struct dma_buf_attachment *attach,
>>>                   struct sg_table *sgt);
>>>   +    struct drm_gem_object *(*gem_prime_import_attachment)(
>>> +                struct drm_device *dev,
>>> +                struct dma_buf_attachment *attach);
>>>       /**
>>>        * @dumb_create:
>>>        *
>>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>>> index cef5a6b5a4d6..39a93c222aaa 100644
>>> --- a/include/drm/drm_gem_shmem_helper.h
>>> +++ b/include/drm/drm_gem_shmem_helper.h
>>> @@ -274,6 +274,9 @@ struct drm_gem_object *
>>>   drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>                       struct dma_buf_attachment *attach,
>>>                       struct sg_table *sgt);
>>> +struct drm_gem_object *
>>> +drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
>>> +                      struct dma_buf_attachment *attach);
>>>   int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>                     struct drm_mode_create_dumb *args);
>>>   @@ -287,4 +290,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>       .gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>>>       .dumb_create           = drm_gem_shmem_dumb_create
>>>   +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
>>> +    .gem_prime_import_attachment = drm_gem_shmem_prime_import_attachment, \
>>> +    .dumb_create                 = drm_gem_shmem_dumb_create
>>>   #endif /* __DRM_GEM_SHMEM_HELPER_H__ */

