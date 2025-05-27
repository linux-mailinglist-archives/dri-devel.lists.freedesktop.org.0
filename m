Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC21AC47FD
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB72410E1D5;
	Tue, 27 May 2025 06:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE/53j1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6540E10E086;
 Tue, 27 May 2025 06:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748325626; x=1779861626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r4AjzgjHU8R6aDlRaWrkXApC8+PwZ50CPTK2OmU2Lac=;
 b=bE/53j1PJs/B6t/0XavoqCII2GtHYormoLbzBGdEB3yPT1ev1JTfm0zo
 j8Kosry7O0eQbJTXrMtCCd6pDp6rzPoopTQQnUMJOD2fQ0hrScYCBvt6v
 kMwEGgPKTv63edU6dqWQyxG8Xf4gKUnTQwEQAvDUOQcPAgoWv2R2p3OGA
 oMzz9HYKjsn70kLFqDrv6qLjJfVQjFELpLaaY1iLSaNdgBy5bn6wI3gCu
 7y9JlnUYb+QEo/5qvDA+clckPODDeApxyQcwtEta7eS5EOgqYLbXfY8bV
 4HAUp8/KbLzz/LovY9gFMbKAC/4x/hEc3/fylRDRlPTPxQT+WV1KruXCG g==;
X-CSE-ConnectionGUID: YMggeLNIRx27x8zH+NLonw==
X-CSE-MsgGUID: GYWmuG+KRaKxr5HTwmMNYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60550489"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="60550489"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 23:00:25 -0700
X-CSE-ConnectionGUID: xLVKQJyMRDe/3G4yBmwCyg==
X-CSE-MsgGUID: y8527zSkQveFuc3E6pJIjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="147675897"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 23:00:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 23:00:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 23:00:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 23:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeBpTRPJQTTQILJSJnT7GRdT2ebisvygUaA8jO9e/HRBx3x+wmzYVZ67armfDG38CDiZAJ3BIafKnTwKs5Dg+OyZY5Pa4XqKk/ctzgRo2V0azFO1oHTfAFeSURWkc44wiisq48RMU2IKN0he1/AO6zS7uVeJht6OJYkJJhCu3lnFwH1rutSBhNiLBeIPZB+hTro3tgiX0EwG6zpQ249jLApgDKa/XnSJsod+ZygzcP8XQGrXuvtWj1UfyOj4Cw69aTnKsFv2z510BdJqfbJcRffxN3Ofy5HL1ZtPNHThOwKVD+lnEAbuGW/zP/eDyytlzmEvqWQobzwQVkdlfjpIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4AjzgjHU8R6aDlRaWrkXApC8+PwZ50CPTK2OmU2Lac=;
 b=s4k/JIX5cFXzIvm8sUcFrN7H7Cw3A5qyegfLVTprVHgNJNUlu53fbDH1kb12bqAaOS36gbQ1B4e4qnQDnyo1+gm1xRgJ2OLyf1/z5Xac0GWgd11GHFw3hMaXJc9bb4wRmFgAGYW7FJBucnESmNl6e6NakZt5zBDYyBcREFoLEcORvK994mrsj21zMiIPKVUmMQgF1ntJGXpVoxswlgs/dL5uSinSomvbghry6c9ey/Du6PvNHIKFKKqEtEKdUbOkdpTyveWTUDorMRmPlQCkqnakqOM/BZc3M/ygiDyKEM2THQi+8eudoq8qAyuqLNcSnVQ2PRoVNhvP1jYRR72LZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 06:00:20 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 06:00:20 +0000
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
Subject: RE: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Thread-Topic: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Thread-Index: AQHbxaAYsfXeRjkanUq+gmwHohKWMbPhn5sAgAG3RSA=
Date: Tue, 27 May 2025 06:00:20 +0000
Message-ID: <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
 <aDGdWof1HfViERND@black.fi.intel.com>
