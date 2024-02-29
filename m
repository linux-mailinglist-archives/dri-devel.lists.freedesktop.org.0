Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1686C8ED
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BA410E063;
	Thu, 29 Feb 2024 12:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIjKGO3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A686C10E063;
 Thu, 29 Feb 2024 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709208840; x=1740744840;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L3CUBe0ydv5KeQPYx37vUjUW3MN++iFL46XsnqWuhqg=;
 b=ZIjKGO3eTx9T51PkdjWkx3y6bv02g7WrdPFzoKFbRXLc4XHBfdxqWdTY
 tCDjwz3dsVGT9c+R2zN2cFAlzE+jCbrxCW6IGLahtIU9/5OpSjqc8o9TJ
 mfeqaQjLqc2D4fZzoAh9Lj71OjDEyBIoWR0GRW8DmAdmJFw0NZYDZ1r4s
 TNwHrcuu8l/SS5X3fmIB/7n50uXnqjNhazX8+runWSoqd7SBmw6q/tS/o
 XZ6GGjVhVGJV2O6dwEP66sERK5ng/1GemcmSqIBc9ghupLovrv3ht3pJp
 yk+8uSFG5HUolTA5f6BO+ivOXwcE5t9v40fjV+KIB04Tr3YsoWCICg7N+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3837978"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3837978"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8165778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 04:13:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 04:13:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 04:13:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 04:13:58 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 04:13:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgP9zkpIbFxmXWN2CBD79EXxAN4QDaxj5xl3WLMZw8o8g9g6NWIAWvPbRFN6ghgZpmp2g8FWOSEB0jxPIF/2pSzZfG5wpVgDAB4168xCs47J+qKx3dFwtfucI1YUhr/iUE0CqxN6OqVkm/QYEpbkaElvEV0xY3QYCIyopeoQUTEymhuH4rLHyHDvzuL1MHRw9TknY+vl8y/NWfUKEZrVyKkbGUjHZd+z2qpURmOAHMPyiGgWII1CGU46IrJEfnYdTEiOEP7vQ7u9RrStKspJ/GhjF9JCxtFbZQ/v2wY5k2NtZ+vMBieG8/HcBwsIbuihSHsK3xEsYXe0vTjbJ5kBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZGlltC0Ym3l34jO8LrW/yFqUEVheR+9lnmCDBoBuvo=;
 b=Vo2OFNtqLR2LzN/0gtDw/rK/3oHV7ZX8X1bXyKpEPjOR0ZegLTaB1ikFVAnaKcTpRfLQ7GqU4W6noFTjWydJDJoTfiLzqPObXBRtKVmZerF2BvvNWiC4oM0WxkDMSJL9kV1xkg3Qwk2TVct5Pjpc7ZuKRyx69N2cSVgNovDf7dXjAKZ+bVCpRAVgxFME1kAeABNoPuIfaUbdHjelv2Q2CuIpISk6EQwHWQBFb8K+e/sVZelfH+KquzdjJqEGeuLEoWV0ZWum/8CgGlEb+N74qlquqFVhCWVi7dAh6/bRHnuNUFM91qag9cqKrHxVvot9xPdjoM0O/jvd+aYzMEQ0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Thu, 29 Feb
 2024 12:13:49 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 12:13:49 +0000
