Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6916E6B10BB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 19:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E76410E6D5;
	Wed,  8 Mar 2023 18:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C4510E6D5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 18:12:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bq8FuZo4qoc19PJ9vj4K3Og+4u0oab0kUFI02LQh7AxINnJjD4ldwYgWUEMNUeojriSutCvFjFswbGyNTyNEuFptsHK/wZAGSJ/vhzuIP1AzL/L9kJbnaAztp56q31LGeg5sg4DXEnc0LjdRw4CtU4f/5Uy4SPrZ5mm7+Dx+dV5P678ZPVlHc/85dw0/WjhC0rHocOG5mCgBr0hw/z+QYQO9zFzoSRmJFI8IHrrhB6TEQEv6J0Czv6ljXQXN7z8aYFdXEX88ec2/cfK+MBKZ3eai+OOGZAlVPAtJ6R0/CVcwfA6E8CS1dFYiMBypzMi6W7oZxC5ERx4MPrQ0zf85wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqjJQ7LG7Y1wtHz5kKh6yITz2E3fdXLUKI4tl63gbXs=;
 b=GEijw0fmPWvnGN9OeyfvcDP13dAOnYFf31lYMrf/MbQAMClQ+Jdt+zqtuGDeZzDCR15QQPGqYcWu2flJe/OSKoLxZNdaNpoPP8Lj/9OPobMvjef/4TKrxp38Jf9IXGOspBEi4MUo4x+fE+YCmMcybBpbsjq882pLSF5343v5vkVUwm4L7292xNa3iTdMKfsT8f5ANzpsiZ6uZlN3XHZsihJ5Q0GKmNS1cKJxrdVhwIH4u/KAKfb9Bao9XfJz6MoIGK6QY2PkUEVA9njXf8J5cO8O9g0SygWF4enJgGeWcPMXTiJkVH2ABFAp/LdmKnlQR3I0EVQxYPbSRCnn+jkVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqjJQ7LG7Y1wtHz5kKh6yITz2E3fdXLUKI4tl63gbXs=;
 b=oQUoWMGJQlrt4XGMDMVYOBhHRXvEFSUk35nTy6Zt9hu+Kd+LbClRqTFxsXhiiD65//XgVgUlXB4AciRNF7I1Lc3Wq62jRO1uXYX2Bi4dI+UvM0I9OIHbJnhQryv8w2Lc/rQ+k6KWENO6hBrzJ90XSdhcVQEnJ29RYr9IaL/3CYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 18:12:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 18:12:08 +0000
