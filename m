Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA66ADB4A0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 16:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A4610E3C8;
	Mon, 16 Jun 2025 14:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qr/EDm3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF3D10E3C8;
 Mon, 16 Jun 2025 14:59:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6TYKMz7a7xfX2Iq5hFxzHFNGBbfDcv3b/aYj49huV+hiQcBGOzgr8yFLd6Wx4mVKUM4gEwn4j6HZ1NR2Prc9g6t3PJBpsp46jfhxL0Uy4cAugEa7wXWYg2OugpcoUDkmTZKIN/MnSCosgkGmNcMkBAcqmKFuyMCV0fXrZ6S3s7nkGprIteBUMFNqynK7URKqE13XP58xE6JhnPpAnn2Rgz33qkYdbEiOmC6czvzMAhT4O82Zp0fWpX8fryOJg0iwUnegLUGZ9GDpbOU/ojLGELbRoiOHPxD4QZIr2iv/Kz9w1gJSJp5f6lvz6fh02+raFzKJPQf2Fwg1tOMBDPnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5Qd64POAALTkrAv8xI2f/HbH19j9YH5xhQ/KHwDRz0=;
 b=x9X0TCuGKlBkLDkTrliEjXI41kMEIS+9d1hbKw/RNGAjY22DTwgj4jzBsn75k3eKyE9uzyzbQ7KkVWBPx0COENRetzt2bDYIJN0sFQ5r5q/NwvAziMpvHEjg+IaZynf1lJAzLajLSvCPpk44ZQlOTWYOSw4ANqTLWqlhBh3joAY6/Ns5nuKIpOxJrOD6gMHu/HpWR7E/pN/zpdVRflrRz9sPx+p9+8WC9oMY1rP7fJJrsIrI5yxLvGYMQsy5OToMbiRAMFe7RNnSloNsaS7T4V97ASCU/KwTvbWYRawQy5Oni4DdtN2ttVJASgAcOzqdWd9tOxJx3MR11HyAPySFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5Qd64POAALTkrAv8xI2f/HbH19j9YH5xhQ/KHwDRz0=;
 b=qr/EDm3qANLT5lKTrHK3QmGFpjUM4m7JWYVyg39w92Yq0ZdRu4Ck6QhryQE0odobPZRqDQFSwKiJtIf48kf2h3vnM2FV4MF957syUfEG8ywxjyXSIED0hBKRjc9nRxXBJ57pc7ahnK9s6yKz1PmBYz7yxAQOWOVFLldBHmH+6X8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:59:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 14:59:17 +0000
