Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3F65F4FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 21:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367410E807;
	Thu,  5 Jan 2023 20:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3E110E804;
 Thu,  5 Jan 2023 20:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjFhjyv4MD9qEk6WWI7+3mNde9bK+07MIzMYqEQoD0haGyb2YsLQCBx0ftdG6GAhsizoqF2L7oJsjqyFRFQzlZwU53wfi418SSLEXHm1Lxclnw3Fw2s440W87GTV1xaUSLqTel+FojGaqAFXPMCax3Ajzib9SfIe8ZJogUXq7pWLlDBmG/xyfbDNiBNYRKIaJGxkruD9LmQmZ8B2oF05eMrQhPQZhvJ8kg4Vb2EPR66cEbX3CCY3KCE+S6BAmRl9bHkkUdwUwNV1t6fPzbv+LED1i60wywXq+j5yeQG2Dk3nVJrTmoqz+Gsup2jRl+iC7Ar0q+g4+e/LLLzjeR25vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWOItcb3dmVc6NCq2rdoyGENtMg45aq/f0p/hu7GDCM=;
 b=dyLKclL8QDWHNaYhg5JNRrKlNFdHeHa5Rh4GP/OaI952K/2cPH++JWWN4lj2QEj/ihYlLqD4X6MmGKqW9wW3yDDvMZMVYnB3aIM/NTDamWKjr7KqKhNpTUzcjnv2mYttJK4E/7siXnA9DcXVCvm15qHd4DEhpVaL3JQKirAAetJ4hwdrkKbiS7nYUJQgvVrV3bkxPNaJTlvU28oGzNDsbwW4d4r7H33ylF4voThKxP0un7c7zizCF9EoH1KTeStnj4YrkFnizlwQMT65qZNfNVHdYL8SENs12hXojX0pCXByEFX4hDk1I6h7c3NTfxLOa9aux/Hl5qrIZaDNkFlwTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWOItcb3dmVc6NCq2rdoyGENtMg45aq/f0p/hu7GDCM=;
 b=StOqLPworpUSO3rozHKkoZ5vu+raerCMSpbIbfauGPuzQVU1qh6EZ0gLF54NkVQVIRA2Gcq5w9mrnAQiYsr/sO+N25TOOeJ/Z6Y6Dzke5bOf+N8+uHZyM4qxsyS2HJUM+DRoTIJP5l+/qkjQ4/CRFFEmMIurA1N3DIWkzL0Zon4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 20:12:04 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d5c:4370:2ece:ea]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d5c:4370:2ece:ea%3]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 20:12:04 +0000
