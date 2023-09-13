Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEDB79F51D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BAD10E126;
	Wed, 13 Sep 2023 22:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021C310E126;
 Wed, 13 Sep 2023 22:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkmpvPIBFeCJoZqJUadrLAMIRBYyOKLgkRRjNXQEdGvC8BMsgx5GsvkC/wPy5yFAsQgEkMZC7aFHvmRjcLQ+bBo3KSsEyhOj5QBKGUMuPni9KX7Y5HG2uI+wfj26TB6m496Q47ic49YDvlz9KFtX70p0VawyAXmWwqZZvQlrE5VaaARfVQ3FqJy3n6Uh2v03NzqNLFisOBRZtyTVW72PG/f36AXIrYdiN7ZuGOea9xheSOcHAzn2FdsJpDShUuuIvD+FdEzvGJI3WHLpMc52De5BSQz07CV7VxNVbnz/u9rX/yssqeC5wz54Hr4LQLk8X0PDeqNA8ULF4fBeLjupYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlLahvkIPfRaZMqntloQVOr3MLmMt8g9FIAZBMgbVsk=;
 b=LXpxVT4Vh1+FKT+B2afeI8+y6PZxot7UDAJvaQtOZyTAmIxIleWaXxkC3skHAOx6OebtpE0izibvf7b8VnpVeOw99ttgL5liy5iJCZBGy3Lod8O3KvgzgPaurNTphSFpe4qmtBw8sUb1Lt3YzRE5LDBkWJnhvwLhTJcammwJrcJs36why/LEYkKC+sQuuxqxdsBVjKBQ5AKM3I2JnJP8ezGF7oqImCn9i8UdL4S7ZpH/2W4Srcl/psujGw07SoC4BtZWR9MAgBsQN4pipgMH0smVB3tga3wWXqeikKJd9j4TuVO6OnO2NU78oRKxpFdmgPBSOppmPNYL08HX7uKHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlLahvkIPfRaZMqntloQVOr3MLmMt8g9FIAZBMgbVsk=;
 b=EllC2rAP0M1JiQO6FCtriCmW8396ne5M09FnbD6wvG/YVVJPruApEpwEkwzFBWYTdpTePJHRtR6x8FAzfMt8QFyzasnrLuOz2RSiwKUWErLjQRY1ETy9UN5SlqRRaVEmg/mRQ0qXdwCs+K5WPk41+/1loDPh6O+sJUSdwTTe400=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 22:41:11 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::30b2:5369:3468:696a]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::30b2:5369:3468:696a%4]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 22:41:11 +0000
