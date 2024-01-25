Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2283CB4E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263B910F06F;
	Thu, 25 Jan 2024 18:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB6310EF20
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8hC0gj7HPEkvPiGQ0EjflJk9sVEwkf0GDMuTKUMTh8iOYScQInw/opVkP+wA/ewHBRBK3ZV0hQP+OEbUKZnhpXdox6xuQT3etnaHiiDYJCLzziUEC2/hyBW/tXdnh2RJfcjZr8Z1fTXi5dvhXCvdaxkrmTTUFU6Yy1qfVgLL7lr+MgoHWbDepS86+gdD82hYdxJ5jCmJnXh/Zn7WzT+dSJWJLBWrLRlusnTC1k9ZcnlhmSKKhQL4kOLESrT4it2JK2Oa5rfYd4twbnozg92XhEfZAA1bvXDWcyq5Gb+t7QbF4kli1TZvd3ItyF7frCmXlte7Xi+BDLLndn7QvwQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLkXDQ5C3klTzVY7QMVXegDKunp34gzp0BRl7DSilMo=;
 b=hQXB2k9LREANDY0eUn1IhrBr5LO3wJHDTqCXyZQnmnw9XpBmFYuGBuDqY6bT3Lbb9bNOuV6tbTH/R9Cba8MGjjN+F2GeuT7N+gGJI9Orqg1ofnTfzPj3jmMTQ30yrupm1Elk/LURS2ice+gSzrOKj3HQGJ61W/M85GD1k4lU18pRFcOAorFCubqFm8jw1IvO6gBwzWgwY7dDBN/sfPl7DVfeXlqWahjIe3LhTUuiVtQDNQEx4cPPacQCprjLW2T5EcAU5ysmcVRJ71TMF7d2Z9Km7Ob3ftFmZwaLTBsstkdVS6mkUD0W5WPhaScs2yDCPj9J5i4OSgWBZCRkoUyrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLkXDQ5C3klTzVY7QMVXegDKunp34gzp0BRl7DSilMo=;
 b=p2j3qTlMr47bVZuA83gl9/tuWmujWZga26skcyzbGR4AEiLfQOgouOh07aYQPsfy1lFzA0fdIJfXtH7hGYtl9VVaG906CuZEhSjULEAAbNjz45cduln4wBheEQxZRdrTruUL+CifUGMcfQWrNQnKZF7a9RI2ZsfjkGpB7YLEO5svz3d+9PR64Vg9y5q6t610G54hPu+ofkwetzBMgynlyd/LAbBaLf/xCMv+sSa1UQ6mQ6F0AW5julvvMFfb7VONmW9P3w0KO0Ql1JVX6e1uMQ+SxrcizYfq3GgloRLd8mY0UDlcO6iXdmJ+vS2PbqJm1ZurL5ub45bd+2Jlgb94ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by IA1PR12MB7686.namprd12.prod.outlook.com (2603:10b6:208:422::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Thu, 25 Jan
 2024 18:41:01 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df%7]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 18:41:01 +0000
