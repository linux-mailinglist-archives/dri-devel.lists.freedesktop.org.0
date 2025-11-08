Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1CFC42301
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F55A10E149;
	Sat,  8 Nov 2025 01:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lq10aOUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E7E10E13C;
 Sat,  8 Nov 2025 01:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762563959; x=1794099959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=asTSZc3PwxBfdmKxD71u3lFqzVBYrTjzHZfJg1mAeho=;
 b=Lq10aOUNM4smMGF5x/FmrJjdP8YwUlOa1/qHx8DKEOn4lwTGcTTOWwVY
 bbttoWTDnKZdVJqJm4xy5ldLOWzbBwOS3UVxmsT4M4JZpVRuyZjkG/s06
 F1CIPe2/UE7jU2jDIjLGY+sEUK0CebVQdvlYryEGOCouN4o8fsStklAcY
 os7XxhGbMsEEgfkS4kBCF3tuEE2dG1FU+mkij6LgFPzVYLti8JCKyJV1h
 azepT/++SWtQzxW362zS55k/tj5Bzzo9jC2BEUI8Hlh2M6OU+u07vUkAK
 paicNCQVUTHtTOyPzxoBi9e3HXDFuV3vH2wZpSU0LBz4luLRGD5PRiZS+ g==;
X-CSE-ConnectionGUID: +yLjw7LgQRS7cY3sz8b1nQ==
X-CSE-MsgGUID: poVf/ZzaTlOzmwAANJgUug==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="67325245"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="67325245"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 17:05:59 -0800
X-CSE-ConnectionGUID: kCl/mo+kSbafwzYKJKdEVQ==
X-CSE-MsgGUID: yS7lr4u4QyGgCC/y/4awbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="188901765"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 17:05:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 17:05:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 17:05:58 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 17:05:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNkuG87jO2gvnYK0Z+xns9xIg3yHjc7MhgtPitums1Nys08aqHYKozCfhlCcOASX8M46wuMsUTZXuvinsNEdzkMsg6aCO/dt0dPiibULF1eulYQlrD0Rc5bRsPRGsmTwefJqn5EZAvwyFeYXBYwakmK2Ow434cp8Qcx2zb6wiFk+mXN152ox5UNpRSoBsEG+f6F4lP3sydxd3ezmjy0L4q1WYeoS2KQK8vAj1aFHk114SxGC6Wlxa8s9m5wrWsUReyI2DrIQqlT7o0N3y/2pCdc8+RXG+jBBUTF6vXf6FjQJOx+sUSXK1sC0BQOP7kogAmdeJZeKecovizf1VLCYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asTSZc3PwxBfdmKxD71u3lFqzVBYrTjzHZfJg1mAeho=;
 b=ks04pGXGgv86P4NZ8A5SiBi/uIMVvgULs/FPMzprgvKP4mZksThFXHtOGXNO+sX9o38qvUHuHSUaurfpN7VoR8skNdk2dVS0jspTYadr2R6ips2T3qIR7HvecoXsZiX6pVT4DU7a8Whj8BViDjmP/GxQ2LKwxzG5KykAPfrVr/lKJyMNnMjcQHM9WVABgXfttqPCvDoDEhj6mvtGEbj3TOh5JOtVIrlx2fTyDFJ8qrDW+U5dpWyPPpZoBasFc4gYfA7evhZ8Zr/50pqcF4R+IWJ/fHpi0qoD3O8lUkaMptx0xPoEU36StwzN1GkxIo4FUE59deS+BF8hA62PW2i7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY8PR11MB7688.namprd11.prod.outlook.com (2603:10b6:930:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Sat, 8 Nov
 2025 01:05:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 01:05:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, Alex Williamson
 <alex@shazbot.org>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "Christoph
 Hellwig" <hch@infradead.org>, "Cabiddu, Giovanni"
 <giovanni.cabiddu@intel.com>, Brett Creeley <brett.creeley@amd.com>
Subject: RE: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Topic: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Index: AQHcTma4AScpX+8jekK4XzUp/ut4Z7TlTUzggAAtqwCAAQu2wIABbygAgAADVtA=
Date: Sat, 8 Nov 2025 01:05:55 +0000
Message-ID: <BN9PR11MB52768BF0A4E6FA1B234E33108CC0A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-29-michal.winiarski@intel.com>
 <BN9PR11MB52766F70E2D8FD19C154CE958CC2A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7dtl5qum4mfgjosj2mkfqu5u5tu7p2roi2et3env4lhrccmiqi@asemffaeeflr>
 <BN9PR11MB52768763573DF22AB978C8228CC3A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251108004754.GD1859178@ziepe.ca>
In-Reply-To: <20251108004754.GD1859178@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CY8PR11MB7688:EE_
x-ms-office365-filtering-correlation-id: 537abc81-a245-4922-54cf-08de1e62f83a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?mWayZ+uU3+cATo4AxEU32u8dKcZEEshIro8SOVetTB1QTjCLAKIPDdkNrd?=
 =?iso-8859-1?Q?DjbL12n/MDOjTldtEFZc9F+HzvefguYWiUTjG7ub2QBGAQxIQ8wHw0Ws9+?=
 =?iso-8859-1?Q?YtcIdNirFXZPthOAMUIFpxEwY+VlkFbwHKIOv4aO5ulCbCjtU2x8Qc3RhN?=
 =?iso-8859-1?Q?P5ofRpOw5Rb/bPLqg6U/fqGXKqPAr0y2+EWMkTuz5YJGPYH2/3RO9xQTfd?=
 =?iso-8859-1?Q?Y5QG1rf0i162tqBY+BzdxU32pFBIS4pzEMrUbR+dmcNPj+l80NtIMhTL7r?=
 =?iso-8859-1?Q?svKcmyOxnom4050a1bGOe+63X9UV3GbJzJsxR2SiWtdbYNAP9U4vMrpo6p?=
 =?iso-8859-1?Q?DAjSAcrPQbc5SvdJubcLJF1SvtFxTEsSHClJ19MSQIjUz6t4FZSRp8QAhL?=
 =?iso-8859-1?Q?gHlmnZvLRBTYanIzbGem+cL4sT6ogKJZrUmpyxtKE2pP4cFJ39FcpyU2i5?=
 =?iso-8859-1?Q?woBU45XL0sweBXlWh9fyoH7Z2kAGu18xq0Shcpi7w0ybYPR85Wlz0i1ax6?=
 =?iso-8859-1?Q?R8TxWpWokuYb0kcDHsoUrvWx4kzELpIcJ6Zv/NMBlqK4vPqw2rkd3Bz8Jr?=
 =?iso-8859-1?Q?ol7AGTV5SFmOBq+MsLhf14obdfAO1fQs7xK4Gr/ayq5M8nPJjMO8otLBHc?=
 =?iso-8859-1?Q?y3yBo54UfS13YAKxOGPqz7Vyg6iYsVkT7P4AmdMxngN5mfG3y2vWyJxMbL?=
 =?iso-8859-1?Q?Xij7QlWoA8J5lRppwATcZKD0Bhhsg+8mlP2bA4bc+Btqyk+TxhKeQs3dED?=
 =?iso-8859-1?Q?K4a237lNncQGbo8JvOpRbD4X95av6ONr0A58em0NU8Hi2+XE4b5Ed+ewMw?=
 =?iso-8859-1?Q?Q8QdbEhvYK7TjGyC4CDwSv7DfBWvQykvrveNyQS1vCwBH8wZDwg1dLKTuk?=
 =?iso-8859-1?Q?SHNDZqDZFordPouGYt8P3wcT3xG6glsrFfopxMk+H5EiOgSkIz+eU9nlah?=
 =?iso-8859-1?Q?GMNV9iXOgGOng3Ksw966d8BjItD4xsVLAqGyo4aV4ffLIczGcy0bPpolAm?=
 =?iso-8859-1?Q?+jaI3woWIa6Wx+IV3uqxePVuetHQMeEgzLxRX827UG8WeT7Te0DWLGJ6EX?=
 =?iso-8859-1?Q?hfxz25YAjInHkS2q94YEQT6pwQtQkzgA2e3xKOArrtznXwxyhxxJ2SlLCQ?=
 =?iso-8859-1?Q?g68AEAbjP58MYCFWIZ11tbHEw4hs7+tdqScGfsNjc6fgvLaXQoIb57JsS7?=
 =?iso-8859-1?Q?10iCm48W2nhWWrFo1S2hMqMWcKeiVB/7RuWFit3oUH5+2SputXLYWiKWWc?=
 =?iso-8859-1?Q?F43lKi9pluHSSYWjOc1LXG0A7qUvxBmvHlvrr/90ujCHZDjjCot5JMagEu?=
 =?iso-8859-1?Q?G9DzE/6Vn+3e0gIsm57Lgo07zDsC3UAb92eJyXF+X+VuTWdLCrHZxfW+my?=
 =?iso-8859-1?Q?4SORqzCaeSJiDt+Pk6JuVaIzAR940p7YmtBd8wzMe21UICpwM/gy5qmOy0?=
 =?iso-8859-1?Q?sAsC1oXTx2EEFhfQh6SVsAMv4I+27PdsSgVlcICP9UaevPwFGQR0yC5lYI?=
 =?iso-8859-1?Q?T57ZaBtPMdFjQOgBd5Um2UZ9wdPecJb5pfS7yIL3z1JErvEI5/kleYn33Y?=
 =?iso-8859-1?Q?zHPKsS4gA9dkvsfwmk3fjlTD9ri8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZyyummOiw62j0izyob82HUOUTDYmsrVRXgaWpQXEplro5bn/t7fzrwCwwJ?=
 =?iso-8859-1?Q?KkpQvPSDCLSDYSvPjXem+RCqughdi8DnS0se26Ot1ogD4TYLSvPTmSnUxr?=
 =?iso-8859-1?Q?mOKdPTGWVVvekdbMGDQSYcRqvTFuxk32PY8p6u2nwVO3S/uCXRAF3sQi5Z?=
 =?iso-8859-1?Q?r/F12AwLFM0CktusKlvoeXYXU3etVxDBJ9ehZuuofIvm3/HmElfyBSvOxj?=
 =?iso-8859-1?Q?z5S091s6QVzJ5rr5Q8ZMp1SAnM4x+vM7Y7Z32gb/IWH7Ub71gzA+x/zP+u?=
 =?iso-8859-1?Q?XDNtVHz3WbTKjQVYALWHcR2spelTL6CunhQqJIsbK9QgSAzcXIdaTCFNKk?=
 =?iso-8859-1?Q?mfozN5KLb/DNHfFmFS+DiO9zJ2oZISL48swLEVDZULaRqt6BvHeq19ZVp8?=
 =?iso-8859-1?Q?h3QkcAE39yB2KMemKfXSNrY2K+Y6H9jYjNoNbRx/+489Nqs+oDxy0NXA7Z?=
 =?iso-8859-1?Q?NiNbDdxDOwRBhWEA6W+G42gwSQSnQc00Y/KQlh6X/Pp9aooQ7VUpEwdr70?=
 =?iso-8859-1?Q?4vHTLVdaiQnx7Is6CnLIAFHDHtptWZ5AC2ukOnyvxLAhoLj6izUZMaw1AC?=
 =?iso-8859-1?Q?2UHzugh66Xh0taJNOkR+I9D0OIJZudt7DRruKH5AfdKjLusujKIxKANUdT?=
 =?iso-8859-1?Q?qWU5HI4nXgXeUfRlB4xp9BzsDWvM0FUBSJrB3Inxlsq770iDbdHSqzReDz?=
 =?iso-8859-1?Q?tA2zzTJdPNu1P/eMyyk5J5gzauSBYgLX3N0LVWpjUq3loT5bzJ9REm7p6V?=
 =?iso-8859-1?Q?ITUedvJZH9lrL55FdJrLUWeVnWohtAGDMD8ga3nXPISXG3+/719poyIiPh?=
 =?iso-8859-1?Q?7+V0RfYGdRnlQv6pGcOamS2g2uAYqNcDnjXnG+HkFJzGR64Zkud1syrbwX?=
 =?iso-8859-1?Q?1NwpZGJ+NPOAZyzX/xhUQashAZNZFdvNk7xLkXCNuCg8Puy9lSRfLzEfGz?=
 =?iso-8859-1?Q?9JUFQhWm77saDtV5Yw9LaSPW9obHlob3vEbQYiEnkBNiQRE4a87dCztHsF?=
 =?iso-8859-1?Q?nXs1Y05A0MwLibeDC46AnUXzN9wggxna9uwgFfIlo+vMc/v8+sown4OTEu?=
 =?iso-8859-1?Q?131ui3p//8tjWcr1vOfdu2zBTU2zGYwB5YIMORY9/ahrAiRaOyWX7OpLW0?=
 =?iso-8859-1?Q?MJWdQVumPWa6icHpOI1fmoXuMWj6uOmWd7PaHS5U31ugX8FJNP/Ujp3x5k?=
 =?iso-8859-1?Q?VK7z9F14NfwtWCPUGOwIxMzC0vbAAC0fYMYStITG+XCwVCf57C5mtuHNRM?=
 =?iso-8859-1?Q?7TStth7V9iNGmi7OUIOPIwwgRVkKPrpfBDiLXzguXd2GGAPz5IuFuFDFrZ?=
 =?iso-8859-1?Q?6fCivc9Vtm+nreZdVyTHhBtNO/4WXsQJoeKxLrMqAx7bxveZSyoThggE04?=
 =?iso-8859-1?Q?n4xzuGJBk9Du1/TJzU/deRKLmbFxOL6isFSbi6gbelmqSkrYeAaT3VQdVc?=
 =?iso-8859-1?Q?+qoDdbrvTfPN3wuDGSA/zxEFtRuNEixb+zY3srFsV8AZZvA0h3G/RkozsU?=
 =?iso-8859-1?Q?ONN2W0vANYuONGvbRv55CK13JtEQrWtga+UlSSiITsNPLiquYvUwx9YsyK?=
 =?iso-8859-1?Q?YKu/NwfZ/fNHG2tROa2r1l2LsQtTG4DcDcHdchs5V7osK50lteXcjdaZqT?=
 =?iso-8859-1?Q?uX2NCxu6JbI8CxMsJsxWRdfQskf2Q+4FR7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537abc81-a245-4922-54cf-08de1e62f83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 01:05:55.3080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EvoHDJIXRLa8Hlga+U9l+bS93hRWwDFwsmK6wxz33akCYonffMNE7fDPeCO1d05xucWHpggCwadELCFpCHDAqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7688
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
> Sent: Saturday, November 8, 2025 8:48 AM
>=20
> On Fri, Nov 07, 2025 at 03:10:33AM +0000, Tian, Kevin wrote:
> > > To me, it looks like something generic, that will have impact on any
> > > device specific driver variant.
> > > What am I missing?
> > >
> > > I wonder if drivers that don't implement the deferred reset trick wer=
e
> > > ever executed with lockdep enabled.
> > >
> >
> > @Jason, @Yishai, @Shameer, @Giovanni, @Brett:
> >
> > Sounds it's a right thing to pull back the deferred reset trick into
> > every driver. anything overlooked?
>=20
> It does seem like we should probably do something in the core code to
> help this and remove the duplication.

from backport p.o.v. it might be easier to first fix each driver=20
independently then remove the duplication in upstream?=20

>=20
> I guess it makes sense the read/write lock would become entangled too.
>=20

looks so
