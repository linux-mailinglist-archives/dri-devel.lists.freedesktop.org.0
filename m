Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58FC9578A
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 01:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FF910E08A;
	Mon,  1 Dec 2025 00:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZBwK63t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980E10E08A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 00:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764550587; x=1796086587;
 h=message-id:date:to:cc:from:subject:
 content-transfer-encoding:mime-version;
 bh=sbn2Z4yozKgnCqNyYXBR1fOU1u2C2kmdrhyHPDFvV6s=;
 b=HZBwK63t5cvTa/PADpd2CxrGBzwW7qiJE5OC77mRf1+oX5y6037SDklC
 ScaIm9OkK6USOjOTUbKZuV8ByTm0ykU87O0GLhHoqK2uOvKVhACJbznm2
 JevsVCBnm3tEpjmNU6YaLXb6ZUE3bOQh0XKS7wd1ZPk2gp+FaZIjHx85x
 N9XqrtaLv36Zi0y/KfZoUexiiVYYMbpe3ldnMHxh6WDlWbuFMWGyQdVWX
 /EePdQOSQNJ8iGl39nSEAS9SxCjCOqNpnlvlEDuyaP0laJ0Y9dTwBa4m5
 xgYMuAG5J1bHZnea6y0Yf73rN4p5mlExwH6rJvHQGmmwjee/LSmV/2ec/ A==;
X-CSE-ConnectionGUID: O6XkNA18QmW0rKQgba2c6g==
X-CSE-MsgGUID: xaMUSZngQteYsDswNlexbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77584769"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="77584769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 16:56:26 -0800
X-CSE-ConnectionGUID: EByRfHZVTiOrAhXPM3xn8Q==
X-CSE-MsgGUID: Yn5+OXZzRJ286XYod7SJ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="193601608"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 16:56:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 16:56:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 16:56:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 16:56:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrSYxFpje1JZ5zj+eh1e1t3IzG/L+xskm5ybwiXOLnEaxYQR2SyFo273QswynZIPuoMk00lmBgI1X3kL7Op76fh7H/SqA8y2FHFRDlHwO8AQUoBLAgpm9G8ncO5xE/vljAUiVHI34hiAaU25CzBKaH1jz5RX+NJth+u+dhwms1vl9IOI5eWTWKtdopvjacUA3BSC/3MVRsM6bP9aC/WqrEmjkCKWj/fwvKzS1nSYjxsOcB83ua/+gYandRyEhxKco4WgjwLeEavNuxAqj/EQxkDIMAznXBahToiXpDTMHueqGZT2aF6Kl6DIKFDav2QJ9H9dArT/9EZ5BD9NZQM13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWRpqU7Qm6JNE9UwnBKnfvYVSDKlEROdUleBFlDzsko=;
 b=wOJK+pUSGaWu3TKRqlS7GJKZ+ZkurMrCk85UZuBUQuy3dasY5BJj3R/b7EkyC2TLhKpXgC+Zp6H4UtSOIZYs69gTq05KGc6QR/n74xCBqIu3/8QAri9LBTb0ngQj88dOWUcFc3DSpG2GfzMGhlfxYn0epFZB220BlJiMYa+4mND69wAHQUDunCuEOWL9UETTbRWMN04RETzQNGtD5ihq7R8vt2V3hMKnocJ6XOFirOdtJXOKfkuUcfLEYGc1Yp7c/X8EVIuGs9j7iwn0HceQfcRbE9BkbUig0g5uygEF2SSawiJIqf1CDhQ0Z1qU1BrbUu0V0Zgo9rsq+HaZu1nxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 00:56:23 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 00:56:23 +0000
