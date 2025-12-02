Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F5DC9A74A
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1622B10E550;
	Tue,  2 Dec 2025 07:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d17VYmRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F0A10E550;
 Tue,  2 Dec 2025 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764660743; x=1796196743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GfuFghHtAcUfNt0YdiKNWrp3rLFFR6ZbAeDIGdaZkoM=;
 b=d17VYmRpmcb4uWv38W/k+iyy8J1Th8ZyWK6q4Rt4G4vM68lCVyqzp6yv
 9TeUOCUGKlE9DUjgo1OIVS+oZHkBI4tYhrhOf8S/ui7xihxyJlbqcYqPl
 zG+GTUcMRFtdkJdm05qXvMF3QiDjol33xTK5AMwTUxkupDOElCNz7+q5/
 X9i8pzevQzeNpu3lV9rhI6xyRxebcCuKdbBd9gyxte+fc4ny/MBIzNBVP
 KOKOkdgoeFF5/A3PPlYwE5ZVOHzPyI09FaJVBlO2ZoOxuPe/9JFfqtii9
 aOxVyIemSM7Zr1yjQUAndTw75MPHhP0gs5IR3YOJgRezdDZwjGxxDGkvb Q==;
X-CSE-ConnectionGUID: 9A94schoTRW/4/rbF/wxIQ==
X-CSE-MsgGUID: 1NvfJJYYScKlmluKm1HSUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66331035"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66331035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:32:13 -0800
X-CSE-ConnectionGUID: AQY5faOxSqmrUDT8a3Z5YA==
X-CSE-MsgGUID: yGh12r8tQZCrMG9E5tx8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194131653"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:32:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:32:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:32:12 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:32:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKNdaXzRHr3GJAJfSf501iEu87wVWsxinaJqk3HqxsZPW2joLhR+yWR0quhBsyZw7/yILwoiYf5UGBdoOc4TOejclophCmhTQXCOGgUPq5ykC+HnHXAdor9TGFj4wnNmIZ41XOTG9g9NuKjPh7isgYb2FbRrXVffnlOlMSYMAumGNBtZQyifHJxSBvD2YXDesd66k2wskhxM6/rj0nMnx0tMduGP4EKfcg1G0u4zIikBBaamS3Y/agKKuNLFhh6RhEKH7ehCdqkRzf0aOxMibA2S6gCXf9X5uw/zfMuGk0RFXsB4LaoNrLepmLDhwbLX/rO4vdSM8HPWKp5bWguFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOmI4Kptm+YUmJxLFi5C3HQOrrvP77sYvUqrLZ079LY=;
 b=MstzvldfL1n7pzE+uI0dgzGCVWulWk3dROWDYNL7jvyznAODPuLNSBWBw/Gc+C7fQVGywkI5o/jMIj3riVkupw8Ndh4pbFb7515P4DD+vIGo3MFfmMaXPU2LygCMQrOxPTQsRXFPnUDyl4jkyPY0ME0MbNGVU/lVZDMfaTH+rkOeraucMf3rM5DaT+N6GRSjRhnT2CLBZm2eUSq1DwL5W2cLua9iWAb2YgzqbV99faz3bE8gC3twNEZE4jTMn35fwh+CMAvICQaPwL6qRwVknQmfn4e5QQcFtmpJtNqpauj70IGaqm2LrdyrR36XQlsqeCbj+XuLt1zQCP68jhCuwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:32:04 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:32:04 +0000
