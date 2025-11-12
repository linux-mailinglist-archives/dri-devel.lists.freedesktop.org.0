Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E532EC50A67
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 06:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD37310E6A1;
	Wed, 12 Nov 2025 05:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqyPE5L8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7FD10E06A;
 Wed, 12 Nov 2025 05:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762926926; x=1794462926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o/VvZhFOPbGvVUoxuUgEY6D8diil0HF/gFjaHNIEgN4=;
 b=fqyPE5L8vwisJI4ePRibCpPhxayr4I6DEh/SyQVNLAkKmQKLu+ZBro1I
 FoiRQR+G7RSDKWgmXUULYmcOi+9dIHjt9nSsplvqWSBtqDOUhBZYGwR3l
 nVlGJv4abRxUOSyQjKKyBhM+1QGwrIsM5fQx9c5lNhdK2/DxMvQHOP+aW
 yPXQepAWlf3Vy319XoXr6SSSo92Ic2xx76803aNRX/EEfVsq7kQ27gVfE
 NGlT62Pjbsy5jKwHuEQM2X++P4D9iSyEFKSrJ77b9l6t/txRXS+2++sLN
 jaOvj2RL5EA7JJj6YF1+tOReQiHyAADm/acDX1aW/arHGTTPrEgftm01B g==;
X-CSE-ConnectionGUID: cJSAMDy+QlGnn38LEpecZA==
X-CSE-MsgGUID: Wxi85EMjRWeOrTbmU4Hunw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="65019212"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="65019212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:55:26 -0800
X-CSE-ConnectionGUID: aHQEx8Q+TRWd0GCAQg8fXg==
X-CSE-MsgGUID: o+YYO4qITR+hUIfqk0A/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="193370972"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:55:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:55:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 21:55:25 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:55:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5pbAtiktjZEkk6iOWSgZoxXcPFXemD1g77qja9EibLqK6zsBpYoFNYPKBB8orf+xKABTJDfXRZZWaFFRLmUpz4GLcSAVqqj07uNW5vSXq4yAhz4rrxiX1/zQ4E9MfUwsB5CS43V0280oXqCknlP5T+785SQt4nfPuawsIrznypldjfFEuy0tcqmI6/jpZ4xjOxyo7QGDAxEu/BWpjlYNHigpdWN/PH0WJaXasvzECxEud7iCeMOfSSy/f5Rts+lvabaaf+Cfpe4ll+oJ8vZ60O2YcHyMfZCmg8BRD45uk/dj7KKUmQaefCRrfGjCLBzUShl2xQd9H0iS71lmAcePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/VvZhFOPbGvVUoxuUgEY6D8diil0HF/gFjaHNIEgN4=;
 b=UwxLanxnhwHknju5kzoSMcQ/dA8kI14vnR79gnFJDoeWHV64eGwZCNmM9BrkD87FgV/duaQ6Qchb49b2tQsGdzFDENKiswieYLUeDjyUPB/jHO4XjgH7jg9ueLJWCfwhV684Dtvt0KffsOl4YtVCEq8CHHg/MPfkht9jdyiiQOAzGQTLZ4lW3CW+Bi1HumdiAn8qqu9O3DCsyL9iZ+e+gQ/Cc+jWUCDrxiFWUjtx4hqbAwYfbtnoMGrOP6vHXb3A6DKwvRNEv2T/tiGwn0ETS+kpnG2vN8I9aomXC+aY5EobFb78FsH4IKwb0cXVbqPxoQHVObsnuPZ+o+50Xul/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB6725.namprd11.prod.outlook.com
 (2603:10b6:806:267::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 05:55:17 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 05:55:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 06/10] drm/i915/alpm: Half LFPS cycle calculation
