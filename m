Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9031C7861E9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 23:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0B210E0F4;
	Wed, 23 Aug 2023 21:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B3B10E0F0;
 Wed, 23 Aug 2023 21:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqcIq8ygGMlk9cVOLKVV+cdmuNj2Av1dGFUo/G9u9J0coCd0eqvCiYh7RJK1Vyiv+p5c4Vvsf+JZa5FzEVi3lYIApE4gH8FZeC5gRfjkv/A5mr3FQvC3K24nduDfGLlwaCBBRHyNsYrUQfIBcaXzI5BsZ/DCmkmzF4MbG2QJqXOwjbmLbokmEvs4n4LS2+7hdzdIK5byogYC7jJXcqRZxTPNtbKBSiGG4LZ6ZI3q71zt9uHBxAGeMl/qvHSKp4IBARLoHwobDa8qtNA97GaR5I8Ekc5kTt/+74aK2ByvgDgm/iG0t1R92gX3DK/f1QgaMGh/hfOzNYTW78P/cnvK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pWuB4B/AoKQH6ac4xURArv/FBkK8sI6klNyrlJmV2k=;
 b=cElPMKIYjG2XJV7Ovu8mXp6ZkJ055lGsQYQKwz8O/h2iqvAHPVdj1AW7Ip/H4OeoYJ8mpZT9VeCPDb+2iLg0o8NCu+ZOEkS9W+aRLBzdz/YSsFGxBamqu2pZV0R1124n7sJ0UeIzmcRWnlj35ZJ9lNSPkiThyMgxLfLiCp6+xwmP4etKZU9mFZ64HfmDCMXZzIcfYeurqwI4doJa1mbcQVzusAT38U1ps1vptoY3RJL+oi1oXgyM9SW7v8w95+ZWDfRosJZTUNFjSCUAyo4shknJmc4EUWElltbuwdrsnvaE8jxXwn8zzd8oMqXcE6JwMvE72P6gHel1dcq/agMj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pWuB4B/AoKQH6ac4xURArv/FBkK8sI6klNyrlJmV2k=;
 b=meuYg/Kvm/SWyMTAKZCYxkGBZt8Mw5ejR/y3uTtr787zZeLulPWZpxA9zwHIXwxS0Psvn5qXWTs5ctc0ZSuUcwV7phJODHY/9ViMuSCL338fWGWLkGzCd2TdFT1pPb8UCc7SUtO37jhDW5u1Hz1yWUWzVba8AbNVTTUOJ6TI5IA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 21:02:35 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 21:02:35 +0000
