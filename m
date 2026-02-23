Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPzTC2Tym2kI+AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:23:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883AF172161
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981E610E1DD;
	Mon, 23 Feb 2026 06:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXA+QFaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C88B10E1DD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771827808; x=1803363808;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mYCWQHFDhzACQLT4rcDMi9jWDpMKtQMpbhiT2q1ustg=;
 b=kXA+QFaV43uO/Mi+98GvJ5XQ8Cr4Erl4GaaoZqAc4Eq+7qZN+I8mi44r
 ZTN95TKKTEvvZAwmPGHMEEsAvUyifBtGtRp2djs2KV3wkxRYQrWAdmhVk
 WcdEofglnWOkAYEt7ZbXeRu4kRo2TCvPb5CZmVHt+pvcnQxTkCovKa7/G
 StraHG5WtYmzQ1QUMfPeq2+pc+cLeaxupE09fD61Lt8pO4iFDkKSNe7D0
 0B+mzk/OcbWyi26OAMPPoIEoNF7m80Sm7YtUkVtlWqskLVddIRDILx6Es
 /JvfqNkkrUM7yqD6u7e9xOqQpYyKWxagS1N6AEY1GXiFtTXQo0MWzPq1F A==;
X-CSE-ConnectionGUID: /L1NG5QmT4iuaqpZcKK98Q==
X-CSE-MsgGUID: ibaEG6mKRhufiheBXr592Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76427362"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76427362"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:23:25 -0800
X-CSE-ConnectionGUID: bQq81e94TyGjfpsRB4G0sA==
X-CSE-MsgGUID: nqUZPWbTTYSRCFpGXoGoDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213887451"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:23:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 22:23:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 22:23:24 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 22:23:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDX/LDnqMBMMLbock6reyW3GhI6OXTu6uig+Tz2yaurXgKubxui+LEmrPMYxkyzLJuyDhtoheIWq5k0QzBMGxPsVuTrdjYgtlPq+sz0NWpJalFhoZLmxNt9MSjoxDztIDu6KO9ZVIbdwL+Jbis1nsmh/m2t50zMbfghOQ4EYmgeMzZDNcfpONrqOq6gAGxsD6PKsaV2qDLKyXch87swfBVyJeUmDqAJNP7JStalNvHwSBH07pn1hhcFCqr7kYEE+fRwJZ4rwV3tOUAIwPu/rIIDrxHouJYkvqJ5FyUyGpV2u+CFqZgXEZdDWHq69WHlakir3EHAXcWk2t6k9ZydoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkZKNe/y9uqDqk7ESDWbG6RP2VplDNFpgDibXXDMZ1Q=;
 b=qqsWwo3mWOm6JZJIGCRM7a8vsfUfmq4Ky/1+9ClLP6l9XGIBPz+F1wQ+TNkpA2pgqpwDiULSPbida7DvjS7jPQrjQQef1aj0HYLXeiWLKJ95yB2sRG8PHiFo14i79u2EULvZfYjqUMvRC42LmXl6gsva3WkEQQs0WxXwSDsEd8xnY8oNEdF0zGhE8ZPfxUxu6VN2ImU4FT7nUjiuinOUxhv5Uqmv7WRGCU7GUarRlKzAQT0ynuKPxnN1niTMFM8FogDlLMIvTaeN00U2S8opZ8pZeDym28E0BACFXdW+tvvQ07ZwmK3bPhAz2aqchGsuat721jeFd3JplPJRMtCkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Mon, 23 Feb
 2026 06:23:21 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 06:23:21 +0000
Message-ID: <c17088ee-70b0-4ff4-b5ac-b8f9612230ef@intel.com>
Date: Mon, 23 Feb 2026 11:53:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Add kernel-doc for allocator structures
 and flags
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
To: <dri-devel@lists.freedesktop.org>, Arunpravin Paneer Selvam
 <arunpravin.paneerselvam@amd.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>
References: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
 <20260212092527.718455-5-sanjay.kumar.yadav@intel.com>
 <e9df7116-e33e-4571-966e-c5e8b4528165@intel.com>
