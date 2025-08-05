Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764EFB1ACDC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 05:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF70810E467;
	Tue,  5 Aug 2025 03:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUAREG0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D1510E45C;
 Tue,  5 Aug 2025 03:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754365519; x=1785901519;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dEa95eMVLkxOIY/RIZosN6jTz5MLelZLghxD2Ejh4Ug=;
 b=mUAREG0OY8IwwNdPNTPRfcGl+0ja+KBNSbd8IVbQst4JKZLQacwl11AO
 jrgJoiJVeF4yT1agVKRpxohgn4qNKkR63Hm0WowU+CctkzhVcm8ACfHGp
 ymmaHsfk2kYgug9msS0xypgtyq3pWtkNk1wEQAfEQAi2s9BEKWlni6d2B
 DsPnXmuUx1al4Oe3gbjbbYTc0wO802aH1d6LfNG9fYmNcRKfa/+uVGwbv
 ZBDnhbk/1FsSB99cXzTpmw560UdAsNP7TrQ+EVcQ/G7DM405r1eJrmVRj
 ie2hBapYXzX8MsUej/hqZnWy50vEsdrtzLXGY13unxHreAhIZ75+kmS4X g==;
X-CSE-ConnectionGUID: TL2ER1l5R46ZZ7OhcX5dsg==
X-CSE-MsgGUID: Wv1aaLkrT3aIqIzLc9soBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60282933"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="60282933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:45:18 -0700
X-CSE-ConnectionGUID: MEhyrpcGQ2+K69MQBJnjfg==
X-CSE-MsgGUID: aKFgaT/wQX+9Oz2TP3WAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="169729831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:45:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:45:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:45:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tz4vXHubzD51RgguuXwddPb0CVVoFNcPvkOxcTWBY3xd8/H0nEEcD+WrMyliYHm46+WRe2pQAQuFj1KwIJSb1OFf2/lAzWgLM4ib4zMDFJqyQjhqebFai0Bg1j2IIUdlkeZ8N0+lgBxBbLLkgc8LHH2rMaxJAX0drneQ9/1/JjovWkYnwFcX0ejDeXN1w/8FcjSw+7DdA9U7Kbq+TlcDrPDmdP77UNEOEnZunBbSR8VTwE+cdcz+TSgWwfimsw4SnD1nHDTB6ba50lu8us8ov6siBGK1ZvW4z3x6knyPsE56z9+DBPhmRNp5hCKuY1Gi5Q2K2NFiwgIjjqORoguHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6NGfMR/zUmlPPMnheyLcj0JL0e96ArR1RCxo5zTxhM=;
 b=JnN+91ypCt71tS5+6B1Iv62Ww+p/DmZV7tE5DjkyWljiVKXmH2eTo6LaaKBczLsyFpmhPvFI/GH+aPIjl6e/8pnKQgnICETzghtex232egetaBoI+8QRmR35H1K9tX9YuCQKF3cUC39Nq2BTrGBINJ4jChzgfFQmDOlHe6RqUX+0Sm5Dg4oXE394X/N92MEU3i+Y6puGklgR19Fh/BBYRclOjUe3ae+JCBk2cse1Ywaq0uA1fRdTUh2RPgfpuN7zbbaBEZJ3FzXOey1x4DTrjt94VqRE3E4GimFTS2TczASPYaHaj9jk5OEhHRzh4v8ZJHErTlmdaVlRfQbVexvksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 03:45:15 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:45:14 +0000
Message-ID: <cb898590-1c91-4ad3-a915-b0cae4eb3816@intel.com>
Date: Tue, 5 Aug 2025 09:15:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: don't run atomic_async_check for disabled planes
To: Xaver Hugl <xaver.hugl@kde.org>
CC: <dri-devel@lists.freedesktop.org>, <andrealmeid@igalia.com>,
 <chris@kode54.net>, <naveen1.kumar@intel.com>,
 <ville.syrjala@linux.intel.com>, <mdaenzer@redhat.com>,
 <intel-gfx@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <alexdeucher@gmail.com>
