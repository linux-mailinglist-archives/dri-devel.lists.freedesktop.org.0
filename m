Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A819F9F5E33
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 06:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8848410E232;
	Wed, 18 Dec 2024 05:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtZre/90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09D610E232;
 Wed, 18 Dec 2024 05:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734498808; x=1766034808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ptrd3mtvloyZBPsx4eA1U16MQqqlJoCN/KbFVtjTCNw=;
 b=WtZre/90i607HWXF2S6iscGYgVY+kIu3Lfppl6tA8pE6mgIDHh/ZtfnA
 QqyNelFsjfoctl7ZRqc46eYlMaWQbSak9OEw56C8mZRN2sUfXkhdHyAiD
 rCmoBU9V12u8NXjRQE65JC9GqDHaxroyFHDZMRpEuQbZi35HM41yzedPN
 h53r3a6PGVbuLnrdXY1lKEqoYLJ/MFLRwviCzEY0j9YW8I3gHFB5Pzjlf
 3Wajbey/+zaJkBdWHnzMFg4G5Sl+c/2Z9GX0tNNjyUeEMu3n6SIexCBgS
 PtmTh698Gv/Vx8gGxLaTNBqxI7ZbbZv/pRBWpha72UFV4AUWg66fAVsD8 Q==;
X-CSE-ConnectionGUID: X4Dgctw8SEuYaUi9RQi7MA==
X-CSE-MsgGUID: 1xtrVLbqSc6CsjHsruPryQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34847162"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="34847162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:27 -0800
X-CSE-ConnectionGUID: hlmwEaXwTiyotRWvSMrUuw==
X-CSE-MsgGUID: LtZPjWFoTtKRxkLXaXhVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102746861"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 21:13:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 21:13:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 21:13:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 21:13:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q77XcAsrIKmpQIub+oyBkihtb62ULjr7BRRZcwQlRs6bO1vcP4FrPVxTDZiNz2VjMQaUjTQO6hlve4VyhHuqJ4nFnGvsyLdjJaCtd+wqCn8ak1M4Xwqo0cLSpryvGHWzHnjO1arynxCZFc58O3hJe9c4s3CA705yrzzDCX1rfkfuGMrb6eS7VLjORcj+EhGNbwcHVa13PjAexpz9wZDv3J8U/0p+XuPRxFx2FzR3PKnuyJnjkI7yi0gpxnCASjW2wQ8YiOZmxa0LsvT0P0k/OzLWqEeQHtALXGrksqtcEHcDcWsHk0hRkordaAdY2200GMR5zkhF+22nmaLT39YTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPXIeyut89dXwUGrOV6u4SDO/M33pqQfUmbB08aiQk8=;
 b=f4aTawPRbVmzO+56nMgXBR2xdHqS6+kM7ykM3zVBgx/vhM3SSE52tp5FSdgEOGP4X1O0EvwGRGS7fTDfsfBjs+J6VbmhCt9wP9KmtHCe625CKJ0hh4IG4zRiACE8gZgikjwN+0HziOwFUWjH81cmi+W/+na4Xo5nR42twdmwTYMknw8bNaRMSu78YPm3vRTA7xD1KkpVWN4J/ouHuc8oFoDPfo7fv9iDFZ5SQ8WD05c6mYcNkwpRBP16Po1V+ZhNQf1MRu+uG50GVoQM5URTWfGC4lDj4qVvCQ+jj8NySC7KJgu9obLcWLwD6fdlICb/YIyf8S7b9oRmPwVfd0mArg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 05:13:24 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%7]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 05:13:24 +0000
