Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBkLI1cEimluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:59:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D026E1123F8
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDEC10E42B;
	Mon,  9 Feb 2026 15:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrwb4yaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74DA10E436;
 Mon,  9 Feb 2026 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770652755; x=1802188755;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dHZKoKnxUVwbF/767G/MGZ9fl3dYDdf26TdIwrzGpBk=;
 b=nrwb4yaUrszl4uM69K3ivDqTWOocWrtM2T3ipygxcn+zg770nczlGNBd
 jTLNZyjRygUBbH0PKP2xLRT0PI8DQ1VT9OZ4TD5hvUahT6g2IuBh+2AcZ
 ubgCoJfby2CofcoPZW8u5oHsSzLgmCe/snXMrhAAp2z0YHI2XHTABDSoR
 6u4GSyu9/v+ObMhfT2ZkUeyXKxo3zGqpdf68+CwX8fvWTid8GAssI153J
 dYdZvuZgO+ggiDZMjJMHC2Yh4LiAbCmSTSCPll5VdICLN5SB4NnyvrzPf
 mS4kvI8U9aR3mztBCfUHnv8KnjAj3sWdv/1eX0K0Pwoa2T5p2m2etAeuw w==;
X-CSE-ConnectionGUID: 8dalHBj+T/SflzHB7YFnjg==
X-CSE-MsgGUID: xrKGIhJxRC+jZb9yHvbx3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71867236"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71867236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 07:59:14 -0800
X-CSE-ConnectionGUID: pfj51xcRRQmCnenV7Abp+A==
X-CSE-MsgGUID: eEWrkqUZROup5/7LnYRWoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216014624"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 07:59:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 07:59:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 07:59:13 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 07:59:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siGgQrAZZQr6QzdkRErKwUxIKPIFM8cGodK6hUZJjc31St4XpiR/imO6gcUEagFvIdTF2i5srbcSsAhU79a5X44N5obD4ik57gGscNmyqIVlTSxm1KevsrHNlGqFwbK+yI1mt3zC+naF3w6hayGtDHzoIZkX5PkRZEAvJEsCkT4pYrTbV+2hvkYzee3Le5Rqm4t2oNMArmldZMdwCxW3A9kkqO6QWmwXfoa9ayAaJTyWiF70KyC85EvTDMml/sleaS2KsU8GExktHfJbx8++9rV9onXkNhI6uKaQ1QqQT3wqRpA4inQjloCAcM41Ddeu0NveiMmSUV8X5vxdJ7NvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCmkr14E0XtVDzUCL49v+mAxC0ycxbPBtPTn5F3NoIs=;
 b=LHtqfxtijEW06i/ocgvJreCucA0P7IMEzJnmTTFSxTkd7X3yx4ccHKYwSW3wt2A34eiGXPzVKNf59BrE9xgBtarKrF00ROk5xe3pqbpIVNF3MPm9trVqPtrZLlUaGulUQEn0gtsOE0Wbg30fkzuUim06oCVVpQ/hcgFReNzZE/Y+DCQbeum0i9B3gyebh58UTc3MGE1WQHc3x+CDqxbZsh3uUgtVmMG+OyPlHASybdlpyzmLthzKejJunwrSo9r3uWnVt3i9ADvRGolOE8xYOBslhrLc/rGzo2OlfuKL7KRks9Ga1blOVzmnUHh5ipi6qs838PTht+oRDVrHh5fABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 15:58:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 15:58:46 +0000
