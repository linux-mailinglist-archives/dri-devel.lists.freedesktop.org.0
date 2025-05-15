Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83817AB8753
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 15:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C665110E87B;
	Thu, 15 May 2025 13:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGhhNwp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D927110E879;
 Thu, 15 May 2025 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747314474; x=1778850474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h2JHSBiwq4Uxt/GfWGYsE8R6vKPxpcCmJDpwzHB5JaI=;
 b=LGhhNwp9gTDSqv0x2R9a+i+qi9w2Qrv5L3wiJJR2RmNWFFIXun8v6JVt
 HErQUV11gsERdYE1FBeDrj0aUzP+5xAbZqMNuqUi6zSzxoXnX4OgC7gQZ
 RZKfDBR8CwDpqZt5L63VUgt0eoYN1S8IHIBFboHHoCFdpy/QdjotuVuoM
 h3PPhVzWgpq3z9PHz8t0pBWcx16ussDvvd3uc7IY3P/mMvsIQzXo0AqZt
 o71ALAH8WoPI5B4RfPlkwNkcHEIJoWkCroijzrN/r+j0qp09sop9sK1Gp
 LYTp6rDqmn4RY6gPovA+/3dqJp9PvyG9uV1lV37boYU5+tyAQeRn/anZu A==;
X-CSE-ConnectionGUID: e3ZAQ6IZRFW6z/mFjm02Mg==
X-CSE-MsgGUID: NcULdU6kSXG2whhPsyuw9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="51885500"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="51885500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 06:07:52 -0700
X-CSE-ConnectionGUID: 9wUrUlaUQMyAi3o1VgJvaQ==
X-CSE-MsgGUID: uo4c4J5oSdOAKPV4qBC3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="143250731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 06:07:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 06:07:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 06:07:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 06:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRpRuzkbUYtAVQnj1JrtFwt36JD6nm1VlN7y1JxDpTh5rGPtAG710ZqMB2GpTWGZ3A0xFzn8oUFpLS2xOeIWMhD9kHBGBpAttpIHUEA6woR9ynOwqKmkbhP3kPgW1THihpFz5+Lb2/afdJXYxpiMfy4LnHMTOKiXSz+elMSUahTCGiVjKRK0841adQNVDGe63lvQvyMfkaxD5mhjdgygIHcBOfABUB2W1G3rP7ovoTNzJhIgUlYn2C8Uhw0xnGsreQ0EaTDMS2RqbAEZmrRK9ydEvzn8gfBrpxb/CLF2pGmHjRw3Moe3i23iHsyXknhD+Uw3wFkSPNlf3hdb/Aqk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2JHSBiwq4Uxt/GfWGYsE8R6vKPxpcCmJDpwzHB5JaI=;
 b=SRqs/ChrODixHLQa7q/HWquh+9NSrlrXZJgWVUNcre01prKpVFSmMT56GpEhLtcJ3eRZ9zoL33Y75wy0dcMP0K1GCYybbEOr2nXvd568c2GVZWz/5EkwlLKNxJfow1L5gbpVUubbQvteLa1oWeJzZvn1MA4Frq9d4vPiVyq9QLgWW9s/lq4uSi0WMHnFKglWqRgbFoSGdXUszK+XzHmvaT5wO6rQKzuzYu+Jt9SJjSITOhu16V19P97xQDGF08ZxaEYzBh7vvXVthwznG+qfIekeyBfdqlEkguwgPopB88Thw3o416KOcMbOkYMARFhMoWjWPquGjSM4mPPzj3/Dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 13:07:48 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:07:48 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
 <tomasw@gmail.com>
