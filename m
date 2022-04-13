Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C54FF2D0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017C710F0B7;
	Wed, 13 Apr 2022 08:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8BB10F079;
 Wed, 13 Apr 2022 08:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDRvM1vZtXcPkkv5yB8EWGUwOeC0Uk8onJr1B6LI9xr/PSGdRT2gpBx3I0oBNUTjRLM27J1QVg4IYRujBecz+nkZWHoEGmvgAVXzlOzkHKcJhJ+NpZ7OoaZXBIkRfU/7CS4rEvXHO+HgLXNbZNUOVuxMnlPUqCLA2o/cbjKNzs0ShFx4A9Vxfzpi/IgmjlgrDp6uhEEwAMaI0/c0UxWMHExjpkdk/MtIRn1Y6TETGKtZ4qedfE9ltnVIzgzpchVuizTpmqaxrNjHrex9CRl1RLvt87L0BHlm3BlTybzd6vpH5ECJxpj3rGo/ETztrK55ul0wNhLw3aBUuerlBMjclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5la+fOoskZP9mAI/Vn/D7CkwNuNP6675+qoAqCrhbJc=;
 b=UoRZLXzKK2FYVX4IzlpY8jQMps16cjYLD1do1zIzZKVEZT2sWCSN6OWEbRgea/4GJoy/iz3DUf3cYMhXDyTu4kCMYYjBxE6Dlpzc7tDLOryCxijNBjHmwu7ctZr2RD7RgKlNyE/ubZkXBVBUvhoL1Z/en9vCKhQRYnRud7etMC4BxPPuWUcSDMtTPKAM08Uuz1Q3yJmYoJBENANHSEcR2Qgmpa/O/Hx1a3D6pADeR/RYFV5kN+leAlzL2CGp79HgfHVqeoFgTEUGpveaNJo28f2OJWXnQX0bBP+A5EVh+CYAEXkjlKmGImkjSq3PQ+wKhmOb0E+/9ji+5vs0itsWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5la+fOoskZP9mAI/Vn/D7CkwNuNP6675+qoAqCrhbJc=;
 b=WYfoyIfpAsqODL//AHA/TUa7PWwpTflxZCnczDeLIvhehcgSgtoUV4RTFw2uiEVxvbiYvZSXSnmyG2pLmAYgdHSviKqJgASuaXbrA6z2ZUTd2HaIpDBmngn2+rDRP7QT9/a/wgF07b8u1MeHmvKTgiESDEdfauGJq5K6PsYJ9eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1301.namprd12.prod.outlook.com (2603:10b6:903:3e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 08:57:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 08:57:57 +0000
