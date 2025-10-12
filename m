Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936EBD09D9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB6410E18D;
	Sun, 12 Oct 2025 18:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moGIhK8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D1D10E189;
 Sun, 12 Oct 2025 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760293977; x=1791829977;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YDCotTZac93HrmOt1jy/vIfy/I2FiSPIpgXPk++L9Ow=;
 b=moGIhK8KFEB0Xyc1ZsGLYA6NQnb05JUM0E3+ZL9JZCYsK52wQDbDdTmA
 lxB/5HrSuKDbhvis7SJn4jQepQGY8lTmxLJf2DCIzrt1w0NFNsn1EmDzw
 KDQvBCR0fxykjOOtGVyXjLzc5YMtj2x6Bwth8YcKqdTHZiVXoQfgWrzxA
 ZQ42lIwjDOJmJ4Vyxz6PUQHLkn30FvlYinOjY5nXM7H2b+75pV/fCzjqN
 8y8Jtlzp0Wacm+76I7iO0A7PgWwuW7pSkcJa5sD2ONKAeX6lOYbU4LnhV
 EVyQZU7GKHrrCh4WC5N0OycJ1Dj9g75MrYpAFOY/16IrzxA0ZgnyvF89n Q==;
X-CSE-ConnectionGUID: PUeMlxE/QC60eVBg4jCBrA==
X-CSE-MsgGUID: 9Pf/dT30Q0aGFBvPEDFUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="85067792"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="85067792"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:32:56 -0700
X-CSE-ConnectionGUID: WJHzdMPxRkChziuQdY62QA==
X-CSE-MsgGUID: VPFVwfTeRSWysACN3VBV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181099194"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:32:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:32:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 11:32:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbyaKJ7AuOPJjyGe4wQbkEawVTP+fEB7a+nRJSYBwh7ZrG6weJ/mdhtTJrSsczUOdZzadjyUC7B3ZxeLgigtqTpxy1E5lkms7xD+p6b8iayhFoedqdE7QTzX+kPN7XFneI23JAVqWwKIbuZ0yTOgrWgs+NV6rsMhy3tCGqhii0u/4q69TGOBO33zWXBSBsDuz970nu379XTSHG0hjb0uCaplbITcIH1ZdQG70RwRjRuGVNKIaf12sfFwNnEUVBF+ugXRr+Nt5h9XvGjVASi3Lw+M9ziNnXg5ekomxEgzkK/wHSufMymXG7zf7hLyjU28HhHmr9AjeAdAmLoZdKmC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rvnk+E+d90xcUc8aEXAZd/6GQJRhS1lQy6/t01+Nf+s=;
 b=B/swexg9VLlVt6n7jpJy/0CrUAZ81azuTK9xLJ0wiHHOxTltsapFA9LgGKgpjjjZoPLeGaXPsG7oxegOzi8knEbdtx2FFNpliZykbeNDdBTn2lAG1EDkicXpupVNrlxE8WMTEvi8sFkt6L4UFohGmzz0BqWB7SHEnG3ZjImrlpaDT9OuaO97TzC4N+me+v0AyFYYruEPe7sOIsS6IRO930MyUBuRwvWyB+13iO67CmRBt1O0FpAyjHe0TY/2RKZrESPOJ3tJfPjpngxB+sHOZdKFOrRYTqsH0+ovG3TtoPvyMAvHkx/c9lnHUcSkj2UIxsjXhFUe2CtWZ9+5hzPTnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7186.namprd11.prod.outlook.com (2603:10b6:208:442::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 18:32:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 18:32:50 +0000
Date: Sun, 12 Oct 2025 11:32:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 25/26] drm/xe/pf: Export helpers for VFIO
Message-ID: <aOv0T8o9Oi/YPqIY@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-26-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-26-michal.winiarski@intel.com>
X-ClientProxiedBy: MW4PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:303:8d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: b02fa655-1062-4c68-0f66-08de09bdbfcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZYaTBmK0haMkluOUUzV0hwU2gzOCtwMHdEOHdBaVRKbjl0MDl4Mis1bmxN?=
 =?utf-8?B?ck1MMGY4YmlNTnZMYmJhSzl4ZjdsZ2RPV0JtS3VwT09zUDVUb1ZCLzR0QWpX?=
 =?utf-8?B?S2hpUXFJZXdHS2QvVzZIR2VHaFg4akU0RTFJZUpUdGk1dGxtOFptY2FFTXkw?=
 =?utf-8?B?amt3K3ZhbWI0NlU4SVVOWmVKVXFoellnQldaOG5KWEVObDFnRnNwekViTUgx?=
 =?utf-8?B?Tlo3MEh3TmNPUDAzZlF6cDc0MzI4N1UxTjYvNVpEbTBnT0djUGJIUFcwZnZ3?=
 =?utf-8?B?NFRhdWtFTXBCUGVkdXdaNXB1WVZDZ3hjR0h4b1dlZVpBZXBiVzhzOHpRb2xX?=
 =?utf-8?B?TnF3Ry9GbFdNQkNFL2VjQXkxaFV0Tjkxay9ubmxzaytaT0hHT0VaQkU1TVJN?=
 =?utf-8?B?Nk9VVHZ3UkhsbjdMQU5zdWt0YVBPR0xPcE4zZmdTcGpUZ3JYNlo3SEkwY29m?=
 =?utf-8?B?eWh1K1JZaTZ0b2NoVE9sYWxVZzJSMXNzME5CNUhhYTcvbFZ6R0ozaEloZi9k?=
 =?utf-8?B?UXN5Z2hqbVBDbHpyUTVtWWlYV1VaZTRETW1PT2FMWFBFUWxJR3c0US9QTWJW?=
 =?utf-8?B?cFNjQlV4eTVTSWJ6MXNJZGo5aHA3VnZmQ1dDZnZJdGtwSXQ1eThuOWdWL2RQ?=
 =?utf-8?B?VlVJSmpRN3l6RjRhWUhEeXZQQTdDbjhyY3kyNE03THMxMzUvRlNJeEdvWFEw?=
 =?utf-8?B?WlpuM3RKcTR2ajNVbFlzZEJFL3paY1ZEaVNCd1VPQkxLOFQrS2N1NXpSQlFH?=
 =?utf-8?B?RjFHWFdMUXZac0lxUnZGQUxsTngzV0h2SUpaS254b1hPZnYydDdkVEkxS0gw?=
 =?utf-8?B?TFlUNHhseE5WaUNLeHFCUHJIWHBkZ1MrZFZxYlZaMG1QS3cvSFhhaGlmTzE0?=
 =?utf-8?B?a3RmZmlheVAxYXlDcTI3MWFNUTBxQUVQRkhucjluMm5RUnU0akhwZmx0bHIr?=
 =?utf-8?B?cGk0bWM5YkZyVzhicHh3TmxtSnJxT1pTSWVtWW51M1MzWmhYb3VRSEtsbFo1?=
 =?utf-8?B?RGlOayszOFJxd3B6SVZaSGdzcStVUk40OXR2UGpkay9sRHEyTkFmckI1YWxL?=
 =?utf-8?B?TC9kSjJqQm41MEFHczlGYU1HRDBLWVpud1NTRVkxbnBkZjZxeDdNMWkvVC96?=
 =?utf-8?B?Qm01Z0paaE12eCtJaTlmK0xXbWN6c0hLOGRsNzZMMVJDNUEyWCs2cUZKM3Y0?=
 =?utf-8?B?dnZVcmxvdlY0OCthWCtxVGh1dmFFeFI0R1FhWHZmQ0NGamo2V2ZTUnEvYU04?=
 =?utf-8?B?emUzQ21qQk80bHVSVXNscHJwOVRkcWR3ZE9FY1N4T05SWEVlOC92ajZFTzBD?=
 =?utf-8?B?RGRNNTRBbkI1bVNYRW5aME14a3JkQkZvNDU2VzNocWR6UkIwNlU3NmVRMmg4?=
 =?utf-8?B?ak53dkhyTFdhQVVXd0dxbnVYd3UzNjZNR0o2WUJ3cU1zRXBCUWZpcTAyMmpV?=
 =?utf-8?B?Rk1BbHFiMEQzNGJ6bmtmc1cxTFRLNDM4ZUlXVmZ3WEI0UnJwOXNlaWdsaGNr?=
 =?utf-8?B?VzhVT0JaaVpCN0FhUjI1WXlUY0NncHBwMkRwZzRzT20wd3BlS3oxOVB0TURB?=
 =?utf-8?B?b2FpTERtOGJLNEw2eUY0b0lFZER6bE1HcXdFOGtxOUp4a293L3pkTEhKTmMv?=
 =?utf-8?B?RVp1VEliNXJkUXlNOHlyeU5RcStqWm5TUEd6OVIvRVgyV2gwWEFFRFUvWjlq?=
 =?utf-8?B?b0VmQVFOSVIzbi9CaW0xS3ZwVERJYzJ4TmV0NUswNUJuTE0zSmRGME9qTlF6?=
 =?utf-8?B?OThXbm9ieHpaQUNpY1YrOTN2dTNpUDlUYnRkVWRZMGY1dWovUkdGbk9ha3Yy?=
 =?utf-8?B?dE9WaEJqL1JMSjJrbWU1Y3JTZTlzVnJIeHIzc29ia0h0NzUvam5raUdJd1Zq?=
 =?utf-8?B?OHl4TEtDUUVLOVpBZDRhdkUyNHpmNUZDUkkvOHhDam9zWWRIR1Q1RGhXaEVJ?=
 =?utf-8?Q?/w8I8hGcwcpCM1XHUtfzV8pQAJD9uTHd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3E4RUtrM3JzNFNUMDBESG5jZDdCV2krV0ZFT0lOd3BXM01Jc2R5cHlhYy9G?=
 =?utf-8?B?d2haRnRPUGRYaGFxdkJQZ2lPQ3NOSS9sR2JIYXpqWnczdU1XblhtTmRXcllF?=
 =?utf-8?B?azI4bnhqaGwrUXp4bnozWEc1a2FjRFpaQWhiQzl6RmY5T2RRQjY3MW1JcWVz?=
 =?utf-8?B?VDhvZy9GamlIZGVQaEt3Rk9RajlLN2ZTSHpPS1F4ZEZWM2tXQWVtREZwcW5U?=
 =?utf-8?B?Wkt5c2ttdmoxN2poTkNzdWI0MmZpNFUyN1JzWm1XL3dRbnFtdkhkay9KMG5C?=
 =?utf-8?B?NlBBRGh6MVlCZkNEdFQ0VW5Qdjh5Z3VCcGFZb3ZjaWlnaTVkZ2tpdHI1OVFB?=
 =?utf-8?B?Wll6aEpOVDhpYU1keXdxc2JZVU0vVU1Ma2ozQXhKM1hIVzVOanpLRG5XSkJo?=
 =?utf-8?B?b0c3dTYzR1EvYXpvMmJwUURlZGlaSGlTVi92cHp3NnBNcUFDNVlaQWpQOXlx?=
 =?utf-8?B?K0srRmhnVzRvZXF1U3pyeXVIYXB0d2VtVzdvRGZtdWJYOWVtOEZUWTVxRnUz?=
 =?utf-8?B?R3k2Q2tDT3VBRnlXT0t0dkcySHU1OGJkbjZiOTNsSmRsaXVHNWtSRUR6UGRC?=
 =?utf-8?B?Q3NoM2pONkFUTnRjcUplMTVUOWc5dXJYQ2tQMm53NmpBRlFyMjZTdHdiZzJG?=
 =?utf-8?B?cEJMa3l3V0I5Qm1ybkRWUjBJREtrWVdVQzZpdUIrY3dpU1lzVWxoNmljWGhF?=
 =?utf-8?B?V1BleE9MK2pFYVliMkFSZDZoZzVnQUhhbDFacWdRZWFnaCtJTkpNRW9ObkFp?=
 =?utf-8?B?L1VnNGQraUVDQysxemlRQUgrL1ZZMy9IUVY5NHQyVXZBckhlb2dmTWlEektV?=
 =?utf-8?B?WkNnSjRpcGdTT3MvQTRsUHBEbEtxNGV1RE9NeVAyVjBUWDhFeFRaWmtyaG9H?=
 =?utf-8?B?elNFN0tJVUtHOGNHOWE0Vnpqank0Q2VYT1BEaUd5Si93bW9Bc2pjcks5cndN?=
 =?utf-8?B?MHZDdnBMa3ZjbUxuMHQyVnVjUnpLWHdoNnJ4d3MyT3FHY3EvbTdsVmQrTkRE?=
 =?utf-8?B?eUpIYyt4Q0JtQ3U5b2lWbXFpSEpVZTBOaHRaYjdwMy9JbHV3ek4xbzdKdEd1?=
 =?utf-8?B?K1BoeTRvUlhIV2NDTW9NMW9GSHEyamVlU1JJTVJwNThQZ2RFb0pwTzVpdmZu?=
 =?utf-8?B?dXZmMFJpbE1JYzJKRG5FMG1iSkwvNmNURS9EUVRqN0duOTV0bGptQmp0VEZX?=
 =?utf-8?B?THlzVmJGSjhQd1Y5YUI3cWNUdnVrTTYwL2hyMkM2ck9CcTczWDVqakkxZlBX?=
 =?utf-8?B?UCtKMDBsblNRMkdmK1hyRXhHODBZNWVzWExDWGEwSlV1ZVVVd21oempYYUpN?=
 =?utf-8?B?UWZNZ3I5Snk1dVlQeHYvamdTM0hDNE02WDgyWW5RWWxQaXVrbEVYUVNhVEJJ?=
 =?utf-8?B?WlhuSWVtSjNQYjIvVzdZZWFsVHl1bkYyVGljT1BEOTNPVDRGVldBTnJPL1FV?=
 =?utf-8?B?VFY0M0xqdEJBKzNIcThoM2NQMVhxNzFybVJJM1NNVjhueEJRY0F1cWt0RWh6?=
 =?utf-8?B?NmJEaTZzd3lJdmJ0NFgrY1pQbmdiMmNvdm9heXhDeTFmVkVjWEhPQmdaWFQy?=
 =?utf-8?B?dUhsMkRqeXJaTHZrUFVkb3NkZzdqODVBY0FzaEhxTFpzekRGUHlkUmI2TUgz?=
 =?utf-8?B?WkRrVzY4VjE1MURSK09tb0htOHhvRU16YlBhbC9FWHdnbzNuQkxvWUtxeHdx?=
 =?utf-8?B?Nzk3b2FFRzhzM3BQak8vRHZuR0l4VmtkeWJmRVNHUzVkU3c5b21BQ2s3eVVN?=
 =?utf-8?B?cmM2R2djZXZ3TllDWGFXcGxUUnI3UDFOM0RGaWFmdUY4cEpud1VDQlpqYkpQ?=
 =?utf-8?B?UTdlalFTYytIZkd1RWUvQnp4UHFlaW5rSGdIYjB4bUQ3b2F0UGxKeGZtdXJ5?=
 =?utf-8?B?bEgyeFlubnRHV3hNNWVVUG0rSVhndnJYZ3BIUE9nNUR4Rm5EclNPQm4wdjNX?=
 =?utf-8?B?aEtCS1RLZkNPYW9BbTJDZlFVd0ZZQ1o2dk5sREVXZnFTRHJwUzkwYXBYZ2dn?=
 =?utf-8?B?YzJqcXduczU3MXNPdEJvR3lrZ0x1UzgwWDlQUkU1YlNWd2FGYzRxYlFZZDk1?=
 =?utf-8?B?NlVJWFVmUlVXcDY2RnMyKzlDSDg3L2Jhak9iZjhDRGx5aGdsdjRiVTdUbU9B?=
 =?utf-8?B?Y1NsV3U0a0NlNzl1UmVIbDJlRWJ0ejdRYWdUZXhhdVFlajd0OU1SYlc3WHlB?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b02fa655-1062-4c68-0f66-08de09bdbfcf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 18:32:50.6841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eurk82ILFxn6sqECL3HXvHQIQY0+81Ni2SROXJHKwoTEMjEyKw35VBKtdgPAzOhJT+Oaowb4BSFbjpmKq0IH+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7186
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

