Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2017E83BF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB70010E266;
	Fri, 10 Nov 2023 20:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5814410E262;
 Fri, 10 Nov 2023 20:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brs+4ezdAxRpQThGQfnTe9nIX3G+HTtgSQagZM0NOiclubzG2jKWRn95uPpdrcC+clhNrTfpLZ7k3qIi4SEJP76s9sYeoBT5ImXa92u+NvQhPHYgOlw6p8FMM3WZLCRw5qpTat3FYEyQ/VuMYhxVeCEixd0scg4GyXJli5O94srwR/OxkytH4M+tXzvMeh76L3TGeR8RmmTIx0YLBLPiKDXpIaOZN8bzok0lGJFdoKge5KM3gE4pLFwPAw3mdTVGZkn1/kp4tTNo2FLRtvBXKfwKZPZseFspF+nDrwTpy9vEDOJJsj4P6UWNez5aqH6K5NZMqEFlxWZR0L+B7mDfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61gbrLAKFb9vnAQKfk1KcAdat2KVCG9CMsBvV4F5Aw8=;
 b=XBN1lJVfQp07zXBB/YbGsESZEr+9gcxeMMe2ro4bWAMSBTy4hIpaM/kFIMX5TEXnm+D4CF1XADZqxXpFBhPuZrYvdngwIaAy2SX8Q+5Va/VYn7fsd3Rc3QD0XOl1ENN4s2FRxqrED1+uQy9dUoy23itejAzuog2km9FEP7PolFXvIDxSmmaXpsVSTGauU3GuO4ib4SRF6+CuHqR8NrvBnguvYs7opBZhPROkjyVH+gi2twq6W/wu7rJKz0+MkN3lrRSv5OOOuXA0NEpid4clSgp5iMnF9hyIJdTcXjjojI/tF7Mk4WH9tyziN09e0g78DiQugKuZD5joP+OfpOZdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61gbrLAKFb9vnAQKfk1KcAdat2KVCG9CMsBvV4F5Aw8=;
 b=eRa+FaGhsZnWDXR4haUEJcp92dkhCTsna5pYoFWxRxQWmsNDQzEZbxkurEZ3AldOczqlkXNynscifMYALGHO8lFQPl/E4lk81aT68JUUQLONOcf2xbuwH5OfKXgTOW7mNKTI2FEFT6+WiLvI97oAp69MlRKbLbFzE8ER72+oZm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 20:27:07 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 20:27:07 +0000
