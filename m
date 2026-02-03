Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHIKOcJkgWn6FwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 04:00:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BED3F4A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 04:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7F910E4D6;
	Tue,  3 Feb 2026 03:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAcQmjGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EDA10E4D4;
 Tue,  3 Feb 2026 03:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770087615; x=1801623615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LLG3U4TPFX18DrNgXF6R9+1C5rdVlKReZEGFKeKziqA=;
 b=cAcQmjGNoj/kXF5/H/nnRVEOS1bMHAPIp1sINTBlJ2Dqz5BKqZ25FOrI
 HtJlE9dWHZrQpmNkgJL4Vtikh22/mEtyn69HMmn6p4d65+yEj/s8UhkUH
 Kslzf0P8OZ5BII+ErZB48b3KARbYHI5cba65Tn9SwGAGOHVaxZ2A0H/C2
 TB1sK5Izp/ysiwEdGhBofyX+xNiACf8/Y8JFJmV81WXlLKJX0zvshoTTM
 T8dFjwiq8BglZenXR4b7+4NmErSYri7a25UzbA2N90Yj44PEiOIxmj9/T
 E4HvEslYCzYhuNEFlvnZv8/7P8DjXn9Cq7/vcHhflz8wV+p533Y+pFzye g==;
X-CSE-ConnectionGUID: 6wfplcdCQf6HZApbrBrxBQ==
X-CSE-MsgGUID: FAC+EfqJQoafzhIxyIA8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70270505"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="70270505"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:00:13 -0800
X-CSE-ConnectionGUID: UpdWIwk2RdWnI74/mmH7qg==
X-CSE-MsgGUID: ROucArSlRDiREvcYaAGDQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240380209"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:00:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:00:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 19:00:11 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:00:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gg3BtkdFCmxTnPvirTjRCy7gkah+W5SzkxAj66MiugsVsiS69TeLR5yP5tz38UftLLBwUE/Ee5ghxJk12+VcQtTGJ6SdFXGWe7OeK4Sk6L+NUJ6ZW45efq2vrCDJsSvIkh8H/0ECjw4gxj9WOgYQdiHCSoOfzyNWJFzTkmN8FI/HKWZnDQxUPGW0JvXU8UAN/FlyIQZIn5H+VgQJPdAkDIKcDy65DB92o53hGoMgePmpzwLIrr6rL2oFxL8RODhOOBuIgNvdx0SuXCLp/4YC5aLRH76V6fETeh64QEtFiSiGFMbUCMolfmg2Rqny+3sVzCFal9Yhl3d5I2vfuzVNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLG3U4TPFX18DrNgXF6R9+1C5rdVlKReZEGFKeKziqA=;
 b=i/Y7L0K/zGnitaQC7J0iNHovVUT3Pz8gPpmPMWjrfVv6UV9zAZrtbaw8yt28BFyFJYVl7YsPqVCYQ1UFLQA4NGBbTgFrAqc5CQo4Wu+nNyCMx6x50CHiAbrrIZy2NmQrEWpAyVRxOO7J8CPvUfN/iw1Q320S/GmWMfUOA6BkFBjepJZnCFIJbGomTh5/WofUpQWEMDlHp+pfVs4H6lsq1wfn1UNcPyQ8NINY4mso6Zosg8zVSPg2sw80NAO0//Z9gYl70sGaY8lnEHcJ/S2IeLGe1IYaBjU4wO/2O6cGyqjylU+agU/jJScqvwVknkxDs8ZccK581sxIbP4Lyhlk4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB5142.namprd11.prod.outlook.com
 (2603:10b6:510:39::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:00:09 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 03:00:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Yella, Ramya Krishna"
 <ramya.krishna.yella@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v8 4/7] drm/atomic: Call complete_signaling only if
 prepare_signaling is done
Thread-Topic: [PATCH v8 4/7] drm/atomic: Call complete_signaling only if
 prepare_signaling is done
Thread-Index: AQHckP0I7p6NIK91mECwLDDmgLfM0LVwUC1A
Date: Tue, 3 Feb 2026 03:00:09 +0000
Message-ID: <DM3PPF208195D8D6FD169AD6C63951B8BDEE39BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
 <20260129-atomic-v8-4-4cb7b0faa051@intel.com>
