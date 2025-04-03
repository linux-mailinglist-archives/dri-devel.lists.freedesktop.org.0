Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E32EA7A88B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF40010E2C5;
	Thu,  3 Apr 2025 17:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzVM2RgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5110E2BC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743701236; x=1775237236;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mglwLpuvSpuwRTJAzhFx3NSpjaA16mHbKGxU+Gs/6Fc=;
 b=HzVM2RgJI7egX/6QGoh1aU2ZPXo1VYOVjsBPDmyWxWVeQ6XYjdK95v4R
 f1birQMdBCdEcMTSWS7L/dhyKeBijSL0O4yFILHEIv0AsSbZ2OqGsiFOf
 M51p9EAzD/qq1CjaJTu7iuNHu4BBsmtUP3Q0GFeLWoud2SvTEABpod5AB
 QjSDzKlSGgBJBqzdySVbTHDvKvMPNXG+UNhOdDUAQcVklKfgHsFREL6zl
 x8ciMrZU2T1oiGOa0dJ9+KhAo9sY4o+e+fiTPOzGXLZF5UFaPI8Ce3rUE
 bJaPR1Jtaix6/B57yqcLECC26CtdHHJg2Tlf3IT0ynO89YNRP//p4g/rN g==;
X-CSE-ConnectionGUID: zJ751J+OTwWZ0lncUSJpZw==
X-CSE-MsgGUID: 9A2nx5BNRSm4oNtdAhZvGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44839293"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44839293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:27:16 -0700
X-CSE-ConnectionGUID: KuvTD5jLRBWh9NjPnRaDqA==
X-CSE-MsgGUID: 5ce+4pi4RE+pAUaIcS1L8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127360444"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 10:27:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 10:27:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 10:27:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 10:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWvttLk10SEWcTl7IjDVPKe7yBUaeICS0kuvczJ9yurRALomsr2Rx4C+PXOpPlT85SVZL+ACzan/0f9pQHJ685K6HPGXoywXVX9UXmi9wWyJwffXc3HEpY07deFPXr5fuWRbCsbxBzg+a2hV5k5EqqYHBRP20N6vVezrPTOXVmLhYrmDlX67wRmm2sUuCntoUkPmD21s9Xa+Svqz9Bg/9YsjrdgiFYJG5dLPuO7GvVAjQqspOCHt2ZhingBuC7sqA5yuwNV7bgLGffYRrwyFR1fICs1RE0oSn1fFwBYkDPg7RQJS1rH4zfJlAHW3uTaK3o88faapyX0y0wmK0LOVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+0MoO39kclOzOWidaSmTQ3XAKsiWSwEDEtipGxQVJ4=;
 b=Vf1F0KqtFuISfLIPnLOjU6LsEVwEJsM1NTuitnNYlK6ncA/ebjctXagMDthutLdq8Z/AWbJVHRErSrKVO/wTtVh85nP9NvThXJ1l8TOLZBEg0BkJO3wjorGK4i/k0V+dJWYg7QodyMVyas50PeXRw/VU1gGuTuoh2jS4XbDDsMFZwXmMcJkPxXCjEGNjr7GlT3b7JJhktXVV0whycSJeDC/5i9zJtAWnZ8oAEy1f6/50t4QGKiQHiRKooSXc6kvZKQfDiQVkPZQVFOaVesSRYgRa3SVTTL2rE0CD5Yfxqfu+eUIrlmzzx0oumY26ql50rTQpbaV1J9WFTxUwQBJAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 17:26:29 +0000
Received: from PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd]) by PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd%6]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 17:26:29 +0000
Message-ID: <68bdbac2-bb2e-49c0-bbfc-633f93a18a56@intel.com>
Date: Thu, 3 Apr 2025 19:26:23 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v6 1/4] drm/xe/vf: Divide ballooning into allocation and
 insertion
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-2-tomasz.lis@intel.com>
 <e4b7e7ae-60d4-48f8-8b3a-ae8f0f41a916@intel.com>
