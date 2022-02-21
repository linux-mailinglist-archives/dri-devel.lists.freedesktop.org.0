Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF8C4BEA3E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 19:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADE410E36C;
	Mon, 21 Feb 2022 18:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C3210E2EA;
 Mon, 21 Feb 2022 18:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnepjkcOiLjtRJ5krPOUrsXL5dZvBot0fv9mhS3wnegSPwSlWTontpYQxjDuPSsLCgjAyc27Fkuv3XEhjFAm2+ArOzp/7LYpwCSflC99uqWnHtvMvpof7jFpYGdQMjAg3GTA9XThcU2hVAD/NyLJuqybj/hnQCioCEjCz4E+LsyuMLK3mzDeJQz8BnDdB/k0/762F1lRaCp2wbSZm2mxUhrwWaFL53l4Jq9uDqsnxWIeq/vGQiPTjPm13GyCNyHEvQl52TDv9nkBSV+HVH22NFbV+Z2oUzc2PPhC2ObN5pXXRvFbdkRGJdzimGDk3oqnI/tObrm6alZN2YmVVGRBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERvPl+OlrsxSqG7UHROmq/fTBYzZRZmAuqKQO5SPnao=;
 b=Z/AHZlJtXEdNEqnCwSKSDElxIeLn1q69MfiPR6/vRQ3cTNa9+yeac+T5Rfvhli41UFdncu8LwuI4o1hKuRBIHa2C16dDy3Un8czzBbLlhqi1Znc2k0iw9ID56kMQgankGazJVxcRsLQlIiBEkOgVyUv6PPPA38962ei5j/kRXOTvqa3eXmtaimTzL/EKq/2vDUNJj+iN6fm3ybMxhenoylCh0FjZrHJHwILbAj87mwJxmG/Dob48306H2lfb5PyIKvlCWmgXkMk0Nt7E+dGuKZoulUQ4FAMR4+kj1nObjQmyrW06y2LX4JcNBWmbIRRyhfT2Gw0c+B5uyIHj+2V/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERvPl+OlrsxSqG7UHROmq/fTBYzZRZmAuqKQO5SPnao=;
 b=W0/aMoDDYkpr5LPH/QBIoZWTOj5pYE9cScbcQNNZNS6GmvXHZcNWfnhQh2mDsLCSj82ylSAThjD0DaiEqHll/v4LPYWNxvBNRgq5mtBC+CkDCBndbHymQUCAeR84c45vPQXfK3jxbGSqneGEQuAsAscLZXM4ZdFikT95PSxq3wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN7PR12MB2594.namprd12.prod.outlook.com (2603:10b6:408:28::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Mon, 21 Feb
 2022 18:21:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 18:21:20 +0000
Message-ID: <2dd9b372-4a3c-0a43-c70e-fc7692dbeaf2@amd.com>
Date: Mon, 21 Feb 2022 19:21:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v13 1/5] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220221164552.2434-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220221164552.2434-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0004.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc9de2dd-472b-4e51-d4aa-08d9f566f50d
X-MS-TrafficTypeDiagnostic: BN7PR12MB2594:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB25940A7714B2C742C915F5C2833A9@BN7PR12MB2594.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSqcUAEkW+S/rtQYTh+rTWxyBES6/wYPacgA3esawu4lYQVZ0DHH7XBaRUzUccbg0MgFwyQU9lxaybedOSLVPp/K+rKpYtSFPr8tmF7AN6XlkaERpbrVybmpFUtn8j3lnS2K3NimFfwMH1x52EchOh6S0tMiPETGEDQ6dZb8i7Qbv/oISFw16WownBZOsTAF3AkWn21fMSAnbHt4MkzpV+DjFchvrBBOSIkAj29S23/cr5jDy8glxdc1vcGieukW6zuJ38cyhRljOVOa9u07v2x5Dl26gai+bk9wx+fdkp9x6EoB+K5xbOTKco7pSYBWRZi0m4zJtyRxtonrE6mcb5LPHmZZrPs2FJRgrC1bNeWIzsyirVLJ/e4/SEyvmyKwLxczQTWHwXcYEftyHsqn1ZjSwQLggS8n3GsOAiJT1dHpakmM2q/Mgkmr9g8ZGRADrWhHiEkRuHYvkmQwGKtecgAhuAF5cZy26Ay6PbRSJy5NcYwssZHrvmsp9UYUro9CDlBjslxKkfx8s54fQ0IyXFMtOz0nujzRm3tX8anlKYNDAS/k60GWQnqMp4VcBGLpD8/hhREdPtwLLT5cwjPX5VIFwOPXuBi6qxgDod58RnKzS7T2qBoI7zvWoifk3GldioDkTGBchWXZUdOueIJOxg3m/yHyX1rDdj9iUYMEkvVfUAcGRffJ6MKct6oK6IWRXMFRkw9fF0osD99Y/loeAO+Gfy7SY9IYG1Qsf8cncB2T7X/7CZ1uAc4MDNpF/L+m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2616005)(66946007)(6512007)(6506007)(66556008)(6486002)(66476007)(31696002)(6666004)(86362001)(8676002)(316002)(508600001)(83380400001)(30864003)(4326008)(38100700002)(5660300002)(8936002)(31686004)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW84azRSc0ZVZjcyakxCMzlEKzNWZzdod2dwbjRmSlpWWkdRbGhXLy93dGFv?=
 =?utf-8?B?d1pXSW91T0RUdkV5OXE2NThsdlh4VDlsVG5MNks2ajJXdzd6ME94MDhXUm1K?=
 =?utf-8?B?Mkt0WG5iYzQxVjNYOXNBWlJtbDhlUHNVWEdTUnNjL0ltTWZDV1lSbGw4NjFJ?=
 =?utf-8?B?MWdmbWtUTzB6ZmdrUVI1cmlYZlgzb2ExS3c4YjNBdEkybXc0T3V1MTg0RVVt?=
 =?utf-8?B?WW9KMHZidXkzeEMzckZhS1liR3haR3ZyU1d2cDRzMFFZdm1pbEdUVGJDRmRW?=
 =?utf-8?B?Zm1wUUR0Q2dIL3NIY21nVGtjKzJHVnBpazlsVEQySGFtMXM3QUlVRzlhOTIv?=
 =?utf-8?B?Kzh2RHBmbENsM2RtTlRDZVltNi9XdW1hR0grRVdaQ3h0Zy8zZWFwVHhVZ0lq?=
 =?utf-8?B?T3lPVHc0UDNJcjhheW84ZnVQYjl1VUxtZDJ6VThlL1c2WEFMK0xNYTBMcHJa?=
 =?utf-8?B?NzlNQ095Tk1Fc3Rmay8xeE9SY3BDRXBvQmxvTnNrMHJjME9rQnJBb2ZReGsw?=
 =?utf-8?B?ZG9YbWZhRVloWTlTalg1Y1NCYW1zQWV3S2g4V1hEelVKQ2ttdWE2RVhPMGxW?=
 =?utf-8?B?VzkybHpVSG9NLzkrSHZwVS93cy9Oc2JxYy93RFY1eHJIZ3BpckZPSVNLUXo5?=
 =?utf-8?B?SWN5VG55d1Z6WUFnaHpFMlV2YklkbmxKOUpKdHIrNzNIb0ZmcVY5MXM2QlpV?=
 =?utf-8?B?UlhmMHhaUlBOQXdBam1lczZDc1IzbnZTVHFWUjAxSXR3ZjA3SEVpZ0VZUXlo?=
 =?utf-8?B?NFZxWFQyK3ZMTEkyTU14Tmh3WGZ3WlZJSndVSmd5WEJuZmRvZmlaRzRJT2FG?=
 =?utf-8?B?Wk1YNStlR3BnL0FGSExNemNWTFZ5bmFSWGd4TG5YbGxRcVNDMlg2Qnl1cXpT?=
 =?utf-8?B?M0xjdzVuMTNES2ZhWnY2blhzQ3Z6aTVoMVFibHlLMXFCR3R4M1ZyTE1ZNGhM?=
 =?utf-8?B?aHpNS1RHTGZaUk1FS0l3QmRRRzlFaTlFV2c5REloNEdIMHpybm5Sald2QWJw?=
 =?utf-8?B?SmxkZlZ6bnpmQkhVMDBXTmJMelRCYzIwdVY1WXZ4bklBeWJIZVdpSVIzUVVr?=
 =?utf-8?B?YkcrR05Kb0t4d3FxWE56QkZTU00xaXNnT2dNNHBvMUkza1ZTd01wbW4vWXB6?=
 =?utf-8?B?NmhXWGZDcEtydGVJdndRdktYYjJUMWtXc2VFOHg5cCt4VFBtc200aFFxZFkz?=
 =?utf-8?B?Vm5uSFM4eXVQWThDLzRHSmJITEsxQ2VjejFZeXpMeWZEdmVxc056RklGMENh?=
 =?utf-8?B?QWFubktpVHMzNno5dCtCTWNBR2EzNFdBVGxQWVpQY0xFR0ZVZHBNMGlGa21w?=
 =?utf-8?B?ODJCVmxLOTl6S1UzZ25TdVV1bFYxeThlNk53Y21nVDBBRTc5K1JFN1BzNW8v?=
 =?utf-8?B?VXBlQUVJaGQ1Mk8wR2VXVnpvVU5Ibi9xZUlGc2JJUHBhdU91empZNTZjSkx6?=
 =?utf-8?B?S0QwTnJwTVQ4WkVnUE9zTjZRN1pRUmU3d2czT0hiTjVaK0loQ00yS1hjbE53?=
 =?utf-8?B?V3hIR1U5OEhSU09yQkJxZHMwdnp3U1U1VThrdFcyVXJxT1crNy94VDZpUVVC?=
 =?utf-8?B?aSt0Rm5MOHNYcmphMmxocTdNSy83VFo0OGtXTU5lTG5vckJWblJYTU5jZjFJ?=
 =?utf-8?B?WUpDYys3NTNvSzRyRjFkOGpmSERnZlQxYkp6cFIwRUdZTXJBbGJFb0RnNFdM?=
 =?utf-8?B?Wkh2R01laVozOGRrVUNmMW1SN0J0Y0pHVDE1NzFkUW42Y0V6T3V6QlgzcDhT?=
 =?utf-8?B?U0tJMHBpRzV2d3E3VForV3hpbXVKL1Z0SHlhMGN6ZHNpTm5ReVd5eU53NWxa?=
 =?utf-8?B?VnZpei9VTkZ4TCtGeXdDTnBsSnR3NWJQdC84ZEZqTk5SUmVOQm5OL3Y1MURR?=
 =?utf-8?B?UXZjZ2hsY0wxei9scDdWclZpaXVzanpvU1dGMHVSdW1QbGpQNlMrN1hXdGZi?=
 =?utf-8?B?ODhjQmpmVXl5Y0hoUnE0WmhpTUErWGZzbVl1SVkraUVCQnRBSDJmMEtDaFNM?=
 =?utf-8?B?R0lTRkdCZ2VuUjJjOWpHRXJHQjNTeDNJNit4U2V6U1VJd1R3dWVnWVIzbXVt?=
 =?utf-8?B?MWtZcllTRlF1eXJoZitHUi96RSt2V2hod29ocUpIdWVZbm40VnZCV0cwZWd2?=
 =?utf-8?B?ZHRUazJKTkpuK0d2dFlBWkRTdmxZbmViK0d1aDd5QWIxaDU4bHQ3RjE5Tkwy?=
 =?utf-8?Q?cgn7V7Sb7XD5LUj98R5mHG0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9de2dd-472b-4e51-d4aa-08d9f566f50d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 18:21:20.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNtxBkWgMwWI4iY0vzTXZezXI6OmRoiitknXqieGobdKIjo9IVWhB3r+S10Qyi59
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2594
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Going to let that sit on the mailing list till tomorrow, if I don't get 
any objections till then I will push it to drm-misc-next.

