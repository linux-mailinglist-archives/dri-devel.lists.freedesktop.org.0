Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1654AD223
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 08:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651E910E736;
	Tue,  8 Feb 2022 07:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830710E6E3;
 Tue,  8 Feb 2022 07:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/ZVnfHHUSMXIaj/lUKUGvTGpbfcksHiYr8JT9ftPAYuA8OuUJesIPVtiTSvX9ugIIwR+mrCG0GjIOF/LAyP2ToX4mgk7JzKdr8g//kkaRyTXgXGP1qvKcXgLXGd+sYTTTL6mLZBEpGAFJ71VmFKuZXiNVySkq7jpZwaZOQk+6A8biebfvOCLeY3KE+YjtMX1Z2QmUp3yC5SKut6J0AcCpnvXMFnAdLOxzBW4vSdNq8Rg2EXeyXwtnoqLbORA+2gKA7m1CfGVy62KgiMBp2B3yYZC3ErPgUjLUb3gvMf34cjUJEvBY2s8mI6CEXM0uxoBMLyxnpX9639ZQmfVqjvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lGZ9Zib3KhA563KyfJW4aSyaECHuVzlS+nwn/ulOs0=;
 b=cYXZfTwmM2hag4//pgbQ97Ee9nKcAYKGl2vPEmCQ/srxKZP28p1sU84U+l37fVv9S0+05cD71ShUOpFpz011k6Z8R8vQZuNX1D2c4CORssyInodaAFOhDltB8tuq60YDMfeR0Iy99tJA+0JskZsz5w8AtV3yXh6fPRg/OaEna7YDyH7UjwPEgSIAs8cxABVNAFHm9uflKvbjqXUc+RMMjByN+yvB5mqo8HNZtDwg2T99PT87NckcT22H3cnTVL8sF5lIcKsbL/eq94Bh8RKI+85DV29LRMObavUz22mADUX/aGSe8EW4eXYfMZpxsgYU3Ue0kMfPbgcQWH/sieqBlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lGZ9Zib3KhA563KyfJW4aSyaECHuVzlS+nwn/ulOs0=;
 b=h+Airxq1ja/1Rn3LWYG/SO3h9g10k2NhK/dxrfC4S4VDZYD/ceIrs/xoIOZNJDHoxAFg78Ntmmmq92Ao/nCN755C1OAIkgfLCgOq4O3X01RoFBYOIFynNEaq0qUCpL5r7G7rGI0PaZEw1mei1buOQ3t9bLGHy5xGVtcFKoak9Bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Tue, 8 Feb
 2022 07:23:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:23:48 +0000
