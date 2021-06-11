Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADC3A3D73
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16106E5A4;
	Fri, 11 Jun 2021 07:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33246E5A4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfpacnLQ9s+cipdkEGRPQfXINXxTyKY/3U+GOYM8/LXgsbcCYs4ljj9015sqLvYKjsG1da9gJUk30aOwxWUsGZ+UPABF9pf5vtwc8//H73taMXyrCcKNJ2PC28kFK0G+zf8ucJ57mcF0P2XjI7eH3Flzdnp825ayN5WXhJuqKPKS7fAFnRcWVydgJoaW5qw+LzeguleCWhwK2inG8IcPo5adzlC3QytMtMtKUSCDEfRSIosMEvRilgv3Ic5jcNsX0owt3eaN7eSfALjAXD+baO3xU4xMGvjm5OekZLFwaBjlFvULS4jcK2GlkBFmP6aMzeGmrCMoJRpcUKl2c/qFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kvQUg7ovP1BglvB0vfJyc6zz2imPQ0uo8ye2NRYUPg=;
 b=b95j22ubr0kLEvMwFIFSAYOw7q0BsVZI8W2rylpGPkL0mz4IHvLwUtm1ULakwTNvsDmylpem2va31UXSzFGUFZlYlqXtfJzweyZT5ReUfVzTnwGdQmgz4Nc535VtrU2cYtymdD05aB7AVwFMg7mtw6R/s7zkZ4HDz0dFUwOsIdSRu9uzSHjDat8JrsEus9HXxTfLcX8msOPsAnyxK6CcuguYSBfPYHo7NyuXcVufVhIBDKJ94bkAW4X1ceGjf1DietN51/FRMsK5neTAFGxMlWWs2inZ72Dsc3q1L9R7caU7WgMaaNX7ZM8RjMbuYb2dSqnl2XapLHJnsWkfODjAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kvQUg7ovP1BglvB0vfJyc6zz2imPQ0uo8ye2NRYUPg=;
 b=twXGGzXyRvIj5DYDud8UsHKxkmh59DlBPuBEdWYoyBNW76bTyVmyUcCUbM6VZQwE3uTWhl4YnVSbRVXonOl6kF/LOTPcV9Va3DCxWAxPAOTkwKu7WOWtg6d2dQJuTiPPsEU2DjRDHFzpgPKaHOuCUpkAnnd//8yi8b59dj0ktCw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Fri, 11 Jun
 2021 07:44:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:44:31 +0000