Thread-Topic: [PATCH v3 06/10] drm/i915/alpm: Half LFPS cycle calculation
Thread-Index: AQHcUwym/qnOisPNJUG+gEf0cQJnXrTuiy0g
Date: Wed, 12 Nov 2025 05:55:17 +0000
Message-ID: <DM3PPF208195D8DC984F453AF8E9BD9D0FEE3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-7-animesh.manna@intel.com>
In-Reply-To: <20251111124316.1421013-7-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB6725:EE_
x-ms-office365-filtering-correlation-id: b6be0c58-166d-441d-9e7a-08de21b00e84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VVRlTlBrNDhjNFJuZno0RVN0eUVyUGxoenAxdU5YQmdoUEN4WE9CRFRVcjZV?=
 =?utf-8?B?NTRYR2c3b000SHlneGFHYVN6eHNjVXFqZDFxaWlRbmFRMWEvc2Y1UlN4dVdN?=
 =?utf-8?B?ZCt1MWZMTmh2dU1WWkxNeHhrOVFRejQ0Wi84NXdrcWIrOWQ5ZmFyZ3h6c0ts?=
 =?utf-8?B?MVluK0laRGlYV1dlN1dZQUNZREE4SHN0cndqcHBNN3ZEN0NISUZUeEFJaHpy?=
 =?utf-8?B?ZVlvcS9hL0VQZ3VUR1RaY25hcmdibmlnMEwxZGZrQTdHTTA4NDlMSkl3QU1r?=
 =?utf-8?B?dytWSTZaVzhYOEl0eWttd0RrTGNMaHoxR1R6ekdhVVF4TDFtUmhYTHBUQTIw?=
 =?utf-8?B?cSsrR3lDVkN6Y3l6NzVvWStBVUUzYWM1UVlHbEdqM0JibjhZUTRzcXd4enBu?=
 =?utf-8?B?ZXlxS3JpOUNPTDdSc1BkT1hoYURCb0xKMThwd2FVSkJrOXZxTmZldFhncDRR?=
 =?utf-8?B?WWo3RE5HckhkMXBtcjVIenFjUmQ1dHZibmcvRGpJMWt5THJ2SldUOWQyb2I3?=
 =?utf-8?B?RlJINGhUU05HdFFnK2dWMjUyNEFxenZOMDJDS1FkNlgwYXlYQ3pxRXFoNll5?=
 =?utf-8?B?M0kwRHNSNkRCZndLRFUvNnpWRE9LWUFyU1ZZckNSYXRaWjF0djV4NytRd1Zh?=
 =?utf-8?B?YU9lSXorTytqK3dlZ0dBMktPd2JxVzJvdU9BSzR3dlpMN2hCNXFjdTZ0eUR0?=
 =?utf-8?B?SGZFYk5yejJudWlRT0V0MG5zNCt1a24vRWN3bVFqeHhheTZvalNrRFp0ZUFv?=
 =?utf-8?B?Ni83cUt5ZHBiVHdhRXkrOXNnMFZ5VVNPUU55OEJZcDFTOGZxM1UwaG5sK0Z1?=
 =?utf-8?B?OWdvbVU1UjNlZit0YkIzTDQ4c3o4VkVvdjhnbDh4SUQ0U2lqanFtK0MxaG1E?=
 =?utf-8?B?U01mVkJneWhtTGNGRUhFai83TndHYWVtdk5vOTNoMlErbnVQTFhjRFFWRWMv?=
 =?utf-8?B?VXZJeEJPYXpuaDVyTXVIRXg4cTJ1Njg3VGxJTWR2amhmM08wRmM0SFRXeWht?=
 =?utf-8?B?d243Y3UrRUtRU0JYbEhhQnE2ZjdHMEtlR1dacGFNd2d4Y2xtZ2dNM3UvWU1X?=
 =?utf-8?B?RTd0U01nR3FrOEZlNnlzOUJFWDhxQlFCbXZZci9XMG1KSzQ0U2Y4UXB0L1ZS?=
 =?utf-8?B?K0ZXMEpnV0FNcHhCVzViV1dzbVY4SmxWMnJ5YTZxaGl1WS81cEVtUFl4dTF6?=
 =?utf-8?B?ZjhoNURkZHJMaXNNQWFUUGZJeUtiNXlhc0p4QnVyMmYzRkxGODRnZGdMRC84?=
 =?utf-8?B?b1ptY0VMckg1N2RjTis1QzRLaDZMM05NUC9DRUNPbXN1QkZKQmlnQTVKc0Ja?=
 =?utf-8?B?MXRyalIxeFI2RzgxaFdSSE9ackZOMWhSem9PSDhTNThmaTRMWHhveGc1ditr?=
 =?utf-8?B?MlZRSzFuZ0xQN2dObEF2R1ByTGwwZjBzeDNCbmRaWENaVERuVWpuOHNyUUVr?=
 =?utf-8?B?TWFma3JzOHdnd1NtbkhreGwyMzVheTJLKy9taU9WZ3U4aEVyS25rUEp1SXBn?=
 =?utf-8?B?UlIwQnl3QTdnVndEQXk4ZGhyS2UyN01aRmFrMk1iMFRCeHJsY0hJMmt2Z0ZM?=
 =?utf-8?B?RXB6emRGc0IwOTBTanpiT1NGbDVnNzZNcEw0UDNzb0h2dm9GTUp6NUtzZ2lJ?=
 =?utf-8?B?alI2dFJSZDMvT0JteWtRVzJ5YnNmQUcxNWlsbThhcHozdFFzVVphZ1ErZk1L?=
 =?utf-8?B?NkZNVndFK3lTTzgrem9Vc2E0ZjBRTjA4eTdmUmxTWXBlRW1lK3pvT2RFcDdG?=
 =?utf-8?B?dVBNN1ZRN3BWcWE3cEY3a205N0ZKOXFpVTV4SnZLNmgwbDB0MHhDbXM0Yk0r?=
 =?utf-8?B?VW9BdjVzellxTUYvVTFhMEhMZFFUL1VueUlCUkVYeVlSUEdYTFJDTXowbEo4?=
 =?utf-8?B?UXdLNm05QU5HTnMzcUVFRHN5OEkxSDlGODkwYjFtRDVueDRDWGM5eExxOWRp?=
 =?utf-8?B?RE9mZWFRK0pOM250dnZxR1JnWWtsTmJZdXN5N1gvcFRhNzUrWTdaSTQ2RzJS?=
 =?utf-8?B?cUtVSWpzSHFrdkh2cjh6LytiMG1rZkZOSGUzTGFYZzhpZGNSKzZTMTBFZnRq?=
 =?utf-8?Q?ru0HtK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHZFWmhOQTFRNFBCR3J2allwNmZxMGNHcFpvL3E1ME11ajdqQy9sWWQ5UmJ5?=
 =?utf-8?B?N3h4alpsRUgwbDhXTGcxRkdzMjd0bm9oLy9PVXUwZ002bjJGSlRJUk0ya1hZ?=
 =?utf-8?B?czlLbitOU3BFV3VoNWNkRkREeE4yejkxa1pTaXpnR0xQRysyY3FhT3FpTEZM?=
 =?utf-8?B?ejgrVHc0STcybnFkeHZaM3UyeVA0blpkNlY0THZHNzVnREpYN3krb1h6Y0x2?=
 =?utf-8?B?VWlGc2JDOC80UGdEaGJFZFNDOHQvMGk5UzNMdU5HcjlVc09LdEp2bjJOTmpT?=
 =?utf-8?B?QVY5d2NlOFFPaGxab09GekhBMGMzMHBWMUtMUXhUNUo1SGQzczVRcWI4NklG?=
 =?utf-8?B?cGpTZU5ia0wrVGpzaGJqek9wQUVsZ0ljVng3YkFaS0Rnbmk1bTVMcmxjWjla?=
 =?utf-8?B?b0FNSkoxRm5zUHJVUnBnK0F2M3FicG03YUFBcHVqSTBTMEMyT3NSYW1ZWGVy?=
 =?utf-8?B?ajdKeDZleHNxUTEvVTV4ekpTa0FRWlAvRTVZdDVnMno2dWdGZitsMkExTTNa?=
 =?utf-8?B?N1Y2QzdJdlFWQklFM0dNNk8vV2k2Q1lVNllPdkpkbzhnVTRjZU9Baldyd2pi?=
 =?utf-8?B?MGpDTW5SUElCV2tpRXBKbXVIZTlIVjN1TjFCS05qd2ZkWlRyelc1ZmNaMHdP?=
 =?utf-8?B?ZnNoekUxaGovNTdYWjZYQ0t3SVozK0w1U1RBbExSM0FMOEtlUld3YzRHUDUw?=
 =?utf-8?B?NDJuT2hsTUpFbjcrVGd4ZmE0TXYzeU1LRnB2TjJzVFV3VU1aSjBrL010U0hO?=
 =?utf-8?B?Q2x0d1BmZHBiTDQzZWhBYzE4UDVrb2Rob0l4OXVzbFFGMFcwazRTQWhCTHdK?=
 =?utf-8?B?bVVEbTlpOVZoNHBETHdmdHBPWERhSjFaVmgyZzV1eW9DbzdlMDNQRUthOVNJ?=
 =?utf-8?B?M2xYZUdzcTRmK0NyZ3ExV2hPcnBVVFF2OEV4Y2s2UUVhZmVLcWlVeGJ4TEpx?=
 =?utf-8?B?cGduNWRrSnNHSmNyalVkNTJDaVFPMXJMYWJxdXQ1clNHd1lDTkdYMWxBZkQ5?=
 =?utf-8?B?ZkxIL1lGaXZuRWhzUWFJdnZaSVE0Smh4S2pnalVJR0dPVkV1Zm9qQm0yekNC?=
 =?utf-8?B?K2VBWWJuRDVmL3BvcDZ6Q3hqZkx5OU4yd05xdUtDc1lrUGJPekREMGtxdlRH?=
 =?utf-8?B?VnA3dE1mSGF6ckJEWTdsRmQwQ2pKbytOYVVOZ1ptNXZpVXBrMnB0czBjN2h4?=
 =?utf-8?B?dWFMSm02OTY4NXpWakZMdGxCVnVhcmlQclRtbWhTSnlMK2NKeXFtVWdVMStP?=
 =?utf-8?B?WWpMREhEYWM2NjFmTExBQWdQOHBUOE1wdEkvUFl1eUxhUSsvYVpmMm1CcytH?=
 =?utf-8?B?OWREN1dXWkVjWDNpYUtHQ2Z3N3VLUTI0TFQweU5DMUZ2cVAxbVd4WXFWKzVp?=
 =?utf-8?B?WEZKekI3bDZOZHd5L21GUVpQRVVnU2hxU0U0Z1Q0YTdpdk5ydElkakhPZGQ5?=
 =?utf-8?B?Rk1MK1BXR0pBbHJ2bkFsbXpHeXdOYVZpaW9VbTM3MXRDVmZGejBnd1pkNG5T?=
 =?utf-8?B?UWU2MVJvTkc5RDBNL3cyNGFoNi9VOTF2MmE1V3gzTkYxK0YybmI0dWxuQ3Z3?=
 =?utf-8?B?QkdCUndob3h2dzR5ckp2QjN4aHh5VjhtSFVsWEFNdkNhSWErS013ZmV6cTRS?=
 =?utf-8?B?SXRPV04xcS9OT1Uya0tnY3ZwdFhaWjMyZnlXMkJqRTUwY3o1d2M3Q3IwT25k?=
 =?utf-8?B?ZGlDNFRuU0hVOEFQdnpJcC96cEFUZ0FwMXpabGhvQ3V3TXc1K1IyRkFXUnlw?=
 =?utf-8?B?YXNuREZobnJaTml3NXI0Mk9BeU13bE16dThwcEsvVlVvUVBHdXpyeCtSRUhC?=
 =?utf-8?B?U3krZW5WOGkzakNFYXJQRDRwS2hlQ1pFb3ZMeHRnL2dFbUlsSDl1QWpwcXE2?=
 =?utf-8?B?dkd0WHNMVExwUWFSTzhlV3YyK2NwaW5sc2YyMVU3VVZ3TkJZNmszcTJESHB2?=
 =?utf-8?B?ZDAzUGMrcjJ4Yy9sWkdIYStCRnMxS1VrYmJmTFhsQ1ZONTZ6UEpMdTJqVlVF?=
 =?utf-8?B?Sm1sSUVnay9CVmZybzNYSUlzM0VUMVhTTkZNdXM4bzFnZXUxbXVTbW00U2Y4?=
 =?utf-8?B?OHZtVko5YWZRV1FPWlV1MWFJWDZRcTI0a2ZtOHQzSXZBVmdLbjJubjZpdGZ4?=
 =?utf-8?Q?tZd7ej3uq1h4DW476mwfH2W7l?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6be0c58-166d-441d-9e7a-08de21b00e84
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 05:55:17.4376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXsLzJqJFg+TeSUDUB634p9HwS5kQ8qfMrl2q1rOC+kte+hRtq3llnVpWC0xOtFMaQv2BArIBn1uFkfNQaCjfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDYvMTBdIGRybS9pOTE1L2FscG06IEhhbGYgTEZQUyBjeWNs
ZSBjYWxjdWxhdGlvbg0KPiANCj4gQWRkIHN1cHBvcnQgZm9yIGhhbGYgTEZQUyBjeWNsZSBjYWxj
dWxhdGlvbiBmb3IgRFAyLjEgQUxQTSBhcyBkZXBlbmRlbnQNCj4gcGFyYW1ldGVycyBnb3QgY2hh
bmdlZC4NCj4gDQo+IHYxOiBJbml0aWFsIHZlcnNpb24uDQo+IHYyOiBBdm9pZCByZXR1cm5pbmcg
ZWFybHkuIFtKYW5pXQ0KPiANCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5h
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2FscG0uYyB8IDM4ICsrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCA4MTQ3MjI1NGFiNzMuLjljMzdm
M2VjMDZhYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hbHBtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmMNCj4gQEAgLTcwLDMxICs3MCw0MyBAQCBzdGF0aWMgaW50IGdldF9zaWxlbmNlX3BlcmlvZF9z
eW1ib2xzKGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiAg
CQkxMDAwIC8gMTAwMDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBnZXRfbGZwc19jeWNsZV9t
aW5fbWF4X3RpbWUoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUs
DQo+ICtzdGF0aWMgdm9pZCBnZXRfbGZwc19jeWNsZV9taW5fbWF4X3RpbWUoc3RydWN0IGludGVs
X2RwICppbnRlbF9kcCwNCj4gKwkJCQkJY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4g
KmNydGNfc3RhdGUsDQo+ICAJCQkJCWludCAqbWluLCBpbnQgKm1heCkNCj4gIHsNCj4gLQlpZiAo
Y3J0Y19zdGF0ZS0+cG9ydF9jbG9jayA8IDU0MDAwMCkgew0KPiAtCQkqbWluID0gNjUgKiBMRlBT
X0NZQ0xFX0NPVU5UOw0KPiAtCQkqbWF4ID0gNzUgKiBMRlBTX0NZQ0xFX0NPVU5UOw0KPiArCXN0
cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShpbnRlbF9kcCk7
DQo+ICsNCj4gKwlpZiAoaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkgew0KDQpZb3Ugc2VlbSB0
byBuZWVkIGludGVsX2RwIG9ubHkgZm9yIGludGVsX2RwX2lzX2VkcCBubyBuZWVkIGluIHRoYXQg
Y2FzZSB3ZSBjYW4gYXZvaWQNCndhdGVyZmFsbGluZyBpbnRlbF9kcCBieSB1c2luZyBpbnRlbF9j
cnRjX2hhc190eXBlKGNydGNfc3RhdGUsIElOVEVMX09VVFBVVF9FRFApDQpzaW5jZSB5b3UgYWxy
ZWFkeSBoYXZlIGNydGNfc3RhdGUNCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiArCQlp
ZiAoY3J0Y19zdGF0ZS0+cG9ydF9jbG9jayA8IDU0MDAwMCkgew0KPiArCQkJKm1pbiA9IERJU1BM
QVlfVkVSKGRpc3BsYXkpIDwgMzUgPyA2NSAqDQo+IExGUFNfQ1lDTEVfQ09VTlQgOiAxNDA7DQo+
ICsJCQkqbWF4ID0gRElTUExBWV9WRVIoZGlzcGxheSkgPCAzNSA/IDc1ICoNCj4gTEZQU19DWUNM
RV9DT1VOVCA6IDgwMDsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCSptaW4gPSAxNDA7DQo+ICsJCQkq
bWF4ID0gODAwOw0KPiArCQl9DQo+ICAJfSBlbHNlIHsNCj4gLQkJKm1pbiA9IDE0MDsNCj4gLQkJ
Km1heCA9IDgwMDsNCj4gKwkJKm1pbiA9IDMyMDsNCj4gKwkJKm1heCA9IDE2MDA7DQo+ICsJCXJl
dHVybjsNCj4gIAl9DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBnZXRfbGZwc19jeWNsZV90aW1l
KGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiArc3RhdGljIGlu
dCBnZXRfbGZwc19jeWNsZV90aW1lKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ICsJCQkg
ICAgICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ICB7DQo+
ICAJaW50IHRsZnBzX2N5Y2xlX21pbiwgdGxmcHNfY3ljbGVfbWF4Ow0KPiANCj4gLQlnZXRfbGZw
c19jeWNsZV9taW5fbWF4X3RpbWUoY3J0Y19zdGF0ZSwgJnRsZnBzX2N5Y2xlX21pbiwNCj4gKwln
ZXRfbGZwc19jeWNsZV9taW5fbWF4X3RpbWUoaW50ZWxfZHAsIGNydGNfc3RhdGUsICZ0bGZwc19j
eWNsZV9taW4sDQo+ICAJCQkJICAgICZ0bGZwc19jeWNsZV9tYXgpOw0KPiANCj4gIAlyZXR1cm4g
dGxmcHNfY3ljbGVfbWluICsgICh0bGZwc19jeWNsZV9tYXggLSB0bGZwc19jeWNsZV9taW4pIC8g
MjsgIH0NCj4gDQo+IC1zdGF0aWMgaW50IGdldF9sZnBzX2hhbGZfY3ljbGVfY2xvY2tzKGNvbnN0
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiArc3RhdGljIGludCBnZXRf
bGZwc19oYWxmX2N5Y2xlX2Nsb2NrcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiArCQkJ
CSAgICAgIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiAgew0K
PiAtCXJldHVybiBnZXRfbGZwc19jeWNsZV90aW1lKGNydGNfc3RhdGUpICogY3J0Y19zdGF0ZS0+
cG9ydF9jbG9jayAvIDEwMDANCj4gLw0KPiArCXJldHVybiBnZXRfbGZwc19jeWNsZV90aW1lKGlu
dGVsX2RwLCBjcnRjX3N0YXRlKSAqDQo+ICsJCWNydGNfc3RhdGUtPnBvcnRfY2xvY2sgLyAxMDAw
IC8NCj4gIAkJMTAwMCAvICgyICogTEZQU19DWUNMRV9DT1VOVCk7DQo+ICB9DQo+IA0KPiBAQCAt
MTI1LDcgKzEzNyw3IEBAIHN0YXRpYyBpbnQgZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKHN0cnVj
dCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+ICAJaWYgKGx0dHByX2NvdW50KSB7DQo+ICAJCWlu
dCB0bHcgPSAxMzAwMDsNCj4gIAkJaW50IHRjcyA9IDEwMDAwOw0KPiAtCQlpbnQgdGxmcHNfcGVy
aW9kID0gZ2V0X2xmcHNfY3ljbGVfdGltZShjcnRjX3N0YXRlKTsNCj4gKwkJaW50IHRsZnBzX3Bl
cmlvZCA9IGdldF9sZnBzX2N5Y2xlX3RpbWUoaW50ZWxfZHAsIGNydGNfc3RhdGUpOw0KPiAgCQlp
bnQgdGRjcyA9IChTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y3MgKw0KPiAgCQkJICAgIChs
dHRwcl9jb3VudCAtIDEpICogKHRsdyArIHRsZnBzX3BlcmlvZCkpOw0KPiAgCQlpbnQgdGFjZHMg
PSA3MDAwMDsNCj4gQEAgLTE4NCw3ICsxOTYsNyBAQCBzdGF0aWMgaW50IF9sbmxfY29tcHV0ZV9h
dXhfbGVzc193YWtlX3RpbWUoc3RydWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4gIAlpbnQg
ZXN0YWJsaXNobWVudF9wZXJpb2QgPSBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2QoaW50ZWxfZHAs
DQo+IGNydGNfc3RhdGUpOw0KPiAgCWludCBzd2l0Y2hfdG9fYWN0aXZlID0gZ2V0X3N3aXRjaF90
b19hY3RpdmUoY3J0Y19zdGF0ZSk7DQo+IA0KPiAtCXJldHVybiBESVZfUk9VTkRfVVAodHBoeTJf
cDJfdG9fcDAgKw0KPiBnZXRfbGZwc19jeWNsZV90aW1lKGNydGNfc3RhdGUpICsNCj4gKwlyZXR1
cm4gRElWX1JPVU5EX1VQKHRwaHkyX3AyX3RvX3AwICsNCj4gZ2V0X2xmcHNfY3ljbGVfdGltZShp
bnRlbF9kcCwNCj4gK2NydGNfc3RhdGUpICsNCj4gIAkJCSAgICBlc3RhYmxpc2htZW50X3Blcmlv
ZCArIHN3aXRjaF90b19hY3RpdmUsIDEwMDApOyAgfQ0KPiANCj4gQEAgLTIwMiw3ICsyMTQsNyBA
QCBfbG5sX2NvbXB1dGVfYXV4X2xlc3NfYWxwbV9wYXJhbXMoc3RydWN0DQo+IGludGVsX2RwICpp
bnRlbF9kcCwNCj4gIAkJCQkJCSAgICAgICBhdXhfbGVzc193YWtlX3RpbWUpOw0KPiAgCXNpbGVu
Y2VfcGVyaW9kID0gZ2V0X3NpbGVuY2VfcGVyaW9kX3N5bWJvbHMoY3J0Y19zdGF0ZSk7DQo+IA0K
PiAtCWxmcHNfaGFsZl9jeWNsZSA9IGdldF9sZnBzX2hhbGZfY3ljbGVfY2xvY2tzKGNydGNfc3Rh
dGUpOw0KPiArCWxmcHNfaGFsZl9jeWNsZSA9IGdldF9sZnBzX2hhbGZfY3ljbGVfY2xvY2tzKGlu
dGVsX2RwLCBjcnRjX3N0YXRlKTsNCj4gDQo+ICAJaWYgKGF1eF9sZXNzX3dha2VfbGluZXMgPiBB
TFBNX0NUTF9BVVhfTEVTU19XQUtFX1RJTUVfTUFTSw0KPiB8fA0KPiAgCSAgICBzaWxlbmNlX3Bl
cmlvZCA+IFBPUlRfQUxQTV9DVExfU0lMRU5DRV9QRVJJT0RfTUFTSyB8fA0KPiAtLQ0KPiAyLjI5
LjANCg0K
