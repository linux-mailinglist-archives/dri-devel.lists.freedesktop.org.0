Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C749CAC61F2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 08:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DEF10E587;
	Wed, 28 May 2025 06:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haUrgMvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8D10E587;
 Wed, 28 May 2025 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748413830; x=1779949830;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qh+5qQGUmyneG+YSval5fXafrkuvaEbUjgSKC+6cbw8=;
 b=haUrgMvqsQhn9UPa6P4v2ooGcKk1N6aCZsrXCnOdgZZA3cY5F13LcxHc
 Y2QQWVFrdbQpUda34VwH1unLZKU77oV6FGxW6BkzmiMBeT9VA/G4/8E8s
 z7TwXhio09/qNM32iE8nmG0vylwwEYNOGLJUDVfIoDHj9ijI/dOBFlnem
 L44EHkhjDnPF4DJwO47r5UbelZucLrpc/BPtW5UZ7X02Em0DaPJEaA7NK
 FrKuROn1aYMJRXl2LE4WvHn0A068Uk0rY213woimidgd5BEf9+ZDq4m3+
 bsW6ExOcic2YgXF1H9uZ8+QVL7Fxjybev70K8bqFqM1QzMgbXLuF7boU5 w==;
X-CSE-ConnectionGUID: 6OH20Ku6RfaqwKLYiuNeqA==
X-CSE-MsgGUID: yeDvKOa7SFG3gqKGETpYuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61479514"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="61479514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 23:30:30 -0700
X-CSE-ConnectionGUID: JTq1tkPDSEerGcSAkAAYoQ==
X-CSE-MsgGUID: aQ/GtKGLQQKhl6dNz9qovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143060980"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 23:30:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 23:30:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 23:30:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 23:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEGBZaGqSGuVFkkvZGp/HJIsbHHvxERdmNUYk0DfwZFLXmOfPIiuDp3443UHhhPkL19TiM1vUFmpc1oLPMCU5YRGwy6FwRFB2u/AeoqQ2MU0rJ0NFIRMIBRHA+mgkHnGBiZrvi7Zbb9L5ykz2PpIY7X+ukem8m+EmxjKrCkeoei5FGg5PuP3ozhU0SwwE4pbyfkUfbwIqSNfXC69uAV6b6wI1h0qWCIp+43i6O7vzcCHdFc4YLokSOSnjK6wcfVhc3/MsRcV/qIsgZiqXNpgKwwlvnIqZXjP3RZM8HUMCrJWsMDCk6yMoK6ciXDjIE1uQ5UA6icrBLQak+FoGbQZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qh+5qQGUmyneG+YSval5fXafrkuvaEbUjgSKC+6cbw8=;
 b=A4nw1NnAmPmPW/wmz7H+yxKsU9E1XOc0I9j38Vt2R2Q4NqIsz+mLeDvd4HqaVv6pXdghcs73SPR+qxP2Q1wg/zmsd9icXIMQfru1AO+FsDhqjxf8W9LQaFkHl7u8Q6EBk9/8NETM+hzK203bXM0wpi4hjtCAYuBCx4q5j1vf55DGTvID5JRn1hjc1hHvnc5mZb4CmqBV/geacyWwCDSG4zXS//+gjgchRdgYkI/hmxaXDLxzn3FfBQzggxHADvpv0IV14dmLBB8y+geqswhaOON5lk4sEb+bWLGaU1RMM1Ak5omYX0nxScrv+VMaYiz211inrelihsb9GbxUZGFxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH3PPF10E309DEE.namprd11.prod.outlook.com (2603:10b6:518:1::d08) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 06:30:12 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 06:30:12 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Topic: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Index: AQHbxaAaBNngr+ItyEmq2P6oEpoBdrPhoi0AgARsrvCAANKXgIAAxyUg
