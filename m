Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD8B3FDF2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AE510E676;
	Tue,  2 Sep 2025 11:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WcetMnXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126A10E673;
 Tue,  2 Sep 2025 11:39:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgIjNT8UjH0M3ddwvuyTIjHtimvn3N8O6/7oxp3dfk0S7vSJDt0Hs8uMLdnZ+Zu43uOPgLzW9epjTvCM74FZoTdog2MCD5nqp5c6S0TuVJA5MJc4yzEPa/63Gnoeja2cqzP/TUPF3Rj7E8US5Gs7WhJB801Sc6RXfviJQmoRE4XZuc4zUNzaetDi2XV52pTIJELq06NM6FflZ//v9xSMDRWwyfa/kGWWY8ljyWZAFNaNia9PXzHKIy3B0swOH296kAuetTqi/G5vZpQtlK5sCf0EueD6i4gItrJvOpmwqpTbgMwKQZf3vlP5VcOStqJv5hZr4z8nsakNebmUA/06uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0UL5mjHfT0R71yv2zCk4BfKTzF2L69370TO9wxqmBE=;
 b=ldbyeEk2Jr7QEL+RA/gf8lLX2kpjfAlMw80KgLgw2PaGqHdTFRj1cgLWNcVtFOw/u1RxPcHlMd989NYDbjDLXAUdljedPy5BSF/+Z7SK/deklB3mYwuld7A1jDqydON5jVE8bNTU8bCWvZ+V+A5Pkf2TRpuyce3B0zfhEImrKLBPMLsLo5LbbaNWgV96heiJD5PoAV5mJkR5hPPC1gr+lIL5WvyqDNwEUF9irUO6SEuGHWJuK1NAjMr8SO/gnm0BPsgPH2RadZYqPxk15k7fRlfkpOubXNiFLFrVKSig5VVbSRDaU2exVuWhz6WBkjC1ydXbzz16KvAcwuE8cwn2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0UL5mjHfT0R71yv2zCk4BfKTzF2L69370TO9wxqmBE=;
 b=WcetMnXrfubDyP96O6jXEg/4avDzV9yGpAXmZNOI/5TSvnE4+iSxZnVQ9n4L5SOvCLQQirGjfBd4gJQXoa+p4y42oqazarrQRGqaJ78bgOwWO1ymc2+glI0Zqqj9ldWw2ODgef1gmBx5LKb1gG7b8gz9zbUBchTQ0XEbuhJjAgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 11:39:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 11:39:37 +0000
Message-ID: <0d2d6d3e-594c-445e-96f4-c2a7991d2b14@amd.com>
Date: Tue, 2 Sep 2025 13:39:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: use KMEM_CACHE instead of
 kmem_cache_create
