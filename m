Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0596ED90
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07410E9AB;
	Fri,  6 Sep 2024 08:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbUHBb6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3175310E9A6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725610661; x=1757146661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P5Q5xKhc61vlKyXviOwwnIuxHkLQcQ12N0w4+y+s60Q=;
 b=dbUHBb6qBpJfSdPuxq+x+VOa6ytcFHgZEJ3wclzH69ySIqDopyTnr+18
 Cgw4nCkR/f/SEVnVF5v+CBljL0vQf46HL/VSD7gNduBeUaZEImMq1U3uh
 Jbnu6pGHoRwnOQrNLcXTZs7grWhWh4yP9F8eNW8q5j1m3UY3IwuERKGjx
 EUGOvpuyfbiePxn8SplD5hBMofK3vY5m0ADuyxQbwRPDWVIeO9bCm0UYR
 l9YnUhfoCm/8cuy5BYnA5v2TvdUmQdYpCSCJi/85iybwldg0uUq+IZcos
 ZMi8wNiR/VwCCDdDGrOenxRqh64As0mjq8SoDNOtHiqAqZM5Z6v41OOaj Q==;
X-CSE-ConnectionGUID: 6aDUYRr8Sw+ANDiKvL9ptw==
X-CSE-MsgGUID: IbK3FAz4SM6jqyGUNAx+Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="13405620"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="13405620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 01:17:39 -0700
X-CSE-ConnectionGUID: QADiHFkURGGzMrU66WrQ2Q==
X-CSE-MsgGUID: BSyyXQUHRHuqLawWIihMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65706210"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 01:17:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 01:17:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 01:17:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 01:17:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 01:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc2k/xiPVhNe1QF6hho438fswiUyHTa9vS/coA1UlXhK9/SRBk7WRibpOXBWsnHbJ9y9oMlT02tfqgYjGIcaCXLiTn7imw5FiPxKKEETRee1Ywqhi3/FsI67qsYc5uz+uTtC759kbPwK5JB8nK4eIHa/mnFJRBrdOR5WnEF4kICm/tGUpPkKrWQXqZLpfdrfrHhAhra7/ANSNSXIH2GHJaY2gerNZ9GeM1M3rga8yKDttz/7S29TZDoCEsK9KVF6PS9mOgNK/otMBd+l/mdSK6xrxhFsC3cJ7MAHVMlpRSc/Ap7wnspvXQ3YVzrPkXth4hM9lDryfeMOtwvZ0/0e4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2xqzMljIfgXcrxZRZC/LokhcWWDNdJ+m2YbBBMacXc=;
 b=xHZI8gmeD1eGBknT5TLC7DOLOWPkRJb26lQjwO7Uq32eaRyoiqyGWkEJydVjfpnVfI8mMjpuC/83YY8HRlFIxOJ7sf6hp2vy4oAvSJPAMtUKOcevLVOvyzDT65GM7S5+b9VPaMpvghfainE9GI0EJ1SH7u+tlgFRXYCTu6/AAsemxWp4pg7u7xJBFo3YOOB6P1nHuFFi8yThJ9zx1J5cwsVdR6CmrR8uL8GvkMtJRi7yjzrqGymX5hssNnz4oUBYgeHmwyu3mtvNfeq/I/OGXvBZJDG7OyzfACTbKOECOP4gBxegnIClIJHrPMXx5fURd0fdJhpqR7XSFsLx5MnPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 08:17:36 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:17:36 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
Thread-Topic: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle
 cleanup
