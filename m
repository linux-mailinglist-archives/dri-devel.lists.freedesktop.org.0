Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAD75690CD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ED4113CEA;
	Wed,  6 Jul 2022 17:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48687113A38;
 Wed,  6 Jul 2022 17:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdDatcXjPnY7Bz8x2dWVZM6kfiWj6LEN292j5e2k9byU5TjAFwV9YBBpQ6JKj8Gz3nQgiIoJfYDW/zcFvjwB4ZBTQrGDJtZGLfthzfiOP2/1IM3nSb5SMJTtwLqAi2OJx7TOSC/qiVkkFnnkPMjcNaksQGHsvphI2gtag2z+zKJUOO8XIdMFb4iyNHhcPOiHNLJ80CrvL0dvqECyDCMtPdt8mQtR4nlo1jZ3VA0+OMja5y3EK2hNhPOLo5ACHBtdgQhhcT1oA1Z7YH4v4Ydja8scze/dcgZGkAhRqw/keI7Buru/E9CCR4mJrgbIxUSAWO0j6RT1pXg9NrG2FkZT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+qTDYZb6KlAgz7Q4gPvEG7viTPUVb70eJ7Qxw7X9fo=;
 b=grJN2XakLTW3Cyo4M9ZU1CudfQHadwaPFKIh3iUGyulLm7NCfrZAa6jxgErcc/rKhhuDg6fmORjcM/q6CJQ/dyzwe60IIUwIbQLGWrdabC+Y7VFHuzS+y4T+OgPw4/Yn1C2xhpgU1cOMHpUvnKlbzrPLXccffYg8VgLnjYd1gp7AMTmSK6K1jzgUY7kLNy16I4hmKEZovRN4VPQ3/lkKxadVA/oYpmtPe2O0gNuW6oJkUuZjGbsdMhApieJahWBtL4wybBndEVGKrCupY+tqnVhUSxdMaN2sqDE1W0eiC8BSV/dxiB9F23N4SFzS4vF4X0ZlCAYl9/Tu/sxk20q4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+qTDYZb6KlAgz7Q4gPvEG7viTPUVb70eJ7Qxw7X9fo=;
 b=SboWLEAWBEnzyxJmatQoTbUj8ar4KaEgOnvbVcK7f/4cH7lnO8EOfJggnbzz5H56x/hg/+BQmqaT6coNYNxAoofzqmtOHiYUWFn1eX+VrY8lXFzO/OhUTka6kkpmZjhMWKaagJyA8aXMlkUeKDPrrrlCXcVGSmIPwFY2TUFxwd8Mc4kBUvIUrTxI4utcbPgW6VQMMWomJrT0kM/bkIuBSDNf5y9MBDaOlpVIlLEM8/CH5BP1hmWA8k3s1if7Jm9Hc/bCgn8kG2eUcv+r6t4byR1R+67EDALFkIfwXBKEee0g+zJmCkNM2H86kMJ1722MDS9XzkykWcu6a8MpPgZlVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by BN8PR12MB3332.namprd12.prod.outlook.com (2603:10b6:408:66::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 17:39:23 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::e16c:261d:891d:676c]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::e16c:261d:891d:676c%3]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 17:39:23 +0000
Message-ID: <329db8e1-9d3c-a3ad-8c54-b6cf63a2690d@nvidia.com>
Date: Wed, 6 Jul 2022 23:09:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFT][PATCH v2 9/9] vfio: Replace phys_pfn with pages for
 vfio_pin_pages()
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, corbet@lwn.net, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, farman@linux.ibm.com, mjrosato@linux.ibm.com,
 pasic@linux.ibm.com, vneethv@linux.ibm.com, oberpar@linux.ibm.com,
 freude@linux.ibm.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-10-nicolinc@nvidia.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
