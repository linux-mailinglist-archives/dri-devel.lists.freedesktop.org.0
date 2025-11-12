Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B00C5272E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E326A10E72E;
	Wed, 12 Nov 2025 13:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ3KvyGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A321B10E72C;
 Wed, 12 Nov 2025 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953817; x=1794489817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PPQAx4DeEJiFg2ORqs8oWjlULiyKgbS0+qQGGLDmU4U=;
 b=EQ3KvyGKrxkJd7UsrdCgIniGGd+qf4g1vMJclSmAV0BW+0HaSANC9VFp
 CobUf1HWtvRc9238sKdGWfAhs63RsFqsWmIqvmKMCwG2gwDZJ6VzEF+E7
 M9nD+xmmy/83hTw3XYWpJ48B6bswBCLZWUuh3+S7izVPXoRmXtj0eD1on
 4iKTJom1oLRomu9nWiZZPpscr2KfxdWYbWw3PJM2kxeoI7t7nJLuybzx9
 UjUpp2wmMrBc9bQrc7suNWmpc+tZEhA2H72JdbJWO4EdovLLvgEHe6lv8
 SIg3zijj1MgV752yP+iNk5X5wYE74GN1qHsRaZadrV2IA1o68dWQtBgZF w==;
X-CSE-ConnectionGUID: Ns3n/VyxSIK3+i9X/PZXqw==
X-CSE-MsgGUID: YoNmZYYLSQaHWNmbzaUe9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68649714"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="68649714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:36 -0800
X-CSE-ConnectionGUID: c+mkF+KQSAi6j0BKUjuE3A==
X-CSE-MsgGUID: se57oxJvQS2y20HD+u1EOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="193467984"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:35 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXIOdli9TjFslmVAZHemPv8Fy8jLsTofGrdM4NVu1/FkKkJ3G+UOFerYfWmPn9Y7gRChILehY24ti4YBPCpVut7JFMHD9vVXYaiqkSeqDFQv2pjeSH/32iCbnSLcZ75oWP6sN+WVnHePdZRxm8fMWf7ZUwNzgRlwzKCVsm8hmy7z8RIwI4/yFW0ep4/KbckHEbGZ4TGfKFuGz+G7/kmS2VktDyvEQyuEVxfukHE9yrXn9G4M4/BW8ka4PEO9PY802b5wagTapMLdxkc59gZP1kT44fd+9LHFSsjhmVTeQ1dU7pxjMtoTpYIlJcpi2atT+arbnahxY/HRxl0oR39Z+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aDp9rQ7TgdszQJc0aFTs7fQW8DNiLThtbjj9Xt1hyY=;
 b=GffwLNZP0XBlZl+cj30r3ZZq+/LG8/MBxRcJLNIDYuY3lZpBnLSvHI7Bzk+ZAGVjLp6zaNkzP3XtRHf7UWXw4CZvu0w388vCkImJn9MD55mbtHdiIeeZOSK2TocO0VwiRFnYx6lH2IzyEq/ziEwpfJgZvAmjcKf6QYPIfKkgufMDGPC6h0B77UIiKXWFSA2LZ3hgCMlzXi0sH6Jm44t8PUR11M8VyrZGNMLNYNjEnHP+UfY67HPEaA0KOY+2LzBa+8Q8VEtBpjMIYEuYOq2gnBiWXv/LFMXe2WxwDqAhzNO2y/SC4HJLy3e6S5R693KWigcHUCmSQeOduk8l+2adKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:23:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 10/24] drm/xe: Add sa/guc_buf_cache sync interface