Thread-Index: AQHa/d0l2PFrjUd2QESgNcp6qjqyJLJJdJ3g
Date: Fri, 6 Sep 2024 08:17:36 +0000
Message-ID: <IA0PR11MB7185AA974CF7207048178187F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-5-link@vivo.com>
In-Reply-To: <20240903083818.3071759-5-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN2PR11MB4678:EE_
x-ms-office365-filtering-correlation-id: 2bbcc77e-4c6e-4d8d-1f9b-08dcce4c5da0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?7t9Gm8KuBp038DSw07RS8ZgbdaH42X5BIISFm4R/9/a5q6eoDB1QJuB5cG?=
 =?iso-8859-1?Q?H6zKwEPkN+YO5cVgc4ZH5/Ol16oBPfhX4gMOjhwGPe5U21ueNvj+bPfYu9?=
 =?iso-8859-1?Q?I7XGZqBJ7VahbIcA4rpYdsQBVIL0pnlD/NnLrH5bRktKGc77osp3vR4PVN?=
 =?iso-8859-1?Q?ymIlI7pmmI/rJSobXbcg9fUxy6+Fc6DEUWozpXwRhY1xbPDmFo8kAAUjO1?=
 =?iso-8859-1?Q?B4wvy/4uzsYlAKAWLdJtZdAv/jyOLIrK0VMvYrUMx+QG94/VLrDruSZrpO?=
 =?iso-8859-1?Q?4bQHIFW7Ebf7M+vKwVeYeWUE0Es+MIDACLo8atffNyMWh7ZA9yOWEvS45k?=
 =?iso-8859-1?Q?IpbghdYXdoX3vLzHGjvLq40pMfLdizwbQtlfOvbY7wOlRYLpPqdfOvlo8q?=
 =?iso-8859-1?Q?rNRkN1nlB1bIoF7bZSdGCX3LSh+i/ZzxrCf5tW8eeYPWzXLx+Wrw51lDcP?=
 =?iso-8859-1?Q?PXBe17/KWaJWo8T2Z6+wU3mamdnBQPd7BbwuM5bm9fW8oC4pivm9srHtU+?=
 =?iso-8859-1?Q?96cSwDT483MfHJMNhZicukQl1ZHvqAS/4CTzDtTxkBdRRWrUejrIsglST6?=
 =?iso-8859-1?Q?8kCwkOCkC0LV9tpPy74X+k6hCiTEQ0Uepbcz32xzUHdLTMsPdhVvQBYT3r?=
 =?iso-8859-1?Q?GU2KpWo529P8aPpk+rcVW88MQqJPn5bBZWCMOUG+VnWYhg15SKg9RRIdmD?=
 =?iso-8859-1?Q?caXu0e3PAU3SjwKQ8cAHmdWXIQcaCqc3rrRYgtuadndIKI6sAi/CbbODy3?=
 =?iso-8859-1?Q?jKkYhnLhswOBuxHl9LAnrRu+hIZEuFJDWguIw4xZt0Xct5bSsXB7ga2X60?=
 =?iso-8859-1?Q?uHAmYIxe238h/0zl0aR5LpEDg0VSYT3gTcxxqAl4MKoUA9VYSRyCY1N6zp?=
 =?iso-8859-1?Q?ET1m46rkUMe3jcE3Kv4Wp6TGmImrl9CGF9GFksiQzIk6w53UYU7niyFX1h?=
 =?iso-8859-1?Q?a5Vxfsq+vFwE3SCd6NXcFNg7TEC+btpkU+kP7/E+PYEK3zSOWkvMx9cLoA?=
 =?iso-8859-1?Q?6LM2fUJJA4Sx/uEkjizKj/yf/CqlxQ0loDroBcpZtPFLIxIPtaOIlP8CiT?=
 =?iso-8859-1?Q?ltXdOweDfZVsgZ0hvt6UpqV2NO7bR3BpLzsj7sLPZAT0JfidSpSiz6wnb8?=
 =?iso-8859-1?Q?htUVPhzUZClOiCpJFs7BNcmzcXpcM8y8kcDkIk9lVFo7VK+UG8rP97NRKV?=
 =?iso-8859-1?Q?XiOvT0jPXAXip8ahmtISSnMWw+VQirOsP0NLr/KUDW9vp8UgriIGWOo0cF?=
 =?iso-8859-1?Q?VDpCznVtRYCmiWEB5gR8MWCpk0C6jaNacX0o9m6iE3Yo+24CviyrVDb70V?=
 =?iso-8859-1?Q?DI31xfjK0eZ+hC9/GwWo6zZ1Wt+3HjHTA7fEkpZvX51VjHcfeH9v38xsae?=
 =?iso-8859-1?Q?r8j4DYlIm1aERlIeSCL6nTVTfEudkHMlK3aqaNhwoHYe7/TaupvlNINlhT?=
 =?iso-8859-1?Q?UyC9CabIY+F2eHJtWFvNEUqaURp9qrSdljeUuw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nBdu9386ARCmWvBTUzZSc/uC8dii71yMDadbVPP7BO0gUsJO+zSbLALNbR?=
 =?iso-8859-1?Q?wkBvQ1GJiQ9hxnD8uybMiGxeUFPWFzXvcyRRsU6naet87tm8rvFgS9Uc4N?=
 =?iso-8859-1?Q?6X/HH4kgivs+t/QjrAfeqFHPbA2fm2rJwDL079W9h8Hr40e/z9xWMeyr0I?=
 =?iso-8859-1?Q?G1m24OpHvQtUyKtGzXwXWj91RjZtp9ZAdyVyGINJ+CjsKyeXywT4F9B1/X?=
 =?iso-8859-1?Q?JSyN7ZUtCF4omTjM4+OrqS9h2D2/2JYLKICkTkUDidwWVCePfBNX1hL5Dn?=
 =?iso-8859-1?Q?/+GX56PNtjegh+B2hss5I70NTgC2szXe6enjf7syl0mbzgSbV/hYQgJXdu?=
 =?iso-8859-1?Q?n4fO5bl6zndhKQUmsulokjuO0BGdrOg1Ev++nxtDI5yqLsFvwxyNTmXEfL?=
 =?iso-8859-1?Q?Scx52hZSohvA6Tbp0aofVjcWSGGXJkWYmuQsMWb21I3FfbmztizcwE1wP4?=
 =?iso-8859-1?Q?wgQ65Bc2kcMDb4EmMidjHPTXOtkF+uZYZmrHf5aAoLdCBVlvPaK56AmlRr?=
 =?iso-8859-1?Q?X50K9MVybaNl6W+onOtqtesZxXdTz9X7drKNNBEGMHjyAZdPvZkL+FO3nl?=
 =?iso-8859-1?Q?9YTA5tHNbGZGyIxeQBh2/SumKN0LKixO88WCwZfbOVwP1Z7FJQzOjZDaLN?=
 =?iso-8859-1?Q?gM04SBzxYliALj6qV+M1z+MYqqraPFNd2RyUx6VBo0WNydpfp9wQba/f/w?=
 =?iso-8859-1?Q?rmkWk23TTia66DegjQZS+c4B3vCmox9TUnl5weJpmFPpjndPOCCI/vpXze?=
 =?iso-8859-1?Q?lx8g+wtj4r/Ppfx97CWAza6VaSoDt8QrNm6TG2xRx9EtMl2jywxlZu5Cm2?=
 =?iso-8859-1?Q?2JPhImt0Brvi89qE5zLISOZENOU5ubVIcvDUUZ1R9nEA27LIJwTKJZK9/E?=
 =?iso-8859-1?Q?Fun1g3Nd0GEWEe7KMTMaO4gJGh7bSupYylKAYHb+DB0YyFVojXX5oHOBjX?=
 =?iso-8859-1?Q?Ci+NZioDMnDsGTrBD9Hv6NV6EC0jpLX6yJ/LmdRFfhOJMzphGviC2h2Vj0?=
 =?iso-8859-1?Q?iqlPHTLZlEOTtlJVhcNqvqZG1Wb3APU5WXO9+Ka/RcZNbyrvdigaLIx3vq?=
 =?iso-8859-1?Q?SOMdb7cHC8iOAq9nsrJFYVeIbXQ8YF299i2rInd4PeMEYlYxJKeBxsK8JC?=
 =?iso-8859-1?Q?3TlSbHoGewmMXy+nlaXGmj8lOWKye9/2wUssTuxH+npgfOUI8jYgJy/lNI?=
 =?iso-8859-1?Q?CzrzTXbFlHwLmz3pNO45VPsGmKR4Ul5hknxpTJvynF6iu4OIVscLXSMvfo?=
 =?iso-8859-1?Q?395WtRKWoF6KRY3y4v1coBIaI6IDV4EcrQbP3nq416TChcWsZGEZYy26yA?=
 =?iso-8859-1?Q?Z5JcCkBazOFwa0nMBJStv3DASjTAxfDO2o0MngADaqaKDN3ey+cGyrPuld?=
 =?iso-8859-1?Q?dHpphaxsZyN8O1sCkDLmnTgpuffBv0nkAnS8qz6Z+O7r+/EnbhJFi/1vFl?=
 =?iso-8859-1?Q?6aylk1rmELoww4rZHxs0bCZznq7gzDJx5+dFGQGeRlYKQjjid6fKdeLWbb?=
 =?iso-8859-1?Q?DJZlTQ9YZ6TWpGl8YkqJa635IhcRXs1D+ng/bh6y2LrFf3wo85MVf7onLc?=
 =?iso-8859-1?Q?o/eGHnIgHJqg9cAaJ8Xay+7KvtAqv0NakyiJTAlTidkB1i0aQ69vRWgqr4?=
 =?iso-8859-1?Q?c8RzIAnYBmtQe1spYy6m940EuPES6tW3JZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbcc77e-4c6e-4d8d-1f9b-08dcce4c5da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 08:17:36.3197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lPMjTRQ2R223v+6uR8AN3W+3hEXYUb4ciWpQsssPkjHypweRM5RuTB2sQb8gUKx9Rzxs/YZxHSCdf6Y4S7l90tb7h8Nlz/tmB49zyyJFpEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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