Message-ID: <ea55c56d-f316-460c-bcb2-5a6f6ba050b8@nvidia.com>
Date: Thu, 25 Jan 2024 10:40:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: handle NULL fence in
 syncobj_eventfd_entry_func
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20240125180321.41173-1-ekurzinger@nvidia.com>
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <20240125180321.41173-1-ekurzinger@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|IA1PR12MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0ddf13-1939-4a45-8d13-08dc1dd52dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T08xHsciBJn4TKN2WnTVRNdtVH6NXfKq996u8AbBjOyjYYiC5lJ9a/7VgSQJoGFOleca6P/TSsSR7H414RzzfY68TsIWEqfYNpQPKQbQt6Mn2psX/nznVJQGMOtdyEx3mRUxBsOK8ANdGkSU9SUvb1ZvrY0y3oJd91c4Uv8VFsY851QCFrmQPEMf1ZdZfrfJNZGmWdA8gat/i4y0ikhE07fI/kpX0D1dffEmRc75aoOzvBRPdxKV2PWHOkgonaqCWisH13g3/Dk8QrzlqOyEDVQKHG5edExYFKZ2xBnJfIoJFKdpRKdUAWA4H/mlbjdM2WnozTubaleDkTr5N85osoiyOA+bnS1S6A+PSdtiizVOO1PtctweaPz/BJvAxZELoGPz/vWxo2oixd3Ca3dGC483PIE1bC1qvZw7t49DKKBz7TG/sxPLSVvL3LnaHg3xhrkHMHgSMwoobZ9IWo6RNs/GCNeB4YaQxh538LhGQ4f1qx79KLYdxdunzXCIMA6UJQ/hbFAWFgEVoJEZf87ySQL+LL5nbdlKDQu3wVdCQRSJJV7R8uT6nad+TtfbWXr0JG3hXm1qQViPR8aRXFdugeZujMH4ah30KK/a5DRRczYEJ7oXevF2ENSisSnCH+bqdX692zTEe6l9RNZmOdxiTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(316002)(66556008)(66946007)(6916009)(66476007)(53546011)(6512007)(86362001)(5660300002)(83380400001)(4326008)(38100700002)(31686004)(8676002)(8936002)(478600001)(6506007)(107886003)(6486002)(31696002)(2616005)(26005)(2906002)(36756003)(66899024)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVZDbDZmdlEveFhiS2x1a2NmNndtc1N3WklMUGs5MGlEbkl5MC8yWEh1VTRm?=
 =?utf-8?B?akIzRGpta3QvaFhQNUVTeTc3RlVJOC8zQ3hRYkpyelExQThMb2IyN0tTQ2hX?=
 =?utf-8?B?aGhzVUtyWDZCNWZGeTljcW1wU0liT2JiVko4TEpCZmp6b1hHZEJEd3R4S2NE?=
 =?utf-8?B?WVRoYzdCcUlCODQ3UTVqVEo5WkdlTi84NlYvRzVWcWxhbmpEVnhLT2xacEd2?=
 =?utf-8?B?ZzFCQStnM2Vna2NYZUoxT2Q4bVVaL05WQXgrNDk1OHB3emJ6RkN3ZHFKenIr?=
 =?utf-8?B?L3JOa29iQngzaW1PMjNHVHhhSXFBb09ObUVSaFZ1YWMxazl0VUM5K1grbTlp?=
 =?utf-8?B?bWtzdXd5UXV2ZERmZUdPYW9reHZ5T053MzZGWFRsZGNuWkt0RHNZMW1HWEgw?=
 =?utf-8?B?SWdDZHp6RUlHQUxlbVZ0NGgxSHBCcmwwOVA3QUtmR2FtSWRzZFFNUjJmWUFx?=
 =?utf-8?B?UktQRTBGN0J6bDJCVWhLcEk5Z3hGdlp3bkg5U0FvY29tdW4yKy93TCtlelF6?=
 =?utf-8?B?Y2YzK01MYUJ0cjdYWERQOE1OeDBldjNFSE90b1E2Nkt5eWRTUUIzdGJUbHhk?=
 =?utf-8?B?Qlh6enhRWmRXYnBFYUhBaVppU3NyUVFCbzlqemU0ZC9hZlJTQzN0a1RRelli?=
 =?utf-8?B?bTNBWXA2N3RKbUc4a2xCRzNWUjg4QmtXeE5ZREU1RTRtWmhKWURRVzBvaFBm?=
 =?utf-8?B?VXNZU1k2SGRaZ0pleUdVNFdEN254RDZLaWlEMzk3clBxdCt4MnhTNE9Jelp4?=
 =?utf-8?B?bEo4d1JpeFBFNmR4V1N0WTN1bUw5RTE1aWNFMWgvWjQxUjFYMFNlNmRYNWpm?=
 =?utf-8?B?T2thVnJHNFBMbjVLMW11bkMrNE56SEdNMTN1RHludzR4MFNwNFJiTzJJUVlE?=
 =?utf-8?B?TGFxRlIzZTVQQTRLTjBKa3NmUGNBbVh1YWU0Kys0VkdBMEFXYllQMnpjNmdL?=
 =?utf-8?B?SEtlQ21Mb1hWbTBxNmZSVHRzZWtaV0hyc28wb3FHZjZBWjZ4SUtxZWtBWEk1?=
 =?utf-8?B?ZWl3bzlTd2hrcWlTeGRuaFZjOU9vTVdBLzdJN0xDaUhPamZNU1hXclJZaGlR?=
 =?utf-8?B?YUhGUEdhN3BEZDZMak93VVRrV012SGhDSGFJMW5wL0RpSnBOSGMwaEk3WFNN?=
 =?utf-8?B?SWk0anhhU3o2T0hGUk45bjh2bVFadVd2VEwzMWRvYmNUZkJRRGs1RFdWMzcr?=
 =?utf-8?B?UmRsbXRXNUdWemxYK1h3SVdKMU5sOFljSWZhdlhqV1piRGhQQnlOcTc5RUVU?=
 =?utf-8?B?RnVQSTZzVU1tRTl6NmVFTDFwNktEVEliTWNmWnNBdlZNYUNlOWdpODI5L3JP?=
 =?utf-8?B?SnNWQTUwWHV2KzNhYjZsWVhRSWY3dHVESXYvWUExTzZ3VUhBSW83Q09tWnFr?=
 =?utf-8?B?OEx3NnJ4TUg0bythOGtDV1VzdXloR0kzM1lCUDVkN2dlVkdqeHNNdGVPbjNt?=
 =?utf-8?B?bC80SzkrcUZzSWxWT3NmQjJCUGUxNEZJem9ub0pYa3ljNWxxRHRITUUybDRM?=
 =?utf-8?B?V3pqMnZjaXoyRUVlR01JMk93Q2k5Ty9pQUJKZk9IWk5sWmoxTHBEMmZNSGRZ?=
 =?utf-8?B?UVYwMWxDYUQxQWRIYlN5cDRnM25sY2RMd0dEYnRlTTN4bldFVURuMG5sb1lu?=
 =?utf-8?B?TEl4ZjRVYVN0eHFPUjl3VklOMnB6YjJFSGdyTkZKZGpwT1lZeTl2alBnUkd5?=
 =?utf-8?B?d0ZBeCtPcHRxeCs4NysrZUQ2RkxXaXdvdHhRcmE4UWd5QmRhYnhiTk1OWmE2?=
 =?utf-8?B?K3kwbGV0Q2J4OU1ncit6VVJOREppNHdiQkoxR0ZQOURDMjIxc3JCM3l3dWtx?=
 =?utf-8?B?Q0VxeGNEVU93bENoZXJoTWtNMzhEY3FvSi9zQlRiSnpON0diaGZRSW93M3dy?=
 =?utf-8?B?aCtxMGhYT1g2NS9QWEZINlNMNHJkb0xxZWxKQ3BubzZkcTFmTlllNGhiVEt6?=
 =?utf-8?B?aSt0Wjg4YVJxNmlBVzFyL3RnSkVzdEhzRHFxcTh3SmUvcVZyWE5NME5LMWpH?=
 =?utf-8?B?b1VNNzJJUXBIbG1QRWZsKzRGMDlZcmQrbUJRdk5ULzlpeFNqNW5GU2IrWFhh?=
 =?utf-8?B?V25Ga0xIQzdJTmhKRWtvaXNGZVBmOUJ6VmpVcGM5MEJta0Rxd0J0SWR5ZjJ4?=
 =?utf-8?B?dmJPbFFtMUpGMHQ2VExzeWhjTm41amREWEZORnpBTGhpZGJXMTdvYzBYR0Jl?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0ddf13-1939-4a45-8d13-08dc1dd52dcb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 18:41:01.4664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5DSWxKHlgXMhd8InBybkCw70CXPr9MXdsTXAqTw+71ju+1jY15ylrMVFXuhDQhmoTeEvWtXlk+RJAi7haJf4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7686
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
Cc: kbrenneman@nvidia.com, ashafer@nvidia.com, jajones@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, I realized there is a mistake in this patch after sending it out. It results in a use-after-free of "entry". I've sent out an updated version which should avoid the issue.

