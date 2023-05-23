Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4E70DF6E
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 16:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8F410E0BF;
	Tue, 23 May 2023 14:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193D10E0BF;
 Tue, 23 May 2023 14:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSeqWpJDjzHtgyPIe5NNyM2FALqTOKNvbCQbmP5kydXts+WSRaUsTi5/la0ihlWyRmy0oZRAhW608uD1sOqMl+fj5lIidDsAHW+IDlReWExM7u5XJ1Qnq/Omr9+48v9IIkjF12kphUkXzBaMBJhBoqfJOWVnkXLF7El5RBhivN310UMAxSzD20ZGsfOXZo7zClS9RDJJwTIYYmvFlx+rVcNR4AUzCrAeP0RYT+DjtqyNHRi3EY+ARdCWBQxqaJblFSRb0nxwwVDKcx0702Y0A6Vybw230hY16t/zCodG3gJJbYs7RZpRA9xxyH7GIX4O/KQGiRa2yk/Ejy47UvTm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKNtgjPyUJS5OUzsZ7mG6yCgBEcqUJ+tjF8IA4mEAGw=;
 b=iCcBM6AJ7u6ZQ0qpta+zV2pUMhO419B+EkQ/9Bz+H9NmFVnmfbXDaj1gLLqcyBo8uyaVBhBtDUOWqFgA2/uoY87GTb71k0KQYZ0Qitu9GaDfkR4Ra0hZDunCfDMFuu59vTLB/JqXdG/4XOpDbSKhbLFokCO7+SRk3Sxj58/o4SWABBjJb/BQ6LztbBiOWpnwYHAXL6tfA6Tk7eV+nVvVc0xFG6ucKYuwB5JonNYPQQBg6V4JAqcPD3kEWZebLfwHODu9C6A1FYt470AgbqD8z+cO4LlMvC0xwpYJqlOnNGkctL5RX/dj7yf2z0N+D+PRvJP/N2vuedE4OD6xmyhMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKNtgjPyUJS5OUzsZ7mG6yCgBEcqUJ+tjF8IA4mEAGw=;
 b=X93iULl7bkUsuNcPt+vSKb0veKk3B9mtNte8h3MeadYPbxYrpBuA0Q0KidyGI9EmJF+l1vLYESKJAtihoHQE9kG2FPgzgjfRAQENOXmXyyDgkdbXVF5Yz889F2ctyGlpOeUuoQDvSSkg2lS/xWuFlyJg4cxUehGjaUQnsryoBHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Tue, 23 May
 2023 14:37:06 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 14:37:06 +0000
Message-ID: <63817b59-90f7-9881-fb69-42da00ccaeed@amd.com>
Date: Tue, 23 May 2023 10:37:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amd/display: avoid calling missing
 .resync_fifo_dccg_dio()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Saaem Rizvi <syedsaaem.rizvi@amd.com>
