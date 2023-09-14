Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6A7A0F1A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 22:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AA910E417;
	Thu, 14 Sep 2023 20:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D1110E2B3;
 Thu, 14 Sep 2023 20:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQoVhNJkR9rABz9i9N6j2XZdXe9a2wL9gF6vigSRglykB5+Q1cWDdSzJ7JuTkO0My4CMMyMUr//gVVeYMnkUXov/wpf0MWmgxZMlfVlC79dI/tawLgPch3+0pNxDi0gH1Nar1bLyemhz9yPjTy0mYKSr3msWJU1mOPZfCEqwINLRoHXKM9gnyO45YMjayz0G4bjqoVOHGPV8MUCPi7xmRZrxelXx+1vLrJ1u1fvfpgzunblIELR+orsf9nJO0oF7GGqT7x5l+ycZs3eYuPMyvrmWK5kTQM17rx8eiB4aaYDOb6M11C5r6MWXI/ecK2SNNCSWpaLx4Jhl/TEK+iy2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlCSwCVttT4GpQ+N7oP90coj5rZVKKb2G3tUooi1puI=;
 b=AIrtbCkJJYVxQofwryZVodi2PAPoYH+8hNkmq7//oyosG0IIMfYFMpfYjm2lpOysDgB0ccmwS97i2ykco1s5f/QXPUwa6ZWJWsrSQ7XrSi16tlJLGH5l0KGiDLqH9b7t0Ijs/JEgVtmunvPQy08rZToaH6fRv/O1/1RWQ0w5zSu6JphpmjpsLgrp61TCabpyNon+58myeugyJU/D07NDI+53zNmJB1m0jgDpexaGTDgURZrDl74USjjWsIwD2QXSbwUhtfWvXAZMlxGngOCN/fK/sf9CasJzYEoVw1ffiqefFpn5K9G/niIbx6CY6aE2wItdiCTvzZr8PecmpO9hYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlCSwCVttT4GpQ+N7oP90coj5rZVKKb2G3tUooi1puI=;
 b=MOJakMXELxzSy8LqXL5IU4S/SQXe8g2LXetB4U2yFh7DY6sQAyAhMc1jhIc6OA3/IATb5qoeoa2SZn+ZXdzsSs0Jh97lomQ3+VI8x/E1/jBuv5YzG204ApwS7SuqiyeIrO2cetJxcRFcde/lg/JehNoUrbZCZKSR3TKcM9YthlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 20:40:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 20:40:57 +0000