Date: Mon, 1 Dec 2025 23:31:57 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 9/9] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <aS6V7cdFb7/sbG3S@soc-5CG1426VCC.clients.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-10-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251201183954.852637-10-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0263.namprd04.prod.outlook.com
 (2603:10b6:303:88::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 95152de1-05c2-4738-ba1f-08de3174e3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmM2azR6YzFUc2hkTStEV0ZnMFV5S1BQMTRtY3ZEK2J5Rm9wRDZFbzZKRElS?=
 =?utf-8?B?Q3ZHa1J0RndLc0xnYkVxbkNKVG9JdFZtRmFSM3dqSVQ1dUx1Wmd5aTZJd3hU?=
 =?utf-8?B?QzJqRnR4T0hkMDRFUFBXTXZ5ZVhZd0tuZ256NldHK1ZjN2RZakVCVmVja3Nv?=
 =?utf-8?B?QWt1MWVoRmNPQll5QW5JNHpqc3diS09ISlhDNjI3d01CNWkxek1HTHFqMThJ?=
 =?utf-8?B?cmpOaU9DMG5HbU44ZmtWZ3lHdFJHTlp5eXZzYjZGQitoWUt3YlVLOTE5cy9V?=
 =?utf-8?B?M0pncWdHY2FmYWxIRGZoR3k4d2xUamFoVCttVG1lRWpDOXJsUmpWVU15TjBl?=
 =?utf-8?B?UFhyMkpEbWVGTkJTdkZnbjdhRThrRkhOUytITmZUdGxGV2ZyMFc0c1VDdEV3?=
 =?utf-8?B?K09KbXpVNURmejY2Zk0yNGZ5emU5RU1pVzk1WkJZM3BHR0ZZTGdDQTRvOHJG?=
 =?utf-8?B?bUs1b3dSOUJCWUorU0R2MHYrcE9QODNEYXk0OWtGeXlOR1YxVnFVSkliRFNa?=
 =?utf-8?B?UnZXRnJlaWhnNE1CL0Jocy9mcFNnU0JxTEZualR2L1B6R1VXN0FjQlIxQkdM?=
 =?utf-8?B?TWFubDY0TVAvQ01jYlJkRks3UFdDVm1GanJsSERoaUpoOCtibVMrNjZzbXEr?=
 =?utf-8?B?MmpENU1heldXZWt0ODFvc2dackZySU1PR0NFQ0Njcng0Nld2Wnd2dldMaXE1?=
 =?utf-8?B?ZXpESzQ1UWpETm16a0FYaEVFVEs2TnRnaCsvMFdVZXcrTDNzNGM0UUpldFFx?=
 =?utf-8?B?ejMwSndQMzN2OVArOElxMmFPTHZsZk9EMGlQV0ZhS0dXdkFpMFhwc3lGK1F2?=
 =?utf-8?B?OXVtOHRaTzgrL3p3RGFaV1UzVjJaMFh4Yk5hRjJYMmlTajRnMzJaSFh5cElN?=
 =?utf-8?B?eGNnYmc0YVBNaG5VVDNGMVo1RVJhd1ZnRE9NajMxNVFuL1JBVk1GQWxFUjNQ?=
 =?utf-8?B?ejVsYnUreE9sQWxDRmxBQlVwV3pxeDViblBGK0ZZTmlNNktZa0FaSEgwM01I?=
 =?utf-8?B?OVRIUks1amUrY01YNHljWFI4NlNsTjZNcFZEcGFWMW55WXNPR2J3bzZXZ01j?=
 =?utf-8?B?YTd1TFF6R29tVnA0MXU1ZEZtRUpHejVHZ0Y4M0RtWVd4RTJ1OEw4WW5lWkxP?=
 =?utf-8?B?Z2pFUmgyTUhZLzVFRWtRdllMcmJRUGlIaFg1Z3YzT2lCVldQZnUvNDVMcUsv?=
 =?utf-8?B?dE9TdmJwN1RvOFlwTVgranZsKytUMUw2OXlnVWgvK2VKZFU1eklFU2FyOVdq?=
 =?utf-8?B?enZjalJweFBlWnZ3ajJLaHhBaWM0aWtQVjNDZkk2TG5vUmZwZ0xFU0h6MlF4?=
 =?utf-8?B?elJzeFpCN1h3N0xYd2NYaUpsYkFyejBKbTd3b3hnVitTeG5sdDNZYWYrL0N1?=
 =?utf-8?B?SERZWVBmSTYxcHAzL2gvdTcyRlhyejdzb2JSMXd0ZzlSRm83Zk1TR2ZsSm1v?=
 =?utf-8?B?ZnYvckhnMG41ZU1RSzdvd3JPMUlLNXlnNUFDYkFpd0tBY2hVMEkySDJDaHBN?=
 =?utf-8?B?U3ozSGZVVS9HSmZnWk52U3UvMjhlL242WHFBY3laOXhKdkNWM1R2VFBnd1g3?=
 =?utf-8?B?TEFRQ29CS0NiY3BwcGo0UndBOUhpejFyWWRXb0dtTzRsbTdMaHRpSVpUTXh4?=
 =?utf-8?B?alZCeXNkWGdXM05CVy82RDhvTTdEdmhtcitiL3d6dlpYc2l4K0p1cEx6Z2J1?=
 =?utf-8?B?NWNTczMrM1FOZWtGLzVqdFptVWphWmJpZFM2VFc1S1V1UlkvRmtZRkE4TkhY?=
 =?utf-8?B?WDRSZ05OWm5mdVRuci9OT3hyTlRCL3JNcndMMSt0QXVpNXNuVURvb0hGeFVi?=
 =?utf-8?B?MDE5dTA2aktqUWZlcUdBcVpVWEpwTCtMOGpFTXZOVTZ3WU01Kzg1MlJxcmxW?=
 =?utf-8?B?bllKRE5ZVHVCZUJQUnhDWG43NzY5ZWVGZU9jQnZlYjhENHhBQXVSRTByaGV2?=
 =?utf-8?Q?VLOXkiLKxT20x5TbnxlUH/xTrNRoF9Gx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjdFZ3RBV3hGRnpZMHpyUUUwSGM1MUlOS3lZMWhKNXZrN2ZrM1BSK2VhZXly?=
 =?utf-8?B?OFZ4UWtYMnV4VStkSHZkVE5NOWhzdW5BWTJDMWkvYmYwOTBuWUt2dHVIUWh0?=
 =?utf-8?B?NWRBNXpGNkZrSzhCRk1YRXBRbG1KS1ZWeVBGQ3ptWXQ5SytWRVFpLzBQUDVn?=
 =?utf-8?B?SGNpTDFqTkF5NXVHN0Y2MHh2bjFvY1ZHNlJGaXJmbkZuZzc1VkwyVllyTjNM?=
 =?utf-8?B?RVM1TjhET0tobUxCeWp5WDF4WVQrY2VXSXlzUC9zSFl0eHE2ZjlVZXBtM0d4?=
 =?utf-8?B?NGdFSFZ6N1dCRWhvRmE4UTBoTjFoT2pMV3AxaERaS2RyMnorYkxhWVYvVUZI?=
 =?utf-8?B?bDFTL0hRdHZmZFVxQ0RXUmlwYU9FbHZkNUN0VW5tRXVjbmEvczV2ME8yNFdY?=
 =?utf-8?B?RnhmOG81azdUdkpMUVRyMVh5QmNNbTVTcVowRGIrYk1EYm1EVXR2TVZGSjNm?=
 =?utf-8?B?a2NVcXVYSmR1SzEyMm85RU5wS0g5TVQ3eVcwMFpqWGNzNlh5elkxcm5qVkw0?=
 =?utf-8?B?ZEU2b2wxZG1vMlRGQ09nV2lldVp2NW42QlFBWUJwTDVIeVR3L3BSTXVHRjY3?=
 =?utf-8?B?NHF2ZzFUUHYxanJ1Mjc2MTRPaTQydkw5a3ZWWG9XTTcwSDd2SWdlRmZKTTJk?=
 =?utf-8?B?NnN4SzVLendMNjM2YWtteVpreHhTZVhEeDNDV29WZytoU2gwaWNTdmtHWWJB?=
 =?utf-8?B?VnhsQUlTNy9ocmQ4MlpLMFFUNjVQckVtaEpwLzJnNnBrUnFBUDgyb01mYmZ1?=
 =?utf-8?B?Zkdnd0JLZnlrUHNoamQ2UkZwMUVNckh0cTNkQUYzMXp2RVFiM051eUNHQ1ZQ?=
 =?utf-8?B?TmxBbjNLa1VTN3dZNDdXbVZReEtnMHhEa3Z0OEIvd1NESjVxYVRUck5TZU1V?=
 =?utf-8?B?dGVQZUZGeFhLQVRoenphSU1BdW1ReEs3UjVUZWxRZUdjeEp6eWZZSWNGdnZK?=
 =?utf-8?B?VmJFRWVMazJFS3p3ejRDOURmTzZhcW1mV21kMXBzMFUrZnozZExKRnZPdmFX?=
 =?utf-8?B?TURCS29KTkhQeE9FQ3JDV2ptTUk0ME9GY3hUQzZKOE90SXI5V1V1UUd4WEhR?=
 =?utf-8?B?eFJSZURFL0RVaWtaTzhUd1lEWEZGTFl5QW9ZSnJjTm5rQ1JsUEhicENBb3E0?=
 =?utf-8?B?eVBSMUd2c2pyMXZXQjZpMkgvMWpNTm45MVJ4ZllFdzZwVGlPV2QvRVhFQnZE?=
 =?utf-8?B?bGZwYmtvTzgvdk5QTjRDVE1hd3A5dThldWZHU2pvTHhHdU1YNGFmRE5XRjMv?=
 =?utf-8?B?NS8rMmxPMWdOcUhudzZka2tqWGNNWHNESklUTWtsaFpRczQ1VktyZFpWN1NH?=
 =?utf-8?B?MnBvSHNzNzQ4bWdqWGtBd0ZESjY5djZOendxdzFjVzZwcjRQbUhxSVJCb2VW?=
 =?utf-8?B?eDdKbTJULzA4SkVneWpMOTNNeWJyVWNDZVBUNzJoVEJ3cllQMWJUdXZOM1NQ?=
 =?utf-8?B?S0pud2FIRE9zNGlNRzdjQlJuZ0ZUK2FKOVFwWXJEbmZHNlM3K3RNRGM1anF5?=
 =?utf-8?B?Wmo4azNPZVduNDU1bzVTa3h6ajVPZnBpN3FqUG5XQk9lVWtGMXZUcklqcHAv?=
 =?utf-8?B?dnhOOTdoSitxTTdVN084T3VUWk8wb2RFTy8zSWp1VVB0UEY2UGVxckVvOHdI?=
 =?utf-8?B?cklIYjBoTGVlaERnK0RBa2ZjanRKbStTSjlWL1ZKZHE1d2NLcWN2UTcrcktz?=
 =?utf-8?B?YWRmYysrT0NlVzdoOWU0SW0zRFc2VmtJN1VhRXpvN0I1clFoSnNEaUdodjJk?=
 =?utf-8?B?bHp5bFNRZ1E1SHFublVHYkxZWU9vcTFmMXQxNFpDckxzVVhVT3M0YzVxdFFC?=
 =?utf-8?B?cDhEVHF1cWRKUHVydjFXS3ZLUElhaFgrb0NLc0ZKaE5RRkVFRGN2alVwckdO?=
 =?utf-8?B?RVdoVDZjUTlGQ0pTM3VxNFBRdlNUVXRDSkNxVDdVS1NxRjZNQ09ZSUcxdGpT?=
 =?utf-8?B?dkZjTzQ1R2JYK3NacVJHaFVWWHNXd2RXM3ViTWNZUGdHZ3Q0ZjNkeE1qRmtS?=
 =?utf-8?B?N2JpRzlwNjJYa0lsdFVsWkhnRnMrYlZ1S2RCUjgzbjRscndpT2cwMHExcWFQ?=
 =?utf-8?B?T3loUkNkaCtxQjJWVGQ5bUNLTm03aGdSZGU2eDBxbjMrbW5mR2RXK3BjR2tE?=
 =?utf-8?B?Z2JORVd5S1VpQUxmWXV6azVSeXpMOGo2UWh0eXVvOHRWRWVRUzNxYVY5WEdO?=
 =?utf-8?Q?X0LYZeU/jU8T8Q6TOVnE7yg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95152de1-05c2-4738-ba1f-08de3174e3a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:32:03.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chTyzBBNMDYY8KpMDz/nwnzQCFKJVZ1woghJSlwTHbzuHj2J+mVJ2QcfEiY/xP60EDEOROsOWVE4vDcbqXZyAesTBXZjSwIMixIlsA8wYZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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

On Mon, Dec 01, 2025 at 10:39:54AM -0800, Matthew Brost wrote:
>We now have proper infrastructure to accurately check the LRC timestamp
>without toggling the scheduling state for non-VFs. For VFs, it is still
>possible to get an inaccurate view if the context is on hardware. We
>guard against free-running contexts on VFs by banning jobs whose
>timestamps are not moving. In addition, VFs have a timeslice quantum
>that naturally triggers context switches when more than one VF is
>running, thus updating the LRC timestamp.

I guess some workloads are configured to just keep running on VFs 
without switching. I am assuming they are classified as Long Running and 
are not affected by TDR. If so, the timeouts should still work 
reasonably on a VF considering switching is usually in milliseconds and 
timeouts are much larger.

>
>For multi-queue, it is desirable to avoid scheduling toggling in the TDR
>because this scheduling state is shared among many queues. Furthermore,
>this change simplifies the GuC state machine. The trade-off for VF cases
>seems worthwhile.
>
>v5:
> - Add xe_lrc_timestamp helper (Umesh)
>v6:
> - Reduce number of tries on stuck timestamp (VF testing)
> - Convert job timestamp save to a memory copy (VF testing)
>v7:
> - Save ctx timestamp to LRC when start VF job (VF testing)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c      | 97 ++++++-------------------
> drivers/gpu/drm/xe/xe_lrc.c             | 42 +++++++----
> drivers/gpu/drm/xe/xe_lrc.h             |  3 +-
> drivers/gpu/drm/xe/xe_ring_ops.c        | 25 +++++--
> drivers/gpu/drm/xe/xe_sched_job.c       |  1 +
> drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
> 6 files changed, 76 insertions(+), 94 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 8190f2afbaed..dc4bf3126450 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>-#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
>
> static bool exec_queue_registered(struct xe_exec_queue *q)
> {
>@@ -202,21 +200,6 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> 	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> }
>
>-static bool exec_queue_check_timeout(struct xe_exec_queue *q)
>-{
>-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
>-}
>-
>-static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
>-{
>-	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>-}
>-
>-static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
>-{
>-	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>-}
>-
> static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> {
> 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>@@ -232,21 +215,6 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> }
>
>-static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>-{
>-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
>-}
>-
>-static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>-{
>-	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
>-}
>-
>-static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>-{
>-	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
>-}
>-
> static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> {
> 	return (atomic_read(&q->guc->state) &
>@@ -1006,7 +974,16 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> 		return xe_sched_invalidate_job(job, 2);
> 	}
>
>-	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
>+	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
>+	if (ctx_timestamp == job->sample_timestamp) {
>+		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
>+			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>+			   q->guc->id);
>+
>+		return xe_sched_invalidate_job(job, 0);
>+	}
>+
>+	job->sample_timestamp = ctx_timestamp;
> 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>
> 	/*
>@@ -1132,16 +1109,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	}
>
> 	/*
>-	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
>-	 * modify scheduling state to read timestamp. We could read the
>-	 * timestamp from a register to accumulate current running time but this
>-	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
>-	 * genuine timeouts.
>+	 * Check if job is actually timed out, if so restart job execution and TDR
> 	 */
>+	if (!skip_timeout_check && !check_timeout(q, job))
>+		goto rearm;
>+
> 	if (!exec_queue_killed(q))
> 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>
>-	/* Engine state now stable, disable scheduling to check timestamp */
>+	set_exec_queue_banned(q);
>+
>+	/* Kick job / queue off hardware */
> 	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
> 		int ret;
>
>@@ -1163,13 +1141,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			if (!ret || xe_guc_read_stopped(guc))
> 				goto trigger_reset;
>
>-			/*
>-			 * Flag communicates to G2H handler that schedule
>-			 * disable originated from a timeout check. The G2H then
>-			 * avoid triggering cleanup or deregistering the exec
>-			 * queue.
>-			 */
>-			set_exec_queue_check_timeout(q);
> 			disable_scheduling(q, skip_timeout_check);
> 		}
>
>@@ -1198,22 +1169,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			xe_devcoredump(q, job,
> 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> 				       q->guc->id, ret, xe_guc_read_stopped(guc));
>-			set_exec_queue_banned(q);
> 			xe_gt_reset_async(q->gt);
> 			xe_sched_tdr_queue_imm(sched);
> 			goto rearm;
> 		}
> 	}
>
>-	/*
>-	 * Check if job is actually timed out, if so restart job execution and TDR
>-	 */
>-	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
>-	    !exec_queue_reset(q) && exec_queue_registered(q)) {
>-		clear_exec_queue_check_timeout(q);
>-		goto sched_enable;
>-	}
>-
> 	if (q->vm && q->vm->xef) {
> 		process_name = q->vm->xef->process_name;
> 		pid = q->vm->xef->pid;
>@@ -1244,14 +1205,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> 			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> 		if (!xe_sched_invalidate_job(job, 2)) {
>-			clear_exec_queue_check_timeout(q);
> 			xe_gt_reset_async(q->gt);
> 			goto rearm;
> 		}
> 	}
>
>-	set_exec_queue_banned(q);
>-
> 	/* Mark all outstanding jobs as bad, thus completing them */
> 	xe_sched_job_set_error(job, err);
> 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
>@@ -1266,9 +1224,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	 */
> 	return DRM_GPU_SCHED_STAT_NO_HANG;
>
>-sched_enable:
>-	set_exec_queue_pending_tdr_exit(q);
>-	enable_scheduling(q);
> rearm:
> 	/*
> 	 * XXX: Ideally want to adjust timeout based on current execution time
>@@ -1898,8 +1853,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 			  q->guc->id);
> 	}
>
>-	if (pending_enable && !pending_resume &&
>-	    !exec_queue_pending_tdr_exit(q)) {
>+	if (pending_enable && !pending_resume) {
> 		clear_exec_queue_registered(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> 			  q->guc->id);
>@@ -1908,7 +1862,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 	if (pending_enable) {
> 		clear_exec_queue_enabled(q);
> 		clear_exec_queue_pending_resume(q);
>-		clear_exec_queue_pending_tdr_exit(q);
> 		clear_exec_queue_pending_enable(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
> 			  q->guc->id);
>@@ -1934,7 +1887,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 		if (!pending_enable)
> 			set_exec_queue_enabled(q);
> 		clear_exec_queue_pending_disable(q);
>-		clear_exec_queue_check_timeout(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
> 			  q->guc->id);
> 	}
>@@ -2308,13 +2260,10 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>
> 		q->guc->resume_time = ktime_get();
> 		clear_exec_queue_pending_resume(q);
>-		clear_exec_queue_pending_tdr_exit(q);
> 		clear_exec_queue_pending_enable(q);
> 		smp_wmb();
> 		wake_up_all(&guc->ct.wq);
> 	} else {
>-		bool check_timeout = exec_queue_check_timeout(q);
>-
> 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>
>@@ -2322,11 +2271,11 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> 			suspend_fence_signal(q);
> 			clear_exec_queue_pending_disable(q);
> 		} else {
>-			if (exec_queue_banned(q) || check_timeout) {
>+			if (exec_queue_banned(q)) {
> 				smp_wmb();
> 				wake_up_all(&guc->ct.wq);
> 			}
>-			if (!check_timeout && exec_queue_destroyed(q)) {
>+			if (exec_queue_destroyed(q)) {
> 				/*
> 				 * Make sure to clear the pending_disable only
> 				 * after sampling the destroyed state. We want
>@@ -2436,7 +2385,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	 * guc_exec_queue_timedout_job.
> 	 */
> 	set_exec_queue_reset(q);
>-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>+	if (!exec_queue_banned(q))
> 		xe_guc_exec_queue_trigger_cleanup(q);
>
> 	return 0;
>@@ -2517,7 +2466,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>
> 	/* Treat the same as engine reset */
> 	set_exec_queue_reset(q);
>-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>+	if (!exec_queue_banned(q))
> 		xe_guc_exec_queue_trigger_cleanup(q);
>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 166353455f8f..38b0c536f6fb 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -852,7 +852,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
>  *
>  * Returns: ctx timestamp value
>  */
>-u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>+static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> {
> 	struct xe_device *xe = lrc_to_xe(lrc);
> 	struct iosys_map map;
>@@ -2380,35 +2380,31 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> }
>
> /**
>- * xe_lrc_update_timestamp() - Update ctx timestamp
>+ * xe_lrc_timestamp() - Current ctx timestamp
>  * @lrc: Pointer to the lrc.
>- * @old_ts: Old timestamp value
>  *
>- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>- * update saved value. With support for active contexts, the calculation may be
>- * slightly racy, so follow a read-again logic to ensure that the context is
>- * still active before returning the right timestamp.
>+ * Return latest ctx timestamp. With support for active contexts, the
>+ * calculation may bb slightly racy, so follow a read-again logic to ensure that
>+ * the context is still active before returning the right timestamp.
>  *
>  * Returns: New ctx timestamp value
>  */
>-u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> {
>-	u64 lrc_ts, reg_ts;
>+	u64 lrc_ts, reg_ts, new_ts;
> 	u32 engine_id;
>
>-	*old_ts = lrc->ctx_timestamp;
>-
> 	lrc_ts = xe_lrc_ctx_timestamp(lrc);
> 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> 	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
>-		lrc->ctx_timestamp = lrc_ts;
>+		new_ts = lrc_ts;
> 		goto done;
> 	}
>
> 	if (lrc_ts == CONTEXT_ACTIVE) {
> 		engine_id = xe_lrc_engine_id(lrc);
> 		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
>-			lrc->ctx_timestamp = reg_ts;
>+			new_ts = reg_ts;
>
> 		/* read lrc again to ensure context is still active */
> 		lrc_ts = xe_lrc_ctx_timestamp(lrc);
>@@ -2419,9 +2415,27 @@ u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> 	 * be a separate if condition.
> 	 */
> 	if (lrc_ts != CONTEXT_ACTIVE)
>-		lrc->ctx_timestamp = lrc_ts;
>+		new_ts = lrc_ts;
>
> done:
>+	return new_ts;
>+}
>+
>+/**
>+ * xe_lrc_update_timestamp() - Update ctx timestamp
>+ * @lrc: Pointer to the lrc.
>+ * @old_ts: Old timestamp value
>+ *
>+ * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>+ * update saved value.
>+ *
>+ * Returns: New ctx timestamp value
>+ */
>+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->ctx_timestamp;
>+	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>+
> 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>
> 	return lrc->ctx_timestamp;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index a32472b92242..93c1234e2706 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -142,7 +142,6 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>
> u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
>-u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
> int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>@@ -162,4 +161,6 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>  */
> u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
>
>+u64 xe_lrc_timestamp(struct xe_lrc *lrc);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index ac0c6dcffe15..3dacfc2da75c 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -233,13 +233,26 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
> 	return 0;
> }
>
>-static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>+static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
>+			       u32 *dw, int i)
> {
> 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> 	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
> 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> 	dw[i++] = 0;
>
>+	/*
>+	 * Ensure CTX timestamp >= Job timestamp during VF sampling to avoid
>+	 * arithmetic wraparound in TDR.
>+	 */
>+	if (IS_SRIOV_VF(xe)) {
>+		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
>+			MI_SRM_ADD_CS_OFFSET;
>+		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>+		dw[i++] = 0;
>+	}

Is this change for a different issue OR is it the same issue that is 
fixed in patch 8?

otherwise, LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>+
> 	return i;
> }
>
>@@ -253,7 +266,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>
> 	*head = lrc->ring.tail;
>
>-	i = emit_copy_timestamp(lrc, dw, i);
>+	i = emit_copy_timestamp(gt_to_xe(gt), lrc, dw, i);
>
> 	if (job->ring_ops_flush_tlb) {
> 		dw[i++] = preparser_disable(true);
>@@ -308,7 +321,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>
> 	*head = lrc->ring.tail;
>
>-	i = emit_copy_timestamp(lrc, dw, i);
>+	i = emit_copy_timestamp(xe, lrc, dw, i);
>
> 	dw[i++] = preparser_disable(true);
>
>@@ -362,7 +375,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>
> 	*head = lrc->ring.tail;
>
>-	i = emit_copy_timestamp(lrc, dw, i);
>+	i = emit_copy_timestamp(xe, lrc, dw, i);
>
> 	dw[i++] = preparser_disable(true);
> 	if (lacks_render)
>@@ -406,12 +419,14 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
> 				     struct xe_lrc *lrc, u32 *head,
> 				     u32 seqno)
> {
>+	struct xe_gt *gt = job->q->gt;
>+	struct xe_device *xe = gt_to_xe(gt);
> 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
> 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>
> 	*head = lrc->ring.tail;
>
>-	i = emit_copy_timestamp(lrc, dw, i);
>+	i = emit_copy_timestamp(xe, lrc, dw, i);
>
> 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
>
>diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>index cb674a322113..39aec7f6d86d 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job.c
>+++ b/drivers/gpu/drm/xe/xe_sched_job.c
>@@ -110,6 +110,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> 		return ERR_PTR(-ENOMEM);
>
> 	job->q = q;
>+	job->sample_timestamp = U64_MAX;
> 	kref_init(&job->refcount);
> 	xe_exec_queue_get(job->q);
>
>diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
>index 7c4c54fe920a..13c2970e81a8 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
>+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
>@@ -59,6 +59,8 @@ struct xe_sched_job {
> 	u32 lrc_seqno;
> 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
> 	u32 migrate_flush_flags;
>+	/** @sample_timestamp: Sampling of job timestamp in TDR */
>+	u64 sample_timestamp;
> 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
> 	bool ring_ops_flush_tlb;
> 	/** @ggtt: mapped in ggtt. */
>-- 
>2.34.1
>
