Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C99482F7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 22:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A38910E2AA;
	Mon,  5 Aug 2024 20:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOZKq5UW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA1910E2A9;
 Mon,  5 Aug 2024 20:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722888682; x=1754424682;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O3BmMdo2wOKQaxhCLVTSozFG7KdAJiyOQeoD3PTz9lI=;
 b=HOZKq5UWVqvWqkgxG5afvP95PPRgjrCGFXuc8VKhYN+7xvP7OllLhSIE
 iPJNUd5k39OttH+rOF8tz53krgl0fXpHgOsQy8Fxfrwqw3ZDVikB6ikpw
 Zr29MpvDxWngxAX/jthhxiLVIRDRtc4RMeLOdeALPUWYEwxFJpB6tK+yY
 2E6ecbVml+nMDjNISX1UG+kk00vKigU4Y62Ks7nA8gvkX9x62RHhtkl3D
 YclmIQfshiAHB9kuyRuLMWR7jvU6WVLwfulck9lMlCfgdcMUwMriiD6/B
 JW1W++wX/597uDakJVOu/Qzd9Qsp/iVXEHyXkqE69/8qZifYWFpurmtOj A==;
X-CSE-ConnectionGUID: i5z5+X1VS7ervhRvvIq7JA==
X-CSE-MsgGUID: 4P6yJdrMTUuHObpyWIe45g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31508852"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="31508852"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:11:22 -0700
X-CSE-ConnectionGUID: escRvDcEQ7q9pXDMJtkhLA==
X-CSE-MsgGUID: Nvo1jh7GT9iJLLmypx0pwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="61127282"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:11:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:11:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:11:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:11:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bivJBbmyfBU46UWSvvzn4PruQRj5AWdnt8D6IULLj/gwwVKnPpeMGZ+I+oH0CLa6PoxIZSZOAT1pbmHGeZB6vw6eQPT1mIrElR58ki6a04IjGIhcjaQQYrwIzV9C899E58NC6dnskLmcBLp++h99BY65ia4be21UZSH7imcCQsJBBD1D26Asrx89nlsa9xRROo+GDgRGRyMijahft6Y0/ExQjfUz4iFZM6zc/tzKtGsCusvpd3A7mdVQaO8IewGu/70ZVmyzi5I3GzPksu4REdCPsUlqqysKGoRDTSjhdLBRGeGIvveX825TCIFzzgsTB5QuD4Dk3kTfibjGK+lJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTZOfRHALYStr3mUT5SVbUNJvBfuZhDphCluJngmlXg=;
 b=jLoZ4izsypDysvwUGrvN8fhRHJr1hZ3wYN5dsO+v5S8Zi1gDamsNQfSS8yuUOQtFrUYVTPtqqhexQnDNJw7XkuQvxrvkspP1gqdHezcko1Acuj0hqgEtGOAesRTTsW4UNJNdc+087g6HnksDDqHIT9JgZY5mumuTOjjm7/I1XMbM1Qn3+s2H/tfzYo1oLtvZSM8IGSLzlhiZPVc9LDou1HS+tteuV0DieMrXAGeENI8k5UYJ/4FWxAnGT+z1YoOL1XeF3ViPPbCPlZPCefQiLZ33fWtvs5MAaD0z19Aw7YaCistMJEUjlH0KsgnYlDsFyCkwqV5XAUXJT4mkHmJU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 20:11:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:11:11 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: David Gow <david@davidgow.net>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/i915: Attempt to get pages without eviction first
Thread-Topic: [PATCH 2/2] drm/i915: Attempt to get pages without eviction first
Thread-Index: AQHa5088adqKaO8meE+YWWKGspJ6prIZGElg
Date: Mon, 5 Aug 2024 20:11:11 +0000
Message-ID: <CH0PR11MB544412FB2B166632F4517535E5BE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240804091851.122186-1-david@davidgow.net>
 <20240804091851.122186-3-david@davidgow.net>
