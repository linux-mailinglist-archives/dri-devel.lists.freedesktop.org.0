Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E7B0FFCD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 07:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE54310E1CB;
	Thu, 24 Jul 2025 05:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5Avkqa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720E510E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 05:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753334041; x=1784870041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JoJJobVJO3IvEliM0YpHvR3zR5baor7jVn/JVeXXcGA=;
 b=I5Avkqa/6cOfLsK00jvmcjWqpUZFKnfK3qr2Gs8n4iwjLLNyDn2CWcm7
 sxGxCHtMPyGjBl3B8IkpfdHD0WMELr9wcyE9wy2UVgp5Xlcv0f0G378bR
 C95dioO98YoMPfim4j3GkCOF01SxzhM8r+/BfOwm6bT37QTWGHxPc18xt
 eW2tEsaXJWDbECZpLk8FqdW6Hp+7jVwlsVnXeoG6FQCtC/FCEsWhSGkdN
 FBTApk+ifWxt+Fak1NXbAKWkIQm5hfVBeOm1mY2u1/eO4wCh5yXae7TH3
 XUzIlXWAIJ6nxSsQGg4blNtodKGYBiVpza0LZGKx1mCQO0jxNZGWB+4V8 A==;
X-CSE-ConnectionGUID: 3MU20/7FTJ6H+6eKPQuOrA==
X-CSE-MsgGUID: pa5kc0TuQBqcbuWX8dWuKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55780617"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="55780617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 22:14:00 -0700
X-CSE-ConnectionGUID: TzrUFwe/TmCYBz6eC8hYGg==
X-CSE-MsgGUID: senWZ3RjQBqeJM+x1QKKgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="160235183"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 22:13:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 22:13:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 22:13:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 22:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW8unMj7OMMoP0uCx4u6hgMGTXBIXrsHuxBvdRKwi4t2UUJhwNaiM9f7zZ6+vw9ImVq/70gac21pEG0XUWbpeCav/SrpEl5iZpsKgTMTqrCs3Pe8M3gAK4d7RJGRd/RH5Q194cYdNDGHTEpRMOOz07nAEmuY6PKh3FwQrvm253Y+j62NqUINiPmNmy5MphUIkxHhRNlyay3NEQpxLQT6c3gL8v1KLNPSowdTqc+RwFDQffXkuHregU7/b3k5HvsdPM23Vya6bzADFqa8yJwpmwhULy6LpGtmsEkqcw8kyqxsrGudh6VbDMGdo9f+eZM3JAs9W/Yh2ufKretFL+Tweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3O4eP72ZsW5qnij+fAQZ+JKkP5ax8K1UiQRqVG4umA=;
 b=BYmFrqFbvLUzzcMIHqjW9vlicgpOWry79AsGfgALXoED3AdPQToMjhlUg37g1qe5+xZszdsUbLKGzmldfTDSAOFNbOuOmiJ99U4OexDKHEYV1yxrHrlFb3bwyeyMdSIJhOeXzK2XYY4td48woxFKqOIIEZN7/6Fe2KWYMGsawEOjmOC6y0fQVJwL3dRiKD2K6dpCwxkxvqUdoIf2dS8L9VjsxBXljKUjh+K+H6M95xsls93Ax/udYPzdy22YSPOXzYVnAXn5rmTdfEn3dk52x0PBXIXXQh70u/S7E3lsDrkokw4ZVOO29eptVutpuJEKK/j1kO7p3yhfjWbAajTBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB6311.namprd11.prod.outlook.com (2603:10b6:8:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 24 Jul
 2025 05:13:49 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 05:13:49 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>
CC: Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason
 Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, Jens Axboe <axboe@kernel.dk>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>, Joerg Roedel
 <joro@8bytes.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>
Subject: RE: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Topic: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Index: AQHb+9IaqW2aYf5a0kKT+xAFJGMHyLRAkYIg
Date: Thu, 24 Jul 2025 05:13:49 +0000
Message-ID: <IA0PR11MB7185E487736B8B4CD70600DEF85EA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <cover.1753274085.git.leonro@nvidia.com>
 <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
In-Reply-To: <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB6311:EE_
x-ms-office365-filtering-correlation-id: 6f035736-2d25-4cf1-8e48-08ddca70dfb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?TplHPSr9behLwrKHcSXAoZCbZM9Zj9CvLeMPXLjgYWEx0pIiT0PyQiKNbU?=
 =?iso-8859-1?Q?HSwVYXbdwqqDHkdQ4aTlGWu7NTecvF/NFXiTDRYCIVduHH2cC1gRMl1JrI?=
 =?iso-8859-1?Q?9c/Mof3HMQ/2tgrIlDsYNaOOQ741d8VZOTODEP9Q6BeAr9gKWtHtCoYgY3?=
 =?iso-8859-1?Q?Q9lh5Jy0MZ/kzXPqvNJWezLsfCx8F8jf8gklcWStpWLoOY+8RQ2l44nE4m?=
 =?iso-8859-1?Q?u8ahXn28U9AiLVUYOhN67o/cABAKEZ6XFp5qPuCLM/0ghflQ6Zzw1UBpAB?=
 =?iso-8859-1?Q?4RRsfpw/L+LtAtuxVWAkNndieSP5ZiBl81ZWfxpZF4DgLTDp+pgiPhqba1?=
 =?iso-8859-1?Q?N4IiwWtChoS54CCprGlPs6qwlST6NKvZvhxMw0n/ykMmCk9Ib1u4IQ4uYs?=
 =?iso-8859-1?Q?eliHZIA1YufiZRZXq3GORLMQZnot6/xgeys2rD0QRICwJvm6R1748G/HM+?=
 =?iso-8859-1?Q?Oo8Vg3etnNwllETZsOY4tDpV6M3077g8XahF8oWQAN0dRIMWld7jBPT8G3?=
 =?iso-8859-1?Q?ig+DNLEerJW6JAUmnTtHcOSoTSCReQEbowcIVBaThHr4qDorjU7KIJMjVU?=
 =?iso-8859-1?Q?YeBLqBQyYZZFzy0+BLrse6zwKY/0bcMFyVhtPZvxvqoIhss7qNW3fJi6kn?=
 =?iso-8859-1?Q?VfXOmOMt3gJwM0b/+7tfyRHjcz7OGDhD93YfmD4MtGUS1F+Y0JTpu7de81?=
 =?iso-8859-1?Q?HkbtonL3y7Cv2MHv3VyI1RgylbcgUjSx0PWaFInLJyPHbhA3IDt6Tc0GNu?=
 =?iso-8859-1?Q?XsGvQvFBv+W2bwR+dv+xwDnIvoNk6GGUDiyVB7o0xoGQbf+UIcCWuTLbq2?=
 =?iso-8859-1?Q?8xfbHcFdSv8oN+4M8mBeBc+DyORgAmuJ3cJZGuxWjTthjGpt4Vs/5NY7yS?=
 =?iso-8859-1?Q?9LdawRIDYnc9nO+NMOD49emJTymdCgSwtNrNNaWtSt0JnOy/98H7aiOKMq?=
 =?iso-8859-1?Q?nQdWKKe6ESGl0m8tDfUE+1ikN1N8SXv/pcgrKEczg7izmGi3qQwdKfj+b3?=
 =?iso-8859-1?Q?KlMR6X74hhJbKM+HarpX9HOFbPZBl21QRt0JUZeofvCU3dR5N/gB+CQOiy?=
 =?iso-8859-1?Q?itfiR+KIzXdNSKG9bOr+p6jegzXikRRjqCQ5gm2rf+cZZhzMBgMASV35sq?=
 =?iso-8859-1?Q?5iJDzJvxKLYY3FP/5LlGRClDD52w4q4m9KL65GBGuK4u8PEz0450q0730Y?=
 =?iso-8859-1?Q?Ai34QSlzece8ObEr2MR2t8WfNjR1Gh05LB/GADwwS8PMjjKnM+D2pduZgv?=
 =?iso-8859-1?Q?ZPo0mwNfGIvGqqO2OqgKN4A3mNfaMkuHOFz4lAWG3coJ7vlrSD4j2ylrNW?=
 =?iso-8859-1?Q?j3JrG18JN8CodtaM1pldbLbJ03udG2YLMCO5MWA4+Si3G2ojpAkrGBfp0r?=
 =?iso-8859-1?Q?dkoggGCM8mYu2xGr3hsT1nmXoaipKAJIFSEtUVb/9cNCrdswcir3tWQi6F?=
 =?iso-8859-1?Q?cGo6zOBlVHVZ6s24TEPJPx0S+TUuZBdNKG35qtviGfzPjGAaDrDbOQNgn2?=
 =?iso-8859-1?Q?FgdmKLk02N2Zgez1R5SiDWhxX1/Gvc6FwLKji5sars5Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fl6L1+R5WKhGk9NgEJrrAjeJc/FLUP/HUbkR5648OFEa6A0Ms5V/xEJJvR?=
 =?iso-8859-1?Q?sT1w7IGYa7uxCm83uqnUfZEGMa2dyeaaLdPSRzElNZTcMz+yFKiNVYc6Wn?=
 =?iso-8859-1?Q?EUC0DCa3oL0kT2dxb1pT605T5C/orMKJst0+JmbQAhSLwBEe9kcFPEOI9y?=
 =?iso-8859-1?Q?tH8snNFfT0/q55q46TZbKS1yIoQ3F4dPGww0uJjh1AXwV6AXNBuDEPJ/Bq?=
 =?iso-8859-1?Q?fUfmIPNHTSAHsmJrM+nq69xVpJEcfTDaQSUl5htEQZwo24qSRjy4ch9+VE?=
 =?iso-8859-1?Q?ST3+g7QBgKlW3Y+VN0RmHAswopNlEfjwKJi1WA8UoLSYuHGBgrtJA6JC26?=
 =?iso-8859-1?Q?eGIBU6sORPeka7e+fBTIgC7BnRObf8DgDaU35mZr1tpt5sYsEH+qpem7F6?=
 =?iso-8859-1?Q?P7B+5X+EoVuQX8X6VJgYtT7i/D+P66habIkaiZPDwvrvD77vnJe4iQuvUn?=
 =?iso-8859-1?Q?+EY48W70XrzdCb+FKOumfm2DOZrnZ0ZawZkyetDyPAb32zUct6h7D3Yoog?=
 =?iso-8859-1?Q?VPfUQCA19slDFFrpm/q8YvmpzMVpw1LsWcNmsnqbcN3RJwQI2aHoR8mFm5?=
 =?iso-8859-1?Q?vZVBSJzi67N5r4Qd86uJKmLxEezLfqYUtllqHDdqpACzrCxQlpOXczj3OB?=
 =?iso-8859-1?Q?FKnUVuqDt519yCFdPy3JQqGPjBSoQA0k77uJIYhP1l/JmMqmf8+Lp7kJn4?=
 =?iso-8859-1?Q?fT1BeVnofMKVpFBAALkePpOf29QgxjJMa/PNWi3/vlP2YAS11EsuqpXa89?=
 =?iso-8859-1?Q?s6zcBTnWGhOjNKjPgDRd/hgqbWMqdw3wYVpbj7xC9kBdazKUUjOu+YDEY2?=
 =?iso-8859-1?Q?vv5pnpob5+A6GHOMYe044QCR/d9VNO4u1MUZLBsn3Arpesn8NFNrN87M5F?=
 =?iso-8859-1?Q?HiCUsFIgEGfHS4wz4lyIKxxZqUrcspx5OlhTGWtAD4N+7VJx+TdnkRxXze?=
 =?iso-8859-1?Q?stMoYPbGxhPOQPCVDCYtSSPtk7PuG/4fXNiVk8+QG7KPWzgY+mIL+XF0hf?=
 =?iso-8859-1?Q?Yf5LTO32yManXZTrKnwRq4x/a5nOuil1mzgA/S3ZV25VlQ3c8pL0LbtNE2?=
 =?iso-8859-1?Q?/YajsHQ6WYqNlGZ/GPQthmbLIuG265xIMlX2s8f97J1Psw1F1GORv84Arn?=
 =?iso-8859-1?Q?EbL4EFh+kIm9No8K7EHxZk66ZE0MEd0MH35xJOu1LsFh+LnRGAwuVDxlv8?=
 =?iso-8859-1?Q?ibMfXQ0oLuHPSkW/xf7MlM/xlLE0GYpgyg2wKZOacgzEc8YStMaQh1/N1r?=
 =?iso-8859-1?Q?lOFi7Eyec4yhvZrZvkUz//CcOCQq07IwStO+2KOMrYFBrJqz/1LZOYgKSf?=
 =?iso-8859-1?Q?kdDGkUUTQ/zVtIiIkrwBsmIYGjNXYM6Y+HkDxEjz3240mQdFR46EGYAbFL?=
 =?iso-8859-1?Q?Td86vNZxEWcvlNlryY6Yyk+eTbC4gOxDgmhEBd0pC4cIYM7Gbyd07WSpWf?=
 =?iso-8859-1?Q?Z2iekjSMX5DM8fTWnUA3lBECHm/Rk1FSrdTZwz5/JeDF/0ow0ia6uLnaz7?=
 =?iso-8859-1?Q?J8EWsf27efUDplrN8fPPmc4sH9tjuRDN2tX0V5/m4XsuU5GUt9d/DMsCic?=
 =?iso-8859-1?Q?Muc2ycQnZIloPP1aQOXcTBvgVn6l9s+uO+SJjpntF4fEII+zwtlTwPYElc?=
 =?iso-8859-1?Q?JMeuyh8uqOVH9fO8KHL1kFA7Guo4g3CQME?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f035736-2d25-4cf1-8e48-08ddca70dfb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 05:13:49.4350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hVN0hBtwyH/OgODuXu4e+Zvy6ZatZaBSGrvEfm5CoxQCZebQ9Kq/dj7HbLE9KqgSnmViyAcDvBAlJGa/ycMqBYcrvoJYvVDIAmC8U3+2eLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6311
X-OriginatorOrg: intel.com
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

Hi Leon,

> Subject: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
> regions
>=20
> From: Leon Romanovsky <leonro@nvidia.com>
>=20
> Add support for exporting PCI device MMIO regions through dma-buf,
> enabling safe sharing of non-struct page memory with controlled
> lifetime management. This allows RDMA and other subsystems to import
> dma-buf FDs and build them into memory regions for PCI P2P operations.
>=20
> The implementation provides a revocable attachment mechanism using
> dma-buf move operations. MMIO regions are normally pinned as BARs
> don't change physical addresses, but access is revoked when the VFIO
> device is closed or a PCI reset is issued. This ensures kernel
> self-defense against potentially hostile userspace.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/Kconfig           |  20 ++
>  drivers/vfio/pci/Makefile          |   2 +
>  drivers/vfio/pci/vfio_pci_config.c |  22 +-
>  drivers/vfio/pci/vfio_pci_core.c   |  25 ++-
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 321 +++++++++++++++++++++++++++++
>  drivers/vfio/pci/vfio_pci_priv.h   |  23 +++
>  include/linux/dma-buf.h            |   1 +
>  include/linux/vfio_pci_core.h      |   3 +
>  include/uapi/linux/vfio.h          |  19 ++
>  9 files changed, 431 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c
>=20
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 2b0172f546652..55ae888bf26ae 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -55,6 +55,26 @@ config VFIO_PCI_ZDEV_KVM
>=20
>  	  To enable s390x KVM vfio-pci extensions, say Y.
>=20
> +config VFIO_PCI_DMABUF
> +	bool "VFIO PCI extensions for DMA-BUF"
> +	depends on VFIO_PCI_CORE
> +	depends on PCI_P2PDMA && DMA_SHARED_BUFFER
> +	default y
> +	help
> +	  Enable support for VFIO PCI extensions that allow exporting
> +	  device MMIO regions as DMA-BUFs for peer devices to access via
> +	  peer-to-peer (P2P) DMA.
> +
> +	  This feature enables a VFIO-managed PCI device to export a portion
> +	  of its MMIO BAR as a DMA-BUF file descriptor, which can be passed
> +	  to other userspace drivers or kernel subsystems capable of
> +	  initiating DMA to that region.
> +
> +	  Say Y here if you want to enable VFIO DMABUF-based MMIO export
> +	  support for peer-to-peer DMA use cases.
> +
> +	  If unsure, say N.
> +
>  source "drivers/vfio/pci/mlx5/Kconfig"
>=20
>  source "drivers/vfio/pci/hisilicon/Kconfig"
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index cf00c0a7e55c8..f9155e9c5f630 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -2,7 +2,9 @@
>=20
>  vfio-pci-core-y :=3D vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o
> vfio_pci_config.o
>  vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) +=3D vfio_pci_zdev.o
> +
>  obj-$(CONFIG_VFIO_PCI_CORE) +=3D vfio-pci-core.o
> +vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) +=3D vfio_pci_dmabuf.o
>=20
>  vfio-pci-y :=3D vfio_pci.o
>  vfio-pci-$(CONFIG_VFIO_PCI_IGD) +=3D vfio_pci_igd.o
> diff --git a/drivers/vfio/pci/vfio_pci_config.c
> b/drivers/vfio/pci/vfio_pci_config.c
> index 8f02f236b5b4b..7e23387a43b4d 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -589,10 +589,12 @@ static int vfio_basic_config_write(struct
> vfio_pci_core_device *vdev, int pos,
>  		virt_mem =3D !!(le16_to_cpu(*virt_cmd) &
> PCI_COMMAND_MEMORY);
>  		new_mem =3D !!(new_cmd & PCI_COMMAND_MEMORY);
>=20
> -		if (!new_mem)
> +		if (!new_mem) {
>  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -		else
> +			vfio_pci_dma_buf_move(vdev, true);
> +		} else {
>  			down_write(&vdev->memory_lock);
> +		}
>=20
>  		/*
>  		 * If the user is writing mem/io enable (new_mem/io) and we
> @@ -627,6 +629,8 @@ static int vfio_basic_config_write(struct
> vfio_pci_core_device *vdev, int pos,
>  		*virt_cmd &=3D cpu_to_le16(~mask);
>  		*virt_cmd |=3D cpu_to_le16(new_cmd & mask);
>=20
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
>  		up_write(&vdev->memory_lock);
>  	}
>=20
> @@ -707,12 +711,16 @@ static int __init init_pci_cap_basic_perm(struct
> perm_bits *perm)
>  static void vfio_lock_and_set_power_state(struct vfio_pci_core_device
> *vdev,
>  					  pci_power_t state)
>  {
> -	if (state >=3D PCI_D3hot)
> +	if (state >=3D PCI_D3hot) {
>  		vfio_pci_zap_and_down_write_memory_lock(vdev);
> -	else
> +		vfio_pci_dma_buf_move(vdev, true);
> +	} else {
>  		down_write(&vdev->memory_lock);
> +	}
>=20
>  	vfio_pci_set_power_state(vdev, state);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>  	up_write(&vdev->memory_lock);
>  }
>=20
> @@ -900,7 +908,10 @@ static int vfio_exp_config_write(struct
> vfio_pci_core_device *vdev, int pos,
>=20
>  		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
>  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> +			vfio_pci_dma_buf_move(vdev, true);
>  			pci_try_reset_function(vdev->pdev);
> +			if (__vfio_pci_memory_enabled(vdev))
> +				vfio_pci_dma_buf_move(vdev, true);
>  			up_write(&vdev->memory_lock);
>  		}
>  	}
> @@ -982,7 +993,10 @@ static int vfio_af_config_write(struct
> vfio_pci_core_device *vdev, int pos,
>=20
>  		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP))
> {
>  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> +			vfio_pci_dma_buf_move(vdev, true);
>  			pci_try_reset_function(vdev->pdev);
> +			if (__vfio_pci_memory_enabled(vdev))
> +				vfio_pci_dma_buf_move(vdev, true);
>  			up_write(&vdev->memory_lock);
>  		}
>  	}
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
> index 5512d13bb8899..e5ab5d1cafd9c 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -29,7 +29,9 @@
>  #include <linux/nospec.h>
>  #include <linux/sched/mm.h>
>  #include <linux/iommufd.h>
> +#ifdef CONFIG_VFIO_PCI_DMABUF
>  #include <linux/pci-p2pdma.h>
> +#endif
>  #if IS_ENABLED(CONFIG_EEH)
>  #include <asm/eeh.h>
>  #endif
> @@ -288,6 +290,8 @@ static int vfio_pci_runtime_pm_entry(struct
> vfio_pci_core_device *vdev,
>  	 * semaphore.
>  	 */
>  	vfio_pci_zap_and_down_write_memory_lock(vdev);
> +	vfio_pci_dma_buf_move(vdev, true);
> +
>  	if (vdev->pm_runtime_engaged) {
>  		up_write(&vdev->memory_lock);
>  		return -EINVAL;
> @@ -371,6 +375,8 @@ static void vfio_pci_runtime_pm_exit(struct
> vfio_pci_core_device *vdev)
>  	 */
>  	down_write(&vdev->memory_lock);
>  	__vfio_pci_runtime_pm_exit(vdev);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>  	up_write(&vdev->memory_lock);
>  }
>=20
> @@ -691,6 +697,8 @@ void vfio_pci_core_close_device(struct vfio_device
> *core_vdev)
>  #endif
>  	vfio_pci_core_disable(vdev);
>=20
> +	vfio_pci_dma_buf_cleanup(vdev);
> +
>  	mutex_lock(&vdev->igate);
>  	if (vdev->err_trigger) {
>  		eventfd_ctx_put(vdev->err_trigger);
> @@ -1223,7 +1231,10 @@ static int vfio_pci_ioctl_reset(struct
> vfio_pci_core_device *vdev,
>  	 */
>  	vfio_pci_set_power_state(vdev, PCI_D0);
>=20
> +	vfio_pci_dma_buf_move(vdev, true);
>  	ret =3D pci_try_reset_function(vdev->pdev);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>  	up_write(&vdev->memory_lock);
>=20
>  	return ret;
> @@ -1512,6 +1523,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device
> *device, u32 flags,
>  		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
>  	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
>  		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> +	case VFIO_DEVICE_FEATURE_DMA_BUF:
> +		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -2088,9 +2101,13 @@ int vfio_pci_core_init_dev(struct vfio_device
> *core_vdev)
>  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
>  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
>  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +#ifdef CONFIG_VFIO_PCI_DMABUF
>  	vdev->provider =3D pci_p2pdma_enable(vdev->pdev);
>  	if (IS_ERR(vdev->provider))
>  		return PTR_ERR(vdev->provider);
> +
> +	INIT_LIST_HEAD(&vdev->dmabufs);
> +#endif
>  	init_rwsem(&vdev->memory_lock);
>  	xa_init(&vdev->ctx);
>=20
> @@ -2473,11 +2490,17 @@ static int vfio_pci_dev_set_hot_reset(struct
> vfio_device_set *dev_set,
>  	 * cause the PCI config space reset without restoring the original
>  	 * state (saved locally in 'vdev->pm_save').
>  	 */
> -	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> +	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list) {
> +		vfio_pci_dma_buf_move(vdev, true);
>  		vfio_pci_set_power_state(vdev, PCI_D0);
> +	}
>=20
>  	ret =3D pci_reset_bus(pdev);
>=20
> +	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
> +
>  	vdev =3D list_last_entry(&dev_set->device_list,
>  			       struct vfio_pci_core_device, vdev.dev_set_list);
>=20
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c
> b/drivers/vfio/pci/vfio_pci_dmabuf.c
> new file mode 100644
> index 0000000000000..5fefcdecd1329
> --- /dev/null
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES.
> + */
> +#include <linux/dma-buf.h>
> +#include <linux/pci-p2pdma.h>
> +#include <linux/dma-resv.h>
> +
> +#include "vfio_pci_priv.h"
> +
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +struct vfio_pci_dma_buf {
> +	struct dma_buf *dmabuf;
> +	struct vfio_pci_core_device *vdev;
> +	struct list_head dmabufs_elm;
> +	struct phys_vec phys_vec;
> +	u8 revoked : 1;
> +};
> +
> +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attachment)
> +{
> +	struct vfio_pci_dma_buf *priv =3D dmabuf->priv;
> +
> +	if (!attachment->peer2peer)
> +		return -EOPNOTSUPP;
> +
> +	if (priv->revoked)
> +		return -ENODEV;
> +
> +	switch (pci_p2pdma_map_type(priv->vdev->provider, attachment-
> >dev)) {
> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> +		break;
> +	case PCI_P2PDMA_MAP_BUS_ADDR:
> +		/*
> +		 * There is no need in IOVA at all for this flow.
> +		 * We rely on attachment->priv =3D=3D NULL as a marker
> +		 * for this mode.
> +		 */
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	attachment->priv =3D kzalloc(sizeof(struct dma_iova_state),
> GFP_KERNEL);
> +	if (!attachment->priv)
> +		return -ENOMEM;
> +
> +	dma_iova_try_alloc(attachment->dev, attachment->priv, 0, priv-
> >phys_vec.len);
> +	return 0;
> +}
> +
> +static void vfio_pci_dma_buf_detach(struct dma_buf *dmabuf,
> +				    struct dma_buf_attachment *attachment)
> +{
> +	kfree(attachment->priv);
> +}
> +
> +static void fill_sg_entry(struct scatterlist *sgl, unsigned int length,
> +			 dma_addr_t addr)
> +{
> +	sg_set_page(sgl, NULL, length, 0);
> +	sg_dma_address(sgl) =3D addr;
> +	sg_dma_len(sgl) =3D length;
> +}
> +
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv =3D attachment->dmabuf->priv;
> +	struct p2pdma_provider *provider =3D priv->vdev->provider;
> +	struct dma_iova_state *state =3D attachment->priv;
> +	struct phys_vec *phys_vec =3D &priv->phys_vec;
> +	struct scatterlist *sgl;
> +	struct sg_table *sgt;
> +	dma_addr_t addr;
> +	int ret;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL | __GFP_ZERO);
> +	if (ret)
> +		goto err_kfree_sgt;
> +
> +	sgl =3D sgt->sgl;
> +
> +	if (!state) {
> +		addr =3D pci_p2pdma_bus_addr_map(provider, phys_vec-
> >paddr);
> +	} else if (dma_use_iova(state)) {
> +		ret =3D dma_iova_link(attachment->dev, state, phys_vec->paddr,
> 0,
> +				    phys_vec->len, dir,
> DMA_ATTR_SKIP_CPU_SYNC);
> +		if (ret)
> +			goto err_free_table;
> +
> +		ret =3D dma_iova_sync(attachment->dev, state, 0, phys_vec-
> >len);
> +		if (ret)
> +			goto err_unmap_dma;
> +
> +		addr =3D state->addr;
> +	} else {
> +		addr =3D dma_map_phys(attachment->dev, phys_vec->paddr,
> +				    phys_vec->len, dir,
> DMA_ATTR_SKIP_CPU_SYNC);
> +		ret =3D dma_mapping_error(attachment->dev, addr);
> +		if (ret)
> +			goto err_free_table;
> +	}
> +
> +	fill_sg_entry(sgl, phys_vec->len, addr);
> +	return sgt;
> +
> +err_unmap_dma:
> +	dma_iova_destroy(attachment->dev, state, phys_vec->len, dir,
> +			 DMA_ATTR_SKIP_CPU_SYNC);
> +err_free_table:
> +	sg_free_table(sgt);
> +err_kfree_sgt:
> +	kfree(sgt);
> +	return ERR_PTR(ret);
> +}
> +
> +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment
> *attachment,
> +				   struct sg_table *sgt,
> +				   enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv =3D attachment->dmabuf->priv;
> +	struct dma_iova_state *state =3D attachment->priv;
> +	struct scatterlist *sgl;
> +	int i;
> +
> +	if (!state)
> +		; /* Do nothing */
> +	else if (dma_use_iova(state))
> +		dma_iova_destroy(attachment->dev, state, priv->phys_vec.len,
> +				 dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	else
> +		for_each_sgtable_dma_sg(sgt, sgl, i)
> +			dma_unmap_phys(attachment->dev,
> sg_dma_address(sgl),
> +				       sg_dma_len(sgl), dir,
> +				       DMA_ATTR_SKIP_CPU_SYNC);
> +
> +	sg_free_table(sgt);
> +	kfree(sgt);
> +}
> +
> +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct vfio_pci_dma_buf *priv =3D dmabuf->priv;
> +
> +	/*
> +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> +	 * The refcount prevents both.
> +	 */
> +	if (priv->vdev) {
> +		down_write(&priv->vdev->memory_lock);
> +		list_del_init(&priv->dmabufs_elm);
> +		up_write(&priv->vdev->memory_lock);
> +		vfio_device_put_registration(&priv->vdev->vdev);
> +	}
> +	kfree(priv);
> +}
> +
> +static const struct dma_buf_ops vfio_pci_dmabuf_ops =3D {
> +	.attach =3D vfio_pci_dma_buf_attach,
> +	.detach =3D vfio_pci_dma_buf_detach,
> +	.map_dma_buf =3D vfio_pci_dma_buf_map,
> +	.release =3D vfio_pci_dma_buf_release,
> +	.unmap_dma_buf =3D vfio_pci_dma_buf_unmap,
> +};
> +
> +static void dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
> +				   struct vfio_device_feature_dma_buf
> *dma_buf)
> +{
> +	struct pci_dev *pdev =3D priv->vdev->pdev;
> +
> +	priv->phys_vec.len =3D dma_buf->length;
> +	priv->phys_vec.paddr =3D pci_resource_start(pdev, dma_buf-
> >region_index);
> +	priv->phys_vec.paddr +=3D dma_buf->offset;
> +}
> +
> +static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
> +				 struct vfio_device_feature_dma_buf *dma_buf)
> +{
> +	struct pci_dev *pdev =3D vdev->pdev;
> +	u32 bar =3D dma_buf->region_index;
> +	u64 offset =3D dma_buf->offset;
> +	u64 len =3D dma_buf->length;
> +	resource_size_t bar_size;
> +	u64 sum;
> +
> +	/*
> +	 * For PCI the region_index is the BAR number like  everything else.
> +	 */
> +	if (bar >=3D VFIO_PCI_ROM_REGION_INDEX)
> +		return -ENODEV;
> +
> +	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> +		return -EINVAL;
> +
> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> +		return -EINVAL;
> +
> +	bar_size =3D pci_resource_len(pdev, bar);
> +	if (check_add_overflow(offset, len, &sum) || sum > bar_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32
> flags,
> +				  struct vfio_device_feature_dma_buf __user
> *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf =3D {};
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vfio_pci_dma_buf *priv;
> +	int ret;
> +
> +	ret =3D vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +				 sizeof(get_dma_buf));
> +	if (ret !=3D 1)
> +		return ret;
> +
> +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +		return -EFAULT;
> +
> +	ret =3D validate_dmabuf_input(vdev, &get_dma_buf);
> +	if (ret)
> +		return ret;
> +
> +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->vdev =3D vdev;
> +	dma_ranges_to_p2p_phys(priv, &get_dma_buf);
> +
> +	if (!vfio_device_try_get_registration(&vdev->vdev)) {
> +		ret =3D -ENODEV;
> +		goto err_free_priv;
> +	}
> +
> +	exp_info.ops =3D &vfio_pci_dmabuf_ops;
> +	exp_info.size =3D priv->phys_vec.len;
> +	exp_info.flags =3D get_dma_buf.open_flags;
> +	exp_info.priv =3D priv;
> +
> +	priv->dmabuf =3D dma_buf_export(&exp_info);
> +	if (IS_ERR(priv->dmabuf)) {
> +		ret =3D PTR_ERR(priv->dmabuf);
> +		goto err_dev_put;
> +	}
> +
> +	/* dma_buf_put() now frees priv */
> +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> +	down_write(&vdev->memory_lock);
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	priv->revoked =3D !__vfio_pci_memory_enabled(vdev);
> +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> +	dma_resv_unlock(priv->dmabuf->resv);
> +	up_write(&vdev->memory_lock);
> +
> +	/*
> +	 * dma_buf_fd() consumes the reference, when the file closes the
> dmabuf
> +	 * will be released.
> +	 */
> +	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> +
> +err_dev_put:
> +	vfio_device_put_registration(&vdev->vdev);
> +err_free_priv:
> +	kfree(priv);
> +	return ret;
> +}
> +
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool
> revoked)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	lockdep_assert_held_write(&vdev->memory_lock);
> +
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!get_file_active(&priv->dmabuf->file))
> +			continue;
> +
> +		if (priv->revoked !=3D revoked) {
> +			dma_resv_lock(priv->dmabuf->resv, NULL);
> +			priv->revoked =3D revoked;
> +			dma_buf_move_notify(priv->dmabuf);
> +			dma_resv_unlock(priv->dmabuf->resv);
> +		}
> +		dma_buf_put(priv->dmabuf);
> +	}
> +}
> +
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	down_write(&vdev->memory_lock);
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!get_file_active(&priv->dmabuf->file))
> +			continue;
> +
> +		dma_resv_lock(priv->dmabuf->resv, NULL);
> +		list_del_init(&priv->dmabufs_elm);
> +		priv->vdev =3D NULL;
> +		priv->revoked =3D true;
> +		dma_buf_move_notify(priv->dmabuf);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		vfio_device_put_registration(&vdev->vdev);
> +		dma_buf_put(priv->dmabuf);
> +	}
> +	up_write(&vdev->memory_lock);
> +}
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci=
_priv.h
> index a9972eacb2936..28a405f8b97c9 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -107,4 +107,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev
> *pdev)
>  	return (pdev->class >> 8) =3D=3D PCI_CLASS_DISPLAY_VGA;
>  }
>=20
> +#ifdef CONFIG_VFIO_PCI_DMABUF
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32
> flags,
> +				  struct vfio_device_feature_dma_buf __user
> *arg,
> +				  size_t argsz);
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool
> revoked);
> +#else
> +static inline int
> +vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32
> flags,
> +			      struct vfio_device_feature_dma_buf __user *arg,
> +			      size_t argsz)
> +{
> +	return -ENOTTY;
> +}
> +static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device
> *vdev)
> +{
> +}
> +static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device
> *vdev,
> +					 bool revoked)
> +{
> +}
> +#endif
> +
>  #endif
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e71..f14b413aae48d 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -483,6 +483,7 @@ struct dma_buf_attach_ops {
>   * @dev: device attached to the buffer.
>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the
> dmabuf.
>   * @peer2peer: true if the importer can handle peer resources without pa=
ges.
> + * #state: DMA structure to provide support for physical addresses DMA
> interface
>   * @priv: exporter specific attachment data.
>   * @importer_ops: importer operations for this attachment, if provided
>   * dma_buf_map/unmap_attachment() must be called with the dma_resv
> lock held.
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.=
h
> index b017fae251811..548cbb51bf146 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -94,7 +94,10 @@ struct vfio_pci_core_device {
>  	struct vfio_pci_core_device	*sriov_pf_core_dev;
>  	struct notifier_block	nb;
>  	struct rw_semaphore	memory_lock;
> +#ifdef CONFIG_VFIO_PCI_DMABUF
>  	struct p2pdma_provider  *provider;
> +	struct list_head	dmabufs;
> +#endif
>  };
>=20
>  /* Will be exported for vfio pci drivers usage */
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 5764f315137f9..ad8e303697f97 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1468,6 +1468,25 @@ struct vfio_device_feature_bus_master {
>  };
>  #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
>=20
> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * regions selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR,
> O_CLOEXEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf=
 from.
> + * nr_ranges is the total number of (P2P DMA) ranges that comprise the
> dmabuf.
Any particular reason why you dropped the option (nr_ranges) of creating a
single dmabuf from multiple ranges of an MMIO region?

Restricting the dmabuf to a single range (or having to create multiple dmab=
ufs
to represent multiple regions/ranges associated with a single scattered buf=
fer)
would be very limiting and may not work in all cases. For instance, in my u=
se-case,
I am trying to share a large (4k mode) framebuffer (FB) located in GPU's VR=
AM
between two (p2p compatible) GPU devices. And, this would probably not work
given that allocating a large contiguous FB (nr_ranges =3D 1) in VRAM may n=
ot be
feasible when there is memory pressure.

Furthermore, since you are adding a new UAPI with this patch/feature, as yo=
u know,
we cannot go back and tweak it (to add support for nr_ranges > 1) should th=
ere
be a need in the future, but you can always use nr_ranges =3D 1 anytime. Th=
erefore,
I think it makes sense to be flexible in terms of the number of ranges to i=
nclude
while creating a dmabuf instead of restricting ourselves to one range.

Thanks,
Vivek

> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> +
> +struct vfio_device_feature_dma_buf {
> +	__u32	region_index;
> +	__u32	open_flags;
> +	__u64	offset;
> +	__u64	length;
> +};
> +
>  /* -------- API for Type1 VFIO IOMMU -------- */
>=20
>  /**
> --
> 2.50.1

