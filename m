Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44DA742D4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 04:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F8D10E978;
	Fri, 28 Mar 2025 03:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bl3F4cSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D8310E976;
 Fri, 28 Mar 2025 03:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743132993; x=1774668993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=miY02EiGAB+mPuMAb8iokavS68P0XT2MQWz3MCbtW4A=;
 b=Bl3F4cSRw7bcWeRWSkQ0FeDXqzkmpJz9e6jtpwMBUud/+oRNDWX83SUf
 8MvLwYRmAC8FC9kxQIBT3SSNXq/UmbmG2cMBwH84f+WiHKyNDslcsRDdz
 M6husL8GxbP8I3cgjwhRxo865o2CQ5E6x3DngwTPaR0rwq8pv0Bg4Q/Ji
 SzUBMj/dHS7FhgLF9apG4yTBi/bqIW60Y5/qfbCEYz4rb34aRasy27Ci+
 +RmN8+Wi2yY7q+HkWwOFwI7TmXe6HDkO0R0x2TqhvlaPIfYFgx1dxIbxl
 XeElppzMqANSOoSAY4YAteZiSuu/NPbJlAynsaky0cP3dYszjOvrMrkmd g==;
X-CSE-ConnectionGUID: 6WV61L9pRE6/YuMcCgQKAg==
X-CSE-MsgGUID: YxLdFA5CRkWL2BPJRtjbTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43643292"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="43643292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:36:31 -0700
X-CSE-ConnectionGUID: 4vyIzvTWRkqmY0U02yWSdg==
X-CSE-MsgGUID: RO90e908Syy2mnqK5RJecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125241089"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:36:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Mar 2025 20:36:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 20:36:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 20:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUipxLdvWp3Q7+WkeQZPu+GRpdgXRgQASajMPcq1pc7uWYXSQXM+g1O7PfpHYi91qaXAUglifSf0FOEZiyLn6q0MkBSzcI+SYKfb5WRsiDZEVNcieQsjr7I+1m7/5YSCweDX0saPmNKcMicqPWjG6XRdQkLEbUycCXFRKFmdkp4O0ksZv/SFELbe/JYAhzSZgK3xq5dbnSRiYtgHWFMX+rO6nTyuUlH3DHVT/lEYzj0whEe4zPtYyeZT8phRghjl9G0f2mTzlVzL7qQiMN/U+9ysyoRGk5lcpIybgw0ZDrBDjMwzVopeyGG6ypsvXKZCp3iSnlySNmButHzeBVK+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/pGxtrwzrpgVcd/bNWJDKf4jrmIEk9nFRiQVib1nGc=;
 b=lg2d9PwL9LMSgN9mMsKR+ZOAiqcUG4B4HszXofROTUdjEu72zMcLpj/XYD/8/555QlIbU1uJbpQEFlaIspxAn3ka1r+RoY2S1n0D4Zbv7afMb6YBvKI7S1KnFiB8POn9WYCHLaH771oybsYVNfS/aecrRiEY64psmnVhNUQ6xhsTf1b2y22A6mHIYhQHuqUtr3XBZXI/8MzRU5GiOuotyhP2zChobPtgutZkU9CptqvNlUh6F3+mE5+1D85AQEVhwXl0gKyZgJp5DZcfRoH9OjkwbJ3ebDOxLPxwRqBHj179sWQ2204SrJ0wde12KSDCsn7WXvtGY5ysiicVqQ66fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 03:36:11 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 03:36:10 +0000
