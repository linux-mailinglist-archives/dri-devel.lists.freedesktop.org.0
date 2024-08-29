Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2D4963AE3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715210E34A;
	Thu, 29 Aug 2024 06:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja3mITm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B15710E34A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724911760; x=1756447760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yzWjJbxWXDVPOmlPeXbC5/kC8N0jkizfs6sSzv11fag=;
 b=Ja3mITm4t5ZsK+truk1rUqC1j+Wv7PKdSlJYxfhemxUmEars7M3ygGnP
 BIWvV6h0jZl77NJM5dh3TINPF+oZBoVUR3b4VlWU88Uzu9vfYUxP0Hd8q
 dK0oYmmUIbmy+jEL9FvxrmMjeJCesTYqr/8yk06itOx3Z6S5UpJ27zWql
 gVVRvo2RWhwqCWnVJeL9enfsHhy95H6zvOswzJpFRQtCRw1Mi36XHiyuQ
 9mL1LWk/aYqsT5sl0dpQ5cvD12CWEKCayIPeqUggVyu3p9vNNZ7u6j8KA
 0cEAsh6aHbSkdTW+9mcRZ6B0MhMQabhEtJ/CRQ8m9/FxBDNTR1xNtrP2E w==;
X-CSE-ConnectionGUID: kIVcj2QBT7ucaRP5/k0bGQ==
X-CSE-MsgGUID: OolaTwf5QiWcTDhkG1o86g==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23612978"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="23612978"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 23:09:19 -0700
X-CSE-ConnectionGUID: 9x4KIUI1QxyD7SEr+VcYtQ==
X-CSE-MsgGUID: oHv8yDetQF2Jk6/X9QosxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="63656909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 23:09:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 23:09:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 23:09:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 23:09:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 23:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeaJoqorR+ESxx9Rrc3uh5umYlKsweuVExaikM7vZmztD3bOX2rz2kAOkRTPMCmcV1auN4mdKeyors+Ji67V95lb8yCC8mwaARyzH4j5szChuSVsffV6mYK5xqgAHtlssk9mbvICYgZfLNmHGGYS0p7hMQ/bhjm2YyFAPjh4DTDe+Eg58iz/K5BbaQC+X2WJJ4Lv6HIuIrvRlyNInEsoKLOlSv3dffG5EI7xmIgI3Cp4NykfgaMGN+aOw7WuJYe+pk3IM/G3+T3Ugmy+0b1BDw+0IYZCTvKUKMp0P88KXrvvbnp9iDI+oHgH58apVgJ4s7jarGD7y5QNWY90H/xIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBkKzo4Px2B4/7Dvq7RfzBNzk+18xre+Zn55YtKpcjc=;
 b=g9nlTyzkphIyOjruHICBdaRsNkPxL7nSZyZDnrrprO6lERGGtatuweP9M/P9LeSiuwaRuZfhjWD7XvEw9WcyjbBwtm9vr3hGyKABaiT5MjjqnaSCuW7uEZAcEfLmW+d01hIb59OnaZZKu0EowbJkr46uNz4MMKQ/v2Oy2Sp/M2CKwchnIoLmNkeEz0ga/YAo6oXM6wXgHIGrU5rfLOXwy1atScGy3YyUDJ5qxPHxI8MSrbbV4C4vZY9DSr3iWuvFe5MZBAk8ZR9Woef5LpoH54A1jvN3dXGwgTG+W46ZaGmwWDsgT887YqCl6DHekRr2MCS0BPPqzSaGCZ3aX7d3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 06:08:58 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:08:58 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v4 1/5] udmabuf: direct map pfn when first page fault
Thread-Topic: [PATCH v4 1/5] udmabuf: direct map pfn when first page fault
Thread-Index: AQHa9G+T11uuaSJPXEe+DfxssxyDrLI9NGNw
Date: Thu, 29 Aug 2024 06:08:58 +0000
Message-ID: <IA0PR11MB718571990B58A16756C15E2FF8962@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240822084342.1574914-1-link@vivo.com>
 <20240822084342.1574914-2-link@vivo.com>
