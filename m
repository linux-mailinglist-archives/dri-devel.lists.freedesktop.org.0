Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3E8A38F1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 01:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119A310F961;
	Fri, 12 Apr 2024 23:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVDt0U/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1537310F961
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 23:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712965103; x=1744501103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OriAbCe4ATeXcYmAsWp0gV5rJUHdbFX7eQOgNaOtG6c=;
 b=QVDt0U/sn4xnn3h36+tMObIk2/Z2cKnrEnd90HERf5hEL3StnlT3Ofnf
 5pkmOEoiOCYBqoxW6CMghbd5mvHheN8PGs95WaJBjSq4999jPm7z6JIYe
 mUla2qR2gSr4qfnfinYI9QtYEx2BC1i5pQRWcoKmnffL2TR+xNFNJvyJK
 kuM7JhfYpD6LbPEDzb9Hf1XCLcnL7xo8Jpaty2RR94vfcUrlBxbiek4ao
 AWA9eMzN/u9b7q0T1af8w2UPgqj7PRiXchXbn6YQKSqiIXrST09nEqS8b
 gowwZHz+ckNjI9lF/WVKPCGav79FS5sg1S9UniEzKWJ+iCuzSvdDPkR5f w==;
X-CSE-ConnectionGUID: 0zcdewOtSxWXFyvOb8unQA==
X-CSE-MsgGUID: R62psUGNRZCHudqxstx6nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8299594"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8299594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 16:38:22 -0700
X-CSE-ConnectionGUID: tYd+5dCCQb65ieswxHMhpA==
X-CSE-MsgGUID: p8uEVMDCS4yvFkKHH7n/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21863516"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 16:38:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 16:38:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 16:38:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 16:38:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e99nmV5cLqSzrI+hpYPuGBc6MjanM7SqXy4RDgdIQ+81pSmy2nbRJ/WELJUkoQlUa8fY23qp7x5ppHuaYDUzS2AryZKpdG/9LKN5rIPSZKNsogoAF8MDAOqt9XnF8mMenuOjBWQkGyPbSP6zAZ0E7rAaPGEB7rStMVsoVklU/MG6sCCHMiwFfnnvEJJABTM2pCKtXATHXAwlGLRdFHoOV545BNEPORBYCURqVJ8ao0namKzppNeV6aX9Rl+7aWGHiXweXjawSsZTf7l1XYccLLWe2jgGoq1wpZrn40j3pqC0LafCn5wX9T375l5InaCGlX8x1RmSMS9tLyWBlVWlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OriAbCe4ATeXcYmAsWp0gV5rJUHdbFX7eQOgNaOtG6c=;
 b=cpJHTaMHRI4HHqKBjua8tOG0eeP2VUrr86fLuG69MCeGFXr1Vn+SUjTYGMBKtEA9Beg37ZXW/EgYbxXMspo+uQOOApoXe3l2DNCRckiACuSej9iP8Dz0Pc4QZ8D+A/6Es9h2J1kXwlA+7vpguC8w7aGECqToWJDmGRovhnQKClEQTGFF/pc1etXSPt2My3Yi8B3KLRSzSdo9GoemvS4xCvcfkYEpiajm04dllXbm817VIHsu04SdQCCNpzA3Hgp+qUU3p0QBOVdtrJZGG+0nV8Rv6U+WOdNmTnueQeuUkDzOy6JzVeN2lFqwFkpC+z5uJLUPRwb9Qo34AWpyHmxmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 23:38:18 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 23:38:18 +0000
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
To: Julien Panis <jpanis@baylibre.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Ratheesh Kannoth <rkannoth@marvell.com>, "Naveen
 Mamindlapalli" <naveenm@marvell.com>
