Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NrmNphLemkp5AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:47:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471DEA7206
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00310E2D3;
	Wed, 28 Jan 2026 17:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDZkS9L5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D4710E2D5;
 Wed, 28 Jan 2026 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769622420; x=1801158420;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f3utfeHpoyKCMSw9/EygkO2BE9lYeXYE9GZe1ChEYVU=;
 b=JDZkS9L5qAJGfGLdSVUD/GGm2X255cQN0/I1gkzUMMyBCHBPISDUxddD
 jYhoG1qxsSJ/p/d+KcUBODtqsPSNB2CznxCPODG2TyuzFvkBdMX2ZtjH8
 gWo/+kQRAu0rDQJfxq/L3RhI9QP97iNZAfcxguv2Lugu/hxi0xwkfuJM9
 l4RXDWNSmKMhjAP3snK7LPY9Mt/7LMryhYugQ8aBE9PLBnuASkxINTP0S
 Dr8ThGqHcQyW/DH1MxcjmXRIIEsTrTTZlzJ0nCUfMfZSOWD5ACUOAU7F0
 aNLmcX7IjTvWjSNBnX8yJf74Vly/1T5PjVKVkrOAiiRYNmrBynnJCQHwX g==;
X-CSE-ConnectionGUID: tBT/qshARY6Mpsa3UMiAbQ==
X-CSE-MsgGUID: JWk7dWSOTwWRpUSN6GuZzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70897845"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70897845"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:46:51 -0800
X-CSE-ConnectionGUID: x4RpMYIwRK6XR023BlkTxA==
X-CSE-MsgGUID: rv1F4r0qSjGfPVtCv5Fekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213196732"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:46:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 09:46:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 09:46:50 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 09:46:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAwzWn2j0e4KD6Sm4Mtj4S/928Yw+OMzpRANDk4bFaVKmOMJ2Z8X70JU9Oz3ojOwZbYhQHaiCIjgInHjKPTDTYlTcY/KKEG40dUvtFBw2gB93cnlowuHpcSJYQ7hHtSv1UD6FD8wd3npcQSGxv78l4PxYiSXYBPuIiTYaVpH7JJHnNjmH6EhfZqiZ8/x98OJ16gS8H3dGX7rSTw+Ql9eDkHpJIPY0XUxrEdKkalHy/h7LvDqg0b3Gpg4/cFirVCSsnDW3BkqWp+p4Uiap8D9xR22ivIC5HTjQobiAF4szD86XZ09NhFI+2btO3uXhz6v5UXDlgR/o1oCcJDNeNUCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwe1Gd2vw4JCK87jz6qGDErodctaU7ZwsLnQ3oKx2RI=;
 b=jjoTBIpByZ6bzIJBt5AR4FYJ5l64y3WLHfA0DOg7WvDF397O1lVUDxsSWLCfYCFOU/JTVcT8vSFCtZmdIDtAHbtLHg+oY0pUMRLGVnfFUyTn3aj0tnd5r2I2zcKcip5bHAOvEHdYd0bRHSxnP3dy2x0ZtWzSRNubFcgcop9BEdudkjtnM9mk8ZB03el9dAjVawc522uxojtcbh76iANCgGiRqMVLYJLK0J7n4JrT8Lb0/BPmfi9grca86gPqdd6AJ0zU07gYO+SeYtlRKPPXPZ4fzCzXzyp6ZtJk6Dvng+HwKhjJxvmCD0czZAoR4fECr1Yf6QcrOh3ZwPWcBBHtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8416.namprd11.prod.outlook.com (2603:10b6:610:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 17:46:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 17:46:47 +0000
Date: Wed, 28 Jan 2026 09:46:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <jgg@ziepe.ca>
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128142853.GH40916@unreal>
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbe07f1-28ab-49ba-5a40-08de5e953574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zy9pQzIwTTZWaWNqVVZBUnZmWG0rVm9PdStPcXRHRWc4VkdSbXV1TWtyYlNW?=
 =?utf-8?B?SFJEMlhUY3I5WG1yMWltT0txakI0SEY1WlFSTDhUMVJ4WWIrNlJsV0U4UzVN?=
 =?utf-8?B?a2JjeVpKeWt0Rk9ORGQ5cTlRQXFrZjlQQWsvRHZZeGZaeWtUZXRXdnN3Nlpo?=
 =?utf-8?B?ejQ0KzRMcncwN093Smh1UVBNK28xdUVoTGdsR3VkYWhuM0NLazFYREVCekkr?=
 =?utf-8?B?YVFQT2lpdWZBTkp3UHVaWSt2WjFkRmk3Z3NOK1daZHRDZEppWHRaNkhxejVs?=
 =?utf-8?B?UnJJNXpuSkNjSVNGOENESGNyOWVPclNMbzE3RHVKVEpkRHhGeUFPcFcvOERt?=
 =?utf-8?B?bFVJR2R4ZkhvdytYMFJsMnZtSDhhWmRqTUV5TUhXWXNtUHBobFBhdTAvdkxw?=
 =?utf-8?B?Q2JrSnlhaWVlQWUzVUJPcHlQeFc2SWhBaGIzT3lGMHFKRGVZQnZaZm40bTZM?=
 =?utf-8?B?eDNaWEVQdjNadEdtUU9QVEllWVZZd25ob293RVQ1SFdnckI4dFJSRVlQZlN0?=
 =?utf-8?B?dHFnZy92MERmTDdyQTFpN0JvcExwY3JoZXRNUTVVc3VYNVExY0dzbFZLZTRX?=
 =?utf-8?B?blkvcC9qRjk2M0wwNWpTM3ZVU2hDNXEwODJvQWhsK21WSUJINFU2dUt1MkJz?=
 =?utf-8?B?UnhBOGVTcCtBREpFdk5XR204Wi82MFM2K3lQTzU1ekgySzVTYjlaaWZsaFZO?=
 =?utf-8?B?bkthb0lPcHFFNnhDN1FNL0ZvQ0syQjl2dnR3YURNUURpeHArZmxKcEJIenhF?=
 =?utf-8?B?TEhDQUM3REZVRG9wTE1aTDQralJtSG44dGozME5BYWx6S0RhVVN6Sm0yTTFn?=
 =?utf-8?B?eFhEUjN1blVxZnJHUk9hZWFsUE02SmFqdHhxZUFHMjU4SVJlY2JGUU9lQnhv?=
 =?utf-8?B?TlNhTUFwVFIyK2dOaXg2ME52RVJIbkFyQWVlWlJySEJveWxwZWFxZlVNZnBh?=
 =?utf-8?B?NEh3WjFwUFltZHFqeEZRQjl1OTM1c2RYc3A2UldFTGIrclZDVjE4MmI4OXIv?=
 =?utf-8?B?TDdValNHUWxFYUExTUVNU0pXTUVnbTk1ZzJKWXl4RWg1ME5TeVBvKzZva3NG?=
 =?utf-8?B?UzVaZHZqVGZCWURLdlBhbjM2V1laUm1oOUhHN0ZVSVRoS2wvdS9xaDhMdmRJ?=
 =?utf-8?B?eWZjYklRTEdNcmE3dUhLaUhLMWNzUzJaYkRHMGN3NUpXMS9PTGN0TDNEeFhC?=
 =?utf-8?B?M3dCM1hhM3pOOGtuNEZvaFpraWszcy92NjlqNmNzaHNkS001RUN6RW03WmJp?=
 =?utf-8?B?Qm9wUWwvTzlmSExIUWZ2VU5qZ2NjaE81Tk9CWUp0RDhnTEJtQnIvY0N2ZXFa?=
 =?utf-8?B?LytvZzFFV0hvTVp4aTFxSVdVUkxYS1NIazd5aGNHK0Jwd2hNSUU1YmZaZ3M1?=
 =?utf-8?B?SUF4MHlwekhxRVNyUEpMc2FDK1YrblFjelhLaXIxa3N5aXZXZnZrYXFZdVdX?=
 =?utf-8?B?YkFnYWdmeU8yVC9LaHg0MHZEd3ZpTE1FUlVKRndScmIyM1NPcFFlWno5NzhX?=
 =?utf-8?B?M0VZWGF2ZkhnWldRV2p4QlQzbmdPc2phaU5qVmtTL05lekFWdHp3YWJGcFBV?=
 =?utf-8?B?eTk1QTVlSndkNDNHQW9zeEVlbXIvM3NscVZ4UzRTcXVWUlc3TTl0YkI0alNv?=
 =?utf-8?B?S3V3WlBiYTg2YXlNWGJuVUh1MnRyMTdxbC9mb2FuSDBOYzF0NzN3T0VsSVJH?=
 =?utf-8?B?eGlBaWFrRjJBTUJMVllDSG5RSjQ4RzVOR0RKNEhCZ0pqUWZTcjUzbEpwb0xD?=
 =?utf-8?B?Nlg4eDYzMlBDL1F1WmEzcnpDMi9ZRjZmN1NPTWVjV2hRdGdYWnIxSkZlRXNj?=
 =?utf-8?B?YnhKb2pPN3R1YTFDelNlQS92VmtVNExkcHN5bmJpR0RFMzR0dG9YYkpqb3ll?=
 =?utf-8?B?R3R1MlB5bTJGR2NHWk5NZExZVEpPekxabmtIUDBHZzNLcnFCbVY3Ri9JNHdo?=
 =?utf-8?B?RmtGT0gyem1QRzNaRDVyU3lKMlRuRC92Tk91eDM3MmZwTFlFT1N2eGlPdUNn?=
 =?utf-8?B?U1pqSXBSOTB2VDJ4bHRnaCt1cmpZSUI4RUpDLzJBTFFZd3lyQUxWYkp3Uy9p?=
 =?utf-8?Q?m3+lDY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdlNmVHbjdXbll0anVkOVJwNHJTMjh3SENhWHgzdzhieWpiYzRDOElmVVVs?=
 =?utf-8?B?bm5oSmJPREpWWEhIRmVhdWJzb3AwUXlMdk1qQ2tNZXVMRjY4MCthd1dKc1gw?=
 =?utf-8?B?aVlhSi96b2Mwalh1M0hzREhEY09UT1BjakxmVTBOakRUVVJXeEZLM2E5SzNs?=
 =?utf-8?B?RHJSN1YyMHQySXVKTEhVNk1YVngxcEp5dllnZWRCSk1rcXozSWpPU1A1MmRS?=
 =?utf-8?B?eU9zTkpnTjNaUW9JdHVUMXJ0QzdmV3JzQXVWcjFGa0daLysrcnQxWlJPcW5C?=
 =?utf-8?B?WU1JQ1VBd0cvS1p2TmxJVVdreHBlU1ZhaE1FL3ZPbiszaHhEYkV0RWtTNDIy?=
 =?utf-8?B?N2hya3lwbEVMZG1jdEp4UDk4Uk9GUGxnUUxQYUFONnhSc1JON3Z4cThYN2Y0?=
 =?utf-8?B?cU5MdUFueXRkNzZqOVVjRVdubk5aN0VVWHV1ZzhNaFZVUGRPeFBCYmE1ZElj?=
 =?utf-8?B?enNndmhNbGhPYUVnckFGbHJzd0hMT29VWjFmU0JsaDV2UDhzMmE4elVNdjdT?=
 =?utf-8?B?dDJQZERhNkVDUHZIQjhoTWVqSzEzUUxyb3Y3YS9XaVNTeGFrb2NUVjRtNXVN?=
 =?utf-8?B?YldIeDhXYXBWOVlDWEgwdVJ1Y2dIeHRvT2JoeHBTVFpXcTVvYVV5NHNyNWdl?=
 =?utf-8?B?MGs0VG9oNUJCMkltNk96aWVrYXJFVk5BQzk5cGRpelBuU1lLWitmblFQOGNw?=
 =?utf-8?B?dXRzSkYxQnVMcWliaDVaalQvbDF1QlZEZmtwZ2J3bVNVKytQNEZlY2NIdGhq?=
 =?utf-8?B?UUlsMTU3OUFidTdjTC9BNm8vOVNjWlFyT001L204RDQ0M0F6UXFPdnBDVVdU?=
 =?utf-8?B?Rjd2OEp5UE5ucEUyTkMvZ3gxcWxVRWR0TU04TFBkdWVWbFJuc1Z5OUtJRFM4?=
 =?utf-8?B?aGhNZXdOOXBRZ3lqdUh3VDM4dk1YektDak1JYVNiMXJkZExXQXJZclFSQ09L?=
 =?utf-8?B?WTVBSUxTd0pyWUxUNDRqSngyUzd2aE9LYksxVWVlOXA5MlpUejQ1eitOTjlK?=
 =?utf-8?B?MWJzaTFFak44OTl3U2o1NGJING9GdGRqcnQ3Sm9mWW94TGhHWWFWNVNleXR3?=
 =?utf-8?B?MUdPcEc5SWNNeVVlTDBpMTlSSC90czJpTitHM0QySnhDL1ZHSEZPWkcwY0RK?=
 =?utf-8?B?aWFPcWNRZjE1MHBqRnF1RFdlUVNrMVA4c2ZUWklKMGN0cHRPc3VCWHRTcnVx?=
 =?utf-8?B?NkNSNlZpbUV3QW91ZlZWMTVRMXRTSFQ5eEZheFJ1U1c4eC9pTVh0a1d2OXZx?=
 =?utf-8?B?OUx5cmF0MEsvUUJzQUVsRlk1cFVZL3hZSndjVzJRQk9pa2V2d3gzQmJCclBO?=
 =?utf-8?B?V25nUC9RNzA2S1VVVDBIb3c1ZE52Tkc2emZOdElwa202Z1BQWTNxRkFCOFcz?=
 =?utf-8?B?UEo0d1VOK1JicGdMNGt4NUlOYm5GY1NzY2ZhakRxaDhud3UxNnQxWmlUZWIz?=
 =?utf-8?B?ankrSms4aG56TERTa3lFVjYrTW12ajJGQjRzQWtuU3A4L2E1dzFsSnRNUnRY?=
 =?utf-8?B?WHdDelhQNG1qekhNSHljd1FoZThBRFhXdytFWUtKUTdhZ3IxMHdJZ3BxV3Jv?=
 =?utf-8?B?TytRKzlXYWtZVFVDYVM1dmlBODdUNmNNdFdMWkJuQlMwUy9pWThlSEVOVGtu?=
 =?utf-8?B?Ym5mYS9ic1dJT0JrS1MycVdYakhYTHQ0TXh1RXRhb1R4NUJvcFRWZ2dTZW9z?=
 =?utf-8?B?ZlhTUkhOWTdwdCtxS0dnL2dZWUhWT2xtSlkzMVFHcVRWY3BOaDFjMGM4Sy9w?=
 =?utf-8?B?cmRYZzNoMzFtZWY2bFUxeXgwWEZGSXh5T2d6VWdWa09uQXFKVm1ZbDZZZzBv?=
 =?utf-8?B?cjhqUmErUEFSNXkxZzYwMlpyL0QxN2VYWmxHOGFZemVxbXFYZHNURDZpNkhV?=
 =?utf-8?B?NTNSWnhPOE9USklYMU1SNlhEb2dCY1IxQkM4Z3ZOakloN3B4aW1ldm9ZWFBM?=
 =?utf-8?B?b1Bxbk9tMWlrTXg4cjFwN1NhTm00NlQrbEtEeHF2bGwwbEw1OXoxazBsZU02?=
 =?utf-8?B?WEZWL0hEYzZVYjg5V1Bnd29jcWhOUk13cUh3VG1tdThIUXY4N2llQjBOZXVu?=
 =?utf-8?B?V1VCakZEc0paMkRoUk5uVDgvRVhjWE1BTWdWeU1GMTl5cElCWmhEWHhvT0F3?=
 =?utf-8?B?RVZsN1dHVlVhS3diVmZNQmdXWXNjeElubktQS3VDQnpEc1p1U1MzMU5MRldN?=
 =?utf-8?B?alZRSFVaWXFOTE92SWVjbjZQT1F5VG9tOGdpS1NvaE56N1lJOGNLY3d0VUZm?=
 =?utf-8?B?QzZuM3YxRm1oR1dDVkRlVE8xcGpNM1FWc1hWVDNEMjlERE05SGJJeHZOSVgr?=
 =?utf-8?B?RERPRXdlb0kwMCtQRGNFVWZNL0dzM1dORzBhQk5KbFk5M2QyelMvbEJFK01V?=
 =?utf-8?Q?qiTDaNcYrdW55V9Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbe07f1-28ab-49ba-5a40-08de5e953574
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:46:47.5164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z75qrugvkXkcdKvc8PiJmd/kWMOWhhUI2zXK3akAcbSgCz0/z/5I4z+UuWTeDmm3w+iIE3RdC2h+CqWZtPtlBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8416
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 471DEA7206
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:28:53PM +0200, Leon Romanovsky wrote:
> On Tue, Jan 27, 2026 at 04:48:34PM -0800, Matthew Brost wrote:
> > The dma-map IOVA alloc, link, and sync APIs perform significantly better
> > than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
> > This difference is especially noticeable when mapping a 2MB region in
> > 4KB pages.
> > 
> > Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create DMA
> > mappings between the CPU and GPU for copying data.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c | 121 +++++++++++++++++++++++++++-------
> >  1 file changed, 96 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 4b79d4019453..b928c89f4bd1 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -287,6 +287,7 @@ drm_pagemap_migrate_map_device_pages(struct device *dev,
> >   * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
> >   * @npages: Number of system pages or peer pages to map.
> >   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + * @state: DMA IOVA state for mapping.
> >   *
> >   * This function maps pages of memory for migration usage in GPU SVM. It
> >   * iterates over each page frame number provided in @migrate_pfn, maps the
> > @@ -300,26 +301,79 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
> >  				     struct drm_pagemap_addr *pagemap_addr,
> >  				     unsigned long *migrate_pfn,
> >  				     unsigned long npages,
> > -				     enum dma_data_direction dir)
> > +				     enum dma_data_direction dir,
> > +				     struct dma_iova_state *state)
> >  {
> > -	unsigned long i;
> > +	struct page *dummy_page = NULL;
> > +	unsigned long i, psize;
> > +	bool try_alloc = false;
> >  
> >  	for (i = 0; i < npages;) {
> >  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > -		dma_addr_t dma_addr;
> > -		struct folio *folio;
> > +		dma_addr_t dma_addr = -1;
> >  		unsigned int order = 0;
> >  
> > -		if (!page)
> > -			goto next;
> > +		if (!page) {
> > +			if (!dummy_page)
> > +				goto next;
> >  
> > -		WARN_ON_ONCE(is_device_private_page(page));
> > -		folio = page_folio(page);
> > -		order = folio_order(folio);
> > +			page = dummy_page;
> 
> Why is this dummy_page required? Is it intended to introduce holes in the

It is intended to fill holes. The input pages come from the
migrate_vma_* functions, which can return a sparsely populated array of
pages for a region (e.g., it scans a 2M range but only finds several of
the 512 pages eligible for migration). As a result, if (!page) is true
for many entries.

> IOVA space? If so, what necessitates those holes? You can have less mapped
> than IOVA and dma_iova_*() API can handle it.

I was actually going to ask you about this, so I’m glad you brought it
up here. Again, this is a hack to avoid holes — the holes are never
touched by our copy function, but rather skipped, so we just jam in a
dummy address so the entire IOVA range has valid IOMMU pages.

It is meant to avoid the warning in [1] — without this, unmapped != size
as only some of the IOMMU pages are populated for size being destroyed.
I added this early on when everything was breaking and then moved on, so
at the moment I’m not sure whether this warning affects actual
functionality or if we could just delete it. Let me get back to you on
whether it just causes dmesg spam or if it has functional implications.
If it’s the former, I’d much prefer to remove the warning rather than
carry this hack.

Perhaps you can also explain why this warning exists?

Matt

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/iommu/dma-iommu.c#L2045

> 
> Thanks
