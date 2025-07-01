Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CC4AF004B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8596E10E2CE;
	Tue,  1 Jul 2025 16:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ycs5lCr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC56610E2C9;
 Tue,  1 Jul 2025 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751388271; x=1782924271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CvRUklPA51AY6B91x/lxaifif+llCf47ULHVMSW/Ng8=;
 b=Ycs5lCr+/CxE67CRVRyrwEo9caxg+f5Ejxto4LMevXLsGS7mufmd+lQG
 2soYcoCp3vqBNnF13+EbZpHlnQrJI/z2THe2oU74Oqc3xzAE1JLhJcM/1
 T2O94TuopVotrj5h/O5RW/XSd+rgvEU1CGS7FXiEmZeTNRkd51b52fNfe
 0yBNZ34HPzyrD1y5T1HtE5ZeVfhVLlHx1aI3JSghZKkiIF9+ojom4+8da
 B+AbcznomoLdZwOXkraSLCI9tSRuJx3xhV8DUjwhKxovjM+r6XtS8LYKf
 ikGxQuq5THT18otmj5TFkiHA53cBAHYz5WMOCp75BoCy1VoXHYqU36WDm g==;
X-CSE-ConnectionGUID: WaavF9SMRV6/C+QW/izEkA==
X-CSE-MsgGUID: 9Doik3MbTUSEVafi3o0jMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53786098"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53786098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:44:31 -0700
X-CSE-ConnectionGUID: UFW28D79QfCWnBWNBUA9Vw==
X-CSE-MsgGUID: B2HiR3G+T+a+K2k3c6IjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153290212"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:44:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:44:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 09:44:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLkIdvCDg+VyaCQ1Kgt5QvlMjd9zY072tLRXdCQnpRQUJzB9BhO0HLtrXkcgeTzYDeOLEJOMbPgpAh26GtFxsf19m6pPWVjsOoWZvUeQTFlRoDKQumWdLZMDkWm2gUaEoOJk3A4bjpRWEnUp+dF+oCjaVMjieLEJGdiYjgJF/nxB+emDQboz2/wka2Ih78Eixbwg40oJmV1iIHjueOseQPlqno0iUYX49SMrjJNqPShXz3B5sn4YUsPsiLb1y4zO5TcY9JI4Obyq7sKqnf+YJ/colKl2KQ9/LqRbqurTlp8Eign6aD+Y6W91cWdx5uBrQ1OhBbjOSPpGnMk/IIgLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBv02tBTg+3F+qGAO2zCfrY0Z9e7CPUp3QWC8Q/9RK4=;
 b=uKrGhxHG5iWSWA7Jd88vNr67BcCEqGvm3x1GaGKNjoXftAVaUR34i0YwgSM0lage84xKWua0w2VvRg4HkPVNDa0K33nuqHpjrWittBC32A7BhA8J2JzMoqh3V28wka/QcfleIf8feB8WyonbEhOzAsGLxFFLMppLSzYnHKNVVeW3+p7BVs1YAGwOx/AsqakWb8JuFRsq+XH/0mQXFlHiO31eOIZtt7+5v/bCuwfmhRwv65u5TltgQyL02FN/JoDw/NeDX9n+IyDPyHOrUeI95k32VMJ07IpqjWD0nQLIClvioNcA7t4JitVte7RlXHPotbGqvxAt6GuHcgXqamXEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 16:44:23 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 16:44:22 +0000
Message-ID: <6e1aaa77-2d4f-484f-8abd-b62d7ddb80b5@intel.com>
Date: Tue, 1 Jul 2025 22:14:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: Raag Jadav <raag.jadav@intel.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, David Airlie
 <airlied@gmail.com>
