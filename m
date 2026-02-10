Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK21FSLJiml+NwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 06:58:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5648117367
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 06:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7E010E1E3;
	Tue, 10 Feb 2026 05:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOhEeL9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE6A10E1A6;
 Tue, 10 Feb 2026 05:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770703133; x=1802239133;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ik8xbfe7RjIqzy4Q6K6HGG7ZkQxC5glckChE6zER5lg=;
 b=aOhEeL9W435Bq2FM5+7UH3hj6bwV4tQdkavjmZm6Kfwif4B1nOzTgWQB
 +EDDDH8QSwC9OxQ6LVC12txVFe7gQlB0Nluz8oH+w4aVGYBcKoPt0RAxM
 Tbf8kWyVUBvw8os2BvVDe15MaS0UgJ7MUcfVxSSDFU9FBLfmQoF+07fPc
 zBrEIFmqFUBUob2yGzNbI/PEQArg1+svJYRFKALWLQVkA+dQk4Ic7lWNt
 RRTy+Jww8s+vbCeM1gmRmOC5YhP6HSMA2Pu23W8bMhM0Er8Gikcztjkup
 e89lOLqyHvympi17TkjJ4KoPZBqvVlVABkTNucL12vL1A9lAS73/w4M0V A==;
X-CSE-ConnectionGUID: B4tFuqqDSEeZTvTTdITZsQ==
X-CSE-MsgGUID: ZkJSHqhIRVqlZB1KLLK0Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75671628"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75671628"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:58:52 -0800
X-CSE-ConnectionGUID: lEXfysKBR3+VcXpTEt0hAQ==
X-CSE-MsgGUID: zEm6Cj6NRvekYU1UUuAvng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="210910253"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:58:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:58:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 21:58:52 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:58:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9tX0XpoWR1VH+2q0S4ewvQ+VnNAtTWJlj7kXm8jDEX+Fb7uscrzktnxCw7MzBSrxLaHPXc8+GHpuM/e2n9JZ5UyEGdtgkD7u1864WwEXS8z5iC47Qr2k7Jx4jHAObhJYkAcxyMIhkjc0VAEXBgronVVwi3WdG7avDYOebBPnCgGQhY5kdOT2vtyEcbAPkd6Gk0Sz/sxu1KBTVhBcKVW/eqVDyrYac/wO99N/B0yiUgnCNvwwlwyFRvy+VfkmOUsQIW6YCnpkOl/qP4jH5hNgWHItakFaBv799t81RgY+IJuSI9qUaygLJjEKDXSpRPrmZSJHZiq0a4sU8LE/TbErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHvC0W46QSnYyflFo9IZdGLPcBqs2hh85x+tNncO3aE=;
 b=HMb4q7B5rXCaOS01dqA5oiKQhProxia2vZBsEbpUZ82CvsFDeGBpFwfWQT+yfssaGosGGK3IUnW04Q0VYKsKLDL0XNsLRO9VwudByAFxUA7Q2OkbvpjD6Vy5szDEvJrQaB+xvMu1SGvMbs8ibcsy7VkybhszfAE8DDYZD7rW3sG7C2jFN0oEvzw4Ui8W9AJl1FPk4tSUyywtxqEtpmZb185/O4VhVl/egDQph0BIYv8Z3A0XOcf+ajbrGn6BTQH2R+1wxf17ynUpXCyxYa29MifAuLOZeykKkckTxCniBLcRgIrE1+QjgyT7qn7aj1ByB3aB151B3f3vZia8l+3EjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by IA4PR11MB9154.namprd11.prod.outlook.com (2603:10b6:208:55e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 05:58:49 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 05:58:49 +0000
Message-ID: <90eaf920-2bc3-4d33-9a64-f6373d704dc0@intel.com>
Date: Tue, 10 Feb 2026 11:28:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/xe/xe_hw_error: Add support for Core-Compute
 errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-11-riana.tauro@intel.com>
 <aYS3sm6QO0d947hM@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aYS3sm6QO0d947hM@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|IA4PR11MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c75232b-6aa1-4f1d-9e6d-08de686975e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHVWSlMyVWYycmFMTllMbTF3enZBbWZuNGZKZE8rZURqc2V5VlVOY0ZRdlpQ?=
 =?utf-8?B?REEwR0YvNFFURFpTbEF0MXZTOGVRZ0QxOVhUVmRiRG9FdnZSMVhUL1RqOUVN?=
 =?utf-8?B?bU9uRGVjQXFHQWw5ei9RNjZmUEMyUWo1YVRrVUhyeng2ZHZaSmNweUN4MzY4?=
 =?utf-8?B?dEJZMXd4cDdwWWhqTHFpKy80K3ZXbWRNbVV5blpMRi9YbmZLbDFSMzFweHR3?=
 =?utf-8?B?S1pLMjI5N29FTnhOVXViNHAzdlpnNURnYUJSNkpwMjJDQmo4MThXMnhNbTdB?=
 =?utf-8?B?dlhSeTR2TzFhNUdzVW5RN0xSR2V0WjZNY3QzSVA2TFZuNmErdnVadGNzVEhi?=
 =?utf-8?B?WmtQOXlreWR4SDFTVEEvNEZxVXdaUlNUYW1qcnRNN2pUWXVoc3g1UG95MFBG?=
 =?utf-8?B?OWJhZlRVRTR2YlY1aDAySFN6bGRtQ3hwZHhaeVFIZmdMVzc1NmJ0T0RCNDhk?=
 =?utf-8?B?V2xPYkZmRVhaQjB0ZVIxcVJjcG1xK1YyL1U4NWRqbEdIN2Eyb1JHcTlDRFZ5?=
 =?utf-8?B?UjR5b0RRUDVFeS8xVjBFSGNNaE5QWlRkQWFHczFvbTlEVURCeUs4LzZUYUs5?=
 =?utf-8?B?RXJEbmZJMFQ5aUlIZVk4aDNmTC9FN3k4MFFXMWFMKys3K08wNGQ0S25jR1kz?=
 =?utf-8?B?VUdLWmNIckwvamFFVFhOUjFxcG5IN2REU3FUWndSamgzcTIrVE10WmdhV3FU?=
 =?utf-8?B?YzM2V2lKNEdYVEJWaVF4VGpNc3pVSEJ0bkViWGNTNmV3dVA0ZVhmNXFKZDll?=
 =?utf-8?B?L2hVMUVFQXdkYmhRbU10cTdKOFRsdHI0N095cU1kQ3ZJODN6M0tYWlZmK3Vo?=
 =?utf-8?B?OTNHTEk1dUF0L2NoUExLTjNrOVlSSXlMRWxRYUxBM3VZR1lIYzJ4NkJsKzh6?=
 =?utf-8?B?V2grSVY1VEJoSjZ2ZFJFWWhvZi9wTm9acmlBaWFQRXpaR3B3K21KNWhJemxO?=
 =?utf-8?B?Y3ZTZTZIQmlTMCsvVDhYUzIzY0hqd1BDWFpJYTVaMllvK1duZDNSbU5SbUcx?=
 =?utf-8?B?c2ZlOEdKYWdTd1BONnFBNjVoSGZlc0VxeWNOeDBVakExd1VpKzJ2VCtmdWw0?=
 =?utf-8?B?YWE2c0VUcS9rTWtFUjBOVWVXc1hKM1RTRDJKa1JFU3lkK2ZrWE01dXV6Mm0v?=
 =?utf-8?B?TXZkVU1xWkJuVGg1eHBua1BHaGdROGFrQkhSTjRBVXlGSXVubGZQQURVQWU0?=
 =?utf-8?B?N01JV0k4dm8vd3Eza0UvM1Z0Wlgxai9xSjFaRW9EODZkOEhFTFBINVZUaEUw?=
 =?utf-8?B?MXNzdUdLZGd6N1o5NGpxV1BEREQ5YXJmOGxvZEFXSlRGb2tBbTQ5cm9TRVZF?=
 =?utf-8?B?cC8vbC9tYnlkNFRBNGVNcjJoTllvd1YwSHVhVW5NTmpuWUlFaXhyajdqY1RV?=
 =?utf-8?B?WUhMelYvVktnRlg0dDVzK2ZIVjB0a3RkcmpPODJGYjFUQ1BnUGkva0lyMENY?=
 =?utf-8?B?dkU3SEZiNUQ3SlpPU1kwRnYxT1dpaElMUjdGMVp1RTJka2lhY2R1MDNJcGdu?=
 =?utf-8?B?NmN0ckxQSmV5amFuYjBmaHFZekE2QWVFRVhVVmVRaEREQjhSMnN0VytPemJa?=
 =?utf-8?B?TEN6N095SzZhQTVkYk9STzc3ejlwVnhuS2kyWSt5dFh0M2theE9hRkJqaWNm?=
 =?utf-8?B?VHFZMEczZjVpdkVhK2gwbmFNRWs1MWQxd3poUXp3TCs2Z0RvaHNpc2FEaXc5?=
 =?utf-8?B?elpoRkpCenE3aXVkNXFqMVpqRXF5dm0xRzJ0UlRHUysxTGszek0xZlNLK3hO?=
 =?utf-8?B?UHEzSVB5NnhsUnVYSmJ6VWZHZkVLU3RxRHBOTDNVUGZlbzhOTXRGejFGeExO?=
 =?utf-8?B?Mm5yUUV3d0p0UUhaeXd5OTd2ckJYNDlVRUQxclNraEdzeXhZazBNeTMydDNx?=
 =?utf-8?B?cmJyczZpY0kva2xLU0pqZWJiYzM5Q0VKUFM5Z0YzNG1PeFYyeXBXQWdjZElZ?=
 =?utf-8?B?Y2x2V0JxTkUwMWxsYitzZFBqd2hsTmRMUGhqM0JwT0JKVmtRdGVuRllDWGRL?=
 =?utf-8?B?VnhCbGZGWmxLR3Y3VCtFNHFrR3paOEM5MjFWMVdWb29TUkxJSVozdjdSZUlD?=
 =?utf-8?B?UlovbzN1cDZXd09kRkxZRlI5VzVkdnJqUXFnejBuenNRejgzc1h0OE5mblVv?=
 =?utf-8?Q?4Yhw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzNJMGpsd3ZNaW9tR0pZUnorV2JKWFp2Y25FTldzVXBtRytmVi91VTF1bHlr?=
 =?utf-8?B?NlpnNFY5MmJrbUZKUFZ1WnpQNHQ4Tk9IVDc0eWxaTnEwbXV3YnZoNVQ2NGFL?=
 =?utf-8?B?VmpQZEViS1RRTFVSbDY4alBNLzlPMmtkZTJoSDVuMEREbjVqaFlFMVFHTlpo?=
 =?utf-8?B?U0Q2MU1nSEg3R0lQc2F2eVRjNU5tK2kxYUVlWm9IdktIcHZ3UWJOTVZFL0Jx?=
 =?utf-8?B?V3FBa1B0M0UvSVlzbVpOUUlkRUYrZFFjZ2RRM3lwV3JvWkVnOHhlYlNxYllF?=
 =?utf-8?B?TmVGZVhlT2tBczA1WHBMQ3AxYVp2VDBQZitTRlhZV3dnVi81T0dSZ0RxN08w?=
 =?utf-8?B?d01mRHNBUS90ckR6Sldpczd4MEo4RFZDYVpvckE0NThZeVhGTVhGa0J4Sk12?=
 =?utf-8?B?WkpERTJNQ0xpRnlucVp6TTh6SHh2UHAzUktEMnFmeFNtUlZtaHBmK2o1ak8w?=
 =?utf-8?B?Zkl3R0w5Uy9NMFVCNnRDVkFmaUxoSGI5K0Y1WWtpQnV0cUZTZnFqczhReXpn?=
 =?utf-8?B?UzlpTXhRR1JMeGR1S1B2ZjQ4aGNJZjh0MGVHNnMwNVEvdnFOV01WUldqdklJ?=
 =?utf-8?B?MVpUQXJTVE00bkJxYVdHY29xQXZNditUdmpzV2pUbUF0TWlRbmdqdFVHVXlQ?=
 =?utf-8?B?b3NMNm1DS215bDNyYVRHaWIwYnY4UWV4cGxITlNrUysyNHFiMXBZK3BLWFpD?=
 =?utf-8?B?RHpJRDNHOXlYTGIyWEtkdWNvSGtEbVBLVWtoTlJOUEhEQ1NCa1NoN01wTGF6?=
 =?utf-8?B?QUlXaWM4OU5uSEJkd01jVzc1WUhSbGNkVWljSVRIRWVBL0FaS1ZCZWNSQ3c0?=
 =?utf-8?B?UG9SWW5rOTdGOU9oTE9yUVM5T0xIekE5UWRpNVRoTWViMG1lQzcxc1lISG5Y?=
 =?utf-8?B?Ui9vcVk0eThNL1BMZng4czV6VVpNRzFRR2hPRU9leUV0WUg4VWEvditaTm5z?=
 =?utf-8?B?RDlNMnd5d0xMNU1yWkNZKy94Ny9KZUlkaHRnN1ZxczE4cmpTVGcrbStPcVM5?=
 =?utf-8?B?aHZpSklkRCt4cVBTSGRBNVRjeko0Y1lGUTNFUzJiTk5CcUhJdW1SbmdDVis1?=
 =?utf-8?B?MXBNMDc4Q0xoUExzczZBRE1EOWJWc0w1UHNva080K012RmpXbGxFV0hGTG5O?=
 =?utf-8?B?VzR1L0dKbDZOVXZaMWZmU0JoWkxpaVFBYWtEN2lnbzMxYmZKMWNvVUdLU1lW?=
 =?utf-8?B?aSs3dyszajVoNDhpZjVIYld1cmRQUzZKK3diSTE1SURyc0hGUlNYSkhEUGFa?=
 =?utf-8?B?WUxJN3Y3Nll1bGlVRzV5MWRJNlNZMnd5dThxdkxOcm1veERkSjgzSlpuNW1W?=
 =?utf-8?B?azBCT0tBZXZoaHF0TndRQ0RFcldld01xQUExYWtUbFBrTG8wWjQxTEcrMnBI?=
 =?utf-8?B?L3NCUTVHUzdRc2t0L2EzQURubmNmYlhabEJXdTYzUnpkNUxvdW4vbzJkRU5z?=
 =?utf-8?B?azhRUWRIS0VIa0RaVENBTHVXNnBLai8rbTNLQlhlQ21rcTZBYTgzMWxXSjls?=
 =?utf-8?B?cDZSNUNPZVdEK2lmdUFDemNxU3BGOGY4NmN1YkIraE1kbFJhRjJjeEo5ZGFz?=
 =?utf-8?B?c2tlZ2U5RDg0T0xXMDROalM2TkdiL09TRlE0cWVvMFBVUWhnMGRSS3dIZmNm?=
 =?utf-8?B?ZGVXNERaSHI2UkRUTDh2ZlB0ZFFsMTE3UXp1bjkxQktETXVFeStsekZ5MGJv?=
 =?utf-8?B?Q3dDL3pNM0gyQTNYM0g0Yzh4anhsUmp5cW5JWjEvMjF0UGNzaUQ1bFQrbWxp?=
 =?utf-8?B?OUpPcDJIZUJRV0pMYldXR2JDSTJGaWhNN0NKVlk3M0EyV1pmWUUveUx3eUEx?=
 =?utf-8?B?T2M3K05OaVhmWmJkK0JRQkExWURha0NHUHdMWGpFWFVQZS9vMlhBTGNFWS8w?=
 =?utf-8?B?Mm0zN3pPZWRUeDJodmlEbXhvNEo4aFprQzcwZ3dMWU9yV0ZwcDF4VmhjdGQ3?=
 =?utf-8?B?cnd2Z3RiWkJNUUIzdVhFZEVWelJubDlGdk1xTEZhM25yWUd0R2d3b3IyZUpr?=
 =?utf-8?B?L3hPT2l1MlAwRVZCTVdDU1M4TnZnSitYdTFtK2NXK2EwQ00rSk1WdXk3a29B?=
 =?utf-8?B?bEZPM2hxQUZMTDdWdjh6K3pxRk9hSlZQclRsTWdJTU02TGNrYS9uQWducHRH?=
 =?utf-8?B?dExHSGY1cit0eUFqQnJjMTBnRExSSmVEcjRORzJDU3NSb1FUTHRKT0Y0cGEy?=
 =?utf-8?B?SDRpczlYZjBFL3hIKzRoK29uMTlmaTJmcE9xbm5RVktVd1hLeHByYVZzVlRE?=
 =?utf-8?B?c3JyMnVOeXZXdU4wbHpOR2gzclNxSmNlYis0OEI0V3NrTWVnaTJHU3lHYW05?=
 =?utf-8?B?dnFxR0ZoS1BaSXI0UXZxWGFnSFcwam1OMjd6ZnFma1FiSHVqdEpYUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c75232b-6aa1-4f1d-9e6d-08de686975e4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 05:58:49.6849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilSoQ3higCGDlEf3TzHhoe0WwXjGHz8dDqCJlJ7g4aUXPRGWTZpWR52T4LYnDS119GKgYCSGNTGshRDcH5Ix/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9154
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: A5648117367
X-Rspamd-Action: no action



On 2/5/2026 9:00 PM, Raag Jadav wrote:
> On Mon, Feb 02, 2026 at 12:14:00PM +0530, Riana Tauro wrote:
>> PVC supports GT error reporting via vector registers along with
>> error status register. Add support to report these errors and
>> update respective counters. Incase of Subslice error reported
>> by vector register, process the error status register
>> for applicable bits.
>>
>> The counter is embedded in the xe drm ras structure and is
>> exposed to the userspace using the drm_ras generic netlink
>> interface.
>>
>> $ sudo ynl --family drm_ras --do query-error-counter  --json
> 
> We usually add '\' at the end for wrapping commands so that they're easy
> to apply directly (and same for all other patches where applicable).
> 
>>    '{"node-id":0, "error-id":1}'
> 
> Ditto.

Will fix this

> 
>> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 0}
>>
>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: Add ID's and names as uAPI (Rodrigo)
>>      Add documentation
>>      Modify commit message
>>
>> v3: remove 'error' from counters
>>      use drmm_kcalloc
>>      add a for_each for severity
>>      differentitate error classes and severity in UAPI(Raag)
>>      Use correctable and uncorrectable in uapi (Pratik / Aravind)
>>
>> v4: modify enums in UAPI
>>      improve comments
>>      add bounds check in handler
>>      add error mask macro (Raag)
>>      use atomic_t
>>      add null pointer checks
>> ---
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  62 ++++++-
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 199 +++++++++++++++++++--
>>   2 files changed, 241 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> index c146b9ef44eb..17982a335941 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -6,15 +6,59 @@
>>   #ifndef _XE_HW_ERROR_REGS_H_
>>   #define _XE_HW_ERROR_REGS_H_
>>   
>> -#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
>> -#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>> +#define HEC_UNCORR_ERR_STATUS(base)			XE_REG((base) + 0x118)
>> +#define   UNCORR_FW_REPORTED_ERR			REG_BIT(6)
>>   
>> -#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
>> +#define HEC_UNCORR_FW_ERR_DW0(base)			XE_REG((base) + 0x124)
>> +
>> +#define ERR_STAT_GT_COR					0x100160
>> +#define   EU_GRF_COR_ERR				REG_BIT(15)
>> +#define   EU_IC_COR_ERR					REG_BIT(14)
>> +#define   SLM_COR_ERR					REG_BIT(13)
>> +#define   GUC_COR_ERR					REG_BIT(1)
>> +
>> +#define ERR_STAT_GT_NONFATAL				0x100164
>> +#define ERR_STAT_GT_FATAL				0x100168
>> +#define   EU_GRF_FAT_ERR				REG_BIT(15)
>> +#define   SLM_FAT_ERR					REG_BIT(13)
>> +#define   GUC_FAT_ERR					REG_BIT(6)
>> +#define   FPU_FAT_ERR					REG_BIT(3)
>> +
>> +#define ERR_STAT_GT_REG(x)				XE_REG(_PICK_EVEN((x), \
>> +									  ERR_STAT_GT_COR, \
>> +									  ERR_STAT_GT_NONFATAL))
>> +
>> +#define PVC_COR_ERR_MASK				(GUC_COR_ERR | SLM_COR_ERR | \
>> +							 EU_IC_COR_ERR | EU_GRF_COR_ERR)
>> +
>> +#define PVC_FAT_ERR_MASK				(FPU_FAT_ERR | GUC_FAT_ERR | \
>> +							EU_GRF_FAT_ERR | SLM_FAT_ERR)
> 
> Nit: Whitespace please!

