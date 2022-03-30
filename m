Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4B4EBD3A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CEB10F826;
	Wed, 30 Mar 2022 09:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D0F10F821;
 Wed, 30 Mar 2022 09:07:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0B6f3kqqafEZuGGMaq1pkPlx7OOU3MhII9/vmoKVhHbn5j1GwpFwo7wA4YGa69fK+poxJQvKgAa/wTqoUpkAHRc6XEGbUGdpjn89y4SYceaynv+M7IaWYcKT8NTXLKFA72tkCwpUBu4pZcRHA16XcritMQBwkh1kqAxgoumvyACAM7SEHPnI/oQwsWvHMQ7rwia1Zx2QrKFj7JwNzatQ8RsmbZbCZEQgm0jhm1MR+Ty8PP7IxLBo+JPB9ZEiKvxampNWjnK2U5xJ0Llp37BzQH0BgPC8JGaRsTOc0OUTh5gHWxcMMuyofu3Ah8T696c/4VEE9lXV+ek7BFzvH2Z2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LkfGTZUTlf/91mzRRQCqC/TT31KAf6yaEYO9pRAvSg=;
 b=CJ20Vot+KPW9n3mJsi8S9fdlfgHMM6iXU5Qz9O+LekmVrJjVO2Hl/Lrk4qTAm20j8nghkI7wdaPYL6q07pMR/d5B10wzCp+HlPPaRTgcVuWELv4do8HutljEW0MQhU0/xHIO3Nli6HA58RJi/at32u0FPcZOD0cp3wNmKVuDsRKdtqHNTmPhB+Qvi8TuZzHxQCbW8obArEmBFzbZ4WzcrMIr8V5wgYnZiI+L5IW/kpX11x3u3bsD6Nq/Fqaax69x38p4e/yHBnmvSDjVHWWAJW55cV+45gQtb22c5E8VI1xQeZhGfiRC8WNHxkcIkxApCci6XntCTeaNTDSvSIxI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LkfGTZUTlf/91mzRRQCqC/TT31KAf6yaEYO9pRAvSg=;
 b=M0U/LchqnXvOAwf2Dk3R/bRaxqonHB/3ZuQ3qVauN4Up6uTqz7YQdYuzuknOu5OWm4xiv2G34hcXg4y+uqLY5BRXFscePUOLpm9zrsbeZh8Bgm7aEmCyQgVHVRfq3T5t0CXnoAU5yHxuYSO1j9hyQaOaEcqYcspWelkKMZD1o4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.18; Wed, 30 Mar
 2022 09:07:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 09:07:51 +0000
