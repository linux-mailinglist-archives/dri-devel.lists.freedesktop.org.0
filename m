Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EBAF9384
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86810E02A;
	Fri,  4 Jul 2025 13:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvQ7k+gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0FF10E02A;
 Fri,  4 Jul 2025 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751634257; x=1783170257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cvDKr2sc241hhBdrk9JN3wEWnmzlZcmZK8uRTpynjhc=;
 b=cvQ7k+gwyTm/KD7pNnsxTBF05N0OhTn7/rOFMPJ39HGnZJmyVI9qQbeE
 1u7DYgHDfBiGq+XGsM1k4QrxUSaXKqh00wuD1iUKgQ5eg/6S1czMBfdu2
 fp69wSww2tbBEzNI7RZB/cloY8M1sLNJffRZz2Nbj5YAjUw2yJVhjs7D6
 H2wh0Ni3p7fF6M4nwB9mma6pZ51qPUZXzegpLEe2lDc29SbUiY3nAm9Aq
 2/UltS8xlTKEjwHGzpVpTtGQJaQz57JqSn1WVwjfYDIjxWfNKdSTuaOxG
 +2nX935AFLWiB8qCKtnXwuAjDUi9zgxQc5ehwgy7d+MCovzlAaB4xKMQy w==;
X-CSE-ConnectionGUID: IYSQxX5TRJKeVvWRP1H6RQ==
X-CSE-MsgGUID: NmSQVgd/S5C0rbR0CjdZhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54085944"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="54085944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 06:04:16 -0700
X-CSE-ConnectionGUID: 0Gjb6Ud5Rb6lG1CPfKL2TA==
X-CSE-MsgGUID: uH4H5sX0TnuPjiu7kl2MnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="160157421"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 06:04:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 06:04:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 06:04:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 06:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItQjkGDnRwGWiDYDmTomxkVnycbKBCna2Zmya95lP8lYufiwfMKs8cbppXwufpd9fmcDwYQSM14xZMAh/FTk8A5b7HfUbrhuM8Ij6pihdX9ECJ9r25cPBu2Lg19tY6NKu9UMyje/ghJLDGxpgKFHd4uVAgTDqLtsB3LDEHV3pQx7EO5+bb6mTZMrxziEq9RpZA1Qe0JB7DSzMiymcPd1/mupKPyqjppOqkvZ57ck2NYM3Wy25IoExj8nabjbZGmEEWoCCZIRWQrsFKG8JOnmUdMQegQJ6jJUXqN2xgtXB2P+Tu7Bsjvi1OhEjy9PVFZ6SwGrj2+Sz6EBiDcD8D25pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL0DlKqItrDuTq/FxWKYDVdCWnUkftxGGPtDNjRhZ7M=;
 b=AQ7ZbQIW2b9xWNL2pDI4ys3oauL/6YElzFE5D1v9wMg1MukIt+mW+1h2JxNCKxAsbpbGCQWRy09lbGQSy3fBLhOyxaNiIeLJS88g1HudbJBJ4zEKbgCm8zGHO11jgj84gf06/ihlTCiVwB4JIMRoU8ysnd+tZ1KEhuaCZXIkO6Ot3if2XtcKWVrMQ35LZ92GT9UlnM80/WuqhosKB5jiiqADFpOoHIuKnems0toU/N0xNXs6OnvpL/pp6TFm0q3pIPhCY7Vuo5iAkkbzHGaz6cNwpuotG6nmGMmVGXcdu4iIsa3/PqjpEdw+3Rl0Aq8RNaeJgpElyEfMlU6dKqTr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS4PPFDA9EFDFDB.namprd11.prod.outlook.com (2603:10b6:f:fc02::55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 4 Jul
 2025 13:03:46 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 13:03:46 +0000
Message-ID: <01c93080-82a1-4968-9978-45cfd237cbd1@intel.com>
Date: Fri, 4 Jul 2025 18:33:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component driver
To: Greg KH <gregkh@linuxfoundation.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-3-badal.nilawar@intel.com>
 <2025070421-cattishly-buffed-d992@gregkh>
 <0b40eadc-c763-4cbc-910d-cbeb03b432d4@intel.com>
 <2025070452-rendering-passover-9f8c@gregkh>
 <fe774af5-76fb-4056-9eae-e2ccb0e0f078@intel.com>
 <2025070445-brilliant-savor-a98e@gregkh>
 <CY5PR11MB62115F7951B6045CF254B6A19542A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <2025070434-oversleep-amnesty-b4fd@gregkh>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2025070434-oversleep-amnesty-b4fd@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS4PPFDA9EFDFDB:EE_
X-MS-Office365-Filtering-Correlation-Id: 29eb6b25-2e10-449e-ebeb-08ddbafb35d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWtITTJxd0diSmlYSDNtNEVqSW1qdDZ2WjlsR0loOEZLRmJhOSszaXZ4KzQz?=
 =?utf-8?B?bUQ2UE5TZ1R1UnB1Tm5qWkpkUVdsQm1hbTdSeGhOaW50a3FXQjVjTitOWnBG?=
 =?utf-8?B?Mk5oVzF6ZWVIQmxoM1BIaGlXclVuaVZMWmxwbldaOThKRmsrbmpzdVpsbUh1?=
 =?utf-8?B?c214dTBLNzBvYjY4M0xlTElRL3JPQXhFOGM2TzBsdmpMcklmZ0R0bG96UWZj?=
 =?utf-8?B?bmE2VEFTblppd3N0bXBVVGVQbmN5ckFNMllrbjRwZzJ6ZE1qemxEVkp6Q1lp?=
 =?utf-8?B?cXNWdTFoWGFlcERIa21PbEdrMkFCL1pBdzdXcXEwSGRRTGUzYUtmVWtWRGQv?=
 =?utf-8?B?UFRTZHdlV0tselVDMVJVZGc4dTVEaWR0ZHdFRmRUUmZkTUs4cFowZjIvZ1ht?=
 =?utf-8?B?b283RFhpVUg1dmhlRjlhSFU4TlM3b3RBQkt0eG5GYXVpY1cxazhuREpzNjgw?=
 =?utf-8?B?M2FNNHJrdjZWUXM5U0ozWWdEZ1JIWnRPT2ZROW1HemFEcWJSc1hSdHdTRjR2?=
 =?utf-8?B?bHBHYnd1Q2o0UkRUNUxvUGdlaG1aUHc0VTNudzM2MHUzem4vaHdWYUxPd2FO?=
 =?utf-8?B?anljZUNJUjN4MDEvK2Q1MWxEdWgwRWVhNXMwMzV0ZlV6NlV0OEdWdGdRbEdw?=
 =?utf-8?B?anhyZ3hTVDRGcmdlbWY5TEZIMlBvWXZ4a2NGMzFZWU0vVW9hRmxuMmR0aGpX?=
 =?utf-8?B?Yis2Y0NDK2kxcXVOWjdHaUY2Yys1b0hrVTYwVHo2bzMwY21zemVKcEFyallo?=
 =?utf-8?B?SE5MTkNZdFRkdTdzRzI2Rnp6MkZRWHAwUHRqR1BRRlJZcEZBRWxhcm45a1pT?=
 =?utf-8?B?Z0FJN0kwdzNOaUVSSnNRejVVZVU5M1RIbFQ3M3RVekw1dWtiQ2FEdnM4WkpH?=
 =?utf-8?B?T3FHRm8wb3Uwc09qWnpKK2tDRm5Ca3J1SjVRZWs0VjFIZUFWQWhpeFZlMGZF?=
 =?utf-8?B?N1d5OTJRU3NVVW5WNUFZNkc3WXVKT21mM3hoZ0RzQW16RVZOVm9nZnpRb0xF?=
 =?utf-8?B?WkU2YlNZUVYzclRHZlUwemFFeGtPeU5BcGhra3UyNDhMMDlxdEdHdXVxcVpW?=
 =?utf-8?B?TmtYbmpvZWJjZmEwUTY5Tno5ZldNZW5uckhRMlVWcnR3S3hZc0VNWkFOSmFh?=
 =?utf-8?B?ZXM0a1laR2RieUVFeTZjaTRBSEJINDlhaGNQSW51czZYckRaamIyL3hDdkhm?=
 =?utf-8?B?OE0yN2ZudkY0NzRmUGVabEVhQjRDZnFhKzJqa21LdGNWR2UrRFRrK1hxdUhR?=
 =?utf-8?B?VWRPMHdqcHVsTnBsQUxpQnc4aE54aVl4eCtkZVg0bHBXM1lMcWJUTTR0REpu?=
 =?utf-8?B?M1N1aSs5Rm1ZUXBFd3hEd1htMFlvcEt5cVNJbXFFczRHZlNDZEtFK0lxdkFv?=
 =?utf-8?B?eW5wM3I5MGViazZIaS8xT2FsZk8wMGtVSTN6SzJMeEVDekJucUpYbmhCRG9J?=
 =?utf-8?B?N255NmxUWHByREx2Z3poNU1qZUdmS05xS3phNEJwcjE0cHZOcmtQTVI0bzNE?=
 =?utf-8?B?SWpqcmZrVy9vYTNuVHFGamZKOGdFaUpQeDRIbGlTWVBxZkcyKzBJeXphT3g4?=
 =?utf-8?B?OC9WTjVvTGxOU09jR0J2UzdGYjc3aFd1RURCcTVLVGgrc1dCWkNNc3pwQ1Fk?=
 =?utf-8?B?U0FwV29QZndQMkNiWi9pcU1aZ0VvbmxRZXdYWGZycWJ3b1FCMHFUQXRpZVRT?=
 =?utf-8?B?bWx1NitGVDVhbEt0VkJaSXFERVdZamdXTFBHZHNQM1g3eW81eVAxZVc3UzZi?=
 =?utf-8?B?emZlZ3dad3Y4bVNOTWtSODQ4b1FpZTJBenhDOVNqc1dXNnJzc1dSY3MzajhX?=
 =?utf-8?B?Uy8xZHUwMktDTnpoNHpVRDBSaEk4YUVEbk1WUitOajVjb05Gdi9QdTljZXlE?=
 =?utf-8?B?dEliZFJtblJ1NjN1NE1pVFNGUTNlTlovay9UM240N1A1TVh3OGd2bURkQ1BL?=
 =?utf-8?Q?+I/1MAaVv7o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JCdDVWS0JxQi9aT28zMkZzaVc3djhiOU8xclA2aVFIWUdIdEZJS0p6Mk1x?=
 =?utf-8?B?Z2RJYWtNWm8xaXRYT0dUOHRYbnUvaS9ZVWdxSjB3bXpRbmVrKzZ2Q3V4VlVv?=
 =?utf-8?B?UHpuZnZQR3BibERrZnlGdnJUNjB5SHZ1NWt6aEVib0xzQ05jMDRuM2lsZE5C?=
 =?utf-8?B?UERuRlNMc3F1MFRNNm1hclFGV1ltanBmNERRcWJPMVFleFBEZlJlVnc3RW5L?=
 =?utf-8?B?TW5WWjQ4VXp6ZkdvekVwQTV3T0MwSWF4SHI5U3JJV1pydXhyRWZNR1pnT2d0?=
 =?utf-8?B?OXk0YmVJcHVlU2ppNGc4OWtqbHljamhBWVMrYWRQZmwzSEs4R0xTT2M5ZmpF?=
 =?utf-8?B?RElteXV2M2J3ZHNSMWlOaWJUYU1TS1ZOdEFMOXROMi9FVE1BOGxZNzF2Q2Y0?=
 =?utf-8?B?Y1lac0pPRDhIQ1FPRFlLVEhUZVBxbEJwQm9CQlM3VU9sbmIrWXRpNDRuUnF3?=
 =?utf-8?B?ZWpNR0ZUM3NnQVdaRVRhaUVlWUhSTHlHTkhBeFp1WkJIcks0OHhhZ1JVV0Nq?=
 =?utf-8?B?d0RqcGNhS0RnUDltTWtoTjNLNGdKVzRDSW91c2tQR3lVN3QxSjhBbmZIQ1Qr?=
 =?utf-8?B?c3F5ZVIvdUoxUERnTS9aZ1JYa0JUZklKNjJxSThOK0NDOGhZSHBtVWZmYjNo?=
 =?utf-8?B?UkhMMHQyLzN2TCtScExXT3huZ0UwbFROemFZSXdoQmE1VEZxNE1TUG5OUEJT?=
 =?utf-8?B?by9wTkZ0cHVubHozWDRzc25Md2pIdWxyUm9xTDFwdFFKdHMzMzd6ak0wUTNo?=
 =?utf-8?B?WFFiOGcwcWFiSllXS2NSdkxqTGMwWE1Obm16dU1MdG4va3V3VmxiV1JsTDZJ?=
 =?utf-8?B?WnkvMm90M1c3WjFhTmVJNDJrZDFmRmpWRHE1RnlkNktFQU9vM0FHMUJnemky?=
 =?utf-8?B?YUlVUnoyR3JVZGRidFVCd0gvZXRxenpSSFlJb0xKSjdESjk3Wlc0RTdQU0Fk?=
 =?utf-8?B?K0Z2ZE1DNzlVMEluUkk5UjFXS0Uwb1FQeWk1VTJ3d3BpZy9SbzlrZWFFNkpN?=
 =?utf-8?B?Lzl2TzZZWEVtM0x3MkxnNlQyTUVTYlZnRElQQmZLRmJqWDhkeEltYkk0bkdT?=
 =?utf-8?B?NkRXOVdZTVFYSHcyaldPTjNqTGxaaXZYeUx2dk1xUXBXQ2x1cDZLSVZka2sw?=
 =?utf-8?B?Qlk3Tmk0OTdBZnd2ZjlwMjJ4VXdTdWRyck53NzgwZHJuWmJKcERKRVkxVUZW?=
 =?utf-8?B?NzEzMUdDTVlvZWVTTU5RbFBibWZ6R2pzQnBsU1U5MjdHWnZhUjdGaVJzaGhK?=
 =?utf-8?B?OVQ5Z1ArMnl0UmFVN3pydlNOYnNnSE5pbXRxOVdpd2srNWw1UGM0RFcybDY3?=
 =?utf-8?B?aThjSk1YU09abGZKZW1pckdreWtvYjJEcnpWNHd6K0djc2RYeXVTWVhsMmRX?=
 =?utf-8?B?VVJJWTNkMUY0a2Nqc1lhaGZjcWJNSFFCS3B0L1RmWDVWNXhTNVlmUDA2OUZG?=
 =?utf-8?B?akFVaDZJZ09POEloRU4vbWtYZ0MzcG5qQ0tuUEVwd25qWlJpUG53cGIwcm1G?=
 =?utf-8?B?bXNLVytQZ1hVOEwzOU8vMWJ2K3YyaWJ0b2txVFhpN3BIekpodElvQ0FhaWFy?=
 =?utf-8?B?eDRDd0dKWHlTMUczOWNmUnZ5Y2J2VEl0WGtaSUpoNWFzcFEzbjRRRkVkWEIx?=
 =?utf-8?B?ZnpORHZmcXdJZDJscU5idWJSUTZTbUNVRTR3b3AzQ3pTSUNMK29ZdlhiMVlv?=
 =?utf-8?B?K3ZUYm5JV2psWVJmVkJCdm5selh0elJTUitWZUNqNklXblpCQUJPS0ROcm41?=
 =?utf-8?B?QlFDZmQyaEtZWSswZmRweWY4NUlyNW9GV2YrZW5kUjg1ZGxVaGtzd1BzbkM5?=
 =?utf-8?B?WjZUUzhWVHJKU0NsdHM3elFNVC9WSHYxRFh4c3VXWE82REg3U1lHU1k5YWQ0?=
 =?utf-8?B?VkppTk1GN3pVVEpMVXQxUG4zNVZjLzlxb2lIT0EzeTVHa2lPSGpxTE9BUjNz?=
 =?utf-8?B?dUJ0N0dqRGwwcE4rMG9IZnJBRTBQbldCMzBpejhCMk1jSVhoV09WWHRUUDR2?=
 =?utf-8?B?MDZJZW81OXh2YXlVQllqb3IyNkJMZVFRSWhNbkpzNExHazFadVhxK2c5M2R5?=
 =?utf-8?B?Ui9hcmFPZHJyNHE2MzVaaEdWU0lsMFo0WVNrZnZ5NXAvMnBOT2NsYkRnV1RL?=
 =?utf-8?B?Z212Q09pWFY1YmNlTHhueXFpR1BqSy83eWI3cmtqZlJpNFRKaXFZVXFVb0dF?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29eb6b25-2e10-449e-ebeb-08ddbafb35d6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:03:46.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG6Gop/72TgwlyTnisUBcI/w3c93vJ3Sdaq9NUCctTxXCjw1GgKCvLO3m/YIb7DijZp2qYMEf7MbR2t8GY51WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDA9EFDFDB
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


On 04-07-2025 17:59, Greg KH wrote:
> On Fri, Jul 04, 2025 at 12:21:42PM +0000, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Greg KH <gregkh@linuxfoundation.org>
>>> Sent: Friday, July 4, 2025 5:31 PM
>>> To: Nilawar, Badal <badal.nilawar@intel.com>
>>> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>>> kernel@vger.kernel.org; Gupta, Anshuman <anshuman.gupta@intel.com>;
>>> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Usyskin, Alexander
>>> <alexander.usyskin@intel.com>; Ceraolo Spurio, Daniele
>>> <daniele.ceraolospurio@intel.com>
>>> Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component
>>> driver
>>>
>>> On Fri, Jul 04, 2025 at 05:18:46PM +0530, Nilawar, Badal wrote:
>>>> On 04-07-2025 16:04, Greg KH wrote:
>>>>> On Fri, Jul 04, 2025 at 03:59:40PM +0530, Nilawar, Badal wrote:
>>>>>> On 04-07-2025 10:44, Greg KH wrote:
>>>>>>> On Fri, Jul 04, 2025 at 01:00:58AM +0530, Badal Nilawar wrote:
>>>>>>>> From: Alexander Usyskin <alexander.usyskin@intel.com>
>>>>>>>>
>>>>>>>> Add late binding component driver.
>>>>>>>> It allows pushing the late binding configuration from, for
>>>>>>>> example, the Xe graphics driver to the Intel discrete graphics card's
>>> CSE device.
>>>>>>>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>>>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/misc/mei/Kconfig                    |   1 +
>>>>>>>>     drivers/misc/mei/Makefile                   |   1 +
>>>>>>>>     drivers/misc/mei/late_bind/Kconfig          |  13 +
>>>>>>>>     drivers/misc/mei/late_bind/Makefile         |   9 +
>>>>>>>>     drivers/misc/mei/late_bind/mei_late_bind.c  | 272
>>>>>>>> ++++++++++++++++++++
>>>>>>> Why do you have a whole subdir for a single .c file?  What's
>>>>>>> wrong with just keepign it in drivers/misc/mei/ ?
>>>>>> There is separate subdir for each component used by i915/xe, so
>>>>>> one was created for late_bind as well. Should we still drop late_bind
>>> subdir?
>>>>>> cd drivers/misc/mei/
>>>>>>         gsc_proxy/ hdcp/      late_bind/ pxp/
>>>>> For "modules" that are just a single file, yeah, that's silly, don't
>>>>> do that.
>>>> Another reason to maintain the sub_dir is to accommodate additional
>>>> files for future platforms. If you still insist, I'll remove the sub_dir.
>>> Move files around when it happens, for now, it's silly and not needed.
>>>
>>>>>>>> + * @payload_size: size of the payload data in bytes
>>>>>>>> + * @payload: data to be sent to the firmware  */ struct
>>>>>>>> +csc_heci_late_bind_req {
>>>>>>>> +	struct mkhi_msg_hdr header;
>>>>>>>> +	u32 type;
>>>>>>>> +	u32 flags;
>>>>>>>> +	u32 reserved[2];
>>>>>>>> +	u32 payload_size;
>>>>>>> As these cross the kernel boundry, they should be the correct
>>>>>>> type (__u32), but really, please define the endiness of them
>>>>>>> (__le32) and use the proper macros for that.
>>>>>> If we go with __le32 then while populating elements of structure
>>>>>> csc_heci_late_bind_req  I will be using cpu_to_le32().
>>>>>>
>>>>>> When mapping the response buffer from the firmware with struct
>>>>>> csc_heci_late_bind_rsp, there's no need to use le32_to_cpu() since
>>>>>> the response will already be in little-endian format.
>>>>> How do you know?  Where is that defined?  Where did the conversion
>>>>> happen?
>>>> Sorry, I got confused. Conversion is needed when assigning the
>>>> response structure elements.
>>>>
>>>> e.g ret = (int)(le32_to_cpu)rsp.status;
>>> But these are read directly from the hardware?  If not, why are they marked as
>>> packed?
>> Yes, these are read from firmware, that is the reason they marked as __packed.
>> IMHO, don't we need change the explicit endianness of response status to address your comment.
>> Are we missing something here?
> Yes.  The firmware defines these values as __le32, right?  And if you
> read a chunk of memory and cast it into this structure, those fields
> are now also __le32, right?  So to read them in the driver you need to
> then call le32_to_cpu() on those values.
Agreed. Therefore, the following assignment is valid and needed as ret 
can be BE if CPU is BE.

e.g. ret = (int)le32_to_cpu(rsp.status);

>
> Just like data on the USB bus, or any other hardware type.  You must
> define what endian the data is in and then convert it to "native" before
> accessing it properly.
Ok
>
> thanks,
>
> greg k-h
