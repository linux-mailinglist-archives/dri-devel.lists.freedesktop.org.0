Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7CA78AD7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 11:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2498E10E725;
	Wed,  2 Apr 2025 09:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElQa/4ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7084210E725
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743585336; x=1775121336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yqfO79g4+69x+Xe5HRZCPPzJO+vlevuzWUk6opco7X0=;
 b=ElQa/4ok/4YPaYWDvHo0hhsmNPQu/DEl6H/e4cys4Rs4/NejPM+BAn9F
 H5Y1jikWq+GYhsk+FUhNfcHLiaCMK+cqFEeZaXGSQ7RgROnup+Xs44dkV
 Ii9qKbRSIXrKYhT6XbyHieeAolzCTlAmiVpaSSQabpEybuyQ2801LjY1h
 XaABIYY62RDUaFZ+e7jtJSFJ0wlo1EtYaGt5Ck1/Jo2G3L5hcIhLfZWTL
 GSHgCPGOpGoD+XwH2VfwBrhNbDcsSylWLA+YgivvrCb2r4twkr4C7je2I
 bggv/zu0irsD9Rhq2ZW4BmPs6pLq0oxhz6xS+sm3GqIxo93LXsY0sieIR g==;
X-CSE-ConnectionGUID: LyLDTv1hSyy2TR6YuQWACQ==
X-CSE-MsgGUID: IRHYiZZ6RNiLUjxD0DCodQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56309271"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="56309271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:15:35 -0700
X-CSE-ConnectionGUID: rdq/pxPDSbq3SvLdE9PUrA==
X-CSE-MsgGUID: 5b/D7QkyRR6SK3lrJ8azZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="127541225"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:15:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 2 Apr 2025 02:15:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 2 Apr 2025 02:15:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 02:15:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFWG1axah2rasXbEjhEVH2PYtt2o8wBcpRILIS79ukPcPY5ImDs87KpJ1YLMKz3ICB7CdVF+0IVG/9T2gIJf5+a1ARAr4rm8xtrJtfnFTdpzcHwlrglfzw0CaFaFKIDHDzerT9oEkQOEnqh2WPrXqFhmiiW5+V+rsrcEeQOp3K4qoBY34g8BfkhhUX7WFbyrlPzsWrU3jfufgn9u8ttgzo+ypoYmnWQ/GGWiJ0On1t7dLoHQtxUOsPQJlnD4PVYodMAnWNHQP9VLTws2vxpL4Dtm/G2Vhe/hGd94Nng38mWBXAU1ZZqmna1gFiwPukF25+txzBnqB1ItsO4Nf2iKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMtLpm9QaARMpo+K8nMCW+27c2IlxX8JwurCzrLmU5w=;
 b=coO/V13LnxNNZVALd++QZQNNJmq3F6poam9cHEFvBJWP7QK5KUy+KlzGrkw2st4R7t86NyWnFAh/71r2vF/clFZkuTt7dkP+6VXzo5zXAn/kouXxgDUNzF5JSUl6dnaIilZGbAC46/WNq1KKS6IQ4dwfB02kb0/dgwb4WhJDWg8UqGLb7kHt2ARNIQ0RXqGRsNeQTF9yNFDk2SnrfMU7gC8is06uNXi6HLcY3BWWvh/OmhInI+nodF6xe7tbFf9b+00iS85PaG7z9Asl3vVkiB4FmrQac4dqVbtEVS6bvlkHEVzeJs/IUVWrRnUBNKPZ3EdndtTO5kQfjuueCcgNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 09:15:30 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%6]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 09:15:30 +0000
Message-ID: <f60ed837-b605-4ce8-9b45-87a9d4f34fc4@intel.com>
Date: Wed, 2 Apr 2025 12:15:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Oded
 Gabbay" <ogabbay@kernel.org>, "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk,
 Konstantin" <konstantin.sinyuk@intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com> <87zfh86rqi.fsf@intel.com>
 <Z-Qij4C8DSmS0Mq-@smile.fi.intel.com>