Date: Wed, 12 Nov 2025 14:22:06 +0100
Message-ID: <20251112132220.516975-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 114b0f78-14b7-42c6-c048-08de21eead2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUF4TkJSd0FUc1N4Sk12dG4zajZ2dFpib2xUK1VreFhuRHlPRE5sN0dpdUtU?=
 =?utf-8?B?V2dZY1FCM21VQkFWbzBxSTFaaGVPdTN5L2sxTys5UXBxZE9vYmhYekdNWGI5?=
 =?utf-8?B?WHZHNUhSbkNDWWs4Zm1BbGhtRU9FMnNaWEFNWG9jc0dnZjE5YzFjUTZzS0M5?=
 =?utf-8?B?RHFiczFUeitxMldBNy9RZ3hUNFpSMWc5dE9uU21IZUtaMlM2aWhoL2UzREY2?=
 =?utf-8?B?ZXZTbE5XWFBzQVRtdmE2WFR5bW9uZkpDNWtUa1dwR1pZaEdKYXpKdVAyMmMv?=
 =?utf-8?B?a0ZnaXRjT09jaTA1QlRVc2Zmd3BBdUEweUg3cWRaczhvbllEd3F0RWlsd25t?=
 =?utf-8?B?ajVUeFR3YUxZaFBMV3pSTkpiT2hidSt3NlVTVmxMdmtIV1Z3amlma0xkL2l5?=
 =?utf-8?B?cjRJOVNnWG5XMnF0RnhzZGFRZFhTY2drSFY1M3RmVTRDU25mUFFWWFJXSng1?=
 =?utf-8?B?cU1FQ2xaL2YyNlJ0R0pjYnNjWXdIMHBCcDhvWVJlYk9KLzdnZzNNQ0dYVElx?=
 =?utf-8?B?OWtIOG95dit2ZmhmcERBNFFnK3dMdDJVN0doNGF1OW5aQTBwT0JPSG02RjhG?=
 =?utf-8?B?VzNVSGNJbjdCVDhnWElOclBaaXpoaUZQMUhLUjA0emJGdDI2MklJUlVHMVhX?=
 =?utf-8?B?NlZ2b1VuQ3o1VE01anREVTZLS3FSaC9TSnBRMm1HL0FCN3RMbFJMWlg3WmVj?=
 =?utf-8?B?VVN5dzRGZlZYVGw3L2FqemlUa3cyck14WGFlTjl1Q2NDOEt2SEVFYXU4ZW0v?=
 =?utf-8?B?MFZ3Z21LemxmemtiRmh4SFBwbllmSXdPUUZnazB6NXo3d3FvQkdkNXlhQ3di?=
 =?utf-8?B?VnhxRVoyRlIvRnY0VlZxOXlUUVZNTC9zaTNKT0JUbUZZUU9ZM01VYTM1Vko5?=
 =?utf-8?B?a1B5VU5QcDJnK2pWTG44MENEeVZNOUQzKzRPSS9lRHBENTJ4NTNRYXVsZmFU?=
 =?utf-8?B?YzNQblpwRm1DZC9UU3luOVQxRElWOU1CTHIvYTdjd3NOZ1o0Y3AzUWxhczB2?=
 =?utf-8?B?WnViYkZVUE03NGptdjRQYXE2MEpYU1JORkl6alJCd3JTTVVWRGVKMWV3Tnc1?=
 =?utf-8?B?ajdjN3lPMTA5NUJNYnVGZGR0ZUZ3bDlXTkV1ekJHSkhNbHRvU3hrb0pZRHll?=
 =?utf-8?B?eTVPd0tSWHgrSjI5bmhNUE9zMU1FS1M2TG5TZFB1SDJzTVpXVWFheTZyWnJB?=
 =?utf-8?B?UVhNalJwRWx5NDV1WXFyLy9LSFl2WGZ0NDFPNEF2S3pEZVVsd3V3czY1aDdH?=
 =?utf-8?B?TDB4T1R5dlh1RThGZ3hpK0lSa1E1ZXN2aFhMeEUwbUdFOU14UzdoOXJTZDdX?=
 =?utf-8?B?UDEvQ0VNTjRFRzRpL2phNENiWEtaNno4YnNkelROWFFSMUZxWUJaT205NEJL?=
 =?utf-8?B?T2haUDdVbW5SY24wc2VjODdnMnROcm5PNDl3UkpFVUNQS1ZhbEpaRVhXN3pX?=
 =?utf-8?B?RmYxZ0lTY2d3SERXcUk5S0FZTkZtTzJsVGduYTZXdkRqcC84US94WjVZS2Jm?=
 =?utf-8?B?VGdCbXFZQXBPblFSc28rdnhiTnRqVXE3aGd1Mm5JUW5pRWEvUWdrOXJDZzQ4?=
 =?utf-8?B?QU0wbFFyVzROT1NIclZ3d05ucG9EZlQ1M3p5S1hjL0w5S1pBSTk1VU1HcVRC?=
 =?utf-8?B?UXJHY3ZQaE8yc1pVNHpCY0RncDB0dGhiZXFsR3VaZ2FVMk56bEM0ZFZaemho?=
 =?utf-8?B?MGlnSVkraGUxQWNvRWpNWHM1UlQ2NGN1OE1aMm0wQU5BZXY0ZDV6cURxSm1o?=
 =?utf-8?B?NTJNYndZSlVSclpmMXdwV3BGQTZycE1yU3hXcU5pNHRCSVNKRWVZa1YycGxM?=
 =?utf-8?B?TzlNR2hGenBJRkltcHYzN1pCVDNLZmtaMWg1Q1NaRno5a2xGems5T1BkUGEr?=
 =?utf-8?B?V2lHUEpxdXZsRWpPOFFERkZrMTZWYjF2cmJHRkgwVFdmTDhnZkdtTDUzNmdw?=
 =?utf-8?Q?3Rrx5D/bq9zr4lkDSTr7qhwuZ74tDBz1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRIczg0NEdjSXdiQ1NTZ1MzdWlwbFNBRUJoem5QUlZldkxVRkJIa2xxMUtT?=
 =?utf-8?B?VFBDb3VMYVEyWHFVajRwdHNoQlNDc25jQUVqTHVFUGpXL1djSU1pM2Q1eUVx?=
 =?utf-8?B?K0FrK0FaTG1YRUhTUW5tSW1LQWxYd2VHQUJsVDQ4ellXSlo1dlRIandMckhK?=
 =?utf-8?B?M1paNGZhVUVQN1RSQjRYalNla0Fsa3pBN3V3T1F4VCs2NjVNd3V3ZDZIcjJQ?=
 =?utf-8?B?cUUra0c0TldadWcvYlJnVE9TOHloajRsQWdTbW5DYXVRbm9qL3Mrb3RHeWd4?=
 =?utf-8?B?aSt3WE5kaUNkRUQ1Rm82YnhVeWNnSElINGphME9HQWNrcDQ5ZEM0a0RrTkdD?=
 =?utf-8?B?ejhmV080VjNhSkI3eTV5dWxTZDNTcCtUcHF4RHphZ0MrcmRJeDI0Y3BtazYw?=
 =?utf-8?B?WTkvV2FLM2ZlVENxM1RveFh5bFhaaDFGL0ZOK2pUZGdNVkRVZkpWNXhZS2ZP?=
 =?utf-8?B?THJhTDZiZ2puMGxpL09vOUdkVzFSRUdKQm9BcUR1THlLcVAwUDVWWitSK1hi?=
 =?utf-8?B?L0RrT2U0WGhOTjcvOXcyUE16ZkYvWlhOc1RZZXJrZEh2eFB2VExCNlEydTNy?=
 =?utf-8?B?eVlBZ3lvdVZxTWRQaisrcUpUOE1IZGRyVy9oUGY2Wm8wWWtoUEJ3UTRZeTlD?=
 =?utf-8?B?WnVCeHBLM0J0dXRYaDQxL24zYXF6VHhCRm50dVJENG1wdmVkcGNUVllWSVUr?=
 =?utf-8?B?RksxUTREUnR2dFYzL1R1WVgyVHA3R3oyUENlcjlQQ3ZneTJFekw2ZFJESDg3?=
 =?utf-8?B?WWp3UlBBcVhvMlR2TURSdmQzVEthTzd2SUltQ2ZaeXVtQlU1RzFmWWsxZlNn?=
 =?utf-8?B?dlRkaG9SbXRXZGd1UnV5Q3VYZ05NcTIrRDFlTWpkZDlTUmNIL1QvbU40WDla?=
 =?utf-8?B?MHJnMWZXanp0VlJEWnhrK0N6d0xVOGMvR09GZkFuNktFUWk0d2RBWHpUZ3Vm?=
 =?utf-8?B?RGY0UkZrb09SMWFVT0xiUExkY3lHOCtYK2w3VE4vMzM2akxucGNCWnR5NHJD?=
 =?utf-8?B?TzFicnlnN2Z3Y1A3aWx1R1FDdFFZcVVhNEp5aUxZcG45QzRGN1J4VU9KN3Z2?=
 =?utf-8?B?dXgzT3pqOTRwQjZ3VEpFMzNwMjBzVk56RDAvS2pYWWdLZXhLRUJTSU1RRmxw?=
 =?utf-8?B?VUNiYmEvRTBxdFFkZ3o2dXlXaXExNDJBYXlma05wNUxmVG9yakZERzVZdC9r?=
 =?utf-8?B?K1dxaWdTNWQvS3dtU2xhRXBWNVhkLzVqeW9vOEtwT2VIK3hNUW9GeDdnQWl5?=
 =?utf-8?B?d2IzS2dEaWx6UFMxd1YxVTZibFlqMXBoSU1FQzRqbnNyL2dZbXBpTk5OdWMr?=
 =?utf-8?B?TEZZaTFCWjUvZ3ZUZEZtMU5GaVBMYUdmV1ppeE94eDlNd1NYdTdVMHNpa3VT?=
 =?utf-8?B?MzZNODRyTy9PM1JOQis5TGx0ejVhNVRUYlZjNzNQNEF4S0o5L3FSQVdWYnJx?=
 =?utf-8?B?cnRTUThFbmRPdmx4SkRKSWlBMm9uZWNHb25TZEo1L09DWjc5am92YjBWS0Zp?=
 =?utf-8?B?TmVERVNidXExZVh1Vjh0QVFBQ0NoTzJHRzlwK1ptV1FQNDRPeUtPY2JveXVz?=
 =?utf-8?B?OUlWRkZwbnpuMXRIWGZSSytuR2NFUkM3ZkQrSmp1Ynd5OFpOT2RKWWZVQzBR?=
 =?utf-8?B?R25qUFZ1a3NuYUZ1bERkbHFNdk9ESnZ5dFAxcXF0dlo3VlI0MEc3ZEpzL2dV?=
 =?utf-8?B?QTlwMEVhVjJRZUtmM2hYNWhsT3pqVUIxK1ZKd0tOK1hmSkZXdHZqVE5iMzhT?=
 =?utf-8?B?cFY4WnZLQXh2SHh3MS95OWlZSFlETjBIY01jd2dZbEtxU1N6bmMyQTQvdlZw?=
 =?utf-8?B?RU16VHl2ZTA1SDUyY3VqUXlpNFJLWURjUEhQVUcyMzJnZHRLa0VZRlNPU1Vo?=
 =?utf-8?B?dEo3bHFsLzNoUXYrVnd2L1BYTzNvdnR5dGQvdkp4WnZ3RmNXaEZ1eFRxK245?=
 =?utf-8?B?bmJObXlPcjYvWnFaQkVUWnNtT2hQbkZuZk83SVIrQ2NtMkJZcWRoV2UwU0ph?=
 =?utf-8?B?aGhkWVVEb21vU1c0RENQRWFOUldqNnZPd2daanhpclpGUEFNRXQ2emJCOGsy?=
 =?utf-8?B?UFNrckhVV21xT1BKa0g1WHJVajZDUkJVYmlNQUtHOVVucnYzWUdWbHhEd2xk?=
 =?utf-8?B?YXl3cnArdDV1ZzhIdGkzalhlNDdYbVp6YVBON1hlRDhudEliTXIvaFhkQ3dL?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 114b0f78-14b7-42c6-c048-08de21eead2c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:32.5972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNlNSTcWJ3T7ifOVSGyZlmmHx5lqiqP6GouIoWNTr/ClRO19TlwI3qdm3CG0CwfJr4w3czGEOxPtCxzi0g4qqHVPlGaLBkZr1VRlp+FBrp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

