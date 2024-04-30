Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D88B779A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF41810E0B9;
	Tue, 30 Apr 2024 13:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/7l7OD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC1A10E0B9;
 Tue, 30 Apr 2024 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714485198; x=1746021198;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rz4/dvz2nQm/BECk8B5MM0i39+UunZxgFeFIR8efEHA=;
 b=G/7l7OD7SXjbZYEdXEz1FD2fLWXDkRp5x0dx+9nI3NpdV+q2mbhKtBoi
 ZGEWbXY2DdQ2ZOPbSM6i22Vb/Nqv1UR304sVjiKhzFOgBlcWouUXNuxcv
 6LuWDMDZh9OuJj4qVAzDnjH6yGbCVRzgbkBk9Be5kAXx4qjTcawGOEabe
 9IQ63n2+6WUKrm61uUz0bLv0en6tJBlbH/45318ZJqfaK9VFYxy+x1v5K
 yxG1x/jV1vu5rNNGC1X+o1qubCjzUq45XxEhdTgZw6NYtsci9MUUlYHV9
 SU2FzvTpCSZYrO6ueHG/pncnGyRJwF+pDbIIFlfnWzq0PNWvlM1hYoTt3 g==;
X-CSE-ConnectionGUID: Ba9JWNTlRdygNH1xojSMSw==
X-CSE-MsgGUID: aGla/X1rRBaNs2cSu6jzbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10069328"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10069328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:53:17 -0700
X-CSE-ConnectionGUID: ipS3PYXiSmucb28X3z6VXQ==
X-CSE-MsgGUID: V5hDv8ARQzGJbAQx/FW2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="30912224"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 06:53:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:53:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:53:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 06:53:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 06:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Maypj26hLJPUwGXGa2ADDFC7uCDDUK5Us/no40Dg6mNzr2ojvpAro2tRXaOBYZmLy4Wu4PIuLeFdRF8xeZf8Hfuf9B1fnft8Bq0d+OHVV5gFfr22iawp+beSxWVOsm0Us//hVtjr7cPQ/jhzyFYmXvuXkmWzfxMR4U58/NYCMolMCSVZovYehH0rgmNoxl7uXYLdvZJRQDwB/1aMOvdRtbA+3BaKpE/ou3dSE9sqlEaxWjTwZQC3cZIkOd5BLSXLqW0O+oK5p494oOPFUAvTcTHxr5iQ0ELG/ecDsZ8Vda4mQZ4uzKJjHd8Z4UyUhvr/0erbq0xeg58lGT7LdkxBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEQw4VOv6pZmbnatk4gg1nrX/zMBnNIcuK9/+L61r18=;
 b=X+JRT/LIp1FhyiTvcfpHkpD5IwN7LjnFLwonAqa5/5N18m333+NK9wsrnBTpd8yie2z1nVH47iX59m+Sr2duVqUJN1kWVz8On9fKY1fEOUomdltyo3KME55J55iCVNgPdqmq6YAWm046f2wrRfGN5TfBIZDX/8u7gaYQVa45cE7aN3UPsI5/bJ+PH1/+ROjiccZE1EPpeXbctbFmizYAufsL5VbkpEMIrpbJE0/uI+OOvaXiG6+zm6fFEHMMm2s62B1xK3xJ6eQzB/r80NzWoBoa6wlW+LPftPCqM5rMf4ZKO1GmfaHBvEcV5AMgzq2ZbCipxmk9rYEEU4zSZPm/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6624.namprd11.prod.outlook.com (2603:10b6:a03:47a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 13:53:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 13:53:12 +0000
Date: Tue, 30 Apr 2024 08:53:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ttabi@nvidia.com>, <dakr@redhat.com>, <airlied@redhat.com>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>
Subject: Re: [PATCH] nouveau: Add missing break statement
Message-ID: <faewrlmfd6hjhmidbpa2nmepk2sioudmscozgidkq2u74hivh3@fszn4ilyes6r>
References: <20240430131840.742924-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430131840.742924-1-chaitanya.kumar.borah@intel.com>
X-ClientProxiedBy: MW2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:907::48)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 6408f5e5-d48c-45fb-367e-08dc691ce013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2xESUczNEcwTkFwOGxFOUFrd1lwWlpjSHp6NDMycE85S3dUd010OWtsOWsv?=
 =?utf-8?B?Y2UwSENWbDYxaThZRm1iVTh6YzB2eS9vZGErZVp3R2JpcGlObCtHZStsZlEz?=
 =?utf-8?B?VEo5NFlqYVk0bTYrTSs5UXh6YnVGdUsrTUxpeEcwQzNvSnlFa1NYcVBoeGVt?=
 =?utf-8?B?QW1LUk9SamQ0SUxVb3VuSURWUXNlak1ZRm56ZkhmUTZkSjd3VDF5T2FLbm5q?=
 =?utf-8?B?R01kTUJYbWdZQU40RTJvOWVzZi95TnZ1VmRIQVJjRElRY1FhQ3hHaUhVbDkv?=
 =?utf-8?B?aVpsdVErTVdpL21vR2RSRlpjTm5vOFZTbHBQNUtGcUtNYThqNkpjQmhTa0hZ?=
 =?utf-8?B?d3I2bnhjWlZvTytJSHgxNThTZ3ZINHpwQkgrODVEbEpzWGJNSSsva2xTWTVD?=
 =?utf-8?B?QzdVbjY1NDloOXcwMHhJUmlBa1ovNGluQjdlcnRiWmdQK3ZBeWlrdXBmT2lW?=
 =?utf-8?B?eHMwNkVkMFJGSFhyWWF2aHk2UExjczNWSmVZcUxoM2hBcU4rYnVWWExBYXFX?=
 =?utf-8?B?UWJYaVl4OWE4cHhmVEoramVsWXdic3hGOVFVYTFVMFBGMFpmWU83U0VHcjdJ?=
 =?utf-8?B?UHJyTXVLMGxtUlE5eGwxSHNBWktlWlp1eWp1YW5iM3I0dWJSY09Obm1sdlBW?=
 =?utf-8?B?ZmdtVWJ0ZHIwTVVBVWJsN3cvK0pmWXl2eS9sWDViRUxMcXZFcGZsajVsRlhF?=
 =?utf-8?B?c280RTJKUnIzalZkODVUVTRFVE9VWFVxTzA5TDgyTWh5VjN6NEUvdGc5NlhO?=
 =?utf-8?B?djNiRk14Ym5LSVhlME5xcVVGYm9WN2JCcEloMStPL280RE9BdGRKVTA3MnNs?=
 =?utf-8?B?WGdEQXp3T1pWVVI5Y3JrOGhTT0xkRjFjb1plRExrdXJiY0NDbDliajhzd1hj?=
 =?utf-8?B?VjJENjdnQmY2NWN2bnN2MmlIbEQwc1VlYnh6N2RpY09zMzRJZTQ4QmZrQ21Z?=
 =?utf-8?B?dG8vTDdNcTdpOWlxZk5sWkVyVW5lNXFoQ09vL2theUNjSEdYMGduQzdERE9a?=
 =?utf-8?B?d2NxZzVuUWxkbVhCOW5HbzVvTkJ5dFRTUzJ1RmdUL1AzQ3BLWkpES1FxTkJ1?=
 =?utf-8?B?L2FoNHJJZnpRcThySmRqRmNNenFhSFlLeERpa3RMY3hmSnY0NFYrNHZUalhu?=
 =?utf-8?B?QkM1OWdTRFFZY3QxYWQ5UmN4VW1mUSs5ajJaOVJabmJZUlJKZnpNRENsdGUx?=
 =?utf-8?B?UkMxTGkyVlBIZklsTFZrckJSZDRuQXJrR0NBT1BBRXIvRm90dnlSZUlPM1hD?=
 =?utf-8?B?NHRsWnJaNjZTMTZCZVNxYkNBUlBseFhxaFN1Tklqdnp0emR0bGNYS3E1RkdK?=
 =?utf-8?B?TzQvZ2lyUkFoSzVPdTE0dVlISnVxM3ptazJHek1wQ2JCMVZPM1dVR296eGlJ?=
 =?utf-8?B?czFQUm5rWkJsZlFUNWVJeWtqalErSmNVd2d3aWR4ZW9sZFRpcW8yUFkrTUNx?=
 =?utf-8?B?RzlJUzN5MmVDYjBZSUhvanZCeHM5R3lSamVlVWZGNEN4dGY3WmUvYk9UcVJq?=
 =?utf-8?B?OFdpQ2lUWW54aVBQSkFRT2tNRiswUjRlZkMwU09xdjZpcWdNa29DQ05TWWJm?=
 =?utf-8?B?cFhTbWJQdmtoa0dvbThpbzk5N2Nnc05XK0NOQlBVc0V6bHYvTWxEV0dEU0dH?=
 =?utf-8?Q?m6yx9+Lsq+vC+ea/Vn8WaXUVeFdj2FwmX9uVnMDrgQYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3g0R1hvd0cvVXFGeXg5d0lNQk5XNkFtbm0xYWd1MmpkY1ZXL3RhQVRSWi9l?=
 =?utf-8?B?ZyswVURONmdnOUNhUnJaRFNsaDV4eGpvNENMNUJVTXZQNVp2WS80Qk1uc0RY?=
 =?utf-8?B?UWtCZXpsV0dpTitHaFVTL1NlZzZUaGJQN0tpSlZERHV3cnFIUXNqaTFxVk16?=
 =?utf-8?B?bi9KWkRVeHpGbXRiZ3ZvcUtxYmNYMzBOc3lZajgxOEdlL2g4dlg1cHhEZExD?=
 =?utf-8?B?akZGS0NzMEZRTEQvZ2d0SDljaFEyTWdqeVVycHNDbGcwdjJwNTNDMFNCV3NJ?=
 =?utf-8?B?UU9zYWZ4bDVHbnNoSlYxMGhaN0x6b3BRN3dxZGcxL1Jmd05qYXRoWFIxZU9V?=
 =?utf-8?B?TjhYQmZrRTRuNElZSnU1djR6YzE4VmtTVitsYjhDZFJ6U3ZPdGRSVlhLSkF6?=
 =?utf-8?B?cDJtZE1zNTNZSVpiVUd0eHNzUmwxdDZvbnpaY2lhMHYyUnp1cm5RaUc1bFZR?=
 =?utf-8?B?QTRycmxSVXlpWm54M0NaRFRBQXd5R3c1UWE3d1JyWm81S3BpaUxMRUM5WkRL?=
 =?utf-8?B?dWp3bWlleEd1SFVJU1RkN0swUldaSXpMREJoRENyWkcrSzZWOFI1WDhseVZS?=
 =?utf-8?B?c3oxRkhCN25LSFNqRnJXMDF3UjlKQXBXUGFwZk4wWXZKVy96SmREQ3NYb2NT?=
 =?utf-8?B?NVVLWlVvbTREa0hrK1hDOUYxaU1pdjdrUW1IV0ZPYnprMDQyMDE5MlVEREdL?=
 =?utf-8?B?eVhWK2tKVXYxNXpFQUhsNVp3UDdwSW03SUpJRjRCOUJtVHVHbU14NWVkWEtr?=
 =?utf-8?B?SUZiYjNib0VNb1djL2RvQXllc1J3SHVEYTY2UnNTeTlHUGIvb2g5ZE1VZzBa?=
 =?utf-8?B?SHdpbU9uVU1hSjlScFlienBJaEV0SFp2L0pSanJYRGp0WjNaQTRmWWNNSFVr?=
 =?utf-8?B?NDdNQ3NtQVUyYWpzdzVEWGVMR2R6RVB4QXo3OVFaMUxZUENLcjYwbDlFdjJa?=
 =?utf-8?B?OFJ4STVERUF3YzJqcWlNam85empzZ01NZ2VSYThzZmM5dVVQWGRENU1uT0p5?=
 =?utf-8?B?a0tPMFJicnN2T2lnK0tBS0w1RHJRcWNCVnIwMWhGV3hNWGI5aXpnWm1Cc3c1?=
 =?utf-8?B?NUVMODRSYXRsbTBBVlh6dmtTUUxxM3dtM1JSenF4OHVpNjhIK2FtUzZXR3FB?=
 =?utf-8?B?TmVldWhrcURwbDNmQWxiQU82czg4K3p1ZkdYaGVUYjdWR1FUTHZHUzk5RCsv?=
 =?utf-8?B?azV5SFMyOUlFUGRINDVIdndSNExVSnFiSVlnaFhBRkd1RElnYVVWQjhjOE4w?=
 =?utf-8?B?UDRwUHU2NzJva0tieFZFV3BwQjRDSThKTGhmUE9ibSt5bStSWERmYUp6RHR1?=
 =?utf-8?B?UXNTYnI5OGlUQWpIZzQ1cUxFdmdhOVJweW9SR1VONTM2clJjbXRrR2ZZcHc5?=
 =?utf-8?B?ajBlSTBEekEzakc4bFdicHdZWnd3cmZ2ZklLY1BDSWFEVmFOR2Z2dzNKeE9F?=
 =?utf-8?B?Y29hcWpuR1dySDNFR3dyRU9iR0cxdVRIQnNSNUM1REI1KzFreEpzVC9mM1FN?=
 =?utf-8?B?d3hVelIvbnF4TjdKU0VIQ2RWOHVXMUNFcDdBWVF2MllGejhqNzN0ZkY5cGpu?=
 =?utf-8?B?ZkFhRzNoY2gzclptT3dWRkhIaFNDOXEyTmNTbGpGNlZpRloyQlVjVGJEbmZP?=
 =?utf-8?B?a3Nua2RFcHkzQVlXVlRGWHpiRUpOQjRFYUdDUW5rVzZReThORFJSd1U3VDFo?=
 =?utf-8?B?S3lBU1g0V3FLS1ExekduNEQzRTVUVXVtYnVHdVJDK3FMMEdVNUp4R1B2ZTFD?=
 =?utf-8?B?ZVhvekE4eDBLeU11RXZWMm1nWGNYVFR6Z0ppdWo1WUZ0VE5OaityUDhsU2Jv?=
 =?utf-8?B?WFRZYzM1S1R0K2kvRHU5U2s5M0s2NDZYS2lpb3NVWW0wNVkzZDRaelBldUUr?=
 =?utf-8?B?Z1Z2OThSaE8rL1Z3NzRSZ3Q5UmZTTGR0WXVuSkFMVTVmNmEvQnZGdzFQT3ZQ?=
 =?utf-8?B?bExhYVZmK3lDQTR4aVh4WmM3WStRcTZJRTl5RXY2OTNTWWJoYmZJWDhDdjBj?=
 =?utf-8?B?NHBrL1F5ZjFxaGVXV2JNa00xYXphRStwWGZ3WHIzODZKVzc1RnRjK2ZXWWN2?=
 =?utf-8?B?WW9yNDJDMWNCUUhwWTdNaU8yY0ViMjRJbHlhaWFTV0tvUndySUZkMlRuVlp6?=
 =?utf-8?B?UmZqR0tXcDJJbi8wVy9SUnJvUmNDcFVrUlV6ckU0ekZrSzZsL1oyYU1TZmdI?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6408f5e5-d48c-45fb-367e-08dc691ce013
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 13:53:12.0891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jk7X6iI1Ji/WbsPhQm5G4uNUUek/ldgU6eeJxObrMSi7ro7UbyulAPEVMC/V5vpuaSebOsu8mkrBj1uYeTIpBjIyMTEPWWdHVbekVdp2TGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6624
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

On Tue, Apr 30, 2024 at 06:48:40PM GMT, Chaitanya Kumar Borah wrote:
>Add the missing break statement that causes the following build error
>
>	  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
>	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
>	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
>	1266 |   default:
>	      |   ^~~~~~~
>	  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
>	  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
>	  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
>	make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
>	make[7]: *** Waiting for unfinished jobs....
>
>Fixes: b58a0bc904ff ("nouveau: add command-line GSP-RM registry support")
>Closes: https://lore.kernel.org/all/913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com/T/#m3c9acebac754f2e74a85b76c858c093bb1aacaf0

Just found a previous bug report, so we can add here:

Closes: https://lore.kernel.org/all/CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com/


>Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>---
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>index 0b46db5c77b8..63619512e7f6 100644
>--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>@@ -1264,6 +1264,7 @@ static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry
> 			str_offset += reg->vlen;
> 			break;
> 		default:
>+			break;


since reg->type is an enum and we are handling all the values, another
possible approach is to remove the default handling and then the
compiler will warn you of missing cases if built with -Wswitch.

Any of the approaches seem good to me.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 		}
>
> 		i++;
>-- 
>2.25.1
>
