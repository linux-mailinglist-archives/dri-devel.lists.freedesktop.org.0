Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263CB9A9817
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB0410E5D8;
	Tue, 22 Oct 2024 05:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcBoXQrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C2D10E2E9;
 Tue, 22 Oct 2024 05:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729573574; x=1761109574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QPKflc6ooSJn/0vZ26oes4UADCkBSBpfNcHi7KR7/8c=;
 b=dcBoXQrPt9i6z8fEI3zZu/HXWZ0q2CKfBZgIzTqxvXUTcbgyn5HhmuDu
 0aEESqhsN1xPfl7PggtZAisjSDKFC9jluZdVkmDMNytbXmUk0wiyC7CzP
 Ha+HeBFxIytqZV/bhX67R/v4Vw7BGnmA9eq6uTMwapYwPAgUq2Gp440as
 PRj4ctR+eyGq9/JIxZ3tvBIYh4UnJd5onP5DwdfWZVhTNVbc1VvtcyNxX
 3kAv+8UzMcg6/UwotaGJkhFtFZYpa/cHsjMQxatA4EP9WV7h0C98r/6B7
 uyyDHqYvpJK8vBWbwlXZWyzSDcfLdEH+nnXq9JUZgFedXx7JyLGUrBxwD A==;
X-CSE-ConnectionGUID: tmoMiyQMQyWPjyiHoFWV4g==
X-CSE-MsgGUID: 2S2lqJHCSc2akC21MFhAEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28519369"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="28519369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 22:06:14 -0700
X-CSE-ConnectionGUID: 1XXGsPUuQhGE7kO6EmIvxg==
X-CSE-MsgGUID: OiQvCCxwRBCqcI8u8YCifA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79663252"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 22:06:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 22:06:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 22:06:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 22:06:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G95rsiWMM+3lkjME5/M2XlRIAQnkx0zH9Tvw9zE1w+dj9eKcOFePz5dKaeazSY3j6wd1qC5NbaLe+Tx3fzyjbQQdv+JN+YIWHdODOjq5l9RGEjCg0Dlzc6MrZnPtTUjKlhKuM2Tdv1LDMf6ID565srlyIpH20MFFs99ub3PtLPqGxbQ67Qazj1WR6ubnMsVhb5eI3Drz0p7axq8QmLny2oSf2OumZHdqBjrP+XvTAXyX4XsNQsnlSRU824NNutCj0K8N1tvo32vDCuV57hCas7Rh3k/1v+gVviT/uYUfFnupyN1vecsdyBWtdNG5Q6Jf+CE6HtE9UaY54Lx1pBo+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbyrMJ6iy3izITbs2XqVA1kuS7XhpIjtrf/gWC0fetU=;
 b=BngT/mElL3U9IRrSETdKQVXCOsEFRWz13B4FtpjjRIkm2iwlsGJWYeOG7vmNIDHQgLdKfCLtAfI7slu3xown8dCUIBbDOmjP4kJg5ifaTXIHNRtcc3CewX1DoA/bFxiPhJG63rzIFS5QGHnrdH4fFNFzqlFQJlGwjlAX4UHLE6yAFN3/9oCEKzYZsiHnGjU0WQVeplwD1ESB5NWjlvuCmVKY8PJwSDfK+sixAMMvawUwXVv9oqainPk/6WASnf7/HAMiet0pb5TLHbiomnxhvLykFl0fW6hls0GV1fpxjtDIXpLuEvUqtRxnsQ+SN2WInhlf0I1DvCU6Ek9K4VQInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 05:06:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 05:06:10 +0000
