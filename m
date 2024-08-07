Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8A94A768
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 14:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AF510E4DC;
	Wed,  7 Aug 2024 12:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESPcBm84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E527310E4DC;
 Wed,  7 Aug 2024 12:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723032183; x=1754568183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DX7AQvMnrSAfgRNWOuvRyqc5/WtCx0StMNrxnRLFz5Y=;
 b=ESPcBm84RPg2kXF4y7COqYha/P45gwargphVMrCLW39WDjPwXY81DF9E
 EhpANdwAmZwM8ZYiaUe9dHECQm/e1H+nNW3TEk0RrtsbLNGN3ee5+fld7
 1hCDnRFUj2uXwasnaEwNJBrnY4k0s99p0owLwLUBbuSKt+D6DjN2XiIYT
 U9qVIT9majPfw1IhIUdI9ygcCaRwDl7T4G0eByPox5bwXB65Tnt5mtkBT
 692O81FuwIhz6EauZVZLSk3Ck7AIWDqxkO7MM7cNuGOUL6kNZXP/ECzWS
 HVlfZyz2Wo15Q5RPneEdWDMVPMjEXbEHT7h3MCaS0Xv2OPeLgOZ0N8uNC w==;
X-CSE-ConnectionGUID: hDcP70fRRhyZI03tybwqHA==
X-CSE-MsgGUID: Xx1mfBlKSPWlfhQkpSdaYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21238006"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="21238006"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 05:03:03 -0700
X-CSE-ConnectionGUID: 6IBPz+hTRLaF0H3NuOSigg==
X-CSE-MsgGUID: 6wlGrVtnTpeBp/huCAI3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="61714369"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 05:03:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 05:03:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 05:03:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 05:03:01 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 05:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a63gHpP3vxfrWRfJ7kOJ5qqsSGzuVzCZuejZqxZpgoKTHVrM9V/3Ny5kOqDRDB55LkubqyoOH9welejaX3eJxFkPPSCfab5hO3VFCPtLHx5ux+jhBLNSn7v5/uVsDZaTatCCJyv//ioBnRkGuOiLGjQvSOKbDJ+kwyq/XbV+P9r+40LZh21ftr3BAKRt+fh0iRH9SBFkgn7Ytc/8979u1fX/6HOyqHZ9u/3C4hokyFs2CS2g4cjfan29sxoBVS8J+0Tdrop0UqH8QrkeEpt0oidahpyQux6JVHAsdk+UoeyT+rJs+IonzWyvbhsDnZFRER6PjgdvdXV5p7FZ3lRbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8on/crpoA5vAQo44UuEMKhUaIeYCeuwq3KNMlnMuZJU=;
 b=sIgnH7e/7VEuZaEi+VZ/3jPyBjQZDMWPwtkCV1CFw3ZWFRiNG6Zo2qoxXaCie9njH0Kb3f4fpNKwD/5WFgFv1qokt5Hktaw/X92vDRyRbsmthHGL7MA4NKVtlhZBQB3287zNF4aS/k+BGn8ar2ASnByYBqRBgtgZgamr7Pr3GVaSS4ljnVZPRxxn/jpn8NkYV5/v3N7kzLhBAWlxLeC0R66LcqLjz3NH0ZSqyw1oQuNma6V3NztKyPIb/3ZoerZdluZVAH7uV1xnuAOSSudvU1wdlt2VU+l069Oqr+QM7WLSp3XDfeMqxaqE5Nsz1SDIHrjWhWVMerIkzVxgh9cRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH0PR11MB7541.namprd11.prod.outlook.com (2603:10b6:510:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 7 Aug
 2024 12:02:58 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.7807.026; Wed, 7 Aug 2024
 12:02:58 +0000
Date: Wed, 7 Aug 2024 14:02:44 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Improve pfn calculation readability in
 vm_fault_gtt()
Message-ID: <wgh54wjogiwarjpuzjo3bq33w4c46kfhovncdeshzob2fegzaz@vfnwwfflokdt>
References: <20240807104553.481763-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240807104553.481763-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MI0P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::10) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH0PR11MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 939581a9-d26d-4de2-fc22-08dcb6d8e0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SC9oTHRpZjlQTGhlRXcvelpJTnZVZ2Yveklxc1VHUHdqL3ZlWWIrQ1pZV1FK?=
 =?utf-8?B?VTVMV09qM3hIcmFETUFoVEpOemdjTmM1L0FITlU1d1lwd0phUXM3c2c2bVQ2?=
 =?utf-8?B?RUdybWQzU1RuRWFld084SG5pYlptM0lJdEZwZDRXaWM5bnlDYUpIeVJnQXhj?=
 =?utf-8?B?RUFSby92V2JWY2dtU29oMUdMT3lsdHk5U3FiUkxaLzR3VWZJZzBURENYV1Vi?=
 =?utf-8?B?TVIycnlKTlVEdC9VMjNwY2FlRmhBKzErTWtOM1Z0VXA1T0EzMlorRnhxaGN1?=
 =?utf-8?B?aCtXM3pubU5RRTB3VVZuTFRXdWsvY1laTnc0elNUUkpoRmVWSE5NeUYzVWlF?=
 =?utf-8?B?a0VpUXRMb1d1ejBvU2NCSStiSTdBcUZhRHJiY05wSWdDbHF2L1lGT091SzVT?=
 =?utf-8?B?ZUhoTlkvWG8wS21BNHNDZkthVnVwNm5jS2FLNnZGSVhpRWphaVpWSGNMK1VW?=
 =?utf-8?B?ODA1VVJERVNxS0pWZXRvRVpaOWdva1plZlcrWTVNb0ZpS2ZIeTVINkFZamZ6?=
 =?utf-8?B?NmZZTnd6NUsraE0xbWZnb3FTY21OU2NNQXRDOHEyM0JMK3EzdUk3OXJURFlC?=
 =?utf-8?B?YjM5RVVYOGhwMTBYSkNRU040RDJiVVVLdGVPUG1hMEtMa1JUMzVqdTdKVG91?=
 =?utf-8?B?NjNaNWlKY3dxaHN4eWhUUTg2aEhWRnl6RTRhVk12STl0azkySnlCOG5oOFlR?=
 =?utf-8?B?WktLZGpyendyWFB5Ym5NRUo3bkltV000cC9ReFFkc3hTdlorYUxkQzg0dkxw?=
 =?utf-8?B?cU9mV0RLM1FlRkhBRkk1ZXh4UmxBRERRa0w4VmtLMUtmcHpQUjEwcjZYbVRo?=
 =?utf-8?B?aEpHS3RNbEVTM1QvS2JMZGdlUGh1RUR1eVZxRnVKN0JPVW41S0dKOE5HZlRo?=
 =?utf-8?B?ZHFIWTVqNHYwNEphTEpQYUwrOXRvUzN1ZFowcDZYNDVEbWREUkFPRzR2THhT?=
 =?utf-8?B?bjBQRjh6blltU0o0cHJtMnBmQTRkNFFaVG1qOUplbllFWTJpdlJvVzVKU1lR?=
 =?utf-8?B?TU1iOStxdlRlelduZmh6eDJkZUdXdHBuMUd4RndhZld6d3YyMDZvOFFGeEoy?=
 =?utf-8?B?ajVaVGMwaUg3UVBCUHUvamJpeWtreDRieFdISFk5ZmYzaldtMk4wVWdHRWZs?=
 =?utf-8?B?SFJNc3FjSjdlNlMxVGN6dkp2NzFpV09WSVhudFgwMWlrbStzb2FXSHQvZGZz?=
 =?utf-8?B?ekZZa0Y5aG9WZmJ2RFo3dWdzZ09DSE02akZHdXJ6M1hOOGpwTjBkVVBXdlF4?=
 =?utf-8?B?NmtURVB0RWhjZkFJd2tHTDJ1RlZZbjZlTXQ2MVV1a1JEMWU1SDBaa25Xc3ZC?=
 =?utf-8?B?NldWaUEzNnordUtRdDVEcndZaWs3ZnZCTkhoR29iVW1Ma09qMVIwMFQ0ejZI?=
 =?utf-8?B?dHAvdVJQaWExRzlLN0RlUW9Bc2kwdHMvS09ZZ2NiRHZwNmVBNk9heEF3T1pk?=
 =?utf-8?B?eXNnL0hwQ3pGc09pZ3c3SDYvN2tobFR1OG1yU29PWXlsUGlWenlmN3J5UXlz?=
 =?utf-8?B?UHZlUTVIbldmQ3hCTVpkNDRLQThCem0wdmNQWE1HcEdkMDhOQy9LejhNM1p4?=
 =?utf-8?B?NnlGN0YvR2F1Qk81VjMvZTJaOU9XZDRnYmJwcFk0YjJNR2d4WFFOT3ovUlda?=
 =?utf-8?B?VlErVzZOVTcrVDFHV3FZeU5wdlRyTEVnTVFJNm93YlhMMkQ3bHY2NUdXOGlE?=
 =?utf-8?B?a0JBaXZMMTM4M2ovRHJ2WVlZOUZ3NUx1SlNKS1pjb29IeVV3NzBFTjdVN044?=
 =?utf-8?B?Slk1T2NqMVd1UG1UaFNJa3FmeW9VcmZncFZ5ZkdoT1NlUjEvQWVvNytvWHhW?=
 =?utf-8?B?cWpVZXVpZUw2TEludEgrWExOREZZaU03c3V1Sm0rd1ltWXRlbmRQaWlqbWRp?=
 =?utf-8?B?aytwVjgzT0tjOUhqNlBPK05qZGR1OElYRlFldDdLTUM0Nnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG1EdE4xcEUrK0ZLRnFLWXFmejQ1SGZOcGw5UmJueDJCa2IyOUJ0dzZTcjZD?=
 =?utf-8?B?NFhFZVEzUFFRcEplZnJydWhwU3BkNEVsVDRHT0JNYWFGdUFrNGVIY1prVStL?=
 =?utf-8?B?NEtrSVZBdW1uNmJuSm5MZ1ZENS9CTWFwUXJOWGxmTWZ6TklFWW9KNXNIM0I0?=
 =?utf-8?B?TUEzWk5Galh2Z1JxTVQwMkQ4b2sxMitnNk5CaXVoWVNTd0lqbEpESCs1bEQ2?=
 =?utf-8?B?ajNPTDFBOXJsN292QWJYYlBZeGtTeGFJUGlRbmh6bTdQOTVMZlIyWS9Qb3dt?=
 =?utf-8?B?RWgraC9YQ3RpaXB6cm9IeWpoQ1M0VjR3SHl2Q0VFR1h1Wk5Gb1VNcDk2ZW9U?=
 =?utf-8?B?THBiTXluYTEzaWdiTFF0YzM1RWlHWmQxVVJiMmc0bDNONWk4T1puZzNJVHhX?=
 =?utf-8?B?MzdmajN5Zno1Q202RGhZSStCZWUxbERXR2dsZERPYnkzSGl1bTRuOFBoc2JX?=
 =?utf-8?B?Sk9mMUdTcEFoNm1OY1g4enh1ZElDMFRJZjVya2o0aWZiMDB0QzkvVTYvbFNF?=
 =?utf-8?B?bUdQNmVqN2dDR2JPRFFtVjkyajRrMFhUTy9YcGhsUXJIaGJDdUREVldtRFhu?=
 =?utf-8?B?dlkxeW9Nc1VBY0RsditYMTVORlllZFNDZS82dFQxQ1F2bHhDdHNlbCtsd2Fs?=
 =?utf-8?B?TkZzbGJRWjRzcXFScFo4MHhHeTVrZUFzdXdpUXVGNkwyWnFWY3VHYlF3WDc3?=
 =?utf-8?B?ZUZ4MC9tR1BZYkFJcVRvd1A3V0dIVWlBV0RXMmtuWUhWV0VhbURHU2U0ckFo?=
 =?utf-8?B?MnhtQlY2bVpib3hCQjhmRTRwRzFEdkFhVTl3dHRPQnRQQXFwNzdPS0RsdlJV?=
 =?utf-8?B?RVkyZzRwN0tFbTdtWC92ajB0SEFPeElFNUhTUW9jTFFpQnhiV3h3bGJvT2VL?=
 =?utf-8?B?dlpQRkVQbXlpN0Y5cGd0T2xrNFZWLzg4OW1RK3doa1NUUXJab1YvNnpqNlF1?=
 =?utf-8?B?cGdXRExOMTBjeGVzc2xEQlBUNm0xM0pXTXVDbU9sdWZHbEgrVWdjQ3RhWkdj?=
 =?utf-8?B?UEJjL0UrZzU5a0xqUUpmK29LRVVMTkthOGNGWDhMV1VubHFiYk5IQmNUU0Np?=
 =?utf-8?B?b0FyTUhiNlVQclVkNXltOEx6QjFvWWt6NHdBNGducVRQQ2xIdmU3RG02SDVY?=
 =?utf-8?B?bGl4N1R1THZZdEtDYTQxYTlWK09rdkdLNDdBTGx5OHlDbDJJRWRPbU9UNmZQ?=
 =?utf-8?B?UGRUMUI3b0pCMmR0cDg5OVlTSEN1YktwY2xodThZSlBsZy9zcHhsU1BHS2JJ?=
 =?utf-8?B?ejdzeS9aSEhoSXpHbHlKdksvZDFxMkdJQjU0V0RNcnMvR1Jtclg4YzA4YWpF?=
 =?utf-8?B?N0Jjb1Y2bk1GTlZOZGhadFNPNzhqL0NhY3R5bWo3RGFkeDlhSEJRSU5ITjRh?=
 =?utf-8?B?NWhzTHNQSkZsWEdIZEJVdFkwb0k2MVR6aWRCMFFYU2xmS0JIQk9aTkVJekxa?=
 =?utf-8?B?Z2YxUWx6U1dicmNUcHdkRWVjbHZMaUgxTGNTRmlXR2VBMkQwbThjbkhRMGRo?=
 =?utf-8?B?NCs3eHE1RG1NcVJhR0s0NTBqSmhBK3FXazljREoyNHdQYkdVb2JxWEU3RFBl?=
 =?utf-8?B?MUtOQmZOcWxtSGhtTjFNd3VyZHRpYytCZEl6Sm1VcThDaUZTWWdGaFhJZnVn?=
 =?utf-8?B?SW93SGhmaDZXWThVVldXS2NPaTBUNU9idDBUZGZqa0V6eVBKazJQUFpoazhs?=
 =?utf-8?B?Y00yVkRJNy9mL2I5OVNqaWFrRWdSa3BLZ013R1FMcGw4SnRXYnhXRlEwOGkz?=
 =?utf-8?B?S3h1OGZDM01BTjZtanNVMDhwNWowRjFoeXFTZmFwaDBRdmgzMnk1MGhkVWpy?=
 =?utf-8?B?ZENJK1V5WTE0RU1aRm51bEw5NHM3YisrK3crUmRhanJtdkdvVDFXcXArZ2RU?=
 =?utf-8?B?Nm95RHAwUWJaSmhRdExkQWFJakdRdGwvdDNYY0pKZlhYMkkrSGh3Q1N6T0wy?=
 =?utf-8?B?TjRjcWRTMUVHS2pHeVFaR0gwaVdVcXFVd2VzK0dSNXpGVVoyNmZMbTRNS0k0?=
 =?utf-8?B?V0ZCQzZMbmpKM1Q3YWhkWlZ5Z3dEUTk0d1FSbHBxaHZDeWVlY3VmUGh4SUVC?=
 =?utf-8?B?M0IvYVdCSDNmb2g4Z3l1dnY2YXZIbCtWakFoZDNtUjNUOHJUQnBnbXRJY1hv?=
 =?utf-8?B?MnRNL29Sc3dZOTJHRjkxaVRnbFBQenhQQ0toUXVOb1BWQko0V3FEbFVZRDFI?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 939581a9-d26d-4de2-fc22-08dcb6d8e0f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 12:02:58.4601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ne7gk+IFzVYNhyr1HPeRcWm/jurtYovA3cgVjQXAtlY5xGvmNu+uIFAv2G/Ma/CzgPmjr1fwfuvVv0uBo11s5VzlUKQLKA9OlTaAAMZTo5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7541
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

On 2024-08-07 at 11:45:53 GMT, Andi Shyti wrote:
> By moving the pfn calculation to the set_address_limits()
> function we improve code readability. This way,
> set_address_limits() is responsible for calculating all memory
> mapping paramenters: "start", "end" and "pfn".
> 
> This suggestion from Jonathan was made during the review of
> commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix Virtual Memory mapping
> boundaries calculation"), which I liked, but it got lost on the
> way.
> 
> Suggested-by: Jonathan Cavitt <Jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof
