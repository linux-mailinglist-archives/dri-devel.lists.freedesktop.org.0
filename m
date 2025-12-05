Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C2CA84C5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 17:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D75410EB65;
	Fri,  5 Dec 2025 16:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwlDdCWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6710EB65
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764950531; x=1796486531;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SKz9F227akLlPRtfykv/jTEIColG1QOPkKa+1L4N7vk=;
 b=hwlDdCWqAE07WfqlcLKTzkPQTLmXqk0mW2SoPXKPdp5jCSZJY2bwhHkN
 5v3TadgG0DJ9zwmqe9KqY2we9rxRbJsePWgi486ywAkQEIgfK6SE+hCF3
 HR6rwK/2kTcy2N0pXS/TdN2d9AFdo9ntpFk5gKv59ljEL1IvSGiaZtqXf
 bT6/Su5+WkhhK6PYJMgU/4q1n9ONiyvjOUz3CBt8pXXLNkeCwHneugZwV
 ZuKf0i4kjqPiJGUX5xZ8tExx3EeD+TK3kyav7Nty+6Xk9x4DpskIGSbtw
 jYg/ihvb7DBzbK6XzYJ9APEZyJTAprBBKjS7DVPhJ2lE0IIGhRn/SLhrT Q==;
X-CSE-ConnectionGUID: spEB60aIQiWRIidq5KCA2Q==
X-CSE-MsgGUID: NBaJgtoRSIuzX46Z782GJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="54532297"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="54532297"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:02:11 -0800
X-CSE-ConnectionGUID: B7+KcqDNSQSZMxSUgBbQQA==
X-CSE-MsgGUID: DdbzoNUBSDiTiTUokM0UUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195770402"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:02:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:02:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 08:02:10 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toZ8No1vBSpcSCZL1sktRT7z4RE7Q8Tu007ducJvc4s+rF8+CUxb4MwTS0eEPckTbHhoom/uydAF9OfoCp6kYAtDA3bKiJeE8VExeVB+md40b5o9zQAAzBVwGolBZvySw0dcv/rZBXxUmB8NZGUqp6w2fPN8yQ8NzotQ1Li38a9E5ayveWERVU5YODB4qo4zhtpuUHSRQnTk+XJ1LVGCq+bH1YOj0kvKeIs8NuOjy+wn17q8go5xD5xySWmTe84T92tUcBJcgMjjhXCFEifuxJg2KSWkEYWcxLqanjFkvh+uOTZWpcXc6/KSE2K33xijfZb1I9dnQW0DLFmJnYw3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJOvczaFiS6xFtiKCrzWC0hSke1tg0wO63rZnmvy+fo=;
 b=xIa7kmuht6m1miVx2ALv1MPsdmHYEOfJsg44ExUXH1skTxeFlCAav2LVuc56i9Iz90CLC4s9jmZFpSgOTos67aqjNFh9JQXs63mFgHTgGq/y/7JSJL19eic5DAfE4dJtH5bBgtB4whNqAvNJDwFszxflAHAyENjshfoHdNRYeDyvx44ZcRQA7LahemVVnMCs+jf3K04gRLqxuB7Td7NflqhcbSmA5Z7GaGa3ldeDFaWcl4OEHcuQVmDn81JHuckGuOx303uyHMtCufpoO4hjtuD7pKzbOTquaZc6UlAqwWbMZD0I1+mQ8CN6l6aBs0gVEp9s++vmbj9quyug0B5Nsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 16:02:07 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 16:02:06 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "simona.vetter@ffwll.ch"
 <simona.vetter@ffwll.ch>
Subject: RE: [PATCH 2/2] dma-buf: enable DMABUF_DEBUG by default on DEBUG
 kernels
Thread-Topic: [PATCH 2/2] dma-buf: enable DMABUF_DEBUG by default on DEBUG
 kernels
