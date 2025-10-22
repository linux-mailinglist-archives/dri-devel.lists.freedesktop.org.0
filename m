Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E64BFA322
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0A10E14A;
	Wed, 22 Oct 2025 06:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJv4lu+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC6D10E14A;
 Wed, 22 Oct 2025 06:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761114026; x=1792650026;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+BV/G+OjX5keCxh0JxcpV/Pj95wdZD0c5cQs0xSX74A=;
 b=BJv4lu+yPuUenr74lWzGexGc/IPa3fneegZEx6uV5y8ogMX1jXCgfJ/6
 I/EPZUfVRpWevJbluMVp0329Frf3fnvaymXBGH2HCNQG5e6uN073SeF04
 g7GjZ4qa0XLMuiPfhZijx37sIgFFj2FxVm+Xonz8aguna8tnf8jr4cuE7
 pp+o6rQRfio4UiDPDeXTuUjCQFuk1IOhteC/OcSiwVj8hZBz6JHgaJQgL
 Z/e4TrVbeu5wa7mS/hHyspUf3o543rUOUPSr+WI/U6trFRrYFC0Jbv3Af
 Yl1xE+zRq97ZPsBqgQiBf/YE4lu0cS78Ev8ZxZJRhZ0mTrWLMEqaCw7Z6 A==;
X-CSE-ConnectionGUID: 8HTMVoz9SDeWVDAIog3Baw==
X-CSE-MsgGUID: VRlOQv6DS16a6zWXxPMz9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63291671"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63291671"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 23:20:25 -0700
X-CSE-ConnectionGUID: wirI2RRJSCKDR2OsXEw/XQ==
X-CSE-MsgGUID: 2zG3mvNRTy2QbNvatYkFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220972367"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 23:20:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 23:20:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 23:20:24 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 23:20:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9uB3SdotRQQZcgVnl7Cs0kqYmUQezMPsvIr4OkZU7fz+zFUCRYb8IJyzoOVVThT9ZZKLxP1MVJaI3woWE6vW9fmXbV+HsNNF+fZVpcN0mxm5rpT31Nt8VTK3rsOMy/qzWRVzKglavLKapidaIXxuh0DzJX9Ggf02gNHGXHKOqx1oc+sDIjOt4wHy6yw7WPKX1cYG153uPrY4sjhcxERrc3GLs6PBvrbdRf8TeXizA/+b1pKPVUfO8oKR+Cm9F/yzPPwhlX0TYk6oG+MmLtXzHYoAkcdoVm1YPo3psHCM37BF0rxcDCDzGEibT/VQUR6d4jJ0pJR/um1lIKt2sj1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiRPLCae1uQpbxaHnbUYqTCxbv5sscnDJFoyMFg0X0M=;
 b=r1moySMPK+8DmmMVFsvwa3KZron2Vmq36SvJ+0JWrpRzKUB3pc5FLGEUftTv6p+gatWMedJvhr8I8qNBUxrtkYEcDlIrHrK+WCoV8fa3CwiECYOQMijjHj6JdvDhoMb+gnxOHCa412Goj2fIJfNjQ/L+n3dlZsqVTLlHLv1eH2UMGtPnUgdakqN9cG1+RXLBHr4Mvo8oi53T/JymzCapYbufHdpKzMdHvMLX2afYhYu8DXhE2BUbLJHibXkhKzZbBwUpw+BwzhlaCMrd6Zj66uD9HFIkwrV7wpSqjRu1ublgiT2+GxnlwFnWHDyISia0kmSs1G/Escez2w9W6rzM+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by IA3PR11MB9302.namprd11.prod.outlook.com (2603:10b6:208:579::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 06:20:23 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 06:20:17 +0000
Date: Wed, 22 Oct 2025 06:20:06 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH] drm/buddy: Mark drm_test_buddy_fragmentation_performance
 test as slow