Content-Language: en-US
In-Reply-To: <e4b7e7ae-60d4-48f8-8b3a-ae8f0f41a916@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To PH8PR11MB6707.namprd11.prod.outlook.com
 (2603:10b6:510:1c6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6707:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 383e6786-dc4e-4f85-00ef-08dd72d4ab37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHI1eDYrL3E1c3N5VXdmWTJ6T1JjK2FtOE9KSnoySk4xcTBmS2hldE8xOEJr?=
 =?utf-8?B?UjZOdzd4a0VmY1BYbU1nbXpzWVVReGJ1enBZaEVvUmZLbG5meFRoUHhISDhv?=
 =?utf-8?B?SVVuYjBJN05JQmxWRWYrWG5CYlZhSWh4ejZQeHEvckQ4VFU5ZVd3UTBIRUE5?=
 =?utf-8?B?NWFKNXZkMnllZW02di9JZ0FhZUg3eXRaTGNQYzBQelFjSTV3OEVTSkIvMG5m?=
 =?utf-8?B?YU9kb3VGc0FPWThaRzVOWVZuT2RVV01ackRYRGdENUpXeVA5bUc3a0ZwcHlR?=
 =?utf-8?B?SlphUCt6NWpqMTZJdWtza1lLWjBGTXZXR0ZTbXRFcUNxMGwvUm9HVG5GN0pa?=
 =?utf-8?B?bGNLYnJnUVQxaU5oczRYRjNZb053MUZtSVZ1VlljSTRyT1Q0S2NrMGJuQllh?=
 =?utf-8?B?VkEvbzQ2aDlhL3doKzdtdFF4cEdwUm5yMXB3bXRwaW9EeVNwanVUdmlnWGVI?=
 =?utf-8?B?Z0djTDZBYUVzcTl2TnhXQUd4WVNlbUk4ZXlTVW5TdU1ZdEZIdWFPK3FuSHpR?=
 =?utf-8?B?ZkdxalFGbTFzSjcyNC9zOGZZOXZSbU80YUtxa1BOSFZsaGU0bjAvNVhQM3l3?=
 =?utf-8?B?bXBnS09QamY5MklYQXV6RWI2OEl0SEVSVVc0amt2QzJQWE1xZFFJcXF6WGha?=
 =?utf-8?B?dTZKcjRETm5CTlhlRlRmZjFvTUJnS1R4SWZnTmJrR210SmlyTnAyM0VVS3Fk?=
 =?utf-8?B?OWQxak5YY01hZEZMVWZRdEVqZ1c1SUVPRjRCemJtK0dzSnYvbncrclN6R1Bt?=
 =?utf-8?B?RkNxSFpEOEtTNFV3NlNjRms4UUZSYUgwUXlDV01wOHk4QXdXUHRkZkRBSkV2?=
 =?utf-8?B?NVdNTlFrNWhGTUlXVEd1cDNFVnFyTVQvbG5LMmgyWmxWQmxlQ3graGpHcTA0?=
 =?utf-8?B?UHdzSEtRMFI4bkJyaVJaMVdHTjhaSXVHcVhOc1VIbnJSRFhuajFjSGw0NzNS?=
 =?utf-8?B?TTVIZ0trYm1BcTliZDdNT1FjbDBoSEt3V0dVNWs4NTBXUUc5VTQ1VzlTOVg4?=
 =?utf-8?B?cmUwTTVpcVJBNGhNcElFT3BwTjQ5V2lkVUNoTkZzNG9tU0JGM2dXS3hYRVJ1?=
 =?utf-8?B?V2JHMUlLUWJrWVBveDhiWlV1cWN4SnVGcHF4TUpDOVBDTytjMWpaMzRIWXRm?=
 =?utf-8?B?SWFLUXJmMFhkS3lWVWRkb2pPMHVIYW90WFpsQmV6R1RBV2RBNm85cVAzeHlF?=
 =?utf-8?B?S05zdzlMUUNTbjhod0puaWZXVnpGcUJ2ZE1WZFZhR0JHZ0IvZnFWc1duNXM1?=
 =?utf-8?B?LzdrZW1sUlVBZUUzblV6b3ZsczBuaTdKMEM2cUZFRnlSanZCQWV1cWt3a1Bp?=
 =?utf-8?B?ZUo4UVZ2WWVycUdmV0pmeWNvWXNaZU9vZlVlazB3a0MwdHhYeFlWLys4ZHdu?=
 =?utf-8?B?bGtYYWFSaWtGaVAyc3VXUWYzNlN2blpvNmlWZUZRVS9QcGdmcFBUMVlaRmw1?=
 =?utf-8?B?clBmMUZRdC8zaXZUUFUyMTlqSHlPaDd0eVpuN3dKZTRkQzZhZmdsUUFIcGoz?=
 =?utf-8?B?YjhRdW14UHFaRy9vTTN6US9VNEszQk9mRTJCa2N2eDhseFVjSU1EbjZna0wx?=
 =?utf-8?B?U2U0SHI1NWtJZW8zVm5yMmVXUjg2S0RpQlNKQUF2NkdDcmp0R3Z1dXZvOHhX?=
 =?utf-8?B?VTN5Qlp1dC9ZN1NsSTNjOEhuK3Y2ZTY0eXNWTExIYVdaL2srS2o0RFh0OHhu?=
 =?utf-8?B?UFFzaEhuQVRmSTJWUEN6eDRSbmJWOW5CdEFPbjNsdmxyeFFqdkxCSE9zVktk?=
 =?utf-8?B?bjRJQm1pTnp5MG1sck9RZS9SUEIxaFdaTUhKM2NielFGcTlwclBCSGNpU2s3?=
 =?utf-8?B?ZWloNXl4WUpnZWl3RUl0YlRtQlRrK3FkNVpFYXZ6ZS9hZWszMTkyR3RUbWJL?=
 =?utf-8?Q?qjdyiGvsDsyVz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmRlWTFwUklVMlRJbUJZZEZBQlFmSU9mWFBaamxiaWE1eGRXVmZ5ZERMaVRj?=
 =?utf-8?B?VG9TUndrcTdsY2FCYTF2Z1pONTJKa0wzUFVsQmRCNVZ5cUQxYk1tV1BMS2Vw?=
 =?utf-8?B?ekFjUk5BRmozM0xNbTVHVFRUdnFySDcwTlVwamYwWFUwUG5rcHY0MmFuZkhh?=
 =?utf-8?B?NUQ1bnBMUVZ1bWFZWUR0L0pVcks0bDJIYmVlS3h6eXRwd2ZjY3kzZmIxNWEy?=
 =?utf-8?B?dkgyOENsQ00rVG9LOE9meEJ2cGpLQ3RkRVFqN1ZGNUJSNE84YkJhYkJVTGJ1?=
 =?utf-8?B?TWNPcWhkT2xYdURyZFliOHFZM1B2eENCUGZvNHh2em94L0tRYlQ3SHFYTEhB?=
 =?utf-8?B?SkhwdCsvNXRrdFhBWFM3emgyV2FlaGJYZHArYUJDTGZyaGRCNTdad3V4eXdR?=
 =?utf-8?B?QXJySngrQUpnWUVPbTBxbVQ5TmdSaG1GMmZXRC9HRGxEcUJtMzNOekhseEI5?=
 =?utf-8?B?SUFKMXlZWC9acU5KV25hV1dWNTBPakVIUW92ZFQvdnZqR2wzSTZ5TnVvSHNB?=
 =?utf-8?B?S1pOc2lvR2dxU2JSdDF6T1FGR3hRWTc1Mm9tdGtILysvcXBFanJMMG9DUWp2?=
 =?utf-8?B?K1FwbjlBbE84cVIwb3UrQmpEZU1ObktQNEdkaWNGUlFGYWV3ck1WYzluakFK?=
 =?utf-8?B?V0ZEQ3pabWQ3K0x1a2kreVgvdk1WU1VGVEpkSWRTbFF5M3krY2NyNlJYcUFI?=
 =?utf-8?B?ZTU0bCszOFBwZHRjbGFxdW9nZGNjZHVGWDNNUllXQnZxWmc1TVZhcHZzQkFE?=
 =?utf-8?B?dUEwQTY1cjB0c1kxRDF0azRYYnlscVZQYWhsc3kvUnV1aFpsdnN0b0NSTWE0?=
 =?utf-8?B?cnZXRHRsV0hwYnhKR0FGY1NYcVZybjRoSnZoOVRPVW1ibFovaVFEUGhFUzFy?=
 =?utf-8?B?Szk5eUY5bjQyYmpMR0NseC9Ea0FLRkNZUzBVNjRtbUZLTFAyTFZiR0c5Kyt2?=
 =?utf-8?B?dFN6WDhhOWFXcGJqcWVHODRuS0x6R3ErTmd5Z0FwUnlhY1JOVVJJYStnOVYr?=
 =?utf-8?B?QXNibWlKdU5oS2NOOVZia0xFc3k0clNnaDFiOTBUdHNVRkNpbDNMS0l3WTBQ?=
 =?utf-8?B?cTRwNnhRd2V1Q1JyRHR1OG92anpWRXl0TnZUYkR2cU5CRVlDdWZ1bVM1dkw1?=
 =?utf-8?B?QzF6SElPSW1DTG1HYnlXTGxzMW9sTFNiUi9GcmQ3M2Y5Z0p1bkk3UnFXUkM3?=
 =?utf-8?B?aHg3K0JMdFBoRXp5dExMN0Y2U0V5b1RjeURSRVBtUXh3OUkvbUxaQURWL3Ro?=
 =?utf-8?B?d2IwNFY5eDFEaVlKRGtMenVrS0tiRTJIb2ZkZ2FVTkVWeXE2VG9rM0EwZWFq?=
 =?utf-8?B?bXFSSTYrbWJuUjJ5YlQ5Mmp4bHlMRlVML2lxaUxHRHY1d09BUkdmcThLSmMy?=
 =?utf-8?B?UUluWG5XWWZ6ZmFhQVhCeFRHSWJIaWNhMzFJcXRnTjhSTjE2VkdMOVVBalR0?=
 =?utf-8?B?WkVleCs4aWNNQVAvUVpnbHRhWTd4MVNwRHF0Y3FPN2l6YlhVZ1pqNU1UbTA2?=
 =?utf-8?B?SjY4VExwOEM1dkQyUjVLcDBtTm9NcERXVEhzQU9nWVhHYlJqVDNLL1BybDJr?=
 =?utf-8?B?OFJ5eEZvSm9OL2t5MUxNSjBQSEJUVG9zeXlQaTNpL0x1a1AvVEVheXdvV0N1?=
 =?utf-8?B?OUY0ZWFhT21vL2hzVlNtNmkraVZGQjYwb2YwMFgrMmlBZ1VRVWFDTkorZCtx?=
 =?utf-8?B?bm9KeHBMZ3RVWDVKOFB0VkFadEQvRDc1bWg2MUFRMmJMTVdzM3d3QW82b3ZX?=
 =?utf-8?B?ZU50TXNTYlVSUUxmU2VVSWFxcXlLcVhhcFREVnJWdG45NFFUc21OWUw4bEZM?=
 =?utf-8?B?NlFHQ2wrMEpPMDZ4YWc5QlpoT1Rad1prME5pUUlWVW9jd3hYdmpycnR6ME40?=
 =?utf-8?B?cVVhVDR3UUVDdDlvQ0tibFhoNVBDVFdxakJOengvc3BaS3pRTGYyRkcyaGpx?=
 =?utf-8?B?V2VMUG0wSGdjSmt4SFlOT2VrTE1pa0s2eFVkMDlMam9nWkZVdzZ4Wm95SW4z?=
 =?utf-8?B?MlEyTkpjVXV3M0s3eUlZb2NYMmsrYXd3Rks0ajl0bTJaZVNSMnNsVkc2K1hZ?=
 =?utf-8?B?cjBLTXVJMVVaRkhhbi9MTkdXajFDMmM5bUUxbHNjQndqViszMDZuc0lWQVdx?=
 =?utf-8?Q?h8PcJ9wT2h2LxTk9Zqq+aCs+M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 383e6786-dc4e-4f85-00ef-08dd72d4ab37
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:26:29.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weFRUh8UWPZasLqM3EO1YyJbFEy9WbLr81RKscGwYnKIBdZ5tuI4UB6OPKpf7PZ20OavyeZsjdDleP2DOtER8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
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


On 01.04.2025 19:21, Michal Wajdeczko wrote:
> Hi Tomasz,
>
> Since we use 'ballooning' concept for GGTT, please include 'GGTT' in the
> title to make it more specific
ack
> On 31.03.2025 15:21, Tomasz Lis wrote:
>> The balloon nodes used to fill areas of GGTT inaccessible for
>> a specific VF, were allocaten and inserted into GGTT within
> typo
ack
>> one function. This disallowed re-using the insertion part
>> during VF migration recovery.
> The wording "This disallowed re-using" sounds like there is a bug in
> current implementation, while all we want is to refactor the code, to
> make if more reusable, so IMO we can just drop this sentence, and just
> add in the one below that the split is for the "reuse".

I like the division between "general awareness" paragraph and "what this 
patch does"

paragraph. But I will rephrase.

>> This patch separates allocation (init/fini functs) from the insertion
>> of balloons (balloon/deballoon functs). Locks are also moved to ensure
>> calls from post-migration recovery worker will not cause a deadlock.
> hmm, this new locking is not looking as robust as before ... see below
>
>> v2: Moved declarations to proper header
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c        |  9 +---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 64 ++++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 +
>>   3 files changed, 52 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 5fcb2b4c2c13..2d7456e37ef4 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -452,9 +452,7 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>>   	node->base.start = start;
>>   	node->base.size = end - start;
>>   
>> -	mutex_lock(&ggtt->lock);
> Functions that don't take the lock on it's own and expect lock to be
> already taken we usually name with "_locked" suffix and use explicit
>
> 	lockdep_assert_held
>
> to make sure it is enforced
>
> also consider whether there should be just two variants of the function
> defined in xe_ggtt:
>
> 	xe_ggtt_node_insert_balloon_locked()
> 	{
> 		lockdep_assert_held
> 		...
> 	}
>
> 	xe_ggtt_node_insert_balloon()
> 	{
> 		mutex_lock
> 		xe_ggtt_node_insert_balloon_locked()
> 		mutex_unlock
> 	}

We will never use a "non-_locked" version at this level.

I think you was going for "_locked" version of 
`xe_gt_sriov_vf_balloon_ggtt()`?

I don't think it makes sense from a code flow standpoint, but it is an 
established convention.. will do.

>>   	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>> -	mutex_unlock(&ggtt->lock);
>>   
>>   	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>>   		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
>> @@ -477,16 +475,11 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>>   		return;
>>   
>>   	if (!drm_mm_node_allocated(&node->base))
>> -		goto free_node;
>> +		return;
>>   
>>   	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
>>   
>> -	mutex_lock(&node->ggtt->lock);
>>   	drm_mm_remove_node(&node->base);
>> -	mutex_unlock(&node->ggtt->lock);
> same here
>
> 	xe_ggtt_node_remove_balloon_locked()
> 	{
> 		lockdep_assert_held
> 		...
> 	}
>
> 	xe_ggtt_node_remove_balloon()
> 	{
> 		mutex_lock
> 		xe_ggtt_node_remove_balloon_locked()
> 		mutex_unlock
> 	}
as before, wrong level.
>> -
>> -free_node:
>> -	xe_ggtt_node_fini(node);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index a439261bf4d7..9edbe34f45f4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -560,26 +560,33 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>   	return gt->sriov.vf.self_config.lmem_size;
>>   }
>>   
>> -static struct xe_ggtt_node *
>> -vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
>> +static int
>> +vf_balloon_ggtt_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>> +		     u64 start, u64 end)
> as this function is now just a simple wrapper around
> xe_ggtt_node_insert_balloon then maybe it's not needed and caller may
> use xe_ggtt_node_insert_balloon directly?
will do.
>>   {
>> -	struct xe_ggtt_node *node;
>>   	int err;
>>   
>> -	node = xe_ggtt_node_init(ggtt);
>>   	if (IS_ERR(node))
> this runtime check shouldn't be needed any more as any node_init()
> failure shall trigger probe abort
>
>> -		return node;
>> +		return PTR_ERR(node);
>>   
>>   	err = xe_ggtt_node_insert_balloon(node, start, end);
>>   	if (err) {
>> -		xe_ggtt_node_fini(node);
>> -		return ERR_PTR(err);
>> +		return err;
>>   	}
>>   
>> -	return node;
>> +	return 0;
>>   }
>>   
>> -static int vf_balloon_ggtt(struct xe_gt *gt)
>> +static void xe_gt_sriov_vf_balloon_init(struct xe_gt *gt)
> please don't use fully qualified names for static functions
> here it could be as simple as:
>
> 	vf_init_ggtt_balloons()
ok
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +
>> +	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
>> +	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> failure in any of xe_ggtt_node_init() is fatal from the VF POV and shall
> trigger immediate probe abort
will do that.
> btw, maybe it's good time to add new function variant:
>
> 	xe_ggtt_node_init_managed()
>
> to make sure we don't forget to call xe_ggtt_node_fini() ?

