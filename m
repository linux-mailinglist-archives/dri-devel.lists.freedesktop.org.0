Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B7A9E6F4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 06:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70810E333;
	Mon, 28 Apr 2025 04:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMGkDW/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521E710E333
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 04:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745813779; x=1777349779;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MIn5KHICj1pEB+uZRAdnITONncKueGOFhTSyM/JAGtw=;
 b=DMGkDW/BTlGhIDQnjB+y5xQ4ag94haVyYL30q5eUWjM2mgwqJiQXgQ6e
 PdQDAzuLyStve21kXzb+oeUnzDe7OOaKgt/fucT2+/8swliInr3r+H3EH
 vcGAiymGQMqMWV+5Q84BKarB5B4291XYaO9EPWlVVCpatwNmXO/bWMwCU
 W0kXs64SBX40jY/GHnBVwWc+NHks4ggfdkspjbvdG2Zak2U+lwidHMhYJ
 2A7oV9fn3FnCYMGIQIA0QzyHSWRegPFt/1gczDBzl8bjtZ55g3xy65Era
 fVs+Oyf6kaEQ54uv3r0jBES6WOfhCQB8G/roJ4Ud9PFAkpl8karkC8mUc Q==;
X-CSE-ConnectionGUID: Ul1w0VVuQaaSWlcPXEN/iw==
X-CSE-MsgGUID: MO5JMRifT+aZkyq9BDq+ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47531114"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47531114"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:16:19 -0700
X-CSE-ConnectionGUID: OPVpd3g1SFexDtLYlHl1tA==
X-CSE-MsgGUID: s/gANWgPTNmg6cQYnUK5zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133139211"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:16:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 21:16:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 21:16:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 21:16:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P13d4drZq9gWhwfdFjgKj4nSo3gX3eya+lfKD0Cfn01TVrYkJeO6O/dW3/vEe1QxRRGI9Ck/KjM9sjyU5mpTpgdu2396g5YjKQO0V6EmJiA1TrW8kseiFNKZ5ot3nreSGFFZvUlHD4VTGtQAPOxzgR321XgWu9s2yxrOjkmZgKD/2fvfUKzOFyxzTEIsg+oKMhOCdfbTC5gBNve0XPXgqADppjzNI+eIbXD8EaAH4QoDZHWEFDFR1/X84EcdQ+v/NQEN/MAM9Xqy7t/we3Nmkf+4WYbOqz4+iCYBE05RPA7VA9l6LEyhYwzspQZE6GUEN2xWC/YohyMkAsNgQ7RE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIn5KHICj1pEB+uZRAdnITONncKueGOFhTSyM/JAGtw=;
 b=V81s0ms1drYgwg9mw3hs+JGOirmwtf8gbeVzX0obE/7ZoE7CR/vIqXPBu2X2FIxL/7olmJtXwu1ASNxAbN04an+QiH6mALlHXOE1COVN+W0blIpgC4Uvif5NTJu2OH67kxu+3UJ9mfQ+W4diqPFibOpYstEorNLVhTnd2Ffuz5s+UVAI3m/H1bN+5stcs+3eYg9arAQanUkr1D9t/5NEYVb/vX0RpC70xBzOkBD+WHVDc8Y+iGFNgPiI3wc2oue9ioW8JRfdzroUCrfJku972CvYVn3OdahyGE4+NJynjTn2sBxFAOZabUoMi1oamVG7xDXvHNFEVo4+a4UjIwtUPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH0PR11MB7541.namprd11.prod.outlook.com (2603:10b6:510:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 04:16:15 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 04:16:15 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Dave Airlie <airlied@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>, Bingbu Cao
 <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
Thread-Topic: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
Thread-Index: AQHbrbTOcLFcE312oEOhmpPGKi4vsrOursgAgAI23oCAAAEIgIAHOCGA
Date: Mon, 28 Apr 2025 04:16:15 +0000
Message-ID: <IA0PR11MB7185FC46BE53F16BA6A9C7C9F8812@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-2-link@vivo.com>
 <IA0PR11MB71852A481E8A99C9380C7317F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <63297d3f-5e37-411e-8150-108a03a01a89@vivo.com>
 <c752a31d-e7c5-49bf-8722-8eeaf582a4d1@vivo.com>
In-Reply-To: <c752a31d-e7c5-49bf-8722-8eeaf582a4d1@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH0PR11MB7541:EE_
x-ms-office365-filtering-correlation-id: 8f95e746-1970-418d-ee64-08dd860b6acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UVpSQU1Zd0JnbEI2ai81SlRVVGJwZmwyWFlGdEJHdnlIdUZ6Y0IxNlYxM1Nh?=
 =?utf-8?B?elhxeHo1Wm1UVUlibG8vSGRSV3FUSGQvUXo3d09ZRWYrZE9ZVjNJNEZPWHhG?=
 =?utf-8?B?VEo5aEIvWkZILytyemZvUFRiMXdwNWwwOGVUeEhrN3BpcmxoSnVMMng4VEJN?=
 =?utf-8?B?OHFYaHNON0psOWhyQWxjVEtIT2gwYXJqN1lmZGYxZHFuUjVXV21LOS9zaENy?=
 =?utf-8?B?MlRsRC9DWEdpV0JSekhMckN2akhSQ2E0b2FCMFp0WE5XKzZUdWV1UlM3bVVO?=
 =?utf-8?B?UlNDUkVRQUQyajZLdmxZcXpSamtWVkpFeHpnZ01Rd2pENU5rbzFQYmVkL0hv?=
 =?utf-8?B?ZEV4MW9RcGRBdmFKekMzdE54eG1XT3lIUEpiZlBDdEJYYnpFbGRjZnlMU0hS?=
 =?utf-8?B?VnlOQldGdVU1WDVRb05uSktsUkdiSzNlYk54a2pqdkRxRWVwMXRKbHo2QzZU?=
 =?utf-8?B?UzlqV3JqNTlSeWN4ZXVXVlYway9IQ1l2TEZWYmVpelpZUjhKcFZXUGQybHJH?=
 =?utf-8?B?czNnT2FHcmlGZ3M0RzZUdFU5ZWgzQ0pxOW41SlJZQWJmTVFKREVPa251Ynk3?=
 =?utf-8?B?WnlMaFFXMk5QZjJFSG5xQ0ViU1BIWVJEbnBRb04raHJiZFE5RDdheXFJME0x?=
 =?utf-8?B?YkJOWk1uNFk1eVFoRGhjbFN3NFJEclNQQ0R4emM0TGJJVGcxOXpwY2NlMDQy?=
 =?utf-8?B?d3pWbW45a0FINzQxOVNScHpvaDhPeEIvQnJWZXhBbElta0NXRXpYbTN5Yk5B?=
 =?utf-8?B?RUtlbVRvMUFDUFAySlptMGVPbDFCbitabWZOVUdGbmhxN0wxUis2WmxjNDh3?=
 =?utf-8?B?dXdLR0RvSW5GQmR6bmJIU1NxaHNKUEE5Q1o2dWF1U05TaW9panAxcnVtdVZw?=
 =?utf-8?B?MUhRbDVPdzNHMGdiY0VDRUhVZmV2ZTNyRW9YYXl5MkRTMXNMWC9qNEFkdkZz?=
 =?utf-8?B?elkyQjlvVVdod3NRRWNvZHd4TXliVVNBOGlqeFBkRk5Dc1lmNThXZnRCTlFo?=
 =?utf-8?B?WlEwQ0N0bUtBdzQzbjB4MVdmRW5zeGpTVm1nRFJYQmd3U09SclpLSzNWWmJh?=
 =?utf-8?B?K1dBREJ5M2s2VHVESnhyRGtCQmZLUXArcjVocmw5MHBaV0Rla2R2L21YZTU4?=
 =?utf-8?B?WHdiVGFzMm1LdHJ0ZTVaUXVycFZKdjJpVU16ZXYvR3VTbHJnTzFBbDB1Y3Ez?=
 =?utf-8?B?UzdZeTAwVi9EZTlwZkJOQTRNZjg2SXVlRkdlWDVxRGlybGFQZUcrR1FPTG82?=
 =?utf-8?B?Um5jWkVjcWdMamV5eE5KemVUajdmeW9WQm1jRCtEQU1qNGZTK3g5bDd2Y3E2?=
 =?utf-8?B?YmE1QWJtSE5qK1lJVXViMncxNG9XTG9jYVVwVEF5SzR6d3dOUnROblFHRHN4?=
 =?utf-8?B?Lzd4NUcwT2RYUHlhb2srUjZqZFBJQ3lTL2ZiLzh4aTl5bWt3bTlVczVIQTdX?=
 =?utf-8?B?ajVOMjRsUmdHRVBVeENMbkdNSGtscVFQQytUNHRpUk9iNmRBdzFTM05EaFFz?=
 =?utf-8?B?OVNXTkhqekpUZVNCZ2l5Z3lYVDlndGpzYU5vdXczaGliV3h3LzdEdlg0UmtI?=
 =?utf-8?B?WHliSFRHb1h2S1oxVVNKN213Y2dqZHhmZWViSFFjNVBEYUIrT05tMjNTMTIr?=
 =?utf-8?B?dDJPNlpHdUhjQnBMTzZKZHk5d3hXWEV5dzlWZVpTZHJiRVpTUjV4bG5wYU9R?=
 =?utf-8?B?a1MzMGF1L1FOa0djUy9sMHg2R1o0dkZtUHNxQUtoYmh0QWlncDdkTkh6RG80?=
 =?utf-8?B?TjB2VERVYm5Ca1dLbTAyNUQ5d3poMHl0bFE3TXRoNEZtUWVTSDF6Q3dpY2pp?=
 =?utf-8?B?eXNvSVJGaGJsU1JGQUZnYnVkbjJMVkJPQmNBNjRORFNnV3N5UVkwVnVGVWEr?=
 =?utf-8?B?ODRHa3BMK0NtZ0JkVm9CS0RYS0t6OFVqMTlITXFvYzlTWFBCSEVVekhFT3Jh?=
 =?utf-8?Q?zl+t4D6oT5R3pbGgrr/XrndRp7XrJQq/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2tJZnB2bVE1aXNObTBZTVFXbEpiWUVYNlRBUHVMUVljT2NEaHR4MktFTExy?=
 =?utf-8?B?QkJxbWZzd2h2cG8wbndKR1FhSkZtUjRzT2hPYml1ZkJwZlg1ckMvT2xtc1k3?=
 =?utf-8?B?TDM3SVJVY1lHVFRWTUlHUGhHWUx1aFArVUZXVTNMRDErc1ZXMWlXY21qMUZT?=
 =?utf-8?B?TzNpdDFLNVhPL1lvTDM1OFpGTzZPRDZRak8rOXJzNnVMN21RazFDWHE2RFN0?=
 =?utf-8?B?cmg2L0htZ283RWdQT3ZjU1JVMHdZOWhnVWVnYStuM0c0ZFMvTjJ3eEF6WSty?=
 =?utf-8?B?U1cwdzMvSXhrMWswQWp6NW9hMW9wYzQzMXovSjU4M1JwZjdLS0x2OVc4VXpY?=
 =?utf-8?B?NHd4RzJOd2xTWWVQQUdUbkhBT3d3YTBkd3lCakl6RGFTSjNncHRNMi9CV294?=
 =?utf-8?B?VE1hR3VIVFVKY0hsV0JLaCtvTkJpdUI4VG5BT28xeFdGa1hxNmtQUlBpRHQ1?=
 =?utf-8?B?U1lzMzJiZmhwdzJRTXV1cmZKU0VwSzV6VDZIYk1keTgrdjFkUGVmVW1BODdG?=
 =?utf-8?B?SGh0R0J0TzFSUFZ4OHhSM1o3YXRBN25qRFdlcnY3b0FORmN3ZFd4WUVBbElK?=
 =?utf-8?B?d1JES2p3QWNCejhFQUtQYkp1NnMxbjdialJjMDRNMlo3Ny81M2JaNGt1UDBX?=
 =?utf-8?B?UUxpL0g3bE44SGx1cEJ0Vk82UGEzQWZEZHV5WkJLblVYU2FNVG1UYUpnQ3la?=
 =?utf-8?B?aVlvWHlwNnpDZkljY0dwYTQwZUpvSHNIa3YvMXBlQnl1ZlBwd1hiWkpza3J1?=
 =?utf-8?B?TURUMU5MMDIyV1pmUU9uQjg5aGswNUZLVncrWXJNcGI0YlhLdG1lSlBMQmxx?=
 =?utf-8?B?eVk5Yi9GbnRjNC9rY0xabStyaWtmS2lOeXFMaUpZSmVFblFhTkZ4TzZhRlow?=
 =?utf-8?B?Nkw0aVR0c1ZPZThCN2NtS3A4YjFjZzR6ODVaeE5iREI5WmlPSEtHb1FOTHFt?=
 =?utf-8?B?am1JOXZrVCs5M1YrTDRNUkxzVFFjbXZZK05MajloL3VnZllFRzNwbVhrNUhy?=
 =?utf-8?B?U3M1SEFDMFBNOHlGTmtqZ3llOFFzRGpGbzh0Y2VxWS9NaVVpalJBaitid1hz?=
 =?utf-8?B?K0NtZXVvejBFUnlsT0VWOVdzcVNtcG1zVFliYWdCRmpYbjE3bHg2T3h2Vmhv?=
 =?utf-8?B?M2hpVjBWV2VVR3d5WjdkMHUvaklkZVp2b24wWVdBM0FOZWNrRnI5YXhXeTNj?=
 =?utf-8?B?dXdaWHR1QTlzaDM3T1F6NGhaakoxTXlaZklmQ2FVUitxb2ZuMktyaHdzOW1R?=
 =?utf-8?B?N0owbmoranNmdlI0QlNWWnZtV1ZRaWxrelJmazM0RWJKNUg3OGJzRTFsUmlT?=
 =?utf-8?B?Y0hjMkZxUEhKM0FJR3dWR2ZaeWZsMytpdm9hbzhWYjFFM1RuVElub3VhYzlv?=
 =?utf-8?B?RlJtcVltdmc5Rm5tUk82VDMvcXByait1Nk5YbWFtTlV0UlpkRUlhY1d1VTJm?=
 =?utf-8?B?K3FhdEIvazhFczhDZytEb2dFZ1VnSHptcHN2YmtNZmFObGlsT3QxbTNDcEwv?=
 =?utf-8?B?Mlk5d3ROaGNqM3dVbzVEcTBrMnBzdWtVMnlhaks1NHc1dWtHM05Ib3RrMFRo?=
 =?utf-8?B?NGlIZWVNZnAwQkllNjlFQVdkOW43RE9oRHJFVWJvMzI5bEFnYjNHTDk1SDRH?=
 =?utf-8?B?bG9KZ2dnaFJVaGFFbkdLRk1Bd3hzcDFPeTJzRUR3cDNjWWd5MDc2cmdFVkgv?=
 =?utf-8?B?TXVZL1dhM2VndHFvYXB3S3ZoOXRqQzdud055MmRRUjhMeGFEd2EyVXk1S2VM?=
 =?utf-8?B?Y0hZU25kcHg2Z2xGTzk2M3JSQS9iREpNVnhxMFpOTmc0T3R2V21RM0tURmsz?=
 =?utf-8?B?SWVYVWpPR09Oc2xpLzkxVGg4U1ZUcC9wUXIrQ3lIQWlGRmtrQXY3cCtzc2Rj?=
 =?utf-8?B?R2dvRXpadVlkQnhCcXJDUXo0WGdUSk45cnJMZ1UzUy9xQ0dQNDlSRHV6eWt0?=
 =?utf-8?B?R2huRjI1S0V3eERndS9MR25HT3dvb1ZKazFEWjZiR0NaTGZRUHJaUnovbDZ5?=
 =?utf-8?B?TEMwb3FOYmVXRm9yT2s5bWlQdDVrNDVFemtMR3lCTUNJUnF5VHBEQzBkMk5u?=
 =?utf-8?B?ZGc5ZVJHaGZJMVEyeVBNcnNLOWFWdDNidlpMQWxYYm5yMTlsdlhuTjkvUHR1?=
 =?utf-8?Q?BPaf9wlP7joeRYPVEDLTwsdUr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f95e746-1970-418d-ee64-08dd860b6acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 04:16:15.0608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbyH0ss6mJ2BtAtxPfpalEA7lWE9Cu+BYsQVRNLVauhhbYrptnCQ9/l/u1q2w3QaChXpHd5p1S8tWlVPhSmBynDRoWWWwYH93cTwiu7ZuSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7541
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

SGkgSHVhbiwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gUmV2ZXJ0ICJ1ZG1hYnVmOiBm
aXggdm1hcF91ZG1hYnVmIGVycm9yIHBhZ2Ugc2V0Ig0KPiANCj4gIEZyb20gMzhhYTExZDkyZjIw
OWU3NTI5NzM2ZjNlMTFlMDhkZmM4MDRiZGZhZSBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDEN
Cj4gRnJvbTogSHVhbiBZYW5nIDxsaW5rQHZpdm8uY29tPg0KPiBEYXRlOiBUdWUsIDE1IEFwciAy
MDI1IDEwOjA0OjE4ICswODAwDQo+IFN1YmplY3Q6IFtQQVRDSCAxLzJdIFJldmVydCAidWRtYWJ1
ZjogZml4IHZtYXBfdWRtYWJ1ZiBlcnJvciBwYWdlIHNldCINCj4gDQo+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgMThkN2RlODIzYjcxNTAzNDRkMjQyYzM2NzdlNjVkNjhjNTI3MWIwNC4NCj4gDQo+IFRo
aXMgZ2l2ZW4gYSBtaXN1c2Ugb2Ygdm1hcF9wZm4sIHZtYXBfcGZuIGdpdmUgYSAhcGZuX3ZhbGlk
IGNoZWNrDQo+IHRvIGF2b2lkIHVzZXIgbWlzcyB1c2UgaXQuIFRoaXMgQVBJIGRlc2lnbiB0byBv
bmx5IGZvciBub25lLXBhZ2Ugc3RydWN0DQo+IGJhc2VkIHVzZXIgaW52b2tlLCBpLmUuIFBDSWUg
QkFScyBhbmQgb3RoZXIuIFNvIGFueSBwYWdlIGJhc2VkIHdpbGwNCj4gaW5qZWN0IGJ5ICFwZm5f
dmFsaWQgY2hlY2suDQo+IA0KPiB1ZG1hYnVmIHVzZWQgc2htZW0gb3IgaHVnZXRsYiBhcyBmb2xp
byBzcmMsIGhlbmNlLCBwYWdlL2ZvbGlvIGJhc2VkLA0KPiBjYW4ndCB1c2UgaXQuDQpQbGVhc2Ug
Y29uc2lkZXIgaGF2aW5nIGEgY29tbWl0IG1lc3NhZ2UgbGlrZSBiZWxvdyBhbmQgcmVzZW5kIGJv
dGggcGF0Y2hlczoNCiJXZSBjYW5ub3QgdXNlIHZtYXBfcGZuKCkgaW4gdm1hcF91ZG1hYnVmKCkg
YXMgaXQgd291bGQgZmFpbCB0aGUgcGZuX3ZhbGlkKCkNCmNoZWNrIGluIHZtYXBfcGZuX2FwcGx5
KCkuIFRoaXMgaXMgYmVjYXVzZSB2bWFwX3BmbigpIGlzIGludGVuZGVkIHRvIGJlDQp1c2VkIGZv
ciBtYXBwaW5nIG5vbi1zdHJ1Y3QtcGFnZSBtZW1vcnkgc3VjaCBhcyBQQ0llIEJBUnMuIFNpbmNl
LCB1ZG1hYnVmDQptb3N0bHkgd29ya3Mgd2l0aCBwYWdlcy9mb2xpb3MgYmFja2VkIGJ5IHNobWVt
L2h1Z2V0bGJmcy9USFAsIHZtYXBfcGZuKCkNCmlzIG5vdCB0aGUgcmlnaHQgdG9vbCBvciBBUEkg
dG8gaW52b2tlIGZvciBpbXBsZW1lbnRpbmcgdm1hcC4iDQoNClRoYW5rcywNClZpdmVrDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEh1YW4gWWFuZyA8bGlua0B2aXZvLmNvbT4NCj4gUmVwb3J0ZWQt
Ynk6IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AbGludXguaW50ZWwuY29tPg0KPiBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9lYjdlMDEzNy0zNTA4LTQyODctOThjNC0N
Cj4gODE2YzVmZDk4ZTEwQHZpdm8uY29tL1QvI21iZGE0ZjY0YTM1MzJiMzJlMDYxZjRlODc2M2Jj
OGUzMDdiZWEzY2ENCj4gOA0KPiBBY2tlZC1ieTogVml2ZWsgS2FzaXJlZGR5IDx2aXZlay5rYXNp
cmVkZHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIMKgZHJpdmVycy9kbWEtYnVmL0tjb25maWfCoMKg
IHzCoCAxIC0NCj4gIMKgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDIyICsrKysrKystLS0t
LS0tLS0tLS0tLS0NCj4gIMKgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnIGIv
ZHJpdmVycy9kbWEtYnVmL0tjb25maWcNCj4gaW5kZXggZmVlMDRmZGIwODIyLi5iNDZlYjhhNTUy
ZDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnDQo+ICsrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9LY29uZmlnDQo+IEBAIC0zNiw3ICszNiw2IEBAIGNvbmZpZyBVRE1BQlVGDQo+
ICDCoMKgwqDCoCBkZXBlbmRzIG9uIERNQV9TSEFSRURfQlVGRkVSDQo+ICDCoMKgwqDCoCBkZXBl
bmRzIG9uIE1FTUZEX0NSRUFURSB8fCBDT01QSUxFX1RFU1QNCj4gIMKgwqDCoMKgIGRlcGVuZHMg
b24gTU1VDQo+IC3CoMKgwqAgc2VsZWN0IFZNQVBfUEZODQo+ICDCoMKgwqDCoCBoZWxwDQo+ICDC
oMKgwqDCoMKgwqAgQSBkcml2ZXIgdG8gbGV0IHVzZXJzcGFjZSB0dXJuIG1lbWZkIHJlZ2lvbnMg
aW50byBkbWEtYnVmcy4NCj4gIMKgwqDCoMKgwqDCoCBRZW11IGNhbiB1c2UgdGhpcyB0byBjcmVh
dGUgaG9zdCBkbWFidWZzIGZvciBndWVzdCBmcmFtZWJ1ZmZlcnMuDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYw0KPiBp
bmRleCA3ZWVlM2ViNDdhOGUuLjc5ODQ1NTY1MDg5ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9k
bWEtYnVmL3VkbWFidWYuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+IEBA
IC0xMDksMjkgKzEwOSwyMSBAQCBzdGF0aWMgaW50IG1tYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1
ZiAqYnVmLA0KPiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gIMKgc3RhdGljIGludCB2
bWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1Ziwgc3RydWN0IGlvc3lzX21hcCAqbWFwKQ0K
PiAgwqB7DQo+ICDCoMKgwqDCoCBzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGJ1Zi0+cHJpdjsNCj4g
LcKgwqDCoCB1bnNpZ25lZCBsb25nICpwZm5zOw0KPiArwqDCoMKgIHN0cnVjdCBwYWdlICoqcGFn
ZXM7DQo+ICDCoMKgwqDCoCB2b2lkICp2YWRkcjsNCj4gIMKgwqDCoMKgIHBnb2ZmX3QgcGc7DQo+
IA0KPiAgwqDCoMKgwqAgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYnVmLT5yZXN2KTsNCj4gDQo+IC3C
oMKgwqAgLyoqDQo+IC3CoMKgwqDCoCAqIEhWTyBtYXkgZnJlZSB0YWlsIHBhZ2VzLCBzbyBqdXN0
IHVzZSBwZm4gdG8gbWFwIGVhY2ggZm9saW8NCj4gLcKgwqDCoMKgICogaW50byB2bWFsbG9jIGFy
ZWEuDQo+IC3CoMKgwqDCoCAqLw0KPiAtwqDCoMKgIHBmbnMgPSBrdm1hbGxvY19hcnJheSh1YnVm
LT5wYWdlY291bnQsIHNpemVvZigqcGZucyksIEdGUF9LRVJORUwpOw0KPiAtwqDCoMKgIGlmICgh
cGZucykNCj4gK8KgwqDCoCBwYWdlcyA9IGt2bWFsbG9jX2FycmF5KHVidWYtPnBhZ2Vjb3VudCwg
c2l6ZW9mKCpwYWdlcyksIEdGUF9LRVJORUwpOw0KPiArwqDCoMKgIGlmICghcGFnZXMpDQo+ICDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOw0KPiANCj4gLcKgwqDCoCBmb3IgKHBnID0g
MDsgcGcgPCB1YnVmLT5wYWdlY291bnQ7IHBnKyspIHsNCj4gLcKgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgcGZuID0gZm9saW9fcGZuKHVidWYtPmZvbGlvc1twZ10pOw0KPiAtDQo+IC3CoMKg
wqDCoMKgwqDCoCBwZm4gKz0gdWJ1Zi0+b2Zmc2V0c1twZ10gPj4gUEFHRV9TSElGVDsNCj4gLcKg
wqDCoMKgwqDCoMKgIHBmbnNbcGddID0gcGZuOw0KPiAtwqDCoMKgIH0NCj4gK8KgwqDCoCBmb3Ig
KHBnID0gMDsgcGcgPCB1YnVmLT5wYWdlY291bnQ7IHBnKyspDQo+ICvCoMKgwqDCoMKgwqDCoCBw
YWdlc1twZ10gPSAmdWJ1Zi0+Zm9saW9zW3BnXS0+cGFnZTsNCj4gDQo+IC3CoMKgwqAgdmFkZHIg
PSB2bWFwX3BmbihwZm5zLCB1YnVmLT5wYWdlY291bnQsIFBBR0VfS0VSTkVMKTsNCj4gLcKgwqDC
oCBrdmZyZWUocGZucyk7DQo+ICvCoMKgwqAgdmFkZHIgPSB2bV9tYXBfcmFtKHBhZ2VzLCB1YnVm
LT5wYWdlY291bnQsIC0xKTsNCj4gK8KgwqDCoCBrdmZyZWUocGFnZXMpOw0KPiAgwqDCoMKgwqAg
aWYgKCF2YWRkcikNCj4gIMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAt
LQ0KPiAyLjQ4LjENCj4gDQoNCg==
