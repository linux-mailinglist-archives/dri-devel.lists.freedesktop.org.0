Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45964CFDF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 20:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C1810E459;
	Wed, 14 Dec 2022 19:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D6810E459;
 Wed, 14 Dec 2022 19:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5Fb18OvY59cLRbV53uPjk7DrZKDcmRW6qKoMsGjc/oVSb0z0IqIclSk49YW5p1lwlJDcq++BE6v2+QtU1JHHV1XS1qggPS7Anffc0vcvMt/CR7JA38G+neWbU5Dnmr8XL1FNKVSA6zTkXRa7LT1oRovBKFAMwxb/Vd3li0FY15Px1zr5lPppJOuaszld6+UQ1KMTVuhBMMRD/5VunOZSm6o64yV7XUMQFnVyCYf/xGKL6FHbwQeT9RAMALobwzfL45G0yIe5fTW0j5b1xLpn7F80R3xmjZmdJawVgRucwhr7eFx777IkN0/5+4oUtX+49HmuvPrbsg4Cu4PW+o2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5F8AhRHJhOCUJs7ByETc42fU8360MKhNU8JmYrsTsX4=;
 b=A3L9B4K4TdCF1Uqdxr4HaMRuN3QmCuoqmIBF95QqS0NMS7SOw9Y/Bs1v9/BcZrY1XhMjQ3jt0vl78MbGtql4mCIlZQdkbj66qPuQrOeCz6VyvN8VNePb9wcQW8cRWWYX4soRM2/1G83q8Q5oK/BW54BUK6qFjBbqeup/6HTZKryrpWhEZNtjY2sCryBg3uE+80l7l0E6AaL7ewfTsmr9ng+EuiaGwOat3VLOC3VUMl2Mmoh6CahUbj8frTz01F5GBom+bJVQo+IJ+92GCIirmm0BsFm7GoS6CW8U/eB8eOJ4cS8b/6lOvJCYha0h8ZvfmlK1D8E8+tsubRjIXZguWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5F8AhRHJhOCUJs7ByETc42fU8360MKhNU8JmYrsTsX4=;
 b=wJemkKWgSG8kVZlWZz2y+3S8vyccx2xJuJykLKwRIT0n2bhyloo3jx5iR5gbl0doVHrj1qQkTPJX5rKmZHvWxo8bq2PdfET/58AOIhHxgJUMGhcom80oce3lAufVwbRTRgwywlPrT7koh7l4GvoCqmJHyBvy5vSw36PesMgBN7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 19:07:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%9]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 19:07:46 +0000
