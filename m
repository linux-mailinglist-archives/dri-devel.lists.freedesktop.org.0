Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2862AF06D8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 01:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28A810E6B5;
	Tue,  1 Jul 2025 23:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAm6+XT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A418910E6B3;
 Tue,  1 Jul 2025 23:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751411857; x=1782947857;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MLB12SnOtlPc061xRVXwnKfJ6jBfqUBl7Z/+K0fKqJ8=;
 b=kAm6+XT1dBOB0mDRScT+0X+G23wo2fGSk+3We8uXC3Wx5JVCpqZoArkx
 sPV7UQlR1MpUh8Uen6+JZGRPNdSxMnLtyS/Q85ywiib35RYoWvsW8qn9X
 GFyFslcHOjOlu0UcyBlQ/eHNfXW0syOigOidFFa2fQccqpVuQK5z0nVG3
 mKj3a3hWwUQgeaoKdM31r14KNRMfBmiN3ibgoYAxy9doqIkeKnE6DcHYZ
 EKfJlLY2Xs9xpg970RhDEcJF6tk1/LtILNKldft8/JcHsSfu6YX+yppZi
 9+C278t/SsJO9BeOKJIvv0dLMmshf0IUdj5iNbXVp+vWxjMixV9oeJype g==;
X-CSE-ConnectionGUID: h5x3DTsrQ52tUKS/gf6eEA==
X-CSE-MsgGUID: wbAk4camSX2740qbnxQKlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52925239"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="52925239"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 16:17:36 -0700
X-CSE-ConnectionGUID: TYZDwXJNQcOCOztgxPUAWA==
X-CSE-MsgGUID: bJisOSfeSl2lr3dnnpngtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="154227522"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 16:17:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 16:17:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 16:17:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 16:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffGuGDz6l4hexMZYfsD7ve3Eqtdq70Y17V+msxHF7c0cEii4oUfqwmj6YMYNezR0PYWHfN0kOE7VOYU3du1TPCZOaJSAyZ8zOXwKyAlCBpzwXdwb9chlyss+yc1X/YD/klfjW+Fgsuwfq/PubZOz5xYHaUF7Xx1HBkLDa5c33HMAFFT+S/SsF7jSOGGdS9UbPcqSSXDpQ/9Lvdyjoml7RLDlA+k4H/2BU3RG7Zmw+aJpsUmJGuJmaa0Kgz2YZBscByPAamk8JnWzkWY2gCOT5nWu1o136AEiQyCQjm4z0Bjg1FoM7xirBaTpgCILCbgS39FbzcAOqOPOi/ObmQnveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IDSOX1+yfPEQ6plZoYQPK05l1uLcnqOhskQ2yDGp2g=;
 b=sa545I/XjaXz94jzjkjyQfh73MVzHZEMa+4Q5CLlr3HF/ojwH/JoyODefJCsuSvqCwE+CGlS6nETv4lTtZi4AJ8A4k7s+GCD1qB1dVBdf2B8ESOLNxXdcN8bcXybgrqEsmyA0QY9wXlJ3q5tNEEvzmcbWbTKFQ7tcWXD9YY/wSh4cG8LoEAdj/1wLnYPLGsZQoGDhJilcL/kSejzY1M9FybhOPIzmaZKdrbh+LpI8KKKo0G+kn8lXWqNsRfH8G8kGOsDQPNJadNIyBFnVuBfBPX9UREiyb+0i9t8mhK4KF9jin34VhdIqnV+jNbdV8YLwdPm7q0WD1DkJKw1Q28BFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 23:17:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 23:17:19 +0000
Date: Tue, 1 Jul 2025 16:19:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <pstanner@redhat.com>
Subject: Re: [PATCH] drm/sched: Increment job count before swapping tail spsc
 queue
