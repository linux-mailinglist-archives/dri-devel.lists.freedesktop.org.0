Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3930E4F15F3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 15:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0368110EF4E;
	Mon,  4 Apr 2022 13:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1509510EF12;
 Mon,  4 Apr 2022 13:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSzEbpDs09C8lRDMzOBzHmzUOf0fQHgFRtJekc/rqrHfsQsmfJELpFPBWuvGIViR0xpKW+fJx/vBucFHK9Obwvx7NRcyDLj47pBQFuY95NN6O8FpeoNkSqNZg2KaKEGZsoSN/eqrSjMDfwjxYtvoEVNXbb/fD/C8oiG6OKqwtE1rGAzPEdTHKx8D4v6XfYiVeRUtOXq7vzBkruySeWoQS27kPQYsRRimHvrpHIHSb5A0ySIPkwxG3tsGe4tXjvOhsl+4j0zalk5QDm3u9RuhLAhSYWXNDRJ4FXwo+sHR+0qHyaQH5XGC6eliYPEz3Ftmgej3mM0BhI42t6Pg0Bj7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AIzhDNidku6fGWgNkFQrXLe1+ggc9/R3wn5HLrI/BM=;
 b=GO8szvQyD/slgW4TxxEwxiSkPNsoUMIzKEkzg4+5h8z31SPqylvQqptjb9FnP8e9RDZwTbImuOVf7a6JiM2ysUwgvLtWCYy6bV7Sep59Xe+zCFPeBLAeV8fj5eFst2ItaPrXnx/FXKuFPuxmDcgFe/AtaBbHIrq9GJwvwAkdfDagxnzC2o6z92qUrsLHz6wqodpMOmGl/ih+9fSCnPO3z4JEp+oYkJHXvc+33uFzyeV3SuVm8zx8oZ9G1VI+jeyrtouK51SaVBVKeWPYt+ZeiHTb8GUUNVSeNGnyzhAiPvTtRq8DpDa05AwSyMXfzj2bchJ6AHs4WpgKHCv4+RKTzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AIzhDNidku6fGWgNkFQrXLe1+ggc9/R3wn5HLrI/BM=;
 b=VeFdY1jopd4BSddWOQviMK5rG+tkprYdfwC9iaZNHPCXiTMQ4guCNLukJUTEQn4Zt1ZXkpOYp7TzOBVLFAFFTVgc4ZZdHymXSR6/9As4ua6nJtIAeJlFfC5vd77/NJUQIx3Mb8hE6ikox2eMv/tlD76Y73yROm6GQJv6mYytDmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 13:32:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 13:32:23 +0000
Message-ID: <e366d2cf-c460-58dc-09bf-118f85b0bbcd@amd.com>
Date: Mon, 4 Apr 2022 15:32:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/4] drm/etnaviv: Don't break exclusive fence ordering
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
 <20220331204651.2699107-5-daniel.vetter@ffwll.ch>
 <CAKMK7uHfq1GSfG60KHEQmYi2DtJwGA+1UL+2F-jrVoQx1zas5Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uHfq1GSfG60KHEQmYi2DtJwGA+1UL+2F-jrVoQx1zas5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0272.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7c8499d-f3b5-4f6a-dd4e-08da163f8cc8
