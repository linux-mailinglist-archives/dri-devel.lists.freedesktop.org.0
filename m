Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFEB8072B6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8F10E739;
	Wed,  6 Dec 2023 14:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F12B10E739;
 Wed,  6 Dec 2023 14:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvPCINID7XI3ChJqj2s6ukgKrHAezuLZexoFt6BLO3KIrr05sOolsHcNFm2LbxKAwxVBe91wPs3j+rBi2TDZGSkSB5mqfztmJiGn5A2uHPRYdfj54HTW2cjxFuubG1tPPt7vkRu8c2AxNcY/pvcVZ3vs6J3VAvibPbvutZGr+oJ0cpgssNwxkl3WkSkv+jMrBsjXf2jv9KSadbquwbevLjK09v+ZYhfjFlsxE6tR95mZeXkkAt3mJ+D5p0fS520sCPIXPvK5qK8iEBQA7FV3QHukFift/Xvx1E8NMnAQop3izovWST1b3cSJaIFBapTQl5eTe/CZzUtvazs6JyNlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4KGiIgjqXy41zBiB2MivIx94efrYYsfA4TJJ/cHYIw=;
 b=SrpGK+vikY0JSZYZ7JyXC4J+WH6/42Y2rUfyj+l8Xnf/i6BRWAzN1trstUU6HlXFAYdB9KQEExEXBwINTX1SF92H6R08HjAtT28wR3ZlX+KeOvwnnkW25gbWV1eMwy6XTguz6tCetFxmE0EKSdF42pjz4Ijjwl2WmsilnJ6f6rSjSY+348iGX7TFqQyf9ZYHpNJuJn9ib4n3UmRcXjK2gEqppDRLJe23WWi71SvGDL0klm9i23aXed4hvHs44nFcmQlJCciKgyDZaTXduhV2ooiIZyhj88D3gpeKlqnYqF/wt+wJhnmfk/QJ1unuih6pT8BeWvfaiWtNFjyQtTb/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4KGiIgjqXy41zBiB2MivIx94efrYYsfA4TJJ/cHYIw=;
 b=ykN/lAPDA8VK/MA3yIu0rSyesJH2HNLY/5oWY6ROecEQRJx0ShF3222FBXd+CqbavDvKU0eivHjUI2nokkRWU8jfqqk/7/7Cz1psn/oygr8GhWilk6GtiKLUZUbzCkZy5nexFmMV3ZQLi7dCxtdTY4ppHrc6e3h0QHO+f34+Rj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 14:43:36 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::5f1e:bfb0:43e5:dc81]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::5f1e:bfb0:43e5:dc81%2]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 14:43:36 +0000
