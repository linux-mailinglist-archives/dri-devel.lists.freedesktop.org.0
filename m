Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5C8BA9FB
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC97F10FA7E;
	Fri,  3 May 2024 09:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="em6TdTRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411D10FA7E;
 Fri,  3 May 2024 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714729080; x=1746265080;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9115z7/1f+YKP6M8wT4mNPIC2UkqOszROfbZ4U+9BGc=;
 b=em6TdTRd/umGAHT2J0eMrJgOMe9Hht63vuIjdUOURQthKYVj5yWKNMlA
 t5+h3bLEY2q610/5P7PDkK8tek2d178vf9I6IFiv20SGvLl5DU2sbJjlY
 DcYD9cS4zu+n29zrfOAWIsZMljIWicy5r5hhF5gAlqtFod0Ggjvzn2zTg
 rBielmWYLN2Xac7k4GExTVaCX4npUgpiNFW57J0aAxunWYd56HkGiNxsZ
 EOGYB5gTglXQUutxL7ETdtYbYMJKOaE1GKPPRxd+EspgKQRhy8LxxIP/9
 Io9ovaiaWxEF1TvG9o21B2wIfRPnI4hgCJGz3hqR19ydPqaCLS7lZm1YM Q==;
X-CSE-ConnectionGUID: gNuqfS4uTjipmJ3jXniy/w==
X-CSE-MsgGUID: jBt8Zzm6TeO5RHshemD+Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="35921897"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="35921897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 02:38:00 -0700
X-CSE-ConnectionGUID: W9g4i+E2SqKLw6+4dX9kFg==
X-CSE-MsgGUID: m0I2BnuLRoaxo1MkpOsQUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27915804"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 02:38:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:37:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 02:37:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 02:37:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG9w14JOJnjFOxA5Xtuu9ZghR0bgHYHmPrLeUJon1UFDzpqwI3bEWda2G1hNV5tONQAewej+tNTrhwnt0DSaUgKFRTUkPWjxeBesaQ6f1JZVyxMMr5EI52pGMMkb/DzD/P7MKEX6sSUB6rS2ifw4k3beM1cZRpGcUHWcc7LNkWLCIPe9fxx96+lHk3yi93B1LfFYfC0M2b5YnmitUf4x6jq5SkLElN48boT6Y/MpCewAKNE09gy1uAQbNdOEdPQY3jYa183cnTcmzAy6A1tjEm9wgXYztmUOV6wlUg2pY+cRuuuSp3mGv25s27e2erxk03rECGWKiidiEMDVqTL3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9115z7/1f+YKP6M8wT4mNPIC2UkqOszROfbZ4U+9BGc=;
 b=OwPfNOZX/ndPMm6SNFJMImzzCPgQNoTgkVmc6zGHSjnTJHH65fN+6s4l4oouhRm1pD99IXBsI2ijZsHe9FBI7yFaJx0b6NTA2D4WhyqaIE+KQW4WmBW7CeIKa2hWYijwovlG8jIBttwEGWjhFVODVe1fR6Z5hhlYCv5YODM1KROXBvcwt90IWmWn7/vEmsyKG4c2VGKvZLtYd26fDLj/7GqYvssZZkcL6lMB3StD0gpn2QyR10R+wpeOZ0ZV4u5jSH7KhgbV5NhICDYaFHhxr8krnio24lVCuudTS+OjHPCjptVvH/Qh3zalga6d37u082imIAH4aCkv77gMeWN6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.35; Fri, 3 May 2024 09:37:57 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 09:37:57 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v3 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Topic: [PATCH v3 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Index: AQHalnjW5wqLgyDVSUmrRldnLozWBrGFKuIAgAAQYACAABL0AA==
Date: Fri, 3 May 2024 09:37:57 +0000
Message-ID: <91745df15f5a04c52fce2686072feaad839056f9.camel@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-7-animesh.manna@intel.com>
 <b669fd758ce9087949d877505307dc0a8a0b8c9e.camel@intel.com>
 <PH7PR11MB59813E1EC23A0C1487B7C47CF91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB59813E1EC23A0C1487B7C47CF91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7780:EE_
x-ms-office365-filtering-correlation-id: ade8e5fe-4ff4-40d0-d281-08dc6b54b728
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?elFGc1BQeW54LytmRXVLNW1Ta2VJMytDS0tnRUVWcXR1VkZjZUQ5bmo0UHlT?=
 =?utf-8?B?dXM4Si9GdHZMcitHZEMwLzZ6aUYxUFVtRXY5V0ZUZnpYODg4U1lEaXFrYXRo?=
 =?utf-8?B?OUxNaWl3US82UGYvZ2c1QjF3Nk1IZFZQUVcwUUhqQjJCWkUzNVc4Q0g0MVl0?=
 =?utf-8?B?azdYNHVPTGs5ZUlkN042RkVobE53Y3BzRkVpY0Fsd2lpYkVsNmJscVFSYUNV?=
 =?utf-8?B?Nk1HWnNKWm9GRlJHMkphUW1JTlZJME9iaVdFYWtZQ3poT1Y0NHp5NVU0c1Mz?=
 =?utf-8?B?Ykg0RTJTeEZoZGJxZStJQ1ZzWjFXSU4yd1VsNGFEUTBCT2FmQlo5YXFHRXBF?=
 =?utf-8?B?c1BTelpaalRGT0VtVjMrZEVCZ29OdkxDQ05mL3cxVytTRGxON0hMUFF4cUwv?=
 =?utf-8?B?bmlqVGxoTWVZclNwZzRUeVZ3akJ6aW50a3hRZkdlUFVPc0xpaTJ6djRmOU9C?=
 =?utf-8?B?TW5KWEpMZDFNLzdQRWhOeGtoUWhJZjJ2ZXB3L2RiOHBJVjAwZ0J0b2FOcnJ5?=
 =?utf-8?B?VkVJaURuYWhFbGFZSGFRQlFqMjVTcUxhMDlEcDIzTFNpc3MvQ0FUWkVCYmsw?=
 =?utf-8?B?Q0c1UWF6Z1RWVGFPT2N1OGhKUmkrM2I4anRKcWVJeVFiNTVCc0NNTnNKMS9M?=
 =?utf-8?B?b3FmWnlPSWw0aGVtOUNBRXQ4QXpObmZickMrREhPZ01UWWNSWndEdENMMk1i?=
 =?utf-8?B?WmRlOTF1WVVzczNILzJ2S25uYW9OTGJXYkdKMkh0d1dZRFNCaTlOUTVvQlV6?=
 =?utf-8?B?RURRQSs2TFlMN1JuRTZFZGRpNWFCdVlPd2xVQk5IMjEwME9iQWVNRENzQTZG?=
 =?utf-8?B?Tmw2NGxXaytUdEV5ckxYSmczdlJLU1hveTdQMDRBOXlYTTRURHdlaXZxdnF0?=
 =?utf-8?B?Q1BhUk52cDBrdVFXWlVXeU5YL3hLdThmclNNdXQyVEdqVDhiVnRITjBtSGhv?=
 =?utf-8?B?TXBpcG9NTjdoUFV2SUlaazdzd0V5L1ByRXcxTmdzQXRYa2ZEZ2ptZHpqVWtR?=
 =?utf-8?B?UVBvK2VHMC9uRkhmYjFieWhHdzNOUHA0UVg3L1l0ekJYdUx0aVRYVjFpQlJB?=
 =?utf-8?B?dWdqTENWOWFpblZOOUtZbGxBb0d0cnFYVnZVRUZjLzhZa3d2dGNEUnBiTE5I?=
 =?utf-8?B?RytpYTZYVzlCaWtTUFBVNFhtL3MvOGhpM29ZY3hrQllqcFoyeEVzSlUyT3FV?=
 =?utf-8?B?LzlzYnpVUWd0b1F2Z3Z2Y3ZNaEc1eU56d3VYK3hGanUwcjg0b21yZ0tMUlpZ?=
 =?utf-8?B?UmU0VktjTFhVQUdZVEFQdGZFM3VWODJ6bVQxWDEvalBOc3k1WEZ2ZmdXUUZ3?=
 =?utf-8?B?bXlmR0RVTS9SN0EzcncwZjJsd2d2cGUrajJxdXIvVXpyRTJXMWQxZ09XeWpk?=
 =?utf-8?B?T00wZlh4enI4SXY1a1B6cDlROHpEYi9lTjRTS1JHcVpza3hiOW55VFNFeTNq?=
 =?utf-8?B?VHZMWGZaRFBzaGVHdEhMUTJBZWZZTDRwY1pqc1BOVVg0N3NZeTNPeUNyT2FP?=
 =?utf-8?B?M0IvZHYyNjcwaGRKM21OelhDb1R6Q2JNNjhEcWRXeUtKTVRsL0lodUwvVEIy?=
 =?utf-8?B?ME5qSXhnQ3ZXRk1hU0xFMGs0ZmtwdVNPbStzYVlnMHNRbjFOUUdVemFMb3Vu?=
 =?utf-8?B?N2VrUzh1SHROaVZhUHlCYnBvNVpkekQ3SXZReTNWUHZCZk1jczFBRWhhSHlq?=
 =?utf-8?B?M2gzeFZkNGdRZDZ4SDgvTm5yY1YxOVE0bDd1TkFUNmZLbEozUzdvNHE1Q0V6?=
 =?utf-8?B?NmlKNlFkczg4dEYra2FFRzRidTFPelVRL0owY0EwSXVBY252S0NoVUdhZHcx?=
 =?utf-8?B?aUJVTUhkdHk5bGVsSmFFdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGxHZWJoQ2FrRlhRa3gzQURaWFNjNVUvc2NYKzVERWswSzBBak1vSW1COVpS?=
 =?utf-8?B?Z1BVVWJ5TWkybWJxYmhkZ0F3TWNEWFFDSFRxRURYY2ZMWVFEeXBjNk9WVkNN?=
 =?utf-8?B?RFNUWW8xQlA2V3RSZGJXT05IbTdHM0pYYkpwVnQ1ZXFDVnlnY1BWVmc3L3VW?=
 =?utf-8?B?bGRmdWhXZkZ3bDNlb1ZGNVpUNkxqUnB5ZXJlYTdqQ0tMdjg0VGFsTXBuVGxM?=
 =?utf-8?B?VHBwVG9adkwxUWpPTEdMRVQvRGw5aEc1V09WWGJkTG1wR0hHazVGejlDc2lH?=
 =?utf-8?B?TTJVMUFkNFhEaWFUdGtkR211aCtITWhjb3A0ZWM2RTIyTzFjaXRFZzJLUm5x?=
 =?utf-8?B?NXNCakNDQ1NKOXlQbmcveXNWczg2NVlLMUpqOUNKWldLZWE0ZUUwdmwzLzJy?=
 =?utf-8?B?ZkhtamNwZkNxc0tydXdwQVpObTBlTkh0ZHNWUkQ0d1dVVHVDWStDQS9rejBM?=
 =?utf-8?B?V2cwSHA2VDVFSnlrUUlOVDVHS2kxMXFheTRFQVMxWGNYMGdMUTMreTNlaVVF?=
 =?utf-8?B?TDVld3BTc3dDMnAxc0NFUFZNcHZnUEVCTERrSVU1dndsUkVGYTF6K3ArTUM2?=
 =?utf-8?B?Mm9YTGgrTkhDaEZBOTRwY0pTUVVwZUFkQWRhcTRxUi8vcHZzYUpSUk9aeUhF?=
 =?utf-8?B?SG0zTHl4MHk2emVpU1psRWhNYVRWWUJ5WXpoamFiMTBwZVVMSTZWdzR1Y2hj?=
 =?utf-8?B?QTVQL0gxazQyaCs4aDNUT2VkaktGTGp3WGp3UDZjSm9CVFQ2Vk90Wmx3ellq?=
 =?utf-8?B?U2dBVzJjNFBoQWFpRkF2Zk9JNC9yL1Z5SUQrcnVOWTZrMW1hbE8vVVNUNW1r?=
 =?utf-8?B?QWJIZFlFeFRTVFB3U2N3N3p0ZzRoSzJrRW5YZnpQcHhpL2RTcXdVWElXbXFE?=
 =?utf-8?B?SnNvUUJOMHprd1NPclhzK05ZbXU3bmRkMzIyTHVwN0loWnllSTMrVUVzZFRa?=
 =?utf-8?B?a3I5N3VqTHBod2JuZ3hvRHRjQ1VuSnhvNmVxR2RMWXRYMjI3WU5ncGQ0aTcw?=
 =?utf-8?B?MnhwN21LeTBtK0VLN2xuUWxrUmx0SHNEQllaMldFMi9sQ2szV1dLTHdublFi?=
 =?utf-8?B?bDZiQldtRi95NStycmlzZUthdHN4WGtLbzBBa0gvbFNldTJqMVp1R0xXR1F3?=
 =?utf-8?B?L1hZUE05dS9wbERZYzRDeFRZMFlvYkhWNVhjMGgxOG1VUFNPdXhmekhMTzho?=
 =?utf-8?B?SEVSb01jV010QXFReXpsSW9yMGZIcnhDVGFKQ0Nuaml0cG9jT0dmYWZZUlhq?=
 =?utf-8?B?SmE3UFVYQkJlNnNnbEg3cWMways4OTdZeVZkV0ZJanBYanFIcE5vOTNjSVJ2?=
 =?utf-8?B?NDR1MCtHem9Bak82cEdwc0d1TGpsN3N1dHVDVFIwWmpma2wzck9LQkx6S3Rv?=
 =?utf-8?B?RGkvS2FXYmJnYXdDRi83bDBoaGNoT3hUaTc0bU1VdTBjQm9MV2dMaDZJUS8y?=
 =?utf-8?B?cmVMWnNSRWFLQ2VNQkNldlZBSHd1ME1UcFRFcEdNdE01a3RvNFJBYlNDZjdY?=
 =?utf-8?B?VS9KQ0dJSS9XbUVoaEhaTnZsV3pMRmdwNmdVUGhucTZ3VVlIL2FRSjEvMUdx?=
 =?utf-8?B?N3R4U2VOZm1EQmZnaFc1RHJhdFdRc3lRM3JvdzRkSDJQRll5Y3J6T1dlenFq?=
 =?utf-8?B?dDdOZi9RZ1VocXRrY2dQc09MMW9Jd1pvUTNKTDhTMXp3Mk45dGU2OTRBbjlL?=
 =?utf-8?B?MUZ5S1RFaU5TYzFGZWg1ek93dDExd2tiQ1BxYzdGb3JKVFR4bExSTWZLVVh4?=
 =?utf-8?B?TXpCVGZMTkpJWmtmUUJCZWpsOElNZ0dVdnVTcUNIbXpucGg3MlJZMUczL2Ix?=
 =?utf-8?B?RytINFY4NnJOVFJ2c0U1WFVuZVljdkR2SmYyV3ZtOVhoU1VFMC9wTEUrK1Zu?=
 =?utf-8?B?L1V3RXpXMmhLRjBSZ2JrNEp0NVR6cFExbGNoMUcwbjF6Y1d6VjFrTVRtK2V3?=
 =?utf-8?B?NTJGSmdNY0ViY0lIUlpNTkFuanFXRFVNS3cvTDQ0S2hJMmdzT0RoUlVMand6?=
 =?utf-8?B?akorUlBubURVQmJXWnJpcktid29DR0RLVHJLeVFlNTJJd2ZrMVNLSndqc0JM?=
 =?utf-8?B?Y1M4c25NZFVWU2hFM0g1Q3JmOUhqY0NiVXVQaTl1Sk1nVERQaUdmMUxpY3BO?=
 =?utf-8?B?UHZiZGd4SXc3eUprb1V2dzEraUZWeTRvNnAybDc0NVg5L3grY0pabjQ4Y1dH?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61BA395EA978F043B4C7AFB4A4975418@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade8e5fe-4ff4-40d0-d281-08dc6b54b728
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:37:57.3899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBJaC2i5dgnitonWA9PpM6tGLmYttwyYs4or9ITUKtCoI8/zUuVAn4UcmjlsOo1bEcxrcYVIIABMgIAqdtJbBWu6QLplbkboLiwTIbKvAn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
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

T24gRnJpLCAyMDI0LTA1LTAzIGF0IDA4OjMwICswMDAwLCBNYW5uYSwgQW5pbWVzaCB3cm90ZToN
Cj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSG9nYW5k
ZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU2VudDogRnJpZGF5LCBN
YXkgMywgMjAyNCAxOjAyIFBNDQo+ID4gVG86IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1hbm5h
QGludGVsLmNvbT47IGludGVsLQ0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTXVydGh5LCBBcnVuIFINCj4gPiA8
YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVs
LmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDYvNl0gZHJtL2k5MTUvYWxwbTogQWRk
IGRlYnVnZnMgZm9yIExPQkYNCj4gPiANCj4gPiBPbiBUaHUsIDIwMjQtMDQtMjUgYXQgMDA6MDgg
KzA1MzAsIEFuaW1lc2ggTWFubmEgd3JvdGU6DQo+ID4gPiBGb3IgdmFsaWRhdGlvbiBwdXJwb3Nl
IGFkZCBkZWJ1Z2ZzIGZvciBMT0JGLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmlt
ZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uY8KgwqDCoMKgIHwgNDgNCj4g
PiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmjCoMKgwqDCoCB8wqAgMiArDQo+ID4gPiDCoC4uLi9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jwqAgfMKgIDIgKw0KPiA+ID4gwqAzIGZpbGVz
IGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gPiBpbmRleCBiMDg3OTk1ODZi
NTguLjJkMzAyN2MyZmIwYSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiA+ID4gQEAgLTM0MywzICszNDMsNTEgQEAgdm9pZCBpbnRl
bF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxfZHANCj4gPiA+ICppbnRlbF9kcCwNCj4gPiA+
IMKgew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGxubF9hbHBtX2NvbmZpZ3VyZShpbnRlbF9kcCwg
Y3J0Y19zdGF0ZSk7DQo+ID4gPiDCoH0NCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgaW50IGk5MTVf
ZWRwX2xvYmZfaW5mb19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZA0KPiA+ID4gKmRhdGEp
DQo+ID4gPiArew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2Nvbm5lY3RvciAq
Y29ubmVjdG9yID0gbS0+cHJpdmF0ZTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoY29ubmVjdG9yLQ0KPiA+ID4gPiBiYXNl
LmRldik7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+ID4g
PiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsNCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGVudW0gdHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlcjsNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGJvb2wgbG9iZl9lbmFibGVkOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKg
aW50IHJldDsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGRybV9tb2Rlc2V0
X2xvY2tfc2luZ2xlX2ludGVycnVwdGlibGUoJmRldl9wcml2LQ0KPiA+ID4gPiBkcm0ubW9kZV9j
b25maWcuY29ubmVjdGlvbl9tdXRleCk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0K
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+ID4gPiAr
DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBjcnRjID0gY29ubmVjdG9yLT5iYXNlLnN0YXRlLT5jcnRj
Ow0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGNvbm5lY3Rvci0+YmFzZS5zdGF0dXMgIT0gY29u
bmVjdG9yX3N0YXR1c19jb25uZWN0ZWQNCj4gPiA+IHx8DQo+ID4gPiAhY3J0Yykgew0KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1FTk9ERVY7DQo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7DQo+ID4gPiArwqDCoMKgwqDCoMKg
wqB9DQo+ID4gPiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBjcnRjX3N0YXRlID0gdG9faW50ZWxf
Y3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRm
KG0sICJMT0JGIENyaXRlcmlhIG1ldDogJXNcbiIsDQo+ID4gPiBzdHJfeWVzX25vKGNydGNfc3Rh
dGUtPmhhc19sb2JmKSk7DQo+ID4gDQo+ID4gSSdtIHN0aWxsIG5vdCBjb252aW5jZWQgb24gdGhp
cy4gaGFzX2xvYmYgfj0gQUxQTV9DVExfTE9CRl9FTkFCTEUNCj4gPiBpbg0KPiA+IEFMUE1fQ1RM
LiBUbyBteSBvcGluaW9uIGl0IGlzIGVub3VnaCB0byBkdW1wIHNlcV9wcmludGYobSwgIkxPQkYN
Cj4gPiBzdGF0dXM6ICVzXG4iLCBzdHJfZW5hYmxlZF9kaXNhYmxlZChsb2JmX2VuYWJsZWQpKSBi
ZWxvdy4gTWF5YmUNCj4gPiBBVVhfV0FLRSBhbmQgQVVYX0xFU1NfV0FLRSBjb3VsZCBiZSBkdW1w
ZWQgaW5zdGVhZD8NCj4gDQo+IENhbiBhZGQgYXV4LXdha2Ugb3IgYXV4LWxlc3MgaW5mbyBhcyB3
ZWxsLg0KPiBCdXQgYXMgTE9CRiBmZWF0dXJlIGlzIGRlcGVuZGVudCBvbiBhZGFwdGl2ZSBzeW5j
IGZpeGVkIHJlZnJlc2ggcmF0ZQ0KPiBtb2RlICh3aGljaCBjYW4gYmUgZHluYW1pYyBhcyBwZXIg
dXNlciBpbnB1dCkgYW5kIEFMUE0uIEkgd2FudCB0bw0KPiBleHBvc2UgYm90aCB0aGUgY29uZGl0
aW9ucyBhcmUgc2F0aXNmeWluZyBvciBub3QgYWxvbmcgd2l0aCBzdGF0dXMuDQoNCklmIGFsbCB0
aG9zZSBjb25kaXRpb25zIGFyZSBzYXRpc2ZpZWQgKGkuZS4gaGFzX2xvYmYgaXMgdHJ1ZSkgdGhl
biANCkFMUE1fQ1RMICYgQUxQTV9DVExfTE9CRl9FTkFCTEUgaXMgdHJ1ZT8gU28gSSdtIHdvbmRl
cmluZyB3aGF0IGlzIHRoZQ0KYmVuZWZpdCBmcm9tIGR1bXBpbmcgaGFzX2xvYmY/DQoNCkJSLA0K
DQpKb3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gUmVnYXJkcywNCj4gQW5pbWVzaA0KPiDCoA0KPiA+
IA0KPiA+IEJSLA0KPiA+IA0KPiA+IEpvdW5pIEjDtmdhbmRlcg0KPiA+IA0KPiA+ID4gKw0KPiA+
ID4gK8KgwqDCoMKgwqDCoMKgY3B1X3RyYW5zY29kZXIgPSBjcnRjX3N0YXRlLT5jcHVfdHJhbnNj
b2RlcjsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGxvYmZfZW5hYmxlZCA9IGludGVsX2RlX3JlYWQo
ZGV2X3ByaXYsDQo+ID4gPiBBTFBNX0NUTChjcHVfdHJhbnNjb2RlcikpICYgQUxQTV9DVExfTE9C
Rl9FTkFCTEU7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRmKG0sICJMT0JGIHN0YXR1
czogJXNcbiIsDQo+ID4gPiBzdHJfZW5hYmxlZF9kaXNhYmxlZChsb2JmX2VuYWJsZWQpKTsNCj4g
PiA+ICsNCj4gPiA+ICtvdXQ6DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBkcm1fbW9kZXNldF91bmxv
Y2soJmRldl9wcml2LQ0KPiA+ID4gPiBkcm0ubW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7
DQo+ID4gPiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ID4gK30NCj4g
PiA+ICsNCj4gPiA+ICtERUZJTkVfU0hPV19BVFRSSUJVVEUoaTkxNV9lZHBfbG9iZl9pbmZvKTsN
Cj4gPiA+ICsNCj4gPiA+ICt2b2lkIGludGVsX2FscG1fbG9iZl9kZWJ1Z2ZzX2FkZChzdHJ1Y3Qg
aW50ZWxfY29ubmVjdG9yDQo+ID4gPiAqY29ubmVjdG9yKQ0KPiA+ID4gK3sNCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gdG9faTkxNShjb25uZWN0
b3ItDQo+ID4gPiA+YmFzZS5kZXYpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRlbnRy
eSAqcm9vdCA9IGNvbm5lY3Rvci0+YmFzZS5kZWJ1Z2ZzX2VudHJ5Ow0KPiA+ID4gKw0KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKERJU1BMQVlfVkVSKGk5MTUpIDwgMjAgfHwNCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb25uZWN0b3ItPmJhc2UuY29ubmVjdG9yX3R5cGUgIT0NCj4gPiBE
Uk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybjsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRlYnVnZnNfY3JlYXRl
X2ZpbGUoImk5MTVfZWRwX2xvYmZfaW5mbyIsIDA0NDQsIHJvb3QsDQo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25uZWN0b3IsICZp
OTE1X2VkcF9sb2JmX2luZm9fZm9wcyk7DQo+ID4gPiArfQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gPiBpbmRleCBhOWNhMTkwZGEz
ZTQuLjAxZmQwOGViOTZmNSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uaA0KPiA+ID4gQEAgLTExLDYgKzExLDcgQEANCj4gPiA+IMKgc3Ry
dWN0IGludGVsX2RwOw0KPiA+ID4gwqBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZTsNCj4gPiA+IMKg
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGU7DQo+ID4gPiArc3RydWN0IGludGVsX2Nvbm5lY3Rv
cjsNCj4gPiA+IA0KPiA+ID4gwqBib29sIGludGVsX2FscG1fZ2V0X2F1eF9sZXNzX3N0YXR1cyhz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKTsNCj4gPiA+IMKgYm9vbCBpbnRlbF9hbHBtX2NvbXB1
dGVfcGFyYW1zKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gPiBAQCAtMjAsNCArMjEs
NSBAQCB2b2lkIGludGVsX2FscG1fY29tcHV0ZV9sb2JmX2NvbmZpZyhzdHJ1Y3QNCj4gPiA+IGlu
dGVsX2RwDQo+ID4gPiAqaW50ZWxfZHAsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlDQo+ID4gPiAqY29ubl9zdGF0ZSk7DQo+ID4gPiDCoHZvaWQgaW50ZWxf
YWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlDQo+ID4gPiAqY3J0Y19zdGF0ZSk7DQo+ID4gPiArdm9pZCBpbnRlbF9h
bHBtX2xvYmZfZGVidWdmc19hZGQoc3RydWN0IGludGVsX2Nvbm5lY3Rvcg0KPiA+ID4gKmNvbm5l
Y3Rvcik7DQo+ID4gPiDCoCNlbmRpZg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KPiA+ID4gaW5kZXgg
MzVmOWY4NmVmNzBmLi44NmQ5OTAwYzQwYWYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQo+ID4g
PiBAQCAtMTMsNiArMTMsNyBAQA0KPiA+ID4gwqAjaW5jbHVkZSAiaTkxNV9kZWJ1Z2ZzLmgiDQo+
ID4gPiDCoCNpbmNsdWRlICJpOTE1X2lycS5oIg0KPiA+ID4gwqAjaW5jbHVkZSAiaTkxNV9yZWcu
aCINCj4gPiA+ICsjaW5jbHVkZSAiaW50ZWxfYWxwbS5oIg0KPiA+ID4gwqAjaW5jbHVkZSAiaW50
ZWxfY3J0Yy5oIg0KPiA+ID4gwqAjaW5jbHVkZSAiaW50ZWxfZGUuaCINCj4gPiA+IMKgI2luY2x1
ZGUgImludGVsX2NydGNfc3RhdGVfZHVtcC5oIg0KPiA+ID4gQEAgLTE1MTUsNiArMTUxNiw3IEBA
IHZvaWQgaW50ZWxfY29ubmVjdG9yX2RlYnVnZnNfYWRkKHN0cnVjdA0KPiA+ID4gaW50ZWxfY29u
bmVjdG9yICpjb25uZWN0b3IpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZHJyc19jb25u
ZWN0b3JfZGVidWdmc19hZGQoY29ubmVjdG9yKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRl
bF9wcHNfY29ubmVjdG9yX2RlYnVnZnNfYWRkKGNvbm5lY3Rvcik7DQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgaW50ZWxfcHNyX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaW50ZWxfYWxwbV9sb2JmX2RlYnVnZnNfYWRkKGNvbm5lY3Rvcik7DQo+
ID4gPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoY29ubmVjdG9yX3R5cGUgPT0gRFJNX01P
REVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IHx8DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSB8fA0KPiANCg0K
