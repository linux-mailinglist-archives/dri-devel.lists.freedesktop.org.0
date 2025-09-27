Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC0BA640D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 00:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C882D10E0CF;
	Sat, 27 Sep 2025 22:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXgrUKP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F66A10E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 22:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759011620; x=1790547620;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HAbFGyElj5z8Pea4c0hUs69iCfzbBBEzC04/b/gcv20=;
 b=DXgrUKP+xUaL+FXU9llLAxkGHoffJImTmwDBIhgXe8LuJR2YXI8EonJw
 Yh/I0tuvwVCGD8RCWf1Oo/SVK+i2Uw+N4f3b8ipfHFOtsxt6N+Y7laTHw
 fiGIbRIr5JreQICm77g3W5uglQCQAGsvG8xMcQoMQrrgqzE6omR3xKTM+
 rqyslnzcGLjllUNVxPbKONQ4NuacsPFipmKh/J8RJx7cgPV9M4svnaWQQ
 vluYJBLz0O96YexaOItCsqRznQc89qcNtVP9ViPhy8I0p88LSxYIiAkSo
 +AzfSwYffJrUcYZ32+lG4a5O8127b4eUTE5gCMAHJWvzsaFG67jP7qzgk A==;
X-CSE-ConnectionGUID: k+/TCDeGT7a/+5zkPnzD4Q==
X-CSE-MsgGUID: R/Wc3WY1QDyBL2HLFx1zLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61350146"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="61350146"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:20:19 -0700
X-CSE-ConnectionGUID: NUETRXKCQAKe3XHa0svyxw==
X-CSE-MsgGUID: /VRvsnMwS+S5nhKtqLdZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="177723185"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:20:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:20:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 15:20:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0Yw42lBqQM3VOa/Z1X5CIi6PHIo8ZjLERw0RrIlRs8A9tLsdBfuCt1bHykoaJ8HNxMTHLjDRYCQVAyacpuYP00bc0PaZJ5Ef9h0bcG+wEE0D+NBNsADiHGf0dztdSPhVL+jZ04Hh6dZyPsln5gd/ItU2CxDJ5OXOryKc6YNNVhlhZamYiwKMlh2CpwS/+7lz7ydxgeav6g+iByxsZb8WVUYpEuz8mwZcYLkUhhuI1n8xhD423w4jFYVrAdcAfiV27KJtkpVA79El6x2UBcO0hPFBLKCibFWIjm5jVLiIh+LRXlfAjoSRArxCrHt1Xlx/mpEW/NY+upN5e/biWyVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+JezvWTJB9Fy1HG2GKI6CNrsX2g+3V9qmO7HGhXLCI=;
 b=xjnTnhLSfr1CfoUruxoV9xp9Tx7tdAlKx1fL7+c7Evzfzz1igC5sCGM0dh/094nwPm+M5LsNYe9H+QU9bcMvBJFAef5P5jUzxuXF2omMtq1OOf43O/ZJKGS6ysPQP5shr9olNvyoCR9BLqkXpS5ouk72WzVNb52rkgybUdAX/y9W5/ASqs3KxPD0iOLFun+GE9OLftk6VED8mE7N9X2GgHjZZbLJ+pu2QA+glvkBGFIXD6tr/3y0Rjqzc1rmH+WJDxCKTNzxuOahT81W/KCqliWPRrXZ7JnbWXp1XNa2dlitOSqMP3yhJGhRlwGnTgTG+CwFi6yfiTq5rzOuhkH11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by IA1PR11MB9520.namprd11.prod.outlook.com (2603:10b6:208:59e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Sat, 27 Sep
 2025 22:20:16 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa%5]) with mapi id 15.20.9160.013; Sat, 27 Sep 2025
 22:20:16 +0000
Message-ID: <0e339741-09fc-49db-b9d5-1e04a0505262@intel.com>
Date: Sun, 28 Sep 2025 01:20:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] accel/habanalabs: Replace kmalloc_array +
 copy_from_user with memdup_array_user
To: Thorsten Blum <thorsten.blum@linux.dev>, Koby Elbaz
 <koby.elbaz@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Easwar Hariharan
 <easwar.hariharan@linux.microsoft.com>, Andrew Morton
 <akpm@linux-foundation.org>
