Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC147CFD80
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 17:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33AC10E504;
	Thu, 19 Oct 2023 15:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3045C10E504;
 Thu, 19 Oct 2023 15:01:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQukLl3dOCbN9siFPzw7yjpUm6xqI+td89P2s+hq5+t8FLRi2sWhspZnXviSVrilW/CG2FBKKaLh7Qiiwd3HZudE7J+O3+CptTrtgCQhQ+LAwMruFyJ51uQiGqE7kc8YbXUiu31fB4CeRtNgz9mpyZ3fTT4lSk49v6npnWHt7Z6u6FFi7wg2G/eAM05M3rfJsYDkZ8OjEP0Mkk2NnXbdgA52rzQV9+6t2ICzZYJ8O6J2bPuxV/bZVzZAJ0TVqPPsCmOYVoHq5dc/GBbcf4vKRo1Z8lABPrfDbA8/tz6njiS2/7cgxgFEwyQhbJanAcdT/k+CEHavz89PtrqNsQ+Abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfhplSJjZs9KZVxneVVFyr8vaCYVSQSL6sCc0KT7/XQ=;
 b=mWBqi38zMmzZEUPNpMZbBFR/7ykd1rKuET9ghtnU2lfVKf6n4FRYoEH6vhaxm6RjWk6iRx8YRvyTj3wWay+cSF6G7+TF1OFQB9Nyk48f9yPHAJF/C6d7Daw/zDLhuhXSS0gogNsjJFDavVA6+TGSeA7b9KwfCRGVoJbCoc5LH62SXtKeM3CHNxQPY6p/u1KnV3g5/j6+VcgcCF+zi4kyE3qSfY+yTYu+9nuhPw5psR2umrh2f8lgff76XYeA5DXyF57FotV7vVgrUN1owk42WiKR1LyvCLwiWnrGcjF/s69eu0HgyTo7MjYhQGqjho8l8Mzq5Iwpx3o0Qqd804lg8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfhplSJjZs9KZVxneVVFyr8vaCYVSQSL6sCc0KT7/XQ=;
 b=xn0F8oZGTQ/ho9+kKzLKCq4IsA5+X4Itd1P/A4+6cj8JagXVvugaDrhsy0mjfYQ7bX2QVt9udZUmx3IeVA3+vC42ZnWSUAR29Cmh0JTZpCcQRygatCAJ+RdH3z9Xqsa2uOHSxEIyG8p4axyvaenDglFTWbNjnMWkf5/FXDMsGrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 15:01:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 15:01:10 +0000
