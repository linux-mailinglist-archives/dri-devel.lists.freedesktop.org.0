Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967F8A0B314
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1862A10E5E7;
	Mon, 13 Jan 2025 09:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCPKpR3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6614910E5E7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736761054; x=1768297054;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7CwxTk+kdsO+sw99fLEXuyzuHQrwe7cwjpP3Fe/Of5s=;
 b=nCPKpR3vQcF+TSfDhBF7vT+qZdx0PY2eciwSlo/fX2AFY5cDr7q/XJlR
 1rm5W9xz7G/PdTcBIR4kuxIj9wSwW0SyvQ1Zfrjydubx+u599MnkSPc4r
 i/wMtVUyxvng7nLDUK8xTShyW1L2WghThybn0fFbbhlvXy/lKRs8eNl+D
 Xw+hUHWyhgx4wi6wq8Gx0wFEAzEGtWY3EyZKGEt9oWQ9BPn5LCK4tuBqp
 zoO5G4puuOC0TvvRuB27rYbASlOZhpMvPRS5twlofBk46P5J534SO/xKL
 MUJCg3IjiD9Kl/w0QSA+p15vPT2gUnNzyJ4CLgf48Nm2ghTjBgN0E+G4J A==;
X-CSE-ConnectionGUID: yrRDq33yTyClC9o54zV+Kg==
X-CSE-MsgGUID: /zzdkwTsSwWsmiizZiB8Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="54555126"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="54555126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 01:37:33 -0800
X-CSE-ConnectionGUID: 4fqNqGwxRY2iN5R1xZmViA==
X-CSE-MsgGUID: 0kz8Se+UTLeE0CjnLE9Hew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="109455505"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 01:37:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 01:37:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 01:37:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 01:37:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLBp3EkM3J3M8pFfLQQnKXP9HIWn10K2qF4D45eZFzmH/XOuPu9Ce0JaxYwvTGkrcPT0KrJILKBQGWRC6gMYqvJYPES2MRJ6YwYFxDet/DJYYlSh11RnR9S/SuKcxLE0DhsWSBihAwfML0/aUvuCDicfSV2UAfbYsLqy+7JUlSaJpzuYUT7wJcMqiIGBQYA2wVueHBm5TWmLj/IsLLKo4ZxxpuY2/XhOY6VuYxceU6AAI4T/q4bafn8RcPrPZTseGEDagzk3376e97YLqNpSakx5tdaAPSu7R+LwaeVoVDPVrhT83GMO0L1Y/d2QhuKpLPnYn52Za5PfDFMUxZEF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOhhvioca8rUDid/d7inf2WzmEC1qigwIc+QLFTELD4=;
 b=T/rbVr/4ARm0NMu0WaUFCtc3Y4seHXlYslZEH4/ltXTMUdAQ5JVutX4jPt2Clurmfy43vMAtFyY2OEmuSoGZAeV3TAI0xvqhHJLDAmpY15zuevWplyLtan/VT+B/GhN/M4tpUIlkq5Nbx00g+U0Lz07aLz/dXivGU85V5vnHZJBdKCWChhTD72aee7mv7BhI5iHjO6WGaAWcLKLuAfseENVdQfomzcSSFW95ocP/AJe8g7gezN305Nv69Zj6VUAkNi8y/UKR0Ww2X3qcTacWnKut38LghnHS2zYpBSIIPhzifacfcUQ7U+uOgxs70xU9P9M6bOMauFixXcNSci8G+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 09:36:59 +0000
