Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43F616563
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 15:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D03F10E498;
	Wed,  2 Nov 2022 14:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343EF10E498;
 Wed,  2 Nov 2022 14:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBVBNBz3Kg9DPK2PQRa737eVTNY9eCaNlxN8q1zHsGcIbMx2UjbSamgp0tXEVkPUwbP1IDTMOG77rJXLIUtrrKI1PfFW1dmdapxKuIEyhWM2qpIgKx2Auii5vL6x0Am3cJA3JmcAsLi14enAXy8LIAAtUYLeM+3V4T7YdnhWo5mChKXRpSPe971wlUVs44ln/GxwGjZOhgdWZHv6E/4htU0CgS0VA96MILuamA/fdXtlgNk1ZGvlUE1S9Y/AGEn5z2kNHUkIOtRafu1SRktlxqU9immApfgFjALg6ZJ7bil6U3y54Gz95exoo3dtoUANXLxI7dCuQ3pU/tDIbakFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERtChcq6QCZrZIHoCzMykyh3Ap6U8nh/C/8SLyu0oRI=;
 b=EWvMkjgnz5qlFudMzsu5jUxp+LytilQcTEyrmyoaeHU7arb4duenkSzsSV1mp/ihU9qJvUVtJ/6sBNJA5o0CeD0oU/Ax2HfpzczOQC9APSxLmZ+ko2t2J1qnaVfL4leQOvumDhfWu4wnyajf/+Vt1tZs0QcYCkQqVj5+9m559wn5CNSYC4j+lBGJVvPj5PpWHneiwv8FyikSLceDoxzH3aBZUpYUkWXGIlus6oMXGdpLfUL/kD1kRuHG6xqy/LtujhEcA6/fScc4O53QINPqzKxKnbrRVWG2Mcklhf4RsHjJu49ywEv7KptBDpYl3q3i9Lz+/n1K4g5uq5hjBEo9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERtChcq6QCZrZIHoCzMykyh3Ap6U8nh/C/8SLyu0oRI=;
 b=D7pJqrmbkTNlIx1lw2wFxDf5Atlq9apz6iepaYb8zN10R/8kTVetUaGVmo/JRmuO5hin1am6kSLdEa74LBnQLFhUWY0Rk3br8Vn4xVaOvWIeaE/XYECHH4kLHPqH29mJ34VK/jrzHfySCuaEvpHp79WP5T7OgYXsoy5M/Gd80yM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB6732.namprd12.prod.outlook.com (2603:10b6:303:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Wed, 2 Nov
 2022 14:57:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8db:7ef4:cd2b:2926]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8db:7ef4:cd2b:2926%4]) with mapi id 15.20.5791.022; Wed, 2 Nov 2022
 14:57:55 +0000
