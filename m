Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A809A3934E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 07:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A02F10E61B;
	Tue, 18 Feb 2025 06:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebMA96VV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D4810E0D2;
 Tue, 18 Feb 2025 06:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739858516; x=1771394516;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mTfB9NdmQcyt83Azs7z/RV2fptlqj2HVX2b/L9Spx3E=;
 b=ebMA96VVvkRDGmHwSLVWTb3mMyuuXqZNuNngCtU1tND4AU+7fleqlEXe
 Gf4mu6OB7Fz+9g6x6Vl5WR9752JIH21zXS5tTxdYmcceU/9os3riWbLnq
 q6Nn17yDzE41Wyp5xbJRqveZniHKa3m1OiLVVG36jVPKxButIjtW07nTi
 X53zw1K7zYVBhvrPAI+IDSl0hxVAJQ8fbIcRa9veXrHvWa3p1yIjC7bgf
 41SyIFk79P6egq1/3lraVRMnUpss7W6Vf01PTV1uIyQACLJ+KAZWyKRb3
 xtiQxxcp0ogGjjq/czmI9iltkHzGcEfV8B0tX1pqPqzd3J2jXZbmVrr2j w==;
X-CSE-ConnectionGUID: nTSW+9pRSiO4JBnXLGgltg==
X-CSE-MsgGUID: kYRjPK5QQE2O8/JuWem24A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="63016401"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="63016401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 22:01:55 -0800
X-CSE-ConnectionGUID: SbirQrpDQyu1sxpYUQ51pQ==
X-CSE-MsgGUID: oVps6LAPQuWXYTlfkkK6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115196524"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 22:01:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 22:01:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 22:01:54 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 22:01:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovJAOEWPkdVpkeD92l8R7AKkmXyb+pGqmbkVMOernW/CPjYo+y6Sj4MIBcBqQHmfCiAjv8sF9kZrjPioXsvNDGOfOEKUL+i9/bMCeM39ZhewbpFIXX38TZM3RTrBIBrVzakYsEG67Jyz3dbtIMTvOm00iz2R/TZupEo7uft2r5hKi1DMDU2tHBfrmEY2nnrh882gMbGg/BoZ1/ByqmefIDX1+gacGs8epknPRdT7MEQFw9tWLyIY1D3/me9L6D/lKUrhLIxhIkbqtKK27yx6WBRumYa0drytFOa6L6P8ee6sA103AVwfvzx2vfC6av+UBFikeuIqVGDBXMyezQrz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfbghS84XHttXG0hasvZSu9+QbHezQTIQp4D76QRLio=;
 b=OL66v5gR/LcB+HQabY363N42pWr6WNvHDjougKC1Dkf3Po8YDC8axmUD6oe0YNAZ+hYsxBmAM3MDOqI/Hhy34L+cv/Lfrf3NhZGEORQhNnkDTR1rgBRfkH5sTViir6yG+yuud3t0FMxBFrkBs2hQYZXzch5fARFT96nVs+mzEEzDcycflyJUKAHzAvSI9q6gcUVGkm0GlJO/FW5bgHT75BESeRTo1pF5zQoIZL1p1aZXS9S/rMkF/ABPb/wKuuldBVgG/tpfcBo52ZMxnVeydUN/mr27V+oBo4MdHWQRITcUO2a0el+yZ7W0tzy7hJAgE+j6xAFa7UiKyEXSDcZo+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 06:01:49 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 06:01:49 +0000
