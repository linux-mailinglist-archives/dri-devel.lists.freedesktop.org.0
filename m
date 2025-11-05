Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF10C37E58
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 22:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0C310E7AD;
	Wed,  5 Nov 2025 21:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmTLmNzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CE210E309;
 Wed,  5 Nov 2025 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762377151; x=1793913151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LccvNaemNAowxF9BmAiv13J0fvvnMeKpTwPikk7f2Ew=;
 b=FmTLmNzCt8TwvgXJvA304yKBLji3h03H3GC/SwCXf0F1+LwNfXaRUjjf
 b9M3cbbew6iANm4XbSS6fKLufJNKU+mLeJhDoJ1A/gnH6OBrWWvsFJils
 J17XLo59m90Ptd//3tAaNn2VbGtLmV1c18mbKdep9sWHfYwJHw1mZAgB1
 Tx5LDimttQo8Fcwo6jRo/aWuP3PyDZZCcQMklIO1EwQyKB1WsRXS7yaVt
 b+RNk0oOH3oJTLjuL5+VNkP2zNiMBPgOW781G3SZSbgH8lGkbFeojo58k
 gOms3zyz4cfNUq3geZMTypUpohT5MEw9jrEwDMdMnOry3FKc+QpuL2a9a g==;
X-CSE-ConnectionGUID: rmRwK/OSSKCqgWsroa7ilw==
X-CSE-MsgGUID: dWMsYuh5Q6Ce5wOS5fxiKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="89967193"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="89967193"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 13:12:30 -0800
X-CSE-ConnectionGUID: RNtBapd8TTWCnB3RpCt+tA==
X-CSE-MsgGUID: 5oHqN3aYSgyH+ARrWvIJdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="191668077"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 13:12:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 13:12:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 13:12:30 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 13:12:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REnxCNeTTwnJaDJQAtJY7n2gf6ImJ4aeXVxXiMUHuzX9h+DZYbHdiRWoy9XF64U5K+6N/+UcMEoeaqZYmW+UJ2x2Zf8dPr1FTu0Ewn+v2cNfzaI7hdnYBI3dTOeWCrwLayVSEB5FlnL+guZCsGJTKWANraM9GaJfOV4NwAIJdFz1QdimSgBhnSssZyEy3oUOhthUaD7KkJjPZqtdsCyVTRQtkuzzOpPpltRyHG5v8LymTp/v4IYV82fVwcnX3lNTOclOmCnsKkQJUzGMFgfFw8NNx7RIoAPqV08MNf0pu6tTDXgPgHOZ+FqxyhmUL5b+bkF9xdb0NvsN4oV+wF8NvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX9ytreUKoTBfIirAEaLfJYtrYZjkGkeFg6SBuW7waE=;
 b=rcODr+TL7ckpJ2v5Z02tQgY7mRGez9F71KC87pg0yzRd8Powo1w3h4K02Y2/qEWAN5jt0ZKAGwD/miyoWZxI+44MEa3UJ2k4+Y+yEjlL3FC5QvM2Ll1TSY0QDPHlUvgg8SLwrKzPlTwquNORN2UqEodG7LiZOxGDJxgX2U3rtfm8g0XMXvlBqdJWSDVPy9WqSTJ/kcP2Orw9+JeoFcNyYKrHHoHEzyV4QZkgowln5/jSEafzLInmxBIYaybbnayKz0jNCzP09zw5AW/u6uYRPU46T6FHJWgoR20WXSwagv+7ayZDDBL9v3LTIWQo4mjcbND9K7w6L2KD1Mq+/pjzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 21:12:20 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 21:12:14 +0000
