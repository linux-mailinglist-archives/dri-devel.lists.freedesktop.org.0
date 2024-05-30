Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DBB8D51F8
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 20:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF2A12B6ED;
	Thu, 30 May 2024 18:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/rs/6s1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C9212B6ED
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717094833; x=1748630833;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hCPvcxdSkifI+wZ1Ki1bg77UFrCQFc9KsiJCm5IeV6c=;
 b=d/rs/6s1ZG1ULDgnSjrH1rdO+DFm5/f1uxFA3ZmvOHW6x7KMqMxAzUbQ
 DXMnp8Suwsqh3vv6v587az9ijGO1w8OJQxgil3gNDPYUTJpMctMPYK2qh
 Ols9uupAmw/wLLF+Y3k2p4MgtRWhm5dCr6mlxZifVNPi8OltUf8CSnBKO
 EjUDmPOeRYs/pPefJO6oFeLNwiMVyG1y5v9IMXv4hhmxWaeElWSOWY2Z0
 B3W2lMJTs4kX8Q76nPsBiOCBZtISCQAkzUxEqV0TR612Jd8e5/pxTzIkx
 PmMNEb0fM23IBxW0Wvqh9vQqkVrINn8h725p9DGttfoSK4vNc5NqL8c3+ A==;
X-CSE-ConnectionGUID: 73fJGtU5TD6szEzznmEtgQ==
X-CSE-MsgGUID: wOC59Fi/RLeDGcBHSpcMBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24169343"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="24169343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 11:47:13 -0700
X-CSE-ConnectionGUID: kNXwV95RRqir64ybwoMlnw==
X-CSE-MsgGUID: Oesse6OlRo6yMAbzGxk00Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40357424"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 11:47:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 11:47:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 11:47:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 11:47:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 11:47:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7aaLmeoVVSNwXGZH82FFWFpF4B3EYgu8D3xXFOddd8v91Ak0b+jk1s0SBdIy2QgXmJHN6/1p9dMseQEv5rcYUIT3jyavUcqL1bq80jCUCt3fWPgR1V4XQ1RqXDs2J2ldUQkRg4xsk3pqhYvPzz0tURwBXbnZJy3AB3DREJ1dpazYEdD6K9hisT8gofPz/WUYpqdvzdZbPJ9wWpzduVDT15IhUwDsAH3cIVPMIduGwr/bvPPIDQf0z2JBcAhClWD4IaVVOLgJgLwTh4Yz2/TAZbUeC7vFK8qwd41qCBP2gEtBD4ncsy4HDAiAuYONGqfCFD0HWvHsKJXRcG5vPmYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSP09q6++Jzv6T66SUftk0DQqLgFoOU0D/vfDbflai0=;
 b=PsSPqvUM0QNSC2Gw9tsv+javvVGodvQ2oE4AVVfIVZWe67GHTqEte9Yi5LXqc2qCQ3WKJe3AMsTOzV8ZT7oLqHl+p3ypKiMTrOLfC7HxAZyTwExmb4/JSKRENRaNrPnU5NsrdFMJNtD0eiYkF0mlrvJrzm3oEw6msNyW9YIgPaHS7DCdhxXIhOcjYWLKO1KmqsCq+ECao85HQjhO8JEMmxTeXXfs+EAllGbVY/Flw3xAL6h7rMg3WRZyTWw8EjVR+acJ+gZsP+px6L/cy+earIBDUcC1biO16/SU8jP0aqHR6mN1nOHnaLn/8SJkJCVeBj+Ixx6tVXxwIQlIOL74Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 18:47:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 18:47:09 +0000
