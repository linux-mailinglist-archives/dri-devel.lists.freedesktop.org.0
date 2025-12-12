Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00686CB89AF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 11:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABCF10E5C6;
	Fri, 12 Dec 2025 10:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lv8RqSHC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF1410E5C6;
 Fri, 12 Dec 2025 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765534667; x=1797070667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zszPqOTjawNL5gHIwDQpgjorYZLPWPIj2w7hnZ+zsrM=;
 b=lv8RqSHCWm6r2zIgzpsClW2w/9mTjGdeiElgJXJVzg053ICr6xpB9tiD
 wa71vE/ojQFFGwvNrMOievGmTPC6kjHow4YA1rtBh+tnGZox4BNMOJYKE
 jcx9ARaw92goqi4+OkI1haXooky10xNPSB5VDi5e5HlVHJ3nYD9C7a4ML
 Tcj+9aqVwtTO4u5tuXu7A7v+75jg9j5sDn/k5jyCuXVziVQ5bySV4Ah6z
 LQG63RBRtXaDwx/mq2sF5q4M/jlI3HhYCUnvo+cDPP/FmOubVLATHPmuR
 WXjr2NDCSPZfZgPDG/lGxFlCU0VI8Pj5o9fOQ2jF4fDeBGMSqJXUuWoKM A==;
