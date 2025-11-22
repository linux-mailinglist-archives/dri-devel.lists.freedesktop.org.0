Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903FCC7D4EC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 18:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C9310E0A9;
	Sat, 22 Nov 2025 17:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpnHeK+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0E10E0A9;
 Sat, 22 Nov 2025 17:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763833532; x=1795369532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a57GD3XiqqotQePCMtLIaClq0ecWkysst+z5xdtoI5o=;
 b=CpnHeK+X3FZePu4ejCLO2dADYW91JBksBCy/WGztszCdw/Ed7JhIK13+
 Y8kPMhn4iJXEBMB5h8UFJhC9NyJhPGNBfdXa563QFlXd5lGn1ym+See6W
 CnT2tBgdlnDJlgHOjJ7y1D5BvPGfH/ddgNO8wAC3Pc69UgVwlBU7S7qGS
 i7sqAqxLpZLFuvDVa1sgIO+QlJF3eYZPPxC/4oiwkLx4D5y9WkAPcPdyD
 8Ya1NA43/j8lWyWIoroSkA9boUXqiqTJXF4G06hmInhqiaPqSovOjHBya
 Kp4+4nBL0oxRachNjWiy2rwpGzUWdIBIAsmoPEt3UE/f8jqC+/PHzo0uV A==;
X-CSE-ConnectionGUID: gFIJCGr8S1aTB5dxkdO8JA==
X-CSE-MsgGUID: 3Tt1mDCZQIKxIE6gGEkiDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76227506"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="76227506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 09:45:31 -0800
X-CSE-ConnectionGUID: 2EJPzN+PSLm/t6sFA0euRw==
X-CSE-MsgGUID: k7kDpz3ETwS9P2pmPzaxdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="196892250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 09:45:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 09:45:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 09:45:29 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 09:45:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Foq5Cpf8SzA0iq47QmOxF6m2IHoKSfZ77Qq0exTFKkqpTRiymjfNH2p+XpKrwv94iuKe2yejL8pauRDCmh06nY39S2bsgCG7Drvayt59F2UEX9NjnHGEwSO6CU/Sz5HLr+203vXMbWSQKnK7fzcxMwkr4UOJw8Qq4bt1ycprnsfjWrq0dmMHgF85JToYVSw8RZVS1/zczGgZlBa2ALU/k14Mcrl4FCOMO3M95DjQnmy3Ybh3Ai9+6fzmV0iwSnqxwkGLbwic/M84uGpi2glQJ4M095PfiDNcmz8hmkYZ7oTDGFrVViK+ux+WK/6HM0B6GGvvqlxl3w9cFgzqU5CF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd9TFsUAn0VXWNfAGkUwglN+sXv3/780EYzazZbD+7c=;
 b=FxzJuj6B1h6WIfNw3jfukTyXtI+i5ik98VczcWLeHmaKKK3rGCmxxM6XgPWSZyrScbo10p/walUppApXOsMG5BXF/1TbmiWKPH3FMYpKB7UsmcQjBfkfT79D6CLUsJB18gZmzdkLpmi1Xu3PJls4xIuf/S4LreSmM5ERVqgF0bkI4ZWdjYwXr7258T8Gh58O2rTPMuoar+Y6M3mxrLSIPEY9YieeqI5NnmDL5z3S+QxH16ZE1M2D2UeXorbs4dsFP6Udb+7MM41Zo1ubv4/oX5ID2QRwpq/cD42dBO5pxVaePwCmofkfELH0K/1abFhOzdZS6zJ09ev3nXdTyypp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 17:45:22 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 17:45:22 +0000
