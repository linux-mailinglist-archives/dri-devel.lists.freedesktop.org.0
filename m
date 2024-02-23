Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00129860BDD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 09:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EBE10EB1A;
	Fri, 23 Feb 2024 08:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S79PeJTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0AA10EB1A;
 Fri, 23 Feb 2024 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708675846; x=1740211846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4oQOkLSDKc/OOlTYHwm9cuScqvY5gsOC7wjhOfWcTK4=;
 b=S79PeJTh/CzFVmUMYVTTJIWhmL48GritPMoDGnk58axxZZwuBAuyPLql
 ddS9RDiXl4r+PcPBxeGCBHuvOBrjbwcEUR6X+w1QQtNjGwge0cIm52yTL
 9zTw4d9AOpsWUrA13Vg0gjHSw8gUrUkQP3FuJVmN53UR0bYDu/UlTETUH
 m1yZ/FmHqgNqlrTrIaugVoEpr3f+C0zJ8+uvEiKUUW0tlQHF1Kpxw4WqI
 C7LewpfZc2HmmK3F09z54360u+mEUGg7d8pI80+OiOX3BOSCUAemLo1Po
 Dj/h6OEEhfwDoYF3XcvGcoKrxHHaWGxrUnCR7fU8Lhvqt3zaTdk5gv96i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2860606"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2860606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10528236"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 00:10:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 00:10:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 00:10:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 00:10:43 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 00:10:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns59s3c/cbb59Hjkvv60E5EyUHqSLzelW/Z3sykJXfAUowuHTlNeYTQXoP5pnYyUKldYv/hCj5pmlytO1aVmDIN87bAyAFljsWnsumKHPjb/6cFndGjmeM39LUhpTuYdTOH2L+Ot7CAPIXc5I6tB309+ah8N8w32vIWnwuNkP9MZKifE/1dAaw1U/lZGAMbI6mzxRjAzmZypNl+e3Skwezrz6SM9yikQF0YR5CCV7d4tnGi76BVWm/FIvNVMlWXROyK/UVc0w0aNHuEE0dYqtGyVY8M8M8iQa+0UP3RLYTekzQnz9wwIvsDVJkDlfJjguzcZeGmlSKXrrYrTRE/Nyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oQOkLSDKc/OOlTYHwm9cuScqvY5gsOC7wjhOfWcTK4=;
 b=i/CwIInUf4+TM4siy54fuTlkTNWRtFhhLhZqgwCGzRCB/Zu0im/1iHlwoj6/Zv3Q7Y3rfPO/r8rAuQBV6c9x0siPuG6Q1OEaOhNYE6XHKIqFBa/lMUyRSjlaWfV1sXc1/wEkzdhSz0svnYAz+rEY1hAAb2ZHGycIBHBUNRjhbCfCdC/94geAD4qtac5uQx0bdc6pppv9Cib8J1L2cOAvoeynp1TIlMKvP+rT3adZsf0iu5IK7NpNfSxZTbp0pc+MPRANctVnBjwg+KYHcSykNygZ0tOJ6VNAOKLWjgeZ/4EJx6LKs7xH/Y+2T+LhzPj5JMJOzl56wQyhbgRymyqYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 08:10:38 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 08:10:38 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 11/21] drm/i915/dp: Add way to get active pipes with
 syncing commits
Thread-Topic: [PATCH v2 11/21] drm/i915/dp: Add way to get active pipes with
 syncing commits
