Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9BA2289C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 06:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8441410E8E4;
	Thu, 30 Jan 2025 05:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OM/9lHDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1740710E8E2;
 Thu, 30 Jan 2025 05:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlxhoRz8Xc0bEEncvlMnKdaK6wrjB8kvd8Navu/kouBfsjdtvJW+qQH4UrPMuuv2tK0fI18m5os5b7JNT19O72kF4PcbC/tYINKGytooJdJY9e4glW9Tf/QQIGK+FffVoNUcAEp37wmUP6i+1wE8LWlTcEQK+26c4Ac9aGvq7Lw5MKWjrnwnDub7ANUPXCkXuGHmLPpbW+1yIzsZbNPDHdidJXS5I3HREJZMv/g+r6+z4pjUMDgOPbtKLiYfLWMRge4Hm/t4FBU72G2m3NdAEVxsjD5TJVKvfB0sZciZULP8Rb8fk08R1iRNlmNoVUWKy0ALbXECtVb4+kZAOrv2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7QOqZGW4upVGR1U6AOKmy0n1KUE/j4pxbN4ANPrP0U=;
 b=Z3HWSCvWLbzTTkn3JoBn4JaE5bcHycZnwSyq5ONQDL4QE11KJAd8flGKLIIUzsbZKTYcAwzN4O9R5FM/wKvklMBodQ3pZ7cgS19FjNl+olYU4IRW1vHeUwqpsiDbIVfU6etMzeihKDzVPBe01zYoZT648APZxyD/NOTLVQ8zXPyiIsT/OEYLgP/BfekYGhumIKMFbnuRshRlBa5m1UooluDA5hMTaXUdnuPeBRIh5e3xoQTkDI7ZLgPo88iUa/LfmVRgTBQowSrp/JVyINNcdLyJjok9qvqGdmQyb/XBEx2Zwxn21VfilU8Z+0oxhrDZ9hnzq+bf+16Ie9XNIpi2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7QOqZGW4upVGR1U6AOKmy0n1KUE/j4pxbN4ANPrP0U=;
 b=OM/9lHDIHADEk5YS37aKvLsRW5e9x4ZrbuP1aQ4OqeNQDFwrz5e6gBepDUA04joFju0k2+aSE5sEx0E5/VLC2HN8pHKDdmdVN9EihY7GmHRmFuN4XoYZog0k3QRCdlv/vSlu4lSDyOgBR7TdxdXPThUgDt453XNGru6Ea9OXaNUiUPerqWVzJ2MPbW0s7YU9Qb29GfxhXKeJxfpdiUdCIZU8gFRR9kraRi0Xd86diclo7zUJahF+oy0aP5pNV66l/0D9kqDqGuKkHakXRwIA7UbbKAJS+gILy7O1TlqFfMHQeR0JF1/yw4q5EgWZWZ0x2n5BCcPy5g+RLAg4kaLuGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Thu, 30 Jan 2025 05:37:25 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 05:37:25 +0000
Date: Thu, 30 Jan 2025 16:37:21 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 3/4] mm/memory: pass folio and pte to
 restore_exclusive_pte()
