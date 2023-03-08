Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E46B12BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 21:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E94910E705;
	Wed,  8 Mar 2023 20:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CDB10E6FF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 20:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esIjJmtQdYpCPE44oWJkw7qZmfzzO3CAB4I7oR7x3XTsO7iT7BF+AogpkcwHDUzmlR8iJmH7BwYvnXUYKMkN8LqfjvCE2ctJNIgERM/eH0U7m+5sjwY3NUAlemcN4XM5JqdMT1nHigMvDqG0rgiIXJZZe+6lmRu0BE0HeTcT1UyjB4FqEVpx2re6FBRY3255lum8Cy/G2z0mW2DjmPoneyAUUaZhgp/i/7p0IeIMQLGJ0kZ6BO85Ua6HGxCtPz235yo/kOT/bl7AuOld9OQzIFGOfiqO9WcLt8x7YQPLzIdHa2NpmI9CVOnK6FLddcd5rCyiqjknSucg1E+eL+oVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpA7O7fIP3RA1upVpzgmgS6JZclbBj33qtdxmgRvRUI=;
 b=IQ8QOU405ek5UelhvCa/6G/wrUfRSK+3g8duz4i6PyjxUKGKw6VWHYLMvYVeUYhkBykQ70O+EYP8JCcV6Vh/deFmlhfK4nxUcx+hM8hRnuUCx/Z2/A7bu7DXSImcOiGAcQwdkT37mGyAoWxHPKssQ7Mpawa9bozkvBS5XzBWtvi43z6uW+Px24TkG8L05HnHRhrHT5iwAacxjzA5rr/t0PobBEv8XzDWUQ0mx1BByM3I417BJnYaSYl80f0L8fW6pBHeaftj+81IF2qQftFfpIiTeaBJc8VrgT1JWVDsMbXUJ6dFqXbP9flNkiWcqmCqCSXknryL4EHSWmMBw+Lfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpA7O7fIP3RA1upVpzgmgS6JZclbBj33qtdxmgRvRUI=;
 b=rIfnn+Bdb1LfHSQXaMlDL0XriYEb+R34KHWw21BE7ECDColi1OahANYCERtEMw3xW5Fw0pHHPpKF0Fs4r5tpY5YFOvmtWU3c/ZIcHrs8KmmblYHZnDJ81eXV9dxWkVScEzOjyRSoNSDXRs2NL9Hoo0bVZA8dUqJLPFcafx/osNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 20:14:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 20:14:42 +0000
