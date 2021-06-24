Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46A83B34EE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16506EC74;
	Thu, 24 Jun 2021 17:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C1B6EC72;
 Thu, 24 Jun 2021 17:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjaAEs9BodqVWr2HODQNJwYtpWs1LsHzuz6/riby5pzOZyTWUrVQO+rLN6BPN0EeuM9U4XzIZXHIYBTyowVQN5CVDgSUL25fS7dhd6hVOPrDGoNzn/ORhZd1hIhRZcqXsJXjA+WZ5aRLmKIh++FC1stWOeuGzhoju50WecGJDv1EGjE465po/1PdKORP35FFFSx/pX+/GMiob8SOFvN5kK+ScNeYqt8UC6WM9C1Wp9HOt5LoaO57AgyAO9j14+0zqPhXIx+0aKwrTddGa2e7SLVHX+6HqQOjee/SUGa/BbPAPMV43BYgwKJq0GoYVRDsp6E/kQ5SCZuddbODW3ES4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flpMewtE407Z5pHrEl+LTk8A4Z9muwsc5ImOJBJNFPM=;
 b=lxD/YHljLBffjkFs4uJBZfV6aLvChW4hSx6yqqQU4GdUflRk+o7JIg8tVnVLGMITpIdC/PE/kCn38RBfk6p9M117PriHHxPzJPvILJocBcvfPTVMSt83vuDxbOLe6uDv2yIuN2bRydBXY8b4xMGPKh2+kiAfe12covGl61Q9iXryfC0IuRb+cQ4Gwj6Qcvg658s6r+kvtLhrVP6eKewWW7n1Yd1V8MC6bXgClntG2wYvHjD6yv9hCaA5sYe64YF9gf/0gMGIwyEgLm94Dv9LEnRGZdesJd9h5kqyTlBvuRh1CNXaoIsz3RvrFQa8Qn6/tWjTi/Lukv90F5l+N+iz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flpMewtE407Z5pHrEl+LTk8A4Z9muwsc5ImOJBJNFPM=;
 b=abSi7UpAhN/IAqMnExlQ8iDAoM/L99OE4x/V8/U3f1UAHUeISm4zOdz/ya8N6ja3Ex+0TMoxQfBdBNvCI/asw3SeCYVP5z9DcDa44dlKnssSatV54vaO9q1x2Dl4RlS1hYdK/Bup/qBmqsbWvpj4QjSia8h4RKl8ZInh9tYwC7c=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 17:39:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 17:39:36 +0000
