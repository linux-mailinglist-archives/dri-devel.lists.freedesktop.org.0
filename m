Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC482D709
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F2010E266;
	Mon, 15 Jan 2024 10:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE9110E256;
 Mon, 15 Jan 2024 10:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1KKTmdmz+JdIL0doeBHVXbPHRtsr6E5ukRp3tx/DvcMhTf2OvO4kfZSrgDxDZHr/I/70N6yEUWRyluxcFsk3BA3S3lNeCa34q8uptA+txC2LBiLVbTp8IBHZF5JpaK1y0WCVxW4r/g1Fxc5F1LzHrUHC7pxBHVxBvlKquEcsvnHxR79onrMkjPBLxGQv9QNCoctATaUYf56KpeKjUeTPxRbGq1MMOW/R/oMKLR7SmdlFS13WLVdWwa8Qhfqu0P1zO9pUL51xjLy+gw/8wLKK93z0C0r5qr/T6rkYT6wUN0HZExuheU+AlHr2/GEMuLZmqIrM8NN+fxVZaxCemklvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNfV+wIly9C8ZiIj9ep7ytPI61Mo+O46h8fiYVrEylk=;
 b=HxBdoaI/fAJCyEZGNb3BR3KLyp8MKXAvquhItC8g8hS4GkPJduPpys8Imp3ilnHOf/ts8KyE6O970K51MORScV1qcFyBmRZQiAl8QoMHTt5fuyI4wB6IE+eihctNO62LouJp0nMDhYmhIj/E8kXCJXRPGChymaLlLKXVld4Nj7RbzFXd6sCn4KN8eopfQ7UAxAjBHeseYm5o/x3kBg6f8I2s0H6RBTtAEqoKtMaxOJ0kxAcZp2XHmC6HGPNgx3rjy5XUZShxjU6yCAVmsPYLUXcjyx8nLQpp7smkxcm6SOqcu4gDBA1KZHL+bX238NINhz0gT0Cvgp9ExWyKg/RM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNfV+wIly9C8ZiIj9ep7ytPI61Mo+O46h8fiYVrEylk=;
 b=ozoQk38zItexX+YN1DiPXPLs2pj1JrrYRAGPtm5Hjo6pP9hhqxA3ykh8fL+A3iSNTSC6ORQDAeIFTrhtDERSNwtfY1w8UhvOeHN/hsdTEyoTqfeT3OfVuyRPA58dOJ4rVSUgyG6nV6WHDHU7pP6AEiCn7fReeoYF93M3Eu/M7ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Mon, 15 Jan
 2024 10:18:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Mon, 15 Jan 2024
 10:18:03 +0000