CC: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250927165633.1312-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
In-Reply-To: <20250927165633.1312-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0015.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::7)
 To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|IA1PR11MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 788d155d-7bea-4aa8-53de-08ddfe140929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L01nMXVETkJlWmVxYXg0NDJxTGRlSGRvazJKK1U1cWVROE1pb1NoYVZ6cTF1?=
 =?utf-8?B?azNPeEJKd1oxMURTWjJIOHAwckZrL1VZbHk0UFdOeVpiVkJKRnpnT2ZTblVt?=
 =?utf-8?B?Mk8zYTFwNk9ReEJIS1YrSTBXUldBTmcvWmx2U1lNS2FJbkJ1UmpUQWMyQkJn?=
 =?utf-8?B?cVQwb1FXNVVpWCtGWENhSUMvQ2d3eEhRQXhVWmphaGl3d3p5M2ZJMUZISElK?=
 =?utf-8?B?L2x5bjdQNHNDS0hxUDc1bEJoVjdZOHZtV2trYndTcjAyQUY2dTVhRFd3N0RR?=
 =?utf-8?B?N3BPS2lUeGliWHRDdi9ONDAxMHJ4L1JWUnVtUm44Y0p3ZTJObXRoYm1ZYmJs?=
 =?utf-8?B?ZlBURktlaU8wa2ptT0k2M09ubXI2MUFLOGpTYlJaMW9WRHNZeWFlTW52VnBu?=
 =?utf-8?B?ZzVYYzJvWkQwTlZDWXFHS01UNWxwNy9DK2pmSUQxMG9aSTZJTDVHN1R0ZVdF?=
 =?utf-8?B?dGJSUTNTOGJIRExmTDQ5cUJpc0t1OHBDUjZXM1ZPT3JDNjN2NDVJcTRaSTJo?=
 =?utf-8?B?QnNGZ0V5OGF6TWRRQklIYlRoV016RjdoTHVOR0xYK3BmTHJEY2xwNEtaa3E4?=
 =?utf-8?B?Uk9PMU9LbEVsZ211R1ZyNW1nTUR1aXpTNW93L1BCRk1HVVZOcm5kTGhCanVz?=
 =?utf-8?B?MDRmakhvRGIrZGhweHpHUDJrVU95em91U0s1UHZQUXR3UnZ5L3ZaK251VDV3?=
 =?utf-8?B?Q3lhOXpFR3gyeHlONWFSTHY0d0todHZpMEZ6Z0x6YUFxb3pxOGNiWW0zUUxp?=
 =?utf-8?B?WXliR1VpTEk3YVhtOCtUM0FvYWdNc242WUN2SWlwbHBVRG0zOC84UmkxSEFK?=
 =?utf-8?B?QTZqNlFVajM1bk1ua0NIcUdJSlh5VUltNkNaMG1TT2Q5b1NRZGZlT1hHZlNa?=
 =?utf-8?B?dG1FRitVM3ZOOXdYbWtrTmxZVnU1akdQa3RuaytyMWtDR0JNc1ZMWVQ1MHF4?=
 =?utf-8?B?YlNwYjNjeGJqdTRpSDN5cm5nZEl6Rll6Zm5jTXNPN0hmRmt5T3JSQkFkTVBC?=
 =?utf-8?B?ZDg4anZmbjQyVS80MUhUU1NzQWt0bW9VM0NYcVRmUThPeTNQZzY1ZEt2WEw1?=
 =?utf-8?B?dVcxVUlTUkRCQldNc3I2S2RxUkJNU0hzSDZmVjd5R1dtTXRyY1JBMGtBNy81?=
 =?utf-8?B?WEk0ZG5mdlVKQmRoVDg1QjFwVFMwcjJyTExKRHl2L0NkK3JqSEt6L2pBZHhE?=
 =?utf-8?B?QWRHV0JEeER5WXBBVFFEM2lSTHZ2bXFURnJOM09aNWFnZXh5OUI1cVVJS2xR?=
 =?utf-8?B?NXlCOFZ6T0p3NllvQ0lUM1J0WnhxR2VjNHlDVDBMbXpUY1VqaXhaOU1DZFUx?=
 =?utf-8?B?VmhCRlJlc2xVeG9UYkFycU11S1ZkYnlvRFJYMnJBdjBQRzA4b2IreVdSb0dF?=
 =?utf-8?B?VjMwcVp5WXNFY24zNFdDTnFFNG9VSmJoYWpDQVFwY25rNHltRndtcnppUVJJ?=
 =?utf-8?B?dlVsOWFOc1QrbzVKUmJXSmxjUmE4c1NRWTd0WUtBU2I5eFg3Y0JpVlVYenh3?=
 =?utf-8?B?ZDRDR0c3RTVyeFBPNHlGWDFIczhjVGVQaXB2bDdIQW1BMEE0RllBSlZ4Y1BR?=
 =?utf-8?B?T09OUTVON2lLbG5oTmlUeEdmMEtiWlRtbnlENWpwMmVuYUpZMnRoTFVlTDBv?=
 =?utf-8?B?bXU4UHBZaHoyaHhjS2FVajFlbmZFQTF1UjhQcVF0NkgxWXNTSmdWMUQ0TFZa?=
 =?utf-8?B?L2t1Zkw3WDdKd01PNGpNRTdjNkIwMm1VQ3crd0RuZ0hkYmg1V3pjRThmZGdz?=
 =?utf-8?B?SUN0Y0xOV2hhN05aTVpPdlhYWWxBVHJCM2hYMTF0KzBacXU2Tk0wWVlnR0Fj?=
 =?utf-8?B?dWxkaTdDTGlvb3J4bk5BbWo2N0doQ3Z4UG1GaEljb3ZYczdsVlpMVHZUN3V0?=
 =?utf-8?B?dlZtdXQ1VGNoQytUVmZJQU1hWFlob0VkRTNMTnhnampiWm96U3hjaVpDN1ow?=
 =?utf-8?Q?VgmqhS32LEsrbRKa3EMVqrencdk1owZt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJaTkFpQ1V2QlRDZm1nSzBpOXA5REU3T1dXRTV2cHlTbno4RlJYWmR1b3BS?=
 =?utf-8?B?SERvWVhwYjRObnhYWDNvZmlJRUhEaWJWbTV3RkY2bW5NeTVhd3kyMXZpUVRD?=
 =?utf-8?B?OHVCTkU2MmozdXhEZ09LdTdhS3RkNE1uYVk4ZzEvbkx4Q2h2WmdYdlhFYk0x?=
 =?utf-8?B?OGFFWmZHT1NaOGQvcVRVOE1BbnpCWWhDdytjRUVYNm1PUGVJR2RieU5HNnUy?=
 =?utf-8?B?b29PVTFRY25KUjc1QS9tUi9yc2UrOTFiMEdCOGYrenRSNTRFenU0cytsQUlW?=
 =?utf-8?B?WjlZMXB6SmdETnpVYmF5ZjliVU4zR3FPT3d2ZGxIRVYxa2F4WHVQSWNndHdT?=
 =?utf-8?B?NW1BR3c0dlVNdmRwdWwzTDhHUVlsWWgyamZqWGgwbzZ6cE9SNjRkdndjeFVr?=
 =?utf-8?B?eXNDSUpCYzFuOUhSdHdsdGxCSlJVazI2RlUxOTNvUXVaei9kU0ZFelFWL0Uy?=
 =?utf-8?B?VGVndUgzWGZBTm5PN2M5bEtIL2w1SHFoeTJzZEVmOVdyaWwrWldLdEtuUE91?=
 =?utf-8?B?Q1dKak90QSs2aldZZEZaSjBoK2l2Nm9IMXVpbStERThIdWFBKzBnUVlvbGRo?=
 =?utf-8?B?TWwzemlKall6NkVsNHBKVFNRM2tsRXVnbXVmTStWcnVLbmhHKy8vMWMrcHFq?=
 =?utf-8?B?M1JGNi9CckZMRFlxVGVGTzJIUmIvWDFqRmRBMTIvWmJIM294SHRTTVUvWmR0?=
 =?utf-8?B?aHc3TU9CRUY2b2J4RVlNSno1SHAzY2pNTmx3QnJxMzJ0dHpYSUxFWThESTBG?=
 =?utf-8?B?c1NkOW5qa0QwUWNhbVUrWXdVS08yWWZvd2FnM1k5N1RaN0crV0Jad3hpUGFL?=
 =?utf-8?B?QkRsd1ZpUTBoMENRdHo1RC9RSjdhc3c0OE9xU2tJeVVLOWRqeEZRZktBOXVm?=
 =?utf-8?B?bGl0NE9kYUZDdm9FOFhxQ3llQ1dkSU9oTmxPSE1xZGhQaFl6WDQyWDNYZ3hW?=
 =?utf-8?B?UGQ4ODkrYS85ZEljZlhic210cVNjS0tqQVRzUVNZcGQ1cEN1YXpRN1ZIRllj?=
 =?utf-8?B?Mmk3OE40KzlaTUxybGxJRTRaNTI1U1oxdjROaXVjM25oNG9wUXlPTitqbm9w?=
 =?utf-8?B?NHFGOTY4Y0NSQ08vT3R0dFB1aEN1cmJJQVMrb3FMTHNIOGR6ZzVxMk5BS2ty?=
 =?utf-8?B?Z0M4Vktja1pieVFMa2xlOVovUmFiUUhRQmI2TTU5akhoUFZRSy9tNmE2NVRO?=
 =?utf-8?B?Sm52aTJXRXIvdjFXTXhiTk9veEJaSG5NMFNuQUVCNVp1MjhUSC9vVHpEcTNU?=
 =?utf-8?B?bmdyUlIyNnZlU0N6NS9ZWEZpYWFXVmVGM3IvWkJnTFpTQXNFQzg4bFdvMWZY?=
 =?utf-8?B?VUJnbUlRYjFTZHJoZWpPTHVyaUFWMWtUR3k1bjBRc1ZrWk9HbGhXQ2x6UlFl?=
 =?utf-8?B?dVpIWE10MVJTdHhzS2NlaUxFLzBhOW9rNExSeVhtdlJHMzcvaGVlT2piMzdJ?=
 =?utf-8?B?OExNL05qTmIxYldDSm5aNXIwMjNQR3VyVFUrbTNBcVJQS1RYNGFseGJHQ0Ix?=
 =?utf-8?B?aE9YMmxaYTdzMGZqOWpJUmtoM2w1YnlPVW9Ea2VwaGdqM0xERGVFTktTeUI3?=
 =?utf-8?B?RkJDVTdhNkJ0bklpY3J2NFVhN2JBeFRjQllmWEg0YURzWVYvdlF4MVdUVmRr?=
 =?utf-8?B?WEw4M3BibDZoTTdOWnFqN2ZDem56aHdlekoyU25SRjd3QzdrZ2hkODU2Sktz?=
 =?utf-8?B?dEhBWDhheldYcXdmL2hON3NNWHI1SUkvNW1zL25LcktvMDQ4QzFpSENDSmlF?=
 =?utf-8?B?TUxDM0t2c2RBVjF6Q09yRXFRem1SM251T1BGdkx3QXVrbWhhaUV1azV0b0g0?=
 =?utf-8?B?emsvajM0UkpPdzhsWFppTkhxR1JFN0o1ZjdLNGRUWXZMc0E0cWhXTFNXTHBX?=
 =?utf-8?B?NXoyaldiSnhnSmdJRGY3NC85YjBzQU85ZU5xTkRaaGlTTlZhWUNvLzdJK2Ir?=
 =?utf-8?B?TUdMbVl5NllsbE9BbFFxWGdubFcrdUtyZ3RVR2RRdWU5bGZpYWlsTVR6U3Nr?=
 =?utf-8?B?Nmo3T2xNSEcvWHBUN2pObzgvSUNVdVJEK2M4Y1BRckFiZzdLYnpXYjU0cFph?=
 =?utf-8?B?SVJDaWFFZVVhNDFpcHBxbmhnNlFsTlJxemRiMFY3RDFUTFdUanVTQVV1Tnp5?=
 =?utf-8?B?NkcwNGtuSFJSd3JJa3Q4VDA0dzlzSmphZHg5QTM3dy9ua1ZpK0NQOEt6K1or?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 788d155d-7bea-4aa8-53de-08ddfe140929
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 22:20:16.5984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+/n2HKCobXN+/oi0RLqwhBORh3HUS42n2ZtbySO9qrqhPQxC2VEsDtmed4xLz0GS69VxVc+cbxR7kJyVEmgf2drOzvwPybwVbuGhiklar4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9520
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