Message-ID: <c0b22bc3-8bad-fd19-6d1d-164bfee851c4@amd.com>
Date: Wed, 30 Mar 2022 11:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: round_up the size to the alignment value
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220330090410.135332-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220330090410.135332-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0205.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d21f7454-3793-433a-3df4-08da122cc436
X-MS-TrafficTypeDiagnostic: DM4PR12MB5722:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB57220539790B8D87A8658AFB831F9@DM4PR12MB5722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdTGvT9BvsEa315+bHn5KNwEMjQYv3AiUVeTpk/CMJaMrptnKdi+TUDMIwBsV7tKtRmCT9LeSD3lPuNizPh9GSQotLfE8MZc5sVE/kqScRY8i4xGfRgeHrR0tB6LB/ngMz4zPZ6Pl/gAMs+0FsQ8y8uWQNrTMI/TF6yr1mSy2tkvn9uy/+KiwAPEUI0Gqe4qCvWWQ1RFDcGYlzRdhEQVtrzdmzIeyWTNcLAOqofjX2Lw81VwQW6YUuNjE3Vs9vOGC8QFMd5vMdlbWZR35rLbl5jiQK0oZwCwuqcWULkpa2CRe2cXo+rIAuHz/5ir3M//B/9zrOLawgMPAB3penfI7Jr4NXjTOxOXNARyYrClhE3Uz7L8dqH4jFD7LOOhZdqjzlscO+rGNiCYyQkQQfzfOAPvccRp6L9fTxGRimkAkteb6wK1mb6ir+DDFDHp8QsW9p18YmV8sPsAi14izvHksHfQ/RvQToLrYIs5VHCm+K+VCgAGm8yzXnGKsvzjw4vhpiBY9i8FUiaMa9lO+HwCd7HPp6dyyjNQb7eLwXhnlWi6epdFXM0iPfdPOst4DgO9Hqf8nQRckYFg5U4uB1qo35MUAHCAa/jZPXHHNtzX2k8TrK5wyROJfZMUSMqZBLOKn7BGUEZOOoJuOmf+CxMWqQy5Vz+Q6CGLi6IeX2kk+7FGOyLEqaHAPjCmp2w75SBg40G8yYegCTGvmYpTBNaxWBFRZFw0geq5yYOfGeqbU2zlA8qThiRhv0FlNxeTQ+Os
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(2616005)(508600001)(2906002)(66556008)(31686004)(186003)(26005)(8936002)(8676002)(31696002)(86362001)(36756003)(38100700002)(4326008)(5660300002)(316002)(66476007)(83380400001)(6512007)(6666004)(6506007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWpuOGdBWllpM0VDNmNibU1KNW1jMFEwdy93WGc1NVhraGZJYmJhUUY4ZUJK?=
 =?utf-8?B?ZDVkOG8yZW80NGQ1dm1WVjQ2OUh6YTdHbXRMN2FEcmZuemdHU2FyZkd2ekw1?=
 =?utf-8?B?QXJHVkVvWVBpcFpud3UvV3NkQTV5NEIyZ0RFMVhOb01PS1RNeVdxb2VuZDky?=
 =?utf-8?B?QjlMSFF4Q1lCVzBJVm9DajdkRUJyYXppWWFLaVpFSVpBanNadCt1NTIrOFVv?=
 =?utf-8?B?WDFWbmtYRXQxVDQxTXRNZDdTaGNZcGVFWlIyWmJVNHdrbi9rT0ZHV2JpYmZJ?=
 =?utf-8?B?blNkVjNKY1ZYZTVUMlVzZi9tQzBobys5K2s4eDlPSGpBV0swZkhOMXJGYnhl?=
 =?utf-8?B?a1lhcnRkNzIvU0dhWWtiQkhpRnNpTjJDUTN4cUJZUGs1ME5jdFVXSVVJalcv?=
 =?utf-8?B?bVhLR3M1QzkrbXdLa3RXdUhKSnB4Z2RhVlVJQjFOMmlrU2xrT1VldlpRM3p6?=
 =?utf-8?B?M3QyMnRsdXZPellSRDJHQlVEc29BNWUwWkFVY21NdmdwMWJJVlVRb2d0WjVm?=
 =?utf-8?B?ZTU5OUlDYTdBSjhYQWlXOGNCYklIVkg5NFRLK3RkUFN6eTRsK2JzT2JUUU02?=
 =?utf-8?B?VWpEVDh0K3k3ekVzTGM3NmZ6QzIyR0pHYS9UUVp0UFpFbCtOM3VLc09EZU9k?=
 =?utf-8?B?RWxQOE1KTytSQXhTVkdHMytwV3dpODl6aG5lK2NxRTI0eHlSbXhOd3ZoTUkz?=
 =?utf-8?B?S1NhcGU4RlV6K1JlVmJiOVd6V3BKL1lPK3R6VXJXY3F6ckgrdlVwcG4wb3Ro?=
 =?utf-8?B?N0taa0NGR2tQcnUrcTJoSzlReDlrT21veGdOOXdlTXlOVk9mTDEvMHN1a2Ju?=
 =?utf-8?B?ZmRVazVndjNRNFoyOXpLeWxhME53TWIxMDJ2dDVBaldudy9FS2lJOVI1eDFJ?=
 =?utf-8?B?c21aanJpRStYZjRSYjdpZmZyczhzL1liS1l6dEpkS3k4ZHFPRTJOVkdpclVy?=
 =?utf-8?B?UlJTZHVueGY4RFpWVFVUWWNVKzhpcEtaN2g5TnFwOFVGdVdtczVSbWRHNTFm?=
 =?utf-8?B?aDBKeEhjTUhIZmN0T1Bja3J0SkVCRzRVaFBPeVZiTXl5NjZpQjRhcjUyVzhw?=
 =?utf-8?B?UWJGbEI2eEVTRzl6TThSOFpUcWZlUlJBL1dIUGhzWlNyeFc3TWcwZEF4cGhB?=
 =?utf-8?B?blFVWVpFV0VxZXZ0Zng4dFEyT0FQdGdMOGU5WkFDdWhadDNYa0NiYUJXU3pu?=
 =?utf-8?B?SWZZeUtEQlVSc0VIMjcrRlRDd0lrUmJEbjVMdTFjVGpnQ1ZaWW8rN3BoemFY?=
 =?utf-8?B?Zk00ejJEc3RpNzJUNnp6RU9qUDNEMlJCM3M0TkJBMW1EWTF6TzVYN2dVNVg4?=
 =?utf-8?B?OU9ybE1Gamh3K1hVcmRrMVR3VFhlbHpJNXpaWExSM1JPZnliclFOR3J6WG45?=
 =?utf-8?B?NCtSV1hiaVdxeE5Ld3NrRWJtcklKV3VScjVhYUIzZnRoOXRJMjFSa0VtNGha?=
 =?utf-8?B?ZlFuK21nNGRwN2Y4TVhja2YvUnYwanhmN0doYTBGOW1uNHlGemJOMFFDYWdo?=
 =?utf-8?B?YnJRUVAyaS9lM1lPWkllbVZuWFNIV25ZTCt2UzdmY0VVQ0lNTUNxc1Zkdm1N?=
 =?utf-8?B?WGVtMlpCdUdRWENMZ2hVZDBocEIwMkh3czVrcE4rTndzWGFHeExlVHdWOHB1?=
 =?utf-8?B?WERYSHVIOEJWaE9rb3dPS0k3aFV4ZVZqQnZUd0dMVTh6R1hhaFdFWDlCUzNo?=
 =?utf-8?B?VVNtUUEvQWN6QUZaWU13dnIxeTRYSm1wZ2J6VzJQZFBlTThOdWVSSys0cXRV?=
 =?utf-8?B?ZkwzdFBJNmNJQkI4QmpLdCt5WUlqREFRNCtNUjk5Wk1ZSUFjM0dxTDdsa1k3?=
 =?utf-8?B?dG1aTmtscm84NzRqYTY0WEtuY2JkRWx0bTBBTnZ5REJVSWYrZUNqaERBRHlO?=
 =?utf-8?B?OFg1UHozSXVoVEloRXdiSUY0UGw0TmVjWlk3eEJzalNpS1lhU1NxN1FFTzdR?=
 =?utf-8?B?VS80ak1QL2pQWFRyOHJVODUwSHU0KzhNYWw5YXNBT25SNjdlR1pKQWhsZnhp?=
 =?utf-8?B?U2VTWFhrNkVsUHJkMm9Qd0hIRWlHc2xwSlFiK3BDV2ZwbHNZQ1FIYjlUWlg1?=
 =?utf-8?B?OGNtOWxVaGZSTE1rNE43WjNUdUh3YnpNaDlaaURjcFIxaXdONk9UTTY4elVt?=
 =?utf-8?B?d3dxT2FUZ21QTGpTUWIxaEtwZnl6Ry8vN1BsM1pHQ1ZnV3cveU02cmV2QVlu?=
 =?utf-8?B?cE9UMUsvaVJQSkhlTEthZDRuRTZKR1pBY3FzRkhQM0FkV0pwVjdlaEg5WFVa?=
 =?utf-8?B?Vk1YNm5JSitka2wzSWxGdnVPMkp1N1BFVHdWR0x5ajNrMXJhNXpXRnZrSHpG?=
 =?utf-8?B?NW5oNWdJRnhyMUFSR3hTMUhMeElvaDhHYlFkQjFLZ1c1bjdtWjR6UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21f7454-3793-433a-3df4-08da122cc436
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:07:50.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm/WAo6jf8BKrWT3lX2AZWZMw0r2p4jLjFJWLc7WsUlsiS6qigu4FK14+IC3blPv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.03.22 um 11:04 schrieb Arunpravin Paneer Selvam:
> Round up the size value to the min_page_size and trim the last block to
> the required size.
>
> This solves a bug detected when size is not aligned with the min_page_size.
> Unigine Heaven has allocation requests for example required pages are 257
> and alignment request is 256. To allocate the left over 1 page, continues
> the iteration to find the order value which is 0 and when it compares with
> min_order = 8, triggers the BUG_ON(order < min_order). To avoid this issue
> we round_up the size value to the min_page_size and trim the last block to
> the computed required size value.

Well, Matthew and you convinced me to *not* do it like this.

Has that conclusion changed somehow?

Regards,
Christian.

>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 72f52f293249..98d7ec359b08 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -641,6 +641,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	unsigned int min_order, order;
>   	unsigned long pages;
>   	LIST_HEAD(allocated);
> +	u64 cur_size;
>   	int err;
>   
>   	if (size < mm->chunk_size)
> @@ -665,6 +666,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	if (start + size == end)
>   		return __drm_buddy_alloc_range(mm, start, size, blocks);
>   
> +	cur_size = size;
> +
> +	if (!IS_ALIGNED(size, min_page_size))
> +		size = round_up(size, min_page_size);
> +
>   	pages = size >> ilog2(mm->chunk_size);
>   	order = fls(pages) - 1;
>   	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> @@ -702,6 +708,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			break;
>   	} while (1);
>   
> +
> +	/*
> +	 * If size value rounded up to min_page_size, trim the last block
> +	 * to the required size
> +	 */
> +	if (cur_size != size) {
> +		struct drm_buddy_block *trim_block;
> +		LIST_HEAD(trim_list);
> +		u64 required_size;
> +
> +		trim_block = list_last_entry(&allocated, typeof(*trim_block), link);
> +		list_move_tail(&trim_block->link, &trim_list);
> +		/*
> +		 * Compute the required_size value by subtracting the last block size
> +		 * with (aligned size - original size)
> +		 */
> +		required_size = drm_buddy_block_size(mm, trim_block) - (size - cur_size);
> +
> +		drm_buddy_block_trim(mm,
> +				     required_size,
> +				     &trim_list);
> +
> +		list_splice_tail(&trim_list, &allocated);
> +	}
> +
>   	list_splice_tail(&allocated, blocks);
>   	return 0;
>   
>
> base-commit: ec57376fba5abc0e571617ff88e2ade7970c2e4b

