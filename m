Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F173ABD15E6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 06:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B4D10E05C;
	Mon, 13 Oct 2025 04:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsPG9BCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F8F10E00A;
 Mon, 13 Oct 2025 04:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760329158; x=1791865158;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0XHXHRMyck793J2EVcw6J4EPfy6mwW1N79u7FipeNko=;
 b=CsPG9BCFmxS3bjcSJYqp4sKRCATFOF9z1+iMOO/xyuX+0Z8wxQWGEVli
 dXIRFxi1k2Zp9recHQrRfCYZMgKtE0e7qI6W7nVId3iRttyX5Azh/Js9U
 ACgdAgwZ/kWQ6saWM0PDS16sZ03O1uYkO9SBDamooTgGd/27KRtQF4rgR
 ou3yOgWhuecMg+sJOb8LG4g4O5eUUVGgOFfSv4VGrhJcwtvN7Ac6aaouo
 vdKNZJdIrREJ9FseL1/eLtngf4LZdZcBGYMSYYMHnSfOu5CS/0CXnwFPK
 evXutGA8V5AF5VESaUTgECryABZb2DFVwVR/2lgV1BmLk501fAwDvvgJk g==;
X-CSE-ConnectionGUID: sDx11dRCSqGpNSIcFej4wA==
X-CSE-MsgGUID: rH1h6BcyRReELwrE44HUBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62499320"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62499320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 21:19:17 -0700
X-CSE-ConnectionGUID: euEX8fM/Rt2r0H0sfLLw/g==
X-CSE-MsgGUID: 4i9uL1XeTc2a2HupbWZk7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181509368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 21:19:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 21:19:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 21:19:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 21:19:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXcweFHkxX4AHTJhh+aX8ZjnZymeyl8L0vpj9R+M2wGf5E3XelhL1iC9F82tEtS8P9vpsYtP+njUGAuqn9SHrOf/8FMS1jUmEQ77zW1yPbmkM0Tk7zyzZkogc4hoghwEPzSTo3quy6HxRh5kfx90/SdvfxMFMsUuhTQJYsPBEyCIpmv+cRd5qpRItgkPdwpPnGgQrTQnVMKaUdRyARBUySTAzA0TAdhY1n3glj4bH1iBvCboq6YEPFDIQMAIhXQ3jtzqjWZZLqgVHZk+HEUCTgTKeHbl67agfpmKnpGto2yYR7XUjS1gyTCXN2YUm5WvUk+jGdgWJmgzeL4ADsLE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/criBFk7vu/WveKqeWZ5DIUEdul74LBjSbphpbjm2fY=;
 b=mchKGaxvoGTLZMnDLleNqCyVbnxC1JjXtD2lmZ3rptokB18bpEWqRaOLPO+cCMvtyDJWUlwjxsPsHgdA7sX6uqFYltfXIxf6xFw1nu6tGiYSXaVeiQgtPPS9Wxbj03dQQtULmj8ZoZfncTBenCE9Ta5uGSnIlinI2KL0mXYYk0WMA7al1KOSHtGJWMatcAjZ7DBhlnMFyW/VUWo/xVaJkJvYTwNXZTfGIrY9IkN8vrlxF4P5IoLnJ1z0D3lwKomV1Hm18wZ7FS4gElJm14F8MUwZ92MLlk2VMmhelR5T6Zw0V1COTRbX0DxqirVq+cD/nCVWr80xPOTH5v5BQRLo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 04:19:14 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 04:19:13 +0000
Message-ID: <16c6c70f-0b89-4a41-8e3c-835a9ce296d5@intel.com>
Date: Mon, 13 Oct 2025 09:49:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/2] Async Flip in Atomic ioctl corrections
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <jani.nikula@intel.com>, <ville.syrjala@intel.com>, <uma.shankar@intel.com>,
 <xaver.hugl@kde.org>, <andrealmeid@igalia.com>, <naveen1.kumar@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
