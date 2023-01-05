Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9DF65F4F3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 21:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F9A10E493;
	Thu,  5 Jan 2023 20:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E654310E493;
 Thu,  5 Jan 2023 20:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3mgNzXLw+ZlMHQP4fwPePJSfslV9DZiHxIAvRTqxw2ipe1EYv4kDZh2p5XpsmWE8ck25RN412cjNydk8WGTbIK0TGZMnCcadIoePr8id6pQmys6y4pIotQ7/LjsDVWpmngTRzmCQEggJJhxWVLsVV1uZS2qffXsaDngQ5eLjgFjZXFEAIqrtbdDSlk/lVIsE6VpXLvncE/9k2ZNdGV/lWagGZrDeiNiTyEvKqZOfBKQ3vfFXra/N6exnFAQUWoB/nR2tiJWt58sZ1S3KoWXgLLpkyNZ4ADj1I6AQ/g2Q2C44KS+BKlexF4xP6l+BnXAzxEUpEBgJz3tyanDLKOUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtbRvyJWtwnvUYLd0zpuuPPzwX9YL6uSqoyfgiSgDCM=;
 b=mSaiG2AwkP5ryNuSPqMY1/I23lwKm8mK4fG9LVVOotam89U+sANwCTJ97JNpthY+gdhOKA+n0xsSrHI12+aGa0DqU8uMPArKyk+W8TJSpwLl9QCaLBe+NJjy7G0aMlK8/AYzwEHO4qvoDcrMxlEHsORyY2zCKudy/+8EtRVGraa5Pi4SZSMJMOhbJG6U/yH1TsChv5zObf3vrwafUdPiuG2Y7thox2+wCGj+T4aoUeGNl+Z5FSyyVwqz5OEACIbj505MwZT4juEO9Z6Fde6BWsnotk1mSJSvOQna1kKzpc6UQa43gDgdxPBcbmMeaKeMrrlW2n7LaHgEx7Ahnslchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtbRvyJWtwnvUYLd0zpuuPPzwX9YL6uSqoyfgiSgDCM=;
 b=v6y1//WgQ7m5B+jVw6zr4SXJ9MpzENd+cCS6hEb/nT9tULuQFal2SC8xtrJHiBJSHVTTD87lUfO5ZCwhGWT8R/Au2w+7jjwZQs6INmOi25EGdArHqp6hc4Gh7MsJK0S0kkUHuOzXggpHiVEVlCrNjAZqS8UQk7lOI+gh2z0spuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB5104.namprd12.prod.outlook.com (2603:10b6:5:393::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Thu, 5 Jan 2023 20:07:08 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 20:07:08 +0000
