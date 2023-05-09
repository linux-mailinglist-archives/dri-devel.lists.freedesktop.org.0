Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA836FCEF7
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 22:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7B410E3C9;
	Tue,  9 May 2023 20:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8144910E3C7;
 Tue,  9 May 2023 20:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkuTAdhGSb9zh0QygE5kA0YjX48mAcnnjsyLwAoE+4MDB8jQIHCw7ByrI4vhVQoGNDTazkicXSdKA3xF4Qgao1uHRL7TlMmBucrRVtpe7rLfdcK3g+65vfVwtoQYfkW8/licr3KTWOwFlKu3aQkWmc9dk4Dn+dxIwN4+XghCY7Ki7frCvH+KTBGDFJBq16b4KlHWOw24OAps7Q7q/DcAbRnqJZT+qvBW3u4aY+aOFbYX46hnv0J2YSCOhc5OQRUq8y5vPG0KgP9Yof+67f4kh31qkFKdg06u2FNLFBOl6i89ODz+QWyh730lrh5xPOtmp4DriSTisDcnw2xDlmk31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLGt84jd47ZT2tog8R5n5o09vt6EuOI3szsOsp8W3oI=;
 b=kVQghMIoAVX2xF3Fpnh7D9NvQR0uTJvdYvcPXiS+03DNSf4Xqfzgf7b/96qQ7KIV6rzj2KPerNAoNpKtTjSGfEpC3pyLgiNvzOPSK/Nek9U9a4bakydG0UzSXJWHsfdASvWhJhMOAZxrGXzZ1LaNNddtWP33l3lexwd5Z4XTo7lSYD1xJ5F4On0Ll3g1G/bsJBM6A5I6GYjBA+qcGoVERekFxKru/BKk9ESdhCXkCo+/A0IKMgqDLE9bVPLBsvL2Iq/qbpH4iyVk8U9tZ2JToyTQN6+G80t7l/t6WnVtdaE2mADkl/1zhw4TckI3hTYd3XON/9YnCi9urOzpiU5btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLGt84jd47ZT2tog8R5n5o09vt6EuOI3szsOsp8W3oI=;
 b=UuJlv1nvUFlPSpUjkk0HbUpdotJLr7fPRcsaXpOvTOInbOVTjZpWIPq4j5Nw3Bqg2FdGz4uZCLUXxbsf3BVAPy+KdU4e8YlQw9OkUI3JVaqyXccVSQZ/H8mFLTkir8FCeXhEN7r+YLIMYXFMeSmH2u+Eiec++VPS2tpqS18RR4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 9 May
 2023 20:00:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%6]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 20:00:23 +0000
Message-ID: <fc308aca-4ecf-7db9-3491-9ede18ee5562@amd.com>
Date: Tue, 9 May 2023 16:00:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 12/40] drm/amd/display: add plane HDR multiplier
 driver-private property
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, Melissa Wen <mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-13-mwen@igalia.com>
 <5bbd49b6-ad09-607f-521d-96f9d8eb3b20@amd.com>
 <20230509163701.57lf22phumicqv37@mail.igalia.com>
 <CAEZNXZAfq_6EZHBhBXjMPwOuU10rwKe3SPJpz1hetux=HRF4CQ@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAEZNXZAfq_6EZHBhBXjMPwOuU10rwKe3SPJpz1hetux=HRF4CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0343.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4252:EE_
