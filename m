Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E9BCFBD2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68E910E357;
	Sat, 11 Oct 2025 19:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBPX/LDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EE610E35A;
 Sat, 11 Oct 2025 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211714; x=1791747714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aH8r1Nh77vajXWV5tKbJrrtgm1kUGVpn3+LOFwaUq4Y=;
 b=WBPX/LDIdgPRypJHh6g2XWFlwrFpuuL0157S3+SG7LQ4yLQdBp7Ock7F
 J0PCsFLFbZOIJzTiruyM4vyd1KtLIEGACDVqVB9rjiAa6JU81YM0hIXbK
 R9yzI6BDGkorQGmStpzWXAfJHnGx3mSNxO1Tk8g2DGip1i6q7gjPGm4NV
 D3gMt2b8drjoPhArH/yqAQHPt+pe3dZ3Y31k3sGPrC8ch1Q6k35mHm33a
 Bq+ZykwsS+XXGBgX9K3Ip4xM5M10F9Mjv2o4zomRhmr6QD7wve1kJLVTV
 v0rd5F6/1/aUYw+TblKxYmBzAWeIcQs7hHfFdUDWm895JcjbleW6JSY54 A==;
X-CSE-ConnectionGUID: cuoysQb5ScWaMkvw1F16sA==
X-CSE-MsgGUID: K8QNz50/RyqkNr/pAQF4dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="79840934"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="79840934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:53 -0700
X-CSE-ConnectionGUID: WF89nsAYRf+grAZhLPPQrQ==
X-CSE-MsgGUID: 8SiogKQ3Su6olVDNliCnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="218344775"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:52 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX4/I4yazVHb9shhFnRFVHJ/1XVioop5q5nIE5Mfk0n2hCiNVgaTy1JkND1YtT7gmBY/zZOwTb9sNl0XlCEqduSbr/Q/8J+DSg7WikvwteyTzQPNoYqJDDGaeXPw6FfqDyvaxR0kjAx9ydNhBIFjq2TVkJSyWcXdJjjRqnLOFugCwdsalqrE+n/ybCnezjLsgVv8yvIlouG7yoDK6G2TS8gxw61LPCQPIzSNSDx96D7oo7CSFXAKN+Rm5Z3hX5t8CCeFL+OWBJ5Q5Q/w/2fbUMtOSHYtuMn4Pp3K4mIY47UvawEdh+mHWaabpSEAqvJWTWMoKfYSvvgsC8WxLrcl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMHsaogBrJDVe+MYnJ9hkB1OvzXouNdEd3/TbSKPINI=;
 b=K0bcmYSb547Tlu/XaOgfX8rff2VujuVIxuuRREwJTzbsAERci5XSCDmpDQgSjfZCj7ldAotZyEYNCciiFcfXAsRlTViff16Xldegpch7pDQXnKGasp3mCt0KWqCGDELp2MadjxxaYUt1IGptFX5kOLnSMOw6R2MkeBAog2Zak2+pY8qtLpP/k4hitHziFOzz2fj05Fzsqpi763nx+wTA6gwmdfNYAG1rtKYboG5/yu5f2mhF6nFBZFBq7TQ5KsEdBQq5+r5zhqrh8w1yRvhMRto0zK8O2z29V8+GMat3frNqxdSxT7JcSCDNdLVeojuXAislop56tVaYXEPn6jaenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:45 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 20/26] drm/xe/pf: Handle MMIO migration data as part of PF
 control
