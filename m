Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF840D37E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 08:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C50E6EABD;
	Thu, 16 Sep 2021 06:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33ED6EABD;
 Thu, 16 Sep 2021 06:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MolstRuKqukdDv8j6H+DcAKhL9NjWy0gkFvVSIeKLbWUj6ErzvULAYnjZ3T2V82zpo0j+/C9JVQKO859rb2+xn/FEFeIV4TakUkjWOcUro9P0bCjY6kI5FgbR6fRLH7+OaFG3N8gp6JjoI91X8OLCWhY56jTIGszDA9daD5cvy3e8bURmmJEvEyJ+9pkHLNGWNlqHs85nn43T2ZKp6gDsWiATzAq1hSGINCVnIb8t8PvVFptRcmJBWKxegRpGn4tAJ+th2I96zWAjfhYYTCGhNp8jebrD+vDk8uyAZT9bhMvEKoGCooDE19MJsxrINrv2feXIVbZyKHblDZnWP8O9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=DCXtj5ev/HNOlmI4u5dSkPoN5AZ+8Ivuu31EN0sCQvw=;
 b=SK5CvT64ukH9vlLEuvp+5v0meI0jckzrSYajMQmfkTnqlfXIWPvyaR6xZHIhrDupiKUGCA55BNDafwbkYa1NWVhWJVY2arcpxef+JxxQ6FYtHPawAryesAXSERhVaKeWs5TeTfsrh+EF1ZWxgkicCoY8Oh3ZvLw+CQN13Q09nfp58IlKxzkJ5aT/Vg2RBfvBemf/+2vmL3pwiCDhjgpVe4xySiVEzfjYmPZaer1J9YT/GJYqU1MYJHHtPjP7K6c6dQqKdlOikszPdTmQansJq0mjlg3HlDofpcvxezNApg05w6yrzsLiZ5YsqYnpPna3G51I9iVtOG/S+8URBNFSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCXtj5ev/HNOlmI4u5dSkPoN5AZ+8Ivuu31EN0sCQvw=;
 b=mkVEjx02V/3vfmgVr0+TrhMffaA3FFPj8FQLn/RAmxHC7sSKLtZbm6674HzjqA+bHLF/y7hIPwbfMt1LkPQ0+zybrBLKxTctM4lh2ET9d7+6ENKzHlBYRl3YWmp0zRE98SskO6U6JbWAvGluSdlAbvz1GUKb7gTv4HQKApJqq/s=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 06:55:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 06:55:29 +0000
Subject: Re: [PATCH v3 06/12] drm/ttm: add TTM_PAGE_FLAG_EXTERNAL_MAPPABLE
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
 <20210915185954.3114858-6-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <00e355ba-fa5a-945e-d9ea-48260a2c56ae@amd.com>
