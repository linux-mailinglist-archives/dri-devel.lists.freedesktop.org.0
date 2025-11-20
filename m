Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252B4C76364
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 21:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B4210E7C9;
	Thu, 20 Nov 2025 20:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJZqB+Tn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA1710E7C9;
 Thu, 20 Nov 2025 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763670810; x=1795206810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W/1JuFjxXb4QGX10YNw7WSVXcuSwxtSDGQa4d52wnmk=;
 b=QJZqB+TnITcMpj0gXLC3J2BAdEMD7VTTOPxOKJZOn39pcrOLlYgokYhN
 4aqEAZuOS2bR46AFrblnICda+v4P57kIHIVjXfpx3biyNM0AbSdU29Jjf
 M+hYC4y0+GShdF95yktv5OBZGiI5xUIBhbROOoAqehmQ6CSt1UaNK2v+l
 tWIFJNzZAjo3UaQxb9yBA4PtdSioJAh11zHJcZ0zZ0rUnhaX0eIhMu5jt
 cQR6wSjw+1RGnOyvvRd9W0KwD35mGc2pjXhmk8eGMdV5L7ixWIKaCdNIL
 8KL3T4aOz61PeEEhr6sUq9vowFAzn/56YxMTkkaMFTgjpJ68fBcN6ecxA Q==;
X-CSE-ConnectionGUID: zz692QmdQ4WEGp0MxK/QEg==
X-CSE-MsgGUID: 8qPxgx/wSvarqnHZrM3iUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65703305"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65703305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 12:33:29 -0800
X-CSE-ConnectionGUID: OoAZJfESQ5e3WpZar8Ma0A==
X-CSE-MsgGUID: ZfyPgJJeROSR6Vda2Q2RzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="228775914"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 12:33:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 12:33:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 12:33:28 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 12:33:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIHzX11QURXW8ku9ahZKWxrCiYt/A3lMRKG4LWbE9IMZV+UthnIibHLchY/KMh8dR002Sz+mHD037dgaLoOU/B8S77X22XMQDn01RSGD9qXyEeELUy5rZGe5gu1eyPsXRasKLAo8PyQeWaY45xKMh1CjKbRQO0iKxXTv1U5qcPoP5FY2x60hcSRXhp/WgHjH6W8jVWiNAfEeWQjlCsvVsQU+7/YuLvfr9EMREs/p4BhjL2YiKxXiKOS3Y3qLbYb52JUy2MfbSSieF3pb+++pbwG/jZtAtWaKDghuFaaVKCPM/+XLXQidzsdHFzLpS1x2DuR1DOPweqxS0a2UjKHlbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECemzw3us8oi56z6ehdJN77XpPH+P19jvMbqLgg1BC0=;
 b=fRw/h7kbkc/m6ZIFjGeDRyXqjklmWEV+qmjsBVuQm40gZMAcl13IscTB9Lyw4x4OEmPdRTosuaWtw6lGO8riyHrFf2OqgUqxwcejptdARQ5Kqns3MQYn0LUFFYdRyzjdTJWrytLJAH1WN5Cgw8r2/F6Owx0DLys0wG6NUUwYvMPI8Z4lqlk1/0rEz4s848lOTC52yrmr5JLMNMxb9XOnY71SERi8ZElBReSYk9c1mb0NzLqZCqbes4yF47ivvHMJt91RJuwhtqLGWO03YBsq2/3TCFA8R14+QAd3ckvv3JH0fGni4yPwpEUYQXqAps8YZoeaIAUVvvx9Oxev34IGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.11; Thu, 20 Nov 2025 20:33:19 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 20:33:19 +0000
