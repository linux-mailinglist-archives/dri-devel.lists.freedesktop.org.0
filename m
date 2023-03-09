Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5EB6B2357
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689F510E7F6;
	Thu,  9 Mar 2023 11:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EDF10E7F6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwyGFogiK9N+6eZEuTf73WQqDr2kl88jhCaDaA3Y3PIHwJ02kaWJuF8P3u5J34vemtdpRUC0UllJ/wLZPOW69/Z31jfO3HXPYx63Mag+efgKW+5rqZnimNQJ7UFoJLljKLmPdV5rGrotAkWfHzPxeBq0aAdcnfjX4WATWIk9DkpWCPznAYmIbpAHHWdp+Jsk6rb99wvlK73IIUn55TfCFNlSUzx9ESOD5niKO4to9+K5ERQoEx2FIAzNRZ1C6SX8qoPV0av9gSvpjJtNCJw7K+S6FbQ0rRdWx4zf4tMZtwC7QOl1vo+hReIablsYalpQXSzyP7U4fyOHUci6rs6P+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdxxSAyVU2b3WI4qnBshytnimpw+RuQW5bgXU3Lsmkc=;
 b=jlXoz6IEojV/kpJa79ZBZqQzSUrtz80snKFhrUjSXerGKYszLhNz43g1QYaHNVIXR9a0anLKoQycB6DxSvkaty9UHD5FDEemlrzj/QP1XKqBnMwJqTgqnZ+6CjC6KEOJBXVAITu1My256TYdZ2UgabqQYSAx+cjaLd9cPvOibFZeIKTRUlbVniIHFjz8xGyiFtjjCvzEgg0XrYMVLdmMeJnHzJft96PaA6QPOx6HkKUdbslNlpeCgVl/y/fAQjBmelhAmM7EksRt6GDLYyYVYleRtndRvLHmxRU8W3pJTYTsoSXwtVZk4CClfA0SGeibRImk+rviTjglOnPQMl0ZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdxxSAyVU2b3WI4qnBshytnimpw+RuQW5bgXU3Lsmkc=;
 b=BezeW+CwggO9lEd7XRf88myjiXX1ztUduDpKb/vN/qX/1R8cWKzAFDnMGS2EDRxX5lxXpPQ4pocKFK5vjswmugShoGq9ZDrYotyw/2OPZ2Nr5eXXf3mdfCl3cHHzJg7iVN+gJeDPRxcTzOFvNFfYcpn1K3bpDNGgy6kA6pvLlrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 11:47:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 11:47:24 +0000
