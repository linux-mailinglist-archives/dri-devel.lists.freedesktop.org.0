Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1EBCFBB7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2F010E34C;
	Sat, 11 Oct 2025 19:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUpyPLQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB45510E34C;
 Sat, 11 Oct 2025 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211686; x=1791747686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BW3jJzcEKBed6HcFKWuU1hic5kwLU/gvKn6KQJO0aGg=;
 b=iUpyPLQItyV3WpVOUGUCeKLuP7fMdRipMCRTpM8QrDvPNj1tpk/UrQ8X
 r0HAgMCUMV6Rew/OGu8iEpMjHGHUDUlv4CxvuCh4k00dbyvJx1XCJmfM3
 +8567P0sKOaGzEpVtMNPdnuKrE99nwXoiBj+sX2TVosXF8eltmOPCQRvO
 YwF6he8a58v/l3cZilqvWg4DHU+go64pMvh6UMgBVbm/Eo58EfRVOK+/p
 +Zmgl9X8m62D0bEr4DuxCbTAHSBlegIjXQNU9WJYDQ0Mi/ybn9gnD3pDm
 IN4/u8Y8KfiLsWbZFJK4pqbquCLAqbsdk2LpN85rph8Qt0KL7gcGppbrq w==;
X-CSE-ConnectionGUID: /Y+9ec3ISfOvubLSg9mZ5A==
X-CSE-MsgGUID: Iaz46j3hR62A3IvJW7rgsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="73842065"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="73842065"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:26 -0700
X-CSE-ConnectionGUID: R77TLiw+R7yyNiGLN3ro1g==
X-CSE-MsgGUID: AS9YE1gPQMiETDJ+DxpEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="186344006"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:25 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6ps3dwZQJUZMh9djnt352wKrYD+/MiB/dM2tATtEGm9F9Eb+bVYguu0kWjPei5WqplsXBmZqgysOIZpf0dSV0OQMhd9YaiFTaC2rFmNBnHx0OIkKev2suqka/EhNYiEdahxShlVra5SwCVJx8HRogapfopPsscas842+gYDJn4zrA3uG/jqygfJ+p+nzFlHLPb907g3RPc5j2hz0oN5sBoa5xYsgnc8inK5dA9rj3MkmGl2B4fzP3tzQ8orMcSkq4NtKY0/vTMRMapWqJwT2YAmKoGwAXMAT/GWGXAV02mbFKwlCE6cL/k4Q6uQ6AhU04qtC+hdu4s0fxIjeIFsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPyZE82EFtDWfDYWdQST175aTuvwu6c+0xCcG2r9fPI=;
 b=nJvD8NLGhmpRA0YrknYaSDNXrxAtaNm6pldISNGqyeH9foADUJHVOI0EJI0qq2s4xqDAanam2DgRU3cpu3gIf5+OMIDQ4pYbE6rIol+u2yoDzHI42PzmFR19MPgvj+PfrSDCaNwjazUonyYgYWsU5YOeWz0Jxp/eU0OWvl042Q4PDi1WacdFw/9eeP+OYTFmMLEUfMQQxvLDPvRHKn5tMy89yfHJz9/2KMeN9CoXgKa5/K2F6eqhYROR+NX/E9+D26ipCGgmzocz321lYcVB4aInsnwHID6vFNzOatzSaEF+/ocl++mXC9Giu23mEMEfjiLXISBu0VXSWLlz7cBcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:22 +0000
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
Subject: [PATCH 15/26] drm/xe/pf: Switch VF migration GuC save/restore to
 struct migration data
