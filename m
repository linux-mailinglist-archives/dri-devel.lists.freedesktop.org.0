Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7CABDCB3
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FA210E52D;
	Tue, 20 May 2025 14:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAOiysXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0B710E4D1;
 Tue, 20 May 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747751201; x=1779287201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kzQbDq12leo86Wok5Xu73lc9xzPvfiWSD8eHZS/1XZ4=;
 b=ZAOiysXjdkJdl2EunW3kf04lxfRvKUHEMjizWGJSC+QolUAqSLA0T51U
 i7TS4iRJDpZvV9tUD3BPSO5BFV5QJrPyI3m3jOm83HLog5Y0FiD+9AHCk
 W1ZkOaaFig+VNmd7yyu1djEtASMW3jJKbFj5TJRalhYf6mihAi63xWoPw
 vPNwuRHpoOs09cPgJdJm1nDi4EjU/EUmrsx0W1J6xB8yX51WVUS/EHEe+
 W38ZSsCe9qCccc44Cgc9bTYu6qNeZC0DuFcRBkXJMRDUXp27+ScHw6Cmt
 WyTHEYF+JWiZiFs5nf3sBKYidtDQOvBdBGmGaetIqvCpkLEAOV93VorX8 g==;
X-CSE-ConnectionGUID: 6NjQfWrbT9a+5WywzB8Smg==
X-CSE-MsgGUID: CAgxWlDtTM6LnDxxr4qJFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49591320"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49591320"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:26:41 -0700
X-CSE-ConnectionGUID: 0y8HKfbOTbOv9Scf22wllQ==
X-CSE-MsgGUID: BHdXQWMrTiifvE96SD8hyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139753234"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:26:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 07:26:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 07:26:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 07:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8mgDPnrW6YMJfjfM23hdbZDoYXMWupDq+G3Umdo8BwVvGV74wywQd+NPYfGEr7hv1aooq7N2oOGFVFDbL9o1VoxLIkCcEEevbUeNSgJh31fyPlnCtDgDIMitiZNUMiQhfpUOEwYJ4Buuhs7Yc2D+R4zyBHtQMUMscGAzVsKRXF7OD0DJ61AaC8LPSwr3NmpozJcUtxiugBamgpsyQHPuf9i6j/IN2v/kowKf0JqDiV4xFpdoBqstJC0iFmeJeysHoVtpiqUUApw1uvb9ahODHFRpK59BKIBxbaTergLu5uALGCqFPmilK1oyWHnOEGWnkpHD+su9gCPuyYKIt8P/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYWP4DosobLnidoXU7D+Wcn7sN5iGPPs2VUJqbMC69s=;
 b=oSDjPzOfR6wtiDcqrPQugRydWvGYU5g/fMFUP63rJLzpzpORkrj0xJWvxI4C8dA/sn2vH2OxepXJ97j0uv5b4wJ2r2WhhcKs4vKJRhvza+eWxPAxnPliPYFVBe5RP8D1kNcLZn/99Iyy2GSDm/8nAoYP51jLfEwGT0xYGX85vmFn0Z4OlvCpZYcd1aXqO2SPdJfqfkHvRXwv62rY2vJSrQZynVGXeXwuTB1czZ27+CczBatwylD4PWqLh5tbzRPL/shllTbb0x9uzAvb1gShX5SHhdUdgDz3n/JAcRwzsNB1lZHoVZyuvJuxVJzGTVWgz7cqTTeQ1RBRlWYVkPDEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 14:26:36 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8722.020; Tue, 20 May 2025
 14:26:36 +0000
