Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926F3B06C9E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 06:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477D10E651;
	Wed, 16 Jul 2025 04:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9OG5OJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174110E651;
 Wed, 16 Jul 2025 04:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752639714; x=1784175714;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h8qhxc7N4MdFFGcPD/MDyXqjxRT4rZVimpCVFpgUq8Q=;
 b=h9OG5OJ2hxDmCnlElnS7Hoyoq1kBaYlWqcJQPkU48gdmDQL1Rn2EfSGU
 cDhkZH9YpwBMVnGd/7VVLz3l7dhUfHRmx0rOxPr57NXLUbykeuGPcO98s
 CRhSxPV7OrNiVCLvhhzB8uYelvGARmZaMIbRxGtXHYMDeYV89TCL8JNqN
 8jhOdnJiseT6PLqPO6lz4xqWlL3vMvt+Sa1i1ti63ojO5m006JLJhYDMy
 sdKgsMV7vc12cT9n0uZt3s+DsB+VNHrWibBXCrfQ/Dsc0AeCNVWTFSxBJ
 z2aEnRVl2JvwTHruLTIWHHoQNe7XYPw93MKZ2Ucq1haQ0CoVaS0gsV4B4 A==;
X-CSE-ConnectionGUID: 6TWvKBQLSSK7WqvzOz18Iw==
X-CSE-MsgGUID: PZkux8M4TJKWvLjKFzBeFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65134899"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="65134899"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 21:21:53 -0700
X-CSE-ConnectionGUID: w7/FYLr6THWc+Xk7H/RK1Q==
X-CSE-MsgGUID: ReUzsbs2RNWZi9MjirIwjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157058440"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 21:21:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 21:21:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 21:21:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 21:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sg8nJkKOEXcvcYeeOJ70B6UipFUT/P8BV/gQZFmNeGWV0vVt2bHkOO1pRzRqB3ImKeR4HITKpH6bcpHNDRJjUAUK1LiQWPwGXOV0yPvATOuQ4CkvqebbTJQNEr0b/PcCkZXoePMmqrphzBU11l4rAJGNIyC/etcGLxD70wBJT09ovh3bMxICFUuP50l32BBPZ3fFAowaPKh5JgpPiKdZ1GQJFeZlA2ctWdAiG9w31XqBDzM0WWJD0CHE5BYgvizzLVBJouzV0gbarbEHGMEJthDI/BK+Vc0cPVXF6oU/gBrcXJdFY4R0nobgmkb+t3RleHkA99/tQomg3VsYeXWjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1th/TaptOJx7wysRISkieCARWDBmARYpF8iPn63UBlE=;
 b=o+Xw1hCIc93ckFytrnUqkws8mzQyOkeWY6yZrRrSEd5Fof4dC3PfXVuN4wKvgU3KOtadrR8vRSW/iiM8EmAxlGDMbpEqIasGOPtj7b8mCn/SzmwxzHKh0etT+20IADs8UfvhgA8GRHXLgfloQZJMwK5AweGDL4hW8flFehm8e6A8821J7wCxVjfrbdCnJsxmdQhmjQNqw7wRNWGJ8JYvGACVjdBe4yVUHR4u62cbVNP5QJ6fHUlH3bVdZPXq8kKrY9feCmVRri8J/m6IsxjgfpPiZ/w4y4+JFOXBw0DquWyGhq2aeObNOqPz2Rt1l/KkKUCZNEQhNQfq9ooIOCOeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Wed, 16 Jul 2025 04:21:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 04:21:16 +0000