Message-ID: <f320ae29-5dbe-cfd8-0a05-de2e841d231c@amd.com>
Date: Thu, 5 Jan 2023 15:12:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] drm/amd/display: fix PSR-SU/DSC interoperability
 support
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230105173809.289367-1-hamza.mahfooz@amd.com>
 <161a2a64-6bdc-c896-1e3f-56da76f03b21@amd.com>
 <7f7177c3-c6e1-81b8-2599-0d24245b416d@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <7f7177c3-c6e1-81b8-2599-0d24245b416d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1P288CA0025.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e0bf1f-aa6b-4c2b-75eb-08daef591cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWAIZB+NwsFncGdr0/aZI8mLjgYrJVlBWwaroUZZzyc6x9OVQJStg/IXETDPpYw861SR31XJzZUbGc+5DoUfTUxY4FZXP1NszoYId10BuhcBG2cyJ2KA5+sIJg4suzDYE09+yV1csPsd+Kb2EL/cneFNKKvIbWHG7+DkpjW81FvROI3kOrfcAllod2ZW7nXoCp4oub19IrNpcMtE4g2n6OCttedzgoPGB9zwxHThgWY4XKWolInzZvCbOWk7T2V4vKB7d53ogsVnLbtpBglnApZdidnUfBveYYxaCX4uZkwJmbkCjJd2WjuHUGRs5jnraacV7N0ei1JhDrT5FZzkannpG3k8q6/Ju7M2HzL+8KM6nxtqRz1c1/C49BXQLbSMyYbS9JCWmdJKjEmIVvJ2llpSBoch522eUY0V8FgGfcRSrTiDJkGkFVf/OpxR83ws01o1GrgxeXHa8YASGXnMKPFYFmq8VkcxMOvZcx+tsQjBnP5npmU0hR+VI9Vaqc56E4mMmrFGNEsmegxjRnthge/6KPfR6lVrIEdtHRnsKe+OvC+kURs0G0AsIZtqi2EhHV2uQfbUThASJr/4wWyxYe/bS5T+k3a1YUWK4A3O2T5Q4+8eP+KTtaFI92WAIKjkoNfaU0Vfhvsec59KF1d8xhf57up7ihhlOjTdVxPFTAiRMXVYZqSwPJytZu0V5boNIVwwn/wxEbOHXUvrYW4LyENBjuFCJUf7GsqeDKWEwoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(31686004)(36756003)(41300700001)(8936002)(31696002)(86362001)(5660300002)(2906002)(83380400001)(66476007)(6506007)(54906003)(110136005)(6486002)(38100700002)(66556008)(66946007)(316002)(8676002)(6666004)(478600001)(53546011)(26005)(6512007)(2616005)(4326008)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXB1YzNLWVRtaFdLMXVtd1ZPUDFZUW8xOGdUMXlWemhwY3B3UER5bkpBeU81?=
 =?utf-8?B?WWQybDZ2TGZ4eXZ0ZnpKSDdFNEE0KzdFUHFPenJpMG1WN1k5bVVIQkJiNUpO?=
 =?utf-8?B?K0JzdkcxdzRsdHl2NHpMTmIwdEZHenBwYkRWOGtFMHVsc0V5R3NxVHUrNnNz?=
 =?utf-8?B?N24xKzNOWVBNbUlaSHhibGEvZkdZZnlic292MXNxRnAwc0dKMUlRMDV5eXJY?=
 =?utf-8?B?clZpSkg5ZGwxc3JhQ3lKS0pmN2JVOXluQ1NsSzRZUFp0bGRBV3hVTytpcnBy?=
 =?utf-8?B?VWdUMGRFU0V2L1VGd29CajhyWXE3cDZLN0VLakhxNks3NW9qN2ovTGtDQnNC?=
 =?utf-8?B?VHBnNUlmakd2elJWN1cyc2xoeFhnaHplR09yZDdmM0czSk54UzdUWWFlcEdu?=
 =?utf-8?B?R0NWd3MvN2pJSHdLV3J4WnE4Q01zb3FHdTR0TklXQ0xLZGRQZ29kMVh1RkFO?=
 =?utf-8?B?eS9oR2ZBZU1sQTZpL0dNRzFweGY4aEI5WFJtQXVQdTRhajRLS1NPYzBTUHA2?=
 =?utf-8?B?RXI3QVN6aG5zNjBwRzlGWHJRazRJdmhXbldJdElZL2lQNVlWS3pIeHk0SjNm?=
 =?utf-8?B?VDMrc2pvaVBRRFoxc3J6WHN1aGFnejFaNGdMQ09ESUJVWWNVVmcvdk9zYXBw?=
 =?utf-8?B?YWs5Y1FRUTdIOHE2OURtSllrYmxteC9FaFR0dHh2eXg0aThuOE9STkRJL29q?=
 =?utf-8?B?WVY0MUxSL0JwS3lBV3Jna2V5Um5ubTg0ck9GUm50WnRmN3d0WFJzK2Q4Kzgw?=
 =?utf-8?B?bXZBRlNBNU41NU5sbnp0MGdLYllFUWdTU2syVjlHYU5hVVJRU3VldTQvSURT?=
 =?utf-8?B?bndRSlpCb09iOXZyUzhCbDAzMi9kY1IwaFNLVklWc0tja2dOYnhsUmpsczk0?=
 =?utf-8?B?WExVMkpjdzA4NVBTVFdxSDhUYTB0MFZzS1BLM25sRlA1d0Z3YXZ2YWxaWVM5?=
 =?utf-8?B?YzNFaGU5eS9HWnh0L0V5bktYMS9rZ3JydjBkQTlUQllqMU8vblRCV0tqbVov?=
 =?utf-8?B?Z09YZFBFS3VxK09xUmRtSUZVQmpxaGs2bEp3L2tHL3diaGJtNGlYV3NOVVp6?=
 =?utf-8?B?WUJjYXFMbEJKOUpZOU9LcTRMaU9NdGZuS1YzOTlNTEVBRlN5NEI2L0hvRFR0?=
 =?utf-8?B?d21iTXUyOEYwUjFBMlNsakZ5WC8vU29OcWFEWGFBTzZTZm1ZZzdZMFp1bmpR?=
 =?utf-8?B?MjcraU9QMnBnQnI1dFM3aUFCYVhlNENPd3RnSC9aNVlOQ0ZKN0s0ZklubCsv?=
 =?utf-8?B?V0FFYVBHdmhTcjRxMUdud0ZzaFFTb0ZCczEzRFhFcXdaSnc0OG5MV0dTSzNX?=
 =?utf-8?B?M3FaSEZPKzJBcVFWZ2FlVDVqN1hMVFFLM0UwbWJVL2x5WFhxZ21RRnFMQkM3?=
 =?utf-8?B?NDRJeUZPa1QyYkJpM3h5ZVZxZ1VKQUJkUG5hTXR4WUt3Qk5QTERYUHV2YWs3?=
 =?utf-8?B?em5BaWMrKzNoMlFiaDJwT3FBM3NSZVlOc2NQbTVUWXNwUnZwaVYyWFljKzdS?=
 =?utf-8?B?TFY3MFB4ZjBGbnB1MFBLaHhaODk4Zng3a1JFSEJTWWQzVGJjaGZPaWcxa0FE?=
 =?utf-8?B?eXhHemJYNlp1bHVycC9Ia3NNcFhQRXA3dkJxaGZmb1hUT0NoYS8zcTFmUElm?=
 =?utf-8?B?aVhQMWJ2cWFZYjdMRDA3ZUVFa2IvT0NpZ0dOMGZHd2RIK21UN09tREQyWVR6?=
 =?utf-8?B?VmNES01NMEluT3lTVmRQL2EvOGNVNUk1ODloVlZUSTh0V09BYUxkVDExcHBq?=
 =?utf-8?B?S1hMOTZnR29MWkxOT0Y4ZDZaQ3hKWkNKWFl4dlVJQ0lnS01UK2pTWHlZSUFq?=
 =?utf-8?B?NHBGUzdNWUdlcmhzOG9aRzlXUmdybWVlT3ROVlk2ckcwZlhkMkpuZjI0YTI1?=
 =?utf-8?B?ODljK25Ya09mcldMZVBoNWIyQzhBWVdEdEdkT0svZ09GREIzSlpPMmR0U2hq?=
 =?utf-8?B?N0ExaU1IVlB2MnE0NFNyTWNOOE13Nk1GTWJJOGFGWjNaUFUwV3lObnhtVWpo?=
 =?utf-8?B?NzRKOC9JU3ZXcXMveC9INERORFU2ZXovYWlZa1AwRjZoRFpVaTJUVS90RWxm?=
 =?utf-8?B?NUQ5M1RmNkpDT2pOM21OR2VUK3ZBeDdnbHpoOGNVaFpLUVFwY0xTNGo3SU9D?=
 =?utf-8?Q?r0KujD3khX2Pv1TlAK3I9Yi8h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e0bf1f-aa6b-4c2b-75eb-08daef591cd7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 20:12:04.2294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdl/ZOfAc/26t/awpN1ESRIRrsxlH+kly2Mu5LpKeECtsgptpLCaVxXZ8I7uBNR4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
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




