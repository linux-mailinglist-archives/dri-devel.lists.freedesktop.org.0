Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3C73CAC8E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 21:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A986E8AE;
	Thu, 15 Jul 2021 19:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480726E8AE;
 Thu, 15 Jul 2021 19:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeS6ZslvTRCQnW20UhBD8QYZdMiTeBFP2Vs5RCmsoXtjNJu13kQRUrCwxfjTzYzL28vzq53RIjg5JIatdXx619A2XMLVsq5jD9H8B/HXuh8LA9LKqPWu4dbLzI7JcY6GTkhuPBVeEmEzi+Q2z++ffCBQrWcjo28O+o+uV0xCseouaQEqQcY9DLKX+jfkh8DutC63MHTLwByXHySNM5DIzeagIKN0uN0uYGVcpXiQFh+qFjQddLsVHGYJp8YlJHVUTwLLuMlyDjfvfxqxS4tkadyqFRT5jgsWxm/hsTcu1NT+zDKeb0iHxBakzL72FxBZKiBC5yo+/sgQ4VuixnnJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x66VtHXq5j23GdI5KF1s79wRXt6F/MzX0iT4Lrr3FPo=;
 b=U4Vj0Kkh/Dcqx/SHP9i/UWAWk4gG44OY1KgMPCbLAJO1aY5s1PXsb9oQSwAjiEZjffzVnz3mADkipLoxBj2VeG8yOjBKn64ZElKs2iy6yUHtTClcen5VpnU5h8dnsZHDEZU9dmMYpm88DJfiC1kc1OuBMBhO20XnoQ2pPLbrXClLhOa4EEQIBn5tVFv0pYGFkWjaEBFXrOsACidObEidh384ddw1+MKLK+QYSSKob3qvj9VFTWbei48J1FnIWpuc4ylEEXKltfqdBRto6YlcGWLaANejsum/EPUF1HfDarUVKV7PbINsISY8ExWK2YR36WHBgdqTqmNuoeai7iN6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x66VtHXq5j23GdI5KF1s79wRXt6F/MzX0iT4Lrr3FPo=;
 b=4w75TlqLvFiUj7+/WygfCPsvx0QlUXqvjqZd8iCWe5iUv4+XCajgdTSKOpz5LEsjPmcD8XRNaFmd4i+qRMhf04CSqvIfDacwmnia+R2OL3oyeiLcic4dWjfm1y49eTTx34w2l6MnIzQlr51kX6I8XAynfgEb06g+hoZTWbeckfU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5409.namprd12.prod.outlook.com (2603:10b6:5:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 15 Jul
 2021 19:40:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19%5]) with mapi id 15.20.4331.023; Thu, 15 Jul 2021
 19:40:31 +0000
Subject: Re: [PATCH] drm/amd/display: Fix 10bit 4K display on CIK GPUs
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20210714080652.113381-1-liviu@dudau.co.uk>
 <CADnq5_OA-em2jM-vmwaM7xxycOS-18EPC0r_myb7REy9b4h_vA@mail.gmail.com>
 <CAEsyxyhurQ2vm=xwaRMqT8z+PJ2R60hYXt6kL8HnaB4zwbee3Q@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <ea5363b5-a54e-383d-f5bd-214bb8b50c96@amd.com>
