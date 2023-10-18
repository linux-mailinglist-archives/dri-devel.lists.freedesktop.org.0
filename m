Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DCC7CD4A8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 08:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538D10E087;
	Wed, 18 Oct 2023 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD08B10E38A;
 Wed, 18 Oct 2023 06:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeuOV+jZEC7p+aCBX/fPToFnulOl6c6TRtLafOUG58o/zOcDibFO/ns3D+mNg0vJobZhrVSwy3CHbgm/fk0VUU/T7DDwavG31QF32CzHn32zl9DLzb6vZTJOrMTx2OMcv5QXXu/nzX2ZhPgp7NUH+75xZDFG4fOG85UoU1w9rFY/US+PCrDaoQxSSn98mMiH8BZH8bNtSnS3ni78TSMS01ipseKcQF7Jgegsd7KGs3AU8E5KIxD4Z1YQNT5g9DglS7mU6NS27qLUluYQcGR5SwtUYA7mlGFV46zb4rHnZNcHJ6lmTMqutx38Zv2IP7nGIYVw3WBAT4MHgTFomnhIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh1NFiy9Yg3iOtYfSKAQBwx7hL4Zem9Zap6TOsAbjdE=;
 b=m5zcXCX0JMcEEbSR1TkW/yr4GhCSKKyKJVerF6N53iFUuGY3v7wWduZIh+TnFei8MA4ZHPL9lXfBjRNkolnmF1He3w3hFoECqtfD6Ri8A9j5Osn5rOwnTbLIMGmi2yfrTNGL+nYqEKdPidu6xyefJEPSGbLk0xZisi2+u7mwkXuprP4ufYGwHgWM1jKQOc2ZCRGXZRwAtPve2+ObdqTptL7MkKTmm2TON+TvTAr7Wtw/+g+rnXC44Lv/ZSQCI2bjRrs+Z8kECRq61HXOzVWnlQZyWC3zpSC1NTYDSGTr4KjXEeR9IyOGGGtUxf90xlklQ6g2Um8aKtUHUNvEzKVP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh1NFiy9Yg3iOtYfSKAQBwx7hL4Zem9Zap6TOsAbjdE=;
 b=y3uw56cSL/2At+RJmJUJ9sJDcMDwl+S6YaUyV0tVEOTc0P7iE+pAAC5eHLZ3/jKOGynHjgQ0/J5YGSmScZmXpbRCMbsVhLPMJeyr78cjbKRtB4go7lVZEIiWApAqyj3Em+f3fueNbX5LJJPrOH+usht8W0RroBEqjXzDJKJmNJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 06:50:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 06:50:52 +0000