I don't see the point. We do sometimes create "managed" versions (but 
that word is never added as a suffix),

but it's not really an established standard. Also it doesn't fit here. 
This brings no improvement.

>> +}
>> +
>> +int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt)
> all new public functions shall have proper kernel-doc
true.
>>   {
>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -589,6 +596,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>   	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +	lockdep_assert_held(&tile->mem.ggtt->lock);
>>   
>>   	if (!config->ggtt_size)
>>   		return -ENODATA;
>> @@ -611,7 +619,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>>   	start = xe_wopcm_size(xe);
>>   	end = config->ggtt_base;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
>> +		vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[0], start, end);
>>   		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>>   			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
>>   	}
>> @@ -619,7 +627,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>>   	start = config->ggtt_base + config->ggtt_size;
>>   	end = GUC_GGTT_TOP;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
>> +		vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[1], start, end);
>>   		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
>>   			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>>   			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
>> @@ -629,15 +637,34 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> -static void deballoon_ggtt(struct drm_device *drm, void *arg)
>> +void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt)
> if this is a public function now, then kernel-doc is required
yes.
>>   {
>> -	struct xe_tile *tile = arg;
>> +	struct xe_tile *tile = gt_to_tile(gt);
>>   
>>   	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>> +	lockdep_assert_held(&tile->mem.ggtt->lock);
> why here?
> it should be already part of the xe_ggtt_node_remove_balloon()

This is the function which will get the suffix "_locked", so the check 
here is really mandatory.

Will add to sub-function as well.

>>   	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
>>   	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>>   }
>>   
>> +static void xe_gt_sriov_vf_balloon_fini(struct xe_gt *gt)
> don't use fully qualified names for static functions
ok
> look around how everything else is named!
>
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
>> +}
>> +
>> +static void deballoon_ggtt(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_tile *tile = arg;
>> +
>> +	mutex_lock(&tile->mem.ggtt->lock);
>> +	xe_gt_sriov_vf_deballoon_ggtt(tile->primary_gt);
>> +	mutex_unlock(&tile->mem.ggtt->lock);
>> +	xe_gt_sriov_vf_balloon_fini(tile->primary_gt);
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
>>    * @gt: the &xe_gt
>> @@ -650,14 +677,21 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
>>   {
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   	int err;
>>   
>>   	if (xe_gt_is_media_type(gt))
>>   		return 0;
>>   
>> -	err = vf_balloon_ggtt(gt);
>> -	if (err)
>> +	xe_gt_sriov_vf_balloon_init(gt);
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	err = xe_gt_sriov_vf_balloon_ggtt(gt);
>> +	mutex_unlock(&ggtt->lock);
>> +	if (err) {
>> +		xe_gt_sriov_vf_balloon_fini(gt);
> since you have split ballooning into two parts, both parts deserve it's
> own cleanup "actions" to avoid any mistakes in manual cleanup sequence
> like this (or we can rely on the new xe_ggtt_node_init_managed if added)

They do have that. balloon_ggtt has deballoon_ggtt, and balloon_init has 
balloon_fini.

This will get clearer with modifications from previous comments applied.

-Tomasz

>>   		return err;
>> +	}
>>   
>>   	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index ba6c5d74e326..c87b0e9c7ebc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