In-Reply-To: <20240822084342.1574914-2-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA2PR11MB4969:EE_
x-ms-office365-filtering-correlation-id: 07dabf3f-7eb7-41aa-80fa-08dcc7f111f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?mHE0qKRHyBG4Ubcsz3bd2Vn9qceqwNcqlTNOjNuOs4mijE5vtCnAK8c9Nh?=
 =?iso-8859-1?Q?mb96xl0ISjI+b8OkgcLv5+3so/jwstVda4aRnhMzultPowSRXuITPUQLZA?=
 =?iso-8859-1?Q?SlikYz4SzmQ3MUcH3BUVcRCqbgKtQ5Qa3wsmCVv3YhHGy3uughUvFUwQLh?=
 =?iso-8859-1?Q?Mnp7XUg0KaD+9DZV4tFk377cIvwINoiSfDgTcam/JT1+qGUg1Nk1zb9HNz?=
 =?iso-8859-1?Q?DyfurejkjLPQGzRH78LPsgzPfgPqNZm2LkFs0ADYTLvXI4K9nZAjXDgSYf?=
 =?iso-8859-1?Q?KphcqV4MWvYewvGrnkkmLUUV+yuvQ02sEubOsqpinQkNRNH1Kxmnpfye4s?=
 =?iso-8859-1?Q?1XE9gy4XWRVHd+LnGMCfTlcm5pCaU9/ARBDMbPV2YQdzGREDSQd+IaNp9y?=
 =?iso-8859-1?Q?Kt8biDDQM42r3bH1/sCYuKG3wqYUbp0mO3KmBLAYvb0xqWhsKNXGxhE/o5?=
 =?iso-8859-1?Q?nkFVLTZGcWAuYqPqFpXmd9T5L3Xy3B1sQWVSs5PXAu/vSQuAmeVTxNRZhe?=
 =?iso-8859-1?Q?Jy+JkEN3pmIDZI2WNQ5Z81jWGNVK4uXEb4WUQ+Xg1w9UzoNY4+NVMnBrOc?=
 =?iso-8859-1?Q?SLhF85DDbyuiGwPSNOuq0F5/rC+NjtF1QS8mWPzmLGYjPGn8TVcxXb0R/z?=
 =?iso-8859-1?Q?W9ZyyISVSE/T9wiVjnsj5N9WgT5r4ohqlyUh3ZvjOd2ornMb4Psm7uxsW7?=
 =?iso-8859-1?Q?XnJTlToleg/eMai2MG0+q9M1ACbtklJXATkPoHN7lvGsPPjeaZILDl34o7?=
 =?iso-8859-1?Q?xFXa6s8BQYnDqPwElClbBX1b4ysdrSgB0UOeLdTMLH/dyC/qosMbZ7v8OX?=
 =?iso-8859-1?Q?MH3eKVA2HaLO6SFQpQmvc7uG5mIpHn+OMMynqUkM4EH00QtMWzCBiVmCTf?=
 =?iso-8859-1?Q?B4h0bzB4m3oXZy9RLvM7ayKiPnmyBES9F7IwUC1RsgXChMw7/MixSgXBO/?=
 =?iso-8859-1?Q?tgvLf74BmC/7/NcbSvx7b6C0p3SEBaoUIKebaPSWrJ8nKqfwxpNpPR1Iq5?=
 =?iso-8859-1?Q?MHaDvyY+wMDzOFc/gceI69ra4vwmswk4zniBnRoiNLe5izXkFc72koloPR?=
 =?iso-8859-1?Q?oPgh8p3ewB3fiJhGxykOVXdOdzMWaJkwVytbXycl0aHtYRXHBmd5wIQHST?=
 =?iso-8859-1?Q?MY5QWRTyONL7xGTt6txzurE2GZ8qHKNBOG+grda7SPL8X+X8oJ1x4CqflX?=
 =?iso-8859-1?Q?tgPE33lS2opr8183cwMcJ/QsRwL6PcHjYHA1+DOotF5VVl+jSGarthsdlh?=
 =?iso-8859-1?Q?mlZ8OAN3dEdloRQhSkypJLt3Smfy3EzZ7851xGuROvfPslqQ1PLRcuIVSb?=
 =?iso-8859-1?Q?YZCRAMafSWfzmUAudo+5xwvLKbl3PpNvWazJ5n+7s1wF3JRb1LyeGDkubK?=
 =?iso-8859-1?Q?9fn9wQuusOvlwEzBx5iwyIlaXQ0YeJSngRaaihOrvL1hX2RvgyC9R3dSLM?=
 =?iso-8859-1?Q?Penh1fHHuLQiL+0AV2XoNig2D4khLAsymQV06g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ktxW1WDAF0aLGqlFna9+DytN84iqiZw09Wd5LyNejWcPYaVetqUlYv4XYu?=
 =?iso-8859-1?Q?leteIh8SrKq0t/Bz6IGuSRR4PaobaCLHFNDIJk9kuS0pKm8P2w5r2ep95W?=
 =?iso-8859-1?Q?BhN+E4GUm5kaTnfRGYNbKxr6YY60l1nqSaHeWtfLFjn6V1aw8bC74jTTfn?=
 =?iso-8859-1?Q?2F3fvMg34kL87KsM5cHvI/s1G7t1xw8p7FLrJCUv5Y5hX7K4cv4Vf+hYtR?=
 =?iso-8859-1?Q?ePxH0xRoY7VrQfeAK8F/TezgKfStRibsaf5bGqFtqgDyOtCI8KAB19jWNs?=
 =?iso-8859-1?Q?Z3az67mtQiZktEWHquWAGMSF8YEAjSpKRQ3vvHlw5nNb2dFma++HDD9Rsm?=
 =?iso-8859-1?Q?1ywad5BtvhXQHzR2kVye8e6wI190Qe48FEoE0KTQTC/w5d+M8Qj+GphEgh?=
 =?iso-8859-1?Q?scKd48aeKdpHxGJlH6g5yaSgczF4w78Tx9SGCg2Ai9CJImfpM2nvcDab9p?=
 =?iso-8859-1?Q?3PjyJ+Impd3WYilxuEpslZpCwQAaVQlTVxAPlCtJhZ6nqxAP2fPH/Fh2r+?=
 =?iso-8859-1?Q?saVaETzKFe3TnH3xSeZOwFkpgQB7Fp0ZTdETeBFfvU6p+Q6Xb9k1535NJu?=
 =?iso-8859-1?Q?mwjrDC71GULr8QDbc3X6H0WenPbNkL95Ivsd32h/xT9xanx+Lnb/BnMY2R?=
 =?iso-8859-1?Q?PwseZXj+a3xPu80l1sAF0ipgMRjgjdfrN+OXjWjzEQYJl4AhOrCcWszapZ?=
 =?iso-8859-1?Q?3vU/Te9SK3qbAXYwzagScAXk15fYQuMpMQDHjJxg4xnUOVyIc1S+HNf3/B?=
 =?iso-8859-1?Q?8pjjOQztnrdFKNtns+eAYMN4fXXinSsEB+n2OAe86Mjwrqdy48EjRzInX4?=
 =?iso-8859-1?Q?iI3kkRPOWnGRYXwYFel9ueYfOwWlmtbWnWgzdNCczGzGQfyUx9CYM1OGeF?=
 =?iso-8859-1?Q?viKpQOrgWLDmJoENYz7nJjNQnuUsYz5btV46bjRlGoouqFWWVCIGEr1rcN?=
 =?iso-8859-1?Q?92e0NQUf0yOfQOLBxPdjDCl8wbMQ5+q7fWdGDGMIaMtEwLpcNgCTYtKzF4?=
 =?iso-8859-1?Q?0F0ldd//baksWLSf7egH3hjAHfMcE0GmH1BQkrwaSsAQ7grm2flS4TvYL6?=
 =?iso-8859-1?Q?XkIhM27KuI+3YkaIwTfbdje5Z2voP9HUBzP3gSsp/EjLmdXSKwft1QgaS1?=
 =?iso-8859-1?Q?/j0/dLa+ScZtPBmWwZIwDuibI+XjR2D73JaBzUeaAbtWMlJ/wTju909qAa?=
 =?iso-8859-1?Q?9pgCpxfCu+9xCL9ZVXlrgbAPgu8OQgXrO5A7tuQfwfvklWvdCDt5W8MNNR?=
 =?iso-8859-1?Q?0em3ignb4zYgEmzb14xON0Yw2coAcCRQyMvnAXifNY5nCGOsCFcE8NLjPG?=
 =?iso-8859-1?Q?HaUaSVZE1cp4Uxqcw3dR2xSZI2Daw6a0gERtzCeAlbJuSAbdJif2I/WfHM?=
 =?iso-8859-1?Q?5PG5WYqP5foI75iF6kfhKGWhbVtoCmljZkast9xqWkp7JwvXl249fpfs7j?=
 =?iso-8859-1?Q?imCJBazqmvmnIc1N8z6dK3lK2XmMfnEv4PngBIE/v4EAfO2nit9LBqpHAN?=
 =?iso-8859-1?Q?MRfMA/eNLGB/nz+jdYZ62uhwlF9x/P0COOGK06kn9GLqXe1DwWV+pmW7m8?=
 =?iso-8859-1?Q?YyhSDTTZYHDOGiDfJLZli44bjSSn+C/iew+1oow/AwHy/LHxq8qWjilExP?=
 =?iso-8859-1?Q?lorthOEGqM4EUrH1kUuPwKnPveKcqeTKr3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07dabf3f-7eb7-41aa-80fa-08dcc7f111f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 06:08:58.1999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IW5kKhgiCcDOcIrpDofdLViujldQBj2/4OhXE60X0iWGoervHuJ4z2Qzmw4/Hhtbbh4ycjfXAjzlEDdSzweeB6THsJq78kB9DaUOp7cb87c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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

