Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016954B9BD7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E311710EC12;
	Thu, 17 Feb 2022 09:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E7110EC2F;
 Thu, 17 Feb 2022 09:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Alo0JDL07LE94r3esJi6FQyukv4yFKTinKsei/BTI81xqnIF51jYxQtYiwBpZPh5XUiu0qMTAn3IL8h88VpmejVspSJdcKh0WauTk+AEkyctBoTtgPe0kidFn7zzf+Vi+6sxiPGwxO5NK7OOiKxSFPHmePsq0tBidhVZhrvxqGUvqv1l2ap2XK+R+EgrrtCYekzEvxijEaBh5QrfrJLR8tkZYzUASb7iiGIX+4C9XxnrwczI/nuZ+pxiIMWpsNkTZLpHHN2/Sa1dCM7T1FsTz4PkzgIxm75S8A0rGSfbnzCfjsVmLsuV/2LRBdiqHRaA5Px+sGDjVVd4a2cXu6jvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+fvC7FmM00Fqq+W1EWsQs8CSDW2+pKsNJSKOA1c48E=;
 b=V3rsqAo7RJ9u/wwApEcFkYcSwOzHFvE6gXwTb5XnW6dYLZ3VhdgKN9OaQQ/skhmRUNg+W6JjugR3YeA+pksWpP/crk2E9xytyJgoewTTApT6+26ufWciEoDwFvlO064kSsdXLNO/QHXGRQth4Pcu3J1qiB38bPSoK79ReSnnh3tki54zxhDcIqEbTh3z2UidE6etGmFfTL4oIG0zPWwr72f5d+3AVE+iUv1nmci4IY/xuMVihhAaT0v8EN1kHMHBp5C0UgyCINh7VXDseTjBZltKzTl8CSL69Gk2ApMPvDG4PA9Nd3Gl0/Lr+/mU9arxGS8bugLcIxOwl3nRUYjwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+fvC7FmM00Fqq+W1EWsQs8CSDW2+pKsNJSKOA1c48E=;
 b=Yl21PMOUebjMnr2uL4bjGuan9ZFfqMVw3574RZqz1RBsf+BKOZyGo9q+0HwGoIomVMVTW5pm+T7cFUkHexudcCFsVQWJsP2O8kFqlBMdLZGRQ5xVVUjO9ao4QU37ya87QaB2MEbaoqY8kN4kfdd5R3E60Spfm93ajLOu3OrBVyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 09:15:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.017; Thu, 17 Feb 2022
 09:15:29 +0000
