Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A2E96EDAE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2310E9AA;
	Fri,  6 Sep 2024 08:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmYdFrUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C42810E9AA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725610934; x=1757146934;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gefzh3A8QKtnelIEKIMxPMuN5DSMdNypu/chyjz9lBQ=;
 b=EmYdFrUB9nz3SheAFtLEfkG7sipfUuuyGRyIziblcCyDeDrfDKapzydB
 qwWXrdOQFMTRikqujmwlrDtD43LLiq7H+pU3kAhOeTd1rMCqLSEU7qSsl
 tyggeQsLvX1jC9rLy5Rz1f53ePJEQPMOiohVs1Zp5DRmOUuyVJhDgnugw
 MTa1pJoHUr/1sDzYfVTZ30YL58+2fZuCIqk9QMVuMlGm4Udaa+ZPMM+nZ
 9moAqJ5LdGpH3RW7FwIjVoI+pw1t4GHFmJUn2n6FYbzovsBwfIdDDr8Sl
 Dny+FX/U10kq3o443p5uZYwHjRFCh3mN+3z2zpNR1c1x/OwlcqEOJR2/r Q==;
X-CSE-ConnectionGUID: hnxafZGFQ+6A9BDJQsH9Gw==
X-CSE-MsgGUID: 1g1anBQWTr2Cz64zmCIygA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24228891"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24228891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 01:22:14 -0700
X-CSE-ConnectionGUID: DeHf1B4eQ3Kuo5iAu1df7Q==
X-CSE-MsgGUID: 1pfb5VCnTju2bBPK9qMdpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="96669815"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 01:22:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 01:22:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 01:22:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 01:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOxmPxl78kt5agryhYNumR6oQSV0i97eRBPMPs6W9QhDyQzq6NnYwDxCyC9tVQUeZyclKXTRgBAd2xAHh36V3RFSlrzD1AuBPMhHF+NYCOdKtRIq7hmnSf95ggc8HQ2pogqWg7JC7bGrkOmwGQ4M00BGcmRemXU/RbQ9lopGzJg0K5AItLxYAObUqgDrUePig6fa2gmWVyVCypIAh5gkHeyoMyd7s2LvirF0XMOb5I+nKL9A8HdjMDPJz+qGmpcS7TUf+FNvlfFu1EqBaXsizBsQY6+U3qjHQxJpvWJWl5Z9TSDnuyKOwpLTOIw3rW2NtkX3MpIPdLsGFHdCIJ749Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtXGRlRrxJ57M3eNdY84P6ftkR1FmZFf7yvRIzqdtjg=;
 b=M7B9ttbICXv+xuElTBaDUX5afBVbZU4kzk3ATBNs/J7U8FJHtaYN/k+Qsiqf3mNlrmoRr6uDrpZOr2jIPMhPPtdJkSy1o8BJSqtztUyqHfZilW026QDUhUfZCL1QNodQnzrTl5dDCHb8gOcM2oAyu7TSKmmgQQB+LoL3OKFncje8r3aX0LCo2ESUH1GBx3tyZRP3SsfSp1Q5/ECtWWFVcinKvuIjhP6WVipp9rM/853Ey5AZRSeKthztTLFMOv9CDmdeEtBPKTMmyRZLaoJypBEejObdvyNX6XSPFqyg30wpUK8v3cJnUzHi6LDJMCJFa5n6DLRHJYfGiI2lI7eL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 08:22:05 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:22:05 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v5 6/7] udmabuf: remove udmabuf_folio