Message-ID: <3630bc42-c04c-4c22-99f2-5dc6bd5d8e2f@amd.com>
Date: Thu, 14 Sep 2023 16:40:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix the ability to use lower resolution
 modes on eDP
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230914175354.102709-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230914175354.102709-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 9117f9ae-e3c6-40e5-dd1c-08dbb562e5dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPmA9PO1yWbqQsdZ06/Kaj9k3gUAWzywSA81VnZFhXTXdLA5ui2q8Lp5woi0QCP2gvhQHqX0kzSEe+aCniNgSVnfD9uTItxskXneXFJzp3wS0yPSzwS1TNrpsCfMQ98Ro2UQQYTQC30wqjqjKiUtcWK80BNfMIlX/z56zWhFJCNGqVDUjL66iMQ8SzR7JkK+T6IyTAut6OWCeg3yz65LQo83fBp+kWsaZqJuPwrAHpKwfKhrL1reLX3xAkKKhUdARHFFXfgGKbt91uVnNPK7OeORMk666QOaDglL464nyi793clg6ahxrqBmI6jZdgct0JQVPLBoRxV5BhqGuuVIm+6u1h2AQav7Rn9NcY3DuFJGTjXveMuqDWquYfED25PuJXseody3cQpWx+yz4OtxnCdz8clVxh4UMNdTc/djbPqAM+qM8TcqnSt15UUkCSNz5HFNOB1U27jqp9MTjJaDBM2RNtMzhV3GAZHU89GLgDovBCxRf0x/cvU6CUgF/UHGFB3jI+87/IsqQFt6NBBDqh95PG2GNjhnXT1RS1kTGxehgsW91pS0nzLCEy0DF+3SdPcxFcrTog0BV4O/FhkN7PdTdG/DTD3f45d9bFg/NEfuNb4Rqu257X9cQT9Bgn93
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(186009)(1800799009)(451199024)(36756003)(31686004)(316002)(41300700001)(86362001)(66476007)(66946007)(66556008)(4326008)(5660300002)(31696002)(8676002)(38100700002)(44832011)(8936002)(54906003)(83380400001)(478600001)(26005)(966005)(2616005)(2906002)(6666004)(6512007)(6486002)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzJmN05xTGlFSmkzS29BcHVOSkpRTjVhSnJNcDhCTitPRWFFQjhhU2p6THN3?=
 =?utf-8?B?UWRqTkRSRFI0NkF1UXg2dkNueGhsMHpSUytHa2hPN0xKbUYyUEJDR3NkOXZD?=
 =?utf-8?B?SEFNUitLTmRYc2c5R1E5OUFTbUROcklwK3hHWDZWRTBRT0lucnpTWkdaeHlW?=
 =?utf-8?B?ZktFenNWM2RQVnRSV0QyMGZoMEx6NjUvQXJFb3g0dzRYVVNFelJxZ2dLM2NG?=
 =?utf-8?B?bk1abmR6TGVOcURPU3JuYW5hMHpvUnJleVhiSzMrWEk2YmU2RG9GMTR6bUQ4?=
 =?utf-8?B?QURONGFROUt4ekhpZG94cnFwN01lZWJoMmg3VzZ0ZWtiSmNQR0NTeHg3Zy9n?=
 =?utf-8?B?T1ZFcTJmK3lEZ21waFV1ZnNFRTRjWnZzOUJQWlhBOC95cERjLzJ4NzhlNGpj?=
 =?utf-8?B?MnVUSlk0MHRLeW13QXFEMGQxMytKNFF1WHcvN29WYmxkSlVTMitqRlhGNXha?=
 =?utf-8?B?ckFnUjcxYkN0dEVaQWFSZy9id2pJZ1VuWkxNcElnSTNsTFRwKzZ6RFNXeTF2?=
 =?utf-8?B?aURlK1h4UXkwWjJxUjdzdm5YN3ZLLzF0Q3hPYTY1eFZPOWNoQ003WDlzajJ3?=
 =?utf-8?B?WHoxOW9xOWR0cTg3MHRMZXUrWlkxRGtFdWh0ZlVUb3NPVUJ5dmNTRk9TMWE4?=
 =?utf-8?B?SjQ3ZjdHdVhmT3FScWRXa3B4VG4xRzloK2ZXRHhoeE1BMS9WYXllNEZOMExB?=
 =?utf-8?B?elNjOGx5UXp0a1VKaTFZWW9LTlhLcEVGcitFYngzWCt3eUhNekt0NDJHVm96?=
 =?utf-8?B?RWV4ck85TjlkVlcvbXFmcTZUWnMvZUt5dTJzS0FlVHZsNTNnUXlLNHlpcTF3?=
 =?utf-8?B?bWpNbmNsOHhlZ3dtanAzS25Qb1poRzdvV0ZwR0FORU5LTlFyZXB6TnV1ajV0?=
 =?utf-8?B?aGg5V2xxUVhqaVFNT1piRGJ1K1BWTUFQRkF0ZlEzS1FRL3B2MmM1MkFsRlJq?=
 =?utf-8?B?cU9tQnBOSDFEamdQdURENjUyb015YmpQczA4dHAxT2dFVWs2T0R1L01VclJD?=
 =?utf-8?B?QWhzamJhUm9pUmlLdEt2SjBVM2RlMXM3Z0lGbVBPeFpJaW1oNERqVVVuaE04?=
 =?utf-8?B?clhZeW1lUWNmVUF2RjNsK0ZSaGQ3bFFNazFKUDRiZ1BZNC9ZZjVMUXlyRDlJ?=
 =?utf-8?B?ZVVxV3Yvb0lkRk9yaXhXdjRSSUIzUlZTTG1IU0c1UEtlVVlCQVJDd0lDMVVB?=
 =?utf-8?B?cHpDeXB3R0dud2I3cmwvOXhBUDZ2NU9vMWowbXUyQXZhRnQxaXk4TmdHdmw4?=
 =?utf-8?B?a0pNZ1ZkcFZWS2p0MC9RdHlkM056Q1grRWxkUFRvUXRZdW53eDRJOXVWNDB6?=
 =?utf-8?B?eFVGeDFDQ1BqUEdicEFnSG1OU1BoUmJTYnRjdFM2c2dZbWwzSmt0VnowWjhk?=
 =?utf-8?B?Z2E3clhoTHJ1dGZ4Wk9FdzFRVUtSYVJad1RYcGwyQVBVTE9Ca0JqVHl1S0Rs?=
 =?utf-8?B?dzFGcXJKNTM5RFhOKzJsK1plckY3ZDh5enA5aGlkSU5QTkNJNytTM2VzanFH?=
 =?utf-8?B?YllnM3cxZFZIY1BTZG14bkRRYzNFMWFGRVVtMFF5amdZQndxNnNta1Q1aS9O?=
 =?utf-8?B?aE5Tc0tJdHFEN2hjNnRucjhZeFhDbEozc1lkUUM2ZUh6ZG5IZmgvUXVTMkRr?=
 =?utf-8?B?SDZTZXMzU1EyR2Ixd2o0clVLczU5Q0FvbjgrSWtEdFpMTTloTVQzNUhpSHRY?=
 =?utf-8?B?eUF1UGtYRFVETGduNFUzdDltMFZGL0d4dG1kYXRPNndCR0tWS2FWcitUcURm?=
 =?utf-8?B?cXhSVk9yNDlXbHFnbzBJTW9LcHhKVXhPN3g4elV2VVRWQkt2QU5sTXNLaW1r?=
 =?utf-8?B?MG00S1R3YTZmK2RkOVoyeHMxRHdwZEFvZW5sWTltZDhtbFYzNzBLUVV6NGN6?=
 =?utf-8?B?N21CVmJYUjI0MUJhd2hTQlVHVGRGQ0c4V0ZNelVIRldGRkNpOVhlLzFwUktl?=
 =?utf-8?B?YnhPeXJaRWV1eVJTZis3MzYvKzdjNDIvVzZkK3RJeFpqdlUyVitiZkprL2Ni?=
 =?utf-8?B?czcvV080cmtYUVRBYVZndlRLVENYbFpnOEhQWS9GRmlrQVA3ZG91ODVPa3Uv?=
 =?utf-8?B?SVJYSTRaLzdLdDhzRXZJLzNpbnBJaG9ibTM4Qkdma25ZMHFYVmJpSzZIVUJF?=
 =?utf-8?Q?wOYNM2t7tHH2UV3cfbDCwLmN5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9117f9ae-e3c6-40e5-dd1c-08dbb562e5dd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 20:40:57.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9mcZXEU+NKQE1vQV5NwTUjtVnVoBWxtt9oPueGZzK6SixPoMFCcET/jxN6NooXNXDv36HKKRX2QJU0neiIERA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-14 13:53, Hamza Mahfooz wrote:
