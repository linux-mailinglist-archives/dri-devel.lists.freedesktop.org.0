Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7993D4B6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 16:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D6E10E99E;
	Fri, 26 Jul 2024 14:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VR2orDmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ED310E998;
 Fri, 26 Jul 2024 14:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0TVxs/GCa21+ircT9+US/kAHBOEKVQIPvGcSTkZfBZzbS42pc84t2lNZgH6mxmsWOJFwjehDBSOfutRf8x3WS2cityNAnguUglL78skCmlGrAtlFfkRkaN7ZDce+UNFhdtCB3wpmqOH+JQDDN28RWuNyuTtydalS2ovgFQXjSVHuqD+JV64jpQUpJl2h9b5bydkM2gFzvR3nZwTlSzx/pFjXMs8+a+V7Po5JHtiS72u17lKKHb1oE5Z61VJzUSMx7z6iisfuT6bP845WHjRaqyW3laIvm2vfmetZEXZ3OREVrgq5z/BnT35QiPIYL0878HxAzjXU7gyWneOnpvuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60Hg389Cwi0QcOn4lylkd6gzLhBFnholp7PRbbIq34g=;
 b=r1cYzGIqzpKz++MhdTYe25L+vD6/iOwNCjB7DVsmJQhk6Ly24edsegw6GbZRDNwOT/A1VbtlvwM3CeXxo5FouRQKqqvjDrjmMLqFL2Z6if247PKSwkwZ9mb5rhfaqcrPRqs65QbrAQkY8s71sjOzUtvtIiA7wKbPObR3itnrz1BX0203Bn6oangHfCUSdSoca2krbEIu7F2uHnAEeQqrv8akjXXPsCJaGWS1Qb4K+0xnpZSDHHmhI3HTHO0HPijI6Oo5B+BVTOYJJUa74ZQAKX1H/cDMbPKlsTdZk/1uqvffqFWS3+HOlVpavXmc7kgBMPTf0YMcsZf0E55lPXwr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60Hg389Cwi0QcOn4lylkd6gzLhBFnholp7PRbbIq34g=;
 b=VR2orDmj7/osYit4t0cgTnUM9S2OJ1GwBlp0vKk+zPPaunV4WQ96yb6sxgDc8+awV2uBprXfkVAY2YtBJBwfngHcWsqztNMI2aqai6cTVZStw0oaPSY6YNIVELwvzrSJdrWo/w76aU7JhoXJ74e5s9YVTrNXYk+zOs3wWZA7el8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 14:02:43 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 14:02:43 +0000
Message-ID: <b2f66ebd-89d0-4b21-bd1a-8a1b2660932d@amd.com>
Date: Fri, 26 Jul 2024 19:32:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/buddy: Add start address support to trim
 function
