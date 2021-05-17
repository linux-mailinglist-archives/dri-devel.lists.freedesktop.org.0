Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC37383D97
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832586EA66;
	Mon, 17 May 2021 19:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48BB6EA35;
 Mon, 17 May 2021 19:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ST6pcRGfjGYB88DtSeDWWID76O8wdfIXxBj3hQLwvyvTVUeYJ21V8gaZd0Cq79cOAe4DTRIbRnYMsXYXuJIxhOVGTWapxFDYr4W+Qq3TlUnWhxfUfNbIU34g1jc2kOxW+amk6RRf3HQHzg54tF3GisOFzSF5EgoZltVedrs410OLH7q7fs1fX8naIPgmmTIxqmX90WFEWRUmlEI8Cpi4ZsP1tvfnqjlyzFjfylDb8cYLDSM6Mt80zFIzmTR/EyEyIJWuCB1u87ZEKLn5Z5rPAHJPFB+Akd04PW0/9upB3D4sOsXf4al5c6Ga713TZBw3nU/Ww5XGi+UbJyKdXfCL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12CUjQh3wadUqbbQlJ815Y0gHDlkwUYNzqYlXTRNDqU=;
 b=gEku7LEnEzva86QJQB3sLqYfVBTxoZOXn1U1mV/Q9uiL0gwKailrDhf/tavMGme0OqiRTQuGHnzyfoWBvPGP+iyb1dVNADJsEv6w2Prn7Ykcn1cF2013FJEETQ6uuHPyrjs6ECdZ5qVhaRzOiNrRNx4dLCK9HjFVSVAKCbYHAee07uJQ9LGv3MmF62d+/PAIruTLUnPEZDcJE+CZA42nsUZE48LFMrLTslk4y5lYSnrbXqXsL9yw4G9WNidev5bx2bRfFoAVVOr2y0KHlpqbQ+AxcLwb9CLzdnkyYP42mi68OFhRmIF/1He7mL7pIHIiQNiLSP2JLRlTSFloDeJgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12CUjQh3wadUqbbQlJ815Y0gHDlkwUYNzqYlXTRNDqU=;
 b=d4RV93tDocEKCF9NeI6xa84mQe5TOEHorx0B92dNG11DEIKozU2ejAdbXtsWsI09M+tGOXI14mUjpVAiXPvhAWDCEcqKNSGwzX+94vGInG9nOXw61zLhIMWzugI0P0Zi2WooqKWFOamdJfkcioJIkXu2JOT0mANothw0jOd5/FA=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5268.namprd12.prod.outlook.com (2603:10b6:610:d3::23)
 by CH2PR12MB5562.namprd12.prod.outlook.com (2603:10b6:610:67::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 19:39:05 +0000
Received: from CH0PR12MB5268.namprd12.prod.outlook.com
 ([fe80::a056:b367:4282:101]) by CH0PR12MB5268.namprd12.prod.outlook.com
 ([fe80::a056:b367:4282:101%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 19:39:05 +0000
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
To: Sebastian Wick <sebastian@sebastianwick.net>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
 <20210517115726.4fc1c710@eldfell>
 <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
Message-ID: <b0834be8-9023-0fde-f15d-8c44f72e7702@amd.com>
Date: Mon, 17 May 2021 15:39:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [38.64.189.249]
X-ClientProxiedBy: YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::9) To CH0PR12MB5268.namprd12.prod.outlook.com
 (2603:10b6:610:d3::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.0.16] (38.64.189.249) by
 YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 17 May 2021 19:39:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 125c589d-4ed3-4b6a-f67d-08d9196b6e54
X-MS-TrafficTypeDiagnostic: CH2PR12MB5562:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB5562EF08950293C3C3D4446E812D9@CH2PR12MB5562.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6fE9r1RzJl8StGqMmpvncHEIhGXaELMfkLOztdbtfhTyZy41cdtioQ7bB09YFMO1VVc2ygSazcwMYiPdxb06Rm25TMIpUBeFH0de/GLauXTTEVPKyAP8MxgL+Mb45dYj9TBcdXU3k8GNFfegOCHtQsYFgPflOwX2zBElEXglkurYa4t8cQ59WS7UP+r6MtIyxW15t+sZX6yI3xQkBgLzmQQjABVqn4x9iLXPMiRwsHRhnhcXICJ6NDH7a/uoaI1I6P0JfcpIv750DjVZvQUMhbq4NuDALeoYeLsVLASGCjLzrIH1Am69j4j6EmYoixmJ86sTQjWu3QSKuFwPl2UPTDWMN/t1VUb6ZTF+l0YDz97eE+GnLOP4HAZ7DC4WghEbFTO1s5pmAsE3n1U5AuisvnaiHGGQdSmi+0rhcpdajvGYEKPEW2/+2MP/g0GnUBGU2PHiNP95m84H27XK2ew5ORhMyCpEIttEgn5q6Ber86mP7spKwTc8U4XSmzO10IVXJUq9VjgTLyOxfyK8V+vIDIaHyrF54Qu7LIm9axwyQMUH/s0JuXO99r7VbVJpu+KYvjOe+l6T1V4Cz/q5Etly0u+09FigbbG/R2Dcw/hFXzJRrgbzI2HTcTwJN75xXpm3BzOKZitBTvNKGhbq7MSuewtj0x4xPOeZLBWp8VscvnoGtL2Kmp+R5oZfjKHuniqPvnpQfjmjOlW3wprOrTy3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5268.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(36756003)(2616005)(956004)(86362001)(83380400001)(2906002)(66476007)(478600001)(8936002)(31686004)(31696002)(44832011)(53546011)(8676002)(16576012)(16526019)(316002)(38350700002)(38100700002)(5660300002)(186003)(52116002)(26005)(66556008)(30864003)(6486002)(110136005)(66946007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZjFvMmxvVXhsWjVvelY0cVFWOVVkY0dVRHpjY0xqcENJVFVQVmRmdmt5Z3Rs?=
 =?utf-8?B?Nk1sVFdTOEU3c1RsNmlycktqcEFva2ZMMXRvcWxwdzZjTXk2R2hFVyt4ZUh1?=
 =?utf-8?B?bmRYRy9FMTArWmFjcXBhMlZuSWt3WXFGWlVBallWY1pHZ0pJc3B5R1UzRkxG?=
 =?utf-8?B?VjRJSEsrZTVOcGoySTQyNjNDQUJEWDcyRUtRNlBwWUtKYytEcU1KcGJFSWZS?=
 =?utf-8?B?WEQ0OHU0ZlI4a29CaGtaVlRrYzgwbnhJdkEvNG9Zam5nQU8zTW9yTmMzYWJm?=
 =?utf-8?B?UmVyZStOOTJ4UTNGd0JPNlFUZzlubHJuQlcyNzZNTE1Vdmh6MFQ2ZngyZWpG?=
 =?utf-8?B?TW1YUlRob2NWNzh0MUNwMlp1TWcwcjFCNFZDTHNOVE5MMHJGc3ZBSi9VWThu?=
 =?utf-8?B?dkRBLzJTeThITFNuVDM0bkp5N0tnUnI4SGU4VzNOZ0ZZY3RROTZGRG9FOGoz?=
 =?utf-8?B?OWI5YmlIVkttUktkMVVQTytDbjJXV251dXhWTkp5ZWRza0xFODZ5aCtjNUVR?=
 =?utf-8?B?TCtBUUVscnlTdGJOcUxjdXVXbTJnY1RYT3I4VmhLK05mTHdub0p2ZVdWajRJ?=
 =?utf-8?B?d2JnN0l4T0t0OElSZjQyZEZ6QWg4SFQ1cVdZMXZNUmhUVXJUNFl5Wkg3VmRh?=
 =?utf-8?B?ck8xbjRESFRkMjcyY0d1WlFWeVozMEp1MlZsVExqeW83WE1qd3R6R3E5alpT?=
 =?utf-8?B?WENXWnJYaDZ1U1hwVlMrRHNtVmdkcXdUQmhuczZlb2FwWk92S2RuVVNObjRv?=
 =?utf-8?B?eW0zRXp6alNkNC9LVzV2SjZkM1VNMEpmMlg1WDVjNktqYU5zQjIxT0lXMjBV?=
 =?utf-8?B?Q3FiZEIrWmRmM201ODlGQ1ZtK2U1VC85RUZTTFpzSDRsOFZVejUvRm5acGZI?=
 =?utf-8?B?S2lpMU5FMDNaK3VsSFRYWXJuMll2bHdkV0VlWjdNYzJJa0tMTUtoMnpMUmps?=
 =?utf-8?B?NEZxWFFIY1B5aW9qelFDZU1tN2VST3M5T2pYd2k1Wkw3YlJwUzlLUVlmbGhq?=
 =?utf-8?B?SFZmenVHa2NZdGdnNmdlR0UzeVA3eWZwNTJLb3BXMGZ6UXhZT1IvRkNqQTk2?=
 =?utf-8?B?dXNPWE5Oc0lJNVBBcVMwbkFpbFd1cjg5aTdRdGVTRHovSlBoQ2k2N3hHTWlw?=
 =?utf-8?B?OG9uVVBJZjFNL292a1pBUE9SclNaUXkzZDBOTFp5SzR6ZDhOeGpIdnFxRE9r?=
 =?utf-8?B?Kzg2Qi9Wd1FFamZFS2xFUWc0b3lCM2pWK2FCdWN5MnhJY3FqSWZSYXBSOFdP?=
 =?utf-8?B?aDNsdDhMUlZuazhrN0VPc0FvY2c3K2c2OW5qUXVqUG5wbXRYM0lZVHhUUnBG?=
 =?utf-8?B?ZWM1YW9OZmp2TmNLeGhkelhScUd0RmJjWVBGM2FqelBidmgyQ2J5UGZUZ3B6?=
 =?utf-8?B?S24xcXJPWjM2N3FISXBxSk9PcXpMcmwrY1d5aUptaHB0c0kzMkFDNW83djFT?=
 =?utf-8?B?QVFaMXlLeEhsV1dKdkVwTU1GY3NndndkdkowSzlpMHVCZjM5V1grNzFWUERs?=
 =?utf-8?B?UGtFSmdSSHZMSUdqQUlqQVBkY1pmUmlaV1A3Lys3MWNoOWozZVk1aFJ2Mklz?=
 =?utf-8?B?S2N5OWRZWWpMN2FnNFlaWTJEdm5FandIb0JoTW5EYlpYSnBSUjRqSlhHOHph?=
 =?utf-8?B?WnhzWXFFM1NmejRQUlNVWE1iSlB6NkR1Nml2SUgrbkVKd0dEb1Z6WGtqaGU2?=
 =?utf-8?B?K3Z6WGpYR3lRbWxkWENtTDlscWkzSjdIaS85bXhNTE5nMi9PY2g4TjlVa0VE?=
 =?utf-8?Q?rkHZAwuMmqqxPFvylr0X2jXF486aG3J1xvGhv10?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125c589d-4ed3-4b6a-f67d-08d9196b6e54
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5268.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 19:39:05.6387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wO6f4SIjNIgaFI6eKttOTQkGtOkSTs06neWuSYISvdVN4r/zuvU780GwACbU/dsMsNjncJEiZmFBrJ9VOD0UDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5562
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, Bhawanpreet.Lakha@amd.com,
 dri-devel@lists.freedesktop.org, Shirish.S@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-05-17 12:48 p.m., Sebastian Wick wrote:
> On 2021-05-17 10:57, Pekka Paalanen wrote:
>> On Fri, 14 May 2021 17:05:11 -0400
>> Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>> On 2021-04-27 10:50 a.m., Pekka Paalanen wrote:
>>> > On Mon, 26 Apr 2021 13:38:49 -0400
>>> > Harry Wentland <harry.wentland@amd.com> wrote:
>>
>> ...
>>
>>> >> ## Mastering Luminances
>>> >>
>>> >> Now we are able to use the PQ 2084 EOTF to define the luminance of
>>> >> pixels in absolute terms. Unfortunately we're again presented with
>>> >> physical limitations of the display technologies on the market 
>>> today.
>>> >> Here are a few examples of luminance ranges of displays.
>>> >>
>>> >> | Display                  | Luminance range in nits |
>>> >> | ------------------------ | ----------------------- |
>>> >> | Typical PC display       | 0.3 - 200 |
>>> >> | Excellent LCD HDTV       | 0.3 - 400 |
>>> >> | HDR LCD w/ local dimming | 0.05 - 1,500 |
>>> >>
>>> >> Since no display can currently show the full 0.0005 to 10,000 nits
>>> >> luminance range the display will need to tonemap the HDR content, 
>>> i.e
>>> >> to fit the content within a display's capabilities. To assist with
>>> >> tonemapping HDR content is usually accompanied with a metadata that
>>> >> describes (among other things) the minimum and maximum mastering
>>> >> luminance, i.e. the maximum and minimum luminance of the display 
>>> that
>>> >> was used to master the HDR content.
>>> >>
>>> >> The HDR metadata is currently defined on the drm_connector via the
>>> >> hdr_output_metadata blob property.
>>> >>
>>> >> It might be useful to define per-plane hdr metadata, as different
>>> >> planes might have been mastered differently.
>>> >
>>> > I don't think this would directly help with the dynamic range 
>>> blending
>>> > problem. You still need to establish the mapping between the optical
>>> > values from two different EOTFs and dynamic ranges. Or can you know
>>> > which optical values match the mastering display maximum and minimum
>>> > luminances for not-PQ?
>>> >
>>>
>>> My understanding of this is probably best illustrated by this example:
>>>
>>> Assume HDR was mastered on a display with a maximum white level of 500
>>> nits and played back on a display that supports a max white level of 
>>> 400
>>> nits. If you know the mastering white level of 500 you know that 
>>> this is
>>> the maximum value you need to compress down to 400 nits, allowing 
>>> you to
>>> use the full extent of the 400 nits panel.
>>
>> Right, but in the kernel, where do you get these nits values from?
>>
>> hdr_output_metadata blob is infoframe data to the monitor. I think this
>> should be independent of the metadata used for color transformations in
>> the display pipeline before the monitor.
>>
>> EDID may tell us the monitor HDR metadata, but again what is used in
>> the color transformations should be independent, because EDIDs lie,
>> lighting environments change, and users have different preferences.
>>
>> What about black levels?
>>
>> Do you want to do black level adjustment?
>>
>> How exactly should the compression work?
>>
>> Where do you map the mid-tones?
>>
>> What if the end user wants something different?
>
> I suspect that this is not about tone mapping at all. The use cases
> listed always have the display in PQ mode and just assume that no
> content exceeds the PQ limitations. Then you can simply bring all
> content to the color space with a matrix multiplication and then map the
> linear light content somewhere into the PQ range. Tone mapping is
> performed in the display only.
>
> From a generic wayland compositor point of view this is uninteresting.
>
It a compositor's decision to provide or not the metadata property to 
the kernel. The metadata can be available from one or multiple clients 
or most likely not available at all.

Compositors may put a display in HDR10 ( when PQ 2084 INV EOTF and TM 
occurs in display ) or NATIVE mode and do not attach any metadata to the 
connector and do TM in compositor.

It is all about user preference or compositor design, or a combination 
of both options.


> I completely agree with what you said below though. I would even argue
> that all generic KMS abstract pipeline elements must have a well defined
> place in the pipeline and follow an exact specified formula.
>
>>
>>> If you do not know the mastering luminance is 500 nits you would
>>> have to compress 10,000 nits down to 400 (assuming PQ), losing quite
>>> a bit of the full 400 nits available as you'll need room to map the 500
>>> to 10,000 nits range which in reality is completely unused. You 
>>> might end
>>> up with mapping 500 nits to 350 nits, instead of mapping it to 400.
>>
>> The quality of the result depends on the compression (tone-mapping)
>> algorithm. I believe no-one will ever do a simple linear compression of
>> ranges.
>>
>> Instead, you probably do something smooth in the black end, keep
>> mid-tones roughly as they are, and the again do a smooth saturation to
>> some "reasonable" level that goes well with the monitor in the current
>> lighting environment without introducing coloring artifacts, and just
>> clip the huge overshoot of the full PQ-range.
>>
>> There are many big and small decisions to be made in how to map
>> out-of-gamut or out-of-brightness values into the displayable range,
>> and no algorithm fits all use cases. I believe this is why e.g. ICC
>> has several different "render intents", some of which are so vaguely
>> defined that they are practically undefined - just like what "a good
>> picture" means. You have essentially three dimensions: luminance, hue,
>> and saturation. Which one will you sacrifice, shift or emphasize and to
>> what degree to fit the square content peg into the round display hole?
>>
>> A naive example: Let's say content has 300 nits red. Your display can
>> show max 400 nits white or max 180 nits red, and anything in between.
>> What will you show?
>>
>> The problem is, that if UAPI does not define exactly what happens, then
>> taking advantage of these hardware capabilities means you have no idea
>> what happens to your content. This may be fine for closed systems, where
>> the software has been carefully built for the specific hardware
>> revision and the use cases of the complete system have been
>> pre-defined, so that it can assume what should and will happen. But
>> should that be exposed as a generic UAPI, when generic userspace has no
>> chance of knowing what it will do?
>>
>>
>> ...
>>
>>> >> ## Displays and Tonemapping
>>> >>
>>> >> External displays are able to do their own tone and color mapping,
>>> >> based on the mastering luminance, color primaries, and white space
>>> >> defined in the HDR metadata.
>>> >>
>>> >> Internal panels (which are currently few and far between) usually
>>> >> don't include the complex HW to do tone and color mapping on their
>>> >> own and will require the display driver to perform appropriate
>>> >> mapping.
>>> >
>>> > FWIW, when designing Weston's color management, we are aiming for
>>> > the latter "simple" panels foremost, because that gives us full 
>>> control
>>> > of all color conversions and tone mappings.
>>> >
>>> > OTOH, if Weston has to present to a display which only accepts e.g.
>>> > BT.2020/PQ signal, the display might always mangle the image in
>>> > unexpected ways. Therefore I expect that by default Weston will do
>>> > everything it can to try to make the display not apply anything magic
>>> > image enhancement: trust that EDID description of the display 
>>> gamut and
>>> > dynamic range are correct, and use HDR metadata to tell the display
>>> > that those values are exactly what we are using. And we use them.
>>> >
>>> > IMO, a display doing its tone mapping magically is only useful 
>>> when you
>>> > want to be able to use "simple" playback devices that cannot adapt to
>>> > the display they are driving. Magic tone mapping is also a way for
>>> > hardware vendors to differentiate, which from the color management
>>> > perspective is harmful as it makes it more difficult or impossible to
>>> > predict the display behaviour or to keep it consistent.
>>> >
>>> > So there are two opposing goals:
>>> >
>>> > - Traditional color management wants absolute control of the display,
>>> >   leaving nothing unpredictable and preferably also nothing 
>>> undefined.
>>> >   Undefined behaviour can always be measured (profiled) which 
>>> makes it
>>> >   predictable and known. The viewing environment is controlled and
>>> >   constant.
>>> >
>>> > - Entertainment wants the most visually impressive image quality by
>>> >   dynamically adapting to both displayed content and to the viewing
>>> >   environment conditions.
>>> >
>>>
>>> I feel much of the mess around HDR and CM is all the magic that 
>>> everyone
>>> tries to do to differentiate themselves. I'm not a fan of that. occures
>>>
>>> One thing to watch out for is that the definitions for some of these
>>> things (I'm thinking PWL LUTs, 3D LUT, SDR boots) might differ a fair
>>> bit between HW vendors and we'd want to find a way to hide these
>>> complexities to KMS clients.
>>
>> How could we hide them?
>>
>> Actually, what do you mean with "hide"?
>>
>>
>> ...
>>
>>> >> **One ARGB8888 SDR Plane + One P010 HDR Plane:** A normal 8bpc
>>> >> desktop plane, with a P010 HDR video plane underlayed. The HDR plane
>>> >> shall be PQ BT.2020 formatted. The desktop plane shall specify an 
>>> SDR
>>> >> boost value. The drm_connector's hdr_output_metadata shall be set.
>>> >
>>> > This use case requires blending in KMS, so is the primary goal I
>>> > suppose.
>>> >
>>>
>>> Correct, my understanding is that the key here is to ensure blending 
>>> in KMS
>>> is done in same blending space (linear RGB) as blending using GPU 
>>> shaders and
>>> SDR boost is applied in the same fashion.
>>
>> Yes, but this is also something I think cannot be achieved by telling
>> the kernel about color spaces and letting the driver come up with a
>> color transformation. I believe this can only be achieved by telling
>> the kernel the color transformation directly, and also describing to
>> userspace what kind of color transformations are possible (1D LUT, 3D
>> LUT, other; precision...).
>>
>> ...
>>
>>> >> ## Summary of proposed interface changes
>>> >>
>>> >> per drm_plane:
>>> >> - new RGB color space definitions, mirroring the existing YUV color
>>> >> space definitions
>>> >> - new transfer function property
>>> >> - new SDR maximum white level property
>>> >
>>> > How will these new KMS properties interact with per-plane DEGAMMA, 
>>> CTM
>>> > and/or GAMMA properties?
>>> >
>>> > Why go with your proposal instead of per-plane CTM and LUT?
>>> >
>>> > I think the ideal KMS pipeline for me, assuming I cannot have 3D LUTs
>>> > both per-plane and on CRTC, would be:
>>> >
>>> > plane:
>>> >     FB -> M1 -> LUT1 -> M2 -> blending input
>>> >
>>> > CRTC:
>>> >     blending output -> LUT2 -> M3 -> connector
>>> >
>>> > FB: framebuffer
>>> > M1: matrix transform, capable of converting e.g. YCbCr to RGB
>>> > LUT1: 1D LUT for content EOTF, to produce light-linear RGB
>>> > M2: matrix transform for color space transformation
>>> >
>>> > LUT2: 1D LUT for applying monitor EOTF^-1
>>> > M3: matrix transform, e.g. if you need to push YCbCr on the connector
>>> >
>>> > We also need to know where and how clipping happens.
>>> >
>>> > I think this scheme would allow implementing everything you want, and
>>> > it would not be tied to rigid enumerations, and it won't have any
>>> > magical conversions done under the hood as you would need to do to
>>> > convert from one enum space to another. It leaves the render 
>>> intent to
>>> > be defined by the userspace compositor, rather than building a fixed
>>> > policy in the kernel.
>>> >
>>> > Userspace would be setting transformation operators, not color 
>>> spaces,
>>> > to the kernel, allowing the blending space to be chosen by userspace.
>>> > In Weston we aim to choose then blending color space to be the 
>>> same as
>>> > the output color space, except in optical (linear) encoding. The 
>>> output
>>> > color space can be non-standard, e.g. measured with a display 
>>> profiler
>>> > equipment.
>>> >
>>> > I would expect gamut mapping, dynamic range mapping and tone 
>>> mapping to
>>> > be places where most experimentation and innovation happens, so
>>> > implementing them in the kernel with just few or no controllable
>>> > parameters at this time seems like it could become useless fast.
>>> >
>>>
>>> How important from a Wayland compositor perspective would it be to 
>>> have fully
>>> configurable LUTs per plane, as opposed to providing KMS with a 
>>> named transfer
>>> function, such as PQ or BT709, for LUT1 and LUT2?
>>
>> For Wayland desktop compositors, absolutely essential in my opinion.
>>
>> I would strongly advice against any desktop compositor from using the
>> "named transfer function" API and instead do everything in GPU shaders
>> if no other KMS way exists, unless the KMS UAPI definition gives the
>> exact mathematical formula of what that step will do.
>>
>> For entertainment devices using Wayland as an internal detail, who
>> cares. The system manufacturer makes things work any way they want, and
>> you cannot run non-curated apps on those devices, so there are no
>> compatibility issues.
>>
>> Then there would be systems between those two extremes, which would
>> likely use a mixture of those approaches, e.g. Kodi on bare hardware I
>> imagine (no Wayland there, but Wayland is kind of unrelated except for
>> the ideology).
>>
>> Mind, I'm not talking only about EOTFs here, but thinking of the whole
>> color management. EOTFs per se are simple. Tone-mapping, including gamut
>> mapping and luminance mapping, are hard because there is no one correct
>> formula.
>>
>> However, if we are talking about *only* EOTFs, then an enumeration of
>> the curves could be usable. But you were also talking about configuring
>> dynamic ranges and doing luminance range mapping in the driver, which I
>> think won't work with enums, but could perhaps be accounted for in M2
>> by userspace. Then again, if you have enums and not a LUT, you cannot
>> implement custom non-linear per-channel mapping which might be useful
>> for e.g. adapting SDR content for a HDR blending space. Or HDR content
>> to a different HDR blending space.
>>
>> See, a LUT can be more than just EOTF: it can apply a part of the
>> tone-mapping too. An enum cannot.
>>
>> I have a feeling that most tone-mapping curves would be non-linear with
>> some sort of S-shape and clipping of black and white ends. But that is
>> also a naive view, because tone-mapping is not a 1D-curve, it's a
>> mapping from R^3 to R^3 in RGB since on a 600 nit monitor you cannot do
>> 600 nit red for instance. On a 600 nit monitor you can do exactly one
>> color with 600 nits: white.
>>
>>> M1 on AMD's driver is currently hidden in our driver and essentially 
>>> always
>>> set to BT709 at the moment, though we should look at color_encoding 
>>> to pick
>>> the right M1. Are the color_encoding and color_range properties 
>>> enough for
>>> what you'd like to achieve for M1?
>>
>> Probably yes, for standard format content, until a new standard comes up
>> again and then you have to add another enum value in the UAPI. M1 is
>> probably the best place where an enum fits in the pipeline though, and
>> for M3 as well because non-RGB inputs to monitors are quite
>> standardised, and at those steps I would assume there are no parts of
>> tone-mapping done.
>>
>>> M3, currently the only matrix exposed by KMS (on drm_crtc) currently 
>>> seems to be
>>> applied at M2 by AMD's driver. I need to dig into this a bit more. 
>>> It would
>>> make sense to expose M2 and M3 as part of KMS (on drm_crtc and 
>>> drm_plane).
>>
>> Good, it's really important to make sure that all drivers agree on the
>> pipeline layout that is defined(???) in the KMS UAPI specification.
>>
>>> I did a bunch of reading and thinking since your comments and 
>>> created a v2 of
>>> the patchset. I don't think it's where we need it to be but I hope 
>>> it's a
>>> step in the right direction. I will send it shortly.
>>
>> I have to say I'm still very sceptical about this enum-based approach
>> as you have noticed. :-)
>>
>>
>> Thanks,
>> pq

