Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20485599CEF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 15:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE3F10EE02;
	Fri, 19 Aug 2022 13:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D1810E461
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 13:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARxUm7HTLdrU2aXi/CExY5CGeGqh76ivklmVMrPqIgHbzAndcnd5iKnNYFyZjbuEeLEohjsMK09V5IPAjHrbNZqR37bC2fQlglMuSd/E588uyKpSJYiKCrrPFiTgx9Gy/BBhX66JXWRJnc1JYWQIa8JMyur33lUAU61Voc6RcUBRXnm9/pR8R2H9BjhsEqmqideCT3+OeRJXc0ZeBjYJ1bJLNxxr2fKLlKJBMioi4jAvLFynTP/59TCfUIglXlhHt75y+y0eXYSae+z6+J4ci81Wl+cAy5CqkVHNgjUhSbg6RUYDipf1THOFa6vhlr12B3ZFfeS2HPMZlE9HLm2FNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dp9n8uuGIph0BPgnT8ZXjuxclzQFNsjdT/RWYBflSw=;
 b=gtGj57xG5UXq9AHCKEogkqpa4WAtR/QKNCxxZwgte/5tK/Z8qik7mkMND8nEmpak0w4drac2DqnwgU6JHBNZqLCQ5A3GvOlEt/vlEaUR1y8GSkyO6xUdo3VNaxkAY6DdUTGB5WIarrqpeUr16yu7noaVb8hvpCPukl6GLQ/oJPU6hEE0+EsXZgP68TBcr1qENt4tlkLTNlnAzXUt9sYFV9X1++3Ubqwo6rzuDl4cTmAY5bX+Gz2HCM780ZhLwkzxpr+cs9AVeD/p4eEldiv0L3bEgwDZm2IfHuPt6jQRpLLmzSBAFPjv5bmB6X0zfIkzFN6jjBnGSYFhrjOIEFxwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dp9n8uuGIph0BPgnT8ZXjuxclzQFNsjdT/RWYBflSw=;
 b=mSQtnd0UyxLVVVkwsPsTpOKn/eAozk9oqy7FQHOgRDW7CtUA+59Qpbwvg49MXXp5VMm33lRzBQdhBD+ZDHKe/UzKsBS9h/111W6WHtBgIVOu6rmei7IfAM+8xX9qO5qdepnaBRtX0NJIXoiuc5lDcp9t8sEzor3AEbOh4MMrVbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 13:33:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Fri, 19 Aug 2022
 13:33:11 +0000