Message-ID: <dd6989ad-5bfe-436b-8218-6e1872fee134@intel.com>
Date: Thu, 27 Mar 2025 20:36:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <john.c.harrison@intel.com>
References: <20250326165751.72881-1-jonathan.cavitt@intel.com>
 <20250326165751.72881-7-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <20250326165751.72881-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0094.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::35) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: f667b152-04fd-4ea1-18da-08dd6da9aeaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTlvZndIeG5wZTNjTHVOc3RacUlBTkw5azVZK1FOSC9XZkRjb0p1S2xQc3hR?=
 =?utf-8?B?M3VMZXoycmtLbC9SMUFzS0R2K01oSE1aNkYvdnhRZWtkemNRcmdiY21Zb0FM?=
 =?utf-8?B?aU13QTQ3bjR3THRoS3dXUjR6RE9XMENmY3lrNGl6TFdIeVJrbHdNdDdyZWZs?=
 =?utf-8?B?ZnVtNFFkWVNiWTMxalpaU2tHb1lONkk5NG1UQTk0Wmx6aTJsUWg1cHVzV25X?=
 =?utf-8?B?REFvVE9MU3Q0RTV0b1crUlBvTTgydEVKanFBMDdyOXZuZW5TY1BFTkpudU9Q?=
 =?utf-8?B?MERCMG5kbFFoOHRmOFhTdytmVk4rcG5sYVRGNnJuMzJGQ2VlUStZdVR5WUhX?=
 =?utf-8?B?NExyRmhXZzlBOUJuVW40R012d2R0eUtab0dNRHV4QlRTNjJjenFXYmlWRTkz?=
 =?utf-8?B?WnhIQ2RLUnhma0JTOG9VQmF2M3VYdlljN3dmMHhkOGE3emVkK1JUV1RhSXJN?=
 =?utf-8?B?aTl0SlRCOC8zejlsM2FhYTVxZVBYNktFRE1pWFBSNDlxa3BXLzk2eUhSVDFY?=
 =?utf-8?B?V29ISDVzU0ljUlBXSTNqZHAxSU9zVzVtVnRReEpFdlE0MEFvUThNVW9NQmhv?=
 =?utf-8?B?SjdQUjhzbjByYnRESGRrOXFXUjRlNCs0NlFhcmUxb1RDZGM3RERsYWpMV05X?=
 =?utf-8?B?N0RPVjBuRHR1c2FpZmpWSSs4Q3dSS0ZKNXBxZXExbkI5SDc3NVRxRTV4MzBN?=
 =?utf-8?B?WUtWVnZ6OFBPTExQU2xPcHlMNXRpbkZpNlRyYUgrTUsvZEw3NTBzTWdybjd5?=
 =?utf-8?B?bmtrbThXbmhlTVQ4VlVHcDBBOURUbHpra2ducWhPbkYraEx2RUI4V1ZQYUNO?=
 =?utf-8?B?dzFZd2o1Nm02RCt2aVp1eGpOdEhGaU1DS1dxdU93YWNjeGdrb0tUenlZTE9v?=
 =?utf-8?B?ZDRRSUx2Y3d6WW9tWk5pT2FQalFlb2NzMk0vK0Y5VDZ3SS90SUExT3BLcVdN?=
 =?utf-8?B?N0tDTDVvM3J4QWtlWlBUMVhRc05Eb1JTQ2N3bDZla1lJMytoczE3d2ZXU1kr?=
 =?utf-8?B?K0N5TEJKTlpURzlac1JQdlB4YzlQZmp6OWhCcmpOaWRqb3p0aUFsL1ZmbmJ3?=
 =?utf-8?B?WE5qQkZCWmoxei93NUN2YThOZ2lQQnRnQU9vUVFXK2J0eCtWZE44K21WY25h?=
 =?utf-8?B?NTNQVitqRVpyV1p5MStqNHI3NlRHdG5PN0VTUGRFMjNZeVlyVGNtNWJ6Q3Vy?=
 =?utf-8?B?TDBEbFFJbGgvZHZ6cFpOOHVTQ0NSRTFtWWY3RWg5L0dNbTg1T204OHhwVVRJ?=
 =?utf-8?B?UmJMYW5UaVArK1VSRGRTVTZ0bkZSYXZVdzlwS2h2aHdMY0JTbjZ3U2hrZit1?=
 =?utf-8?B?eGVzcjFsMEdMK21SaWptM3UwMW1wbTRIK0ZHVUZUQ1RqNDVqMVZrUCtPdk1P?=
 =?utf-8?B?VnExdE1NcCtkd0dGUXdnVGVEbis3SnZPSGt6TVh2Q2xkdnNNWWQ1UlJsZDE4?=
 =?utf-8?B?dk45UEdsazNvNm52ek14Y3lNWnpNcTFxdlNGeEpCd3RiZkJDd2d1TWJLYklF?=
 =?utf-8?B?Rmlxb1V6YXdKN3paUDJQQlBaOFpaRkoxMVk5NUV6OFVqT2dWemNBR1N1VkZL?=
 =?utf-8?B?SVIvNWhtRm1nRWhJKzB4T3o0MGs4TUJvVkIyU1VrdHpGT2RQK0IvQU9NQ21u?=
 =?utf-8?B?ZTZDWnhHWjd1c0xsd2R2NjJJM1V2TUdZOFVSb3p3eGxUZEM2TklGVDk4cUJ1?=
 =?utf-8?B?TTNiU1F5OXp4YkJQN0RBcEcvM2ZjSW96SEV2L09YV2ZKOFlxUkZYZDVaK1p6?=
 =?utf-8?B?RXB2Nm01Uk1HNXBPT1loRVNselF6bVVZNTZXeWxGS1U1NThvbGdra2szdDdX?=
 =?utf-8?B?QXRqUWptVGhqOG9KUGo0dURmS2JWU0FCVkEwc3VBTGN4RVZFZWw1aDVML1Bz?=
 =?utf-8?Q?tvFltr0k0swFo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm5oYTRqcDllbHRSNW1DbzRDUFYwdng5KzRQR0ZCOEc0Q3NpUWVScFB2cGt1?=
 =?utf-8?B?cENDQUVJU2R5eENnUDBrZkRON2xSdmxaT3lrSzVHRS94R1RDbmNYVlVXUGti?=
 =?utf-8?B?V3ZqS0RFNEFoUEFlcjQzZDZ3cTVCQ0dqRWdhUlBIOG1wcXpaSEFiNEI4T2R5?=
 =?utf-8?B?ckJITWZnRStvby91ZGhtRzMraitwOE03b09qTE15U2JVWWliVzdoWDRicjJK?=
 =?utf-8?B?dnFCVEFUM2JsREIrcjY1aDg4WkpQdnp6UDNzdkFjMklraC9QUGZNZFdJbG43?=
 =?utf-8?B?cFhCWUFwRFZrTytxRkFNeUQzbzV0QXJ1Yzc0ZG91NkRJY1lESUEzSFFnTzV0?=
 =?utf-8?B?RXlMZzhDUVZudUQ3SENod3hwNVpDUVJuUnpHaGRyRkwxOG80bU1JV1JCbEg4?=
 =?utf-8?B?OTRBWTNGM0gzcTMrV04rSUFWdjlqTjFFOFVTRWxraFNHS1Y3WlVySHA4dHZk?=
 =?utf-8?B?M2tQc0h2YUFuUUE0NTcvZEViNEorTEFXdlJXMmc4OCtCUktnNFdkZEJPYzha?=
 =?utf-8?B?MVR5aU9yUjBBWlNKd3FCditPMW5OWlJYN21KaU5DZUNTNmd2NUF1Z0RoN3FO?=
 =?utf-8?B?RUZ4c21qVTljV2I2NXNsSVFRUDI4TGF0RHRlMEF2NG0veEpIU2pLRFNnSGY5?=
 =?utf-8?B?eHdBSHRSWlMvZmovYURpK2hQMjBzcHhqYXRNQTZPdEJVUFdmUC9YcGpqWDhP?=
 =?utf-8?B?QWdUZlBseS8zM3h5QXo0SjQ2TkY3c3VNWVozQ1E4QjI0TkVOWU1tVjg5UVh0?=
 =?utf-8?B?M2RRSzZGSWpRVXlnWGFocnBaUWJFMysrN1FDK0V3VG9HRXRVYXc0R0QxU3lx?=
 =?utf-8?B?azJEUjNtMWZXbDFCMS9hRzRJeWFPL21LTk5aSWVZTHpyNG9yZ1FPWkdWREs1?=
 =?utf-8?B?QVpTSEpaVVF0amhDVXpOMGpRN0RGWWd4aU1hVE0yNUlrb2NSdGpDVzVHalBv?=
 =?utf-8?B?cW9sVXNGK2NkMVBibWgvZ2g3NnFyQUhqMjczckY3Tm1YanlkNVdPYjl5QkRj?=
 =?utf-8?B?djNYdVZFYitPQjVPZFltVGFsOVJDa0pDWWZwbzcvdzhzQVcyNGtSQkFuQXI4?=
 =?utf-8?B?VGRIS2dwUXBSTEFmaHgvNkw5NHZZYTVHTlg1bStybjRPd2xNN2hCOGZ2MkRI?=
 =?utf-8?B?SDBpY2FxNzdENTJ2NVhqR3duQWl4L2NFTVlOaU82Q1E2eUV5N25MaDdBQy9m?=
 =?utf-8?B?VlliUjlGK2lMQU8yYVJOVXpnK1pKdmw2UVdSMjM1ZTF1TDlxa1V1aEo2WnBz?=
 =?utf-8?B?MDFWckpxd0x0cHFEdzZZVWQrNVlJYk1HeU9NSUl5T1lyZTlIcVJRTkxLR21j?=
 =?utf-8?B?VU5yWHU1Sk85Nnp1SkxvUlJWYm4rMUZQV2p1VWRFUy9YR08yRkRHOGRlN0tp?=
 =?utf-8?B?bElueG9aQmcvTEZxQmRTWWxTL1JSWjliRHhvOEs2SmE1T2xzVkUyT2xpdlNu?=
 =?utf-8?B?UXk0S3VOcHZzN2NVWXFtaFVFdGFQTzNQTk9wbXhEckMxZjhaMHJDMWplemg2?=
 =?utf-8?B?dERWMWZZaTV6Um9aRU4xSlFBdm4yVTNmcmFuZloyNE1JYlpYRTBUc2Z2clVw?=
 =?utf-8?B?a0dTOTNxQ2hIOVd6UzRXOUNkU3psZ29DVVA3KzdyNjhuUmthM0hsR2ZmaHB5?=
 =?utf-8?B?dEZVMGRkOHQrT3V6REdSVVZNTXAvTTNDaEx5aDVwU2o4TkE4WTNvcnpDTUtF?=
 =?utf-8?B?WDU3TEdwWlVMK2c0MkJiakY2T0RvNEZMNzI3TGQvR0o5V1ArM3RkaHhya3d4?=
 =?utf-8?B?L3paVm1kck5aS1M1Wng2Z0dwSmNMODl1Nk5XSkZPbVhZZDZFN1hUQnVtSUpZ?=
 =?utf-8?B?TXJsK05weWxDdi85dUVaS1QvaThzd3B2M3ZKMm5oNk1oUnlMTGR6WGZVZWFi?=
 =?utf-8?B?N2wrZnpPMjlMUjJpbHBCUEI4cFFHRnR2L1FyZlVyQ3M1OFdESnlMaWpMUHdM?=
 =?utf-8?B?c09OSFQzZ2Ftbm9CMWhra0srK1BDWWxoT09WNFg0S1ZYOG0xQ0NLVEhKTkV6?=
 =?utf-8?B?d2xtQ3ZLdkJiQU5QQU84dXhJTkpWc0RmL0hzWGhVUm1uNFR5MGpCM3pybC9Y?=
 =?utf-8?B?WEhjRUJ6WHpzSUxXK0wwSHVFdmZWNnB5bG5CTURZeVp2R0FHdkFmeEtkZEJr?=
 =?utf-8?B?MWlBaitVZUd1UkRsQXlqQ21yWVR5NExkdndtR2VlUGNkMXhjYjRMc1hRMnkx?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f667b152-04fd-4ea1-18da-08dd6da9aeaf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:36:10.7311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmh2YGRwZyNBVogvFbExXsBUAxvz0u1NEbT2T4Wx2CVWZeuFQR5KoAKMRO0aBEn2IAohaiMry1ytlfWrmHMgUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

