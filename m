Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B8BFE73C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB6310E1BD;
	Wed, 22 Oct 2025 22:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1MfSJLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1885110E1B8;
 Wed, 22 Oct 2025 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761173407; x=1792709407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ElXEqphhiycS2VF/r1BixRYU6Fsikfdl3yEZPXNU5mM=;
 b=J1MfSJLthnVbdzOhlVGOgZAdGAdx12SFqyV7HneRrA2uUL3ufi/igh0x
 QdWtZHU77DAEAvF7B52aTdKeFT1t0NNq0SbtAmjbr9OUTKgPaiM8HiZZH
 j6CnHTidXFU+5oSoZW2i4krgOq9PyoDi5tnoWBvvtSuRp+FIMOM3t4S9j
 O0cFHgXx2XRlVxcjSj+ZQ1mH5vxkxA8ppfGWY+zMJqy5UpZSC7ECAvkmr
 lb3Bw8u7o1H6/bBh+12QeKiLI3fULrf2JpFPX6rqhGwPAQ4lpjsQEI8+m
 pSPj72ysGJVnIG7Jcq/gRiqvaMpZf3SgVL9tVgyFQTK7V1XcHszt2ioSi Q==;
X-CSE-ConnectionGUID: FzYNvdEOTOme1XLOUm5Tgg==
X-CSE-MsgGUID: BzsDI7qbQv2JB0hTquEjMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63480908"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63480908"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:50:07 -0700
X-CSE-ConnectionGUID: sXolN00+QoeUOGYl8ipqMQ==
X-CSE-MsgGUID: YscShUl8RfqpEgbWPdQFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="221186874"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:50:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:50:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 15:50:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:50:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpxvCpRl2MfMu+wleq3icRFCjnlOo0AuWCGSWI5BO224D99Qw1LSa4qhzAXv7Y/8RhhuxneyuJE7p5+LISU59EZ7uO0Dm9YTZcOVRE34L/VMvxTlq1yuRS1vE9+mBpAH7m3RBRdMmNIEgccUsB1jq4EhADKgZYKnV7+zDqHKTc6dX82qfzxBG2fbpo7cpkHWserd40j+HN2Oi4mTAg18HfR/hxVOCsnDG7jKqmmwUF65tOhvkHHZOJJh7G2xcVCkTh6i+/JKFmJpJEQVSOqjE7T3SOmDakHWbJNmdrto0IccUi8MbhxIILYYO4+4PJXG2sk8NXKZS+7z6gtbIuxBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnUcPkmqc8UMVvIAUcq696M4RCPFBIOtZdH54qCTqKk=;
 b=yTYl6qly2Ad4jJdC81EVCOSg57fvIrv2tlzbM5rqKXnEKIWtlCrogR7aBdypLfDQxakRRE6Kvi5LWhH67DAVgRMgLG/CdAu5Fn4acJnd/aDSLqK9XBve9ezbcXoiH4ZiXJ2/Mlw8bpeUduYWUqm4ytTzDJXLg0F6EtAmG16NCx95cm5A6TYb5kvC1xldxhwxzY+JdAtTVLD8VyojFMTyAUzYL7yPlAtiqeeupxpkAYUfvFmCNvl7aIegbDVgstcZDhQpkKqOWRhkJtsoSV5YPTOJ22bDfvLBWdqJ3gYhjcOL9r6qSK34uOkI3GlXIAmXPBIAEYgcUpexec7kBk16Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 22:49:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 22:49:58 +0000