Message-ID: <8098e7d1-79ab-41f1-8036-4feacf87a941@intel.com>
Date: Wed, 5 Nov 2025 22:12:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/28] drm/xe/pf: Add helpers for migration data packet
 allocation / free
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
 <20251105151027.540712-7-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251105151027.540712-7-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0039.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ee80c9-3b48-4c20-0108-08de1caffdfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZldkTjNoYm93TkV4Y2xHcmhyRDd5UWV4V1VLaTdwSjhJSHU2UFZFdFQwSFRs?=
 =?utf-8?B?bCtPWFd4bUJyUXlYTitlK3BnOVRsOS9YSXVDalM0dmlXN2ZabThpcGZxeWVY?=
 =?utf-8?B?YTE1cWFnM3hYcEdOOFpYZEQwN2JsdGVxZi9oYU9FYms2RjI1enVKb3RQT05K?=
 =?utf-8?B?SW5CUWVEUTVKbHRXbXRvSVV3V1YyZUtQNWFIMGVHSnRJNmR5TU9tblJEVTA5?=
 =?utf-8?B?MDVYWTlteWlnTGdMTkJ6cjNpbjNhc0NST2llbXFEV0RsUml0TTB6RkNaS211?=
 =?utf-8?B?MmFRNGFrZ2thM1YvOW1zMnpMeEZISXZhVWFoOU5FWnZ2Nzc2QjljaGVXQllu?=
 =?utf-8?B?ZGZHMXZIRXpxb2VmOTBzNzZSUWp3RDJoZnRXWnBvUTRNMDFhNHNiMCtYbTNz?=
 =?utf-8?B?d2J6UHFOUjl0VUM3dTdUMzFnanNkb2V0NlhCK2tWVW5sU3JwQ285QTJzZ0N1?=
 =?utf-8?B?Vk1VVUIzeXhGelZvTXcrMGQvZzdvNjFCOGRxWCtPQlBXMy81OGxWamNhMHV6?=
 =?utf-8?B?b1hTVzZiZEN2RVdpNmtneDcwU2hhblNZUGZ4SmI1ZzRaNlRSbnhUdE95NG43?=
 =?utf-8?B?YnFtRUlKd2lTaVc0aGV5bWw5b3VxVE5JRWpvcGkrZU5aalJsMWhCODFvNU9v?=
 =?utf-8?B?NDdQeG9nYWZZWUF0VWtwak1NeU9qL0tZeWgwcUpFbVVxSDBFMDZRaXhoVXlo?=
 =?utf-8?B?djJIR3FFcnlWZG1SNG9RdU1qeVdJM2IzRUFQaHZURHJLa1dDektqNDROVS9T?=
 =?utf-8?B?SlhPRTdGRlNmSk9hZDdvYWplN3JFVksxd0N1aFJlZXVwYWh0TFYvWWt1NGZI?=
 =?utf-8?B?eGNUT2R3UnFUUXVQSUxNOGpuWGIyZWpJaTZBQklCSkd0dmpyczNhM01YR2px?=
 =?utf-8?B?VXFmcHRuZ0YxU1c5MENhQjJkV3ozb0xqSmszU0IvN0hMNlkwSHNkdHhVYkFo?=
 =?utf-8?B?M2E4TGRoVXljWFV5SUc0MzRHQnZJTll3SGt6ZXZkWi9QQXhhelIvdUlENFN6?=
 =?utf-8?B?QzU0TE5PS0p4cTJpNWxoblJxSGlicWFXTHZvaEdGZjlOa0xzeTVFVWZJMzNI?=
 =?utf-8?B?VHlDcVVMK1BlRnFWa3FQVmw2NjNpUFpSNjBVTmhzSTIzQVVUdXZNNU8wOUdR?=
 =?utf-8?B?anl4SWJHL2V0bFI3aUplaXFHSWM3N3lkc0tESFBxdzlEL0FJYVVxRVNXMlFi?=
 =?utf-8?B?ZWxIMEpVRUtXL2RWdm5PU1RWdGw4dlBFWFFzdmdzLzlvd1psZTA2MlJqaHFW?=
 =?utf-8?B?MjNJUmF2TUFtMFdhZXRENjVmU09HTmpCUFBhYVY0eVhlSHo0ZThwaFNoTG1Q?=
 =?utf-8?B?dFBpTjZONGpNK1p0TWpGUGYvdXB4TnBBZkFodTd2VVZMZXVqYjM1YkIxUjlK?=
 =?utf-8?B?Y2FmMUJRRkVOMy9ZeFN2WWZrekpSc2pOcXVub3kxN3BYUk91L3cwWkt6Rm9k?=
 =?utf-8?B?djJqYmhQWGVlaVRneDJSclpzamMrQXN0ajBBOE05eGxhU1psOUpyOWZYbktJ?=
 =?utf-8?B?V2dqdUdubEhUN2RuVVlhOWQwcjAyblVydFBZcTBXVTl4U0RhM21abWZaTk53?=
 =?utf-8?B?VXZkdGNIU3oxWkZXcFl0NndVT2VTclAwbWNKVGxQSy93Q0JHMWMvN1lSOVJG?=
 =?utf-8?B?V3crWXR3YkhQQ29OYzRWc0IrczBiWTlkREZlVkxpY0EvTi9SdXhhY1pNZ0Nm?=
 =?utf-8?B?Ky92QzdJenp1b3orVDR0dnJLaHQ5ejZ2ZzE3TVJMVE9oaUdPZ1VvSW15ejYy?=
 =?utf-8?B?RGVjZ3JXdnNxVjlKZkhQZ2p0T2ROamxBV3FCNHl6OWxZdjFoMTkweHQ0ZmV6?=
 =?utf-8?B?eVZGaXorSGZYWVZWdVpBMUc2Zy92RGFKSERCMmpFOEhVOWU0RUZaaGdnakcr?=
 =?utf-8?B?cDBTdEd2dW5OWUFWbG4zRVQ5LzVtWWlERVE1cGZBZnM4amkyZzR6OGxIZ1dk?=
 =?utf-8?B?ZFZxUytRTTUzMDBDbVdqK2k4RWVBZXhjSGtIZHdLeWhaS0hMeXhBcENKSDBw?=
 =?utf-8?Q?xvBGzff7BQ3CQyvH+ra8eP5UqQ5yVA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnpuUjA2aWN3VzRwcUFwUUJtOFU3U1Y4WmRyZ1hzZk1nQUNTZmJpWkZlZUt2?=
 =?utf-8?B?dTAxdHJla1pCdHpUWU94UkxUNnVvUFNMVS9IbWpiamxvK0tQdUh2WnRZbWNV?=
 =?utf-8?B?ZWhvS05NWlRlOWwxTVBmMWNIY3doVUo4MEt5ZU91cW5kY2pJMW5RWm9ZVWUv?=
 =?utf-8?B?V2F1THBodStiNXZQTUJ1UzhTUmNNZTdoRjFUci9SZWZWNCtZeFc3OVFvRGVm?=
 =?utf-8?B?aHIxRFFoMFBxdFJwclVrMng1UDhhQlltV3RMNE1XMGl0TFB1MFNhb3Bhb3lX?=
 =?utf-8?B?L2lLeWJnY3gzUHJSZ3JxOUVBTk9PVUp6a0c0allUQ0cwY0psdUd3ZzZPTTRQ?=
 =?utf-8?B?Y1ZnMUdxK2JIV3JLbUVMTjkyZGJOUTZnVGR3dzdCb09LWk9YRlZXbVhqT1F5?=
 =?utf-8?B?WTMzVG12TkV4UHhPSFRGOEJBbWVsYzRQZUN4KzV1MlZrNmw1dkUvMlBaVUZ2?=
 =?utf-8?B?enZHZFZ1cWtua0dqcGs3MmZGVGxFUTJNa21nUFluNUtTR0U3QW5hS1RsblhE?=
 =?utf-8?B?QnpLVDA1VUhHZEJ3MzBWQWhrUEZFS1JpdnhkMjJLU2t0ZG9ZV1hoTXFTWE5i?=
 =?utf-8?B?T2h0Zk50bWtsUVhmSThLRXRJTEtBMHB4RitBRUw0WEhBSlYzYlB2UnZyUjBx?=
 =?utf-8?B?UUN6SnNYWjJGemtDU1RCemZvcm91eGMrQjJpc3NHSFFZcGVaalpQV21ZeEJV?=
 =?utf-8?B?WmVqdFhLZ3IyTDdRUG9MTzhqb2h2NFVQQXBTYWFDbVhIYWFYN0V2SlRQclo2?=
 =?utf-8?B?eWtDQ3NSVXFGZVJ1cjRBcnNtbWhacFh2eHdmek8zeEZRb0NVejI0VkRHZFpT?=
 =?utf-8?B?UzR4dUdmOWJtYktHK3hsK0lrYW81SzJJNXVxempTZ2MwcEt4R25Ja1crOFVw?=
 =?utf-8?B?WWR0alNmbXpYelVWUkpaMzlRVWMyNDVYU2lJT2ZtbmVJSUs0aitiZllNby9T?=
 =?utf-8?B?b0FHei8rYmZlTDlQOHZxK0hMaXpwKzlhQ0szNWk2MVZsTkFrTDFpaEhVc0VN?=
 =?utf-8?B?TkEzaFR2ZTM4YUJvOWNodlg1cjZSaklJd3NIM2JMRi9XUDhJQ2hXRGQvdmRK?=
 =?utf-8?B?am1WRUZzWmpEdTRDV0xnclpuZitnNjFOdjhRYkUxdG1Ubjh2OXd2clZpcTcw?=
 =?utf-8?B?dkZNTHdrRHVLMFF1K2pYdkxmZjIrZGVNbHE4VFJ3L2xZQSt1ZFJZczNTZDlQ?=
 =?utf-8?B?WlpISi9tRGk5VzVQTXR4K0FORHhHUWF1a01pSlVjVDFBbmVWeENqRjc2Ujh1?=
 =?utf-8?B?NW9yeGNBU2FIOUdLaVoza09ER2o0VkdWRllNR0pwbDljQzN4bFg1UEtJRDVN?=
 =?utf-8?B?RFRBc2I3anBKd2NvaUM3K0VWWlIvR2RvOHA2dlozTVdscVlVSzJqVWRrVHZI?=
 =?utf-8?B?R3lnVzVGVXVMaHEwUGc3Q004azV1QnI2aEs5UXZPdTIvNlVpSEJCZDRlTm1N?=
 =?utf-8?B?UGYwQ0dKN2FXdk96ZHN1QVNWY0NBTy9vU3JwWjNOTlJKRCtlWi9GSXZJcHdB?=
 =?utf-8?B?L0pycjM3SXo4em5tSkRoN3Q1ZzBZWTY2T2xmRGtmenFHcnZoRU1ra3VwOGRB?=
 =?utf-8?B?ZWNLZnRuOUZTRGxLcDJ0MEZ6RGRHTnBiaDJacU9aanhIaU9vMVNkQVRKazV2?=
 =?utf-8?B?OStOWDRabGNKM2IyL1hRMytQS0tCTHZyc2daSTZoSW84SFJRNTdHSUNzNkdk?=
 =?utf-8?B?bzNZTDZqdVk4UkZkMmR5dVRrdnlrbFRrY1JybS9BNW9YWXdzeFpGU2d6QVo4?=
 =?utf-8?B?WFE2QytVRmhucE85NlpSbzZlZnltRUNOYUFWNEROQkhEMjZqNWtUR0hrWFJR?=
 =?utf-8?B?RGtCeDdjWTBaYnZYdEJQK1owaGlsOVd0T0lObFdBVFU2R2tmTlkrTmdjU1VH?=
 =?utf-8?B?VC95MVdQQVdkV0dteDU1bitLenJsSlRJUWo0cnNMMEVIcjdYTTRZQnhXcEoz?=
 =?utf-8?B?bHlhY2hMMnR1K1M3cUQrWEVMdm9tOWRTbWV6cWRSeWF6b0NSa3M4aksvYWhO?=
 =?utf-8?B?QnowRCs2NVJUQUlGQktISUV0UFhTNTZud05sWUNBN2Q5WFNqMWgxMEtENVNx?=
 =?utf-8?B?TjlnSS8rRWVRMWExcnlhWVNFRUhJM1B0azliN3ViNlZpb2tOSkh0bDg2STJx?=
 =?utf-8?B?YlM1ZldqdVBwS1lRVVJKd2VSdUkwZGU4b2tpbDFySzZTZzErQmFlSjNvWDZi?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ee80c9-3b48-4c20-0108-08de1caffdfc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 21:12:14.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE8ly4CxUfJ9FTweNW+wjvjupxX6eBgr1m+bhAbZft8JGuaO6CT93mfYsGNAYiUl7BXbydu+KB0CsS8nJ5z6gb9tkQ9Woy+nIRsRqj9Kvdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
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
> Now that it's possible to free the packets - connect the restore
> handling logic with the ring.
> The helpers will also be used in upcoming changes that will start
> producing migration data packets.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  11 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  33 ++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
>  drivers/gpu/drm/xe/xe_sriov_packet.c          | 129 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_packet.h          |  30 ++++
>  6 files changed, 202 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cb6b30fd8c2d8..e4b273b025d2a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -174,6 +174,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
>  	xe_pci_sriov.o \
> +	xe_sriov_packet.o \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_control.o \
>  	xe_sriov_pf_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index db57f9d9b491f..25937592bc42f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_packet.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
> @@ -852,6 +853,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> +
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> @@ -1074,6 +1077,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
>  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> +
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> @@ -1108,6 +1113,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  
>  	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
>  
> +	xe_sriov_packet_free(data);
> +
>  	return 0;
>  }
>  
> @@ -1201,8 +1208,10 @@ int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid
>   */
>  int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED)) {
> +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
>  		return -EIO;
> +	}
>  
>  	pf_exit_vf_restore_wait_data(gt, vfid);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index d9ca9ea737dcc..c492677db28d9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -14,6 +14,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_packet.h"
>  #include "xe_sriov_pf_migration.h"
>  
>  #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> @@ -418,6 +419,25 @@ bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
>  	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_migration_ring_free() - Consume and free all data in migration ring
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + */
> +void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct xe_sriov_packet *data;
> +
> +	if (ptr_ring_empty(&migration->ring))
> +		return;
> +
> +	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
> +
> +	while ((data = ptr_ring_consume(&migration->ring)))
> +		xe_sriov_packet_free(data);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
>   * @gt: the &xe_gt
> @@ -544,8 +564,10 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
>  	data = ptr_ring_consume(&migration->ring);
>  	if (data) {
>  		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> -		if (ret)
> +		if (ret) {
> +			xe_sriov_packet_free(data);
>  			return ERR_PTR(ret);
> +		}
>  
>  		return data;
>  	}
> @@ -559,11 +581,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
>  	return ERR_PTR(-EAGAIN);
>  }
>  
> +static void pf_mig_packet_destroy(void *ptr)

