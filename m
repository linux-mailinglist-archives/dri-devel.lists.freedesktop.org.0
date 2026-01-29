Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEbPJeLgemnN/AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 05:24:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F1DABA89
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 05:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B6410E7BD;
	Thu, 29 Jan 2026 04:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2uyCWnT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0579710E1F4;
 Thu, 29 Jan 2026 04:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769660639; x=1801196639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mCb0R56HB61a7rzCfVBUaAx3wVhYCWLChuIdP8KGtzA=;
 b=f2uyCWnT5WTpugjN1kHLFrXY/04gjpsA3g7TIOpsLfPZq9bnCRDnGATg
 Y2sv7KGOWXYQlT+xKLFMnxCPJ+g3jUbAGWZ2pVDiF564WUm+sxHRXMyMa
 culcQvtYVWU07iF/zJQc1NVpgE1CHSU+LLlhAatcM5lbK4Z1iXYRmAbBf
 otPC6p5eSh93/43rQqi82RkhTh3BTUxO5KY6hswd6DXNJc4/hRD9P01LT
 8z0pMKC2XlKsG1XZ5S6WRJHdGahZ/AAQQKM7vJ77rCAWwosKhRpKfOdqp
 Lk54KCwcx9f2Veubkuods4pnVUx8mDbx+Ggz8PEIbwCOMFLxt/2/EmSEn Q==;
