Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4402955467
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 02:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4583910E864;
	Sat, 17 Aug 2024 00:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoSXmY9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867B710E864
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 00:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723856068; x=1755392068;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sySiTehg2QefAjgs+GmyZv/GnUusejaswhxp+/Ox3dA=;
 b=EoSXmY9+bfqtGJjwuakzbIowhB92kaEOmTdDHbYTB9IW/W+lNe+90z99
 /LE3GjJsVp33hUbgDYlS9lJ6e8Wa2KYe8ajIZF5/SqVDKfVjoaYlILdBr
 6gLq8fVGoDmaAoF2b3GZc8/5a3DGx+rGMT4PgmlUsQbb19fgX8AkyAjPF
 VLGHJeI+CC7H7xPINEaJ9CnIcxxAaHdMYZDiJj8EIa26z1TCiHsim4UfH
 XQZpRVENIM4Cb5/+KAnE2rJlJrPrS/SbJ0U3U6zVNhIuG+GMSlJg0ceGR
 wgd2l5rezpizX4bD6/uBhLTj9DSdxcIHOwg2vK5FOCG8dxo5P74jHSP0f A==;
X-CSE-ConnectionGUID: 5p3wCZmqSl+SVKIa84NE4A==
X-CSE-MsgGUID: MjrBQW9+S0qTnApT4ONpVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39619193"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="39619193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 17:54:28 -0700
X-CSE-ConnectionGUID: VtwbRSNvTHmvG/5cQYyE7Q==
X-CSE-MsgGUID: yajvbRueTh+c/sKR3PUDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="97331477"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 17:54:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:54:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:54:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 17:54:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 17:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx0BwqlLwpQuzh10a80TbQtjAx8QExQiU6Ikv/UkFvMVY0b+6mf/4H2whyjHuVoE85vDUCb5EkSlFvmaDnIxPTTfddtOwxU8teUKTyYFNJQHPKuIMHAMRHA7gqTlIQJGvx/JVDYbB5zGZCV2h/D8944PKksk0+OcDD2fChDCn42XUG4XVn8/cdWwhBfE/dzR+qcbJ0qafogTF+SF9OADS8AzvDy+QM+BT3hM++ve6XzPtG/kXJnLZI5Q2U5PJU6uZiR4q+/PQwKJY48gHX98z1MckaTt/wvbNqNUs1+yYafVfPxYtEvB0vsinBgvJsCLftqJ9ThDJ/oMWqO0rR1fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd8CilbZMN9l+l72GfkMkDXhYX7dpMesw4EiHk+7xHU=;
 b=DkwRxuResjcAFPNwlOpH94yUrkxN0wTmlEfMJ5i4eiJQyMhOV4011JLEP6l2n5VR5x5DSzn01OAwNXFE1rtJWtp0A3fxNYN2w9vyEtpbxKa+EDRm/nUT3gk6rLHHLZhK3xNF6aQ27VpCNdOrttbhDD2cCwCBTvaFoCMrsJkEtlyIPGDSLLRsniYe4+2FdmIxfkk/FGCa5vTInrAWGJNnQ3tTg0457ApFG3NH/yAf/pLY8wxY2bUSwq+Oh4eTezoDo9Xu4CeailpM1aPmFgN5GpXabFgLrnucMdH2VP5XMR7Ge1vxVw5k8iXn6aHowng7xQqeGa8EMhXDTjCTthrvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sat, 17 Aug
 2024 00:54:26 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 00:54:26 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v3 3/5] fix vmap_udmabuf error page set