it's not a "pf" call, but 'destroy' callback, so maybe:

	destroy_pf_packet()

> +{
> +	struct xe_sriov_packet *data = ptr;
> +
> +	xe_sriov_packet_free(data);
> +}
> +
>  static void action_ring_cleanup(void *arg)
>  {
>  	struct ptr_ring *r = arg;
>  
> -	ptr_ring_cleanup(r, NULL);
> +	ptr_ring_cleanup(r, pf_mig_packet_destroy);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index b29d34a835b71..b4c7b5dc9e914 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
>  
>  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
>  bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
>  
>  int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_packet *data);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
> new file mode 100644
> index 0000000000000..2cdcfb2073d00
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_sriov_packet.h"
> +
> +static bool pkt_needs_bo(struct xe_sriov_packet *data)
> +{
> +	return data->type == XE_SRIOV_PACKET_TYPE_VRAM;
> +}
> +
> +/**
> + * xe_sriov_packet_alloc() - Allocate migration data packet
> + * @xe: the &xe_device
> + *
> + * Only allocates the "outer" structure, without initializing the migration
> + * data backing storage.
> + *
> + * Return: Pointer to &xe_sriov_packet on success,
> + *         NULL in case of error.
> + */
> +struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe)
> +{
> +	struct xe_sriov_packet *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return NULL;
> +
> +	data->xe = xe;
> +	data->hdr_remaining = sizeof(data->hdr);
> +
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_packet_free() - Free migration data packet.
> + * @data: the &xe_sriov_packet
> + */
> +void xe_sriov_packet_free(struct xe_sriov_packet *data)
> +{
> +	if (IS_ERR_OR_NULL(data))
> +		return;
> +
> +	if (pkt_needs_bo(data))
> +		xe_bo_unpin_map_no_vm(data->bo);
> +	else
> +		kvfree(data->buff);
> +
> +	kfree(data);
> +}
> +
> +static int mig_pkt_init(struct xe_sriov_packet *data)

nit: no need for "mig_" prefix, see above pkt_needs_bo()

> +{
> +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);

xe_device_get_gt() may return NULL and this will make static code analyzers unhappy

either we should check here gt again, or maybe store the valid (struct xe_gt *) in the data,
as we already have (struct xe_device *data.xe)

> +
> +	if (data->size == 0)
> +		return 0;
> +
> +	if (pkt_needs_bo(data)) {
> +		struct xe_bo *bo;
> +
> +		bo = xe_bo_create_pin_map_novm(data->xe, gt->tile, PAGE_ALIGN(data->size),
> +					       ttm_bo_type_kernel,
> +					       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED, false);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		data->bo = bo;
> +		data->vaddr = bo->vmap.vaddr;
> +	} else {
> +		void *buff = kvzalloc(data->size, GFP_KERNEL);
> +
> +		if (!buff)
> +			return -ENOMEM;
> +
> +		data->buff = buff;
> +		data->vaddr = buff;
> +	}
> +
> +	return 0;
> +}
> +
> +#define XE_SRIOV_PACKET_SUPPORTED_VERSION 1