Date: Sat, 11 Oct 2025 21:38:36 +0200
Message-ID: <20251011193847.1836454-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e71ef73-89c5-4873-b066-08de08fe2834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3dMblNCREVGTmVITlE3WDRNK29raGMxTW1LcWxYY213K2pNbHh1ZW9GVEda?=
 =?utf-8?B?a1IyWHNLM1VkQ3ZrMXVlOE00QXFDSzNrbTBKaTkvdlIwSE9Td3FpSzEvc29B?=
 =?utf-8?B?NFU5VWM1WnBaREFQRHVtSFlvTjRyL0pLTDhkZzQ5MWpnb1Mvc2ZodWpMMFRP?=
 =?utf-8?B?ZkpDUXliRXAwYmo2emw0N3VqUlExazNaY2crZlhlL2RBTi9TVTJZUThDZjk5?=
 =?utf-8?B?TjZUMnVlb25GejVTZXRCRWxKcCt1VkZxY1AzNWh0Z1FuL2hObVd1dWhUYmZk?=
 =?utf-8?B?Z2VUU1lCalR2N3VkOWVnb05BWGJKRE8wVUs1cjAxWUNDdHZCTUpjcDFJbmxC?=
 =?utf-8?B?dWZtVTN1NXRUVHpzV0xDckJPV213eE9ZRkd2b2NGUG5Wa1J5dEo3OG9BNSt2?=
 =?utf-8?B?SmxZaDlybThoaVlydzhKeXNLM1JHOExyTnVmL013OTJwV1VQNkwwSGs0ZStH?=
 =?utf-8?B?MVl2MkZZRzVqa0NWeWp0UDBoczkyd002bytZV2YxWGtFbitab3g4Q1VwWno2?=
 =?utf-8?B?Y1BJVE81ZkZXZzBVWkxXaGRUSmpCMEdCTGJEc2ZuNS9ZNHlrb003REZZZkVJ?=
 =?utf-8?B?Y0dvbDV4UXNwOEd3bTc0enZxd25SWmdKaEN4aG5nWVFFWmZ6OTdmWHhUWUxs?=
 =?utf-8?B?ajhURDlVd2YvdVkxRFZxZHNvM24ydmE3bys2b3hWRTU2MzM5WlUrb3JXWjEv?=
 =?utf-8?B?Rk54Zm1KRCtaZGtYdWl0K1k4eEFnYWFwUkZBOHE2VFh4SW40Nmg2WFpSaDhJ?=
 =?utf-8?B?ZlVyUUJHWmN5TitaQmdncDd4MjNud01ZZG90YUQ2c1I4SFowMkhGaGpIRTdM?=
 =?utf-8?B?NG9UOWNsd3gzV2JKYTFpK1o3NjZhRy90UmhVWk1UVWpXZTdUSHFNYXVEM3lW?=
 =?utf-8?B?VmhaWkNnWmc2bHl0OGRzVHRUUklmdHBsZEcwcFA4ZmNGcE1zR3owbnlLRUZB?=
 =?utf-8?B?RW1TTnJwU1ZvbnF1QkhHbjRCK3p3WWk4WXdnRUZLT0ZQWVMzWnpDdXJISld4?=
 =?utf-8?B?V2VVZWtoVjF4S1hPK1lVZTZXWFRiRDFLejNadU01bm9JNkJnTzV0SkNUd1Jx?=
 =?utf-8?B?MFNYeVUzd3NJVlMwOGFLSFZmZXAySDNQeStvLzVzZTc3U3hUUERWOENFSmQr?=
 =?utf-8?B?R3pyVTVGRnF1R3lIWjJ6VjV1SDVSREdyMXRhbGZJRGhId0cyN0tSMU15d0cv?=
 =?utf-8?B?QXBMeDZXY0VobmorbHFNRkhMUktUWUwyNHlMaFovallOb2RaUmZLTVhqbUhH?=
 =?utf-8?B?bW1mZW5NWUMvbHdqc0kzSDZpR3BKU2dneGkrMERSd2h6NkZwWmNNa1J5TWZV?=
 =?utf-8?B?MnpNYklJRUxkQVR4VEhrbmlyQzNHK1d2amFrRWRVTWhYV1haNnovSUNVTi9I?=
 =?utf-8?B?ZXljcUhteVRVNkYyOWZGMEplSDhQV0tiVlB6MFN4VHNFNEo4ZVorQlRoNGhG?=
 =?utf-8?B?Qk0wVkdBUDVNKzdlMm0wTmg1d0VURmsrZ2JHdDdUU2JZN1J5SjlJZXBoZ3c3?=
 =?utf-8?B?UUY4Z29iSXE4MDJZRHBTTGZlUmowd3lQd09LTE1KaTNQKzJGbm1wM0svMDRk?=
 =?utf-8?B?djdQL0xTdU9Dc2RoNzBNdTRmSlk4RXo3ZDQxZjdWYkJVMFZmekJtUzhWMTJU?=
 =?utf-8?B?WmZvZklReEYveWxyNVdzM01PMTNacXpFRjNEd3NYNHVRbFhlWmdaSU9xakgw?=
 =?utf-8?B?U2ZjM3dNU2RhUC91TEhqaVJPUVZkTFNyanlVbDEzenZXeUVLQWJyMFRYYVZv?=
 =?utf-8?B?WHlBYmZvY0FkMjlURVBZbkdBQlVtdURBdHJYeWJlZWVkdmtMZjludWlST0Ur?=
 =?utf-8?B?azZpTXE3QWNzVER1Mno3c0RhanVuVmltL1BaWUlQUCtoK3d1ZGVQUDFaRDh3?=
 =?utf-8?B?YU5raFA5bWVFVlBJV0dDTEcrOFhRVEliMU8xbkwwcGlweGs4RmVlSU44RVZP?=
 =?utf-8?B?eGpzN0l3b1hFOW02cVdlYWVuM1JpRU1KL1IyRzFFQndIbmJyTE9RRUQ1dkxN?=
 =?utf-8?Q?WNoBqNaPwPgNrfZZ0UOc8g5CEsHPRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pmL1ZyWXZxV1NPOWRCaS9jdUVGRlVOK0h5anovcVIwRGN6L1IzSGF1T0RU?=
 =?utf-8?B?aVo5MkQvZW1zb2hRRzN5MFJ5eUFPRTMvd1k0emRUMHIrcmNrcGQ2bjhUNXF4?=
 =?utf-8?B?MmxTa2l0ZUlVVFVhMElEY2VNYVVmWDRxeTA2ZEt6R2w5L3ptRjlsd2xHWEpB?=
 =?utf-8?B?TEJOVEVkNnI1ejQ2cHBuWHloQjN0UWdYUmkraEpFN3h5OFRHUmxKc2VlVW1t?=
 =?utf-8?B?QXZNMHNGUnYrUGJ6ejJ3R25RYnJXYUxtcUc1VFhQNXNhT2VDWE9EcC9NMnhG?=
 =?utf-8?B?VUFRWndMdkovWjRGTU8zZHQxVjRWRVZZZGxRWUh6bmZtUlBSTk9qbUF2RHZT?=
 =?utf-8?B?Y3pYZVVKWFNYSGhnNjNDcjdKZFZzQ2VpaFNiWlljMFQ0T2dzSGVUMlo4ZVNS?=
 =?utf-8?B?WjgvQkJWYmEwKy9HRld5d2JzRVk4WU9ZL0RJeGlMR1UrL0hLMklyWXNVWUtq?=
 =?utf-8?B?UjZzQVF1aHl4bUpnYTE2d1VObnhBL1QzRlcrNEszYXVGSDhtaHIzMjBlRUp2?=
 =?utf-8?B?enNTdi81MFdHWmNWNlAxUGJSbDRrYXZlVEpOOXovYVQ2Yy9pU1V2Z0JTN3RR?=
 =?utf-8?B?bTZnT0ptNGh4SnlZQUZ2bnZSbUQxOE83SmI1bThpdTZ2ZGZWOSs0Vk9oR0pR?=
 =?utf-8?B?eGZZMkxhVUh1U01RV1lESnEvaG5SY1BRTGFObUZIYm9JeFJHbEhxaG40dzFv?=
 =?utf-8?B?bmNWY0laM1FIRzBUYzZqRVNSd2hHRVF1dGQydDhsY1k4WXdtajRMZEdhZlNB?=
 =?utf-8?B?U1psUTM0dHBYY2RlVXovSDJvSDNEMVZZVlJ6eit4VDVDOVVNbTk3Q3NaRXVj?=
 =?utf-8?B?SGY0cjI5QzJKcENJaTljNFM0c3p5UmJIa3VNMyt3V1M3Q3FJVkVmL1hyV1FQ?=
 =?utf-8?B?V2dqcFFEQjR0Q2NTUzJrT1NpOEVjWWZoQTBTQU92QnJwamY0Sld4VW92K0Rx?=
 =?utf-8?B?L1AzZzdvWk5QTnNSVis5UkJpajk3Z1hJMGFLTlRLMWcvRFB0ZHdmNnhiN3Fu?=
 =?utf-8?B?WFY1M1BkeW9ydU9XYkJGMXhza1JjcVR5MGd0OUZOY3pZbkJoWmZlelUzRFZa?=
 =?utf-8?B?a3U3UER1eVVNc2k1RVFuTlVSTEhmbEhqNE9tcEYxYXc5eDB2ZDJGYUVjR2I3?=
 =?utf-8?B?dUpzTUMyanpta1RFQnZQNHdFVFRCZGR5d0Foc1NxcEFMekRaNHUvOGV4TXhV?=
 =?utf-8?B?bnhjLzV4UjA0Zk9WTnNiZGZPM0dNakoyTDlMSFovU3VkSnhXODh4ZnkremZm?=
 =?utf-8?B?QzFKZ21ibGRraWhSbFBDRkcrUTJTWmgvemVDeno2cGFIdXR2SHc0N0pLUmJi?=
 =?utf-8?B?NHdHVkxsUmlYaitVNUw5djI0S3UxbWxxTzdxVjlMK2hza2I2bmhkQU13RDc0?=
 =?utf-8?B?TFh0M3UyY2NZd25UdDlhSjFicXcwWnlreW9uSzVob1JjTVBMNndydUFkL0Zn?=
 =?utf-8?B?dThEWng4OTc3cm9PSGZxRmE1cFNrRnliVmFLUGk1WW91SnZnVzhHbitpMW02?=
 =?utf-8?B?YmxKTzBkQjVnNDV5T1hYL3VCMGhQaHVmaVdWNFJCRjhUSTZsYUh6Mys5M3BO?=
 =?utf-8?B?Y2NmV3ZmSW1qTHZLQWFWS3ZyVDQzSnBiMnZuRlBzVUZtbk5QeWVrK3FsOGFX?=
 =?utf-8?B?ampTR1FvQWZoNGRVZkdhMGpxZldBeFFCeEVQdTk5a0thaXNIQWZ1N0k1S1hy?=
 =?utf-8?B?L3J1ZS9SNkxTQXFydEp3UmRwbXNuVTVXVWk3amdMTHFXM2liK0VWWFdwTTRx?=
 =?utf-8?B?OG1ldHJYVHFOK0pER1dyVk9QS1k1MnVhM3dOS1c2NG1EYTR1eEs2YnA0UGE4?=
 =?utf-8?B?bVovTGkxMm9MM0RNb3o5MnA3NjZqd3FCZHJBTkc3V1lJU3phU2orTVhXWUkr?=
 =?utf-8?B?dE9BRCtWU3FtQzQ0c0Q5ZVpzNStUVThFd3dDd2tmWnV1cERQMHFmNXNzYnBa?=
 =?utf-8?B?K1BoS2JFb09ZUlRtcFpVcHR3bU90THJJWm5yY3dkN1F3eTgxQ1NEQlBUNTUy?=
 =?utf-8?B?bjRuajRhd3E4ZmEvY1E4REZ1SHJQUUVINHU3bEJVeEtzR3Q0Q0RONTQ4RVNh?=
 =?utf-8?B?bjhrZElucDhkZVl2NkR4cG1kMFpoV0ZzQzRUM05EZXBnMHI2UnpEY0pXdmFw?=
 =?utf-8?B?OUxhSk5BY1duV25ZUnpHT05TTUp6WUFVUDVDWlY5dXhyUmNhRjF5VnFPdVVS?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e71ef73-89c5-4873-b066-08de08fe2834
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:22.4606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaEet6KPFlF6KH87l1Cq7inoqS/q0V4KgEeu1Zd4fJJtxuym4+hmilv+7pneWRkDAazjNaDjCpdVJY+yo6ktoBeBySodaYxTYRMAz520EPE=
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Now that the data is decoupled from both guc_state debugfs and PAUSE
state, we can safely remove the struct xe_gt_sriov_state_snapshot and
modify the GuC save/restore functions to operate on struct
xe_sriov_migration_data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 266 +++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  13 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  17 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 -
 4 files changed, 81 insertions(+), 218 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 8b96eff8df93b..e1031465e65c4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -28,6 +28,15 @@ static struct xe_gt_sriov_pf_migration *pf_pick_gt_migration(struct xe_gt *gt, u
 	return &gt->sriov.pf.vfs[vfid].migration;
 }
 
