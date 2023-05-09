Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9366FD2DC
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 00:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A5810E43E;
	Tue,  9 May 2023 22:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C6810E43C;
 Tue,  9 May 2023 22:55:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTMUZ8BJBOJPOZnTzfvs1Vb/aUGBxh6+RXeux6rAMNR9uv443R10Sm2XQVXfd9sSpzCwt7POl8nfwCMTbF/ro+xpfK1wC77YfAL8XAjHH+IO0ZQ+FZjqptHIZGYKLEZmMUxI1jaeUgI/C8ilIOSA5UG2rZxZhBf0ZVNWZQPtV8OBX2X3ZEv287D7qlgqBb541yKidqi7BYqk5py/lKyvddhY5nRdyAJ55sdaOAAbcCJ/CoKOpe5apyd7DbxIGw+3yjtfba3FOMxGZrojuMM5bRmh+SVRuwptifSKbrlkrjEgG1XWW6/MU0W0sJjEG/rxeZEa5/DlZMb2xTjCSWZxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcwkuP9fq45XHaoRgsYGy4XSJw1WXH0JSGS4LoSTWMU=;
 b=IGF2YSqWEyE9RILDKXipXNXM6M34yYOsQGxpaDTHpL71K/4r0cOGbDx4aq71A1glUG7yzpmRCNmxkD3UDC692JjV2rvCJGf16ByhIUrIgAgkUZ0hU/C78ljfo+vk/1/wuEIIGDhU+ZfRoKGPDmWYYyynTzhNC/ITe4RDNtHWpzyvq7KjiPFq6Gju7YqPIeVmBt/qAUR/KC8MtFjEKoOlSKtYdK96zMWJLRy9zOUXiC81QNgILKCASxF0JCCWtmxC3Xfbiv4FMUbZZMh9UWFpFcND/OnY/WDIjWlC1xtikU9vv0WvuxiWeEMCMt+gI6ZMO14zBv8rDlgW2zOgPHmdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcwkuP9fq45XHaoRgsYGy4XSJw1WXH0JSGS4LoSTWMU=;
 b=hupzyo2vMUk/QboGooSwJMqo7qXchTV9Z1B1QR7Dmw6Qvyk/uFEqO73Z3FRmkhTa+8xB+KuYSFli108EVBHKOzyKrSdZL+OP/amgzUq598t9ihCVX5Kj5i2prmc0g2j5/UtKs7um9ljdB4lUCXCRzqWdrCAigawjSHF9m7GyAzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4975.namprd12.prod.outlook.com (2603:10b6:5:1bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 22:55:50 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%6]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 22:55:50 +0000
