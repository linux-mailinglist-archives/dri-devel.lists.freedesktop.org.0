Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3C4F6232
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F94210E2D5;
	Wed,  6 Apr 2022 14:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC44210E2D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 14:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc9+ifHf+PVGe//ixUDiQ5DoZtQ0UPLuXcT1l1AQ69B5A01wUjEJyC4mOaWY7CwlAefIKXU/QwvETtm8/f656tgdBiS+0wwHQyhksUQ4fB4SZopG7j+xNuehhbS5Lv0XA2dD1BLka0hqfQPkSGLuxaGbvSh8HbVjwHU/KHLzTEXHxDo57Qt1lWEzrMDrW856POK4Pm4roOq2JB5dQfeBFaqFJPyhyfHZvgIAiUbvbo6sLZrqGsGpfFDrL7mAlzzHOh76Um+txZEO40PzaFEkn0pH+0u31+2ZpzEASqojnS7UAhIzoJN45us4zqoj+lM/hHW61tsS6SR6cTo75lZzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfzbVuITd44qdGWjijmKNlaY3ns8VL/9nwOF5i+TLgU=;
 b=Byopfff0EBSR8S4O4E1vOL7LgerN3m3a9y4RxFQ+M9qNxSTOR6js/vzEFmpqHU0Ajp/N35TdXUlRHMhTQvo6i1x4Yy3YX2zgTwOUYRqomo71c897aoBn8bFhzk8OC4kxd/SovR5DgmcEIKZZ2qZ5f1jsJtR7OBJMbL2s1m1yJ8H78VH2K+rXKf+VULtTKbctKb4ot2BPbdZ2AB6/IBBixMEW3GcszhlHNJKlJfuGuyUE+N5nlRkIrM5bBcnWbQfxAQ2Ork7g2ersm4yrqVuWcUdv7i16kb+/NBeg19j9C1wtYR2CcdSaRGvP+91EnQaJvVX25CpMQJna/2Izr8nOrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfzbVuITd44qdGWjijmKNlaY3ns8VL/9nwOF5i+TLgU=;
 b=sdiZvXtxO5/4aQAZkxZDKyRbPX3k8ruCl2i7WBgBKgAWTNoE5VVNa2v23XSrmtP4R3yhEuMZpbcSv8MRrxeaiqb/aLXj2tZG7krhRz8kH4uMrfqvpH6/GYv/mstrIimVpyHPd+9RLUdMGkcQeouUUNZlvEwa2XJdSi3NYWxz/TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 14:54:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.021; Wed, 6 Apr 2022
 14:54:08 +0000
