Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16F517195
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975AC10EF8D;
	Mon,  2 May 2022 14:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B9A10EF3D;
 Mon,  2 May 2022 14:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUtr0GyWDYjHidfsB4G2ClLw5cgvlELtzTd4haqOHWZyNvxXfWzt5kh9rPk7HmWq8kI0RHum84yTwSWan8pbQEHa6ZsJw0x6bHTGaVP8XNBoYC1mdrNk2m3qQJWIPDIv35pF49iXKavSYzxO74BVUYxm0JPBSA8UEeam7b5201L3fIwG1x8IuFpx/1OytgAZYagWuYvUWUqr2P18bEADlSFnjjQzL18u2oxOx6eK7keOMYmBI4p7Y7U92K8DWPcdtJ31XlYJclUdsa7TiSvz9RsVyVMfuZrAMXzcIXQqN81OuiyTOlgWrqVSPF7+B/O+bzOtThfr9ITGXn86UgBsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+P9R63TISd+zMUCthhu+3xaz90orNkYs4cobJFs5ZM=;
 b=U5F+JdD/rRvfbW0A4aL+fcDtpKnvsXxC5xlecCjrcodbbKZ/rhgjf4tG65KX3jpdEcNN+ziPb6FtCWgItpKbC8VQy5/DYgobK3rwoo8Ce9uuKRazhVPIvv2EnpGLTI+tDgJl4aj0Hful5HqvoBKvgrIjl2gHRZOWI8yx0jGz2hK66UWcTzJBpJL1FokzPfuo/xDMAjZ2YNywfiRCSYfVMk8/o6DyjDLVOWaXFsDbtovOL4X21t60kCPrq8cbibPj7yGRCbqK0JIFyTQJECyJYKinxYU+oqRVJewUam9joeVBDNk6FTZIcf9oJx4MKxZQB8BMzPr0t4dbm4fxaBqSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+P9R63TISd+zMUCthhu+3xaz90orNkYs4cobJFs5ZM=;
 b=AeqLtL4JwOdjbbdj6Xoj6WgcruhYcby4wUGyAAzu1Mx6IIi5RYUbjrFIQIP1wrDsnVk1IBsifiiY1EVHrvcNR+IHFGWYRNnXWWmyjGfM6rN6K3nz3SJHYL0xZg6cna+piQFLdvxE4ySIj2trM1s6fkx9wN6gJ8WE49IWcFMOcEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Mon, 2 May
 2022 14:29:16 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%6]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 14:29:16 +0000
Message-ID: <b87db6af-a2a0-8fba-b204-140db03ab79b@amd.com>
Date: Mon, 2 May 2022 10:29:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
 <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
 <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
 <576d5993-8108-218e-45a0-bab1ae4ca84b@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <576d5993-8108-218e-45a0-bab1ae4ca84b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::38) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64587b16-7520-4484-e276-08da2c4822fd