In-Reply-To: <20220706062759.24946-10-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac75a45a-7d35-42ec-d08f-08da5f7676ad
X-MS-TrafficTypeDiagnostic: BN8PR12MB3332:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ryNq3Hl7V7/2qP+aKeU/dJi1QtJAqsA3bFg6iTlqpTldNd9+st3Pvy+nXdCgcPUDkim/y5SPKEgW1otGqS2hkqEQFRc3lbCMYW2Kmnqx7mb8vrl+0o50NmJavIH+lzuwgl+JtGQRR9Wk5fMaTE6DUXmR7w94dVIVYVLHTpSOD6pi1GYVn6c4F5VSVDPFm25AlidKImb3L2vy8HSyd4yrQ4c+3cxy6CY8pe5icbjrGYLOrzVRb/AyVB3ZIZMSJtlLDc1dsl3ED//YlXqHaXzYzh5qzKM3a7ZehCELCWgcmhoRBDnwOMl6D0gH3oZN64f0qih+daSuii9EOlVMDVqw1mix9erJGZXwQjneAbNs7HTqLr5izfiH2kLdocdLHVJuFm2GWvXJebzCJsfnZpWFYThkw2cRyXAN2zplYQ1NphamyVLRDVy+OXTV2K0iTD1YahyD4O3x/sF6KbYqHjc43PtvyTAOSovuhBDQaC0VXc0XwsKLzDBon8YbMROCc2PlB+kRRAqpdruwRyQZJ1ul0v7V8osO2BDefexnGev3qfrLyxTxylah0jRfNlVASCb7NbUIMK8Sj1l+VOz/r8COta3i2x3hibQvy2aTTkzwF9BRchXSJNrj/XKhbRrytGd7GdfVegi10vkABNKdp1ZT5POnVM5raTrAvNwrcjt0AuAEZKOg7ryFbLp/wTXLnQMDhzQ40AjLmNsLiCu6f78Lex2OkGScl22Vi47WJj5LkyoCgw/PEHW+NePi2LhRiW7H1Jh1+QpTuKEDxMj4+Qgl4AdCkm31as0YrOhVZEQNx17KHB+wd/TI8RrRMwaKrh8L1UJ2z8dANFOFv0MMwErEwMyXNynbQ681GYX9sQvjcRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(83380400001)(26005)(8676002)(4326008)(186003)(66556008)(66476007)(86362001)(478600001)(31696002)(6486002)(7406005)(30864003)(66946007)(5660300002)(8936002)(7416002)(921005)(38100700002)(41300700001)(2906002)(107886003)(2616005)(6666004)(55236004)(53546011)(54906003)(6506007)(316002)(6512007)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZFRmRYOSs4T3BPRTAzRDVtWDRGUXplblpjTldRK1FmWG9PYWNmWlcyWnR2?=
 =?utf-8?B?dzF4bW5aeHBZTmI1cXBwOGtuU0hJakFjZ0xXTWhqOWFwRzNUaklROWFBV2pz?=
 =?utf-8?B?UmwzanZOREtLWEoraFNFcU15bmlNYUR4d0FpaXQrOEhPcFZpdWpwMC9UV3Z4?=
 =?utf-8?B?bmVBb3ZnempqVjJTcDl6OXFCVEliWDVCNFlRT1kvSms5U3RROXY2TlRiUy80?=
 =?utf-8?B?R3QyTncrU0piV0Jzd2l1czBFcVBJcnFHZlBPaEdBNnNvNEZVcTY4dTBJL2Va?=
 =?utf-8?B?ZjNSOG9VWUJxWE1PYm1yemF1c2k4b1BXMHJJQjYzOHlKek9NeSsxa3E0STYy?=
 =?utf-8?B?cXFLRytEQ3hXT3Q2RVhOV2t3anM0bDJSWTkzMDR6eFY2aEMwaHc0bHVHSzBZ?=
 =?utf-8?B?d2NpbGFVbitreUVSSXpWTTdWNXRZYmFJS1dKb3NENjBVdlpMWHNYMlBUeGdv?=
 =?utf-8?B?aVl3cGpjZkVLeGlENWQreTg1cVlCUjRXMi93eFl2NHdpZGF4andSTEpuOXlz?=
 =?utf-8?B?aGVidDZJZ2Rqa1pMK29lbTZYeDczcytXU1Fyb1J2ZEVYWU5pdmgvSVF2YnhU?=
 =?utf-8?B?N3FDOTJvbmtUZXhUQlVHZ3lJbTgxRVZrMmNNT0tXZStrV1JFV0NqcGlSL0Qz?=
 =?utf-8?B?ZzV2Vi9pVmdmcW9CWGs1cDRyWkNVcS85UUFNV1VtNVI5dmpPWVZLS3pxSzcy?=
 =?utf-8?B?dDMyU25QL0dWQS9DR1hsaGVlREtKNm45N2xIVnNTUmdGTUN4eDFITkVRdTZn?=
 =?utf-8?B?ZXZGaXhMT3pGWi92NWlKelFLU0RrYzdwejRUNEdmNFQ1NnJsMnI3ZlB6UDlV?=
 =?utf-8?B?YWhMNFJKRnRoRWdpUVpUUm9JYzZRVzF6TGV2dTJSRXJScTlGeWVyYllYcHNO?=
 =?utf-8?B?R1E3UWhTVE1qMTJLWTVYUjVYSzFJQnpOL05NdHdGek84ekV0YVlkTmt4OU04?=
 =?utf-8?B?dUFOcjIvMjdxeUdCWWg1QXB5WVZmQXBnOXUvZVB5Vk52K2xoN2VCRXRhU01Z?=
 =?utf-8?B?ODB2bzE2cFpJcUxuc0UxUUwzVWRsWnNneitNL2FxTk1mUVprSlBzR2FDbEFO?=
 =?utf-8?B?SHZhbHhaUldPdURrd2xRWGhMQWVqViszQ3NteGxxVTJMckxtNEFQRXVUK2hI?=
 =?utf-8?B?QzFScElTV2lsUnBvbHNjT1ZvMUFoc0FXMlJkVnZ5aTZqMlBWVEZwejNWbjhS?=
 =?utf-8?B?NXVIVEQyMk1rOW9FNWpxUU1SbEUrRmpvc1JIWWhBMlo3c2tMQ2RGbVd6cG1o?=
 =?utf-8?B?TlhMM2lSallwNTJaYU1CTFhvT1dsSVVGNVluVWQySll0NkNYTzU5YjFqbDVK?=
 =?utf-8?B?VkIrbzFoV0loTjJSM2VDVmswbHB3b1kzSE8yd0tJM1JtOXFYbXF6QUdVMWsx?=
 =?utf-8?B?QjJONDlDYzZIek5iOEFCbFN3S2lhTkNmOHJJazdlVjBHRXB2M2pJRHRycWNV?=
 =?utf-8?B?cE1QbitnNTFjNkl2YzI4YUFNZ2Mya2pkelJpSzQxV04xd0xEbzZ2cVNiR0pu?=
 =?utf-8?B?WVo0ZXZjajBvMVNQRXFQSWpiSFluNjBSM1lDR3VyNE5KSzBiekgwZ1psdmNl?=
 =?utf-8?B?dDRlZmZGRzFORDZEWG9WTWVCUnA5SmN6KzhwTHBPbThHQjBrV3VQTDJSM0tE?=
 =?utf-8?B?V0c1dEZwY1N1RmkyZFl2SUNnZ0V1c2ZFalovSDE4U20vMVcrRlZHNG9iWkh6?=
 =?utf-8?B?RWd1RWZHVVFBK2lDTzJYQWMyMWxvdVpVRytWbUdKWkF4QWw1Rk54TVFEWUpi?=
 =?utf-8?B?SnZtVHU5eStiYWdxK3VQQ1NTUk1pOHU5MW4vdXQ5K3BXbXNDSTNReEFiNzho?=
 =?utf-8?B?a0gxTE5OQTlsUUR6QW9HVzZ1dnBxY0d3N1pIaHoxT0ZwRXRQV0NLZUVVcGJF?=
 =?utf-8?B?REpIcWJrQXZvR0NoL05BU1JHSlRRcUZyVGd4a2gyREJqdEhlaUVzOVRoMHUv?=
 =?utf-8?B?bFRiQjBPYUlxV0NOem9DT3R2RVV5Y3hiOXhWVEk0aVNPM0lJSE5EYXMvTURj?=
 =?utf-8?B?aTdrRjVac1kwTTUrdGxDeHphaHJmTjBoYy9pQUl6WU9VZjRBYzdTWjdaTWFm?=
 =?utf-8?B?Sno1M3EwSERFY0xQMDl6M25GQkYxdGo3S0RlVzJDSVFVSlN1ZGRyVDI1YklP?=
 =?utf-8?Q?PfXdqdyQjP6q4Omh+TMV+PblE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac75a45a-7d35-42ec-d08f-08da5f7676ad
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:39:23.1978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHSo8o/i4mspgaZX9+DEK8KDZwoHhjjP/BTiZcQw3NX0VG5cO+gAFk1o+FPt0zicz+Pabca+L94+Zzg6j1pcXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3332
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
Cc: linux-s390@vger.kernel.org, Neo Jia <cjia@nvidia.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 jchrist@linux.ibm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tarun Gupta <targupta@nvidia.com>,
 Shounak Deshpande <shdeshpande@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