In-Reply-To: <20260129-atomic-v8-4-4cb7b0faa051@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB5142:EE_
x-ms-office365-filtering-correlation-id: a80a44bf-60ee-48f0-3ac3-08de62d05764
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OGIyZldwV3grRlJWOVVnMFBlMmxYS3pDUkJnYkdrOXpQamozV3FRbVRCZ0FQ?=
 =?utf-8?B?NXNETm1TZzk0N3drSHVycTR3RTB4cVhIbE5MMVlVSU82LzkxUmYydHJCNTU5?=
 =?utf-8?B?ejZxYkwrM0h0cTM4WFhGMnlGSUp6RFF2cWZKZGx4dzE5Rm1JekZFWDdDanox?=
 =?utf-8?B?MUtUNUJIbmtqWURMdHBOTHdZZDNZVXdheWVKbEdQLzF6U1hOd3NaNGI3bHlo?=
 =?utf-8?B?STlVLzI3anBhN3RPWGZtL2V0UGZIelVtbVNiTE1JTjVlZllVcnhhZHpHSmZ4?=
 =?utf-8?B?OFliU1pSdzJuWm9SY2hKS2ZlazNpWDlCMXoyWTdsWkVaN0x6WWhXeGVYeUZp?=
 =?utf-8?B?VEM0SzcycU91VkdHVmp6dGFzVjhId0dNQzNZSjI3U2hxdW5RamxER0Z1NU1u?=
 =?utf-8?B?VndMcDA2bkxQdDY1S2lVb0syTGEyaWJSMW8rVDd5SnZkR0gxblhzU3kyeEtQ?=
 =?utf-8?B?M3RGM0xnblZ1TXd6RDhYL2x4V3VzMW1oakVHVHVEcEsyM3htd0ZpKytqN2VB?=
 =?utf-8?B?SjIrNS8rbnFQdVVoTndsK1VHQTBZM3Y4Z21FSklhV25DWnNaZG5vcWFjelI2?=
 =?utf-8?B?SDZybkE3Wjd0bkthL0kzVlE1bFJaSFVnUWdZYm5FcW1PdXVCT3FaTGZsakVK?=
 =?utf-8?B?b1prSGZpeXR4RXdlckpQQm1vWTlLSlpRYnhFRzhnWnBUQS92aXpEdHZVb0h4?=
 =?utf-8?B?a3Q3aXoyejZLUWFYcDVUV3FjQVhVcHJPb3RNOFpFU3gySmVsdzU1V0NCM3gx?=
 =?utf-8?B?TENyR01vVFJZRVR1ZGs3Mjg4NmI2elZjRWRpU0RBWWt1cWxrV0J2YkVybXNF?=
 =?utf-8?B?T1libXMwTk40RHRPWW5sL0pFbStGOTJYYjFYdVFsNDVpRG9JWmwvalpaTWlB?=
 =?utf-8?B?cDZhZ3JkL0RSNTUzMmVkWWFmTmVyejJyTkxhL2pkb2Nha01MZk93VjhYR09D?=
 =?utf-8?B?THgxOUtZM0lwRGdiQ04rVXc2NTBvVVI4cVpmUDlkOVltbVUwRkt3eTNHSWJi?=
 =?utf-8?B?dTFQMzBwazBSOHZTQzk5UmljUmhTYWUxVkw4ZTFRUzYxd1JWdDVDaExBWEdE?=
 =?utf-8?B?ZXh2enc0aUt6eS85eW5iaDl4em9pTzd3bzNkaFhOeFhqRU9SbDdvRnNhdXpm?=
 =?utf-8?B?S0ZoQzNDeVZJaXdVZEtKQko5RnUwQmtCQkhQbWRGVUliTVRFbjdibGFEcHF5?=
 =?utf-8?B?cnNYWG44TlJDTllYblltZWs3amlOdDFNb2l3U2pWSW9jeTBYSlNGVEh6KzdR?=
 =?utf-8?B?a3BHSlE1K3N1L1BMSmVGY2dkNmo1MUYzamkxVU1kbDJHc2lOOUlUa1ZzQW52?=
 =?utf-8?B?blhlcUNTRTJCQjcrVGxZeFhQaFJwbGZ5KzlRY0VqdDR4VnF5YndSaEEzVzZw?=
 =?utf-8?B?WU1sMUJnTHRxU0ZMbHk2RDJYTkp1ZVAvMm1ONGdUbndmQzlUSXRkM3BiR1p5?=
 =?utf-8?B?cGt2aWFWa3NQZ2F3VUpHcno1Rk80VEs0RzMvc3lkQW13eGExMEtNMjNWNWtj?=
 =?utf-8?B?NXB0aTBVdml1OUlNSXhFSHI5R1VybkQyWkR6QWdCSTd3cGwzcG9xSURiY09U?=
 =?utf-8?B?cU5mVXpkOGtNcjVZSTI3SWpsemFHZUk2Rml0SVRLdmx2d3VQdDFyT3U3RWpD?=
 =?utf-8?B?NVR5UW1RWUQ3aVZSZUl1YVVRcWtseVVmcmM0TXNOK0tvSlNJdjBuc25iLzRW?=
 =?utf-8?B?ZmpPNGltSnlORmJSL2x6eU15MlB5MDd3TlJ5bld2eVVLc0NPNVBVTVRrOTFw?=
 =?utf-8?B?NnU4b2haTmczWXg0Sk5ZeldNUmc4emlsK0N3UkJnZGVEVklWNzNlbXNEMWRh?=
 =?utf-8?B?Q0JLLzFDZDBEVTMzTEhVZk5saXRtdEpKY3dGbVJPaVp6RGlhNHB4eFRhRHNj?=
 =?utf-8?B?SHE1TjQzakdXRk9FcjFnNm9zSnBvdDdaZEl5bVRXRStRa2h1TVdHNjlhell5?=
 =?utf-8?B?OEp4ZmQvZ3U4MUx4ditLaWppMWtqMGJSR1J0a3FCMWwzTSs4a0hPYnhjbXBa?=
 =?utf-8?B?KzJYNUUySUNHVk5kOW16Z1hldm5vUTE3SG8wajQrSWVudkxIbWRHOXBNQkRP?=
 =?utf-8?B?RWhLYk1od1NwQ2lFeE8yaDdQRThKZ1AxVzU4dUlXZFE2U2gzNDlHTnRyMzB5?=
 =?utf-8?B?K1BPVUFKMXZMdzhEdGlZSXdCNGdLckozQWl4ZUp6b2pDOE42RmNKL1grU1JW?=
 =?utf-8?Q?IAMgM0R8uOAte5FldVANsE/xzuJ/KVGafj2WVrhYRKTd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXNIWUtaYlFIaWZTeXU5SUZ4RUpvSlNlR2hGa2ppeXpFd0hNYmFIRWNGbnNZ?=
 =?utf-8?B?bUtvZG9ZdkpTL2w1M3NmZGJWWmw1QUZpNkdmem5QTTB2WTF0Qm1oQ0locDkw?=
 =?utf-8?B?NytNRFAxK3BoakZvVWE4bHI3emY3UmFFaG9Na0dWOWpTOS9IWlNWT2pobGRz?=
 =?utf-8?B?UXdNOVBlRGoxYlUxa2tmRzlOdkVoNHVUcFhUbEQrTTdITVVaQW5ocHA3Wm1U?=
 =?utf-8?B?ZjErUkFjc0EwL3lGM09BV0UxU1pidUtPalo1em1CUmlyL1hjSXJhS3lBUGFq?=
 =?utf-8?B?L05heVV5N3crR0ZqcDd3WitHWjJOR0lOS05pc0ZmTTloOVdNUDBlRnYyZUNn?=
 =?utf-8?B?ekR4YkFyaGcwQUUyMzZ5a2l1N0VMNlpxcHRZMFpzMnVZU1YweVZNOHozRzdz?=
 =?utf-8?B?ckZqczNiVXl1ZkZzZHQwMndvc1NxR1FwTS9ZdTVzNWdWRkdVK1dJK0lDMU5i?=
 =?utf-8?B?NC9xVnZmM0k2QWZPRjNrdjUzMmFiVU80RjV2MUNCUDlmT3lycEpqTFhQYkli?=
 =?utf-8?B?QU1oa3lBK2diZWFVemQ5SjIzZDRZMFFMenBnQzh1Y2xZN1JNUXNWenJ0ZG5t?=
 =?utf-8?B?YlZLQ2VJSllnNGZLR0REVXNmWnlUQTlSejZJeDZCdm1pc1Z0NmFvU1NzVEUr?=
 =?utf-8?B?aGhSeXV6d0cyS1VpTWYrcWlYM1ZoUjVSN0Z3KzBjWXRMZ1NMT0JSM0F1VzRU?=
 =?utf-8?B?ZVRQdStlSnBCZzdGYlJPUThmck5pUUxzM0NNbnpwN292Rk41T2FGZjZFbm9V?=
 =?utf-8?B?S1dVRzErcFZQTmUrQWVvWTh2T08xZTU0eWdhWklWUGpudUhBTXpTaFNXTjNt?=
 =?utf-8?B?d0VZTjg1dzBuU2Uyc3ZCbTVKVytkOFdIWUxvYTN0S1RydU1PZGR4RGFEZkxC?=
 =?utf-8?B?SUNmWWM1WUZnRHBYbEZiYUpWZDhERkxRMHRjSWV2Q2JyYXZsUVAxZjZBa0xy?=
 =?utf-8?B?NThhaE90eHpFMlhmeTNQRnBwcGJ1S3FzemlhVURmOG96ZFY5d0o3RGswVGUz?=
 =?utf-8?B?ejRYSjlYbE1PWjlUWmhvU3RSWEVLVkx4eldhVFRHbEhnSXk0ektYY2Jua2lO?=
 =?utf-8?B?d2hFc25iMzJXdGN3dmtiVzF4WjB0VHUxeTlNSkJPcTZrczJRang1YTZ3MmFs?=
 =?utf-8?B?KytyZjhOTFc3TmRPTUVZd3ZmWWpEdlozOHJUellzR3pPWUVFSUZnbC9VcVB6?=
 =?utf-8?B?a2VrWllqMGxoc21IZ0Q0N1FkVW1FelNCN3lYZGRMTDVwZ1Y5MjgraTN0MmN1?=
 =?utf-8?B?ZTA4cWxCeERJVGpnZzcxdkY2TnB4MkFZUDZ4QnFoRStwSXQ0Y2txODJ3bW8v?=
 =?utf-8?B?QW1rd1RkcmovaVR3QmZ6c0VwdUd0RnJyODdYQVZhY2ZvZ21vdWEyTlRkMDli?=
 =?utf-8?B?NWhTc3lNQzBlcVlzSUNQVVRzSkZHQWVXeTRibkxQNG1xK1hMTE8yQzhNcjJG?=
 =?utf-8?B?ejBnTU53d2dyRVJWS3R3ejhPMjdQQ0psTkE1d0tnOGVmMkNOclZ5TXJFa3BE?=
 =?utf-8?B?RWRaaHpZUUxVZTVHbVdudmcwUmNGYVlvZjRxT2Q1d2pDYVJJNm5jWUZpeTdr?=
 =?utf-8?B?RE9majl1MmE3VVhBWjBEbitUL2VRRWNyZDFBc0d0TndwdXAxdTZGZTlMdzZs?=
 =?utf-8?B?ekVKemhqcURBNy93cWk0KzFYWVByemZYbDNaT3czdE5kK0RxN1oxV2NpUHV4?=
 =?utf-8?B?dGpRekFjSnZPOGFnR0ZyR1kzRUZFb0JyVnppMUMxOS8yWmYvL2VXYXBmVlpw?=
 =?utf-8?B?WnB0SEFHVmRiV1NYRXdRWkRxdUFxRXJSRUFJbjB4dlp1T1R3VGt6T1lORmpH?=
 =?utf-8?B?NEFqL2NFbEsyanE4ZXhJM09rMnRQQ0taekc0dVh0dDEwSzBGVXo5U0F4TFk1?=
 =?utf-8?B?Wjg4NWFFMzdodTFpcE9MNjhPMUZIMVBSNk9IRHFGRXVGdFlGS01QY2VZcyto?=
 =?utf-8?B?VGNPOUhGc25jdTBUaVQ4bU9MNDh3bTUrczNnQ0RWdEFaSlEwVXpkamNDSldp?=
 =?utf-8?B?eHFUcm9SeWQ5dVl1RFVVOXNSVU5tblM1QldjVEFFamRFdk9KYU51emlKRXpa?=
 =?utf-8?B?dERUSlplUThCY3ppemFTTlJYZ1YxMmRzMGNoOFF6YnlTbldvcFprVmtXU0tR?=
 =?utf-8?B?UUFhZEZIS3ZuRkNIemtscXluTXMxQThNdmFCTVhlbWJFblp3VGk1bzdjSDAx?=
 =?utf-8?B?U1hyV3N3d2tVbEhLZDhOemVRckNmc2ZOM01CM210cHdwWVBnV3NSOUZrbU5G?=
 =?utf-8?B?VlpGdlVhZTRXdUkrT0RsdzIzcGVMR3FnWnVHMmFPVEQreENUVjFoUVh4Mmpq?=
 =?utf-8?B?aEdiZzBKWUtRK1RKUjJEaGk1N1FsOWRMcFl5aDJqd1JlWlRVVzBIZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80a44bf-60ee-48f0-3ac3-08de62d05764
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 03:00:09.1766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Wxku5R55AperL/N3nX+RhNotItdOOgnyfeFgdUQS0IwlYVaZF+Vtd3MEz2tiAmDOJxcPnhbdBaW6BaspNszpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DM3PPF208195D8D.namprd11.prod.outlook.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 955BED3F4A
X-Rspamd-Action: no action

