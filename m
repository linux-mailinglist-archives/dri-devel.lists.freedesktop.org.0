Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0418B947AA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DD510E1D8;
	Tue, 23 Sep 2025 05:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AO9v0yU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14AD10E1D8;
 Tue, 23 Sep 2025 05:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758606791; x=1790142791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pkV9OFFlQJaryr+9WuHpkJ+vzgC/tExjCIMfO4CrF64=;
 b=AO9v0yU9dvkdM2BdNT7z/XcISJjMjbqEFd1TeMiJQ5JKGpJYd61kK3/m
 V3n+2Gx1sJxrcVAfkpVoc1dd0GuIPFDdVDXmRF9FcICO36sBF2MNoiGFB
 SUbizzuyWAsCCPSqf1Ihi3Bg3Ae/WrABtuvb3ryAmS/5I7NZ50EVB+QeO
 j/S7e3W9SMBX8H/8AqFzghZz19GXkRyJfd4k16wWtAVTOMmtHvb0LOcXv
 VwtpqJCUzeFsuKsbChZYfKpfSXC4NrlzbPIggBVZeEvB/VdlW6jYOklvc
 U6AgmjHQMIHnEjSqqrfsakCptncPZq5Y9G5q+VYsmvNCdA6ftVo3zPlF/ A==;
X-CSE-ConnectionGUID: hSSwMK9fQRWb4Qroer4IbA==
X-CSE-MsgGUID: CYAVefMRREe+r1Xh123o9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60766490"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="60766490"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 22:53:11 -0700
X-CSE-ConnectionGUID: DEOt8s11QZ228RfSgI5eUA==
X-CSE-MsgGUID: rd1YQfpKT1Sx1PZFt+KOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="175962327"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 22:53:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 22:53:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 22:53:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 22:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXYIxzkLd4fxrKsUS3BAsVCVmFZIIcSM4NTfbRGrEgZfuPbp8n51Z3nPKs+4GGbIVBpEJrHgI8FhIxHHuAhF/LLox+2VUIBDneNqMty4BmkinZEW6K540/7ouovwrWomXQXiOt/4ZgpuFr+G1dxWUz0OBON1Cs4i/eHI5ZKYkVYqkn4wZx6+eaPL9xbnVlk2CRazwCF1qInK87IbO6HAXO4YocWFocTEWZaMT0YPmsdj5v95F4dqbjP1tDmptxhzC0AkuvCJ9pifwsAjBJX/wFLjoMAxtmwfjoDR7TNO7YzFT9d6U3F2GmGAW1DUrMwBmGD/8Dn36tnHY8jY5c2M1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7QPU296qmDiO7QRuFLAXDAnRiS4C/ga0C1nrDm759U=;
 b=E9eO+ACm4eUDJe/JJcSp7PfbFlVqeBh+uo+jGF8VHIhl3fYGnibzxzfNe3x99cvIcXhOiSgpfjOVeAzPD9dL7aLDfn2p3uQXVn0krskiDOtLdlk9h3HsvO2HcKjjXMp0kUBRH7ZNb7OpWRlrM5qNLi3ZDp0JrwZoDZxGYCqcNbBsre3moKTJWplHeFOZ4/wFM684+hKkZxeq2VWSB+j4arbmp5d+miEFPmURRvxwgTEMPwmcomse2Yi1xHbIOYBJYbG4cDJlDMp/9Z7B07Qh3lLM8bSNy/WyxhTwUMHqqaEzAjWniQQZjeOurGwuketcRnuaDAx9orugIEj3qkAhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 05:53:06 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 05:53:06 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>
