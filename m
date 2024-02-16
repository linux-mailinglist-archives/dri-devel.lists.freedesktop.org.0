Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A65858108
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4633110EBA2;
	Fri, 16 Feb 2024 15:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mBWKkgt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A34710EB7B;
 Fri, 16 Feb 2024 15:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P59e2C+X5h//RRSmiSA5Nw1TKxHvzTuz9PBe4P/9LDUTgerLPzbMpFNgqvP5EpG2JBHMpQlQPYcKyIAuVQ1FIg/ept5haoGnU4by2IJzGYS9zcGB8YAAKRaV4sQzyapUswCLXzDNj8mDxCRAB5RDgw9/ssiT1psjqWTIJjyP+fMb3H0J60+NTCcs3hlczDETcNeNNezJhjnPy2L1DFKjNqvlOZX7ZPDgUvKrSQxAbBBKIAw3i2S2Aokhn4fb+9Qh1q5TAnVnzrKKPUcUKOL7SWKS79DTVRthboC8woyNvUZQL7qN1TOg01tphFkYT2YBKhdUpDuc6m/gl9WvFrNRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9YmYyNK+k55qvxMCF4sj3X9ngK7nwjGReBncbKvqvk=;
 b=eD6Xq+gL0pL68OK2xPhrUPveKqExtL7nZuE3QIcmRn5vYoolBDpddmT5B0g1GEBpPqPqOcXBm1Q1fBpj+ZQI6BwMdm7dL+r23JLy0uq9fXl4ejS+4jj4QPwc6VwV0+ejqO913elIiZClF2sc441r1+3a4ZQ2B88y9olEOkRFFjjzOX2EYxPUq/T+SZgjD06MT0gwBzqIvf//Vd12yqwb51JSnzXjbFrID0JJqt3CjamPkoL/7OVCSGJKpL1deRG+nwhw/gCwS3K895bg4WhbMWqiv/l3XbMvZRP65TRdeD2ZtEftWgEiPN3AThRfiBAOCr+ZsInaoVI9JXXh7u7K1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9YmYyNK+k55qvxMCF4sj3X9ngK7nwjGReBncbKvqvk=;
 b=mBWKkgt0shGzzu+b+y+NTi3W9CAZTMVS1qpTw81A2KDRqw9mSlNkAyPG/g9GeFVwNu840feUF/52uQYjQndSyZt9mfTr/xijT+/xw4JUoWO+aftUQk5YxF7/f6hIoeccUzuleTjQ07i9az6hUjIU7ced+Fgoulp+rKLahAJ+XFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Fri, 16 Feb
 2024 15:30:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 15:30:17 +0000