Message-ID: <ac92cea6-89e7-6147-a8fb-8b76e89cdcb6@amd.com>
Date: Thu, 9 Mar 2023 12:47:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
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
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
 <8696d00a-c642-b080-c19a-b0e619e4b585@asahilina.net>
 <5f0814a3-4be3-a609-d3b3-dd51a4f459a1@amd.com>
 <9403e89d-a78f-8abd-2869-20da23d89475@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9403e89d-a78f-8abd-2869-20da23d89475@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: ad930473-e956-4f30-7f2b-08db20940cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xma5xYXE3UyRjjdvNEg7lXwvdaqkdzbekPsxdiw6iJ/1AXPllpfxn/slitbo24rdyuUFG21vfsAL1aZ+hpfzGrGfDblKSaAHMUCI7bQyHHkqFbRMzNxKs6K1Zh+75n3Lcz8lciFS+RQ1+Qqgpi7xCCfRkxXgxTnJk44GLvctOxj94I2mBjB1cvPPn3/LZ1XAepuFyGD/iatc/PRL7g2D81iAObSf4B0iLNVdPPFyGK9ODx/ATdqL3DJCErWrR+Ym6D6a6023mUDi9ZBkaX4il056aCix39orF+ZAez6yHG+RSPPt1TwwWxcE40gJdZUHcM2U660DQmewDFsZg+euOHK8GEHk1S1rHHHxkTUIx/cGEyKzkSVQO0lKeN79yXcSp7iWxdLSJo+CKxAhupTbk1zqQDYlQ3mV7y26e6rqv4ZsatJNpTrVX4Y2osVRCVUi9yHtmg3G45Y7F91MGYNKrDbVe1wxLqGJ3/my0WNC6EyrumPwnXVAfU0MfWxGpfjFy6CyTQuXs5IZhIyshCaUuJ2mCyKySqnKn3F1RKjS6TALDQbEILNbGWy7Ad5jUOgNqTJPHve/trMS4VJob5v2xLPDF9zg6N4G5FBLcHCvfxV6DzNV4i5X96RfUTkavZhfmeBYNA47CaDjTgtH8K/fqvEN957zZMVYWIHiKrqmiWCpzbUXbCOvfoNIYSl1SrQtB5WDukkGgqABzz0B0UngK1qltmiWuHFO2zPwSmGQpqqfaDbokhPGz1YiTxjZuC6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199018)(186003)(6486002)(36756003)(478600001)(31696002)(54906003)(921005)(86362001)(316002)(38100700002)(110136005)(31686004)(66574015)(6512007)(6506007)(83380400001)(6666004)(2616005)(26005)(41300700001)(5660300002)(7416002)(8936002)(66476007)(66946007)(2906002)(8676002)(66556008)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21oY20vVlFxNnBBT0tKaGpjYUtsVkdwUTdOa0p0QXpBTEFJZVpzOXhDd0Qx?=
 =?utf-8?B?Ym1LcUdhekZ2b1VwNFppTm1HTjlUWlZIUmFZZDBFNytZZndVTFI5VVA5Sm96?=
 =?utf-8?B?cEFJRVBBY0NNYUptMHA2cFE5T2VNbEsrcVg4OHBEK1FEUTNDR240djBRZmd1?=
 =?utf-8?B?eVAvTTRvZzM0MmUvMmFGemtKa3BaNWF4UnF5L3pNU3I2UHhrQktXNjJYVDRl?=
 =?utf-8?B?M2o0VGpWNmhLOWozZ3lnd0twZUg1UkRhdFFOS1dGRFo2WXZBcmt5YXkxY3M1?=
 =?utf-8?B?SndGdEROOFZRK1FwbWNRWDhjMEtRWVNXOWdpT0pWbU5jN0JScmttSGxkbHpM?=
 =?utf-8?B?YzRBY2xTSis2ZWd4OUsrVS9ZKzhHN1N2eU5XejE5SnVPK3NVKzZFQk9Kcm9i?=
 =?utf-8?B?VlljNnloTUtWUzhpSjZXY3VXMkNWaEZDYU9iKzAvYzJQL3hENDdjRFo4RWhB?=
 =?utf-8?B?aXZLNE1vdkVoRnJLTCs1V0F2MkJ2VjEyNjdpc0JHZVhGa29Kbmp0WWNNQkVw?=
 =?utf-8?B?M00wbithL0taczJGWWxuNzE2bklaYjVXSktGZUFmdzlEVTlvOVhvN1A3MG92?=
 =?utf-8?B?eE9uQjZMWG1DT1gvUFJ6MmlmOUZGZjIwMkxmWkZWOTJLMWtSZXhMMXk2cExD?=
 =?utf-8?B?aEgrVUMwTWNOWjRVSlc5Zmc2dDRDYVd4d3RCWnRKRHo4SHZYUVBFb1Y3TDNp?=
 =?utf-8?B?NzN4RnhIMjBYVFNsNGswamVFWTJLVXZhUHRjMGRXYjVFYWhRT2x1d3lHQy9I?=
 =?utf-8?B?Vlo1YVV1b1gzb2ZwV0RJVGxkSjIrWDBoQTVWSU1pc1FSNlN4bVRtdDVnaVRp?=
 =?utf-8?B?YTQ1K2Z3UXJPeXFrNVdvak9WdHd4K3lSczZheGJidGdNci9FS0J1Z1dNd3ZY?=
 =?utf-8?B?Q1lZTjdWY0NkanZCRFR5eFpRY09CWncwdHQrSVZPTTJEaHp5WE83SUZUaVov?=
 =?utf-8?B?Y2tyN3NEWDFORGVyZzh1bnJMSVVFQVFWZGM1SktydkVIczRlN1kwQjBHZkdO?=
 =?utf-8?B?S05KZEtQampPUDlrM3dHL1ZsWDgyYVY5VDhLREt4aUM0eWdFT0EzWFBObHMr?=
 =?utf-8?B?ZTBHMGZ0ZjhVVThWZ3lYSnl3YjdCeEJBR1V3YXplRnRTaTVxNENZd3lIRGdI?=
 =?utf-8?B?d29VbVplMFVSeVpLUk1SM0V5aW1VMDdheFkxZFgxbjVXNzlnc2VqUkFETXJL?=
 =?utf-8?B?WEQ5MDE0Sy9yZU9PbUF4S2l4MWFhYk1SUlpHczNiMUtHcm1JaGNnVU5YK2Ni?=
 =?utf-8?B?K2ttUGIxQ3pkaG15RHZtWk56TitJVUw5b1JUWENBc2g1ZHJKUHpqbU85bEU4?=
 =?utf-8?B?T3ZLTGZqTzIyeWJjQW81d1F5Y1B2NktOWHlTZzBVaWdGMktwT29kN08ybm8r?=
 =?utf-8?B?eHpQc0dLWjN6WUdsMnFramtldk5xcW9OZ1NzTWxTaFIzSDhOUFlPK0pvcEtL?=
 =?utf-8?B?UUl0T3pEaDNZa3JrSWNhRkROa2s4a0ZCY3ZOai9TaldRYTJSTDVuMk9BMFBY?=
 =?utf-8?B?T3Vrcy9YYzFxTERqdURKVFZpUDdDTGFPUTNJVStpQkFsdVIxV01Zc3dHajcr?=
 =?utf-8?B?VzRxdHkwMnZOUUROWUxTUE9LUHdlemRwM0xKdGtFdlUwME5XaWVKQ1NsYUgw?=
 =?utf-8?B?cjJ6endiemp3MlBrTmpZdGwyQkUzbkJWMS9hZ09vVkNBWG9KdkNlZ2xqMEI4?=
 =?utf-8?B?VzY2TlVJWTA5VmJpSlFxMmdRZmdNTDlxZEdTQndicGNRS3M1eDdxclc1NC9P?=
 =?utf-8?B?VlJRNkY4VHlkNGJkZXVHWHFTVUM5eVVMcmQxVE1LanhwS0hSUVBPU3hsWEVi?=
 =?utf-8?B?ZzZXM1lZcTYvNWpOS3JiWmJEczlnYzNjOEVvZmNtcVBHZ2RrTEhYMFlxT2tE?=
 =?utf-8?B?KzBHSU1OaEFmTEZsamsvZEVnQmErNkZHRnlXb1Rqc0w0blNtdWttd29DUFNa?=
 =?utf-8?B?bVU0MVRTVGpycDJ0S1ZCSlVZNXJnVjVVSi9aUVl6cXkxK211b0pGR2tvNDVQ?=
 =?utf-8?B?L254Y09aZElGamR1ZVF4clZKRHdVN0VxT1N2aWhtc2tZdURvOXV5aWdPSnJz?=
 =?utf-8?B?elpJNXdBQ29FWHhFVGxPMkpJNzJmcFJPOGRPMTJMaDI0Wm1RYm5IR2d1ZVFG?=
 =?utf-8?Q?RWTBwbXhuBg8Va02Rnnquqf2W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad930473-e956-4f30-7f2b-08db20940cd2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 11:47:24.8083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMQMliF2n7Z/ES13kO8VdmWP8lIw9xY/+v5sJlRhFx7eOLnIIP01hFL2vlue6wC0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
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

