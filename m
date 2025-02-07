Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A67A2C246
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 13:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7180910EA7E;
	Fri,  7 Feb 2025 12:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hk4QzWMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6010EAED;
 Fri,  7 Feb 2025 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738930281; x=1770466281;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lLRrDBaO94liA7dxWO+nCslUvjlFJYwS/QmuAs+PT40=;
 b=hk4QzWMHV9Kkrfwke3KkkHZjJPBoGd7yirlZXlmg0xyNQSBS3ESGDFW5
 kYOPNENE/iaFK48qpe/XOmLZ8Kflnkb9l6/vhs7fJcWRDfQnVUUGp9+ZF
 58KqOWlo1+A9y8HuTLjbMIvvoPaIRx48zDFesYeK6X1Yjh6JRmVPIgRm8
 zUwsTGbr9K+0ocGXzabtGw6UpejWClhSWhbnB3XyyJtXTpTDzlFoM8Elz
 BQZW+/yKJQ+bAff5H4KHiqJDBdwTMj6TiQbvKhdbOprUdtikcYbx2//0Y
 XkmKBrCo2U9PhCMK4tBrIGZgAFe+I5jRbbRs/mAt/+Ezg+tWMIGDAdbS9 g==;
X-CSE-ConnectionGUID: OA2ee6o4SRum1pubLYDvbQ==
X-CSE-MsgGUID: BKYKhUAjRc+ZHfQDKNGKIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38797674"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="38797674"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:11:20 -0800
X-CSE-ConnectionGUID: Vu/TbgH5S3O0U2cr9Ior5g==
X-CSE-MsgGUID: QZnFlCx1TluLaqZOjRiKeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111358384"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 04:11:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 04:11:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 04:11:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 04:11:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyUKjno4mmLIyVQFVS9LJDxKSuD5J2OEXLYZVkgTWAwWBaGN2pBjp1uAu4iloQbuOs4LUpFx1k+sZJ7JQM7pOLVBSOB6gPMynmF15Gr0UAwyXSZSZFyRDPWT2ZtWjQw8KydV7sveT0IqO6yS3Jvw9mottsrqxKG77mYtF6LNeZl70wgF4gyEKfq8zebx8PpVpZt6RF9jGDH2Jj8wxOJVlbDsnwVnbjbSerVh9ATS7HfAF/CVdlJxrO2xUFopCAwuRTxT2Vz43FtTIxCqyLwtgoCxfykinNXo6qyOrUhM5ZpPAyotH5jFg3YrSdNdDCkcya6B2RW6QSVzsNJn7ZyZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPqoE27d/bXDmNEX3RBkLjo7XiKk1J9VXQvxdwGj+oM=;
 b=LJJ/bCJEvx1THOMcXsFi5aw6mdTw/Eq0yb45ZMI95NLqcJEZtL6Zl9ETxND7lGtQZLpFuOo+agOwCqIDqjmTtPJOdWI7DcvP3PR5iVveeXYnl5HrYSdPo0OXWwp66zlo/f73EnxMwGmGF7pxxBAYTZVfXqv5S9ooSvrjMZnF0bKYSuwu5qPyXzjhiTXRfT1EgNne6g5iUwGWFDRur0z5gPWTEXGn02xu1e0q8sS0HPgO0sdKGcMgBl9oI/sZpKub9H777RZ2g8vNivwa+8dtz0hmXgBstTjwqaQC5ixPRcSbxNslyoJOZ/tmBRDgF4vbFwlkqLQQS9fV90oYJT4PmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 12:11:17 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 12:11:17 +0000
