Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6DBCFBE1
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4207410E358;
	Sat, 11 Oct 2025 19:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbYUsbCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9F10E359;
 Sat, 11 Oct 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211731; x=1791747731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7neSRKvtXVDkWQXKejObZNv79DkC7kFFMiQIt1REoM0=;
 b=KbYUsbCZERxJCx6TTRI/a/hT5MAfMpUtHkgirwUwIvlPXGB6Tth08f9j
 Tuw7axNSkpuGLeZ13tFm8sLZdde5ZLpqY62INfBTCQb0NmpIQR/K55lu8
 aaWQybz5AR40e/XGbgpwNr8zAQW/0fAnD4767d6f18baAYW8FUKuZLk+b
 V6OUmLHuaPwCmXOWI7p+0jcUt03FiafWKkiAMXyuQlhFT0R188qXZV016
 8MbgUuHN9ELeH/Yr53aPUlX70py0xu2GB/Q1JrwbIy6qrOaOEoeqGIqWL
 L+egWQA+yg8uICA5zHufMmrddT6g1BkrB0VXw3UyBk8zkyivjmhWTExr/ w==;
X-CSE-ConnectionGUID: l3MKnZGcQ4S3CvxY3rYblw==
X-CSE-MsgGUID: EqICQMC8RPOztITZXYRIvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66227500"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66227500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:10 -0700
X-CSE-ConnectionGUID: 82n1Z+04TGCGgVIkdMt9CQ==
X-CSE-MsgGUID: uaywD+2FQ1y0hPY2yW56Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="186525193"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:42:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtFQTe9CtTQHVfax6Nyy6rOn1FfoYOJnxYsTdnHsiM/CbdQsIL/V12DD4aC/dUVj1g/BV8Ovb/qFcyIcJLqx+gp91XXzzsRf/Af5txgRzYv1dh3BjGLcHlhx6yiovN5LzJPQ16zh4PfCBfwmOxys5WHG8msDjL9lxiAIuO3SLgH2B/mJWvuuxRDft1BCTvpN4IXJwG76YO+zQusF9O2EyxzUpoyt+87Kw9IuuDKhydWa62pHTo6rzixMPXW7oQ+jifqVB1aN8pz22EWXoxANj662DNRNvkvAdqwwW3nzJ+R8zFwLPXgWyGcThNdWtnUa3bEC3DdxprRfzmZ8h+N9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6qUwSdcvoA/V1eC1kbWxA+8WKO4AKTHq7/7dPjdU1k=;
 b=WzdM7+qLILb+JGZTQon8J39XJHVbJkc+PML4rjFRN0XzxrKzf8xirfYrE+PVyKLLmf0nTI1/XNjnys3WhshFBvhLpEszQ40x2tYfTaFmY2U15QllBk4Ros0B/QwrBNVqwNRkBjf40gssQLtEnuOtfbCV5Ojdc5f49RH4D5pT72Ee3EWQX46n8+UIg12i7SfcQOGSNbHCXnNUrqebD2Gf7KsWc/UueEQhT2PhDup5TkDXLyfHLl8vZrJtuxrnvjTZoNYz3cigzkbI/f/mHnkY4u+mQYoS2vl2Y3ci7U+DDU0vZoUQVIIP0nngMMYgxNc7T0ayyGdqwPDUWJNiA8wxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:42:02 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:42:01 +0000
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
Subject: [PATCH 24/26] drm/xe/pf: Add wait helper for VF FLR
Date: Sat, 11 Oct 2025 21:38:45 +0200
Message-ID: <20251011193847.1836454-25-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbf81c8-75df-42d4-039a-08de08fe3fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVg1Q3dGbHVURUZ6TzN0dVJ3Y0k1QTd3THV6eDhvaVRBMWcrQ29rdHRKd2FZ?=
 =?utf-8?B?YjcrZkRCM3c3WmpDUnAyUjFvVzd0QWd3TFZ0MldRTkM0SSsvN05lRGM0Wm1I?=
 =?utf-8?B?dXF1SXhKbFFQNlF6SUJaY0tveUFkN3EzS1hucVV2KytqM0RMUEYyb3hCbGlW?=
 =?utf-8?B?Qmt5Z25GUDJJWWx2MzZHVjJyZHFtTVB1eUtqWllQSmo4ZmJlZU9jWmM4ekJ0?=
 =?utf-8?B?SzlrRkFSNFRLZExzMVNwYXNNSDdaT0MrYS9BdWU0aTZ3RDh6VW8rQVg1Y3l1?=
 =?utf-8?B?cG1FRzljUzRUVFhMUkJOVlFEVHh2Sm5IVXdveVF6QUU2b1FaOUJyUXpuRTls?=
 =?utf-8?B?bys1dU5URUIwRlhXZWl4bFV5VUowRTlYNUY3bmM4c3BtYWRoWGF1QWlKeWl2?=
 =?utf-8?B?UFlYS2d5S0I0MU81cG9weVRjc0I2ZURqYkQwUDlqeG9mVVluNUtsRkVBbWti?=
 =?utf-8?B?eUlZcnF2QnJoZVFhTXZDOUpJSGZkTTA0d1lwT045R250YUc4dUc4L3h3a0FB?=
 =?utf-8?B?Z1dKeFduTkFUYVZmMXBTRVBHV1lrUkJkeDhGSlJESk1pekpDSTZIZGhFZFZm?=
 =?utf-8?B?S1ZmenIrWE1UMFdwSVFTKzNhWHhKOEVwUmFlcXZ2OGNXS2hrWmxwNTQ2TXBO?=
 =?utf-8?B?SmpXTDl1T0ZrbmM4cVgrRVljdmkzdEw2clVhSlJkUGVOQ0lQTDcxUk5pL0Ns?=
 =?utf-8?B?TUk0KzJEcHZmdXVsTkhrRW5URUZTd3NoY09GNEFqcWZDc3g5a085d3JXOXpk?=
 =?utf-8?B?ZTd1Zlg3emZhaWNMVGZhdCtmUUdiaUxPTHpYc3B3ZW5HUlFyOWVkc3VXUkI3?=
 =?utf-8?B?WHREbFpWWHBTTFZySVNzc0IwYTV3c3g0ZGpjMVdCdlNobWJad3NDZWYyclVM?=
 =?utf-8?B?UUU2eWswMmF5TlF3QTJ2dG96UGZ5N3gxOUNhV3kzZXhFeTVEYUw5NERqWXFs?=
 =?utf-8?B?V0liUTdoYWN1emQ3bDR0cUEzNUdHdVhodWlWL2pJTVo3bktqYUJmUElCWmNB?=
 =?utf-8?B?bGtCV1p4dWY0ZWZWWTZjUzc3RXpCT2pHdFNDZXhGbExwOHJuTjdJQVhVUVF1?=
 =?utf-8?B?TjYwSnpidHVuUW9ia0FqcWNrT0p4d2RwSzkyYUZqYThJRWVnOW8xcmNMOWw0?=
 =?utf-8?B?VHpOTXNvWXc4eTVSUHRiVXZzQTVNcGRvd3drekIxRERmaHd1eGhhSmN2YUVq?=
 =?utf-8?B?OStwYkFVY3I1MWs2V3Q0Vm9KQWM3MjBPejh1K2xjWWJvVjJDcWRQU3JyTUE5?=
 =?utf-8?B?cWxxK0hPTWRoZnlGTFRDZ0V4aFBEOVlDdEp6TlJLVHg0UGxSUnB1WmM2T0ZY?=
 =?utf-8?B?UGRISWZaa3NkdlZFa3gweDIrYUFVUnE2Z2t1eEtTWjdSbitFUVJVYzdTVjJi?=
 =?utf-8?B?MGpuVkZ6MGZJeDNhLzhIQTdOclZhS2xZNE1UdStlNUxOUmlRN3A4cnVxSEV6?=
 =?utf-8?B?TVUxQlF4Rm1iN3ZCYUpYKzhQeGNMZ2ZUNVZ6UHc0eit6clRiY090L1RQdFNs?=
 =?utf-8?B?WjMyOWtSTU9JdCtiMm9WOTdXdnlWVSs1V1BIRWpCaDVNT1hSYWFuSkYzZW5h?=
 =?utf-8?B?Y2xjcmJYTi9INmpzMHNXUDFqVUFCTjkrMk5GNUY3OGZnNmRXSG1XajlkWmI4?=
 =?utf-8?B?QUVWdUI4Vy8vUytxZitqK0IrbXhNQ0dxeG5pU3RFYm9CSjRocXROMHk4MlVj?=
 =?utf-8?B?c1NoSVpod05Ickt2RE1MVWN1Wlh0cWpFSXlCNmp5YWVleUxrdVpmY1FBMis1?=
 =?utf-8?B?NUlqdUd5d0RZWjFVdUZMS0FIRnRCZm15V0QydEhkNTBBRHJLQXY5V1B3d0xm?=
 =?utf-8?B?bHIrMW9QVzcrYUZjZExCdHpqVGxDMUpnV25OQTB0Yi9XY3VkSGx6K0hWM24z?=
 =?utf-8?B?djV0NFcxTVBCNWFhMHdSUi9FUVVYWEJ2TkEyRzJPdENBeUdMTitqYnlIV2RT?=
 =?utf-8?B?cmdTcDFxeVJqT1IzdlBkdThjdTd6bi9XekxlRzRNMFBVU3NTR3FoN1U0dG9P?=
 =?utf-8?Q?Nz17aBapoR8OI+H1i/FqO6qFXQGJds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M21jd29EempoNENaWmR5V3l4VkJZbXBoTmJWRFlHRUUrQTVlT1prUUtLN3Zk?=
 =?utf-8?B?RUl0WnVJSWxsVk5pZ0VCSmFxWTB5NmpIYU5mYVZvMmlzVjVWTGtVRnYyaDNn?=
 =?utf-8?B?SHhNMTdMd3dzWUJhM0JRUkx6aEZubWlZMmlMQmZ5SFBPN3FCWHZoQ1drTm1w?=
 =?utf-8?B?TlVjcis4bHpadGUrdGUxRWNkNWw1cTlwWnFaYU5EU21zbjdja1dRdDVNRGg4?=
 =?utf-8?B?b2FHZjI4eXdxb2hmeCtBWVQzWEo5NlN3Q0pWM2s1UDZUV2R1enZnSlc2RVIx?=
 =?utf-8?B?NFZGVmQwcHRNVnpZL0tRVkFlaVh1NGhhbVJCUGdiNDNGbGIvSmVjMndHZ0dJ?=
 =?utf-8?B?dEoyemwyTVY0RlIzQmUxNitETFZKTHlXM2x2SDhvUVljSWRIWkUwUkxXTVA2?=
 =?utf-8?B?S3R0UTdqQkRqM2JsMHkycjV5UHd1MEV5MVRsZi9lbE1xa0hpQ3FpbzRvejdT?=
 =?utf-8?B?V3NkVFhuTkp1M0NFdHhpM2IyNjFrYVhlOGxxNlVZaGVna3oyUTVqeGFZVEFk?=
 =?utf-8?B?MHNKUENtcnRYcUpHZmV5YXJEY2NrYkdNL0tZRlhhMzh0dlduZDlZdGlNeXVP?=
 =?utf-8?B?Q0JKOUlVNzhTTU04RVE4dS80SXNvUkdHZHJjbERBU3RPUEZWME5CRTF6TlRM?=
 =?utf-8?B?MitvVGVMMjJtUmQ4aGt5YlBuY2c2UWRkc1NmM3FvRmZNT25xRzhzRGFDWDVq?=
 =?utf-8?B?VFk0OUl3UFZOK29iTXRuMkZiMFlNdUM5cFVVT3hQcktZOHNFVVN1bWFncmk4?=
 =?utf-8?B?djEvZEZxRUk0UXJ5ckJrejJ5eVltQUZMUUlwUUgyVkE5eUxhWWJSRWdCck96?=
 =?utf-8?B?bFpVT21RNXdyRUJvbDgxS1d6eUhRbHhXWFdPajg3ckFEVDBRVmdrUDEvOGdD?=
 =?utf-8?B?MTJRa1E5QTd1VUVNSkthSmtnTnNoNHkxRitSeVNPWWZjb0Nac2hrSXg5TlN2?=
 =?utf-8?B?UndkRFRhV0UwRlJtR0ZUNldiU2k3R3packdwNVpHSVZPWWpPeHpsZytpL09T?=
 =?utf-8?B?OGpnWE03SmVMdHBwUnBhNmtQc3Nnb1RyMnI5RVNVaXBZaG1DZFNxNGlSaDFX?=
 =?utf-8?B?T2xVTml6UE9WdlpWcC95Y2pDVkdUZFlQNmMxQUViZTErczVpcHY4ZjI4QmtF?=
 =?utf-8?B?WEJwVEpjZ2crY3NpQmRCNE83b1lvVGFPQXZ6ZStpbzFSUXVGQ2JqbjEreTU2?=
 =?utf-8?B?dU8vdE9nYnp0T2pCMC9JMUxRWjl0M0R2bzhYSncySVg5VFg5SlNWTmovK2RC?=
 =?utf-8?B?VUljRFMzRXppZFFJNnl1WFg2ajRPM0loTkdlZTNzZGczSWRweUFUMmY4c2Qr?=
 =?utf-8?B?RCtNNWlDcHJlb0dJNGRJL1B1K2VQa3o1aDhUeWx4K3hZUEdCb0xja3Q5eStJ?=
 =?utf-8?B?TDlIS1FDakRBWkUxR3Q0VmxFck1qTE5ZY3I5dHYwZkdpL0t3SXpLT09mNmFp?=
 =?utf-8?B?NEFRTjJxVDFWUHVOVksyM2FtekVFazBkblQrLytXclo5T0hHMU9vcjZoTmJT?=
 =?utf-8?B?T0k1R3ZuMWxEeVlicWMxUUxZT3hWWm5YUFNOQWJVNlZZOVd1Zmd4aHJkZ3Vq?=
 =?utf-8?B?RmFWVUozcEQvUHg1UG9ucWhjK1hxZWpqTnZaMjBHVlk5N0gza3czc3BJaTVw?=
 =?utf-8?B?RGxXWUoxVEJ3dWdLMHkvS1B3UHBBeFZGT0l4ZS9yL1l6eVZmOGUxRFhJSlBR?=
 =?utf-8?B?MkRJUlE2b2tXQVI0UGVnbXRFYXBMdHdTNDdKbWEvSWo1eDdVdU82aTl3UHVN?=
 =?utf-8?B?N3FnV0Yzam5tMnYvUW5kcXlGK2pPNVFuNUpXSXV6SHh3Zy80aDg4eU1UU3hT?=
 =?utf-8?B?RGJMVkVHZUpwZlhleXRQYmdrc1Z4SmZmcGtrU1dKaXgxWmxQaVZqNXM4M3dm?=
 =?utf-8?B?WXphZzloU1FWUWszWHhISGhTWHJWTk9HMUY1U0tTTy9DTUhhaWNQSFdpNHRq?=
 =?utf-8?B?aDRJVnFSZE9TdnZPOUhTanFQLzNQRWJUVDA1TjRoY1BhaWxRTWRyZWEzOEEw?=
 =?utf-8?B?ZUxoTVRCbEhIYUVZRVhDbzVoRFQzZE9BVlRkcEIvUjhDUXRGM2xDS3JwZ1hP?=
 =?utf-8?B?TXpkVWV2aFJlRk9XRC9YcFNFT1J6VjFqdkRXZlk1U2tBanEvNUcxeld5YUlr?=
 =?utf-8?B?T0FnUFYwc1k3NjRnSWhVczArT1NnRzc5NHZKN2dYRjhtSExKSTlTTHJpRW1L?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbf81c8-75df-42d4-039a-08de08fe3fca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:42:01.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYVxp4dBQ0LumlamG229b8D7CjPRHsD+QvrvZrZoQgY0AOZQerbDaBEK668CJf4Nk9+4N6/Fp4Un84kpCv/K1rF8uH5q57LOWa7t8KslVe4=
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

VF FLR requires additional processing done by PF driver.
Add a helper to be used as part of VF driver .reset_done().

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_control.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 10e1f18aa8b11..24845644f269e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -122,6 +122,30 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 	return result;
 }
 
+/**
+ * xe_sriov_pf_control_wait_flr() - Wait for a VF reset (FLR) to complete.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_wait_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 512fd21d87c1e..c8ea54768cfaa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -12,6 +12,7 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_wait_save_vf(struct xe_device *xe, unsigned int vfid);
-- 
2.50.1