nit: add new line here

> +/**
> + * xe_sriov_packet_init() - Initialize migration packet header and backing storage.
> + * @data: the &xe_sriov_packet
> + * @tile_id: tile identifier
> + * @gt_id: GT identifier
> + * @type: &xe_sriov_packet_type
> + * @offset: offset of data packet payload (within wider resource)
> + * @size: size of data packet payload
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
> +			 enum xe_sriov_packet_type type, loff_t offset, size_t size)
> +{
> +	data->version = XE_SRIOV_PACKET_SUPPORTED_VERSION;
> +	data->type = type;
> +	data->tile = tile_id;
> +	data->gt = gt_id;

shouldn't we validate the tile_id / gt_id here?

we do have valid data->xe here, so we can try:

	data->gt = xe_device_get_gt(data->xe, gt_id);
	if (data->gt)
		return -ENODEV;
	data->hdr.gt_id = gt_id;
	...


> +	data->offset = offset;
> +	data->size = size;
> +	data->remaining = size;
> +
> +	return mig_pkt_init(data);
> +}
> +
> +/**
> + * xe_sriov_packet_init_from_hdr() - Initialize migration packet backing storage based on header.
> + * @data: the &xe_sriov_packet
> + *
> + * Header data is expected to be filled prior to calling this function.

maybe add some asserts to enforce that and check data->hdr.size and other fields?

> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data)
> +{
> +	if (data->version != XE_SRIOV_PACKET_SUPPORTED_VERSION)
> +		return -EINVAL;
> +
> +	data->remaining = data->size;
> +
> +	return mig_pkt_init(data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
> new file mode 100644
> index 0000000000000..2c5a49897d763
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PACKET_H_
> +#define _XE_SRIOV_PACKET_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;

also

   struct xe_sriov_packet;

> +
> +enum xe_sriov_packet_type {
> +	/* Skipping 0 to catch uninitialized data */
> +	XE_SRIOV_PACKET_TYPE_DESCRIPTOR = 1,
> +	XE_SRIOV_PACKET_TYPE_TRAILER,
> +	XE_SRIOV_PACKET_TYPE_GGTT,
> +	XE_SRIOV_PACKET_TYPE_MMIO,
> +	XE_SRIOV_PACKET_TYPE_GUC,
> +	XE_SRIOV_PACKET_TYPE_VRAM,
> +};

shouldn't this enum be in xe_sriov_packet_types.h too ?

> +
> +struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe);
> +void xe_sriov_packet_free(struct xe_sriov_packet *data);
> +
> +int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
> +			 enum xe_sriov_packet_type, loff_t offset, size_t size);
> +int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data);
> +
> +#endif

