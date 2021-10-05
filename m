Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400DB422071
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 10:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ADE6E332;
	Tue,  5 Oct 2021 08:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2B56E332;
 Tue,  5 Oct 2021 08:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/uvPlQUywEUVjTtuGeBvCb74/5u8LU7j5R3NoHdqWlbRkJJ+B9nQv7h3gy2aQJOpAmT0ULpAFim+ra7WSh/OW+enmJ+ZX8esShVoShQg+cQIEJpL8dxWXKNaDaPDGzY4tQulVCSRd4hvoMcbmnhMn3gnxnSmRfQz75yl8zDTlxlIdugTo2PY92WDuSCV+NEr3AZk/UAafiCWCPoe/n/Cz0bvuhNtuEVnTFtCtA78wIm5+DEAFmzYc7wtQ6zgS/GKYVNETXZPtPzPEJN15W6sX+MVP/bHexTW1s/lhrRp5j50b/NSiPfJrleUufJ1rRxgCm+a0dQlsWHbGvoeKF5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+bFFU3GtDMEbKY8X8UNu8Fg+BfmjBVGO09QNkacM0o=;
 b=ajpTVH2wxDDcx0DCbPkLf2l0WgCChTo8qszTkNqnJ83IirunaNygKmqzstJbCAgmHxBIUwK2hmcRy5mkJRJN5HDtNtykWQbk5AXbXGnJ4nrgTDCG7qVIo4ulSznozKGpaJpmgjc9FCN0HgIaL3iuOtM9oZSLTpoKZPy22NCaBksa4TMQd6HuHXqYqnRnhoTeexm8Gxf1l324D2MLHE+8oy0Mf4WYsdlYmC8cqGQFmzFORS4yQFXOc3Y+NOHI8mgqO4s8+60VEm7G9tiNgDFlA56lbSIekkziP/3yFwdIsMGQ2eugvX7yme6QRIyGjBid4Wm1v0shr7iF0vkGuWjPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+bFFU3GtDMEbKY8X8UNu8Fg+BfmjBVGO09QNkacM0o=;
 b=wlSxxjMGhmPWlcNwIVpmOqM6Fq34XhSZNFEKvpyhuXWEunM9PWnSX0SKfrZ0BTYgN3xyV5kLu2zdwSEVRNznijBPVejPS0Zk81NMqJT1TVw2VemdJu7sC1vhD2n8Xfvjz2gTX8THHB2s0o43aQfWg+8SSk3Q74lTs96WTeCpyA8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0111.namprd12.prod.outlook.com
 (2603:10b6:301:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 08:16:11 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 08:16:11 +0000
Subject: Re: [PATCH 09/28] dma-buf: use the new iterator in dma_resv_poll
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-10-christian.koenig@amd.com>
 <ef650439-a418-979b-56fb-4cf10f91747e@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e43bc3f9-60be-0f7f-b1a7-3cd2fe1a6289@amd.com>
Date: Tue, 5 Oct 2021 10:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ef650439-a418-979b-56fb-4cf10f91747e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0081.eurprd05.prod.outlook.com
 (2603:10a6:208:136::21) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [172.31.55.180] (165.204.72.6) by
 AM0PR05CA0081.eurprd05.prod.outlook.com (2603:10a6:208:136::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 08:16:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e73777-6a31-4317-6a76-08d987d863c4
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0111:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01114E95B2899FB36ADAB0F883AF9@MWHPR1201MB0111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M8A5+o8o/fKxRMaMSn+nQ1xwVMSXXsZV0MUhDJY9tA3SoenQ4ls//HYaoJXbOvYvNbY9L+Hz3i+I0lXuxRz1Y2bFXnvO37rbHMUU8O6ZyR8Qy1N66ybbuYHNkx638KmKp9uICI7p2o9PeDXJXNlYaC54SGONEFV8bK3RKoORLCdBgLQEZWVerZh05Ah150YJWqUy7AWqAU1MGlvd4TN19NqX2J2bEixIwAhfBes7MA9zCaC5ypmJmKA3KKOIa2/dWGwrRP9tjK6Z/lDzuG2WGoqJYhy5kDt95w2vKlz+O+FvZIFt5tujzWJxQRo0yQVv0qu6KdbSEVpn7zq3dPClYBAbGG1Ls7OpKnEi4cZ8R2BWxc8eYyR2MEOWAh31qcqkGK+PNGAlH9Sm83ifd3pnFggFuYmuHBQsD3QKWrtAvqN0HK/TgMon/2dGW+X3bkkAdQOFEznQh13KlO5YPVoWKttQj/pKCdEFEH3krAm4aS89GUxfoZa0tAKDR5/FsIUADZE1GPM0a4eJ9SbmWfIb2qeWPK4YUEBVL1tSXqnqVQkowbPney4b/kwVbUzKHN5L021o/8JowCkK8glkdt3R6zrDA0DlYoTnmBAtr6utco4NEj8Iibru7Y4vqXoXUAY8US0XISQWpc+7rg42fM6aMGiaI0FDyp0AMVlR5SUonWkmNfGl6xf3CwfUEZQRmxXFYhWgye4pQvzc0vX/kgkxPt5zTKwit3ZpbA/d5XSHLiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6666004)(86362001)(31686004)(956004)(508600001)(36756003)(66556008)(316002)(38100700002)(8676002)(66946007)(66476007)(8936002)(26005)(83380400001)(53546011)(66574015)(6486002)(186003)(16576012)(2906002)(2616005)(4326008)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmJBaDBHdU44VHNWdDZOMjJGUFBKbTZqdGRTVEZuMXJUWmdkS25LakVBRkJS?=
 =?utf-8?B?RWg0UUgvRFU1LzdjUXB1Y3c5eVBsSlE1YWxqblZCT3V3dmJQclZkelJ3U0Q0?=
 =?utf-8?B?UmJRRmVMYks5aUNKQU5PNlArakgwKy9SQTdIK1ZLYkNFekwwWmEyVjNScjly?=
 =?utf-8?B?d1pJUFNVNFZjTEh4MmpaRjU2R29RN1lnZzhQcTFnbXovOTlLdm11RGNGckVI?=
 =?utf-8?B?U2ppdmxHZHRwMXpPem4yZEVPSEJQbXF4NkxCc0RvQklzdmhBRDFPQkg5ZlVy?=
 =?utf-8?B?elducGdBR1FtSmFIaG12Zzh4c2p0MmI3U2ZMeWpDb2JkZlJrOGJBRDNlOCtq?=
 =?utf-8?B?TGdkQmFkeklyR3FzQmlpYTFLQ3pOUnd1ZStCeWNOWEFySlNOQlRFQXRRTzY4?=
 =?utf-8?B?MVNySy9YanRpRHBUa3dVNFQ2Sk9nd0lzQlRoUllYSTFmeGJreXJGNGk1SDlC?=
 =?utf-8?B?YUVERkszSFBmWHU5Rm5uRW1NV3VaRVlsSW0wd016TElPM3dQTjlub2RkaXlM?=
 =?utf-8?B?VVRBVWFFdWRuaEFhbGJieWllUWtwSmd3TnRjNkMyd0hGVnBUMmRITUczeTVH?=
 =?utf-8?B?UWU5U2FqRTRHa1k4eTBCOEoxVFl4ZTNOY212dDBQTzBwcExLdTBsaHcvaHJX?=
 =?utf-8?B?bWhjRnVzdk1RdDFJWkQ4U1A2U01vNDFIQjEvSWRkVDJsc1U5UEpFaFZCUFYy?=
 =?utf-8?B?eHNNYlB2cVYwandVM3ZpYzU4b28zdGQvN2RTRVJFU1cwMVpoMElrTitjNENE?=
 =?utf-8?B?b042NTQ2UWtKNXBxZVlkcHhXU2FBandnQTlXZ2NJWjllbFR5TFVwOHpZQ3lv?=
 =?utf-8?B?STl2R0tESVAyZzBjTnNzd0pXcVpFWlJYRmdvY3hRVy9ySVBVMUhka1VEY3FQ?=
 =?utf-8?B?YmU3ZFVsMzJtMzRFZEpyVnVBSXM4cGVsMFl5ODFCR1o0QklaeEtIdnJITjM0?=
 =?utf-8?B?NUJ6WjF3QnMwRU1GT1poRGsxS3FETkpBUDJwMURtRXpzelZhbEY5MnR4UjhN?=
 =?utf-8?B?d2FhYkh6dU1jVEVGSFk5ZmhpVTh2UlhjUnY0K0M2RVVtc0ZEZVBtbWZKb0h1?=
 =?utf-8?B?VjFCalNDeDN2YUtLWWZvRGp0YkgvTXhLT01SdytlSGJTOVo2U0lHS2VwSTFx?=
 =?utf-8?B?ZERsRGNrbmUzU214WFBCWlZxZ05GY2JRNmZOdk1zWlQ3NmRqVC9CWEtEUVg0?=
 =?utf-8?B?b0lWampXME5kb0QyVzJzdmJnMUVOdGJkeFA4eExCak5HN3B0eUVOZU1VcGE2?=
 =?utf-8?B?M09DTGkvby9SdUV6eXJhMVhlV1VXUGlBdmhZWDNkSm5RY1p0ZjdhdzUxdzdz?=
 =?utf-8?B?ejR5UkdoK2R5N1ltczRLOVhaT1NEL2RaZ3R3MFlTMFBmaExSOW13RGZCZlhH?=
 =?utf-8?B?VjVpTFBtc1NSbitCdmp6M29mSmZ5aUw5Mkc5Nk50ajEvb0JiQzR0RVdxWDlV?=
 =?utf-8?B?TlpwVWRBcll6eEtXVU9yMWp1OTQ2b3lrNk9HKy9tNTVVOEZIM0d1T3d4M2xl?=
 =?utf-8?B?TGV2bElnbjVUdWtjL2VXWU5yenBramRUaXlsMi9mSTRpTzFaa3hPVVZuT3d1?=
 =?utf-8?B?WmZwSHdtRCtFY0EzT1UyV3JZVDlSeDdrc3ZhVnhiSHBEem05a1QrcmRVZURz?=
 =?utf-8?B?TDZLZkdud0pKY1NGdDIzWkNjcFdaZzJPUEU2QTdmbGpYY0JsRkJKVGw2NTVK?=
 =?utf-8?B?c2p3QTlMUjVGL3k2ZC83Z3FFVTJQeU1ETm5XZHg5UExnQjRsTndlZVpvQ2M3?=
 =?utf-8?Q?5/5IMgbsZBfh9h2R06tc569x3UvKntfiHteAPLv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e73777-6a31-4317-6a76-08d987d863c4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 08:16:11.1905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5J4H+op5BTApAn/9aQ/jya5bD2+pPo2x2snz5w6NbCngizFTT5TkHKWLLPuwDnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0111
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.10.21 um 09:44 schrieb Tvrtko Ursulin:
>
> On 01/10/2021 11:05, Christian König wrote:
>> Simplify the code a bit.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-buf.c | 36 ++++++------------------------------
>>   1 file changed, 6 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 8242b5d9baeb..beb504a92d60 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -209,19 +209,14 @@ static void dma_buf_poll_cb(struct dma_fence 
>> *fence, struct dma_fence_cb *cb)
>>       dma_fence_put(fence);
>>   }
>>   -static bool dma_buf_poll_shared(struct dma_resv *resv,
>> +static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
>>                   struct dma_buf_poll_cb_t *dcb)
>>   {
>> -    struct dma_resv_list *fobj = dma_resv_shared_list(resv);
>> +    struct dma_resv_iter cursor;
>>       struct dma_fence *fence;
>> -    int i, r;
>> -
>> -    if (!fobj)
>> -        return false;
>> +    int r;
>>   -    for (i = 0; i < fobj->shared_count; ++i) {
>> -        fence = rcu_dereference_protected(fobj->shared[i],
>> -                          dma_resv_held(resv));
>> +    dma_resv_for_each_fence(&cursor, resv, write, fence) {
>>           dma_fence_get(fence);
>>           r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
>>           if (!r)
>
> It is unchanged with this patch, but are the semantics supposed to be 
> like this? Signal poll event if _any_ of the shared fences has been 
> signaled?

That had Daniel and me confused for a moment as well.

We don't signal the poll when any of the shared fences has signaled, but 
rather install a callback on the first not-signaled fence.

This callback then issues a re-test of the poll and only if we can't 
find any more fence the poll is considered signaled (at least that's the 
idea, the coding could as well be broken).

Christian.

>
> Regards,
>
> Tvrtko
>
>> @@ -232,24 +227,6 @@ static bool dma_buf_poll_shared(struct dma_resv 
>> *resv,
>>       return false;
>>   }
>>   -static bool dma_buf_poll_excl(struct dma_resv *resv,
>> -                  struct dma_buf_poll_cb_t *dcb)
>> -{
>> -    struct dma_fence *fence = dma_resv_excl_fence(resv);
>> -    int r;
>> -
>> -    if (!fence)
>> -        return false;
>> -
>> -    dma_fence_get(fence);
>> -    r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
>> -    if (!r)
>> -        return true;
>> -    dma_fence_put(fence);
>> -
>> -    return false;
>> -}
>> -
>>   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>>   {
>>       struct dma_buf *dmabuf;
>> @@ -282,8 +259,7 @@ static __poll_t dma_buf_poll(struct file *file, 
>> poll_table *poll)
>>           spin_unlock_irq(&dmabuf->poll.lock);
>>             if (events & EPOLLOUT) {
>> -            if (!dma_buf_poll_shared(resv, dcb) &&
>> -                !dma_buf_poll_excl(resv, dcb))
>> +            if (!dma_buf_poll_add_cb(resv, true, dcb))
>>                   /* No callback queued, wake up any other waiters */
>>                   dma_buf_poll_cb(NULL, &dcb->cb);
>>               else
>> @@ -303,7 +279,7 @@ static __poll_t dma_buf_poll(struct file *file, 
>> poll_table *poll)
>>           spin_unlock_irq(&dmabuf->poll.lock);
>>             if (events & EPOLLIN) {
>> -            if (!dma_buf_poll_excl(resv, dcb))
>> +            if (!dma_buf_poll_add_cb(resv, false, dcb))
>>                   /* No callback queued, wake up any other waiters */
>>                   dma_buf_poll_cb(NULL, &dcb->cb);
>>               else
>>

