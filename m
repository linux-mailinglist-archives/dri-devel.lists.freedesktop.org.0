Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FDE938DAE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 12:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D7810E4BE;
	Mon, 22 Jul 2024 10:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ES6WIms1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6673710E4BA;
 Mon, 22 Jul 2024 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721645466; x=1753181466;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UtpwCRE7IJ4zY/tcwQbJfciKFZW32MVNiMCsQsOXEwY=;
 b=ES6WIms11/0DaG5o3eyKbRAFZDGagsbwmOOmbwjXrRFcrUIHa36HmuBL
 eQ6n41ftf7RRo0Tru7u3ovsBXxm4d6TeDwYkoZjbFGyWZ0+KSiBsl/s2a
 ALwVoiN7IiVyjfWk7SHKeHQsl+Zrcy7BeYbiYVinToJTsoO/3eBmb6DJy
 8zzPmHZqf1yi1CLN0RRn8JoyUVa4XeQBAthNTVDWscAAAgn/u/2ZqKtrK
 AZyfrve6zjvD6j8ToFcVEquMW47BDjGKZWEzJGHW7Zuae48yGbeWDw3yg
 QY38EcYoWf2kAv/3Spg8IS6D0x4Y5mzEIqRw/v7JrMHEOoJNtjLK/24+4 A==;
