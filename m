Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650F4F8169
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 16:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA9310EA45;
	Thu,  7 Apr 2022 14:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D4D10EA45;
 Thu,  7 Apr 2022 14:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK1ztRJYMkbYb0x5Qx1UURXLyi1bWA8UrHhibeeIrbCutGM7DR32p1MO6/dk74vF289EUkENO6L63hBh2E1cLYU6SG8eS8ESEDB7IXoQl9VXfQ7ONZObXKbMR7P/7mstndzEGJ6t7na4hfTh51h7Cao8e8CQBr0h573ca9LFemMtnDsGRiGAAAMirkrxFbpejOjlhQ0hSkjQqHgw1A/r8XnU1usNt89tt4Yo5udaV9KOqGXxhl/+yZTnphAH7LpZsQp900RCjhcC48akxiXETWYVHpC+q+mmhXr4s0Jn+Cb5SuMstGn5HlBS8EMvYsGiolKgGWgS8RwidIx+b8IdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgTyc2SwyvgtJXr6jHmb9texLeQnWN7NW2ejrLYrQtY=;
 b=MSSIvW58v69nYw01YG7P7PpCX+id4vOygsQ31aHC88HuzhoJbvig3GRHURvmxcyZRhwlt/OnYmku9d8XRHqLY+c2dSIqBmzstfddydnbFk1RqaJuZwh80LcZ7yA342Fj6a1OleK2D14iS2jr9a15koKuddrEWVyi1bhPJcvJ+9AdBq+nhw74H1E1TZ1ZYmDi239XDzrTI07N0KGVG6q3v7BkG8l4AccRtzT4d3lRIC90fvhT048v//9aMP/+fv+kzgn70BzrjHv9nxMKOi7APjgiGaYNI0LiOkDWzsmydUCSxZOBtGuh1gkD9tnWDD6l6LByJea0SG9p38hv4YWNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgTyc2SwyvgtJXr6jHmb9texLeQnWN7NW2ejrLYrQtY=;
 b=2krViFfAos689dY5XBUkCGzROzvTwutYPX0vMTCybW9TDbMoGBin4meksm9+PXNUo5sfQOtI7f/yhsBJQAU3kwgl/nm469mgQe6TaUh9BIY3I5po8sKd91klLvFr8sap67sm+rZHA/ZvPrzvFSePS3/3reHwZ3F5Zb8bSCBYniI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 14:18:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%6]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 14:18:00 +0000