Message-ID: <66d71720-9af5-420a-868e-89b8b4db9917@intel.com>
Date: Wed, 16 Jul 2025 09:51:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm/xe/xe_hw_error: Add fault injection to trigger
 csc error handler
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-10-riana.tauro@intel.com>
 <e1d33079c2213534ce33df56a2381604f570960e.camel@intel.com>
 <8a0d8ff3-c790-4dc7-8f2c-99390a6f5691@intel.com>
 <6577a9d9350ed89b869b92f8c18374bf09a783ab.camel@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <6577a9d9350ed89b869b92f8c18374bf09a783ab.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: e858fd20-2a48-4eb8-f7ce-08ddc420348d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3dmN3o3YWxEMU1IOWc0eHh1VUQzY2M5ZUxkUjUvUDhSMW45TUxQU3Yyck5S?=
 =?utf-8?B?UHN6THp6YUhGNURoLzhiVUZXQndIM0o0RlN1ZHdtRURpMTJTcEdlQWkxOVNk?=
 =?utf-8?B?M1FmbEpQV09iWFh1RktwMkovVUZnaDY3dU1HOEFQVzZtRTVESXZyS3dOb3Vz?=
 =?utf-8?B?Z0hONlpFOWpzTFAwd2M2Q2hodFhoYTVaV0g2SUxkeC81a1RneHltK1ZZQTZh?=
 =?utf-8?B?TEpKTXVKaUpGck9QMkQrSmhMdEx0bW54c0xYTmpaQzBWeXVhTitsc0pUTXFP?=
 =?utf-8?B?ekJoejRaTTZaZjBsZFdMcUt4TWpPSHV3by9YNTJsdFNpUTk2VWxKYk95Q3Bt?=
 =?utf-8?B?R29WRG02cUFBTnc4ZHlDdGt6VlhRV0tET2NvQ0hRWVBOM3VUTUJUOXJzMFJs?=
 =?utf-8?B?ZndXL3B6SFFEK05rTVUrb0tkZkFoZ3IzLzZnaTVOZW9vN1VkVy9LN1ZrOXpR?=
 =?utf-8?B?K0ZIYXo0cmUyekdvbi9uaWpQdEJPcDY0TVF1OENTbmxUN2hLcUpBRThjdzd1?=
 =?utf-8?B?VVVQdUpDOFk5V3U5aGVaaDEycWRpT21qblpQN2dBOVg1Um9jbDRFa0hkTlI2?=
 =?utf-8?B?akg1ZVlERm5LcUIvNW9HYmZ4MjMrV054VksxS1gyTGZ0bEVxZW9rOGVBMmg4?=
 =?utf-8?B?VmRCcW4yTjFHVHlCWnJkeWpwd0dOazYvcUVSUUhaQUhGcFg5MFZjM3hvdUY5?=
 =?utf-8?B?UHFVOTltMzRyQkVreUFRd0FKMlRBZHN6a1VjMk9FeEtER3d0ckxSQ3lxZFdz?=
 =?utf-8?B?NVYvQzBINXNFRzNlaE9iR3p4TEhVMnh6cnFRU29Wc3F2aml1enArVEVSenpJ?=
 =?utf-8?B?dllqdDZqS2RLOHdZeWhETkdJWkk2K2V3b3NlRFhaS21RaStKSTBvbW1kZjZY?=
 =?utf-8?B?T3M0YlFERk4yUDN5Q3V5SGxzbjdHSHJCb1ZpM1JxUEFQMFF6N1VIa3ViLzN1?=
 =?utf-8?B?cEQ3SVlqZVFYdFp3OHJ5RmNtVzAwRDNxLzdHalNNWEl5aUhkR1hsRjY4SURQ?=
 =?utf-8?B?Z3A0NURIK3p6TStHTXJzNkZleU02ZDIxQ0MwVlFkS1ZmeTBhNzhCS0Z4NWR1?=
 =?utf-8?B?VnNnSHo1cGlMZ0VEbGlEekNEd2duQy9SYXVJdktibWJHeTNNb0Rqd1AxbDRW?=
 =?utf-8?B?VzMydE9hb3pZcWord0o5SzcycDkvRmlzdlNsSk1ka2RuVW9tVWtERkQ4dHpy?=
 =?utf-8?B?UlpXZDdPenBucjZROUZiMExad0V1L3VOU3dwWkZrY05hMmFkVTFFSEJ4VVdK?=
 =?utf-8?B?ekZXVWs1SVBibmk3QXJKWDNXd3dsMGJBeGJQakp4ckk2dHI2MGplM3VxK1ow?=
 =?utf-8?B?Y3NOV3pRY3JlNWkzMWJUUjRZdmJPdWlXVXU2aUNKRzVERTlGYmhzcG50M2Uy?=
 =?utf-8?B?TTQ0N29vMHZaSzAvYXJ2MitlVkVlWUh5N3NKcm5ib3FGS0dLbWZrcmNYUVcv?=
 =?utf-8?B?SVVhTmROV3h0bTMrVkNCeGUrNXlMQ1dBR1k1ci95N2pVZlMvajQyRUZrY09n?=
 =?utf-8?B?d2FuTTM3RCsrTEJLdGl0bVR1b251N1pEdlVmWngzWkI0cHpJV2MxL2tCZEJz?=
 =?utf-8?B?djVoWWN4U1lJRlFCNHhkNGJJOGpwU1lkc0NXcWJFVm5hWlptWDRNbmZMakU1?=
 =?utf-8?B?OUQ5MXZ3Y1hzejYxMit0a003V0NjS21SaC84MEE3VTNDM3B5TWpYeXBydE52?=
 =?utf-8?B?VWNITkR1YVhyQzBVM0t3MFRCVDNkY1BVS1BCTk5hcFhnTnAyRDFDZzZNTWZr?=
 =?utf-8?B?QVo4aG5lTTYxZnA3NWZVempIMDFic0pBTzlYV0M1Rzd5MUgyY253RmRxYkFy?=
 =?utf-8?B?L0RnYjl2RCt3T1pGbTExNG8wWVNjSXlNYzc2Z3RLdS9QTk41MTBYcmZtQUZx?=
 =?utf-8?B?aldsUUUvY0l0VkhDT3V3NGQySXdYUHJTVU5qd0FzZ01GRmZWa2lQMXBDcVIr?=
 =?utf-8?Q?HpYkTrMfqnE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk1UdklzbDRDN3AzTDZ5YlRaZzFBS2lRSWo4MGNOVEJpOGRYejZ1TW1lRGxr?=
 =?utf-8?B?MVFteWJSdzhWcVRMSXowaFpyeENVVGR3UGVocll5THFGM3A3a2c0VWp2QWpJ?=
 =?utf-8?B?Vm5IeXFNeUQ4MDl6RVVvcjZFNXlCWU5sSTlqdXRISjJBazBsbWZmZktrRVBQ?=
 =?utf-8?B?Q1dzVWd3cTVKQ0FLT3lzSE8xZ1BnMEg4Tmt0eWVyb1BzWGtIMThBQm1sTkk5?=
 =?utf-8?B?dHYrNzkrVzBJRHZPMC9zdTc5eDQ0U0dOalFOSUMzQkFDMk1MelkzNzVnNnVx?=
 =?utf-8?B?KzBOeDBMR0ZSSkJtUmlLbDFwd3E4dVVZS0sybEU2cFE5b3gvVFAvMFRRVm5n?=
 =?utf-8?B?OE55dUdBVG5xVUFkMnRxaDhadHlBbzV3alpEcytTQ2pZYmJUT2I5d2pqR1h5?=
 =?utf-8?B?UGgwOG9nbDZzdEN2cUl3bnlDV2l6bks3QmZBdW5tSERlNGZoZWQrWGVJcVpT?=
 =?utf-8?B?RG8rZWFFN0lWd1cwcU9nT0I4OXZ4NjJ2clRCVDZTUmhpQ0NNZmFweGhqNXl3?=
 =?utf-8?B?c2hPVk9YT1M3WUg5VGh6eGhtTU4zT3RQTmkzcWhVOEt1SE5NY0dzTXh2Zk92?=
 =?utf-8?B?OHdYSkxrNWlVMEwxMWRUODU2eGRlaEJYYVNUaTh4T2hrdkVuWVFzZXlLU1lI?=
 =?utf-8?B?aStTR2ROekpMbThkZUxDbTAxcTNFZWRQQjdtUzhoclNCRlM3bGJmVXdUd09E?=
 =?utf-8?B?RURwSDIxenFadm00c3M0YUhLMzV3VkNVOGpzQmhvVzQzNytvMmw5SGFWSU1a?=
 =?utf-8?B?cG5sZmNGVjVYeWdwcjRweHRCWi9VcVJrMjJXWnQxVVYvN0JCTzZYeUk4ekhB?=
 =?utf-8?B?bU5TeWFrY3d3VTlXTlRyYnM1TWJ3MkZ2Z0IvaTFIRXFKMlZqTDNhL3lBdDBX?=
 =?utf-8?B?NkNvMjJ5djNxQ0Y0VzVVNHQ1TWE3N2M0VFphczFRTUNXN2F5RERkdWhObmhF?=
 =?utf-8?B?VDUyZ2hVeDJQTC9KNGc3WU9HVkZtL2RhQW5Od2xiM0xya3F2eFRuL3VjMmZV?=
 =?utf-8?B?M21TRDI4L3ZSYlRCT05mN3l4UEV0MkpRaFpPZ29MRTM5NlNmL09sSk96b0Jq?=
 =?utf-8?B?K2hJeTRCaXpFRkZJblhhNHBHNzlNdzIrMUthM1ZWdEtLR0NYUnA0Wnp0UUU0?=
 =?utf-8?B?aFRxSWQzVDdwcEk5YTZZdEU2N3Z4eEJzYW9aL1RlT01TamZJZU9EUEVsd2oz?=
 =?utf-8?B?YnZBdmt2dTV1TmFyNlhkblJ1REx0SXA4SHFXOTNvVjA5NmtxbGEzRXNWOUcr?=
 =?utf-8?B?VVEwTlBjdGNMdTdXYWR4OGpESm5ha1MvUmRUMlZ6RW9KSUJpM1Q4WXZRV1RV?=
 =?utf-8?B?bU5wemovd1hZWjRhQmdwNzVlc0h2NlFyc1g0WERrdEx4VTZaOVI2US9BeWRQ?=
 =?utf-8?B?REprbXNoL1puT2NxQW14emJ0VHFuL2dpTmZVZGtwNVFxcEJrR1A0TW5mK3Fu?=
 =?utf-8?B?YWtYRFJINFNPUEh3Y3QrdE5JalV5QWxtVTM2NUx5SFhwWHZ2dk9EeCsxY3BQ?=
 =?utf-8?B?cVUrS04xekpJS20yS2JmNUZoeEt6czlCQnFlNW12bUQ4SlRNSWQzdkZFL1g2?=
 =?utf-8?B?RW1aZUpuYXpRbGd2ckYva1dkcTZscUhCaXZrbTlORVQrV3NGMWpVaFVvVnFP?=
 =?utf-8?B?blliNHlQZnFGUE4xVDloQmxUTUdXa2NLV0QvMHhWQThXQ1dBV3FDODBFYkdZ?=
 =?utf-8?B?ZDMyL0I0am9PMlBUbE5BTjV6R0ozT2JRVlVsT1NndjY3bjdPOTU0bUplOEhw?=
 =?utf-8?B?b0tJYWE5ZmplWE4yb1hGdDh4Zy81UUtzbXhlaDdCWmNEY0prTkpWdUFRd01T?=
 =?utf-8?B?aGp4MDdBWVFJVCs1a2lZQklGdUZnbnZzUXV0SmloRk5GTFgybEdMcit1VXF5?=
 =?utf-8?B?aXdxYTVMOWJOa0ZYL2RHTGI3alJ1RE1nTDA4YVYzYXdtdjlSK0lydSsvVUtC?=
 =?utf-8?B?OTBkZ2NpN3diWjhxK1hVYmlWb29yNVdiUy9aYUpzeGNpU0lUUnlMT3Rjc2xl?=
 =?utf-8?B?SHg5K09WZFJjWkc2UjlPdExpUlRzVjd2dG9nb3c4MzFza2xQWElBOC9yNlJv?=
 =?utf-8?B?RkxzcWVLZVFaOTFIUzIrQlpROVVtMlBvVXd2amw4dmZ0aE9wbUJ0eit2SkJR?=
 =?utf-8?Q?jv38T8bFehPDK52SzpUx4PSD8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e858fd20-2a48-4eb8-f7ce-08ddc420348d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 04:21:16.0186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uIDux7NndgHVRM+t+RinupKfGirA1t0AtF+ssdP0mY1dWvDejIWr02Ae27kVDWoPdQ4mF0mvflee1OyHP10DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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



