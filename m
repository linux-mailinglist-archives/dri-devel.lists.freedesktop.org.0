Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB825A252D5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F0210E3BC;
	Mon,  3 Feb 2025 07:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe2rlpoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035CB10E10C;
 Mon,  3 Feb 2025 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566711; x=1770102711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=Oe2rlpojcZKePNkksAk/Xwr8boddEI/ulpo4FwYdxOSDZ0HVr5W9qx+v
 sB6AN+z9LpzOtP7ZBGGj/IYNvSai8TJUAAucsJ1QiHAUScMlQoGWHQZ2W
 mW2p+CD0Wzc+3MknzRuyJ4d1kwzMO3jKcMUpCgOh+99wiEIspP7H4ffr4
 8NHXh4IMBFaX+Ioiubmno39481Fhm3OBiA9vWEJ+5BFCGj5MMJRU2qsBM
 WcM2tNpy6mcVK9nVB2eVHRExyU8Wh+GZ3xW0fh3/t4FJUbqB1sWY39G1o
 Sx9Hw5HEF6+ZRRAa2jBYGXsfkDKeCqO7THsl/g39BI7pyWcJRVWgwIRt1 Q==;
X-CSE-ConnectionGUID: oFBVkunuQh6A2iXC4sEYgQ==
X-CSE-MsgGUID: zKlP3+W2TIGfH51OmX6i2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49306251"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49306251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:11:50 -0800
X-CSE-ConnectionGUID: lD+OoBgjTyamnxRSgafiiA==
X-CSE-MsgGUID: GAVlsEi8Rp2X+VpiWpJnbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115188165"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:11:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:11:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:11:49 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:11:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuJSKqMMaMWZRAZEQ9JD6zR3aZiFhFINtRKE5yTagewo0Hq6NX98oohH51cRd6iCj/+ClMz6uTlXWZI3Q/MKLiakFcNezilobN3/VxLiKOBQQ5KYd6dtmyK/N48duM1UQLyW7m19a8lz1wve9FEzHKPZ1eAtPxh8kBcWRcD7aqTTLxhmqGJnWyYdgP5uFSmGR+k2YtJOb/PlYvcONv3SU/V7+YiG6+vfylVEAhh4lnL4VD0noqIePWpd6vPSz/MaUX+gXlblCa+3GmZZkezQ8qqK+dDv4WEu1wY8DvIbwE4nvY9CX4IL+r4LejMQ/oAZ6iPoIxmm8I3AnRZtQP9trA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=OfbZFioqhYNBShdymXyWM1pAlXSnDEec71UrunOvoLQ94p2qPTRWAjalDOZQLfAfICKqSwBPHtkezprr3bHUzJS3f5/VxEPbVxC7jRkc0jBifM4HqWh34qeQbMLckraqVC8R+tzt+XmhUysrd4A/q5S/8bsP9Xp/Eq7GrX9GUQ+hlO/LLO9okczHTYQEAr6pX00JjuKdJXxU5uWAAN3Dn9vtCQawg3SAJtdeqgcu3DNkfxDiovCXPVVvr9dbaBTo7XVfypUmQvM0CAo1uaBc+c6Yr9HIbn7SpL9toDsXvZWs8dKklQiwTlGRJgALGuaDOlSJkbzovK+XcuAy/OFThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:11:46 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:11:46 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
 brightness in NITS
Thread-Topic: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
 brightness in NITS