Message-ID: <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
Date: Wed, 8 Mar 2023 19:12:00 +0100
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b57cfc6-bf04-44be-93e5-08db2000a123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lyiHdIcocy63gO8Ko/NqkmPDCh4XWqGz3EPoCehfb6Fceu1aM26AIvwsEJ1OoJ/sUwNBIcq4bF5alYB/L3FLtqOeVRNBIFvZxTAOzha85IE8Z4knoEWQigJOQmpKLlZy1+cNDjKy4ZPUnWJAXQu9+0PMjK3+xMwEj+mpenMjCvsKytI6FOglV6su2Hj0qbcawWwOAxnay8QEcpjAbvLgtyhwtuYc54ay6sv8XNUWRntjJvlQ4EctxSdnwg4ICOa8onP0CSGaOT8P+RiA9L7WPJNpvyZqvZIL5f/jT5+o3ueq1fw8JIti8mEoLxEG7o7eMN0bsEd9xAB8xCscGwsfaYuzOCW+dvVX45linAufD1sCfSDCgdrUvfJpynRcnQQwWJpeQAmGPSCVzghfSYxnn5AEeF6IflTVenDqVnSoN6e5H6ntUQ32LiFYNhUC2A03rHyp8jcu08f/Oixk6YUR71Vy7aaaXdMedDvAflwagwSBXCNlnZEyAynfwlVLfSvrs8bEcgtelPOBkRx/Or6LQPUlQ/5mJSzRvftuna7PRjLVQ/suLMvUPkAOuSr3srxQBr1d++tsdq5IkOU/YU9A3V8+YTRpsepFJGLzFD+zZxK0tUuKqUGXAV88WJO/p6tlAXVVouqMLwgVJHyga6sTMqjZBRDEr32zJjJLl9mEgorinA3wx2r8AnBZHFRb9zQL0vtwb+ovlY1sbtkoQuvQ6LLogHm2NJO3Ee2SqiWzoshzl0fwpfr+3QDS3Ul7hPE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199018)(6512007)(6486002)(36756003)(6666004)(6506007)(921005)(86362001)(38100700002)(83380400001)(31696002)(186003)(41300700001)(2616005)(66476007)(66556008)(8676002)(2906002)(4326008)(8936002)(31686004)(7416002)(5660300002)(110136005)(478600001)(66946007)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxkTFRudTZiaTNqWG9OT0ptL0NXTW4vQVhkeVZybDRaUVljR3Jjekk5Yits?=
 =?utf-8?B?YjFpUk5RQzMyOFRZSlBPRFYwUlpxUnBVK2drVE84dC9qbnNaRFlmYlJrbG5U?=
 =?utf-8?B?aTB4Rm1mREJlZzJkTmNEemM4VE9KaWhXUldvSGoxWEY5QUhCZ0Q0UzRVV1Fo?=
 =?utf-8?B?RW1FeENTUmVaTmhGUlRMZmpUS3hCRTdBL0Y2MVhUelFNQ2JXSG9xTTRzSDVW?=
 =?utf-8?B?NHR0Vk1tRFhFQmtSVnhNTGZXTzZKeFVaWmZWRFQ5NVowR3YrWEtZZjUrUS9w?=
 =?utf-8?B?UW9pZ2tMd0x0NUJHRzdyVFN6Z3JnNUVySGdRV2Q1Tkk5STcwRFJjNTlBUmFl?=
 =?utf-8?B?alFOWTcvTSt1aXY5N0FuK000eG1ad0ZkUGpMRmtxVFlUL3ZGbXhldWloNnlZ?=
 =?utf-8?B?Z3ZDY3NWWm15RmdJcE5PdktKZW9hSms4aUVuZVUzcndYSDhPNklMcExGTHZ1?=
 =?utf-8?B?SjN4bUF2S0w3ZkgvYXdySFFHejlyblNremFUUS8yd1VrNkw5TjkzRTFLa0hK?=
 =?utf-8?B?TzBDL0RiRmVsaW9Fd1l0blg3YklxSjdqV1RmQS94bUcrR1VQUnAxZGJJZVJp?=
 =?utf-8?B?VEZldGx4MWhvM3lQMTUyd1JDcDdCMk1TUk5mOWZLWm5SejJGNzNlc0tqeURT?=
 =?utf-8?B?NlVZRENmUjgyWEx2Ri9ReVdhNnh5Zy9YYjkxeW9iYitlRWJFSW0zTFFQZ29L?=
 =?utf-8?B?V3BqREI3Y1lmeEpJMHo1L1BRa2c5WUZLNmJKaFRsWmZxd0V1VnU2dXBXOUxZ?=
 =?utf-8?B?ZS9SUndsWFFXaStSOXJ6ejR0bXZJZWp5MlY5UkNzV1ZUUzRVYTZ5MzIxY1Vl?=
 =?utf-8?B?MDlZa2s4eFF0Rk9PWlV1TXluUWNUM1hFekV4dkp0ZDdvSGdsZGZsNjhieTVm?=
 =?utf-8?B?Z1l5c1NEMUZPVUxCd0RWTW9KdHhrcGV5bEtOdjFPRGt5dDJDWm1qVDVrSHda?=
 =?utf-8?B?Q3ZuNFRSY2lnVGd1NllXZkJheU1WRlljYXRoTVA0Rm9SN3VZTzlLejRQMTF1?=
 =?utf-8?B?WG0rQSszcXVTL0QyeWJ2RlFtVGJKbUI5aXM3RVNuZnovUXhJc1BzbWRTWnZ4?=
 =?utf-8?B?dzZ0T3JkRmcwMVM4MytRZTdTN0JWSUJQTCtKM1F4S29TRFZhdmxXd0FkUjVC?=
 =?utf-8?B?czh0Z2ZYRHN5Rk5kU1lCUTFIRUxkZGFqb29IVG9DaFR0UyttZXZ0UDZlYWts?=
 =?utf-8?B?NWdjS0lrVkJSSnpMaFcxaDhYdkZYRVpLNmJOT2QvK285YkdkS3c3bWJiOVU3?=
 =?utf-8?B?L2NrRFFiOFRmV1ZOSHM1bjIvb2lZSEF4djA0MmZnQjBIQjBiK21qMmhiWEd5?=
 =?utf-8?B?UWxSdG9nblptMkpYOUpFaWZZT1BCTDh2aVRtMnBWS1JmSWZQemdFejdZelpC?=
 =?utf-8?B?RThNOEUrSEZPdWV3NnJiU210aUpEZ3k0NlU1NUY4aVIwWG9lUVJNbWo4OVpU?=
 =?utf-8?B?ZWpXSUhBMXlJMWU5TWVhZlE1THVxdTgzdDhuZUVNYmUzc2dZQTRDb29valNa?=
 =?utf-8?B?YUtzTmtwNTBnRkpseWtPSUNWR2dncTFMNWlZZlJNWFA4bFZaS1JQQUg4cDlG?=
 =?utf-8?B?bHV4OTRrYXNDM3F2eXozc3BPY1RWcWxUeTNMNXJlMFFRREx6VVhWaUZGSFdh?=
 =?utf-8?B?OGN2eHZiWmpKdEN4T1ZQOXl5T1NxZkxIYlZabEp6Lyt4eFU3SC94N3o2THlO?=
 =?utf-8?B?NTVRZjdUUWFNMklrWVdGSGVZWkEzT09JejJJd0d5bFJUUTd4bEhLNS8rNVNJ?=
 =?utf-8?B?dEl2OWNSV09aWDQ1T0RvTk8wcDZrQkl5TlJ2YUNKNmV5ZG5hTk9HQkFibko1?=
 =?utf-8?B?NTE0Vkt5dTlwU3p5ZThZczA1UDlnQkhnUkwrL21pU3M0MVdOMXVvQ2l0ZHc2?=
 =?utf-8?B?VzdlcExmcEZnNWhQUFlaQXNLakJGN0E3Ykd6YTJVOUxubzhyQzA2bFViUUxx?=
 =?utf-8?B?RXB3VzN3UytxaUVQeVl4RlhVVC9zZ2NIZWRrQTMra3p4Ni9oYkNrekZobGdr?=
 =?utf-8?B?N214dElPR3lra25WajZFRGMvVDhmTUx2eHU1TTlvSkVOVi9pekhvNjRwWHRr?=
 =?utf-8?B?bUZSZldCTElmczhCc2t0cUVha3Q4cHVvTGFNaW9KVEY3OEk3cmNyc0xFUnlQ?=
 =?utf-8?B?VDROUSttYzQ3aCt4UURjMHBuN3JEMUZXYmJ0M1Y4NU01bmhlQjBYajVIcSsv?=
 =?utf-8?Q?4fLH3ZdbIyS6ZShzM9T6QEsO2Vpmdczr6J3tGZTiMRgm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b57cfc6-bf04-44be-93e5-08db2000a123
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 18:12:08.1265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/m4wt0MqguVwT1+ys3Rl+2tDDR3/KYhvN9+FmTLzg2DWyg5rNUOiDZIljazPCsA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348
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

