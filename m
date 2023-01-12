Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46857666B58
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 08:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F17B10E880;
	Thu, 12 Jan 2023 07:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1261E10E880
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 07:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BG+N6ShrNyks6EGB0DvEPd7ADDBpVdOttLtRvWuCKtWIGHw+YpRLWJcrTd+LqkgtayXbJBOKNLrNBPNkyQzuOFM+UYuQYVfUiBchQBB0GAI7lFx3mQeRKhyItnZVobRAzt1xOJqJfSI1VSfAiPqa0TS8OGUJizXr+hEA2wtuwM6B8s5iy2pyd2/LDFVg2EKKob1wSg/7qjZIepnGMdFvgbIJq74SjH8NB5VdzcriV7kw6LiJ3cwmXJykHabdNWh37QNyF/4p41BQ9/cQ0xv5nHmbOIi6xZRmFx0nVILM1K4myuj3gNcN+gPm/81RddeK6Z17XQYEYKhBlDWieLUFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAMPrhs/95OuUL0qnADA8NOpnjjWm0UFJD9Jp56Wqcw=;
 b=XDX1/7N9UNrcIZI6W2JOn6Nl/A9BHqRxYgIvTekDgLYjGonU6Fzdh5eyz0bZMBPMyXFa6TRDR91U54B4YctotqhvdyS6nAdUmDvA3GzFcQILDYD7i4pqX5Yjs8JERDeby9tT2QwBYSDEi6PgPnLXryu/SJEAAcYJnRe5zqPYLwLsgfaCazDbCGKmaS1DobPrtYwRW0VZ7dqbqa6r/zCxSpIcf1twXbtKrIa4hzjQDVfkUPm/tfcam+1dVVHev0lXaspWfpKsg/Ip1iNZy6Qhasi1+lGPdM970tTxjhLBLcfovMjAc7cxk3702sr5QE7U1WzAuJgupkQBnGgqrmbmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAMPrhs/95OuUL0qnADA8NOpnjjWm0UFJD9Jp56Wqcw=;
 b=E3dVS0cZ+0i/Fh+GvAsLeuOMZcda2o6UuumiPS6u3Y/7/tR8nalNEj5qe0ZEotbfFqO4O67TtcQE46rO23UyBCD9ewuYNYWw8BoduK6GmRI6c45+8gA/OqnaIEvWxkrOFWx2lNvogNMxdnZHXqaAEfARjFlnlVIDWfxfmQlY4vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:22b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 07:01:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 07:01:19 +0000