+static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
+			     struct xe_sriov_pf_migration_data *data)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		print_hex_dump_bytes("mig_data: ", DUMP_PREFIX_OFFSET,
+				     data->vaddr, min(SZ_64, data->size));
+	}
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -47,7 +56,7 @@ static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 }
 
 /* Return: size of the state in dwords or a negative error code on failure */
-static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
+static int pf_send_guc_query_vf_mig_data_size(struct xe_gt *gt, unsigned int vfid)
 {
 	int ret;
 
@@ -56,8 +65,8 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 }
 
 /* Return: number of state dwords saved or a negative error code on failure */
-static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *dst, size_t size)
+static int pf_send_guc_save_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -87,8 +96,8 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
-static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *src, size_t size)
+static int pf_send_guc_restore_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					   const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -116,120 +125,67 @@ static bool pf_migration_supported(struct xe_gt *gt)
 	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
-static struct mutex *pf_migration_mutex(struct xe_gt *gt)
-{
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return &gt->sriov.pf.snapshot_lock;
-}
-
-static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
-							      unsigned int vfid)
+static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-	lockdep_assert_held(pf_migration_mutex(gt));
-
-	return &gt->sriov.pf.vfs[vfid].snapshot;
-}
-
-static unsigned int pf_snapshot_index(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	return container_of(snapshot, struct xe_gt_sriov_metadata, snapshot) - gt->sriov.pf.vfs;
-}
-
-static void pf_free_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	drmm_kfree(&xe->drm, snapshot->guc.buff);
-	snapshot->guc.buff = NULL;
-	snapshot->guc.size = 0;
-}
-
-static int pf_alloc_guc_state(struct xe_gt *gt,
-			      struct xe_gt_sriov_state_snapshot *snapshot,
-			      size_t size)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	void *p;
-
-	pf_free_guc_state(gt, snapshot);
-
-	if (!size)
-		return -ENODATA;
-
-	if (size % sizeof(u32))
-		return -EINVAL;
-
-	if (size > SZ_2M)
-		return -EFBIG;
-
-	p = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
-	if (!p)
-		return -ENOMEM;
-
-	snapshot->guc.buff = p;
-	snapshot->guc.size = size;
-	return 0;
-}
-
-static void pf_dump_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		unsigned int vfid __maybe_unused = pf_snapshot_index(gt, snapshot);
-
-		xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state is %zu dwords:\n",
-					vfid, snapshot->guc.size / sizeof(u32));
-		print_hex_dump_bytes("state: ", DUMP_PREFIX_OFFSET,
-				     snapshot->guc.buff, min(SZ_64, snapshot->guc.size));
-	}
-}
-
-static int pf_save_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
+	struct xe_sriov_pf_migration_data *data;
 	size_t size;
 	int ret;
 