Thread-Topic: [PATCH v3 3/5] fix vmap_udmabuf error page set
Thread-Index: AQHa7WAKQG36yKcqy0iSYfv60EWbqLIotJwQ
Date: Sat, 17 Aug 2024 00:54:26 +0000
Message-ID: <IA0PR11MB7185465DDE79BC8DD84B8BE1F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-4-link@vivo.com>
In-Reply-To: <20240813090518.3252469-4-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB8141:EE_
x-ms-office365-filtering-correlation-id: 3587d956-6eaf-46f4-a5f6-08dcbe57246a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?q2IN/shoov+uhBB9DNpPsuUPUig3qefbW/clPHokN+0rlP0V7xln9vH8F6?=
 =?iso-8859-1?Q?E1Nyay5PL5CwOS99c0Q1c1Bv4KeajRMHCKBr7Ds2NqH6SPEpH4KNS54WVq?=
 =?iso-8859-1?Q?n2W16zsJQB16a9U7nYJRoau1pgKOX4fI8uUNnFzdxShYVf9IrIuZCZo5L4?=
 =?iso-8859-1?Q?O66FCdYm8BKf9CLNLXyFJfphNdVpREaoCd4aSZsSOTL2n6fH9fm+KoEKDG?=
 =?iso-8859-1?Q?6g1U0iCmss4aBKymxw3uS7xVRuQdaItuZ2K04IGG2s389zBd1nRsYb3NNL?=
 =?iso-8859-1?Q?LFvX3NDnwZs5BWnjaESwb5tDnK/UloubCU3yGwynScWtqbxONdcdj4p1yS?=
 =?iso-8859-1?Q?E/MH14EDVJ9TJq+UP8h4c5PlruJL+iQVMl5IyYL9PnVOrYgI3lwRYjSpEO?=
 =?iso-8859-1?Q?UNggI+wRVuM4BCDNHvz+sPzBtKogNlD+jjJ908ar7gDLsxt6PS9MPCHsMm?=
 =?iso-8859-1?Q?jBRRe3fqjgp9PlsQD8tyMEj7g6J8m8EyTaUCp6/k7IATM945XWQSnUSRcU?=
 =?iso-8859-1?Q?I/HXCIe4EPu1f/o05eRzXC5ZiCOCDksO5boWm2NUzUnqnAFqn8m3fIfYR9?=
 =?iso-8859-1?Q?Gwdtdxccp4T2ys+CDjyHoaFjYkJt3Dc//zRmOBfB/QFeWQLGOMSiDLLYT7?=
 =?iso-8859-1?Q?q5IXvtBVYTxc+vfD4VUIDt/AiuY3/LBg7negffG9VkGmV2stSQ+XT5UHQV?=
 =?iso-8859-1?Q?XOsq6DiD5kymXNQvCnz7L6f+fOhdVlXVGMWuRuM3xZxM7EEMFfsIajYhGI?=
 =?iso-8859-1?Q?0Go+sJorlaPzMMLHU0UpUepeWnQf+jkaecZ8DDQh2orFLln5QAx7wyFvot?=
 =?iso-8859-1?Q?2tMGir1eA18hRU6a8MH6JUxr6kd/StJWz+lrZtNRixmAwWX9KmPtWonSpy?=
 =?iso-8859-1?Q?W1+QaTE8az6RruWux39oHwR/ovv2vtLh2C2hbi2Pf68oWu97MLKD65Izy6?=
 =?iso-8859-1?Q?hXHYI8vNj9pKJ2qpZQ5g8ukVOJUD4awXadFzm3/GxB1H5zoErtVLBSVOGU?=
 =?iso-8859-1?Q?Faf6p/yNSb5aelm43Y+bYfeSAZOrr0ceDtxHS5LTkiBeAAmJjaqhk/HUl3?=
 =?iso-8859-1?Q?gIdfXBh3inMGTKcCzjy2vGlPXdBZ1UMzlJ/lowEGnXK09gg2HC8anbgn28?=
 =?iso-8859-1?Q?x3FOEJJZE36VL5CDGjxO/BtdIQtWFZsYDfhCEE/is1pCcun6Fz2wrcZw3b?=
 =?iso-8859-1?Q?oQUpLYJ2E4aAUKsZuHZoU+gbFkkBXOWrpnyQMnCBcAuwixagXevR7UDd+t?=
 =?iso-8859-1?Q?Y5Nr1+cxuy+HlAb3HVFdCcEYM7REf3RS9flyLiTh4H/MQfC/xgzhE09dTZ?=
 =?iso-8859-1?Q?Vkf+zCMdk5L0qDbV8rl/1YdneZi4W+t5KBAr7MgKBUENdJlbTXtYM/BqQ3?=
 =?iso-8859-1?Q?ip37+5dFoIigZBFkdHLbrTBbbkU99Mjmbcpl1kqAqOrfXaJ/oSKOagP3HH?=
 =?iso-8859-1?Q?OzPmW+p02xNxPGlaNXEjI1x8yep4wSujkCR5Rw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1qRIUrzpPH9sqO8vLDLX/KV/Tw3iLsJEHZSSNdXxSX8guTIIqVZRdI/O3n?=
 =?iso-8859-1?Q?UnCC2O7V9LneFPZK3KWBSduwBpmYQeN/+2nfxlwAsQjIs/SpPQXHjquiMP?=
 =?iso-8859-1?Q?nPaZGtKwJwd+19t9iuh+igBq4Y2KudH3pbQvv3j7YhRZlGc29mrHkr4z2D?=
 =?iso-8859-1?Q?8tCMIkFE4dw0wvteg5LwjiZ4jHIGelpHOaBAiTgZ7IeG1jfFBv1oDxONuc?=
 =?iso-8859-1?Q?jWaNBZUK6uBaDmk/VM/HJibcYFCjC5k06CXBwUOTvN3dxWsyIbsS99TTHD?=
 =?iso-8859-1?Q?8Iv8uuHugtRKv25U3/tkzaVtftnV83HmbZbEI7/1SM/pX+PiNqs3jMVnet?=
 =?iso-8859-1?Q?d42kFWQMaDtMJV1DpnyijTKYzVGCPJyC71x2guVqp340QeWbYZM2vZN0lq?=
 =?iso-8859-1?Q?/IoX91JiBDBEUC+trK3DyjyfZScz/cDU1PRvFV7mNY8FUWFFgFY0soQLHU?=
 =?iso-8859-1?Q?YMTnYff36Ayq7KGtN7I4EWOtN1aNpsZe11HfyV9V//49qKWq23x676IGhG?=
 =?iso-8859-1?Q?PakjaLifVorNGEvNdkFPDZbZxRMOQHR1pXR3X2tn+1emJiheUpESaSvIzx?=
 =?iso-8859-1?Q?AAaJ5+5Uh8hS/r23bGGPwUBOvum73eqBzIPxBAcYQ0Vgs0Kn0iLeOT7r58?=
 =?iso-8859-1?Q?DVyjbWOyjDPXvRhyfQNb+NBBehcQR6vqJBGnxVZ5KCLfYplcvvTQWsRJ8j?=
 =?iso-8859-1?Q?XENHI3oWh9rdydiZa2+a1J1p+X/D/Xzy2qrq0xR9lk3iiiixrfdMyOENUG?=
 =?iso-8859-1?Q?umx0jRIjZFAxrW/zHau6OEww1nwOQpzsPUeJ2Yav4UV5fo1kVEfmtRU2Je?=
 =?iso-8859-1?Q?PK4vY7xElcEvevM7nE/DQzvb+W12WsawdSwK9tgMq3uSBER8VgdciRMLgm?=
 =?iso-8859-1?Q?YGQ+2fA7lbdBqyQar2f6XyGSJf1qoXh/AEaXmC8L4ISyXoPuprVbXYj80u?=
 =?iso-8859-1?Q?U+pbl8agIUvE0etRW/C3sDG8M2J9coBIepeSRP/vbjL/BtYy2c38OQYvAq?=
 =?iso-8859-1?Q?1QXnxpVf9K3sd15ZcvDGobsTmuuD35wBDb3MtoeFnk9UArQmyqg0hHjLIT?=
 =?iso-8859-1?Q?4EbOei47cMGSF6ZmLu3cJ92TGcOR+tAl72hYa9hsdo0S7speJzy8TBrM9X?=
 =?iso-8859-1?Q?mlFsC9If3Kuo724VZ4jhAUDqMWwAz0/XWJzxNWPKUc92rf54pBPKQ88jEc?=
 =?iso-8859-1?Q?HmtC5avSr+fTijd2GlfA+fweHnEbkkqCEFPDdAnuUBoEYMv99BYuy2piYt?=
 =?iso-8859-1?Q?ZfhCK6B/DxQB7ypD625puKgGXotLhzapd/Ye/8d6I5lqmopv+fb0PzKeeR?=
 =?iso-8859-1?Q?gU+wDwZxoQI2/qSg38WYgGbVvUwFoXnP8oXhru41SZqMx9O6cPAWiE/NZJ?=
 =?iso-8859-1?Q?qG7j/Qvqy9ko5sy8y+hxdiTkcxsGXrxEgImLfBhJ9f/Jl2oYhuQ6sMqf+8?=
 =?iso-8859-1?Q?olLH0XG/Pn7B446D00ogUwNRAWV3TpQhKU8J3dV062SAgn3Nj6nEJuLjWb?=
 =?iso-8859-1?Q?li7SROms7gQNjk+CC0ULHQrtBg+SBVstLZHX/RZPmLmcYp8RV8qF/HaLDT?=
 =?iso-8859-1?Q?5fzokPVkRUDc8ihpNA5FcdrhD5IhQ3O4br7nbHP34U3cMu6UiB+VFxmdXt?=
 =?iso-8859-1?Q?m4fYr+VKGijzKnl32Gr8tvM/thJFmNdpQf?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3587d956-6eaf-46f4-a5f6-08dcbe57246a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 00:54:26.1960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYUXjw1iYLD7fHnKZG6Ze4HBX67865iARORtAZeBSCJ4tX8qx5ftNJud8WWK58dOui5tPRnHQWd1SKXLBWyEUouRFhIGHvHmWTPSQECZkdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