Thread-Index: AQHaZEJ4QtYLP2hhK0ut4oVkMkaSFrEXlttQ
Date: Fri, 23 Feb 2024 08:10:38 +0000
Message-ID: <DM4PR11MB63608D401551872DB88A3240F4552@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-12-imre.deak@intel.com>
In-Reply-To: <20240220211841.448846-12-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH7PR11MB6031:EE_
x-ms-office365-filtering-correlation-id: 92928841-2faa-450b-e903-08dc3446eb79
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ppCy8W4+n/+ZlsADpCDSSJd4TqynbJUZfeNkYPg8DcIhkLR4FD2lFeVho/byac1HwteBdzwfF5nTX91M2gA7Z926q+cXpPz9g6vBA8uQClqhVs4zZ+nWD49F+bnauX22PPgNxCx0HWyX0HKn83yCQI4KLsL/gAJEIROn/HH3llkFMGzNCq8hC1h1icasB+/5AyIK/XoOni3VMSy2FUv6Obj4PW2YtFatrO8czuXEZKhg1mCavvD/zlHQLUZ2WU8Xd1CXPcdzQy6+MjRoFYb4t/kiQXfd5zAV4MArEraNZo6YyKkhCy0TqK7zB8HdzKnM0W4DyVHW6KGkRUklnubc+gXb4SNt07//FgGIMuU+NuHUO4SvCYpg3lq49qU7DTSwnGs+H/w0hsCgOKF2y/cCt+43FQTVlCBGA9bDQYWS9vp1/3AACQ11HXy/QK24L/Y8PLtBazZOOOsLfqu8y5xDmA2Zy3jB3Xtl1qrB7pRt/kzskDnuPDwiXG2X7b57KUc+z0JmG9in2VGdGJTrsPWau2QtLYIMbu55F3yFTcApv5Asnh8js1iCdMjbtmL+ZyA6BgR687EpPG4ph+52T7TcGXZoWx3ezwFywOe7stFi7xz7w77T/fUtR/a9J5A7nisj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1IwMHpBT2tkV2Roc2lHUkR3MzMvWjl6Sm9YYU1zV3RnNFEwR2h0MmxnanVG?=
 =?utf-8?B?YlkwNUhzdVVDdnJxOHdYMHE1ajZ5WWRYNGJNV2JQbkZ4SHVUT29wdUZEM3Bk?=
 =?utf-8?B?TW41MXlKU0wxR201YlhvWXNFdWpNM3RGeERLRklmOFVCbnd4TGRNNDZlUWg2?=
 =?utf-8?B?Si9LZHpCamZ4c3ZaNDZMM2R6N3VCZXpDUmplTkhTZHJuNFpSc3FoV0lvVCti?=
 =?utf-8?B?SFBqUXlMYlllTEVHOFRYM2paS3ptK1hIcUkvdGwrUzFGNldzSFQySjBCQWJD?=
 =?utf-8?B?ZVRUR0Z2dlpEaTFGQTFKQUJrZ2lycWlWTW1wOGdKSllieHFIS0FLMzNBaDVt?=
 =?utf-8?B?andBUW1Say8zaC9nMTZSYWxYYTJRck9ySzJiditwc1dQSmVRQ21nNXZ0NXhq?=
 =?utf-8?B?b0tHZ1FMdGZvUFhEL2svdmw1SHlIdXJmTkpkSkNPbUxuSnVoc3RtNVJaQlJZ?=
 =?utf-8?B?dVpYYi9CVzRQRjBDa3VZb3g1Lyt2QU9GWXhzVGVQZUVDRzhZLzRtQ2dKWHp2?=
 =?utf-8?B?cjR2UGdGOVk0M3NleU5xd0pVYlVEMGlkZ3l3ajc0SlNIRjhGZUtGNjhiaTZT?=
 =?utf-8?B?Sm5GUGp5TkRjbHBGU1lIbmZ5NjlFOG1BNUlGWi95RWdmQmJ0ZkpyUlRiaml4?=
 =?utf-8?B?RjN2aXgrY2VpeFNZV3lacUNWMTJ3RVQ2cStJTUFubnVhcnRqalh4K3VlMk9k?=
 =?utf-8?B?TkZkUitWQVF6ZUl5V2FFbWZkOVVGNTVRcXJOWUVzM3JyN3lBS3hhNk95MXpk?=
 =?utf-8?B?MDdvSnNUR0QyYmI3OXJwMjdKcmNNc1BwQm1id0hDQjVnWE55SW5FcGQwcWZy?=
 =?utf-8?B?bGpXVE11UTFmNzBmcUpZUnhvVkZrMlBCbEVyWktJd09CQy9Ea1BWYktMcFdr?=
 =?utf-8?B?VXpzMWQrclppSU95YTdhSVVPajFNRkFDSy9ZMk8xSzJUcmhVMndNQVk1NzNH?=
 =?utf-8?B?YVZtdGgvQ3ZkUW9RYXZjWlFOSVNmT3BLRlY4cTVKVm9jazlQWUZJWFJIZk9S?=
 =?utf-8?B?OWt1NjJmQmc3Y1liWm5OUXIxWDA1VXBIZlJlcW5Bd0J6QTQxelpxMEZpajZZ?=
 =?utf-8?B?dXBkVGt0MEdiWjE5ZmZoaGdYcjR0Ym9TT2R0dmtwTE51d2RIekZEVSs4MTVL?=
 =?utf-8?B?R0lFbEZSaUVQVS82Q1V6YkNLMHNXL1hNL0k4WkJqSVdhSnFRdVFvWk8rZHI3?=
 =?utf-8?B?MXdoRHZ5eGJHMEhpRnV4bDJKYzdrdkdCNmc5ZmV6TXVjaUdqT2o4QXpBSERv?=
 =?utf-8?B?QmdjZFVKdkhjQW9qeXU0VVQ4ZXA3QzB3c09UUEw4Zy9kQUhGS0FIWUJtL1Nl?=
 =?utf-8?B?OEJzTXBVbDJ3VURHYmVacFo0ZTdSOWlzNm00dGkrOEpwVjN6a1B2MmkzRmE4?=
 =?utf-8?B?ZFBMOURpQzQvaXBxcVZDNW5zcGg2SGlRdnZ3bzBJakIyMDRwMlpTYUZMUDdo?=
 =?utf-8?B?ZGFrZFVFSm5DeXRaZ1F5bXFNMkVrdndKSGFiNGt6Rmg4U3h6cmFwT2s3SFcr?=
 =?utf-8?B?K3Y4bG1DZ1hOSGRCYjRtL1pGUFVtY0V0Y2VrNFpVdVBwTDlzNXNpRkl0ZHAr?=
 =?utf-8?B?OWFUQkRHOTJuMXVwOU9RKy9GTEJ3dDJRaXdXV1UxeEJlbUltaDgyYjQ0RE5t?=
 =?utf-8?B?M3N3Z01wZlg1Ny9PTENoT0N0c2xNcXhWamdITTZhQnNSNllKWEJsRGd1R3Fs?=
 =?utf-8?B?aEtuWDBsWXBCVjVvWTZ1OFlEY3BxeHNKUVBPTWlBMUF5VzV0eitidmk2LzN3?=
 =?utf-8?B?SGd6VkdudmlzRWIrdWQxd3lBQVdwT25MYmRiSGFJV3dpWmpjbzBUdXczUjg0?=
 =?utf-8?B?aThMV3o3K2M4YUI4eW1TVjg2VElxemtpdy9xNGhaNEFTUEdVZjlSV3NkTTFo?=
 =?utf-8?B?VnRTbzJoTVVtaUx2alhmcVNhdE9TN3RVeTNWSXlGdTB1NjVnSzJNUzY4bjlU?=
 =?utf-8?B?L0xxM0ZxYmpGV3hGdEZzTlR0cW5hNTEvbWJlV3Z3dE8xTnQwR3ZWZkg2amlG?=
 =?utf-8?B?MDc4QndaOXNBS0NkUEVndzdabDFEbmlRNWhIeG5ZMU50eFVxalZTSGg5VFdH?=
 =?utf-8?B?ZG8vQ3BUYTJNZ3BoVUVoK0dBM3F3OHJwaEx0WWpINmpzK3ZmVjg4bDZIc25o?=
 =?utf-8?Q?kXUkEah7trtgDyIYzjgWhdOks?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92928841-2faa-450b-e903-08dc3446eb79
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 08:10:38.2590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSIa/nK+61W74wRV1JgLMV6nj1986lz1ijTZesCWzr/TFPJuXwMfXTd6RQs8nI8BHUJxF5FJfwaZG5NrNuBWkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBJbXJlDQo+
IERlYWsNCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMSwgMjAyNCAyOjQ5IEFNDQo+IFRv
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTEvMjFdIGRybS9pOTE1L2RwOiBBZGQgd2F5
IHRvIGdldCBhY3RpdmUgcGlwZXMgd2l0aCBzeW5jaW5nDQo+IGNvbW1pdHMNCj4gDQo+IEFkZCBh
IHdheSB0byBnZXQgdGhlIGFjdGl2ZSBwaXBlcyB0aHJvdWdoIGEgZ2l2ZW4gRFAgcG9ydCBieSBz
eW5jaW5nIGFnYWluc3QgYQ0KPiByZWxhdGVkIHBlbmRpbmcgbm9uLWJsb2NraW5nIGNvbW1pdC4g
QXRtDQo+IGludGVsX2RwX2dldF9hY3RpdmVfcGlwZXMoKSB3aWxsIG9ubHkgdHJ5IHRvIHN5bmMg
YSBnaXZlbiBwaXBlIGFuZCBpZiB0aGF0IHdvdWxkDQo+IGJsb2NrIGlnbm9yZSB0aGUgcGlwZS4g
QSBmb2xsb3ctdXAgY2hhbmdlIGVuYWJsaW5nIHRoZSBEUCB0dW5uZWwgQlcgYWxsb2NhdGlvbg0K
PiBtb2RlIHdpbGwgbmVlZCB0byBlbnN1cmUgdGhhdCBhbGwgYWN0aXZlIHBpcGVzIGFyZSByZXR1
cm5lZC4NCj4gDQo+IFRoaXMgY2hhbmdlIHdpbGwgdXNlIGludGVsX2NydGNfc3RhdGU6OnVhcGku
Y29tbWl0IGluc3RlYWQgb2YgdGhlIGNvcnJlc3BvbmRpbmcNCj4gY29tbWl0IGluIHRoZSBjb25u
ZWN0b3Igc3RhdGUuIFRoaXMgc2hvdWxkbid0IG1ha2UgYSBkaWZmZXJlbmNlLCBzaW5jZSB0aGUg
dHdvDQo+IGNvbW1pdCBvYmplY3RzIG1hdGNoIGZvciBhbiBhY3RpdmUgcGlwZS4NCj4gDQo+IEEg
Zm9sbG93LXVwIHBhdGNoc2V0IHdpbGwgcmVtb3ZlIHN5bmNpbmcgZHVyaW5nIFRDIHBvcnQgcmVz
ZXQsIHdoaWNoIHNob3VsZCByZXNldA0KPiBhIHBvcnQvcGlwZSBldmVuIGlmIHN5bmNpbmcgYWdh
aW5zdCBhIGNvbW1pdCB3b3VsZCBibG9jay4NCj4gU3luY2luZyBPVE9IIGlzIG5vdCBuZWVkZWQg
dGhlcmUsIHNpbmNlIHRoZSBjb21taXQgdXNlZCBmb3IgdGhlIHJlc2V0IGltcGxpZXMgYQ0KPiBz
eW5jIGFscmVhZHkuIEZvciBub3cgYWRkIGEgVE9ETyBjb21tZW50IGZvciB0aGlzLg0KPiANCj4g
djI6DQo+IC0gQWRkIGEgc2VwYXJhdGUgZnVuY3Rpb24gdG8gdHJ5LXN5bmMgdGhlIHBpcGVzLiAo
VmlsbGUpDQoNCkxvb2tzIEdvb2QgdG8gbWUuDQpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVt
YS5zaGFua2FyQGludGVsLmNvbT4NCg0KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfY3J0Yy5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysNCj4gZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9jcnRjLmggfCAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmMgICB8ICA2ICsrLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3RjLmMgICB8ICA3ICsrKysrKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAz
NyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0Yy5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9jcnRjLmMNCj4gaW5kZXggMjU1OTNmNmFhZTdkZS4uMTdlZDJl
NjJjYzY2YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jcnRj
LmMNCj4gQEAgLTY1NCwzICs2NTQsMzAgQEAgdm9pZCBpbnRlbF9waXBlX3VwZGF0ZV9lbmQoc3Ry
dWN0IGludGVsX2F0b21pY19zdGF0ZQ0KPiAqc3RhdGUsDQo+ICBvdXQ6DQo+ICAJaW50ZWxfcHNy
X3VubG9jayhuZXdfY3J0Y19zdGF0ZSk7DQo+ICB9DQo+ICsNCj4gKy8qKg0KPiArICogaW50ZWxf
Y3J0Y190cnlfc3luY19waXBlcyAtIFRyeSBzeW5jaW5nIHBlbmRpbmcgY29tbWl0cyBvbiBhIHNl
dCBvZg0KPiArcGlwZXMNCj4gKyAqIEBpOTE1OiBpOTE1IGRldmljZSBvYmplY3QNCj4gKyAqIEBw
aXBlX21hc2s6IE1hc2sgb2YgcGlwZXMgdG8gc3luYw0KPiArICoNCj4gKyAqIFRyeSB0byBzeW5j
IGEgcGVuZGluZyBub24tYmxvY2tpbmcgY29tbWl0IGZvciB0aGUgcHJvdmlkZWQgcGlwZXMgaW4N
Cj4gKyAqIEBwaXBlX21hc2suIFRoZSBjb21taXQgd29uJ3QgYmUgc3luY2VkIGlmIHRoaXMgd291
bGQgYmxvY2suDQo+ICsgKg0KPiArICogUmV0dXJuIGEgbWFzayBvZiB0aGUgcGlwZXMgdGhhdCBn
b3Qgc3luY2VkIG9yIGRpZG4ndCBuZWVkIHN5bmNpbmcuDQo+ICsgKi8NCj4gK3UzMiBpbnRlbF9j
cnRjX3RyeV9zeW5jX3BpcGVzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LCB1MzINCj4g
K3BpcGVfbWFzaykgew0KPiArCXN0cnVjdCBpbnRlbF9jcnRjICpjcnRjOw0KPiArCXUzMiBzeW5j
ZWQgPSAwOw0KPiArDQo+ICsJZm9yX2VhY2hfaW50ZWxfY3J0Y19pbl9waXBlX21hc2soJmk5MTUt
PmRybSwgY3J0YywgcGlwZV9tYXNrKSB7DQo+ICsJCWNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlID0NCj4gKwkJCXRvX2ludGVsX2NydGNfc3RhdGUoY3J0Yy0+YmFzZS5z
dGF0ZSk7DQo+ICsNCj4gKwkJaWYgKCFjcnRjX3N0YXRlLT51YXBpLmNvbW1pdCB8fA0KPiArCQkg
ICAgdHJ5X3dhaXRfZm9yX2NvbXBsZXRpb24oJmNydGNfc3RhdGUtPnVhcGkuY29tbWl0LQ0KPiA+
aHdfZG9uZSkpDQo+ICsJCQlzeW5jZWQgfD0gQklUKGNydGMtPnBpcGUpOw0KPiArCX0NCj4gKw0K
PiArCXJldHVybiBzeW5jZWQ7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2NydGMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfY3J0Yy5oDQo+IGluZGV4IDIyZDc5OTNkMWYwYmEuLjcxYTViOTMxNjZkYTcgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0Yy5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0Yy5oDQo+IEBAIC00
Nyw1ICs0Nyw2IEBAIHN0cnVjdCBpbnRlbF9jcnRjICppbnRlbF9jcnRjX2Zvcl9waXBlKHN0cnVj
dA0KPiBkcm1faTkxNV9wcml2YXRlICppOTE1LCAgdm9pZCBpbnRlbF93YWl0X2Zvcl92Ymxhbmtf
aWZfYWN0aXZlKHN0cnVjdA0KPiBkcm1faTkxNV9wcml2YXRlICppOTE1LA0KPiAgCQkJCSAgICAg
ZW51bSBwaXBlIHBpcGUpOw0KPiAgdm9pZCBpbnRlbF9jcnRjX3dhaXRfZm9yX25leHRfdmJsYW5r
KHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjKTsNCj4gK3UzMiBpbnRlbF9jcnRjX3RyeV9zeW5jX3Bp
cGVzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LCB1MzINCj4gK3BpcGVfbWFzayk7DQo+
IA0KPiAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMN
Cj4gaW5kZXggZDllNzU5MjJmZjhmNS4uZDA0NTJkM2U1MzRhNyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiBAQCAtNTA0OCwxMCArNTA0OCw2IEBAIGlu
dCBpbnRlbF9kcF9nZXRfYWN0aXZlX3BpcGVzKHN0cnVjdCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAs
DQo+ICAJCWlmICghY3J0Y19zdGF0ZS0+aHcuYWN0aXZlKQ0KPiAgCQkJY29udGludWU7DQo+IA0K
PiAtCQlpZiAoY29ubl9zdGF0ZS0+Y29tbWl0ICYmDQo+IC0JCSAgICAhdHJ5X3dhaXRfZm9yX2Nv
bXBsZXRpb24oJmNvbm5fc3RhdGUtPmNvbW1pdC0+aHdfZG9uZSkpDQo+IC0JCQljb250aW51ZTsN
Cj4gLQ0KPiAgCQkqcGlwZV9tYXNrIHw9IEJJVChjcnRjLT5waXBlKTsNCj4gIAl9DQo+ICAJZHJt
X2Nvbm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZjb25uX2l0ZXIpOw0KPiBAQCAtNTA5MSw2ICs1MDg3
LDggQEAgaW50IGludGVsX2RwX3JldHJhaW5fbGluayhzdHJ1Y3QgaW50ZWxfZW5jb2Rlcg0KPiAq
ZW5jb2RlciwNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4gKwlwaXBlX21h
c2sgJj0gaW50ZWxfY3J0Y190cnlfc3luY19waXBlcyhkZXZfcHJpdiwgcGlwZV9tYXNrKTsNCj4g
Kw0KPiAgCWlmIChwaXBlX21hc2sgPT0gMCkNCj4gIAkJcmV0dXJuIDA7DQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF90Yy5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF90Yy5jDQo+IGluZGV4IDZiMzc0ZDQ4MWNkOWUu
LjE0ZDE3OTAzYTgxZjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfdGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3RjLmMNCj4gQEAgLTcsNiArNyw3IEBADQo+ICAjaW5jbHVkZSAiaTkxNV9yZWcuaCINCj4gICNp
bmNsdWRlICJpbnRlbF9hdG9taWMuaCINCj4gICNpbmNsdWRlICJpbnRlbF9jeDBfcGh5X3JlZ3Mu
aCINCj4gKyNpbmNsdWRlICJpbnRlbF9jcnRjLmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfZGRpLmgi
DQo+ICAjaW5jbHVkZSAiaW50ZWxfZGUuaCINCj4gICNpbmNsdWRlICJpbnRlbF9kaXNwbGF5Lmgi
DQo+IEBAIC0xNjYzLDYgKzE2NjQsMTIgQEAgc3RhdGljIGludCByZXNldF9saW5rX2NvbW1pdChz
dHJ1Y3QgaW50ZWxfdGNfcG9ydCAqdGMsDQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsN
Cj4gDQo+ICsJLyoNCj4gKwkgKiBUT0RPOiByZW1vdmUgdGhlIGZvbGxvd2luZywgc2luY2UgYW4g
b3V0cHV0IG11c3QgYmUgcmVzZXQNCj4gKwkgKiBldmVuIGlmIHdlIGhhZCB0byB3YWl0IGZvciBh
IG5vbi1ibG9ja2luZyBjb21taXQgb24gYSBwaXBlLg0KPiArCSAqLw0KPiArCXBpcGVfbWFzayAm
PSBpbnRlbF9jcnRjX3RyeV9zeW5jX3BpcGVzKGk5MTUsIHBpcGVfbWFzayk7DQo+ICsNCj4gIAlp
ZiAoIXBpcGVfbWFzaykNCj4gIAkJcmV0dXJuIDA7DQo+IA0KPiAtLQ0KPiAyLjM5LjINCg0K