Message-ID: <d544748c-8a2b-7c08-f199-182a56af22be@amd.com>
Date: Wed, 8 Mar 2023 21:14:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
 <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
 <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
 <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
 <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
 <d1fccceb-ca77-f653-17fc-63168e0da884@amd.com>
 <9c3dc2ad-11e4-6004-7230-8ca752e3d9f7@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9c3dc2ad-11e4-6004-7230-8ca752e3d9f7@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: fbcf49ec-2237-4335-b8a7-08db2011c0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYV+CQJC/iGsBfyKnpAitTKZzvYY52tgHe3NLKSIAg6usnQOWjEAZB39BVPyELuTmKfMLX7F7RlG/n0agVikY+fNOTIEQ2gOwg/zjkoF3B7+855PEQBzE2QhBIgg1t3vZEAK7be9NUxJ4uFbl/Nudf9cr9sBrlwo5JmRnlgbadhooL9RKBh0Qbat8uuxPiD3qCdUcPW96qobIN7HBhplAYNz1OxNE1RbROu9D3b19bybIFDyah3uU+dWlEkOdKrQqXCeqjrPHqTu53a82IDfkx7Cu1s0cXxfD03LdEb1fZS5Xm/gnzrGLN6qd2timJABm7Ds+GrDasDEVCOAO2AiAWvSEkzx/MCj5QBX4TFg44JHxidmISM6OgZnADj2NAQqtZ5qH9dSdnxMbmQlTpRdxVvI9jbI3D1W8fRBV6BguSZPEWIoCIKtdoe7r+KgPFc66OACMBofPx1QX5mHnDdTJvT3IKFR4RCvAJDOQMkUNK4OtPf3vT5XgwsqkWS1hyKUnCPrMoq50vyQ413ke0wtilM2e39mhz4hCjOFuZxYMXlr02nmfRdrj6fa4KTZOOo88I9QqI68c6a1bZ85MPljgYWl0PXNvsGyaBgKbEXuPtrGkmuJGtO+9MLD4Ik5UkhHJ0zlDIltBFVgdhxVWiE/XRGCldgzVxM2zADDzXueixZuaq04u1gePSU06OXNSe6ChdIz1U6WvGf95hW+YtAhdVM/2EG24xlRPgCOOR48V9gzXd2+6dGO2Gg7J6OooijE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199018)(478600001)(5660300002)(7416002)(186003)(83380400001)(6666004)(6506007)(6512007)(31696002)(66574015)(86362001)(2616005)(36756003)(6486002)(921005)(2906002)(316002)(41300700001)(8676002)(4326008)(66946007)(66476007)(66556008)(31686004)(38100700002)(54906003)(8936002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTBvQ3YwY294RTkwWWdSVno0aEl6R1FFblJXMWRyNGVwY2VDKzZyL0k1TjJ2?=
 =?utf-8?B?dFFNcGdxZm93cU5sMHdtQXZyWURpR3RKVTVFUXpCQ2JLKzBMbitGRno1cnBx?=
 =?utf-8?B?N0VtOXcrUmRGTTduMXA1Y1FXdUh4LzdOT21NK1ltSERjREd6WnVxSnBCelc5?=
 =?utf-8?B?WGZ6dGhDY0VCRVV6RHBlcGMwWGN3SFdwWkZOTXhFWWtURmxMWUd2OUU2Vi90?=
 =?utf-8?B?cTlnSEVZNGxWM2E5M2I3eStLWjFiYVYwZnFObkZ0Ry9tV0t0LzVaQzBpdWpL?=
 =?utf-8?B?VTBTc3Y4aitkbUIwVE45a3ExZmVVRjFNbmRKQXZBMWpja25OMjhWRStTdzA3?=
 =?utf-8?B?L0ttWUdNWTZZbTdOVXdndy9HaHB6TnlxWlhydVE5QmRlR3BpSVROVDgxRVZr?=
 =?utf-8?B?RmRJcVZpb0J1N0NCbVBoZmFKNHFya0s1bjJsYjh2UHFIeTJqb1BhSTB0T3ZW?=
 =?utf-8?B?Z0NMbXI1NnVjZWVncUZWYzRSb3oydDY4c2ZQQ28zMDE4VjkzcWFac1lDUmo1?=
 =?utf-8?B?QmcrWXJzU3o2U0pRNS9CWmQ5TTJZbVlwai85TUpJbUhKSWQ5MXZrcDh6dFBR?=
 =?utf-8?B?RDZwbWFxbm43bExqalpaVmlweHNHTzR6WjRqNlZiQ2dRSUJmeXVXZm11bDJD?=
 =?utf-8?B?K0dxSkJqTnFtSmQxQlQ2MGJxbkZWdktlS2xWWTJWeGFvdjVoejhwWFVFWmFk?=
 =?utf-8?B?aWxIK3B1NjBsZkZVbDdEUW5VUkNtS1U0a2JvMnhCL201ZVp6VkFKWnJXUnVG?=
 =?utf-8?B?ek9keC9KdDdBTDVWeVJpc0dtaGdWZWlKY3RCbWdDalhnSG0vN3JZZDlTOFpa?=
 =?utf-8?B?NEM0YjR3M0VySC9GU3ZwUEFzV3J6Z2xJV3l0TkpaVS85RXNpUVNaVmlZb0tK?=
 =?utf-8?B?aHVXNzRiN1JYeU1MRUZSaU1wMU85Tnc3a252KzhBR29VbkhPMmhrS1FSbC9w?=
 =?utf-8?B?eStJYmd6bW8ya1BvdmhBMVZtZTVCUlZmM1RlUVNZWWZxMXI4UWZCSHZ0TVZJ?=
 =?utf-8?B?TEhJcTRjUmR4ME1Saml0N2t5ajRSRDNZUWVaT2RMM0RlTFRzM1dmMDg5MzQ4?=
 =?utf-8?B?NnVpc0l3eDd4Z3prUnVIMjc5VytQT0lYUThQNjJGVXhaUXczQXF1TTJLYlZY?=
 =?utf-8?B?M3hlYmJ6VVNwK3UydVF1SVVYWkwvcUZNUUt0NisyWGxHb2RMbVFrek5FOEpr?=
 =?utf-8?B?WTB2OTkybXB2ZDNpaHJwdm1Qd1JBY3VzY00xdE1qUjJIMW1qaUtFS01iazFs?=
 =?utf-8?B?WTNzV1BMUHJMM3ovQ2hjWVVEN3hGRmh4MWVhZGd5T2ZWR3BMMENXVjJ4Z2xT?=
 =?utf-8?B?QnVnODl1d2dRRHZJbW5nZUFIQk5iSFhmZFhiQysxN09mQUZmQVRhOGRYalIw?=
 =?utf-8?B?YjIyMlNHNTI2SFFJT2xyUkN1SUFmNnh6dmR4RW1aRzNsWGxGeTdRa3N6bWFW?=
 =?utf-8?B?YTJhY2phRkhtcXM3bnVjWDhrUFpkY3RLSzJYS052TzBvV3FCUWhSZFFDV3VD?=
 =?utf-8?B?V3RyVmZFUVFpTHFQL3A4WXdIaXZpWHNvQW4wZnZwL2tWdGMvanpTckJlRVls?=
 =?utf-8?B?bnd3ZU5wL3RZTkxGYUVScEhhVjBHRVB2N3pqZ1M3VzlLa3I0VjVLbDJILzZq?=
 =?utf-8?B?ZFhlV3RiMEd1bU5YM1haNmVYanNFSmtuQmJjcnJyQmVySU5WT1E2TFlTeGtN?=
 =?utf-8?B?aU5vTXNRZWU5RW5oaGNuZUZnN2EwS2NpbXJCZkJwVWp1ZUFVR1NhMDBYSjQy?=
 =?utf-8?B?N243aEF0cHIrYjBaWXFuQW15SHByNlc0UVV6UHNxeVlPK0RBV3B4UkljbU5R?=
 =?utf-8?B?MlR6SFdFZlhQLzF2bWtCb201TlZIOTNtdHlYQ1hWTldXWkdXTjlxbzVIVFkr?=
 =?utf-8?B?UkZ4eVhVOTJnZ2FMT0NpQmRJTGdMKzU0UjlkckJMVXlMNGdEMDhvU3laeEtS?=
 =?utf-8?B?bUpUeURLRkM0Sm9rRmU5dG4zUG53SXNkbTRrSmpsYThnVE1pMUo3cGN2M1RE?=
 =?utf-8?B?Q3hIeWpVQnBJZHdnYmU3M1dLTE8zVGk1UnUyWFUrVWxoNUk1NWk1V08vcE5D?=
 =?utf-8?B?eTBEUStBdzdHdnE4ZFlBT1lubUgyOEZCNnROTEIvbnVVTFlPSDUzNHhPdTU2?=
 =?utf-8?B?UHEwTzZrOXJiT1c3bTREZ3RBSzd2Q3lZK1lQbHlPbEllNGwzQ2phZXYyUTBs?=
 =?utf-8?Q?OJfr959AYem0/txJLRM8T/IUW0Eh3TprdgueUf/zdvq4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcf49ec-2237-4335-b8a7-08db2011c0b9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 20:14:42.5799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xs368j1z5Zs285u7IWMwIuZXbvo0gqecIVDI7W45fBRHwN0Vyi5NxSPooy8EGoUo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 20:45 schrieb Asahi Lina:
> On 09/03/2023 04.12, Christian König wrote:
>> Am 08.03.23 um 20:05 schrieb Asahi Lina:
>>> [SNIP]
>>>> Well it's not the better way, it's the only way that works.
>>>>
>>>> I have to admit that my bet on your intentions was wrong, but even that
>>>> use case doesn't work correctly.
>>>>
>>>> See when your callback returns false it is perfectly possible that all
>>>> hw fences are signaled between returning that information and processing it.
>>>>
>>>> The result would be that the scheduler goes to sleep and never wakes up
>>>> again.
>>> That can't happen, because it will just go into another iteration of the
>>> drm_sched main loop since there is an entity available still.
>>>
>>> Rather there is probably the opposite bug in this patch: the can_run_job
>>> logic should be moved into the wait_event_interruptible() condition
>>> check, otherwise I think it can end up busy-looping since the condition
>>> itself can be true even when the can_run_job check blocks it.
>>>
>>> But there is no risk of it going to sleep and never waking up because
>>> job completions will wake up the waitqueue by definition, and that
>>> happens after the driver-side queues are popped. If this problem could
>>> happen, then the existing hw_submission_limit logic would be broken in
>>> the same way. It is logically equivalent in how it works.
>>>
>>> Basically, if properly done in wait_event_interruptible, it is exactly
>>> the logic of that macro that prevents this race condition and makes
>>> everything work at all. Without it, drm_sched would be completely broken.
>>>
>>>> As I said we exercised those ideas before and yes this approach here
>>>> came up before as well and no it doesn't work.
>>> It can never deadlock with this patch as it stands (though it could busy
>>> loop), and if properly moved into the wait_event_interruptible(), it
>>> would also never busy loop and work entirely as intended. The actual API
>>> change is sound.
>>>
>>> I don't know why you're trying so hard to convince everyone that this
>>> approach is fundamentally broken... It might be a bad idea for other
>>> reasons, it might encourage incorrect usage, it might not be the best
>>> option, there are plenty of arguments you can make... but you just keep
>>> trying to make an argument that it just can't work at all for some
>>> reason. Why? I already said I'm happy dropping it in favor of the fences...
>> Well because it is broken.
>>
>> When you move the check into the wait_event_interruptible condition then
>> who is going to call wait_event_interruptible when the condition changes?
> I think you mean wake_up_interruptible(). That would be
> drm_sched_job_done(), on the fence callback when a job completes, which
> as I keep saying is the same logic used for
> hw_rq_count/hw_submission_limit tracking.

As the documentation to wait_event says:

  * wake_up() has to be called after changing any variable that could
  * change the result of the wait condition.

So what you essentially try to do here is to skip that and say 
drm_sched_job_done() would call that anyway, but when you read any 
variable to determine that state then as far as I can see nothing is 
guarantying that order.

The only other possibility how you could use the callback correctly 
would be to call drm_fence_is_signaled() to query the state of your hw 
submission from the same fence which is then signaled. But then the 
question is once more why you don't give that fence directly to the 
scheduler?

> Please think about it for a second,

Yeah, I'm trying to really follow your intentions here. But that doesn't 
really makes sense.

Either you are trying to do something invalid or you are trying to 
circumvent the object model somehow and add a shortcut for the signaling 
API. Both would be more than fishy.

Regards,
Christian.

>   it's really not that complicated to
> see why it works:
>
> - Driver pops off completed commands <-- can_run_job condition satisfied
> - Driver signals fence
>   - drm_sched_job_done_cb()
>    - drm_sched_job_done()
>     - atomic_dec(&sched->hw_rq_count); <-- hw_submission_limit satisfied
>     - ...
>     - wake_up_interruptible(&sched->wake_up_worker);
>        ^- happens after both conditions are potentially satisfied
>
> It really is completely equivalent to just making the hw_rq_count logic
> customizable by the driver. The actual flow is the same. As long as the
> driver guarantees it satisfies the can_run_job() condition before
> signaling the completion fence that triggered that change, it works fine.
>
>> As I said this idea came up before and was rejected multiple times.
> Maybe it was a different idea, or maybe it was rejected for other
> reasons, or maybe it was wrongly rejected for being broken when it isn't ^^
>
> ~~ Lina