Message-ID: <e3844067-5bb3-8c5d-bc8f-3ac4c42a3801@amd.com>
Date: Thu, 12 Jan 2023 08:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/ttm: Fix a regression causing kernel oops'es
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230111175015.1134923-1-zack@kde.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230111175015.1134923-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c326450-d02e-4286-1dff-08daf46ace21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IhpV0KInzVIZdfnSB0pUj4F75QXI9ouv2eZxeZvU74KeySsAeEKnn87u20eZ41O21mrWdKu/n9b+b1r2iLwPm97kBlztmQjfTEqBVpv/BcKw27//LNUGr3UfvLVx4X3NBMhAziG2aLcnb5mV5nFZ3g1/DyIiPzjQOZFYcY+CpanFP19orZ9xx40HNzteZl1+cwdV6ITUjqXDiVDHHve0WSi5wNGuJKo4XYLvbeuaEyTXvz5YTemuMzOJYCKfrl2GMqOf2aVgJWCOXmIzsOPo9U7we/o+G/3cSZfUHsgW+mOOnhzBan6CqASwP1PO3D+ogXWzlC1Nk99sOqGljiyb2RuF0fWA6nAUOs8D9FKu/fkenNFRQ8Tm62bEsjYBaAabLXn0BroRt8IVF0J50IcjjVVQb8bdTwAKFaGsbW1tmBM3K5KAKdk7mgP/FUtFhkImy2j4kv3WKdm18l3rwm4rMxMI0e7rOujuuUj9VbaPdvMH25UNcy1HhbOhmHwdirkF4BvxIDF/cF4cSO1rwJ545a0y45pYzLPU2j6PT9Gfnqe0rHf0d9EQVn2Ttcj93tioYPwkJzabAbcC9Y2r6ELAlIWoSpfAyYwMsW1iXw/gJfNM9ZTDIfPQ5CnXqbBnhYXvOO9RwITH/Shzo+i5w6q0aBHrQ6PnhndKTU9px9txx/Q4dfXFBEHZePfls/TP+hSLdXuxOoAy4nPiXXqHrZTOcogvOvA6MjNN2HjrrZ+tKymtAMSuUJArFdYDKRZ6QKlNc+ZYJsd4jT9Dx6+niRYg06CEWZe32f9WKzgYpqrQss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199015)(66946007)(66476007)(4326008)(66556008)(8676002)(316002)(5660300002)(2906002)(66574015)(26005)(8936002)(41300700001)(36756003)(31696002)(83380400001)(6486002)(478600001)(6666004)(6506007)(38100700002)(2616005)(6512007)(186003)(31686004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkY5ZlRtaW9NM2hVRGRDaldyT3JHWjk3T2hmOERqSU9LTmRRVW5ROEQydHd0?=
 =?utf-8?B?ZHhNY1JSRkFMWlpzSkZOOUhpdHFRRXhQWUxtMGJiUy9sUERPQXN2enV0c3RB?=
 =?utf-8?B?NDBwVklGR2prQmtrR3cwTmVYdXU0d3BzVFpHV3pUcmVoRS8zMmpPQ2NDYzFj?=
 =?utf-8?B?YzlWVkxlNkpYT2RGNXVjaHYzaHkrbzNWK3BJUWF5eG0zY05pdmZkYmxWNXdD?=
 =?utf-8?B?UnBpL05lRDlOYkJyY3JlMHZaUW1WUEpERGJoMzBWSnBzSExUYWRKUlNMMGFq?=
 =?utf-8?B?Q3cxUGo0eVpRTE1RYTVVaVZIQ2FsNmF6czdhTWM4RWNlbXllZnZaaUhpUGtv?=
 =?utf-8?B?Zytjd2d6elRLM0lyUjRlc1U5Z3dXYVFUOWFrSDNMM1JpV0ZLS0hzYXBCZk5M?=
 =?utf-8?B?ck1jNmtlV0NrT2g4dU5hYjdVbDhrSVNPQVFIOUtsK2FYUjRuM3cwNHB0dXpI?=
 =?utf-8?B?UjRmUnNUb0pBcXJxZEtMaWNpczhZSE9HVWozL1dNN0FOTXhIbWZLOTlmVmds?=
 =?utf-8?B?dGZPa3dqTzh6Qll1dlFzRHlMSHYvcUZPMFdFQjZVN0pBOTRNTDc5eUpiZDF6?=
 =?utf-8?B?WEoxYU9aMnFQVENwQUVUQW05ZFJhQlp4MnRBNUJMb0ZlRUQzK2dmQ0liekVG?=
 =?utf-8?B?SXA4UTVCVzg4UG8wNG9UbXZjNWxSTi9Ha0ZDRkZPQjZQUXJPRFNPZHFHRGpC?=
 =?utf-8?B?SFZBVUhJaitEUkpab0F2RGN5T052NVhXazhkeXJLcFNqOVFDNTNKWitvSU1Z?=
 =?utf-8?B?UUYyWVdjVkQvc0c2V0pCRmdwd3hSbEtGY1hpZHY1ZW0zVlVwWnhHOXJtTjVK?=
 =?utf-8?B?eTNGQjVRdjVTeUpmRW4vM2R4MGdYZkJtUm9CZ3Z1eGc3elFmTEtmd09HT25V?=
 =?utf-8?B?Wk9KYU5mcXhZcTUwRlNQaTU2QmVEeko5Y21PZTk1RWFvWDNUWGRzNVZtOC9M?=
 =?utf-8?B?YXZLaktjL3J2S0VMbGdtVzc3eUw1VmU1SG1OUmVEWWVrZ1FnZmRITm5IWnRG?=
 =?utf-8?B?VlNtTWhkdFUwbHBJT0JXZDBMT0lwT0V6aEdRcGRRa1F1ODBzQzBZYTFYaXg0?=
 =?utf-8?B?Zm5semNMWWJTeFBQeng5MnpSQWRBWWlPNXR6RTl2aEJwc3ErU3BXbjVZaHFJ?=
 =?utf-8?B?WkJjTDBUWjErM1NTMUljM2lmQklDYVdRNFMxOW1PTWU1VWo2Y1B0MExYOEhR?=
 =?utf-8?B?aElPLzdyN3NCY1RDVnpPbGJVZS9HSWtoaFk2VmNDNWJHVHExUENFbXlSc2Fr?=
 =?utf-8?B?RHdTeE90V2R4aFRuR3pGZnlVOHdiMmFXVnNrQmZYbnFyaXc0djF5YjNqbFpy?=
 =?utf-8?B?bmk5MmRWc2RXNWhFSnJNb3dPVkpCUGZqVUZxNUExTkNpeUxEUWJ6UjBOM1Jz?=
 =?utf-8?B?WGs3SWUzSDJDNjR6SmxoQXNndTNKaVRXblJnMVp2bnE1ZHRRSEhseTRTOFZj?=
 =?utf-8?B?cFBZOEpEbld6VUZ4eGs1RlQwTHNNa1UyeWVZZ292MFJLdi9DREJtclJxMDhK?=
 =?utf-8?B?SnRaZHBDVkNpR3IwSXN3T2hXM0g5b1p5MzU1NEtGZXk3WThpMnQzelhKNUEx?=
 =?utf-8?B?YU1ueWVjWGFqQVQyQTZpUmwvSW9xcSszYXpoR1MvRFJudWoxVWpReVN4QzBL?=
 =?utf-8?B?MWZRc013TUMyd1g1TGgrd3JhZ3NpREUwQVhaRWxZc0VvaTQ3bEJuT0o4bXVE?=
 =?utf-8?B?Z1krTzhVdFZQcVBicFZuYjZndVR1Y3lZSFRLR0ZvQTQ5bWpONUZwbUVldWp5?=
 =?utf-8?B?dXZiQXlFWFU0RlhOQWNqdG5VV1FNa2hpNXJFY0Z3aXFiTTNGOHVEQjJReXBl?=
 =?utf-8?B?dC9YU1dmWjBYV082cVo5M3c1ckFScXFhbUNVamJnOG40VWVRcm5hcW83SHln?=
 =?utf-8?B?R3pDb25qY3pNWGw1bHNDRDR0bmRsNkI3eVRIQ2JJeEhDS3lwQWtKanByWlho?=
 =?utf-8?B?WnVnUkhRTHJKdU9OcEtMOGFxNVI0eGdNQTk3dDMxWUpRd28yTXkzRWRWS0w5?=
 =?utf-8?B?UDRvbHQ1dlplVDBkRk15YU04bDFwT0RpNGRRN0g3MFhSbngyVDB1TzBOSEQw?=
 =?utf-8?B?WDhETVV1cXljLzUzekppRHFkME40MUdZTGRmTDIyVzRnT01qcmNaOHN3N2dj?=
 =?utf-8?Q?OFigWJTuWHDrZXZAYMAZzkcRg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c326450-d02e-4286-1dff-08daf46ace21
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 07:01:19.0365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7SnDpk3lQTyhjN4QyWlM4jVB1gsn8FSWL+TMBFtyUd4F1MTFIVwL14/DjyYfxBJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360
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
Cc: krastevm@vmware.com, Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.23 um 18:50 schrieb Zack Rusin:
> From: Zack Rusin <zackr@vmware.com>
>
> The branch is explicitly taken if ttm == NULL which means that to avoid
> a null pointer reference the ttm object can not be used inside. Switch
> back to dst_mem to avoid kernel oops'es.
>
> This fixes kernel oops'es with any buffer objects which don't have ttm_tt,
> e.g. with vram based screen objects on vmwgfx.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: e3c92eb4a84f ("drm/ttm: rework on ttm_resource to use size_t type")
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian König <christian.koenig@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push it to drm-misc-fixes?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index fee7c20775c0..12017ec24d9f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -183,7 +183,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   
>   	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
>   	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
> -		ttm_move_memcpy(clear, ttm->num_pages, dst_iter, src_iter);
> +		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);
>   
>   	if (!src_iter->ops->maps_tt)
>   		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);