X-CSE-ConnectionGUID: JMhqrFLMS1mQCmXcxefAMA==
X-CSE-MsgGUID: uzaB9aQKQAy1CmMLzI1IcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85130362"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="85130362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:17:46 -0800
X-CSE-ConnectionGUID: ZberrOJJQHmydYmodUu9wQ==
X-CSE-MsgGUID: ejPoiZ5/SRa56MvLDPBVzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="228106226"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:17:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 02:17:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 02:17:45 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 02:17:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpA+3FjxCTSUV6zsSVSVw5be1fL+LZMAS+/GAo8FF/SyOnqwzKhFXj4OOMz0zFlmQp9gwP/vkLbLp2y6/p3G776pr9vEVxpUr++vdA+MMRhZWnZFlP2JcNmqflL7v22jhfQ+OoOdalwq3z3ZC0qryzETpYVQcgcZe4cuxUJTNIpP976QESjnQC9eM43jmLT/MiPNGusZpsvlAXA7VSziw0FH1AoEtUeEnS9jzetQjwx9L/tlzvu/6RmwPBFRftD1p35fQdgHDq/1Kx7kj+N7By2qRiZOIF7CiC1iroAW/oI0YBW9t5OktmgIUklKBXlhW7CRSIt9LAlEJ53XcSQ9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2MK2lif/qQb1Ysv6TesDdniGP6/3uL6LMC3QHXfHd0=;
 b=ONTNHFTzVBnjR2NKU81VAjstXK1I3HhYVQsdon6asufBn0KzpWUTUegiUoDuCPSOAmC2YAq/WmwTqR+eoR4hJ3iH/Atnmrlc9AA04w9Oxwgu/zRdfIo19H+GIYV9Sdj9C15POdomqYhzBNFzyEVRo57B46O/sUOCrxCbUePjw1ZnEtdrWYveDEuIrINYkIUOsoanZPGqMA6uiw6pbrf5eGUOr/forBRijJkpjZvGG5hni+PKvbM81uypaoJI0BdEQi+iHK5cQS/JyWMrLioxt8eSrDvEzg9MscrosCtD2AQDBsMBjSoeJxTgr151LOjmOoKdnkBZsIchyhxAKmOs8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by LV8PR11MB8747.namprd11.prod.outlook.com
 (2603:10b6:408:206::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 10:17:43 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:17:43 +0000
Message-ID: <6a519bfe-720a-4590-8e88-47f47bec805d@intel.com>
Date: Fri, 12 Dec 2025 15:47:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/22] drm/pagemap, drm/xe: Ensure that the devmem
 allocation is idle before use
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-3-thomas.hellstrom@linux.intel.com>
 <a20bfe73-3713-46cf-b357-d5d49cf9ba5a@intel.com>
 <f4fc9e25d47079f66b5c68502d7c1b46ee19b0cf.camel@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <f4fc9e25d47079f66b5c68502d7c1b46ee19b0cf.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a9a16b-20c7-4eaf-0900-08de3967afec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFcxOEY4UVZwckJpY0Q5dG9IdDBnQ1ZLZVBoMk9EYmIzZGJjM0JzZ3F0WVM2?=
 =?utf-8?B?SDlwQTJrNEJwUCtNVmhzamVnS2lvbmJkWjZFZEdEV1VHTkhQeTRKWkRiNUVY?=
 =?utf-8?B?UXpoN3RtTWRrMGl0ekZOcU5JL0hOY01Xd2JXZUZCdThuU25CNkh0K1YwM0x4?=
 =?utf-8?B?ZU5ibzE5bUNGTWtkWUh3ckVPd3N1S0ZzT2psTGV0VVJKUDZpRm0wM1ZUVzlo?=
 =?utf-8?B?cm9ZS0lnZmZvaUZFMFBSU0IxNE5hNHRRVlIvckV1V2Vta1JybVk2UXJIdFFW?=
 =?utf-8?B?MFRmSUtTK1VvQjAvc0FwQlFTYUFRM29XRXFTM1k5WjU2TDhCTExueERMcjFy?=
 =?utf-8?B?RDRDUE53VmJnc2JkRFBuV2FPeVVyNk1xUXhyYVlCYXBUcjFkYzl3Tnd4MDAw?=
 =?utf-8?B?elcwZmxYM3d2VDM1Z1pHV0NMTlU3Vm54bnZ6ak1DZDhHUGdnNDVuSE96VVR0?=
 =?utf-8?B?eitDbXlIZFhyZHd1NjVobGJCZ3lBK3Q3KzdMdnlhbCtQalVQY0NNNHY5UGlU?=
 =?utf-8?B?ZnBwbWNRZTNxOUU0TDh6aktTRUtBbHVOQlgvTzNDWll0eTcrY3dKSFNpVHVH?=
 =?utf-8?B?Qi9kSWtGc1FnanczSWhDQURDWjNiV3U2dTlkUGg4R2lZNkpMZHZoOXN3bUZO?=
 =?utf-8?B?bHlvS3VuUStYZG41VVpNYXNSUC9QNHlKN3VnSTZ6STdleXdSVk5MLzBBU1E4?=
 =?utf-8?B?TjhKa25lbmtIOFd6YWJmRE5CUVZ6THdIdFU5NEs3VjViSWR2TGNGK1U3MkZi?=
 =?utf-8?B?Z2NORjVWZUMrd0pqZHUxbWZrMVA0QVhqaThkdE0rZEt1bFNMWmVxNGtmVytN?=
 =?utf-8?B?TktYSlNsMEsvQXdvcHBzOGRLMTVielFJbXdVV0w3RWhvY0NIbFY2WXI2eTgy?=
 =?utf-8?B?TXF0ekc5V0lpVHZ3RXRFakRaSE9lVFBMT0tnOS8wa1lPNEU0UExOVzlPaERj?=
 =?utf-8?B?SkI3cXlQY1UwaVpXMzdmZ0NxY3JydzNoZWp0SjUzMzBNSkI0SFc3alhpcGJu?=
 =?utf-8?B?K1pkMFBsUTlXdGZQMG96K1d3ZjNsU0ZDeTU3RTZmU1Z2NUxwK0FoMnV6RXZJ?=
 =?utf-8?B?MitjZzlhR3NGYzUxMWl2RXdoVHpLUHZKeWptOEpxRjVWaXpnMENQWFlKNVNh?=
 =?utf-8?B?Qjh1SlJLZXpoVFBIMjZtZzdjRVFxNVNua2lKcE0rcEk0akwyMHVsMWd1UVZw?=
 =?utf-8?B?eWhQWklLSDVhSFRIUjc4WENEMVFkUndGK25MYXk5dS9aZm5zeGdndkdrZ1Uv?=
 =?utf-8?B?ZVM5M2FsRkNNME9CMmh6eDl4bTBMOVZuMTd2bk5kcWp1R2ZqYmRvTi94UEU0?=
 =?utf-8?B?UHhwUnFicUgrNFpRMXdESE1DcDlKNUNtZk5sRXpoWUQzczVlRlFIckFmNVFW?=
 =?utf-8?B?bWhTZUg5WEhNM0c3RDEwV2pKS1NSYVE2NVg2K1pXeDU3b1lhL2o5RVVuQnpo?=
 =?utf-8?B?Kzl6NU91ZXRpNmxzY21Sb2pOUlcwYnBDTVVDUjRXdmhKRDNNczd3NjRmQVlo?=
 =?utf-8?B?bnVqUUI4QjdEVlRZWGtuSElNdUlZd0Z5Ujd6bFpTUy9IYUg2czBzc3NKRzNV?=
 =?utf-8?B?R0pEbW9qaFJMM1p2QlFwelprR0NTYlNjZG1lL2JzbnBvMjVKNGtCSVVmZHQ2?=
 =?utf-8?B?SWY4dU5WSURVMG5FRWRSQjQxMmpreUdWZktPS2Z0K3dHb1pKVElxaUFFaTlx?=
 =?utf-8?B?cml0aFJ2YWxiVUo5UkpQdlB0K29PV09wNmx2bmx1azYvOXRSWUFSQzVrbTRz?=
 =?utf-8?B?ekc5ckRlLy9kWDZpVFdackxaYXZySVdBZEc0YkIvKzVXVEhyanJYZkc5SUZO?=
 =?utf-8?B?OHlPSlR4WjI2QmpVTkFQLzlLOVE2Q2RJM083eUtXL3Z6NFc5dXVBTmU2eDlu?=
 =?utf-8?B?VWt1YlNvYkd4M1BXYnFLb3BNNCtvUTFoMmZrVWk2ZWpQWCsxMjlBTjdRWFFm?=
 =?utf-8?Q?o4qerJCgrVLEo23k5jEHkWJEMQr51Z4p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1JzNjBIVFlheFZrUUVrODk5bllORm4ybm1XQ0cxUGw3YzJjUyszRFJ5UHd1?=
 =?utf-8?B?SGJsd3JEUnFVMVhCM2l4R01mSGJ3WnUyOGpmWDh3ODRCQjRuMU5jNVE1Zk9q?=
 =?utf-8?B?c0Mwai9OQTJCMjhKcWxmUmcwQ1FNMDUrS0crazVBUHFmdW1NVnZPQ2t5WFp6?=
 =?utf-8?B?blR6UWtoRUh1aGdzSEhEVHJZeCthSDJZWjJzK3RENTlOM0hlbXJBUWlJRzdo?=
 =?utf-8?B?Z3h3ME0rTk1WK3BNRVhXOGVxb1cwOE05YWN1RmN4aFF1RVB5Nm00TEU1ai9m?=
 =?utf-8?B?WldhNXdwVU14MkdpTzhaQ20vVm52Y2NXY3dFU3BGcWhueHNNNUw2Mi9oOTZT?=
 =?utf-8?B?QVhMSksxdFY5U1dIRFFEVlFnMDFTM3NtYnpOc2pQL3Z2ZURFaWljY2huM1Bi?=
 =?utf-8?B?cUc4Rm1pUDFSTGxHVkllMWtOTisvYkJzT0E4QTdYOUN6Mm9NVnNvVFBVYVJq?=
 =?utf-8?B?dFZCSnpDUHJVSUlDaG15U25Gem1DemVLQmNiZTVTSXRSbExZaXhhM0pDYXF0?=
 =?utf-8?B?SmhhT3poMFRubHdQY09tSENKZ1VaR1lrUDhDQjgvODhtYkp1dXZ3YzBmbXRT?=
 =?utf-8?B?c3ZLZHhBRUF5eFFvNHJ5Z1VJVXptZC9NQ0FXdzdNVXY5WnRES2w0eTY2WENj?=
 =?utf-8?B?SGEzVmRMVFhhcXlUblRlcXdBS3YyKzMwdjhGcTVUR3UvOUZmdGUvV0NFWnM1?=
 =?utf-8?B?a0pEOGtabUxvSEY2MXVsdTFOUFpJSXBMdzJvS2xqMGd1RG5INUtBcXVTMmNI?=
 =?utf-8?B?SDZCUXQzZHNaUmxYTG1mZWlhU0FtemtKdEx5ZG84UVRKM2tqSUdKN0F5cklz?=
 =?utf-8?B?WHgwZTBjSmxGM0pwZ3djNWZJd3hqRmNDbCtlV1gvZ0R6b2ZWaDJIOW9aNUlZ?=
 =?utf-8?B?QjlKcGlzL1RPTlRQYlpuUDBrZmRucldYTFpjSlBwQ2doMk5DbENnY0VJTGpR?=
 =?utf-8?B?eStGeHFLMmtDUWZmSGVHcVZJQ0YxQzk2RzViR3FzZGpBbGJJSkVKNFdCVlI4?=
 =?utf-8?B?a0NkeWJlekt1TVZHV0JTdURCeFBEWTdHeG1pQkFHeVA4UDlzR2ZtZ3ozdENR?=
 =?utf-8?B?N2Q0QVhtMC9GRGJUZnlvWDNTcXZTUjBQTXRWcTZ1bE1mNzB2UEk5dkFKWlNQ?=
 =?utf-8?B?aDZDRXdNOUlNWUk1WEkvc3RDbWo3dE85bzllT2Y0MGF0OHVBWVlJcUVBWVd2?=
 =?utf-8?B?ZlQzTGV1R1dZcU1VZTMySG56Z1lQa2htKzluT1QyeXpYYXgxR1I1dHRCUldl?=
 =?utf-8?B?LzJHc3pES1VtbUZrUEF0RGhreW9Ya2JXck1OU1FNa1B0MVR4Y1cwTHNIc2VS?=
 =?utf-8?B?SFRqd2l4V2NOV1hFU3g2empVY3FqaGR3aUVnNzVRdkxodHlLT2hXUmZUc0Zm?=
 =?utf-8?B?VHF6QVpyM2swTEw3OXk3c3hsQkd4cENUMHdMQUdHUFVzUFF0bzRobEZBemlF?=
 =?utf-8?B?TE03aEZqaXZyUmR5K3Q1M3BYOXA0L05GTWxOUis1RFliUkltR3huM2IwMGpU?=
 =?utf-8?B?WXFwTDZtYkRsNi8xc3A3dTE1b2dtTVJNc2g2akR1ZGxkeUpIL2dLblkvTXMz?=
 =?utf-8?B?NWQzdkR0T2QxTGZPSTZtQlNpRExSZklaNE9Hc3c1NTV1TUM4NmNVSlZuRkdw?=
 =?utf-8?B?cDZXY251L0Zsa2lYNVh2M0dvbFMxVU0wSm5pZ05UaGIwamtYQjZ5eVp3OTgy?=
 =?utf-8?B?cmhyMk5jTm5ja3BwRkxJaUpsemRwSkNNVWlUNVlwdmV0VGhkVCtRc2pqN2Fv?=
 =?utf-8?B?L1JSMGgxMjJKdWR2ZW5vMmhqeTh6L05nMndhMmV0N2ErZEJuR2h5Y2tOa2t4?=
 =?utf-8?B?NExFL1dYZzlqdTZQRFkrTUVhMFRQOW51UC92NUVCbGVFU3ZwWW1tVG1WZmh3?=
 =?utf-8?B?dlpNTnJSWkRSSXB5NXlwcHg2eEtERng4M2g2ZzJaZllVYUY4LzFSdS9QeWZJ?=
 =?utf-8?B?eWNkcGtGT2xPRHJYNHJLNnpRRWxOb0lVZ25LR2VGcElQbGRYcnd1U3pqeEdX?=
 =?utf-8?B?SUkvL1dqMlRReFFYS1A4OHAvYlk0TlBoSWxML2hXdTlCTzRSREtYVkoreUFi?=
 =?utf-8?B?SGlQamJXeE9zTTRZdHptaEhvbmEwWXpzZm5wWHdIdkpaK1diTzFXYzdTc0Nk?=
 =?utf-8?B?WDNmRGdiNU9HblFYbDIrdXJnU0Zlc1E1UDhwaHF4cjg4dGplUlhMRXNHamE1?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a9a16b-20c7-4eaf-0900-08de3967afec
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:17:43.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB3WYgjRw3Nw4s7qO8B0EiyPuLGNQozDSn9fHdFq7Lnt0HBY9KX8xWU7xEBvlsN9LLOnoYIbcRti3Sk291HSBb8UXclVXNCZJubaVO1s9os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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