On 1/25/24 10:03, Erik Kurzinger wrote:
> During syncobj_eventfd_entry_func, dma_fence_chain_find_seqno may set
> the fence to NULL if the given seqno is signaled and a later seqno has
> already been submitted. In that case, the eventfd should be signaled
> immediately which currently does not happen.
> 
> This is a similar issue to the one addressed by b19926d4f3a6
> ("drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence")
> 
> As a fix, if the return value of dma_fence_chain_find_seqno indicates
> success but it sets the fence to NULL, we should simply signal the
> eventfd immediately.
> 
> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
> ---
>  drivers/gpu/drm/drm_syncobj.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index e04965878a08..cc3af1084950 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1441,10 +1441,21 @@ syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
>  
>  	/* This happens inside the syncobj lock */
>  	fence = dma_fence_get(rcu_dereference_protected(syncobj->fence, 1));
> +	if (!fence)
> +		return;
> +
>  	ret = dma_fence_chain_find_seqno(&fence, entry->point);
> -	if (ret != 0 || !fence) {
> +	if (ret != 0) {
> +		/* The given seqno has not been submitted yet. */
>  		dma_fence_put(fence);
>  		return;
> +	} else if (!fence) {
> +		/* If dma_fence_chain_find_seqno returns 0 but sets the fence
> +		 * to NULL, it implies that the given seqno is signaled and a
> +		 * later seqno has already been submitted. Signal the eventfd
> +		 * immediately in that case. */
> +		eventfd_signal(entry->ev_fd_ctx, 1);
> +		syncobj_eventfd_entry_free(entry);
>  	}
>  
>  	list_del_init(&entry->node);

