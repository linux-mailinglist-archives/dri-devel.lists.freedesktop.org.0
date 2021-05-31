Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40359395AB1
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9201A6E91C;
	Mon, 31 May 2021 12:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9696E91B;
 Mon, 31 May 2021 12:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSSm/arBHA83OrUjv2dbcBrTIwrb3EI11eaezhmJYfXx29ssEGetNJ/paSXThW7T9al0C8qlkFj5HvMxc61FktFuJq5aMTc0c5pD3u4KT6U3VEDIyCTrPa8Y2KrUGsEWUQXM7JDxDIodIjow9NYmBrcOKN9SHBvZqIFN/zrRMkXRxAirRDeDs3nluuio4v26jSwTJlQNonqiEZhXPDmMOwqsIzHWHAn3NG7zMaTZ9N2SWhTJpwu54QdjqBZilEIrSDSExMZ+9svKnXsh0J2oByOHtTf08mZ3Pa/K8AgODsrEOqbvLCFHnpmaFIkC7YB0lCfIcXfk1FM+UVWmMVq/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWd6C0TzU2RSl9arJZjPHPBF47etp4r2JXbmiUaGmcM=;
 b=nDyrEXJgt9cyZCCq43vHQcwn7Bp/VfRWbFKR0mcQdPtEsjys4DRyH3Moo8ofyxG9RsPK1L215caeLE68QShYtADXldM7R5LqIWjT+zf/7h5wK9D1RoayWDEjNEJtB+fbWxShsVsQuV+p8xrD1OUATS0wg1g+6T7bYS5ld1wU98qUjKfyTsNyj+A6Qoi7JFnVbNkDN1M/Ayo8jlnNSNnNVyFGk07uvUhlpUFNkJEnyCwNr4wrA3unP7QDK6da8dLhLFaaRVkzwl1jtjWaLIny9LJo5CjJ0RIA0TZ2zjCCJTli/qQ7xP4FPVYnfU9EDZ0TjLGqF3Jn1C87tIFYNJaWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWd6C0TzU2RSl9arJZjPHPBF47etp4r2JXbmiUaGmcM=;
 b=WAEZxSo+wtnBqvUDXUFRUCsJzczWzfilZIr27upWjG5gMMOdR1KpCyP8oYTJT8HsDrf4z9AZgsLg8791flBjoQ/wbwfizq8Tl41/TCR6U11Fxhu+1uvJwesUYf7C5+dV0fYPfVZCBp9WgqGjpB5lcuX88qjk354AJDDb1WWNKmg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Mon, 31 May
 2021 12:37:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 12:37:00 +0000
Subject: Re: [PATCH v7 06/15] drm/ttm: Add a generic TTM memcpy move for
 page-based iomem
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
 <20210531121940.267032-7-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <853edbe3-29c8-6178-af17-8d4c250e78e8@amd.com>
