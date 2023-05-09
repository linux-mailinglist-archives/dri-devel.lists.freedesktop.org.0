Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867266FCC8E
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 19:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D76410E39B;
	Tue,  9 May 2023 17:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F5810E39B;
 Tue,  9 May 2023 17:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ8xuZMYihD2Ivc1DnEPITnkrOyGWKXN4L26zocucocbSwjiHy77HVmMiI0O0fblSIBtN/Tdx9og8Li5kmthy8lZ9CSeyBP0Pr+lspaVQ1lcI6ZzwER4UbCTSR6y5KVmIwuq223Sicvd3obL8xQok/pj9s9VRI+vnaU8J9WsopBSOTu9XL22O9dATnto3CeQNxgCBSulNBkfGXupDXHwMPlV1Y0VCOTJo05uCZZ4xU3+fEBEfA3K/pGlaDbrCGdvwsl1oLJW9O9OumuydlQ8F3iSQ14Vrma3U3Im0+i2EF+77zjNxqgeWPm1G8fb6rOXXC3LGuQDgMee6Ukv2q3cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yh+SkF3qEBgJgGWLc1buIDuF+ff1InkKA5KTChqmkEA=;
 b=T7+46itllcUbBAoomEHT07GLqHokT+GBUKexAQFBQatdxyKOA3k4/vY1FjYrl5dTz1gK5f2bnY+Zvuv94cpIaa6Nql8dYyVnjuo/6kBhr615ykj++OqPBuK5yF35RCdwqxbFXo43FsWZ6QtWkKyLhzEdFEhmfchSCuBHIwPFsf5Ye/5ZFPSWat6PdjQ2iMIAEGcJi3vHbA3xRIe2YB3SjGVvRLT6EVcwv0LaEp7PwKZVHBHc27MtUPu0cvssg5yqbGf2zr03WHkIMZi6UBE+IY3KpG59FfhKQAONXT4spajf0DXWE2dMYFO/oMVCMn+jxynQt3v5faUElV0m70A8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yh+SkF3qEBgJgGWLc1buIDuF+ff1InkKA5KTChqmkEA=;
 b=G5aVFOz59KB0r71ND5cM/CPVv2uGK6mRfK6/sq7fKKxyw844z1cvt6w6IsNHuAymKJNjVBeMBIiK4OYjWRiUJGd47C3If4GGLwdMCJgdnH4MmVLf9/ANwoG17eAgfEN+w1MK1KdOYLhuSCtRCKGt7TTAom2hxmrYkAwz6KfRYKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 17:20:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%6]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 17:20:03 +0000