Message-ID: <c8c544ea-a7d7-4c6e-913a-42ed5d404a90@amd.com>
Date: Wed, 13 Sep 2023 16:41:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] drm/amd/display: detach color state from hw
 state logging
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 sunpeng.li@amd.com, alexander.deucher@amd.com
References: <20230913164329.123687-1-mwen@igalia.com>
 <20230913164329.123687-2-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230913164329.123687-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN1PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:408:e0::6) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: cd817602-6d35-46cc-4585-08dbb4aa8782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPea7E1ZE/7wVOjcjw7xzHzJ8ikCQf8k216y37H/Pw9Vy8Co54oMhrbBBbepFfXfTSGdxR1Vw7++nkknyKeyyjaSY7tVzk9dq5IX2iUtAy65TlgEyILY7vnR5NVLO9Uec1gXyBTuiCFLz7v9hzLqdDm2B2Gj1rjyLBdYGSukwDiYLF6XCS13v0eajEvngzBnG7Hp/0yNVrzEyutA77oKxiCk20Nwm633bVVn8lKU6+TkBV6VV4oRE5cwfG+M5GaoNQ79ivCVnLt+hRLn6QLJMJvw2g//oMO9lvFF3UjtnzuQpvgwpqhyAMZJmSF4/FmRMHCnc+68fjPZTeOkScKnzBepINASjEpsYrL0R4pP6x4GVXIzgHv3oh4gvlAijcSEF/K7SxamUnWYVu18jSA1DmpaBXK2ip4GPmuX2TdDP4U9vd435/JFdJazx/z9u9w9NuusLFRIJuZTjuqd30YfHaqn+NrKG3tAYkBDsY7+djBEeWNhIudp5RlFbRW7wvCtMd6LTkUj997VwsuS1/687cAxYFz9NhFq+JzYfWrL4JTED7krzaEe4oZBEndsiu9l4eHtko1mALiYtr6P+Q/EdslOAHaWBsLOAWJk5zCwnzW+Zwb818Nqg3lP8lgdFvR0x8Zk8up2zaXsGM9ZnfaxPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199024)(1800799009)(186009)(31686004)(53546011)(8676002)(66946007)(5660300002)(2906002)(36756003)(66556008)(4326008)(6636002)(316002)(8936002)(41300700001)(66476007)(54906003)(6512007)(38100700002)(478600001)(31696002)(110136005)(26005)(6666004)(2616005)(86362001)(6506007)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUJkV1c0Q0JBT25Eb044cENBTDNlWGJMUHRGN2RMNWJlTnU5Qm50SURCTFph?=
 =?utf-8?B?RzdhZFJGZCs4bmJTcWRWbWwzZVlrTWlCVkNlWkF3OHBLOUJiKzZoQkhrUVg5?=
 =?utf-8?B?ZUtDNzFOWVc2ZjR4VUhmY1JWVXRJd1NaU2x0aWpRVys1TE8rMmRRTXRBbEVj?=
 =?utf-8?B?Y0haRWZBS3AwZktKSTdaeFBuSjhBZ0NDMUdVK3dZNFlIMzBWSDdhdmE0REwy?=
 =?utf-8?B?elZSUXVlUHNhanlXYVF6Qkp2dDVZeHVJQWVlWkcrc29oUStJY3dnbGFERmQv?=
 =?utf-8?B?dW1qYUkxUWFrcnRCU1BqY3pUaklsOHg1ckxiczNKRTBUOVNpQTZxYTZYVFdx?=
 =?utf-8?B?Yms0SVJFeHBnMmNVeFBKbERyRTY0OU9ZYk5MV0ZtTGRIb2VCUG9aek1tYWNt?=
 =?utf-8?B?aGVaOU4vQkkrSjdKQ045c0lBS2FKMXVMeDdpdXh2bmxrUURpUHVkSU4xVkFC?=
 =?utf-8?B?U0RpTDY5QjZTdDJnNjgzakpUeHBOUUw0RCtTOVZLREFia21EaTczbmdOL29m?=
 =?utf-8?B?WVFYMjg5S3MwMUdnSnI5dWk1SEwvSExzdWM3V2dGZXh2eTVaems4Wjc3azF4?=
 =?utf-8?B?K0ZacVIvdTBOa2o0S0RhK0tqZUR0bzF0S3BqcmdtNUlFL3VSQjBqR1VaaGs0?=
 =?utf-8?B?RVVzQ09zZnpIT3hpSWh0Y2Y1RWZGaXJZbXBkWkYyeTRNUmlGbFp4LzBBRjl2?=
 =?utf-8?B?aWlzUDFEVHJqTERSNE15S2hLY3Q3VmxTMWl0NzVDelJyd0NoUUIwL2tQcTd0?=
 =?utf-8?B?TmNFNnlFcnZ3SW5OYms5N3VZZlRQSzZ4cDArcFdQWXFhblc1cXkrcUFFZW1P?=
 =?utf-8?B?VE5qSkdodzFkTG1lbXlzSHYxdkttYnBNY0pvdTJFWVJmM3lXTjMxejU0OGp1?=
 =?utf-8?B?eFpCUDYvekFjbCtwcGluNzNFZk9QYmtPTy9STTNmY2QzV01xZ3FNSWVRQmtB?=
 =?utf-8?B?M0VvN09lWmViallmdUZVWk9LN0prMjNZaEpsbVhVb290WEJNWDB3akRpaVNn?=
 =?utf-8?B?dVR4TXFsSjZvL3hDaTZqYW9SUlJpWkg4SWRDVEZvWjdzM1lKVkg5NU9IY29p?=
 =?utf-8?B?S2h5NHpXKzFLRkEzS0JodGhubTlhK3IwcXJqeEpiZndaV2gzd2lIbWtUY0dR?=
 =?utf-8?B?eU40TkhjUXhhU2lWa0h5alR0WHdYaHRadHd0UzJJUWp5SmJzeVp5dHVYT0ll?=
 =?utf-8?B?bFlkR2IxaG1NWTd5eEJYLy9qTGZJVGRVamhidGdudjZPUjVWNEpQdXRlanVJ?=
 =?utf-8?B?Q1NhazRRR2lDVWR0Qk5NeThxZDNwWEV3VHZuVzFZYUJDa1JuQzBuYndSMDhS?=
 =?utf-8?B?S1Fwcm1xY0V6d2hIcXRVWjBrSlZUdUQ4bUgxU2ZDcyttWEJrMXZnL2FvcldG?=
 =?utf-8?B?a3FmTDkyUXBVL3AzSG9FVmY0eEZqMkI2TnN4QzBDVTJrZkxISGQ1UnUyRWo0?=
 =?utf-8?B?dnhlb3h6QzJzd3JwYklWY0dld2dJQ0lrNElHQXhDL1RaMWd0WnBaMkpCbTMw?=
 =?utf-8?B?UEVsWnJTb1hPSnAwcEM4N21aVXFpUjMwYnlpUndxRGE2RHQ0MmxaWkU2Qms4?=
 =?utf-8?B?Y2tybzBWbEJtM0ZIbHJCY2dSL25ycEZ2Rm5HcGIxNml5cWxSbnlMVWZwMEFS?=
 =?utf-8?B?VklmeFNCRE85NVVTWGlVYzE4dGx2TVRSYkJoWjJUMVl0blV5b0JzVkhGVDQy?=
 =?utf-8?B?ZmhxUStwMVhBNnNHSTBwL1lFNk9nOXZOZ3FQL2F6S0FUdk5QYlpOVXZBNWZH?=
 =?utf-8?B?MmEvYzhPWXNPR2RrRDdoS0NPbDhzZW9ZK245NzBTcUlacThvUENTR28wSTRJ?=
 =?utf-8?B?eHkrRmU2dVFLanM1Y0hJWlBRZnBVQnpzTC9jejhCNmlDSkhvck5WOHV3eGlD?=
 =?utf-8?B?a1RjcGgwcnNPOXQyc3ErRTJTWnZ2UlV2UTZJalNDL2ZhL3ZEVjJkWTRXYWlx?=
 =?utf-8?B?ME1PaTdsMVF6Rk1MZk1vZXJFc0Z2b2tGTFZudDdBU3pzTVkxcWZBZkJwL0lt?=
 =?utf-8?B?ZW1HQVRERXYvYTNyVW1nLzFqU1lnV2RIbEJNOGZuazNJNFRWVkt3WUxla2N4?=
 =?utf-8?B?aUdtam1TUFJCM2tUOXBKaUhnNDhXUE5MNzFNZ2g1Z3pKdlFjZVR4cGdKWUR5?=
 =?utf-8?Q?cJ6ZvOQkSVJIso4+FPufXOYf8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd817602-6d35-46cc-4585-08dbb4aa8782
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:41:11.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l547mhCrnygOo3mI9QQzok7e9GAxJr+LN2LmNOx0wsFIxAVKvTxdZTn9P+KVK4TIwM1ta+f0g7Rzn4lAr3EX+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/13/23 10:43, Melissa Wen wrote:
> Prepare to hook color state logging according to DCN version.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 27 +++++++++++++------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 79befa17bb03..a0c489ed218c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -279,19 +279,14 @@ static void dcn10_log_hubp_states(struct dc *dc, void *log_ctx)
>   	DTN_INFO("\n");
>   }
>   
> -void dcn10_log_hw_state(struct dc *dc,
> -	struct dc_log_buffer_ctx *log_ctx)
> +static void
> +dcn10_log_color_state(struct dc *dc,
> +		      struct dc_log_buffer_ctx *log_ctx)

nitpick:
put the function definition in a single line.

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
> @@ -348,6 +343,22 @@ void dcn10_log_hw_state(struct dc *dc,
>   				s.idle);
>   	}
>   	DTN_INFO("\n");
> +}
> +
> +void dcn10_log_hw_state(struct dc *dc,
> +	struct dc_log_buffer_ctx *log_ctx)

ditto

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

