Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D72AFC3EE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD0A10E5A6;
	Tue,  8 Jul 2025 07:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HYG2h1+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E127210E15F;
 Tue,  8 Jul 2025 07:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sc7nVfxhxnZgzSya+Jo9nMYaysv2kZ3VxaXmgmhGyZSSYgHtokJFwB1wwoqXGBcbxB5OminSH3qfqhYYDgX87XNr4PKyu3R0rNhnEEfDuN+o9i81y0UJdray2NFKRmw4WipY03pu8gVLhF6lqFOI5TQehoAExGUgEyd1l0F6tXykOw+E6DpfMxuklIZy3we8cFbLtdZevzyFN8Y7NPCLCmYMwcX4nrm55xdyiEbr9IxX+cWD/dVE2vTlgnQWxixV9hz1NgTGW4INNsM1MatsagfLwPhCNvoTAmG10W2Aom1VMDg5ILz00gRQRNUdkEjYK/t50cuinc+onjT0SoHKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulNXThYv1QJerkVDfHWfc/ELa3mm4zw0AaPduVlzmLo=;
 b=XSwVj2QLJOZ9OoML80tCSm9B0Ig1p1QTO7fVRgt1ZwtvKtAoVURG7ceqQhOxoXW5xRF6wvcFrElclWixkbF138dICn/knr8f5ADEu/wHseSMSeuQLYmreJj5fuLDq0OvDxG1JuZVxJ9MiWmpMtb/oTh/tN8QaePTXL1Bp8gWruO5MQ5D4Aacxu4Inbl2uWbsDlwBgS0hN3PePGzo6Wygy4IwDU9e43es0xzF8a8ZCExzzZwq5PThTk2owJSvdysmz8JyAov3wszG0waUZO0ML+7P7B6t9SOguVipATo/WxI/memvPOd67/9KCUgp9TfrofVFPWQ75sfV+NsveXlkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulNXThYv1QJerkVDfHWfc/ELa3mm4zw0AaPduVlzmLo=;
 b=HYG2h1+saLlNGpQVtHk38zDwCrxHc+KGFOmVJn41lh2TeN3voo7NyaFK32aAlaHELNGFim5pKZPSjizfxgJcJXnm7OwbNt9Rdj6F5+ymjZDUjzMEM73Az9VhDKrjFd6Vsud8fDnjXy1kxEIC88mk8TLj93EXPcAOI8Ajz/WLueM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 8 Jul
 2025 07:23:31 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 07:23:31 +0000
