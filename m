Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37F485E06A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 16:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7135510E44C;
	Wed, 21 Feb 2024 15:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TteAm1T3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A819110E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJTbTBmCLvxBfhQepe3UT76V7mDSWXwQ/MvqXLUjfD1/5fmskvZhKD6rNeag81Z6Xkyyl/dlXnMM75rJXn7f/kvYycF+/IYQKlcQX4O0f5DBAdsCctkXHlzwrMiToJoIf/7EkuDGkDTFEANQQtgCyhKolucNaAWzgzw9UGYvOwBMT8S+O6uKQsv3VGWU33+xlLsmxFjxWnwwUAG76UGWwwixaBQIekoOrTn0qGfLbTdbxX9yHWtvu83Ohf3bTfCl2ZASsKCmSiC6ZZV0dosZE1ieVXzPHj0phE2iP7YJjCykmDiuW3JClJz+ih/2un+sBv2NCsIc3ZRCRMEM7vNDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlx1ecz663fOWeKWAZf1UJTRhAzh21x0+l2NB32R5bY=;
 b=E5Jt7266/KRumZed/hm2kyAcQApPF+NsCoMtROuWFMBRSN8huOU4UEtrWHj7Yo3QvWFODLpSLIhzD2cOa98nI7dkPo2Od2NyshJ+5db+/r9nDFx1j0c8IX16I6mng9y0C2ECuGs9FGlXQWqbXQSqXSajtmy/qs23ZaKzw/fujCVkGjE/WMVWbelD06R3DZ/snkXP+mOoua6KE46XSrN4EqU3g4cxUgLdJ3q8/mMPZ+Ws0tKuW12AoQ2aMUjrjQRrhvvqF/v5DKci2O7ft+gh7u/JCXEODULZ7aCQflEpATgWMUAHjxonFlSnUvQRzbzxDRm2AJ6b2ytD0YaYYajx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlx1ecz663fOWeKWAZf1UJTRhAzh21x0+l2NB32R5bY=;
 b=TteAm1T3kQMGlkU3wJJp2dAT8gzG3/zL6zT+9+kgR/i9RaXMT2CCodGdHhLs22wVTJl/eLpjBvn1CzZOfj48j7Ek+WkvfyrIXm5+v0yq5RhJ892bWJA69RK2FCwAu0zg082BW5horzto2mVSPdM1j3wBagjktxk7nINtYfxOigU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Wed, 21 Feb
 2024 15:00:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4%5]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 15:00:12 +0000