Received: from PH7PR11MB6860.namprd11.prod.outlook.com
 ([fe80::6e15:3972:6921:2de7]) by PH7PR11MB6860.namprd11.prod.outlook.com
 ([fe80::6e15:3972:6921:2de7%7]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 09:36:59 +0000
Message-ID: <5f339c78-c641-44ed-84c3-cc1972bc22dd@intel.com>
Date: Mon, 13 Jan 2025 10:36:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Ensure irqs' status does not change with
 spin_unlock
To: <dri-devel@lists.freedesktop.org>
References: <gtrmxhovj2qpmcica76f7uxharhztbt7fdoromyxbsd7ltjvuq@lhnv2wcxm7or>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <gtrmxhovj2qpmcica76f7uxharhztbt7fdoromyxbsd7ltjvuq@lhnv2wcxm7or>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0254.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::26) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6860:EE_|MW5PR11MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a733403-8771-419c-60df-08dd33b5d356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnVLemtMa2hoejByclorcDhtU0lpdWdSSWFRZHJlallCdWJ6aGVaclg3WGg5?=
 =?utf-8?B?UEJBR2VoSjdCZTdQc2tlVUJWNWovSktacncrc211UlZibGx3T0NmbmZDTUwv?=
 =?utf-8?B?eGhBajlKelE0c0V6VlFOUk1sZ0R4TFBpSHJMOUdINk42V2w1M00xVUE1S1BN?=
 =?utf-8?B?dTFnaDdQa1ExK2llSnAxNWhjMVRCMmVPeU0wVnZYL0pJb3FNNmtrY2szU2tk?=
 =?utf-8?B?alRyang3V1ZzZWxnZjliTzdPVDdZNFRMZVRzb1BaNlgrWDFFcEpwQ0kvZWhV?=
 =?utf-8?B?K0VXdnhJUWhMcytDOGxQNmVuV1ZodkFMK3JOUTlnbFFUakNnM2JIY0VocStK?=
 =?utf-8?B?a1F3UkYxTTJLMkMwRTdnMml1SFRCckx3UUc3MmFMZ2ZWTFZsZCtvQXFUaVIw?=
 =?utf-8?B?SVAwaDArdEJHbG9HTXNaOXBYNFY1VDhudm5heXBLSVp1dlVzZ0psMVZoR25B?=
 =?utf-8?B?dUprbzkxSGdDWmw4V2t2MUp4REdoSGhjRkhPVG00eWliOFlkczZPdnQ4dWha?=
 =?utf-8?B?VGZONG5Da1RmL3JSbXBacVFtZFlDdEh6clFCZ0FENTNHRFpZQkFnMWxSbTl1?=
 =?utf-8?B?UU01RWdSb0hWeU9WbG10eEc3YUQreHZOOXlkcklENmJ0RlREVW0wZGREcVVn?=
 =?utf-8?B?MlFTaS90OVZCcEwxOThQTGNneWxYQ1VDQms1MXdUMTdEWmxUSEp4Zmd3eFhX?=
 =?utf-8?B?QkNDdVhMVWg3ZUszWjRXYlQ5UXJJNDJCREtVZG8zVldWVzdZdzd4Z2tzSVor?=
 =?utf-8?B?VHNRM3dSK3F4a2ttdjdPVmZicE9KSTdKL2d5NnJJUC9MbDNIT0NhUlp3aVMw?=
 =?utf-8?B?NTBuSE0rRENGRXBLWWdvUnpJL2YyY1J2Mno3djNydlVZYjVsTDJscjRHamMy?=
 =?utf-8?B?R1d1YWtKckxaWWlGR1UxN0FGOUxWcXhQZFQvOWhMbDNMLzMrR0VLQXh4bHp3?=
 =?utf-8?B?UUJDWm5mdVRqRHlJK05TQm9nZ0FSalU4UENGcHNEZ3VacFhTM2hBQXhORklC?=
 =?utf-8?B?alFmdmxjdkc5SUIwUlY4UVYwOGtwMGk0VFBFcGM4K09BdWhFSklNc3FMRXpG?=
 =?utf-8?B?Z3FmQndON3Npak9Ka1dZV1NUb0pwRGh0MXY3ZFhtL2RreFRwTUpPOWZ3ZEdG?=
 =?utf-8?B?ZzFUT2dNYVlvTzBQUmxuR1BxNTExaVRBVWtqNFJ1NTEzSHJ2QXZ6elUyVXhG?=
 =?utf-8?B?QTByOTU1bk5Eb1hnRFZyQk5XcHdXbHB2QTkxT3RPRGgyRjBsUEYxbi80VXFw?=
 =?utf-8?B?bGJxMEgwODYyK0dKMU5ndlBXckp5RGRRd3NEOE9UeDk2OHloZXcrMU14eVJq?=
 =?utf-8?B?bkpmUEgzTnZ4SUxUbENBQWNvTUk5Q2MvblZEVUM4MGcrZUN3cm9PY0tpZ2tJ?=
 =?utf-8?B?bG56VVdTREViK3RpNmlvT2lCaHZZYmhhU2lkRVozT2N0d3VJNWhMSlI5ZnM0?=
 =?utf-8?B?Z3NkYVdJWlBUMDZtL2M1OHZ3VkdRZEhORFRpOHo1QnFjcVRmZTlBbEZsUFR6?=
 =?utf-8?B?dDB4YytKcXpFZllyUUR0U0doNmpIRE5lTUx2U1VldTRGMkMvWTY1dERhM2N5?=
 =?utf-8?B?ekJkNlIwdG1DaWlKTTRKbkxxb0dLR3dsN0lmU2M1Z3UwTHEyMEtzaStoODFE?=
 =?utf-8?B?N3Bzdmt6L0lNOUp2ZmlBdFg2b0dvbU1qSlNLSDNENHdMUUlvSGFSbExFOGVj?=
 =?utf-8?B?UlJvQTlLOUYyRnNSanNrNXNHQUNlQlFSbkJJTFFFcExjWDBPR3lSOEVrbEFC?=
 =?utf-8?B?WFd4UG92TU1QZnYycGU3OW4zc1liRktiSkpDVVBwaGVraHNDc0Y4T2IwMHdW?=
 =?utf-8?B?N1gxUFdoY1c3eHBnNVMzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6860.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHp2ckN0aUdCSHFIa1lMR21DalFReUJnemx6dHBJbW84eUQwcWRZejdpSmcr?=
 =?utf-8?B?VWE4aUVVR1dTZFNRUHFRc2VtYUU3NUxwS29JSHJYRWs3dHBzeU5ndUxjVWJa?=
 =?utf-8?B?eExBU2NoYUtYMWYzalhuelB3akZhUHFlelRvMy9QUW55WUFLVU45M0draGhN?=
 =?utf-8?B?WFNhTjBNTWVjWDh4aW5INXdRV2RUNDRYb2VTOWFSUTZzaVk1WnZlenFTR0FO?=
 =?utf-8?B?cTZnSTBlRmZHN3J4SXpVcVFBZ3YwNkxrR1NicENqcWJHYTNMOGxQditEZ3R3?=
 =?utf-8?B?dlVaRmxoQStHd1ZxU3puWWgvSEtnUzZtb1hyVGxQenF2SlZ0bDJhQmVvQ29t?=
 =?utf-8?B?T1pIcW9lMVpMRzlmRWpmVmhCcmE2UHluV2xCY0ErZHhOdUpRM2RYUmlEd3V3?=
 =?utf-8?B?ZG9ocW51cnNncUVYNWxOcGpteEdhK2NWKzJCQUJraXhTQitzTmZ3NWxXMS9a?=
 =?utf-8?B?U2dGUEhhSk10Vlc0ZEllVEpjbm01WmpLcVdxRTdTNi9kVzNzTGRZMjlkVHRY?=
 =?utf-8?B?WUpGeHF1UzJRUkZibGluMkpTeHdEZ2VCTnJ1VmJmd3hzbytocnQzOEtoZGhB?=
 =?utf-8?B?dHVXdXUrZ3F1ejd2aHRxU1hpU2lveTJvL0tRSFdJc1JFTWYwbU9BQ0NTdGV5?=
 =?utf-8?B?VjVRMnJrTkZ1aGJ2M2M1ZW9CdzEzbk04S0hTZytzSmh1bjZ1T2t0ckRIaDlm?=
 =?utf-8?B?bk1EYXNHNFlBSjZhdDFVWHlNaDlhSnY3QWRROFdNZVppQ2ZjKzZjd25IVzd2?=
 =?utf-8?B?aUV1SzZwODNyRmxpaTdrRlh1WVVlVlhKWDJUeHpucVY1QjdRVHdieTdLb05z?=
 =?utf-8?B?aGRhdXpXemtCekRLdTFjbGNuditCR2s0cHdtS0pMZmtYM2lTMkJsRm92QmVq?=
 =?utf-8?B?VWF5ZStpcEZ0OHV0RW5pc01YWnFDaE54c1pCRUJsWlYrWlRFYng1cml6N00x?=
 =?utf-8?B?VjJyVzNPbzdsRE5pbmZ5OWFRN3VTNnpQMSsrU1lhb2JwZGFlOTA1R21WMExT?=
 =?utf-8?B?OU1IZW5uaWZmcXZoZU9SeGExdStWYUl4czFrcGl5QnJrRGVHbEl6OXlkV2E4?=
 =?utf-8?B?b2cwcy8vcUVOYlJIWUVxSHprcEgrT1hFajFhT0o3dGpvQTY3SU9wZ2dMR3BD?=
 =?utf-8?B?YUZTQndTMWRDQkpDd0ZlaTJEYUNSanFHMU9JN1ZVOHJtb1dSOU9Vb1NKMTJu?=
 =?utf-8?B?ejhFUEhEMUdtMS9wcVN1eTkybXdJaW12QjIrQ2VuUSsxc0xQcE1rRGsvQ0FX?=
 =?utf-8?B?MklUTm0rZE1VanNBOGhwakJhOVJBbXJhUHZpWnJ5bDN1R3dtZXZSVCsvWjk5?=
 =?utf-8?B?ekptb2tLdTdkdERaUTNTQzl6TVFENDQ5K0JMeW9DVlR2S1NlZldIVkpNemU2?=
 =?utf-8?B?VzZSLzdDZGdUZ3hsZjl0aW83ZUNVVU9kTkc0bm1KTk0wUW5NZ2FEd09DSHhW?=
 =?utf-8?B?RVpITXB0YXRHSEcyLzFOMkREMkR4VitzUVQ3bG00Q2ZlM1J0VVJsak9BUFFL?=
 =?utf-8?B?NzU2c0VjdDJQd2VEdWNqdmN2cmlFSjFCNkdWc0UvS3ppZTAxQnlGeG5BVDFX?=
 =?utf-8?B?MHV4dVpPV3FHeUp2MnVNVEhqT2tybkk4ZUtYOFhoc0FranEwVGZXMVl6NzVS?=
 =?utf-8?B?MzcrL3NWZzVBQlk0SXpkbkw4SnJwUzdwVklNVkhpT05Mckdic0UvdmxJZk9Y?=
 =?utf-8?B?SmM4ZXRsNWFOUzBPdG12L3gxaGJ2WkM0MllRQ0ZXZkt5Zkk0by95WFNpT0NF?=
 =?utf-8?B?MjIzMWtMeDltS2FGOWN0akdwa1hEbkFUVE9LLzQ0VUswb055VGdibmpsaXdq?=
 =?utf-8?B?Y2tERHJNWm5wUElTRmt0WHc1RFVrc0ZETE02YnFoTW9wQ05kVEpEcGE2eTJ0?=
 =?utf-8?B?cGJCY0VGdWs4eTcrVWNHVEZLUFVtckJBcUtLUUh5aXVZRlQ1TDlvK3JuYlIy?=
 =?utf-8?B?aHZUQkhINzBSdVgxU3d1c0NuVlhTa0pEWUU0M2ZJTVBEb1U3Q29LTTAvYmww?=
 =?utf-8?B?OE9kYjg4SXdmOEV5TGlKRkl3L1crYkFDU0RoYnFKTTJKTmN2YXY1endzb0VQ?=
 =?utf-8?B?U1hOVFA1RW9VSDg2aHhFdHhablRnVUxnYWNuYnZycEZIZUs1bmRkdHRMMDUr?=
 =?utf-8?B?S2VTeVM1OE1KNndyc3ZBeCtaZ2JvT0pJR2g4V2hub1V2dUZTQkd2TGFLRjVE?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a733403-8771-419c-60df-08dd33b5d356
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:36:59.2369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGk7tqKyeK2YLAl/jyIq3nRqSwFePzjRrkvO9KV2JYwYx61HDRlTyjJcN1w9+Qoe40AgRvU6sVG1ibJFAqBuIs3vr71YftmzxNBQwpw7atI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

