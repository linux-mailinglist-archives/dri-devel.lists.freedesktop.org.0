Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58456C946E7
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 20:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BA710E0BA;
	Sat, 29 Nov 2025 19:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHqaZiHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631FB10E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 19:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764443432; x=1795979432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bGVepmpH7PKY83PtCilpR/Ko18weo6jQ5IQL1yfAp0Q=;
 b=EHqaZiHw3RuL+QQ5AFy2dFpNWMrxLPptDndf7oJE+4uDf36XMMUgLJGq
 2Rzg+AlYUy4sDXIeRJts+dysTQOmX2VyEMsxuuHTocXkkIu5UaU4moO8x
 thKD/ZMQXkDcCDRqb7/7Y6vNJIuFyJjXE1wdEVo5FBB/CAuZxgRDaiE8K
 zYsVX0X1764pDg82BGYKfJzSnM3bOnReDKT66u07vIXNsPG4rI7CY/573
 Hmo0OxtyoSkWFdz9cO3puDIEDTL3RTYGJz4JBjUUFWYZGA2E3Y0vzE/ZY
 WxKX3HXCHGH+PHEgqGODhqAmC7AMdNcRtcu0NZJN3j6uHf7JncWfY09Rq g==;
X-CSE-ConnectionGUID: tl28w/4zSJe10qeMNgf03A==
X-CSE-MsgGUID: ix1m5HzTTFy1XyVWFbAoyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66321348"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="66321348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 11:10:31 -0800
X-CSE-ConnectionGUID: TCJOE8UpRee2wFYxzFzfoQ==
X-CSE-MsgGUID: +n5dWmFXRmiQ/Mo0VvRy2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="230984119"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 11:10:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 11:10:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 11:10:30 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 11:10:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAhIgRngnaoaUj9qKlAFaJalN+yQfoPqRckulMb5l/f7Xfl7xB0OSvP/ravfLwIQYdOXcrZeTfzozx/6y/L6yUFjftAxN+Qav+6gUD5uYx16p3PmN50CpHKEn0XWWd5Q2Z5tuHM084u8CAhKEONbvvfd3Z88bXJy8e+hltn+DSOzRDF4DLPMzwzgGvhC38dCR3PEccvLHMheD5z0vXGQxQJIQTlKeEpa74lp538cZG7hGrZrJ8Oq4KiikYyeqieyoIXHyplzH9KinVW6MUGYBgoQ8GdNoevF4BGbAYjlXSDVUrwC6R5OUZcdFT6YQ4US6oL8egZTKt4O+R2Lyh3JHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT5h9m+hA788dqoZi9+5gG78dDzjYlfNtEX0fjpwYdk=;
 b=lo4kUSqyT/nv8l8uvBX/eutOIq85yAWKoeohIhTMNYxIz7chMoFQsds4mg9tMgb3WJy7HNWgPkDzBXaXohjwANzyTkDnVeewelHJ1Qsv0AG8Z4ZlWoR3/pyIZExdVHX+RyV5zUOliLjqHYLcYQnOag12TpglhaoWZX5oUjoXuozngJf7je60iCy1HUWvXWIzZZL/pLQqVfUOwelAP29epZtcrgxarrg+1ofzale9jRqdn6ZonIPudvcOuf7p1X2rfq1sqdzpcxs7D1NxbWbk2E+Gz+qMQ/S5qlOL1rDppMEWbeK9GJ+tbJT8VXotQMC21phzv3KtzXHf3Y7M77kk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 19:10:28 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 19:10:28 +0000
Message-ID: <4a9f0ccf-5852-43fc-8e19-45d74824253a@intel.com>
Date: Sat, 29 Nov 2025 21:10:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] accel/habanalabs: Replace kmalloc_array +
 copy_from_user with memdup_array_user
To: Thorsten Blum <thorsten.blum@linux.dev>, Koby Elbaz
 <koby.elbaz@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Easwar Hariharan
 <easwar.hariharan@linux.microsoft.com>
