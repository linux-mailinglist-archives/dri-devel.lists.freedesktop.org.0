Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2FC54F0F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 08:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C21F10F6AE;
	Fri, 17 Jun 2022 06:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D9C10F6AE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 06:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7t5LFfrCrRNwmnZo1os6Pec9ya/BZaFSKtNXwi06JYOGvECiWnP9GP7ni7VSgav4ZFvcBn/1TvqtgqaBUEI5kgPiyED3QxcVVq/qwUCNKSEIagRRyP1cGeYUMT3bXTmIUli9PV+1twCH3KpuNF9jQlhRRPfINiIqm95McJFp3AMNsdiD2sIwBkl+C58oTs0mWvQmdVUYfhVq3omwK3NbLUKvwjIdVbAFtcwrksh8CZNfAaPN60eGknCXJirNqjqV1hi8sq6x4p9PRE7ovh9OfKxX22qvyx5NLtl/1v5m37w3PWUff93buWLdR9fn8Rqsh0gvvSwLChLTlY8DoQqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM7NIxAh67xyU/3KiNlsxxWzsCkdHMf6XhOgXFmeOvc=;
 b=Lj5dqE8C2A6lZoD+ksCSslUsktCw8LbzgaKhkW3YJ6q7QOV529a+g1Q6N8B1BCUaCrWuN2iRZ/jERQg4nZjM7MKEoV1n8gnC36dSpeUCpkCIYXAiETA0ubwfukyzvikolHPMJKnIz5QdLc72iwTmt6rtn8g+Z/0wrHdxe0mbdIylxd1ZDRd9xKPCX2zcWULwjGmO+6G34sHNeTKItp5/2hcbHWLhbXIxIUeThw4SeVIpXAHbjIy5Q7MkFGcQiM96s93M68LxMYG86pn0bgOpHzHn301m3608uCRSa6iK6OXTpjWTm+9nbh0RFKFzTxSA4WdjStj+tl1IS611xVBJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM7NIxAh67xyU/3KiNlsxxWzsCkdHMf6XhOgXFmeOvc=;
 b=fQ6Umyd99DkrkH9nZFoQmOlzwplKGi8+YPUD9QTknoq6BbNOsQ3BPmohTofgjq6hZ9e5lbjjlLr9Jckjtkq6f4kXFJwhFwvf0qN2OBV7jF2Dh1wL6PaNNeCBeW/mdeP04aOHHtDA1mAnJGxR+MIAljHSb8zEO0Fjgylt6Pkt0xY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3374.namprd12.prod.outlook.com (2603:10b6:208:c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Fri, 17 Jun
 2022 06:11:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 06:11:27 +0000
Message-ID: <63c40ed8-c28c-df17-d4e1-b823c5508020@amd.com>
Date: Fri, 17 Jun 2022 08:11:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "T.J. Mercier" <tjmercier@google.com>
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <Yo4/XhWQkACWaPIh@phenom.ffwll.local>
 <CABdmKX2dC0fkFrCedjhzmheYiDVP4PnKBMeGkX3_bgrLjOiYOg@mail.gmail.com>
 <38da6dcd-b395-f32f-5a47-6a8f2c6a4331@amd.com>
 <YpdeLrJzmCA7OozT@phenom.ffwll.local>
 <CABdmKX0EWhHsrbVdYkpR0=RYuqUteq45QWzytUw7f2NXQtJEWw@mail.gmail.com>
 <CAKMK7uEBGFGpDu+Kt=cuiCtAjopOBuZKSWDj5uWOO8eLyHcy9A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uEBGFGpDu+Kt=cuiCtAjopOBuZKSWDj5uWOO8eLyHcy9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0208.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e48a669e-8ec5-4e62-0513-08da50283632
X-MS-TrafficTypeDiagnostic: MN2PR12MB3374:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3374E99CEAC709341CDAE0E583AF9@MN2PR12MB3374.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1Wom05B7oYgQbr4gknUmTUgmNpnTe9UmFNLST3phWJWo3v0/zBoIosdvQY8Kcs70v1+JpihHJJnCucVGXkMY4Db/PwVUPjIl7/nHEDOT7X6J3ikC1avMJFVQjBNLyyxw7RoE8PyNNLeX5kHjSf4WPJbAbkkrXlrvtUAoyodkGeKvifzuNsdtAxuOHMJWLGagcD75ImvJ/Zb2aKC5pU6TdUq+X9tKSlguLdCTZCoSvF4GmkmNdsrqllImLQHUx5/I/KiOiF25I3sm237zjbxeDvnC5wWNhpXCspmAHbcX1N5MJIC+lCPfAt2hlXLeO6AdM7iRLllxUpLZrwPbRW6mtWqpu4+NsMrd3k8YlnYz68oTUPmrxi/GefeetuzHf17lLRs7x80bf1lleMH28UNmbQIxxnHArWiVJ/FEdYKTvZQ4t5UyFmB4ykP2VaPJZyoncQrowB8utsKZsppzhCRiCruxhUaUSW2EPTuPsHJ+9QAg26Frw1WvObW4lKerFuphgi6tA9dxV5oPsPWEvtWXqp5yJyPyGrI8T1rgSLZy80N1po+HixSMSTG24NeUOxhmYb5EWK7yHKvn8x60nMCEKnQSYV+cIk11CDxDKjYBjsf7CqceBHlLqUYRFMboWWFMSFuAVb3xqe+tTCPkPZx2V3lBB9ciGiugWHD8Nm/pz+jO1G/FjU/rVh2SXbI4TTYLf63kIHuSj6YooOGC76bxxn8PHX3MhygPRjyYC2U/i1iGwk/CW7TLW0fO5traaHX6kFCaiPKh7b+iIh4eoXrIvNeNHs7V/BmYjGeh0t1+rr2BPjSaJDerrDSwwYAzz2yulAgInRkfuxIPDkdb1IjU4hPGn4WltjEInpZUW1TXcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6486002)(2906002)(966005)(316002)(4326008)(498600001)(110136005)(8676002)(6512007)(86362001)(36756003)(30864003)(45080400002)(53546011)(31696002)(31686004)(54906003)(2616005)(5660300002)(66946007)(66476007)(8936002)(66556008)(7416002)(38100700002)(66574015)(6506007)(6666004)(83380400001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEZpQmVTRUdsdmo2UEhoODZ2Uk9QSHpQZnFIdGF0UEw0ek9VUGVpK3pmRGpr?=
 =?utf-8?B?TjNKMExETGpvbWRHVWt2VmRtYkpQQlJDNHFzelZBNEs2ZXc1cFV3UHRxRlN1?=
 =?utf-8?B?MlI4VHEzd1c5N0lFL2pueGtETmQvaXBRQW92OXJSU2RyZUh4QjRHdGRjelRD?=
 =?utf-8?B?eFNITHVBdEpNWWRNQ2owenYyQW9TTmhUWldLMVZCTFpFU1FhN2hzdDNubUx2?=
 =?utf-8?B?VXVQLzVoRWJxU1JGdzhFVHBydktxTVdxcXBSaDlPeE5IcVBDaUM0aVllb3hi?=
 =?utf-8?B?NjdjRW9kakU0SGJMbituLzZGNHdoOHorNkxGOStzN0ZBeUVvYk9iamZzUmdo?=
 =?utf-8?B?cyt6M3o3K2pmM2lRWmwwM1h2NVV4eExTWlRITVlHU2MrT1VkUzVPK05lZkNS?=
 =?utf-8?B?MzNET08yT0lacDRQNitvZkRMRmhJcktPYnE2N3ZLNys2cDExUnZXWmRveFlz?=
 =?utf-8?B?ZWZ1QTduQmxrWERKSHVqR2UxNVJDTklJWWR2T3p5N1RlT0NPYlZ3ZCtBMllw?=
 =?utf-8?B?bHVpTVZ4UmRhemV4Z21VRS8xdEh1WFJ5RFhFWUNyVFRmcFN4N2x5Qk1pbWxT?=
 =?utf-8?B?WGFnQkY1ellzTmNrRG9wbWZqeDR5UzVNSXBlTW1BNzgrd1ZWNXpXOW1wd3VT?=
 =?utf-8?B?NmhpYVJQbVBIVW1wNENRSzRZejY4aW5JbDJNRVBSYkM3Y3pUZGVIbVBCQTlq?=
 =?utf-8?B?bTRaYmtCZmJRYzV3WXBPNnhMQ0w2eDZ1azNVTlYzKythY3NpVzdaUzYxSS9a?=
 =?utf-8?B?ZE5mQjdLRkMrbzA2TDF0emNISlJ0V2Y2M09rQWRMTzdUb1lwVnorWkgwTUxR?=
 =?utf-8?B?ZGJBZ3JkTk55RStCMXphSjk2Y3dwNmEzbmhUMjFUZzZQdUpjMlJuNzh4K2sw?=
 =?utf-8?B?dGcyU1ZQVlVPVE5pRFN4U2xnUUY2NE15Zm5vQzlFK2RrRVVnWFEzQTJKc1RR?=
 =?utf-8?B?YklvMmFyOWM4c3FsK1pyanJqejNydnhUT1VOUGJhemRUTjJEM2lFcnRWVFZD?=
 =?utf-8?B?UUNNV0VFdVJSZWJCVW5SWnN0bk93M0R5cGtKMjQyZHRhRVEyVklCanA5N2FM?=
 =?utf-8?B?bThxbENHTWg5Tm9iQ2RqdVFkakszUXlaN005cVoxby9WQVdySmJLeHVyU1Ru?=
 =?utf-8?B?dHM2UFdtQXo2WnZWWU1MWEVPdjhlZFF4QklCdFlpYXhveUtJaGZtUHhqV0wv?=
 =?utf-8?B?RzV5SXIyVFp4MXE0REhhc2VzMTM3cUFqdE8vLzhDaEQrQUNId3A5dTUrRE8y?=
 =?utf-8?B?QmxRR0kva1o2Z0pHRkZXOTVxMjhqcWVwMmM4WC95a3dqdWNETG5YSFNQYnFJ?=
 =?utf-8?B?UDhCR0JtL3JlNkUyMWFsTmpPdEZ3UkVMU1NmL05OeVlhdWpqZU43SHJGL0tR?=
 =?utf-8?B?VU1ZVmR0L2VPR2F0L1hxYUZLNGFOdXBVb0Z3WWlQbHhyNGczVk9LVk5Oa3Bt?=
 =?utf-8?B?YmdFaU4vaUc3MmtOanlQTHgvWmp2emNPOWpVRG9EMTR6UWxkbC8rSVZtTkdW?=
 =?utf-8?B?aXhGeG9QL3VFWUlkUkVxWHNCT25GR0l1TEZSMjBydDdwM0xBdGEzMGlLRENo?=
 =?utf-8?B?d09mSTlXeS9temRKdzlkYXZpN3NndU0raXl5WVhRM01FeTJydjVZUHRieS94?=
 =?utf-8?B?U1ZIWEcrM05lZGxkYmxzUm9ZZ0ZwbHcrNm9rSkxNVTFkcU5zcmtpVURqUEo4?=
 =?utf-8?B?LzRtY2d3ajBheFF5VUxsSDRkb2toUWd1M1A5RHdXZ0RVK01rb2ZhRzRRakNt?=
 =?utf-8?B?cW1YcU9CRGFoWC91ZGtyUXAzVTBzQVlkWXR6cDkvSUZhYXQwK2UvUFFEcnZO?=
 =?utf-8?B?R2xFdTl4dkVITGUzR3NYUVhLUSthcE5hK0NocmQ2ZUVYdngzUGR5VDhTUlJu?=
 =?utf-8?B?Y3JWZ2FBMWVER1dOc2ZBS2xLRU1yaXYyZTIzU1NXZXRnTmF4bk5lUjFvQnZY?=
 =?utf-8?B?NHBRNVoyYlBhMCt2eVFyNXZOcUVDd0lLczVPMXN1ZFFEN3BTZytKNC9rUHBP?=
 =?utf-8?B?WVUrNDRjK3YyY0Z5MVpUcDJYclNrR25UYzRqdUN0VFhwUERPYjZDZU9nWk5o?=
 =?utf-8?B?d0dDd1YyNXlxWitsdXZQWWdaRmJnR2htK3VDMWRJTnU5WktjL1NzTURFR1FU?=
 =?utf-8?B?c0p5ZEZNU2hkVHNwczl4bEpCVWNRUmhDS1lkRmZGYldWSzhIVDliWWVMOXA3?=
 =?utf-8?B?aXh2N3FZSzJmcjA3ejc4YWpiN05wMnhJZXd0Vk51UllUKzhHOG9ERTRtaE9G?=
 =?utf-8?B?T0x4NW50bXVMblU4Y2JCdzVSNmtRcW9XN1pVZkZaak9OL1hza1FxUE5FNytE?=
 =?utf-8?B?YlJVZ1h0WEtENVhVbDVrL2Q3dWNSclIvNVhmdHh2R2RHeXVNelBSOWJidXV0?=
 =?utf-8?Q?fsMjaRDzepDPkq+ZvkEekGJsKIyMq0JzHmoxLIZbtWnOm?=
X-MS-Exchange-AntiSpam-MessageData-1: JnbXZZ/Za/kKvQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48a669e-8ec5-4e62-0513-08da50283632
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 06:11:27.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oal1UFFpUcoz5VRc4fK5Dp45s3MJ6QbfCy+RZeXNPeyK5GE1hSz0E08BX/G+SLMo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3374
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
Cc: kernel-team@android.com, Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.06.22 um 20:32 schrieb Daniel Vetter:
> On Wed, 15 Jun 2022 at 19:43, T.J. Mercier <tjmercier@google.com> wrote:
>> On Wed, Jun 1, 2022 at 5:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Mon, May 30, 2022 at 08:12:16AM +0200, Christian König wrote:
>>>> Am 25.05.22 um 23:05 schrieb T.J. Mercier:
>>>>> On Wed, May 25, 2022 at 7:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>> On Tue, May 17, 2022 at 08:13:24AM +0200, Greg Kroah-Hartman wrote:
>>>>>>> On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
>>>>>>>> On Mon, May 16, 2022 at 12:21 PM Christian König
>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>> Am 16.05.22 um 20:08 schrieb T.J. Mercier:
>>>>>>>>>> On Mon, May 16, 2022 at 10:20 AM Christian König
>>>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>>>> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
>>>>>>>>>>>> Recently, we noticed an issue where a process went into direct reclaim
>>>>>>>>>>>> while holding the kernfs rw semaphore for sysfs in write (exclusive)
>>>>>>>>>>>> mode. This caused processes who were doing DMA-BUF exports and releases
>>>>>>>>>>>> to go into uninterruptible sleep since they needed to acquire the same
>>>>>>>>>>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
>>>>>>>>>>>> blocking DMA-BUF export for an indeterminate amount of time while
>>>>>>>>>>>> another process is holding the sysfs rw semaphore in exclusive mode,
>>>>>>>>>>>> this patch moves the per-buffer sysfs file creation to the default work
>>>>>>>>>>>> queue. Note that this can lead to a short-term inaccuracy in the dmabuf
>>>>>>>>>>>> sysfs statistics, but this is a tradeoff to prevent the hot path from
>>>>>>>>>>>> being blocked. A work_struct is added to dma_buf to achieve this, but as
>>>>>>>>>>>> it is unioned with the kobject in the sysfs_entry, dma_buf does not
>>>>>>>>>>>> increase in size.
>>>>>>>>>>> I'm still not very keen of this approach as it strongly feels like we
>>>>>>>>>>> are working around shortcoming somewhere else.
>>>>>>>>>>>
>>>>>>>>>> My read of the thread for the last version is that we're running into
>>>>>>>>>> a situation where sysfs is getting used for something it wasn't
>>>>>>>>>> originally intended for, but we're also stuck with this sysfs
>>>>>>>>>> functionality for dmabufs.
>>>>>>>>>>
>>>>>>>>>>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>>>>>>>>>>> Originally-by: Hridya Valsaraju <hridya@google.com>
>>>>>>>>>>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>>>>>>>>>>>>
>>>>>>>>>>>> ---
>>>>>>>>>>>> See the originally submitted patch by Hridya Valsaraju here:
>>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2555333ba37e41f2ec4408da4efd7fb4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637909147926948292%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=to4ENY8GoofFrTi035VZThY1hxiEVMyIpO80LYpVSVo%3D&amp;reserved=0
>>>>>>>>>>>>
>>>>>>>>>>>> v2 changes:
>>>>>>>>>>>> - Defer only sysfs creation instead of creation and teardown per
>>>>>>>>>>>> Christian König
>>>>>>>>>>>>
>>>>>>>>>>>> - Use a work queue instead of a kthread for deferred work per
>>>>>>>>>>>> Christian König
>>>>>>>>>>>> ---
>>>>>>>>>>>>      drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++-------
>>>>>>>>>>>>      include/linux/dma-buf.h               | 14 ++++++-
>>>>>>>>>>>>      2 files changed, 54 insertions(+), 16 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>>>>>> index 2bba0babcb62..67b0a298291c 100644
>>>>>>>>>>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>>>>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>>>>>      #include <linux/printk.h>
>>>>>>>>>>>>      #include <linux/slab.h>
>>>>>>>>>>>>      #include <linux/sysfs.h>
>>>>>>>>>>>> +#include <linux/workqueue.h>
>>>>>>>>>>>>
>>>>>>>>>>>>      #include "dma-buf-sysfs-stats.h"
>>>>>>>>>>>>
>>>>>>>>>>>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>>>>>>>>>>          kset_unregister(dma_buf_stats_kset);
>>>>>>>>>>>>      }
>>>>>>>>>>>>
>>>>>>>>>>>> +static void sysfs_add_workfn(struct work_struct *work)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry =
>>>>>>>>>>>> +             container_of(work, struct dma_buf_sysfs_entry, sysfs_add_work);
>>>>>>>>>>>> +     struct dma_buf *dmabuf = sysfs_entry->dmabuf;
>>>>>>>>>>>> +
>>>>>>>>>>>> +     /*
>>>>>>>>>>>> +      * A dmabuf is ref-counted via its file member. If this handler holds the only
>>>>>>>>>>>> +      * reference to the dmabuf, there is no need for sysfs kobject creation. This is an
>>>>>>>>>>>> +      * optimization and a race; when the reference count drops to 1 immediately after
>>>>>>>>>>>> +      * this check it is not harmful as the sysfs entry will still get cleaned up in
>>>>>>>>>>>> +      * dma_buf_stats_teardown, which won't get called until the final dmabuf reference
>>>>>>>>>>>> +      * is released, and that can't happen until the end of this function.
>>>>>>>>>>>> +      */
>>>>>>>>>>>> +     if (file_count(dmabuf->file) > 1) {
>>>>>>>>>>> Please completely drop that. I see absolutely no justification for this
>>>>>>>>>>> additional complexity.
>>>>>>>>>>>
>>>>>>>>>> This case gets hit around 5% of the time in my testing so the else is
>>>>>>>>>> not a completely unused branch.
>>>>>>>>> Well I can only repeat myself: This means that your userspace is
>>>>>>>>> severely broken!
>>>>>>>>>
>>>>>>>>> DMA-buf are meant to be long living objects
>>>>>>>> This patch addresses export *latency* regardless of how long-lived the
>>>>>>>> object is. Even a single, long-lived export will benefit from this
>>>>>>>> change if it would otherwise be blocked on adding an object to sysfs.
>>>>>>>> I think attempting to improve this latency still has merit.
>>>>>>> Fixing the latency is nice, but as it's just pushing the needed work off
>>>>>>> to another code path, it will take longer overall for the sysfs stuff to
>>>>>>> be ready for userspace to see.
>>>>>>>
>>>>>>> Perhaps we need to step back and understand what this code is supposed
>>>>>>> to be doing.  As I recall, it was created because some systems do not
>>>>>>> allow debugfs anymore, and they wanted the debugging information that
>>>>>>> the dmabuf code was exposing to debugfs on a "normal" system.  Moving
>>>>>>> that logic to sysfs made sense, but now I am wondering why we didn't see
>>>>>>> these issues in the debugfs code previously?
>>>>>>>
>>>>>>> Perhaps we should go just one step further and make a misc device node
>>>>>>> for dmabug debugging information to be in and just have userspace
>>>>>>> poll/read on the device node and we spit the info that used to be in
>>>>>>> debugfs out through that?  That way this only affects systems when they
>>>>>>> want to read the information and not normal code paths?  Yeah that's a
>>>>>>> hack, but this whole thing feels overly complex now.
>>>>>> A bit late on this discussion, but just wanted to add my +1 that we should
>>>>>> either redesign the uapi, or fix the underlying latency issue in sysfs, or
>>>>>> whatever else is deemed the proper fix.
>>>>>>
>>>>>> Making uapi interfaces async in ways that userspace can't discover is a
>>>>>> hack that we really shouldn't consider, at least for upstream. All kinds
>>>>>> of hilarious things might start to happen when an object exists, but not
>>>>>> consistently in all the places where it should be visible. There's a
>>>>>> reason sysfs has all these neat property groups so that absolutely
>>>>>> everything is added atomically. Doing stuff later on just because usually
>>>>>> no one notices that the illusion falls apart isn't great.
>>>>>>
>>>>>> Unfortunately I don't have a clear idea here what would be the right
>>>>>> solution :-/ One idea perhaps: Should we dynamically enumerate the objects
>>>>>> when userspace does a readdir()? That's absolutely not how sysfs works,
>>>>>> but procfs works like that and there's discussions going around about
>>>>>> moving these optimizations to other kernfs implementations. At least there
>>>>>> was a recent lwn article on this:
>>>>>>
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F895111%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2555333ba37e41f2ec4408da4efd7fb4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637909147926948292%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bjwKigpeAGgDDJWaL3zBDLgaVRRkIE%2BY59%2Be3q0Vts0%3D&amp;reserved=0
>>>>>>
>>>>>> But that would be serious amounts of work I guess.
>>>>>> -Daniel
>>>>>> --
>>>>>> Daniel Vetter"
>>>>>> Software Engineer, Intel Corporation
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2555333ba37e41f2ec4408da4efd7fb4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637909147926948292%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TzraByzC5slsrIrpqxNC860WPXqbanhgjt2%2FIhkWpyA%3D&amp;reserved=0
>>>>> Hi Daniel,
>>>>>
>>>>> My team has been discussing this, and I think we're approaching a
>>>>> consensus on a way forward that involves deprecating the existing
>>>>> uapi.
>>>>>
>>>>> I actually proposed a similar (but less elegant) idea to the readdir()
>>>>> one. A new "dump_dmabuf_data" sysfs file that a user would write to,
>>>>> which would cause a one-time creation of the per-buffer files. These
>>>>> could be left around to become stale, or get cleaned up after first
>>>>> read. However to me it seems impossible to correctly deal with
>>>>> multiple simultaneous users with this technique. We're not currently
>>>>> planning to pursue this.
>>>>>
>>>>> Thanks for the link to the article. That on-demand creation sounds
>>>>> like it would allow us to keep the existing structure and files for
>>>>> DMA-buf, assuming there is not a similar lock contention issue when
>>>>> adding a new node to the virtual tree. :)
>>>> I think that this on demand creation is even worse than the existing ideas,
>>>> but if you can get Greg to accept the required sysfs changes than that's at
>>>> least outside of my maintenance domain any more :)
>>> I think doing it cleanly in sysfs without changing the current uapi sounds
>>> pretty good. The hand-rolled "touch a magic file to force update all the
>>> files into existence" sounds like a horror show to me :-) Plus I don't see
>>> how you can actually avoid the locking pain with that since once the files
>>> are created, you have to remove them synchronously again, plus you get to
>>> deal with races on top (and likely some locking inversion fun on top).
>>> -Daniel
>> Yes, lots of reasons not to pursue that angle. :)
>>
>> So I asked Greg about modifying sysfs for this purpose, and he's quite
>> convincing that it's not the right way to approach this problem. So
>> that leaves deprecating the per-buffer statistics. It looks like we
>> can maintain the userspace functionality that depended on this by
>> replacing it with a single sysfs node for "dmabuf_total_size" along
>> with adding exporter information to procfs (via Kalesh's path patch
>> [1]). However there is a separate effort to account dmabufs from heaps
>> with cgroups [2], so if I'm able to make that work then we would not
>> need the new "dmabuf_total_size" file since this same information
>> could be obtained from the root cgroup instead. So I'd like to try
>> that first before falling back to adding a new dmabuf_total_size file.
> Sounds like a plan.

Yep, totally agree.

Christian.

> -Daniel
>
>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F875yll1fp1.fsf%40stepbren-lnx.us.oracle.com%2FT%2F%23m43a3d345f821a02babd4ebb1f4257982d027c9e4&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2555333ba37e41f2ec4408da4efd7fb4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637909147926948292%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=n0q9VFkEiTkJDMfGxYEMfAJxgyGU0MQ%2BAUDp4drx3Gc%3D&amp;reserved=0
>> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2FCABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxHesrOCsaYg%40mail.gmail.com%2FT%2F%23mb82eca5438a4ea7ab157ab9cd7f044cbcfeb5509&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2555333ba37e41f2ec4408da4efd7fb4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637909147926948292%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=AxWwvx01V9JOsMELzggmQxAjXEai%2BA65rDH6F0ueul0%3D&amp;reserved=0
>>
>>
>>
>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2555333ba37e41f2ec4408da4efd7fb4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637909147926948292%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TzraByzC5slsrIrpqxNC860WPXqbanhgjt2%2FIhkWpyA%3D&amp;reserved=0
>
>