Date: Wed, 28 May 2025 06:30:11 +0000
Message-ID: <CY5PR11MB6366553CD5F8AFF3AC928F75ED67A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
 <aDGfgubuFfa3e0K_@black.fi.intel.com>
 <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <aDYGUzSWLdeyzpQ_@black.fi.intel.com>
In-Reply-To: <aDYGUzSWLdeyzpQ_@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH3PPF10E309DEE:EE_
x-ms-office365-filtering-correlation-id: aa55e935-2190-4e7a-3a8a-08dd9db1198d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SjNmREJuckc4YXljVGsxRFhqMUpnY3ZCTkZZK2JaejVCNGtFd21uMHVRcGFG?=
 =?utf-8?B?MkpjUW9GalhGWC9tVkdFUkQ1VEt1Z2xQZ1FvS0NFUGYvRjVKYzZ1NGNCNGFq?=
 =?utf-8?B?bXpsWVlEWGJCRytrRjN5MlFuZ2xHVUFsN0orbnlmRjAxU1NJN0FnWDhQUkNP?=
 =?utf-8?B?cXJMdXBMdjROVkhKYjliYTY1QlBQcVpYaXRDdEx0R202TkVJTnBOTnFqaCto?=
 =?utf-8?B?STNhNnhvV0lvenpiWFhMREZteDJ0TGRObzUwU2NKRzZzckVBakoyZ0VmYXVV?=
 =?utf-8?B?aXc5d2h6ekdRU2VYYTZadUltV2FWcGxYeHh1T1FmZ3QyWlA1ZTBXaHovdGdk?=
 =?utf-8?B?VDUzQ2FZVGU3ekZDbFdveks5eHBjcGFMby9zR3pQeTFKYW4xOEJBbDJoRXBP?=
 =?utf-8?B?M2VsWEZEaXFLUVFxRWNDQXVXanNnaVhJbzVmWUd4Tkkxd2ZaOUVMUzQ0bW9P?=
 =?utf-8?B?alZ4ZWxQZVR4UEc5VjFmVkZ4Mk1yQU50UmdHWGlSN3lFcE5rY1ZzNERkZjZK?=
 =?utf-8?B?V3U0b2xyeDhJZkFPcTZWR3hvUG1xb0hPMHJETTR5djgySEV4MEQ3QXNSL3A4?=
 =?utf-8?B?NEdtRmVLeEw3aVo1SURZVG8zeS83QXRBOU82QVpUVjlIZWlpMXdZL2VPV0lh?=
 =?utf-8?B?UFFCc3dOZVRTSWFXR0hvaFdJMEdTcng4WnBYOGZOTXZjWDhXMDM5dW9rTDZT?=
 =?utf-8?B?cTNmZ29ZSE56c3lQdU16cUt1ZXdOOVRqeGdvR3ZGcU9uUFcvYmgyQ2pBYUpU?=
 =?utf-8?B?bFI0VXo1MDEvOFliV3pYSEhTdGtZZUdrTTBXYVh1REs0OE94UUNqaVdkdTlk?=
 =?utf-8?B?cnRQT3k5bitrWmw3MW81OFNOQmVLbXNNZzVNNklta01OZDZwSHE5SW5BUkJl?=
 =?utf-8?B?NjFYV0o0WlVwZGJZSUhqV3BMZXJqRXJTR3dHWWQwT1YrNGtmS012Vnh5M2lq?=
 =?utf-8?B?UXdGRmpVZHByaVN0Slpac3h1NS83WTdIcm1OU3FycjVQMXdtbC8zUkY2ZEJZ?=
 =?utf-8?B?RHFZN25pZlRPODlNanVMYTh4aW8wMmZreHlRdGVzK3B4OERQMW5yUkZGTGxX?=
 =?utf-8?B?WUFNVjBLR3BuWnFFc0g2Z3BRRWtreS9jQkFaNUV4VytaaU11dUlWck93SHhL?=
 =?utf-8?B?MDJiQzVheEhRbEdBM2NZaktQdVBLYXhPOTIzVHRWQUNhL250L2duWFh0TTlN?=
 =?utf-8?B?dHNZdXNEUng0TTFJU2NzT3RQR2V6ZUNldFBjZXdOemhLOXpURWVkV3FRcVJ4?=
 =?utf-8?B?L0tvdWxESW9QWmlWNnU3MnpkRTdQbFVNUmd0Y3pTMEpHbTRqRStvdHNDUVFp?=
 =?utf-8?B?YjArcFVLQUhtTHdMZ3BQd1JJTzlSOWh5VGVkVmlreWtLbWhsOC9tOGFuaVpE?=
 =?utf-8?B?V0dXU2ZjVlRJMjNQWXFhSGhqUDcyM2JGdG9hZjEvbEF5eGZtM2V5RGxBWmxx?=
 =?utf-8?B?L3BFbjBmNVUvR0FLSjE1ZUpNUWI4TVArZXg5RXZheDBwajd5TGlhdWI0OU9C?=
 =?utf-8?B?UTdkYm0wSlJZaU9wdG9FWXJmT1J1YzIvbERCV281dG5Cb3pIc0doRUdMR0pY?=
 =?utf-8?B?RGtBb0J1TUhuekVWRjJheGl0ZTJKS0NUNCs5WDU0U0VCWXhEYkptcUEyaUFh?=
 =?utf-8?B?OUR2Z2R3NkJBcGVkSmloelZXUVplbklYQmFrdXpNcU1laGNrRCsrR0RDZjRE?=
 =?utf-8?B?eWRoY2lTSm9STnY3bGZsTEpqbU9Hc2gxQ2VNbk1raXMxaU9VK3pSVFgrVElh?=
 =?utf-8?B?ZDRmb05LUm5MV0Z0NHFyS3N3MEN2RzJTNTFkN1l0VzB3VDluLzlmZmdKRGFV?=
 =?utf-8?B?Sis1bmlITGFLZ1RFc3FhL01VbFBDSndtY0dycUFtVU8vQ0gyZ3AvaDRIVVl4?=
 =?utf-8?B?a0VLWW5EUkZqcmFUZWQxS09JOERLQ2MranczWitwdkp6ZlhpYkxFR3FZOUJT?=
 =?utf-8?B?NTM2bUMycXIzejlMTFNDcEpxZUNRNHhZc045eTcvcEJ5Qm5mMDlsbEYrNVhI?=
 =?utf-8?Q?bj78l7JNwRXDIscEhk88k4wGPd2u4E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmVtUjJXZVNTKytkTy9zeHoySHh2OE5BQ1JkRWVwUTVKTTJhUk5oaG01YWh0?=
 =?utf-8?B?Vmw5WENCMkRlVjhLNDUwQkNHTGJaVldWbmwxajFuWUNZaEZVWTFJb0NpSEhv?=
 =?utf-8?B?V0NKOUdkLytyVEwvOXBFQnBVQzZrL29sSURzbU1JTVJlVkxlQ3RjaWlFUk5H?=
 =?utf-8?B?bnRJaG5hOXA3Q3o1bE4rdi9kQXoyandhRlRNbmZoWXJ4akt4TWduaGc3R0dm?=
 =?utf-8?B?bUM4VU1YdWpCOVp2Skdaaml0dEoxVUQ3SHlieTAyQ2Q3NjkvbStVS1p2bU54?=
 =?utf-8?B?dXBaVFd3Z2U5aE1DZ3h6NXVNR0dlQWk1dTVKS3VTUFdCUmF0aXJCaVdvYlpD?=
 =?utf-8?B?M3hyNkdiS2RJSlh0eUNOZlBGVzNYbWZhOUNRUzM1NTJMRkZNOG1wTVE3eElF?=
 =?utf-8?B?TUh1UTcyd0RMZHJRdmN3Rk51WkNwQ2pqY0Jvd2pySkZGYnhCdzFmMGVFSVZV?=
 =?utf-8?B?S1BqL2hwaFppa01kZncrYTVOd0xpZWp6cVlVaEY2dUNkRldFUFZBaDF4OG0z?=
 =?utf-8?B?ZUZ0WlNrVDRXSStQdkNFbCtrb0pKMHpFclhDdEdSU2lSRWlpdTBXd3FqOFdK?=
 =?utf-8?B?Ly8vRXozZllqa0I2aXJlaWxwczNaV29ES2hzc0RoNGIzUzJ4bUovMnh3SElm?=
 =?utf-8?B?ejlNbjEvOVNHUEhMcFJFbVd2Z2x1UnhmSDlKNHRzSW5MbkZaWCtTY2FvRys0?=
 =?utf-8?B?bmZnSS9NQ3VCUExLRWNMWTJSdk9VdXRWSFNpL3M2ZUl0OFlDQ0tBeEk5bTJC?=
 =?utf-8?B?cW8xd1pqNmRwQ0ZNekN2QS9BRmtjTWt6Z3Jtc0FraEUyczZWRnR1bzh2TW1S?=
 =?utf-8?B?c1kzUmxzYUp6T3pqMDNsUjE2a2VRdm5kUm5yZlFBSThQeVl4M2Q4c2t0M0ty?=
 =?utf-8?B?dFk4WmFWZG5mc0FJajNRUDNhZDNUeTRvME1BVHhTQXpkZ3R4NForeExRNW9U?=
 =?utf-8?B?WmQxTzFkcmZiUGpnOFJmb1hrQkFZRGU2S0RKaUl5aUl3a2huWTdUSVpKS2NS?=
 =?utf-8?B?WTkxQUVWS1MvdHJac2Z2ajdDbDV0WU9oSFZYNGlDU0hRbjFvYzdvWjZyWXNN?=
 =?utf-8?B?dG5IRUVFaFlaZkt6VE04bisyZnlBcDhqOWpoTW8rMFhMVmxWdGgzYkg5U05W?=
 =?utf-8?B?NXNWc1dmVHBzNDZObmVGemJuc1ZWOWZhbUQ1eHdLY2JhWGp6RUFXcjV1RmVJ?=
 =?utf-8?B?TG01NHlRVjgreVRjUHNTRmNkYmZNSzEzbkZWdDFnNEVIYVFjcEtGaEx2UnZV?=
 =?utf-8?B?VkVySWNXRUlJUjN1OUxQU2NVbW14cmJPQkZ1NlA1VTZSYTlZZFF2a3ZaUjZZ?=
 =?utf-8?B?TFk3SGZ2S0FxZVF2ck5WcFFXMlM4RGcxME5ianVJZkJtOVFoWkp4dDdFd0Uw?=
 =?utf-8?B?OEI2VFVLRTBFNVhYWitVeUhKUTZTUFRjdDNkUnlaaW5vNW5vM09HMHBvZFhv?=
 =?utf-8?B?eGpPQXZyNEZEdmp6Y1cyNkN6OU9ndUFPaWNpRCs0b0hWVW5lUytFTjNkVUN2?=
 =?utf-8?B?S3B2VU1WSll5VmVEU25QSDhiUVc5TlZSYVBmQ2tmTmkyMWxzRzhqQ1I5aUxk?=
 =?utf-8?B?MWVDMlNrSzNRVS91c0FHK1J2ZGVoRk9OMHdUb0tWNmZGVjNWM3VXUzJFSkJP?=
 =?utf-8?B?cVdMdVp2cE1BKzAxQWtkVnMvM0xxaGVrZW9IN1JXM1oxM1RLbk9yd1pkTmFj?=
 =?utf-8?B?UEVRcUJtRXdyY2t6MDR4dVlCYUlGZCs0OXlHaG5HT1YrYXdQOEIvU2k5N3R0?=
 =?utf-8?B?S2FDNFBLUGhmbkFMYld2cnZRNDZ2RTVIWnFuRW4xVHM3TmtkZm1rS2VjMEpY?=
 =?utf-8?B?cHpNRXRleE1KK0paMnhhQ2lFUDBoeHFsWCtha09jS3ZJWDNFWkZlYWoya0xX?=
 =?utf-8?B?Q2VZVVFOYnRibkYvTkxFUVhFS2t6dVpFNnNZN2ZNdElEdnV3V2YxVHRvSGNM?=
 =?utf-8?B?eURQbUhoVW5zQUZ1ZUdGUVdzUWdCL01WNU9LY1lMV3NZeE8rY1crSk1iNmxh?=
 =?utf-8?B?OHM4V3dvcGpLSzlTYkFTdGZadU40RS9lMkJxZDhzRzhzVld3UmFwYk5GeVhn?=
 =?utf-8?B?NUpYRFRtaVROSWNHL3hYbFppbC9sVXhxV0txd2hBMjlTM2EyRXBrdzlXcnZa?=
 =?utf-8?Q?JJLOyVCNMop03k5A1nmRPhhjb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa55e935-2190-4e7a-3a8a-08dd9db1198d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 06:30:11.9640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tLZYDG38b0eUEDEAEGrka7Lx3Zw4Iizal921ZSFmg1z2gNLhTYf68DiLL4kewQDMmJtO4BjmzsDQfBtOWB2v7RGOGnG4SXdFTZBcycKaHb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwOC8xMF0gZHJtL3hlL252bTogYWRkIG9uLWRpZSBu