On Sat, Oct 11, 2025 at 09:38:46PM +0200, Michał Winiarski wrote:
> Vendor-specific VFIO driver for Xe will implement VF migration.
> Export everything that's needed for migration ops.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vfio.c | 252 +++++++++++++++++++++++++++++
>  include/drm/intel/xe_sriov_vfio.h  |  28 ++++
>  3 files changed, 282 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
>  create mode 100644 include/drm/intel/xe_sriov_vfio.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e253d65366de4..a5c5afff42aa6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -181,6 +181,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_service.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> +xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> new file mode 100644
> index 0000000000000..a510d1bde93f0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/intel/xe_sriov_vfio.h>
> +
> +#include "xe_pm.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
> +
> +/**
> + * xe_sriov_vfio_migration_supported() - Check if migration is supported.
> + * @pdev: PF PCI device
> + *
> + * Return: true if migration is supported, false otherwise.
> + */
> +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	return xe_sriov_pf_migration_supported(xe);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_wait_flr_done - Wait for VF FLR completion.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will wait until VF FLR is processed by PF on all tiles (or
> + * until timeout occurs).
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	return xe_sriov_pf_control_wait_flr(xe, vfid);

Ideally I think you'd want the exported suffix to match on all these
functions.

i.e.,

xe_sriov_vfio_SUFFIX
xe_sriov_pf_control_SUFFIX