Message-ID: <f142393f-8610-405c-b00e-807548fc41ee@intel.com>
Date: Tue, 22 Oct 2024 10:36:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241021175705.1584521-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d6ad7e-bdeb-49e0-7227-08dcf2573e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHRURVNOT0JWZlMyam9tbDQ3SlFvZDJBM0VaSWV6dVZ2QnRzV1hZOEdOeTkr?=
 =?utf-8?B?czBFSHBWdVNOSmV6QW8xRXVXK3lwRzd1Q0ZsOHlyTkZmYm8remZQZGlBdkhj?=
 =?utf-8?B?L2pSaXZGaHFmY3hWdGpCRWFTeDZZSXJiVzBuQ3VRN1ZjR2ZYem5STWU5dmxx?=
 =?utf-8?B?RE56aEczTnd2Sk00OUtBV1JCYk1pVEJpcVdvVVFSUm5zWWV3OUc4MXZENng0?=
 =?utf-8?B?cG5Uam9VTEdHMkpWaHg1MFBwNGk3UVZBZ2VFVWc2Z3FKYnZxazBSd3U5SzlK?=
 =?utf-8?B?Y29tNUZwM1V6eW9tWEo4S01ySXYvbDFIM2pGVkNNSk1SUUN5dGVVdHNCYUkz?=
 =?utf-8?B?SkRFTHVhWVo3aSs4REoyZ1VMYUh4cFNRRFdSbXdmYkh4VkVmRnFzZUlXaEVF?=
 =?utf-8?B?MzBqNTZXbEpYa25xRjhjZ1MyeHcrTzRRN2Q5Z0lwSTlPN3FabmxBR1o4M0RP?=
 =?utf-8?B?dXA2OFAvMDV4M2I0bHRKcnpSdTVlM21BL21HNGY1a2NTNHdlckN2L05ybmRD?=
 =?utf-8?B?OVdyK2lXRlpaVnNQNVhQSkE0MUN1anZEQmRFcVc2VWxMZml4dG00OWZ3ZVdj?=
 =?utf-8?B?SjVUMXlPbFkxcitKcE8zN2VONS9PaStwUTNqalRKV3hlQnNZQmovalFrT2hm?=
 =?utf-8?B?cUYza1BMckdyYTVhd2VxVHB2cDh2NmlNWUxKOER0L0NVL2JOMC9qZVlPakRu?=
 =?utf-8?B?Sk5EZlcwOU95ZS92VmhST1RoT3hReU16VFNGbjVlOGJaWTBFWmxNUmlhbjNH?=
 =?utf-8?B?MFM5R1plKytjbWlsSUdEbFVTam5JUFJTTzBUZWdaOUtFZ2U3VFppLzN4QmRz?=
 =?utf-8?B?dGhlOU9GWkN4aUpWM2I1ZWMycHMvOU9SdUtDdjBzcXVERjdiVE1vOU5VU1dR?=
 =?utf-8?B?S1VZWjVrYzBFaHJFc1Bsci9KSjdqZmFXYVFYaGdTK3RrdWhVWU9Wa2ttaUky?=
 =?utf-8?B?d1VtVG9iR3JEazVyMXpuMzFsOEprVUt1MUFPSXpJdjRIYjd3SWRSS0VZbGxx?=
 =?utf-8?B?QVN5Wm82eTAxOVF2SE9FTGNZV2ZBdDZpdWYyblJJK3NicEJ2TDV2MEMxakFm?=
 =?utf-8?B?UzdhcldvZENMcHFodmtNZFRDY3pjOGc1VXdvd1JMb245QjZDaVl2YnBmek1O?=
 =?utf-8?B?U2JSZ0pNN09PMkliUmZaSitjWlhYS2o0cHdNditpRjRFWXhDOU52TmFTZFVi?=
 =?utf-8?B?ejVKUklud1krbVo2Vmgra2hjZmRuQk5pdVhySUpEcGpKeHhGT1FqN0p4cHZ6?=
 =?utf-8?B?aTJIUTdlSE5pVGlBMkJ4Zlh3OHpVaHg4T3dSZVFBVUcvdGR3Ny9qWUdKcm95?=
 =?utf-8?B?eUFuOWt5cFVrM3BjQ1A1S09OemlRc1A3SWZSdnplNENaVVIvcWNKQ2RpNm9p?=
 =?utf-8?B?RWo2MDRCL1BsUXdKQjVsSkVwVEdMVG1HSzRZTlVzVHNQNWhjRTh3ZG1SK0lO?=
 =?utf-8?B?Ujg1MUdOQmdLNUZ3ZDd6K3JudVZjN1M0WEZ3MitOcXI4ejBiQzhvTVJCbDNB?=
 =?utf-8?B?amJXL1oxRU1Jb2Jtb2E5ci9ucUQrc1BmN1dUdXRxaFVzMTg1VGprdkVzRi85?=
 =?utf-8?B?VDJndHFXK2owWDFFaVR1d05rS3g1cFE1WXhsYUtTRlBhVFhmN3pSOUpKa2JC?=
 =?utf-8?B?M082WTFrZkFRUDhHZExaTWNZYkVtWUt3MmwrNmdCUGZ6MldvZVlDQkpmV0xz?=
 =?utf-8?B?K1hudXdYQXlOVXF0bW82dExxMGVZRm90eG0rTlQrdnJrNHA1MjlBVmNKeGVs?=
 =?utf-8?Q?EbPpIvX68RH+Jm6mNpnZLl+H5+Il+YpFdfHe8/x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3BUdkF2OUpuOE5LeDVwcmlNOUFFeFpJdG4xVUI0SGgwMkQxVWNQa1dhVXdC?=
 =?utf-8?B?dXJzUGdKbWdMUG94NEQySE53WnpIaHNsNkxkUExxZFFGWG1PTDUwWVk3YWJK?=
 =?utf-8?B?cFh2T3RiS2tDeno5WnNZUklSVlZ1Rnh1WlpsZHovNkVLajJaYnE0R2FXNkRM?=
 =?utf-8?B?RElGREEzU0J2N3pwOEdtZkEyVkIyL1Rsb0diSG1JQmVTOXpuT0hxa0QvYldQ?=
 =?utf-8?B?V1BIT2gwM3JTQmdtZkJxdG43RW80ejRQSElDVGU0d25GZE91MFNncnFpSlhT?=
 =?utf-8?B?QmZ1OVVVZjZrL24zZkZxU2RBRDFxN3kyM29UZi8ydjBaUVFENngyc3BuTlY2?=
 =?utf-8?B?YUhVbHkvNGNuQWVubUpSY016Z0E1cjNNT3N2cG84SE1yeG5VTWFKZlNQZTBN?=
 =?utf-8?B?bUFLQ3plSTg5dENpRmpWQW8rVm8waXRSeXFrOFVKNFpCTUFuNlFXZGpzZE1Z?=
 =?utf-8?B?VnhqQ2piT2ZyOWZxTlI2ZTFhTm1ZVGN4OG53bmQ2cjZxbG15U0NKZU40bzF6?=
 =?utf-8?B?OWNmL083bndUNnJVajFYNGJIb0IxRFNVSWh2VDFIY2MxVG81ZzhIbW9uZmZO?=
 =?utf-8?B?VTBKWGZsZXhvV3FveTN1RnUxcXBrank4d2xKcVNRTTc2TUNzY0VvT1Z1RkNE?=
 =?utf-8?B?S2RCaEk1eU40bUN0dytUSGR0VFJyTlFVeElSNjlGRTlkSVBraVZnNmtOdU9C?=
 =?utf-8?B?UGhOZlB1UHdON2RFWGh1MitBMHlYSlAvOWlBZ3ZISGJwNUVTblBUNXk4amNr?=
 =?utf-8?B?NDkrRDlZMmlHV0lETUtSRWF6MnZsNVJleGl6aC9WNDVXdC85aFlEbU84OWNX?=
 =?utf-8?B?SlJwMDV0aXd5WUhJY2NuWG5mamk4MzhQVzNOK1NlL1Voc21hU0hsWm5oMzBD?=
 =?utf-8?B?ejdMV2VuSDN5dk0ySklRSTJEY1k1aitieks4L1g4SVBKT3N6aHBuYmpHUVpj?=
 =?utf-8?B?eXZWMGZOZEMzcFl3MXUzKzAyQ0hEUGZtNFZ0ZEIyMEpFLzU0bklaZWRKbkJ1?=
 =?utf-8?B?L3lpeVcxRDZwUDRTblVzeGNZVHRFZFRMcGRvL3hWd2VCRXUwRHhXMlZaZU5a?=
 =?utf-8?B?cmpVRmErcVNtOHFhZUp1OUFqWGI4Mk11STN2eW40cTRaQmdHZUhicmpka00z?=
 =?utf-8?B?d3QydnpwTitmUlZPaytNdUdaL3o5WGVqSElQekVCaGRHUDZFVGpjU3VwODdP?=
 =?utf-8?B?RFBSbk8xNmxZRGdVZUptV2pzcEtNSUxIUnZlc0g4UlJZaVh2UWFQZHhvOE1R?=
 =?utf-8?B?cU1qNzJwcFRYMXVVSTNlWmhGN25EYzRmYUpiY1l2dTFGRy90djl0QkxRTVE0?=
 =?utf-8?B?TVBoMW84RzlDT2Z0eEFTZHg5aTAySTZHM0F5UDRJeFRZT3ZXNlNwdFliWUFy?=
 =?utf-8?B?Snl6YTQxNFJjQXNaSTdMd0ZrUHJoUURscVVqZHl3blVDNGUyc0EzQ05TODRs?=
 =?utf-8?B?SWJkSVlRV0Z2c3RVc092SVAxVjZNb2d2WFdDaFVsTXU1dlJ1VFduM1UyTDkz?=
 =?utf-8?B?bTUvVGIxTFFleG5UcllGM1k5ZXhkTzhjTFdITVJFemlVRHVrMnkya3NLaHRp?=
 =?utf-8?B?RnUzTE9JcUxCc0U4T0hYSGJiWXdLZUZSUG9zZFZldGJVVVZDdlcyMmcxMEZs?=
 =?utf-8?B?WTFuNWVkT080cXBVNFhOQm5yWTlueFFYU3dPcWVFd2lkSDRmMVR0KzlBNSt5?=
 =?utf-8?B?Y2FEanRSazFhV2xjRVRzOTMvcjhwY0VqWEk1LzBaSEtvZFJxL0dKOE9BMVVx?=
 =?utf-8?B?WVFBdG9Wb1lTZG5lRFJBMTlvNFRRb0x1QUJuTWhMclI3ME5DdEJWd051b21h?=
 =?utf-8?B?dlF0R1lBTE1nR2hMUGg4cXpkaGx1bU01eEVpbldidFlNSDkxSWhNVzNkTXNj?=
 =?utf-8?B?YkkxN2JWNmdsbEFEMTFwMGNwNDUxVlErMTZMRENpZzczdDlYdUlNMnBWZEd4?=
 =?utf-8?B?ZXRmVXo2M2haaU5Kek03emYvQ29mMFg4bnRTYXo2dFNldzVXZHR2UkFRckln?=
 =?utf-8?B?Wnl3NENUV09CblUxeG1JNERNdDFOWU42aTZXVEE5VXhBbTJMN2tMcHA0MThI?=
 =?utf-8?B?ZUlISk5RV1liSkxWMWJybmRSc2d5S09oRTdSeXhPajNhenN5ODE4aHZlZVJV?=
 =?utf-8?B?NjUyZGY4UUJvOEUwRW1PNzYvRTNXYnp6SnRFemxJY2hGcitMYURpTFFpMDFq?=
 =?utf-8?Q?ucOxstcJLN64c6Q7hRm31TI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d6ad7e-bdeb-49e0-7227-08dcf2573e44
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:06:10.3597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4F40Zv2hJcDsfq21bHdqdHmt4e/p1KNTJcslfECes457ncER820DpLSJIWPVY+9U7LL1PLfT3FkuS9oyyC2Deo6ardvUF4n1K+YES2GJkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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



On 21-10-2024 23:27, Matthew Brost wrote:
> GGTT work queue is used to free memory thus we should allow this work
> queue to run during reclaim. Mark with GGTT work queue with
> WQ_MEM_RECLAIM appropriately.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 1b3178226987..0124ad120c04 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -246,7 +246,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   	else
>   		ggtt->pt_ops = &xelp_pt_ops;
>   
> -	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
> +	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>   
>   	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>   		    ggtt->size - xe_wopcm_size(xe));