CC: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20251103091526.2393-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
In-Reply-To: <20251103091526.2393-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::6)
 To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: 17925072-872e-469b-de21-08de2f7af568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjM0czArVkM4SVJ4VTdkVDhQa0JFMnZwRVVMYWtYZkkvazlHVFBDN2tkSXBi?=
 =?utf-8?B?Wkt4Sk5QUmNma2R3OWRsUnR0Z2lBYnN2Y25hdm9OQXBSaGtYOXozdTFLRXRF?=
 =?utf-8?B?RUZBQnlmbmFwSklRTUtzdEtjd1M2M2oraHNYVnR0OVFJdTIwVHlrZGZ4UXBi?=
 =?utf-8?B?SDRGb0pDdkljQXkvNnUxYUVENDNaTnlvS21VNjVPWmN3Ly9rY2tNUjFsa3Jl?=
 =?utf-8?B?ZzlyalBrd3ZBQzNOK1hRRUxUN25EZE53VUV3SnB4RG9NYUwvNDNvY0Nvd0ZF?=
 =?utf-8?B?WmR6MThaK0kvZGQ1bmJUcS8xZUlCYldrdnN1QUttTHM3cmpILzQyMnZYdHJj?=
 =?utf-8?B?R1VXL2NWRy84a1VHTUluL2d1YUhQaEpsblVKekZPa1Z5K1o2bEJmRlY4WklM?=
 =?utf-8?B?a080dmdoOEMrbElOQlE1b1A5OHJ4V2l1SzhuZFhZM2NobWxIWE1RWDBaNUlL?=
 =?utf-8?B?dmdiYVBQMlZoK1RYaFRGSjNVaFpLQllIZlIrU3V3QjI0Z2dvaldhTlNOTnVw?=
 =?utf-8?B?N0ViS3hTTXYyV0t2elhRdFkzRlQ2bnJSQ3pCdEJkQXRwNU1XOXl1YVB0eXpO?=
 =?utf-8?B?K24rcWU1WkNwMGFKUEl0bUp6V1JZL2hoSlVlbXp1a1UrUm00a3RmQzJqSjEz?=
 =?utf-8?B?c2VyUk9IUVVFbENoaldxajFGMzRQRkh3L29DMk5UZENxeElLeUV1cHNOVDZa?=
 =?utf-8?B?WDJpS0hTVlBZb2JGYVE5NzlidDhLV3JoSnJEU2puMW5mckk0U1g4cEFTdVFm?=
 =?utf-8?B?Y1pMWTZFYmxtZlYrL3VxcHlER1hnZ2xldFE4eENSTEZ6d2JCcHBmbFhuc3Nt?=
 =?utf-8?B?K2Zwc2JJKzdieUozbnZBS1FnV3pGYlZlVkdHWUZtZmc2NkJneGFLclFDOS9C?=
 =?utf-8?B?NFVqR2NvRUZMVTNHM0xBMEIwVGlrcEFZSk9aSVNRM2s0bTVla3g2WTFUUmFn?=
 =?utf-8?B?ZUlRNWpZUXA2bUtEY0ZQdGZYZG5jRUwwRG8rWmtyWGs0TkpQR2NoN1pweDBj?=
 =?utf-8?B?TXM4ZWVJTGZLOHZrbzNZeUNyYlBXekNTVmFkWDBabFFoU3lKVzZ3d0hYZzVZ?=
 =?utf-8?B?OHliY0hodWQxdnc3d29sb0FQc1lzR21ZTUNIM3N1bDJLdXlmYUozMzBLK2xw?=
 =?utf-8?B?Mjl4WFpCNGRYbXdzbm1qQUtLYmJCVHEzU2t4YjJQRE51N0F6MzhSR1lpWHZF?=
 =?utf-8?B?UmxLTkNWZXRnK3NQV2dTam5CejBLQ2tUcWFaN2FyenNmK2M4RTNqdzVVcXdN?=
 =?utf-8?B?T0M3MjZSVkRvdzJPYU16OFZEZzFuUkZsR2lFR0NWdGJ6SXdRUmo5dGx3UnFr?=
 =?utf-8?B?RGJnazI0amh0YUpkRiszbG51VWQ2VDNVNEFsb3dUbVhzRzF2SEh3eXNSY3U2?=
 =?utf-8?B?NW11SEVobWhLTStJR2d5bkhKaFBOVHl3ZCtYZjI1bGRqMFBsRjJjSitEUHZH?=
 =?utf-8?B?Nm9KU2V1MkVqeEc3bG93OTVFWGdIZ2R2c2Z3WU5FTEw2NnErMHFjaVBRUkRU?=
 =?utf-8?B?LzM2QkozMWhRV2taL3ZHdDFOaFhneE8zemhsOGJLMVdYMW9EQW01MVJ0ZUZv?=
 =?utf-8?B?ODdXNjlBbDR0OS9NUHBFZWJCUVVoRmR6TVU2RkcvMThHdVI4a0FERGZVVkFU?=
 =?utf-8?B?cm5KZC93cmVCV21valNuWVZRZkxta0xJZlhKSmpCclRmeFMvQ0dMRUtCOEVD?=
 =?utf-8?B?NWJGdHVCQzhFaWVXV1VwdFFleENvWEpWTXBocmlWd3NLRksxeVd4Y3JWa0Fm?=
 =?utf-8?B?QVQ0dzg4ek1lV1BtaStOb2YxanEyMndTb2JaT2NKaXM2YnVkcllNTUpySURs?=
 =?utf-8?B?Sm54UlhXc2lwOGkrUTRvckVSNGgwa0EwTmpVRXdFTnUxUnhyMFg2Y1pWU25o?=
 =?utf-8?B?WHBiRmQ5eWp2Sjc2ZXBYRGI1bVVnb05RdlU5SjR4MmJUc0MvR1IrUm9XekZM?=
 =?utf-8?Q?GZUPSJHeeayG/0XQ4ZWzgoAO8BBgMmc7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckpsemZxVld2QmlmR3k2VUtQWHlZSEd4cVhGamRMK0FnWnZpYVZjR3NYWGJ2?=
 =?utf-8?B?QXBpVjlGQ3d3RmNiNytKUkgxaUZHcU10SEJCV0RKUFQ5T044UE1FREZwZXhV?=
 =?utf-8?B?eXJlejMyNjkrTXBpQm8vbTJ4YUJsUWdaNVI4cW1sY1NtT0pSZDQ5WkJrYVpv?=
 =?utf-8?B?YzhWMmtQYVdoNktEVlR3bHRDa2M3SlRhOUxyTjJhZDNTVWpQdmQ4aGxJcCt5?=
 =?utf-8?B?eFJndjRTNTFFcVgwQ0hVUU0rbENZeUxuM3grOXRDUjVUQTBzRmZyZkNkNjFu?=
 =?utf-8?B?dDREM090MVFVU05PMFYwd05NaGhRUFh6Z3RxNEtIeHdQOTdvRW04TUNQNkMv?=
 =?utf-8?B?ekRxaVlNTkl3VkdMeHpRZllJWlJsQVMxNUN1Ui9qYWMrRzhBNFZsY2JlV3Bs?=
 =?utf-8?B?U2dOWS8yTnpWYTliQ1U0UjhPbDEydU5CcTdCQmN0MGoybUxMVi9rREtHdWtk?=
 =?utf-8?B?ZUdNV29GQng3clJnR1pkSSt2TzlrYlgvNllGNUYrdGszRE11RXBKeWdMNURz?=
 =?utf-8?B?R1h2Wm1PQk5aSVZSMTR2bllRMkVRbjQ2c0t1WWZzQStXZjFITTNKeTlUajdk?=
 =?utf-8?B?OE1VUXh3WDVBRDV1YWl2Vk9xTnlyV1ZwWFpUTHJIQlZhRjBPTnE1MEEvQmQ0?=
 =?utf-8?B?VVNJKzVDZmVwc3h4aUxLQ0hRU09FRkRjWmp5Q2lhR2RXR2RkdXFKUDV2ckVu?=
 =?utf-8?B?R0gvMVhLVytadk1XUFN1bHVEWXcwMEVBY1Q0QTBPdHNENXZYenBqTDVyYU9Y?=
 =?utf-8?B?ZlphTVMwRlRvUEkyS3krVDBXZU1acnNMNUxZNW14WTA4anR1ckR2aWRWSlhy?=
 =?utf-8?B?ZGhjSXFHMXI1ZWo0a0hUelFacmhXR0ExLy9iUmh5WlVNQVY1ck1sbXBmeE1j?=
 =?utf-8?B?elYwcjB6VkEvZlpoOWdOWGRGUGZHWXpFYmdTSWNsQUo1OXN4dzN1ZXh5cmUz?=
 =?utf-8?B?cS9POExJcWQ1a1NENEFqMVJFdFpJSkMwdnlmOFk2TEZ5OUIwcWtjdSs0Mm4v?=
 =?utf-8?B?NUtjSnVKTFlxblM2azQ1LzNPdi80eERUSUR0QkFjbVpuSW1QR1BCdTlBdE9F?=
 =?utf-8?B?UURSS3UwcGxza0F3UnhPbldhTFpINzU3aUVRZXpFUnFXa2lxUm12MXBGZkJP?=
 =?utf-8?B?WmFSYTZLa2VWVlBETDFCYlUxTHhqZjk2Q2ZYMHpTVVRhcG4vQjVUREp0UFBS?=
 =?utf-8?B?MW9acXAyazI0OGQwY1kzeW94aWFNSk43MnQvRVFVMTY2cGlVT0loUHNVRGM5?=
 =?utf-8?B?RDU3bTlIS2F0QkUwM1NrMTc1c2Npd3UwVThmOGVWNlZUUHVPNExudSsya3d0?=
 =?utf-8?B?OHp5b1ZNUElXYnYycjF1TDJvWHovR3JWa1FOcE1CWGZoUTdwRlpGd0g1MVJU?=
 =?utf-8?B?TVpqNUJCWjg4Zy9mTk10WjlBSG9XdzZwUm1KQkozcUxIZW5oZUpWbWFTbmF2?=
 =?utf-8?B?Q1JoTzlidlM4bW1zZVMzNE1sWkJaRzdHd1FhQ29ZOTF6Myt4VmtBZWk4ckRQ?=
 =?utf-8?B?MFRZY1VtdzZuY2c2a2VpVlE5bU8rb1pkcFZ4TGFEYi9qazVZbFhnOGhnY0Jk?=
 =?utf-8?B?YnpDRVJHZHRLbW5nSGlDbVpnY0VqTFdFd0ZWc1NEQ3FlV1YzQmtic1gzcVFB?=
 =?utf-8?B?Mkw1QlF4SjdXTEoveUtQZEZWTkduZFFiWHllQ3F1RUNPMHUyMEhKaXd6UWdO?=
 =?utf-8?B?UlgzN1RkWnAwSnNtaWM2UlhoSjNZK3dCNEZtQ1hZcWhKRzd0enc2ZVFlTXBr?=
 =?utf-8?B?bW9PbXhYNENGQnBia0lSZ3dSSzFKdCtPWlU1QWtteWowOEhuaFg2aTJBNTdp?=
 =?utf-8?B?UGUvMkJFdXIvOWY3VjQ4cWhUT09ON3VHcVdUU3VUV0FvQnFYL290bDVpd3ox?=
 =?utf-8?B?OWprKzlEZGpoT3JJM3Njd1BwelFjMzNTcldLT3BZYTdMK1lSSmI3M1JGQk8y?=
 =?utf-8?B?Vm5rdm9pYmFJa1UrblBORnZ6c0ozcjdFUjJ3LzNqK1VtSy9OYksvNUFyVG9q?=
 =?utf-8?B?SGFIUkhUNVhjaHpnK0Nlazl6clREcUwvcUdPOWIzdFR1UWZNT21QRjJJVWxS?=
 =?utf-8?B?c3RkbDNkdHUyTm0wWXFRZWhFVlRWVlVDanhjWVI5REwyYTU2dzZlV1JqcUxN?=
 =?utf-8?B?bEVsV0ZnZjd5V0I1Y3cwNzhPTDkzSHQrUVI5Z3ROdlV5aUZ3Uk1GTktvUjRW?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17925072-872e-469b-de21-08de2f7af568
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 19:10:28.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMA7b7JDjvaUNzxGRGWcZLwVjVz8YFLVw/e0L5tF+b3YdTPW251Xqjcr7Wo31crKmoAADQ8pYn3dfLZW2Cd+BoCl9zQYiXhva6h/2dL9IUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
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

On 11/3/2025 11:15 AM, Thorsten Blum wrote:
> Replace kmalloc_array() followed by copy_from_user() with
> memdup_array_user() to improve and simplify cs_ioctl_engine_cores(),
> cs_ioctl_engines(), and hl_multi_cs_wait_ioctl().
> 
> Remove the unused variable 'size_to_copy' from hl_multi_cs_wait_ioctl().
> 
> No functional changes intended.
> 
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Reviewed-by: Konstantin Sinyuk <konstantin.sinyuk@intel.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied to accel/habanalabs-next, thanks.