Message-ID: <42c7b117-22d6-4735-b921-4e9d3a1dcf72@intel.com>
Date: Tue, 18 Feb 2025 11:31:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
To: Simona Vetter <simona.vetter@ffwll.ch>, Pekka Paalanen
 <pekka.paalanen@haloniitty.fi>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com> <20250217120808.708b9b4d@eldfell>
 <Z7NxOVfgvvBt_sj3@phenom.ffwll.local>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <Z7NxOVfgvvBt_sj3@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::23) To CH3PR11MB7300.namprd11.prod.outlook.com
 (2603:10b6:610:150::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7300:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 038ea65a-7efa-4be8-22d8-08dd4fe1bb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmZhK2krMnphS05uVEhhNjI1ZFovQ0FqVjd2QUdtYW42UVc4Y3hmNVBUdFVN?=
 =?utf-8?B?REo3NVJLSWpjUzNxRlFIK0lrM0JXMVVQQm9NWlJDNlIxaGd3ck8rM2tlNUZK?=
 =?utf-8?B?bjFDbXF0eFYrOGVUbzBsUmpWUFRkK0lZOTZEeEtRcmE3RmJ4TXFmWHR1cmVS?=
 =?utf-8?B?NVZhRFRQTjJrOUUrckk3cEpMVEViNnFSdG1RSVRVaVdCaS9XUDZZR1NIL29V?=
 =?utf-8?B?ekZhK2lVa1F2OW9mbDRxRElSYVhWeUROTTU1Rnk5eGVyTXo5eE5vTVBubW9a?=
 =?utf-8?B?NXBBckhBdlg5bXlsVGJmUFV5bVBjTHhVNmpOLzZMR2tzTEV1RDgvdkNVUlNi?=
 =?utf-8?B?T3BMZ3cybWhsUGxVU1o0Mjh2UnZsR0plQlpObnVVTUcwZnhNVlU5clNKMWFp?=
 =?utf-8?B?d1Q2MmZvQjJnZnVDejVHdmFHUXdaZ2FKdXdvaUw5eFczVTdiZURzbjhrbHdm?=
 =?utf-8?B?RDFsSytRdFNkOU50UE5hem5DMDB6aURUV2IvTlBHdHJJVkZJdzFtcGg2dW5P?=
 =?utf-8?B?YkJYdk94MGpwOHdXbGZrTk1aaGRodmtNRnhRbHZWNmFQblpNV05oYURkdW02?=
 =?utf-8?B?RnB6alpmTzBYZ29SMmtoVjcvUTEvMGxYVU11dzhPeURlSzZiZEJEelltR3JU?=
 =?utf-8?B?cENMa1NVY1psUXlydEZhMWJxczRvcWlld1F0UkM1RUxlZ0ptREp1YUV5NXE1?=
 =?utf-8?B?cVZjSTdHM094MldKZEpJNGIrNkFyNnlUdjU5ckh3K0JnNzYya3NrM08zUncw?=
 =?utf-8?B?U0gyMHhncXJHeGpSczhUZVpkWUNzL1pkbDdrdzhORTNTbjN0aXBFMW5CamFs?=
 =?utf-8?B?WlBzUWJ2U3JsNTBKbHFWcnVGN0t1ZFNMR01LeDEvUktOdmdxa0lXTFRQVzdr?=
 =?utf-8?B?NWN0M2pnOUhTeDVkYkVod0dVNzFVbEpDV3p6aWhZUUY0Y1NyZWFzS0MyMWZB?=
 =?utf-8?B?VU8yZlBWU1Z5VlBFVnE1OVdUeWk2S2JWZ2w5YXNSQWl1N2FWTzFPbC9RRUFZ?=
 =?utf-8?B?eWVKRnVzNFdpVHg1Z0x4dmZVSzZ0djh1MHVWZ2hKWC9KblZDMGFjdzhjQVFm?=
 =?utf-8?B?SUZzdEg0aFZ3ZktWRnVZbEQ5SDFDZE8yMFh2Z3htNnRjc212SUpLQ0lrdklJ?=
 =?utf-8?B?U2JMcENZRkRWR2k1SDNYWVFiYUFsTnpMWlBFMkc2Wm1QaG9jQVJ5NzFaNDV6?=
 =?utf-8?B?NEVhR3FvZTBZVWVqb1RCcmhaQ0lMckdxZFhKMWZrOXZ1eWhXeHlEQjlUQVRh?=
 =?utf-8?B?NW5Mb1hoMmhncTZJUHc2MEJZZkE0T0x4L0J1VTd3dTRHc2REVStwYTdBWUs5?=
 =?utf-8?B?cEx2WGpUcVAvZjRCaDl6NXIrTUpUeGhFcFlhNFJUcEhqZWxDbENUZzYvazVj?=
 =?utf-8?B?QVF5WkNrMlI4N2lsSTFTMGRja2h1UklYUHhOTlQzY3ZuekdvMHhMdHpscFkz?=
 =?utf-8?B?dkpuNDBnc1hEczNGd0p0YWtSMG04dmhZSlVBZ1daRmJCK09BVUFpeXUxc2Vm?=
 =?utf-8?B?Z1ExOFUxWld2TW9oV0dpUVRqanJDOGJiSmtQOFhQcm1iVXFqeWVIWWEvbXJ0?=
 =?utf-8?B?M2laWU5CK2ZwZ2l1MGN1aXhHTUw5QlBUaHVuSVJncHpZZmU5SkkzZ3FzU3Qw?=
 =?utf-8?B?VWNUT0dTTElPamRSQVRnK3l4Wkc5UUZGRmxkQXlIajhwMDlFdDBvMm9Db0Rv?=
 =?utf-8?B?NEJZUm9vazdQeFl2YjFxZDVWOFBnUVd5eGdXd2ROL3hMd1RKMHdDSjQ5SzFD?=
 =?utf-8?B?SUtnU0p1U1JNVDFGS1g0Vlk4VGNPVFU1WVkxV21QdktUNGp3emN6QWNIZnVt?=
 =?utf-8?B?MXBZK3JhaThGYzMyeUtmVjZNc21VMU11RFoxcXpIMFllVDZkdlpDV2ZhTXJ4?=
 =?utf-8?Q?LNkMycg7ajIMJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWp2WS9JcG90d2IvSDN5eHVmYXNEZkppK2RpNU5td1duMnFzbzlBbGNqSkxH?=
 =?utf-8?B?RUZtNUlwTC9pNUw1a01ZLzVtc0M3SFE5WUFXbmV5K0N1cmswN3RFVTBxNzZS?=
 =?utf-8?B?ZEs0UW11VU16alV3L1YwVUg1R2xoc3NXNkFXTlJrQlR0RjBFemM0NDNyZXow?=
 =?utf-8?B?TUtNSlB3VE9ncVVtRnMvbmNrbytDQzFaK0hMTVQrdWtPNmtHUm5FM29XZnJq?=
 =?utf-8?B?bWg4NEZiWHpLUGJJNll4WWNYaEx3WmRDckZSL2pxdGFLZ1lBVXVxMm9LODBw?=
 =?utf-8?B?b1JES0lJdVdGOWxvZGlnK1Mrb0lzbGJVZ2RUVHMyamhwZWJLdFVnRlZnKzI0?=
 =?utf-8?B?RmxITDJWVDE1dUFBeStCWVdXczhWYVN4Y3UvaTcza05PaGRGWFYrRkNRVnRq?=
 =?utf-8?B?aVU2cWFnbEhXeUJOaTV5bDVjaE13b3pDWU1pdHRzRm1UQ0hEYXFxZzZhemgy?=
 =?utf-8?B?M2RHd0RPbDV6R05ERjhZczV3MkIyeHNqNDM0eTV0RHpJTmpFZ3phOC9GWnRK?=
 =?utf-8?B?N3RZMmNzb244NmphbFU5RWl1QW5aRStLQ053RU1LZURQMjNVODNlczhQQzBR?=
 =?utf-8?B?Z1BPMVQ2Wityc2RJcjNiaFNTMHU2Q1hwYmFTbEFBeGlUTXRzTEdTYVRwdlBE?=
 =?utf-8?B?UkVkcGthY1gxb3hwb1hBV0xwdXlmb1N2Y0ZWNGlEUFNXenRiZzBBM1BncVdl?=
 =?utf-8?B?N29kWHpVdjBVOEhTb1c4bksyemtOTldXRTZLYjUvU3pGMzkvSWZnT2ZSci9K?=
 =?utf-8?B?aHYxNS9KeHRlMWI5T00yMkRrT1lTUmVodnFpMVNMQmMybkRzL3RkbDRMSUtt?=
 =?utf-8?B?N0YrWDkyYkpDQ05SMDNzTytHOEltcVNwQ3JlZHZLaGdnVHZTcjRMcExYTGFa?=
 =?utf-8?B?UTlrUFh2cjUvWVJUemJnY1U4VTBtenE2SEtCOUI5QTlTb3M0K3FqMGFCRldY?=
 =?utf-8?B?NC9XSTRIYkRWWi9pNDhTa0pLQ3VUTnJ5djlCbFgvZ3NYSDFENVUrRnQwUCtR?=
 =?utf-8?B?TFRkclEvVVVselJDakd2NVdOK0g1aUFyb0FTbXRLeHZlVHRjSHdnQlp3b2N1?=
 =?utf-8?B?UEtsWWtKVUtsR3Z0djh6amRidHZPUm1JMDZPalp5ZnRXVERKay9uRU1GMERy?=
 =?utf-8?B?ZGJYNzdMdHRVbVYwZHNOZGJ6bWlKM0U4UG1OSlRhUE5oRUd4ZkRaa1RFcXVF?=
 =?utf-8?B?K0tGT2w5VmlMMUN5Rzh4TURaNEJWNjRIUXhnT1VkcXhIYTlTblNSTlp3bTFH?=
 =?utf-8?B?Tk4zejRMV01GaW16Yzg2T1ZscE9leVl5a1MwSTN3ZWRoaVRxbFpuYmxPVEdG?=
 =?utf-8?B?d3FXN3FycTNrNjQ4S3pRaUNDRURWWlF2bThtcFFNZlZRcE9idmNlcUE5Wk50?=
 =?utf-8?B?ZU43S0NBb21xREdEUHdqdGEwSXZrNUI4QWNaS2JwZld1VlUxZVhEalUxZVJG?=
 =?utf-8?B?aTl0ZVoweTM1WTlTcnAyTUZPQXFOZ0JPN2EwZnk0ZWk1NFdaRlRkdW8xMitN?=
 =?utf-8?B?cE5VVHRaRC9FbGNCc0pVTFdkWmFmUlMyK2NQMTdsaVdINEZ0NDhQcllOYzFS?=
 =?utf-8?B?QWNUd3RGZmpyaW1sK2FBM1U3Ym9tOXhYZDBLR0oyNGZuUWYwVHhoOW93UTFT?=
 =?utf-8?B?Y083UGFpSVl1ekJPeWZwb21taU1McytrYXE5WkRySkVlSEtJN0pQQTJjNkpY?=
 =?utf-8?B?dG52L1ZnNDJoQlUyTHdCZDBFenU4MFRMTEZWTDZHMERJcXkxWHJFUVpuR3N4?=
 =?utf-8?B?Tm1ZdEtzWWtZZXFPZXlGd00wTnc3Mlo1YWc4ZVB6cHNBSldGTjV0T3lvNUtL?=
 =?utf-8?B?OWV2NDJOTVUxVlVnZzJhSVZWcjhwOVcrc3BKcmtlMXhmK3R5VG9jN0pKbTFM?=
 =?utf-8?B?NmlNcGlJbFVqUzgzSkk2aUdCbHRpRmdQck1wWDIyL05IY3NJcW5kcE50QUtz?=
 =?utf-8?B?S01TQzBwTXFzamVVSkVheGUycG9SZjM1dG1ydWhmVmJUekJWZU5yMmVWZitP?=
 =?utf-8?B?M0RLMkhGbUlvVVhyL1ZLcVU3eTRubDRLN0EzZlBGcmFRaWlYazVFQ2MrWVdD?=
 =?utf-8?B?ZXlhNjdEN1U4M3orUjRkWlY3ZTA5dWRXdWpuSGlFMEdJMm1pV3J3TVk0WkJX?=
 =?utf-8?B?eDVrUDBOb0dyNmt5ODBPYSswWjgzQUpqOVNvZjl1cWJXOHh4TEtXdTB3Q0Za?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 038ea65a-7efa-4be8-22d8-08dd4fe1bb84
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 06:01:49.0329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylL/ZyoUZMZVF9p1RvuFEr8ZfBpcrt8EUZ/HYVkiwGYAQKt9A+Z2iLYDr4P5JwXj+G626bKWs9JTJvu0luOykw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
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


On 17-02-2025 22:56, Simona Vetter wrote:
> On Mon, Feb 17, 2025 at 12:08:08PM +0200, Pekka Paalanen wrote:
>> Hi Arun,
>>
>> this whole series seems to be missing all the UAPI docs for the DRM
>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
>> replacement for them, I would assume both are a requirement.
>>
>> Without the ReST docs it is really difficult to see how this new UAPI
>> should be used.
> Seconded. But really only wanted to comment on the userspace address in
> drm blobs.
>
>>> +/**
>>> + * struct drm_histogram_config
>>> + *
>>> + * @hist_mode_data: address to the histogram mode specific data if any
>> Do I understand correctly that the KMS blob will contain a userspace
>> virtual memory address (a user pointer)? How does that work? What are
>> the lifetime requirements for that memory?
>>
>> I do not remember any precedent of this, and I suspect it's not a good
>> design. I believe all the data should be contained in the blobs, e.g.
>> how IN_FORMATS does it. I'm not sure what would be the best UAPI here
>> for returning histogram data to userspace, but at least all the data
>> sent to the kernel should be contained in the blob itself since it
>> seems to be quite small. Variable length is ok for blobs.
> So yeah this doesn't work for a few reasons:
>
> - It's very restrictive what you're allowed to do during an atomic kms
>    commit, and a userspace page fault due to copy_from/to_user is
>    definitely not ok. Which means you need to unconditionally copy before
>    the atomic commit in the synchronous prep phase for the user->kernel
>    direction, and somewhere after the entire thing has finished for the
>    other direction. So this is worse than just more blobs, because with
>    drm blobs you can at least avoid copying if nothing has changed.
>
> - Due to the above you also cannot synchronize with userspace for the
>    kernel->userspace copy. And you can't fix that with a sync_file out
>    fence, because the underlying dma_fence rules are what prevents you from
>    doing userspace page faults in atomic commit, and the same rules apply
>    for any other sync_file fence too.
>
> - More fundamentally, both drm blobs and userspace virtual address spaces
>    (as represented by struct mm_struct) are refconted objects, with
>    entirely decoupled lifetimes. You'll have UAF issues here, and if you
>    fix them by grabbing references you'll break the world.
>
> tldr; this does not work
>
> Alternative A: drm blob
> -----------------------
>
> This would work for the userspace->kernel direction, but there's some
> downsides:
>
> - You still copy, although less often than with a userspace pointer.
>
> - The kernel->userspace direction doesn't work, because blob objects are
>    immutable. We have mutable blob properties, but mutability is achieved
>    by exchanging the entire blob object. There's two options to address
>    that:
>
>    a) Fundamentally immutable objects is really nice api designs, so I
>       prefer to not change that. But in theory making blob objects mutable
>       would work, and probably break the world.
>
>    b) A more benign trick would be to split the blob object id allocation
>       from creating the object itself. We could then allocate and return
>       the blob ID of the new histogram to userspace synchronously from the
>       atomic ioctl, while creating the object for real only in the atomic
>       commit.
>
>       As long as we preallocate any memory this doesn't break and dma_fence
>       signalling rules. Which also means we could use the existing atomic
>       out-fence (or a new one for histograms) to signal to userspace when
>       the data is ready, so this is at least somewhat useful for
>       compositors without fundamental issues.
>
>       You still suffer from additional copies here.
>
> Alternative B: gem_bo
> ---------------------
>
> One alternative which naturally has mutable data would be gem_bo, maybe
> wrapped in a drm_fb. The issue with that is that for small histograms you
> really want cpu access both in userspace and the kernel, while most
> display hardware wants uncached. And all the display-only kms drivers we
> have do not have a concept of cached gem_bo, unlike many of the drm
> drivers with render/accel support. Which means we're adding gem_bo which
> cannot be used for display, on display-only drivers, and I'd expect this
> will result in compositors blowing up in funny ways to no end.
>
> So not a good idea either, at least not if your histograms are small and
> the display hw doesn't dma them in/out already anyway.
>
> This also means that we'll probably need 2 interfaces here, one supporting
> gem_bo for big histograms and hw that can dma in/out of them, and a 2nd
> one optimized for the cpu access case.
>
> Alternative C: memfd
> --------------------
>
> I think a new drm property type that accepts memfd would fit the bill
> quit well:
>
> - memfd can be mmap(), so you avoid copies.
>
> - their distinct from gem_bo, so no chaos in apis everywhere with imposter
>    gem_bo that cannot ever be used for display.
>
> - memfd can be sealed, so we can validate that they have the right size
>
> - thanks to umdabuf there's already core mm code to properly pin them, so
>    painful to implement this all.
>
> For a driver interface I think the memfd should be pinned as long as it's
> in a drm_crtc/plane/whatever_state structure, with a kernel vmap void *
> pointer already set up. That way drivers can't get this wrong.
>
> The uapi has a few options:
>
> - Allow memfd to back drm_framebuffer. This won't result in api chaos
>    since the compositor creates these, and these memfd should never show up
>    in any property that would have a real fb backed by gem_bo. This still
>    feels horrible to me personally, but it would allow to support
>    histograms that need gem_bo in the same api. Personally I think we
>    should just do two flavors, they're too distinct.
>
> - A new memfd kms object like blob objects, which you can create and
>    destroy and which are refcounted. Creation would also pin the memfd and
>    check it has a sealed size (and whatever else we want sealed). This
>    avoids pin/unpin every time you change the memfd property, but no idea
>    whether that's a real use-case.
>
> - memfd properties just get the file descriptor (like in/out fences do)
>    and the drm atomic ioctl layer transparently pins/unpins as needed.
>
> Personally I think option C is neat, A doable, B really only for hw that
> can dma in/out of histograms and where it's big enough that doing so is a
> functional requirement.
>
> Cheers, Sima
Thanks for the detailed exploration of the options available and the 
conclusion among the available options.
Bringing memfd as a drm object opens up new opportunity for the drm 
users and a very good thought. Just curious to know if will histogram be 
the only user for this or does new IPC open up the thoughts for other 
interfaces such as writeback etc

I also personally feel bringing this memfd to drm is a good approach, 
will try to explore on the design part.
Any other comments/opinions on this from anyone?

Thanks and Regards,
Arun R Murthy
--------------------