Message-ID: <5ad84261-fead-42ae-ac6c-8ecf17db7462@intel.com>
Date: Thu, 23 Oct 2025 00:49:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/26] drm/xe/pf: Add minimalistic migration descriptor
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-8-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-8-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: b3bc8785-a990-41b9-01ef-08de11bd537c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QytIYStwaDB3VEJkNXRlN1dLR2pJdHhTaTNWSzFGQWlIcEJQc0thSnZXenRn?=
 =?utf-8?B?cDlBSjRpWEMxUUVqcFdQbVQ5SThFTmtHeUgwdTdueFJNVjdtcEpVSFF6cmJC?=
 =?utf-8?B?MCswWjdjVWZtMys3d1F3U25BZVg2cHJ2M2JOcTFWVEFSb0xLNG1ySWNZTzF0?=
 =?utf-8?B?Z2I3VWgvM29USjZrM1dFUlgvZkdsK2JTc0xUTWEyaEF2WnhuTDF5MVh3Z0Ja?=
 =?utf-8?B?Zmd1Nm9UUDM1Ky9DY3I3YUk5U2ZmUjFtbEs0OVdzbVRxTWJGZWxBQkgrSFNp?=
 =?utf-8?B?QXpwMG5kdVVqN01sMEJGMEc4cXJ3dGVpelR4UWhrUkpLZ2htdmpEajA3V1d2?=
 =?utf-8?B?NGdWYVI4Mks5bmNSK1V6cXEzM3lvQTZzZGlLTUpoSjJuZWo0TTRtV25IcUtG?=
 =?utf-8?B?c3dUaEl6OExNMmNCbUNaRDQzNXRUL3dEQnFWMWtyMThsclp4RXIzeTZIUXdS?=
 =?utf-8?B?a2J3ZC9HWDNSWXNGL05sOEVMbG5QOHpQSXA4SGFpMmRpdFBVU2phQ3FQdDR3?=
 =?utf-8?B?RVNlV0UrQzAvR01WL1ZPRGd3OHlROGxRSlp3ZitTNzI1YWlveG11K3lmelNS?=
 =?utf-8?B?amc0THBKTE1qWjgwTmpGQmNZU1hzRW8waVJaT0FxZURObE0zRmF3bkJwYTFp?=
 =?utf-8?B?NUlGR1daS3NsRSswRTlNNnBubjhmMzVaYmtEK3c3WFY1U3ovdTByMUhRcnll?=
 =?utf-8?B?bXJJRllpOXovbXMvaE9RN1VNbjRWNHpCWDhDakxKWjU0dFkwOG9BZTdlZCty?=
 =?utf-8?B?QWt3RjFUNVZ5ZC9FRGpJdDErTjNHdU9XdC93dVZlNTlNT2VqLzB4NFJ1ZE55?=
 =?utf-8?B?dE1KZ2IwWDZqZ09pbFRsTiszamF4YUd4c0dmYmdETlBPbXBhYkEwUWJqNzIr?=
 =?utf-8?B?ZHRrWXBrYWhGM2luRVMzRVNnSldCdHN6Y0Fhd1RybEZGcDNDQXVWeTBRUk56?=
 =?utf-8?B?cUZBY0FHZktHOFBFcHhvOXEzU1JzaXp3V1RWMU5ocXdYUGJ0cVh3QmNmVXhE?=
 =?utf-8?B?MlNiM3NiZ3VwQXcxdThRSjhwT1dWZzVBM1R6cUZ1OVRFRTNOMWQ4WVJyNmRR?=
 =?utf-8?B?YU1ZalRVZVFLdEhWRnhFQTVqMjhFOGpFSTlqOSt3SlpqaEQ2SmJCWkh1Tklo?=
 =?utf-8?B?SmlSZWZOcTVIV1krVnN0eUxRQ1liREIzY3hIZGFkZzVmam1FaCtLaFFmZERT?=
 =?utf-8?B?WllybEhQME11ZW1PSm9zdlVkQnZPenltU1VnNm1HcmplQXYxY2VpRFZnTE1Y?=
 =?utf-8?B?S0dJcER1cTVxSE1tQWt1TDhTUWdnMzIxeFZ3WUFhNlJzNU16OWhEcDVLSG4x?=
 =?utf-8?B?Vk0rWlR5RU4zYWtoV2NVVDJFOXlCeVlMR1dOVGttYTQ4RUh3OWlrQ0doR0NX?=
 =?utf-8?B?WW9JMDNCWVpXSlZHM200WUUvUEV5Ly9WVHJqclNGdElpeTRMYUhqOHhzbUN5?=
 =?utf-8?B?Qk53MnorTXh4NmgxN0hta3RrQWw3T2U1OWxqYXloc0NJUkEwTDJBakdTWUpU?=
 =?utf-8?B?Z2NueHgyejRiQ05zTXVHd0RNdVhLYTFXN2FmVVAzVUNCdGdSLzB6WU5heTd1?=
 =?utf-8?B?V2VWemRRays2SC9KZlFZZWUwMDZwTWRXa1ZZWlhEc1hxZTRZeE1maHk1WWlO?=
 =?utf-8?B?U1dWaXFGTHRzQzhjLzMwNVFQdzJlNGg3RlBXTWtHaSs5VjVyLzR5aW5SbWwv?=
 =?utf-8?B?Q0N4RTFFUHNtVi9pVkZJaWFaNis3Y1E2R3RlSy9wTWtUWkNoTlpSbm5MdUE3?=
 =?utf-8?B?SzRLTjk3OGJKQVlFS0h6MWUvdlMrM1ZVeGRzeWFEWEdqcWUvZDJvaHplVTdI?=
 =?utf-8?B?MTdnL2pWNmIxS093RTdqQ0Yzbm9ZWmFYNkZCM29NT3NEcUI2SEpCTFFnQmRC?=
 =?utf-8?B?Umw2WExkemptSEF3UXlkdWdvRnBLSytJd0QwNzRFYW9tK1Y2ZWJFQm1hSjhH?=
 =?utf-8?B?NUYzb05VL1BGNmIvdUwwNEtvQXNVclNBS3B6WnIyb2d2SmVidTQ5Y2NBbTcz?=
 =?utf-8?Q?PnuLoHINeL0MKNsH9QDv76dS3c6jp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFpZMGljMnVCZ0g4L0RWcjRjTll5UTZPSnpud2g5b0Mrckd4RjlDWWNCL2tl?=
 =?utf-8?B?MlhxN1MzUG9WcGtrcEJSS28xcFFyUEVzdUdydjNtUzhrUTdZaUdVczdTRmVp?=
 =?utf-8?B?ZlQ5WkVMR3hQZ2pERXUya0xVOXY3Ty9QMlYzTkVaOXhjMTBlRmVnOVZuYVhZ?=
 =?utf-8?B?bWxYVVNZVlFYdHRkT1ZRdFl5a1dnKzUzM2dIb0hQcWExUzQwSCsyR0JQMzd4?=
 =?utf-8?B?WDNQanorTFlhSDFXM0I3ZGRrTXVOU0hDRHYrS0V2U3VEK3ZDZkZQaUgxc3Y3?=
 =?utf-8?B?OHBuWDJmcnovUXNmNm5oUzdJN2g3YnFCUm9TTEpwOUdBekVOMmh4V2E1bGYw?=
 =?utf-8?B?dnlYU005RWUrYjBjZStyNE1NejVEUk1hcVYxM2tFNFBmV0U5QWJRcVFXcnh6?=
 =?utf-8?B?SVNIK3VQL0w5enFBeENxYkhPRXp4ZU5IaW1zN3JiZFEvZks3SzY1bTE0K0FY?=
 =?utf-8?B?bUtiemFmV2tZQTNiVWcrNFVvdWRNdmIrTWlxQk9JZE9oRXNzaGJyQXhZWWhB?=
 =?utf-8?B?cHdSQ2JvbE52dG01WGRCUVRJNHNleTV5a29WTS8xQWt5SGlCS2NkV1BzZ2VG?=
 =?utf-8?B?WWkyemhVME5rOGZsT0ZCa3Q4Wml3VHdxN1czRUp6QzM3N1JlYjRzSWNtVll0?=
 =?utf-8?B?WFoxTmRlZkw0eEVxS29GeUV4bHRsdlFNczBPSWNySjNFK3ZyVjl3NFR2RkhP?=
 =?utf-8?B?cm1BVno3aXJmOFhYWElvMTNIalk3MW9LVkRkVWUwWGZmNG5IV1FvdXE5bi9n?=
 =?utf-8?B?K2dGMzN2MUNJZVR6OE8vYnVQMzRhbmxoVWhXTTQ3NjBMRXdYZ1BHeGdMNGt1?=
 =?utf-8?B?VlZ1UUZBSDdoZTJwbDdSV0dKZnRadVE3VzNlRlU5TmlEVzFpZUs3elVLaTRa?=
 =?utf-8?B?Tk5yTkFuVi9ld1A5c2hWNHE5emNWT3FocFMwV25ZcjJrTDlRTjhmTlV3WEpP?=
 =?utf-8?B?OEViKzViWGR0QXZqZ2FVYmlINFQyZmJKbFY2V1B3enlqYlZ1enF6Ni9pM3pN?=
 =?utf-8?B?NFlRcGIzbmdCRHNHRy9ubVl2bXNCNnpiUktnenQ1Y2pVaUViQ2hKMUNUdW5y?=
 =?utf-8?B?dWxYOEhxMmZZM2xzNHlYdjR0RUpFNW1WbjlpanZOazdRZStTWHZld3loV0p0?=
 =?utf-8?B?Sk1iL2tvVUNBYkRWL0cvRWJZSEZ6QmJjQkF0bFhTK3g2emt6eEhzYUJET25Z?=
 =?utf-8?B?NW1IditlOW5pS1BObzdXNmdoT240T3Z5emkrUE43bG0vbXErZWhia1VwWStz?=
 =?utf-8?B?TmJVQWJqZmhDNGxTdDNaZDlrNFBBNnU0VmZGSkM3M0huY0I4bmFBL3d5enZ2?=
 =?utf-8?B?QlgycUJya2RPRldwMFMyVmd5cFE2VWNqT0FkVzM2SUxxS1lDREwwTFpnVTRt?=
 =?utf-8?B?ZjIvWWpPaHFuWFNneStmRGRYUG5MUnJLOUZ6Z01Zb3VlN1dpUjhXNVJmMVBh?=
 =?utf-8?B?OEM2RXVpN29BRDR3Y1h3bGtQditld0VEYm9hREJrQmc5S0JGbHpIVkpaRnAx?=
 =?utf-8?B?V2sxWm5UVnBKTWRMbUgvbXJFN0VjSzZJbUFFWDZGUzlNU3JaUitFa2cycFVJ?=
 =?utf-8?B?UTcrbHBDZDI0ckRCSldaWUlrd0hIV2plNVFCVXFJWTVDNENIOXZTTTFGa05o?=
 =?utf-8?B?TUplVHkreU5ZKy8rZUxXbnFOTkpwMXgwTzVuemJTTGRKeXcrRkY1ejZsSmV5?=
 =?utf-8?B?L2dhSUEwdmRvV2RpTld0WVpQQmVobDBiazVDbDl0R1QxbVRXOTIzVFVzbFcz?=
 =?utf-8?B?eFhKRGdmVHQxelVMUXpnc1FRbVJoVTdKak5kaGxqWDNmVFZkVCt1QnJpdThV?=
 =?utf-8?B?SFZNTFpGWHl0RlBRSVd1UEs0NGZPNVhJSDVKVzMzNXRNcGRYcjRPMVpqaHdM?=
 =?utf-8?B?V0FMMzFLZWI3amR6WmJuY04xZ0QvQVA1N2FvK3o5eFBMdmw5Vk55TVh5bkxy?=
 =?utf-8?B?TytNRVl2Sy9ERjJHQUlaZUpkalg0ZDhHNFJOaWx0TkpoajBDNjZDZmJ4NFYz?=
 =?utf-8?B?VU52OW9HeXh0NXVuV2w2ejd4Uktnb1ZjNWNucSsxZzVObE9Cb3U2clcybUp6?=
 =?utf-8?B?aU1yYm0yUXJFODFhMytObmdrdFVxakdySjdHOE13aEorOHhXWGN0U1dNQnkw?=
 =?utf-8?B?ME1HNUJEakcwamgxdEZCU200R25YelFMQWhLTHBHb0l5RHFDcWc5S1hyZHZn?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bc8785-a990-41b9-01ef-08de11bd537c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:49:58.2457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUjobnTfTqFVdfGD1uTmvrgGV9Ifw/IxAf9Bd2H+kWEug5nftC7ZpsM0SwhLpK+7qVB3sWBfkJPXDcnUwvo2iinIqvwxSuZhmXiepSIgT6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> The descriptor reuses the KLV format used by GuC and contains metadata