References: <20251010-async-v2-0-50c6b7a9b654@intel.com>
 <aOkK6wzKaLQbOvuV@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <aOkK6wzKaLQbOvuV@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0193.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::7) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d7352a-9dc7-4497-effb-08de0a0faa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3Z0c0lFRXArMEdoaWxpVXRPdEM1ZGQxVGlzODdJdlZGaVFsUVhXY1dRU1R6?=
 =?utf-8?B?alpBUUV2V2xESGx6RkhMbVV3RUV5UWpaYzV4Vk1ydDVXMWtkd2hJU1hhdTIr?=
 =?utf-8?B?ZE9yUmRXeFpCQmo1bVB3SVI3N0Viand2MWFvbTBYVGdnS3B1MGR4VjE4b2Iw?=
 =?utf-8?B?OFY0Q3pKSEh2UmsrUU1UajJ5dEVob0pxbHUrRjBEa0REVnJtT1UvY1Eza0tI?=
 =?utf-8?B?OEsvUmxqUjVCbGEyRm4reG9IZTFTRWFETzBIK2NiM3VDdVNTN3lzUjdDZDFV?=
 =?utf-8?B?WkF5SDNMVUV4RDlrV0pOWXpwQlZEaWFWZGp6LzdxWHE3RSthZEkwU0dicVNU?=
 =?utf-8?B?Y2VwRElKNTZORUZ4ZUNzUTMrcXVKZHprWUphNy9ncmRsY0VZaWZXeHRiTjRj?=
 =?utf-8?B?WkJvWnpvUnFwVWZtSDFsVkVtRDlPV3pvYVJROFloRGo0Z2dCQW9Dd3NUVzJr?=
 =?utf-8?B?T24rak1iM1VMVFM0ai8vZHA3VnFaNmt3R21DdGY3WlI3Qkp3V3kyMHNZMGdE?=
 =?utf-8?B?TndzRE5SY2EzTDVTcjdHVWtEcnlHVEdXSHBNb2UxL1hqTGh6Z204UXp3MldY?=
 =?utf-8?B?S085dElnRU5XY0ZoL3dLMFFtQ04yc0V3MWRoSms5NVFibzZlK0lFVHdVWnkz?=
 =?utf-8?B?dGpFMi9waFYxMGhZclNINnVGUU5hdmJKU3ZGZVh3SjA5dnJCUlZKeWNWV2lT?=
 =?utf-8?B?Qk9uam93dlRwM3J2OXduL3RKWklXQVh2cWFzMnlOWlU2TTJOUk42S3MwUTlS?=
 =?utf-8?B?OWpDL09pdnV0d3ljK1B2b09kTFlkdzFxRGVLTCtrYnRGNUhxRkJFa0hvcjJq?=
 =?utf-8?B?aGFsdUFaRVFoQlVXSkszZE5VS1RncWZSaGdkcnBUWmFJbWpnYXdQWjVSTjdr?=
 =?utf-8?B?MFUrTWlXN1dzeTU3Z0hwdFBzWFJMcSt3TmlyaktUcTQ0d0ZJcXBKQjdUc1lY?=
 =?utf-8?B?elc4NFpqNWswSGN1dUhTdkxGZCtVdmRXSkpOc3NGMFZCSDV0OFE1Z05rMm5a?=
 =?utf-8?B?RkYxQlRRd1BRM0ZmNFVQcitqWFpGUytlZDZGU2YydUdkcE8vWXBuaUJGKzVv?=
 =?utf-8?B?aHZNMjR1bXJMR0tCdEFPL2lVNktFRyt3b1lSTzgwekQyNlplRjQ3MVBGOVI4?=
 =?utf-8?B?WUpKME4yL3NVU2JYS1ZPbEwwRWtYYWpvd3pyRzdVUFFodHA0V1VyNXhHT2dF?=
 =?utf-8?B?L0VUamUxbGhmTlExd1ZtUFdYcTlndGJVTWJHaDU2TXM3MHhDNFlpREdwemZK?=
 =?utf-8?B?NjBqRmhaNlUvZi9oYmhQRUNZTlVKbStQU1h4RlY5U05tRzQyd3ZtZ2dkanlE?=
 =?utf-8?B?Rk1wYUtGYU5sbXBmUWJrSlpidk8rQStWOU9sSmZTZHh4WEVXWWRGSkpPUk9j?=
 =?utf-8?B?Um5HSmZSdXE2NWRWYWg4Wkd2Sm91UDQ2UnhNMFF3VkNLVjBVaWljVHpwYi9s?=
 =?utf-8?B?SFVHeW8zSVJRWklNVUcvWU1PcFoxaG1sajdqbi9wVkJTdmtPSTFJYXB1WEV5?=
 =?utf-8?B?V2paaW95bTJxbVE4Z1pkMlVMK2NCUE1zRTVIUnRpY1UwbDJ6UlFTREVqTENz?=
 =?utf-8?B?QTduTmxDR0x2ZFRMRFkrRmxlZkVucFI4VlMvSGUvTjA2aXlsaXM4MW03UGNV?=
 =?utf-8?B?V0pFNFpUUTBpN0VFcXVFOU11UVQycnZ2OVRWZFA4c3lVN1Y0MEhPV21PL05S?=
 =?utf-8?B?MkdwcURxWjRCaTBqdTF1TmlzdGxGR0c5N2NJYXJuZ3FDMm0wVERvZWw4T1Zn?=
 =?utf-8?B?c25zZWhUQmtyRUYzOEVxV1RnS3ZMV29JUStRbmJOMGdyblhhUmc5RHRiSG4x?=
 =?utf-8?B?WWhyaGVad1lEcXpQaURia1RLTTFDWkkrdGRJWUZMZGQzTldaUG5HNHZsN1Vu?=
 =?utf-8?B?SDZXMW8ydFU1UjlsZWZKVGM4SG5NZEhzUzRwRGFqUFNGWXJRa0tFR2RQcTcr?=
 =?utf-8?Q?xyYWOF335a5NJWAq3p9yUdll8Z/DXDwh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVGNm9UQ1N5STFmVzZKakFwYXZDNW1ZRENEK21WZy96dDc5QklGV1RsOTZQ?=
 =?utf-8?B?VFh4ajZFblpya1dlSzltS3U1cTUvcGkyTWhHN2wxRmVibUQ5UmhmN3JVMkFn?=
 =?utf-8?B?YWRpQ3lQMjBUWnRyS2VxWE52bTBhcWVLNzZTZXZkVnExdmtISEZuQXlsYzV6?=
 =?utf-8?B?T0NIeTI4TSszTkZoZ3gwTVhpVm5ybFlBSUFVRHhKRG80ZjlQNTlRcEgzcEV4?=
 =?utf-8?B?L3c2WHVqcktaOVN4bHViaFhPeEVEazZraTgydDNHUGlJNmxuZE5pQUNFei9U?=
 =?utf-8?B?NllKTVQxZkI3VjY0STZwL281NURYWWFEM1JkenhzZEUyWXgzL3RrT1QvdE03?=
 =?utf-8?B?d3ovSXNhM2o3amQ1b3ZBVDJoeWJlcTUxWTBSVjBCcmRvNnlTeHFjN2ZSY1Nl?=
 =?utf-8?B?Ky9SRFMvZldKU3RkeFlqOUdTU29lQ05ubUZ5UFMwbmNLNmkwS3pSVXh0TW00?=
 =?utf-8?B?d29EeWRFakVSMkdDcEtuNVZGb2EvdGF2Snd3S2FXSHRadzZBT3pveTFkUWQ4?=
 =?utf-8?B?VklYeUk5Qy8vdDZNOEltMTczeXZpK29MUFpsR0tMK2NJeVZBUHprQ2JTYjF5?=
 =?utf-8?B?Z0k1UGRBdVR1ckRWeXpkYXNGUlB6M0VBN0xLUHFROEgxc2RnamNaS01jdmMy?=
 =?utf-8?B?ZUpSMHdZcGdPaU93WTRMTkpsQkdSUFNqVDl2QjlHeVZCTGlXdDBhY1IvUUF4?=
 =?utf-8?B?UGpzRENkazBnVVBvWFpTS3lLbVg2Q2o2b3FqZHZiYjdWL3NZT3lNMURVUjdi?=
 =?utf-8?B?cW1MN2NCd0t1M2xPcnNFbjdHNWZrSzNXN2UxR1VwMlNIWW8yVXl1bU10M1N4?=
 =?utf-8?B?QkVNY05jTlZhdmlzeGJscUlVem9pTFVIaGRINGNQR2RlU3JhWDFIeGtHYXBQ?=
 =?utf-8?B?TTdEUi9KV3VpQnZVeGhSY0xEQ0ZqeVEzQUZ2OVFQUGp1N0svNSs5U3ZpY3F6?=
 =?utf-8?B?ZnJlNUNtelBKdzZsUWNHTDNCRTJVV3FBN2wzUWtNU2ZPM0k0K3MwY2pEbHJZ?=
 =?utf-8?B?WVp6c1l5d0ZQKyt0aEthWGRqVW1mY3U1SHNGTklKVzgwTERSWThrcmE1N1pU?=
 =?utf-8?B?NTl3dFJGbVVTa2hrdkt5N2RVamFUQWlkZkN6WHFTRjhINVhlcjhmWjlEN0dU?=
 =?utf-8?B?U0VFZXhiazNlejFiYUVRTWFiUE9WSWZTUEpKZHdmY3Q5K1FXenJPUDNQUTZn?=
 =?utf-8?B?UDdaVHN2TmIxMEdacmhsTkNWYU1maG00REJsT2FscDRBSVNYQVV4RVc5ZjR0?=
 =?utf-8?B?dE5LM3JSVlVFZUlWalpyMG5BWTRONTQ3aFQvNStIZ05uQkl1b1BsY0dJWUhP?=
 =?utf-8?B?OHlzNDdoeXBwNGczUzJyYnJDUFN3NEE0b3JPaGtWN3BYZStFb1JhL0tWU2FZ?=
 =?utf-8?B?OGozOHpyaXdtOVN6RUFLY25LZHJUTUo4eWRCdEpuWWlLMEdWNEdhOEFyK0JP?=
 =?utf-8?B?UVdaOWRld0oxVjZNM2lRQk5XaCtpNHQ4ZUpvTzBRU0YrY3FWUmJ4b0p2V3NX?=
 =?utf-8?B?SW0ya3Vwenk3U3FFQ1phRHNaRExXS01uTDRWWmxTZkJ1S0tlejRXalkreXZ6?=
 =?utf-8?B?dWx3RVRvbWVIMEEzMzNxN3lxbDNRMEs4Tk5ZYkRRM1k5MTNHdzh4cjRVUCtq?=
 =?utf-8?B?VzFvLzlWQmVjS240aVErSnNGbGNNZEZaY3I2dHdrWHBNa0RNY3hQMlV5WTNB?=
 =?utf-8?B?cHhnWTlCTG5CaWx2UGM3UUVXWEVkMkQrYUJMMDZCOG0wdm9XazhOUnZMSUNv?=
 =?utf-8?B?RjhXYUFJSE5QcE9rRE82Yk03Y2tlKzdLMVZSazJmZWd5MEMwVVJEenNIcnpF?=
 =?utf-8?B?WTIwTVY2UWUyNXp4ZHVrQnkxMXhRSXcvZ3lUa2ViMWRBcVBPaEY3aCt2S1FW?=
 =?utf-8?B?Ti9SZUZid3FrblVST2oyYkFTZ1U4VEFxRnZNTzlOYllkTGhocno2bXRVdGZF?=
 =?utf-8?B?YjBITmFHb2VqaVBCcjUwZGpnc0o3MHJ3Ny9LanhTMUliaXZQSWUrVnNEUzcw?=
 =?utf-8?B?OXpFTi9ZSnVDakJEWTRzMmFvZ1VsTlVwUnJoU09tVzF0TWdCWklGTENmZUpp?=
 =?utf-8?B?bG5Vam9XRVJaTTRXQU1yUE9QdmxMVWNrTjdpMmQ4RHdmclRkUFFVL3NvTC9q?=
 =?utf-8?B?eWh0UWZ6SG84U0FCblVsblFZNXRmNW9BbXdSRFlxQTZJWHBod1V5eGk2UXhH?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d7352a-9dc7-4497-effb-08de0a0faa79
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 04:19:13.8792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNSRk58h3Q5u1dgw4tkHtGrDe5wVekGCZNMoqENcVcaXEdi6VLh22AiZNHl86+Bz6gqc1Lq9KAGzQDravLhRkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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

