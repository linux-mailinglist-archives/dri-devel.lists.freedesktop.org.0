Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63187BDDA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 14:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3B110EF84;
	Thu, 14 Mar 2024 13:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xUg1yX89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5F610EF84
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 13:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcPt0ZFW+bwn7KxL/LjzfrS4lgV6su6dy8foC7PXFFy22cdxVDkFNMsS5QMjjfhNUGKebhmQvQ6C0uw06Jim43gGW5kwUZH53ZUfFmXNoev/0cLwCIc6oXZhQori6z09isfYZ94tuY5xImnfzyRaCqkRwZ55/NApcyYJb3MhJaJW3RAOMLV0+Jm2gebgmsOsYipDlYzuT2ykDxAP1oiNoKtCWH6KZPsBkLoYRIP4mccZ2I6LX7iRFSMNzwPlKv0WsWUSu+icqdFT10YT2qQadd8MX0XNl88pLKvDsFgVtSEoUqOezzxvYkvQC3/gx4vz1ryyEFz9TNT0+b89iVssMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxtkIon4ytkEkJpTboPu1ojAvz/fWvb7hRMM9YRF47M=;
 b=R1IvWECaogNWwaa07XD7uUkxCZg9Gn2+6PZUQIqnweDBneJJ7bG8hgfLlRIVJgymj4EWuhApvfF0XoF+9CITMNL3DDBArYrVq8wvaGnn8/dgtFbw8ELQG6hj4wUnL7B63ZO0YYtKeTbR9ylr7ovfaJErkWF4GEamNF4bMbpy3T7zHqFAafuTJD0lLqVFDo9wug5isrpHfmnwTFYi6v9EMNiJKV5mpBYwe/3AOk5HFnmi6kmIn9VEeQvvAtVZqY4WWZxRk/uu/9HrrORaFyGfCFh1ZhUoBpUUPLN2GeAihccReveFW2J0Xw7JwnZyJ1I57jXJRppAwU8pJh5KUoIu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxtkIon4ytkEkJpTboPu1ojAvz/fWvb7hRMM9YRF47M=;
 b=xUg1yX891LfTUZWHQeWATVhWbGvwoaa53ZHy+th6auPU85p2M6MOUVr5XC031bfyRRyDA3UIbLYfE6+FLQ2s5T4Cbbe139Y8zkAp9OPKSDaVMgHbdF4Xp03yzzEsm6J+fsbpcsWSypSgnDckjAszPvO4W+zaNzvfjM9t2uAvPqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB5632.namprd12.prod.outlook.com (2603:10b6:510:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Thu, 14 Mar
 2024 13:38:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef%4]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 13:38:02 +0000