Message-ID: <36b34da1-914c-898f-750a-e02790f48a17@amd.com>
Date: Wed, 2 Nov 2022 10:57:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/amd/display: add parameter backlight_min
Content-Language: en-US
To: Filip Moc <dev@moc6.cz>
References: <Y117XNaSP6/8bH+3@moc6.cz>
 <23cd28ea-59ed-7687-0912-506356b4b24d@amd.com> <Y2E8SsisrDn/f6+c@moc6.cz>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y2E8SsisrDn/f6+c@moc6.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0004.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 826bb71a-7455-4515-355f-08dabce29fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLZYtIHHk6oJaR0eFYN8CR3dmS6t04jVz4sMhlHLScWsn0wO/aFxaXBFFxa/P8wgXvg0shBhWuVUntHeFBsh2dyrXmt98wmjPtoCTLtHpDfZ3xjOW0qB6Fn7Jc1pbVRrhwo2qGnEi0p8gFchXILuhi1cgVg4jmaof5KsZ3imaol1kr1G9UVIW+nL1bAfW4jx7S3vDppEf8cJf9IQ1pxt8/tdWEiEtJZioqJwBz+PngTuBtoNfQlNsWIyzepOAcE176fFbx+F/1sp9VMTI3DccyQZvwo5DvcPQjH7+uyOxMsOm2pDoPARtzgBnMuargwqIy82eqzraIYiGspK1SqBB1dvrZ62r4OcsrUBrLUAYjrYZHvmQ0CjaUBIGrT3i+t64CqV7k/vm6cpOoDQuUM/HNclQRUPDY1fepyV8DhE6GbEOqd0G9gFWr+Hzzq0jsB/pMBu/zXoczqqz64TejWM23lIFCelPBoct9W+FfvJQSYh7hHJn0HDwdYnGG7V+oaR6jcLuLtLMRvJcFV13kIjdh6EjBTQxT9/+oFyYdZ7zpruhdNS0CWUnIF7Pf2TykUfgON42U+GUTdT1yj+i8bKEiKfOKuIjNHqiKpCrZz/qpFA5CqR4cus5GpMiAcx18+rpQEUkmCzxQms5NPXTZv7LLOC6cCtMXTj7iHG5Qt9OznLnG2nuqHqli7UN3qK0kM292KNf5a97gY0SP/HBAPKifJWUjz2GDJY2c+aEV7cde2X7gGT6Eo+HHHh1jJBjUlQQL6LyXTehKHIV9rxBPSJbHsNr54fAnjO/f2gWLugTr+vS8hinkdmJlclodGyFWH0vUlFZOFys0oBrtk19iIPyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(54906003)(316002)(41300700001)(6512007)(8936002)(5660300002)(38100700002)(6916009)(4326008)(66556008)(86362001)(66476007)(53546011)(6506007)(966005)(26005)(478600001)(186003)(2616005)(66946007)(83380400001)(44832011)(31696002)(6666004)(6486002)(8676002)(36756003)(2906002)(4001150100001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUJ5QitpRFlEWHVWRTRXM3N5UHAySlVIM1RaUDJwMFpUV2Exc2hmamYzQ2py?=
 =?utf-8?B?NVozbm02Qy9CblEwcS9HOVJlRGk5cGd1dGFMOE1hY2J0dU5vaWFNa0JXeDhr?=
 =?utf-8?B?ZU1KeERLaUw3b3lHUmRTSENYRU1HTVo0U0ZMTkZQR1RZSkhCT0g3eVFTbEtB?=
 =?utf-8?B?UkhLeUhYTW4raW40V2pRYWpTQktsL09ma1BaRnQ5bFdsYTd4RzVlRUVHbW9z?=
 =?utf-8?B?V2pMZHdJTzIwV0NudFU0Z2krY3g0V1pPZVVCWVlsWGZ5U1RmRVZsQ3RHQ1Bv?=
 =?utf-8?B?N2FySzNMcTR0U1BGaGdCejlEMWNxQ1I1N1poOWtNb0FxVS93SjRPaGhQL0R0?=
 =?utf-8?B?RU9ORzAyTWpZSFdGeU10bmZmalpFc0grMnRZK3ZUaWtPODdoMVRXQ1lFc1Bt?=
 =?utf-8?B?RFFKbzlvVGZhNXZQT2ZIb0lNYStwTVUzRXdSL25ESnJ3bjZuU3FKNk1CQ3BF?=
 =?utf-8?B?ZWZxbWZKYkNlRDlndWYzSDBKTUJBdmxLT0Zhb1BHNkFJWDJTaGorSXZsRjYr?=
 =?utf-8?B?ZldNRkwvR05KWG9FSE45Z3pBSnNsS1FoZnlhRElXRFFzclZyRk9xT0ZFQkhQ?=
 =?utf-8?B?SVMrWEY2dm1SR2o0R0p2UDNZS211S1hqNVg4WFZyMWxlVWlZSzlmVDVkdzJq?=
 =?utf-8?B?Q3NLV0pxM28rTmJDcWV2dUJ1dzIwb3gvQ3pxOWxwaloxOXpqWVRjaUtBeFZq?=
 =?utf-8?B?T0JFSFpRc2xubU5HUjIzYTdjMTlaQlIwUFVzaHNZSjNOWjE0QlVCeHh1Ykhq?=
 =?utf-8?B?QjlwdVkxcWVSQU1uYzNZNEVPS1VuWTVsMlZ3VDBoSDVtUWZuVGgxZXJFdkpL?=
 =?utf-8?B?Vi8relBDMVo5aXNKVStLblk4Ykh5QmFtSmVrOW9WWGd4WlcrckNIK3M0K1Np?=
 =?utf-8?B?YVkvOGVQZDZEZVV4ZHplSVd4SFlpTGR5dmRGSHpnTm9nVGZFNHZFMDYvcVJR?=
 =?utf-8?B?UTdkUzRvL3o3N0xwTm85eVNBV1kxN3l0RXNpUko0SEVFTWZQd3ZaY3F0c2hT?=
 =?utf-8?B?ZDc5MmZSaE1ZMnF6cnMxd1FJa2JDSnVNWnMxNkc0WlFjKzk1MFVEUW9YSHpO?=
 =?utf-8?B?N1dRMGVOajJIOUk2NC8veEFKQzFsWUx6YVUzZXNoMzl3c2hQZzZaUFpzTjJS?=
 =?utf-8?B?aWdWRDJDMEk3SFFkSjNSQnV4OXBCTEJjbjB4MklkSEh3UW4yeUpvU0E3Zng0?=
 =?utf-8?B?WDRLN0VHczJqQUh3MDJsbEpRTEtUQ2lKSndzaVJRT25NbmhaLytBWkdQL0Js?=
 =?utf-8?B?VHhCbE1LVjlYaStJaWo2WisrVUZsQkh3alYzeDRGdS8rRTh4ZDJNcHpYeTdX?=
 =?utf-8?B?S3JXQ0w0d0dQQ0hSOFlrQ25YdDVUUWlIakwyOVJYOWpwMUVudnJMME5GODJS?=
 =?utf-8?B?NGFjQy9SMVpzUlRpcy9SVWpDblhwbTRGNWFuNjhvUDY2YTlNS2M1WjBQbVBJ?=
 =?utf-8?B?SytSSXFsSlBhUWxvSVlGODh4aHFTVzNVZ0NiT2JPOWxNdzhsazNXVSt5U09F?=
 =?utf-8?B?OEJtSDFEcDBrMko5K1lUSXBmU1dPVTVuN21UKzVJUjlTSkZnVEFaTitOcHBx?=
 =?utf-8?B?NytvNnVEVTVoWEFXczBmOHdUZ2xRL2pGRFVLbzNFdWE1cDI4NDFuM1JVTnFq?=
 =?utf-8?B?dHVkdmtSQXpZRGN5U2RRZVpCSFZ4cmFiN1pUQksvWlhocE1OQ05GeWwvL1F2?=
 =?utf-8?B?Q1dOYTFXdjNFcVBlQ0JTcnBVd0lEUmZoV25UU1FjM1czdVFsbmtLeHlmQkRB?=
 =?utf-8?B?WTRUWjVTZjZ1MW5ReE9xMUo3NkdqUEl3OUdRZDZUS3ZtbDE0c0dobC9kY2Fl?=
 =?utf-8?B?OVA4bGRFT0kxMVdmTi9OWVJLVDN4c3V0NWxCdGlBbjBSZ0lRSlR2SWw1dmM2?=
 =?utf-8?B?dXJNaWZsL3BEc2N2WkZFdklTOXJXQ2dvV0l0NXF6emNYTFdTWmtEYjA2bnlm?=
 =?utf-8?B?ZzdhdExCZlVkcncxQzhDTTVqVWtXcW1ZOUk2WFM0d1Y3YXJGMzByY1YvNjlS?=
 =?utf-8?B?bnU5ZzkwTFBmY2QzLy9tNW13aU9LQlJacGp2a0VlQTk5SVNvdW1oZ1BpdGIw?=
 =?utf-8?B?YmZuK3Byak5GN2hzVVRnRnBTWXNMRHNYK2JPcWZnLytkbW12WUZmZWh0Qy9k?=
 =?utf-8?Q?SIa1y0eftV1Sy3QGCgYW9AioH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826bb71a-7455-4515-355f-08dabce29fbd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 14:57:55.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZKvV9xDzfYS1dxSzLYyNR+ImhO0vzJnJkpxgj8Ayu/RZrYGs/9UGhSg4t2fM6ScGfgicERe1d4G/qQL6j3Zqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6732
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-11-01 11:33, Filip Moc wrote:
> Hello Harry,
> 
> thank you for your response.
> 
>> amdgpu.backlight_min=2:-1
> 
> almost :-)
> 
> Array elements in module parameters are separated by commas not colons.
> So for cmdline it should look like this:
> amdgpu.backlight_min=2,-1
> 
> Though you can just drop the ,-1 relying on kernel leaving the rest of array
> untouched. Which I would recommend as there is no point for user to
> follow AMDGPU_DM_MAX_NUM_EDP.
> Only when you need to override some other display than display 0 then you may
> need to use -1. E.g. backlight_min=-1,2 overrides display 1 to min backlight=2
> while keeping display 0 with no override.
> 
> When amdgpu is loaded as a kernel module, backlight_min can also be passed as a
> parameter to modprobe, e.g.:
> modprobe backlight_min=2
> So in that case you probably want to add something like
> options amdgpu backlight_min=2 to /etc/modprobe.d/amdgpu.conf
> (and also run update-initramfs if amdgpu is loaded by initramfs).
> 
> I'll add some examples to commit message in v2.
> 