Message-ID: <a29de43e-2dec-fd27-2e24-31af1d3ce470@amd.com>
Date: Fri, 19 Aug 2022 15:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com> <Yv4qlOp9n78B8TFb@nvidia.com>
 <d12fdf94-fbef-b981-2eff-660470ceca22@amd.com> <Yv47lkz7FG8vhqA5@nvidia.com>
 <23cb08e4-6de8-8ff4-b569-c93533bf0e19@amd.com> <Yv+MD44ET211LMIl@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yv+MD44ET211LMIl@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0099.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b76b0b7c-18d2-40a0-8c5c-08da81e75c42
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvOg4XLyyroloMSEW7AyPaGkShkGeE/j18/O+a92NarbbahvwdSyKozCIKiNEiJLZLN9uMxSdus6dV2N/JbcyBw2fjpR4Fm6idTE3Fr9skp/t750NleZpeXwkTXB+96Muv+CVErKvuZCfwAPYolVT0ogHyaWr+w2lWrL9Uw3LuC10AHpyBET6BmDYhna0SwAlLD5Vi9Qfwb6udYwYJ5LIx1RKbZlGBqyadu8P+hyROM4OAHJcKvtbORGHw6+3GlPBn1vB/PFQC6egQRKILOvo6JVyiivoYe5hJJ7NV4I68PC9h98b0QA6pSjsOQXq5RR7LEtVEQ9FUT9pHjC3Wb8Hyoq6dcH6924e4+OA4CgwYlU5+AQv8OVDg9jfFHNvX/PFVuTpPKxRtYxTlNGvHJQlmgiICsVuLqc6wi86RxFMvFeliQ9TZHWvrkjoeUK+M39ol2gPk5ZWQJT8pg9eFZ4Yo5yN7tL6+JoC0aT4uFy2YM4Ge8ibZQN6L0Vcbb90szz6PfP32+uRYZTMoe2IxTKH0SJo/ay224mAK0M6EpnRydID6hYrGxv9zTPJlQ+XBiBlEUP4w1TVx3gjx7kOBH2QMkOdJe0Z6khuS7xOApKLaoKb9X9Yv2fhYh2BWpnSvIjBEFSbCzCwbjiUe372c5teK33F5aa3afnLogUPcjqkKdbBPpl0HSeBAq1NfsRLQNVMEJBfNcPfGLtqN+Pd3PzbJq2k1/3ZHoxBb0DSJ/YVV6SzM3+3q//zwiMqZEsINqDZSmtsXKSyLoQlSOhX9ferg2VbT7yAbdz63soi1kuE0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(2906002)(36756003)(41300700001)(4326008)(8676002)(31686004)(54906003)(6916009)(478600001)(6512007)(316002)(6486002)(6506007)(6666004)(2616005)(31696002)(66556008)(66476007)(186003)(66574015)(86362001)(8936002)(66946007)(7416002)(5660300002)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ZmTGR5Q2JjMTU3d1llREtMditGam1nOG1oNHJENm9HbW0rNCtFQlBOd25Q?=
 =?utf-8?B?OHpvRUxwZ0VjRTdrVi82cVZrcldQQWk0U3NtZGJDZmxiL0tSYyt5VjYydjZo?=
 =?utf-8?B?R2NPbVNwNno2eHdtcHlCaHNaQ3hXU3AySDlYaTRpZ3pPVUpBQkVaamNmMnBR?=
 =?utf-8?B?UWhGMit4QmhKWEk4bmpMUEFtZUVBd3lWMTdpckYvTzVaV0VkbmpLa2ZmUDZ0?=
 =?utf-8?B?YWJKZTBzWmlyWks3QW00RmJxaUt4dmJMaFlmS3BBT1lZekRJZURJbnZ6c1Qy?=
 =?utf-8?B?RUFQZTNTZlNmR25XSFhRR09xUEo1QnFnOWIvUDBBTmliR3hQUGlRckxrN21t?=
 =?utf-8?B?Nlh4RVFaWVJCdGVGelJCTDlNY3FiT1BLQ0xlNllPcnpHU09sZXBJUmx6NDEx?=
 =?utf-8?B?ZllCM3ZTSy82cHhFSFM1eDRDSkd1emJ2UVpLeE9VTjIvUXk4aFFybnJ5RFpn?=
 =?utf-8?B?ZFhFOGdHOTVhTDFuY2UvNmh1VXBiWHhCTklqOC9ZQzBpNDBUbUFaVEV0Szdn?=
 =?utf-8?B?S0p2VFhsTGcyTW5BS1FuRThtWi8zc3I3NWpCQ2tnUEt6THcvMVNud1A2YWJU?=
 =?utf-8?B?YW1STGZxdGxMeU1kYlJsVUJJbWtnMzc5cjNZYlhNMlU1SG45bDZSMmhkNytT?=
 =?utf-8?B?TmNlSUs3ZUY0MVlJN2EzbmVDcUhqY0g3a09vQlhRcDl3UytMd3cxZ1pKeUZU?=
 =?utf-8?B?MmRvcms2RTRCVzZGMDNlVUM4bThSMXo5Y1gvR3hDZ0txeEw3T252cG1rV01G?=
 =?utf-8?B?cERHUG83MXNtRnU0QVNOc0syb3lmemJYN0ZRT01LSWFGVjU2R3lQc2hVa3ZJ?=
 =?utf-8?B?WUtaTlBFUjh3YmcyZUZMdDFPTVlYRi9BTnpzM0RKR0VnY0pmTjNrelZCenpl?=
 =?utf-8?B?SWgyTlFKNUszL29aZnZ4ZlJFOTdpZ0hIUFBlNmtXeDdxcWx2bm9Dd2Nkb2xJ?=
 =?utf-8?B?ZDEvRm1jTThVbEVuYU9VVVQvTWhYZExNVzZCMExwd1Mvczg4Z0tkbzdRdmFT?=
 =?utf-8?B?MThVa2lVeG84Z2hhN0djb1RrR1BBZXNFcDFPZ0ZBcmM3YlhwU29tckh2RUlR?=
 =?utf-8?B?OW03bXJDaVNpeFlNTklLampxV2lHcVZoSFQ2OGpXdjFKWWtKcHlrek0wZDZZ?=
 =?utf-8?B?dEpYaU1vVXpmZ3NkRExoTzA3V0hTZ3E3Y2FoVzlBeUtpNHVTOUR0dmYzUEQ2?=
 =?utf-8?B?T1hOaUxqZTNnSXRydUh1cy9JZW1KMkNSV3pDRmlmU2MyazBDSXBYUU1SNE1V?=
 =?utf-8?B?ZG4zV2VIREdGU1h6UitEajgramhRSVR5QWdhcU9oWVQ3ZHNtUjVpMy9HRFdu?=
 =?utf-8?B?RDV2UmJRMi9CaWR2cjg5S0JKTVR3bDV6bjMwdFZROUYzNmNoM1lmbzd3VkEr?=
 =?utf-8?B?WTBsM3BDd3lJWWM4VnFHZFpVb3VkdkdTYTZUbHI0RWNnL3Rlbm9rU3M5cFhm?=
 =?utf-8?B?RjFPZDZLZENVcnZTYlh0Nkg4cittc24xU0c4YUxlVlgzRmJFUDFmSDFEYUU0?=
 =?utf-8?B?bHMwOU1kWktiTXA0TUxWSmZnWUl5eDNrbXZRaWc2Z01IdnVSUlJQQzZyVTdw?=
 =?utf-8?B?bGhSYk9CZ3lTZEJBZlhYa0lCV0E3TTlocGQxeUxydmZCUWpXdm1IU0FwbSsv?=
 =?utf-8?B?S01GeE5POWx2eWp1WHlpbnVDUjNvOU9WRmRDV3BxTHJsQXJteXJJNzN3NjlK?=
 =?utf-8?B?ZUpVSDN3Si9Fa1VHdTMwdjFKWnovV2huMnRwMmg4WmtBeDZjWVg2OU9NNzBZ?=
 =?utf-8?B?OUlrNEFPUmlKcHdjWTJCVDhLYmo2MUlSOUZhQmdTdVZjaDQ4dmZHZlBaM09G?=
 =?utf-8?B?TFQ4djVYd1lZaStyeVNCQ0VjUDd1cG9mR0xpMHhvTWUrVytDa1VrTWgvLzh5?=
 =?utf-8?B?NVVpT3o4akFRRGFqZU1uNTVvVGVPSE8wSEh5Qnd2dnZnU1d2WW5qUU4xQWNN?=
 =?utf-8?B?Z0xjQlFNUXhlYTBxL3NmMzltZ3d4djVrWEZZM01OS0JmQ3RGSFJVaFZtYWQ3?=
 =?utf-8?B?dlYrelBFU3dPb0xiV1Y4ZjhJVVB2ZGh2L1NvRm1uTFlCYnhaOEl0UCtPYkls?=
 =?utf-8?B?WFNSTFpadm8zdUtIcEdCYWRqUmNweXk5WTRJRWR1bjRVaklJcEtLMU05SkdF?=
 =?utf-8?B?QTl4SGw4dVNZSTJNOU5MellQYnUxc2E4TUFpUEJFWlViQ3NOQmtySGhXY2hU?=
 =?utf-8?Q?GTERU+iC+CkZy6oZZ3M76SEPLTRlQ1k7PTJzis/yE2uU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76b0b7c-18d2-40a0-8c5c-08da81e75c42
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 13:33:11.3358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6N6TT73mHIXaDrYgAA99EllKoTEYh740FOYdd3/lBBNF6OdiRCsWHZ1VlHBaqsF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.08.22 um 15:11 schrieb Jason Gunthorpe:
> On Thu, Aug 18, 2022 at 03:37:01PM +0200, Christian König wrote:
>> Am 18.08.22 um 15:16 schrieb Jason Gunthorpe:
>>> On Thu, Aug 18, 2022 at 02:58:10PM +0200, Christian König wrote:
>>>
>>>>>> The only thing I'm not 100% convinced of is dma_buf_try_get(), I've seen
>>>>>> this incorrectly used so many times that I can't count them any more.
>>>>>>
>>>>>> Would that be somehow avoidable? Or could you at least explain the use case
>>>>>> a bit better.
>>>>> I didn't see a way, maybe you know of one
>>>> For GEM objects we usually don't use the reference count of the DMA-buf, but
>>>> rather that of the GEM object for this. But that's not an ideal solution
>>>> either.
>>> You can't really ignore the dmabuf refcount. At some point you have to
>>> deal with the dmabuf being asynchronously released by userspace.
>> Yeah, but in this case the dma-buf is just a reference to the real/private
>> object which holds the backing store.
> The gem approach is backwards to what I did here.

