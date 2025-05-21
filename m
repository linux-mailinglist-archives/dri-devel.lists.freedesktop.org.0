Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B13ABF408
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 14:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483E311B5CC;
	Wed, 21 May 2025 12:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvHC3sPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BD711B5BC;
 Wed, 21 May 2025 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747829819; x=1779365819;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Navm3tv5n/RUStJQWqE7FxZ7PxNxHMFKfnao8UkocJE=;
 b=fvHC3sPh9paFuy3cdnSrkgrIjzA9ZMTRgtP08tLcuBmM4Sjg8VF5vxDr
 q8qmptXYafesSf+W/pnjgA51gmEHCIRAN3l/zDEsyQj8sfW8z096PcPLl
 sPY5068NCW6ash3/vSr/PPdy2LE+obwVr/pZkX9e8+ZfgJpkjSYFv+MHR
 FF70wttMhMVbdkeuMpXzf7QFAr2bX0qwINMvLrTkZHd/AfoY8/UI7lYYo
 HnO0aSKBFaDIItH9z/SoMjCRT2nXP9c2Ms+fEy1WhSN83LVEd+Xd79yNc
 sVgbTKNRvYYEpRvZHU/6p0UWc75ycbhhePBEoEG/rtWZ4zF8Em8iydMjf Q==;
X-CSE-ConnectionGUID: /fNtribmSEGM3JBc3AvQzw==
X-CSE-MsgGUID: SFqeWDZwRVyS17wA6rQZ5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49679319"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49679319"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:16:59 -0700
X-CSE-ConnectionGUID: QcAz+kvMTU2bWh48Fk8u7Q==
X-CSE-MsgGUID: iOrQoY1hTESQnccEzF1mOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140560862"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:16:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:16:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:16:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieY+rL0MmDVOGlg+SPCcFS0ZP3dzNs/r0psPKIjxR0zxfKwtXTOhTM+WoRao/CzPfsCCueBrOOg1+0hbzmE499Fkv6crOzXiNVoclFtSUXpsU/odkZC5JYOW6CA2E0gL5d7oFnkKClz7y4n6f4Q/x0CW9VWTm/D/FH+CTkIC8/WhTXd0K2dF01+eJebWdGROA5md77C3OsrXl7fAWisyY9L7Soq7Y70C8vVQSCxj13TtCc/iwsMqlVH6QjiLy9gLtMgmOlvIngN+X9qZDFyjrwYx0A6+LKIEFXdg2AVaqr1cOx62Qj5J4HUeck23hERxehA5W0HAfNxFb5XG7tNc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LCVGwV3ZhLeMfcTGdAuc4lXkKKugQvwLHujOj+loZE=;
 b=MDlEysGYvi+N1+zuFzEMgrelhaVXVJohH4fizNx9ZzYbE3d8UUMIWhEHtZ4HDCKYhIFl9LH08dYvm/Ycr3yNPkI2tIVzRTNBbObyGIdnrDHY4zrhXfReBzUb3twuJzDnybtTyRow/RjKAqBEW4afZ/MgDPiCMPmQ1CBMbGrPv09g6XKJHr6Eb+Jm2HZ1rihZSwsR1+C0uloEzlbyImRIOw3Jst1LLzJHf8zUKYcTmwJ4gybWLgmIWt83vKCFRu1W0DLsCjUz6H4jv/tOb9utlP9L2mF3kgmausH/xwmaQoOBl4GQBcfsfN5CXhEmjxYoXk0NQ/Aq573/XGVoy7XvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 12:16:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 12:16:23 +0000