> Subject: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle
> cleanup
>=20
> This patch split pin folios into single function: udmabuf_pin_folios.
>=20
> When record folio and offset into udmabuf_folio and offsets, the outer
> loop of this patch iterates through folios, while the inner loop correctl=
y
> sets the folio and corresponding offset into the udmabuf starting from
> the offset. if reach to pgcnt or nr_folios, end of loop.
>=20
> By this, more readable.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 132 ++++++++++++++++++++------------------
>  1 file changed, 71 insertions(+), 61 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 456db58446e1..ca2b21c5c57f 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -330,17 +330,67 @@ static int export_udmabuf(struct udmabuf *ubuf,
>  	return dma_buf_fd(buf, flags);
>  }
>=20
> +static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
> +			      loff_t start, loff_t size)
> +{
> +	pgoff_t pgoff, pgcnt, upgcnt =3D ubuf->pagecount;
> +	u32 cur_folio, cur_pgcnt;
> +	struct folio **folios =3D NULL;
> +	long nr_folios;
> +	loff_t end;
> +	int ret =3D 0;
Change ret's type and this function's return type to long for consistency.

> +
> +	pgcnt =3D size >> PAGE_SHIFT;
> +	folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> +	if (!folios)
> +		return -ENOMEM;
> +
> +	end =3D start + (pgcnt << PAGE_SHIFT) - 1;
> +	nr_folios =3D memfd_pin_folios(memfd, start, end, folios, pgcnt,
> &pgoff);
> +	if (nr_folios <=3D 0) {
> +		ret =3D nr_folios ? nr_folios : -EINVAL;
> +		goto err;
> +	}
> +
> +	cur_pgcnt =3D 0;
> +	for (cur_folio =3D 0; cur_folio < nr_folios; ++cur_folio) {
> +		pgoff_t subpgoff =3D pgoff;
> +		size_t fsize =3D folio_size(folios[cur_folio]);
> +
> +		ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
> +		if (ret < 0)
> +			goto err;
> +
> +		for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
> +			ubuf->folios[upgcnt] =3D folios[cur_folio];
> +			ubuf->offsets[upgcnt] =3D subpgoff;
> +			++upgcnt;
> +
> +			if (++cur_pgcnt >=3D pgcnt)
> +				goto end;
> +		}
> +
> +		/**
> +		 * The term range may start with offset, so the first folio
> +		 * need take care of it. And the remain folio start from 0.
The comments above are not very meaningful. Please rewrite them as:
* In a given range, only the first subpage of the first folio has an offset=
, that
* is returned by memfd_pin_folios(). The first subpages of other folios (in=
 the
* range) have an offset of 0.

> +		 */
> +		pgoff =3D 0;
> +	}
> +end:
> +err:
No need to have two labels here. Keep end and get rid of err?

