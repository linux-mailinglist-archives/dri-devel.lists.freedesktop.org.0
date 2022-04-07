Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56344F7E5E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BEA10E9B5;
	Thu,  7 Apr 2022 11:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5B210E752;
 Thu,  7 Apr 2022 11:48:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvVJPasZYX1rHDdNFWzgyoj3QJQVWVdFsh2QRfctPSPQZjMModgaxuPtuV3DAC7vf39efEG/b2Y0zpsvJERKuIj19GTUFRORRS0IGJWIcRrI3ZFLoCKMno9WNbMYlEXweWSwGuKvBk1ckiVGEotisOmxvj8fzw/lkmJ2fN67/Tiojq9utc/yzBRJuq6h5hOweQ5eiQEZXF9wZ7jifrQKbCKn87U0zHGix550ljrrjG2bkasQv41ydTEfFsryxn9JiwvKZjDnZUuVCkI/fRYGAmzgSb5hZWLNwP6AQlb9fAycFnK2ANvCNJMisS6baEitj944CTjQEEg+1EmlzCKUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tBYqNTQ3rhkv+kRsfDpV6bH79EabTtZ3xzN5ausHYc=;
 b=Wn3nx79+gTPfgzENz7jT7IkwFqtZ8XxJJTFvHsLJVjUS6mFWio4mj1xKAMYpngH4ir1jdFPgnM/ReUVnALAr1TTUYY5ohbzLJ532URWbjP/vlfRwJu29cZTC2ZdEh9PiD00mC013PmjfZud4aGI4kawnh9fkLqDR/Tu33IgkcbVAD5oMk/1E0toMJxNE+ghGS5TjmdkHY7Mj1HNLFjvC0x+wNv8o1laLl4+qC0eG6IUkmrOGFRv3OAEBSWqOKUIe+F/xHHMWFkxEF9IryeXfIB+iVHjsEDUerkdgGOgqBUaAtkHtCKoCcXaR39XVlOsVdzC/skJwA/KaHMkti5XfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tBYqNTQ3rhkv+kRsfDpV6bH79EabTtZ3xzN5ausHYc=;
 b=Va2ylq1tUkGiel8eo+73te8ZDr8QoreN/aAolT9poFESQqkUqQjqk7yMabmZ7sqMgo/ddsDed2YrowEDpV6ATb7AE7ZeFVPi0JWxfijAevRxKy9Bq8SmOWzV2DDusli/e4j3Eka3RrTdnSAXBCe4Kfkh0JugiwQZ5V21Ve0jIAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3541.namprd12.prod.outlook.com (2603:10b6:a03:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 11:48:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 11:48:51 +0000
Message-ID: <aa19b3ad-62d7-3ff2-4b28-5d34fc6120de@amd.com>
Date: Thu, 7 Apr 2022 13:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 15/15] seqlock: drop seqcount_ww_mutex_t
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-16-christian.koenig@amd.com>
 <Yk6spNv/zSCB2ewe@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yk6spNv/zSCB2ewe@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f9bdef4-d6f0-4d37-1a87-08da188c955d
