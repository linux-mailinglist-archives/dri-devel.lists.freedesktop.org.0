Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D353792EDA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 21:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6232110E452;
	Tue,  5 Sep 2023 19:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4F10E451;
 Tue,  5 Sep 2023 19:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hd6UFfy0fMVARv1d6/v5qtPHrQaGqZYu0DpD5FgJ6KX3c8/md7hPsozKPrXuprOnce/lbOXnx50ILdeKSgPRthEkGLsuJYXnBiR4bOYk5GPMXZfTr2lWlI254/WPPfy7HgnX5O16WMDAMbH3AFY4zzgvAU8ArMc2TfbIMBaJYQfioc4SHLtxYdHQ6DjTK9rUkXfNe7dTuCAkVDXbJcQ2gje9chew8ImdAW7tXjUAatZ1p6J+WI0F+bdI+RwHAxE2rBKM1L/Ds+4HnhoafZYIcoqooppuLj39zeQpdQo6ljJUxEPR5tZw1ZuuedlLOQvwZcKL2p1auF9fKjoEXn0lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/1YLCEaFrZUtxmcvyGYXKIpiub0wi9xg4ezLR/THjM=;
 b=kEGy1b02ET1EauivezjsdFjhRh2ZOs7jMliFTpuGQE0FAED7g3A67MEkJGXUhVWaPVg2jRRL7CFFeOS2MEBwkM8WpTXLJZVfaAJRwCfGM7xQvSvqbHr81RsIu2HK3REHokZ/f+jI0RvKGaoB2SlZmGZNY5gP6t8uYK66IVSGFZP3NI8tKzwPEbnGjg64GayoZPmngIfBTlT+TyTSgqdabmH9KiwJnySpCah/Wzv1jt1vXvwlgPEqr+BJG/cfmw4JwYsN0vchfterdkuquKvxKoFiMiIPYz0lPbaSrV9q7KphSI2GSWfHcX/4l8QyPTeFOM9BJi+D0v4sh360hnFl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/1YLCEaFrZUtxmcvyGYXKIpiub0wi9xg4ezLR/THjM=;
 b=VDW1FA11TP0UsvAxKe1p8Tja2M9f6v6SKryUTseZs4yqPdkWTCwgXjDkgnfCMadlroles1yJKg759CGs8nI7rR0nMiWjWnBo+pfY/di0hs+asqA75jP7vcydJmMADCyX6ZJAqjR6pA8KUnaXfnDNl8iBFA4VUczwxnf1EAKINCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DM4PR12MB5101.namprd12.prod.outlook.com (2603:10b6:5:390::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 19:28:04 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1322:914a:589a:7146]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1322:914a:589a:7146%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 19:28:04 +0000