Message-ID: <84cab9ec-5c02-401e-8582-8675c53b978f@amd.com>
Date: Wed, 6 Dec 2023 07:43:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/amd/display: decouple color state from hw
 state log
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231128175623.121356-1-mwen@igalia.com>
 <20231128175623.121356-2-mwen@igalia.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20231128175623.121356-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:408:f6::23) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c1e396-72f0-47ec-e4e3-08dbf669ba25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MEJ4kiqgRgqBb7DgANWJE52OJIMGEFy50XbVkR2a0CIAgA41tW5l+YrqoB4Bst2HZFATuiQ9Lbcu4H7zE6Ye7rn8CKPiP7Bh8opG2VIb8Uk+F0vPP8Stz/x0bIWhfYuM7X0CJdYuwdtiVKcwWGyKQe7IGExjQhHHOXFZsM9WKzIMaTzfFTzJq4OZk3UmIwvajTyPhO/cAxbpHs3UFsuB/pFjqCr62m48NWelpxCE/ZFujq+Dz8gJAXpalc73n+0iLLSMk8nGDwU7BOV4Yokex83Ego4OwA9ATmH2raVlJEE9zUVvRuZmcvpZ430dknufUti8lqjF5ytpvUV5xo7iJhW5CBhkvYlS1PRlD1VkQ8MnAnF3RULl5GG8o28ni7CO64jlXt+uIH9VeaEVJgfTSeBnx8Z/umhUIo+bJmERhhw+sT0GTz1eUCRNu4/N70HU/+3kORZR6hQHTPmBgHg3Lm9VDnFgFdARmWBTm4KyIFf4SEjlowv8z5Mgvo6guLxnB0xoeIz32jydJAOVoR1jvtcKBfR1YVQWF40ZS0PBmFzsSwwpVz5L9FGOyZF2VviQGMqTiDr7M4ysXGPgWhA+yqpqXGwMrOayQmeADCtvgHfV5+6loqqsH6s80RVGz25+7ZKMfi9doW+edU8jqBrPstSL7mz925vajTnRnjtx9ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(921008)(31686004)(26005)(66946007)(110136005)(66556008)(66476007)(36756003)(86362001)(31696002)(38100700002)(6512007)(83380400001)(2616005)(53546011)(6506007)(6486002)(2906002)(316002)(6666004)(478600001)(8676002)(5660300002)(41300700001)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1VVZ3J4SHJDZWllQjR2dTNNaTErZXRhUDYvNnRvcmZXSTYvbnp3Qi91d2tS?=
 =?utf-8?B?VU1zdjhZU0Y3ei8wNEhtZW5jRG5LaExsWXdvb3JBdXRXaDNKbTVGbDVCZzIy?=
 =?utf-8?B?VUkrdSs5SDFqUXRBc3VuNDBhVUM3VVl2UGJRR3RiOGVBbU9MQVVJWFNQV0tX?=
 =?utf-8?B?TmFqZWlCaGJQaFpJQkFqYlUxRFAyWVE0a1VVblIybEhQMXVBTXA0WklkR1lW?=
 =?utf-8?B?aWJrSHUzWXVmbHZqMk5HLzB2YUFIQ1VVeHg5NGduRzUyOVpsU0RpUnphelRC?=
 =?utf-8?B?OFkxVktCVjBuQlQ1OXpPRk55WnB6YXZGRXNPeFJldkpMWmMxQS9tUDhadWVM?=
 =?utf-8?B?STQ1cXV5anNDU1V5L2U5c1prL1BiaS9oMWx5WU9YSjI5TE5JeTZyYjRDd2Mx?=
 =?utf-8?B?WG92Q2M3WFFBR1NQckEwUDZvYzJsd3dmZklxNHRuT3dSY0dqaXhSZXdFMEZZ?=
 =?utf-8?B?K3dzTnJEUklnbXkxZXk4Y3YrR0RLcHNiM2NiN1ZpRXhKVXdzcWlad3hhR3dZ?=
 =?utf-8?B?N0srNjBKelhtc2NPVDZTUlIvRitOeS9FTUxxNGczaFZKL2FZZGNoMFVsTXha?=
 =?utf-8?B?SzNlTi8yUmhSckNyVVhqNTZkOTB4eWt6ZWNRSEdxNEpkUFRIdUw4Y2QyZm5F?=
 =?utf-8?B?RDVDYXF2bGltaDdmbytodXc4K2ZlcmxvaURXcnFWY241dzR5bENzSFZwYmV0?=
 =?utf-8?B?TGcweW55NjViVVN0cUVhSUY4cis1ZlZxUXFKbER5N3B3WFpQRWdocFVQL0lF?=
 =?utf-8?B?YklpNWk5QW1UMmMrSzdOQkZxWE41THNsczk1YW5UbmRMaEZxTnMxY2tEOTVJ?=
 =?utf-8?B?NVRmTy90cHlJMmp3ZW92aGltWUlOSlV3VlI3dWcyMlNqcE9Qb2xabWh2Z2FU?=
 =?utf-8?B?Nm13UEQxNHJIYW1rK05rOTJhQXhMSGpxb2h1SUFwbnRpMTQ5R1VGUTVWUmlE?=
 =?utf-8?B?aSt6UmtFejFDY28vZUJxOVlwOHpibG9yMk96aFVsWjBOa1VZRGd1Uk92ZTBv?=
 =?utf-8?B?Q01rMnB2cW5VY3lMdmJUcXByNUx4UFh6MExCNkFpTmZUNHVMeDNLK1pBLzIr?=
 =?utf-8?B?NzlhT2dTSkZpcTd0a1pzMWdUSmxVSEFiMEQvRzRuZlA3YkJqZmQ4Q2IrcnFE?=
 =?utf-8?B?c2lQNnRjbi96MnVuK1RZdkwxSHU0K1lJdzhyVHp0VUpJNEoyeTEwSzc0SkZM?=
 =?utf-8?B?ODNpWkNqd295a0VMZmN6ZHpwSVQzMlZBQXZRQXhieXlVTm9VRUVNTmF2Z3hp?=
 =?utf-8?B?bUZoVDVTbkVyT3hEWG9kRUFIaDQxYTU3aU9tRHNZenNzN0g4anpaSXNFcTZz?=
 =?utf-8?B?K3BiK1l3QmxhNTBNUE5nWS85aGpPdmxmV2RHVmlFVXRodVhpWnZmMFhJMlNU?=
 =?utf-8?B?QzFUYXBRcG1CR05ybTRmSjcyemJ6UkdCYVRpcDRZU2dZcVFXYlFxZXR3VnhO?=
 =?utf-8?B?NitxdUxrdXdkWXhsaWlDVnZJSHBrbzVYMkZXSVlucEsvUmc1anJ6UGpsUHpr?=
 =?utf-8?B?NnJ5QjJWMXdDTnJTVXluZVlWazhyTjVic3IzK05uSk0xY2Q1NzZHaVo3VjIr?=
 =?utf-8?B?Z1pEaGlBN1Y5RVduNnAxNWNaVjBwalE2cTNGTmNtaFdHZzNMM2tIbGFnRWtM?=
 =?utf-8?B?WEhqa2JxYUFzVEJKVzBSNjB2WmxPdGZFbGlqSk1hMzduUFRYYkhnWWUrUkFI?=
 =?utf-8?B?SEVZUDIwYnVROVZEelhrRGZoOVJINnI4SmQ4eUNpRFFvdTNaTVM1QmtWNWU1?=
 =?utf-8?B?SXdyZEVMQ0JyQ3VsZVBqaXBwNXNoYldveTUyV2tIS3dOMHQrTVlEYmRWM0NP?=
 =?utf-8?B?elYxNEJMUmtQSDZCaDhKTnBNdDVJNUpFcWE4cHhNOVlxMHlCUy9Yc3JNZk5h?=
 =?utf-8?B?VkMrSE45M2U4R3BzZ3dDZEZrMXJLSjUvQ3FWbHo5dmRKUG1wNVEvZkVRLzgy?=
 =?utf-8?B?bEl5dUJIcURMUTRYejc0RWQ4UHdib0JyazhEWkdEaVpoUzEzMTFDRFdlSUdr?=
 =?utf-8?B?eEpCa1J5ZlVLSng2UlZWZTdLa01mVTl0ZlhLVVlYK2ZsQXhjMmhzc1ZMZmlT?=
 =?utf-8?B?aVRuaHVlWmhEZGxHYUJWTmI0YkF5czFiZEJSOVJoQWJYYzVJY1k1QkhPVVIr?=
 =?utf-8?Q?4hskmdU2UsWhZs/+AXDGQR51L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c1e396-72f0-47ec-e4e3-08dbf669ba25
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 14:43:36.0001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oct2bx2E1hXvWAlogNhMjXRLiHYRbUe6OzhLfVvZz2zwxm12gAbtofsHHaeMiJeIJYNt48iU0jAtOoF4V5Rk+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/28/23 10:52, Melissa Wen wrote:
> Prepare to hook up color state log according to the DCN version.
> 
> v3:
> - put functions in single line (Siqueira)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 26 +++++++++++++------
>   1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> index 2b8b8366538e..9b801488eb9d 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> @@ -282,19 +282,13 @@ static void dcn10_log_hubp_states(struct dc *dc, void *log_ctx)
>   	DTN_INFO("\n");
>   }
>   
> -void dcn10_log_hw_state(struct dc *dc,
> -	struct dc_log_buffer_ctx *log_ctx)
> +static void dcn10_log_color_state(struct dc *dc,
> +				  struct dc_log_buffer_ctx *log_ctx)
>   {
>   	struct dc_context *dc_ctx = dc->ctx;
>   	struct resource_pool *pool = dc->res_pool;
>   	int i;
>   
> -	DTN_INFO_BEGIN();
> -
> -	dcn10_log_hubbub_state(dc, log_ctx);
> -
> -	dcn10_log_hubp_states(dc, log_ctx);
> -
>   	DTN_INFO("DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode"
>   			"  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   "
>   			"C31 C32   C33 C34\n");
> @@ -351,6 +345,22 @@ void dcn10_log_hw_state(struct dc *dc,
>   				s.idle);
>   	}
>   	DTN_INFO("\n");
> +}
> +
> +void dcn10_log_hw_state(struct dc *dc,
> +			struct dc_log_buffer_ctx *log_ctx)
> +{
> +	struct dc_context *dc_ctx = dc->ctx;
> +	struct resource_pool *pool = dc->res_pool;
> +	int i;
> +
> +	DTN_INFO_BEGIN();
> +
> +	dcn10_log_hubbub_state(dc, log_ctx);
> +
> +	dcn10_log_hubp_states(dc, log_ctx);
> +
> +	dcn10_log_color_state(dc, log_ctx);
>   
>   	DTN_INFO("OTG:  v_bs  v_be  v_ss  v_se  vpol  vmax  vmin  vmax_sel  vmin_sel  h_bs  h_be  h_ss  h_se  hpol  htot  vtot  underflow blank_en\n");
>   

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
