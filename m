Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86531CF2950
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE9810E2BF;
	Mon,  5 Jan 2026 09:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VE6WS0PN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D5010E255;
 Mon,  5 Jan 2026 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767603872; x=1799139872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uUh/rrzyCw+C2thy3ldEuXwoNWx5HNTGy/A6IcYgg6I=;
 b=VE6WS0PN5SGBT9eLl9/SjG2ex1+G9BVjrsTRGiTyzIbXFuv3NWhXP1ma
 FRqUj/J8zUM4Ml+RNZsFUJOi8xRUV4ywdI3VXFvn79L1Zo/RtHi03z7DJ
 ZhFcaPT6Nh0gJ9OR0drdJFjFZUO4/SLTL79X/9+UgMUkHxwQddWA/oB9a
 yxV3mtUa14A/ETO8cpaZY2o3XFz8QXm68cUbyOGi91a9EjRfrCPMq5uhQ
 sK3IV+xOJVjlPe0o/0HvLFOEgEs6IWFofF5iPbjhbEg1qQQUsOx/5lwXH
 CqE6WyXqJadk3eaGjD+HrPgV4ajV1ARIQc6pE2sie7k0rnkoOlOUUi3vt A==;
X-CSE-ConnectionGUID: YfEFi3LlRQqeLKzPsQfhtQ==
X-CSE-MsgGUID: 7edWWufKTnG0FKfCdJrKew==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80336677"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80336677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:04:31 -0800
X-CSE-ConnectionGUID: jDh4m+BYSJmkUHFM6rOFIA==
X-CSE-MsgGUID: ESRVSI78SkiDhNrHnwN/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="233484823"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:04:30 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:04:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 01:04:30 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:04:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cS9j2wkUlMhDXjuPaJ3ppXrpbSvDw8rdTn+Zh0GzGOCI2Iwye5uxcfi4f0wZxUeNeCN8VpMrjieEGSh3VvXS7nYDGEQD3Qu6TgOeye2tVBwvNICT8Z+56OrK4OkvtbtPwMP7JvwYFNbdSbGJEaMy9avfam7PRQg6PPKrsibiAosJGv0AHWw3NccM4dEakKr0xkhPbFIEnKRMMXqL3cjJvSaJe9VPBp0TL1pJgbc/uG5q5R/YoSh+sCw804tyvPMvX6w/KCya4BIT5EEZj7lNyaeSgWfozRRe4bXWivh5+rRq/4fizo37bE7SWY+UMVXFUxmMHZA9e4SXhBCDNO6MrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xb6yqdwMIJRbDbYIWd+h9U8UdE/2ji6AM/55dEnxyDs=;
 b=sId7WzuoANC8ENaHX5iLLlfSna8tfkQoR9Hdnh9JVQPriHPYPbkY0Rmm9v8DMrH2V8PEZbR9/hEIgKDupkKbfkz3oy6TmA2xCkHNA2EOwDNYZh1ovuuz3oZfuPSCpImcuBHOR6bYD2KmsVUqxwcs3EwtAk4GmA3HplZLsS7ehkfTsfmJIvFkNQ4M0vRM+1/ixz3zOaDUuZ4w264WkBtESM23zOOrtb/Ly/YVsEPpaApSchn3TjDXRmvbKzGnIK1DBIFrJ7bpBFhR10Teb8T0QdMvFbofci8uAqdqGELIQVmr0aVM1JDokHsqkIIIrvazoQh/PGDwxXStHpPHQfu1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5151.namprd11.prod.outlook.com
 (2603:10b6:a03:2ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:04:28 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:04:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 04/13] drm/i915/display: Fix color pipeline enum name leak
