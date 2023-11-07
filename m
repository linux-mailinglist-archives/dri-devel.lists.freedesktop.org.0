Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E17E4661
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550E710E629;
	Tue,  7 Nov 2023 16:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B9A10E62D;
 Tue,  7 Nov 2023 16:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIu9mJmBVOIkm6LU5bhNI1AzxqBZfnalDkjMReurCvQC3i6p3BbdK6GTIZeKyfyJBFuRMTX4+XGmrHerngKT3fiPgLHwnCjVmH5x2ydem5Y5uDtElguqWAi2K0grqij/EIk2yTHuMV71qtzLyE7XuxOVVuMuGPy0NWCXlSijDOG+vECmz6pA1yT2F3x9/tQJtNb2qepB3w9QD8yADpqtUC3LwGE6VsxTWvRSmoM/KlTbzcBUC5xaWsx7BYJgOzXLjqIPFJPONTre/Kt+vDemTotDE5dzAQOjvy4In61c7UGcz634WQ+ofMYpjsWEuHqYTMyDwBKeKk7oJG15STwtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhtriYxcw5huyBvaeDlen9VNzL86pYZ6rGW7HIxHOCQ=;
 b=jteA3BilgwV7YNDa/rNzmfq4JbkCAPDl2TmLOl22uCVEIrSGkL7J874VtH7PH4ZD+egXFDutkkYyHCLuUw9jPleqtkMXy29CrzsumPvwO8pgqa43uPXvvk565tWaWj1gGz2A/U4CUivLTWmRXHW/5fV2CtITv0e2IYKfGOQZyFiCF3QB6kYJ6KAYXbKXtWnRL8XwqYoqmckE0VKwK3oPnDXHQJkmN1AKkdIageB2aqb1CCd1V8Qq2iVZBvsrbZj0sSBhJ+1cw2zA0vtGO+NvebrF9f8aJzaYHs+PrZok+WtdBX2f/TFNrXXqqt6WhzA/v0n2RaSEtop6QzO80Ibn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhtriYxcw5huyBvaeDlen9VNzL86pYZ6rGW7HIxHOCQ=;
 b=04aiz+wfCru8NErOdig9uf9RxEPkFmxxfGh2ffIGIYWh6NkSUoBkfVESSvdS4ITfUMmdZD9gCjJWB9Z1zKxJUg1hmJ6uWjItWIPAu2aQ73Y/G+1NbtCjoZ0xDyyBMYTfUDtPFGeZPV5fSSUXcLce1eEZeFLUKJBB/uRDibwAw2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB5418.namprd12.prod.outlook.com (2603:10b6:510:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 16:52:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 16:52:18 +0000
Message-ID: <cf54143f-28df-4229-971b-6cf321b824b8@amd.com>
Date: Tue, 7 Nov 2023 11:52:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Alex Goins <agoins@nvidia.com>, Sebastian Wick <sebastian.wick@redhat.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea11b1e-01af-4fad-ca46-08dbdfb1e749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0rm02QYg3bgJ0mgbxa0CCNVGhlcxoDyIsj2KsC4vhk0A9hI7xBb7yJb8XAcijfUjkg5/uNLxGQIAt7vH7BiuTedRuO04il715Mj+sr3Si3duECWnRpRiC5NRFQ8I0c4Pd4hNuXb4LAWf/Tm14IexYtFCms/4qOuQOnQOc/OVlK153veUMQX0M9gwFiWGo8fqR9rOBj1UO7mFFM07FdisW4T3YkcwniS1qgAX4xZnYYa31pr+F6QnyFkymXGEvBeFObXe4qdT9OFepczqlHnnvK21dwUgIPQPSVhDNxy+9+bvLYvIc3/mXl6N37rJQ3o98V9bIqu4yfM97RgYhqamqBu+6uUscmyx3Lrl8NT5uTiXdDlCEMdr0ZSnvG56HL/ZQYioawivSJFdLadyAExdHYnVQWgubxl4iphXOTT6l+8wqNp8eTNDNybx4VyEcbnLuB+SXA3FXn+l37KP56oAq/G2HhKQxFTeqqNSE8QF+fna3i2EbiCuiVetzXCpfIeBHpnautCJRCEj7Wh0MGiemnVkGr81MN/rh3PuvsWL5X3KHlM11dXBv0CX3L5LUN3Lh7CbI5s5xWiZehvvDMEZscmURla7+I2GXlvMzxVQyeUkmGgBlZNz2R3R2a12O9eoNzn9yX1RvJ5CPvceWYetA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66899024)(31686004)(478600001)(6506007)(6512007)(2616005)(53546011)(6486002)(36756003)(31696002)(38100700002)(86362001)(5660300002)(110136005)(4001150100001)(44832011)(7416002)(316002)(66556008)(41300700001)(66476007)(83380400001)(54906003)(2906002)(26005)(66946007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTR1bUUzOGRsbXk1eGx5VGZYdXdPODBGaDAxamcraUx0QlZORGVEWWp2bjcx?=
 =?utf-8?B?UTF5MlBUMlZKckkwaitRSFc5RTJ1YnNZZVllUWFCendpOGkvekRlVGFITjlZ?=
 =?utf-8?B?a2lPUlU2Z1R2WmtkUkFUK01kSUV6Ukp1c2VOVis1aFhXTmFpNFpENmtqdVdm?=
 =?utf-8?B?aUFGRFQ3aVlUS3M4RnoyQ1lLcUk2UU5QbDkrSktYR3BJcGlWRXdKVFNtZFJX?=
 =?utf-8?B?K0Y2aWN6bU5ucXVhMkFKbVVyNGMwaW1iU3ozZit4VkFueXFyVTQvcHdxbm8r?=
 =?utf-8?B?MW9zbnYzWWRMNEEyRzd1dG13NEh4dGg2aHFWMlAza0hJY0pWMzhUVndYNDlm?=
 =?utf-8?B?RFFKcHdma3d1WkJNQVNrb1Y2K0Q2ZWdFYjN4VDFrRU1SdFFkRTUvSGFDN2NK?=
 =?utf-8?B?NWRqMjdPUFhwcTN6K2RMazNDUUdHUUR5WmxPQmIxVEQrTklvdFkxRXB2OVVq?=
 =?utf-8?B?L2ZMczlyVXdJNXlXbUZQVk5qQk82K05RK2ttWkNXdDczVGN6dUdKZmN4bWFM?=
 =?utf-8?B?QXZvU0tFU25OSWZITHJ4enFrZ3RZMUF1elNLTzhCRE1HMXRnVXFuemM0Z2pZ?=
 =?utf-8?B?NXZBSk1VOUwveExKQ0s2Yjl4cjFaR2lRSitsNE1OL0lCVGx2WW5uSWVjd1dl?=
 =?utf-8?B?U05uODRxMkZFY3FXTFRWczhHZUFSOUJlOTVJSGVPN1o5UXc4NldIeFRueER4?=
 =?utf-8?B?dWJ4YldlV0tVTCtJL1U0eGY2UmxQWHducmYyd05vNUVIUUlpWEJKY2hDSlVS?=
 =?utf-8?B?MXBPU28wMkZ6YzVjbHFzbDFpZ2I3NEpXblBzNjVlOXBIQzk3Zy9kSk5WWUJK?=
 =?utf-8?B?Z2VTNkhwYzdldXdiNXNzb3VMSFVTUmJDSzlFRXVVd2ZQMmRyM0crVzhYeUpX?=
 =?utf-8?B?SGtnNkJYSFZMM2tBY281SGlxZWRRMHdhM0k0QmhMd25ja1JEL3FpY21WelNy?=
 =?utf-8?B?RFljVWtZTGR1TlYyWWU2cjRnOXIwM09EOWN5WnJhYSsyTmJYUzNmOXFKZ0JV?=
 =?utf-8?B?clo1cDljQVFPTnVYMFgrMEpjYlRqaHdvS1lPWFBXNW1BSkRTb2hkSXhVbzl6?=
 =?utf-8?B?OXFmS0l0Y0tDdEpNaXE5VzRqRlNkWTlZZnRqRkJ2MWNkcmlnMjFvbTVBV1ZZ?=
 =?utf-8?B?Zjd0R1VBN1h1RDNlZ0pWU3oxZGpWdE9HNGdmR0plRlRJeEpHbVhSVlhKS0p1?=
 =?utf-8?B?cWQxbTZ2NUhYTTRSVmZqNjhVM2F6OU4rU0tXKzRtR1p1WnRnQkgwWEh3bGlS?=
 =?utf-8?B?WWJOVVJ2TEE3RnhVV1JUNjJLd1I2OWp1c2tWS3YxNGM3eU9oYzJKODFSZC9t?=
 =?utf-8?B?TW40MEt6ZmpGU0tIcHZGQlQ0VHBBc1BJaUN1cGlBMXBTc3FmejNKSmxLL2ts?=
 =?utf-8?B?cXkvRHRMZ3B4Uk0vdzhXTW52UWJ3bEcvL1loK1dpM08xUEJmWlJJYmJxeitw?=
 =?utf-8?B?eVM2ODJHRHRBVHZYRmt2Mnd4QlBkcVdhYitCc29JdXlpa1lZNGJXcXUwU1lI?=
 =?utf-8?B?SWlkQjdzSmR4V2tkUXBvNGNuWW91ZTJIeWc5YnIrMndNYXU3YnlzMm5NSVBp?=
 =?utf-8?B?dVVueVVWeHpjS1RjUTV4WEEzbXZPWW1ON29NVzVNbUp5NnphdWpydGRaYTFa?=
 =?utf-8?B?cGVVUENvQkp2U2tCOUdRdDd0SmpOUmpIOHFmVlVrSWJ3UXJ4cG1NQXUrWnNx?=
 =?utf-8?B?T25MaXNQRGlrR0cyb2JkekNsR3BuNGlKME4yWHdWdjA1cmhyd1NwQU5hSVVP?=
 =?utf-8?B?NUtxaHRHN1k5dFFuSTJOeVJwT01qMHNnblowR052em9PUWhvVk4xb2VxQVFp?=
 =?utf-8?B?YmNGOWNVOGdQYUpMekJ1cHI4Y2ZTVTlldW4wTDNiVVNHUDI1MWU0Zko5REhx?=
 =?utf-8?B?MUZKamRzei8zdG1RNHZ2MEEwQ0ZwL2VHS3phZzQ5d2toa2xvczZUU1lIR00y?=
 =?utf-8?B?QnV2dkV5L2xnMEFFN1JENHhuTERHUjFuWWF0Mkt2M242U2FlVTBiNjBwK3ZF?=
 =?utf-8?B?eUM4eW5PbFFpc2tnQUI0alBPTXdLTlJrVFlSSjl1b29pN2dTZ2ZRMWlUNy9k?=
 =?utf-8?B?SXdhRDYrczRKVHlsbFlWV2JZdzcxYVFUSmxuUHNGL0ZJczBEYkdNclJ6Zmc4?=
 =?utf-8?Q?b9Ms/tzubd96r2H36eZwpQQid?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea11b1e-01af-4fad-ca46-08dbdfb1e749
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:52:18.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwjOvtp9LZbJOOr8UPNqDFbJ8oJ+reOuYvJY0kPdXT3/RiQsZMqssbexsXfAcAPn/bntK676JkzbnK1jlz1f+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
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
Cc: Aleix Pol <aleixpol@kde.org>, Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 Victoria Brekenfeld <victoria@system76.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Joshua Ashton <joshua@froggi.es>, Uma Shankar <uma.shankar@intel.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, wayland-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-26 15:25, Alex Goins wrote:
> On Thu, 26 Oct 2023, Sebastian Wick wrote:
> 
>> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
>>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
>>> Alex Goins <agoins@nvidia.com> wrote:
>>>
>>>> Thank you Harry and all other contributors for your work on this. Responses
>>>> inline -
>>>>
>>>> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
>>>>
>>>>> On Fri, 20 Oct 2023 11:23:28 -0400
>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>
>>>>>> On 2023-10-20 10:57, Pekka Paalanen wrote:
>>>>>>> On Fri, 20 Oct 2023 16:22:56 +0200
>>>>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>>>>
>>>>>>>> Thanks for continuing to work on this!
>>>>>>>>
>>>>>>>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:

snip

>>>
>>> If we look at BT.2100, there is no such encoding even mentioned where
>>> 125.0 would correspond to 10k cd/m². That 125.0 convention already has
>>> a built-in assumption what the color spaces are and what the conversion
>>> is aiming to do. IOW, I would say that choice is opinionated from the
>>> start. The multiplier in BT.2100 is always 10000.
> 
> Be that as it may, the convention of FP16 125.0 corresponding to 10k nits is
> baked in our hardware, so it's unavoidable at least for NVIDIA pipelines.
> 

Yeah, that's not just NVidia, it's basically the same for AMD. Though I
think we can work without that assumption, but the PQ TF you get from AMD
will map to [0.0, 125.0].

snip

>>
>> We could simply fail commits when the pipeline and pixel format don't
>> work together. We'll probably need some kind of ingress no-op node
>> anyway and maybe could list pixel formats there if required to make it
>> easier to find a working configuration.
> 
> Yeah, we could, but having to figure that out through trial and error would be
> unfortunate. Per above, it might be easiest to just tag pipelines with a pixel
> format instead of trying to include the pixel format conversion as a color op.
> 

Agreed, We've been looking at libliftoff a bit but one of the problem is
that it does a lot of atomic checks to figure out an optimal HW plane
configuration and we run out of time budget before we're able to check
all options.

Atomic check failure is really not well suited for this stuff.


>>> "Without the need to define a new type" is something I think we need to
>>> consider case by case. I have a hard time giving a general opinion.
>>>
>>>>>>>
>>>>>>> Counter-example 2: image size scaling colorop. It might not be
>>>>>>> configurable, it is controlled by the plane CRTC_* and SRC_*
>>>>>>> properties. You still need to understand what it does, so you can
>>>>>>> arrange the scaling to work correctly. (Do not want to scale an image
>>>>>>> with PQ-encoded values as Josh demonstrated in XDC.)
>>>>>>>
>>>>>>
>>>>>> IMO the position of the scaling operation is the thing that's important
>>>>>> here as the color pipeline won't define scaling properties.
>>>>
>>>> I agree that blending should ideally be done in linear space, and I remember
>>>> that from Josh's presentation at XDC, but I don't recall the same being said for
>>>> scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
>>>> pipeline that is meant to be in PQ space (more on this below), and that was
>>>> found to achieve better results at HDR/SDR boundaries. Of course, this only
>>>> bolsters the argument that it would be helpful to have an informational "scaler"
>>>> element to understand at which stage scaling takes place.
>>>
>>> Both blending and scaling are fundamentally the same operation: you
>>> have two or more source colors (pixels), and you want to compute a
>>> weighted average of them following what happens in nature, that is,
>>> physics, as that is what humans are used to.
>>>
>>> Both blending and scaling will suffer from the same problems if the
>>> operation is performed on not light-linear values. The result of the
>>> weighted average does not correspond to physics.
>>>
>>> The problem may be hard to observe with natural imagery, but Josh's
>>> example shows it very clearly. Maybe that effect is sometimes useful
>>> for some imagery in some use cases, but it is still an accidental
>>> side-effect. You might get even better results if you don't rely on
>>> accidental side-effects but design a separate operation for the exact
>>> goal you have.
>>>
>>> Mind, by scaling we mean changing image size. Not scaling color values.
>>>
> 
> Fair enough, but it might not always be a choice given the hardware.
> 

I'm thinking of this as an information element, not a programmable.
Some HW could define this as programmable, but I probably wouldn't
on AMD HW.

snip

>>>
>>> What I was left puzzled about after the XDC workshop is that is it
>>> possible to pre-load configurations in the background (slow), and then
>>> quickly switch between them? Hardware-wise I mean.
> 
> This works fine for our "fast" LUTs, you just point them to a surface in video
> memory and they flip to it. You could keep multiple surfaces around and flip
> between them without having to reprogram them in software. We can easily do that
> with enumerated curves, populating them when the driver initializes instead of
> waiting for the client to request them. You can even point multiple hardware
> LUTs to the same video memory surface, if they need the same curve.
> 

Ultimately I think that's the best way to solve this problem, but it needs
HW that can do this.

snip

>>
>> The prepare-commit idea for blob properties would help to make the
>> pipelines usable again, but until then it's probably a good idea to just
>> not expose those pipelines.
> 
> The prepare-commit idea actually wouldn't work for these LUTs, because they are
> programmed using methods instead of pointing them to a surface. I'm actually not
> sure how slow it actually is, would need to benchmark it. I think not exposing
> them at all would be overkill, since it would mean you can't use the preblending
> scaler or tonemapper, and animation isn't necessary for that.
> 

I tend to agree. Maybe a "Heavy Operation" flag that tells userspace they can
use it but it might come at a significant cost.

Harry

> The AMD 3DLUT is another example of a LUT that is slow to update, and it would
> obviously be a major loss if that wasn't exposed. There just needs to be some
> way for clients to know if they are going to kill performance by trying to
> change it every frame.
> 
> Thanks,
> Alex
> 
>>
>>>
>>>
>>> Thanks,
>>> pq
>>
>>