X-MS-TrafficTypeDiagnostic: BYAPR12MB3541:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB35413292ABA7FA1673E78D4F83E69@BYAPR12MB3541.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MvrNIVQvQ3KDCXkwPvx1HY4YOui4VhBS0+vqj4shK0JaJ6l8WPCa6tdd51zP0TfdogmhFoNzFOAssI/hWr6pSszX1G6T0SieSQioxXExQzfbLgIf/2e3vetJ44vb9iKvqxaO303ygfberQD6wNS7nJ2zqU2sXTbnIMb9JyXH414BHZaTiBm/EtuG3/Bj4kRnNRekBQuhMtlFtokZVggwCb5LmitWHYiF8Pczgp2KEDZnSamP4Uj8qTx5sqtQsejYnCgMMjlVR2Eswy12NCOC40r2DDgKdt611StC6gqcJ3EibuRn3x8sW0XAhwIqwZDE00uZ6dbKQ41vhkYLIGDFYge+xmR0e9mGGsghzUnJkR/NTsTp8r2kNQnlGO6xBwGcmFHMueO9ajZ3V8FkXsZC2ZzIoE8Kujm337TyBqeXcxiBIlLAEmdYkgzOtWcZO/100sLCIvfCDXHkrBEoo5iFP++jm7wHoRS7uertintRUOw5OQfrXpM8yNjvftT109FDwb4/heA43XXgNI5yiVzwQ/nZZm2q7XJM4ATdCdQWBYA9HyfeQyU489Sfq/ko2GinUx0v5MeKH0ouDHg9envkKTsWY1FzlonYEhAaHCSdVBkV1AzAMnXdtpzmnU19Mjb7N0khSHBHQ/sbWzzuepP0KZpAauIaWPnKu34998MELrSZnROYo0kxgPcp+NHhqu6ZfLbHeaoiiraRwiRp4FQcugt0/Al6XYySLgugdmKbRkbsvYLRYhxQ3PRGVdJ6P/S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(2906002)(508600001)(86362001)(6486002)(83380400001)(6512007)(38100700002)(8676002)(66946007)(2616005)(921005)(36756003)(66476007)(66556008)(26005)(66574015)(7416002)(5660300002)(110136005)(6666004)(186003)(6506007)(8936002)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0xLcGZJRVNjYjJEZFlsZzV3dkQyVW0wcit6MlNGTzdORXNiak96eFl4Q0t2?=
 =?utf-8?B?YVRMWkNER3hsaFU0UFBjU01HUERITmNHaXMyam9adUZpNHpJeC8wNVB1MEtx?=
 =?utf-8?B?bGg4NEFXa09FbEZ0UVZmcTlGUldTbDZhK1hLRjIwNHgrTmZacE1VZEJEdHFx?=
 =?utf-8?B?MFJBODJBWldMdGNHU1E0TlorbFNKZEEzcUlzSks3N29PNWd2TjdRYmZFTHB0?=
 =?utf-8?B?dm9XMDJ1S0RHam9FU0tka09WWlJuNjd1TDRSTktzL0M5QkV0b3BIdFhwQXZX?=
 =?utf-8?B?Zkh1d2hrVXNtamlQdTNPL3JZZGl6dHh6aURVZ245NkVlYTJ2c0pXMHBBdFNh?=
 =?utf-8?B?ZzRUWG9mWkh5Y3RMSUVBTk1valgxSkFiVk9EdUgvWU1lQ3pFVjNOdlJma2JH?=
 =?utf-8?B?WU5IVEFnWGl6NGFJakpZcnNEU2xMUVJDL2p0SS9QMU56RDF5d0ZtUW5PcDdD?=
 =?utf-8?B?K1JYWEhaVFJ1NzNJVE9YRCtTVW5yN0d6cGRHaVdjc2szVlBWZFJIYXEwd20x?=
 =?utf-8?B?ZCtCMmU0ci9TUCtId2ZPSkJwT1dkYityWE5MbTVZQmRLd2dWbldiTmdrYXdj?=
 =?utf-8?B?WnlHbkM2dFlFTFJ2dXhhNGtqdmE2L0pNenZ6Um92SGN5M1ExMzI2bmM2V25x?=
 =?utf-8?B?cE1MemU5NGdzclF4U0FkbkJrU2h1ekcrYXJYVndnTzJMdkRUNVovK0J6WHVr?=
 =?utf-8?B?amZXMUV4RlZDaGdkd2VoaGV0Y2FubEV5WTVOUEl4dFp1WXVJOWg3dDBIUENq?=
 =?utf-8?B?d3paWTQzVTRkY3FBejBoSmFoelhjRit5NGdXRHZzSnhtNndyMVFPbUdzTUJK?=
 =?utf-8?B?Zzl5RTZpZWZWdlJzVDQxbGI2OTJIcWFHTkdNZDRrRnRvS2Q5bGNUZzZsYytS?=
 =?utf-8?B?RnVIeGlaNW1teG5GQjloYzZPTEtKQlkzWE5xSm5hM2ZrVUU0M0thRVVrUExk?=
 =?utf-8?B?TTJVRXF5dlV3T0Z3bDBSSWVWVnowOS84WWdvQ09oMjRRNGZpRlRZZE83RVpl?=
 =?utf-8?B?UFhVQWF4MXhBc0pjRFNpRWJmYUNWNjd4R0I3S1NzNEVzd05Pd2JhamVuTGs5?=
 =?utf-8?B?TjJvUXlvcmV2MXA1YUdzN3gyNkxBODRkeFlPeHc1dnFINzZqZDhTQmwzN0ZD?=
 =?utf-8?B?UUUyb3c5c0YwMXhvbldxOWxZalUrUHovTThsVFp5NitMbmtmcTBIVG9GMUZQ?=
 =?utf-8?B?Y2FvbWhXelVYbkZNK3RKZE80UFNuL1B1cnpQdnRIN29vZTVhWC9TdmZZSjBL?=
 =?utf-8?B?K3grT3Rabk4wWjdMNzIwYjd0UTVFWEZKcHFFdDBucnc5U2pCWHJjc0dLaFpD?=
 =?utf-8?B?bzRuRlNHcllmZjZ0RjFqbWRGRDZYcHhYZS9aY01Nc1kzVWVhL2ZqbGtHSEtY?=
 =?utf-8?B?YkhJenRseUtldmljZWQxRjU3NlFyeVQ0b29tQXZvUWoxcElxN1FNU1EydnB3?=
 =?utf-8?B?TDdLbzlleGN3ZU9aM2dNeEJRbzRwTUlidXVGRlVTcUkvVUhQSzJkbXdackFi?=
 =?utf-8?B?RjVyWU9kdUc3RkE2NmxmUXcvRXhrdTVhcklSdTVicCtSMFk5RTZNV29md1R0?=
 =?utf-8?B?WE9EOWpZd0Z6Yk9xNUI1d0lYcTExSUY0aWtIK3JvVFVWT3VVTnFnVHB1UXVF?=
 =?utf-8?B?aFVZYzFHU09LN1NqTmJHMkk4alJHZkhRUXhtUitkNi8wbzQ1ZDdBODdlOGJu?=
 =?utf-8?B?aGs0MGdrUWo1RytLVzg1MmtpRTlmNXdPcXd3cW1vamFsalczU0lsdnZCMXlP?=
 =?utf-8?B?U285Um9pdENlRG1TZlhEYWdFMTY4VUtRbEI3TVZwZmdwYzBaSlZuTURnbERG?=
 =?utf-8?B?bjl4L0tHdmFNU1dRN1EzcDFWbTdOMWtEZEhOeTlTNmhrTFZoN3FqeWRMOFBv?=
 =?utf-8?B?UERGeDdQVVFJNXJvajB4NjVtSHdwdkZOZU1vYWJ5YVZhZ08yNW9mdnhqYzVY?=
 =?utf-8?B?ekMvbDE1Z1NGdERzNXgrSzlQZXp2UXFLQk0zVWthU3ZpU21DbHlmaE1pbENQ?=
 =?utf-8?B?ZG9HQ3VKQ3Q3Q2NvdVh4SHBiTTQ1TmZLTndDWEhVMzJ3U1dFZDZEM1Ryb3lG?=
 =?utf-8?B?c21mNGhKbzI4UHJSY2RtOTVxU1h4cVMxYk9TZTlBeTdYZXk4TmtyNDEzZncy?=
 =?utf-8?B?TUlYOCtqcVNuZ1VMQWlnMU9uZklKaXhLeFh1RDlTUTFLV1BRVllydDlnOUtp?=
 =?utf-8?B?Y0Njcmd4NDROOEpWR1dHY0ZjekVpOWxlSktqVFJlU2phVnRqK1Z2bDg2dHFv?=
 =?utf-8?B?VW4xYjE4KzZyOUFUMVY0cmJDYVJVd1p5aHdkOXFMZStVUzhEZS80d0pxbXoz?=
 =?utf-8?B?OVR4MHY2ZnFMUDNKWXU0aTN4MzZ2Tk1uKzNoVmQ1SFZzcTFRUDE0dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9bdef4-d6f0-4d37-1a87-08da188c955d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 11:48:51.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3yM5GyDL22UCQl1gRQ5E1AgyxdOfxFLigyPhacgH6rgZQp/e3FfKP9M6r9GBAgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3541
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