Thread-Topic: [PATCH 04/13] drm/i915/display: Fix color pipeline enum name leak
Thread-Index: AQHccLb3tili+O+9pkOSxOxjkfaLs7VDYwSg
Date: Mon, 5 Jan 2026 09:04:28 +0000
Message-ID: <DM3PPF208195D8DB1ECE3050DE2BA5B9492E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-5-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-5-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5151:EE_
x-ms-office365-filtering-correlation-id: a4ef9dc1-1e9b-4118-bcc1-08de4c396ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qnsMFr7gBmwxVKpbT4YlsyGXtII36m7QWOQpNJcWgAYKgGyzbCt7mP4Ihtll?=
 =?us-ascii?Q?csSHdBADvvJNkOELzWHjdWnyy2cEnQVvnL6syi8uU4sFo8D7Y54v9XmKjWFp?=
 =?us-ascii?Q?8OyEKNweiaCD6bp52oBzJkzvMgxxnstY1OGWostKMik1mxhh6slCXP9QvxBG?=
 =?us-ascii?Q?7u46oosL7kanqOJwkcY9Nlm2yUvylAWFPJjazb5zeaAfO/xfwhhQPsAb7vz7?=
 =?us-ascii?Q?c2SoJphqvxg4wZTUZXk1fS8cLE3GKZny1QPXYdmc0PArliM1NXc8jjgT2e8N?=
 =?us-ascii?Q?lqLaQi1+C4KUHW+RQmYYCrE03fXHe619mBpIjHNfoZopjAguOeEzrED06cYg?=
 =?us-ascii?Q?AzAbzC/LAp1E9NntOfSkxDidU8jPGlFJc9slrJ6jumOuoGKIUtVu/3h8cHk5?=
 =?us-ascii?Q?iCk2Q5gyk3xYxpiLcFeJhJESBccrFVCjNpa17qBu0mUUuXK18ORBih8TV97Y?=
 =?us-ascii?Q?cPT5656uR4H0QirquSEqqEwqwwdllPGtynQ3tPhIMpiBDrJFHhK0BOFW4VQu?=
 =?us-ascii?Q?r3q3gYaUKoiaa7phU6Dg/7CfyP8fIFZZzh+zN1C4YXqOuxeqozXLPT/g+m+a?=
 =?us-ascii?Q?ibH0m6q0A5/F3hZTW29dmYBT0kcXX8UU46d+5eCqNfM+saovTVoyeG1V68rd?=
 =?us-ascii?Q?98GLUo1o+IdPYJJ5WLw0uymtAcdmnOxZcz9phZoAIQfubi3s+xwF0rYIAZpg?=
 =?us-ascii?Q?SUZu75JCHe/BlFXh6hPhViT58fR5pC/DG/XuUbTF/Yyy5ixy/VLGgmXTuszc?=
 =?us-ascii?Q?d2zjve62GSdipoh5I18e2/Aij9kEKWbXRVKhTPgqLpdY6+Q+mqfeyaoCQdSH?=
 =?us-ascii?Q?YzGl2EspP0+NQZKtK/aAodNkFn39nweo9V4clFxGdJuZF4ZplqCs1kVNYw01?=
 =?us-ascii?Q?4KiXirjEoDXFEft3LENRxnAyHZVVIfKz+uEXbclRly6MWYMGzqGR1o/b0y6S?=
 =?us-ascii?Q?u6BEuo8zfEKFCboZ9qucNTyF2tGghaib+HVKb1wpn/kVr1XM2m3HtsEb2pTI?=
 =?us-ascii?Q?highngCa2LQGu4TrqTc7fVC7VjAKt5xzzIvW4XXnf8M1Rr7S4rx6QrJi4Ekq?=
 =?us-ascii?Q?95oPZMIIfOp66WkbeSpXAsE2mjzCApgMThQLxkK2ey5b+fgVr8S+eWDoJzkX?=
 =?us-ascii?Q?Vc/HBQZD1cTyF2B3v13YKa9epxFLR2Iy+3VuDvW0ox0ibcsGYP+oovN9nJeD?=
 =?us-ascii?Q?J7Ht43wE1ZKo445itBIAji6Y+iw+UCCi28XaLGZGoXCUcNn+eAA61bk4PtmO?=
 =?us-ascii?Q?V9rE2IkRxxjqasHrs10OI7hv1gJyPHdIbRr9F+VC2AOBGvT80aVSoj3gypxZ?=
 =?us-ascii?Q?0lQT0ICdzLq4U/Xkf7+njW98OuU9O2mHbpmIO6Rvdp+B4cuTsRoLWl3RP3RV?=
 =?us-ascii?Q?F4FzYSSgJgMg+aG3KOlEpDZ2pq2AOzzs5ifnYUHWUtAs/73DCSKBGqRxd7hE?=
 =?us-ascii?Q?XhB46heCbZtF/T5x3xKFqJ7XJrp9/phOgJyXgR0l3B1WSXmZR0VkGKc+ZhNE?=
 =?us-ascii?Q?W2bkoW89StHu7Scmn7pdYvPIb6k4wU1W4hpH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qzf1ahvETsm4Z0nuXgiiRq6chMNAB7XfiOr0F4hUSgKibvSQeZ/Vo2BXljkO?=
 =?us-ascii?Q?FBKOiHaCjK3esaJdO3iiqsnn5jtJJ1NNWPSwWgATCDw8qx8j3jYMq8NCA3Nj?=
 =?us-ascii?Q?hasokSBFT7579vChUnqEIZDDP98Bk22fZ04v53LtEp/9BLbGo45OPShJsJHn?=
 =?us-ascii?Q?TBW4Jxcx7XsZ+bda77/GZE5pIBo+Wp1akyFO5aUmtBGM7K9cpCKboGpv7hFk?=
 =?us-ascii?Q?H1wP6mv5ONedk5BoAsfIa3G5BmHcYywuDUtK33P7zl/GNwGqwk1D1ADHdwOa?=
 =?us-ascii?Q?BRDa5jXBjFTL4z0pTNudHMJh/zKwhkBjNnJRhMRifE7CJHqXcQOyLw/V1qB/?=
 =?us-ascii?Q?hY8lxz632DB3wRM4zslG0ABcjabltD8uvqPajE/kOoQ7DmjNQVEIfzlTyVgN?=
 =?us-ascii?Q?w1g0lvww/PQO7lDOtuxR2Vpbrc9a/EbrytMjDoFhR0y0lhfqd1sRt99xaxD9?=
 =?us-ascii?Q?4E56ZDmSLVOpx5YREe5BlFoAwdsKVQvteJ4GVfczA+HXTI0Kb7GIUjOqIopt?=
 =?us-ascii?Q?ZgNFiEd6cecfLPn5yApHk+LB02SSkX7S69tCkNu68RHFTlTAk2jc0C0v7AZB?=
 =?us-ascii?Q?r5XrSITNfFVK1TkrLeQk08C+DC3K9LzR9p/EecR6bIaHPozTpWEWnc5YmwD9?=
 =?us-ascii?Q?P/7XCeXkfrQ5KeA1rddQl9oU9y7QHL0hH0MO5aTDZGpjaRxvi2mvzhaksB+y?=
 =?us-ascii?Q?zUJ0GojH6VrQtC4I2blVxbQcnJ2rosXVqi/drKlrCuMjndh8ysijeKTj7puM?=
 =?us-ascii?Q?5J4WAEwh1OAyLuKORQJm4YzTd3Xa0Ve6Ft91KRz7K9R7+EXAJUaiTNcJVZ7j?=
 =?us-ascii?Q?iglpeds/iWR5oxithjcLDSRMXl7QtY6JDzYVNrII4YYylMWKmwECZrPJ4EMb?=
 =?us-ascii?Q?eG6ZoL8mqsNTrF3cp8PPVz5OlorLSdY07dWLp2BTbKXPheXIgeeGCR5eKynn?=
 =?us-ascii?Q?x/mBXCStAt1AZuajk56nPla19au5F8PTIh+g0J1SYner19IZCn5bsMMTP5D4?=
 =?us-ascii?Q?3MzytF98D3iwAwDGXHEtKh6zaZfqFf7S2kV3Tqw33jXwODLelG+tD5scwPT9?=
 =?us-ascii?Q?QvUn0NmXcNp+Ya9nFv/TQwLMqqKu3Ga3PPjdj49rjkTfDdsBC755o2k3obX6?=
 =?us-ascii?Q?8eU0RcgXKyuuDKpKEeOAlcgmvkl9Zt+pwEOPwIbOLAc0q9yBSlLXWJm7PCXp?=
 =?us-ascii?Q?3HVtVdxPWoxGecXh8L4Mro9g4iqFmb1h+cAN1AgT7qu0ym1fWLUWyR5F+27f?=
 =?us-ascii?Q?bhaMUZ5Ht4QUgInYZZbX9XryLuDjHKnE30RZnyS+Aj/HuneMmeyNuD4DZ49s?=
 =?us-ascii?Q?q6Pc0iEu+DaWo8zDUMpUtMmqgbxdI0UCVljZY01bsuz3eovsChrSP3vp6cKu?=
 =?us-ascii?Q?SxynFROwhVNx+LKlVk29W7Q40sjaR+QMfiThKMhEk1Wtz/89MfIrECBxCZom?=
 =?us-ascii?Q?MIRx36vA43YymUInZ/BFMCOXm6Swc1sK1UEIUq2GfF3bbFROXmpFez5sC1Wq?=
 =?us-ascii?Q?gyE0w9BFwA4RgbyCm8zn3Tspyl7q/6RsW9XPt7ez9OHFc2tSsRbs0NGH6J4j?=
 =?us-ascii?Q?n7GSJ1HT1KzCexxOwEftueUfH1fGGoIidVE50JHkNF+BPvErRzPb5+mi80gP?=
 =?us-ascii?Q?TTEmS0EEJgTMNDQ1RkKIpWbuG5IbIu2GkrcQEw4FI/NyHDwQPwv6B3aT+XCd?=
 =?us-ascii?Q?e94peoYygCy+PMV033ZyCaDxgBtBmw09IOWJvwAoFgALm1Ixmlf0RSh/3YiG?=
 =?us-ascii?Q?7cNbZgJzLQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ef9dc1-1e9b-4118-bcc1-08de4c396ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:04:28.5980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2H4Gc1wXdMP3eXM+ApGM8tl9uyCIByzVHmr7RFuCZIQMoyaYDWnDpgLiiFMJ2OgJt50MBiobCnTo8bqxuulQ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5151
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