Message-ID: <146d5133-f3be-4411-b020-a177254a65bc@intel.com>
Date: Thu, 30 May 2024 11:47:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/print: Introduce drm_line_printer
To: Jani Nikula <jani.nikula@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>
References: <20240528130622.1152-1-michal.wajdeczko@intel.com>
 <1bf31a4b-fede-4044-8390-abb2b833608d@intel.com> <877cfbivrv.fsf@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <877cfbivrv.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: af23c62b-e528-484a-9c0c-08dc80d8e8f4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3NqQnFKUGVGbTVkVXYyZm5nOElDUWx6MTJxdm84UkNKTDFCc3hDSnM3UlZB?=
 =?utf-8?B?QnlDTzlFWmNlTjR5Y2drNXNtakQzYlgxZlZiMlhmTFZSamdqR3hHS2tjSW9t?=
 =?utf-8?B?RnUwRExyNzhrdXplQkwzejRzYTJ5S3N1aFE2OHVMUktBTG1zMVVXT0Rkeklp?=
 =?utf-8?B?cjJHT0lBNUQ2RUdLT0Y0YnBCU1dQUm5YSExBeGNnaXlJVFZ6a0tNeTlNcmlC?=
 =?utf-8?B?VVZlVTRNQkF6ZnEyOHppeUpOU05mOW1PNjdMYng0Z1hZdzJLSGFaK2RXNi83?=
 =?utf-8?B?bEwvY0xybG85WmFxWnZDTC8yM0p3WWJ4M3pleEpQMnNPSkdqUmhuK0YyeW1t?=
 =?utf-8?B?UjdiTlZJY1RDbDF4M3BqU1dWeTJVeFJjN0VhZlhIajl5T0xJaXdoYVdkbHRn?=
 =?utf-8?B?c1B5Y0tYZVAyK3F3SzBDLzJsMGVHRnlRQk9KYURGYnhoR0EzTDNVRkwzUFBj?=
 =?utf-8?B?L2w1ZkY5NE8zVHREanZMemxrYUNuSUllVklUNmlRaXY3cGs0eG9BQTJnRVE5?=
 =?utf-8?B?ajhoMEprbTVyeEtiUGVGNTB1UUxad3FEbzhsNTFlelJYd01ORm82ZnRaN3Jh?=
 =?utf-8?B?bE5ncFloOXlqVG8zbWtQWHJVOUdLcEVtd0FRaFRjRnFTTnJwbzl6a01iZEhI?=
 =?utf-8?B?ZnhUbkhKbEZReVJJVW84VXFQTTE1bGtTUzIyT2VxY2EyQ21aN29sWGdWUXJN?=
 =?utf-8?B?TXFyMHY4V3oyRldrMGZ6Z3hNcGlUNjRVUnpJcnB3QzFEMVBlNnZXaVUrdFB0?=
 =?utf-8?B?YXpZbVFkdFZLcFBuVzk5MHFWcGJjaEp6VGNVNUg0azBJWi9lcktjVjRyWXZu?=
 =?utf-8?B?bjNRdUhEc1JpQnRzTVkvUWlMNzMrbUtqS282RWZNZ0k3dVFqbmJjK3E3U1ZN?=
 =?utf-8?B?NnZpb2YrRitpTXlwbTVTZ2o0MjE2U09tblFpYjRoNGs3SkhES1pFNkQwbXdI?=
 =?utf-8?B?dzdoL2pUZ3JRVnpvS0RBak0xaDJpQUY4SDFSejgvK3owdEJSL0czVTRrWmRJ?=
 =?utf-8?B?MGUzcXlFZERWNXF6dXczZHhnMStSMDI1bDVlTnhGWXpyU1A3NmN4QzRFT3ZS?=
 =?utf-8?B?WG9HLzE0UFA4cko3T2tOYkEreE9HamVtRWI5cDVJSVAxTWVzdjZzc0VWcWRD?=
 =?utf-8?B?OVFxZ21Dc3dCVjB6MnNEbjJYc2tTVkdrTWV1WE5Td1gyT3lrUys5dWlGUWdh?=
 =?utf-8?B?cS9seHFqNmdEcEw3ZURtV1p4QXNoMkhxZElBWkk4SkNGL0lTVFRMVkpZdDEy?=
 =?utf-8?B?dGVFcDZ2WFk5dVp0UlNyQVVNYXJzc3ZyMXJwVU9uWGd2R0pydDBweHNCUEc3?=
 =?utf-8?B?QlN0d05oTTdoYXlOZDJ4UzYrcmJybVlacElTeXUvZ3k3UnBPMjhrKzlRd2Nx?=
 =?utf-8?B?TXJPOVh5Z25wS3FqdHlRejhaajBuNy91eHNNMWlyU3c2Tm5aT3NYWXNoZUph?=
 =?utf-8?B?QkVySUhyeDNpd3IwenIxbXJQQUI3Y2NuYkVUQXUvOFMyMzZ1Z0kxT2JOVlhV?=
 =?utf-8?B?TkVHY3ZwOGRlUDdJaWhhOEpoOWtad3lQMmRMczcxVVE1TUpjWXBSaFlJR0Ni?=
 =?utf-8?B?ZjJELy9BallnS3hER0hJSVJ3VFlMWVlYU21KSVV2WXN4TnhoMk5zamd1WWRa?=
 =?utf-8?B?OHlIaWdjUkpuT1Z1N2Zyai95cExacjFudE9ENFVDaElkeVUydEc1YnIyYmh1?=
 =?utf-8?B?Sm9vTWRLRm1sOUltUDVOd3JBbGh4MHl0R2pRS3M4V0lEMkFWa0VRdFB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRFanBlNHlTWU1ZREZqZlZ6SUFyWk1QWHJNK0xXSlVFZzhWWVBTcnZQTnJh?=
 =?utf-8?B?ZVAyV0NjRzNGT295OFlUWEFxcGUxWUU5Z2FRelRzdDBmMk9Celo2cVNKOTRi?=
 =?utf-8?B?ZDFHLzkzNHQ0Y1J5S1RodUJGUERZK3ZqRnNMSWFjNzR6UWg1dVloTGhvK1FM?=
 =?utf-8?B?TDFtZm9KWnNOSlhaSUVXSkNDdzQvVS9DcTFQVDFUVDRHaDBpaVQ0WnNpK2hp?=
 =?utf-8?B?M1ZRaVY2QVRSRnZvWWVESnovd3BKVU9ESzJYeENPMlZDbnU3RGNqdDUwVkQy?=
 =?utf-8?B?ckw0cDB1a2ZOb3JTZkpSMWJCc3U5OXRVYW44RjBNRFViczkwK0VuQXRNTEJO?=
 =?utf-8?B?cDNBUXlmRUNOc280clUrYXVUUmkzcEU4NGUxV25IbFl4ekRMdGpraFlTaWtt?=
 =?utf-8?B?Um1vUzFQbE5EYTB3VmptSTg1TytqenFocElVTFhEaHFjbkZBSVJCMlo1cUMv?=
 =?utf-8?B?dzY5WlE1RklIckI3YW1HOHZ5R1ZlZmN1QVRaZlZWWUEwc3lScFRTTmdnM2NL?=
 =?utf-8?B?SjIzTUdzaUdHbW1kMlRocGpoaVhkRWkxanU0UHZMKzQ3RU13b0twYm02S2hw?=
 =?utf-8?B?WXZFUXB6SW95YWpsSHRtdmRTWlB4Z1ZsU2dwNUZFRHErMzhhOVlkRmpFWVhB?=
 =?utf-8?B?c0RyY1pMaTZscWxmNHZwaVIzb1J1N1FXSmlqMU1nM1dnRktsRENZRjZuVnFj?=
 =?utf-8?B?QmpteHVPMmx3NWZ2VXlqTVZZTzVRbkR2Mm9OUnc1bzNLT05oRUlZYnl2bjlN?=
 =?utf-8?B?Q3ZOdS9jSXYwRDBaNGZMREU2eG1PQUIxVGg2dmtJNDJmeFlYSGgwM1RRQkt5?=
 =?utf-8?B?dnpvQmVQY3hiSm03aGhSQkQ5VEphQU9WWFVxQnF0dWhiV0VvRUNBYzBHSHRN?=
 =?utf-8?B?MlNhNytIVU1FWDZRME9BWUZYWC9IaUdDQkdWRW1HSVZSYVMvejAvcWhacDhG?=
 =?utf-8?B?QXZEZHd0Zi9sbnFVV2JHS3dYbXliT24xV21BNEZibkhVTC9JaG1XNER0WG94?=
 =?utf-8?B?OFl2bUxWdnFtckpuS3BCNTZmcGFDRUlmNUFYT0lvUGQrcG5PcnVUMXNGMnhQ?=
 =?utf-8?B?ZHBQTFE5bDc5WW9XVU50RnZndVlYT3dFOWZ0bDJGTmRxeWtjSHVuV1NvRTkv?=
 =?utf-8?B?b2JSZVNVamU5OUNYbFJtT2FTYVdNMmRWc05WVmk4OElTQy95NitJV00rU3Fs?=
 =?utf-8?B?c1NsRWhVbm1Wd2k4Y3FuVWdhTU55NFFIaHlVbTlJMytsSExRcUNUeWJFNStE?=
 =?utf-8?B?ZlNsM0FDVmRpbUhoYlovOU82RHFMQ09vSVFRSEpiT3dCSUl2M2FvVGxmUm5s?=
 =?utf-8?B?aHQwRlJEdG5lWHZxVUQ5bmpsclRjdnFnRGdRejVBU1dHa2JXN2FNQ1g5ZEp0?=
 =?utf-8?B?ODQ5RWRac0NsY3dsTEdpQm5VdkZkZUhKTDBGdWNMcHgvT2lXdUkxaHRlLzZN?=
 =?utf-8?B?cDE1YXpZaUVlM0Z5dUhoa05wNCtSaXpjcVVQTkx3S3Z4a3o2MXQzTHgzd0RW?=
 =?utf-8?B?T21SYWZjMStRYkIwY2w3QzBpMjVIUEpuY1lqNEpoV3B3S3hobVZiSGovdkht?=
 =?utf-8?B?bm8vbVZxVnROOGNHZ05OU09qVUxIMTBXUnBja0R1R05Xck5TRGpZZmM1QmdO?=
 =?utf-8?B?Y0JPa3JoMGFtTjlxWU83VXJRaUxZTEcwUmRpbWR0Z2QySzc4ZDZNaTFnNXBL?=
 =?utf-8?B?SDNKTDJjcHNSTU92dzZLQ3Y2MTNyMmdqQWY0c1RYL1NoZ0xEdGpEaHJYbmVt?=
 =?utf-8?B?TFZXdHN0bXN2NGYzRmI5alZrNUkyakY4b0EyZDZlVEk2UGduLy9xbkhabVFw?=
 =?utf-8?B?YW5pNEcrUTBrMWtYeGI0K0NUQklrQ0V4YjRiVGgxWHA1YlN0eHh2TnZxSWc0?=
 =?utf-8?B?MkFhTkVQUmVPdmZybVdnMWJ4Z3VlYVZhbUF5by9YOTF4YjB5cUQxaVNWcHRX?=
 =?utf-8?B?YlgvK1lxK1o0aUtSVVowSng3TkhwS3VIWVhoaXZPS1Rlb0NZYnR2cm1VaG0y?=
 =?utf-8?B?SlIxTUNpVTJ2V2ROdnEwdjVlVGQvaFlBSHpjRHh4Zk1KN3c2NEx2N3pUUDZo?=
 =?utf-8?B?U0dpQjVjL0dtOGZBOVlIUzkzSmdIL1ZseCtsMmVZYzdUbFJnaUdDenY5bTZO?=
 =?utf-8?B?Z0UzaWoxRXRxSlFJVGNBZ29xM3FqbEtQdGE2QjNqTTdITVJ2ZDRXWHNLYTRC?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af23c62b-e528-484a-9c0c-08dc80d8e8f4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 18:47:09.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQmVNBBERn6IcLGoOQADNCmnyLXLPQtwTgjYAaGdQnkGKORjDvZcBk5eil3ZSiSfGw18mq0hoojULDgwu5g4Rrxa36A2UmYQgLV5hNNWWHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

