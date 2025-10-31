Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468DC26720
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7EF10EC04;
	Fri, 31 Oct 2025 17:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5Q9CccA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0D710EC08;
 Fri, 31 Oct 2025 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761932702; x=1793468702;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3OW5dVqd6hUMRTdbXzSHylUSUhFIpyEL4AbMghT3cz4=;
 b=d5Q9CccA0Su/7zMWxsk8/Xe9lfzYm7R9INxd3Umgz7t9bEf54ZuErEo8
 29T192kwIBtRCbGt7NeIiPVETaGLvtYb6w+siqNS45XbbrCaTV+2CODDO
 EIMtKLi5AoWDmjIn5ZVeJpuIW0a91cHF3E6O2GlVkJM+OWvLBnea+TlUm
 8d6hoiFzFLQ4yav7JHDwv8QqcOdlANP8+VIN7vhxdijN9yMYv6gx+Npu8
 f9S2jK37K6VedtwH/EXEfk/J40aG98jiKAc/r2YV7n1e7ZYIvx73uGgaT
 0x3PCSwhuFit84T8qGlvBB7QhykcCN+g9lL4txU/R5sBh7Y+McrzPEbAj g==;
X-CSE-ConnectionGUID: wJ85V4XSSnCdRYkJER0lBQ==
X-CSE-MsgGUID: NftuoHuYT+elsl+dHbFxug==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67960325"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="67960325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 10:45:01 -0700
X-CSE-ConnectionGUID: 1yQ8CwYjRJaVUqEYJCQkpw==
X-CSE-MsgGUID: Bn1cc0D0S8iPB+OZwVMRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185508619"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 10:45:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 10:45:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 10:45:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 10:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qs9ws9bSSrNtuFDZUQBqTXCehGi9vDjwijoLy8gmqoikF4KIrdbH/Xfg+aw6nFtvSciom5SXRVYPC9RCdDxYmeNUNlirbfZhst3eKlK+OFQYy2H8jPjKTFMZFnt+vgNdZ458M0A3eL4KV3uL/Gm07j378MD6La5mzxHzs/jBR6pAlhfj2RS31dMxM5CFe068peYywsl2UVsvqx+z8RVcbTUq4msGDd+lPLwT69oOt1273yo5zRT9eWhf4Nlz13tgEJIHXETk+eheBHWvRFLb51SMhP95m0OLbGGJCsA/jsjyGGm36WfGcuMkXlyztrwemEqGHReIyWjIZfbtk0h4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+CoA2N/59RfIAw/GGEH9zDhLyoqr5Yzo7GI+aGUu8Q=;
 b=dRQuNas86pSEObnvQcocsbbhpbep/Povgaqty25B/FqzS28KhPNH6xbygHIbdvik5kuQdi9eJ+oOVjno5m0traHA18HHjGr2yzV3tXxGpVmYHGrz292bZ+p2MZsUlX+a4LQ/NfS1lCOUitXGA+UgrnXm50/KDj8Pmkqrv5JAZcEza/noX1L44W4cxRYCNTsAFD+jtguX2Ea+HuObvIlnhBwJqTZ11ATBWF2386XvFUo8n6EfNB3F7VG91Ooo6iVGqonFSR610WWfcqgHjX8UGdRLidDDkAHalDXDNNoYoK8M/Dxy9goX8tbN6hrCz3RB3P5Z7KP7ayZ7jxx2N0e7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 17:44:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 17:44:57 +0000
Date: Fri, 31 Oct 2025 10:44:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <alexdeucher@gmail.com>, <simona.vetter@ffwll.ch>,
 <tursulin@ursulin.net>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Independence for dma_fences!