Message-ID: <0c2140c2-46ec-4641-acc3-b1c4d78c5b8d@intel.com>
Date: Wed, 21 May 2025 17:46:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] drm/dp: Add Panel Replay capability bits from
 DP2.1 specification
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
 <20250521115319.2380655-3-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250521115319.2380655-3-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a637fe7-f2a4-4555-47e8-08dd98614d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzY3L2ZtT3BKVFFIRXBtcU82cVlhaGh4ajJtdmF4RG9RVEgyeEcwdEVKTmov?=
 =?utf-8?B?NTZNSlhaZXB2NHNINWhvTXlRMXlHajB6Vkt3cDRsMEh6N1Vic1BTRGQxNEk2?=
 =?utf-8?B?WjQ4WDFxT3h1K0VUK0dnRVN1K3Zpcm9RWHEyVCsyY1hxKys2S0h4UkRQMXh1?=
 =?utf-8?B?MjFNbVNQV1ZQT3p6QVVXRFFJTHBBR2xvVkxvUjRlYlNOV1JDRHpPVlZiUUQ0?=
 =?utf-8?B?czYzWlpiV2xGQkR0OE9maWhEUG1mYS9PajBSUnE0QkpLRFVSSlBuQVkvRXkz?=
 =?utf-8?B?cjhuYm52cU9YUm5VNVUrWnB4TVpYL2tDN01jdlZPL1luY0tPZCtkTDcrT3RS?=
 =?utf-8?B?LzhaWjVUbjYwSTJRRDBlWnE1L3ZJcmdQWUk5ZDk0dVdxbnMrWnIvNS84MjNj?=
 =?utf-8?B?bnp1NHBNek1SZ2FzdktGQWxXdFIwS24wUXEzVHZIczNpckZpcEluODkvL2Fv?=
 =?utf-8?B?bEZ6L1BVbURSZ1hpWTBnL3NsUFpIaG5aUUIxelI2QlMwRHpkbUVmOGhRc0xL?=
 =?utf-8?B?azVyb29adUFuRDhnbzJiOHZ2VjExR0dITklpR0dzTld5VFdNT1dEeXlRNW11?=
 =?utf-8?B?U0ZRTitKdU5vbDI3YW1zanhhQkhKdE04S2NZVDdCQTNqZTczMm96RnlHM2Np?=
 =?utf-8?B?MnhpVE1tWTAxYTVIVU1BeldZQmp2enlhMUtoR3JxSDJybUdkZlYwbUx4OWgr?=
 =?utf-8?B?S2d5SXVKbzIxMEplRkhrRHdPdUNZclF6YlM5cWJ4T0RFK3kwU0RZMUxxRHBj?=
 =?utf-8?B?WGhUVjRaVWRZbjIzRlJPZytFWi9oT3dmYk9QQ2FjRFpnUHpUSUUxOUVHM0w5?=
 =?utf-8?B?TjBqREkvL3NiLzgxOE4xcEovVE9QQ3FodFhEZDUzK1RNeXFYRE0vSmZTb3Fk?=
 =?utf-8?B?MTg4b0hZMzVDSlpJdDBtaHNRTjF6azBSSEpKVWZKQ09UamlBZFRvdHhDbmcz?=
 =?utf-8?B?emU1cWYxTHM5V0M3VEZ0aGJPaUs5LzJubHRYcjQxTWxhTTVZekNMYW9vUkFt?=
 =?utf-8?B?NWhZTW0vN1BkdGFrNGpTV1RnM3ltVzBrZHhzMEtuazg0eDJheDNuRzRQS2tX?=
 =?utf-8?B?NEp1clU5QXV2OS9HaHpBQnpRdjFjdmEwaml2YUxDbzQ0M3Q0KzZaZnd4NDFa?=
 =?utf-8?B?R3FxUGNtR3ROTHc1YloyR0Y0SktOenVyS2c2cjU5SUlGV1AzakVnYkh5SUdF?=
 =?utf-8?B?UFAwS0d5MDFtT2xIS1RSTU0xK2hlOEFOMTdoRVB2eVFpb0pEdHdHTm5rUWZ0?=
 =?utf-8?B?Y2p2YU43YjM3VHRkaHBJeDYzYWdwL21xZ0xucUxyY3RNYytDdnRsKytPSDRq?=
 =?utf-8?B?dE52eVZXN3dKNFJxcHBRdHU3cVZDVzA3VnhYRXdJMVE1dGZsTHJhS0l2Nmgy?=
 =?utf-8?B?cytkZ3pXT1lJMC8zeU5RUTlBdnRqWkdoYUx0azVEYm9jOFlRd0MyQ0Y3ejB3?=
 =?utf-8?B?SXJoUlJUclR2UGpNWVJwdWowMCtBbVQ5cHZ1dzZHWmdCRS9CTnZqTkxic2hy?=
 =?utf-8?B?REtjS0JRZFZUSVhWTDRqN2ZCMGExS1NLTUxRTzVHRHc0QjhXeEc2Y1NBQkxV?=
 =?utf-8?B?Yzg5Vkd5ZmZWNTVHOElLQm9MNU9aZ1RUWFVWNStqbnkrdHFDWGRBcHRCM0lx?=
 =?utf-8?B?RXJiWUlQQTN0eU9ZbXNYQTRjcVY1a0pKUERieEo5WE5kU2QrNUJrQkhDRUs5?=
 =?utf-8?B?WWZmZUxBcWF0QysreFh5NE9ack1ZZGxjSkVGYmg1cXg4elJZQlRBTytYcEhE?=
 =?utf-8?B?SklPbFc4V0RyYnN6ZTBoOW5ScU4veXFLVUoyWmY1eVd4c2I5aEpMMTV4c0wx?=
 =?utf-8?B?SllTQ05tWXhJZVFMRnNXS3FNUEw4bEp4OFVEWGVXcHh1dG96dWZhMVIrL1JR?=
 =?utf-8?B?eVh1STdaaGFKTjJTVGk5RDBXNEF4VFJMRkhBNlQreXltWEFxZGdoM2VIbEZm?=
 =?utf-8?Q?FfsvJvpyhUE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXUrQys4WTZ2bk5TT2pldUxXZ2YyQWk5bWx3ZStxVWdYM25mUG1WWFRBUHd4?=
 =?utf-8?B?Z0NEQ0JpSkxuNnZXMHhCYW5WRlU5N3RpMjIwMUVCOUFyanRHUEZmK1RQM3Zr?=
 =?utf-8?B?bENFYTR4K0puQjB5cXIramR1UkQxVzBzTFJoNENEZ29rZzE4dERJdWpURVY3?=
 =?utf-8?B?eHdLL2tXdnluSXlZdHdUOFRnTUVlY3FqbG1VVEFnT2dNZWNXZlJxMWJqNE41?=
 =?utf-8?B?enpxVXMvMzhEWFlnWENUcm9wbVVhMWlmNmhlcTg0V0wyMmxxZVpnc1VZL1N4?=
 =?utf-8?B?ZGlYY29qRWxLbFdVelo4UkhLdmtwMllFQzJBdFhMMFhtK1VvOVZ5U2Y2d1dp?=
 =?utf-8?B?REdlNGRTdUNoMWFqaE0xRkpIemZnTVIvSlF4TVgzOHRtWEsraDdERVZBVUlP?=
 =?utf-8?B?T3d0eEpNazNuaWdMT0ZBY1p1T2Vjd0QycTY1ZGJvQVpVK3hrSkIrcytoTVZY?=
 =?utf-8?B?Wm9jcW5UaXBaUmw5ZzlMMURwWHFWaTU2eWFKSzRVSUFwUzluUGp6emJEK0I2?=
 =?utf-8?B?QUQ0TFRHUjFtSnVYd3lkbEFHLzAwUkV6VkJPSHFFZGx4YmVBbnI1M1B4cWV6?=
 =?utf-8?B?NEZVaEJ4ejh3UUxGNnVVbkFWa1JCdEJqUm84S2tjSlcwVzNEam1CVjV0VDN2?=
 =?utf-8?B?RC9BY1JiUW5YMWw2TzVGdlRqd3g3d1VmTWRjdnVjK3piRlRzUUM0SG1TZmtG?=
 =?utf-8?B?RFk4SUhIdTFQTFpXc2FmVEdyclUzSXNTaVdWcWRteTRnSnZTM2gyckxOWmFv?=
 =?utf-8?B?VGZ5ckN0ZTNDZWFTdGVhQVJpVGJrckE3ZklaOUlZNFRBclVhbmF1NnRXK3hx?=
 =?utf-8?B?Ym5PUXBGNGc1N2NSdnVzK003VWFncEZUTkVYbjBzMEVpY0NvckUwUUQ1Zk04?=
 =?utf-8?B?V3RGa3A2RFVpVjMrM0p4VitJY2tjWDZOekw1cjdteHMwbTNzb2o5MzVoeHQr?=
 =?utf-8?B?eGw5M2JxWjI2Q2Z3SHVaelpHWTU1SnliY3ZFTTBTUkM1ak5WbkpoSzhtaWc0?=
 =?utf-8?B?WVplRVpEZVdYSWhmd2FlQWZUQXp4UFRiNkRxZHhDR1BhTngvZXlOcjBkSHRQ?=
 =?utf-8?B?R1MwWHE1RnRRQzlpM3QrZmJKT3h6ZGZBTXdFSTJYYTZjbkxQR3VjV3hvbG9V?=
 =?utf-8?B?NWFOUXVPanliNWwydlh6YnUwZzlhSmV5Y2krMzg0UDlZMVFsem0rT0dobG9l?=
 =?utf-8?B?a3NoaUhTUE1lc1F1VGMzMTFHUnhZU2NFbjhCbWRVR0RwSjVFMmlYL29YTlVR?=
 =?utf-8?B?cGZSSmQ4WFBHd2FxcS9nQ0JPL2h5UnBtWlFUT3Rqa1lvc09rUGZQZHZodStF?=
 =?utf-8?B?MEZtajY1QlVUKytwMWsxdFBTS29ERElad0cxK2VVZ3UwU2pWeFZRMWFLQ0lK?=
 =?utf-8?B?SWFHNUFucVRHSnZpeHllUkVHeDJjZWZ4R1lnMCtBME9ZOW9yZTFrTFdXR3VT?=
 =?utf-8?B?SDJOTnU5cHc5a1IzTkx0WnlFUnRDNEpQVUNHU0pQTUhJNUl0OWNtcVltaVFN?=
 =?utf-8?B?cVNmV0FFWVFuaTc2aDRpVWFtK0RwOHpFY3h1UGRKRXY4T0NlNFVqSVFMOGV4?=
 =?utf-8?B?clBOdTV5YVkyVzRJTVI1UWpFNllNRmFDVWgrcHFTa2JlU0QyYVIwQXZtN1dz?=
 =?utf-8?B?NEdiWExIM3VHSjhHMXZpWE13Qm1SaitiSUNjU05GL2cxT2NVQ2FaQzEyYnBm?=
 =?utf-8?B?ZU1CcFM2N3hRZ2NkN3lPNjFycnVzZWJBZ25xbkJJTGpSMFFNUVVkR2tRcFFY?=
 =?utf-8?B?eThyVTgrM1IzSGJjU3VmUnNKVU8xZFZPdzNIWkl5OVNXdUplUVUxVnQzSDFh?=
 =?utf-8?B?UGVTQUVCTUQ4UUVsMFk5QU9aTXZXanlTZTdQSFl3cEkydEVZUWM3eUV3ZGE4?=
 =?utf-8?B?cm5HOFVqYmdLZ1FDWkNJNGgwL1NJbFBxWG1zUnFFZVorVlJ5eDAxRkhrMTNy?=
 =?utf-8?B?b09vVTU2b3NlbFRucndLQTZZVGlnM21UQ2NQc214Rm5IZlVneU1PM2g5bGw5?=
 =?utf-8?B?YnZEQiswTlkxQ0ZDaTUzVnc4RENnL25oWjFBYXk4VEZkVDFRaUpReTVmNWND?=
 =?utf-8?B?ZmVZS2dTWkpxZmh5MC9ta2Yya0FvTHlJZEJoVkRzWXZKR05xSTl4aTdOcERO?=
 =?utf-8?B?THF2Tkl6NXZ5T2NaS2ZzaXZTa3ZRaTRiMUtIZ0pEZjN2amJaRkxaUFVPOEIw?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a637fe7-f2a4-4555-47e8-08dd98614d79
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:16:23.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ej6q13c4Ju9mnBIO8Vg1VkaChnpCHRzCsEg/n1IsZXif7harRW5SJlB+B4VoGUglG0hYbDk5eWZ23l0MEqnrOgu2TC880Wp3t58SD5bN6bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
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


