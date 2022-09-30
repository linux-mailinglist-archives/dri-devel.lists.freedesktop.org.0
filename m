Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA255F116C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 20:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C37010ED88;
	Fri, 30 Sep 2022 18:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB6310ED85;
 Fri, 30 Sep 2022 18:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dta9D6M9UbCsrPsNYowIYUIsYcikaYjSZXLmLkPLRAMlZnkFgPociq1eBfZepcqlwtrMDjzOiXTQDq1fN5VtgkU5dIsyiveEdlAAkR0k3fhDFWlptydXXymQsH+Nk8htYqIfcJsPg321XHLes9ldK3SIxGWus38tCg47L9TOwK3OC+y82fD2xA/S6f8bJHfzBEN83s5cuSU1zhcJSCRxfy6/Aox1zds7HYP57zfdTWnO+j4b/6vVZ8WkLGsLP+o6cB6qSr0rdTm3B+blRaTA5fPlxtHMpkJX8dkqsVgIF3J3TG2Vn2ITEy7xpzFL2AYJoUzhTkmHwy5FDFrkbvQUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KygHca/meMIcBA3IWzK2YjyCruqynYwAIfmXw0DHJA=;
 b=lj6pjnw0/+0XFJQ7ZjS2t4xvDzDkOABW2cPdR55RYKM9zpKwje187lavWCh9YDLOV7lg45f9zHIZ15HDNZLWVto9kv9mS9tlolyQ2EhD/kwc7L/dZz9jAHjev7hp8ToNzolkFt7/eMMz6M3TQyj9HXnltHImCh3lNLtVvsaJydNn7FacdV1L0H8GEb6qrBX3O3JFqxKkF6j7Pn5NtG8GXSDUUkAGH5ID97xWGhBG/agC9JKe697kLWqpWSguOI76cV/rPHwPgqHovnS6L9Mj2Eiy4pMMbOGcf/D5H/iPOsSA5z/1lfq6DfhbJeftHSrTT2QATkk41OxhzmDiXOB6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KygHca/meMIcBA3IWzK2YjyCruqynYwAIfmXw0DHJA=;
 b=uDSmfQiZkVeXg1rlIuocYttVSBa0K6RhAYNTDZGbV4cs6Ed3WWeHp9IG+3Uyc0GMV7P1fTfJtogat2kvfdoiaRskBTEIvnTCbN0XQJrxFXta4IWdJr6skvgUZBx+DPwuW8vsV2GRlc6koafJxnxPD66qzS2FlvUEBzTmlFKj3yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6088.namprd12.prod.outlook.com (2603:10b6:8:af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Fri, 30 Sep
 2022 18:15:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 18:15:54 +0000
Message-ID: <81b02e48-438a-bc24-dff1-b94969016e52@amd.com>
Date: Fri, 30 Sep 2022 20:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: move bo->resource check in vm_access
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220930153957.416938-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220930153957.416938-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: f941aa36-ee58-40d9-acb9-08daa30fd03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sGuee6y9uW5PBRNYQHDI5J2WyAO+ZAlLcPQsbREJMALjHFCrq59OhjB3WUI2gVBe/8prBc5DgMKWV7EZr7QeA6zUJAsUYJRpVHQoIPE/HIwzAOYbQnP6y/+RcNIU7YO380dPSVGis9m5CpvYAaE4gziOle2ah0CJsHkYZ8totBwXlztS9NyAx8s7qbxK9EkDQWFZ3B4HuB24KktlbsSsET22ck8g7VnqNst0vmGunImxHj2eKxzDxD6gPGqPyCzQ3w0MJzduESaYn4J1PcXKWt+mcHX0DTT8W35QwNW0X2v0aPDWYaIOTywtGYldsRey67fgfP4laMCg/dPPlVY5/yjV3ioRrgCYT4SllQ1/A6+9GxjBSara9EDukA5OuPS6IqMjLSzXuGYsbyt6ZMe42OjUgC0kNgBJ7brHp+d0uoCj0oSdycrDHS3GBeHQWaF9i0C04HnoaEpbasBWehTPteYyXo56PAm7eQhItP5g3IYh6U+0R2p/i7fekvCoeY+icVHr+JVrdeBf1JqcRFosMzUhzWSDrc0d0l9FIhbdXoFntwgHJuZjcs5ptFGiaQGc4dzOklsRyiXW+Tg3ONUpD3VLhr3jVsMZvvhcpk/+iJ9VDfdsR3oQiiSDjz5N07INEps9eDnPIcq2+fqyk/wZ3SLt3HkltC4jki7eLiDov4N8jIdCetYCBMI3WE6JN+r0JIHKwZ3e3ZL3nVhh3/1WKnKF6TxGVbTW/89Yh0QTSF4X8ZRXURNsB6HJfLd3Y4tkEdEBouxwJPHEPajV2DOMzt2M8Ud7eWVldhp9lU/sSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199015)(36756003)(38100700002)(31686004)(2906002)(31696002)(4326008)(5660300002)(41300700001)(316002)(66476007)(66556008)(186003)(83380400001)(8936002)(8676002)(86362001)(2616005)(66574015)(66946007)(6506007)(478600001)(6486002)(6666004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXJ4dDBUcGZDZ2hGVExRK3hrMUhvKzZ3bEdZeXorN0NEQmR5MEhqVEVTT0tH?=
 =?utf-8?B?OFVaKzBod0tub2hzTnp1di8yVWZqUDRLOFVsY29IU3pQY0l3MGJmQXBRZ1B4?=
 =?utf-8?B?WVc2MWZyNitEbWJMU3U4dUk1eSswTlVUMUhrZFd1MXBMY216QTVWcTZ3Z2Nn?=
 =?utf-8?B?aC9LbGJ3U0pjS2JhS0kzM3pCcDZPNGtoOWtLVDVNa0tpYVFlMVhXQnpha2pM?=
 =?utf-8?B?TWFYYXIvS3JaMUFQRlIvaUNSTlZKd01Pb21RNlhjNHFDZUdaWWJCVWE3bWo1?=
 =?utf-8?B?a0Z4R1dxRU9pTFFrU1VtSm9QMmp0S0E0K3hKcWxqOFVsdHNpczU0aGV0bkVR?=
 =?utf-8?B?WEpOWXlIWWFhd204WlZIako5R3pVYTkvV2VvYmN6Y0pIRHpiTVM2VkMyUVFu?=
 =?utf-8?B?dEtSM1Z5OFl2NHlMNlpnYU94OTAyc2h6VW4wcCtxbXZGRjlNbGR3SnBEdGRq?=
 =?utf-8?B?WDJ1VnZGYUFQOUZ3bDdEU3d2OXNqMHNwUXFuNVBGZXVvSDYxa1hRWWU2QXha?=
 =?utf-8?B?K29hOGlHN0R3VGJOeVkybWZzTGt1SmtyMmJBUncvdm1ROW11NzQyd0hOdE1S?=
 =?utf-8?B?RWlCZW5rbVNmMjV0YjBRcVlpaDRnOEVWZ056anp2TkhqK1JoOXpDdmtlbkFI?=
 =?utf-8?B?OHM3dWlyZ0pGbklzN2tFRyt2MzVUK0NBcExYNlplbHFYb0hnT3VLczJNdmlD?=
 =?utf-8?B?RzhNVnZmbFJnclNSM3AvQ2FKa2xmaEVlNEU4TXhlVVBTb1RldllmK0lZTEZM?=
 =?utf-8?B?aFNvTjdlam9LUCs2b3JLUUdMWVBhRERkSVA0UmhLYTcvYUNBekJXVTlLZ0xl?=
 =?utf-8?B?WFVHY0lzd0JhVXJWMnhGV1R6OUtBM3YwN01xcll4RFdmNjl5MUViTlBMVkFo?=
 =?utf-8?B?VUdiZy9RL2dOdG9ZRXZpcS9IS3lvT0VrK2N1aDd3RS9OdTlMRFV5UUJCK01U?=
 =?utf-8?B?WnlERjJoMGpFOXJPY1dOZkE0M3dqTkxoN3EvemhhWUVGdjlIS0paUlNlYmQz?=
 =?utf-8?B?VEpOQkFwZ0NMZ1NFaVdXMG1sL0QzODFab3pISzhiV2t2S0NtNEdLWWN2dVR0?=
 =?utf-8?B?RWprK0piZEVaR3BhTHpxdDJuUi9IM2s5cWYvbGoyNU5vWU5xbExISU1mTHZj?=
 =?utf-8?B?Zyt6Y0Z0bEdzS3kvdVNSdDJVNmd4MlhxT1VYbmhndW43cVo1MTloNkFTWHpo?=
 =?utf-8?B?WFMvV3BJbHVVZ1B0V1JlZUY3ZjF0U0ROL1JIb0E0NHNEWTByVCtOc0M4VlVh?=
 =?utf-8?B?TVE3ckgrMUtmUW0vM3MxQUZKL1lUVlF4c1FYYWp4ekk3NGEzZnVUaWh6cDJh?=
 =?utf-8?B?aDdmYnRnZDQyZ1JlUWF5bDUrVy9aV0QyaGpGYXFpOWRoaVcyNlNSd0RYek5o?=
 =?utf-8?B?aFByUXY4cDZ6TjM2cmF3WTRBc1V6SmxvenI2Q0xJNTBKZ3J5MnJsNUZWU2pR?=
 =?utf-8?B?clFWNDBmMGRkK1FydHdjRy9JUC9Oekc3S1dhbWJZdE4zUXY1all5OGFJNXov?=
 =?utf-8?B?dS9Hc2g2THFQbUIwRVlpRUx2dW1paS9FSjVLQml3eFNKMUlUbzkwMnMwMEJO?=
 =?utf-8?B?U1pnWnhRSUFPVTZZL2hITFNYSnl3QzI0STFRR2pFM1RwUVo1cWY5WnRoU0ZJ?=
 =?utf-8?B?MENSV2c2S3hmdTlHeGRvN3pMb1F3Nk5Oc0J0dVlXTExNQ1g3Vjgrc1VvZFpy?=
 =?utf-8?B?SG9hclZoUEtLQWNNOUZQdEFBMnVzYTRjZENWSE9oV0lZU2JvZ2NqdkQ1SXkr?=
 =?utf-8?B?cDJyM2RaRXVYSXBhOTBuYTlHNVp6clUyUDc1TENDREg2aFlKT0hSQzNsY1RS?=
 =?utf-8?B?NlVnRHM3RmpneG5xTkxuNUZlRW0yT1haT3NOeGV5amZ4TFlHWUZWQ2RhSW1Y?=
 =?utf-8?B?a0pRaFdWbzMxT1hITWFkZzJzYnJsbE51RDRPTzZjVDVuSmZkM0craFhtQ09m?=
 =?utf-8?B?cFRHYTNWVjdUSkZFbHU5VE9WNXdmZEthdUh3bzN2bUxQQ1ZGRmFERTM5SEFD?=
 =?utf-8?B?UUc2WkQvODcvSzdleFJEZWI0OEVkRG5XaUhUZEJiM3hFUWxuQ1psVzNvZXIv?=
 =?utf-8?B?NkVYTXVkZDRHVDBpWGFYUW40eGxIMXIwOFYwL2NjQ01MZTJIT0lPVXJLQm51?=
 =?utf-8?B?amRUNWJaU2UvaW5oZ2hUQm1kRFd4N1lkcWlFNHBXSXdib2k5TFdsSENyMnhJ?=
 =?utf-8?Q?5/mZ/xVv2KBISgx/dFDx0YWHn031AW9GTeuV6MqYMFDC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f941aa36-ee58-40d9-acb9-08daa30fd03b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 18:15:54.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KB8/E8YM9J1MIk0M5yxUfv7RycgKv10mhDgw4o6lvQQTn0sbqdM4S0IMwcnOv1cQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6088
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 30.09.22 um 17:39 schrieb Matthew Auld:
> Touching bo->resource looks like it should require first locking the
> object, since this state is dynamic and could potentially change from
> under us.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>


> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 38119311284d..8a0de14d8c85 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -412,13 +412,15 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		 << PAGE_SHIFT);
>   	int ret;
>   
> -	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages)
> -		return -EIO;
> -

Alternatively I think checking bo->base.size instead would probably be 
better.

Either way the patch is  Reviewed-by: Christian König 
<christian.koenig@amd.com>

Christian.

>   	ret = ttm_bo_reserve(bo, true, false, NULL);
>   	if (ret)
>   		return ret;
>   
> +	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages) {
> +		ret = -EIO;
> +		goto out_reserve;
> +	}
> +
>   	switch (bo->resource->mem_type) {
>   	case TTM_PL_SYSTEM:
>   		fallthrough;
> @@ -433,6 +435,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   			ret = -EIO;
>   	}
>   
> +out_reserve:
>   	ttm_bo_unreserve(bo);
>   
>   	return ret;