To: Longlong Xia <xialonglong@kylinos.cn>, alexander.deucher@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902072759.2386131-1-xialonglong@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250902072759.2386131-1-xialonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: b032dd5a-28c8-443b-ffa3-08ddea156561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REV6UUNIQ3ZpWGtiMmoxemlnRHV4QzdqdktndzBtaXd2OVU2RlcycElYYTQ0?=
 =?utf-8?B?N0dQbi96M0ZiU0VadGxTNktndnhUQVhkK2ZRV3pyV3hwdW96YUZBRElSbXFz?=
 =?utf-8?B?VmpvUjRJbDYrTnVNTE4xdzlxYVJKUHN0RDFaNW9EdTJ3UW5aTEZnQkdrdFph?=
 =?utf-8?B?Q0JXc3FhbXhHaXlZVCtyaTQrMWFaTEpIVkNsbko1K1BsYVBnR0NNOHlWaEQz?=
 =?utf-8?B?RXVwV0ZiYkZQa29nNGxsVS8rMERkTUdpeVV4WWRQZkNDS3BkS3ptR1Z3d1Jq?=
 =?utf-8?B?Q2wyNzI3S2F1dVRwMmxyRGlCekJ6UklrZk9JdnNTL3I4ZFNOWXRnY3ZEQzQ1?=
 =?utf-8?B?dlZZMmRWUDZHT096ZXBlZGd0ZmhrUDBFNWFkUSs3c0hoZnR1TFZpK1kvY2x5?=
 =?utf-8?B?eFpLcVVrYUxRN3RNa1hZUUxyRVhoQnlRMTZ2emQ1aDRDQ0xJV3hhK0dtZGtS?=
 =?utf-8?B?UlJBMFZqMzdOenpFYm1EdWx6TjZqbkFiNGRZTjdINEJ4cjVVcVc3ZHZkbUt4?=
 =?utf-8?B?NTNoWU9oMzJFeTdkbWhFRzZBZnp2VDUwcndJRDZtVTVlUE9NdUZUR1d5aTRm?=
 =?utf-8?B?T2JvcmtwUS9HQ1pTRGFOVW4zWndsNEZPeGpqYkxRVGVxc2RuVnRjaUFNU01w?=
 =?utf-8?B?VWdWWEJSTVZZUy9XdWczMU5YSlliZ1lQL1FHbnI3SGhQUi8xUEtEN1BFSW1z?=
 =?utf-8?B?STRQZ3pRUkd0R1R1NStPdUFjcUpTNWtncjZ3eTVjcXd6MEJCNlBHSlFhQmR0?=
 =?utf-8?B?d3h4bU10dU5KbGFkRzlNUmxiRG9aeXJoM08yaDRhOVBDU3ZmbWI1VGNiUnJt?=
 =?utf-8?B?M2dROEExWE9aK0xaSUwwMjltSW4vVkhCdHRLemdiRTFqWi9CaUlyYnc2Yys2?=
 =?utf-8?B?ejlkSHg5QjY1UjdLMXk1dFFUUk16V1p5S1pmZGdLaXdTWkc4R2ZKUGtnTW9E?=
 =?utf-8?B?QjNYVlpoYlZ3bDhTckRNL25FVkoyUFVTdDNvdXlYTHkrbzJWc24vRVRnMHBu?=
 =?utf-8?B?TzhzUHNlaGJqN0N2Z1lJVXNlMkg0M1ZXYi9SNDlVQTM5Ty8vN0t4QmZpcGQ2?=
 =?utf-8?B?UlB0L2NsNEIzSXg5S0J5ZlFtM2RQc0VzWm13TnBZT0hFdlNJNEt1ZnNaUDBo?=
 =?utf-8?B?WEVlVUo2Qk9Pd2w5U2RzbnVWSVRrdWhoY1lNbEU5ZUhpNCtaMzZqVWRpNkdk?=
 =?utf-8?B?cXhKSWNxQnFYcjhwNjM2Z2pwRXR6Y0pNSzZUa21idjlibGJZQXM5RFIxKy8w?=
 =?utf-8?B?L1VJQ1NDUDNmcFNJSDJlYWUya2hUc2MzWmhPZ0g0eFB3S1BmaWpocnR5VkVu?=
 =?utf-8?B?dlowT3lqdjJoTDVsbHlwRWtuM0RJdmhvU3hvZERPRG9BVWJEK2F4MlcxSDcy?=
 =?utf-8?B?Qno2WVhPZlIzZTBNZi9IQXJncWptaGNJblNob2RGa0wrOEtYbkpkbW1XZEdU?=
 =?utf-8?B?MDl1cFhSOXhSSTJFcXR4THZsTVdYMVJ5SE5KckJLMVh5bG8yNEFiS2gxY1ls?=
 =?utf-8?B?azVHR0RCczRtcGJqRm8yazFwR3d3VjA2L1JPd3JOU2VoNEVVbDNueEJGQ2xK?=
 =?utf-8?B?YnZ6KzJaM05ZYlcyUFZyRGVoR0R3ckhIcDgvZ1pTZWJmeVlxdnNnVmczaEcy?=
 =?utf-8?B?TGNYcnpxWXVJSWxSbkUvdDhIV0JGVUxuZkJ3bXAzeXBUcGNsamUzanVBSGFs?=
 =?utf-8?B?djZsTm1adUN6bFUvaXJJRWNHVXZyN1cxWUgrc0xqOXV6QWppWS9lcDl4UUZH?=
 =?utf-8?B?ZTFtQ2JSTzJsc0szVzJrczN1NnJQM1B6eUh1aDFaUmhUQnRnbllrSE95OHJE?=
 =?utf-8?B?QURSWGVvM3pwc3BHUVVGTmY4T2ZndHJlb01wbGMwaFFBc1VsQk9GeW5odk5o?=
 =?utf-8?B?aE5HaFloMzRISGNrS2tWdUFTb0dpSjA4eFgzS3JMMUZKTExoaGRZUXdHSFNz?=
 =?utf-8?Q?QPlPSOel1/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME13NFNRNkQwS3I2S2xia0xPUThVMXBvajlEWUFIdXMxRnhxSWh4OWVPOHJG?=
 =?utf-8?B?YzRBWDgwa2lrUHFYZzB4M2RBdjVaK1BNTEJKaWRuNDZpdEswRktJTVFveDk2?=
 =?utf-8?B?NCtFNm1CeE9rSzRvamZ6MU92aUR1L25RTjVLOWEvMWlJSlNESXkwb0pOK2JV?=
 =?utf-8?B?QkFrZ0tkZDUvVHlBM1d0bHQ5eGFTTGd5Q2xGWCtQM3V4cWdPcWh1NXRMcmJ0?=
 =?utf-8?B?OXJ0Y21VRXdMSEU3K0tRRlNkajhVa0pZWlhqcnovNmhEaWlaZlhHNEp6QnZB?=
 =?utf-8?B?bktxUGVXaWlHK21HaTZ6TDZkUHRoUVI1dGpmYXVPSFltUDRzRHBvT2dWRGpC?=
 =?utf-8?B?aGVVejVMRUN3TXBIYVVvTHkrdEFXZ1BONmZpTlVWTm1CLzh2ZDlneVdLQnls?=
 =?utf-8?B?aVpyUTAzaHhERHR3L09hOGNuTEdITHM1R1Y4ZmsrYndLTEJtRjFlYk5vTVg0?=
 =?utf-8?B?SUZuQ1pMbVk2bmo5Vm51ZG1kQk5JTDJxSXVSVVpZMTVCM1gxL0Y1WkU0U0lu?=
 =?utf-8?B?N1hiejRqWEQxaDVpQlBlQ1NNbXlzTDljazZ2bkFPWmxoVDA0UTE3QmNObnpS?=
 =?utf-8?B?ZFpXMUYzUGlUNjJxeW5OZ0ljZ2ZYdWZ1NFdqMnJoaDdzZzBtNHJUN0E2WEdx?=
 =?utf-8?B?S3c0MHlVMjdXWVBlRGUrcGhnQVBZdEZ1MnJJVnphNlRPeDEvdzdYcEVJM0Mr?=
 =?utf-8?B?VFNnZDlXRUZPdmhDTjA0ZzZ1MDFvSUJGUHhzc2JacURqWGQvT3Bua0IwcXZC?=
 =?utf-8?B?VDBNV3J6RGZ3c1VhY1lBVGtzNWJLd3hUcjZIbmt0SGF5RmVFWlYxQVJuaXU3?=
 =?utf-8?B?Q2gzNzR2ZFVxWlFqOUtOVXlKdmF6OUZpUnVmbVlkcStwZ1RqY0gwNWJqVWRj?=
 =?utf-8?B?UzhNeWo1SXBaMVFhTVY5enhIbDhyelMyRlVVYkNaM0pFMjZqOHc3b2dwWlNz?=
 =?utf-8?B?ZUx4UnFIa1NhZ2RoNGFDcmZRSmg0RjUzN0ZFZGhPdmZ0NjFkNTRTQUpZdXVY?=
 =?utf-8?B?cTR4MmxvcDBqVXFXdWFHN2s5NVRycW1nQTV0LzVwazdIOWh2Zi9EOERINTA4?=
 =?utf-8?B?Q2NRdUNGM0FDZFZNUlZPMlpSUDNVZVFlYU50d2xpN01GSnE3c0grQisyYXhQ?=
 =?utf-8?B?ckNUbW54NGNWMEtqRFczay9JWUFRbFM5ZGs4WXJDRlY2NmlrMFdONXpOclBy?=
 =?utf-8?B?Sy9NdVlZM0RlYitQMGQvOGo5S01ZVkFLTmVGeFFzNG5teTRsMEdCQm1aM0xS?=
 =?utf-8?B?WUFxTEYrRER4eTlpcCt4MWNaVDRRNm5GWDFTejdsZDhSZC9zd0IyWGRMbXEx?=
 =?utf-8?B?eVk1T0xKd1h6STFUV01qOTNCaUZzM3dpaGx4ajZHRnhjbWlBdGY2dElOSkhN?=
 =?utf-8?B?dWxwRW96alFQUkFDRXZiUnpqMkFZMG1XNE5sVUZvenNHVGVWYTc4U2VZVDk2?=
 =?utf-8?B?NmJjYk1WNFlCZGJSOENkRW9BcHN0RFVuNiswU1d5MzhjSHZ2bjJiLzVzMjdU?=
 =?utf-8?B?akloSThkTHF5aVVtS0g2Zlg5eFM0a21DVzVmaDhCVTBRUk1EN0FvSzlxZkcz?=
 =?utf-8?B?YmFyY1o5a2xaRXZPbmwzbjhXQ2RoeXByOHJzVHdsUmlHeUhqNzROWDFyYU16?=
 =?utf-8?B?Sml4OXNuOWtVdFNOVHR4MDFCb252TW9MUXYrcEYxWjlQdlRCTDMzTG16elJE?=
 =?utf-8?B?bW1WRDc2N2IvUGFLWmtDemRpSGZlbUpQYzIyZWtpb2dJaS9ORzR3M0k1TDN4?=
 =?utf-8?B?cTVjMi8xYlkyRllWUGdrQ3k2cjFEOTNjbitzUlZ5SU9YVGxpeEJ4ZkRsbTlj?=
 =?utf-8?B?Y09BcnFTOVhHSzJGa3R2T2gra0kvZVBsZCtQbG1hT204cVJNVzNNS1FZVHVI?=
 =?utf-8?B?TElBZk5KTXAvVGx1Q1FteDJ6aXRjemdZS29Ja3ZpQ0pCMXQ2OXo4WCtmbkF6?=
 =?utf-8?B?WkNLZnBEVHp2dzQySnZVWXdxRjhZc0NuZ1lXR0N2UHVkV01mYTdlNnFmN09J?=
 =?utf-8?B?bTF0VzRXNDRZRW9wTTFnZWtxb01taDFFS1ZuQmp5cStFZ09MYkJHQ01UemJH?=
 =?utf-8?B?bVVyTTZ4Smlyc3ErMXhaVTduSGtOSFRIZURXdGJOc1h0UTkvVjVrSnpsUVlK?=
 =?utf-8?Q?paZ9pGgIiyFz2SaPvGdG5oirJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b032dd5a-28c8-443b-ffa3-08ddea156561
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 11:39:37.5104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vd5nqJcYzYUqhH702QwmShT2VeoDvoczg44MbCn3WCLlktJy739wTL6atU6VZ9u5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
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

On 02.09.25 09:27, Longlong Xia wrote:
> Use KMEM_CACHE() instead of kmem_cache_create() to simplify the code.

In general a good cleanup, but why are we using a separate kmem_cache here in the first place?

SLAB_HWCACHE_ALIGN rounds up the struct size to 128 bytes and that is something kzalloc() can return as well.

Regards,
Christian.

> 
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index c2a983ff23c9..51f51064685f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -37,11 +37,7 @@ static struct kmem_cache *amdgpu_userq_fence_slab;
>  
>  int amdgpu_userq_fence_slab_init(void)
>  {
> -	amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
> -						    sizeof(struct amdgpu_userq_fence),
> -						    0,
> -						    SLAB_HWCACHE_ALIGN,
> -						    NULL);
> +	amdgpu_userq_fence_slab = KMEM_CACHE(amdgpu_userq_fence, SLAB_HWCACHE_ALIGN);
>  	if (!amdgpu_userq_fence_slab)
>  		return -ENOMEM;
>  

