Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7197C794
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 11:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CA010E6C7;
	Thu, 19 Sep 2024 09:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAIjjuD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FACB10E6C1;
 Thu, 19 Sep 2024 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726739720; x=1758275720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CEhIz8KdDw5e7V3nyCEo5vVZoi1nGJkD+JpUs4zGt9w=;
 b=bAIjjuD4KzRHJn9B5Mcb/7SvEKb75pLGpu/Oo0Zr2f5Y+AqSfYKwoNSQ
 Sg59mgPVF57VLyqcGs/5HPjBn5WiAqcDMDEpeKt19+Fn7mxL06diT8y0v
 Ycp5XCYVCYvjKmQJXGlp2PPeAp+psNlK9U7PkQxJnG0UL1lNRfHdXXLWk
 DFtkKCwmHcTBYC5twvSCquUH0hdpmj3Rk5scWifdpsK1y8JylAqtwdO9m
 10alycFc7Vi6fJY095TMEQoXoOmrppYmebR8LbeoU60KBWe2nd13yUgbt
 K+F5UVBbv7RIqgQ33biO5DyXmNh+uWVkHQ+zyHBBlPokKfTzXJRTJkox2 w==;
X-CSE-ConnectionGUID: LwJF5L5XT7WdwVCXWRJo6g==
X-CSE-MsgGUID: 3tU4tvvwQTyiiVjaJeTI2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29433773"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29433773"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 02:54:28 -0700
X-CSE-ConnectionGUID: hij6ZS0mQOqXp8GTSiZnfA==
X-CSE-MsgGUID: 2HcZgsMdRjazJUsVaQHNPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74665591"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 02:54:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 02:54:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 02:54:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 02:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5fP51BON74/Q9w0yRn9ElNFMTNWzC2NtJV+ZmGAsaysR0zOvAFjd+VdUmsnXHzxapNTb3+qbGQEHmsueLFQ7zzwQB/lkTdJa8LBDysVnHdiNFsDd51kXuVOgc0XQxhCwUsgTJjkcXh8Yuo3cySFW3iNeWrkGvqkgKXyxnNMEtRxCwDE4iCznv3Z8KJzMy06u+Q6n62kPg+8F+9j7Fwvt/gC/IMOIPV3y16SO2s9R1FG0URVVgbImwk1Nw73xauAB0GdfFuCysSx2NW8a8K0VElzf6PqLrahHyeJNEDWywKuM3AOBwzsJWoKh6v4Y6vM687sfgpZEfLiJ92S1xmrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkG8UINxPidG3c0tr47FSwq/YlP49iQkHjMDHwy0uCU=;
 b=wIzAzdPahuvnOCGPeQH/O/2oS+UZl/QfPW8kMimlH6oGdgvClBsquT2vdUnbeCvKz4CqXgepGOoRkp6LtBxKUDt4GMvsV0H919RYAmDcTMwR0NJIN1l11SIdBYmftaCkr62BPP892lAEVMfF2zj4ymHt4fUX/OXV4DsH3Bo11pBgawl5RZTr3iioykl234MifLLWl8KzpGuJofuIXdQxPHyKtozX1GGb/M0ugakfkQ8b7bpyUd0/071rRYgVFoN6G0XBFaqV3CP3uuNK9VXGD0UL6SDYSmTJG+xBOORXf/YFa+IeluNAlIXC+ZM1vHDMrUWXsDHN0y1C5cQBx7VZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 09:54:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 09:54:24 +0000
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
Subject: RE: [PATCH v6 01/12] spi: add driver for intel graphics on-die spi
 device
Thread-Topic: [PATCH v6 01/12] spi: add driver for intel graphics on-die spi
 device
Thread-Index: AQHbCEBkZ7X5wnyiXEe3qiGmampdoLJdjhaAgAFR0EA=
Date: Thu, 19 Sep 2024 09:54:24 +0000
Message-ID: <PH7PR11MB76057D2326D436CA9749A113E5632@PH7PR11MB7605.namprd11.prod.outlook.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-2-alexander.usyskin@intel.com>
 <ZurWk_eXSQndgA4Y@finisterre.sirena.org.uk>
