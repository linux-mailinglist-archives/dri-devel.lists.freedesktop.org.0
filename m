Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D250AD3A84
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B9010E58E;
	Tue, 10 Jun 2025 14:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/FNOPzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D33C10E574;
 Tue, 10 Jun 2025 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749564477; x=1781100477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IZi1VWu6ID5e4Zm47rYpZzuSkP/LMsrZTUTAiJdiAWQ=;
 b=H/FNOPzTp1rqaer/Pm3CJ70AAxNfJGdQEORIMGSuG9UGLAl1DUSLp77L
 g4BXjJLmz+H60dIMKGWFvgmLozcby0yrVN6nNHBwbqMVPQ4RC3e8rcOta
 Za7XV/h3Gc7CUR3KZpKaLP9mKF3nr2z3YRTyvnpWuPOnnYicCL7CBK75b
 +Jnz5M6SI2pyTRSBdeT6HfC6iy63VCOTP/9qAVrYI5gZADZNcKF8Z6k2W
 qxP/XnfyOanh0+XIQgL81RRAooP/pp+/lsae3wBZmVERg1tUw6n5eVoWb
 dC2YrIc7IiiXiq0mXm3ytXwrVRIqPf5+JQHAoWBS7eELQG7OtRLxGf8fU w==;
X-CSE-ConnectionGUID: xrTxtgVJTEKGijvl/M6iYw==
X-CSE-MsgGUID: ZtikqhVDQT2lKpBZptGWIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63029968"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="63029968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:06:31 -0700
X-CSE-ConnectionGUID: vUmoJCFwQ4miPDDYEWeP6g==
X-CSE-MsgGUID: WjLengatTN2d3AiHvvbS6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="146780187"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:06:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:06:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 07:06:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZkIGC+bUn6R6TueXahiML0SdyALilqBLH58KhKFEo8Edy8RPWnTSOB/cUbvW2Uh5r3t8b/UmbLZPE6sbvwkqoDxA/fN8Q0FS0KdNZDZRn8SXJr3rVS/2FrJpiv+WWZJ7CUFkNTk1s4ByLR893CzKguTr3NtXMp/1C6F8VLOpfdGEcsGibQmTI3FDQjyjjY6hIS6Hl5S9rtQDChB/IMrsVDzzWGoVt7BntlS+d35gpurLqhWS56kLFqoMNhIbsd4TgzzxaOM7gVqxdRPn6OTxfCOXXiorfNdzs0k1pCAv27Q4R1h6cquYUb8rjv1/P6nW58FbaOOariq28CwQNpK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PYsjQUxtr9XbWd5gWZ30evOqlMH0WxbdGyuUBJ/YFE=;
 b=yml5FfywraToMpUucMiI0eCJDMOQQmLOd9tVnpkMBAbdIn+wvy0tT8OA9tDj9TRH+iviCnJYRt7pOn8uo1YwfH2GQGj5Ku144YN1erY5PBNDN2/fHJaYB1Xgk0VrDHrhADahQKsPs9B16bvQ6NcaJtO0tiPTZXiaoQASMWgQr2hvH7UIpprIN6ebdBr84DbjNeDlStPm6vsmxLsk8nFa4kiaLRd8KUPTkpq4CBE3VBv5OCn3vN0ZnAiSgM9WPYQqPbkuly0pbmEhXI6cLdM5d6E3EQIpX8vd7hYmzXDQeiwsxYt9owmesACFJaMhw2zMNrgFe17KEs7oMXYitsnDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 by SA0PR11MB7157.namprd11.prod.outlook.com (2603:10b6:806:24b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 14:06:24 +0000
Received: from PH8PR11MB8014.namprd11.prod.outlook.com
 ([fe80::5259:6d10:28f2:c3db]) by PH8PR11MB8014.namprd11.prod.outlook.com
 ([fe80::5259:6d10:28f2:c3db%3]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 14:06:24 +0000
Date: Tue, 10 Jun 2025 16:06:17 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Andi Shyti
 <andi.shyti@linux.intel.com>, Nitin Gote <nitin.r.gote@intel.com>, "Chris
 Wilson" <chris.p.wilson@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Message-ID: <adowjdq76hwl4rsffbr6moidqe5cu4wue3so3otij6wcfyoaef@bfnc2hrsgn2j>
References: <20250606140753.522927-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250606140753.522927-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DB8PR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::37) To PH8PR11MB8014.namprd11.prod.outlook.com
 (2603:10b6:510:23a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8014:EE_|SA0PR11MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: c69acc9b-22d3-42ed-dd45-08dda827fc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXFTeUcrWmJHUGtqa2p3d084RVlJWWdjUjhvTjBtcE5DbVd5TG4wTTl1RFdq?=
 =?utf-8?B?WHpQK0lHYTM4K1ROeGxraHNCM25jdHVrYXJoelVqUUpVdTlwUW1RTWlDL2M5?=
 =?utf-8?B?RzdoL3UyQlRlNHhUT1ZVbXlGQVNDdzlIWHRydUhRRDU4LzZFTkJuOHpuQTQr?=
 =?utf-8?B?dXREYW8vamVmenQxRThJbDVsbzBtY0JmOE9vbWNnZHlCeGlwbGdSeVAxWUx5?=
 =?utf-8?B?cWNQYVZlTDhhRlpRTk1CeWxYbzRXQ0NYdUczZThaRHY3ME52Q1VlN0F5TFpD?=
 =?utf-8?B?OU1qTVZNRW1ESFBSMVRrMDJoODUvZEQ1OXJzdEZNdHpsaW92akZDYjNnaHdt?=
 =?utf-8?B?a2NjYUc2V3k2b2pYYXcvUW0xY0xOSUkzQlRVUGkrc1FXN1ZZcnJKMkJRRHpv?=
 =?utf-8?B?YVRzU0lYRXdwdUE3TDMzYTJLclZHM3JWQ1ZyOFBKeU1CU0F4aHFjZm55UTF2?=
 =?utf-8?B?ZzlRNFdlRDc5SDhNclpWMS9mOWdpRWJNSEowUVRlcUdTK2NvREUxTU5LQ3NZ?=
 =?utf-8?B?WFBJc1BTaHVqTUdRR0xyenJHTTJ1V252aW0rd0JFcGgwRms4bEw0U1JVZXlC?=
 =?utf-8?B?ZzkzaEYvYlNLR2pYZmNNMW9DeGN6TDltSXhYcUUydVl2Vlh5Q3d6TytrNUM0?=
 =?utf-8?B?ZXBvRVRURmI5SDNmbVhpTWFzT3VVVGdUSEMyK1BqS0t6cnlqeWJ5U24ySUg3?=
 =?utf-8?B?NWlxUlZpNFNiVC9tQ2drZ25id082Vm5LRHlQYXNmdGpkTm5ZdGJHSTZtcHpL?=
 =?utf-8?B?N2QwUTJmeVNNT1YvU3FzVUFLUUVXa3gyamVLc2JEbXVEelhsZ1NnaFRPMHRJ?=
 =?utf-8?B?cTNOUURFM1pUZ0w1UnpNdGhEWXRCVEJlL0xxY0Y3MDBDb0s4NUVpeHlVSE51?=
 =?utf-8?B?TXhQWTZ5TzIwRXptVCtvSkFyeWpSMERXV25idThKc2RIM0p5bXp6S2szQS8y?=
 =?utf-8?B?Y1R2MUgrOEd3MXIvOStjWk9nbGNJOUFmUlNzUVBlbVd4NW9Oc0pRcVZQOVBH?=
 =?utf-8?B?SmQyRVFJN2tMdG9QU0VhNWZRdjR5d2g0MFh5MmgvQWZyVmVMMXJ1UjI4OUF1?=
 =?utf-8?B?NmlyeVl6VXVNMVoydnFzSWJraDI0UHc5VlVvVWdialhtQ1BUT3BVNThsRG15?=
 =?utf-8?B?MXhFS2ErTVBqaEl3b0lmM2FtUm10citPcGtkNHNtTUpPVU1WSytYVkxLSWt1?=
 =?utf-8?B?YXdrTzRZSEpoWWw4RkN3K3RWK3hMb2VYaVkvUjZTNDk3aFh3RG1ON2hZaEtH?=
 =?utf-8?B?QXlmM0EvZllDR3l1TWhER21KZVMxbTBYaXQ1ZlJ6cW9TVm9TUUY1WngzVnR1?=
 =?utf-8?B?aGlCV0xCaG9QWmNFMHlLUFk1TGRISUlPRTVIS3I0RDdDUWwzTHd6K0ZOanEx?=
 =?utf-8?B?b3YrMWhMK3FBbE5aWHlsT1dkdjF3VDVtY0t5enduZlNsRjcxdERDNlc3Mkdr?=
 =?utf-8?B?RGJpSUZGWDVBa2R3UktMMS9EdmlrcEhaNHNVRjl5bDZLZUlXTFY5cUlnS2FT?=
 =?utf-8?B?V2J4OTIzaWVJc0QvakxTSmdxNnpwOHVIcWcreHlqbWF2NnlKU3VwQVZ1MkdV?=
 =?utf-8?B?WnJsVHJHTDJYanVBczZwYkV5b3pxZG52VlkvOStBb0N4QlJ4WWZQOTd0Ynpi?=
 =?utf-8?B?YytmT1AwcHdwaldPTjhzWFBZRmJ6KzR6cE56SFh2TzkyUjBzRDMvZmh2SGRN?=
 =?utf-8?B?a0kxeFgrNndabFFGUlFnb2V3V3p4UGhTTWpYV2E2bHJLaS9TN3UrWWlZZE9E?=
 =?utf-8?B?N3BjdjAxU2lWNFFDYWx5WjBteTNyNzdsSCszRmNZUUVRcHQvSkdIYXFXaVZv?=
 =?utf-8?Q?UPI/hKIAYhRB9Ww/5ycInk0SKcZsARawD/jYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGRJOGdacERpRjQvWGJWT0FmQndmcXNKZU5vUFNldmFTbCtsdmExMTgvbE11?=
 =?utf-8?B?TWZGNXIrWHhDbHhLT00xYnk4eFlqN002djVGbnF0b2RURThZZU0vbytCZkov?=
 =?utf-8?B?a0NDcGFVbUxTaExNV1BBUXA0ZWdacUZ2d0RrVytURnhOZWEzWW5UWm54Qlpu?=
 =?utf-8?B?blJxajhva0lFaWxFOEx3OWZNN0RVUjJzaEhIalJyWU9IVWlqVHRGYUdVOEw4?=
 =?utf-8?B?cHZmcnRYNFVsN0djSnRzb0lGZDBPRm01QXZxeHV5WFRXd0EzdE1ITTIyUjVj?=
 =?utf-8?B?emV4ZnBiaGlNUUtRa2FZbWlEVkJhNWp0d3N1RGJwTkNDVDltdjZla1pCd1N6?=
 =?utf-8?B?SWxEMGk3VGJ1RGlteWhYbEE2TUlWM09FVW1UVDlCbEpwanc2aytvR3lCRU0w?=
 =?utf-8?B?NWliWk81V0V3UHB5eEVuTnVVWWZFOVVNbWNINFVWRk9tWmJhUCtYQUU5SElu?=
 =?utf-8?B?cEQ3UVdnOGYzSlQ1ZXRmLzRvYjBSdklqMXdrWUJ6U2svYlJIQitDZmNZK3Bm?=
 =?utf-8?B?aUNhUzlZUTRPdzIwdldzNWNjUExIUFE4WHVyWlpaTHZzR1o0RlhjeXdjRkJ2?=
 =?utf-8?B?OU1ocW9VYVkyd2xzOVdOZHh0UmZ1aUlKZ1MzRXBYYkJubWNnK244NElkNkpT?=
 =?utf-8?B?Mkk3RlBLYlo0S3lTMjVhMU9oeS9rZzV6SW4rQUlRWlFrbDZpdjRvSG81RnJ6?=
 =?utf-8?B?Vm9YRmpxaVJvSjJaRXp1Z3J2MHpYOHlpNko2VjJ2N20rRDFrNm80YzIycUts?=
 =?utf-8?B?NEg2NjFnOXg0dGVTTHgzY3I3aVVSRFI5aHpHZk14N09RUkhoZGI4N1NhZkNW?=
 =?utf-8?B?UXlZcEFhbE1ZV0dyR2lxRVNTeDJxOXpaR09oOTNnQ2pZZkR4L1p6aXhnUWdO?=
 =?utf-8?B?dUFKSFUveGFvT1lvUEJnUlEya2lNQ1ZHN2NENWhKN0p1MWNZNXVoTkFrRWha?=
 =?utf-8?B?VEw1Ym9vWkhBYjVBSERIN0x4MEkvZVdqUDEza2E4NUtSODdhdkU0ZC84ZkVR?=
 =?utf-8?B?RXg1eklKWkdlV2FxdjM0bldUWHltUVRmVWlqQkN4MWZNem9ySWtsYkFZK1RH?=
 =?utf-8?B?aGNnakFMU0FjdE9sTzh3QWp5UDYxTEpnZ2FtWE9KRWk5S051TTNoS254RFpo?=
 =?utf-8?B?TVI4MEJMdlE1d0Y1VTA0SmIvenhQTDBwS3hFRzNsWnJzK2ErZzBpbnBWcEFB?=
 =?utf-8?B?c3c0WmYyTGthSzNqNDVUZ3JiRHpEY2syTDR5dDYvRk1qdlB4YXJNTldnKzd0?=
 =?utf-8?B?bXlabzJDcHFoMXZSdytDQTJZTEFyclpWNWVNejBTMzIreTg5Vm91TlZiOTkr?=
 =?utf-8?B?cUMwakwvcWtEZUVUVW9BRE0rQmZWdHh5NDlnbHFuWmp0VzFLNUhLYUg3SUMv?=
 =?utf-8?B?VUd4bmlMNnBWZXk1NnpjTGF3azBHdVVkUU1BcTBzemM4emEyYW4yekRXNGpp?=
 =?utf-8?B?cWxhN3JHRENuRFZzV2I3Wkt1TWRXTWJNeklxMUU4Z2F4TGVOZENpdEo2V2Jm?=
 =?utf-8?B?Z0hrcDJuNmViQWdQR0FwVUowd2grby9mMU5MMVZ6cCs5RnkrSkw5a0gxbGVa?=
 =?utf-8?B?aUt1VmlOMlVrM1VSWFVnOWIramRWTUE4MTdNOXE4K0UvUFZTd0Q1ZWtqMjVZ?=
 =?utf-8?B?MHJ2UFpVU3JtaVFPNkd2RStkOVFoZXU2NVBsVEJqSC8xL3diN2RjTk84bkxB?=
 =?utf-8?B?VWEvWUpPV3ZUR2syVUE5MU04TzlyODE4SGJqb2FaZDB2em5uRHZSL1hyUFZP?=
 =?utf-8?B?d1BVb1VqVmM5dVV4RTdXcFhGUS9OTnozSk14RGtVUGFMYURLYzFWZjAwejRt?=
 =?utf-8?B?V1lhQ01VOC9YVlZGNTFqbXlVSEpBY0oxak50dG9McUhjWjhSaXoxRGJlQloz?=
 =?utf-8?B?N3cxOGJWMmlrcFlXbWtIZU9ValIvZm5jZWlURzJGWFRubW03UlYwOFY2OVZL?=
 =?utf-8?B?T3IzaDdFL01NTlo3Z083S2RTdjJJR3ZBYUtBYXRtM1MvSmlVQzNIUlgrRjQw?=
 =?utf-8?B?WWF1ZnZhQlc3SUJHbWhTVDY0R1ExaWNsRVRhdE1nOVBaT0g3ZWgzbmkyS041?=
 =?utf-8?B?Y2krMDVKMVI2bTVLSWRDQnAvY2VMaDJVMXpQUk9VSWJJZFFjRGZYeW9PUmJJ?=
 =?utf-8?B?K1lyVmJwK3owUFVDYlhhazlCd3lSM05kQitmR3dveXpOeG9pT1JON0dSTlNB?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c69acc9b-22d3-42ed-dd45-08dda827fc5a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:06:24.8548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ku+vg4pvKrj+P1dk7vViOD1gUTA4y/5VC/keQzeBKyGQxlX8QagSVwUdYyLIdjY2yMG9jD8aI2NgTVauJY1x/hRJeahkDKaX48jVwJSs+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7157
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

Hi Janusz,

On 2025-06-06 at 15:58:08 GMT, Janusz Krzysztofik wrote:
> The following error has been reported sporadically by CI when a test
> unbinds the i915 driver on a ring submission platform:
> 
> <4> [239.330153] ------------[ cut here ]------------
> <4> [239.330166] i915 0000:00:02.0: [drm] drm_WARN_ON(dev_priv->mm.shrink_count)
> <4> [239.330196] WARNING: CPU: 1 PID: 18570 at drivers/gpu/drm/i915/i915_gem.c:1309 i915_gem_cleanup_early+0x13e/0x150 [i915]
> ...
> <4> [239.330640] RIP: 0010:i915_gem_cleanup_early+0x13e/0x150 [i915]
> ...
> <4> [239.330942] Call Trace:
> <4> [239.330944]  <TASK>
> <4> [239.330949]  i915_driver_late_release+0x2b/0xa0 [i915]
> <4> [239.331202]  i915_driver_release+0x86/0xa0 [i915]
> <4> [239.331482]  devm_drm_dev_init_release+0x61/0x90
> <4> [239.331494]  devm_action_release+0x15/0x30
> <4> [239.331504]  release_nodes+0x3d/0x120
> <4> [239.331517]  devres_release_all+0x96/0xd0
> <4> [239.331533]  device_unbind_cleanup+0x12/0x80
> <4> [239.331543]  device_release_driver_internal+0x23a/0x280
> <4> [239.331550]  ? bus_find_device+0xa5/0xe0
> <4> [239.331563]  device_driver_detach+0x14/0x20
> ...
> <4> [357.719679] ---[ end trace 0000000000000000 ]---
> 
> If the test also unloads the i915 module then that's followed with:
> 
> <3> [357.787478] =============================================================================
> <3> [357.788006] BUG i915_vma (Tainted: G     U  W        N ): Objects remaining on __kmem_cache_shutdown()
> <3> [357.788031] -----------------------------------------------------------------------------
> <3> [357.788204] Object 0xffff888109e7f480 @offset=29824
> <3> [357.788670] Allocated in i915_vma_instance+0xee/0xc10 [i915] age=292729 cpu=4 pid=2244
> <4> [357.788994]  i915_vma_instance+0xee/0xc10 [i915]
> <4> [357.789290]  init_status_page+0x7b/0x420 [i915]
> <4> [357.789532]  intel_engines_init+0x1d8/0x980 [i915]
> <4> [357.789772]  intel_gt_init+0x175/0x450 [i915]
> <4> [357.790014]  i915_gem_init+0x113/0x340 [i915]
> <4> [357.790281]  i915_driver_probe+0x847/0xed0 [i915]
> <4> [357.790504]  i915_pci_probe+0xe6/0x220 [i915]
> ...
> 
> Closer analysis of CI results history has revealed a dependency of the
> error on a few IGT tests, namely:
> - igt@api_intel_allocator@fork-simple-stress-signal,
> - igt@api_intel_allocator@two-level-inception-interruptible,
> - igt@gem_linear_blits@interruptible,
> - igt@prime_mmap_coherency@ioctl-errors,
> which invisibly trigger the issue, then exhibited with first driver unbind
> attempt.
> 
> All of the above tests perform actions which are actively interrupted with
> signals.  Further debugging has allowed to narrow that scope down to
> DRM_IOCTL_I915_GEM_EXECBUFFER2, and ring_context_alloc(), specific to ring
> submission, in particular.
> 
> If successful then that function, or its execlists or GuC submission
> equivalent, is supposed to be called only once per GEM context engine,
> followed by raise of a flag that prevents the function from being called
> again.  The function is expected to unwind its internal errors itself, so
> it may be safely called once more after it returns an error.
> 
> In case of ring submission, the function first gets a reference to the
> engine's legacy timeline and then allocates a VMA.  If the VMA allocation
> fails, e.g. when i915_vma_instance() called from inside is interrupted
> with a signal, then ring_context_alloc() fails, leaving the timeline held
> referenced.  On next I915_GEM_EXECBUFFER2 IOCTL, another reference to the
> timeline is got, and only that last one is put on successful completion.
> As a consequence, the legacy timeline, with its underlying engine status
> page's VMA object, is still held and not released on driver unbind.
> 
> Get the legacy timeline only after successful allocation of the context
> engine's VMA.
> 
> Fixes: 75d0a7f31eec ("drm/i915: Lift timeline into intel_context")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

LGTM.

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index a876a34455f11..2a6d79abf25b5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -610,7 +610,6 @@ static int ring_context_alloc(struct intel_context *ce)
>  	/* One ringbuffer to rule them all */
>  	GEM_BUG_ON(!engine->legacy.ring);
>  	ce->ring = engine->legacy.ring;
> -	ce->timeline = intel_timeline_get(engine->legacy.timeline);
>  
>  	GEM_BUG_ON(ce->state);
>  	if (engine->context_size) {
> @@ -623,6 +622,8 @@ static int ring_context_alloc(struct intel_context *ce)
>  		ce->state = vma;
>  	}
>  
> +	ce->timeline = intel_timeline_get(engine->legacy.timeline);
> +
>  	return 0;
>  }
>  
> -- 
> 2.49.0
> 
