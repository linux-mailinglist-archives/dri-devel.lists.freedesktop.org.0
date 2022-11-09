Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900662336A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 20:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E12B10E069;
	Wed,  9 Nov 2022 19:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E073610E02E;
 Wed,  9 Nov 2022 19:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nto37k7DnvUt3MSitcOVlogNQ3H7Rgb72c7bTidOp6TQUxHgFy3afIWJwG48YD/1oozjsSwp60IF5vuhrmphRErBjNtzngUjE5TyjRE+WWJNAYUAWla4nqz2hupixgvw4hHLBDMc6CaP0NaTgqDaWX6IggFbDwsn5ibQl6VVODCrd17eOtE3rufjJqBkApG/5ogKqeQ5d8dABmiE9BbfgyQmxTuSJoSqh+emC5Xqa3xG0CEE5Y19ejAlpT6K9CNtn+cMjVP4O1RpA+3a/abrCj7esQWqdF6XuPI9gYQmnd/4D1m6WXbiQJSw+0ohis2+wbupr0aCByblCyArgJ4GYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV4jgGYwzavo/3otj4tp5+js/UzjvNOzZj9dAhE6Hug=;
 b=lAVY1UmJI4HN9yjUeNlPGkjRzqW4gpVbwbSNuDFabKEuXU7BtsiZ7X5jX4+SMCXAmqBOIXeekIYphFR+bpgEL3PuBv9u0Bv+L0Q5LyOyzKfW2Xla/iXvliF4OFBbpiUL99V1hKcri/Tf0N9EIo6GW5Jt4nVVEn2ZktDF8aVNYdJ6sKjYyzmXkJ2PsmHJXYRzjMTBN03Hkf7QsGkO2RWYwzQwd/0MXzxpiX06tlg+InfG04o4eXx849+0WAzz5nE1gUruIxs772F3YXXZd8bKE+9PcvI4j2E4BO5tLs7sMEqWCJpdzmJdyc0Rh3siHYQDf7r5NhuAVRIeIlXiVTLMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV4jgGYwzavo/3otj4tp5+js/UzjvNOzZj9dAhE6Hug=;
 b=CE1tumJPPGhvASs30dRCEqp55eTqh1scK0fIORIPnhODq+0f6ftZI8VlsMWmK5NObAIOKrsS9hRKY6z+GcnyOkI9ZR4SlMykUyB7llSBMlQErDCGqKyTOuNcx5SeoJ/HuoAFPCCwjC1TLoE4FDNdX2h+2NDXSZX+pwwbXyh+BKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 19:25:55 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a052:ef2f:8408:de1d]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a052:ef2f:8408:de1d%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 19:25:55 +0000
