Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5C4F995D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91C10E6E0;
	Fri,  8 Apr 2022 15:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB2010E65A;
 Fri,  8 Apr 2022 15:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEWrKYVXahowYEITw3m8AyNvC0NmGyepYGRcf8dKtjmqn9x5So2bh/qhbKHfLGgIEnntnoxSBej9koUm8ltahD8jVqvrbZEuxEph1PGv+lLkf8/REz3cNyVi10laRNTwUHeSraT4ACjn1nJzKSXLxSPcof2n7Y1+y7yJhyIMShvgIDuT9P/3PJGHX5Kb2ykAHo1O17zTCH/FmSWQsyyO8J48n1lA2SkURWFHcfFqkv7Lqr0VqEoY8OP555ZTF5SshQst7Z8Fp/YuzVHCgm+vG8PxVq/OTaZX9/ZTG46MK7aPy2C8im7FFwZdJ7UY5Y7VW7WaF63qUV7Pw/ZpYAwpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UchLPq3S6UB6n9PMhmOzwFwaE4xP82KDWs4ri/exzrs=;
 b=EepDdLMVbhfQ4SefWpC3cDIElVfgrIDArm4T/Wn+FxRxlLYo5S8XOLjQMWU17w0gTVymtRKzxhIUyRHPMAS8Mh2Zyv06ynSqWq077UcP5Go5sGzdqE0rk/vIOOtQaavIFmUUfE4x/92B9E6ZhZTykt6TO8dbFUX8UDwHuTvJ/X68Ec0T6kMMA8IbtCw4XGDpGMI3AlZnTGV1pOQ2Hr6rAxUSiUetBmW23p0zFI25iCSmgvszSmu1t+Y3tatNMwKgZjq5cmc1aUjwiw2tcoWw3E7Yt+tFWIt+0EoCeJtYokjThZkrhLTU5CRi7cXP+pmshJ/ysmWryMFpt8JgZO7Iiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UchLPq3S6UB6n9PMhmOzwFwaE4xP82KDWs4ri/exzrs=;
 b=jPRCrJla5JUvbkvMPkJ3cmlceoVZK7WDuywXUoFEgUdxZv8o3ZeSBSqS3VjD5YVs1+jLJpvQ1pvLlgm6GmuQ62I0FlMocn3sdVsxBWcVaIiceHS5w+oQvklFNFkYHelb09QpdP6FTehF/zLX9Vtn8O4EtVWpwrOthTFH0G+NQpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM5PR12MB1305.namprd12.prod.outlook.com (2603:10b6:3:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 15:25:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%6]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 15:25:53 +0000