Message-ID: <6361f2a3-5815-4b84-8600-ac1649c3413e@amd.com>
Date: Tue, 8 Jul 2025 09:23:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
 <20250708065404.4185-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708065404.4185-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::18) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b3e4d5-7281-4ea3-7c64-08ddbdf05773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU9FeXQrRGhWa3c0S3I2eFhBcmlmN3FkZWc5aFJOVGRZRDJSVzY3SUJ5SXZy?=
 =?utf-8?B?YjBveGsxUjVJWWpYRVRYeVVBMEJZcGtibVZTV0g2YUJrY1BVM3Y0YUFpczVl?=
 =?utf-8?B?S2hFMldNVG9SZDg4bFdHWEZXeFFHa1FDM3hiM1oyQ1VsTXBNSE9nRC9SUkZR?=
 =?utf-8?B?M2JCYW1BRUFTTnJXZ09HYitDbnBNV3A4cUY4RFYyaVpWK3ordGZBM3lHM3No?=
 =?utf-8?B?VFBjanozdnhlbzNaeU4rWlh6ejZDRUtIdXJVQXlTSHZmcGVuSlpmdjN5TUtH?=
 =?utf-8?B?Z09aYzNnQk9tbThmWnIvYWcxODZuWXRPN0V5MlRYZlluWWd1ZEdDQTMrQ2ZL?=
 =?utf-8?B?Y0M4QThhVWFxRzRNMmtCUHdqYVAzM01aMDhENGVmaUhwWlBRNm04dnFnOWVH?=
 =?utf-8?B?bUFIZnZJTmxQUjR5UE5yOGkxT3lRUUpNZzJrTUJhNjBOZGhiZzI3dXV1Mzc4?=
 =?utf-8?B?UVFPVHFkSW1ZV0xnNVM5ajNMbjhrQXA4dzZTTlJEZFBYM1NGbE9IaWZsWmwz?=
 =?utf-8?B?MjJzeTArOGNOSmhBODZoRVVlQXZBV0dxdkZHTTJVcksxWmFFaFVUajFqdnhG?=
 =?utf-8?B?a2Z2MXR1aVNEM3ZwMlRRM2xnaHFWRHlvc3p2MWpGU2R3TnhLWkxoN09kVXc5?=
 =?utf-8?B?T3lYM09Rdmc2VEhiNlJvMnY0K3BwYXNKNmFTem5LNGVtRjFyU0U0UngxdjVy?=
 =?utf-8?B?QW9xVGJDR2ExaVZKZHViU2xDcUliQW9sYmlNeTBheDJLcVJ3M0JUR05GdHZ4?=
 =?utf-8?B?TXIvc2prWmFXZWZsbm5VNnk2YytmRU5lSk5wSG9zT1Jrb0JjRnhOZjcyK0Vs?=
 =?utf-8?B?TldleUh4R0s3UkpFblhqU1ljRjJFYkNVSE4zUlhTNmQwQmR3WWE3UjNGcE5U?=
 =?utf-8?B?R1lHZEprV3JMQStLLzNLUU9Ga1FyUmtGR2NiQVczMUpLR3ZSZXZZMXp5Q1M0?=
 =?utf-8?B?KzR2aGhvWGhPa0taeHBmMlFGZFUrQk1PT3JYWlliN1lLUVUxRjdWWHFNTkFi?=
 =?utf-8?B?c21peUVna1pCWW1mcHRjaDAyT1hLbE9uOWpzRElrb1ltVWdvK0Z3WXdkREQ3?=
 =?utf-8?B?aEo1OUZ6SlZGSC9zZDdOdi9IUTBPSHNwdUY1bGZDOGhXVEFxZzB3VlVjNEFm?=
 =?utf-8?B?WTFNWFlLd0pCZkNJVkpRcW5YK1VHQWR5cUs5Rk5IK3dnczlNRW1Hb3IrbWJR?=
 =?utf-8?B?dDhqQXEvdkhmTUJtUjRXbXQ5anRxcVpYUmpURTlYcnU2blE2a1pmM001SjlF?=
 =?utf-8?B?bnYvY0ZNNjA4Y3ArNDFRSWx5aWRYdE5LU2dVeG1iTlhqZ0hvLzhUWGRPWUY1?=
 =?utf-8?B?cWcrSytnR1c5Q3hVcVJNWXNldUFJRy9pbVI5c3Y5SThKQUc5Q1cvRmVMcjB5?=
 =?utf-8?B?MHNWOVpNeVQrQ1hyVW5VNFE1MUZUbzRFK25Wa0hZZjdHKys5My9ZblRjMWxz?=
 =?utf-8?B?NXFBcTNBTCtROHFaNEtYWnF6ZzMralpWb3dUd1ZrWFNsZms5TEE1dTlxK2Yy?=
 =?utf-8?B?TDVDU01QRWJJTWtxdm1ORVhXRDQzL29OSENVaXFJNjg0TkJmalB5VHVxaHlx?=
 =?utf-8?B?Qy9mc0tHaWplRERXSXorZ2NoaFFPWVN1K28zMEVTRlcxdkI0L0F5Z2dWaXVr?=
 =?utf-8?B?MUZHd294azBFM0lwUm8xNTlVOEJVWXR0a3ovQzdSVlJEcGpZdTVDZnN0eFlT?=
 =?utf-8?B?UGQ0MUd2aUVOelYxOFkreVkwMGZsQmFtQkszM1pNQmV0QzYwODZOekRUM2Jr?=
 =?utf-8?B?bDl4Y3lYbnBEMGJFcWM2Y0s3T1I5TXAvY0Z6M2NXLytERDgvUjlZYXpQOWU0?=
 =?utf-8?Q?LfcAWJfy7iyBPu8fHXLVb6YBR/DqWrKvkOyWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TitvNWI5SDRRc0VnakhaU2VwWEFuc2RXaUJFS2ROUFNRd1daMTQyMHFDMmEz?=
 =?utf-8?B?L0RPOU1UeDJTd0REdWdZWXBseUpYQTdESEVuWHpWakp1OUtNdkJOdkdQSEVu?=
 =?utf-8?B?S0NCTllxTTNVcmdBMkFJaVBUY2UrSFA4Unp1OFBhUDRaUURQSjJzaXU0eGpM?=
 =?utf-8?B?dk45bzZ5WmZWOXpVbG5KRUF5cElHalVQNHZYcTJheGp4UTRaL3F6Rk1ybVNq?=
 =?utf-8?B?U3R1Ty9RWkNJWU1NSzF4OGVwRHU5dE9IQld4aXlXUm5KTnFvb0RrWEQ0eVFN?=
 =?utf-8?B?RG9lbWloMVc3RXd2MjgzNGlrSTJQNmUxdHZMRktWVGoveGd2ck81K0I4b2dj?=
 =?utf-8?B?dHp0a1JnVzRESFgrMS9SWXFJdFBFeFF4RjNBUWU2eGZ4ZUI3dGU3c3IyUTVH?=
 =?utf-8?B?T0x3SHJHTGxMYjdLaTV0azdDdXVvdkN0b3NFTEdzU0FVUWNJb0c3dW53RDZi?=
 =?utf-8?B?TVdDd2N3WXFhNzc0ZVd1QVhZVk80dXNjbE1NSzd4TkhleWZyOHExYXJyZWJK?=
 =?utf-8?B?ZDBmSXNMbW9Vb3FXN3NvbjloL3U0M2hmYkRRTlJOc3dVZGl3TngzYTdtSEpX?=
 =?utf-8?B?Y0xoaFNyVEgwRUVYVWpFaGxQU1QrSG1UcGdEalNrQmgvMllKZ3U2NTB3dUhh?=
 =?utf-8?B?Q3BqSTFmdjFrRkxnZEVnYmYvemxGTDcvbW50eGM3cVZRK1BXd3BWVWhEYlVv?=
 =?utf-8?B?c09CSDQ5N3g1ZzFIdEZBYmo3Qkl4U2toS24zSS9vVndBV29Ob0pvV05aOGMw?=
 =?utf-8?B?akU0UXl4aWpoZnRHNldJK2N2QTd3a3ZoMkRDZ0VaZithQzhBZDR6Yk9XdVFK?=
 =?utf-8?B?Wi8xOS9LWjEzSE1aVUNMazRDWGsxa0x3eVhiQWJ6TkJUUnFNa2JrR0hJMXNJ?=
 =?utf-8?B?MVRzSlM0SHZwVW1XSjVlQWc4ZTFrWVJkdjhpV005Q1NZRVY1ZGpDNmJDSGJo?=
 =?utf-8?B?bmpTdkJJK0NTSkhYQ0hTemRSZUdabkNkamRmcTZ4amFQRHoxenR2dlF0MVRU?=
 =?utf-8?B?Mm4xTHZLZ1JOQThaM0VOcTBsbk9DWDkxUEJCNDdqNEp4bmVYS1dXWDBYandk?=
 =?utf-8?B?WVFNdXpzTForNWViOWJRVWd3Wjk2b1Q1eU9NS0pGS2x2S0lyUXRTeElDN1FI?=
 =?utf-8?B?ZkNtVnZFQUJLQ2hYakRjNTc5bGhJalB3NnAvYXJoZ3l4UjNVVS8zVzBKTm5y?=
 =?utf-8?B?THJlT284OEpVRkVzY25hQUVTdis1cC81ZnJENldNSklENVAvSzhYbWJSSjc0?=
 =?utf-8?B?N21hMDBzS0ZVRnd1R2QwNlVtN1ZCNWcvM0xGZkgrcFJCMFlaanhEU2dUdHJ3?=
 =?utf-8?B?UXZuSlVNNmM0eHJpc3FoWm9QWnRiRzBrazllMnM1aEx1ZjJLMDRqcFdqYnRP?=
 =?utf-8?B?QlY0b0pUZElib2NLZnF4ZHJHQy9ScXpyQ2Ywamt4QXd6bklEYVBobWdESzJl?=
 =?utf-8?B?NU9wYWZNajUyVm8veGg5VzNaRVdyTVNsZ3A2S0ZMdkZkUktkVlRxTk5CQmUr?=
 =?utf-8?B?M0tnWWxabzJFZ3lGWU5vU1pVN05mZStaT3YweHlCVFIxbmxrS3VsR25jK1FN?=
 =?utf-8?B?NEJGR0dMZlgxRGZmK2k1QjZwNTJpcmxKSTFyeHl1QjhYeHVFK25RdFhHWmZx?=
 =?utf-8?B?RldOMGhGRmwyUVh4V0RidHpKNjhpdm5BK1V2d0RoTnRXcDN5amYyRlBWWFhD?=
 =?utf-8?B?cEl1NVZJdkloZGF4REFEUG9SVjdvWVJLdjFacG1LVnFjTnVoZ1B2SkgrODhx?=
 =?utf-8?B?RkN1VXZWbmllSERUaE9rQk02eHFVdHFQbXNIaFRSTlcwU0ZOeGFYc3N3UkFC?=
 =?utf-8?B?S2hJN0pZQ2dmdnYxS2NsSXlubVExaWpMZkhDNVNqOUk3cThQYWVGTDl1Z1hW?=
 =?utf-8?B?QjlCbEdRbUFjQlVPa3NOdUUzcGpRNFRFeHp5OFJZMHBxMWh5THZzZFlPNkVj?=
 =?utf-8?B?Vm9haHkxcWlzdVQ5WTJXQkd5YnJUajhMQk9FY1NyTngzN3pXbFptc1hvQkhT?=
 =?utf-8?B?RkR2K3lHbDZ2bEYzcS9IYjVaTmtzWVZoZXJHclNQNWI2cGxqbHA3Z1NVMWxj?=
 =?utf-8?B?dDNFTFVIWXNNemRjUDNKWGl0cHIyTTNrZjhvZ0o2UDJZdUdJVlNtNjExSElQ?=
 =?utf-8?Q?3yvkpo2YhNW5snEtvmjy3ezxd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b3e4d5-7281-4ea3-7c64-08ddbdf05773
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:23:31.4666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5KJanm7A7b1pDa3p3st5PALHY9gM0wZiSXk87vFOpOta8l3DrrxwWj/1o21a9U7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753
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

