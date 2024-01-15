Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F582E253
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 22:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0065910E390;
	Mon, 15 Jan 2024 21:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D227F10E2D5;
 Mon, 15 Jan 2024 21:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ges71KY6W+5GvdvPuKYLA7/kUOXKfkWQzzNb6wM36BhPxwQcNjtTl6cGlWrlrbUquStx9YSqC+oxllrdtF+9Sq0FE9/k7Ri1AkYbuvTpYuba3wRsPSGiABAq7F9PiZbYr1Ba1avryGYcmGrP9Yo1918wMUoBuzbR4gAhA7h9exa6CYNGEWFBSdYA1VeuSWKT4q4LfRiyH6MJkqjmZvk4n/+7vKia+Ghyw70zSEvuJATOjlX1FzozPcvlJuFf4Xm9JeX95qBYAvVKQiTVvAy4IHtcr/KVnKfaxjkwv+G0ATeu5/4B0wI1dvMpJXH4oAM/9gKjMZQ58pyivwb6Cg5thQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgw0hpYCxB9uBJgai2lu9NhUigO9+5qcBMy3/d6JAbQ=;
 b=cGPPMtM/kvUIv6BsXJbstL3qMJ0Y37HPFGYAZjWS7ivHfNEjDZWqcGRIhluYcm6xS/wrtNFqvALp0Ck+VdFoSiLgokGsTuXHQBSZVjqErBCb2TBHay4wjeyd6GtM+MKIFi+TxYWF3a8HtQc0AoJS0uL84sXNypa3xTjBPp5RwaL3EpIdjltmdtYS7oZkUl6GKknQjyuegMXqRGtzNYfxbeMOLEA2bRLQUJoJLQXQtsUWhyL+8X4uXvW59QLTil8P6igRnFdjPoIsD42oJsnGGXypwJz/U/MUkd4PJ3MHdC+KI9ckQW/NIvWGQmblAUc7tKUPMPyCY9ULjNs8aumrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgw0hpYCxB9uBJgai2lu9NhUigO9+5qcBMy3/d6JAbQ=;
 b=GQGYei7z/Ygh1GZAhgqfjxR3Cx3No4NC0Uw7kSr41+LsE6p1PC2izeJELRNX80Gw5SaDuMLD9SORBTSgmxSj66Ma2v7mHVmIcyQycuE3yqulIvOxP5t2k2ngQgCN1clptDvWBYjIgBM2m+Sq1ZWeS/0vvj/MRTEcokTONaQai5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 21:51:56 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7181.022; Mon, 15 Jan 2024
 21:51:56 +0000
Message-ID: <d12c2a3e-2a66-4624-b5e9-9921f3359036@amd.com>
Date: Mon, 15 Jan 2024 16:51:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix a switch statement in
 populate_dml_output_cfg_from_stream_state()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Roman Li <roman.li@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>
