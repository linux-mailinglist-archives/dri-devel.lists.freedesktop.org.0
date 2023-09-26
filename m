Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E833D7AEE13
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 15:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBB610E031;
	Tue, 26 Sep 2023 13:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658EF10E031;
 Tue, 26 Sep 2023 13:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nyd0jSpigL9PebPOdEyErQ2J50zwmrbdxjgkhcPB75/abnDH8mZ/wlnIg1Gh8rqQ8vukjwKGi/nnZgI9IuMOCYRMs46IBcPgdjq/yN0198rbn7d67EAMQif7jVCB0dCnfO9r6zkekWXoeEgo/NE+Bg5gEcdOyZwri1te1+x3ZqGIm0+IsVuEOvp9y3nIz+6u3sfxSSYr2FQcR6e2XaDsYLzl39whBvuMtPx7TSyztxtJPmKFsSw6FTGKjqhwZe60ctZtRB74Q6rxz1I+sE45qQNQvH5OEDL20PZ6H/IkYuGq+UjKlbd1DOWBRAlXT0NBEUY+iuLDy5+OIOX4O+fjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhaUnajex4goKxaAzI84azQKYqO4ATZbtgwvGCvsLYc=;
 b=i6LISUvmHPUiUBsrSiuMU6miWA0w+V+yG+/kCdhADEqdIsR14pwSqs39VFit2R6Q2cyk8S3QR0eC6htQhe5LPeudqVHoyPQKLNSjtashdTlMepse+VYXCMwUMihVMeyz53kVA9/IyJY0Mb+/KpudjgCqSZ7Mteac7Lajutt6YyIC6dFovri6/PimjE/8Y5nomXaNMjOP6zadrXCW02cqOKGaasllFX+/gnbxmeI48X+3ZCsd/N0VqVjyG13FmQqpm+i69raCCG+kRnII/shDJ9S4etopLjJPPQY+TBpwN4frUGpBzJvL4l6MyNFObcQoe7H7uNRZ4lUjgFnxsk6geA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhaUnajex4goKxaAzI84azQKYqO4ATZbtgwvGCvsLYc=;
 b=xH9BhB0Tn/VOD83AJ8y5Pyv+GMJ3TB3w6FeNa0jCBrHbRIBB/dPfGiLt4NRy+NY3Fw4eCi6jFPeQzg+LNk9xafgtaqHOH5PxkJtwPdwmzqQNIEUIOkNGvwLjDSMupR4eo8/MznRK+zZ8/G31LL5pTmKY630A2P29eN+ahynkWOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH0PR12MB7958.namprd12.prod.outlook.com (2603:10b6:510:285::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Tue, 26 Sep
 2023 13:48:33 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 13:48:32 +0000
Message-ID: <1f66b0ad-4278-40af-ba23-563e91f48a98@amd.com>
Date: Tue, 26 Sep 2023 19:18:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
 <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
 <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
 <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH0PR12MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ff1f61-4a35-4fa8-e8f4-08dbbe9745dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+ANPIGTaEV2XiNc8ZWa54yJO0Ih4+HaKcZ02tjctbyhmCNZEbVXJ3Xl9bgcMxHmLBQRF/uFDjKXS0BzGvxz96wG1azwqQiSQhICnLqqHXyhmvYdPAeJmVlGDIPjwIcejyjExL7Kj8o/+QhgIkHHj1OlEr+ztYsDCH5wblN2XrAWWTWN/8DrRhnUa8uSor4xROOjh+EriKF2jeiUqzdrmmvrQ4DzoCp0D6nmPDbtlymvgOpLmRACG7XTCGy6fHnkO4gGuo83GW6ZUBt+DjrCMEpNPbn5Fjbgr5SAp5XdgYmdgrweKFT6o6r9aTR7ivibU7dr7ScScSWqf2ClOWzY/yWyDnZtE27Y8/gQ7/eEox1kfxc+x+YiuASPPAk4vkEQmAmZUnaaKu7czzg5G64eAxVWo7eoOiKdZLxhmM93i+m9+DoYV7fIaedoyAoEcKHOSFQiBN8EEzDvjbzYYR0naEgV+EVEcTF8Va5QW94jJseUq2Rr9uLurhs5Tv2LcXmPRVPXmMN9nExk3HEO5sY97zz7OCd7o5GjFJ2hmXZpLtFGXcKlT523rMSHLOjeHAZXZohTP2Y/th4L7TOr/+CXiSY+H0vtATwlfVguq6QwCmLVkAwUb+/GsJ+yGA7zU+NNwI3xJ0jBJKt/ImWkzv5s+ziClMY1PNwHT5OX1pvVKdkh+P94m8AjH92iHKldRLxZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(66574015)(41300700001)(2906002)(83380400001)(86362001)(2616005)(38100700002)(6666004)(478600001)(53546011)(36756003)(6486002)(6506007)(921005)(6512007)(316002)(26005)(66476007)(66556008)(31696002)(66946007)(110136005)(4326008)(7416002)(8676002)(8936002)(31686004)(5660300002)(87944015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWM0RGZvUVVDS1BZb1YyL2xXK2VnZW9NOVRQQ1ZwNkFRbGl3Nk1IcXM2bUFH?=
 =?utf-8?B?MzhteHV6K29LZzNsU1JHSjFDUzRkY2JXSUlHdnllakw1OVZNYWZNNDhhRzRm?=
 =?utf-8?B?QllWMm52bE5iaSt6djVKTVFTVUV5SUEwN3V2WWFyYUYyem9UczgydFVwL2xX?=
 =?utf-8?B?UjZBYXFqVEFyTWFyem9STEUzOGkyWHZMRTB2TGZSa3dyejFOQjB0QXIxeDBr?=
 =?utf-8?B?K0lFVXNHVWxIeGVnM3JJRTFEQVQrVUdvQkF1UHJTaVI3c085enQ0a3hiOWli?=
 =?utf-8?B?ZEF6QTNCMmdFdUdQSmFSVGxNTnNZRE5pT05YZWRnaTlmMEQrL1FaeHUwYTdp?=
 =?utf-8?B?dHhaMVptR3pzMlNYYi91WUQ1cHBVYWliRk8rd0VWUFo3R0JGcmNtb3g1a1hN?=
 =?utf-8?B?SmppWm9UcWR3bWxCMjhCcUZSQTJuSkxpSmxNNFI3UnR1YlJyelBqQkY2TzdE?=
 =?utf-8?B?UUVQNUJuVVB6eFF4a0RwOGw4M1A3Nzd3MnFyYzhiSzBQLzdoZ2QxUENGR3ZX?=
 =?utf-8?B?SlNnVlUybUZlVytCODJ4L041c0pybE01Y3lHZlcxQkJTWU5pOGhPeXpWK1Jo?=
 =?utf-8?B?RGNpYWxUM3VmNTZtdElRTjBZTHc4YXNNTitWNDJDeFBFZHgwd0ZUY0JQN296?=
 =?utf-8?B?c3lNYm9HZHAzREkvenRZc0FjZ0EvajNTT1kwRXNmMktLOGlPeUZ2ZnBxYTlJ?=
 =?utf-8?B?cGhMNTdLVmlyL2JlR292emliOUMySHBrNzl6TmVaeEVPcGtoRk1Ka2NJQXJt?=
 =?utf-8?B?U3crVE43ck92VTI2cDQyR0drNnRLcTVnbEtSZFNMZC9ORDdaZ285QkVobWQ3?=
 =?utf-8?B?eWhjVFpOVi9OV0dHV29DY0FpeXNLS2ZsS1VDQjdaV0pDQnZlTFY2NUFVNm1E?=
 =?utf-8?B?dkZXQWdVajdiK0NEWFBaYUd4ZmR5ekU3RCt5RGdKV2ZWK2k3QU9NWE95a1Nh?=
 =?utf-8?B?V1ptaS96TFl1QTJEZzVKRmlpTjRKQ2lGbnNYcHkxM2tlUkRZWHFia3A5blB2?=
 =?utf-8?B?eWZOTGI1ZzR5VmJleWFXa1ZpeklaVXdaWWNpOURSbFEyTEZSSmlYMUlsUXFi?=
 =?utf-8?B?QmZXSCt1Ujdqd0VRMkxMS2tGQmF2WHhCSHVXb3dPSW5GL2p1LzRLaDZ3Q2I3?=
 =?utf-8?B?dEx5RkRDODJMNUpzb0lzTXVLbDJUMmNRWTZzZklNK1M5cFo0cy9LbkJaMWxu?=
 =?utf-8?B?eVBaeUhCTUFFdkE2cVVMQXFOdmorUUxiZ0RsdHBzTVh0VWZkams3UklzUWdw?=
 =?utf-8?B?ZDh4YU1jZGpjRnhQb3d5N0pFZU5KVGNTaXNmdHNUK3RRalFwTTVkdUNyQ0F5?=
 =?utf-8?B?V2tuUHV6a3BFTjdVQVZzc29ORnJKV2JwaWFVY2xnaUxpZEFVcm9UbHN4L3dj?=
 =?utf-8?B?RGVSSDZRemdCV0VJdzl6TGhDNG11VS9QTnFCc0R0KytBNkVhZmwrS1FoV3U2?=
 =?utf-8?B?M2VwbnVLUVhlSnRXU1k1Y010VlRDdi92cEFzaUE3dlBVamxObFZkZEY0MFNj?=
 =?utf-8?B?aUdhYjU3b0x2ZG9VazYyWjZPdXczTmRtYVlsRGN0dnZhak5ON0RHTHRwTTdy?=
 =?utf-8?B?L3dVckhPVC9yVGhIMENpYzhYMGhkTG53TmZBb2hYV0lDc2lwMGQ0VlVvcm5Y?=
 =?utf-8?B?UlhvSStPYVBkMEIrcnVIT1lyR2pkeEttbURTd2hiOThmc3N4b01VamdoSXRr?=
 =?utf-8?B?bEo1ckpLM0RnWnArZmpkUjZIUVNzRnhrOS9NdE8zb0Z1MUlGaUluandOQ0tQ?=
 =?utf-8?B?NnNKSEJzZWszaDkwdkVyRHdmUHY4Q0k2ZWNFblNxc3dIMEcrUGpZaW1TWEtC?=
 =?utf-8?B?T2FhdVhuTGdERTU0LzNvaDFuZDR3QmxOS0dTOEUydmxEOERGTFU2VjRaY3Jn?=
 =?utf-8?B?bFZvbkFsVDNoN2QrNDJrQmd4Q1B0aXlhbUhjRUJUejRZZG84RnI5RGI5UmZM?=
 =?utf-8?B?MkF4YlFKdEI0alBPWjkxSXFYeVAxSnNvQ2o4OVNEbzZReFBXSmd1Q2s5a0lx?=
 =?utf-8?B?bUpFNkJYNFMwSUdaWCswb2QvZk9IY2pqQWVkVk4xZTZ1cFk2cVNsK0JROHNF?=
 =?utf-8?B?NkZTeEh0Rk4wZVg4UUMzdXU1RGlUM2loejJDMWQ2dmZsMDVGRWoyemhyNnl2?=
 =?utf-8?Q?NRc4y61G9ktM3ZIsobs1qscOy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ff1f61-4a35-4fa8-e8f4-08dbbe9745dc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 13:48:32.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLXU9bH7hqYBcO3To3fNk+SvzVpXRqtbjtTrgPqjBT8oDvVkBOxnTCi30S0MlD7lPteAso9Lavbj80cpjnhYew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7958
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 9/26/2023 6:47 PM, Christian König wrote:
> Am 26.09.23 um 14:56 schrieb Hans de Goede:
>> Hi,
>>
>> On 9/26/23 13:24, Shyam Sundar S K wrote:
>>> Hi Hans,
>>>
>>> On 9/26/2023 4:05 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/22/23 19:50, Shyam Sundar S K wrote:
>>>>> For the Smart PC Solution to fully work, it has to enact to the
>>>>> actions
>>>>> coming from TA. Add the initial code path for set interface to
>>>>> AMDGPU.
>>>>>
>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>>>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>>>   drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>>>   include/linux/amd-pmf-io.h              |  1 +
>>>>>   4 files changed, 41 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> index 232d11833ddc..5c567bff0548 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct
>>>>> amd_gpu_pmf_data *pmf)
>>>>>       return 0;
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>> +
>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>> +{
>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>> +    struct backlight_device *bd;
>>>>> +
>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!bd)
>>>>> +        return -ENODEV;
>>>> This assumes that the backlight is always controller by the amdgpu's
>>>> native backlight driver, but it might e.g. also be handled by
>>>> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
>>>> nvidia dgpu).
>>> PMF is meant for AMD APUs(atleast for now) and the _HID will only be
>>> made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
>>> should be safe, right?
>> Users can pass say acpi_backlight=video and use the acpi_video
>> driver for backlight control instead of the native GPU backlight
>> control.
>>
>>>> For now what should be done here is to call
>>>> acpi_video_get_backlight_type()
>>>> and then translate the return value from this into a backlight-type:
>>>>
>>>>          acpi_backlight_video        -> BACKLIGHT_FIRMWARE
>>>>          acpi_backlight_vendor,        -> BACKLIGHT_PLATFORM
>>>>          acpi_backlight_native,        -> BACKLIGHT_RAW
>>>>          acpi_backlight_nvidia_wmi_ec,    -> BACKLIGHT_FIRMWARE
>>>>          acpi_backlight_apple_gmux,    -> BACKLIGHT_PLATFORM
>>>>
>>> I can add this change in the v2, do you insist on this?
>> Insist is a strong word, but I think that it is a good idea to have
>> this. Evenutally it looks like this code will need to either
>> integrate with
>> the drm drivers lot more; or the drm core needs to export some special
>> hooks for this which the PMF code can then call.
>>
>> Actually thinking more about this, I think that the right thing to do
>> here is make some code register brightness control as a cooling device
>> (which I think is already done in some cases) and then have the PMF
>> code use the cooling-device APIs for this.
>>
>> IMHO that would be a much cleaner solution then this hack.
> 
> Yeah, fully agree with Hans. This looks like a rather extreme hack to me.

