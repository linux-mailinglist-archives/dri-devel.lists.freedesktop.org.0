Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLgGMfySqGk3vwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:15:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37362207827
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAEB10EA9F;
	Wed,  4 Mar 2026 20:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igJclaWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01F610EA9E;
 Wed,  4 Mar 2026 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772655353; x=1804191353;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fgvcmYLgRWpyChA0kM2tPQExh2T2h4+V4JmK+L7cpWk=;
 b=igJclaWfLCjzNlmDQ+/uSbqFw7f4oi99fBcPgazCxTEBGWtDOeeIm/Nc
 OblnVimWDZw9xCL4XeqOO/9ckhvLLdLsYbHXNQ9Jn6wpwmMBf5InSJ2Ck
 kJoYKc/Macl7RKP5b2xxBW2+aEruZL8RdLybsK129P35Ws2/joG5A3kT2
 LCUyjASsChu3WSCdIB2ZRB3/YRvFyO6L5PihzEEovxQhp/w6ePPW8hGQY
 c2jSEMqqwYjex5rbP7ilSA3OXXBSGyQeMu1udh2LGTfN4irE/rof3p4HO
 0NWEQMrut1oH/4LLFSx3JgySgP3JgAoqAznvEQ9WiC684UyboJDPOrhyW A==;
X-CSE-ConnectionGUID: N9wOfVtgRyqhJQQ76By0PA==
X-CSE-MsgGUID: /+QGNkb5SnSnjEmwN1LPuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73921111"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73921111"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 12:15:52 -0800
X-CSE-ConnectionGUID: 34JOFjuRSoyyi132fvP5pQ==
X-CSE-MsgGUID: rpma6iDPStyy1TSsy14X4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215769541"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 12:15:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 12:15:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 12:15:51 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 12:15:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMba5+C30euu4uM3Y5+If9iGlPrnkqFxjNISc8MhrLMpmonKTOIqbQnltP3QtonhGWxtV7+atgbXQbzyFc8w5e0baLM9BAV+2qyWaEpjnEzVGpRY303JQvhe/PkKzH7LbnEQZyRBMGKEBoTukmwO4slRsXycBWR8MR1jxRDbPdSClaRwQ1wJcFRQy21M3nL3WDSTcbMTZ3xtEgFdzJYYymYxqFgJ1VLYsLccmho6B1iGZeBRwnILaXi2nYQWzzrRiSrH3lOznOP3RF0uxdGs6VZQH8IG0wr4G9UQ6S2FoEQTYAF7dJsmYR/Djq2vQ3cb5vurVjwp8bEn7ZRfH5+YEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgvcmYLgRWpyChA0kM2tPQExh2T2h4+V4JmK+L7cpWk=;
 b=nf76kHe9zMNE7tDzMz3rgnOLjPHK+tRKCPa3euGBEhjmAP/3V5iIcsLiajKxlAkpVVWoTqyEiVMQaHKlvQO1XB6ec8kwUSSMuucEEjGd6rp7yzLfpS5jRuJbWCMu9KHGawED/+RN5Btyjq3MRdR2Ah6bWzBDK4bEYS3xJcDZmSk2x75ej2vfpD8OYidhoHDflKpO/95KsmJG6GiF7JTlEmL6sS00yAA80AWivnZU0aukwSpetmn3TB2eotzz1LRrS6IpxAmJxi884tx8nbTEKqhqUgrP/h0/el6c90IyNfLnx3lwfuv5KjO1kr7Wo91Ir1gnzoYpTbgqUbiYKK36Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:15:46 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 20:15:46 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "irenic.rajneesh@gmail.com"
 <irenic.rajneesh@gmail.com>, "ilpo.jarvinen@linux.intel.com"
 <ilpo.jarvinen@linux.intel.com>, "srinivas.pandruvada@linux.intel.com"
 <srinivas.pandruvada@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xi.pardee@linux.intel.com"
 <xi.pardee@linux.intel.com>
CC: "hansg@kernel.org" <hansg@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v7 3/6] platform/x86/intel/vsec: Decouple add/link helpers
 from PCI