Message-ID: <a878e155-4a20-4a6e-8a9d-783117d4fe8c@intel.com>
Date: Mon, 1 Dec 2025 02:56:17 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, "Elbaz, Koby" <koby.elbaz@intel.com>
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Subject: [git pull] accel/habanalabs: Gaudi3 support and updates for v6.19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0029.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::19) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e160111-872e-489b-c294-08de3074725a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVBhNDFNeS9heXplakZaRzdlVFdqT1FWa2NkUlo2TTVTVGxINno1c2o4NnJR?=
 =?utf-8?B?a1BCVWVDdGNVYmRwamhnUEw5WDlleWdCZ2NQaEFQV3BPYkwxdWdRa2ZrTnNO?=
 =?utf-8?B?aXJkMUN0OFRGemxoc0o1QlNMRDhYcEcrRm1vNUc2eFBvU3QxeFRTZ3NJOGZy?=
 =?utf-8?B?MlptNzZZaGRNOUZIR1c5bkVJRnVpQWxIZjBObUpnT2hFdU90UXZPMmptL3VB?=
 =?utf-8?B?SitiNG45bWJISjgzY0FtckhtcTlVdVBVRW1wY2VKOHhKZHVrdVpnQ0pwRXpR?=
 =?utf-8?B?SzZLUUJ3ZXRNNWlUQmFhV0pwNmxoUHIvWTdVcGx2SkVrV1VOa0JzRDVHUWVI?=
 =?utf-8?B?TnZJYWhOajNONGlQV21reFJPREhsSkpyWFJ0N3J0Y1NQaUVhK3VOaXk0K0Rq?=
 =?utf-8?B?UDQvdVFZeWVjNmVVcEl3enpsVmdveGZxMG11cGxVYkRHYTVEa0trS1dhL3h4?=
 =?utf-8?B?YTNEeXRIMWcvODB0b050MFoyUXBmUFdsSXVsY1A3THBKTStlZmtsMy9WclBO?=
 =?utf-8?B?aUZaV3Q1RE0zM1lmaVJ4dnozdks3UjEzcUUyRWtsK0R6ek84YS95R0Jhdmlm?=
 =?utf-8?B?ZVkyQ2ZXdU1WbHZGSFA3Vll3elUyQUZpU1JTQjU4a2VzNGZDUzl0dXdabzlD?=
 =?utf-8?B?VnI0ckN5aVY3amZhUUhoZ21RUXE1czhkRGdXSUthK3A3Q2I0MW11UDJLTGxL?=
 =?utf-8?B?ck1qbEhqczZaSFdaWGJCcEZUN2kxODFjZjJVc015cmZ1aG9qRnZ6Z1RIVk0v?=
 =?utf-8?B?R0pacmlzL091N210aHNaMEJTS25LZjJ3dzkwWG4wcEc1YnloMmlaMXBjaUdj?=
 =?utf-8?B?SUQzYUk2MWVUMDBsZ1ZHamNoUW9ld0NJdmpNRVk0MWoyNlNZamZSNjk1WURD?=
 =?utf-8?B?cU1zaFIrWWdzaWZ3Zjl5akhzL3N4MUxEd3lhQklBVVZONHlpZ0w2Um9Sd0Vv?=
 =?utf-8?B?bUhDU1ViSng1TTJCRlFsNjVKN1RzN0xMbmlML0pyalJxcGU5d3h6a3hNZUNE?=
 =?utf-8?B?U2lJNlU0L2R6NHV2MjZ5ODRERmlIK1BvandRUUlCQVNRYkQ1T3lvQWtRdE11?=
 =?utf-8?B?T1dvTEFiK2t2NE9EcjlELzVQMGx2NHdsVVA0dStBa3BycU1JRCtwUDl6TjV5?=
 =?utf-8?B?Q0N5anM0empFRDFPM3BQL1l4T3ZwZCtaakJzNGNDYmpoMnZ0a0xOblhnVGxm?=
 =?utf-8?B?d2FGMXlXS2dYK2Qxa3JrNDduc09KYUYxVnZzK2VoSlpHak1kT0NHYlpqdlVr?=
 =?utf-8?B?RVVreE1zdEtQZW1KUGtpbm1QY09DU0NZV0phdjhFRVBaUmdEK1BpSjB1RXIz?=
 =?utf-8?B?RGE0NEFCN21vNStYN21kWm0rWVAwQldpZzRXQ1Q5WDc5VzV0TklhcmJ4bTZ3?=
 =?utf-8?B?Z25vazVQT3Nrc1hhaG9KWmY2Q3N5NUZOMzIyRkFGYTJMa1VJU1JvN1FqV3Rh?=
 =?utf-8?B?K2ltU29tU2o5RW01U0NYT3VHTXJxNCsybC9jZ2lMQWpVbFZkaEpaN2NOQW5G?=
 =?utf-8?B?bjVyb2FRL0tMdm9GdGdvcGgwUTAxdFhSVkpuVDAxR3BZa24xOGJ5c1NPdkRI?=
 =?utf-8?B?WTNRL2tHdmpFWE52c2JPWE9tMHNCbTJ1OHloMzJKQ1NUb1dGQkErNjlpenc1?=
 =?utf-8?B?NW53VjY3bFRaV0w5NzVPSU15czhaMnBmVFIrTkpNbm1EMWltdGtvN2ErSkRo?=
 =?utf-8?B?Z2IyRTlXaTJ0M0VGSGEwbjlRZDNucUFnaHZIRCtuSWM4MXV1cGwyL3p2VDdE?=
 =?utf-8?B?UkRmRkdEUXBNamh0MEVDWnhvQ2ZJRTJ2MmNvK0FZQzRaU0FPNFREM25Cd1hE?=
 =?utf-8?B?cGt4TnpZZDQ5aGlDYm1xNUVnU2o2ZVFudE1icTdSdkRwb0JsUk5mQXhOL1VD?=
 =?utf-8?B?VWZnMlVURUJ2TGU2YlNGRjBFbklhdHEvay9WOUlCajAzVmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1RYSWs3NDB3ZkNDQmtUaFhJSGRyWWxTZTRiTlZPQWN1TVNHZXUzOXo0VUxC?=
 =?utf-8?B?ZkFYWGRLU3A4K1NmVGcwSkprM2J2U0VPZWIxcVpKeDNqSWNUQ1hjQWNUeXZU?=
 =?utf-8?B?SDJIckVuK2VyN3k0b05lYmdsNFJqbFNMUExaRGpOMk5jYmJGNEd5c0VKYWJy?=
 =?utf-8?B?d1JDT2lrN0JDWk5UUysvelRTcFdrWFNTcFMrVjRYQW1aVDFsRlM5bWx2UXJN?=
 =?utf-8?B?cVcvUzZTNU8xYXpMZ3Jsblg4SjFJYUV3UXorWGhoQzRmRDNISXRSazUwQVkw?=
 =?utf-8?B?dGE0WVJ4V2c1bFNUdlE2S3NBcE92a1EzNDlkWnVnS2EwMEhvT3FDWlZQV0ZI?=
 =?utf-8?B?Z056cXNSUCtBdzA0WXU2YjdjZEhGaVIvSVE4MnVjamNOYXRaUEJBZFBsbWNW?=
 =?utf-8?B?TmVOYU80Sk0wNEFQUWFWUk9jbW1hWGlsVHhRNDdQUnlkUVk3SXBZWFZMWlNS?=
 =?utf-8?B?ek1vbThIQmRCU0tic2x5WFdaWTFvRUlPakw3RnU0M0QydXVOZzB5MU9UVUlZ?=
 =?utf-8?B?eGIxZnpaY25FR2Z2aU05WVpvRHVYZXdDUVhMc2RTcjFIQnFEM0pBa3JVdGY3?=
 =?utf-8?B?Umc3L1oySE51OVBRWDd5NmNWWDdWajczTW9wR3FNMEZvS1JUUTZ3SHNNejJS?=
 =?utf-8?B?bG43cVcwcFdDSXFSREsvVUViRmdIdU9KVkNPcDdPcDlJNnIrZnBVQ3ZCd1ph?=
 =?utf-8?B?Z3QzZkdIalNiSXhudzNlQmIxVllhSEt2ZWpOdDJ1TnM0Ky9GWFdRK2o0aHdv?=
 =?utf-8?B?SFpyN3FGMGliVHBBMWJvUExHSTYySEVRcVp6b0RtOWg1S3lpbWJFYjdlMWNJ?=
 =?utf-8?B?UVcrNU01dTJ6MzVJZm9UQ2ZETDVUd2VwWDJYajVHVUoxYVF2UE5kSFZ1RzNs?=
 =?utf-8?B?a3g1Rytjd295K043cUUxZTFZZStiWTBvSHBIV05NanFPMUo3bFVLRzlaV0Vr?=
 =?utf-8?B?QU9lQjFYcXptUFEzWS9BS25KcmYra1hZMkJ4UkZ5TUdVeWdHQ25XMzY2d0lB?=
 =?utf-8?B?SHB4TU9zRndldnIxeUJIWWxFbUd1NGU4QTlYK3lEeVlqZ2NlWTk2WGVEZTZF?=
 =?utf-8?B?ZXZMN1RacGdoM3VTWEFmQ29iNjc5bDdhbEcrRjdjbTA5ZWhoOVpkN0VZUTNU?=
 =?utf-8?B?UUVBTkZKZU5MMDRkd2IwdzQ1eEpCZ1U3a213TzNNY1Z2NU05L0ZudUt6b2Jz?=
 =?utf-8?B?VGkwZDAwcXJZN3Mya2dMWXhxOGZ0VHYxYmN4am0xQU9OTUE3ajR5aEc1QnNU?=
 =?utf-8?B?OEpOam9uZzBtazRuZVFCL1RCaWVKUDNsUnQ1SDJiSzRtaWtFVTYvelhhZFV3?=
 =?utf-8?B?emZvTHpFdm54dUtxQjU3VDlTNXJlc2ZRRnhSTDNwQVBBaGowcWhyNG9GNUl1?=
 =?utf-8?B?Z0dOUDBVRmJ0UXQ1UC9OeXB4QTNsLzYvWFBjMU9laXF0THNmc0tISDFNVnVG?=
 =?utf-8?B?cTEvdWZCOGlobEpmYmdRSWpoMUxobEJ1WWxoL20yMUtLTlFjZ0p2bG5JdVhX?=
 =?utf-8?B?cDdwNE9vTGFKdEJLbVdrTFBrc0YyZ0FjTFNDelMxWFVwblBEN2NlNmoyMWw5?=
 =?utf-8?B?UDJmaHFrWlZZbWg5OUt3UWdVY3Q2N3VTanFWWm52NHQ0VCs0TURhOEhBUm4y?=
 =?utf-8?B?RkR1UEFWVG5CNGtIeGVvQ1JCMG9TRExJR2dDWXBhSUhGVXRCbkZGeXVjRXZo?=
 =?utf-8?B?K2g0bitSby9lWE5OQmx1ZW13K3oxR0wzTC9oSVpFOSsxclRDMXFYTTJGR0Uw?=
 =?utf-8?B?K3NOdkFKRWR3aTd1MFlkUzZwTXNaRkhPbHgxR1M0TXNuaTlzWHNMdi9IRG5T?=
 =?utf-8?B?SmVaV2tvdnlrOS9YdG9RTE1uVFpHTkszNXB0aFBjek83c2U2d1pyNDhIRU1j?=
 =?utf-8?B?bVRwa0N1eGxGcThuVUtuU0J1anFHSEhDa1E4eWt1WTVtWGRBQmE4MU12ckhs?=
 =?utf-8?B?TUZrWC9VZ2NpTm9OZVFwQXRzUzBaTmJZNVREbGlSSEp0RDFCN1g2eWJDZnlR?=
 =?utf-8?B?cGJLNWs2RGZCNk43UDhMejFOSXdGdEs1eXFJenE3TFk4QnFmQm9TUnFXdUFn?=
 =?utf-8?B?VG04NUZpNUhaS3pCaTZxWTRPa0FCUkpBcGQyeGxod3JUOVIrdE85ZDFoNUFa?=
 =?utf-8?B?QmFwUC9YelIxRnhjRDBsWWJGRk8ySXA4QS85ZWpEN3o0ZFA5Z3ozdlcrZWFY?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e160111-872e-489b-c294-08de3074725a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 00:56:22.8898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIwQdJrQCG60WE1gnBFKutrG/N7ti51/KzvmPW7faQdv0mZOnvMx0de03NeNz6qP5lRjJC5wE3ypuk+Uc/C79vUprYyHUkTWJKgf/7eLbOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
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