Message-ID: <97061716-59a9-44e6-06e8-a2e92c0a35cd@amd.com>
Date: Tue, 9 May 2023 13:19:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 03/40] drm/amd/display: introduce Steam Deck color
 features to AMD display driver
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, Melissa Wen <mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-4-mwen@igalia.com>
 <613b2431-7d05-fb44-25d7-dba59e5eca3c@amd.com>
 <20230509162353.7hak3fda43fim3ho@mail.igalia.com>
 <CAEZNXZARW1uxYz1G2gGt-U2VDCaXBZNNAK-UsXuMeHVufU5YLA@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAEZNXZARW1uxYz1G2gGt-U2VDCaXBZNNAK-UsXuMeHVufU5YLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::30) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff2a0d0-4f6b-4868-2f73-08db50b1a052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +M+fYxTFul1aBEsJjskzyRkTvoFas2BlgHdzVkxPHdEY4X6rPBDRiRyyAOQ/6TETvv3v35BRhoHd6nCNk3GkwFK30HMfhWuHEnHuLoC1mCX9xN5EZJ3qDsGl3GFpVQ2P+7FnByhZmebzAGLl1Ik7wpfdwh63YHqdv8TkmpWGG+ObgxbwRHE7EaD6IbX26P2Q4LedWG5398HiaL8PAzwfj3p054DDW9NigDAJFQhwg4tiNGHn8pVXchj4z18mKtEGBGwWFNqllWIOJ4aKLYLLpJEgapDPbvPIIdnj9O2LKFHk3utfx+BgnAU9meL4HOos1HgRhWCnDEuo7mXJVdeOqAZ6LsDpFMFZaqK4HOhs6a0qVBIyBjkL6vL7zHWUQQ3SslzsuHmpGsAf636RYHxcjhGzncrTFB/VnNyzU2Z3C3UfNWjcIoXibI2infkTMHbmpSFPAqD2C1jfgoPsNyqoXYx0hruI9JAXP/PXn5QfY8Ueh0JjlSvWw+RBR3C6bsLfrXjP6i7eB41G3j5BdliK4x1zN8AJzlHJRJ5XBXjd7fCc8MK0IVkW6P6rv+wUyk7Vs7NRwa+AqIxXUsUABpKNfKe7T8hwJ5o8JK32dLMKurm/YqSlYeK6eqElpTFOVGXmvkxc/HZkShyv7V12z2PCow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(6512007)(26005)(53546011)(6506007)(6486002)(2616005)(36756003)(38100700002)(31696002)(86362001)(186003)(110136005)(41300700001)(54906003)(4326008)(2906002)(31686004)(5660300002)(66556008)(8676002)(66476007)(478600001)(8936002)(316002)(44832011)(66946007)(66899021)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStoQ0dhZUdpRkU2ODNPWWpUV0pERlVpeHhIV0lnVUk3SHVOWUZERk8yNDBm?=
 =?utf-8?B?cm1xWnU4MTk1TStFbmxYVmgyWlZTaGlvMXQyMXhJcDIza2NEejEzZ1ZCdnk2?=
 =?utf-8?B?WUlTQk1Xc1NrSmtPZEV5OFBCTmsvTWhHd2hzVUw4Y2tERGxDcWdwYXFjaDdI?=
 =?utf-8?B?RUlseExEblRlUll6SGNteVJRUWMzNHVqSE81L1BGdmV5QWZ1S09DemFyMlhL?=
 =?utf-8?B?TWlleFluSGxXdEErMHJubm9YOEt4L1lqZS8vSS81U3Q4OExzdE0wR214SExE?=
 =?utf-8?B?ell4SThqQ0d6alVrZEkzbmREOTV6Z01FMnFoUEt4NGtLQnU1a1duNnF5NW1a?=
 =?utf-8?B?TEU5UXJraWhza3VZTUlXRzZkdU50YkNnbXF4N3pZWHAzWVM2aCs3TG02dXdu?=
 =?utf-8?B?TmUzS1NvdzNIKzBsNFArNUlNakxBMUtPY0RKOUJBTmRkcEQzNWZJSzdrcXZ0?=
 =?utf-8?B?K3BydXFSRmJ1Tnh1YlNscGc4LzlSSVlGUC9nL09Rb2Q4WkJMc3gva21VNkF4?=
 =?utf-8?B?S0I2TlNmWXVJRkpvZDVsK01Ud2JOaHJ2NzdRa2RUQjJzN1d4aDJ6MXkxRnVn?=
 =?utf-8?B?MENXaFFYZEQ5V1pzLzl3NDJqRHZqQVEwWUVzeG51WnlSbGZVNDRYVFVIQXdD?=
 =?utf-8?B?dFc1eXFTTzhyQURTZXE0U0VCT0FTY25OeFQ4K0cxQmd1Rlo2cEVjOWg1SkFi?=
 =?utf-8?B?dTFjUHB2SFZpcHdLLzNObzdJSzVuNGw5YnNvUithRDVIenFFN2tLQ1NvdGx0?=
 =?utf-8?B?b2lsa3VlVGhabUN2ZHVTellWbDY0Y3UvTzU5ZDJxUEVmZndUcFdISHJyQ3p1?=
 =?utf-8?B?bWlMenBJeUhBODB6Ujk2aEhpUEZGTVhLcFI1bS9UZmZCMWVRajdTb2EvSGUv?=
 =?utf-8?B?Y2N4ZEcvdmdWN09YZldVcmNPcmFlMlErUENyZTNCZFVkMlI1dHBkQjVhV2dX?=
 =?utf-8?B?RGRzN3NNV3N2VWxuQ3YrWWxMRlBDUzJaT2JkdkdxN25wdy9VWE93UHl6MFRX?=
 =?utf-8?B?YWdWL3JmWlRXV0tUZkdCTlJaQXo2cjkzeUxyYnBmYXNoT2QyRUlJTEVoZW90?=
 =?utf-8?B?enZJMGIwZlIyQkZrbjZOOGpsQUVqaGRmQTB2R3VBSDFXbWJneEkvZFJDRFpY?=
 =?utf-8?B?SWNNd09adkdxbVNNeEpveWhjWDM0R1VoR1NLV2NCdVpXTnN2UUVUMzQ4UFZM?=
 =?utf-8?B?aHQyK3czMk9wWlg0RGx3UlN4K09YaWJBZnpBWmFQMkhYZkZLVVFaVmdPZ0wz?=
 =?utf-8?B?eER2TGNSSUxKZFNTTmorcnl4a0xYT0NUQkxqQzNGR3dvWnkvZmFoejk4VUx1?=
 =?utf-8?B?WnJKYzNjWXExVXkvNVYvazhoYVJxbkFuNjY2MnloYmd1UGNmTlBxV25nVklB?=
 =?utf-8?B?dG5DVk9qV1ZRUkIvcXdaM01laFdydXplV2JjVFJBVzViZ0dmQlNXckkwczcx?=
 =?utf-8?B?R3FPWnMwMWpOWWw0RUNSdkZWVmZpekM2REZYcWtTUkdRZWtPb2EwUkoyYzcw?=
 =?utf-8?B?VEllQUVZSXA4a1JBT3Z5RHk5UUxzbDdPTExQRysvaElTejU3UkFXajBmOWpo?=
 =?utf-8?B?d0FWQytQUnBuM2lmR2M4QTkxUG5KRElKSW5rWnRmTU9BMlNYVWVHYmdRUjhJ?=
 =?utf-8?B?aklJN0w4ZlVYcUFnS3psUVFMQmgwSTQxUkhQS1hXUXR5bXB0TEsvVjczN3Ns?=
 =?utf-8?B?aDVzbENWSVdpa1NJbGc4WjY0RmQrelBUT0xwVTQ2U3NvZEhxNkZSZUNiMzda?=
 =?utf-8?B?M2ZYYy8xdGRoU3puaGpzcVZsaXNlNUp2VitTcStvK0V4T0o5RC9Xaldod2Fj?=
 =?utf-8?B?OGdQYmxjbzlmYnNaZ0lKQ0QwSER3N3VUYlpEcVFnV2tjYmNFalRCcmNQVytu?=
 =?utf-8?B?ejlnZG5HcXN2UmNtcHE5M0FrWStUSXZSRjRRL1NtVWoyREFDU3RsdmVhR0s2?=
 =?utf-8?B?cCtOTStONWxtck1xMjZCZjBONjFXNEJuQ25yUVVjckhkTGZUbTYvRFBpMHF0?=
 =?utf-8?B?N0U5VEtKeThqTzJ6MzNrZkQ1ejBnR21KaUYwaU5XT2xPWXBpUnU1ZnFDWlJO?=
 =?utf-8?B?OWhPMTJETm1zQitaNWJmYlNjWURBZGVTemJsNkxSd3hsZWlvRHh4Q3RCMXVL?=
 =?utf-8?Q?0CfzDa5F4a4OE8x8wAMuHo58+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff2a0d0-4f6b-4868-2f73-08db50b1a052
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 17:20:03.4586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4csTK1wcR03wA0xNkuSGX+kDxJsSSnSh46P81pczZIdXgnhXYZkh4yqYOb4V3oq3fgjjHK4ZhPD+HqlZDwrETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
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