Maybe this doesn't sense in all cases, so take as a suggestion, not a
blocker.

> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop - Stop VF.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will pause VF on all tiles/GTs.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);

The PF must hold PM ref behalf of the VF' (right?) as VF's don't have
access to the runtime PM.

So either you can assert a PM ref is held here and drop the put / get or
use xe_pm_runtime_get_noresume here.

Exporting the waking runtime PM IMO is risky as waking runtime PM takes
as bunch of locks which could create a problem at the caller if it is
holding locks, best to avoid this if possible.

> +	ret = xe_sriov_pf_control_pause_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_run - Run VF.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will resume VF on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_resume_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_run, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_enter - Copy VF migration data from device (while stopped).
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will save VF migration data on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_save_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_exit - Wait until VF migration data save is done.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will wait until VF migration data is saved on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_wait_save_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_enter - Copy VF migration data to device (while stopped).
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will restore VF migration data on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_restore_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_enter, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_exit - Wait until VF migration data is copied to the device.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will wait until VF migration data is restored on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_wait_restore_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_error - Move VF to error state.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will stop VF on all tiles.
> + * Reset is needed to move it out of error state.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_stop_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
> +

Kernel doc for the below functions.

Matt

> +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> +				char __user *buf, size_t len)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	return xe_sriov_pf_migration_data_read(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
> +
> +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> +				 const char __user *buf, size_t len)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	return xe_sriov_pf_migration_data_write(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
> +
> +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	return xe_sriov_pf_migration_size(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
> diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
> new file mode 100644
> index 0000000000000..24e272f84c0e6
> --- /dev/null
> +++ b/include/drm/intel/xe_sriov_vfio.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VFIO_H_
> +#define _XE_SRIOV_VFIO_H_
> +
> +#include <linux/types.h>
> +
> +struct pci_dev;
> +
> +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
> +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid);
> +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> +				char __user *buf, size_t len);
> +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> +				 const char __user *buf, size_t len);
> +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid);
> +
> +#endif /* _XE_SRIOV_VFIO_H_ */
> -- 
> 2.50.1
> 