Hi Dave, Sima,

We are excited to continue the upstreaming of the accel/habanalabs driver.
While maintaining the momentum with Gaudi2 fixes, we now introduce Gaudi3 support,
covering the development work done during the 2021-2024 period.

This tag contains habanalabs driver changes for v6.19, continuing the previous
upstream work from tags/drm-habanalabs-next-2025-05-25. It includes improvements
in debug and visibility, general code cleanups, and the finalization of Gaudi3
support, closing remaining gaps relative to Gaudi2. This is backed by
foundational features such as the MMU v3 architecture, ODP (On-Demand Paging),
and enhanced security infrastructure.

Full details are in the signed tag below.

Thanks,
Konstantin and Koby.


The following changes since commit 62433efe0b06042d8016ba0713d801165a939229:

  Merge tag 'drm-misc-next-fixes-2025-11-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-11-28 09:04:52 +1000)

are available in the Git repository at:

  https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git tags/drm-habanalabs-next-2025-12-01

for you to fetch changes up to 7dafc58c0da3fa475f72a64c5dbdeaddea7a9583:

  MAINTAINERS: update habanalabs entry (2025-12-01 01:28:58 +0200)

----------------------------------------------------------------

Notable Changes
===============

Common/Gaudi/Gaudi2:
- API Modernization: Updated workqueue API (create_singlethread_workqueue -> alloc_ordered_workqueue)
- Security Enhancements: Replaced sprintf() with sysfs_emit() to prevent buffer overflows
- Code Quality: Simplified memory allocation patterns (memdup_array_user)
- Documentation: Fixed typos and improved clarity

Gaudi3:
- Platform Introduction: Complete Gaudi3 ASIC support integration
- MMU v3 Architecture: Implemented new memory management unit with HMMU/STLB/DTLB
- On-Demand Paging (ODP): Added infrastructure for dynamic memory paging
- Security Framework: Enhanced protection bits and security configuration
- Coresight Support: Comprehensive debug and tracing infrastructure
- Register Definitions: Complete hardware register maps and firmware interfaces

Credits:
Created Documentation/accel/habanalabs/credits.rst to honor internal contributors
from the 2021-2024 development period at Habana Labs/Intel.

Key Internal Contributors (2021-2024)
===================================== 

Tomer Tayar (732 commits)
-------------------------
Key areas: ASIC initialization, hardware block configuration (TPC, MME, EDMA, 
Decoders, Rotators), event queue handling, interrupt aggregators, MMU_BP/ASID
configuration, HBM/MC SEI events, graceful reset mechanisms, Coresight integration,
DMA-buf implementation, virtual MSI-X doorbell support, CBC initialization.


Ofir Bitton (436 commits)
--------------------------
Key areas: Hardware specifications alignment (v1.0-v2.50+), interrupt mapping,
ASIC register definitions, simulator support, clock throttling, auto-fetcher MMU,
KDMA completion, debugfs interfaces, device reset/recovery, binning support
(TPC, MME, DEC, HBM), security configuration, multi-MSI consolidation.


Ohad Sharabi (449 commits)
---------------------------
Key areas: MMU v3 architecture (HMMU, STLB, DTLB), memory management, page table
handling, HBM initialization/binning, D2D PHY/MAC, multi-page support (1MB-1GB),
multi-CS implementation, scrambling/credits configuration, range registers,
COMMS protocol, preboot/boot-fit support, host-resident page tables.


