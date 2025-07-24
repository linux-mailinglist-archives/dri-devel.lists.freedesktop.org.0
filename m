Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1921B10747
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 12:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194FC10E918;
	Thu, 24 Jul 2025 10:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KD8gB+40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3E210E915;
 Thu, 24 Jul 2025 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753351347; x=1784887347;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YUQGWCUx7WoZJYud/criIiAHeartbHZix8mLPL5xCs4=;
 b=KD8gB+40GIbH5lLTiYiFtP7CMw18Ng1FsUnDtjnf0BRPxPMm2388ONC9
 D2C5SeNmrLh1xEXL7YTF0oKyXS3IWcPeRdWA0wpYNzMIZfwIXtcTYrMo6
 QF1/b96/01joT8aCcvBEcgsKQieWdWxWSdenF9yQwtAtJ1m5dZpn675FL
 vDhKTiUcx69E6smQtrczv7sz9qGrTnNMqPgGv/AyC5XanGgP6KwS/6L2x
 uRQXhoBWG8ii9z6X/TjNLR6nzUDrmZEHoGJE5ftKY4/m1x4sJjYHJy/De
 KA1ncIOGCVY1SaXXaKPdSH4GJ4mkkELz+2ynRH1EmPXDnNp4RGOvvtmDl Q==;