Content-Language: en-US
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
In-Reply-To: <Z-Qij4C8DSmS0Mq-@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::14) To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 129238b7-5f33-4af8-3edb-08dd71c6ea2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGxxbnVMVDFTT1RzQ3NtSVRrVjIzTExYOVZBTU1GUjVHeC9wa2UwZnNiVnph?=
 =?utf-8?B?Mkt6MFB4cWxIRG91Q1hkOGlSUXVwMm0xMEEwcDltVk1LUUl0NkFiOFljUUFv?=
 =?utf-8?B?Ull2QmN2WE9HWGo5QmlQdWpOZ05KdXVScW1hM05VY2J0ejVVbFRUbmtmQ2pD?=
 =?utf-8?B?a2c5NjM4bXVJaTB0Sk82Tmt0dzdaRlUvTklMTDZtYTFhQzlHNyt2QjBKSmQr?=
 =?utf-8?B?WGJWR0l6SXV3L0t5NmF3UVZuYUdhTjNxcGs1YWgzbk15cXFJcWNic1dSMU8r?=
 =?utf-8?B?K2JScTBzS0EwU3paVGhwZUZ5SWRMRlExdVVmM2RQRXg0NG5mSzF5OXJ1M1B2?=
 =?utf-8?B?YWZWZisvaW9JYnc1NnFhRXREdHhHY2dpRnd2aTBoaU1QMUZRb3JrRGQ3ajJ1?=
 =?utf-8?B?RzFuNzM0Mnd5bS9oSnAzYWtVckRLWnpFQ1Ezb3gwUTZ5OTNxZWtQQUxIZGFJ?=
 =?utf-8?B?a001cFMxUmlhY0E5amtXZDFidnMyenBKMFdXTCtiVVdVVjMvZ2Z3ZEV4Wk5W?=
 =?utf-8?B?YWNtK3g3aTRjTWRpTGpEcmhWNHJBeGozUDI4aW5JQzN1Yk55dnNOVU1nMFlB?=
 =?utf-8?B?aGxMUGNWSmY0ZWIxYjVMdDNaeHRzMVo2a0VUU0liWlB3SDBFK2wvM1ZqeFJH?=
 =?utf-8?B?QlJvS25tL2FNaEYyeXRudGgwbkhUUSs5TmhmYlFtSC82TWo1eS9tbjY2VHFl?=
 =?utf-8?B?M0Q4QmlZUlRpWWh4YVpvcldDdmVpeTlZWFVaV3E3VC9pWkNwWFlscUR0dTE3?=
 =?utf-8?B?MTdSdFo1L3NBcDAzaEdFSmY2SDR4MHdsM3crWjJaZStCUzBxaFErazlVNGhk?=
 =?utf-8?B?TVUxNlVaRVM4UUxET2t4emk4Q3ZqeTRuWEtPVmkrby9iQ3RWUSt2VnNYc01M?=
 =?utf-8?B?eE0xUTZGNEY1Yk9CZ3FMcjJPaDVad050N2t5MnpVYi95RUZvc3RkKzM3d2tO?=
 =?utf-8?B?eUE0WjVobi9DYkpORWlxTzRXRTJIMFhFV3hnMW1JUUN6a3h1S0ZCeTQxMGZX?=
 =?utf-8?B?aFk1bElVS0dPUUhUQUNVOWY4R255OHNDNlFFR0JXeHBwbXV5YW9KOUxTRE5F?=
 =?utf-8?B?R1dkWHZ5amZDL20xa2I0R2FkVkwrc2tObnI1WVJkb1QwUW45SzBITTJVbU1C?=
 =?utf-8?B?aHlHN0RNOERRdzZVOFNpRWpBQTdsaFBvVWErZVNtazRKUnUxcTJPVk92b2V5?=
 =?utf-8?B?UzlnUmpGellXdDZYMFF6a0dtT3RnTUpDelRaQ1BUNGJwNm1YNEdIbzVjb3Nv?=
 =?utf-8?B?cGlGaTBaNnF0LzNDRlp4M21iWGV4eWw1dzRBbTh2NXMzSSs0RS91Q0hTbEcv?=
 =?utf-8?B?NjZmeHJBSFZKcjB0TVl0TzFvMEd1d1B0YWJnc3lpTE5SaUpqWWZ0V29iaWNa?=
 =?utf-8?B?ZnZqNHFPd1N6UmZnNjJ3dFlMSGQ3Q09zeVNvVVM1cTVvSGRPNnJkcyt1UThk?=
 =?utf-8?B?ODMyT3pKcEdSaVRyU3B3bmlzNGxzMUR1aFc3RUJyWVlLSUppSzBMOGpaU1lC?=
 =?utf-8?B?c2NlOFJoSitLUWRwMzg1bjdOT3ZROFIzT2JSNjNqVGRnNkpYUCttT04rdGFY?=
 =?utf-8?B?T0ZlTXNvbDVSTC9rdTFpL25LcC8yZm9hYlAyWUZtcFhIZjI3T1VMS2xtYmNi?=
 =?utf-8?B?LzBhUFRCSlJJaVVrSzBJRmpabVNHUHhwVXQzRGNyWGZrUGpsdGJhM1R1bGRw?=
 =?utf-8?B?SjdqdmlYNldZc3VISTFSRU1RazFtcU0xR0JzRWhaYzdKaUpHYXV1aXdEYVR1?=
 =?utf-8?B?WlhMYnVOWmluQnR6M1NEZ1N5VUFzWlRadDBQa1FpWVJZelI2QzAzdXh5S0Fw?=
 =?utf-8?B?TzFDTS9LS1VMdzZ0UUpjWkg0cU8xSmFWbWE0b0ZtcHBGNENXMlZadGpCc251?=
 =?utf-8?Q?aPE4qYnxHGpG5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjZOQTY4YzlLbGcyYnVZOVZ3Q0g2R3FRK3lVMGVHeFZ3dXZvMCthOURCOHZs?=
 =?utf-8?B?bk44clN6ZUVlQnFRVmFLSUk3ZjJhayt1Uy9hZ29VaXpEVFJRb1liZVByUjJl?=
 =?utf-8?B?Z1M5Z1JnSmpXQWl4anRadHMzRGdOREJwcC9NOXNXYkRYMWJtY21oVEJWdjN2?=
 =?utf-8?B?Q3k0cXowWDFQYTAybWk5ZjVmcHJFL0paRUtON3JZOEN4R3ZOUE9BN0NtWHI5?=
 =?utf-8?B?cEppTVJPZWEzOEsvRHczTEJLUk1xUzIxbjFDaW83WlU3S1dDTUJhRnl6NC9y?=
 =?utf-8?B?b1R0ZnMxd1k5K0pSWWhTaGIwN0JueVE4NXl5SkNXMzI0Q1QzUTVEcUZQUjY2?=
 =?utf-8?B?REhHVGU5Rjd4c1ArK1dQSk1haTJheTBwR0UvLzRMenV0VjBVMVcrR0JoSk40?=
 =?utf-8?B?K2M1Wnd4QkVJNWRtOGdPN21EcTZqczZvNnRPdHU2L2U2TDl2YzhmZU12Yk9h?=
 =?utf-8?B?QnkwNVpkSnB3TWM4TWV3SU1zS0NRa3RkS21Cd0dwRXBJOFQycUZBTDlxbFR5?=
 =?utf-8?B?NDZBOGdwc1RHNG5oZldtdE9mWkhhSmJWa2lSRm56UVorWk8rMlVzMzlXelRX?=
 =?utf-8?B?dWRQWk5qaW9nWDU1ajROd0c1Q3I1eXFhQVZnWGRHd0NISjlhNFhtTkVrUzRE?=
 =?utf-8?B?VndkeTAydk5lQ0VLMzI4Mklxem9kMDRrTUpBUXgzY3ZZb2pqR2xCcHhFSWRR?=
 =?utf-8?B?WVR1dmpGZGJoaUdGYnkrU0w5Ky9CcHZiSUlsWW5QZDBKaGU3VlVpZW85eXAz?=
 =?utf-8?B?dndYTUpRcVo1Y1c3N01ZejA4Q1BtcDN0NTh3cXVyS3ZiOS8vQnplNTVhU1o2?=
 =?utf-8?B?SUZpRHQ4Y2hROWMvNDJVVVBMOC9WU0FGU01MalEycmo4YVp1NDN1SlloaDdH?=
 =?utf-8?B?NjFjYTlYOFZHc09JNFpZNHJWWkNFL2ZsTEN4QVc5MkJBRXhOQnpRcUI4Uy9z?=
 =?utf-8?B?eE5PS1RqVnM2ckQ3KzlKK1Bkd1NZMG5nVTFub1B2bThybmxlQVlWaE5tTXc5?=
 =?utf-8?B?bW5GNXloK1dnQ0YxUkhGWS9vTC9WY0x2VlFmTUFiNXFJb0xFNklNOEdoQ0x3?=
 =?utf-8?B?cUxvZmF2V1RKMUJMdHh3YXpiWXVjVnhadmwzVzEzWmJHSitvVVlOSmJuTG5V?=
 =?utf-8?B?YWpxVWc3T3JNRnNyTGF5c0IzVHoyOWQzRGcyd1ZCa2wrR1NkbGhJNktCaFFi?=
 =?utf-8?B?SUFVQkVSZG1HeGRlcDZmU09UbVFLZ0thc3lRLzUzNG5lVXR5SXR4bEc3OHRK?=
 =?utf-8?B?bTEvOCt4cmJxbUFnQzBQVlpTVmc2aGdCL3o0VmN4WStWb0VMTHlraG0xVVJh?=
 =?utf-8?B?UnJyMzRNRHN0Z3hoVjdvVFFrcXBKR0dFajRZdWEySGtSZXNwcTlqUFlLVFZu?=
 =?utf-8?B?a3lwbnVpc3FySFIwTHUvQW9wL0YyK2FZYnpLRmJGd3c5MFYzNnpJRmRpKzNH?=
 =?utf-8?B?ZVlNc3oyay9KejFDMlVqbkV5UUpmWXBuZWpOWGtxT2NIMnpidjIzTW9WdWNj?=
 =?utf-8?B?SUlyeDZ5UlgybWRNZzBVczJoME5XNkxuYUpLYmVkRHV2WDZ0WHFiWFpTRUsy?=
 =?utf-8?B?M3lGS2ExUTRORnBDV3huNFJkUk5SUlZnTEZ2dWYwc1ozZjFrckI4b3dNWFNJ?=
 =?utf-8?B?VVhOTVV1RkVWSElJRzNBSEFGenFzVzlZcHpEaXJlY3FzVlU3bkVJMnBBU2Jo?=
 =?utf-8?B?UUVNNVVFSitZaDlmSkVDZ2VLcURUNEQvejhUMk12aDBpR0Q2eHlGQUtVYVBp?=
 =?utf-8?B?UWRoK0ltdzNma2N2QnR1MUhGMUNNMDBlV0g5TjVEUVVGS2hhM3hkOW1mZ0Nj?=
 =?utf-8?B?YlF5dk5HbHFGTkk5UkQ0OGIzazc0eEVMblJLYi9xSFA5NjVxTk4rcGllV2NF?=
 =?utf-8?B?MTVjR0tlWUlZbDlWdiswOW5LYzdJb1dEcjFHODd1d1VISXNjV040WTJrSlI0?=
 =?utf-8?B?c3M3dWdGbkRRb1g5VlhQZWJPZkJFMWkwUENsVnRlQlhSUmUyM3Rxb09IUGdi?=
 =?utf-8?B?WHBvcTE5Y25BOTdEamFFYTdjdkRIc1Jhc0FFblY5VTByOU9oUHZQS0tYcy9q?=
 =?utf-8?B?WlBhdjJWcFBRdXRaSDNhU2hDYmY4bllJNDBTb1RJVjFPTWtzclJ3MDVaTzFB?=
 =?utf-8?B?dFg4NnFNaVVqWG1hMU51bk8yc25TVjhMV0FYUDZsd0grS012cEthSi85bW9Y?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 129238b7-5f33-4af8-3edb-08dd71c6ea2c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 09:15:30.5999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/pBb0y3COZkrN4EuvngRybRkucDjBjm9qBc6QonSzxzytFRGnYwpD6UUK0UCn28AdUYGG0IJwXKYZeg2MpvIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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