On 5/9/23 12:52, Joshua Ashton wrote:
> I think the idea is that we wouldn't have a config option so it
> doesn't inherently become linux kernel uAPI?
> 
> Then we can just build our SteamOS kernels with that definiton set.
> 

That's the idea. Would that work for you?

Harry

> On Tue, 9 May 2023 at 16:26, Melissa Wen <mwen@igalia.com> wrote:
>>
>> On 05/08, Harry Wentland wrote:
>>> On 4/23/23 10:10, Melissa Wen wrote:
>>>> We are enabling a large set of color calibration features to enhance KMS
>>>> color mgmt but these properties are specific of AMD display HW, and
>>>> cannot be provided by other vendors. Therefore, set a config option to
>>>> enable AMD driver-private properties used on Steam Deck color mgmt
>>>> pipeline.
>>>>
>>>> Co-developed-by: Joshua Ashton <joshua@froggi.es>
>>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>  drivers/gpu/drm/amd/display/Kconfig | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
>>>> index 06b438217c61..c45a8deb1098 100644
>>>> --- a/drivers/gpu/drm/amd/display/Kconfig
>>>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>>>> @@ -53,5 +53,11 @@ config DRM_AMD_SECURE_DISPLAY
>>>>              of crc of specific region via debugfs.
>>>>              Cooperate with specific DMCU FW.
>>>>
>>>> +config STEAM_DECK
>>>> +   bool "Enable color calibration features for Steam Deck"
>>>> +   depends on DRM_AMD_DC
>>>> +   help
>>>> +     Choose this option if you want to use AMDGPU features for broader
>>>> +     color management support on Steam Deck.
>>>>
>>>
>>> If we can drop this (i.e. don't offer a CONFIG_ option to allow enablement of
>>> the uAPI, but build with -DCONFIG_STEAM_DECK) it would go a long way to keep
>>> us from requiring to support this forever.
>>
>> I see, I'll follow this path. Still on that, I've changed
>> CONFIG_STEAM_DECK (too generic) to CONFIG_DRM_AMD_COLOR_STEAMDECK.
>> Does it sound better?
>>
>> Thanks,
>>
>> Melissa
>>
>>>
>>> Harry
>>>
>>>>  endmenu
>>>
>>>

