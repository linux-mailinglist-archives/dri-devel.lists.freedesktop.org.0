Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7066CCDF49
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 00:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0539510EB4F;
	Thu, 18 Dec 2025 23:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KY5qmLPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47BF10EB4F;
 Thu, 18 Dec 2025 23:34:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMqP0tazNB4PJw1lMXPk1MOAXT2+OhWpDfqS+WyJ+cUUr3KkbMBUiyHEeYM1WaaajBOMlVDTvMpwfEGxV9Y+qv5Ahauv+dPT2+EODCOYA/Civf+1WqFJE/0A1TMiBvpm1ArSDjib2Wt6fb05pVb60sRuOYJNGXaFvBU3hNwN+CJ3JuGVai7Aah/gxWa5h64ropDPGPd3kVXG4haPvWpxqx4p6XZ7VuCiiI+qIaUXKFNhLX5H9opqKuLsYHK2YTVpi+YC/zOgAkjNAUKsPacEFMBLgv3ajHQYXCei2VDrvmb2Ac9cVR7wY6tdIDoqj988Ft5KTsFdg0rtxf2O39QoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ5aL+qnC9LVMV4VPPDt/nsmaoplYJntWsHq5YM6RPU=;
 b=o6EdbmExlo+nD02YFtlN2EgVEWsdi1/UQJzXkMVY54V3ghtKpt98Aa2tg1Oso2YoO9H7O9IzwbW8kieFv93t+5XPM4iedbR9gi9CTC+cu3gyZullE23Ge/gjpX6iT2De2055gxNlcDq14EYVMOcLJmKI8Bpf9rd8I/dbDZ+rYvlSPVEVHIMNuabRKy0eUEYUC9ABciJ7+GNmUpaGH0cRVAlIi3rL/DYAuUuws6YbfdPoNGimSfiz4v4xOfsb8wmrfd8yfAS0E8xWWwpy8PH3LMxNiQuHJkuA0xunJz+B7VH0FIKdWuJg2zD0DLfy0jCFyS9ptQenwe2KXbPwXl+RZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ5aL+qnC9LVMV4VPPDt/nsmaoplYJntWsHq5YM6RPU=;
 b=KY5qmLPlxp3uL9hUnZVmJBev2Ubfv3m9YsexCOt2vfe8+ZE8niDbCjF1/FPCQyeLbKYyFHy9uJleQckJljivu7X0wkjAySlf/+qANkRiLDcyap2mZQg+3TBtpKvzBgOx167tN9I3Z6xLqkCByUJD0oflvXX66P6s+vxHGv9kng0nTXUcyXYmTXrhkesuZ0+Z9OeeTFga4o4+4bBAHwOX+lKfVtm/z20G8mG/EW5xMcCYDoEdBjKfMWjGYRlWwcYrX3UBiz5Jm++r8xkJCHb2AmL2U2yy8o4G0AEar6SlsAySE87/7bcRCE8jJKwABl3y9wFFqSA+++e224ETvUEwWw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Thu, 18 Dec
 2025 23:34:30 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 23:34:30 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
 <ecourtney@nvidia.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Topic: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Index: AQHcbkrHgnYQZUlgYEmrrqFJzoQGx7UkZ8AAgAL/6ICAAJiHAIAAAwSAgAAN7IA=
Date: Thu, 18 Dec 2025 23:34:30 +0000
Message-ID: <e3fcbf9b9165da51c05dd2837adaa0be2ae1f05d.camel@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
 <F72EBB64-BB07-4FFA-85C9-3EDE9AEE3C48@nvidia.com>
