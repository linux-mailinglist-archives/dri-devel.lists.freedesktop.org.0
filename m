Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3939DC130E9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 07:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294E310E587;
	Tue, 28 Oct 2025 06:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lupceDh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EDD10E047;
 Tue, 28 Oct 2025 06:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761631491; x=1793167491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lIrcs3HqZwRKT/aK3i515V+C/iyWC3Qls+lLPAJLxcU=;
 b=lupceDh4OGqg0bqwkBBqVtbwHx36mDDmqgg9pzfMBSbaIk1agQOCWc5h
 YulmBcs2asbkEzVP437vQI/BVh5xgPUc7n/OtSeYqnCAkyQoRQv8zCLlF
 Fz8TGsZOqZX5+ZHnyjP7JeSC2gOEc1HmbOiIjkKSoQ/52H/tlNF/9Hj0Y
 c0FvGeyF4F+KF96EnmtRAMcYC3PU5/ol0DKM2cNfJn2rytq0qQqpN401b
 ZoCeZYplic7tPxKQY0Br4hOWo5bPZ6r82NDSQlq/PYVCE2a3p+YOPAWBe
 CovNfulXCNdnA2VjgXmUc0OIItGZ3ZCxbeeSV+QYoIs/o8SkWsDQSh7ZX Q==;
