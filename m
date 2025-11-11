Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7162C4C21C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 08:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6A910E33B;
	Tue, 11 Nov 2025 07:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juo1IjWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534F410E32D;
 Tue, 11 Nov 2025 07:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762846604; x=1794382604;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8i4BUc6QZvW2dSz1RXmTntPffz4App0HuM/sGPC5/Ps=;
 b=juo1IjWtk8jNgH9Aao6KgLbFZYDJPWOC1RUHRpR8X15UZkKXGr6qnZ5a
 06uR0FEtcTj4JMtN1SydXfAf7pKgHR7s1m4XtiETHfb9lD55/cfI4ErqI
 wO7XzsU6C+4mTlCTGBYr39rEA5khbIvP7RnzkYiDa40LttK4X6RATR5PT
 yd/IGd96/dhKETaEz8JmOnSpg2Jy20GM+9U3arRk2aUKIvjFsIayG0Nnr
 jISHEwnQMvLsPIh87ge8cCqYJHokUi1zqTXF5BTVA7J9ecv7H13PwcI2F
 xNIyciw7AGrt9z38xVi4Lg/lVYHcC+qC+DZcx91+D1klmXSMZXgKnFyBY w==;
X-CSE-ConnectionGUID: PtWTKjZ3TeiYfG0aFEt1Yw==
X-CSE-MsgGUID: PvmfvBo/ThmbtRCSioG8mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82534039"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="82534039"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:36:39 -0800
X-CSE-ConnectionGUID: ZhnohbXfR0WN0het5gS+mw==
X-CSE-MsgGUID: JnP96+I7Q1G2B0AR1LoQEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="212286345"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:36:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:36:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 23:36:38 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:36:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blNTpqorMkPC08vLTnqRZ+ShdbBrMjsUhuefMQrfiHQq6rIzg4eGHyf1WYs4dpb+FTB7g2IoPuJ9w1UR1VkYoYhfJyVBUAY2aBxv9B0mzpEOje4FOi7Wb51tINsA+sdsSRP6Ks1SJvsNteRXATqflUnoh+PwHL3MPfeM5NPIP3jFxoHhx5Pj0XMHvqwRbAsdfxD3Q8y3mUYYHpUxytWty1RRLbszT0aV5TQStwi3w27hsbrzGQSVpETP3ltwVVsdCpgLZ5khCny7WXhKg8QwK7aO9RpMvRXccV++0xxtGIhLI9JjGTkSLQdYwrbJfHuers5dlQ60WkoWZjOxXeLhxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg9cCWcdGcfSvq3b54hj9ddeMAtKdj7rcVOAS7Thayc=;
 b=opecq7kHhE96Q1IZGrzIOTyc6dQHi7vLqKTQNs2+fP7jrB20vH9B8TUkZZheaX5/jYda4cHm20/hmgxzk5VO7lRKNU2YzuoKdWXhUtgNdEqYu9+SaFwqXWhRphZ28Thh9GwROc6hXUb2jsDWX+38yehY3eJfMVh+4OaV/htXjJ7rFDPRVnElzCmjiFFp60mKwMZTnYA9lBPf67ZxeyHkv9cwh+uCsyKnOOa2GNUzehc6rES9BaHeu/juOM7Z12v/qvDUAvRX5KQ+/9xV3970Ab3pQVwZg2w/2xT3vzHWuvTqWXUXlT4fTrJ58SWXafPxZjwJVdF9L9Qd5Um2JKp0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:36:36 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9298.010; Tue, 11 Nov 2025
 07:36:36 +0000
