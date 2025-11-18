Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E9C6C0E8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 00:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1EA10E00D;
	Tue, 18 Nov 2025 23:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3+vpR43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F89210E00D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763510180; x=1795046180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c0n17xVOHyFQBRWKN/aSsNKZ4YWkhz3J71Xq0bnXXEM=;
 b=g3+vpR43CVJlMYuGdoaC8tkTIkk4FtuJZe/aiKJKudkm/2dbfDJhl4xD
 rtA9VrSP5qMiIT7amY/QsMMmd/Zm8MO5m7Mf9IpjEtc8IGcf+atVZ/gQI
 XuVEta7nz24T6q12jWwZGyYQpnPRJLONKHjFkzOp9seBFIjBIDxJ6mQnD
 w4ISW+cfMopCQNl9ZwWGQEjEnpcQPec2qrrSt4ADnjRBzCM/RxTTfo/7I
 WbCLcqTOEzO20W4wBupxiSRFBMWuIcsNopRax1YmHMy6D4MjNqdFc6f7y
 i/C5WHDfY1yRItuTg4hHd3srFipa2iloUPMc8nVoXOe04l1wAc+aKqz/F Q==;
X-CSE-ConnectionGUID: jSYENef8RXSIM5VkmDnmoQ==
X-CSE-MsgGUID: YVBIeDLJQruG+s/3HYaoFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="91020739"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="91020739"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 15:56:19 -0800
X-CSE-ConnectionGUID: bKuvKGK0TLeL3ytr366xZA==
X-CSE-MsgGUID: vNuxDQ4BTfaWqS9OFRb0SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191029253"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 15:56:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 15:56:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 15:56:18 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 15:56:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O86nubght9a/3pe0J/Eh9T8DFnex9p2+PxukW652246J7KlxUh8kWNMgto3sKWskNx700avTuHs9o2tv/3hV/xTz2c6bpBGn6WiOK/worTA4+TP+V2CsfgzFyfw8+pd35v4ZpPuG3Sm5URqEJsERuYzO85pY1O6Os98pCpkrCOkgBHGLUtf8uiYekbB28nmfi1iRUQhlm52I6q/AV+hSsEuAtJ19vlPaVqxkraMfoZH1x01Z/o4Y9QxW3ORDZ3gq0V5OKI9cFVRZ6QSHNRIY5k79TqFSXqU1tMEcCtbYph6JTMDq+5d8sUd3QLOiFTM+gZ7/PS4yv+3VAKzpcr93ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq61xRYuZ3+RGUxWQJiZuRXpaSbCqY3wHUVLXy7blqs=;
 b=EnV39yXJwfM80bLOrSscal3iaESe/ySjwUH0xT/2J/e+Zgvmr/8rW3v+oWkLcTBGjKR6YX4gGqHomQSvebG/6cLc0ar3+A3UOJ96NXlLObGN/Ae/d7gFSHkmmO9x251wGWQSPgy/WpteZcvW8pnvzHV89DkjVkN9xyg9Z1Egm85cdcfVTmiPswkUBlom8lq5r/kVHt5Oun73hcBMnB3N7uBKESUdwYMxmauZ7vZnSa26vOmJRTMArAeW/+ztgBzazvtXM6cK0qjH1w4H6fnK4w9zHe1v+C/DNugkQU1iGattAemCjQEr//biqu3T/jgL+4IvaRdMFuevggDa+myC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH3PPFF2B8F6C64.namprd11.prod.outlook.com (2603:10b6:518:1::d60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 23:56:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 23:56:15 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, "Yishai
 Hadas" <yishaih@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>, Alex
 Williamson <alex@shazbot.org>, Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs
 <mochs@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
