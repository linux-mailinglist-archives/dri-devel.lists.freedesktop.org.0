Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6DA888E4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 18:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC8D10E127;
	Mon, 14 Apr 2025 16:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyADA7IT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE3010E127
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 16:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744649256; x=1776185256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jH9gRfjPDySHnz2l5xIZEmViowiFd4Mwj/oi/qnYu2s=;
 b=lyADA7IT6P9mWOlZB+czWFCyYjtoQh/Q5SM8YpG0q2+5Q0L0aSBEVQpQ
 +KmJzJnnouyxOpFmpvkkuce9nh+Nl3rh1/qxsyaEXND38HZmATfxTWaEP
 i97q7eq6K1fRfa1dFbzTLkucJYHN7Ot/NIkxpOZXg+3M8iap+MYdZVg8r
 LdHkKMoN1wK7WpGofmXSECtU2rmAnOgXcypjkI4aENfxdewZxGwbmzSZx
 De/X9Z/LTtsE9wiUOcBD9d1uZ3x2vvCkQemtghriXlnXcOu6zP/vcgNCA
 U06/hYLERr4bDPF5ee6jxL2k83QmZgMtaormvknjOTG3nvfISft8oeEew w==;
X-CSE-ConnectionGUID: yLBMrUI4R4S0IRpdp18B9A==
X-CSE-MsgGUID: 6IsOOo2RSMScD6e7BvoeFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49962284"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="49962284"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:47:35 -0700
X-CSE-ConnectionGUID: 436UmvSITqm3kyETpA3e8w==
X-CSE-MsgGUID: fbT/t30nT9GMMlqIVFpdHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134925803"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:47:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 09:47:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 09:47:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 09:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8kwPUZhAbHseNGtWsWfMxpOW/c8toU1LL5ImqjFS+BwAOAfZrkt6QJjLLMonVjEdAFjH3xsjscCA6A0Z68ypsYubEDb54icbQByjMGaOYPDfPowEGO/NhVJBD0zYl0AJqZA4sg7xULUKktlTB6bghbmuDn4RAiUt+Ugs8XRAxaY1flNQXXEcmx3r4lYMS8gs4XvXu+Itud0kK9yOlBYvA9MX+DdYhUlM5Fif0CImyVSLWnE4ODA4uX4GCUKztgRfx5ih0U5MuqrrzjpCG5bb39tkvPbDZ4frhr//+VwUKMULN/jpgA/zTrAFUXzc4USFu1b6LgMcJeiGzpShROwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jH9gRfjPDySHnz2l5xIZEmViowiFd4Mwj/oi/qnYu2s=;
 b=QB6g3O5r8QucH7hhhFUskRcg5XgVC4aJ0S34wdXZYoF8wAmdFTO3NSXAhsKcrQBoGpBREwMnSxcS5D8iGtSs+2/J9JP10eHoumsgVALOkxzPA3RGKHiW3QSv7ndSG4Hm4sRAlE+mTUCjtbx6QGmD2Ym2fHWIV/RJLwpO5G3liA61j0joTx5sjz/1yf/IKQHkBzyeMfHo8ipTDWP/dID5Us1JYKWmA2QU4fsucCCfA9oncNuUpAucCrq4iK++3ZXIBqeeiEOQbJxnkYK0k8GuwPrsDZeOc7NqbiOt2fg6eewgw5DT+9znKpcIthboTkiSIKXEGbEzG9wsuC5BYcc+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Mon, 14 Apr
 2025 16:47:31 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 16:47:31 +0000
Message-ID: <deee9bc9-6af0-46fa-af50-866c58ddf7ad@intel.com>
Date: Mon, 14 Apr 2025 19:47:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Oded
 Gabbay" <ogabbay@kernel.org>, "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk,
 Konstantin" <konstantin.sinyuk@intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com> <87zfh86rqi.fsf@intel.com>
 <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
 <Z_zeUAW7u8UgmEOo@smile.fi.intel.com>
