Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7AFADB503
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B178D10E3E8;
	Mon, 16 Jun 2025 15:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KR3wi9AZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61B610E3CB;
 Mon, 16 Jun 2025 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750086848; x=1781622848;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=XLITo1hGAfD5PLLSnYQesQvDaVh0sno8ErI7NLw9Aq4=;
 b=KR3wi9AZ9P0FqkjFriwnROMY9TLlphJzUZl/5u8tRNaykjzr+p0bvV7U
 YmYnvO1ITiQK6lSuyfBvYQmj/Fs1S2PCecwUivb0YJ5jy2quKxvB+j8t0
 rvx+zXGyOqD6mCzku3/HAF/WxwqLinQ4pvGA6KXuKZcs0O1cSJoOw79g4
 SKIW6TPLiuMToYOpKVg2AzTcpMDDVBfPCM1x+gYeuvHfwJmGCVZjpV7rm
 tlAIc2MmUxHbg87im1CImMOeNTXjeI07kvfkQkiN4F2Fl810btIQBjB5b
 cXtAE/TPaiAfDPAlxV3zXLPYOm+wSpTv+Y4BfkoZrk0URmc32nAvy1wKw g==;
X-CSE-ConnectionGUID: uK5MzeseTc6UpDUnTwDXmA==
X-CSE-MsgGUID: BNdUtkjRSI6gVsLWsHPcyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52371735"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208,217";a="52371735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:13:56 -0700
X-CSE-ConnectionGUID: g8R7KP2+TnSLKV5J8rVv4A==
X-CSE-MsgGUID: V5Hi4QwoT4aWGwyF1zBZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
 d="scan'208,217";a="179393446"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:13:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 08:13:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 08:13:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 08:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7kuCBZf7Es4IK3pKjHtxjerLRhrCSeKEvsezEQfe7ORMhYu1GYuw8d9Wsdl8Jqil5/w05JjyiPuyvrtYCXsZ+FUl25COpE6SYcuiltuEpEnJc6VbAlqNTSsfZyWNq1/RSEo0n+mGNQWJZ+mDvCjn00qriVfezvMLrJSrxinx9vC17MjsmU+j4sHbhl/N3q06erI82AeHPbXH47x8Plo2JPTvzfndJLVabcgTuenuz3fBSf5FSuneYKhSb6w7A1Rt9a1wEjxcDqe3mbXtLK4eTfxPayECdw8EyDdPdq6kp8Pwv3gL2OLFtNvME7Sl7kHLsgyIMnybD8MKgEd8DU8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ockhKu4FhFguk+JlgE/6G0PYp2kFUUzT6POXLCWQUUQ=;
 b=nSnMnGiqXz5gsEC+LpCVgVLmYSCFjnyHQSx5Nhxid75Wwkfep1f4SUxUg8oVb6M19o0gxr5DuhgaVa341VWoI0TSg5FctcZfaiASCBZ3G9Som/ojlzTy1xMTaaBz4XuQC/8berBo8kCKWilY5r0BLC+CcXdbGOCPUoC7Opnna7swMK7quLMOchDucTu9NhSQHViy3ZqXkI7XfwZQy2YuM+gPVPJ9TL1ubz0TIz9ZJ3zb60eueMy/g29X6NCIMqt2/X9TDxpHoWKrF1YNVFKeW8E3XfuVTE0s512qjq2ksGfaI3cogTwSfbl5luYm84YGA+apBgMvqnc6QDCXmtIsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 15:13:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 15:13:32 +0000
Content-Type: multipart/alternative;
 boundary="------------1hU2m1wuwqPMs06TiGRINpRe"