Message-ID: <aGRs5HaO+Uo/+vAZ@lstrano-desk.jf.intel.com>
References: <20250613212013.719312-1-matthew.brost@intel.com>
 <8b288dcd-81ed-4047-89b4-4bc8a4062fb2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b288dcd-81ed-4047-89b4-4bc8a4062fb2@amd.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: fefd2db5-fb07-436d-2b56-08ddb8f56cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akxqdmpNZS9ZbG1icVhSb0diVGpIK0JYSzR3aUFyRjJpTlYrRkRka2hVdjNZ?=
 =?utf-8?B?V1N4Q1YxY2VCNnozYkFYZmwwdVlFemtwMjJkbWJBRG4rNUZNVnZ6QW4xbjgr?=
 =?utf-8?B?K3hYd2pFMzZ0MDBEQmovWnE0T2lzM0Y4OGFMNlp0VGd5a1p1Q3I5bXAxR0o4?=
 =?utf-8?B?SkVlQ3FOZ0QxZGxGazh4eG90NUY1UUgzNEdRTkZ4eHRFREZLN3c5S2JDZlJZ?=
 =?utf-8?B?ZnVhQkppcFdyRG1zMUwvTWhyYmkzSEtReDFScUZpeVRXaGRObTM5L3NtSy8x?=
 =?utf-8?B?Tk1KUzZ5anNhZXBaUWpPb0VaZ1RSWHczWmVUcHlOcWJsSnE5Skp4VzRhQTdJ?=
 =?utf-8?B?UUtJK2NmT3VZeUhGUlR1akdHUE9NVUFWbnRvUU9vWFpERUZITmx2SG0ybExm?=
 =?utf-8?B?c2J1cWdJTjk4TTVQNTFpL1h5bVVyLzdSL0Z1dk5QWEN0TkZYSzhFeTNGSHNo?=
 =?utf-8?B?bmNTY2VzVFZvdEJNYWMraFBPQm9FcFkvZXlFL2ZXemljczUycHdKZHptSnlX?=
 =?utf-8?B?a0RrT0RacHBhRFhCdnFaVlJ4VWYxRm00eDZTZ1hVUUxwcVFXMkR4cGZ3S3kx?=
 =?utf-8?B?clV1VGRkb25wV3hoL0hWcWdXMyszc25mZzFNUGt2MHpxNkYyQnFJTGQzODN6?=
 =?utf-8?B?ME1oYlViR0l4WmxJMGtDQjV0UnkxNUI0ZXgxU2VtN09JQUUzSHVrUHpLQXQv?=
 =?utf-8?B?NFA1ZFpEWmtwaGt1d1NHNFUxSEJYUlFyamMvZkZmV04zTFNjV0dlc1Qxb3JE?=
 =?utf-8?B?RmFEMXZyWFBManU5Kzd4YzJ5M0R3Z1k2ZU1tYjh2aWFpSkh1ZUxIT045dGhj?=
 =?utf-8?B?QUVmUjBRV1VHY0dFYUhkN3FjT2hWZHJIUUMvTWY4S09nc2sxanJrUTlqK1hq?=
 =?utf-8?B?QVA3SzdkaWNNUXV6MEpCYTFOc2ZLMGU3S29OWUZPNEwvV1BjZ0tOQlBPcnBp?=
 =?utf-8?B?TVVjVG91bzdNYTRsZm9uM0xrRmNid2tpd0ROU1F3bTZqdDlhMVBkTmpXUkZL?=
 =?utf-8?B?NU9YaUk0V2JGODhyZmJ4aGs2WVFsWElyU2d0VHlQVzZaQXJiazVNRGxEWFhT?=
 =?utf-8?B?REZzQmZ5S3VSSFUvdjNJcEJ2UCtKcmxiVGtDRU9leUJMSU9UdzQyVU5iMkRW?=
 =?utf-8?B?ZlJwUnJJS1liQm5vQXVHdHBreGl4RjA1Qmw0d2lSaS8xa25ESU5LdGdjZUxm?=
 =?utf-8?B?YWN0Mlh4ZDBrbzVYYTkrRWxWUWh3bzVDS2hGTTRBSlFFOWp3NldQVmVoc08y?=
 =?utf-8?B?enVuNDA3dms5TUJyamhjdXFnaGpzdE1IVjVicGRRODcrREhFNlZSUjlORGNr?=
 =?utf-8?B?aE5Kb2x3V2YrQTN4cG1kUk1RblE2YzczRHp2SmovRlR6ZlpBSSsyeXpWUU1L?=
 =?utf-8?B?WHJWdVpPZWd1bURLVFZlOEpUd0JDOFk5dUJPSmJFNnZmaDV3UFNvaEpvUjNz?=
 =?utf-8?B?UnNyL3h6OGIwT0pHQTB1N2ZZUTVaQlQ5NGViMGNLZ05obHp5YnFPNVRvUVVO?=
 =?utf-8?B?b0FBTm1NMzdLNS9pWHBScUJMTFNXTWdBUjR0MFZ6cGcwVUtyazNzN3Uwdmx5?=
 =?utf-8?B?cUtJWmZFcXNsTXM1b1N4eG15c3RMeXdvcnVFRDJnYkgzSVV3QjdHYnlJaXFj?=
 =?utf-8?B?QXc1YXhEWnNNWlREcmFzc1lXVXErejhzeTd1d2U0VURIVmhoNE02Z3BHYzlr?=
 =?utf-8?B?WW0yQXZZSFg3RTFpVFBNVHVkejhhT3ZZMHVob1A5WHN5V3Izd0RNNDZ1dkxx?=
 =?utf-8?B?QUVGa3VWTmM4WFpjOFpUNUxEYU83T2JlRGxZOG54UGwyek43YWl2K3VtUklX?=
 =?utf-8?B?Umt0VmZMWXdHdCtnL01oa0Z5WFF4eW1EOVUxWVhWSkRteFVTQXUxb0d6L0FH?=
 =?utf-8?B?aUtHV1p1SDEyNVY0Qm1wYVc2YWhTSWFBeTd6WHhXRndqZnFPdTMrVGx6TTI4?=
 =?utf-8?Q?1pY5AKZ22Bk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eldCQkVoUHJwL1c5cFJ2Y2J2QkJpZlgvRWpuTTlpTVFMRk1aY1EvbUtzMnlW?=
 =?utf-8?B?VHFQR1BGUFg2MWFBd0k2TlFkMUdrd2IzLzB2ZnBJZE5JY0hUNzVmRHpYR2Jq?=
 =?utf-8?B?eHI0cXNXVVlialhUOFl3ejl0TGRXM3VnWnlEMzFnS3BOQzIzajJoR3VvaFZ0?=
 =?utf-8?B?MkFPN1ZmR1FvREVXQlIvUXVBRVRxeUZZY3BtSlFVN2wvR2xYZnNMVGdJekpn?=
 =?utf-8?B?MmovU2tvelNkYVZGVmtXT3J6RDFhdTE3SmZGVnczTG0waHlLZmZSS0lBUG5E?=
 =?utf-8?B?SSs1L2tydGtBNXFiTzRHcFhTZk9SVHBydkJCT2NVRFFaNEo5UXI2bkNBRDR2?=
 =?utf-8?B?WUV1RnBnNm10UjZpcVhQT2p5dzNOQlZjRExkdTM0VldnQ0VvWGRTeU8wbi9Y?=
 =?utf-8?B?L3MyWVJlUEMvWnRQWnhuSUdZMjZZNFgxZkJUb3NkSVNkSjBKQ21FZlFacUx5?=
 =?utf-8?B?VnF4MEVzZEFDVTM4Y1J4WG5aa2xxeU90NER3RGU3cUtsZFY4cVZkODBtVTdj?=
 =?utf-8?B?WC93THdIMFA5MXNVT1Jnc2QzSnp6TER2cm10dTNLdDZ1QzlFQWp4d0VJSTk4?=
 =?utf-8?B?TWVVRGZldTZPTlRFRG1wYzdVQU5kN2JPM2NWV0swTlZDVUhlM0FOell6T3R4?=
 =?utf-8?B?Yk9FL1ZidGdvOWtaK1JVT0xqODVFdWltM1kybFhXUU1LS1gvYUozU3hrMUZy?=
 =?utf-8?B?aDVsRW1TWHo1MEgrajVwZnNGSE9ZUnkyUlFTVkpQTW56OC9xRitYSUs1Y1Vu?=
 =?utf-8?B?dC9iTlZTZk1UZUgyR1lRbHpyenZlbHRKMDByMFM4b2pCS1VuUFkyVEJQRWpq?=
 =?utf-8?B?VkpDamw2K2pmTjA0Wk9tUHgyNjdIWlFIM0hUazd0aVYyek1MQjFVUGFuRDVH?=
 =?utf-8?B?bDNRRHJjNnQ5RTdHdXZ3cWRhZjFOWU41R0EyL3pjUUFmMVRpd0poU0xxRFh0?=
 =?utf-8?B?OU4rcStPWXRkbW9OaHppSnZqU2loaXhlWStaYUo1Q2JsdHUrMTdncUFkQ3Np?=
 =?utf-8?B?aTE0S05rK2Z6S0Q3eXMxRFZ3VTcyWUdhYzBjSS9SUklIN3ZKZkg2dEE4Nyti?=
 =?utf-8?B?WVExaEptUGxyNVo2M3l5S2JHb1JzOEVqZlM4clc4RCs5bHIvZUU3amxJLzVP?=
 =?utf-8?B?czNza3RSRkNzb05rb2NhVVFPbWd0RkN2ZWl0Y01oL0V4cnNwVzdwbEFpNkNj?=
 =?utf-8?B?dEFQeW9vQ0VnSzdrS244U0VydnVITHUzVVZkdWVNZkE2MVByNGJJTmErQzJW?=
 =?utf-8?B?MXZCT1pLdEJtQnRhbFFEZ0xzRllhay81cGlIWnRGUGIzNlE4YkVMRG94NG9D?=
 =?utf-8?B?MTJRYVQ2cS8rdTh2U1Rlb3REbDNEMU1pWTBGUUsraGZWMnJ6RVJzLzlHcXhn?=
 =?utf-8?B?K2JKOWxITy9IMUdBTFJ0RWVXdkdhWEUyWUZsVlphc3BCclczLzNKV2lGQWxE?=
 =?utf-8?B?cE9tc0NMbDRCZHBDQUI0R3Q0aENRR1hUcmVFQ1UzR1RnS1hrbENIcmhwVHcr?=
 =?utf-8?B?U3RxQkVJYXdCZXhicHl6WTd3ZjFpbXJCQmx1a0ZsT1JSRTVyR1VxeU5NbGFM?=
 =?utf-8?B?ZWtYNmw4OVAwSTNjT2I1azdUOUNXdGFWMjQrVmVUMDFxNWhuSGlzaDdFUTg0?=
 =?utf-8?B?Ykl2b0d0TGZSMGtKVWNNWnNuN2ppU1k2dTdpK3ZUWExNT0FBQU12ajU5a0t6?=
 =?utf-8?B?dDZLZU8rK0YvQVFMc3dJTTk4QitCc2F2YXFXRVNHaWlzV0hWeVdGTFczTTIr?=
 =?utf-8?B?R3FDNmZaV2dSZ2hSSU1QVVA5bm1qNXJsa1AwMmVMcDZBejFTSE12bDZVWm94?=
 =?utf-8?B?bWVMalZtb1dEWHdTdm5HendjT2ZPVi9VZFFTejNtcVJhOGFqUlVqSlh2RXkx?=
 =?utf-8?B?dGxiUVV1VWE1bWw4RWxackIwbE9BZVhsbXB2akF2eTV1dzRMdGo0Z0JWbzB4?=
 =?utf-8?B?TlZlb1U4bEFoTzVoUmJ1RklmeHN3K3dQZ0ZwSHJWMjRnM0VYU1R1clRkOExz?=
 =?utf-8?B?MDU3c0xPT1hoWHE0dDRoTnlteDM4OXl5V3hzY3J0eU9EUUFWVXIwc2pTcUcy?=
 =?utf-8?B?MU5uRjZKWUxmZzVVWGhUanUvWG5GR1k2TUM5bTlYYzZ3LzI3NnZLZXNDWVFh?=
 =?utf-8?B?blJoME44OWFGSzRtSHBBYXJIWE5wbnM1NFZQcUtJNkZRa2pBT2hzVnVqcVMx?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fefd2db5-fb07-436d-2b56-08ddb8f56cd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 23:17:19.1448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwtdBOLr6DSXkE1BY2A5I0vN/hwiHAKPuP/uylWoxYTEx6KCOJXH5rLE7sGJUFdj3NwmYlv4shH1uBPNiQ2vHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
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

