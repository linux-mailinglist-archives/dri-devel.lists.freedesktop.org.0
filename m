Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169497AACA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 06:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C817810E408;
	Tue, 17 Sep 2024 04:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="li2v5BxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6570410E1DB;
 Tue, 17 Sep 2024 04:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726548081; x=1758084081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HL+Fnvoq50/cyoqrdUxkI9dhPEusAI5uaJQAxgRqocQ=;
 b=li2v5BxVCzNQpuVEpXSwaqIxKZza5fF578ywBgeFBPLqDcMohY4h777v
 7Eln/e7k7dyK05t7na1ElrurNiJy4PjwmOougxcw+YSQJt+wUSPPbJ1g5
 yLOLnJL23qTNfg42ih5m2UKJK07/E6BPJIlCz54A1tJ3FVJSLJ/B/8LAa
 5tExQXee83/wDIkezD/SV7NUCHtsh9qAAY4Y+W2XUozyUh2SNMKHf3/ZI
 toUo0LHW5Fltk6a1TZmx9H26cOpmb5MVbei82wq2frmElrgvaZzoPBq+7
 1A3cnOvPaBwE3olaJmx+Ti2RkXbURe1sdtM8n7vhN+tO+L+cl6+9xmOVG A==;
X-CSE-ConnectionGUID: 9EDzWinhSiOGvBgfzgpdUA==
X-CSE-MsgGUID: wega06kKT7yj7L9Py9Eqyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36769051"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="36769051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 21:41:20 -0700
X-CSE-ConnectionGUID: gLc6ZTyATkKdkpsH9XW5Tg==
X-CSE-MsgGUID: hxi/lPW7TnWF1oXtJMw90g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="73831591"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 21:41:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 21:41:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 21:41:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 21:41:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 21:41:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmONcB2Qi46GhtSKBvpr5JzuQXWIKmJiwrMspGU6Rq3GbQTlAptMzqL8R9xeVgmmkylK/fZz0ta3kmNgmTzufOq3nJ6bBftAsJ+ZFoOBQRcsLnL5iXiTb0L6iZ771Ye0foU7PgZpwqrmkPNBrSjOcjRout0dOZu9e25q942Y/wcAeDdjKfZlwwzFTeRNQ3MRE1a8h65+Pir7hVHjRvjbkGZwMrkZ48gdGeqP6EnCbTYECjuU6OKrHbK9bFVi9Jpi9okVIhH2mdxKNN+D20DjsohvEiPWBX54XXM7GY1sigfGlBEsOqzTZxRF57kKx/FFBZ2aanWUAZJqdQW1SES3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgzBoEwm8OTAAhJJnvbkfpUvWg5173g/UHAU9s+xMZA=;
 b=jv2WF5aDE0/+r/K12I60uByWiSW90AP7gK15ayhjqIVzEAoCPXuuAoTkkz7ACSdtUkRYf7oARNw/f6yrqq4j5K3ZCsoUblRj/qjOKfB/3FFDrvQjfYNXLbZFbGwFKUo3kisKYG8AGKTKpVxWP92K6rNHcWUxkZY0+49ZwNJBDyuFypVal6dDbqONXBS1+Hsz2FNOC2Jssbdbh4c+VX9vbrd6pF7Qbx6AdKHH2LgDUhjvx4Hp9ZnZGdu1kKNukfQkQlTzJ6AE1CyzgdTGFzOmhWqoqdCXhi0BCXz1KOJLVfDMsMb3pkK681uKCTpXxtUSah/8avcuol0N9X0hkn7l5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 04:41:16 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 04:41:15 +0000