X-CSE-ConnectionGUID: sRp04cYTQQWFCOpq67owog==
X-CSE-MsgGUID: Shbhmoa5TaCMKhqzOi47Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86349139"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="86349139"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 23:04:50 -0700
X-CSE-ConnectionGUID: rfGZKfSMTAuswS1WzZVqKw==
X-CSE-MsgGUID: 3teJPpP4QZO5sayFNGracw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="185714699"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 23:04:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 23:04:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 23:04:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 23:04:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETjz5U7e50iuI7gGQZv8F0Ih9yaUwBNXXp/5ExwQGpnCfZkJrojq5Hqc1IM35DfhcDuMUAc7mYuOQiHksiNKwe9mdcDWuhl4lJZ2JI9jCuyQYEU1y8WwtOe31ZAhaaJixS9IJM28GeRXn2udJgh+CEjBhKnxNiNfJLyp2Y5hViWIyBBUrkwwpYhq5AZ8WHBDzVybB/cSfxpqGkUPBH0dk3FFefKzg/t3wToMO9TlEE8UQLUoiaM+SRd3rIU4Bq1L9oVM5irzfwP+GBowi3DzcJTKW0XCsTUUc9vXEyw+7f6iOF43F7Q6S+6hyF4m00E4w8+QIb5d6bSS/IxKDIAdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0jvClPSAjfGVrUn/egMu4urGTgPI0TEhHW2ANBjic8=;
 b=IRoPmsiQ3sNFbRTkucuEBJMZXMxCpYOoL6xmvKw/HBedE7zf6uT32f5M3Dw+lbWCAgxor2rnSWr/Al5hTPbeW4ct/rGjXYTCYYGLiZvxPS7/B0U34QMNKqHdsGQfbsqujIxhtCTshfUjVIAECjxhVQ1CU6tL5XgFKL674+5lvbt4OJHV8nF1381oU8qAve+jtTdfEMMW4Jpq+F8nX837RisftSpzRUkhm/RD1LkG+CnrcjoUmCfQXIKRvVXlc0vqDBQA+r7pq0g2RcdKtbPcg0n3FFCpSGNtAYT6jRg6NfYo23nMF3RGbg5Q/MHsnaEiRG7KeXIEbRvuPbw8ZWyLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CY8PR11MB7826.namprd11.prod.outlook.com (2603:10b6:930:76::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 06:04:47 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 06:04:47 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Christian
 Koenig" <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: RE: [RFC v2 2/8] dma-buf: Add a helper to match interconnects between
 exporter/importer
Thread-Topic: [RFC v2 2/8] dma-buf: Add a helper to match interconnects
 between exporter/importer
Thread-Index: AQHcRvz60PfFXNAzIkykWYmmM32ny7TWTlKAgACjCaA=
Date: Tue, 28 Oct 2025 06:04:46 +0000
Message-ID: <IA0PR11MB7185FF98DD56C2C2E5057857F8FDA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251027044712.1676175-3-vivek.kasireddy@intel.com>
 <20251027181853.GC1018328@nvidia.com>
In-Reply-To: <20251027181853.GC1018328@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY8PR11MB7826:EE_
x-ms-office365-filtering-correlation-id: 41acfe04-6a45-4636-dad7-08de15e7e5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?j+3oIhdzmmIJxaG02FmtzYs8CYuy2ElPGIdeA+sCPsHj4Z2irAwMwBBuQP?=
 =?iso-8859-1?Q?d4dstA8wHxiNU0rRDG2vnN6G+wwmvM2WZxmaq11sMS4oph9JmpOasdxl+l?=
 =?iso-8859-1?Q?mtkPkXrfC6fuXfOJKsDOFexWqwpygsngTVYXEnrvYjjwIEQ51GiIy6LPWQ?=
 =?iso-8859-1?Q?ABfAyZjgLCjr7HOHVppRdhFwUc7TWCqcGde2v8hziuXngEE5BnTknFv/s2?=
 =?iso-8859-1?Q?dJjLrGaYk6CCqHFxQaMYaXEdxUdHpI3SbDUHf6FDEgyrdJjqBxUgVZTgsa?=
 =?iso-8859-1?Q?r5ft2xRfnsnKpnsaRJAGBFaGgjiMhbx8GcwOZqIwqx3LB6YC/4Nze3JGyp?=
 =?iso-8859-1?Q?HaXkaYpX0MXjPjbfI9asjhmSGRkrX4NM1Qnh3O4hfcy+8pMd2BBP0iOvH7?=
 =?iso-8859-1?Q?0b7vl4dqmX9vRLMEgtPOknv5w2fTgON6ZwC8P+oh7xFJMOBm3Lafe/f30r?=
 =?iso-8859-1?Q?Fqti4IojJhoUF0g4wqWwyXwxKnj4WWzFsrnLqlhhU7dZco/ZasNachP68b?=
 =?iso-8859-1?Q?IH3hSoa8RXSFZtvrZfUPcWZta5HU68Jn1t+UWbIKndLP02OEM4Mo91cQ+L?=
 =?iso-8859-1?Q?lXlEs5KC47XmOo/IeZrN1bhpEmIYXlME5drvOZfUHZUlLmsKbJ/mrP+qwe?=
 =?iso-8859-1?Q?cpqac+CkOPtPssDdrcVLRSykE9IFUz79DnIzM4n+LVuYGidLOUO/yDU08o?=
 =?iso-8859-1?Q?cEsGsmQIJuR+qlYEVeyA76IT2NAnFbySDWy07vuiwQK2pHxuGCDqj5mzF8?=
 =?iso-8859-1?Q?z/t9daJK0YhI6y6koXfkrlFeKIbizUL1NzSFlCKEPILZe2UVjog5acFbpE?=
 =?iso-8859-1?Q?MRve1+nh5GvoA09Ow8p6YN5TxtK0MurPWye/BK44Zvb4kX9lNGlFmM0hGG?=
 =?iso-8859-1?Q?czTvl24Z2uTz3P1uv2TBpMoWtLmkl1NSPbyHEBlizFUq491+LxBABGaOgj?=
 =?iso-8859-1?Q?bgR81XB6jAzMV0tKoa8E0YlOFCxJ14jMwgBE0/8fiQYUx2Cgi2iKqIRV1i?=
 =?iso-8859-1?Q?cCNrYKy7Ylg/TY9BIhqkhKW2pCuiwlFXrBi7j+iqkeySEpB3poBnRm8jKg?=
 =?iso-8859-1?Q?j/Pd4fhU9L8k6365I0vWKjlX3uGjfvHIFRFHdlOsPeaXlKKn5MiR92Sth0?=
 =?iso-8859-1?Q?lpmDdjm28Zj1W+/ANS0H5zPuaRflvBh0KqWKsT/gv/RErmlQBhQ0Jk1env?=
 =?iso-8859-1?Q?m5lNES7s1f4bHSUkQ5FzsWtLjlNl7nxXtmM3ktOawStFQLB1xTZUct49hn?=
 =?iso-8859-1?Q?ae5LasvJPgksn31DF/4hDCt90cEjsdUKca/vAq9SXRDzO09B2f5+93RbAW?=
 =?iso-8859-1?Q?FznsxhNGNu8klOUFR4F7EFLRcuiTD4jyXjm1uK2oA4V1lSUluGkmb8lUHb?=
 =?iso-8859-1?Q?vg2c5PUR69Nl73Si+4sC7JU09MMi1HwLVLafXxW+fx/jQoOlVyQXmZm5jd?=
 =?iso-8859-1?Q?iinxaq30cgIexIBVOiqefxN8KqZ8UjKJRZcRTzxtmXU9NsLzfZciRHEwin?=
 =?iso-8859-1?Q?sgwKZDi6vc7OGbL7eA7Ngf83F9dSbcMUuHVPe14s3+W4BCFB1fhQ0Cbr/j?=
 =?iso-8859-1?Q?YhVMjJqw6ZXNZ2tMMVy7/94dPORo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h06UELDZjit62GE2MbZWFT0aP8qEpgeUVZEOSjGN1qz/Yno6o3grpEDoPP?=
 =?iso-8859-1?Q?XRBXws9QtXWaEWMQDrh6a4Irx2Eccc7ZClxV3/wfKyouglLJ7m3bcG/3Bf?=
 =?iso-8859-1?Q?NwXdSZZGqO0ThPkm77+Vvw/gCJgMFw68HlmLPUqi9dBZnUrUQEwVdqpYHV?=
 =?iso-8859-1?Q?F4YfhqvX7PhstEd9JTRwS8tvDHgdfa/KCSSdI9Ki+TXumQyMSAI+RNmtLH?=
 =?iso-8859-1?Q?bIjyvXSQMKyGq9qQbaQ78REm4e5rs5p6IrGGkPC/I8ATdbTEUXXYdMEhAY?=
 =?iso-8859-1?Q?b3Cd2GIkI+QWi6enarCqc0b8Ps9EeqcpieFGeiSKKKlrxdRBteYpkqeJ12?=
 =?iso-8859-1?Q?jMi8dI6hCMvk/ixkRcPBrA1bW3ZhCwGGjexJX2MUvrdYv0rpcsrUpbhkIV?=
 =?iso-8859-1?Q?5TV1EQvFJJLtONSGXuHGAFiyv9UMf3Yz1VCuuVRkN+hYEpB0PrIOx4qaof?=
 =?iso-8859-1?Q?Nr2NEtTXz5kAZsGd+y89ZFDOZ+EgIZ3LDq56tVQSg4wLOOiU5NO3VOkvg/?=
 =?iso-8859-1?Q?zTn4oR1Y908z+SnpH8snE0xOXfLVqu+JBOvHYR+pew7Mg+9i4BwGjURU/F?=
 =?iso-8859-1?Q?cRzkP6HzEI3eksmwdagisbXnh1nlzrRyWWjGNRsN62aEib19fTgPcJJZc0?=
 =?iso-8859-1?Q?K8G9GXL6PSQeY1tassCXUVmQe05aMgKzju4gRHXFKY7ODlVtSpYIqSe5dO?=
 =?iso-8859-1?Q?ddBeaQ1NqFoFqgYyUwJ35AqWfWuVsPKDD7emwlBUnQcPVGd9iNIVmEHqSe?=
 =?iso-8859-1?Q?ke+Ytkef2VdnHzmEanheDrmftLUfIEAycqQcC5CVkIwIykAkLntzAiWEhl?=
 =?iso-8859-1?Q?U7dBkak5P7eSm3B/eg8ZL/nJT8jkvm4yuZkklk8voFzyXYNQQcPZcHnWL3?=
 =?iso-8859-1?Q?hbT2PM7JUXtNN0Y3foMlJSlOh7IgfnjvXTxtuEWTifcb4CCmZcGZDDhDAR?=
 =?iso-8859-1?Q?/wmg1ukB/O2sarKTxOLn/I2RkRmrsRCAtlR2BcUsQejp6++QEIcQIuZDm0?=
 =?iso-8859-1?Q?RM/0hJzsNJ6WAFl2fDRo7Lzsgj30fZ5pwozpyH+VK+eWNXIqTsRXRGhLxZ?=
 =?iso-8859-1?Q?N1shxvRsOzZ7YvNT9ml8lVOR3FKTQwLQC0T0k+agdH0KC3Sg4rNR1BQpLH?=
 =?iso-8859-1?Q?zMEQ2EJTAt9ZYA/3f4FM7cg+aqXImtV2/91C+2a+MomTLho2eovuL88F83?=
 =?iso-8859-1?Q?TCNFgTV2mB4cdY6hO3XzM3PeXaAj7q42+vZ83fPaLBWDiaKWyEQyVTJ07g?=
 =?iso-8859-1?Q?/68oXAmKpkGPevvvKTgrOdozLB/l6IZsqH8bJ1sO7I76CXUX7iVQ7BE+29?=
 =?iso-8859-1?Q?GUbWLzPiBANnkL+Gd/dsUCfws+VHhBBIvGJjqa+cIa0Pcrur6OUirVbzaW?=
 =?iso-8859-1?Q?z2KfvgMog4gyvNou4vE2l0SmYFfZytgJcaUFqpBee5knvvW5tRXgymdoUA?=
 =?iso-8859-1?Q?F1bIghPZO4XabKtFerHcWaky50qlryaa4Zy2nikVT0MX6QTg27+/2nYEyy?=
 =?iso-8859-1?Q?kWU685+U9b3Ct9E31cBjcSiBP66ItfjinMCVnfJ9Bzu+J6mtD99T3MaAez?=
 =?iso-8859-1?Q?RIf4YsHIRGE11YIsRjrnzIxtrzVyAviI8Avk5toK333WUqn6LuZqiOyasg?=
 =?iso-8859-1?Q?jw96J40LKvAG1WuUQywswQqCgqLOS1A4W7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41acfe04-6a45-4636-dad7-08de15e7e5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 06:04:46.9104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0BQDm9/dAtzMTT9CuX4Y/pavJOdqdMjtvmvx+XYcalgBLQ5I8/3sjzz7Cv08WgPYu3SVAlFQ/Yhefg8POXNbrJiBsxfkjRwLdcTl0oz/Mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7826
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

Hi Jason,

> Subject: Re: [RFC v2 2/8] dma-buf: Add a helper to match interconnects
> between exporter/importer
>=20
> On Sun, Oct 26, 2025 at 09:44:14PM -0700, Vivek Kasireddy wrote:
> > +/**
> > + * dma_buf_match_interconnects - determine if there is a specific
> interconnect
> > + * that is supported by both exporter and importer.
> > + * @attach:	[in]	attachment to populate ic_match field
> > + * @exp:	[in]	array of interconnects supported by exporter
> > + * @exp_ics:	[in]	number of interconnects supported by exporter
> > + * @imp:	[in]	array of interconnects supported by importer
> > + * @imp_ics:	[in]	number of interconnects supported by importer
> > + *
> > + * This helper function iterates through the list interconnects suppor=
ted by
> > + * both exporter and importer to find a match. A successful match mean=
s
> that
> > + * a common interconnect type is supported by both parties and the
> exporter's
> > + * match_interconnect() callback also confirms that the importer is
> compatible
> > + * with the exporter for that interconnect type.
>=20
> Document which of the exporter/importer is supposed to call this
I missed adding that part. The importer is expected to call this in my curr=
ent design.

>=20
> > + *
> > + * If a match is found, the attach->ic_match field is populated with a=
 copy
> > + * of the exporter's match data.
>=20
> > + * Return: true if a match is found, false otherwise.
> > + */
> > +bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
> > +				 const struct dma_buf_interconnect_match
> *exp,
> > +				 unsigned int exp_ics,
> > +				 const struct dma_buf_interconnect_match
> *imp,
> > +				 unsigned int imp_ics)
> > +{
> > +	const struct dma_buf_interconnect_ops *ic_ops;
> > +	struct dma_buf_interconnect_match *ic_match;
> > +	struct dma_buf *dmabuf =3D attach->dmabuf;
> > +	unsigned int i, j;
> > +
> > +	if (!exp || !imp)
> > +		return false;
> > +
> > +	if (!attach->allow_ic)
> > +		return false;
>=20
> Seems redundant with this check for ic_ops =3D=3D NULL:
Not really; attach->allow_ic would indicate if a successful match is
found or not. And, ic_ops is for the exporter to indicate whether it
supports interconnect ops or not.

>=20
> > +	ic_ops =3D dmabuf->ops->interconnect_ops;
> > +	if (!ic_ops || !ic_ops->match_interconnect)
> > +		return false;
>=20
> This seems like too much of a maze to me..
>=20
> I think you should structure it like this. First declare an interconnect:
>=20
> struct dma_buf_interconnect iov_interconnect {
>    .name =3D "IOV interconnect",
>    .match =3D..
> }
>=20
> Then the exporters "subclass"
>=20
> struct dma_buf_interconnect_ops vfio_iov_interconnect {
>     .interconnect =3D &iov_interconnect,
>     .map =3D vfio_map,
> }
>=20
> I guess no container_of technique..
>=20
> Then in VFIO's attach trigger the new code:
>=20
>    const struct dma_buf_interconnect_match vfio_exp_ics[] =3D {
>         {&vfio_iov_interconnect},
>     };
>=20
>    dma_buf_match_interconnects(attach, &vfio_exp_ics))
>=20
> Which will callback to the importer:
>=20
> static const struct dma_buf_attach_ops xe_dma_buf_attach_ops =3D {
>    .get_importer_interconnects
> }
>=20
> dma_buf_match_interconnects() would call
> aops->get_importer_interconnects
> and matchs first on .interconnect, then call the interconnect->match
> function with exp/inpt match structs if not NULL.
Ok, I'll try to test your suggestions.=20