Date: Tue, 20 May 2025 14:26:29 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Andi Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@intel.com>
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
Message-ID: <vkqqq7oucncsqeygianyfng25ccgdv5t447qiajmvmskdvljpe@cluu6eh4blpb>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: VI1P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::10) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: b3969814-bedf-4503-9e9a-08dd97aa53c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGNrQUgvaGxMODlQT1R4MkR5OGxsQS90dFYwZnNjMm56WmFOQnpCL1k0cW1R?=
 =?utf-8?B?SDlhdzJTV1pZRGJzQ3pPb1pzeEhTRHgxL3YybCtMTmdiSUF0aDRBTnE0aTRQ?=
 =?utf-8?B?UGtiRVAxNUpuMVNPM3VCc2ROYWFicFkxZzVVZUV1Y3d2cEVXM1hqOUswaUJl?=
 =?utf-8?B?ZzFLS2dDbHJwYlZxVnpNbnBvaXVQcExFdTRmdEpVOUxoN0pFdjk5MHhadFFu?=
 =?utf-8?B?OThBODB2TmEwQ3dYUjVTaElNa1hoY3JNbG9TVmZYY3YxU2VEcVFxWG9LK2Fl?=
 =?utf-8?B?bjlBNE5kM2YwM044c3VHYTFSbFpkMEFhdmZxSXZSaFcwSE1Ub2haN3QzMSsz?=
 =?utf-8?B?cXBFRmdILzI3M1lsQUIxNEN5WGRiRHVPOVR4eTJPR3E5R0JSSlZQZ3ZsWEFV?=
 =?utf-8?B?VkxEZE9yN05oY1V6Nmx0MTZtUGdhT05LT1l5aDREcDhEMGFmWVZZT2dTRFNY?=
 =?utf-8?B?dTlBZG9NZE0rdHR4ZytwL0w2TkFKazlzQXI1SUhWM2FHTThwQ1g2THI4UVIv?=
 =?utf-8?B?ZDNKUytXQXQ1b2Y3V0FWblRyaTN6ZkRMRVNQekFtbXBmVUM4YW05c2xhNFpZ?=
 =?utf-8?B?VDE3aStiRlZkOERlekNBV1dnTUUxM2NXVnBHdVFwcWllOU1SOWR0REFyUDAx?=
 =?utf-8?B?OGN6ZnZOSHFtTXZTZVNDSGFQMkc4VURxVzhuemZZVFM3alB6cU9kaWpxZlZt?=
 =?utf-8?B?SjgzQWZseXRHbkNaL2J0SkV5cktnazFwSDlLaldueGVmVzR1VHlXS2dkak1u?=
 =?utf-8?B?OGtUYk9tRHV3QjVjejRKK3dvL2VWWVZyM2RINm1ad1B0MjZGaWNUdkl4Q1RC?=
 =?utf-8?B?U0ZyWXphYUNta1JqVmZ3QTZsUTA2MDZlS1lEMVBNM1Rwc1hBVE1ZRE96WHh6?=
 =?utf-8?B?bkMyTEdjcmFNb1RtVUNCQWtvUmt0VEsxNDF6VU03dDhuVlYwNUZyYTdCb0JI?=
 =?utf-8?B?SlhuVVVXbHNVdVdvWXZ5VDExWEFYaDR1Wjl3UUgxcXBDMjVKRS9LOElPTnFt?=
 =?utf-8?B?V0JEWHM5bnVMS05RTUJkMVJXNjlVS1RsN2FxVCtQUFV4bjJLS05tc2ZmVWlS?=
 =?utf-8?B?NHlBLzlub05JNTF4R0FvYm1WMjNpU0dKRVhvSHdiUERtTlJPMy9DaktoaDQ4?=
 =?utf-8?B?YlVyZnNpSS83eS92ZldKdWhUUkRCMXAxM2FLaUdNQXhXUU9xa1VJako2aUdD?=
 =?utf-8?B?b2h6b0ZPaVViWk9acDI4MzlBeHcyamRvendxSHh0TE1MRm1kNHIxRGN2VjJq?=
 =?utf-8?B?aCtOTUMrditkQXN5MmJQTy9NVnhEamFFa3I5NWJ6d1VaVytXcEphL3RLdjUz?=
 =?utf-8?B?dld1NVlVb3NMaStNRjhacmovM0p5WDQyTXZ2TE9EYWFVcXdXamNGaGU4ZXhx?=
 =?utf-8?B?amh4NmhMam5aNHFOVzFkdGZRbk02Nm5ON2M5UjJsWm1JUUVITDFmc1doSzdT?=
 =?utf-8?B?T05nRkpuUXQyai83WlloOTYxR05ETE10OU1BMTRkaDlUSEE1MFM0TDJUcW5K?=
 =?utf-8?B?VGtNb3BwK3VwYjZ2aFdOMTByTWlEbDdzN0x1RXRpK0hFRFZ6TGRMc29LZERi?=
 =?utf-8?B?OGxwTnpVbXJNTVM4SEpkcWNDaWhLd1NSWUkwNTFLdk1RdlRuNEwyVE1kSFZJ?=
 =?utf-8?B?MFZoMXZDU3dwNTV6T2NQYzZpSjUyQzBubktFdU5vcllnalRIMTJoMHdPcFNT?=
 =?utf-8?B?WkNXWGt3RWZDcG9OWkFEUFkxOHEwMmxpYnErQWErVHVYYzNMcVA2c2wwNEdr?=
 =?utf-8?B?b2hibk5uUTdscEhMbitLS0VhMlNQR3VZOTdENUJnMWtjV21GVGplSnB2Q1Fq?=
 =?utf-8?B?R21TZXJ2WThRQVo3S1FwbjVGK2RRM3ZDNk9xZzZDNEZLaTlWN1djWCtRNW1R?=
 =?utf-8?B?ZllEYmY4SDVlRmw2aWE1WUYyMEo5UlZnV2t2V2swMWpEM3hpV010QUZheDJS?=
 =?utf-8?Q?lQCRc+DLWFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ako5OURKVWhQMWV5dkpYKzZZMWZIKzdwaVlBMG02eTFCdklqWGpDb3Y4UEVT?=
 =?utf-8?B?cmpFOFBFZ0hEZGt6WmNSRjB4TWNBam9QTmxDV2ZHSXhDOWRDeXZ0STZxbjg5?=
 =?utf-8?B?ZE1rQmJESDZXK0FHNVd1Q2xBckk5RFFIa0hGbGNrOG1zbkh3MmYzdnIwVG1O?=
 =?utf-8?B?b2pmM09pSGQxcVVvWXR3cmdYendBUFRJWmoxdUlDdWQwMDFId21FWm1ERWxG?=
 =?utf-8?B?OURXTlVQMTI0QlhzQWt0SkY0S3VsOFNhUWE1b1NxQzZoeS9NVzJpb0dDTDJX?=
 =?utf-8?B?MVNWemJacE9jTU43Zk9GRTR5bWwwZlNMZEhIUTAwK2MrNTJMRGY3ZVJWOGZ5?=
 =?utf-8?B?b3BXQ1RwMHlaM0k4cExzMjA0c3k5eXgzaXdxUnJVR05MT09Yb1phNUswZ2VO?=
 =?utf-8?B?N1hneXREdTN4WUx1OGJ3U25ZWDBTbDJPaHdVdEZaOCthdmIrdDZGREVzaWdM?=
 =?utf-8?B?cTdPaHRDM3pIaVlORnE4MlpwV3NQdWNCeW84ejdTcXRFRjZyTkdYM050RjZQ?=
 =?utf-8?B?QVROTWxScUFIL2UxbGREa1dWNzFmT0liL0VFNVd1amI3bG5CRlZ3WUx0Z0xS?=
 =?utf-8?B?cUR0WWtWNWc2Q2FxWWM5UHFUdWhmNnREa3RKd0hZNXljRVEvZTRZRDhZaHB0?=
 =?utf-8?B?WExMcllsaUNEY2xlb0RyelE3azVDYWVON1VqakRXQXFid3ZqM2NteSt4OTBR?=
 =?utf-8?B?N0tUc2RUZ242YXZlZkZ4YlJBR2t4QXBnNWRQV3FadDBNMFZpVDVnZkMyekNv?=
 =?utf-8?B?MWJBdCtNVGgzc0FjdFpEaW1vQ2h5T3ljNnV4ZWtOMU91anJiSE1DR2xFY0ps?=
 =?utf-8?B?ZnpGc3F4Q0h4ZjhmWE05YUJSWmZDelhSZWllWHBtQUpMUXZoTWFZYU5RL1Fa?=
 =?utf-8?B?MEZuRk5XL2NSNXU3dmYrTGRuOGRPUW9VWGdOT3N1elhRS3V0cTk3Wi9WdkZ2?=
 =?utf-8?B?Tld6MDF0MHVvT1pQd0Q2ZmVObzNaRFMzYW9JK1hMYXpjY2dHbG16OTRVUnBk?=
 =?utf-8?B?YnY3NFI4ZDJBbjRSTVo3d0E5UEJHNGtPelFrQVNETVhVY201cndUdmxjaFdJ?=
 =?utf-8?B?eVNGaktGbHhrM0p5VzZhSStyN3FPL0ZyM2tsKzdVQ2VIU0dNVWRKa3BRcHBK?=
 =?utf-8?B?S1hDbnJ6VTF1UHNlakpTVkRvZWVJVU5KUUZwTlVFYjFjMW1BeDFEY0xQMlRX?=
 =?utf-8?B?U2Q1M1NXRyt4Yk95b1ZCcVJ6M2MraWxsRW80VjZXaUdJbjIwZmVzL3k5eFBD?=
 =?utf-8?B?YlpQYSszaExUNktkTUNkQURCTzZ3UWdsbkpSZmxwUUhKcmsxRWd1S3ZPN3FL?=
 =?utf-8?B?OTdHT0Y0U253RHVTWEluQkNHRGFHVWhadkRZVk1ubFdVYURBcndQcG93Y0hV?=
 =?utf-8?B?TDl5NEZOTU9TNHZZVXBRWmJ5MFZJck96TWJ4dnZyelNqQ2xSVEJvUmVGRkdu?=
 =?utf-8?B?aG9QZU9DRERHTE9tOUdZMHdaTjJtRS9UNGVKTmNHVEx1U0hHRDRmMk1XUmRm?=
 =?utf-8?B?T24xQVJsalNrT1dMUXVCVXNGY1dKK1ZIcU9QY2FudS9OUC9Ba09RdDJIVDNO?=
 =?utf-8?B?TDNnMG16bTI4Nyt5WXdEc2N0Qm9qb2JiWWFYaXRRdjYrQWxOL1BJV2NGL25Y?=
 =?utf-8?B?NWhqcjBtbHhwWWZyaml3WmsyOUpyblZRNjdqU2tIbTFXVVQ5MXJrRHh1bTBk?=
 =?utf-8?B?QStHWFlhTDlCWjF6VHB0K3FWOHJEYWc1Q2xjd3prUFNBN2h0YTh4bnhVTEdn?=
 =?utf-8?B?QmRmK2xKNldNVWNoNVd0alg0M1g1RFNkREI0NWN3MVNEdXBRb2w2UGhPRW1V?=
 =?utf-8?B?clpNV1d1cFMyMncyQ2RSc1F2SVIzS0VyVk5WYzJIUWg5S3pZN0hIM2g0WmM3?=
 =?utf-8?B?ZDRUUzJUWjU4eS9KNkZzSHVWd3BqYTMvaEFqWlVLWkRUNkt3NVlNMFg4WHBu?=
 =?utf-8?B?dCtyS2kzc3R5S0hObkF0YzNBa1FoRUd0aWhqR1VmRnJuSzJaYWRnckIrc1ph?=
 =?utf-8?B?Nmc0alFkU3ZGK2dtR2hkd3IzZE1LOU1SR3RaVlJBOGZpUVh4b1lBZmMyZnlW?=
 =?utf-8?B?QVdFcjE3TWJxbTN0ai94UTJVWU1NcGpGclRCQ0p0UHRIV0hlR0cxRno0TEhi?=
 =?utf-8?B?Vm1pZnlTVmVpdDFENCtwdUJNNnJzMiswRDNZU2hOZHZUeFV0Y0N2SHhPNzBy?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3969814-bedf-4503-9e9a-08dd97aa53c5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:26:36.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4gSA4s6uWIN/zomucsd6HvVzGOCAAaYGazQ1xoqvxJYp272L/dGa2DfsJkmBHf/dcD8Fypnr26xJ2v0VOjfq4vtLtfRy/TraahkA+lyKuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

Hi Krzysztof,

> This series introduces a way for applications to read local memory
> information via files in the sysfs. So far the only way to do this was
> via i915_query ioctl. This is slightly less handy than sysfs for
> external users. 
"So far the only way to do this was via i915_query ioctl. This
is slightly less handy than sysfs for external users."
->
"So far the only way to do this was via i915_query ioctl, which
is slightly less handy than sysfs for external users."
- otherwise it might seem you are relating to the "sysfs" approach.

Best Regards,
Krzysztof