Date: Thu, 20 Nov 2025 12:33:12 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <niranjana.vishwanathapura@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <aR97CAIbMmgLQ0eJ@soc-5CG1426VCC.clients.intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119224106.3733883-9-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 597efa2a-cfa8-401f-62ad-08de28740a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFFrVmVPZzU1ZUh5UjVPcnZUcmpQWGZaU1Q1UU55Vy9ZZ25XOXhsakg5NGN1?=
 =?utf-8?B?MFJNMEpEN1YyUnBhWGh3VG9jNThadEVkaUVYcThoNzU5dEwyaGpEaVlKUGtl?=
 =?utf-8?B?SXVVN01tYXN0a0E4cjRBNE1jWWNxSkZwaVFDYnRYNlFiS2Njb2pVcmVFeDFu?=
 =?utf-8?B?SlhZQ1F0NWt3VnFlS2ZhcjNmOURNTFBCcGkwQWYxdlVWVEdzYkZHRnNZZXpY?=
 =?utf-8?B?Q0RpclBlMEV3VC9FcnlpNUxEMC9QRlFKN1JXb1IzVDhUQWNQWFdSdEFQbG9D?=
 =?utf-8?B?TFZDWWttdmxyZ0hoWXUxaEVBaExtcU02Q1RJUDk0djBXTVpNV002TDdkSDZ1?=
 =?utf-8?B?YlYzM056ZXY0RU1LTlRxZUoxN1AxVGJJYjM3NWhlWStGbWppaVN1WG9ZMFFu?=
 =?utf-8?B?MFhSY2xUNnM0Vlc0bXpGOHhWV21RNXdDQWRYcitNQVVXTEh2NCtBR3EwOW5B?=
 =?utf-8?B?eFpFRWNSQXlZc1hVZ1M2OFpJNmdNV0Zid1Q4bTh3eDVRNllRdm5hSEpyMnVw?=
 =?utf-8?B?cVYvRmR4ZGdJZGg0akJiMExuS25KbXFobGt4TFJjanVvd2RISW1DRG1LUElK?=
 =?utf-8?B?bzB0ZjNsNzRmZ3g2ZUVyZlpoNmtTT1c5UEh5ZzF2N21qU3hwcURiYXZpZHh2?=
 =?utf-8?B?UmllMkhOZkRHN3kzOS9TNENTNG5SNkw0ZDU5OWR1N2N0YldyUmxPdnRpd3Zo?=
 =?utf-8?B?UjBQK01abDJjdHVRY3J2bC9LUlVNRmN3b2RBMkFiQXVYUzVyUUpEK21JU0JQ?=
 =?utf-8?B?dUhFQUZzaGozenZhYjlEcFNYU1dOTVJKRlgzeUZOOHYxT29pamNpMWNBa0N3?=
 =?utf-8?B?M0pScFpySmtDS3RSTGVQY3ZTZGw2S09vQmlHQlR6OVB3Tkg2b0JOSTVONVZz?=
 =?utf-8?B?SnBPNkp0VlhYT294QnZQSVF6ZElBUFZUSWJMS0grNDFWWEtpMmN2a05Ramxk?=
 =?utf-8?B?bG5HbG54OVJlcUViY1cxejNiV2Nhbll5dllzaUlGSWFMb01HR2dTS1UxM2hC?=
 =?utf-8?B?YzF1OFp4bERzRHltZDl5QWIxamVOU2x0MnpUY2M0dXhMZkNkRDlNNHRHZ21m?=
 =?utf-8?B?b1JFMmhsbkt3bDV4QTU0ZEN0NmdWbnNwVHY3WExZdDNkSXpETEZuaGdEancz?=
 =?utf-8?B?clR2azhrRFNqRmFISjRQNkxSNStrcjErVTh0bDJNRmJuNk9IRUhSK1pvNkdT?=
 =?utf-8?B?TXA2b0xRMGZVYWFZeDNBNWRsMWQ2UUFKSCtwbm95bnFXWlhsalpEa29qWStH?=
 =?utf-8?B?VFdKUXlveUQzVzhRdFZabGZVb3EveUVRUVFINlYzMVF0Yzkzby96eE03ZnlN?=
 =?utf-8?B?RFhBS2dWUHhvZS9iYXNLWWpMWFcvTytzMnMwQktSaDJzMDdNM29BWW9SbUxj?=
 =?utf-8?B?Ynd3RURDaVpOTXZNdGdWdXM0ZXZQWVpWNE1hd2JBSVRIS3VQeWk3WFgwdTIy?=
 =?utf-8?B?d3VhSnA4alc2bVI4eGZPQ3JZUXJ0ZlRLRzFvR0ZSUy90T1N1MHhTK2RBR2Fr?=
 =?utf-8?B?ZnBDa1p3RXpSNS9mTFROWlQ4aHdhQkl3OU9HYkYvYnZmMVRSUGlQSC9KQ1dq?=
 =?utf-8?B?V2xyQTBsSlJuMFQ4ZTdjV1B3VDFKeTZtMGdSUmNwYzJ0WkRXQ3pQV2Z5UzdU?=
 =?utf-8?B?SDlvYXhnQ3A3S3FSZ24vdHl2RjRDaHZkWUtNeG1xL1FxT1FkekRFODg1Njkx?=
 =?utf-8?B?K2lybGtNQzdkcERjQnZ2aUZvQWhnMzBPbUVMdXozNm0wR0k0QkR1WXlhTkk2?=
 =?utf-8?B?YVZtOWMwN1VrOWg1cERkOXhsaGlzcmI2WkpRM2FaMWU0c3llelFtMWJLcnIy?=
 =?utf-8?B?L0h2Z1ZNS3FWZlJxRVZNenh2end4UlZMZEVRaGhjc3hHalRYcm1wYm42bTl1?=
 =?utf-8?B?UUNKQU4rdEorRmQ2dFN4em50YjBKRzMrMHZnVm1EQWl1TUNZcll5eGNtVHBu?=
 =?utf-8?Q?FmnydOdkqYgt+nEhjCdCudlM5Gxv2FRJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2JnYlV0VWZ0M2piaWJQeGQxWFZpdmhoelAwMlBCMHlSMnZ4MlBTdXdQUkZo?=
 =?utf-8?B?Um9PRnZINjE5cW5tMVBLTjVoUy80RlVyck9HNEwzQ0lyMEpHbnVVdWtmaFFs?=
 =?utf-8?B?Rm5ENUJZUDFMWUt0RTBTYzJERkJIMVo3QTJoUG1uRHlGSE5YbE5yc1dZcEVu?=
 =?utf-8?B?ZHFLRlRROHZueng5NFM2Qk9uRVZIOGE0TFltUkxuSm40STFHaVV0SzA0MDBG?=
 =?utf-8?B?c2ZEL1BoMDVQd0QwNThSVnliaWNXVk95SElzcUdIK2ZvdnBKYUpzTGFEMWhK?=
 =?utf-8?B?NGlXdVZaMElnb2FZTHQyWk56MTVjTkFjMzkvTHMvMVVxditDT0hZSjFSZFNu?=
 =?utf-8?B?N2ZaV2RLSTFnd2grMjBCcnptRGRGMFFxb1dsUVQ4c011MGU1SVFSVW9uNlVr?=
 =?utf-8?B?QSthcm01aVhxL3lhdGVtbE11TmRSNTVzajhhdndHSWEyN2dLV2lncjU2WWox?=
 =?utf-8?B?djExbUZQMkhQTmZzQlpTNDR1NXE4RWNicWZWUkRCZnlDbkhRZVlrSi9DeUVt?=
 =?utf-8?B?dVNJbk93QkM2MFR5S3VvUHcyakhQWHdNd2hGd0pJcm1XaDgwOEFVa2RMTzN5?=
 =?utf-8?B?NGppc1RSMDl2UEdibi9icmVsWWRxUjFaajY2dXhjaXFxRTNreFZ6dHZOLzJT?=
 =?utf-8?B?ZWZYNDRnVldDRnUvKzNSNW1aTFIxTlgrR2xEdksrdmZhUi9kOVpFVjBJbmZs?=
 =?utf-8?B?cDU3aTBkWlg4cC8zODZPemQvdTNMNm1WSWRxMTVEd08yT3huenhHWGJTKzlr?=
 =?utf-8?B?M1hyNWs1bUEwVWkrTUhUT1JwNkZGWHlYWDlHbjFNQ095M284Q0ZhVytSbnpr?=
 =?utf-8?B?Q3A4OU9rT3VXcVhtQ3p2L3NPT1VSamNuME83amRqUVNHUExjdHFwaDNKa3hG?=
 =?utf-8?B?WGdqTDNiano1bW16NTBEb20ydFRmMFVxNDQ4R2lPMjBUbXBCT0hSZzBjVTd5?=
 =?utf-8?B?Z2dqM1RlWkpHU0ZUV0pvWGxIOEhOSGFnOFkwT2hNdExGUkNUOGpxcEk1ZUVq?=
 =?utf-8?B?ZVJSSllEV1J2S3VLTjBWMjJKOERzT3g2VXA0ckxBU2lSMFF0STRjYmU0Um14?=
 =?utf-8?B?RytzSjZFUFM4RTFIMFR5ZWhVY3Vjdm12S1MreW1xY0V0M3dUZ3I1d3ROM2Q4?=
 =?utf-8?B?dVRCYmhmL0dCWTh1TnpMTVhNVlRIYlBoQ0o0TTFLcDNEZ1p5TFNlN0hFcld6?=
 =?utf-8?B?MjducUFIU2NRbjd3WVVzTFNaejdyQ05GdnJXV0ZjQUhRWWk0WkNRSEs4L2ls?=
 =?utf-8?B?NG9hWXNna0ptMnA2L2w2Q3hXb0dWRUxER3dzM3ZGUi9yS3JSbE5vKzg0Zjl3?=
 =?utf-8?B?SmRtdjgyaDI0TS9nUVVrZkxoMzJDNlFnL3BBY3BWVEtsdVVoV293aXhLMDNy?=
 =?utf-8?B?Zm5ETWlqelZIZ09mRmhzVVVnTjlHbEJXeExSQzRGSjF4ZG11MEY4SURUT2k4?=
 =?utf-8?B?dnFITVVCMDZaZGkzZ24xMkM1a093MXhDZmdxMTk0bUJFczNtRWRJL1VMcVNQ?=
 =?utf-8?B?Zm1meEhtd3MwamhOTlBoWWNoNE1Ca09zaUx1OVdPczdWVnlrWWtLZ1ovK2JW?=
 =?utf-8?B?a3c0NDZ6bFhKemxaUnBPUE9FNDByS1VDRHkwWnRISmljSlV0aDhxNGlkMzZK?=
 =?utf-8?B?WWM0ODZ3NEs4dWZYZjJpRXJRV1hpU3gyQ3NuZkN2NWJHWGRic0hUUlNDL1Na?=
 =?utf-8?B?Y0VNK1VRYTAreWZPZFJOSkFWR1pKZkhWZUhxVFovay9xQ0dpblVZdWRSWXYv?=
 =?utf-8?B?UXpUWjc4VkUzVUtWVVZjZ1NsSTJ3UVh3YW1vYmVpQXBicC9QeXU1Z3lpeXFG?=
 =?utf-8?B?RERIQTY1ZzBvWG9pUlZ0R3phMWVyNEIxd3BuVHc2a0lTK1lPRUFxZVc2WFMz?=
 =?utf-8?B?QjEzc1pNeEE1bUZBand6R0oxbXBSSkZ5aWE3aXZWZ29JeDExazJkVGZOTmla?=
 =?utf-8?B?dDFKb25laTNDa1dPc0NyUGhCby9pUkNIWWg0dUxXS2cxaTZodlVEQkp1OFNO?=
 =?utf-8?B?RDh5cTkyblNZcmg5aUc1bmF5d2syT1FmWU1CUFBIWndaNTdONFcrMXpMWE9T?=
 =?utf-8?B?UCtDZFkvbFZMVlVnUXVLeWdoWW8yYXlORThuc1REK3dpMjMxb1hnQlczMXhy?=
 =?utf-8?B?WWh3bmdDSEx0bUp0NEJFU09Bak93U1FaTTBKTWJzZW9mdTJyYXlvaGNKUVlU?=
 =?utf-8?Q?vr6FhdeVq6vCoeKTwEBukRQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 597efa2a-cfa8-401f-62ad-08de28740a94
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 20:33:19.4126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoYu90ngeVS7FC03U5KSf5hrV5ZTePqo0ieDrQOUrZ5SZHyF9jYuU/pTIK1TQWLtb0G/ox/eiwTmxnQpJZ6VZZaArFt3pkNVxkzrOnHkmEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
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