Thread-Topic: [PATCH v5 6/7] udmabuf: remove udmabuf_folio
Thread-Index: AQHa/d0m8IyprHtOxk6NV5FTrl8I9bJJdNTA
Date: Fri, 6 Sep 2024 08:22:05 +0000
Message-ID: <IA0PR11MB718551FE1B9B9D4CC7956144F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-7-link@vivo.com>
In-Reply-To: <20240903083818.3071759-7-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN2PR11MB4678:EE_
x-ms-office365-filtering-correlation-id: 481d8be8-1a1e-4034-4a81-08dcce4cfdf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?MfbHzMgesa8QUC5aeRTIaO19Tu9Dg1zdmAWcWRJFYLnlKYoU1As3Hg4wfG?=
 =?iso-8859-1?Q?X0as66qkm5CMuwTZ1n635BIQ0zN7e7K2fhvAVv1K26DT2x4d2RSfyQfDSe?=
 =?iso-8859-1?Q?YuSqmNz/w9jvFfsOWs0O6xUChqvoNpfJkOT2NzbPwtWH2Of6+XsYN3fXAM?=
 =?iso-8859-1?Q?5q5zaclNBUgIeBMykgMmEItQIbVF1MjIljgxOtkTEtYn+nLnc0yXJE8kXH?=
 =?iso-8859-1?Q?DHNtys6WJlM37IRG2YhNfwf0/6Ig/F8WseiibFs28s9ycFQBxZl+Ivis+R?=
 =?iso-8859-1?Q?O0mphYQeR98twwMFAMYQ72QZxQGqEZV6BMhQ7nsKxwpH03/m4GpToM6oWF?=
 =?iso-8859-1?Q?2eF2JFzf3oGP5GfHRslWpiJgvRARTJjKWIiTPtlUo16TbYebOX6r5RZJGj?=
 =?iso-8859-1?Q?Ab82MWxoAGHQSt/6NE/LW+R8s6dBWjdTcAfnQJnxNPTorPwpbkgTl/z1cl?=
 =?iso-8859-1?Q?q9+pXOBXSq8ZPbxbx4rbJ4c4BUctfdZ0Psx/Z6x43F+OVFpwK9Mwxu5zwe?=
 =?iso-8859-1?Q?vYRG8o1ZOzLzjqyuGyvf7EhniGS2iQeyjaq6iapmkh309POLBa0tvypKrF?=
 =?iso-8859-1?Q?sComwPRk6ETkLw06Pc6peo87ZmdufWtyje4U2cHgvm6qDmD8e4kNt7jKqu?=
 =?iso-8859-1?Q?jGM4FnSAhGQ7Tc70XzMk9qyF1rjiJ5TR3zu9pVvUB4TrmhH7VFaJAonBrH?=
 =?iso-8859-1?Q?IahrLH8q3+uBOmCv1x+BBy4h7mANHT78SNkzdOJ1QgNs8ZwfXMwo/i5zHP?=
 =?iso-8859-1?Q?FF/WCcMOz6ttWCjAS+jVh/MIwEzmg3AFUcKpDkY+M4kqWcZHl0qIMa6/nv?=
 =?iso-8859-1?Q?fLqDtfZWmNA25+B3AfSXn33REdNh7biMl81MnlWjzY0sD0GT494Fx/vY0P?=
 =?iso-8859-1?Q?zm8t/2WpnMEVtsaTfaMeRMOcUa6R/KqdIpgQd2GFHqh7OYICADP0Fhmd5Y?=
 =?iso-8859-1?Q?5EjnlklauJHgRBNUsWpI85KtI5WlkJ81wJ5w3bBa76wyAFHLcK1JJUh7pb?=
 =?iso-8859-1?Q?fRVAVnmmmBcmY3eL2vD+zRlvPzCLV5oSDP3cBuOe/X4UiK36lMv/l7uN/Y?=
 =?iso-8859-1?Q?FbgLdjUkVcSLRr95tk6jF0hrfy4TRMLMbVROdcPjL6SUekac3/POoly17e?=
 =?iso-8859-1?Q?ICD+eEir4A3ox9VgYQCXfVqWpBgSVirv8fCwiFYkuO/bDGL9mJJSDPQDhQ?=
 =?iso-8859-1?Q?lhS5/b4iNtFi+DoxrAimrz5m4R2P86i/xzJjVzAZZB07s/EW1YK3jEzO5b?=
 =?iso-8859-1?Q?symPZjTM52lbs0EeJWFk74RZQr7c18Z+T40L0+nIQxhwN9de+K2NSJ4PwO?=
 =?iso-8859-1?Q?H+MxU4PQjy88/4XvHxyZXqaWNZCo7rIgkdDoiw0u4wOTqSieg+L7DFn2Xc?=
 =?iso-8859-1?Q?TwYxbQhEUSqE6TENS2kqqxAK9pL25M51NyludEuyk+FS+rv8AIwpL0FaWJ?=
 =?iso-8859-1?Q?y33MLEQ9/ZDz/5BF2vfZ+TvmVmWXMw3IwFFH2A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cknYlN5HKMYPG4fSSCe61xbe0/gOcmNZeKJc4gcYuHkDFH7fuO+b4uN56r?=
 =?iso-8859-1?Q?4atqfBUISHptccv/LAmbJMGK6SQflt23iDfVkcnrec2Oddfuvzh7vEoinL?=
 =?iso-8859-1?Q?fqHKQ3W5yUd22QVgPNOlBD7/pSVo+l0KUjzXbmpn0fiG2CxYeslZt4zije?=
 =?iso-8859-1?Q?VQsZmjQfDmowqz7rn9vORhEDcQbDV2EH1gsCaHu5IeGrO/ePMFJ+j0QrBQ?=
 =?iso-8859-1?Q?4w5vUc5aaaw78vUsCdWZmMhK52ndGidN10LsCk84ICf0cYPcxZtNOj6Nfv?=
 =?iso-8859-1?Q?Z9DFTagNX02yi8vtzT3FfF8eEBX0S2hGZDkwpIqJJDvnTZomw25hyJi6T+?=
 =?iso-8859-1?Q?dLQeIyUJB76QXL4o98NrSMoGbbQD7UiJkzAXiov0lQwyrhaUE1MB5RzU7E?=
 =?iso-8859-1?Q?W8O/LuBbhw1RcxB5pKYZv8DKLtf9lcrcQbObNw3sKMxmr5cBDzCjimIlmr?=
 =?iso-8859-1?Q?w/7dlHmBk8USLu55VUZ0lMore2cT7f08Q7UxBLuatT5uCjlWPCurft3IbL?=
 =?iso-8859-1?Q?gglaBCk+48P97yV+FXQQxUsh+E83yG4t+D1xLd0R816lAFKrti4eu0ygc5?=
 =?iso-8859-1?Q?gVxI2/i2OkDPXvh+2+lp46MJ68IBEnhH25UJexQK5ubeXh+chemB4UF7N5?=
 =?iso-8859-1?Q?Qv9HHx6al1y02/b7GBPnm9nZ+SUQjgMyEb+XgZSaEfc9HcpzKiFmhL7Mom?=
 =?iso-8859-1?Q?h+BEf/dYSuX1NJs6Zj6T1sS9SeRMHZwr2Rvg6I966eby89r8z4T0xqNE58?=
 =?iso-8859-1?Q?79209560Oa4uVl3AVq4jDnnHEyy/2rVKkBrI9PkjvO9qEyXGrc5qxCxmdw?=
 =?iso-8859-1?Q?+FbGZjgpflSpULL/IjLg48lC05eSWrs4sNNuMl8i3gq4vtckKmI0C3DKKu?=
 =?iso-8859-1?Q?rD7uRL3OlMjaejWUfzxyr4thp4oqOi35p7yTM+mzKU5i1W60wNQUCATOBG?=
 =?iso-8859-1?Q?S/cVzJNO58S8r8kqtivEzMt90v36jnajxh37MA+CPpZOPiNcFC5UHIQEVC?=
 =?iso-8859-1?Q?M5kbTupCspbDQOMO5T79XneImeBVo7Sdj7MMxYH/Fz+RUSaMO6EX3nm+4f?=
 =?iso-8859-1?Q?8UoCCDYoZcUjfOuLQKlFtRIkqP9zwOchP4UrjZkUqDx4r3MsTXE0nq3LQ/?=
 =?iso-8859-1?Q?uHdGWfIzJ0McqI6EJ59TRL/VmM5xizGFYeip7bXs1eNwdeez3Zw4cUrXWt?=
 =?iso-8859-1?Q?c9Si3I2309yan7qVwTPDc1py7xyHusxu+DJWwzQDig1p1BQJlUoYIWPD2H?=
 =?iso-8859-1?Q?/rfBLSiqsW+UK+VtOO9VL2ZKI1OLxD+MC5IJ08iR6LdVNPcDaWL7vUnU7M?=
 =?iso-8859-1?Q?qVrfKLMEszbx+sTZQYtGSqPdlIh4FLLKhzWziZxurTCxNNpOxKdmjpMzH7?=
 =?iso-8859-1?Q?F066AVKkBHDQFkIGpOtBnJWs/Oj0EFxBxJk0PzDvW9n8W3q1/lRDAlVTUR?=
 =?iso-8859-1?Q?/BYYWZVjhxakxX7KUmC8I6Y4rZ8z44705mNXTYesAUl56PCAS1mSGpjD6G?=
 =?iso-8859-1?Q?bNzXb+FHP6Un/NBgpAsyQLmnLwWoXbXN3FJfO8XJUl9wQCLMb86Cp39ZJy?=
 =?iso-8859-1?Q?PjgvkvQ89FhoseE1Cnc8sE/cv1VML+5EFrnWicY1lBzBpquDcyLQl2nxU3?=
 =?iso-8859-1?Q?Jp2+aWVZ4vbuXe3FOeS6Ia0bN7MCYdHhwb?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481d8be8-1a1e-4034-4a81-08dcce4cfdf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 08:22:05.2830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DupP0WFTbPgz4vAbBG2mY/h0EDhCZEG2KaGKgRJQsNL+9NwTDpRywjobgwbOVoyXkeHYhsjqla4aLEm1yCFWaBqYGcHbYK6jWhPNiiP+V4E=
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