Message-ID: <aQT1lpZJwQmWXGBt@lstrano-desk.jf.intel.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
 <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
 <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
 <2da2077c-4226-4ba4-8935-e7e15e6b9765@amd.com>
 <aQJ+08BFLtmsM8LQ@lstrano-desk.jf.intel.com>
 <6739aebe-45eb-44a5-a539-209fc3ed809b@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6739aebe-45eb-44a5-a539-209fc3ed809b@amd.com>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 41863541-0252-4baa-be83-08de18a534f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTVxRFl6dm9IV3hvSFlLUEt0enRKQTRmNFUyNDVXVEpYUU9aazlXeENsYytT?=
 =?utf-8?B?eFRCTGdlTjJSV3RSeklQWHhDa3lURnk1L1RCbnpmWmVRaGFHc2NqNGdONmY4?=
 =?utf-8?B?STNSaExXS1k4d0xiRm1NbFNlRWx1SmhmdnhhWlhTb29Hc3Z6eGVNNGwrMFI4?=
 =?utf-8?B?MzkzcmNiTEpRNm1lcE1nVkhxaHVWVksvUXdlRkJ1eDNaTUhjTDFuTG9kUjBW?=
 =?utf-8?B?SDF2U3dscFpGWnU4S0pGS1pSanJWdmVDRDFMc0RxcEdRRHdDK2VvRVRFK1lX?=
 =?utf-8?B?Rzk3S0JMTlIycFB2S2FzbXZvTlVNejdQN1RnbVo5TDI2Z3RJcEh2aW5QMFFq?=
 =?utf-8?B?cHRqTDdXc2ZhRy9ibjAraXg3SEFab25NREJxMURySVpRWERFb1dGaXp6dEY5?=
 =?utf-8?B?M1Q5OVR1ZE50SnpUeW1KNWhwbTcxczRhaG9sVmN0V215ck9XYzFjSmpyVzcw?=
 =?utf-8?B?Uml4b0lrQlphVWNMWm1ZV2QybUNMTy9pdGppQUs1Qys5cFhXd0ViZEk1MXl1?=
 =?utf-8?B?cjRiN0p1SGZ1LytMTDZaSE1zK3BGRzZuVmFDZmgvZkdKM3lJZ2tJRElFbXRy?=
 =?utf-8?B?b2xoNUJJTUlrTGFhbW9rRGJaSU1QTFYwYkJjUWpaSkkya1dXbTMzaGMyMWQ2?=
 =?utf-8?B?bnpUMjhvZEg3SDM2SGZaQzhmdDBzeEo0TGxnOHc4ZHFzdk13bmM2MjV6ZDM0?=
 =?utf-8?B?QWl3cXVoeVE3cSs5akdCVkMrNkZJZVlYYjJrbVpSTE0yUU1Bay9vQmFraXhV?=
 =?utf-8?B?TDREM3dmclpBekhvRG1oMkdNcHF2K2RVV29XVjJGYnNlKzZhdGVrV2hacWRr?=
 =?utf-8?B?dkNSQkJ6cTZwRE1FanJlaXJWaitRRkVOckFaWWh2NUkrb0lWbVFPMUFmcTVS?=
 =?utf-8?B?U242TnFXVC85YTRRdElTdUVjQ2RpK3gyVWo1N2IvdmUvckZzQnlpUElNVXlJ?=
 =?utf-8?B?MjF1S3dsL1lBeVNHM0F1Q2gzRWd4dEFTTXUrREMzdEVJSFE5eVRkK3RFZDhU?=
 =?utf-8?B?cEtCT3A5VE9xTi91ZDRDd2FpMzBDUzlVZzFOU0RuR0pWVUdGTjkzQitCSktR?=
 =?utf-8?B?aWd2cFdCdE81VURaakdweDllMU52Y2ZUOXRjcURPZDNFSlRtditYK00rQ2pq?=
 =?utf-8?B?ekJXMExJWWthdk5NaFRwT01aWVZkZXFiTFh4aEJ0N1JmOS9RT241SzZSaGVY?=
 =?utf-8?B?NEN1U0xFbHArdVBYbnBSTjJ5Wit5TC9BN21rQXRVOEZhd0dKeHR1d0lnb25v?=
 =?utf-8?B?Y21vTUJxQ3JFdTdqUktjam94SlpUbG1RUDlwOHNWWk1LYzdBaDQ0QlUxbTNl?=
 =?utf-8?B?NS95dlFnU3ZHRXBvK0YvTmRnbEkxdGZiQ3d5clArald4cUJGejJ1WTlLOXN6?=
 =?utf-8?B?d3F2ZklvYkczUmRwMGNkeFEyQlAvZWlDNmd4NDN0M09ab2RkemJoVnNWMmR0?=
 =?utf-8?B?YlhsMTd0YW5SdlRVVzl4MVlCQ1p0VE5JWmR2OWYvdCtQY04wMHMwTWxqWk40?=
 =?utf-8?B?L0RDVVhOUmRQQW52S2l4c3IrakVjNnRMVWRuVk5MTDkwcCtMNERPUlE1Q0x0?=
 =?utf-8?B?NnhBUHdXWnU1cEZYVnNDTHh2R2ZlK1BkUXZIdXVyUVF5aVdORkQ1VnFOM3Vj?=
 =?utf-8?B?OFo3MzdMbU8yWGlSdEVtdllvaENPOC8wcHpGZVlVeTM1U2tSNXRZTHp6UDVH?=
 =?utf-8?B?STdnaHNDV0JDQmRON08xRWMyN1h6c0ZObDdSeGRjVW9hcndENVNjaVlxUVRt?=
 =?utf-8?B?SDNYRSticHBHaUd5L3ViVzRPdWJKN2Q3bVd5UjNTY3k0UGV1RDY1dGZEYlR6?=
 =?utf-8?B?VnFvNFlaRDd6T2M0cFk4UlBHRE5kNGExUnpJNVB5dVF2YVVmdVJnQTJSeGMz?=
 =?utf-8?B?ZW1COHBuWjNpc3RNWVpDblRtR2dTMzF2RmJSb0U5SFhYMS90cEdER09HWTQ0?=
 =?utf-8?Q?ZMbXTWL+e/SyZjBjtWtN3ZEKCU+Z8Rzm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUlsRzBUVUcvT2FrcDhPbExEbURpcFpib1BEanMzUXUzQjZ6eXpBZUFzbk9T?=
 =?utf-8?B?eVlPUXRTaUt2czZPNk9VbVlyL3Mra0FVQnVEa0dPekRIOGpJOFR6KzNwNTFv?=
 =?utf-8?B?dDFraHpSKzI0a0xhZkJxN3g3T0R3M3dydHVzYTNXcDdCY2tlMGNEOHU3SWY1?=
 =?utf-8?B?bXdTdkdPdTVaVzBrZkp5bDgrMDc3SmhWODBkbjg0cUNiOUlOSkt6cDJyMkZz?=
 =?utf-8?B?OG90NUkzNTFNSlhhSlhvcSs2UzFteWp2NUlSOTZWRFBXa0pVbyt3ak1HUy9N?=
 =?utf-8?B?SXVyZFJIOUsxNjc0Z0NWbWw5TzVCWGVWTDE5dXBMdElGbXBvc1l2ZUcwVFNZ?=
 =?utf-8?B?WXBiVkk4RWh1RXhCL3pNRERGR1ZyUkNtT21RZDlFZWVVTS8raXdHT1Qvc2p5?=
 =?utf-8?B?TGM2bk90SWl6ZWNXaDlWRkNEZmVhL3ZpSFZGME01ekdlUGFVb2pPSzRIZDdR?=
 =?utf-8?B?ZWhMdkR2OEhjNGhkb0d5bms1OHFRUEJXeXE1RngvOXJqLy95K0tQUkNOd29h?=
 =?utf-8?B?Qkg0RU9CVndWaitRMnZJQ0ttTzZnaFhib3UzYzk4cVFaaUdCWFhKTzN1QnVo?=
 =?utf-8?B?T0wvbW1raVN5TG5pWlJGa3NvbG42WlVsdlZDZCs5dWRTTVJjazdqUXREV2dW?=
 =?utf-8?B?OUl2TlFmUzBDclpIVU1BY1crNjZESGpSTWJtTmlaMlRYTnZEMWxGQytLamhL?=
 =?utf-8?B?NExENGJSVXh6WFYxR3hMNDZwRGhHM0JJcDdvc3cvVFFDZ2QxK3hLaDlOVENi?=
 =?utf-8?B?dE5TQ1FoU2RWVS9xQmdYZDBKZ1c4V3V0T21rNFFPN1dqL0tXRUxLRDFTNUpq?=
 =?utf-8?B?YmRLbjQ0eC9jYkpGRkFPNTdJeVkrcUMrUE52NDVaV1creW5CUFBVNzJsa1FX?=
 =?utf-8?B?ZFl5TEV5MUxReEthb1pDU0tpaGF5SXdqQ2RKcVFlVlIvTTBhUHZ4STNSUFNK?=
 =?utf-8?B?b3U4STF3dkZoUFI4b01pc0EvVTI3QmZwR3VDV3NKSExIMEhMd2MxVGNXSmhB?=
 =?utf-8?B?blRjR0hINEllL0VLQ2thV3JxRVllajBBUUNEdkZGcXJWM292aGpSYTVFbDNn?=
 =?utf-8?B?RS9nTmdpdytUU3dqUzhMT0Y1MXlha2dvcjROZm1TeTNCZEluMEhSdGJ4K2FG?=
 =?utf-8?B?RFR5a00vdHV0cUNUREpaL3owb1VrcUljRWRNbVo2ZXBTOHFrSFJTMHZjUnBp?=
 =?utf-8?B?dVMvOFV2ejFaNmtuQ2J6bXZtR0x2cDF6TFRLYjhFV3RtTERXSEJIbFpGVkdQ?=
 =?utf-8?B?dmpEdFRTK3Nxd3FoNEloRnRWS2lGNVJ0ZC9zQzhvNis5QWRXZTZ6a2xzUEw5?=
 =?utf-8?B?angyZUxTOEtaeHd1VEk4aEVJSTI0RE9tbUZTck9FTWNidkVXSEliNjY3QURZ?=
 =?utf-8?B?a2ZveW84bkNGMVVCRUU0Rkh3bCs2dVpiV3ZCSHZ3ckF6NFlURjJaUFI1RUJo?=
 =?utf-8?B?WGNRcW9vKzR5RmRjSHVSSXlhRXdzSC9sSDIxWUQ1YkZaWmdjWkFjZlJYY1cx?=
 =?utf-8?B?dWpTYUViMUcrOStmeTZSZWlEYUFRblYxUWEyWWpIUlkwZG1yNFE5bGhrQUpX?=
 =?utf-8?B?VEZxRS8zTFY0c1g5dGpGR0swbWFscWsvS0FvMXhRbmYvdVZwdHhHbGN1Zklp?=
 =?utf-8?B?Ny9jVzR3MmZTcEZRblZveHB0blMvRGJMY1Z1K1hZU3FESEZvcUpkeHduazR5?=
 =?utf-8?B?THBNWExybUtHZTd0U0ZtZjVGbGxtL09uTUE3NUhiSG5sWHJhQUsrMWs3WFFu?=
 =?utf-8?B?NDdrajlUc3FPY0dJNDN2SGNTS01rdDFyem52WG1pdlllU2xKWUZZWXFTRnla?=
 =?utf-8?B?TFMvSkRrMDRmbWVTZ2lSeCs2YW9LQkxzdXRTWjhWNGdRZWdmRlZqWWNoL3BE?=
 =?utf-8?B?cmpiVmgrWnVSdHVoYUVTM3dXK1lBZWRZNDhPRUhmUDdScnkxcll3Tmt5bTE2?=
 =?utf-8?B?eTVzM2J3ZzYvZWN1UUdZZ2dnTDJrWWxNY3dHVFFpQVh2d0M5RjIvcUNuM1dz?=
 =?utf-8?B?c3lIbkpPZTFnVWxWMEtyaDUrby94eHljZ0J5Y2FRUEZhV1BrZmt5emZNL1JY?=
 =?utf-8?B?MjhCaS9oYTIvMTd0UTE0ZThNSElHclFZb3hYSE9tMVFzUW52enVyN3pHWjVz?=
 =?utf-8?B?WTFrRjVBTmU0WFpLVG0wMm8rMVY5VWFtKzhiNnVPVVpvNWtkYk1WQlAzSmhv?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41863541-0252-4baa-be83-08de18a534f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 17:44:57.1964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jbzdxPHHehjexMKTomk3L1UYaWHrOQI+2jONSKosUJr0vTyAYbX3Aokr5FXbBP6FVonlDI0k443SeWOnRfdYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
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

