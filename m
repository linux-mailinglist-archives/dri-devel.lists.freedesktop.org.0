Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546BFC2244D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535AA10EA6C;
	Thu, 30 Oct 2025 20:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5bxc+12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D5210EA69;
 Thu, 30 Oct 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856415; x=1793392415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=07P3uyz47TxRC6cyUyODt1qeJ45Tbqi1KjH5VQx0Jwo=;
 b=N5bxc+1287LFypkW+SUFpA/iyi8oZxJhZ6gQmoWMz51e+v3m9qIoNnNA
 Q35lyoPTL9iZWgsnivRJMVfH6PMdBIYHHCUhOoEfjSqBoSXIHy7BqxHc/
 c6/XkE4FZCUMcQ4IA6SnK85l84PqNYFiUkcmopxCb45a4tfato5tBFY2Z
 8IhP1YhjSQ1pU/0sCFqtvtcNijy6KAmWFcU1cMlI/LRlhMG2tQ3dK0uHp
 l7mBae5wKMd+FB1RyPLPtPAUGRJhBjMoRE0mS0vMGftNEX0eqxVTLZDhw
 a5T/XUORFEHI7iUHpfzZBUUFU78aJhuvHjdbPkphvIxbnM/Rrq5inYNp3 w==;
X-CSE-ConnectionGUID: rKxMgBksTgyKLiI4YOIEzQ==
X-CSE-MsgGUID: Jv80dBmlRhiClBmnnlBtaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67664329"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67664329"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:35 -0700
X-CSE-ConnectionGUID: 0F9GHhW6Ro6x/rDmijFo4Q==
X-CSE-MsgGUID: XzUXvLJVSVytVKKgQU2qdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262707"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:34 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZOxK3H2o1AeT+qWjw+G8PNPkU/dkeVkCC+jH2sOUGzp8Ob0qJXKizYhElC/YkJCzrcyap48lDMYcwL5XtIrCbgrkIrzYThq7iKuNjdg6KCXZo8nDl6o2OJEPlRYAKP8te7JahkrseOx3pctjQ+Y6C3qZ3occgW/TJd4pXeUYOIuGdeOADZKY98CuC5kpdgBqlM/ScHpQKgceGQAiij53yTqCOXze0s7D1m3tBm/CodNepHZc0W7EKlHy62u7h1BUfMnmjx+FggxdzDjRgR/V7RRruVvpo05++yopNgmyi6eStSXZKOz1ovI8ZSlMb++yOLaXvBnanYO33LuvtHfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPzE5iALm6tnIAB4fC5l8nUq/fMjz5JVgrJrXpcHb2Y=;
 b=oyLdwbJ7Ao2XEKSP+1AbR4wTx+WZXylJBI8cqoTrkBVwEt60NtH6M3u3jkkgNyb7xKAvD6/rym7Gp0GrIgVANN9nHPQn9be7ImSveacK80YRylocjDpMub+D2r+4/aLrh4mO0RWxgVd5cvLB2C42hs3ZLCHFSg6dsFFWmTyFzkNBjQms9WKWwRsksYMDUoI9bRFoIY7AEbCCx5b09BMwuv0hvgP3eYj8CRYLu0cNTRnnTAbYDvN/gS0C86gEH+L4NeX4/M1mLNKIH626/+GeZaBZ67XicyoTEFHdHyCttUfgwoM8/YFCbSRRHry1oL6QilOlllXy+P9gcakYD6bPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:31 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 19/28] drm/xe/pf: Handle MMIO migration data as part of PF
 control