Message-ID: <24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
Date: Wed, 18 Dec 2024 10:43:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <Z2H_7Xry3R2fWpMZ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PEPF000001AE.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::a) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a8871d-6fdd-4343-3a41-08dd1f22b2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1hOdVdDdXJqbTZMcVJVZlF3Z0d5ckZFU2tWR01SYXRZMWdzMytzQXVqNnpi?=
 =?utf-8?B?OTRXUW1rSHc2OWRBd3pta2VicWFSWUtBTnpRY3NvRGJjN0VibkVkZmVGVjJ6?=
 =?utf-8?B?aWk2TGF5QWVhQUJJSE91eVdjZ2h6NG41TG5KTWNNbWlZU0JHSnNVMkptV1Mx?=
 =?utf-8?B?Uk15NzgrZE0yaG11SEpYd2hVR1JGOWNJMnl3TkRaOFlPZzZEendyMWFWTVFw?=
 =?utf-8?B?cWRoT0NzRHYzVFN3RHF4UGlQRmEwUXRWaUlTd2hMRGFSRTJQNHQzVDViQVpp?=
 =?utf-8?B?RC8rZk5EN2IrVndPM1g5T2tOd1luWVBZYmhOelZQaDFXSEtZUG56Q0RnSDVp?=
 =?utf-8?B?dndkS083TEZCMEdCNTYxSEJjeGNoVDhab0V6VmhQOS9WVDJGUzZNZHUwZ0ww?=
 =?utf-8?B?RGRWMnNrcUhrT2JOU2VFYmh1dEhJZlNkWUh2RmJKOXozclZNNERGT0NHcUlT?=
 =?utf-8?B?WXhwOEY1WW9PM3Y5Q3B6N2hNWW5BRy9lMW1HMXJSVmpsNHhNVStXek5wbDdu?=
 =?utf-8?B?VzZDVkhOVEdvd21BZjlzSWRZZVhtWS9lNTBkQ0RqZVNBLzQyNFFqVlNTaUdZ?=
 =?utf-8?B?MGM5R3kyZFppTFdBTHZuSTR2UTJSSzE4NXpERWtHMW1oV3VSSUw3c1hQenJL?=
 =?utf-8?B?ME52aGQrRDBwTlZxdmxNMG9RSXR4emNHQnd5bzd3bGc3WU5mbXY2eFlCRnQ1?=
 =?utf-8?B?ZWxURERnSURDaE80WGlPR1BnTTRVQ2FhYWJrT2d0cVExaFJoaTBYaEFpOHhi?=
 =?utf-8?B?Ni9GZnBtOXd3eHNUTTIxYThIeXMxb1NYaDFkQSsyZjV1UEwvbjM0WWpVa3Y1?=
 =?utf-8?B?NkpuZmFZZ25IMVd2aDUvZmNDOVBiTjVYUk1jV1E2MjRkUVVpd24xeXN1MDg0?=
 =?utf-8?B?eHhlREtZNXFIdFp0KzM3R0xncW5hS1l6ckNMZEs4MTArb2tBQjlCUCszQkJm?=
 =?utf-8?B?VnJrSG05MkEyU1kzZURSQUgzSXhiNG5MbktoZUNXU3Q1aHpCZ2ozNGV0UHN1?=
 =?utf-8?B?RzBCOVkvd3gvWDY4ZGZLbUJoWkU2NnJRYlhhRFBlUHpjRktXZnF1T29nY0Va?=
 =?utf-8?B?N083Y05CUjJtQW9aUGVUUUs4bVovMW5ueG4zbm5YSmZRMWhReEN3ZEtQUjZt?=
 =?utf-8?B?OFJPY1VmekwzRm4zbUhoSWVDS20yZW5qekxDSjNGUGpZQnFDbllkQ1pLOWJW?=
 =?utf-8?B?azYxNk96bHJocHpibFd3N3pkM2ljREFtL2ZWQ0YvbTVkdG9pR0x2dEVqazgz?=
 =?utf-8?B?Y1NaMHR1b3QzbU5oL21rWVd5K01BNS9IUjUxOCt3bGhNa2RUb2pEcS9yZ0RU?=
 =?utf-8?B?Rk5MaDFucERnYjlRRThoZXNCSTRCcXpPL1NDK0tnZzlrbXViNkhCa1B6UGNH?=
 =?utf-8?B?K0Q1Q2tWc0ZGN3loV2JUdDZFK09VTnBxUG5ybitkWUV6M1VaZitsSUtram44?=
 =?utf-8?B?MUU2MUN3czc4WU1ZVkFGUkdUSzI4Q0k2TWI5eUo1cnN6a29ZeGRMTHhuUysx?=
 =?utf-8?B?VldDVUxNZXV2cUYyeFFpMzNaWXFXQU9NVlYyNkNHR2ZPbXBvSWZSU2pmazBv?=
 =?utf-8?B?bmJYTWlNc1YxWXRVTHA4Z1d0VDhoYnhEc3ZyWHVyUzRZaUVIL1drQXVQMmkw?=
 =?utf-8?B?VnM1QzhDVXB1RTFMQ0JSdDdSNTRhYkR6emIxNHR3NmNuY0JQcTFFRlg4Nmo5?=
 =?utf-8?B?bmltTFlHNURGdjBmZThzdUZ4Vll0YW1VZ0d2ak9FcUlqK3l1dVlZOHVqTVhZ?=
 =?utf-8?B?YVZWUnkxRUxHV2lGOHlMbmg4dEJXWkllQ1N4RER2aDBLdXBVNXk5Z0x0dHRC?=
 =?utf-8?B?MitWMHRJVkEzTE9nc2tmZ3pJNG1YbWIwbHR2dVk4TG9ZTUZWOHd5aTQ5anY4?=
 =?utf-8?Q?4glF7N1VqJHyB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1Y1Mk5KNHhydjQweFYzamxLdDV3RUNBcUh1OERPcDJGaHp4TU9YenQ1ZlBP?=
 =?utf-8?B?QzNQQUlTdjNOU2NwNXpzd0RqN043Ykx6N1dqR2xFeGRNREtXYS9URHduYVJW?=
 =?utf-8?B?K0JGVzh0aDJzVUo1b0ZkejhYSnZXVXc3Kzd2WldHNWtGS29iUmZKL2J3SG5W?=
 =?utf-8?B?NjI0d3dUN2d1bnFXNlpnZHJaRzMwYzd5NmNFeURkT2dhNmtzZndiVlJUVTZh?=
 =?utf-8?B?aHVpOHNhZVU2Z3IzVVB1Y3MzZVQzSkZXV3BTSERDTkZXUmNIcTRXalFaOE9N?=
 =?utf-8?B?Y2F5cnAyaEYrUFM2V2RUUXJWRjAzUnlyeUxsVDFHeGpleDFHSGZ6Ym1tbDV6?=
 =?utf-8?B?VDFBUnZSanRiMXhodDdyZ0g0SG1jYzRtejZCT1diSFZTQkM0MzZiSDYrM1Fp?=
 =?utf-8?B?R25xYzlHd1k1dC9RN0lBUWVtVHNvMlhRUVdIR1UvRzZBZmhpMEJuTXczTGNa?=
 =?utf-8?B?QUFuTlFnakdkWU5zVEVxMjdselVxbFpHYUhyWDNJcXQ3VnhaOFZRY3lablJV?=
 =?utf-8?B?c2ZCOGpjN2xGd3VSTFRCekVtUy9Ic1RYM09LbEFqcnRES3lBajB0MjRvLzkr?=
 =?utf-8?B?N3lKbmNQd0o4RVNkRWErSi9maStTeGRkUkFRSHNZcjB5SXlmcnpUWUFkSHYr?=
 =?utf-8?B?anhBQU10ak9HZnNiemFUcVAvYkZ2NXJJR3pjZ0M3NldGNDJjd3hyMTNxQ09w?=
 =?utf-8?B?ekNPVTRHclU1T0w4MElzelVvUklad3A4QzdsQmVhMm9HdkFWNUluYmxyNkJy?=
 =?utf-8?B?Wm5HTXRuWEpENUJSV3g5VkZNUUVOM2RQN0dWdlpEU0E0TlpQVVJ2cWM2UjRw?=
 =?utf-8?B?cUNEbjVpR0xhVTZqTGYrbHN2MjBZMkdtY3VyWnhWL2IwV3N5Z09EazVqMmtx?=
 =?utf-8?B?RUVjUlIySDVxLy9ReWpPL3FobVZ0NTVmSkVhNUM3Snc2TjBVUmluMm1oKy9v?=
 =?utf-8?B?aklnYWY2UzUzdktpNWZ0T1BsSUxNdTRFTlJmRzJwNjg4dzRIK2hSMnA4Sko5?=
 =?utf-8?B?aGdkSnRIMmdJR2ZqRWRRNzFwTTRsQUFQWTdyUGhSOW83SjZtRHhaQ3FUdmIv?=
 =?utf-8?B?SVVTVUR2S2FESDJBMFBuUFh5NUtkUDlLZ01EMFoyV0svZ3FtYU9ld2hGTlVO?=
 =?utf-8?B?R054WVFZWEpKNFhlN0xQWTJuc2JqRHR0NmRVcFZVWmlkTVVzZExaTVE1dHpP?=
 =?utf-8?B?QzcxdU1RZFJ3QmN3Z0dUTHJaSnhKaFFaZW1vTy9mMCtlK3kxOTJNQmpKVWtl?=
 =?utf-8?B?bVAzTkxkZ1hmVk9od21UR1VIN25rZm9PZlR2Ryt1L2YwR245b2tyQVJza1NS?=
 =?utf-8?B?NC9WUE0wYU15RlVEWDBPTFREZ1d0R0tnMS9ISGdMUHRDSFkwc1k1bkdhTmRm?=
 =?utf-8?B?WHByUjVlK3hsL0hwV2ZQc2phVnlqM0s4SlFGS0NCdUV1MUh3VkMxRjRlZG95?=
 =?utf-8?B?Q080VmIvMkIrWmRRc1RlbTN1SjhMZTJYUjdObGNVKzcxK1VHa1lGZzNSaDBs?=
 =?utf-8?B?QVg5UWMyZktENXF1U2QxYzBhVzhySmNTZTBtWlFlaXBhTEtVN1JBZjdleWtJ?=
 =?utf-8?B?dlM4elk2cFdudWNmZmY0djJoV2NNRmJlakZndEdVeTUvU1AyOFRKT1pqUnBs?=
 =?utf-8?B?aUkrdmZzd0g2bURGaU1xaWNUTUtFTmJ6L0E4bStRU2VFRU0wK2JVNFB0ZDNX?=
 =?utf-8?B?K2w4OUdRUHljeUJyWGlVZyt5YmJkVVVJY0tsRVZheUN3dzB2dVBSZ3hrVXFR?=
 =?utf-8?B?U2o0b2gwNVN6L2J2NkgraXYwS1lMakpIdHVEM1hObmF1THp3UmFMZjhXQ0dq?=
 =?utf-8?B?ZjFKT2htcGhqWFB6WmdFcm15THgwWHdwbFNFcjlhZDdLQmVUVHJhUjVFRmJv?=
 =?utf-8?B?Tnpjdk9xaGVoL1VCY1psbXhtOFBzUmZiUGtIejBOSFpRcWo4SXlISFU5N1R5?=
 =?utf-8?B?dUUxOERqMnZWOU9zaFg0Unk1RHFZbGZjOEpaN205Z2hSR3A3VFljWGlSM2VR?=
 =?utf-8?B?bmtnTUQ0L1M0OUhZYjFZMGpMY21ta2xsd1VIZ1JOa3JaTXM2b2NRalpaNGJt?=
 =?utf-8?B?SlpHRXQ5bnVlSWJmcURLbFkvMXNQd1dSYzQ1UTBOUHkycytlb3VxRnJjSi9X?=
 =?utf-8?B?eFZtY0UxUVFuOGJXeGpDNG9UNDVWT3Y4NmNuZVhxZWd2bTBYV1lyWkEzSkMx?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a8871d-6fdd-4343-3a41-08dd1f22b2a0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:13:24.5115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpUPbB9dQjfOp6gcmCoSWLv+MlsfwMFyrmjroA5mAMFvIGPWQ3402NgFmr3gsrhCs9JbAj0aaHdhT1rtOnbaWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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