Date: Sat, 11 Oct 2025 21:38:41 +0200
Message-ID: <20251011193847.1836454-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0150.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::34) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fa9de0-e565-4223-daa9-08de08fe35e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bi9iU1crbTJoY244UitOK3pXN3FrMjhHaG5JOGZ2MFNUT3lsSjRSSGRHa2tG?=
 =?utf-8?B?cVZwdDRTOHlNb05KTTUrdkF0NUNnWkZwbGpxdWpBMUIycTZJQ3FFdTRGNEo0?=
 =?utf-8?B?MTFXRWZXRDdvSGhaNnF4Y0JpNVR1K01VVWF6eDF4TG8rTDlnazZkeUlCMkJW?=
 =?utf-8?B?WGRHNndoRWZHWnJnTFE0Myt5dG95bnZWNk1TRnMvaXRMNEpySXQ4dmFObFRX?=
 =?utf-8?B?SXBFbWlhSjl0eUtnTU1Tbll0UEVKRFVsdFFlQ2swUHM1bnd4bFAyZ084UC9C?=
 =?utf-8?B?L0ZCenNjNUhyQkdoWk9rbTRaUDhQNlNqdWlxOVNkK3NUQ0N1Zm5DUWx4T3FS?=
 =?utf-8?B?TEYvUi96ZmxoZjBvRyt3ZXF3ditSVnNLZW9sQ2oxaW5xTHRLOWMxZGhUbVRZ?=
 =?utf-8?B?MUw0NDZoTGp1YnRjVk43WmR4c2xRSU5NWWZ3MjJuaitLeXFZVkFHVXkraHpv?=
 =?utf-8?B?RWUxRXo2SkQvSmxlUklBQzB5YStOR2J5NEhCMW1lNnlZRTNIOTR3K2U4SU9F?=
 =?utf-8?B?Qjd0MjFKb1RFRG5CUFdYM3VicVJSaFZkRnNZVTJuSDZMellmTklZSitxNC9Y?=
 =?utf-8?B?YldqblhqbG1YSXE1MDJueEExdFFsR3hrYVBzcVdzSHdQZmhRV0FjbE9kR3VR?=
 =?utf-8?B?U2VQSy9VNWlEaXc3R3JkYjRGZXlxb0lDakc2ZHNzN1p6U3JyUmFBVkc1VjRk?=
 =?utf-8?B?SnFCWXBGNzgwYkdkanBBTnhqZVV2d1FDN0JTdFBUUEYxWmphMkJnU0VTZS9s?=
 =?utf-8?B?TUNsTnY5MkNyeDFyTTN3VEVhWVZDcW1qazVndmphTVFJbHltTS9mM1M0MXdq?=
 =?utf-8?B?Zm4xZ2VCb1g5elBlSmp5U1oxUGk3bTk3Nks3ZjJhOUR4a29IbmZxcUdLY3Iw?=
 =?utf-8?B?SXp6N3lFKzRlNkxCMjZKdU5FQVd5eXJzdURVMUZibVNUdGJFSnlyeU9la3BD?=
 =?utf-8?B?azliWmhNM3UyL1NLOHJ2ZWwwcmxGR09nNkppOTI4N2NWR2dtT1pocnRmZmJB?=
 =?utf-8?B?MWxoVklSOS9GcVlnUXlURTd4Mlc5dFhHbXc0L1NYZHJ5b0wzK3UvRHBQbTZD?=
 =?utf-8?B?RWF2SllHQi82amtlNEdIR3E1dXdXVmJxbEdiL2N1SXpNQThQVTdTTEc1QkhM?=
 =?utf-8?B?WjNhbkNjdEJhckNxSlBOTWdCbHdRWWFVbU9zd0dZdExBVFVuZkpOU0kxbzUv?=
 =?utf-8?B?alBzM3dpbWJyVVovcDVHbVBPb001ZjdFSk5oMEl5amZIeE1qOUhLck5pVEV3?=
 =?utf-8?B?cGtEOVd1RWxDUXQ5RXVRb0lhYncwUnVqdnRpK3RkaXdzb29WY0hodHh6Y3dX?=
 =?utf-8?B?Um5RakY3VHZQRmlySndXOWcwdk5XNHVMVTRRbnlkWUtWYVNaMmFrVy8rREg5?=
 =?utf-8?B?cE9acjVaRU05enVrT1cxbUFXalhwV2NzaXRBUCt0TUw1Z09Gb3pkbWZ1QlVx?=
 =?utf-8?B?Y3lGejNZeGtCdnFjK2lhZit0NDNHbSszUVRONjQvNW9BRTIyZHNSSElQSXBi?=
 =?utf-8?B?ZVVMTk5adHY5V3JhN3czRTNqU2JSZ2xVY1Noc2F1UTNJaWdwc2xMc0t1aUpT?=
 =?utf-8?B?bUNTRFozN2d2RDM3a0MzdEFwZDNoMlh0dGYwL3FLeUV3WCtoS2pxK2NSa1dL?=
 =?utf-8?B?UUtTTWxhVmhNYmpFdGhxem5rZEo3RzVORWRCb3RYeTk1TVVZQ01NRjZhSGt3?=
 =?utf-8?B?Z1Vvc2dJcWs1RWNzWU1hbzRRelFZSTlENVkxeG4yeEdzVnVVWHgxb2cwa05w?=
 =?utf-8?B?WkZrRy9VVXRQQm5lNm9QazB5cEkrbm5URk5YQ1k3V2JEdEN1TzIxOFBLaERn?=
 =?utf-8?B?aXJMZU0waWliekpGUC9BS08xNllQQWVZQUxoTmUreDVYT2pqcmtPd2k5OEJW?=
 =?utf-8?B?a0grMnJrNWQ2b1hQdS85UzNYU2JwanBKMk4zMWZGWkIzb0ozL3lCamFpTWpP?=
 =?utf-8?B?ZWVVbjd6Y2NVTHpGL2gwOER0cU5nNWJDbFV0dXlLclJRaWI5WUFaUEtNektx?=
 =?utf-8?Q?iCpuZKzll7E68mr1MGlipOSggsMVFI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE5qM29YL2lDV1NrMFVGQnVxclNDdDF1blp2Zlh3anptNlBSbW14cndSQWtt?=
 =?utf-8?B?ZnlteWM0TzN4bmp4MGg4NnZuRnBvWi8ra0gvZVVoOHpjOCtLemRxd2dhdXZx?=
 =?utf-8?B?ZzRDUWNLV3B6VWo0Wkc4T3pDVmtrMWFGcnpqNjRyNDVnaVNZR3VTaEYxbnM2?=
 =?utf-8?B?SUVjSUdSeDYvYlBMTkRFTVptVzNFMGtGV0dsajRwUFg0UitNb3NJZlB0K0No?=
 =?utf-8?B?bnN0NjQwUjlyUFdiYkZidEVRMWFlRkkxMStkeHR5YjErQ1BVY3dOV0dSbG5u?=
 =?utf-8?B?aGVWWGZWOXJ1OTk4N1ZGYWZ2bFZkU1gzUno2UXBsVzJDcml1OVhtSE1lbXAx?=
 =?utf-8?B?bTd0NUdHNTNBRUdBRUM1a1JaQU5iaWNyMlF5WG13T0MzTkxRMmE4SEFkbXMv?=
 =?utf-8?B?Njc1SUxwR05ZUlVKUU5FRVF4SGNMNzVER0t0QSs4M1g4d24vOUFRbXVtbitJ?=
 =?utf-8?B?d0FEN3lUUy9TNTZDbXhsZ05IaEVGTGVpUGpTdHZuOVFaYkRyamdDc0RTYlNn?=
 =?utf-8?B?QnNqL0lGQUVLMmNnRFhGeElYQnlKUWpKS1d2ZFRnTlRuUVd6dW5MdkpFQVo3?=
 =?utf-8?B?UlhYMzJVbVVFRUl1Qzd2WlhmYmNQSlJ2TzlPa0lnUE1nNWFMbVhMaEJGZUgx?=
 =?utf-8?B?aksxMWlaTWFBcElsek9aNGJ3eUEyRUxkYW5WK25VKzh1UmdrTkhhcTNjSHFD?=
 =?utf-8?B?emQ3YVlWR2FjOGFmS1FsTUY2cGp4bjhNcHlRczU4VVJFV1grUVU2YXNqaXlr?=
 =?utf-8?B?NzNXcGpXenRNQTdCdEY0RjZNSGk0LzVCazdhVmM4NGZIRTg3em9ERnplbVY0?=
 =?utf-8?B?STdqVk9pVnVhV0JDSmZXSjhib3UwaVNTSkNudDRWQ3lBU2J6Mk1ocUlqSWYx?=
 =?utf-8?B?akJHRkpjRHRZcUIyZEIwM25xQkczRldiV2M0K0F5YWRVZGRNeVpWWGlnc0Ja?=
 =?utf-8?B?SjBQOHhMWHJscVl2NGVHWWZjQW91dXU5MmpadlVVVmEzQVdsQ2tUdENMaGZB?=
 =?utf-8?B?UFRsekdKYmtCdUd3SExudVVrbjkwa1hsTFpmWk9hbmJDYnpxN1R3WG1YVGxn?=
 =?utf-8?B?N0lrNmR1Rk9sUXNIdkJpMmpXR2tEaFdrNm15MlhvSFJuaHVKNHk3WllGSzF2?=
 =?utf-8?B?dnBNZlpHdDV6SlhMcmJVNkFlVms0NjBMdWlkTHc5RTg2WFMxQktreWNlT0dB?=
 =?utf-8?B?dGJEOGFyWHA5aU5hVXg0d1JVd0ZjUUtic2VGa212bEM1K0gzNTdyV0dlak5p?=
 =?utf-8?B?b3I4MmJCZ2lKdG5sbFFFcDllb1lrQnNMMkEwd1pURGJBVnFaV1ovd3ZGWHdW?=
 =?utf-8?B?aFhkK085UkZhNUYwMlAwZlpoZUJDT21oMHBsTEtiZFVtbkRrQ1QwclRVUEdP?=
 =?utf-8?B?SXhXU0MvM1FvWmxuSEE1VG9vTEZQREJJUVBiKzZCUGlQZFIrOThlUUVzRVI1?=
 =?utf-8?B?cVBxeUl5QVEyeldQY3RvSGFNZEVxcjJCcGEvUmtvc21PU2VIcHl5NE5PM0Fl?=
 =?utf-8?B?bk5SMUJSamNYcDYwL0N2Q3ZNRUN3NjFZYm1uUzVmWWFDdEs1TWoyRjlVNEtN?=
 =?utf-8?B?T1Z6QWpHMi9JRlBNbDNkeG5CcTUvQmcrQWVhUkpNOGVvNkhERS9QZjNycWRW?=
 =?utf-8?B?d2VUbktTakw5KzFDeng0eXhiK1UrdHlyendXRzc0U213K3BMem9lN2hqZWVx?=
 =?utf-8?B?M2Q1WUVPUlI0V21IeTlnY3NrVTgzSWV4MW9QMVl3R21OdlpXWGRLVjV6TXJa?=
 =?utf-8?B?clZJR3diSXkvMlJOL052eUI3K0Y4bWJLcTFSMjMvUE9lNzZ2SnQwWU8zSW9a?=
 =?utf-8?B?bDU0WXl6NmVYK1RKbzNtTkdyNHJVaVhJMWRWMnVBVTJuaEx1Vm1JclFweXVQ?=
 =?utf-8?B?Z1YvYkIwVU1SS0lLTGU4U0lrbTQ1TmtXSHA5cng1MjZFazZJQXYxdU1OZ1hO?=
 =?utf-8?B?eWJTdEI3YWJadHhwci83SnlDUFVCZ0NXTmUzR01QZndEQWhDbzdBak9KWUJk?=
 =?utf-8?B?Wk05LzcvaERhK01EUlF5d1hHVXJvQjQ2ZkI2ZUdMaER4Vm1RL1c1NDgxR2ZO?=
 =?utf-8?B?TXRyeTdTQjFsVjFyUXBjWHdHVE0vT0E1U0dPUW5acmVpUkJsbjloMnlCMXBL?=
 =?utf-8?B?bjFtazlXRFcxdGNVaHcyMlZ3MW43RS9xbm01YjJaZDdwY1gzRDNTUHczc1NP?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fa9de0-e565-4223-daa9-08de08fe35e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:45.4469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dhc034fvpfs91hUfj5T4lPjlCofpSvK0LPFnyqx9jisxyiWOzgCSfP0Lj3nIqaGbIX5SqwupfJeN3x+hKNr1lOpUmhG2TME5325rhTYXf/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