References: <e597276a8240329a5ece90762425c7cde2ddd7a2.1705157202.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <e597276a8240329a5ece90762425c7cde2ddd7a2.1705157202.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0287.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::13) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 2478011b-54b5-4aa9-544a-08dc16143143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WWvo14xNw50LA/CoKUJWiXqsChm/zViNiVrmEAQdT8yHdZnkyJp9466OKYBSkTQHEub9RWv6mhj3GURlUkpnQ2/QIv04bMpQii5UF028FPNvsNFzk+NadhY0vm6m+CZ67CUbibDgwSr4aG0v6sO4olXAx9bS076MtPvss44UkDixZBcZ/upDJOoHJP5Jdn/TA8lIsQ7X8N6hj11UlUeuxtpRQTDC725mKcnsVZk9ltVb5ljFkbPp45X7A7wayPgKRXM1SU/zMR06SQzB6mu49L7Eernw606bviZkQx5zzQ7Dk7EfSS0Y3NbQDtAyFDBWxQpUWsFljUeqH3Lz+j64h22vLZHwZHWyyuLHkeNwWubwA465FubT+OOfRnPhDnsmvqLIR28YoddY8Y8FydTbSSrO4RGZP1KH/u1j1E5CCJjVKy4QiUZhQMZrlpyW3tbKP/AfC/yXx2iRquj8oo1RNiSD3rB+b81kvmhElHL0xmBV/CFKUlGPBppczRH/1sBznYwb913R+8NV+X9P0ZqCG0kK+Zq1npgBCRXsKw9hLfsWAvKedVvuzkExqgf2CcF6sEWMpJlqoZ4k7DyWOKuJxdPY4JSEVjKtGYIi4oxN1V6E3d9pxBN4YSuII8kO7ydE2QxXr/jgVa8jG/laTKrPmli7znULh5E+1AkxXy5syc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(6666004)(26005)(6506007)(6512007)(53546011)(5660300002)(83380400001)(44832011)(4326008)(8936002)(2906002)(41300700001)(8676002)(6486002)(478600001)(316002)(110136005)(66556008)(66476007)(66946007)(6636002)(921011)(36756003)(31696002)(86362001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STQwcjAxTzNWQlRqRVVEL2xZVXE4WDZxbytLbDV5Q2tYbk1Ha1Z3Y3pvYlc4?=
 =?utf-8?B?UzdJUUpra0l2VUYvOFM5S3lGT2FzTk5neC9Ubk50cTR2eWJqcnNTYTEyQ3Zu?=
 =?utf-8?B?bXJTbGxjRXdlNHRGck51bmorbjQreVBqZ3paSTZDVHVnOFk2YWNVeEtXSkpM?=
 =?utf-8?B?bU9vUm1BcnVKYWNaOFhIN0M4MU9KMldjajZLUVJmMEdKOThsR2gyelR0NGN5?=
 =?utf-8?B?WVM5blVpeW9qWlVPUDdVT1g2c1ZFbldJclpCTE9DVUFRWW00dEVYcXlJMHBw?=
 =?utf-8?B?cW0xbHpvY0RmK0g4d2wrSFFQNUYxRWt1SE8wQjMrWEtrd0syclBFNkNEcGxK?=
 =?utf-8?B?cTlFdzZDUWZyWDNjVXpERi9yWDFaa2VqdnU0MzBOOHJwWEJuLzdrV0lkekdL?=
 =?utf-8?B?RUZ0N3dTbzQ4czdXRDJhYXhVMm9nY0oxNklWUFNBODVBaVJJVVU2cUtXeWxH?=
 =?utf-8?B?RFZJZVgwb3dyN3BCQU53RkorUG4rUEFNeTV1dlEzcjFZaEdmUzJMcFVHcC9s?=
 =?utf-8?B?THlXUzVPcm0wc0laaWQ3L3FuMkNQTkNQMWZJMXdFbUxQK0J0Skt3aVpRd0Fr?=
 =?utf-8?B?K2VDeFVkTGtwQ3VwajZxVlhuQzV4UGlPdFhEd01BQmVrRVIxNFBvT1B3OUwr?=
 =?utf-8?B?cHA1aE5SWllXWjJnNGlhbFFTTnVqRExTdzFXTjNHR3BpTEVwalJBdVFYZzcv?=
 =?utf-8?B?VmJ6elBObG4yT29oVG9oOGpPeiszTDM4VWZ5VVZxTHU2dEMwMzNJaEhrZEE3?=
 =?utf-8?B?TTE0VlBpeEE2OFJKNm1TK0FYOExwbTlxSGhrczRMV3ZjMGhlVGt5RC9WUlRL?=
 =?utf-8?B?R2dBcDJ2Z3BWUnk0Si9OZkY1ZktuZ3RLdm5GTWs5Z1pHSEN2OTNzUXIySlZP?=
 =?utf-8?B?OGttY1MwNlhlTmZidzFQQXhuQlVPQ0JPRXJVYTg3dVFtNmk2OHFiQXpUd096?=
 =?utf-8?B?WWhnUEFaQjlrRHhNQTNtNEJiU1VMUjdtWmczd0ZERDVLYnRrZG5aNk1XclB4?=
 =?utf-8?B?N3pScnJRQ1Rqc0xVenJ1V2lYTUlRUlFRQTY4RzZKejFYS01XRFltYWlHclA0?=
 =?utf-8?B?Y3lxYThEQWduZjNNNmRXYkdiVFhCdUVZTWFBQzgxZFBrTjZndTN1aGVLcnhJ?=
 =?utf-8?B?NktLQUwzdmozblJVbk43TFN1bTRWT3JIbW5RdnZ4K2lWaFp0RmxOYzFuYmF5?=
 =?utf-8?B?K1FTaVhwSEcvdVFzVjc5N3NmdzBDc3dyWVMxS3pEY2dhUkd3ZVBZeW1TOTFx?=
 =?utf-8?B?S0pkYkg1QnI0UlNtRU1NN0xiRXlJUmRRb0xuUDdvS2NNYU9MeDRmWVVhcHk5?=
 =?utf-8?B?c3NTYmhMakdNK0NZL0FZa0N1MVptdUxDZUtqQnlKSjllR1M1dzZ1K3FiM3lK?=
 =?utf-8?B?Z2tCYkZjYjRQOE9jeGxZTU54ZVZ0WnlMazZHUjBrVm9yTW4rRnhQaWtVSUtp?=
 =?utf-8?B?SWlodzNrRTZBUUUvcWVwaUxrZDdScGtWVWdPa0tqdWtiWUZ5OU94MmhQMjVr?=
 =?utf-8?B?amNrL2RWT25BU0t0MWE4eGgxVmU3cWdpMkpvb0doK0wveDVuSUd4OURzV0ZS?=
 =?utf-8?B?c2s1N1VETnp4a3dHYmcwZ0YzeVBnKzhlbHRRVmVKbzZZUjBNcVNlS1RpNStr?=
 =?utf-8?B?VlpLN1Y4YXVEdDZQSkV1bUlLWGF1TXFxTkJqcHBBamhlNFhlSFpQcG9XazJk?=
 =?utf-8?B?MzQyMlcwL00yZDVCL0tXRENHdjhhZVVhUGc1MVNqZ01ZKzdKRmprOUJDQUMx?=
 =?utf-8?B?WHoraHZRa25CSFRtQ1dTa2ZkdlVnS0pyOGZFUHZDOVQzaGpDMy9ObU1qbGVm?=
 =?utf-8?B?Z3BSYUo3NHNqTUx6cFpheVZ4a2ZHdUtoS0FQYkYwZ1RwZVkxTmJSaEMrd3h1?=
 =?utf-8?B?WlBJRU96UGNUTk9IbEVhRzlOSjhCNHdQVC95T2JST2xwOGNhSDZTSElwME1X?=
 =?utf-8?B?eHFPeGIxZkQ0WGwwZW9OSDVyeVhkLzA5SkZUT2lERjNYTktJS3JqZVFsQkV6?=
 =?utf-8?B?L2o2eW1xVzZFMXRNVnU2RHJlVlUrVCttc0U1dVhXdUt6SFIzZUhKelZ0RUVF?=
 =?utf-8?B?OXBOZ1lVdEQ4OG1WWkNVYWdSTkdxTVl6NHNCUnlNSjlqeWF6dkMzL3paclh5?=
 =?utf-8?Q?cKV/9c8FOOWrXpIBYQaS6Q8JS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2478011b-54b5-4aa9-544a-08dc16143143
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 21:51:56.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoKl+UWAMNOBgh91AwoyfemAico71Uaz02/ypIQdqxpZB066bGnE7xlhfdr6DbEYxs5CC0lPy32nMOrgN8YebQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
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
Cc: amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/24 09:58, Christophe JAILLET wrote:
> It is likely that the statement related to 'dml_edp' is misplaced. So move
> it in the correct "case SIGNAL_TYPE_EDP".
> 
> Fixes: 7966f319c66d ("drm/amd/display: Introduce DML2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Nice catch! Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
> index fa6a93dd9629..64d01a9cd68c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
> @@ -626,8 +626,8 @@ static void populate_dml_output_cfg_from_stream_state(struct dml_output_cfg_st *
>   		if (is_dp2p0_output_encoder(pipe))
>   			out->OutputEncoder[location] = dml_dp2p0;
>   		break;
> -		out->OutputEncoder[location] = dml_edp;
>   	case SIGNAL_TYPE_EDP:
> +		out->OutputEncoder[location] = dml_edp;
>   		break;
>   	case SIGNAL_TYPE_HDMI_TYPE_A:
>   	case SIGNAL_TYPE_DVI_SINGLE_LINK:
-- 
Hamza