Message-ID: <0228f800-9cc1-e640-4eb3-771f81e1717a@amd.com>
Date: Wed, 6 Apr 2022 16:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 06/16] drm/amdgpu: use DMA_RESV_USAGE_KERNEL
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, DMA-resvusage@phenom.ffwll.local
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-7-christian.koenig@amd.com>
 <Yk2Kyhf7Ah9IkNne@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yk2Kyhf7Ah9IkNne@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0180.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d447277-5242-42c4-8a80-08da17dd4daf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440D5DF1142621B4463FB8B83E79@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aisrPEsJLBjFg/DZXnf/srq1HYJkU/9qCto165Yf/Q77Ds2KXPvgoAFG1BuR78fGqqOsmk1NqCSCWnSHdp+lOPrhr7n6/jvXR6zjvMsb8+ekfTUYVyX62ZXsjDfcSGOgBqeqrZlxr3ElCFVo9CzSQkqtP5ujAiM/Bs7BzYISBlFBN9yCj8reJ38GjlDAWDsGiDzAdsx7DZRzfgIzCn5zE7KhUnYUJ8RMzYED+xucpvbxdjli5bZKJcYbs7FA8a6Y5lZVkPxMmTgQID4uN12Hn12PQTdKagHOg4FCneF40YX1f1b8oxb7MTzD+og+eK/qsM+Zxm8gMvY3GIoiF8RDfEBacZKZgIZqok9cGHQxC/gSb0WQpRK50ta8OA7CEMsgZbNHLmff17DF6K69f4ruZMkPN/ZF5e5c9n5/4HdikfzJluodlgn5LKXy32StISOi0G7hZYWXC2hZF2vw0jQAX38joGdQH8vB3ndSHEP7UB0/Z118H2Kjkiim/WA9Ds1ZMrutn99bCIH8g3MkEqYlKJ8ZGva8UG+4Ej98S1FMNdt0+IRVBQBqEY/+4Qdkjffdg0X9dzPHBhisruzadZdov3r/zdDcbFb//9nNtBhcxpKsD5hvp/k5FA92fc4LR8dUg1l/7rL0lxk86p+z5nzM/x+E/0Wh7qob97UQ7PrajafcalsQEJALEgbB8w9STJR7vd0J+tAK+hbKhytM/ugGpaFZ3KFcm3PrJIqX6AI018k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(2906002)(31696002)(86362001)(6506007)(6666004)(6512007)(38100700002)(316002)(31686004)(66556008)(2616005)(66574015)(186003)(83380400001)(36756003)(66476007)(6486002)(4326008)(508600001)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFYaHkrRVlXRHVsdTRFZER6Z1pINHFRYzdEem9LbWt4WlUyR2hOME1GcTJr?=
 =?utf-8?B?aUQ4Y0hOdDQ2NkcrSkZubVlvVTd0cFkwYklFbERjejV3eC9ETTdrWVNMZXdl?=
 =?utf-8?B?MnAxVmZVVGptK3F4K1dMZzRSM2ZEMUp3blo0N05KZ1lNMlNNckpVd21YSE96?=
 =?utf-8?B?eDMwTi9rWnlWZWhNWlA2N2pQNGlGdUJxV3pzZDdTSzFIM2FTdGlsMXQ1TjN6?=
 =?utf-8?B?enhiQ3k3YlBqREpFMm0xUVQ4NDRZL3UvdzZUU2lDZmQzSFRyMjV2UExNNTVF?=
 =?utf-8?B?NUtMZkhlNnoyd2t1WE1RdUthcXZYS25hbTBWNDJEbGJVWXpheXIzZGZJZ3Q5?=
 =?utf-8?B?VmVRMGdwSG9EaytTcjAwWlZuUllHekE2Znk3NG1UVjRneTIrRjg2eHZqa2Mw?=
 =?utf-8?B?ZWJ3a3FGa3ZxbEcxTFozUEltblh3Yy9hL0FCbkRQSUxwR3NRNHEzZzJtbEZy?=
 =?utf-8?B?bHVxTll5dkxCS09KQ3RydE9lUE9GODRiYUNEcC9HbThRcE9jalIvMm5KLzdR?=
 =?utf-8?B?akZXa2laRWoxTXZ2V2szejJnU1h5UnM0TFl1bU1CWjVvWWsxdE9Sc3NmSElP?=
 =?utf-8?B?YUNBbXdBSXpoTjdydVRBbVU0YUNrK1BQS0hoZWhFMkFaWThNOW5KQ0RJQVFo?=
 =?utf-8?B?VmVLREs0aG9JQ2dGWVAvTVk5TUxvUjE3WTdwN2FhMEFSYWIraTA0OWRnbGdx?=
 =?utf-8?B?RXJMM2NtTGp6SWFqbmRXdExsbExIaUJUV2tkNkN4dVE3MmI2b0JtK05IaGt1?=
 =?utf-8?B?Y3JuWlp2RHZHNjZzTXFXSzdXOVd4bVoxb1d6V1hSbVNQT1lVbzdyUkN5YmZq?=
 =?utf-8?B?ckR5UFhDQzB1cnI1dXdWOCtDRFhxWXdvamhKekVWSzI4KzZzcVBJOFB0VzRa?=
 =?utf-8?B?QWRueHlOVWpnaEFyZGRQS0ZjWTB3U1I0cEVUOFBhYk1LK09uU1dVZG9LSzFJ?=
 =?utf-8?B?aUpBRy96SXluZ2hzSzBodDhXVlhFL2xqU001ZHFFYWVIRENocklOU3E5QWNC?=
 =?utf-8?B?WG8yaXFwUFhqRmhVT2I5b01jaWJuRkd2QTJPaGVoN0tMZGc4K2RwUDNCUE5F?=
 =?utf-8?B?bmliS3VrODBBNzFnTENuempOaFVDUUFUdHltY2E1Z1phVWlWb3JaWDduY2tR?=
 =?utf-8?B?MlBaTmJ2Rjh1OUNlOEFHRTVwYmpEQlNwdHU5OFFaN3NYcGc0eUZWL1FldjJU?=
 =?utf-8?B?Rk9XRG4yTjExbmVHQkc1OTNVTTFJT0NtQTM4K3FxR3V1a0srUTlKS1lyZzMy?=
 =?utf-8?B?NkNaaVVXU1ZuRHpWQkZIQ1ZxQUlRdkJhTkVIeWx0V2Nib0w3ZHlPMUkwRFZX?=
 =?utf-8?B?MGxhYVZZNzFLdDN0cEVEMEJZZkZKK2ZVU2c0K1J6d2p4TUtXZ25jcWJQanhH?=
 =?utf-8?B?dkc4WEcxYXpnWEFCSUNCNjBTZk5xME9pQUxSTXk5dStlTElhRWh0U0ZKNUFn?=
 =?utf-8?B?VmNpeXNYWTJ4WmhrY2x5WkpFQkd0Yk1IckUwaFBwbVBERFNqOHJDQ2hWbmhs?=
 =?utf-8?B?Znhlemwwc3NiTVlUNDVLbUJVdjg1bWluaFg3eW9uZzE4d3UrYTNEQ0JXeFhZ?=
 =?utf-8?B?RUpQVWU3aUdCVlNxSWlmUEJLTkVZY1ZtM1I1ajFaNGdIYytiaENQKytxdkZi?=
 =?utf-8?B?Q1crN1R6dTZuekpIUjQxaWZxY1JiRlNVbkN1Vy9iWG85cVBsZk9WVXNHN0dC?=
 =?utf-8?B?bkNSLzdhcXdBYzNVbHl6c1pwdHJYWWUyUHY2MlpsdllQNUJmTWoxUzM1WnY2?=
 =?utf-8?B?YWh3Uk9WT3paclFGcERWUVVjUDdGd0R3bkpSOWNmTnlXdm4vcUJPWURlcGxr?=
 =?utf-8?B?R0JXaVBUSzNGdDFibXZqSmJBNGtXZVpOQi9MNlhTVGM5RGRNQWRYKy9JdEpy?=
 =?utf-8?B?SWNWUzBjWjBiRjFJa1FYUk5YblpnZWlNbVlnbVlvcUVmMVhhdVFkL2NuUm1K?=
 =?utf-8?B?enI0cGZWU2EzNlBwWE1xRDdTbDdiWjNPSlNrVGlDUThUT0FlMkhiK3BKR29K?=
 =?utf-8?B?dGZlNHJhQi9OTzNVbk1hZFE1eUpYbkRDaEJ0Y2UxRFZmTXpoaTFCdXBtM0l2?=
 =?utf-8?B?Qmh2SEpvcTkyMkNxRTY5Skg2TjkrL2tPazFBSGFIUHA5Q3dVS0tUOUJYbU40?=
 =?utf-8?B?M3V3Y0c0SFVHZHNiZklLZDBlVGJQZjVyOWg0S04ySWdMbjJQSTVaaHB5aE5D?=
 =?utf-8?B?Y1B3OEljTXQzekZlKzR4VWlrVGlXTXhsSkdpSi9MZWp6WGcwRWZUS3crbGl5?=
 =?utf-8?B?cjNWMml0U3NmS0l5cmJ5S085Q3B0NVp2M2xPWERLVzRhVVBaRkkzUlhrZ1lW?=
 =?utf-8?B?SmF3K1ZFaEtPV1M1UkVwaytTWjh2VE1oQkhxcXdGQjk0dFdpbXR0US9rYzNs?=
 =?utf-8?Q?XdMqNF0Y7QsaDSA3zhfKZjbL8cKgnfei6UxVn6jLZ05AM?=
