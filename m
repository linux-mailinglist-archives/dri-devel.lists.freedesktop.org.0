Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0D43C5CE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19D26E575;
	Wed, 27 Oct 2021 08:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE7E6E575
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 08:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7foPRaXaBzhFe40MqULUquTuYm69Va2oa34F7j4FAuAVfsEfB91b2Gc/rcRNOcHSksqo1loLSU/t/34kiq03QdAUIl4Arb9DSFMYy4IUnHP4pcn5cO1kiN0xB3E94gxx55x0SZ8FvWaxrfd7KzskFQ8sp5+XbK63LpHs5KuM6NmwzJoIHYMguOZKPGUU92TzBYgsAyeMY8KD0DMM1RgtD946yD/EOdco3/+L5SladCgSz4d/1GiFAvY23NWSmQRlJiazARIJ0+8+fTnFxkfgd5D2qKAO9yMvz3QDf+vLRdIlUOqyKTo1e18lq0eYNTHUdfrEo5uY0lu0f4RKYh3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EblLwHJyApZQP5p8hS/qIy6IOnVFwpPLc+BANddsAr4=;
 b=SIFVueMSyC8hIDxCAHsu6lQ8uGrt0xY7YSHqz4vMWk1RD/ujt8EUV8kHVeGQoVeSUcnPOQi0k+u7Pb0Mvgt09jqifhgSKkUb7PNuqeWhUzE8ZDpa15lVuZVTwUU0bgV7oAWxUwHkCfz0I7+SbyIdZGVQGUwxuqpykHTb+/qo3j2Uz0c9mG3s+VMo1b0tnCIl4U+3bVrIX7VWo40vU/OsmJ+V5C3YxlEsBsdPC0bDuM5fWNZUoBcGl/gXaiDYONpNiCaM/Tn0zmk5RYAJGsp5Y4+fqRNyyhLMD8r/fb+kWVe4eDBgNXGoIkTQl+1t7PmrLw0DJ48u2Vij/yHua9XwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EblLwHJyApZQP5p8hS/qIy6IOnVFwpPLc+BANddsAr4=;
 b=piN7HR52J/zOglrN6/ADXQUoSJkR4QqNceiJZaW1vJz+JGPEbPct7uzr0wpocL6lOd6H3MvvO2+HeVa4dGgT8ptm6AoWeEjUD/au1kYzo4D8VAbktgT6W0BtE7I69h6haYgEXMQPpua1G6o2lrnGkmK8LYYF7dy49l+Ns0HK9x0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5432.namprd12.prod.outlook.com (2603:10b6:8:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 27 Oct
 2021 08:58:26 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 08:58:26 +0000
Message-ID: <bab91258-3879-eed0-89c3-cd86722b9718@amd.com>
Date: Wed, 27 Oct 2021 10:58:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] drm/etnaviv: use new iterator in etnaviv_gem_describe
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20211025080532.177424-1-christian.koenig@amd.com>
 <20211025080532.177424-2-christian.koenig@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
