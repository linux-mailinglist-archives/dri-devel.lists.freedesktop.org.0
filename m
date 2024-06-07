Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7C9005CB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 16:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61BB10EC6E;
	Fri,  7 Jun 2024 13:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afS6/n0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5D710EC6E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768799; x=1749304799;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=SH1Hb0FDXiDrWDDfFU2mE7HGaPvQY0XoSNRL0Osr4rw=;
 b=afS6/n0YIO0+aNWLMFvjKQRe0qVf3Q44DqhLxOxrfk6FQOPJ1/t7mksp
 9Gu7NrObqMUXCoLDaWJevZjTdNRK2AL3IESYftlErTkBCfImfYjFYCY5E
 LiXE2JSAqWca/kuPtKcg3Fz38Y3JtRE7+H/ExehnqMj0/YuVHpXLqmVQC
 bxXSMkF+PyAWcsQSHQR5DkcyC3eYz0cU73hrdg6iSsMjbRnV3+vxQx1Pz
 Md2ZszHOgC+L+DlseJfDCjWShjAjfPuGm4PgySl9Bp5ncyWL5p0clkxhl
 keGj5+P/jENvh4BHUPS/jcHUtD/w2VoUASElssIx0buTagxwytR8lYdo9 A==;
X-CSE-ConnectionGUID: 2ZRx/2DVQWiI1N9mDoqHDQ==
X-CSE-MsgGUID: tNDClKACQgCG1v7ltVfyLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14324269"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14324269"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:59 -0700
X-CSE-ConnectionGUID: XHRPv4CpRPWbh3kyD3BnEw==
X-CSE-MsgGUID: CbEMFNyoQ9amx/hvkRwhEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38408590"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 06:59:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:59:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 06:59:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 06:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAHmb3D/6vdsOELZb4dMfjTC2uqU4RYl/MkL8BBYfWvJRKmAtdUivu8lxhEbx81OshmBhzz2/dNliVHkYzSGxshpNjduQAvLarbLAFCL5EJZ/YxDpUefKAhdPJ46UT8vjQ7aX/AEbV8H4Fg1xwoB8NzPcwp6w6Ajfo5M0e7A7sdp0Hbf5HUZaY8DhOMTb0slthv+PnIvq87cm5idaFrH14GzEEslaDuccjdrrUWor6lXQUMFyWG4uLrbonWn+A0QC+D4d9NcD0T9NiemxG62ehcmzyAL6FUeRlPcQdNC0d5+qWkWyI1KTLBI4Tw8mMAntKuHzRiJC3DyjCFnu+9w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH1Hb0FDXiDrWDDfFU2mE7HGaPvQY0XoSNRL0Osr4rw=;
 b=LDN7FjU9znUY75zLBQjxqGWYXjR5zS2B7z7vOI30tnvIdOqy9Q9tZOz3domBZLIznnMYsGU9P5bNj8/TpUasKM/H/h7BEyg5FIEryD1XsEu78oH9kJzy1c/vLPGKQNFvAwilqr8ChMx3y9bC5cOwdVl2KxBztyB7oB0z6oxBRsyhpzDL0ShcSeMjB9V2YydJ3pwRhP672eOfoB37qqlFg4ao+JTfi8W4AY+p0V1Vg3c26M5uReIXqC/GRqsZEjr+KRhcQNKxJxymMpZV0DtGfAMRwMPmMNBNCVEr0hmla+3wrmfNtLRDSjjKA0w6aN/tl2fw/T6PuSZk9TCDJzFK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 7 Jun
 2024 13:59:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 13:59:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
Subject: Re: [PATCH v6 05/26] drm/display: Add missing Panel Replay Enable SU
 Region ET bit
Thread-Topic: [PATCH v6 05/26] drm/display: Add missing Panel Replay Enable SU
 Region ET bit