> On eDP we can receive invalid modes from dm_update_crtc_state() for
> entirely new streams for which drm_mode_set_crtcinfo() shouldn't be
> called on. So, instead of calling drm_mode_set_crtcinfo() from within
> create_stream_for_sink() we can instead call it from
> amdgpu_dm_connector_mode_valid(). Since, we are guaranteed to only call
> drm_mode_set_crtcinfo() for valid modes from that function (invalid
> modes are rejected by that callback) and that is the only user
> of create_validate_stream_for_sink() that we need to call
> drm_mode_set_crtcinfo() for (as before commit cb841d27b876
> ("drm/amd/display: Always pass connector_state to stream validation"),
> that is the only place where create_validate_stream_for_sink()'s
> dm_state was NULL).
> 

I don't seem to see how a NULL dm_state in
create_validate_stream_for_sink() (or create_stream_for_sink() for that
matter) has an impact on the drm_mode_set_crtcinfo() call. That one depends
on !old_stream and &mode.

It does look like &mode is an empty mode if we can't find a preferred_mode,
though. Not sure if that can cause an issue.

Harry

> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2693
> Fixes: cb841d27b876 ("drm/amd/display: Always pass connector_state to stream validation")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 933c9b5d5252..beef4fef7338 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6128,8 +6128,6 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>  
>  	if (recalculate_timing)
>  		drm_mode_set_crtcinfo(&saved_mode, 0);
> -	else if (!old_stream)
> -		drm_mode_set_crtcinfo(&mode, 0);
>  
>  	/*
>  	 * If scaling is enabled and refresh rate didn't change
> @@ -6691,6 +6689,8 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
>  		goto fail;
>  	}
>  
> +	drm_mode_set_crtcinfo(mode, 0);
> +
>  	stream = create_validate_stream_for_sink(aconnector, mode,
>  						 to_dm_connector_state(connector->state),
>  						 NULL);