> Subject: [PATCH v3 3/5] fix vmap_udmabuf error page set
Please prepend a "udmabuf:" to the subject line and improve the wording.

>=20
> Currently vmap_udmabuf set page's array by each folio.
> But, ubuf->folios is only contain's the folio's head page.
>=20
> That mean we repeatedly mapped the folio head page to the vmalloc area.
>=20
> Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
> so, we can't use page array to map, instead, use pfn array.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 3ec72d47bb1c..4ec54c60d76c 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -67,21 +67,29 @@ static int mmap_udmabuf(struct dma_buf *buf,
> struct vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct page **pages;
> +	unsigned long *pfns;

I wish there was a way to easily test the vmap scenario but its great that
you are able to eliminate the usage of "struct page" completely from
udmabuf driver, with this patch.=20

>  	void *vaddr;
>  	pgoff_t pg;
>=20
>  	dma_resv_assert_held(buf->resv);
>=20
> -	pages =3D kvmalloc_array(ubuf->pagecount, sizeof(*pages),
> GFP_KERNEL);
> -	if (!pages)
> +	/**
> +	 * HVO may free tail pages, so just use pfn to map each folio
> +	 * into vmalloc area.
> +	 */
> +	pfns =3D kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
>  		return -ENOMEM;
>=20
> -	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] =3D &ubuf->folios[pg]->page;
> +	for (pg =3D 0; pg < ubuf->pagecount; pg++) {
> +		unsigned long pfn =3D folio_pfn(ubuf->folios[pg]);
>=20
> -	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> -	kvfree(pages);
> +		pfn +=3D ubuf->offsets[pg] >> PAGE_SHIFT;
> +		pfns[pg] =3D pfn;
> +	}
> +
> +	vaddr =3D vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
Looks like this would require a "select VMAP_PFN" in Kconfig.

Thanks,
Vivek

> +	kvfree(pfns);
>  	if (!vaddr)
>  		return -EINVAL;
>=20
> --
> 2.45.2