On 08.07.25 08:54, Arunpravin Paneer Selvam wrote:
> - Added a handler in DRM buddy manager to reset the cleared
>   flag for the blocks in the freelist.
> 
> - This is necessary because, upon resuming, the VRAM becomes
>   cluttered with BIOS data, yet the VRAM backend manager
>   believes that everything has been cleared.
> 
> v2:
>   - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>   - Force merge the two dirty blocks.(Matthew Auld)
>   - Add a new unit test case for this issue.(Matthew Auld)
>   - Having this function being able to flip the state either way would be
>     good. (Matthew Brost)
> 
> v3(Matthew Auld):
>   - Do merge step first to avoid the use of extra reset flag.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")

Acked-by: Christian König <christian.koenig@amd.com>

> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812

I'm not 100% sure if that really fully closes this issue. Keep an eye open if the warning we added in patch #1 ever triggers.

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>  drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>  include/drm/drm_buddy.h                      |  2 +
>  5 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a59f194e3360..b89e46f29b51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>  		dev->dev->power.disable_depth--;
>  #endif
>  	}
> +
> +	amdgpu_vram_mgr_clear_reset_blocks(adev);
>  	adev->in_suspend = false;
>  
>  	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 208b7d1d8a27..450e4bf093b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -154,6 +154,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>  				  uint64_t start, uint64_t size);
>  int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>  				      uint64_t start);
> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>  
>  bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>  			    struct ttm_resource *res);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index abdc52b0895a..07c936e90d8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>  	return atomic64_read(&mgr->vis_usage);
>  }
>  
> +/**
> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
> + *
> + * @adev: amdgpu device pointer
> + *
> + * Reset the cleared drm buddy blocks.
> + */
> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
> +	struct drm_buddy *mm = &mgr->mm;
> +
> +	mutex_lock(&mgr->lock);
> +	drm_buddy_reset_clear(mm, false);
> +	mutex_unlock(&mgr->lock);
> +}
> +
>  /**
>   * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>   *
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index a1e652b7631d..a94061f373de 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>  }
>  EXPORT_SYMBOL(drm_get_buddy);
>  
> +/**
> + * drm_buddy_reset_clear - reset blocks clear state
> + *
> + * @mm: DRM buddy manager
> + * @is_clear: blocks clear state
> + *
> + * Reset the clear state based on @is_clear value for each block
> + * in the freelist.
> + */
> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
> +{
> +	u64 root_size, size, start;
> +	unsigned int order;
> +	int i;
> +
> +	size = mm->size;
> +	for (i = 0; i < mm->n_roots; ++i) {
> +		order = ilog2(size) - ilog2(mm->chunk_size);
> +		start = drm_buddy_block_offset(mm->roots[i]);
> +		__force_merge(mm, start, start + size, order);
> +
> +		root_size = mm->chunk_size << order;
> +		size -= root_size;
> +	}
> +
> +	for (i = 0; i <= mm->max_order; ++i) {
> +		struct drm_buddy_block *block;
> +
> +		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
> +			if (is_clear != drm_buddy_block_is_clear(block)) {
> +				if (is_clear) {
> +					mark_cleared(block);
> +					mm->clear_avail += drm_buddy_block_size(mm, block);
> +				} else {
> +					clear_reset(block);
> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
> +				}
> +			}
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(drm_buddy_reset_clear);
> +
>  /**
>   * drm_buddy_free_block - free a block
>   *
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 9689a7c5dd36..513837632b7d 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>  			 u64 new_size,
>  			 struct list_head *blocks);
>  
> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
> +
>  void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>  
>  void drm_buddy_free_list(struct drm_buddy *mm,