Message-ID: <067f3bb8-ee3f-3f05-fbf3-567367decf60@amd.com>
Date: Wed, 14 Dec 2022 14:07:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/16] drm/connector: Allow drivers to pass list of
 supported colorspaces
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-7-harry.wentland@amd.com>
 <20221213122342.548631bf@eldfell>
 <25da5107-9bdf-abc9-adf8-98778d87dafc@amd.com>
 <20221214105556.63a9296e@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221214105556.63a9296e@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0238.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc23011-776a-4325-1a8f-08dade067c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: raSCqCeBtpgcY12gzcF1lWatsnTlls7cxfm+zacqCNnX8ncO6kf8ykEzUKFED86bAUudCJcbw6Cwd7QRsBTgGFKBk0OP9LWOE6zI3Rr2OHUUUF2KgJ4GvTEz+FeLF2Gd7O419enaHFfLU7XUmiB4Myn5JdhsKhpPHxQpkz7ogt5H6jNUHwcbxYV8pdQ1eTe9Go0bbY/tj1vEsQwIVs85B33TVXIn5aEjKSjH2ZKZbXRtExE9yjFf8wrjx04gymIYMG5xURCS3LtxusqA4Mtsku8rqb2z0IiT2Uk5cst5k+UMeXk3N5zpEmXYaPppO34mGw8LAouziGmmZ7+wl9giCTe925VP1jIA2Wyrx/gNq1a4OEcipMEp2O/DG33ehNGwP6xqugYWOsCJtd1NwkFu2E3j+WtP8VgxNKn40rEgsY40sM6Pqz7mJlVtlT5clSl8SuCicceYRtUgMtkjGxez1ZEXIchZpsfYpT8gexhWUKSzC/Eiqu/l2uBMqcIR6tD0xriokpqHaKN0//8/giLEH3kyXrFKpJG5PKuRkuu2LyS7v/tLMLLkOhBS5KAinwcluQQIRdVM0MufpdRfHqooYIpzVZB/IqoRlxRivG38bESCanEckmpdxAqv41lvTrAB3NKliRerJTu4igKL+U4QnkUN323KjqVa59Y3/z093Jl0bYh8lFcAmFrdsxYCalDsIu5MeaWyWbo7H+Z7xAdPHYwxod/H0V7h26nkLV7nTGdvjxb3snkWphbKmmTo7ull
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(86362001)(41300700001)(66556008)(66476007)(66946007)(8676002)(31696002)(6512007)(186003)(26005)(2616005)(4326008)(478600001)(966005)(6486002)(6916009)(53546011)(6506007)(54906003)(316002)(6666004)(38100700002)(2906002)(5660300002)(66574015)(8936002)(83380400001)(44832011)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpyaFo3eGhTRFNOZmtyNStUZVJYTUYxeWkwQ1k0U2I4SzN5cGdPUDFrTFBa?=
 =?utf-8?B?d3Q1TlBpRzBBRFI5Qy80NzRiSUNpYUk1NkZBWlh1LzRCSU40R2tJS2pMQ1Jm?=
 =?utf-8?B?bXgzclJJcEVOR2toKzRLR255OFRZU25FZUJ6U2k1ZXNiZndiRm95WWZrWXBS?=
 =?utf-8?B?ZVUzOENqcXR0bzYvUUVvM2dPdmpWNGc0NzRqQ1VLMkNnNTZWcWlBZ1c4ZjNj?=
 =?utf-8?B?TnhEWkowdzc3T2lYWDRkZ3JJRVROQW92R2k1WHZqNnZGQ0NLYXFTYkYzNHhj?=
 =?utf-8?B?YUlQQWhYaUhOb29jWGZEdXU0eUJXQVQ4cmxsYnk4ZXdoeFo4cEVsNmFMVHRW?=
 =?utf-8?B?Um0wbG9pcE9hK0JLNGh6Yzk1VmpVYjhJV1lVMDBOakVPL2t6ek1iSDU5Mm4z?=
 =?utf-8?B?b202dXRDaTc2QklsY1FCeU9hOTlFaC8ySU9jOEpWS3NIZmUwMVQybDl4Ry9Q?=
 =?utf-8?B?ZTdUUkZNNmpCMmNrUXdIYVlIeTdqcEZnblcvbEVNVFlpbkVCcjFaWDY1UFBV?=
 =?utf-8?B?V29uc0E2Z25uaUxuSmpOR0NHTlJPTlBDa2xVcW1kS0FOUHk5cTJtb2ZqY3py?=
 =?utf-8?B?QjRqQzg0ZmFCbEdqZnRQdE4zQ2F3bll5QlR3S3Y0dHdyOEJ1RGNJcEx3TGht?=
 =?utf-8?B?VXEzbzAyWlV2K1REcGpOcWhreHpDcXYzYzBveTlkenlsZ2gwaUNKL0J1aFJs?=
 =?utf-8?B?eG9WL3ZBVGQ1bGVvZ3ZpVURFZkRsNElEaFJvYm9XSmNMeklHbDlBQlMyQzJs?=
 =?utf-8?B?OWQ3V3FPU093NTNLSTVnSjRaVDZNbnNDUjVsQ3V5QlB0N3FJQnhHd29EcStm?=
 =?utf-8?B?OTlDU01wRUs0TGMxR0ZpRFlwZ0tDT3FCSVJIRGJaU25NTUpMUUhsaTlibWlr?=
 =?utf-8?B?MG55cXRNVlpBd2Vna1gxVlVZQUlBamhVYmorelJJNUEzcCtXTERieUJqbW1Z?=
 =?utf-8?B?M29PcS9mbDF1WU9jUkRLN2VmVFlIQjVTbEc4RE9JOGVtR20wbElCdGlWTHRi?=
 =?utf-8?B?c0lKaHFrTElPdUJxdGtZNjd4N2lpOW9UMEZJV1ViS1NKVGFzWnk0TGwwQmww?=
 =?utf-8?B?TDVQV1dxR3Q0ZENBdDhpRzhkd0JVWkJRc1FscGp3VkxFZythQzVGRlVlcEY1?=
 =?utf-8?B?ODZYRWFwTGxhcGp0ZHlNSCtFMFpaVG9HZzZtUEdGbm9nQzNkM3Q5bWladnh0?=
 =?utf-8?B?eDZoUXBnOFhtdUs4UU83ekptNjdUWkRnN0lxN0V0Q0RlRjNWZi85RlZPNFBB?=
 =?utf-8?B?YVdUdkVwaGErY0s5U1ovL3R3dldRYmtyT1N3Sy9wcWkwR0x0VWU1c2pjVGoz?=
 =?utf-8?B?OFREUHZUb2luTmlRV3RIcVVZV2llZjBYOVdiREk2NU8vYjRQUlRMemU0enpy?=
 =?utf-8?B?cHVjeUlYOFMya0I2WG1pbkJjaXo4UGw0TXU3S2VXWmpvQmdRZXZja290cVZt?=
 =?utf-8?B?S3NndzZhSC8xMmRDZnJRbkZ3RHB5M1oyT3BYV0RUMVFmVGRmRFJ1UEdTSUlU?=
 =?utf-8?B?VGo1TFpsdk4vOWNEenZaSnhFUEFJdDljMVNSWVBRVDFMKzBsb1ZCZ3lzRHNa?=
 =?utf-8?B?N3pJQ3I5UXkvM0pXSC93amtoQVVjNDhhM2Yzelo0UGp1b1ljZmx1UUJ1TmN2?=
 =?utf-8?B?RjdiOU1YUXlRR2ZlSFkzYXRNNmF6bEdzWUdpOTV5SmVoTEhUb1lsQkdITERU?=
 =?utf-8?B?bVlxWC9ISVZ2bFJ2ckQxL1pJd3d4THRvQllvU2VCLzM5cE83dlh3YVN4ZUZC?=
 =?utf-8?B?RXBERFJvVjV1QS9YOWJody8rbEJSeGZHUnJkcEJFNU1hT0lqQ0pvTWhTRzVG?=
 =?utf-8?B?UXI3YlpCUUs0R1Y2NWFDb1Y0YmZxaVlsZXp1cjZneDUvOWJ5N3Z2ak9Sb0VU?=
 =?utf-8?B?QnN2c05raVhTdVFYZThXR2NUb28rSmlJYm1oa3N4dlplaC9GbS9vSVlLNTJI?=
 =?utf-8?B?WHU2SFpMU2NmcEhtYXY5Tm1kQ2FUc2UrRDdzdHc3ajdwdWJKZ1UrUlF0RHhX?=
 =?utf-8?B?aXFWTEtrdWEzb3JGajNsUUtVY1R2T2JyNmxIb1Q2QzgxbnNRL2VZZTZoWjRv?=
 =?utf-8?B?YVVuTncwRXArcFRteXV6TE1lYm1OcVJuZHZydmRCemxjOXZvRkVFVUxzTWFl?=
 =?utf-8?Q?gz39ZHZJMoeSOAyLUdmQjKx+2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc23011-776a-4325-1a8f-08dade067c60
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 19:07:46.6845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Xwaram4wU4ZDlk6pccWYWJCoUJUqM8HfevnEYS8Kd8OB24lXQMsyejM6+zuElx9Q7X/ROKP0ZV6vSTXFNBdOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/14/22 03:55, Pekka Paalanen wrote:
> On Tue, 13 Dec 2022 11:32:01 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 12/13/22 05:23, Pekka Paalanen wrote:
>>> On Mon, 12 Dec 2022 13:21:27 -0500
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> Drivers might not support all colorspaces defined in
>>>> dp_colorspaces and hdmi_colorspaces. This results in
>>>> undefined behavior when userspace is setting an
>>>> unsupported colorspace.
>>>>
>>>> Allow drivers to pass the list of supported colorspaces
>>>> when creating the colorspace property.  
>>>
>>> Hi Harry,
>>>
>>> what is there for drivers to support? Isn't this just infoframe data
>>> that shall be sent down to the sink as-is with no other effect?
>>>   
>>
>> You have a good point.
>>
>> Right now the supported colorspaces de-facto depend on driver implementations
>> as you can see in [1] for i915 and [2] for amdgpu. The amdgpu driver will
>> also program the MSA [3] for DP connections, and a bunch of other things which
>> are deeper in the driver.
>>
>> [1] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry/drivers/gpu/drm/i915/display/intel_dp.c#L1741
>> [2] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L5155
>> [3] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c#L368
>>
>> I don't know why the DP VSC stuff needs to be in drivers. It should be
>> common. The MSA packing would likely have to be driver specific since the
>> mechanism of packing it is HW specific.
> 
> What's MSA?