Message-ID: <5c82393b-968d-4081-9cf3-b9a02a5f6072@intel.com>
Date: Sat, 22 Nov 2025 18:45:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/28] drm/xe/pf: Export helpers for VFIO
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-27-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251111010439.347045-27-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0254.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: b0297a92-a8ac-4981-6926-08de29eee908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHgwOU5MRkpuTGN1YTRaNktsL2F5UDZ0ZGR2R21hUEExUXRLMU1ZUXN0QzBE?=
 =?utf-8?B?Rzlua016WFRObEZVVHgxVHByU250WlUrVitPN1pUbXpxNFcvTm1SMjI3R1N3?=
 =?utf-8?B?aUtEeWdCNHFWRTdCcGhUNWJTSHpNK0NldW5TTlQwVmYyV3Y5ZzVIUm84WU1N?=
 =?utf-8?B?WHdnd0g3WXVoR01RZVpFYlZNNHZlVDFrb0VDZ2pQWW9USHZ4eXpWWGRTa3hO?=
 =?utf-8?B?MW1vUXNYY3ZEazc4cndjVnlFanpLZU0yZ1U4V0MvYVF1NnRzM1BvMUU1ODE3?=
 =?utf-8?B?WHM2dkVmYk1Gc3dnbGx0b0pnUFRGNXNqQStVSlZOYW9HUmVnbXdJSXNIT1I4?=
 =?utf-8?B?dnQ0UmJpcTh6S2dGZjNaNmNyeFJacnU3cVBrK3dHYWxkY1N6UE0vRnFRaU05?=
 =?utf-8?B?NDdFVStYbUcxUC9qZGxpUTk0VVA4c0QxbzdGWnhsRVQ1TlY0Qm12ckg0cUJR?=
 =?utf-8?B?V0pkaXVITWdxc2lVZEdyQzl6eUZkQTk3YUQ1TjRpL2ozWjVmOUJyenBMVlNB?=
 =?utf-8?B?a3NlQnBxMHJ4SnhvcUVNb2x2UFRrdEtJcWJKd3BZblBZKzA0bzVLNTlzQWp6?=
 =?utf-8?B?bms4V3ROc3NDeXlhOEJNRlVSY2N0S29vTktwMnMxaUFtaHUyc2RkNDg2WThh?=
 =?utf-8?B?NloyV01zL3Z1UytybEpCaS9VbUQzTG8veUwwREYrTDFadDJrTkk5NWlSaFc4?=
 =?utf-8?B?ZEoyUlYzRTNNaEYwSVlxQTM0aGxGY0VacUxmV05uSk1ZbDNhRDVGbDNiNUE5?=
 =?utf-8?B?Nnl1R25uYm5sMGdFcVgrZmJrY3YwbmE4dlhYbmErZFU1TGc4d1c4VmxRcTVC?=
 =?utf-8?B?MXNxakZna015c3M0QzZDNkIyTzUrYkFMdkg1dUdhVGhNL0FBQWswV3U3NkVk?=
 =?utf-8?B?N0ZJS0tMZmQ4NS9wSjV1ZTZqZUFVSzNZZ3E3cE5NcllLMlZUMnJDVlp6bU1o?=
 =?utf-8?B?ZElkZUo4QTlGcGtvMzBCTFpVS2lWczdQZHR1VWpLY0hGTkt3VHpIVVlkaHQv?=
 =?utf-8?B?QW9CdVdVMXhTb0lXK0dhemR3WUNZemJlOWFFSnRqWkJiYTZHc2cvbE1qS1Vo?=
 =?utf-8?B?QXU4VDlON1llOWFMekVmOS9PakdrUGR3NGd2U3QxY3pNb1EvZTVBQTJScitO?=
 =?utf-8?B?eFhCSmxyNnczeDc0ak5wWkRRRjNnTkgvU0xQaUV5Z3E5TTdURW9lSlE4R1pD?=
 =?utf-8?B?T3lkMnRMQUFvTnhoSWhqNDBRcjJPZmN2QkZaaTc0RjZydDNzZThzU0NLQm1n?=
 =?utf-8?B?YnpCSWRyU25vRGhyb3piTXR1MXNsM09KK1RxU2ZJSnpvbkZPTVJpeERCSFZk?=
 =?utf-8?B?THdTblQzYUthN3U4RDVZQzNmeGRwd011clNPeEFKYVZZaW9LbnRidHZMME5s?=
 =?utf-8?B?RlFOZnQvWU4zYm41akxVcFF5UXRock1WQ1BlNDhQWlFOMitVRldta1hFdDdk?=
 =?utf-8?B?cC91ekZHcGtLVGxOSmYxcis3Z0RJMUo0Wk81L0NneklqR09aQTl1cXljSTQw?=
 =?utf-8?B?T0JSUGFwK1FOWVRpZm1uQXoxN3FOaVVqUk45YXJ5OENlNUJPM3Ftdm1LSHQ5?=
 =?utf-8?B?SUg4Ykl5TUF1SGFya212bnVzY1NCQWJ3WFl6SGZ1UTlFTlFYclYzai9MbDZj?=
 =?utf-8?B?Mkd6VzlJMk83VnFJcmVDNDc0RTVtWkgwUjJGSTkvTVlwYXh4cGdsMWpDaXJD?=
 =?utf-8?B?c1FlSW9HRUNmZ2R5OUdjQ3pzTnZuMlNWVTJWUUFQQ0wvRDlLMlZCZ21OdTVw?=
 =?utf-8?B?VEZFOHpObWllUU1xWUFpYlEraGNiYkdKUVJ6TG1SMzVRWnd6SmNzcVQrTGJp?=
 =?utf-8?B?N2ZmQ2wzY0YwNVNiZ1ZpbFNORkVLZzRUOVh0U2gvZXo0ZnNjK0hYaDVtcUR5?=
 =?utf-8?B?MTlvOEVodXBMbWN0NklyTFpYWGh0WDNlbWdDTmpUbkFlUDErOFNNb1hsdHc1?=
 =?utf-8?B?dmtLRTQwSU5lY3BwRTRDVE02ZHNRZ1hIczIxemFQS3hxN0NFY09qaExuSHhM?=
 =?utf-8?Q?w5YzbORNG4OU8zkSoflZddVgeei26U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWtCUjdaUitqTkpzd1lXRTJ3R0Y1Y2wzaVdRMkk2dDhML3NNYlZ0SkRiYy9s?=
 =?utf-8?B?RW5MYWVseWg1bUtodFBweUtWRC9tZ2Z4blgxSXBvbkE0ZFVOdnB6SVUvRmxa?=
 =?utf-8?B?RkFNbGY5M1JhVjN5bXF3S0tnR2Zjd1owWkhNcmhub0dlT0x3anU1MTFZV2gy?=
 =?utf-8?B?NkN6V0NxcDlCV1ozL0J1Nkw3cjNUL1N3STdiaEJGRnFJV3NWTXFKRmxuZndG?=
 =?utf-8?B?ZTgrL1E3NDJsakRmT0N4OEs2VEU0NHMvWHFITzAwYXFVaHBncUNiaUJFdkR4?=
 =?utf-8?B?VGtNVG1sRUhUUUU3WXV1MXd2akx0c3ZRYkFTRVBseVFLNGJRM0ZxN2hPcUVl?=
 =?utf-8?B?ckJ3YkdtckV2L1pJOUY4L3lyVVdBTDU1VVQwMmZSZmNXVnU3bysvekRqNlIx?=
 =?utf-8?B?NUp4ejdJUnprdEtlUVBIU0xubkVYL0Q0UFZYTlhybzYwOTJUMFkxR056Q2t4?=
 =?utf-8?B?NXkwNi85czVBOU1obDdMVlJ3VmU2TmxrVm5Ic2R0Q3hKR0dLWElmMTZDY1p3?=
 =?utf-8?B?cERpTEx3bFBITHIxNnhyN0liVTdZQXJDTkd4aXdJZWtYYUpNelJncXM1VGhi?=
 =?utf-8?B?N3I0dGthTy9XS0ErL2R3eURhK2RWbFlNT1VKdjdiZVcrbHpxOUNOWjBrR2k0?=
 =?utf-8?B?L0JZSjNhMERIck81d0xyeGVVRlF4eEs4TFFma2NJajlzN01hV3lWUVVOQXRh?=
 =?utf-8?B?VEY1MU1YV2lSRWVuZkRVajZHenc1S3puUU9ENTRtTURlVVBPNmJjYi96dC9P?=
 =?utf-8?B?WjErRk9JUmtZbkhGTVNrL3FVcW8rMnJDd1NEL2RaRzYzeWNrbHREZnZzMyty?=
 =?utf-8?B?eFJwWHhxVEw4TE55OFlnWXJReEIzdEVOMk9jOXZCblFsZGFwMXZTcytpL1lk?=
 =?utf-8?B?alBGTTh2UDEvNENpNWVlQ3huelNTaEQyV0tYTXlPc0FMTDE3OFVadEI2TUxQ?=
 =?utf-8?B?YmFsWCtSczZQNzdyRGd4ZnRvZmpZVi9MVmdxQUs0M3N0WXU3Q2tCMzZnR2Nv?=
 =?utf-8?B?RjJGVEZ2eEFLKzZ6NGRQYlN5Y3JhbjQ5akN6WlFjcHlRVkZvTzh3bHpBaTBv?=
 =?utf-8?B?WThrQWdNdVNtOTJ2ei9zb0tocWQ4ejl0TDVFRS9VcFptcjMzQmtEeFFHTjlq?=
 =?utf-8?B?N29aVFh4TlZwcjNVcG45MXlMQ2Job2RBN3FJY1ZTajBnRi9GSSt5THdoYm0v?=
 =?utf-8?B?V1Rwc2pTN1kxWXV2U0F0bjhyNFhLcEFUMktoT3NrWVVlZ3drSC80a29SMHNP?=
 =?utf-8?B?OW8wM3NnY0tBcFlPS2NpVThJMzhBamQ5NmpHc0U2aXRneXFUNGE0cENIc0hJ?=
 =?utf-8?B?VTdwNVAvTE1NRU9YVHpqbXllOHlEK2IvczVMcThCY1FpMStmcVV2SmRqeFNh?=
 =?utf-8?B?ck4xRzRRN1hQSENLMXgwYlRQWjFNOXBHRndxdnlPZVBWdWpTSDVrWUVXQjk4?=
 =?utf-8?B?d1ZIMnA0cXRzUDR3enRGbWlNUGlYRi81RWUzWm84aUxJbE1scGNTblIwODho?=
 =?utf-8?B?OE1WU0JoR1gvajFMTE9ITjhCR0ZqK0grMS9Hc0lGSFEwdyt1VFpiMmpYMktP?=
 =?utf-8?B?azFiZkQyYTE1R3p2bEJodmFUYk1BeGZWeE5vUVpuRldZNjlucTBTUWh4L3k0?=
 =?utf-8?B?Uy9MU1MxWGsxQU5xRmxSTFFjdDlLYUVNaiswcjN5TFpXNnFjMnIxYUd6QjVq?=
 =?utf-8?B?YWNJbU1YZUNQanFIVTNTOG5RaWUra2kweTAzbktiYXVMK1IweldnS09zampj?=
 =?utf-8?B?QWYrWDdoSVVmNW1aUDhFaXFsUmtUSTZqa25IY3dCUzRHeEZic0o2dXdpbTZs?=
 =?utf-8?B?SXVoT05JcVJ5WURqYmF0STU3Z2tjUld6VW44TmJZTkdXdmZNNTNWQnd1d1ZE?=
 =?utf-8?B?dFpiRmtmeVJxNDdkT2dRb1dWdzhJbExIM2tLdmVQSWNsNmVJbDd0VmRaSk9v?=
 =?utf-8?B?dGJ1YU1PTmhCdVJtUUVLL3hVcFFacmNIanA4Tk52MEI1SWlVYzl0ekZJa214?=
 =?utf-8?B?Q0I3ZVBqdm1tRnZ2K0NtMWx1QzJRVERDQjN2aWt6MW82OWRYRUhRckZscjRG?=
 =?utf-8?B?Ykg3UEowVWZDM3huSThpelVWb1JEang2MXpNZjZFbXBDM3lUUDhmY2RmY3Nx?=
 =?utf-8?B?anZOaU5XVFltRmFrcEhoZXF6Ly9mSy9ZVDFVNWJ5ME1lQnRhVTlFSjVzUktE?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0297a92-a8ac-4981-6926-08de29eee908
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 17:45:22.4050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOKHXay876RK98nY6t9UaRKFurrOSynskcu1ndv8AukARDOHr3dqKH2SgvFZ8vDn4cOCD7GrLt+CIC3NrFp2e7KuG1J2ZB90sc7fuVWdm+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
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