In-Reply-To: <20240804091851.122186-3-david@davidgow.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6319:EE_
x-ms-office365-filtering-correlation-id: 109bfef5-c4b2-4957-2d43-08dcb58ac062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?hRyA0qOD6Y/kJwePqd+z2RgQruHebmIB7DIxHp9kRlkBH0fxRARbCEcvkk?=
 =?iso-8859-1?Q?jJ2aIm2W4d0bUl5MK9wTR7fNbxrLyPVjVM4mQSe5BQ28VPB2QW/o1T0Np8?=
 =?iso-8859-1?Q?Cyv6Q1vo5tihRveyXBha2LXm3LotTDfos9ZhlLXoAWN6UsRyyVBeFkLafC?=
 =?iso-8859-1?Q?fDYAClHCeDeyFaULrhmEzvbDJxR7/LR4naMrJGY11AjpxdfA3HNugVhkFt?=
 =?iso-8859-1?Q?U/OCJoWkzW2JBS8x0wlD9/dEPKp5Lt6FTH0+ZQl/7pFKIoyIeFNH8MKa0D?=
 =?iso-8859-1?Q?JO7Dl1LhzYsIjgm2IOO2AB/rlklTeUVvqFsaL9g5BBfhmmyRdDl4PhahfU?=
 =?iso-8859-1?Q?Xrl+eHxYO2kK1haxDW4vWvTSCbJn0ku3+RXuFSZua/xaxzGsupK+Kcq9iu?=
 =?iso-8859-1?Q?y8kPV2l0iAYMl1PdXClmrXg7bzEgpx82hHCo9lNMQl/IOCs04VEfhWIOYE?=
 =?iso-8859-1?Q?Xb509hvGLc/F54fefuVbo1DCxlBnjGg/hUS/EImxwi2YEJcCMRpd+A/jto?=
 =?iso-8859-1?Q?Esgk6RgOSyNvpZp5Vu7+KnDgAtWcIZ2/qZ00yCJcdS5B54T1nYUSntyC5o?=
 =?iso-8859-1?Q?i7pPhH2au74ZDOATmyiU/GxBUCtrarMDRZdYfN6vNCLwztSiX+bbwig+Uj?=
 =?iso-8859-1?Q?WQvKuKQOnetMOOgwmw9OCTViisfT78XUEyEOWQwklX14qI3TC1uJ9x5nBu?=
 =?iso-8859-1?Q?N58+4soqMTTsvcHef6KFsqi7biErFa/Oh8COI5chtQ8R/i6t4GSbECe602?=
 =?iso-8859-1?Q?i9MNS6G3Y9HtQ3AOcqpHtX50r6zO5n7ljxAcneDsT4nCBvk23m66d4Hvuv?=
 =?iso-8859-1?Q?8QQG3Zu865c1laEwEHWn0S17SMrhZREXqdvAK0li/rFTgBLgKw4witW7nb?=
 =?iso-8859-1?Q?gYLOV32jxQxIkxUL5tjDIrPcu6AGAq21E5S7RHlEBjo/53+P0shHpf+A9N?=
 =?iso-8859-1?Q?6TuywD2jlRYmcYL4vS7hhc2+ts9pRGp/UveCSdLJ9sToEfoTDwvHOfc+LE?=
 =?iso-8859-1?Q?0oe3JJkKr3H7aZ4L8A0C9HLFtl5mIBF++j+6netSVRs54NTu9zeqsXifF3?=
 =?iso-8859-1?Q?eD6xB9xr+5aFTdGC2hy8n9Vpk/lTIxtyEeLF3eow/ycsr/ET3VkKl824KT?=
 =?iso-8859-1?Q?sDz13+VHtA/Muxk9/UkYt4m0Yvku3wRYXrVKWVDwFI4vro4/lXmoSXGN0Z?=
 =?iso-8859-1?Q?uKYPrVhRbpON+mxFIgg53wjy5VcsGbbF0aeYFQM/k46GgxsAr6QwAdT+e7?=
 =?iso-8859-1?Q?CuJbaY3s4HZvRXzJwUr3Mylf3a++O4v6M4L+441xG+Ypzckf3cr1Vifq6e?=
 =?iso-8859-1?Q?PiKNidwYQf5VxQP/DIizZr6aQ9k65KELZC7HRqKJcpkVitF6a0oJ4e3tGq?=
 =?iso-8859-1?Q?CYxjLtOKWN6i3rt+xTj8ATApiAG4v/8K56C2cFJz2AjdMIBxATo7A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?S5fQVq6k176eAeFFC7UTDNIHE8NsiqLsE8NtQqit75kmhKu2+J6CSqxuDg?=
 =?iso-8859-1?Q?Jp6otmutvV4Zl5WkBHPOAp+CHRMMSdhl9iztI1SdN0GoMUW0VyMk5TP8hL?=
 =?iso-8859-1?Q?Vyv4Jw72kQHPbJIsRqrd1Qw3+6/AVmdmZcXZJgg99+3uf+Gg9Uq0WhndX0?=
 =?iso-8859-1?Q?palGGBG4srKds4lXN45gwLWm+50V+l9YI+oys088yavprRtH89DCPndSJ9?=
 =?iso-8859-1?Q?NLm1HfFUi0T8bJzDcWESero6o551gBCQR4su0f3XdJQoi93EMp/bVo6zsi?=
 =?iso-8859-1?Q?XFSVIQxlhi4vA6ZgCdyhPYQpmO54eIH6raPTryUn87l6ictuDlhEaNntTm?=
 =?iso-8859-1?Q?5pGixkLISFx28cU8agH4auB2tmXbLsxnvWI46j6v7wza4sGj4kNpaHsybl?=
 =?iso-8859-1?Q?8oSNW9q246tZ+l5bLvB4ekoqN0Lvwk5uMr7FQOm9zEcZpPe465mRiqizpD?=
 =?iso-8859-1?Q?m3yOSz4jKUkkfErR3jR9/NcmfSKvNxAkHTZIh9VQxEQ8QKSBbgqw+fBddg?=
 =?iso-8859-1?Q?Ym+Sk/ZtjH70H0ZrWEohShF3vFEOPBRr6h8O3M2L8myKOa2TYLrbOAeNW2?=
 =?iso-8859-1?Q?zLDHJHpS6sB8IPiKWPalEGjeDGtOhC4KdL4tj5WYZ00pWQy5G+cQtpNp5V?=
 =?iso-8859-1?Q?anx4JAAWgbWwsgGSYoGZFPQy5GX13492qF7KPG27AGhaquC/9RnX12Im5K?=
 =?iso-8859-1?Q?pgoqQghdfzuoXZ9KKUUy/TQb51c3+9nhEV5OeQgau3mDeArcWCQP4qB4zG?=
 =?iso-8859-1?Q?f2+Pa9XyPT3fTY6xb1/pmNN4LKCNUmuB1MdxmNRK0mIEQsliYlLwiIvF5o?=
 =?iso-8859-1?Q?Hs7nmP/cKyghCbQ2xIAzu+qu7NDULe1U+xqppil4ZHL+Tm6e91Jsz2b+Rb?=
 =?iso-8859-1?Q?Oj1ulE7mLYAWV0P+SCGfTYmh3BrhBam9Cyx0H89zTGRBYZEBRPYgH/c/3e?=
 =?iso-8859-1?Q?dyu0iom8X2Ry2F4+CEjVg/0thbqi+TV4P9z9+1k+al9f2eWvxv9vaWocKX?=
 =?iso-8859-1?Q?akmZYe1mcBH1vY4Be5NiJDMJH2FhfGCn2hYLZrIPWlS+By9sQTdcQwM0jE?=
 =?iso-8859-1?Q?wVgKO7JYxPvY2wMh292A12e18dekFohGMaS1tEKYRhL0mUnJOax0BXM9+D?=
 =?iso-8859-1?Q?DAkZBtgGhc32k7kHgMbqBJfjARBeLuJdvpKWC/5whTEVnbzkstoI/97TfU?=
 =?iso-8859-1?Q?oGMM3nAl/YmAwRYrNTkoCcQV5fZxS95akllSWNHvHVVjdmdwYrO/ufhPjQ?=
 =?iso-8859-1?Q?Kj26Q8bYHA9U3XonimLKOBp2/4wRlcPnFhzVrke0aDyCAcc1s7tApk7ogh?=
 =?iso-8859-1?Q?PnPGn+CgHGRXwsWqp42bgqxsSBNBfoEuu9H15Wqv7uIB4VXQ0xahdK76ky?=
 =?iso-8859-1?Q?lEBVq7sHy1TQ5VbEaqGeSdDsUUI0A3MxcoluK01n/OEOmuH17740cfp1xF?=
 =?iso-8859-1?Q?9Dgw86vrASu3eZNlaGXTL45HxVYy058s7hNZyw41PUK+D5G9UNqChai+81?=
 =?iso-8859-1?Q?KwE66FFDPQEOfU7tSGfBXCv7vInu4t+kic/bvOf5VARq4nN5AyJk/KxmeR?=
 =?iso-8859-1?Q?NqLlZR3BSypFs0Y5q7wpTFyl5G4JbVAIkpSGFRidps3j6TGKgkaxUnod2L?=
 =?iso-8859-1?Q?5BtmO9LLF0D4yayPv3rLKlrh3wwk9rY92A?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109bfef5-c4b2-4957-2d43-08dcb58ac062
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 20:11:11.6950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6VOdSywLv0qwYJrNlT2SmkXnkNWjDZqSwXs/RPbzSomIJjYQqlG0BlJcJPogeOcupgH+hKrHYmOktAZM2bYoXNeSo9fKo8Ac3Q1fcd/cgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
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

