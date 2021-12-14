Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C726A473EC8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66D910EA61;
	Tue, 14 Dec 2021 08:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C0B10EA5A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5hk1X8VlkNS9dGMRxbpbh99SeMOTOmrEUe32+fgR83b+4PXiIrQq3b8n38TTkfQCa2jXxL8z1LoPynHp6gQRnGqK4lpLOM8tstBIobJZGVF+P3WWyus1xw8xn0gU4yaKHdLIEqJsgkUw73i/N5vrDnUA70DFmjVmnsF603aPe+6dt15p522vIl2fNSK8O4ZZIFhr/OixiWB4k0Xi9qeU8/+HP2JazW+8wQ1XyN9meHG0wv/Cc/5LfI09YaSaCq0q5G4u2sYcAz5OdE2MqcsQL5oiR9KgPfTwXryAYWxn6GKo03I5k+VIsnQSEAZU1w+cePB59cnTYRSIEZHnNLoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4QjqZJxxEXwnjWMthS/5VhLYxHk318ynpG8zZIbfhA=;
 b=aD+UYUC5L3rKRlh19BzbNSYQbyA+UdDUjEGMplp6brxBdTDsC/SD0E89xdRnwgBqla6NYdUDab59dya196jPZKL1LlQI/lVTZnAxIUegXjC81bnmxL1hrMsKgWBwAYy3dXO8jz/RFDSuBSItf6TSDEkAiHlTa9XkWDq0clD9JwsVhag0G8/m2pX5Gxi41g0s0YRhuJG3Mtr7XxpKa3+1B0IY27QKF83JCkvezqWiqMoQGwvT1fXHFbYYmX6NjyRteN35SloXgAwMSHBmpfyvd6sWerdwO4g4tq6niHyVQtrDPTvTwkpMFo6gVafD43pBoEYTjO3WH7BTnsdDzEtHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4QjqZJxxEXwnjWMthS/5VhLYxHk318ynpG8zZIbfhA=;
 b=TpXyxJiI8Dbl5KGHFn17hExQhyKyQBLil6LCK9mjMGKkVOZPV6L13GdpWZPk7j/1vwQInqS6DJdm/eZUNAA8N2R5QU3co0PUnh/g20UXMHpV4/l90EtF0qsvRX3lBT8RRfRa2ZQa/XL2VTLtHSnbAuM03asj3FJnumPNSPdwf24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1678.namprd12.prod.outlook.com
 (2603:10b6:301:b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 08:53:57 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Tue, 14 Dec
 2021 08:53:57 +0000
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Shunsuke Mie <mie@igel.co.jp>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
 <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
 <20211210124204.GG6467@ziepe.ca>
 <880e25ad-4fe9-eacd-a971-993eaea37fc4@amd.com>
 <20211210132656.GH6467@ziepe.ca>
 <d25b2895-63b6-158d-ff73-f05e437e0f91@amd.com>
 <CANXvt5rzmEnF3Gph4U6NT-XzJhV6zqyay1g7dHkTgH=Aqc6Geg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <51bcad64-8df8-b9a3-0aef-d88eb70fdbba@amd.com>
Date: Tue, 14 Dec 2021 09:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CANXvt5rzmEnF3Gph4U6NT-XzJhV6zqyay1g7dHkTgH=Aqc6Geg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0165.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::12) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48504754-f042-4ebd-5184-08d9bedf43da
X-MS-TrafficTypeDiagnostic: MWHPR12MB1678:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB16780CA9FA2D355C5C05C29483759@MWHPR12MB1678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FtiD7LfdK0RmjFlTHgHLvp79R/gIK7FFErAArqNtoEPNDr2i7Tu2icg9iLLZ+NLm1XgOgWdkmyOGR22gnnM5avl7WPzHOcZ0D1kAGJ9km87KwQexk+wJER9hfbWeyREW+Se17UIbvSJqr1VQMpFTr8l4/FE3zCi8VIXsUCH3ZenLz51TeSWOFYSHSzZfBg2vlDW+t9uM2NANVx0ne6ea8lHrRk6+dkQ5+DR1zHKaWgpchv3SwsASAcXmQNkfTdKqET3eyknGFe/nXy03rldwcheVXnRCe4P2VLcnEkEPAgty1r27tKlt7f0uS8JTiX3s3EQKf/LWCNpyevqyg6m3jkzQIeG3QO/xwvz87Jl4mk3UEX05WSM73qaNUw3NaCe5o46fFSb78jshl9xfEMb1qTuKA93q7dTRiR1Ot1UXxgMYXD0MF7yPot16cwDHdGk4WAF2LX6WBnvdP/F+AZh7vQMVeWDs1WPa7CeEg/g7c/GRpfyITaIert1Qv7RS/H6Yx0W4ul7nFKZc5YlHUX2nPnwVocsFxbK39RKK4mxMVLyc4Zg6Bcdg26xVJgmaOTaEZKLY02T4LdJxYTlDIFips3kVfhjS6BWooFF+FEeBQIJOgDSKm6F5c5b1XJtarpa8lP34nSftOtcPUdXspxUzdxLJyu3ZPSiY0lJfGVQyFnshm8w4IupXDDDNx5kZjyTe2uas3xXGi9dIMQbv8oBp1BNlAF4SZiBVVCtR+Xuifkdl/VhPyvGAVgnyBvgDWLr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(316002)(6666004)(66556008)(36756003)(54906003)(66946007)(508600001)(66476007)(2906002)(83380400001)(38100700002)(6512007)(6506007)(4326008)(7416002)(31696002)(8676002)(86362001)(6486002)(26005)(186003)(2616005)(5660300002)(31686004)(66574015)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3pLeTExY3ZvWUNRaTY0NXdlMnRZajFKV1hkdmtDTUxLL2YxTGlGY3ZlN1dr?=
 =?utf-8?B?RjRyRytiZGtaUXIyVFNycGJVOE1lak5lUmdZS21WYzgyc2N3N3JyU0RIY1hN?=
 =?utf-8?B?MGxJRDBmU1BSNTRHZTFOZ0tDQkdnbmlRZ0xFcTJWdnA2UDhFTXJHQkEwMWZW?=
 =?utf-8?B?L2RlaXZLVjEzVldNb05ib3pRc081V0NPRncyUzFDMDgxZEZpNjlIdk1pbVFL?=
 =?utf-8?B?L3h4QzZTR1VSbHRucmN1aUsyY095a2NCckEyME8yWmVSTWZ5dFZNd3Z1YzVI?=
 =?utf-8?B?ZC9taS9tOUJNM3NyZnpqL2h6OHdWTTRtR3dQc21OZTgyd3FlRWd4M3Z0aDlL?=
 =?utf-8?B?T0s0RWhnaml2L2tEQm1BbFpsTWJicmx0VnRwT1FDTlRrNGxZVWNJMnVMRFM5?=
 =?utf-8?B?RVNrcmJFWGhPWWpnRU5jVDBuUEV5OXlrOWpFWVF4RllXK3UyVVR4RVJvcGhV?=
 =?utf-8?B?Z0ViR05mbEkzMkVZblkvRzAySjJzYkdDblJkWVlzSTVyUEVqd01teDBpM3B5?=
 =?utf-8?B?NkhUNStpSEYyUC9Va2REdC9oZDFSQzQ1TXM4UTgvdER5YWRxZUJWbERFVjRv?=
 =?utf-8?B?cXVDNFJic1V3aUdSZVA3NXRrQ1ovalJ6U2R6anhqSGpTcDRPTWZybG5UZFkz?=
 =?utf-8?B?azJ6Yi93bUk4VmREZjZQOXBnRUZnTkc2czhqMEdyWDZjNUZrYmxReVdOWXZm?=
 =?utf-8?B?RWU2N1VDZnZGSlhhNXJlVlJ1L240WkxMTGtma1BYT1BvaTlSZUtrWWZLY0VF?=
 =?utf-8?B?OFUwaFptOU5kQzR3ZkVWT0RqYm1QSkh2cnBRM3pzZnJnV0pKRkxkMzZEOXA2?=
 =?utf-8?B?cTZjeWxjTlFUQWlGeXpyNFpuaHhYYjN2aFJ1bEo1dEhMZ242TGlxZXV5ck9Z?=
 =?utf-8?B?dWlmVjl3OGpQMmdRRk96aTV2bGtjMjVKQTN6K3ZJVzkrQ1NtZkFQMkRCbUMx?=
 =?utf-8?B?ZERER3ZXaW9jYXVOVGlxUlVVdjFmdURvYTdZdlYxQnlLMjFxUnYvRExuZVdE?=
 =?utf-8?B?d05WdjJjdVZoVS8yTzJTKzZEZFRSVHMveFJYYThPS3JIMXl0eUxZRm8xaWNJ?=
 =?utf-8?B?RUZ5bzBYUDFxRmpCcGJaOGtjOWFhZkF1YnFhMDBLbUlLc2R4c3FRcXNJUWRP?=
 =?utf-8?B?MlBrVXo4K2t3UExkNjBIdWJteHo1WWVDQ0tkQWRTYmp6MmwraVNkdUVra1or?=
 =?utf-8?B?cHM4ZTdjb3FOZStRQURSaWwzWDNUU0FVVnRMUzlMQysrcnBBc1NjRVQxdjJB?=
 =?utf-8?B?bkZMMXZRbG8zd0RBZTNIN09RNEM4d2hoY3hrL1BKZjIzcHQyamNGNFJXa0tP?=
 =?utf-8?B?Um9uTHRxTUtrVUFHSVVSb216UnkzSkhxVkJrYWJuQTZjdlI3aThScWl2Tmd1?=
 =?utf-8?B?NDZKWHJmK3ZpOWwwd28rVUtuM040TG5wanlYNzJ4M3E0UkpMd0hvTElnWVFa?=
 =?utf-8?B?MllOUGdFbnQ0VGhBRTBjNVFHRU90NVJGQW9mVndkUGw1Y2dubVNmeTkxdkxL?=
 =?utf-8?B?ZnpHMnc1VlVsNlIvMzc2ZFVYRlJzc0V3d3JUem1ZNkhqZm5zVnMvTk0zMHdk?=
 =?utf-8?B?L0U0bTFpa1lNZzcxMVA5VWxJcERseDh5ZmI1SEptQnNJdlJ5OHg3eXN4SERV?=
 =?utf-8?B?SWZ5K3EvOFhsT1JSaWtpV20wMW5Ka1llTFhkSnBEb2FzR2diZiszSUQvSkxB?=
 =?utf-8?B?ejdTc2wxc2RwU0hGdzd4UkQ1Mk95NzRMNGUzRWZqbm1tTHljZklDK2VMektx?=
 =?utf-8?B?Vy90Zm5CdnlzbGNnK2lSUG9vTFIzd3JZbFUvNmdvcGlZYnRWZThmQTNjMXli?=
 =?utf-8?B?cm9MZldSeUIwV09EQ2FUVXNpNXFCZUE1QTJsSzdwVmRwcERzZ2cwMklRc1Iv?=
 =?utf-8?B?ODIxOEFlWWxBQ2NZb1ErU2JGbUMybWpzTDBZaUFPS1FDNUhGRjVyREJ2QVNp?=
 =?utf-8?B?WU5aU0J6OTlKTEdBOFFSS2JHbG9MTzh5NHhhS1htUlo5d1N5ZzgwWFdzazVt?=
 =?utf-8?B?dkxWYlRtbU5wSlRMMStNK2ZLRHo1Y1JBNmRiSE9POCtnTjZScTAyQ2ZZUUY5?=
 =?utf-8?B?NFdpOXkwSEhib2MzVmRQUEd3ZEtJSlZrZzFjYTBMdmwvSDZNYTFvMEl0elpP?=
 =?utf-8?Q?Dg+w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48504754-f042-4ebd-5184-08d9bedf43da
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 08:53:57.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ScayXQET05Ytt1iHx6H0HVoiilR0QRd2GhVDN0r4KEzHoEE5MqB9f1KRSjmEbnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1678
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
Cc: Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tomohito Esaki <etom@igel.co.jp>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Hefty <sean.hefty@intel.com>,
 Maor Gottlieb <maorg@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.21 um 12:18 schrieb Shunsuke Mie:
> 2021年12月10日(金) 22:29 Christian König <christian.koenig@amd.com>:
>> Am 10.12.21 um 14:26 schrieb Jason Gunthorpe:
>>> On Fri, Dec 10, 2021 at 01:47:37PM +0100, Christian König wrote:
>>>> Am 10.12.21 um 13:42 schrieb Jason Gunthorpe:
>>>>> On Fri, Dec 10, 2021 at 08:29:24PM +0900, Shunsuke Mie wrote:
>>>>>> Hi Jason,
>>>>>> Thank you for replying.
>>>>>>
>>>>>> 2021年12月8日(水) 2:14 Jason Gunthorpe <jgg@ziepe.ca>:
>>>>>>> On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
>>>>>>>> Hi maintainers,
>>>>>>>>
>>>>>>>> Could you please review this patch series?
>>>>>>> Why is it RFC?
>>>>>>>
>>>>>>> I'm confused why this is useful?
>>>>>>>
>>>>>>> This can't do copy from MMIO memory, so it shouldn't be compatible
>>>>>>> with things like Gaudi - does something prevent this?
>>>>>> I think if an export of the dma-buf supports vmap, CPU is able to access the
>>>>>> mmio memory.
>>>>>>
>>>>>> Is it wrong? If this is wrong, there is no advantages this changes..
>>>>> I don't know what the dmabuf folks did, but yes, it is wrong.
>>>>>
>>>>> IOMEM must be touched using only special accessors, some platforms
>>>>> crash if you don't do this. Even x86 will crash if you touch it with
>>>>> something like an XMM optimized memcpy.
>>>>>
>>>>> Christian? If the vmap succeeds what rules must the caller use to
>>>>> access the memory?
>>>> See dma-buf-map.h and especially struct dma_buf_map.
>>>>
>>>> MMIO memory is perfectly supported here and actually the most common case.
>>> Okay that looks sane, but this rxe RFC seems to ignore this
>>> completely. It stuffs the vaddr directly into a umem which goes to all
>>> manner of places in the driver.
>>>
>>> ??
>> Well, yes that can go boom pretty quickly.
> Sorry, I was wrong. The dma_buf_map treats both iomem and vaddr region, but
> this RFC only supports vaddr. Advantage of the partial support is we can use the
> vaddr dma-buf in RXE without changing a rxe data copy implementation.

Well that is most likely not a good idea.

For example buffers for GPU drivers can be placed in both MMIO memory 
and system memory.

If you don't want to provoke random failures you *MUST* be able to 
handle both if you want to use this.

Regards,
Christian.

>
> An example of a dma-buf pointing to a vaddr is some gpu drivers use RAM for
> VRAM and we can get dma-buf for the region that indicates vaddr regions.
> Specifically, the gpu driver using gpu/drm/drm_gem_cma_helper.c is one such
> example.
>
>> Not sure what they want to use this for.
> I'd like to use RDMA with RXE for that memory region.
>
> Best,
> Shunsuke
>> Christian.
>>
>>> Jason