Am 08.03.23 um 18:32 schrieb Asahi Lina:
> [SNIP]
> Yes but... none of this cleans up jobs that are already submitted by the
> scheduler and in its pending list, with registered completion callbacks,
> which were already popped off of the entities.
>
> *That* is the problem this patch fixes!

Ah! Yes that makes more sense now.

>> We could add a warning when users of this API doesn't do this
>> correctly, but cleaning up incorrect API use is clearly something we
>> don't want here.
> It is the job of the Rust abstractions to make incorrect API use that
> leads to memory unsafety impossible. So even if you don't want that in
> C, it's my job to do that for Rust... and right now, I just can't
> because drm_sched doesn't provide an API that can be safely wrapped
> without weird bits of babysitting functionality on top (like tracking
> jobs outside or awkwardly making jobs hold a reference to the scheduler
> and defer dropping it to another thread).

Yeah, that was discussed before but rejected.

The argument was that upper layer needs to wait for the hw to become 
idle before the scheduler can be destroyed anyway.

>>> Right now, it is not possible to create a safe Rust abstraction for
>>> drm_sched without doing something like duplicating all job tracking in
>>> the abstraction, or the above backreference + deferred cleanup mess, or
>>> something equally silly. So let's just fix the C side please ^^
>> Nope, as far as I can see this is just not correctly tearing down the
>> objects in the right order.
> There's no API to clean up in-flight jobs in a drm_sched at all.
> Destroying an entity won't do it. So there is no reasonable way to do
> this at all...

Yes, this was removed.

>> So you are trying to do something which is not supposed to work in the
>> first place.
> I need to make things that aren't supposed to work impossible to do in
> the first place, or at least fail gracefully instead of just oopsing
> like drm_sched does today...
>
> If you're convinced there's a way to do this, can you tell me exactly
> what code sequence I need to run to safely shut down a scheduler
> assuming all entities are already destroyed? You can't ask me for a list
> of pending jobs (the scheduler knows this, it doesn't make any sense to
> duplicate that outside), and you can't ask me to just not do this until
> all jobs complete execution (because then we either end up with the
> messy deadlock situation I described if I take a reference, or more
> duplicative in-flight job count tracking and blocking in the free path
> of the Rust abstraction, which doesn't make any sense either).

Good question. We don't have anybody upstream which uses the scheduler 
lifetime like this.

Essentially the job list in the scheduler is something we wanted to 
remove because it causes tons of race conditions during hw recovery.

When you tear down the firmware queue how do you handle already 
submitted jobs there?

Regards,
Christian.

>
> ~~ Lina

