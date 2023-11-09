Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488207E6C5B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 15:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDDD10E216;
	Thu,  9 Nov 2023 14:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537410E216
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 14:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9eFdoXs+yWhxMBkRp4OyNVom1Snq2g2rq7UUqavj7u3d+Q3gS4txzSESU4hkOujDiz44W41NCSOjtwqEDpPxoMvz0TNtxk1z9atJ8m1NKJkoiF7FmYnnS8x1UqhVRj2LXKuVk14djyd1ZKeUDYmiQ7xnA+bIirEsMeIDepJw2/nyy0CCDj2TEg80AkGGsqOALQwM4fq4SISv1U+S+0Gv8UcBOfeNoKQNjja0NKYkrMe8WXL5Zxu7xsBByN8s9CumqPYcOTh2R/+Zr+fYpW0rohcRoKm3Wxv44OT1sTEuf4K2fFG5UHYO7/spxDMxap9b0dcQURD7ZrIdLJz3I06ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yd7GqgkW9g2QZtivsRIPbdCLlmliLK+ExO9JA766v/U=;
 b=NHrzyUTnPvXyNkcWJ789TAH68Az/m8zL2ieEWq2bhR0hNoHPjRHeEobIDRYkVDYEA7IUg7HxSKeQD0sIvkM9F4wdj6okECQLvgsYtkq3yGQLGQ70cJ63H62ooDfFYUG8qVzw52K76Qq8gUHkFU5mdOT9p3hDBJA3HXgZ0O7vFytUy7iaGQTu751xeKvKp+906dHGJYzpC2NqPkUkpv1A0ixgsl7m552Fnbu6hb2mDmOcChfBIvUEQbBXsx0+c9Bn2BR+qFmwJEARxpi6Pugn2BMkwmjKQRSeNxsS2K7t8nkSahhInKw34ME34f2R/5WZoIKq1AJ5M7AEOXoeREUKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd7GqgkW9g2QZtivsRIPbdCLlmliLK+ExO9JA766v/U=;
 b=X1+hlDkHfEOhYblH+nox/WMKCsaR7M3OPZ3RTHXBm13jva5s9Z8hS8svANAYyFEPzBtlEY3z6Y3hrdRF4ZHLJQHsOXcsILiKuR1Q/7spNOC6mhubnB4RGDOVmmzcoRMn/0g4EYFXDERclreG9CzuLllFJrmuwH5sgMECR5EGNps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6037.namprd12.prod.outlook.com (2603:10b6:8:b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 14:23:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Thu, 9 Nov 2023
 14:23:29 +0000
Content-Type: multipart/alternative;
 boundary="------------CzxCxWr413MoY3saxMAVf8Iw"
Message-ID: <f115fa43-d3dd-4708-ba48-5becdc0aa04b@amd.com>
Date: Thu, 9 Nov 2023 15:23:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 07/12] page-pool: device memory support
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Yunsheng Lin <linyunsheng@huawei.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-8-almasrymina@google.com>
 <4a0e9d53-324d-e19b-2a30-ba86f9e5569e@huawei.com>
 <CAHS8izNbw7vAGo2euQGA+TF9CgQ8zwrDqTVGsOSxh22_uo0R1w@mail.gmail.com>
 <d4309392-711a-75b0-7bf0-9e7de8fd527e@huawei.com>
 <CAHS8izM1P6d8jgyWE9wFJUJah2YFsjHP2uikDwA0vR=3QA+BXQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHS8izM1P6d8jgyWE9wFJUJah2YFsjHP2uikDwA0vR=3QA+BXQ@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 12264cc1-52ac-4fe6-ca76-08dbe12f71ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jd4eYb4QVgfjno0MNZPdOOCfSq6lNGHb09TFzdlubP/5qRBOy5kL4B6wKJ+l12U8gpV4YJbxJlTk4L9CEnI5kanC5Usi2SJBU1YpHxp7gOqsrU4HqmW774szY1wocZqlehHkBMewePY2J/2oK9Jqetb/O5VVZj/A1UTPKrfZ5RejljxH82nReZVER+OGUbpClWa4MkVIUrGuXl72zVvQdztyPYDbyienZ8Q4mxGa4vg5k6sPacSWhgZ4Xn2sVe1EJ8OG/YufUGmPQB4FKHJ+SgVKSTeW0yILDEThY0djCsrcu5GiyvFFdnmfcpw0LHm+tzf6kGlUcyIbxMfdvebyKKLUCKxCNqavabQpslklLrQubYRsStmCzu/rabb1aVcYyiAvtvaYA5kErY63Vx52vqHlHaiHqN0bGSYXbyXnDqMlU5PBX5Qhoz48ZOCKYHtlc4Qr+1+sdNAKbmD91iH4CDoSRLq6/1qOymEN4ldoWR3dyX243m+VrJ67Y4x/l47XTuC/FN7kC/54inAL8n7hJBODg32lP76sBMikKc6U8bprRrbnpinrntkDxd5mTQziMMoIQYam9D3g8qFcJ0ReoqGmwo/bWjO2xQkEZ8EHKY5VOf9MEC6G3ZSanjbzePey6sk0axsmxZv22dKD1DpzlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(110136005)(83380400001)(6666004)(41300700001)(31696002)(6506007)(86362001)(6512007)(33964004)(2906002)(36756003)(6486002)(478600001)(7416002)(38100700002)(26005)(2616005)(5660300002)(8936002)(8676002)(4326008)(31686004)(316002)(66556008)(66476007)(66946007)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1AyNThuWHRMdHBQZUFpNGRqME1tUmp2RVdjOFNjazhNNTVYRHdRWDErRGxS?=
 =?utf-8?B?Sm8rVFNqcjlUbmo2WHlxRzJLcU03NmhGUUdCSlNlZ2xVeHl4cU1XWi9wYU92?=
 =?utf-8?B?VGRYZ0NvM2tiVkFIbElwOTM3MTFnLzdoY3BPUzJQajhjVHpyeTlrQnJKSS9a?=
 =?utf-8?B?c2JTR2FxZWxvZDUyOVR5d2lKZm4ra0RZOWZzS3kzM2E3WnhxY3J5QWgwU3Fi?=
 =?utf-8?B?MGhZVnJYckpNNnlpT1F4Q1JQN2gvSWhMWHlSRlZ6VU9aRHIrTTFYNnlmOXRF?=
 =?utf-8?B?Q0p2WHE0SEdvSzFoVGUzbmpOQ3JiMVBOOTByRzNrU0ZvWTJ5eEtWUVJtdUtR?=
 =?utf-8?B?Z1JBTis4VnNaUWdnYVRnL0xIbHMvNVpzOGNMN0JhTG1GOUZ5dTN0YWZvUmJP?=
 =?utf-8?B?aFBrU3NSZEZkK0VxV2lXMGRPQVJLU3pib0M4UGNMaDlUS1BlVWtYWENydTRq?=
 =?utf-8?B?SW5rWHUxL2lDRU5MTHdQazh3Y0pmTWM3M3F4VkIzb3puYUlxVVhkZHNKa2Y5?=
 =?utf-8?B?QVB4MXFVcjVaTzlwTWFnd0tGWW5pbVNsdTdRajZVUXFTZTZYKzllVkUrUFoy?=
 =?utf-8?B?em1NajNzNzlwRzRkUTIrWFB2M21OV2oycDZPblV2VTJuOGo4Z2FnTUFsb3pC?=
 =?utf-8?B?elhhZ2I0bDJYeHdBbWZKaDNkYldxRmEzV3E1OUI1TEhOdC9TSlAzUjMrRzd5?=
 =?utf-8?B?OXF6MXYzZ2JBTlI1ZWxZTU1Sa1hlQmY4QjhGcmh6bnY2bFVGUzFTaHJEOUhP?=
 =?utf-8?B?T0F3bDg2emlJYk0zc0lWQjRYV1hueHppdXJrT0ZGdE5UL0ZoRWNLNHY5WmYz?=
 =?utf-8?B?TkNkZExaZzNKVHFhcUg5dXNPM1hrR1lPZ3Z6M1BNRWNHWEpDTW41aWZWODRN?=
 =?utf-8?B?a3kzOUF2RUxQY0oxNmc5Rnk5MjFVRy81bXc5WVgwUGdUenRybDZjSlhPa3FB?=
 =?utf-8?B?OGREQ2d4SXVlcXhreEYzSmtmbTRpcm5pNFRrUzBxQXh0dE1la292cXpZcDNT?=
 =?utf-8?B?RDNKZlEzQW5sckFBWTZjTnIvTm5zeDdMcGk1M0NrcmVucnAxUS84Z1NGWVRM?=
 =?utf-8?B?cUtBNGtCZDF5ZzJLckIvRnEycDZRczQxaHA0eDVFd3pDanlUM0lkc3JjYXk1?=
 =?utf-8?B?b0V2M0J3OVdBY09QdEkvdlhxeFJIMEVReWE4WmlJYm9oWWVzZkFVWXQvZmVv?=
 =?utf-8?B?YVc3QmFUOTFMS2VVa3A0TGFUS2FNc3ZiRXdZek9rbFNCTm9sY1ljMmt0VXlt?=
 =?utf-8?B?YmlHUkV2ZXo1RVBqK0k0UWd6QU54S0VMenNkN0dGR3FQRUN6TlVLMi9jZ3BF?=
 =?utf-8?B?TTY0WndVamJ5M2NxVUVCZVRIWFRJUC8vaUN1S1I0am9Cc1NlMmYzSzFVMHRC?=
 =?utf-8?B?THNVTTRzOXNyQUNiYmRkNWdQYk00QzdLQ0trV2tvK1ZvZkxhZThITWNleTRJ?=
 =?utf-8?B?WmpZNTVtQ3dWbTZJSkkrWjBxa0tadU5ET1lJc3U4QlA0QXNLRW1CNEpic2VL?=
 =?utf-8?B?bytCd09CUS9NUlI2QmY3Wk5sM01ncUJwME9PNnhiK1ZEOVE3NlIyYlFVNmkr?=
 =?utf-8?B?VCtwbnozYUY3L21IWTV4VFpWWlk0YnZrOEYzSEpDeHFvY3U1N293a1I4MXA1?=
 =?utf-8?B?VkxGa29TWWI0V2RlSTN6K2I4cmlOTFRMQXVvK0VhY05DMHhMM0FlV0RDUWwx?=
 =?utf-8?B?cXpGa3VuRG92Qy9HN3A5Z0o3UkZOcVBQQ0ovbSs0NEpoZnRZTSs2THgvZnY0?=
 =?utf-8?B?d0hER2t3Q0hwNnNBWlcwenlVWXU2WmdOQXhMSmNIUHRsRWNMNTQwamI0Wmsw?=
 =?utf-8?B?TnRwZ29hbUNCTnVqVjJGMC9qelpDVllZd0IwL2pPSVVlMXNjSmJhYjlzUXAr?=
 =?utf-8?B?RFA1VXhuWkhaSTFGQ2tselB0VFhoSkh6aExlSWFQSHFIOU53MTBZV2FVczFK?=
 =?utf-8?B?MmZ1Q3dPc01tZHdLN3BNVHg3NC9yMkcwdVE3UjlBWmpGaTZSeWJTV0szV085?=
 =?utf-8?B?RmlmZTUrYWhYQVo0SnQ3SDV1THVnek9ua1AzNmlMbVREZVFoWitRRnE2R3VH?=
 =?utf-8?B?UVN0Nkd0bnRmd25XeHJvOXdjUTBSK1pBQXIzV3BCL1dOaytUTnRKRXE1ODla?=
 =?utf-8?Q?P5/U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12264cc1-52ac-4fe6-ca76-08dbe12f71ec
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:23:29.6196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVzvzH6etZ7ji3pbJabVP/k92pLatu1icxxQR+svRhXfENxrZgws1cEpxlM3XJi7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6037
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>, linux-kselftest@vger.kernel.org,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------CzxCxWr413MoY3saxMAVf8Iw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 09.11.23 um 04:20 schrieb Mina Almasry:
> [SNIP]
>> But we might be able to do something as folio is doing now, mm subsystem
>> is still seeing 'struct folio/page', but other subsystem like slab is using
>> 'struct slab', and there is still some common fields shared between
>> 'struct folio' and 'struct slab'.
>>
> In my eyes this is almost exactly what I suggested in RFC v1 and got
> immediately nacked with no room to negotiate. What we did for v1 is to
> allocate struct pages for dma-buf to make dma-bufs look like struct
> page to mm subsystem. Almost exactly what you're describing above.
> It's a no-go. I don't think renaming struct page to netmem is going to
> move the needle (it also re-introduces code-churn). What I feel like I
> learnt is that dma-bufs are not struct pages and can't be made to look
> like one, I think.