X-MS-Office365-Filtering-Correlation-Id: ca831ddd-bf7c-4c18-7fa0-08db50c8067d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7s7ZhJwaXsTmN82DvTk4pkHKAkx/WKSEb+J7kRNHiKobM6sSuyO/ykkOintaqO/YlRttLmXR41ybsR52l3r0U13hU7/z0K6nxtvnM5yj1Bcw7HI7Z04TIrFC5fJkv3FUi+3JJ9fl96kbA87DncVr22TL7LaEObhN3hlK/uRfM3nWlLo27QnxT1yFOaxJ6018UkA52cDvpBuiu4XMevzBaSoji3/EdOOhR16wcTmbcsXSOpJFP0vU2viRjxrYCW89s4MpTOnuXrMfXzE+yDGwIfWPhuCZ7U6jHGluqyuUF1Z6CWPaaamq3xzPlBxUImr/k8RpZ1hh/RQR/tewE5aeIXtVLXPV244WUxuGZUc4oDa9gQSVkkyFmvWJC+0vjOYHHD7zahCtlNeb+JLLnxbGkmzdnri0oRvBqVq007p+MvLbJeVLijahi4GQ6W2LKebgDive7CZ6NTMR9VVSJHeL9kCicS/Hsr6CXtfj6aoYJEchuSCQCdoimtxYkSGEBdAc4UgzJ8VlrwmvmCbcGZJJQCOF/a3kMCUn5JkX4fDhMFX2U/tCRuw/dSpYu3R8kwqvT0M0sOSPB+FQPFHm+T6Dg2VAoSVo20NALk68mRE0LxJ8r/ohfKZ0pHNzVpv0M9+Wn2VAQlVS9rwTJhXyHXUWXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(83380400001)(2616005)(186003)(2906002)(53546011)(316002)(6512007)(4326008)(6506007)(41300700001)(110136005)(66476007)(6666004)(66946007)(66556008)(54906003)(478600001)(5660300002)(44832011)(26005)(6486002)(8936002)(8676002)(38100700002)(86362001)(36756003)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVdPeVFtNExkamJNNm1TeldTdHFrQWNpbCtLa2hEWEtHc2NpK2gweWV5U1ZC?=
 =?utf-8?B?QkZaYkVKaytQa2wveVpxcDdWTkloSWh2b3U0SjFUZ20rUThCbWpoTGI2RG9I?=
 =?utf-8?B?MVEyV1lTWnFJZk92M21nK3J2ZHNHNktvTXdUb3lPRHFIWW8raHpWdVBGa2JM?=
 =?utf-8?B?RCtlaXM5ZTJ3SnM4L1NlTG5mWWNtZ3Yyd1c5dm1xSDJZNTc3S3ROMmdYYXlM?=
 =?utf-8?B?YllIQ1BGRVg4RTJjNXpGTHZBRHJtMmQrZEYvSlZ0SkUvRzh1Vk9rb1prNkVy?=
 =?utf-8?B?Rmhrc09maE1HcmM1WXFwcjBhNzMrOXNFQTMvTHd3WUo3blF1bDlkblpIcTdH?=
 =?utf-8?B?ZXFTd2NyK2g0RVpYamFSV1EvbXRCaTMrbC9PUitNdjdlb09YRDZZdXdKM2Fn?=
 =?utf-8?B?eG9aUjJjRTI2SFoxOHZiL2tiRS85VkFxN3VzWGg2UDdyaCtFVjBTb2FoUzZm?=
 =?utf-8?B?aXNYUmNWaENkN082Tmx6TUZTQk1TRWF5Z3FrWnNuaEc0aG5pWGRFTGo5cG9O?=
 =?utf-8?B?cG5UVzhOMS9xYUprN29PaWVyL0Z1Q25SSzBVdGJhTXJaSUlMZHBEenVGSi96?=
 =?utf-8?B?WTdkVWw4MUlsN3REbHRZT0Y0K2tMSHFOQTFZTEdWTk9uRHFxcXJobmtOaStz?=
 =?utf-8?B?Tk1YWFc5cS9MbkdhWG1IU3cwMkxLeUlRNFhUODhqYWcxTTh4ZURURmN2MXdR?=
 =?utf-8?B?ZzdKb2wwaHhYSS9abEdNWFoxRVJ4bGMzWUlCajlxUXVjR2NXRDhwNVFUOHRj?=
 =?utf-8?B?eHNiUTVoTG82SmpwRzZNaHUvWlVqbWh2RUM5WnBRa2NDL3pFdG52cnVpSVRZ?=
 =?utf-8?B?VkFuaXZPaHd0a3FxVnBDOFFidk5vOUJqTE90T1lpcWpuQmFqWmwxTUVaaU5r?=
 =?utf-8?B?TXoxeGxTR1lQNlFDUHhSeDZTMTRJT0dkanh4QXlTNFlzZTBYcUhiNzUrb29G?=
 =?utf-8?B?Tm8xVUZod2lGNitrVDhsZFBrTHNNY2RzU3orMy8raXNxSmNxZWFndjY3SUxn?=
 =?utf-8?B?TDdwM3R2YytuUktnZDNHTnU0M1RPNFhyY216QjFMUkdpUEduc3JvWU9MUWlR?=
 =?utf-8?B?ZFM0NTlMSitzVGNUTi96dDd0K1pTcllGa0lpckhXSHZHUHp3VndGL2ZGSFlp?=
 =?utf-8?B?cXVHNTdsQm5GZUNUQ2F0OEVORGFBclgxOXdGNnk4eWN2SU93NXhKejJuVlB4?=
 =?utf-8?B?b05FVzR3dGxBMDdQWGpKMGxTZlFXbUNHSHVRMVQ3c1RzRlNKeGlweitWZnla?=
 =?utf-8?B?cmNWWWc4UlJySmlRUEdralk2ZkVPRzltN1ErZmk0RHF5V0JUVGZ1UkwxN3px?=
 =?utf-8?B?a1V1NERLVXZPRHVBVjJQM2VOR29TR05CWm1mcS9EaDBMT1pVSGlrS1JzS0NY?=
 =?utf-8?B?RFBGSkRSWldWUmZCUFZ2MFpQWHd4MlplZFF2WkRQTkV1N3ZIZmczYjZWTGh6?=
 =?utf-8?B?WDZLSHFYWFJEajUxQldncDVKbFp5NFE1K1U1QW8wc3dnSGdUZUJkK2pkNmp0?=
 =?utf-8?B?Q3dLbm1pdlRaYUZGVVNkc1VVYnNJOGptTkgzTHhTYjhLWUtYREZrQlFsQy9s?=
 =?utf-8?B?d2t6MkVrcll6dlcvWmZBTUkwaFdqc25PaXprbVdJdzgxNUNZV01KRW8zUzgy?=
 =?utf-8?B?dGRuQkdOZUlUSWJwbGRBMlh1S1RkQjkveHRxSzZMQnJoQTA4THlseGExRkc3?=
 =?utf-8?B?c2dEY2VaMEdQQUMzZnBVZzVTdE9qalRvSDVLT2NBOHRvOHJHLzNSaEJpc3pw?=
 =?utf-8?B?bTlwb2pKdnU2eko5YndtcHRibGMzSU1jWEhyWERaejBWZ3pWQU1iL01FSTB6?=
 =?utf-8?B?bUg3MU9zQkJRVHQ1bElKS3BaRGtIbHdCSTNaaXZzdTZ5OE80VkRzVC91WVY2?=
 =?utf-8?B?TGlPRUhhMk9zb2pLSlQyRDFVWjRsWFNnb2JxcGR3QUVPaU5BWDd5N3MzZkEw?=
 =?utf-8?B?Z0ovdEVWdG0wVDRKamtkQ2VOeFozL2NsVDlXVnhITFVwS0ZaV2VSQWxqTnZQ?=
 =?utf-8?B?VnZSYVdzbmlVdWFJUXhKcXNGQXdVd1BrcWdEZ3pYanJ2d3pnaWlRcE8yU3Ur?=
 =?utf-8?B?VzVRakFGcXhQWkhvcTRNQ0htTXFzUlUybDhyRVBCMWNBWVhMTjBLQWU5WUtj?=
 =?utf-8?Q?PuH7L4OQ6m0sgBPQ85GTCIuq9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca831ddd-bf7c-4c18-7fa0-08db50c8067d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 20:00:23.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ew3eCKocZgDmaVrU50wy5e4RHx9TYhHyFAFwYl5YVb1fRMcfyBUOshQxmVMAKGaHoQS1Z3G7b+tkyxka9ZaB+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
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
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/23 12:54, Joshua Ashton wrote:
> We currently do not have a use for this as we settled on per-plane 3D
> LUT + Shaper, but we might end up wanting to use in our scRGB stack
> someday so I would like to keep it.
> 