On 10-10-2025 19:02, Ville Syrjälä wrote:
> On Fri, Oct 10, 2025 at 02:15:57PM +0530, Arun R Murthy wrote:
>> struct drm_crtc_state {
>>           /**
>>            * @async_flip:
>>            *
>>            * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
>>            * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
>> itself yet.
>>            */
>>           bool async_flip;
>>
>> In the existing code the flag async_flip was intended for the legacy
>> PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
>> As per the hardware feature is concerned, async flip is a plane feature
>> and is to be treated per plane basis and not per pipe basis.
> You can't treat is as a purely per plane thing. The real problem that
> neesd solving is that commit completion happens on a per-crtc basis,
> and userspace is dumb enough to try to shove both sync and async stuff
> into the same commit. That simply cannot work (unless we downgrade
> all such async commits into sync commits).
Yes, the commit completion should happen per-crtc basis. Also as said 
below in
order to handle multiple async flips, this async_flip flag which is in 
crtc_state
should be moved to plane_state. Then we will have to work on the driver
policy for async and sync flips.
> The sort of compromise that people seem to have agreed on is that we
> can allow objects and properties in the async commit that would normally
> require a sync commit, but only if their value isn't changing. And
> then someone is supposed to filter those out so they don't end up
> requiring a real sync commit on the hardware.
Do you mean to allow only fb change for sync flips along with async flip?
Noted, will take care of this while implementing.
> I think the only sane way forward is to make the drm core do said
> filtering, so that in the end the driver will only see the things
> in the commit that are actually supposed to take part in the async
> commit. I think in practice it would just involve removing all the
> planes with zero property changes from the atomic state before
> handing it over to the driver. But so far no one has volunteered
> to write that code.
This will be done in this series. The first set of patches has been 
floated to
get the feedback on these kind of policies. Will take care of this!
>
> There is of course still the remaining problem of what happens when
> there are multiple async flips for different planes in the same commit.
> The hardware will complete those at different times, so the driver will
> still need to make sure it doesn't signal full commit completion until
> all the async flips have finished. Maybe we could eventually add
> something to the common commit machinery to help with this, but I
> guess we should first implement it in a few drivers.
Yes policy will be added for the same to handle multiple async flips 
within a
single commit.
Sure we can take up the implementation with i915 first.
Thanks for the feedback. With all these comments, I can list down the below
tasks
1. Use async_flip flag in plane_state along with a plane property for async
flip enabling. (Done in this RFC)
2. Policy to filter out any changes other than fb. Add-on to this allow even
sync flips if there is no change in the property except fb.
3. For multiple async commits ensure notification/releasing fb after
completion of all the async flips in that crtc.

With these task listed out, was think if we break the patch series into 3
as listed in the above task will be easier to handle rather then coming
up with a huge list of patches in a single series.

Thanks and Regards,
Arun R Murthy
-------------------
