Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC338FCDC1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9610E7B8;
	Wed,  5 Jun 2024 12:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tbgx4AS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9310E7B6;
 Wed,  5 Jun 2024 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717591848; x=1749127848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wWipURnFuK6EEcvYyTO7ScZnaAnAeyZZA0NGNlxlfYk=;
 b=Tbgx4AS5xSxjokLA5cTBEXsGVID9ow4WKLg0SHTg9aRXZAQd1+vPOTWY
 z9zCtQdMXgwIZYcKa0d8JYWfqYfj1VAjWIp30jZfKIJICyQf/3lkxS8jl
 nfwyUR0hz7I4ec9byaitl0RTO4Z7DQdy4Vc8csBOwCCP/pq2WmhOdJJ19
 hvSDwZpXmZiGUgajatLrkto4VfOqPu4OLYHTrX1DRIcoXcaDbjCg5E/7P
 TwmK441QTwA7uNYnL9HAN4EldmoYBvYFeC4Sgu8gTk+zJio5pqY2z9ss/
 EtX20V7hRx1m6OhSWkpxVEEXYHagYBirftd0uX+guzcSHwqnsQOOXlWA4 A==;
X-CSE-ConnectionGUID: D0DCSaRmTcauCan3uYZemQ==
X-CSE-MsgGUID: dcDr1HO9QhmKyqvx7uifFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25598401"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="25598401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:50:29 -0700
X-CSE-ConnectionGUID: odnfEqXDQvOp7bfL8LFFjg==
X-CSE-MsgGUID: IWppFQOlT2ybUuxS5sacjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="42700590"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 05:50:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 05:50:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 05:50:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 05:50:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 05:50:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/D/Qu0Xt8hNSHBLCEtg9ShZ4seAZzonCclBKhMEcRsgPq+SiQSUOx5+rM/feRfEZpokKgqFXZFMYHnHceDahtZvq1upUTCxThDev7Q1ycQxy6hGS8ZGZ4GaS9yIQVUaZ2KOlwcaPTcN5QOSb+v0wCAccTYdESoJ4yPV1FSGEZAv7+bik4JsARILp6Kh5sN4nvBsDgvndBejiQK1bcp8fH3ax5LHvqhYJ8hpuByCk1yy9+2lh9ekHOnW9DTItt+8w4+zU2dKU7um/qhVGEkTpdE8Hox7YeZJtKFm4ciAQpiL/Pin+6SVIA+oKPYQ3k1mHI3cYKPOsncu/zmKmNeJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWipURnFuK6EEcvYyTO7ScZnaAnAeyZZA0NGNlxlfYk=;
 b=DU03DVHJIvbjBnwcwZ8nweqa1DJsslJ0MCs9qwNTkqm40ha0IqLF2fuh/XHLK2ZvgNeqTnCrVSMThnPqOGFd+wr1+56aPqi+sz1cNBCsDj7vZkDdOhs21X4XjIL/tZ1cWHzl158FZAHHge0GOQXbGgmmRflkaQonU26DnRy+p2Ri2bBfjlXYd8ieQLV4as9n9FYsmjYNaIYdxsMbpetkLZMi4um+BezXBl+c3WuLRearKh7fQpadyGhKWesDkf9QdIS8uvQu/SU03f8eeePRZj9xZ/i0thjPECTT7BX2tnaP1R9p+crhatqRXV3SBqUoKS24ddcsO53ZHNc7RI4gRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 12:50:26 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 12:50:26 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v12 2/9] drm-tip: 2024y-06m-05d-09h-52m-50s UTC
 integration manifest
Thread-Topic: [PATCH v12 2/9] drm-tip: 2024y-06m-05d-09h-52m-50s UTC
 integration manifest