Message-ID: <cd95fbe2-6112-4a4f-8efd-c03d72d1b1c0@amd.com>
Date: Wed, 21 Feb 2024 10:00:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240221110751.48da8190@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5cf74b-bc03-4f2c-37a5-08dc32edce1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8jccc/n3TKfQyV/aeADL9vP8VJzdaV8K4I41wwyPKjGF7Z1mQ/L4ZMK7MF6HEnb1C31/uEHF5GA6GPKuGOyMaM+yWXpn5vWyEQw1o+iwAkSZYfhvj91QGnTR/dURDFhxwmTfu3kxZZ/wdi15RkFEATFqvIX7XG92ktMd5PzTUQdGan6rhVXWvD9VcvQjIar5bcQqOm/wXfjAYO47Sw89YruZyvPH9rjeKHh6J/YNjxaca/roytPmb0aRVCVBkuLLtBtWmvol4aIKK2Xk91T4v4eUDxHfw0/OMPEWG4BtlnnXwCMpNaWbVW2IJ/Zh6beu/v8i6OKE8IVm+CDjCFAPNCESIGyL9A9OfP6NFGgp4uSt5YPLAbZl+wQY4IB2S1OB13ps53/HtlsfgUZ6QDQ2YSwP1MKQxiYCqJDXDnu3c0Q+VvRAbEnzI+0Goa5wz4fYI/v5Nhoy+DvEembx6Cn+wq3RTRkRIJrpb2jPd303i/bbtLinpyiLhmi6QbFQaDNCRZ38MxFF5YJoLnqn8Yukjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xzNk11T2RKeW9jKzc0S01kWmswcFp5R2N3M1cyYWpwR1NHSWtZVFN4Wlhs?=
 =?utf-8?B?SGw2WFNIN00wczN4Y0pFMUs3VVlSTGtybDdROUxyQVhPdFFDTkk2ZjRNOVE4?=
 =?utf-8?B?M1h6alJoNnM1RFdwVUNLZnQreHRwVGk5Nmo4M21TNTVka09QNGJCMlA1ejV1?=
 =?utf-8?B?VVpZeng3R3IwUW1jM2I2SHJBM0ZzclJuU0JKcFl4VGJQemxNWFlPSUJJdm5l?=
 =?utf-8?B?akdqQ0dUd2R1dGFLTUd5TWlmSlFZRW5sZWIrazJWY2t6ZmxJcEhqM1JNVitF?=
 =?utf-8?B?eFJPSkt3dmFrdWlNdjFPVm5yd0VLZVIxMk5TcDh6Zzd1ZEV6dGtSKzA2SkFY?=
 =?utf-8?B?ek5qVU5ZSmNXUDZvRTlIdDR3WlV3RlpkZzRWK01GYkl0VDRZaWFQT0dUWE8y?=
 =?utf-8?B?TWR6UkY0UU9qTmYzVEZPK2N5ckpxMENwanBqQlR1Q3NDTU4rdzhDcUR1U2Ey?=
 =?utf-8?B?OUpNN0hReHVESUk5SC9xNEVMbWp6cVhxLzM5MFJlWm4vQVJqQ1JiMEpFWDFB?=
 =?utf-8?B?emt1dUFjMnZ2dHBmTG5YVGFEWEpNaEFYMXRpOHNvY3gwUHQ5RzdsZHRWbFdV?=
 =?utf-8?B?MTAwNUdiRHZEVkhJbFJaUEMrSHJXRDBMYVpZNTU1R1F0emVRRWtGSkR5RllY?=
 =?utf-8?B?bm1OV3BsdndOdzcxUDF4Z0ljVXZPVG41dDFwY1BpT2Y4ejY5MytwZTBnNVRS?=
 =?utf-8?B?V0NiL1hyZW1reHlDVll2NnhXejAxdmw2TWF2d1NjL3Q5STQvT0tQa0Fhd0tM?=
 =?utf-8?B?dktBbHpxeHdhSm1nd3d3VVNLc3dHVmk1Z2hwNnJnU2dkZ1N2VnN0dklXNDJO?=
 =?utf-8?B?WjdhMldHUGxpcU5BQ25sSHdNL2dXRUtFY1cyeG9xR0dZUldPR2V2YTB3ZEVu?=
 =?utf-8?B?UVRqN2ZkenZTQ1NqVm1keFlPYnphNzBLeU5VT1FNTGhmUWlUVVRqSlpiTXJV?=
 =?utf-8?B?TWNWL3pZMUNLNjZ1RDExOHNpc2xXRmZxamYyWjYrdmhnTXNBQW82TjExcWc4?=
 =?utf-8?B?UmtybTdQYjV1ejRraWdEQ2VaWXB4cFN5SDFiK3JHZDIwSUlhaTV3MVNaOTBs?=
 =?utf-8?B?cTBDRG5uZmJiS2NaT0podzVoaTlsemhJUkI3R3pYVlphK0hjVG8wSDRmSkp1?=
 =?utf-8?B?UjV3dHpHTmtkcVZJWmZCSGp5UC8wdmpneHBHU3ZrV3BRK3d3aVg5T2VmeDB6?=
 =?utf-8?B?YkxEdlJtUmt5V09MQ2UrWFhGenZvTkhTWEVJSmxJeXVnb2RONGlRQUY5VHVu?=
 =?utf-8?B?dm5hTWRibWNJS1Bsb0h5d28zSkc2WGduTWpOUTVncTduZnZiQlNKVGhJNStR?=
 =?utf-8?B?blZ3Z3NjOUprWTZKcm1PZ0Y4ZEVtUjFyaERHY2tnV2FqZGRNd1c1YWdhQ3k5?=
 =?utf-8?B?SGtXa3g1VWJyQjRYekZGOEJTcWFZNVhoN29rd3E5dXdhK2ZZVkI3V2tBRFYr?=
 =?utf-8?B?VTZGbUNGV0hWSzRsb2RST1hBMkwxakJUbEFrc2JuYWdKQ3V4NS9ueDdQZUhM?=
 =?utf-8?B?Uy9tYVlSU3NNR245RDZxSkR4RjZjU0FJZVNLdFZ5dU9jYXlCMTlNTWllLzVK?=
 =?utf-8?B?VFJkaktHQ1FDTVlwUlRjMFcxY3lFUGR2S01BTEJFRmp2a1dZQUdnYTRORlNm?=
 =?utf-8?B?bzBUclBrQTZyaW15cnh2Nm5ORVk0bE1jU1FwZjJGcjhIUmtURmNKMFoxN3I5?=
 =?utf-8?B?RE9RZ0VPM0dGUUo1Umo5dHp0VEk0UjFiNHpGYkZDNUc2c2JXREVoaFdYV3NO?=
 =?utf-8?B?T1JFNityUUdFOEFVYTZKUmpTWFA0WGhmREpHMDZKZDRaVmNlUEZBWFR1Tnhn?=
 =?utf-8?B?Vnp3SEN2b1Fzdm83MFdkQ3I0am5NaGpkdWhZbk1GK3hNM2dXb0tsTFJyTzdO?=
 =?utf-8?B?dFA5Um1ab0dSOHNjdG1ZWlI1SmlScnVFSVAzWG1xS2ZOZVVFam5PK0VvYWxn?=
 =?utf-8?B?VEZ0RHFNaTNJQmtXeS9TRXZnd3RwMSsySllaZWhWWTlvKzN1aXRiTjBMc3pM?=
 =?utf-8?B?REE0Z3NhQ0FxNjRsdXY4dWU5UWVmeEk4TjhmV0VzMUtVdnhLdkN4M1Q2VzRh?=
 =?utf-8?B?QzVBSVl3Z0UzOGJZYkE4UW1JM05jNStEWFZ1RlpBWmp6dnFJS1FoeGZwZlgz?=
 =?utf-8?Q?d9IN6CrcDCmOCQgKAdVe6jLhj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5cf74b-bc03-4f2c-37a5-08dc32edce1f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 15:00:12.8030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNdxCjGbzDfJ9PRpM2ldXRqMWYBi9IblPz/pyDXxxlw6GvOXvDeDjx1rdgxqeCxUYyD14B6b61qPyPvqUtO7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-02-21 04:07, Pekka Paalanen wrote:
> On Fri, 16 Feb 2024 18:48:55 +0000
> Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> 
>> From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
>>
>> Add this as a value for enum_drm_connector_tv_mode, represented
>> by the string "Mono", to generate video with no colour encoding
>> or bursts. Define it to have no pedestal (since only NTSC-M calls
>> for a pedestal).
>>
>> Change default mode creation to acommodate the new tv_mode value
>> which comprises both 525-line and 625-line formats.
>>
>> Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Hi Dave and Nick,
> 
> since no-one else commented yet, I'd like to remind of the new UAPI
> requirements:
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> AFAIU, adding a new value to an existing enum still counts as new UAPI.
> 

I tend to agree with Pekka. I'm getting tired of seeing new DRM properties
without knowing which canonical upstream user-space project uses it.

Can someone describe this for the "TV mode" property?

Harry

> Maybe there is no need for the full treatment here, or maybe there is,
> I'm not sure. I think you should make some statement about how the new
> UAPI requirements have been addressed.
> 
> Btw. no-one has submitted a record with "TV mode" to
> https://drmdb.emersion.fr/
> It only lists the radeon-specific "tv standard" property. I first
> thought you had mistaken the property name in the cover letter.
> 
> 
> Thanks,
> pq
> 
>> ---
>>  drivers/gpu/drm/drm_connector.c    | 7 +++++++
>>  drivers/gpu/drm/drm_modes.c        | 5 ++++-
>>  drivers/gpu/drm/drm_probe_helper.c | 5 +++--
>>  include/drm/drm_connector.h        | 7 +++++++
>>  4 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index b0516505f7ae..fe05d27f3404 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1005,6 +1005,7 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
>>  	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
>>  	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
>>  	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
>> +	{ DRM_MODE_TV_MODE_MONOCHROME, "Mono" },
>>  };
>>  DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
>>  
>> @@ -1697,6 +1698,12 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>>   *		TV Mode is CCIR System B (aka 625-lines) together with
>>   *		the SECAM Color Encoding.
>>   *
>> + *	Mono:
>> + *
>> + *		Use timings appropriate to the DRM mode, including
>> + *		equalizing pulses for a 525-line or 625-line mode,
>> + *		with no pedestal or color encoding.
>> + *
>>   *	Drivers can set up this property by calling
>>   *	drm_mode_create_tv_properties().
>>   */
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index c4f88c3a93b7..d274e7b00b79 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -530,7 +530,8 @@ static int fill_analog_mode(struct drm_device *dev,
>>   * @interlace: whether to compute an interlaced mode
>>   *
>>   * This function creates a struct drm_display_mode instance suited for
>> - * an analog TV output, for one of the usual analog TV mode.
>> + * an analog TV output, for one of the usual analog TV modes. Where
>> + * this is DRM_MODE_TV_MODE_MONOCHROME, a 625-line mode will be created.
>>   *
>>   * Note that @hdisplay is larger than the usual constraints for the PAL
>>   * and NTSC timings, and we'll choose to ignore most timings constraints
>> @@ -568,6 +569,8 @@ struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
>>  	case DRM_MODE_TV_MODE_PAL_N:
>>  		fallthrough;
>>  	case DRM_MODE_TV_MODE_SECAM:
>> +		fallthrough;
>> +	case DRM_MODE_TV_MODE_MONOCHROME:
>>  		analog = DRM_MODE_ANALOG_PAL;
>>  		break;
>>  
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
>> index d1e1ade66f81..9254dc2af873 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -1211,8 +1211,9 @@ int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
>>  	for (i = 0; i < tv_mode_property->num_values; i++)
>>  		supported_tv_modes |= BIT(tv_mode_property->values[i]);
>>  
>> -	if ((supported_tv_modes & ntsc_modes) &&
>> -	    (supported_tv_modes & pal_modes)) {
>> +	if (((supported_tv_modes & ntsc_modes) &&
>> +	     (supported_tv_modes & pal_modes)) ||
>> +	    (supported_tv_modes & BIT(DRM_MODE_TV_MODE_MONOCHROME))) {
>>  		uint64_t default_mode;
>>  
>>  		if (drm_object_property_get_default_value(&connector->base,
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index fe88d7fc6b8f..90fd0ea0ca09 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -200,6 +200,13 @@ enum drm_connector_tv_mode {
>>  	 */
>>  	DRM_MODE_TV_MODE_SECAM,
>>  
>> +	/**
>> +	 * @DRM_MODE_TV_MODE_MONOCHROME: Use timings appropriate to
>> +	 * the DRM mode, including equalizing pulses for a 525-line
>> +	 * or 625-line mode, with no pedestal or color encoding.
>> +	 */
>> +	DRM_MODE_TV_MODE_MONOCHROME,
>> +
>>  	/**
>>  	 * @DRM_MODE_TV_MODE_MAX: Number of analog TV output modes.
>>  	 *
> 