Message-ID: <86908889-2628-44b8-a2e3-af700217df50@intel.com>
Date: Tue, 17 Sep 2024 10:11:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe: Use device wedged event
To: Raag Jadav <raag.jadav@intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>, 
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <lina@asahilina.net>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <andi.shyti@linux.intel.com>, <andriy.shevchenko@linux.intel.com>,
 <matthew.d.roper@intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240917040235.197019-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW3PR11MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f584269-10fb-44fe-7396-08dcd6d2f701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0VmbXQrdFV4MWVNa1FiYjZ1elF2RUZ6N1V2R1lla0Z0T2thYXIzQmVTYndD?=
 =?utf-8?B?ck9oUEQ1SkNnNW4wYzNJYTN1d2N4L0Ird2N6cUhSbUkvMnpjZEVvVUFSQUF1?=
 =?utf-8?B?RDJUNTg3cEU0SkpwbFR1eTJCU3IrTUVQQmhOYVJhL3ZQZms1SG81RkkxVG5a?=
 =?utf-8?B?WWNYZHdYUjl5Wkg5dzNpN2lObEwxZStSVUNIZWpWeTdnYVBIMmpnK0I4cjB1?=
 =?utf-8?B?SVM4bEVvZUpIdnY4Nkw2dUw1K2xsQ2diV1FRQjU4WWdWNTdQTi93QTZ0TzhU?=
 =?utf-8?B?WTZvUFVYNHRMYW5DNFVraXdFZ0FIRWRBQWdjSlUxcm81QkVGdHFFVmlteXlw?=
 =?utf-8?B?Uzhkd3Q3TzJRd1JESHlRT1o3eEpFeXRMWXMwWXB5QjJraXhhMTZOeGNvUHIv?=
 =?utf-8?B?OHUralhwdFVXNnF6M0JKU1A0ZVZCbkVaT0c3NHJOaUVHM1Jtc2lpd0VwWUNy?=
 =?utf-8?B?VDY2cUZMeW9sU1BGb1VEN3BvWVlrNXNodmppU3djUEZEVVF4TkxXamU2R0Vx?=
 =?utf-8?B?S2llcGxhRXh2WndwVTEyUmlSY1llcGkyNEZjZ3V4SWl6TWlqZlg2REVYejlL?=
 =?utf-8?B?dnZQdUFhS2l5Y0didEw5KzkwNkp2c2ZGbTFnQjh6YUR5NjBQM2xWelBtZ2tQ?=
 =?utf-8?B?aXdXSm85NE51Y0ZPKzl1dXR6ZDZBUkJGc2tnYWRJaEUzdEtoWnVaYytNUmxl?=
 =?utf-8?B?c0FBWlBzRWZsMFpiQUgwWXRJQzRwUHdzV1lpN21UeG9Lc2VUSUVFMzUvTW9G?=
 =?utf-8?B?WExzdUlNZ3k4NEUwRXlxL0hVSFBPR0dmQmpTM1AwZjBjTmhDeC8yb2JNMmgv?=
 =?utf-8?B?amhoQWY2OVByOCtWY2xNbm5YeG55SWFZa0xZOWJIWmZ3dzZtY3hmMS82STlG?=
 =?utf-8?B?aWlCMzE5dzk3WUJHNDN3eDFXWEJ6a2JUeVVDNlljUnQ1b3I5a2tRMGxDWUpo?=
 =?utf-8?B?emxCVUlqNHd5RGJ6cTdsMnp1NDVrRERNZk1EaSs5RUI4V0ZOTkY1MEpMRnlq?=
 =?utf-8?B?TCtQV1RZSHZGUDNqaXNGcEVvMFNmRmV3RFZZWTh6bUF5NTRjeGVscmJtMlJv?=
 =?utf-8?B?V3ZSNE1hMDFHcW00TjB0R1JYT2diUmpMK1ZPVUhqakY2TDF1YlVXWUswNlNh?=
 =?utf-8?B?UVVqZ2NnSHRQakNua2lVVWdTczJxTklUbkhFbjNpZVdtSDBqRFNPOVJOWHBS?=
 =?utf-8?B?QzlYTzROaE91bnE0U3JsYm9qWWV2RndXNHhLU3ZhSkl5aGFqbkQ2azdWT0VU?=
 =?utf-8?B?SDFpa1Q3M0xZS0VkR0swdDhrMS96Um1iYUlXcjN0dUZVNDhYdHdRQjVXSmNT?=
 =?utf-8?B?UE14aEcyQzArQ3dnNk1sZi9hdjdScFZBaUFaY0JXNmhnZFRheGdTNUN3bk0x?=
 =?utf-8?B?QTErd2dJWmlZREpTN3I0aDR5YzN2Nk9VaDdWRkVBT1NURDJ6OEtnR0NaZkV0?=
 =?utf-8?B?d053c2RqcHNuV1hab2sxNmFTcEswUGllYlVlVUN1YVd2ZG05b3FwTXIzNUxF?=
 =?utf-8?B?QldoaDRVN1pGOFY0blhwZGFSUjVzeUE0aVJKYkRzdEVBeFpQeS91WFRXZ0JS?=
 =?utf-8?B?L0oxRkw5bEErdmx1NUpHNVdCVndJbGtXeGc1aHpTbEJGQ0Jza0RTWldSaTNS?=
 =?utf-8?B?aFBycHhnSC9RNUgyVERXbHl3b1QwRHVYZzBaVFRZMGJaWmVDckEwcTk5NHFm?=
 =?utf-8?B?Nk9McjlUd1dyTHF4VkozMmxBN0xFVG1xbG5BbXdrN29vUUt4SSs5a1hjQkJm?=
 =?utf-8?B?REo2OU0yeC8ybHMrUEMva292NXh5a2JUS0haZ1E0VERLbjF3LytDdUFScXNm?=
 =?utf-8?B?VUVrNEJXU0JiUWF0cVUyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlIzUmNzWUpiZFY2RnB5WkN1QWRPdi9RdU5jQWFzK2JLeW5Ua1N6OGd0QzRW?=
 =?utf-8?B?NHFjcmdBTmY0QzhQcTlGRUlIdy9hQkY2MFBRZHlqUk51K3g2R2ZhS1d2T3lS?=
 =?utf-8?B?SlBOL3IxYnkwT0ZIUzN1cjRya09RUi9sZDZ5MXRTMmZzWDZOVTd2VTRQTU9v?=
 =?utf-8?B?MGZ5dDk3bnRyOC9wMG1QU0JuY283NVRHYjRCTVljYjVMenZ4clpMbFN5ZmJ4?=
 =?utf-8?B?YmExRmpLMXBFNWFWcjEyZm92bE8zUG8zUmVKNkdGdUhLNk5uM0N3eUV3dlhW?=
 =?utf-8?B?N0JmU1hiaXhnTjNHWXpiUVZMS3NZUHhGMUlVRHF6SGZJbHB4NjkydDZCMVh2?=
 =?utf-8?B?bzhZeHF5QzZqOGZqMTJmL0ovSVBDeDJYSU5TbU1NUnJPMEZ1aUNNYmxBMWRy?=
 =?utf-8?B?M09HLzF1ak5QeU5SNCs0OUQrTHB0UjF1QURlcklOY2wrNGhiWWgzOEpwQ0Q0?=
 =?utf-8?B?TWhCV3YvVzNpOWdXaE90dFVlUmFnbnhDN1Rrbm5tN3lZWGY3RlNLdTBDeFhL?=
 =?utf-8?B?bGZFMHlaelhBWVI1Y01ZakxlQ2ozalVkQzQ0NnhoWGVRZ3F2V1o4OHN6d2pM?=
 =?utf-8?B?VGdkNzJsc002K0ZKTE9RbUZ1S2VlYUFhQVFQa0s4emZwNENyM1l2YmR2RVlT?=
 =?utf-8?B?TmdmbDU0bzJBRUJUL3NtQ1cxN241ZXhYM0E3UWE1aC9SUlo5eThkd1l5QXZk?=
 =?utf-8?B?ZTFveHdsSlppaEF2YktaUDhLSnBRcWt3ekRueTUveUlEVjhKRUVIRmJaTmlz?=
 =?utf-8?B?Rmp4bW5iTVM4L1YvbExVOEVpRUdKbmhKZW9EQzhCWElqSUdqamZLVjVWRnA2?=
 =?utf-8?B?TXgyOG8xQWdweU8zYXJiLyt6MllRMDVjSlhOQlp3MUlJRFV0K1EvOUM3aTA2?=
 =?utf-8?B?NUNaMks3Wkw3QzBOVnFtMUVvbUJxaTduVTkrc0FBWThwQ210cVhjRTM5MzZQ?=
 =?utf-8?B?dk5LQ1VXVitjNjdWNE5vV0NNUEVyKzJwZ2hJQklZZWRLdkRMQ3lKZHVJcGhM?=
 =?utf-8?B?dndFU3Y2UEVnanN1YWc3dHJ4WVA0WU51OXoxZGpYWmhrR0tudHlNeUZud3pU?=
 =?utf-8?B?S1VFYTlQQnlORVNYS0NGNVpUU3BNeEpsdFRQS2g0UlgxWmpSMzZSWWlmU1p3?=
 =?utf-8?B?cEljcnowWVlLOCtDUlpmWEg2M0RmL0VCM0wzQjA4S1ZCaUZQN29tamcvM3Zk?=
 =?utf-8?B?MEhFU0s0dEVsMEVvWXBpbGdUMEpQTHR3VzlQaWZNQWtkcG42NVZKc2tsdndK?=
 =?utf-8?B?d2c2N0w2NncyQ2hPQWZNQlJ3SGZyM05FMVpZeHQ3a3k1LzR2d0I2Zk16YnQr?=
 =?utf-8?B?SXN0bUtIWEt0OUdiMTRKcGJnUlc4RENma3BlUUE0bjZYNXVYQkc5U0hZc3Qw?=
 =?utf-8?B?SHN2cW5hdlJuNUhKU0dsQzlrZWV6Qk9zTnJUOG1pNkhzQk10em5vM2xXMFVn?=
 =?utf-8?B?Y2JScXlnRlRWRm4rMXpyTnJCNTRjWjFkRnN6STM2enFBKzJ5ZmY1aXYwK0hV?=
 =?utf-8?B?bDAwNU4vUzljNUVrT0hrWUJQVEN5ZGh3NmlXQzlBWWZpT2w5c2ZWUEYvWXBH?=
 =?utf-8?B?SUdMZi9VVXhtaTVtUmlyVFFGRnpoTmhLZlRsSFNLcXFzUkUwUHpwTkJCWklF?=
 =?utf-8?B?Qk5uTml6UVNFdDdYOXQ2cU5CMkNsM3N1NDJwRDFhMlJOODNrOTQ2dEV5SWZX?=
 =?utf-8?B?b1Z6K0VQMVNRZGUvd293OHY4NDBhM2I0akpBWHBuR3pVZFFwNkNxVHlKNUxr?=
 =?utf-8?B?dHFManNrRW43TFdtbXlkek4rM3docld3REd1NlQvQUFmb0xSQTRHYmY3RGhi?=
 =?utf-8?B?Q2IxaVRSR2E2cytya3JwOGZPa2JPR0R0VHhRZ1hDU2tlUDhZR2dBbUxiajgy?=
 =?utf-8?B?eExDT2kvTGZxc2VySDVCa2krWXZ6czd2MkxUTnM1enFlcmNyM3A1aFFTV1Ny?=
 =?utf-8?B?SlJYY1hVdG5RVEFXT3BVcEwyRHVkenB1emRpOW9VbUd2U3NwQ0FCVFcyeEc0?=
 =?utf-8?B?ZTZ1NllMNEV6bVdEeW9NU1YzVFZKc3FSbUp2ODgzZTFIUkdjeG56ZEtDT2VG?=
 =?utf-8?B?a0JURzlPZCt2RHpVOFppWnNFOExpUndidWNqdVR4YW9ZcDQvMHZWQUoxWXNQ?=
 =?utf-8?B?bkdncUp4TDJMYTdKelh2NjBnZTJySzFkdjBEWlVmZVR2N2lRU0VIWlhPT0M4?=
 =?utf-8?Q?sUIQR2JZSRipCpKcu/DnmEQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f584269-10fb-44fe-7396-08dcd6d2f701
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 04:41:15.8323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPuVmT0ONUhWQB/hOB746qP3SMxS//LQkoBdhdNeZoMvxfLWgyFK6UDXFfPC4leXXLo/n8R9JVV1JJmDG3A7FcgBrp8nZUQr0Dj/0VCNAzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
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