Thread-Topic: [PATCH v7 3/6] platform/x86/intel/vsec: Decouple add/link
 helpers from PCI
Thread-Index: AQHcqs2FEEKfrIiCrEexGPeAnIBbk7We0KOA
Date: Wed, 4 Mar 2026 20:15:46 +0000
Message-ID: <IA1PR11MB641875305F5E6D8B637F7E29C17CA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260303051953.1453372-1-david.e.box@linux.intel.com>
 <20260303051953.1453372-4-david.e.box@linux.intel.com>
In-Reply-To: <20260303051953.1453372-4-david.e.box@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB7961:EE_
x-ms-office365-filtering-correlation-id: 3c7a8a55-02ad-4039-5f40-08de7a2ad1e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020|7053199007; 
x-microsoft-antispam-message-info: nqr+26QKLQadehIRmkYO2DSBmZn0dlt6g8eSGKSaIwEy2+b/BbhlmvwTI84cFYiBjJYc1HqEZKaG0o7jrDm1kqZOTTTHQoz12g1kCkiHJh75i/3IfBwzzmHlVjvhrQYX1MOQO32LTHaCBheFspsiqMNC9O8VkaPhVhfjJYyW3ujdTgiKAM9addlHZg2ORpj+T9PpSORRuNZsRQDygQHRHRXGbzV88SB0iYdr7YnJcEHmDviFmIWjcUCYU9ZgY0MkfX8knY+Ryz3HCtoxKwJJoW5gB3Ocg6ud/2vHpnhnPumtA2x7qvc/iIVKpchYPzyKJcOCdNkzDG0t+Xi8YlBMYbUQ64GfbCKPbXjrv4gzB0gHnORN0TwExFbE95+zTa+MTyo9vYAJzds8rFe3zzyx5PCaRq58ktCZjIQr1REAx221KbbxZsnz6NB/8EyIhOckN8Eavz3svec0lFdB5QoqmDrjGBUHsVgM4gx/uKT9Xk7ILNL3xCtxgG8AVfHqsNr+B4TV8JW6TUiwnHcyDPXFWWhUWQ94SFfsABmJlYIKjVgVXATdSQZHusa4aGvlHaLRNWGKyOpLC4YkSg9m005qoiDPqfYNEHmeZABExrlEIBdk8IRiEsHZQPVGR24wJdBIibXqltfa/cx/1Qut38HnRmACi1pfc/Idj547IdFyizms3Guuplfvl7qODVUOnvZQc7ZN4Lui3bfn0cNrLBBhQ+JG4DpO9cpAoNdZl503sbPGWT54c30SFrRdMi+N+pevP/qX7jpKhdUfn0hYOweHO8l8YuU0zoaqzDbhPfeklxIiyTqfGjMPn3qN/pobUXya
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUUyUWJVbG1sYmZSajZnenh5TS9Gc1FOOUF3V3lKVDh5b3FZcmZtL3d4UGU2?=
 =?utf-8?B?YkVoZ0FWWXVqd01ZRm1SMGZrNDRsck40SER3RFA2NkVaZUJyZ216Szh2Snky?=
 =?utf-8?B?RkFSQlhESHMxeDNLdlF3K2wvT0ZsdFpWa0licWVncVRrMHBaVmIzUGowNGcr?=
 =?utf-8?B?YVhlbHpRT0dXL1NjdFdZbWJZaVhjQVptamU5a25rWGVsd0dKOUgrOGZ0SFVL?=
 =?utf-8?B?VkF0MlJIMEMvNWdoTG1aai81ajU5SW85WGhzaEpsUm8zeFUrL2xCZlB5a0RK?=
 =?utf-8?B?Vmx6NXN4Y0k2cnVZaGV4eDFpNWdvSEJZSkp3SWZOU09lZTNLbUVad2xtZjd1?=
 =?utf-8?B?VUFTNnB1Wm5uM3ljTWp2dmtrdTZtSGtlR25RWjIwYkxMSG5VbG40WTNkbVkz?=
 =?utf-8?B?TDhrTVVVU24vZmlnM3Brbjc0T1pScnl3anpOeDVoN3B1MlU0V0NhejM3NXpJ?=
 =?utf-8?B?M2xaV1pGbnZGTUFmRGJXK0VKNVU1VkoxZnBpVkhGTC9EaGVYVWNBcDBSMHQv?=
 =?utf-8?B?WW54OWRyaG9ITlZTTTlvUzloT2lVS21tbGhIZnlqdUtDSVl5TktRT3hlU1h3?=
 =?utf-8?B?cDdHZ1UzNmxSNTVlZEhBbXozbjJhRnBFREU1K3QwY2NuUGljNDVCU3c2YzJr?=
 =?utf-8?B?VEdWLzQ0NjBSa2dXRjIrbUltQ1pwOFo1V3VuVzZ5VExMZHpiVnpzSDdJeTN5?=
 =?utf-8?B?a2ZSd0NMWFdKNE11MGhXTnFERytBMDV1SGJGdnV0UmdlNjduY0NuaE5WSGIr?=
 =?utf-8?B?SktHK0J6TVJ2WjFjRy9LMGNZWVRNbmZrUHhJWS9pVjdMOHFkd3VBMFNabVJ5?=
 =?utf-8?B?bXlYOUUxWHIxU3RBVUF5TG13STZnYnplSmxxZE05d1lReGZQNUhtZjF0S3Zh?=
 =?utf-8?B?T3hmNEVKMVJkcUdVWHV6VThVMFprTlMycnN5alBTOVFGeHh1TUhnWEd2Tit0?=
 =?utf-8?B?QTVIdk04NWU1Nk5zU2hOUytkdHYzemJCdysvWHV2NXBrVzVIMTE5Z2dpZHdo?=
 =?utf-8?B?dUxwRWg2K0J6cUhldk5yVVRLcUdHeGFVU2tXaDZUcEVpSlFHUEhVeUVHQWZo?=
 =?utf-8?B?aDZqRzBaLzRoUFdxdU5JdThXOGRCZ3ZzaWVuTFlPcHIzeXo2TjZIeFpLVmVV?=
 =?utf-8?B?dG5SMTZTclMxL3hSdE1JWW9SRzdvUXJIMlJTd25sQm9KWjFKNnhlS0J4ZXJR?=
 =?utf-8?B?YUlwZ0JMYVhNU0EwUU42aTF4ZWd3RVVjaGtSbGJkQzRFYnJhRHY5Q1hoZmdp?=
 =?utf-8?B?aWdtcTlFNldIUUZYZEZzOVpycDgvODExQ21jaTFwcEhLMm1sMkc3N1pNZ0lX?=
 =?utf-8?B?ck9NcUNqQnNUSWh2T3dYZTlSZEhsQTlwOVdLdkJzVFhYdmRNY21rdGxTaG43?=
 =?utf-8?B?ZUtLZUxNL041YytQT293YW9DT1VFUDd6RkVQZUpaaWlTVnNicVhXelZkNXZX?=
 =?utf-8?B?cjFJRTFPQWMwUERBUW5zK1RaK1VzYnJkd3V2b01zS3FWTS9JREtZTnhqbXUz?=
 =?utf-8?B?VkRKbStXakVTT2FtU29idUt3MFFzL0VjUzBodTVOVElWM2F3OFVScWkveEVr?=
 =?utf-8?B?MHh3R1kzR2ZrMVBuclN3TFlMRHRwa1M2aWJKc3FzVTVKRm1pOC9Sb3FTN3hK?=
 =?utf-8?B?L29yeWthWnFCUEt4L3VabWVROTZhWHZvNmxzTUdyVUVRbUpmNkswUjdnSjlZ?=
 =?utf-8?B?WVdXbHlZZEhjcXZCT1VlWjQzdUdqcWxveWRpZjJpRUduUjR4OWJCWUQ2SVBD?=
 =?utf-8?B?cFM3d0k4Z3pGUWJFODRpSFF0L0YyWUdHSnU2QWJka3ZTZ01tYUxqVitUR3Mv?=
 =?utf-8?B?NjVPTld3SUVYZjcxcDFvREdSUjdVbmNVOEJpK3VEQVR2MlllVlFjOTRXTi9q?=
 =?utf-8?B?OG0wZCtKQi9OeS85UUdCUFFkTk94eFA0ODIyUXNNYmh4R1RpQmxKS1FrQXNI?=
 =?utf-8?B?OEo0ODEzTW5iWGxOb3UxWGxidkJLc2M3RGxaMm5iSE5rbXAyRmdtczhXZEVR?=
 =?utf-8?B?Y3BzZ1FvZ002Tjh4bk5qZ09UUkhSZDk4bEhoWnY1aUEvODZzd1NnanVSUUFi?=
 =?utf-8?B?bHBJc1pDOXFzSzQxaHF0ZEpzVUJISCtwN2U0dGprYmJPYUFXSlVFb0hyVDlS?=
 =?utf-8?B?dzA4NXkrWUlJWklvSmhuRzZpZXh5WG5oUUcvNUNGL0V4bTVWRnhHb1hmQk5Z?=
 =?utf-8?B?cGw0bGJEeDFHb0ZoNnA2SGFYL3RGNEpiM29mOG5QY3MrK05CQkhNK1B5VE55?=
 =?utf-8?B?ZzVOeVZnV0k2a2MyZEJCWDkvZFNUblgwMzRvZlpsb2UzSW4wY29XU0l6ZEFV?=
 =?utf-8?B?MTkvMzkwSytTV1pxNkRLMStYck4yOGhFNXBXOTVmZzhBTkM5YmNiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7a8a55-02ad-4039-5f40-08de7a2ad1e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 20:15:46.1534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9Xp68G29cx2IdfzIZ1JbXsKkaM1aCgb0qSQTTgLLPcjZalV25aKCdTlC/AACbggpdgHuk7gcvehZzm/HAfkzMAY0KF/cC2XZw4bGv6SKuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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