This is from the DP spec. It stands for Main Stream Attribute.
It's a packet similar to an SDP that is encoded in the DP main
signal stream (as opposed to an AUX message).

> 
> I don't see it in
> https://www.kernel.org/doc/html/latest/gpu/amdgpu/display/dc-glossary.html
> or anywhere under Documentation/gpu or in CTA-861-H.
> 
>> I'll have a closer look and see if we can eliminate the "driver supported"
>> bit. If we can't we'll probably need to describe the reasoning better.
> 
> That would be nice, thanks!
> 
>> Will it be a problem if the list of supported colorspaces differs between
>> drivers?
> 
> I do not think so. It's just normal KMS UAPI that one must always
> inspect an enumeration to see what values are possible. Userspace
> cannot use a header with pre-defined numerical values, they always need
> to be introspected first like everything else about KMS properties.
> 
> I know there were some opinions about hard-coding enum numerical values
> in headers, but I think in the end everyone agreed to the introspection
> even if it didn't seem useful at the time.
> 
> Besides, if a driver never supported a given value but misbehaved or
> refused, I don't think that counts as a kernel regression?
> 

True, but I would imagine that can be confusing for developers of DRM
clients when enabling support for a new feature. I would guess it's
much less confusing if drivers only exposed functionality that are
expected to work (and are hopefully tested regularly).

Harry

> 
> Thanks,
> pq
> 
>>
>> Harry
>>
>>> Is the driver confusing colorimetry with color-representation (the
>>> RGB-YCbCr conversion)? Or is this property defining both?
>>>
>>> I feel that the documentation of "Colorspace" KMS connector property
>>> needs clarification, and a list of potentially available values with
>>> explanations, more than just a reference to CTA-816-H which it does not
>>> even do yet.
>>>
>>> Perhaps a table, where for each enum drm_colorspace entry has a row explaining:
>>>
>>>
>>> Thanks,
>>> pq
>>>
>>>   
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>>> Cc: Vitaly.Prosyak@amd.com
>>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>> Cc: Joshua Ashton <joshua@froggi.es>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: amd-gfx@lists.freedesktop.org
>>>> ---
>>>>  drivers/gpu/drm/drm_connector.c               | 140 +++++++++---------
>>>>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>>>>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>>>>  include/drm/drm_connector.h                   |   8 +-
>>>>  4 files changed, 83 insertions(+), 71 deletions(-)
>>>>