On 5/21/2025 5:23 PM, Jouni Högander wrote:
> Add PANEL REPLAY CAPABILITY register (0xb1) bits.
>
> v3:
>    - added DP_DSC_DECODE_CAPABILITY definitions
>    - use defined shift instead of hardcoded value
> v2: comment about DP2.1 changed as DP2.1a
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   include/drm/display/drm_dp.h | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 3371e2edd9e9..811e9238a77c 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -554,8 +554,18 @@
>   
>   #define DP_PANEL_REPLAY_CAP_SIZE	7
>   
> -#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
> -# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
> +#define DP_PANEL_REPLAY_CAP_CAPABILITY					0xb1
> +# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT			1 /* DP 2.1a */
> +# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT)
> +# define DP_DSC_DECODE_CAPABILITY_IN_PR_SUPPORTED				0x00
> +# define DP_DSC_DECODE_CAPABILITY_IN_PR_FULL_FRAME_ONLY				0x01
> +# define DP_DSC_DECODE_CAPABILITY_IN_PR_NOT_SUPPORTED				0x02
> +# define DP_DSC_DECODE_CAPABILITY_IN_PR_RESERVED				0x03
> +# define DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR			(1 << 3)
> +# define DP_PANEL_REPLAY_DSC_CRC_OF_MULTIPLE_SUS_SUPPORTED			(1 << 4)
> +# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED				(1 << 5)
> +# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_CAPABILITY_SUPPORTED		(1 << 6)
> +# define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
>   
>   #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
>   #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