In upcoming changes the cached buffers are going to be used to read data
produced by the GuC. Add a counterpart to flush, which synchronizes the
CPU-side of suballocation with the GPU data and propagate the interface
to GuC Buffer Cache.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  1 +
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 502ca3a4ee606..4d8a4712309f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -115,6 +115,19 @@ void xe_guc_buf_release(const struct xe_guc_buf buf)
 		xe_sa_bo_free(buf.sa, NULL);
 }
 
+/**
+ * xe_guc_buf_sync_read() - Copy the data from the GPU memory to the sub-allocation.
+ * @buf: the &xe_guc_buf to sync
+ *
+ * Return: a CPU pointer of the sub-allocation.
+ */
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf)
+{
+	xe_sa_bo_sync_read(buf.sa);
+
+	return xe_sa_bo_cpu_addr(buf.sa);
+}
+
 /**
  * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
  * @buf: the &xe_guc_buf to flush
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index 0d67604d96bdd..c5e0f1fd24d74 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -30,6 +30,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
 }
 
 void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf);
 u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
 u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
 u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index fedd017d6dd36..63a5263dcf1b1 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
+ * @sa_bo: the &drm_suballoc to flush
+ */
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 {
 	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
@@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 			 drm_suballoc_size(sa_bo));
 }
 
+/**
+ * xe_sa_bo_sync_read() - Copy the data from GPU memory to the sub-allocation.
+ * @sa_bo: the &drm_suballoc to sync
+ */
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo)
+{
+	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
+
+	if (!sa_manager->bo->vmap.is_iomem)
+		return;
+
+	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
+			   drm_suballoc_soffset(sa_bo),
+			   drm_suballoc_size(sa_bo));
+}
+
 void xe_sa_bo_free(struct drm_suballoc *sa_bo,
 		   struct dma_fence *fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 99dbf0eea5402..1be7443508361 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
 
 static inline struct xe_sa_manager *
-- 
2.51.2