Message-ID: <9c18564d-b684-a500-5d46-bebeb65aedef@amd.com>
Date: Fri, 8 Apr 2022 11:25:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] drm/amd/display: Move connector debugfs to drm
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, swati2.sharma@intel.com
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
 <20220408065350.1485328-4-bhanuprakash.modem@intel.com>
 <16c42991-7b44-3eab-261a-3c60f4d1fee3@amd.com>
 <76050092-5d2f-a79f-6775-44a6c1213f61@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <76050092-5d2f-a79f-6775-44a6c1213f61@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26683514-d658-41db-c0ef-08da197411e5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1305:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1305F05747B0FFED3CD20C488CE99@DM5PR12MB1305.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElkdIT5zL22gTrXwECnjg1IavUYP/lOriycFm+h4QeWvlCppjkwz+LwaPAwq5chsxQkT0PsluP3hg2UF5PYe+zipri6lJu8KQgfKRHFG4bgWmKWDIPi9ImcAVaMgT5GPj3+WvVUJ5O0NZfLAw4UDiiAilkUBz+nElhfHAZMqkm92iPlj784WW8bZPUWhHjilB3mQ8wxfJkIgi+1pVFFNZvSMhZmw+lZo/xiayMeJA9ka3LxUHXBVubcf1G5pNRNIFcNgIDqkcXD0OTxqJMX7VBLYzqB7yUcUgFTyXUhkQrtr/6OMQi+86ExGgtCtOXEcRZMB8tDywaZ2UJjNWqd8NlmjVh0v0GGjRK71N+VL/kM7T3oMRvWXgbXf95aZOGDoRQhYwXIazmZxwfn9DXEAVjpOcdiv8BLB2E619840sLRjKl2UU75JYaXvv7UjgAdt7oR0swlvDEdxjxDWW2RDCgNwIHiJsq4v06GQaE8Q7KKzf5uxh2DM2onGyIK1WqSjLo+tu4xSrS51vi145D+nXiN7nvmHU5KA/66GixtC1ROf6apwjFxAywtNS0GwqL4eS9vrGbwiJCfS6zzEazZ0d4d3qZugLxoSi0Kk8tPBTBGTrfyx/f3kyPnxlnTxmZhEkuKnhxo8TIwypnOjFKMq00LeALDIsBSpk/q/pVpsA+X2MwZe8lxig6DFdjxB+ppPd17KWs04TtyRgxA2i1R75XcvHPnd/rP1WvCwbEzdBbiioGwligWjaZ2F/vNncG2Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(8676002)(4326008)(66476007)(66556008)(86362001)(83380400001)(31696002)(316002)(508600001)(5660300002)(2616005)(53546011)(38100700002)(26005)(66946007)(2906002)(186003)(44832011)(6486002)(966005)(31686004)(36756003)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUROR3h4alBjWXV1Wmh3ZExuM3pCMithN0xXb1dLNFU4M2pjOUhBSng4aWV1?=
 =?utf-8?B?eGszWmtiWksvNnltbXpJR3BkTTlibzloaDdKVHZOWjJibzVSekVlM0FuM0Vz?=
 =?utf-8?B?NVlmR2V1aExQYXV2VE5nYzVKQWZXODhVMDZTWVhDMXdtZFVLaHc0L3FlLzVW?=
 =?utf-8?B?TjNreStpU0RGOGRxVitSWlpxUnpFNEtzSW1GeXlDK0UrWmZkaVExd29QclhL?=
 =?utf-8?B?RzFwc0lRNUdPSFg1ZnMzTEtQdzRZbzdYU1orL0hvR3hvMmROcVJ4cU93bEJp?=
 =?utf-8?B?eXd1YUtIOU81UkNTUVY4Nld3Vk9lUlBXYlBCQVl2NXBHSlRWTHdUVUE4ckk2?=
 =?utf-8?B?ODkzT04rYVdTckdCeXdvSFhyajhwN1dBODB5YktHRjhyZzc1K241OVpleFRa?=
 =?utf-8?B?MFZ2MTh0eUc5eFViR2IyeW1IV25VZWxsRWZ2WjVqRVRuQ1MwdGFXV0pkK2tJ?=
 =?utf-8?B?QUtNc3hiZnRiOEk1U0xQZ2lPRlVDbFJxenBXUDhrK01Xc0NjVHh6NHo3dVJY?=
 =?utf-8?B?M3Q3S1ZnOXZRRkduTXVQb3dLd1BwRXAybURFVkJPVzQrS20wSGwwWW1aTlRF?=
 =?utf-8?B?UEFsYTlhdUZ5RVlnaEszYmVrMUwyNGdNUmNjVG1LT0lYMnYvMlcrUnpPdVVV?=
 =?utf-8?B?aXNHVXcwNlJ4VURkcGFMTDFLQ3kwdWRyRmh3TTd5blVnRlREZmVkMHJRem9p?=
 =?utf-8?B?ZkU5MnBaOVRlSEpwNTlxMkd6bmVkSHhZS1VWbWxPV1ZRWm9lUGJZc0xCS2FD?=
 =?utf-8?B?ck10WDQ0dDBtVlJSbEZiSzFCWVk1NTBiaVo2RDM5cWh1cmY1Q1gzRUNDdkVU?=
 =?utf-8?B?V2x4V0FkTUg0R1c2Y1FqNFlkZVBqc1d6dUZiRkdlZTRKMzNHejI5MXlrOTk4?=
 =?utf-8?B?ODQ5QnMvdERNYzV3RG9mTEJWZjJqV28xcGFqdkdsUUwrcnV2SWtYdnlsR1ZK?=
 =?utf-8?B?ZCtIMkpaWXdLaTVVUmxCalNsTHl3SUE4R1B5WHpKZGtRWWlyUXJIR1RyK21D?=
 =?utf-8?B?WUFNaDRpQnV1ZFpxYzBYayt5L1VHSXNnYXh1ZVpwSk5aMnE4MkxUQzI2c3ZR?=
 =?utf-8?B?SytXNHh1OGdYN0QwZmJtWS9rQTBXcWMrWFEwcWtLNnpqMVlBT2VyZ3RJM0xD?=
 =?utf-8?B?RDFNUkZNWTlhd0JCZGN3N0lhR05LcDA0VWFqS1dHZVFaU0VtOE10S3BVallX?=
 =?utf-8?B?Z3hVdGl5cWwyWGRVNVhXKzlOLzNma3JadG1MS0I0TVlIQk1UWDc3aWthdW1N?=
 =?utf-8?B?Wk01YzhQems1dnRkR1dtbGMzSHdOWEJCUlR5bjJQbk5xY1k3UmZpem52UXZq?=
 =?utf-8?B?dUwzK1Z1TmVIeHl0bHZUdWdzcVhEMHk1V1JTclZHeHNVRStHVzhOaUFQRFVK?=
 =?utf-8?B?a0NESGs5NkNUYStCejZpM29ncFpKNktvVVhHYnpNcmdrek1PNjRFMjVYS0pk?=
 =?utf-8?B?RGJydUE4dmpqQTJNZTFIY3ZTZ3FkekZmd0JDVVpiSlBHZVFlRDFVNzZrVjdn?=
 =?utf-8?B?MG1FWDRIc2RNRkltMmp4Rjl4UGZzSVZUK0VqTmEvd3JKY09ZN3pSWFNJcjRV?=
 =?utf-8?B?T3Y2d3VoNVZCa2tvTGROdFdqWXg3Zm40c3NadTJIOWloa3pacm9ieWM4Zmw5?=
 =?utf-8?B?bXFEdWdUdGNOa1ROaU9tWm03L0FkVUEzWmFSSXI1dDFkajhZZUFhWWk5RW5z?=
 =?utf-8?B?OUQ0N1laNFpCTDhrMXVWdExSNWJiTjBEQ1BDc2twcFdJek9oOGhqbnBzL3Ir?=
 =?utf-8?B?M1NCOWhyQzRKdlJUZ3JnU2dRcCtySVFyb1BDdUVnaFd4Tno3Qk5ZTnp3TEVQ?=
 =?utf-8?B?bEZVUGFPU0xCd2Y3OTZ5ZXBzbHVhNSs2OU8zZHEvWG5aUG9qRWo2WHVybkJu?=
 =?utf-8?B?U2gxbHhSSXpHb2wrNmFEK0ZDVkpLa1NUcFVVL2lKbkNiOEhLY1FwK1BsVlBj?=
 =?utf-8?B?UmYwOXRaaGtIUWh2QmlNWW9OZHAzSEo2K3N4VmkybmFTYlZtSnladHM1YWJH?=
 =?utf-8?B?WDRmeVBDNnhFVk53VTYvTVlrZkE0VUNFVG5BM2RHbC9xYTNzUEZOWXNpOHdq?=
 =?utf-8?B?ditRZ09kR2JxOUk3V2FYaEV5OGJ6bUpOeGxzKzVwT0dtV2JzblRZcWpBaXlP?=
 =?utf-8?B?NUVKR3RibHZaVjRBT2VMTjJ4WEFxdWxoZGVuNmhyVlNuckQ4bGwvb0xESTFr?=
 =?utf-8?B?NEZ6VGdhUlJMUVdzUC9rMUViT21JRGdZejUwZ0QrcCtIQ0V3ZW5yYWwzL2Fk?=
 =?utf-8?B?eVltRUN5YnQ0a1U1R0NkTUJxQkhZbXN4V3RYL2RNSURZbCtpUGZaQWhDMkhp?=
 =?utf-8?B?NzJWc3RyOTBCL3ZrVHNEbWF5U0NGL2ppOENKSVNaUk9Xd1dTcUplUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26683514-d658-41db-c0ef-08da197411e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:25:53.5079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QR68KVdaJ0zos2d1EkNQiOW4FeUa+X5Cnhl9RbP3LgvGwDJFKCcA3bWu98ccTFIwXftkjBB+zHjtuzGUgVSDew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1305
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-08 11:23, Modem, Bhanuprakash wrote:
> On Fri-08-04-2022 08:33 pm, Harry Wentland wrote:
>>
>>
>> On 2022-04-08 02:53, Bhanuprakash Modem wrote:
>>> As drm_connector already have the display_info, instead of creating
>>> "output_bpc" debugfs in vendor specific driver, move the logic to
>>> the drm layer.
>>>
>>> This patch will also move "Current" bpc to the crtc debugfs from
>>> connector debugfs, since we are getting this info from crtc_state.
>>>
>>
>> Does the amd_max_bpc test pass after this change?
> 
> We need IGT fix along with this change. And I have made the required changes in IGT: https://patchwork.freedesktop.org/series/102387/>> 