Connect the helpers to allow save and restore of MMIO migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 +++
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 104 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   4 +
 4 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index a74f6feca4830..7f8f816c10f20 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -189,6 +189,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(SAVE_WIP);
 	CASE2STR(SAVE_DATA_GUC);
 	CASE2STR(SAVE_DATA_GGTT);
+	CASE2STR(SAVE_DATA_MMIO);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
 	CASE2STR(RESTORE_WIP);
@@ -804,6 +805,7 @@ void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
+	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO);
 	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
 	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
@@ -852,6 +854,13 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 		return true;
 	}
 
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO)) {
+		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
+		if (ret)
+			goto err;
+		return true;
+	}
+
 	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
 	pf_exit_vf_save_wip(gt, vfid);
 	pf_enter_vf_saved(gt, vfid);
@@ -873,6 +882,8 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
 		if (xe_gt_sriov_pf_migration_ggtt_size(gt, vfid) > 0)
 			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
+		if (xe_gt_sriov_pf_migration_mmio_size(gt, vfid) > 0)
+			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -983,6 +994,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
 	switch (data->type) {
 	case XE_SRIOV_MIG_DATA_GGTT:
 		return xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
+	case XE_SRIOV_MIG_DATA_MMIO:
+		return xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
 	case XE_SRIOV_MIG_DATA_GUC:
 		return xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 	default:
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c94ff0258306a..f8647722bfb3c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -73,6 +73,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_SAVE_WIP,
 	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
 	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
+	XE_GT_SRIOV_STATE_SAVE_DATA_MMIO,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 92ecf47e71bc7..43e6e1abb92f9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,7 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -379,6 +380,102 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_guc_state(gt, vfid, data);
 }
 
