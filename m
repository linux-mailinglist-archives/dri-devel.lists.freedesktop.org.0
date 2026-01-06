Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B39CF6A2A
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 05:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBD510E2F9;
	Tue,  6 Jan 2026 04:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzL0vgV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A571E10E1D0;
 Tue,  6 Jan 2026 04:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767672267; x=1799208267;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XWNvTycn+IyBHei/MTWm8aQlKmYVOHXIDLIf1ADS1tU=;
 b=fzL0vgV99Am2egMYc9dZ3cUbHHUi3JORr1MI6ldwS+o6wH4glAGYA6KU
 jT5xK4odvnXYe2kEEHFkmw1WMcMri/YOWwxybhFEHPArSiyWhhkiOlEEh
 kFgNW1+3hNY8yCvOnlne8rHEi8JbaIliwqSyG83YqghWT03ER7gNl4eNx
 seIF/9fQTSrp7HiDeVa+QP2HMHZfm+kP3lK12UbFI3U3BjSAWu0OxqaOn
 1j7heFU4ejS3821+n06PVsAypCv7z2V8LqLNCbsEac/mjoLdmfd3fBf+1
 XysVVCZjb9YnP4SBM2tnEflQTur5O8yi7Bm6kKlIXgThTS0p+sAd5l/LI A==;
X-CSE-ConnectionGUID: HEc2XLg+SC2N3chvO7Gwqw==
X-CSE-MsgGUID: kewYJZzDSh2QjxrzxFG7gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68779876"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68779876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:04:26 -0800
X-CSE-ConnectionGUID: DYM3j0HDSBifNjrOIB7tTg==
X-CSE-MsgGUID: R1dEV/Y/QcKFqflHEJkQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202324795"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:04:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 20:04:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 20:04:25 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 20:03:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBuFOvjOkcgj03xm7CbvfM1mTMIgd2IZ//qhmW8MqQ4hprMIau6tvwo2bFBsRvlP6xM+FFOpOppMJ/D/j83aIiy7uKmN7nm+cZIpUpCvOtygs6WGMthUeZsQtmYp8ljuyRzzIlb/E2yVgj6GMufjRmJ/ncmAKgC9rVqzf7sQYx0WCOL8RAJiKHUk88TuwRx4xE29ojJyVg9gMKpSCCm1a3wKw5jjG9lwdcG5bAnup5n3h++gdQklTexLAIvwfDy8zizJhwlk1WWafwxNJXTtTDUQdl5BCHxDj5VxCmD6gMkjmX4eulylMWHCIzfQkxJuzoVFzm/NQEuzcCcew3fBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOiwGW8ZQ2vGVQ/np6CrgcC7nQoyZ4xQyTb6L6VIx6M=;
 b=DQQddxJ3DI3LWx6pNNXv7ycIZKcR2rveAZWPme8ppeOjuFa/hQqoyDhx39Icg8F/7HtoxPrUvjkDAFMb9QLDW32XoJpNKw5Ofy34pPR66sbe/+6P0ME2wahW147TjQWXU6lZeHN+aOJkgFbqNOmyOYxi2CcaKiBqG009O17Y41zqGbCEW8N48pmJTVtkrq0VJT2aqk9nZO8GtOYphmU3GXX8YHCFYvgTOu6kj17u9vALoIpGQiMeI2jUsOqw8Bbg+PH+7EPJrTF2fnf6TcMpImHKPc8ltXBbIGtqtjAtnTOjjyC1+WuRUHgri71mwEdCxaAgY+fBXp0AlbpN+i/T+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 04:03:45 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 04:03:45 +0000