Message-ID: <a2fusr6l4j5kxxkxgyeoxbsvuux7jbzsuwehii57benll26n7m@46mclv4gfgyh>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-4-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115803.2084769-4-david@redhat.com>
X-ClientProxiedBy: SY5P300CA0035.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: cac78cdb-e49a-451a-3569-08dd40f02d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?21280zu7J35djWkFBMDmfPbDJL4SyagpsqwHEa5kGskjdhvmfVG1geShZhTQ?=
 =?us-ascii?Q?l1J3VDp0pAPo3DhUie+TD285U7ReqmLMQVN4kc/LblW/49djUTW1B7sx0DgR?=
 =?us-ascii?Q?zCRl2XfWleattPrO8oOvnRPsKCeDNlfrv4SYPdEZmiQcpy25mV0Zn7bAqklm?=
 =?us-ascii?Q?E4y+DDn7GMobomaz4L+rDUoSvq8jav3IJIOP2ShYUwUMkknO9iyy5W+vxj+r?=
 =?us-ascii?Q?ebSkRzCpI9kpHEVmK1f2eWkoSsYfw+/klVdID79SFLIIWq5WaKHAzNs7vG2A?=
 =?us-ascii?Q?7v7F0kKdkoysuHz6ZtWRwJ2sapETPJSx2jVFA94Qih9t+YfsS1CzXJOlIaRW?=
 =?us-ascii?Q?jgXv02ElIKpMcGdqeoMsZTcNesna04CEqcTSgFPLDc30pInp8RydKS08jm5+?=
 =?us-ascii?Q?7V81eWbASfCvwyIAnayYQZA6aU5SPtES7ok3vwXA4VY4HsIY/9rTnLCM3Gxx?=
 =?us-ascii?Q?Rz9lVx8DtihY30gUDpuB5OePuew5Xoa6tNi52VxDRGyKdBmW3JraMCZLc3bX?=
 =?us-ascii?Q?Y1/FgenHVHcaGSi0InM197x2kD4MecE9NM0KkifPng8AgeuoCP9s633rSHa9?=
 =?us-ascii?Q?8pQRhF0Jr661tck5/DKdAe5FCDye+HyTTe0x8kzalzRpxwWVLPeM0pCPzqa/?=
 =?us-ascii?Q?ydjZ4ecIdwYwjVSQrsL7zORqSHmwiS06+c8Xs9K0YbJMYwIy2qCdve4PsNrX?=
 =?us-ascii?Q?ymND00yIKQe7jRqCgENdkmokCDWXkEpJ0gukEOf6nHotb3AbCtsOwUZ4LjAg?=
 =?us-ascii?Q?6U4phvQaBeBa/wjLbxKnySxDWeVSYZArMSD/aMs3sR0YEv9EOG119aJAkLxj?=
 =?us-ascii?Q?GSEQAoBvFeCqJrYX9idTfJL7p6bM+7ZG3XoOSLbp3Fbe4It1nFyQ1r+O1vy9?=
 =?us-ascii?Q?5ZmKm9M0yTNRb33dr5Wsk+KN6vzBQPpTV5KmBz3R3+FB8fUjYrzJuI5SEXar?=
 =?us-ascii?Q?7dXaWXkrAwWfIs/H08gjMWzCb6wUEYUNiUgRHt+FY9Kv6EiwYyw7+31ZSQ1g?=
 =?us-ascii?Q?AV1gJfJXbmAXcrIT6PlvSVOMZLfQttlxZzLUgUas9Vl4V4I/3WMjZilw+MjZ?=
 =?us-ascii?Q?+KSxCwbZnNKtvpjB/8tVK4QdoQT6kP4XScSz0k5cBUOmFO0s3nUKI1wUYknE?=
 =?us-ascii?Q?lMknRdlTAZpQo0Na4dBT4mN7+d6pZXof+bfvdLKlYGqYKVD6eCZTlEeJVKyW?=
 =?us-ascii?Q?Qs7IIBEJbWbHvcQ26IVtyLCnQBjN6CHLkL36soMHfrTABZjm0oRNwUyssHT6?=
 =?us-ascii?Q?bzpV1vqdqkWiR1usNXb7c6sHkDHvZmUMhNRRgmN/LT+3EfUXh4tq2S1zJPG1?=
 =?us-ascii?Q?87w2u/LcPiCrBss+/nk8CB9hboe+LyBoWcQrCBF4MKtuDjPFExtvo63A9SEe?=
 =?us-ascii?Q?/lCAVy3SKOric+s1++nhcySeKGso?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1AwMqjnIPOx2pIzF8OvYtLisi3x+hLUnJjTwM7jk6O7DEOa53Zfi3eSDyjLy?=
 =?us-ascii?Q?EOzErpmqcYoexmlTCaVRRhgsOl/uZYKJgZXhnBFMiPPbCQlPoudEbxo/m4Is?=
 =?us-ascii?Q?PldH3/gqiveNFG46Ft4YkbEwnmsE4KlJXEwZLkF5txDJVOIDTRGWdUw0P/SF?=
 =?us-ascii?Q?+y2RdPitBXt1lRmeym5/lM6IT8KTtWQ2E7goI6sIHE0enwq4WZQo8LpyvrNv?=
 =?us-ascii?Q?YdYrFZvH6C9Q1qilgiIsKV3GUwi75v83svWtPq20eVu9cppu9gZLvCqTQ6tx?=
 =?us-ascii?Q?xCsu7ifODTeq1L16i6iZkT6BUi1mhPTMs3aJQr4Bx5hbSH9pCtgvkFWYCe47?=
 =?us-ascii?Q?Iq+2g3Or8s8RVAj0ZQ1Bs5qk1Wclcu51QgxEe+Xs+ktXuPt5Grm02Hcal0Oc?=
 =?us-ascii?Q?RPkibIoXDzs57zwHSvLBvFtpjAW2oAeDz3jQcCIfQ9DBvfYZosmJITmtctQz?=
 =?us-ascii?Q?pZ0YHrDt3WOn0wEBC9tqp9KZiIkVIqIupIXa8wyUI3/qLwXQ9MnTLsfIpeGq?=
 =?us-ascii?Q?EPljwvfcDgvoMha+f3dqcseZHSYqq6LDFxzeY+a3yWe+zjzOHCLJ3c0wX6pb?=
 =?us-ascii?Q?TtvKMTmz1i+TSslGIij6L0DMLlLGCMPiIbIx8kU2pNGs+H/cAVjDF/kXUTF5?=
 =?us-ascii?Q?lv5+T2KR2sXn5mGVCRGLliQkGs8nj9lYJvpNY628p0KbmfWGoyfZH+J/LPeQ?=
 =?us-ascii?Q?iWCL7grktrqEOExAYoEeH3wrCx/GIATKTMPA7etMN6VxhXyEYxRDtB9fAKf+?=
 =?us-ascii?Q?tOxaZweVJHNWPLO1NIPk4Pl/tc8/WANanv4vcJIRLNhj2j5l3P1Zbkej1fuQ?=
 =?us-ascii?Q?1TSxarAR+ARfW9Pn+1hb5+pYeoh7Btkse5X1Ux4DqC1qpAvndzi7Ti7lX11k?=
 =?us-ascii?Q?+JS42CoYGakIQERyGHP9TccO3IzwhqIgaxOl4P+7cE/wS9nXavtM7wf1sMlm?=
 =?us-ascii?Q?6cfL8x2sU5iZMZp6LAubRCmdXPzKhuV7q+DRvUKDd+I5ZjMTiGuhL+uANHNQ?=
 =?us-ascii?Q?wJl6NIgEAwWmxw92vMixuIpDjR2bQ2dzCsyp9BOUu2UZcMjI379WhMZjHOUl?=
 =?us-ascii?Q?aKeRL6D7Vt7/pjGUstlWQzgfebKZ3nD2gcHCk8e49+SdQiZcZBI2b024bpxs?=
 =?us-ascii?Q?v7OSlLaBwjDAQGJoJRA27FVASBiM+aS172hK6xHKi8qFSaomycLP2cGuzGJb?=
 =?us-ascii?Q?GZi8eVaxVxRPw5hJwsxGjHgcnAzaDy15tuqxqO2xgYHYngvWD5veHFK7pEbi?=
 =?us-ascii?Q?0c3HFs8hy08Hx4PqWS3JWMFujrARq+1X5eLswRyOqZNmJigbOKjAdwsI4kuA?=
 =?us-ascii?Q?RhIeDGlfp40jPoSdiYZARsKAGzZQGhTykEOSs0Qse2Ev9hsZyXiopXPCLfDY?=
 =?us-ascii?Q?IJM4qe+/qYG60qLScilfT87AzSn3ZCOp/UbnDFtOYAQjStAy4Bin+ZzuJNiL?=
 =?us-ascii?Q?ruQVXa8Y7Wu/+sWwcxM3k/y0L3CZgbLrxn+6Q/ihRjY2FlE32Othd4O4pHLl?=
 =?us-ascii?Q?8tcZR63D5SjRaaQu6CBiRZ2We/LkeXgS+zeS8zDajsoqqH43eZw+CTS5xvZI?=
 =?us-ascii?Q?kQOJJOeZLGWqekc+MbyN+op0vual1kngXHDxg1py?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac78cdb-e49a-451a-3569-08dd40f02d52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:37:25.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CueonP+0v85vb04r3AwZA0UNXmpzFVO8M1ZqmN+gtbKd6QBx8WSSXW0KFu5xULe8DxeetsdVrKPcXkDt2Z0iNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071
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

