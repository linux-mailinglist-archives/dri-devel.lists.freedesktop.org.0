Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7CAA9768
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BE310E402;
	Mon,  5 May 2025 15:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YkU3GgVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6B710E413
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 15:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpsOVCQftZuBo4vUfljxFPcI8UlgolQQjqYcudxzuwyIFHGN9fdne1ftg5uXBV0ss+oBojyLwMpbAzfZAG1rJkfhdqtNBYODn+Ge0DOfWgCUdFGL8oXqrHhaq1aKeX9mQDPqM5zqovNE4uCfplw1AYPPu96dPPBlv49MpiiXQNJkg8s32jGVP1K7QFE1JGzpba5o7Kn3w+1UFYDmTI/r9dH4RFIf2qKKmLVRKJNqYiNZg+jDGmvN5h1+ZDjFcReHbzqAvJoO8EsTab3hF9+AfVILHuxClkVUNZNmeAEuJ9JtHl0nHKYqWgfq8lDcUQ7EhYH8jbkBBBJTm3NqM/uE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLrkA9DO6zI8Hje+GNGtU9d1vPo2vxI94+XiVlGQVUQ=;
 b=TMw6dntWRopnLmrIrCfO2aAPFQZ4o4PycAGl4leGG4Y4lc1PBgrbNElHcCCh96itrWFLWgla6taNW8P+mJP+5ghVembjycJrwRSX3WIzvSLxAoqZknxKSBY0e7O01PiKWOj2ST6+xb/f8B5ZoHerwGqIPtq/BRkgUjvXYnLzO/dfzt3jSqH0xj3ns1WaAo96o6G+iIEXhVL50PaDDXsWlAmihS5r48htUAM6j46x+x7034lDJjTGXlYJUsd/bA1KuOs1AECexSJpAkoaQiiC66BFomHUDJJTr/fLgPcD+dGw0vnbY010rOr6iWtwnj0dbPxcJv3zpT1ArMOXZwuQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLrkA9DO6zI8Hje+GNGtU9d1vPo2vxI94+XiVlGQVUQ=;
 b=YkU3GgVEdvYbAGqPx7V0k06XU8aJtIuive7+4hVXVrRKVc7TnQI/78lo6MktBFu2VAVgAxi7y64RER4cuS7ZyAQRBWf7/XAt+Uwi1QhIKpvhmNEk5GiyFPd0sd/3u1Isj/rXmLwZtQZLyy8d/g4ri8OQYghx0wuKv10snpjl7ME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 5 May
 2025 15:23:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 15:23:47 +0000
Message-ID: <c9321d5f-7f3f-43d8-86dd-1a8a0fa4acca@amd.com>
Date: Mon, 5 May 2025 17:23:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/shmem-helper: Import dmabuf without mapping its
 sg_table