Message-ID: <575d4c7b-fb1b-432e-b8a8-87484ce5c3a7@intel.com>
Date: Mon, 16 Jun 2025 20:43:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] mei: late_bind: add late binding component driver
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-3-badal.nilawar@intel.com>
 <CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ae6168-3f97-4347-3a7d-08ddace85b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTF2UjZIaDFFOTluQzlQV2ozNnVZd21qTTVtZ2kyai9GSXV2dnAwWGVWS1Fu?=
 =?utf-8?B?MDlYaGY0ZTBieGllcWZKNzgyU0xST3dhajNOeTdKbWpGS3RCbERld2Y0VHBJ?=
 =?utf-8?B?bmpiQi85bTBLYnkvSWE5anc0b3VIRHFROHlXcjlZOUtHb3A5RnZwZDltQUI3?=
 =?utf-8?B?WnRjQU9kb2prTTJYbTlzYjlNZUlZcDZEZDNpcWJJNUo3ZG5PbUVGYVpMMTVn?=
 =?utf-8?B?NEpZWmhlQjFrRXVRNlVDOE1qaDlUalNwcG5jcnJvZTRsUitTVGZhOGgvS3Q2?=
 =?utf-8?B?R1FqV2xYdjdhZDBueG9HV01HZUxXT0VaOG5yQXc0UjdOc3AxMmEvSTB0UnRs?=
 =?utf-8?B?bXhqWlpqS0RsWjVhT005aTlhTDlXNmJNM2NsMmgrcGp2aGVqUXJoUVg5RVpv?=
 =?utf-8?B?U0dXZmdHNWg0YkxmUFNuQnRTT054OTBEQXBxRmltZlNaWVp0NVFldU1jbmx0?=
 =?utf-8?B?N0xiWi9iSXp1S1ArSTAwWlNzS2IyVDRHOTczWnFEMHJUOGNtNGFWclFQQTNI?=
 =?utf-8?B?QlhCVi9UcS9rY3UyVStuVE5zM2FxbjR4R2VqekxiNTdGY053WnlmNS9kNUp5?=
 =?utf-8?B?cDIwNHVjdDJVNlJ6OGd4TUxjNHJUMGQ1N0FCQTlnelV0RUFiaDNocGNSR0Vp?=
 =?utf-8?B?QmkydmVVcUJCTHQydUNWR0VtRW5vbzBJajEzbUhaZU1jZUQxM2xuYkdQd0ZB?=
 =?utf-8?B?eDlXeTRXUU5WUVdQclpvUmpRWlBUWUdnajh6OWpzYjc4WEZkUjdVWVJRdXBm?=
 =?utf-8?B?SVk4aHVIZUZaaDl4VHowdzdCeWVVNVFyRDA1Nk91cUhhNUNrenl4VUIrdkhs?=
 =?utf-8?B?SXRmNjBiamt5M0dJVWRiMjAzUHNpVVlhTWtMRHUwbjhLTC9GNlM0enYzek5w?=
 =?utf-8?B?SWR2RldGK05wR3hGaXZ6N3Q3TUJjVXltRmFiOHprbTc4ZHNSNS9WVXFNeEkr?=
 =?utf-8?B?SFVvQWdSclBFZjc5V1U0MkhYdlhiV2RIYW5KZXJWQU1GZkxxNEw3YjlDb3dY?=
 =?utf-8?B?cUFFc00zbUVOTUQ3QnNyUWcrdlBnM24xUzEyaGRiKzFYcmlVMitpaFBnbU5j?=
 =?utf-8?B?Skk3YVlRUVJsenFXSEcxbUV6d2ltd3A2UWl5TzczR3NVYktkMitYa2JQYWtL?=
 =?utf-8?B?cGJiN2I3UVYyZFZOeFE4dWxJWGNuZE1US2xTMmExWXdJdGlhRTBmTU9ZaDZQ?=
 =?utf-8?B?M2VNekhFL0JyRG5BcExOTXJuYmdXRnNUN21VZ3dBN0UxNWQ3NHE1VG9HRTk5?=
 =?utf-8?B?Q1JPSHFSWEh2Tm13YzJQRU4zeUZFTm1Yc2dDNkM0Qnd4aTA0MWt0ZnhwM2Rh?=
 =?utf-8?B?RHJ0UmphTkFGN1oyTitkbVpNVGxmWFdROEwwU1c5RmI2UU5COXl2STFycjYx?=
 =?utf-8?B?cSt2a0UzVXQyVERJa2VNV1hwc28yQnVIVTZHbTExUjluWnYvV3dHQU04UGFh?=
 =?utf-8?B?NlNKUHBZcXRUc09hM0RqZGt5S09kcjFVcllPQkRpZFgxcVNHa1Zhc09UMVhk?=
 =?utf-8?B?dmMwSllrYUZBWStITVduNHJka0JmbEcyK21KNFEvRmRSekxnVGZNTFpIdXJT?=
 =?utf-8?B?TjhHZW9xVlB6ZkkrUThmT3F6V0tkT2dzS09sQmtYZW95WEdUaFJIeFBNVFhN?=
 =?utf-8?B?ZCtENnBISTlNZ0JtR2J6QXlwSmpMb1lhM1JIMnNqK1c3dXh2a3ZsQ2laMmMr?=
 =?utf-8?B?S21Gbkd6WFNoaVR6RFQ1bStkWkpDakVVVUxIbVBVT2trUncyN1llcElSMDkx?=
 =?utf-8?B?RWExbXg4WHd5NHg3Z1ZPTUFpd1BaSzR6ckt1NkYzY05tMzJXbWVXcitJY0Jm?=
 =?utf-8?B?NTVEeUNwaXcvdFhiT2R1MXRUMURiTFFZMTU2dnZlUnN5RTFGS0NUQkg5dTR1?=
 =?utf-8?B?VUE3OW8wNk03MXllbVAwc2ZaQ2VPWkdzQjd6VWVPNStPZ3JEYWp5R05pREZH?=
 =?utf-8?Q?yz8PiAlaOvQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0NkTE8xWktkZTl2elZOanRDc21pZlZJYlVqbktVZHZkNXlWaGc1U3VjMjV0?=
 =?utf-8?B?eHZzTitLM1lUazFFbm1RVGs1WEFpZm5BNG9NK0NrdTRwb3YyLzJHZnlCV0xy?=
 =?utf-8?B?WTlDTWcrR2w4bVNBUXZCdTFvZHBhR25GellGVWhFM0R3akt3Q3hHMi9Oalo2?=
 =?utf-8?B?YjV0Z25Td0N3bXZCYlFTWU9yVUZKTHltRXF5STBsdVJmRStKYmh0TzNHNXhv?=
 =?utf-8?B?N3JUVjBhQ1VPMHllK25XWXRETmRxbGpFdzM0b3RJb3gyQ0s4ZVFrVStDR0Iy?=
 =?utf-8?B?eEg5V0s4bTVEZ1hXUVE2dkY5WGV2cXBDWmJsK1FJWjc4eHFHZG9vdjROcXE4?=
 =?utf-8?B?QVNJSG90TzdObDhqZFNZVnlYMEY4TGtvQVRZOUpmS0pFZ29Ma0gxb1Z1RTdP?=
 =?utf-8?B?TzJBUytzQm43V1ZTN0FVcGVIM0U2NjRscXBxeC9RdklOQjNJN255Tk0wdlNn?=
 =?utf-8?B?a0pIUEpsaEtLMDV3VDdoWlloOE0zcjd4ZXpFRVNoa25uRHNNRmpweng5K09t?=
 =?utf-8?B?V0ZaZ0RsYnJqaWlxWC9hQlRpQzY5bCsyR1MwVHAyZ1RoOUlOUUNxTmZGdjFM?=
 =?utf-8?B?Wm1EY2JRUkxnTkV2Rmx6amJqNDFjM3YrSHd0MGV1Wm9oZGc1K2pzVnRRMm9F?=
 =?utf-8?B?Zld5d3dYTUI0d2pWQnFHcVVGa0FVaFY4bVc3b0FvalNPczdYTmlkNzBWNjlZ?=
 =?utf-8?B?V0tHRTkwakwwaGErV0FXcms0dENGTkVyeE0rU1VldHVzMDI1OGxBYVhWMkFI?=
 =?utf-8?B?cmdteGhvOVlCYXZWM1B6MytSQUhvOWxtTm5raks0cHR1RE4xYm51a3g2RXlL?=
 =?utf-8?B?Q2JPRTBHQ25HM01YZEtEVlpIcnc4KzY1c0RYTUpSK01LdnE3UW1za0xrRlNP?=
 =?utf-8?B?TFMxSlB6ODdoM0E4ODN5UE10TkZtSWpCMFNwaW1ZUVF1T0k0L2ZnUmR1UGhk?=
 =?utf-8?B?RlpiK0FGMXUwRjJaejhrNU9OSERXQmdzb1QzUGhwczhldm91YTdtUGZzVmdH?=
 =?utf-8?B?U3V6MUVTbVBVMy9BaS9PUDdPYUR2NUI1WGJ4NmsrQXFzNVF2dUZWQkl3b1RI?=
 =?utf-8?B?Q1VlZVp1U0VVRTBmOThCVkZWTEVOOCs3eW5XZWhYK3RXVmgxbnk2RDFGTTFZ?=
 =?utf-8?B?VUVBbmhONW85cWNCbWdBUzJYVHBFcnNLb2tTK3h3c3dUckx6ZWdoSzJkZWc2?=
 =?utf-8?B?YmYycTZsR3hmM2luU2JYUVZ2d3VyS0VIdW9rWVFwNTVydmN2ZlA0N2ZoQnp6?=
 =?utf-8?B?MlQ2TURNdE1JZGN4TUJpNEIra2YrZDduNFVuTzJtMkhmMUdoTlBhRVRNUW5p?=
 =?utf-8?B?MitYSTl6T01LYkcxdUx5TVNpZ2dlZzgrajVLdElSNldySFRVWFd4OEcrQjV4?=
 =?utf-8?B?U2J5SVJwNWh0MUhZYXA5SUh1bnNIaDZkQ3IyMlZINGdxMVkzZSthak1WNFJ5?=
 =?utf-8?B?ZWgrYXdZU1VZZTlhVllDTXhvbURqVHgyeXl1MStaU3dsNWVJLzBWUitWaHkr?=
 =?utf-8?B?RmhYbmZEaXYrR3JoRytsZVRnTjVDRTdtYmIwY3FxT2ZaVEpDbDFZYjZZSnpQ?=
 =?utf-8?B?SWcvS200dnFCVkhOL29POGYwOTVNQW9rbU9HazUyWXRJUWtrLzBJKzg4OXNR?=
 =?utf-8?B?VEtCR2dkQ0U3SUcyY0p4UzhYMDljWW9JK0dFOWpOTGovang4NHUrN0hNSnor?=
 =?utf-8?B?bXY0TllVazlaWCt2anhNMGxHcVYwWVV0T1M5YmhFRXdWTmE2UCs3OExKN3A4?=
 =?utf-8?B?T2tLUFV5eStnZjdZZmlCZVNTNXlyN0IyN05od05GRzBFRkhyeFJ5MXFEbjJq?=
 =?utf-8?B?U0ZvWjZvT09waE1YR0FSRG1ZUkVkd2dFS3VMZElFc1drSmtuZFRTYllocFZP?=
 =?utf-8?B?ci8wZ0JUc1lFYVVMa20wdlRnMXA3M1FXZXFNWTBwb285Y3NFK1dhVW9jSm1o?=
 =?utf-8?B?Q2M4bmJ4MHAvTGFBNjJRTzBEbURBdnFsSUN1eGZXa0ZGemlaR2kxc0t3RGZV?=
 =?utf-8?B?NUx4MTRHTHI4ZERZcW5ONi9nc2o2RlNSSklGLzVqb3Bkb3ROcHdwU3NmdEd3?=
 =?utf-8?B?VTdJTTlseHgzWHJMR3RFMEVqNkdZUlNYelA5V2xudXRwQ3pQdk9xOHFBK3hJ?=
 =?utf-8?B?UStYWndmZGI4ZDljM2N3bWJiOGRnWDEwSWVBSnlxNG1mUmFJekJudk5rWmRo?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ae6168-3f97-4347-3a7d-08ddace85b46
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:13:32.4976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +egFuEFzDQHN6mkQ4Vf5sfXnKd3JK7KDIQb4n/Z8otEAyqCvzj6iz+dqgBY3S34o9OY5kx+Ke6eKockphcf9Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
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

