Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480E897C796
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 11:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2A510E6C6;
	Thu, 19 Sep 2024 09:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUHE/fof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6C610E6C6;
 Thu, 19 Sep 2024 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726739760; x=1758275760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jMdqhOiFu/xCD+yl8Wm4fcx8m07TdRKCGpoZizC+8d8=;
 b=lUHE/foflpYj6Xof8KQEkmeaMq52/1gIQZe7Ca+OUEcLaHYZ+rd1VQWC
 bv4Nn4PGXAdcT+yiQER0Be+oP7nL81DgLyLjhZ3W/uQ7yEuQSAyDBFHwD
 5px15lv47D/F38Pcpmj/f5uLg+yEIUClgewgwT6Ly9HUsXdNqSweAJXOi
 tDtwrQk8YzM+AabmAuS7Uw/MWbfk7wAwnr51lsrjKPuVxuHJ7uvOjGLMi
 WuZ90sH5sVinbia9XrkfiZemP/W/Z4dVxpmtBXDQktNcOdPHDUayBMwEk
 sbGiQBu3Zm3ta/tr7dThbhaeHCWI3ShRPbEUsPmr+O0ZW4dxO+SyJyLrG g==;
X-CSE-ConnectionGUID: Nqp9r2LgQ8qWpFAusti3EA==
X-CSE-MsgGUID: uGzvLgbQQLSW7I3GUihIBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25635705"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25635705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 02:55:59 -0700
X-CSE-ConnectionGUID: 5U78e6UWQaeM5V5bNx8ZyQ==
X-CSE-MsgGUID: 7KA4a2bCTq6DIgahh1AW0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70003511"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 02:55:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 02:55:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 02:55:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 02:55:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNe3esglFzogyJ9xCGxGJ/ROl8u96r0SeRlB934iIcPJvNi0NIJEAKB/kQecFXSapDG0ou/ZvO4Bqh6hwSX+i2zsY+V6a9BBHG+AVGOFflrqq5jqjM/rtC6X6zxfeqAS+uGQabUvgjWHqcKFith4mcb7L+16XQlJr+TUqMiUu4a2hSsrW2twUnFN2GIZuM8pW3AappvZB8t2kL/9OZIkfHcCdWKbhMpC7b5QDOpo3xvxDfACSKJPutrUJb7SEZZw3st3M1fdXatIBxJQq1y98Uj2zkgMuRxyidoSRZoRljstG0v2nz+3XmcaQ9H8AlurHOUQIXN+4rMMp4ZXlLC/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fsl9xjXT08CCoc3K5oUfhaC0Cg1eGIPtylOuDMo9bw=;
 b=zDPyKu6QdgmgWFtHzWMNHBmp7/3LKYeL9HRyoEOl4Cs6svonK4LKGd2EsNcUFT/XtG+xfEQKP7ijguXie85n8LKmzRGEodK9UI4n+HcwReirAZ+AdQabiDidgacRw1B/Wx0MqDNOt+p6EfFbHUSzWKbio4FPDL6uFS54kgepygz8pcQvFFJ6OHsb7qwUXJFch78Eg5eGcatCofx8NdbFVM/0+N9aymj5lvCa5GoRbi0T5BXBVv5NwqhMpkB6XH5AGIKAvTXqidL6tDA8jiJy0c7kj69sBo+7ffPLU9c9KexmSnvDGbjP0s5odlxbN3/5CnOwHCrV2L8S5lltiaEcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 09:55:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 09:55:54 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Mark Brown <broonie@kernel.org>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 02/12] spi: intel-dg: implement region enumeration
Thread-Topic: [PATCH v6 02/12] spi: intel-dg: implement region enumeration
Thread-Index: AQHbCEB37amQQAQJ102IyfhGs5rGrbJdjsKAgAFUs3A=
Date: Thu, 19 Sep 2024 09:55:54 +0000
Message-ID: <PH7PR11MB7605BC90FB95AC2CE807C86FE5632@PH7PR11MB7605.namprd11.prod.outlook.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-3-alexander.usyskin@intel.com>
 <ZurXI2g00duqMUjo@finisterre.sirena.org.uk>