-----Original Message-----
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Davi=
d Gow
Sent: Sunday, August 4, 2024 2:19 AM
To: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>; Somalapuram Amara=
nath <Amaranath.Somalapuram@amd.com>; Thomas Hellstr=F6m <thomas.hellstrom@=
linux.intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Andi Shyti <=
andi.shyti@linux.intel.com>; Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Gow <david@davidgow.net>; Jani Nikula <jani.nikula@linux.intel.co=
m>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodri=
go.vivi@intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Ville Syrj=E4l=
=E4 <ville.syrjala@linux.intel.com>; intel-gfx@lists.freedesktop.org; dri-d=
evel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/i915: Attempt to get pages without eviction first
>=20
> In commit a78a8da51b36 ("drm/ttm: replace busy placement with flags v6"),
> __i915_ttm_get_pages was updated to use flags instead of the separate
> 'busy' placement list. However, the behaviour was subtly changed.
> Originally, the function would attempt to use the preferred placement
> without eviction, and give an opportunity to restart the operation
> before falling back to allowing eviction.
>=20
> This was unintentionally changed, as the preferred placement was not
> given the TTM_PL_FLAG_DESIRED flag, and so eviction could be triggered
> in that first pass. This caused thrashing, and a significant performance
> regression on DG2 systems with small BAR. For example, Minecraft and
> Team Fortress 2 would drop to single-digit framerates.
>=20
> Restore the original behaviour by marking the initial placement as
> desired on that first attempt. Also, rework this to use a separate
> struct ttm_palcement, as the individual placements are marked 'const',
> so hot-patching the flags is even more dodgy than before.
>=20
> Thanks to Justin Brewer for bisecting this.
>=20
> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11255
> Signed-off-by: David Gow <david@davidgow.net>

