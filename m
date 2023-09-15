Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AD7A255C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A5610E660;
	Fri, 15 Sep 2023 18:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC2610E660;
 Fri, 15 Sep 2023 18:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1v13VKAPc+Txzxgo2Hv1PvRH9yGFCXkEj6yeAb93b9X010o5/k5OKuPJ5Ap9wHAcTl8Na56IrJFgnwqC6wyFTMsuG93U8u+YGn2r9eGnvEmVF10EYXPEHa5qGR/vuiFxw+wta3dyKiLpZ5h3yHJhvFLPn/iEiH4IHamy+8cbiFmdGJYCFxWW6ZtJuMeT7qW2y6FiNhEuziOzwt+PXCkJjLmF9Zeet3snZPiW+3UKRK26RUbZ516wE76bVMYVR4J0Zs6TpkNm8qScAevdu5KbPcu63JMRimWnZHdp+ZQc8RlJBZWGJDT3/ezZq7shRBhlIyjvRYuiIe1+zMKiHPSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7GKTeesLukhp0emuGe/ao4XZWmhl0e24sIAHlaCGlE=;
 b=HTMGJBPLo3bJI5zuocp73jrZ59dBfuczKfLmjamwYFf7vQhr9KmIVeYsj6Hpn/PzqLwMRH6lP3K0wbtOSW/cECphXnHp9zrjyPjTOBUzYydkbB6qjamHupyZ3q9It6MtujmTZJ9c/U4u5VRg+J8t8LStGf7IBg+3dTV9xuHKkBPZSQgeoPl2m22vx/Mnprmm2xUrj3JG7WtOIJGOGWume0tiWTfz45JH2Wx+JxK+e5trOQ9OMadrXtTe3hgvN+ePZRZ2dMYfE29YA9SZ0683ctwis4JJkGmf3EqnCnneXoNlF8HM3qwiW7n9dXx/GJbQHPkultMTNLug9o0EulKwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7GKTeesLukhp0emuGe/ao4XZWmhl0e24sIAHlaCGlE=;
 b=OYILhAv9tCPqSeJYdIdNWMesx16uGM5z6zwwwlsazTyQP0x9X0AIhIUt+8IPspzl99BlpCyffqg0s2kveNMS05cYR5LidqN2p53FtavadcvVatxdaThviXYyI5iVR+8hzNO4DWgS2PzMvqqhcpXML2dOZFikshQ1OUNw7K//G9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 15 Sep
 2023 18:10:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 18:10:59 +0000