On 11/11/2025 2:04 AM, Michał Winiarski wrote:
> Vendor-specific VFIO driver for Xe will implement VF migration.

I guess "Vendor-specific" phrase is not welcomed

> Export everything that's needed for migration ops.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vfio.c | 247 +++++++++++++++++++++++++++++
>  include/drm/intel/xe_sriov_vfio.h  |  30 ++++
>  3 files changed, 279 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
>  create mode 100644 include/drm/intel/xe_sriov_vfio.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4b273b025d2a..eef09c44fbde6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -184,6 +184,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_sysfs.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> +xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> new file mode 100644
> index 0000000000000..5aed2efbf6502
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/intel/xe_sriov_vfio.h>
> +
> +#include "xe_assert.h"
> +#include "xe_pci.h"
> +#include "xe_pm.h"
> +#include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
> +
> +/**
> + * xe_sriov_vfio_get_pf() - Get PF &xe_device.
> + * @pdev: the VF &pci_dev device
> + *
> + * Return: pointer to PF &xe_device, NULL otherwise.
> + */
> +struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev)
> +{
> +	return xe_pci_get_pf(pdev);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_migration_supported() - Check if migration is supported.
> + * @xe: the PF &xe_device
> + *

maybe we should mention here (and in all below docs) that this @xe shall
be obtained by calling above xe_sriov_vfio_get_pf() function?

> + * Return: true if migration is supported, false otherwise.
> + */
> +bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
> +{

while xe_sriov_vfio_get_pf() returns only valid PF's @xe, since this is an
exported function, maybe we should add some checks like:

	if (!IS_SRIOV_PF(xe))
		return false;

or at least use asserts to reinforce that:

	xe_assert(xe, IS_SRIOV_PF(xe));

here and in all below functions

> +	return xe_sriov_pf_migration_supported(xe);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function will wait until VF FLR is processed by PF on all tiles (or
> + * until timeout occurs).
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));