Message-ID: <b23bafff-e027-46d0-af73-6ed631db3f86@intel.com>
Date: Tue, 11 Nov 2025 13:06:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 00/10] Introduce drm sharpness property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <nemesa.garg@intel.com>
References: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
 <aRIuBqnYeIhsemHD@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aRIuBqnYeIhsemHD@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: b152f157-a5df-4677-8d06-08de20f50b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2VHY214cjhXZ01QMm1TbFB0UG5JZytpQWhOVUd4MFhWaFFiVzMxMzNod2JF?=
 =?utf-8?B?TDFlMUF6c09zOGYyUERPQ2VORENkNFJJOUVtN2cwcDFBUS9jR1liVjJad3lM?=
 =?utf-8?B?dkp4QldmajVZVTBEWnpydEZnWVFxd3lPMlFsY1UyREZ4MEE2SElhcElDb0Vs?=
 =?utf-8?B?dFFpUmdjcU5ycHlkMUNKVSt4dTJzd29CdkFqOFc1cmVhVjltZjVMNnZMZUdV?=
 =?utf-8?B?VW9xd21POC9OVlZqaG01YU41TmM4NjN6R3hvVXU3Ukg3NlNROUw2eGVmRDZj?=
 =?utf-8?B?bEJJaVZ1SUdIaTZheDB2ek9Pcm5vZmFTVk9wVGNiMHhSM1BhazJkTURrQlFy?=
 =?utf-8?B?Zmo2TUE3VEN4UmtiTm9xT3U3RUxjcE5mZXIwbTd4SEtnM2wreWJWQ0w2cVBH?=
 =?utf-8?B?QmxISmtlYWxvZVlUTWp6OWNMYmVFcjRBK3h1Qzd0MlpONkNUODVrWGlYaE0v?=
 =?utf-8?B?dWFrUmlwUWdQVHU3QVo0cE8rQjlBM3ZjQzlranZYb1ZxUGc5V3NPWEQ3aUY3?=
 =?utf-8?B?Q3diZXFkYVB5U3NUWUUrcWh1R2dvakR1TmNOVmxsYzVOZ0ExWWo0dFc3TjRB?=
 =?utf-8?B?NDdBTXB3TTBabzVyN2krWW9kUWRHNUhHa0xIVmlrQ3hIdE1rMjZZeWZ1YTdR?=
 =?utf-8?B?aXlnZTFId0NZNXpicURnT1dXL0FONllXVEkwbXNNaU1XM3hzQk1jU1ZMalpJ?=
 =?utf-8?B?RTVTMXQxOHJQR0JNWWk1dTZWTU43ODA1VlNCU3ZYcVhweHJHdHkwdDhRQmhZ?=
 =?utf-8?B?UGRuNXdVeE5xRTNPTmpvalpCMFZ0WTRVMndLSEh4NVlTTjJ5V0NNbHFTdjl1?=
 =?utf-8?B?a3oxZUJuRkRnbXI0R01aMFNpbHNHTy9kMHF1N1NLaUY3TGZiSDBBb1ljS3B6?=
 =?utf-8?B?UlhYMUloTFBPcUs1dkdYQjAzZldYRlphUTV2dHBmYTEzWE53UGhSZGpOZ2NT?=
 =?utf-8?B?TkRzS1BrTjJoOXY5aElycWJXTUFhSWJRcmNuY3lBQk5rUzZBKzBLamp0U1VD?=
 =?utf-8?B?OTUxNTdzVjEwNDVQcnJ4S2dDRmZXWmhZLzRWczZlR0lTd01vWEpseExYNVdR?=
 =?utf-8?B?VXNRYUNQS2UvUmFkRGx2SENQN3BmN1hrWGdLNnZWYmRPMnlDWkg1UE02ZzVy?=
 =?utf-8?B?V1lOdWhHUUs2TmltcnY4OVpjSHRHZkRGMExnOGc4ZTJnak5IanpUZ3h3QWhG?=
 =?utf-8?B?Z09sblFkdnRiOHIxWVVZR2t2Z1I1MjJNaHpKaWxkemM0YzYyOEh6Qm5pKzJm?=
 =?utf-8?B?bVVZSEliYmE0VHYwK2x4T1VHKzVnVXFPSnBhQ0lBa2kyTDcwb1hRbEE3NDJO?=
 =?utf-8?B?cytpVmIzVkRXSXA3T3dweDYrQ1hwdE9uakRqNHB4SGNQM0FEWG5EWE1NdVdR?=
 =?utf-8?B?Tjk2MU83bW1mMnBjakp2d2RieXE0Q2lkYlpTVVVTUWMwbkpHTmVhT1ljemZp?=
 =?utf-8?B?MmQzOW9lYTJETXFjeWUxQmx3VmhGUTJKR084WkpDUlJhMXNtWkFFTUhlMjFI?=
 =?utf-8?B?NEFrQkk1VUt1a1J2UUt6SjE3aEhuMDN2aXJUdFlac3JrdFU5anR3RUNlSGJO?=
 =?utf-8?B?Q1BCSUNtak5QTExSWG8zVWYxNVhLbjJsdHh2bVF4WTB0TWg3QjBTRDNSUWFu?=
 =?utf-8?B?aUhWeWZtQlJuSlV2aTlyTW1XNGVYU1IrTU5yNzhnRTFobk42aWl2SVNING42?=
 =?utf-8?B?UFZuSnplTjdmVnRObzVYUjdqVkNvOWs4dnZGOSs2aEF3SUZhVE5uTkxiQWVw?=
 =?utf-8?B?T3Bnb0dxWjFrQTNiWEYzVlF1R2V1azNZbW9XMGxHQk5FNUpKajd4ZjNMekMy?=
 =?utf-8?B?eG03cHNVSEpCQVNpMUd0dHFoOW1wendpYzk4ZHlBWU9VQ1VVcVZwVk1mS2M0?=
 =?utf-8?B?M0kwWmRiRWFHb29vMWVPWURvUkkwblhTN2lTczNtd3o4MXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnRhcEVGa1JuWE1LOXBwVy9td0ZXM3ZVMWZIRkF1UkFpdVNHQTRLMUNaeGNj?=
 =?utf-8?B?LzBXNVhKSXpETytEdndBZFlRSzRjZ0FlWkZMeDFJaXYvV0pyaDdlUG9QQTJi?=
 =?utf-8?B?ZS91dm5CYUs5RmVuT1ZUQTFkRGhBSGd6RnE1RlFmOFNUM1FMY3R2UEkyZmNK?=
 =?utf-8?B?MWlaYTNxMXkzZUJvUUZEN0xzdGlWOWpJVzhrYnVCb1MwVW55M2V5ZkYyNXN5?=
 =?utf-8?B?ZTVsUHhPdDg2QzV3bDR1Uk1GTGFvUzVWY2hNVm1OdkVTMytRSitSQ1NUVmc4?=
 =?utf-8?B?K1BDM1pXZDdHU2ViUXRhSmNudEpjZTlSYXZFZFE3Vm82STZ0enlvV3NwTXdi?=
 =?utf-8?B?L0Z3K2RTcnpnUjhNZmZDamJTMzMxWGthdzdUYzJPZTNSazBXeXg3ZlVESWJj?=
 =?utf-8?B?bVZLMUgrdGRUMlJWV2ZBdW1INENDTTVWSVRxQ0Q2S0w3cjdxNnVhKzc4N2hV?=
 =?utf-8?B?RHJRSndKMTY1NSt2SFlEQmxpeFdSclkxaTdzSDdSRE1VRFNKVTFNNXlER1dQ?=
 =?utf-8?B?ZzRZQXBFcEVTenU5VGNWdVhTRWZieTgxNWxGTGlOeWFBS09BMlhNRElGOTNR?=
 =?utf-8?B?YUU0VzZUczdocGFwemErcDNTNU4ya0tGMGNBSHduMTI2NW9kMTJodmllbnUw?=
 =?utf-8?B?T2lheGxaOExNckd6UVBiK3VjWFJxMjdJQ0RHc2VhZFpmd241ZVFpS29NSHAw?=
 =?utf-8?B?SWovclRiYVBjMjVoK0xCdTdEMDZNcWhZOVBUYnVoamhuMWtVellXbGZwejhX?=
 =?utf-8?B?ZWdaaG14cThwV0ZMT0V3YXhFM25QeWp0MkN2SXZaNGpWTjlaRlRKbFVBdjhz?=
 =?utf-8?B?dndTdGI4MTl3UEU1aWZ3MFNFeTJ2S1ZqcG5udVBBSSsyRlRlZVBCTUpRT3RZ?=
 =?utf-8?B?VEpzYkdBSmFpY0dpak9mUzJVWGp4ck1RY0QzK3BENHVicC9odkZqelk2Mzl1?=
 =?utf-8?B?UjNab2cySFhnVEJyOC9Ca0ZoOTRKK3RFVkYveldxd09UMGlLMktlNk5MM0dL?=
 =?utf-8?B?dURzYUNDc2REdVBtQ094RnBic3JKZjRYSEhFSUtwTEVicE1KbGt0ZW4xYW1p?=
 =?utf-8?B?Ym5pQTN6SUVBWXlNMWNUNXNtSHdKVFo3bUxiSmFrb1h5T1NiRjYzRFg3QlQx?=
 =?utf-8?B?Z1h2Zjd0NjBHS3BOL0V4Mlc1RFNWaTNjdlVBRjJlU3Q1UDRGZG11QXRZdXVs?=
 =?utf-8?B?RFJ2K1YrQnp3eGgwclJJVHgwRG91NEFLYVRBbVFGN2pTRzNWMlV5OCtVb2J3?=
 =?utf-8?B?RTZvMXpjL2xtdTNxZEYxMWo1OUd2VTcwd2hNVWc5NlNLaU5ualUwQnJ0VEVL?=
 =?utf-8?B?ZWgzRkN0ZThrY3p3MFA2bUxSV21rSE1ROU9QVnNjN0NmeC9hRWZhdUo4NTdE?=
 =?utf-8?B?aTBwNmRSOTVVcytrcXBNOVRTK3kweHN4aGRRZElzenA4VW1vTVRRSmdsOUoz?=
 =?utf-8?B?K0lFbVlRNVE0endLclpIZmtnRVk3VzlHbldlb3dQbnNjb1pxaU1FOFdCR0NW?=
 =?utf-8?B?TTZCNnZHdlJLcmltTzVPUENieHBIbEwyMTBBZWtyTzBqT0VBRHhURkptUS9G?=
 =?utf-8?B?ZG1WV1lzb0ZKckNmUDcrYkpoRmgrQzhZa3lLenJQazAzYlQzVnVUeVNSemFZ?=
 =?utf-8?B?NWVKK1RTUU5ZZUxubjdRakNjK2xuZ0tac1BsaXRhWjNrQVFFL2FRSVNucFV1?=
 =?utf-8?B?WFRyZTQxWUFwM0pQYzJNd1FYU09Kck5DaWExbzdHd1NsbWl0eFpleGhjMUtv?=
 =?utf-8?B?QklTbm1pcXI0c3BwRFlPTnVscHpneGJhYm1aQXhQelFhTzRXUXZMMmVMN1JB?=
 =?utf-8?B?RVdUYXJBUEZTU1pTYkhGZTRwbThyQ2xEY1p4QmJudkhJZEp4d3h5WEJ6ZWFR?=
 =?utf-8?B?TDgxOTJKY0NWeWl5d2d1ZEtLSitkQlJhQ1p0eVB2ZXU3a3ZXYklGZjBNT3Ev?=
 =?utf-8?B?ZzZjRGlueW50cldHYVpOQXR5WlgwNXNNMU5Oa0lkNE50ejRuN3FmbCtQRDNn?=
 =?utf-8?B?YjFHYy9qUUNKS1c5dVJIUW9rcklFUjhrcktUdG1pc3RtSEQ0cXREbFEvbG1O?=
 =?utf-8?B?SVh1YklQUWlYdmRHWVUvcXYyYjVwNGxxVVlHNmFmak43Ui9SRUdJYzZ4bjJn?=
 =?utf-8?B?aCsrOG1jWndzOVJmc0lUMlc2MTR4N1Z6TkdGL29BamNzQ0JZWTBmZWRjZ2ZL?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b152f157-a5df-4677-8d06-08de20f50b28
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:36:36.2510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dj+gnAIEm2EMi4bZJZpRtd8kBGSjmZgP3gDbn7Fo7Z4pKl8GSZCS2LKCzyFmhCtY7KgA2JP6LcwtW1iKBi6CpIWGTgPhZLD2pzsyRkXY1yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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