-	ret = pf_send_guc_query_vf_state_size(gt, vfid);
+	ret = pf_send_guc_query_vf_mig_data_size(gt, vfid);
 	if (ret < 0)
 		goto fail;
+
 	size = ret * sizeof(u32);
-	xe_gt_sriov_dbg_verbose(gt, "VF%u state size is %d dwords (%zu bytes)\n", vfid, ret, size);
+	xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state size is %d dwords (%zu bytes)\n",
+				vfid, ret, size);
 
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (ret < 0)
+	data = xe_sriov_pf_migration_data_alloc(gt_to_xe(gt));
+	if (!data) {
+		ret = -ENOMEM;
 		goto fail;
+	}
 
-	ret = pf_send_guc_save_vf_state(gt, vfid, snapshot->guc.buff, size);
+	ret = xe_sriov_pf_migration_data_init(data, gt->tile->id, gt->info.id,
+					      XE_SRIOV_MIG_DATA_GUC, 0, size);
+	if (ret)
+		goto fail_free;
+
+	ret = pf_send_guc_save_vf_mig_data(gt, vfid, data->vaddr, size);
 	if (ret < 0)
-		goto fail;
+		goto fail_free;
 	size = ret * sizeof(u32);
 	xe_gt_assert(gt, size);
-	xe_gt_assert(gt, size <= snapshot->guc.size);
-	snapshot->guc.size = size;
+	xe_gt_assert(gt, size <= data->size);
+	data->size = size;
+	data->remaining = size;
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
+	if (ret)
+		goto fail_free;
 