please move assert (or asserts) to the beginning of the function
(and please be consistent in all functions below)

> +
> +	return xe_sriov_pf_control_wait_flr(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_suspend_device() - Suspend VF.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function will pause VF on all tiles/GTs.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	return xe_sriov_pf_control_pause_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_suspend_device, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_device() - Resume VF.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function will resume VF on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	return xe_sriov_pf_control_resume_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_device, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration data restore.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_enter, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data restore.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_error() - Move VF device to error state.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Reset is needed to move it out of error state.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	return xe_sriov_pf_control_stop_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_data_read() - Read migration data from the VF device.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + * @buf: start address of userspace buffer
> + * @len: requested read size from userspace
> + *
> + * Return: number of bytes that has been successfully read,
> + *	   0 if no more migration data is available, -errno on failure.
> + */
> +ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
> +				char __user *buf, size_t len)
> +{

what about assert for xe_pm_runtime_suspended ?

> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	return xe_sriov_pf_migration_read(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_data_write() - Write migration data to the VF device.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + * @buf: start address of userspace buffer
> + * @len: requested write size from userspace
> + *
> + * Return: number of bytes that has been successfully written, -errno on failure.
> + */
> +ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
> +				 const char __user *buf, size_t len)
> +{

ditto

> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	return xe_sriov_pf_migration_write(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: migration data size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
> +		return -EINVAL;
> +
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	return xe_sriov_pf_migration_size(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
> diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
> new file mode 100644
> index 0000000000000..bcd7085a81c55
> --- /dev/null
> +++ b/include/drm/intel/xe_sriov_vfio.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VFIO_H_
> +#define _XE_SRIOV_VFIO_H_
> +
> +#include <linux/types.h>
> +
> +struct pci_dev;
> +struct xe_device;
> +
> +struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev);
> +bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
> +int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid);
> +ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
> +				char __user *buf, size_t len);
> +ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
> +				 const char __user *buf, size_t len);
> +ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid);
> +
> +#endif