On 1/5/23 15:07, Hamza Mahfooz wrote:
> On 1/5/23 13:29, Harry Wentland wrote:
>>
>>
>> On 1/5/23 12:38, Hamza Mahfooz wrote:
>>> Currently, there are issues with enabling PSR-SU + DSC. This stems from
>>> the fact that DSC imposes a slice height on transmitted video data and
>>> we are not conforming to that slice height in PSR-SU regions. So, pass
>>> slice_height into su_y_granularity to feed the DSC slice height into
>>> PSR-SU code.
>>>
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>> v2: move code to modules/power.
>>> ---
>>>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
>>>   .../amd/display/modules/power/power_helpers.c | 35 +++++++++++++++++++
>>>   .../amd/display/modules/power/power_helpers.h |  3 ++
>>>   3 files changed, 41 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>>> index 26291db0a3cf..872d06fe1436 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>>> @@ -122,6 +122,9 @@ bool amdgpu_dm_link_setup_psr(struct 
>>> dc_stream_state *stream)
>>>           psr_config.allow_multi_disp_optimizations =
>>>               (amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
>>> +        if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
>>> +            return false;
>>> +
>>>           ret = dc_link_setup_psr(link, stream, &psr_config, 
>>> &psr_context);
>>>       }
>>> diff --git 
>>> a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c 
>>> b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>>> index 9b5d9b2c9a6a..4d27ad9f7370 100644
>>> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>>> @@ -916,3 +916,38 @@ bool mod_power_only_edp(const struct dc_state 
>>> *context, const struct dc_stream_s
>>>   {
>>>       return context && context->stream_count == 1 && 
>>> dc_is_embedded_signal(stream->signal);
>>>   }
>>> +
>>> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
>>> +                  struct dc_stream_state *stream,
>>> +                  struct psr_config *config)
>>> +{
>>> +    uint16_t pic_height;
>>> +    uint8_t slice_height;
>>> +
>>> +    if (!dc->caps.edp_dsc_support ||
>>> +        link->panel_config.dsc.disable_dsc_edp ||
>>> +        
>>> !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
>>> +        !stream->timing.dsc_cfg.num_slices_v)
>>
>> I'm not sure this condition is correct. We can have DSC but not eDP DSC
>> support.
>>
> 
> AFAIK PSR-SU displays use eDP exclusively, so we shouldn't have to worry 
> about this case.

Right, the dc_link here should only be eDP. I suppose that isn't quite
clear.

Maybe add this as part of the condition?

if (!(link->connector_signal & SIGNAL_TYPE_EDP))
     return true;

Thanks,
Leo

> 
>>> +        return true;
>>> +
>>> +    pic_height = stream->timing.v_addressable +
>>> +        stream->timing.v_border_top + stream->timing.v_border_bottom;
>>> +    slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
>>> +
>>> +    if (slice_height) {
>>> +        if (config->su_y_granularity &&
>>> +            (slice_height % config->su_y_granularity)) {
>>> +            WARN(1,
>>
>> We don't use WARN in display/dc or display/modules. DC_LOG_WARNING
>> might be better, or log it in the caller.
>>
>> Harry
>>
>>> +                 "%s: dsc: %d, slice_height: %d, num_slices_v: %d\n",
>>> +                 __func__,
>>> +                 stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported,
>>> +                 slice_height,
>>> +                 stream->timing.dsc_cfg.num_slices_v);
>>> +            return false;
>>> +        }
>>> +
>>> +        config->su_y_granularity = slice_height;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> diff --git 
>>> a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h 
>>> b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>>> index 316452e9dbc9..bb16b37b83da 100644
>>> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>>> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>>> @@ -59,4 +59,7 @@ void mod_power_calc_psr_configs(struct psr_config 
>>> *psr_config,
>>>           const struct dc_stream_state *stream);
>>>   bool mod_power_only_edp(const struct dc_state *context,
>>>           const struct dc_stream_state *stream);
>>> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
>>> +                  struct dc_stream_state *stream,
>>> +                  struct psr_config *config);
>>>   #endif /* MODULES_POWER_POWER_HELPERS_H_ */
>>
> 