X-MS-TrafficTypeDiagnostic: BY5PR12MB4179:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4179E1FAB3DA75F3A37EF0A183E59@BY5PR12MB4179.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZYbJ2ecljP0jX82OdvViObJ3pVV7hofBHJlbf//cQZzooyfkJ3ZGndKiQf+81S45DBgwXx1/7rXyJCNb5VjrT+2dhY83rsXMyOGQulhGT+NkcEm+YgjnQxZinZzpCeKEyLYVXhhKL1mIeWfRiS5mAs1BAQxY/tTyg/drsWkFjYzA1I53yvxRXOsewvk2qWbh5UAK7IuPgSZ1E18VsS7i9LSmW81q8yGnm1KbR7hlQsaLQ00C5wo5ypLDbZO3oEQK+HLe+RAdrNofZC0wpjzdN3pQOWKBzsCWSktEPKe0x1cPzbrAxcZ4oVP1N0KK3q93cVSzM18JT7lB3rSdiGsZ0XUZv1ryi7pYY36Or7WiUJgofz0oYtfYtnL6f0OC52C+oxFpPi9AVtVd6ZEO+BuLcpASPDoFd3lZttmFlkufhH0m7wYzeyoogunhucT7A7CZanOyTBh7gcWOp4SCoPusfjeYlFzb6cXoLx2O2w5pfU6ZboO8FvIENWxVN8sdM+qTa01ep/kzNYLOYIxEvIqrPPKmZZOWT8KZUTq8fS43EiTiwkic2kagLg1b8lL/6rTfAi5KtoYtHXwgslporahUFNqq+zzAY9/GlvXChH4EU6pyiwuXuAcmoVLwHC/5OnWHJZgsfE3VYutXNl1rpcl1V5y2iD1azW7JBtWo6V928biQf+cd1e9+4p1MEwxNz6bk3hzriPLEf43L+XG7r8gRDale8AoiCU47X1j9iWAuLSQCxNXxD82lOs808N0df1h49VU6POiQCQPNOyMMIcen9Gqn77fEyDJfpcmiUMqg5mfWb/AihutYrWdrCYXKfLarqVKVHQQLAUPDkVD6vBF6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(36756003)(38100700002)(4326008)(66556008)(66946007)(66476007)(2616005)(26005)(186003)(6512007)(31686004)(83380400001)(86362001)(110136005)(8936002)(6506007)(6666004)(508600001)(5660300002)(966005)(2906002)(31696002)(54906003)(45080400002)(6486002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0xFMlVGYytYRlk2WTg2MTNEWEVzbTZGTjRBNEpRdUFXZ1dkU0FOT2ZRYUUr?=
 =?utf-8?B?Mm8xSjBxeXpRT2MwWWsyZkxuN2ttNS9VeUJiKy9vS1FwUkVTeXB6c29aaXcw?=
 =?utf-8?B?Z3lNdzBqYnRqTFZlcWx4ZlJPU0wzczdEWk9qN0g4MWJZNDVQVlFiVDBRVlRw?=
 =?utf-8?B?amxvNHdubjhiazRIeGc1M2YvWGFKSnB6ZVhvK3RlR1F6cjlhbWRvQUM3c256?=
 =?utf-8?B?ald1WDhhVFBEOTBsbm1aVGRPcWhrS2pxRW1FS1FjVWlRRDVHK3dvWWY5NkQ2?=
 =?utf-8?B?NXdWMlhDWXdPRGNJZkkySGFVVmVyUjg4NEtEYmFiczdYc1ZmOVBXemZMVnlQ?=
 =?utf-8?B?R1FTUDhwQWhHTEdMOXJEVElmeXJXbHdMcFgyNG1yN1drSk1FbXdZaSsxZW42?=
 =?utf-8?B?YVFPbzRTRDd0dFlFWjJoR2t4Z0sybGxydmV5VGlNSWRibVZBRCtneUhDeFdZ?=
 =?utf-8?B?VC9wcytEYmFVWWlpbERFRk1zNWM5MHJYRm0ybTZQcnByUEdoYzBYV2hxLyth?=
 =?utf-8?B?ZXQyYVRiSWFoSGhFVFl6WmpCWGlrVS8yN0todXlzYWp1eVBmeDhtQmVDaGRY?=
 =?utf-8?B?azk5SCtTQjcwNzNqaHRUY0dIWU5icHFoRHdVR01kYW9GbzI5RXNhTFhHbFA5?=
 =?utf-8?B?YUNPVHBQRmlZVGVVL3ZNQXkrZWJ0WjB4OHVYQnJ1UlhueC95amNoY202YXpO?=
 =?utf-8?B?N1Q5VGFoVElVRVJWalZqNW1ZRDI1eGR1WjI4eTYxYTdzZ25MN05oNmRSNlV5?=
 =?utf-8?B?amcxTGNnMmtncXEvQzE0V1M3WVlEa0ROQjVpUDc3L1QzLzE4d3JGVVRFOWw4?=
 =?utf-8?B?b1dJL3MxS1E3dTBXUm8zZXVCaGFOK1pEU0NuVmVwOFNYS1RGK3NtYUJ2Q1hP?=
 =?utf-8?B?QTh4U0Ixc2drQjdKSkQrc1lpWTNNY2szOXc0elIwRG1USEpUSGEzUGJOMW93?=
 =?utf-8?B?cFhnTnhWUllNeGNjdWFmbUJUQkd5YUVwR1hZbVgraHZwME11OHo3bmtzQ1lo?=
 =?utf-8?B?ODZyM0p3M2o2dld1b0pUaG14c2pTWnBJc2VJcmdKR001QU80OUlnOXhaRHlh?=
 =?utf-8?B?cmhGempRSDE5NlJROThicEFPdjBJQ3Y3V2JEQkN5S0Z2UHlFdzVUNHZSV29s?=
 =?utf-8?B?cUNGK0NSN2N3eWg0UHRydllTREVVV0F2eWZxUjU4NVYwT01GNlBiVm1vbjIx?=
 =?utf-8?B?M0J6TkF4UjN3cHRINFFlMTdsUURDWG1TVjhuM3grWmo5aFgwTWR0YWlRaWpt?=
 =?utf-8?B?Z1J3RUtwSG1TQ3k0T1ptdUprUFR2Tm43MXRZWncwVm11RzhOcDUxa1F2NEhN?=
 =?utf-8?B?d0lqNDNMUEo3NWo5ZWdKVHdXczM0cGhDdkxsVzEvNzJuRW1leEJPNDBwM2JD?=
 =?utf-8?B?Zk84cGZaemk1MTBGRnIwQ3NGdXcyVkhvaVJCa2dMbHlRaXVFK29hcjhCODYr?=
 =?utf-8?B?VmxTc3VDVTJlOFZ3UDBnbElTR0pYckJBSWx1VDhqbTBOWjJzQm55enhNREJ6?=
 =?utf-8?B?ejVnc05wYzVFMEc4bW80RGVrcmV4YzJRZjRaek9VT1k2ZktuUjJHeEdRWGNX?=
 =?utf-8?B?bzF3ZjF4eEdMZ29pUHlDV0kyWlhtSkJMVVJYTkV6Sm5rcksrb29udnVLbjdQ?=
 =?utf-8?B?QzlZSEFlMmpubnljVU14TUhqT0owb3hHcG5RelNoQ29vTU52dEVlMFllUll4?=
 =?utf-8?B?MXdvTXNaME9wVlM2YVc1bzBhdkZoRkc0OEFJREhWUVFDNmdMa2lRZnBPRkc0?=
 =?utf-8?B?dVR5STVuKzExakphY1RMK3EzeE95QmFYVERkVzZZeERtVXFjMCtNSkVwNlFS?=
 =?utf-8?B?MDRGSmhLeVo3bVh6eDA4QlUrcDdEaFNhdUtvUEtHWEZvZkxOd1d0NlBZMkxC?=
 =?utf-8?B?c2plWU5HWitBb1FGNVRMMFc3SWhuYkhnR242VUFTcGpxNURjZStoZWU5eUJ3?=
 =?utf-8?B?bnVmanpEVnBBVkIrb2RtUTJGejkvNm1RZ3ptNHRiL3ZNcGhFOEFsSXFhNEY0?=
 =?utf-8?B?bnBMRjZmRnVZajlrY21rWTlsbEFvb2ZFSFVxVlFIV3Zjaml6MTIzeDlaUjR3?=
 =?utf-8?B?MnpDL2dIdVNubHExTW9KU0NqSzYvUU5hM3UxZU9VaVRMdUhGVHNxbmNBSnJl?=
 =?utf-8?B?dDAzN2dSUkVTNDhrUmUvd1VWYWxWajNSVGxNSVhtRHRMRi90bWxZL0owbzJ1?=
 =?utf-8?B?eTNRVnNBaTBsbzJiOFF3cU1nWUNncEs5MjVxZVl3emF0cCtQZ1VZRkFWd3E0?=
 =?utf-8?B?Y0x4Q2VXQzNkMGRqL0FPQjY4OVF3cjZjSmJpeVNmVmZkdTAyNURFYkVZemw4?=
 =?utf-8?B?bVpMTXdmNTlFdjNWWHk3VGJ6bC9DVW1sWk15OXhJTTVVTzFCNFVyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c8499d-f3b5-4f6a-dd4e-08da163f8cc8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:32:22.9102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86YeXuT+Ub9QSBB9CBnfC6MZTgzY9zPzRsePEKVw8Ag37705qGEkqWh9ew5Zrkks
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 04.04.22 um 15:14 schrieb Daniel Vetter:
> On Thu, 31 Mar 2022 at 22:46, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> There's only one exclusive slot, and we must not break the ordering.
>> Adding a new exclusive fence drops all previous fences from the
>> dma_resv. To avoid violating the signalling order we err on the side of
>> over-synchronizing by waiting for the existing fences, even if
>> userspace asked us to ignore them.
>>
>> A better fix would be to us a dma_fence_chain or _array like e.g.
>> amdgpu now uses, but it probably makes sense to lift this into
>> dma-resv.c code as a proper concept, so that drivers don't have to
>> hack up their own solution each on their own. Hence go with the simple
>> fix for now.
>>
>> Another option is the fence import ioctl from Jason:
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210610210925.642582-7-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C7db3184856cd4b6fa2ce08da163d2543%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637846749141237874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=CQqU37VcltOuwmDN3068yv1c%2FKJ9gaf1U3T7eBQohK4%3D&amp;reserved=0
>>
>> v2: Improve commit message per Lucas' suggestion.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: etnaviv@lists.freedesktop.org
> Hm thinking about this some more, with Christian's dma_resv_usage work
> this shouldn't be needed anymore.
>
> Christian, do you want me to drop this?

If it isn't committed yet we could as well just drop it. I've already 
pushed the patch which makes this superfluous.

Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> index 5f502c49aec2..14c5ff155336 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> @@ -178,19 +178,21 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>>          for (i = 0; i < submit->nr_bos; i++) {
>>                  struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
>>                  struct dma_resv *robj = bo->obj->base.resv;
>> +               bool write = bo->flags & ETNA_SUBMIT_BO_WRITE;
>>
>> -               if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
>> +               if (!(write)) {
>>                          ret = dma_resv_reserve_shared(robj, 1);
>>                          if (ret)
>>                                  return ret;
>>                  }
>>
>> -               if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>> +               /* exclusive fences must be ordered */
>> +               if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT && !write)
>>                          continue;
>>
>>                  ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
>>                                                                &bo->obj->base,
>> -                                                             bo->flags & ETNA_SUBMIT_BO_WRITE);
>> +                                                             write);
>>                  if (ret)
>>                          return ret;
>>          }
>> --
>> 2.34.1
>>
>