> +	ubuf->pagecount =3D upgcnt;
> +	kvfree(folios);
> +	return ret;
> +}
> +
>  static long udmabuf_create(struct miscdevice *device,
>  			   struct udmabuf_create_list *head,
>  			   struct udmabuf_create_item *list)
>  {
> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf =3D 0;
> -	long nr_folios, ret =3D -EINVAL;
> -	struct file *memfd =3D NULL;
> -	struct folio **folios;
> +	pgoff_t pgcnt =3D 0, pglimit;
> +	long ret =3D -EINVAL;
>  	struct udmabuf *ubuf;
> -	u32 i, j, k, flags;
> -	loff_t end;
> +	u32 i, flags;
>=20
>  	ubuf =3D kzalloc(sizeof(*ubuf), GFP_KERNEL);
>  	if (!ubuf)
> @@ -349,81 +399,43 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	INIT_LIST_HEAD(&ubuf->unpin_list);
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
> -		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
> +		if (!PAGE_ALIGNED(list[i].offset))
>  			goto err;
> -		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
> +		if (!PAGE_ALIGNED(list[i].size))
>  			goto err;
> -		ubuf->pagecount +=3D list[i].size >> PAGE_SHIFT;
> -		if (ubuf->pagecount > pglimit)
> +
> +		pgcnt +=3D list[i].size >> PAGE_SHIFT;
> +		if (pgcnt > pglimit)
>  			goto err;
>  	}
>=20
> -	if (!ubuf->pagecount)
> +	if (!pgcnt)
>  		goto err;
>=20
> -	ubuf->folios =3D kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
> >folios),
> -				      GFP_KERNEL);
> +	ubuf->folios =3D kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
> GFP_KERNEL);
>  	if (!ubuf->folios) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
> -	ubuf->offsets =3D kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
> -				 GFP_KERNEL);
> +
> +	ubuf->offsets =3D kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>  	if (!ubuf->offsets) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
>=20
> -	pgbuf =3D 0;
>  	for (i =3D 0; i < head->count; i++) {
> -		memfd =3D fget(list[i].memfd);
> +		struct file *memfd =3D fget(list[i].memfd);
> +
>  		ret =3D check_memfd_seals(memfd);
>  		if (ret < 0)
>  			goto err;
>=20
> -		pgcnt =3D list[i].size >> PAGE_SHIFT;
> -		folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> -		if (!folios) {
> -			ret =3D -ENOMEM;
> -			goto err;
> -		}
> -
> -		end =3D list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
> -		ret =3D memfd_pin_folios(memfd, list[i].offset, end,
> -				       folios, pgcnt, &pgoff);
> -		if (ret <=3D 0) {
> -			kvfree(folios);
> -			if (!ret)
> -				ret =3D -EINVAL;
> -			goto err;
> -		}
> -
> -		nr_folios =3D ret;
> -		pgoff >>=3D PAGE_SHIFT;
> -		for (j =3D 0, k =3D 0; j < pgcnt; j++) {
> -			ubuf->folios[pgbuf] =3D folios[k];
> -			ubuf->offsets[pgbuf] =3D pgoff << PAGE_SHIFT;
> -
> -			if (j =3D=3D 0 || ubuf->folios[pgbuf-1] !=3D folios[k]) {
> -				ret =3D add_to_unpin_list(&ubuf->unpin_list,
> -							folios[k]);
> -				if (ret < 0) {
> -					kfree(folios);
> -					goto err;
> -				}
> -			}
> -
> -			pgbuf++;
> -			if (++pgoff =3D=3D folio_nr_pages(folios[k])) {
> -				pgoff =3D 0;
> -				if (++k =3D=3D nr_folios)
> -					break;
> -			}
> -		}
> -
> -		kvfree(folios);
> +		ret =3D udmabuf_pin_folios(ubuf, memfd, list[i].offset,
> +					 list[i].size);
>  		fput(memfd);
> -		memfd =3D NULL;
> +		if (ret)
> +			goto err;
>  	}
>=20
>  	flags =3D head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
> @@ -434,8 +446,6 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	return ret;
>=20
>  err:
> -	if (memfd)
> -		fput(memfd);
I think this needs to stay because if the seals check fails, then we would =
not be
doing fput(memfd).

Thanks,
Vivek

>  	unpin_all_folios(&ubuf->unpin_list);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
> --
> 2.45.2