Content-Language: en-US
In-Reply-To: <e9df7116-e33e-4571-966e-c5e8b4528165@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::6) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: a08555de-4f25-4a1c-a8f9-08de72a40a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUI2VFR2M0xrZXkxVlNGbWU1Z0ZzRGFITDVyc3NKT3ZzVHFkWnpvbjdMemQ5?=
 =?utf-8?B?MDZ3UnloWmN1cUhESktBQ3hnRytBUm55V09uaDZtcVlXcjYrWWdad01oemJH?=
 =?utf-8?B?alNnZmdxc0l1SkFRRkxHUDZzZVFEeW9MZDBES3U5bUk2MmIwT2tscmlGOGxn?=
 =?utf-8?B?dUlKd1Iya1JNTTdWT0NCTFFKWmhDRmd2SEs3U0dxQ2JFcTlDZ2h5NVVZT3FG?=
 =?utf-8?B?Q1ZYbVpqanRyVGViaWdlb0o0RmdlMVY3STlxaE1URzlxaC84Ti9WQU5KRGhr?=
 =?utf-8?B?U0w5NWpLbGpDU2xtc3drUGFidkgzdjM1YWtCR3gzTGx1ejhENzZJakMxQkph?=
 =?utf-8?B?aDFjWGNFMm0rQi9lenMxTmhPMzg0SXdZZ1QvOWdaSjlXMlVaSWc2Z3dubFZY?=
 =?utf-8?B?VTdoYVMrVUdYTWZmQWowVVMvRXZWVE9qZ29oSnM0dUllSWFJT0JpaU4zWWI0?=
 =?utf-8?B?U21Rb0NLZzdTbWwyZ2dXSHdZcHlBT2RxRlN2cHBnMzdNeWh4SHRIbFkwUUU4?=
 =?utf-8?B?OXNaZFhEV01EVmxhK2QrV0JOdjZSSFYvbVkweEZ3QWpTeGhmWFV1VjlPT2dt?=
 =?utf-8?B?cXA2RHVSdmFZSGtWRHdic2Y1UUkwT2V6dC9LYy8yQUhUaFl2czVwOXd1RVJK?=
 =?utf-8?B?d1FnRlBxM3ZZNTJDOXVmdDJvUG15Q1FCcG5NZ0hycTZYRGxFTlpGUzF1UnhH?=
 =?utf-8?B?VWp3aERENGx4VVhTRUErdWdONUJEV3Zka0VuRnI1eHhaeEU4SWQrWW9qOVpI?=
 =?utf-8?B?Um4wQjU2eElBS0pqWkNrYWF4TS95Z2RCYWgxZkt3eVNlR3o5UTlzQXRxV28x?=
 =?utf-8?B?V0VRNjNhMzZtWjRRZjI1ajRUaUtZS1EwcFhlT2tZSGNCbWJYckNkMzAySnUx?=
 =?utf-8?B?QVpyRmU5QkI5cWEwd1NxMFhsRTYwYm5iOXN5UXMwZWdla0xrbVorMU9hZHNB?=
 =?utf-8?B?VVJ5SDV6azFIdnVqY0hpOXBvUXF2UkpHR0JtcVNnV0E2MHNQUW1XYW5mZGNm?=
 =?utf-8?B?TFkvMUtmRkY2N0srdC9GRXh6TmhlOXpzWU9Da2QzdktXeUJ4TWpSSmVHaTlL?=
 =?utf-8?B?Unk3SFJOWkQwNE1MTlZxekZuQWNxSGJsNkJNT0pOdS9qdXZxVDVHTkVXNS8y?=
 =?utf-8?B?RzlhcjlDV3R4SlZzK3kzOXkwSFNRTUxOUkluR1I5dnZNZXVpUFN6MTlrdnRl?=
 =?utf-8?B?VmNXSFB4YjRZSmJFU25HUGRYVlRQVnlhdUJMTHRsMi9SOURKZkJxU0swRzls?=
 =?utf-8?B?QWFpWi85d1E3bXlSajkwbGxGQmZKSzA0Q0FncEtjVnBSRjltTTg3aFRaRm91?=
 =?utf-8?B?aTFlL0hiQ3NlbWJWQWJRRElZZkM4cGpGQllIb2YxWUJzd0JYaGxPRVVSeHBW?=
 =?utf-8?B?eXdpSEVhSHBOeVEzbjdkSVJqZmkxM0Zyd3ZJTnhxV1RXSE9saFV5MjVMbGpu?=
 =?utf-8?B?RUZkbjhsYUhKQ0Q5aUtkQ1o5cjJKZTJzMVplSno5cXJ5UlprS1NEdnhKQllT?=
 =?utf-8?B?eEMwUTZpSC9EMkNXL2IzVitxK1R2QzY3SHBERU15SkdvcWQydGJpdlJGNnda?=
 =?utf-8?B?dHR0bFN4RTB2S0JrV2lTUWFjcXRwbEorZ2pMTGwzb2gxMkhKS1VUbENDWGND?=
 =?utf-8?B?ODVFRmNPTHhHVldxK0d6MlBZSVNZNTZDUXdrYmhoK0dRbXBtdjBNMGIxc1VF?=
 =?utf-8?B?R2pzWHhOWXlqNUw4Wi9YelB1K1QxSG5pS1NxT2ROVjcxTEtaMmVGTzk5K1JQ?=
 =?utf-8?B?OFJKcm1JUjMycm1ydzBkTU1KM2hhRStZbzZlOTQrYjBCa0N5ZEVFcS9RODBY?=
 =?utf-8?B?M25jeElvTkJZbVJIcXNxb1RKREJRQzVZV1VtdlJYejRrUGpDeEwxQVMyUm5G?=
 =?utf-8?B?a0ZGR1BFS2RzSTZmWklQTm1uNjc2Rk5SSEhDdXIxY3h4bkxNR1hSTlM0bEJW?=
 =?utf-8?B?d0QvYTVPMEVOcmtLMFZMRGdjWVREVklWWExNZ0ZPL0lDUE1nWDBLMmRpd3lO?=
 =?utf-8?B?V1dBcDhCeU00Y2pGRTJsUVR5UUVCZ2MzazQvTlZtRldYK0c1ZjgwTngyQU1o?=
 =?utf-8?B?UUE4V00yVWdKRFd5ZkRYU0Z2czhtNVlEdk9CSUZJVkhhUlhDRU1iR1NLNTgr?=
 =?utf-8?Q?K7Ws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkVuR3hReGcyU1pqTnBmckhoK0NRZkpUcG1UVERiVldxd0JWNGc5aTlYaDZU?=
 =?utf-8?B?ZzdiM3Q0Vy91M2ZuK05DQXZabXhaNkFFT0FXVksyNXZ6TzcxVndiTU5JQitW?=
 =?utf-8?B?RTQ4dHBtdTJPL1FIQ2dIUTR1cVFIVVFLc0RNbm9OVXJNZ1JwVkY2aSs3VlVt?=
 =?utf-8?B?aUw0YjNMZDRnekt5dGFyMWQyYVNqbTIxQ3FOaGFGNDlEaDIyQTRnb29lR2k1?=
 =?utf-8?B?VWs0alUwV29RUHlUcnU2NUZqWnFmeVVrYnJuZjE2a3RFRmJBcGNWbXNOTTAz?=
 =?utf-8?B?N2E5NWVRelRMZmd4cjkwcGhUbTB4MVA4VWtxd1FLYUhmL2JUMUtJbW9JMDhC?=
 =?utf-8?B?NGcwTDMvVldXSTQzazFLZ1h2UDdjZmFSY3U4aEpseVU2QXM2TnpkZ2pmek9z?=
 =?utf-8?B?VVdheExiRVNHYXBkWGhZNjI1SUdxNFFIdTdoRTdqSzkvdUQ4d3NsN2w2WkZR?=
 =?utf-8?B?WnhwYXMxMjQ3WDlSTkMvbnlORTh4Y3JOU25oMll2YStzWnpmSTdSc1dpS1ZU?=
 =?utf-8?B?dk5ReENOMU9zNFh1MGIwR2lQa1NxTnVCNkdtejdldUU5SCtXbDZNc0traXlN?=
 =?utf-8?B?U0pnYStnODJTak5KdXQ4aDhoNzV1NG5FR0ZQOGhUS2tHMUI1cU1IMDRkZUxv?=
 =?utf-8?B?YWQ0dk1VU3VDR3RJQVpCb3htMnREeWlZbzZ2NnJ2bTAzdVJsaDVwQzRqTHVG?=
 =?utf-8?B?V3JwdnQxQlNmYWlUQWZPUDA1TW1icytVNit6M0U2RGM4WUd3bytkajFVaDNY?=
 =?utf-8?B?aEZsSFdGcmVzRHhRM1RuSUFNNHlCd0psRzlMcTVVRVA3ZWZpcjZtV2hFVDkx?=
 =?utf-8?B?S3FUclZqUVVrRmlXbUNnMFYva1dUc1Bid0U2MHZEM1kzZCtsMjI2V3I1alBj?=
 =?utf-8?B?bm40TUtLajlTSEt0djVxeUZGV2J1d2lCNndHaDF0alRSdkdQOHlTbWsyNUl1?=
 =?utf-8?B?R0g4K3ZOUTdLNWhRZm90cVR0ZDZDZStKb1UzVFVxS3J2K01DdS9EV3hCNmJj?=
 =?utf-8?B?NWp2eTZMK1FlYW82YzhHbW9pY1dwc2xLN2FmZ241b0RVSzVOR0ZYRlpVNmpC?=
 =?utf-8?B?clBFY3JYYjlwMWpwd202Y0JQM3RjZnEvb1B6bmZmVWJpQlA2VlkyWGtIbUtC?=
 =?utf-8?B?aENaem5wSnVUQ1NaeXFQcHlmVVZ1bll1cUJ0ZElPUDA2TDROOFpQdGliQjdw?=
 =?utf-8?B?ZDNMbWhoSmVSWjhnRTZ0Z1ByNkVQcnNUOWVlSHlEOUpBQXFDcEpRcTdGWXll?=
 =?utf-8?B?eFZvUnV0UVVsNmkvU0JGVHA5dFlsMTlTNnMrTlFUQStvYXoxa0MzdjArMVdq?=
 =?utf-8?B?L0wzVjVTNUxrT2tFVzNvbUxueGFHbENWTVBFRk1sR2h2NTdLMWFKeHRFMENC?=
 =?utf-8?B?ekxqcHFuTGJWeHZHbGtRYTl6R0w5Q1lCMHdrdG5YWGdoaDQzMkwxNldLMXZB?=
 =?utf-8?B?NmZMaUtCcm9xL2h3bVphWUJWUThmUHZNUE1uR2wySFFPRFQxNVNEMW5SS2Fv?=
 =?utf-8?B?UXNFcUZqZTVIRDJONkxnVm80azcwV1V0aUJZTHIyTnBVNGJYajFWaElidEdC?=
 =?utf-8?B?NmVZYVF4eG5wYlU0eEl6VVZ5QjVTaXZudG0rbDR5ZkVrS1dQWUNSTHM3bHh2?=
 =?utf-8?B?TSs2Y1VBTWhEV0VXWnZVZEpUQmx6SGgzUjR0OHFPYnBGd1B3ZkpyVC8vdmY4?=
 =?utf-8?B?aDVnZk1QWVJJM3AraGRhOXZJK1V0MlNTZFZoSHpjenJyOVkzaWlRR0tRdGZ2?=
 =?utf-8?B?Wkw5YjJHVkIzUkxHb0xSaG1vNmNkaGFmV2NTbFBVZXVRREYwUUE3cHIyamdw?=
 =?utf-8?B?OU1NZ0hyMmV1NDBlOExobkRwQjVVcjhjU0V1emkyelpvbEtaL0I2QlhzMFpO?=
 =?utf-8?B?c3RRUlZUQ3lyNzBKc0xSR2pOSmcyWW9zV0pCRllQYmFEUHV6MWRPcE12K0RR?=
 =?utf-8?B?MFI5Q21NRFg5R2JZNGZYV1diWW1VUXl5NC85ZHdZYnU5SVQyakZqUllybCsy?=
 =?utf-8?B?TG9Fb2VNT01XUlJMOXJGVFRtcE5NNG1oYjIwS1pPbDY2SGVsTktkSGp3Z1BT?=
 =?utf-8?B?dHZXbndzQWxIYnAya1lyR3ovQ2R0ai9kejV4UE1OQjhrMFJaWG9BRTJaMjRw?=
 =?utf-8?B?WmhEZUpSOEJmWlBuWnVuSDhydEdleVJNMGZRRUFnWEhBUTIxdjM4bUZpckNF?=
 =?utf-8?B?V3ZVUDNoSHZ2NkdQbWFZdnhxeC9JR2czMjVyZVVtTFA2QzN5NlFhVW5Bc2E0?=
 =?utf-8?B?WXlmU2JnVExNNlhvREsvRkthcmZ0Z3hidnNOUHRaQ3Q0S1pBeUxOV0xiakZp?=
 =?utf-8?B?UXFrYTBkRWhldmFqVG9WQ1J6ejlSVXpNYmNPNXRYY2NhVVh0UlRPU2FIZk5p?=
 =?utf-8?Q?38wghcZd8uKYFFQo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a08555de-4f25-4a1c-a8f9-08de72a40a6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 06:23:21.2597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDgTQ/tYvUHWiUquzW1x4E9j0TntTjIrGznMdtPkJFyEZjB3d2cAVdoAVfqDO5E43Vb+XPXijhKSC3GsFs16m8J2bG5hyL7F6iqfTIIn2fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 883AF172161