To: Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
 <87h6cekenc.fsf@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <87h6cekenc.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b96ae0-9c73-4b99-db5f-08dcad7b9e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2tybHgvTzhVcUpPYTBrVGNTeVVlbVQvOFBGSnFMbncxcGVTS1lReDRNVm11?=
 =?utf-8?B?MWZOUmV0YklibjhvRkhZNnJPa1JjOXlvdkoxK1dIbUxDcDJGV3RmaWdoVjJO?=
 =?utf-8?B?TFhsOUtDZXB0T204SkdDSy9VaGJQQ04yb2dtUnVqVklBaDRtUkE4MUtXODFX?=
 =?utf-8?B?eVNMSGxjZGNaYjhpaDBYQngxVUxjaXBjZ2NVSk1CK1ZVQ2gwNG41enJxeUYx?=
 =?utf-8?B?L0o5RWJXcHBkWnF2UzdTMHgySUVTUE53eWptNFR6RVhJb0pPQXpWSmUxb0k1?=
 =?utf-8?B?aDVCMDF6K3N0UGlPMVZzZEhHTTExVGR4VmNMZ25oQ1ZCeG5zRWZ0bVNOa2di?=
 =?utf-8?B?WmhFckgyc1BITU9qbHJDVXF0aEVkYi9nTlorQktEcG5saGkvakhEaE1udGxY?=
 =?utf-8?B?Qmswd3cyTXFJVmt6dFFXdXFpVGM5L3dVNFpmaTYycDBCYk5ZSGQ5Y2gvUW5t?=
 =?utf-8?B?ajZtMG5DaFN1bEdLRDVoSmlKdXc2VkozMksyNWlVVGVFd0Z6ZWNqTTZRK2JJ?=
 =?utf-8?B?NVkzeHBDbFRmZUdjYzlYSEFNTFoyVlZWTTh5Z3QwM1hNblM5ZG9jRkVsa1Nq?=
 =?utf-8?B?ZFJaMDdkTndreGxacXhyRnZDZndQNUJzeWl4RUtjdXltWmp0bWRTdUR0OVNu?=
 =?utf-8?B?dG1rT2V5SStVTUlxY2FXdSs1V1BxbG1CVGFiNkkxSm96Yk5yTDltVjFkRWFJ?=
 =?utf-8?B?dDRlS1RvNnBoUmhIYW44UU5xN3prN1Y5U1RUS3JxbFp4RTYxcktDdXRMY0hM?=
 =?utf-8?B?K256Y2x1VndTOU1LZkpWVFVob1R3clBPK2RoLzMrZHZidWI3ZktpSGs0cGZZ?=
 =?utf-8?B?WmVRSUpzVDVBSGpxTndXM3ZIZEpYK0hVakZHVGcwNEFJNlBZT0gzYzFYNytG?=
 =?utf-8?B?N29vSU5mVGsyN2I4NC92NjJHejRVczlrckVRNWVpTXBwQ1c0VlpRZjJtZmFN?=
 =?utf-8?B?b0RUR3ZhekRjZmQ0aG1wUzI1RnoxRy90T2RoS1BLV3hPMHh0Y0pqUFYyVHc5?=
 =?utf-8?B?QTdVTld2ZWM3NlZRelI3VllRRzZlYTNoSHNPbE5KM080MXpLM0hsRHI1MENy?=
 =?utf-8?B?TG4wWlc4V3FPVVhwaEtTelo3NEI4UXQzbmdiYm50WFpDUUsvQWxGQkx3MDVs?=
 =?utf-8?B?VVgyWHlWY0JPbFhrRnRiaisyOVhUWng5dXEvVGEvUVh5Zm14eC8zN29yUHF1?=
 =?utf-8?B?TzBaTFBtS0UyQThpZy9jaEdBWGIvOENDakRTbWlRbzNOdE9wNC9oWDdZU1Qw?=
 =?utf-8?B?SXBmenBSRy96VklWWGVPREZIRUNYRlcvUmVPVlJwVTFiU1FON0xBWitGaU91?=
 =?utf-8?B?SnAvMndQanhVclNYWXFxSWZvRGtBdWxoM095STRMa0pMc2RBYlFnOU9lZWIx?=
 =?utf-8?B?cHQvZUMwcUZUdFZRZGp4L25OOE5JZHMvdkpQZmVyTHpCTHc3SW41UFl0T1pY?=
 =?utf-8?B?TWtkbDd6V0c1WUcwY1Zjclk2MjRYeElwNm5nUHhOWG5oTG9md1FQa2NEM0hy?=
 =?utf-8?B?c2dwVnk3clR0L05EVnRVOHRSemN5dnBsQVpYWk1Yd1JQLzdqSkh3QkNXWUZT?=
 =?utf-8?B?VTl5QWZMUkRWWFg3TDIzWXZ4MlpBVmd1T25HVHdUZ2wvbFRqcWU1bkNIUDAy?=
 =?utf-8?B?ZzM4NXQ5UkE5VHhqaXZ3a2RZYmFjSXh1MnM4Y1RZZGg1UDBSa3NGUVhnZzZC?=
 =?utf-8?B?SnZZRUh3NDR2ajZ4WU9LTXg2dVNMS1ZwV3dETWpoZ1hUa0tmdXVPRXJPb1pY?=
 =?utf-8?B?TEVndnY1MjlwYlJYK3lDYS95aVNjVVBRZHZvYzVMOFludHpsVUNVS3hhc2lw?=
 =?utf-8?B?bjVVNVdGSzcydms3ZTgvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUV2aVFiU21sVVRwVE5GbFNpQjFkK2hpcThUYTArbVNmbno2ZWgrWGZteXEr?=
 =?utf-8?B?RWN4YzFCdzNlT01JRjhGUVBaRjFoRWUxdTZ2RXJGbkVwV09HN0MvYjFjUWht?=
 =?utf-8?B?YndHK3BhVEVRY3BBSjNGNWMzV1JKRGxjQUhBQUkvMUpLTFlINTJTN2crMkxn?=
 =?utf-8?B?OUxwbWI5YzdLc3hGT3BWdUt2UFgvc2N6S28rLzJIU0tJVzlBeHdpWmxVazRh?=
 =?utf-8?B?Q0kxbFB6ZUpSZmhLbzRMV1BUSW5YQWlqc0hRaDVnZkh2VDFrclh0OGpwaGxl?=
 =?utf-8?B?amYrbUN0SjZyazkxcHVheDlSUjlvM1pLREpYd1RZUTc0MTNXMFhqQjlHWHRR?=
 =?utf-8?B?Q2tUZG1iaHpFdWY2ZEJJZzBKQlJpVy9KdVp2Q3Q3QUxmY2pTdjdZVHcvT3h0?=
 =?utf-8?B?Wk82OGJNdHFZYkNyWDZGUGZ5bUdoY1YyVWR0UU1PeVA5RjR2WlM0dDJOR25Q?=
 =?utf-8?B?SDBHZnpHc1JoVWhVa1JKYktjeGd5ZmUwWUFzUHhUa1h3a2RUTzU2c3NrKzJm?=
 =?utf-8?B?bkRvUy9WVG5nRlUyc3VrcE5JazZwSGlDTGJvUDNVUFZGNTY3SGduci9UU3FL?=
 =?utf-8?B?WElmMCtXcHpIbHY5NVVVbWw0V2ZUVlE0SW9pV21BSFp4emxRT2dPMkw5YWl4?=
 =?utf-8?B?SEZ2cXZGWGlySkV0dVRYM2VJL25yK0RjYmttc1czTjZvaDgxQmNUV1hHV2ZS?=
 =?utf-8?B?dElkQWVHaFRQcnVYZy9qcHdtQzkvdHRMbUh1aloyNTN5U3U5ZGNqUlBSYVJQ?=
 =?utf-8?B?QllQRjAySEQvZW8vSElGS0JHVmx1WjJneFJkdS9UVEtRSHI0ZkJhY0x6YXMv?=
 =?utf-8?B?TVJQd3B1Wlk4c0NKUXFodVh1MWxzbDdqaFRZdXBNZGdTeUt5Z0VoZmF2bi9p?=
 =?utf-8?B?Szd3NDBCd2FpZHJIbHhGU210VkNoYXVYRnMxYzZPRjNxRytwSHoxWnVJU3Mw?=
 =?utf-8?B?bGRPa0JLT0VlcDFYb1IrSnJTQklOdXUvUWJkc0s4Z2tLRGJ5WlNybmVOc21v?=
 =?utf-8?B?V3ZFS3U5cTVKKy9DcFlQYmJyN1hueEhMcHJjanZ0UVF6eWlvazhZVmpHSkxI?=
 =?utf-8?B?ZHB4OEpFK1NpZStLdjd2aUhrYWM0RzVVNC9BZUxxL0J1NVAvS0VtbFVDMmhy?=
 =?utf-8?B?NlR1OHBOVUt1MUY5WTVyZnZ5WVAxU0hieTMrUndvR1doa1hCMDFoTSt1NTZi?=
 =?utf-8?B?b0RQeWY0cjdHRXJHU3p4OG5kdVV6UTZQVW14VXNxTWZOYkFIRFBZb3lNZXpm?=
 =?utf-8?B?ZVlVbjhXajUxNlpLY3JuTXlHWU51VGZHV1hUM2NqNzg4NGI5TVVUU3A2QWZu?=
 =?utf-8?B?ZW9WMnhMd25IaXpRS2dCZk1yZUN4NFBTSWtsZFFodnlGVVBtY0d2ZkZGM2k2?=
 =?utf-8?B?Z1ZmdDZFWTVJbjFpTTBETTk2WW9URk1oREVHaW9mUHdQa1NNZXp2YS9HR3NV?=
 =?utf-8?B?aXFUMTZhdjFmaUEzWHBMaTJJTFFhUEVWQXdhTGJzNVBSd0pubHF6WXFqR0xP?=
 =?utf-8?B?amM3S0I3R3ZaSENMOHFjUksvMWlaTmNhSDNHL2RqYVlMNjh3U1YzQU4wWnJ1?=
 =?utf-8?B?OEdjRnVadWFrRkR6OGgxbUgwWElyRGptNXYwVFQ4Y2xsRFcxSG5LYVAxN0tx?=
 =?utf-8?B?aGNIaExmejdSYWJKV2xid1VCcHJzTmp4ZUVVWTJBK2YxYTlHcEhuUENLd1Vy?=
 =?utf-8?B?QmcrUjZLcU95ckpBNUxuR1RER0xiMEcxWjc2Q0Z2L1J6czkxcUVtaklkRjBH?=
 =?utf-8?B?eENCb3o2VmZrOEQ5L0hub3dSYWhJUVFuS1QvWElkakk4aXVkOEtkUmt4dlhZ?=
 =?utf-8?B?MjV3SUpLanpPN3JUdjF4RU14VVkwZnBPZnMzMkUxSDMzdnNmTmoydU1kVVpl?=
 =?utf-8?B?ZWxGR0tEejM2aVFqWVFWSllpYlh1ekJtQ2FKVDhiNG1CZlhQbXV5WGJKM2Yw?=
 =?utf-8?B?ZUw4MW9oQjdzektacTF6TVdnaVNTUzdaUUtycTVvUXExcEp4L25sWlJUOFV0?=
 =?utf-8?B?dE05RUFlYzFJWHpsRGlVQVVSNWdmaVpMaUgxNmNDSXVpTEw4bTFSTWdqQmJN?=
 =?utf-8?B?U2luTk1hZHF3anhHWnorWThrMVV4MlJUcWlhUGQwS2RaVzdJKytpNzB2UVZE?=
 =?utf-8?Q?JJEEI5Feqo3uQaDGi12n9aguT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b96ae0-9c73-4b99-db5f-08dcad7b9e53
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 14:02:43.1666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnDVxdoulOz/rL+FSXt5drI6EZhj9m2odfitepQ9ZhhUTNrH9K1NBc6FUB3MgtkdkdOUn5Dxz9L1tglAHsyIOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527
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