Message-ID: <d44169f6-3571-4892-9223-40dd300f2062@amd.com>
Date: Wed, 18 Oct 2023 08:50:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] drm/amdgpu: Fix possible null pointer dereference
To: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
 <20231017211337.1593869-2-Felix.Kuehling@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231017211337.1593869-2-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 1facfacd-ae7e-4d9e-d111-08dbcfa6920c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AIumRsl5CCB8kMaGgaJgZHRkCetr6yiHA/bCCIgenzpWMRF5kPkSOB3WR9jd9+6AMNxWNnFm9660AtkqlF9dbuEBpdmN1ari0mlFZcfuJBSJrtz6/zxmybQn7iD8EyD0AKaQuVA9pFPthC+Z/ENajKkKb+ipIbZ6JrPEhxW/NwMdiqZsWo9RKwQFQXYALwo8apu4lOeteEpszjdFHzENeBfyOhYMq3LpLDrGi/LzYmJFuKsR3n9g3K5i2BzNSXK7t+OO3TlClRg31cN+k/3+X1swZJXqfU76mp4j0HSZOBDSg4v1lJJhCtFVI0j775SSGjaiwk09G/lb3KQ1BiZkrPNRpSja0R4LYc+wz8ljR4HiP/08NcmkxM+ec5m4mEBHVLySiSo4KC1FxFP2SAxNrIFmH2q5sNnZrBk4tBXemeRStJqz8XC963C82s5pg3mbLsNMalQF7kP2SAFmSOPoyUn/++wStP3GAFb9oruw447ekYC/uQp/6Kq1DLvfEWSnmIYiEtFcNR/jOf+mcUzSHnmh/lhO5vl6VMuTEKzvqmlhT2Tvuu1ZupOd94XjL5UINH8HJqAp2Q1cTVbi7zSEQwMiRk+pyBu/NmlozxmErGmMU4vUtyh6oyIzWTFeaFhiGlKNOUgjd2CPTEw2Aqgi3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6506007)(26005)(2616005)(38100700002)(66476007)(31686004)(316002)(66946007)(66556008)(6486002)(478600001)(6512007)(83380400001)(66574015)(6666004)(4326008)(8676002)(450100002)(8936002)(5660300002)(41300700001)(31696002)(2906002)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzVuQXFPNlpGT05HNlF4V1g2cjBtTUZjNFNsNHlEQTlQR2VFVlBNL21JMkE4?=
 =?utf-8?B?RTVyLzM4YkwrZnNnb3k4cUpwMHFMMjlKRytlOGtoRGVqODlvcVAwT3ZrOUxV?=
 =?utf-8?B?bWd6ak9Xcjk4ZWZVRFp0UmY0NUNFYndHbmtDb0d4a2luVnBGWXQvbG0zNVgx?=
 =?utf-8?B?UFVMV0JaKzh2aE8xbzVHVVpKMjBZSEplbk1MR3RvSno1dHY4SVdQMTNSTjV1?=
 =?utf-8?B?K3Z5aDV1ZzUrRVF6NksyU3dFNW5weEo3Ky9LeVQ5anVoUlNFZzczK0krUW9E?=
 =?utf-8?B?V1ZBdVNZTld6bEVDckFkRkxET1lzWnFWZEhqOVlxZHR1bUx6cnNlVmU1WnBX?=
 =?utf-8?B?dWExekJrSllNY0lzVWlUa1o1NXFRSDNzcG9wR285YzFBSFNhWFlwa1daclF1?=
 =?utf-8?B?Q2JPVWhTNVNDbGRock1oenYyVVJrcTJTVlpFNnRPekdjZWM0M3d6alNEem1V?=
 =?utf-8?B?OHJTN2xENi9TVWcwTzExQ3V6bzZGeTV3cStTd3JqUktndC9IaXdvN3Rja0FZ?=
 =?utf-8?B?cmVjdEVaTnhCem5pWEhmazhzcUtPVlV3dW9KMmtBUUFXUlJReVpQanM3RWVp?=
 =?utf-8?B?MEZJNUwyd1NkbklSWEgwSC9HN3B2MzdXa1ZlbFloRVd1UDhOTU5zV3AxMUth?=
 =?utf-8?B?UXV6MktMaHJBRlNlVmZXZnB5WHlCVENnSS9xNFRuenoyMUtKY2QzZDN1Q0RP?=
 =?utf-8?B?V0dYOXordEQvNjZPVm15V2UvMUpUcFY5L0psZE0rWjNaVVZYSlhSL0oweFVn?=
 =?utf-8?B?WllhM3ZNdWlkMGNZWndLTzg0RjZ6Y1BuQXA4U3pxTWpXSDZLREFERE9xMDNv?=
 =?utf-8?B?Wkc2SWkyanlDbGFkOWJUbG1Yczh6aDBEakJpSEgyTUI5L3NRQ2RMeWVOdUxk?=
 =?utf-8?B?cyt2Q21OTlRRbEdrYjhFdG9CenJTc0lSUENNNE03TlVxMzdmazkrOUJUSkxx?=
 =?utf-8?B?VE0waTJ3ODQrLytEVms4K3E4cjh2L0gxcnpCS0pPZmVXVmsvbmNFOE8yeXFL?=
 =?utf-8?B?ODF0TXdyUk5uWGNZQjlQTWZhVmovTnorMkUvSXJ0VHh6YnI2bzFOR0VLV1hV?=
 =?utf-8?B?d2FKUGVERlR6bjJqRFcraUUycWV2bHRuTkwzYnF6OUk3amF0QW9XclJCNUxD?=
 =?utf-8?B?U3FMaDNTWHZPalR2dFJ4OExGYUdyTzZidThFVFY2eXBzdEpTWGRJT1BEM2VI?=
 =?utf-8?B?cGFxQTFwT1c5UGcxSWtZWGdFSjl0ZlRCc2N3V0VMSk9abDcxS2wzSkFHcXZv?=
 =?utf-8?B?ZTl2SHJGZmZpMW50emdWVVdNQ3JHbFZuRkowZDlsWXdWaGorN3ZNY2plemN2?=
 =?utf-8?B?NnkrY3kzSXBBK1RncHdYSXZZT3JPY2szYXlRWGZwM0RLVCtwYmhLY0tGU1hs?=
 =?utf-8?B?aHNjRjBhY2hMalNSS1R1WmpkVWFaQVBnRnZsRE41TUlTZnA0WWRGU3NSMjNE?=
 =?utf-8?B?T282RitnSVV5c0llLzBFOXBhSDhZN2I5dHQxSUk5UWZQdE42V1JxU3NXMVdw?=
 =?utf-8?B?bXVhVjNVdysvRW5UU3RQM2wyTlFmYTBheUdWdExZRmMzeE9FZkdlYWhZc1Fu?=
 =?utf-8?B?a0w3aGVxQkNpb0V6QTUxamh4YUJORjQ3ODJMc2hWYVBaYm9xVy9kS2EzdlFv?=
 =?utf-8?B?QzJTWVpRRlVuOFJYVTNla3JWU3NnNkFrWm9pcnhNWFlxb3lUUW1IbkpCRjJq?=
 =?utf-8?B?QmIyWVg2S0NFbXFqbGpRMUpVUGF3bnd5YmNkdFl5TlpVOXVOSW12NFdSTUpU?=
 =?utf-8?B?bktWRjkzckhtZDViK25vR1JZQlEzTExRWnU3OTJJZEZGekh4dVpqRHlkNVdH?=
 =?utf-8?B?eEI0dDhjRkhhb3pQZ1NZZlVMMzlRK25QUlZSWmYxSHlUMEVuR1k2M3lobExr?=
 =?utf-8?B?NjV5R3lUKy8xRDJYZm44VGlhTkg5MmFXZE9nMC9HQm93aVlZSzhGbWlCY2xQ?=
 =?utf-8?B?MmQ5NkgvOVI5YXBIYlZBUi9mVm5BVDh5VzA0U3RrUSs3ZlBheTNORUlsUlpk?=
 =?utf-8?B?U3dUSWNMRnRWK2VuNXNhd1kxQ1Z3Q21IR2FjQXYrWjV5RHBTNkEvSm13Q0w5?=
 =?utf-8?B?SmNQMFJ2NjdCVTZPeDBwV1VyMVJSSWU5UWVXZTRTU2RON2ZHN0ZOWWhYbXdn?=
 =?utf-8?Q?kTtAsabmXePToW6YlI3V1Ujbd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1facfacd-ae7e-4d9e-d111-08dbcfa6920c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 06:50:52.6839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpj2V7y5ZlYrxYB03rQd9PoLmnNihHCgyzIrlluFnZ5tmhWkBZSP451AW1x7JWsa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.10.23 um 23:13 schrieb Felix Kuehling:
> abo->tbo.resource may be NULL in amdgpu_vm_bo_update.
>
> Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 46d27c8ffff7..d72daf15662f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1007,7 +1007,8 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>   			struct drm_gem_object *gobj = dma_buf->priv;
>   			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
>   
> -			if (abo->tbo.resource->mem_type == TTM_PL_VRAM)
> +			if (abo->tbo.resource &&
> +			    abo->tbo.resource->mem_type == TTM_PL_VRAM)
>   				bo = gem_to_amdgpu_bo(gobj);
>   		}
>   		mem = bo->tbo.resource;