Oded Gabbay (407 commits)
--------------------------
Key areas: Driver architecture and core infrastructure, firmware interface,
DMA-buf import/export, device registration, reset flows (hard/soft/compute),
server type detection, driver-firmware protocols, accel subsystem migration,
context management, decoder/encoder infrastructure, clock/PLL management.


Koby Elbaz (312 commits)
-------------------------
Key areas: Protection bits (PB) security, PDMA implementation (12 channels),
special blocks security, ETR buffers, KDMA channel 0, security automation,
page fault queue (PFQ), boot-time validation, fabric serialization, COMMS
protocol support, compute context handling, engine mode control.


Farah Kassabri (38 commits)
----------------------------
Key areas: HMMU page table in HBM, MMU v3 map/unmap, NVMe Direct IO support,
heartbeat mechanism, PCIe flush configuration, PDMA SEI error handling,
CPU packet timeout diagnostics, dynamic memory properties.


Moti Haimovski (187 commits)
-----------------------------
Key areas: BMON/SPMU interrupt handling, CS SEI handlers, PDMA parallel channel
testing, completion queue error recovery, signed device info API, memory mapping
with vmalloc support.


Dani Liberman (176 commits)
----------------------------
Key areas: NOC configuration (v1.18-1.21), RAZWI logger/capture, error diagnostics,
device scrubbing using PDMA, address decoder error handling, historic data API,
secured attestation/TPM, page fault notifications, dynamic HBM reservation,
device security status, engine status API.


Dafna Hirschfeld (154 commits)
-------------------------------
Key areas: PMMU implementation, MME/TPC event handling (SPI/SEI), QM software
interrupts, NCH event handling, STLB interrupts, device scrubbing via debugfs,
page fault diagnostics, memory scrubbing, AXID to initiator mapping, ODP
support and page-in flow.


Yuri Nudelman (130 commits)
----------------------------
Key areas: MMU cache invalidation, PMMU initialization, LBW DUP API, SRAM
configuration, NRTR/GRTR credits, ODP data structures, unified memory manager,
state dump infrastructure, tracer user API, scheduler submission, SM block
exposure, ARC MMU initialization.


Tal Cohen (75 commits)
-----------------------
Key areas: EDMA specifications, simulator memory command ioctl, register read
API, eventfd notification, ARC cores control, threaded IRQ, error collection,
preboot ASCII messages, hard reset for Gaudi3, undefined opcode handling,
command submission sanity checks.


Additional Contributors
========================

The Gaudi3 development effort involved 100+ contributors from Habana Labs
and Intel teams between June 2021 and September 2024. Development included
hardware bring-up, firmware development, driver implementation, testing,
and validation across multiple hardware revisions.

Major development areas:
- Hardware abstraction and ASIC-specific implementations
- Memory management (MMU v1/v2/v3, HMMU, PMMU, DMMU)
- Security infrastructure (PBs, RRs, ASID)
- Power management and clock gating
- Coresight and debugging tools
- Event handling and error reporting
- Reset and recovery mechanisms
- Firmware interface protocols

Maintainers
===========

Code cleanup and upstream preparation by:
  - Konstantin Sinyuk, accel/habanalabs maintainer
  - Koby Elbaz, accel/habanalabs maintainer

----------------------------------------------------------------
Koby Elbaz (6):
      accel/habanalabs: enhance reset and error handling for Gaudi3
      accel/habanalabs: add Gaudi3 ASIC core implementation
      accel/habanalabs: add Gaudi3 coresight and debug infrastructure
      accel/habanalabs: add Gaudi3 security and protection bits
      accel/habanalabs: add Gaudi3 register definitions and firmware interface
      accel/habanalabs: integrate Gaudi3 with sysfs, debugfs, and driver subsystems

Konstantin Sinyuk (7):
      accel/habanalabs: update hldio.c documentation
      accel/habanalabs: add Gaudi3 infrastructure and Kconfig options
      accel/habanalabs: implement MMU version 3 architecture
      accel/habanalabs: add On-Demand Paging (ODP) infrastructure
      accel/habanalabs: add device importer and compatibility layer
      accel/habanalabs: add historical contributors documentation
      MAINTAINERS: update habanalabs entry

Shi Hao (2):
      accel: goya: replace sprintf() with sysfs_emit()
      accel: habanalabs: use alloc_ordered_workqueue()

Thorsten Blum (1):
      accel/habanalabs: replace kmalloc_array + copy_from_user with memdup_array_user

