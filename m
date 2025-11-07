Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE91C3F2AB
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 10:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FA910EA4D;
	Fri,  7 Nov 2025 09:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsVSdH5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7A10EA4C;
 Fri,  7 Nov 2025 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762507976; x=1794043976;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KJ8ZSbbqIKaxgwZR8sSKgaRXeQcqHXBXTawXqAVLLF0=;
 b=GsVSdH5qyb9wO/OAc5c8fF7yQHDPAvzch4zMBU84ZclFAG/ttnT1lXwA
 KzxApxj54l6WK7wRry2R02ywzjJmfYNrGUWlC04A1oMOfAzhNMgWljn1c
 icoS4rtEpZVGzB3lyFy/LWa1VlrAvT9yUcBUm8xGWB4sELBpobA0Uh6mM
 0GgE3Gj3L3AWWd/Iqr0Medw9fTPDtSqB+SlbNMlIoLkafz53wE+c4Ek0Q
 Ya0n4nDLqzkIunoCUqNjhjeOuDm+EtmDrnFdpepMeusprcAOPbi99tXSv
 YjcI3qS+MgSRgCQFeZFpmgTCBTk0hmmaQsFagXnV6I3G93C4x/2Ej5LBq g==;
X-CSE-ConnectionGUID: 7GHSVy2zRM64IQ6Qq4kN8g==
X-CSE-MsgGUID: 0Dku2t0dSnaROOXiLDgEOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64572430"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64572430"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 01:32:56 -0800
X-CSE-ConnectionGUID: XBtKHE70QaSv3MkDIHxbJA==
X-CSE-MsgGUID: 0qU7qgskTGKijeJWSKJkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="218650620"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 01:32:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 01:32:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 01:32:55 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 01:32:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzD/cCuGZZxjePROwcQ3t80lsPq/mh1v/0AZldKLlrqgQtWZc4t9ZYqZQQp2gEjsQfCSCORBx/uWGCKHFESPhC2G1AXH3kEhmbZshhNtJmf2x0TRe0nM4ih6nfgBLlFkce9l/Nv+NaoDPLmLo+rcYQjf2/VhUpt6tuoaPvUdJ9wUywBegZIUGhMiMco/0jg4QZgyMjiXIxm6201eqvnFOUh850vy1FiuaWFWCZmmV6eBOQScvFe1AKeE+LxFzJe37LlqixYr6oOFS1NgKKgkDPTogquABgxmNp/7awwzWsUHD0Ug4mEt6T/e8aoVQP8ooP0GsSk5cC5/eTtCwmYbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ8ZSbbqIKaxgwZR8sSKgaRXeQcqHXBXTawXqAVLLF0=;
 b=V2hsb2R8BvXs2c3J8pXKi2RF+Zmp84LxEUWJxFoJWmEqXNykqvYNtbf3h8ahzd6OmgZ0EvoESvfDSLzd2OR15yGTCzzlOnbLZc37BKGnD5e2tAST3hP4nuxfF9+/nPZcebjOlBJoPNdmQVXgRD+3zT8k9+qDRKTle3Tl3nE5/KNnkh24lv9jBSRm8vOLTrikUg+FHgj87zkyGCUr/IVaWqgDuxvYZsky4bsOWPSQIA/ipXBDjsygi0fv1rWFzuHzJ2aOhjwljSipC8+r7zNny2f4T/sve0j33UsIvx7O6vbAk2clmqLL8jnBL0pPTz3Q3GMDM0RMRvhQR5kCLaGTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 7 Nov 2025 09:32:20 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c%3]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 09:32:19 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time
 calculation
Thread-Topic: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time
 calculation
Thread-Index: AQHcTRJ3vmLe3jq9+ki8S3d51VgHZrTmnAyAgABYHcA=
Date: Fri, 7 Nov 2025 09:32:19 +0000
Message-ID: <DS0PR11MB80493549C11D2E93AD1E3DA8F9C3A@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-5-animesh.manna@intel.com>
 <DM3PPF208195D8DA39A8CC8C853DF4CF4FDE3C3A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DA39A8CC8C853DF4CF4FDE3C3A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|MN2PR11MB4550:EE_