X-MS-TrafficTypeDiagnostic: SN6PR12MB2800:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB28008802E4A999AB653468548CC19@SN6PR12MB2800.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qoVHesz6VxLIwZ48963PY3X0rRu3RHfzQjJGVbHSMjHeBHFWVa6yssk0sGVp79cgmYmGSFU2nsPF99hbvnGeo76rI2Eczh9l42fwUEcxNAlY0lLEga+Vh91pedmR22AMMVeurH7JN5otsrzjTEzEoV9lABi2k6PNYO3g5RF6dAMPC4Krv/7hSG+K/Cx6AoDn4HiN37YTGWU0E1cLMYqQJsK4o+4/QOiFEw4Ak4p+B2uRFpDqUUtmTV/qI77eqSaOewS3sAnyThNUGYug+fndNxJh00m/0ZYuVDhDjlnP7qc9SmXXmpJ0hIfruiC3/c06LOQhYT9/8UZTaDbTRN5lGDkpIA1+LtzSkyPYlrCdStwLnt+UXGnTDO1Gr27z6eun8src/g8zT5Zi2xBW5ZZT2IfqCI+u/6o0RKYM5vTVble+8aarCKZYS3qLgL8yW5nPlF+b2YNBCF0cxEJu1XwrelWACrt2f4OvqFgb8msRiWJ/CKKwj7HMcGS/Mmnmeb199L6pHB2orajzDbvgnaSwCyZHFJbWx728ZTadeiGat4iHDisx1kMX1msAGIECssFKNSYtTt/jZZdsFK1u5IUStneuoFElvYtPt4xwMp7WK9AiKR2JU4JV2frHDHXnOnRi3x2KPDJliRRJvp3pwvL7jrokqzq5rwvpHLnp28aRp3ymW70IsvIfY2JEApLH5PZwzpkR1o0nQsA8tQjx3IA0L1sXwZZsCPOiGgt05E1MN2VvRL4YqMbZdPVPq00P0P+UTNv9HI3yyPjSGUNchNXxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(2616005)(31686004)(2906002)(36756003)(53546011)(44832011)(26005)(8936002)(6666004)(6506007)(921005)(6512007)(5660300002)(508600001)(66946007)(66476007)(31696002)(110136005)(4326008)(66556008)(86362001)(8676002)(316002)(38100700002)(45080400002)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEoycmcwclR3YWttRFB5Mnh3UWwxREIvbzJvSDZWTld3ZTFHYlZ2c0tFQjVM?=
 =?utf-8?B?eVc5Q01sa0p4RnIrMUVxNURuWk00V1FYNEI1bUs1bTZJcTdCQnFPUnBVbWNR?=
 =?utf-8?B?Uk56TENsQi9ZMktJOVFnUU1Ed0grbHNTbXF6STkxZVV3NUJ1N0x2YzNLeEI1?=
 =?utf-8?B?RkZnak9DOWZMRmZmUDc0STVpem9idU1sSlZTYlJoeVFpYUpnYjNjck83aUhT?=
 =?utf-8?B?SVJ2WWpkeWpYQWV6dkxzZU9hdnhwRGpvOFNRdkkwY2taYUlvVDZ5aUJOa1py?=
 =?utf-8?B?WUFmL3VWbFV0VzVyZGJTNktEQ2VsY2NjUEVyZkgzRmNWTmczU0F3Q2cwZ3dY?=
 =?utf-8?B?SXBWdEE0T211QUlBaE1GTkN6TzJwWUF3dWI3WXhQekk4MXErTGVqRFdLbDRU?=
 =?utf-8?B?RzR5WVBMQytzMktha2VMTlVQaytvaE5oRWprZ29Kb1hEaGE4TUNQbDNRbVhV?=
 =?utf-8?B?elZhQUtlVXZEdlV5NFBKMDJVNmw3YSt3bU5FRS8yeUI0OFhqbXdyOFVhbVpN?=
 =?utf-8?B?b0NaTkRjNEtmTklBdVZHS0owZU5WUjhtQXhnb2RvaTQ4Tk5HbW9uLzE5MGhH?=
 =?utf-8?B?NENwRk9OdVJ0RkJvWlNNUnlYUk54NldtdUUwYW8wRE5MM3lFVXNVTXA1dU1y?=
 =?utf-8?B?MklvaTM5YUx4R04rb1N2KzloUnB0SUd5OUxNUEVXa0JuL2wvTFFQU29xMnFQ?=
 =?utf-8?B?MXZlaGNLa1ROcVBTNGxSZ2VtZS9iQTJIL0RGYzNzdi9IYi9lV0dYbEFDY3Vr?=
 =?utf-8?B?K2QwUUtSeTF3ZmZLZk5PSmJxdVc2QjEvMW53a2lvcDV3ZXhpVVhLSmJKc2pW?=
 =?utf-8?B?cTNKd3pBUlk1Z2pDaW1JTFhpWk1OMFVmK3dXWk9FTUNBa3lTS1JmdWF0NHBk?=
 =?utf-8?B?eitURURUcDFpUDAwN3FleWRLclpEZFZVd0s4SlFHb3VlNDJ3d2ovUS9uRFFn?=
 =?utf-8?B?TS9QdUU0dXo4RU0xcVFYS2p3T2ZrWTgvM0FnSWlEcXRNRE9SU0Z5bFdFZXBW?=
 =?utf-8?B?WlVBR1dhSWUxV3A1SFVUUHV0aURqYWxZcURPUjVab005T29aUEtWcTFzMnVj?=
 =?utf-8?B?aGlXQm9SZU05bk1LMU13a1c1OU8vRlQzSWFrRmtpWUd2Sm1Vd1o3RDdIMmNo?=
 =?utf-8?B?dndKOXhCQkVPNkZUTnNXcWd6NDVhUnJ2ZW1qWnJldS9CQTMvOVFsWHVLSERS?=
 =?utf-8?B?ek53NmN1TjhERzJDVmlWMkJ4aU9zckdiaWpHc1FlemhpVDV2VjY5UGcvajZZ?=
 =?utf-8?B?YlVoaE9OT1hvamtRNGVWN0QwZ0tTSFFrUGFYdW9qNWM1NjR2TS9uNXFBTEJj?=
 =?utf-8?B?NXlIWk82aTFZc3o1NlZIa290YjMzSjhFT2kxT0w1dmk5cjNTZVNGWXYwcDVj?=
 =?utf-8?B?azkzd3FrSG82emtoSFJ5L3IyZ2FRRnhQQlVzZnd0d2k5SjA3YzVzaVRjMUg3?=
 =?utf-8?B?UGZUbjgxNDhyU1g4d0MxQ0xYdFJBVGtUamJSRENReTB6U0Fic2doQVNHbTJo?=
 =?utf-8?B?WEVRSktuTGRCYVN3YXZZenJnRnhLeXJQaWdmQUFaQ2drcTVJV0kzVFRsSUlI?=
 =?utf-8?B?Y3Z5SEZzZUs3blNXeEpGTkJGR2IxaytXVW9pRjhhcEJPQ3Q1eWlZRjVZUzRn?=
 =?utf-8?B?UURXVm9td2Uwazg5cjE5QXg2M0Z5NEhwYlFTeStuSzdkK3FUTnFzeW5xbzJK?=
 =?utf-8?B?SWdNWDQ2SHREMU1RcCt5Y3Q2TXhPczRzeTdscDlLZmN5VUlhejZxSjl0NXNJ?=
 =?utf-8?B?YnhQMXVoaHI0dUROMXZ0eGxVc3ozaWdYTlI2dnUrNE1KTzdhanY0cEtrcmVY?=
 =?utf-8?B?T3REcExNNXRSbThDS3BWOHVLTis4NFhWbXVlc3ZOeXhoRWtkQ0gyZ2VNc1dZ?=
 =?utf-8?B?c3ZsZTBrdzNER1VHQTVvN3pLZ21Za3cyQ2c0clVCYmMrZXM3TTYzc0VGcjF1?=
 =?utf-8?B?NXpOWEZLejQxZUJkN1R5VUdqM3A2WTNGL3RsbjhHUDRLL1ZzVStEb1VWN0pt?=
 =?utf-8?B?WmRESXNRVXZrb3Y0SlhOR3BkUWVnMzhaVXY2T09COUl2QVlBSzN2blc5b2Vs?=
 =?utf-8?B?MlBYSzRNeUFpN01FeDRpbEl2RGs4ZTJ1WUt1M0pQWXo1citJVnByUXdYd2FE?=
 =?utf-8?B?L0UwQzhwdzNaL1JTUGE3NnBpYkV4RmVLRVFJMG1uSnB4ajNQNUQ1UlcrR09H?=
 =?utf-8?B?Um5wSVF3TlA0NTNEaXRxQzdpcUFBU0thVmh4NVBxb2pUY3BJK28vTldHODBH?=
 =?utf-8?B?VWlMK2RTOU5LSXVVZ012RWs0K1kzbkh3WGQ2ZHgrMDlZcUluUFI5VTJjd1dr?=
 =?utf-8?B?TUN3MVcwSnc0MWVSb0ZXNWg1bXZPZ3p2YnFwUGJZc3dKMWhrUVlYdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64587b16-7520-4484-e276-08da2c4822fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 14:29:16.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kONzTAgJ55bD3eGBnDyAp52RshY2gotudDHy96uVlhGEwelmOK1LOYEgpYEJNxTFFdzRD//IYoZdAZqGFisvYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2800
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



