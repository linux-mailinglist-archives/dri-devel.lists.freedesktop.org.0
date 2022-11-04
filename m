Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ACB619C6D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 17:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605EF10E8BF;
	Fri,  4 Nov 2022 16:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA4410E8BF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 16:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq9X522q5fKp8AenpjgFieY9BMueIJFfbK4wE8zaW39Psy0h42q0nX9j7ptyppagBXIusiur3aL9wI2+WHcGWHnsovWwQOTfS/wrrJwQayaU1tyfj3kCqKPT4AG+l20XMbFbnlEmKxL4hL/dqmVApgkAEIFlRzlgfi9nZW3mY5eHQ/l4YqsaKCjyDeaichx24JkBdyrXF5qrE79OiMeQIaNmp2KyGEbVRrsZnXXPsz6+PBuSnf64aYFzQ17RwuNpNAWIsDhqkcnoPVSHnKZTzml3Sdyok7rrh577O5TIteHxeeXtFGCi4RUhhcsvyme1wYtEYtR26s0i8atnS2i6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D6p1rDrAJHIO8c2FVMHh23NQXGkNPWzh7ABToIPdGI=;
 b=QDezH+iu8AiLzijM+GUx9xhdLKIbVNX+EjjEhFuJsNvt24QnC1zN2gDXov3HDaC4ka65hc5fTHTZid9GRnrhJs/IalBPP8wOCfaPP0ZPaGJihCDrtfJTaNTz0B3wDkxy8vrdbICP8lxRt6pUhheDrVPjoBVy2nmlq0f+PoLuR4nb4m/dWeBIb4SKydvbXgoFd8qgHoeGWYGnSKKEXm8XCEowUT4Q61L6AtegvWLnft6ZxItC5Up3ssoEmMdMsocdlrywQjpmXgGHWnT45o0oZl7EGT+/B6GGK3JGfAutVe/iL5XhMxPdhinQ0dYDu9kC15xnVSGOyVVb15OlId1PHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D6p1rDrAJHIO8c2FVMHh23NQXGkNPWzh7ABToIPdGI=;
 b=rIGUIf67ferQuS/zB8rKj+qLGINya+jx4GT7ozatSOtK4hXv41XJJsSgTBA7Ab7ZCQ6ppPthV+a+mfWHMxlXQWEJ3Bn/oNvsU5HcT9nV8jb39VUCbidTRDAorgizoVBTcixQAa4t78wjC5G/M+OVdo2loF0FmMaEdDQafV26gBhXNdVGXtg/HwvqH24VvLAWcLud1gOwDjDJoazUX9+CCs9oMRYcIfmu35K7/MqXVP3rxwRAF/W/9SlC1qh5jVej6pxUi9u9uROIfzGPWXTwlEf9kIAGlWEMa8dUk8id6MYpnDPdZWYR6SImqOG77HxY7tKWQDLzyHzNdFXGaj8icw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5275.namprd12.prod.outlook.com (2603:10b6:408:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 16:01:56 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 16:01:56 +0000
Message-ID: <eeae06d7-75b9-829e-21a0-0c2b087368d5@nvidia.com>
Date: Fri, 4 Nov 2022 16:01:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <cyndis@kapsi.fi>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi> <Y1aP7kDi8cJUTcGN@orome>
 <ee3073ba-d621-8b02-c986-3cf44cfbba96@nvidia.com>
 <b9b20abc-d37f-f74a-a416-2e210bf944c4@linaro.org>
 <3a783b8d-4970-663f-816a-15aad5a66a48@nvidia.com>
 <a72c0e60-732f-3486-722e-851f21ebe640@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <a72c0e60-732f-3486-722e-851f21ebe640@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0201.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e0d02e-a907-4db8-fd5f-08dabe7de5a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTmzziW8vX0AS3BC37sCEE//i/RQPHMtMbAVvYGLWDkxZw3VsihkBX9MHagUgBzJB2T4hsvPEDiUK297mtNzv8jeDYqCCDgYJVOkTZsKVlTr2XknK6L23G5P53UuNuDvl/bXnicmrQh2PgbDJPmLwmbhoF7fK9RKgWV+ETF2jjCL6oaST/wnuWPcX4KLyhFRGtqYXATVLeZCKfE9zzRDsleWvk/YeTiPP9mZ86aIL7BW0ll23e6lpPFxnFXGvj8ZWQ0XPzioW7EQY8JD1TFATkey70jikc3zIX/FK7Bec6D5Cd9uCCuqS7NJfphUaQvMbZ1nagnoyXBlC8gGdyBcjTZeXHDmIEXXYz8OUDwDq3yY2dz6dJQ5DMmcTQW3H+9Gtd/0a7YjM8VB5uHfoy/t2+UIjs5x+MPnRggBpKthvtAM7vAK/qcWvUtDh/Z/rjnfuc9qdmH049j8pP9sOvfJLKKGbZr7Up/UvpRnhppn9iQP7IzstYrb/rtDz8MNvrXERy4CCVcuFqRa64nlZZ3DwBqkc4krRlUkH489d36GGLgUDUgwUUtiwqJfkzaAzApnzVZNtmQD1C8XvMHpfKzesk01mhnvWY9ZyZG4Di+zId09oPFM1kS+E39df9ZUpLihn2QY7h/A9YnMaCrBkm2IN5O4FmHqxNDxfwJ7IdFsr8DKCea3nhogmrmRNCRNnlEpNAdz6Gt3oJwMNz6OcHj9FPYtmFloZVpmJcnalS9mq7uu5KL1cAiNeE+uEOMDJ89XHdp8IvlH4U/yOf6lZS8GbZc5mz3w10zTiEnRbXFlbdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199015)(186003)(316002)(5660300002)(2616005)(7416002)(83380400001)(66946007)(8676002)(41300700001)(66556008)(66476007)(4326008)(36756003)(6506007)(53546011)(2906002)(6512007)(8936002)(31686004)(478600001)(6486002)(31696002)(86362001)(6666004)(38100700002)(54906003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVhHN2RNT2JsV1RnOWRmeFVycE5RZ1VIU3ZDVjdFWDJMNzhTWFR3Wmw2dnlj?=
 =?utf-8?B?aEZOVTVQSEJMYm1ZeUZaNk54NjYwbytEdldTMXNpT1FJY1dVMHVUTSs5U0do?=
 =?utf-8?B?by9Kanp2d01BajdnWEVqbHZyd29qWWpnVGtsbE9rbnVPVnE0d1Nrd1dYWUpv?=
 =?utf-8?B?bmtjYmVCemtjMloxNVRidUxkdGhYbGlWN20rc0lwNVlMYXRod1djRThwdXlk?=
 =?utf-8?B?Uitpa0tVL202SmllVnp4YnBEclR4Y0xoZXFWU29BUXhPQmt0MFNoVWM0S3Vt?=
 =?utf-8?B?cndhaW5UNHRmMUFsUjB5Rk9JTEovZjJ6c0hnWkxUM29FV3Uzd3ZUanVnbEMy?=
 =?utf-8?B?V3kyaWFWRzZiZzQyS0Y3MDhpZTlHWjNFY2JTOGNiNklFNmdGUUJIaFo5Tkpz?=
 =?utf-8?B?akpLeE1Hc0NRV2xYQjVUQVc0QVhERmFRa1gzYTlnTFlTbFdZa2pJOVpucW1j?=
 =?utf-8?B?L3RIWUN0eFhGL0E1SW9WUlFDMHNBOThTZVlwb3dNdzA5TnF1QTB5ZlB4cEtz?=
 =?utf-8?B?eUI2VW4vNkJvMHJWWFprMXRlbXhBdzFOWUlKMnBGLzR3bFNYa3QvemRJSDhp?=
 =?utf-8?B?d2FrN0NBS2NxQUFsTUFhcjh2V0lHNEM3bXJGWjdtWEpteGlqYWVLenU2WTNS?=
 =?utf-8?B?Q2k4NzZoQW5TaFNCa2w2SW1WV3FPVzJPRWtwVXhmK1dWcWZVUnJ1ZS83Q0My?=
 =?utf-8?B?WmVRRW1RTlEyQi9vRzkrYXRrdHR0bFk3L3RIcngwYndBcW5EZDFxOUc5aEtJ?=
 =?utf-8?B?L2h1ZG9pM3laanhBeWNyOGE5TDZBUlVoMGwxOUhianlDS3pMS2M0S0Zwb2d3?=
 =?utf-8?B?TjZpOXZpSzRuWkVHRWhpVDB3N2oxelNXbFdRcUNKR2VKSkhVYXFlcVlnbTZB?=
 =?utf-8?B?b24yWUZnS3J4MWFIK1VhMDJaYjJOT2xqZDF4QkVmQVp2cUdtUklTb1BaclhJ?=
 =?utf-8?B?dUM4TURqQUs3NVlIRmk5UDBKV2l1UUc4dFp4aVVsVWZYTklsTmdjbXltWnRx?=
 =?utf-8?B?Y1B2THVML2h6MVZmYlVoa1JDTWxzb0ZTUEhPaTlKY3M0REF6YlNEZElDaG90?=
 =?utf-8?B?bHVuS3FPQUFlZFd1cVIvdi9HNVg3dGltbWxpSnRoNkx1ZkVRUFFZbkhFMmhH?=
 =?utf-8?B?WGVEOWhxcFE5SGRNRUdPM2d1NHl1cEQxeHMyQmNYNGdwbVBtaU9MS0ZMR2pp?=
 =?utf-8?B?SHMyVTNkUmpFcFVOSHppN0RNNXJLb3l3cGJXSkNKYlNaS2ROWDhoRk9QMlpr?=
 =?utf-8?B?NUxBQXdLUXJQelE5SUhTSW1wNVhmZlVZUzNTUlRIbkRxQTk3R25FNHhRMXBX?=
 =?utf-8?B?d2Fwekk1SmZRRHd2UnJTTlpWb1NpUkgySXpMSkpJd2JmaU1Vd1k0eERhSGFy?=
 =?utf-8?B?L0lsYVBJWEVnclJPVzFyYkphYUh3aVNyUnBpLzFKNFBkcDI0bWxYV095K2hp?=
 =?utf-8?B?dWpoandvai8wakxHd0tXQzVVaXlIYWNabzNSQUpLSnBDN1ZFQmFtT1VaOXM2?=
 =?utf-8?B?Q3EwQlZpRytVaGdtcUxVZC8xZ0hEcnpuRFlTbjhqNnpTN2FwRkt5VTEvMXZZ?=
 =?utf-8?B?bWhZTVdCUVJnM292Y0lzNW5Va3hwZmVpakw3dUtsK1lQZzNRdHNJQlUwajdB?=
 =?utf-8?B?OEFmL1daL3c1aWxWZVJDSUJib1Qxb001R2pZV1ZDYkV6RFhWNlo2OW1KaVRm?=
 =?utf-8?B?WHBxanpCWFNpTE9XNFViTmRzOU5ZZmJ6b0tDaUora3FnTGFsa0k3SDRyYjVS?=
 =?utf-8?B?UjQ0TzdLNExqcVFqLzAxanorTzM3N2hxRTI5Z3FvSmV2bCtUQ0Y4Qi96THZZ?=
 =?utf-8?B?alkrcHRaL0tUVXkySEdSWEtVYWp6YnM0SHFRUXN2NkZLcHVHS3ppVEJXalB1?=
 =?utf-8?B?bDA3MGw0ZURpVThXK3dsNDU4NXRuUE1JTHZNbUFwU3F6d1l5K2JxZ0dpdDho?=
 =?utf-8?B?SGVKRXYxWUgrL1dhdGJmWnZVWjJndGU0bHN5ZHN0aThGV1ZTZG5uZWlzRHhY?=
 =?utf-8?B?Si9mNFJEcXdsU3N5Rk1oODFDL0kxRjhBU3JqY2kxamxlbENINDc0MWJDSE14?=
 =?utf-8?B?a3R1blFaNjJ0RjhiUktTU2NuZ3BlVEh3VlNkN2tGOXAwYnEvTTNVTElRUHha?=
 =?utf-8?B?NmhoSVRuZ2kwREZQYUluUThZSitVemhwRk9DZ3NobjhyMXRDS0NzTU5mT1dF?=
 =?utf-8?B?UW1xQzRaVmdvamtLWi9BTndxLzlJb3JYT2ZLaG1xa2pEK2E0N0owVU5obW1j?=
 =?utf-8?B?QWl6aEpSdjJtOU0vV3J3L2s1aE5BPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e0d02e-a907-4db8-fd5f-08dabe7de5a3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:01:56.2077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uc5lW2Qh+UFLDM0P06wBoHlYENHuNENLwJcjhqWz+Q9i7HKoNdleTkL17MHKRbLIvqdid7Ks/8nv/9xSjqnueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5275
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/11/2022 15:48, Krzysztof Kozlowski wrote:
> On 04/11/2022 11:46, Jon Hunter wrote:
>>
>> On 04/11/2022 15:35, Krzysztof Kozlowski wrote:
>>> On 04/11/2022 11:33, Jon Hunter wrote:
>>>> Hi Thierry, Krzysztof,
>>>>
>>>> On 24/10/2022 14:15, Thierry Reding wrote:
>>>>> On Tue, Sep 20, 2022 at 11:11:56AM +0300, Mikko Perttunen wrote:
>>>>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>>>>
>>>>>> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
>>>>>> has been loaded by a bootloader. When booting NVDEC, we need to tell it
>>>>>> the address of this firmware, which we can determine by checking the
>>>>>> starting address of the carveout. As such, add an MC API to query the
>>>>>> bounds of carveouts, and add related information on Tegra234.
>>>>>>
>>>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>>>> ---
>>>>>> v2:
>>>>>> - Add check for 64-bit phys_addr_t. In practice phys_addr_t
>>>>>>      is always 64 bits where this runs, but it avoids warnings in
>>>>>>      compile test.
>>>>>> ---
>>>>>>     drivers/memory/tegra/mc.c       | 25 +++++++++++++++++++++++++
>>>>>>     drivers/memory/tegra/tegra234.c |  5 +++++
>>>>>>     include/soc/tegra/mc.h          | 11 +++++++++++
>>>>>>     3 files changed, 41 insertions(+)
>>>>>
>>>>> Krzysztof,
>>>>>
>>>>> I've applied this to the same tree as the patch that uses it for now.
>>>>> Let me know if you want me to put this on a separate stable branch for
>>>>> you to pull in.
>>>>
>>>> Any update on this?
>>>
>>> What kind of update do you expect?
>>
>> Ha! I guess I should be more explicit :-)
>>
>> Well, I would like to see this change in -next and so I was hoping that
>> you would respond to the above to indicate how you would like to pull
>> this in.
> 
> The change will be in next via Thierry. I do not have to pull this in.
> 
> The maintainer which applies patches is responsible for:
> 1. Having his tree in linux-next,
> 2. Sending the patches to upstream maintainer (e.g. arm-soc, Linus)
> later in pull request.
> 
> There is no job for me here, if I agree with Thierry. There would be a
> job if I needed a separate stable branch, but that I did not decide
> yet... Do you think I need to pull it? If so, why?


No. Like I said I just want to get this into -next for testing. I had 
_wrongly_ assumed that Thierry was waiting on feedback from you. I see 
this is not the case and so let me check with Thierry where this is.

Jon

-- 
nvpublic