X-CSE-ConnectionGUID: I2AE9t6fSSqehcHDvML48w==
X-CSE-MsgGUID: g17Yx5S9RjueUN2jwUfsig==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="29823296"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="29823296"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:51:05 -0700
X-CSE-ConnectionGUID: jox2CPFJQu2uKmC/qQRGlA==
X-CSE-MsgGUID: /MfQsiqxQOmTJ+91raL0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="56406984"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 03:51:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 03:51:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 03:51:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 03:51:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 03:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jM40SbZXW5WOdxE4OE5IXFOpR9Vuwayd6LkQuFDxuGJx9cec358ESow29V3WfjbvYVMczWe8RdVruwV2qV2g0HY/1iHVGbw8ZJNydfzjL1m1pcLSKn0Cv210CMgMrzF7kDNgNg3bQbiGgBPlZrJ+ik03GZMANE4fIEaatpHXCYgfjOSVaK7LOGAQqdsZT0bg81pBKtVmSxndCZx64gdl550K+L3jhzumo12aHxfY9tr1NEEWVA0zBtGnIO4x8wrZ1hDZoCas6xD5uCUaMN78Ig5dWGTdP97TDr6xgFmphsyeLgoSWl7bETolg6ARklsZ/ROe2g06DUueSEkrceYuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcfM6i8H+lojuoj8XsKyrjIjUOFkcyv+uheui/ICXho=;
 b=a6+oQvY3neHikbepZLVPXIPl6r36qXbY4W4StHVapsGH+WEytO0WsVdgk6BzGaRSZ2ch552wniRt55H1XO7jwWYDXsXDI5jOJJLNgKozbMyK+OtJC8sfZe7gKbdSslmc1UI80N4ia5biWRyI4k7LHrLunOuMQrRyQo/0sDsPGnf6WoEqjeeEbJtw9riutac23hI1a5nkF2kuhArE+0EpvffXxNqRe8EQR4+Vys5RN463JTseetND6yOzrdsvN87nyefEHe1W9zOqG2rbSkYsnsohyu6HpsvcaNbABmfh1As9SA7OtGOAM8IoXMRh/1NSR2t7IsIpsqP55vh81Y2r3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8361.namprd11.prod.outlook.com (2603:10b6:610:172::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Mon, 22 Jul 2024 10:51:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 10:51:02 +0000
Message-ID: <8b7a3b03-1c09-4b1c-8816-4779176e7903@intel.com>
Date: Mon, 22 Jul 2024 16:20:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/hwmon: expose fan speed
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <ashutosh.dixit@intel.com>, <karthik.poosa@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20240712122356.360613-1-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240712122356.360613-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: fece2ac3-7772-47f1-914d-08dcaa3c2da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1dhUExYc1ByaVAxNWRNRzV6dEZHT2pPMmpURlB4Qm5XM29Kc1RWNkhSUFdl?=
 =?utf-8?B?S2lzZldMdFFVQWNFck9PZis0NG9OcHNGMEprSW5ZdXYzclJoSDNpc0VMYzRx?=
 =?utf-8?B?dGM0dFYvR3picWFjNnZBMmJFMDRlblFxUWxDVkV2MkpMVUVEeWQwdnVCQTVq?=
 =?utf-8?B?S3ViVllVUTAzSGlvLzRSMFNnbzRYMTdUUnZ6VStWSXFSSjZpZHFSb2Y0c1ZB?=
 =?utf-8?B?dExQWWYxcEtBbHN1NHZvc0tuY0toL0VFazh5QXhzYWNWUHVhZHo1M2VZSDcr?=
 =?utf-8?B?bjRqVW9MQm5RN1VtTW5BN2lhT3RDZENFbkxlOVUyNkd2b0NxS3YyeWlRZEpt?=
 =?utf-8?B?Q1VyVlpTMWhZaUJTaVNQOUJEcEl5U1ljMlBGbUhGcjFyKzBobnZneENhYUk2?=
 =?utf-8?B?QWZoSVBDT0Y2WFRsSmVBMlRTbHF4c0RqcnlrVGYvbUw5V0FCVkZkc2wwNko0?=
 =?utf-8?B?a0FJRGEveTNUcXdNRHpYQm5sZ2FLT3QzZzlWZTg5a3hwa21XTlhsRjN2TFRO?=
 =?utf-8?B?MkttWW9ldjZtazBnaGlNU0JhREJLQktkaFdUOU9kekx2NUkzZ1pBVTlVTmZr?=
 =?utf-8?B?R01QNDlaMnVRK3pKR0FWUVZkMjZ5d2VLUC9EUnd1eTNPTkRzVTBwbHErUUlH?=
 =?utf-8?B?L1ZBRklncGFIQlFWbGdoS2pBZ0w4Mk5BU21XUEttUUk4TXY0ZFMzSnFTZEFN?=
 =?utf-8?B?d3paMkJPamNnTFovTGpGVkNwUTBpZlVpemljN0EzYmdMdTRJdVVZNktlT3hV?=
 =?utf-8?B?dzN6bGJwY2lhVzVVVncxZnFadTdmQUJSYW5MdXBlR2lhQTh0Z0djVTZ2OGFF?=
 =?utf-8?B?bWFmSjlxVUpXcDNWRlZLUVJVNG4vT2xkWmlDZ0RTbTkrY3FGUXZycmlNZkNK?=
 =?utf-8?B?WGJiQ2dCSUd4QllTN0g2N2haYmpiVWJIRUltbDREaHlBZmZQdUdESm1YZ0xH?=
 =?utf-8?B?TkhxY2J6cXB2dGIwQ2NacUtaQUkzcTR3bTJweUN4SmVqN2VIcEVtWkd4WUg3?=
 =?utf-8?B?ZnpOTmxNdWJoSlZZRzlTeDJ3TlhtWUhYUlFSVzVsTTYzd3lSSnRIRzFwZHg1?=
 =?utf-8?B?Sk1ld0lVUjA3RUpmV3FsQm9JRnE0eDZNRmkwR1BUZ3l0NmVxQXJzTXhhVjJt?=
 =?utf-8?B?YXFzZWFQYytCSHRTT09kR2FBR3ppZkxOQ1gwemhidXQ1ZTk4Vm15UHA5UVEw?=
 =?utf-8?B?RkExTUpyeFRHVUxvRDZXVEdxMVEveE9Lbm54aVRaeHlhTE9zYzFaUDdjTHEz?=
 =?utf-8?B?dFlXL1BXVzUwM2JPK2pXL1FVVkZNMy9Fa2xkeWYxRURSTDlheDZQRy9KcEo0?=
 =?utf-8?B?dlpTbUR6bDZ4eUlQdGpqamJucFVqemd5TGxKTFYyeTIxSGZHWU9uZExkN2Zi?=
 =?utf-8?B?YWQ4am9pR0ZVV2dBRmlSYmxva09BRFBEK05kSlF0UlR0RURuUDF5M1lGdHYw?=
 =?utf-8?B?elhaRlBmKzY3TjBoYUEwdDNDdEdpZTdGakYxeGZRWG0zV0Z4a0EwcVB3Skcr?=
 =?utf-8?B?eDkrbTFRTHBCQ2tOWjRrUnVZc2NYZ1FnL3dyeFZCS2Z3NkIvNmFONlRoS2tH?=
 =?utf-8?B?STBhdFNRazhEcXlzYVZldXdOcWFXMGFTT2FWNndQOU5NVS9xM2xmK3BleE1l?=
 =?utf-8?B?QTBvMWt6UysxRGp3eTZoNFJNZGtTaFVMK0w2eTJNUEtoMTVNUW01Nndudjgz?=
 =?utf-8?B?N2lNcDk3YjVzZ1pVWlQ0Q1p2R21HU0FNK1IxVlVKVGpqRmhtWnBwMjA4M0VF?=
 =?utf-8?B?WVVGSkx1eWt3N3Y2YkthOUpabWxUVFlKUWExMXRSNC9qdkZpNFUrb0ljOVRa?=
 =?utf-8?B?OCtoOVVoaE9SOGVmbXIxUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1U3UWtxQSt3SWFsaE42ZEZTM3RYVjBUY0lvMzVWL3VRMTArR2ZGMjNDV1ky?=
 =?utf-8?B?TFVxOWVyYmt1WFZYTHVRaUNRZGlJWkZRamllTWRmdDZxVDJ2RUNkbHBueitr?=
 =?utf-8?B?Y2gvcFVDc3gwWHFRN3hjZFRkOElPN2lVTlJXVEoxdUUxMTdVdUdmcmNvTGhU?=
 =?utf-8?B?ZkhYWXBqZ2E0cDc5ajVuT00rNE03N2ZVVG1TQzE0Yk9LRzIwVWYzOXQyMlQ4?=
 =?utf-8?B?NHRRczUyNkVwbkVZTVQ2ZHh4WHVOdUpvV3REMnA5Z3RueGt4MGpETnBEQ2Fn?=
 =?utf-8?B?M2hoVFU5aDRJN3NqL1RLeVRxRjBqdTJQMWU5K1dNMHBvNUgzQXBVNkYyamd6?=
 =?utf-8?B?ZzR3VUdmSnVyeEtZQ0JKeGJKblJaMUJKcHl4cjZjby9tN0paT29LMDhpcGlT?=
 =?utf-8?B?QWpKYkl1U2lzbXJFRkVLTkI0Si8rTk02MWh2VVM1OXhLbm1NeGJHem8xanAw?=
 =?utf-8?B?eTFieWV5UFNmc0RoWWZqTmNqSi9KWXVXWWh1NUJhemJGN0RRdnhRMHo3UzEz?=
 =?utf-8?B?dSs1VnliZVR6V1VqdkxvRmFSazNpYnE4OFQwWUFlSUZvVStDVENhME9lUUhw?=
 =?utf-8?B?K0VpT2hmY2tLczMyK1k3dTlkMktBdU94bWNHa3NWa2Z1MHhCOHBmQnZ4NU8x?=
 =?utf-8?B?SzVQV0xXYkJZTGk1M012UlRZSFp6MnQxUUU3ZnVydXhHcW83QytpZzJHT1Fa?=
 =?utf-8?B?b2JPMTIyditXZFJWOU4xeXlQVFRjeWl1aHM5bUFqSEgwdXQ3NnFyUmdJWDJI?=
 =?utf-8?B?cTBjV3JwSGxKTnVaT25DaUJqeVZXRFNwSTExRnh5Sk1VTUF3NEFjQnJsRmVX?=
 =?utf-8?B?YmRkNmZSVFdIR2R0Y1hjTE1MclhxNDNvV3FLKzEveUVLcFBlVjFNem0yRnFj?=
 =?utf-8?B?MWY5eEx1UEhHdHdKcGtCdEpTSEE5T2tzOHFKTlA0M0JkQzVwbmViL2dGU2lo?=
 =?utf-8?B?bkRhRzFvbXFYbXpRdFJzZnZ6Ty9oYmJBM0NXakN4TTZMcHZXU0RDU1Jyd2Jv?=
 =?utf-8?B?RzJKWXg4cDhxMVhCRUxGUG5Gdkl1azR2ZGk1b3Fia1V1Ujl2QjcxVFNNU1Nh?=
 =?utf-8?B?NkFwMEVzcHB2VVgwdnlGTkxXWmc4dlJLemdKSUp2T204V3RrTEVpQ3NUSnlE?=
 =?utf-8?B?NGVrNno3SXJVSTFIQStyR3NyRTVZVDh1RnZqeVRWclF0R1RxSEExYVppQ0hL?=
 =?utf-8?B?TGV6SmdERERlWS9zVnMyVDhLSG5rZUowTHpPbGRjaUtrMGZjV0FzbCtyNnBG?=
 =?utf-8?B?bHJ4REltdzdSRmRubjRFcmltVWJKT056ZjBsc0hnQWVRWEFrQnM5T2hhTmt3?=
 =?utf-8?B?SzlNUytIbm5EUVJGanBVZkRqaU90Y0VmVlNvMFZyZEw3WmxVa0dHNFJKR2VU?=
 =?utf-8?B?MTh0d0JJL2RpVjBINnJoR2NyOUFHaFhEcDlDNzRyZGxuSWFBNjM4RngwbUpE?=
 =?utf-8?B?RmVMK0hrVXZwWGZFUllHbHhHS284T084VFYxOHlJY2ZhOU1nQlU3M0YwS2FM?=
 =?utf-8?B?NnpmcnJ0bHRnVy9VbnRta0pjNk00TG0xMUQrMi9HdHg4bWNiWWM3aGJEWHUy?=
 =?utf-8?B?Z0Z0MTVFb3VQbFoxZmNsQU0xOEFpek1WZDA1VDlaenZOMFdRTXdZZUJxaG1Z?=
 =?utf-8?B?R3VHRGNkMWlycGtnMG0xREVUVmxTN011UVdCMUl4L2Z3aUtvQ296ZC9DbDcy?=
 =?utf-8?B?RkEvRzRmUm9UWUNrQUxHQ1pSOW5hWXF1clQ0T1hCbm13NTIyVWF4SEk0Z2tI?=
 =?utf-8?B?b3k4cUFMSUp4c05EMk5NblFoRlVnWEEyRWNVSGZHekw2bWZJcVpMWUdacjZF?=
 =?utf-8?B?dTQxaWZzajJiVVdyNWc2UXd5ZzFEY2w2VmlqU1lJVUNOVk91T1YrVjFoakNt?=
 =?utf-8?B?UFBnM3dCM3V6bHlXWEdROXZJNWJkT1ZCMWFBaE5kdjRHSUkzL1VXY2Z2K0JL?=
 =?utf-8?B?Wk1TbGhoaGFmTUU5UDlZK05HZFZld0FGNG13ZHhQL2ptMnh2YWppMVNtTFM0?=
 =?utf-8?B?NXF3VldrWlhEaGhZT29Sc2Z1Ulh0dTlrdWYyblpwbStNTWhNTEhFWS9ReG1l?=
 =?utf-8?B?YWV0M3M3cEd4UktJMDZLcUlIYXFCTkN2UTNqbERsTUJkdHBLdzNYWGVDRHZI?=
 =?utf-8?Q?aqxxn0uJiAdGE1s5Jz000SWTK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fece2ac3-7772-47f1-914d-08dcaa3c2da7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 10:51:02.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6FGOyMtsgNIZJmKTWMn7+rwXaG0RMvANYrmWmYGGnc2/3P+lnPJS2jqjDBM1cc2rUMVPIHhsLJqGI7Q3LiGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8361
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

Hi Raag

On 7/12/2024 5:53 PM, Raag Jadav wrote:
> Add hwmon support for fan1_input attribute, which will expose fan speed
> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         653.00 mV
> fan1:        3833 RPM
> power1:           N/A  (max =  43.00 W)
> energy1:      32.02 kJ
> 
Add fixes tag with the bug link
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 +
>   drivers/gpu/drm/i915/i915_hwmon.c       | 71 +++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index e42b3a5d4e63..407d8152755a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1553,6 +1553,8 @@
>   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>   
> +#define GEN12_PWM_FAN_SPEED			_MMIO(0x138140)
Use PCU prefix
> +
>   #define GEN12_RPSTAT1				_MMIO(0x1381b4)
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 49db3e09826c..f829c7837d83 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -36,6 +36,7 @@ struct hwm_reg {
>   	i915_reg_t pkg_rapl_limit;
>   	i915_reg_t energy_status_all;
>   	i915_reg_t energy_status_tile;
> +	i915_reg_t fan_speed;
>   };
>   
>   struct hwm_energy_info {
> @@ -43,11 +44,17 @@ struct hwm_energy_info {
>   	long accum_energy;			/* Accumulated energy for energy1_input */
>   };
>   
> +struct hwm_fan_info {
> +	u32 reg_val_prev;
> +	u32 time_prev;
> +};
> +
>   struct hwm_drvdata {
>   	struct i915_hwmon *hwmon;
>   	struct intel_uncore *uncore;
>   	struct device *hwmon_dev;
>   	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
> +	struct hwm_fan_info fi;			/*  Fan info for fan1_input */
>   	char name[12];
>   	int gt_n;
>   	bool reset_in_progress;
> @@ -276,6 +283,7 @@ static const struct hwmon_channel_info * const hwm_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>   	NULL
>   };
>   
> @@ -613,6 +621,55 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val, rotation, time, time_now;
> +	intel_wakeref_t wakeref;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> +
> +		time_now = jiffies_to_msecs(jiffies);
> +
> +		/*
> +		 * HW register value is accumulated count of pulses from
> +		 * PWM fan with the scale of 2 pulses per rotation.
> +		 */
> +		rotation = (reg_val - ddat->fi.reg_val_prev) >> 1;
> +		time = time_now - ddat->fi.time_prev;
> +
> +		if (!time)
> +			return -EAGAIN;
> +
> +		/* Convert to minutes for calculating RPM. */
> +		*val = DIV_ROUND_UP((long)rotation * (60 * 1000), time);
use MSEC_PER_SEC
> +
> +		ddat->fi.reg_val_prev = reg_val;
> +		ddat->fi.time_prev = time_now;
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -628,6 +685,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_energy_is_visible(ddat, attr);
>   	case hwmon_curr:
>   		return hwm_curr_is_visible(ddat, attr);
> +	case hwmon_fan:
> +		return hwm_fan_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -648,6 +707,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_energy_read(ddat, attr, val);
>   	case hwmon_curr:
>   		return hwm_curr_read(ddat, attr, val);
> +	case hwmon_fan:
> +		return hwm_fan_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -739,12 +800,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
>   		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = GEN12_PWM_FAN_SPEED;
>   	} else {
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = INVALID_MMIO_REG;
>   	}
>   
>   	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -771,6 +834,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		for_each_gt(gt, i915, i)
>   			hwm_energy(&hwmon->ddat_gt[i], &energy);
>   	}
> +
> +	if (i915_mmio_reg_valid(hwmon->rg.fan_speed)) {
> +		/* Take initial readings and use it while calculating actual fan speed. */
> +		with_intel_runtime_pm(uncore->rpm, wakeref)
> +			ddat->fi.reg_val_prev = intel_uncore_read(ddat->uncore,
> +								  hwmon->rg.fan_speed);
> +		ddat->fi.time_prev = jiffies_to_msecs(jiffies);
> +	}

Move this under with_intel_runtime_pm condition used above.

Thanks,
Riana
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