Thanks,
Christian.

Am 21.02.22 um 17:45 schrieb Arunpravin:
> - Make drm_buddy_alloc a single function to handle
>    range allocation and non-range allocation demands
>
> - Implemented a new function alloc_range() which allocates
>    the requested power-of-two block comply with range limitations
>
> - Moved order computation and memory alignment logic from
>    i915 driver to drm buddy
>
> v2:
>    merged below changes to keep the build unbroken
>     - drm_buddy_alloc_range() becomes obsolete and may be removed
>     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>     - apply enhanced drm_buddy_alloc() function to i915 driver
>
> v3(Matthew Auld):
>    - Fix alignment issues and remove unnecessary list_empty check
>    - add more validation checks for input arguments
>    - make alloc_range() block allocations as bottom-up
>    - optimize order computation logic
>    - replace uint64_t with u64, which is preferred in the kernel
>
> v4(Matthew Auld):
>    - keep drm_buddy_alloc_range() function implementation for generic
>      actual range allocations
>    - keep alloc_range() implementation for end bias allocations
>
> v5(Matthew Auld):
>    - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
>      as place->lpfn will currently always be zero for i915
>
> v6(Matthew Auld):
>    - fixup potential uaf - If we are unlucky and can't allocate
>      enough memory when splitting blocks, where we temporarily
>      end up with the given block and its buddy on the respective
>      free list, then we need to ensure we delete both blocks,
>      and no just the buddy, before potentially freeing them
>
>    - fix warnings reported by kernel test robot <lkp@intel.com>
>
> v7(Matthew Auld):
>    - revert fixup potential uaf
>    - keep __alloc_range() add node to the list logic same as
>      drm_buddy_alloc_blocks() by having a temporary list variable
>    - at drm_buddy_alloc_blocks() keep i915 range_overflows macro
>      and add a new check for end variable
>
> v8:
>    - fix warnings reported by kernel test robot <lkp@intel.com>
>
> v9(Matthew Auld):
>    - remove DRM_BUDDY_RANGE_ALLOCATION flag
>    - remove unnecessary function description
>
> v10:
>     - keep DRM_BUDDY_RANGE_ALLOCATION flag as removing the flag
>       and replacing with (end < size) logic fails amdgpu driver load
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/drm_buddy.c                   | 292 +++++++++++++-----
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>   include/drm/drm_buddy.h                       |  13 +-
>   4 files changed, 257 insertions(+), 117 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index d60878bc9c20..1d801c88b286 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -282,23 +282,97 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
>   }
>   EXPORT_SYMBOL(drm_buddy_free_list);
>   
> -/**
> - * drm_buddy_alloc_blocks - allocate power-of-two blocks
> - *
> - * @mm: DRM buddy manager to allocate from
> - * @order: size of the allocation
> - *
> - * The order value here translates to:
> - *
> - * 0 = 2^0 * mm->chunk_size
> - * 1 = 2^1 * mm->chunk_size
> - * 2 = 2^2 * mm->chunk_size
> - *
> - * Returns:
> - * allocated ptr to the &drm_buddy_block on success
> - */
> -struct drm_buddy_block *
> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= e2 && e1 >= s2;
> +}
> +
> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= s2 && e1 >= e2;
> +}
> +
> +static struct drm_buddy_block *
> +alloc_range_bias(struct drm_buddy *mm,
> +		 u64 start, u64 end,
> +		 unsigned int order)
> +{
> +	struct drm_buddy_block *block;
> +	struct drm_buddy_block *buddy;
> +	LIST_HEAD(dfs);
> +	int err;
> +	int i;
> +
> +	end = end - 1;
> +
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct drm_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		if (drm_buddy_block_order(block) < order)
> +			continue;
> +
> +		block_start = drm_buddy_block_offset(block);
> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(start, end, block_start, block_end))
> +			continue;
> +
> +		if (drm_buddy_block_is_allocated(block))
> +			continue;
> +
> +		if (contains(start, end, block_start, block_end) &&
> +		    order == drm_buddy_block_order(block)) {
> +			/*
> +			 * Find the free block within the range.
> +			 */
> +			if (drm_buddy_block_is_free(block))
> +				return block;
> +
> +			continue;
> +		}
> +
> +		if (!drm_buddy_block_is_split(block)) {
> +			err = split_block(mm, block);
> +			if (unlikely(err))
> +				goto err_undo;
> +		}
> +
> +		list_add(&block->right->tmp_link, &dfs);
> +		list_add(&block->left->tmp_link, &dfs);
> +	} while (1);
> +
> +	return ERR_PTR(-ENOSPC);
> +
> +err_undo:
> +	/*
> +	 * We really don't want to leave around a bunch of split blocks, since
> +	 * bigger is better, so make sure we merge everything back before we
> +	 * free the allocated blocks.
> +	 */
> +	buddy = get_buddy(block);
> +	if (buddy &&
> +	    (drm_buddy_block_is_free(block) &&
> +	     drm_buddy_block_is_free(buddy)))
> +		__drm_buddy_free(mm, block);
> +	return ERR_PTR(err);
> +}
> +
> +static struct drm_buddy_block *
> +alloc_from_freelist(struct drm_buddy *mm,
> +		    unsigned int order,
> +		    unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
>   	unsigned int i;
> @@ -320,78 +394,29 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>   	while (i != order) {
>   		err = split_block(mm, block);
>   		if (unlikely(err))
> -			goto out_free;
> +			goto err_undo;
>   
> -		/* Go low */
> -		block = block->left;
> +		block = block->right;
>   		i--;
>   	}
> -
> -	mark_allocated(block);
> -	mm->avail -= drm_buddy_block_size(mm, block);
> -	kmemleak_update_trace(block);
>   	return block;
>   
> -out_free:
> +err_undo:
>   	if (i != order)
>   		__drm_buddy_free(mm, block);
>   	return ERR_PTR(err);
>   }
> -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> -
> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> -{
> -	return s1 <= e2 && e1 >= s2;
> -}
> -
> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> -{
> -	return s1 <= s2 && e1 >= e2;
> -}
>   
> -/**
> - * drm_buddy_alloc_range - allocate range
> - *
> - * @mm: DRM buddy manager to allocate from
> - * @blocks: output list head to add allocated blocks
> - * @start: start of the allowed range for this block
> - * @size: size of the allocation
> - *
> - * Intended for pre-allocating portions of the address space, for example to
> - * reserve a block for the initial framebuffer or similar, hence the expectation
> - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
> - * allocations, so if that's not the case then the drm_mm range allocator is
> - * probably a much better fit, and so you should probably go use that instead.
> - *
> - * Note that it's safe to chain together multiple alloc_ranges
> - * with the same blocks list
> - *
> - * Returns:
> - * 0 on success, error code on failure.
> - */
> -int drm_buddy_alloc_range(struct drm_buddy *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size)
> +static int __alloc_range(struct drm_buddy *mm,
> +			 struct list_head *dfs,
> +			 u64 start, u64 size,
> +			 struct list_head *blocks)
>   {
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
>   	LIST_HEAD(allocated);
> -	LIST_HEAD(dfs);
>   	u64 end;
>   	int err;
> -	int i;
> -
> -	if (size < mm->chunk_size)
> -		return -EINVAL;
> -
> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
> -		return -EINVAL;
> -
> -	if (range_overflows(start, size, mm->size))
> -		return -EINVAL;
> -
> -	for (i = 0; i < mm->n_roots; ++i)
> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>   
>   	end = start + size - 1;
>   
> @@ -399,7 +424,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>   		u64 block_start;
>   		u64 block_end;
>   
> -		block = list_first_entry_or_null(&dfs,
> +		block = list_first_entry_or_null(dfs,
>   						 struct drm_buddy_block,
>   						 tmp_link);
>   		if (!block)
> @@ -436,8 +461,8 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>   				goto err_undo;
>   		}
>   
> -		list_add(&block->right->tmp_link, &dfs);
> -		list_add(&block->left->tmp_link, &dfs);
> +		list_add(&block->right->tmp_link, dfs);
> +		list_add(&block->left->tmp_link, dfs);
>   	} while (1);
>   
>   	list_splice_tail(&allocated, blocks);
> @@ -459,7 +484,120 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>   	drm_buddy_free_list(mm, &allocated);
>   	return err;
>   }
> -EXPORT_SYMBOL(drm_buddy_alloc_range);
> +
> +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
> +				   u64 start,
> +				   u64 size,
> +				   struct list_head *blocks)
> +{
> +	LIST_HEAD(dfs);
> +	int i;
> +
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	return __alloc_range(mm, &dfs, start, size, blocks);
> +}
> +
> +/**
> + * drm_buddy_alloc_blocks - allocate power-of-two blocks
> + *
> + * @mm: DRM buddy manager to allocate from
> + * @start: start of the allowed range for this block
> + * @end: end of the allowed range for this block
> + * @size: size of the allocation
> + * @min_page_size: alignment of the allocation
> + * @blocks: output list head to add allocated blocks
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
> + *
> + * alloc_range_bias() called on range limitations, which traverses
> + * the tree and returns the desired block.
> + *
> + * alloc_from_freelist() called when *no* range restrictions
> + * are enforced, which picks the block from the freelist.
> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			   u64 start, u64 end, u64 size,
> +			   u64 min_page_size,
> +			   struct list_head *blocks,
> +			   unsigned long flags)
> +{
> +	struct drm_buddy_block *block = NULL;
> +	unsigned int min_order, order;
> +	unsigned long pages;
> +	LIST_HEAD(allocated);
> +	int err;
> +
> +	if (size < mm->chunk_size)
> +		return -EINVAL;
> +
> +	if (min_page_size < mm->chunk_size)
> +		return -EINVAL;
> +
> +	if (!is_power_of_2(min_page_size))
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
> +		return -EINVAL;
> +
> +	if (end > mm->size)
> +		return -EINVAL;
> +
> +	if (range_overflows(start, size, mm->size))
> +		return -EINVAL;
> +
> +	/* Actual range allocation */
> +	if (start + size == end)
> +		return __drm_buddy_alloc_range(mm, start, size, blocks);
> +
> +	pages = size >> ilog2(mm->chunk_size);
> +	order = fls(pages) - 1;
> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
> +	do {
> +		order = min(order, (unsigned int)fls(pages) - 1);
> +		BUG_ON(order > mm->max_order);
> +		BUG_ON(order < min_order);
> +
> +		do {
> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> +				/* Allocate traversing within the range */
> +				block = alloc_range_bias(mm, start, end, order);
> +			else
> +				/* Allocate from freelist */
> +				block = alloc_from_freelist(mm, order, flags);
> +
> +			if (!IS_ERR(block))
> +				break;
> +
> +			if (order-- == min_order) {
> +				err = -ENOSPC;
> +				goto err_free;
> +			}
> +		} while (1);
> +
> +		mark_allocated(block);
> +		mm->avail -= drm_buddy_block_size(mm, block);
> +		kmemleak_update_trace(block);
> +		list_add_tail(&block->link, &allocated);
> +
> +		pages -= BIT(order);
> +
> +		if (!pages)
> +			break;
> +	} while (1);
> +
> +	list_splice_tail(&allocated, blocks);
> +	return 0;
> +
> +err_free:
> +	drm_buddy_free_list(mm, &allocated);
> +	return err;
> +}
> +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>   
>   /**
>    * drm_buddy_block_print - print block information
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 247714bab044..a328a38fab07 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   	struct i915_ttm_buddy_resource *bman_res;
>   	struct drm_buddy *mm = &bman->mm;
> -	unsigned long n_pages;
> -	unsigned int min_order;
> +	unsigned long n_pages, lpfn;
>   	u64 min_page_size;
>   	u64 size;
>   	int err;
>   
> -	GEM_BUG_ON(place->fpfn || place->lpfn);
> +	lpfn = place->lpfn;
> +	if (!lpfn)
> +		lpfn = man->size;
>   
>   	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>   	if (!bman_res)
> @@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	INIT_LIST_HEAD(&bman_res->blocks);
>   	bman_res->mm = mm;
>   
> +	if (place->fpfn || lpfn != man->size)
> +		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
>   	GEM_BUG_ON(!bman_res->base.num_pages);
>   	size = bman_res->base.num_pages << PAGE_SHIFT;
>   
> @@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   		min_page_size = bo->page_alignment << PAGE_SHIFT;
>   
>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		unsigned long pages;
> +
>   		size = roundup_pow_of_two(size);
> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
> +		min_page_size = size;
> +
> +		pages = size >> ilog2(mm->chunk_size);
> +		if (pages > lpfn)
> +			lpfn = pages;
>   	}
>   
>   	if (size > mm->size) {
> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   
>   	n_pages = size >> ilog2(mm->chunk_size);
>   
> -	do {
> -		struct drm_buddy_block *block;
> -		unsigned int order;
> -
> -		order = fls(n_pages) - 1;
> -		GEM_BUG_ON(order > mm->max_order);
> -		GEM_BUG_ON(order < min_order);
> -
> -		do {
> -			mutex_lock(&bman->lock);
> -			block = drm_buddy_alloc_blocks(mm, order);
> -			mutex_unlock(&bman->lock);
> -			if (!IS_ERR(block))
> -				break;
> -
> -			if (order-- == min_order) {
> -				err = -ENOSPC;
> -				goto err_free_blocks;
> -			}
> -		} while (1);
> -
> -		n_pages -= BIT(order);
> -
> -		list_add_tail(&block->link, &bman_res->blocks);
> -
> -		if (!n_pages)
> -			break;
> -	} while (1);
> +	mutex_lock(&bman->lock);
> +	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +				     (u64)lpfn << PAGE_SHIFT,
> +				     (u64)n_pages << PAGE_SHIFT,
> +				     min_page_size,
> +				     &bman_res->blocks,
> +				     bman_res->flags);
> +	mutex_unlock(&bman->lock);
> +	if (unlikely(err))
> +		goto err_free_blocks;
>   
>   	*res = &bman_res->base;
>   	return 0;
> @@ -268,10 +260,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>   {
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   	struct drm_buddy *mm = &bman->mm;
> +	unsigned long flags = 0;
>   	int ret;
>   
> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
>   	mutex_lock(&bman->lock);
> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
> +	ret = drm_buddy_alloc_blocks(mm, start,
> +				     start + size,
> +				     size, mm->chunk_size,
> +				     &bman->reserved,
> +				     flags);
>   	mutex_unlock(&bman->lock);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> index 312077941411..72c90b432e87 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> @@ -20,6 +20,7 @@ struct drm_buddy;
>    *
>    * @base: struct ttm_resource base class we extend
>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>    * @mm: the struct i915_buddy_mm for this resource
>    *
>    * Extends the struct ttm_resource to manage an address space allocation with
> @@ -28,6 +29,7 @@ struct drm_buddy;
>   struct i915_ttm_buddy_resource {
>   	struct ttm_resource base;
>   	struct list_head blocks;
> +	unsigned long flags;
>   	struct drm_buddy *mm;
>   };
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index f524db152413..54f25a372f27 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -22,6 +22,8 @@
>   	start__ >= max__ || size__ > max__ - start__; \
>   })
>   
> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
> +
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> @@ -131,12 +133,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>   
>   void drm_buddy_fini(struct drm_buddy *mm);
>   
> -struct drm_buddy_block *
> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
> -
> -int drm_buddy_alloc_range(struct drm_buddy *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size);
> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			   u64 start, u64 end, u64 size,
> +			   u64 min_page_size,
> +			   struct list_head *blocks,
> +			   unsigned long flags);
>   
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   
>
> base-commit: 4f574e4e0184dfccce23b438846b95bbb4d14e39