Date: Thu, 16 Sep 2021 08:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210915185954.3114858-6-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:208:1::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:208:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 06:55:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47d45bd0-1243-4c41-e1d4-08d978def803
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39500E5E8CC0AD43FB1F4CD683DC9@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTHYH6nejxGjwdps2XQz43+FU/rr+0wi6VaeCG6YZKVoxb5qkQ1LxRPEZVFCoqUUeOdhmFkQEWc+uXLMmdSB5aAAiH53cj8XbnOV4a5Py9Bqz0Y4AHqFyMlFL4Pc3AAeJDXVAmiV0Ngbpo8zPOxkGbmtWcMFvGLWBRqy+QnKOuT6jLsqf/NMjNdh21XrWfXZdG8h3XZwEhsHxwPrKLE6HmWpP3ayqWLqB9pbWhrHH5SR0JiAuNwVTplxc+som2PMXr7sEn66OPAUXKST86q/bMSK3ek85mQL30znYfzSR5072CxcNwi4ltrdIk5SpQ6BDw7EClIlduyFmLt+fIGFK1kyEiXfAvODXBRy+GdHah/TrEMmt8qvDwZ/h45w572M4fJNPyxQePZ2gJYeZlt5mZAUg6SEVaLHCinAMPUOoxgPdkEBnVgk0hFQHV3q/IGqit0DUKuup6lKSfxS6lztlbHx2b+zDnUQDx6n8fIB0R7cGJZ4ERVnvB+0kAsswjUm2bYPWD2sAVk+KNSztW07t2zODPGZxzK8nKbg1BTWUCRDU074239GP7/ukknY08oLrw56TpUFSSCeVChFjpJYh9S262p/IuAr+ArO05VYLFgR+nG0h9qFgy7kIsNrU64mv7qpfMEzaaMAOLQukg7tN65EWB/OyDUBNyDLV+dI+D8BuOkMb5vzQ0xTU0dOtP70vV9v3kGJS83JdNaiKhNiWp8kC1OnQ/J9MKE11C9ZsdmEZy3OIDwEb0i4NHCJud/X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39850400004)(366004)(26005)(186003)(66574015)(478600001)(2616005)(316002)(5660300002)(8936002)(66556008)(6486002)(66476007)(66946007)(83380400001)(956004)(16576012)(86362001)(31686004)(4326008)(38100700002)(36756003)(2906002)(31696002)(8676002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZ5NWJRZWs0Q3JoMXVvQjdETEd5U0dtNlVkakplaDQ1Nm5YWjd6enZONDBm?=
 =?utf-8?B?cHhMVk1RWkgyMHNUb2pIdVdiQUI4Z0FMOVpoQTVZNzErRE5Fcm9ZU2ZTOTQ2?=
 =?utf-8?B?MWdrZ1Mwd1M5M0l2Um5NdU1pT2pkdWtmNFRMTmRMbGMvRnVpSUFSL2FaTGgx?=
 =?utf-8?B?azliUXhxc09ZVEN4aS9pNWl5VnV4ZS9oUDhqYUlQY0xOZWRKUmJlL21OZXdR?=
 =?utf-8?B?L0t5SStXWndYcEdHY05iWEoxRjFXRzN1ekhrdTB4Q1ZTeTN4amJ0V1ErOGpU?=
 =?utf-8?B?dm1xcFB1SGtUZ1RkWFVNWmF2b3JEVktQUUJBYVZvczU3c05lWDQrSlUxL2Fj?=
 =?utf-8?B?SWdmYVFQN2pITlJsd2RxN0NsOXNBaTMxalpLelEvVDVKNEFSeDZoZWhqMFFD?=
 =?utf-8?B?OEZsNlo3Z1YrOW5pRVJqcjV1UmlmNUtieTBLZmNlcXEvYnJSM2tyYVh3WFd1?=
 =?utf-8?B?cHhYMXl1RGxBREJSZUFXUE9CS1dEM1dhRDhpdG13aDg4cWJiUk1EYnQrZFhx?=
 =?utf-8?B?REhGSGUxVEhKd0tVRys0UE9sZG04Zlc0RlN4TEt4UDUyanY4VVlSTTRZaWVE?=
 =?utf-8?B?MmdvTXN5cVRpdjJOK2xSbU1mVkc4K09nRVRWQTZ4RENQRWxRb0paNXBMcUNL?=
 =?utf-8?B?YWdhNXd2WGhVaUcyMWMvdHgreTBHQkhuZnNKNHFiZGJMc09PcFhvb1J6TlY3?=
 =?utf-8?B?bzVwWFJocE96Q084Vlc0Ynd0QXgvU21sU2ZiYVVHQUd5SEkxZFBTMExUcFBh?=
 =?utf-8?B?ZFJnM1pnbUc1UTVvWWlsSHlscU5JUHptSkV6RFRyREZxaWtGN2gyQTVBWFZO?=
 =?utf-8?B?bERSdDluZTFkWnVnVDgycVROOEVoVVIyNTJUQ3ZZZ3BDVEVjOFhvUTFXMGll?=
 =?utf-8?B?V2VLRFNpdFB2UTQwS3RoandCR1NDektOenkxS0hBUnUyeDl6bk1kRWd4b2Mx?=
 =?utf-8?B?d3dEZk9MM2dyN3h1ak1yRyt4aEtaUnlLdjZSMG5wZC9XVFRYcVRKOUFnR1Ja?=
 =?utf-8?B?ODBHZXorSDZMMjg2NEcvVlJBRU1OVDdndVUvR2dQbGRxZEhrZUozNlVtT2RG?=
 =?utf-8?B?N2p5UnRZcXlwb1pEdEk3MEJLNnkxY0RyRUh0eWR5VjUzeDc5VjVSSUN3M1BN?=
 =?utf-8?B?VjZLU1cyaHFUVURCelZaUk5TclAvVEw1QkY2V3F1TVJGY05zTWVCREljV0k0?=
 =?utf-8?B?TzdxazJUSHdPMG90bjh5UkJkK0hhZnpaOEFKUG1zMXBxVEtUd3Q1eGhGQ2hL?=
 =?utf-8?B?YThqQkV4ajlNdjZjNVN6YTROMnByTitXRzM4N1hIZk9UL1FhQUQ3ZWNEaWVS?=
 =?utf-8?B?dzk2VU4wWGZReVpNU3FlZURWYy9ZQVVMK1ovRXJaa2xnbUUyQmFNWnMxTGNz?=
 =?utf-8?B?eEtuSFFvT1JBL1FLdjJkcFpFYWxqSkJrcU5oYzBIaDF0ZW45VHBUVVorRlNx?=
 =?utf-8?B?bUlHRVZqeFJ2eTlrb0ZidUtldzNodUM0QXhHb0E3QlZ2N3RVeGZSRmlFaFZp?=
 =?utf-8?B?cEZKZmQ3Sy8xaDlkZlhCWWpHM0NkRGxIR3JWSlZzbWZLaWt1WkJTeWMxaUc3?=
 =?utf-8?B?TGtaUVd2aVJUSnVETDcrSEdUOWgrRXRTeVBJUmpHaTVIMitNa0VZbVZWZWZx?=
 =?utf-8?B?cEg4RHMxMmR5Y1JBN0JNamFpa0gwaTlmK25ucmdadWcyNE0yVEN6Q1pMQVVw?=
 =?utf-8?B?bHE0anhLQ0tXWHZtTC94TFhDWUplOVRha21Ta0gzZHk1d3pqRS9BaE16ZmRK?=
 =?utf-8?Q?7Ir/4ZcDpnThTWUfLSxk0mNzWp/tUt6jHz85PLE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d45bd0-1243-4c41-e1d4-08d978def803
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:55:29.0531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umQNxDvpkI32CGO0vKPTuCRc3Ze9wC06+klOWYqjKEBtjRn7TtN7pFgzy059WYNn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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



Am 15.09.21 um 20:59 schrieb Matthew Auld:
> In commit:
>
> commit 667a50db0477d47fdff01c666f5ee1ce26b5264c
> Author: Thomas Hellstrom <thellstrom@vmware.com>
> Date:   Fri Jan 3 11:17:18 2014 +0100
>
>      drm/ttm: Refuse to fault (prime-) imported pages
>
> we introduced the restriction that imported pages should not be directly
> mappable through TTM(this also extends to userptr). In the next patch we
> want to introduce a shmem_tt backend, which should follow all the
> existing rules with TTM_PAGE_FLAG_EXTERNAL, since it will need to handle
> swapping itself, but with the above mapping restriction lifted.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 6 ++++--
>   include/drm/ttm/ttm_tt.h        | 7 +++++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 708390588c7c..fd6e18f12f50 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -163,8 +163,10 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   	 * (if at all) by redirecting mmap to the exporter.
>   	 */
>   	if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL)) {
> -		dma_resv_unlock(bo->base.resv);
> -		return VM_FAULT_SIGBUS;
> +		if (!(bo->ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL_MAPPABLE)) {
> +			dma_resv_unlock(bo->base.resv);
> +			return VM_FAULT_SIGBUS;
> +		}
>   	}
>   
>   	return 0;
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 7f54a83c95ef..800c9edb3e10 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -66,11 +66,18 @@ struct ttm_tt {
>   	 * Note that enum ttm_bo_type.ttm_bo_type_sg objects will always enable
>   	 * this flag.
>   	 *
> +	 * TTM_PAGE_FLAG_EXTERNAL_MAPPABLE: Same behaviour as
> +	 * TTM_PAGE_FLAG_EXTERNAL, but with the reduced restriction that it is
> +	 * still valid to use TTM to map the pages directly. This is useful when
> +	 * implementing a ttm_tt backend which still allocates driver owned
> +	 * pages underneath(say with shmem).
> +	 *
>   	 * TTM_PAGE_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE.
>   	 */
>   #define TTM_PAGE_FLAG_SWAPPED		(1 << 0)
>   #define TTM_PAGE_FLAG_ZERO_ALLOC	(1 << 1)
>   #define TTM_PAGE_FLAG_EXTERNAL		(1 << 2)
> +#define TTM_PAGE_FLAG_EXTERNAL_MAPPABLE	(1 << 3 | TTM_PAGE_FLAG_EXTERNAL)

That's really bad practice because an "if (!(flags & 
TTM_PAGE_FLAG_EXTERNAL_MAPPABLE))" has a different semantics as an "if 
(flags & TTM_PAGE_FLAG_EXTERNAL_MAPPABLE)".

Rather add a TTM_PAGE_FLAG_UNMAPPABLE and make sure that it is set as 
appropriated.

Regards,
Christian.

>   
>   #define TTM_PAGE_FLAG_PRIV_POPULATED	(1 << 31)
>   	uint32_t page_flags;