On 26/03/2025 17:51, Andy Shevchenko wrote:
> On Wed, Mar 26, 2025 at 11:55:33AM +0200, Jani Nikula wrote:
>> On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>> +Cc: Jani (sorry, forgot to add you in the first place).
>>>
>>> Do you think it's applicable now?
>> Cc: Yaron, Koby, and Konstantin who are supposed to be the new
>> maintainers for accel/habanalabs.
> Thank you!
Acked-by: Yaron Avizrat <yaron.avizrat@intel.com>

Thanks,
Yaron
>>> On Wed, Mar 05, 2025 at 01:00:25PM +0200, Andy Shevchenko wrote:
>>>> Use %ptTs instead of open-coded variant to print contents of time64_t type
>>>> in human readable form.
>>>>
>>>> This changes N/A output to 1970-01-01 00:00:00 for zero timestamps,
>>>> but it's used only in the dev_err() output and won't break anything.
>>>>
>>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> ---
>>>>
>>>> v3: explained the difference for N/A cases (Jani)
>>>> v2: fixed the parameters to be the pointers
>>>>
>>>>  drivers/accel/habanalabs/common/device.c | 25 +++---------------------
>>>>  1 file changed, 3 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
>>>> index 68eebed3b050..80fa08bf57bd 100644
>>>> --- a/drivers/accel/habanalabs/common/device.c
>>>> +++ b/drivers/accel/habanalabs/common/device.c
>>>> @@ -1066,28 +1066,11 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
>>>>  	return (device_id == hdev->pdev->device);
>>>>  }
>>>>  
>>>> -static void stringify_time_of_last_heartbeat(struct hl_device *hdev, char *time_str, size_t size,
>>>> -						bool is_pq_hb)
>>>> -{
>>>> -	time64_t seconds = is_pq_hb ? hdev->heartbeat_debug_info.last_pq_heartbeat_ts
>>>> -					: hdev->heartbeat_debug_info.last_eq_heartbeat_ts;
>>>> -	struct tm tm;
>>>> -
>>>> -	if (!seconds)
>>>> -		return;
>>>> -
>>>> -	time64_to_tm(seconds, 0, &tm);
>>>> -
>>>> -	snprintf(time_str, size, "%ld-%02d-%02d %02d:%02d:%02d (UTC)",
>>>> -		tm.tm_year + 1900, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
>>>> -}
>>>> -
>>>>  static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>>>>  {
>>>>  	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
>>>>  	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
>>>>  	struct asic_fixed_properties *prop = &hdev->asic_prop;
>>>> -	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
>>>>  
>>>>  	if (!prop->cpucp_info.eq_health_check_supported)
>>>>  		return true;
>>>> @@ -1095,17 +1078,15 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>>>>  	if (!hdev->eq_heartbeat_received) {
>>>>  		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
>>>>  
>>>> -		stringify_time_of_last_heartbeat(hdev, pq_time_str, sizeof(pq_time_str), true);
>>>> -		stringify_time_of_last_heartbeat(hdev, eq_time_str, sizeof(eq_time_str), false);
>>>>  		dev_err(hdev->dev,
>>>> -			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
>>>> +			"EQ: {CI %u, HB counter %u, last HB time: %ptTs}, PQ: {PI: %u, CI: %u (%u), last HB time: %ptTs}\n",
>>>>  			hdev->event_queue.ci,
>>>>  			heartbeat_debug_info->heartbeat_event_counter,
>>>> -			eq_time_str,
>>>> +			&hdev->heartbeat_debug_info.last_eq_heartbeat_ts,
>>>>  			hdev->kernel_queues[cpu_q_id].pi,
>>>>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
>>>>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
>>>> -			pq_time_str);
>>>> +			&hdev->heartbeat_debug_info.last_pq_heartbeat_ts);
>>>>  
>>>>  		hl_eq_dump(hdev, &hdev->event_queue);