Message-ID: <ebd2d3ef-f222-42ed-8103-c8dd61c99742@amd.com>
Date: Mon, 15 Jan 2024 11:17:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Remove usage of the deprecated
 ida_simple_xx() API
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <c3b8e4bfb819d901e532e90a2ae0efa9eb661c55.1705245232.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c3b8e4bfb819d901e532e90a2ae0efa9eb661c55.1705245232.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3c3c88-0af7-4992-a0ca-08dc15b341e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0gfyBIFXr8Q6nEEfK+ltXGzwLr6Bj1+Zs6bxLmqmS75ryr0Khszu31qqMfhE8t514n7kLKfwwuWzQUk+4rdI1mpznxLbfUPom4nGJ4tO4jjPBqGiOsmCO+4Ebrm8etdDPs5SpjU/nfBS+IneCt7dXv1DUAHfgQRuTWEQ/Uej7m2fGPeCB4w+EeGtEMKc1F1Ugcni8BRHoWBQbC529qA2vd1lfZt78ewZmUmhjT9Ro+IlBQUJnr8yFx/pIcUscyjH4vasIMGhlMXdywcRuyIz3GjMTYWI+XQPsu6r8kTRkmx/bKKPgYyHxH7sApEp2UIOFo2YE1kbLr15v17Wys3qePYTL5yfbCSCqzTvLRaeG7i7+pWrIPhWSOqnSFriiHBUSwFb9YMiMBk08h1S1vkhj9v1/9aIE6SFMEpXalkskmVa1QZCCpFgEcO84P7BzTalH/KhUH3vPBomgdoo185+cHa1gbUIKdOLB5ZH/OamiyErgJC8i+kYIMkpaRCTjlpIM/omPDGwBpkiV4pJZ01254j3PLCAIeO5SmpOkGxi5uh9GDep4XRkCTjxyn5K+ozXpeg78RlGxjYmpPInnwoIIweoGSmwL7KNLlo3GvHZEFKjCtx53JKfZFkICugLOvPrCuapXj31xe+HAMbyh33WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(83380400001)(2616005)(66574015)(26005)(41300700001)(5660300002)(6486002)(31686004)(36756003)(31696002)(86362001)(316002)(6512007)(6506007)(2906002)(8676002)(66946007)(8936002)(110136005)(4326008)(66556008)(66476007)(38100700002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGowTHVKYk5zVG8yQjJiV285YjdQekpEVkJwZlpmU09DdlBWUVdacThjYk1y?=
 =?utf-8?B?K3J1Q0Z3VXB5d3JYMkcwUVBxNzRLSWUrTmxnSStPZ0hQcTdQVUF1T3kzZ1ow?=
 =?utf-8?B?RlNWdkRKcG84TVFUYldYTWtQUmlaRUFzbjlUd1EwU2g4T3N0Mi81c2Y2UGZP?=
 =?utf-8?B?UHU1TlY1TldJekJPNHIydXRkZkdxSER6YUFCMlJ0ZW9FQmRDMzBnTlUwZDJ2?=
 =?utf-8?B?RmhDNDMrZ2hoUkdiMjRKM1l3OGMxcEhLNktLMFkzZmdONENKMm9xUHRlOTRp?=
 =?utf-8?B?WmF6QVNYOFZWRnNaOXZoYjhHanlObGNTYkZvamkwcXcxQ2ZES0JkcVJ0ZGpQ?=
 =?utf-8?B?dVN1OUhjS21VQWtTTjhEOVdQYTNvSm4vNEdnTEV1Q1FXSldsVlFKS09WLzgr?=
 =?utf-8?B?UzREcmQ4NnZqcmxaNTNRWDNsclNuNlFmQkNPZlVtcTBid013STFhb2xoaUxV?=
 =?utf-8?B?TmxtallQUWp4dWt0QlBiM2tES1B1K0M5YkRKcys5YXdXRlA4MzJwN3NiaEY0?=
 =?utf-8?B?SWFwN29XNW5DNVJkVVNXaW5YYjdXa0FpY0FNcmpXSzdBL2oraGNjVFZGL2FX?=
 =?utf-8?B?cFNjNlFnaXpONjBLMGhFWnVTdUJxWEk3T2pldVZjMHoxL2NhNWNPdjlUbTk2?=
 =?utf-8?B?bWZZZzJmV3dyeE9KTE80MTRQZ2xVRm9veHd1ZDdLcFB3d0pVMS9JcEhVR09n?=
 =?utf-8?B?UGxYQ0xiV0EwTlc5MkxxWVNXVzJTdmhIY0VHajNncEg4SjQ1UmVLWms3eUIw?=
 =?utf-8?B?NGFKVk8wTHF3elJEekExaWoxRHNsVDhlcC9qV2pKSzdVMVc2cUhOU09hVHk3?=
 =?utf-8?B?Zm0xK0FQVXdqakQ3bDU0QUxkZTBZVWwrcm5PY2tzZHhaUUVSckNpbXNxdmtj?=
 =?utf-8?B?VmtlWWRUQ3pwRmU3UHVzTk5vNnU4VlphNk9ValNBU3JPdVFnNVVFc3RmdTcz?=
 =?utf-8?B?N2NLVnNMNGZIUG5TQXdrWG1lQ2ZjTFdOMTlZN0RqcWt1amRoaVErbE9YNnA2?=
 =?utf-8?B?S0tUbFRnK0dkeEdNcU1oSEwzOTVnb1J3TkV4Zi9McW9WRDNndU92YnNUbEpH?=
 =?utf-8?B?MUROb0xBbDVBenFmM1MxbnJuZ29BaTRCTytEdWpodFJjYklSQ3JCSktKek9L?=
 =?utf-8?B?dHVrcFZEMWZJSlF1K3lLY0dGRmExblAxQ0xDUVVJQkJaV0lMbEFLLzZ0TEps?=
 =?utf-8?B?NmNjTHJHb2NIRXlHdUpQZmlGMTIwK2d6aXdDTWoyQUxLcTNmTmt1UlBGRE5T?=
 =?utf-8?B?TWpXSUx5cmJMVDVCSGw3QU1vVndyYmZ3UU85MiswNHNGUFFiSFVob0MzWlpa?=
 =?utf-8?B?TDlBVk54TVJBQlo5SFJZa05aTTZtZmhuaGtkRkNTazBoMUFxWWQwU1ppREov?=
 =?utf-8?B?elQ4SHhzenFBNFVTcWRaWW8vSTdWNk5pMDZmN2dpV2s3TzI4VUJmU0lkQmlF?=
 =?utf-8?B?TUkwRFE0bFZEV2tUQmx5VEpVWVF5Y3FSL3lVYTVGNDdmUUJ5UjB2RW5WSzJk?=
 =?utf-8?B?M2UxaWZDS21mTFdwUExGL2dFdlg5TWhmUEtHc2d2ckllOHZYMXlKM0E1SE0v?=
 =?utf-8?B?RXQvcU9MZFhoWHRraE9OZUJEeFZPcUdxUUZ0bmxRRWIzWUxkc3JOSDYxOEtQ?=
 =?utf-8?B?TWdIVVE5WXBhZm9ua0tna0ptQ2d5SldsazhDNXp4U1UyaWNzWHRQTjJwTC9E?=
 =?utf-8?B?bmVoQjBQcTF2bVhOVytpWVQzZng3VEVLU2pITHlzSVNSS2ZCZkR4SWVwWi9W?=
 =?utf-8?B?dG1maGo1WGljZjZlTDhJbjdCdmUycXpCeWpZbkxSN0prL0FIbkpacXd6V3pa?=
 =?utf-8?B?VXhrNlJ2NExhSDlzSU5MbVhwZUpUWWpJc2RxYmFmcWMvVitRalJ1Nis3Y0wv?=
 =?utf-8?B?b1FTbVEza2ZTV09WNjR2ZVd1MWpBR1FSZ1EvdXVrRWlDVUlOekprSVVrRmJ2?=
 =?utf-8?B?Zkh5WWV4ZmhPYXJtZ1I0NnpQYWxlZ1dCeDV5d0I3VnRkWlhYNzRXOFZnUm5k?=
 =?utf-8?B?ZDkrUnlheFlNWEJVdVlDMEVwYVV0dStlNkszT2JwaUw3N3pybkRadW9tbUYx?=
 =?utf-8?B?Qm5Fc01ONTZ1b0tjaTNFeWhSYXNySE43K2M5b3ppQm5NWDdLcnc1SjlBU0tB?=
 =?utf-8?Q?zpT5JmREVSWhlBQQbKBWGt1xo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3c3c88-0af7-4992-a0ca-08dc15b341e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 10:18:03.0939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S65iTwGO4/4PBdFkhVeN8gLNEHb5szd5ky9Zu4IMsGtTZfQcWZvLKaMAYpjLpRTA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.01.24 um 16:14 schrieb Christophe JAILLET:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
>
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_range() is inclusive. So a -1 has been added when needed.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index ddd0891da116..3d7fcdeaf8cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -62,9 +62,8 @@ int amdgpu_pasid_alloc(unsigned int bits)
>   	int pasid = -EINVAL;
>   
>   	for (bits = min(bits, 31U); bits > 0; bits--) {
> -		pasid = ida_simple_get(&amdgpu_pasid_ida,
> -				       1U << (bits - 1), 1U << bits,
> -				       GFP_KERNEL);
> +		pasid = ida_alloc_range(&amdgpu_pasid_ida, 1U << (bits - 1),
> +					(1U << bits) - 1, GFP_KERNEL);
>   		if (pasid != -ENOSPC)
>   			break;
>   	}
> @@ -82,7 +81,7 @@ int amdgpu_pasid_alloc(unsigned int bits)
>   void amdgpu_pasid_free(u32 pasid)
>   {
>   	trace_amdgpu_pasid_freed(pasid);
> -	ida_simple_remove(&amdgpu_pasid_ida, pasid);
> +	ida_free(&amdgpu_pasid_ida, pasid);
>   }
>   
>   static void amdgpu_pasid_free_cb(struct dma_fence *fence,