X-Rspamd-Queue-Id: 37362207827
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,IA1PR11MB6418.namprd11.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.j.ruhl@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBEYXZpZA0KPkUuIEJv
eA0KPlNlbnQ6IFR1ZXNkYXksIE1hcmNoIDMsIDIwMjYgMTI6MjAgQU0NCj5UbzogdGhvbWFzLmhl
bGxzdHJvbUBsaW51eC5pbnRlbC5jb207IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRl
bC5jb20+Ow0KPmlyZW5pYy5yYWpuZWVzaEBnbWFpbC5jb207IGlscG8uamFydmluZW5AbGludXgu
aW50ZWwuY29tOw0KPnNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tOyBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IHhpLnBhcmRlZUBsaW51eC5pbnRlbC5jb20NCj5DYzogZGF2aWQuZS5ib3hAbGludXguaW50
ZWwuY29tOyBoYW5zZ0BrZXJuZWwub3JnOyBsaW51eC0NCj5rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFtQQVRDSCB2
NyAzLzZdIHBsYXRmb3JtL3g4Ni9pbnRlbC92c2VjOiBEZWNvdXBsZSBhZGQvbGluayBoZWxwZXJz
DQo+ZnJvbSBQQ0kNCj4NCj5UaGlzIHJlZmFjdG9yIGlzIHByZXBhcmVzIGZvciBhZGRpbmcgQUNQ
SS1lbnVtZXJhdGVkIFBNVCBlbmRwb2ludHMuIFdoaWxlDQo+aW50ZWxfdnNlYyBpcyBib3VuZCB0
byBQQ0kgdG9kYXksIHNvbWUgaGVscGVycyBhcmUgdXNlZCBieSBjb2RlIHRoYXQgd2lsbA0KPmFs
c28gcmVnaXN0ZXIgUE1UIGVuZHBvaW50cyBmcm9tIG5vbi1QQ0kgKEFDUEkpIHBhdGhzLiBDbGVh
biB1cA0KPlBDSS1zcGVjaWZpYyBwbHVtYmluZyB3aGVyZSBpdCBpc27igJl0IHN0cmljdGx5IHJl
cXVpcmVkIGFuZCByZWx5IG9uDQo+Z2VuZXJpYyBzdHJ1Y3QgZGV2aWNlIHdoZXJlIHBvc3NpYmxl
Lg0KPg0KPlJldmlld2VkLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5p
bnRlbC5jb20+DQo+U2lnbmVkLW9mZi1ieTogRGF2aWQgRS4gQm94IDxkYXZpZC5lLmJveEBsaW51
eC5pbnRlbC5jb20+DQo+LS0tDQo+Q2hhbmdlcyBpbiB2NzoNCj4gIC0gQ29ycmVjdCB0aGUgcmVt
YWluaW5nIHN0cnVjdCBkZXZpY2UgKiBhcmd1bWVudCB0byBpbnRlbF92c2VjX2FkZF9hdXgoKS4N
Cj4gICAgV2hlbiBkcm9wcGluZyB0aGUgdW51c2VkIGZpcnN0IGFyZ3VtZW50IGluIHY2LCB0aGUg
ZGV2aWNlIHBhcmFtZXRlciB3YXMNCj4gICAgaW5hZHZlcnRlbnRseSBjaGFuZ2VkIGZyb20gJnZz
ZWNfZGV2LT5hdXhkZXYuZGV2IHRvIHRoZSBQQ0kgZGV2aWNlLg0KPiAgICBSZXN0b3JlIHRoZSBh
dXggZGV2aWNlLg0KPg0KPkNoYW5nZXMgaW4gdjY6DQo+ICAtIE5vIGNoYW5nZQ0KPg0KPkNoYW5n
ZXMgaW4gdjU6DQo+ICAtIE5vIGNoYW5nZQ0KPg0KPkNoYW5nZXMgaW4gdjQ6DQo+ICAtIE5vIGNo
YW5nZQ0KPg0KPkNoYW5nZXMgaW4gdjM6DQo+ICAtIE5vIGNoYW5nZQ0KPg0KPkNoYW5nZXMgaW4g
djI6DQo+ICAtIE5vIGNoYW5nZSAocHJldmlvdXMgcGF0Y2ggMSkNCj4NCj4gZHJpdmVycy9wbGF0
Zm9ybS94ODYvaW50ZWwvdnNlYy5jICAgICAgfCAxMyArKysrKysrKystLS0tDQo+IGRyaXZlcnMv
cGxhdGZvcm0veDg2L2ludGVsL3ZzZWNfdHBtaS5jIHwgIDIgKy0NCj4gaW5jbHVkZS9saW51eC9p
bnRlbF92c2VjLmggICAgICAgICAgICAgfCAgMiArLQ0KPiAzIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxh
dGZvcm0veDg2L2ludGVsL3ZzZWMuYw0KPmIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdnNl
Yy5jDQo+aW5kZXggZTAwOTZiZTYwNWQ5Li45Mzg2NDhiOWVmMDkgMTAwNjQ0DQo+LS0tIGEvZHJp
dmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdnNlYy5jDQo+KysrIGIvZHJpdmVycy9wbGF0Zm9ybS94
ODYvaW50ZWwvdnNlYy5jDQo+QEAgLTE1OCwxOCArMTU4LDIzIEBAIHN0YXRpYyBib29sIHZzZWNf
ZHJpdmVyX3ByZXNlbnQoaW50IGNhcF9pZCkNCj4gICovDQo+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGNpX2RldmljZV9pZCBpbnRlbF92c2VjX3BjaV9pZHNbXTsNCj4NCj4tc3RhdGljIGludCBpbnRl
bF92c2VjX2xpbmtfZGV2aWNlcyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IGRldmljZSAq
ZGV2LA0KPitzdGF0aWMgaW50IGludGVsX3ZzZWNfbGlua19kZXZpY2VzKHN0cnVjdCBkZXZpY2Ug
KnBhcmVudCwgc3RydWN0IGRldmljZSAqZGV2LA0KPiAJCQkJICAgaW50IGNvbnN1bWVyX2lkKQ0K
DQpUaGlzIGZ1bmN0aW9uYWxpdHkgaXMgZXhwbGljaXRseSBmb3IgcGNpIGRldmljZXM/DQoNCndv
dWxkIGludGVsX3ZzZWNfcGNpX2xpbmtfZGV2aWNlcygpICAob3Igc29tZXRoaW5nIHNpbWlsYXIp
IGJlIGEgYmV0dGVyIG5hbWU/DQoNClJlZ2FyZGxlc3MsDQoNClJldmlld2VkLWJ5OiBNaWNoYWVs
IEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KTQ0KDQo+IHsNCj4gCWNvbnN0
IHN0cnVjdCB2c2VjX2ZlYXR1cmVfZGVwZW5kZW5jeSAqZGVwczsNCj4gCWVudW0gdnNlY19kZXZp
Y2Vfc3RhdGUgKnN0YXRlOw0KPiAJc3RydWN0IGRldmljZSAqKnN1cHBsaWVyczsNCj4gCXN0cnVj
dCB2c2VjX3ByaXYgKnByaXY7DQo+KwlzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4gCWludCBzdXBw
bGllcl9pZDsNCj4NCj4gCWlmICghY29uc3VtZXJfaWQpDQo+IAkJcmV0dXJuIDA7DQo+DQo+Kwlp
ZiAoIWRldl9pc19wY2kocGFyZW50KSkNCj4rCQlyZXR1cm4gMDsNCj4rDQo+KwlwZGV2ID0gdG9f
cGNpX2RldihwYXJlbnQpOw0KPiAJaWYgKCFwY2lfbWF0Y2hfaWQoaW50ZWxfdnNlY19wY2lfaWRz
LCBwZGV2KSkNCj4gCQlyZXR1cm4gMDsNCj4NCj5AQCAtMjA0LDcgKzIwOSw3IEBAIHN0YXRpYyBp
bnQgaW50ZWxfdnNlY19saW5rX2RldmljZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+c3RydWN0
IGRldmljZSAqZGV2LA0KPiAJcmV0dXJuIDA7DQo+IH0NCj4NCj4taW50IGludGVsX3ZzZWNfYWRk
X2F1eChzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IGRldmljZSAqcGFyZW50LA0KPitpbnQg
aW50ZWxfdnNlY19hZGRfYXV4KHN0cnVjdCBkZXZpY2UgKnBhcmVudCwNCj4gCQkgICAgICAgc3Ry
dWN0IGludGVsX3ZzZWNfZGV2aWNlICppbnRlbF92c2VjX2RldiwNCj4gCQkgICAgICAgY29uc3Qg
Y2hhciAqbmFtZSkNCj4gew0KPkBAIC0yNTIsNyArMjU3LDcgQEAgaW50IGludGVsX3ZzZWNfYWRk
X2F1eChzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0DQo+ZGV2aWNlICpwYXJlbnQsDQo+IAlp
ZiAocmV0KQ0KPiAJCWdvdG8gY2xlYW51cF9hdXg7DQo+DQo+LQlyZXQgPSBpbnRlbF92c2VjX2xp
bmtfZGV2aWNlcyhwZGV2LCAmYXV4ZGV2LT5kZXYsIGludGVsX3ZzZWNfZGV2LQ0KPj5jYXBfaWQp
Ow0KPisJcmV0ID0gaW50ZWxfdnNlY19saW5rX2RldmljZXMocGFyZW50LCAmYXV4ZGV2LT5kZXYs
IGludGVsX3ZzZWNfZGV2LQ0KPj5jYXBfaWQpOw0KPiAJaWYgKHJldCkNCj4gCQlnb3RvIGNsZWFu
dXBfYXV4Ow0KPg0KPkBAIC0zNDMsNyArMzQ4LDcgQEAgc3RhdGljIGludCBpbnRlbF92c2VjX2Fk
ZF9kZXYoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+c3RydWN0IGludGVsX3ZzZWNfaGVhZGVyICpo
ZQ0KPiAJICogUGFzcyB0aGUgb3duZXJzaGlwIG9mIGludGVsX3ZzZWNfZGV2IGFuZCByZXNvdXJj
ZSB3aXRoaW4gaXQgdG8NCj4gCSAqIGludGVsX3ZzZWNfYWRkX2F1eCgpDQo+IAkgKi8NCj4tCXJl
dHVybiBpbnRlbF92c2VjX2FkZF9hdXgocGRldiwgcGFyZW50LCBub19mcmVlX3B0cihpbnRlbF92
c2VjX2RldiksDQo+KwlyZXR1cm4gaW50ZWxfdnNlY19hZGRfYXV4KHBhcmVudCwgbm9fZnJlZV9w
dHIoaW50ZWxfdnNlY19kZXYpLA0KPiAJCQkJICBpbnRlbF92c2VjX25hbWUoaGVhZGVyLT5pZCkp
Ow0KPiB9DQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3ZzZWNf
dHBtaS5jDQo+Yi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC92c2VjX3RwbWkuYw0KPmluZGV4
IDk4ODQ2ZTg4ZDNkMC4uMjI5OGI2MzYxMDk0IDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2ludGVsL3ZzZWNfdHBtaS5jDQo+KysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50
ZWwvdnNlY190cG1pLmMNCj5AQCAtNjU1LDcgKzY1NSw3IEBAIHN0YXRpYyBpbnQgdHBtaV9jcmVh
dGVfZGV2aWNlKHN0cnVjdCBpbnRlbF90cG1pX2luZm8NCj4qdHBtaV9pbmZvLA0KPiAJICogZmVh
dHVyZV92c2VjX2RldiBhbmQgcmVzIG1lbW9yeSBhcmUgYWxzbyBmcmVlZCBhcyBwYXJ0IG9mDQo+
IAkgKiBkZXZpY2UgZGVsZXRpb24uDQo+IAkgKi8NCj4tCXJldHVybiBpbnRlbF92c2VjX2FkZF9h
dXgodnNlY19kZXYtPnBjaWRldiwgJnZzZWNfZGV2LT5hdXhkZXYuZGV2LA0KPisJcmV0dXJuIGlu
dGVsX3ZzZWNfYWRkX2F1eCgmdnNlY19kZXYtPmF1eGRldi5kZXYsDQo+IAkJCQkgIGZlYXR1cmVf
dnNlY19kZXYsIGZlYXR1cmVfaWRfbmFtZSk7DQo+IH0NCj4NCj5kaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9pbnRlbF92c2VjLmggYi9pbmNsdWRlL2xpbnV4L2ludGVsX3ZzZWMuaA0KPmluZGV4
IGQ1NTExNzRiMDA0OS4uNDlhNzQ2ZWMwMTI4IDEwMDY0NA0KPi0tLSBhL2luY2x1ZGUvbGludXgv
aW50ZWxfdnNlYy5oDQo+KysrIGIvaW5jbHVkZS9saW51eC9pbnRlbF92c2VjLmgNCj5AQCAtMTg0
LDcgKzE4NCw3IEBAIHN0cnVjdCBwbXRfZmVhdHVyZV9ncm91cCB7DQo+IAlzdHJ1Y3QgdGVsZW1l
dHJ5X3JlZ2lvbglyZWdpb25zW107DQo+IH07DQo+DQo+LWludCBpbnRlbF92c2VjX2FkZF9hdXgo
c3RydWN0IHBjaV9kZXYgKnBkZXYsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCwNCj4raW50IGludGVs
X3ZzZWNfYWRkX2F1eChzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsDQo+IAkJICAgICAgIHN0cnVjdCBp
bnRlbF92c2VjX2RldmljZSAqaW50ZWxfdnNlY19kZXYsDQo+IAkJICAgICAgIGNvbnN0IGNoYXIg
Km5hbWUpOw0KPg0KPi0tDQo+Mi40My4wDQoNCg==