Am 07.04.22 um 11:19 schrieb Daniel Vetter:
> On Thu, Apr 07, 2022 at 10:59:46AM +0200, Christian König wrote:
>> Daniel pointed out that this series removes the last user of
>> seqcount_ww_mutex_t, so let's drop this.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Waiman Long <longman@redhat.com>
>> Cc: Boqun Feng <boqun.feng@gmail.com>
>> Cc: linux-kernel@vger.kernel.org
> Yeah I don't think we'll ever need this again, ww_mutex aren't common and
> the ww_mutex+seqlock thing wasn't the brighest idea.
>
> Peter/Ingo, assuming you agree, can you ack this for merging through
> drm-misc, or want to pick this up later on when the last user disappeared
> in Linus' tree?

Mpf, I didn't noticed that removing ww_mutex.h from seqlock.h is causing 
a problem for futex.h.

Just send out a patch to fix this because the build servers are pointing 
out now that drm-misc-next is broken.

Please review ASAP,
Christian.

>
> Cheers, Daniel
>
>> ---
>>   include/linux/seqlock.h | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
>> index 37ded6b8fee6..3926e9027947 100644
>> --- a/include/linux/seqlock.h
>> +++ b/include/linux/seqlock.h
>> @@ -17,7 +17,6 @@
>>   #include <linux/kcsan-checks.h>
>>   #include <linux/lockdep.h>
>>   #include <linux/mutex.h>
>> -#include <linux/ww_mutex.h>
>>   #include <linux/preempt.h>
>>   #include <linux/spinlock.h>
>>   
>> @@ -164,7 +163,7 @@ static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
>>    * static initializer or init function. This enables lockdep to validate
>>    * that the write side critical section is properly serialized.
>>    *
>> - * LOCKNAME:	raw_spinlock, spinlock, rwlock, mutex, or ww_mutex.
>> + * LOCKNAME:	raw_spinlock, spinlock, rwlock or mutex
>>    */
>>   
>>   /*
>> @@ -184,7 +183,6 @@ static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
>>   #define seqcount_spinlock_init(s, lock)		seqcount_LOCKNAME_init(s, lock, spinlock)
>>   #define seqcount_rwlock_init(s, lock)		seqcount_LOCKNAME_init(s, lock, rwlock)
>>   #define seqcount_mutex_init(s, lock)		seqcount_LOCKNAME_init(s, lock, mutex)
>> -#define seqcount_ww_mutex_init(s, lock)		seqcount_LOCKNAME_init(s, lock, ww_mutex)
>>   
>>   /*
>>    * SEQCOUNT_LOCKNAME()	- Instantiate seqcount_LOCKNAME_t and helpers
>> @@ -277,7 +275,6 @@ SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    s->lock,        raw_s
>>   SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, s->lock,        spin,     spin_lock(s->lock))
>>   SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, s->lock,        read,     read_lock(s->lock))
>>   SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     s->lock,        mutex,    mutex_lock(s->lock))
>> -SEQCOUNT_LOCKNAME(ww_mutex,     struct ww_mutex, true,     &s->lock->base, ww_mutex, ww_mutex_lock(s->lock, NULL))
>>   
>>   /*
>>    * SEQCNT_LOCKNAME_ZERO - static initializer for seqcount_LOCKNAME_t
>> @@ -304,8 +301,7 @@ SEQCOUNT_LOCKNAME(ww_mutex,     struct ww_mutex, true,     &s->lock->base, ww_mu
>>   	__seqprop_case((s),	raw_spinlock,	prop),			\
>>   	__seqprop_case((s),	spinlock,	prop),			\
>>   	__seqprop_case((s),	rwlock,		prop),			\
>> -	__seqprop_case((s),	mutex,		prop),			\
>> -	__seqprop_case((s),	ww_mutex,	prop))
>> +	__seqprop_case((s),	mutex,		prop))
>>   
>>   #define seqprop_ptr(s)			__seqprop(s, ptr)
>>   #define seqprop_sequence(s)		__seqprop(s, sequence)
>> -- 
>> 2.25.1
>>