On 7/24/2024 8:42 PM, Jani Nikula wrote:
> On Tue, 23 Jul 2024, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:
>> - Add a new start parameter in trim function to specify exact
>>    address from where to start the trimming. This would help us
>>    in situations like if drivers would like to do address alignment
>>    for specific requirements.
>>
>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>    flag to disable the allocator trimming part. This patch enables
>>    the drivers control trimming and they can do it themselves
>>    based on the application requirements.
>>
>> v1:(Matthew)
>>    - check new_start alignment with min chunk_size
>>    - use range_overflows()
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>   include/drm/drm_buddy.h              |  2 ++
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 6a8e45e9d0ec..103c185bb1c8 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>>    * drm_buddy_block_trim - free unused pages
>>    *
>>    * @mm: DRM buddy manager
>> + * @start: start address to begin the trimming.
>>    * @new_size: original size requested
>>    * @blocks: Input and output list of allocated blocks.
>>    * MUST contain single block as input to be trimmed.
>> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>>    * 0 on success, error code on failure.
>>    */
>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>> +			 u64 *start,
> Is this a pointer only to allow passing NULL as "don't specify"? It's
> not used for returning anything in *start. Maybe it should be a const
> pointer?
>
> Not the prettiest of interfaces, and the kernel-doc does not reflect any
> of this.
We have a plan to improve the interface and add multiple block trim 
support as well.
I will modify in the follow-up patch.