Hi Thorsten,

Thanks for the cleanup!

Reviewed-by: Konstantin Sinyuk <konstantin.sinyuk@intel.com>

I will pick this up during the 6.18-rc merge window.

Best regards,
Konstantin

On 9/27/2025 7:56 PM, Thorsten Blum wrote:
> Replace kmalloc_array() followed by copy_from_user() with
> memdup_array_user() to improve and simplify cs_ioctl_engine_cores(),
> cs_ioctl_engines(), and hl_multi_cs_wait_ioctl().
> 
> Remove the unused variable 'size_to_copy' from hl_multi_cs_wait_ioctl().
> 
> No functional changes intended.
> 
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  .../habanalabs/common/command_submission.c    | 34 +++++--------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
> index dee487724918..a5e339eb7a4f 100644
> --- a/drivers/accel/habanalabs/common/command_submission.c
> +++ b/drivers/accel/habanalabs/common/command_submission.c
> @@ -2481,14 +2481,10 @@ static int cs_ioctl_engine_cores(struct hl_fpriv *hpriv, u64 engine_cores,
>  	}
>  
>  	engine_cores_arr = (void __user *) (uintptr_t) engine_cores;
> -	cores = kmalloc_array(num_engine_cores, sizeof(u32), GFP_KERNEL);
> -	if (!cores)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(cores, engine_cores_arr, num_engine_cores * sizeof(u32))) {
> +	cores = memdup_array_user(engine_cores_arr, num_engine_cores, sizeof(u32));
> +	if (IS_ERR(cores)) {
>  		dev_err(hdev->dev, "Failed to copy core-ids array from user\n");
> -		kfree(cores);
> -		return -EFAULT;
> +		return PTR_ERR(cores);
>  	}
>  
>  	rc = hdev->asic_funcs->set_engine_cores(hdev, cores, num_engine_cores, core_command);
> @@ -2523,14 +2519,10 @@ static int cs_ioctl_engines(struct hl_fpriv *hpriv, u64 engines_arr_user_addr,
>  	}
>  
>  	engines_arr = (void __user *) (uintptr_t) engines_arr_user_addr;
> -	engines = kmalloc_array(num_engines, sizeof(u32), GFP_KERNEL);
> -	if (!engines)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(engines, engines_arr, num_engines * sizeof(u32))) {
> +	engines = memdup_array_user(engines_arr, num_engines, sizeof(u32));
> +	if (IS_ERR(engines)) {
>  		dev_err(hdev->dev, "Failed to copy engine-ids array from user\n");
> -		kfree(engines);
> -		return -EFAULT;
> +		return PTR_ERR(engines);
>  	}
>  
>  	rc = hdev->asic_funcs->set_engines(hdev, engines, num_engines, command);
> @@ -3013,7 +3005,6 @@ static int hl_multi_cs_wait_ioctl(struct hl_fpriv *hpriv, void *data)
>  	struct hl_ctx *ctx = hpriv->ctx;
>  	struct hl_fence **fence_arr;
>  	void __user *seq_arr;
> -	u32 size_to_copy;
>  	u64 *cs_seq_arr;
>  	u8 seq_arr_len;
>  	int rc, i;
> @@ -3037,19 +3028,12 @@ static int hl_multi_cs_wait_ioctl(struct hl_fpriv *hpriv, void *data)
>  		return -EINVAL;
>  	}
>  
> -	/* allocate memory for sequence array */
> -	cs_seq_arr =
> -		kmalloc_array(seq_arr_len, sizeof(*cs_seq_arr), GFP_KERNEL);
> -	if (!cs_seq_arr)
> -		return -ENOMEM;
> -
>  	/* copy CS sequence array from user */
>  	seq_arr = (void __user *) (uintptr_t) args->in.seq;
> -	size_to_copy = seq_arr_len * sizeof(*cs_seq_arr);
> -	if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
> +	cs_seq_arr = memdup_array_user(seq_arr, seq_arr_len, sizeof(*cs_seq_arr));
> +	if (IS_ERR(cs_seq_arr)) {
>  		dev_err(hdev->dev, "Failed to copy multi-cs sequence array from user\n");
> -		rc = -EFAULT;
> -		goto free_seq_arr;
> +		return PTR_ERR(cs_seq_arr);
>  	}
>  
>  	/* allocate array for the fences */