Subject: Re: [PATCH 5/6] RFC: dma-buf: Add an extra fence to
 dma_resv_get_singleton_unlocked
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <20210610210925.642582-6-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6f7b6796-6352-3463-63b2-2d3cfbb88f3b@amd.com>
Date: Fri, 11 Jun 2021 09:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210610210925.642582-6-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e99:1d6a:3624:888b]
X-ClientProxiedBy: AM8P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e99:1d6a:3624:888b]
 (2a02:908:1252:fb60:1e99:1d6a:3624:888b) by
 AM8P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 07:44:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2b39f2d-69a9-4412-6d7e-08d92cacbfa2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518E7B3EC09AC02159A283F83349@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KQibX5G/gBGWhwv2CGNITaycXOTFkJhjHgWiCYbvb1Dcdrn4jqc6aHv/nkwccu4nmMEz2dbTb+ENwnsPOwS2A4K63jGlUGDZslJAdOMHuE0UQK0zMJeSSpQl5BPN5EghfhMRKxPgbx/eDb6EQ3ZJKXjP4XrC3v6q6FQrMgbKmvgHhgWKTehceU7bbUTyAA9sztGAFD157tAnN66Mvw2l0k7EAIRONjrs+piDpBwDNa8dLIoeMLrXAFtkREG/bkzKchkikX8WdbtDr8unIpjQapZ/yArkDR1Y44wE9/UC772g+0u+lapu7h+CrKj/GvqVcBDIEPfVe37pdfhlUp+rgEOCpo6Dm//fh/qsRmODaQsuS4jTDODkUH0w78U/4HhnjQ2n9BahUWfOZ5b2AmzZZnV+9bzDhzRzt8JvviMa7wzrzD88AHhXZNuk3DlDDmt8rkqz5QyMhSOQxkvWZCteTMj0QxzNrB0DMTJtOkOM6xnT6U3M0pwHlwi/xeVVM5eg0EwIqaG0pC9s4J0/Gq1BPb1MdHlB/YC8UsM2/Gb3A9N16hj3ZhzR1+9Sf6zzWSniRYIymhuIN5jfG/kO3D1abArS9tx4PhVEsb1In8az/UNk/MbPNd6v5e/eb+sC4rPi/oA7UQgf85AIKGSJ3RpAR7nv+Q26LyKrbrt26JMQmAVZ1+5R8OtWLXpiyYTaoyM9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(8936002)(8676002)(316002)(66556008)(66476007)(186003)(66946007)(478600001)(16526019)(38100700002)(4326008)(31696002)(83380400001)(54906003)(31686004)(66574015)(5660300002)(6486002)(36756003)(6666004)(2616005)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStCTW1pZlpQak44VzFzYmhoNDZlNFhSWXF4OGluV0czLzRaZ3pnaGozLzVU?=
 =?utf-8?B?WjlJOU4zVHhCdElNUFFpT3E1TytUSVd6d3ZYOEppb2NyWEFrbmNEZ29pRHRo?=
 =?utf-8?B?aDRPSi92Zkp1aHlGK0VpL29BdGZiYkZneVozWXM4bWdsZGh2Q1hGTE5sSUIr?=
 =?utf-8?B?MThMckxaZTZMQTQ1cFBVNGpUL2Q5RkhpbE10N3VEZ2owSWVXaHBkNFFia1Z3?=
 =?utf-8?B?L2duZHFibGFxMEVGNHZReVVVR0FMOFh5NXdBU1NVOXcrcFgrRkFGNlByL1l6?=
 =?utf-8?B?dDc1U3c0Mkx2L3NtbXRTK2crM21KOEp1Y0ExdVllV3ZzRnpxMU5tdWpIZ2tC?=
 =?utf-8?B?U0VrUGNwWkJZbjJDYUo2TC8yMjRudWJLMGxpNnl6TDZkRy90VktqaC93VTMx?=
 =?utf-8?B?OS9rc3BUUjVjYjg3UDNTUlJpR3ZPNjUzSlEzWFlnN2UycnVNTkFIN21tZWNl?=
 =?utf-8?B?WlZzbTlSc1NmN0d4NkxJTUtKR3NQMlE1WWJVejlSTWtXRHlHY1RiZDdZMVVt?=
 =?utf-8?B?KytUK1FSeTFQeG5NclM1WGVtcDJOZERJVU05ZHBUWnJNNzVkQ3pZeU85dVBn?=
 =?utf-8?B?OG9ROTR6UGpITElDSmxpTXZ4UGQ2SXpXVHlDWllhWTg5OHRWYi8vTy90Rldt?=
 =?utf-8?B?eW5UaGtVM2luL3JDU0QwRWpzSEdrb0tTcnhObDJqeTBTa0lpYzhGZnczczJz?=
 =?utf-8?B?KzA3Sld4L0lZTm8wc0UyWVBwS21kZlZTSnBES3RLZEc5NFNpZVEyRTNzMEIx?=
 =?utf-8?B?NmtSYktnbGlrMFZtaVVuMlU4NnVHdmpCZGN4MDJJbFpsSXJNVE9nNUxvRStv?=
 =?utf-8?B?aGtwbzJlV1V5TVdZdDBTaGcyd01GbkEvVS9STE4zSjFWc1kxTXZhS2ZJeG9z?=
 =?utf-8?B?d3AyVG4wRmZCUGhYNVRLR0pWOHVLTWxYTjhSaElWNXZ4MHA5ODl6R0ovU1hh?=
 =?utf-8?B?c3dnMjZFTnVuWm94NG5jMHNWVGI0WGkwcXlZZFNWaG9xWUVON2hVNVBDVFJY?=
 =?utf-8?B?Ly8xWkI2MStYUUd5b2FwTy9XVHVTV3U4dU1zcjhFU3BPSUhHM0VHR0ducDh1?=
 =?utf-8?B?VHhuUmh3VEJtNE5rRmliQ1RQM1l3MVg3WVVkRXhhQzYvZE1keW5ZNjQ4a3Bl?=
 =?utf-8?B?OTh0cFRXSGhHc2JYaTVLRUhVUEVQZFlVMkVzWmQrUThDQmFrL3dtMVJBSGxO?=
 =?utf-8?B?UHFaRVVFeTA3TEd2NW9nNmpGM3NtakdaWVdGU2JjMTdldm43Z1FoaklmTlVx?=
 =?utf-8?B?L0R0bmJMWXBBSGFqRW40UGYrbEs1VzU4Z21ZNzRRQkpidVVKQzJMMTk5eU55?=
 =?utf-8?B?UGFCam9PbGwyMEpvOEFpa2xLc2g5SWhoTjJnenMyNFpMRTZVM2R1WkVJREg5?=
 =?utf-8?B?cWtNcnNqZTNqWUc3QTBuOGY1MjdhMC9sNUZDMkQrSzhSOSt1RDhLYnBNMncy?=
 =?utf-8?B?bHhWWGtjVWYwZjNrbDlBdzdaSVNFeFZzRVIrdk9RNEo4U1dXYVZOT3FxbERR?=
 =?utf-8?B?RC9Vc3U5bU9DYVRtSkRtYTdOazlnZk1La0ljTVFzRXMvQ0dUN0U3MEJ0Sk1J?=
 =?utf-8?B?c051bGNiTE15L2JiS21tTm1xREs3UWNDWDIxeFJqdXNqYTRaZU5sUWg1dnRD?=
 =?utf-8?B?QmZYRnNZTUc3eEgwZVlEcGgwM0pkSWgwd3NsOUh2YUdNQTcrWDZRL3JBMzJU?=
 =?utf-8?B?UmhtbFVyZURMb2Foc2JPUkkvS0duOHBnL1lObzR2aFg3eGtCRmp0VmRsNWxT?=
 =?utf-8?B?cjZoUEJPZlJjeVRqZ2hCaWxvTW9SUi9xK2xpTFpjVXlSeFpQN2d2R0NXYXI2?=
 =?utf-8?B?dHV4dXd5VXNJcm5TRGRGb05UOXJndFlGM1V1NU83ZnNPSGlWTGpwYjdvQnBi?=
 =?utf-8?Q?m2nEjyg91jHo/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b39f2d-69a9-4412-6d7e-08d92cacbfa2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:44:31.1795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYV3Dp02ULCXZMKaJTcr5/vKfs8QrJD0et5OQ4fhUJ8zOfVDv3kLvLfI+p+tNGWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> For dma-buf sync_file import, we want to get all the fences on a