Jonathan,

I triggered several page faults by hacking UMD and can see multiple 
faults from 4 engines are generated and reported from KMD with this 
series (patchwork rev15). Although the hack cannot cover every case, I 
belive the new ioctl interface is working now. I will let you know any 
finding later.

I could skip tests on some coming revs from now on. But anytime you feel 
a verification from UMD is needed, just give me a heads-up.

Thanks!

On 3/26/25 09:57, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>    is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>    purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>    (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>    single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> v12:
> - Use size_t instead of int (Raag)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>   drivers/gpu/drm/xe/xe_vm.c     | 88 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h     |  2 +
>   3 files changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1ffb7d1f6be6..02f84a855502 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -195,6 +195,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>   };
>   
>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1ddf1f03e3f..625eb559edd9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3557,6 +3557,94 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, entry_size);
> +
> +		store.address = entry->address;
> +		store.address_precision = entry->address_precision;
> +		store.access_type = entry->access_type;
> +		store.fault_type = entry->fault_type;
> +		store.fault_level = entry->fault_level;
> +		store.engine_class = xe_to_user_engine_class[entry->engine_class];
> +		store.engine_instance = entry->engine_instance;
> +
> +		ret = copy_to_user(usr_ptr, &store, entry_size);
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	size_t size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */
> +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> +
> +		args->size = size;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +	if (XE_IOCTL_DBG(xe, args->size < 0))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>   /**
>    * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>    * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file);
>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>   		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>   
>   void xe_vm_close_and_put(struct xe_vm *vm);
>   