CC: Simona Vetter <simona.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcJhH5Hi/XzGn7NEC5e+4cxcvJFLSWGoCAgAIWItCAAKwBgIAASuAwgAFOcYCAAGQ08IAEQCiAgAAQEACAAJXxIA==
Date: Tue, 23 Sep 2025 05:53:06 +0000
Message-ID: <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
In-Reply-To: <20250922122018.GU1391379@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM6PR11MB4532:EE_
x-ms-office365-filtering-correlation-id: b0fdb7b6-4391-4604-c852-08ddfa6577aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?An43rWsxS0v4dQwLKcj04RLkKbAd204ca+MzZHNGuuwbLJsG7hRmqbSaN6?=
 =?iso-8859-1?Q?139IH3sA16buSoPygJA5xJdxZzTgeveQwfGRRnfghNjDca22VFujvbn3CL?=
 =?iso-8859-1?Q?mzRbCFnMgFnyht2P244f1dk2lX+33cefZAB8hmqf07+JuErmtHK/FTun4t?=
 =?iso-8859-1?Q?+WFqAYZNp/GBk9s2b2gvo2eOElu10TLAN52BmSd85b/7f6tl7opakxmb5T?=
 =?iso-8859-1?Q?yAnRVkMqqiWuJ3jaKNiahBUiXZ/z8Ab6T3JVQP/s/sIyljTNz53HAp2Dg0?=
 =?iso-8859-1?Q?vpXXrn9mE66tBw7GNVlpVIqaN8ROzIQVspXpxobBxo941XyWzJVoULPgoU?=
 =?iso-8859-1?Q?vGMmqvStYhuhly6cs6BftOcBZd0T6T0y2eLKpEaoVJZPcnokJFDyVj/X+P?=
 =?iso-8859-1?Q?NvEeprWTpCZP7SUk8z+yW0nRlH09eKK50w2LE3FUwbafsHBV1c+6CrT94t?=
 =?iso-8859-1?Q?azN2C+KeddalYUgv3cLHCIjbhD5TTbwsXGKFBOba+YaPl9hNSbgNOsuL43?=
 =?iso-8859-1?Q?WQPgycpsdWzbP5i4gtpQbKor92eKHptN6Le/MWcKa8CW/Z1Kadafa6IvhI?=
 =?iso-8859-1?Q?SHCyPnQR6u1OKDWu0xs4cZT0rPFFNPSvJKEKocNVAL4e0m593A99+IKP+o?=
 =?iso-8859-1?Q?kuW689LnzgBb//ePXGf7HUHGNNaa+ZzfxVb/QIldsDGPOh/0rsPuKfBGN/?=
 =?iso-8859-1?Q?p7Oj0VYfRHt9D1rCwAqI5Sg40qhSc/SWWTNa/uWVlWcfY5A5xKHaS4C9Ow?=
 =?iso-8859-1?Q?366u4ywI0mI0mmIKDPtHRIK+dQvBSIsLCclbZ/Q0eKRp7tcAHDTUzUd0SU?=
 =?iso-8859-1?Q?tIP8k03bVmeoz71qsQy5hToGDOmr+PVr6TlKZ1SiZgadd7rQume3IGNSy/?=
 =?iso-8859-1?Q?v+7lMJ9z8tJkPxkz3GD0V7ZAt+jlTfSxX9RndbNS5+ryYrakQz/HyRb0dd?=
 =?iso-8859-1?Q?Xw+D/of2qpMHVkHcc5n2k8qXb3+hKwMnjjZi/hy6hT5OEU/2G2cQ4MqtKJ?=
 =?iso-8859-1?Q?Ju42Y2gaH3clNt0vCySMZVpaap4+veSFP+Vz0uSrv6gUCW5SOXAyRXjiO4?=
 =?iso-8859-1?Q?ym31i3ErIfnO/wc+zn8ORYr76sl8lpYs36JGOrWIEg3XtmH3oIKdg/zg0y?=
 =?iso-8859-1?Q?iX4cALUStPkSyz90ZBuWTUucUDXRIMVldXqi0OuZTr+YJgluO6nlJxzgGF?=
 =?iso-8859-1?Q?j3tEtVHnPH47QlEJIZOKMIwMNdfEYS398xectwUe7ZeXUupqU6eH1E5VQ9?=
 =?iso-8859-1?Q?x28jFxdU+CkKQlx9qveWfiOUTSkL3rqqLfKp8IfLUwmUJyY1DqNhHBA6yA?=
 =?iso-8859-1?Q?iBBMwKhE9YVUioRo4iCOwk2YBszPtsAKogz4v85YbvKegnkNA+nEUeBYyq?=
 =?iso-8859-1?Q?nkjfgbpp570pcZ3CPJoI8coAYUVz8uaC1uPrhciRTtCs9sV1Ae91WW3bO/?=
 =?iso-8859-1?Q?JCeu7/Y/qkAwt2iwOKCt79YtRc4rxTQ8GZ3i6lLHfpviMJ5HDiMMIcOpTN?=
 =?iso-8859-1?Q?dnxktPgLGqPrNJsJ+48+tRTyYwTle5ifa3HLxXnxx0+dq1lkS8PL4dJbmn?=
 =?iso-8859-1?Q?voGx3u8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+EJx/xnCHyHZoJVfytrbu3/Q4VKOd6j0iWKdhuoIhSEuIzkNy1C7e1oegf?=
 =?iso-8859-1?Q?+YE4KWHyVsfjYpnUHTMHYhiQrKnLGnKeoc03nc1v1f6/PhSQxLaPfZULvH?=
 =?iso-8859-1?Q?ToOW6Flq5a9psHWgjitvh+NKBBNIBhW/kbQrk0CnGOnL6w8+x9AU83Wztj?=
 =?iso-8859-1?Q?3AniP+jcFio4sPls0X2RWiRpX93gxXNWPgrKodgQHbHwglNc6vgGtPcN6w?=
 =?iso-8859-1?Q?r45Uk4t2InFmDqgcUVS+OmWddiDRad5Mfw7pxMud6lUyPyk0UvSLDFZL5i?=
 =?iso-8859-1?Q?SMdx852NycK62liEYiC2FLott5LijL6yQelN44m5o+0ZrH/k7J9yfhDM3P?=
 =?iso-8859-1?Q?x8oqUPxlwprIYvntk49G+T77oFe1KLz4hitnhtRNRwjwElsLcvmgFdVSFA?=
 =?iso-8859-1?Q?YiRNvO3vHUZf+FKe4XN3t64CldtmSCTV0LsX0ZN7CJ/bKDQLtdcrxetSHL?=
 =?iso-8859-1?Q?UqRQEigmsZ0cu8zr5DTQRoBPgBObmbCu+bwLHpmAVjnOBT3JNNkG8kAiqn?=
 =?iso-8859-1?Q?708F9NKtxibixvrAyEv9QV0x7yZHOF13cXv27ZhAeiHWBgANQ2aJVfLJrx?=
 =?iso-8859-1?Q?32OH0YQL7QT2HAU/cu0U/Wl7X2gynhGmUIcZy+RwiVUvsd9TY4HawX5m7f?=
 =?iso-8859-1?Q?751IfVg8ulfVutMYsnsaVsFCh2BuqofA01eNXCvZEIisznhZeXIuYaWCq9?=
 =?iso-8859-1?Q?EcmlaLIqaLtkCsrhz0H759SZPnUhemjQhxm1vAluWs6Hb85zEDlWXJLQAe?=
 =?iso-8859-1?Q?jLYs/Ok6P9yN6oJ9XJGEmEBtEEhRedwQBmOhp5FFjzTkobrUv26pncZAvR?=
 =?iso-8859-1?Q?IygDFGaWi9p5uouE9nuhyd8ktthIutE9zNNftxQi8xn39WY1QTPlR0eLz1?=
 =?iso-8859-1?Q?7QDEbuTvhywFOfdKNya+TYob38eRisOGvKIg972svwEz6PR7okHAmzbehp?=
 =?iso-8859-1?Q?Ucn6kyVNZWRjpIbGJnZ0JKqur2zIsgn9QjeIv6Femt7t8sQoOJZ0qziC7b?=
 =?iso-8859-1?Q?z+ZRPjMXpehzgsTpYYiv8RyJHDsGiNbYtiCqyi+Udti8yvtK/GEQJt9g2V?=
 =?iso-8859-1?Q?pmW+gDE7V2uy9ShNB3dnYPwxn5H7uYvtRPtLZijClXFj3PYRJXpc62Lb9L?=
 =?iso-8859-1?Q?SpWNxiVnPwTTUQjRHmmGXbCLrEUdlMQhi2TRhldpEpL6nfaMWQU4NZCdJL?=
 =?iso-8859-1?Q?DwU0iX7cIg2P/a+ROlAjdqtD66Zjcqzpiu/v27LlUz5XYLPuxVV9ka293H?=
 =?iso-8859-1?Q?CaXbHHSxpPixW+LjMtv39vNlF7/hxxpPbw9cCjfASGU6mpCmwsSgCrBO9U?=
 =?iso-8859-1?Q?0ka9F8AjhKbBoU7KJVN8fVri/oZN1hJI/2pIDHBkgUqtXtS3BgHCsUr0wR?=
 =?iso-8859-1?Q?R1C142oa243tzybAqa4rv4We71pDsWJfenjc+rzxhUUX/ohfbPSP5US/Uv?=
 =?iso-8859-1?Q?KJs+omzGXzGP0orlT1JwaVoT6RvqFo7rJw6rdGqpnIjTko9hCv419YO4Vz?=
 =?iso-8859-1?Q?AW3v2Z7+dn97jGo4dwaQhDIpx5dMsLftYGS8jkDHTqohD6CWnVQG34ObYx?=
 =?iso-8859-1?Q?ZsKLIgaK0q6hK4bXPsxovtN7vQcr7NGlBfpErPGIJbSLAD/accxiVbN6xI?=
 =?iso-8859-1?Q?LMwHQWI/JQZQCgn0njv5VzHtTseT1fLmqi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fdb7b6-4391-4604-c852-08ddfa6577aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 05:53:06.2192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ie8xj2wTqaGDQwIi0vpj5Wo2+gQt6D97BOKkga10F6s4FgEq72QqFWvxH57fWNCKkwPHbqt5OEke9y/mPd41FS42dLK+02cyOku1I0WNc3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for devic=