On 11/10/2025 11:55 PM, Ville Syrjälä wrote:
> On Tue, Oct 28, 2025 at 05:37:36PM +0530, Ankit Nautiyal wrote:
>> This is a resend of the patch series [1] originally submitted by
>> Nemesa Garg <nemesa.garg@intel.com> to:
>> - intel-gfx@lists.freedesktop.org
>> - dri-devel@lists.freedesktop.org
>> - intel-xe@lists.freedesktop.org
>>
>> One of the patches was missed by Patchwork, which caused the xe CI to skip
>> running tests for the full series. To ensure proper CI coverage and
>> results, I’ve applied the series on top of the latest tree and regenerated
>> it using `git format-patch`.
>>
>> [1] https://patchwork.freedesktop.org/series/138754/
>>
>>
>> --- Original cover letter follows ---
>>
>> Many a times images are blurred or upscaled content is also not as
>> crisp as original rendered image. Traditional sharpening techniques often
>> apply a uniform level of enhancement across entire image, which sometimes
>> result in over-sharpening of some areas and potential loss of natural details.
>>
>> Intel has come up with Display Engine based adaptive sharpening filter
>> with minimal power and performance impact. From LNL onwards, the Display
>> hardware can use one of the pipe scaler for adaptive sharpness filter.
>> This can be used for both gaming and non-gaming use cases like photos,
>> image viewing. It works on a region of pixels depending on the tap size.
>>
>> This is an attempt to introduce an adaptive sharpness solution which
>> helps in improving the image quality. For this new CRTC property is added.
>> The user can set this property with desired sharpness strength value with
>> 0-255. A value of 1 representing minimum sharpening strength and 255
>> representing maximum sharpness strength. A strength value of 0 means no
>> sharpening or sharpening feature disabled.
>> It works on a region of pixels depending on the tap size. The coefficients
>> are used to generate an alpha value which is used to blend the sharpened
>> image to original image.
>>
>> Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3665
>> IGT patchwork link: https://patchwork.freedesktop.org/series/130218/
>>
>> Continuing discussions from:  https://patchwork.freedesktop.org/series/129888/
>>
>> https://invent.kde.org/plasma/kwin/-/merge_requests/7689
>> Got ack from kwin maintainer on the UAPI patch.
>>
>> Nemesa Garg (10):
>>    drm/drm_crtc: Introduce sharpness strength property
>>    drm/i915/display: Introduce HAS_CASF for sharpness support
>>    drm/i915/display: Add CASF strength and winsize
>>    drm/i915/display: Add filter lut values
>>    drm/i915/display: Compute the scaler coefficients
>>    drm/i915/display: Add and compute scaler parameter
>>    drm/i915/display: Configure the second scaler
>>    drm/i915/display: Set and get the casf config
>>    drm/i915/display: Enable/disable casf
>>    drm/i915/display: Expose sharpness strength property
> The i915 part of this needs a rewrite:
> - it needs to properly integrated into skl_scaler.c
>    instead of reimplementing half of it
> - for some reason it's doing stuff in the pre/post
>    plane update hooks instead of from the vblank evade
>    critical section, which means the updates won't be
>    atomic and also can't be executed via DSB
> - the state computation is in the wrong place. It should
>    be part of compute_config() but now it's somewhere later
>    where it's screwing up the prefill stuff again (I can't
>    land the final prefill fixes now because this laded in the
>    meantime).

Thanks Ville for the feedback. I will work with Nemesa to work on the 
mentioned points.

Regards,

Ankit


>>   drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
>>   drivers/gpu/drm/drm_crtc.c                    |  35 +++
>>   drivers/gpu/drm/i915/Makefile                 |   1 +
>>   drivers/gpu/drm/i915/display/intel_casf.c     | 293 ++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_casf.h     |  22 ++
>>   .../gpu/drm/i915/display/intel_casf_regs.h    |  33 ++
>>   drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
>>   .../drm/i915/display/intel_crtc_state_dump.c  |   5 +
>>   drivers/gpu/drm/i915/display/intel_display.c  |  37 ++-
>>   .../drm/i915/display/intel_display_device.h   |   1 +
>>   .../drm/i915/display/intel_display_types.h    |  15 +
>>   drivers/gpu/drm/i915/display/skl_scaler.c     |  91 +++++-
>>   drivers/gpu/drm/i915/display/skl_scaler.h     |   2 +
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   include/drm/drm_crtc.h                        |  18 ++
>>   15 files changed, 548 insertions(+), 13 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>>
>> -- 
>> 2.45.2