Message-ID: <ef3k3h3bkvzyyshh7x56w3uwp6famclbeibez6xyeijaoc3cnn@53aobyq5545f>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251021164341.6154-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251021164341.6154-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|IA3PR11MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 4938fc99-b956-40a2-91a7-08de11331147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y21HRHBhbHZmeU5OTjYyM2RJL2JjS2pYVWtOY3hXajNzLytYKzlzWXkzTkM4?=
 =?utf-8?B?dTFtZExMSFdZZjF4T2FQcDlNd0RHRHdmRUdvc1M5K3BXd3QrdnNIT1RIWHB1?=
 =?utf-8?B?Z3c2R0JIcjRncDhlY0pCaHVDdEplRWhhdFFJa09MWjUrWkk1M3oyVlRGV1VY?=
 =?utf-8?B?NEZRdzFBR2hua202N2FPTU4zS0hVMmlWamkwbk40dlZKVlg5dHBvR2RRV0hF?=
 =?utf-8?B?TVEvSisydzd5MTJHY0cxamFkbkl5RWpSMlpFaEI4dmhNVk1pL3dvdlBwc3o3?=
 =?utf-8?B?WnZhdzBsOHhyVDZYa010VkIvZFJhYzdlckp6TmlOcE40YXdIY2MyeE1vTE1K?=
 =?utf-8?B?d0dCeG9zbFl6bVJNYWNtU0hrbUhvUWFXbCtlL1NnSkhCWlF1ODJ4Nm1nc0da?=
 =?utf-8?B?RE9BSzNtTERPU2czc2F5OWRoQ1lXblNCczdzMHExd2pwNnB5RlZybGlGekJU?=
 =?utf-8?B?V3dXWTRwYzhGSzJrc1pNNGZod29GNm05N0NKZ0R2T0c0aVN4NDlnYmVyelMx?=
 =?utf-8?B?Wkw2R256N0N6Ym01alJXNEZtZ3Buc3d4L0pHUEw4QlVIc0lueHlxbklpV0la?=
 =?utf-8?B?QnJnaTV2REpiWXRBaEw3ZlVPdlh4c0cwMlVsdWNubDlnT281RkN5cERRTDZn?=
 =?utf-8?B?L01CaGdmSEtCenBoMk9RME9NKzg0enc5eXBtdmc5SXRnV0VrNjQ4M2k1L1p5?=
 =?utf-8?B?a280N1VEQm9vOFY2Z3JVTEY5VkNSWUpwZEZ2K2V2ODlEZkJCRStTOFEySmkw?=
 =?utf-8?B?cHpsQkNMcFBTQm9VdEZneDE5WmpGd1lIdDUrb2tQc3haYWk4M1dZeHVvOFVF?=
 =?utf-8?B?NUVvTkY3L1Vja0RrYkV5ZjgwRUdYVW9idFdvU0hFNzBUdU1WM0ErRVJWOEkw?=
 =?utf-8?B?akEwZHpkdXBvVHFGUWNldmRxZmhTM0Jla2dGTjZGZ3orWlhzT0RqOEYxODdv?=
 =?utf-8?B?RnVIUEx1TU5uMVppcmg3NWhEZXZ5dUh5RjR3c1VKR2RqQ0NXeVlVbExvbHBi?=
 =?utf-8?B?WUhHSlhGZXQyejhiL2EzejY2ZzdHSTNyaUI2TGdGdG5MUDRid3hYcFh0WFB1?=
 =?utf-8?B?dVFaTU9XYUpSdW1Yd1ZieEgzS2x1WnV3M1Z3OVp0YXZFZWpJQ0YxdWtwMjdH?=
 =?utf-8?B?RGR3bXN0cENLUmZ4bk5aM2k4ZDVZQXdILzhBM1R3WEpGYUJOdmJ0YnVjYSsr?=
 =?utf-8?B?Ukt3RXhjZ2doWjlLMXlWaWk1aGtRdHRpb0Y0Q0pUWnp5WW9HVDYrc2x0b2hT?=
 =?utf-8?B?bXcrL0YwUEJLQS9xRU90ZCs5bUcyYUptOXRYVGp3VkJWbUUza01ZaWFBSXpZ?=
 =?utf-8?B?MnJUeGhiLzkwYXp2b093aCt4bG9NL2xkV0tlcG9lK3VIUDBJNHUzYzhOajNP?=
 =?utf-8?B?Z2VtQmkwLzZiaUI5RVgvamxXQVJXbnAxeHkwbTdMWTZTaUJQeUxJdjMvK0tR?=
 =?utf-8?B?TTloTmQvOEk0dTBCa3dHeC9xMllaNWRjTmcrZVNoOHRkN1lKa0dHb2VWSGZq?=
 =?utf-8?B?OE50bHZ2QldwNVY5Q2JZUmNwZ3gwQ2RwdDBCdEg2dGttc2d2bE4walUvY1pr?=
 =?utf-8?B?bW1mTVBDVmthNDhoWVpGWml6NTk1dlJrN0dhZmg0akpUU3BicFB0ZmpmME9E?=
 =?utf-8?B?RGRXSEp6RElBNnh4UEVaZHJ2QytZUy93eVlCY09ROFA2SVhuem1NSnd5NlJa?=
 =?utf-8?B?VGY3bDRkMy91aHVLNGtsTkxNdGtHMy90Q3d5ZVlVNU9jWCtWOEI5TTRtanND?=
 =?utf-8?B?dGNEaTdhMzZXcWpLYjNTMEh6bWtjbTlYRWgvOFZmYUNDdXhpWUtNam5HNi9I?=
 =?utf-8?B?dUprVm5BSTNrd2g3MGVoYXJHeFVTOGFCd29mVDgwdjVKQW5oQldiZ2xFTitW?=
 =?utf-8?B?OHFxMkdEYUlTazdVWWpXOTl2ZWwwL3E5c21VOGdBYTNwaUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFllMkFPRE93d2V6M05FSHEzbm5CbEIxMXhKMnFBVGhYbFIrZXVkdzUzMFFN?=
 =?utf-8?B?TWtxRG41bEZNSUpSTG9nUGI2eFBQSER3Mm8rVTQ5L1FXTWVqV2JRYU52eXZ6?=
 =?utf-8?B?MUw5Mzc1c0pRMm9Ub3V3OGx6MFpGQnQ3MDhLYS8zWER5aGVzdUluVDJicXQ2?=
 =?utf-8?B?UCtmMGtNQ1VEVDVLMGVrcVg3TE1EQkZiZFNIZExjZWcxU3hFODVoOEk0QVRO?=
 =?utf-8?B?UStPanlhS3BZNk14MzBBdkRGTWNPZXlwUVA2cUkxbnM4MGdFclR6MWlFakVm?=
 =?utf-8?B?OVlGSmJocEFwR2tFblZIWUZmNXhXdDNXWHhKekJPM3B6T3FNOVFQUUUwK1Ny?=
 =?utf-8?B?OTdXZ2tnNURaTWFTL2xldHpMRnRuYjN5WlFLNlpvY0VDTE5yVWkwNXBIb3Nx?=
 =?utf-8?B?KzF6K1BIWXJJZHlQcXdZVE1VREhuSUtURzNqbmJLMHQxUy8wV0hQeWxjMWFv?=
 =?utf-8?B?QVVHSnArWE82RVFoaWhtcVBmenUySm1odVNKZi8wTXhVMWRWZ3M4aUt1Z2oy?=
 =?utf-8?B?bUFYWHVjRlJqWGdpK21wVXRQWjNTVXJ6V1pUaWMzUHIwV001VFlWMlFDa0N3?=
 =?utf-8?B?cm9kVStvdHJWbTVUY0pJejV3MldjejFaT2U3VVRSRW92U0NCbFV3bENWT0tM?=
 =?utf-8?B?RjZoLzVSK1lEd0lvUUFobEpreDR2ekNRTmYxc2ZXeTNSR0NVVHVpc0YwZDdV?=
 =?utf-8?B?ZXBSQzI5Zmd1ZjVZaWZhbUlJQll2TDZ0K29GbEthaU1yLzFGay9uRXprVXVP?=
 =?utf-8?B?MW9xUE9Dc1ZqVWJ2MjBoeENHaUpOZFRQK3pFcE1iV0xMWVR5Q01XR3hFOXk3?=
 =?utf-8?B?MldBWkQ1NjF6TXM0T0ljTlpMcDhqZDcvRnVHRkFnUlo1MFhuUFFZSEJtZ3ZI?=
 =?utf-8?B?RmFYcHgvQlpLczZGMjZ6b1FRemltQzdzb3A2VWgyMjVyU1JGd2VaOU9IQWlt?=
 =?utf-8?B?cUFKaHRaRWZtNGVuaVp0M3U0SnBzU1NpUWtaRHZuNE56M0c0UVFJVW13Z1Jm?=
 =?utf-8?B?VlFHNVEveG1Qc3ovWGV4TVJoUHNIU0pvRkdMSjdBa3BRSjNvVEIrdG0rNkdO?=
 =?utf-8?B?VDdKenRlSkVkcEFUZTZwTzYxTDV2ZXNPUktyRE9UVTNHcE1Vc09MWWIyOVNi?=
 =?utf-8?B?TnhnMzRmYVlaN1MwVTZ0WXQ2N3NIOWxEdTB0QWZtM3A0dkRZZ0NaTFliTXdR?=
 =?utf-8?B?ck1va25MNGEzQmEyY1pnYW9XUHVmM001RHZGamZGcyt2K0JpdWMzMEd1TGx3?=
 =?utf-8?B?YUpZa1JWdW5pNDJxL2pjMkVuNEg2Q0p2NTJwNnJZQnhPa0VrUDQycmVPMHB6?=
 =?utf-8?B?MkhtbDh5RWpTYWI1RzFVSzZxeWNoMzl5WDNMcEE2blJOT1ZQSDVzTStrTHZm?=
 =?utf-8?B?R2RnOWRpazJzSU9kc1dxcVE3Q2dzUjlqeTJVZ1E4amY4anhHcjNTd1dOQnlz?=
 =?utf-8?B?Ylc4aklTVnJzVHE1MVU4ZzVXcWxscnlKZ3V3RFZ0U1ZnUjlubVIyZzI0ZnBv?=
 =?utf-8?B?cUYwMmNId25rbVRielVSY213UkdCV2RjZTA0S3NVMzRiUDB4bEF3RVZNeG1T?=
 =?utf-8?B?MDYvR3htTzJ0VDZrYnVEQ0lhK05LOUpRRFk1WnlWdE56OWRrUGJlQ1NTOGY3?=
 =?utf-8?B?VU0rNTY4dnNzUTZkTkYwZGVxK1VZRVA4Slk0eU9EaXBmQ0d6cHY2M0JVVWdG?=
 =?utf-8?B?cjkyRkhvZFVsNWxkYjNIZFJhMk1CK2twOEg0ays2L3VMS0kvNE91QWFPaGVI?=
 =?utf-8?B?ejU1L2d0WWtMMVhsVlo2ZlVUUm4vQTUxcHFSOHJlR3Q5YjlTc0dySFJUVE9p?=
 =?utf-8?B?eE1abUhOMG5HVThpMTBxMjVQUnYvT0FHVlQ5RXdSME05Slk3eEVxdlp1SWxZ?=
 =?utf-8?B?RThyS1E5aVFDQ1kyWjlFZ0svYzVmZU5EQXB6c1kzTldpUlloYWp3SVlUaHNr?=
 =?utf-8?B?VmlnMkJTa00rdXdRckFFeEdRRmswd3ZYc3FTOG5RSml1bjIvQXBSUzZjQ0Uw?=
 =?utf-8?B?ZlBsc0RIWFpBSDNONWt2WnlmdEtrVko0VmNUK3BZMXV3OGY5K3QwaW9JajUx?=
 =?utf-8?B?S2J6YTBpSEVqNkx3NjAwMXQ2SlB6UVFyRUpWVksvbEZ3WXRaRFQrbnJ1UzIx?=
 =?utf-8?B?NEhKYWltR0dXRHJXU1FRNFEreE4xZXh6UGwvVlNFYU1vVTM1ODJkb09LY3ow?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4938fc99-b956-40a2-91a7-08de11331147
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 06:20:16.9374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2wO3alJj+zUDfkd/qp0Ssq9/bJ+9jGEOacbZMCxvriuz5Tdil6XhYL4uSy0+iJj0/4sKaVuYLA7or9d52nGpcm6X0FjVMzCDrfvnvFkBos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9302
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

On 2025-10-21 at 18:43:42 +0200, Krzysztof Niemiec wrote:
> Mark the newly introduced drm_test_buddy_fragmentation_performance test
> as KUNIT_SPEED_SLOW, as it might take more than a second on some
> systems.
> 
> Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 5f40b5343bd8..672423af7c17 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -876,7 +876,7 @@ static struct kunit_case drm_buddy_tests[] = {
>  	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>  	KUNIT_CASE(drm_test_buddy_alloc_clear),
>  	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
> -	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
> +	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
>  	{}
>  };

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

I wonder if we have more tests like this, but nobody ever
noticed their slowness. We should keep an eye out for such cases
and switch to KUNIT_CASE_SLOW if we find any.
-- 
Best Regards,
Krzysztof