Thread-Index: AQHbbiN4PFunbASRbUKflyNyfbgs7bM1OW+Q
Date: Mon, 3 Feb 2025 07:11:46 +0000
Message-ID: <IA1PR11MB73431F6354A58AE2A9F58962EDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-5-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-5-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 2dd3ed1e-ad99-40ce-a0ed-08dd44220561
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?SBJMRZ75tuiow2hYDN7so2CvQJ9NcWxIybS6Nlu5workB0Ls58PRnzvVXKK7?=
 =?us-ascii?Q?yW23TqF6sPUe/alH1z4DyfIeweN7a2Vl3PZER/MiqQX+SA5e0tW71AYkJ0b0?=
 =?us-ascii?Q?1dlCS1CU5Bx/d8gFDpnamkXVQWDZbP24PhsRPQfKmAEgmY6k/emxidflhktT?=
 =?us-ascii?Q?ObZGM1BMnTQURXojeETuIlMxfWL/oMlr4JPhmNGzWAaJZ1QUNYp6TLCOgIyg?=
 =?us-ascii?Q?5k8gJw8kSly7b9Rv8L0cvgRp3mSpXPBW1IqVCKgFiK5KwiZMaPon7BihYDL5?=
 =?us-ascii?Q?v9Cixmg/4LY6O1mnTNKP2mSXU8aAIyrVF+CXCXvz3xN6N8rmaBC8Y1n6klwn?=
 =?us-ascii?Q?QWIaRcDcCmfhGfP3xjsvJQ2uYgA9gSAIgs+KSlBhNxLY0P6RZRf5NTmVpC5F?=
 =?us-ascii?Q?eNY+MmfKJxrjspZbDLV1ujsQEOIHJ53KSCQtcIRMrIwPj5j1XCjNVstZdvl+?=
 =?us-ascii?Q?7IA3bFQvK7hOu9h033RyL050tJKnXYoyUc/clwkd7kvhAgOVNskRmWxiJy6o?=
 =?us-ascii?Q?RoJgcuwCHUC527OyqvteYFkTzU6etjq1ytYVmIBIU0G4S5Tbb2/3Lf1xikAD?=
 =?us-ascii?Q?LudU5x/X/C4N31r3FVU8o7D2hkYbZk9S5MOx39a3xiTj5uqvUnRQDd3sz09y?=
 =?us-ascii?Q?9baRVkunhHNboD1Z5jFy6nrMOGc9vKjPMUKfrYNLOTzJv8VgHVPpniC8kA5f?=
 =?us-ascii?Q?ILEDECADsT1QGMD2CZX2ejuPypSV24R5dgBmytFbGxoXGf9yiW+bjoF4WsG2?=
 =?us-ascii?Q?0GIhhewOtuS/du04O4MujUUd/n/4wepMZEdtpbEGBpbz+RmqHl7A/qe3cfkN?=
 =?us-ascii?Q?neSKrkr+qvlviK3LFkp7D4NhYtP5gIAQGB+uw8qlk4dAKhkmgE1kvZO8cNmM?=
 =?us-ascii?Q?n83IHbZ1bc32exeDTfm20Q0dnrY96eKoqF+u3Vw+yHdGxQMsNalK+OvTcHns?=
 =?us-ascii?Q?7gFzt9tV9TmoJImV7ej/zM1LocETp2UOMJhMZN6lkA3opKBoWIsL5p6vNkl6?=
 =?us-ascii?Q?Ge/9Rhw6/JKl5a8yNIWm8oHVARusiFMit3Kse9v1ni7PVYfIAUSU0RYdBuJl?=
 =?us-ascii?Q?WUIz8CRL5Ic2U5fJyDUKP3y7LuME5tiOdbPPOPA06b/ULlffiGgLGMs30YN6?=
 =?us-ascii?Q?VUJU1XVk5o3Fl7eblFZZqp0RZSO9NJ9xBSK0UIi1sctVg7MPGoBYmsIxmD2J?=
 =?us-ascii?Q?QIv4MyOJ1/XCLk5tpvsVSNDFVZZ1h5z/gR0ggqJhkcgDT7dd336966+KXj4G?=
 =?us-ascii?Q?qDT8UyWNAjDgzwDBDJO1NhD7zUTye16VNS4liUH826uzpFPvmIdwSIQbSQby?=
 =?us-ascii?Q?7qMbCfQZ+QkCjZotYHN6NFa7I2Dy6XmU55W7RlP4BNuICuN04itgAYzc0H7S?=
 =?us-ascii?Q?Ycs42QS/J8FlRCoqX6s1GhGq/2dK2WCLCeKSNu+xn6x/CA8HHVZ8WrNxDLtr?=
 =?us-ascii?Q?MUoZtc5IT1VahesBu6juGIGGanchibDd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PAKuzJlasV5THM3ruhdooKkRvq09wqKOxzpILn/6QDeTxQtt74rYls7dqm2h?=
 =?us-ascii?Q?j/+diYe3DbXZ0C2M8wCq0sCGyLrDm60QkBtvDz3qU0okYX4xBctqAhtD+4lD?=
 =?us-ascii?Q?jSSYRIFXYRU+3CYBIqzkLrEx9Yozt/JspyIlkx99KloSvUeT9jWlvPY3KyKV?=
 =?us-ascii?Q?/l+Djr119saWfPV8Qm1OEtbndrnWEcBOftw2wf5PrM6TJj335fGhj5F299CE?=
 =?us-ascii?Q?mn239TJvWIDc9TsKTOLleel6vpWwLefWJ1jrIJxtfWEVdRnUhsLq0fjHddB1?=
 =?us-ascii?Q?cDtj3djTnPh+hn7WnYrp3V6uMT4OQafUCpzk1QwNYSxui/+GBQe69A1UX/GQ?=
 =?us-ascii?Q?YkryvhsA2+B/gVi0k2yiy8Teyj/XL9E3ZwAoZsHG1aHweUttfSMrNmiPEmdl?=
 =?us-ascii?Q?5N4GPLn4cK9l5z07snkZvjwlfS5/p2Lz9WwCIe0k50va6LvBTHQIOONjSevj?=
 =?us-ascii?Q?KtwpNQscrM0M/hWO47sQT4YRyYqsVsoJkj5popGjjJhjsuByqLL6cH5a3lA6?=
 =?us-ascii?Q?MINmuOc4qroVRZMFYnCCp7FNybT2wm2S+hCeQeITRs33Z7VtTaS3XZXlP+6S?=
 =?us-ascii?Q?WhFkJwD2yk40ODRgkOrM1q/1vbGI7y6xaTmkfWG/7iH5kD6Zhuf7MOeycEQC?=
 =?us-ascii?Q?Oq78EXViSHHGSXU3J4VtsZJ8Tm2g/eh81ti4SS7DvwMp6556JbQAnlC+M71c?=
 =?us-ascii?Q?GdEtFS5+Ttze/n5d5kx1wa1Uon5xpZS6BrcL9yCQRXeZ7pp5QFUlNDlXBAaY?=
 =?us-ascii?Q?NFiYI+3kUkHuuzxv6Nsh2sEVf1FpSAEpEifO19qKId7sYM6XYhyKwmcktVnG?=
 =?us-ascii?Q?PKV6+yoMMjIcSbmlVgW8pWYZwo/4bK8FO50BcLMz9NoFbtGyh631GcR1tGGJ?=
 =?us-ascii?Q?LApUG/2T/IVLaN+b81BuzC3+oO3w2R4h5pEVU1n97sYh1s/t4rc3UqerFuKw?=
 =?us-ascii?Q?WqViQxXyR5n8ktWeS0Q15tPTCGxs6kHbMqYOxWqjygyyuSYAfjhMFEjgAHGG?=
 =?us-ascii?Q?+W0L48NOqT2trvkr6hDwNE37LTmdbAFA4LLiuvaeR271U+1vEjsrDbGS1wjK?=
 =?us-ascii?Q?1jugQ3OgepsOIAtq3laKT6gOwpUCy2vqRTpfp+3G6bWw9j1ZvHQs4XrIQmX+?=
 =?us-ascii?Q?+gmBwH3Hr1tKYEWtApaJoUdGeiPP4WPpLm6gd/IyR8ryJqsKHeuB/umfG1Tz?=
 =?us-ascii?Q?ZCcIIs33jNi69wN2dm44mu78mdQkEwir3K1CbQfy2fK//P6L3Xtnlo22OCHX?=
 =?us-ascii?Q?Li5R3av/WPWaFB98/HWONjUY7XtWJmkRWVxnHgKsauujixJy4aPAeG/oMyOG?=
 =?us-ascii?Q?fRzZopSkQKZFKZcCpOkFSIXkJ17XzItfRNaBI75co/YvfEe6Esb6mvkgM4Je?=
 =?us-ascii?Q?1ptDZueXtWFcPhDPabeT3xsqbs9m+4LgiRqPyinDS8KGCOni0ycsho2F/Td8?=
 =?us-ascii?Q?t3EtajOzeM2iKqHdyKy90Xsa0mwX+JdF7ZCOtwW7WJdAWsWleqTbP97esTCG?=
 =?us-ascii?Q?H4ZYC4rBQWTGArnfvn3cEY4dUAgzCzqSxsPsexQpqVCSlYPGK65F6VVuSpIi?=
 =?us-ascii?Q?W+byXvLSaLokS4I3ac0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd3ed1e-ad99-40ce-a0ed-08dd44220561
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:11:46.5755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjVF+P2HeYh54dpkl6YF6+pqn83zG4AkqUiEz6UpxpY+cQwmR1h98WcwBRzSoxrJim2mUH276/YI26z/+A0RUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

This patch works as expected with 6.13.0-rc7 on Dell Bolan.

Tested-by: Ben Kao <ben.kao@intel.com>