In-Reply-To: <ZurWk_eXSQndgA4Y@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7605:EE_|MW4PR11MB6665:EE_
x-ms-office365-filtering-correlation-id: 9bb4d614-58c7-4424-4d39-08dcd8910aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?bOexls95ITvJmgz11RSaC7GEBzKJynDIGaict2Hn/rJUQOfj3Km3G4hkFP?=
 =?iso-8859-1?Q?7HJOK/oJL4SzpdoV7gvoMxO0kMzXSYSga2agcvRRhHRP2V6+N059ucx/U8?=
 =?iso-8859-1?Q?/4+LyRCEoVmrZbdp1As+4s7AiEyyvsJ2FrpVa4LgBIavIYjUd7mlDUXb7x?=
 =?iso-8859-1?Q?/8vJ3j11/DVLBd014Xt5mysI6/eJuHCMIjrSHnqPzQPyyVxGQ6LqSWAzQ/?=
 =?iso-8859-1?Q?evBeEXONFRnzCvoVkC5X2mjn55BWJ5CnItvbImc7qvRdmltBYWWAr/7vYg?=
 =?iso-8859-1?Q?wtr5VFJe4Oum9YWavpPxIpolo5QPQMeybl5n3aziOzBvxV6kJKwyvnTL0/?=
 =?iso-8859-1?Q?1AusBXNXxgHubvOIfeu6ZBlmZ9Kzeo55aNlXy+q9Cfv1ZDl3gHwuNASL1D?=
 =?iso-8859-1?Q?iXGLWMDu5t4kQQKMqFXWirGcVQk//76yPh5oZEPJrOd38b0kUM7mdmjVQJ?=
 =?iso-8859-1?Q?eX09KOBnkjtxihR2ftT1P99VhynU1ZPKmf+e6sa7CHGgqKolqe9BQ+dmsU?=
 =?iso-8859-1?Q?MKlx19RgzH1cSV570azz03a4izxvM2ul9sQNvQc8+fmYwl/V583njy7suM?=
 =?iso-8859-1?Q?ckIWFc8R6LKSceWMCgDVVp/ZttAcr/c9pnJ5qIbL8PwT9IdkSV7HZAZKs9?=
 =?iso-8859-1?Q?S/s85c/nV+Df7VEf9xfWXzcvjjRAlbX+ShAR5n52+M5fkQ00G3nTdakhRf?=
 =?iso-8859-1?Q?3mcm/cmirJoyx4zblkMLb2J94ilnnMcSulUojQsj1QZup6hxPBpmmkW/Zb?=
 =?iso-8859-1?Q?SwT4Vx18Uan/XKtS/twMWuxvTPnSHWDdmmdw6KXgZzgflN7cwRSkp5AOCS?=
 =?iso-8859-1?Q?WUhO2bp+V1rUVSyeWMG8fl80DoVr/MFwSmC7L90scilvjB725kp7xqP+dc?=
 =?iso-8859-1?Q?rVRWTTLHSbkVZRl7BgEnq2rb3s0fQuOsa3kS6VX1KZwpwKbss81qfIUwim?=
 =?iso-8859-1?Q?RPzr6MxKIoo0CSqtQJoIdg9UBryiGlyrQlE6h1FtYICp+4Jy04EGcpUxe/?=
 =?iso-8859-1?Q?/V8MhgmWtq3VqdPnAqRb9iawe9w9MqOKYoC2/dNd1FGFasrGql+uyrdvVU?=
 =?iso-8859-1?Q?xt6Qu0QR05a4DMFm232OjHcXmR+E/WGAiJ/K4WOjeWQJuxmEGcpq5g84yG?=
 =?iso-8859-1?Q?Dz76l149CI2FigxMl/uomQb/64foN9QOq0Jr3E7/2blXe83KgUDcMkgapf?=
 =?iso-8859-1?Q?r1OWKoZYOWVsjm9uP8PIAhccMxn6kSP5HrEzZ/a2ZEVLFus5lRADWN+N6p?=
 =?iso-8859-1?Q?3IgmtfdKvw2g/LdH3skCDcpeZZAudfdokW5fXE2yd80a++au+w8YjEMWOE?=
 =?iso-8859-1?Q?Hk44W/P7Ga0YuGLC0LeWSMIS+jeSHzcCYxpCEBVk5WlSbvcEb/P2wydtd7?=
 =?iso-8859-1?Q?8omh7w3dN39iZnSvgjWqzMzmfBRf1ngTgsw/V0ZSBzRzLiAdZUBrZ1hWeo?=
 =?iso-8859-1?Q?xq3ICpNHwIOHwlSVROEmwYQaeqxG190cQr9Law=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1jQctiPm+8bbEPAg4lF59tV6r0IFFfxZq2olpCtOnZjWSwf8aQhTFqc/Ua?=
 =?iso-8859-1?Q?4DLMtJAfpo3cRTQObAyOUdUstv5I9FkSIOr3ZmqaGxl24eMquo0oHqOg+z?=
 =?iso-8859-1?Q?1xGAIXnb23oCqVWJC4ksBZFpYblPeKEcAwzUYQV/0fgqwlG6unR7XCPt4J?=
 =?iso-8859-1?Q?1vzy8suTU2j0DclgPOH/MUTNxDs7JOz0X2kyzEZKffFJVW0pKh/LuJJQA9?=
 =?iso-8859-1?Q?YF8vVc9/M+TdxRzAOhTvpvGrUkLXlIGDWdShTRvJ0Lq0uAGsKJB2zXSqcj?=
 =?iso-8859-1?Q?jwesd5PtQtlh4BZ5H146eqGjACDIWcBa7JQ/qPjoJealobc8YlROfB8HZ6?=
 =?iso-8859-1?Q?S2QEB2gAcVEw9LqCqKIScehVHF9gF71kNM6R9M0LsCRpL3n12VkukOfry6?=
 =?iso-8859-1?Q?BEGBLtNySQ/eKpf6bu+FrWbpLW//qwcCK1RooWd7vMTIsRHCRrMi2AwIuf?=
 =?iso-8859-1?Q?OV++F/07nf/7hNDKcblcZFpqbqTkk8AKIiFOS+YUVAjjF93VLzu6GWnuGn?=
 =?iso-8859-1?Q?HChfRQWtXQLlU3fCAopreMd+6T1XHx9fFwXWBQFVYlUtfRsU8G2vcs8gOD?=
 =?iso-8859-1?Q?K1Aa4EiGJv7g/GaQ4RfH4uFkZ44saXeULSjDTC7JDv0y/6LebagGuU3Kek?=
 =?iso-8859-1?Q?70QV/+tNrhK6X1/8bMcIR8pY89PaWJ8sfeJm5Ipu2ThAXsZC7Fn6KcsI0G?=
 =?iso-8859-1?Q?HGErz9YD3/QjN4XSAufusWalvsdlTtYDoDHdHpQMtsa3255qC8kTCIrAVr?=
 =?iso-8859-1?Q?/++DhDq9StSuRyb2i9z5Z25LKaCyo6XD4S8IDyLJeZIznCJjAdbzQ9+TMT?=
 =?iso-8859-1?Q?RX05+lLLFEuU3J/+AXaDuvVHxHXIB5MKu//kAbKoEFIlqqrNMM47BGJOOP?=
 =?iso-8859-1?Q?z5umRyZxdpKOR8JZlSuq1nfR0QotxRHgsGa57IODmh/EQOIPnrkisdFG0R?=
 =?iso-8859-1?Q?8rTjpizMoJ+SGmlKch4psDdWBXUyHTO36H8veGx4nfFX4z6YGOeqcMpORP?=
 =?iso-8859-1?Q?htKCmvtgVZKoFq6SX6cxerjt7vU5tf5x/g8/QjIdYoMNGHPgEVHEvL56bM?=
 =?iso-8859-1?Q?ynUO0ulyk3D7k8Mhh6RWxddW9wYgORUpRyMZwbzxQpJzzJn9qr4Ga9diI5?=
 =?iso-8859-1?Q?f6ZwBn88nNHCMcOiRnNv/sTe8RKa58aHySFeoYlT+Xcg2wd4Q1Sw2w9EGA?=
 =?iso-8859-1?Q?6QxxTLw3hobwHZAwapTGovNSMMOsgoIQf47Fk1ILIeqa/xFtLmYOMn1NqA?=
 =?iso-8859-1?Q?+YLgKWzHPUIeaUx2p2pOFFyddD3ueBZmGUpDH7PaRREY+zo+tjzfZFHF3l?=
 =?iso-8859-1?Q?tLr4zsltf8jrt1J4muGYB8Tc235Spy7I2GtqCYW0qNzxIlmFXgfv5d+CT9?=
 =?iso-8859-1?Q?nBDFOd0F5L2wr/mzl7gbtcDvc0by6JLJoK5902OoBNqTZTufO28YG5D6my?=
 =?iso-8859-1?Q?1v/VnluTm26kRhmB7Bs+HWw/tXrCCzNuTwt4AwiKbrIbL/uQ/7dpSzXiF8?=
 =?iso-8859-1?Q?xJ9kyoB4J8ZAm1scYKfyy+VvgU7qxXSVyTGjsr8j97oXdE4YKqyZan0Bar?=
 =?iso-8859-1?Q?TSQr7BXTIYkQFeA1cuNCqjvGLm59wfFUD8fhAcyn8M8xYLBxmPV3z9ipFw?=
 =?iso-8859-1?Q?8lrlO5Tr3VDebog+Q4qtxz+ScT+v8GDxlX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb4d614-58c7-4424-4d39-08dcd8910aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 09:54:24.2531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwa8+j9CUywmy6PMcZ/+dm3VpgzbQH99XF1T5W7ZmctkzYsOewGqk8n1gdggHYW9dKyuHFZnrj4T8QqELVU6tg==
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
> On Mon, Sep 16, 2024 at 04:49:17PM +0300, Alexander Usyskin wrote:
>=20
> > Add auxiliary driver for intel discrete graphics on-die spi device.
>=20
> This doesn't actually do anything AFAICT?  It doesn't register with any
> subsystem or anything.  Please don't submit empty boilerplate like this,
> submit a driver that is at least minimally useful - assuming some other
> patches in the series add functionality squash at least a basic set of
> functionality into this.  This makes review and test easier.
>=20
> > +++ b/drivers/spi/spi-intel-dg.c
> > @@ -0,0 +1,142 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> > + */
>=20
> Please make the entire comment a C++ one so things look more intentional.