Content-Language: en-US
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
In-Reply-To: <Z_zeUAW7u8UgmEOo@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c53cfeb-5aab-4c7d-2416-08dd7b740c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDBzVWY0Q1ZwbThaZzhielpFQ2lyNjZSTzVJenlsbVdoRVZzYmNWY1JSRWY4?=
 =?utf-8?B?YncyS0xCZUJVd25SSGtiQzkrbDFMcGd3Y1JIM1E4WGFiL1hySzVEZjZ6UGsx?=
 =?utf-8?B?RUg5Ni80RHpIelFyNUVlRkxha3VkWG9FbzQwcVRiZGdWNVlEbDZsZFU3NGdh?=
 =?utf-8?B?S0cxMnRLMXJ3d1YzVVZ4aUtDTmZ1QjhXazFWNHhMVk5yc1lXd2lUNUJWNlM0?=
 =?utf-8?B?b01UK2NnTTA2bWZkQVMyRnhpMGZaUUg0Ynp2ZHBHNXBjSkdyL0JIS0I3TDJM?=
 =?utf-8?B?WlJ5VFJKTy9zQXBzcXB1RktGUFV1L0ZUMkFIdXNheUhiRHNuY1J5b1VQbGhJ?=
 =?utf-8?B?d3VNRjNEd0U0M3ErTDN5T1BLWVRydU90aklJTnlhc2ppY05kTGdYYTVMak8r?=
 =?utf-8?B?M1VGOS9lSEJjTVJKL2hGbi94U3hreHI5RU1YNjhUQjBaUXZUeGlIYTdzcGVn?=
 =?utf-8?B?MXRKTHlpNEJydFJMclRIYk0vQUJManZmMk5qOG9HdnJwekphQ01DekxHMFJD?=
 =?utf-8?B?Q1BFaWRZcDZTcTVWbTFGaG4yK0V2TUJ0aDRhdkpsNkFJRkk2ZVg5MkFyVnd4?=
 =?utf-8?B?d2s4TEhOK1BzTXR1S0luZTJKQ2d2TW1PVjZGYU5jbUdNQjhqS244UmlQQmZK?=
 =?utf-8?B?N0FLbDU5dWlNT2tFVDZRUzYyQ0dkaHVsM05vblBDRlFUMjJLNmloNFF1S24v?=
 =?utf-8?B?bnR4QjVvbGJ4UStGSXNUVm5KemF4VU1CY09LUVg1dlpmYm01T2t4cTdMaTJF?=
 =?utf-8?B?TEI3TFEwaXo1NDVFMW5DbXZ6ZWgwT2RxbHNVZWx4WDZtRHZIL0xpeWY0Umln?=
 =?utf-8?B?cmcrNEhrRXJETHQxaEZkZlNDbmxLeWRod2pqa2tEYlI3S2RuTTJUSUtBYkZQ?=
 =?utf-8?B?a1YrcVYwd1BVTDlycVB0VHVJT2MreDM0YW9kRlI5UVEwUVJwNTdvZkd5VkRL?=
 =?utf-8?B?WXdGSjJLcERKUmRINC90U0xKRWVmNFlodzBNMWJrdXphK3pzSnBLK1BxSExR?=
 =?utf-8?B?Um9GRVZ5T1E5a2dHa2RuRDRMUDVFSm50ODFpNmMxclhpaFNiQk4wM0VrNUFL?=
 =?utf-8?B?TE55aERpMjBMMjZMNTZRbnNLdG01ckVGYjdndHJlR2c2SkJON2V1VlIzRFY5?=
 =?utf-8?B?Unk3eDlYeDZ6a1BzZ1FBS09SdmdZclFyODhOM09uc1k3c1puT0Q0YlhWM25Q?=
 =?utf-8?B?dytrRS9rNGxSU20wanRiOFBPTjJ2bG01MHFaOTVwOGN3cTUxazF0c2ZQZHdD?=
 =?utf-8?B?Rnh5dlZldEkzN3JvR2dvUWRuNS9LeWd0ajhJY3RBMzJxTXJSVjVlZ3ZDbHRp?=
 =?utf-8?B?dnNCSmsrNTVXTFVxaVpQdHBBRkNjSVJYV0N6SFJUWEE5Wk9JMWZLMXFKTTJa?=
 =?utf-8?B?R2p5bnVSVXpDcVZ6ZTJUWnU1WUZmY0JWTEJGUXFoZ3RCNkZVMy9GOFhEY1lO?=
 =?utf-8?B?ajNpRitEcVlUeWxoRXk2Y2xhNzJVdXc2N280UW5VcWRpcTRTU052eGR6MHk0?=
 =?utf-8?B?RlAwWi8zdjZBYUFnQXN6eVQwcm5QSjVZaS81OUxzdnJ4NDNSb0FtcExpVHgz?=
 =?utf-8?B?ekRMV3k3UkNVclBrcW82RUhLZEJmU2x1QXd5THdNRklUa2t3di8wOTBBZXVa?=
 =?utf-8?B?bGl1c0E4NjBKVjMvTGVhbStWajZkQ3d1K3AxYUxtazdRbFg2WmhqYWF2OTZL?=
 =?utf-8?B?MmpIL1Y1SzZYQ1V0Z1Z4QXFZRi92ZlFZVDlKUE9NSTFpVzhUZ1VXbU5hQXJN?=
 =?utf-8?B?dWFkTlgxNU8zMEhwUmJGTGVwdXdyWUFBckVNRC8vSnlRMkk5SmJIanRXbm9C?=
 =?utf-8?B?VjBkc1B4LzVBUXRHODVkb3dyQkUraGUrcDhHZnNlTVBndUM1dUErNE9CYnBM?=
 =?utf-8?B?NDVTWTFOR0s3TG52SlR0bEcwSHdmZmJtUDhzbS9kL2lOUGtkU05PVEluR2M5?=
 =?utf-8?Q?MRn+USURGX0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlgyay85NmpENy8xWVI2cUhHdlJsb00wYkZQcjFRaEZjQVVlY3dVMjFyVkta?=
 =?utf-8?B?bldxdDdIV0tQdEtVamwvSTBxbC9ybjRqZGJsZXF2VCtPczBCam1zbHAvN3VN?=
 =?utf-8?B?c3dRa0xyTmdlcUxRWTRSWmVrZDJZZ3YzNUtlLy9nMUdtdGxXUEZ4VDFzZ21I?=
 =?utf-8?B?VzZTaXlUTDRCMytKaytIMmNuR3RkNkdCcm5jUCtBajlTTjFhbVJMTVNjeU8w?=
 =?utf-8?B?THMvdG94UmRrU2FUcWJsQmhzdElIT3drRy9xMHY1TlVUaFU2ZUZFaU4xN1Yr?=
 =?utf-8?B?UlRiNC9oR1NWSkZXMDQ1RTArTzVka0ROOURFeDhvZnNFZnNFUW1zOVlvQUt4?=
 =?utf-8?B?VDVaYzVYRnV3MkxMOWNBK1V6b1lVeFZWeVhxMXcxVlRxbXZFVXFXZ1J3dXpz?=
 =?utf-8?B?blZ2ZnNnMjViYi9FSE1nZE9VKzU3cEpZTGdueXUrVWVlNHFwKzlWdVQ2aVJO?=
 =?utf-8?B?R3VQWVJWOGJrTnBWcm1pRlZwVDZpZHN6YlhEbEZWbDVWNEpsdFRtSEdaMEFI?=
 =?utf-8?B?enpCUXlCQXVDS2ZiVWtoSktacWNKTEFVOEtRQzR5YTBsN0R2T0tKdGdzS0JW?=
 =?utf-8?B?U20yTlpYdFFXUnV0VnkzOVhWRXA1bnB0VFZOdFpGQ0s4YWtCZEZQQUJuSVd2?=
 =?utf-8?B?WHF1VEVnaHdLZFZOWkNIWUVRWC9MalljeTc2VnlycGRPNXREMWN4aDlENWVR?=
 =?utf-8?B?QjFOTXc1ZnZxUnRhOVE4MFNoM0FRUmkvNzBNcDNuWXRKdVpRcVVza2N5aTdr?=
 =?utf-8?B?dkprQXlqNUFZQU1Lb3V2VWt4Mm4xcUc4Wk9HczJVQlovOVFHY0FET2ZFQUx1?=
 =?utf-8?B?M3BoMkZRdjYrSEpYKzFLTTlYSmZjVTlMemNSN0NMVENuVWxRSzVIRnZudzdp?=
 =?utf-8?B?WG5yd3ZMa055SHRXcTgyeDZtUUMzR0NKN3dlN1JwSXhTYnlybmpUaVVRZ2Rn?=
 =?utf-8?B?ZEFJbFF3UmVRcjdWOFoxelI2VlpBYUluRTJheUFhb0xFbVd4MlQvcXZYZXZa?=
 =?utf-8?B?T3NGdGdDRkVObElsN1FMUVZkTElCbVR1OHEzcklNd3VwRUtvYWRLK1hTays3?=
 =?utf-8?B?bnAvZTQ1S3NhRXdpUlhsWVBqMm5NTDVlMlRiQ2I0aVFRRHF3NnlJaGsrWTRw?=
 =?utf-8?B?bTlwVW1iR0NSVmJhdjREaHZ0SmVBbVNaR3lzVVJxclZaT0xTOUovbE8xY05u?=
 =?utf-8?B?cmRvTnRHUERvbTFiWEgyZTl1Vm9DMUZvNWR4L0c5dmxSWU9VTHRxeFk4T25C?=
 =?utf-8?B?MHhZZk4ydWJYaFdFdkU0TTV6RDFvelBGYjVNbnVlVEgycSt6QnVHWTV1Wld1?=
 =?utf-8?B?ZWt2Yk9xa2dqSTJXV0Z2ekNDY2JqdEg3OHlQcEhsenZmNWZuQldvaFd3TEw1?=
 =?utf-8?B?bk5HT1BPckwwMGlLZHNhb2RqTGlJRXdNS0NuWkdQZ3NXMk13OGd3MXdjeHVi?=
 =?utf-8?B?Zk16K01BZW1BczRqNDJZTEJYclFKcUJCcW0vUmllTS9WeGdKUldaZ1NuSm9I?=
 =?utf-8?B?QWZYN1lBWmlSaFBtZmJpVGo0ZmdVYXNteUlsS2FSWEMxWk51SDBVTFNMUjRQ?=
 =?utf-8?B?OC9NRXVCVlg5UzArRlFPNG85ejNSOFVzQkduTWM4b3c0NzRoMHlJTk9Oa3ds?=
 =?utf-8?B?WGpPRmY0Rm13NUVvSEFKanZET1pMcVcvYnBmK2ZqRE1TeDZIWHVXRDMvbGp2?=
 =?utf-8?B?RnhKWVcrZTdVc2w3RmdpcTJFU2NVcUJBRFRaczNpMzYxN3A2OS9YTFFLMmNx?=
 =?utf-8?B?amo4aW1HeGQ4WTNGdjdTSUdoMU90WFFBOGxKNXNxdWxZQ1czN2JKbVVLRFY1?=
 =?utf-8?B?YjFyK2tDcWMxVEc5VU5xbkNpNEpEeExSdzRybXN1SHZEa01VRVFTVysycllw?=
 =?utf-8?B?Sm9hQTZncG4vNG5IQ2RmSTJ5ckhQSkk2b3BTTFRhK2VWKzZCNGRheGJRZkla?=
 =?utf-8?B?T2xhYVpCNCtjRXNEMTc3R1VBUTZpbkJYamFsK3p2VzJkRFNwbHJjUWRETWNw?=
 =?utf-8?B?Nlo0ZFF5aUVQK0RnZ24xRHREQVAyMFBKMFVFUWNIYVZOUmNKRFRTU3BuVUlU?=
 =?utf-8?B?OUhHak9vYzVCQzhlT29kaXA5cytDVVhhUVBQOWROaW80WXBvUEZVeHRpRk9J?=
 =?utf-8?B?eDRITDQ2Um5HVVcxNVNCSndSMjRESDlYV3l0RjA5MVQ0ZTR6d0ZwMldCT0tP?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c53cfeb-5aab-4c7d-2416-08dd7b740c4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:47:31.3251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SPOvsIJjq0KAtqhRKqcqpiqSGKkdNrdRa+DZKkI8GJqaQ3RmfNZDVu0Ndd9O+9gOM7iM6A8x3nL1Yytt1IF3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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


On 14/04/2025 13:07, Andy Shevchenko wrote:
> On Sun, Mar 30, 2025 at 02:15:50PM +0300, Avizrat, Yaron wrote:
>> On 26/03/2025 11:55, Jani Nikula wrote:
>>> On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>>> +Cc: Jani (sorry, forgot to add you in the first place).
>>>>
>>>> Do you think it's applicable now?
>>> Cc: Yaron, Koby, and Konstantin who are supposed to be the new
>>> maintainers for accel/habanalabs.
>>>
>>>
>>> BR,
>>> Jani.
>> Thanks for the help, We’ll verify this change in our CI/CD pipeline and update you ASAP.
> What's news, please?

Hi Andy,

Recently acked and merged into our repo. Will also push upstream later on.
Appreciate the relevant contribution!


Regards,
Yaron