Subject: RE: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Thread-Topic: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Thread-Index: AQHbtR4fMekOitQZHke4tW+4RuIcRLO6bEuAgBk0gmCAABwwAIAADSZw
Date: Thu, 15 May 2025 13:07:48 +0000
Message-ID: <CY5PR11MB6366670BABA9A473DC864322ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-4-alexander.usyskin@intel.com>
 <aBCfbaYs9CnXL2h1@black.fi.intel.com>
 <CY5PR11MB6366AACB5EA494893CA8D16DED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <aCXb1NjwGquN6vGN@black.fi.intel.com>
In-Reply-To: <aCXb1NjwGquN6vGN@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA2PR11MB4795:EE_
x-ms-office365-filtering-correlation-id: 9b23d7cd-e7cd-4b73-1fb3-08dd93b17db5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bzM5K0g3V3hpVkpqT1Qzei9vN0RNRTNlMW9NT3AvOW1jbmhBRWN4NFgrSi9s?=
 =?utf-8?B?bms3OStDeUtLN1BtbkIyYVJrS0tObU41WDRvaENSK2loOWxFaUZuZTVGcXY1?=
 =?utf-8?B?eUhIUytKcWU5Y1o1VzIrMUcyREtPY3pTSkRveUsvR0MyMDdsOXFFRFRQdis3?=
 =?utf-8?B?TGxkS3ZUY3AxYktLcTI4MkQ2WnQ5aWw4S3ZScU91YjRaclNETHNCZXlQOTFR?=
 =?utf-8?B?K1lNNFhPa0ZDcVE0QTE1TGtMMlY0NDd3SHgzd0p6ODFTWVd6QkJmcHdKa1BY?=
 =?utf-8?B?R0hMQ2g0bVM2elVKMXJvN1llekZLSFltM2NJQm9jMVY1QVZBc0lrT3BsWXFn?=
 =?utf-8?B?QTNtNHdKWGk0c2lBTmh6dFdFcEp0eCtYbzhEckRBYXFiUGRXaG5UT2p2ZHh4?=
 =?utf-8?B?eDJkODFNYVVoWlUwd3pURkh6WnhpS1BSQ3h6dktYMEhYMUxNWU5BWUp0OGUw?=
 =?utf-8?B?M2xJWWw2SEVrM1VIbDduOHZOV1NpSVF5U0tVdzE1Zm8wUmN3SXNhQUVaM0tk?=
 =?utf-8?B?WkpqaS9aZHpLUDFtcDMrU2IrNWtQNkFBbjg2MTN6N1BRVXZnMGdETW9BR01E?=
 =?utf-8?B?d252b1dCclo3SCtQYXlmcUdWdmd2T2lza0l5bUtNVmh4ams1R2NkdXJtaXpO?=
 =?utf-8?B?Z05obG04cGx4VmhWSllMVllpUEhWZS91RVBCeTFXL1czaW5oM01DZ1lGOFVl?=
 =?utf-8?B?YTFJZS9SNzhqbUw5akhoTU1GN2EzbHc0cVI2QnZVNGYvN09WTzBod0JlamUr?=
 =?utf-8?B?bnJGc2pVWmw4RXo3a25nTnpaT1FPQkpTVWNJTVozT1U1SXJ3SFd0VGlmRFBM?=
 =?utf-8?B?VWJ0Y2R5cm1ITmtDRWlpa09JM1p5Ym0rVWxsZHJGOExPYXdjL3hHWk94Y1p0?=
 =?utf-8?B?RkYzbTFqSmFVRmpaMEROZFJmTVRqQkIxYnBLUlpZUXBWSWdtbTJXQUUzUEtx?=
 =?utf-8?B?Y2lZL0lZZitZWkhJWEN1dzVsQXU4RzBweDdGTFZXTG9mbGNEblZTcVJJKzZ4?=
 =?utf-8?B?dnNFM3pPemdENjgyTG56alo3bnRLYlNCR0ErRTlvTTZvMTU0eEIvbHdYTTND?=
 =?utf-8?B?T1lnYzJPby8rU1BhdEpLZVovMjZJa0wzV3BybktQSkZxb1RidHYxMkZOcnVJ?=
 =?utf-8?B?VVJaNUpnZ1VOQ0N5REJ4c2hpbHZyNzBweFl5ZnVvQjdnSktOdDJRdFQxczBV?=
 =?utf-8?B?K3I5eW43eWswSDZuRkF5MGRFdWNiaFAzMUMvQzhORmc3YUJuOVpWQmdRamRL?=
 =?utf-8?B?MldYWlA5dE9vT2ZBMTloOWRZMHBrb2dIZnloekx1Z2ZlU0hmcXBxdjZRU3BY?=
 =?utf-8?B?enpWaGc0ZDZONFFab0RmcE9ERGxHTU9NMzhNV1FtNUxKRWFlc0VJYXA4V0l2?=
 =?utf-8?B?WWhyc0dJdHFmejhmUG1IenhnRzdXeHhUNzNMVkpGTHRXSG1PWEVTenlmZVMv?=
 =?utf-8?B?U3h3TG4weCtUNkdkbzRBZ2I5c1VCK2J1d0tLek9Id2Z1Y2Jpc0x0U09xWDBy?=
 =?utf-8?B?MDJnejN6WGRFZkx0YmFMc2tTa2lPUUI4QUpGdHd2RlcrMXZnZWlmODlxVStZ?=
 =?utf-8?B?aTBRWTJBaDROa1RiODNoaGIrc1liL25UNlU4ODlPYXpZL0VEWUVkdTY5UzZI?=
 =?utf-8?B?MWhIbGRBQnVaUllhTm5adGV0UjBuNFpuS0prYjU5ZDNFT0xlOGluQ1BsblBu?=
 =?utf-8?B?aXJvOGdJeEdaRzJySkk0QmFMVjFCaERhd0pQeEJXNGI2YmVabjA0U2ZvWjdh?=
 =?utf-8?B?QUtzT1pzcUdHYVU3NU5aOS9FTWI1QkFlLzJFaDNtb05oVlhDeDF5a0pROHJs?=
 =?utf-8?B?TWNMTFNtYTJqM2NveVJYT3lzYzdmQ0tUUmFVVWsxVVIrd3lnUWU1aTBCa0RU?=
 =?utf-8?B?MUdiMWtnYnB2RDhMd25kVGthWmVHTTc2L0dQSS9HbnFZYkdYSlZjNnpXUXpt?=
 =?utf-8?B?dnRKMDZLWjRLMUZFY1kwUVh5dHNReFd4dkpoYk1acyt6eHRPU3hKN1ByZHRQ?=
 =?utf-8?Q?WegounbvN3/j/156Ea98NxWhhYRbAY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE1MeXVWVE5Nc1hBTkNnWXplcVMvemdZL01maGVTUGFMb1VrdWFHNEZLUldn?=
 =?utf-8?B?NXFLUFpodTY0SXNFa1JPbU9qRlE4OHplay92MEJMa2llakpiVDlZNmRVMWFl?=
 =?utf-8?B?RS8zZmk2K0JQODZXTHc0QXJhQ3JnREpDSktGdjZSK2dsTDJMS2Mxb0VIdjFV?=
 =?utf-8?B?UWFtZ0NIMnVGUjdIc3BHUml5VUJ6UDYrKzFxUWVYZ3p2Y28xVlNvaEJlUXRk?=
 =?utf-8?B?ZWdHVTNoMHRsa0g0eUloUkFOajVCV1FPUy85R2JUUVpyZXpxK1VqTnR2bDls?=
 =?utf-8?B?V281Y1Zwd1JRSjZFWDFVKzVsSmxSTWZHbWRrejQ1L0ZZUU1WTlFFRjdqcDdw?=
 =?utf-8?B?aTNVd0NENkpaaldLQWFUMUJkczQ0Ny9FUXp6YzVPd1o5dE11Wmg2eWE1R3kw?=
 =?utf-8?B?NVl1ZGpyNWU5RDU3N1ptajVxOHZpb0RwWnJYalRkSVMwQmtZS3ZMcW84OWx0?=
 =?utf-8?B?eEZBczhyTDA5TlVuS0owdzdUNTVEbm40cXlNV1FISVp1NkcxWGhJd2pjYmpQ?=
 =?utf-8?B?MXpaMjVIdmR1V0tHVWhnWGtwcUVqZ003OFhvOWROd3pRL2tjSG94S0lHUStu?=
 =?utf-8?B?WFl0cjFuNEFwQ0kycUZrbU9mWjVSTlQ1UHMrZ3hZSVEwQUpkN3dUMmcwU1Ru?=
 =?utf-8?B?RkFOQVV2WFdYdmhUT2NYdUE1TEtoNldIK3c2L1RVNG1lTFBZUndKdDlzNlJq?=
 =?utf-8?B?SGxmVHlaQnJyUFdUdXM0eElyOTE5YnRUMFFNTzFTSmNpUmlXMVNWWHdqRFRi?=
 =?utf-8?B?VWJOK041amQ4SWJjcEU3c3pUWTJlOXhsMGNac1FJOWRGMGFoRk5jSHdHeHY0?=
 =?utf-8?B?TXR4ZEIxVDd4NTFZOUdDWEZTd1NXdmRZRVFBOEZwL1hpeUNUMEZoeFBYNDlo?=
 =?utf-8?B?UWM0N0RKUjBiUytUaXVSWGVZZjFUaDk3bjdaRmVtWUdGeEw3NDJnYXMwVk5K?=
 =?utf-8?B?Zk55dE9TZEdDR3JEUDdqcFlrRWplUGVQV3JWYVlQcUxXaHpVU2tLMXRGY3V6?=
 =?utf-8?B?Mnl0cnNqZElyUVJKeXJBOC9HRUlsS1RWb3VoOXhDcmNZTzFBc25wSG15Z3pT?=
 =?utf-8?B?VmFrd1JIK1p4ZWZTY3RzTHZjQ2lwY0VHVXQ0L1N5N0cxL040THZxdXNOM3Fs?=
 =?utf-8?B?VGRDQks0blNZejZyV2tiV2pqRzdzOFdBbkE1bkpHeWcrZGh0QkRRMXdqYmI2?=
 =?utf-8?B?bi93NGx0Wlo0YS9EbkkvU1ZnZE45bVJEZWJkcnpxajZXblpIY0hFekNnem9H?=
 =?utf-8?B?a2NwNEkxd3hvMXdMZ0hrUCtyVUxpUzNlMm1Eby90T3VvYVNWSlNMcEpjbnFT?=
 =?utf-8?B?dHUyODQzeHVHd3hFRUhFemZ3NG91a3Z4aC9HWHp3VnV0ZWlKSzdpd0t3NTY2?=
 =?utf-8?B?TXdqRkhJVXFRT1VZQVI3dUxMTHpSdGpqYVZYOXJRNE80WDFXTU92MmhxbjVY?=
 =?utf-8?B?YkdCK3dqMFFVQWlyWHdkSlBaUzhEL0VaNUtiZHhPQ0VpaDVIUXZRcjVoamMx?=
 =?utf-8?B?RVduSVZPSVduOTJKQjBlTjNwdTdHUWZYcGxWVWNQZDI0SVNDY2FTdzh6ZXpi?=
 =?utf-8?B?SmphbTRqUFBRU0VSUncweUtCMEIzTHlyU1BaeXN5VWttSXJDS0Nwd1JacWtS?=
 =?utf-8?B?dFZsVWxiVHU3bjJwb2FYYUNNcEtBeTduaVZoR0JNemJMaHJXV0VRdkwrZ0pB?=
 =?utf-8?B?MmcxVUxYMXdFT1EvdGwrR3NYVng4WFYway9YbGtJUHptZUVpajJJTERxTUwr?=
 =?utf-8?B?WCtaTVJZc1JOMDZTVXhPZzN4T0hEb0VqdWE0Tk5RTUxoLzFyRUFvd0pDVFRK?=
 =?utf-8?B?NHhyQUpZQmdIZlloSTJOdS9pM090dTRBVEtDOC9GdmpjdWNFcVVVRDkvZ3RG?=
 =?utf-8?B?TXNvSmE2S2hNUWx1aWhnT2NBSkNETFhqNTNoU2lYb3lWVFpxQS84elNiNlkz?=
 =?utf-8?B?WlhPQVR2Q0pwbXdaWjVUSXRuMVlaeCtFNUVPOFIvaWdWTFNZMFo4NmtJU2sw?=
 =?utf-8?B?REtSdElCeTQ0VGNqd1dLS3pRQlhHbWVWWWdoV0gvMWx3a2w1YWxGRWpFSnJV?=
 =?utf-8?B?Y09VanNTeWk1OHJFSUdMcHlRK0IraVY3a1BncTIzMGtNNlpVQmowUG9mTzNT?=
 =?utf-8?Q?7EyvYyXxnhdw7LqE8EfYdOXWq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b23d7cd-e7cd-4b73-1fb3-08dd93b17db5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 13:07:48.3764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kbOPRnnBQIpUbJ2pv2xgeSR+m9It/dmukwtPuSX6PpQ0F3urZV4b15Xl7TeqQkmTTYmqY76Gv+5VadiB6cQk1Z2lXmXIWy8V4yVyNnE0hJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDAzLzEyXSBtdGQ6IGludGVsLWRnOiBpbXBsZW1lbnQg
