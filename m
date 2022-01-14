Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD148E4C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 08:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3641D10E151;
	Fri, 14 Jan 2022 07:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39A110E151
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 07:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tp4Dc/mzMZbYOLnvrNS6lcYeu/ojPqn/jji5HNQsYkHmTJhpQkYZzx02qOyKqZ6t4kjIPwSee1QTZ3CEM6fnFwJayPRX9L6VtZIqYTZ4peKAD2Duck7sMB2DOElTqOvTWnlNTyNwoIlw79urXcZ666QycwxlrJ5rgNbvAAxeCf7LhboblIAdhlzq2X6r6U0Kn2BdRwsGCKF+rK5gxT1g8edgY9ksrcWpuLQKdYUiyP8eT7zSRpgE9wErJQRMC4vjbnnqisScxEUntbMz3nTf/hXpzeubMcJlbsBGDJnR91GHL6Nl5ctdnBnMjm1qM+7ILy3yZhFX6yLaZsqeFnX1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4YGYzpqhydG50UG1r0lJhuJ/hvrWmb6ePIQFPRI8Do=;
 b=mkgibP7U+wHpOeSoknKhMMPgNVEYjUWnJxV5ish6/JTnHQKbCCQqzpB7okRvvz7UFXxMhz3MXvcf5drKarB+HhlQhmzfJUg6de9sxzH681SuZrZBZWWSOvXWzGW/FQQNdhrLOgecl2GYX0xnZLM15MB8EOLF5MMw+kpFBGL9M+kEHWreV5lIGV9j/fiqxPcfaqGTAQpiZPKaV93vKEB7DbE8cmzk+CS218Eozijen83VRsevKna2D1BrxadV2hZYs8nzzUVUMdWyhIjwGttcRPo6E5Qam4HMGYyHZSMSSVLTHSd958skgFS+ztoUCKmpdA7FYuhPWhmlRqfyhOmsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4YGYzpqhydG50UG1r0lJhuJ/hvrWmb6ePIQFPRI8Do=;
 b=oCm8e8wIsNhQeClCnouj2QrZOAb1FZ6lbOL+UGZtn9LyqZKmB/5LGffnwKrelTmRlI56DepLHz+Zf6npA3tmZ6U7eOopLAO0v8TulaGLJBPsn/DZVek7uu2ZOOgiJuWoc8+l8YomGq0BTHcZ3HhD2oz+ladTFqHa4dPpZBw7vkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by BN6PR1201MB0210.namprd12.prod.outlook.com
 (2603:10b6:405:59::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 07:16:41 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.010; Fri, 14 Jan 2022
 07:16:40 +0000
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
To: John Stultz <john.stultz@linaro.org>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
 <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
Date: Fri, 14 Jan 2022 08:16:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0026.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::39) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 523cd04d-5346-49f8-7d54-08d9d72dcf9a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0210:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0210240F26477824A724CD3983549@BN6PR1201MB0210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8bpkGMVZfLgbmZAVdz2ZF7t8c4nmVEBlmPdwzoiIclJaC9gfgKwQZuVQvoxupboHBUCcBrKcZhe1ZThWBebHdLfvPvoVlehXOyxKK8ZgZNed7rkj0on1rPL4o3t1Lgxh2+/LIdDnaJ49+mRIzyXt1FfR1DqMG97AK/aofvfcG+qyWh4zKZxbsCjAPKnVGPRZp4QKw5LKy8fwFjzx1R2pjOfmwHvGyB3+9kxlUOqYeVznGxBK1bKF9NHy+KlKr3ei6ZHOgqTt0B9uuCEh28wFNfEmFtXeNH+BcPyXAt6C1OMDXIjybZK3G3wrhWZ5uqnEAtiPZ1Z+H6KypqH9RSjmRCux1nk4ENmGzbqdoOOBtBNlb1FBqiT5JcKr8bG/y2/8KxUpko76wIwPK6MCcmWKEFeXdmbr1E/io6iRU/hF9Vv5lHiY171znb+NOd2LqKS5ZunmIMJtByGoIyZgQmfjv9OAlzCUhJFdApl8PtjQDzlSFL4OBb+p4zTFPdLNSsDT9PjLn3JLEKo23QtgmHP4LqgLThJkGx/HhsfJic5UIJ5XyPVWPJrJYPEkp8+1QlOpccEFAgjUxiNBeMxkvnu9En8iFHeSzMe9XrTi9pWhVXS8r6+xijfLX0uk+usJS5DylQ/8Q/fSVwO0Ghz7BS0J40de/lwmeOf+Xwr8Mup2fBSSV12wjE6sK/j81GtAlEVa1tvdTQITu/wjcJrNl5VzOe97zhRYIEsJD9AUQqBMzEP8Ghy63KL2BqhrEUuudiV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(26005)(66476007)(8676002)(5660300002)(54906003)(8936002)(2906002)(66946007)(6916009)(186003)(83380400001)(4326008)(36756003)(2616005)(6512007)(31696002)(7416002)(508600001)(316002)(6486002)(31686004)(86362001)(38100700002)(53546011)(6666004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDNnVUwva1Y2MmdzeUdNRXowa3dTYWVoR0kyM0ZKQy80eEJIbXFhR3hUeTQ3?=
 =?utf-8?B?ckRzKzdFMUZCZ3BZNEJWQ0V2WUYyblFabTc3a3JZNTJVSXBPRkgzQU5mNHJX?=
 =?utf-8?B?NEl5azg0MmpuampjVWZTZmVGd01iNUVxeUxkdm5DRFdUa1RBVjBZMmRLMS94?=
 =?utf-8?B?ZlJMY0hQTTk3YzNsbityU3pXajZMV2RDY2hKSFY0aVB6UEhGQ1FIZ1lFeW42?=
 =?utf-8?B?aklZcTVzemNGbEpqamhtbUhqT05hMm5NSTBXdGFzb2tsMzNUTVNRMEhTMmVq?=
 =?utf-8?B?OUU2QWp2RlVycGFzOWUyNEhPZ2RJZGJhZE9FYVF5QkcwTWpxZzAyeVQ1Uk85?=
 =?utf-8?B?MDNNNFRSa3lvU3QvbjVnWnpJNHBVZUFBazFQMHpwN2kwTzQvOTdEQjZrZWtU?=
 =?utf-8?B?ZUcrdWplZ3lTalNVMkVrSHFpN2hqdEpnSDVYU3JhVWYyRXJDQzdYempTQjBu?=
 =?utf-8?B?U0V2TFZyMjlQVEpEM3A1WUx5VkpnOE50ekREcHRlenVuS0ExWE00cHlTK2p1?=
 =?utf-8?B?QS8yWnltSWRibnBrM1JaMG1PSzNtaUFUYVQrcVorMnM4ZmIvNC9GSTl3VlJh?=
 =?utf-8?B?eHR0MzYzcGxPeUowOTlubEdTdVZnM3ZOUVJya3ZkeGd3ZlNOUmNIaWJyVUhs?=
 =?utf-8?B?Ky9tU2NZZEd2ZlFqOGJCSXZhZkt1aExYN0RLdnhDMUZ0bHhQRDNSRnREczVs?=
 =?utf-8?B?YU0xbFFsQUp1c2tOck9vV3M2WWVCbE85YkhGRUhSTjdRUnJXanR2RW1DazRS?=
 =?utf-8?B?QkhpdlFlclNZSzBqMndkNm5NWHdjMUJLN3NOZTY0dTBSY0RsN2RhM2lzM1lS?=
 =?utf-8?B?bTQ1VU9lYWxKODdqS01mdDZzNWwrUlRJcERaWjlDcmEwckcvZERla0lMRnhP?=
 =?utf-8?B?K0J0VjNMeHVEUjA1RFFqSmgxQ1JzSmp1MDBVczNMb25CbzE3WVdjT1EwS0V0?=
 =?utf-8?B?QVlEQURXRE5aUndzQ3VjV0dhMm40NGpKOFFJeFZwNTNFTU45YzU0WEcyZmRX?=
 =?utf-8?B?MEZ0SjlpaW11dEVPMjZGK3pYT0R0cmh2RU5hZTBJemwwckQwUXd2ZGU2NE1p?=
 =?utf-8?B?VzdMZlNhS0wvYjhLWVJqSHhqYjNPMi9wSkt5Ui91R1NmT3hJYU80bTFIbHFK?=
 =?utf-8?B?MzMwdzNYNXRKTUJKdCtMRkNjMjQ5NDBrMVpxZmc3K1JveWxzTlpkZi9XMUFW?=
 =?utf-8?B?UXlFVmdweldEeGFUeTlYNkZhWllVNkxiZ3drQ2tPVkE2c2ZFZFVrZmtZMGZL?=
 =?utf-8?B?Mm5wNU5iVjhxVlFmSUdQNkpSZ3VWMnJuVnlTNUJxeEJQOFRBeWg4dzlBOGJQ?=
 =?utf-8?B?MUg0bGI5VEY1VkZCUWlkL2tpVEs3ZDBVcmtKZWtObllNaGJyU296Y3Z3VmI1?=
 =?utf-8?B?Q08vcXQvUFBwNzAveEJTcUhGWGNkRWEwNE9LT1g5YXVEZ0FzRDdrblpVUWNS?=
 =?utf-8?B?dXFOOXhRNDFYVkpFSnpwODFiTytBb05jK3VxRmpqYm5lUVVBcm5CVXNJUHJZ?=
 =?utf-8?B?Rk1BZ1NPRVB5UW5uK1Rtck4zLzVPTTJZQmhWbHdhblZzZjVwaFpjYS9USVVQ?=
 =?utf-8?B?UHViVVl2RnVSQzlFSzd6c2pLakxzNWp3dnFCUlFPdlViUFpkeGxpNDFJdmdR?=
 =?utf-8?B?OC80bmhtNGhUbTNKYy9ZZnlhRGxhVWh0KzZBUFBpaTJVOVh3Rk5ZNG9LZ3Iz?=
 =?utf-8?B?OUp3em1wN2w5Mmh6VENyVWJadUgrUTJRanVLZDBzYWpDeGVvYWRwcHZIL1Zx?=
 =?utf-8?B?bDcxVGlrZmxmRG1wSGNMSlVJaUdWbGtCaXB5RzNaQS8veDlkQUVSQVJWL2xK?=
 =?utf-8?B?NjVUOWpiWnR2R0gyNmM1NHVWRWQ5eHN6WmZaeTZ4ZTJiblY4bmY2OG1pVHov?=
 =?utf-8?B?M1BOWmc0ZnNCeC9RVG5VSEtvMU5RdjRvajNtbC8rQy9oRHlPU2ZDc1ZMZG8r?=
 =?utf-8?B?aXlRNjBhZ1l2L1NhTjQ2cDFTYkU1UUlJY0g5ZG9JUXFrKzJCbnpCVWU2SEgx?=
 =?utf-8?B?WGxWcndncm5hUDRwR1dZcnM5U3U4LytnVFlwVVRsTzJ2YWFkWU1aUkZnM01H?=
 =?utf-8?B?dU05eHZyR1NFUk9icU1NRXBsSEN6aU1wbnNMZnRyQkRDV3RuZHd2VTl3MWZi?=
 =?utf-8?Q?BoLI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523cd04d-5346-49f8-7d54-08d9d72dcf9a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 07:16:40.8175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPy5XcfbxMexvhvTV6UrXBjMOLo17XYewv0gQDBGswg7pUNAEydXCY+xMyebvhiM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0210
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
Cc: "labbott@redhat.com" <labbott@redhat.com>,
 "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>,
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
 "lmark@codeaurora.org" <lmark@codeaurora.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.01.22 um 00:26 schrieb John Stultz:
> On Thu, Jan 13, 2022 at 5:05 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 13.01.22 um 14:00 schrieb Ruhl, Michael J:
>>>> -----Original Message-----
>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>> Ruhl, Michael J
>>>>> -----Original Message-----
>>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>>> guangming.cao@mediatek.com
>>>>> +   /*
>>>>> +    * Invalid size check. The "len" should be less than totalram.
>>>>> +    *
>>>>> +    * Without this check, once the invalid size allocation runs on a process
>>>>> that
>>>>> +    * can't be killed by OOM flow(such as "gralloc" on Android devices), it
>>>>> will
>>>>> +    * cause a kernel exception, and to make matters worse, we can't find
>>>>> who are using
>>>>> +    * so many memory with "dma_buf_debug_show" since the relevant
>>>>> dma-buf hasn't exported.
>>>>> +    */
>>>>> +   if (len >> PAGE_SHIFT > totalram_pages())
>>>> If your "heap" is from cma, is this still a valid check?
>>> And thinking a bit further, if I create a heap from something else (say device memory),
>>> you will need to be able to figure out the maximum allowable check for the specific
>>> heap.
>>>
>>> Maybe the heap needs a callback for max size?
>> Well we currently maintain a separate allocator and don't use dma-heap,
>> but yes we have systems with 16GiB device and only 8GiB system memory so
>> that check here is certainly not correct.
> Good point.
>
>> In general I would rather let the system run into -ENOMEM or -EINVAL
>> from the allocator instead.
> Probably the simpler solution is to push the allocation check to the
> heap driver, rather than doing it at the top level here.
>
> For CMA or other contiguous heaps, letting the allocator fail is fast
> enough. For noncontiguous buffers, like the system heap, the
> allocation can burn a lot of time and consume a lot of memory (causing
> other trouble) before a large allocation might naturally fail.

Yeah, letting a alloc_page() loop run for a while is usually not nice at 
all :)

You can still do a sanity check here, e.g. the size should never have 
the most significant bit set for example.

Regards,
Christian.

>
> thanks
> -john