Message-ID: <9f12a0f2-ab42-c7fc-b3b8-e6babfd7dc59@amd.com>
Date: Tue, 8 Feb 2022 08:23:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
Content-Language: en-US
To: zhanglianjie <zhanglianjie@uniontech.com>
References: <20220208031454.24232-1-zhanglianjie@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220208031454.24232-1-zhanglianjie@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0072.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::49) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7add190-62c0-400e-c229-08d9ead3f2e3
X-MS-TrafficTypeDiagnostic: MW3PR12MB4571:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB45714A2F3D8D5FF22DFAB399832D9@MW3PR12MB4571.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPhKiWJGTF6RJnGuctLUjGWnGx5O2qxTo0flk/sOYrpRBXzjcMD4k/lMQRJmzs9zZERzfsMP7C0rl7HV2z+NXnHW9KqOpLqOsVvqu3xuoNva2QMlVKnhAFEkF8bY4nIYcr2pZRx4TqN1XcVbpb9M1o2Md9gZ0cd2B4Oh5KC1UcNZQ87bE1IFKdqSvbgMkYiB7qvYVfQ2CR5msxhBdpj0deLh9rtb+HQW4h56En3gD5+dhY7JTP2Nbve28Wu+zWB2fL0+KHKHy3SfkbO+y2scGHpb+lX5Zx1+KsEvqPWdGQzVWawEOjPNZYNL2vi5BhW45kWbneNEHxIpSRgsSzUAu+U3k8nt/KO8jzV62AcRZwXINGQflD9SjOMFAQLjIh/MmDkLi6fjSnd174Fc5km9+UV8G/briG6wCsX7TN5vH0FAAFgC9krIOWHy5oUdPDxV1ykS2SSVKtX8541QfQeEV1u93vCR1FeSHdSUA/g8ULu/WeqtkJERckVkvqBTlr0ZCn7yu8m+bCAjbbkt6GxDP87gXYtRqHseo49zCFEpAeXC6repJ2LBL+NJPLCOwo7LvKOMldg8OGGqBWyMK1oonOOX7zZX7wtXwnYPddP+vvMkYSbuJTIg+uqW4Gt3/1yub6COMtqRrCvUNAmcgHgK54I+zY+Qs9yvR7Jl8b15uLaZGMyV8y661+m9BAqLbKctlLZlYFEZFow4F2VY36QIdaKjGFcG/YwIuKpD0EcDyJK2SeCxFjMwFS29khlum3A1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(4326008)(36756003)(31686004)(186003)(2906002)(5660300002)(38100700002)(86362001)(6506007)(508600001)(66946007)(2616005)(6916009)(54906003)(6666004)(6512007)(8936002)(66476007)(66556008)(316002)(31696002)(8676002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZKbVVlaEJzK05ZdkhmcDRVdG1vL3l1VGdsYW0rOEZ3WFdhMmo1a1RISVor?=
 =?utf-8?B?R2RsM0NNN0hGbjBCS2t6YnNTdWliQjErMHdpbmFJeGNyL1k1R0JHUEp6dVEx?=
 =?utf-8?B?VWZXek94OTZ2a3ZwNTQ2dHBld09tNGJKQlc0c251eWdJOGkzWWtyZEkwelVD?=
 =?utf-8?B?cVIvK1BvdmV6R3BNTWtIc1ZDUXdrcDljM3RKU1dPME5oaE5iU2gvVkJVQ1pS?=
 =?utf-8?B?RmwwM1VxWEhZK0tBWC8wWjU0K3VqdjJEZ1pOWEcwM3JYeWhLTGVhbXFDWnNu?=
 =?utf-8?B?clZtWUJ3aFIxZis3aElmSUV3TzV0RWZBZFk4N0gra0Q4Wm9BMldqU20vK0g0?=
 =?utf-8?B?cXNMay9xK3dmZENKa3QrVG1tK0Y3TE5QejM5UGNDeXRPcHZVT2MrVzZSQUxs?=
 =?utf-8?B?N1JRenlkTzBHQ0Yvc0dIL1NiZUVKTGd5Ky93bXpNb0cvSm5reWZmcWFva094?=
 =?utf-8?B?TXJYRzlQVDNCeXFIZVNma0xkc0dyQnBPU3hrMGcrRFRLS0ltTGg4d1F1MFU2?=
 =?utf-8?B?cXVIaXRKeUJ5Zlp2YnZ5QnRnbGg3TTA2MmF1NmV0NzNsaGRSTC8xTXl5VXhy?=
 =?utf-8?B?Qlk3UWRZS2JrN1FnYkw3eW51ZTU2UHpzVllyRGtLNE5WZ2ZSRktONVBwQjZ1?=
 =?utf-8?B?SlIyOUxjbGs0QjlXSisrdzVhTWdkYVQrdUpMQzlDR25tZ2ZWSVpYU2F0bzcr?=
 =?utf-8?B?cktsUzIycmhRV29OcHc5dWdxSWVIN1lJM01naUdQODZFN1Q2eEhaa2dRTHFJ?=
 =?utf-8?B?c1NpYzRaL0x5U0FXL0o5elF0RXFoNnhESklnSVgzN0RLMjN3ZWVKbXF5WjhK?=
 =?utf-8?B?MXF5VHgzaG52L0psZk1rRkdoMVRjb29Icmo3eVVmWklHVURDL3BOSTVkWlBW?=
 =?utf-8?B?Z1U5bTFKTWY2dVFVak44cTcvTTZyRjNEMTFpT2RhNWJrbXd0akZ3NURTdnUw?=
 =?utf-8?B?QUg3QzlZWTd2elVhcm1sMHNaaUFHT3dONkhaQ0txeXdIdVJZV0RFclBsdStC?=
 =?utf-8?B?N2RwRC9wMjRXU0UvanA0U1RMcWN3ZlliVVhuWWl2WTUyMGxaRS9tTTdYKzht?=
 =?utf-8?B?U0srZmJhSjRiY0VLSkQ3SHJTMGx6YTBIK2MxdGlYZ0Q4by9Tcjc2N2F0bS9P?=
 =?utf-8?B?S0t0OFVoL3gvRG8xL21WbTBmNmdZQm10YjZXb3hFaUt5MVc3ZzJMUVpYb2dI?=
 =?utf-8?B?aUMxenQ5alR4QklYVlVxQnR3VnRYNmZPWDJNUno4dG96QkZnamlrNzdOUnd1?=
 =?utf-8?B?MWdjVDcwbTdRMzYvNTJDdnl4d2MxZUJFbVpmelZEeTFwSVJsMFNENE9WZU1j?=
 =?utf-8?B?djRRTkxOZU40eERUL0hUQ2hHWStBbVBZam9kMFZnL3RyVEZMK3hlTDZpR2FW?=
 =?utf-8?B?NnQrTTJleXl5ZDFEaS9nTndYN003Ym1YUjczVnhoZXE1ekxqWk5qTHZzcUFx?=
 =?utf-8?B?ZDBMZzl2YlJkbjVlcFFjUk9UQkFBWWs2ZDR0c29MMGFGYTlPbkxWZDdsdGNW?=
 =?utf-8?B?RS9qV3VYQzExSUlsWDdwcExySWk2V0xWRWhpdFk1VmxlK2lTS1ZrcElkWXJv?=
 =?utf-8?B?dkgwbDk4MWl5K2NDdlo3UHFGVytkdGVWZnYvaG84NWhiNlZJK21iZVBBWEF4?=
 =?utf-8?B?SHQ3dHBabFd5ZUFYKzdxRWhWM3E3WUhTTEZpRThRUEFQSHVSS0tKbHgvOXFY?=
 =?utf-8?B?RXhYM1I1MGprSzJieS9hNzBCcTNoZDJ2d1VocmMxUm0rUU5Nb3FnM21qdWh3?=
 =?utf-8?B?a0NpVEtUUTQ2TVNYZGY3ME0zQ09SUUx2NnVqUXVPNXNleGpublJLRTMxWG1r?=
 =?utf-8?B?N09sVmE4NFVDMFlLdXNleDQwNTRwaHVreGlFR2d6RldTaXhUcFlOZ3FPbkNk?=
 =?utf-8?B?Vkh5UzI2ZGx2MzA4Z2ZaK2Z4SkhWYWtzK21sMUc5bkJMSjRtbGtXL3BlTUxh?=
 =?utf-8?B?QmQ0cUNDeU1QZkhXa2RCL0pMSk5rUGlVRHUyYzk2Si90bXIycmtZcSt6bDY0?=
 =?utf-8?B?UE0yRVZNc3l6TFVJRTc0dW4wbG9NNWw3bVNuRnh4NlhlWDB4dVdpOElCSDEv?=
 =?utf-8?B?clNid0NVYUcxVGFyRGYwTFByQllTdUg2WlZvbE95aWJIUklvMldXTUxvVkcz?=
 =?utf-8?B?Y3dsZkxxZXFGRzlIZnRYNGpadUpURXFTY2JoVk1RUHNtZGdlZzFmQUlJZFl0?=
 =?utf-8?Q?N/vRQMBVKVkYUy64RVE4GDw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7add190-62c0-400e-c229-08d9ead3f2e3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:23:48.6147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tMduriutT7JSfTAfU4byu1RCLCudnlDY4TomDLNDntCWAF6BrMMt3JhFpeNJvks
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.02.22 um 04:14 schrieb zhanglianjie:
> after the buffer object is successfully mapped, call radeon_bo_kunmap before the function returns.
>
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 377f9cdb5b53..0558d928d98d 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   	handle = msg[2];
>
>   	if (handle == 0) {
> +		radeon_bo_kunmap(bo);
>   		DRM_ERROR("Invalid UVD handle!\n");
>   		return -EINVAL;
>   	}
> @@ -559,12 +560,10 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   		return 0;
>
>   	default:
> -
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> -		return -EINVAL;
>   	}
>
> -	BUG();
> +	radeon_bo_kunmap(bo);
>   	return -EINVAL;
>   }
>
> --
> 2.20.1
>
>
>