Message-ID: <da061dea-4395-41a8-9844-2c7748fbca52@amd.com>
Date: Mon, 16 Jun 2025 16:59:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: add debugfs support on per client-id basis
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250616100503.1204166-1-sunil.khatri@amd.com>
 <20250616100503.1204166-3-sunil.khatri@amd.com>
 <3ca35236-377f-4ef0-becd-ba5d22b5edd8@amd.com>
 <84af6984-bd2e-4378-a5c0-ee2356f96b8f@amd.com>
 <cf0e1436-462f-4d63-a7fb-d1201d100bba@amd.com>
 <463e48d0-fdbe-4cd1-9b7e-086adf8b0b3b@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <463e48d0-fdbe-4cd1-9b7e-086adf8b0b3b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3a8d4a-6454-4c05-9614-08ddace65da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDNzWml3MlZBQVBldE1BRjM3MzVKNXlMQmFXOEFJTDJ0TDE0aHJHYmtBRW9q?=
 =?utf-8?B?aGlWblN5S3FkcUZjWTZUaHBqTlZhZVFweHE4RVlITDBHempneHk1THgza202?=
 =?utf-8?B?V2o1WUd3SEJDbUcvRTh5NEJxRHBmYlBwMmpPTFJDUDVLU3JXMWxrdktDSHFZ?=
 =?utf-8?B?TnlNTjZ2bTNMbWRrY29ST0t1dmZyV3l4ZHBpdktzTXdVa2tjdXFvMFA1WnU1?=
 =?utf-8?B?bVppSGdQVkMwVWJNa2hzNGZHUFZTcmNZM1EvTUFLNlhPT3hQZ2JNajBJYWR5?=
 =?utf-8?B?MkNsMkJicHFTNGp2OGlKNVV2NTRhRERlU3ZBY3VlK25DOVVHN1RiRTlCSUh5?=
 =?utf-8?B?NzFGUldWWTlaWUEvN1p0bVFjMUUrYnRCY1cvb0lYZktaU1JDNUIrQ2RQaUFr?=
 =?utf-8?B?czR1K3FLMVR0V0x3aDIyMnJWVEtmU3N2K2pFYXptbVBDUnNzaVBIRm9GbnVl?=
 =?utf-8?B?RmllTHRtNi8zdU1CY1RLaWtiK2hPZmJtQTdzNDNuNFJQMEVqeFZEVHQyYndm?=
 =?utf-8?B?NkFHZkMrczJNODRMMUJ0SUpjamxXekEwUTdZYTVJM2s4OW1OanFMSzhYci9p?=
 =?utf-8?B?N2I1MUFTRmx3Z1VwSm5pTXUwR09xbE84c2JaaHhBM3NQb0lKQVJSUEZTTENu?=
 =?utf-8?B?OXhUVTdZRmdTRU1lVzhERjZkMWFMd0dZaU55MElFZ3dpcjlDbXRmVUU2SnFx?=
 =?utf-8?B?ZzZCeXZuSE9iUlFkN05yZVpla1NtZzFaelBmZ3dzUEpuVTRRWjlnamJTWkxU?=
 =?utf-8?B?TW9Ca3hGenFOUmNzUVQ1ZHovRnNST0lWU3MrYjBPRndENnJXMUVvRDM4TVla?=
 =?utf-8?B?dVFrM0xOV3RkQU9IeGJBQlJycWttVmtHZmRlNmR3OHMrU3Z2UzlCUm52bW02?=
 =?utf-8?B?NmtMbkNYMkZWcUhVdmE3c0NnT1paS2YxVGRjYll3R0pEd1FxeHFTV3ExcWdR?=
 =?utf-8?B?UkoxVlBjUDM2bkFNSUM0VFE1amkxRVJPNlQyVWNIUHcwOEYyVTlpeG5kOStE?=
 =?utf-8?B?UVliUHBhbFBaZjh4bm54QlpGT0I1N0tFTkgxdVgwZEpxVkwvS2IzZS9zQWRJ?=
 =?utf-8?B?Tzh3SjJCdjNWVU9CQ0pGMmVlSUxhYllodGxUMkRXSkc2Z2lsazF5a2V1M0Y4?=
 =?utf-8?B?eEw1blVUdGllYUxMcGh0Zjgxc29ITmpuRkZBTVZ0eUxLaklZbkZzeHVoNjNX?=
 =?utf-8?B?dXlFRFNPVWY4eFh3QVZ6VFZpQXY5VkkrY1ZFMzR3QzRPbFM3NUg5eXZZWUZE?=
 =?utf-8?B?a0tRMHNqMFd3V1NidG9paWY4R21MK1BHcGoxQlJ5S0g5VEhDOVJkbnhmNmhh?=
 =?utf-8?B?ODloRkVoZHdkWkJmaVIyVHlxc1FqdGlyKzRlb3J4N25sc2R5NVlKamRCbGtl?=
 =?utf-8?B?S3l2WGdPa0RUUS8wbk5JRWlEakxBVUdDa2xaQS82VkxkOUs1ZmpzK0ZDblNT?=
 =?utf-8?B?d09Nci8vRzVQR2JsbkR2L000ZmlYN0k1Z2RIS2pEaXNXVmRDZzRSNENnY0xu?=
 =?utf-8?B?cGtmRisyenk4cVVRWWcxdFJRTWpYMFlNQlplTERrZmdHOUVZTjczcDREd2FL?=
 =?utf-8?B?N09xYnBxN3NTRmwzQnorY0Z4Sk1lUlV4c1ZaOHJ3VGNXRGk0U2s1S0VQK2x0?=
 =?utf-8?B?SitxWjFmSFQ3eFMzcEY3aW0vS1pUdExOT1ViTHB0S0NGdnEveEVObmJCMkxR?=
 =?utf-8?B?K3VrS3NVZjJmaXhKcGIvNXBpZk5ZSnVQZ1czOXZreW5INnIyaDlFdXFtWnVS?=
 =?utf-8?B?K2sycExJaHRRRFJ5SklnNWpOeHRibHB5Wjcxc1RZc09WSmFWYkE4QXZ2YVRj?=
 =?utf-8?B?dzhIQTZCQ0lTeGN6a3lDbW40ZzZCemNWeTZ2djNmRWcvMFVnRHJkRHprME02?=
 =?utf-8?B?djFUN2NqLy9BYzZwcEhiQktJK0hpZkNzdUphdjVNUXk1eC9JV2t4NzNPS1lm?=
 =?utf-8?Q?UoGpS5sFUCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1lMSs1RnJzL0tmc1hEckhvS0dNMFJRMU5UeFBORDZTSE11QU5zWUZJWGlH?=
 =?utf-8?B?RkhIbU5VbU5SSUdaMFRZanV3SEVqM1hoYWJQVCsvbVYwc1JaemxJbEtYdlBW?=
 =?utf-8?B?bWJ2M292RCtncmdXeCtFOFJXcXMrd3AwTXg0cmZtbVQ5d0o5WWtZQnpNWWNv?=
 =?utf-8?B?UVRFM2RHTHk3TTUyUjh4dHcvZE9WTmFhWjdVZlZYR1gwZThueS9iczVhd0tK?=
 =?utf-8?B?WG5JUitmeis5ZnlJUW1XYjVCRnVsaVNtcjYzSkhzbHAxN091SE5CZEV5YUlS?=
 =?utf-8?B?c2d1bWJZZEJlaThnSGgxd3ZSSmZ1Y0RJRnNXSWt5Z1NtZjZ2cjc3WjFWN0w5?=
 =?utf-8?B?K2Z6ajhxQzh2bmxDcXBESFpEMlQ0Z0ptZUxkcGR3MkhFMlE4MVZteHAxaG1w?=
 =?utf-8?B?aVY3SzJkTTRUYjdaT3BLL1BKcmlvMHFveWdCYmlRSVgya3pIbUpFdDE1Qzlp?=
 =?utf-8?B?VFlvbkREYUxSRWRDbW1SZzNFaTBnRS8rM3dSLzVJUG9mSHNDSlB0Q2lNYVh5?=
 =?utf-8?B?aXVFVXlLdzFKVFBCVlozajRBUStrVGFCVWJna1dJV0x2UUFpQzVKNkdYNERq?=
 =?utf-8?B?NDVJdk9qTUJraUZlb29ZZm5CenZ6RjBFK1h4bGtQOWR1QlVDNEdxQ2JBL3ZC?=
 =?utf-8?B?Nlg2S0ZJcTFGWHJHNExJVTYzSFJlclpIWm9EWkw3YUVPa0IyTkNrUVJyUnk0?=
 =?utf-8?B?NkhnMG5yK0dhZlBXN2I2WDUvYmJDUW1lNUFYTGsvVEZxY1BBb3ZHWnkrWDR3?=
 =?utf-8?B?MUo2TEl1Y2xlOGtPWkFURjYxMXZRczNyYlpNczdFOTMwVGxTUVM3bnVXZFA2?=
 =?utf-8?B?UzJ5Q1N4VDJlYXdTOTJrTU91eGRuUVBsZUs0VWwzUDQ1RnQzMFpPYzZHSFRW?=
 =?utf-8?B?YUFxNGVwWTJaNk9qc2RLOVlwZDJibys1eDRtUEpHYU8vck1KNGZtaTV0alE2?=
 =?utf-8?B?OFJJTFlmam1zL1hpS040QUpIeWZTM3VrNHJoT1VpUU9FT1laQ1Bmc3FUSkk3?=
 =?utf-8?B?WVlYOGxGWU9WTXg0UmJYSXlLY0kvZGdPd2ZDQWFDb0lwNE5HOGpmQTFKVWZp?=
 =?utf-8?B?UkJPK1ZscjJRMDIzOXZhNG1aRjdKM3dEYjZBa3R4Z1ZoOURlTjVab2dTZ3hO?=
 =?utf-8?B?S3J1S2xxZ0JyNXpSV2txdEJlYjVUYTVES2hZMWx6WFVNcllRTlozWG1UeDNF?=
 =?utf-8?B?dHNYVWRna0dxQS9Vd1cydWJodEpxMm1FUnFvaUVmcm5Ld29veWpGcXl6Nnp0?=
 =?utf-8?B?U3FWRHhPZjBCZDRkSjRRRXJDWDRrTXJpVUl4Uzl6d2FrWk8xNDR3UzZNcEQz?=
 =?utf-8?B?LzFQenNhSGM4S01CZmZnNmM3Yi83aExvT2RESElnbDJTUStNbmg1VzBoMTNC?=
 =?utf-8?B?NnRtcHdMaUU5cUVzNmxsSmsraGVueXhUK0xVeDRqK1NVODRtbUtNMElFRUpp?=
 =?utf-8?B?SUFWRWI5SEdDMWFpZEZVWll0S1FlcEFWeUhpOGluUzBIODRRN25tbXhaVGVv?=
 =?utf-8?B?clRCUm1obnZHTGRVTTBQcnJXZGhqUUhPdXVYdHB1eXJyV0tvTDJ3elNpaDBp?=
 =?utf-8?B?N2U3ZWRVNFlMWkN6Ukk5aDkrUXNncHgxdE8xb3RpWG04Y01ybmpGL0JuWGcx?=
 =?utf-8?B?eWVySGkwWXhiTXJBKzR2cWdnZ29SRmQ3NHhKWWc2M2RVL3p2RjJINlRETkhW?=
 =?utf-8?B?akR3KzZGKytVdUIrKzA0T0dobFB2Qm5DUVNyekdPZkg5VnFOSzk4cllObFFN?=
 =?utf-8?B?V3hSMEN6ZXFoUko1WHdUSU5rTFB5Q2M0YWJueG9SZlFjVkxRSGNUdzdZK2ZH?=
 =?utf-8?B?Zm1PdVF3UTdPdXJqU3Z3ZTF1ZFFuZkY1dGptUTBXRDFkWTl6V2dHYVZURHoz?=
 =?utf-8?B?YUFqYWlxbjRLQWc3dFBWS1FuMG91TlFEcDBSRXNJdkVacXZNMndpd3ZLWFhu?=
 =?utf-8?B?MWNoT2w5cnA0eStPVGc1Njd1UzhyVUhua1VUR3AzMEpEak5aSmNkUVVQSTNz?=
 =?utf-8?B?d3NRb0d5dVpuM3g5OE1IMGduazZkQ0s3WVljNElJMkpQSkNTS3dNU0FwajU1?=
 =?utf-8?B?cHo0RVlzbTBGYmRabld1c1Y0cno3dlBUZ0R4WWJGUGRvZlE0Wm1wam1TVGdK?=
 =?utf-8?Q?ktIviczPYVajx/9CpBXpDASDI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3a8d4a-6454-4c05-9614-08ddace65da6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:59:17.2174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLzq/6NjvTSJitZ/2eUEIBjIBTSLgUSlp8FbxF3byOy3v3VEeVkr4Vdqw9eVdNuD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078
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