This is how it is required by Linux spdx checker,=20

>=20
> > +struct intel_dg_spi {
> > +	struct kref refcnt;
> > +	void __iomem *base;
> > +	size_t size;
> > +	unsigned int nregions;
> > +	struct {
> > +		const char *name;
> > +		u8 id;
> > +		u64 offset;
> > +		u64 size;
> > +	} regions[];
>=20
> Use __counted_by() for the benefit of the static checkers.


Good point, it's a new C feature.=20

>=20
> > +	size =3D sizeof(*spi) + sizeof(spi->regions[0]) * nregions;
> > +	spi =3D kzalloc(size, GFP_KERNEL);
>=20
> Use at least array_size().

Regions is not fixed size array, it will not work.

>=20
> > +	kref_init(&spi->refcnt);
>=20
> This refcount feels more complex than just freeing in the error and relea=
se
> paths, it's not a common pattern for drivers.


What are you suggesting


>=20
> > +	spi->nregions =3D nregions;
> > +	for (n =3D 0, i =3D 0; i < INTEL_DG_SPI_REGIONS; i++) {
> > +		if (ispi->regions[i].name) {
> > +			name_size =3D strlen(dev_name(&aux_dev->dev)) +
> > +				    strlen(ispi->regions[i].name) + 2; /* for
> point */
> > +			name =3D kzalloc(name_size, GFP_KERNEL);
> > +			if (!name)
> > +				continue;
> > +			snprintf(name, name_size, "%s.%s",
> > +				 dev_name(&aux_dev->dev), ispi-
> >regions[i].name);
>=20
> kasprintf().

As I understand kasprintf allocates memory, this is not required here.


>=20
> > +static void intel_dg_spi_remove(struct auxiliary_device *aux_dev) {
> > +	struct intel_dg_spi *spi =3D dev_get_drvdata(&aux_dev->dev);
> > +
> > +	if (!spi)
> > +		return;
> > +
> > +	dev_set_drvdata(&aux_dev->dev, NULL);
>=20
> If the above is doing anything there's a problem...

It makes sure the data is set to NULL.