Message-ID: <6a5bb2e7-73b7-436f-bcbb-da6227b30115@intel.com>
Date: Tue, 6 Jan 2026 09:33:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm: Define user readable error codes for atomic
 ioctl
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
 <20251009-atomic-v6-1-d209709cc3ba@intel.com>
 <DM3PPF208195D8D40A2E899BB7D51A45B25E3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <DM3PPF208195D8D40A2E899BB7D51A45B25E3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::16) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|CH3PR11MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: c308c6bc-9621-4dc7-dcc2-08de4cd89678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enNBTFJXQXZTbGZURWdEMmdBQ0svTEIraGpsRThiSnJkcHgzUktxNFNadUhs?=
 =?utf-8?B?SDFZQmp0V2UwOUJkM0QzZkpoWWtXYk1lb2podFVxcUFvN0k4T2RWbWRHZk5J?=
 =?utf-8?B?cTlBMFYrVlRqNTh2RWd4aTNRbjQ0YzVBUTduK1JMUmhueFI1ZE1tQlQrNnZW?=
 =?utf-8?B?eU5meXhKeU9za3VQVDV6WS8wTnRTaU1qSkIyZHJwRkhHNDNldFdWWEZoU1p2?=
 =?utf-8?B?V0xaOUdMNmtDSDRKSEtnMkZHY0NlS3I4S2pMVDREVFlVbnUwb1I4TVNRQUJh?=
 =?utf-8?B?aFE3UTg0STFFNlp6UVlSWkhER3o1bGFNZnpmTy9DS3hFMDdmVW9Xa2xzcWFM?=
 =?utf-8?B?enFocVQ1ZFZTYnFwb1c0UVEreHpWenhndW14NHFrTW1WR0VTWS9tUjNEakJ6?=
 =?utf-8?B?aG1jeWYvZzJtOU9qeGg2TDRHbzYwZnR2OTFRNGxpS2xrbUNhdUE2OGE5ZHpW?=
 =?utf-8?B?ZjAyNGxmaHRVUFlDTzU2Nzg5MXpXdlY2VFVJUGpyQ1ZITUxBeXgxVjgwbVpz?=
 =?utf-8?B?dEtoc056bGNnSEZhV01vK2lkNjlNNDk5Y0J6V0cwTDZVc05KM0ZCRE1VcnRh?=
 =?utf-8?B?UlNsSjVPeWVJVU1tcUl3akFsUlRoaDBOTWswNWNXMGdOY1Z6WHpwQ0lBcXBO?=
 =?utf-8?B?K2tNazQzcFpSWitjb1FxcU0zSitLTUEzaktSdGJKZGhlWWhqZVdubWJlS09o?=
 =?utf-8?B?ME94YnNxTTNjdkpVbDZxOWsyeGRMbmxHc2V5UEl4dEVvUUphdGZXdUxNczJH?=
 =?utf-8?B?OEpEaGIrWkVWSjVrWEZQbmJZK2NRMzdXTExncU4rYm5wUTRISjlJcGJ0NzlH?=
 =?utf-8?B?Z1RWZENaU3RmZ3JWQ1RMQmovczJBR3VTcGVlZ29MN1M5aHd3VnYza2E0eW1p?=
 =?utf-8?B?eFZpWlVTdlBFK0dtV2JzVHIzbzFwcmZIYnozZEJkOWtvc1pXTVFUWkMvbHRx?=
 =?utf-8?B?SkJBcXlsd0RMTXBCWE1WUFo2VmQ2Uk9NWU0wQ1JDNDdWTmJQeG9Ob0IxczQz?=
 =?utf-8?B?ZDhOckdwSHZWckIxdXZQc3FNck1ncDU4Y2dSTUJzVkZlVmlQTVBCV2RzYW9U?=
 =?utf-8?B?R1BXRlpHUHhFV2ZGV3FZOStnc1BibmJSOURZdmlEeVB3c3Y1c05HY0hoVnVY?=
 =?utf-8?B?akNqYm5MYVZ1TUJXRVgyMDA1bEJjL05QT0Z3a1lJTWpyVk9SeE9CbnVEUElY?=
 =?utf-8?B?MkRSNjVFSDUwNURXN2ZDYXJ6eUoyQzdSUTlZREpIYjdST2lWYzhRYlNrdzhu?=
 =?utf-8?B?NjhvaC9CM3M4cFptZDRzVmh4enZtZjhhdWV6dWxmSVBLVWdoby9ZU2xtOVFO?=
 =?utf-8?B?M1M1UFJEaUFWcWJZcEo1K3c4RnNGcDMrUGFMVkVDL2x6Ull4a1RaR2twNkNI?=
 =?utf-8?B?a0tUcjdoTEdCM0ZBZGF0aUxlTnFtL1RValpUNzZsQzdZOXdJWGJvU24zc2ti?=
 =?utf-8?B?YXp6dWhPQjRQbG9QR2ljVTRuTWN0OXYxYURCdFVQL1BRQTQ3UzFJM0NqNnB2?=
 =?utf-8?B?ejFpd1FVa0JJMVhFa3hyejY0ODhjS1QvbXl3aStYUHpzL1YzcDlYRnFzOHZp?=
 =?utf-8?B?Q3ovRWRFdTVhc01sZnhDOGFtcnFLNlRPNWI0M1ByMi9NTEdrT3NFNUhLcGN1?=
 =?utf-8?B?Mkhsa0V5K0QyeUhYeDVEd3ZBdGNFS3ZYOUdjRmNtdlNSTUhWYnA0dUE1UUF3?=
 =?utf-8?B?bVIzR0daTG5wVGxqbmdSN3l6VzlYeG5WYWVMb2QySHBnVkR4NlZlK1R4RFY3?=
 =?utf-8?B?SHovZGhZVGdYc3NzUlEvSk1iMWVseEEvK2RtajZTUHpIQ2JLaUhKRlozWS90?=
 =?utf-8?B?U3FWMGlwSEdEeDB4Y3Q2aFFHSVk0Mzd4Y05xZVNXa3dXeWsvaWwvQ01FVENp?=
 =?utf-8?B?TDFIaEVmVjRTMVh6Wm1DOXFOSXhMOURJd3NBc1l0MjJ5OUswaVpPVjliTXFZ?=
 =?utf-8?B?YWV4RjQyUnRYZkxTRzltajFuM1VJek5pZVRXMG9mMU9DbVR0a0pNRFVJVmJx?=
 =?utf-8?Q?RKsPJX4nlvv+YYL7jH35VAVY07NDbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVpbDViRFJ4WE5makFhZEtFY3UzV3hLcTBqZUZXcElNeUJIMHdMYlBZYUhW?=
 =?utf-8?B?YU8rWmxjem5pSzB2QXYrUXBxTkcrOFpUWnZJRnBRMGQxSnFncW1UMkwydUM4?=
 =?utf-8?B?d3c4QjArK1VPRW5wTkM2WnFabEhVV08xaTU2cE5yUHo5Z1ZDMnllbG5VcWdH?=
 =?utf-8?B?VXZUMk4vOW0rL0J2SFo2WFNYSzUydDV1TngybXBJZGZreU5iVG9TOS95WlFO?=
 =?utf-8?B?eVhhMjZoelUycVQybkFKZ2FiODlFVUIvSW5pTUgyUE8zcE1pZHR4bjZrelBW?=
 =?utf-8?B?V0dUQlhGak9SSXdWRnV4K0NCRituQjZIUi96QW5wU1BheXFHcngvL2ZtaWJy?=
 =?utf-8?B?MDJLWEdIaVBUZnRUSHhHTVErUmZBWEloVVR2L2Z6VHAvT01XRW1ULzdVK01N?=
 =?utf-8?B?WWdON0NBSGhXd3RheFpsMVRISlVpdzJTMkNZcmFueDB0QTFBZHpSOEloU2Ri?=
 =?utf-8?B?ZEt0a0tNVnVaM1V0Mm82eHdUWlpEeTYyeDIxeVZQUEtvU2xDSzI2NEJMWktY?=
 =?utf-8?B?Z1VnZmQ1aHVTdWo4TXlJeTl2Rm9oS2J6a3ZmeGI1bzYvNDlHdmVqSWVwK250?=
 =?utf-8?B?QnFIdzJSSlJGc3N3NEh5Mnd5UGc4OFF3NVhoUGg2djBReFNyVkxBcEgrYWYw?=
 =?utf-8?B?MDkvSTBBNFRCR0FwWFM1UTNGQzdXMVpPNXkwYUVZSEV6RVh2ckNLL3pXZjFv?=
 =?utf-8?B?ZlRBTEhlc1JYTnh4T0hacFdiSkdlSkhJKzl6d0JUcTFVKzlLNU5hbDExMFR2?=
 =?utf-8?B?U2RveVY3Sy9yUlV2QkpSNXFKWTdSM0tnRTVvQXVwbUJBVlM4cDRJTmgwWlFt?=
 =?utf-8?B?LzFpR1N5OXY2cnI1UG1vT1k5NW1kTUhQWGRFOHRBYysweXhYdzZpZnpkc1VS?=
 =?utf-8?B?Y1ozRnl1Mkt6bzdKaklIL0dLa1BUNm1HdHNXKzIxeDQ3K2RobGhaYi85YmFH?=
 =?utf-8?B?eHVYR1RFT09Mc2d6YVl3cGR2bDllcms1Wkovc01iUmZtdWhORk5BY0h5enMw?=
 =?utf-8?B?bStma1ZReEtHSTVSYVhUVDBocFptYW8wUFJPMUNpR0szSm02NDhyVWp2cmM4?=
 =?utf-8?B?US9VVTExZjAvN1lmRTE2RFNEQkJabFZDTDRiTTBDOC85VVUyNGthRlZLeVhy?=
 =?utf-8?B?N1hHRUpRYTlVWktSVHAzcnZJZWRsSXFCNlFFdzdGbG80cVhyMmpaUklBZTBt?=
 =?utf-8?B?STJ5aFRta1pneGlTSk1tWGtaMGVnaStHK2l4eHQyR1dGM1NxeDNHNnE4aHdM?=
 =?utf-8?B?Vkw0cFNDdTJUVVJXcVkvRytGMUVvb29iQXMwcTdTYVNxWEpUclR1NWUwRFNE?=
 =?utf-8?B?Z3k5blQzVm00ODZYV2FISDQxeEg2NmNNL29lMzBKUEUreEJhWmh1eGZlNUhk?=
 =?utf-8?B?OFZVQjloR2lMdGZkMjRCM0N3NzVnaUl2WHhJdGNaTmFScGhpdWlvYUVKNWd6?=
 =?utf-8?B?S05UWkdqdzlzRFNhLzZDcVlaUW5XV3hleGI2V1ZpUlFTVzMwczkyMGFiTis0?=
 =?utf-8?B?YmF1bnRTK0ltSUVXR2cwV1FnajgyYlRjTE1FWWpBOGdBaWsrRHZzc1FzUmYx?=
 =?utf-8?B?eit2SjUvSWNPaDFGWnc0dUFYSGF5MDlHa2k3eFJXK0pjdkRXZjdPUnc5Z2RK?=
 =?utf-8?B?dG9JNHhCRWpiWVlwclJKbi9DRmxlSWJ0SnlsOVBUcGhUZDhZTldaR1Jjc0pi?=
 =?utf-8?B?YVcrNUovZUNTSWxjaG51SGN0UkZWSGRKb3ZkSW9zMFlGNTNEQjcwQ2Z6VUkr?=
 =?utf-8?B?L1NlOFkyNWFhSVZkZFBvUUxmMUZJTC94M3RnY3lXTjlFWmdReC91YmtQTWcz?=
 =?utf-8?B?UytDV1JIbEZ4Z3ZLOGdrcjJnRmFRZWYwRTA0cWJCdHVXK3lKV2p0Y2xISWl0?=
 =?utf-8?B?RjVBRnJqeDhLT0hPWHNrSnBqajA5eVh1ZTJGSnJ5cFI2TkpKQ0kxQlh4UzIr?=
 =?utf-8?B?ZnBJc3lsOXEvVmZLVnprcDRpSGdCOVhEVUFCQ2tWQXRJQ2tBYVIvdFg0NEhk?=
 =?utf-8?B?aXNhUW1wVFQ0dGlOc0ROM2d4Mlc0SlRlUmt2V0pHT3pESGJUbG1RUVJMSFcr?=
 =?utf-8?B?SDVWdUgwWGVJNThRR1k4b0YzY3p2VU1mK0t0K2laTDRuWEthbFN0cC9yWTZK?=
 =?utf-8?B?dXJRa2pWcGlkdzJyWnY4SDkweXhhQXFMRDZpdXM1dlgvUU53aHJKa2lXVzVP?=
 =?utf-8?B?TG5aYTE1QVhvcXUvM1ZWM1RRTW1WaTZTanB5QkhCd1ZTSGIrdWo5dm9DNm52?=
 =?utf-8?B?K3JlbjZJNWNIYW1QUXJxMUQzbjgxQmtPUDNLVmtZaDBVTC9sM01wdXZhbmVP?=
 =?utf-8?B?MlBQaThTMGtpbmd3MlJRSmk2Vk0yUGY0eFJBd3JZU1BGdlFZZjlUdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c308c6bc-9621-4dc7-dcc2-08de4cd89678
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 04:03:45.6573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fC7OQ82+j0u8M9lIm71LqIXHn8Kkek2djAi5oo+yYEnFAo+/T9gkj0+0/YNFgjyCZQ3k6G3iZs6YtpQ9KSBAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
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