alignment?

> 
>> +#define DEV_ERR_STAT_NONFATAL				0x100178
>> +#define DEV_ERR_STAT_CORRECTABLE			0x10017c
>> +#define DEV_ERR_STAT_REG(x)				XE_REG(_PICK_EVEN((x), \
>> +									  DEV_ERR_STAT_CORRECTABLE, \
>> +									  DEV_ERR_STAT_NONFATAL))
> 
> I know it was already like this but how does this evaluate for FATAL?

#define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
(index, 0x10017c, 0x100178)  = (0x10017c + index * (0x100178 - 0x10017c));
0 =  0x10017c
1 =  0x100178
2 =  0x100174

> 
>> +#define   XE_CSC_ERROR					17
>> +#define   XE_GT_ERROR					0
>> +
>> +#define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
>> +#define ERR_STAT_GT_FATAL_VECTOR_1			0x100264
>> +
>> +#define ERR_STAT_GT_FATAL_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
>> +								  ERR_STAT_GT_FATAL_VECTOR_0, \
>> +								  ERR_STAT_GT_FATAL_VECTOR_1))
>> +
>> +#define ERR_STAT_GT_COR_VECTOR_0			0x1002a0
>> +#define ERR_STAT_GT_COR_VECTOR_1			0x1002a4
>> +
>> +#define ERR_STAT_GT_COR_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
>> +									  ERR_STAT_GT_COR_VECTOR_0, \
>> +									  ERR_STAT_GT_COR_VECTOR_1))
>> +
>> +#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
>> +							ERR_STAT_GT_COR_VECTOR_REG(x) : \
>> +							ERR_STAT_GT_FATAL_VECTOR_REG(x))
> 
> Ditto for whitespace.
> 
>> -#define DEV_ERR_STAT_NONFATAL			0x100178
>> -#define DEV_ERR_STAT_CORRECTABLE		0x10017c
>> -#define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>> -								  DEV_ERR_STAT_CORRECTABLE, \
>> -								  DEV_ERR_STAT_NONFATAL))
>> -#define   XE_CSC_ERROR				BIT(17)
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 2019aaaa1ebe..ff31fb322c8a 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2025 Intel Corporation
>>    */
>>   
>> +#include <linux/bitmap.h>
>>   #include <linux/fault-inject.h>
>>   
>>   #include "regs/xe_gsc_regs.h"
>> @@ -15,7 +16,13 @@
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>>   
>> -#define  HEC_UNCORR_FW_ERR_BITS 4
>> +#define  GT_HW_ERROR_MAX_ERR_BITS	16
>> +#define  HEC_UNCORR_FW_ERR_BITS		4
>> +#define  XE_RAS_REG_SIZE		32
>> +
>> +#define  PVC_ERROR_MASK_SET(hw_err, err_bit) \
>> +	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? (BIT(err_bit) & PVC_COR_ERR_MASK) : \
>> +	(BIT(err_bit) & PVC_FAT_ERR_MASK))
> 
> I'd write this as below and move it to xe_hw_error_regs.h