In-Reply-To: <ZurXI2g00duqMUjo@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7605:EE_|MW4PR11MB6665:EE_
x-ms-office365-filtering-correlation-id: e0315108-c417-4189-b741-08dcd89140bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?RoXrNwwrQSduZzU7IktLpnNf2mqwTx0WnYOGpN+eFtxXPg/D/FEh5cA3PH?=
 =?iso-8859-1?Q?cidB4YiDpYcpjP1Qmoz+Yw8Kv4xB8PxyNFDzhp6z1n4/H5mQmsB3J/k969?=
 =?iso-8859-1?Q?Q49ht7HLJvWXrCIKy1sBdgmQbpW0wgZP1xX4K7HrtLSFRSSgdTBKcimf+P?=
 =?iso-8859-1?Q?KjuGwWZ30ixCqAah7ecNAUjMUJ8joyxh5y7ksbuqEBHDi3MYURU3qwbGUH?=
 =?iso-8859-1?Q?w5X+/X9zjY9ugci8azDoEPGrDRbBqeB8AKcdcMninxxKRm55yS2wqvLulC?=
 =?iso-8859-1?Q?7DktjfUMXj/3PFBPpV6Yxwe6UUkasWjLAOCPUV3EKrPnF4dw1AwD8HN8S/?=
 =?iso-8859-1?Q?jB7u9mcXtm/sW+BXXXqyDmNAt/W/WtQhvWHXZi4O7XITyTCa9VpsJv4KZV?=
 =?iso-8859-1?Q?a98BfnG1SodEt50qUpNE1N03jYhWrqRuPdF065SfMmZqhIAwBukgu1MocZ?=
 =?iso-8859-1?Q?/ysW0JPjkv/aWu2GUsM4Sw7t/Zl4EoBxA27r7vnzm4hHxSw5pJh6c9HNwJ?=
 =?iso-8859-1?Q?VPsgRoXW5sNkuC2jeMsyHodrZw/1sKKPRc/bzXdWmji6mpf7WzAPfZ/fks?=
 =?iso-8859-1?Q?CeLz3SxqFhxuUGX6E0jGDkH/XAX8KwNwzClGOXzAMuGzHQ4yPJNl0D6EcC?=
 =?iso-8859-1?Q?xsZeMEDjQTHgEG4kXQ6Qn0eb3xer5UuQBYqqGhIJhDG7/Q/b2Spy0y07SD?=
 =?iso-8859-1?Q?uAEk6mhjj2wXdjNsdcEzzhMqWHk6B9iGl+C+b850f42uyE6pHEcLbDNImZ?=
 =?iso-8859-1?Q?EIO+0IEM5fyIHHexK/uAEE3bnjMonM+4/5Yqm6W79+JVcCCc+uMoAf4WgM?=
 =?iso-8859-1?Q?SsThqJI/phTPJF+Mxkjvq1hypfjuRX0hCO2MaAFjafwUJHXm1r1SY0Yh3d?=
 =?iso-8859-1?Q?pgQugc1Ax+StTpsZrErGUTmW/YvLQXG0R4JEFFhADwztY46b29SmCIM7QE?=
 =?iso-8859-1?Q?SBsSl+QWykLr4dRYzjuBSfRNv7BXhAoSyK/bC4EYQSVbXmeEUq4wPBsVen?=
 =?iso-8859-1?Q?KoUXtK/hutaf+HJHCrHF1zilYlV19QSOMdku80QWppBXZXoSFLaZB5ADrW?=
 =?iso-8859-1?Q?cpO+InHM49DQT2GxdWu5TTvG934P2OyVrS4Aw8mH8QyrnOu2E6ZR3mDTni?=
 =?iso-8859-1?Q?+qo6FL6O8Oza4DYCmdywgWX62YZeMrg6B+Leh5SCtwxOI6/9alx3xuUdzS?=
 =?iso-8859-1?Q?+h4aCf0WPjWiyEKjuP9lGO2OtZCO7AypQ033gSUsWDmoeCGBfmVmrkeafG?=
 =?iso-8859-1?Q?FlzqmC3DG76aKYzZ/BVd5HT/8G7XFhjdFL1IoDfCWJPgm6Yce55dyjhH1N?=
 =?iso-8859-1?Q?/l/NfvSVfdUKauf3LufshJ4PwLMOyc1/iAayP1WHumyNkgoLJ7nWWnK+xO?=
 =?iso-8859-1?Q?N7C2BAXeLcTB/uUl9p4tJwDiTYDrGH/pGmbHZ3Ux3B7k2X+SueRJX+K4Uh?=
 =?iso-8859-1?Q?RzbGU/v5pev1eSWbM7qbAT3MQmUcv+CgdNYjlw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LtgINTp2PMDn0o/rYfh2qjlvVyskLpB+1Iz1kH88LZ7yHF6Mjxl+nV2hob?=
 =?iso-8859-1?Q?dmX2e2dE40OE5FM85G5vOn8zDYHMzxM7JBkojQu8n7GRZY1Df7wj0FjTma?=
 =?iso-8859-1?Q?/kmNtOQgxQC63BPMpNrq45WaUORfOZx948FWzsBBuw+TZXLvHlJLmzww6b?=
 =?iso-8859-1?Q?lJfgj4oW8Yzjb04+tDAaStL8nZGflyaQ2WoGopNQ4CoObwwWNtvY5h3xgb?=
 =?iso-8859-1?Q?ZqoIMtG28QUeTk+g89RZA7tBu2uXmiN/n89nW33Z0tLbVa9+jCW0OlE3gi?=
 =?iso-8859-1?Q?lV7TMNurNdlZW3DfhKrQ4e30xU8izm6oIBDDJ9qq+aXLVZrTPMInJeIKDB?=
 =?iso-8859-1?Q?XQ9SO5Tu8+vBQnQx9Sfov6JiLlp1lYHFE4qHyAtRRG3BSdH2h/kz1kZ93s?=
 =?iso-8859-1?Q?MDGT6A4+d/RmJ7/v8iUMPzqcHW9ifmApX3oKa3MT0Wks4hWZaoWeseidln?=
 =?iso-8859-1?Q?qqmUTJSty6rNXpGN2dkv86li4O9vBUdYxRyOlgicEJjY0qi2bqX0vlLipD?=
 =?iso-8859-1?Q?3+ZJS+9sxPlPqqCntmbmH0oeg9v0bbYtRW3z+kO0e6XsjvTo2OouF2XcG+?=
 =?iso-8859-1?Q?u0saDm4WQp7jjNkaVVYwHknSdUjekOujlsydHQcxvmXoalO2W9PEjfdSpT?=
 =?iso-8859-1?Q?ZgJFkI74lgvpe7z4QB10XorWzMTzb4DGw7V2wkI17jPpBXZEZuVnG4pS9a?=
 =?iso-8859-1?Q?rOG+OrrLUJrzOO9RTtZqed84KS7zRbUvKOBz0St8Jx7+7329ypsY3RlHAS?=
 =?iso-8859-1?Q?22v6ERg/OEEIunMuNzBg55x++rtpzu26HTdL/IxPs7ejsRKk63HgSdGMzY?=
 =?iso-8859-1?Q?lqqUkQuExUZaVOBF3cFpeACeXLWC2np7sfHnQHrbi6ukgzxalhs3il5HJB?=
 =?iso-8859-1?Q?iZb8J3GZTZnNNb6aNqqKu+e51sbMknkoQfmSvurXmZVHrr71oLIWnBxW+/?=
 =?iso-8859-1?Q?i49+lJ3Qk4tvpJc6EuymL6QLbhzLu3VB+M63wQyl7swqIiF4xGE3v0HmFw?=
 =?iso-8859-1?Q?JrnjLrxGRPczIuH6PmIE15xoGyFiBsHFhltix8IK1J5++BxVJFkw1XUpcx?=
 =?iso-8859-1?Q?T3Zgdgv5StbH1p5yDLxKWDbbjSMHLLBx9P3TxCiqvjfs9e7HyNzhckYw9X?=
 =?iso-8859-1?Q?heiOy3lF78w4lyupw0mTL3Djhv105iLeYeE0p2liJJL346PDK3L25a2zxl?=
 =?iso-8859-1?Q?A/oHuRoVrz0p/blhviw670nx9Q3krTrgVg9JJn24/xZhcSadPz9gmxTYub?=
 =?iso-8859-1?Q?0zMBFDd+Ed9oMTv5QRFFV1E9ufUstxdACF0hIBhTJ/ukXFX+30EBfeshq2?=
 =?iso-8859-1?Q?Xeeyp7RdfAbwZhjQijvSxT7y7+0kpX7fAMunvi6lXmzXM6TgoNr3HDgHJ0?=
 =?iso-8859-1?Q?+1wWHLWjIiyFTGlgawNxlCtAeVyDAz7XkVk6C+sD0V1dtazlmeN6hemvBq?=
 =?iso-8859-1?Q?UGBjpsACMKf7MKAxU/U25OynnrMLAvFTp93Dov+m3/uqmrWFg2zFabCd/V?=
 =?iso-8859-1?Q?fPbJmNVLBjJ0ypFSzhRJYyz9A9pVp2ZQ+hRKMWOvlml2kevG+wA2Z+0eJ3?=
 =?iso-8859-1?Q?pHmN5iI2jaQkmNahGJEuuToNgoEzzaOTEp07YS9xLZXcsn9r1GGh5Ax0Di?=
 =?iso-8859-1?Q?5SHKiXpnIV18oF+c1T3GR0OJaHMCx85Abq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0315108-c417-4189-b741-08dcd89140bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 09:55:54.7397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewBdo8jZ6Kdb65szWiOqkLrUMVWVlBSmACWZqZC+GuFX/QnbTBe9cn53l75z6H2TaKSYk4cLa7anFkbQ+J3inA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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

>=20
> On Mon, Sep 16, 2024 at 04:49:18PM +0300, Alexander Usyskin wrote:
>=20
> > In intel-dg spi, there is no access to the spi controller, the
> > information is extracted from the descriptor region.
>=20
> Which information?  I can't tell what this patch is supposed to do; as wi=
th the
> first patch this shouldn't be standalone.

The patch series was built for review, it adds functionality on top of each=
 other.=20

>=20
> > +static inline u32 spi_error(struct intel_dg_spi *spi) {
>=20
> > +static inline u32 spi_read32(struct intel_dg_spi *spi, u32 address) {
>=20
> At least these names are too generic, please use driver specific prefixes=
.

Can be done but those functions are local to the driver not part of the API=
.