X-CSE-ConnectionGUID: YBCwaim5T2OU4qIa92ZkGg==
X-CSE-MsgGUID: 6KdoD+cASoSm1JjjKCPGIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70926534"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70926534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 20:23:58 -0800
X-CSE-ConnectionGUID: l5r601uiQHiQ3MQfGT0qEA==
X-CSE-MsgGUID: 4EivhKlDTu6wXjpSYf3QLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208809963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 20:23:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 20:23:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 20:23:55 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 20:23:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2tQmL5ntl8B1lgKTWrI42MxNSs7mbL5kvRSSuna/T70LShchQaHM7WfVkHChiJIPUvI15WNxKPm+E8xGZ1HzTJ3Urvy1Wdr2kdIKWDAQrxl62yy+a8DwX57BC1eMC26vJ3dXDAz9I+1TyQcR8cFnobhhOuNON4hDad95aWNfke77B/K139Hufg+1xo1Ur98eMqTMYJdcPRCWjXCaZ/D8Cin5wj0tOpocbgVj27vRK7MyUrSy9yBX9iudmT42vJRlPTFX4mxnnyIBAotrGhzLKLLnOmkaWNL2GQsykDMpqZrKVMYBziXHyhY0bdbvsfBiS+U5R9wTsWmy39yeJ8mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxSXAokwf/GYd5kUTkVX/+M3D7WyM47wlJtPv3/9YGI=;
 b=EbSQ59FmOe7ijHOKKPorWbFc/YSJ96hXwlVjpOOKTO5DyDb9MxTcUDdQYuJQ5hlvZ1Xf/R4LckKZvNz9Bj9tG3JnBJeekFpWQ6usJO/XVkYWBZTjpDCuI3ZLHtpifWaXCA5PriGEtZOTnWLn+Z0dcHrYUwwjMJdtxZ0Hgp6vVvkBX0PuRNQ2wymxDRMAiwRDBDWvocvKVfvkOIo/bs6LGAYNJiZerUbp4xZyptNNPugKtwXQvMejbvJHXZPETA9kR+k9YBA5Hff72nr5lzPvE8C7M6V4j8ZTJMnN7x6Qta6x+FTG+MpEAQuMUoMQPqXWEPVTcP06CDR5T84fJwgpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS0PR11MB8083.namprd11.prod.outlook.com
 (2603:10b6:8:15e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 04:23:53 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 04:23:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/i915/display: Add quirk to force backlight type on
 some TUXEDO devices
Thread-Topic: [PATCH v2] drm/i915/display: Add quirk to force backlight type
 on some TUXEDO devices
Thread-Index: AQHciygMldcvV7vkjkad1ydQcXyBqbVolrqw
Date: Thu, 29 Jan 2026 04:23:53 +0000
Message-ID: <DM3PPF208195D8D575D7D0E044CAC4955D4E39EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260121223944.1104951-1-wse@tuxedocomputers.com>
In-Reply-To: <20260121223944.1104951-1-wse@tuxedocomputers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS0PR11MB8083:EE_
x-ms-office365-filtering-correlation-id: 86bb126d-1be2-49d9-8fa9-08de5eee35d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YmSFAfG2n9mWLntpUCJlbDDfL2DqkFV46xcuuFRWTK+KWiR5ls6/Mhh4TR1K?=
 =?us-ascii?Q?zDvA/A5tUUgyTULH3hzEVi7YHi47o62ElT1X6YjakeO6z+k43VutQymMTIWr?=
 =?us-ascii?Q?dChBbtj6If15JKZiSdaAH/KQEVx/5jP5nzZ1lVmtrW9gxQM4jTuU9kQthm3Q?=
 =?us-ascii?Q?0MtklvRCX6PPNt3q/r+yUV9NIwbqGqNz9uhcVTqoab/FuoVXWGmZUx+XSnZl?=
 =?us-ascii?Q?y2q9fkDHioWF94dYXe9S+uAFZ6j+vcr7C2AJyk6BbpyxTzZPSDnyZJ6tieoj?=
 =?us-ascii?Q?jayqVWvWbiE8nzEDxC3i87bDBgYmd7q4ZM5GCvd5vfavMtT7V+6C2wl71oNW?=
 =?us-ascii?Q?PnXwd3O6+gbxNCmd6IW4FnOSSyOS46E3v9DZvzSw/H+5iUFpFm5sNheyEOs6?=
 =?us-ascii?Q?vQ4uDAwpd8MNHyUuV859pxpr7k1BOUqatAu2wTd1q594sAissSsBSfYzpoRt?=
 =?us-ascii?Q?/++NCjeOQ1S3P2qkMHx/0JH/UxydWl7z7ksw3wTaB+nqag2WPhfkr4Rj2QC8?=
 =?us-ascii?Q?f8fLVRIL1iOGVtY6lyRz97MHtelgLdCXdMk8kE1dXYSxltiWUV1ktiKsblo2?=
 =?us-ascii?Q?lyFcrl34n/4WtwThIc97jLeARIxggQNXHReuAZcQotYJybShOTjl/VdvhH16?=
 =?us-ascii?Q?ZLdVGg3AnTJknrJ50Ssq0AUuzzzf/yDXvbdJgMfZTnEOL0y9n0ClGtn9lh91?=
 =?us-ascii?Q?v7LnG26cp85iTCVDDc0L35HsIHk4D8gIl9z5IQVh/RDnMx4ojYPkN8XxBl9M?=
 =?us-ascii?Q?QrxWZqrYC8A7k5dh6Qat1geUK/MU3iYNPv+ulSdk6X89P6MWdDOQB8NW/frY?=
 =?us-ascii?Q?txucJfEdsGrU5kuQAcSxgBgLLL/z/VXp0kz+lO8w2yn564NmVg5TPf06OGqP?=
 =?us-ascii?Q?FVhU9wxr168hiNUDFh4HiniV1sLkgA3Jdzylrg9J8oGwGkHFNTI5I3/ju8/a?=
 =?us-ascii?Q?/fRcguugJ9/W42f4aOmNWCnhF0aGuonIKQmwTL0+OpPQxPsrMXs9PzSuCk6s?=
 =?us-ascii?Q?K/28ru7LGLCqhlECG2dP9TB50mVEcpTNWdTFURYPt0HKYGgYlq9ddugxmZf8?=
 =?us-ascii?Q?6qzvMJSAd97bDKYifLf3A27g7bBy5uF2rGwZb/ulZ2JyiaIEf2ATQZZTn7cb?=
 =?us-ascii?Q?TJpD5GBC+lrp0kbY4+1m3dIX0GNjtYK+iLCbcxlYG/mlAINLx+SN/W9vMP88?=
 =?us-ascii?Q?4Dp0/9lAJFr0dV57IBdFX640tGXq2eSgqW9FR530Ul7ExRBFoFsf9/SZc3EJ?=
 =?us-ascii?Q?GdFQmw69/lAd3Ibw2HQ0lA48/g/MkUwPjg44DQ8GjUwRclIIMU0UJGP8cHxI?=
 =?us-ascii?Q?0NLfRIYnJs3CgPe3T5c4WcqoQqMehfyAusPWtNEtIlWHx3PSMS5fM6s2GAP+?=
 =?us-ascii?Q?EbLBrMmVA0fig85URTK9u5NEAb4aDMyp5LuKGfLTvQ5C6IxeEQdR6WdhSa2D?=
 =?us-ascii?Q?6LM2zy2jxkf/PiDB+vvAOGYxk8K38L101S+Qtfl3nnwdUkQJAdWiCqDGP40I?=
 =?us-ascii?Q?lQR2poT+EMyHVXABDaQWtSr8urUgm9usd9e9AsCduntO+HurRmzcO3g8CsXl?=
 =?us-ascii?Q?ZBDwfqn2w1qjtAuyTDiA+ABpGPX8b0QVgLkUsKUt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CHrw7D8aTtSLeRqQN8jjMwfMu3nKwg32eieuadsweGE9YY3KCmgkxgKLCNgW?=
 =?us-ascii?Q?fQ4uQLtlV75e51tW6QLc3CwACOCljBva5yRfVXIA5pPsQI5/YfoQk52w+oOR?=
 =?us-ascii?Q?9O2gduFmKeWH5XuJgDOQtdqeW6ehAmLtLEQ1Ez62KypjlLvHBgHy2KiEAWk8?=
 =?us-ascii?Q?+sMP71DTLm1ybfLgXkibpPtFG6Cii/taeQP0cfeS7EcQMzceBJWTen3QmML9?=
 =?us-ascii?Q?Zo0cZFZlyHPx+bNU7ZjcoYG3GbBxpSU2XNn7eODWENmyQi/Xc7gASjjQHI+t?=
 =?us-ascii?Q?E4CG4vTNaXb9ogQMhBb497y8joRpQEBKKVhhnbCtHXLAd5Mjk7wBNMXcxAKP?=
 =?us-ascii?Q?F0EHJaA9crktKsNupwtCXBwS8BOauSSBfqtOxXVWp97h8ARBBv3sWeK9JYs/?=
 =?us-ascii?Q?2XyPtXO79LlsDF5l9VoKD40HAsEohvIBrtkRklOrdVA8RokUfe95whiYQUCx?=
 =?us-ascii?Q?oygmxXtyrlcK39dchN/CanYqQyIFTPDjyNYU3PpVf24yuPKtdEVqABPtsVq8?=
 =?us-ascii?Q?llKL9j2y6iNmmzBPWdUCEk/+brRZIXJ7viCATOY83/rO3pnMes0HDe3xwDq8?=
 =?us-ascii?Q?yulbG2DJxuAk0rZIiOWvvPmrtlB++CbUtIPvCizCDD0N46SSW5etCorwybx4?=
 =?us-ascii?Q?8ue3GZgSX7lGmZJSRsD9/zLAnzf+AeN6IA7YsdQdzMDj9P2Sk2Bjp1xgdFj9?=
 =?us-ascii?Q?rhsWN5txieg3ej1BK0duLPneIsgCw7H4efBrIilxTOUcnvg+Frfh90Xoutzq?=
 =?us-ascii?Q?E3hL9SZRqh2S7EPvlLYOSQSPtZUm0bQ4mN7BlwY/C0zHrj5ZzvL7vve2ODPH?=
 =?us-ascii?Q?m310KDAoO3m0KnQxvFOZDn9EaPfefwf6NqmJZlwdQuL9O4b+67RTsz/SbPMT?=
 =?us-ascii?Q?IcNFAaMKosrfS2A0GPcQ3ECqLdp7tPOkb+khk+rC6Jtj2nFZN9bBxrur8BjR?=
 =?us-ascii?Q?J4ZlR3WB4eCMme/CAfvJi/lTDQtfWCV+w/1ykHpNhbWAAjU3dZffmV7CQbPP?=
 =?us-ascii?Q?IklKxl0jsjg59LHmW22nxPxeeMh2bV346WVU4p9Bd88Z6dFT9EilNjIkXZN3?=
 =?us-ascii?Q?oYu1iqQa3PZYCF4B344TvF3zUuPykVtPBTf9KIH2iTsN2scnPPQwH3YKeEcK?=
 =?us-ascii?Q?+dHmN1qd2JvW6WtZhmKT8gxRmjZvwBIYkeZBw4GZqltYJc0yiZoukrs4D0Rg?=
 =?us-ascii?Q?F57+VceEzp6mctx9GRcLmHPIWA4zaySnZsMFX343OYYSrlFdWOfgkiXN71QV?=
 =?us-ascii?Q?jsBtcZ6fILPXhjQUzwjewJlbgezaFZqkkwD0hdBhtq3s+MmCaPRWI1uJsIBD?=
 =?us-ascii?Q?ZlX8Gq3VxcODdLOwDxsZbx8tyZ1k4MD7Zw7MeZB8qZBqVeTG2JUtY8C9jd20?=
 =?us-ascii?Q?reWRPXX998B7rkmRNcDqng+zO2r9TkcDuxvsB9bagKuqvpiURFo5pvCn5UHi?=
 =?us-ascii?Q?mNroJ2TvSq1oSDzRp27To0ndDE4Gw4uhHerON30oiMXOExiH49pS4P9kxaMm?=
 =?us-ascii?Q?RGWQ7WjMaGWLI3gESlY11G/36VBDMtubNXenwmfBnC+ApWFAPzaYuejXHpWY?=
 =?us-ascii?Q?Sy5sFrt52ObBKh07xzAbDps6r+Xhf0ETj0tyO7ZNH7pj2cqKdQTXgt2ko2hm?=
 =?us-ascii?Q?lAi60gfO02UAODN35DiWEQuqh4Xjvy1HFi3lWmynrg5ezwh+yCj7qhuEdWFl?=
 =?us-ascii?Q?x6gZIjavy4wCOQjp3VvYFvJKuHXKikKluF4XeAav+gxWjuztqP9htX7+I74r?=
 =?us-ascii?Q?pmlcwm/ejw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bb126d-1be2-49d9-8fa9-08de5eee35d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 04:23:53.1165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIne/nDVQbL7DZRlpYAJH777DD8XdRtDwrRpO0gtueZ+NQ3g9IBRy6p2ogFMbmUdJ72L9zXzvpSzZYpGXBNdCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxedocomputers.com:email,intel.com:dkim,pages.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,DM3PPF208195D8D.namprd11.prod.outlook.com:mid];
	FREEMAIL_TO(0.00)[tuxedocomputers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 49F1DABA89
X-Rspamd-Action: no action

> Subject: [PATCH v2] drm/i915/display: Add quirk to force backlight type o=
n
> some TUXEDO devices
>=20
> The display backlight on TUXEDO DX1708 and InsanityBook 15 v1 with panels
> AUO 12701 and AUO 12701 must be forced to
> INTEL_DP_AUX_BACKLIGHT_ON to be able to control the brightness.
>=20
> This could already be archived via a module parameter, but this patch add=
s a
> quirk to apply this by default on the mentioned devices.
>=20
> This patch does not actually test for the exact panels as the id that is =
used in
> the intel_dpcd_quirks list is sadly zeroed on the devices, but afaik all =
these
> devices use try_intel_interface first anyway so all the quirk does is to =
add the
> fallback to try_vesa_interface, so the behaviour on the devices not needi=
ng
> the quirk and fallback should functionally stay the same.

Hi Sembach,

Thanks for the patch. I would recommend opening a gitlab issue with all the=
 details
(platform, edp version etc), Along with dmesg logs with drm.debug set to 0x=
10e and kernel
Version mentioned . So we can root cause this properly and determine is an =
actual quirk is required or not.
Use can use this as a guide https://drm.pages.freedesktop.org/intel-docs/ho=
w-to-file-i915-bugs.html

Regards,
Suraj Kandpal

>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c |  9 ++++++-
>  drivers/gpu/drm/i915/display/intel_quirks.c   | 25 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
>  3 files changed, 33 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 0a3a3f6a5f9d8..bbdfa142d084d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -41,6 +41,7 @@
>  #include "intel_display_types.h"
>  #include "intel_dp.h"
>  #include "intel_dp_aux_backlight.h"
> +#include "intel_quirks.h"
>=20
>  /*
>   * DP AUX registers for Intel's proprietary HDR backlight interface. We =
define
> @@ -661,11 +662,17 @@ int intel_dp_aux_init_backlight_funcs(struct
> intel_connector *connector)
>  	struct drm_device *dev =3D connector->base.dev;
>  	struct intel_panel *panel =3D &connector->panel;
>  	bool try_intel_interface =3D false, try_vesa_interface =3D false;
> +	int enable_dpcd_backlight;
>=20
>  	/* Check the VBT and user's module parameters to figure out which
>  	 * interfaces to probe
>  	 */
> -	switch (display->params.enable_dpcd_backlight) {
> +	enable_dpcd_backlight =3D display->params.enable_dpcd_backlight;
> +	if (enable_dpcd_backlight =3D=3D INTEL_DP_AUX_BACKLIGHT_AUTO &&
> +	    intel_has_dpcd_quirk(intel_dp,
> QUIRK_ENABLE_DPCD_BACKLIGHT))
> +		enable_dpcd_backlight =3D INTEL_DP_AUX_BACKLIGHT_ON;
> +
> +	switch (enable_dpcd_backlight) {
>  	case INTEL_DP_AUX_BACKLIGHT_OFF:
>  		return -ENODEV;
>  	case INTEL_DP_AUX_BACKLIGHT_AUTO:
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c
> b/drivers/gpu/drm/i915/display/intel_quirks.c
> index d2e16b79d6be1..df20930f73f75 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -86,6 +86,14 @@ static void quirk_edp_limit_rate_hbr2(struct
> intel_display *display)
>  	drm_info(display->drm, "Applying eDP Limit rate to HBR2 quirk\n");  }
>=20
> +static void quirk_enable_dpcd_backlight(struct intel_dp *intel_dp) {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +
> +	intel_set_dpcd_quirk(intel_dp, QUIRK_ENABLE_DPCD_BACKLIGHT);
> +	drm_info(display->drm, "Applying Enable DPCD Backlight quirk\n"); }
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -251,7 +259,22 @@ static const struct intel_dpcd_quirk
> intel_dpcd_quirks[] =3D {
>  		.sink_oui =3D SINK_OUI(0x38, 0xec, 0x11),
>  		.hook =3D quirk_fw_sync_len,
>  	},
> -
> +	/* TUXEDO InsanityBook 15 v1 */
> +	{
> +		.device =3D 0x591b,
> +		.subsystem_vendor =3D 0x1558,
> +		.subsystem_device =3D 0x9501,
> +		.sink_oui =3D SINK_OUI(0x38, 0xec, 0x11),
> +		.hook =3D quirk_enable_dpcd_backlight,
> +	},
> +	/* TUXEDO DX1708 */
> +	{
> +		.device =3D 0x3e9b,
> +		.subsystem_vendor =3D 0x1558,
> +		.subsystem_device =3D 0x8500,
> +		.sink_oui =3D SINK_OUI(0x38, 0xec, 0x11),
> +		.hook =3D quirk_enable_dpcd_backlight,
> +	},
>  };
>=20
>  void intel_init_quirks(struct intel_display *display) diff --git
> a/drivers/gpu/drm/i915/display/intel_quirks.h
> b/drivers/gpu/drm/i915/display/intel_quirks.h
> index 06da0e286c67c..686f306ab4472 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -21,6 +21,7 @@ enum intel_quirk_id {
>  	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
>  	QUIRK_FW_SYNC_LEN,
>  	QUIRK_EDP_LIMIT_RATE_HBR2,
> +	QUIRK_ENABLE_DPCD_BACKLIGHT,
>  };
>=20
>  void intel_init_quirks(struct intel_display *display);
> --
> 2.43.0