References: <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com> <aFsaXXKZSBPrcYJb@intel.com>
 <aF8PZMuMgmWKYJgo@intel.com> <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
 <aGLKgholpl8Z3zWm@intel.com> <cebd70d9-57b5-4e89-b715-4ada250e2eb1@intel.com>
 <eb143cc5-306c-4900-b391-9ee023c1c5b7@intel.com>
 <aGPvbagza6HwF4kE@black.fi.intel.com>
 <8f0c1489-df00-4d40-a51c-39dcfa185d3e@amd.com>
 <aGQGnrDZRcq9pC9q@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGQGnrDZRcq9pC9q@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: 966b3f98-734a-49c1-6aa1-08ddb8be885d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2VQNS9lcFNmRTI4aGJ6M0MrUEIrcEk0OXh5T2lrb2JaWk1hc2l0TDdldC9i?=
 =?utf-8?B?dmxiRzFWbGR3V3NDRlJvZVk2a2FKWFplU3pNbnBzMVd2Zy9UbkJLY09Wbnpi?=
 =?utf-8?B?Vi9rTzhQOERRWitSa2ExallUZHNFWVk0ZFRjc1ZaakNXei9pRTBQQXN2ODFM?=
 =?utf-8?B?WituelJ5TlFPU05ITEJpRkVvMERHZUpIWUFqWm1USEtyL3lrOHVyZEVxNWVo?=
 =?utf-8?B?cVJkNWJrWnlnQ21Ca0dnWlRFWjUzL3pkalljcjgzOUltVUFvR1ZXUC9WeXhG?=
 =?utf-8?B?U2ZOM2Qrd0xFbTBIRVhCQnhESWlSY3pkYXZiaWdlR0g5SUVSMFR2RFZTSTli?=
 =?utf-8?B?VFV3SFRYOFRKRVlkeUJJRWs4cGFtN09HbGVlZzVwcUUvRFdZQ2VTcWFiWlFB?=
 =?utf-8?B?MHJOWVdNTmh2ZGtITXAyTk9NR0NiZ1AzY2lCYVBxU2NjZEZtbTlHbndFTGNI?=
 =?utf-8?B?bnlsbG9HQjBWdXd1bmg0SVZFRmV5QUI4Skc0VVZOUzk0eEJlMW5DODlocGJQ?=
 =?utf-8?B?SU93RFpxN0NvV2d5RjZEOXpKNVVtK0EyVXkxTXhJMTlXenl2dG00am9aTmtJ?=
 =?utf-8?B?cEM3SnUxOWU1M0lLaFhscDJ2NUFRM3ZKbFpXM3UwaUpYTVU3aVJtZTUreThm?=
 =?utf-8?B?a0V4UStnN0RnNU13SHRtazV1UUFnd3VBL0FFR0YxSTJDbm9hRFZKY1ArKzIy?=
 =?utf-8?B?Ty9sdDdyelVyVzRhcjBGbk1wTEN3ZndjbU9UcTFiczk1OUZMNW44R3ZLbi83?=
 =?utf-8?B?YjI5VXhEeDB3MGFNUHY3ajJBTTc0ZFlXSmRKRlNTcnNzT29MOGVKV0duZmg1?=
 =?utf-8?B?RlU3cW85aHhWVXI0T1UyL2NDS3lqQmVvdXRaWUt4dFllaGdOOTI2TDFzQkdD?=
 =?utf-8?B?NUpMeHFrTEJwNGdmT1liR1ZGWTlQYzBBSEVnSlFZTThja2k0SlFkZ2VhVUFE?=
 =?utf-8?B?NGZibHI3VXlCSkI4NGpwV29NWlM2bTJYL1U0Ty96YW5JWHVoNEdaYURONW9D?=
 =?utf-8?B?K0dIZmZmWk1NaUV2UmNhc1dmcG1IWGlzbEVndW4vVUFWMEpqaVRuczNWMFhR?=
 =?utf-8?B?NktTeGpFdnQwQ3hJNlcwZWxrZGNWRGNIbmp3S0xtY0JnY2lQRjdBWFJVK0tM?=
 =?utf-8?B?VHdMcDdxRzJhNUFnNjgyQzZZZTFVM0NuOWhqY1VvaEdQWmNGS2l3WTBLVUV6?=
 =?utf-8?B?UDExREFiNlBKQnAzY09KQUJiSFc0eGdCdVlTc3RSK3Jpc2prcmk0bmNjd1VE?=
 =?utf-8?B?TlZtMlJPZXRHVC82dGZFSjZFeFBpTUxKUlBVRm1ZaWZONUQrdHBoZk1zNito?=
 =?utf-8?B?bWR6VXliOXpIckExblRwUTFmdWJ3c1Y1aVpNNEZVL0JHMlRkeEN1cnlxbGdF?=
 =?utf-8?B?MFlNdXpURHJNeTJwdzZ5Mm44MFJnTjdRZ0VjSC9pZlh4dXBGUk5USXVqekFL?=
 =?utf-8?B?WWlUTGs0T0pWTVdFbE9xUjFmM1I1U2lxdXNmMnZHRlN6WXRVSWVrc3ZUN2lI?=
 =?utf-8?B?ekptM3B1bGswTzNpcEhXSSs0bk1zNHVlVVFaNzA0MlMvSisvV293VUp2cEZY?=
 =?utf-8?B?Nkp1c1lDTEtxdmtGdFFWckxaVS8xMSttcnRuQTZXS2dpQ0RudStDazJlVm83?=
 =?utf-8?B?b0ZaYktEYnhJTVdDU0RIVWNKRURmcUdyaUEyR0dvcHZzUW9sVGMyR2MrZ29i?=
 =?utf-8?B?TWpiSlpnN0h3MXBsMGlRKzRLcTRXVU00clBrZlNYSmhRckRLd2x6OHJrU0w2?=
 =?utf-8?B?WjZiR21iTjlWU1FKNW12Z2ZYbHJxODJOeWFvYWM5RVNNdi8yZTU1ajNYakNs?=
 =?utf-8?Q?RtHkXXCT5zgZ0IrXgSuNspd+dqiU7pwHlluD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU5XUnZTUnpiWTRFbitJU3ZaMVBHbno2bkppQ1hTMWNGUUR2NXdpbkVDNXE4?=
 =?utf-8?B?NUw3N3hLbXhkRUQ3L080WE8zY0NnNnBxYmxXOFN6WjN3aU1rN3JIMENBQjli?=
 =?utf-8?B?aVFLYVhYSEJTWlFKSW5ZdUdic1lMam11VFM4UTZiUi9UclRROWpLSTZHOHNI?=
 =?utf-8?B?NkdDaldzaWdLZjM5Q2tkNHdWSjJNUXpWM2xvanFCbVVtdXFoU1FXQlNzRVlF?=
 =?utf-8?B?ZnVxblNLM0tkNk85Y1ZMU0dxSHJVSEdPUVJOV0o5bnhyWFRYM2NwTnZwbUxH?=
 =?utf-8?B?aGJtdTNBVmlLS0dHRk5XZmM0MTMzbVIzT2FYNjJ2MUxpRGJoV0FseFJ3TGpx?=
 =?utf-8?B?eXM1bkhJaXJJTk9JQVVveHd5RTN6cUI0UFMwSUJMd054RWhTaVc4ZjV4aVNi?=
 =?utf-8?B?eHMwZkJzcDd3eU00OW11aDREa2w3VUhrbWtXWTVIeXdkT2FTUjlYTTR1YjE4?=
 =?utf-8?B?QVBialRhQndVY3AyMzJYZXVDS0NIbUpFKzJHQ3k4U2d0NnZ5RjRNbHg4eU9v?=
 =?utf-8?B?bEtOZlE1MFdkWnNwUlZIZWZvZGs1UEZwZFV6SnpZaXNFSVZUbmY0NW9JOGkr?=
 =?utf-8?B?eEtQcVB1N25nbXVKcTY3VVZWaHN4WUgvVWdkYTZnSXVWc1ZGaFlGM3Q1T1VR?=
 =?utf-8?B?bmNHUlNvSENnMEF3NXNVbkd6TlN3Q1F4WVJ4RlMrZTlCRmgzcW5RRmt6dTZC?=
 =?utf-8?B?TFovaWtpWS9XQ0Fpa05QL2p0elBsVkZIZjkwNlJvNkFyUkhZMW1HUHNMU2xP?=
 =?utf-8?B?Q1RlQnJLd0NkWVlsOVY5bm9IM1QxVzNPZTU4VUdHdEVrMlRoaUFreGF6ckN2?=
 =?utf-8?B?anpkeFNxUEJqRWE0WGdwRkNoakVrQVZqdWtpVUZUMkEvWkFqck13WjdiYmNW?=
 =?utf-8?B?Rk9CcmlYOHJuL3RjWGVBSmNrdk1MNHB5UDdkN1RZblJEUENJR0pnR25IQ1dl?=
 =?utf-8?B?MUVRTyt3cG5vT3ViZ2FkN0hkL0hZbVpTdTE0Q00xUWJtK3lKWGRCdDlhTGN5?=
 =?utf-8?B?WFlwYkp5cXhoKzF0eVNpM3VvSHVMMERNOUh3TU5vdTNOaTErUWNUV0VLK2RQ?=
 =?utf-8?B?WFZMaHBkUllDNm1mRXJ3VkZPOHFzc1gyUkZlcWJERkRqZmw5VmZtL0NWb3A4?=
 =?utf-8?B?REJxcVZWU3NiaWx6Q1p1Y2NwRDBVT3N6NEJXbVpHZlhmNURpTjZQVkhlMUk3?=
 =?utf-8?B?cWFMdUlZakpyMm1xa1FZUFNnM09sa3ZpQVQyblZseFJqV1hyUWhNTHFnTXYx?=
 =?utf-8?B?N1lmU0ZBZ09Zd01pb29QK2N1bVBZVzRwYUVLclFYVTU1emhlRVpFK1NJV1A2?=
 =?utf-8?B?UlNlemc0RHFsTTFzeXhHSENZaWw3bUthRll3NmNjYTNmTXNvVE5ZN1ZZejd6?=
 =?utf-8?B?bDZ3NGw5M0t1UXNZajk3ek5XWFExbVZQQVh4eDY5RlVTUEtvbTNBTDVnNUNx?=
 =?utf-8?B?UTBTa3ZvNGk5QkV0VkVvdHJPMnFSMWhZa29GWDZDM1ltY2hlSDI3QzZTem8y?=
 =?utf-8?B?Z1NacVBIK3hwSDRleG5zbVRXaU1UVzY2K1J6blAvdHI3Zi96SG51S09JR0V5?=
 =?utf-8?B?dHpmV3VGQnZuUFE3VGFSa1VDQ0kyWDNnd0lzRExPOTlOMTRWTnBnakF0NnZ5?=
 =?utf-8?B?R0llNnZoekJlbGExL1NYUHRTK2IyZWZnMlM1Qm1qNkRlSXZwZGRvZTkza2JP?=
 =?utf-8?B?ZkRwK041bUUxWEQ4Y1A3dnF5WERsSGxSc1VaNUtTLzBaT2FmR081V3BPeXg3?=
 =?utf-8?B?Y3VScnV4S3AyTHhCb3ZZcGU3QjUwLzJuVmh1ZTJxRVhITVFnN2J6anhiWkk5?=
 =?utf-8?B?b2d6OCs5N1BHTGtKRlN1QThPeEZIaWlkYWhzTUEwUlRMbTZZODVWQ1V0Vno3?=
 =?utf-8?B?c3l1UjNaL3JrSVI4elpBZlhXNy95TGdqaEl0dmNydEVPczFEUUhIYnp2QTVP?=
 =?utf-8?B?NXd1VTlEeWJFZ1pzcHJvejkyRjViRWdlSjdlb3UzS0VLaUdUTFZOR0c4REg3?=
 =?utf-8?B?S2RpUmRoY25SdTl0RzF1bk44Y3pwbGRjSVl3Szl3MjFGQVdHT05HbFNYU1M1?=
 =?utf-8?B?bFlONEM3ZzI0cFV2K3o2bUJiTURMUE4wYUFJRlpRdDBjbjZiSnU4cm5GMW5M?=
 =?utf-8?Q?BMS9hg+N9R/mIT5OoItypkyR5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 966b3f98-734a-49c1-6aa1-08ddb8be885d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:44:22.8806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OU4y6kBbLMYI/89NghzwpYCrMZ64JWFlARiCUJWm83kDsh/aGhJV1pT7t4MlFoIVUCPLEvd6ro+8jOaNQYgQ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
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