Date: Thu, 30 Oct 2025 21:31:26 +0100
Message-ID: <20251030203135.337696-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 01746a28-1bd9-4bd2-a3b1-08de17f396ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlg0WjRXenNZVm1Ia3dsSkdEcHF2M3pRSDlnL281R0NQQ2J2cTd5emszMGxT?=
 =?utf-8?B?K2lFQ0JQLytLTmZIMkZMZWRUZlp2NTZ4TTVUYzlzV1lPb0JERU8zK1IzZkZk?=
 =?utf-8?B?Ni93RzVobXRIbTUzcWlmN05GbGMrWW1OS0NjWGNnYUIxSStiUjQ5bDNsWjRj?=
 =?utf-8?B?ZTF4UkU1eVZoeWpEQUNZUDF4OW9ZTEp4OFpIbjcybklGWGNpcjhXTjl3OHFh?=
 =?utf-8?B?RG9WdzhVL2VJNmdtM2FoYUdNczdiZ3F6V0owczNvdS8vcWVjbkY3Zm9GM0tt?=
 =?utf-8?B?b0tmR1FSR2gwQWxJdzhGeS9VaXcvQzFIZTFseGRlY0V3ZEd2bVVGWmc4MVBy?=
 =?utf-8?B?NnJDYkVYUkh3bXEyMmRqMWZOcmZsZFphUFcwNFBnMEYwaGM0UGRBMVc1L1pz?=
 =?utf-8?B?MGxlNnNkaTBBUUs5bGFLSVhyRDJqMnJhZXh0M3RZWm9rVEhxak5pU3o1aDY5?=
 =?utf-8?B?Vndid3pUWHhBNXREelZpS1FRMzhzWmNZcmJDTUNFTGhtV3dRV0V2K1lkK1cv?=
 =?utf-8?B?NFEzU2dVcnNJUjlTMXdBWllDQlJ2alFTU25jZUQ0a2lsWGc2cUhxS0pDOFJM?=
 =?utf-8?B?NjE2d1VOcEp5a0RUWkdVN2l3Yy91bWFjeTcyU0kxZEJNYkRJY1RPdFU2TDN3?=
 =?utf-8?B?Q2ZhbUg4SER4ZnpQYytDaVJhWUh1d3EvRGZVUFg2ZHF5OVNybnF5N0g3QWJY?=
 =?utf-8?B?K3d3V1JYenZjSmptdU8wTno3d2VoL2llRTE1QWQyK0lpOUNDbUQ3ajNkaUtI?=
 =?utf-8?B?Q1hEWEZ1enJoOWwwUUtvWElVQk9UWFlsS2IyYUxka3cvVTdPZE9iM2hUVHhr?=
 =?utf-8?B?VW4xeVNGQzQzR2ZOb2pKVFpJRnJuV0pWWE9tNklYWlJUdjdZZlpJa2dMcjNE?=
 =?utf-8?B?SWE3eVgrWmZIR1lrNW1SQXVkTTdaQ3M1TVlxWi9tY2RYUVQva1lPWGhIeEpw?=
 =?utf-8?B?cUw2RU5KYUo2L0sybWZSWmsvc1IwcEwrS1cyWmNnVUdNbXNjb0lUcmJSalFT?=
 =?utf-8?B?cXJ3L3hPNUFFSzVDTU1JRmYzZHo4aEJOODBxSVBzNnVSKzNqeHNad0s0akh5?=
 =?utf-8?B?WVA3a0YvL1JOckt1aUd5enZkWHRhaU5ub2QzRU5OS3NtN1Q3RG82b3ZUOVZy?=
 =?utf-8?B?ODdSTWNKSHRFZjI5bWFaRlhWanduN0dIS3NjU0ZtN3pJWC9Nd0Vic1VCWDVB?=
 =?utf-8?B?TDlkZHBXNzhJcDNyWnoyMitYMVZCTnRGNTRWS2NUdThNSmw5RWRvZ295RWtU?=
 =?utf-8?B?aFlvTkJlTkEyOHNSV3E0ZTJBWWRwaC96UWY1SDdwWWRJU0ZVTyt6bUxpc1Bv?=
 =?utf-8?B?QUEwOUhIYURaOVFqUHFKSmwzODNZU3FXaFZEai9wUU1xeWhYZXhBQ1N3U2FY?=
 =?utf-8?B?NFZWc0o1ZkpxbUViNUhzcWZHOXdJZ0dPdjg0czFPTytYWi9qRTRUamJ4RkhT?=
 =?utf-8?B?eHEycHRVelBMVlFkcnRpVklqaVpoWGpNTWkvcUpodWtSVStQcXdtN0p1VkJq?=
 =?utf-8?B?emNKKzcyakhsY0VTMDhOakpRYVhkbzBMa29oaWxpUFE5M2pOdTZsdXFSalZ5?=
 =?utf-8?B?SGtvWjZlQmx4VDlUbmlpZ2RsUldvL3hCaW1FV211bjlrUG1Fc1RvN0lvRmNJ?=
 =?utf-8?B?NGExL2U0VE9PTW5BeVB4NU1yUCtWaVRaRUEyKzhQRU1xMkx1c2tvcHlIbmZB?=
 =?utf-8?B?Qmc1S0o5YWpXS1V5dXpDeHB4TGdnamplbFFyQXdGS0FpK2Rwb3pCSVNEbDNF?=
 =?utf-8?B?b1RKM2lhRXBCcmo3OFZGeFZOZXpuSlAzL0d4NENSbGdJVVBaRGxaZzZIamFF?=
 =?utf-8?B?SDlNWCs3WXpCMWlWQUNDbFFyWmZWaVRDSDhYUEdJVWpHc1pxZHkvSkNLQmtm?=
 =?utf-8?B?Z3pnZ3U3Si85bXJ4QWZqK2pYemNBRVZoVVBQOVpqU3RveVVJbEV3K2YzN2ZS?=
 =?utf-8?B?V1N6MlZPdGpadzBsNCtkNWdDVGwxdjYzRnVuOEQwUUYxL1ZISFozWDAwb1V0?=
 =?utf-8?Q?kZjJ/7G1sSE8Dyd2Ws9rq+DRQXnidk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkd2Unk1RE1Dc0VxdTBQaG5hNXVpQVdpRTRoNVZKUWs4Mld1Ym5BMVkvZzZ3?=
 =?utf-8?B?ZnlhUmhwRlpUU0JObndiSWJ6aDZGR2NmeERBcC8vR2ZObklyM2FuUXdnUm84?=
 =?utf-8?B?bXZPQWJjQ1VEL1Y0Z2ZiTzlaK2RsZXB0QXNTUVJac2doZUMzVmZ5ZktXQ2ZP?=
 =?utf-8?B?Sk82UkZ0OVd0NVJDVEs1WFdYQzhvdGI0ZlZjRXFsdkRBNVRQeWJGQ1dhS1Qz?=
 =?utf-8?B?UGM3cVQrOVJIMjNXTzh4eEkxeWJ3VXg5eVR5eXBTWmJtZVpLSEVnS2Q5b1I5?=
 =?utf-8?B?OC9DYzJGeGdlTzg4OVVkbEwvRDM3MFV5RnNnd1ZvS3JLd0MvR21LcnZJdjdt?=
 =?utf-8?B?NUJYRXc4V1pEQjJITTROWWc1bG1EQ3FGQWcxZlRGMURWRWJ0YVh5ZXFqK1BE?=
 =?utf-8?B?VmtnWVR0UktjUTdyUmVuT1g0OWFZbkNSZzJZR2xFa0h4YmhGVHVMcnRiNEo1?=
 =?utf-8?B?ZUdqWUJVV3d0WVNBazJJMzZ4NXJyampPaDJOWWtBY1N0VE9sVzZlU3VYTXIz?=
 =?utf-8?B?eVRyQ1hldW03U2d0MmRRTExvTlpzdERRODZnb3ZGbXU2MW1yRXZJcTJNMndk?=
 =?utf-8?B?MXR3SjBtR0liZ0NMSmZTM3lFUWZ6K2sxbENNVDdaL0RqZEZPRU4vc0paYTAy?=
 =?utf-8?B?T095Q2ppaExXNThCN3BnRjR2S1p6UXRwRmIwbzJQU253dTN2UDZmc01JeU5E?=
 =?utf-8?B?bkdNaGpjQlNKWE44a1JWNGp3YnVRQmtoSTdIckVuanNsKzc4dysyN1FWem16?=
 =?utf-8?B?c2V2ZS9DOUdFVmFPZUNaeWxCK1UyUVJmblVwWkJLMnd5aG8rNjRXMVNzbVpm?=
 =?utf-8?B?VHdMdmlTbG5WeXJTa0tTcXBWeEVNc3VRL2pheEw0UTh4d0ZveGhsMCt0UC9I?=
 =?utf-8?B?YUNXVjhLclk5aGRxNW8zTVRXaHA4WFgxMDlRN3ByOXU1T0JDYnRiOUNKWXNB?=
 =?utf-8?B?amxBZ3R4dEFLeVBZdTE5YnRoMTRQMHdIMExpSG8yOVE1RTlEWEtZeWZtcWFm?=
 =?utf-8?B?U3JrbFY2M1BlaWhPYUJneVlsUFIzUzZHbHFjbXBiVGJJajBKWCtEaUFyc1l5?=
 =?utf-8?B?aE9Oakc4d3l0em9IcVczVWl3eFo4dHB3MlZuR0dJdWRsWldUbjRqS2RiTGY2?=
 =?utf-8?B?SUNhQkN6WGNUMlZDSjFZT3hybVhFMFQzT2pQVGlodzJqQ25GYWtRR0FjQXlP?=
 =?utf-8?B?NlZzajhnNkxVdHhhdXpzODRiK2d0M2JtTjhKRGwrUFQxeUlaSW1KeUludkpl?=
 =?utf-8?B?UVp4Qy9zdTRaS0RVaXZZTGhSQklhdWdnSVhqZ1hsbUNJMWQwMjhJM2NOZDhp?=
 =?utf-8?B?SVRGSG03N1dCaDgvRkcrOEVjMDYrU2Q3clhGdy83OXBQa1JmeUx2RkxNTEMr?=
 =?utf-8?B?bEI3Tnp2cXdCRElNTFRpdnpkYTFpWkV5bW9LcjdBTEx3Rkd2a3V1UHBrOWZz?=
 =?utf-8?B?QnMvTnJZNG1ab2U1Znd4K2dnbjBUbjNrQktnNDlxeitabkVTd2NLemRhYkVq?=
 =?utf-8?B?d3BBSml2MVI2RHZOcjNHbTd1NG9FOXhVZWpGeHJndEJRT3huczQ5Z3pTaHFW?=
 =?utf-8?B?L0g1eHpSTUtaRkZPNWZwajJKcFY5ZXdsaEJJUnVYTGdnZWpqNzFoOTBMTTZw?=
 =?utf-8?B?ZUltUldwbU5ndlFDK0lxT0ZkMDUvUnNkU2tvbVZFbmVVeEJ3d2dia21Gclcz?=
 =?utf-8?B?MWJ6Ujc4b1I4RGFNN3prRWViQU5oUm9sQ1hwMmNKY1ZaajRVSWxDOXZrZVFq?=
 =?utf-8?B?aS9OcFNiUGMzRzRERUhkSUR3MkxLMytjY29yR2doM3E2VnF0bXlyRk1iemJM?=
 =?utf-8?B?WFdvNUNoUG02cGZMNW5ia3hZWG1hSWhIMVViRkUxMGNxWEwyb293VDJ0Vkdx?=
 =?utf-8?B?VUw4V1VaZzl0STBkY3NqTFZmblNadlVBTVA4ZjRuTndwc3kvR3V5cWkrNGtq?=
 =?utf-8?B?WXlDUytOMm5UbTZrY3kvNGVOWlRLOGUyQ1Y0ckFUUVZhYllwS0JZVHVkVzJQ?=
 =?utf-8?B?OFljY0tRMGVyWUlZWDhIM1JSMFFhVG95MitDaURsWUxqUWVvc0FBcUtkdHhq?=
 =?utf-8?B?T0dLQk1kUTFkMVYvNnU5MHlVRnhjZWViS1V4YWJmOW5zeTVuM2Noem9JYUps?=
 =?utf-8?B?NStGOS9NMlE4VkpXT3F1NTMwek55YWVkZ2RMYmNjcitQR3NMVEZVWGdrNE5s?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01746a28-1bd9-4bd2-a3b1-08de17f396ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:31.4373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBw75Js3mz5Uggf4JQiGZfknP7Cqo4qMTIN9dsIuzoESUW/GJPbOc5F8cVBrS51aVnwGWkeY1PaikGmfByEyTbPOT1bjvsFfcXYv16Czs+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