Thanks for the review!

On 29-10-2025 12:32, Kandpal, Suraj wrote:
>> Subject: [PATCH v6 1/5] drm: Define user readable error codes for atomic ioctl
>>
>> There can be multiple reasons for a failure in atomic_ioctl. Most often in these
>> error conditions -EINVAL is returned. User/Compositor would have to blindly
>> take a call on failure of this ioctl so as to use ALLOW_MODESET or any. It would
> Or Any ? I think you need to rephrase
Done!
>> be good if user/compositor gets a readable error code on failure so they can
>> take proper corrections in the next commit.
>> The struct drm_mode_atomic is being passed by the user/compositor which
>> holds the properties for modeset/flip. Reusing the same struct for returning
>> the error code in case of failure can save by creating a new uapi/interface for
>> returning the error code.
> This sentence seems a little weird can you correct this.
Done!
>> The element 'reserved' in the struct drm_mode_atomic is used for returning
>> the user readable error code. This points to the struct
> In that case why leave the element name as 'reserved' should that be changed
Good thought!
There are drm clients checking for this reserved variable to be NULL as 
its unused.
Once this patch is merged, then will a follow-on patch to change this 
variable name.
>> drm_mode_atomic_err_code. Failure reasons have been initialized in
>> DRM_MODE_ATOMIC_FAILURE_REASON.
> I don't see the code for this here.
Done! Updated!
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   include/uapi/drm/drm_mode.h | 41
>> +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index
>> 1e0e02a79b5c8db200cf9fd35edfe163d701cbd5..1e9eeae472e74bbd1b5e0b6f7
>> 9f9782cafaf5b6e 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -45,6 +45,7 @@ extern "C" {
>>   #define DRM_CONNECTOR_NAME_LEN	32
>>   #define DRM_DISPLAY_MODE_LEN	32
>>   #define DRM_PROP_NAME_LEN	32
>> +#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	128
>>
>>   #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
>>   #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN)
>> /* deprecated */
>> @@ -1205,6 +1206,46 @@ struct drm_mode_destroy_dumb {
>>   		DRM_MODE_ATOMIC_NONBLOCK |\
>>   		DRM_MODE_ATOMIC_ALLOW_MODESET)
>>
>> +/**
>> + * enum drm_mode_atomic_err_code -  error codes for failures in
>> +atomic_ioctl
>> + * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API
>> usage(DRM_ATOMIC not
>> + *				       enabled, invalid falg, page_flip event
>> + *				       with test-only, etc)
>> + * @DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET: Need full modeset
> Should this be just be CRTC_NEED_MODESET to make it differ from the below definition.
Taken care of to match the error code/function in the KMD.
>> on this
>> +crtc
>> + * @DRM_MODE_ATOMIC_NEED_FULL_MODESET: Need full modeset on all
>> +connected crtc's
>> + * @DRM_MODE_ATOMIC_ASYN_NOTSUPP_PLANE: Aync flip not supported
> Typos here
> * DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE
> * Async

Done!

Thanks and Regards,
Arun R Murthy
-------------------

>
> Regards,
> Suraj Kandpal
>
>> on this
>> +plane
>> + * DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP: Modifier not
>> supported by
>> +async flip
>> + * @DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED: Property changed in
>> async flip
>> +*/ enum drm_mode_atomic_failure_codes {
>> +	DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +	DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
>> +	DRM_MODE_ATOMIC_NEED_FULL_MODESET,
>> +	DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
>> +	DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
>> +	DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
>> +};
>> +
>> +/**
>> + * drm_mode_atomic_err_code - struct to store the error code
>> + *
>> + * pointer to this struct will be stored in reserved variable of
>> + * struct drm_mode_atomic to report the failure cause to the user.
>> + *
>> + * @failure_code: error codes defined in enum
>> +drm_moide_atomic_failure_code
>> + * @failure_string_ptr: pointer to user readable error message string
>> + * @failure_obj_ptr: pointer to the drm_object that caused error
>> + * @reserved: reserved for future use
>> + * @count_objs: count of drm_objects if multiple drm_objects caused
>> +error  */ struct drm_mode_atomic_err_code {
>> +	__u64 failure_code;
>> +	__u64 failure_objs_ptr;
>> +	__u64 reserved;
>> +	__u32 count_objs;
>> +	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
>> +};
>> +
>>   struct drm_mode_atomic {
>>   	__u32 flags;
>>   	__u32 count_objs;
>>
>> --
>> 2.25.1