Thank you for the thorough write-up of this issue.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index fb848fd8ba15..5c72462d1f57 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -778,13 +778,16 @@ static int __i915_ttm_get_pages(struct drm_i915_gem=
_object *obj,
>  		.interruptible =3D true,
>  		.no_wait_gpu =3D false,
>  	};
> -	int real_num_busy;
> +	struct ttm_placement initial_placement;
> +	struct ttm_place initial_place;
>  	int ret;
> =20
>  	/* First try only the requested placement. No eviction. */
> -	real_num_busy =3D placement->num_placement;
> -	placement->num_placement =3D 1;
> -	ret =3D ttm_bo_validate(bo, placement, &ctx);
> +	initial_placement.num_placement =3D 1;
> +	memcpy(&initial_place, placement->placement, sizeof(struct ttm_place));
> +	initial_place.flags |=3D TTM_PL_FLAG_DESIRED;
> +	initial_placement.placement =3D &initial_place;
> +	ret =3D ttm_bo_validate(bo, &initial_placement, &ctx);
>  	if (ret) {
>  		ret =3D i915_ttm_err_to_gem(ret);
>  		/*
> @@ -799,7 +802,6 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_o=
bject *obj,
>  		 * If the initial attempt fails, allow all accepted placements,
>  		 * evicting if necessary.
>  		 */
> -		placement->num_placement =3D real_num_busy;
>  		ret =3D ttm_bo_validate(bo, placement, &ctx);
>  		if (ret)
>  			return i915_ttm_err_to_gem(ret);
> --=20
> 2.46.0
>=20
>=20