Message-ID: <e523a175-9f83-492e-996c-4a1fc0622149@amd.com>
Date: Tue, 5 Sep 2023 15:28:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: prevent potential division by zero errors
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230905185329.26934-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20230905185329.26934-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::13) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|DM4PR12MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bbc01c-65ca-4281-3a2c-08dbae463960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pnUsw1tzlX+J6fza47RsvmDETjj1KIXf342Na3yPWsN0GVhOR+VSjRtg77dGhXl8X2EYiWlQ6bXW9Rr7uqV0AkWHG+VS7/V1BOP7U1W87SWUuGZru8wJn8+1flfAkX6nWNyZAaUMqQf2M9vmrssZncyO2LfQ1U8sYYIDt0WKE3P6+FCiFr+fTaOFjDlWPwH18mto6bR77WnMOnU/HqnHtjnM5Z0HIG326MoH2j9L7vht8sk3rb9RGzpSyBfnUoKuL6vrWBoXHUKbTjLkIxmZmZ9SI0ZgksYK87IMbE9veM2uwt53FkVKhwpm1ro08Gn4HmkMZd88amM1Awew4lDExNd4M0OPfCiDAZ1MLWrp3TW6H2J5G+1d+A3KW3z+gCYp7SYnXCOxJwH2gFhGLkM7Lt3FF2kseI46woPmj9UlnU6lLAUWeZ5W8T+B667jkEkS1IUGVfoykVdk1jm5IyniJFCJQ2SAX2FoBZAlLuAwLfQkmOisrZxBFxlyMTRLur6V2+/RWghOKyv0VNv6gD+9Jctt4xppwES6KEGVGQXb4Lfu/a8V3QsdJ2eBt7cWfn1R00b44mKmw7v2ruiJeYTE7V8w28j0fZHF0iokoyVKjXpOp03eTKb3AGT+WcgbFEJ+CyV7roTNBqM1koj8bqxlYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(186009)(1800799009)(451199024)(86362001)(31696002)(36756003)(6486002)(6506007)(478600001)(966005)(26005)(83380400001)(4326008)(6512007)(2616005)(8676002)(44832011)(5660300002)(66556008)(316002)(66476007)(2906002)(31686004)(8936002)(41300700001)(66946007)(54906003)(38100700002)(53546011)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elpFZVFFcnJqckg2VW9LOWs3eGk0U1ppSllpY1YxWXhLMk1QbmF4RHhFUUNt?=
 =?utf-8?B?WVpkSDZZdHV2RnF6NitpRWpwUTdyaGlNckRja0dUY0I5RjlaU1Y3NjRORUdW?=
 =?utf-8?B?eGRhWVhiNmFiMlFoL3lxUVVsNWthR1YzRmw0K0lkNGRCNnF4UUtveHM4ajRX?=
 =?utf-8?B?a3o1N1RVcW9OWjMweDlzWWNUSTNva0JWeUR0N3BuWTYwcDJDbGtSSmI4aTcw?=
 =?utf-8?B?Ymh0bEVncXJnVmpSdmdQN3R3K2lYMXlzTVQxay9xZWMrN0R0MGNoVEw0a3VM?=
 =?utf-8?B?YjFWc09CcU9BQ0FHc2o2QS92WW0zK1k5b2VGODV4Vk1xU25veWlzYmFndkpU?=
 =?utf-8?B?V2lJSzdObDRjcTN3bUxCTUVUZ3lqR3c3dWFmVDBYeVAwdXF5MmdkTEhoa0xV?=
 =?utf-8?B?RTZKUU5vSEljTXc1NjJ1d2pvU2VNR3pZTDhndUlJd1ZmcWJ2Z3RYRFJTY0k1?=
 =?utf-8?B?NUxNNGMxRVJCWkUrNm0zVHphbUhUTmI3ZUh3QUhnT3llbEphWklUbUY0SFBU?=
 =?utf-8?B?YlNiK2puMUpMN1VmRnB3QjNvVC94T2RKWkFSV1huV2w4WnpBVDl1Ym1SNkVn?=
 =?utf-8?B?M1V2azFNY1BzRmppNU9ZNU5IT21vTTVHV3RMNldyYnZrUXo0ejdYK21UVUVJ?=
 =?utf-8?B?MHNucHNLQldHZC91Ti9zbjl5WmVuVUM0MEI3NVNPN0hxYnlOUm5RUXllb3pB?=
 =?utf-8?B?c2tVM0xKeGR3RXNjdXBSRmZibjhobktBbUY4SkF3WlBpOFAwK2dCOHV4UXJ1?=
 =?utf-8?B?T3BWcDFENkttazZjcVFlb3FBalJYdmtBbVJEQVcza1VHOWNwd2FhdUM1a0di?=
 =?utf-8?B?Y1NGc3ZsZlZSTVVlQ2FLM09GaTFrQm0zajJKbHNTdUcxcmViSkRqWm9hWVZE?=
 =?utf-8?B?aWtXREovZ1NRV1FqUmJsclg1MXBlWXhCZjkzWXJ1YlViMjVVV3c0eDVCSWIx?=
 =?utf-8?B?bUd6TDZtdVFTRGYvRDErR3lYTHRCRE1IM0NGSG1CUkFDK2IzR1gyaGlDZTho?=
 =?utf-8?B?TFhMSzlSYTdTWm5pWXM0MFVsRDl0R3RQc3QvNU1jVVR1bk5zS1pGc3JLYlpE?=
 =?utf-8?B?NGVBS2tobXA0dElVb01DTmVuTmVXY0JJbHBXV1F0aVk4Q2VwYm91UnJqZGZw?=
 =?utf-8?B?dUJpNGZhU1h6ZGQ1YU15MHdRN2pnMTl0SnphanoybnVsSkpXbER4NXk0d2dp?=
 =?utf-8?B?d1JCTHZ5TVBsRDZmemhTLzV1NThqVDVqdnVMTkQ0NU04VGg1SEx3Y1FHT0xZ?=
 =?utf-8?B?RXNLSStuSjJUQkVmUnJDUE1Ub0RRMlNpTEJyNWpiRkNuNCswRVgzaVk4NG8w?=
 =?utf-8?B?bkJUUDB0c2pJTC9xclNTdG5LQzZqZjR0d2hBMVBEZnYyWkw2ZDRCeFIrRDJs?=
 =?utf-8?B?QlQxdy8wcmlWVzNHUnczTWE4Skk0QzI5WktqbzhpMGJ6VHByWnBGVEpQdEpx?=
 =?utf-8?B?UVRsVWxkbjRSTDIvZHdXcjhNS01QU01JbFc2dkhTWmhuRlpIVUlGbG9SRzFx?=
 =?utf-8?B?eXQ5empwL21DSStNUDlSUEZraXUyeHdKc0dreWRya2V0UGdjbUtTbGp2S0FP?=
 =?utf-8?B?cGJWcm5VZTdJWHRleXJqMnRqL21vN1FSN3ZIK21QeE5JU1JLMnFPQVhkajNW?=
 =?utf-8?B?cUJuMFA1R3R2aDJKdnZTR0tzNjdtanFnSXYrdVQ2V3pJSFozcHR3bnVkVk5m?=
 =?utf-8?B?enlmV1QrUG9OQmVUdXNZRWtUT0YvNzhhUG5WNnRIMUQvaXIrYW9NbmNEcCtN?=
 =?utf-8?B?SUlsb3JrZ1NGZ2k2MW44MStPU0wwbWFWN2NPVFZVcWFWRlNZRVAwdVBPL1pF?=
 =?utf-8?B?bFdlRWR0aXprTGV2K0hjUEZoYkN4M3FGUExtMVpOeVJIcWtCbmJWWjY2ZFNv?=
 =?utf-8?B?dy9lV1ZkVGdCOWgyaEc3RmVRS25GUk5YVmN4c2VRaHVnak15TlVUUEpnTmMx?=
 =?utf-8?B?MHEvYnoreGhwMXNsRUlxUGVmRXpOaXlldzJGTE1wT2xDU0YzT1J2cVdudkFB?=
 =?utf-8?B?bFpqOC9jaXo0U01wMEs0U3lTMzBhNzAybkZJNE94YmViM1lhK2hZbjhsUHpR?=
 =?utf-8?B?MWpDN2g4ZkdNNXNLMGN0NElRUXozWnFrdWhrRU5CVVVPN0VuZU1zbFE2MVFF?=
 =?utf-8?Q?cQKSf/7MrnGa4xoDJr9IBwbsd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bbc01c-65ca-4281-3a2c-08dbae463960
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 19:28:03.9728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1dwAsil01fi0dF3lUB6INindrs4R2nmhs888r59TW2il2AqO3QxRQMguJvKmvGmaX7hdk9oFVA3nRvbmkJ2tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5101
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
Cc: Austin Zheng <austin.zheng@amd.com>, Dillon Varone <Dillon.Varone@amd.com>,
 Bayan Zabihiyan <bayan.zabihiyan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, Amanda Liu <amanda.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-05 14:53, Hamza Mahfooz wrote:
