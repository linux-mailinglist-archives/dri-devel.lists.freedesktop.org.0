Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F274EC77F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 16:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E3F10E4FD;
	Wed, 30 Mar 2022 14:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9A310E324;
 Wed, 30 Mar 2022 14:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOGmZeZUm97lnyyu4A+MgV0vngIHmdEkVftkUqk9iqz2GPtAuvuIN5mMlIvSoRpJix+wzT7VJTXuE+aVrf7swmN5mY03dzzpgTSZLW5vP3PNnoed2FGwuiTe/zkVBM+Srya2x2KIW2Arpp5xGF2HF2iJyiUyMBeqA++vbZOjpxT4bPZOQEZEaokYInMATqMhFXTNqQ1DFOktCGp7CRfzux8XOgpr4YVZKS76UOm2FQISekhGfZ0BbDOaagx7Pkw56Hp+AKJeoMqnxM6wq+zFkJqAXCT/6WjQMjyDxz6JiP15+8tiGdIQNrILl1QQdPNITzRGy06UH7yO/JL2xi/Q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU4yVIFRJVOJwJPZFXfGWRgQ9X/1lWMQyoRYpbdy5bc=;
 b=UGLwWdJq9dPGa9FlvMWQijqA8gFUbxgOmvSqLIR44aX/Umyf7bhuLDW3eIFTG7vret/2yZEUplM7jNBv+7QBHF0eI9bK9kBZYphHY/K6/TUyVDsml25rntGurY8Bl2EEYnfdk4CNRArsvc56XrKZiM0ZRMPyOZkb8NGe1gD6VBxVYwjAuuYdO9iwTW1o+2+DlAKgzgsdrsNu1fqGeOEmaim7oq9+QLofqDiJkinb8QkJJMUrsZT4T+jYm7Zn4T1yeyCzaE1IEB9XVOt2tsnAZiYNOrjFnyGt7DCvdydE58OgkYZRxOw0ZvCJkDBTy5eQajOj1zSse8XGAc6cdxdFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU4yVIFRJVOJwJPZFXfGWRgQ9X/1lWMQyoRYpbdy5bc=;
 b=pYY0cS+x4vhaHw9kq1MJzqxK8uQqT8tmgPh9zxnE3jmpMFsAAn+ZuxRKkkLoD2isEOtVIe/GsR0hXob8F+3u6o0yHvYLcJPlw6jd0/sbCDNoi+VpFC9C0kuWoqsuDIjyo+h6YrW7fmmjPu9cFdALfRNZBwkns1V2pyUpZxfLscY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN8PR12MB2884.namprd12.prod.outlook.com (2603:10b6:408:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 14:54:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%5]) with mapi id 15.20.5123.020; Wed, 30 Mar 2022
 14:54:32 +0000
Message-ID: <4399f3cd-6839-73e7-6325-fa1ad6659afa@amd.com>
Date: Wed, 30 Mar 2022 10:54:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/amd/display: don't ignore alpha property on
 pre-multiplied mode
Content-Language: en-US
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>, Melissa Wen
 <mwen@igalia.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Zhan Liu <Zhan.Liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Simon Ser <contact@emersion.fr>
References: <20220329201835.2393141-1-mwen@igalia.com>
 <f0c7adf6-7417-3773-3780-4a273e9ffb1a@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f0c7adf6-7417-3773-3780-4a273e9ffb1a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36433a71-9da3-4e3f-905a-08da125d32db