To: oushixiong <oushixiong1025@163.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250501064324.398650-1-oushixiong1025@163.com>
 <71ec7bd1-be90-462e-8a07-e56fccae4096@suse.de>
 <8e4f60ec-caa8-431a-88f8-aee8183d96e5@amd.com>
 <a681cfd8-0c8c-4ffe-9f42-f0e54ee2539d@163.com>
 <58fb9a49-4f4f-48f6-ad98-8be27ef0c0f7@amd.com>
 <5c91c6ba-0532-4daf-be14-1a9fb077ee47@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5c91c6ba-0532-4daf-be14-1a9fb077ee47@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:208:160::37) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a3b0c5-1ff9-466c-6980-08dd8be8d47f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFcvM2luZlVZUVRCZEhCOXJYWEZOZUVVLzVaU2JHZVBoRU95SFl2YWFWOVhW?=
 =?utf-8?B?OGJZWk9uVjdOWktYZS93U3c4VUFGSDNPQ2NyeVhacC84RWhWOTMwRnNzTnZ2?=
 =?utf-8?B?dldneEJlREd3Q0dsOVhYVytrai9UVnFFRkRtSzFxZTB3bnRydEVUb0Evckox?=
 =?utf-8?B?REREWHlqOS8yc2JpV2JYdEtRMXZyelIrMFg3SWxqb1lTWFN1NXVLcE9PODIy?=
 =?utf-8?B?RVNja1g3YkFlaFg4L1dwdW93MGNMZk1lNTd0elJIQmpwcWVYaks1UHEzaHZs?=
 =?utf-8?B?WWltMlluUE96U0cyd3lnakcvdmJVMVJXSTBwWjk5d3BQejdaZXA2UEJtK2w2?=
 =?utf-8?B?cGVpczRMODV6MWRMZTNuYlpBNlVDcXFudjZtKzNiaDFHWjZUcnJuSEg2Mm11?=
 =?utf-8?B?a0pHdjNEME1IM1QwSmQxOWJJN240QkJSc1ErSHcvL3BVdlM5RlBwMjNxL1VP?=
 =?utf-8?B?cnJSUGpOQ1g4U2lqMFh1M0xZRHZzcEhUckZSWHZNbVMrYUliNVhPbnlyUTBT?=
 =?utf-8?B?dFhEYlM2QjFsVnlSOTczelVCNTc0allzTkx0NU04SFBCaEV3YTBZTjM0UG1m?=
 =?utf-8?B?c1p6WXd2Z0xIRjR5elRHZDNWd0YzN2ZQRTN6WkltK3l4VmpIVEhTaklLcHVp?=
 =?utf-8?B?eTF5Y0NldzBJQjJzZXF4MWZqcFZHSVo3cGRWODU2RXA5UFFkYXczNTUyWHor?=
 =?utf-8?B?ZUU3SkhqSW9HMVZXVC9YV3hDdEJVVnlaeTZhU1hQdmJiaklWa2QyUGVVMzRF?=
 =?utf-8?B?NmVJTWd0TVhuN0Q2djkzNjFoc0J0SXNHdWg4VCsyc09TVHBESDVtVGtRTWtT?=
 =?utf-8?B?ME9xTytPaEVtTFRXaEpINVRlMm1ZOVA0bnNodHo3STFGWmViaVpRYngrd2tJ?=
 =?utf-8?B?aFRzbmV2VFY4UndPQTNXaW5YbXBJVFhBdzdKQ3ZhWVlMYzJPc3poMXBlMHVM?=
 =?utf-8?B?ZDI2amM4ZU5SaGtEeXZOUlkvUHZrWDhmQzlFVEpuNGxTbWp6RFRLOFlyTnpS?=
 =?utf-8?B?cVFNdmd3S09RVnpVLzBLRnU2cnd2TjVXbnNYb0FKNjNMdHpRVERySUNCaFVF?=
 =?utf-8?B?WU5nS1FsSW91a0lmbDZnK0c2T0t5VS9wZmZKRDRRRk44UjQ0Rjd0ZVhuSGpX?=
 =?utf-8?B?WkhEQ0czTzU0V3l2d2JLQVd5cWxHQ2dCaUF6TDY3c1c4YTlSZTNyQXVYYUo2?=
 =?utf-8?B?Q003SmljWWFXbjhmaTNjOFNhL3FMZSs0bHNuWStsazMrN1RscHB0Rm1GYnM4?=
 =?utf-8?B?dnRaOTVuOU1VZk5VbisyRll5MTFmK0ZaaXkwdEZ3UlBMT1JrVnFKbThqdVhO?=
 =?utf-8?B?K0hSaDlFdFBRNEpTbzRialBNOEZNUnc4RmdZVVZyeUxkWXErM2s4NUsxc2VB?=
 =?utf-8?B?NTZ6M0R6b3ZCNElZdTZJMnBaYi9oa1NNcjBsSU1DU2h2SlZOMytyMWRpdVBO?=
 =?utf-8?B?OW1LcmovTEpnM1dTeDdQZG9qSUtSSldVV1hlQnZpelZZMlUvQlkraDVmVG80?=
 =?utf-8?B?NzRWVm1sV2hKbXRSWDZtbDMyYUloSHhkOWtrWkxkS3lDc1RMZFQwQjhIUXFs?=
 =?utf-8?B?a0pzTzFZMXZXQTVNWnV0SUF4cDUvTldxeVJ6REozUkpZcGFXVDd3S3N5aXJY?=
 =?utf-8?B?ZnkrU3BYc2JwRkFFV1NMaVltbzFwRytFejgvcHhSRHZQL3lOWlNwUkpRdWxn?=
 =?utf-8?B?WDJpRUhrMENRK0RWMTdzM0ZVYnRyMWVscDB5NXlXWkVJYlFFUFp6dkJXQ3FT?=
 =?utf-8?B?MXdSZHBnOWwrUm5IZ1ZPa3NsNWdQVHY0RmZEcy9sRUlsWUNWakFTK1RUMXdl?=
 =?utf-8?Q?RR9Va4TNISSQT4FOGVXoGc127vTlTIB1RxcvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHU4QmdkdVZIQWRKUDdjb0ZhMEVQWFRTdFlISXc1YmVkbVVZSUxUNi9nQmRU?=
 =?utf-8?B?aksrODVBbUhFcnRaajRaSDZFMFkwTnpLajdCNzF4WUdTUWFqK0R4dFUyZTdi?=
 =?utf-8?B?a3ptbTYxYmRGKzhRemwzMTArS2s4RFpnR3E4QUh1U3dBaFYvdGhjQUtoOE10?=
 =?utf-8?B?K2gxY05UbzBaQ0JTWSs3cEVUKzYzSlVCZ0ZHM1gxTEhFeXp0RE96aTJBOW5B?=
 =?utf-8?B?aEREVGhlZ0hrS3RhanpaZytlMHc4OTNvZGhYdzdZZnRISDVublkva203Zjgw?=
 =?utf-8?B?UkhremtBblNpTGU2VkJ2N2ZWUkd5UTU4RU8yZkNmUGJWVzdtZlZobGdPLzlj?=
 =?utf-8?B?cmFUVzBtWFN0dG1RcFo2Rm8yVGMzejZLQUlhMGV0V1RQYUNRb01YQWh5bnBz?=
 =?utf-8?B?SHl6YlVSd2JZbHFtRTJlUXluYzBCZjZjS2V1NTFXQVZGSHJmeS9PblNVU1Ez?=
 =?utf-8?B?VHJOQ3o0SHpzWkpiZENWYThEbEs3dDVQbTR3ZkFpTlZHRDNtdWZtblNTRlBl?=
 =?utf-8?B?bTVTb2dKY2hyOGFaRzZrOUF0VHkrY2t5amlzVkxtNHZ4dlFHSWRxZHl5V05C?=
 =?utf-8?B?bFlXVVJxZUp5d1lMbFVueDZ5ZXM0VUgvdjhHbUNMZTV4Szc5M2JEZEErRE5C?=
 =?utf-8?B?TXROV1dpcG5iTWZGMFgxZEorbGJZR3Njd3NYZkx5aFB2aVJNaXZSaGlUejkz?=
 =?utf-8?B?RFZaekpTUmJPWlJQcTlTN3lKT2hjeUhoQkZzVWlwcUU4UGdjRjMrOHJMbEQ4?=
 =?utf-8?B?Tms5Vi9PemJlNmtKU21lUmtiS2doc3NScmltSkRHc2M5d2JJa1N4OFhMRHpx?=
 =?utf-8?B?eUtEck5wTEoxdytmUGQveXkzYU1ZbnpzeXd4N2daQklCaG5VZW9DUTJ4WWh5?=
 =?utf-8?B?d3JBVTF3aDBQKzYzWjlmTFJzTDdKYXMvRkF0b3pGQnE4SW4yenR1YmlLek1m?=
 =?utf-8?B?UFY2bHFPYWs5MjNYM3FaTHZOUEtmaENJNFhOU2w1cmZQSjRjL1paM2pvTkZL?=
 =?utf-8?B?cXd4S2FpOUFvTmlVYXBqODA5M2loK2F5cXlmb0hiUzFHRUt0a1Z4cFl0R0xj?=
 =?utf-8?B?S3p1Y2xUQ3JJOE53akFoZjVGZHMxTFcrcDlBeVJkZ1EvYkUwbHN4aE5BL3NC?=
 =?utf-8?B?OUpldVFTSzErNDBTeTJBZ3lUc2hjTStoRllRZ2p6WTNyWGhMODRBa1RqaXBF?=
 =?utf-8?B?U0xNV3Z0T3NpdjVGSGlITkpjZGFZakhtajhRcURacEtTWCtuYUJkbytoeStR?=
 =?utf-8?B?WUp1bnlrWENvblZtNGU1NWxqMFdaYzBNR2VsQ0pOTmRMN3lvWVBFWENkaXlo?=
 =?utf-8?B?R1RpY0IwcEdhN1VjSTdETFJzODNXL2VMU0dLUmxtVGNzRWFuZyswY2lrakZw?=
 =?utf-8?B?RDhyV3o3R3N5djd6ZnMzMlVsVVdVaTIwMW9OU09NMnJCUzdMWHlrSDkwS1Uz?=
 =?utf-8?B?U01uTjdSOUZTSU1KR2M2NlhnYzkxQ0NOVUc4YjNsWkl0dGxiVmRLSkVJZjFi?=
 =?utf-8?B?T1lFNyt4M3NXNHdldFJmWFpyc21FYlU0ZkxTa2FoaXA1ZisxYkZyUUl3RWtY?=
 =?utf-8?B?K2hGZU0zWVV6Sml1SFRDdmtzQ3k2OXNoMDFUMVJIamVQRklzWUkvMEpOdENy?=
 =?utf-8?B?V0NNU3QrZ2Q0bGk4YUVqQVkzRUF5QjAwRC8wb29yWVh0a3ZzR1N5bjF6WTBZ?=
 =?utf-8?B?L2VYM1J1VFVuV3hpbUNCVWFrUW5MSkJFUHczMytIcGkyOVlvdWlienNNb2Fp?=
 =?utf-8?B?SDllSFQ1eGRQUE5LU21uL09wMGw1dG1qVlpvYjFIRTVBaVN1RmJnbitxYStQ?=
 =?utf-8?B?RSt5N1h6dHVHVVRvNGI0US8rK1IrdFlnenZNUUJSZjliZTUxUTJyemV5NW9y?=
 =?utf-8?B?WFJ1QUtLUmZ3YXN5OWxJUVNpZi8xczNqYkkzTFlIKzBReTFuZ1FDNDh6bGxi?=
 =?utf-8?B?cG9yZ3dqNUUxRmI3M1RJU2d2OWdvbVVnVHFtTVIrNWZ2aXFKWXlROUpxSzlT?=
 =?utf-8?B?YlU3Mmx4WVJWaWhZeGtkSGlhTnM2Vm01SUt3NTk3aExrVE5TenErQUhBQ0tp?=
 =?utf-8?B?Rlp0aE8yZ1hlK3NOSXdvYkVWRXZoRkRheDZlWXMxTHYwd3JUWDhsL3FSa1lZ?=
 =?utf-8?Q?uBYOFtccc2NTu1mpyWrqY1VMk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a3b0c5-1ff9-466c-6980-08dd8be8d47f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:23:47.2458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJWJFDqzctNJ+i2rMtt4nN7F24zc5TA6/sGvx5KG4SaMYx5QvfkFI8STEEg6tbME
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663
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

