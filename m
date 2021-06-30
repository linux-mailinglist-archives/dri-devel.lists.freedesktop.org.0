Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95CB3B7FBF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 11:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE8D6E95E;
	Wed, 30 Jun 2021 09:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2068.outbound.protection.outlook.com [40.107.95.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579486E95E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 09:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SL1Vua6sjlU6WJnkMIt2MmZhUTUwi9zmc3Q9qNBBkiwDvkUi11vbImCm1qQd7vbIRDDUDjMqwD9T3PDSq2HeDRE5N9rIv1LUvl35vaF/w1QFLpo9GPxxzlEx/et3Pf/dGzXXlZZKb/Wkp0NG5wteRVKj2WFDMJYCRB19Am4byFOlXKj6lTFuPuiL1M5RPoXS6iwf3M7nxxlS2veu8wRpc6zK+Be1fQr7Ok2GVk/BTc/DB6TtfnN3TjJo5IX5ZAla9Rgrye+zH2NEw/u1dc24Z2fZk6hUrpSmvRQx7xvU07kzCd62t4cqajb/GvOYDViV8thHcOm9KcPL+Jb3C37MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bipp3z45/d0tK8uRrRZOV8VN38xlaq822RYvbAKMkY=;
 b=VPdkJrLUZUKwepSta5C/iCTfa6uq/PV1FkIaBe1fmYesR/TVMTW7BlO17EaOwyy12cJJbfsvWyguENtalQfa9qA7Ma9szJbFzwBCHOcmQv8msAoldPf8ZrbQLNQoMTJh9hP7r8HNV/pk6aGuZWopbEYhnzhJww/eOtEicr9pyOfiMCVkZAPbJR4zca/3wR3MX6Q7ly5tGD70UOQylV+O4TwcQ8uY8KDDvINnvMDUrjXBs3JnIY9gLtmXEwJGD9bBlgKOyC7knhtW1/pvfF2VOy+7u9MsTovAKHZ2AXNpkz8x4HMzo2+p1/AOjC3wozmwQvgfTwMxR6SCJv+46dBE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bipp3z45/d0tK8uRrRZOV8VN38xlaq822RYvbAKMkY=;
 b=J6w8jm59w7PtzdXztAjZhixA2s8KgTnQgum1JNSFbyg/nR7c6LXSSeR0bOjY8hbt/Vd/NbvR5Ug1wSFkJ2F6LhdOZeH8z9QDRqVQhETL0TgCscOiHlr6HELX5ua36/x7aXRIG7JE96pRTpJ0AKKYOJ1WN6cKhe99f9TWsU2Aut4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Wed, 30 Jun
 2021 09:13:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 09:13:24 +0000
Subject: Re: [PATCH v9 0/5] Generic page pool & deferred freeing for system
 dmabuf hea
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <97589e2c-542b-1117-b8ca-a086db42a0fa@amd.com>
Date: Wed, 30 Jun 2021 11:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210630013421.735092-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fd79:22d7:4c21:2421]
X-ClientProxiedBy: PR3P193CA0050.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fd79:22d7:4c21:2421]
 (2a02:908:1252:fb60:fd79:22d7:4c21:2421) by
 PR3P193CA0050.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Wed, 30 Jun 2021 09:13:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c619f4-e5ab-4ff4-b7b5-08d93ba75028
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-Microsoft-Antispam-PRVS: <MN2PR12MB434241149F281B84D46F77B183019@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i/RONSnK8z28hc8yL+EowxCEgJGbQVgZjis1lZE0lVTNMfHUBBP6Wj0O4vA0JndMxsiJEZURuIIrnOV6XqhMcy1jQ5hix7DkMxcS8MJB0Syo9USa1sfWwlLufbcQDGtBTcA8nuMbCOhgzB6njEGwn5cjKabdF17xAkC89VabEHn3F4xr/KKqgh36B7qx0/G6swJtN1yi9B8b5UD+X30shVsg2T0YSZ2uPWsDvxMvtv+d7YbY+rbYUdEI6uJAMZSp80MSuxoDZuvFxzk9+0xT42vvbA2s0bOC5FHXqkl+Xdu/cN9HzxcOdLgj4j4A9e/redXbqxjEyYpyA9Tdq26x1b5+eHKKAvmtdQ6ClUrF1RYO67vgNTGZ1kWYF5hVswXsf0fX2ZRjCEyNGbuZQTc22OMkh3X1FyspBKITj27HqI63ntrQE2b+AkhGdyq3gZvDXO2oWrZJm2NoXkNndxE0mpmu1AoJod2EIjpB/c4TE4Z8VIDyYLDICXKEf8RRu9LmrR4gr6crAMCmvvtQPNl15i+UNpjbIdGB1+1Sn9Hrzri+GdE+MRF1gaxPw+3WNW4S+6jKcZF/hpwYzA5CdVGW/t46BZAsroPVmc5zvL6WlpSv4FVvCWGYinlCWWOdkTFHXRaqV8MDc+5Bya4l3VT2U36C+6IDCBuThCDhoUUOllW0yZw7LUDVAlLy0PavzbXGw0sW9WdzPwmpd5JRzYQeitcKPvhkyOq7ZcIyrhrhhfcFmUmh/sTk6swjTBYpFbQKxqMmq9ldnviCvYCR9Ir+bsR9gtVXQGGEDfDAPgAPQQXjBn1o7OWcsTtPaQwzOrxmzwv0eIrhA1EYP/Rtp6uMtRBrL15SJg64+GQyf/hKGcMgOzdX+UeFIxIFG8rxpCn9udFJAmHiKVVbzza5pH2OmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(966005)(66556008)(66476007)(5660300002)(66574015)(8676002)(36756003)(16526019)(186003)(2906002)(38100700002)(54906003)(7416002)(316002)(6486002)(6666004)(86362001)(83380400001)(31696002)(110136005)(478600001)(66946007)(8936002)(4326008)(2616005)(45080400002)(31686004)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDZpTTNNMkovTG15MzVkN0VnSEVJQjU5Q1VCSkNDQjFON2xPdjV5c0crajk2?=
 =?utf-8?B?ZlcrdDhuS05JTEVOOUxpbnZDbk44cUUxSXhTdFB5alQ0L3NlYTFUenBhR2Zm?=
 =?utf-8?B?eHg0ZzJUdWtIdVdrSXB6emVOY3paR0JDdEYvZ25Rd1VNdUtoelkyeGpkbVRJ?=
 =?utf-8?B?Ym9xWlc0ejB4cEkzRit2L3hnNGN5NjJMQVlNb2hONWlmTHN2ZEQzZTk3QjhU?=
 =?utf-8?B?dTRRTlBJQndSM2c1dHdjeHRqejYrcDUwRVdzL3VYcENFdXJ1OTVGU1krWEQ0?=
 =?utf-8?B?YlFZVEN4UDNxQW1Gam5QTG55bm5SY0dIZDZiUFphR1psYkZuV3Q5dW4wNHFP?=
 =?utf-8?B?S0thaFlDaEZldWtiZnlqMXVtaGhPNHJYd2tXaGlsSTE1K0dmU3hQa1ZiYVk1?=
 =?utf-8?B?cTNwTjRweVduU2VERklRY3RLbkNFS2lnblRIbTgzL2YxejFPL2JTSU5hbWR6?=
 =?utf-8?B?bENqRy9qdkgwd1dJN01oVDlDd2xhbWZzM295NVRFSXNOQ3pxT3U2NlQ3eHBK?=
 =?utf-8?B?RWVJRXBSSGZpRHpxV3hVRTljb2w2Zi9zTE8yWVl5OS9XL3RRYTFVdGJYS3h3?=
 =?utf-8?B?Y2xRTjk1NlA4YVhoaEN2bXFHcG9qVC8wdEFlb2crcFdmcmQwWDVrQTdxc0x4?=
 =?utf-8?B?T0VLdDBOWW9adlMzVEt1bjRlQ3Jpc0diQ3BscmVPNWI2UEp5ZTMyWVl2VTBW?=
 =?utf-8?B?UjlFbDlGMDdOeUM3WHB0cnlJSjNvWVh3ZmY1MlMyYVkvT05Bck15TG5mc1BX?=
 =?utf-8?B?eHNIbTBINHJqc1FxWVljeG84U0tLbUZSS0RpVWpxR3JmR0g2OUZUVkxhZ2FH?=
 =?utf-8?B?M0kveGpRbFRnRzB3TEt0ZEJ3di9KUDBKQjdrQzY2YnFTM3E5ZjVlR2Z6SGV2?=
 =?utf-8?B?QVVqSGY4N1JpRzZ6YzNVeW5oTGxYSGlvdjhEWlpLMk5kTEtUR1BEZTJ1OXNa?=
 =?utf-8?B?NXRvU0lVS3l1empUdk9zc1FYODdQSHd6THRtRVhRdWZiNzdsY1NrNWl6c3dW?=
 =?utf-8?B?UlFLODdmb0VBalBob3FINDRYUjdnYUZVUFpTZ20xcGZsVDVkQ0hzOVpoRksr?=
 =?utf-8?B?N0lUZlVWMitWaytHbDFCOXZVSWg2YlV1Q1pjZTdzekZKcGt3SVlkRHR5Nm5G?=
 =?utf-8?B?MDJqN01zREJHQ0RTdWo0OXBxREU0WmpVcUowdTZCRTYyZ093SFZoaWFIL0s5?=
 =?utf-8?B?eHJUc0JEYmxDSjJ1MEJFS05GT243ZjIrQmRjMUFXMGxKYWdxNG1abXhyeGNo?=
 =?utf-8?B?Z1RFcHpob2JBQ1pZalZuMHRjYXRaMXZCVVpUYW1OaGg5cUdEK3NqVWFtbWpR?=
 =?utf-8?B?dk5WSVRoZ29OSGNrcVFxLzdtSlo1azJQZWxVS3ExY0lObU9sc0ZMeTd0Q1Ey?=
 =?utf-8?B?QTZHcEQ3ODZVY3RGZ1lrcEErcVRKeS93Vmd2YU5IZzgwQXpXVDJ5Y0Y1UXU5?=
 =?utf-8?B?UWs4Q0tUdWp1aDVId2lIV3E3SWRzSng2MDhWNGpTdnMzZk5EaG1OMTB0ZXdB?=
 =?utf-8?B?UmJwNUtIeEZVcmp0OHlIWkpxU3gvb2V3NUpNaW9COVY1cC9qclhpMmMySU05?=
 =?utf-8?B?TWk5N3JSMjl0UWZhcjdZVmNFd3RTWThaOWpzbzQ5QU14WXNLbGRrTG5hY3U0?=
 =?utf-8?B?am9oRjJNTVd6QXZIRDlZTEpXSzM0N01nNDBFdmM2QnZSY3haVkNMZmFsY0JN?=
 =?utf-8?B?M3NvckhsN0RsNzd1MVJlVzlOTlZwaXl4cUY2UUJNd3I5ZWZYamJnUktoUHQx?=
 =?utf-8?B?SHA3NVpGQUFKemJTNXR2MnhuekRpME16SmtTVmhOUDBrU3hCR3hLMkF1M2Z1?=
 =?utf-8?B?WnFEVExTTDIxUUNIU1FZQ1JnVWxDRTRFU1JUU1EybHhld1Nnb3dQU0JuNlpq?=
 =?utf-8?Q?QcVgjQAE8wS4v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c619f4-e5ab-4ff4-b7b5-08d93ba75028
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 09:13:24.1837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neN9g1Tpz8MrwOqvX4d0rMZOsNm0tZQPUZ0WgP3wcJUA9yzi94NsFclnLetad0vP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>, linux-media@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 30.06.21 um 03:34 schrieb John Stultz:
> After an unfortunately long pause (covid work-schedule burnout),
> I wanted to revive and resubmit this series.
>
> As before, the point of this series is trying to add both a page
> pool as well as deferred-freeingto the DMA-BUF system heap to
> improve allocation performance (so that it can match or beat the
> old ION system heaps performance).
>
> The combination of the page pool along with deferred freeing
> allows us to offload page-zeroing out of the allocation hot
> path. This was done originally with ION and this patch series
> allows the DMA-BUF system heap to match ION's system heap
> allocation performance in a simple microbenchmark [1] (ION
> re-added to the kernel for comparision, running on an x86 vm
> image):
>
> ./dmabuf-heap-bench -i 0 1 system
> Testing dmabuf system vs ion heaptype 0 (flags: 0x1)
> ---------------------------------------------
> dmabuf heap: alloc 4096 bytes 5000 times in 79314244 ns          15862 ns/call
> ion heap:    alloc 4096 bytes 5000 times in 107390769 ns         21478 ns/call
> dmabuf heap: alloc 1048576 bytes 5000 times in 259083419 ns      51816 ns/call
> ion heap:    alloc 1048576 bytes 5000 times in 340497344 ns      68099 ns/call
> dmabuf heap: alloc 8388608 bytes 5000 times in 2603105563 ns     520621 ns/call
> ion heap:    alloc 8388608 bytes 5000 times in 3613592860 ns     722718 ns/call
> dmabuf heap: alloc 33554432 bytes 5000 times in 12212492979 ns   2442498 ns/call
> ion heap:    alloc 33554432 bytes 5000 times in 14584157792 ns   2916831 ns/call
>
>
> Daniel didn't like earlier attempts to re-use the network
> page-pool code to achieve this, and suggested the ttm_pool be
> used instead, so this series pulls the page pool functionality
> out of the ttm_pool logic and creates a generic page pool
> that can be shared.
>
> New in v9:
> * Tried to address Christian König's feedback on the page pool
>    changes (Kerneldoc, static functions, locking issues, duplicative
>    order tracking)
> * Fix up Kconfig dependency issue as Reported-by:
>    kernel test robot <lkp@intel.com>
> * Fix compiler warning Reported-by:
>    kernel test robot <lkp@intel.com>
>
> I know Christian had some less specific feedback on the deferred free
> work that I'd like to revisit, but I wanted to restart the discussion
> with this new series, rather then trying to dregdge up and reply to
> a ~4mo old thread.