On 5/30/2024 00:49, Jani Nikula wrote:
> On Wed, 29 May 2024, John Harrison <john.c.harrison@intel.com> wrote:
>> On 5/28/2024 06:06, Michal Wajdeczko wrote:
>>> This drm printer wrapper can be used to increase the robustness of
>>> the captured output generated by any other drm_printer to make sure
>>> we didn't lost any intermediate lines of the output by adding line
>>> numbers to each output line. Helpful for capturing some crash data.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>> v2: don't abuse prefix, use union instead (Jani)
>>>       don't use 'dp' as name, prefer 'p' (Jani)
>>>       add support for unique series identifier (John)
>>> ---
>>>    drivers/gpu/drm/drm_print.c | 14 ++++++++
>>>    include/drm/drm_print.h     | 68 ++++++++++++++++++++++++++++++++++++-
>>>    2 files changed, 81 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
>>> index cf2efb44722c..be9cbebff5b3 100644
>>> --- a/drivers/gpu/drm/drm_print.c
>>> +++ b/drivers/gpu/drm/drm_print.c
>>> @@ -214,6 +214,20 @@ void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>>>    }
>>>    EXPORT_SYMBOL(__drm_printfn_err);
>>>    
>>> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf)
>>> +{
>>> +	unsigned int counter = ++p->line.counter;
>> Wrong units, but see below anyway...
>>
>>> +	const char *prefix = p->prefix ?: "";
>>> +	const char *pad = p->prefix ? " " : "";
>>> +
>>> +	if (p->line.series)
>>> +		drm_printf(p->arg, "%s%s%u.%u: %pV",
>>> +			   prefix, pad, p->line.series, counter, vaf);
>>> +	else
>>> +		drm_printf(p->arg, "%s%s%u: %pV", prefix, pad, counter, vaf);
>>> +}
>>> +EXPORT_SYMBOL(__drm_printfn_line);
>>> +
>>>    /**
>>>     * drm_puts - print a const string to a &drm_printer stream
>>>     * @p: the &drm printer
>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>> index 089950ad8681..f4d9b98d7909 100644
>>> --- a/include/drm/drm_print.h
>>> +++ b/include/drm/drm_print.h
>>> @@ -176,7 +176,13 @@ struct drm_printer {
>>>    	void (*puts)(struct drm_printer *p, const char *str);
>>>    	void *arg;
>>>    	const char *prefix;
>>> -	enum drm_debug_category category;
>>> +	union {
>>> +		enum drm_debug_category category;
>>> +		struct {
>>> +			unsigned short series;
>>> +			unsigned short counter;
>> Any particular reason for using 'short' rather than 'int'? Short is only
>> 16bits right? That might seem huge but a GuC log buffer with 16MB debug
>> log (and minimum sizes for the other sections) when dumped via the
>> original debugfs hexdump mechanism is 1,245,444 lines. That line count
>> goes down a lot when you start using longer lines for the dump, but it
>> is still in the tens of thousands of lines.  So limiting to 16 bits is
>> an overflow just waiting to happen.
>>
>>> +		} line;
>>> +	};
>>>    };
>>>    
>>>    void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf);
>>> @@ -186,6 +192,7 @@ void __drm_puts_seq_file(struct drm_printer *p, const char *str);
>>>    void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
>>>    void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf);
>>>    void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
>>> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf);
>>>    
>>>    __printf(2, 3)
>>>    void drm_printf(struct drm_printer *p, const char *f, ...);
>>> @@ -357,6 +364,65 @@ static inline struct drm_printer drm_err_printer(struct drm_device *drm,
>>>    	return p;
>>>    }
>>>    
>>> +/**
>>> + * drm_line_printer - construct a &drm_printer that prefixes outputs with line numbers
>>> + * @p: the &struct drm_printer which actually generates the output
>>> + * @prefix: optional output prefix, or NULL for no prefix
>>> + * @series: optional unique series identifier, or 0 to omit identifier in the output
>>> + *
>>> + * This printer can be used to increase the robustness of the captured output
>>> + * to make sure we didn't lost any intermediate lines of the output. Helpful
>>> + * while capturing some crash data.
>>> + *
>>> + * Example 1::
>>> + *
>>> + *	void crash_dump(struct drm_device *drm)
>>> + *	{
>>> + *		static unsigned short id;
>>> + *		struct drm_printer p = drm_err_printer(drm, "crash");
>>> + *		struct drm_printer lp = drm_line_printer(&p, "dump", ++id);
>> Is there any benefit or other reason to split the prefix across two
>> separate printers? It seems like a source of confusion. As in, the code
>> will allow a double prefix, there is not much you can do about that
>> because losing the prefix from drm_line_printer would mean no prefix at
>> all when not using drm_err_printer underneath. But why explicitly split
>> the message across both printers in the usage example? This is saying
>> that this is the recommended way to use the interface, but with no
>> explanation of why the split is required or how the split should be done.
> You could have a printer, and then add two separate line counted blocks.
>
> 	struct drm_printer p = drm_err_printer(drm, "parent");
> 	struct drm_printer lp1 = drm_line_printer(&p, "child 1", 0);
>
> 	...
>
> 	struct drm_printer lp2 = drm_line_printer(&p, "child 2", 0);
>
> 	...
>
> p could be defined elsewhere and passed into separate functions which
> each have the line printing. The two prefixes can be useful.
Except you can't have a multi-level prefix if using the info level 
printer as that does not take a prefix. And I'm really not seeing a 
reason why you would want the line count to restart in the middle of a 
single atomic dump operation.

>
>> Also, there is really no specific connection to crashes. The purpose of
>> this is for allowing the dumping of multi-line blocks of data. One use
>> is for debugging crashes. But there are many debug operations that
>> require the same dump and do not involve a crash. And this support is
>> certainly not intended to be used on general end-user GPU hangs. For
>> those, everything should be part of the devcoredump core file that is
>> produced and accessible via sysfs. We absolutely should not be dumping
>> huge data blocks in customer release drivers except in very extreme
>> circumstances.
> A devcoredump implementation could use a drm_printer too?
You mean for reading the devcoredump file from sysfs? Except that the 
whole reason this was started was because Michal absolutely refuses to 
allow line counted output in a sysfs/debugfs file because "it is 
unnecessary and breaks the decoding tools".

>
> Is this only about bikeshedding the example? I'm not sure I get the
> point here.
I would call it getting accurate and understandable documentation.

The existing example is splitting what should be an atomic name "crash 
dump" across two separate line printer objects. That is something that 
is so unrealistic that it implies there is a required reason to break 
the prefix up. Documentation that is ambiguous and confusing is 
potentially worse than no documentation at all.


>
>>> + *
>>> + *		drm_printf(&lp, "foo");
>>> + *		drm_printf(&lp, "bar");
>>> + *	}
>>> + *
>>> + * Above code will print into the dmesg something like::
>>> + *
>>> + *	[ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.1: foo
>>> + *	[ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.2: bar
>>> + *
>>> + * Example 2::
>>> + *
>>> + *	void line_dump(struct device *dev)
>>> + *	{
>>> + *		struct drm_printer p = drm_info_printer(dev);
>>> + *		struct drm_printer lp = drm_line_printer(&p, NULL, 0);
>>> + *
>>> + *		drm_printf(&lp, "foo");
>>> + *		drm_printf(&lp, "bar");
>>> + *	}
>>> + *
>>> + * Above code will print::
>>> + *
>>> + *	[ ] 0000:00:00.0: [drm] 1: foo
>>> + *	[ ] 0000:00:00.0: [drm] 2: bar
>> Not really seeing the point of having two examples listed. The first
>> includes all the optional extras, the second is just repeating with no
>> new information.
> You see how the "series" param behaves?
The second example doesn't have a series parameter. If the only purpose 
is to say "the print of the series value is suppressed if zero" then why 
not just have that one line? Documentation should also be concise.

John.

>
> BR,
> Jani.
>
>> John.
>>
>>> + *
>>> + * RETURNS:
>>> + * The &drm_printer object
>>> + */
>>> +static inline struct drm_printer drm_line_printer(struct drm_printer *p,
>>> +						  const char *prefix,
>>> +						  unsigned short series)
>>> +{
>>> +	struct drm_printer lp = {
>>> +		.printfn = __drm_printfn_line,
>>> +		.arg = p,
>>> +		.prefix = prefix,
>>> +		.line = { .series = series, },
>>> +	};
>>> +	return lp;
>>> +}
>>> +
>>>    /*
>>>     * struct device based logging
>>>     *