Message-ID: <1343f75d-393a-4381-b058-4816bb429241@amd.com>
Date: Thu, 14 Mar 2024 09:37:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm: Fix drm_fixp2int_round() making it add 0.5
To: Melissa Wen <mwen@igalia.com>, Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
 <yyrvbqpmqplwtqfdsjkhzmx7wrk4h67kn5443bdou7c7uciouy@hac7zfxiff7t>
 <16f8867c-147a-4149-ba96-ae70f8eaf903@riseup.net>
 <nzce3m2okiqdd6iqj6ynymus64vjcpdep3jwqgs4uw3rvkvqkz@tz4i34w7b6es>
 <qabkvxajmothdzi4x6p56sehs4tmqgpniki5vyzu55gz6ogkmt@mypwkdofe2kt>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <qabkvxajmothdzi4x6p56sehs4tmqgpniki5vyzu55gz6ogkmt@mypwkdofe2kt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0431.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: 443083ef-69ff-44e7-3b91-08dc442bf88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: duS451n/Hx8DyB3ocTxNtRRSpQb+3vt+2lUTO8LQD5URDnThFdkiVuKk/wYzuaqXxtugFYNECxAl3+Rd2axfUAJ3Y8z7g3CYoUbAUIXHoYP5D2eKjZ+0Jbzd992OgopBzMtNtsfpxBYT6R44nNQ3ykvwqCtwaNNtKN8gXFmGamAPjyIuCgarzsJQlbnCpX0AwnlHEotV4NUH8FaiT6NSxsvrihkFcxisAUC1i0qEqZT36CVgzJVKX9GWqUgivlPpIarfdZ1dlaksPvcoaop/pyIVXCJy4NEUP0B1s+86Vn0ZO0+dbv2oW79MTsTfg7nImbEfM1rs3YaI6ZfGF0TIqdckjJAnMGRmgzNJSkHJn/trM7UCrLFF236DWkhNQfVhx1DLZXXoUR8KNZAEpgD4zdU8Pmf0HANy+gxkyBNcahYeaUjc+IeNkMHpnMuuBRhsfIabWEE2dLnIjmLDCrcPpXWMpnhbCM1k7eviQI/7LDFNuSaX+LtJtIIJ7nPfo1gDpt01j8OHSPup0Ojp79S2LzWDDnRCOzccaEWJfnVdiffEjYlY+nnKNHB1vwzX/pncnbomx/hvVEjvXAw4pSv4Wk68J6N2NkYmmMzyV3nca//8lKldgS+eEgUc40kJEC1g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUczaGZPV1VGMUN6UkVYOHQxYXJPclI5bnY0UHphM1dYdTlBck10U05XSGNp?=
 =?utf-8?B?S3hpQ3RFUTJjczJmbWlUUmRKZDNyb2orQVFLdUdaZDRUMjY1U2srdjhYUGtl?=
 =?utf-8?B?M29wUFpwWVVJNGgwVnFYNDB1T24zVU9hV1dyeldobFFMQWxsc1ZSU3Z3ckxh?=
 =?utf-8?B?bVNaeExsK0ZmQ3FBTDNCMUZCNU9KeUo2UTlrWXcxdXBYdGZXbm56Y3RjWTlX?=
 =?utf-8?B?QzBsYTZ5VnFPV2NpdXhFbkV5bXdPemNZTVF1R1RxOUwyU0lWcWw1MXJkMksr?=
 =?utf-8?B?d3VOZnk3Y3F0NWR0b21oSms1bzdya29VWTNVRUFONjhIb2NUV3h5bUQwdFIr?=
 =?utf-8?B?OFpxbnpNMTBKT1lIUlQ4czVORzdWRzFSM21ob3lhZkRVU0Z4VGxvRmNMUVJH?=
 =?utf-8?B?Rlc4RVA3Ym1YWEJweFllaDdVZkQ0Rjg4QVZOZmdPUkZ2KzNDdEpCbWJjNUt2?=
 =?utf-8?B?MlQ0QlRUNTg4QXJpQTl6SEdWSVIzK2Z1b1V5WTg0L1JNVGpwK0kreGVpenB5?=
 =?utf-8?B?UDlQeUdHMGhRTklyN2R1c21mVnY5RURjTkpVamFtWStYMjFZLzFtNW13ZzhF?=
 =?utf-8?B?VHpOVHI1YWFFN0FVSmZaSFdVaWdVV25IaUIvUXJkTlNWajFRNkVyRzNvSlJR?=
 =?utf-8?B?aVRpMTVZaEwxdFVwRG9Md1BhQmJVSlFuNlp3UmtnSm4waTJMUE5VVXVtQU05?=
 =?utf-8?B?WFoxdkFsTEoxYUxBQ0Z4T1dCOHBYUnpPL05zd2l1NTFYSFBRKzJLRmMzV1Jo?=
 =?utf-8?B?ajNYdjBpcVI3cDhPWENrajBqN1h1MDhrRm5KMDZDeldMY3d6S3FiUnJlSFQ4?=
 =?utf-8?B?VXp3YVVIbDlKZDB5ekp2UWNOVGUvODY0SzdyZGRyMy92UTRXMnk4L3o4aDJU?=
 =?utf-8?B?dmdkR3lzMENTWXZVbHNJUlNnd1EwUVhEVGl4VFh4VVJmbTZsSmd6emlvSTJp?=
 =?utf-8?B?WkVlQ1lZS2pRMVdhRUw2NU1SbDVWendPQmtqZjd0bGhvVlo0Zkd6bmQrek8w?=
 =?utf-8?B?RW9RUFpmQ2NYWTdyWEJGbWJ5enhOdjI2ZHhxZUQ2TmVJMllSWXFlOFVJcmda?=
 =?utf-8?B?NFpDMFRNclEyS1VkL0FRQUN3TlRBbFpKM1haRzRoYW45dUY3TFR1RmFNdWFZ?=
 =?utf-8?B?TWQ5MUtkZXRkdXhFK2R1WGsyV3hsNEJaL1gyZWY0dEpzWnNHUFBqRFF5Zkln?=
 =?utf-8?B?dERLSjFtWG5WaENta3YzRWFSaTh5ZnFGQjkyQSt5anptZFY5TWpNc0x5STFS?=
 =?utf-8?B?MSttN0JwTnRMdUkrMWRnZmU4SWFWU3dwREgzdVJtMFNiVEUxN04zYjFmSGNY?=
 =?utf-8?B?YlFqM3duMk9ackJqK3I1a2V1VFVObzZxdU9UWVJUbzkyR0lRZUdCNldCbGZw?=
 =?utf-8?B?ejdFUzEwNXVCWFJhZk1ZaGpkb0kvb1J5cjlTV0JsOE9KQzFxMGpLUm5IcFBD?=
 =?utf-8?B?T3dBazJlaGUxOU5kSXlwKy82eHh2VDNvL1Y4MzVvN3ByMmZBOE05MmpqbGph?=
 =?utf-8?B?enhqb3NzSmpKMU5mTE1Bd0NiUll6WHF3Z1FjZTdtTDc3bDdaSGozcjROQWQv?=
 =?utf-8?B?ajRxcWpjWWV0VUprc0w2S1RKQitPb3JTVW1ZMm5pcmRlZENEeW5HQVg1WkJ0?=
 =?utf-8?B?WDlrUjRoeFhCNGNRSmZXcU90UHhoS1ozL1VzdkZvajVMVWVlZmRrNGpMN0lU?=
 =?utf-8?B?SU83RnUxQjRLemZMVUJoTmNVNEpMOGFpMVlqV2w3QnNuVzZwK2RoN2V2NG9p?=
 =?utf-8?B?bTkyN2cxaHMvWDU4TnhCelpYSFB4NlZsVzR0REVrUlM0ZWJ0TkpBcjVmYlpu?=
 =?utf-8?B?aHA4eE5xMWs4U3VyYnZMWklXcm05c0ZHb1NoRFRkUkJzS29NeUt0L2pOM2FN?=
 =?utf-8?B?bVFhcnZpelJxM1d3eWxJd1VCK25kQ3RQeXVWWFZFRFkvK1F6N0JqNnVyT1Aw?=
 =?utf-8?B?TjVScEI3VnZXUW82MkRydm9ud05iOXpMQmRxRHpKdUYyNUhVOHJnaHo0V3Rp?=
 =?utf-8?B?K1B3RkJVZnR3UWppVGJsUWN1UTRvOFFIeWlLblpjUlBaRFhVZTFGTVlkTSta?=
 =?utf-8?B?NGdsMlR6akNFTnBzdHEzcXVhS0NiekdSR3NFenJ4V1JNcUNadmF0bUliKzAz?=
 =?utf-8?Q?4fWh1VurfSJCf/he8OR9RA+Ag?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443083ef-69ff-44e7-3b91-08dc442bf88a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 13:38:02.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LXaosN3FoPERT4fpxVRbGQq+selrsqDXexaXYkPUF+PLy8FpbyXSvhzFMOGsPM87qHb3C8Xrpo+IKCNS5e5Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5632
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



