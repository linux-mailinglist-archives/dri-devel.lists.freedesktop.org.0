Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE333A9BDE0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 07:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175A010E291;
	Fri, 25 Apr 2025 05:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZFNE26Li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4622B10E7A8;
 Fri, 25 Apr 2025 05:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpSjmVLADnNZz4Q0/mfulNTvUcX8cKLaupmApcDKJ+9qbKi9zZapXGzrqymAn6gV+yD0R0YJqJcnlxy5oqwgGvHms5eAcFJ6oYqV3e5b8YzDKfqMA3C9zbZ8QwUbA0fF/Zp5txeUz+aTMqAmOzRZJ92z3o/adQouquNahw+J/Wehz/UTs3ifLgTHNxj5769+adfwSmR6AVVkkcMJcpn9ikFmB2Iesc9+Tx1vCQ92WG3/W6x0MdyJ4c0tuxtjxDSzg6tGbkDrBm0k2ItbdjsdPmnIDuHX6HFXcT3dgixGlTRSFiSLHWPFXT8oypSbTiSHDRT/HTIeamr+grWNegXVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nILTaDqATYVaJN7jzgfUC1KIVk6WvEY8Obl1aHvmGjU=;
 b=djq9DUFT6uZ4NsPkjvRy6JgzrKAhKbFzL+wWPHKQVPgAQIL2TDCuVrN7+2HW6LRX4oA/CWynTUmKPlMYwYLAe+1ZxyiCBcgabDf7Vt00Gn3CTJmhqnkulivCpxtsejPDzpJfIHaTRBe/dDFauCbIRbDLYdihIU7oVIxGXIT+Ofy4G0q5eta32tZnQXef2YWaDREEsUBSH3lWZHRN9sx7Gze14/DZARqoGcVm/Jt62bwDUXQsEKn1bS3eR5YyCZsrHfr+ZMy6pPS1TZT2xnHrAEqZGi2W4G/JntLKGnDriJjxIanXnAYMdg2U+HVEE1jEqNaa1IEs4n4TPjcbbXhYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nILTaDqATYVaJN7jzgfUC1KIVk6WvEY8Obl1aHvmGjU=;
 b=ZFNE26LilZN+ntzqHwznOssfJcGd/V+dEGdp2mn83U3DYgg9acZrb50revhcAX3IYpX4HOJDTVS7IB1WBd9n4RaUV3576O4PlvITgbuGxrCmpVgTfubnxv6wfny6EMy6Ney9kBs/QIWgDMo90mWOu6N8YUBl3DOl5mfLROSKthU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 05:31:13 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf%5]) with mapi id 15.20.8632.025; Fri, 25 Apr 2025
 05:31:12 +0000