+/**
+ * xe_gt_sriov_pf_migration_mmio_size() - Get the size of VF MMIO migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid)
+{
+	return xe_gt_sriov_pf_mmio_vf_size(gt, vfid);
+}
+
+static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration_data *data;
+	size_t size;
+	int ret;
+
+	size = xe_gt_sriov_pf_migration_mmio_size(gt, vfid);
+	if (size == 0)
+		return 0;
+
+	data = xe_sriov_pf_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_pf_migration_data_init(data, gt->tile->id, gt->info.id,
+					      XE_SRIOV_MIG_DATA_MMIO, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = xe_gt_sriov_pf_mmio_vf_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_pf_migration_data_free(data);
+	xe_gt_sriov_err(gt, "Unable to save VF%u MMIO data (%d)\n", vfid, ret);
+	return ret;
+}
+
+static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_pf_migration_data *data)
+{
+	pf_dump_mig_data(gt, vfid, data);
+
+	return xe_gt_sriov_pf_mmio_vf_restore(gt, vfid, data->vaddr, data->size);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_save() - Save VF MMIO migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_mmio_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_restore() - Restore VF MMIO migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
  * @gt: the &struct xe_gt
@@ -409,6 +506,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = xe_gt_sriov_pf_migration_mmio_size(gt, vfid);
+	if (size < 0)
+		return size;
+	else if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 5bb8cba2ea0cb..66967da761254 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -20,6 +20,10 @@ ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_pf_migration_data *data);
+ssize_t xe_gt_sriov_pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.50.1

