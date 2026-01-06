Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460BACF8000
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C6D10E0E1;
	Tue,  6 Jan 2026 11:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axxaBpdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6520410E4EC;
 Tue,  6 Jan 2026 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767698216; x=1799234216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K4cQy6eSgpaKTzL1n2g5AAUuFqPm2VLvv9mEi7yz6Pw=;
 b=axxaBpdX8qZ5Z8gZfr+vcA6bmJXcpAkfJwbjpm/f/gxtbTBYu6rnbSEz
 IDCUWqA/pDO5/gAMM6XOYaPTbQiTZ1JSw8a9lYRYjv8cZq/qXVsFqEqIg
 bnNHoMld2cEQBog1UnShwKNDIl+t2c+tvqoJeHCKpyPEjuH49mFw00PTX
 8f+tGGaSfrv6i4hnEBh7QaYc7Ha+XknSTWxXtpgUDYoaPOEGVVsLMkp0i
 XZKX7+MpcfHs1KmQHm9f4PZzH8BTA8CEPL5mXpIU6EnId8Tve7ftUH6UL
 uG3mHVkcEsYUkQUb2AYfKEpGmoEmo2im71T7DH/EZLQlLK7DyDnODHGHV w==;
X-CSE-ConnectionGUID: 0Qik77wFRaCKphtvrETO7w==
X-CSE-MsgGUID: sx3iYF7fRWyZgIOxF4lqsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72921229"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="72921229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:16:56 -0800
X-CSE-ConnectionGUID: ar2JKWQITUyW2yZMjZTV/Q==
X-CSE-MsgGUID: PcCEs1GSQCOqIrrOSZ8Jag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201856968"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:16:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:16:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:16:55 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:16:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHWhZqsK0d1L0xWiK5JssGnRPzodldxBJ27TFCp0D55k2TxJama9MuhL7sXtNiukItDfDW9fwg2mNMa3WMYtsUtj1choApREQmgQnmW6D8PUPCLKZhAkuLC4/a9wA8EkrXDCLG7gEsK4H8u+2SMix9rOxjBedNj2Kx6THJpfhSk0d/DOVdrGgj+c5o77gqVOPMLZzqC4ituV4OLTG/WblczjGabBuZ5yiqZ/jJ0ws2wwikK7n00TYWpocg16b5N6lOHYdSRTDDRFZGUa0lWzEIdbyzij6WNvka0a92WaThdrtqDdJVc2mzcGDBOzpAhFW2fv6el7TfH3GsMhFbh5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvNWJIrhigQqMvoT9vUdF7sS329WfyMBlXy1SgApNsg=;
 b=expTJComC1r24nKTomcAzjXIiK5Xt1HRi7R/PVK+VhivotADdUn3TdwjJ0uX2FxwErCGAEo/QV1hUWTgKSptXNob8ft40HBcqDXBvx8ZEnq8TXQnGEUpitP+UGNpteWNp8HD+YzSm9hY58LccqA+liDFfK46dVqR95Zc0OSfoNSGPL/2yI5qxh+UVNaCdc6lPAnG0gHp7UoeVNvYJ0UNC/3eSJBCK2bc8+t7jZfISDE62alqzcaN2Mm+6XT717W1TMXTa78l8soZZWUVhqeYbl5XtdOsY+HH2VA5EdBiNGB3XbwuYiLKPa4QoqD02sX+OIPkLGQKlFL3qtu22wdT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:16:52 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:16:52 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
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
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 09/13] drm/i915/display: Hook up intel_colorop_destroy
Thread-Topic: [PATCH 09/13] drm/i915/display: Hook up intel_colorop_destroy
Thread-Index: AQHccLcH+6MQI47PfEaQQjzEckOY+rVFGk6w
Date: Tue, 6 Jan 2026 11:16:52 +0000
Message-ID: <DM4PR11MB63609D3B691A019B1B13DAD7F487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-10-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-10-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|LV3PR11MB8676:EE_
x-ms-office365-filtering-correlation-id: 614c450c-d9b5-4fc2-bb12-08de4d151807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Cd+eqriorGsoK2GMFfgNFKIL+eUgxLehalZflfiGXjmUtsTSNyupCIvuhAQZ?=
 =?us-ascii?Q?d2tyVNAl5Vp72mEsgDwYcQDjlWOrGibERkvrGZSONm6VsIlxIUpqU8HXM2+t?=
 =?us-ascii?Q?eMqJ/8/tlMuRSPpA8XPhJ3VN2/6SZH+IKyOyl0SJNsD2Uqj/7kokUXwSbgqE?=
 =?us-ascii?Q?ao5haizL6KUSsXg55kv2fiAPwsm8XO//unazFCusqjsz8Zdft++uXuuzSPqk?=
 =?us-ascii?Q?5PYt9VcjrmeIDT8OpJq/merAiHsucqIFlt+0JwZ4Y/JY4HmO0GOVphnx6Jhz?=
 =?us-ascii?Q?Yi2Pm0YN60K3B5cJThxWK3dl2556gMeqMIrQjyYhP8jIlVMLm1Gnq+J5MG+X?=
 =?us-ascii?Q?ddVl/gsguRM+1SQGGRhTOpR+4fbBze9JIGh5TyasE0BBZXFtYVjeDsUBpaJZ?=
 =?us-ascii?Q?r8VYSw95MtWa6ScJzMz3SXxm7DfHnHXSXujGBOXhp2/4E7CRuAtdtSbsDb4N?=
 =?us-ascii?Q?bBhGYHqCkubpraSLaoxFKPthpXrYIc9h/mVvK3ztQm05usQrMH+Rt8dmiaCs?=
 =?us-ascii?Q?1BsqAVblL3hQMpIMqfXjhPu92ALT9+tt2LnibumOQi4iP47SsTxe7uoJMf6u?=
 =?us-ascii?Q?Ud4rzVurO6oKRQpsp0WI+EHGHHNOINBuWEG45PGaahggVWFENuRu9yiT4Feo?=
 =?us-ascii?Q?ePtw1TzMMjndXdxFooX2wIIDfEBJvXFa34yk37gkM073YBChZ/CSiNa0NXBu?=
 =?us-ascii?Q?cBeznORZM17fxb/8++cPvfT3XOJgJ4Ph3eMJ3kWmwtykpXjb/s35N0/vgVrG?=
 =?us-ascii?Q?c2ztvWchXDpoYZ/qMTA+DXlDqmTWmmCMWLcB1nIRv4WA8bZzySE7rsdCisgf?=
 =?us-ascii?Q?2VQ1Xyo+i13ZWeJrS8+U/l4Op5S9JqRwccFukzpbWO53p7cz+nUGTaP9XTWA?=
 =?us-ascii?Q?x+bVWgoxqrTFICKYQd1JxirKz6tCPwNf5CO6huUJHsJeYDTN7nH9cfkXvx5f?=
 =?us-ascii?Q?GPShEJ5A5c6LuNhdwGV1nD9me67ktenf9NMHsOwEe0Kgf3Y/0RAzAvv3sJBd?=
 =?us-ascii?Q?oPBJbWRgkADI/N24ZjmbY9g7Ewek/YGktR21DVxEEq0V4xd6hnR6TLvNlcGH?=
 =?us-ascii?Q?WsiVGB5uvX1kfakiGdbiD5SLEczIAKUtz7M+VBzqzhVMI4+Dgx3yeLGRSqPd?=
 =?us-ascii?Q?IJuJufe98aksq1Qru7mV40KANJTVMNazJhWcfpUaetv1z5R+oLGHP8Bm7erv?=
 =?us-ascii?Q?dwRNl8xb18k+PGUcUm1b6QG4A+mLoXJmzivLs8RlB9GdJLKgp7Mb4XrRPQEO?=
 =?us-ascii?Q?MGC51zPmtbf7Piwvm6DdUa4k0Nvx/WD/IkyphJ4cfKpuUV/bBvRwMUVo2olM?=
 =?us-ascii?Q?rlCGq/8c6/0+glSis9BH4gF735npSukry8WreaFQHxtKM8Mn/++mTY8rEZak?=
 =?us-ascii?Q?D66fQ1LAzXxDc1Aj/M3bqB22KvCdfK0MoYqAPYnDiSOV4BPCi3ydDQCfZjOK?=
 =?us-ascii?Q?2KYiozxVM46nVFTySkTpeZMA0y5oODWcmC6lnozxbAqvtrjKUPliP1MQTUqY?=
 =?us-ascii?Q?b0hPF8pj1fBKu0GE1EaYjgIvNIOflWMbpp+B?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mHlxn4E7sp6zPpmy8Ank2gbNh3UNxeqxPF+Mqp4qVF77aA/jl5wQXBKbqXOn?=
 =?us-ascii?Q?xc0uWZQGgEAkuzzjVITP+7LoG2+BkT5dBe1HXoFEZD2CeFneD3+tHN30YYFq?=
 =?us-ascii?Q?EZojtn8awT/O9sVFK5Yk1k/wwQ0FpL/aE2aqAivLRAjtT5E/L46rI2NZA9MO?=
 =?us-ascii?Q?Enj+3ic1AfZ9XKdbI9TWJfGzlzRXzP4QflQ/Pq5E6QPsQ0HDTplWFScvqrCW?=
 =?us-ascii?Q?P6B4IIB0eVhpFhb9Y2nWROey/L0WSQ+9NCwLuAuJuk108bl4kPx+ekNrBmko?=
 =?us-ascii?Q?0CnIDvpoZcDfKgeIfdFsppOCLlBU4E95eIyibPOts3NF+3/Bi4K0iNyXNTbU?=
 =?us-ascii?Q?WSNsM3zdZwNcT8sHdbR7XtP4QdWA5pGEaMCzkwOcRFLPEO5gB8KQQBNCpPcd?=
 =?us-ascii?Q?BBdZvpoWYnEj1t8hNSGen26UYMgTPRhU9ABfGG5bSPVHKLnT3AD+ZM7lr8cK?=
 =?us-ascii?Q?7p9GdS0OlPSQPUH6nv8Gl2wDZT9aPgFCkMKwaZ8zItBw2KiyDhzda0FoxWgc?=
 =?us-ascii?Q?U5uzOETLQFIOkfDxbfcAUDsazapCEDYXtK1UbaojqkKOx7Odxog9CzCjLv3z?=
 =?us-ascii?Q?niz+FsxwCgRUK8XCLaQQv2NYdbIw2fRylGDB5DZTlKxPKZwPnytXRWFwd1KP?=
 =?us-ascii?Q?bFCCqaZ2li02yM/QTlvxDnnR7j+iWkab3vrA4U9nN2jTS/WO7nSJ1s6+tZhW?=
 =?us-ascii?Q?D9sX2c6Us8nS8l07gFMOsg+E0e18LewdgW1Ckk528lLE7lLzHrKjRbR/sTzh?=
 =?us-ascii?Q?uNPVPkNa+I06mflyvZNKzIedax82fFTC0/DRGJ67NdimR7gIuOyjAMkj7mge?=
 =?us-ascii?Q?jaN585yCSJdrc3ygJuBwUc7aFxR29CfSfrxX9JhzIEn2SnHi1NRZ+9bZtrwV?=
 =?us-ascii?Q?DBLle6E82afij1BQ2I1DTvxLq8P4+UcITDMS1LFwi3FRB3j5fNmi/E/Ri0KO?=
 =?us-ascii?Q?u+Qa3AnzIm3sJQUPq6R7FHCC7hSsOqSXuRxQDhIKhz/mTTABWW7FgfP9SOYz?=
 =?us-ascii?Q?7ZtoXxfZUZcHW/td0lFEoCeZfyQW+yHFH/r7QEYRmAAoc9T9cD52DndXgFLr?=
 =?us-ascii?Q?IC2Z8YU+1aaOzR1IBsPonlmIPQT4EPFqnlVH8HmRQ7j3ZiZCjiE5ufZJtpMz?=
 =?us-ascii?Q?Sg/RvaDg7jjTeJnhxUl8ukq+/YqpyyezBvM+UzC9goMIdHG8MRez/t6WCSZ9?=
 =?us-ascii?Q?TxHgr2KwPGC3wycrxGVXFlSHaoHchi4SEaKV+ocj6wkgHr42btdz47QRs0Ck?=
 =?us-ascii?Q?qOnu3DrlPY3MjoJexc+2mhIVtTcxZIscNC1li6lHk+I0y8a37KLuyODx6mWM?=
 =?us-ascii?Q?sQ++3gm+i0tRKR8bzwuk5cupvcHDagQ0nmc1VnYCv8nEn7KJk8xkAeKWkGNg?=
 =?us-ascii?Q?jCdNZ7Bz0BDbhxK7eBWy+sJdAm4BxHZFdajWIFHUDZDWRqsF8NasfVVVKv7e?=
 =?us-ascii?Q?Fr2cHZvrx3jeh7PWNAGRrTqOvXZ/kU+/bUTDURupwrRYZ3HOqilIlqw1DgrF?=
 =?us-ascii?Q?d2uCxDPJUhrj6kGXaFiTJZyDlbXNEkH9lgvlQzrN/BK4JNMsQHekL+oXobC1?=
 =?us-ascii?Q?6NhAedjnym8I5g4KuFrPhCtu/dAdKiiIQWKsJR4BhyUY4e7CLSfgC88jUs5R?=
 =?us-ascii?Q?6QKsnETJZsA0CV9La43Wu2pOnwFIF9e0fAQd0zZNr9sJmbny8+aCQHGsRwUv?=
 =?us-ascii?Q?ZHSKFMSR/e75CthHt6/c6BtJn1RyAbZOvKCRFO3uADqsl2AL+8X7FJ1b3FrT?=
 =?us-ascii?Q?aFqIixDPdw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614c450c-d9b5-4fc2-bb12-08de4d151807
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:16:52.5615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pS++JaiElNQVug5FRmKmo1jnOYcijVF+hoNt3W75eTVCGoUIh3KmWwbBfdbqQA2K4ZdHNDYxOU0OqD9Zxvs2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
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



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 09/13] drm/i915/display: Hook up intel_colorop_destroy
>=20
> i915 embeds struct drm_colorop inside struct intel_colorop, so the defaul=
t
> drm_colorop_destroy() helper cannot be used. Add an
> intel_colorop_destroy() helper that performs common DRM cleanup and frees
> intel_colorop object.
>=20
> This ensures correct teardown of plane color pipeline objects.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color_pipeline.c | 13 +++++++++----
>  drivers/gpu/drm/i915/display/intel_colorop.c        |  6 ++++++
>  drivers/gpu/drm/i915/display/intel_colorop.h        |  1 +
>  3 files changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index d3d73d60727c..8fecc53540ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -13,6 +13,10 @@
>  #define PLANE_DEGAMMA_SIZE 128
>  #define PLANE_GAMMA_SIZE 32
>=20
> +static const struct drm_colorop_funcs intel_colorop_funcs =3D {
> +	.destroy =3D intel_colorop_destroy,
> +};
> +
>  static
>  int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
> drm_prop_enum_list *list,
>  				     enum pipe pipe)
> @@ -25,7 +29,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> NULL,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +&intel_colorop_funcs,
>  						  PLANE_DEGAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -39,7 +43,7 @@ int
> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop=
_en
>  	prev_op =3D &colorop->base;
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, NULL=
,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +&intel_colorop_funcs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		return ret;
> @@ -52,7 +56,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>  	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		colorop =3D intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
> NULL, 17,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
> +						   &intel_colorop_funcs, 17,
>=20
> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  						   true);
>  		if (ret)
> @@ -64,7 +69,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>  	}
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> NULL,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +&intel_colorop_funcs,
>  						  PLANE_GAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); diff --git
> a/drivers/gpu/drm/i915/display/intel_colorop.c
> b/drivers/gpu/drm/i915/display/intel_colorop.c
> index f2fc0d8780ce..fae4383f8518 100644
> --- a/drivers/gpu/drm/i915/display/intel_colorop.c
> +++ b/drivers/gpu/drm/i915/display/intel_colorop.c
> @@ -33,3 +33,9 @@ struct intel_colorop *intel_colorop_create(enum
> intel_color_block id)
>=20
>  	return colorop;
>  }
> +
> +void intel_colorop_destroy(struct drm_colorop *colorop) {
> +	drm_colorop_cleanup(colorop);
> +	kfree(to_intel_colorop(colorop));
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h
> b/drivers/gpu/drm/i915/display/intel_colorop.h
> index 21d58eb9f3d0..79824506bbab 100644
> --- a/drivers/gpu/drm/i915/display/intel_colorop.h
> +++ b/drivers/gpu/drm/i915/display/intel_colorop.h
> @@ -11,5 +11,6 @@
>  struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);  st=
ruct
> intel_colorop *intel_colorop_alloc(void);  struct intel_colorop
> *intel_colorop_create(enum intel_color_block id);
> +void intel_colorop_destroy(struct drm_colorop *colorop);
>=20
>  #endif /* __INTEL_COLOROP_H__ */
> --
> 2.25.1