Message-ID: <3956fafe-b6db-a1fe-78c4-24f364e37cfb@amd.com>
Date: Wed, 9 Nov 2022 14:25:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] drm/amd/display: only fill dirty rectangles when PSR
 is enabled
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221109182010.171534-1-hamza.mahfooz@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20221109182010.171534-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:610:b3::7) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 322fcc17-d214-4062-d2f2-08dac28838cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLa8Yh1mMwHOhaouv0RAMrwlNMdSlL/4SCAeKsyLGdu3QdV73iGZqdO6xc90/yVnF29jgw9/WDld/4Xt7h8+Nmj5jvtF1Eyvqrv++1Bh3l3ljOFlnVIvDo/ufCMusYKivkfoe2Gn8lnLbgQTUJ2FytYE2ddvayNBqqItMIYCMF2a38CXi87oEiTPeGTRHzWaJcs87GSN7SufmEDqs6fA0/xzyt9mts8/uB0rLmNdreXaQ+J1wQoTIrnke9NRx7Fe1xr7/S29ZyH3OD5ssIbdx6t18ZqbGpSLn4Dnh6fQREQRUWV9j9isz9uqK7upTwYzhgQAJ/u5C0m1F/Sc6RwREPBux67jogu63/fGWiOaCpynTps8B43x0niP2sVOx2VDYT+bnG6hmRBOfqEYKyda0t6eyzWE/4cQWrSBq93Wqil+hPZ18cBWMsZjoJk0bx+TMy10jOtGK43PotBXl+fAZlUKyDly8e4qAWntlEomoJHy/Qzhmn2XbO0CyW+TMvRa1OVKuUxg2iJJTDqYzOYu3Z44jzyhP4XgEcOYqW31cDtlxxlXXyTnTYn4yN5ome7oNt2IsSDDMKC5zLQvVsE26Hr6y2pQkvLzSxPzXrQLjbm7meCaB/zXGcisIKYuljpi3PhRz6tsZCXEXSn9MPjIZKS3yS+7TfjZcGa29nFDL5BTU1veJs9OpyNE6PKt0WyM94/N6LkPKhf8Hdcv3LT9mw57d6s6EBJy1p8HLdYO8azWBSBsykYe4rJp4G6fW0BkuxdC3KD852ZxUGKVfOyyuYn1eofDAjtwW50AaDD2n0P6i1GKLNtlVWEfFmhiaGBx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199015)(2906002)(6512007)(31696002)(86362001)(5660300002)(41300700001)(6506007)(36756003)(8676002)(4326008)(6666004)(8936002)(26005)(316002)(53546011)(54906003)(478600001)(66476007)(66556008)(6486002)(83380400001)(186003)(2616005)(66946007)(38100700002)(31686004)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXgvT0ZzTlRPWHRJUTNPc09wOWkxQUJxeXZ0MGtMM0QzM0FUOWxKRXE1ZjA2?=
 =?utf-8?B?N3dNSEJLbld1OUtMMnpDcmtFU0xRMzRJUEVNd1VLZGNEQnhjZFdZam82U3Vz?=
 =?utf-8?B?Vmlra0Q3Nit2Ym5RRUc4M2F2bmFwV25nNXJhMmVMS05ZL0dqRDJvUkl0bE16?=
 =?utf-8?B?aTI5eW5NYjBKYVBXZlppWW53L3VuVlR1S1BCck5zSXFDY2dlRkg0L25rWDQ3?=
 =?utf-8?B?SXlkNGp4VStjVDBuU3NwZVZzS1ZJdVppaUNlY3lWODVvTEs1UlZza0tPaGls?=
 =?utf-8?B?MFluK0kwRnFZUWpPazNGUFRwK1dNRXJrQ1pIZThtS3pzYVRZbUMyNmJCMGw1?=
 =?utf-8?B?UThLczdvTXZqaG1WcTdaTGRuNWNhMkZ4VFdUZGZTNkZ4a245bzBwNDZJcG1p?=
 =?utf-8?B?S3BRVFBTaEFlS1daRVJJV1lMdU5XQmFrZ0hMbDVWSUtKSHFmaE04WEVRVTFJ?=
 =?utf-8?B?djRWL3N0YkRYK0hEdjJDQ01mWm1LNkdRL0VHb3g1dUdSalZxdlBrdHV3UjF1?=
 =?utf-8?B?dlVhVTJyakpHanVQaGpMNU1tb0JhT0UyanlpSTBYek5OZWs5OGFuanBvMDNo?=
 =?utf-8?B?WVNzWktvUDVPV3JJSjA0WTJYRXdiemtIMkMvWnpuU0t4akF1bGpTYVdPRmxm?=
 =?utf-8?B?YUwzRWJ5d2RzcGV1OUVQeFFDcGJrTjBTclRXdS9IKzk5MCtEQy9lOVJLcTdi?=
 =?utf-8?B?V0F4bjFncVl5T2dwaUt6UGttR2V5UVE2UzF0OTFBR3Y4eW9IdjBteDNEWUxh?=
 =?utf-8?B?UXZ2WGhVWmp6ek02RmJuWWJ3MGx0M3VabHp5aGZRNFJIRVBpcFNJWUNWM1M2?=
 =?utf-8?B?NzNuQXFZYnpvaFZGd1ZkL1BkMDRrVHo5VGl0NnV5anpXMjhrTlQrMkVQTnJj?=
 =?utf-8?B?bWFrRVYwbklQRUhoWTBYR3FmcEZBSGV2VmNOa0d2VTRKWUx1ekMwa25hTkNF?=
 =?utf-8?B?bG5rQzlYa0tZNXlkYWxtNG4wUTRFNm5UekltRG9Eam5rMytvZmVSMzN0U3Qz?=
 =?utf-8?B?SWJxeWV6U2h6RXFOWnlpSitZQnN2djlZa3NoWWI3MkhoaktDZWhOamExYXBi?=
 =?utf-8?B?ZGtYOFBkVUs0bEU5VnBzNzFGTGNtZG8rVmt5UHpOMkZ2QkVTa1dHY1VHc1FH?=
 =?utf-8?B?eVlSRFpjb1paRkZzbnBwVFVIbkc4MVl0QWVBVU90NGNqbDhuUDNtVWtLcU5v?=
 =?utf-8?B?ZE5tL0MrMWhRdGEwYkgvZTh5eVg1TWdMMktkSkk0V2FKRityaGkvdDMzeEQr?=
 =?utf-8?B?SzZYVVJ0eHFIcS9PZUNrTm5uSlJLNFl4WGxCSmpGUUl3a2JGb3M1V1IvSHE4?=
 =?utf-8?B?UURCbmM4NVNYejdWRkI4V0kxQ1YycjZLbE8ycllmVWtWbnBwQTNuUHlSQ2dV?=
 =?utf-8?B?TE9Nd1B2TitoR0JNU3QxclRpMG1aNUlXNjNYdVREM01Td2xUcDY1Uk5zNDhU?=
 =?utf-8?B?QXJZMU1IU3duWExBWDhGOXRUcUt1YUJ4aytLVTUvblJFVWFkSncwa2UvbEth?=
 =?utf-8?B?TXZPdFNCMC9pZGVSQjcrL1ZGNlo5ODI2VkZ3d3Rxc0xOMDFBWTNxQTBFUmdX?=
 =?utf-8?B?Rjk3ZXpVeXJMa25Lc3JrWE8yNjhteU1oUFh3WWI4UWxoRGZKM2g3bVpOQldz?=
 =?utf-8?B?SDBTQjQrYmREZnNtOEY2eWNkVWRnWUUrS29sQUk2WmltWTk4M3R4NHNyYWN5?=
 =?utf-8?B?QXRoZjVHRW1tNkFlNzJHc3NFb2RtbHFLTis0T1dTM3J3OTlzdHFyOTlVOHRy?=
 =?utf-8?B?Z3J2S0lVRTl3Q1FmY0UyRDF3YWJKTkZvd3pQVEh0NHlXRitEK3g1QStsUkxt?=
 =?utf-8?B?MjRzYi9PeWZ3MU9OZkhoRFllRUhuTHE5U0ZFeVZhdk1SRzhKV2VhZWZVNkp6?=
 =?utf-8?B?RE9BUDc3Z3hzZDBRT1dUZEorb2IyUEtRUUpaNnhYQzcvSjhtaEhvcDZHd0tk?=
 =?utf-8?B?M2VBei9BeThWZHFIOG9MTnlHYWd6bC84aGx2bFdqNDMxRXczVWh1QUxESmJF?=
 =?utf-8?B?aExYUkQ0SWVNeWNyN1ZoNEhCM0dBanJ1WFpJclhGeFZNQ3RUdUNWN2dBdGpP?=
 =?utf-8?B?YTZ1Sk1aVXVBLy8yeFdRVDZMMGI5V1liRnZWTlJTTDMzMHlqcWVwTUVCQTZX?=
 =?utf-8?Q?1msc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322fcc17-d214-4062-d2f2-08dac28838cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 19:25:55.2755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RadayOt/6fI4sJLm0nyU/VyF/lNUxWSo0ipTelIMkq6s14u5afvzgLsVlZQnRR56
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/9/22 13:20, Hamza Mahfooz wrote:
> Currently, we are calling fill_dc_dirty_rects() even if PSR isn't
> supported by the relevant link in amdgpu_dm_commit_planes(), this is
> undesirable especially because when drm.debug is enabled we are printing
> messages in fill_dc_dirty_rects() that are only useful for debugging PSR
> (and confusing otherwise). So, we can instead limit the filling of dirty
> rectangles to only when PSR is enabled.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>
Thanks

> ---
> v2: give a more concrete reason.
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 66eb16fbe09f..956a6e494709 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7697,9 +7697,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   		bundle->surface_updates[planes_count].plane_info =
>   			&bundle->plane_infos[planes_count];
>   
> -		fill_dc_dirty_rects(plane, old_plane_state, new_plane_state,
> -				    new_crtc_state,
> -				    &bundle->flip_addrs[planes_count]);
> +		if (acrtc_state->stream->link->psr_settings.psr_feature_enabled)
> +			fill_dc_dirty_rects(plane, old_plane_state,
> +					    new_plane_state, new_crtc_state,
> +					    &bundle->flip_addrs[planes_count]);
>   
>   		/*
>   		 * Only allow immediate flips for fast updates that don't