X-MS-TrafficTypeDiagnostic: BN8PR12MB2884:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2884F22BBFDBADBAD450586A8C1F9@BN8PR12MB2884.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlqiYZW7pVYnZo0pj67OBqyJW1OFHhy8dI+5hGkiogIYlqUpqN9dR/IFBiZMupJ4xulP2uUdi0O0Obd0kGFKKEt5vd4QYnCpZcm6JAA7+IqAfz/YOJT/c23RY+jP2GrLfaJm5L2SB9gRBGbKzfuqRUCxf60UgRaVz/iqrbFMo+ZwUpWQsAxSK8poGqEoffUfxqSGah9DJNi3Tkm8nh8fJLVZ4/RBnPq+wDti2Pn9usdYhZL19BRumoh6KWOpWvXFzlilCugccSqqVoNabil+vDcxUjhkA+wHZVcQPzHQtJ1cJ7SPZoSmLJhbDfKyDPlqUqPn8NkW1j1ms7eSm1CyVcgbssU9NEe4PFP83CYhTQjlpikx3EbGVb/90VV6qoFME54aJktPL4cjVkQYaFItNQeapSz5dCjKFC8xeydKu+exknFV2D7SekMJUaetbyOGL00zfN4TodKwDqhVieGtscC66WC6WMs/RcwNmpDwyJ+YXPl4MwJptlv6x2AEFuGcRBZqU7nBM0aQ6Fz0qc5dADM60mNjJuDwepOwWfg1Ip48T4iRgPKj2vVLyUYtxuXREDglee0rMJtRjpFaFwHE5pX75WRkUNz59e0nuJrJC2/ltdg7Z8DLEKW63pK2sGq9ec57bDWsiG7dgoPrrIF+97xw44bt3I44B1S24SmH990uoa2OLX/j4XvRwZr+11+XUH9MCmB74WSMBXOj+zfIB2N92v91L78Klpl+CyWQ9Cw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(110136005)(38100700002)(316002)(508600001)(83380400001)(53546011)(6506007)(6666004)(6512007)(2616005)(186003)(26005)(8676002)(966005)(66476007)(66556008)(6486002)(2906002)(8936002)(66946007)(4326008)(36756003)(31686004)(31696002)(5660300002)(86362001)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dTQzNsMXUvbjJaNHpqdTBkYTVCa015aEUwSTcxZ0pEQUlSWEFMRi9NREZX?=
 =?utf-8?B?enpBQ2lHTk9SU0ZXN2srcGsyN2pNYjhwemdoRHIyL2NGUmNWdFVCcGx6d3pS?=
 =?utf-8?B?TWhkS0haeStJeHlqR3B3ME15ckJ6eXJDZUVod0pqNEpLanM2aGdpVVp2bFJh?=
 =?utf-8?B?Q3JYMEdjMGhPbk9HakJqcVJJc1hMNHVJZDdpUXVVTWMwUU1GZ2FaeUIvVTJ5?=
 =?utf-8?B?ZHNJVE9VaWh4NzBVTkVjRjc4UjlkTG5uaUZib0dBYzhCM0lsZk9GU1FQb2NT?=
 =?utf-8?B?WDVJcGV0WkxFWmw3dlNrZCszMmtFTGNHcjNHMWlLQXBEZzFwb0xwSGkvU3ZG?=
 =?utf-8?B?bHp1ek5wSk1xMGp3TmtrbkxqWVpaZGg0Tyt2SjZBdkRKWWFlUHVtbWxBa2RG?=
 =?utf-8?B?U1NiNmc1SlZqQ1VOMmlnR013UzBCdjZ6Rk90Y1pONWpaNEFySU1OOUgyRVhx?=
 =?utf-8?B?NUg3N2pxVXdWaktYcjhsWlNLMW85QmNlY043OGdlcGFCUXdLYjZKUzBrdHhT?=
 =?utf-8?B?dUNMb3BQYWFuRVZFYnVqTjl4RUdHYnY3VE1jZnd5ajkvTWZYc01iYVBFNU1D?=
 =?utf-8?B?R0hMdEpIcURGQ3kxdGlFTnUxR3FvZUVXUVFEdFhCaEgwTVhCWHlOL3FhRVpZ?=
 =?utf-8?B?RUpubGhiTktIU2YzTWdFOHZqSWwvSFIrUE5wOEVzZzZ4NUl6SGphWjlZTlRn?=
 =?utf-8?B?VzFxOWE2ZWR0MXhkelA5d2VxZmprRU1LdUM4KzU2QVZjbnoxS0V4WDIvMTIy?=
 =?utf-8?B?Vkw2blJXeHBpVjU5bDF5TUkzcDJMdkFKbFRteEt0a3EyZkxwOFlDc3c5LzY1?=
 =?utf-8?B?M1hCWkhYdTJDVDFreXVOV3pmTU44ZFpOb2dIT2tZMmttSnF3bW1vbGQxRnQ5?=
 =?utf-8?B?bmxRUjFZZUo5b0k1bFNlbG1tWWFwTW5YMW50U3d5eUx2TjJmVVFEcFIzaWtu?=
 =?utf-8?B?SE52N3VMUENSM2M1NVdxNlBLTGRjT1ZsN1cycTVTUEY4bTFvQ0lvM2hiWkov?=
 =?utf-8?B?WjlHMlcwWFh4TXNxeDNvOXV6S2FmT1NvTzZlTjNTRlk5Uk43Rk8vUDFndHJZ?=
 =?utf-8?B?NU4yYTE5KzFoSDFMNngrUmRRUWtmVm1Bd1hNL1p0bmhZcXlGeEZPa1hqa1dj?=
 =?utf-8?B?M1MrMTR5bm9uMjExdEFqRFAweTFqNEFKV25mRUlvaloySU5mNk4yS25PVVNx?=
 =?utf-8?B?YmlabEc3RlBIOTVqSGRwc2wyaG9IOUk2QTQwWlNpL0o0eEg5d09VVjZKdjRT?=
 =?utf-8?B?RThHS3VHa1ZBUXJWdnorYk5Sbm93Si9RZmVVdmhTUnU1S09rbDZqcUludWx2?=
 =?utf-8?B?QWV3d2lWbmxIWGJRb2kyd3pCNllNZVZNMEZaVGJCd295eDVEaWw0MEU1Y3py?=
 =?utf-8?B?K0Rjb21ZSGU1L1NzN3R4b3NnY3ZxZmNpalJqTDF3UzA4L1BCN1ZTZFpXRVlo?=
 =?utf-8?B?VzZXanl5d0JSODN4SG5TbTU5S3V6TUp2OTZCTHpFRitiVVdhNFcwa3RPcjVs?=
 =?utf-8?B?bkYvRmd6R0lNaGZ0V3pteXdhY2J6N3RORExKZG1ncTRzSGFLWUNia21neVJY?=
 =?utf-8?B?dEVuYjF1WUZLZkprVjhJWEhGUUtvcGZteEdibWYzV25TYVROTmhxcUJZRDJw?=
 =?utf-8?B?VDJHVHlQdlJTcllVcklFdmxGOVd3bXhudVZIQjJzS0lRV2puYmhRTk1VYU5N?=
 =?utf-8?B?N0VZTW9PcCtJSnQzZENCTHFscFNoNlp2Zmp1RTJvZlh1ZkliUitGWGN0Q1p0?=
 =?utf-8?B?N1JUVHdDY21FQ3VIU2QycUpDWDNMQjA0cjRFSkZHK0ZSclhnZ3pLMG0zQWh0?=
 =?utf-8?B?VGpSNTl2b3JWcDBGaVgwb2xHUEtZVWYyTG5tdnhVd3JsS1JGYU5GQmw4TXdw?=
 =?utf-8?B?TnF1QmlyS3NsUmdudkVuNVY4RXQ2RFNLM0VVdDdaUjBMQ2QzTDZFS0NOekZz?=
 =?utf-8?B?MVlSc2RSS2I1Mjhib29RV25ONmwrTUhrcG5ITG13dmxTRzZsTFN3ZkJtMm1G?=
 =?utf-8?B?V1pTbmM4TUIxT2N1OVlXYUJTQ0IyejRQQUxKaGUyUjcxWGU1anlRdDdXakJH?=
 =?utf-8?B?bms4bHZNK2JKSTdEWVlMVDc3VkNEWnJST0pDcFdnNXdZVEF5UXBUcEYxODVz?=
 =?utf-8?B?R1dQaVI3b0RTY1NkK3ZLb2FBdUxGM1dxcHZFeWs5dzNmN3daa2xkWENsblY5?=
 =?utf-8?B?VzlUTXIrTGROVFhsRmlZZllxSEZkeVNFVkV3NTdTeFhPM1Vucnp0cC9aYnQ3?=
 =?utf-8?B?ME5kTmhwWVBRY0FONHk1Wmp5T2htczJVSWVYSUR5Si9LcHA0cEVnNmRuRnhJ?=
 =?utf-8?B?ZjJPRUlmczUxOFEyK2RSMkpkYlJtUloxVkw2ekNGdmdoSmhEVVZkdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36433a71-9da3-4e3f-905a-08da125d32db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 14:54:32.3198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQmsta94CKNC3BC9dEfqPCR2AmHvzv84jr01dH8rYQ4ZcTKcfwPWuJ1crDZ2OeaYikMJQPkWBsPX2+XFN7Mdfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2884
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Agustin Gutierrez <agustin.gutierrez@amd.com>,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-30 08:30, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2022-03-29 16:18, Melissa Wen wrote:
>> "Pre-multiplied" is the default pixel blend mode for KMS/DRM, as
>> documented in supported_modes of drm_plane_create_blend_mode_property():
>> https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_blend.c
>>
>> In this mode, both 'pixel alpha' and 'plane alpha' participate in the
>> calculation, as described by the pixel blend mode formula in KMS/DRM
>> documentation:
>>
>> out.rgb = plane_alpha * fg.rgb +
>>            (1 - (plane_alpha * fg.alpha)) * bg.rgb
>>
>> Considering the blend config mechanisms we have in the driver so far,
>> the alpha mode that better fits this blend mode is the
>> _PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN, where the value for global_gain
>> is the plane alpha (global_alpha).
>>
>> With this change, alpha property stops to be ignored. It also addresses
>> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1734
>>
>> v2:
>>   * keep the 8-bit value for global_alpha_value (Nicholas)
>>   * correct the logical ordering for combined global gain (Nicholas)
>>   * apply to dcn10 too (Nicholas)
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 14 +++++++++-----
>>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 14 +++++++++-----
>>   2 files changed, 18 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
>> index ad757b59e00e..b1034e6258c8 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
>> @@ -2528,14 +2528,18 @@ void dcn10_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
>>       struct mpc *mpc = dc->res_pool->mpc;
>>       struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
>>   -    if (per_pixel_alpha)
>> -        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
>> -    else
>> -        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
>> -
>>       blnd_cfg.overlap_only = false;
>>       blnd_cfg.global_gain = 0xff;
>>   +    if (per_pixel_alpha && pipe_ctx->plane_state->global_alpha) {
>> +        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN;
>> +        blnd_cfg.global_gain = pipe_ctx->plane_state->global_alpha_value;
>> +    } else if (per_pixel_alpha) {
>> +        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
>> +    } else {
>> +        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
>> +    }
>> +
>>       if (pipe_ctx->plane_state->global_alpha)
>>           blnd_cfg.global_alpha = pipe_ctx->plane_state->global_alpha_value;
>>       else
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
>> index 4290eaf11a04..b627c41713cc 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
>> @@ -2344,14 +2344,18 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
>>       struct mpc *mpc = dc->res_pool->mpc;
>>       struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
>>   -    if (per_pixel_alpha)
>> -        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
>> -    else
>> -        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
>> -
>>       blnd_cfg.overlap_only = false;
>>       blnd_cfg.global_gain = 0xff;
>>   +    if (per_pixel_alpha && pipe_ctx->plane_state->global_alpha) {
>> +        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN;
>> +        blnd_cfg.global_gain = pipe_ctx->plane_state->global_alpha_value;
>> +    } else if (per_pixel_alpha) {
>> +        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
>> +    } else {
>> +        blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
>> +    }
>> +
> 
> Hi Melissa,
> 
> Thanks a lot for this patch. I run your patch in our CI, and everything looks good from the IGT test result.
> 
> In this sense:
> Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> However, I think it is still necessary to have someone else review.
> 
> Harry, Nick, or Zhan, what do you think about this change?
> 

Looks good to me.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Thanks
> Siqueira
> 
>>       if (pipe_ctx->plane_state->global_alpha)
>>           blnd_cfg.global_alpha = pipe_ctx->plane_state->global_alpha_value;
>>       else
> 

