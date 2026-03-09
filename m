Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL9qE44xr2kYPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:46:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5AB2410EC
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4212010E1D0;
	Mon,  9 Mar 2026 20:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVwutGt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAD910E1B2;
 Mon,  9 Mar 2026 20:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773089160; x=1804625160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=syP1WIldunQVz2peYmvaOBUycUqYWKAPoXdjGTByw+8=;
 b=hVwutGt33moQHVFkNXYv2ES6H1KGCu+O2g2Ia1T91OUHe8LRAdGsSOfU
 sb0tdMHUtalIjTx+o6/X4b9LZWWOsxdpYWW6rO9oBFMZuvCaK6IvCdam0
 07W6zR4+MWllzmbqgi9UnFOirQfRfY0LvIExMD29tIOodIGlswyhXoGOO
 aAfcH0g2qZS+hBdyEOuSi1P08NpGunsiugcXmrjAl+7Ex3pUWGIHnzNYM
 9eGjXTv+fBIdHWmq+13FAv41ahCt4Ejjbh4ZI0j0U2Fa6RI6Bo6tIO7TN
 DmZkJD1Wb8lOlDXvZmQGrMg+x0yafHyI0S2dZOn94fbIANwxNeCosA5i9 A==;
X-CSE-ConnectionGUID: w2uvNNOPRhSVZgzB3kJ1eQ==
X-CSE-MsgGUID: xS3NcX3VQLWB8PyiHFawAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73824411"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73824411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:45:59 -0700
X-CSE-ConnectionGUID: 20NE6zM1QcSTno7uYP9I4w==
X-CSE-MsgGUID: Uj43q17QSySecKL4RtoQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219995672"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:45:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:45:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 13:45:59 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:45:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Apswsm4+x9uvZVs1BfCwRdvACwHaXxHUD/Jwfdgd/5FYyMNjGFKsKoy7DRKG4EMNY45HKPV1INqxEBu7Zr84Xs6sq7uRIj5JN5sSdDvWYW9idmdVKebI5NWjj1F+/QLiXMOR2f50W/cmp3Yq4GIIBeWYTVROqou2LBO2dKnJ/75jN4RQt3wkZUElQ7d2Rq1ZVJprCKWsEdOAjXY7Zywe3nMWVldjY1mgXEnB1gU4bo0TVrBCN1ZOeubsntbfdKpbCEWfTx62/Q+REZnpCNVkesmznFAw3C0DshPdpgQ9KOBI/o9Sxofr81QvwM6sMPoeoMSZ2sL6GPoCXY3IdjQcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syP1WIldunQVz2peYmvaOBUycUqYWKAPoXdjGTByw+8=;
 b=V7ovP7l21gqbaxCYbktK1KBAfUBi1dJVB1CsRP77KlJGqObGZTHLBwoaG+XnJmf4dMGn22TDwFQsd/OXCdtOVjkyYDM1ZvoKNe1nvgAlnKvaXpiJmid5TYU77+lGPJCNKhX4/tQjG7QzlBPARxNi5Sfqc9LbPHy1HarpGYbAbUQrEEY+ZYNnt2S2Dk1dEW21sP3MElG/qckfbh16MxWTS6G0W6RSTkHXhYJX3JZ8RpNk1OWgDfouegBuLu4tXT3rk0wrZVo+WQTTaeSbEdtDDXsm5GprOwhIC+tCy4AGQIYD1V3pvQSAaneaqySr6SQ5FvwRrV4lXMpRk4vTRebGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:45:56 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 20:45:56 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Gupta, Saurabhg"
 <saurabhg.gupta@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Mrozek,
 Michal" <michal.mrozek@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>
Subject: Re: [PATCH v36 2/4] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v36 2/4] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHcrYHONfZJyVxHiEOe0KOz+n7VZrWmsFQA
Date: Mon, 9 Mar 2026 20:45:55 +0000
Message-ID: <b1bda5d1bd13d5a802de3f5a274f5ae40e84572b.camel@intel.com>
References: <20260306155556.67500-6-jonathan.cavitt@intel.com>
 <20260306155556.67500-8-jonathan.cavitt@intel.com>