On 2022-05-02 10:27, Modem, Bhanuprakash wrote:
> On Mon-02-05-2022 07:08 pm, Harry Wentland wrote:
>>
>>
>> On 2022-05-02 09:28, Modem, Bhanuprakash wrote:
>>> On Fri-29-04-2022 08:02 pm, Murthy, Arun R wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>>>> Bhanuprakash Modem
>>>>> Sent: Monday, April 11, 2022 3:21 PM
>>>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>>>>> amd-
>>>>> gfx@lists.freedesktop.org; jani.nikula@linux.intel.com;
>>>>> ville.syrjala@linux.intel.com; harry.wentland@amd.com; Sharma, Swati2
>>>>> <swati2.sharma@intel.com>
>>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>> Subject: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector
>>>>> debugfs to
>>>>> drm
>>>>>
>>>>> As drm_connector already have the display_info, instead of creating
>>>>> "output_bpc" debugfs in vendor specific driver, move the logic to the
>>>>> drm
>>>>> layer.
>>>>>
>>>>> This patch will also move "Current" bpc to the crtc debugfs from
>>>>> connector
>>>>> debugfs, since we are getting this info from crtc_state.
>>>>>
>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> ---
>>>> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>>>
>>> Thanks Arun,
>>>
>>> @Harry/@Rodrigo, If this change sounds good to you, can you please help
>>> to push it?
>>>
>>
>> This changes the output_bpc debugfs behavior on amdgpu and breaks
>> the amd_max_bpc IGT test. I don't think we should merge this as-is.
> 
> Yeah, I have floated the IGT changes to support this series:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F102387%2F&amp;data=05%7C01%7Charry.wentland%40amd.com%7C61d4e4a755a5449ec58308da2c47dd89%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637870984414230229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=kge5PgzzX81hsFLBKyPfyv7vQpb1Gse72FWuiGtyoAQ%3D&amp;reserved=0
> 
> 
> With this IGT change, we can merge this series as-is. I would like to
> request you to review IGT patches too.
> 
>>
>> This patch also seems dependent on patch 1 of the series. Shouldn't
>> they be merged together (please don't merge them as-is, though)?
> 
> Yes, as other patches in this series are already reviewed, I think we
> need to plan to merge all patches in this series together (If above IGT
> & this patch looks good to you).
> 

Thanks for the context again and apologies I haven't had the time to
have a closer look so far. I'll go over these and the IGT patches today
and get back to you.

Harry

> - Bhanu
> 
>>
>> Harry
>>
>>> - Bhanu
>>>
>>>>
>>>> Thanks and Regards,
>>>> Arun R Murthy
>>>> --------------------
>>>
> 