On 18-12-2024 04:19, Rodrigo Vivi wrote:
> On Tue, Nov 19, 2024 at 04:01:08PM +0200, Alexander Usyskin wrote:
>> Enable runtime PM in mtd driver to notify graphics driver that
>> whole card should be kept awake while nvm operations are
>> performed through this driver.
>>
>> CC: Lucas De Marchi <lucas.demarchi@intel.com>
>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>> ---
>>   drivers/mtd/devices/mtd-intel-dg.c | 70 +++++++++++++++++++++++++-----
>>   1 file changed, 58 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
>> index 230bf444b7fe..9dd23b11ee95 100644
>> --- a/drivers/mtd/devices/mtd-intel-dg.c
>> +++ b/drivers/mtd/devices/mtd-intel-dg.c
>> @@ -15,11 +15,14 @@
>>   #include <linux/module.h>
>>   #include <linux/mtd/mtd.h>
>>   #include <linux/mtd/partitions.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/string.h>
>>   #include <linux/slab.h>
>>   #include <linux/sizes.h>
>>   #include <linux/types.h>
>>   
>> +#define INTEL_DG_NVM_RPM_TIMEOUT 500
>> +
>>   struct intel_dg_nvm {
>>   	struct kref refcnt;
>>   	struct mtd_info mtd;
>> @@ -460,6 +463,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>>   	loff_t from;
>>   	size_t len;
>>   	size_t total_len;
>> +	int ret = 0;
>>   
>>   	if (WARN_ON(!nvm))
>>   		return -EINVAL;
>> @@ -474,20 +478,28 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>>   	total_len = info->len;
>>   	addr = info->addr;
>>   
>> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> on this, I really don't believe this is right and we should use
> the parent child relation ship in our favor and only have the mtd
> device to handle their own runtime pm...
I concur with Rodrigo. If the parent-child relationship is preserved, 
the parent will resume before the child, eliminating the need to 
explicitly wake the parent.
Please refer to https://docs.kernel.org/driver-api/pm/devices.html

The ordering of the device hierarchy is defined by the order in which 
devices get registered:
"a child can never be registered, probed or
resumed before its parent; "
and can’t be removed or suspended after that parent.
>
>> +	if (ret < 0) {
>> +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	guard(mutex)(&nvm->lock);
>>   
>>   	while (total_len > 0) {
>>   		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
>>   			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
>>   			info->fail_addr = addr;
>> -			return -ERANGE;
>> +			ret = -ERANGE;
>> +			goto out;
>>   		}
>>   
>>   		idx = idg_nvm_get_region(nvm, addr);
>>   		if (idx >= nvm->nregions) {
>>   			dev_err(&mtd->dev, "out of range");
>>   			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
>> -			return -ERANGE;
>> +			ret = -ERANGE;
>> +			goto out;
>>   		}
>>   
>>   		from = addr - nvm->regions[idx].offset;
>> @@ -503,14 +515,18 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>>   		if (bytes < 0) {
>>   			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
>>   			info->fail_addr += nvm->regions[idx].offset;
>> -			return bytes;
>> +			ret = bytes;
>> +			goto out;
>>   		}
>>   
>>   		addr += len;
>>   		total_len -= len;
>>   	}
>>   
>> -	return 0;
>> +out:
>> +	pm_runtime_mark_last_busy(mtd->dev.parent);
>> +	pm_runtime_put_autosuspend(mtd->dev.parent);
>> +	return ret;
>>   }
>>   
>>   static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>> @@ -539,17 +555,25 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>>   	if (len > nvm->regions[idx].size - from)
>>   		len = nvm->regions[idx].size - from;
>>   
>> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
>> +	if (ret < 0) {
>> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	guard(mutex)(&nvm->lock);
>>   
>>   	ret = idg_read(nvm, region, from, len, buf);
>>   	if (ret < 0) {
>>   		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
>> -		return ret;
>> +	} else {
>> +		*retlen = ret;
>> +		ret = 0;
>>   	}
>>   
>> -	*retlen = ret;
>> -
>> -	return 0;
>> +	pm_runtime_mark_last_busy(mtd->dev.parent);
>> +	pm_runtime_put_autosuspend(mtd->dev.parent);
>> +	return ret;
>>   }
>>   
>>   static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
>> @@ -578,17 +602,25 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
>>   	if (len > nvm->regions[idx].size - to)
>>   		len = nvm->regions[idx].size - to;
>>   
>> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
>> +	if (ret < 0) {
>> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	guard(mutex)(&nvm->lock);
>>   
>>   	ret = idg_write(nvm, region, to, len, buf);
>>   	if (ret < 0) {
>>   		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
>> -		return ret;
>> +	} else {
>> +		*retlen = ret;
>> +		ret = 0;
>>   	}
>>   
>> -	*retlen = ret;
>> -
>> -	return 0;
>> +	pm_runtime_mark_last_busy(mtd->dev.parent);
>> +	pm_runtime_put_autosuspend(mtd->dev.parent);
>> +	return ret;
>>   }
>>   
>>   static void intel_dg_nvm_release(struct kref *kref)
>> @@ -720,6 +752,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>>   		n++;
>>   	}
>>   
>> +	devm_pm_runtime_enable(device);
>> +
>> +	pm_runtime_set_autosuspend_delay(device, INTEL_DG_NVM_RPM_TIMEOUT);
>> +	pm_runtime_use_autosuspend(device);
>> +
>> +	ret = pm_runtime_resume_and_get(device);
>> +	if (ret < 0) {
>> +		dev_err(device, "rpm: get failed %d\n", ret);
>> +		goto err_norpm;
>> +	}
>> +
>>   	nvm->base = devm_ioremap_resource(device, &invm->bar);
>>   	if (IS_ERR(nvm->base)) {
>>   		dev_err(device, "mmio not mapped\n");
>> @@ -742,9 +785,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>>   
>>   	dev_set_drvdata(&aux_dev->dev, nvm);
>>   
>> +	pm_runtime_put(device);
>>   	return 0;
>>   
>>   err:
>> +	pm_runtime_put(device);
>> +err_norpm:
>>   	kref_put(&nvm->refcnt, intel_dg_nvm_release);
>>   	return ret;
>>   }
>> -- 
>> 2.43.0
>>
