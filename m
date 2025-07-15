Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CDFB064C2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11E810E614;
	Tue, 15 Jul 2025 16:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrU7o7Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E9F10E608;
 Tue, 15 Jul 2025 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752598717; x=1784134717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qW25E9uvAuR0mf2H4w+v+H/jtNuoYryUfAGn6KqSQSA=;
 b=PrU7o7Hcgdd2ayzfSPKNEVg90HsKLZOTOd/HaiLd/DWDKa41Ew/a1dRW
 DPsBiehORKsG0IMCJGPoauJSU1KjukLIC2YexzZ8RCpaw9OKkkwQGVRyX
 kMzhiahP+FH+4lrgSKC8+8Q+lq+alDp/i1PdN0k9+uROR60nQLyu2kosP
 wif+Fvfq9A8hbRNdIlJo8Vu8nIDvAO0Qi6rxS64+MvQvHTJC5wuZldDHQ
 /EtM/E4+rMg0A9lGRdXh47SpRKRUezSED7s2NpfTI0qHzjYG0uOBkLlZI
 wV9E4V1feGZTILoP0CJVuZ0ttDujk4MXNlFvOJklj2jP76j69lnSk3F92 Q==;
X-CSE-ConnectionGUID: xnw2saJXT2evXHScMLoBDg==
X-CSE-MsgGUID: gZEOInPsSkuYZKSwFt+RJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72403717"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="72403717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:58:37 -0700
X-CSE-ConnectionGUID: xqEgXfo/QhONDbMbLK10Tw==
X-CSE-MsgGUID: 2HLKpchQQZuGea8xvIMTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157628470"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:58:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:58:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 09:58:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:58:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSBt61p2aTp0gnbe+c7hDFiauxbmRi7FoXC7+TiC/h5cmz8q/8Q8NFe4mTpJuVwz+JRsUjfmidVqSP1IItmnSSruJm0TRps+VH8qzTyZWoDSSUtyqBvTXzyXAhDPhWo1fwBtwrWeGTz4wSy3lmD4aaXoqC/j3Yq++3Po0iazPrPSltYFbu0vtaODsjiaap2aQwVAr3P+RyyFZ+KInJFEi7gMtmdCriGeJuF63P8vBaNO5KOVd8EC6fshGyIVY7mGKXdIKTDCCPRvDLSkDUZNNf+Iwq2U/X4Ngh2hC/qnTRgtbHgHxUcjupLdfrWKI2SmggNIWFW+5UUEqb7yLxIxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW25E9uvAuR0mf2H4w+v+H/jtNuoYryUfAGn6KqSQSA=;
 b=CUUuGHgxqK2NtikJ614G7h0qQ2V9a4A+xcZzYD6v6d/7O/t7YokYZ8FqqcV0luo3IWyBvYcQhEeOavC3T4ddfTGbcbjV6PkhQGr6a5Ix7bx2G4NUdf9LKo9FMHH7E5467Jv0DKeRslouMGxi/Dbjnl71YghSzvpEhI7UuxjIEbYmRTZjpgKfhxAe7xOGxJQ8f58BPIgo6MJIbQ3zLAoejqM9REYG5hsNn8UJG8lLGz74Ol72IkzCjP7+OYCLg3EZRrgpOhlV1OoK0v0Y6O7SU6q2u1vVIaERGUERXpzkSP6Wt7JsXmYohxzEiaX5ZVcWitfYv3xOKb+U9aeCtyNbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Tue, 15 Jul 2025 16:58:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 16:58:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 9/9] drm/xe/xe_hw_error: Add fault injection to trigger
 csc error handler
Thread-Topic: [PATCH v5 9/9] drm/xe/xe_hw_error: Add fault injection to
 trigger csc error handler