On 6/16/25 16:32, Khatri, Sunil wrote:
> 
> On 6/16/2025 6:26 PM, Christian König wrote:
>> On 6/16/25 14:25, Khatri, Sunil wrote:
>>> On 6/16/2025 5:41 PM, Christian König wrote:
>>>> On 6/16/25 12:05, Sunil Khatri wrote:
>>>>> add support to add a directory for each client-id
>>>>> with root at the dri level. Since the clients are
>>>>> unique and not just related to one single drm device,
>>>>> so it makes more sense to add all the client based
>>>>> nodes with root as dri.
>>>>>
>>>>> Also create a symlink back to the parent drm device
>>>>> from each client.
>>>>>
>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_debugfs.c |  1 +
>>>>>    drivers/gpu/drm/drm_file.c    | 26 ++++++++++++++++++++++++++
>>>>>    include/drm/drm_device.h      |  4 ++++
>>>>>    include/drm/drm_file.h        |  7 +++++++
>>>>>    4 files changed, 38 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>>>> index 2d43bda82887..b4956960ae76 100644
>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>> @@ -296,6 +296,7 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>>>>>    void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>>>>    {
>>>>>        dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>>>>> +    dev->drm_debugfs_root = root;
>>>> We should probably just move drm_debugfs_root into drm_debugfs.c instead of keeping that around per device.
>>> root node above is needed in the drm_file.c function drm_alloc and there is nothing above drm_device where i can get the root information. that is the reason i mentioned it as drm_debugfs_root as root node of the drm subsystem itself.
>> drm_debugfs_root is currently a global variable in drm_drv.c, but if we move it to drm_debugfs.c all functions in that file could use it.
> 
> The global variable drm_debugfs_root is global variable in drm_drv.c and a lot of function there are dependent on it. So no matter where we move the variable we need to have a reference of dentry in drm_drv.c too and drm_device is the only thing that is being used in drm_drv.c.
> 
> eg:
> drm_core_init is using it and there is no structure there to use to have a reference to this node.
> drm_minor_register also uses the same root to create the device nodes and we cant move all the code from drm_drv.c so we are stuck again how to get the reference in drm_debugfs.c
> 
> I am trying to explore if its possible but if there is anything you could suggest appreciate that. What is in the current patch is we have a reference of root in drm_device itself like drm core is parent to every drm device, could use a different name like parent_debugfs or something like that.

drm_debugfs_root is only used in a few places in drm_drv.c:
1. To create and destroy it.
	That should potentially be moved to drm_debugfs.c

2. As parameter to drm_debugfs_register() and drm_debugfs_dev_init()
	Those functions are already in drm_debugfs.c, so you can just drop the parameter.

3. As parameter for drm_bridge_debugfs_params().
	That function is in drm_bridge.c, but it should be easy to call it from drm_debugfs.c after creating drm_debugfs_root instead of drm_drv.c

So moving drm_debugfs_root to drm_debugfs.c should be trivial, you basically just need a create and destroy function.

Regards,
Christian.

> 
> 
> Regards
> Sunil Khatri
>>
>> Including the new functions for creating the per-client debugfs directory.
>>
>> Regards,
>> Christian.
>>
>>
>>> ~Sunil
>>>>>    }
>>>>>      /**
>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>>> index 06ba6dcbf5ae..32012e39dcb4 100644
>>>>> --- a/drivers/gpu/drm/drm_file.c
>>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>>> @@ -39,6 +39,7 @@
>>>>>    #include <linux/poll.h>
>>>>>    #include <linux/slab.h>
>>>>>    #include <linux/vga_switcheroo.h>
>>>>> +#include <linux/debugfs.h>
>>>>>      #include <drm/drm_client_event.h>
>>>>>    #include <drm/drm_drv.h>
>>>>> @@ -133,6 +134,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>>>        struct drm_device *dev = minor->dev;
>>>>>        struct drm_file *file;
>>>>>        int ret;
>>>>> +    char *dir_name, *drm_name, *symlink;
>>>>>          file = kzalloc(sizeof(*file), GFP_KERNEL);
>>>>>        if (!file)
>>>>> @@ -143,6 +145,27 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>>>        rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>>>        file->minor = minor;
>>>>>    +    dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>>>>> +    if (!dir_name)
>>>>> +        return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +    /* Create a debugfs directory for the client in root on drm debugfs */
>>>>> +    file->debugfs_client = debugfs_create_dir(dir_name, dev->drm_debugfs_root);
>>>>> +    kfree(dir_name);
>>>>> +
>>>>> +    drm_name = kasprintf(GFP_KERNEL, "%d", minor->index);
>>>>> +    if (!drm_name)
>>>>> +        return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +    symlink = kasprintf(GFP_KERNEL, "../%d", minor->index);
>>>> Better use dev->unique here, minor->index is also only a symlink.
>>> Thats a good suggestion and doable. Will update in next version
>>>
>>> ~Sunil
>>>
>>>>> +    if (!symlink)
>>>>> +        return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +    /* Create a link from client_id to the drm device this client id belongs to */
>>>>> +    debugfs_create_symlink(drm_name, file->debugfs_client, symlink);
>>>>> +    kfree(drm_name);
>>>>> +    kfree(symlink);
>>>>> +
>>>> Move all that debugfs handling into a function in drm_debugfs.c
>>> Sure, let me try that and push another patch.
>>>>>        /* for compatibility root is always authenticated */
>>>>>        file->authenticated = capable(CAP_SYS_ADMIN);
>>>>>    @@ -237,6 +260,9 @@ void drm_file_free(struct drm_file *file)
>>>>>          drm_events_release(file);
>>>>>    +    debugfs_remove_recursive(file->debugfs_client);
>>>>> +    file->debugfs_client = NULL;
>>>>> +
>>>> Same here, move to drm_debugfs.c
>>> Sure, let me try that if there are not challenges.
>>>
>>> ~sunil
>>>
>>>> Apart from that looks solid to me.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>>>        if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>>>>            drm_fb_release(file);
>>>>>            drm_property_destroy_user_blobs(dev, file);
>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>>> index 6ea54a578cda..ec20b777b3cc 100644
>>>>> --- a/include/drm/drm_device.h
>>>>> +++ b/include/drm/drm_device.h
>>>>> @@ -325,6 +325,10 @@ struct drm_device {
>>>>>         * Root directory for debugfs files.
>>>>>         */
>>>>>        struct dentry *debugfs_root;
>>>>> +    /**
>>>>> +     * @drm_debugfs_root;
>>>>> +     */
>>>>> +    struct dentry *drm_debugfs_root;
>>>>>    };
>>>>>      #endif
>>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>>> index 5c3b2aa3e69d..eab7546aad79 100644
>>>>> --- a/include/drm/drm_file.h
>>>>> +++ b/include/drm/drm_file.h
>>>>> @@ -400,6 +400,13 @@ struct drm_file {
>>>>>         * @client_name_lock: Protects @client_name.
>>>>>         */
>>>>>        struct mutex client_name_lock;
>>>>> +
>>>>> +    /**
>>>>> +     * @debugfs_client:
>>>>> +     *
>>>>> +     * debugfs directory for each client under a drm node.
>>>>> +     */
>>>>> +    struct dentry *debugfs_client;
>>>>>    };
>>>>>      /**