> Subject: [PATCH v5 6/7] udmabuf: remove udmabuf_folio
>=20
> Currently, udmabuf handles folio by creating an unpin list to record
> each folio obtained from the list and unpinning them when released. To
> maintain this approach, many data structures have been established.
>=20
> However, maintaining this type of data structure requires a significant
> amount of memory and traversing the list is a substantial overhead,
> which is not friendly to the CPU cache.
>=20
> Considering that during creation, we arranged the folio array in the
> order of pin and set the offset according to pgcnt.
>=20
> We actually don't need to use unpin_list to unpin during release.
> Instead, we can iterate through the folios array during release and
> unpin any folio that is different from the ones previously accessed.
>=20
> By this, not only saves the overhead of the udmabuf_folio data structure
> but also makes array access more cache-friendly.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 65 +++++++++++++++++----------------------
>  1 file changed, 29 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 254d9ec3d9f3..d449c1fd67a5 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -27,15 +27,21 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
> dmabuf, in megabytes. Default is
>  struct udmabuf {
>  	pgoff_t pagecount;
>  	struct folio **folios;
> +
> +	/**
> +	 * Unlike folios, pinned_folios is only used for unpin.
> +	 * So, nr_pinned is not the same to pagecount, the pinned_folios
> +	 * only set each folio which already pinned when udmabuf_create.
> +	 * Note that, since a folio may be pinned multiple times, each folio
> +	 * can be added to pinned_folios multiple times, depending on how
> many
> +	 * times the folio has been pinned when create.
> +	 */
> +	pgoff_t nr_pinned;
> +	struct folio **pinned_folios;
> +
>  	struct sg_table *sg;
>  	struct miscdevice *device;
>  	pgoff_t *offsets;
> -	struct list_head unpin_list;
> -};
> -
> -struct udmabuf_folio {
> -	struct folio *folio;
> -	struct list_head list;
>  };
>=20
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -198,38 +204,18 @@ static void unmap_udmabuf(struct
> dma_buf_attachment *at,
>  	return put_sg_table(at->dev, sg, direction);
>  }
>=20
> -static void unpin_all_folios(struct list_head *unpin_list)
> +static void unpin_all_folios(struct udmabuf *ubuf)
>  {
> -	struct udmabuf_folio *ubuf_folio;
> +	pgoff_t i;
>=20
> -	while (!list_empty(unpin_list)) {
> -		ubuf_folio =3D list_first_entry(unpin_list,
> -					      struct udmabuf_folio, list);
> -		unpin_folio(ubuf_folio->folio);
> +	for (i =3D 0; i < ubuf->nr_pinned; ++i)
> +		unpin_folio(ubuf->pinned_folios[i]);
>=20
> -		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> -	}
> -}
> -
> -static int add_to_unpin_list(struct list_head *unpin_list,
> -			     struct folio *folio)
> -{
> -	struct udmabuf_folio *ubuf_folio;
> -
> -	ubuf_folio =3D kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> -	if (!ubuf_folio)
> -		return -ENOMEM;
> -
> -	ubuf_folio->folio =3D folio;
> -	list_add_tail(&ubuf_folio->list, unpin_list);
> -	return 0;
> +	kvfree(ubuf->pinned_folios);
>  }
>=20
>  static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t
> pgcnt)
>  {
> -	INIT_LIST_HEAD(&ubuf->unpin_list);
> -
>  	ubuf->folios =3D kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
> GFP_KERNEL);
>  	if (!ubuf->folios)
>  		return -ENOMEM;
> @@ -238,12 +224,18 @@ static __always_inline int init_udmabuf(struct
> udmabuf *ubuf, pgoff_t pgcnt)
>  	if (!ubuf->offsets)
>  		return -ENOMEM;
>=20
> +	ubuf->pinned_folios =3D kvmalloc_array(pgcnt,
> +					     sizeof(*ubuf->pinned_folios),
> +					     GFP_KERNEL);
> +	if (!ubuf->pinned_folios)
> +		return -ENOMEM;
> +
>  	return 0;
>  }
>=20
>  static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
>  {
> -	unpin_all_folios(&ubuf->unpin_list);
> +	unpin_all_folios(ubuf);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
>  }
> @@ -353,7 +345,9 @@ static int export_udmabuf(struct udmabuf *ubuf,
>  static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
>  			      loff_t start, loff_t size)
>  {
> -	pgoff_t pgoff, pgcnt, upgcnt =3D ubuf->pagecount;
> +	pgoff_t pgoff, pgcnt;
> +	pgoff_t upgcnt =3D ubuf->pagecount;
> +	pgoff_t nr_pinned =3D ubuf->nr_pinned;
Reverse xmas style is preferred; please try to use that.

>  	u32 cur_folio, cur_pgcnt;
>  	struct folio **folios =3D NULL;
>  	long nr_folios;
> @@ -377,9 +371,7 @@ static int udmabuf_pin_folios(struct udmabuf *ubuf,
> struct file *memfd,
>  		pgoff_t subpgoff =3D pgoff;
>  		size_t fsize =3D folio_size(folios[cur_folio]);
>=20
> -		ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
> -		if (ret < 0)
> -			goto err;
> +		ubuf->pinned_folios[nr_pinned++] =3D folios[cur_folio];
>=20
>  		for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
>  			ubuf->folios[upgcnt] =3D folios[cur_folio];
> @@ -399,6 +391,7 @@ static int udmabuf_pin_folios(struct udmabuf *ubuf,
> struct file *memfd,
>  end:
>  err:
>  	ubuf->pagecount =3D upgcnt;
> +	ubuf->nr_pinned =3D nr_pinned;
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  	kvfree(folios);
>  	return ret;
>  }
> --
> 2.45.2