X-Rspamd-Action: no action


On 19-02-2026 16:15, Yadav, Sanjay Kumar wrote:
>
> On 12-02-2026 14:55, Sanjay Yadav wrote:
>> Add missing kernel-doc for GPU buddy allocator flags,
>> gpu_buddy_block, and gpu_buddy. The documentation covers block
>> header fields, allocator roots, free trees, and allocation flags
>> such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
>> Private members are marked with kernel-doc private markers
>> and documented with regular comments.
>>
>> No functional changes.
>>
>> v2:
>> - Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index
>>    values (Arun)
>> - Rebased after DRM buddy allocator moved to drivers/gpu/
>> - Updated commit message
>>
>> v3:
>> - Document reserved bits 8:6 in header layout (Arun)
>> - Fix checkpatch warning
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>
> Hi Arun,
>
> Could you please merge this series if its looks fine? Thanks.
Gentle Reminder! Thanks
>
>> ---
>>   include/linux/gpu_buddy.h | 123 +++++++++++++++++++++++++++++++-------
>>   1 file changed, 103 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>> index 07ac65db6d2e..bf2a42256536 100644
>> --- a/include/linux/gpu_buddy.h
>> +++ b/include/linux/gpu_buddy.h
>> @@ -12,11 +12,58 @@
>>   #include <linux/sched.h>
>>   #include <linux/rbtree.h>
>>   +/**
>> + * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address 
>> range
>> + *
>> + * When set, allocation is restricted to the range [start, end) 
>> specified
>> + * in gpu_buddy_alloc_blocks(). Without this flag, start/end are 
>> ignored
>> + * and allocation can use any free space.
>> + */
>>   #define GPU_BUDDY_RANGE_ALLOCATION        BIT(0)
>> +
>> +/**
>> + * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
>> + *
>> + * Allocate starting from high addresses and working down. Useful for
>> + * separating different allocation types (e.g., kernel vs userspace)
>> + * to reduce fragmentation.
>> + */
>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>> +
>> +/**
>> + * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous 
>> blocks
>> + *
>> + * The allocation must be satisfied with a single contiguous block.
>> + * If the requested size cannot be allocated contiguously, the
>> + * allocation fails with -ENOSPC.
>> + */
>>   #define GPU_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>> +
>> +/**
>> + * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
>> + *
>> + * Attempt to allocate from the clear tree first. If insufficient clear
>> + * memory is available, falls back to dirty memory. Useful when the
>> + * caller needs zeroed memory and wants to avoid GPU clear operations.
>> + */
>>   #define GPU_BUDDY_CLEAR_ALLOCATION        BIT(3)
>> +
>> +/**
>> + * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
>> + *
>> + * Used with gpu_buddy_free_list() to indicate that the memory being
>> + * freed has been cleared (zeroed). The blocks will be placed in the
>> + * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
>> + */
>>   #define GPU_BUDDY_CLEARED            BIT(4)
>> +
>> +/**
>> + * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
>> + *
>> + * By default, if an allocation is smaller than the allocated block,
>> + * excess memory is trimmed and returned to the free pool. This flag
>> + * disables trimming, keeping the full power-of-two block size.
>> + */
>>   #define GPU_BUDDY_TRIM_DISABLE            BIT(5)
>>     enum gpu_buddy_free_tree {
>> @@ -28,7 +75,28 @@ enum gpu_buddy_free_tree {
>>   #define for_each_free_tree(tree) \
>>       for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
>>   +/**
>> + * struct gpu_buddy_block - Block within a buddy allocator
>> + *
>> + * Each block in the buddy allocator is represented by this structure.
>> + * Blocks are organized in a binary tree where each parent block can be
>> + * split into two children (left and right buddies). The allocator 
>> manages
>> + * blocks at various orders (power-of-2 sizes) from chunk_size up to 
>> the
>> + * largest contiguous region.
>> + *
>> + * @private: Private data owned by the allocator user (e.g., 
>> driver-specific data)
>> + * @link: List node for user ownership while block is allocated
>> + */
>>   struct gpu_buddy_block {
>> +/* private: */
>> +    /*
>> +     * Header bit layout:
>> +     * - Bits 63:12: block offset within the address space
>> +     * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
>> +     * - Bit 9: clear bit (1 if memory is zeroed)
>> +     * - Bits 8:6: reserved
>> +     * - Bits 5:0: order (log2 of size relative to chunk_size)
>> +     */
>>   #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>>   #define   GPU_BUDDY_ALLOCATED       (1 << 10)
>> @@ -43,7 +111,7 @@ struct gpu_buddy_block {
>>       struct gpu_buddy_block *left;
>>       struct gpu_buddy_block *right;
>>       struct gpu_buddy_block *parent;
>> -
>> +/* public: */
>>       void *private; /* owned by creator */
>>         /*
>> @@ -53,43 +121,58 @@ struct gpu_buddy_block {
>>        * gpu_buddy_free* ownership is given back to the mm.
>>        */
>>       union {
>> +/* private: */
>>           struct rb_node rb;
>> +/* public: */
>>           struct list_head link;
>>       };
>> -
>> +/* private: */
>>       struct list_head tmp_link;
>>   };
>>     /* Order-zero must be at least SZ_4K */
>>   #define GPU_BUDDY_MAX_ORDER (63 - 12)
>>   -/*
>> - * Binary Buddy System.
>> +/**
>> + * struct gpu_buddy - GPU binary buddy allocator
>> + *
>> + * The buddy allocator provides efficient power-of-two memory 
>> allocation
>> + * with fast allocation and free operations. It is commonly used for 
>> GPU
>> + * memory management where allocations can be split into power-of-two
>> + * block sizes.
>>    *
>> - * Locking should be handled by the user, a simple mutex around
>> - * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
>> + * Locking should be handled by the user; a simple mutex around
>> + * gpu_buddy_alloc_blocks() and 
>> gpu_buddy_free_block()/gpu_buddy_free_list()
>> + * should suffice.
>> + *
>> + * @n_roots: Number of root blocks in the roots array.
>> + * @max_order: Maximum block order (log2 of largest block size / 
>> chunk_size).
>> + * @chunk_size: Minimum allocation granularity in bytes. Must be at 
>> least SZ_4K.
>> + * @size: Total size of the address space managed by this allocator 
>> in bytes.
>> + * @avail: Total free space currently available for allocation in 
>> bytes.
>> + * @clear_avail: Free space available in the clear tree (zeroed 
>> memory) in bytes.
>> + *               This is a subset of @avail.
>>    */
>>   struct gpu_buddy {
>> -    /* Maintain a free list for each order. */
>> -    struct rb_root **free_trees;
>> -
>> +/* private: */
>>       /*
>> -     * Maintain explicit binary tree(s) to track the allocation of the
>> -     * address space. This gives us a simple way of finding a buddy 
>> block
>> -     * and performing the potentially recursive merge step when 
>> freeing a
>> -     * block.  Nodes are either allocated or free, in which case 
>> they will
>> -     * also exist on the respective free list.
>> +     * Array of red-black trees for free block management.
>> +     * Indexed as free_trees[clear/dirty][order] where:
>> +     * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
>> +     * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
>> +     * Each tree holds free blocks of the corresponding order.
>>        */
>> -    struct gpu_buddy_block **roots;
>> -
>> +    struct rb_root **free_trees;
>>       /*
>> -     * Anything from here is public, and remains static for the 
>> lifetime of
>> -     * the mm. Everything above is considered do-not-touch.
>> +     * Array of root blocks representing the top-level blocks of the
>> +     * binary tree(s). Multiple roots exist when the total size is not
>> +     * a power of two, with each root being the largest power-of-two
>> +     * that fits in the remaining space.
>>        */
>> +    struct gpu_buddy_block **roots;
>> +/* public: */
>>       unsigned int n_roots;
>>       unsigned int max_order;
>> -
>> -    /* Must be at least SZ_4K */
>>       u64 chunk_size;
>>       u64 size;
>>       u64 avail;