Message-ID: <80259e17-479d-1e5b-5692-40e10786f93e@amd.com>
Date: Wed, 13 Apr 2022 10:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/ttm: fixup ttm_bo_add_move_fence
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220413085133.275290-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220413085133.275290-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0775.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eba96ac4-8595-4d41-c94e-08da1d2bb43d
X-MS-TrafficTypeDiagnostic: CY4PR12MB1301:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB13017209214CDBC3E28E1D1B83EC9@CY4PR12MB1301.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7doupbCsaJW39KAyzBLzeBjKC+7rwA9Up05moBKB4IJ122TA9Zpbf73Jv4J7S5KoyuDwbjm3As8bswFi6PZgJwHUCJqUyuVi2eqZYv3p/No7P3tkn59HJBJ9LMd43or5pOBom9I0i5rguBNCELEXVpH78vKeCqqAc7Lv0r5hijwptq5kQvzFYanZ1xNT479/yPJ5zfH8llkoyINlOUiFgvCWOjHKrhwtd0av/oVSutDiS2LQP2iPGrHOVBsMUrAzIIHoaqnZ8eb0YHAK1RWllRMK9ZCcR+YeANl26ac5Ut8ccTKfQuorhefaniDhu9uUA8YFcOCygoF3DiEuKCiR4z8s9VhIb4fP6YOt0k4JIRZmDd+95Sxyv8uZ5GrmkBVTIuzJp0ua5Cgbnk7xVVT6+zNHhNrNtrAjy8AQ9mKD3uNlSa8wElrkXhUE5jZbUfOUobBEk42hP+3gSAk9TXu8n9i6BNxPqN+ky/iOebIkI1JhxyUsUKPneVPfOl9IqJ/EF5L7Mruwr3B0mPizKblKqMrrnwJiw2DqIyBDml5Pw0YWMknbuaQFZ+iCRBved20IgsbkP7bPvA+zKXM4G31QApmcw0SdfcZeOQpxAnRZGlIKXPuHNXUoVkUWUBZmvOrCfWCvHilnD4jgc5360ymh+oLctGsP4dzHIUBoPceoiz3E1q5y3yFNVgP/4fmoULPVZ+ksPG5SX+XXVn4czULWXEtTU3/5YR2g7EBuRYo6zGVI8yZc5zkksv1T1zBU44Io
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(6666004)(45080400002)(36756003)(31686004)(2906002)(2616005)(6512007)(8936002)(6506007)(86362001)(38100700002)(31696002)(966005)(6486002)(508600001)(66476007)(26005)(186003)(316002)(5660300002)(8676002)(66946007)(4326008)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTlUdWR3bFpjM1F1VjBBM0FlU2RmOC9RSjBYRkVKekdlSlNFcWpNUUQ1bnh1?=
 =?utf-8?B?S3lRTW5POWg2ZU9yRlRBWitXcWtxUE9odlhIalhFSWg5OWNZTHlOd0FkdFpa?=
 =?utf-8?B?T24zN2kyZmlkY1RJaU5IamN4NFRyUGJaK092cnNQaHk1UjkyQ3E1QTFLSURl?=
 =?utf-8?B?dEZsVHhEYTlyMmo1Qk5TNU82L29PUUxUanJzdEVnWWZud3M5TlJCMUJUZUl3?=
 =?utf-8?B?QmplbndLTG55MVYvTlI3MkJvYVpZRndnRkVHb1J3Y1dPbHNKUkxUc203eU5N?=
 =?utf-8?B?OEVDQWRQYmhFZWsrNGR6aGN2cldTaUUxT1haT3RGaUZQbWp5MW1JNHA1U01p?=
 =?utf-8?B?NWN2MHdVQWMxbHlqcGhNTGJKVjFwMkFzKzhBWXNxSWZpTm11UThlVmExZm1i?=
 =?utf-8?B?K3VzSGZKbVgvU2pyUlNybnF0RmRYb2Q3SnVNV0piYzEzejhQRFY3ZERGYW0w?=
 =?utf-8?B?SXJlWW1mVWtGZ0JDQ2U1cWV6bytPdWJBNkFuOTdRRjRLQzJYcUFzdWkxRkF2?=
 =?utf-8?B?Tk4vVnJORHJjUW9jbGErTVlIbzVCckJuaXJLcXM5TnJneXdiU215YVIrQ0xE?=
 =?utf-8?B?eWhCaTlhV2xKcXdCUHJYRnExSFE4b1huM0NUTHRRK3hXZzZ4VDdkMHhVTXND?=
 =?utf-8?B?VlVraWxScVJQaG0yckRZZmliREVtTk04VUtoc1kzU1k2QjNESld0UjJIaGpT?=
 =?utf-8?B?TEk5Q2VNaEZNUFBZNndxM2tLWGtWL1JWekU4RmQ1UTlRYzZPbnI3Rk1MOWJX?=
 =?utf-8?B?N3FDek1rT3ErTGZtK1VTajU4OStuV1VSOXpoczJnNGYrTEk1NVJUbzVtd0hD?=
 =?utf-8?B?d2JHZW16SDlLWWlLbGlGajdiQjgyNitJakpaVzVzdHNEa0pFSFpzV0RwV0dX?=
 =?utf-8?B?eTVsU1JXcTNZNm96a2F2YUllcitzd0lTV2ZSNC9EN0NiTWtjMk1kZnJ6OVcv?=
 =?utf-8?B?VUFqbnBiR2poaHF5d2xzR2JyVUZ4SG9GMUhqeEZuWm5WdmJaWkY5dFlyTHlY?=
 =?utf-8?B?OU5XTHVHSHRvOGp2c3cyL1oxK1hidkttTHdoM0hMbzRkN25WUDNWVnNUMitV?=
 =?utf-8?B?bVFzYXNVMzlmMEpWUCtBU2NJMERaeFVWc1RST29oZ2NWbUgvQkJQbkZMYnlp?=
 =?utf-8?B?eHRIYmVGY2p1TnhKRUQwSFYxaXExMkRmeSs4aTNHbnA5YUdmYmhYdk9MSEto?=
 =?utf-8?B?Tmhwdm91RDk2UStFdSttWko5c0JjSndLUzJoM2hoRy85NkM2SEZEdThCWWlq?=
 =?utf-8?B?WFNnWkJBZUI1UURhb1RpMzBjNGpEZDdKRUdDaVNrcmNDQi9SbENic1NobGVs?=
 =?utf-8?B?YkQ4YkdRcUZBeU1TY1B6clBtRGpYcGhQTHVZMjJJdnRodjBGcWdwM09LRWlN?=
 =?utf-8?B?NzZ6VmVJWktndVg2V0xxcWtFbWFtQlBZYTlFWDBUcnBjV3BZcEFCVXIrVGdy?=
 =?utf-8?B?dE9qM2FhQ3d0YVpidmxFREJteVlCdThKNWdaYmdpTkI1QzZpWmxNU09ZeUx2?=
 =?utf-8?B?aHJZYjBYa3J0UEEvRkQzNUNTZGh1VnlWZ2djeVd4UHVCRmphZjR6ZWZxSnN4?=
 =?utf-8?B?L0duQWlTRlpjTGJYNFRiR28wSHltSVZlMEswVzl4NlpTV09icndhVHIzR3d2?=
 =?utf-8?B?T2FzREE0WFlzMmxvdFo4NDBTYVRBb3plSm1xNFRLZkY4T3dLamdwUTJua2E2?=
 =?utf-8?B?Wit6R0dWYTk5NWpoK3JiU2dBTzlxVHl5N3NPK2lZOGp3bkRyeWcwcnpSTHNm?=
 =?utf-8?B?QW12ZVF3Y0x6bSs4UUVXY2hnRWI4YnE4WS8rV2gyZ0tnQkl5QlRwMUo0L05p?=
 =?utf-8?B?WTNIVThZbktPU09zTTBWdVZRdERzWTVlazA1aFdvQ2RURU1ZSmJyamlKYmxz?=
 =?utf-8?B?Z282SnVheHdBTDNCMitFQkVFMThMaitoc3JGRVV1TnlYZ1BDL1lOQWdnREtD?=
 =?utf-8?B?bmptVzFTV1VBdEVEQitiUXl2T2JjNEFvQS84ZzM0TXd0MDVXU0pGV0JwdzNL?=
 =?utf-8?B?U0Z3bDM5b0d0VVdKaHQvRWVKbXJNRUtpcDNLYmhIcXJGSEpBMTJRUlFTQzV4?=
 =?utf-8?B?TlhGdEFiTW9mb0xGWnZidU8rK2drbzlNT04wZGRlQXZGMDNicTdLRklMcnNS?=
 =?utf-8?B?RG1sOUFjRTg3OEhlOW9RTGxQdERiZFpld3JGTjZvR3AvNXhwcVJPL1hPbzRn?=
 =?utf-8?B?Sm9rTFIzaUlNNXAzRWlsNFZtWTNkWFlvVjlRWkFxeFNWdGZHNWhJTXlXRjla?=
 =?utf-8?B?MVRJeVBrdXVwRmNuUTNyYjMzMWJzbUoyam43YTl3Z0F0ZDF2MlAzTEk2Vk5r?=
 =?utf-8?B?dWVKZ0JYSmp4cVJRTDdTT1lrbUJPUEFzK3hDeWY4RjcwODNEZVlsUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba96ac4-8595-4d41-c94e-08da1d2bb43d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 08:57:57.3749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQUNoFJebf46tRaKvsunYfON4qm/5WsbDn0/jAib2VI+yXCE1KfHbQLT/iT2x3kX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1301
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.04.22 um 10:51 schrieb Matthew Auld:
> It looks like we still need to call dma_fence_put() on the man->move,
> otherwise we just end up leaking it, leading to fireworks later.
>
> v2(Daniel):
>    - Simplify the function tail
>
> Closes: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F5689&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C65a22791ec204cccae9408da1d2ad7cd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637854367089944852%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=rGZ4P%2FDUmHXObodJ9QIRynBWoxL2F%2FreypYI8JkiJoI%3D&amp;reserved=0
> Fixes: 8bb31587820a ("drm/ttm: remove bo->moving")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I've just pushed this version here to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 015a94f766de..f7fbf162ce41 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -740,11 +740,9 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
>   
>   	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> -	if (unlikely(ret)) {
> -		dma_fence_put(fence);
> -		return ret;
> -	}
> -	return 0;
> +
> +	dma_fence_put(fence);
> +	return ret;
>   }
>   
>   /*