Thread-Index: AQHatzOFk4AGnnTPBEO4JYfz0CvkUbG8V4mA
Date: Fri, 7 Jun 2024 13:59:55 +0000
Message-ID: <412a97914ad7df92fc3d6e5902f4bb0bcf16fd82.camel@intel.com>
References: <20240605103104.190849-1-jouni.hogander@intel.com>
In-Reply-To: <20240605103104.190849-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BL1PR11MB6027:EE_
x-ms-office365-filtering-correlation-id: 1af14ae3-38d4-4afe-772d-08dc86fa1c33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dW1XQUd2QzJkK0NVZmU4WStmSUR3a2IxQzdEYVZ3VGNuOHAzRURjcGdqMzdi?=
 =?utf-8?B?RmlXRUo2VWN2RU5JcWtEOWxyOVU3Nm84WFdjOHcvdklMWE9kL1RyUm5KZitQ?=
 =?utf-8?B?M2NSRE5MZ25DUHdZWjVsMHBoVjZaVXVrNXVPbjdENDBTS3dRSml4SXovSCtW?=
 =?utf-8?B?em9SMWg4MjNYUEcxL2RWcU5xditwTzJHYjJyWlJITHJwaHcxa2pVSGYyMUw3?=
 =?utf-8?B?VC9jdDlORW8vUDJ6ZW5STzBBR2JuNk9mZjF5SE1lekpDVW9rSmRaYzloaGdD?=
 =?utf-8?B?b0drVWJCQkFPYVhURjFabUVSV0dKRytFZUxzV0V4TjZzMFB6SklJUHQxS1BX?=
 =?utf-8?B?Wm9NcnRKL0l4OTJKTkxFRi9mZzUydE96UjkyeFVWVE44N1diTWFGL09zUWM4?=
 =?utf-8?B?WkpwMCs2RTBCOFk1bmRQYk1HVCtxdmNTZWdJN05nQ29LSnZDU3p6YllzOTBG?=
 =?utf-8?B?MEVjNnZsdjQzVjM2K2IzT3Z0aUkramw4ZUM4eGhodjFNeEdvVDhIbnNrWG11?=
 =?utf-8?B?ak1WZVp1bmp5VGVieWp1Z3lmckZDNHhCSDBERnc0bjhHYmpiNWJPc0ZHN2dD?=
 =?utf-8?B?em10R0wxYnVNcDJ0R3JaRGdGaW80TTJDYkwwUU9UQ3BuTGZmQW0yNnc3ZFpa?=
 =?utf-8?B?VEFrLzF5dmJhSXExZW4xcTBFeDJpOERjZEhRbDFYcW5DVWJjL3p0T2Y2QkJr?=
 =?utf-8?B?UlZZY0tpK1VjNHNwRzdjODlpUXo5SGVwTm44K25ENFovelJqSUg0Slk3Y2Yv?=
 =?utf-8?B?aTFJaVBKZUhjY3liMVJ4SFRJRDYyaU1DVkw0eTlkaUxoOER6Z2xzb1hlcDhD?=
 =?utf-8?B?cjFaYXREYi9YeGlpemFlM0tIQ0ZZU29ZbUF2ZlJDZVFCRDd2RHc2anBQcGZu?=
 =?utf-8?B?amUyanJiMlhieUJDL205TVFvMExLbWdna3kySVlpNG1ZOGFCaXhseUVEN1l1?=
 =?utf-8?B?aTc3endZUFJ3SXBQZ3M3amlUc3UwZ2NHRkEzUDNKZHBreGVDcEYrQTlaK2I0?=
 =?utf-8?B?NWZjRzBWUlFiUi9ueTVHUzlSNGc4SXI3eHl4N2RCdWh0bjBCdys3cnB6QjVL?=
 =?utf-8?B?QjlMekt2TUJjN2xvL3BTbmR5ZCtMWkZ2OC9kK1hZQXJna2sxd3YyWmpTeWJY?=
 =?utf-8?B?Y3l1QUhiNC9EL0RYN2wvNjVSVldncklwQno2cWxMOFMwVXlVc0hPZmdJamZJ?=
 =?utf-8?B?NEtTSEtKZ0JIT0xpb3ROZXZxcU5xYWg2ZTVENTBEZng2WnYxblg1Qnd6b29Q?=
 =?utf-8?B?bjRXR2FrMFEvNUhmaGFLUFI2K2J6aTkxL1Rrb2EwbFI0NnpobHZ0c01YcXZ2?=
 =?utf-8?B?Z0VIb2lOaG5wS243NTJiTkIwSnhweGVsVGlBZXU3Q1BHL0F0eGtTaTNtTG5M?=
 =?utf-8?B?M0piTWtCOUdtbG4xOFdiNXRoREJuNFo5NjhuYXIwTkhXYm82MjJ0NkdEVk12?=
 =?utf-8?B?YS9iUkRjMGJSTFBZV1JXWWh1bHJKaExQQzdFNllGdzNpMWJyZ3VZWXh1cy9G?=
 =?utf-8?B?ZnRBVGhZTnM4SjVTKytDVTY5QXpyaHhFN1hXVUxNTmdjS1pBdEtmaW52TUxu?=
 =?utf-8?B?R0kyOEVYQ0toMGVjeE9jRjIzd3hvSlNwQmVPNitMUlJwcFpMQkxjMFNPbmFZ?=
 =?utf-8?B?R3hkZ2FrUXJRdlpKVjZiN0NKUm9TZEVkckY5NUg0WDJwcTZNV1E3bVdQR2RB?=
 =?utf-8?B?ZlRJcE9hMXpyV2hMVytCWFJMZG5nZXBtcFltaW9oSWtTL1dWSlF1VmIvRThR?=
 =?utf-8?B?Zjlselh0Q29mZXVwd0M0cFpBQWMzWjFJYS9yMXdHQkJIQXBVVEpyQlg5YmhS?=
 =?utf-8?Q?jJTf9Ck/kmVyHUIZHnxB63NYKK/KtBC/q3mH8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVl6N0dSb2lLcjlUalR3cjl3NXF2TEJpMzBmWXY2bC9sa2FYWUE5azdETWVO?=
 =?utf-8?B?NGJ4aFpJM3lXVDg2ZFpwa3JNQ1lkbGRvK2tWcmxDTExSRGdRaU1DcDlvMG1n?=
 =?utf-8?B?cUdzcldkb0JUemszbks3aWpmRlVHQ3IrNWthNWtSZFJxNEx3WUxLMGlxemsz?=
 =?utf-8?B?WU9nOWVkVXlOUkhZZklkOUZNN1M1ZEhWTUpPeVdXSytzWFhtbGFOUmFjTmQv?=
 =?utf-8?B?OG1XOCt6N2hpeEoyY2o1dnRWQ3cvRlVBQ3NvQ0thMllObEg3TjNFR0psTTJ6?=
 =?utf-8?B?Q1FqeGJvYkFBbGw5TCtDNVVPSlRWNldyODVpeEdwai9tTnU5YTNPRjBRTnpJ?=
 =?utf-8?B?SzN6eDViZWk2cyt6b05TUFVVZ3pqbElpV2dDUUIrWjJUV21vMGZSK3gvbzRE?=
 =?utf-8?B?ZlNkenJMY0lFeThDdXBsVm5jWk44L3U2dVJ1UHFneUtCc1dXSEpXZjNrOUFD?=
 =?utf-8?B?R0NWVWxzY1kyODZaSW01d1dvQmlLd3VxZ2lLWU5wMk9QNGY2UmV6NmtiZHc5?=
 =?utf-8?B?emZFanBZZjRJT3NYNGUrREF6MGJjdkZMZVFjL2V0NWdQWDZjRXYyZWZhUEtH?=
 =?utf-8?B?a0tQNXVlTlIwNzNGa1NwUURXOWtaYjBoWnlySzZJSzhnS0F0UExtZEhKRE54?=
 =?utf-8?B?WTlva3F6R3hoWm80eTE4bjNkbTlnM1ArZ0hWMGJac3NKdllkT2kzRTdhUVpP?=
 =?utf-8?B?aGRuOXZJOUwzT3MrdVRyUWpkeUF0TzU1aHNnM2NYOWsxNWRGNUR6MHZEUmd4?=
 =?utf-8?B?OXk0OEZNSWhRK1RLczdQT3dHaTJ3TUdvR1k5MUxnVFF5NHIxWnpEQzdxb2tt?=
 =?utf-8?B?emNwVTkzZ2NjMjFTU3llS0tjTHVsTGplck9ORHNwSjJzR0p4eE14TEpUWXNX?=
 =?utf-8?B?RDVFOUNrTXBNc0xhaldHK0R2bWdvWS9mQU16WEJaL0V0MGdKTXZRaW1FMmRH?=
 =?utf-8?B?K3Jua0ZqNjNGSzlVQU5TaGxtRG5CNzlvOHFMZmN1cXduV3FTU0FJZE11T3kw?=
 =?utf-8?B?WG1lL3ZCYnpOR2dHNWpkM0tIQ3prMStxZFZyL1JySUVrZEVCa3cweXplRUUx?=
 =?utf-8?B?Ynp0Smp5cGZPUFp3a2VPMTJqZGRicXRoUk9wczFob0UrM3g2ckYveEhjVk9y?=
 =?utf-8?B?eFByVTNwMFpQZktFWlpzeFdOdlo4RTdWZ3lmeXFTME5tSzZGQmhEZVNmZzJI?=
 =?utf-8?B?aVRJZkx4K2JHbmhGQnNEQ1UyMTVXZ1cvUHdOS2JaY1Z1cE1TeXg3UzAyR241?=
 =?utf-8?B?Z3orVmFJVWJnbi80SEV4Z052Tnc5ZStjd1FMU2ZzZnBTNjE5bDdUd2dneitP?=
 =?utf-8?B?Y1pkV1NvZ2dodm1yN2xRUGo2R01TZElQMHBWN1pCSlkwZkMrVWFlOER3dDZ5?=
 =?utf-8?B?YTlsbUFUUEpiV2E4NE5NMmgwclpUeXJxemJwaUI3dElGUXJqTjJUSE1IVC9o?=
 =?utf-8?B?Mm5ENUk2UUpxWjJnL2xpTzVYcTY2bEhHNDRvWjNEckN2c0NEN21UQkN6dk1Q?=
 =?utf-8?B?Q3IwTGVOdEE3SUlqbjhKanRyNWhaQjNmYVB3UE9MSGJRelZORkZYMnp3VDRx?=
 =?utf-8?B?MEFQd01kZFRWUHVhbWpVaEpNUDJjaGN1eHVyelFLU2NNUnNsOWFLSVdla09m?=
 =?utf-8?B?VUtabStMZC9yTmFUQU9EMTcwa216YU9CODl0QmpzaVVKTTY3eERrakxuREdM?=
 =?utf-8?B?bXQxY3pYN2t2K0RvVlB6ZGplYVI5RzRSbzNKeS95MUFvRC9tTG0rL2tDMWxD?=
 =?utf-8?B?MUY3MFc0MXNjRzBrREhpRjhFcHdwMUwzSktacUkrVXIxUDhnKzVmS3RaYU5y?=
 =?utf-8?B?dkd1VHBVTDNsOXN2QTJ6SFhzQTFyYXhMSnhTc3pqVEg3blY3MjR6MlgrVUxh?=
 =?utf-8?B?UnE3ak1ocG95alNWbXJPTWRQZk40ZTNjMnRYcmV1ZnZYVGx0NXVNRVA0azR2?=
 =?utf-8?B?cGZMN3diQVVDK0hmRnlpai9HVms4TzBFTGEwWFAvMmk1d1hqbkE4TXFUcmpO?=
 =?utf-8?B?NWdlT1Iwa2tQdWE2d1E3aHVjWS84YjVSTlJuVTdoaWQwb0JrVGxLZTdhbTFX?=
 =?utf-8?B?bThTZkFodHpEL2xTOTQwdTFjdTdJWW1qWlJjZWZBN2FpOEpLS0lPOXN3V2dT?=
 =?utf-8?B?b3ZCMVFvQjRFS1NjS1ZBYzJtTG9kSWVVM0dQNHFjNE56bFFXSW9zS3JQKytU?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECA8FA8CF6808F46959606F00499495D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af14ae3-38d4-4afe-772d-08dc86fa1c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 13:59:55.2446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0hevjghVhissfNIJMbDq7iTq68BrpMgv2dZEJXnyb6Vo4LXzGv53qOsFNU2iOnPVLFUaeqQyLvTNHGvVLyAWeNDR89n7Gbc0xOi13XLouN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
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

