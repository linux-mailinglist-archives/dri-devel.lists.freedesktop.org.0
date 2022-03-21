Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232234E23B0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 10:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615E810E331;
	Mon, 21 Mar 2022 09:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDAD10E331
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 09:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBA2ORrEyzPoGdq2/9C2pmhDRXq390j5e6id4QAAxGaGJ7Tp0qeZ5NmWzo0p8kXtEUCRLDtPrHiPr8889/0T9mTz1ZEq2lDeKGfoN+lCVtDWq0vhBQOad4v5FGLyIYOkp8RC4DeyU9Aro5aB7gApKqD/JaeFvdbeLCQRoeUlWlfrrdKQibQPHv+MFblVVjh03ndaaw2amG93TFEcBFqy/oSiBCbefHJSt7DqXT/IaO8IGdjnHhpMpzH1hylBn91ZtPvcnZJwN0uejKbrnCa83YyRRyOE5x5V3TZFFta8h/o3Mir8iGSlefpnZ3DOgG5a4KE6+VyjlctKhO/2LJ3/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyrjzS5Qq8YpZW1dmmnB9FGrKZvz8YrZIMekwDAV8eU=;
 b=V5Nv/NagR9QDHRCZG5kGHY1myILdJehXNlPlZWsnWymmcLHDkgNlTtCw+BzSRh7P/1ObXgJKvEZm1FWPS3g9At67kB5Aa5fHZ6KuKzoDgH2r+0oQBg46zhnTQQWOOsUSG7OIIeyEhtFQV4qJDHMXWJuNbWmCBR1VZfxnF19Kj3z7E+5lS5uM2EK+2L1ONo/ZuJwwZxf4P/BZJpCHSrUlgfc+XhcbOILlYE2Uzf7wYp9osR/OZvGd9KAz1xM9xzOyoydEvIsxPZb+ynCmPiutJa48GoQoJrcqmq8W4e4RBeiuzIj+9kDsPRNBg0AphrfeqjmZPJdlEO7EEPK2V+SyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyrjzS5Qq8YpZW1dmmnB9FGrKZvz8YrZIMekwDAV8eU=;
 b=kzHcctCNK09T5KcWudwcaHPHvUAdDkxYtMY044O0LD2grpP3HyBWW+WuvPkbywgfJS3oAk63bAN37JS/Gs5oOaIDEaWZkVZBnD1hV2TQpbRu+3MoSkTnvrwRmpS8JrGZPY5ePBzFBS2I43Z1dySt8forpG0EuVqanlgdCs/sWJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1502.namprd12.prod.outlook.com (2603:10b6:301:10::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 09:56:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 09:56:00 +0000
Message-ID: <cea6758b-6e7c-46d2-7d44-4372742ed449@amd.com>
Date: Mon, 21 Mar 2022 10:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ttm: remove check of list iterator against head outside
 the loop
Content-Language: en-US
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, ray.huang@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220319073143.30184-1-xiam0nd.tong@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220319073143.30184-1-xiam0nd.tong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0333.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25e3207a-49cf-4373-8377-08da0b210077
X-MS-TrafficTypeDiagnostic: MWHPR12MB1502:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1502D1768C8F476E6DEA106883169@MWHPR12MB1502.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YljoIsDStjQubsSTUf/J9lwbPlQRQVeGfsW8uCzI6bh9U+XLkNmBKbZPWZthF4XnWKoocEXYaDc5VuW5DWibTew1Uy26C+MntFor6km9pxWn1mNuGW8eKiFRr5Y6BO0nlXwfbUUvT5LmwkS+1b6YvDVwwZrovfwMhmpJnYjK42LBOc5PzJkY+0Uc7C4SpyASxVdS/ttANRXxRz4/0g9/zcpvLcbSW6WdvzI4uwQlhFkZxNVOY9OWX8gsXvcHiRVyeCy82I1Nyt7VyjcIDRFuGBRIH7Rbsna+MS5/6GL+YRidFNANole6uy/NloqFdnGjF2chlfl/1SdluoiMP9HCc+S2qghdpjSutblWBrwaNHnnejnRvpGWoPSlct636oaKi741O8FfHSGkI7Gk3t7/8xcIXUEukQTHjvFs5OrYEnCFn3dd5iEUrBJozlbG9j3zUB8BVLR+B4ibROhvS4hdqdjUDAyuPsi/uxgPs6oJHt5975u8hKe+gccrH3KtfBPqgRMpqy7FMAmqJq+1JqWR8zY8Pd/5S6W3eoZ/Z7bp2vz76WZkuFlK6bI5CzfKSn4hb+dxadnZjz5wxDENHUmPHg9ac9tnXKzdZ8vQp5Ley8ESbP6xyg2ajWJBlAdER3Md4RwGaxpTh6u1B6aXvFny2K80jAikCHWaHG8blwZRy4Hqb6OyS7wlInVzDzm8irsplxGRWHz257WWe1yr+mmpens+XP12pLYreqvfOmz9i7HxHdFaeMS53CE2pxhil+5e8W0fHLsIfHtFzllOrU73EyYyaNqPePKb1Cdr2rLR9wIl/FyDZp7lWTpfJIMrLoz5VN0PaP1jCag8Ha2VKO/5yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(36756003)(66476007)(31686004)(66556008)(4326008)(2906002)(83380400001)(8936002)(66946007)(6506007)(8676002)(38100700002)(2616005)(6666004)(508600001)(86362001)(6486002)(966005)(316002)(31696002)(5660300002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGd0WG1vTlZ5MkZVQ0cvZFFYYVFYMWdEZHk4cXBERlFKUm90U1UyWkZheXhO?=
 =?utf-8?B?cWN0YVR6TjhJOUtkZVVLRWVEaGJPRVFBZE9Od1U0N1ZHbUw3anNacjR3bS8y?=
 =?utf-8?B?WllTS1RBVFNEUkUyLzA2QVRtOG5rS2JDdkg3bVIrZjRGNWwvYjRVWTJ5dzBW?=
 =?utf-8?B?TnNreEw3T0NjREhCcWo2NkptU1QyQXdtVEtOQ1JURjNJdVF5Q1RpMW9sWUV5?=
 =?utf-8?B?MTZ2Z3ZHZUx2WExmck9XNnBlK0VWZFJIZTBpTDV6OGVzN2NtSGgrOU94eHZK?=
 =?utf-8?B?UFEwc2g3c3FVUVU0eEZROW5vbHJrL29GYnRYYmZ0b2RNVSsvOWlaMmduVUJZ?=
 =?utf-8?B?QWVCM0Fpb1R6Lzc1NTUyY3JhMlBMeHdQR3lPREVacWFHRFF0NUo0alRaZXQx?=
 =?utf-8?B?TmdmNWIyWEE0Y1JpT3c3d0ZHL3ZoYnJKVEphbC9mbmU5TGdJWVV3VEVLSnlI?=
 =?utf-8?B?TlV1QlRHOGh1SFpYdGVKOTNMTU5JRTR0QnRTSWoyeDliSWs3eFR6cjZKUzJu?=
 =?utf-8?B?emdFOTNtbmtsbSsrdUluOWFndkdldFZ4bVZnYTdRUnYwc0FLdU93ZVdTSmtK?=
 =?utf-8?B?dFYrN1JCNVlOQnQwQnplOFQxb3lvUHduSEFJVWxUOGdGRWpGY0xEempxTHFE?=
 =?utf-8?B?U1dRaDk1ZktmektmbjZRQlFhM1dQeXJSbGhCSHJXbXZkTkdTVVZZYUZ5NldT?=
 =?utf-8?B?ekRQWnQvVVlHODRwdzY1NlE1YlZ5Mlc4VzBjMmZCd2czS2VRWmw0MSt6R3pO?=
 =?utf-8?B?aWhuMzQ1bzZyNVlRaUtaU0kvMG90VlBhOVJLUVl3Q0JVU2s0UWh3M1JBOWJK?=
 =?utf-8?B?TTc5M2xzSHcrQ2crWlVTVjhkOVJyd0R1RE9OMU9jZWhBRzVxSFBEemxIZTJU?=
 =?utf-8?B?ZEljMmVpNVc2blJjR2RndEZ2T1hQelhRNjVrZDJCTjE4dVYySXRvcmM0MUN4?=
 =?utf-8?B?ZFY0aGJuTlAyb0JpMFdiZGw1MXhxM25WdnhKQmMxTlZ2cjlDby85UmxhMkdj?=
 =?utf-8?B?YTd6Yy9LTTcyU2dwSHFOUU5BNmkwdWFsQW1FS0ZXMHFkTFdBaEJ2S0ZCOTBh?=
 =?utf-8?B?YldEbE5IRnF6ZWt5WThnTXFnbzFlMzRzd2VoQWhYNnlZVFRKV1AzS3ZhdExL?=
 =?utf-8?B?eUpVTjJGUkF5SUZDV2hkSmtXa0lKRW9iQkI2UXRKUDdiYXRwQWcydytZckR4?=
 =?utf-8?B?V0JqWXVoMjJnMGt1T1RKdFRma1lMWCtYbFNkblhlVDZ6dk42Wmt3bHdra0ph?=
 =?utf-8?B?Tjk4VmIwS1dBNlhKNGR0R1E3WTR6N3Y2NXNidXFqY2trUmRqb3k4TGJpMmtN?=
 =?utf-8?B?Ty9CeExwVXIyZTBmbnNjd1dsYlFhclYvRDZFTDFtREVTOUVtTXpLVjZOYjQw?=
 =?utf-8?B?OFNaenNXeEZ1TjVDYlVFZ0pnZ2dBN2U4clR3M0lVcU5yeGYxOHRtV0VOZ2l0?=
 =?utf-8?B?ZVB4MXJQL0tWbVNLMTcrTytsOVNicUxSSHpaRi9Mc1J6SkNWV3pCR3NHMkRj?=
 =?utf-8?B?SXljR1BnUitMdHpJSGpyM3JGdExMcnIxS1dPVHZOaHZyT0ZOOE1HcUppOVh6?=
 =?utf-8?B?SzZnalhKMTNvNTZhUTNpSDRtN1FPMEJ5ZW1jTXV0ZFVwMVNMMVd2bWFRamY3?=
 =?utf-8?B?aWkvdG9kWjVXYWJFWjg4WUZ1SldHN29ScWYvcUF3bXlnL1F4aVZneHIwaUg2?=
 =?utf-8?B?a1NGdjROMnBBRWh4N2xiTkpRQ2VoTWZvMWt3SG9VSW42dUd4NjN3d1ZQU3VI?=
 =?utf-8?B?dDdHcVJlS2t0UW9wQzI1RXdQWXlKb29sYVd4WWhuMkNWbUh6aFVqMmNta2hH?=
 =?utf-8?B?SEJ0REpIa2FTdG1WWDd6QTRGMkx0OXRMOXd3a0ZYOXlSYUZRSmg0WjArRjhm?=
 =?utf-8?B?SFRwQklscUQvYktpSmMrYVZhNmFOWVova2dwTGJYR1hjbmpGeEtnNDBSSDFX?=
 =?utf-8?B?ZksvYzdXbVNuRWpHNDg2NUpheFZ5cjRFanRzOGQzZmx2Zld5NGhvbVNKQUhS?=
 =?utf-8?B?OXQ1S1JxR2V2Wm40SHJZMFhXNHVxSVN5VTNHVzFYSTE0NUtvd1h6Q2JCcHkx?=
 =?utf-8?Q?wcZ4R/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e3207a-49cf-4373-8377-08da0b210077
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:55:59.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dR9VPnxqK7yg9gyCnF4By6gyetlqoA3s84LS91XYhToUWSoH1JV1P3Lm8oXMbMV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1502
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.03.22 um 08:31 schrieb Xiaomeng Tong:
> When list_for_each_entry() completes the iteration over the whole list
> without breaking the loop, the iterator value will be a bogus pointer
> computed based on the head element.
>
> While it is safe to use the pointer to determine if it was computed
> based on the head element with &pos->member == head, using the iterator
> variable after the loop should be avoided.
>
> In preparation to limiting the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
>
> Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/

Well exactly that's why I'm pushing back to those changes.

We have tons of cases like this and I certainly won't accept patches to 
make the code more complex than necessary. Especially not adding extra 
local variables.

Regards,
Christian.

>
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index db3dc7ef5382..413b5bbf2414 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -673,36 +673,36 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   			struct ww_acquire_ctx *ticket)
>   {
>   	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> +	struct ttm_buffer_object *iter;
>   	bool locked = false;
>   	unsigned i;
>   	int ret;
>   
>   	spin_lock(&bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		list_for_each_entry(bo, &man->lru[i], lru) {
> +		list_for_each_entry(iter, &man->lru[i], lru) {
>   			bool busy;
>   
> -			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> +			if (!ttm_bo_evict_swapout_allowable(iter, ctx, place,
>   							    &locked, &busy)) {
>   				if (busy && !busy_bo && ticket !=
> -				    dma_resv_locking_ctx(bo->base.resv))
> -					busy_bo = bo;
> +				    dma_resv_locking_ctx(iter->base.resv))
> +					busy_bo = iter;
>   				continue;
>   			}
>   
> -			if (!ttm_bo_get_unless_zero(bo)) {
> +			if (!ttm_bo_get_unless_zero(iter)) {
>   				if (locked)
> -					dma_resv_unlock(bo->base.resv);
> +					dma_resv_unlock(iter->base.resv);
>   				continue;
>   			}
> +
> +			bo = iter;
>   			break;
>   		}
>   
> -		/* If the inner loop terminated early, we have our candidate */
> -		if (&bo->lru != &man->lru[i])
> +		if (bo)
>   			break;
> -
> -		bo = NULL;
>   	}
>   
>   	if (!bo) {