b24tdm9sYXRpbGUNCj4gbWVtb3J5IGRldmljZQ0KPiANCj4gT24gVHVlLCBNYXkgMjcsIDIwMjUg
YXQgMTE6NTU6MTNBTSArMDUzMCwgVXN5c2tpbiwgQWxleGFuZGVyIHdyb3RlOg0KPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTAgMDgvMTBdIGRybS94ZS9udm06IGFkZCBvbi1kaWUgbm9uLXZv
bGF0aWxlDQo+ID4gPiBtZW1vcnkgZGV2aWNlDQo+ID4gPg0KPiA+ID4gT24gVGh1LCBNYXkgMTUs
IDIwMjUgYXQgMDQ6MzM6NDNQTSArMDMwMCwgQWxleGFuZGVyIFVzeXNraW4gd3JvdGU6DQo+ID4g
PiA+IEVuYWJsZSBhY2Nlc3MgdG8gaW50ZXJuYWwgbm9uLXZvbGF0aWxlIG1lbW9yeSBvbiBER0ZY
DQo+ID4gPiA+IHdpdGggR1NDL0NTQyBkZXZpY2VzIHZpYSBhIGNoaWxkIGRldmljZS4NCj4gPiA+
ID4gVGhlIG52bSBjaGlsZCBkZXZpY2UgaXMgZXhwb3NlZCB2aWEgYXV4aWxpYXJ5IGJ1cy4NCj4g
PiA+DQo+ID4gPiAuLi4NCj4gPiA+DQo+ID4gPiA+ICt2b2lkIHhlX252bV9pbml0KHN0cnVjdCB4
ZV9kZXZpY2UgKnhlKQ0KPiA+ID4gPiArew0KPiA+ID4NCj4gPiA+IFNhbWUgYXMgcGF0Y2ggNiwg
cGxlYXNlIGhhbmRsZSBlcnJvcnMuDQo+ID4gVGhpcyBkZXZpY2UgZmFpbHVyZSBpcyBub24tZmF0
YWwgZm9yIFhlLCBjYWxsZXIgd2lsbCBpZ25vcmUNCj4gPiB0aGUgZmFpbHVyZSBhbnl3YXkuDQo+
IA0KPiBTYW1lIGFzIHBhdGNoIDYsIGxldCdzIGF0bGVhc3QgaGF2ZSB0aGUgcmVhZGluZXNzLg0K
PiANCk9rLCB3aWxsIGRvDQoNCj4gUmFhZw0K