Date: Mon, 31 May 2021 14:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210531121940.267032-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b94:4956:bad4:7c81]
X-ClientProxiedBy: AM9P193CA0003.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::8) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81]
 (2a02:908:1252:fb60:b94:4956:bad4:7c81) by
 AM9P193CA0003.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22 via Frontend Transport; Mon, 31 May 2021 12:36:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a5aa7e0-c6ff-4097-9756-08d92430c8fd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-Microsoft-Antispam-PRVS: <MN2PR12MB455163EA56A225663C611DBB833F9@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: os44xxZjSvdtGjt99tEfcuNGwsCa5kx7OqX3ebtI1C4SJ/3rFeBRZPPMQ7kSFI3LZVc0D2Hw/1lZpRL3cZKm+N0kflzxi4Jn06PH+ABwCzgWZIxVYZoUGtmXfDO5KZnSWByPrIyGkFxQwXzmaA74imOmFRvw9qdT3+Ge0wi032v7NjC9ChmONAK5dnuPAw9L9/afvXTFfEPXwOXVaMribwou4e9IIHyn6NMOGBrwyfswjcFYEpdMHaAOtrIoX4V4OKU6a8olZ+DS2WSMDl6ahM+LAXrOl3B10/+gUM1C4nNq+A3kbdZchCz+aZwSUn0ImD35QLieP80LtTo8yWn4rrD2I40zMuuBb6+YlaDU7A1Cmrb9FD6Bl4NPjM2NY8FrmlqcHX3IaqrNn++9pTTM8K9tfewBdaeTQYJQcptYmSlIbPvTJ9/M68iNVRvZhwGCZVBbeEH1DxoRCFt4loC/dPGp3JOVpzL2iMg6n8NE7WR3VE/P8tuyPjkSbKnn+lDNM5dOrnUs2vyl0zgyqjjEWMieKlb4I/ulWqCe0sVY71F5ulbrn59J1OWSakRKUzRIepeBdBsJqqu2uGb7/y9xVl4BQgePTO0hIuuK8ICgOfspa2ifugkNOXe+ij7X8h5h7aUdF8eugOGNUATxSuc5rUWNxCgfME1lM2G8yyxet8Z7HxCXxx4u/S+HquuezpD2XYdkqlMicxwCmRiJlse1YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(31696002)(31686004)(16526019)(2906002)(2616005)(8676002)(316002)(186003)(8936002)(6666004)(86362001)(6486002)(478600001)(38100700002)(30864003)(5660300002)(66556008)(66574015)(83380400001)(36756003)(66946007)(66476007)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TkwzemdSNGxQcThmV01jREtyWFI5THJPdHRrV2ZxRFNEKzNyNVU2OWRoWCts?=
 =?utf-8?B?bG01emVEWjBTRGcwTlduRnVnNGxjQXFSNFVNZ1QvL25QWVZzeXVNSVpjR0g4?=
 =?utf-8?B?Z2RGV2ZFUnVsZUdlbVVlRzYwTHpFZm13VXk4UElHNmlWK20rMGt5bVkzK2I0?=
 =?utf-8?B?MVo3WUJ6dkNWWEJiUmU2bkYvYzBnUnlwZ1JudStDMllGempmWXpwazNaNmVz?=
 =?utf-8?B?TEpTUmFEZms4YkxTZ2VsLzR6d1NRZ0loZkxvWWZlbFdOSUplUHBSa2R0TDlu?=
 =?utf-8?B?a2dDS2h4MExSN2w4K2w2Y2xqWjRRSTU3QVlKWHhxUFFuSFU2ekMraUt4OWRl?=
 =?utf-8?B?SGdaR3NhQk1LdTE2S1d1MUphQzJvMmhsazdEdFpMWkN3eGQ2NUdRdG5vbGNY?=
 =?utf-8?B?aUtIcERRSDNoUjVuOC8yMnRKSys1VEpRWHFkNTM3Zy9wZG9MMXBMaHc2YmND?=
 =?utf-8?B?SXNsZHJzMDZ0UG9Ud2tLL1RtWmNvY3J5a3pIKzU5MExETkNaYjluTElubVJj?=
 =?utf-8?B?S2JBUTNKRHQrUGpLN3hWdlJ5QTZJMVVrNnJCZk95UDFPc3hLODB5S3Z5N1My?=
 =?utf-8?B?c1N2aXhQbjM4R1NhanJlUEVpa3NsQmx6UDE4ZEFNRG5KS002QmhiM1IxNll3?=
 =?utf-8?B?clRzZTdJcnhEZGhYcWYzMnBOU25nZkZUQXI0dzdVNURIZGNYZnRhOFltc0ds?=
 =?utf-8?B?UXBrRDhZUGY1V0c4UGhWQW5FTjBQREk4VCs0Z0Y1RDRHUCtyMFpuZDlhOXBo?=
 =?utf-8?B?WFJYdVhscGlidlBBR1BpYUZMdjAzSFpZRVV0ck5EMGhmQm1zRTRpb3RWQk1R?=
 =?utf-8?B?dm1OTzFNYXdFanJ5NmdaZXA4SVhER2dFUjlyclRzYXVoN0xnMFdiRDJKZlZG?=
 =?utf-8?B?T2twbFNjMmV4SkZPZkJ4Uzl5VXJ0SVp6TGZzRGNOSUJtQWJCd3lGU0ZsOVc3?=
 =?utf-8?B?SFdIajNHNEp4VkRTNnFWaktEVW5TeS9yQ2dza2RsZFk5dERZVkE5OHRSS2xw?=
 =?utf-8?B?UXVJdUV6dzJML3RyWWFMZ1haOURqQW5aZlh1OFUxZ3c4ZEYyYWJ6TzU1QmN0?=
 =?utf-8?B?cGkxMVlha0RnbXVGTW1sOUswZGRabVJUWWlLemt3eDVKbXdSK09RakdWOVAy?=
 =?utf-8?B?M2wvc1dHS25nTTdwL1dZdlBZMEdYN0NOa3FDTWV0RnNWQWJhTWJiNEUrdU44?=
 =?utf-8?B?TkJ1S05XTzQvRldjczU4eDgrM0ExQnZsYi9KdkVEU3JhUUFIRmpKODRPVWpp?=
 =?utf-8?B?TDdzR0YxK25kRDQzbWxHMDhWTERiTmYvS0pFZWlaWTI0cVJINGZ2V2M4aHhL?=
 =?utf-8?B?ZHFwR0I0KytaK2JUSVhCbTRiUTJoNTRTUEs3T05NYXBBdkVmT3MyVnVLTldy?=
 =?utf-8?B?TGt2b2NzMzNjVmdNVXRteFlMRzFvQVRNbUlrUEFJR2VFOVJLVHRjS1dVQitj?=
 =?utf-8?B?MEVxcTh1MGxKYWxQSlE5RlZuaHdwMW5IMzFhdEZsR1pkMERyWFF1WXB0RUxX?=
 =?utf-8?B?aFdTbk5vQXhLVW1INEQvQlEzai9LdTNXbnUwekZQYmY5d0xCNHpNNk5vbEk3?=
 =?utf-8?B?d1hMQVV4TmRPWDNtdk1NeWxDVE5pS05NL2RSRkUwcGd4Ny9wL0pNVWt1R0pH?=
 =?utf-8?B?WGowWFVIVXdVT3VUZGVSNmVma0xjd0lVcXRjWC9lM2hyVHF3ZDBQR0ZsSE9m?=
 =?utf-8?B?QlMybEUwN2w3cnJITkdoSDNZVk9lMlVQTFNrc0tueklIblMyMnN1YzdqMWFj?=
 =?utf-8?B?U2pkQjJpTzg2ZGFEd0QveG9yV0FnYUxLN3hYRFpzZGMzM1NxWFpCb3Q5RER5?=
 =?utf-8?B?cFN6V2lKUzFmQlcxOHhIeU9vdEVra1FvbjZxY0JUSllPckpnQ2xvQ3lJRjNl?=
 =?utf-8?Q?VWbDr8kXCTuzU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5aa7e0-c6ff-4097-9756-08d92430c8fd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 12:37:00.4855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzAcKeUMJW0uSHyUqhR0LNJGdRj2SZIQYj8n4IEku1Kce7deIeyGLGamRg52XWpM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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