Message-ID: <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
Date: Thu, 17 Feb 2022 10:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Content-Language: en-US
To: Qiang Yu <qiang.yu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20220217090440.4468-1-qiang.yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220217090440.4468-1-qiang.yu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da0c031-69b8-4ee3-e652-08d9f1f60a9b
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB25780A87749A83172A79137183369@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+kcpARmUdPrKHB08aCCDPfP1m+srDN34dwj/KWuWgmhAe5ewImANmJ4RqycDDmgS2VpFM5/fS2KhO5+jg5jVm+EoKoh0AedBgcH/sHvtc+ReMP1s/dMWcrjN6AZZMe3eZZGTnK+Vay1saAUCsLE/KsRJvvG7b9QTj1pLvHThsBk5+MX3yX8kb0JzHWPgL6vVvl9+RXnwc8eLnIU+zUM7TgRwedN/amv5Eczfz481pHJ96WM8hYJnONvUsyvPZJ355VX8MgRhV/NE/Rb4VAosNddtXAT5KHcjKQ6d1KKH8v/8rc9KU4w9HnJcIKAjQZBz24IwA2NUP0fLPFCmFDyMH3CDzAUHh2ExL8cuihK9PN+Soyeqed/j0kl/BCsh5zyQrXQ92UdUoN3GMVGOPQ8RpvwWxn5MAQYao5xJiV+cYa+JCbG7gRPay7EDNmNeBIqi9ZlRRQbTVHJfltoo4O3uLLPfEGGnHkAbRGXqjKi6Y7BQ4DRI1BXS4+15js5Hp8fU+FLGLc6T18aidhYaMdjmemz3N/hZkh72DhwnfuqKMEJ1uR4XwzjQWWrs5ct4qIofAytLh5ZZe0DM6KD5IZWnYqsbbglhbXMA+3QSBJapX1q3haoYhJ1vCGqGQu3YRhuwJARgc6F8Y0Wc3/Rlq1Z20O3Q8bij+GVrc4DL+2XCKovIOgYM0WYPm6MIEd0h6MSmAKiP9VxlEX7MAj9aEBUzdAapDyoGxQ3m2YYFA4rIppnNwcfjhxBu5X+5Oq6pzpE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(316002)(36756003)(6666004)(110136005)(6486002)(38100700002)(66556008)(66946007)(2906002)(8676002)(4326008)(66476007)(6512007)(2616005)(508600001)(86362001)(5660300002)(8936002)(83380400001)(186003)(6506007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zkl2UFYwRnB1VWNvQnpkMmUxTURyTlhubGtVb0VhWnJTMldMTU92M25MK28y?=
 =?utf-8?B?Y1pxSHFicG5vYmoyVldKdkFUOEZveGo0REFRQ3dkblRaUmlYdExFM2xBRkM0?=
 =?utf-8?B?RWNCL0JUb0J2djRVcFVvaDhhZzVLRjM4QXFUMDRlNkhIT0QrNVZkV0w0aFlO?=
 =?utf-8?B?bktqUkVOL2lOV1poZ3N0MDMrZ2pMempobDY5RG1tK2k3a2VQMHZ4TkJ1cENu?=
 =?utf-8?B?a2NPdkhjZHRFNTZnaTB0dkl4bCt2QWJoclJGcFVuY1UzSUR4d3ZHa1F5empk?=
 =?utf-8?B?U2lmby9NeDdKb1l3NGQrWWkrbU9yNklIS01LNjhFYjRRTnhJcHM1RHRieS9T?=
 =?utf-8?B?MUNsQkVBNllTRXo5YXNOMUxpNEhWcmhnRFJWcEozZHU3SHQrNDZRYWlOYkpU?=
 =?utf-8?B?ZGlCK0tJWi9tSGhjZld4SllZenhxOUt3OUJDMTJxOUxscm1jbmowZkNKWHYx?=
 =?utf-8?B?Z201bnF5c1h5bVRFTlVOOFBlU0tySGlySW1jRTlGajRPejBVei9NUTh0eitE?=
 =?utf-8?B?TzJubTVqckhjNGZHenc2Y0dBd0FURkhOZnNiREdLMlJWS0JKWFZIMGNTVlR6?=
 =?utf-8?B?UHNrZXE5dHBMYjAyZXVCbkMzbFVSSEpnTU55UmRwVDE1VWZ4Wk1lZzJDbElx?=
 =?utf-8?B?Nm5jOGM0M1k3Z01vV2ZoNDQwZGFyREtMM0IyTHpHWEJWSzRKcXFnWjhRZXZn?=
 =?utf-8?B?TTl1N1NheGxRbUFwTVpEcVBWbm0xV09iRnhZQXlmVUdPNU54cXF3ejFoTEdj?=
 =?utf-8?B?dXRHOEVxdHMrM1kxeUFMeEtmK1N1OTExd0xieGNZb0h6dWMyMjgzRm5PZWo2?=
 =?utf-8?B?dXd2WXV2M3NTT1hVUkN4TnZiL1ZOM3lVb2JuZ0FVUWwzNGtTNlo4MzlUcHNv?=
 =?utf-8?B?VE5sVzJocjlNZVJicksvY3lNRmp2S1JpeHRzTE9pRStSeXFDUGJRcCs5NTlo?=
 =?utf-8?B?Z3ZSOERtcjRqaUdGS3BWZmZ4MUJKTXZrMWloSGNNc0o1cTAzcjVtenkyT0Jq?=
 =?utf-8?B?Tk5sZWNrUUQvNWpqbnJBSjl1K1JqMnF2WVZvbHYvaXJDU2JkU25jZTJ5WkJl?=
 =?utf-8?B?MnAxcy9KaVVxWnpiM2o1aTJOYnQvTHZEdXlpZmIzOW0rcDdQZTRtZ3d3WUgv?=
 =?utf-8?B?dksrMnV5RGdrUDhDKzVoTTJ4TkFGZkUvd0dlZ2pSOFEveENnOVVPZWNKb1BU?=
 =?utf-8?B?ODd5TGVBbXZMeDd5dVlLWVJQNFZMZFFqQldqaDJUMmxyR0ZwOVltUHBmTHBt?=
 =?utf-8?B?UXV0bUh1SjZMRkVnRmorenBOQ0g1Q0VhdkV4aW5qRFQ0TmJNL0pPd3gwY1dF?=
 =?utf-8?B?emhPNTdUSSt5UVlYWDBlaUZ2L1piY0NFVE1LN0hvbStZa3hFcHg2am53VW9a?=
 =?utf-8?B?TFdMYks0VHlJemVwS1lEOFlMUWJvNDZsRWpYODBVL281cHlueWsrUmFXOTR3?=
 =?utf-8?B?TFFWbncxRngvUjZ5WGU3SGJQSGJXS3VUYVlJcXZycHJRNVlUMTVWMEI3TjA1?=
 =?utf-8?B?SnJCMDBMeUU1bit5RmpWMy9Hb0VWN25JV2Vsc1k1ZHhMR050Y1dnTzA5UHJE?=
 =?utf-8?B?VU1naWZJL0Q5RS92bnRaYzd5eFhCU2pIK21DZFhBdThkTVZaellXdEoyRUhK?=
 =?utf-8?B?ajJHbEw2YmI1ZkdaRGdRVlpNckVMM0N6ZnJ2dXlJU0FSNlgzWE83VUVmQWtE?=
 =?utf-8?B?K0dQeEZaS2ZEQU9PU1JBS2RaNFcrVUNRMDZmdzZac3grbDZ1VnozVm5CRHJK?=
 =?utf-8?B?Nkc4L2NvYlJYQ2NxN2xnY0p6VDV0cjRMbzhHR01CRFlkSm40dlhsYlJEN01t?=
 =?utf-8?B?cVBnQ2JQbGVEMmJjZjVHSjFSR05WUjM1UHN1UXYwWmZFdjJFNkVRbkZsZVpv?=
 =?utf-8?B?RnlVbTdWYUsyL3cwZkhPUlRCMmcxZ05TcU1OT1d0MjNSZ2lvb0I0Q1pDNzZl?=
 =?utf-8?B?RUdvUHpOZGFXY1lpaE5EanI5SkRKUE5Oa04vOVdjWTVHY2hzYldiOTRJS1hH?=
 =?utf-8?B?K2RjVGJodkY0L0dOaW9KbjlWRzZtZE52RWUvOHNtY1RtbFh1ZHIwRWVaZXdU?=
 =?utf-8?B?a3dxL0RmRzY1WVoyK2JWRzQ0UVdnVmYwSCtkSlhsb3ZpNWk2Y2ZVLzkvZXEz?=
 =?utf-8?B?Z2drNS84eGhyNjM2cVdwYkhTUFNPTUdydWE3WVVlTFJIanBwNjlkWWkrRFNE?=
 =?utf-8?Q?Jvgojk6iLNrEbuvPyZHxYiY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da0c031-69b8-4ee3-e652-08d9f1f60a9b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:15:29.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siWM4/xL7zMZqtr/TjrUGAfSP1sJ74kTNS4B9aGFrLt0F0OD+W2rcyVW8/QnuaNp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.22 um 10:04 schrieb Qiang Yu:
> Workstation application ANSA/META get this error dmesg:
> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
>
> This is caused by:
> 1. create a 256MB buffer in invisible VRAM
> 2. CPU map the buffer and access it causes vm_fault and try to move
>     it to visible VRAM
> 3. force visible VRAM space and traverse all VRAM bos to check if
>     evicting this bo is valuable
> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>     will set amdgpu_vm->evicting, but latter due to not in visible
>     VRAM, won't really evict it so not add it to amdgpu_vm->evicted
> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>     ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>     but fail in amdgpu_vm_bo_update_mapping() (check
>     amdgpu_vm->evicting) and get this error log
>
> This error won't affect functionality as next CS will finish the
> waiting VM ops. But we'd better make the amdgpu_vm->evicting
> correctly reflact the vm status and clear the error log.

Well NAK, that is intentional behavior.

The VM page tables where considered for eviction, so setting the flag is 
correct even when the page tables later on are not actually evicted.

What we should rather do is to fix amdgpu_vm_ready() to take a look at 
the flag instead of the linked list.

Regards,
Christian.

>
> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
>   1 file changed, 47 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 5a32ee66d8c8..88a27911054f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>   	return flags;
>   }
>   
> -/*
> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
> - * object.
> - *
> - * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
> - * it can find space for a new object and by ttm_bo_force_list_clean() which is
> - * used to clean out a memory space.
> - */
> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> -					    const struct ttm_place *place)
> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
> +					     const struct ttm_place *place)
>   {
>   	unsigned long num_pages = bo->resource->num_pages;
>   	struct amdgpu_res_cursor cursor;
> -	struct dma_resv_list *flist;
> -	struct dma_fence *f;
> -	int i;
> -
> -	/* Swapout? */
> -	if (bo->resource->mem_type == TTM_PL_SYSTEM)
> -		return true;
> -
> -	if (bo->type == ttm_bo_type_kernel &&
> -	    !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
> -		return false;
> -
> -	/* If bo is a KFD BO, check if the bo belongs to the current process.
> -	 * If true, then return false as any KFD process needs all its BOs to
> -	 * be resident to run successfully
> -	 */
> -	flist = dma_resv_shared_list(bo->base.resv);
> -	if (flist) {
> -		for (i = 0; i < flist->shared_count; ++i) {
> -			f = rcu_dereference_protected(flist->shared[i],
> -				dma_resv_held(bo->base.resv));
> -			if (amdkfd_fence_check_mm(f, current->mm))
> -				return false;
> -		}
> -	}
>   
>   	switch (bo->resource->mem_type) {
>   	case AMDGPU_PL_PREEMPT:
> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   		return false;
>   
>   	default:
> -		break;
> +		return ttm_bo_eviction_valuable(bo, place);
>   	}
> +}
>   
> -	return ttm_bo_eviction_valuable(bo, place);
> +/*
> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
> + * object.
> + *
> + * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
> + * it can find space for a new object and by ttm_bo_force_list_clean() which is
> + * used to clean out a memory space.
> + */
> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> +					    const struct ttm_place *place)
> +{
> +	struct dma_resv_list *flist;
> +	struct dma_fence *f;
> +	int i;
> +
> +	/* Swapout? */
> +	if (bo->resource->mem_type == TTM_PL_SYSTEM)
> +		return true;
> +
> +	/* If bo is a KFD BO, check if the bo belongs to the current process.
> +	 * If true, then return false as any KFD process needs all its BOs to
> +	 * be resident to run successfully
> +	 */
> +	flist = dma_resv_shared_list(bo->base.resv);
> +	if (flist) {
> +		for (i = 0; i < flist->shared_count; ++i) {
> +			f = rcu_dereference_protected(flist->shared[i],
> +				dma_resv_held(bo->base.resv));
> +			if (amdkfd_fence_check_mm(f, current->mm))
> +				return false;
> +		}
> +	}
> +
> +	/* Check by different mem type. */
> +	if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
> +		return false;
> +
> +	/* VM bo should be checked at last because it will mark VM evicting. */
> +	if (bo->type == ttm_bo_type_kernel)
> +		return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
> +
> +	return true;
>   }
>   
>   static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,