>=20
> > +struct dma_buf_interconnect_match {
> > +	const struct dma_buf_interconnect *type;
> > +	struct device *dev;
> > +	unsigned int bar;
> > +};
>=20
> This should be more general, dev and bar are unique to the iov
> importer. Maybe just simple:
>=20
> struct dma_buf_interconnect_match {
>     struct dma_buf_interconnect *ic; // no need for type
>     const struct dma_buf_interconnct_ops *exporter_ic_ops;
>     u64 match_data[2]; // dev and bar are IOV specific, generalize
I am wondering what kind of match data would be needed for other
interconnects, so that we can try to generalize dma_buf_interconnect_match
or probably have interconnect specific implementations subclass it.

> };
>=20
> Then some helper
>=20
>        const struct dma_buf_interconnect_match supports_ics[] =3D {
>           IOV_INTERCONNECT(&vfio_iov_interconnect, dev, bar),
>        }
I have done mostly the same thing as you suggest in patches 4 and 5 of this
series that add IOV interconnect support for vfio-pci and Xe drivers. Did y=
ou
get a chance to look at them?

>=20
> And it would be nice if interconnect aware drivers could more easially
> interwork with non-interconnect importers.
>=20
> So I'd add a exporter type of 'p2p dma mapped scatterlist' that just
> matches the legacy importer.
IIUC, even interconnect aware drivers (or exporters) would need to implemen=
t
map_dma_buf() op (which is mandatory) which would return an sg_table.
So, if match_interconnects() fails, then the exporter/importer would need t=
o
fallback to using the legacy path.

Thanks,
Vivek

>=20
> Jason