On 2024-03-14 09:31, Melissa Wen wrote:
> On 03/14, Melissa Wen wrote:
>> On 03/13, Arthur Grillo wrote:
>>>
>>>
>>> On 12/03/24 15:27, Melissa Wen wrote:
>>>> On 03/06, Arthur Grillo wrote:
>>>>> As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
>>>>> To round a number, you need to add 0.5 to the number and floor that,
>>>>> drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
>>>>>
>>>>> [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/
>>>>>
>>>> Hi Arthur,
>>>>
>>>> thanks for addressing this issue.
>>>>
>>>> Please, add a fix tag to the commit that you are fixing, so we can
>>>> easily backport. Might be this commit:
>>>> https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vkms?id=ab87f558dcfb2562c3497e89600dec798a446665
>>>>> Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>>>> ---
>>>>>  include/drm/drm_fixed.h | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
>>>>> index 0c9f917a4d4b..de3a79909ac9 100644
>>>>> --- a/include/drm/drm_fixed.h
>>>>> +++ b/include/drm/drm_fixed.h
>>>>> @@ -90,7 +90,7 @@ static inline int drm_fixp2int(s64 a)
>>>>>  
>>>>>  static inline int drm_fixp2int_round(s64 a)
>>>>>  {
>>>>> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
>>>> Also, this is the only usage of DRM_FIXED_POINT_HALF. Can you also
>>>> remove it as it won't be used anymore?
>>>>
>>>>> +	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
>>>> Would this division be equivalent to just shifting 1ULL by 31 instead of
>>>> 32 as done in DRM_FIXED_ONE?
>>>
>>> Yes, but I think the division makes it easier to understand what is
>>> going on.
>>
>> Right. I was thinking about slightly better performance, but I don't
>> have any data. We can go with this since you consider more readable,
>> anyway.
> 
> Just checked that Harry proposed in another patch[1] this:
> `#define DRM_FIXED_HALF		0x80000000ll` for the 0.5 const
> 
> Doesn't it sounds better?
> 

I tend to agree with Arthur and Pekka. DRM_FIXED_ONE / 2 makes it
really clear what's happening here. And I'd imagine compilers would
optimize it out anyways.

Obviously not opposed to a define but if it's only used in one place
I don't think it matters much.

Harry

> [1] https://lore.kernel.org/dri-devel/20240226211100.100108-4-harry.wentland@amd.com/
>>
>> Can you send another version addressing the other comments? Then I can
>> cherry-pick and already apply the fix.
>>
>> Thanks,
>>
>> Melissa
>>
>>>
>>> Best Regards,
>>> ~Arthur Grillo
>>>
>>>>
>>>> Melissa
>>>>
>>>>>  }
>>>>>  
>>>>>  static inline int drm_fixp2int_ceil(s64 a)
>>>>>
>>>>> -- 
>>>>> 2.43.0
>>>>>