On 10.01.2025 15:08, Krzysztof Karas wrote:

> spin_unlock() function enables irqs regardless of their state
> before spin_lock() was called. This might result in an interrupt
> while holding a lock further down in the execution, as seen in
> GitLab issue #13399.
>
> Try to remedy the problem by saving irq state before spin lock
> acquisition.
>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> This issue is hit rarely on CI and I was not able to reproduce
> it locally. There might be more places where we should save and
> restore irq state, so I am not adding "Closes" label for the
> issue yet.
>
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 12f1ba7ca9c1..e9102f7246f5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4338,10 +4338,11 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   static void guc_retire_inflight_request_prio(struct i915_request *rq)
>   {
>   	struct intel_context *ce = request_to_scheduling_context(rq);
> +	unsigned long flags;
>   
> -	spin_lock(&ce->guc_state.lock);
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	guc_prio_fini(rq, ce);
> -	spin_unlock(&ce->guc_state.lock);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   }
>   
>   static void sanitize_hwsp(struct intel_engine_cs *engine)

The guc_retire_inflight_request_prio is called in intel_breadcrumbs.c 
signal_irq_work().

There is a similar situation

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c?h=v6.13-rc7#n255

There is also spin_(un)lock while potentially IRQs are disabled.

Should it also be addressed?

Regards,

Maciej