Subject: RE: [PATCH v8 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Topic: [PATCH v8 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Index: AQHcUvHJUsSz328bbEaizAQHYSZo87T4ET6ggAB4LYCAAJvxAA==
Date: Tue, 18 Nov 2025 23:56:14 +0000
Message-ID: <BN9PR11MB5276EF47D26AB55B2CD456EE8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-10-fd9aa5df478f@nvidia.com>
 <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251118142849.GG17968@ziepe.ca>
In-Reply-To: <20251118142849.GG17968@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH3PPFF2B8F6C64:EE_
x-ms-office365-filtering-correlation-id: 92e33f49-54d1-4391-b96b-08de26fe0efd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?4e12kQ8YGI8p7YEpca/Olq4xZsw9pUMXW1+c2ylx4kKOZa+3UM++hkhJK6?=
 =?iso-8859-1?Q?tKH8qRiu+4pLrP/CFLaYwL/ST/kuFpU+N5uzrN5GPr8qU/jbEfbZ3VjQCM?=
 =?iso-8859-1?Q?rxG5T1yPUmtbn/8e6LP7r6Ez0+hq5iVdSiS7bmJHWH7ThQ9RUjv14pwVvF?=
 =?iso-8859-1?Q?a1USt3kZsCFZ3Ez4vihz5nRrPBSI2ejGgWBo7uYnRKvW3yUWpKXZa1WqZf?=
 =?iso-8859-1?Q?DDacMokOOTR8uW6eu8TW566ZCRwtmskErw6HdxRT68Cr049gVKWES57v5P?=
 =?iso-8859-1?Q?wI5Qz4Hopw2/AAEwMld6el73H0/bT8Z0rat/7rUjifww7jUezUgdccc7+2?=
 =?iso-8859-1?Q?2w2eU/CTK0YYnJtFv4W/URAwZNjKyYZjjuqxDuMJkOUD/t/yogwutyTC6n?=
 =?iso-8859-1?Q?Dh76B7gkkQOVpQyAL5vZCJJwjt1dojGgb14dIf276+0rYEMt8LdwxpDqeC?=
 =?iso-8859-1?Q?BKEKLwvUDUGOZfAwV6hMUuwgXIT8iveTSoqPZvtEdNvV2LR+C1Mrz/EEpD?=
 =?iso-8859-1?Q?54UM7nfVsPFXXRV/DI4pGwZp3AKeJC7xQ2tr3WfS+42cqwuEphXNC1mb6S?=
 =?iso-8859-1?Q?Srbl8H/CKHeugZ+obyGqPsWgMuAR8DMdwj/kxr8l15ScikcftCHNy7fWlP?=
 =?iso-8859-1?Q?qOy+1HAx+Vcmvs+pJHKTJutzE7oqQyXTMMCFWCEX9UxqJMKanMVlUmJsj4?=
 =?iso-8859-1?Q?ipz65Hg/nw3/+dbq5scUzJjZpu7t9JqiqfSw7jIUON9Jxa47bBlzwrgGyt?=
 =?iso-8859-1?Q?MR2X49JTxUkprkGluHlAIqUM4IsIk/4lBHcxwXGBG2axeATpC+Iahh/dYE?=
 =?iso-8859-1?Q?O75+5tGMq+jUEG5fnpbk2SmpJ53jpAIiSIRbte16fcviuXuHslJyfGtKAj?=
 =?iso-8859-1?Q?ruGBJCElHl+AQ317sN8iuRKoCuzS8TIG32Wte6jJru8EMUKxXBTjXwnjRa?=
 =?iso-8859-1?Q?dnWC747TJCYRnK++Ny8Wwg4KhomAVd73VIDEZGszzixUbnunqKzU8Hapm0?=
 =?iso-8859-1?Q?LX2U7E3/KLBpvuSW8iqdF9kZDiCSW207qFtRrBKnlea+U6xwbBGIyK6UPr?=
 =?iso-8859-1?Q?C9d4qyE5SuBgOgbZiVlG4LlfBV0Hg38v7/2YymZ8MpgklgMD7mVTF1FSLe?=
 =?iso-8859-1?Q?qfyjUStfwRVctlR2P5B1aTUMlfOFug57vSzIzjAdsQg0F/6h5H6HWUB0rB?=
 =?iso-8859-1?Q?M0UIjIiibeKsFaIFn0x5DnTWczHhw12Jwc9nQtIbsT2D3bVWe969pveORD?=
 =?iso-8859-1?Q?7ouWUcCKU7pM+1+semEr0tEUnwf52ptQTOWAfheRKaldugux9T+SczHRpk?=
 =?iso-8859-1?Q?weV3V67+Lx1o8sJWutHOJ9WQcIrqiloNXxsE37lxCEEvzwmhe5GmcDuoW/?=
 =?iso-8859-1?Q?jfx0Ln5cIA6YjbGg5uDNFORe3VNxU4qi+ZiJ4C8dhQoQ4SmynCDxaU0c0d?=
 =?iso-8859-1?Q?V8Ou8Tpa2zNDgQT+Q7lvVOMBJDzxg/ISoM4yf+oU2X3gJwYReurcpYcz69?=
 =?iso-8859-1?Q?0i2Weyz3B2t6oOh+iU53XCoplZ+MP68crhjWp0ZLfc8oONte2aCh7F3d1p?=
 =?iso-8859-1?Q?GBXxhoVUwixEcLC1LDAHButLuOju?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ydFwOKLqxAtotg6s+eCUQl3cRChf2US51mKp73caqi4rV8PiDpf3MZZuU4?=
 =?iso-8859-1?Q?Mh39rSVQ3FHInAx0iOWRLOtrBwHIYt0OZgBKyEXZV9QNVhZtQ7k1zMl1JB?=
 =?iso-8859-1?Q?ksJMg78AjOU8PfXFcHXF2ga1zDy0x2aY6N2k/htbVFjqa+kPFpD2Zr9DKx?=
 =?iso-8859-1?Q?GN3YSt4/jymMGHi6VLp6Q9ytf7skUjbd5NOMIKayMIbXHi8MxxJ/Pxu49L?=
 =?iso-8859-1?Q?wXHOQmUvWy4ZZMYoyyE2PeVBWavzHwGEX44tiD1fWkcROYwmIab3DIgeqe?=
 =?iso-8859-1?Q?z3/A4xdVcKNEjmzZK4sfXiaUCAtmivOyxWxAzSoGmttA2XB2CcSj+GuDWY?=
 =?iso-8859-1?Q?TN64UMazzS/NqzhR9Q/quAeEiLUGhCrbchi1HF5wXKbM6IggogyXPcJ4c+?=
 =?iso-8859-1?Q?RWQv5862WWQ24VDSuF84/JPNSoxYPQynduBLJQyxcpg+4aAidhjhtSo/FJ?=
 =?iso-8859-1?Q?58bLUVscPLl/5Q/654jQ2HuLG15Ril1cj5wfUydc+JXOU7OA2Hew2iaxe+?=
 =?iso-8859-1?Q?g1PXoBTxVR8E+i/9Rb7uyKK4VV/hZz3GY/OAQnTRGKUnjdK3qcT9PHKRCj?=
 =?iso-8859-1?Q?AhlDdDJp7aqhzjfluc78Aj5zVHk5n07sih6sEmtVHhcTBOtlYLvEQQP2B5?=
 =?iso-8859-1?Q?ekKdPnTHHHUfcCj02auchs/EhiXobxa13SFWT5Xhc1TQnm0eXB+u2OnEe3?=
 =?iso-8859-1?Q?1Hiul/QqdfsKnBTjxNPFQ5nmTbRZUemoTDSSiS/uqXrldNVcz3wNjMtBK0?=
 =?iso-8859-1?Q?zwBM87TZw7bR0UWf0pnspqHAn/hx5zj1N9H96S9IsowBwx0yjDYLEPOZ+G?=
 =?iso-8859-1?Q?Il5Z6ctvhl35NPaLnvm6LSQmsP1y+rUfY9S3ZiP96y/5MFMfk/alvS9x/p?=
 =?iso-8859-1?Q?XlAQRzs9v13MRlL23/bbYPwbT3Qb5AxFhVa81DBl5c1+LuCQLrwx4HbTsN?=
 =?iso-8859-1?Q?r/lVHCHD+hNe2jfekqnuL0bpEy+/2GlonRyoleKcJ9qQcYJ5IaPHkg9HR/?=
 =?iso-8859-1?Q?+VAVp38bZdjtUCGgG+RYtqxBTJLeFd87C4nfe3Mbu7XfLslWBYuOO5oceR?=
 =?iso-8859-1?Q?RuTnGABN5gB1uwVRYXIXRsgrCUHWnw7OrZJnGHPvIoV8SymJaejCTtwKWY?=
 =?iso-8859-1?Q?D8CgU9pSo4zxjstcZCZ/3ZwG5YswLYFcHcfES2D/syPohT51xn4nt9ACjn?=
 =?iso-8859-1?Q?BHrzBExf53tpO9ugjWFyjDT5DWcDvyguGdG6e8BZ6NK8GBTfmudWr9UCGo?=
 =?iso-8859-1?Q?Hlk4vc5sIbbHEjyJmaHCJzJ1QlmeGb6wSuzXKq2xbG16SEm/SELzFUBSBU?=
 =?iso-8859-1?Q?7ZDXr3Rh6pvRlKuaHReZYT0xwVbG1iYyB0xYBebdBnQrGd0fGb/gX7N3Zc?=
 =?iso-8859-1?Q?bco1IDDiIMBnlJ56UzOhrJUuX13JiKvlSFy4vWNTG2ZHPVY4Pj6ZCTMT+h?=
 =?iso-8859-1?Q?RZtXcLM0kHIJ2k8CjWpm60W/wH4hdiEPRVYX6fmmLXP7oIpRyVwL3sRORj?=
 =?iso-8859-1?Q?At6BOd+OSZI/+Bg4sc15ijdGxBPuTE/Ebjkz4H3ckF/VOlWt7qZkVKzXrw?=
 =?iso-8859-1?Q?Mk5tM71CsNB1bPpJiNcTO3S6spNxG04WS5lP9PjxhrvSAFC8ffFMCd2cSi?=
 =?iso-8859-1?Q?yILX5tRnC8FubokAo6ZFfzTQ1X+SpCIxWv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e33f49-54d1-4391-b96b-08de26fe0efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 23:56:14.7911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KDRL3+SlVUSP0XlfwlIc1Fvz0PJK346nYZzk17RmHKjUaGvJt1K9BBtJBSsCuYDcF03iwQHB3Jf051bPeFLKVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF2B8F6C64
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

> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Tuesday, November 18, 2025 10:29 PM
>=20
> On Tue, Nov 18, 2025 at 07:33:23AM +0000, Tian, Kevin wrote:
> > > From: Leon Romanovsky <leon@kernel.org>
> > > Sent: Tuesday, November 11, 2025 5:58 PM
> > >
> > > -		if (!new_mem)
> > > +		if (!new_mem) {
> > >  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> > > -		else
> > > +			vfio_pci_dma_buf_move(vdev, true);
> > > +		} else {
> > >  			down_write(&vdev->memory_lock);
> > > +		}
> >
> > shouldn't we notify move before zapping the bars? otherwise there is
> > still a small window in between where the exporter already has the
> > mapping cleared while the importer still keeps it...
>=20
> zapping the VMA and moving/revoking the DMABUF are independent
> operations that can happen in any order. They effect different kinds
> of users. The VMA zap prevents CPU access from userspace, the DMABUF
> move prevents DMA access from devices.

The comment was triggered by the description about UAF in the=20
commit msg.

>=20
> The order has to be like the above because vfio_pci_dma_buf_move()
> must be called under the memory lock and
> vfio_pci_zap_and_down_write_memory_lock() gets the memory lock..

make sense.

> > > +	down_write(&vdev->memory_lock);
> > > +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm)
> > > {
> > > +		if (!get_file_active(&priv->dmabuf->file))
> > > +			continue;
> > > +
> > > +		dma_resv_lock(priv->dmabuf->resv, NULL);
> > > +		list_del_init(&priv->dmabufs_elm);
> > > +		priv->vdev =3D NULL;
> > > +		priv->revoked =3D true;
> > > +		dma_buf_move_notify(priv->dmabuf);
> > > +		dma_resv_unlock(priv->dmabuf->resv);
> > > +		vfio_device_put_registration(&vdev->vdev);
> > > +		fput(priv->dmabuf->file);
> >
> > dma_buf_put(priv->dmabuf), consistent with other places.
>=20
> Someone else said this, I don't agree, the above got the get via
>=20
> get_file_active() instead of a dma_buf version..
>=20
> So we should pair with get_file_active() vs fput().
>=20
> Christian rejected the idea of adding a dmabuf wrapper for
> get_file_active(), oh well.

Okay then vfio_pci_dma_buf_move() should be changed. It uses
get_file_active() to pair dma_buf_put().