On Wed, Nov 19, 2025 at 02:41:06PM -0800, Matthew Brost wrote:
>We now have proper infrastructure to accurately check the LRC timestamp
>without toggling the scheduling state for non-VFs. For VFs, it is still
>possible to get an inaccurate view if the context is on hardware. We
>guard against free-running contexts on VFs by banning jobs whose
>timestamps are not moving. In addition, VFs have a timeslice quantum
>that naturally triggers context switches when more than one VF is
>running, thus updating the LRC timestamp.
>
>For multi-queue, it is desirable to avoid scheduling toggling in the TDR
>because this scheduling state is shared among many queues. Furthermore,
>this change simplifies the GuC state machine. The trade-off for VF cases
>seems worthwhile.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c      | 100 ++++++------------------
> drivers/gpu/drm/xe/xe_sched_job.c       |   1 +
> drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
> 3 files changed, 28 insertions(+), 75 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 1f2afad1766e..7404716e979f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>-#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
>

... snip ...

> static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue 
> *q)
> {
> 	return (atomic_read(&q->guc->state) &
>@@ -996,7 +964,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> 	u32 ctx_timestamp, ctx_job_timestamp;
> 	u32 timeout_ms = q->sched_props.job_timeout_ms;
> 	u32 diff;
>-	u64 running_time_ms;
>+	u64 running_time_ms, old_timestamp;
>
> 	if (!xe_sched_job_started(job)) {
> 		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
>@@ -1006,7 +974,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> 		return xe_sched_invalidate_job(job, 2);
> 	}
>
>-	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
>+	ctx_timestamp = lower_32_bits(xe_lrc_update_timestamp(q->lrc[0],
>+							      &old_timestamp));

Reg: xe_lrc_update_timestamp()

The way context utilization is using this helper is to accumulate the 
'new - old' values each time this function is called. In the below 
example, context utilization will loose some ticks.

Example:

1. This code calls xe_lrc_update_timestamp() to sample the timestamp for 
TDR purposes. Say context/job is running, then the lrc->ctx_timestamp is 
updated (moved forward).

2. The context utilization code calls xe_lrc_update_timestamp(). Within 
this helper
- old_ts is sampled as lrc->ctx_timestamp
- new_ts is calculated based on whether the job/context is active
- lrc->ctx_timestamp is updated to the new value.

The result is that we lost one chunk of utilization because of the 
previous call from the TDR path. I think some refactor would be needed 
to fix that.

The other comment you already mentioned offline is locking, which I 
think we should add to protect lrc->ctx_timestamp. I don't know if a 
refactor will avoid the lock though.

Thanks,
Umesh

>+	if (ctx_timestamp == job->sample_timestamp) {
>+		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
>+			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>+			   q->guc->id);
>+
>+		return xe_sched_invalidate_job(job, 2);
>+	}
>+
>+	job->sample_timestamp = ctx_timestamp;
> 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>
> 	/*
>@@ -1135,16 +1113,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	}
>


... snip ...

>diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h 
>b/drivers/gpu/drm/xe/xe_sched_job_types.h
>index d26612abb4ca..ad5eee8a8cdb 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
>+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
>@@ -59,6 +59,8 @@ struct xe_sched_job {
> 	u32 lrc_seqno;
> 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
> 	u32 migrate_flush_flags;
>+	/** @sample_timestamp: Sampling of job timestamp in TDR */
>+	u64 sample_timestamp;
> 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
> 	bool ring_ops_flush_tlb;
> 	/** @ggtt: mapped in ggtt. */
>-- 
>2.34.1
>