In-Reply-To: <aDGdWof1HfViERND@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB7513:EE_
x-ms-office365-filtering-correlation-id: d0be2854-2355-493f-01ae-08dd9ce3c33b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUV6U0s0TXhRQS9CN0J0bWhRMkNmcm1McTByaUdwendKN1V4YTlHSFowM3pV?=
 =?utf-8?B?dDJ4YXRyUTRjVzBLdWJzRGx6K2JHVGFneC9kTTBsSDVPeTRyTGxTVDVhNkk2?=
 =?utf-8?B?R3dtMnNnVDI3ekcvRW55eURrWUUvMkFPVmwrck8reTBEZTdFVlFsaExjdzhM?=
 =?utf-8?B?MDd1SERRclBXZEZTVmg2ai9kc2pWZTFNY1hhbkhjRmJqb2crWnFhY1lTc1Zq?=
 =?utf-8?B?amZzVUcwbXM0cExyOWd3NFVlZ0MzZk9LcXVxU1Z6UFg4TnJ2RlFtSmxXNHp1?=
 =?utf-8?B?K2hMUWgxQVgwdVdldEJOQ2lVSFdkYWg5dHVRc0ZsdTJLd1dqQXNrMVpIUG1K?=
 =?utf-8?B?ZVZxQ2VROU9GSmZLNHMvSVVQa24xRmU5TmVFVktMakpHOHBPYzhsSVBZcnVy?=
 =?utf-8?B?V2lwT2JuUC9OWlVMN1RKZlowYm42amNtNjhqeWtzUUNXd3NqN1MvdG5yTzkv?=
 =?utf-8?B?Mk0yQWVZWlhkaXc0Y0QyNVNXRFdVT3VyRGh1NHllNVYxdjZpMkR2ZTlsVGRn?=
 =?utf-8?B?cjNlYTUwekQxeFFPWWk4MVFxYyttdUgzOVlLU1duUndlLzlxajJPcGdieTlW?=
 =?utf-8?B?U2xhTmVycTNxUXp4N3NmZ2UwSmN0OENIb0ErYTVhWE40L2VIUlZQd0l3b21N?=
 =?utf-8?B?OENpd1VXbWVTUWpjcC9tbmpmRWc3SjFtdFI3RTQ3TEVMbGNjQ3hac1VCV1ZU?=
 =?utf-8?B?R0RvVkVWTHFaUm44ZUswcUc2M0FhV0ZPZ2ZxSmxFRGFRazF0T0NWRUpmTVRT?=
 =?utf-8?B?bnpDd1c5V3lQb3NWZDZkZjltcTNrcTVuMkRoNzFGMjdEVmsrSGp5SlpueFBn?=
 =?utf-8?B?RXMxZkllaTlkdXdadmRGZFRpUXF6TkVSUy90d2E4T1RlVW8wZkJXUmtFVDMv?=
 =?utf-8?B?d2doQW5wY2Y3WnAxZGNvdGh1RzNSZ3IrajdOZXN4N1FLNFNqRjhWSnBwTXU4?=
 =?utf-8?B?TU9LU1MrRlhiRkVjR09VR0hKUm9IcFc1cTBNeHh2MVJTRVBoS2J6TFVRekw3?=
 =?utf-8?B?SnRtZ3RpTmNlek95VEx1UEpoRnhla2NlWFRqb0l3THRyMWc4ZWZ2ZlIvNmpJ?=
 =?utf-8?B?dWttQUJQbTIzOEJCcTRSWVhFMHBPRytMZFB0UktBRDI2R1Rmcnh1YkNkK2pM?=
 =?utf-8?B?V2xTNjFCeFB4TmxDbFE1dDI3TXlmVVZJMCt2NjlFNlV5MDVwYXVjY2NEam1h?=
 =?utf-8?B?dWI2VW5zU1ZlVVNKbDdMTWVSalUwMXBneEpTeFZkWXJjRTNneUs1YzU4alNw?=
 =?utf-8?B?SmpQTE1uU3lxa2p6a2Qxalg0MHJoQUMySDRlQUVkcW85UXhtR3Q2a1QwUG5N?=
 =?utf-8?B?QlRPenE1K2dlWlBPWFBUYWFIa29xT3FCWDZVc1hHSjJBVUY5dnFsYklVUzVl?=
 =?utf-8?B?azB3S3VnZnl0c1JSNVJJek9rQkFUSkhDSit2VWNIamZzN25yVk9xZFJUMXRk?=
 =?utf-8?B?VXBwdjdIc3ZlUXdoMisvekVUSmgrRjRCNUNjSnY4dUVRV1NGRjI5NFFrTG9J?=
 =?utf-8?B?R2tHRUNqL1E5MWVRS0VYQlNjdjdldlZybldlRjFkckx5SEp3TVlhZ09OZFdO?=
 =?utf-8?B?amRWUU5BbjIyNXFpT0xnYy9uQ09xbVVDYmVtdkFzRzdEcjFhK0JoSTVaNVhC?=
 =?utf-8?B?K1JTS1JFQTRWc2RRQWdUYmNOSllHV2lxVE9BV29CNDRxRTY1RGNZREZtRDdQ?=
 =?utf-8?B?ODZlTUN6a2ozb2d2eTlmQW5YYzVoWGhBaGsvdnNsWTF5WVAyaGVYQVMxcWNj?=
 =?utf-8?B?OUtxRWNvQlFRa1N0WXVPZ0xYQW5vckxRc2VHVVRqN1p5aTh4NVdsbU9GRkt1?=
 =?utf-8?B?ZnlRS3pLTXJUenBZZXlXbjVmU0tCbXN6ZWxaYXdHSmpCQmgwYXhpWS9yWElt?=
 =?utf-8?B?cmtkeUN4Um1JdVEvbkQyVkx3c0VkQU5IalFwamRoZVBrOW1wdkxaWmwxV2g3?=
 =?utf-8?B?T3VXKzgyeXNVZXV5UG52OUwrT3VncUJ4dHJDMU9UUFVXKzNVWkd6QW1laUJ0?=
 =?utf-8?Q?JHJO+PNUqUIKc3OXfCpXjSqwKS3YmQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTMxT0ZWVzB0NENpdGhVaWJiZlBDNWFWcVZTZWUvN0k0TU9GYUpLaFlLSWQ2?=
 =?utf-8?B?U3R4YzhtRUpzeHR6VXF0cjBFMVhkMUgyWlFPaVNhRmxQUTcvRHlnbEdBeTN3?=
 =?utf-8?B?WFJJaCtFV3o2dklocnJua2ZOaTJPS3hnUTRJSHdkbmF1cHZCYXlVZUlTQmUz?=
 =?utf-8?B?S240Z2pOSG11aEdqNnNYNTFneW9IVVJIdDlFQXlGdmUrTWk5cnBOb244Q1Na?=
 =?utf-8?B?NkpCOUdDVU5hQ25vYkY5cHhMNWVVaDdoSXRZcjJZOEg5MDFCRysveDBMb1NL?=
 =?utf-8?B?aVozSGgwT2xhakg3d01RbFM3dXpjS3JPOHRBZjRrbHVaSk45REFrVTF2VGZv?=
 =?utf-8?B?NXczK0RlRzY2LzNWc0ZyZkZ6c1B6Q2Z6UUhzMCt6WVllN1Rsa25yR2FKVGRO?=
 =?utf-8?B?azlTcUt3Mk5IWXF5UmwwTGhyNDcrN3VzaHB0clhJRDZVV0dQRGV1TjVibWlM?=
 =?utf-8?B?UEUydnhQNU5qZDVBTytpUFljaFFBSFI4NzVITk9FcUFUb2hERXVkbDI3MTYr?=
 =?utf-8?B?aDA1eEhKRHFUY29zWWtVcDhCMzl1TjZXTGVYU2pudmV3elNWVnRDU2RUeWNk?=
 =?utf-8?B?bko0K2FOeGhjUFErNzRtblhDREwxbDU3ajgvcVNYTENvZ3NqQkEycXZtWjd2?=
 =?utf-8?B?Q2FWaUtSd25oQUxjMm9mc0NZTjE0YkxiRnYybktEVllBUkVEREJhT0Z0VjZl?=
 =?utf-8?B?N1FRMCtlbGhkL2V0Z0ExWFdZdkpZUkVSN3lucmQ3MjIycVNkL3hrdVAycU1m?=
 =?utf-8?B?SHdGVEN2UjkxNUk1a2FUazN1dC9ZejgzN2plOG1MV0RLMDNFL1djdXhtdjJW?=
 =?utf-8?B?QSs1SUE4WThySTRLZld1VmtwU3R4Z1lLbUxTT1lSOUFiRjRFWFNmbHNMUHh2?=
 =?utf-8?B?cHN5cTZLYzYwaDVSQWlickMxczJLZXFTT2RpUnc5UHBBZUkyQXBWTDRzNS8y?=
 =?utf-8?B?bnY2dnI1dG1mMlA2SmFDWWJ1bjFVcHZUNGlMd3loSmNDak1WM3RqQjFld0FW?=
 =?utf-8?B?dEVLdlNCVjNSTFZrSXk5NkxwMHl3VXBqQWE0b3l3d2dZTHBvVllTb2kyM0or?=
 =?utf-8?B?TTRzS01WN3dFWTBRK20rSUJQa2pxSU9HKzBmQys0aHE3MHJvYVBZMm0yOGNm?=
 =?utf-8?B?OWptMzNIbWVod0lYc1IyMkd3ZE5IL3o3WUdzbVZRaXNCaGVWNVp0d1RFRU92?=
 =?utf-8?B?Vm1yZnlwRFhRekZTeUFsR01YY0xFNmhNbzhQOUw1aURQZWovMmtISFJyNmFL?=
 =?utf-8?B?VlYxMXlSSTZteHNHNzV3N2JQemRIeUV0YTV3dGRhRzFaSWlZeWdMMzBZTVVs?=
 =?utf-8?B?NEdHdG9ZUEhTVVkrUXV5R1VSL200empzU3FoZEl0dXE4dmpBS0M3R0Y0L3BF?=
 =?utf-8?B?Qkp0NC9OenVlZVluRERqSGtzK3l0WUtjMG56bHZRc1cxQkVsSmdOek9pN1kw?=
 =?utf-8?B?MU9tdmN6RHlCaUJLcmtuL2FGcTlxbHpMQklVdm01Y1crUHFkcWJ2MFNrbUZJ?=
 =?utf-8?B?K01VMGZLSXZDMmxlNUdXZXNwcWxiSEhwWG1ra1V5b2pkMTNEKzhwcmI4d0F4?=
 =?utf-8?B?US9rMWVMSTZQaTNoZWsxWmVISlBZT3JQZmVJQWZlNWlwUXo3QS90eUU5ZFlk?=
 =?utf-8?B?d1ZvTDBVUkhuRG9DQ0I3YjhaRFUwc3hzL3ZraDZnR0F6WnMrTmJMbDg1a0xQ?=
 =?utf-8?B?MFV4cHRVNWdGbHk2TC9QdU90QlVEQ1BYRUd4aUZSRlJaVVA4QlNIdjdTNGJI?=
 =?utf-8?B?eGg3MktxbTN4UnI0MUJJRGVCZkExcnRDQU5QNWNXc0pzWStXY1lGdWc3MHpO?=
 =?utf-8?B?Ryt0eG12Vkp0azNaaXZsWkEvQmhiOXRKVGhWYnZTMGFXY3F6ei9Fc01yR1di?=
 =?utf-8?B?QXVJTFd2Z1VoY1J4TloycTJ4QnFDZTFTYWYwak1zWmJIdkYyc1RZakwvSGI1?=
 =?utf-8?B?dDdueFR4SDFFTTlOdXRWTElEb2FzOWxDRndmWUZKa0lrMlVwb2RjWERvZDlW?=
 =?utf-8?B?cElJaXJqT0hQZEw2NlpwYjlja2pDMUNwYWE4b3U4V2c3bm0yNHBHd1FKZ0tG?=
 =?utf-8?B?ZkhPYVNLQ0pFeHV6N3NNaW04MlliR1ovdVBUTitaMllzVHdnWk5qejdRMGEz?=
 =?utf-8?B?YSttRHV1bDNubjNWRVZvZHhlUzVDektKZC80V0xnazJiaUlFVWRkakVHYVRs?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0be2854-2355-493f-01ae-08dd9ce3c33b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 06:00:20.2904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Zjjz2O6XlnVz2myHjPsIT4asahYyBf20EVX9Ml5DQqPfPjlEoEb9BZgoe08leeKmkO7FRfhX677eaAfZG1VJ57nJF0hXrI4K3E6S+dIc0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwNi8xMF0gZHJtL2k5MTUvbnZtOiBhZGQgbnZtIGRl