In-Reply-To: <20211025080532.177424-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0601CA0057.eurprd06.prod.outlook.com
 (2603:10a6:206::22) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [192.168.178.88] (217.86.121.186) by
 AM5PR0601CA0057.eurprd06.prod.outlook.com (2603:10a6:206::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 08:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5e18679-2fcb-42b7-6da5-08d99927f038
X-MS-TrafficTypeDiagnostic: DM8PR12MB5432:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5432F5678EE5243C2FE8121B8B859@DM8PR12MB5432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmL6yvWlJ5z+pAVth4Mc6RKcQOaLc9fW58vCZvHjT0v2dMCUG84W9SW77+3GNDcXPISVIfwcXjDEp1rb623HAbZ+S+iCzxQy1Pf5eK5DldAhn6b0q8v46933zUaRuPxjM6Y/1Ds4wRYo3y5yJS8G9mWA1DHaxJQoDb0X7IdjAtrCJ6cKZ3IDGC5KlOupfArEyP94V26urmTMBbqkSctn/eoFUfVzcqAUNVg8TycLpSFVpHQujbqZ32f8P0U0BDJ5POdBq6/Ml30p5oekrX+YX1AUzaruTrNQaZk2oQQ7o9Ah0IcoKuB3MpRXsV+eeo5e1QdHY6hgF/BGkwNaCxvSzjsM92AO78CHKiOVwLkfi5TTHyLwweyzLbBKhJFLCetoLqZGsQWYxMenzm5qdXHcO9CdnFOgKK5br4mt66qLGhZiaxscHD3YT7hXpYL6SY/qpzP2a9DUQ4k4BgK+CPLMergB4HuzvNXDMpc06NT9Ujfg9DI3P+b4WTJpa9YPQOjJoqX5uPeUeCCr41h42QF3ZVrQngC50zjyFzfeUoasDSOIEUcXtxgtXCn/hgPfFwHHEzwMXmiGybFNAsHQFdIGPr+APZOXJN5eawywOoCRO1LsrrkXfYu6nFKCKXuVNmjcuUQ98X4gNskwGTrujpC83uMbfmCzcwUEcCqtdpirTMVmOwnM6yz5hb6bmbiBfWsnIgQF0wT/fsBpRMD6WcMHLSQGC2QEYLpx1BO/Q3XTRsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(53546011)(6486002)(2616005)(956004)(6916009)(31696002)(66574015)(31686004)(86362001)(26005)(66946007)(38100700002)(66556008)(6666004)(186003)(8676002)(16576012)(83380400001)(2906002)(5660300002)(508600001)(66476007)(36756003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1V5TGdLUzRoODh3aExlOWZ6dHU2RnhsQnlFRWswZHRZZEp6UE1OT01nNXJn?=
 =?utf-8?B?QUpMeGlUNUVtTjlMUFBIZDRzMGxpTm9QaHVSRFd0ZDZkUUIxdk5xdTA0dms1?=
 =?utf-8?B?UEorVlZ6c05tQVdkRHNZNzJTRW13VENvZkNNL1crQVpYSGVWaVJ4VnI1Y3I5?=
 =?utf-8?B?TlVEUkYyYTZMcGg3czZPZFl0L3ZMbW5QbGpmWUlZNXBYRnJDUjVkcEhzQVhF?=
 =?utf-8?B?am8zdzV1dk5uL292U2t1ZXdmTzd1WkxlRjBhcDJDaFprS3FtazFvTnZCd1B2?=
 =?utf-8?B?dFczWGYvWXhyeGRZdTA2TFhzNmV4V2FiUXVreWprSHU1M1hLd2xTODRCbytj?=
 =?utf-8?B?RjQ5V2o1cktINXlDdm9rKytNS1F2VStWUTVBYlpDdjdTRXh4UkNuREVoWlZT?=
 =?utf-8?B?cEF0UkRTOGhFUzh4UkU3OGJ4WExjUHN4MS9iYVhkaFFWQi9samRyaG5SUGZz?=
 =?utf-8?B?VEl4T01jbDM4Mm81WXppZlVGNUloVk03NWEwMlNEZzZLc011akIrMzkxODJJ?=
 =?utf-8?B?bVBzNTcrajA5aE5BOFZBWUd3U0MxVVc2UUVVTTAyVFlaR0NxMnN1eUtDSGcr?=
 =?utf-8?B?bnlZUHdYYm04OUY2WlY1ODFGYk5VWWRzRG9SVWNsU3E3bHhsWHlVVUEvTE1u?=
 =?utf-8?B?cDhEY2RFb2ZoNTR6Tk1LVWEzR3A5M2poQXhFbVEybUEvYkNpU01kdU14ZXVn?=
 =?utf-8?B?cytZMnN1YVpxcG9COGNaSXU4Nk5QekthdlVwN3JOSHdjQkZQazF0K04zQ3cx?=
 =?utf-8?B?VHF5NVg3eGFHQW4xME9Da2tobi9sZ3N1SmZxMlVOMTVheVh3RDVydUx1SUds?=
 =?utf-8?B?aDhFQlZPU0dnUStYeTJPMFBVdVBIL3FrcXZzTW5IM0YyM2F3MGdRcFJpUCsy?=
 =?utf-8?B?Y2V6bWdBM3p1Q2ltMmMrYnJTanlUbmJLS2w4RFFvazlJUFNISXhHRE1KOGc3?=
 =?utf-8?B?dGppU1R1ZUJpZ0p1UmhOYlRZOVBOT3AxeXJVNUlmMjN6TkszbW5URS8vNjVk?=
 =?utf-8?B?Z29hcHBTY2kyclBvMjdnWnlSZFlTamNwMXJhd1kwZ2hYbGhBck9WVVJOVitU?=
 =?utf-8?B?eGtQYVV4OGtyVjNxbjlndVhEcVpEWE9KdjhsaWlnWXQ3aDZKd2FNRTM3bkJG?=
 =?utf-8?B?V2xSUkQ3KyszUTZROERySzRxak9iL0pKNXBocUl1NVJ1K0Y2TnBJUEpTMDBy?=
 =?utf-8?B?dDU1R0xIc0tmMjhIcUJKM3BINXh6d2RNOGdFaFNCa1pmYXVkdTU4MzRnR1VT?=
 =?utf-8?B?M3BiRDYxQjVuaEhJNkhrTXY1TVN5Y3ZuVXpkTTY2Y3hxNllFbkxqbmppK0d4?=
 =?utf-8?B?TDMydndlSlRKUEdIWDRBVkZLSEU3UmFDZzVicnpPdDl5VDRaQUtGVTFtc3Nu?=
 =?utf-8?B?d3c1STdRK29Pc0I4SndlTDhBUStSWFBOTmNib1MxZFpKSDVIdnZvR2ZGcmhq?=
 =?utf-8?B?MWtUYXI1L2tEV25xNTgyQkVoK2Q3OWo0ck5VcXpWVEdMV1h4NnpiZS8rMTNE?=
 =?utf-8?B?MTdreHN5YUswMWtrd3ozZzdRVnpYd051T3p1WEduaC8yL1ltRW5FQnZNUGFo?=
 =?utf-8?B?dmhDTGt0TFVMZ2tHM09Id09ESExuWW9WSmlYY3Z4a00xN0pyQWU5aGNNOWxn?=
 =?utf-8?B?SGhiU0pnd0VoV0t2ZmVNRlRGVEx5SWREQ0liTHFKbjEwNlBpTU1XV09kNERo?=
 =?utf-8?B?NDRIOGRwdXhSN3pvc1pBdXNTNGpONXF0YjlQOGlFVXJILzVxc3lKQWMvVXM2?=
 =?utf-8?B?aXUxamdmZEpveFFZME9tRzgrNXJWblJWSWVDWjMzNGlwQUhMWXgrdldGTXpF?=
 =?utf-8?B?ZkJJZGw3aWYyWjRrbVVlOEMvZmFkL3VMM1hGM2xKcDloVE5KRlg3UVNkUWgz?=
 =?utf-8?B?bU1TTXVlVXZ2MS9MV2tRRzBsNEVLL2trUDU2MXBkMVdXRUJyWmY2UithWXl5?=
 =?utf-8?B?U01INW55RjMrdk9vQURxVnZSd2ZWRjN6M2htaEN4YTR2YXNpRXJPUzl0QW5N?=
 =?utf-8?B?QTZOUXJhSndlSDZnOU5haXpnMUc1U3pTNmdXTExPRmFBMzhqT2VaNXpDYzhT?=
 =?utf-8?B?K05OVklHeG0wREV4djNYWlV3ZnQxSDk0VFVvQXpvcnhJTFFwVDBIUVByazRH?=
 =?utf-8?B?eDNCZlhhaHJ0aGRuQlhOYWZWWUVNS0NldFk2SUJ4MkxrMjVkVnBDT0FzZWp1?=
 =?utf-8?Q?nOz32BH/3xtISxFUAjysemg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e18679-2fcb-42b7-6da5-08d99927f038
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 08:58:26.4452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42ZqUt7hhV6Bvx5Zr7fT6UBRfjzyoNphoQYtFRvCIY1ynXIuEde7I2JWGUOKCn0KspHj7Z9yyfgVyKUZwENCRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5432
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

LGTM,  Acked-by: Nirmoy Das <nirmoy.das@amd.com> for the series.

On 10/25/2021 10:05 AM, Christian König wrote:
> Instead of hand rolling the logic.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 31 ++++++++++-----------------
>   1 file changed, 11 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 8f1b5af47dd6..0eeb33de2ff4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -428,19 +428,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
>   static void etnaviv_gem_describe_fence(struct dma_fence *fence,
>   	const char *type, struct seq_file *m)
>   {
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		seq_printf(m, "\t%9s: %s %s seq %llu\n",
> -			   type,
> -			   fence->ops->get_driver_name(fence),
> -			   fence->ops->get_timeline_name(fence),
> -			   fence->seqno);
> +	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
> +		   fence->ops->get_driver_name(fence),
> +		   fence->ops->get_timeline_name(fence),
> +		   fence->seqno);
>   }
>   
>   static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>   {
>   	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>   	struct dma_resv *robj = obj->resv;
> -	struct dma_resv_list *fobj;
> +	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
>   	unsigned long off = drm_vma_node_start(&obj->vma_node);
>   
> @@ -449,21 +447,14 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>   			obj->name, kref_read(&obj->refcount),
>   			off, etnaviv_obj->vaddr, obj->size);
>   
> -	rcu_read_lock();
> -	fobj = dma_resv_shared_list(robj);
> -	if (fobj) {
> -		unsigned int i, shared_count = fobj->shared_count;
> -
> -		for (i = 0; i < shared_count; i++) {
> -			fence = rcu_dereference(fobj->shared[i]);
> +	dma_resv_iter_begin(&cursor, robj, true);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		if (dma_resv_iter_is_exclusive(&cursor))
> +			etnaviv_gem_describe_fence(fence, "Exclusive", m);
> +		else
>   			etnaviv_gem_describe_fence(fence, "Shared", m);
> -		}
>   	}
> -
> -	fence = dma_resv_excl_fence(robj);
> -	if (fence)
> -		etnaviv_gem_describe_fence(fence, "Exclusive", m);
> -	rcu_read_unlock();
> +	dma_resv_iter_end(&cursor);
>   }
>   
>   void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