Message-ID: <c46e0ec2-87cc-83a8-c371-a7b11ba8ea2f@amd.com>
Date: Tue, 9 May 2023 18:55:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 12/40] drm/amd/display: add plane HDR multiplier
 driver-private property
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-13-mwen@igalia.com>
 <5bbd49b6-ad09-607f-521d-96f9d8eb3b20@amd.com>
 <20230509163701.57lf22phumicqv37@mail.igalia.com>
 <CAEZNXZAfq_6EZHBhBXjMPwOuU10rwKe3SPJpz1hetux=HRF4CQ@mail.gmail.com>
 <fc308aca-4ecf-7db9-3491-9ede18ee5562@amd.com>
 <CAEZNXZAFjn2zOEr33qZvEC5h-P4OowJ7sB8MVhBHAzntXBDgjw@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAEZNXZAFjn2zOEr33qZvEC5h-P4OowJ7sB8MVhBHAzntXBDgjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 35065936-1543-4b2a-15f1-08db50e088d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qbkH9WZnnJtTpi/MkDI5gDFx0VIdnIsfEK2ShqfDq7KqSmDD5if2wSZU3Kks4EmCo/mqL+4OoC3xaV3KNvAQjSxaHyIsvxcmfoArOEz/dnII8ctiz/gACZ3pYppBWMEXQtLDGhMSjzJ2a4qU0CMxgBu4rJYq4gBlxcq0ZJYXpR/3hD4Nb+88xf7Xat4nTutL0j/cGN12vLbTapTg7kL66adLupjXI0pG7yYNhH9r6xgZ3bqcBsT2kpFsv3A/KgF5vjvSiXr22po5HId/HEKVPC9ZOROfgM46JEOZuE+5jP50zXJWB2ls73vdddqDxIFMME/sko+962tDY3+tsefN4hKiUwpLXuTpUlnsA8kHZhpSUOhcdlV/VXoYHqHmJJ+0G93lG78AFrYijCGnebbitd5jmZ6jdooxCHV+J0H6xdti2FP3UdTTo5XRr7yINEFHytZ0dSXbrn3ilEOE66wS/mD0DlyDblrJpBgVK6hAILerIoI0HTkws/WcYdBi0+PxTnGNV7GCPXtna/3t/MTxCGbh4bpI8hH3DE51yQcMGD76W3SVe7cr2ZtEP5/7U4RjO84y30OvLpjbeZeL6OeMrdnhSq8uI1VEUf85QAzKiOTOnnPRiop1fxSM2C6VyhUCE7VsCfXUyNHgIX9Ir2qkdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(5660300002)(54906003)(31686004)(6486002)(41300700001)(8936002)(8676002)(6666004)(316002)(26005)(6506007)(6512007)(44832011)(66476007)(478600001)(66556008)(4326008)(66946007)(6916009)(53546011)(83380400001)(186003)(2616005)(2906002)(31696002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0N1ZWdmOEx1MWhiVEtqdWt3VDhaV3QvOHdISDEwWUJOVEpobWdoTU1tanMy?=
 =?utf-8?B?RThCUGRtMXgvam11L0tsV1ZDMTlsN1QyVkI3NXNsdmFjZVpjMWkyRXE1RzQ2?=
 =?utf-8?B?bWNXODhaRXhiL2FyL1M0anVqMW5ncUh6NUdOdWQ0clV3RzhxVFJYaHVNM3hX?=
 =?utf-8?B?OXNSeU41N1RlM29kc2VwZFlhN3hCT1BCR2Y4d2hzYjcwMllLYXJXbVhIU3g3?=
 =?utf-8?B?QUxxTXJDS1hISlFLRDgzWllyMk55RDdPcVdiQVBOZUJEeEJRYlNKR3FObllP?=
 =?utf-8?B?NHJmVnM0SWJ2TzJIckFYSmZaMVNkTW5iZzM0aHpTR0tzZW50YVNqVHNXL3Y4?=
 =?utf-8?B?bFArZTdnZHhJUlk1SjlzaEZreEZyc3R5RTFLK1BoUkFCWWk2bFZDcUdNMjNx?=
 =?utf-8?B?Tmtrc25HSTEwL1VTVVNtNlNwTjZycEdONk9acWVEQXZ5MzBrTXlhczZPWnI5?=
 =?utf-8?B?eGVoWjdIRDVQZVJyR0hHN1hmYXlhbmJGRHRrTzg1UDlTTzY3b2MzSlMyb0du?=
 =?utf-8?B?UU43MXUxUFhSOVZCNHJTb2FTV3YyRXdzUWJEU3ZMcWxNTmZ4RHVjbnFPaEJ2?=
 =?utf-8?B?UUtQd3h4TnZXeS85UDhOOFY0RS81QnNnTDJlZmt5YWZ5UmM5cEVrYVFUSitX?=
 =?utf-8?B?YXZEK1MzbHJPaEVFSUUzMTJDM3cwMnJ5NlNlWXV6UmNQR3ZGc3ZDNjVjVVYx?=
 =?utf-8?B?enFxUkgvQ0haRUs1R2dROFRLK0hVeW90eVl2TG0xWi9QOGtya0I3TlpyaDdo?=
 =?utf-8?B?S1FDazFVT0l5blFSYStndWIyNVdhUDhmc3JudUVjOVRNWWlkWWYxbDZaUUxW?=
 =?utf-8?B?T0pRamlrWGZ6V1V1eFRzN3phU0c1cjZ0ZWZtODlWalNpcDIyV01xQlQ4cndr?=
 =?utf-8?B?TkZndHFpV1pFLzZ4QzFKajZmY0ZaSzczR0h4UEUwSld4UlN6YkRxZCtwRUtx?=
 =?utf-8?B?WlRkd1VXL0tQaGNWOFJzdTF4bzZzV0tVb1A4bXFsWDdrMDNuREtCM2xma1pL?=
 =?utf-8?B?UERFT0hiZ1NXUXlucEtnSXZFN3JubVNhUk5Zc2JOelNhUHFLcnJqMThGR3cz?=
 =?utf-8?B?QUc2ZXpmWnJRb0lSOFRGc2ZJbFRqMW44TWpPY0VHcHpWZytzMmxPRGdxbjdw?=
 =?utf-8?B?eFg5RXZwNmNwanBtQmlIUkViYW4zS2huV3BWb2RaM3dhZVROV1dYV3RReHlI?=
 =?utf-8?B?KzA2N1JIUUtrK1EveU0xcnVFcDZ6QVdyOE1VTEtCR3djYUtHSnhiUmdYbHpZ?=
 =?utf-8?B?bnFOSUNmbC9UQlNLNGxwdTJIWms1QWxlM2xabWNjZGhqOW1KTXFWemtIeGh1?=
 =?utf-8?B?dHYwd2ZqcGs4Um9HTW5RdUFuaUttNDVCK0RMNkFVbTJRYWExSEM5S2VUVlh6?=
 =?utf-8?B?aG1jckg3VUI4M2wzQ2xlSFp0M1JibFJNZFV2cTJUQkxSK1JVVUloNjZPMG82?=
 =?utf-8?B?bWFia0NmMWlNWXBmQmpZaHBCNi8yOTBKOWdtblQ3MERjZTVCOTl6WDMyc2Ew?=
 =?utf-8?B?UXdrMG5zQTRlYmhLNTVqeC95QWdSbEh3Q2ZCRVEyL05oYVdHWktSaVp0SXp1?=
 =?utf-8?B?cVVtcHNIQ2t3RnZCTnovbm9JY0xXeEhwblpqRzB2VTdKYXgrdWp6enZxejFs?=
 =?utf-8?B?WmsrVjNqSEtFSElzcnBjaFlSS29kMXB6b3lyZkVsdTBUOGZJb1U1cU1PaXc3?=
 =?utf-8?B?ZTNvVzdxYUF6TFhkc0R1V2k5YXdjR0tNT1RibUhXaTU1QW8rVGprYkswMk1i?=
 =?utf-8?B?ZTBxUVZLM21IUEVneUFQRlE1N214K2t4MjJTSmtEWFN5UUdaMVA2dEVDSjhn?=
 =?utf-8?B?Q1AzaEc2WklaRjl3MUlsOGlkS3hzNS9tQWVOaSt5RE0yQ0dBczVTQ09hSFlF?=
 =?utf-8?B?ajNzMWp5TEhiSUl3dVhibWg2aEVPTk5TWkljUDJuSENyUzBTajBwRk5uUjcr?=
 =?utf-8?B?R0NyRzBXdXQrUCtiUk81Yktpc1p1Qkd2NktZb3E4Q0F2OEFFWmc3Qzlrek9Q?=
 =?utf-8?B?QVVjbWd3S2FxKzZBemc3b2JmdXdEWThPZlRXNjgzMkcxWHc3Z1JvajJUVmJx?=
 =?utf-8?B?cmpXSFNRQ3k3MnMyUk9tVEM4dEhLOURpQWxUaW1kcnFmNklQOUtnUzFQUFds?=
 =?utf-8?Q?tqzLDqcTbqfkQZaK3Oqd6Ndhh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35065936-1543-4b2a-15f1-08db50e088d0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:55:50.3462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NE+QMtMKlNNssXjzIT41qvB3BTCHS+pcyKuuz/acO86nWi5b46XGuxU8RGpxpF3R9U0Nb0/SpzsrCQllmYWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4975
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
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/9/23 16:35, Joshua Ashton wrote:
> FWIW, we technically do use it right now, but it is always set to 1 in S.31.32.
> 
> Before we used shaper + 3D LUT we did use it for scaling SDR content,
> but given we always have a shaper + 3D LUT it made sense for us to
> roll that into there.
> 

Ah, that's good. No problem then.

Harry

> On Tue, 9 May 2023 at 20:00, Harry Wentland <harry.wentland@amd.com> wrote:
>>
>> On 5/9/23 12:54, Joshua Ashton wrote:
>>> We currently do not have a use for this as we settled on per-plane 3D
>>> LUT + Shaper, but we might end up wanting to use in our scRGB stack
>>> someday so I would like to keep it.
>>>
>>
>> uAPI should always have a userspace that uses it. But if we go
>> and put it behind an #ifdef anyways I don't mind taking this
>> if we foresee use for it in the near future. A gamescope experiment
>> showing how this can be used to scale sRGB planes would be great.
>> I assume that's sort of how you intend to use it.
>>
>> Harry
>>
>>> On Tue, 9 May 2023 at 16:37, Melissa Wen <mwen@igalia.com> wrote:
>>>>
>>>> On 05/08, Harry Wentland wrote:
>>>>>
>>>>>
>>>>> On 4/23/23 10:10, Melissa Wen wrote:
>>>>>> From: Joshua Ashton <joshua@froggi.es>
>>>>>>
>>>>>> Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
>>>>>> transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
>>>>>> least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
>>>>>> nits for SDR content. So if you want, 203 nits for SDR content, pass in
>>>>>> (203.0 / 80.0).
>>>>>>
>>>>>
>>>>> Is gamescope intending to use this?
>>>>
>>>> I don't think so. Again, I'll double check and drop it accordingly.
>>>>
>>>> Melissa
>>>>
>>>>>
>>>>> Harry
>>>>>
>>>>>> Co-developed-by: Melissa Wen <mwen@igalia.com>
>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>>>>> ---
>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +++++
>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +++
>>>>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++++
>>>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 25 ++++++++++++++-----
>>>>>>  4 files changed, 41 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>>> index 24595906dab1..dd658f162f6f 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>>> @@ -1326,6 +1326,12 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>>>>>>             return -ENOMEM;
>>>>>>     adev->mode_info.plane_degamma_tf_property = prop;
>>>>>>
>>>>>> +   prop = drm_property_create_range(adev_to_drm(adev),
>>>>>> +                                    0, "AMD_PLANE_HDR_MULT", 0, UINT_MAX);
>>>>>> +   if (!prop)
>>>>>> +           return -ENOMEM;
>>>>>> +   adev->mode_info.plane_hdr_mult_property = prop;
>>>>>> +
>>>>>>     return 0;
>>>>>>  }
>>>>>>  #endif
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>>>> index ab9ce6f26c90..65a9d62ffbe4 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>>>> @@ -387,6 +387,10 @@ struct amdgpu_mode_info {
>>>>>>      * linearize content with or without LUT.
>>>>>>      */
>>>>>>     struct drm_property *plane_degamma_tf_property;
>>>>>> +   /**
>>>>>> +    * @plane_hdr_mult_property:
>>>>>> +    */
>>>>>> +   struct drm_property *plane_hdr_mult_property;
>>>>>>  #endif
>>>>>>  };
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>>> index 005632c1c9ec..bb7307b9cfd5 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>>> @@ -51,6 +51,7 @@
>>>>>>
>>>>>>  #define AMDGPU_DMUB_NOTIFICATION_MAX 5
>>>>>>
>>>>>> +#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
>>>>>>  /*
>>>>>>  #include "include/amdgpu_dal_power_if.h"
>>>>>>  #include "amdgpu_dm_irq.h"
>>>>>> @@ -736,6 +737,17 @@ struct dm_plane_state {
>>>>>>      * linearize.
>>>>>>      */
>>>>>>     enum drm_transfer_function degamma_tf;
>>>>>> +   /**
>>>>>> +    * @hdr_mult:
>>>>>> +    *
>>>>>> +    * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
>>>>>> +    * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
>>>>>> +    * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
>>>>>> +    * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
>>>>>> +    * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
>>>>>> +    * S31.32 sign-magnitude.
>>>>>> +    */
>>>>>> +   __u64 hdr_mult;
>>>>>>  #endif
>>>>>>  };
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>> index 5b458cc0781c..57169dae8b3d 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>> @@ -1321,8 +1321,10 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>>>>>>             __drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>>>>>>
>>>>>>  #ifdef CONFIG_STEAM_DECK
>>>>>> -   if (amdgpu_state)
>>>>>> +   if (amdgpu_state) {
>>>>>>             amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
>>>>>> +           amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
>>>>>> +   }
>>>>>>  #endif
>>>>>>  }
>>>>>>
>>>>>> @@ -1424,11 +1426,11 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>>>>>>  #ifdef CONFIG_STEAM_DECK
>>>>>>  int
>>>>>>  amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
>>>>>> -                                          struct drm_property_blob **blob,
>>>>>> -                                          uint64_t blob_id,
>>>>>> -                                          ssize_t expected_size,
>>>>>> -                                          ssize_t expected_elem_size,
>>>>>> -                                          bool *replaced)
>>>>>> +                                   struct drm_property_blob **blob,
>>>>>> +                                   uint64_t blob_id,
>>>>>> +                                   ssize_t expected_size,
>>>>>> +                                   ssize_t expected_elem_size,
>>>>>> +                                   bool *replaced)
>>>>>>  {
>>>>>>     struct drm_property_blob *new_blob = NULL;
>>>>>>
>>>>>> @@ -1482,6 +1484,10 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>>>>>>                                        dm->adev->mode_info.plane_degamma_tf_property,
>>>>>>                                        DRM_TRANSFER_FUNCTION_DEFAULT);
>>>>>>     }
>>>>>> +   /* HDR MULT is always available */
>>>>>> +   drm_object_attach_property(&plane->base,
>>>>>> +                              dm->adev->mode_info.plane_hdr_mult_property,
>>>>>> +                              AMDGPU_HDR_MULT_DEFAULT);
>>>>>>  }
>>>>>>
>>>>>>  static int
>>>>>> @@ -1507,6 +1513,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>>>>>>                     dm_plane_state->degamma_tf = val;
>>>>>>                     dm_plane_state->base.color_mgmt_changed = 1;
>>>>>>             }
>>>>>> +   } else if (property == adev->mode_info.plane_hdr_mult_property) {
>>>>>> +           if (dm_plane_state->hdr_mult != val) {
>>>>>> +                   dm_plane_state->hdr_mult = val;
>>>>>> +                   dm_plane_state->base.color_mgmt_changed = 1;
>>>>>> +           }
>>>>>>     } else {
>>>>>>             drm_dbg_atomic(plane->dev,
>>>>>>                            "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
>>>>>> @@ -1533,6 +1544,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>>>>>>                     dm_plane_state->degamma_lut->base.id : 0;
>>>>>>     } else if (property == adev->mode_info.plane_degamma_tf_property) {
>>>>>>             *val = dm_plane_state->degamma_tf;
>>>>>> +   } else if (property == adev->mode_info.plane_hdr_mult_property) {
>>>>>> +           *val = dm_plane_state->hdr_mult;
>>>>>>     } else {
>>>>>>             return -EINVAL;
>>>>>>     }
>>>>>
>>>>>
>>