Yeah, that pretty much hits the nail on the head. What was not mentioned 
yet and you could potentially try to do is to go the other way around.

In other words instead of importing a DMA-buf file descriptor into the 
page-pool, you take some netdev page-pool pages and export them as 
DMA-buf handle.

All you then need to do is to implement the necessary DMA-buf interface, 
e.g. wait for DMA-fences before accessing stuff, when you have an async 
operation install a DMA-fence so that other can wait for your operation 
to finish etc.. etc..

This still doesn't gives you peer 2 peer over for example the PCIe bus, 
but it would give you zero copy in the sense that a GPU or other 
acceleration device directly writes stuff into memory a network device 
can work with.

We already have some similar functionality for at least Intel and AMD hw 
where an userptr mechanism is used to make malloced memory (backed by 
normal struct pages) available to the GPU. The problem with this 
approach is that most GPUs currently can't do good recoverable page 
faults which in turn makes the whole MMU notifier based approach just 
horrible inefficient.

Just giving a few more pointers you might want to look into...

Cheers,
Christian.
--------------CzxCxWr413MoY3saxMAVf8Iw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 09.11.23 um 04:20 schrieb Mina Almasry:<br>
    <blockquote type="cite" cite="mid:CAHS8izM1P6d8jgyWE9wFJUJah2YFsjHP2uikDwA0vR=3QA+BXQ@mail.gmail.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">But we might be able to do something as folio is doing now, mm subsystem