Awesome. Thanks.

Harry

> Filip
> 
> 
> V Mon, Oct 31, 2022 at 10:24:25AM -0400, Harry Wentland napsal(a):
>> On 2022-10-29 15:13, Filip Moc wrote:
>>> There are some devices on which amdgpu won't allow user to set brightness
>>> to sufficiently low values even though the hardware would support it just
>>> fine.
>>>
>>> This usually happens in two cases when either configuration of brightness
>>> levels via ACPI/ATIF is not available and amdgpu falls back to defaults
>>> (currently 12 for minimum level) which may be too high for some devices or
>>> even the configuration via ATIF is available but the minimum brightness
>>> level provided by the manufacturer is set to unreasonably high value.
>>>
>>> In either case user can use this new module parameter to adjust the
>>> minimum allowed backlight brightness level.
>>>
>>
>> Thanks for this patch and covering all the bases.
>>
>> It might be useful to have an example in the commit description on
>> how to set the array property. I assume it looks like this if I
>> wanted to set the first device to a minimum of 2 and leave the default
>> for the 2nd one:
>>
>> amdgpu.backlight_min=2:-1
>>
>> Either way, this patch is
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>
>> Harry
>>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439 
>>> Signed-off-by: Filip Moc <dev@moc6.cz>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
>>>  3 files changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 0e6ddf05c23c..c5445402c49d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
>>>  extern uint amdgpu_dc_visual_confirm;
>>>  extern uint amdgpu_dm_abm_level;
>>>  extern int amdgpu_backlight;
>>> +#ifdef CONFIG_DRM_AMD_DC
>>> +extern int amdgpu_backlight_override_min[];
>>> +#endif
>>>  extern struct amdgpu_mgpu_info mgpu_info;
>>>  extern int amdgpu_ras_enable;
>>>  extern uint amdgpu_ras_mask;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 16f6a313335e..f2fb549ac52f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -43,6 +43,7 @@
>>>  #include "amdgpu_irq.h"
>>>  #include "amdgpu_dma_buf.h"
>>>  #include "amdgpu_sched.h"
>>> +#include "amdgpu_dm.h"
>>>  #include "amdgpu_fdinfo.h"
>>>  #include "amdgpu_amdkfd.h"
>>>  
>>> @@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
>>>  MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
>>>  module_param_named(backlight, amdgpu_backlight, bint, 0444);
>>>  
>>> +/**
>>> + * DOC: backlight_min (array of int)
>>> + * Override minimum allowed backlight brightness signal (per display).
>>> + * Must be less than the maximum brightness signal.
>>> + * Negative value means no override.
>>> + *
>>> + * Defaults to all -1 (no override on any display).
>>> + */
>>> +#ifdef CONFIG_DRM_AMD_DC
>>> +int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
>>> +MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
>>> +module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
>>> +#endif
>>> +
>>>  /**
>>>   * DOC: tmz (int)
>>>   * Trusted Memory Zone (TMZ) is a method to protect data being written
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index eb4ce7216104..e2c36ba93d05 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
>>>  	dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
>>>  	dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
>>>  #endif
>>> +
>>> +	if (amdgpu_backlight_override_min[bl_idx] >= 0) {
>>> +		if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
>>> +			DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
>>> +				  bl_idx,
>>> +				  dm->backlight_caps[bl_idx].min_input_signal,
>>> +				  amdgpu_backlight_override_min[bl_idx]);
>>> +			dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
>>> +		} else {
>>> +			DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
>>> +				  bl_idx,
>>> +				  amdgpu_backlight_override_min[bl_idx],
>>> +				  dm->backlight_caps[bl_idx].max_input_signal);
>>> +		}
>>> +	}
>>>  }
>>>  
>>>  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
>>>
>>> base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357
>>

