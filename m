Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE265519ACE
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ED810FB7D;
	Wed,  4 May 2022 08:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7284A10FB7D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Blvx7/erQKnqRme/0eLMqpjdyBod47jmYnQdZjfpjIPSdXGKUnuXQw+eCk0RqCWn3Kd7i3tyEHCkjhaO25zi5nm0C/9svvBlHAtOjuJ5w5W6EWhJjPo+jdB8Et7C2Tm++ZPICA/MMDIMOrCo3ehoBiZ+sLvV8n/wrWdZh3vwJ/OCBJJQ/bmy1dN8JOfaDgdrUzJkZiz17/kb4hT1Rqoah7j931lIErLk+q4I1OoO2b9dTwxRqU4d2QYs9VXYnJkfHQ/WSaOkj25m68gn3x5+BRLiCeGR9IZ926I3TDOgPO2V2bR8KdVnxiUHnAhNWzm2Cn3Xnzm9jTLG475/9hNlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYoip7fusvZ+0QtFzChfHvdg5Ut0er7RyYbeMYOOMC4=;
 b=IXWjJOmH4aHPx/9Q66VtlHtHz5UtW57EWZuxLtrV6l1JVR7ijyU7Lp9sK3/2sZsVH4JCd7dR8WYxXbmht7iRkUEi9U5Sb0g5pOfA3R6wIB8PwFzcki7q33cXMPUlQ2/0vJC6qanhivqABXZGeEKIBHckPoaTI5ebwTMH1oGfiMD4ql2DkwTeq1hW3uLstFEzqZsNKbPDGV55+NjmlG6oNdadWZcWBt8tB1Ozg4aw4GfwuCfvxHo4BILY+xCeVx3ot9qRRc5Q3WFs50kWXYZlsIkSQa85hf7gHd1gH8LoKeWv+YoEVEuQM2AJHGNORmoBkekjXGUGR44yD7N+3zaLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYoip7fusvZ+0QtFzChfHvdg5Ut0er7RyYbeMYOOMC4=;
 b=sF1Aqxj78HjOrf8JRWej+fIhJ2cUyefcgY9um6Q60/sgDjyVfdg4oReObNAHF/PTMYZMu4S0Ie9JsFg16iRvL6UxueVA+o6lUba+jLr7PIWcli7WcI+YOcpbSUmlwAAV9uJx1H09UEsrruuAGw+PMndkB2QVhymocZlelUmLu2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB3714.namprd12.prod.outlook.com (2603:10b6:a03:1a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 08:52:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 08:52:34 +0000
Message-ID: <09d1cd03-1da0-bb7a-5770-a75de67dffc8@amd.com>
Date: Wed, 4 May 2022 10:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dma-buf: generalize fence merging
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220426124637.329764-1-christian.koenig@amd.com>
 <20220426124637.329764-3-christian.koenig@amd.com>
 <YnI8qJbJ1DYklNcm@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YnI8qJbJ1DYklNcm@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0082.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db83f52e-335d-4248-d90d-08da2dab6ea2
X-MS-TrafficTypeDiagnostic: BY5PR12MB3714:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB37146C3F9282E889F3C077EF83C39@BY5PR12MB3714.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+zwaGVEJSkMZ87HTYk17A4dXqN5vFcZZr4F1ihCZ+593/yvI2qfl4YZBaVarZfkVzqsr8NwbOuP6kdbZkQlg+OHERjFltZ6eR1h2rs8sTpVjKlJPzZFiEs+7PRXnRCVzOJ9jON8xwdbJYWJltwpJG3dyQQvEk9xXV/biQU8GftpOBlVULLXW5mG1KtYWjRPU0Gdn66vhKbKxCKjRzdty/sBYvQnXbd2OwU01Xan4Oe3RbJD3qykJF9YB+U8pHNyKhWzC+iUVfgdAm6yCVyc3Wy5tLl+yL51975QFus1CHAjPHCDVoh8T2ZOGbPUaXK+tgrTyRtmF4ln6U0u+MvuqRiEuxabED4GgOPBj5zuihpwj2Npjbr+P33zCnQh1NX/EEjJISsZJZeexeyeh/hiisgs5LJCs7wi3QglSIQdiSvfOhPnKty89uNeKHIcO5Np4aC8NZ1TfkiUFTFbtl9BS6IHpWorON6d94/50Z4CL8AfPiY9YQgQnvs4bONpw0Yah9e3jN+6t0oNnonZyxqeMZVpfyNK8GtBXyso4hXaRGdG6IcatCUHE/liJGlBlGvBzNSOJh963snq41VYusXCGIjZk0z7gu5hiVaNqAlYkBJ2ABM0Ck0sEKt7khUXRmuofrwc8Q5DuWbfQuGO5tJkinG9v6Y7OfKsvctcWXLSxnylQZlzd98da75t641DS6/9S7TiPu/GxV4UYf2GKwO1g5oH9m/xvvfeMlGavG26545Asg91kXpUxX8GaKAKvQUr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(83380400001)(26005)(36756003)(31686004)(86362001)(2616005)(31696002)(6512007)(6506007)(66946007)(508600001)(66556008)(5660300002)(66476007)(38100700002)(8936002)(8676002)(4326008)(2906002)(6666004)(6486002)(186003)(30864003)(316002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVVQ2dkZ2pETW11N3dnOExacWtJeXUzOUpnVHR3ci9BL2U3OWdrN3VBaHpR?=
 =?utf-8?B?S21kdk13dVdkaTVvSk5HS1lLZFFSUkVGKzczeThxZHVPa2xvY01zQk4wSHRG?=
 =?utf-8?B?L1hnVWRabDkwSGxacUVkZ2NkTVVCbmFHUXhQVkdsdVI1MWVaa25nb3RrTEpN?=
 =?utf-8?B?ckhVUzJFNUZ4ZVZlbmw2QjFJMlY0L25kNXFoV2tFbkovQURWSWtkU3JNS21k?=
 =?utf-8?B?ZU5MUnYwK055dWs0SnBpS0doOEEzYTlDcU5BWnc3dlNYV3l6eEZOZUFDWW9H?=
 =?utf-8?B?dnBQcmZvTmhvcFcvcjBsNXNMZ09xZjZUM1dMeE9HeEdwMkUxeDNWMEIvbGxC?=
 =?utf-8?B?UDJBd080Rk9xTWRONEMycVNJWDVKTXlNZllEUEROakpRalNXM1diRmZBUTlG?=
 =?utf-8?B?Q29LbXZ1Ny9ESXFlZ1dMOHlrWTdyTC9RWWdGMUZRZlBHalNuWkp0ODA2NTFT?=
 =?utf-8?B?NzdYNHpLem9LUVpGWUxjSTFLUFgvUmFUcnFBWWgzc3FiN2Jid2ZRRUdBSnA4?=
 =?utf-8?B?N1lMQXhPMm5rZ3BISXRpZWN3UW1aN2M1QlM4OEQyTSsxdG9CSkhaWHRyYy8r?=
 =?utf-8?B?b2pELy9pY3JyVVdFdDdtSWlkT1krYzB2Tzc4MnA2OFpsV1ltTjR0Z3U5aHlC?=
 =?utf-8?B?V0c4UFBTOWc2dzR4SGpOY2F5OHhUR3d6bGRTL1JxSS9oa25qeGkzRjUxVjZF?=
 =?utf-8?B?UjZtNmF3ZStlZTN3RS92R1B6dWx1ZHpqVlRyNStHYnIyUVM3M1RYUG9nOUtK?=
 =?utf-8?B?bDJzdk1IZ25TNmtKeEkzUkdFKzhvd2g2bjltalpQb21WcU5HcVpZaXU1QUhN?=
 =?utf-8?B?T0dvL0pORXBHRUhuK2ljYS9qVzUrMnpza0lSanpNcHVLbjFKZGdKU3c5eWMw?=
 =?utf-8?B?WWZWSTZLYy9QeDRGK0wycVJvY09HNTZZMmJLOHB6OE0vZERqd3FYYlptMHdl?=
 =?utf-8?B?bTZjV2htY3B0NXhNRkJDK1JUc1JIVnlPbXBFdkFLMDRSL2c4Z2pqUGRIbWZW?=
 =?utf-8?B?Yk5uOVkxWmJGVlIrYmdyOEpkblp6d3NiUjY3ZXJQR3Y5QllFQjY5SkJ5OHNY?=
 =?utf-8?B?N0RHdUNoY1Y2b2VpbjNGNGN4dU52Q0FLY2NUUXZoNVhEbnp1U05obXFybm9q?=
 =?utf-8?B?SEJRK2szS0dFUlRUZnJab1FkZGErNXJMSTU4UXVOMTVhL1ZTOThDSmZ3bDB5?=
 =?utf-8?B?djVkZ0FHR3BsK1VSbTh5QTVISlRrNW5LRUFnYUdkL3V5OXkrL01Qa2Q0MkpG?=
 =?utf-8?B?RnBCcksyS2M3aDNPVGRraU5TODBXYW1XcjF3bGNZQUJvZ2NKbzNFL2pSa2Ja?=
 =?utf-8?B?R2xUdkZrRlFwVlpYb1NyQVJxRnhMZU9EMHpiclpjRG1WTEcrQlNCRENXZXhs?=
 =?utf-8?B?L0ptM2U4TUxvNGs1K1pkSHBQcnJMdEpnVElobE1pSCtKekpOTjJ2YVRIQTQw?=
 =?utf-8?B?NE9YZDE1c3VDY2lsYksvclp4YmVKa21TYTkveExJbWkwU3pnY1l1MVMxekpJ?=
 =?utf-8?B?RENISk9TYUk2dHcrWG5iWVl1cDNqd2pWWDBtSkd6S2M1cC90blpzTGN2RTd3?=
 =?utf-8?B?c1FpSDNpWDBVcVFram0vVDFSRyttb0U2VjRuTWRFdUg2S3FCUUZnd2RDMjdp?=
 =?utf-8?B?QmxwbkFwbitIaWdMSzJDMm12RG5VZlZmOGxMeFlCT2hFTzd2MTc2OFRVbUNM?=
 =?utf-8?B?blRFUTlrVG5HNjlqRE9VT1J0MTVWWjBYZXZ6S2JrbnZWMVhPdjZFR0tLYWJ4?=
 =?utf-8?B?Sk5vOWVtY28yODgxSmJCQjBnNEZuOUFIeTh4WTQ4WjFDMkFVRCs1aENVcnBM?=
 =?utf-8?B?ZFF4WHNNUlpZTmhhZXhOSm9SckdyV1EwN1k4Zmw4dnpWbUlyeHJLWFpIVklZ?=
 =?utf-8?B?cU44V3pONEtZOGRaSkpFNUMxTkp0clltKzZRMTVTeUpuM3JhQjVzK2syRmpC?=
 =?utf-8?B?eXlxUUNVVGlIYUUyakFtM1dDdDAxVW1HclFzTXJrK2tuUDFrNlozaTZGbGUy?=
 =?utf-8?B?TEZMTnl1aHF4SSszTFd2aWRlUm1JMGR2WllHRXBoL2tHaDVyclcrY2ovUy9B?=
 =?utf-8?B?Y0dTUUgxalhvQ2FUU3p6dFJEdEhDOHczUGZ3dHJEekFObm1iWHAxRi8wc1pa?=
 =?utf-8?B?OTJHaHozdTd6RjVYeVhUQUlVcTZ4VXVsbHdpdjNFMFZHMDArZjRuaEtZRUVk?=
 =?utf-8?B?dDNEY1Q2Ukc5QnFJUmFpMUpGeGx6UEo4cFVUa1hrTnliQ3FGaEF3L0J0b2FT?=
 =?utf-8?B?cXU2Tkdka1czQmNuOCt2TzRTeFNQelhWbTRmM0hic3dNVmxMU3pXQzVnRUdk?=
 =?utf-8?B?TUJ4WUc5ZzhERDNvTjZqZG9MMVBKcGFwWDN2MTc0VGZGdG43clhKUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db83f52e-335d-4248-d90d-08da2dab6ea2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 08:52:34.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yevS/1boXHY/uQEVyLMHAtzRCtG1pdC7wSf+ee1wgnol4N9pWKRBYGMDPRzaf02X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3714
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, daniel.vetter@ffwll.ch,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.05.22 um 10:43 schrieb Daniel Vetter:
> On Tue, Apr 26, 2022 at 02:46:37PM +0200, Christian König wrote:
>> Introduce a dma_fence_merge() macro which allows to unwrap fences which
>> potentially can be containers as well and then merge them back together
>> into a flat dma_fence_array.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> So this is really neat (the va args macro trick especially), but I'm not
> sure how much use it is with just one user. Is there like more planned?

We have another potential user of this in drm_syncobj_flatten_chain() 
and at least another potential cases in amdgpu come to my mind.

I just wanted to double check the general implementation before I start 
to use this more widely.

> Or is the idea to make merging consistent so that the context sorting
> trick can be done consistently?

The context sorting trick is just a nice to have optimization. My main 
intention here is to have an utility function for flattening things out 
I can point people to which does the job and works reliable in all cases.

Christian.

> -Daniel
>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c    |  95 ++++++++++++++++++++
>>   drivers/dma-buf/st-dma-fence-unwrap.c |  47 ++++++++++
>>   drivers/dma-buf/sync_file.c           | 119 ++------------------------
>>   include/linux/dma-fence-unwrap.h      |  24 ++++++
>>   4 files changed, 172 insertions(+), 113 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
>> index 711be125428c..c9becc74896d 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/dma-fence-array.h>
>>   #include <linux/dma-fence-chain.h>
>>   #include <linux/dma-fence-unwrap.h>
>> +#include <linux/slab.h>
>>   
>>   /* Internal helper to start new array iteration, don't use directly */
>>   static struct dma_fence *
>> @@ -57,3 +58,97 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>>   	return __dma_fence_unwrap_array(cursor);
>>   }
>>   EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
>> +
>> +/* Implementation for the dma_fence_merge() marco, don't use directly */
>> +struct dma_fence *__dma_fence_merge(unsigned int num_fences,
>> +				    struct dma_fence **fences,
>> +				    struct dma_fence_unwrap *iter)
>> +{
>> +	struct dma_fence_array *result;
>> +	struct dma_fence *tmp, **array;
>> +	unsigned int i, count;
>> +
>> +	count = 0;
>> +	for (i = 0; i < num_fences; ++i) {
>> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
>> +			if (!dma_fence_is_signaled(tmp))
>> +				++count;
>> +	}
>> +
>> +	if (count == 0)
>> +		return dma_fence_get_stub();
>> +
>> +	if (count > INT_MAX)
>> +		return NULL;
>> +
>> +	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>> +	if (!array)
>> +		return NULL;
>> +
>> +	/*
>> +	 * We can't guarantee that inpute fences are ordered by context, but
>> +	 * it is still quite likely when this function is used multiple times.
>> +	 * So attempt to order the fences by context as we pass over them and
>> +	 * merge fences with the same context.
>> +	 */
>> +	for (i = 0; i < num_fences; ++i)
>> +		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>> +
>> +	count = 0;
>> +	do {
>> +		unsigned int sel;
>> +
>> +restart:
>> +		tmp = NULL;
>> +		for (i = 0; i < num_fences; ++i) {
>> +			struct dma_fence *next = fences[i];
>> +
>> +			if (!next || dma_fence_is_signaled(next))
>> +				continue;
>> +
>> +			if (!tmp || tmp->context > next->context) {
>> +				tmp = next;
>> +				sel = i;
>> +
>> +			} else if (tmp->context < next->context) {
>> +				continue;
>> +
>> +			} else if (dma_fence_is_later(tmp, next)) {
>> +				fences[i] = dma_fence_unwrap_next(&iter[i]);
>> +				goto restart;
>> +			} else {
>> +				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +				goto restart;
>> +			}
>> +		}
>> +
>> +		if (tmp) {
>> +			array[count++] = dma_fence_get(tmp);
>> +			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +		}
>> +	} while (tmp);
>> +
>> +	if (count == 0) {
>> +		tmp = dma_fence_get_stub();
>> +		goto return_tmp;
>> +	}
>> +
>> +	if (count == 1) {
>> +		tmp = array[0];
>> +		goto return_tmp;
>> +	}
>> +
>> +	result = dma_fence_array_create(count, array,
>> +					dma_fence_context_alloc(1),
>> +					1, false);
>> +	if (!result) {
>> +		tmp = NULL;
>> +		goto return_tmp;
>> +	}
>> +	return &result->base;
>> +
>> +return_tmp:
>> +	kfree(array);
>> +	return tmp;
>> +}
>> +EXPORT_SYMBOL_GPL(__dma_fence_merge);
>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
>> index 59628add93f5..23ab134417ed 100644
>> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>> @@ -240,6 +240,52 @@ static int unwrap_chain_array(void *arg)
>>   	return err;
>>   }
>>   
>> +static int unwrap_merge(void *arg)
>> +{
>> +	struct dma_fence *fence, *f1, *f2, *f3;
>> +	struct dma_fence_unwrap iter;
>> +	int err = 0;
>> +
>> +	f1 = mock_fence();
>> +	if (!f1)
>> +		return -ENOMEM;
>> +
>> +	f2 = mock_fence();
>> +	if (!f2) {
>> +		err = -ENOMEM;
>> +		goto error_put_f1;
>> +	}
>> +
>> +	f3 = dma_fence_merge(f1, f2);
>> +	if (!f3) {
>> +		err = -ENOMEM;
>> +		goto error_put_f2;
>> +	}
>> +
>> +	dma_fence_unwrap_for_each(fence, &iter, f3) {
>> +		if (fence == f1) {
>> +			f1 = NULL;
>> +		} else if (fence == f2) {
>> +			f2 = NULL;
>> +		} else {
>> +			pr_err("Unexpected fence!\n");
>> +			err = -EINVAL;
>> +		}
>> +	}
>> +
>> +	if (f1 || f2) {
>> +		pr_err("Not all fences seen!\n");
>> +		err = -EINVAL;
>> +	}
>> +
>> +	dma_fence_put(f3);
>> +error_put_f2:
>> +	dma_fence_put(f2);
>> +error_put_f1:
>> +	dma_fence_put(f1);
>> +	return err;
>> +}
>> +
>>   int dma_fence_unwrap(void)
>>   {
>>   	static const struct subtest tests[] = {
>> @@ -247,6 +293,7 @@ int dma_fence_unwrap(void)
>>   		SUBTEST(unwrap_array),
>>   		SUBTEST(unwrap_chain),
>>   		SUBTEST(unwrap_chain_array),
>> +		SUBTEST(unwrap_merge),
>>   	};
>>   
>>   	return subtests(tests, NULL);
>> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
>> index 0fe564539166..fe149d7e3ce2 100644
>> --- a/drivers/dma-buf/sync_file.c
>> +++ b/drivers/dma-buf/sync_file.c
>> @@ -146,50 +146,6 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>>   	return buf;
>>   }
>>   
>> -static int sync_file_set_fence(struct sync_file *sync_file,
>> -			       struct dma_fence **fences, int num_fences)
>> -{
>> -	struct dma_fence_array *array;
>> -
>> -	/*
>> -	 * The reference for the fences in the new sync_file and held
>> -	 * in add_fence() during the merge procedure, so for num_fences == 1
>> -	 * we already own a new reference to the fence. For num_fence > 1
>> -	 * we own the reference of the dma_fence_array creation.
>> -	 */
>> -
>> -	if (num_fences == 0) {
>> -		sync_file->fence = dma_fence_get_stub();
>> -		kfree(fences);
>> -
>> -	} else if (num_fences == 1) {
>> -		sync_file->fence = fences[0];
>> -		kfree(fences);
>> -
>> -	} else {
>> -		array = dma_fence_array_create(num_fences, fences,
>> -					       dma_fence_context_alloc(1),
>> -					       1, false);
>> -		if (!array)
>> -			return -ENOMEM;
>> -
>> -		sync_file->fence = &array->base;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static void add_fence(struct dma_fence **fences,
>> -		      int *i, struct dma_fence *fence)
>> -{
>> -	fences[*i] = fence;
>> -
>> -	if (!dma_fence_is_signaled(fence)) {
>> -		dma_fence_get(fence);
>> -		(*i)++;
>> -	}
>> -}
>> -
>>   /**
>>    * sync_file_merge() - merge two sync_files
>>    * @name:	name of new fence
>> @@ -203,84 +159,21 @@ static void add_fence(struct dma_fence **fences,
>>   static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>>   					 struct sync_file *b)
>>   {
>> -	struct dma_fence *a_fence, *b_fence, **fences;
>> -	struct dma_fence_unwrap a_iter, b_iter;
>> -	unsigned int index, num_fences;
>>   	struct sync_file *sync_file;
>> +	struct dma_fence *fence;
>>   
>>   	sync_file = sync_file_alloc();
>>   	if (!sync_file)
>>   		return NULL;
>>   
>> -	num_fences = 0;
>> -	dma_fence_unwrap_for_each(a_fence, &a_iter, a->fence)
>> -		++num_fences;
>> -	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
>> -		++num_fences;
>> -
>> -	if (num_fences > INT_MAX)
>> -		goto err_free_sync_file;
>> -
>> -	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>> -	if (!fences)
>> -		goto err_free_sync_file;
>> -
>> -	/*
>> -	 * We can't guarantee that fences in both a and b are ordered, but it is
>> -	 * still quite likely.
>> -	 *
>> -	 * So attempt to order the fences as we pass over them and merge fences
>> -	 * with the same context.
>> -	 */
>> -
>> -	index = 0;
>> -	for (a_fence = dma_fence_unwrap_first(a->fence, &a_iter),
>> -	     b_fence = dma_fence_unwrap_first(b->fence, &b_iter);
>> -	     a_fence || b_fence; ) {
>> -
>> -		if (!b_fence) {
>> -			add_fence(fences, &index, a_fence);
>> -			a_fence = dma_fence_unwrap_next(&a_iter);
>> -
>> -		} else if (!a_fence) {
>> -			add_fence(fences, &index, b_fence);
>> -			b_fence = dma_fence_unwrap_next(&b_iter);
>> -
>> -		} else if (a_fence->context < b_fence->context) {
>> -			add_fence(fences, &index, a_fence);
>> -			a_fence = dma_fence_unwrap_next(&a_iter);
>> -
>> -		} else if (b_fence->context < a_fence->context) {
>> -			add_fence(fences, &index, b_fence);
>> -			b_fence = dma_fence_unwrap_next(&b_iter);
>> -
>> -		} else if (__dma_fence_is_later(a_fence->seqno, b_fence->seqno,
>> -						a_fence->ops)) {
>> -			add_fence(fences, &index, a_fence);
>> -			a_fence = dma_fence_unwrap_next(&a_iter);
>> -			b_fence = dma_fence_unwrap_next(&b_iter);
>> -
>> -		} else {
>> -			add_fence(fences, &index, b_fence);
>> -			a_fence = dma_fence_unwrap_next(&a_iter);
>> -			b_fence = dma_fence_unwrap_next(&b_iter);
>> -		}
>> +	fence = dma_fence_merge(a->fence, b->fence);
>> +	if (!fence) {
>> +		fput(sync_file->file);
>> +		return NULL;
>>   	}
>> -
>> -	if (sync_file_set_fence(sync_file, fences, index) < 0)
>> -		goto err_put_fences;
>> -
>> +	sync_file->fence = fence;
>>   	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
>>   	return sync_file;
>> -
>> -err_put_fences:
>> -	while (index)
>> -		dma_fence_put(fences[--index]);
>> -	kfree(fences);
>> -
>> -err_free_sync_file:
>> -	fput(sync_file->file);
>> -	return NULL;
>>   }
>>   
>>   static int sync_file_release(struct inode *inode, struct file *file)
>> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
>> index e7c219da4ed7..7c0fab318301 100644
>> --- a/include/linux/dma-fence-unwrap.h
>> +++ b/include/linux/dma-fence-unwrap.h
>> @@ -48,4 +48,28 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>>   	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
>>   	     fence = dma_fence_unwrap_next(cursor))
>>   
>> +struct dma_fence *__dma_fence_merge(unsigned int num_fences,
>> +				    struct dma_fence **fences,
>> +				    struct dma_fence_unwrap *cursors);
>> +
>> +/**
>> + * dma_fence_merge - unwrap and merge fences
>> + *
>> + * All fences given as parameters are unwrapped and merged back together as flat
>> + * dma_fence_array. Useful if multiple containers need to be merged together.
>> + *
>> + * Implemented as a macro to allocate the necessary arrays on the stack and
>> + * account the stack frame size to the caller.
>> + *
>> + * Returns NULL on memory allocation failure, a dma_fence object representing
>> + * all the given fences otherwise.
>> + */
>> +#define dma_fence_merge(...)					\
>> +	({							\
>> +		struct dma_fence *__f[] = { __VA_ARGS__ };	\
>> +		struct dma_fence_unwrap __c[ARRAY_SIZE(__f)];	\
>> +								\
>> +		__dma_fence_merge(ARRAY_SIZE(__f), __f, __c);	\
>> +	})
>> +
>>   #endif
>> -- 
>> 2.25.1
>>