References: <20250801131053.6730-1-xaver.hugl@kde.org>
 <ad9b68cc-4a33-406a-9512-ff5f5460bf99@intel.com>
 <CAFZQkGwviMAshk5gSF0pDmkqbfZT=6FHCfNq6PWj8srNEXjX7w@mail.gmail.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <CAFZQkGwviMAshk5gSF0pDmkqbfZT=6FHCfNq6PWj8srNEXjX7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SA0PR11MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0fedcf-6950-4b3c-5dc0-08ddd3d27cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmZSNUlqWGlDOWNEdXhGWWh3T05HSzNlRGJUcjhBaisvcllrVXRCNXdkN244?=
 =?utf-8?B?RVB3Kzg5UVpTb2FRdHFGWTdKZnM2WlZOMk1tSml0RE14cXovcHh1TFMrZGtB?=
 =?utf-8?B?V3F2ZWY3V242bFhSVGdDc0p6b2JEaXg0WnI4SGpxR0hYTGRid3NYMm9meWgw?=
 =?utf-8?B?Y24wR3YyeXJiMzNvc2hkYkRMdE1YVUNhY090cVZ3SzRwTjVRaDdXN1hUdkxM?=
 =?utf-8?B?K3p6eEpSRlIwV3BYMHZDdWNkdTZjVFRFOHhFOG0rMnFXVllSZ3pDNVhLRS9u?=
 =?utf-8?B?UjNRZHYySTBtUDliK3FQUXh4YlFNT1QzNWpKb1NJcVVEZzhGb0pqUGhqVGY2?=
 =?utf-8?B?QXY4dmZtYWE3Z2hsTHFTRDJSN0tNQmRhMVdsZ0JkNnU4WkgrSXljMkFrTTZD?=
 =?utf-8?B?NjdCTm9tT2cvUVE5UmlUMHY0ck5yRmwxZmMvOUNZUjJ4c3l2NlZmb2VTeitV?=
 =?utf-8?B?bzRlcjFHeE5Mcmx2VlM5RUR6WmtIcFl5WEFTWmM5dERZYVo5VENPOW9ZN2U5?=
 =?utf-8?B?MFI4ejArWVJ1WUEzWFRYc3NTZUlkZWxTRXRzNkxtOFNrOXJaNk5SdStheWJQ?=
 =?utf-8?B?QjJwd0V4bEhoT1BILzVuZ1VaUUQ0cGNCUTRJYjJWRHVOYjRRZVp3N1hXWTR4?=
 =?utf-8?B?QzlYRjhQWmtCR3gwcWphK0RpRzMvMEc5aHBJRnRIejhyZkx6UXFlUEZUV3RV?=
 =?utf-8?B?clB5QVQ4YnNxM3pzVGgxaVhkYXpaanZmQVZHcDJmTFRxcjUxL1hGS2VuUlFN?=
 =?utf-8?B?S0d3TUVKME9WaTB0TFhCTEErMHRpcGwwTkxha0RlcXpvQUtBWjBBR0kxbTNk?=
 =?utf-8?B?dFE1cTg4cjNlVXhLcmRsODhJeGNqWEQyQTJvUWE0UUV4dnBNK1JHWGpQRzRn?=
 =?utf-8?B?L2cvM1pPZFdLejFmSkhEZzRSeitBK0huR29nb3dYWFBjVjdRVDFHdHRKdnNN?=
 =?utf-8?B?cDNKSGVHbHZVZHQwelBkRThuS2djdFRlVUNmUXMyZXFmMHBJL1JzY0ZKdFZ1?=
 =?utf-8?B?Qmw2TytPMlV1NGJMQ1V6KzFnT05iMnlsR3NQM2FmKzFOZ2dzVU5QL1hWVnNO?=
 =?utf-8?B?RFpWQ1R0TWRlemVUeVRyNU03VGZ0bVZJellqUFludFQwRVdFNHE4SlJSZlJT?=
 =?utf-8?B?VUF2d1ZYamZuZkFwdDRWd0hDRUhNZlYyVVF5dE4xSVNITHdaOU5IVWNMem9P?=
 =?utf-8?B?MkxOTHdnMGlKWStDSERYZTEzMEZHWFcwNEc3NWMxZnNSWS8wTk9lcjBuZnpw?=
 =?utf-8?B?aytjMU1rQW50VkNZYmJCV09ndFU2RXdsM0VaSWZrZUVPdHo0Z00rb29xVSs4?=
 =?utf-8?B?UDk0UGhuMzg2RW5vbHdVMmp1SEplT2NQV3R1ZVN3UlBZRUU3WnQxVzRYVlpi?=
 =?utf-8?B?WEhkVVRWQm51dXJ6NU9xOGh6RVp2aHdTSy9Pa3NEd01jUDBhMmpKSXl0T3dU?=
 =?utf-8?B?aEJqcnFncXpzMEoyb05zWHBlVy90N0pFQlZFdEVuei9RK3NIMHdqM3p4U1pa?=
 =?utf-8?B?QnZHSDdMMG1jbkNPRkEzRVJpeFNleVRFWHlhUTRtNFExMXNwelRDM2RzU3BV?=
 =?utf-8?B?TXVIWjl3OS9SUGRYTlQ2K3A2MkNjTGdVRkc4a1F0TWZpTzMybU9OUzMrSkh4?=
 =?utf-8?B?VzRzOVIyTytZQmlwdDNhZXpTSlZLT0kyZHlSZWFzTWhia2JhUlEzanczcEVa?=
 =?utf-8?B?ZkVVNCt1amdKTmhTcW9ybkFuQjM2cHRtcHR2U2Zlb3UvR2grV25LVWFlclYx?=
 =?utf-8?B?aGI0MGc3NGtoK0dmOFZJM3B3SkkzRGEyUzFZSkJwZkQxeU1ucjB4RGh6eXhz?=
 =?utf-8?B?SEkrR2htTE51eWZ6cnRJWGNYa2tIcHhXdG9wVzRXb1ZZMWRQZTZGekhTYm5C?=
 =?utf-8?B?eFBtYTZ5UDVQem0rS1ovOEI4Z3V6R3pST0ZXRU5jN3orUGRpZ2xxK1RQZzhP?=
 =?utf-8?Q?HgQrBX5mJfA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUIyNG5KVlJJV1ZkNzV2bU4yRDBDMGNpb281bnBsM1d0YWMwNk1XY2s0SjlW?=
 =?utf-8?B?Wld0NkVkQVdiZ05rQmxpMllCcFBQQ2dSNk40RlpnV3MzNEE4OFNLSWd0dzY3?=
 =?utf-8?B?aXpqMjNyS0prNW0yODA3Y3VPR3dsVVBRQ3FpaTBlMHliWFQ4MEVWTFozeGw2?=
 =?utf-8?B?dWZUcUxOK2l5UEZ5SnRoSTBrdFBGa005OEVmV3pzNjRyUDkzbXVPTzNCNTQ3?=
 =?utf-8?B?eFhRNXpVbUIzNnM2WDNGSjV2UXNQNFZqeGl2elFlbkJESXBZNHpmUVdXV0Vz?=
 =?utf-8?B?U0FBcjE5bHBGK0JzWDcwSFV4QU4wUHdhS1NCZXF2L3g2Um9nYnRRYlpzOFlx?=
 =?utf-8?B?bUYvOEsvQU53N3hscGZ0eksyTmxBOWJ3aG00MlVBV2txeWYyZ1hXSmtaNldH?=
 =?utf-8?B?M20xQzBTKzErZG90cXhQMjhySGxRVisrMVkxNzdFbjZ6WWxGRzdSUVoyK0M0?=
 =?utf-8?B?OENRZmh0c1VnTXAwcHBnZFJsaVNLallqdk9iN0RSbmJzS3dUdnlTdVBqQ3FI?=
 =?utf-8?B?RElDMVc0cVBIaTVJOWFKMkRPdExvVjNENkVqcWR5ZEdJc3FLNzZJUGZCbE5n?=
 =?utf-8?B?VHRxSlY0MitqOEdPdS9rK3NGN05rVUwwMytHN0NXVi9zVXlJajhyWFp2Zjh4?=
 =?utf-8?B?bklrV2d5Z3U5Uzk0MXY5OVU1Vy9ienZXcWVTYWp4WXlCckF1RXhMTGczVDFi?=
 =?utf-8?B?RlQ1TStnWW1Fc1YyYUxvS0s0bzdSdE5UZm5DRTBBTGxmTVNTeDcvcFJ5Qmp4?=
 =?utf-8?B?RUZUdlhjd3BYdUFnVkxSU0IwWm9jVk43VFJUaTZ1RGovcDdQUllaRW9aR09D?=
 =?utf-8?B?VUNTcUJudHFnc2Y0RjBIRlBGSTVmNHBxc1dWV2JLcTd0Q0tmZ3hNc09uU29C?=
 =?utf-8?B?OU9DZkl1L0J4cnA3R2g3ejRsT084WEVWbHo2WjVxV1MrY0owWEgzS2lERHVF?=
 =?utf-8?B?WUU4blBQQXJmd2ttcCtqa3NyNXE2WjZnUWU1TjcyNVcrVng4aTlUVkx0S3hi?=
 =?utf-8?B?NTJjNUsxa2JvbVpCNW0xK09ianlzQytNb2pRejBqdzNRYzduNnhxamU5UE13?=
 =?utf-8?B?R3dDaEtJaUxockVsRmlrOW1iZ0JBSVlSaFk3QTJlU2FybDUwQkI2NzFOd0Zq?=
 =?utf-8?B?aitLc2R2WDdRWjBNK1R6b01WTlFwcUovRXRZVDlNblJScWtvRUl2K1ZTUXBs?=
 =?utf-8?B?V3dZN0pSOUVHdXhXVTk3R1R3bkFpNHVvR1Bxb0t3TWI4bEUvUURXT29ncldH?=
 =?utf-8?B?UHFZV1ROUE9XVkpXYWp4c0pFdXJHQ05lUzF4TFF1Zm5Db250NkdqNmg4cUg2?=
 =?utf-8?B?TTRQNHZTYXJUZFY1Vzl4ZnhvSlRGbXhOYnZQOWlpek9LaWNkOEMrZWc5dzJ3?=
 =?utf-8?B?STdxVzd3RDVzL2NudXJ2KzIyS2xtL2hYa1Z4VURlb0V3WklCQjVzZTBtWUF3?=
 =?utf-8?B?ZjY1ZG1uN1hPWllsM3luSUp4ajVSejdOWmljYUtvNjF1OXV2M25kSXRHRklX?=
 =?utf-8?B?b1U3QW5tZWlGR2NMWFJOOXRJVTRRTjhFeVplQ1E0YjVCek1WZGVUL09YSlhx?=
 =?utf-8?B?Y2NpaVZCN3Fwdk1vYmVDTHFWenhHWmNkNHVIWnVTTGVKK2twZkd5OGJQOXNm?=
 =?utf-8?B?dlJndGpOdUNlOVR2ZUpJU2hpNzNRTnhTWnBLcnFJRlBLUmFWRTNRQ1lXRzNE?=
 =?utf-8?B?Sk1aRWZKK1hXUHJ4T1lPVjZzQjllWWg2TGtZMEhlM3lET3B1M3ZNZ2FMY3Iw?=
 =?utf-8?B?STV1SnBaZFpHUFRVWEl4bks3UHFlV0RlSGw5emZ5b0R2MlFLRlo4ZlIvT1dJ?=
 =?utf-8?B?eXk3YU8xYThQNXRhakt5a1E1Tnl2bDM5blhrUGM4Z3FUS2huamo3SjVTTDBl?=
 =?utf-8?B?TUlBM2pEZnYzSktjQ0xsVndCRWhFeThpS3RqUG04c2lmZy9SOHdTeVF1MExt?=
 =?utf-8?B?dkUxSS8vTzVhWHBMK3pCeHlrWWpUSG1CZmk0dU50V3Bsa3hSdXY4Y1Azc3Ez?=
 =?utf-8?B?OFpYeU1xYUprblppY3d3ZHRHKzRjUkpOWDZhNXFwYnQ1ZUZ5S0dnMmNJN3pi?=
 =?utf-8?B?aUZFaVJPRCtDdS8yUEI0a1RXK2xVR3plcEtpYTRocko4Wk82LzJJOU5NV0xm?=
 =?utf-8?Q?X/Y0sGHYd6IUUXKE+fMojYp0/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0fedcf-6950-4b3c-5dc0-08ddd3d27cbb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:45:14.8972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx1W9Yzmz+WUyajA4kkK3t05OL0xi4haz5rkZjwD/amUfB+LdBPZkgXRik/DsP7Ogli1ahJNJWfHtgq755YeOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
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