This is not specific to register selection or defining bits. It's 
related to mask. So .c should be the right place

> 
> #define PVC_COR_ERR_MASK_SET(err_bit)			(PVC_COR_ERR_MASK & REG_BIT(err_bit))
> #define PVC_FAT_ERR_MASK_SET(err_bit)			(PVC_FAT_ERR_MASK & REG_BIT(err_bit))
> 
> #define PVC_ERR_MASK_SET(hw_err, err_bit)		((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
> 								PVC_COR_ERR_MASK_SET(err_bit) : \
> 								PVC_FAT_ERR_MASK_SET(err_bit)
> 
> ...
> 
>> +static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>> +				u32 error_id)
>> +{
>> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	unsigned long err_stat = 0;
>> +	int i, len;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return;
>> +
>> +	if (!info)
>> +		return;
> 
> Since info allocation is not related to hardware, we shouldn't even be
> at this point without it. So let's not hide bugs and fail probe instead.

yes currently it is supported only on PVC. I can remove this here as 
there is a PVC check but cannot remove the one suggested below.

Thanks
Riana

> 
>> +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
>> +		atomic_inc(&info[error_id].counter);
>> +		log_hw_error(tile, info[error_id].name, severity);
>> +		return;
>> +	}
> 
> ...
> 
>>   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>>   	const char *severity_str = error_severity[severity];
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	unsigned long flags;
>> -	u32 err_src;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	unsigned long flags, err_src;
>> +	u32 err_bit;
>>   
>> -	if (xe->info.platform != XE_BATTLEMAGE)
>> +	if (!IS_DGFX(xe))
>>   		return;
>>   
>>   	spin_lock_irqsave(&xe->irq.lock, flags);
>> @@ -108,11 +242,53 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   		goto unlock;
>>   	}
>>   
>> -	if (err_src & XE_CSC_ERROR)
>> +	/*
>> +	 * On encountering CSC firmware errors, the graphics device becomes unrecoverable
>> +	 * so return immediately on error. The only way to recover from these errors is
>> +	 * firmware flash. The device will enter Runtime Survivability mode when such
>> +	 * errors are detected.
>> +	 */
>> +	if (err_src & XE_CSC_ERROR) {
>>   		csc_hw_error_handler(tile, hw_err);
>> +		goto clear_reg;
>> +	}
>>   
>> -	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>> +	if (!info)
>> +		goto clear_reg;
> 
> Same as above.
> 
> Raag