Thread-Index: AQHat0VM6jGiyHKCkkmU0nzaFlmSNLG5Hx9g
Date: Wed, 5 Jun 2024 12:50:26 +0000
Message-ID: <IA1PR11MB634801C3DCA75899417579B8B2F92@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240605122802.488124-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240605122802.488124-3-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240605122802.488124-3-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|IA0PR11MB8418:EE_
x-ms-office365-filtering-correlation-id: 82ab8728-a51e-422d-474c-08dc855e1286
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UDg5alg2Y0VzQ3dKUHI4OHYyeE9mRVQ0ZFRVc3V0MkRkb083Qy9jL1lZVzl1?=
 =?utf-8?B?K1l4c2FkeGZZbkdzWUlCbC9PWWNPRlV3a0lvRlJMQUUvU09vNVdKcnBFb1JY?=
 =?utf-8?B?TTdZS1J3UEJNRjVDQWVkMHFmTUVyNG9nSWhuVGlXU0k5ZGJSQjlNQ25Va2FL?=
 =?utf-8?B?SytoWkViZFFoR1JIQWoxZHlMTnZzdTUxM25QWDAwcnVsY1JIUTVadzhpRlV1?=
 =?utf-8?B?ai9FS3grZDNGcmZYMm5aNlZDNG9RcElhcERNQWNoQTJPUDB3a1NheDJyQXN4?=
 =?utf-8?B?RUE0Z2pEeFFLZ3hpTSs4WHBLVkVlaVk4TUplbFpSU29sSXNtUzZTOVhxUWRj?=
 =?utf-8?B?SlFkNU1adGVnaERyeDlJdFI3TFpnZEpIeDBYS2l3NVJlcGM2Tkk3em9NcE9F?=
 =?utf-8?B?U3lianNGMkRud1NScHB1ZXdaVWtaVUlZdmYxOVZVSEI0aUhTTTcrZ0tMTC8z?=
 =?utf-8?B?WUNXUkhBTmJRdFZvKzFyaThDNklhcW0vMGpMQjNFSHY0Z0ZsWThKcU90Sndj?=
 =?utf-8?B?TnIwb2JBdWx6SjVLZGU1WU45cEF5Z2ZSUjlVVkE5ay9lUlVLRGhKUHJLSHRY?=
 =?utf-8?B?d29iNEtkVDZUdXZ2dVFqN0dNY0lvbTF2aXFhMDlNeHJndHBqV2ZSNHNvWEg0?=
 =?utf-8?B?UjBleGlHSTluREpUaTZuVGJZNk9vNE9NYUU3c3pwZ25Lb2JkMjFOcWhBenlR?=
 =?utf-8?B?VldZb1pEVU5zY2xYMGNXWTFra0JIRVl1dGZndHcwdkhrOGFUUmpDQ0R5QlBh?=
 =?utf-8?B?NnJpbmNFaTNLODVrKzRreWNqUXVKc1dTL2VNK3BLV1EweTh0NEU4aUtOeFMx?=
 =?utf-8?B?dXVXUDRlRFJON3ZNYzNWNisyL0pialBlanNqNHBXTU84SWdKWVBWZjUyelY1?=
 =?utf-8?B?eDBJVUZWeFdTTmV5YVFVWkVlR1IvWVlSUHplbGZSZDM5YkF0ZXN3Nm1JbGRm?=
 =?utf-8?B?RUwzMEJBbWZBR1ZRZVZ2bllaMk4yRWlPNElPVHlJU0Q1c01rSzJuUWdraDNs?=
 =?utf-8?B?RjBncTRyWElOK2NKYi9CSWl2RVlpSU0rY2w4QnRlY0I5L0tjM0RsZ28yQTZB?=
 =?utf-8?B?d2dVenJxWFNteVFQa2Myb3BTZkpSZGR4dE5pbml0VmJPOGsxNFFqVUdNVjhs?=
 =?utf-8?B?K1RlaHVKZ1hyRCtjVmpHNWJyQnJMYVJoZHBhaDYvb3NWUysyTVU1NWY3b0Vm?=
 =?utf-8?B?M3ExMGtSWUJtQWZmOXB4dDdjVjJTYzRKZVpkNUx0Z0VRWGtoWW9nTmpSMk1Y?=
 =?utf-8?B?QmZYajBpWDhaZi80Tk1IVXNoY0NsZ1RGZGR6NDJOY3R0d0tXSHFoUDR1YmdX?=
 =?utf-8?B?bksyMzdNSnhEUEdMMDc2NllOeDh2VkpFbXcwSVlsRGM3emsvZHROaDloaGRt?=
 =?utf-8?B?M0Y1ZkVvenZ6L3hFc2ZKdGR4eW5vNWVkaWxzY1F5SGVJTnBqMUhJR05ydkVu?=
 =?utf-8?B?dGVSNDlJTFNkNjNOUEcxRDNFaUhTc0M3MXlPcEFzTVFpbGdlbUs4QjBoRVlz?=
 =?utf-8?B?Tm9zeU1mcHNVeG1sN3JIaUttRUd5bTg0RzlNMEZMWUdoM1FxZHQ0TEQweHFX?=
 =?utf-8?B?a0lBSllvSURERHZuOWhFa1hTWGYwbUs5UmJrWDg5NHVtUE4yWm5JV0FWcmtY?=
 =?utf-8?B?SjhFSWcwQ2FTTEZEZmNxV0NtV24vTnVEVDFDa2NvMzcwVGhhQjczbTl6cTF0?=
 =?utf-8?B?cnpXdXdIUnFtREhudllXOGJmVnpyc0NHM0hJN2Y0MkNzRWRhQzZOWWUxekpr?=
 =?utf-8?B?VEVvS1hScVhYQzg4SVlNRHV0MlFPdThCT0hCdUE5cEF4MmpST1dMVjRUN1k4?=
 =?utf-8?B?ZkErU01xMUFJWkZOZ1ZhQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEJlRzIzKzkvSHpmNHVkSTY5STRwZ0NoMU84UC8yZktzdlkrSWFQeVdBblhV?=
 =?utf-8?B?YkgwZDFJb3ZVTGEwRHhCd1J2M2RpblRpUTZBNUU4U3ZBSjBCbWl4aEdLTDhv?=
 =?utf-8?B?Qzd2alJzcG9QMjdPNGZYUjZSZk5OaTk0TFZPL0U0b3VsTVJBWHFnN0xPU2ty?=
 =?utf-8?B?d2lhb010Rmk1NU5OSmxlczFlcm43UVJvakZsSkt4TTNlMDhmTFBpRTFTUTc1?=
 =?utf-8?B?bitaSnl0VUh4NzVpZk9mMnV2Wm4raWJuUmRMeU01YVBrV1ViWElSYlBpdjhB?=
 =?utf-8?B?bWdGekM5b0FIR2dYMlVhenNkbmlvZWloejNud2JBcU1TdHdmSkdnV0E2bHFv?=
 =?utf-8?B?dTJwSnUyVC9kQVI4SEhSRC9sMk9EakhSNDRDZGswSklFclp6dStmRG5OWHZ5?=
 =?utf-8?B?dmNGWnlFdC9CbWxGa204WU56NG9JVVZVTXVqVTVSVEkxbDZacmgya0dIZ2kz?=
 =?utf-8?B?dXM1MUdIL0pGaG5mL0hYZDB6Q0dnMk04TjlOb004MUcza25UbEpDWlcrU2lE?=
 =?utf-8?B?dUxQZmpPb1lqSEI3QVFPQ1F2M0hnbUNWMFJPcVZOMVJpT09QMFNBNHBZdVJ6?=
 =?utf-8?B?QXJGeXNZbk9PeFhiajN2Y2V0c2dKZ2FLWXFwWXVJcmdxUVJSdEQwNTZrRUR3?=
 =?utf-8?B?d1Y5ZUFHeVlPL0k5cE1WZGw4ZlUxT092R0tOc0F2bnJuNTV2T1ZPNitRdTlm?=
 =?utf-8?B?MFhZVE9waFZSM2RJWDMyNXhpRHBxQkNrYzhxOVhRd0ttR3BXbUZXOW1LVVBF?=
 =?utf-8?B?Mjd2aWo0Zm5KU2plZHlHT2RtcVFLYVRETGlSZm51ZzBHcFZmVlRPZklRU3dm?=
 =?utf-8?B?UlF2YkF6U3pHb2l4UGdKNzYxOXdtK1ZqZTZBZ1c4Y1YyVXpCSVo2SzNDU2Fo?=
 =?utf-8?B?eVg0UVJaU0Fxd3dMU0t6OTB4K1M1QlN4b0FidlBjR3VnaVFaTXFpbVkweUpl?=
 =?utf-8?B?TWF5Ly8wblYyVGxySGp4RUJ0K3JXYnhkemd5S0hobmNOZUxvSmZaMFFJNUZR?=
 =?utf-8?B?c1FZOC9yWW5IV2xoUkFPSnJPTVVFSis0dmZkU1FLUXV5Z1hJS1ZjQWJhcisz?=
 =?utf-8?B?VjhXcVhlVHBUaUhxV09ZbGJjTlJnNHFHeXh1bVpaZmkvUDQwZmhYVFF1K044?=
 =?utf-8?B?R3BWK2F3MWU5M2IvQUo4eTd6emQrYlRJN0hnZ0NNL0NKbCtYTEg2Yno2VDdr?=
 =?utf-8?B?VkFQWVdXMVdqalkrMXMvMU9rRXRlcUttN0s0Z09mRnl5bWYyTlFvVGtDNm03?=
 =?utf-8?B?NzYzVE1WV2svMy93WmpRWWQzQnJKWnBKYVJxUFZrYWZ2Y2JvRTRYZlg2bkV0?=
 =?utf-8?B?KzRXWlBpdTVzWkl1S2JJcE05MVA5b3Irbkc2T0p5a2t3OU9aUHNyUW5iWUNy?=
 =?utf-8?B?RGxDY3hKLzd4Q0NGajROaW5DNEl5LzRrQ2wyM3RldGx5eFVTSHNWYXNVREtm?=
 =?utf-8?B?UlA0a0lHbGFWMjd6T2hrTUlpRXNKdTFOZ1dpbStJaG1MQ3NxRmVNTnNSb3Bz?=
 =?utf-8?B?SnN5TjB0Q2xqV2YvSEFvTU0zOHpRN2xVMUcxVjR4WDcyZW9nNTVNdEhHamlr?=
 =?utf-8?B?Zjd6bnNwZGR4WGhkT2dmaTdXTHNsQ3NkUm45M2g2bDNJbnZYdkJtQVFOUUtT?=
 =?utf-8?B?YUdNVFFJY3ExR2NuWUdoOUlKQWJkTFpnRmduV3dFSDVHbXQ4WEVya1M0aWdi?=
 =?utf-8?B?bytvZkUwa1lYbVRSMHI1TFByZzF0Vk9MTkJpMzFGZlFMRnFxTk5mdk5iNm1R?=
 =?utf-8?B?K3FPNjUvQ2w0OVpmMS9LbXFiWjlaSEEvNnA3eHpjWnp5UTVtT2IweUVDTjVi?=
 =?utf-8?B?Z29Vd045alhvTldQU3l3RWdFZmZuNnNzMTdIdHBUVGZUbHMvSXpqeGlzVG1D?=
 =?utf-8?B?TjlyUjhYUXRjZ1FNWURNclNvRlBnRVlHTmQ2cjFybjdycDUxclRPVkMwUXBB?=
 =?utf-8?B?cTd1clJ1VHBiTnJWT3BiRFVTZ1dVRGttbGFUY1EzNjZYVmNGeG9kSTBtOEhy?=
 =?utf-8?B?TjFsbmtja29XNERZYnBmWDZ1WUx3dUprUk9uNC9IVEdQOWNJOGtQRzd2WTZC?=
 =?utf-8?B?K3RZZ0xSN3IxWlRVWnVmOG5td243Nzd5aHZMbnhaWmJzNS9CNFEvdU12Q2dy?=
 =?utf-8?B?dEhocG9XL3VFejQwSjZwcUZ3a2YwNXQ3ZWJ1VDVxN3BHbTJmYnRQVSs5WmZM?=
 =?utf-8?Q?0u0Q94A1snTqF5CCrSa5jDo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ab8728-a51e-422d-474c-08dc855e1286
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 12:50:26.3541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiHcd6c1OwGUZHS0OV2rh9Uh+TvVJlvPM7N9PYx/XCayMKa4UozMYZH9H4dqtZhd9wp1eDJrQH/gYfLA6SS2FMlxhXvzM9ZBFlINQDiI6/nC0YL4AKkWHEn4AFeCjBgQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

