Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310497009E7
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 16:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2083E10E6C1;
	Fri, 12 May 2023 14:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA05E10E6C1;
 Fri, 12 May 2023 14:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xwrm0XcPUwN3WaXifgR3riA9V7/+9iVG6Wb+aKJHTqeHPA4DdCLhm7b8kqg5ITEzHhyP/F6d7zBS1hdHD0jFYRfdPqSyx8IJluO/pxVmmKyUd/JmeNX/QqqEkUdCMJtfvG/vkqrML3MRH19pUmNbxZK8xJdwQ/TxU+H0qkcfABL6XXNectza3APrKN/JTq+Mu2yyJJzE9UjTQAM5Fwh2zdgOB8w5pgtQwksgawV2cUZbyUg+Dj82OdQVcHolG3V3XZKMrkoIbwpNy2pgqaek4mZY8jjhuSsVETDU0YVkpePOARDFBj7o3BdVGf7suwimHmKr9CB19wi+9WCbw8RK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU431ZtbxpDZfJrChTWCnC/JfKirkpMX9gAnnMiElpg=;
 b=V5CC0WcfKGTEb5EKJL84VYLxZSqqLPMy4yrjXWdoBrmhuQYw/PgdLU/v7QCeEjqeBM5ZLcVETiyac2pKBm4PaSndp3vpi9TeQeEeOsVttxbCWa57paGOEB/v/+XMp//5TZvAmroxyoTS49xLgKpElTssuVKffaQCJMez0Ss7pZgc/xrlHiJKSUQKgVeY8x1ccwK7Z+bCuFURp2WZAzXYmB+9eXO/Ht3f358vlYH6qYdkTjXegk2RkGMgxYjAuWm3sFZtI3PFYc38jhttoE0SnLAeONp3w0HZ7p11M+J39CfoUCHpaChh7vyCkmxZRVXE2bTNJy/kW7qlT8SnNg4qUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU431ZtbxpDZfJrChTWCnC/JfKirkpMX9gAnnMiElpg=;
 b=plxgzaZeCir5tC4mubGGFF9hyT+BhT8tCs0JLFaizS3EGgLkmBbJ5zW6coKkp9Smr8YNzRQuCetCav0veh023/VUO/F6pTZDjweRg9/Rz9A7LQ9yDPzPwZeOPfL6OQzlTCuFwec+eLoibsC90gAyitiOyby0t30waltFVjd2etw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.20; Fri, 12 May 2023 14:05:01 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%6]) with mapi id 15.20.6387.018; Fri, 12 May 2023
 14:05:01 +0000
