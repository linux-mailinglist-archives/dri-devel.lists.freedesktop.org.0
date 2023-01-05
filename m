Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7765F5F0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 22:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0388910E29F;
	Thu,  5 Jan 2023 21:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B8610E0B9;
 Thu,  5 Jan 2023 21:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhqynrg4zhKSVIjrciO4mabHdvtUsGbyWB4ZAfrkomTfaOn3bI2AvDZDeNjd6kF+WAfpgfb5LoLwS6lShz2qOG0oaI+4+k9/h668bi3AruMWiKSsrhC38qkwNAcdTpWQGJuiTPnkMs3BuKDDZ57HhAevwGkXnoFcOe8CCLH0c8StIcyGkp92taE3r4AAZAi7+1QXSWKQIjlX3xdDU3TTn3PlXHbA+7RUQ7uKgPC51U/dQkR0EDlIUS482KwxStdZHNlEI9Bme4Rvi0BzciJvVs27QFfy7Vij6t5M8qKMRLQgS8vZ96pa6cIfxV/A/cPxzPz30OD/RyxJWag/NsmQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raLBF4dr7K0nAgjKU/y0oSclEEt2UWZ6bbJxQdHQ9d4=;
 b=Wf1/5qBZD8xVHamKOyIuYBsJwcLqYJIL3ZfzOOHkDWPANjFnc1RvfxuEuSn/lfEaEv/8IdplKuUhg/M9HOkXeEMjC34GgYW9DOpRhj0ji5uBPp0V0SRFEn6VOaRrUK2hyIoid3ut1pAD6uaHrmAN6/a9WQWfvfZH9FFtbGGifDZxoibAOgDTcpBUTZeGzGoyuTOF7aOatCQNjxUw20r2dwqtwTaQMJdhm8q5Pj2ctd/wAcJAuP+qthRK4VBG6EkMDMrgjU12yb/jmw6VSlByDYLNsFS4xjCRo6IBKz6YEHWRYUqQTXzKo0qQCKk+F/s6T5yY2lzE8wRAXqnI4qgERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raLBF4dr7K0nAgjKU/y0oSclEEt2UWZ6bbJxQdHQ9d4=;
 b=haqWRdTkSe+NOz0ULPmOhYL3o0IszP/hlUuq2/yNGLM2gYNYRG2hZiTX1hOiEW9EyqEYTdihohVIyoQXLpAsYkc60TWvDUbWwObrw2apd/Zf71ypEDOxezT9Yivrg1onKjGm190cfmMSQQ/5gOl09D95ukbl0yeCfvHnjKW5kNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA0PR12MB4509.namprd12.prod.outlook.com (2603:10b6:806:9e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 21:40:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 21:40:10 +0000
Message-ID: <88110320-6ff8-5287-0474-60afedd70996@amd.com>
Date: Thu, 5 Jan 2023 16:40:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/amd/display: fix PSR-SU/DSC interoperability
 support
Content-Language: en-US
To: Leo Li <sunpeng.li@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20230105173809.289367-1-hamza.mahfooz@amd.com>
 <161a2a64-6bdc-c896-1e3f-56da76f03b21@amd.com>
 <7f7177c3-c6e1-81b8-2599-0d24245b416d@amd.com>
 <f320ae29-5dbe-cfd8-0a05-de2e841d231c@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f320ae29-5dbe-cfd8-0a05-de2e841d231c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA0PR12MB4509:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf3567f-61c0-4db3-3360-08daef656b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IKBQgTLqSYedt1x/N4mCg7htwNGfpbhHe9HMZA4pW/NB+1yj95/sgbuif5gefNt4c5VzzCKbqH9biBQZAKEq1ILqCti/p2koMSNKf9e0mCarDF8angFlpq97bhzopLVkDky3AJVP3LjPocRLyMX/+O+0fO6+pzSPnAUphDOR1vsXuvGMEg04S8FMcEDbe1Qq7xr1mj5lLEaBDl2YIPaLf5+8PoHtWuz+zOv8hDeEdr3AP3+xOhBv3rP1lfRibU5C/rO4pavhsdAg65dO01zDyMSNjlwT4RTrn2ZrMTCGiJoRUEjeSN0FzvyjVaosZjQW8F493HdAvQds/WbQnPepVcfXxAVCXELKgasrwv5LBkhZM6+9LdF7Gwq7heZ82wed1KN73YoTHaVfSVkQ58fcqKnJw7GCNk4pFju6ltK1lwUQh0IRFY+2bRe8rz1SzIijtKwopSBR2SGRvGjk9UmLzbYCRp9rFkhHxm6zyHiYYUIld5dM1mzfpqxX94xYRQs874BO62BpkL/QNrXau1ZxVQ1UuJXGA9vTYTTijtt58jOcJCsRwlJOMz1G2r5YKJztsB2/EJak3u5vsqYPQB07SXl8r5QvqHvtZ/TAuntLD+6hblCAIJCyGyKHVUDU9tVjpL9HwNLNh4AUlcstG7aezUFw5MQtr2Nmq0SEOMXIL1vdOcbNStRGB6w8XcEdreXj0cIbCAzwfgoH8QrQfa4B9DTGbhHNd+MTHppG89+8qSzyo/N7lNvzMBT6geq6N8HPIg2YFoPU9X/Voe76nZQPfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(316002)(186003)(6486002)(26005)(2616005)(6512007)(478600001)(86362001)(6506007)(54906003)(53546011)(36756003)(31696002)(110136005)(41300700001)(6666004)(2906002)(8936002)(83380400001)(44832011)(66556008)(8676002)(66476007)(4326008)(31686004)(5660300002)(66946007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZFK29NOHNZUTJJRTAyUHZsU0lkSDRLcDM2UVgyRmI1QWhzLzVFQjB4RkFW?=
 =?utf-8?B?Tlc1UktQeG84T040S0YrRGdCd1RXS0VvZk0zYXlPWGpwZHR6WjBwczBaeVRB?=
 =?utf-8?B?eHFUdnYzLzNmS2hINUVlR1VhVVJrTTBLMUMwV1BXTStlT1FnTHR0L3krblgv?=
 =?utf-8?B?TVljOGxGNWxRL0tNWm5UYStxSkY1UHRPUitiOWsrVm1hRGRmckxDc3E5VUc0?=
 =?utf-8?B?L0hNVkVGSlJPTUVRU2dQUHNuOXEreHlsUXVocmZ6YU9BRzBoZTNUblFXaHZT?=
 =?utf-8?B?M3NVN1pGdmJZdFdxOHV5YWZKTWZSRTY2QlRlelF2WjVpdUJTbnNMejd3WStt?=
 =?utf-8?B?QXIwUElkc0djTmFhaE5uM2xqRVFBR3RJUEZaWVBUNDYzWDNTTTVNUlFWR1Y3?=
 =?utf-8?B?dWVacGR0TEpUMlIvb0ZkSVdJbnVqbUp1b2E5Qk5HUXZqc2RXNWFPUWZFR0FJ?=
 =?utf-8?B?eDlmaFVHc3BUaFZiS20xcGRoMCtYTzA5N2J4aVNRMTFqYmxRbUJQNkNHcFVD?=
 =?utf-8?B?emhaZXlVTHh0Y2xxNnpPVTJsVW10MURSdGI2TGhJMUlNdEhnWlQ2ZU8rdFRs?=
 =?utf-8?B?UXliWlZWRXBJN0wrSnlGSXpDVlFtaEVnZzRCc2xHemRjTTNzdTI4TFRhci92?=
 =?utf-8?B?YVE0M0c3ekJEVktBZXp2RzdWd0FxY0FGME1kdFE3QkVxKzVYRG90dlNUTlgw?=
 =?utf-8?B?TzJhTU1ObzNwOWJHd1BCclh2eWQ2cDR2YWF3UkVRbTEwNS9ZRitHdU9obFlN?=
 =?utf-8?B?TTR2ek9IZVRqTnBBUjIwZXBPL3JrcytwNXV5Tjk5WnZHWjNrWFJVR2JuMC9L?=
 =?utf-8?B?QTAwL2ZYQjI5czZ6Q00rRy9UQmNpcVM0ZDNhK1R1SGpQM2dXMGhBZW0zVnEx?=
 =?utf-8?B?SWpMMHFGMzhoZCt2NU9RV1dQemRzcEdQVms0QzUvMEtHMEZvRjN2bWlEUk8r?=
 =?utf-8?B?YUVkeVIvRGxPKzRzdlZIRFNnMGdaUWR2TEM0dHRkZGs2ejE1NTFadURNVDNO?=
 =?utf-8?B?T1c1ZjUxT3pXUUNjQ2NRMHg1d2RTRW9kcWMxVFhiRjEzelNSM05BTHZlaXBj?=
 =?utf-8?B?eVZRVG1jU2pTNUVpREV4bUpvNmNOM3ZTK3FxUysvd0E0eDhsQXpCOHlBZUNi?=
 =?utf-8?B?ZXI0SHNaT0txMUxUb1k1SWR2OEtYTEJYS2pxZnF4K0d1RWRxNnhZcVNoT1hK?=
 =?utf-8?B?cFJzZjA1RUJBVFp2bmZBOEduVlg0OGZwaGFicnBwdldzckFKcklxQ1lSVkt6?=
 =?utf-8?B?bS9JcGdvcUJ3anJnVzIxWjZBV0dOWmhCaU56WjEzaUJmNnNOclFadEhabTlL?=
 =?utf-8?B?MkQ0WlV5R0lCMXljOGZYb3BmSUFraDJRaW1jVWEyVFJIdk9uRmN0dm5QRUIz?=
 =?utf-8?B?TVB1dDh2dVRvMFFWeDlmT2JuaXAwRy9ycmxDL2V2RHJwcGs1ekh6b0l0eUp0?=
 =?utf-8?B?ZndScEk2bFVUSVAyREp6ZjRzejhRb1RLOGRRc2xyVVdWRmFRUU1leWpZQ3VK?=
 =?utf-8?B?K2lZZWVyZ2lzalR2aEJwVUZDY0JuMThPNzJNUWhOdmJzbkFmeXhNdTN6eVBw?=
 =?utf-8?B?Mk4zanNtQU5rSk1SR3JJWkZEK0Z2Z0hrWFhJblFVNTdNRWlMTEZ6bXZGanBT?=
 =?utf-8?B?VUhFUmo4UVd5ODB4YXpPMGdrN0hMYlVkZ00ybURHZ01kdUcrc3NIWTBUTGJN?=
 =?utf-8?B?S3EzMkVpNVJMQnNibEJBcEdBVjFISk4zQ0RuaGRweVd3SFdUa0JlSEI5L2xu?=
 =?utf-8?B?eGNhNmYzajlXQ0hoYUFEWHdheUhXNTYzcXptTkRaOWQ2RzBHU1JxZWhxVDE0?=
 =?utf-8?B?cmhweVJFZlBQZUFkcEU1ZGx5UHlkTzNWanZJQUxOcEk3VGEwbFo3aXB4ZGdO?=
 =?utf-8?B?Y3Azck9aeHloTElER3hncFhOOXhXWEU1TlFNRkovRlRTWHRBelVEdEwwWDAx?=
 =?utf-8?B?dXJnSHRVYXhnU2drRGczWHVud0pBVXZXRFU3V2ZBRUJYVUhZUDlienhvSWYx?=
 =?utf-8?B?clkrTzIwTEgvWDFJR0NlUXYrMW4zMkJnNk90K1dqdG5WbFhqUFQxVU1ua0x2?=
 =?utf-8?B?bld0MGVGK3YrMG9ReFNRNnlueVJQTHBzclFJVDhKRzZpQ0FWb2RkUlZXTThr?=
 =?utf-8?Q?8AT8RiFBgh7JCrTaqgarsQeoN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf3567f-61c0-4db3-3360-08daef656b76
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 21:40:10.2177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWQj2MBC6IuDqHsnoE+pHg7LtdP1E4R9SYuh72MUrap7PnGoCG5oC4/QB6a+z8BKZJMbeX/CLcTnZX8kZOCknQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4509
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
Cc: Brian Chang <Brian.Chang@amd.com>, Robin Chen <po-tchen@amd.com>,
 David Zhang <dingchen.zhang@amd.com>, Alex Hung <alex.hung@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Camille Cho <Camille.Cho@amd.com>, Shirish S <shirish.s@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/23 15:12, Leo Li wrote:
> 
> 
> 
> On 1/5/23 15:07, Hamza Mahfooz wrote:
>> On 1/5/23 13:29, Harry Wentland wrote:
>>>
>>>
>>> On 1/5/23 12:38, Hamza Mahfooz wrote:
>>>> Currently, there are issues with enabling PSR-SU + DSC. This stems from
>>>> the fact that DSC imposes a slice height on transmitted video data and
>>>> we are not conforming to that slice height in PSR-SU regions. So, pass
>>>> slice_height into su_y_granularity to feed the DSC slice height into
>>>> PSR-SU code.
>>>>
>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>> ---
>>>> v2: move code to modules/power.
>>>> ---
>>>>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
>>>>   .../amd/display/modules/power/power_helpers.c | 35 +++++++++++++++++++
>>>>   .../amd/display/modules/power/power_helpers.h |  3 ++
>>>>   3 files changed, 41 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>>>> index 26291db0a3cf..872d06fe1436 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>>>> @@ -122,6 +122,9 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
>>>>           psr_config.allow_multi_disp_optimizations =
>>>>               (amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
>>>> +        if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
>>>> +            return false;
>>>> +
>>>>           ret = dc_link_setup_psr(link, stream, &psr_config, &psr_context);
>>>>       }
>>>> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>>>> index 9b5d9b2c9a6a..4d27ad9f7370 100644
>>>> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>>>> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>>>> @@ -916,3 +916,38 @@ bool mod_power_only_edp(const struct dc_state *context, const struct dc_stream_s
>>>>   {
>>>>       return context && context->stream_count == 1 && dc_is_embedded_signal(stream->signal);
>>>>   }
>>>> +
>>>> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
>>>> +                  struct dc_stream_state *stream,
>>>> +                  struct psr_config *config)
>>>> +{
>>>> +    uint16_t pic_height;
>>>> +    uint8_t slice_height;
>>>> +
>>>> +    if (!dc->caps.edp_dsc_support ||
>>>> +        link->panel_config.dsc.disable_dsc_edp ||
>>>> +        !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
>>>> +        !stream->timing.dsc_cfg.num_slices_v)
>>>
>>> I'm not sure this condition is correct. We can have DSC but not eDP DSC
>>> support.
>>>
>>
>> AFAIK PSR-SU displays use eDP exclusively, so we shouldn't have to worry about this case.
> 
> Right, the dc_link here should only be eDP. I suppose that isn't quite
> clear.
>

Right, I was thinking of DSC but PSR-SU is eDP only.

Harry
 
> Maybe add this as part of the condition?
> 
> if (!(link->connector_signal & SIGNAL_TYPE_EDP))
>     return true;
> 
> Thanks,
> Leo
> 
>>
>>>> +        return true;
>>>> +
>>>> +    pic_height = stream->timing.v_addressable +
>>>> +        stream->timing.v_border_top + stream->timing.v_border_bottom;
>>>> +    slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
>>>> +
>>>> +    if (slice_height) {
>>>> +        if (config->su_y_granularity &&
>>>> +            (slice_height % config->su_y_granularity)) {
>>>> +            WARN(1,
>>>
>>> We don't use WARN in display/dc or display/modules. DC_LOG_WARNING
>>> might be better, or log it in the caller.
>>>
>>> Harry
>>>
>>>> +                 "%s: dsc: %d, slice_height: %d, num_slices_v: %d\n",
>>>> +                 __func__,
>>>> +                 stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported,
>>>> +                 slice_height,
>>>> +                 stream->timing.dsc_cfg.num_slices_v);
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        config->su_y_granularity = slice_height;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>>>> index 316452e9dbc9..bb16b37b83da 100644
>>>> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>>>> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>>>> @@ -59,4 +59,7 @@ void mod_power_calc_psr_configs(struct psr_config *psr_config,
>>>>           const struct dc_stream_state *stream);
>>>>   bool mod_power_only_edp(const struct dc_state *context,
>>>>           const struct dc_stream_state *stream);
>>>> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
>>>> +                  struct dc_stream_state *stream,
>>>> +                  struct psr_config *config);
>>>>   #endif /* MODULES_POWER_POWER_HELPERS_H_ */
>>>
>>