On Tue, Jul 01, 2025 at 09:40:05AM +0200, Christian König wrote:
> On 13.06.25 23:20, Matthew Brost wrote:
> > A small race exists between spsc_queue_push and the run-job worker, in
> > which spsc_queue_push may return not-first while the run-job worker has
> > already idled due to the job count being zero. If this race occurs, job
> > scheduling stops, leading to hangs while waiting on the job’s DMA
> > fences.
> > 
> > Seal this race by incrementing the job count before appending to the
> > SPSC queue.
> > 
> > This race was observed on a drm-tip 6.16-rc1 build with the Xe driver in
> > an SVM test case.
> > 
> > Fixes: 1b1f42d8fde4 ("drm: move amd_gpu_scheduler into common location")
> > Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Sorry for the late response, if it isn't already pushed to drm-misc-fixes then feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>
> 

Thanks. Just pushed to drm-misc-fixes.

Matt

> > ---
> >  include/drm/spsc_queue.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> > index 125f096c88cb..ee9df8cc67b7 100644
> > --- a/include/drm/spsc_queue.h
> > +++ b/include/drm/spsc_queue.h
> > @@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *n
> >  
> >  	preempt_disable();
> >  
> > +	atomic_inc(&queue->job_count);
> > +	smp_mb__after_atomic();
> > +
> >  	tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
> >  	WRITE_ONCE(*tail, node);
> > -	atomic_inc(&queue->job_count);
> >  
> >  	/*
> >  	 * In case of first element verify new node will be visible to the consumer
> 