On Wed, Jan 29, 2025 at 12:58:01PM +0100, David Hildenbrand wrote:
> Let's pass the folio and the pte to restore_exclusive_pte(), so we
> can avoid repeated page_folio() and ptep_get(). To do that,
> pass the pte to try_restore_exclusive_pte() and use a folio in there
> already.
> 
> While at it, just avoid the "swp_entry_t entry" variable in
> try_restore_exclusive_pte() and add a folio-locked check to
> restore_exclusive_pte().

Seems reasonable.

Reviewed-by: Alistair Popple <apopple@nvidia.com>
 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index cd689cd8a7c8..46956994aaff 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -719,14 +719,13 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
>  #endif
>  
>  static void restore_exclusive_pte(struct vm_area_struct *vma,
> -				  struct page *page, unsigned long address,
> -				  pte_t *ptep)
> +		struct folio *folio, struct page *page, unsigned long address,
> +		pte_t *ptep, pte_t orig_pte)
>  {
> -	struct folio *folio = page_folio(page);
> -	pte_t orig_pte;
>  	pte_t pte;
>  
> -	orig_pte = ptep_get(ptep);
> +	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> +
>  	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
>  	if (pte_swp_soft_dirty(orig_pte))
>  		pte = pte_mksoft_dirty(pte);
> @@ -756,16 +755,15 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
>   * Tries to restore an exclusive pte if the page lock can be acquired without
>   * sleeping.
>   */
> -static int
> -try_restore_exclusive_pte(pte_t *src_pte, struct vm_area_struct *vma,
> -			unsigned long addr)
> +static int try_restore_exclusive_pte(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, pte_t orig_pte)
>  {
> -	swp_entry_t entry = pte_to_swp_entry(ptep_get(src_pte));
> -	struct page *page = pfn_swap_entry_to_page(entry);
> +	struct page *page = pfn_swap_entry_to_page(pte_to_swp_entry(orig_pte));
> +	struct folio *folio = page_folio(page);
>  
> -	if (trylock_page(page)) {
> -		restore_exclusive_pte(vma, page, addr, src_pte);
> -		unlock_page(page);
> +	if (folio_trylock(folio)) {
> +		restore_exclusive_pte(vma, folio, page, addr, ptep, orig_pte);
> +		folio_unlock(folio);
>  		return 0;
>  	}
>  
> @@ -871,7 +869,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  		 * (ie. COW) mappings.
>  		 */
>  		VM_BUG_ON(!is_cow_mapping(src_vma->vm_flags));
> -		if (try_restore_exclusive_pte(src_pte, src_vma, addr))
> +		if (try_restore_exclusive_pte(src_vma, addr, src_pte, orig_pte))
>  			return -EBUSY;
>  		return -ENOENT;
>  	} else if (is_pte_marker_entry(entry)) {
> @@ -3979,7 +3977,8 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
>  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>  				&vmf->ptl);
>  	if (likely(vmf->pte && pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
> -		restore_exclusive_pte(vma, vmf->page, vmf->address, vmf->pte);
> +		restore_exclusive_pte(vma, folio, vmf->page, vmf->address,
> +				      vmf->pte, vmf->orig_pte);
>  
>  	if (vmf->pte)
>  		pte_unmap_unlock(vmf->pte, vmf->ptl);
> -- 
> 2.48.1
> 