-	pf_dump_guc_state(gt, snapshot);
 	return 0;
 
+fail_free:
+	xe_sriov_pf_migration_data_free(data);
 fail:
-	xe_gt_sriov_dbg(gt, "Unable to save VF%u state (%pe)\n", vfid, ERR_PTR(ret));
-	pf_free_guc_state(gt, snapshot);
+	xe_gt_sriov_err(gt, "Unable to save VF%u GuC data (%pe)\n", vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_save_guc_state() - Take a GuC VF state snapshot.
- * @gt: the &xe_gt
+ * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
+ * @gt: the &struct xe_gt
  * @vfid: the VF identifier
  *
  * This function is for PF only.
  *
- * Return: 0 on success or a negative error code on failure.
+ * Return: size in bytes or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
-	int err;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
@@ -238,48 +194,24 @@ int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	err = pf_save_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
+	size = pf_send_guc_query_vf_mig_data_size(gt, vfid);
+	if (size >= 0)
+		size *= sizeof(u32);
 
-	return err;
-}
-
-static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
-	int ret;
-
-	if (!snapshot->guc.size)
-		return -ENODATA;
-
-	xe_gt_sriov_dbg_verbose(gt, "restoring %zu dwords of VF%u GuC state\n",
-				snapshot->guc.size / sizeof(u32), vfid);
-	ret = pf_send_guc_restore_vf_state(gt, vfid, snapshot->guc.buff, snapshot->guc.size);
-	if (ret < 0)
-		goto fail;
-
-	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
-	return 0;
-
-fail:
-	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
-	return ret;
+	return size;
 }
 
 /**
- * xe_gt_sriov_pf_migration_restore_guc_state() - Restore a GuC VF state.
- * @gt: the &xe_gt
+ * xe_gt_sriov_pf_migration_guc_save() - Save VF GuC migration data.
+ * @gt: the &struct xe_gt
  * @vfid: the VF identifier
  *
  * This function is for PF only.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid)
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid)
 {
-	int ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -287,75 +219,44 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	ret = pf_restore_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_save_vf_guc_mig_data(gt, vfid);
 }
 
-#ifdef CONFIG_DEBUG_FS
-/**
- * xe_gt_sriov_pf_migration_read_guc_state() - Read a GuC VF state.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- * @buf: the user space buffer to read to
- * @count: the maximum number of bytes to read
- * @pos: the current position in the buffer
- *
- * This function is for PF only.
- *
- * This function reads up to @count bytes from the saved VF GuC state buffer
- * at offset @pos into the user space address starting at @buf.
- *
- * Return: the number of bytes read or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos)
+static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
+				   struct xe_sriov_pf_migration_data *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	ssize_t ret;
+	int ret;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	xe_gt_assert(gt, data->size);
 
-	if (!pf_migration_supported(gt))
-		return -ENOPKG;
+	xe_gt_sriov_dbg_verbose(gt, "restoring %lld dwords of VF%u GuC state\n",
+				data->size / sizeof(u32), vfid);
+	pf_dump_mig_data(gt, vfid, data);
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	if (snapshot->guc.size)
-		ret = simple_read_from_buffer(buf, count, pos, snapshot->guc.buff,
-					      snapshot->guc.size);
-	else
-		ret = -ENODATA;
-	mutex_unlock(pf_migration_mutex(gt));
+	ret = pf_send_guc_restore_vf_mig_data(gt, vfid, data->vaddr, data->size);
+	if (ret < 0)
+		goto fail;
+
+	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
+	return 0;
 
+fail:
+	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_write_guc_state() - Write a GuC VF state.
- * @gt: the &xe_gt
+ * xe_gt_sriov_pf_migration_guc_restore() - Restore VF GuC migration data.
+ * @gt: the &struct xe_gt
  * @vfid: the VF identifier
- * @buf: the user space buffer with GuC VF state
- * @size: the size of GuC VF state (in bytes)
  *
  * This function is for PF only.
  *
- * This function reads @size bytes of the VF GuC state stored at user space
- * address @buf and writes it into a internal VF state buffer.
- *
- * Return: the number of bytes used or a negative error code on failure.
+ * Return: 0 on success or a negative error code on failure.
  */
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t size)
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_pf_migration_data *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	loff_t pos = 0;
-	ssize_t ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -363,21 +264,8 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (!ret) {
-		ret = simple_write_to_buffer(snapshot->guc.buff, size, &pos, buf, size);
-		if (ret < 0)
-			pf_free_guc_state(gt, snapshot);
-		else
-			pf_dump_guc_state(gt, snapshot);
-	}
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_restore_vf_guc_state(gt, vfid, data);
 }