Message-ID: <8c7ca84f-ff77-46b1-b06b-8944b31078c8@intel.com>
Date: Thu, 29 Feb 2024 17:43:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
 <4b7b2711-040c-4aed-ab05-e752527cf5cb@intel.com> <87frxb8qg3.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87frxb8qg3.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::21) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d985149-bf4a-4b69-0146-08dc391fe2dc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79ijUu/NPK1//ffFBuX4dIHD8ckLbq4AaQVdoQ/zjWMaqSj5u0dfowAKANO2OWjyjHcpIO0c/oJubuhbokYtpubrwzQzcO3pY2AdukYV7K5gYcp/IAUjoDTmk51Ajatr5EZjuQJdhKWsSL9a1A1pWQ1h7lAMAd/ZqjDhqdYPyPD9pOmHiKnWffBmlPPK6fk74TSjX6AYBOrStHiE22a9ffWUoL0qG95v/XyxqwIc6g/EVNlcPecR5lf7HWaE2NgBbXXpeL4bnkVruEWnyyis1Q7JQerRilkX6Zw/1z9bmuLh4kIW9mtr4zODeC43LAXQgJ1CyGeGdNGCKG+oqI54ihQh4fnn1JQ4u5BMa//Nr4vmKTkDpxNzQBL0l6EF/TKE1dhjQIaGOkMXxMESBvOxdxTlueSTVL/RR/afXA0ryC6PPV2BtZsIRK6DXav30jLOK9657TuVhPTBFFlZ7Vnmd83LxttH/betqeNch0OfRLa3WKwiRX75mYkIRRctZsSUqlDg6NysbpQYVw0krx9noNvv5kYui6JJhUi+g7bsYvZUgJpabhamncB+zeLJpkH2dB96b0x/wlv/fbgfqZ4cag340awR8w39mdWMAbQsK/LHDcosAvTZBgXGmgLGbC+M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhKbm5FUUJ3MWFrVS9GTElHcENURFRCbFIvbzF5SE05OHBOTzJhazBZNDdh?=
 =?utf-8?B?WVAybFdld2t1b3RtRkpwUjY0M0t1d1lLcndTbG8wNHlQMFFTdnFiN253Mm5T?=
 =?utf-8?B?b1BzVWpCYnAvYVFpcFdLZllVU0M1UHUwSmQyc1FWYXBCTEdpdWFGM1dINzBH?=
 =?utf-8?B?K1p6SlgvUUJBYzNDNHNpdUp0QnczRW5Fd0NjMUE4S3g0amJ5Q2VNU0tFeHI3?=
 =?utf-8?B?K2VWdjVxUVpKTXVsVmRVZ3BSOUhuYTVxTCttZ1Y4SVU1MHFRTHRjRko4RGV2?=
 =?utf-8?B?aDd6ZlZaaFczYlNONzJEZzhtU1ZEdGlTbmQ0TnVoYWxhaWZ5N1YvbVpGengz?=
 =?utf-8?B?cXpnQUV1Tmg1TW5QeVpFQzhtc2oxN3VaWldacUlPOUVOZFNsRXBCZUNHbmtl?=
 =?utf-8?B?TmZiQTJXVkh3VVZiNTZQbXFLbEl4VU9ndkI3RFJLU012RjFqSmRqS3VqMjFi?=
 =?utf-8?B?UXVlZWNOVU8wQWpZazVJS0RnRHNlMG14ZmVzanlkN2htRjRIUlowWjA5M29t?=
 =?utf-8?B?bFNCVGt6dWpBQnU2S2tuYlFkWEJmVkw1Sk5DZGt1M3V4b1R3aTRHa3lhWEth?=
 =?utf-8?B?QTBzR1NhV25tOERjTkZjZkNvNUE3SmJOK0lrSXR3WThybmxqOXlFYk9iTStr?=
 =?utf-8?B?aXBIVmNZZk1tVXBGUXRsUWx6TFZUeTg5bGs4YndEQXBlZlRIWkJTWGhOOG9Y?=
 =?utf-8?B?RTg0L2FDNGpjTG5UY3VQbmxUb1FDVDVIQ05FSkxUdFMxYWtHSmNPWThPNG1J?=
 =?utf-8?B?U09oUnFiRDUrdU5DUjFjNjJPOGdBVHBrRWtCQU04ZkpPYzMveUI3Z0FiZlFP?=
 =?utf-8?B?a3hrblo5amc1YmExTVRkSU91Mi9pVElYWGF1T3dWSWh5dTYzdmY0d0F5NUVa?=
 =?utf-8?B?dG9zUTFYc1NzeDlLVk0rUlhEbEJsZnRWU0JXRCtQZjlMM0dieE9NYXYxUE9M?=
 =?utf-8?B?OVdGdUlkNFlXWEttTjdSTTFUMFVYSU5BUFZmeTRQOWFGNjdSYmV1aVVMTXNr?=
 =?utf-8?B?UXVuMlJrOGFlOG00THpRSERhd3BoeG9PWUJzeWd2ZjRGRHc1MjR2Z29VWTl0?=
 =?utf-8?B?T2R0MUtqU0ZNc2MzNkNSeG5DTUpSVnpzOVFBWGs3NTBzUzZBbGtpV1pNdFNR?=
 =?utf-8?B?M0lnN0lncFlCSzZIV1YrSHZrMDFodmlZZlh6TlhGSUpzVFZkeGxaOVZPWkF0?=
 =?utf-8?B?VVdQTnhVU215djFmZ2s2OHVyS2hUVHUvZEpWVE0wQVl6UXJLeUZOaFd2VmNs?=
 =?utf-8?B?dmh6VlNMMDJISDlQcnF2TDI2WG9RbXhEVXZ4dENwd0krZzg5bDk0SGN6ZGRT?=
 =?utf-8?B?WjU1V1J0TU5YbTdNT1dEbFBzNWV1T2MxZU5uSzdSMmNTRGRSeHlxUUV4VUVY?=
 =?utf-8?B?Y1Bpci8rNlNtQmNGVFNOWk5JRnNadHhzS29MS0tpYXZlZ3AyZVVVZ0ozNHJX?=
 =?utf-8?B?b2t3WVFIenhuUWU1WUs4WktCMEZSN3hBN0U4Y3JUVnVMa0djRlpSMnY2TE8v?=
 =?utf-8?B?QTA3MjJBMEQ0MklxZXkzTnJTTDNqS2d0eXZ0cUVGdmhjSFljSVU2aFRBSXd2?=
 =?utf-8?B?ei9nbWEzdjlUUGdWSDJiVUJZT0JzeThnWkFySFdQNDhxOElYcUdZU1pTK3p0?=
 =?utf-8?B?UzRXb1JVdVVwcjdxZFFtZGR0TjlEZmhzbWF5UzRRVEh2SU51WDRnb3NWbDZt?=
 =?utf-8?B?TEN1OVM4R01STWVLeXJwR3VFWkpUbHloeXRYbkpWclNPWkQ2NmtncXB1YzBT?=
 =?utf-8?B?OERyb2hBd1JnUHRMbDNUUTR6SDBTdWtrRkszZFlITUVTclEyQ3I0YkoyOTlL?=
 =?utf-8?B?S1NqL2d2OStnUmY0U1dGM3FweWRtc1ZhaGRHbk1rODhUZXpxaXIvWGVvY3Iz?=
 =?utf-8?B?T1Vyd2xNN0xNMDlsMmtwbWtPN2xmaGZSaDN3eGdiekFBQk1WeUVuUUl0Tk1U?=
 =?utf-8?B?dEF4MXFKZFVCcnluUjJvWDFKNVFCWHFQL2dSdmFSMlZFeGJXV3VHUmg0Ryts?=
 =?utf-8?B?TDJ2dkFpWkJ2N0VnWFNKM0pqek9iZ1VyYzdwVmVHaThwbnVVT0RwcXpsZEFY?=
 =?utf-8?B?UE5maDJXemNld1F2bzYzSFRKSXFFbnZOZXVoYWhDMHMzT1crSHErcmVlZEp1?=
 =?utf-8?B?Yk9FME9oV3ZJM1VJQnpZWTRlUlN0VHhVRjJSSDB0SVlnRERzR1NCT1BxSmNh?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d985149-bf4a-4b69-0146-08dc391fe2dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 12:13:49.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJlVhrcPTVKDCTWDsjtcWrdMkRKd0n8/WMx2yriF98130vS1pT/jQa/B+MgCQKRoAmiR8s3WZAYFyBm7LpW6/iAciMaHFTc4icbX1h3PGbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
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


On 2/29/2024 4:53 PM, Jani Nikula wrote:
> On Thu, 29 Feb 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
>> On 2/28/2024 8:08 PM, Mitul Golani wrote:
>>> +enum operation_mode {
>>> +	DP_AS_SDP_AVT_DYNAMIC_VTOTAL = 0x00,
>>> +	DP_AS_SDP_AVT_FIXED_VTOTAL = 0x01,
>>> +	DP_AS_SDP_FAVT_TRR_NOT_REACHED = 0x02,
>>> +	DP_AS_SDP_FAVT_TRR_REACHED = 0x03
>>> +};
>> We can drop the initialization here.
> For stuff that needs to match the spec it's common to include the
> initializations instead of relying on the auto enumeration.

Ah alright, got it.

Regards,

Ankit


>
> BR,
> Jani.
>
>