X-CSE-ConnectionGUID: q0YB1KdPRvyT7mj4eT57cw==
X-CSE-MsgGUID: 6BNaG+gDQsq5yDcuUNy5Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55803625"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="55803625"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 03:02:26 -0700
X-CSE-ConnectionGUID: kEU7Qc2UQhy2B+OBbzg7Yg==
X-CSE-MsgGUID: WYwNYmZ8SGiwjo8IFGBWGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="160471379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 03:02:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 03:02:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 03:02:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 03:02:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp8KDWIBAzMrSWkPkptIHnz8FEA4t2zLZanfkgE7gilZL7xS8u6ZgUrAsBKvna5wwzsM0TDEjwePJHIfj/Cfjk/b+ibpO4lLQDOlkYyDxfRNNEblTAsHSGDOuV0ywQvrqc8WZUHNjnoB2vjE6PoB/i+B6oj3U80euhAFpJsiF+myoh55rCRK0zJi//CTuMuRwd0uonzyB6CcvBkcVnbKAiw998Dq3jeBovbXxEjHIROLKRezmRltWKIEWGQoOq2kSXirURC7Azeso1Tr7bw49GRwhLUZobAWJPTGU9GAvNyQHjY2P1+KhROvS2S1TXU1/LfJdS7WrnDEsfZDEnVV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LytHhSpiElbniw3L9m2KTpxHkxfST52+tJb34DW/EEM=;
 b=pp88ygcza1jSO9Va6DKxhFnTMAWYziYhPTDgp4LLR0/gWOm0qVCyYgpF1fBgsG+Z6fcSzQS0+NOYgU38UfLLavpcUVOw+HpOBHSpMmYIfBgb755bJIz6Uo697+nhSdrlsnlVQzFUhqWGI3lyb+DbDE5eqhRFgDPIT64uddm5o8G2BIFd8uJcBehL2RHXh/bFdKW+kl6rORyGrBQVn1Q44CEi5z+7MCGJwlIqjjgv9D8yVzRLMn81zz7V0Dyur57JwD4DUHkkR8m5mQXSEOENVPh16gJpYYBmrcyZkzMLSEQ6H8pQlpUxvGoaiylJgJpW/PSfRJoQE1Sx7eXlzka15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA1PR11MB7130.namprd11.prod.outlook.com
 (2603:10b6:806:29f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Thu, 24 Jul
 2025 10:02:20 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8943.027; Thu, 24 Jul 2025
 10:02:20 +0000
Message-ID: <0bc433c9-17c2-45f0-8b43-28f593e9f134@intel.com>
Date: Thu, 24 Jul 2025 15:32:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Danilo
 Krummrich" <dakr@redhat.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
 <DBIMILMUUV20.YED53M3X50H5@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DBIMILMUUV20.YED53M3X50H5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4962a9-8568-431a-f0f4-08ddca992d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0diSzlTV1J1Y1JhWmVYWlcyUXU3ZEJOcktLMmFScVBSZmpkUjhSTUNMV2xx?=
 =?utf-8?B?czJQZXg0dlBBNzV6cjdPdy9JYnNoejVZVzZUVEVCb0VFc3VPZ1RwSzRoNkNq?=
 =?utf-8?B?V1UwZVROTXRhQllLcitkU3ZkNlo5Qk9nWGVCa0VVUXJOMnhjd3B5OXkrS1R6?=
 =?utf-8?B?NkhqL0x5MERQSzBXcjk0Q3JpM1RBYTB3Z0xtQTJPYWNlRC9kRjAzTDRmNzFH?=
 =?utf-8?B?dFhlSEcwZWZVeHBOeTVwWUVMVWhyRCtleE5OWWsvUmttMG5XenFuRk51Qjli?=
 =?utf-8?B?cVk2aG1kbjZ5RVlVelczbXVWcnFtV1JXc1J0RjBZcWxYMDN6M1lkWU1pd2Jx?=
 =?utf-8?B?QXdzVUxPSmI5S2U0My92K0tobURSMzJNeHVzRVlWQm9NNGxnOEx6a2RYZWZU?=
 =?utf-8?B?WitmR2VCREZ4ZzF5NVFMMWJZZW94ZEppZ2V5VVAvYUlqaWRvTExUSnZzZEpB?=
 =?utf-8?B?Lzg4Q08zV211Z3kxVHI2ZHRLZ2NKZS8wa0VTNnRDNzg0YmsxdG5HSTk0SkZs?=
 =?utf-8?B?M1ZvQXQxT3ZMSTZtUURBWXc5REZ6UUNMOGVCakxxZkIySm9VYlp6cjJVb1FM?=
 =?utf-8?B?bWdYbStaUXJYUjlFTXdQNm9RN09tK0l1ZW41NjBhdTdHOVhrZ0pVWmxNODlR?=
 =?utf-8?B?a0g0aElDNXFHeTNwbVk1cWVFTzVab0ErdGgyam9QSWZSdmtDeUFhVytzaXFt?=
 =?utf-8?B?OUsvdCtYL1NCdGFwKzVraWhDclhlLzd1R2pqRFBjbTN4YnIwME9UNGlzTko4?=
 =?utf-8?B?bm0zYXBGa1d1NFRBWk03WmpxUGtyTmlDKzQ1VU1wV0ZXckwzY1d0M1lVU2Fa?=
 =?utf-8?B?VXNCS2dzYWxJQmRTbnFZUDk4RE1LSE41VmVVNUsrZGhZakRobXVyK2ZDN0FD?=
 =?utf-8?B?Wm9mTFFDdk9tSytzVnJENi9uY1lIcnFhME16Tkk4d1luV3RMaUp6cmJYSG9I?=
 =?utf-8?B?Y0x2dmt1R0Zwb2tMOHV6eGcrYWQxY2Z1RUlQVzBVZnRwSDE3TWlmc2tOL0hw?=
 =?utf-8?B?RnVkQU1qY09aelNiYVdUbVdYdm8rY2JRdCsza3FlMUJwcmFLWW92Sm92S2w1?=
 =?utf-8?B?cndUL1g2NERldnIwZzN3WkxqSk95MEpLWmdsODlUd0UzVGtaTDREYit5MEJ4?=
 =?utf-8?B?VXRLcHgzY0Rhbjlwa3NsbWpxcTRsTnRJTm80MTFNcmMrODhJSHBwbW9wamRL?=
 =?utf-8?B?NWNURHEzcWRabWZBenF0a1ppaVlxQ3ZGbHNVWk5WQ2VtWGllTWxXNzJqdGhL?=
 =?utf-8?B?ekJLUlYwazJuc25EaUhvMm8vVUd3cTFNNDJxRTlWSGg0c2JhSWNsdmVacjNq?=
 =?utf-8?B?MUhlUGJKeFFOVUh2ZWJ0MUxvQ2FaWG93RmIxSGQzZDg2MnNaOGFrVTlJTmht?=
 =?utf-8?B?UVIrMGJwb2d2R2JRbXhPcTBXem53bEUwTUxPWTZwd3pCM2xHM0taT3pudGsx?=
 =?utf-8?B?ckxwSjVzRWM1RmdlUVhDK3dsdVVlRS9OLzhKcHZwUmhidDNCWVNDTm03UWVs?=
 =?utf-8?B?cWR4LzNGRXNTSHJwWHFXNmxoaWdRTk4xRVVoR3ZUaXRHdFVJVkk3a1JNK2VR?=
 =?utf-8?B?R1Q1NWE1WFZWczdOQmVJTnZqeURoYnZHeUlKS1hTUlZUYTBMcDExYXcrVHhk?=
 =?utf-8?B?WmQwdU9WWmNnWlBlTUgrVFQ5Q2gwTTlpRUgyRlZtaUR1dmYvSUZKdE4xS0pk?=
 =?utf-8?B?M1kxeUtWUzdDYlFib2R5clN5YVpOSGtUWE9HbldkZ1U0ZUgraEljWmxmck0v?=
 =?utf-8?B?U2FYYkVTVW9YdG51bmdoR0xKRHYrdnIrOG53Tnl0U2tVbzBaOW5oQVdtOVpk?=
 =?utf-8?B?UTNHTUV6U1pNai9zcFZmTWc5TE1RVVJMQ25oMjl3ZDd3RDhFUnorMi9wQWhU?=
 =?utf-8?B?SnhEempCUkJyVkVlQUJvWlVXVVlwK0xnMWlWRE1IV1NqNTNVbzBoai85a3VY?=
 =?utf-8?Q?vDZjN6CLCjs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0VkbFkwWWwxcHYrVi95dXBKR25tZlVIT1g4TlFHSlFDVWxSb0MxNE04SW1E?=
 =?utf-8?B?V2tFSWI2UU5YM0R4S2VtVnZST2puY25tNkNkNVFkcllnVVVtWHpJMXR6aFd3?=
 =?utf-8?B?MjkzS1JiMXVpUUcrQ0RpNnpxMXdkWkxVbWNtR2hTWnRyTjFWTVhiOTFVNks2?=
 =?utf-8?B?SlJZeFZsMkV1MXNYblg2MGRjL1MyQlM1VEtLbE90UlE1WFdWWGFIanIvRFVN?=
 =?utf-8?B?NTBkVWF3bXZqbkl1TzFoYnF4SlljZU9pL0MrN2w1cStkNnB2UjdtLzFETEha?=
 =?utf-8?B?T2ZlSDdRRHpPVmo3dXI4bjlaTEJZaDI1OCt1T3dZTWl3ZmFBRFpHdDNkOXF1?=
 =?utf-8?B?eTh0SU5uWnIyY2p5czJvb1lNSkZZSXltQ3kwRTZqWTFnWmRkWmQ4U0lDTFll?=
 =?utf-8?B?UlVZTjZPUHlLYVN0L3RUZmZFemw1ajB0d3BnZHBRTHRjTDBCL3dYRThsdGx6?=
 =?utf-8?B?MEdlRk8xSU0xZGJWSjcrcUlGVm44cTZseSs3ZWExbi9ZWVNEQlNROExVZkNp?=
 =?utf-8?B?Q3NIUGFKZzJ6VEhFZm1LZkEyZGRjbGRLSTgxMFdOcFFpY25IeGY3S3dkMlV4?=
 =?utf-8?B?NVpOMTdiMmhreGJjaWxYSDJPaEE2c2tncGtTT2JPdW1wOFNpWWgrQTJUUFl6?=
 =?utf-8?B?QkMwUzVWYXRuTzc0enFVYk9NSnhaeWxVWHB3MUdZdW1wL3dlQ0xSa0xtcURL?=
 =?utf-8?B?QkFiTnc4RkZ4eDRwUk9LamRybG9pWTFhSzl4bmdEYmlzSktwTjFBSmJDeHl6?=
 =?utf-8?B?ZS9jcXRaQWZnQXhSa3VSVWY0RktPNHN6cWdnOUFtZGVmVzdHVVk0ZWRabktS?=
 =?utf-8?B?UTladUs0K1VLZlBzSU9CYmFUVmtSQU1RUTF4L0xMYVRTaCtFMU04cWpFbWFL?=
 =?utf-8?B?cnFSR3JRWlNhYU5MNzRpNVRtUXcrc2d3dW9mYUFyOFNaV3A2Ty9KS2xqMG5J?=
 =?utf-8?B?enk0aEd4R20xRzc1QUs2VzZHNlZmZkRkNzg2cHVsMzlBQ0FrTlJMdlRxaE02?=
 =?utf-8?B?QUtUeDlORzVoa2ZLOE1HZnovOHg0VG5meDB4NW1XRHJkSlRVTnAwY294NVFL?=
 =?utf-8?B?WVBwTTVHbVhudks5c0VkeVhycFBLd215ZW8yVmozYXFKNWcrcGFyVGZGc2tr?=
 =?utf-8?B?N1N4bUhNN0lvS04vVTRHc1VpQ1Mzb1ZHUXE5S0lyS2JiR1JqQlg3U3FpNGxx?=
 =?utf-8?B?TEVLNWMvaTl0bnMzcnNnY2tTcmZrU1ArMlU4QTFhY05SQ2NVTHdPNVpadGNU?=
 =?utf-8?B?aXd6bkxHLzhDQ0pua3o2TmZ4WnQ0STk0NHVVK0N1c3hRUDJtdk8yeEhTQjZ2?=
 =?utf-8?B?MVA1VjNSaTVoVjlGeUJSS2FsQWMrSE9SUUNHSE5telo3M1Nac1NvMGc0ekxG?=
 =?utf-8?B?S01ObmtKWU00dE9GZHBkRThWT21zMEp6QVJEVjlLSmM2MjBGSzdyZU5sWnpP?=
 =?utf-8?B?YlRKd2xmbTJnVzBUNXFPRFd3WThRV1hFNWdsblFYTklaNllRcmZwQThuRCto?=
 =?utf-8?B?TktLcWVwTnpoZjE2ZUpaa1NVQ3VMSXQ0MTVBWmlHS1ZabDZHQlYwbTBReFQ5?=
 =?utf-8?B?VHNwclZYdDVBaGgyUUJTazdwT0RUcC9mWGdRYlVwa3BiSVl3dTU2T0RmZjZx?=
 =?utf-8?B?R0w4SFlNS0JwTHlqNFVMWXZLVHpwSlZCU0l2Ky9EaTEzb3hRS2ROU2xKMnox?=
 =?utf-8?B?N3BoUVpYd05kVmdjWDFPQ1hSYlFtY2JzUnZnUTRnRVM0U1BpZ1lzV1g3cldn?=
 =?utf-8?B?SGRDVnBzRnlTSkdkUUU2YzhjdGhqMEUvR1BhZmhhdW9lZWx2TTRkcUh2aU83?=
 =?utf-8?B?aVdvQlY0ZTFMRWU0eVZxQ0xNTVB0eE80ZjFveUVNc3A1dmIxZ21RRHIyR1Na?=
 =?utf-8?B?Y2dHYUVLVFBDSWpXMm1DTTJlLzFPdTlCUlhrYVFZbUNBMnhFTHQzeENMdWlJ?=
 =?utf-8?B?T0tMRlUrb0VBN25CTThQYS9ubnFOcWRid2wwQkcrRkcyMjI3Ynl1Zm9TL3pi?=
 =?utf-8?B?RGQyY0VDQTExS0NpYUNNc0k2MjViU3NsNGNEVkFkS1h0eDc5dzJ5VmdRa05E?=
 =?utf-8?B?TGg4RVRDTGxLeVhvQm1QZnB2dVgzbVB1T0xZQWw2QmZmSzBnYWRpRjdFdzVS?=
 =?utf-8?B?NlkrM3JxSGduUUJzU05ISkpjcHlSK0UyOGwxNUoyTXVHMmlwTXhxWkUraXd2?=
 =?utf-8?Q?jGrRKlq1LFEd4EsPcfEmZMM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4962a9-8568-431a-f0f4-08ddca992d74
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 10:02:20.1971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n97CIAiKXR/p7q59h5kub6OnyXb+TCT8jOiwQNPuk40WJekD3Cdm4BFPQX+mQZelp30rgH1ydS4LW51FAPR+/XHDkXUDbsWMwislmFzCiWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
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



On 22-07-2025 19:08, Danilo Krummrich wrote:
> (Cc: Caterina)
> 
> On Tue Jul 22, 2025 at 3:35 PM CEST, Himal Prasad Ghimiray wrote:
>> - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
>>    range.
>>
>> - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>>    drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>> user-provided range and split the existing non-GEM object VMA if the
>> start or end of the input range lies within it. The operations can
>> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
>> used by the Xe driver to assign attributes to GPUVMA's within the
>> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
>> the operation with this flag will never have UNMAPs and
>> merges, and can be without any final operations.
>>
>> v2
>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>    ops_create (Danilo)
>> - Add doc (Danilo)
>>
>> v3
>> - Fix doc
>> - Fix unmapping check
>>
>> v4
>> - Fix mapping for non madvise ops
>>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c             |  1 +
> 
> What about the other drivers using GPUVM, aren't they affected by the changes?

Apart from xe, nouveau_uvmm.c is the only user of 
drm_gpuvm_sm_map_ops_create api and patch takes care for nouveau_uvmm.c


> 
>>   include/drm/drm_gpuvm.h                | 25 ++++++-
>>   4 files changed, 98 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index e89b932e987c..c7779588ea38 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -2103,10 +2103,13 @@ static int
>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>>   		   u64 req_addr, u64 req_range,
>> +		   enum drm_gpuvm_sm_map_ops_flags flags,
> 
> Please coordinate with Boris and Caterina here. They're adding a new request
> structure, struct drm_gpuvm_map_req.
> 
> I think we can define it as
> 
> 	struct drm_gpuvm_map_req {
> 		struct drm_gpuva_op_map map;
> 		struct drm_gpuvm_sm_map_ops_flags flags;
> 	}
> 
> eventually.

Sure will check this.

> 
> Please also coordinate on the changes in __drm_gpuvm_sm_map() below regarding
> Caterina's series [1], it looks like they're conflicting.

Will give it a look

> 
> [1] https://lore.kernel.org/all/20250707170442.1437009-1-caterina.shablia@collabora.com/
> 
>> +/**
>> + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
>> + */
>> +enum drm_gpuvm_sm_map_ops_flags {
>> +	/**
>> +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
>> +	 */
>> +	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
> 
> Why would we name this "NOT_MADVISE"? What if we add more flags for other
> purposes?

How about something like DRM_GPUVM_SM_MAP_DEFAULT ?

> 
>> +	/**
>> +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>> +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>> +	 * user-provided range and split the existing non-GEM object VMA if the
>> +	 * start or end of the input range lies within it. The operations can
>> +	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
>> +	 * in default mode, the operation with this flag will never have UNMAPs and
>> +	 * merges, and can be without any final operations.
>> +	 */
>> +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
>> +};

