Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D172C2BC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D74410E03C;
	Mon, 12 Jun 2023 11:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E728810E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXpY5NnUwF+sWuxWNqHEs+WfhOUDpox+pWnaV/6d80lfV1ms3KUBVE+8ekqzb7IXJX21nqiihO+vSUMqphIAZVY/1VPWGhr4G9mo9nrfPhvSf+U+4BQhTH+pmhqtxdOVZUMTl9Ig0l78CLg4jipqf4JrGzREm/j0T27bwIecKHzDGh9nomt/800PHPcAXjxKd8RM93Z4829KhPOXKaihEzI/x/z/DcnYrLE5pl6rsC00qIFDMKQWIzzqAXm4adWS3ZbKNFmZqgdojLA5xtXHd0GvLZ44/f9/j2sekKQl1u5qixL7diZfXO7VJ7J81opsHJsfMjGWqOkVMBUL4oeO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLnMStLtrWncnm5zSYGs6xqhC6fI/PDojUN45dxVH0M=;
 b=P95jUf5awNHbfI9k5ThM7WcxdpqPQT2dVamUvuVZlX6gxCkKePzK96YVjYAA1ApvWL5zMn+Zl7s0rBWz1Tsc+gJkUH2I0tjLPmLeIWs2PVQcnxwyXWZt8DPrUn6+JBNfaEyv4YmpiX1qwVmngJOaB9lFaMeLA2OlyGGZCwqZ1X+G+cplvOcOD4M/3EHetlKS7CbtK9CNOnvlH6UbvURqffyas54PG5lXLJ7TiGuCg7rCzWqYMzmw/WDUcTEYFjbcbmPIj9eotxCHn9USd5AOU/qKKgxhVykAdJNj4m2PC+plNKoqQk5mFaxjveZDv4GKGJ3RlPGV25fFBqMmwhtSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLnMStLtrWncnm5zSYGs6xqhC6fI/PDojUN45dxVH0M=;
 b=DaHfWHaWPi38dFaN/arCZy+WzaxOIa7olXpKPoK5uNfUUzdTE6vU1H04qpVyTqMvbWJ3aFFWvnhAhRbVutqmXVR90Su4FuqIn5YlXSxQKfmZKyDLsuBlYxQq9gluunnObx0CoHU/5rODJex+fGh9s8Df31+dHi1kpYXkzSHobHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DS0PR12MB7533.namprd12.prod.outlook.com (2603:10b6:8:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Mon, 12 Jun
 2023 11:22:51 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Mon, 12 Jun 2023
 11:22:51 +0000
Message-ID: <fc979a4e-c30a-2606-9eec-afbba4fdd774@amd.com>
Date: Mon, 12 Jun 2023 13:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] accel/qaic: Fix dereferencing freed memory
Content-Language: en-US
To: Sukrut Bellary <sukrut.bellary@linux.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230610021200.377452-1-sukrut.bellary@linux.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230610021200.377452-1-sukrut.bellary@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|DS0PR12MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: 401ef1df-6a0b-4fc6-6913-08db6b375b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1gq9mm558ulT1Thk0y9RTmFJWtv8XKJ31Dkr6EBnf4UQRT5INIWOEtAzqgkxmM8XuPin/Kul+ZJBdffinBm4KUJWwIrw2vctNh/UjMRvm+RTW81FCxHkCgcjV9CyXQwtpV6neijC3n5vmoUof6pCNLXVxq4oZuYI+9e9k8GWKJCneUhwJ9JnVyqSPr+hZ78JwjZpyo28p6REWjv1LfHa52dFLHs/uFqKLVfHN9Xj2R9rbHESH+w5gY2NDXHBV7EAJekShsu29Gt+y1IyJ+OZxyRWr2NMT/TYE92X20w2Ra0n4DPFjRgViCQEfiVvTcIA+LveRvm8kKSwenRZafO8l86DCwayeAP54UePAiH2znUKoGDQ+rnvjwVV4wWVKH8tbpWhLAfHmcpI7rs6PsKliHoRKJjW6/QUD3USUlLeMTZdNIILAmUsCrNkcd8HzzN3xu0xwPW/Gm7Bb7NJw6Zqjq9r4dmZqB7OIQEsjIL3vwtZHTERhY7lY5d3qiuncPY5JBra/67fxQqGgTs8juhX1k+uoliLReE3z+7VodqC6HaNZ3l+OJGUEknRhXEQJkvXkQ+MEKCOElmujxcac8jqD830wha0FJu4bIT/KUo8RWLILPB+jXsc6OXLbnWZxrgv8ggpAzPxLBDGY8uvgGm5yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(83380400001)(7416002)(36756003)(478600001)(8936002)(8676002)(4326008)(66476007)(66946007)(41300700001)(66556008)(316002)(31696002)(5660300002)(38100700002)(86362001)(6666004)(6486002)(2906002)(110136005)(186003)(6506007)(2616005)(31686004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW1hY0l0TmRGV29ydjFSZExMVFpGNDFqR20xYitOTXdDZDQ4dFQwa1V2eStO?=
 =?utf-8?B?K25Od2l1QTNZaDgreDhYQnNzK0pDcXJxS1RTd29sV29OamNXTHVodHZienRp?=
 =?utf-8?B?bmZqaHByNFBQejlXRHIyOCtHOFF4M2tDajV0WTc5M0tuZWZnaFl6VTBXZ1dV?=
 =?utf-8?B?c0JQNUhsbFBucE9HQm9hQ3FMRWgxWTBZZkQybnJiWXpneFUvMGd5WUNpdmRT?=
 =?utf-8?B?dWVhUnU1cVY3eGJzcHpwd1RZcW5JOVd1U0lvQVg1UzhlYURiK013ODlDNkVQ?=
 =?utf-8?B?bmNJbDJFMVYyRisvZ2ttcERZTmdhSjV1M3NMOUxTVysxbUhFRk9Vd0FzN0Rx?=
 =?utf-8?B?VDVzUStKRGJGTjFVSTJoNjNaUFZ2TnhHdXZ3cmIxTzBBRXFiUFV0RTZBR25o?=
 =?utf-8?B?RW9ROE1yajltQWxhMjlSWDBmTWUwYXg1YkFFbmpkcFYwVkpMK2xYZnAva3NE?=
 =?utf-8?B?anNmbzhaVU5ZMUY4V2w1RHVSTzY3YkFpWE95cjdoSDhJTUx3c0czeWpzZEQ4?=
 =?utf-8?B?d1VvUWFqMUxYaERFeDVwNGVLM0pWeTFKVFloZ0hZdnMvdGkxQ3Awczk0MFRi?=
 =?utf-8?B?eGpxdzBpbG94enFsV2lydS81SitaNTR0Vm94MkoyVk1Qd2xiWE50aTRrNDR1?=
 =?utf-8?B?UEFTZG5ZQUxIaytkblhoVng2NDMrTUkrc1RGY0cyR2ZSSFlvY08zanljYWhF?=
 =?utf-8?B?eVZ6Y1pXNytTZUNNVUtUajBBVmRSZlZUQzRWekVEK2NzdzRsb3V2QzZwOTA2?=
 =?utf-8?B?cGZ0VXBJbVZnMnhoUTUyWVhFQndtTkk0MldNVG12VzdEd0NhV2ZhRWFoaDFF?=
 =?utf-8?B?VjYzeEpta3JxVTFiY3ZZcmozblloUnVlT3M2eDJzbkZicGJWQlZDLytqTlVi?=
 =?utf-8?B?VUdPUlhwcVExY2VXNlpxSjZWQnppZFdjQ3Rzbm02ejNoYnhQWThETThXc0NB?=
 =?utf-8?B?bUIzUFJvR1VJeWg3d3JQQVNtNkEyMHo4d0cxYlpoNVZ3dy9lM3hsT1I4SVpU?=
 =?utf-8?B?cFZCRm9nYmVrdnVUcytMNE52YU0wWUw1UW45UmZDQ1lxOHY2TGloL3llTnFM?=
 =?utf-8?B?SGZ6M3V3MythMllJV1VjZXlHL0RZTFp3UG5rZEIzNEJhOFFQcnl6bmN3a0ZI?=
 =?utf-8?B?TjVlSnhESmpjWnlERXVpUk80TWdBT0xaYVFjUVdmTmJ1MVNwR2h6R2NHUDdP?=
 =?utf-8?B?SXhRQUQ4MDB2emUwTDhJeXpCZEg5c0VPOXBhM0FDU3NNdHNVMXpiMStJcWZQ?=
 =?utf-8?B?SXJvMnZvK01pVW5wM2RvVndPa2dQUG5JdkMrMm9hd1EydDAzcVQwdTh6eXNC?=
 =?utf-8?B?dHlkWWwrNStoMWRWRlVMT05oTFhyODM5MVNnZHMrRzZ0M3AzZHdDcTcyZnF0?=
 =?utf-8?B?RWZzbFR2WUFrUDdTN21ZTUFleVZnMW1iOE9TMVFxeHk1Um5LRHVJazc2WFl6?=
 =?utf-8?B?K0FXZGhaZVZoUEhBOU9wTSs0bTNxRXAyb25SU0taTE55UWpYOUtPVnJqV21N?=
 =?utf-8?B?SGJ1cHdPdmVGYThjZ3BHYmVZYjRBVldQQkV6UmlwejV6MUJSSHI0MkNHQkY2?=
 =?utf-8?B?ZlcwNUdMOGZMV1NrejZCczJ4R3FVblVUaHEzenRKcWZuUlIrd3ErdngxTmMx?=
 =?utf-8?B?UzRieDdFWFN0KzFCV3B0WUtPZjVER21UVlB6MXZrWW9ZTmV5UmdCVjI4WWo1?=
 =?utf-8?B?eXhRbkFnLzE0VzhNOWhsSmtBSitJVjZrNUZicEkwTForUjB1OVhCR0krY3ZQ?=
 =?utf-8?B?UjBNemx6TkNQZzRseDZqUkd1cnZWbDFkYkY2QmRUWnJsVUh1ems5VEhvdURj?=
 =?utf-8?B?S2dFdzBjYloyUnNDYloyNGlKaGhmanhRZVhNS2ZiR1Mzb3NUNnNRR29wR1Va?=
 =?utf-8?B?TWF5MmhIbHBlRWgrYTRRRk1nTXdtVjJiNEpiRzg3dlE4Zi90YzNhbmtVWVZh?=
 =?utf-8?B?clNYbHppRkJ6T0R2bGpQenpYZEhXZVFEZjg5L3lVeDdkaFRWZ1M3dW5kS2xm?=
 =?utf-8?B?RnlNQ3lBY0p4MW1OdmpNL0NrWm1Fbk01aDFIc1J3U0NEc3pxY1FRQXlPb1du?=
 =?utf-8?B?Y3U0ZmlIWFNPUVAzK1ExZ0RTQzc1SWRmYzRob0JXSjdKT2ZiK04yeWZPUTZB?=
 =?utf-8?B?ZndYdVRhYlY3bnAyak00UGJuUmxYRTR4Nk9Rb2o2TVArdm9zUmlrNTZVVm5q?=
 =?utf-8?Q?DD2E+i7wFEvkEb04SvcJU6um0QBWSRrktVz953WrWNbW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401ef1df-6a0b-4fc6-6913-08db6b375b97
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:22:50.9840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFlERHHz0dTWSILZTYD8j55PRx7AhmC8Cc/n6mz5sU46MrOZx32x7S4gqFRsCU2v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7533
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 10.06.23 um 04:12 schrieb Sukrut Bellary:
> smatch warning:
> 	drivers/accel/qaic/qaic_data.c:620 qaic_free_object() error:
> 		dereferencing freed memory 'obj->import_attach'
>
> obj->import_attach is detached and freed using dma_buf_detach().
> But used after free to decrease the dmabuf ref count using
> dma_buf_put().
>
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> ---
>   drivers/accel/qaic/qaic_data.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index e42c1f9ffff8..7cba4d680ea8 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -613,11 +613,13 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
>   static void qaic_free_object(struct drm_gem_object *obj)
>   {
>   	struct qaic_bo *bo = to_qaic_bo(obj);
> +	struct dma_buf *dmabuf;

Maybe move that variable into the if.

>   
>   	if (obj->import_attach) {
>   		/* DMABUF/PRIME Path */
> +		dmabuf = obj->import_attach->dmabuf;
>   		dma_buf_detach(obj->import_attach->dmabuf, obj->import_attach);
> -		dma_buf_put(obj->import_attach->dmabuf);
> +		dma_buf_put(dmabuf);

I strongly assume you are not using the GEM prime helpers for this?

Christian.

>   	} else {
>   		/* Private buffer allocation path */
>   		qaic_free_sgt(bo->sgt);