Am 09.03.23 um 10:43 schrieb Asahi Lina:
> On 09/03/2023 17.42, Christian König wrote:
>> Am 08.03.23 um 20:37 schrieb Asahi Lina:
>>> On 09/03/2023 03.12, Christian König wrote:
>>>> Am 08.03.23 um 18:32 schrieb Asahi Lina:
>>>>> [SNIP]
>>>>> Yes but... none of this cleans up jobs that are already submitted by the
>>>>> scheduler and in its pending list, with registered completion callbacks,
>>>>> which were already popped off of the entities.
>>>>>
>>>>> *That* is the problem this patch fixes!
>>>> Ah! Yes that makes more sense now.
>>>>
>>>>>> We could add a warning when users of this API doesn't do this
>>>>>> correctly, but cleaning up incorrect API use is clearly something we
>>>>>> don't want here.
>>>>> It is the job of the Rust abstractions to make incorrect API use that
>>>>> leads to memory unsafety impossible. So even if you don't want that in
>>>>> C, it's my job to do that for Rust... and right now, I just can't
>>>>> because drm_sched doesn't provide an API that can be safely wrapped
>>>>> without weird bits of babysitting functionality on top (like tracking
>>>>> jobs outside or awkwardly making jobs hold a reference to the scheduler
>>>>> and defer dropping it to another thread).
>>>> Yeah, that was discussed before but rejected.
>>>>
>>>> The argument was that upper layer needs to wait for the hw to become
>>>> idle before the scheduler can be destroyed anyway.
>>> Unfortunately, that's not a requirement you can encode in the Rust type
>>> system easily as far as I know, and Rust safety rules mean we need to
>>> make it safe even if the upper layer doesn't do this... (or else we have
>>> to mark the entire drm_sched abstraction unsafe, but that would be a pity).
>> Yeah, that should really not be something we should do.
>>
>> But you could make the scheduler depend on your fw context object, don't
>> you?
> Yes, and that would fix the problem for this driver, but it wouldn't
> make the abstraction safe. The thing is we have to make it *impossible*
> to misuse drm_sched in such a way that it crashes, at the Rust
> abstraction level. If we start depending on the driver following rules
> like that, that means the drm_sched abstraction has to be marked unsafe.
>
>> Detaching the scheduler from the underlying hw fences is certainly
>> possible, but we removed that functionality because some people people
>> tried to force push some Windows recovery module into Linux. We are in
>> the process of reverting that and cleaning things up once more, but that
>> will take a while.
> Okay, but I don't see why that should block the Rust abstractions...