CC: "danishanwar@ti.com" <danishanwar@ti.com>, "yuehaibing@huawei.com"
 <yuehaibing@huawei.com>, "rogerq@kernel.org" <rogerq@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH net-next v8 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Thread-Topic: [PATCH net-next v8 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Thread-Index: AQHaiZiIenQxrX7+WkO6DRR+IXQDkbFgnpYAgAQSDwCAAKENMA==
Date: Fri, 12 Apr 2024 23:38:18 +0000
Message-ID: <CO1PR11MB50890344C93FD1007DB04EDFD6042@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <e60c4a55-09bb-4bd7-a22c-9ab38bea174c@intel.com>
 <568a7740-ff47-49f0-978d-14cfe14f2b80@baylibre.com>
In-Reply-To: <568a7740-ff47-49f0-978d-14cfe14f2b80@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5089:EE_|DS0PR11MB7580:EE_
x-ms-office365-filtering-correlation-id: 6498396f-31b8-4d58-296b-08dc5b49a1dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6eVTxH/Q8gCeIZG86o7r2vYqkbmv/Qzoa+m9eI4X8MGrqYXPHvKaZi+yGdmjTfuqTo2fz+GIgG3SLEAsHXzMpQeRnVw3LaFAgsihKQimCfnNI9qZdlc82DI+T2u5ozh8chq8uv/ePd+DVOjIpjyG+JEg5EN+a0tAW3mY3GQzD2isbAjCX8VX0/v0ALft2NFWT00XEZ10a1GKCMfCQlTfdJLcZamhIlF4A0Q7rOq07iI4ha04dxVHRXT0aO9/yihCdm7mVwjLiycrV3YtKQsp2F2Puq1ABJiZMGRxS+1faxoik0XRPX0B2eKXvSWKmANQUA1orzzcDey73g4FONSHRdznlJBoN57gaqO0IqpxIzPCE1xlChUQXRc/aPGhjYDfgm9u2jSRXHhoWBoQFiMF5ZqlB5t66PcFI27gIPSIfxyT5/kmkuWJ1WehGb15eQDAVbCqtOTnhqzxuQCQpAeSTEkoye//EqnE0+Te2VzDWIAuQG3QUn+IueOYI3DBBQS4aaxI+XQwR4BWM3NtNXCXQMy269TwXEbnuF3ssZ8jf2btAvH19vjoQ8QvfGPso/G5eqpioQwJIzRQic+yB47SLsFx0uVHNKUIAfo2ofOOmYNF2lyziRaYsEox/vVYvMo58j1DPvig/fXjQHitj9bZFxdLwrIPeEfr/oiq8EnJBOZE30bSvPYFPY+rfUdxW5qXIV/eUuJCD/FTi4q4d1TYVpikQj1eYbo00/9m4GGuz7g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWM3cnBJU2tTNld1ckdRTE9uVGVjazhBZHlIbUgxVk5KY0hENEJ5dVFCbG5H?=
 =?utf-8?B?SGdIenFUZUV4RVRqeUxLTWZMNWg4c0xpM3hEZGEraVVwbUVyaTBDRXN6Rjlz?=
 =?utf-8?B?cXpmek1qMGJxVEYwMUFzVitLT0xJYzNHbXpJeU9JVXRnVXJVMWJIN2dUYjQ3?=
 =?utf-8?B?R0w2a2hpU3huY25NM0hpU0p1ZzZUSmZ6dnd4TUNZdlNkWmtwV2hhNUhOYWFp?=
 =?utf-8?B?TmpTWnlvUEc3YXplTU83TlhBMEp1Nk53ckc5OVhlTmVnRGtxaFM1WkFKUmMv?=
 =?utf-8?B?VG1Hdkd0NHdhUjFsUEpTdXc4Rk9FbjRMNDBFSGJ5SmEyMTFNUU0rZy9GZWhO?=
 =?utf-8?B?dCtsR2FXQnp4WlV4djczWGdwZzREcEFaVk96cHVwNVVFZ09CMXR1cS9RSnF5?=
 =?utf-8?B?QnRvb1lwTFpOTW9RTkZ4QkJ2U2tnWERJTUd6c3RPaEo3VnlYU2FVQnp1U3hm?=
 =?utf-8?B?VzlTTTAzRFc2ZHEwUFhTcTZpYnozMDRuSWFsTm1rLzlsK1FJdW4xeUZ0eWNO?=
 =?utf-8?B?Kzhib2NMOXhJV2JzSHN3TzdSZjcxRlpZRW1OQ3RZQjRUVWZ5R2tkY1hGTW1v?=
 =?utf-8?B?WXA0ODMyczZCNGczc1huSE9RRlNPa2lUbWFwTkFvblJNOGhlL3J3VnpwV3R3?=
 =?utf-8?B?T3NrTXlyZC9PTllZdnBUVnRsNHk0czlZdkJ2RzNuaTF6ZXFCbE9hWFUzUFc2?=
 =?utf-8?B?NHZmNGNyQ2lRaXVWL2NvOW1kSG84N2pQcFl0RC9sMHZLYzc2MnNWMEFCaVdy?=
 =?utf-8?B?YU45WUlVTDNUZ3YwRHZLWmtDRW4zR05yQkd4ckc3LzNaRHNIdWdtaWc5MG1R?=
 =?utf-8?B?bVp2d2hKazgrdnU5TnpvSjZzak1KUm1CMUJZRmlML2krUmFORW9lY1VVaFZM?=
 =?utf-8?B?c2FCY0J6a0t4V3dJR0Fvb1pHU2Y4VkZ4UjJyTmVXd0xIMGFaRG5HNm1FZTI2?=
 =?utf-8?B?Q3ZaR210MDdEZ28rOXY0VTJQYmZMQzdvUVp0VzFrTTF1N3V2aFJBcTFMUzZp?=
 =?utf-8?B?MmxQMWFKbUtOdUY2SGFpZDhFSFV6NGM1cW9GbTZ0MjVRVGlGOXpLL0FJREl4?=
 =?utf-8?B?YmEzWHZUUExvc2JIMEJQVUQxcUY2REhvUGc5bjdBMityWVJyQWJ2VjNxZzR3?=
 =?utf-8?B?UlUxSDE4cW5OTHlQakJDUGh5ckxvRjRzUFdZTUlCYy9YejZVRnk3dENPQXRa?=
 =?utf-8?B?aHV3U1V2YXRPN1RUVlBHMUt3TGtzcUJqbmt2cjRXaDl1MEJKMTF3cnlQMlV5?=
 =?utf-8?B?R3NweGlkanpSNnQ2dWh4cjhZS1NqYWNRVUR4MmU0bHJKWEEzZW00dXd2cDZV?=
 =?utf-8?B?ak11Q0ZwVzNZRTlVd3JqN3RCRDljNDdsbndraVBsamJsTk80WUMwRVBnQ1Nl?=
 =?utf-8?B?T1J1L0RjdnVIOWdjeFV5UXNFTGc1anc2dHFLN1NhZzZNK21nWEFwR21uREhF?=
 =?utf-8?B?d09CZWtQS25JQ0t5RlJhUEhvcUJJU0Yrd0d2M3p4enBTM3pzckRaUWErVWlR?=
 =?utf-8?B?aE1TSGRaaUl2OTJQOThlelJTVldiN1Z5OTRHTTJzWkpadndkOFRIc0VPWUpp?=
 =?utf-8?B?NlVOUVA5VmpuY1VTRGNYNXd5U0V1MStSdVdtaU1LMy8xM3ZEc1Q3QU9yZGQz?=
 =?utf-8?B?WDd4UnJUMzdZWVRGQzhYQlA0NmlRZXM5YjFKdUVLWk51L0dEK0U2WXV6ZUNB?=
 =?utf-8?B?L2MyVW10V0ZWayt4eWZpNmtGS1NJRW1DQXAyaWJFbzRzL002cVUwc0xzNXBX?=
 =?utf-8?B?eWpUeEpVWHBlclpwQ2NmZzFhUm9QbnRrd2VXTFp2bjRUSE9sWmY3amJScm5k?=
 =?utf-8?B?SFJWZmN2V1JodlZIZm0rS3JXMmUrZjk0YW5GcWdaOWJzU01kNm5HMXhFRE16?=
 =?utf-8?B?MnFaZURjUnZQREozSlNXOGRJVzN6aUpJdXQ0M3JZWEpPQmU1Z2V4ZGo2TS80?=
 =?utf-8?B?N1hQZ0F3a3FYS2t6V1Y4c2NoUVRmNEo2akZGVEJud3p3NlB3TG1JdDRtTGt5?=
 =?utf-8?B?ZkZxZmNweXltUHp1eldnZDN6TVArZ01RYmxYYUE0aytsbVFUN0JtTzdxVHhi?=
 =?utf-8?B?c1Z0eE5Gc0l5R0s0NXoyeXBvZ3hiMS9TaUhPR3U5dXNyNmNEa2VKbXZJaGVm?=
 =?utf-8?Q?Hu+g6v5rQ69UCjCWlaK8/9gUO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6498396f-31b8-4d58-296b-08dc5b49a1dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 23:38:18.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MklKBYCVDlzoLv+KN3euSl3Qxo7cBvWiChmig0tOvN4w7qneZKy9kg/wy0Utj3qxcovW/J3Ww4TGY4L2okX5BTHZrAO5IJEfHBaR4Rah4vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIFBhbmlzIDxq
cGFuaXNAYmF5bGlicmUuY29tPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDEyLCAyMDI0IDc6MDIg
QU0NCj4gVG86IEtlbGxlciwgSmFjb2IgRSA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPjsgRGF2
aWQgUy4gTWlsbGVyDQo+IDxkYXZlbUBkYXZlbWxvZnQubmV0PjsgRXJpYyBEdW1hemV0IDxlZHVt
YXpldEBnb29nbGUuY29tPjsgSmFrdWIgS2ljaW5za2kNCj4gPGt1YmFAa2VybmVsLm9yZz47IFBh
b2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT47IFJ1c3NlbGwgS2luZw0KPiA8bGludXhAYXJt
bGludXgub3JnLnVrPjsgQWxleGVpIFN0YXJvdm9pdG92IDxhc3RAa2VybmVsLm9yZz47IERhbmll
bCBCb3JrbWFubg0KPiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+OyBKZXNwZXIgRGFuZ2FhcmQgQnJv
dWVyIDxoYXdrQGtlcm5lbC5vcmc+OyBKb2huDQo+IEZhc3RhYmVuZCA8am9obi5mYXN0YWJlbmRA
Z21haWwuY29tPjsgU3VtaXQgU2Vtd2FsDQo+IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz47IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IFNpbW9uDQo+IEhvcm1h
biA8aG9ybXNAa2VybmVsLm9yZz47IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD47IFJhdGhl
ZXNoDQo+IEthbm5vdGggPHJrYW5ub3RoQG1hcnZlbGwuY29tPjsgTmF2ZWVuIE1hbWluZGxhcGFs
bGkNCj4gPG5hdmVlbm1AbWFydmVsbC5jb20+DQo+IENjOiBkYW5pc2hhbndhckB0aS5jb207IHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbTsgcm9nZXJxQGtlcm5lbC5vcmc7DQo+IG5ldGRldkB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGJwZkB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LQ0KPiBtZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGxpbmFyby1tbS0NCj4gc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCBuZXQtbmV4dCB2OCAwLzNdIEFkZCBtaW5pbWFsIFhEUCBzdXBwb3J0IHRv
IFRJIEFNNjUgQ1BTVw0KPiBFdGhlcm5ldCBkcml2ZXINCj4gDQo+IE9uIDQvMTAvMjQgMDE6NTEs
IEphY29iIEtlbGxlciB3cm90ZToNCj4gPg0KPiA+IE9uIDQvOC8yMDI0IDI6MzggQU0sIEp1bGll
biBQYW5pcyB3cm90ZToNCj4gPj4gVGhpcyBwYXRjaCBhZGRzIFhEUCBzdXBwb3J0IHRvIFRJIEFN
NjUgQ1BTVyBFdGhlcm5ldCBkcml2ZXIuDQo+ID4+DQo+ID4+IFRoZSBmb2xsb3dpbmcgZmVhdHVy
ZXMgYXJlIGltcGxlbWVudGVkOiBORVRERVZfWERQX0FDVF9CQVNJQywNCj4gPj4gTkVUREVWX1hE
UF9BQ1RfUkVESVJFQ1QsIGFuZCBORVRERVZfWERQX0FDVF9ORE9fWE1JVC4NCj4gPj4NCj4gPj4g
WmVyby1jb3B5IGFuZCBub24tbGluZWFyIFhEUCBidWZmZXIgc3VwcG9ydHMgYXJlIE5PVCBpbXBs
ZW1lbnRlZC4NCj4gPj4NCj4gPj4gQmVzaWRlcywgdGhlIHBhZ2UgcG9vbCBtZW1vcnkgbW9kZWwg
aXMgdXNlZCB0byBnZXQgYmV0dGVyIHBlcmZvcm1hbmNlLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gUGFuaXMgPGpwYW5pc0BiYXlsaWJyZS5jb20+DQo+ID4+IC0tLQ0KPiA+IFJl
dmlld2VkLWJ5OiBKYWNvYiBLZWxsZXIgPGphY29iLmUua2VsbGVyQGludGVsLmNvbT4NCj4gDQo+
IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgSmFjb2IuDQo+IEknbGwgYWRkIHlvdXIgJ1Jldmll
d2VkLWJ5JyB0YWcgZm9yIFBBVENIIDEvMyBpbiBuZXh0IHZlcnNpb24uIFVuZm9ydHVuYXRlbHks
DQo+IEkgd2lsbCBub3QgZm9yIFBBVENIIDIvMyBhbmQgMy8zIGJlY2F1c2UgdGhlcmUgd2lsbCBi
ZSB0b28gbWFueSBjaGFuZ2VzLA0KPiBmb2xsb3dpbmcgSmFrdWIncyBjb21tZW50cy4NCg0KU291
bmRzIGdvb2QuIEZlZWwgZnJlZSB0byBDQyBtZSBvbiB0aGUgbmV4dCB2ZXJzaW9uIHRvbyBhbmQg
SSBjYW4gcmV2aWV3IHRoZSBuZXcgY2hhbmdlcyDwn5iKDQo=