--------------1hU2m1wuwqPMs06TiGRINpRe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 14-06-2025 13:32, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Nilawar, Badal<badal.nilawar@intel.com>
>> Sent: Friday, June 6, 2025 11:27 PM
>> To:intel-xe@lists.freedesktop.org;dri-devel@lists.freedesktop.org
>> Cc: Gupta, Anshuman<anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; Usyskin, Alexander<alexander.usyskin@intel.com>;
>> gregkh@linuxfoundation.org; Ceraolo Spurio, Daniele
>> <daniele.ceraolospurio@intel.com>;jgg@nvidia.com
>> Subject: [PATCH v2 02/10] mei: late_bind: add late binding component driver
>>
>> From: Alexander Usyskin<alexander.usyskin@intel.com>
>>
>> Add late binding component driver.
>> It allows pushing the late binding configuration from, for example, the Xe
>> graphics driver to the Intel discrete graphics card's CSE device.
>>
>> Signed-off-by: Alexander Usyskin<alexander.usyskin@intel.com>
>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>> ---
>> v2:
>>   - Use generic naming (Jani)
>>   - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
>> ---
>>   drivers/misc/mei/Kconfig                    |   1 +
>>   drivers/misc/mei/Makefile                   |   1 +
>>   drivers/misc/mei/late_bind/Kconfig          |  12 +
>>   drivers/misc/mei/late_bind/Makefile         |   9 +
>>   drivers/misc/mei/late_bind/mei_late_bind.c  | 261 ++++++++++++++++++++
>>   include/drm/intel/i915_component.h          |   1 +
>>   include/drm/intel/late_bind_mei_interface.h |  37 +++
>>   7 files changed, 322 insertions(+)
>>   create mode 100644 drivers/misc/mei/late_bind/Kconfig
>>   create mode 100644 drivers/misc/mei/late_bind/Makefile
>>   create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>>   create mode 100644 include/drm/intel/late_bind_mei_interface.h
>>
>> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
>> 7575fee96cc6..771becc68095 100644
>> --- a/drivers/misc/mei/Kconfig
>> +++ b/drivers/misc/mei/Kconfig
>> @@ -84,5 +84,6 @@ config INTEL_MEI_VSC
>>   source "drivers/misc/mei/hdcp/Kconfig"
>>   source "drivers/misc/mei/pxp/Kconfig"
>>   source "drivers/misc/mei/gsc_proxy/Kconfig"
>> +source "drivers/misc/mei/late_bind/Kconfig"
>>
>>   endif
>> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
>> 6f9fdbf1a495..84bfde888d81 100644
>> --- a/drivers/misc/mei/Makefile
>> +++ b/drivers/misc/mei/Makefile
>> @@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
>>   obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
>>   obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
>>   obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
>> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) += late_bind/
>>
>>   obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o  mei-vsc-hw-y := vsc-
>> tp.o diff --git a/drivers/misc/mei/late_bind/Kconfig
>> b/drivers/misc/mei/late_bind/Kconfig
>> new file mode 100644
>> index 000000000000..c5302303e5af
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
>> +#
>> +config INTEL_MEI_LATE_BIND
>> +	tristate "Intel late binding support on ME Interface"
>> +	select INTEL_MEI_ME
>> +	depends on DRM_XE
>> +	help
>> +	  MEI Support for Late Binding for Intel graphics card.
>> +
>> +	  Enables the ME FW interfaces for Late Binding for
>> +          Xe display driver of Intel.
> It is needed even for headless cards as well.
Will change the description.
>> diff --git a/drivers/misc/mei/late_bind/Makefile
>> b/drivers/misc/mei/late_bind/Makefile
>> new file mode 100644
>> index 000000000000..a0aeda5853f0
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
>> +#
>> +# Makefile - Late Binding client driver for Intel MEI Bus Driver.
>> +
>> +subdir-ccflags-y += -I$(srctree)/drivers/misc/mei/
>> +
>> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) += mei_late_bind.o
>> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
>> b/drivers/misc/mei/late_bind/mei_late_bind.c
>> new file mode 100644
>> index 000000000000..964757a9b33a
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
>> @@ -0,0 +1,261 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2025 Intel Corporation  */ #include
>> +<drm/drm_connector.h> #include <drm/intel/i915_component.h> #include
> Why do we need drm_connector header ?
> Remove unnecessary headers.
Sure
>> +<drm/intel/late_bind_mei_interface.h>
>> +#include <linux/component.h>
>> +#include <linux/pci.h>
>> +#include <linux/mei_cl_bus.h>
>> +#include <linux/module.h>
>> +#include <linux/overflow.h>
>> +#include <linux/slab.h>
>> +#include <linux/uuid.h>
>> +
>> +#include "mkhi.h"
>> +
>> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
> Why it is not prefixed with DGFX. This is unique to DGFX cards ?
> @alexander any comment on above ?
>> +GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD
>> | 0x80)
>> +
>> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
>> +LATE_BIND_RECV_TIMEOUT_MSEC 3000
>  From where we got these delay numbers, from any specs or it is arbitrary delay specific to let bind ?
> Add a code comment in that case.
>> +
>> +/**
>> + * struct csc_heci_late_bind_req - late binding request
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @flags: flags to be passed to the firmware
>> + * @reserved: reserved field
>> + * @payload_size: size of the payload data in bytes
>> + * @payload: data to be sent to the firmware  */ struct
>> +csc_heci_late_bind_req {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 flags;
>> +	u32 reserved[2];
>> +	u32 payload_size;
>> +	u8  payload[] __counted_by(payload_size); } __packed;
>> +
>> +/**
>> + * struct csc_heci_late_bind_rsp - late binding response
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @reserved: reserved field
>> + * @status: status of the late binding command execution by firmware
>> +*/ struct csc_heci_late_bind_rsp {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 reserved[2];
>> +	u32 status;
>> +} __packed;
>> +
>> +static int mei_late_bind_check_response(const struct device *dev, const
>> +struct mkhi_msg_hdr *hdr) {
>> +	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
>> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
>> +			hdr->group_id, MKHI_GROUP_ID_GFX);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (hdr->command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
>> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
>> +			hdr->command,
>> GFX_SRV_MKHI_LATE_BINDING_RSP);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * mei_late_bind_push_config - Sends a config to the firmware.
>> + * @dev: device struct corresponding to the mei device
>> + * @type: payload type
>> + * @flags: payload flags
>> + * @payload: payload buffer
>> + * @payload_size: payload buffer size
>> + *
>> + * Return: 0 success, negative errno value on transport failure,
>> + *         positive status returned by FW
>> + */
>> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
>> +				     const void *payload, size_t payload_size) {
>> +	struct mei_cl_device *cldev;
>> +	struct csc_heci_late_bind_req *req = NULL;
>> +	struct csc_heci_late_bind_rsp rsp;
>> +	size_t req_size;
>> +	int ret;
>> +
>> +	if (!dev || !payload || !payload_size)
>> +		return -EINVAL;
>> +
>> +	cldev = to_mei_cl_device(dev);
>> +
>> +	ret = mei_cldev_enable(cldev);
>> +	if (ret < 0) {
>> +		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	req_size = struct_size(req, payload, payload_size);
>> +	if (req_size > mei_cldev_mtu(cldev)) {
>> +		dev_err(dev, "Payload is too big %zu\n", payload_size);
>> +		ret = -EMSGSIZE;
>> +		goto end;
>> +	}
>> +
>> +	req = kmalloc(req_size, GFP_KERNEL);
>> +	if (!req) {
>> +		ret = -ENOMEM;
>> +		goto end;
>> +	}
>> +
>> +	req->header.group_id = MKHI_GROUP_ID_GFX;
>> +	req->header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
>> +	req->type = type;
>> +	req->flags = flags;
>> +	req->reserved[0] = 0;
>> +	req->reserved[1] = 0;
>> +	req->payload_size = payload_size;
>> +	memcpy(req->payload, payload, payload_size);
>> +
>> +	ret = mei_cldev_send_timeout(cldev, (void *)req, req_size,
>> LATE_BIND_SEND_TIMEOUT_MSEC);
>> +	if (ret < 0) {
>> +		dev_err(dev, "mei_cldev_send failed. %d\n", ret);
>> +		goto end;
>> +	}
>> +	ret = mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp),
>> LATE_BIND_RECV_TIMEOUT_MSEC);
>> +	if (ret < 0) {
>> +		dev_err(dev, "mei_cldev_recv failed. %d\n", ret);
>> +		goto end;
>> +	}
>> +	ret = mei_late_bind_check_response(dev, &rsp.header);
>> +	if (ret) {
>> +		dev_err(dev, "bad result response from the firmware:
>> 0x%x\n",
>> +			*(uint32_t *)&rsp.header);
>> +		goto end;
>> +	}
>> +	ret = (int)rsp.status;
>> +	dev_dbg(dev, "mei_late_bind_push_config status = %d\n", ret);
>> +
>> +end:
>> +	mei_cldev_disable(cldev);
>> +	kfree(req);
>> +	return ret;
>> +}
>> +
>> +static const struct late_bind_component_ops mei_late_bind_ops = {
>> +	.owner = THIS_MODULE,
>> +	.push_config = mei_late_bind_push_config, };
>> +
>> +static int mei_component_master_bind(struct device *dev) {
>> +	return component_bind_all(dev, (void *)&mei_late_bind_ops); }
>> +
>> +static void mei_component_master_unbind(struct device *dev) {
>> +	component_unbind_all(dev, (void *)&mei_late_bind_ops); }
>> +
>> +static const struct component_master_ops mei_component_master_ops = {
>> +	.bind = mei_component_master_bind,
>> +	.unbind = mei_component_master_unbind, };
>> +
>> +/**
>> + * mei_late_bind_component_match - compare function for matching mei
>> late bind.
>> + *
>> + *    The function checks if requested is Intel VGA device
>> + *    and the parent of requester and the grand parent of mei_if are the same
>> + *    device.
> This might be broken for headless card, headless care need to necessarily be VGA card.
Will do %s/PCI_CLASS_DISPLAY_VGA/PCI_CLASS_DISPLAY to cover headless cards.
>> + *
>> + * @dev: master device
>> + * @subcomponent: subcomponent to match
>> (I915_COMPONENT_LATE_BIND)
>> + * @data: compare data (mei late-bind bus device)
>> + *
>> + * Return:
>> + * * 1 - if components match
>> + * * 0 - otherwise
>> + */
>> +static int mei_late_bind_component_match(struct device *dev, int
>> subcomponent,
>> +					 void *data)
>> +{
>> +	struct device *base = data;
>> +	struct pci_dev *pdev;
>> +
>> +	if (!dev)
>> +		return 0;
>> +
>> +	if (!dev_is_pci(dev))
>> +		return 0;
>> +
>> +	pdev = to_pci_dev(dev);
>> +
>> +	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
>> +	    pdev->vendor != PCI_VENDOR_ID_INTEL)
>> +		return 0;
>> +
>> +	if (subcomponent != I915_COMPONENT_LATE_BIND)
>> +		return 0;
> Why I915_COMPONENT_LATE_BIND ?
> Isn't this should be XE_ COMPONENT_LATE_BIND.