Date: Mon, 9 Feb 2026 07:58:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/gpusvm: Fix unbalanced unlock in drm_gpusvm_scan_mm()
Message-ID: <aYoEM1d5gUpqBnrl@lstrano-desk.jf.intel.com>
References: <20260209123433.1271053-1-maciej.patelczyk@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209123433.1271053-1-maciej.patelczyk@intel.com>
X-ClientProxiedBy: MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: f53c8d40-b89f-4d97-fd00-08de67f41b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lF55AHG0VKeGCGnB9/FkOM+Kpp+ZUCTiNWDQ14wll+TEGW9tsH97TFtV4z?=
 =?iso-8859-1?Q?tTW1UDH/LLirJEfdnJ+NAc7shJkr31ciCzrKZ69WKuH0GL22C/tn3c54+I?=
 =?iso-8859-1?Q?HZoq599LZo47o6v+nM/jcuCeGFPQhORfjD6a4ZeUdP5/ig1FEhS7F96OWT?=
 =?iso-8859-1?Q?koKjSCqFYDbUJLCrqDjbNS+iYWnuTHCCRIsJ0au5dt4Fg2YG0sFnfBfL6Z?=
 =?iso-8859-1?Q?G/JdR2zG2o8fmWJ5AqOW181z4M84h19mTPpIdrMHAgSvE/E+BBg+nMiaOY?=
 =?iso-8859-1?Q?HLzYyvnrj6IOz1YQ7bYPMYakcAvb09YbhqWXjsHzSQ2KHRMbALrWKrsjAl?=
 =?iso-8859-1?Q?iNX7Q7DfhLYupSNanOKKxRiris7T8+A6dV3Ml7MOUwlkuPm4p9/ZCVNjDR?=
 =?iso-8859-1?Q?l4PpZrSYJCJubgJbxKGPWobJDI6SHyZ3HpRSHvjYbT09j7BvlMHT2bsbQl?=
 =?iso-8859-1?Q?6ntI7MC4iTkOaXr157WO6OX+xSYaE82b3n12p0BP91f5Du2g7kRQaCG7od?=
 =?iso-8859-1?Q?UITrLAwPpKudzl+3CGgS3N80r6ldP5CFBoDg5pGXyZIa4ax50GyYIxWqXc?=
 =?iso-8859-1?Q?IHeKmOHivhjYWGpygTsns64CcO0yfdVULJmoYjWRuqJWhBWmsDwBY9Tf1N?=
 =?iso-8859-1?Q?bfUXjKVsAulagGZT5rMUIQGPVPCdc3jHC9+TG28SvA//NJMRMslJe07W0E?=
 =?iso-8859-1?Q?5HQM3US7tjdokC2rcxSfKV3nTGYVJtqHNH40BdxUNbNkEl0QOz28lSQa3r?=
 =?iso-8859-1?Q?liGO7wOamUHOJW/Ldiz31buysVtkdvxOIXvxAiogA0aQaKN2xbLZC7+gtH?=
 =?iso-8859-1?Q?N5OUnIC6kyBXktQwUaBdi3UWSwIRLBvrT5qJ7y+x/ad8ZyYPjFTM54o+Rk?=
 =?iso-8859-1?Q?XT0DLxoqL3bsKThykGsJ1LHODcvZr0xrvu7Vqjg6MXY5RapQRZEaS1XszM?=
 =?iso-8859-1?Q?wZ9JGlfAlDZy3ulchDWKbCN/31JCsGDf5o9Q+JP53kXtOvnH/yAoozN/Jd?=
 =?iso-8859-1?Q?OjvYY29d1i+b0iC4Ixf+et6hpRkiAenvRl47vRZ6UWITeRwy2mOLPRXJIk?=
 =?iso-8859-1?Q?FmjGYdMY6yVH//nsQQdzCx/FQ2wY81qbmqQR3FzPwZ4SG4zOs5EwGXsZbg?=
 =?iso-8859-1?Q?aDx15hccHcPAOQRpc+ofpLozeAE6pdh5iQ/gJNUA1zsN8hZ7v1eL5tAnEN?=
 =?iso-8859-1?Q?+ivVN8miulOVQv0mgUkQyTDell1IKsw92iAgcGJKzRV/bGDDPqxPl0jCgD?=
 =?iso-8859-1?Q?AJkgs23BwfIMAJh+7qbTf8qQX2s8P1Gv5F3bpQxRMhmulMKZeACv/g9EP2?=
 =?iso-8859-1?Q?+rnkBqcc0BOapEEWXFaiYkys+ReBsp+yGdObUzACnKeQ5xrfL/J/bMNt0d?=
 =?iso-8859-1?Q?/94hClaTErsyNSINwTbqwERxjC/QEI/S5CzU+BNcMW2/puScyaTUkQU1BE?=
 =?iso-8859-1?Q?1C+xAzsc1/Q+gN3PC3Oyz8+FI/iJCRJz+Y1MEdB6vjYiNyQ0pNxGwQB5J4?=
 =?iso-8859-1?Q?0QfwQOkAs3WlTWwOFJHnU3oQDKfjSTdxEJRnqOLPehr3TBKzQdZVjCiiaI?=
 =?iso-8859-1?Q?Xdfnd/Y5JiY63/D3sYXqKSsOMdbqzgggFgmZoXGcUg2vBayiy0O36G6K75?=
 =?iso-8859-1?Q?j4ttuKvQ0QodQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?97ZOCkvT9XAqb7T/S/+RzTBawmt6fo4vmsEe/vRb6n9kAxs/gUNCAa43kV?=
 =?iso-8859-1?Q?38ZX3V5GLSNiteYeoiOVsmLGI7zHIpnrr7KOeApkt2FNo0GL1JOtaF2u1A?=
 =?iso-8859-1?Q?0Ax/fb+rgxuo87pkWPscP0MXWA+OB558UnSywgWIqJgwv+eNj5FI/QGADE?=
 =?iso-8859-1?Q?MHGO8hnkPrVsRkwNoWyZjgb5v+9PrYSFZJUvk8aPVm7e3QnoIXTTqHS3hY?=
 =?iso-8859-1?Q?VIAre7slwY0eHTyy9BijHJDBaq6LdRtgSa7PFc56wA30V5b279/0Tno2WI?=
 =?iso-8859-1?Q?cpVgqmoNgoc1tB2fU3eswBsax5VhXgHWdJ4zvAGdR60ZL7IilmvX83gpBw?=
 =?iso-8859-1?Q?lMKlWHmLMTqGXxsDe7/fIUa97kWAbPdOIIItaOAcv00Y3mmcXnNRdtotOd?=
 =?iso-8859-1?Q?TE/9W4CWNgtOrCKJtw0Z3xKsoz9kbWDl56ediomvECyi0FY1MKUHPYuCgo?=
 =?iso-8859-1?Q?xQq5rm9s0PpM+LIggfDZvzrIc39OpOd246+EObbq1ugWr/QhdQiYw191NW?=
 =?iso-8859-1?Q?Z8cz6s3gu894l6+vzVj4sAbWTxyE/bnDHjgF1pEEBXf5fgJ4X4dgmM6wri?=
 =?iso-8859-1?Q?fRlGJ2gLYjCQYJlJoytmmmCdVFAIYibqjfPMycqLohRaBxEpI1lUXpYz5Q?=
 =?iso-8859-1?Q?RU5em6t5/yk+OcjkebvXVDGf1n9L8DOi79WYTU3ghtAMO/7XZgZ9NILK0Z?=
 =?iso-8859-1?Q?a5esy2v00XffaqUi32S/l2z24tqRmzX05a/jfTFLZxRphxkjM6UmWsYxd1?=
 =?iso-8859-1?Q?fWxnzbJFeVHhrz40cQ9I3HIC+OMmmpsyMABq/UiR+ta1a6YwHDDxyBCvl8?=
 =?iso-8859-1?Q?vFSNFBfr5sHjHFR7d7yuOARjt6rBYnVbF1vCGUAkf/Q77osTl68140t+zw?=
 =?iso-8859-1?Q?VThJvR/YS+iJYXknu2Nsgyj3/r7cgRbPv8mSHgvfzLEZBCXE/5wYAdxSkh?=
 =?iso-8859-1?Q?1wql4iRbVoLzz7qZkVJOP6P8li1HUrezSpGjakjSWWNOR4f0DLaV5YX28f?=
 =?iso-8859-1?Q?J8qnEd+5QnWDF2ouQooxIcQHhjqYJkuhJNGHxr9V8KODR3MG6Fp4D1yFkx?=
 =?iso-8859-1?Q?OEmDYZK2RXfIB4mlGgaAWHyRuN0DRU5ccHaQdtUEHJ8MFi52iMoJeJiuPM?=
 =?iso-8859-1?Q?gpzV3LTyArdSqfnkGPEXv4tLUe7VKcMRAQ/uNDX0cSKxrG6nqCDFStOJSF?=
 =?iso-8859-1?Q?2ohzm6u6YnNC78VVUhzj6mUOEmPpEBvK8jwfx/Oitb6hvQRGTbqzG3kNqe?=
 =?iso-8859-1?Q?zaOdnEAxpZ5i/93Sr/aN5iZ6pJQR08D4uzBgctSLRs7vibxy6W2XJRd4fv?=
 =?iso-8859-1?Q?rspoE2OJwsUCTsFBfUHkf56QG3Pu2WB7kVYiywgJMxh+sbNeB5f2cr9nfN?=
 =?iso-8859-1?Q?RD7Zi+ru9lkyQBnC6pDDFWxRVBlaL+cmvhTTmKDRBbQOa59lE81OqFgaSm?=
 =?iso-8859-1?Q?6Elmi4ghokvrSHvROKNbVX7S08qJFr/+wj/7T9x7gVkLJG1b4MYy6qJ3Lr?=
 =?iso-8859-1?Q?U/pT4CWbfbwT2aIJluwVAw1iXvcMCMTbUN0M/5jtgTip/UnOvQpJrVqah9?=
 =?iso-8859-1?Q?yko3Ps50AL6/hqW7Dp+wwwXV4ZPeSZZbcwsT30v/v80ey/Wf8OzeoXgYFL?=
 =?iso-8859-1?Q?NJTBsZtjHfeQoqjUtOAWcSxpdiEde+tMi1dqkNoF9+oV1KUcWj9EP9jdqX?=
 =?iso-8859-1?Q?RVElt54EMqFgNx0tiPbp6RBsUT46VlPCBhS8c/B8jmnPsv4oPImb/mp186?=
 =?iso-8859-1?Q?8vyNF8iXUfqudKA4BLpdHyQy8CoGbLBVSK5yM6FEY+a/hl7SDtlR9Fv46+?=
 =?iso-8859-1?Q?yk/W6qc/dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f53c8d40-b89f-4d97-fd00-08de67f41b0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:58:46.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0urUxy+Nu5WgVWNmRB90Lej8YoU/EVwbqVnEvzFz7GssABkcUDrlRszCk8CDlgdXydG+9fzlvkTwuRLxC0xSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D026E1123F8
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 01:34:33PM +0100, Maciej Patelczyk wrote:
> There is a unbalanced lock/unlock to gpusvm notifier lock:
> [  931.045868] =====================================
> [  931.046509] WARNING: bad unlock balance detected!
> [  931.047149] 6.19.0-rc6+xe-**************** #9 Tainted: G     U
> [  931.048150] -------------------------------------
> [  931.048790] kworker/u5:0/51 is trying to release lock (&gpusvm->notifier_lock) at:
> [  931.049801] [<ffffffffa090c0d8>] drm_gpusvm_scan_mm+0x188/0x460 [drm_gpusvm_helper]
> [  931.050802] but there are no more locks to release!
> [  931.051463]
> 
> The drm_gpusvm_notifier_unlock() sits under err_free label and the
> first jump to err_free is just before calling the
> drm_gpusvm_notifier_lock() causing unbalanced unlock.
> 
> Fixes: f1d08a586482 ("drm/gpusvm: Introduce a function to scan the current migration state")
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 871fcccd128a..c25f50cad6fe 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -819,7 +819,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
>  
>  		if (!(pfns[i] & HMM_PFN_VALID)) {
>  			state = DRM_GPUSVM_SCAN_UNPOPULATED;
> -			goto err_free;
> +			break;
>  		}
>  
>  		page = hmm_pfn_to_page(pfns[i]);
> @@ -856,9 +856,9 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
>  		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  	}
>  
> -err_free:
>  	drm_gpusvm_notifier_unlock(range->gpusvm);
>  
> +err_free:
>  	kvfree(pfns);
>  	return state;
>  }
> -- 
> 2.43.0
> 