PiBTdWJqZWN0OiBbUEFUQ0ggdjggNC83XSBkcm0vYXRvbWljOiBDYWxsIGNvbXBsZXRlX3NpZ25h
bGluZyBvbmx5IGlmDQo+IHByZXBhcmVfc2lnbmFsaW5nIGlzIGRvbmUNCj4gDQo+IFVwb24gcmV0
dXJuaW5nIHZhbGlkIGVycm9yIGNvZGUgb24gYXRvbWljX2lvY3RsIGZhaWx1cmUsIGNoYW5nZXMg
aGF2ZSBiZWVuDQo+IGRvbmUgdG8gZ290byBlcnJvci9vdXQgaW4gY2FzZXMgb2YgZXJyb3IgaW5z
dGVhZCBvZiByZXR1cmluaW5nIHRvIGFjY29tbW9kYXRlDQo+IHJldHVybmluZyB0aGUgZmFpbHVy
ZSBjb2Rlcy4gQXMgcGFydCBvZiB0aGlzIGNoYW5nZQ0KPiBjb21wbGV0ZV9zaWduYWxpbmcoKSB3
aWxsIGJlIGNhbGxlZCBhcyBwYXJ0IG9mIGNsZWFudXAuIENoZWNrIGlmIHRoZSBmZW5jZXMgYXJl
DQo+IGluaXRpYWxpZWQvcHJlcGFyZWQgYmVmb3JlIGNvbXBsZXRpbmcuDQoNClR5cG8gaW5pdGlh
bGl6ZWQqDQpXaXRoIHRoYXQgZml4ZWQgTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFs
IDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBS
IE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfdWFwaS5jIHwgNSArKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191
YXBpLmMNCj4gaW5kZXgNCj4gMzA0MmU2YzI2MTZmYjA5NDAzYzEzYTg2MzBjODgxOWEzOWNmNTVk
NC4uZGFjZGZjMmY3MDZhODhlOTNjYWI5MjRmYjk4DQo+IDhjNzYyOTA2MDQ3ZGEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gQEAgLTE1NjksNyArMTU2OSw3IEBAIGludCBk
cm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIAlzdHJ1Y3Qg
ZHJtX21vZGVzZXRfYWNxdWlyZV9jdHggY3R4Ow0KPiAgCXN0cnVjdCBkcm1fb3V0X2ZlbmNlX3N0
YXRlICpmZW5jZV9zdGF0ZTsNCj4gIAlpbnQgcmV0ID0gMDsNCj4gLQl1bnNpZ25lZCBpbnQgaSwg
aiwgbnVtX2ZlbmNlczsNCj4gKwl1bnNpZ25lZCBpbnQgaSwgaiwgbnVtX2ZlbmNlcyA9IDA7DQo+
ICAJYm9vbCBhc3luY19mbGlwID0gZmFsc2U7DQo+IA0KPiAgCS8qIGRpc2FsbG93IGZvciBkcml2
ZXJzIG5vdCBzdXBwb3J0aW5nIGF0b21pYzogKi8gQEAgLTE3MjcsNyArMTcyNyw4DQo+IEBAIGlu
dCBkcm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIAkJCXJl
dHVybiAtRUZBVUxUOw0KPiAgCX0NCj4gDQo+IC0JY29tcGxldGVfc2lnbmFsaW5nKGRldiwgc3Rh
dGUsIGZlbmNlX3N0YXRlLCBudW1fZmVuY2VzLCAhcmV0KTsNCj4gKwlpZiAobnVtX2ZlbmNlcykN
Cj4gKwkJY29tcGxldGVfc2lnbmFsaW5nKGRldiwgc3RhdGUsIGZlbmNlX3N0YXRlLCBudW1fZmVu
Y2VzLCAhcmV0KTsNCj4gDQo+ICAJaWYgKHJldCA9PSAtRURFQURMSykgew0KPiAgCQlkcm1fYXRv
bWljX3N0YXRlX2NsZWFyKHN0YXRlKTsNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