e
> functions of Intel GPUs
>=20
> On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian K=F6nig wrote:
>=20
> > Well what exactly is happening here? You have a PF assigned to the
> > host and a VF passed through to a guest, correct?
> >
> > And now the PF (from the host side) wants to access a BAR of the VF?
>=20
> Not quite.
>=20
> It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
> the VF can access some VRAM.
>=20
> They want to get a DMABUF handle for a bit of the VF's reachable VRAM
> that the PF can import and use through it's own funciton.
>=20
> The use of the VF's BAR in this series is an ugly hack.
IIUC, it is a common practice among GPU drivers including Xe and Amdgpu
to never expose VRAM Addresses and instead have BAR addresses as DMA
addresses when exporting dmabufs to other devices. Here is the relevant cod=
e
snippet in Xe:
                phys_addr_t phys =3D cursor.start + xe_vram_region_io_start=
(tile->mem.vram);            =20
                size_t size =3D min_t(u64, cursor.size, SZ_2G);            =
            =20
                dma_addr_t addr;                                           =
          =20
                                                                           =
          =20
                addr =3D dma_map_resource(dev, phys, size, dir,            =
            =20
                                        DMA_ATTR_SKIP_CPU_SYNC);

And, here is the one in amdgpu:
        for_each_sgtable_sg((*sgt), sg, i) {
                phys_addr_t phys =3D cursor.start + adev->gmc.aper_base;
                unsigned long size =3D min(cursor.size, AMDGPU_MAX_SG_SEGME=
NT_SIZE);
                dma_addr_t addr;

                addr =3D dma_map_resource(dev, phys, size, dir,
                                        DMA_ATTR_SKIP_CPU_SYNC);

And, AFAICS, most of these drivers don't see use the BAR addresses directly
if they import a dmabuf that they exported earlier and instead do this:

        if (dma_buf->ops =3D=3D &xe_dmabuf_ops) {
                obj =3D dma_buf->priv;
                if (obj->dev =3D=3D dev &&
                    !XE_TEST_ONLY(test && test->force_different_devices)) {
                        /*
                         * Importing dmabuf exported from out own gem incre=
ases
                         * refcount on gem itself instead of f_count of dma=
buf.
                         */
                        drm_gem_object_get(obj);
                        return obj;
                }
        }

>The PF never actually uses the VF BAR
That's because the PF can't use it directly, most likely due to hardware li=
mitations.

>it just hackily converts the dma_addr_t back
> to CPU physical and figures out where it is in the VRAM pool and then
> uses a PF centric address for it.
>=20
> All they want is either the actual VRAM address or the CPU physical.
The problem here is that the CPU physical (aka BAR Address) is only
usable by the CPU. Since the GPU PF only understands VRAM addresses,
the current exporter (vfio-pci) or any VF/VFIO variant driver cannot provid=
e
the VRAM addresses that the GPU PF can use directly because they do not
have access to the provisioning data.

However, it is possible that if vfio-pci or a VF/VFIO variant driver had ac=
cess
to the VF's provisioning data, then it might be able to create a dmabuf wit=
h
VRAM addresses that the PF can use directly. But I am not sure if exposing
provisioning data to VFIO drivers is ok from a security standpoint or not.

Thanks,
Vivek

>=20
> Jason