On 17-09-2024 09:32, Raag Jadav wrote:
> This was previously attempted as xe specific reset uevent but dropped
> in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
> as part of refactoring.
> 
> Now that we have device wedged event supported by DRM core, make use
> of it. With this in place userspace will be notified of wedged device,
> on the basis of which, userspace may take respective action to recover
> the device.


As per earlier discussions, the UAPI was also supposed to provide the 
reason for wedging( which is supposedly used by L0). IS that requirement 
nomore in place ?

BR
Himal


> 
> $ udevadm monitor --property --kernel
> monitor will print the received events for:
> KERNEL - the kernel uevent
> 
> KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
> ACTION=change
> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
> SUBSYSTEM=drm
> WEDGED=bus-reset
> DEVNAME=/dev/dri/card0
> DEVTYPE=drm_minor
> SEQNUM=5208
> MAJOR=226
> MINOR=0
> 
> v2: Change authorship to Himal (Aravind)
>      Add uevent for all device wedged cases (Aravind)
> v3: Generic re-implementation in DRM subsystem (Lucas)
> v4: Change authorship to Raag (Aravind)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 17 +++++++++++++++--
>   drivers/gpu/drm/xe/xe_device.h |  1 +
>   drivers/gpu/drm/xe/xe_pci.c    |  2 ++
>   3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4d3c794f134c..1b097643aacb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -780,6 +780,15 @@ int xe_device_probe(struct xe_device *xe)
>   	return err;
>   }
>   
> +void xe_setup_wedge_recovery(struct xe_device *xe)
> +{
> +	struct drm_device *dev = &xe->drm;
> +
> +	/* Support both driver rebind and bus reset based recovery. */
> +	set_bit(DRM_WEDGE_RECOVERY_REBIND, &dev->wedge_recovery);
> +	set_bit(DRM_WEDGE_RECOVERY_BUS_RESET, &dev->wedge_recovery);
> +}
> +
>   static void xe_device_remove_display(struct xe_device *xe)
>   {
>   	xe_display_unregister(xe);
> @@ -986,11 +995,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
>    *
> - * This is a final state that can only be cleared with a mudule
> + * This is a final state that can only be cleared with a module
>    * re-probe (unbind + bind).
>    * In this state every IOCTL will be blocked so the GT cannot be used.
>    * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure.
> + * failure or guc loading failure. Userspace will be notified of this state
> + * by a DRM uevent.
>    * If xe.wedged module parameter is set to 2, this function will be called
>    * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>    * snapshot capture. In this mode, GT reset won't be attempted so the state of
> @@ -1020,6 +1030,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>   			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>   			dev_name(xe->drm.dev));
> +
> +		/* Notify userspace of wedged device */
> +		drm_dev_wedged_event(&xe->drm, DRM_WEDGE_RECOVERY_BUS_RESET);
>   	}
>   
>   	for_each_gt(gt, xe, id)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index ca8d8ef6342b..77a2332b4b87 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -174,6 +174,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>   	return atomic_read(&xe->wedged.flag);
>   }
>   
> +void xe_setup_wedge_recovery(struct xe_device *xe);
>   void xe_device_declare_wedged(struct xe_device *xe);
>   
>   struct xe_file *xe_file_get(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a1d08e20cd34..60a8a60f1d9f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -872,6 +872,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (err)
>   		goto err_driver_cleanup;
>   
> +	xe_setup_wedge_recovery(xe);
> +
>   	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>   		str_yes_no(xe->d3cold.capable));
>   