> Subject: [PATCH 04/13] drm/i915/display: Fix color pipeline enum name lea=
k
>=20
> intel_color_pipeline_plane_init() allocates enum names for color pipeline=
s,
> which are copied by drm_property_create_enum(). The temporary strings wer=
e
> not freed, resulting in a memory leak.
>=20
> Allocate enum names only after successful pipeline construction and free =
them
> on all exit paths.
>=20
> Fixes: ef105316819d ("drm/i915/color: Create a transfer function color
> pipeline")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../drm/i915/display/intel_color_pipeline.c    | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 684641c8323b..04af552b3648 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -34,7 +34,6 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  		return ret;
>=20
>  	list->type =3D colorop->base.base.id;
> -	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop-
> >base.base.id);
>=20
>  	/* TODO: handle failures and clean up */
>  	prev_op =3D &colorop->base;
> @@ -74,6 +73,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>=20
>  	drm_colorop_set_next_property(prev_op, &colorop->base);
>=20
> +	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", list->type);
> +
>  	return 0;
>  }
>=20
> @@ -81,9 +82,10 @@ int intel_color_pipeline_plane_init(struct drm_plane
> *plane, enum pipe pipe)  {
>  	struct drm_device *dev =3D plane->dev;
>  	struct intel_display *display =3D to_intel_display(dev);
> -	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] =3D {};
>  	int len =3D 0;
> -	int ret;
> +	int ret =3D 0;
> +	int i;
>=20
>  	/* Currently expose pipeline only for HDR planes */
>  	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id)) @@ -92,8
> +94,14 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane, en=
um
> pipe pipe)
>  	/* Add pipeline consisting of transfer functions */
>  	ret =3D _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
>  	if (ret)
> -		return ret;
> +		goto out;
>  	len++;
>=20
> -	return drm_plane_create_color_pipeline_property(plane, pipelines,
> len);
> +	ret =3D drm_plane_create_color_pipeline_property(plane, pipelines, len)=
;
> +
> +	for (i =3D 0; i < len; i++)
> +		kfree(pipelines[i].name);
> +
> +out:
> +	return ret;
>  }
> --
> 2.25.1