uAPI should always have a userspace that uses it. But if we go
and put it behind an #ifdef anyways I don't mind taking this
if we foresee use for it in the near future. A gamescope experiment
showing how this can be used to scale sRGB planes would be great.
I assume that's sort of how you intend to use it.

Harry

> On Tue, 9 May 2023 at 16:37, Melissa Wen <mwen@igalia.com> wrote:
>>
>> On 05/08, Harry Wentland wrote:
>>>
>>>
>>> On 4/23/23 10:10, Melissa Wen wrote:
>>>> From: Joshua Ashton <joshua@froggi.es>
>>>>
>>>> Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
>>>> transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
>>>> least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
>>>> nits for SDR content. So if you want, 203 nits for SDR content, pass in
>>>> (203.0 / 80.0).
>>>>
>>>
>>> Is gamescope intending to use this?
>>
>> I don't think so. Again, I'll double check and drop it accordingly.
>>
>> Melissa
>>
>>>
>>> Harry
>>>
>>>> Co-developed-by: Melissa Wen <mwen@igalia.com>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>>> ---
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +++++
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +++
>>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++++
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 25 ++++++++++++++-----
>>>>  4 files changed, 41 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>> index 24595906dab1..dd658f162f6f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>> @@ -1326,6 +1326,12 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>>>>             return -ENOMEM;
>>>>     adev->mode_info.plane_degamma_tf_property = prop;
>>>>
>>>> +   prop = drm_property_create_range(adev_to_drm(adev),
>>>> +                                    0, "AMD_PLANE_HDR_MULT", 0, UINT_MAX);
>>>> +   if (!prop)
>>>> +           return -ENOMEM;
>>>> +   adev->mode_info.plane_hdr_mult_property = prop;
>>>> +
>>>>     return 0;
>>>>  }
>>>>  #endif
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>> index ab9ce6f26c90..65a9d62ffbe4 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>> @@ -387,6 +387,10 @@ struct amdgpu_mode_info {
>>>>      * linearize content with or without LUT.
>>>>      */
>>>>     struct drm_property *plane_degamma_tf_property;
>>>> +   /**
>>>> +    * @plane_hdr_mult_property:
>>>> +    */
>>>> +   struct drm_property *plane_hdr_mult_property;
>>>>  #endif
>>>>  };
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>> index 005632c1c9ec..bb7307b9cfd5 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>> @@ -51,6 +51,7 @@
>>>>
>>>>  #define AMDGPU_DMUB_NOTIFICATION_MAX 5
>>>>
>>>> +#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
>>>>  /*
>>>>  #include "include/amdgpu_dal_power_if.h"
>>>>  #include "amdgpu_dm_irq.h"
>>>> @@ -736,6 +737,17 @@ struct dm_plane_state {
>>>>      * linearize.
>>>>      */
>>>>     enum drm_transfer_function degamma_tf;
>>>> +   /**
>>>> +    * @hdr_mult:
>>>> +    *
>>>> +    * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
>>>> +    * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
>>>> +    * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
>>>> +    * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
>>>> +    * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
>>>> +    * S31.32 sign-magnitude.
>>>> +    */
>>>> +   __u64 hdr_mult;
>>>>  #endif
>>>>  };
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> index 5b458cc0781c..57169dae8b3d 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> @@ -1321,8 +1321,10 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>>>>             __drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>>>>
>>>>  #ifdef CONFIG_STEAM_DECK
>>>> -   if (amdgpu_state)
>>>> +   if (amdgpu_state) {
>>>>             amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
>>>> +           amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
>>>> +   }
>>>>  #endif
>>>>  }
>>>>
>>>> @@ -1424,11 +1426,11 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>>>>  #ifdef CONFIG_STEAM_DECK
>>>>  int
>>>>  amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
>>>> -                                          struct drm_property_blob **blob,
>>>> -                                          uint64_t blob_id,
>>>> -                                          ssize_t expected_size,
>>>> -                                          ssize_t expected_elem_size,
>>>> -                                          bool *replaced)
>>>> +                                   struct drm_property_blob **blob,
>>>> +                                   uint64_t blob_id,
>>>> +                                   ssize_t expected_size,
>>>> +                                   ssize_t expected_elem_size,
>>>> +                                   bool *replaced)
>>>>  {
>>>>     struct drm_property_blob *new_blob = NULL;
>>>>
>>>> @@ -1482,6 +1484,10 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>>>>                                        dm->adev->mode_info.plane_degamma_tf_property,
>>>>                                        DRM_TRANSFER_FUNCTION_DEFAULT);
>>>>     }
>>>> +   /* HDR MULT is always available */
>>>> +   drm_object_attach_property(&plane->base,
>>>> +                              dm->adev->mode_info.plane_hdr_mult_property,
>>>> +                              AMDGPU_HDR_MULT_DEFAULT);
>>>>  }
>>>>
>>>>  static int
>>>> @@ -1507,6 +1513,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>>>>                     dm_plane_state->degamma_tf = val;
>>>>                     dm_plane_state->base.color_mgmt_changed = 1;
>>>>             }
>>>> +   } else if (property == adev->mode_info.plane_hdr_mult_property) {
>>>> +           if (dm_plane_state->hdr_mult != val) {
>>>> +                   dm_plane_state->hdr_mult = val;
>>>> +                   dm_plane_state->base.color_mgmt_changed = 1;
>>>> +           }
>>>>     } else {
>>>>             drm_dbg_atomic(plane->dev,
>>>>                            "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
>>>> @@ -1533,6 +1544,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>>>>                     dm_plane_state->degamma_lut->base.id : 0;
>>>>     } else if (property == adev->mode_info.plane_degamma_tf_property) {
>>>>             *val = dm_plane_state->degamma_tf;
>>>> +   } else if (property == adev->mode_info.plane_hdr_mult_property) {
>>>> +           *val = dm_plane_state->hdr_mult;
>>>>     } else {
>>>>             return -EINVAL;
>>>>     }
>>>
>>>