On 05-08-2025 03:02, Xaver Hugl wrote:
> Am Mo., 4. Aug. 2025 um 11:54 Uhr schrieb Murthy, Arun R
> <arun.r.murthy@intel.com>:
>> On 01-08-2025 18:40, Xaver Hugl wrote:
>>> It's entirely valid and correct for compositors to include disabled
>>> planes in the atomic commit, and doing that should not prevent async
>>> flips from working. To fix that, this commit moves the plane check
>>> to after all the properties of the object have been set,
>> I dont think this is required. Again the plane states will have to be
>> fetched outside the set_prop()
>>
>> Alternate approach
>> @@ -1091,8 +1091,16 @@ int drm_atomic_set_property(struct
>> drm_atomic_state *state,
>>
>>                           /* ask the driver if this non-primary plane is
>> supported */
>>                           if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> -                               ret = -EINVAL;
>> +                               /*
>> +                                * continue if no change in prop on
>> non-supported async planes as well
>> +                                * or when disabling the plane
>> +                                */
>> +                               if (ret == 0 || (prop ==
>> config->prop_fb_id && prop_value == 0))
> This would allow disabling a plane in an async commit that was
> previously enabled, not sure that should be allowed?
Yes, I assumes this is what you intended to do as you had if 
(curr_state->visible or prev_state->visible) in your 1st patchset changes.
If disabling of plane is not suppose to be allowed then prop_value == 0 
condition should be removed.
>   Also, if the
> property is fb_id, ret would be used uninitialized. But you're right,
> this should be fixable with smaller changes. Probably best to keep it
> minimal for the bugfix.
>
> Looking more at this code, I also notice that it currently allows you
> to change *any* property on overlay planes in an async flip, which
> doesn't seem right.

As part of ret = drm_atomci_check_prop_changes() ret will be -EINVAL.
ret should be checked for failure and returned over here.

Thanks and Regards,
Arun R Murthy
--------------------

>> +  drm_dbg_atomic(prop->dev,
>> + "[PLANE:%d:%s] continue async as there is no prop change\n",
>> +                                                      obj->id,
>> plane->name);
>> +                               else
>> +                                       ret = -EINVAL;
>>
>>                                   if (plane_funcs &&
>> plane_funcs->atomic_async_check)
>>
>> Thanks and Regards,
>> Arun R Murthy