dmljZSBmb3IgZGlzY3JldGUNCj4gZ3JhcGhpY3MNCj4gDQo+IE9uIFRodSwgTWF5IDE1LCAyMDI1
IGF0IDA0OjMzOjQxUE0gKzAzMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IEVuYWJs
ZSBhY2Nlc3MgdG8gaW50ZXJuYWwgbm9uLXZvbGF0aWxlIG1lbW9yeSBvbg0KPiA+IERHRlggZGV2
aWNlcyB2aWEgYSBjaGlsZCBkZXZpY2UuDQo+ID4gVGhlIG52bSBjaGlsZCBkZXZpY2UgaXMgZXhw
b3NlZCB2aWEgYXV4aWxpYXJ5IGJ1cy4NCj4gDQo+IC4uLg0KPiANCj4gPiArdm9pZCBpbnRlbF9u
dm1faW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkNCj4gPiArew0KPiANCj4gTHVj
YXMgcmVjZW50bHkgcmV2YW1wZWQgeGUgZHJpdmVyIHRvIGFkZHJlc3MgdGhpcywgc28gbGV0J3Mg
bm90IGhpZGUgYnVncw0KPiBhbmQgcmV0dXJuIGFuIGVycm9yIHdoZXJlIHBvc3NpYmxlLg0KPiAN
CkkgY2FuIHJldHVybiBlcnJvciBmcm9tIHRoaXMgY2FsbCwgYnV0IHRoZSBTUEkgZmFpbHVyZSBp
cyBub24tZmF0YWwgZm9yIFhlLg0KQ2FsbGVyIHNob3VsZCBpZ25vcmUgZXJyb3IgZnJvbSB0aGlz
IGluaXQuDQoNCj4gPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihpOTE1LT5k
cm0uZGV2KTsNCj4gPiArCXN0cnVjdCBpbnRlbF9kZ19udm1fZGV2ICpudm07DQo+ID4gKwlzdHJ1
Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldjsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+
ICsJLyogT25seSB0aGUgREdGWCBkZXZpY2VzIGhhdmUgaW50ZXJuYWwgTlZNICovDQo+ID4gKwlp
ZiAoIUlTX0RHRlgoaTkxNSkpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCS8qIE52bSBw
b2ludGVyIHNob3VsZCBiZSBOVUxMIGhlcmUgKi8NCj4gPiArCWlmIChXQVJOX09OKGk5MTUtPm52
bSkpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWk5MTUtPm52bSA9IGt6YWxsb2Moc2l6
ZW9mKCpudm0pLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghaTkxNS0+bnZtKQ0KPiA+ICsJCXJl
dHVybjsNCj4gPiArDQo+ID4gKwludm0gPSBpOTE1LT5udm07DQo+ID4gKw0KPiA+ICsJbnZtLT53
cml0ZWFibGVfb3ZlcnJpZGUgPSB0cnVlOw0KPiA+ICsJbnZtLT5iYXIucGFyZW50ID0gJnBkZXYt
PnJlc291cmNlWzBdOw0KPiA+ICsJbnZtLT5iYXIuc3RhcnQgPSBHRU4xMl9HVU5JVF9OVk1fQkFT
RSArIHBkZXYtDQo+ID5yZXNvdXJjZVswXS5zdGFydDsNCj4gPiArCW52bS0+YmFyLmVuZCA9IG52
bS0+YmFyLnN0YXJ0ICsgR0VOMTJfR1VOSVRfTlZNX1NJWkUgLSAxOw0KPiA+ICsJbnZtLT5iYXIu
ZmxhZ3MgPSBJT1JFU09VUkNFX01FTTsNCj4gPiArCW52bS0+YmFyLmRlc2MgPSBJT1JFU19ERVND
X05PTkU7DQo+ID4gKwludm0tPnJlZ2lvbnMgPSByZWdpb25zOw0KPiA+ICsNCj4gPiArCWF1eF9k
ZXYgPSAmbnZtLT5hdXhfZGV2Ow0KPiA+ICsNCj4gPiArCWF1eF9kZXYtPm5hbWUgPSAibnZtIjsN
Cj4gPiArCWF1eF9kZXYtPmlkID0gKHBjaV9kb21haW5fbnIocGRldi0+YnVzKSA8PCAxNikgfA0K
PiA+ICsJCSAgICAgICBQQ0lfREVWSUQocGRldi0+YnVzLT5udW1iZXIsIHBkZXYtPmRldmZuKTsN
Cj4gDQo+IFdoeSBub3QganVzdCBwY2lfZGV2X2lkKCk/DQpXaWxsIGRvDQo+IA0KPiA+ICsJYXV4
X2Rldi0+ZGV2LnBhcmVudCA9ICZwZGV2LT5kZXY7DQo+ID4gKwlhdXhfZGV2LT5kZXYucmVsZWFz
ZSA9IGk5MTVfbnZtX3JlbGVhc2VfZGV2Ow0KPiA+ICsNCj4gPiArCXJldCA9IGF1eGlsaWFyeV9k
ZXZpY2VfaW5pdChhdXhfZGV2KTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkcm1fZXJyKCZp
OTE1LT5kcm0sICJpOTE1LW52bSBhdXggaW5pdCBmYWlsZWQgJWRcbiIsIHJldCk7DQo+ID4gKwkJ
cmV0dXJuOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldCA9IGF1eGlsaWFyeV9kZXZpY2VfYWRk
KGF1eF9kZXYpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRybV9lcnIoJmk5MTUtPmRybSwg
Imk5MTUtbnZtIGF1eCBhZGQgZmFpbGVkICVkXG4iLCByZXQpOw0KPiA+ICsJCWF1eGlsaWFyeV9k
ZXZpY2VfdW5pbml0KGF1eF9kZXYpOw0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArfQ0K
PiANCj4gUmFhZw0K