As I said, what GEM does is not necessary the best approach either.

> GEM holds a singleton pointer to the dmabuf and holds a reference on
> it as long as it has the pointer. This means the dmabuf can not be
> freed until the GEM object is freed.
>
> For this I held a "weak reference" on the dmabuf in a list, and we
> convert the weak reference to a strong reference in the usual way
> using a try_get.
>
> The reason it is different is because the VFIO interface allows
> creating a DMABUF with unique parameters on every user request. Eg the
> user can select a BAR index and a slice of the MMIO space unique to
> each each request and this results in a unique DMABUF.
>
> Due to this we have to store a list of DMABUFs and we need the
> DMABUF's to clean up their memory when the user closes the file.

Yeah, that makes sense.

>>> So we could delete the try_buf and just rely on move being safe on
>>> partially destroyed dma_buf's as part of the API design.
>> I think that might be the more defensive approach. A comment on the
>> dma_buf_move_notify() function should probably be a good idea.
> IMHO, it is an anti-pattern. The caller should hold a strong reference
> on an object before invoking any API surface. Upgrading a weak
> reference to a strong reference requires the standard "try get" API.
>
> But if you feel strongly I don't mind dropping the try_get around move.

Well I see it as well that both approaches are not ideal, but my gut 
feeling tells me that just documenting that dma_buf_move_notify() can 
still be called as long as the release callback wasn't called yet is 
probably the better approach.

On the other hand this is really just a gut feeling without strong 
arguments backing it. So if somebody has an argument which makes try_get 
necessary I'm happy to hear it.

Regards,
Christian.

>
> Jason