Because even with removing the fence callback this is inherently unsafe.

You not only need to remove the callback, but also make sure that no 
parallel timeout handling is running.

This might not matter for you driver at the moment, but it's certainly 
something you need to keep in mind when you really want save handling.

Apart from that I don't have much objections to this here as long as 
Maartens comments are addressed as well.

Regards,
Christian.

> I
> don't even need a new API to do that, all I need is to know that
> drm_sched_fini() will do it so it won't crash when the hw fences
> complete later, as this patch does.
>
>> Instead of detaching you could also block for the hw to become idle, but
>> if you do that synchronous on process termination you run into trouble
>> as well.
> Yes, but again this something that can only be done at the driver level
> so it doesn't solve the safe abstraction problem...
>
>>> The firmware queue is itself reference counted and any firmware queue
>>> that has acquired an event notification resource (that is, which is busy
>>> with running or upcoming jobs) hands off a reference to itself into the
>>> event subsystem, so it can get notified of job completions by the
>>> firmware. Then once it becomes idle it unregisters itself, and at that
>>> point if it has no owning userspace queue, that would be the last
>>> reference and it gets dropped. So we don't tear down firmware queues
>>> until they are idle.
>> And could those fw queue not reference the scheduler?
> Yes but again, that rule can't be encoded in the abstraction... so that
> makes it unsafe. The goal is to have a safe abstraction, which means
> that all the rules that you need to follow to avoid memory safety issues
> are checked by the Rust compiler.
>
>>> I actually don't know of any way to actively abort jobs on the firmware,
>>> so this is pretty much the only option I have. I've even seen
>>> long-running compute jobs on macOS run to completion even if you kill
>>> the submitting process, so there might be no way to do this at all.
>>> Though in practice since we unmap everything from the VM anyway when the
>>> userspace stuff gets torn down, almost any normal GPU work is going to
>>> immediately fault at that point (macOS doesn't do this because macOS
>>> effectively does implicit sync with BO tracking at the kernel level...).
>> Oh, that is an interesting information. How does macOS do explicit sync
>> then or isn't that supported at all?
> They have the equivalent of sync objects at the UAPI level, but they
> also have the implicit stuff and their UAPI seems to always pass a BO
> list to the kernel as far as we could tell, even though it still works
> without it. I think it's a weird hybrid of explicit+implicit sync. From
> the Metal docs:
>
>> By default, Metal tracks the write hazards and synchronizes the resources
>> (see Resource Fundamentals) you create from an MTLDevice and directly bind
>> to a pipeline. However, Metal doesn’t, by default, track resources you
>> allocate from an MTLHeap (see Memory Heaps).
> So it's both, and you can override it...
>
> At the firmware level, I've never seen Metal use queue barriers yet like
> I do (other than the vertex->fragment ones), so either they always do
> CPU round trips for cross-subqueue sync (render<->compute) or we just
> haven't figured out the magic combination to get it to do that yet.
> Honestly, I suspect they just always do it on the CPU. macOS is pretty
> ugly behind the scenes and it's pretty obvious a lot of their own driver
> was rushed (the firmware seems to support quite a few features the
> driver doesn't... maybe it even has a job abort mechanism, we just
> haven't found it yet).
>
> Of course, our goal is to do things better than macOS (and we already do
> some things better!) but getting confident enough about firmware/HW
> details to diverge from what macOS does is tricky and a slow process...
>
>>> By the way, I don't really use the hardware recovery stuff right now.
>>> I'm not even sure if there is a sensible way I could use it, since as I
>>> said we can't exactly abort jobs. I know there are ways to lock up the
>>> firmware/GPU, but so far those have all been things the kernel driver
>>> can prevent, and I'm not even sure if there is any way to recover from
>>> that anyway. The firmware itself has its own timeouts and recovery for
>>> "normal" problems. From the point of view of the driver and everything
>>> above it, in-flight commands during a GPU fault or timeout are just
>>> marked complete by the firmware, after a firmware recovery cycle where
>>> the driver gets notified of the problem (that's when we mark the
>>> commands failed so we can propagate the error).
>> Yeah, that's exactly what we are telling our fw people for years that we
>> need this as well.
> Yeah, the ugly bit is that the firmware does a full GPU recovery even on
> simple page faults (which could be handled more gracefully) so even
> stuff like that can possibly break concurrent GPU work.
>
> On the other hand, macOS configures things so page faults are ignored
> and silently return all-00 on reads for shader accesses, which is how
> they implement sparse buffers/textures... and we'll probably have to do
> that to improve reliability against app faults if nothing else. But
> right now the driver enables explicit page faults for everything so we
> can debug Mesa (it's a kernel module param, GPU global and I haven't
> found a way to change it after initial load unfortunately, but it might
> be possible).
>
> I think there's also a way to do actual page fault handling (like swap
> in pages and resume the GPU), but that's one of those firmware features
> Apple's driver just never uses as far as I can tell. There's so much
> unexplored territory...
>
>>> There is no re-submission or anything, userspace just gets told of the problem but
>>> the queue survives.
>>> In the future it might be possible to re-submit innocent commands
>> Long story short: Don't do this! This is what the Windows drivers have
>> been doing and it creates tons of problems.
>>
>> Just signal the problem back to userspace and let the user space driver
>> decide what to do.
>>
>> The background is that most graphics applications (games etc..) then
>> rather start on the next frame instead of submitting the current one
>> again while compute applications make sure that the abort and tell the
>> user that the calculations might be corrupted and need to be redone.
> Then we're good with what we're currently doing, since we already notify
> userspace like that!
>
> Actually I wanted to ask about error notifications. Right now we have an
> out-of-band mechanism to provide detailed fault info to userspace which
> works fine, but in principle it's optional. However, I also mark the hw
>   fences as errored when a fault happens (with an errno that describes
> the overall situation), but that never makes it into the drm_sched job
> complete fence. I looked at the drm_sched code and I didn't see any
> error propagation. Is that supposed to work, or am I supposed to
> directly mark the drm_sched side fence as complete, or did I
> misunderstand all this? I get the feeling maybe existing drivers just
> rely on the recovery/timeout/etc paths to mark jobs as errored (since
> those do it explicitly) and never need error forwarding from the hw fence?
>
> ~~ Lina