Thanks,
Arun.
>
> BR,
> Jani.
>
>
>>   			 u64 new_size,
>>   			 struct list_head *blocks)
>>   {
>>   	struct drm_buddy_block *parent;
>>   	struct drm_buddy_block *block;
>> +	u64 block_start, block_end;
>>   	LIST_HEAD(dfs);
>>   	u64 new_start;
>>   	int err;
>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>   				 struct drm_buddy_block,
>>   				 link);
>>   
>> +	block_start = drm_buddy_block_offset(block);
>> +	block_end = block_start + drm_buddy_block_size(mm, block);
>> +
>>   	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>   		return -EINVAL;
>>   
>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>   	if (new_size == drm_buddy_block_size(mm, block))
>>   		return 0;
>>   
>> +	new_start = block_start;
>> +	if (start) {
>> +		new_start = *start;
>> +
>> +		if (new_start < block_start)
>> +			return -EINVAL;
>> +
>> +		if (!IS_ALIGNED(new_start, mm->chunk_size))
>> +			return -EINVAL;
>> +
>> +		if (range_overflows(new_start, new_size, block_end))
>> +			return -EINVAL;
>> +	}
>> +
>>   	list_del(&block->link);
>>   	mark_free(mm, block);
>>   	mm->avail += drm_buddy_block_size(mm, block);
>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>   	parent = block->parent;
>>   	block->parent = NULL;
>>   
>> -	new_start = drm_buddy_block_offset(block);
>>   	list_add(&block->tmp_link, &dfs);
>>   	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>>   	if (err) {
>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   	} while (1);
>>   
>>   	/* Trim the allocated block to the required size */
>> -	if (original_size != size) {
>> +	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>> +	    original_size != size) {
>>   		struct list_head *trim_list;
>>   		LIST_HEAD(temp);
>>   		u64 trim_size;
>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   		}
>>   
>>   		drm_buddy_block_trim(mm,
>> +				     NULL,
>>   				     trim_size,
>>   				     trim_list);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index fe3779fdba2c..423b261ea743 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>   	} while (remaining_size);
>>   
>>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> -		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
>> +		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
>>   			size = vres->base.size;
>>   	}
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 2a74fa9d0ce5..9689a7c5dd36 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -27,6 +27,7 @@
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
>>   #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
>>   #define DRM_BUDDY_CLEARED			BIT(4)
>> +#define DRM_BUDDY_TRIM_DISABLE			BIT(5)
>>   
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   			   unsigned long flags);
>>   
>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>> +			 u64 *start,
>>   			 u64 new_size,
>>   			 struct list_head *blocks);
>>   
>>
>> base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b