On Thu, Oct 30, 2025 at 11:59:01AM +0100, Christian König wrote:
> On 10/29/25 21:53, Matthew Brost wrote:
> > On Tue, Oct 28, 2025 at 03:06:22PM +0100, Christian König wrote:
> >> On 10/17/25 10:32, Philipp Stanner wrote:
> >>> On Tue, 2025-10-14 at 17:54 +0200, Christian König wrote:
> >>>> On 13.10.25 16:54, Philipp Stanner wrote:
> >>>>> On Mon, 2025-10-13 at 15:48 +0200, Christian König wrote:
> >>>>>> Hi everyone,
> >>>>>>
> >>>>>> dma_fences have ever lived under the tyranny dictated by the module
> >>>>>> lifetime of their issuer, leading to crashes should anybody still holding
> >>>>>> a reference to a dma_fence when the module of the issuer was unloaded.
> >>>>>>
> >>>>>> But those days are over! The patch set following this mail finally
> >>>>>> implements a way for issuers to release their dma_fence out of this
> >>>>>> slavery and outlive the module who originally created them.
> >>>>>>
> >>>>>> Previously various approaches have been discussed, including changing the
> >>>>>> locking semantics of the dma_fence callbacks (by me) as well as using the
> >>>>>> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
> >>>>>> from their actual users.
> >>>>>>
> >>>>>> Changing the locking semantics turned out to be much more trickier than
> >>>>>> originally thought because especially on older drivers (nouveau, radeon,
> >>>>>> but also i915) this locking semantics is actually needed for correct
> >>>>>> operation.
> >>>>>>
> >>>>>> Using the drm_scheduler as intermediate layer is still a good idea and
> >>>>>> should probably be implemented to make live simpler for some drivers, but
> >>>>>> doesn't work for all use cases. Especially TLB flush fences, preemption
> >>>>>> fences and userqueue fences don't go through the drm scheduler because it
> >>>>>> doesn't make sense for them.
> >>>>>>
> >>>>>> Tvrtko did some really nice prerequisite work by protecting the returned
> >>>>>> strings of the dma_fence_ops by RCU. This way dma_fence creators where
> >>>>>> able to just wait for an RCU grace period after fence signaling before
> >>>>>> they could be save to free those data structures.
> >>>>>>
> >>>>>> Now this patch set here goes a step further and protects the whole
> >>>>>> dma_fence_ops structure by RCU, so that after the fence signals the
> >>>>>> pointer to the dma_fence_ops is set to NULL when there is no wait nor
> >>>>>> release callback given. All functionality which use the dma_fence_ops
> >>>>>> reference are put inside an RCU critical section, except for the
> >>>>>> deprecated issuer specific wait and of course the optional release
> >>>>>> callback.
> >>>>>>
> >>>>>> Additional to the RCU changes the lock protecting the dma_fence state
> >>>>>> previously had to be allocated external. This set here now changes the
> >>>>>> functionality to make that external lock optional and allows dma_fences
> >>>>>> to use an inline lock and be self contained.
> >>>>>
> >>>>> Allowing for an embedded lock, is that actually necessary for the goals
> >>>>> of this series, or is it an optional change / improvement?
> >>>>
> >>>> It is kind of necessary because otherwise you can't fully determine the lifetime of the lock.
> >>>>
> >>>> The lock is used to avoid signaling a dma_fence when you modify the linked list of callbacks for example.
> >>>>
> >>>> An alternative would be to protect the lock by RCU as well instead of embedding it in the structure, but that would make things even more complicated.
> >>>>
> >>>>> If I understood you correctly at XDC you wanted to have an embedded
> >>>>> lock because it improves the memory footprint and because an external
> >>>>> lock couldn't achieve some goals about fence-signaling-order originally
> >>>>> intended. Can you elaborate on that?
> >>>>
> >>>> The embedded lock is also nice to have for the dma_fence_array, dma_fence_chain and drm_sched_fence, but that just saves a few cache lines in some use cases.
> >>>>
> >>>> The fence-signaling-order is important for drivers like radeon where the external lock is protecting multiple fences from signaling at the same time and makes sure that everything stays in order.
> > 
> > Not to derail the conversation, but I noticed that dma-fence-arrays can,
> > in fact, signal out of order. The issue lies in dma-fence-cb, which
> > signals the fence using irq_queue_work. Internally, irq_queue_work uses
> > llist, a LIFO structure. So, if two dma-fence-arrays have all their
> > fences signaled from a thread, the IRQ work that signals each individual
> > dma-fence-array will execute out of order.
> > 
> > We should probably fix this.
> 
> No we don't. That's what I'm trying to point out all the time.
> 
> The original idea of sharing the lock was to guarantee that fence signal in order, but that never worked correct even for driver fences.
> 
> The background is the optimization we do in the signaling fast path. E.g. when dma_fence_is_signaled() is called.
> 