On 7/6/2022 11:57 AM, Nicolin Chen wrote:
> Most of the callers of vfio_pin_pages() want "struct page *" and the
> low-level mm code to pin pages returns a list of "struct page *" too.
> So there's no gain in converting "struct page *" to PFN in between.
> 
> Replace the output parameter "phys_pfn" list with a "pages" list, to
> simplify callers. This also allows us to replace the vfio_iommu_type1
> implementation with a more efficient one.
> 
> For now, also update vfio_iommu_type1 to fit this new parameter too.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   .../driver-api/vfio-mediated-device.rst       |  2 +-
>   drivers/gpu/drm/i915/gvt/kvmgt.c              | 19 ++++++-------------
>   drivers/s390/cio/vfio_ccw_cp.c                | 19 +++++++++----------
>   drivers/s390/crypto/vfio_ap_ops.c             |  6 +++---
>   drivers/vfio/vfio.c                           |  8 ++++----
>   drivers/vfio/vfio.h                           |  2 +-
>   drivers/vfio/vfio_iommu_type1.c               | 19 +++++++++++--------
>   include/linux/vfio.h                          |  2 +-
>   8 files changed, 36 insertions(+), 41 deletions(-)
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> index ea32a0f13ddb..ba5fefcdae1a 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -263,7 +263,7 @@ The following APIs are provided for translating user pfn to host pfn in a VFIO
>   driver::
>   
>   	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> -				  int npage, int prot, unsigned long *phys_pfn);
> +				  int npage, int prot, struct page **pages);
>   
>   	void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
>   				    int npage);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index ea6041fa48ac..3a49471dcc16 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -239,7 +239,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   		unsigned long size, struct page **page)
>   {
> -	unsigned long base_pfn = 0;
> +	struct page *base_page = NULL;
>   	int total_pages;
>   	int npage;
>   	int ret;
> @@ -251,26 +251,19 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   	 */
>   	for (npage = 0; npage < total_pages; npage++) {
>   		dma_addr_t cur_iova = (gfn + npage) << PAGE_SHIFT;
> -		unsigned long pfn;
> +		struct page *cur_page;
>   
>   		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
> -				     IOMMU_READ | IOMMU_WRITE, &pfn);
> +				     IOMMU_READ | IOMMU_WRITE, &cur_page);
>   		if (ret != 1) {
>   			gvt_vgpu_err("vfio_pin_pages failed for iova %pad, ret %d\n",
>   				     &cur_iova, ret);
>   			goto err;
>   		}
>   
> -		if (!pfn_valid(pfn)) {
> -			gvt_vgpu_err("pfn 0x%lx is not mem backed\n", pfn);
> -			npage++;
> -			ret = -EFAULT;
> -			goto err;
> -		}
> -
>   		if (npage == 0)
> -			base_pfn = pfn;
> -		else if (base_pfn + npage != pfn) {
> +			base_page = cur_page;
> +		else if (base_page + npage != cur_page) {
>   			gvt_vgpu_err("The pages are not continuous\n");
>   			ret = -EINVAL;
>   			npage++;
> @@ -278,7 +271,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   		}
>   	}
>   
> -	*page = pfn_to_page(base_pfn);
> +	*page = base_page;
>   	return 0;
>   err:
>   	gvt_unpin_guest_page(vgpu, gfn, npage * PAGE_SIZE);
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
> index cd4ec4f6d6ff..8963f452f963 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -22,8 +22,8 @@
>   struct page_array {
>   	/* Array that stores pages need to pin. */
>   	dma_addr_t		*pa_iova;
> -	/* Array that receives PFNs of the pages pinned. */
> -	unsigned long		*pa_pfn;
> +	/* Array that receives the pinned pages. */
> +	struct page		**pa_page;
>   	/* Number of pages pinned from @pa_iova. */
>   	int			pa_nr;
>   };
> @@ -68,19 +68,19 @@ static int page_array_alloc(struct page_array *pa, u64 iova, unsigned int len)
>   		return -EINVAL;
>   
>   	pa->pa_iova = kcalloc(pa->pa_nr,
> -			      sizeof(*pa->pa_iova) + sizeof(*pa->pa_pfn),
> +			      sizeof(*pa->pa_iova) + sizeof(*pa->pa_page),
>   			      GFP_KERNEL);
>   	if (unlikely(!pa->pa_iova)) {
>   		pa->pa_nr = 0;
>   		return -ENOMEM;
>   	}
> -	pa->pa_pfn = (unsigned long *)&pa->pa_iova[pa->pa_nr];
> +	pa->pa_page = (struct page **)&pa->pa_iova[pa->pa_nr];
>   
>   	pa->pa_iova[0] = iova;
> -	pa->pa_pfn[0] = -1ULL;
> +	pa->pa_page[0] = NULL;
>   	for (i = 1; i < pa->pa_nr; i++) {
>   		pa->pa_iova[i] = pa->pa_iova[i - 1] + PAGE_SIZE;
> -		pa->pa_pfn[i] = -1ULL;
> +		pa->pa_page[i] = NULL;
>   	}
>   
>   	return 0;
> @@ -144,7 +144,7 @@ static int page_array_pin(struct page_array *pa, struct vfio_device *vdev)
>   
>   		ret = vfio_pin_pages(vdev, *first, npage,
>   				     IOMMU_READ | IOMMU_WRITE,
> -				     &pa->pa_pfn[pinned]);
> +				     &pa->pa_page[pinned]);
>   		if (ret < 0) {
>   			goto err_out;
>   		} else if (ret > 0 && ret != npage) {
> @@ -195,7 +195,7 @@ static inline void page_array_idal_create_words(struct page_array *pa,
>   	 */
>   
>   	for (i = 0; i < pa->pa_nr; i++)
> -		idaws[i] = pa->pa_pfn[i] << PAGE_SHIFT;
> +		idaws[i] = page_to_phys(pa->pa_page[i]);
>   
>   	/* Adjust the first IDAW, since it may not start on a page boundary */
>   	idaws[0] += pa->pa_iova[0] & (PAGE_SIZE - 1);
> @@ -246,8 +246,7 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
>   
>   	l = n;
>   	for (i = 0; i < pa.pa_nr; i++) {
> -		struct page *page = pfn_to_page(pa.pa_pfn[i]);
> -		void *from = kmap_local_page(page);
> +		void *from = kmap_local_page(pa.pa_page[i]);
>   
>   		m = PAGE_SIZE;
>   		if (i == 0) {
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 6945e0ddc08c..b0972ca0dfa3 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -234,9 +234,9 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   	struct ap_qirq_ctrl aqic_gisa = {};
>   	struct ap_queue_status status = {};
>   	struct kvm_s390_gisa *gisa;
> +	struct page *h_page;
>   	int nisc;
>   	struct kvm *kvm;
> -	unsigned long h_pfn;
>   	phys_addr_t h_nib;
>   	dma_addr_t nib;
>   	int ret;
> @@ -251,7 +251,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   	}
>   
>   	ret = vfio_pin_pages(&q->matrix_mdev->vdev, nib, 1,
> -			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
> +			     IOMMU_READ | IOMMU_WRITE, &h_page);
>   	switch (ret) {
>   	case 1:
>   		break;
> @@ -267,7 +267,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   	kvm = q->matrix_mdev->kvm;
>   	gisa = kvm->arch.gisa_int.origin;
>   
> -	h_nib = (h_pfn << PAGE_SHIFT) | (nib & ~PAGE_MASK);
> +	h_nib = page_to_phys(h_page) | (nib & ~PAGE_MASK);
>   	aqic_gisa.gisc = isc;
>   
>   	nisc = kvm_s390_gisc_register(kvm, isc);
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index b95ec2d78966..96b758e06c4a 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1917,18 +1917,18 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
>    * @npage [in]   : count of pages to be pinned.  This count should not
>    *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
>    * @prot [in]    : protection flags
> - * @phys_pfn[out]: array of host PFNs
> + * @pages[out]   : array of host pages
>    * Return error or number of pages pinned.
>    */
>   int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> -		   int npage, int prot, unsigned long *phys_pfn)
> +		   int npage, int prot, struct page **pages)
>   {
>   	struct vfio_container *container;
>   	struct vfio_group *group = device->group;
>   	struct vfio_iommu_driver *driver;
>   	int ret;
>   
> -	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
> +	if (!pages || !npage || !vfio_assert_device_open(device))
>   		return -EINVAL;
>   
>   	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> @@ -1943,7 +1943,7 @@ int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>   	if (likely(driver && driver->ops->pin_pages))
>   		ret = driver->ops->pin_pages(container->iommu_data,
>   					     group->iommu_group, iova,
> -					     npage, prot, phys_pfn);
> +					     npage, prot, pages);
>   	else
>   		ret = -ENOTTY;
>   
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index dbcd0e8c031b..dbfad8e20581 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -52,7 +52,7 @@ struct vfio_iommu_driver_ops {
>   				     struct iommu_group *group,
>   				     dma_addr_t user_iova,
>   				     int npage, int prot,
> -				     unsigned long *phys_pfn);
> +				     struct page **pages);
>   	void		(*unpin_pages)(void *iommu_data,
>   				       dma_addr_t user_iova, int npage);
>   	int		(*register_notifier)(void *iommu_data,
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index f10d0c4b1f26..de342d82b154 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -830,7 +830,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   				      struct iommu_group *iommu_group,
>   				      dma_addr_t user_iova,
>   				      int npage, int prot,
> -				      unsigned long *phys_pfn)
> +				      struct page **pages)
>   {
>   	struct vfio_iommu *iommu = iommu_data;
>   	struct vfio_iommu_group *group;
> @@ -840,7 +840,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	bool do_accounting;
>   	dma_addr_t iova;
>   
> -	if (!iommu || !phys_pfn)
> +	if (!iommu || !pages)
>   		return -EINVAL;
>   
>   	/* Supported for v2 version only */
> @@ -879,6 +879,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	do_accounting = list_empty(&iommu->domain_list);
>   
>   	for (i = 0; i < npage; i++) {
> +		unsigned long phys_pfn;
>   		struct vfio_pfn *vpfn;
>   
>   		iova = user_iova + PAGE_SIZE * i;
> @@ -895,23 +896,25 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   
>   		vpfn = vfio_iova_get_vfio_pfn(dma, iova);
>   		if (vpfn) {
> -			phys_pfn[i] = vpfn->pfn;
> +			pages[i] = pfn_to_page(vpfn->pfn);
>   			continue;
>   		}
>   
>   		remote_vaddr = dma->vaddr + (iova - dma->iova);
> -		ret = vfio_pin_page_external(dma, remote_vaddr, &phys_pfn[i],
> +		ret = vfio_pin_page_external(dma, remote_vaddr, &phys_pfn,
>   					     do_accounting);
>   		if (ret)
>   			goto pin_unwind;
>   
> -		ret = vfio_add_to_pfn_list(dma, iova, phys_pfn[i]);
> +		ret = vfio_add_to_pfn_list(dma, iova, phys_pfn);
>   		if (ret) {
> -			if (put_pfn(phys_pfn[i], dma->prot) && do_accounting)
> +			if (put_pfn(phys_pfn, dma->prot) && do_accounting)
>   				vfio_lock_acct(dma, -1, true);
>   			goto pin_unwind;
>   		}
>   
> +		pages[i] = pfn_to_page(phys_pfn);
> +
>   		if (iommu->dirty_page_tracking) {
>   			unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
>   
> @@ -934,14 +937,14 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	goto pin_done;
>   
>   pin_unwind:
> -	phys_pfn[i] = 0;
> +	pages[i] = NULL;
>   	for (j = 0; j < i; j++) {
>   		dma_addr_t iova;
>   
>   		iova = user_iova + PAGE_SIZE * j;
>   		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>   		vfio_unpin_page_external(dma, iova, do_accounting);
> -		phys_pfn[j] = 0;
> +		pages[j] = NULL;
>   	}
>   pin_done:
>   	mutex_unlock(&iommu->lock);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 9108de34a79b..c76a2c492bbd 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -148,7 +148,7 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
>   #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
>   
>   int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> -		   int npage, int prot, unsigned long *phys_pfn);
> +		   int npage, int prot, struct page **pages);
>   void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage);
>   int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova,
>   		void *data, size_t len, bool write);