Message-ID: <baa9f718-dc8e-42bc-88c4-757e8303509e@amd.com>
Date: Wed, 23 Aug 2023 17:02:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: register a dirty framebuffer callback for
 fbcon
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230815172700.255596-1-hamza.mahfooz@amd.com>
 <d1831afd-9e02-fbc9-69f7-e8f044f35ee0@gmail.com>
 <855aeab8-13e1-4dc4-841e-24d298c9c072@amd.com>
 <9855fa7a-dd9d-27b8-171e-b662d417b902@amd.com>
 <CADnq5_OZiTtWLMS-hh56c8KZj1eEHQGVKh6pah-qct74e4Nabw@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_OZiTtWLMS-hh56c8KZj1eEHQGVKh6pah-qct74e4Nabw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::25) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 07567e47-363c-4824-8709-08dba41c4691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nS69t6qHSB99O1TXcIx5tzxs7JDx93gE785mJHzgV87EY0C4J1UA3+7Ep6P4Nl4C37UxfU09T28Fh2V9Hub8Pt+CuceWvM/qYE9AO2yEUtiDE4jw+ta45O9YIFcBnG8GDpkEH2S6bxhqH0rhI+Dww+YFEmmmC4IOdJ1bHa0kPuC5ffjP1ZNTCPEUXjTRf+BoqdeNMCUGe1GtHKYQk6WpN52eO7Nlg6YYXvP+d36yErUqcZPyQ+pXDTwNTULjp6UiA/ITuHCpKw3OxUV8RaaFOw1o1ThG6/ZbtTPsfhMYwzQ/kltQDOBNdYz7NFD5ibQyYn/2U2vzcGoUKbw5Y5yZIm4MxIqcpe1O8EfVsQjNfT66sP6y/aC55Yp6T6y/3U1466LggutS/apTvY9SAVAhylLoO5w3i73HszA8fMdBFWNULtkCzIyl1NDfBxco4m1hzSeHo9qYS2XPC8I7NhslR0DtIxg1h04Q0fKAfbFi7It+alPUnWMud87wGEoClFQXq6JQsONfn92j/3OP7DZtIVoJ0aaoFyVfIZZ/K48LD2CWkvc3f/D0NiX9OEe2rIZMRrHqYXacFyhrX46tp3TiQtdM/2jqLLvIkaNDKMXHXsyEOvzw8nL4u2JCeztOP0qv+/OJ4QohBnJo260eicrL2LTS42G/ZpFCQhKr8pS4PiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(66574015)(2906002)(83380400001)(53546011)(6506007)(6486002)(38100700002)(5660300002)(44832011)(26005)(31696002)(86362001)(31686004)(8676002)(8936002)(2616005)(4326008)(6512007)(316002)(66476007)(6636002)(54906003)(66556008)(66946007)(110136005)(478600001)(6666004)(36756003)(41300700001)(966005)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkUwbVNCcjZaa0JjdEo2aDVlOTEzV2NRZGZrUFNmRHo1RUhmT05CTHkwSmhR?=
 =?utf-8?B?bVB2WEdzeGJBSlFyaS9lOXVwT0VXd1lNa0xWN0xyU3BLMUZEa2lvWjJsT3lY?=
 =?utf-8?B?OGYrQk9tNFNtVnMxdHNhQVlkZG9SbWJuSWxVQnNxRGQ4bDZJU1FTZ2FDd2pu?=
 =?utf-8?B?eW9QMVdHdXpRTlNRZlJYTGNjcHVOQXpIK3JPMW9NV0VWNno0TGgvVng4VHdu?=
 =?utf-8?B?bkZYeXQzWnNrVHAzNlprWGNLR2FFakM3a3hvVDVhWHMzYXNNdU1kMEdSZXZO?=
 =?utf-8?B?TFRFZ21HUFZWbWJESktRR1dsSWZ6eXRqSzBFaXVTeG9tam1MSFdpWkQ4Slp5?=
 =?utf-8?B?MGxxR09DZzBkTHhaOUJBalQydVg1M0t6SEhvMGdrbnFQbjhMOTFuV0xCa2Vt?=
 =?utf-8?B?d3Ivb1JRVXRrMHA2Y1FadFVvMlhpb01CNm11OVdXQnNIaHphVFMxdFFhTnY2?=
 =?utf-8?B?YWx5b251KzFmdVFUV0ZXcmNvcUZFQ3RGWlE5OVlDcXJPOStwdzhtOXJRVkE3?=
 =?utf-8?B?OVRaczM0aTYwcExMcDlxTzJjUDk5SHZQZ1EvSnNnUG5iRWtnRjlOUU0yd0sz?=
 =?utf-8?B?eVNsTHNXZGtrb3BONkVoSjFudGlqdi9ueDlOVHU0R0lmK2Y3cUFrM2dCMktX?=
 =?utf-8?B?encyR2FnNG13MWY3Mk5RMGp6WjBrSDEzSHNDTEtZN3MyRDkvT1Y0N093SkZa?=
 =?utf-8?B?SVIveTVUNXhLZGZSaXFSUE1nZ1o3bUVRM2xLUWtKY3NvTFRmU2trYlNpakFz?=
 =?utf-8?B?K01HNGVtL2ZMN0Ntbzg0NXFVNGpHMVpyQWwvTXJKMFdLaHJGdzNxdGNIdEtT?=
 =?utf-8?B?ajIyR2IwaC81VnFUR0JsQWFzYk1DNGhtZThtL3pTTVFMQVgzUmpwNkRLQm9p?=
 =?utf-8?B?Z2RZblBaL0FCSHpyT3c4TEtlR281bzREY1lIVkEwRXVSVjFvbkJxbmM2L25O?=
 =?utf-8?B?U0xsd0dUZlJTUjF0dG1MY1REQzJZTnZCdjhXS1lwQVpjdWx5cmI3MmpUQVA2?=
 =?utf-8?B?WHBDWUJQMmMvT2lXQURIMm9QdkxGS2kxVmhDbDZRTW96L3Q4M2hkc2ZjWkc5?=
 =?utf-8?B?cUYxaitiMEZTa2g5U2xTL3VJVGxZRU5NUk9qWmJkRnp3OGJnak1UY3hsVWla?=
 =?utf-8?B?UE1MZllxaS9MYkNjN3N6SXl3WFBuUmNPWXZGWDlENnRSdkxVaU0wbmt3dnF6?=
 =?utf-8?B?SFBmRDU4QTFqL2JycGxlTFU5bnE0bGNmLzdRTXVSVXpkcVJyYWdEU0ptZy9a?=
 =?utf-8?B?K3lFWnlZUHBIS2tWYXBFNmh1aU8zbmNqWkF4TmxkaW8vZ2tmdVBkZjUwazhn?=
 =?utf-8?B?V1JoVmlJOVdNV1dxTlZody9MUEQwUnA3TlAwYnhCTWR1Z0ZRODZ4M1laUDl1?=
 =?utf-8?B?UnVKM3piZlNlNFYvKzBsN2FMLytSc1RiY0p2dFhOdGtGb01DRnFYbGNhUGNQ?=
 =?utf-8?B?cnpjSitwVFozdWwvajJVTnFVVW5RVXI4a1JjUDVPbHljTUlLNFpTQzR1eHlC?=
 =?utf-8?B?MXdKaVBiRFd4RUdHaU1CSVZuV3RGK1BUeEQwa0d3eGhmMW5DUUpHY2hYY0xr?=
 =?utf-8?B?aGk4MEJqL1BNN2xIY3JOMDFRaUptZG9maC9xQ0dpOElyUmJlMmhocmlHeWcx?=
 =?utf-8?B?cWdwK1pHM3M1aVhFbkplV2VEK1UwK3hKV0hPZWZMdTd3dlh6NERqWmJTa2c5?=
 =?utf-8?B?RUM4ZFRtelpySGhSejVJRVdxQ3VZNTFvWEg5R0Fxc1NoT2t4ZHhSU2dMQU9L?=
 =?utf-8?B?bnY4SXduaG81WGdOMTJNVEJUM080bHFZeG9EUXNFWWgzZ2Z3SkV5Vm04VWNx?=
 =?utf-8?B?aVIyNFVtZU9Jd01CWmtsamFlTURxOU9vajM5NmFCUmZibVJPU1VJc0lxUS9W?=
 =?utf-8?B?TS9pZUkrRW01eWM3bVFWakYySHNRVWpIS3RCTW84T0x1VVRwdDl5ekJtNzdG?=
 =?utf-8?B?eUVzZHJaWno4YW1UeHJDdFNYdUFLRFNKek1aVUdMN202RE9pQWI3dEtWRVNm?=
 =?utf-8?B?T09sRzMxcHV3ZE5rdkVURFRKaUlrajJpZEEyOXhLeTlUOEZzbjVMVmtiYkNO?=
 =?utf-8?B?cFVOTEY2V3JaWmswanRXbnE2YWMxYzdjYXhvelFUbVNXMkVxVTFrTklldkZi?=
 =?utf-8?Q?75mu7n/aTdR5uln5BmPgQdAIC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07567e47-363c-4824-8709-08dba41c4691
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 21:02:35.4709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3Kv6y9rJaEZf19xqvHvQEzYP1U176JEe3W8izVCxHh9z+SQNjEy0OS0fWaOOwwfGvQaynvjPYgPVIioiJIM9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/23 16:51, Alex Deucher wrote:
> @Mahfooz, Hamza
>   can you respin with the NULL check?