Message-ID: <1dec2447-ae5f-4ae7-8836-ac7d631ed55f@amd.com>
Date: Thu, 19 Oct 2023 11:01:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/10] drm/colorop: Introduce new drm_colorop mode
 object
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-3-harry.wentland@amd.com>
 <20231010161958.lqg6sdepklfpgdzf@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231010161958.lqg6sdepklfpgdzf@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0287.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e05306-59ce-4ddc-adf9-08dbd0b43aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BEk4wHVtZ76rhkrsHherCIMQ3qlw//sermiEkvDQMaqpVPWNKTyKtPVxxmyFir52Xly+lIyGpK/XoIWPIhSruqk/ra1RZEAlP1SHp0ytQIGh4MYbvzsoMikvY4K39K7SgnEFN0/8qdwD4kbG2zePBb409y2ojY7fwqral3YVLaqTcBKXVWNkH49zKBG06my6eX04dPdS05EQwOM3/eLszZpsqlvgjg9tz4uQWLgJd9Y6pwK2yTkrGaQ0RhluEdmCiY3cP8IjEoMZoVEwJcC0pXGNsouC0nNzHJEwkKhujK3pOG/3ITFLMv2XR0qYYC/smZovPHY1Gfhx/D0CsROyH9MZXW1u0hseUiHHycmSMp0UmgX8o+Yr3id8QjVVrmrg06pykna9BZ3IRjaONXuiEig5dR/5CM7hFwuQ5aoUhD1uPBBGjrrZbRN5jVftNBW0bHf2L9e9yud2LJveCbh4L5moCDxJ1OxcC5mWe58sW1iKDudShlbJWLFv6AS7QCw3wyX4rPPHc/DS7zBfMGY1/QCZhgdFOgNqznWrMyzLZ2MnRXpVkBn+FjE7FSiKw7suoaWVy7SUEIURjkn3rf9vme13Vh07OEYAWFm2wV4Fxnsu4ZSoGmydjAoCCA5vC51egCCXTNx65Spk8sk8nqcuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(66899024)(83380400001)(8936002)(41300700001)(38100700002)(6916009)(316002)(2616005)(36756003)(6512007)(86362001)(478600001)(31696002)(54906003)(66946007)(66556008)(8676002)(4001150100001)(5660300002)(6666004)(7416002)(4326008)(2906002)(44832011)(53546011)(6506007)(30864003)(66476007)(6486002)(66574015)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9WWS9VZHViRTZRT3NQMUxUUTc3NU9VcWtJL2gxV3BZQmFnRVlqREpVcitq?=
 =?utf-8?B?bW41VUpPaTRUaVdURkkwVTJzRDhFQkpLYlJocHk3L01rdFM2NVcwbm1sWjRi?=
 =?utf-8?B?a3V0R0hMdmxTcmMxT2N1empnS0FjZWthdDhpdjFzOFpiUk9vYytwbCtQcVcr?=
 =?utf-8?B?QjNuZTBYU25ObXpqdXAySmNQUDh4UnVhQitqV2piOWttRXdmS2REWENqdzFG?=
 =?utf-8?B?VEdWQUpTaUhlTzNBY2laYk5hTFY3dXdWeWxUWXpYUXhNcHh1UUpPMFdxWFJW?=
 =?utf-8?B?R3Jsd2RYd0k3VjNCVlJ3YnJCRzBVODZrZDY3dGRCK0FBVkZhQUVoQzVzR2cv?=
 =?utf-8?B?amZoOHFDcFEyS2RTcDdGL0l4NjMwbzFVU0w3SXFlZXdhWkg3M2lBYzBxYmQy?=
 =?utf-8?B?NVlHeGlXUDZvckdmMzdqc1BIVTdpeGVmUURqNVg1eFZpOGJmSXZ6K2YxWW5N?=
 =?utf-8?B?enFsbUxJT0tLK0dXYnI4RjRncy92R09kRGh3L0cyZENQT0VINGIrNGhqdkQr?=
 =?utf-8?B?K01IUmgyQ0hlQnJYdkp1VzFTaWQ4Rm95N3VNQmdibHhGdWRnc1JtU0srcTQr?=
 =?utf-8?B?WjN3NEdCdE1KM0g3QW5rakloekxlV3ZuWHRlemJPQk1LMlpnSUFXblUzSi85?=
 =?utf-8?B?L2IvcFRaRmFSa2lkTExuSWRBV014ek9hL241MDV3T3NCR25iMUZNMnBQWEtq?=
 =?utf-8?B?cHJ0YTBVaWZxcmkwaE1mWE92Q090YklhWUQyWk40QVVZVCtmRDR6cW5PMDhk?=
 =?utf-8?B?cGlMLzlmMk9ObWl6MjJ3S09YS0E2OE50MW41dVBmdFIzaElmY0dCTkduT3JC?=
 =?utf-8?B?U2dENHlrNFFQQllWWGNDZHRib0I1VVUyNW9JQWdtOUVCSVdzZUR1c2EzTXVF?=
 =?utf-8?B?dEY1NnZkMkg2RFFMVSsrbFlyaXBOZ1kzbVVBbU1oUkRUNHFCZTBZa3d6VW9S?=
 =?utf-8?B?YlF3MHpSZG9jMzRtWkx4VXdWcU13NDUrdG44L3A1TkJrbGd2d0xPd09YU0dy?=
 =?utf-8?B?a0ZnZXJtUzVLeXVNMElHYThka0xMV2lRU2xMUTZxdG5MZmZXdzI1RzRIRTZQ?=
 =?utf-8?B?RTlST2ZYZE82SC9YQlpsNFZXcnhkL29HZS8xNEU5clJaZmhBU1NaSG9hVUho?=
 =?utf-8?B?cGNGbzAxUXVJZ3lhUkRJTzF4UUxkWVBGbmVRWDBVTmJmanZtN0FsSFJWVUo5?=
 =?utf-8?B?T0diYzlEeGlucE9hbG15OWpWQ0FhVk5pVlIycEpkK282cVp1Y2ZLbmk0a245?=
 =?utf-8?B?bHhORXVBbVM1Z0dRWmFQcEVhNEs0WW1lamRXY0dXZVhmTFNSMmdIYTBQRE1w?=
 =?utf-8?B?NHdmczZaS0NIeDBZc0VpT1BpVFoxVGVvLzM4dHZwSExLV1dnRU9VRW1mM3N5?=
 =?utf-8?B?cnlUSHlvN1g5R1hDWWNhbVlRRGFqbGphb1Fpb2V5TW9CQTNFMXk1aDN5T0Q1?=
 =?utf-8?B?Z0pzazltUVVXK0hjdHVmSWlkZWg3aDJPMWU3QkI2a1VBNzFrNENFSDdVUzIx?=
 =?utf-8?B?Zll4ZkZ6TXI4SHlteno0emMzZFJ2YTBwcnhzR2hYMnFkbGVWTURSWWZrdXZO?=
 =?utf-8?B?ZjRrTm1oZTdVYzJNYXo2RE5NdnBHTzBQa0twM1Z1ZWIzc2RkUlpGMDYvZVJy?=
 =?utf-8?B?ZnJGekM5WjRkOHVXOEdRdzRzanorRzlzRVkrVHpsVmdvL3VOOFl1MGhweFk5?=
 =?utf-8?B?b0VNU0FoaHBJTzVpVTVWcGdPcDI2S1J5ODhWUkI2RGJLQSszOWJHcFFIVUdz?=
 =?utf-8?B?THM5M2Y0ZEcwZW5WeHRVTktRQlVmNlhhTk9hOHYrZTFoSnc5KzVqSVVtMFhk?=
 =?utf-8?B?eWRjY3lKMVZwZWtjUGd1TnJXaU1KQTRsYjVic3U1MGFVNSszNEIxSkdDUXZk?=
 =?utf-8?B?OHJEYkJ1RjVFUS9adHZBN21JczFVWnFGZ0tXT0NsampXWVd5SVhCb0lHWElJ?=
 =?utf-8?B?dVBuT1R2NlgxRitMM2J4Wjh2Z3h4Q2crQURDNWw2ckdXRUdjeWZWbkQxQXpo?=
 =?utf-8?B?S0F4aG1EWDNjRXJsVHBpSlhZRVpLcFdLRlh5N1hydkh1VWRKcFlIMEJlbEs4?=
 =?utf-8?B?cit5bWRJTlF0ZGZTTzZWM1VOMEVZTWxicW5yazJybXFHRHREblRObXBoZ0VH?=
 =?utf-8?Q?RNwFq5/p/NADvI+joxOOEAgYZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e05306-59ce-4ddc-adf9-08dbd0b43aff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 15:01:10.7507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eea6L/twy8E3WudxyvQxVANMAkwsK85diGNDvIELPhV0SzBwIpYIsKappAJQkHCUH/21rnJLZt2pNG9kejkO3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-10 12:19, Melissa Wen wrote:
> On 09/08, Harry Wentland wrote:
>> This patches introduces a new drm_colorop mode object. This
>> object represents color transformations and can be used to
>> define color pipelines.
>>
>> We also introduce the drm_colorop_state here, as well as
>> various helpers and state tracking bits.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> ---
>>  drivers/gpu/drm/Makefile            |   1 +
>>  drivers/gpu/drm/drm_atomic.c        |  79 +++++++++++++
>>  drivers/gpu/drm/drm_atomic_helper.c |  12 ++
>>  drivers/gpu/drm/drm_atomic_uapi.c   |  48 ++++++++
>>  drivers/gpu/drm/drm_colorop.c       | 169 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/drm_mode_config.c   |   7 ++
>>  drivers/gpu/drm/drm_plane_helper.c  |   2 +-
>>  include/drm/drm_atomic.h            |  82 ++++++++++++++
>>  include/drm/drm_atomic_uapi.h       |   1 +
>>  include/drm/drm_colorop.h           | 157 ++++++++++++++++++++++++++
>>  include/drm/drm_mode_config.h       |  18 +++
>>  include/drm/drm_plane.h             |   2 +
>>  include/uapi/drm/drm.h              |   3 +
>>  include/uapi/drm/drm_mode.h         |   1 +
>>  14 files changed, 581 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>>  create mode 100644 include/drm/drm_colorop.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 1855863b4d7a..941de0269709 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -16,6 +16,7 @@ drm-y := \
>>  	drm_client.o \
>>  	drm_client_modeset.o \
>>  	drm_color_mgmt.o \
>> +	drm_colorop.o \
>>  	drm_connector.o \
>>  	drm_crtc.o \
>>  	drm_displayid.o \
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 11f3a130f6f4..d734e9d5bfed 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -42,6 +42,7 @@
>>  #include <drm/drm_mode.h>
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_writeback.h>
>> +#include <drm/drm_colorop.h>
>>  
>>  #include "drm_crtc_internal.h"
>>  #include "drm_internal.h"
>> @@ -108,6 +109,7 @@ void drm_atomic_state_default_release(struct drm_atomic_state *state)
>>  	kfree(state->connectors);
>>  	kfree(state->crtcs);
>>  	kfree(state->planes);
>> +	kfree(state->colorops);
>>  	kfree(state->private_objs);
>>  }
>>  EXPORT_SYMBOL(drm_atomic_state_default_release);
>> @@ -139,6 +141,10 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
>>  				sizeof(*state->planes), GFP_KERNEL);
>>  	if (!state->planes)
>>  		goto fail;
>> +	state->colorops = kcalloc(dev->mode_config.num_colorop,
>> +				  sizeof(*state->colorops), GFP_KERNEL);
>> +	if (!state->colorops)
>> +		goto fail;
>>  
>>  	state->dev = dev;
>>  
>> @@ -244,6 +250,20 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>>  		state->planes[i].new_state = NULL;
>>  	}
>>  
>> +	for (i = 0; i < config->num_colorop; i++) {
>> +		struct drm_colorop *colorop = state->colorops[i].ptr;
>> +
>> +		if (!colorop)
>> +			continue;
>> +
>> +		drm_colorop_atomic_destroy_state(colorop,
>> +						 state->colorops[i].state);
>> +		state->colorops[i].ptr = NULL;
>> +		state->colorops[i].state = NULL;
>> +		state->colorops[i].old_state = NULL;
>> +		state->colorops[i].new_state = NULL;
>> +	}
>> +
>>  	for (i = 0; i < state->num_private_objs; i++) {
>>  		struct drm_private_obj *obj = state->private_objs[i].ptr;
>>  
>> @@ -562,6 +582,65 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>>  }
>>  EXPORT_SYMBOL(drm_atomic_get_plane_state);
>>  
>> +
>> +/**
>> + * drm_atomic_get_colorop_state - get colorop state
>> + * @state: global atomic state object
>> + * @colorop: colorop to get state object for
>> + *
>> + * This function returns the colorop state for the given colorop, allocating it
>> + * if needed. It will also grab the relevant plane lock to make sure that the
>> + * state is consistent.
>> + *
>> + * Returns:
>> + *
>> + * Either the allocated state or the error code encoded into the pointer. When
>> + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
>> + * entire atomic sequence must be restarted. All other errors are fatal.
>> + */
>> +struct drm_colorop_state *
>> +drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>> +			     struct drm_colorop *colorop)
>> +{
>> +	int ret, index = drm_colorop_index(colorop);
>> +	struct drm_colorop_state *colorop_state;
>> +	struct drm_plane_state *plane_state;
>> +
>> +	WARN_ON(!state->acquire_ctx);
>> +
>> +	colorop_state = drm_atomic_get_existing_colorop_state(state, colorop);
>> +	if (colorop_state)
>> +		return colorop_state;
>> +
>> +	/* TODO where is the unlock? */
> 
> I understand that this is tracked by acquire-ctx and unlocked by
> `drm_modeset_drop_locks()` (?)
> 

I think you're right. I've left it here as a reminder to review the locking.

Harry

>> +	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
>> +	if (!colorop_state)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	state->colorops[index].state = colorop_state;
>> +	state->colorops[index].ptr = colorop;
>> +	state->colorops[index].old_state = colorop->state;
>> +	state->colorops[index].new_state = colorop_state;
>> +	colorop_state->state = state;
>> +
>> +	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
>> +		       colorop->base.id, colorop_state, state);
>> +
>> +	/* TODO is this necessary? */
>> +
>> +	plane_state = drm_atomic_get_plane_state(state,
>> +						 colorop->plane);
>> +	if (IS_ERR(plane_state))
>> +		return ERR_CAST(plane_state);
>> +
>> +	return colorop_state;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_get_colorop_state);
>> +
>>  static bool
>>  plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>>  		     const struct drm_plane_state *new_plane_state)
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index d579fd8f7cb8..0472f6182c0a 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -2921,6 +2921,8 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>  	struct drm_plane *plane;
>>  	struct drm_plane_state *old_plane_state, *new_plane_state;
>> +	struct drm_colorop *colorop;
>> +	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
>>  	struct drm_crtc_commit *commit;
>>  	struct drm_private_obj *obj;
>>  	struct drm_private_state *old_obj_state, *new_obj_state;
>> @@ -2998,6 +3000,16 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>>  		}
>>  	}
>>  
>> +	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
>> +		WARN_ON(colorop->state != old_colorop_state);
>> +
>> +		old_colorop_state->state = state;
>> +		new_colorop_state->state = NULL;
>> +
>> +		state->colorops[i].state = old_colorop_state;
>> +		colorop->state = new_colorop_state;
>> +	}
>> +
>>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>>  		WARN_ON(plane->state != old_plane_state);
>>  
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index d867e7f9f2cd..b1aa752c1848 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -34,6 +34,7 @@
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_writeback.h>
>>  #include <drm/drm_vblank.h>
>> +#include <drm/drm_colorop.h>
>>  
>>  #include <linux/dma-fence.h>
>>  #include <linux/uaccess.h>
>> @@ -642,6 +643,26 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>  	return 0;
>>  }
>>  
>> +
>> +static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>> +		struct drm_colorop_state *state, struct drm_file *file_priv,
>> +		struct drm_property *property, uint64_t val)
>> +{
>> +	drm_dbg_atomic(colorop->dev,
>> +			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
>> +			colorop->base.id,
>> +			property->base.id, property->name);
>> +	return -EINVAL;
>> +}
>> +
>> +static int
>> +drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>> +		const struct drm_colorop_state *state,
>> +		struct drm_property *property, uint64_t *val)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>>  static int drm_atomic_set_writeback_fb_for_connector(
>>  		struct drm_connector_state *conn_state,
>>  		struct drm_framebuffer *fb)
>> @@ -893,6 +914,16 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>>  				plane->state, property, val);
>>  		break;
>>  	}
>> +	case DRM_MODE_OBJECT_COLOROP: {
>> +		struct drm_colorop *colorop = obj_to_colorop(obj);
>> +
>> +		if (colorop->plane)
>> +			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
>> +
>> +		ret = drm_atomic_colorop_get_property(colorop,
>> +				colorop->state, property, val);
>> +		break;
>> +	}
>>  	default:
>>  		ret = -EINVAL;
>>  		break;
>> @@ -1027,6 +1058,23 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>  		ret = drm_atomic_plane_set_property(plane,
>>  				plane_state, file_priv,
>>  				prop, prop_value);
>> +
>> +		break;
>> +	}
>> +	case DRM_MODE_OBJECT_COLOROP: {
>> +		struct drm_colorop *colorop = obj_to_colorop(obj);
>> +		struct drm_colorop_state *colorop_state;
>> +
>> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
>> +		if (IS_ERR(colorop_state)) {
>> +			ret = PTR_ERR(colorop_state);
>> +			break;
>> +		}
>> +
>> +		ret = drm_atomic_colorop_set_property(colorop,
>> +				colorop_state, file_priv,
>> +				prop, prop_value);
>> +
>>  		break;
>>  	}
>>  	default:
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> new file mode 100644
>> index 000000000000..78d6a0067f5b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -0,0 +1,169 @@
>> +/*
>> + * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * Authors: AMD
>> + *
>> + */
>> +
>> +#include <drm/drm_colorop.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_plane.h>
>> +
>> +#include "drm_crtc_internal.h"
>> +
>> +/* TODO big colorop doc, including properties, etc. */
>> +
>> +/* Init Helpers */
>> +
>> +int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
>> +		     struct drm_plane *plane)
>> +{
>> +	struct drm_mode_config *config = &dev->mode_config;
>> +	int ret = 0;
>> +
>> +	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
>> +	if (ret)
>> +		return ret;
>> +
>> +	colorop->base.properties = &colorop->properties;
>> +	colorop->dev = dev;
>> +	colorop->plane = plane;
>> +
>> +	list_add_tail(&colorop->head, &config->colorop_list);
>> +	colorop->index = config->num_colorop++;
>> +
>> +	/* add properties */
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_colorop_init);
>> +
>> +void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
>> +						 struct drm_colorop_state *state)
>> +{
>> +	memcpy(state, colorop->state, sizeof(*state));
>> +}
>> +
>> +struct drm_colorop_state *
>> +drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop)
>> +{
>> +	struct drm_colorop_state *state;
>> +
>> +	if (WARN_ON(!colorop->state))
>> +		return NULL;
>> +
>> +	state = kmalloc(sizeof(*state), GFP_KERNEL);
>> +	if (state)
>> +		__drm_atomic_helper_colorop_duplicate_state(colorop, state);
>> +
>> +	return state;
>> +}
>> +
>> +
>> +void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>> +				      struct drm_colorop_state *state)
>> +{
>> +	kfree(state);
>> +}
>> +
>> +/**
>> + * __drm_colorop_destroy_state - release colorop state
>> + * @state: colorop state object to release
>> + *
>> + * Releases all resources stored in the colorop state without actually freeing
>> + * the memory of the colorop state. This is useful for drivers that subclass the
>> + * colorop state.
>> + */
>> +void __drm_colorop_destroy_state(struct drm_colorop_state *state)
>> +{
>> +	/* TODO might need this later */
>> +}
>> +
>> +/**
>> + * drm_colorop_destroy_state - default state destroy hook
>> + * @colorop: drm colorop
>> + * @state: colorop state object to release
>> + *
>> + * Default colorop state destroy hook for drivers which don't have their own
>> + * subclassed colorop state structure.
>> + */
>> +void drm_colorop_destroy_state(struct drm_colorop *colorop,
>> +					   struct drm_colorop_state *state)
>> +{
>> +	kfree(state);
>> +}
>> +EXPORT_SYMBOL(drm_colorop_destroy_state);
>> +
>> +/**
>> + * __drm_colorop_state_reset - resets colorop state to default values
>> + * @colorop_state: atomic colorop state, must not be NULL
>> + * @colorop: colorop object, must not be NULL
>> + *
>> + * Initializes the newly allocated @colorop_state with default
>> + * values. This is useful for drivers that subclass the CRTC state.
>> + */
>> +void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>> +					   struct drm_colorop *colorop)
>> +{
>> +	colorop_state->colorop = colorop;
>> +}
>> +EXPORT_SYMBOL(__drm_colorop_state_reset);
>> +
>> +/**
>> + * __drm_colorop_reset - reset state on colorop
>> + * @colorop: drm colorop
>> + * @colorop_state: colorop state to assign
>> + *
>> + * Initializes the newly allocated @colorop_state and assigns it to
>> + * the &drm_crtc->state pointer of @colorop, usually required when
>> + * initializing the drivers or when called from the &drm_colorop_funcs.reset
>> + * hook.
>> + *
>> + * This is useful for drivers that subclass the colorop state.
>> + */
>> +void __drm_colorop_reset(struct drm_colorop *colorop,
>> +				     struct drm_colorop_state *colorop_state)
>> +{
>> +	if (colorop_state)
>> +		__drm_colorop_state_reset(colorop_state, colorop);
>> +
>> +	colorop->state = colorop_state;
>> +}
>> +
>> +/**
>> + * drm_colorop_reset - reset colorop atomic state
>> + * @colorop: drm colorop
>> + *
>> + * Resets the atomic state for @colorop by freeing the state pointer (which might
>> + * be NULL, e.g. at driver load time) and allocating a new empty state object.
>> + */
>> +void drm_colorop_reset(struct drm_colorop *colorop)
>> +{
>> +	if (colorop->state)
>> +		__drm_colorop_destroy_state(colorop->state);
>> +
>> +	kfree(colorop->state);
>> +	colorop->state = kzalloc(sizeof(*colorop->state), GFP_KERNEL);
>> +
>> +	if (colorop->state)
>> +		__drm_colorop_reset(colorop, colorop->state);
>> +}
>> +EXPORT_SYMBOL(drm_colorop_reset);
>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 87eb591fe9b5..5bdcf71e1ae0 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -29,6 +29,7 @@
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_mode_config.h>
>>  #include <drm/drm_print.h>
>> +#include <drm/drm_colorop.h>
>>  #include <linux/dma-resv.h>
>>  
>>  #include "drm_crtc_internal.h"
>> @@ -184,11 +185,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>>  void drm_mode_config_reset(struct drm_device *dev)
>>  {
>>  	struct drm_crtc *crtc;
>> +	struct drm_colorop *colorop;
>>  	struct drm_plane *plane;
>>  	struct drm_encoder *encoder;
>>  	struct drm_connector *connector;
>>  	struct drm_connector_list_iter conn_iter;
>>  
>> +	drm_for_each_colorop(colorop, dev)
>> +		drm_colorop_reset(colorop);
>> +
>>  	drm_for_each_plane(plane, dev)
>>  		if (plane->funcs->reset)
>>  			plane->funcs->reset(plane);
>> @@ -415,6 +420,7 @@ int drmm_mode_config_init(struct drm_device *dev)
>>  	INIT_LIST_HEAD(&dev->mode_config.property_list);
>>  	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
>>  	INIT_LIST_HEAD(&dev->mode_config.plane_list);
>> +	INIT_LIST_HEAD(&dev->mode_config.colorop_list);
>>  	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
>>  	idr_init_base(&dev->mode_config.object_idr, 1);
>>  	idr_init_base(&dev->mode_config.tile_idr, 1);
>> @@ -436,6 +442,7 @@ int drmm_mode_config_init(struct drm_device *dev)
>>  	dev->mode_config.num_crtc = 0;
>>  	dev->mode_config.num_encoder = 0;
>>  	dev->mode_config.num_total_plane = 0;
>> +	dev->mode_config.num_colorop = 0;
>>  
>>  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
>>  		struct drm_modeset_acquire_ctx modeset_ctx;
>> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
>> index c91e454eba09..69faa0eeb27f 100644
>> --- a/drivers/gpu/drm/drm_plane_helper.c
>> +++ b/drivers/gpu/drm/drm_plane_helper.c
>> @@ -318,4 +318,4 @@ int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_sta
>>  						   DRM_PLANE_NO_SCALING,
>>  						   false, false);
>>  }
>> -EXPORT_SYMBOL(drm_plane_helper_atomic_check);
>> +EXPORT_SYMBOL(drm_plane_helper_atomic_check);
>> \ No newline at end of file
>> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
>> index 92586ab55ef5..dca8fc26ad71 100644
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -30,6 +30,7 @@
>>  
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_util.h>
>> +#include <drm/drm_colorop.h>
>>  
>>  /**
>>   * struct drm_crtc_commit - track modeset commits on a CRTC
>> @@ -157,6 +158,11 @@ struct drm_crtc_commit {
>>  	bool abort_completion;
>>  };
>>  
>> +struct __drm_colorops_state {
>> +	struct drm_colorop *ptr;
>> +	struct drm_colorop_state *state, *old_state, *new_state;
>> +};
>> +
>>  struct __drm_planes_state {
>>  	struct drm_plane *ptr;
>>  	struct drm_plane_state *state, *old_state, *new_state;
>> @@ -398,6 +404,7 @@ struct drm_atomic_state {
>>  	 * states.
>>  	 */
>>  	bool duplicated : 1;
>> +	struct __drm_colorops_state *colorops;
>>  	struct __drm_planes_state *planes;
>>  	struct __drm_crtcs_state *crtcs;
>>  	int num_connector;
>> @@ -501,6 +508,9 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
>>  struct drm_plane_state * __must_check
>>  drm_atomic_get_plane_state(struct drm_atomic_state *state,
>>  			   struct drm_plane *plane);
>> +struct drm_colorop_state *
>> +drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>> +			     struct drm_colorop *colorop);
>>  struct drm_connector_state * __must_check
>>  drm_atomic_get_connector_state(struct drm_atomic_state *state,
>>  			       struct drm_connector *connector);
>> @@ -623,6 +633,55 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
>>  	return state->planes[drm_plane_index(plane)].new_state;
>>  }
>>  
>> +
>> +/**
>> + * drm_atomic_get_existing_colorop_state - get colorop state, if it exists
>> + * @state: global atomic state object
>> + * @colorop: colorop to grab
>> + *
>> + * This function returns the colorop state for the given colorop, or NULL
>> + * if the colorop is not part of the global atomic state.
>> + *
>> + * This function is deprecated, @drm_atomic_get_old_colorop_state or
>> + * @drm_atomic_get_new_colorop_state should be used instead.
>> + */
>> +static inline struct drm_colorop_state *
>> +drm_atomic_get_existing_colorop_state(struct drm_atomic_state *state,
>> +				    struct drm_colorop *colorop)
>> +{
>> +	return state->colorops[drm_colorop_index(colorop)].state;
>> +}
>> +
>> +/**
>> + * drm_atomic_get_old_colorop_state - get colorop state, if it exists
>> + * @state: global atomic state object
>> + * @colorop: colorop to grab
>> + *
>> + * This function returns the old colorop state for the given colorop, or
>> + * NULL if the colorop is not part of the global atomic state.
>> + */
>> +static inline struct drm_colorop_state *
>> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
>> +			       struct drm_colorop *colorop)
>> +{
>> +	return state->colorops[drm_colorop_index(colorop)].old_state;
>> +}
>> +
>> +/**
>> + * drm_atomic_get_new_colorop_state - get colorop state, if it exists
>> + * @state: global atomic state object
>> + * @colorop: colorop to grab
>> + *
>> + * This function returns the new colorop state for the given colorop, or
>> + * NULL if the colorop is not part of the global atomic state.
>> + */
>> +static inline struct drm_colorop_state *
>> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
>> +			       struct drm_colorop *colorop)
>> +{
>> +	return state->colorops[drm_colorop_index(colorop)].new_state;
>> +}
>> +
>>  /**
>>   * drm_atomic_get_existing_connector_state - get connector state, if it exists
>>   * @state: global atomic state object
>> @@ -870,6 +929,29 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>>  			     (new_crtc_state) = (__state)->crtcs[__i].new_state, \
>>  			     (void)(new_crtc_state) /* Only to avoid unused-but-set-variable warning */, 1))
>>  
>> +/**
>> + * for_each_oldnew_colorop_in_state - iterate over all colorops in an atomic update
>> + * @__state: &struct drm_atomic_state pointer
>> + * @colorop: &struct drm_colorop iteration cursor
>> + * @old_colorop_state: &struct drm_colorop_state iteration cursor for the old state
>> + * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
>> + * @__i: int iteration cursor, for macro-internal use
>> + *
>> + * This iterates over all colorops in an atomic update, tracking both old and
>> + * new state. This is useful in places where the state delta needs to be
>> + * considered, for example in atomic check functions.
>> + */
>> +#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
>> +	for ((__i) = 0;							\
>> +	     (__i) < (__state)->dev->mode_config.num_colorop;	\
>> +	     (__i)++)							\
>> +		for_each_if ((__state)->colorops[__i].ptr &&		\
>> +			     ((colorop) = (__state)->colorops[__i].ptr,	\
>> +			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
>> +			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
>> +			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
>> +
>> +
>>  /**
>>   * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
>>   * @__state: &struct drm_atomic_state pointer
>> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
>> index 4c6d39d7bdb2..70a115d523cd 100644
>> --- a/include/drm/drm_atomic_uapi.h
>> +++ b/include/drm/drm_atomic_uapi.h
>> @@ -37,6 +37,7 @@ struct drm_crtc;
>>  struct drm_connector_state;
>>  struct dma_fence;
>>  struct drm_framebuffer;
>> +struct drm_colorop;
>>  
>>  int __must_check
>>  drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> new file mode 100644
>> index 000000000000..3dd169b0317d
>> --- /dev/null
>> +++ b/include/drm/drm_colorop.h
>> @@ -0,0 +1,157 @@
>> +/*
>> + * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * Authors: AMD
>> + *
>> + */
>> +
>> +#ifndef __DRM_COLOROP_H__
>> +#define __DRM_COLOROP_H__
>> +
>> +#include <drm/drm_mode_object.h>
>> +#include <drm/drm_mode.h>
>> +#include <drm/drm_property.h>
>> +
>> +/**
>> + * struct drm_colorop_state - mutable colorop state
>> + */
>> +struct drm_colorop_state {
>> +	/** @colorop: backpointer to the colorop */
>> +	struct drm_colorop *colorop;
>> +
>> +	/* colorop properties */
>> +
>> +	/** @state: backpointer to global drm_atomic_state */
>> +	struct drm_atomic_state *state;
>> +};
>> +
>> +/**
>> + * struct drm_colorop - DRM color operation control structure
>> + *
>> + * A colorop represents one color operation. They can be chained via
>> + * the 'next' pointer to build a color pipeline.
>> + */
>> +struct drm_colorop {
>> +	/** @dev: parent DRM device */
>> +	struct drm_device *dev;
>> +
>> +	/**
>> +	 * @head:
>> +	 *
>> +	 * List of all colorops on @dev, linked from &drm_mode_config.colorop_list.
>> +	 * Invariant over the lifetime of @dev and therefore does not need
>> +	 * locking.
>> +	 */
>> +	struct list_head head;
>> +
>> +	/**
>> +	 * @index: Position inside the mode_config.list, can be used as an array
>> +	 * index. It is invariant over the lifetime of the plane.
>> +	 */
>> +	unsigned index;
>> +
>> +	/* TODO do we need a separate mutex or will we tag along with the plane mutex? */
>> +
>> +	/** @base base mode object*/
>> +	struct drm_mode_object base;
>> +
>> +	/**
>> +	 * @plane:
>> +	 *
>> +	 * The plane on which the colorop sits. A drm_colorop is always unique
>> +	 * to a plane.
>> +	 */
>> +	struct drm_plane *plane;
>> +
>> +	/**
>> +	 * @state:
>> +	 *
>> +	 * Current atomic state for this colorop.
>> +	 *
>> +	 * This is protected by @mutex. Note that nonblocking atomic commits
>> +	 * access the current colorop state without taking locks. Either by
>> +	 * going through the &struct drm_atomic_state pointers, see
>> +	 * for_each_oldnew_plane_in_state(), for_each_old_plane_in_state() and
>> +	 * for_each_new_plane_in_state(). Or through careful ordering of atomic
>> +	 * commit operations as implemented in the atomic helpers, see
>> +	 * &struct drm_crtc_commit.
>> +	 *
>> +	 * TODO keep, remove, or rewrite above plane references?
>> +	 */
>> +	struct drm_colorop_state *state;
>> +
>> +	/* colorop properties */
>> +
>> +	/** @properties: property tracking for this plane */
>> +	struct drm_object_properties properties;
>> +
>> +};
>> +
>> +#define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
>> +
>> +/**
>> + * drm_crtc_find - look up a Colorop object from its ID
>> + * @dev: DRM device
>> + * @file_priv: drm file to check for lease against.
>> + * @id: &drm_mode_object ID
>> + *
>> + * This can be used to look up a Colorop from its userspace ID. Only used by
>> + * drivers for legacy IOCTLs and interface, nowadays extensions to the KMS
>> + * userspace interface should be done using &drm_property.
>> + */
>> +static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
>> +		struct drm_file *file_priv,
>> +		uint32_t id)
>> +{
>> +	struct drm_mode_object *mo;
>> +	mo = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_COLOROP);
>> +	return mo ? obj_to_colorop(mo) : NULL;
>> +}
>> +
>> +int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
>> +		     struct drm_plane *plane);
>> +
>> +struct drm_colorop_state *
>> +drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
>> +
>> +void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>> +				      struct drm_colorop_state *state);
>> +
>> +void drm_colorop_reset(struct drm_colorop *colorop);
>> +
>> +/**
>> + * drm_colorop_index - find the index of a registered colorop
>> + * @colorop: colorop to find index for
>> + *
>> + * Given a registered colorop, return the index of that colorop within a DRM
>> + * device's list of colorops.
>> + */
>> +static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
>> +{
>> +	return colorop->index;
>> +}
>> +
>> +
>> +#define drm_for_each_colorop(colorop, dev) \
>> +	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
>> +
>> +
>> +#endif /* __DRM_COLOROP_H__ */
>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
>> index e5b053001d22..f56d21d93cf0 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -505,6 +505,24 @@ struct drm_mode_config {
>>  	 */
>>  	struct list_head plane_list;
>>  
>> +	/**
>> +	 * @num_colorop:
>> +	 *
>> +	 * Number of colorop objects on this device.
>> +	 * This is invariant over the lifetime of a device and hence doesn't
>> +	 * need any locks.
>> +	 */
>> +	int num_colorop;
>> +
>> +	/**
>> +	 * @colorops_list:
>> +	 *
>> +	 * List of colorop objects linked with &drm_colorop.head. This is
>> +	 * invariant over the lifetime of a device and hence doesn't need any
>> +	 * locks.
>> +	 */
>> +	struct list_head colorop_list;
>> +
>>  	/**
>>  	 * @num_crtc:
>>  	 *
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 51291983ea44..cfb8f46b94ab 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -227,6 +227,8 @@ struct drm_plane_state {
>>  	 */
>>  	enum drm_scaling_filter scaling_filter;
>>  
>> +	struct drm_colorop *color_pipeline;
>> +
>>  	/**
>>  	 * @commit: Tracks the pending commit to prevent use-after-free conditions,
>>  	 * and for async plane updates.
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 642808520d92..dec498a44eae 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -1116,6 +1116,9 @@ extern "C" {
>>   */
>>  #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
>>  
>> +#define DRM_IOCTL_MODE_GETCOLOROPRESOURCES DRM_IOWR(0xD0, struct drm_mode_get_colorop_res)
>> +#define DRM_IOCTL_MODE_GETCOLOROP          DRM_IOWR(0xD1, struct drm_mode_get_colorop)
>> +
>>  /*
>>   * Device specific ioctls should only be in their respective headers
>>   * The device specific ioctl range is from 0x40 to 0x9f.
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index 46becedf5b2f..6dcf628def56 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -626,6 +626,7 @@ struct drm_mode_connector_set_property {
>>  #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
>>  #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
>>  #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
>> +#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
>>  #define DRM_MODE_OBJECT_ANY 0
>>  
>>  struct drm_mode_obj_get_properties {
>> -- 
>> 2.42.0
>>