References: <20230523083437.986490-1-arnd@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230523083437.986490-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::24) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa98c4b-b5b0-405f-5ea0-08db5b9b2e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmTIsuunCkHvbKSdoVq8V/nYfRgflR5wJMB2IxGuMvqcR9BZiqFKuQ0Daqb5M8njEOQmaZzdfLSfzkLBrWeryV2DoNwL+mDSVFOB8I/fjqGSPAADE3GRpIXmy7K5w2wYVPeQUJIGiQDf8KefsPbV6OqMUgLLOlSmFcJy+jW+MQVfIFlEjFqpZf8r6coim/lGPhkfZqdapeavB58ozPKtTIzMd6wasgKoo27doatT52RtaMz4Fvgf+8NuJMuJjlc57X+u455iabof8xefC/b7o5YPV7EWlJWfHeDUBLV9PZW5lBHum64Tmc9vxgXXDywr6w8A8nOn+Br4dw891mcamBzEj+yAAow4XqzLa4NvHrxsC/Y9M3xj7i9nE0tRYFfPjZzfsTrEJoky//QH2W1ccxv6LdIa9sohnXOzOjIBczvjtM5hKCEzc3Zi9hDlYT2ogYHdJiHvBCtZoINkqQRWf/th+pxjJNtJBKlrxz5MBl2C5eE+QS1hjpjOggj/K3x5VyHoS/J94JbMR8JaxR3wmaV2KKd4JP62p2rpgjKQnrvgdebMjmVfysaIrosdiCgwQc+ivZzreMnKOCOd/eYatjhf5C29ENed/cKyjkIYf9tXrcZXyxS0AiMBAbojfKqfpIHh2oA5g+izm4wXL/A8k0jXG47d28QS/KwW/BdZXD6QYGAcfJn51gkROG3zb/Lj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(6486002)(41300700001)(86362001)(31696002)(316002)(6666004)(2616005)(8936002)(8676002)(36756003)(186003)(53546011)(44832011)(26005)(6506007)(6512007)(5660300002)(2906002)(478600001)(31686004)(921005)(38100700002)(54906003)(110136005)(83380400001)(6636002)(4326008)(66946007)(66476007)(66556008)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djh6VHJrd2ZranFmOHRMd3dpdXlTU28zZWNFcUlRVlFzNXJnMzNDTkt4UDh6?=
 =?utf-8?B?eGtVazBKSlBDUzlVb3VKSkpGOXRzcDFzVXRvbkZNUDdmVVd4Q2ZRQVdXcjNk?=
 =?utf-8?B?dU9HbkNjRXR4R2FEWks5YkZtOWJrTUNUSXF6aW1ORG5tSnJBcDZnYklMTHg4?=
 =?utf-8?B?YndKUzR6Z2YyVVJxVTdsYlhxaVpBVUZLS3pGVzZrNUgrdGU2YWJCUGNoZnow?=
 =?utf-8?B?eG9SV2k5NnU1ODZtREpHUHF5SEIwUnpYSW5Bb0pOdlRVL2xxNzJjeGoyd2V6?=
 =?utf-8?B?UzViZlJQQWNNdUM4TUU5MVFWYUh5RWxpcTJhd0l3WitaODgrUExXaG8wTGpa?=
 =?utf-8?B?UUNWY0NTVHEzVXBuUk1tVFMrYXBjdUdSWDdKVVBGaTNWQW5RcmdDckYvZEgr?=
 =?utf-8?B?Ti94aWFHUkllaFVaNW9TNXJ6YWVUbTE2eFhaamZSQjdBTC9wR2ZmREJDNjNH?=
 =?utf-8?B?SW1xVEQ4clpyRkxRaWhmY0srbmIvT1E0dXBSNWNMem9hd3B0a0Z2K2JQM0NQ?=
 =?utf-8?B?SkY2cVpEUjFzRHpBNVFUZmM3b0NTTUE5YlUxTG1Hc0RXWVpEYUVEQkxNRXNW?=
 =?utf-8?B?dFFmOXdOZzQ5V1MvSzhJUUNZWk8wWEo5UjlhSTBrRUN2OWo3c1Z1OHJQMmFk?=
 =?utf-8?B?SVpsK1FlNmN6M1JpYU5kemJhaWMyb3hmQ3EzMFVZcnkzV0pqTU5ZMzBnNmpm?=
 =?utf-8?B?S1V1Z24yQTkremNwVWNoUC9YZmU4eW4ybDJxajhvNFhySWcvMU1uRzNoSk9j?=
 =?utf-8?B?a0pwc0pLUmV5bXhOcFpJOXhNYWhNM043WVZaOTZEVVFxZlMxeW1Sd0FqOGxq?=
 =?utf-8?B?bVdKNUtBKzhZcE04YlZzN1djODhtVkZWTkhIc1F5VVk5L2F3TW0wczdHejI4?=
 =?utf-8?B?WHJPMFoyS1dnM1pqZldEQnI5emRGTEhkUU9HTE5XU3ZyaUt1aWNnQ0ZtNEJJ?=
 =?utf-8?B?RmJOSk4xbkFuWDRCTE91Y0lUNU15UnRydjlmN2FCcUU1Yk85T1NpTElVQ3d3?=
 =?utf-8?B?aXNNek5sNE9veWQ2MzlqbURCb082Q3RGb2htczVML21BUjVYdEtSVkhnNkdn?=
 =?utf-8?B?NFdlSFBUNWFSRVMvcFdVWUNxeHJJMit1VEg5ZS9XWEo1dldIb1hwajRyUERO?=
 =?utf-8?B?bUZFZEo0QW5WYXhvK3l5WnJEUHVBYXFaODlUVFVJZWt3amNoN3RUYWdlVno4?=
 =?utf-8?B?eVpaQk1vVnFqNlRwQ3IvUVNxN3hPc3JjTlVwZjMvMUhCanZQVm1LSU5aN1pO?=
 =?utf-8?B?REdQSVVaOHI4L212RTNPeXVWaFRyQTdtUnBsNHJ2OEJuNGNwOUZuM214ckJo?=
 =?utf-8?B?SXpmSm1CdFBWSlo0cFZoYjZNN0taalpDOERlS3d1c2VsUXFieFV0aUI4Mk5y?=
 =?utf-8?B?Vm5Yd2pieC9aYXZLNVZWVjlVdTBmSCt1ay9wSUEwZVBsQXRTYkF6N3Z3Q05j?=
 =?utf-8?B?MWdmY3dNeDMxcmFacW1BYmdOMDVSTjBMWHhDd0diVkc4dXpHT2xFVjJFQ2xT?=
 =?utf-8?B?cHhmUmdOZWhkaS9OVHMvMUh4c1ZWVXhjR0dzWUtrRHRHTndMYlNZTnk5TmRF?=
 =?utf-8?B?c29KRjhvcUdQNGViWGhPM2VlOXgvR2h0Q3lwUTdnWEExcFF1VnZ1VlQyVmxj?=
 =?utf-8?B?ZVQxREVaWGhRZnErVFNHajlUQkVnTFlKaG1RSHdLTy9YOWdLUE90eVJwSENi?=
 =?utf-8?B?bnl6OEo3N1pCVkYrdlFxQURiZEpEaklaNHhKczZRODFCRldQZm1CVUJwVWpJ?=
 =?utf-8?B?Y0VRa2p0N2RqTS95Q2lLYnlOZUZlWHJPZ2dzNTFQcGZ3OERwaE53Y3NJd2Fv?=
 =?utf-8?B?Q1NJZWM4SC9DWVNyRENjSERkRU43T1RNcmtEeUhaR3VXZ3d5bU9LQ2hWRFA1?=
 =?utf-8?B?YkE4K1dxWjRScU9rOHIvS2RIWnBncFkzNWJCNHc1RnlXZHRMc1RhYS9OQWNv?=
 =?utf-8?B?UEtiR0grSXN2TmhhQytKbEJuU0J3RTg2NGJCelVrSWg2QlJQRkdFeENaKzNu?=
 =?utf-8?B?eTJIaEcvSStjZVpFdXJHTUtiQVUxRC9mUEhrSzVqa1FGZjFuQjQ4UEJrN0lo?=
 =?utf-8?B?eExvSlF1QzVvanZjWjBCbU5QSlpFZmtUSkIyWHdwdjFSQkFkVnVkQVppVTRQ?=
 =?utf-8?Q?ncDgkUrtsu5uVMGVMdhUmGSmB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa98c4b-b5b0-405f-5ea0-08db5b9b2e2d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 14:37:05.8780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RybnmDGKmF/nczn9d3lXn1662Ws90bE2nc43hk/HI9u4v0o6W2MXP1CPeJrHIBXxF4JSWgt51G4uZqyDrpHSWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370
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
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Jingwen Zhu <Jingwen.Zhu@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, "Nagulendran,
 Iswara" <Iswara.Nagulendran@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jun Lei <Jun.Lei@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/23/23 04:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The .resync_fifo_dccg_dio() callback pointer was added in an #ifdef block,
> but is called unconditionally:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2292:31: error: 'struct hwseq_private_funcs' has no member named 'resync_fifo_dccg_dio'
> 
> Add the same #ifdef around the caller as well.
> 
> Fixes: 6354b0dc3a7a ("drm/amd/display: Trigger DIO FIFO resync on commit streams")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index c6fe2c00aedb..d4cacb8df631 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -2289,8 +2289,10 @@ enum dc_status dce110_apply_ctx_to_hw(
>   		if (DC_OK != status)
>   			return status;
>   
> +#ifdef CONFIG_DRM_AMD_DC_FP
>   		if (hws->funcs.resync_fifo_dccg_dio)
>   			hws->funcs.resync_fifo_dccg_dio(hws, dc, context);
> +#endif
>   	}
>   
>   	if (dc->fbc_compressor)
-- 
Hamza