X-MS-Exchange-AntiSpam-MessageData-1: 5CPU3ikNZxJMrQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d447277-5242-42c4-8a80-08da17dd4daf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:54:08.7876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWFDxRHrb8G4RrN0izJcsNzRZ+2jJ2nWwhRIODcTy51ylQN2D+H81bBnJiDUFAOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.22 um 14:42 schrieb Daniel Vetter:
> On Wed, Apr 06, 2022 at 09:51:22AM +0200, Christian König wrote:
>> Wait only for kernel fences before kmap or UVD direct submission.
>>
>> This also makes sure that we always wait in amdgpu_bo_kmap() even when
>> returning a cached pointer.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c    |  2 +-
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index a3cdf8a24377..5832c05ab10d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -761,6 +761,11 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>>   	if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
>>   		return -EPERM;
>>   
>> +	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
>> +				  false, MAX_SCHEDULE_TIMEOUT);
>> +	if (r < 0)
>> +		return r;
>> +
>>   	kptr = amdgpu_bo_kptr(bo);
>>   	if (kptr) {
>>   		if (ptr)
>> @@ -768,11 +773,6 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>>   		return 0;
>>   	}
>>   
>> -	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
>> -				  false, MAX_SCHEDULE_TIMEOUT);
>> -	if (r < 0)
>> -		return r;
>> -
>>   	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
> I wonder whether waiting for kernel fences shouldn't be ttm's duty here.
> Anyway patch makes some sense to me.

I was thinking the same and already had it halve implemented until I 
realized that this won't work because of the ptr caching.

Need to move that around as well and rework the whole handling.

Christian.

>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>   	if (r)
>>   		return r;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> index 3654326219e0..6eac649499d3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> @@ -1164,7 +1164,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>>   
>>   	if (direct) {
>>   		r = dma_resv_wait_timeout(bo->tbo.base.resv,
>> -					  DMA_RESV_USAGE_WRITE, false,
>> +					  DMA_RESV_USAGE_KERNEL, false,
>>   					  msecs_to_jiffies(10));
>>   		if (r == 0)
>>   			r = -ETIMEDOUT;
>> -- 
>> 2.25.1
>>

