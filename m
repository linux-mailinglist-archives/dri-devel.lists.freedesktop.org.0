Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2213E124149
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282056E25A;
	Wed, 18 Dec 2019 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952286E122;
 Tue, 17 Dec 2019 20:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lievaVqHto+cdK1hMYSd1G1nCk4fOD1ujYKIoAb2/W9jX3zL6BnCwPGZZp1Vf/tSUYj0r8HoM5A6JojGWl/Du2qDhvpGoEwWO87G6obG6cLLlo8G87inFL7yL6nL/Sjm08M52g9h1KA3lYeO0Tk7IwTWfAhQ2wxpp4biWnt327SlDUrF5X8TkvtIlOFC+fYCmQzkjtXSBCxUVWOQy2DOl18ndojzRqBPKgXMWCgrWkn92j+C9bwWd6ZAMjJqQGimyNpZbf/qR0fmBK0FkN4kap/v2clA7PBo7Dm+rlH+C9Bc3mTylQXM+3Vqv0JuvSEsIeqrs3mGCRJrxN6RtbCFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM0LF9pq7tH1+ciu+Y7M3U9sqfhpWdjinDfHyaT/F/4=;
 b=ffB2BjJlKK5J78evqNI/5pC26udb/hk9IoejlEghV4HNZs5a/7496YGobo76DsVGm3o/D09ilYMYPKj8CoZS0mxhk4txpB9sxmmUo9J8aC2nFswinBvlAnixL8A9RYmNWGGqJ7I25iCtzkIB48Wd0Sv1Vsl7bfJPqS1ZXAENUI0yVXod4iyQnNj6fE2MMxVp8mIX8jZMtu1b7OdRYw1omEIH5ayINVFS45VXbIp5qHijU+JreKvwh7tMnibG/ncXk+TqtX5xP4Wr3jY0rBuKJUsmHcn7RvpFGfMOYH2kRQv2q/F1fU7C569x0IqDeDAnc8eO17B4bu8EgUiVwaGHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM0LF9pq7tH1+ciu+Y7M3U9sqfhpWdjinDfHyaT/F/4=;
 b=OgAFJqPkN/8tu5FZEymZvSh5Vi0Kcsvw3h+kTcMboq2Ho9xaBeOZTsI3ZbC2bgLleLq1HYxqrYZ5QtThev/IEZzBfpI+lra/j5hKNDGdLQyHLQViftK4T2SoOOS2H24xCKBgOzjnFBlDGZilCStSd8s11W7ZLpipPQ8ZSF1IK7U=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5437.eurprd05.prod.outlook.com (20.177.201.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Tue, 17 Dec 2019 20:35:47 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 20:35:47 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC v2 06/12] drm/i915/svm: Device memory support
Thread-Topic: [RFC v2 06/12] drm/i915/svm: Device memory support
Thread-Index: AQHVsgG+/y4Y10V2VkSVV+BziSdJ2Ke+zxeA
Date: Tue, 17 Dec 2019 20:35:47 +0000
Message-ID: <20191217203543.GH16762@mellanox.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215614.24558-7-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN3PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:400:4::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a9f3f530-d083-42c3-fb6d-08d78330b22c
x-ms-traffictypediagnostic: VI1PR05MB5437:
x-microsoft-antispam-prvs: <VI1PR05MB543710D86A2B32FCA7173F20CF500@VI1PR05MB5437.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(199004)(189003)(66946007)(71200400001)(6506007)(8936002)(4326008)(6916009)(186003)(2906002)(8676002)(66446008)(1076003)(478600001)(6486002)(26005)(33656002)(2616005)(36756003)(81156014)(86362001)(66476007)(66556008)(316002)(64756008)(5660300002)(7416002)(81166006)(6512007)(52116002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5437;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zp2kSDilcg6Dc7PVk0IkQCWdFw8YhN8dGP3huHhvC/gH0Z7/1BXJlAtbKClkbhpkdXB4xdjKPDIMl4vrnYfMydTN1PsFkgHbj+38SS3hi4CKjRvicziEsgDGMfkwiDUk0Ig41g3uoKITiC3y4DKVdz3w3wQDNATIJkl0mELO5PbdcF1gJ3rqVNVUSbv+HtWwQSgbCZEsNJfiVJUcfgmsg0F+ZfWYCXHFNXeloNAJYhARQ0o7+tYCa+9hYVG4s4WpTylEZDF5HbO1+pZVbsM3s/Opj+2R9ihAkVclo5Wc8CucdJ+rAGWlsCYs/Pe9Z5iNc+5C4rj6Z9LjMi/Kf8UYdOM5//03rDCICpoxQZUkuj+OnQPA24QU8olozJR4cnA/2YwPDbppWumN8B6n7eshD1jpoc3tYNQJssuUXGXhnZZH480jWs6HJ5yzZZSmaMIC
x-ms-exchange-transport-forked: True
Content-ID: <94E0B86E6F3B634F93A2B0115BAE1CC1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f3f530-d083-42c3-fb6d-08d78330b22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 20:35:47.0773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +a0JMuABelIKBBXS+cGxsa9kOGCdiqD/3n5AiR1TqDbiI4tP4IbixgeZzYSZ/c1UZQChBKgMsPtDV5Icl4wmjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5437
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: "kenneth.w.graunke@intel.com" <kenneth.w.graunke@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason.ekstrand@intel.com" <jason.ekstrand@intel.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 01:56:08PM -0800, Niranjana Vishwanathapura wrote:
> @@ -169,6 +170,11 @@ static int i915_range_fault(struct svm_notifier *sn,
>  			return ret;
>  		}
>  
> +		/* For dgfx, ensure the range is in device local memory only */
> +		regions = i915_dmem_convert_pfn(vm->i915, &range);
> +		if (!regions || (IS_DGFX(vm->i915) && (regions & REGION_SMEM)))
> +			return -EINVAL;
> +

This is not OK, as I said before, the driver cannot de-reference pfns
before doing the retry check, under lock.

> +
> +int i915_dmem_convert_pfn(struct drm_i915_private *dev_priv,
> +			  struct hmm_range *range)
> +{
> +	unsigned long i, npages;
> +	int regions = 0;
> +
> +	npages = (range->end - range->start) >> PAGE_SHIFT;
> +	for (i = 0; i < npages; ++i) {
> +		struct i915_buddy_block *block;
> +		struct intel_memory_region *mem;
> +		struct page *page;
> +		u64 addr;
> +
> +		page = hmm_device_entry_to_page(range, range->pfns[i]);
                        ^^^^^^^^^^^^^^^^^^^^^^

For instance, that cannot be done on a speculatively loaded page.

This also looks like it suffers from the same bug as

> +		if (!page)
> +			continue;
> +
> +		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> +			regions |= REGION_SMEM;
> +			continue;
> +		}
> +
> +		if (!i915_dmem_page(dev_priv, page)) {
> +			WARN(1, "Some unknown device memory !\n");

Why is that a WARN? The user could put other device memory in the
address space. You need to 'segfault' the GPU execution if this happens.

> +			range->pfns[i] = 0;
> +			continue;
> +		}
> +
> +		regions |= REGION_LMEM;
> +		block = page->zone_device_data;
> +		mem = block->private;
> +		addr = mem->region.start +
> +		       i915_buddy_block_offset(block);
> +		addr += (page_to_pfn(page) - block->pfn_first) << PAGE_SHIFT;
> +
> +		range->pfns[i] &= ~range->flags[HMM_PFN_DEVICE_PRIVATE];
> +		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
> +		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;

This makes more sense as a direct manipulation of the sgl, not sure
why this routine is split out from the sgl builder?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