SGksDQoNClNpbWlsYXIgdG8gUGF0Y2ggIzEgdGhpcyB3YXMgc2VudCBieSBtaXN0YWtlLiBQbGVh
c2UgaWdub3JlIHRoaXMgcGF0Y2guIEkgd2lsbCByZWJhc2UgbXkgcGF0Y2ggc2VyaWVzIGFuZCBz
ZW5kIHRoZSBjb3JyZWN0IHZlcnNpb24uDQoNClNvcnJ5IGZvciBpbmNvbnZlbmllbmNlLg0KDQpS
ZWdhcmRzLA0KTWl0dWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJ
bnRlbC1nZnggPGludGVsLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIE1pdHVsDQo+IEdvbGFuaQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwgMjAyNCA1
OjU4IFBNDQo+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBOYXV0aXlhbCwgQW5raXQgSw0KPiA8YW5raXQu
ay5uYXV0aXlhbEBpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIHYxMiAyLzldIGRybS10aXA6IDIwMjR5LTA2bS0wNWQtMDlo
LTUybS01MHMgVVRDDQo+IGludGVncmF0aW9uIG1hbmlmZXN0DQo+IA0KPiBGcm9tOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiANCj4gLS0tDQo+ICBp
bnRlZ3JhdGlvbi1tYW5pZmVzdCB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW50ZWdyYXRpb24tbWFuaWZlc3QNCj4gDQo+IGRpZmYgLS1naXQgYS9pbnRlZ3JhdGlvbi1tYW5p
ZmVzdCBiL2ludGVncmF0aW9uLW1hbmlmZXN0IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZDg0MDk2NGEyMjA4DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvaW50
ZWdyYXRpb24tbWFuaWZlc3QNCj4gQEAgLTAsMCArMSwyOCBAQA0KPiArZHJtIGRybS1maXhlcyBj
M2YzOGZhNjFhZjc3YjQ5ODY2YjAwNjkzOTQ3OTA2OWNkNDUxMTczDQo+ICsJTGludXggNi4xMC1y
YzINCj4gK2RybS1taXNjIGRybS1taXNjLWZpeGVzIDYyOWYyYjRlMDUyMjVlNTMxMjVhYWY3ZmYw
Yjg3ZDVkNTM4OTcxMjgNCj4gKwlkcm0vcGFuZWw6IHNpdHJvbml4LXN0Nzc4OXY6IEFkZCBjaGVj
ayBmb3INCj4gK29mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24gZHJtLWludGVsIGRybS1pbnRl
bC1maXhlcw0KPiBjM2YzOGZhNjFhZjc3YjQ5ODY2YjAwNjkzOTQ3OTA2OWNkNDUxMTczDQo+ICsJ
TGludXggNi4xMC1yYzINCj4gK2RybS14ZSBkcm0teGUtZml4ZXMgMDY5OGZmNTdiZjMyN2Q5YTU3
MzVhODk4Zjc4MTYxYjhkYWRhMTYwYg0KPiArCWRybS94ZS9wZjogVXBkYXRlIHRoZSBMTVRUIHdo
ZW4gZnJlZWluZyBWRiBHVCBjb25maWcgZHJtIGRybS1uZXh0DQo+ICtjM2YzOGZhNjFhZjc3YjQ5
ODY2YjAwNjkzOTQ3OTA2OWNkNDUxMTczDQo+ICsJTGludXggNi4xMC1yYzINCj4gK2RybS1taXNj
IGRybS1taXNjLW5leHQtZml4ZXMNCj4gNTM5ZDMzYjU3ODM4MDRmMjJhNjJiZDYyZmY0NjNkZmQx
Y2VmNDI2NQ0KPiArCWRybS9rb21lZGE6IHJlbW92ZSB1bnVzZWQgc3RydWN0ICdnYW1tYV9jdXJ2
ZV9zZWdtZW50Jw0KPiArZHJtLWludGVsIGRybS1pbnRlbC1uZXh0LWZpeGVzIDE2MTNlNjA0ZGYw
Y2QzNTljZjJhN2ZiZDliZTdhMGJjZmFjZmFiZDANCj4gKwlMaW51eCA2LjEwLXJjMQ0KPiArZHJt
LXhlIGRybS14ZS1uZXh0LWZpeGVzIGQ2OWMzZDRiNTM4MjkwOTdiODk0OGQ2NzkxZWEzMmMwN2Rl
M2ZhYWINCj4gKwlkcm0veGUvYWRzOiBVc2UgZmxleGlibGUtYXJyYXkNCj4gK2RybS1taXNjIGRy
bS1taXNjLW5leHQgMzEwZWMwMzg0MWEzNmUzZjQ1ZmI1MjhmMGRmZGZlNWI5ZTg0YjAzNw0KPiAr
CWRtYS1idWY6IGFsaWduIGZkX2ZsYWdzIGFuZCBoZWFwX2ZsYWdzIHdpdGgNCj4gZG1hX2hlYXBf
YWxsb2NhdGlvbl9kYXRhDQo+ICtkcm0taW50ZWwgZHJtLWludGVsLW5leHQgMTc0MTlmNWM2ZDQw
OWJjY2U1ZDA5NDI3OWE2ZmVkNWQ1ZGJkYmExMg0KPiArCWRybS9pOTE1OiBQcm90ZWN0IENSQyBy
ZWcgbWFjcm8gYXJndW1lbnRzIGZvciBjb25zaXN0ZW5jeSBkcm0taW50ZWwNCj4gK2RybS1pbnRl
bC1ndC1uZXh0IGEwOWQyMzI3YTliYThlM2Y1YmUyMzhiYzFiN2NhMjgwOTI1NWI0NjQNCj4gKwlk
cm0vaTkxNS9ndDogRml4IENDUyBpZCdzIGNhbGN1bGF0aW9uIGZvciBDQ1MgbW9kZSBzZXR0aW5n
IGRybS14ZQ0KPiArZHJtLXhlLW5leHQgOGIwMWY5NzBlZTg5MDU3NGIzNjA3Yzg1NzgxMzU0YTc2
NWM4NDliZA0KPiArCWRybS94ZTogVXNlIG1pc3NpbmcgbG9jayBpbiByZWxheV9uZWVkc193b3Jr
ZXIgZHJtLWludGVsDQo+ICt0b3BpYy9jb3JlLWZvci1DSSBhNTFlOTI4NDVmOTk4NzllOTcxNjc3
NDgyYjBmNWZkOTZlZjEwZDNjDQo+ICsJdGh1bmRlcmJvbHQ6IEFkZCBLY29uZmlnIG9wdGlvbiB0
byBkaXNhYmxlIFBDSWUgdHVubmVsaW5nIGRybS14ZQ0KPiArdG9waWMveGUtZm9yLUNJIDQyOGMz
ZWYzOGVmNTU2NTE0MGIyMTA0ZjBkM2RhZmRhZTkwNTZjYTkNCj4gKwlSZXZlcnQgImRybS94ZS9n
c2M6IGRlZmluZSBHU0MgRlcgZm9yIExOTCINCj4gLS0NCj4gMi4yNS4xDQoNCg==