> that can be used to quickly fail migration when source is incompatible
> with destination.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_migration_data.c | 79 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sriov_migration_data.h |  2 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c   |  6 ++
>  3 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> index 4cd6c6fc9ba18..b58508c0c30f1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_guc_klv_helpers.h"
>  #include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> @@ -383,11 +384,18 @@ ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
>  	return produced;
>  }
>  
> -#define MIGRATION_DESCRIPTOR_DWORDS 0
> +#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
> +#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
> +#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
> +#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
> +
> +#define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
> +					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
>  static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
>  {
>  	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
>  	struct xe_sriov_migration_data *data;
> +	u32 *klvs;
>  	int ret;
>  
>  	data = xe_sriov_migration_data_alloc(xe);
> @@ -401,11 +409,80 @@ static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
>  		return ret;
>  	}
>  
> +	klvs = data->vaddr;
> +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
> +				     MIGRATION_KLV_DEVICE_DEVID_LEN);
> +	*klvs++ = xe->info.devid;
> +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
> +				     MIGRATION_KLV_DEVICE_REVID_LEN);
> +	*klvs++ = xe->info.revid;
> +

maybe add assert that written KLVs match descriptor size?

>  	*desc = data;
>  
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_migration_data_process_descriptor() - Process migration data descriptor.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @data: the &struct xe_sriov_pf_migration_data containing the descriptor
> + *
> + * The descriptor uses the same KLV format as GuC, and contains metadata used for
> + * checking migration data compatibility.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
> +					       struct xe_sriov_migration_data *data)
> +{
> +	u32 num_dwords = data->size / sizeof(u32);
> +	u32 *klvs = data->vaddr;
> +
> +	xe_assert(xe, data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR);
> +	if (data->size % sizeof(u32) != 0)

no need to compare against 0

	if (data->size % sizeof(u32))

> +		return -EINVAL;

for other errors we warn(), ok to be silent here?

> +
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		klvs += GUC_KLV_LEN_MIN;
> +		num_dwords -= GUC_KLV_LEN_MIN;
> +

you should check len vs num_dwords here

> +		switch (key) {
> +		case MIGRATION_KLV_DEVICE_DEVID_KEY:
> +			if (*klvs != xe->info.devid) {
> +				xe_sriov_warn(xe,
> +					      "Aborting migration, devid mismatch %#04x!=%#04x\n",

likely %#06x, as you need to count also "0x"

> +					      *klvs, xe->info.devid);
> +				return -ENODEV;
> +			}
> +			break;
> +		case MIGRATION_KLV_DEVICE_REVID_KEY:
> +			if (*klvs != xe->info.revid) {
> +				xe_sriov_warn(xe,
> +					      "Aborting migration, revid mismatch %#04x!=%#04x\n",
> +					      *klvs, xe->info.revid);
> +				return -ENODEV;
> +			}
> +			break;
> +		default:
> +			xe_sriov_dbg(xe,
> +				     "Unknown migration descriptor key %#06x - skipping\n", key);

also print len? and some initial hexdump to help with debug?

> +			break;
> +		}
> +
> +		if (len > num_dwords)
> +			return -EINVAL;

this check should be earlier

> +
> +		klvs += len;
> +		num_dwords -= len;
> +	}
> +
> +	return 0;
> +}
> +
>  static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
>  {
>  	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> index 5cde6e9439677..e7f3b332124bc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> @@ -31,6 +31,8 @@ ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
>  				     char __user *buf, size_t len);
>  ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
>  				      const char __user *buf, size_t len);
> +int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
> +					       struct xe_sriov_migration_data *data);
>  int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 029e14f1ffa74..0b4b237780102 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -176,9 +176,15 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
>  static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
>  				struct xe_sriov_migration_data *data)
>  {
> +	int ret;
> +
>  	if (data->tile != 0 || data->gt != 0)
>  		return -EINVAL;
>  
> +	ret = xe_sriov_migration_data_process_descriptor(xe, vfid, data);
> +	if (ret)
> +		return ret;
> +
>  	xe_sriov_migration_data_free(data);
>  
>  	return 0;