Thanks, I spotted that patch after I sent this email. :)

Harry

> - Bhanu
> 
>>
>> Harry
>>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> ---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 --
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++++++------------
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |  2 -
>>>   3 files changed, 13 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 73423b805b54..f89651c71ec7 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -6615,14 +6615,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
>>>       return &state->base;
>>>   }
>>>   -#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
>>>   static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>>>   {
>>>       crtc_debugfs_init(crtc);
>>>         return 0;
>>>   }
>>> -#endif
>>>     static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
>>>   {
>>> @@ -6720,9 +6718,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>>>       .enable_vblank = dm_enable_vblank,
>>>       .disable_vblank = dm_disable_vblank,
>>>       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>>> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>>>       .late_register = amdgpu_dm_crtc_late_register,
>>> -#endif
>>>   };
>>>     static enum drm_connector_status
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> index da17ece1a2c5..3ee26083920b 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> @@ -873,28 +873,18 @@ static int psr_capability_show(struct seq_file *m, void *data)
>>>   }
>>>     /*
>>> - * Returns the current and maximum output bpc for the connector.
>>> - * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>> + * Returns the current bpc for the crtc.
>>> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_bpc
>>>    */
>>> -static int output_bpc_show(struct seq_file *m, void *data)
>>> +static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
>>>   {
>>> -    struct drm_connector *connector = m->private;
>>> -    struct drm_device *dev = connector->dev;
>>> -    struct drm_crtc *crtc = NULL;
>>> +    struct drm_crtc *crtc = m->private;
>>> +    struct drm_device *dev = crtc->dev;
>>>       struct dm_crtc_state *dm_crtc_state = NULL;
>>>       int res = -ENODEV;
>>>       unsigned int bpc;
>>>         mutex_lock(&dev->mode_config.mutex);
>>> -    drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>>> -
>>> -    if (connector->state == NULL)
>>> -        goto unlock;
>>> -
>>> -    crtc = connector->state->crtc;
>>> -    if (crtc == NULL)
>>> -        goto unlock;
>>> -
>>>       drm_modeset_lock(&crtc->mutex, NULL);
>>>       if (crtc->state == NULL)
>>>           goto unlock;
>>> @@ -924,18 +914,15 @@ static int output_bpc_show(struct seq_file *m, void *data)
>>>       }
>>>         seq_printf(m, "Current: %u\n", bpc);
>>> -    seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
>>>       res = 0;
>>>     unlock:
>>> -    if (crtc)
>>> -        drm_modeset_unlock(&crtc->mutex);
>>> -
>>> -    drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>> +    drm_modeset_unlock(&crtc->mutex);
>>>       mutex_unlock(&dev->mode_config.mutex);
>>>         return res;
>>>   }
>>> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
>>>     /*
>>>    * Example usage:
>>> @@ -2541,7 +2528,6 @@ static int target_backlight_show(struct seq_file *m, void *unused)
>>>   DEFINE_SHOW_ATTRIBUTE(dp_dsc_fec_support);
>>>   DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
>>>   DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
>>> -DEFINE_SHOW_ATTRIBUTE(output_bpc);
>>>   DEFINE_SHOW_ATTRIBUTE(dp_lttpr_status);
>>>   #ifdef CONFIG_DRM_AMD_DC_HDCP
>>>   DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
>>> @@ -2788,7 +2774,6 @@ static const struct {
>>>       const struct file_operations *fops;
>>>   } connector_debugfs_entries[] = {
>>>           {"force_yuv420_output", &force_yuv420_output_fops},
>>> -        {"output_bpc", &output_bpc_fops},
>>>           {"trigger_hotplug", &trigger_hotplug_debugfs_fops},
>>>           {"internal_display", &internal_display_fops}
>>>   };
>>> @@ -3172,9 +3157,10 @@ static int crc_win_update_get(void *data, u64 *val)
>>>     DEFINE_DEBUGFS_ATTRIBUTE(crc_win_update_fops, crc_win_update_get,
>>>                crc_win_update_set, "%llu\n");
>>> -
>>> +#endif
>>>   void crtc_debugfs_init(struct drm_crtc *crtc)
>>>   {
>>> +#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
>>>       struct dentry *dir = debugfs_lookup("crc", crtc->debugfs_entry);
>>>         if (!dir)
>>> @@ -3190,9 +3176,11 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>>>                      &crc_win_y_end_fops);
>>>       debugfs_create_file_unsafe("crc_win_update", 0644, dir, crtc,
>>>                      &crc_win_update_fops);
>>> -
>>> -}
>>>   #endif
>>> +    debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
>>> +                crtc, &amdgpu_current_bpc_fops);
>>> +}
>>> +
>>>   /*
>>>    * Writes DTN log state to the user supplied buffer.
>>>    * Example usage: cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>>> index 3366cb644053..071200473c27 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>>> @@ -31,8 +31,6 @@
>>>     void connector_debugfs_init(struct amdgpu_dm_connector *connector);
>>>   void dtn_debugfs_init(struct amdgpu_device *adev);
>>> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>>>   void crtc_debugfs_init(struct drm_crtc *crtc);
>>> -#endif
>>>     #endif
>>
> 