Thread-Index: AQHcZefyT6Aw58I86kKkH5YwzAPjyrUTIqxA
Date: Fri, 5 Dec 2025 16:02:06 +0000
Message-ID: <IA1PR11MB64188836F41D08DDF63ECD9AC1A7A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20251205130604.1582-1-christian.koenig@amd.com>
 <20251205130604.1582-2-christian.koenig@amd.com>
In-Reply-To: <20251205130604.1582-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA4PR11MB9057:EE_
x-ms-office365-filtering-correlation-id: b6b0d07f-7727-4ee4-6108-08de3417a347
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?JQQ5gx2myQbnuqsWUHZ8Z/ck5m001o7XoJDidLb2bdrIF8745yb7ZSUuSp?=
 =?iso-8859-1?Q?8HdBsSPA0QUpWwagSKQpUvMKCHoupl3Jcyd/mEoKMP5MMeToWqY3hCJ6wp?=
 =?iso-8859-1?Q?Z0No3oVNmP3bXz0z2TFWgJHgJOSmhZ0J4SjIldcve5Dr1FbgEYk0fs9y1i?=
 =?iso-8859-1?Q?QKirmWALVtK75RamB+J1c5TXpDvJDvKOJleOo4tovQqBO7ie8K4ObJ2Lbf?=
 =?iso-8859-1?Q?LeIfCx26tePplyOEefSKwONd84u4j1O+mtQnbkjJXhND4RaqBwfnPs7YSd?=
 =?iso-8859-1?Q?XoBlLrxSSGQ7NfNrZeoksGwu9gmyETR2LuyN7tWzzqM28M6CfKKvTRkNXO?=
 =?iso-8859-1?Q?XPlamYDYqlHwToFhgFZ8icxJkKaI7Er4bGpL2eJD2/V0m/nGg3t5QWj7hF?=
 =?iso-8859-1?Q?Mpkcy2+zkWdCozp4EJQyZuCHKc77HiSa0xEflxQpCuGl9XMy6D8e+IF67k?=
 =?iso-8859-1?Q?qzTRMRD4KpfrtA4kcOKilbuSl9VQA5gQLVCGaoytwynlt7l4U0T6uBrbjB?=
 =?iso-8859-1?Q?cZNPC2sXRLiucJvVqnULKAii5hMTiD+IdVRrMDVitdKUV7ewdcCjI1p113?=
 =?iso-8859-1?Q?EJa2e80ldEw8ANuyeF9XWbnUbxDuo4iPuWxkOWyOGu4fNkPzM6S/m+OcQf?=
 =?iso-8859-1?Q?8r1q4Ov5Fqvp8VN8LwVoblMDf1oXYzcHNKAVHHbngQVlLGxmXSQdBMRIeT?=
 =?iso-8859-1?Q?mEgoO8XHUTsAEwRbyJODSFsz/nse+4GFSb2BC5ee0RxRlJPvgGaiEa6PZl?=
 =?iso-8859-1?Q?lclfxXSwq+GNi6U4zZEl3kmWBsp2lpQaP9mCgZJcRIcqgiIlY6oPbg6Ekc?=
 =?iso-8859-1?Q?xrTek6TpUSmM/2BEIxY9zfUmrv+Qj3fYztF60jpmwj5gc8XX22MCHJW2nl?=
 =?iso-8859-1?Q?MesDIuqw7fYUUmjAiGfUyyNPizMGFJfQ2A0D69hFhhRsaHypGZdIahGGs0?=
 =?iso-8859-1?Q?EOkaUyY8CXxseKu0QBFQjHxf78xqomh1G1Gwmafvb2vkuNeCXy1XHWZuTZ?=
 =?iso-8859-1?Q?QV0MzyXSsV0At4SibXqYTnnY7qRXieTLaBxkcGCrDKJNffRxx16FNE1KvX?=
 =?iso-8859-1?Q?+AzgT6mpvFr7bbmz7k/vRYGte7VurN3jb6udlIsS858VE/x4+KoJvdmwYP?=
 =?iso-8859-1?Q?6UVI3JoLWIyJnRsS7q5sDkUZX+dt4K/a1YQRWswbBWqfvm5z7h8T+IBg9a?=
 =?iso-8859-1?Q?M10FhOMI1uGrI7TXx7xIcPzn95ylOBNwKcRBklmpMC8FQHHlwjBOMKJN/y?=
 =?iso-8859-1?Q?3z5drpFgI/6xxll2yCOYuelgqNtWP12ZiZjmQz49a3MQpex9Ww87sj54GD?=
 =?iso-8859-1?Q?Qz8CACMyOnr9EaNIUm9CbBpY//XOftv1ISmDfDg1LnTjyuvS2HvvTQIbqU?=
 =?iso-8859-1?Q?PjtUzXZ/6NKWgZ1bBz/HyA55vrLGiAs64WaptLNZgxZQchYvBN+FvcGKVG?=
 =?iso-8859-1?Q?VeHPRY6PbBk5JkA7Plhw0g+cW9oploMjzMjHOa/v8pIuYKw4rT0+Z3L5Wo?=
 =?iso-8859-1?Q?e+8ukZzRvRQdRkIQb6uerzoQ+Odi0c2bKjjcj4DFyntLpZjk6f2QHbY+zL?=
 =?iso-8859-1?Q?GXXm5f3ihkVG+XFZ+hiCUXsec9L9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xI3QQwMq5F6UZjq+CjEqhXILQrEmHKCN+/e58xhkJ/SPN4EnDqEpF7WAJq?=
 =?iso-8859-1?Q?ZhxqxFDMkLURyTM0kY6A4xc+l/ug/dtMgk28RMa8fTtVzGYGhj7xpu3+LW?=
 =?iso-8859-1?Q?sikgZD3RURS08p+9YTlNjcP5EAEZwmR2m2ykNADmOdZQnFSQGQEH+DwZLG?=
 =?iso-8859-1?Q?izkraZNid6pDcJGhX7dmf8T4rxZwvh4/Oli15tJAlF4Q7nq2w9ZPUbK9r9?=
 =?iso-8859-1?Q?AwJvIfUCoEgBxRgH71PGmMzUdID6jf0iWh7u9rwGyfFyyaoNk6fURgd8Qv?=
 =?iso-8859-1?Q?Bmto4I1Dd6NncfxdJqQAClI8UyDFn6ZqkcBE9D0+GJAQeLTyYDt0tEt2J0?=
 =?iso-8859-1?Q?u4WyjzTYSUY6zQzGa2tp9FWmZKoox8peffMDNzKQaDeertmXK/tJfLO6pU?=
 =?iso-8859-1?Q?VS8E4sy4cEv9WYKcB5h3M/kxIYUM70RgPMjenlvjO2T2gI3gQmLi/BUgv+?=
 =?iso-8859-1?Q?qnVWI54pEEr/Hs9gF/aQpcrcjfZnBeCLYY/35p68SzVEPOOWA3l2m0708a?=
 =?iso-8859-1?Q?T0mgvgMO9LAN7gMKTxm9XQbOBbt9zHYbK8hDMYvzl0SKwIfleWLUgW4Gzv?=
 =?iso-8859-1?Q?Xfn6c4NmGmK0ZYjOkVOwKLDKRxS73gdlVJKlrNwcIo82j+J+9qo5bXJ6TU?=
 =?iso-8859-1?Q?1nxzw4J+uMej45Ka6RMwVebua7BC5mlKxkIJpaC5GZ66PB/S3mcUgn30Oo?=
 =?iso-8859-1?Q?v31Btg6BvY13/5w57VX4eihsnxLHS8TgOmi+p195KpoJsjHAJI97XN6z58?=
 =?iso-8859-1?Q?KerqQSULSHMt7E36b+PoWYCYEih1S90VKC0WGxxk+r/ksym5enqTnZy+iL?=
 =?iso-8859-1?Q?K0yYMhC6/vYYDFzf4DCe5uZRb59KXRoAI6hgJkjWNwbw9ds1q7RJEoDT+A?=
 =?iso-8859-1?Q?PHcFBI0ZjZKBkHFEG70pMScQrIQV9N1Mvxtl2FQzcHJCuMXbDTXIxd91WO?=
 =?iso-8859-1?Q?XXY80suvPbh0FjpFyMqc9ghlLow10cs0LkpP+rypD1PyLYwtE3KiJQ+GCA?=
 =?iso-8859-1?Q?p+reWeWTFfFuVbvxUW8Tt010HNTp5I5S+I5qseuNSN6Td+hHqSYmMz5net?=
 =?iso-8859-1?Q?YREX9U9xSrHd9hb8aGO8bflvY6Vx2YEtVH/fwISUkwGqvWkbbRVqMZDTo3?=
 =?iso-8859-1?Q?2QJlreJ8ltXh7SlrUU69NhTY/Edw2sjECZGgP7XdeQKOXkM0ipxx9paaDX?=
 =?iso-8859-1?Q?4j8YFJx3SdIt2XwCPr7hOGd50pXVp/hvlT/EeklsIB/REzaGJ5DED1YYi+?=
 =?iso-8859-1?Q?sBDaHfyt9CCAyta99ljYJ93a+NtzeCUhxZsEKz2IvnhcgbLxbfRhgi87SC?=
 =?iso-8859-1?Q?VrPvRNZoZOqgAqcD2V/9LgD/DcJ5wrQYxYg2pC9BAzgLh21OM+cis/oc/w?=
 =?iso-8859-1?Q?Cw3wsz3mw0Qce5Tp6tJKTa6AY/XUju6p0dnQCiNEW7v9MFseA9d+HEK+nP?=
 =?iso-8859-1?Q?brE6w/oLu7VxnHJ+ZKKR5i2cUhQBCN7LqT2UGX3TEBi96avYtJNFYqRD+q?=
 =?iso-8859-1?Q?Ee1w54WweabJHaiSkp++4J1D6gLIoLs8odOLFsPFADAll8yu1jw+v+Jh5I?=
 =?iso-8859-1?Q?6qUFenabH67jEHZjq5GUmEgqwQ9fFUL76PkagYk2VYkVX40XFWsACLhloa?=
 =?iso-8859-1?Q?rb5weRuxj93Ffi93q8vuJb7Xpu4sThSWX2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b0d07f-7727-4ee4-6108-08de3417a347
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 16:02:06.1259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sELZogEvlizJdEyGQIcauZ23vz6O07IPS1L9lOOMd1b1iXRy3R3lOqdIJBW+i5DAnfVrciQKtQO0JnMXMF062xiwjGZKcWpdeg8rBq5VLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
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

>-----Original Message-----
>From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
>Sent: Friday, December 5, 2025 8:06 AM
>To: Auld, Matthew <matthew.auld@intel.com>; linux-media@vger.kernel.org;
>dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org;
>simona.vetter@ffwll.ch; Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [PATCH 2/2] dma-buf: enable DMABUF_DEBUG by default on DEBUG
>kernels
>
>The overhead of enforcing the DMA-buf rules for importers is now so low
>that it save to enable it by default on DEBUG kernels.

s/save/safe/?

With that fix:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

m

>This will hopefully result in fixing more issues in importers.
>
>Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
>---
> drivers/dma-buf/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>index b46eb8a552d7..fdd823e446cc 100644
>--- a/drivers/dma-buf/Kconfig
>+++ b/drivers/dma-buf/Kconfig
>@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
> config DMABUF_DEBUG
> 	bool "DMA-BUF debug checks"
> 	depends on DMA_SHARED_BUFFER
>-	default y if DMA_API_DEBUG
>+	default y if DEBUG
> 	help
> 	  This option enables additional checks for DMA-BUF importers and
> 	  exporters. Specifically it validates that importers do not peek at the
>--
>2.43.0