On 7/15/2025 10:28 PM, Summers, Stuart wrote:
> On Tue, 2025-07-15 at 22:09 +0530, Riana Tauro wrote:
>> Hi Stuart
>>
>> On 7/15/2025 7:40 PM, Summers, Stuart wrote:
>>> On Tue, 2025-07-15 at 16:17 +0530, Riana Tauro wrote:
>>>> Add a debugfs fault handler to trigger csc error handler that
>>>> wedges the device and sends drm uevent
>>>>
>>>> v2: add debugfs only for bmg (Umesh)
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_debugfs.c  |  3 +++
>>>>    drivers/gpu/drm/xe/xe_hw_error.c | 11 +++++++++++
>>>>    2 files changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> index 26e9d146ccbf..95057c04a022 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -31,6 +31,7 @@
>>>>    #endif
>>>>    
>>>>    DECLARE_FAULT_ATTR(gt_reset_failure);
>>>> +DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>>>    
>>>>    static struct xe_device *node_to_xe(struct drm_info_node *node)
>>>>    {
>>>> @@ -294,6 +295,8 @@ void xe_debugfs_register(struct xe_device
>>>> *xe)
>>>>           xe_pxp_debugfs_register(xe->pxp);
>>>>    
>>>>           fault_create_debugfs_attr("fail_gt_reset", root,
>>>> &gt_reset_failure);
>>>> +       if (xe->info.platform == XE_BATTLEMAGE)
>>>
>>> I'm still not clear why we need to limit this to BMG.
>>
>> CSC errors are only applicable for BMG. This bit is not in prior
>> products. Adding a fault injection and testing flow will make sense
>> only for supported products
> 
> I'm looking in bspec, for instance at the non-fatal errors (53075), and
> I see different platforms implementing bit 17 for CSC non-fatal,
> including, as I had mentioned in the first review, for LNL. So this
> isn't only applicable to BMG. 

The recovery mechanism is only for BMG in fwupd. For LNL, the logging 
should be sufficient which is done in the irq patch.
Wedging and runtime survivability flow testing would not be applicable
if recovery is not supported.

Thanks
Riana


> We might be taking a call that we only
> need this on BMG, but IMO we should be clear about that since it isn't
> a case of not being supported by the hardware.
> 
> Thanks,
> Stuart
> 
>>
>> Thanks
>> Riana
>>>
>>> -Stuart
>>>
>>>> +               fault_create_debugfs_attr("inject_csc_hw_error",
>>>> root, &inject_csc_hw_error);
>>>>    
>>>>           if (IS_SRIOV_PF(xe))
>>>>                   xe_sriov_pf_debugfs_register(xe, root);
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> index c5b3e8c207fa..db7417c390ff 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> @@ -3,6 +3,8 @@
>>>>     * Copyright © 2025 Intel Corporation
>>>>     */
>>>>    
>>>> +#include <linux/fault-inject.h>
>>>> +
>>>>    #include "regs/xe_gsc_regs.h"
>>>>    #include "regs/xe_hw_error_regs.h"
>>>>    #include "regs/xe_irq_regs.h"
>>>> @@ -13,6 +15,7 @@
>>>>    #include "xe_survivability_mode.h"
>>>>    
>>>>    #define  HEC_UNCORR_FW_ERR_BITS 4
>>>> +extern struct fault_attr inject_csc_hw_error;
>>>>    
>>>>    /* Error categories reported by hardware */
>>>>    enum hardware_error {
>>>> @@ -43,6 +46,11 @@ static const char *hw_error_to_str(const enum
>>>> hardware_error hw_err)
>>>>           }
>>>>    }
>>>>    
>>>> +static bool fault_inject_csc_hw_error(void)
>>>> +{
>>>> +       return should_fail(&inject_csc_hw_error, 1);
>>>> +}
>>>> +
>>>>    static void csc_hw_error_work(struct work_struct *work)
>>>>    {
>>>>           struct xe_tile *tile = container_of(work, typeof(*tile),
>>>> csc_hw_error_work);
>>>> @@ -130,6 +138,9 @@ void xe_hw_error_irq_handler(struct xe_tile
>>>> *tile, const u32 master_ctl)
>>>>    {
>>>>           enum hardware_error hw_err;
>>>>    
>>>> +       if (fault_inject_csc_hw_error())
>>>> +               schedule_work(&tile->csc_hw_error_work);
>>>> +
>>>>           for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>>>>                   if (master_ctl & ERROR_IRQ(hw_err))
>>>>                           hw_error_source_handler(tile, hw_err);
>>>
>>
>>
> 