Implement the helpers and use them for save and restore of MMIO
migration data in stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 158 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 4 files changed, 176 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index e7fde3f9937af..c0dcbb1054e4d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_SRIOV_PF_H_
 #define _XE_GT_SRIOV_PF_H_
 
+#include <linux/types.h>
+
 struct xe_gt;
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index e7ea9b88fd246..7cd7cae950bc7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -870,6 +870,16 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_MMIO)) {
+		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_MMIO);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1079,6 +1089,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_MIGRATION_DATA_TYPE_GGTT:
 		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_MIGRATION_DATA_TYPE_MMIO:
+		ret = xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 6f2ee5820bdd4..5e90aeafeeb41 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -5,10 +5,13 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -16,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_migration.h"
@@ -357,6 +361,150 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_guc_state(gt, vfid, data);
 }
 
+static ssize_t pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_is_media_type(gt))
+		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
+	else
+		return VF_SW_FLAG_COUNT * sizeof(u32);
+}
+
+static int pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
+{
+	struct xe_mmio mmio;
+	u32 *regs = buf;
+	int n;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, MED_VF_SW_FLAG(n));
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, VF_SW_FLAG(n));
+
+	return 0;
+}
+
+static int pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+				     const void *buf, size_t size)
+{
+	const u32 *regs = buf;
+	struct xe_mmio mmio;
+	int n;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n), regs[n]);
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n), regs[n]);
+
+	return 0;
+}
+
+static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_migration_data *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_mmio_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
+					   XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = pf_migration_mmio_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	xe_gt_sriov_dbg_verbose(gt, "VF%u MMIO data save (%zu bytes)\n", vfid, size);
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_migration_data_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u MMIO data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_migration_data *data)
+{
+	int ret;
+
+	xe_gt_sriov_dbg_verbose(gt, "VF%u MMIO data restore (%llu bytes)\n", vfid, data->size);
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = pf_migration_mmio_restore(gt, vfid, data->vaddr, data->size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u MMIO data (%pe)\n",
+				vfid, ERR_PTR(ret));
+
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_save() - Save VF MMIO migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
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
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -389,6 +537,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = pf_migration_mmio_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -453,6 +608,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	if (pf_migration_ggtt_size(gt, vfid) > 0)
 		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, &migration->save.data_remaining);
+
+	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
+	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, &migration->save.data_remaining);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index bc201d8f3147a..b0eec94fea3a6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -22,6 +22,9 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_migration_data *data);
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.50.1