Subject: Re: [PATCH 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-2-daniel.vetter@ffwll.ch>
 <834f5d78-9052-8e7a-fd34-c5b4f37857cf@amd.com>
 <CAKMK7uEyiD7fD6DUD-4dJyXZEYaZiE3bdGyz6cLzsf7cjaRD4g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fdf12f4a-e719-0993-1b05-0de7b4a150a6@amd.com>
Date: Thu, 24 Jun 2021 19:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uEyiD7fD6DUD-4dJyXZEYaZiE3bdGyz6cLzsf7cjaRD4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c089:94ee:b4ef:e121]
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c089:94ee:b4ef:e121]
 (2a02:908:1252:fb60:c089:94ee:b4ef:e121) by
 FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.10 via Frontend Transport; Thu, 24 Jun 2021 17:39:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05877df3-86af-4d15-01fc-08d937370907
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2419233EED49498F98C054B383079@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NB1Si4lvQDZWX7L9MMeb9n+ZRU07LOUhpcIwI+f9ule/R+c/UXKpLImo+SLY6HqCUDCaeh+MY4BIXgpCBaCre5rOnbsF3pzfq7aqSA4/pW7+Fq0+M2z2Y0Tq+MF1UoSMe327jq55NT1PSIuv3Tr7qdRY48LS1oQ9u4DCwcNUtUqUYn7n+gtqBK1Uf9ciW8U+jxN58XcGu8oIDMdcmT0ftToMHMlWKpnu4xYYeJNou2hZkAZaTy/YH+VJpLEt4Tq5STu0W94UD31Ejm0f5JOUQcu0dx2PFaVxuNwc9HERy1dwitsd10FBzN71PDV6lJ7XAZlNbzsefMCcEuuGo6SeRZ5ZeF0r2O6T/aQ7amipBGcQJkWRvi34Uit1iRlJQaS8yTVBQ2d3oV3tQDiPKEJFTqB4UEISqcb1QXNborHGN7Fe5Ae4C5Y350SCmJsq/cb+jQLp/MYnBJqc85aF6gP4Y9hu0mLQ3nWTzYlqzGuvFo7yD+8Lnz5krUgnQsaGH6v/0ug3Sk7B6bSbum8A6YUvruPRKW06vxz5I7UduW8Jv78iQWq2FrFlNazmjp60GVaHh2tk0BgBUOQGpl/MutOsgzGKFR9y7ipYN0HF0vO42TRNVlZS4dcLCB+piK+HxsT5hAzqF4zDjALQP8m+kMJZKtJZHJ1zF3Po/JcCtocum0GAi8OM5GBm2cRyT3xQZb78
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(66574015)(83380400001)(5660300002)(6666004)(31686004)(66946007)(66476007)(66556008)(478600001)(38100700002)(4326008)(8676002)(2906002)(2616005)(16526019)(31696002)(86362001)(186003)(6916009)(7416002)(7406005)(316002)(54906003)(30864003)(53546011)(6486002)(36756003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REo4N2labUpJYms0a2VHVVc0YUhveGVzVFdCdlVKdjBsOUJPbFcybW8vbHJ5?=
 =?utf-8?B?ODRVdnpKVnJVd0EwRkUrRG5uS2ZOZFRYY2pPa0FiOHFWcTBHUHM5b1lXanBo?=
 =?utf-8?B?V05PN3Z4ZjFLMnJlUW5sVUpFZzY3SUxVaS9TdGlhUHNNQXhWZHJwL2JnUlBt?=
 =?utf-8?B?Q2NJZHhKRmkzZkMvb2J5QzlNK3BMTnNTUEFHNXFnNEM4UWRudmlpYUI4ek9a?=
 =?utf-8?B?QUpTUVJ5bTh0ZEZQUVFFM1JiS0ZWdjNwNDNnN3gvWGxpb3VucFNaQkNxOEhm?=
 =?utf-8?B?WU9ZOW9LTWFkdnU2LytLNExzbGErRFoxam9RUE5yK1BybjBHMGdaZ2NhQS9a?=
 =?utf-8?B?MXA5dnUzaWdCeVF0dWNnd0tOZm4yOG9jOWo2dEltSXh1WFh3QVE0dVlrUmto?=
 =?utf-8?B?RkJ5MzZ1VGhPRmc5VituRmJDbmYvRWU5VWg3Mm5qVVNNSEMxcnErTXFlMURN?=
 =?utf-8?B?T2Z1Vmh0NEZ2eEJzNW1sb0hxWlBoVVlsMXB5a3VGVXFSYXFQRlpIRm1yNWl6?=
 =?utf-8?B?aWI4UjQ1MXFqekhtekdhVml5WHFwN0tlMWFlNWY3VjRKb0pUUnRRSlVMYVpa?=
 =?utf-8?B?WlVJbmZDeWJ0T29XQjUreFZxN0pEbXBjVjhCZHFEOUlKNFdCRE1ISDlkaWhu?=
 =?utf-8?B?MDFUY1ZTVGk3bXNCWkxOZnRRdnR0LzBXOXlVSnkvK05pcSswLytVb0Q2dTdj?=
 =?utf-8?B?ZU95VnZaWm5paVJtMTFuQytZbDVoVlp2UFA4T3RCcHE0Mk9qZUZ1a3ZqbTdF?=
 =?utf-8?B?MGYya0E1d3ZWWDNUKzVaRFc1WndaeWF1Mk54OE5NZjU4cGxxNkdqWFpjWUky?=
 =?utf-8?B?cjJiY1IycC9vdGdlNGhaR3FpNnRwV0V6cDBzZHZkbzRWNmd3S1pBSUdrOERl?=
 =?utf-8?B?UkphaTV5TEdzWlVmM2hkZFIvK0ZUYWgwS254S3JoRTcvbEdza20wd0Z4YkFT?=
 =?utf-8?B?V3hma0pGcGdyRG4xa2QwRmwvRnQ1d1BDQlg5cytOelFWVUpyeWFXZ203Z3hO?=
 =?utf-8?B?WTBmWTJydjdJRDNtUHBNMndwOVhNZjJFMURlc2M2eDczd0Z1aTB6T3ZyUlhD?=
 =?utf-8?B?SlUvWnI5dU1zSUxKeUtlOWpqUnFkMks0Uk85eTFzZXhSRXFBNGZ1S0ZjQ1h4?=
 =?utf-8?B?YXlPeVA1dlBoQ1p6YS9tRmdSamc1Wk5vVnVIQkFMZVRNb2Q1aU1EN0pDemFu?=
 =?utf-8?B?elBwODhCYVNHK0xnbUtYai9LMWJzZnhWWWM0bllBbFFVWWVwNGtDTXd4eWI5?=
 =?utf-8?B?ZzkxVlVJdkUzTG14Vnd1OG1sTDJxbS9xajZjNzNJVXNSMGxWUmV4c0xxd21t?=
 =?utf-8?B?QnRkQXluY1VkNDRFQTMyaHFyR3ZIOG45R29majZCNzV0Vmlha3l1SkYyenUx?=
 =?utf-8?B?bFR1ZWZPWTRmZVBYR3NQUDA0Y2ZCTUJ0Y2NPNUNPbXFHMGVZNXZoTW9Uc2l3?=
 =?utf-8?B?R28raXJteTEwVmd3ZzIxeTlZVG5OdHh1UFRBL1RwQS9QdG9SbnppZ1ZwMjU0?=
 =?utf-8?B?OHEwSzBxTWtjREVkbWRtMVNSdnZxQ2cwbGRIaWlOUlA5Q3EzTnlGejN4K1RC?=
 =?utf-8?B?T2Q3TXo2bDFmdEpSSWo5SlMwNlJwcElLZWNMNllVWml5akdscFl4QWJxYkEx?=
 =?utf-8?B?N0dsU3B0T3U5UHJaYzF6bmJLT0pwcG9jaGxZMVoxUXQzakJVNFM3OFpINzdY?=
 =?utf-8?B?eFZ1ZVpJeHNmVnpkZkJjaEZ6ZGhyTzVrOVF4MXZYb2lIUXBxMU1pc0xaeUVH?=
 =?utf-8?B?aWVDVjI1QmoyUk9TeVU3Z3pjd1ZsaWhibklhMVc3ZmtWZnczSkF1aCtnRmxh?=
 =?utf-8?B?d3U1dERLNHcxUkJUZTNIT0FYTFJyWWxtRW9qUWdnZVNLcVp5L2lHVzUySWNv?=
 =?utf-8?Q?l/k0h3RNUuEiQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05877df3-86af-4d15-01fc-08d937370907
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 17:39:36.7287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVpx7Oy5q96I5uKdO+pdilNPIApRNOGWVNNUD1YAwNP9veLZiiJBbjkKvoNgme8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 24.06.21 um 19:37 schrieb Daniel Vetter:
> On Thu, Jun 24, 2021 at 7:30 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
>>> This is a very confusingly named function, because not just does it
>>> init an object, it arms it and provides a point of no return for
>>> pushing a job into the scheduler. It would be nice if that's a bit
>>> clearer in the interface.
>> We originally had that in the push_job interface, but moved that to init
>> for some reason I don't remember.
>>
>>> But the real reason is that I want to push the dependency tracking
>>> helpers into the scheduler code, and that means drm_sched_job_init
>>> must be called a lot earlier, without arming the job.
>> I'm really questioning myself if I like that naming.
>>
>> What about using drm_sched_job_add_dependency instead?
> You're suggesting a
> s/drm_sched_job_init/drm_sched_job_add_dependency/, or just replied to
> the wrong patch?

Replied to the wrong patch accidentally. I was talking about the "await" 
terminology.

Christian.

> -Daniel
>
>> Christian.
>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>> Cc: Qiang Yu <yuq825@gmail.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Kees Cook <keescook@chromium.org>
>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>> Cc: Nick Terrell <terrelln@fb.com>
>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>> Cc: Lee Jones <lee.jones@linaro.org>
>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>> Cc: Chen Li <chenli@uniontech.com>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>> Cc: etnaviv@lists.freedesktop.org
>>> Cc: lima@lists.freedesktop.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> ---
>>>    .gitignore                               |  1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>>>    drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>>>    drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>>>    drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
>>>    drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
>>>    drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
>>>    include/drm/gpu_scheduler.h              |  6 +++++-
>>>    10 files changed, 51 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/.gitignore b/.gitignore
>>> index 7afd412dadd2..52433a930299 100644
>>> --- a/.gitignore
>>> +++ b/.gitignore
>>> @@ -66,6 +66,7 @@ modules.order
>>>    /modules.builtin
>>>    /modules.builtin.modinfo
>>>    /modules.nsdeps
>>> +*.builtin
>>>
>>>    #
>>>    # RPM spec file (make rpm-pkg)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index c5386d13eb4a..a4ec092af9a7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>        if (r)
>>>                goto error_unlock;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        /* No memory allocation is allowed while holding the notifier lock.
>>>         * The lock is held until amdgpu_cs_submit is finished and fence is
>>>         * added to BOs.
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index d33e6d97cc89..5ddb955d2315 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>        if (r)
>>>                return r;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        *f = dma_fence_get(&job->base.s_fence->finished);
>>>        amdgpu_job_free_resources(job);
>>>        drm_sched_entity_push_job(&job->base, entity);
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> index 19826e504efc..af1671f01c7f 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>        if (ret)
>>>                goto out_unlock;
>>>
>>> +     drm_sched_job_arm(&submit->sched_job);
>>> +
>>>        submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>        submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>                                                submit->out_fence, 0,
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>> index ecf3267334ff..bd1af1fd8c0f 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>                return err;
>>>        }
>>>
>>> +     drm_sched_job_arm(&task->base);
>>> +
>>>        task->num_bos = num_bos;
>>>        task->vm = lima_vm_get(vm);
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index beb62c8fc851..1e950534b9b0 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>                goto unlock;
>>>        }
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>
>>>        ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 79554aa4dbb1..f7347c284886 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>     * @sched_job: job to submit
>>>     * @entity: scheduler entity
>>>     *
>>> - * Note: To guarantee that the order of insertion to queue matches
>>> - * the job's fence sequence number this function should be
>>> - * called with drm_sched_job_init under common lock.
>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>> + * under common lock.
>>>     *
>>>     * Returns 0 for success, negative error code otherwise.
>>>     */
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 69de2c76731f..0ba810c198bd 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>    }
>>>    EXPORT_SYMBOL(to_drm_sched_fence);
>>>
>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>> -                                            void *owner)
>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>> +                                           void *owner)
>>>    {
>>>        struct drm_sched_fence *fence = NULL;
>>> -     unsigned seq;
>>>
>>>        fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>        if (fence == NULL)
>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>        fence->sched = entity->rq->sched;
>>>        spin_lock_init(&fence->lock);
>>>
>>> +     return fence;
>>> +}
>>> +
>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>> +                       struct drm_sched_entity *entity)
>>> +{
>>> +     unsigned seq;
>>> +
>>>        seq = atomic_inc_return(&entity->fence_seq);
>>>        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>                       &fence->lock, entity->fence_context, seq);
>>>        dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>                       &fence->lock, entity->fence_context + 1, seq);
>>> -
>>> -     return fence;
>>>    }
>>>
>>>    module_init(drm_sched_fence_slab_init);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 61420a9c1021..70eefed17e06 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -48,9 +48,11 @@
>>>    #include <linux/wait.h>
>>>    #include <linux/sched.h>
>>>    #include <linux/completion.h>
>>> +#include <linux/dma-resv.h>
>>>    #include <uapi/linux/sched/types.h>
>>>
>>>    #include <drm/drm_print.h>
>>> +#include <drm/drm_gem.h>
>>>    #include <drm/gpu_scheduler.h>
>>>    #include <drm/spsc_queue.h>
>>>
>>> @@ -594,7 +596,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>        job->sched = sched;
>>>        job->entity = entity;
>>>        job->s_priority = entity->rq - sched->sched_rq;
>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>        if (!job->s_fence)
>>>                return -ENOMEM;
>>>        job->id = atomic64_inc_return(&sched->job_id_count);
>>> @@ -605,6 +607,25 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_job_init);
>>>
>>> +/**
>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>> + * @job: scheduler job to arm
>>> + *
>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>> + * or other places that need to track the completion of this job.
>>> + *
>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>> + * considerations.
>>> + *
>>> + * This can only be called if drm_sched_job_init() succeeded.
>>> + */
>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>> +{
>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>> +
>>>    /**
>>>     * drm_sched_job_cleanup - clean up scheduler job resources
>>>     *
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index d18af49fd009..80438d126c9d 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>>                       struct drm_sched_entity *entity,
>>>                       void *owner);
>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>    void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>                                    struct drm_gpu_scheduler **sched_list,
>>>                                       unsigned int num_sched_list);
>>> @@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>                                   enum drm_sched_priority priority);
>>>    bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>
>>> -struct drm_sched_fence *drm_sched_fence_create(
>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>        struct drm_sched_entity *s_entity, void *owner);
>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>> +                       struct drm_sched_entity *entity);
>>> +
>>>    void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>    void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>
>