Hi Shixiong,

could also be that I didn't fully got what you try to do here.

Between which drivers and implementations are the BOs shared exactly?

You could also just rebase your patches on drm-misc-next and send them out again and I can take another look.

Regards,
Christian.

On 5/5/25 17:11, oushixiong wrote:
> Hi Christian,
> 
> I don't see strong relevance between my patch and the patches you're referring to.
> Because the drm_gem_prime_import() function imports sg_table by default, my patch provides an alternative
> import callback implementation for SHMEM-based drivers that differs from drm_gem_prime_import().
> drm_gem_shmem_prime_import_sg_table() doesn't need to call dma_buf_map_attachment_unlocked() to import sg_table.
> 
> Alternatively, I might not have fully understood the patches you mentioned.
> 
> 
> Thanks and Regards,
> 
> Shixiong.
> 
> 在 2025/5/5 22:32, Christian König 写道:
>> Hi Shixiong,
>>
>> for drm changes please base your patches on drm-misc-next or drm-next.
>>
>> That is probably fixed by this one here:
>>
>> commit b72f66f22c0e39ae6684c43fead774c13db24e73
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Tue Feb 11 17:20:53 2025 +0100
>>
>>      dma-buf: drop caching of sg_tables
>>           That was purely for the transition from static to dynamic dma-buf
>>      handling and can be removed again now.
>>           Signed-off-by: Christian König <christian.koenig@amd.com>
>>      Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>>      Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>      Link: https://patchwork.freedesktop.org/patch/msgid/20250211163109.12200-5-christian.koenig@amd.com
>>
>> After this patch SG tables where only created when necessary.
>>
>> Regards,
>> Christian.
>>
>> On 5/5/25 16:22, oushixiong wrote:
>>> Hi Christian,
>>>
>>> My patch is based on linux-next, so this patch is not based on the latest code. Then, I'd like to ask which patch resolved the issue with sg-tables?
>>>
>>>
>>> Thanks and Regards,
>>>
>>> Shixiong.
>>>
>>>
>>> 在 2025/5/5 19:25, Christian König 写道:
>>>> Hi Thomas & Shixiong,
>>>>
>>>> first of all the patch is still based on outdated code. For example the cache_sgt_mapping member is already removed in drm-misc-next.
>>>>
>>>> So if I'm not completely mistaken the issue is already resolved upstream.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> On 5/5/25 13:12, Thomas Zimmermann wrote:
>>>>> (cc'ing Christian)
>>>>>
>>>>> Hi,
>>>>>
>>>>> I don't feel qualified to fully review this patch.
>>>>>
>>>>> It would be good to have the issue with sg-tables solved, but I dislike the dedicated initializer macros. So my question is if this has any drawbacks. Or could we make this available and the default for all shmem-based drivers?
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>> Am 01.05.25 um 08:43 schrieb oushixiong1025@163.com:
>>>>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>>>>
>>>>>> [WHY]
>>>>>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>>>>>       DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>>>>>       sg_table import.
>>>>>>       They only need dma_buf_vmap() to access the shared buffer's
>>>>>>       kernel virtual address.
>>>>>>
>>>>>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>>>>>       trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>>>>>       restricts the maximum DMA streaming mapping memory, resulting in
>>>>>>       errors like:
>>>>>>
>>>>>>       ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>>>>>>
>>>>>> [HOW]
>>>>>> Provide a gem_prime_import implementation without sg_table mapping
>>>>>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>>>>>> require sg_table can adopt this.
>>>>>>
>>>>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>>>>> ---
>>>>>>     drivers/gpu/drm/drm_gem_shmem_helper.c | 95 ++++++++++++++++++++++++++
>>>>>>     include/drm/drm_gem_shmem_helper.h     | 24 +++++++
>>>>>>     2 files changed, 119 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>> index d99dee67353a..9e41e350ff6f 100644
>>>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>> @@ -39,6 +39,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>>>>>>     static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>>>>>>         .free = drm_gem_shmem_object_free,
>>>>>>         .print_info = drm_gem_shmem_object_print_info,
>>>>>> +    .export = drm_gem_shmem_object_prime_export,
>>>>>>         .pin = drm_gem_shmem_object_pin,
>>>>>>         .unpin = drm_gem_shmem_object_unpin,
>>>>>>         .get_sg_table = drm_gem_shmem_object_get_sg_table,
>>>>>> @@ -799,6 +800,100 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>>>>     }
>>>>>>     EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>>>>>     +const struct dma_buf_ops drm_gem_shmem_prime_dmabuf_ops =  {
>>>>>> +    .cache_sgt_mapping = true,
>>>>>> +    .attach = drm_gem_map_attach,
>>>>>> +    .detach = drm_gem_map_detach,
>>>>>> +    .map_dma_buf = drm_gem_map_dma_buf,
>>>>>> +    .unmap_dma_buf = drm_gem_unmap_dma_buf,
>>>>>> +    .release = drm_gem_dmabuf_release,
>>>>>> +    .mmap = drm_gem_dmabuf_mmap,
>>>>>> +    .vmap = drm_gem_dmabuf_vmap,
>>>>>> +    .vunmap = drm_gem_dmabuf_vunmap,
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_gem_shmem_prime_export - implementation of the export callback
>>>>>> + * @shmem: shmem GEM object
>>>>>> + */
>>>>>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>>>>>> +                       int flags)
>>>>>> +{
>>>>>> +    struct drm_gem_object *obj = &shmem->base;
>>>>>> +    struct drm_device *dev = obj->dev;
>>>>>> +    struct dma_buf_export_info exp_info = {
>>>>>> +        .exp_name = KBUILD_MODNAME, /* white lie for debug */
>>>>>> +        .owner = dev->driver->fops->owner,
>>>>>> +        .ops = &drm_gem_shmem_prime_dmabuf_ops,
>>>>>> +        .size = obj->size,
>>>>>> +        .flags = flags,
>>>>>> +        .priv = obj,
>>>>>> +        .resv = obj->resv,
>>>>>> +    };
>>>>>> +
>>>>>> +    return drm_gem_dmabuf_export(dev, &exp_info);
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_gem_shmem_prime_import - Import dmabuf without mapping its sg_table
>>>>>> + * @dev: Device to import into
>>>>>> + * @dma_buf: dma-buf object to import
>>>>>> + *
>>>>>> + * Drivers that use the shmem helpers but also wants to import dmabuf without
>>>>>> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
>>>>>> + * implementation.
>>>>>> + */
>>>>>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>>>>>> +                          struct dma_buf *dma_buf)
>>>>>> +{
>>>>>> +    struct dma_buf_attachment *attach;
>>>>>> +    struct drm_gem_shmem_object *shmem;
>>>>>> +    size_t size;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    if (dma_buf->ops == &drm_gem_shmem_prime_dmabuf_ops) {
>>>>>> +        struct drm_gem_object *obj;
>>>>>> +
>>>>>> +        obj = dma_buf->priv;
>>>>>> +        if (obj->dev == dev) {
>>>>>> +            /*
>>>>>> +             * Importing dmabuf exported from our own gem increases
>>>>>> +             * refcount on gem itself instead of f_count of dmabuf.
>>>>>> +             */
>>>>>> +            drm_gem_object_get(obj);
>>>>>> +            return obj;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>>>>>> +    if (IS_ERR(attach))
>>>>>> +        return ERR_CAST(attach);
>>>>>> +
>>>>>> +    get_dma_buf(dma_buf);
>>>>>> +
>>>>>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>>>>>> +
>>>>>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>>>>>> +    if (IS_ERR(shmem)) {
>>>>>> +        ret = PTR_ERR(shmem);
>>>>>> +        goto fail_detach;
>>>>>> +    }
>>>>>> +
>>>>>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>>>>>> +
>>>>>> +    shmem->base.import_attach = attach;
>>>>>> +    shmem->base.resv = dma_buf->resv;
>>>>>> +
>>>>>> +    return &shmem->base;
>>>>>> +
>>>>>> +fail_detach:
>>>>>> +    dma_buf_detach(dma_buf, attach);
>>>>>> +    dma_buf_put(dma_buf);
>>>>>> +
>>>>>> +    return ERR_PTR(ret);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import);
>>>>>> +
>>>>>>     MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>>>>>     MODULE_IMPORT_NS("DMA_BUF");
>>>>>>     MODULE_LICENSE("GPL v2");
>>>>>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>>>>>> index cef5a6b5a4d6..78ef91593a8e 100644
>>>>>> --- a/include/drm/drm_gem_shmem_helper.h
>>>>>> +++ b/include/drm/drm_gem_shmem_helper.h
>>>>>> @@ -110,6 +110,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>>>>>>     void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>>>>>>                   struct iosys_map *map);
>>>>>>     int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
>>>>>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>>>>>> +                          int flags);
>>>>>>       int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>>>>>>     void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
>>>>>> @@ -168,6 +170,18 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
>>>>>>         drm_gem_shmem_print_info(shmem, p, indent);
>>>>>>     }
>>>>>>     +/**
>>>>>> + * drm_gem_shmem_object_prime_export - GEM object function for export()
>>>>>> + * @obj: GEM object
>>>>>> + *
>>>>>> + */
>>>>>> +static inline struct dma_buf *drm_gem_shmem_object_prime_export(struct drm_gem_object *obj,
>>>>>> +                                int flags)
>>>>>> +{
>>>>>> +    struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>>>>> +
>>>>>> +    return drm_gem_shmem_prime_export(shmem, flags);
>>>>>> +}
>>>>>>     /**
>>>>>>      * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
>>>>>>      * @obj: GEM object
>>>>>> @@ -276,6 +290,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>>>>                         struct sg_table *sgt);
>>>>>>     int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>>>>                       struct drm_mode_create_dumb *args);
>>>>>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>>>>>> +                          struct dma_buf *buf);
>>>>>>       /**
>>>>>>      * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>>>>>> @@ -287,4 +303,12 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>>>>         .gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>>>>>>         .dumb_create           = drm_gem_shmem_dumb_create
>>>>>>     +/**
>>>>>> + * This macro provides a shmem GEM operations that implementate a simple
>>>>>> + * gem_prime_import.
>>>>>> + */
>>>>>> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
>>>>>> +    .gem_prime_import    = drm_gem_shmem_prime_import, \
>>>>>> +    .dumb_create        = drm_gem_shmem_dumb_create
>>>>>> +
>>>>>>     #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
> 