Message-ID: <7f7177c3-c6e1-81b8-2599-0d24245b416d@amd.com>
Date: Thu, 5 Jan 2023 15:07:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] drm/amd/display: fix PSR-SU/DSC interoperability
 support
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230105173809.289367-1-hamza.mahfooz@amd.com>
 <161a2a64-6bdc-c896-1e3f-56da76f03b21@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <161a2a64-6bdc-c896-1e3f-56da76f03b21@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b20560-5938-470f-97fe-08daef586c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5zJ/bTeNdwYRpfNiTQ1JP7Lfi7Fd0+638q7ySIXe5rv2giXjZt52i+buQ4PKhHHZ/0Xm55I9a/502uhvqaQAF5Wh4LojLdb5yb4oz4FM+kgHTtWZeU3rx7j9G9r0F5GfoSmMoEeH/iZIdpKe71qpafrfIUz3rh4SIl1BQ6ExiLoiqMFdofsKq2stpgZ657ITirNvAYXj0KLdX2vBOqmO0cwCD8UrkTbm0v0LOYVwOlhoqxaokJkralrbUX1ZLolRLfjbKYk05dNK8+LdzIRJZFTd/TmrxYWahVDhLJx+8FOU2QQn/hM1KvxH1mppMaR85v9utWLk7PmKONWaoGP74oXxetXN+2MJzcIaAJ2lN8T6UASfBIRtmU0LqzHkqsaYrueBcOi0jnMRewRAFHKtvuFRJI84ZgnLuYZX06asMK1vJ79OjmLUY4JDdXcxHFK3iDHDZRZ20NBof5l5+nnOZxHaqFNK6ImtfLBU6fezcYOL6bHcsgEFvRcEezWXS6rkga7c944KVZNSrdAJsbgAkZBz2RvK1dgL2NQuDtgSld0VPZ6bkg/HHrG7ZoXJmTc8X2wz6YFSq/dy3kZdPj64dSDQ7AZIY38+T3aA59NmW9yeJuDOA7AeWlkOG1jNS/FROgIZvRK2evZ6+1czDgxnhMZLwXQuTbMUosrdgobgdPDcZGj2k2hE36p404gg2lPuLQzGITarKB4zE6Qy2byehNCpvlb/yIGUIJgYp/sT8jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199015)(66476007)(4326008)(2616005)(66946007)(36756003)(8676002)(41300700001)(66556008)(54906003)(316002)(31696002)(2906002)(86362001)(5660300002)(38100700002)(83380400001)(8936002)(44832011)(6506007)(478600001)(53546011)(26005)(6666004)(6512007)(186003)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFc1R3lEbklCbFhpUTFjSXhXYmM4RHdCL2FtTVdzYlcwajF1dDVoREVKZXBC?=
 =?utf-8?B?R0NJbms5WUFmb0ErUi9hd0ZOVmJ4aXhFbEpUWG10c3haNFRwaUh2c0NRSHhi?=
 =?utf-8?B?ZUZmbG9ZdTBZOU5LSE1Malh6b0ExMllBRS95VTQxOWpTd1NkSW94QWhFa1lr?=
 =?utf-8?B?ODRGTWNWK08ySmdXN2FkczNCNHdTaWpEWEpjT1ZLRzliMjdteDRUaXBLK3FY?=
 =?utf-8?B?dlphdDRLbGpaZGpXK0F1L3hMZGdIQVNiZXV6NDliZUFRYUxoVlBXdVFOMyt6?=
 =?utf-8?B?dFJ5bms5aVlqd1hEWnVUZ2hyODFnNnQ4UEFHU3V3UDJEazlxSkNlVklEdTkx?=
 =?utf-8?B?dm5RYXE2RHB5YVY0TE5PNWorUVQrY3dCS3hZODNpeG1ObVV6dmVPekVMM2Zt?=
 =?utf-8?B?UDlDd0xSbmVib3dCR2tsMTdjVk9VbHI1QU5JVE1MZmVUbjJpWnJ0SkFpTnVB?=
 =?utf-8?B?Mi81d1dmb2FWc0dqMUVSVHlnWHJsQ0JEYmF1a1BwWUExODJmTUsySmJLUjlH?=
 =?utf-8?B?YjF4VVVsSnRYaldscFdtb2FJU1plcjFiaG5aWmNFc3VSTHpnaFRMbVZyVk5z?=
 =?utf-8?B?OWRVVFRWUy9ZUmFOOVQydURDdzk3RERteFVwbUN1aUZtN1I4cG1pRjdoeEsv?=
 =?utf-8?B?ajU3eGk4RzZEcVo2Q3kxeVE5OFJqeE1ZM1V4NXI3NjB6VVlXLzRXSld2YTdF?=
 =?utf-8?B?UDNtRHQxU3c0VXRia2luZUFOQjVwYldySkRSdnVGVUFFYS9zUHFGdzNYd2Na?=
 =?utf-8?B?aTBtLzBPSkdaTlJkZU10clgzTE1lWklVNnRYQzMwY2U4L1R0c1U1NGFNZjFa?=
 =?utf-8?B?SDBNeERvK3FWSUJUVFRFRjRiNVJWOWhTWklySG4zZGFialNTYktFc01hMEli?=
 =?utf-8?B?NDVUUitZaG9QYmhETzRjL2txcHp3ZTl5WlpGNVZuNHpuc3ZrejZrNFRiQllk?=
 =?utf-8?B?eTNRMUxKcFlkbzdDQnFQMTlPQWw4SnVUUGNBU3FyenRHQ2lCN0F0d3F6Y3Nx?=
 =?utf-8?B?SWwvdk1wZ2h6SHhNQ0hsRGJ2TWNFS3hjQnA4NkFCNFYwV1F3TnhHVFRBSThx?=
 =?utf-8?B?NVBTV3lIUW5lT2wxS1hESFI5bWhGTC9RZ0JmWkw0bnFNMzI4MnhZZWRvNUgy?=
 =?utf-8?B?OXZBMUx5UTZIOHVYaC8wL1V3WkxzUzBra3RMS2JLWWQ1K1Nzcks1ejRxNGFH?=
 =?utf-8?B?N29CMndtMVUrbW5aWFJ6TjM3TExBNjBDVW5Gb0VzTDFPZzJKREFIWEFWclVE?=
 =?utf-8?B?M295VmdJd0h2QWxpM2hhcFlENzZ2SDJaZkllOUFGc1hRS25WTmhtcUtuTUYy?=
 =?utf-8?B?VFdXaG15eDVVaHVzS0hBU01WT3dyUGRCNUVGd2lBNnNsME5SNlJ0Y08yQmtH?=
 =?utf-8?B?OTVQZGdWWnlENUJad0RoQ1E5eGlEZUxRYVk2S25WSXQxa0F5YjIyTWF6cHFp?=
 =?utf-8?B?VFdZbmRrUGF3NkViQzlma2lVbG03NHBYajVUbkM0UjVXY0JUK1RaOXBQRlFz?=
 =?utf-8?B?N0ZRQUl1UG5waDBSZTU5TmVzK1Rkc0dVdGpIRE9HeWNIMHlodEd0N1ZQQ0Qw?=
 =?utf-8?B?b3c2OEEvRGNDMFNrUTROUDdiNVdwaExWTGFwNEpZY05ha2ROQ3htTmRZMFVS?=
 =?utf-8?B?QjhsTUZrS3FMcU5UZ0VtVXRPOWlvTUdpOFFSbWRJSUY4SzVpSHJGUXhSMUM4?=
 =?utf-8?B?bERBWVJ3dExEdG5mTmYzWmJqR3Z2WEtSdzlaL3UrMk10Vk9YMnJEZW1OcVdX?=
 =?utf-8?B?Y3BobSthVnliNHRySVZIM3Y3ZkNwQTFSbmt0Y1NIOUlSVFlNd1IrUGZQWVFw?=
 =?utf-8?B?RFZsNkJRaSsvYnhkZnhnVE5vcnZnVlMrMlkvOHFxdVdSRTNRUXM0eTgyeVpD?=
 =?utf-8?B?bEN3MUlTaDgrZE1yTFRmaUdkRFJtZGZvWEFSM0tDcGhIc3lFTG9ObVAydUJk?=
 =?utf-8?B?M0c2cm5pWGgyRlEvWFpsU09pSUJncFI3MS9FMmpISHdVZDJpOGt2NTlSUllE?=
 =?utf-8?B?Q01CcTEyc2pvcTJtSDFTT2s5SFhFYXVJQ2RxbTJNandJWFZ0YTNHK0VBdXhT?=
 =?utf-8?B?ZnpLYjZZOVJZVGkzdzNaTW9taENsUDgzMHlPYVdyM210OEd4R0l4SHJGQTlt?=
 =?utf-8?Q?1MWWiRYzeibKRpI2+B4jWqS12?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b20560-5938-470f-97fe-08daef586c3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 20:07:08.0357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njipCaLQ5sW2HQaeMDncmBCVYw02apiDMuz3NANWbjFxOGxsF9jmrcPrvcOog1FjseC+NYA3nc7SVKd6JtczdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5104
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
 David Zhang <dingchen.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, Camille Cho <Camille.Cho@amd.com>,
 Shirish S <shirish.s@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/23 13:29, Harry Wentland wrote:
> 
> 
> On 1/5/23 12:38, Hamza Mahfooz wrote:
>> Currently, there are issues with enabling PSR-SU + DSC. This stems from
>> the fact that DSC imposes a slice height on transmitted video data and
>> we are not conforming to that slice height in PSR-SU regions. So, pass
>> slice_height into su_y_granularity to feed the DSC slice height into
>> PSR-SU code.
>>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>> v2: move code to modules/power.
>> ---
>>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
>>   .../amd/display/modules/power/power_helpers.c | 35 +++++++++++++++++++
>>   .../amd/display/modules/power/power_helpers.h |  3 ++
>>   3 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>> index 26291db0a3cf..872d06fe1436 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
>> @@ -122,6 +122,9 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
>>   		psr_config.allow_multi_disp_optimizations =
>>   			(amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
>>   
>> +		if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
>> +			return false;
>> +
>>   		ret = dc_link_setup_psr(link, stream, &psr_config, &psr_context);
>>   
>>   	}
>> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>> index 9b5d9b2c9a6a..4d27ad9f7370 100644
>> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
>> @@ -916,3 +916,38 @@ bool mod_power_only_edp(const struct dc_state *context, const struct dc_stream_s
>>   {
>>   	return context && context->stream_count == 1 && dc_is_embedded_signal(stream->signal);
>>   }
>> +
>> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
>> +			      struct dc_stream_state *stream,
>> +			      struct psr_config *config)
>> +{
>> +	uint16_t pic_height;
>> +	uint8_t slice_height;
>> +
>> +	if (!dc->caps.edp_dsc_support ||
>> +	    link->panel_config.dsc.disable_dsc_edp ||
>> +	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
>> +	    !stream->timing.dsc_cfg.num_slices_v)
> 
> I'm not sure this condition is correct. We can have DSC but not eDP DSC
> support.
> 

AFAIK PSR-SU displays use eDP exclusively, so we shouldn't have to worry 
about this case.

>> +		return true;
>> +
>> +	pic_height = stream->timing.v_addressable +
>> +		stream->timing.v_border_top + stream->timing.v_border_bottom;
>> +	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
>> +
>> +	if (slice_height) {
>> +		if (config->su_y_granularity &&
>> +		    (slice_height % config->su_y_granularity)) {
>> +			WARN(1,
> 
> We don't use WARN in display/dc or display/modules. DC_LOG_WARNING
> might be better, or log it in the caller.
> 
> Harry
> 
>> +			     "%s: dsc: %d, slice_height: %d, num_slices_v: %d\n",
>> +			     __func__,
>> +			     stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported,
>> +			     slice_height,
>> +			     stream->timing.dsc_cfg.num_slices_v);
>> +			return false;
>> +		}
>> +
>> +		config->su_y_granularity = slice_height;
>> +	}
>> +
>> +	return true;
>> +}
>> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>> index 316452e9dbc9..bb16b37b83da 100644
>> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
>> @@ -59,4 +59,7 @@ void mod_power_calc_psr_configs(struct psr_config *psr_config,
>>   		const struct dc_stream_state *stream);
>>   bool mod_power_only_edp(const struct dc_state *context,
>>   		const struct dc_stream_state *stream);
>> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
>> +			      struct dc_stream_state *stream,
>> +			      struct psr_config *config);
>>   #endif /* MODULES_POWER_POWER_HELPERS_H_ */
> 

-- 
Hamza