-#endif /* CONFIG_DEBUG_FS */
 
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index e5298d35d7d7e..5df64449232bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -12,8 +12,10 @@ struct xe_gt;
 struct xe_sriov_pf_migration_data;
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_pf_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
@@ -25,11 +27,4 @@ xe_gt_sriov_pf_migration_ring_consume(struct xe_gt *gt, unsigned int vfid);
 struct xe_sriov_pf_migration_data *
 xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid);
 
-#ifdef CONFIG_DEBUG_FS
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos);
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t count);
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 8434689372082..aa8f349e6092b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -6,24 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
-#include <linux/mutex.h>
 #include <linux/ptr_ring.h>
-#include <linux/types.h>
-
-/**
- * struct xe_gt_sriov_state_snapshot - GT-level per-VF state snapshot data.
- *
- * Used by the PF driver to maintain per-VF migration data.
- */
-struct xe_gt_sriov_state_snapshot {
-	/** @guc: GuC VF state snapshot */
-	struct {
-		/** @guc.buff: buffer with the VF state */
-		u32 *buff;
-		/** @guc.size: size of the buffer (must be dwords aligned) */
-		u32 size;
-	} guc;
-};
 
 /**
  * struct xe_gt_sriov_pf_migration - GT-level data.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index fbb08f8030f7f..b5feb6a54e434 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -31,9 +31,6 @@ struct xe_gt_sriov_metadata {
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_gt_sriov_pf_service_version version;
 
-	/** @snapshot: snapshot of the VF state data */
-	struct xe_gt_sriov_state_snapshot snapshot;
-
 	/** @migration: */
 	struct xe_gt_sriov_pf_migration migration;
 };
-- 
2.50.1