> dma_resv plus one more.  We could wrap the fence we get back in an array
> fence or we could make dma_resv_get_singleton_unlocked take "one more"
> to make this case easier.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Christian König <christian.koenig@amd.com>

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-buf.c  |  2 +-
>   drivers/dma-buf/dma-resv.c | 23 +++++++++++++++++++++--
>   include/linux/dma-resv.h   |  3 ++-
>   3 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 41b14b53cdda3..831828d71b646 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -389,7 +389,7 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
>   		return fd;
>   
>   	if (arg.flags & DMA_BUF_SYNC_WRITE) {
> -		fence = dma_resv_get_singleton(dmabuf->resv);
> +		fence = dma_resv_get_singleton(dmabuf->resv, NULL);
>   		if (IS_ERR(fence)) {
>   			ret = PTR_ERR(fence);
>   			goto err_put_fd;
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 1b26aa7e5d81c..7c48c23239b4b 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -504,6 +504,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>   /**
>    * dma_resv_get_singleton - get a single fence for the dma_resv object
>    * @obj: the reservation object
> + * @extra: extra fence to add to the resulting array
>    *
>    * Get a single fence representing all unsignaled fences in the dma_resv object
>    * plus the given extra fence. If we got only one fence return a new
> @@ -512,7 +513,8 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>    * RETURNS
>    * The singleton dma_fence on success or an ERR_PTR on failure
>    */
> -struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
> +struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj,
> +					 struct dma_fence *extra)
>   {
>   	struct dma_fence *result, **resv_fences, *fence, *chain, **fences;
>   	struct dma_fence_array *array;
> @@ -523,7 +525,7 @@ struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
>   	if (err)
>   		return ERR_PTR(err);
>   
> -	if (num_resv_fences == 0)
> +	if (num_resv_fences == 0 && !extra)
>   		return NULL;
>   
>   	num_fences = 0;
> @@ -539,6 +541,16 @@ struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
>   		}
>   	}
>   
> +	if (extra) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
> +			if (dma_fence_is_signaled(fence))
> +				continue;
> +
> +			result = fence;
> +			++num_fences;
> +		}
> +	}
> +
>   	if (num_fences <= 1) {
>   		result = dma_fence_get(result);
>   		goto put_resv_fences;
> @@ -559,6 +571,13 @@ struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
>   		}
>   	}
>   
> +	if (extra) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
> +			if (dma_fence_is_signaled(fence))
> +				fences[num_fences++] = dma_fence_get(fence);
> +		}
> +	}
> +
>   	if (num_fences <= 1) {
>   		result = num_fences ? fences[0] : NULL;
>   		kfree(fences);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index d60982975a786..f970e03fc1a08 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -275,7 +275,8 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>   			unsigned *pshared_count, struct dma_fence ***pshared);
>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> -struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj);
> +struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj,
> +					 struct dma_fence *extra);
>   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>   			   unsigned long timeout);
>   bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);