Message-ID: <49fb1a2a-606f-4739-a1f1-dffe51c187fa@intel.com>
Date: Fri, 7 Feb 2025 17:41:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/33] drm/xe/uapi: Add
 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-9-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250129195212.745731-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: ae406e37-c7b3-4cc6-bb89-08dd4770862f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmN2VjN1ZHNDNXhpNWE0STdkdU9IOXFGYXVaS1psZmRDUjBnL2pIQUM4RWtq?=
 =?utf-8?B?d0JyZ1hyZ2VJdjJVanFmTzRhLzYwcFhGNnBpeXV6cEhPTWlFZUxvbHpqUHYy?=
 =?utf-8?B?WlV4MFl3ZVpYRE1ZaVBCN2V5TWNBdjRaVDUzOWtrTmZNTWJETzhwTEdVWExL?=
 =?utf-8?B?NFQ1VE5HcUhhWDU2KytWcVNMNUZkWXBneUI1dUk5VXdlSzFGWFB0MFZMRkVx?=
 =?utf-8?B?OGNqUXp0eFFkSmJCSFhNNmFuTy9nWG5CRHF1alJBeWMxcUVGUm4rWVBxcURX?=
 =?utf-8?B?OFQyQURNVno0dEFPWDNFaDJBdWVqamhTNk1KMXRVcFJxV3Q4OU5qeHdPNjBu?=
 =?utf-8?B?WXQ3NVVjeWkwaDJUWUlEM0FwWllhcngzeXFBVjVEOWhFTUZhMkk3Z2I3cHox?=
 =?utf-8?B?VU5sQUNMeHJqNHhUcEhLcW9Ja1A2eFpzZWdiSGhNSHNTWHBoais3TWQzOGlI?=
 =?utf-8?B?RytxU1lLN2ZlSDR4SUxtbkFTWmxjeEFJMmZFRmNTeXpmbWNhd3lkSWpJYVl1?=
 =?utf-8?B?U25qNXIxWUFVeHp1clVJS3U1TFJRNGF4Skt4MzBDWUdiUEJQbjZKZlNiRWlD?=
 =?utf-8?B?eU8rc29JRkpQNFNQVitsRjBDOVM0dGczSjJMNUZocmphODJ4eWJIbGVmQ1o0?=
 =?utf-8?B?NzV4ZFUzMzcwa1R3NzJuYU5VblhwcGMrakNIemlIemx3S0JvMW4zWjduay9a?=
 =?utf-8?B?UzNxK0QwY3FqZjQrNGFVM1JnOW13N096ZFYvTUhhbFV2ZVh3ZnlETWxOZzRS?=
 =?utf-8?B?S0IzNnN4RmtKTWNwbzVzRTNLcFJKOExqSEZBQVh0akJkYlFaUVd0QnVRRHJP?=
 =?utf-8?B?cTdjOU1EY2xsUjRwczcvVHVDZVBPYWxRQVAvRVJ5endYSjI1dEJSb2h3Q0VG?=
 =?utf-8?B?RldjN0RJLzhYVzduNUJ1cHhyQWZvN0ozK0VCQmVadHhuYmpWd05FZWI4cVZQ?=
 =?utf-8?B?a3IzSk9GbE41enV4ekl1REVPWWRsTTc5S3ZDN3BXOXlzZk1LUFQzcFY0V3Qw?=
 =?utf-8?B?OFc2MUdPb1NSUFFtY0JDZWg2K2FmNG16Mm9VL3diOTVVNG9FcmU2cmk0Z1Iz?=
 =?utf-8?B?K3hXWHZ3TXpZNzFJMHFFdWJyR3J2N2FyTlg1QlNOSHZCc2VTSnhRT3ZhNHpo?=
 =?utf-8?B?U2VXbzhrRWZsdjg0TVF5Uzl2TEl2V0FBY29jdmZxWFhtb01pTnZFK0dXZ0dJ?=
 =?utf-8?B?VGV0NlpaL2o5Vm5QVlJ4THJkYXFEUDIyV3NmYnA1RmNOL0pOdUl2elBCZUdo?=
 =?utf-8?B?eHdaV3RXekRZVzE1OFBxNnJONENqUDl1ZDFHQ1JHZ29pcjJTQzI3TzNaZlFy?=
 =?utf-8?B?RHF3MlVOU3FISFhpaGxUd3FIY2FLNnZadXU4Q2FwUFJQamtEbTJtMUY0QzdM?=
 =?utf-8?B?VFppRzByU2krTjZnTXdEMXoxZGtma1g4R1BnQjA2cWozdU5KSVhwZFhJTjgz?=
 =?utf-8?B?Q3NhdDBoSlJTTEd3aTVxQ3lqbWpML2Z3cytJVFN1N0JERzRtclhxb3FjMCt4?=
 =?utf-8?B?aEFJaElHT053N0Z1SC9nUy9iNGV2T1p4cVhKSU1ZNVkveWdRNW5DdUNKWGtG?=
 =?utf-8?B?STd1MHhlWXh0enYrMDlPcTk3Z2pOUkc5Y3JxWTdLVzhUaWxuQkFMMHEvSWoz?=
 =?utf-8?B?Ny9GbEFWN0tQUXF1L3UydmpMUzNXZFpkc1Rpb0NUekR6VzM5L3ZrMkZWR2dW?=
 =?utf-8?B?L1lvTnFTZXFYNnpLaGZzV1MrTmV5QUhRVE9OMThCMVRkUENjaDU4bU1vVlVX?=
 =?utf-8?B?ellad3JOQTZBbWJoZnBKUGU5cFhwaVZzazIxOVlmcUpXZkV6OGZsdVhmaTZT?=
 =?utf-8?B?SkJNT0xlSnJZc3hWcGkxOU9FUW5CUVlTdFRBMmt5enV5UEZjWWM4WUV5TkVP?=
 =?utf-8?Q?HTH+WQJU++6Rp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnFMTENFdXh4U1dVWnFmSWt2eGN2bXNpeFNWVDFRS0piUnZQUEFHNFFzanFR?=
 =?utf-8?B?cVZoMW1PbGtXMlV6dGNjalJMSHBrLzBtcXNibWpzT0tyVXpuN2xWUTFUN2s0?=
 =?utf-8?B?WitEWU1qa29rei9KRlk4eURHY04yc0QvdUc4UEVXMjFBNUloNXo3bzNBaXJp?=
 =?utf-8?B?a2xIYmRrZDlwMS9Ud1B0TlBCWm1qZzVrNWpBbUwrRW1SS1BvdzV1VkFDczhC?=
 =?utf-8?B?MExIUjFmeDhTN21NOTVidldWTi9KR0dHNFAvQlo0ZDJUVFQyNHhGL3ZXTWQ0?=
 =?utf-8?B?UGRzckphZGtWSE9YaHNWK3V3R3J3Q0hIcVlvYW9adlpOalZwVzNqSnlSZERy?=
 =?utf-8?B?RHMyWXZBdjd4cXZhcldFRGxiQ0Y3OC9DV2pRVGx2R3NTNnpBWEw5UHg0aHFl?=
 =?utf-8?B?aWNGVFBRTURnZ1UxRkdQcStJOWI1czdkdXQ4QkJvQ0ZtR1ZrcndFTkpsd1JE?=
 =?utf-8?B?RXBhMTJFeWtRMWJkZFZmZEtScXVMVmRlajRGZ2xJQUdFQzU2UEYzcEZZN2l0?=
 =?utf-8?B?VmVLSkpJdmVvWGlrc2hmUUh2YmZmMTJvSmMzdVZzQUcwWjJtcytIWE8yTXdo?=
 =?utf-8?B?U0s3MFRrVFNId3o3Q2ZIUTRwNGtVM0p3MFNXWm84eFdIU3lvM043V25FWjVI?=
 =?utf-8?B?MklIVlkzb2ViODE2RmlpSHF0UjUyZXRhUFkweEloSDB5Q0JteStOeEZYZTV3?=
 =?utf-8?B?cHNsZ3hrMkZwbWtRSkRKK25YU1A0a1JnNUNEa1FwUytqSEQwWEJld2dIT0wr?=
 =?utf-8?B?YnM2bjNnbTZKNTlmNHZpYk45Z2Y0ZzE1cUcxb0h3bzZZdDNGRHkyVW5DKy9C?=
 =?utf-8?B?NGJURmtVaThWUmNoSUpHNmoyYkZQVld0Q3BjRXd1TThiNGhMOWpuMnpVcldv?=
 =?utf-8?B?RzMxQXhzcVJVR0pPbDFKZ2IvR1M0YVVvYUhTOEkvNzhwWnhld3RJa25DR21j?=
 =?utf-8?B?SVg1bDRiU2F4N2ZJSm4zQzRwdmpBazBwbmFvd1EvWUQ4dlhWR25lcmdOUVJx?=
 =?utf-8?B?TXdNMEZGSDRFeUdTOHFzQmZYUWp3enc5OVc5dDFOVXhIVVpOc0tGaUxzK3dW?=
 =?utf-8?B?QXBhT0tiVlZxL2taNWRCOFlOZmhOVTM3aWN1VDViREJ4OVBCc0VMdTRqd3Zx?=
 =?utf-8?B?QjNYQlVxQ3ljaXBQRERjbk1YNDhHY2V2cmE1NG9HbHRUZHlkemN4aENyUDRY?=
 =?utf-8?B?YmNRYjF4anYwc3ExUjdDeU1CSXFGeVVDMkxNSHN3blY4S3NCRjNZOHdPYlNS?=
 =?utf-8?B?R0hCeDdTd3hldGl5WDY3Y3FDR3lUL0MzcWN1VXBHSCtxTGhWT2FhMitBNUNZ?=
 =?utf-8?B?SnBXU2oydEZGcVpmMnpZRDVIT2M5R0ZNQmFUY0Y4QlVDRU5McUZhZDdTbGNK?=
 =?utf-8?B?K1dGTldBNjc2TTUrd3RveVN4cEVndFZzRWhwQTFFLzBLeEFxenlVK0RTYlRr?=
 =?utf-8?B?RjZGZFJYN2E0bU80ZFBST2l0dnFUU2FTNHo1RXNudWZGcVVVbTA4WndQcnow?=
 =?utf-8?B?N1AzVzBHTGx1N1diakRYbmpraGFLV2FJUDBUVDVGM1NVeE82OFZYTURGRU9Y?=
 =?utf-8?B?d04vNml2VUhIa21qZGtST0lTb1pPQ0lEYkw4RGVBcVVrMTQ1MG12a2ZRejNi?=
 =?utf-8?B?RDluNXNLNzFrLzFpWGhBYXV6TTA2MldqMzl4QzJ3MTUrd2JoVjhjbXBkdzZG?=
 =?utf-8?B?bUJaR2N0eUJMS25WQ1lWL0wvdXpYKzNRaFRpeW1sbVl1bU51YmdzN0xYT0FS?=
 =?utf-8?B?UHNKdTQxTFBHTUZrUXJXeFhlNVpLODFjeDluMDZMbTQybUUzeHliaWg4VTQw?=
 =?utf-8?B?VEJ5Ty9GODRnaytRUXJYTEl1YStIZmd6cTlVWkhBdkJJMno5REx3S2pra3Iv?=
 =?utf-8?B?UzcweXZ2eTh2cEhHci9hVHFoOHYra3NSUXpBVDBZNDE3czA3NWtIY0p2eHpL?=
 =?utf-8?B?cktOM0NJWmh5a2FhcFNwcW9id3FKL3lXa25yWEQ0Q1k5L0JGaHhJR1pKUy9a?=
 =?utf-8?B?Z0JGcEh4L3lEME5XVmU3SlVuUi9zWFVsRnNZM3BWRlI3Rk50ODk5REpBMkMr?=
 =?utf-8?B?UVV6MkdLcVg5SytlYUtpRkY0c2lyVDZ1NzlDNDYvcnZkcXdRTkE0d3RwNG81?=
 =?utf-8?B?WndsNEJUOEVLR25JT0N6T2ZiWjB4dlhhRXI2QjhZOE8xaUpZdHVucGhJb3dI?=
 =?utf-8?Q?1sM+Yl7MBN0Gjx156ZxM7co=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae406e37-c7b3-4cc6-bb89-08dd4770862f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 12:11:17.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWtfF+Tlk2B8LAeeDnUJIqtLNu8Mg1v+u/LX4lr+pLct//RN9hYFQTA8ibMur/qQ7uI3wsIJbfv8YkpyGwrhzgGUL0ySjKwy7NM6wqCf47Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
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