In-Reply-To: <F72EBB64-BB07-4FFA-85C9-3EDE9AEE3C48@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|PH7PR12MB5806:EE_
x-ms-office365-filtering-correlation-id: a35a1e49-6c9e-4f07-2760-08de3e8dfe08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?M0xVSm04SkRiL3IxWjB5ZnBwV3dxL01kemxzVEdqSGRPVzBIQlE1OCtNSVA2?=
 =?utf-8?B?T1pIcUlONEhKdWtmcHU5SnFtaEM1K1RrMXpaMzBFeTBLWUZ5MXVYZnE0R0Yw?=
 =?utf-8?B?ZTVEOFhydys3V25hNjNKaVRMTXl4bXdlQ2x6Ukc5dGtocGZzR2MxS3piMmpw?=
 =?utf-8?B?NHBXdFIyYTdYeU5EU2UxaitXWHdZaE80WnpUTFAzcFN6K1hWWG9RTHJvN2Vi?=
 =?utf-8?B?Ukt6ZkloRHVZZlViNTNHSWJHeFF3OXhRaVp6NEZmb3lqb0JhZm5ZbnVnUmZQ?=
 =?utf-8?B?SHZOY1Y4WGgreFRDUHdpRWN5VlFONU5aYWhWSlBVOUxSWEtHWGlCV3F0ckty?=
 =?utf-8?B?clduLzFSTVF0ZEdGdVJGN1BFZ1FwN29oWGhxU2xSeTRYQ1U0Z0FoMHJ4dXli?=
 =?utf-8?B?MG1sK25CMGk0QTFySzV5SzkwUlAxRmZ4aWxtSE1VUmtaN0RRSnBtcUl2dlVX?=
 =?utf-8?B?QnZHK2tBMjFUTUVaLy8va1ExWk9vVFJoM3RpdEV1ckNHMDQ3VWFyY1NCWG1T?=
 =?utf-8?B?QytVV05MazRDVDNzdm5ZVFNGVUEvTzFsWC9mbHZVRXF3NlhPVGs4disreGZQ?=
 =?utf-8?B?aGpCNVorNmc1d0taRmpuQm5VVG1IMUtOcDhVbDE5Ylh4ZkhPWXhnaVpZVGpN?=
 =?utf-8?B?QmpSN0lRMzAydk14akp3L1JFYmlYNFpiN01JK1ZHS2NVTEV2ell1TEM1YkJC?=
 =?utf-8?B?a0Y1RjBTdStla2xLSWxKREJtNUF4ck9Rdk4xMm0vRlFVWkVKOGVzanBsc0lW?=
 =?utf-8?B?eENUUjJvSzl6V3dCeFc5UWxuYkVma3lpZ1BXdzBJd0xtM29ybGJmUFBjZUpD?=
 =?utf-8?B?Y2lRU2diOHhjdWhiZkZaTUY4NWFYNUhwY3ZPdkVLWnpqeTJVMnNDRG1LTUVM?=
 =?utf-8?B?Zmk1c3NrcG53QTZRNTI1MUdrbFRTSlZzNk81WjVwQ294MEJrMkZsbUhMZFdZ?=
 =?utf-8?B?TmFFUlNtYlBBbzB0Z1BsSnBESEIzRDBmeElPTGpTMWNoZXlBckplRmx4NGpq?=
 =?utf-8?B?aXJXQmdmVk5SZk9OOXJzOVA3aGRFTTUvV1krS2E3RTU3WG5WSE5RaUdBUWdo?=
 =?utf-8?B?WVJVN3hTbS9pNXlkY1oxRkd1dVA3VUVIQlBmN2xzRXBpR3IrYkttWERMamd4?=
 =?utf-8?B?cEhkMHc2TTU3TFBzMU1QbW1semhESGJvZU41eklHSnlmNGIvQ2szL0JlZmUx?=
 =?utf-8?B?ck1YS1MyM3AxNThGNnkzZW1JR1ZHTEVxTlJ2VUQ1cjAxakl4Z1o2cVF0ZW9k?=
 =?utf-8?B?b2c1Mmx5ZTMrTmJTWk9SNG9QSGIrQmpMSEdWMGYvckJTNlRGeGt5SDJ5bVFO?=
 =?utf-8?B?RVNZZENWWWtENXJVQWc5SVBNOXlYTGYxUkxIZWE1UFVPdUZoNE11Y2EzZUN5?=
 =?utf-8?B?NkQ3U204SVNVWlFvMEJtZzNsclYvRHcvdUNHenBlSHpKK3loKy9PRGx1cDFQ?=
 =?utf-8?B?bFRFTHVxOVNaTWladHI3ay9Oc3h3Rm14T0ZWbVhNd202VnlaWTFHaTZFMWt2?=
 =?utf-8?B?OHpTUlhrTTgvQk95UGlZSTB0WmxFajdyTlF3dGlzVk14WnlOblpNNzg5Z25h?=
 =?utf-8?B?eGF2TmxJNlk2UjE5R0FBbTltaU94NGF1YUlITFhvVlA0Ly9kZmQ0Q21pWWlx?=
 =?utf-8?B?dXZnTkRRcEN3Vlh2S1ZUMnZyeThHZmRZRXFDUGY0eVl5djZRcjFqbGlZWjhI?=
 =?utf-8?B?Z0drSzRmaXNpbTZrMlFIZHNsM0lsVHdWeDlHbmg1Q3dSdlRCRW5UaWxTUXFw?=
 =?utf-8?B?OHhGYnpaNEhxZ1NuOGhWbXJ0OXdTbytVRWM2NUtlOFY3VXhaUlNBYTdnY3lJ?=
 =?utf-8?B?NkNsQjI4RDFGMXVvcVZMUlIyRWdXVEVyNzZkcG15Ym5oSjl2SUNtZ3E2b294?=
 =?utf-8?B?bGF4Y0hlUDZEZThXVWVrN2c0TVdlUHJwT01KQlhWSnVNVnQ4ZjhUNUtVblpW?=
 =?utf-8?B?bzA0L1VrRytjQ0p3bGlERjVBeTFwTU5wVWpmUVBjWlh4di8va1AwSWV0d25v?=
 =?utf-8?B?K083Zlp6c3VXUTB2amQxaGtjbks1U2pmYlhTRlF2MWsxd0RYZ0hUNlFJUERD?=
 =?utf-8?Q?bJYNEZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akd3akVmcy9DczF6cDhNaUV4enNEL3hQU283M1NFVEpYTWRjWnAvUE9BMGlz?=
 =?utf-8?B?MVN3cmZYbDNIOTdMR2ZDRnJLUnA4SXdIaWZaYWJUUkgyaXBtQVZTWURRMHo1?=
 =?utf-8?B?Q3FadloyZjBnTzJyRURWR1JUYWJMblo2Skd1R0pGdmFML0JuVCtWVnJYOG83?=
 =?utf-8?B?cmhLSEJGdHZ6MnI1NS9ha0xJUnJ5dlRTQ0dWOW5tSGR0U3ZWVy9wbkZVcGUx?=
 =?utf-8?B?S0J5eFl2c1BBc0hKSGFlNjVQWTZidVcyYUZSY0dMUnIxMFk5citJTnAxa3dT?=
 =?utf-8?B?MlhaUVZoTHd2Q1IvS2JVNlMxQXdOSkJ5eDk5N0ZxU3N3N01UUFNiaFZUZHUz?=
 =?utf-8?B?UHZsZk9vSS8vTjUyZVJnOVc3dVJmWjlRb2RQUHlNWDJUczRWdjA0Smx6bmdz?=
 =?utf-8?B?Z2pqUU0vR0lJYWpVWkdUODhiTUE4OEh6L0hIYVJxbk1DVUlabit2endhUTJQ?=
 =?utf-8?B?UDBFNHo4cVBkZXQ5KzVqY2VGdDdDZDlKM3kwN2RaaW1hSEhmamdXZW5YV0Va?=
 =?utf-8?B?WGp1Qk4wWFo4R2plS0RVWjZBZFlrenVmSHRRaTVlQXhYa0huNU5mUXNzUGtQ?=
 =?utf-8?B?YjdaZW5WdXIySjRBcGlXaFVBMG1CS0hHUmkxUUg1cVp6VFFYTEtGaEF1bHJV?=
 =?utf-8?B?NnhQV3VPOVRxc2Y3UHpYaysvaVhFMTNOdW01NmlzSmt5Ujh1b3NURTFpYTNn?=
 =?utf-8?B?emZGTm0yZm16RHNyOGpQTXpwSjE3M1NoWGd2a2pXTVJBcmN3cERxTkhtZjcy?=
 =?utf-8?B?TkJxQjcrRkZYdGI5SnE0eDZQekYxOEhnUmZGZWdwSjJYNUFIVUZuMkt4OHVQ?=
 =?utf-8?B?UmMyWEZuSE52Qm9Ib1Bqb1cyOG9YaUR5QmFCazFFZGZTSEw4NG9vMmtqN0h0?=
 =?utf-8?B?ZUMzUjZHdHFzeU4vM2xrdlZxUXJWWGlrU0lHNzRMOGJEOGdNZUFyeGZLWkds?=
 =?utf-8?B?ZnJpZTJTVHgrRlMwcWhjVWwzcXFJSGJ1VlVjYkxnMVRCNDVJZkFCNEV3Nlkw?=
 =?utf-8?B?aW1vY3VUajhWN2FnWFdvaHNLYVBXV09rQVZoRlIzRFRoZEFCYkZHNWlmajhr?=
 =?utf-8?B?eStmNDRvdGxka3hta0x2c2JDbWFDOWhGc0xDbHBpUGpXeVNnRm1paW04M1p2?=
 =?utf-8?B?Yzl4cjI1Q2s4ZG1PQ09Fei8wMU1ESllhQUNTZkVya2hmZ21tdTh4VDF5TDlM?=
 =?utf-8?B?dWpZS3BJV045Y29OcTB1WTBFamFEYUlITGFlMFU4NUE1Z2ZoOXFPTXBvSVRO?=
 =?utf-8?B?TUwzZ1lZSjhJRG1qNW1qUHc4VEJpbmFkYTQwWCtuKzUzZmRNMWg4K3IvN2t2?=
 =?utf-8?B?V1Z5alFsUis1Y25Ldm42UEd4di9Xd0ZaeTIwUGJETElYbXRRd1FyRDgydEFH?=
 =?utf-8?B?L3BVdGtCaUZudW9SRUd0bXdJZWVaSWZCZEgvb21xQ081NzNSQk11THYwTUhV?=
 =?utf-8?B?OEVPMnlnQy9mYXdBYzJMU1I0a2JBSVpqVk5GeWdkbVArUmV0MmNVN01ROERQ?=
 =?utf-8?B?aHZWeCtYZE5YWmtLQWxJTk5oMktPQkxVNmd4OTdEalJ5aGNVejRjVmZ4Tk9Z?=
 =?utf-8?B?cFcyQVVRUFEybWRlQmVHOVFpT3RFUlIwOENjRHMvTlJ4b3lqN0lEOHYyeXRG?=
 =?utf-8?B?RGloZkpZNEVXVkNNZGdBR01vWDMxYmtuWjMxUzhKWXZNeVJuVXhnREFvZXRq?=
 =?utf-8?B?VXVySStKZUxHL3BvUkIzK1NZK25ORHE3VEpTZEZtWUFCaE4wK1Y4QVpicFQ2?=
 =?utf-8?B?cVNvVHZmTFpvUXQ4dGJMNkdVRkRWcnEwYzl2Sjd3S0dFK2VQanh4enJEMjNV?=
 =?utf-8?B?NFFQc0VlblNNa1B2bDlOOVFaVnY5c3lUZEc4eWpwUGtqaUJLNEx0N2RTMkhs?=
 =?utf-8?B?TXV1YjZHcXpMRVdwUkFJaW90ekloSkFYRXl1M3Q0Nk9OTmFZb3MxaVV1b1R3?=
 =?utf-8?B?NzZ4MDhBb3lTdnV5cmQyVUoxck4wNCt4TExqeEJxZUUyR1JzWCtWTnZmTkRr?=
 =?utf-8?B?TmxwUTQ1M2QvR2ZJUDhNTTlOZGxDekNNck1PZ0hIKzl0OVVHbHl4SlZSajRl?=
 =?utf-8?B?YnIxdVNiQmR0OUFuTFRUcndSaWtrVE1WbTVyYTE1UWRManZsMWNxclhjdWcw?=
 =?utf-8?Q?F6aeNUdqXBSiFWm/BC1RTEjTt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7F07077536715458147249ECFBB8B0E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35a1e49-6c9e-4f07-2760-08de3e8dfe08
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 23:34:30.5841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iokbZ57ZAXjNcVEa9ixnWFWaQsjIb7stnndODppCwfuNfHu49BdjY50jGXLE1Nlt6I1nzTm9DRqDjH8MARJYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDIyOjQ0ICswMDAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gPiBJc24ndCB0aGUgcmVhbCBwcm9ibGVtIHRoYXQgd2UgYXJlIHBvbGxpbmcgZm9yIGEgc3Bl
Y2lmaWMgbWVzc2FnZSwgd2hlbiBhbGwgbWVzc2FnZSBzaG91bGQgYmUNCj4gPiBoYW5kbGVkIGFz
eW5jaHJvbm91c2x5IGFzIGV2ZW50cywgbGlrZSBOb3V2ZWF1IGRvZXM/DQo+ID4gDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgIEVycihFUkFOR0UpID0+IGNvbnRpbnVlLA0KPiA+IA0KPiA+IFRoaXMg
ZWZmZWN0aXZlbHkgdGhyb3dzIG91dCBhbGwgb3RoZXIgbWVzc2FnZXMsIGluY2x1ZGluZyBlcnJv
cnMgYW5kIGFueXRoaW5nIGVsc2UgaW1wb3J0YW50Lg0KPiA+IA0KPiANCj4gSW5kZWVkLCBmb3Ig
dGhhdCB3ZSBuZWVkIEludGVycnVwdHMuIEZvciB0aGUgcmVzdCBvZiB0aGUgcGF0dGVybnMgd2hl
cmUgd2UgbmVlZCB0aGUgbWVzc2FnZQ0KPiBzeW5jaHJvbm91c2x5LCB3ZSBzaG91bGQgYm91bmQg
dGhpcy4gSGFuZ2luZyBpbiB0aGUgZHJpdmVyIGlzIHVuYWNjZXB0YWJsZS4NCg0KSXQncyBnb2lu
ZyB0byBiZSBkaWZmaWN1bHR5IHRvIGhhdmUgYSBydW5uaW5nIGFzeW5jaHJvbm91cyBtZXNzYWdl
IGhhbmRsZXIgaW4gdGhlIGJhY2tncm91bmQgKmFuZCoNCnBvbGwgc3luY2hyb25vdXNseSBmb3Ig
YSBzcGVjaWZpYyBtZXNzYWdlIG9uIG9jY2FzaW9uYWwuICBJIHdvdWxkIHNheSB0aGF0IGV2ZW4g
aW4gdGhpcyBjYXNlLCB3ZQ0Kc2hvdWxkIGhhbmRsZSB0aGUgbWVzc2FnZSBhc3luY2hyb25vdXNs
eS4gIFNvIGluc3RlYWQgb2YgcG9sbGluZyBvbiB0aGUgbWVzc2FnZSBxdWV1ZSwgd2UganVzdCB3
YWl0DQpvbiBhIHNlbWFwaG9yZSwgd2l0aCBhIHRpbWVvdXQuDQoNCj4gSW50ZXJydXB0cyBhcmUg
YWxtb3N0IGhlcmUgbm93LCBjb25zaWRlcmluZyB3ZS9vdGhlcnMgaGF2ZSB1cHN0cmVhbWVkIGFs
bCB0aGUgcmVxdWlyZWQgcGF0Y2hlcyBmb3INCj4gUnVzdCBpbnRlcnJ1cHQgc3VwcG9ydC4NCg0K
U28gbXkgc3VnZ2VzdGlvbiBpcyB0aGF0IHdlIGRvbid0IG92ZXJjb21wbGljYXRlIHRoaXMgY29k
ZSB0b2RheSwgc2luY2UgaXQncyBhbGwgZ29pbmcgdG8gYmUgcmlwcGVkDQpvdXQgbGF0ZXIuDQoN
Cg==
