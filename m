Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F642C3815D
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 22:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5AC10E32F;
	Wed,  5 Nov 2025 21:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceZxKHo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED4210E327;
 Wed,  5 Nov 2025 21:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762379158; x=1793915158;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mpfqhGw9NasQ+Bq4TWy/Yi5i0K9D253agzQntsVbsGs=;
 b=ceZxKHo8R58qYXbh/FK54CI9FWgfcGdGAJQ2KWmvMp8Xq/WWKF7NhSYG
 MC+8nNLdxuuOW74roK7ZrktPMxjEbuIv+H4pbsk+YA/NP32y50AeEdZlu
 yMbKyUHmBrkgXH51n7QrmppUpWRL6djxui7p/Z7a3mDhi/vwXY9lEtEpm
 490Bjj40jd6DDnC5HvNnoDik9G3gvfZYG3x931l4mS4yG4G5YChTJ2azz
 QyojKr4O01bQuvqT6k+XUNrDHG4SownQHLtS+G5cwFZfOuObmpJ2wlwrs
 bImmYy8tI55ii2PQrpiZGfyE/O+mIAOpHqP30tymkIUzSq0og5aYXvKYS A==;
X-CSE-ConnectionGUID: jF7Cm8PNSdqxRg5VP4HuXA==
X-CSE-MsgGUID: MUaEE+HzT+qJgMigLXnjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="67121608"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="67121608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 13:45:57 -0800
X-CSE-ConnectionGUID: Zls4aT5fR56H72N7e/HGoQ==
X-CSE-MsgGUID: ptKqMgq7RW22/hQ+mZQBEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="211046115"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 13:45:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 13:45:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 13:45:56 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 13:45:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIYVirpOzmgXFIOX9kP7Kenu6GAHJTI9KzM0s9V+n6OFkiCTJoW6zp8KOH7d4gnWRot/FaSwUYVClBvxJ7/xyL1oS71co5K7cj8NZ5oapNed5R4c9xEgJp0YdtiKEKdpQ1w0GcvdyRN/wVIxG1ZvXB+snKpAWa6tBwPDo4cfDW88pzA+qV9pwPqM0K+6EgPYxFfdQVBOJ8GAIIhXR3E7Evyx+NqhPdszc1n5Pe5hPUehQjWVb7Qfjhw7+8K234BUjWrnfYCLXMAXPjYSB/9H6piKOHZqjC/EvKAa4F7u/Ie5fJ6zJm0t6r2Y2d9ajzVrZNqu4VhXLmzP6vblh3a9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsUooPR+tQXVc3Er5+vNFfYHHFzIUm0UloFLkzVUoeY=;
 b=kKMEt/et+KSy/lwzfCds3nu5htr0yVbkDVFjS9FI6XZ15UJw/ccGDZ6PIDR/YuPXjArQP2dCddsNRs2KnaRpVY7fKxF86aKuoiOtw33qDKFzMKz6+/e2l//+0e5qQN58zxoWVb1/ymbiGerRN+cZrZUyd7I3i2vd6UaGKNkcRGQsTBFKoMcVWKa95rM3CKw4K6wr/bP/VI8AFFOXVx08HlfTtlYN3iKY2d2FBvFsv6DxTGZiD7x/xYY4u0uuYJUva5awnlrvW1MSxMulT4skNY4npKlQ5HxjyJzRbiMyFcP1wIM6oWGMhB6slLMCYMtXQeb2l4c+pJS5YDQJsLfIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF92ECB6678.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::846) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 21:45:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 21:45:55 +0000