On 30-01-2025 01:21, Matthew Brost wrote:
> Add the DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag, which is used to
> create unpopulated virtual memory areas (VMAs) without memory backing or
> GPU page tables. These VMAs are referred to as CPU address mirror VMAs.
> The idea is that upon a page fault or prefetch, the memory backing and
> GPU page tables will be populated.
> 
> CPU address mirror VMAs only update GPUVM state; they do not have an
> internal page table (PT) state, nor do they have GPU mappings.
> 
> It is expected that CPU address mirror VMAs will be mixed with buffer
> object (BO) VMAs within a single VM. In other words, system allocations
> and runtime allocations can be mixed within a single user-mode driver
> (UMD) program.
> 
> Expected usage:
> 
> - Bind the entire virtual address (VA) space upon program load using the
>    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag.
> - If a buffer object (BO) requires GPU mapping (runtime allocation),
>    allocate a CPU address using mmap(PROT_NONE), bind the BO to the
>    mmapped address using existing bind IOCTLs. If a CPU map of the BO is
>    needed, mmap it again to the same CPU address using mmap(MAP_FIXED)
> - If a BO no longer requires GPU mapping, munmap it from the CPU address
>    space and them bind the mapping address with the
>    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag.
> - Any malloc'd or mmapped CPU address accessed by the GPU will be
>    faulted in via the SVM implementation (system allocation).
> - Upon freeing any mmapped or malloc'd data, the SVM implementation will
>    remove GPU mappings.
> 
> Only supporting 1 to 1 mapping between user address space and GPU
> address space at the moment as that is the expected use case. uAPI
> defines interface for non 1 to 1 but enforces 1 to 1, this restriction
> can be lifted if use cases arrise for non 1 to 1 mappings.
> 
> This patch essentially short-circuits the code in the existing VM bind
> paths to avoid populating page tables when the
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag is set.
> 
> v3:
>   - Call vm_bind_ioctl_ops_fini on -ENODATA
>   - Don't allow DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR on non-faulting VMs
>   - s/DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR/DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR (Thomas)
>   - Rework commit message for expected usage (Thomas)
>   - Describe state of code after patch in commit message (Thomas)
> v4:
>   - Fix alignment (Checkpatch)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c       |  76 ++++++++++++----
>   drivers/gpu/drm/xe/xe_vm.c       | 150 +++++++++++++++++++------------
>   drivers/gpu/drm/xe/xe_vm.h       |   8 +-
>   drivers/gpu/drm/xe/xe_vm_types.h |   3 +
>   include/uapi/drm/xe_drm.h        |  19 +++-
>   5 files changed, 182 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..99b97bf37c05 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1069,6 +1069,11 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
>   {
>   	int err = 0;
>   
> +	/*
> +	 * No need to check for is_cpu_addr_mirror here as vma_add_deps is a
> +	 * NOP if VMA is_cpu_addr_mirror
> +	 */
> +
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
>   		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> @@ -1646,6 +1651,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>   	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
>   	int err;
>   
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
>   	xe_bo_assert_held(xe_vma_bo(vma));
>   
>   	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> @@ -1713,6 +1719,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
>   	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
>   		return 0;
>   
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
>   	xe_bo_assert_held(xe_vma_bo(vma));
>   
>   	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> @@ -1759,15 +1766,21 @@ static int op_prepare(struct xe_vm *vm,
>   
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
> +		    op->map.is_cpu_addr_mirror)
>   			break;
>   
>   		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
>   		pt_update_ops->wait_vm_kernel = true;
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
> -		err = unbind_op_prepare(tile, pt_update_ops,
> -					gpuva_to_vma(op->base.remap.unmap->va));
> +	{
> +		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(old))
> +			break;
> +
> +		err = unbind_op_prepare(tile, pt_update_ops, old);
>   
>   		if (!err && op->remap.prev) {
>   			err = bind_op_prepare(vm, tile, pt_update_ops,
> @@ -1780,15 +1793,28 @@ static int op_prepare(struct xe_vm *vm,
>   			pt_update_ops->wait_vm_bookkeep = true;
>   		}
>   		break;
> +	}
>   	case DRM_GPUVA_OP_UNMAP:
> -		err = unbind_op_prepare(tile, pt_update_ops,
> -					gpuva_to_vma(op->base.unmap.va));
> +	{
> +		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			break;
> +
> +		err = unbind_op_prepare(tile, pt_update_ops, vma);
>   		break;
> +	}
>   	case DRM_GPUVA_OP_PREFETCH:
> -		err = bind_op_prepare(vm, tile, pt_update_ops,
> -				      gpuva_to_vma(op->base.prefetch.va));
> +	{
> +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			break;
> +
> +		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
>   		pt_update_ops->wait_vm_kernel = true;
>   		break;
> +	}
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>   	}
> @@ -1858,6 +1884,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			   struct xe_vma *vma, struct dma_fence *fence,
>   			   struct dma_fence *fence2)
>   {
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> +
>   	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
> @@ -1891,6 +1919,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			     struct xe_vma *vma, struct dma_fence *fence,
>   			     struct dma_fence *fence2)
>   {
> +	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> +
>   	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
> @@ -1925,16 +1955,21 @@ static void op_commit(struct xe_vm *vm,
>   
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
> +		    op->map.is_cpu_addr_mirror)
>   			break;
>   
>   		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
>   			       fence2);
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
> -		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.remap.unmap->va), fence,
> -				 fence2);
> +	{
> +		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
> +
> +		if (xe_vma_is_cpu_addr_mirror(old))
> +			break;
> +
> +		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
>   
>   		if (op->remap.prev)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> @@ -1943,14 +1978,25 @@ static void op_commit(struct xe_vm *vm,
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
>   				       fence, fence2);
>   		break;
> +	}
>   	case DRM_GPUVA_OP_UNMAP:
> -		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
> +	{
> +		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
> +
> +		if (!xe_vma_is_cpu_addr_mirror(vma))
> +			unbind_op_commit(vm, tile, pt_update_ops, vma, fence,
> +					 fence2);
>   		break;
> +	}
>   	case DRM_GPUVA_OP_PREFETCH:
> -		bind_op_commit(vm, tile, pt_update_ops,
> -			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
> +	{
> +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +		if (!xe_vma_is_cpu_addr_mirror(vma))
> +			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
> +				       fence2);
>   		break;
> +	}
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 690330352d4c..dff10dfa9c69 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -901,9 +901,10 @@ static void xe_vma_free(struct xe_vma *vma)
>   		kfree(vma);
>   }
>   
> -#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
> -#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
> -#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> +#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
> +#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
> +#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
> +#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
>   
>   static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   				    struct xe_bo *bo,
> @@ -917,6 +918,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>   	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>   	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
> +	bool is_cpu_addr_mirror =
> +		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
>   
>   	xe_assert(vm->xe, start < end);
>   	xe_assert(vm->xe, end < vm->size);
> @@ -925,7 +928,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	 * Allocate and ensure that the xe_vma_is_userptr() return
>   	 * matches what was allocated.
>   	 */
> -	if (!bo && !is_null) {
> +	if (!bo && !is_null && !is_cpu_addr_mirror) {
>   		struct xe_userptr_vma *uvma = kzalloc(sizeof(*uvma), GFP_KERNEL);
>   
>   		if (!uvma)
> @@ -937,6 +940,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   		if (!vma)
>   			return ERR_PTR(-ENOMEM);
>   
> +		if (is_cpu_addr_mirror)
> +			vma->gpuva.flags |= XE_VMA_SYSTEM_ALLOCATOR;
>   		if (is_null)
>   			vma->gpuva.flags |= DRM_GPUVA_SPARSE;
>   		if (bo)
> @@ -979,7 +984,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   		drm_gpuva_link(&vma->gpuva, vm_bo);
>   		drm_gpuvm_bo_put(vm_bo);
>   	} else /* userptr or null */ {
> -		if (!is_null) {
> +		if (!is_null && !is_cpu_addr_mirror) {
>   			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
>   			u64 size = end - start + 1;
>   			int err;
> @@ -1029,7 +1034,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>   		 */
>   		mmu_interval_notifier_remove(&userptr->notifier);
>   		xe_vm_put(vm);
> -	} else if (xe_vma_is_null(vma)) {
> +	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
>   		xe_vm_put(vm);
>   	} else {
>   		xe_bo_put(xe_vma_bo(vma));
> @@ -1068,7 +1073,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   		spin_lock(&vm->userptr.invalidated_lock);
>   		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
>   		spin_unlock(&vm->userptr.invalidated_lock);
> -	} else if (!xe_vma_is_null(vma)) {
> +	} else if (!xe_vma_is_null(vma) && !xe_vma_is_cpu_addr_mirror(vma)) {
>   		xe_bo_assert_held(xe_vma_bo(vma));
>   
>   		drm_gpuva_unlink(&vma->gpuva);
> @@ -1968,6 +1973,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   			op->map.read_only =
>   				flags & DRM_XE_VM_BIND_FLAG_READONLY;
>   			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> +			op->map.is_cpu_addr_mirror = flags &
> +				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>   			op->map.pat_index = pat_index;
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> @@ -2160,6 +2167,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				VMA_CREATE_FLAG_IS_NULL : 0;
>   			flags |= op->map.dumpable ?
>   				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |= op->map.is_cpu_addr_mirror ?
> +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
>   
>   			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>   				      flags);
> @@ -2167,7 +2176,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				return PTR_ERR(vma);
>   
>   			op->map.vma = vma;
> -			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
> +			    !op->map.is_cpu_addr_mirror)
>   				xe_vma_ops_incr_pt_update_ops(vops,
>   							      op->tile_mask);
>   			break;
> @@ -2176,21 +2186,24 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   		{
>   			struct xe_vma *old =
>   				gpuva_to_vma(op->base.remap.unmap->va);
> +			bool skip = xe_vma_is_cpu_addr_mirror(old);
>   
>   			op->remap.start = xe_vma_start(old);
>   			op->remap.range = xe_vma_size(old);
>   
> -			if (op->base.remap.prev) {
> -				flags |= op->base.remap.unmap->va->flags &
> -					XE_VMA_READ_ONLY ?
> -					VMA_CREATE_FLAG_READ_ONLY : 0;
> -				flags |= op->base.remap.unmap->va->flags &
> -					DRM_GPUVA_SPARSE ?
> -					VMA_CREATE_FLAG_IS_NULL : 0;
> -				flags |= op->base.remap.unmap->va->flags &
> -					XE_VMA_DUMPABLE ?
> -					VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |= op->base.remap.unmap->va->flags &
> +				XE_VMA_READ_ONLY ?
> +				VMA_CREATE_FLAG_READ_ONLY : 0;
> +			flags |= op->base.remap.unmap->va->flags &
> +				DRM_GPUVA_SPARSE ?
> +				VMA_CREATE_FLAG_IS_NULL : 0;
> +			flags |= op->base.remap.unmap->va->flags &
> +				XE_VMA_DUMPABLE ?
> +				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |= xe_vma_is_cpu_addr_mirror(old) ?
> +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
>   
> +			if (op->base.remap.prev) {
>   				vma = new_vma(vm, op->base.remap.prev,
>   					      old->pat_index, flags);
>   				if (IS_ERR(vma))
> @@ -2202,9 +2215,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				 * Userptr creates a new SG mapping so
>   				 * we must also rebind.
>   				 */
> -				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +				op->remap.skip_prev = skip ||
> +					(!xe_vma_is_userptr(old) &&
>   					IS_ALIGNED(xe_vma_end(vma),
> -						   xe_vma_max_pte_size(old));
> +						   xe_vma_max_pte_size(old)));
>   				if (op->remap.skip_prev) {
>   					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
>   					op->remap.range -=
> @@ -2220,16 +2234,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   			}
>   
>   			if (op->base.remap.next) {
> -				flags |= op->base.remap.unmap->va->flags &
> -					XE_VMA_READ_ONLY ?
> -					VMA_CREATE_FLAG_READ_ONLY : 0;
> -				flags |= op->base.remap.unmap->va->flags &
> -					DRM_GPUVA_SPARSE ?
> -					VMA_CREATE_FLAG_IS_NULL : 0;
> -				flags |= op->base.remap.unmap->va->flags &
> -					XE_VMA_DUMPABLE ?
> -					VMA_CREATE_FLAG_DUMPABLE : 0;
> -
>   				vma = new_vma(vm, op->base.remap.next,
>   					      old->pat_index, flags);
>   				if (IS_ERR(vma))
> @@ -2241,9 +2245,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				 * Userptr creates a new SG mapping so
>   				 * we must also rebind.
>   				 */
> -				op->remap.skip_next = !xe_vma_is_userptr(old) &&
> +				op->remap.skip_next = skip ||
> +					(!xe_vma_is_userptr(old) &&
>   					IS_ALIGNED(xe_vma_start(vma),
> -						   xe_vma_max_pte_size(old));
> +						   xe_vma_max_pte_size(old)));
>   				if (op->remap.skip_next) {
>   					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
>   					op->remap.range -=
> @@ -2256,14 +2261,27 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>   				}
>   			}
> -			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +			if (!skip)
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>   			break;
>   		}
>   		case DRM_GPUVA_OP_UNMAP:
> +		{
> +			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
> +
> +			if (!xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +			break;
> +		}
>   		case DRM_GPUVA_OP_PREFETCH:
> +		{
> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +
>   			/* FIXME: Need to skip some prefetch ops */
> -			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +			if (!xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>   			break;
> +		}
>   		default:
>   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>   		}
> @@ -2665,10 +2683,12 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
>   	}
>   	if (ufence)
>   		xe_sync_ufence_put(ufence);
> -	for (i = 0; i < vops->num_syncs; i++)
> -		xe_sync_entry_signal(vops->syncs + i, fence);
> -	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -	dma_fence_put(fence);
> +	if (fence) {
> +		for (i = 0; i < vops->num_syncs; i++)
> +			xe_sync_entry_signal(vops->syncs + i, fence);
> +		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> +		dma_fence_put(fence);
> +	}
>   }
>   
>   static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> @@ -2691,6 +2711,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   		fence = ops_execute(vm, vops);
>   		if (IS_ERR(fence)) {
>   			err = PTR_ERR(fence);
> +			if (err == -ENODATA)
> +				vm_bind_ioctl_ops_fini(vm, vops, NULL);
>   			goto unlock;
>   		}
>   
> @@ -2707,7 +2729,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>   	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
>   
>   #ifdef TEST_VM_OPS_ERROR
>   #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -2718,7 +2741,7 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>   #define XE_64K_PAGE_MASK 0xffffull
>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>   
> -static int vm_bind_ioctl_check_args(struct xe_device *xe,
> +static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   				    struct drm_xe_vm_bind *args,
>   				    struct drm_xe_vm_bind_op **bind_ops)
>   {
> @@ -2763,9 +2786,23 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   		u64 obj_offset = (*bind_ops)[i].obj_offset;
>   		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
>   		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> +		bool is_cpu_addr_mirror = flags &
> +			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   		u16 pat_index = (*bind_ops)[i].pat_index;
>   		u16 coh_mode;
>   
> +		/* FIXME: Disabling CPU address mirror for now */
> +		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
> +			err = -EOPNOTSUPP;
> +			goto free_bind_ops;
> +		}
> +
> +		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
> +				 !xe_vm_in_fault_mode(vm))) {
> +			err = -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
>   		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
>   			err = -EINVAL;
>   			goto free_bind_ops;
> @@ -2786,13 +2823,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   
>   		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
>   		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> -		    XE_IOCTL_DBG(xe, obj && is_null) ||
> -		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
> +		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
> +		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
> +						    is_cpu_addr_mirror)) ||
>   		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
> -				 is_null) ||
> +				 (is_null || is_cpu_addr_mirror)) ||
>   		    XE_IOCTL_DBG(xe, !obj &&
>   				 op == DRM_XE_VM_BIND_OP_MAP &&
> -				 !is_null) ||
> +				 !is_null && !is_cpu_addr_mirror) ||
>   		    XE_IOCTL_DBG(xe, !obj &&
>   				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
>   		    XE_IOCTL_DBG(xe, addr &&
> @@ -2934,15 +2972,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	int err;
>   	int i;
>   
> -	err = vm_bind_ioctl_check_args(xe, args, &bind_ops);
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
>   	if (err)
> -		return err;
> +		goto put_vm;
>   
>   	if (args->exec_queue_id) {
>   		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>   		if (XE_IOCTL_DBG(xe, !q)) {
>   			err = -ENOENT;
> -			goto free_objs;
> +			goto put_vm;
>   		}
>   
>   		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
> @@ -2951,15 +2993,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		}
>   	}
>   
> -	vm = xe_vm_lookup(xef, args->vm_id);
> -	if (XE_IOCTL_DBG(xe, !vm)) {
> -		err = -EINVAL;
> -		goto put_exec_queue;
> -	}
> -
>   	err = down_write_killable(&vm->lock);
>   	if (err)
> -		goto put_vm;
> +		goto put_exec_queue;
>   
>   	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>   		err = -ENOENT;
> @@ -3116,12 +3152,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		xe_bo_put(bos[i]);
>   release_vm_lock:
>   	up_write(&vm->lock);
> -put_vm:
> -	xe_vm_put(vm);
>   put_exec_queue:
>   	if (q)
>   		xe_exec_queue_put(q);
> -free_objs:
> +put_vm:
> +	xe_vm_put(vm);
>   	kvfree(bos);
>   	kvfree(ops);
>   	if (args->num_binds > 1)
> @@ -3178,6 +3213,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	int ret = 0;
>   
>   	xe_assert(xe, !xe_vma_is_null(vma));
> +	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
>   	trace_xe_vma_invalidate(vma);
>   
>   	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 23adb7442881..0e54a0e8768d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -150,6 +150,11 @@ static inline bool xe_vma_is_null(struct xe_vma *vma)
>   	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
>   }
>   
> +static inline bool xe_vma_is_cpu_addr_mirror(struct xe_vma *vma)
> +{
> +	return vma->gpuva.flags & XE_VMA_SYSTEM_ALLOCATOR;
> +}
> +
>   static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
>   {
>   	return !xe_vma_bo(vma);
> @@ -157,7 +162,8 @@ static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
>   
>   static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>   {
> -	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> +	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma) &&
> +		!xe_vma_is_cpu_addr_mirror(vma);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7f9a303e51d8..f6855e4fb9e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -42,6 +42,7 @@ struct xe_vm_pgtable_update_op;
>   #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 6)
>   #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
>   #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
> +#define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
>   
>   /** struct xe_userptr - User pointer */
>   struct xe_userptr {
> @@ -294,6 +295,8 @@ struct xe_vma_op_map {
>   	bool read_only;
>   	/** @is_null: is NULL binding */
>   	bool is_null;
> +	/** @is_cpu_addr_mirror: is CPU address mirror binding */
> +	bool is_cpu_addr_mirror;
>   	/** @dumpable: whether BO is dumped on GPU hang */
>   	bool dumpable;
>   	/** @pat_index: The pat index to use for this operation. */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e2160330ad01..b86dc1b4c2fe 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -933,6 +933,12 @@ struct drm_xe_vm_destroy {
>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>    *    implement VK sparse bindings.
> + *  - %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR - When the CPU address mirror flag is
> + *    set, no mappings are created rather the range is reserved for CPU address
> + *    mirroring which will be populated on GPU page faults or prefetches. Only
> + *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
> + *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> + *    handle MBZ, and the BO offset MBZ.
>    */
>   struct drm_xe_vm_bind_op {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -985,7 +991,9 @@ struct drm_xe_vm_bind_op {
>   	 * on the @pat_index. For such mappings there is no actual memory being
>   	 * mapped (the address in the PTE is invalid), so the various PAT memory
>   	 * attributes likely do not apply.  Simply leaving as zero is one
> -	 * option (still a valid pat_index).
> +	 * option (still a valid pat_index). Same applies to
> +	 * DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR bindings as for such mapping
> +	 * there is no actual memory being mapped.
>   	 */
>   	__u16 pat_index;
>   
> @@ -1001,6 +1009,14 @@ struct drm_xe_vm_bind_op {
>   
>   		/** @userptr: user pointer to bind on */
>   		__u64 userptr;
> +
> +		/**
> +		 * @cpu_addr_mirror_offset: Offset from GPU @addr to create
> +		 * CPU address mirror mappings. MBZ with current level of
> +		 * support (e.g. 1 to 1 mapping between GPU and CPU mappings
> +		 * only supported).
> +		 */
> +		__s64 cpu_addr_mirror_offset;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	};
>   
>   	/**
> @@ -1023,6 +1039,7 @@ struct drm_xe_vm_bind_op {
>   #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>   #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 4)
>   	/** @flags: Bind flags */
>   	__u32 flags;
>   