Ah, yes—I see this now. I was operating under the assumption that fences
on a timeline must signal in order, but that’s not actually true. What
is true is that if a fence later on a timeline signals, all prior fences
are complete (i.e., the underlying hardware condition is met, even if
the software hasn’t signaled them yet).

Could we document this somewhere in the dma-fence kernel docs? I can
take a stab at writing it up if you'd like. This is a fairly confusing
aspect of dma-fence behavior.

Matt

> This means that when fence A,B and C are submitted to the HW it is perfectly possible that somebody query the status of fence B but not A and C. And this querying of the status is faster than the interrupt which signals A and C.
> 
> So in this scenario B signals before A.
> 
> The only way to avoid that is to not implement the fast path and as far as I know no real HW driver does that because it makes your driver horrible slow.
> 
> So of to the trash bin with the signaling order, things have worked for over 10 years without it and as far as I know nobody complained about it.
> 
> Regards,
> Christian.
>  
> 
> > 
> > Matt
> > 
> >>>
> >>> I mean, neither external nor internal lock can somehow force the driver
> >>> to signal fences in order, can they?
> >>
> >> Nope, as I said before this approach is actually pretty useless.
> >>
> >>> Only the driver can ensure this.
> >>
> >> Only when the signaled callback is not implemented which basically all driver do.
> >>
> >> So the whole point of sharing the lock is just not existent any more, it's just that changing it all at once as I tried before results in a way to big patch.
> >>
> >>>
> >>> I am, however, considering modeling something like that on a
> >>> FenceContext object:
> >>>
> >>> fctx.signal_all_fences_up_to_ordered(seqno);
> >>
> >> Yeah, I have patches for that as well. But then found that amdgpus TLB fences trigger that check and I won't have time to fix it.
> >>
> >>
> >>
> >>>
> >>>
> >>> P.
> >>>
> >>>>
> >>>> While it is possible to change the locking semantics on such old drivers, it's probably just better to stay away from it.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>
> >>>>> P.
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> The new approach is then applied to amdgpu allowing the module to be
> >>>>>> unloaded even when dma_fences issued by it are still around.
> >>>>>>
> >>>>>> Please review and comment,
> >>>>>> Christian.
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> 