Hi Huan,

> Subject: [PATCH v4 1/5] udmabuf: direct map pfn when first page fault
>=20
> The current udmabuf mmap uses a page fault to populate the vma.
>=20
> However, the current udmabuf has already obtained and pinned the folio
> upon completion of the creation.This means that the physical memory has
> already been acquired, rather than being accessed dynamically.
>=20
> As a result, the page fault has lost its purpose as a demanding
> page. Due to the fact that page fault requires trapping into kernel mode
> and filling in when accessing the corresponding virtual address in mmap,
> when creating a large size udmabuf, this represents a considerable
> overhead.
>=20
> This patch fill vma area with pfn when the first page fault trigger, so,
> any other access will not enter page fault.
>=20
> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..0e33d25310ec 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -43,7 +43,8 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
> *vmf)
>  	struct vm_area_struct *vma =3D vmf->vma;
>  	struct udmabuf *ubuf =3D vma->vm_private_data;
>  	pgoff_t pgoff =3D vmf->pgoff;
> -	unsigned long pfn;
> +	unsigned long addr, end, pfn;
> +	vm_fault_t ret;
>=20
>  	if (pgoff >=3D ubuf->pagecount)
>  		return VM_FAULT_SIGBUS;
> @@ -51,7 +52,28 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
> *vmf)
>  	pfn =3D folio_pfn(ubuf->folios[pgoff]);
>  	pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
>=20
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> +	ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
> +	if (ret & VM_FAULT_ERROR)
> +		return ret;
> +
> +	/* pre fault */
> +	pgoff =3D vma->vm_pgoff;
> +	end =3D vma->vm_end;
> +	addr =3D vma->vm_start;
> +
> +	for (; addr < end; pgoff++, addr +=3D PAGE_SIZE) {
Although unlikely, I think we should also check for pgoff < ubuf->pagecount=
.

> +		if (addr =3D=3D vmf->address)
> +			continue;
> +
> +		pfn =3D folio_pfn(ubuf->folios[pgoff]);
> +
> +		pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +
> +		if (vmf_insert_pfn(vma, addr, pfn) & VM_FAULT_ERROR)
Shouldn't you store the return value of vmf_insert_pfn in ret? Otherwise, w=
e'll
return success when the above call fails.

Anyway, I am wondering if it is more optimal to just iterate over pages ins=
tead
of addresses. Something like below:

+       unsigned long nr_pages =3D vma_pages(vma);
+       unsigned long addr =3D vma->vm_start;

-       if (pgoff >=3D ubuf->pagecount)
-               return VM_FAULT_SIGBUS;
+       WARN_ON(nr_pages !=3D ubuf->pagecount);

-       pfn =3D folio_pfn(ubuf->folios[pgoff]);
-       pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
+       for (pg =3D 0; pg < nr_pages && pg < ubuf->pagecount; pg++) {
+               pfn =3D folio_pfn(ubuf->folios[pg]);
+               pfn +=3D ubuf->offsets[pg] >> PAGE_SHIFT;

-       return vmf_insert_pfn(vma, vmf->address, pfn);
+               ret =3D vmf_insert_pfn(vma, addr, pfn);
+               addr +=3D PAGE_SIZE;
+ }

Thanks,
Vivek

> +			break;
> +	}
> +
> +	return ret;
>  }
>=20
>  static const struct vm_operations_struct udmabuf_vm_ops =3D {
> --
> 2.45.2