In-Reply-To: <20260306155556.67500-8-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA0PR11MB7790:EE_
x-ms-office365-filtering-correlation-id: d1583649-965c-4520-2fce-08de7e1cdcc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 6m+kOXCEAxwlVXX2ck8PkhGZHBg7U4l31qJelmf+qb0wfnaOO1VwcsX3xToJv/Eg7R3AddMUhgwFEdOT1tH9TeTLEmApbtziVTNPLJ6K+ruzTsljUUrHYZyoglbeCSRFH2e+M/i+GJMWYH4+rikh9h6QFCgd38ygIRO/NWoctH9eyqkAu18rumVMu7w8KvUo3DlW6vhfNwfDjtrecy7XulZFifZOhgAjWaoshDGxivuKq80xbNTZbjQW2uHnZGoqTyjqY7uetVYum5MYbcKEUQ7XzYpTRnRaMDK9FGgD2lfP1/gj3wfxb5RHaLZOb43p7jwdeb30SyzV8qYvMZaK8y/LjRHnxmCnosbNR+Uf3zgvuu2z/CO3JoXwXXsk42UEL/FdEyh7sKt+FdqgeWi/SrwA2OVpIJqatGVXnzTPbTOeZOutbCaMxJ/Tk8zSTNxlcoyg/WdCeKuMn2aq48CyKYeYetVJBJcDt/uePRNktE1O4vPejNAb3/5bLwbN6k/uOc50yRGAaLk7waN2h0qhWJqgh2OMpD9OcwBylLgsmfxPXyafov2vXxd4vBaiTEhmKyVDpH8rjN0AHspKHrtuV8IPHcp7N1ECkIabqN0P/KWHiMPWJRzsdlwQ5H5HlGvErmAARUbWBQL6xrORg/0G0nSlguROsgV2sX/C93z3WT1OlHFvKRyu67pHOBwBG7eH2gWFyPY1h8Y4f0nLxgfpsJmhNt4zp/XgUIbzKYmOwUltRW1uqx++NYtnvM4Wtasd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXpkZGtQYWZmTDhwWFFNM3RUdjJiWExrVFNnWmhNcmtXRkpoejBZR0dBUmVM?=
 =?utf-8?B?dzY4R1pmT2N2WDFYbWpmSmRVci9CNERlMkpFWUFhc1BiNW42SU5QK29KN2hw?=
 =?utf-8?B?NjViTXRLM1ArL2tEeFRYSVRITU83ek92TVVwSmlndUE5SVFDODFoSWUrbXdU?=
 =?utf-8?B?d3hDRDZqK3VXMUZXOFJzK0ZBdytPcEFCbkFzdFFyTUtBdXhmSGJPNW5mL005?=
 =?utf-8?B?M2YySGg1MWtibjJPQ3Y5UGJtdFZndDVtNkxkYXk1blNLTkpmTFRPbkxuL28y?=
 =?utf-8?B?bEM5TWNXTVowVUhxSm9PcWJqSXY2WG5zUXJIaVVxdXhkNkhWT3cwNnhyN1pw?=
 =?utf-8?B?Y1Z4ZVdTZnpwZUM1eGc0Y29hSGFQY0daWkxaTUlPWWQvdVowS2RsS1BZbEdl?=
 =?utf-8?B?Tko2SzNGeDdzUVQzWEVmUkVGM3A5T3ljSWV3MG1CVnFXUHpWRE9aaEZHdWlD?=
 =?utf-8?B?QytMMlhkaFpMWVdQeDdEQ0ZCemk5UU1GVDMzL2VFSndmLzJneDl0cVNmR3NT?=
 =?utf-8?B?QnVBSWpXTDBmYzRldzBrVjVPUUQwOFBtNzZrejU5NmZ3SXpvOHIzZSsyNEtS?=
 =?utf-8?B?YloxeGx1b3NlTlhiTzkrMDNBVXd2Rk9aOGJ2ODI4NjdyalU1UHRHL1lKV1M2?=
 =?utf-8?B?NWpkUHdnamw4bE41R1lVRGs2UDdNWDFBRE1ONG1VM01Wd3hhREZtN1BVSkNh?=
 =?utf-8?B?c0Y4UEc2ODFrNEZIR0tsVE9hZWNxRnY3WDhOYXJXZC9zL3pEY0VWNExTZ0Rk?=
 =?utf-8?B?eGJIYWNtZEd4TmZ3L3g5aU5aV1daKzdrK21ZK1dlc1JaV2dFRENhWU03T3c3?=
 =?utf-8?B?V25MSWtSU0RoM0E0dGlvUWxYRFJaenRZYkV4azFZelAyWUpwK2t3MklOTFMv?=
 =?utf-8?B?VkxJTEd2YWMwb2tMaDNndUI1RUdqcjF5K0ZqNVY5Qkx3UVFVS3NTNEIrSXJs?=
 =?utf-8?B?STM5cldjTVJlZE4vWTl0bjdRK3h0eVd3d2VOL0dPSmJMK3E1QnRFL3Bkb3h0?=
 =?utf-8?B?c2FYNXZGaTNGdXRleExQNVc1a2J1Sm1tOVNkRlFNUnlpZmNaa2FpM29tMDRz?=
 =?utf-8?B?M3F1ZVE5QjVKbW5vYjlSQU8zMjlKSjc5YlVjU2xRV0N2SkRyT0E5UjBhRHpz?=
 =?utf-8?B?Z3A3R1p1Y2szNVZTMUJCZ09oZ0cyemlaSkVqaDBuVW5BVURWVnhBQVRab0pz?=
 =?utf-8?B?a2M2enFYT1F3WGlwdDFqK0gwbDZNZFVsUG00cUE1WXZDL3F4MXl3dXk1L240?=
 =?utf-8?B?Ti9GOGxKZU92WmlLNkh6ZkQ4NDhlN0FBWUUxc1BaVVZwVEJPVVNPWm9zLzJv?=
 =?utf-8?B?T3h5TWFMK3ZqY2I4Smk0MEJYSVBxbVFaT0ZtUjByd0F0bnhucHIrcndPVVJ2?=
 =?utf-8?B?dkZ3cEFHRVVuMzRHeERYdHJwbXhwNWtCSmcrYm82dFE4bUdnRm1NRys2YnpC?=
 =?utf-8?B?UmVrd0dFSVU4ZmdqY0E4Qk9BNEZHeGNOWXVxQnZDMXFtMnUxeHE0aE5CSWxt?=
 =?utf-8?B?dUxUWjBiSlJ0Sm1sWkRybE1IUG1jSXBWT0dLZHdRNGlwUEpVVGlRNTY4OXJM?=
 =?utf-8?B?Wm5NN3dDbGE1alhQeGNQbThxVU9CbGNVSVlOeElxQW5TU2k2cndoNXJiTTEx?=
 =?utf-8?B?YkVLQWRlVG0wODdHaVp3UDUwMzM5VE0xU2Qwa1RtMk9oTTh5S054QkxTeXlv?=
 =?utf-8?B?T0tGc3dVdUpnT3hpUGlMWExCbFUwNmNLNjNWOThYUkFwR25Hd3ltK0wxcEZY?=
 =?utf-8?B?K2IvaWZzM2pDUXJjTldhekl0TVBlZXBJdmkvdFJLam9VOWpNVTBNeVdYbmdF?=
 =?utf-8?B?aStZWjhLblRuSzREbGtNc1dOMWdSL1pFY1dJdlZ4WWFBRk5TVUw2N0hVZVh1?=
 =?utf-8?B?anpGZG5oOUV1WkI4UWMwNkZUTTc3T1dYTm5ZaFFnQXUvaThEcXVaQWhqWklD?=
 =?utf-8?B?NFlpM3p0bE9YdmJVTWNKcWhob0J0eE16cXhOUlFYUlVubzJtYVhTWWxyKzNt?=
 =?utf-8?B?dUNQM3R5RlhmNk9zbWplbm5uM29GWGFyaTExM3FtY1JmWjJNRGxmUk9IQmVT?=
 =?utf-8?B?dTFPWGpkSTVlL2lQMHUrRUVnMFdOY3FXTFViUitNME1Yc1IrSWhWNUF2WW1y?=
 =?utf-8?B?ZjVkRGNaU2lnd3hucWRjT2tyOTNsOGUrMW1qVUMzUG1rZmIrcU1wcTBKQyt4?=
 =?utf-8?B?QjBYTVNtSjRsdlZPZDcycllUZHVCeVZGM2c1N1k3bTFLYy9QdnI0WWw2TnBP?=
 =?utf-8?B?REF0SnphTGdQektxUEZNbkRQR3V4T0JzT0Vzb2xiU2hqWUVHUDFybCt1S3Fw?=
 =?utf-8?B?aGxhWEFhWVZrSDZwM0R2eW1ONHZHd2VXRlNrVUhvQkQwdSs5MDREdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3E0BDCA14E1A541BFA0123AC5D7FCC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FgdvXuy7yXf2V+CM/VtPPi2b8vHoWkh1SALABlHc/cFBw7alH4+ZsuAKFIZO3+R57HMyEEa/rbj3F18Sb5KPa2CNoJHxfeQp3S0IxvDXK5UuTequOxzrv6oMqYyPe1+8zsgALZw9n5wLVZGcV6b99QHIb1WMB2c/Hi2U7SIzmIAe2zDJllsnJL2pSoBEKcPVgoopbCKM0aPpFukDT4aRoLUYd2RJ/hTXpnXbODASomEGz+dWV6u/BZWW2sh/sNlrg97QvVaJsqvBvlyNODilrcojzeru8UB6VZinTl8cTMUWEjqLwh6YP3LgedxLTmQDU0s1UGKDhkXjgX8ODRvfiA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1583649-965c-4520-2fce-08de7e1cdcc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 20:45:56.1181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcahlO06AjUdLNtIZe1sTa0n6bjovZr/05GwJKYjVmPWy5WyYJkmg5N5aq1tBoTOMOssQcz0Fp/mbB0FFYVtqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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