Message-ID: <9dd68975-b8a0-b7ec-3556-c0d7e16ac585@amd.com>
Date: Fri, 12 May 2023 10:04:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/amd/display: Simplify the calculation of variables
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, harry.wentland@amd.com
References: <20230512070451.107372-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230512070451.107372-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::23) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 680f5503-8fd8-4150-b145-08db52f1e03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8QZFOSxaIhPQ8w4HUgTjdXuAql1z6v31SkWE7g5jw9Y7mHi8Rdfd+gNQuvhpvQbBBqu5Xdi26DrIyPIcRrq8Z8s7T0jxrSs7VcKeroytiOSGP+urmU7a6iZ7rUlLxSVkQ7gjk5Av6iEEy/GXes9Sd8eOmtt6B2TmgNSjs2YRgdrLVxUO3CetswNmMO85bc516l6j/Ga+rHx2o25Hi7CwR0QP+bkWu778Uvsm06R0zqmkXWUA76t8zq7k+mtWKmWx5obZymuytNfoRkt+/gdbwav4/rDKjrYLcfiPz7rXtSriEY3oPgq+kpzrTiSpSb0UB5hZ2OPl4bebFEoTL7AnATeL9bJ5XFC+jQPaxgvPSy+Me5pLmwVWjjz80L1oAsWKiovOAGLdUsOuibGrXD41iYT8m39DID0YL/exM0Uz0V9z4ms0FD8yQAuXL6pyYQIhGRJfKNi4Lnqbcn3zuzVMzVsu2L+owVZzsHqnuyowid2KhV72+QO6pZbVxnteI2FuqEcQHVrQJssazwoCy8sr/m09GOckhJzhsFFyWquRZOZSm8+14zxa7toaI08F7mBcbdowi/nkj0aEy87DDz1PLa1EH8aznvqQRjubf8u319aigc7yqzMjyZksyyObLzm3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199021)(5660300002)(38100700002)(6486002)(6506007)(186003)(2616005)(6512007)(53546011)(2906002)(83380400001)(26005)(8936002)(44832011)(8676002)(41300700001)(966005)(478600001)(36756003)(316002)(6666004)(31696002)(66946007)(4326008)(66556008)(66476007)(6636002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0o1Q2QzVllubjBocG03RmlkKzd2djk0aGM2NSsvOVhhR2EwREZuSnpGR2Fw?=
 =?utf-8?B?MDRMSzBhSEJjMlV3S3h2L2g2dmk1NVdna0MwZmxmc3BmT0RDZWJXRk1sc3pP?=
 =?utf-8?B?VjhYcDV2QThKdUt6VldUdTJJQmV5Q2lWOER5dU5DeTdXdmpLd2VTa3dnV0FR?=
 =?utf-8?B?dHAzSEZ2UEsvUzQ3MHZuSWF1VDZITzJoWXFTQUYrcWppTy80Q1phMVczRG1E?=
 =?utf-8?B?YWNwVWtWSDR5TzdzbzFRdkNIRmt4R1d3UnZPQkJWT2FtL1lpUGFSbGo3WHls?=
 =?utf-8?B?VFJtb3pNSGwyejB1Y3ovRUxqTE5CdlhKYmluWWdsOHFyTlpsajVOUkV1L01m?=
 =?utf-8?B?eUhNOG03U0VuVzJva2ozNmNEOCs0dFMwQ2xIYi8vQnEwWWordmZ2S2Z3dDBC?=
 =?utf-8?B?TDlwMkJwTFhEZmxlQTRiMTFKMG9uOHVZblVmRm1ZaXRxY2lSdFRSR2hMMy9C?=
 =?utf-8?B?U3F1MXI4VWkwQ05SaWtMRk9MQ3hkZG84Vm9qWXY2WkZ6bkhWbVBjNVVsVkVI?=
 =?utf-8?B?WXV0TzZqQUFNclhNMjI1RFh2emhmUFRhbStLWDFsTEhDREkzM3B2cnZsMjJa?=
 =?utf-8?B?OWUxSmRkSHNYV09IaVBhd3BGRmZBOEZkUkl1MllPcU5VRzJ6bzkvVG1zd3d0?=
 =?utf-8?B?bXpMR0c4QW5sYXZlMzRObkpGR2NIQ2VyK3V0a0c4U3Q2NlQ5L21kZVNuRklx?=
 =?utf-8?B?U3E3SW5EY2NRVkVsUWNkQTZMVk1YZVFqOHptQ2MzK25pSVJzdi9KNlNLS2dG?=
 =?utf-8?B?MDJLUEl2VEEwSEF4dVZKeW5XclF6WnFaR05mMFZSSjNsOVdMYUk3endwdVZh?=
 =?utf-8?B?TnBUOHluOS9QTnE2TjF6c3JXaktjUjZSdXQ3KzN3YXBQM09jdWQxZ0pSOXla?=
 =?utf-8?B?MTNUMnlCRHdMMXpQRWNFMFVuSklUcGhhL2VhYXZ4MDZrd3hwa2c5TnVyQitS?=
 =?utf-8?B?cTFPMmNXNDBheHRmTmdQVGxvWFIzVWVSY09tSi90ZFJRY3hmNDJqSFJPTGsw?=
 =?utf-8?B?bHcvOUJLSlhrdTVPMFBaUmNsa0F6Z3hoQ2RHNkhvajd3aFRSRHJodEZKTkwz?=
 =?utf-8?B?VXlCYnZUcGZTL0VhKzlHMU85Vy82SkxsakNseDJaTTNndG8xb0JDYWZWbFJp?=
 =?utf-8?B?RXZJY09Zc1IvRWtSUnhnMFkwYVhEWGVGMC9TQnluKy95TmlQc0hzSEtOU2dm?=
 =?utf-8?B?T240OVlTQ2RFb1RrZS9UTDlxYm9sNjVaUWt2TjNnRVFMdW15M2R0S3Q3TXhk?=
 =?utf-8?B?N2RJZDA0TlNaQ3V3c29IajZtL0l1YnFDV0Vzd0N0NklJV0RTN1YreVNoMUp1?=
 =?utf-8?B?UjNvOTZWdENldk5BVDZ4NFhrVHl0ak9ZTk5UUjZkaEVNK3lYR1ZOc1Y0QTNr?=
 =?utf-8?B?akhVc0xPRmhhM1ZhNUtIYVRZdjBTZVBxNlFCWUlOZ2pXSERDSWk1N3B3MTVI?=
 =?utf-8?B?ZTRkNkVteEppcFc0MzBwVkVEV2NIWkd0TGdtMWVYUU1hWGJSeHRwTm1yY250?=
 =?utf-8?B?MVl5NlUrdzJXdHlCZ1dadXdqUmF3VHJmWEVoN01sNitxVXQvWHBLRTBpaVdj?=
 =?utf-8?B?Mys0L214V1FFdE9DeW9SR3lhU21PbkNBd28ycjBIN21waUV1ak5iOWhnVHlB?=
 =?utf-8?B?Q0MrMTVuTW9lUWoxMEgxMWpPQ0tHd2RLZjJxV0VUQmQ2QzdzVklHYjd6Tjha?=
 =?utf-8?B?L3N4RG1rV1RwRjRseXRmZlExWUpMczJxalc5OFllVHVZMWRxMzVFbG9ieGRV?=
 =?utf-8?B?OWdjdndGY043c2doMVc3RzdrOWhtT29tQW1WVXdNWk9FOHQrb08wWnZ0SmNP?=
 =?utf-8?B?azlyUys3WFp3YkFlQ3E4UDN4OWFzaHkzM25IR1hBdHlDZDk1TzM0UkFkRGxx?=
 =?utf-8?B?RVVpQzhNMWpQUUdBSnlwc2lYRTBWV1lZRDVEVDFCRE1LSHAxRHVqSEU0TVQ3?=
 =?utf-8?B?ckZiZm4vbWZFZFZFM0tMQmNVYVIxdEJGeXJxKysvQVV3eGN6a1o4R2NSWEwv?=
 =?utf-8?B?Q0tqMHNlQmNDdlBNNXBHZFEyVXFid0ExVmhUeFJkNytVYy8zN1VialBkMU9V?=
 =?utf-8?B?UWZLYzEyM0lNNG85U2pJNHJCdEVpYVZqVXR4YlRRSXNmRXZHZkdpQTlsSGhl?=
 =?utf-8?Q?nYV7rBan9toTxTS1Cul03c9i9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680f5503-8fd8-4150-b145-08db52f1e03c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:05:00.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/6Oa2eJyPTeOAKV6H/HBwwLUu4Jt8KK0c8OjEeHo9bBhJ3wJGLRDg4XLXaEfIcE2pn39sjaE2zxxp6iqFVkvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/12/23 03:04, Jiapeng Chong wrote:
> ./drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c:586:37-39: WARNING !A || A && B is equivalent to !A || B.
> ./drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c:595:37-39: WARNING !A || A && B is equivalent to !A || B.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4941
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> index 4950eaa4406b..2de910e0ce75 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> @@ -583,8 +583,8 @@ void dcn32_update_force_pstate(struct dc *dc, struct dc_state *context)
>   		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
>   		struct hubp *hubp = pipe->plane_res.hubp;
>   
> -		if (!pipe->stream || (pipe->stream && !(pipe->stream->mall_stream_config.type == SUBVP_MAIN ||
> -						pipe->stream->fpo_in_use))) {
> +		if (!pipe->stream || !(pipe->stream->mall_stream_config.type == SUBVP_MAIN ||
> +		    pipe->stream->fpo_in_use)) {
>   			if (hubp && hubp->funcs->hubp_update_force_pstate_disallow)
>   				hubp->funcs->hubp_update_force_pstate_disallow(hubp, false);
>   		}
> @@ -592,7 +592,7 @@ void dcn32_update_force_pstate(struct dc *dc, struct dc_state *context)
>   		/* Today only FPO uses cursor P-State force. Only clear cursor P-State force
>   		 * if it's not FPO.
>   		 */
> -		if (!pipe->stream || (pipe->stream && !pipe->stream->fpo_in_use)) {
> +		if (!pipe->stream || !pipe->stream->fpo_in_use) {
>   			if (hubp && hubp->funcs->hubp_update_force_cursor_pstate_disallow)
>   				hubp->funcs->hubp_update_force_cursor_pstate_disallow(hubp, false);
>   		}
-- 
Hamza