Date: Thu, 15 Jul 2021 15:40:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAEsyxyhurQ2vm=xwaRMqT8z+PJ2R60hYXt6kL8HnaB4zwbee3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::46) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:15::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 19:40:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9361e33-4395-4623-63f5-08d947c86813
X-MS-TrafficTypeDiagnostic: CO6PR12MB5409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54094BED7442446BDA74F3208C129@CO6PR12MB5409.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kd6CotyhToScYnzEr66P6SHEL64S4MHdLcI4ohChIzyEuutXzNn3eCYZPrlqFHpP9z25fo3pXm2jGwSaOfdfTStCLnmtLSr4T5SjwLwv8KsXWC3Dbk6Y544DilnT9/7bm1ZPKSIHbnGV0XFCfNXSzf1C1RMsNhUWiQAbO0V+Tl+5QRQroT6DQbV9Wkj3n7eXeD5wKmoDweQ4dZshEYYCClc//tLkyRueacu0zR8gyOt4T7ZmXvywfEjfyAHXZs3Tl+t8uiDMn3ugkWWs63egGEXQp/q6UIDF8fPAVWUAbRazh4XaBMw6D8vCcLzvXog9nAuHkdG1ebBbn6eoAZssDeUf/VeVmaGgm0G6cGo0pVEai5IniZCl6ggAofadC7Im5iUj5+CptKtOEZKiV50KAqqtmcUdpV7gZKsozis/nGyW0U/O9Nq3a6i5UjEdFBaJkdGwkHPv6ApOLAzJxKAW2y0rKxlyZNMhh5iUzpJTMLjRouOyasxo/QVwjV+hoztVEVrbYPTG69bLb64JW7iscmn14a6FzAW2MgW50MUgnwkjrh64zyTkezb+45vTyI2wjFtKhlazOdxuuuyNBNsspBelVS3nUXGDwQFHm94eQogvHhhyjVEfh+WFcHlD4hSrn70iYal1g87xaAxfrN13bvlustozYtoVYJ/tGNMMXCSz33L7RphH1YglNlGYa5ZbPxgjqSosKEfA1VUd+7mIwm8IYYqe+ccOX1RI/gfiLReNE3mj7I9rlpP07DyLPeL4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(26005)(2906002)(186003)(8936002)(66556008)(66946007)(6666004)(8676002)(83380400001)(6486002)(4326008)(66476007)(53546011)(54906003)(86362001)(316002)(5660300002)(110136005)(966005)(31686004)(36756003)(31696002)(44832011)(16576012)(2616005)(38100700002)(956004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDZKNWYvQ2ZMWjVXMTMwYVArc0huTXlXaitqYXVkOGlJL2V6VnNDcTBON3NY?=
 =?utf-8?B?aUNPVkpuMWtyMzBNWlNmZWxiSDhmY01Ud1hFMzkxMUVvVVgzZlBBS0l4UVBj?=
 =?utf-8?B?VGhreEg0TUxDL1JTeEFyWnlhS3pwbHpOVDRCWWFlaVhjY2ZmdjQxdXFiSGpk?=
 =?utf-8?B?dG55WVV0djd2RGU4S0pUbnJhYU9ROGYxazZjWmZCcVl1dU5QSWpveExvanN2?=
 =?utf-8?B?VFdSMGQ0WWVKcHVNMGtnbDJsZ1FabTlOMWpRN1A2TFdyZ3N4dXhXUlJPTWZS?=
 =?utf-8?B?eEl3Y2oxUjF4ZVYvaDc5V3hNVzNVZFhVVk1wSENxTW10YjNZelV3L1ZUVkZl?=
 =?utf-8?B?cFA4UGtydENnTGpuRVFxanVLcFRvOWV5MC9kdGN2ekFJTTd6akJFbEo5Uk11?=
 =?utf-8?B?YVIza29FZEhlWk52Vk80d3NTczU1eVVKK2IyTU9lOXkvSnYyWEM3SXk3NExD?=
 =?utf-8?B?MXppU3BmdisrRFJjaHJhUm5NQVRaNldQdGJDYWl4MTM5TGZmRzVjVVMyWXRt?=
 =?utf-8?B?Q20yY0RsZk9kbFNFWVVxYk5VZUZDTWRTVUZrN1JqZm91RTY4bWFIL0FDdnRE?=
 =?utf-8?B?eGpZSis4dER4SkRDQnV1YmJLOFlCQ0JxZStFTkEyNUJhUkljZGI4YkIzemlv?=
 =?utf-8?B?U05waURhRkNUN3pvNlVRSFNKcnkvUUc0NTRHNHBHUE5qWHRydjE5dmx0Y1Fk?=
 =?utf-8?B?REtHb3NFdEhrQXRCZ01kRk1ZUzJ4RG1DSTVmSldJckJuQS9vNWRZd2hCenQ5?=
 =?utf-8?B?N1o3dEJSMmFnRThLTHBKNS9aNEZId1Bic3hyTXlqWnRNWkFjYllaNTJGeTh3?=
 =?utf-8?B?YUgvWWJPRldEZ1lUS01OUmwxOWpEUStSRVpvNFVidFpuNElYLzFBeVVncVAv?=
 =?utf-8?B?czY2Ujh3dG9uT0F1QXh1QnlLbG1CcEJ6dHd1STUwWVJheUFweVRYdG5kRkZt?=
 =?utf-8?B?Q2ttQUNzeGMyWjVyWXNYTGZsSXNWTlJTbXFsSktyMmx5dmhnM28zeit2WkMw?=
 =?utf-8?B?T2ZBU2lNdzlSejY1c1ZDcTdLWENScStDQ0dnSnE5TFBMNTZMNU16K3Z0T1ND?=
 =?utf-8?B?YWFLWkRVdjh3MnRDemVwWEpDRGpNSVZzUUg0SHJWT2xnOW1EMmsyUGpRSlRh?=
 =?utf-8?B?MjJWVnB6cml6SUdNTnpxOUJQVitEMGxOQnhQUG8wV1FxOGNJb0ExT1V0V0ZM?=
 =?utf-8?B?L2oxUXI4eVhuOFkxWjNxSG5ramFzL3d3UFRMUEl0V1lQWDZ1RlRiTDVZd0l6?=
 =?utf-8?B?S1hMSmVJQkFOZmtvMFhmdXhOUkwrbTZQQUxpbi9TU3RaclJhOTY0UEt2SS9a?=
 =?utf-8?B?NS9mTmpDc2hDRHFKVCtjdkdacElyZFllcnBMTkVRVDkrbzRFMXlRZExKMXZj?=
 =?utf-8?B?Y1gxZzNxN1hVU3YwcFVwZ0h4STNpWDFBWlJOUThZYUdWSlI4eVRaby9kWXVT?=
 =?utf-8?B?R1ZzcjdQUnh5dW94Mm5vdjVwSFFuUzJlSUJSV09ra01kSTVZN1JnMkxMVTho?=
 =?utf-8?B?WFB1L2VqeHRMSEpkamFVNXNjZk0yMjBrZ3R1S2lkNnZ0Vnd4WlduSC9oWjdD?=
 =?utf-8?B?WUdUOUNlMXljYThLdXd4TVdGS2Z3S2RWT3dSdU5kUEFUTWlReUUyWVJOV3B2?=
 =?utf-8?B?NkdadjVYRmtIcXZ3RDVVWXdXN2hUN0t1V3VMOS91eDVKcFRFQnZIdnpkaUFR?=
 =?utf-8?B?R0lWTVRTOHBRckRSTzZMSDgvYUtOc2d6bFhzUDFTSk9teHgwdlhha2hHNzhw?=
 =?utf-8?Q?pZNUK2S+2CDUJgtQqwlJqcaPdis+Dt5qFB8Cr+l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9361e33-4395-4623-63f5-08d947c86813
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 19:40:31.6052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bkmJMxZRFKBzwdn+LBnZz/C7APmwdEXPYOCQpBYUlZsxaDKwN5VbT61ADixtp2lMCJA98kh5M9kl9ok1zR9+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5409
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-07-15 3:19 p.m., Mario Kleiner wrote:
> On Thu, Jul 15, 2021 at 6:10 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> On Wed, Jul 14, 2021 at 4:15 AM Liviu Dudau <liviu@dudau.co.uk> wrote:
>>>
>>> Commit 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at
>>> 30bpp for DCE-11.0.") doesn't seems to have fixed 10bit 4K rendering over
>>> DisplayPort for CIK GPUs. On my machine with a HAWAII GPU I get a broken
>>> image that looks like it has an effective resolution of 1920x1080 but
>>> scaled up in an irregular way. Reverting the commit or applying this
>>> patch fixes the problem on v5.14-rc1.
>>>
>>> Fixes: 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at 30bpp for DCE-11.0.")
>>> Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
>>
>> Harry or Mario any ideas?  Maybe we need finer grained DCE version
>> checking?  I don't remember all of the caveats of this stuff.  DCE11
>> and older is getting to be pretty old at this point.  I can just apply
>> this if you don't have any insights.
>>
>> Alex
>>
> 
> Hi Alex
> 
> I'd be fine with applying this. As my original commit says, photometer
> measurements showed that increasing the line buffer depth was only
> needed for my DCN-1 RavenRidge, not for my DCE-11.2 Polaris11 or a
> DCE-8.3 cik, so this should probably not cause harm to the increased
> precision modes.
> 
> Note that given the hardware and USB-C/DP-HDMI adapters i have, I only
> tested this on a 2560x1440@144 Hz DP monitor with DCN-1, DCE-11.2, and
> a 2560x1440@100 Hz HDMI monitor iirc with DCN-1, DCE-8.3, and i think
> on a 2880x1800@60 Hz MBP Retina eDP panel with DCE-11.2. These are the
> highest resolution/framerate monitors I have atm.I don't have access
> to any 4k monitors, so maybe the problem is somehow specific to such
> high resolutions? Maybe somewhere else in the code something would
> need to be adapted? Lacking actual hw docs, my coding here is by
> pattern matching against existing DC code, guessing and testing on my
> limited hw samples.
> 
> Acked-by: Mario Kleiner <mario.kleiner.de@gmail.com>

Makes sense.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> 
> -mario
> 
>>> ---
>>>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
>>> index a6a67244a322e..1596f6b7fed7c 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
>>> @@ -1062,7 +1062,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
>>>          * so use only 30 bpp on DCE_VERSION_11_0. Testing with DCE 11.2 and 8.3
>>>          * did not show such problems, so this seems to be the exception.
>>>          */
>>> -       if (plane_state->ctx->dce_version != DCE_VERSION_11_0)
>>> +       if (plane_state->ctx->dce_version > DCE_VERSION_11_0)
>>>                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
>>>         else
>>>                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
>>> --
>>> 2.32.0
>>>
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx>