On 12-12-2025 15:45, Thomas Hellström wrote:
> Hi, Himal,
> 
> 
> On Fri, 2025-12-12 at 14:54 +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 11-12-2025 22:28, Thomas Hellström wrote:
>>> In situations where no system memory is migrated to devmem, and in
>>> upcoming patches where another GPU is performing the migration to
>>> the newly allocated devmem buffer, there is nothing to ensure any
>>> ongoing clear to the devmem allocation or async eviction from the
>>> devmem allocation is complete.
>>>
>>> Address that by passing a struct dma_fence down to the copy
>>> functions, and ensure it is waited for before migration is marked
>>> complete.
>>>
>>> v3:
>>> - New patch.
>>> v4:
>>> - Update the logic used for determining when to wait for the
>>>     pre_migrate_fence.
>>> - Update the logic used for determining when to warn for the
>>>     pre_migrate_fence since the scheduler fences apparently
>>>     can signal out-of-order.
>>>
>>> Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc
>>> functions")
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.15+
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_pagemap.c | 13 ++++---
>>>    drivers/gpu/drm/xe/xe_svm.c   | 67
>>> ++++++++++++++++++++++++++++++-----
>>>    include/drm/drm_pagemap.h     | 17 +++++++--
>>>    3 files changed, 81 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_pagemap.c
>>> b/drivers/gpu/drm/drm_pagemap.c
>>> index 22c44807e3fe..864a73d019ed 100644
>>> --- a/drivers/gpu/drm/drm_pagemap.c
>>> +++ b/drivers/gpu/drm/drm_pagemap.c
>>> @@ -408,7 +408,8 @@ int drm_pagemap_migrate_to_devmem(struct
>>> drm_pagemap_devmem *devmem_allocation,
>>>    		drm_pagemap_get_devmem_page(page, zdd);
>>>    	}
>>>    
>>> -	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
>>> +	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
>>> +				  devmem_allocation-
>>>> pre_migrate_fence);
>>>    	if (err)
>>>    		goto err_finalize;
>>>    
>>> @@ -596,7 +597,7 @@ int drm_pagemap_evict_to_ram(struct
>>> drm_pagemap_devmem *devmem_allocation)
>>>    	for (i = 0; i < npages; ++i)
>>>    		pages[i] = migrate_pfn_to_page(src[i]);
>>>    
>>> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
>>> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>>>    	if (err)
>>>    		goto err_finalize;
>>>    
>>> @@ -732,7 +733,7 @@ static int __drm_pagemap_migrate_to_ram(struct
>>> vm_area_struct *vas,
>>>    	for (i = 0; i < npages; ++i)
>>>    		pages[i] = migrate_pfn_to_page(migrate.src[i]);
>>>    
>>> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
>>> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>>>    	if (err)
>>>    		goto err_finalize;
>>>    
>>> @@ -813,11 +814,14 @@
>>> EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
>>>     * @ops: Pointer to the operations structure for GPU SVM device
>>> memory
>>>     * @dpagemap: The struct drm_pagemap we're allocating from.
>>>     * @size: Size of device memory allocation
>>> + * @pre_migrate_fence: Fence to wait for or pipeline behind before
>>> migration starts.
>>> + * (May be NULL).
>>>     */
>>>    void drm_pagemap_devmem_init(struct drm_pagemap_devmem
>>> *devmem_allocation,
>>>    			     struct device *dev, struct mm_struct
>>> *mm,
>>>    			     const struct drm_pagemap_devmem_ops
>>> *ops,
>>> -			     struct drm_pagemap *dpagemap, size_t
>>> size)
>>> +			     struct drm_pagemap *dpagemap, size_t
>>> size,
>>> +			     struct dma_fence *pre_migrate_fence)
>>>    {
>>>    	init_completion(&devmem_allocation->detached);
>>>    	devmem_allocation->dev = dev;
>>> @@ -825,6 +829,7 @@ void drm_pagemap_devmem_init(struct
>>> drm_pagemap_devmem *devmem_allocation,
>>>    	devmem_allocation->ops = ops;
>>>    	devmem_allocation->dpagemap = dpagemap;
>>>    	devmem_allocation->size = size;
>>> +	devmem_allocation->pre_migrate_fence = pre_migrate_fence;
>>>    }
>>>    EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>>>    
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>>> b/drivers/gpu/drm/xe/xe_svm.c
>>> index 36634c84d148..2152d20049e4 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -483,11 +483,12 @@ static void xe_svm_copy_us_stats_incr(struct
>>> xe_gt *gt,
>>>    
>>>    static int xe_svm_copy(struct page **pages,
>>>    		       struct drm_pagemap_addr *pagemap_addr,
>>> -		       unsigned long npages, const enum
>>> xe_svm_copy_dir dir)
>>> +		       unsigned long npages, const enum
>>> xe_svm_copy_dir dir,
>>> +		       struct dma_fence *pre_migrate_fence)
>>>    {
>>>    	struct xe_vram_region *vr = NULL;
>>>    	struct xe_gt *gt = NULL;
>>> -	struct xe_device *xe;
>>> +	struct xe_device *xe = NULL;
>>>    	struct dma_fence *fence = NULL;
>>>    	unsigned long i;
>>>    #define XE_VRAM_ADDR_INVALID	~0x0ull
>>> @@ -496,6 +497,18 @@ static int xe_svm_copy(struct page **pages,
>>>    	bool sram = dir == XE_SVM_COPY_TO_SRAM;
>>>    	ktime_t start = xe_svm_stats_ktime_get();
>>>    
>>> +	if (pre_migrate_fence && (sram ||
>>> dma_fence_is_container(pre_migrate_fence))) {
>>
>> Patch LGTM. Nit, Moving sram check for p2p migration from source here
>> makes better sense with [Patch 22] drm/pagemap: Support source
>> migration
>> over interconnect
> 
> Just to make sure I get this right, You're suggesting moving the sram
> check above and the comment below about source migration to the source
> migration patch (22), right? If so, Yeah that makes sense.
> 
> Thomas

Thats right.

Thanks
> 
> 
>>
>>
>>> +		/*
>>> +		 * This would typically be a p2p migration from
>>> source, or
>>> +		 * a composite fence operation on the destination
>>> memory.
>>> +		 * Ensure that any other GPU operation on the
>>> destination
>>> +		 * is complete.
>>> +		 */
>>> +		err = dma_fence_wait(pre_migrate_fence, true);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>> +
>>>    	/*
>>>    	 * This flow is complex: it locates physically contiguous
>>> device pages,
>>>    	 * derives the starting physical address, and performs a
>>> single GPU copy
>>> @@ -632,10 +645,28 @@ static int xe_svm_copy(struct page **pages,
>>>    
>>>    err_out:
>>>    	/* Wait for all copies to complete */
>>> -	if (fence) {
>>> +	if (fence)
>>>    		dma_fence_wait(fence, false);
>>> -		dma_fence_put(fence);
>>> +
>>> +	/*
>>> +	 * If migrating to devmem, we should have pipelined the
>>> migration behind
>>> +	 * the pre_migrate_fence. Verify that this is indeed
>>> likely. If we
>>> +	 * didn't perform any copying, just wait for the
>>> pre_migrate_fence.
>>> +	 */
>>> +	if (!sram && pre_migrate_fence &&
>>> !dma_fence_is_signaled(pre_migrate_fence)) {
>>> +		if (xe && fence &&
>>> +		    (pre_migrate_fence->context != fence->context
>>> ||
>>> +		     dma_fence_is_later(pre_migrate_fence,
>>> fence))) {
>>> +			drm_WARN(&xe->drm, true, "Unsignaled pre-
>>> migrate fence");
>>> +			drm_warn(&xe->drm, "fence contexts: %llu
>>> %llu. container %d\n",
>>> +				 (unsigned long long)fence-
>>>> context,
>>> +				 (unsigned long
>>> long)pre_migrate_fence->context,
>>> +				
>>> dma_fence_is_container(pre_migrate_fence));
>>> +		}
>>> +
>>> +		dma_fence_wait(pre_migrate_fence, false);
>>>    	}
>>> +	dma_fence_put(fence);
>>>    
>>>    	/*
>>>    	 * XXX: We can't derive the GT here (or anywhere in this
>>> functions, but
>>> @@ -652,16 +683,20 @@ static int xe_svm_copy(struct page **pages,
>>>    
>>>    static int xe_svm_copy_to_devmem(struct page **pages,
>>>    				 struct drm_pagemap_addr
>>> *pagemap_addr,
>>> -				 unsigned long npages)
>>> +				 unsigned long npages,
>>> +				 struct dma_fence
>>> *pre_migrate_fence)
>>>    {
>>> -	return xe_svm_copy(pages, pagemap_addr, npages,
>>> XE_SVM_COPY_TO_VRAM);
>>> +	return xe_svm_copy(pages, pagemap_addr, npages,
>>> XE_SVM_COPY_TO_VRAM,
>>> +			   pre_migrate_fence);
>>>    }
>>>    
>>>    static int xe_svm_copy_to_ram(struct page **pages,
>>>    			      struct drm_pagemap_addr
>>> *pagemap_addr,
>>> -			      unsigned long npages)
>>> +			      unsigned long npages,
>>> +			      struct dma_fence *pre_migrate_fence)
>>>    {
>>> -	return xe_svm_copy(pages, pagemap_addr, npages,
>>> XE_SVM_COPY_TO_SRAM);
>>> +	return xe_svm_copy(pages, pagemap_addr, npages,
>>> XE_SVM_COPY_TO_SRAM,
>>> +			   pre_migrate_fence);
>>>    }
>>>    
>>>    static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem
>>> *devmem_allocation)
>>> @@ -676,6 +711,7 @@ static void xe_svm_devmem_release(struct
>>> drm_pagemap_devmem *devmem_allocation)
>>>    
>>>    	xe_bo_put_async(bo);
>>>    	xe_pm_runtime_put(xe);
>>> +	dma_fence_put(devmem_allocation->pre_migrate_fence);
>>>    }
>>>    
>>>    static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64
>>> offset)
>>> @@ -868,6 +904,7 @@ static int xe_drm_pagemap_populate_mm(struct
>>> drm_pagemap *dpagemap,
>>>    				      unsigned long timeslice_ms)
>>>    {
>>>    	struct xe_vram_region *vr = container_of(dpagemap,
>>> typeof(*vr), dpagemap);
>>> +	struct dma_fence *pre_migrate_fence = NULL;
>>>    	struct xe_device *xe = vr->xe;
>>>    	struct device *dev = xe->drm.dev;
>>>    	struct drm_buddy_block *block;
>>> @@ -894,8 +931,20 @@ static int xe_drm_pagemap_populate_mm(struct
>>> drm_pagemap *dpagemap,
>>>    			break;
>>>    		}
>>>    
>>> +		/* Ensure that any clearing or async eviction will
>>> complete before migration. */
>>> +		if (!dma_resv_test_signaled(bo->ttm.base.resv,
>>> DMA_RESV_USAGE_KERNEL)) {
>>> +			err = dma_resv_get_singleton(bo-
>>>> ttm.base.resv, DMA_RESV_USAGE_KERNEL,
>>> +						
>>> &pre_migrate_fence);
>>> +			if (err)
>>> +				dma_resv_wait_timeout(bo-
>>>> ttm.base.resv, DMA_RESV_USAGE_KERNEL,
>>> +						      false,
>>> MAX_SCHEDULE_TIMEOUT);
>>> +			else if (pre_migrate_fence)
>>> +				dma_fence_enable_sw_signaling(pre_
>>> migrate_fence);
>>> +		}
>>> +
>>>    		drm_pagemap_devmem_init(&bo->devmem_allocation,
>>> dev, mm,
>>> -					&dpagemap_devmem_ops,
>>> dpagemap, end - start);
>>> +					&dpagemap_devmem_ops,
>>> dpagemap, end - start,
>>> +					pre_migrate_fence);
>>>    
>>>    		blocks = &to_xe_ttm_vram_mgr_resource(bo-
>>>> ttm.resource)->blocks;
>>>    		list_for_each_entry(block, blocks, link)
>>> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
>>> index f6e7e234c089..70a7991f784f 100644
>>> --- a/include/drm/drm_pagemap.h
>>> +++ b/include/drm/drm_pagemap.h
>>> @@ -8,6 +8,7 @@
>>>    
>>>    #define NR_PAGES(order) (1U << (order))
>>>    
>>> +struct dma_fence;
>>>    struct drm_pagemap;
>>>    struct drm_pagemap_zdd;
>>>    struct device;
>>> @@ -174,6 +175,8 @@ struct drm_pagemap_devmem_ops {
>>>    	 * @pages: Pointer to array of device memory pages
>>> (destination)
>>>    	 * @pagemap_addr: Pointer to array of DMA information
>>> (source)
>>>    	 * @npages: Number of pages to copy
>>> +	 * @pre_migrate_fence: dma-fence to wait for before
>>> migration start.
>>> +	 * May be NULL.
>>>    	 *
>>>    	 * Copy pages to device memory. If the order of a
>>> @pagemap_addr entry
>>>    	 * is greater than 0, the entry is populated but
>>> subsequent entries
>>> @@ -183,13 +186,16 @@ struct drm_pagemap_devmem_ops {
>>>    	 */
>>>    	int (*copy_to_devmem)(struct page **pages,
>>>    			      struct drm_pagemap_addr
>>> *pagemap_addr,
>>> -			      unsigned long npages);
>>> +			      unsigned long npages,
>>> +			      struct dma_fence
>>> *pre_migrate_fence);
>>>    
>>>    	/**
>>>    	 * @copy_to_ram: Copy to system RAM (required for
>>> migration)
>>>    	 * @pages: Pointer to array of device memory pages
>>> (source)
>>>    	 * @pagemap_addr: Pointer to array of DMA information
>>> (destination)
>>>    	 * @npages: Number of pages to copy
>>> +	 * @pre_migrate_fence: dma-fence to wait for before
>>> migration start.
>>> +	 * May be NULL.
>>>    	 *
>>>    	 * Copy pages to system RAM. If the order of a
>>> @pagemap_addr entry
>>>    	 * is greater than 0, the entry is populated but
>>> subsequent entries
>>> @@ -199,7 +205,8 @@ struct drm_pagemap_devmem_ops {
>>>    	 */
>>>    	int (*copy_to_ram)(struct page **pages,
>>>    			   struct drm_pagemap_addr *pagemap_addr,
>>> -			   unsigned long npages);
>>> +			   unsigned long npages,
>>> +			   struct dma_fence *pre_migrate_fence);
>>>    };
>>>    
>>>    /**
>>> @@ -212,6 +219,8 @@ struct drm_pagemap_devmem_ops {
>>>     * @dpagemap: The struct drm_pagemap of the pages this allocation
>>> belongs to.
>>>     * @size: Size of device memory allocation
>>>     * @timeslice_expiration: Timeslice expiration in jiffies
>>> + * @pre_migrate_fence: Fence to wait for or pipeline behind before
>>> migration starts.
>>> + * (May be NULL).
>>>     */
>>>    struct drm_pagemap_devmem {
>>>    	struct device *dev;
>>> @@ -221,6 +230,7 @@ struct drm_pagemap_devmem {
>>>    	struct drm_pagemap *dpagemap;
>>>    	size_t size;
>>>    	u64 timeslice_expiration;
>>> +	struct dma_fence *pre_migrate_fence;
>>>    };
>>>    
>>>    int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
>>> *devmem_allocation,
>>> @@ -238,7 +248,8 @@ struct drm_pagemap
>>> *drm_pagemap_page_to_dpagemap(struct page *page);
>>>    void drm_pagemap_devmem_init(struct drm_pagemap_devmem
>>> *devmem_allocation,
>>>    			     struct device *dev, struct mm_struct
>>> *mm,
>>>    			     const struct drm_pagemap_devmem_ops
>>> *ops,
>>> -			     struct drm_pagemap *dpagemap, size_t
>>> size);
>>> +			     struct drm_pagemap *dpagemap, size_t
>>> size,
>>> +			     struct dma_fence *pre_migrate_fence);
>>>    
>>>    int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>>>    			    unsigned long start, unsigned long
>>> end,
>>
> 