Message-ID: <7e3c0990-f5b2-47e1-9de8-bd84fc582be9@amd.com>
Date: Fri, 16 Feb 2024 16:30:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] dma-buf/fence-chain: use trace_dma_fence_sync_to
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
 <20240216151006.475077-3-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240216151006.475077-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ceda78-fb96-49ff-9696-08dc2f042dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Silih3XDTxaAJw6G7oOwFbm9+lI6jDuVilfFoX0aF6Fkpl8tAG5ixrK5XVtARad4CtKl/RhJzNzuBbNMbHdGbG42Jdc1WOiQ9D7ppEL+3qDISqNoS2AZaH1CMr7sEqBmwTJbAXAjrZrdftoPBDZSrKGstVQWuCsAiPqyKSykC6ZjvooE+A2lSvECixDnvYb44LyisS/A3C0T42nVRbmdq11Xy/9wy3P6fJbZY582ME2yUQERKId+xs3k61hnDziB17WcH5crLaYV6/njqyh40ONUJcwpadBsBheI9blpAKLBuB8DgC9dykl+F325FfXSYHJA4rlCUVEmas6QgkK5lo62zMBFpgwi3LpXEKnDgo1VWdjMRWjUVcOJQOfojbGDN5/TefwoOXR5lxtLJt16e7LvDVg7xS1pUwnIhkOmd232KghJnVrSMlgrNSmdvXgejyuWanMHkUeCiUtLsHQEW2I6poy1+tGmLjEOMACXu5RxJTgsTmFHfCF0sRDtCa4S5K/PNDQN6UwIh8mE9W3tk/AtBbxJ83NzbUWqlTnzWDwRi4AT7eaSoQWQePErTC6GEZ6jQnLilukZAicqfQYNkeOOUHUafUb4fEGX3a+kMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(6512007)(6506007)(6486002)(478600001)(2616005)(41300700001)(316002)(2906002)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(110136005)(6666004)(26005)(31696002)(36756003)(38100700002)(921011)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3Y0cG9lUFhMazl5U1hMODIySGpxRkN2cFU1cXNQcjY4cjhSM0R2NjJoUnA3?=
 =?utf-8?B?alRpY1V4ZlYvN0dKNXBZb3k0ZlN3U0I0TnN6R2xPckx1N2NoUExWZlZtbkpj?=
 =?utf-8?B?aDhDRFR4Uks0KzdWZTZWQnV5OU12MGdjVjJQcUJELzVBTXUrWEJnMjNUVlY2?=
 =?utf-8?B?UWVjaXMxQTBpemJFRjl3ajNEVWRiaWhMdWtCcTdGc085SDRUYmxSTzhnbFhp?=
 =?utf-8?B?c0k2V0R6R0pPMEdUdGFSeWpqNFZMREhPNXYyRDVBSnM1WDgxbzljR3piSjJj?=
 =?utf-8?B?Z25HUVVMZmxtNkRDOVYzUUZrZXVSN2VsUXhxNElJYitxUjFhMm00NzV0VWVI?=
 =?utf-8?B?dlVkR05NalVvdnNtb0F4aE5tRG4zeHN3S3djaHlkYi9EUjRiR3g3ZnhQdUE2?=
 =?utf-8?B?dU96aHRPS1gzSU4xQThXN2tPNG9KT0VHZG9iN0kvT1llZEZZUXM4dnpMUXh2?=
 =?utf-8?B?SGY2UE4zWEFzN00rOHRBdFQvNXhEakRtY21FQ01VTER4MGYyVkQ2WGpNL3NG?=
 =?utf-8?B?cHgrQml0cWU5ZmRXeXdKWDUyZWZpbm9INzFEakROYnVISytSR1NWbzhoaUpL?=
 =?utf-8?B?WjBuM3RUOEJjNEVlQm1YMVFkUjdBRk5lQ3pINzhkcGtDMDFoN2p1SkZNNFJS?=
 =?utf-8?B?V2hnVUp1cTk0UElBTGZ2Y1JVZW1NMis5YjcwRFBVRFpJT20walI0alBPOW9n?=
 =?utf-8?B?OXlIM2NZK2JZRUZJbE9kSndYZ1JEZWQ1Q1RnMHc4cm5zVndLVFFMTkNXWFgz?=
 =?utf-8?B?eWRTeWNWbGxwY3VoUTR4eTdPOFloS1o1RFpjdWNWdFk3UTdsN2Jrc2FBa2dW?=
 =?utf-8?B?WFBzbnJYeTY4NWU2OFFhNWJBS0N0aTBmR2JXNmttYzlqWmNYV1hWZjloNU1D?=
 =?utf-8?B?d0JpNm5sN2lzRmpKWExhK0djdzh5YUpvcnZnQVI2UThGNUp2Q2htRzlMT0lv?=
 =?utf-8?B?S3hTTlpSbzRrU3E3eGtyOEV1Z0dtZzgvNUVDZzgrVVZCZ1BXM0RDN3dnZWxQ?=
 =?utf-8?B?cDBCZ2xVWGFJYzdjaFdQck9KWHVRc21LdWdDTkZ4ZG5BVVdCZkpvWElkZDdG?=
 =?utf-8?B?TkxUb0hweFMxemhIYVZucVpFY3lNQjg1YVVSc2hBeWxGaE1RWlFwQUJZZlZ6?=
 =?utf-8?B?SjB2SG45eitBeGtBUXNyeU9ob09VSWZackR6aHFpbGtDTElGd2Z3Wk1ycVpX?=
 =?utf-8?B?VmswZnlvbnhXUTl6eVRxR3QvL1g2Wklkc0V3S1JQWUdLNTdIdXZOSmUvT3lT?=
 =?utf-8?B?WjArNUk4UTg2Q01rWXdYVXpDekN5REtuU3JucjNiMng1TmRxTHZVVk96aGRW?=
 =?utf-8?B?K2lPcUpoVVdua3QxcDR1YzhoeFNQWHM1QjJPS0dWNXRJckhBbExTWGdHQ01L?=
 =?utf-8?B?eGFTTFFidUlEWGZIOXkzT2hIQU5VN1lHdVd1VzhYM1FYaHpqSTF3Y0p3aDFL?=
 =?utf-8?B?bGJaZWJ4cjhHRHdydklReXRxZEIyUXBqbERlcjBJeklUMStueWNVWk1ZOWtn?=
 =?utf-8?B?SERYYUJNMkQ3VERuQjN5Q0xLN0RvVTFFSDFodWlTNmU1LzVJWWg1WlJOMEI1?=
 =?utf-8?B?MUZHUDY5b2t6aXNLcllwcm0zYmtyQStyZUZqL3RpNGRwd3hFKzFvWTdkcm81?=
 =?utf-8?B?NGV3NFZZTkI2MzA0M1pWekx2NVZUQXArKzhTdWljdlNYRHlPM29mZzZxNXdN?=
 =?utf-8?B?bStjZVI1RU11ZU1JbFFwVzJPcUdYNngxVS8yQjFCWXlVOXJrYjNFOXBac1B4?=
 =?utf-8?B?VTFGMmtMbUFJSHZyM2cyeldUemQyRndaZFhjZ3lzdFE0eGVGbFNreTR4QitU?=
 =?utf-8?B?TVhZM29rQVcvWFcyYks0eHE5bEJHejg5V2htWlRYQWpCZWl3VHdMN09NWmd4?=
 =?utf-8?B?dnZML1o3VStsRXcydldsZDY3NEZUSUlmUTFINWFNckJZYWFWNk1sMlN0d0lW?=
 =?utf-8?B?TTF4TjJ1NjNKUVFIZFQ2TDRvWmF1RTZ0MWNmdmRYNzdFa1dQNkxIM1F0TXR3?=
 =?utf-8?B?K1JEbUg2RG54bkNQVC83VUNrSmJSR3o5d3pLTVgzQm9SS0JMWmtQMEhJRVpB?=
 =?utf-8?B?OC9vZEgrcVZGb3RxQkZxTk4xc3BsV0RCYURiWWh2TFVJc2QzbUFTWE50d3p2?=
 =?utf-8?Q?WRO08e6PDT0aCMTrHDAAwEQxZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ceda78-fb96-49ff-9696-08dc2f042dc4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:30:17.6605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oucChysUYDPHa8flytTBi+BFgD8TMh9v236OKpco1sjlYmrx98bJu/anMtkCyU3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.02.24 um 16:09 schrieb Pierre-Eric Pelloux-Prayer:
> To inform tools about the relationship between the fences.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-fence-chain.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 9663ba1bb6ac..3435078c45b7 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -9,6 +9,8 @@
>   
>   #include <linux/dma-fence-chain.h>
>   
> +#include "trace/events/dma_fence.h"
> +
>   static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
>   
>   /**
> @@ -251,6 +253,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>   	chain->fence = fence;
>   	chain->prev_seqno = 0;
>   
> +	trace_dma_fence_used_as_dependency(fence, __func__);
> +
>   	/* Try to reuse the context of the previous chain node. */
>   	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
>   		context = prev->context;