Subject: Re: [PATCH v9 10/10] drm/amdgpu: update trace format to match
 gpu_scheduler_trace
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-11-pierre-eric.pelloux-prayer@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
Message-ID: <53b5bc09-5dd3-c34b-c696-34de1773f369@amd.com>
Date: Fri, 25 Apr 2025 11:01:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20250424083834.15518-11-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PN4PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::15) To BN9PR12MB5052.namprd12.prod.outlook.com
 (2603:10b6:408:135::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7c98ef-2ac1-47aa-2d86-08dd83ba63fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1pQSzYzaU9aYk1SRmJPZ0ppbFRoUjBHZGhQL0U3ZktRNE9hR3o5VjVnL25W?=
 =?utf-8?B?STUwYWNFTnF1NFlrZ3BHRUw2b0hienZGOUhraHJmT2tJWDlkdmI5NTFaK3dr?=
 =?utf-8?B?ekpQSlluVlJwSTFoZXpOcitLcVVNd1ptMEdCb1ovb0RZT0pha2prSjlGc2Ri?=
 =?utf-8?B?SzBpQTRkYlpjZ2dLQXZjU25IRnF6TDlIZ0phRHhDZmNPbjdyTk9vQjdPQUdz?=
 =?utf-8?B?cUd5eW5sUjhmbDZQdHZVRy95ZzFmSC80VStRMzN5eFlyVjgrWjVIT0F1MSts?=
 =?utf-8?B?bmUrZlBhbUM4cDhXSHQyYXJ5TkdBMlhJampIYVg5cURYQllmSlFBM2svckc0?=
 =?utf-8?B?ckRidjFXTk1OQldBdGFucmd0eGRaWlo4U1Z0dEU4NHdwVHh0WkF5enlNWkhX?=
 =?utf-8?B?OFNPK1pwVE5FcnhIWHoyNEc5TWwraE1McHU1SzF5eHFjbFVEdmpEZDRqMmto?=
 =?utf-8?B?dWxYekJtN3JucUVTUUlmUXdkMDN5dk5Dc2c4N2huS2FoN256ZEwxOW1FZlFm?=
 =?utf-8?B?dUx5N0NEQzJpbjZ0WDNnY3RkRjgwNTNzYzhreURGcHhwaDA3SnFPQ2NHa21o?=
 =?utf-8?B?dXBYRERrRTV0VnZuRHM0RGovcEV4M04zQ1hIYkw4M0s5b0lGK2R4bzJEcXFo?=
 =?utf-8?B?SGwvQ1lublBZZmlhUXdTaTlwOWJYOW05cWU5Q1VWTjltOU00bzN1Q3l3WXlY?=
 =?utf-8?B?Rm9xTVRwS3BEZkVSUm52SmJWYlRwK2M4dDloUGdCMXZlcnU5ZGdTbGR1byta?=
 =?utf-8?B?QnFiazlENDE0bVlqdVdRMFB5WEozYWVaaml2cG94eEhxbjFsMVBLMjJrYkJy?=
 =?utf-8?B?ZDI5T0J3bXZFc0s3MUJNYXZDQitSVUxlRHRsa0pSN3JhUGpvQ2ZSUVlndmYr?=
 =?utf-8?B?ZUVwaHJMb01iVmdUN0pib3lQTVl3RmRDelo0Nk53TDZ3bm1kKzJ1dHdXQnRp?=
 =?utf-8?B?d1ZORkV2RXJscExldmYyL3FkbzJtdVlYNGhSekxWclNsMzg2Ykl1cGxXU3NE?=
 =?utf-8?B?S09RN0s4TnVWRDVPS2owa0FaMXMwSDVFZ1ZVS1UyUjV6QjRSdDVucEFuQXFV?=
 =?utf-8?B?T3N5Zi9QZHJKcTliNElpRFk2OTNmMGhxdzVoalVCb2M0SUd2eG81Wk55akRq?=
 =?utf-8?B?aEc3Tll2bTZEUUIvUVllcnphcWxjdFV3Q2p1NGYyNmQwQm9zNVBSV1F4T3p2?=
 =?utf-8?B?c0lFVGVuVzJsdE5oZVhZeDBGWDlRQ0FFOTVlczJHRzd0eFR3TWxreENEaEZh?=
 =?utf-8?B?SXBOUmFQdUJEc2tCN3JwOGp1VjhUQSs0VjV0Nmg5YTMvWkdyNGJlOWVqMHVG?=
 =?utf-8?B?Mld2alUydzU5U1RaTnRSNmsrOTNITXpMSU5mTVBib2Z4ZU5CUVRGalpnSVBu?=
 =?utf-8?B?NDVtb2JjdGVkU2NXUFdXYlRQNkhpNmJWRCtuemx3YzU3M01LbTB0dnE2T093?=
 =?utf-8?B?ejVzVGNmdzVUWjZ3Mi9YYWU3WmNkdTJ3U2VkWWlKd0h4a1VISURWY1BjcExp?=
 =?utf-8?B?OGNKcnRmVTFtUTZ0cmc1TGZ6VjlDdlNjUmdHMEM1TWJja2VZV2V3MC90R1g3?=
 =?utf-8?B?UW5MWDJSV29IdEpJTmRwbXYwR0R4Ukh5Zm9GbEExTTgwWG1PZGx6UEl6N2hJ?=
 =?utf-8?B?NWFuNXhpQXNnSUQvcHBPR2hrNk1SUlFsMElqY2ptQitnR0U5WnRXeWU4SzNP?=
 =?utf-8?B?aG5DSHJLUzlDTURwUzQxMGhCdkQyeENaL0x3N242N0F6Q3h1bGt2cVhRYkZU?=
 =?utf-8?B?WmVoSVI4VTJ6bG1NL3NNd0E4UkloMHFDRXBlK3prU1pLVFgxQUsvUGx5Zkxk?=
 =?utf-8?B?YURVNDJhVHd6RXdPbVFuRUwwNHZzVWU5Tk9UR1NmRnJlTEFNeXk3eFVDNURJ?=
 =?utf-8?B?SVRHOFpXUGpOTHpQZmlOWDNkN2FDSWUxdllHSS9ZMWVOdzB2VlhCaXIxOUFz?=
 =?utf-8?Q?M1NsV3OdBzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5052.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTdoQ05xRWNKd1NZcUtNOG9FU08vK2ZFUlFocGdmeEs2ZUN4MnNzYVdKM3Zl?=
 =?utf-8?B?YmFtWWZnY0N4M3RwdU9IOWNhYnZQNGo3dHYvbzZyNzVHbkIvb2lXTDVsQ1hH?=
 =?utf-8?B?NzRuMkg5UzU3NkszckpYd2cxSldFbzZ6c0l1TUd6REtVenZvOCtOclVIS3do?=
 =?utf-8?B?SXZGZnFFSmk1TGoraEtPTloxWVNCN0l6U1FWaEdiNjR3RHFMeThqTEJTVGpI?=
 =?utf-8?B?RGs4ZzBCa2NLVjIzcldLYXgvdDNLNEQxOUdNcXZJQ0ZScE1zTWY0WU1KZ0JT?=
 =?utf-8?B?d1FLR1JIWDNFOEloZFM0ZEd5Sm5jelJGZXI4ZU81WityWjNBaTJqREJYZldM?=
 =?utf-8?B?Z2ZjQUtQdEw2bnlsRzRBeHRMZENoU1NjaldYekxMY0lqR0wvVzRTNFdJTUZm?=
 =?utf-8?B?TkxxSDZQMVRSMk5DVGFORlU4MEpJUG1oeGlWTHJ1aXRKclNaMFc1UGVJVmF0?=
 =?utf-8?B?SVQ3blVDM096Qmg3ZDBOcmtJdVJGUGJUYnJ6NytEKzE0TDRrYkk4dTJqWFhP?=
 =?utf-8?B?d012bGpGSEFZYm9peGRJZzArSVZYbTZqYjFRdEZtWHI5b2o0OHhMcTBVUE9T?=
 =?utf-8?B?bVhEaHdnYnFXS3ZVa0VIa2R4MHBNUDBHa2s2dmhTRXo1VisrMWhsSmJZZ3VY?=
 =?utf-8?B?SHRFT1VoZE55SGVZUnVULzRkS1AwVlZ6U0tBK1k0SGJLcmx3Yld3TnhmblBu?=
 =?utf-8?B?ZEZWdmxGbUpiVVRKbGUzQ2l1dTFIcFZpell1aDBVdmhhTTM0ektMbGdPOGt1?=
 =?utf-8?B?SDN4WkdqNnhSMUoweUJZV1pwRmd6dmNiTWJ1dmNpQm1zdkF4ODRYR1drMGlW?=
 =?utf-8?B?Y3VlZlZpR2MxU3dNY2lHcWNjaHBsL2Zxd21XaWdhbUd1UW9rc0FRdnh0cVl2?=
 =?utf-8?B?L1E2aUd2Sm5wSUE0TTMwTnBSNGVCWnBpT21WdStVellIaTRQc1QwTWwxZVIz?=
 =?utf-8?B?YlpKWnZRYytCNkt5NEpWcURRbXJUYXVFZmRVQXAyWnpjQTU0QkdaUjl3VUtJ?=
 =?utf-8?B?a1lZU1R4a3VSTldsZEQ1b0R0dExRYlprWDZzbjY4L3l0bFQyQlByek04TlQ5?=
 =?utf-8?B?cnp1M1JEekNSS2FnaFRaU1dRSzlmTlJIclVRSUZwR084U1JXVVZEWmovYzQy?=
 =?utf-8?B?ZDdSczVlUVl2dTJJM2hKL3l3emVURzNicGxUUUxxZEE1V1MvTlhmOG8xanJI?=
 =?utf-8?B?WHQ1V25Zb2xRNjlVeGRaVTA4eGc0MFhHV3hpWVIweTBHdEZTQ2tLSXYrR1R6?=
 =?utf-8?B?Q0puL2w5SkZGelZnajB4bDZrc1MyMzQ2WjNBUlJDZjVPNFFRZ3VHak5LVVN1?=
 =?utf-8?B?V1hhMFdFNy9MK3BWbTJ0VlAybkpxVzFCcnRhSmhEZmFmVEYyS0ZzL2puR0d5?=
 =?utf-8?B?NXBkQVY0bUsrQWVNT2s1WTRDZWR3MUZhTisyVDhIZFNhNkU0T21CdWkvUFJ0?=
 =?utf-8?B?K21ydUxCRGE4NGphSk0wMFliVHNoY1RLaWtDL2NkVG1kUGpqYkZNbC91dzZw?=
 =?utf-8?B?UkdiTkRTeFlaMlJjR0hUZjU2NkxKWEJUZHBST0s5TTZZRytYR2tqcW1XZElt?=
 =?utf-8?B?eVBqS1k4NUh4alZ6bUZUcGJITzlaSVlTd1d3UlpkaFJxZXRRRy9QUWt2QTll?=
 =?utf-8?B?UkZkcXAxeFF0WGRzMEpDWHMvNmtGMlJlRkNEd0F1SXhVQUZuM252allYa1NX?=
 =?utf-8?B?NTlJb0VWNjV4c3lCeTVKQ0xYUS85V0hXOVEzY2gzaG4zblZORVdhWEFEK1o5?=
 =?utf-8?B?MHZrcXBMSGVQWmt4VEhheWsrYkwrSnhrNVQzbVZLUVJwM1czTHBSTFE4VS9X?=
 =?utf-8?B?OE9SSi9mdjN2enBaS0l0d0NMalM3cnFoWXpDaEZXdzhpTGhDWHlpZWNtMWxz?=
 =?utf-8?B?RGVYak1PN0lPVTNuYmtYSDN6K0tpck5hY2xJQmE2a2dSZGRIZEgvc1VKMXlN?=
 =?utf-8?B?SDZneUdyTHVHUkVuYWhwV08vbDVjbXkzYWkwc3FNUGhNKzRYWDlMLytYR0dE?=
 =?utf-8?B?c2xLdWx4UzkrVklqc0V6aGQrY00wczMxc1B3eGc0UmtiQUxWZWtLaDRYRWRi?=
 =?utf-8?B?bEhxczVnMWRHOE5KRHAwZEFzMk5XSXVjRUFVeStWVTlGMjgzTzNOWEZnTS9E?=
 =?utf-8?Q?aLF02Lp4G4ZUGycTO4SAtkuaC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7c98ef-2ac1-47aa-2d86-08dd83ba63fa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 05:31:12.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKe7/vaCOIuLXiJcOZOYz0CQUE1u3h5n94vp2eiqHLaY8/3MIpBVqxfJ3VSxqGd6YK1rOigAH3yhxPzs4Hx88A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797
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

Reviewed-by: Arvind Yadav <Arvind.Yadav@amd.com>

On 4/24/2025 2:08 PM, Pierre-Eric Pelloux-Prayer wrote:
> Log fences using the same format for coherency.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 4fd810cb5387..d13e64a69e25 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -168,8 +168,8 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>   	    TP_ARGS(job),
>   	    TP_STRUCT__entry(
>   			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
> -			     __field(unsigned int, context)
> -			     __field(unsigned int, seqno)
> +			     __field(u64, context)
> +			     __field(u64, seqno)
>   			     __field(struct dma_fence *, fence)
>   			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
>   			     __field(u32, num_ibs)
> @@ -182,7 +182,7 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>   			   __assign_str(ring);
>   			   __entry->num_ibs = job->num_ibs;
>   			   ),
> -	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +	    TP_printk("timeline=%s, fence=%llu:%llu, ring_name=%s, num_ibs=%u",
>   		      __get_str(timeline), __entry->context,
>   		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>   );
> @@ -192,8 +192,8 @@ TRACE_EVENT(amdgpu_sched_run_job,
>   	    TP_ARGS(job),
>   	    TP_STRUCT__entry(
>   			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
> -			     __field(unsigned int, context)
> -			     __field(unsigned int, seqno)
> +			     __field(u64, context)
> +			     __field(u64, seqno)
>   			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
>   			     __field(u32, num_ibs)
>   			     ),
> @@ -205,7 +205,7 @@ TRACE_EVENT(amdgpu_sched_run_job,
>   			   __assign_str(ring);
>   			   __entry->num_ibs = job->num_ibs;
>   			   ),
> -	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +	    TP_printk("timeline=%s, fence=%llu:%llu, ring_name=%s, num_ibs=%u",
>   		      __get_str(timeline), __entry->context,
>   		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>   );
> @@ -548,8 +548,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>   	    TP_STRUCT__entry(
>   			     __string(ring, sched_job->base.sched->name)
>   			     __field(struct dma_fence *, fence)
> -			     __field(uint64_t, ctx)
> -			     __field(unsigned, seqno)
> +			     __field(u64, ctx)
> +			     __field(u64, seqno)
>   			     ),
>   
>   	    TP_fast_assign(
> @@ -558,10 +558,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>   			   __entry->ctx = fence->context;
>   			   __entry->seqno = fence->seqno;
>   			   ),
> -	    TP_printk("job ring=%s need pipe sync to fence=%p, context=%llu, seq=%u",
> -		      __get_str(ring),
> -		      __entry->fence, __entry->ctx,
> -		      __entry->seqno)
> +	    TP_printk("job ring=%s need pipe sync to fence=%llu:%llu",
> +		      __get_str(ring), __entry->ctx, __entry->seqno)
>   );
>   
>   TRACE_EVENT(amdgpu_reset_reg_dumps,