Am 31.05.21 um 14:19 schrieb Thomas Hellström:
> The internal ttm_bo_util memcpy uses ioremap functionality, and while it
> probably might be possible to use it for copying in- and out of
> sglist represented io memory, using io_mem_reserve() / io_mem_free()
> callbacks, that would cause problems with fault().
> Instead, implement a method mapping page-by-page using kmap_local()
> semantics. As an additional benefit we then avoid the occasional global
> TLB flushes of ioremap() and consuming ioremap space, elimination of a
> critical point of failure and with a slight change of semantics we could
> also push the memcpy out async for testing and async driver development
> purposes.
>
> A special linear iomem iterator is introduced internally to mimic the
> old ioremap behaviour for code-paths that can't immediately be ported
> over. This adds to the code size and should be considered a temporary
> solution.
>
> Looking at the code we have a lot of checks for iomap tagged pointers.
> Ideally we should extend the core memremap functions to also accept
> uncached memory and kmap_local functionality. Then we could strip a
> lot of code.
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> v3:
> - Split up in various TTM files and addressed review comments by
>    Christian König. Tested and fixed legacy iomap memcpy path on i915.
> v4:
> - Fix an uninitialized variable
>    Reported by: kernel test robot <lkp@intel.com>
>    Reported by: Dan Carpenter <dan.carpenter@oracle.com>
> - Minor change to the ttm_move_memcpy() interface.
> - Gracefully handle lack of memremap() support on memcpy
>    (Reported by Matthew Auld)
> - Minor style fix (Reported by Matthew Auld)
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c  | 280 ++++++++++-------------------
>   drivers/gpu/drm/ttm/ttm_module.c   |  35 ++++
>   drivers/gpu/drm/ttm/ttm_resource.c | 193 ++++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_tt.c       |  42 +++++
>   include/drm/ttm/ttm_bo_driver.h    |  28 +++
>   include/drm/ttm/ttm_caching.h      |   2 +
>   include/drm/ttm/ttm_kmap_iter.h    |  61 +++++++
>   include/drm/ttm/ttm_resource.h     |  61 +++++++
>   include/drm/ttm/ttm_tt.h           |  16 ++
>   9 files changed, 536 insertions(+), 182 deletions(-)
>   create mode 100644 include/drm/ttm/ttm_kmap_iter.h
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index ae8b61460724..6ac7744a1a5c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -72,190 +72,126 @@ void ttm_mem_io_free(struct ttm_device *bdev,
>   	mem->bus.addr = NULL;
>   }
>   
> -static int ttm_resource_ioremap(struct ttm_device *bdev,
> -			       struct ttm_resource *mem,
> -			       void **virtual)
> +/**
> + * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
> + * @bo: The struct ttm_buffer_object.
> + * @new_mem: The struct ttm_resource we're moving to (copy destination).
> + * @new_iter: A struct ttm_kmap_iter representing the destination resource.
> + * @src_iter: A struct ttm_kmap_iter representing the source resource.
> + *
> + * This function is intended to be able to move out async under a
> + * dma-fence if desired.
> + */
> +void ttm_move_memcpy(struct ttm_buffer_object *bo,
> +		     pgoff_t num_pages,

Can we switch to uint32_t for num_pages for TTM in general?

That allows to copy 16TiB when you have 4KiB pages which should be 
enough for quite a while and I had some really bad bugs because people 
tend to do << PAGE_SHIFT and forget that it is only 32bit sometimes.

Apart from that feel free to stick my rb on the patch.

Christian.

> +		     struct ttm_kmap_iter *dst_iter,
> +		     struct ttm_kmap_iter *src_iter)
>   {
> -	int ret;
> -	void *addr;
> -
> -	*virtual = NULL;
> -	ret = ttm_mem_io_reserve(bdev, mem);
> -	if (ret || !mem->bus.is_iomem)
> -		return ret;
> +	const struct ttm_kmap_iter_ops *dst_ops = dst_iter->ops;
> +	const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
> +	struct ttm_tt *ttm = bo->ttm;
> +	struct dma_buf_map src_map, dst_map;
> +	pgoff_t i;
>   
> -	if (mem->bus.addr) {
> -		addr = mem->bus.addr;
> -	} else {
> -		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> +	/* Single TTM move. NOP */
> +	if (dst_ops->maps_tt && src_ops->maps_tt)
> +		return;
>   
> -		if (mem->bus.caching == ttm_write_combined)
> -			addr = ioremap_wc(mem->bus.offset, bus_size);
> -#ifdef CONFIG_X86
> -		else if (mem->bus.caching == ttm_cached)
> -			addr = ioremap_cache(mem->bus.offset, bus_size);
> -#endif
> -		else
> -			addr = ioremap(mem->bus.offset, bus_size);
> -		if (!addr) {
> -			ttm_mem_io_free(bdev, mem);
> -			return -ENOMEM;
> +	/* Don't move nonexistent data. Clear destination instead. */
> +	if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
> +		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
> +			return;
> +
> +		for (i = 0; i < num_pages; ++i) {
> +			dst_ops->map_local(dst_iter, &dst_map, i);
> +			if (dst_map.is_iomem)
> +				memset_io(dst_map.vaddr_iomem, 0, PAGE_SIZE);
> +			else
> +				memset(dst_map.vaddr, 0, PAGE_SIZE);
> +			if (dst_ops->unmap_local)
> +				dst_ops->unmap_local(dst_iter, &dst_map);
>   		}
> +		return;
>   	}
> -	*virtual = addr;
> -	return 0;
> -}
> -
> -static void ttm_resource_iounmap(struct ttm_device *bdev,
> -				struct ttm_resource *mem,
> -				void *virtual)
> -{
> -	if (virtual && mem->bus.addr == NULL)
> -		iounmap(virtual);
> -	ttm_mem_io_free(bdev, mem);
> -}
> -
> -static int ttm_copy_io_page(void *dst, void *src, unsigned long page)
> -{
> -	uint32_t *dstP =
> -	    (uint32_t *) ((unsigned long)dst + (page << PAGE_SHIFT));
> -	uint32_t *srcP =
> -	    (uint32_t *) ((unsigned long)src + (page << PAGE_SHIFT));
> -
> -	int i;
> -	for (i = 0; i < PAGE_SIZE / sizeof(uint32_t); ++i)
> -		iowrite32(ioread32(srcP++), dstP++);
> -	return 0;
> -}
> -
> -static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
> -				unsigned long page,
> -				pgprot_t prot)
> -{
> -	struct page *d = ttm->pages[page];
> -	void *dst;
> -
> -	if (!d)
> -		return -ENOMEM;
> -
> -	src = (void *)((unsigned long)src + (page << PAGE_SHIFT));
> -	dst = kmap_atomic_prot(d, prot);
> -	if (!dst)
> -		return -ENOMEM;
> -
> -	memcpy_fromio(dst, src, PAGE_SIZE);
> -
> -	kunmap_atomic(dst);
> -
> -	return 0;
> -}
> -
> -static int ttm_copy_ttm_io_page(struct ttm_tt *ttm, void *dst,
> -				unsigned long page,
> -				pgprot_t prot)
> -{
> -	struct page *s = ttm->pages[page];
> -	void *src;
>   
> -	if (!s)
> -		return -ENOMEM;
> -
> -	dst = (void *)((unsigned long)dst + (page << PAGE_SHIFT));
> -	src = kmap_atomic_prot(s, prot);
> -	if (!src)
> -		return -ENOMEM;
> -
> -	memcpy_toio(dst, src, PAGE_SIZE);
> -
> -	kunmap_atomic(src);
> +	for (i = 0; i < num_pages; ++i) {
> +		dst_ops->map_local(dst_iter, &dst_map, i);
> +		src_ops->map_local(src_iter, &src_map, i);
> +
> +		if (!src_map.is_iomem && !dst_map.is_iomem) {
> +			memcpy(dst_map.vaddr, src_map.vaddr, PAGE_SIZE);
> +		} else if (!src_map.is_iomem) {
> +			dma_buf_map_memcpy_to(&dst_map, src_map.vaddr,
> +					      PAGE_SIZE);
> +		} else if (!dst_map.is_iomem) {
> +			memcpy_fromio(dst_map.vaddr, src_map.vaddr_iomem,
> +				      PAGE_SIZE);
> +		} else {
> +			int j;
> +			u32 __iomem *src = src_map.vaddr_iomem;
> +			u32 __iomem *dst = dst_map.vaddr_iomem;
>   
> -	return 0;
> +			for (j = 0; j < (PAGE_SIZE / sizeof(u32)); ++j)
> +				iowrite32(ioread32(src++), dst++);
> +		}
> +		if (src_ops->unmap_local)
> +			src_ops->unmap_local(src_iter, &src_map);
> +		if (dst_ops->unmap_local)
> +			dst_ops->unmap_local(dst_iter, &dst_map);
> +	}
>   }
> +EXPORT_SYMBOL(ttm_move_memcpy);
>   
>   int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   		       struct ttm_operation_ctx *ctx,
> -		       struct ttm_resource *new_mem)
> +		       struct ttm_resource *dst_mem)
>   {
>   	struct ttm_device *bdev = bo->bdev;
> -	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
> +	struct ttm_resource_manager *dst_man =
> +		ttm_manager_type(bo->bdev, dst_mem->mem_type);
>   	struct ttm_tt *ttm = bo->ttm;
> -	struct ttm_resource *old_mem = &bo->mem;
> -	struct ttm_resource old_copy = *old_mem;
> -	void *old_iomap;
> -	void *new_iomap;
> -	int ret;
> -	unsigned long i;
> -
> -	ret = ttm_bo_wait_ctx(bo, ctx);
> -	if (ret)
> -		return ret;
> -
> -	ret = ttm_resource_ioremap(bdev, old_mem, &old_iomap);
> -	if (ret)
> -		return ret;
> -	ret = ttm_resource_ioremap(bdev, new_mem, &new_iomap);
> -	if (ret)
> -		goto out;
> -
> -	/*
> -	 * Single TTM move. NOP.
> -	 */
> -	if (old_iomap == NULL && new_iomap == NULL)
> -		goto out2;
> -
> -	/*
> -	 * Don't move nonexistent data. Clear destination instead.
> -	 */
> -	if (old_iomap == NULL &&
> -	    (ttm == NULL || (!ttm_tt_is_populated(ttm) &&
> -			     !(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))) {
> -		memset_io(new_iomap, 0, new_mem->num_pages*PAGE_SIZE);
> -		goto out2;
> -	}
> +	struct ttm_resource *src_mem = &bo->mem;
> +	struct ttm_resource_manager *src_man =
> +		ttm_manager_type(bdev, src_mem->mem_type);
> +	struct ttm_resource src_copy = *src_mem;
> +	union {
> +		struct ttm_kmap_iter_tt tt;
> +		struct ttm_kmap_iter_linear_io io;
> +	} _dst_iter, _src_iter;
> +	struct ttm_kmap_iter *dst_iter, *src_iter;
> +	int ret = 0;
>   
> -	/*
> -	 * TTM might be null for moves within the same region.
> -	 */
> -	if (ttm) {
> +	if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
> +		    dst_man->use_tt)) {
>   		ret = ttm_tt_populate(bdev, ttm, ctx);
>   		if (ret)
> -			goto out1;
> +			return ret;
>   	}
>   
> -	for (i = 0; i < new_mem->num_pages; ++i) {
> -		if (old_iomap == NULL) {
> -			pgprot_t prot = ttm_io_prot(bo, old_mem, PAGE_KERNEL);
> -			ret = ttm_copy_ttm_io_page(ttm, new_iomap, i,
> -						   prot);
> -		} else if (new_iomap == NULL) {
> -			pgprot_t prot = ttm_io_prot(bo, new_mem, PAGE_KERNEL);
> -			ret = ttm_copy_io_ttm_page(ttm, old_iomap, i,
> -						   prot);
> -		} else {
> -			ret = ttm_copy_io_page(new_iomap, old_iomap, i);
> -		}
> -		if (ret)
> -			goto out1;
> +	dst_iter = ttm_kmap_iter_linear_io_init(&_dst_iter.io, bdev, dst_mem);
> +	if (PTR_ERR(dst_iter) == -EINVAL && dst_man->use_tt)
> +		dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm);
> +	if (IS_ERR(dst_iter))
> +		return PTR_ERR(dst_iter);
> +
> +	src_iter = ttm_kmap_iter_linear_io_init(&_src_iter.io, bdev, src_mem);
> +	if (PTR_ERR(src_iter) == -EINVAL && src_man->use_tt)
> +		src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm);
> +	if (IS_ERR(src_iter)) {
> +		ret = PTR_ERR(src_iter);
> +		goto out_src_iter;
>   	}
> -	mb();
> -out2:
> -	old_copy = *old_mem;
>   
> -	ttm_bo_assign_mem(bo, new_mem);
> -
> -	if (!man->use_tt)
> -		ttm_bo_tt_destroy(bo);
> +	ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
> +	src_copy = *src_mem;
> +	ttm_bo_move_sync_cleanup(bo, dst_mem);
>   
> -out1:
> -	ttm_resource_iounmap(bdev, old_mem, new_iomap);
> -out:
> -	ttm_resource_iounmap(bdev, &old_copy, old_iomap);
> +	if (!src_iter->ops->maps_tt)
> +		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_copy);
> +out_src_iter:
> +	if (!dst_iter->ops->maps_tt)
> +		ttm_kmap_iter_linear_io_fini(&_dst_iter.io, bdev, dst_mem);
>   
> -	/*
> -	 * On error, keep the mm node!
> -	 */
> -	if (!ret)
> -		ttm_resource_free(bo, &old_copy);
>   	return ret;
>   }
>   EXPORT_SYMBOL(ttm_bo_move_memcpy);
> @@ -336,27 +272,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>   	man = ttm_manager_type(bo->bdev, res->mem_type);
>   	caching = man->use_tt ? bo->ttm->caching : res->bus.caching;
>   
> -	/* Cached mappings need no adjustment */
> -	if (caching == ttm_cached)
> -		return tmp;
> -
> -#if defined(__i386__) || defined(__x86_64__)
> -	if (caching == ttm_write_combined)
> -		tmp = pgprot_writecombine(tmp);
> -	else if (boot_cpu_data.x86 > 3)
> -		tmp = pgprot_noncached(tmp);
> -#endif
> -#if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> -    defined(__powerpc__) || defined(__mips__)
> -	if (caching == ttm_write_combined)
> -		tmp = pgprot_writecombine(tmp);
> -	else
> -		tmp = pgprot_noncached(tmp);
> -#endif
> -#if defined(__sparc__)
> -	tmp = pgprot_noncached(tmp);
> -#endif
> -	return tmp;
> +	return ttm_prot_from_caching(caching, tmp);
>   }
>   EXPORT_SYMBOL(ttm_io_prot);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
> index 56b0efdba1a9..997c458f68a9 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.c
> +++ b/drivers/gpu/drm/ttm/ttm_module.c
> @@ -31,12 +31,47 @@
>    */
>   #include <linux/module.h>
>   #include <linux/device.h>
> +#include <linux/pgtable.h>
>   #include <linux/sched.h>
>   #include <linux/debugfs.h>
>   #include <drm/drm_sysfs.h>
> +#include <drm/ttm/ttm_caching.h>
>   
>   #include "ttm_module.h"
>   
> +/**
> + * ttm_prot_from_caching - Modify the page protection according to the
> + * ttm cacing mode
> + * @caching: The ttm caching mode
> + * @tmp: The original page protection
> + *
> + * Return: The modified page protection
> + */
> +pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
> +{
> +	/* Cached mappings need no adjustment */
> +	if (caching == ttm_cached)
> +		return tmp;
> +
> +#if defined(__i386__) || defined(__x86_64__)
> +	if (caching == ttm_write_combined)
> +		tmp = pgprot_writecombine(tmp);
> +	else if (boot_cpu_data.x86 > 3)
> +		tmp = pgprot_noncached(tmp);
> +#endif
> +#if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> +	defined(__powerpc__) || defined(__mips__)
> +	if (caching == ttm_write_combined)
> +		tmp = pgprot_writecombine(tmp);
> +	else
> +		tmp = pgprot_noncached(tmp);
> +#endif
> +#if defined(__sparc__)
> +	tmp = pgprot_noncached(tmp);
> +#endif
> +	return tmp;
> +}
> +
>   struct dentry *ttm_debugfs_root;
>   
>   static int __init ttm_init(void)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 59e2b7157e41..931bcd1a9b9b 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -22,6 +22,10 @@
>    * Authors: Christian König
>    */
>   
> +#include <linux/dma-buf-map.h>
> +#include <linux/io-mapping.h>
> +#include <linux/scatterlist.h>
> +
>   #include <drm/ttm/ttm_resource.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   
> @@ -147,3 +151,192 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   		man->func->debug(man, p);
>   }
>   EXPORT_SYMBOL(ttm_resource_manager_debug);
> +
> +static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
> +					  struct dma_buf_map *dmap,
> +					  pgoff_t i)
> +{
> +	struct ttm_kmap_iter_iomap *iter_io =
> +		container_of(iter, typeof(*iter_io), base);
> +	void __iomem *addr;
> +
> +retry:
> +	while (i >= iter_io->cache.end) {
> +		iter_io->cache.sg = iter_io->cache.sg ?
> +			sg_next(iter_io->cache.sg) : iter_io->st->sgl;
> +		iter_io->cache.i = iter_io->cache.end;
> +		iter_io->cache.end += sg_dma_len(iter_io->cache.sg) >>
> +			PAGE_SHIFT;
> +		iter_io->cache.offs = sg_dma_address(iter_io->cache.sg) -
> +			iter_io->start;
> +	}
> +
> +	if (i < iter_io->cache.i) {
> +		iter_io->cache.end = 0;
> +		iter_io->cache.sg = NULL;
> +		goto retry;
> +	}
> +
> +	addr = io_mapping_map_local_wc(iter_io->iomap, iter_io->cache.offs +
> +				       (((resource_size_t)i - iter_io->cache.i)
> +					<< PAGE_SHIFT));
> +	dma_buf_map_set_vaddr_iomem(dmap, addr);
> +}
> +
> +static void ttm_kmap_iter_iomap_unmap_local(struct ttm_kmap_iter *iter,
> +					    struct dma_buf_map *map)
> +{
> +	io_mapping_unmap_local(map->vaddr_iomem);
> +}
> +
> +static const struct ttm_kmap_iter_ops ttm_kmap_iter_io_ops = {
> +	.map_local =  ttm_kmap_iter_iomap_map_local,
> +	.unmap_local = ttm_kmap_iter_iomap_unmap_local,
> +	.maps_tt = false,
> +};
> +
> +/**
> + * ttm_kmap_iter_iomap_init - Initialize a struct ttm_kmap_iter_iomap
> + * @iter_io: The struct ttm_kmap_iter_iomap to initialize.
> + * @iomap: The struct io_mapping representing the underlying linear io_memory.
> + * @st: sg_table into @iomap, representing the memory of the struct
> + * ttm_resource.
> + * @start: Offset that needs to be subtracted from @st to make
> + * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
> + *
> + * Return: Pointer to the embedded struct ttm_kmap_iter.
> + */
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
> +			 struct io_mapping *iomap,
> +			 struct sg_table *st,
> +			 resource_size_t start)
> +{
> +	iter_io->base.ops = &ttm_kmap_iter_io_ops;
> +	iter_io->iomap = iomap;
> +	iter_io->st = st;
> +	iter_io->start = start;
> +	memset(&iter_io->cache, 0, sizeof(iter_io->cache));
> +
> +	return &iter_io->base;
> +}
> +EXPORT_SYMBOL(ttm_kmap_iter_iomap_init);
> +
> +/**
> + * DOC: Linear io iterator
> + *
> + * This code should die in the not too near future. Best would be if we could
> + * make io-mapping use memremap for all io memory, and have memremap
> + * implement a kmap_local functionality. We could then strip a huge amount of
> + * code. These linear io iterators are implemented to mimic old functionality,
> + * and they don't use kmap_local semantics at all internally. Rather ioremap or
> + * friends, and at least on 32-bit they add global TLB flushes and points
> + * of failure.
> + */
> +
> +static void ttm_kmap_iter_linear_io_map_local(struct ttm_kmap_iter *iter,
> +					      struct dma_buf_map *dmap,
> +					      pgoff_t i)
> +{
> +	struct ttm_kmap_iter_linear_io *iter_io =
> +		container_of(iter, typeof(*iter_io), base);
> +
> +	*dmap = iter_io->dmap;
> +	dma_buf_map_incr(dmap, i * PAGE_SIZE);
> +}
> +
> +static const struct ttm_kmap_iter_ops ttm_kmap_iter_linear_io_ops = {
> +	.map_local =  ttm_kmap_iter_linear_io_map_local,
> +	.maps_tt = false,
> +};
> +
> +/**
> + * ttm_kmap_iter_linear_io_init - Initialize an iterator for linear io memory
> + * @iter_io: The iterator to initialize
> + * @bdev: The TTM device
> + * @mem: The ttm resource representing the iomap.
> + *
> + * This function is for internal TTM use only. It sets up a memcpy kmap iterator
> + * pointing at a linear chunk of io memory.
> + *
> + * Return: A pointer to the embedded struct ttm_kmap_iter or error pointer on
> + * failure.
> + */
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
> +			     struct ttm_device *bdev,
> +			     struct ttm_resource *mem)
> +{
> +	int ret;
> +
> +	ret = ttm_mem_io_reserve(bdev, mem);
> +	if (ret)
> +		goto out_err;
> +	if (!mem->bus.is_iomem) {
> +		ret = -EINVAL;
> +		goto out_io_free;
> +	}
> +
> +	if (mem->bus.addr) {
> +		dma_buf_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
> +		iter_io->needs_unmap = false;
> +	} else {
> +		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> +
> +		iter_io->needs_unmap = true;
> +		memset(&iter_io->dmap, 0, sizeof(iter_io->dmap));
> +		if (mem->bus.caching == ttm_write_combined)
> +			dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
> +						    ioremap_wc(mem->bus.offset,
> +							       bus_size));
> +		else if (mem->bus.caching == ttm_cached)
> +			dma_buf_map_set_vaddr(&iter_io->dmap,
> +					      memremap(mem->bus.offset, bus_size,
> +						       MEMREMAP_WB |
> +						       MEMREMAP_WT |
> +						       MEMREMAP_WC));
> +
> +		/* If uncached requested or if mapping cached or wc failed */
> +		if (dma_buf_map_is_null(&iter_io->dmap))
> +			dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
> +						    ioremap(mem->bus.offset,
> +							    bus_size));
> +
> +		if (dma_buf_map_is_null(&iter_io->dmap)) {
> +			ret = -ENOMEM;
> +			goto out_io_free;
> +		}
> +	}
> +
> +	iter_io->base.ops = &ttm_kmap_iter_linear_io_ops;
> +	return &iter_io->base;
> +
> +out_io_free:
> +	ttm_mem_io_free(bdev, mem);
> +out_err:
> +	return ERR_PTR(ret);
> +}
> +
> +/**
> + * ttm_kmap_iter_linear_io_fini - Clean up an iterator for linear io memory
> + * @iter_io: The iterator to initialize
> + * @bdev: The TTM device
> + * @mem: The ttm resource representing the iomap.
> + *
> + * This function is for internal TTM use only. It cleans up a memcpy kmap
> + * iterator initialized by ttm_kmap_iter_linear_io_init.
> + */
> +void
> +ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
> +			     struct ttm_device *bdev,
> +			     struct ttm_resource *mem)
> +{
> +	if (iter_io->needs_unmap && dma_buf_map_is_set(&iter_io->dmap)) {
> +		if (iter_io->dmap.is_iomem)
> +			iounmap(iter_io->dmap.vaddr_iomem);
> +		else
> +			memunmap(iter_io->dmap.vaddr);
> +	}
> +
> +	ttm_mem_io_free(bdev, mem);
> +}
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 539e0232cb3b..0e41227116b1 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -433,3 +433,45 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
>   	if (!ttm_dma32_pages_limit)
>   		ttm_dma32_pages_limit = num_dma32_pages;
>   }
> +
> +static void ttm_kmap_iter_tt_map_local(struct ttm_kmap_iter *iter,
> +				       struct dma_buf_map *dmap,
> +				       pgoff_t i)
> +{
> +	struct ttm_kmap_iter_tt *iter_tt =
> +		container_of(iter, typeof(*iter_tt), base);
> +
> +	dma_buf_map_set_vaddr(dmap, kmap_local_page_prot(iter_tt->tt->pages[i],
> +							 iter_tt->prot));
> +}
> +
> +static void ttm_kmap_iter_tt_unmap_local(struct ttm_kmap_iter *iter,
> +					 struct dma_buf_map *map)
> +{
> +	kunmap_local(map->vaddr);
> +}
> +
> +static const struct ttm_kmap_iter_ops ttm_kmap_iter_tt_ops = {
> +	.map_local = ttm_kmap_iter_tt_map_local,
> +	.unmap_local = ttm_kmap_iter_tt_unmap_local,
> +	.maps_tt = true,
> +};
> +
> +/**
> + * ttm_kmap_iter_tt_init - Initialize a struct ttm_kmap_iter_tt
> + * @iter_tt: The struct ttm_kmap_iter_tt to initialize.
> + * @tt: Struct ttm_tt holding page pointers of the struct ttm_resource.
> + *
> + * Return: Pointer to the embedded struct ttm_kmap_iter.
> + */
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
> +		      struct ttm_tt *tt)
> +{
> +	iter_tt->base.ops = &ttm_kmap_iter_tt_ops;
> +	iter_tt->tt = tt;
> +	iter_tt->prot = ttm_prot_from_caching(tt->caching, PAGE_KERNEL);
> +
> +	return &iter_tt->base;
> +}
> +EXPORT_SYMBOL(ttm_kmap_iter_tt_init);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index dbccac957f8f..fdbeac78c236 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -40,6 +40,7 @@
>   #include <drm/ttm/ttm_device.h>
>   
>   #include "ttm_bo_api.h"
> +#include "ttm_kmap_iter.h"
>   #include "ttm_placement.h"
>   #include "ttm_tt.h"
>   #include "ttm_pool.h"
> @@ -272,6 +273,23 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   			      bool pipeline,
>   			      struct ttm_resource *new_mem);
>   
> +/**
> + * ttm_bo_move_accel_cleanup.
> + *
> + * @bo: A pointer to a struct ttm_buffer_object.
> + * @new_mem: struct ttm_resource indicating where to move.
> + *
> + * Special case of ttm_bo_move_accel_cleanup where the bo is guaranteed
> + * by the caller to be idle. Typically used after memcpy buffer moves.
> + */
> +static inline void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
> +					    struct ttm_resource *new_mem)
> +{
> +	int ret = ttm_bo_move_accel_cleanup(bo, NULL, true, false, new_mem);
> +
> +	WARN_ON(ret);
> +}
> +
>   /**
>    * ttm_bo_pipeline_gutting.
>    *
> @@ -332,4 +350,14 @@ int ttm_range_man_init(struct ttm_device *bdev,
>   int ttm_range_man_fini(struct ttm_device *bdev,
>   		       unsigned type);
>   
> +void ttm_move_memcpy(struct ttm_buffer_object *bo,
> +		     pgoff_t num_pages,
> +		     struct ttm_kmap_iter *dst_iter,
> +		     struct ttm_kmap_iter *src_iter);
> +
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
> +			 struct io_mapping *iomap,
> +			 struct sg_table *st,
> +			 resource_size_t start);
>   #endif
> diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.h
> index a0b4a49fa432..3c9dd65f5aaf 100644
> --- a/include/drm/ttm/ttm_caching.h
> +++ b/include/drm/ttm/ttm_caching.h
> @@ -33,4 +33,6 @@ enum ttm_caching {
>   	ttm_cached
>   };
>   
> +pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp);
> +
>   #endif
> diff --git a/include/drm/ttm/ttm_kmap_iter.h b/include/drm/ttm/ttm_kmap_iter.h
> new file mode 100644
> index 000000000000..8bb00fd39d6c
> --- /dev/null
> +++ b/include/drm/ttm/ttm_kmap_iter.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +#ifndef __TTM_KMAP_ITER_H__
> +#define __TTM_KMAP_ITER_H__
> +
> +#include <linux/types.h>
> +
> +struct ttm_kmap_iter;
> +struct dma_buf_map;
> +
> +/**
> + * struct ttm_kmap_iter_ops - Ops structure for a struct
> + * ttm_kmap_iter.
> + * @maps_tt: Whether the iterator maps TT memory directly, as opposed
> + * mapping a TT through an aperture. Both these modes have
> + * struct ttm_resource_manager::use_tt set, but the latter typically
> + * returns is_iomem == true from ttm_mem_io_reserve.
> + */
> +struct ttm_kmap_iter_ops {
> +	/**
> +	 * kmap_local() - Map a PAGE_SIZE part of the resource using
> +	 * kmap_local semantics.
> +	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
> +	 * the resource.
> +	 * @dmap: The struct dma_buf_map holding the virtual address after
> +	 * the operation.
> +	 * @i: The location within the resource to map. PAGE_SIZE granularity.
> +	 */
> +	void (*map_local)(struct ttm_kmap_iter *res_iter,
> +			  struct dma_buf_map *dmap, pgoff_t i);
> +	/**
> +	 * unmap_local() - Unmap a PAGE_SIZE part of the resource previously
> +	 * mapped using kmap_local.
> +	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
> +	 * the resource.
> +	 * @dmap: The struct dma_buf_map holding the virtual address after
> +	 * the operation.
> +	 */
> +	void (*unmap_local)(struct ttm_kmap_iter *res_iter,
> +			    struct dma_buf_map *dmap);
> +	bool maps_tt;
> +};
> +
> +/**
> + * struct ttm_kmap_iter - Iterator for kmap_local type operations on a
> + * resource.
> + * @ops: Pointer to the operations struct.
> + *
> + * This struct is intended to be embedded in a resource-specific specialization
> + * implementing operations for the resource.
> + *
> + * Nothing stops us from extending the operations to vmap, vmap_pfn etc,
> + * replacing some or parts of the ttm_bo_util. cpu-map functionality.
> + */
> +struct ttm_kmap_iter {
> +	const struct ttm_kmap_iter_ops *ops;
> +};
> +
> +#endif /* __TTM_KMAP_ITER_H__ */
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 890b9d369519..b8dc0bdb0da5 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -27,9 +27,11 @@
>   
>   #include <linux/types.h>
>   #include <linux/mutex.h>
> +#include <linux/dma-buf-map.h>
>   #include <linux/dma-fence.h>
>   #include <drm/drm_print.h>
>   #include <drm/ttm/ttm_caching.h>
> +#include <drm/ttm/ttm_kmap_iter.h>
>   
>   #define TTM_MAX_BO_PRIORITY	4U
>   
> @@ -38,6 +40,10 @@ struct ttm_resource_manager;
>   struct ttm_resource;
>   struct ttm_place;
>   struct ttm_buffer_object;
> +struct dma_buf_map;
> +struct io_mapping;
> +struct sg_table;
> +struct scatterlist;
>   
>   struct ttm_resource_manager_func {
>   	/**
> @@ -176,6 +182,45 @@ struct ttm_resource {
>   	struct ttm_bus_placement bus;
>   };
>   
> +/**
> + * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
> + * struct sg_table backed struct ttm_resource.
> + * @base: Embedded struct ttm_kmap_iter providing the usage interface.
> + * @iomap: struct io_mapping representing the underlying linear io_memory.
> + * @st: sg_table into @iomap, representing the memory of the struct ttm_resource.
> + * @start: Offset that needs to be subtracted from @st to make
> + * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
> + * @cache: Scatterlist traversal cache for fast lookups.
> + * @cache.sg: Pointer to the currently cached scatterlist segment.
> + * @cache.i: First index of @sg. PAGE_SIZE granularity.
> + * @cache.end: Last index + 1 of @sg. PAGE_SIZE granularity.
> + * @cache.offs: First offset into @iomap of @sg. PAGE_SIZE granularity.
> + */
> +struct ttm_kmap_iter_iomap {
> +	struct ttm_kmap_iter base;
> +	struct io_mapping *iomap;
> +	struct sg_table *st;
> +	resource_size_t start;
> +	struct {
> +		struct scatterlist *sg;
> +		pgoff_t i;
> +		pgoff_t end;
> +		pgoff_t offs;
> +	} cache;
> +};
> +
> +/**
> + * struct ttm_kmap_iter_linear_io - Iterator specialization for linear io
> + * @base: The base iterator
> + * @dmap: Points to the starting address of the region
> + * @needs_unmap: Whether we need to unmap on fini
> + */
> +struct ttm_kmap_iter_linear_io {
> +	struct ttm_kmap_iter base;
> +	struct dma_buf_map dmap;
> +	bool needs_unmap;
> +};
> +
>   /**
>    * ttm_resource_manager_set_used
>    *
> @@ -237,4 +282,20 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>   void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *p);
>   
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
> +			 struct io_mapping *iomap,
> +			 struct sg_table *st,
> +			 resource_size_t start);
> +
> +struct ttm_kmap_iter_linear_io;
> +
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
> +			     struct ttm_device *bdev,
> +			     struct ttm_resource *mem);
> +
> +void ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
> +				  struct ttm_device *bdev,
> +				  struct ttm_resource *mem);
>   #endif
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 134d09ef7766..3102059db726 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -29,6 +29,7 @@
>   
>   #include <linux/types.h>
>   #include <drm/ttm/ttm_caching.h>
> +#include <drm/ttm/ttm_kmap_iter.h>
>   
>   struct ttm_bo_device;
>   struct ttm_tt;
> @@ -69,6 +70,18 @@ struct ttm_tt {
>   	enum ttm_caching caching;
>   };
>   
> +/**
> + * struct ttm_kmap_iter_tt - Specialization of a mappig iterator for a tt.
> + * @base: Embedded struct ttm_kmap_iter providing the usage interface
> + * @tt: Cached struct ttm_tt.
> + * @prot: Cached page protection for mapping.
> + */
> +struct ttm_kmap_iter_tt {
> +	struct ttm_kmap_iter base;
> +	struct ttm_tt *tt;
> +	pgprot_t prot;
> +};
> +
>   static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
>   {
>   	return tt->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED;
> @@ -159,6 +172,9 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>   
>   void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>   
> +struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
> +					    struct ttm_tt *tt);
> +
>   #if IS_ENABLED(CONFIG_AGP)
>   #include <linux/agp_backend.h>
>   