sure.

> 
> Alex
> 
> On Wed, Aug 16, 2023 at 10:25 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> Am 16.08.23 um 15:41 schrieb Hamza Mahfooz:
>>>
>>> On 8/16/23 01:55, Christian König wrote:
>>>>
>>>>
>>>> Am 15.08.23 um 19:26 schrieb Hamza Mahfooz:
>>>>> fbcon requires that we implement &drm_framebuffer_funcs.dirty.
>>>>> Otherwise, the framebuffer might take a while to flush (which would
>>>>> manifest as noticeable lag). However, we can't enable this callback for
>>>>> non-fbcon cases since it might cause too many atomic commits to be made
>>>>> at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
>>>>> framebuffers on devices that support atomic KMS.
>>>>>
>>>>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Cc: stable@vger.kernel.org # 6.1+
>>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
>>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>>> ---
>>>>> v2: update variable names
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26
>>>>> ++++++++++++++++++++-
>>>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>> index d20dd3f852fc..d3b59f99cb7c 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>> @@ -38,6 +38,8 @@
>>>>>    #include <linux/pci.h>
>>>>>    #include <linux/pm_runtime.h>
>>>>>    #include <drm/drm_crtc_helper.h>
>>>>> +#include <drm/drm_damage_helper.h>
>>>>> +#include <drm/drm_drv.h>
>>>>>    #include <drm/drm_edid.h>
>>>>>    #include <drm/drm_fb_helper.h>
>>>>>    #include <drm/drm_gem_framebuffer_helper.h>
>>>>> @@ -532,11 +534,29 @@ bool amdgpu_display_ddc_probe(struct
>>>>> amdgpu_connector *amdgpu_connector,
>>>>>        return true;
>>>>>    }
>>>>> +static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct
>>>>> drm_file *file,
>>>>> +              unsigned int flags, unsigned int color,
>>>>> +              struct drm_clip_rect *clips, unsigned int num_clips)
>>>>> +{
>>>>> +
>>>>> +    if (strcmp(fb->comm, "[fbcon]"))
>>>>> +        return -ENOSYS;
>>>>
>>>> Once more to the v2 of this patch: Tests like those are a pretty big
>>>> NO-GO for upstreaming.
>>>
>>> On closer inspection it is actually sufficient to check if `file` is
>>> NULL here (since it means that the request isn't from userspace). So, do
>>> you think that would be palatable for upstream?
>>
>> That's certainly better than doing a string compare, but I'm not sure if
>> that's sufficient.
>>
>> In general drivers shouldn't have any special handling for fdcon.
>>
>> You should probably have Thomas Zimmermann <tzimmermann@suse.de> take a
>> look at this.
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> +
>>>>> +    return drm_atomic_helper_dirtyfb(fb, file, flags, color, clips,
>>>>> +                     num_clips);
>>>>> +}
>>>>> +
>>>>>    static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>>>>>        .destroy = drm_gem_fb_destroy,
>>>>>        .create_handle = drm_gem_fb_create_handle,
>>>>>    };
>>>>> +static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic = {
>>>>> +    .destroy = drm_gem_fb_destroy,
>>>>> +    .create_handle = drm_gem_fb_create_handle,
>>>>> +    .dirty = amdgpu_dirtyfb
>>>>> +};
>>>>> +
>>>>>    uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>>>>>                          uint64_t bo_flags)
>>>>>    {
>>>>> @@ -1139,7 +1159,11 @@ static int
>>>>> amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
>>>>>        if (ret)
>>>>>            goto err;
>>>>> -    ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>>>>> +    if (drm_drv_uses_atomic_modeset(dev))
>>>>> +        ret = drm_framebuffer_init(dev, &rfb->base,
>>>>> +                       &amdgpu_fb_funcs_atomic);
>>>>> +    else
>>>>> +        ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>>>>>        if (ret)
>>>>>            goto err;
>>>>
>>
-- 
Hamza