Message-ID: <533ae31b-1794-f28b-a783-a356e9707ef3@amd.com>
Date: Thu, 7 Apr 2022 10:17:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amd/display: Fix pointer dereferenced before checking
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1649310731-15934-1-git-send-email-baihaowen@meizu.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <1649310731-15934-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0160.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba5dd892-1aad-4370-95f6-08da18a16b97
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2528F57F10AA8CB017A08A8E8CE69@SN1PR12MB2528.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gx239C35bt488VlTJ0l7kEotZWYFGZ7vOa4noQ44QkMgpo40vJaAnc+jA/8FMkeVWgO7GY5BGL7s6YNTxdH32Y0LFqcN5K5nQRT5JVEJPHhVB51NQenBj0qosV7HAlXOLp/dUM+8xdtLAa1ssGgA8eZOZ7454Lpzk50LyiYtLNxfFniYXmSKgFgg184pMXLuR6+vFO9qvPYqRokYDcFclhms8sYzqn/nGMRYaPXyrSzLLDn5HpusJuN09Ld3RC7Uy2r6sRIDubkk0S2UcEo5ssPBFHIbXCnm7Dt4HE3lkFT7umFF4zeim31RVGsL6h9nAq1W7B0m74HEySfCuviv0nFHxW+45PLC7y2j1dxEfZYgnYbHdFntfMk2YAZwB+J6cQGRGzFUPV5IRtUKHSohzzUKM+u+/VaPzJwEWtAf57QnUutLHcf101jmxGD30A8gepECZ3Y9IVI/V5rQR2XzsbfjOmYsRf0AjL6TuS8Yck+gyEHE8UqFMQYbmM37Rl/9ho1VmEdGuIYQv8zvR4qcih62V6mF7x9j5X/aOq2sjbQQEgbCAOuc0Hsu4hx3AjbnzOdzaDDX2ymAITORAylrMpiYx8Twiclg5mSDAknLiYoZmclx5uxkElh9QlWdWitEHhahIRrM3GHkKr4g3/OWJ2CD4veV/b0V6VjkwA+18EeoOwqg247uQhN3qw7GsAhmyTx2CBrYNrKhFwuDVnTUj5jzKJiwQTgXApBn2kokLLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(38100700002)(86362001)(5660300002)(6486002)(36756003)(66556008)(508600001)(316002)(8676002)(8936002)(4326008)(110136005)(66946007)(26005)(186003)(83380400001)(2616005)(31686004)(53546011)(2906002)(6666004)(6512007)(6506007)(44832011)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndyV0M4eTJWVVJJUkU2WGdDWmtuZ21hZWJoNE56TUhaMG4yNU5RcEM2WW1a?=
 =?utf-8?B?M1pWMnJieVlLL3VuclBWdUd2TUpGOGEzZ0RTZGJHOXRYRkJ6VWVRckNTRC9G?=
 =?utf-8?B?QjNqVFlNRUFySEllempxSHFUZ05HUStRTTFTK0pqTEtqcXFYbzI5RmJnS2xt?=
 =?utf-8?B?d3dlOEQ1eVBoblNKQXdlV2R4TnFUSVB4TjVwRGlMMENuRGdEMG9YMFVXMlNF?=
 =?utf-8?B?TDFHc29sL3ZGSjRvOXBxcnU4MzRnL2U3K1hpNWhUbm9WcEFuNEFod29SSjVP?=
 =?utf-8?B?QUVrbVlLNk16TklsS3pwSjR5dWQ1NVhqaWZaZDRGV3lqV0tnMEdqSmZHNTBY?=
 =?utf-8?B?L1h5QmJxYXg0WmNGazIzSldxNFdibVhQMHV5Y3U5Tm4wZ3ZhTUpYemZ1ZnRV?=
 =?utf-8?B?YVRoZ0JiY1RVSzdlbEZkaHBPeVI1Wk9PaXlHNHIxYlg4akNhTzZEanE0WG9V?=
 =?utf-8?B?S2J5bytnVStUb2loQTRGVllUWlBPWlZWN2NNVU5aVWpCajVtNGhwN2p3VUVC?=
 =?utf-8?B?VHo1ZVRveFM4aFNTM1NHZkNiYk1CQm1MdjdVSDE4Z05JRzdMb01HYzRjNzFQ?=
 =?utf-8?B?SWdYWVdweXloN3R1a3ZmUXh0T1B4V09rcGxsWDBlV3FrbERvMHRoS0ZWY0Nm?=
 =?utf-8?B?L0FRZGxWZjhDMTgxYmlPU0FtRkkwR0xPT09KSWM5dzZYV3ZFbGZTZkcrQzJ6?=
 =?utf-8?B?cmFuMWw1RTRQbmlGcG1KaVE0N3JDb2xXMUI0ZVZJdEpjaTVSaklCOEpGYkM3?=
 =?utf-8?B?QStpRFVxNjRVdG1LcXZYWDQyZE14bFRVcTVBTjNabmpNa1VaOFNtVXdjYm1x?=
 =?utf-8?B?bFc1dW05clFtWUpHanYzR3lCc1gxTmxRaXhCcUx2VGpJSzhPcEtBOEdFbHlW?=
 =?utf-8?B?aEx4S0pMTk5NWVRxK3p4TUdZZUp3UXNGTUNUMUNxQ0NKMFFnTTlxRy9BV292?=
 =?utf-8?B?MGxPZVNqeXFoVUY2VlJXMU1xZVBibjg1QjFmMXNLZU0ycWhwK0tia2xJcnRw?=
 =?utf-8?B?ZXM0WHVLWUVDK0VuSmQ1cG40SGZueC9ZOEVOUDkzNDl3NEx0eWdQL0lSVjFk?=
 =?utf-8?B?RStzZ1VPR08wWkh4VTJjdVZmckVzRzBGUWZ3T3ZxdkRsUzZ0R1gzNWJVK0py?=
 =?utf-8?B?dUx1RTdJVHZqakwrdGp2TlNYRFprTkhGUzdkblh1R0JRRHZHUjg1cG5JRU5K?=
 =?utf-8?B?UXZ6clF5UEMrYjZqMDhBWjlXTXVYSVpLZmdvYVkvN0VYRTNaUVNXYmJIcm1S?=
 =?utf-8?B?QVZUSkQvN3k2ZjlkbVJnY3VIZVJWOFZseE9ncXB0ZjRrNmt6aU1laGF3c1JJ?=
 =?utf-8?B?blh2SGdFYktZVkI3R2FZeVIwZ282TFI3OXBQR1EzUUxsOXcyMzVsV1BIYmVQ?=
 =?utf-8?B?OElRUWZ5WHJPM2VXS0FSTWNObXhuTnZEQlRBdWVMMms0MG13T0JTdzUzTmxD?=
 =?utf-8?B?K3REcVNXSE9xbzFyOXk3U1RMaWpxdUl2YUJXOG9Ra2J0RXBJaGVaNlkvWkZR?=
 =?utf-8?B?SDRGYXRBMlJPbjBOcUhSZkRydVMxRDErUms3b1lPMDhETHJKUE9xcXZ1b2xU?=
 =?utf-8?B?RVNZU0VuYTNMaWVCbStMWXN5WkJEY1paLzRKQ3VGSVRIMGZzUjRrVjdOVkps?=
 =?utf-8?B?Ni9pUnk0Z0Z2SkZWeEoxMjJUbjNOcFlqZm9PYXgwK29vQjlXVTRWYmt1d3lu?=
 =?utf-8?B?NFk4KzdNSUZlMHU5b2NHRjU0SmtNTFlsQ2RXUG5McmYrRmFGd3JtL2MyVXFj?=
 =?utf-8?B?dW1yUXhiVWlxdGoxUVQ5cGZuMG5WTDlDOFNMQ1VUenVSakxmNzN6UHdiQ2Fr?=
 =?utf-8?B?NlE2UXlmM1lENUYzRXM1WXN0eWpsQUFFVWVIZ0tPY252aFNDTDNPRzJMRHdO?=
 =?utf-8?B?SUxhNUIrVWZ2TDA5Z1lQTjdOREtMTnI2ZWJBYkZHckYrd255eGRiK1FsRnlv?=
 =?utf-8?B?cGtXQk53elpUMzU2ak1JSFJSdzk5RjR1R1hMRFIzOXgrUE9TTVNIWVBtUDJX?=
 =?utf-8?B?dXd1NkVXekdPZWVUN0hDekdTT3ZkVEorUEordzVLVDlQSWN5aGRRUXBVTVVG?=
 =?utf-8?B?Q0ZoL0VoSkxER1g1YmZxbnlTcXhpLzIxdW4rRzYyWGtFQXlNcVFZNlJPckVS?=
 =?utf-8?B?UFhBemdNdUFVK3ZySkt5TFIvTHBQQ3VPZktQT0RmSGV3dnZBekZheUhwN3ZT?=
 =?utf-8?B?T1F0Z20ydW03aUEzOGFiQUs5Z0JzYi9EbjNvTm92ZjJINmRkd3JBdG5seGZi?=
 =?utf-8?B?NllYNDhvWmpESWZjM3NjQUVENjc3bE1rc1QzYjJuUUZqbHFHV1gxb3FlRmhk?=
 =?utf-8?B?QjRUQ3pQdDEyd2RtMEg4c2I3Vm4rdDEyS1g1ZStjTGdxSnFzN2k4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5dd892-1aad-4370-95f6-08da18a16b97
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 14:18:00.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOuB2ltnvS4Dewoj99s3w1wZ619TqUISz/AB+8z2wlCq2S+pVOV+5evDj5o/IIF8sD1sPZdOw1g4ymQfHsUoDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2528
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-07 01:52, Haowen Bai wrote:
> The pointer dc is dereferencing pointer plane_state before plane_state
> is being null checked. Fix this by assigning plane_state->ctx->dc to
> dc only if plane_state is not NULL, otherwise just NULL.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 50820e79d3c4..ee22f4422d26 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -3211,7 +3211,7 @@ void dcn10_update_pending_status(struct pipe_ctx *pipe_ctx)
>  	struct dc_plane_state *plane_state = pipe_ctx->plane_state;
>  	struct timing_generator *tg = pipe_ctx->stream_res.tg;
>  	bool flip_pending;
> -	struct dc *dc = plane_state->ctx->dc;

This has worked for years now, meaning plane_state is never
NULL here. It might be better to drop the NULL check below.

Harry

> +	struct dc *dc = plane_state ? plane_state->ctx->dc : NULL;
>  
>  	if (plane_state == NULL)
>  		return;