x-ms-office365-filtering-correlation-id: 0eadd5db-7c8b-4b4d-1f5f-08de1de08c64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VW4rcEdQcWRWL01KZXdsclNHWFk1RzdKSnUzREFveU40bUZhZSszUDNBZHVl?=
 =?utf-8?B?Y0U0YlVGanVuTytZRGhSWXNZY1ZHZlRPMU1kNDhGUnZzVDZZUCt1eTJCVFVK?=
 =?utf-8?B?MlUwLzl3V3VCNFh1dUlvNG4ra3hYREhnL0lob0pJRFlqVkgrRzJJZFZIT3l3?=
 =?utf-8?B?eXdKRzcvdnIyOE0vR2FacmVKY0dwQnVNa0VudlJmdVlKeFNqV2kzK1JtVDdj?=
 =?utf-8?B?NHVmMlE5MGEva3dJSlJ3Wkt5UVB0Wm56NlNKcTFUWkhFYlRRQ3FLSThPb1Y5?=
 =?utf-8?B?eVByNitaMk5BR2o2WDVyOFczRHR1OGtORWlnV294T1pFakJ1T29qanRPNnRh?=
 =?utf-8?B?ZjZhQUpZZHErN2MyOEVFYUIrdjBZNlczR3hrVGF0NGpKVnl6NVFvT0d5TE5I?=
 =?utf-8?B?V2Y5azlBdG1VbGF3NmtUUHN1bWVjY2NFWjZnRlliRGxiTHkxT0F3Nm5LN2s5?=
 =?utf-8?B?SXp3T1Z2UlNNaHhra3VWRXQwUnNGNFplZVFnWFd0bG15YVB5MDYyMUVFUWpR?=
 =?utf-8?B?SHdCa0lKcmdZcGJFVEVJN0hjQndORDh1RDRNc1dyY21hRyttQlNabkJ0Ync2?=
 =?utf-8?B?R05wSDk3NVJCbUx2T0x6b3F5bGxtOC9jYkJKZnRxSHFZZUNyNG1PUi9tbFZ5?=
 =?utf-8?B?NHdVaDJmT0ZVQ0M2QUlRNGZuZ0lXY3Q3ZytZRkxyYlFnSEsrREVNQWRmYTlm?=
 =?utf-8?B?L0RxQk9jTm1qTWlmb3NUZ3JVZzhsR21Kb1BML2ZyakxibVZnelIwMTl0L0lp?=
 =?utf-8?B?b3RKNEhhUVA4M0JxNlBEMlh0OXJ6VFBuQTR2QktTbjNzMVpaZElVYVpYdGxy?=
 =?utf-8?B?VjB6dGZDNlZieEZFcUE2eEFUMHZlTWFVeEFvanpzTXJiNmRwdHJweWtsVWdz?=
 =?utf-8?B?V2pvaVZsTkZxSGlhbUFhQWd4eGcrbTRIQkpGR0tzVHBaNnZhOHpYZzgzMlcz?=
 =?utf-8?B?cGg4NlRRVHJkL2tzcnhpQ2x4UEVkVjlZWVVBNERwVWFRajMyTis0SGR3VjFt?=
 =?utf-8?B?bGZKTTdSL29WSks0M3ptL3BhVlI2N1hSYUVVdndQcFR4WThkWEVJY2ZSZUZz?=
 =?utf-8?B?djFtaGZodzZSVk0vb1I1Y0tvTmsxdjhndEk4S1V6aFhocDdIamZEY2ROc3Aw?=
 =?utf-8?B?ZDF3Y0lLOGhONno1dXRTZWNTdkI4WDQ1Yy93UXRvSGxoRG9zbHowalZUaG1G?=
 =?utf-8?B?RWtiYm02WTkxNVhrSXpOcE5qTEtienN0eTM2N3pkaXBNK0thVFhCSmFsSGdV?=
 =?utf-8?B?ejR3Y0NOV3liZGhFempRM3JqQ283R2pkSjlEL2ZhM2U1aEF3RlUzbzdSVy9O?=
 =?utf-8?B?RHNtZVE1SDMzSW4vVEU1UWsyR25JOE1qYnFlZ1FJcExXZVdRTWhydVNxeTVZ?=
 =?utf-8?B?KzJTSHZKcnFtdk9ZQ0pRSktNT0hPQ2E3MnB3Q01RSWZ3RUxTcC8yT1ZQNW5G?=
 =?utf-8?B?dzlFNjhIUWU2OUFwWlFPbXoxcG9oWEZBRUtCNHRuMjJxREwwZlcrNVJ5aXk3?=
 =?utf-8?B?RDI2MFVsWDZwUVpQMFZmWW5iN3pRcHZxRHNkSXpDWWtWaFhUSkhuNit4WjNw?=
 =?utf-8?B?dElJV0FSeFlsWHB6THdzS2dWelp2MFNMZDFVdENWZytPRU9sYUN1TmgzcmVz?=
 =?utf-8?B?N0NxcFZ0dHZ1L05LZzZqcmZ0WU94QU1UK3REaGM0aEgvNXlrSzdNNlcxN3Rl?=
 =?utf-8?B?Wk91ZUpOb29WWVdoN0xCWFY5WUZLWkREdnVRV0xhWC8wcEp2ODN0Tm5KeDQv?=
 =?utf-8?B?dW1vVUhxMEFqRC9MSlR2cHdpcndsTzM3RVFMRnUxMzNpZUZKMXJhemlyczlt?=
 =?utf-8?B?aDIvNC8wL3B6cEZiWGNUM3dWUWVQR21rMWtucFBkbklkRG02c05aa1NZTzQ3?=
 =?utf-8?B?NU5aaVdpQkpkRGorM0dyVnN3aFRib3VoUGl4VWdvM3YrOWRneTJZTjFqMnNj?=
 =?utf-8?B?Y0FQV0pmSjZSeERUd2dDbzlBQ1orTGs5cHNOaHRHNWJtWWlDWGNncWJFUFVC?=
 =?utf-8?B?UEZYMkJMTmdYOTdCeVcvcjI0UGJxejVncFZnQVVBYitvSUV2TnhTKzc4cEZ1?=
 =?utf-8?Q?hnGfjI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTJSTlI2TEdQaWVjQUxCVkxybWhQQ3M5UFZKRkpITDB6QzY4emNsK2ZQUWZL?=
 =?utf-8?B?UmtWOVdlL0JGSDB6Vmx4NnJuc0YzVDdpcGVNVk5qVHR3NnBWZXYwblJkTWQx?=
 =?utf-8?B?Sm92T3o1dkFLYlN6dXpyVDI5MjhENTFBZHJ2Mm9rU2pWRk5HVzZIdldiRmwr?=
 =?utf-8?B?TGwvaW1xVVNZYnRtZDd0ZkswTkR0YnRDaDlUUzMza0JtTU00RU04MWxQQThi?=
 =?utf-8?B?UkFVc0tadXErQXdRa3I0bEpFL2JnTVZ1RTBzaG56alF0RnYrS1FlSE5ESldR?=
 =?utf-8?B?dVhIZjRUWWRpTURyOW0wWkIzT21melBtY3BUc0FYOUtSalUycGxBODhLbG9G?=
 =?utf-8?B?WVQrZXFSTU5xZW1Rdkp1Ym9iYkNyRFF1MGwzZzdqWHNuVXNYSHZwSUd4ZFNl?=
 =?utf-8?B?ZytWa1dwOHhMb1djSkt0bTFtRWhFUzQxaDloV3VvcHdtSFphbDVzVnBtVHhG?=
 =?utf-8?B?NE85ZzVacDh0Y01VaTJSLzROcC8xVjlJRy9kd2MzV203SW5tbThsMVdSRnIz?=
 =?utf-8?B?dXJtYW1XSXBkVjJ3eU9hYWo0bHliYk9qcmZUVnY1UTY3Z0w5MTVzenhRVy9h?=
 =?utf-8?B?aE9yb3l6R05wa0JxQ1AxTit5ZU5OdHpIM0t3TDk1WSt2NE5YSGszRDFCc2Zu?=
 =?utf-8?B?SVVPcXc4Z0NrczZEY3o3azdTSmQ1cU9FYnNiUkJ5RUMzUnB3MjNlLzk3Qmg3?=
 =?utf-8?B?THd1WHRCWHJsLzIveXI1M2RqVlY5MDA1d1FuS0VRaHlhMDByakxtUENyY1p3?=
 =?utf-8?B?Q0dqVk5kakJ4WEphUUNaNTYxVFhZS1VheStOQ3VsWmlINXp6NWJUUjF1ZVZ0?=
 =?utf-8?B?ODN3YnYrZDEvR04yVTBEdVpHZXZ0dG5kMUpLVmM1OXM2OWF1WmpKclVFYXdW?=
 =?utf-8?B?V09wYzhxU2hka3BPL0RCdnppR05SWVNKZzhoNy9PdWF0SUtIM3Z4T0RzTkpi?=
 =?utf-8?B?ZFB1Z0gzazN5NUlDNFA0OEN4dFNvdXp3L0FwZ3FoU0lNWDhKbnc2MHA0eVNQ?=
 =?utf-8?B?ZTNFQ3FqRUdUbDdQTlRjMC9DZ0x5dXYwbU4rM2poaUJCRldMQUJhSkMyc0Zq?=
 =?utf-8?B?ek9URTlyb2QrUzRJOUh0eWVyRXpwUTVQbkNGRjBoUTRxaEJMWnR2L0VnK21M?=
 =?utf-8?B?L1NNZVhJTEl1aVVQcU8zbnpWS3VwZ2Q1S2YzQXZ4ckVycFU3ZFkrNjdwK3Bj?=
 =?utf-8?B?eWV6ZGlOVEZBWTN3eE9aWU90blhFWG1rV3BPMCtKeWNtUksvdE5qbU1qMW9j?=
 =?utf-8?B?Z2ttc2M3akJZODFWNWkzdUF1R1Y2UWNTRmVXbmdheW91WmVmQkRNcWVrdDJS?=
 =?utf-8?B?Q2NXNXdIQ0NaeVhzdU5VN2p0djUwU1hZeGI2c2kveWdBSEJxWjhwUVRyVWRM?=
 =?utf-8?B?MWxFbzM2dkw3NzlqcGl2WEQyUlkxODZVakVOc0tYQjVIb0dZcVhlczRNM2Rs?=
 =?utf-8?B?UG5VSVgrTkpLc3R4K29HTWpYblpod2NzZWMrN3VNQkVhQklBc1dCK1lOSitZ?=
 =?utf-8?B?dndNc0VibG0xZnRxTjBQT3ZNdVpBQm9VdzVqWXk4U3VjaWRScllMZHVWNVpj?=
 =?utf-8?B?RWRXc2c0Q1MwbzY5ei8xQk1MYXU2aDB1bzhsNkk0MTJNMzRocmQ5Qzc1SnRL?=
 =?utf-8?B?dHN4WVJwSHNhMGFTdHdWaFdncEFoeWNMeXBpYTFya0c2RUF0bGg1WWh5a0M5?=
 =?utf-8?B?NUVNbE0yeWFuRE9CZG9vRmQ3aTZJN09CN3k5R3g0OWpneW5hY1BIa25CaDc2?=
 =?utf-8?B?VnFNTUNyd3FkOHduR1pGOTlENnR2STB4ZHA4RldjaGdtK3hLeWhQRjVsaTk4?=
 =?utf-8?B?aUhhMEFCZk5QcGVrQkNaWGV0anREVFZYWEtacjRKMUFBRGZKaHZqRG9ZNlE1?=
 =?utf-8?B?UFZOOWgvSFNyVTJjd0JVRWYwYXR1ZW5hclozajVFNUJhNTRYVEJhakNRSnA3?=
 =?utf-8?B?T1E3VjdSak9Qdmo0VFVxK05WcTBqb2hvaXV6OWVHNUxmYUZrbnlackxyUWs0?=
 =?utf-8?B?ZWxaS0h1eGZrKzl3cHJLQjRTYzRscGl4WEZuN08wWHFUVUZ3RUsvbE1hT1R0?=
 =?utf-8?B?QzlUQlEyOHhkMlFqdlY4TDRJa1NzNmw2NDRFVVR0YkJLL2Z4WTZqWGpGRjM1?=
 =?utf-8?Q?YQTHeGb02/TtXtZBhE0xRu2KM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eadd5db-7c8b-4b4d-1f5f-08de1de08c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 09:32:19.8179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3HaLueGZzUFq/E4EHMlgQJHsXXmKbOZweGdI52nQMDro8bOzDyIXbOg7YjFj4zePOqLT1yl465zXt3s6s6PmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FuZHBhbCwgU3VyYWog
PHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDcsIDIw
MjUgOTozMSBBTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgTWFubmEsIEFuaW1lc2gNCj4g
PGFuaW1lc2gubWFubmFAaW50ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5pDQo+IDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMDQvMTBdIGRybS9pOTE1
L2FscG06IFJlZmFjdG9yIEF1eGxlc3Mgd2FrZSB0aW1lDQo+IGNhbGN1bGF0aW9uDQo+IA0KPiA+
IFN1YmplY3Q6IFtQQVRDSCB2MiAwNC8xMF0gZHJtL2k5MTUvYWxwbTogUmVmYWN0b3IgQXV4bGVz
cyB3YWtlIHRpbWUNCj4gPiBjYWxjdWxhdGlvbg0KPiA+DQo+ID4gRGl2aWRlIHRoZSBhdXhsZXNz
IHdha2UgdGltZSBjYWxjdWxhdGlvbiBpbiBwYXJ0cyB3aGljaCB3aWxsIGhlbHANCj4gPiBsYXRl
ciB0byBhZGQgWGUzcCByZWxhdGVkIG1vZGlmaWNhdGlvbi4NCj4gPg0KPiA+IHYxOiBJbml0aWFs
IHZlcnNpb24uDQo+IA0KPiBObyBuZWVkIGZvciB0aGlzIHlvdSBjYW4gc3RhcnQgb2ZmIHdpdGgg
djIgZGlyZWN0bHkgU2FtZSBmb3IgYWxsIHBhdGNoZXMgd2hlcmUNCj4gdGhpcyBoYXMgb2NjdXJl
ZA0KPiANCj4gPiB2MjogUmVmYWN0b3IgZmlyc3QgZXhpc3RpbmcgY2FsY3VsYXRpb24uIFtKYW5p
XQ0KPiA+DQo+IA0KPiBBZGQgQnNwZWMgbGluaw0KPiANCj4gPiBDYzogSm91bmkgSMO2Z2FuZGVy
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBN
YW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jIHwgMzcNCj4gPiArKysrKysrKysrKysrKysr
LS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9hbHBtLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YWxwbS5jDQo+ID4gaW5kZXggNzc5NzE4ZDBjOGRkLi44ZDA3NDU1YTYyYzIgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IEBAIC04NSw2
ICs4NSwyNiBAQCBzdGF0aWMgaW50IGdldF9sZnBzX2hhbGZfY3ljbGVfY2xvY2tzKGNvbnN0IHN0
cnVjdA0KPiA+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ID4gIAkJMTAwMCAvICgy
ICogTEZQU19DWUNMRV9DT1VOVCk7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IGdldF90
cGh5Ml9wMl90b19wMChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKSB7DQo+ID4gKwlyZXR1cm4g
MTIgKiAxMDAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGdldF9lc3RhYmxpc2ht
ZW50X3BlcmlvZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICsJCQkJICAgIGNvbnN0
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKSB7DQo+ID4gKwlpbnQgcG9ydF9j
bG9jayA9IGNydGNfc3RhdGUtPnBvcnRfY2xvY2s7DQo+ID4gKwlpbnQgdDEgPSA1MCAqIDEwMDA7
DQo+ID4gKwlpbnQgdHBzNCA9ICgyNTIgKiAxMCk7DQo+IA0KPiBXaGVyZSBkaWQgdGhpcyAqIDEw
IGNvbWUgZnJvbT8NCg0KVGhlIExpbmsgUmF0ZSBEaXZpZGVyIChSYXRlIERpdikgaXMgMTAgZm9y
IDhiLzEwYiBhbmQgMzIgMTI4Yi8xMzJiLiBBbHNvIHBsZWFzZSBjaGVjayB0aGUgbmV4dCBwYXRj
aCBmb3IgbW9yZSBjbGFyaXR5Lg0KDQo+IA0KPiA+ICsJbG9uZyB0bWxfcGh5X2xvY2sgPSAxMDAw
ICogMTAwMCAqIHRwczQgLyBwb3J0X2Nsb2NrIC8gMTA7DQo+IA0KPiBXaHkgdGhlIGV4dHJhIC8x
MCByZXF1aXJlZCBoZXJlIGFsc28gaWYgeW91IGhhZCBub3QgbXVsdGlwbGllZCB0cHM0IHdpdGgg
MTANCj4gdGhlbiB0aGlzIHdvdWxkbid0IGJlIHJlcXVpcmVkIFlvdSBhbHNvIHJlbW92ZWQgdGhl
IGNvbW1lbnQgdGVsbGluZyB1cw0KPiBwb3J0Y2xvY2sgbmVlZCB0byBiZSBpbiAxMEtiL3MNCg0K
RGl2aWRlIGJ5IDEwIGFsd2F5cyBuZWVkZWQgZHVlIHRvIHVuaXQgc2l6ZSBvZiAxMGtiL3NlYywg
ZWFybGllciBib3RoIG5lZ2F0ZWQgYnV0IGZvciAxMjhiLzEzMmIgbW9kZSByYXRlX2RpdiBpcyAz
Mi4gSXQgd2lsbCBiZSBtb3JlIGNsZWFyIHdpdGggbmV4dCBwYXRjaCB3aGVyZSBhZGRlZCB0aGUg
Y2hhbmdlcyBmb3IgMTI4Yi8xMzJiLg0KDQo+IA0KPiA+ICsJaW50IHRjZHMsIGVzdGFibGlzaG1l
bnRfcGVyaW9kOw0KPiA+ICsNCj4gPiArCXRjZHMgPSAoNyArIERJVl9ST1VORF9VUCg2NTAwLCB0
bWxfcGh5X2xvY2spICsgMSkgKiB0bWxfcGh5X2xvY2s7DQo+ID4gKwllc3RhYmxpc2htZW50X3Bl
cmlvZCA9IChTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y2RzKTsNCj4gPiArDQo+ID4gKwly
ZXR1cm4gZXN0YWJsaXNobWVudF9wZXJpb2Q7DQo+ID4gK30NCj4gPiArDQo+ID4gIC8qDQo+ID4g
ICAqIEFVWC1MZXNzIFdha2UgVGltZSA9IENFSUxJTkcoICgoUEhZIFAyIHRvIFAwKSArIHRMRlBT
X1BlcmlvZCwgTWF4Kw0KPiA+ICAgKiB0U2lsZW5jZSwgTWF4KyB0UEhZIEVzdGFibGlzaG1lbnQg
KyB0Q0RTKSAvIHRsaW5lKSBAQCAtMTA0LDE5DQo+ID4gKzEyNCwxNCBAQCBzdGF0aWMgaW50IGdl
dF9sZnBzX2hhbGZfY3ljbGVfY2xvY2tzKGNvbnN0IHN0cnVjdA0KPiA+IGludGVsX2NydGNfc3Rh
dGUNCj4gPiAqY3J0Y19zdGF0ZSkNCj4gPiAgICogdE1MX1BIWV9MT0NLID0gVFBTNCBMZW5ndGgg
KiAoIDEwIC8gKExpbmsgUmF0ZSBpbiBNSHopICkNCj4gPiAgICogVFBTNCBMZW5ndGggPSAyNTIg
U3ltYm9scw0KPiA+ICAgKi8NCj4gPiAtc3RhdGljIGludCBfbG5sX2NvbXB1dGVfYXV4X2xlc3Nf
d2FrZV90aW1lKGNvbnN0IHN0cnVjdA0KPiA+IGludGVsX2NydGNfc3RhdGUNCj4gPiAqY3J0Y19z
dGF0ZSkNCj4gPiArc3RhdGljIGludCBfbG5sX2NvbXB1dGVfYXV4X2xlc3Nfd2FrZV90aW1lKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gKwkJCQkJICAgY29uc3Qgc3RydWN0IGludGVs
X2NydGNfc3RhdGUNCj4gDQo+IEkgZG9u4oCZdCBzZWUgYW55IGp1c3RpZmllZCByZWFzb24gdG8g
c2VuZCBpbnRlbF9kcCBoZXJlDQoNCkl0cyBuZWVkZWQgaW4gbmV4dCBwYXRjaCwgZml4IHRoZSBm
dW5jdGlvbiBwcm90b3R5cGUgaGVyZS4NCg0KUmVnYXJkcywNCkFuaW1lc2gNCg0KPiANCj4gUmVn
YXJkcywNCj4gU3VyYWogS2FuZHBhbA0KPiANCj4gPiAqY3J0Y19zdGF0ZSkNCj4gPiAgew0KPiA+
IC0JaW50IHRwaHkyX3AyX3RvX3AwID0gMTIgKiAxMDAwOw0KPiA+IC0JaW50IHQxID0gNTAgKiAx
MDAwOw0KPiA+IC0JaW50IHRwczQgPSAyNTI7DQo+ID4gLQkvKiBwb3J0X2Nsb2NrIGlzIGxpbmsg
cmF0ZSBpbiAxMGtiaXQvcyB1bml0cyAqLw0KPiA+IC0JaW50IHRtbF9waHlfbG9jayA9IDEwMDAg
KiAxMDAwICogdHBzNCAvIGNydGNfc3RhdGUtPnBvcnRfY2xvY2s7DQo+ID4gLQlpbnQgbnVtX21s
X3BoeV9sb2NrID0gNyArIERJVl9ST1VORF9VUCg2NTAwLCB0bWxfcGh5X2xvY2spICsgMTsNCj4g
PiAtCWludCB0MiA9IG51bV9tbF9waHlfbG9jayAqIHRtbF9waHlfbG9jazsNCj4gPiAtCWludCB0
Y2RzID0gMSAqIHQyOw0KPiA+ICsJaW50IHRwaHkyX3AyX3RvX3AwID0gZ2V0X3RwaHkyX3AyX3Rv
X3AwKGludGVsX2RwKTsNCj4gPiArCWludCBlc3RhYmxpc2htZW50X3BlcmlvZCA9IGdldF9lc3Rh
Ymxpc2htZW50X3BlcmlvZChpbnRlbF9kcCwNCj4gPiArY3J0Y19zdGF0ZSk7DQo+ID4NCj4gPiAg
CXJldHVybiBESVZfUk9VTkRfVVAodHBoeTJfcDJfdG9fcDAgKw0KPiA+IGdldF9sZnBzX2N5Y2xl
X3RpbWUoY3J0Y19zdGF0ZSkgKw0KPiA+IC0JCQkgICAgU0lMRU5DRV9QRVJJT0RfVElNRSArIHQx
ICsgdGNkcywgMTAwMCk7DQo+ID4gKwkJCSAgICBlc3RhYmxpc2htZW50X3BlcmlvZCwgMTAwMCk7
DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgaW50DQo+ID4gQEAgLTEyOCw3ICsxNDMsNyBAQCBf
bG5sX2NvbXB1dGVfYXV4X2xlc3NfYWxwbV9wYXJhbXMoc3RydWN0DQo+IGludGVsX2RwDQo+ID4g
KmludGVsX2RwLA0KPiA+ICAJCWxmcHNfaGFsZl9jeWNsZTsNCj4gPg0KPiA+ICAJYXV4X2xlc3Nf
d2FrZV90aW1lID0NCj4gPiAtCQlfbG5sX2NvbXB1dGVfYXV4X2xlc3Nfd2FrZV90aW1lKGNydGNf
c3RhdGUpOw0KPiA+ICsJCV9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUoaW50ZWxfZHAs
IGNydGNfc3RhdGUpOw0KPiA+ICAJYXV4X2xlc3Nfd2FrZV9saW5lcyA9IGludGVsX3VzZWNzX3Rv
X3NjYW5saW5lcygmY3J0Y19zdGF0ZS0NCj4gPiA+aHcuYWRqdXN0ZWRfbW9kZSwNCj4gPiAgCQkJ
CQkJICAgICAgIGF1eF9sZXNzX3dha2VfdGltZSk7DQo+ID4gIAlzaWxlbmNlX3BlcmlvZCA9IGdl
dF9zaWxlbmNlX3BlcmlvZF9zeW1ib2xzKGNydGNfc3RhdGUpOw0KPiA+IC0tDQo+ID4gMi4yOS4w
DQoNCg==