I was already wondering where this was left :)

The kernel test robot pointed out quite a number of bugs. I suggest to 
fix those first and then take a look at my comments on patch #1.

Regards,
Christian.

>
> Input would be greatly appreciated. Testing as well, as I don't
> have any development hardware that utilizes the ttm pool.
>
> Thanks
> -john
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fandroid.googlesource.com%2Fplatform%2Fsystem%2Fmemory%2Flibdmabufheap%2F%2B%2Frefs%2Fheads%2Fmaster%2Ftests%2Fdmabuf_heap_bench.c&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C6d982c8c584d4fb914f208d93b673549%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637606136750178732%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=iNOuK8umbpkC4oYSM%2FaM3Ybx45FUWQsoRxPDjznBw70%3D&amp;reserved=0
>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Ørjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
>
> John Stultz (5):
>    drm: Add a sharable drm page-pool implementation
>    drm: ttm_pool: Rework ttm_pool to use drm_page_pool
>    dma-buf: system_heap: Add drm pagepool support to system heap
>    dma-buf: heaps: Add deferred-free-helper library code
>    dma-buf: system_heap: Add deferred freeing to the system heap
>
>   drivers/dma-buf/heaps/Kconfig                |   5 +
>   drivers/dma-buf/heaps/Makefile               |   1 +
>   drivers/dma-buf/heaps/deferred-free-helper.c | 138 +++++++++
>   drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++
>   drivers/dma-buf/heaps/system_heap.c          |  46 ++-
>   drivers/gpu/drm/Kconfig                      |   4 +
>   drivers/gpu/drm/Makefile                     |   2 +
>   drivers/gpu/drm/page_pool.c                  | 297 +++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_pool.c               | 167 ++---------
>   include/drm/page_pool.h                      |  68 +++++
>   include/drm/ttm/ttm_pool.h                   |  14 +-
>   11 files changed, 643 insertions(+), 154 deletions(-)
>   create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
>   create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
>   create mode 100644 drivers/gpu/drm/page_pool.c
>   create mode 100644 include/drm/page_pool.h
>