Suggestion is not to use XE_ prefix in generic code. I915_ prefix is due 
to historical reasons, its being used for other components as well which 
are common in i915/xe. |
If everyone agree then I will use INTEL_ prefix here.

>> +
>> +	base = base->parent;
>> +	if (!base) /* mei device */
>> +		return 0;
>> +
>> +	base = base->parent; /* pci device */
> Is it sgunit pci endpoint ?
> If yes then good to mention in comment.
>> +
>> +	return !!base && dev == base;
>> +}
>> +
>> +static int mei_late_bind_probe(struct mei_cl_device *cldev,
>> +			       const struct mei_cl_device_id *id) {
>> +	struct component_match *master_match = NULL;
>> +	int ret;
>> +
>> +	component_match_add_typed(&cldev->dev, &master_match,
>> +				  mei_late_bind_component_match, &cldev-
>>> dev);
>> +	if (IS_ERR_OR_NULL(master_match))
>> +		return -ENOMEM;
>> +
>> +	ret = component_master_add_with_match(&cldev->dev,
>> +					      &mei_component_master_ops,
>> +					      master_match);
>> +	if (ret < 0)
>> +		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static void mei_late_bind_remove(struct mei_cl_device *cldev) {
>> +	component_master_del(&cldev->dev,
>> &mei_component_master_ops); }
>> +
>> +#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
>> +			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
>> +
>> +static struct mei_cl_device_id mei_late_bind_tbl[] = {
>> +	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
>> +
>> +static struct mei_cl_driver mei_late_bind_driver = {
>> +	.id_table = mei_late_bind_tbl,
>> +	.name = KBUILD_MODNAME,
>> +	.probe = mei_late_bind_probe,
>> +	.remove	= mei_late_bind_remove,
>> +};
>> +
>> +module_mei_cl_driver(mei_late_bind_driver);
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("MEI Late Binding");
>> diff --git a/include/drm/intel/i915_component.h
>> b/include/drm/intel/i915_component.h
>> index 4ea3b17aa143..4945044d41e6 100644
>> --- a/include/drm/intel/i915_component.h
>> +++ b/include/drm/intel/i915_component.h
>> @@ -31,6 +31,7 @@ enum i915_component_type {
>>   	I915_COMPONENT_HDCP,
>>   	I915_COMPONENT_PXP,
>>   	I915_COMPONENT_GSC_PROXY,
>> +	I915_COMPONENT_LATE_BIND,
> We probably need a change here to make a xe specific component.

Yes as mentioned in response of previous comment this can be 
INTEL_COMPONENT_LATE_BIND if everyone agree.

Regards,
Badal

>
> Thanks,
> Anshuman Gupta.
>>   };
>>
>>   /* MAX_PORT is the number of port
>> diff --git a/include/drm/intel/late_bind_mei_interface.h
>> b/include/drm/intel/late_bind_mei_interface.h
>> new file mode 100644
>> index 000000000000..6b54b8cec5ae
>> --- /dev/null
>> +++ b/include/drm/intel/late_bind_mei_interface.h	
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (c) 2025 Intel Corporation  */
>> +
>> +#ifndef _LATE_BIND_MEI_INTERFACE_H_
>> +#define _LATE_BIND_MEI_INTERFACE_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct device;
>> +struct module;
>> +
>> +/**
>> + * struct late_bind_component_ops - ops for Late Binding services.
>> + * @owner: Module providing the ops
>> + * @push_config: Sends a config to FW.
>> + */
>> +struct late_bind_component_ops {
>> +	struct module *owner;
>> +
>> +	/**
>> +	 * @push_config: Sends a config to FW.
>> +	 * @dev: device struct corresponding to the mei device
>> +	 * @type: payload type
>> +	 * @flags: payload flags
>> +	 * @payload: payload buffer
>> +	 * @payload_size: payload buffer size
>> +	 *
>> +	 * Return: 0 success, negative errno value on transport failure,
>> +	 *         positive status returned by FW
>> +	 */
>> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
>> +			   const void *payload, size_t payload_size); };
>> +
>> +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
>> --
>> 2.34.1
--------------1hU2m1wuwqPMs06TiGRINpRe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-06-2025 13:32, Gupta, Anshuman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Nilawar, Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Sent: Friday, June 6, 2025 11:27 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
Cc: Gupta, Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>; Vivi, Rodrigo
<a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>; Usyskin, Alexander <a class="moz-txt-link-rfc2396E" href="mailto:alexander.usyskin@intel.com">&lt;alexander.usyskin@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>; Ceraolo Spurio, Daniele
<a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:jgg@nvidia.com">jgg@nvidia.com</a>
Subject: [PATCH v2 02/10] mei: late_bind: add late binding component driver

From: Alexander Usyskin <a class="moz-txt-link-rfc2396E" href="mailto:alexander.usyskin@intel.com">&lt;alexander.usyskin@intel.com&gt;</a>

Add late binding component driver.
It allows pushing the late binding configuration from, for example, the Xe
graphics driver to the Intel discrete graphics card's CSE device.

Signed-off-by: Alexander Usyskin <a class="moz-txt-link-rfc2396E" href="mailto:alexander.usyskin@intel.com">&lt;alexander.usyskin@intel.com&gt;</a>
Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
v2:
 - Use generic naming (Jani)
 - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
---
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/late_bind/Kconfig          |  12 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 261 ++++++++++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  37 +++
 7 files changed, 322 insertions(+)
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
7575fee96cc6..771becc68095 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -84,5 +84,6 @@ config INTEL_MEI_VSC
 source &quot;drivers/misc/mei/hdcp/Kconfig&quot;
 source &quot;drivers/misc/mei/pxp/Kconfig&quot;
 source &quot;drivers/misc/mei/gsc_proxy/Kconfig&quot;
+source &quot;drivers/misc/mei/late_bind/Kconfig&quot;

 endif
diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
6f9fdbf1a495..84bfde888d81 100644
--- a/drivers/misc/mei/Makefile
+++ b/drivers/misc/mei/Makefile
@@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
 obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
 obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
 obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += late_bind/

 obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o  mei-vsc-hw-y := vsc-
tp.o diff --git a/drivers/misc/mei/late_bind/Kconfig
b/drivers/misc/mei/late_bind/Kconfig
new file mode 100644
index 000000000000..c5302303e5af
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+config INTEL_MEI_LATE_BIND
+	tristate &quot;Intel late binding support on ME Interface&quot;
+	select INTEL_MEI_ME
+	depends on DRM_XE
+	help
+	  MEI Support for Late Binding for Intel graphics card.
+
+	  Enables the ME FW interfaces for Late Binding for
+          Xe display driver of Intel.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">It is needed even for headless cards as well.</pre>
    </blockquote>
    Will change the description.&nbsp;
    <blockquote type="cite" cite="mid:CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/misc/mei/late_bind/Makefile
b/drivers/misc/mei/late_bind/Makefile
new file mode 100644
index 000000000000..a0aeda5853f0
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+# Makefile - Late Binding client driver for Intel MEI Bus Driver.
+
+subdir-ccflags-y += -I$(srctree)/drivers/misc/mei/
+
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += mei_late_bind.o
diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
b/drivers/misc/mei/late_bind/mei_late_bind.c
new file mode 100644
index 000000000000..964757a9b33a
--- /dev/null
+++ b/drivers/misc/mei/late_bind/mei_late_bind.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Intel Corporation  */ #include
+&lt;drm/drm_connector.h&gt; #include &lt;drm/intel/i915_component.h&gt; #include
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why do we need drm_connector header ?
Remove unnecessary headers.</pre>
    </blockquote>
    Sure
    <blockquote type="cite" cite="mid:CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+&lt;drm/intel/late_bind_mei_interface.h&gt;
+#include &lt;linux/component.h&gt;
+#include &lt;linux/pci.h&gt;
+#include &lt;linux/mei_cl_bus.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/overflow.h&gt;
+#include &lt;linux/slab.h&gt;
+#include &lt;linux/uuid.h&gt;
+
+#include &quot;mkhi.h&quot;
+
+#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why it is not prefixed with DGFX. This is unique to DGFX cards ?
@alexander any comment on above ?
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD
| 0x80)
+
+#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
+LATE_BIND_RECV_TIMEOUT_MSEC 3000
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">From where we got these delay numbers, from any specs or it is arbitrary delay specific to let bind ?
Add a code comment in that case.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+/**
+ * struct csc_heci_late_bind_req - late binding request
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @flags: flags to be passed to the firmware
+ * @reserved: reserved field
+ * @payload_size: size of the payload data in bytes
+ * @payload: data to be sent to the firmware  */ struct
+csc_heci_late_bind_req {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 flags;
+	u32 reserved[2];
+	u32 payload_size;
+	u8  payload[] __counted_by(payload_size); } __packed;
+
+/**
+ * struct csc_heci_late_bind_rsp - late binding response
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @reserved: reserved field
+ * @status: status of the late binding command execution by firmware
+*/ struct csc_heci_late_bind_rsp {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 reserved[2];
+	u32 status;
+} __packed;
+
+static int mei_late_bind_check_response(const struct device *dev, const
+struct mkhi_msg_hdr *hdr) {
+	if (hdr-&gt;group_id != MKHI_GROUP_ID_GFX) {
+		dev_err(dev, &quot;Mismatch group id: 0x%x instead of 0x%x\n&quot;,
+			hdr-&gt;group_id, MKHI_GROUP_ID_GFX);
+		return -EINVAL;
+	}
+
+	if (hdr-&gt;command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
+		dev_err(dev, &quot;Mismatch command: 0x%x instead of 0x%x\n&quot;,
+			hdr-&gt;command,
GFX_SRV_MKHI_LATE_BINDING_RSP);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * mei_late_bind_push_config - Sends a config to the firmware.
+ * @dev: device struct corresponding to the mei device
+ * @type: payload type
+ * @flags: payload flags
+ * @payload: payload buffer
+ * @payload_size: payload buffer size
+ *
+ * Return: 0 success, negative errno value on transport failure,
+ *         positive status returned by FW
+ */
+static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
+				     const void *payload, size_t payload_size) {
+	struct mei_cl_device *cldev;
+	struct csc_heci_late_bind_req *req = NULL;
+	struct csc_heci_late_bind_rsp rsp;
+	size_t req_size;
+	int ret;
+
+	if (!dev || !payload || !payload_size)
+		return -EINVAL;
+
+	cldev = to_mei_cl_device(dev);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret &lt; 0) {
+		dev_dbg(dev, &quot;mei_cldev_enable failed. %d\n&quot;, ret);
+		return ret;
+	}
+
+	req_size = struct_size(req, payload, payload_size);
+	if (req_size &gt; mei_cldev_mtu(cldev)) {
+		dev_err(dev, &quot;Payload is too big %zu\n&quot;, payload_size);
+		ret = -EMSGSIZE;
+		goto end;
+	}
+
+	req = kmalloc(req_size, GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	req-&gt;header.group_id = MKHI_GROUP_ID_GFX;
+	req-&gt;header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
+	req-&gt;type = type;
+	req-&gt;flags = flags;
+	req-&gt;reserved[0] = 0;
+	req-&gt;reserved[1] = 0;
+	req-&gt;payload_size = payload_size;
+	memcpy(req-&gt;payload, payload, payload_size);
+
+	ret = mei_cldev_send_timeout(cldev, (void *)req, req_size,
LATE_BIND_SEND_TIMEOUT_MSEC);
+	if (ret &lt; 0) {
+		dev_err(dev, &quot;mei_cldev_send failed. %d\n&quot;, ret);
+		goto end;
+	}
+	ret = mei_cldev_recv_timeout(cldev, (void *)&amp;rsp, sizeof(rsp),
LATE_BIND_RECV_TIMEOUT_MSEC);
+	if (ret &lt; 0) {
+		dev_err(dev, &quot;mei_cldev_recv failed. %d\n&quot;, ret);
+		goto end;
+	}
+	ret = mei_late_bind_check_response(dev, &amp;rsp.header);
+	if (ret) {
+		dev_err(dev, &quot;bad result response from the firmware:
0x%x\n&quot;,
+			*(uint32_t *)&amp;rsp.header);
+		goto end;
+	}
+	ret = (int)rsp.status;
+	dev_dbg(dev, &quot;mei_late_bind_push_config status = %d\n&quot;, ret);
+
+end:
+	mei_cldev_disable(cldev);
+	kfree(req);
+	return ret;
+}
+
+static const struct late_bind_component_ops mei_late_bind_ops = {
+	.owner = THIS_MODULE,
+	.push_config = mei_late_bind_push_config, };
+
+static int mei_component_master_bind(struct device *dev) {
+	return component_bind_all(dev, (void *)&amp;mei_late_bind_ops); }
+
+static void mei_component_master_unbind(struct device *dev) {
+	component_unbind_all(dev, (void *)&amp;mei_late_bind_ops); }
+
+static const struct component_master_ops mei_component_master_ops = {
+	.bind = mei_component_master_bind,
+	.unbind = mei_component_master_unbind, };
+
+/**
+ * mei_late_bind_component_match - compare function for matching mei
late bind.
+ *
+ *    The function checks if requested is Intel VGA device
+ *    and the parent of requester and the grand parent of mei_if are the same
+ *    device.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This might be broken for headless card, headless care need to necessarily be VGA card.</pre>
    </blockquote>
    Will do %s/<span style="white-space: pre-wrap">PCI_CLASS_DISPLAY_VGA/PCI_CLASS_DISPLAY to cover headless cards. </span>
    <blockquote type="cite" cite="mid:CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match
(I915_COMPONENT_LATE_BIND)
+ * @data: compare data (mei late-bind bus device)
+ *
+ * Return:
+ * * 1 - if components match
+ * * 0 - otherwise
+ */
+static int mei_late_bind_component_match(struct device *dev, int
subcomponent,
+					 void *data)
+{
+	struct device *base = data;
+	struct pci_dev *pdev;
+
+	if (!dev)
+		return 0;
+
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev-&gt;class != (PCI_CLASS_DISPLAY_VGA &lt;&lt; 8) ||
+	    pdev-&gt;vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (subcomponent != I915_COMPONENT_LATE_BIND)
+		return 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why I915_COMPONENT_LATE_BIND ?
Isn't this should be XE_ COMPONENT_LATE_BIND.</pre>
    </blockquote>
    <p>Suggestion is not to use XE_ prefix in generic code. I915_ prefix
      is due to historical reasons, its being used for other components
      as well which are common in i915/xe. |<br>
      If everyone agree then I will use INTEL_ prefix here.&nbsp;&nbsp;</p>
    <blockquote type="cite" cite="mid:CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	base = base-&gt;parent;
+	if (!base) /* mei device */
+		return 0;
+
+	base = base-&gt;parent; /* pci device */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Is it sgunit pci endpoint ? 
If yes then good to mention in comment.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	return !!base &amp;&amp; dev == base;
+}
+
+static int mei_late_bind_probe(struct mei_cl_device *cldev,
+			       const struct mei_cl_device_id *id) {
+	struct component_match *master_match = NULL;
+	int ret;
+
+	component_match_add_typed(&amp;cldev-&gt;dev, &amp;master_match,
+				  mei_late_bind_component_match, &amp;cldev-
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">dev);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">+	if (IS_ERR_OR_NULL(master_match))
+		return -ENOMEM;
+
+	ret = component_master_add_with_match(&amp;cldev-&gt;dev,
+					      &amp;mei_component_master_ops,
+					      master_match);
+	if (ret &lt; 0)
+		dev_err(&amp;cldev-&gt;dev, &quot;Master comp add failed %d\n&quot;, ret);
+
+	return ret;
+}
+
+static void mei_late_bind_remove(struct mei_cl_device *cldev) {
+	component_master_del(&amp;cldev-&gt;dev,
&amp;mei_component_master_ops); }
+
+#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
+			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
+
+static struct mei_cl_device_id mei_late_bind_tbl[] = {
+	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
+
+static struct mei_cl_driver mei_late_bind_driver = {
+	.id_table = mei_late_bind_tbl,
+	.name = KBUILD_MODNAME,
+	.probe = mei_late_bind_probe,
+	.remove	= mei_late_bind_remove,
+};
+
+module_mei_cl_driver(mei_late_bind_driver);
+
+MODULE_AUTHOR(&quot;Intel Corporation&quot;);
+MODULE_LICENSE(&quot;GPL&quot;);
+MODULE_DESCRIPTION(&quot;MEI Late Binding&quot;);
diff --git a/include/drm/intel/i915_component.h
b/include/drm/intel/i915_component.h
index 4ea3b17aa143..4945044d41e6 100644
--- a/include/drm/intel/i915_component.h
+++ b/include/drm/intel/i915_component.h
@@ -31,6 +31,7 @@ enum i915_component_type {
 	I915_COMPONENT_HDCP,
 	I915_COMPONENT_PXP,
 	I915_COMPONENT_GSC_PROXY,
+	I915_COMPONENT_LATE_BIND,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">We probably need a change here to make a xe specific component.</pre>
    </blockquote>
    <p>Yes as mentioned in response of previous comment this can be
      INTEL_COMPONENT_LATE_BIND if everyone agree.</p>
    <p>Regards,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:CY5PR11MB6211ADC01F813F24F5B7AA939576A@CY5PR11MB6211.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Anshuman Gupta.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> };

 /* MAX_PORT is the number of port
diff --git a/include/drm/intel/late_bind_mei_interface.h
b/include/drm/intel/late_bind_mei_interface.h
new file mode 100644
index 000000000000..6b54b8cec5ae
--- /dev/null
+++ b/include/drm/intel/late_bind_mei_interface.h	
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2025 Intel Corporation  */
+
+#ifndef _LATE_BIND_MEI_INTERFACE_H_
+#define _LATE_BIND_MEI_INTERFACE_H_
+
+#include &lt;linux/types.h&gt;
+
+struct device;
+struct module;
+
+/**
+ * struct late_bind_component_ops - ops for Late Binding services.
+ * @owner: Module providing the ops
+ * @push_config: Sends a config to FW.
+ */
+struct late_bind_component_ops {
+	struct module *owner;
+
+	/**
+	 * @push_config: Sends a config to FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @type: payload type
+	 * @flags: payload flags
+	 * @payload: payload buffer
+	 * @payload_size: payload buffer size
+	 *
+	 * Return: 0 success, negative errno value on transport failure,
+	 *         positive status returned by FW
+	 */
+	int (*push_config)(struct device *dev, u32 type, u32 flags,
+			   const void *payload, size_t payload_size); };
+
+#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
--
2.34.1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------1hU2m1wuwqPMs06TiGRINpRe--