Thread-Index: AQHb9XKKSjvAD7Ng5U+0QmMgcuwvGLQzOX0AgAApqoCAAAVPgA==
Date: Tue, 15 Jul 2025 16:58:26 +0000
Message-ID: <6577a9d9350ed89b869b92f8c18374bf09a783ab.camel@intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-10-riana.tauro@intel.com>
 <e1d33079c2213534ce33df56a2381604f570960e.camel@intel.com>
 <8a0d8ff3-c790-4dc7-8f2c-99390a6f5691@intel.com>
In-Reply-To: <8a0d8ff3-c790-4dc7-8f2c-99390a6f5691@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB5106:EE_
x-ms-office365-filtering-correlation-id: 31ea0075-e010-4e41-50f7-08ddc3c0d141
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SHZxT1pDaktvajBSOE5JeW9IZnFXZkVwWis1NDhUZVFBWFkweEVnUzZJU1JY?=
 =?utf-8?B?TDcwWDNDbGRlUk9EazBablJ0VkRmSnd3MXY0d2Q2anY1ejRZMkF2THhwQ2Nq?=
 =?utf-8?B?KzBwQ1R5MnRyNGFSL2lXUW1icDAzd3FncTI0WHFmb1FoUzVlYjJhMGhnTkZE?=
 =?utf-8?B?akZRYjBnSFNNcjZtTmlSUEhmR0FhUDBzcmFkbXZXcHVYNU5PWTlPRGRBSE5Z?=
 =?utf-8?B?Mk54d24xMkVIVTN0bENoTDZPNm9lcDRIU2ZmQTJwdm5td1REY1c3V0E0S1pK?=
 =?utf-8?B?TGsrazNTYjdaRHZhVXI1U2Y0aC9QT3lLekxnNm1JZ3ZXUHYrMzVpY3lCeHBi?=
 =?utf-8?B?Z2o4Yk84ekJpb3FmSnRIRzcxL3lpaXh1NXZYa203RnpPTW9UUE5ZbnFtNUM1?=
 =?utf-8?B?QVAzU1lwTDJIbEFiTkprS05oVTRWS0hOZ0JINU9KVDBzV1hnd3ZzV0dRbm9T?=
 =?utf-8?B?VDFmcElORXJsZ2NKNnBWeTZkU2IwNk0ybjBmV2dyWGYxci9uRDZBakFheVpJ?=
 =?utf-8?B?dVBmM2N0cDJvM05xUXkwbVpSTExCb1JrSDhvckRVSTkrdysvWjVocExZNjZ2?=
 =?utf-8?B?VGhDUnhkOWlDU1JHTW13VjJVclpsUmk3RzRGMTY5Z285OGhmVThnQk40V3Jx?=
 =?utf-8?B?VDk4TnltV3lEYThXMWdQRk1SVk1sc1llMUJjY2w2S3V4QjNWNWhYbW1zR2xL?=
 =?utf-8?B?SGVEZTdLTVhqckRZd1VBUW1ZVXpWQnlLTElObWpkaVA2N3YrQXVxNjErMHhr?=
 =?utf-8?B?ODFzSitPa0p6b043MUI2ZmRkdUZCcFdJaFB5Z0Z0RGZIcEQ2ZFdxcXdJUVVF?=
 =?utf-8?B?dFA1aktLaWljRzdqZURtR3BLbXArRlFkMXRCTnlNQm1wZ3dIbGVla1JiWjMy?=
 =?utf-8?B?NXZkNGdvekxaTEZTSldkM1BwV214eUdIaDQrVkxVei9wQ2VoQjlqNWVMRFRL?=
 =?utf-8?B?aGR6TVNMRnZSV25ONnRZN2hGNFdoZ2d2WTFCbUdSR0xvUG84TmpNYXZpK2dX?=
 =?utf-8?B?RHFrdlg2SG5wMGVoSjhVOGU2SG9yWVgyNGthcmJEMWxqVkw0SUI2aXhXeXNv?=
 =?utf-8?B?bEhQUWpsdHcwTEhFRllEdmVvaTdjeWFZZFBXNHQrdVdSQW1KY1RnN1Z6RkpM?=
 =?utf-8?B?RGlDdXNLWnplNlU2R2ZFazF0YnZEbVkwUEpnbXlVNThiUzdocTdZbGN4anhx?=
 =?utf-8?B?eU5MbUlxOFFQR1UyR3hhWU9TSVp2amtoZzNHeVNMdkVzNlk3QmswWVZzUHc2?=
 =?utf-8?B?d3E5TThaUlQwSWRTQUZFbi9sZTVESFNFSW9RTGhoSzNlYWwxSkNOZjBPdkNo?=
 =?utf-8?B?NUllR3J5QndLWFVSYlNYT1B1V3lVc0wwWVZDNnhLeGdtd1lUU1FRQ0g2Znh5?=
 =?utf-8?B?TTd1YnpYbjRWSVkvdS9yT0MwbFpYaXlxT25uR0xubllIenNDM2ZkV1VZaFRU?=
 =?utf-8?B?TWIrVTQyQzFXVUl6djIwWGlFVTFtUmFEQmhPb2VEcWJuMm1zWFo1V256dURQ?=
 =?utf-8?B?cGYrcVR2eWVERTM2K0lvbjdGU2dwSzFWeGJOc3o4NTMxZ1BjaSs2dTcvd3ZK?=
 =?utf-8?B?SVhLdkMxWml3V2lCR3pMTUtOSEdXaW8wUHo0N1FkSnE3MlYweUNFbTdTYTFr?=
 =?utf-8?B?b2NQZVlvTFhnU01naEZMMGU3UUdTZ05nYlQwNE92OThIOHA5Wm1VL0JCOTh5?=
 =?utf-8?B?c2U2UGNuUzRiUG9SV0pWSUp1OUU0SkRCeGgzM3RhUjV3dy80NFJla3pwV1h5?=
 =?utf-8?B?UjNHN1VvWE1IZkdoY3MwSmNGZk5sNkgxVjdyN1JybVZEUGJaTXNrUzBzVktQ?=
 =?utf-8?B?RkFCRUlDZldRMVZ1Q2xxSXA4WEdveVc4TnozOFdPQlBwb1RmcTQ2ZFRUZDR5?=
 =?utf-8?B?d2huNnhXK1dqbm0wYUhoTjY5QTJ5ZzFvZk1lNHduT3Q2b1psNCt5bWVMRkt1?=
 =?utf-8?B?TUk1UGEzaHlNNzVsVUY1dXlCQVNTbEdOVkJJQm5PVWxXN0F0Vm9YdDVBdjg3?=
 =?utf-8?B?Sk5DaGZRSmtRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjB3empjQzgxY09TSm45cjl0R1JPVzlYV2t5QURCeWhoZG5PQTJ5cXU2bGZt?=
 =?utf-8?B?ZW5KYVlvNHFnMXhaUlJYRTJBYythTzZUZXFhdk16elpjQVVvZm5FbHp6QVN5?=
 =?utf-8?B?VU5aTUtUL2w5SkRPeXIrOCtjcFZrVFJyRlhoTFU4TVJQbHhYSk5YNlFnMEls?=
 =?utf-8?B?VW1lZ2RTL2Y4NUxFbDNRcFdsRVkxU0EreENBek9ZUmVzMzJKUTdKZ1NWc21E?=
 =?utf-8?B?L1djNWdkR29PV2VXWHFCZ3RSSUhmRGtDOVQyOVU2M3B1a0dPM3hqMmt1QUo5?=
 =?utf-8?B?aTRLWXgyNDVzT0NTK1NCdGJSR3ROclQ0K1BnZlFVNEp5M1AvcVZsMzNwRXJH?=
 =?utf-8?B?TzJuT2lLdDV0TjZxa3V3WjlUcFUrNlFnZU5obFMybzJPL0NyN2tmQnpBM2FS?=
 =?utf-8?B?WUR6bXRXV2hEbGtZc05EMkV6TFZ0cWNQYjBUdURZSVBQNHpWeXFEZ1ZKNVdO?=
 =?utf-8?B?N3lRL21tMzB0RkVhTE1hTHZtaWdMVHNKSjBzNTZhUEd4WHlXcUFIWUdSTW5p?=
 =?utf-8?B?RlJLdENKbFg5bThZbmIzT1ArZ0JsMmxqQ2VOemxRSGNDTjl5T09rSVE3OFNj?=
 =?utf-8?B?bXpQd01aeHZhRmcxTUhueWZZVHo4V2R4MkJXbWlMcjhSQ0JocTNPR0FPYnRV?=
 =?utf-8?B?SUNROElJYno0MG94dkNSTFRpbGtGdG95UXhqOGQveFFpOUlvcGhRZ3JHL3Fu?=
 =?utf-8?B?cEZEdS9PN2JMU2E4Q1ZBV3BVLzRSSmJGMXpGZkpWMlp0OS92d2MyeXBHSjZB?=
 =?utf-8?B?RTdGQ1Z3NC9aQW42alB4U2ViblRzZFNUWGZNTjdLMjRaRm9FdVlZVFV0MXFv?=
 =?utf-8?B?Q2R5SUY3empvY1UzMDhOcGsrbUJWSDhleXpsb1RxNXlzc1ZRY2Nra01EVUNI?=
 =?utf-8?B?SkNFWGxmMTZWdVRkdzBja3VrZTZOdE5VdDZKVG55OGU2Vyt6QWtXWS9BVUNG?=
 =?utf-8?B?U0czeW9WZXZpVDlmaVZCeXliNDdJcW5PYmNYSW15bnVzSllxSDRPSnpqWE1Y?=
 =?utf-8?B?cEhsUzZBd2crakNJS0llUjR3RzE1RlFPdUc2S3I4ZlRrYVJrcW4zV1Z3N3ls?=
 =?utf-8?B?N01mVVZtVWtIMEhYZWk5ekdDZS9aU3dtV2VVOU0vWFhaVEt1N21uYjdYdVEv?=
 =?utf-8?B?dUZ2Y3FjRHVhekNUbmlnSFV4bnhOcFpOanRkeTl5VThpR0wxU3B1dTVaaUhE?=
 =?utf-8?B?aHMxZTNvWDFTUXZPNHVoazBDRkhEU0Z6ak9XV3VxVk42d1pXU0lTaWdVcUFL?=
 =?utf-8?B?am10U2lsZkpacG12NGpIVTM0eGZQaktyenZRZWZ6WTM0cDFlNWRFbnJsVytr?=
 =?utf-8?B?cGh1WjV3WEI3cVh6Y0l3NVdXY2NoYi93bG5nekdWcnJDd0tNOVlXRHQxMjVC?=
 =?utf-8?B?RThHWFFoYnZpcjFMSGw5cGdJNGk5UEIwdGRlRXpQNEhjalhaejVGWjRvcGhZ?=
 =?utf-8?B?YjEzTWVjYUhNTjZuSk40VkF1TmIybGZDUVl1M2NpUHlidzhYRXZDbFl2anh2?=
 =?utf-8?B?MXRLdk9nVFFnaU5sL0NXVXY2dmE2bmdYYURNU3pKZWR4c2JxTWZsM2grdGto?=
 =?utf-8?B?RUxXY3dlbDh1OC81c1dPTVhORmlITXNlcDAwbFdNalpHNlROb3JEb0RBN2dR?=
 =?utf-8?B?NVFTdi85K21jT2VwWWMwVURqdmpjUlExZzdiUUJjb2VtMkhFZFF3NldQWFc2?=
 =?utf-8?B?UXNscXlJa2JJT1h4Z3orRjBodnljTDI1Z052MmRFbmE0aW1mdmd2Uk1CUjB1?=
 =?utf-8?B?TEJTdzdNalNIbG03cWJSRjN0Y1JZdGN0aDQ1NlFwZjVxQWtxMzM5Y3Ivd1l4?=
 =?utf-8?B?ZkUwZ0FOQkZhMTdRcGZkQTRiQXhFcytiRFZEcXMwdFhFUnI5OVQxWTFqYksx?=
 =?utf-8?B?ZjBpSEZCZGlPVkRXNWdRSTc0eDNRZlkySk9melVLcmFWTXIwQ29Ma2J0WFNx?=
 =?utf-8?B?WU8rVHVFOUxnL0NRTTloOGdsbWloL2Z0WFNVbktTMStobGQ0K1B3T1pGb0Ja?=
 =?utf-8?B?WlhmK1Fac3U4V3FoY0xTRmk1MzdPQnVjSEh0SEQvR3hKMHljNlNZQTJSVUZZ?=
 =?utf-8?B?Lzh6QVNIU2tkRWJjcEVjd2FPOGIvZXh2WlhjN0VSaFNmVTd5ZU1KTzA0ZmFo?=
 =?utf-8?B?dEdNK3lMZDlLdk1SeWhHTmt3MzFzcU11NERTUFVXQ2ZSQXFtaXA4NTRJNzg2?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DD33279478EFD4DBAB4BBCBB55C58F7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ea0075-e010-4e41-50f7-08ddc3c0d141
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 16:58:26.8268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqgmfrVckRgz7WASlzr1Ll5GEDIPpAMTjBDg6CGgjW1mcneCdR/o9RyVwBr7qIwPnE5Xev+CgRzmmpg0VTqMIVu08z+KG3rbVLmYRRXfQg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDIyOjA5ICswNTMwLCBSaWFuYSBUYXVybyB3cm90ZToNCj4g
SGkgU3R1YXJ0DQo+IA0KPiBPbiA3LzE1LzIwMjUgNzo0MCBQTSwgU3VtbWVycywgU3R1YXJ0IHdy
b3RlOg0KPiA+IE9uIFR1ZSwgMjAyNS0wNy0xNSBhdCAxNjoxNyArMDUzMCwgUmlhbmEgVGF1cm8g
d3JvdGU6DQo+ID4gPiBBZGQgYSBkZWJ1Z2ZzIGZhdWx0IGhhbmRsZXIgdG8gdHJpZ2dlciBjc2Mg
ZXJyb3IgaGFuZGxlciB0aGF0DQo+ID4gPiB3ZWRnZXMgdGhlIGRldmljZSBhbmQgc2VuZHMgZHJt
IHVldmVudA0KPiA+ID4gDQo+ID4gPiB2MjogYWRkIGRlYnVnZnMgb25seSBmb3IgYm1nIChVbWVz
aCkNCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUmlhbmEgVGF1cm8gPHJpYW5hLnRhdXJv
QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmPCoCB8wqAgMyArKysNCj4gPiA+IMKgwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdf
ZXJyb3IuYyB8IDExICsrKysrKysrKysrDQo+ID4gPiDCoMKgMiBmaWxlcyBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGVidWdmcy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMN
Cj4gPiA+IGluZGV4IDI2ZTlkMTQ2Y2NiZi4uOTUwNTdjMDRhMDIyIDEwMDY0NA0KPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiA+ID4gQEAgLTMxLDYgKzMxLDcgQEANCj4gPiA+IMKg
wqAjZW5kaWYNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoERFQ0xBUkVfRkFVTFRfQVRUUihndF9yZXNl
dF9mYWlsdXJlKTsNCj4gPiA+ICtERUNMQVJFX0ZBVUxUX0FUVFIoaW5qZWN0X2NzY19od19lcnJv
cik7DQo+ID4gPiDCoCANCj4gPiA+IMKgwqBzdGF0aWMgc3RydWN0IHhlX2RldmljZSAqbm9kZV90
b194ZShzdHJ1Y3QgZHJtX2luZm9fbm9kZSAqbm9kZSkNCj4gPiA+IMKgwqB7DQo+ID4gPiBAQCAt
Mjk0LDYgKzI5NSw4IEBAIHZvaWQgeGVfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgeGVfZGV2aWNl
DQo+ID4gPiAqeGUpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9weHBfZGVidWdmc19yZWdp
c3Rlcih4ZS0+cHhwKTsNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgZmF1bHRf
Y3JlYXRlX2RlYnVnZnNfYXR0cigiZmFpbF9ndF9yZXNldCIsIHJvb3QsDQo+ID4gPiAmZ3RfcmVz
ZXRfZmFpbHVyZSk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmluZm8ucGxhdGZvcm0g
PT0gWEVfQkFUVExFTUFHRSkNCj4gPiANCj4gPiBJJ20gc3RpbGwgbm90IGNsZWFyIHdoeSB3ZSBu
ZWVkIHRvIGxpbWl0IHRoaXMgdG8gQk1HLg0KPiANCj4gQ1NDIGVycm9ycyBhcmUgb25seSBhcHBs
aWNhYmxlIGZvciBCTUcuIFRoaXMgYml0IGlzIG5vdCBpbiBwcmlvciANCj4gcHJvZHVjdHMuIEFk
ZGluZyBhIGZhdWx0IGluamVjdGlvbiBhbmQgdGVzdGluZyBmbG93IHdpbGwgbWFrZSBzZW5zZQ0K
PiBvbmx5IGZvciBzdXBwb3J0ZWQgcHJvZHVjdHMNCg0KSSdtIGxvb2tpbmcgaW4gYnNwZWMsIGZv
ciBpbnN0YW5jZSBhdCB0aGUgbm9uLWZhdGFsIGVycm9ycyAoNTMwNzUpLCBhbmQNCkkgc2VlIGRp
ZmZlcmVudCBwbGF0Zm9ybXMgaW1wbGVtZW50aW5nIGJpdCAxNyBmb3IgQ1NDIG5vbi1mYXRhbCwN
CmluY2x1ZGluZywgYXMgSSBoYWQgbWVudGlvbmVkIGluIHRoZSBmaXJzdCByZXZpZXcsIGZvciBM
TkwuIFNvIHRoaXMNCmlzbid0IG9ubHkgYXBwbGljYWJsZSB0byBCTUcuIFdlIG1pZ2h0IGJlIHRh
a2luZyBhIGNhbGwgdGhhdCB3ZSBvbmx5DQpuZWVkIHRoaXMgb24gQk1HLCBidXQgSU1PIHdlIHNo
b3VsZCBiZSBjbGVhciBhYm91dCB0aGF0IHNpbmNlIGl0IGlzbid0DQphIGNhc2Ugb2Ygbm90IGJl
aW5nIHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0K
PiBUaGFua3MNCj4gUmlhbmENCj4gPiANCj4gPiAtU3R1YXJ0DQo+ID4gDQo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmF1bHRfY3JlYXRlX2RlYnVnZnNfYXR0cigiaW5qZWN0
X2NzY19od19lcnJvciIsDQo+ID4gPiByb290LCAmaW5qZWN0X2NzY19od19lcnJvcik7DQo+ID4g
PiDCoCANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGlmIChJU19TUklPVl9QRih4ZSkpDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3Jpb3ZfcGZfZGVidWdmc19y
ZWdpc3Rlcih4ZSwgcm9vdCk7DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2h3X2Vycm9yLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMN
Cj4gPiA+IGluZGV4IGM1YjNlOGMyMDdmYS4uZGI3NDE3YzM5MGZmIDEwMDY0NA0KPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lcnJvci5jDQo+ID4gPiBAQCAtMyw2ICszLDggQEANCj4gPiA+IMKg
wqAgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ID4gwqDCoCAqLw0K
PiA+ID4gwqAgDQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2ZhdWx0LWluamVjdC5oPg0KPiA+ID4g
Kw0KPiA+ID4gwqDCoCNpbmNsdWRlICJyZWdzL3hlX2dzY19yZWdzLmgiDQo+ID4gPiDCoMKgI2lu
Y2x1ZGUgInJlZ3MveGVfaHdfZXJyb3JfcmVncy5oIg0KPiA+ID4gwqDCoCNpbmNsdWRlICJyZWdz
L3hlX2lycV9yZWdzLmgiDQo+ID4gPiBAQCAtMTMsNiArMTUsNyBAQA0KPiA+ID4gwqDCoCNpbmNs
dWRlICJ4ZV9zdXJ2aXZhYmlsaXR5X21vZGUuaCINCj4gPiA+IMKgIA0KPiA+ID4gwqDCoCNkZWZp
bmXCoCBIRUNfVU5DT1JSX0ZXX0VSUl9CSVRTIDQNCj4gPiA+ICtleHRlcm4gc3RydWN0IGZhdWx0
X2F0dHIgaW5qZWN0X2NzY19od19lcnJvcjsNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoC8qIEVycm9y
IGNhdGVnb3JpZXMgcmVwb3J0ZWQgYnkgaGFyZHdhcmUgKi8NCj4gPiA+IMKgwqBlbnVtIGhhcmR3
YXJlX2Vycm9yIHsNCj4gPiA+IEBAIC00Myw2ICs0NiwxMSBAQCBzdGF0aWMgY29uc3QgY2hhciAq
aHdfZXJyb3JfdG9fc3RyKGNvbnN0IGVudW0NCj4gPiA+IGhhcmR3YXJlX2Vycm9yIGh3X2VycikN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+IMKgwqB9DQo+ID4gPiDCoCANCj4gPiA+
ICtzdGF0aWMgYm9vbCBmYXVsdF9pbmplY3RfY3NjX2h3X2Vycm9yKHZvaWQpDQo+ID4gPiArew0K
PiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHNob3VsZF9mYWlsKCZpbmplY3RfY3NjX2h3X2Vy
cm9yLCAxKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiDCoMKgc3RhdGljIHZvaWQgY3NjX2h3
X2Vycm9yX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ID4gwqDCoHsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90aWxlICp0aWxlID0gY29udGFpbmVyX29mKHdv
cmssIHR5cGVvZigqdGlsZSksDQo+ID4gPiBjc2NfaHdfZXJyb3Jfd29yayk7DQo+ID4gPiBAQCAt
MTMwLDYgKzEzOCw5IEBAIHZvaWQgeGVfaHdfZXJyb3JfaXJxX2hhbmRsZXIoc3RydWN0IHhlX3Rp
bGUNCj4gPiA+ICp0aWxlLCBjb25zdCB1MzIgbWFzdGVyX2N0bCkNCj4gPiA+IMKgwqB7DQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqBlbnVtIGhhcmR3YXJlX2Vycm9yIGh3X2VycjsNCj4gPiA+IMKg
IA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGZhdWx0X2luamVjdF9jc2NfaHdfZXJyb3IoKSkN
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzY2hlZHVsZV93b3JrKCZ0aWxl
LT5jc2NfaHdfZXJyb3Jfd29yayk7DQo+ID4gPiArDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBm
b3IgKGh3X2VyciA9IDA7IGh3X2VyciA8IEhBUkRXQVJFX0VSUk9SX01BWDsgaHdfZXJyKyspDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKG1hc3Rlcl9jdGwgJiBF
UlJPUl9JUlEoaHdfZXJyKSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaHdfZXJyb3Jfc291cmNlX2hhbmRsZXIodGlsZSwgaHdfZXJyKTsN
Cj4gPiANCj4gDQo+IA0KDQo=
