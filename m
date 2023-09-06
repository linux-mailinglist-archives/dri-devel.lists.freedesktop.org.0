Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E5793F3B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D110E684;
	Wed,  6 Sep 2023 14:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D69210E68A;
 Wed,  6 Sep 2023 14:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsRYQeOdkg/i/kJFUdM6UFJPO6yyH5SBUp8DeTWiVOExOp+DI07OknpMBdNldPkOdlC4FyeqAYNp7WI/Ek/NjKsJyyvQn+fc0Xs9qrMeheALysouS+gkCfHmBfXxVMJN/Q5FpDSYldjOQLdJM7J74CSaKSc3AMorEg98+KKtqVuqyPUjTBl7EBEiypATOt01s9zYZ0yz704oPvMUAMnELi/Ys8/Ar3PruTx+rYDOaQlfLV6bWL/6yLVQNeMoyghWyuIB0OeIbVOs+g8uX0+fnm4y+mXrHUdFEHjjmL7hodDcYOb72SUgyVfFuiFPceuYkxqWADq6jvRE2d08kV3AiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7Hzf0ZA3Kba9JHl8tuF9iFl6P5cLRD/JuduYFLNNA0=;
 b=X6W9pwVOk3LDbPWiQprllV6Pmu6Ne/RwJSz5qi6qESrCAz3ygWVyYeiHhfKn9EAaCVgbk5+IIJcnLJCHBcWJj858oWI3a9z0Ktwhg3L6ZT1/3aJLJdKt62njSB4yHo9PT2/3ooLNbOmnmovNNvXGNxj3L29NzETOvM2sTHNmbeEGvi2pVT7WH1fRaL5cVBlELhYNL1QRSnuSdAUAkSsZE5+HSFBq8W+rXHCSyy7IMd4Xt2b2xbGQZfIxM4r+xY1XoIvXGFzqFfV2wc+0GWn1v9jTb04nDw7kizm22aLg9VW1E7fF5u4DJvlgnzydkVnQVzwRtpJU8s2+cDwB8RMvuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7Hzf0ZA3Kba9JHl8tuF9iFl6P5cLRD/JuduYFLNNA0=;
 b=xnaDt7M8RXGqrjTnmh5Xa3QJMD4rFfptdGHjYx6qNSWsWhB2OuvetTqTv/2/FG8Pbfy2gBMkNwjwZzKLDCC8xtFZE7JZvC1SfdBQJf+uxkXd0VLN9JhkpQ5SPR1xz3evI9Yyin03uhJFvETrSbG5dUTYz9lDCrhSuWEkGD8kgxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5344.namprd12.prod.outlook.com (2603:10b6:5:39a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 14:46:48 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 14:46:48 +0000
Message-ID: <3f08ec28-7b8b-436d-ba3d-afb0cedea016@amd.com>
Date: Wed, 6 Sep 2023 10:46:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping CRTC
 degamma to DC plane
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
 <20230825142944.3jkibtz54f4utwuq@mail.igalia.com>
 <20230828111726.0a39b73b.pekka.paalanen@collabora.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230828111726.0a39b73b.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5344:EE_
X-MS-Office365-Filtering-Correlation-Id: fc17ec2c-c557-4c0b-e0b8-08dbaee81944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fk4RemUvCmBb4UJhMDREJU+o0hMkTBH8+YtdjVSdojFIALz+h3z8C8DUoyymlI8ol+svht8/yzSUP092oTBZv3TyVmC1pAY0Kxg+vzttTmwoLbnEHfGuCFOavObN/uBBHmvScFr0ThmwJWzOB6eJm1S27qQ4nNJDMNNg93ZC6dNsK5Lfdsd8bQC+08nz+is+/IPo3tiQImjH6/Wl3wl5BukE2p1oFpKZmovrKCRNb+BsKnSroq2DNg+8UURXtQrolAisbhV6r57NyCiG2UCRuKtPhJ3lS531xc+xFAhY6ym8cZdEe6vsk2nDUZB/ffs1qYxprUosDxr0p8Rvqi7u7HXG2QDIa7Cu7MXKUY+cfqXtWD/wvneHpIDJiOIzPD/xL6jN1CHasLG9MRiMs0MPXbxCVog+VwpxAoS7P+dJZUrhrBblL1T42GCI/dJEBkDzJnJ+934sfWa0Ba5QcfSRI89W1Y6ZgidTD50Y1SAv1KqtollvNVhQLG/bYO8HJkYXQw9oIxs0VEZapr3UxYDyCCjRec6ygMlw8SpCZuEQVGP0fy24YXvkWW7G/LdV7l76ox47WhG4949c0VAkU7BCYEUqw0qCyzZ9d8vxXBY/b149mQC0nDGO61nWhlnyLiXXL/vKIBv6uPHM5S8It73U1qDcapLfYZ9hK6ilBey4QyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(1800799009)(186009)(451199024)(8936002)(4326008)(8676002)(83380400001)(966005)(478600001)(66556008)(66476007)(110136005)(54906003)(66946007)(6512007)(2616005)(26005)(6486002)(6506007)(6666004)(53546011)(41300700001)(2906002)(316002)(38100700002)(5660300002)(44832011)(31696002)(86362001)(7416002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzQwRWE5OTJNMEpZOGFMR1VhTDlLL2tjaXVQOWZjOEZZdERzTlRudDk0a3da?=
 =?utf-8?B?eUtGTzNyRXo5eUx1ZXB1M2NleVo1VThTZ3RKUWhhMTdOTXd6YnJObk9NVzJY?=
 =?utf-8?B?aDl1bWoyM3VNdjhxZ29LaHNoOFpKWERxZ0x4aitBak5DN3FSVVd0ZUNhSlZF?=
 =?utf-8?B?blhtdGRKT0VUNEdCRy9LUjM3TUYrRUgvREpJMjdGWUs2L3BGYXpiNW1FaDhQ?=
 =?utf-8?B?eS9oemp2YmJkdDM3ZWNYb2NYK01LazZhc0piQUNZSkljUXJTUWZoRWlDQllE?=
 =?utf-8?B?SVBlTTRPdDJlTGtyQkllNzhaZDY3c1FXcHE2QXpYQndPSnd1YWtyOFJXSmNu?=
 =?utf-8?B?RU1hUTY1d1d0RlVvMU1VVWFnK0UrV2R3aEYrYmdwc1R2OVcyUE5XSFl5eEpm?=
 =?utf-8?B?TnJ6TFhNR0liMkhMRjB4MFB5RjBIZ2NVcHRRSHFaQmhxelZ6VjJXZVNmTUxz?=
 =?utf-8?B?bVAxczUxM2FYbjN2cU9kS21vODh0TG0yOFMzc1kwcGFWd2NmOE4yd3drNVl5?=
 =?utf-8?B?b0VKeUxKMTQ5a2RWK0FDa3JhVHFuNzdQd3VEcUpieUx3aVE2cG1rZWVFRVI3?=
 =?utf-8?B?N2tjU2FPdGFhVHBEbVI2cnFFZHpxTjlkU1BXRjlMRXZKeU55MHhEMWtTcElo?=
 =?utf-8?B?Y0FvVHN4K21ycnBvbTJXa0doZDZtVHM4Rk1JZUs0S2RMTmdjOGV5Tmd1c1cr?=
 =?utf-8?B?dWhqOE43MFR4NDJuZTl3Mjg3SmIwL0ZXUEtSL0tWYmFhaENVNDlGZ2p2M3FE?=
 =?utf-8?B?ODY0U2JtZ2JrSUNUUTZrVTRwWUtBMWIrL2lHMEVxVEFkeU8vUkRxbStpRzJI?=
 =?utf-8?B?U0MrMzBhbVNDV1NqSGNCRXEzM0tmMDM1aGgwYTZwekJ0cXF3ekNkZVc5cGo2?=
 =?utf-8?B?aFJVMk1Ca01oREI4WjBkUDM1akhVbi9CUFN1clFwNmhkb1pIT0VFUkhEMEgz?=
 =?utf-8?B?RE9GRlFOV3A1Wm1ENzBtdGNCLzYzaE1ZSVpQWXNpd2M3ZUd2dU1wZXZvTGFT?=
 =?utf-8?B?bTZpL0c3VERIaDExc1dwb0tFbFNxRkFrZlZLRzBpK0lWR0MxeFE3TzZYZWpS?=
 =?utf-8?B?NlovcGZ1MXV0c1FoOGFwNEVZcElIRDVHeHZacktYVGw1Wkw5cXJCZ1pDVm9z?=
 =?utf-8?B?WEFvMkxzN25pMzEyUEJjSjJhdFVGR2lOc0Rod2d6SzZtbVFKK2FkRHcwekE0?=
 =?utf-8?B?RFBCYURmME1OSmVIeHhsTmdYVUZtL0F0dGZ0OUZKZjhsUzZLd1F4eXB3WEo0?=
 =?utf-8?B?blBML1ByMmZFTU5wcTl6VzNPSDdaV1AxdWJIQ2FwWHN4WDU1TVlMeExGeld6?=
 =?utf-8?B?dzVrNG1GTXJjSEVmUzgzZ3YxSnBrc1lJRTNWMzRQUllDU0dITkVLcnR6dFlh?=
 =?utf-8?B?YkZMWGI4OThRczBlNTYzV0QyTnAzemp6MEZYcTFNd3JYR0xtVlo4YmhlU0hS?=
 =?utf-8?B?bkUwR2kyTHdaNldGaGZTZjdERVNTUUxDYmg4RmVwNTVkZ1V4VDJ2L1ZtQWtB?=
 =?utf-8?B?MUUrSUdWS0tldDFBWDAwMWYwTEx0TzBNNU5Qb1ZqeUFTZ1ppZVBDZUFMYjU3?=
 =?utf-8?B?WnVzdXlIbi8yajd5M3NRMHdLZWQwNmR1eGt0dnBOb05mWWJkQUdCSDFWOGxP?=
 =?utf-8?B?ZFpneHkvUzFlTXBhcUhIT0RjZ3JsWU5YSFgrTEFyMGZRT1h1bzY5bisyaGF6?=
 =?utf-8?B?ZnYyNE41S08rOTB3bmdpa05mTWFTU0tZNnZBYTFCbDdpOXllbUxvQUYxVmNM?=
 =?utf-8?B?OXZqdiswQklKQU5tMnZBS0NPOG5BaHVhLzcyT2hmQnVJNlI4aWk0a0pKbExE?=
 =?utf-8?B?Nm9HK08zdW1rYmcySldzYmkwZUM1amN2WnFtK1o3anRoQjlWVEI5RUE5K1Fx?=
 =?utf-8?B?MnVGOXZuakJISUVuYUNhNER1QnlNazQvcnNkOEw5WmZmS1o5amw3WGZ0aCtB?=
 =?utf-8?B?SlpMK1pZUzg4UjB0dE52Q0NiN2VFajIxT3cvQTJ2Ylp3bU4xUlFNZGZkSUY5?=
 =?utf-8?B?UE84QXNMbngxU1UvQ1dWY3ZqM2gzaVdNL1VFT1YweG5oWkdMYlJKT1g2TU5o?=
 =?utf-8?B?V09tT2VNaUc1azlwTWxFQUt4WHRpR0EzMDQ2N2FYYTdDU1h4QnRYUkxqWmxQ?=
 =?utf-8?Q?FEdhVG5jpcvDtiT9Y+orSyg59?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc17ec2c-c557-4c0b-e0b8-08dbaee81944
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:46:48.5266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4KTWTTcgyd4mTwNvT1fJ/rkoIhprMrajTwSolphR4XW3Mz7TMZgxqZJCb3lr6ulczxvfGha8Ha2kCnHB5Ix7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5344
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-28 04:17, Pekka Paalanen wrote:
> On Fri, 25 Aug 2023 13:29:44 -0100
> Melissa Wen <mwen@igalia.com> wrote:
> 
>> On 08/22, Pekka Paalanen wrote:
>>> On Thu, 10 Aug 2023 15:02:59 -0100
>>> Melissa Wen <mwen@igalia.com> wrote:
>>>   
>>>> The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
>>>> pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
>>>> atomic degamma or implict degamma on legacy gamma. Detach degamma usage
>>>> regarging CRTC color properties to manage plane and CRTC color
>>>> correction combinations.
>>>>
>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
>>>>  1 file changed, 41 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> index 68e9f2c62f2e..74eb02655d96 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -/**
>>>> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>>>> - * @crtc: amdgpu_dm crtc state
>>>> - * @dc_plane_state: target DC surface
>>>> - *
>>>> - * Update the underlying dc_stream_state's input transfer function (ITF) in
>>>> - * preparation for hardware commit. The transfer function used depends on
>>>> - * the preparation done on the stream for color management.
>>>> - *
>>>> - * Returns:
>>>> - * 0 on success. -ENOMEM if mem allocation fails.
>>>> - */
>>>> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>> -				      struct dc_plane_state *dc_plane_state)
>>>> +static int
>>>> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>>>> +			     struct dc_plane_state *dc_plane_state)
>>>>  {
>>>>  	const struct drm_color_lut *degamma_lut;
>>>>  	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
>>>> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>  						 &degamma_size);
>>>>  		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
>>>>  
>>>> -		dc_plane_state->in_transfer_func->type =
>>>> -			TF_TYPE_DISTRIBUTED_POINTS;
>>>> +		dc_plane_state->in_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
>>>>  
>>>>  		/*
>>>>  		 * This case isn't fully correct, but also fairly
>>>> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>  				   degamma_lut, degamma_size);
>>>>  		if (r)
>>>>  			return r;
>>>> -	} else if (crtc->cm_is_degamma_srgb) {
>>>> +	} else {
>>>>  		/*
>>>>  		 * For legacy gamma support we need the regamma input
>>>>  		 * in linear space. Assume that the input is sRGB.
>>>> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>  
>>>>  		if (tf != TRANSFER_FUNCTION_SRGB &&
>>>>  		    !mod_color_calculate_degamma_params(NULL,
>>>> -			    dc_plane_state->in_transfer_func, NULL, false))
>>>> +							dc_plane_state->in_transfer_func,
>>>> +							NULL, false))
>>>>  			return -ENOMEM;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>>>> + * @crtc: amdgpu_dm crtc state
>>>> + * @dc_plane_state: target DC surface
>>>> + *
>>>> + * Update the underlying dc_stream_state's input transfer function (ITF) in
>>>> + * preparation for hardware commit. The transfer function used depends on
>>>> + * the preparation done on the stream for color management.
>>>> + *
>>>> + * Returns:
>>>> + * 0 on success. -ENOMEM if mem allocation fails.
>>>> + */
>>>> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>> +				      struct dc_plane_state *dc_plane_state)
>>>> +{
>>>> +	bool has_crtc_cm_degamma;
>>>> +	int ret;
>>>> +
>>>> +	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
>>>> +	if (has_crtc_cm_degamma){
>>>> +		/* AMD HW doesn't have post-blending degamma caps. When DRM
>>>> +		 * CRTC atomic degamma is set, we maps it to DPP degamma block
>>>> +		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
>>>> +		 * linearize (implicit degamma) from sRGB/BT709 according to
>>>> +		 * the input space.  
>>>
>>> Uhh, you can't just move degamma before blending if KMS userspace
>>> wants it after blending. That would be incorrect behaviour. If you
>>> can't implement it correctly, reject it.
>>>
>>> I hope that magical unexpected linearization is not done with atomic,
>>> either.
>>>
>>> Or maybe this is all a lost cause, and only the new color-op pipeline
>>> UAPI will actually work across drivers.  
>>
>> I agree that crtc degamma is an optional property and should be not
>> exposed if not available.  I did something in this line for DCE that has
>> no degamma block[1].  Then, AMD DDX driver stopped to advertise atomic
>> API for DCE, that was not correct too[2].
> 
> Did AMD go through all the trouble of making their Xorg DDX use KMS
> atomic, even after the kernel took it away from X due to modesetting
> DDX screwing it up? I'm surprised, what did that achieve?
> 
> I saw that between 5.15 and 6.1 amdgpu stopped advertising CRTC DEGAMMA
> on my card, which seems like the right thing to do if there is no
> hardware for it.
> 
>> But I see it as a lost cause that will only be fixed in a new generic
>> color API. I don't think we should change it using the current DRM CRTC
>> API with driver-specific props.
>>
>> [1] https://lore.kernel.org/amd-gfx/20221103184500.14450-1-mwen@igalia.com/
>> [2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/issues/67
> 
> Oh well.
> 
> Is the old CRTC GAMMA property still "safe" to use in that it is
> definitely always after blending?
> 

CRTC GAMMA is always post-blending. DEGAMMA and CTM are not always
post-blending and need to be fixed (or removed).

Harry

> 
> Thanks,
> pq
> 
>>>> +		 */
>>>> +		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
>>>> +		if (ret)
>>>> +			return ret;
>>>>  	} else {
>>>>  		/* ...Otherwise we can just bypass the DGM block. */
>>>>  		dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;  
>>>   
> 