chuguangqing (1):
      accel/habanalabs: fix typo in comment

 .clang-format                                      |    179 +-
 .../ABI/testing/debugfs-driver-habanalabs          |     27 +-
 Documentation/ABI/testing/sysfs-driver-habanalabs  |      2 +-
 Documentation/accel/habanalabs/credits.rst         |    279 +
 Documentation/accel/habanalabs/index.rst           |     21 +
 Documentation/accel/index.rst                      |      1 +
 MAINTAINERS                                        |      2 +-
 drivers/accel/habanalabs/Kconfig                   |     44 +-
 drivers/accel/habanalabs/Makefile                  |     17 +
 drivers/accel/habanalabs/common/Makefile           |      7 +-
 drivers/accel/habanalabs/common/command_buffer.c   |     10 +-
 .../accel/habanalabs/common/command_submission.c   |     15 +-
 drivers/accel/habanalabs/common/context.c          |      3 +-
 drivers/accel/habanalabs/common/debugfs.c          |    431 +-
 drivers/accel/habanalabs/common/device.c           |    688 +-
 drivers/accel/habanalabs/common/firmware_if.c      |    257 +-
 drivers/accel/habanalabs/common/habanalabs.h       |    726 +-
 .../habanalabs/common/habanalabs_compat_accel.c    |    262 +
 .../habanalabs/common/habanalabs_compat_accel.h    |     37 +
 drivers/accel/habanalabs/common/habanalabs_drv.c   |   1127 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |    296 +-
 drivers/accel/habanalabs/common/hldio.c            |     50 +-
 drivers/accel/habanalabs/common/hldio.h            |     18 -
 drivers/accel/habanalabs/common/hwmon.c            |     51 -
 drivers/accel/habanalabs/common/importer_drv.c     |    677 +
 drivers/accel/habanalabs/common/irq.c              |     18 +-
 drivers/accel/habanalabs/common/memory.c           |    436 +-
 drivers/accel/habanalabs/common/memory_mgr.c       |     30 +-
 drivers/accel/habanalabs/common/mmu/Makefile       |      2 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |    222 +-
 drivers/accel/habanalabs/common/mmu/mmu_v1.c       |      6 +-
 drivers/accel/habanalabs/common/mmu/mmu_v2.c       |     12 +-
 drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c    |      6 +-
 drivers/accel/habanalabs/common/mmu/mmu_v3.c       |    267 +
 drivers/accel/habanalabs/common/mmu/mmu_v3_hr.c    |    437 +
 drivers/accel/habanalabs/common/odp.c              |    523 +
 drivers/accel/habanalabs/common/pci/pci.c          |     46 +-
 drivers/accel/habanalabs/common/security.c         |    198 +-
 drivers/accel/habanalabs/common/security.h         |     13 +
 drivers/accel/habanalabs/common/sysfs.c            |    114 +-
 drivers/accel/habanalabs/common/version.h          |     16 +
 drivers/accel/habanalabs/gaudi/gaudi.c             |      2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |      2 +-
 drivers/accel/habanalabs/gaudi3/Makefile           |      5 +
 drivers/accel/habanalabs/gaudi3/gaudi3.c           |  13593 ++
 drivers/accel/habanalabs/gaudi3/gaudi3P.h          |    864 +
 drivers/accel/habanalabs/gaudi3/gaudi3_axuser.c    |     50 +
 drivers/accel/habanalabs/gaudi3/gaudi3_coresight.c |   6548 +
 .../habanalabs/gaudi3/gaudi3_coresight_regs.h      |    122 +
 .../gaudi3/gaudi3_interrupt_map_bringup.h          |   3110 +
 drivers/accel/habanalabs/gaudi3/gaudi3_masks.h     |    391 +
 drivers/accel/habanalabs/gaudi3/gaudi3_security.c  |    535 +
 drivers/accel/habanalabs/goya/goya.c               |      2 +-
 drivers/accel/habanalabs/goya/goyaP.h              |      2 +-
 drivers/accel/habanalabs/goya/goya_hwmgr.c         |     18 +-
 .../accel/habanalabs/include/common/importer_drv.h |     70 +
 drivers/accel/habanalabs/include/common/pci_ids.h  |     54 +
 .../include/gaudi3/arc/gaudi3_arc_common_packets.h |    449 +
 .../habanalabs/include/gaudi3/asic_reg/acc_masks.h |    187 +
 .../habanalabs/include/gaudi3/asic_reg/acc_regs.h  |     79 +
 .../include/gaudi3/asic_reg/arc_af_eng_masks.h     |    229 +
 .../include/gaudi3/asic_reg/arc_af_eng_regs.h      |    721 +
 .../asic_reg/arc_af_eng_sec_user_adapt_masks.h     |    187 +
 .../asic_reg/arc_af_eng_sec_user_adapt_regs.h      |     67 +
 .../include/gaudi3/asic_reg/arc_dup_eng_masks.h    |    777 +
 .../include/gaudi3/asic_reg/arc_dup_eng_regs.h     |   1421 +
 .../habanalabs/include/gaudi3/asic_reg/arc_regs.h  |    227 +
 .../gaudi3/asic_reg/autonomous_control_masks.h     |     67 +
 .../gaudi3/asic_reg/autonomous_control_regs.h      |    129 +
 .../habanalabs/include/gaudi3/asic_reg/bmu_masks.h |    233 +
 .../habanalabs/include/gaudi3/asic_reg/bmu_regs.h  |    345 +
 .../include/gaudi3/asic_reg/cache_crdt_masks.h     |    157 +
 .../include/gaudi3/asic_reg/cache_crdt_regs.h      |     61 +
 .../include/gaudi3/asic_reg/cache_err_masks.h      |    119 +
 .../include/gaudi3/asic_reg/cache_err_regs.h       |     61 +
 .../include/gaudi3/asic_reg/cache_main_masks.h     |    301 +
 .../include/gaudi3/asic_reg/cache_main_regs.h      |     51 +
 .../include/gaudi3/asic_reg/cache_misc_regs.h      |    231 +
 .../habanalabs/include/gaudi3/asic_reg/cbc_masks.h |    143 +
 .../habanalabs/include/gaudi3/asic_reg/cbc_regs.h  |    207 +
 .../include/gaudi3/asic_reg/cbc_user_masks.h       |     67 +
 .../include/gaudi3/asic_reg/cbc_user_regs.h        |    113 +
 .../include/gaudi3/asic_reg/cpu_if_regs.h          |   1245 +
 .../gaudi3/asic_reg/cs_dbg_tpc_eml_bmon0_masks.h   |    369 +
 .../gaudi3/asic_reg/cs_dbg_tpc_eml_bmon0_regs.h    |    167 +
 .../gaudi3/asic_reg/cs_dbg_tpc_eml_eml_etf_regs.h  |    113 +
 .../gaudi3/asic_reg/cs_dbg_tpc_eml_eml_spmu_regs.h |    151 +
 .../asic_reg/cs_dbg_w_spmu_0_bmon_spmu_masks.h     |    457 +
 .../asic_reg/cs_dbg_w_spmu_4_bmon_bmon0_regs.h     |    167 +
 .../asic_reg/cs_dbg_w_spmu_4_bmon_spmu_regs.h      |    151 +
 .../include/gaudi3/asic_reg/cs_trace_regs.h        |     97 +
 .../include/gaudi3/asic_reg/d2d_spi_regs.h         |    431 +
 .../include/gaudi3/asic_reg/dphy_ctrl_regs.h       |    329 +
 .../include/gaudi3/asic_reg/dtlb_masks.h           |    175 +
 .../habanalabs/include/gaudi3/asic_reg/dtlb_regs.h |    111 +
 .../include/gaudi3/asic_reg/dtlb_special_regs.h    |    187 +
 .../include/gaudi3/asic_reg/edma_chn_masks.h       |    359 +
 .../include/gaudi3/asic_reg/edma_chn_regs.h        |     89 +
 .../include/gaudi3/asic_reg/edma_cmn_masks.h       |    317 +
 .../include/gaudi3/asic_reg/edma_cmn_regs.h        |    119 +
 .../include/gaudi3/asic_reg/etf_1kb_regs.h         |    113 +
 .../habanalabs/include/gaudi3/asic_reg/etr_masks.h |    311 +
 .../habanalabs/include/gaudi3/asic_reg/etr_regs.h  |    115 +
 .../habanalabs/include/gaudi3/asic_reg/farm_regs.h |    161 +
 .../gaudi3/asic_reg/gaudi3_blocks_linux_driver.h   | 135940 ++++++++++++++++++
 .../include/gaudi3/asic_reg/gaudi3_regs.h          |    463 +
 .../habanalabs/include/gaudi3/asic_reg/gic_regs.h  |   3023 +
 .../include/gaudi3/asic_reg/global_conf_regs.h     |   1213 +
 .../include/gaudi3/asic_reg/h9_hif_regs.h          |    181 +
 .../gaudi3/asic_reg/hbm2_phy_p0_ch_bcast_aw_regs.h |    103 +
 .../gaudi3/asic_reg/hbm2_phy_p0_initeng_regs.h     |    497 +
 .../include/gaudi3/asic_reg/hbm_central_regs.h     |    125 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch0_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch1_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch2_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch3_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch4_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch5_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch6_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_channels_ch7_aw_regs.h |    129 +
 .../gaudi3/asic_reg/hbm_phy_p0_master_masks.h      |    847 +
 .../gaudi3/asic_reg/hbm_phy_p0_master_regs.h       |    255 +
 .../int_agg_hdcore_rei_derr_int_msg_regs.h         |     43 +
 .../int_agg_hdcore_rei_serr_int_msg_regs.h         |     43 +
 .../asic_reg/int_agg_hdcore_sei_int_msg_regs.h     |     43 +
 .../asic_reg/int_agg_hdcore_spi_eco_int_msg_regs.h |     55 +
 .../gaudi3/asic_reg/int_agg_psoc_uart_comb_regs.h  |     37 +
 .../int_agg_shared_rei_derr_int_msg_regs.h         |     37 +
 .../int_agg_shared_rei_serr_int_msg_regs.h         |     37 +
 .../asic_reg/int_agg_shared_sei_int_msg_regs.h     |     49 +
 .../asic_reg/int_agg_shared_spi_eco_int_msg_regs.h |     49 +
 .../include/gaudi3/asic_reg/intr_gen_regs.h        |     31 +
 .../include/gaudi3/asic_reg/mc_ch_masks.h          |   1315 +
 .../include/gaudi3/asic_reg/mc_ch_regs.h           |    667 +
 .../include/gaudi3/asic_reg/mc_cmn_intr_masks.h    |    171 +
 .../include/gaudi3/asic_reg/mc_cmn_intr_regs.h     |     35 +
 .../include/gaudi3/asic_reg/mc_cmn_masks.h         |     77 +
 .../include/gaudi3/asic_reg/mc_cmn_regs.h          |    101 +
 .../asic_reg/mme_ctrl_lo_arch_dma_n_ten_masks.h    |    343 +
 .../asic_reg/mme_ctrl_lo_arch_dma_n_ten_regs.h     |     89 +
 .../include/gaudi3/asic_reg/mme_ctrl_lo_masks.h    |    641 +
 .../include/gaudi3/asic_reg/mme_ctrl_lo_regs.h     |    211 +
 .../habanalabs/include/gaudi3/asic_reg/mmu_masks.h |    411 +
 .../habanalabs/include/gaudi3/asic_reg/mmu_regs.h  |    159 +
 .../include/gaudi3/asic_reg/msg2wire_psoc_0_regs.h |     63 +
 .../include/gaudi3/asic_reg/msg2wire_sh_hd_regs.h  |     63 +
 .../gaudi3/asic_reg/mstr_if_axcache_hbw_masks.h    |     33 +
 .../gaudi3/asic_reg/mstr_if_axcache_hbw_regs.h     |     25 +
 .../gaudi3/asic_reg/mstr_if_axprot_hbw_regs.h      |     35 +
 .../gaudi3/asic_reg/mstr_if_axprot_lbw_masks.h     |     59 +
 .../gaudi3/asic_reg/mstr_if_axprot_lbw_regs.h      |     35 +
 .../include/gaudi3/asic_reg/mstr_if_dbg_hbw_regs.h |     65 +
 .../include/gaudi3/asic_reg/mstr_if_dbg_lbw_regs.h |     65 +
 .../gaudi3/asic_reg/mstr_if_v1_xresp_hbw_masks.h   |     77 +
 .../gaudi3/asic_reg/mstr_if_v1_xresp_lbw_masks.h   |     77 +
 .../gaudi3/asic_reg/mstr_if_xresp_hbw_masks.h      |     77 +
 .../gaudi3/asic_reg/mstr_if_xresp_lbw_masks.h      |     77 +
 .../gaudi3/asic_reg/mstr_if_xresp_lbw_regs.h       |     45 +
 .../habanalabs/include/gaudi3/asic_reg/nch_regs.h  |    131 +
 .../gaudi3/asic_reg/nrtr_crdt_rrtr_ob_crdt_regs.h  |     37 +
 .../gaudi3/asic_reg/parc_global_conf_masks.h       |    815 +
 .../gaudi3/asic_reg/parc_global_conf_regs.h        |    427 +
 .../include/gaudi3/asic_reg/pcie_aux_masks.h       |    483 +
 .../include/gaudi3/asic_reg/pcie_aux_regs.h        |    401 +
 .../include/gaudi3/asic_reg/pcie_dbi_masks.h       |   3010 +
 .../include/gaudi3/asic_reg/pcie_dbi_regs.h        |    455 +
 .../include/gaudi3/asic_reg/pcie_msix_regs.h       |     25 +
 .../gaudi3/asic_reg/pcie_wrap_dbi_access_masks.h   |    105 +
 .../gaudi3/asic_reg/pcie_wrap_dbi_access_regs.h    |    121 +
 .../gaudi3/asic_reg/pcie_wrap_dbi_gw_m0_masks.h    |     67 +
 .../gaudi3/asic_reg/pcie_wrap_dbi_gw_m0_regs.h     |     41 +
 .../gaudi3/asic_reg/pcie_wrap_dbi_gw_m1_masks.h    |     67 +
 .../gaudi3/asic_reg/pcie_wrap_dbi_gw_m1_regs.h     |     41 +
 .../include/gaudi3/asic_reg/pcie_wrap_masks.h      |    693 +
 .../include/gaudi3/asic_reg/pcie_wrap_regs.h       |    471 +
 .../gaudi3/asic_reg/pcie_wrap_special_regs.h       |    187 +
 .../include/gaudi3/asic_reg/pdma_ch_a_ctx_masks.h  |    225 +
 .../include/gaudi3/asic_reg/pdma_ch_a_ctx_regs.h   |    107 +
 .../gaudi3/asic_reg/pdma_ch_b_axuser_hbw_masks.h   |    187 +
 .../gaudi3/asic_reg/pdma_ch_b_axuser_hbw_regs.h    |     67 +
 .../include/gaudi3/asic_reg/pdma_ch_b_masks.h      |    341 +
 .../asic_reg/pdma_ch_b_pqm_axuser_hbw_masks.h      |    187 +
 .../asic_reg/pdma_ch_b_pqm_axuser_hbw_regs.h       |     67 +
 .../gaudi3/asic_reg/pdma_ch_b_pqm_ch_masks.h       |    319 +
 .../gaudi3/asic_reg/pdma_ch_b_pqm_ch_regs.h        |     77 +
 .../include/gaudi3/asic_reg/pdma_ch_b_regs.h       |     95 +
 .../include/gaudi3/asic_reg/pdma_cmn_b_masks.h     |    369 +
 .../gaudi3/asic_reg/pdma_cmn_b_pqm_cmn_b_masks.h   |    199 +
 .../gaudi3/asic_reg/pdma_cmn_b_pqm_cmn_b_regs.h    |    235 +
 .../include/gaudi3/asic_reg/pdma_cmn_b_regs.h      |    193 +
 .../include/gaudi3/asic_reg/pdup_eng_masks.h       |    453 +
 .../include/gaudi3/asic_reg/pdup_eng_regs.h        |   1879 +
 .../include/gaudi3/asic_reg/pll_ctrl_regs.h        |    111 +
 .../include/gaudi3/asic_reg/psoc_boot_conf_masks.h |    317 +
 .../include/gaudi3/asic_reg/psoc_boot_conf_regs.h  |    171 +
 .../gaudi3/asic_reg/psoc_global_conf2_masks.h      |    337 +
 .../gaudi3/asic_reg/psoc_global_conf2_regs.h       |    101 +
 .../gaudi3/asic_reg/psoc_reset_conf_masks.h        |   2453 +
 .../include/gaudi3/asic_reg/psoc_reset_conf_regs.h |   1069 +
 .../include/gaudi3/asic_reg/psoc_security_regs.h   |    189 +
 .../include/gaudi3/asic_reg/pstlb_masks.h          |    245 +
 .../include/gaudi3/asic_reg/pstlb_regs.h           |    109 +
 .../include/gaudi3/asic_reg/qman_arc_aux_masks.h   |   1169 +
 .../include/gaudi3/asic_reg/qman_arc_aux_regs.h    |    763 +
 .../include/gaudi3/asic_reg/qman_cgm_masks.h       |     51 +
 .../include/gaudi3/asic_reg/qman_cgm_regs.h        |     29 +
 .../include/gaudi3/asic_reg/qman_masks.h           |    681 +
 .../habanalabs/include/gaudi3/asic_reg/qman_regs.h |    261 +
 .../include/gaudi3/asic_reg/rotator_desc_masks.h   |    483 +
 .../include/gaudi3/asic_reg/rotator_desc_regs.h    |    179 +
 .../include/gaudi3/asic_reg/rotator_masks.h        |    569 +
 .../include/gaudi3/asic_reg/rotator_regs.h         |    169 +
 .../gaudi3/asic_reg/rtr_ctrl_adec_hbw_regs.h       |    169 +
 .../gaudi3/asic_reg/rtr_ctrl_ch_razwi_hbw_regs.h   |     65 +
 .../gaudi3/asic_reg/rtr_ctrl_hbw_scram_regs.h      |    123 +
 .../gaudi3/asic_reg/rtr_ctrl_rr_hbw_masks.h        |    125 +
 .../include/gaudi3/asic_reg/rtr_ctrl_rr_hbw_regs.h |    199 +
 .../gaudi3/asic_reg/rtr_ctrl_rr_lbw_masks.h        |    137 +
 .../include/gaudi3/asic_reg/rtr_ctrl_rr_lbw_regs.h |    323 +
 .../habanalabs/include/gaudi3/asic_reg/sb_masks.h  |    139 +
 .../habanalabs/include/gaudi3/asic_reg/sb_regs.h   |     63 +
 .../include/gaudi3/asic_reg/sob_glbl_masks.h       |    125 +
 .../include/gaudi3/asic_reg/sob_glbl_regs.h        |   1207 +
 .../include/gaudi3/asic_reg/sob_objs_masks.h       |    167 +
 .../include/gaudi3/asic_reg/sob_objs_regs.h        |  61591 ++++++++
 .../include/gaudi3/asic_reg/stlb_masks.h           |    251 +
 .../habanalabs/include/gaudi3/asic_reg/stlb_regs.h |     93 +
 .../habanalabs/include/gaudi3/asic_reg/stm_regs.h  |    131 +
 .../include/gaudi3/asic_reg/timestamp_regs.h       |     57 +
 .../include/gaudi3/asic_reg/tpc_eml_cfg_regs.h     |    313 +
 .../include/gaudi3/asic_reg/tpc_kernel_masks.h     |    225 +
 .../include/gaudi3/asic_reg/tpc_kernel_regs.h      |    203 +
 .../habanalabs/include/gaudi3/asic_reg/tpc_masks.h |    697 +
 .../include/gaudi3/asic_reg/tpc_qm_masks.h         |    225 +
 .../include/gaudi3/asic_reg/tpc_qm_regs.h          |    203 +
 .../gaudi3/asic_reg/tpc_qm_tensor_0_shared_masks.h |    133 +
 .../gaudi3/asic_reg/tpc_qm_tensor_0_shared_regs.h  |     61 +
 .../habanalabs/include/gaudi3/asic_reg/tpc_regs.h  |    307 +
 .../include/gaudi3/asic_reg/tpc_smt_tpc_th0_regs.h |     93 +
 .../include/gaudi3/asic_reg/vdec_brdg_ctrl_masks.h |    743 +
 .../include/gaudi3/asic_reg/vdec_brdg_ctrl_regs.h  |    321 +
 .../gaudi3/asic_reg/vdec_ctrl_special_masks.h      |    159 +
 .../gaudi3/asic_reg/vdec_ctrl_special_regs.h       |    187 +
 .../include/gaudi3/asic_reg/vsi_cmd_masks.h        |    229 +
 .../include/gaudi3/asic_reg/vsi_cmd_regs.h         |     85 +
 .../include/gaudi3/asic_reg/vsi_dec_masks.h        |   2177 +
 .../include/gaudi3/asic_reg/vsi_dec_regs.h         |    679 +
 drivers/accel/habanalabs/include/gaudi3/gaudi3.h   |    172 +
 .../habanalabs/include/gaudi3/gaudi3_coresight.h   |   1901 +
 .../habanalabs/include/gaudi3/gaudi3_packets.h     |    129 +
 .../habanalabs/include/gaudi3/gaudi3_reg_map.h     |     49 +
 .../include/gaudi3/gaudi3_sec_protbits_configs.h   |   1993 +
 .../include/gaudi3/gaudi3_special_blocks.h         |    205 +
 .../habanalabs/include/hw_ip/mmu/mmu_general.h     |     20 +
 .../accel/habanalabs/include/hw_ip/mmu/mmu_v1_2.h  |     55 +
 .../accel/habanalabs/include/hw_ip/mmu/mmu_v3_0.h  |     40 +
 include/linux/habanalabs/cpucp_if.h                |   1714 +-
 include/linux/habanalabs/hl_boot_if.h              |     53 +-
 include/trace/events/habanalabs.h                  |    211 -
 include/uapi/drm/habanalabs_accel.h                |   1546 +-
 260 files changed, 295357 insertions(+), 1192 deletions(-)
 create mode 100644 Documentation/accel/habanalabs/credits.rst
 create mode 100644 Documentation/accel/habanalabs/index.rst
 create mode 100644 drivers/accel/habanalabs/common/habanalabs_compat_accel.c
 create mode 100644 drivers/accel/habanalabs/common/habanalabs_compat_accel.h
 create mode 100644 drivers/accel/habanalabs/common/importer_drv.c
 create mode 100644 drivers/accel/habanalabs/common/mmu/mmu_v3.c
 create mode 100644 drivers/accel/habanalabs/common/mmu/mmu_v3_hr.c
 create mode 100644 drivers/accel/habanalabs/common/odp.c
 create mode 100644 drivers/accel/habanalabs/common/version.h
 create mode 100644 drivers/accel/habanalabs/gaudi3/Makefile
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3.c
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3P.h
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3_axuser.c
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3_coresight.c
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3_coresight_regs.h
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3_interrupt_map_bringup.h
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3_masks.h
 create mode 100644 drivers/accel/habanalabs/gaudi3/gaudi3_security.c
 create mode 100644 drivers/accel/habanalabs/include/common/importer_drv.h
 create mode 100644 drivers/accel/habanalabs/include/common/pci_ids.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/arc/gaudi3_arc_common_packets.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/acc_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/acc_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/arc_af_eng_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/arc_af_eng_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/arc_af_eng_sec_user_adapt_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/arc_af_eng_sec_user_adapt_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/arc_dup_eng_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/arc_dup_eng_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/arc_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/autonomous_control_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/autonomous_control_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/bmu_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/bmu_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cache_crdt_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cache_crdt_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cache_err_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cache_err_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cache_main_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cache_main_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cache_misc_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cbc_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cbc_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cbc_user_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cbc_user_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cpu_if_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_dbg_tpc_eml_bmon0_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_dbg_tpc_eml_bmon0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_dbg_tpc_eml_eml_etf_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_dbg_tpc_eml_eml_spmu_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_dbg_w_spmu_0_bmon_spmu_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_dbg_w_spmu_4_bmon_bmon0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_dbg_w_spmu_4_bmon_spmu_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/cs_trace_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/d2d_spi_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/dphy_ctrl_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/dtlb_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/dtlb_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/dtlb_special_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/edma_chn_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/edma_chn_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/edma_cmn_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/edma_cmn_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/etf_1kb_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/etr_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/etr_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/farm_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/gaudi3_blocks_linux_driver.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/gaudi3_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/gic_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/global_conf_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/h9_hif_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm2_phy_p0_ch_bcast_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm2_phy_p0_initeng_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_central_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch0_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch1_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch2_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch3_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch4_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch5_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch6_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_channels_ch7_aw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_p0_master_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/hbm_phy_p0_master_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_hdcore_rei_derr_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_hdcore_rei_serr_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_hdcore_sei_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_hdcore_spi_eco_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_psoc_uart_comb_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_shared_rei_derr_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_shared_rei_serr_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_shared_sei_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/int_agg_shared_spi_eco_int_msg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/intr_gen_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mc_ch_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mc_ch_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mc_cmn_intr_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mc_cmn_intr_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mc_cmn_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mc_cmn_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mme_ctrl_lo_arch_dma_n_ten_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mme_ctrl_lo_arch_dma_n_ten_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mme_ctrl_lo_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mme_ctrl_lo_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mmu_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mmu_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/msg2wire_psoc_0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/msg2wire_sh_hd_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_axcache_hbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_axcache_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_axprot_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_axprot_lbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_axprot_lbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_dbg_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_dbg_lbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_v1_xresp_hbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_v1_xresp_lbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_xresp_hbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_xresp_lbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/mstr_if_xresp_lbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/nch_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/nrtr_crdt_rrtr_ob_crdt_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/parc_global_conf_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/parc_global_conf_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_aux_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_aux_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_dbi_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_dbi_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_msix_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_dbi_access_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_dbi_access_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_dbi_gw_m0_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_dbi_gw_m0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_dbi_gw_m1_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_dbi_gw_m1_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pcie_wrap_special_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_a_ctx_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_a_ctx_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_axuser_hbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_axuser_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_pqm_axuser_hbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_pqm_axuser_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_pqm_ch_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_pqm_ch_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_ch_b_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_cmn_b_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_cmn_b_pqm_cmn_b_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_cmn_b_pqm_cmn_b_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdma_cmn_b_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdup_eng_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pdup_eng_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pll_ctrl_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/psoc_boot_conf_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/psoc_boot_conf_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/psoc_global_conf2_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/psoc_global_conf2_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/psoc_reset_conf_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/psoc_reset_conf_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/psoc_security_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pstlb_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/pstlb_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/qman_arc_aux_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/qman_arc_aux_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/qman_cgm_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/qman_cgm_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/qman_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/qman_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rotator_desc_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rotator_desc_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rotator_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rotator_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rtr_ctrl_adec_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rtr_ctrl_ch_razwi_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rtr_ctrl_hbw_scram_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rtr_ctrl_rr_hbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rtr_ctrl_rr_hbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rtr_ctrl_rr_lbw_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/rtr_ctrl_rr_lbw_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/sb_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/sb_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/sob_glbl_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/sob_glbl_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/sob_objs_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/sob_objs_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/stlb_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/stlb_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/stm_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/timestamp_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_eml_cfg_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_kernel_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_kernel_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_qm_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_qm_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_qm_tensor_0_shared_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_qm_tensor_0_shared_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/tpc_smt_tpc_th0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vdec_brdg_ctrl_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vdec_brdg_ctrl_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vdec_ctrl_special_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vdec_ctrl_special_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vsi_cmd_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vsi_cmd_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vsi_dec_masks.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/asic_reg/vsi_dec_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/gaudi3.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/gaudi3_coresight.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/gaudi3_packets.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/gaudi3_reg_map.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/gaudi3_sec_protbits_configs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi3/gaudi3_special_blocks.h
 create mode 100644 drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v1_2.h
 create mode 100644 drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v3_0.h
 delete mode 100644 include/trace/events/habanalabs.h