Message-ID: <23e04171-5b1a-4d56-9a6f-7bde65691e9d@intel.com>
Date: Wed, 5 Nov 2025 22:45:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/28] drm/xe/pf: Add helpers for VF GGTT migration
 data handling
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-18-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251105151027.540712-18-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0205.eurprd08.prod.outlook.com
 (2603:10a6:802:15::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF92ECB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 653c1146-c9fb-4ec8-ab99-08de1cb4b297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S201cEk0NWdvRDFBcXFGMlNab1dabk9tUGJ3NDBYT0xtM0F5TG16SEJSOXk1?=
 =?utf-8?B?N1JwMklVVk5zREZhekhIU1RQRFBXV0Yyd3F6NzhUS3pCdHJxdGF1Y09Zemdy?=
 =?utf-8?B?UXhmV0lsRGY4cE1Rbm8ydkFvOFNCZGh5Yjg0Qy9UVGtRbG01aHJlcWRrOHlI?=
 =?utf-8?B?N0RhZmpObmwrdkFicFRNdENFMStHWmxodDdBeEsvWEpJYkJMT3NabDVxOGNO?=
 =?utf-8?B?Z1djZUNOS1dZZDd6aDJQRHljTTFaL0tZdUVkT0xZZithbTQ3NGI2NE5rcWg3?=
 =?utf-8?B?OHhUY3dGb3hXem0vaFFhMnRhZU1LNFNPNXpYQnhCVTk0VlVUaTluN21ieGpN?=
 =?utf-8?B?S2dHU0R4OXk2a1UzMVcraWxrRXlnSjVZUyt0bkt6Nk1ZMmYrVEV4dUoxbXFh?=
 =?utf-8?B?WEZ6d3cyVWpOWWVzQlRySDNGenF1elc2aXZ3aCtTNHd1WjZpYjlpV1JYOXov?=
 =?utf-8?B?Q0hpQlF5V0tpc2dBejVRRlpKLzllOWFLM0dRenhIRU1vNi9HdnZpV1FaMVl0?=
 =?utf-8?B?Sm52S1oxVEYrWUgzWVZNVG5Ca1ZWMlhZTUdLT3J6Z2IzQUdGRkhSV0tLNVph?=
 =?utf-8?B?cldjYW4vR0YzVmdFSFFGbHpONDM5WUJBM0tnQTdCV3pmMkduTnRibktqdCtQ?=
 =?utf-8?B?UmkwWUNMaUZ0TjczY2s1RzFZM0ZLWHdmV2xSQndwVXF4ODJkSDJEU2JXWmc2?=
 =?utf-8?B?RFZpbGh2aCtjRjhWQU45VmlGa0lJWXloRXRmMCt0RE41MkpKMmdYUGxCSitW?=
 =?utf-8?B?eFZuWnp1Q0NhTktzY3poaHBPZFlwdk9JS05WbWowOW5YTExybVV5cDdHbTVS?=
 =?utf-8?B?aFlUQTYyYWZnSllFZzQ1cDFidHA5M3BjU08zQ1ZIYmJWUEhMTWF0Y3RnckxR?=
 =?utf-8?B?cE1Da2drOWVqdWI0MXRmYURSM0xzcmpkckF5Z2VHeHZJaHhtQW04SStncjY5?=
 =?utf-8?B?QmF2eWFpNHZFUGRyRGpuZ1gwZ0s5VG1TYk5aaTRuVitXTWpnZG85MWU2b3BE?=
 =?utf-8?B?KzRJRXJPUk4xZFpza3F2bE1yWGRPWXN1dXBBRWJaWGhlUzdlTWhoWWwybXlF?=
 =?utf-8?B?alF2TzAyODVYVTYrSWFGVWt0bjJmSTBwOG1zK0FRa3psZmNRK0l2UDdVZkt3?=
 =?utf-8?B?ZWlTcUw2V3dsWXRhRDFOYnp5OGxJUVN3ck1yTEFubStuQkxqSlp4MTBpa1Vo?=
 =?utf-8?B?L0ptSzRSNzlzOWI5dXBBejdTZG14czVMQWFITmNBaTBoQ0UxWkl6YXMrQ3dZ?=
 =?utf-8?B?dVVicERiV1p2SmdVWEhYdkE1ZlpNdXcwZTFaVkNOZFAzNFc5R0pKTzdmM0Y0?=
 =?utf-8?B?aTRDV1hhMU9wcWMxcURHL2ZFbGR4dkVoMEtxTHFWbmM4VVBKVHZQaXNpOHlo?=
 =?utf-8?B?N0dVMEx5L0k5RS9kNG1TOS96dituRjdsRmZqcnJQOE1TMmNrVjlTbWxuWWQw?=
 =?utf-8?B?ZjV0NkgveS9hVjZVbkpia0FEb0IyamxkSXowYWZqcVZtazI2dTJyTHMrWjdv?=
 =?utf-8?B?bzN1bVViYVZXZlhkSWxhdityWWtDWDRRdFN4Mjk3bXJoWmhlZ1U0Yy8wZjJ4?=
 =?utf-8?B?bGJrN3FJVEpBeUxyd2VwZUVMY0tDazBIcmpyRGtuT1FjOElId2owSGNrSVho?=
 =?utf-8?B?MWVvRi9xNVdhV05TZXIyUjdlUVR6dUx6c05TbkxrOC9sSWNndEpjSlgwMisr?=
 =?utf-8?B?cUFvSllrekE5TmhDYnp0Uk5heGxtenBxcDRxOWphSkpwU1J4ZVdKOE9Lb0N4?=
 =?utf-8?B?NzgycUJKbkxra1RCWFhscVdVbjJzQjVrV1M5Zk8rbDRncjVLNzlYbUJxNmFD?=
 =?utf-8?B?cWpyQ1l1Qzh3UFFHMXZDdUZ1dTlFT3ZoRHJqK1U1STlsNUs3cnlwOEJqc2tq?=
 =?utf-8?B?ZXZxZ2I3SjI5NUZ1L3Vla1ZRM0w0WXJDZ25YWng1dHh6MndBM1liTzBQOHFh?=
 =?utf-8?B?U1NqMGxUTGRuYzJHYnJWdjJjWFN2dTZMZjNiZkRubEVvY0VzNUpWa2NELzBj?=
 =?utf-8?B?U0R2TXIzcDNhR3Z5Q3BQV0FEdVhMbS9UbVpuM0ZGbVpVVmFra0F0MmtBZ1NI?=
 =?utf-8?Q?eqGC49?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzFXQnJYNmpJcjRCRDBpOHg0ZTdYUnd6NlBXNVk5azZDSUZFbnBWMk1mOFFr?=
 =?utf-8?B?UGcrZU54RFJBRlovU2dYRW9SbnY3REc0NXNEQUlvM2ZlNkJUM050WVV6VlZJ?=
 =?utf-8?B?eDkyYWFPREVDZlY1bmNqZFhsM1MyTVJOaEMraXFkNzlTOVF5OU9hT2lWbzBJ?=
 =?utf-8?B?Y2txUWFwWmFCdi85cFZ1KzNsMjBIMzEzMHkyUWd0MFRvZThacjZBRUs2QlI2?=
 =?utf-8?B?c083R2VBdmpCa0xzS0syTUVDRTZCVnA3S3dTa0ZWUDVaQ0Q1ZzZWRHZVeTRt?=
 =?utf-8?B?ZWlScnM3RlRPcHlEeEdxNmJiaE8rS2RNRlN5alZSbkZKN01PSS9ZWE5Vbm9r?=
 =?utf-8?B?dlZWL0QyRyswQUdhcEpzZ2hIZzBiZWt1VzhVTDl5YTRYWUdQUGZXWDRIYXFn?=
 =?utf-8?B?VWEvVVEvWE5xLzc0dUZ3RTVKcHVzM1ZtZmcwNGtWUlVJTk9FNW1XeVBzK0tR?=
 =?utf-8?B?WWhwdnNzTDM0TVhjOEtCS0hFQ3Ryd1c3N0N5b1p3RmpUa3pBd0VQVXJJVFpG?=
 =?utf-8?B?Rk9NZVRYMzYyR0MyTk9HbVZkNFpRM3AyYUYyYWFvakNqN2xldmllRDM2V0hG?=
 =?utf-8?B?VE1QSXJqNXhlMThSV2w0QnhPQlJGbnREUUd5VCtjQlpFaURvaWRkZSs0bTdO?=
 =?utf-8?B?UmV4VzJQMmdqTVIwTHJGZWZQeHFhR3UrTURORGpoTktPV0wxMmUrbFVsc3pL?=
 =?utf-8?B?UWFiRXlvL0g4OW0zeXhQQk9zaVhwZEl4d0ZrVGZTRlhnSDZVUkJVekVCZ2Z3?=
 =?utf-8?B?REdNc09CZTZyejNVL3VKNDRwb2JXZU1Gc1JCRUg2TVlNWGRtQVpQWVBLTkFN?=
 =?utf-8?B?RzNPZ3k5Zy83T0VGWXhxeVpySE53NUxZdFdUZG9YTFhnVXB0MXdCTHFsVTlD?=
 =?utf-8?B?cjlJeVFkay8vRDRGaEVKa1JsUHFrODZlb290aXhQd2R4bC85dlFYVEZjUHpT?=
 =?utf-8?B?c2t2QUtRVHQwL2p1bDR4azR4VVFadnE2VTlwbTNzK3lqZUdCTEZjbWxubDhn?=
 =?utf-8?B?Y0Q2aHJKRDcranZidVZrcTdwZUZ3My90WTRmc0lYNGNncFJrTVhiUmpqaE96?=
 =?utf-8?B?WFJGek9JMk15bEVrcUgzK1pXckNQY0tmNUVPSXFPT29sb2JMU2JMRkhUZnlW?=
 =?utf-8?B?VnZzK2FmOER1Tk9UM2ZBakxYMmVhdkdUaG9pS2F3bGZ6UWJhT1pMd3Y5Zmk0?=
 =?utf-8?B?WXB2RjV2Q09JOC9yQjVkeWEvdEc2SUpwNTdYNzBycjMxa0VPKzhNZ2pjaEZL?=
 =?utf-8?B?MkR5anJjYWw5U1FKVXVmd2tvRG5aaDBGQ2ZKUnZsQldWVFNpa3AydWY1R0VO?=
 =?utf-8?B?NmpzdnJjWm1KbVQ1NmNKSkZnVXRjNWhjb0s2OUs0bjZ1MVFDSlBoUUtSSjA2?=
 =?utf-8?B?QWJiMys4TVVhNFZKUHFOd1kwamJPR1N4cVlzYUFLVzV6VlIyYjdZOWpLL3B2?=
 =?utf-8?B?bmF1WTcxSDc3MndGUTRMcGQ3WmVHYjFBVDBsSU1XQzFMc2pOaDRPb3dETXdr?=
 =?utf-8?B?bG15MytpQ2NMSjVWbWJaby9pQmxPMW9lVlRNV0hRV0t0RUtaamkwYVBtSE9Y?=
 =?utf-8?B?UkpxVGZ2VDBoMU1yOTZQVGJ2NlFlMVlxY2lrT2ZVVUxQdzcxOThrSVU1bFRB?=
 =?utf-8?B?Mnhoc00wUVN0NFQxUlh6eUJFaDlKaFI0Tm13TFYycE9SdEpzL0EwWkhnRmhX?=
 =?utf-8?B?YWNjTnhWcVVOQmRnclA4WDZ1cmpjYjJyVlJZdTdFWVVvYW45M0wzMTZJT1ky?=
 =?utf-8?B?WVR6N0VMUjgxVTByelB3UnpsSTU2YllMR0NFYVFIY3hINWJvcytPZU5CNzhS?=
 =?utf-8?B?TFg0V08rY3RNUllpZTFObDhjeDNKT0tnZ1lzVnBtaWI5ZzJXQnBuSERrTEli?=
 =?utf-8?B?NkdlM21uTTVaSldtQUpjWS9wYkRBQituRTBCdWluUTBjdy94NjdnaFZHN1JY?=
 =?utf-8?B?QzBxMFhRRnQrMjN0OE5zVW9vbW93d3N3TVEzK1RTN3hjQlpDclhaRjF3S1RB?=
 =?utf-8?B?Y0l2SFhCZlFXT00wRFVWd25nek5HeHhROGd2aGZKajZERm9LZHNSbjM1bzJn?=
 =?utf-8?B?M1A2WWxVbkNiU0hRbTh0ci9hRFVDZU0rQWFDcHN2dTc4S3g5djg4UC8wNmpo?=
 =?utf-8?B?ekUvV25nN01YUXJuS2U3L2J1SDdaelRUK1pLMG9maTNkY2FmQ1RsaEVpR3Js?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 653c1146-c9fb-4ec8-ab99-08de1cb4b297
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 21:45:55.1640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkCmL8eKs+N9MRuBOuvigaKhwySOx+w4eycxU5PBrv+Yi7DLlGthkWlSBR+dSlVGPLtQS2G0V6CrFA8LWRDb9ryRhoXb+WTHmneTvfYBnC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF92ECB6678
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



On 11/5/2025 4:10 PM, Michał Winiarski wrote:
> In an upcoming change, the VF GGTT migration data will be handled as
> part of VF control state machine. Add the necessary helpers to allow the
> migration data transfer to/from the HW GGTT resource.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 104 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |   4 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  52 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
>  5 files changed, 167 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 20d226d90c50f..2c4f752d76996 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  	ggtt_update_access_counter(ggtt);
>  }
>  
> +static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> +{
> +	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> +	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> +
> +	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +}
> +
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> @@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>  	.pte_encode_flags = xelp_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>  	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
> @@ -889,6 +900,20 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
>  	return max_hole;
>  }
>  
> +/**
> + * xe_ggtt_node_pt_size() - Convert GGTT node size to its page table entries size.
> + * @node: the &xe_ggtt_node
> + *
> + * Return: GGTT node page table entries size in bytes.
> + */
> +size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node)
> +{
> +	if (!node)
> +		return 0;
> +
> +	return node->base.size / XE_PAGE_SIZE * sizeof(u64);
> +}
> +
>  #ifdef CONFIG_PCI_IOV
>  static u64 xe_encode_vfid_pte(u16 vfid)
>  {
> @@ -930,6 +955,85 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
>  	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
>  	mutex_unlock(&node->ggtt->lock);
>  }
> +
> +/**
> + * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
> + * @node: the &xe_ggtt_node to be saved
> + * @dst: destination buffer
> + * @size: destination buffer size in bytes
> + * @vfid: VF identifier
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid)
> +{
> +	struct xe_ggtt *ggtt;
> +	u64 start, end;
> +	u64 *buf = dst;
> +	u64 pte;
> +
> +	if (!node)
> +		return -ENOENT;
> +
> +	guard(mutex)(&node->ggtt->lock);
> +
> +	if (xe_ggtt_node_pt_size(node) != size)
> +		return -EINVAL;
> +
> +	ggtt = node->ggtt;
> +	start = node->base.start;
> +	end = start + node->base.size - 1;
> +
> +	while (start < end) {
> +		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
> +		if (vfid != u64_get_bits(pte, GGTT_PTE_VFID))
> +			return -EPERM;
> +
> +		*buf++ = u64_replace_bits(pte, 0, GGTT_PTE_VFID);
> +		start += XE_PAGE_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
> + * @node: the &xe_ggtt_node to be loaded
> + * @src: source buffer
> + * @size: source buffer size in bytes
> + * @vfid: VF identifier
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
> +{
> +	u64 vfid_pte = xe_encode_vfid_pte(vfid);
> +	const u64 *buf = src;
> +	struct xe_ggtt *ggtt;
> +	u64 start, end;
> +
> +	if (!node)
> +		return -ENOENT;
> +
> +	guard(mutex)(&node->ggtt->lock);
> +
> +	if (xe_ggtt_node_pt_size(node) != size)
> +		return -EINVAL;
> +
> +	ggtt = node->ggtt;
> +	start = node->base.start;
> +	end = start + node->base.size - 1;
> +
> +	while (start < end) {
> +		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
> +		ggtt->pt_ops->ggtt_set_pte(ggtt, start, vfid_pte);
> +		start += XE_PAGE_SIZE;
> +	}
> +	xe_ggtt_invalidate(ggtt);
> +
> +	return 0;
> +}
> +
>  #endif
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 75fc7a1efea76..1edf27608d39a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -41,8 +41,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>  u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>  
> +size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);

nit: maybe it should be placed near other "node" related functions
 > +
>  #ifdef CONFIG_PCI_IOV
>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
> +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
> +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
>  #endif
>  
>  #ifndef CONFIG_LOCKDEP
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index c5e999d58ff2a..dacd796f81844 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
>  	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
>  	/** @ggtt_set_pte: Directly write into GGTT's PTE */
>  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> +	/** @ggtt_get_pte: Directly read from GGTT's PTE */
> +	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index d90261a7ab7ca..2786f516a9440 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -726,6 +726,58 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
> + * @gt: the &xe_gt
> + * @vfid: VF identifier (can't be 0)
> + * @buf: the GGTT data destination buffer (or NULL to query the buf size)
> + * @size: the size of the buffer (or 0 to query the buf size)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: size of the buffer needed to save GGTT data if querying,
> + *         0 on successful save or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> +					void *buf, size_t size)
> +{
> +	struct xe_ggtt_node *node;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !(!buf ^ !size));
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));

new line here wouldn't hurt

> +	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
> +
> +	if (!buf)
> +		return xe_ggtt_node_pt_size(node);
> +
> +	return xe_ggtt_node_save(node, buf, size, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
> + * @gt: the &xe_gt
> + * @vfid: VF identifier (can't be 0)
> + * @buf: the GGTT data source buffer
> + * @size: the size of the buffer
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +				       const void *buf, size_t size)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_ggtt_node_load(pf_pick_vf_config(gt, vfid)->ggtt_region, buf, size, vfid);

nit: not very clear, better to have node* var

> +}
> +
>  static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
>  {
>  	/* XXX: preliminary */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 14d036790695d..66223c0e948db 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -71,6 +71,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>  int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  				  const void *buf, size_t size);
>  
> +ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> +					void *buf, size_t size);
> +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +				       const void *buf, size_t size);
> +
>  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
>  
>  int xe_gt_sriov_pf_config_init(struct xe_gt *gt);

few nits, but LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