cmVnaW9uIGVudW1lcmF0aW9uDQo+IA0KPiBPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCAwNDo1Mzoz
OFBNICswNTMwLCBVc3lza2luLCBBbGV4YW5kZXIgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEFwciAy
NCwgMjAyNSBhdCAwNDoyNToyN1BNICswMzAwLCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToNCj4g
PiA+ID4gSW4gaW50ZWwtZGcsIHRoZXJlIGlzIG5vIGFjY2VzcyB0byB0aGUgc3BpIGNvbnRyb2xs
ZXIsDQo+ID4gPiA+IHRoZSBpbmZvcm1hdGlvbiBpcyBleHRyYWN0ZWQgZnJvbSB0aGUgZGVzY3Jp
cHRvciByZWdpb24uDQo+ID4gPg0KPiA+ID4gLi4uDQo+ID4gPg0KPiA+ID4gPiBAQCAtMjIsOSAr
MjQsMTk5IEBAIHN0cnVjdCBpbnRlbF9kZ19udm0gew0KPiA+ID4gPiAgCQl1OCBpZDsNCj4gPiA+
ID4gIAkJdTY0IG9mZnNldDsNCj4gPiA+ID4gIAkJdTY0IHNpemU7DQo+ID4gPiA+ICsJCXVuc2ln
bmVkIGludCBpc19yZWFkYWJsZToxOw0KPiA+ID4gPiArCQl1bnNpZ25lZCBpbnQgaXNfd3JpdGFi
bGU6MTsNCj4gPiA+ID4gIAl9IHJlZ2lvbnNbXSBfX2NvdW50ZWRfYnkobnJlZ2lvbnMpOw0KPiA+
ID4gPiAgfTsNCj4gPiA+ID4NCj4gPiA+ID4gKyNkZWZpbmUgTlZNX1RSSUdHRVJfUkVHICAgICAg
IDB4MDAwMDAwMDANCj4gPiA+ID4gKyNkZWZpbmUgTlZNX1ZBTFNJR19SRUcgICAgICAgIDB4MDAw
MDAwMTANCj4gPiA+ID4gKyNkZWZpbmUgTlZNX0FERFJFU1NfUkVHICAgICAgIDB4MDAwMDAwNDAN
Cj4gPiA+ID4gKyNkZWZpbmUgTlZNX1JFR0lPTl9JRF9SRUcgICAgIDB4MDAwMDAwNDQNCj4gPiA+
ID4gKy8qDQo+ID4gPiA+ICsgKiBbMTU6MF0tRXJhc2Ugc2l6ZSA9IDB4MDAxMCA0SyAweDAwODAg
MzJLIDB4MDEwMCA2NEsNCj4gPiA+ID4gKyAqIFsyMzoxNl0tUmVzZXJ2ZWQNCj4gPiA+ID4gKyAq
IFszMToyNF0tRXJhc2UgTUVNIFJlZ2lvbklEDQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gKyNkZWZp
bmUgTlZNX0VSQVNFX1JFRyAgICAgICAgIDB4MDAwMDAwNDgNCj4gPiA+ID4gKyNkZWZpbmUgTlZN
X0FDQ0VTU19FUlJPUl9SRUcgIDB4MDAwMDAwNzANCj4gPiA+ID4gKyNkZWZpbmUgTlZNX0FERFJF
U1NfRVJST1JfUkVHIDB4MDAwMDAwNzQNCj4gPiA+ID4gKw0KPiA+ID4gPiArLyogRmxhc2ggVmFs
aWQgU2lnbmF0dXJlICovDQo+ID4gPiA+ICsjZGVmaW5lIE5WTV9GTFZBTFNJRyAgICAgICAgICAw
eDBGRjBBNTVBDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyNkZWZpbmUgTlZNX01BUF9BRERSX01BU0sg
ICAgIEdFTk1BU0soNywgMCkNCj4gPiA+ID4gKyNkZWZpbmUgTlZNX01BUF9BRERSX1NISUZUICAg
IDB4MDAwMDAwMDQNCj4gPiA+ID4gKw0KPiA+ID4gPiArI2RlZmluZSBOVk1fUkVHSU9OX0lEX0RF
U0NSSVBUT1IgIDANCj4gPiA+ID4gKy8qIEZsYXNoIFJlZ2lvbiBCYXNlIEFkZHJlc3MgKi8NCj4g
PiA+ID4gKyNkZWZpbmUgTlZNX0ZSQkEgICAgICAweDQwDQo+ID4gPiA+ICsvKiBGbGFzaCBSZWdp
b24gX19uIC0gRmxhc2ggRGVzY3JpcHRvciBSZWNvcmQgKi8NCj4gPiA+ID4gKyNkZWZpbmUgTlZN
X0ZMUkVHKF9fbikgKE5WTV9GUkJBICsgKChfX24pICogNCkpDQo+ID4gPiA+ICsvKiAgRmxhc2gg
TWFwIDEgUmVnaXN0ZXIgKi8NCj4gPiA+ID4gKyNkZWZpbmUgTlZNX0ZMTUFQMV9SRUcgIDB4MTgN
Cj4gPiA+ID4gKyNkZWZpbmUgTlZNX0ZMTVNUUjRfT0ZGU0VUIDB4MDBDDQo+ID4gPiA+ICsNCj4g
PiA+ID4gKyNkZWZpbmUgTlZNX0FDQ0VTU19FUlJPUl9QQ0lFX01BU0sgMHg3DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKyNkZWZpbmUgTlZNX0ZSRUdfQkFTRV9NQVNLIEdFTk1BU0soMTUsIDApDQo+ID4g
PiA+ICsjZGVmaW5lIE5WTV9GUkVHX0FERFJfTUFTSyBHRU5NQVNLKDMxLCAxNikNCj4gPiA+ID4g
KyNkZWZpbmUgTlZNX0ZSRUdfQUREUl9TSElGVCAxMg0KPiA+ID4gPiArI2RlZmluZSBOVk1fRlJF
R19NSU5fUkVHSU9OX1NJWkUgMHhGRkYNCj4gPiA+DQo+ID4gPiBTaG91bGQgd2UgbW92ZSB0aGVz
ZSB0byBhIGhlYWRlcj8NCj4gPiBUaGV5IGFyZSB1c2VkIG9ubHkgaW4gdGhpcyBmaWxlLCBub3Qg
c2hhcmVkIHRvIGFueW9uZSwgd2h5IHRvIHB1dCBpbiBoZWFkZXI/DQo+IA0KPiBJZiB3ZSBrbm93
IHdlIHdvbid0IGJlIGZ1cnRoZXIgZXhwYW5kaW5nL3NwbGl0dGluZywgc3VyZS4NCj4gDQo+IC4u
Lg0KPiANCj4gPiA+ID4gK3N0YXRpYyBib29sIGlkZ19udm1fcmVnaW9uX3JlYWRhYmxlKHUzMiBh
Y2Nlc3NfbWFwLCB1OCByZWdpb24pDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJaWYgKHJlZ2lvbiA8
IDEyKQ0KPiA+ID4NCj4gPiA+IEFueXRoaW5nIHNwZWNpYWwgYWJvdXQgMTI/IFNob3VsZCBpdCBo
YXZlIGEgbWFjcm8gZGVmIHNvbWV3aGVyZT8NCj4gPiA+DQo+ID4NCj4gPiBUaGUgYWNjZXNzIGJp
dHMgYXJlIHNlcGFyYXRlZCBmb3IgZmlyc3QgMTIgcmVnaW9ucyBhbmQgbGFzdCA0Lg0KPiA+IE15
IGZlZWxpbmcgdGhhdCBtYWtpbmcgYmVsb3cgbnVtYmVycyAjZGVmaW5lIHdpbGwgbWFrZQ0KPiA+
IGNvZGUgbGVzcyByZWFkYWJsZS4NCj4gDQo+IFRoZW4gcGVyaGFwcyBhIHNtYWxsIGNvbW1lbnQg
d291bGQgYmUgdXNlZnVsLg0KU3VyZSwgZG9jdW1lbnRpbmcgdGhpcy4NCg0KPiANCj4gPiA+ID4g
KwkJcmV0dXJuIGFjY2Vzc19tYXAgJiBCSVQocmVnaW9uICsgOCk7IC8qIFsxOTo4XSAqLw0KPiA+
ID4gPiArCWVsc2UNCj4gPiA+ID4gKwkJcmV0dXJuIGFjY2Vzc19tYXAgJiBCSVQocmVnaW9uIC0g
MTIpOyAvKiBbMzowXSAqLw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMg
Ym9vbCBpZGdfbnZtX3JlZ2lvbl93cml0YWJsZSh1MzIgYWNjZXNzX21hcCwgdTggcmVnaW9uKQ0K
PiA+ID4gPiArew0KPiA+ID4gPiArCWlmIChyZWdpb24gPCAxMikNCj4gDQo+IERpdHRvLg0KVGhl
IGNvbW1lbnQgYmVmb3JlIHByZXZpb3VzIGZ1bmN0aW9uIHdpbGwgaW5jbHVkZSBib3RoIHJlYWQg
YW5kIHdyaXRlIGFjY2VzcyBiaXRzLg0KDQo+IA0KPiA+ID4gPiArCQlyZXR1cm4gYWNjZXNzX21h
cCAmIEJJVChyZWdpb24gKyAyMCk7IC8qIFszMToyMF0gKi8NCj4gPiA+ID4gKwllbHNlDQo+ID4g
PiA+ICsJCXJldHVybiBhY2Nlc3NfbWFwICYgQklUKHJlZ2lvbiAtIDgpOyAvKiBbNzo0XSAqLw0K
PiA+ID4gPiArfQ0KPiANCj4gUmFhZw0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCg==