On 7/1/2025 9:32 PM, Raag Jadav wrote:
> On Tue, Jul 01, 2025 at 04:35:42PM +0200, Christian König wrote:
>> On 01.07.25 16:23, Raag Jadav wrote:
>>> On Tue, Jul 01, 2025 at 05:11:24PM +0530, Riana Tauro wrote:
>>>> On 7/1/2025 5:07 PM, Riana Tauro wrote:
>>>>> On 6/30/2025 11:03 PM, Rodrigo Vivi wrote:
>>>>>> On Mon, Jun 30, 2025 at 10:29:10AM +0200, Christian König wrote:
>>>>>>> On 27.06.25 23:38, Rodrigo Vivi wrote:
>>>>>>>>>> Or at least print a big warning into the system log?
>>>>>>>>>>
>>>>>>>>>> I mean a firmware update is usually something which
>>>>>>>>>> the system administrator triggers very explicitly
>>>>>>>>>> because when it fails for some reason (e.g.
>>>>>>>>>> unexpected reset, power outage or whatever) it can
>>>>>>>>>> sometimes brick the HW.
>>>>>>>>>>
>>>>>>>>>> I think it's rather brave to do this automatically.
>>>>>>>>>> Are you sure we don't talk past each other on the
>>>>>>>>>> meaning of the wedge event?
>>>>>>>>>
>>>>>>>>> The goal is not to do that automatically, but raise the
>>>>>>>>> uevent to the admin
>>>>>>>>> with enough information that they can decide for the right correctable
>>>>>>>>> action.
>>>>>>>>
>>>>>>>> Christian, Andre, any concerns with this still?
>>>>>>>
>>>>>>> Well, that sounds not quite the correct use case for wedge events.
>>>>>>>
>>>>>>> See the wedge event is made for automation.
>>>>>>
>>>>>> I respectfully disagree with this statement.
>>>>>>
>>>>>> The wedged state in i915 and xe, then ported to drm, was never just about
>>>>>> automation. Of course, the unbind + flr + rebind is one that driver
>>>>>> cannot
>>>>>> do by itself, hence needs automation. But wedge cases were also very
>>>>>> useful
>>>>>> in other situations like keeping the device in the failure stage for
>>>>>> debuging
>>>>>> (without automation) or keeping other critical things up like
>>>>>> display with SW
>>>>>> rendering (again, nothing about automation).
>>
>> Granted, automation is probably not the right term.
>>
>> What I wanted to say is that the wedge event should not replace information in the system log.
>>
>>>>>>
>>>>>>> For example to allow a process supervising containers get the
>>>>>>> device working again and re-start the container which used it or
>>>>>>> gather crash log etc .....
>>>>>>>
>>>>>>> When you want to notify the system administrator which manual
>>>>>>> intervention is necessary then I would just write that into the
>>>>>>> system log and raise a device event with WEDGED=unknown.
>>>>>>>
>>>>>>> What we could potentially do is to separate between
>>>>>>> WEDGED=unknown and WEDGED=manual, e.g. between driver has no
>>>>>>> idea what to do and driver printed useful info into the system
>>>>>>> log.
>>>>>>
>>>>>> Well, you are right here. Even our official documentation in drm-uapi.rst
>>>>>> already tells that firmware flashing should be a case for 'unknown'.
>>>>>
>>>>> I had added specific method since we know firmware flash will recover
>>>>> the error.  Sure will change it.
>>>>>
>>>>> In the current code, there is no recovery method named "unknown" even
>>>>> though the document mentions it
>>>>>
>>>>> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/gpu/drm/
>>>>> drm_drv.c#L534
>>>>>
>>>>> Since we are adding something new, can it be "manual" instead of unknown?
>>>>
>>>> Okay missed it. It's in the drm_dev_wedged_event function. Will use unknown
>>>>>
>>>>>> Let's go with that then. And use other hints like logs and sysfs so,
>>>>>> Admin
>>>>>> has a better information of what to do.
>>>>>>
>>>>>>> But creating an event with WEDGED=firmware-flash just sounds to
>>>>>>> specific, when we go down that route we might soon have
>>>>>>> WEDGE=change- bios-setting, WEDGE=....
>>>>>>
>>>>>> Well, I agree that we shouldn't explode the options exponentially here.
>>>>>>
>>>>>> Although I believe that firmware flashing should be a common case in many
>>>>>> case and could be a candidate for another indication.
>>>>>>
>>>>>> But let's move on with WEDGE='unknown' for this case.
>>>
>>> I understand that WEDGED=firmware-flash can't be handled in a generic way
>>> for all drivers but it is simply not as same as WEDGED=unknown since the
>>> driver knows something specific needs to be done here.
>>>
>>> I'm wondering if we could add a WEDGED=vendor-specific method for such
>>> cases?
>>
>> Works for me as well.
>>
>> My main concern was that we should not start to invent specific wedge events for all kind of different problems.
>>
>> On the other hand what's the additional value to distinct between unknown and vendor-specific?
>>
>> In other words even if the necessary handling is unknown to the wedge event, the administrator could and should still examine the logs to see what to do.
> 
> They're somewhat similar except the consumer can execute vendor specific
> triggers (look at some sys/proc entries or logs) based on device id that
> the consumer is already familiar with as defined by the vendor, and could
> potentially be automated.
> 
> Unknown is basically "I'm clueless and good luck with your investigation".
> 
> So the distinction is whether the driver is able to provide definition for
> its vendor specific cases and how well documented they are.

Agree with Raag. We know which recovery method works here. Rather than 
using 'unknown', 'manual/vendor' macro seems better with vendor specific 
documentation for recovery.

Thanks
Riana

> 
> Raag