> There are two places in apply_below_the_range() where it's possible for
> a divide by zero error to occur. So, to fix this make sure the divisor
> is non-zero before attempting the computation in both cases.
> 
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2637
> Fixes: a463b263032f ("drm/amd/display: Fix frames_to_insert math")
> Fixes: ded6119e825a ("drm/amd/display: Reinstate LFC optimization")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> index dbd60811f95d..ef3a67409021 100644
> --- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> +++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> @@ -338,7 +338,9 @@ static void apply_below_the_range(struct core_freesync *core_freesync,
>   		 *  - Delta for CEIL: delta_from_mid_point_in_us_1
>   		 *  - Delta for FLOOR: delta_from_mid_point_in_us_2
>   		 */
> -		if ((last_render_time_in_us / mid_point_frames_ceil) < in_out_vrr->min_duration_in_us) {
> +		if (mid_point_frames_ceil &&
> +		    (last_render_time_in_us / mid_point_frames_ceil) <
> +		    in_out_vrr->min_duration_in_us) {
>   			/* Check for out of range.
>   			 * If using CEIL produces a value that is out of range,
>   			 * then we are forced to use FLOOR.
> @@ -385,8 +387,9 @@ static void apply_below_the_range(struct core_freesync *core_freesync,
>   		/* Either we've calculated the number of frames to insert,
>   		 * or we need to insert min duration frames
>   		 */
> -		if (last_render_time_in_us / frames_to_insert <
> -				in_out_vrr->min_duration_in_us){
> +		if (frames_to_insert &&
> +		    (last_render_time_in_us / frames_to_insert) <
> +		    in_out_vrr->min_duration_in_us){
>   			frames_to_insert -= (frames_to_insert > 1) ?
>   					1 : 0;
>   		}


Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Thanks & Regards,
Jay