Sure. Let me think in this direction.

> 
> Apart from that what exactly is this thing supposed to do? Prevent
> overheating by reducing the brightness?

Yes that can be one of the cases. But the thought process here is to
help OEMs build their own policies.

A policy is combination of inputs and outputs. Inputs are the
conditions that has to be met and outputs are the actions to be set/done.

The output actions come from PMF TA. One example policy apart from the
case you mentioned is:

if ambient light (received from amd_sfh) is low ; reduce the screen
brightness (received from amdgpu) or vice versa.

Thanks,
Shyam

> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>> Thanks,
>>> Shyam
>>>
>>>> Also I'm worried about probe order here, this code currently assumes
>>>> that the GPU or other backlight driver has loaded before this runs,
>>>> which is not necessarily the case.
>>>>
>>>> I think that if the backlight_device_get_by_type() fails this
>>>> should be retried say every 10 seconds from some delayed workqueue
>>>> for at least a couple of minutes after boot.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>
>>>>> +
>>>>> +    backlight_device_set_brightness(bd, pmf->brightness);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> @@ -73,6 +73,7 @@
>>>>>   #define PMF_POLICY_STT_SKINTEMP_APU                7
>>>>>   #define PMF_POLICY_STT_SKINTEMP_HS2                8
>>>>>   #define PMF_POLICY_SYSTEM_STATE                    9
>>>>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS                12
>>>>>   #define PMF_POLICY_P3T                        38
>>>>>     /* TA macros */
>>>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>>>>   };
>>>>>     struct pmf_action_table {
>>>>> +    unsigned long display_brightness;
>>>>>       enum system_state system_state;
>>>>>       unsigned long spl; /* in mW */
>>>>>       unsigned long sppt; /* in mW */
>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> index 1608996654e8..eefffff83a4c 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct
>>>>> amd_pmf_dev *dev, u16 event)
>>>>>       return 0;
>>>>>   }
>>>>>   -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev,
>>>>> struct ta_pmf_enact_result *out)
>>>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev,
>>>>> struct ta_pmf_enact_result *out)
>>>>>   {
>>>>>       u32 val, event = 0;
>>>>> -    int idx;
>>>>> +    int idx, ret;
>>>>>         for (idx = 0; idx < out->actions_count; idx++) {
>>>>>           val = out->actions_list[idx].value;
>>>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct
>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>                   dev->prev_data->system_state = 0;
>>>>>               }
>>>>>               break;
>>>>> +
>>>>> +        case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>>>> +            ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>> +            if (ret)
>>>>> +                return ret;
>>>>> +
>>>>> +            dev->prev_data->display_brightness =
>>>>> dev->gfx_data.brightness;
>>>>> +            if (dev->prev_data->display_brightness != val) {
>>>>> +                dev->gfx_data.brightness = val;
>>>>> +                amd_pmf_set_gfx_data(&dev->gfx_data);
>>>>> +                dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS :
>>>>> %d\n", val);
>>>>> +            }
>>>>> +            break;
>>>>>           }
>>>>>       }
>>>>> +
>>>>> +    return 0;
>>>>>   }
>>>>>     static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>>>> index a2d4af231362..ecae387ddaa6 100644
>>>>> --- a/include/linux/amd-pmf-io.h
>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>>>>   };
>>>>>     int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>   #endif
> 