is still seeing 'struct folio/page', but other subsystem like slab is using
'struct slab', and there is still some common fields shared between
'struct folio' and 'struct slab'.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In my eyes this is almost exactly what I suggested in RFC v1 and got
immediately nacked with no room to negotiate. What we did for v1 is to
allocate struct pages for dma-buf to make dma-bufs look like struct
page to mm subsystem. Almost exactly what you're describing above.
It's a no-go. I don't think renaming struct page to netmem is going to
move the needle (it also re-introduces code-churn). What I feel like I
learnt is that dma-bufs are not struct pages and can't be made to look
like one, I think.</pre>
    </blockquote>
    <br>
    Yeah, that pretty much hits the nail on the head. What was not
    mentioned yet and you could potentially try to do is to go the other
    way around.<br>
    <br>
    In other words instead of importing a DMA-buf file descriptor into
    the page-pool, you take some netdev page-pool pages and export them
    as DMA-buf handle.<br>
    <br>
    All you then need to do is to implement the necessary DMA-buf
    interface, e.g. wait for DMA-fences before accessing stuff, when you
    have an async operation install a DMA-fence so that other can wait
    for your operation to finish etc.. etc..<br>
    <br>
    This still doesn't gives you peer 2 peer over for example the PCIe
    bus, but it would give you zero copy in the sense that a GPU or
    other acceleration device directly writes stuff into memory a
    network device can work with.<br>
    <br>
    We already have some similar functionality for at least Intel and
    AMD hw where an userptr mechanism is used to make malloced memory
    (backed by normal struct pages) available to the GPU. The problem
    with this approach is that most GPUs currently can't do good
    recoverable page faults which in turn makes the whole MMU notifier
    based approach just horrible inefficient.<br>
    <br>
    Just giving a few more pointers you might want to look into...<br>
    <br>
    Cheers,<br>
    Christian.<br>
  </body>
</html>

--------------CzxCxWr413MoY3saxMAVf8Iw--