T24gV2VkLCAyMDI0LTA2LTA1IGF0IDEzOjMxICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IEFkZCBtaXNzaW5nIFBhbmVsIFJlcGxheSBFbmFibGUgU1UgUmVnaW9uIEVUIGJpdCBkZWZp
bmVkIGluIERQMi4xDQo+IHNwZWNpZmljYXRpb24uDQoNCkhlbGxvIGRybS1jb3JlIG1haW50YWlu
ZXJzLA0KDQpDb3VsZCB5b3UgcGxlYXNlIGNvbnNpZGVyIHByb3ZpZGluZyB5b3VyIGFjayBvbiB0
aGlzIHBhdGNoPyBJJ20NCnBsYW5uaW5nIHRvIG1lcmdlIGl0IHZpYSBkcm0taW50ZWwgdHJlZS4g
SSBoYXZlIGFscmVhZHkgci1iIHRhZy4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNv
bT4NCj4gLS0tDQo+IMKgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaCB8IDEgKw0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+
IGluZGV4IGYyNDZmYTAzYTNjYi4uMTczNTQ4YzY0NzNhIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2Rw
LmgNCj4gQEAgLTc0Myw2ICs3NDMsNyBAQA0KPiDCoCMgZGVmaW5lIERQX1BBTkVMX1JFUExBWV9S
RkJfU1RPUkFHRV9FUlJPUl9FTsKgwqDCoMKgwqDCoMKgwqDCoMKgICgxIDw8IDQpDQo+IMKgIyBk
ZWZpbmUgRFBfUEFORUxfUkVQTEFZX0FDVElWRV9GUkFNRV9DUkNfRVJST1JfRU7CoMKgwqDCoMKg
ICgxIDw8IDUpDQo+IMKgIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1NVX0VOQUJMRcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMSA8PCA2KQ0KPiArIyBkZWZpbmUg
RFBfUEFORUxfUkVQTEFZX0VOQUJMRV9TVV9SRUdJT05fRVTCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICgxIDw8IDcpIC8qDQo+IERQIDIuMSAqLw0KPiDCoA0KPiDCoCNkZWZpbmUgUEFORUxfUkVQTEFZ
X0NPTkZJRzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gMHgxYjEgLyogZURQIDEuNSAqLw0KPiDCoCMgZGVm
aW5lIERQX1BBTkVMX1JFUExBWV9TSU5LX1JFRlJFU0hfUkFURV9VTkxPQ0tfR1JBTlRFRMKgwqDC
oMKgwqDCoCAoMQ0KPiA8PCAwKQ0KDQo=