Message-ID: <5536b749-4db2-467d-875f-410c4a4a0e9c@amd.com>
Date: Fri, 15 Sep 2023 14:10:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix the ability to use lower resolution
 modes on eDP
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230914175354.102709-1-hamza.mahfooz@amd.com>
 <3630bc42-c04c-4c22-99f2-5dc6bd5d8e2f@amd.com>
 <290648a9-4882-4228-bdbd-1045e20b71f7@amd.com>
 <e44d8385-1137-4f41-a3db-9af88ff87bb9@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <e44d8385-1137-4f41-a3db-9af88ff87bb9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0044.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 30002e78-2fa5-42a8-e106-08dbb6171ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGIG+S3aCEsqEpq3okUgv/p97aLWs2boP3xCN9DX8RcHAM+UD47yTX5/tv2/In+/CfaNyBlZQwocpwD5z/NhJCsBoTdVDZ3svXAivH2kTYKsASEEHMNRvszCPIGgOwFQ/zZEHJw+TCmdwnAKMQ4mzq+YILK8HdRXmALkODaofW1qNrrSLa0G/4rTP1pbrHaQSxVj13GAO4Isq2jX/1XO5RHnLjLSFG/R9AscrtfC2IL/c/iSp292+EpUfms38MlXeAhK7B42LE0g9PnGeUAhpyb2UdBRpUt6OHLB5Tuq/NAc+XGf8PhFwDIsli6P12jnYHFXEdotsB5TK0PTwzh1VLCXJzaiGpC+VTjL1c/odESp3TaLT3BJx5VFWupezanMIB2B/tmvQcPDkrUqm+MobRkXztUp2CygAlEQxiFWdS+AvsbhBmG/5BLIX5zZtKLMo5pF2FTRMObuw+UhacJs8lsVWZEieKJbn6PVMdt8Uh4JYUbeEJrYT0YQqtgMfZjTY0CFe1pEM0iLpVTTYlqwnt1l5GAk7ZVOrMbrZqj8AjFI7uDnBkSxEmzb+z0dHMsqYLbjC7TzhFpW3SHNSZxMWutPyv6kLG2VJFwjvHuVLZK/zIe2JxVzdH5WVNasNEoX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199024)(186009)(1800799009)(31686004)(6666004)(6486002)(53546011)(41300700001)(38100700002)(6512007)(6506007)(83380400001)(36756003)(31696002)(66556008)(86362001)(4326008)(478600001)(2906002)(26005)(8936002)(2616005)(966005)(54906003)(5660300002)(44832011)(66476007)(316002)(8676002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnJUTzhRNGRBNDBXanFYY2lzdnYxN3BEUWhOa2VQU0dBZEI0YkRwK0VDeGlw?=
 =?utf-8?B?SzRHeVF2aFRMb1pybzU0WTAzL2FQRUpxUW1McndneWNPT0RZZVBMUEw0OHA0?=
 =?utf-8?B?dmRNcWxrUkhUNjNkaUF2TmFWUlZaVzExeXpCNmZrOHBVWkVuZW4rU0xZc1Vq?=
 =?utf-8?B?dWJxUWRxOGJjZFNEVGtlS1k0UHQ4RThnOHdoVzZKd216R0g5SmN5cnk2QUR0?=
 =?utf-8?B?eVVmOVBQZERydmVBOWd3MU1YaE5YemtxaXBRZWpLSVFlcEd4eCs0L1ZYWXNz?=
 =?utf-8?B?YTdsRWlWQVBkM3Bqa2Z6V05WZnZpQ0lLaGt3dE1NNWFrRzhkeVRTcHVWWDdo?=
 =?utf-8?B?TEJTcFg2cERJdHg4SUlFU3BGeFU1aDhTUnc2TEZObUt0QUJQb05RcGlMemFF?=
 =?utf-8?B?RHhQSnhiQmRGNnlDK3R0YVBOVlhuMDFObW9yZkF4d21tOFFCK2YyUjdTeTVv?=
 =?utf-8?B?YW9GSUlwM3N0RHNLS2hxUzEyOElwNjJ0aGE3am0yUWJXVTBaUG9GcFRVaGdS?=
 =?utf-8?B?bFNmeEZiQkZXUmlGOFlXZmFsQ0lqVDZTaVY2RVNVcmg0Y0pyZ3N3WXM3aE56?=
 =?utf-8?B?V0I1eExlOTFwTnJQaHRUTzhMb3M5NkVTTG81Y0RVT0UwSkhkSDREdkI1bDl2?=
 =?utf-8?B?anMvZWszNUQwOWdHRFpkc2ppS0NRU3lJQllKVUJKclVCNHJ2QXRyWUl3bHJ0?=
 =?utf-8?B?bnZtN1MwZ1piSklMbGkvZ0NmN20xTXRYVi9uc2QxWWdLNzB5WEljSmxjMzEw?=
 =?utf-8?B?djVCTkxSb3FMaFc2Vkoxc3krTWo4YVQvYXh3NzdOVGNGaVRGRldCYjNsNWlO?=
 =?utf-8?B?Ty9ZY2tUTTd1U0dndVQ3dThyYU40b1MxcllkOTVMa0MrZVhlWlUwSmJyRitK?=
 =?utf-8?B?cVpOYkZISW1iUUNJUEJDZGlBRllzSlpsTHVjR2czanMrWWV4ZW0vUXduZmJH?=
 =?utf-8?B?Sis1Y2FxL2dqTlN6dEhINnlYODZQanJGVnRVcXJtUTJHSHp4MGE1bG1MTGZt?=
 =?utf-8?B?enkzNmgzR2hXSzVib09NTTRmTXZNK29JWjI3UXBFVFpxM0d2WStqbUJZcWZJ?=
 =?utf-8?B?SktqTVNxWWUwWEk2Y0YwRVRuZDVndURpSXhqU3NLamV0RUhnWGgxdDY1S0k3?=
 =?utf-8?B?RjdCeUdkeG9ic3ovalljWmxMSXFGcno0dWN1eU9xb3d3K1lCOGd6SUxHcDVC?=
 =?utf-8?B?bkRaL0ZYcnZUS0JNM0NrOTRjNFR1NTNpUHE1TVlrbk42bFBmSU5XRGtpT0xN?=
 =?utf-8?B?VEF5czE0cWJ4bWVpTjRuVzZyWGkrZEI3eFpwSTBQYlJMMkswc1B0VUJYaWY0?=
 =?utf-8?B?MjN3NlR1NE1BNHJWZWlZY2Q5V0pEWG1zVDB4OWNPK0lpQStuT1N5cTE2Yi82?=
 =?utf-8?B?YjB2RnExcmllUnlSQnBEc0I1YjFmYmNEeGo0ZytnTUtRRlc2QmZ2elkxdUx3?=
 =?utf-8?B?S3QvL09BWFZIWlVmY0JYeGdkc3kyZUdYdTdqR2xRTlhYS0lnUi9OeUhTd0hz?=
 =?utf-8?B?VVM4dW9zdVNXVWQ4THUwSWQyM0JzV3p6dFl0dkw2KyswR2hYSGY5ZFNnRDJ2?=
 =?utf-8?B?R2t4a2dadFBYMDlZZzYvMDRxLzk0T085V3h1ZGxoMWdlZHpUYWZDeGJEUWhS?=
 =?utf-8?B?WkFrZ3I3VHE0QkpEcC9WS040WUlMc1p0Y1Bieis1Y1NEVm5kVXh0cko2TnRP?=
 =?utf-8?B?dnVER0lkb2hhSmRqUDhITzYxeW9RUFV1WDExVThuTGhQUlVMQXhoY2FPKys2?=
 =?utf-8?B?OHNqRlRCQlJuVkZBUy84Ym83MlhpOUhLRDZSSjRnZTM4ZldOemswUlc3aS9j?=
 =?utf-8?B?M1hUZ1FYWm9qbHR3QUtqTjB5SE4rcVZoN1FXR0U2MXVmM05SSjZxOUxaL21q?=
 =?utf-8?B?YWhuNDc5UDR0VnJQdjM2U2pkWHZ6SWtnVCtuQmFqVkdhM1hsNjZSVWRGWFNR?=
 =?utf-8?B?eXNuL1ZCNDduNlhmOHI4dk5SdU4ydUc4OS9SQ1hEcjUrdlc4SGlYYzc4Lzc3?=
 =?utf-8?B?eURQd1RBakRYNUxGQ1RiU1VZRlUyMUdyVVdyREVwWmgvVnEwektaTUoyTzZz?=
 =?utf-8?B?WkR3YlRPWEVCVll0SDUzdzVnQndOcmpzdEhzRGhHVlIwaU03UEpxc3pCQUl3?=
 =?utf-8?Q?nVp8/3e4+AwW0E+8IHscEYQ1K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30002e78-2fa5-42a8-e106-08dbb6171ceb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 18:10:59.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /epAu+FJfZkYujyeQSrkuU7GKefU/SMC81+46KUQvLejCrQI+0VHADbUq7q9aDnK7lYeBoVVmTKL+CJ82uqzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778
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



On 2023-09-14 17:12, Hamza Mahfooz wrote:
> 
> On 9/14/23 17:04, Hamza Mahfooz wrote:
>>
>> On 9/14/23 16:40, Harry Wentland wrote:
>>> On 2023-09-14 13:53, Hamza Mahfooz wrote:
>>>> On eDP we can receive invalid modes from dm_update_crtc_state() for
>>>> entirely new streams for which drm_mode_set_crtcinfo() shouldn't be
>>>> called on. So, instead of calling drm_mode_set_crtcinfo() from within
>>>> create_stream_for_sink() we can instead call it from
>>>> amdgpu_dm_connector_mode_valid(). Since, we are guaranteed to only call
>>>> drm_mode_set_crtcinfo() for valid modes from that function (invalid
>>>> modes are rejected by that callback) and that is the only user
>>>> of create_validate_stream_for_sink() that we need to call
>>>> drm_mode_set_crtcinfo() for (as before commit cb841d27b876
>>>> ("drm/amd/display: Always pass connector_state to stream validation"),
>>>> that is the only place where create_validate_stream_for_sink()'s
>>>> dm_state was NULL).
>>>>
>>>
>>> I don't seem to see how a NULL dm_state in
>>> create_validate_stream_for_sink() (or create_stream_for_sink() for that
>>> matter) has an impact on the drm_mode_set_crtcinfo() call. That one depends
>>> on !old_stream and &mode.
>>
>> If we look back to commit 4a2df0d1f28e ("drm/amd/display: Fixed
>> non-native modes not lighting up") it seems like the intent was to only
>> have drm_mode_set_crtcinfo() called for
>> amdgpu_dm_connector_mode_valid(). Since, even if we go that far back
>> create_stream_for_sink()'s dm_state was only NULL when it was called
>> from amdgpu_dm_connector_mode_valid().
>>
>>>
>>> It does look like &mode is an empty mode if we can't find a preferred_mode,
>>> though. Not sure if that can cause an issue.
>>
>> I don't think it should be an issue, since before commit 4a2df0d1f28e
>> ("drm/amd/display: Fixed non-native modes not lighting up") we always
> 
> I meant to refer to commit bd49f19039c1 ("drm/amd/display: Always set
> crtcinfo from create_stream_for_sink") here.
> 
>> called drm_mode_set_crtcinfo() in the aforementioned case (and only for that case).
>>

That's quite the tale of patches upon patches making things slightly
worse until it no longer works right. Thanks for untangling this all
the way back to 2018. It makes sense now.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>>>
>>> Harry
>>>
>>>> Cc: stable@vger.kernel.org
>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2693
>>>> Fixes: cb841d27b876 ("drm/amd/display: Always pass connector_state to stream validation")
>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index 933c9b5d5252..beef4fef7338 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -6128,8 +6128,6 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>>>>       if (recalculate_timing)
>>>>           drm_mode_set_crtcinfo(&saved_mode, 0);
>>>> -    else if (!old_stream)
>>>> -        drm_mode_set_crtcinfo(&mode, 0);
>>>>       /*
>>>>        * If scaling is enabled and refresh rate didn't change
>>>> @@ -6691,6 +6689,8 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
>>>>           goto fail;
>>>>       }
>>>> +    drm_mode_set_crtcinfo(mode, 0);
>>>> +
>>>>       stream = create_validate_stream_for_sink(aconnector, mode,
>>>>                            to_dm_connector_state(connector->state),
>>>>                            NULL);
>>>