Message-ID: <76e1744e-28bb-40d3-b114-8f5a21e914b3@amd.com>
Date: Fri, 10 Nov 2023 15:27:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
 <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
 <20231108121601.163e58db@eldfell>
 <CA+hFU4zFz1NyDRzgaeaWVEw9GU-Lm9D=oDsOABnOpMsNHQfdzQ@mail.gmail.com>
 <6c574ff5-8890-4acd-a873-7cb2fb48ce7f@amd.com>
 <20231108181731.4fe6f5d3@eldfell>
 <43a56f81-ed15-4f44-ba38-2896df405f84@amd.com>
 <20231109112005.7b55917e@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231109112005.7b55917e@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::39) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: d910aa77-ae97-441f-7ea6-08dbe22b68b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHa/tdJ10lEtKBmZtT1K/CDl9VjcjPPA72L9siBMVvT47JKbyuv4pFhmzW83oPgxASAmcQEcqVCG/dgRYRkBlLPjh2sGaIQGX+6CKdKzf6DKIDieGA7HyV5CQ8iGyEZ9Q3WfWGKQMwwQ2zTQulMod6CkNlktfVkFBYVe4fS09z9gn6aWsfuAc4+99QkbCR0i/87fvfixka/5rXVpBwYm/lsTYy/G6khHGgKudGjjvvtqiyoargHUfkoX3zJQrzulphyZWwrol12FKXjaKfpl9VPbi8alfnwpCTFelVRTQv5bf4nC4XS3ud7V09ObJd7gtGvRTTlfOZCvuYMzuZSvg+YnEYO5AGuHbI3wf0PZdHfyQeRRW0CrluD7xZ3jbCXRAUSyHgvyNSlL7+XrTc1GjzdORMYiD/geE7rINFhAzErJZhPWd3alrt+ALXeRVDZHUC+gXJYM2zypY5UJrlSLPfj6BnDBCQJbPWBPw1+dJ52RAngkPxHrKQljiysTdIImJoelaf8CU0jQUPWpPWXa2uHmIOwqVlaxhAQPew1WxS6VvCeWVi+gb6gP8vCpchc+ywe8zOqMUpVMY2Zl43VRRVHbQ/OBXXyovizSflqTwxEBO9xKfnr+MUCv5CqpdBZh4HiRUSQbdc6B66MoG+b0Uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38100700002)(6506007)(6666004)(53546011)(31686004)(83380400001)(26005)(6512007)(7416002)(41300700001)(86362001)(2906002)(5660300002)(36756003)(8936002)(8676002)(4326008)(31696002)(44832011)(54906003)(66946007)(66556008)(66476007)(6916009)(316002)(6486002)(2616005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVJxdW5FQ1pvZFNZcWJHRGs1dENtTFJoTGhMQmg5dmtLL0pDSTZ5bHcxS205?=
 =?utf-8?B?SHBpeFVMblZYdC8vTnAzUU5UbHczY3A5bTM5dXM0dlVUYjc1UThSdmw0SG5T?=
 =?utf-8?B?N0xsdnBwaUlueC9rbTlJU2VoVDRqeW5kMDBaRkNsMlR0ZzFuVGxXRktkQ2kw?=
 =?utf-8?B?R1U1blJoVlBJS2JkamptOFJRRjJ5dGNBRnVYTGx3aFkrNlVBQllEcXY5bDk3?=
 =?utf-8?B?YldJSG9Ca1VqZ0FsOXRXelJ4YTR6cmFWaGFKQ0oreXh0Z0xlZ3lmbjh0MERG?=
 =?utf-8?B?TitaWjNBOVRLWXVFcnBiakxGNzJRVEVyNXNqaXRIVkovMW9iOFpDeUlUOWla?=
 =?utf-8?B?VmdremhQdmZFMGhkK09VQjUxN3dHM1psRk4rL1RCbkhWa1lkdEVwU2gyaExQ?=
 =?utf-8?B?RVVuL3V0bnptbjhvTlU2ZVp0bS9pU3c4K3lITnIwSFJSNXYxU05ubERyMXZ1?=
 =?utf-8?B?MlRJbzVkM0lZV0FjakppYmxKRlBTcDZoTVdOS0V2K1dnVDNGVGFITE0rOHBU?=
 =?utf-8?B?OFI4TC9NYTZqM001RnJaNjhPWlZzTC9BNURFblEvVkhJUW02Q0xyWisrUXRO?=
 =?utf-8?B?cC9lTHc0VGRQVG52bEI1eTNIT05kL1JrOUM5KzQyUWI2K1JTYTdhK1RTTjk0?=
 =?utf-8?B?VERRL3pQZGpBUFMrcVRTak5Rc0lSeEkyS3krYkRHZ3JqSW4wdG9aRjFERU1r?=
 =?utf-8?B?QkJ5NkdMMVBWS09NZjA3R0VEOEdaUGZVK3EyQTZHTkw5TkExd0Z2OHdYTmdJ?=
 =?utf-8?B?L0p6cFU4S1hTeDFsazJ6b2lrRWR1dEh2eG83a3Y2MnZmaE8wT2hBd1lxKzdo?=
 =?utf-8?B?QnROK0thUGxSQmtKWTREQ2UzeHpSS2FtaTlsSWo2cWdheUFXbWc5V3IxZkxM?=
 =?utf-8?B?VSsrbVlENGF2YzdpekhMOUtRZHQ0K21lVU44RElQa0FRNCtJM0oxQmNGVS9R?=
 =?utf-8?B?aHFNTTQzV05iTnZ2SSsvcnVRQTBqN0NnK3hMYjFaNEFEaWo3UVZUckZCQS9t?=
 =?utf-8?B?NXJNbUxZeEh4SEJ0dllQYW9zSlE1ZVZsbSt1c0FFdUNmSUI0OWRtc2FmUHNW?=
 =?utf-8?B?MVpQQWNqZXpZekt3RmZFZUlEWTA0blpvQUNSUTBGUk1GTXYyNFFWcnhteEgr?=
 =?utf-8?B?WEZXT2RHd1ZSU3YwdGF1R0t4M2ltUklubmE5a3hIU1dqRmJtZUg1RCt6T1Iw?=
 =?utf-8?B?c2VmNllFWVNQYnN4LzBFNjA5ZFBaT3RRVTdteUFZeTJ0YkJmM0lyeWkxNFho?=
 =?utf-8?B?TjVDbnJJcldJTFNMNGNCKzNtMWlSci9uemhIVWlxb0Vhb1c1MFVoOWR6ZzZy?=
 =?utf-8?B?OTVIUlZvNTBoS1d3YWFFc3lCMnNkOGoxdGlpSVhJR3J5YWFuUU1WQWNPUFB3?=
 =?utf-8?B?ck9qTlBPTzAzZmc3MHlKL3dsYURYa2l4TmNhTXFlcUNHT24yK0VadERSR2Mw?=
 =?utf-8?B?aWFlN3d4ZFpXR0h6bHlSUXZvSHBtTW96ZUlVRWl1MEpBNCtKU0Z1eVhyNmxw?=
 =?utf-8?B?ZlBvYzlXZ2g0ZDU2ZGFIbHJpZlpsQWJIeFJvSzFLMFdpOUdiWFJUVEFnNEdv?=
 =?utf-8?B?MHJYRlJrRXAxRVloLzBCd0hLcjJqZzZkcFNXUHlYbENxTEd1Sk4xWXZWWUxn?=
 =?utf-8?B?YVZoaDVNMnl5ekxFeTdIR3ducXVkQkw5d2VoaUVpdnFvaEZLNGNrWExHbmVv?=
 =?utf-8?B?U0U2TndCb1BIcnJYOTRtd0NBRyszMVBwZGErLzBtL2tpRlpDbzRPdkVqZm9N?=
 =?utf-8?B?cExVQUdZMFMzRXd6SjlKQjYrMWt5eitmZEdBUnMxbXE5U2U5QjhWUjJXdk5k?=
 =?utf-8?B?MnN5YTFIQk81enRnTUYvd3MyZ2xFVEVPT3N3RzBvSUlleWh1azl6QXltYmV1?=
 =?utf-8?B?SlpwNHlpSlBQV0NoVlZIYllpcnBlRjFCWGdIYTFQOE9wU1grb2hBTG93d0du?=
 =?utf-8?B?c2hRd2ZYTVJscTM2bGI0b2JSQW9aaW0xZ3dZV3hvUVM0am10UXNDUFM2MnJq?=
 =?utf-8?B?Nm1PRituY0tSNTZLYXJkWU9CaTFqb1VnVnQ0Z3Zia2k3TVJPSHUxc1hPbldQ?=
 =?utf-8?B?UkhmWE1GbXhUTEhtZ1luZUVOWS9LOGt1cFQ4NjlGRE53TGNCM1dGVzNPNGJR?=
 =?utf-8?Q?rlDJQR4iUd2Mu8HEbclevc9R1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d910aa77-ae97-441f-7ea6-08dbe22b68b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 20:27:07.3279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dBsZbDMvpJ22KyvM+3SKE0ugDm1yNBKe80P4wIiV9d0sjnv21d8I2Vt9W41VrT00uDvGQNXDhQhJHh9Faf93A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
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
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-09 04:20, Pekka Paalanen wrote:
> On Wed, 8 Nov 2023 11:27:35 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-11-08 11:19, Pekka Paalanen wrote:
>>> On Wed, 8 Nov 2023 09:31:17 -0500
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>    
>>>> On 2023-11-08 06:40, Sebastian Wick wrote:
>>>>> On Wed, Nov 8, 2023 at 11:16 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
> ...
> 
>>>>>> An incremental UAPI development approach is fine by me, meaning that
>>>>>> pipelines might not be complete at first, but I believe that requires
>>>>>> telling userspace whether the driver developers consider the pipeline
>>>>>> complete (no undescribed operations that would significantly change
>>>>>> results from the expected results given the UAPI exposed pipeline).
>>>>>>
>>>>>> The prime example of what I would like to know is that if a FB
>>>>>> contains PQ-encoded image and I use a color pipeline to scale that
>>>>>> image up, will the interpolation happen before or after the non-linear
>>>>>> colorop that decodes PQ. That is a significant difference as pointed
>>>>>> out by Joshua.
>>>>>>     
>>>>
>>>> That's fair and I want to give that to you. My concern stems from
>>>> the sentiment that I hear that any pipeline that doesn't explicitly
>>>> advertise this is useless. I don't agree there. Let's not let perfect
>>>> be the enemy of good.
>>>
>>> It's up to the use case. The policy of what is sufficient should reside
>>> in userspace.
>>>
>>> What about matching compositor shader composition with KMS?
>>>
>>> Can we use that as a rough precision threshold? If userspace implements
>>> the exact same color pipeline as the KMS UAPI describes, then that and
>>> the KMS composited result should be indistinguishable in side-by-side
>>> or alternating visual inspection on any monitor in isolation.
>>>
>>> Did this whole effort not start from wanting to off-load things to
>>> display hardware but still maintain visual equivalence to software/GPU
>>> composition?
>>>    
>>
>> I agree with you and I want all that as well.
>>
>> All I'm saying is that every userspace won't have the same policy of
>> what is sufficient. Just because Weston has a very high threshold
>> doesn't mean we can't move forward with a workable solution for other
>> userspace, as long as we don't do something that prevents us from
>> doing the perfect solution eventually.
>>
>> And yes, I do want a solution that works for Weston and hear your
>> comments on what that requires.
> 
> I totally agree.
> 
> How will that be reflected in the UAPI? If some pipelines are different
> from others in correctness/strictness perspective, how will userspace
> tell them apart?
> 
> Is the current proposal along the lines of: userspace creates a
> software pipeline first, and if it cannot map all operations on it to
> KMS color pipeline colorops, then the KMS pipeline is not sufficient?
> 
> The gist being, if the software pipeline is scaling the image for
> example, then it must find a scaling colorop in the KMS pipeline if it
> cares about the scaling correctness.
> 

With a simplified model of an imaginary color pipeline I expect this
to look like this:

Color Pipeline 1:
   EOTF Curve - CTM

Color Pipeline 2:
   EOTF Curve - scale - CTM

Realistically both would most likely map to the same HW blocks.

Assuming userspace A and B do the following:
   EOTF Curve - scale - CTM

Userspace A doesn't care about scaling and would only look for:
   EOTF Curve - CTM

and find a match with Color Pipeline 1.

Userspace B cares about scaling and would look for
   EOTF Curve - scale - CTM

and find a match with Color Pipeline 2.

If Color Pipeline 2 is not exposed in the first iteration of the
driver's implementation userspace A would still be able to make
use of it, but userspace B would not, since it requires a defined
scale operation. If the driver then exposes Color Pipeline 2 in a
second iteration userspace B can find a match for what it needs
and make use of it.

Realistically userspace B would not attempt to implement a DRM/KMS
color pipeline implementation unless it knows that there's a driver
that can do what it needs.

> Another example is YUV pixel format on an FB that magically turns into
> some kind of RGB when sampled, but there is no colorop to tell what
> happens. I suppose userspace cannot assume that the lack of colorop
> there means an identity YUV->RGB matrix either? How to model
> that? I guess the already mentioned pixel format requirements on a
> pipeline would help, making it impossible to use a pipeline without a
> YUV->RGB colorop on a YUV FB unless the lack of colorop does indeed
> mean an identity matrix.
> 

I agree.

> The same with sub-sampled YUV which probably needs to always(?) be
> expanded into fully sampled at the beginning of a pipeline? Chroma
> siting.
> 
> This is in addition to the previously discussed userspace policy that
> if a KMS color pipeline contains colorops the userspace does not
> recognise, userspace probably should not pick that pipeline under any
> conditions, because it might do something completely unexpected.
> 

Unless those colorops can be put into bypass.

> I think the above could work, but I feel it requires documenting several
> examples like scaling that might not exist in the colorop definitions
> at first. Otherwise particularly userspace developers might not come to
> think of them, whether they care about those operations. I haven't read
> the latest doc yet, so I'm not sure if it's already there.
> 

True.

But I'm somewhat reluctant to define things that don't have an
implementation by a driver and an associated IGT test. I've seen
too many definitions (like the drm_connector Colorspace property)
that define a bunch of things but it's unclear whether they are
actually used. Once you have those you can't change their definition
either, even if they are wrong. And you might not find out they are
wrong until you try to implement support end-to-end.

The age-old chicken-and-egg dilemma. It's really problematic to
define things that haven't been validated end-to-end.

> There is still a gap though: what if the hardware does something
> significant that is not modelled in the KMS pipeline with colorops? For
> example, always using a hard-wired sRGB curve to decode before blending
> and encode after blending. Or that cursor plane always uses the color
> pipeline set on the primary plane. How to stop userspace from being
> surprised?
> 

Yeah, it shouldn't. Anything extra that's done should be modelled with
a colorop. But I might be somewhat contradicting myself here because
this would mean that we'd need to model scaling.

Cursors are funky on AMD and I need to think about them more (though
I've been saying that for years :D ). Maybe on AMD we might want a
custom colorop for cursors that basically says "this plane will inherit
colorops from the underlying plane".

> Your comments sounded to me like you are letting go of the original
> design goals. I'm happy to hear that's not the case. Even if you were,
> that is a decision you can make since you are doing the work, and if I
> knew you're doing that intentionally I would stop complaining.
> 

Apologies for the misunderstanding. I agree with the original design
goals but I'm also trying to find a minimal workable solution that
allows us to iterate and improve on it going forward.

Harry

> 
> Thanks,
> pq