X-Rspamd-Queue-Id: 0A5AB2410EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jose.souza@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

T24gRnJpLCAyMDI2LTAzLTA2IGF0IDE1OjU1ICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+IEFkZCBpbml0aWFsIGRlY2xhcmF0aW9ucyBmb3IgdGhlIGRybV94ZV92bV9nZXRfcHJvcGVy
dHkgaW9jdGwuDQo+IA0KPiB2MjoNCj4gLSBFeHBhbmQga2VybmVsIGRvY3MgZm9yIGRybV94ZV92
bV9nZXRfcHJvcGVydHkgKEppYW54dW4pDQo+IA0KPiB2MzoNCj4gLSBSZW1vdmUgYWRkcmVzcyB0
eXBlIGV4dGVybmFsIGRlZmluaXRpb25zIChKaWFueHVuKQ0KPiAtIEFkZCBmYXVsdCB0eXBlIHRv
IHhlX2RybV9mYXVsdCBzdHJ1Y3QgKEppYW54dW4pDQo+IA0KPiB2NDoNCj4gLSBSZW1vdmUgZW5n
aW5lIGNsYXNzIGFuZCBpbnN0YW5jZSAoSXZhbikNCj4gDQo+IHY1Og0KPiAtIEFkZCBkZWNsYXJl
cyBmb3IgZmF1bHQgdHlwZSwgYWNjZXNzIHR5cGUsIGFuZCBmYXVsdCBsZXZlbCAoTWF0dA0KPiBC
cm9zdCwNCj4gwqAgSXZhbikNCj4gDQo+IHY2Og0KPiAtIEZpeCBpbmNvbnNpc3RlbnQgdXNlIG9m
IHdoaXRlc3BhY2UgaW4gZGVmaW5lcw0KPiANCj4gdjc6DQo+IC0gUmViYXNlIGFuZCByZWZhY3Rv
ciAoamNhdml0dCkNCj4gDQo+IHY4Og0KPiAtIFJlYmFzZSAoamNhdml0dCkNCj4gDQo+IHVBUEk6
IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9jb21wdXRlLXJ1bnRpbWUvcHVsbC84NzgNCj4gU2ln
bmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0K
PiBSZXZpZXdlZC1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+
IEFja2VkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gQWNr
ZWQtYnk6IEl2YW4gQnJpYW5vIDxpdmFuLmJyaWFub0BpbnRlbC5jb20+DQo+IENjOiBaaGFuZyBK
aWFueHVuIDxqaWFueHVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6IEl2YW4gQnJpYW5vIDxpdmFu
LmJyaWFub0BpbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGlu
dGVsLmNvbT4NCj4gLS0tDQo+IMKgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDg2DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCA4NiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94
ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggYjAyNjRjMzJjZWIy
Li5iZTI3ZTljNDUzMzMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgN
Cj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtODMsNiArODMsNyBAQCBl
eHRlcm4gIkMiIHsNCj4gwqAgKsKgIC0gJkRSTV9JT0NUTF9YRV9PQlNFUlZBVElPTg0KPiDCoCAq
wqAgLSAmRFJNX0lPQ1RMX1hFX01BRFZJU0UNCj4gwqAgKsKgIC0gJkRSTV9JT0NUTF9YRV9WTV9R
VUVSWV9NRU1fUkFOR0VfQVRUUlMNCj4gKyAqwqAgLSAmRFJNX0lPQ1RMX1hFX1ZNX0dFVF9QUk9Q
RVJUWQ0KPiDCoCAqLw0KPiDCoA0KPiDCoC8qDQo+IEBAIC0xMDcsNiArMTA4LDcgQEAgZXh0ZXJu
ICJDIiB7DQo+IMKgI2RlZmluZSBEUk1fWEVfTUFEVklTRQkJCTB4MGMNCj4gwqAjZGVmaW5lIERS
TV9YRV9WTV9RVUVSWV9NRU1fUkFOR0VfQVRUUlMJMHgwZA0KPiDCoCNkZWZpbmUgRFJNX1hFX0VY
RUNfUVVFVUVfU0VUX1BST1BFUlRZCTB4MGUNCj4gKyNkZWZpbmUgRFJNX1hFX1ZNX0dFVF9QUk9Q
RVJUWQkJMHgwZg0KPiDCoA0KPiDCoC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVz
ICovDQo+IMKgDQo+IEBAIC0xMjUsNiArMTI3LDcgQEAgZXh0ZXJuICJDIiB7DQo+IMKgI2RlZmlu
ZQ0KPiBEUk1fSU9DVExfWEVfTUFEVklTRQkJCURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERS
TV9YRV9NQURWSVNFLCBzdHJ1Y3Rkcm1feGVfbWFkdmlzZSkNCj4gwqAjZGVmaW5lDQo+IERSTV9J
T0NUTF9YRV9WTV9RVUVSWV9NRU1fUkFOR0VfQVRUUlMJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFT
RSArIERSTV9YRV9WTV9RVUVSWV9NRU1fUkFOR0VfQVRUUlMsc3RydWN0ZHJtX3hlX3ZtX3F1ZXJ5
X21lbV9yYW5nZV9hdHRyKQ0KPiDCoCNkZWZpbmUNCj4gRFJNX0lPQ1RMX1hFX0VYRUNfUVVFVUVf
U0VUX1BST1BFUlRZCURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9FWEVDX1FVRVVF
X1NFVF9QUk9QRVJUWSxzdHJ1Y3Rkcm1feGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVydHkpDQo+ICsj
ZGVmaW5lDQo+IERSTV9JT0NUTF9YRV9WTV9HRVRfUFJPUEVSVFkJCURSTV9JT1dSKERSTV9DT01N
QU5EX0JBU0UgKyBEUk1fWEVfVk1fR0VUX1BST1BFUlRZLHN0cnVjdGRybV94ZV92bV9nZXRfcHJv
cGVydHkpDQoNCldhcyB0aGUgb3B0aW9uIHRvIHVzZSBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZ
IGRpc2N1c3NlZD8gV2UgY291bGQgYWRkDQphIGV4dGVuc2lvbiB0byBwYXNzIHRoZSBWTSBpZCBh
bmQgYXZvaWQgYWRkIGFub3RoZXIgdUFQSS4NCg0KPiDCoA0KPiDCoC8qKg0KPiDCoCAqIERPQzog
WGUgSU9DVEwgRXh0ZW5zaW9ucw0KPiBAQCAtMTI0OSw2ICsxMjUyLDg5IEBAIHN0cnVjdCBkcm1f
eGVfdm1fYmluZCB7DQo+IMKgCV9fdTY0IHJlc2VydmVkWzJdOw0KPiDCoH07DQo+IMKgDQo+ICsv
Kiogc3RydWN0IHhlX3ZtX2ZhdWx0IC0gRGVzY3JpYmVzIGZhdWx0cyBmb3INCj4gJURSTV9YRV9W
TV9HRVRfUFJPUEVSVFlfRkFVTFRTICovDQo+ICtzdHJ1Y3QgeGVfdm1fZmF1bHQgew0KPiArCS8q
KiBAYWRkcmVzczogQWRkcmVzcyBvZiB0aGUgZmF1bHQgKi8NCj4gKwlfX3U2NCBhZGRyZXNzOw0K
DQpMb29rcyBsaWtlIHRoZSBhZGRyZXNzIHJldHVybmVkIGlzIG5vdCBpbiBjYW5vbmljYWwgZm9y
bWF0LiBKdXN0IHRvDQptYWtlIGNsZWFyLCBwbGVhc2UgYWRkIGl0IHRvIHRoZSBjb21tZW50Lg0K
DQo+ICsJLyoqIEBhZGRyZXNzX3ByZWNpc2lvbjogUHJlY2lzaW9uIG9mIGZhdWx0ZWQgYWRkcmVz
cyAqLw0KPiArCV9fdTMyIGFkZHJlc3NfcHJlY2lzaW9uOw0KPiArCS8qKiBAYWNjZXNzX3R5cGU6
IFR5cGUgb2YgYWRkcmVzcyBhY2Nlc3MgdGhhdCByZXN1bHRlZCBpbg0KPiBmYXVsdCAqLw0KPiAr
I2RlZmluZSBGQVVMVF9BQ0NFU1NfVFlQRV9SRUFECQkwDQo+ICsjZGVmaW5lIEZBVUxUX0FDQ0VT
U19UWVBFX1dSSVRFCQkxDQo+ICsjZGVmaW5lIEZBVUxUX0FDQ0VTU19UWVBFX0FUT01JQwkyDQoN
CkkgY29uZmlybWVkIHdpdGggSm9uYXRoYW4gYW5kIHRoaXMgYW5kIGFjY2Vzc190eXBlIGFyZSBu
b3QgYSBiaXQgbWFzay4NCg0KPiArCV9fdTggYWNjZXNzX3R5cGU7DQo+ICsJLyoqIEBmYXVsdF90
eXBlOiBUeXBlIG9mIGZhdWx0IHJlcG9ydGVkICovDQo+ICsjZGVmaW5lIEZBVUxUX1RZUEVfTk9U
X1BSRVNFTlQJCTANCj4gKyNkZWZpbmUgRkFVTFRfVFlQRV9XUklURV9BQ0NFU1MJCTENCj4gKyNk
ZWZpbmUgRkFVTFRfVFlQRV9BVE9NSUNfQUNDRVNTCTINCj4gKwlfX3U4IGZhdWx0X3R5cGU7DQo+
ICsJLyoqIEBmYXVsdF9sZXZlbDogZmF1bHQgbGV2ZWwgb2YgdGhlIGZhdWx0ICovDQo+ICsjZGVm
aW5lIEZBVUxUX0xFVkVMX1BURQkJMA0KPiArI2RlZmluZSBGQVVMVF9MRVZFTF9QREUJCTENCj4g
KyNkZWZpbmUgRkFVTFRfTEVWRUxfUERQCQkyDQo+ICsjZGVmaW5lIEZBVUxUX0xFVkVMX1BNTDQJ
Mw0KPiArI2RlZmluZSBGQVVMVF9MRVZFTF9QTUw1CTQNCj4gKwlfX3U4IGZhdWx0X2xldmVsOw0K
PiArCS8qKiBAcGFkOiBNQlogKi8NCj4gKwlfX3U4IHBhZDsNCj4gKwkvKiogQHJlc2VydmVkOiBN
QlogKi8NCj4gKwlfX3U2NCByZXNlcnZlZFs0XTsNCj4gK307DQo+ICsNCj4gKy8qKg0KPiArICog
c3RydWN0IGRybV94ZV92bV9nZXRfcHJvcGVydHkgLSBJbnB1dCBvZg0KPiAmRFJNX0lPQ1RMX1hF
X1ZNX0dFVF9QUk9QRVJUWQ0KPiArICoNCj4gKyAqIFRoZSB1c2VyIHByb3ZpZGVzIGEgVk0gYW5k
IGEgcHJvcGVydHkgdG8gcXVlcnkgYW1vbmcNCj4gRFJNX1hFX1ZNX0dFVF9QUk9QRVJUWV8qLA0K
PiArICogYW5kIHNldHMgdGhlIHZhbHVlcyBpbiB0aGUgdm1faWQgYW5kIHByb3BlcnR5IG1lbWJl
cnMsDQo+IHJlc3BlY3RpdmVseS7CoCBUaGlzDQo+ICsgKiBkZXRlcm1pbmVzIGJvdGggdGhlIFZN
IHRvIGdldCB0aGUgcHJvcGVydHkgb2YsIGFzIHdlbGwgYXMgdGhlDQo+IHByb3BlcnR5IHRvDQo+
ICsgKiByZXBvcnQuDQo+ICsgKg0KPiArICogSWYgc2l6ZSBpcyBzZXQgdG8gMCwgdGhlIGRyaXZl
ciBmaWxscyBpdCB3aXRoIHRoZSByZXF1aXJlZCBzaXplDQo+IGZvciB0aGUNCj4gKyAqIHJlcXVl
c3RlZCBwcm9wZXJ0eS7CoCBUaGUgdXNlciBpcyBleHBlY3RlZCBoZXJlIHRvIGFsbG9jYXRlIG1l
bW9yeQ0KPiBmb3IgdGhlDQo+ICsgKiBwcm9wZXJ0eSBzdHJ1Y3R1cmUgYW5kIHRvIHByb3ZpZGUg
YSBwb2ludGVyIHRvIHRoZSBhbGxvY2F0ZWQNCj4gbWVtb3J5IHVzaW5nIHRoZQ0KPiArICogZGF0
YSBtZW1iZXIuwqAgRm9yIHNvbWUgcHJvcGVydGllcywgdGhpcyBtYXkgYmUgemVybywgaW4gd2hp
Y2gNCj4gY2FzZSwgdGhlDQo+ICsgKiB2YWx1ZSBvZiB0aGUgcHJvcGVydHkgd2lsbCBiZSBzYXZl
ZCB0byB0aGUgdmFsdWUgbWVtYmVyIGFuZCBzaXplDQo+IHdpbGwgcmVtYWluDQo+ICsgKiB6ZXJv
IG9uIHJldHVybi4NCj4gKyAqDQo+ICsgKiBJZiBzaXplIGlzIG5vdCB6ZXJvLCB0aGVuIHRoZSBJ
T0NUTCB3aWxsIGF0dGVtcHQgdG8gY29weSB0aGUNCj4gcmVxdWVzdGVkDQo+ICsgKiBwcm9wZXJ0
eSBpbnRvIHRoZSBkYXRhIG1lbWJlci4NCj4gKyAqDQo+ICsgKiBUaGUgSU9DVEwgd2lsbCByZXR1
cm4gLUVOT0VOVCBpZiB0aGUgVk0gY291bGQgbm90IGJlIGlkZW50aWZpZWQNCj4gZnJvbSB0aGUN
Cj4gKyAqIHByb3ZpZGVkIFZNIElELCBvciAtRUlOVkFMIGlmIHRoZSBJT0NUTCBmYWlscyBmb3Ig
YW55IG90aGVyDQo+IHJlYXNvbiwgc3VjaCBhcw0KPiArICogcHJvdmlkaW5nIGFuIGludmFsaWQg
c2l6ZSBmb3IgdGhlIGdpdmVuIHByb3BlcnR5IG9yIGlmIHRoZQ0KPiBwcm9wZXJ0eSBkYXRhDQo+
ICsgKiBjb3VsZCBub3QgYmUgY29waWVkIHRvIHRoZSBtZW1vcnkgYWxsb2NhdGVkIHRvIHRoZSBk
YXRhIG1lbWJlci4NCj4gKyAqDQo+ICsgKiBUaGUgcHJvcGVydHkgbWVtYmVyIGNhbiBiZToNCj4g
KyAqwqAgLSAlRFJNX1hFX1ZNX0dFVF9QUk9QRVJUWV9GQVVMVFMNCj4gKyAqLw0KPiArc3RydWN0
IGRybV94ZV92bV9nZXRfcHJvcGVydHkgew0KPiArCS8qKiBAZXh0ZW5zaW9uczogUG9pbnRlciB0
byB0aGUgZmlyc3QgZXh0ZW5zaW9uIHN0cnVjdCwgaWYNCj4gYW55ICovDQo+ICsJX191NjQgZXh0
ZW5zaW9uczsNCj4gKw0KPiArCS8qKiBAdm1faWQ6IFRoZSBJRCBvZiB0aGUgVk0gdG8gcXVlcnkg
dGhlIHByb3BlcnRpZXMgb2YgKi8NCj4gKwlfX3UzMiB2bV9pZDsNCj4gKw0KPiArI2RlZmluZSBE
Uk1fWEVfVk1fR0VUX1BST1BFUlRZX0ZBVUxUUwkJMA0KPiArCS8qKiBAcHJvcGVydHk6IHByb3Bl
cnR5IHRvIGdldCAqLw0KPiArCV9fdTMyIHByb3BlcnR5Ow0KPiArDQo+ICsJLyoqIEBzaXplOiBT
aXplIHRvIGFsbG9jYXRlIGZvciBAZGF0YSAqLw0KPiArCV9fdTMyIHNpemU7DQo+ICsNCj4gKwkv
KiogQHBhZDogTUJaICovDQo+ICsJX191MzIgcGFkOw0KPiArDQo+ICsJdW5pb24gew0KPiArCQkv
KiogQGRhdGE6IFBvaW50ZXIgdG8gdXNlci1kZWZpbmVkIGFycmF5IG9mIGZsZXhpYmxlDQo+IHNp
emUgYW5kIHR5cGUgKi8NCj4gKwkJX191NjQgZGF0YTsNCj4gKwkJLyoqIEB2YWx1ZTogUmV0dXJu
IHZhbHVlIGZvciBzY2FsYXIgcXVlcmllcyAqLw0KPiArCQlfX3U2NCB2YWx1ZTsNCj4gKwl9Ow0K
PiArDQo+ICsJLyoqIEByZXNlcnZlZDogTUJaICovDQo+ICsJX191NjQgcmVzZXJ2ZWRbM107DQo+
ICt9Ow0KPiArDQo+IMKgLyoqDQo+IMKgICogc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX2NyZWF0
ZSAtIElucHV0IG9mDQo+ICZEUk1fSU9DVExfWEVfRVhFQ19RVUVVRV9DUkVBVEUNCj4gwqAgKg0K
