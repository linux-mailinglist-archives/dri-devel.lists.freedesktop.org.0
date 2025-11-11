Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B234C4AB8C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E71110E4C5;
	Tue, 11 Nov 2025 01:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azhudx8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8A910E4B5;
 Tue, 11 Nov 2025 01:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762825102; x=1794361102;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9GuXh/hJUe207FbZNvR2lQ17NWvJehZO7NjlhN2H/AU=;
 b=azhudx8dMWp/TBrRNsmKlqeUfIEBduA+p25d2Sh0yOwLXzuMLXDJlkll
 3xKT1n8Bc/FH2Bm69LxgVXcf9HMsXkKmhMoH58wn86PM21RvJl6d8mVKb
 EMrADqHGgB0n94e0WqsaaisIjs0xXMvec4P8ufitunNTV1htzr3p72AG4
 NwWR+OInvFRb8beAzKXtaYWi3FBOq3f3psJ+mIvl5UhrwNB21+qIVXecr
 Dga9215CTW8Jmi310jVJaIJREdzUsQAfFC6vSFtrZ6vMlOnqBlAmgzNyf
 Y4u9up6Mmu0eUdSzQYdd05OSFR0sya8/RJe9jtwL//uVLJsijJFYRPdSv A==;
X-CSE-ConnectionGUID: sXoDuuOKR46DFLgomxE+5A==
X-CSE-MsgGUID: AMaBvkeEQ/WMxChDCoJpXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68742141"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="68742141"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:38:22 -0800
X-CSE-ConnectionGUID: jtaE9xTtTl6+OI7jlJ3u+w==
X-CSE-MsgGUID: NNmswenBRDCQDposCVNxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="212209983"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:38:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:38:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:38:21 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:38:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZWBRpqJrObY7QdZatVHM9vtdIIlNwKku8dNNztLnRy3mRmBK0yR6a2Bs5W52n8AlvHHA2mdVd9FDKz0xFIgLP5sVQgbopQ0iZ21wm2F+kPbgfh5oc48oWPD/ZJHQCEZk3DlYxv356GQ1VI8gFGVllTUuMy24Y4iLrON87EduGVwmYWgL++IvY0vhSgJJ0DyQWM+qaPtLmoYZbxwv+zggmamJh+2yeHqGYjsuYWzVWWinqsXslMUbapsSG8ib38wHivo9GieZJTMK45dbc3FZasZevmVFLwZmPGw+pMnP9Dw8StSsYbiS6WH7HERzPAAiMb79+wzsV0B5W8n9Tzp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GuXh/hJUe207FbZNvR2lQ17NWvJehZO7NjlhN2H/AU=;
 b=GLqH9EUGtzZNO3ImWewJq18/RiG9l03UhYS5EEr5HmoRg5cwJjmympfXn+s7DZ+wQ+qyt+XtoZJa2GM9RK3aTAOgH5bzFrDOtKtQ577MM2Dodr2Af2k/UzG6BS4BsQ57qejYf8mAwehjrOpWFjWfAj+mqjs1l6NhmNCpQn3/P6EpH8YP2265y6za5UyEtEhsItayR4bbu2uvKZ8N1UUQADRf1mpJDDWCOmfcWVhjwOrlKVAsVxEd31YUCs2yXUW4l7PzRDim2UerzSpORDX3M7ghX3xpYwW9MgimxnBAl263b6XvaZanY6rt6A/F5gvuu2tfLGCbMMES6PTGkajzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:38:19 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:38:19 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, Alex Williamson
 <alex@shazbot.org>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Topic: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Index: AQHcUqd+vf1n1dVj5UmyiLVe2Lh3r7TssNbQ
Date: Tue, 11 Nov 2025 01:38:19 +0000
Message-ID: <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-29-michal.winiarski@intel.com>
In-Reply-To: <20251111010439.347045-29-michal.winiarski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5152:EE_
x-ms-office365-filtering-correlation-id: 2e836767-b030-463b-df1c-08de20c2fe31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?WTlIRUNIRWloK1h6VUpzREttUEtkSDFWckg2SGF0WFN5VkY5b3N0TElycWdM?=
 =?utf-8?B?TEpUZFRIQ0NFMGxNbWRZTVFFc3FCTzhDSlgzNEh2SmwvZ08wVFNVNGJPS2tv?=
 =?utf-8?B?QnN1TEhnOVBhWlZyZ0d5RWtaUi96ZDB2SjN4dEdqb2I5T2JCbEYxb21DU2F0?=
 =?utf-8?B?a1MveXp0cVB2bHUyQThEYnp3bFcwOTIrN3kyTGZhck0zYk1ZcVhXNmV6UUlt?=
 =?utf-8?B?dVpxY3NOVHdVYllrTWtGS3gyL1ZzaVRmRE5qUGFKM0xKcjFXSk9uK1E2ZkNT?=
 =?utf-8?B?YUxnRkcxdFZYdWtVR01tdDZ3OGx3Sm0wakJKcVhNRlUxald3Y1ZYVkwrUUFp?=
 =?utf-8?B?aFB3UUxiVzJ1R0VLM05mTmdQaXBMR2V6S09KWVdoT1ZDYUNjSVlKcklEODVu?=
 =?utf-8?B?OVF1YVFxb0tib0hSVVUxRnNZUXJ4NDhqOHN2VHJoNzhUUFNYcm9TVzZTZE9n?=
 =?utf-8?B?ZzNmckFyeGlFZVpPK3pwekRpeE1IaENxNmdEV3ZHR1JrK2FoTzhSQUhrS3Rk?=
 =?utf-8?B?NlBGckhEL1VPV1JsQzNPUVhKWU1PTDJBaU92VithVGF3Tlo1Wm5hSmVnWnla?=
 =?utf-8?B?cDMxWWY2TGV4dWxKcHZQeEcvS3RMaXRMd3YwQlIvWFdwc1ZwUWFKZGdycDlK?=
 =?utf-8?B?bzZLREh4SmxuaDlYazlYMjN4aTFueUFWYTlsaEcxWjJSbHdJNTZERlBuVzB5?=
 =?utf-8?B?NElxMVM2NTlXa1FMbkQvaFZVSDJOcUJCbnZ1Nk4yUk45ZWw1Q0NYdktuNmlF?=
 =?utf-8?B?SWJCNmNxcGdJNTVRS3R5M2h3SjRQbkVxQWpSZEFCOXNoelRVMml3Ymw1SFdI?=
 =?utf-8?B?eGVxaFJIVG1PR0tzOWdHVGRTQ3hwU3dXOC9URW0wTzBDbjVOREdOWGhucWd1?=
 =?utf-8?B?NVFsUDdFbnIyd3lQN0loT0tLSzNxYWlxOXpOYzdZdjZ1eHIzMUZPOXl2V0d0?=
 =?utf-8?B?Y0I0NEc0bjBPWFgrK3lpWmJGZE9jWW1paDlSNlpMQUduckhwZjZOczdveVk0?=
 =?utf-8?B?YmRkZnZ5bWt6OVpUS3NEZlBpMUI3c200bDBMc1EyT2dMODRpZVhyNzdyRFhE?=
 =?utf-8?B?Y0Flb2ovNVZjbTVlMDd0SXhsS2RkeE1pM2t3OS9td0Z1ZHlrcWJuaHhUcVpl?=
 =?utf-8?B?dEdrVWQ0QlVRTSt4THNoUmNSREozbFd3dFE3M1FUVzE4S3h4ck1FWEdSTVdC?=
 =?utf-8?B?Z2JVMWJzcVdJaVgycEhZd2Y1Sko0Z0FYTnFSUWNkOVRITzJKUjZrcDNWMytQ?=
 =?utf-8?B?ZVNKc3NUb3F3Mm93SDk2L3dRTkhBL1VsUTg4dllnYUpYaWpVcEc5NS9QSTZW?=
 =?utf-8?B?QTk4M2tJUWtKQlptNVNnSHdaOUVaSGVKMWkvNGxMc1B4ckIxUyt5c0xBV0FX?=
 =?utf-8?B?bnNadDBaSHhGTjV1S3NPeXk2Y3BUakxkT3k5aUNxRWRMZVdjd2xBV1FVZTZE?=
 =?utf-8?B?dUFQbU4xSUZaOGZtdzVJUlhoS1YvN1FHR2k3QWZINXl0WnMzNEFrTWt0TTJN?=
 =?utf-8?B?TWtQUnNVNVN3RmY3WDB5ejdobGs2WENOZDl3K2hiSjVkaERVSWdKOHBFTVhm?=
 =?utf-8?B?bmcwTXIyMDhscThqdXc3SkxLWDdmTFlmQ0hNcXJZNUd2aEdBcFYwNjdFWjBp?=
 =?utf-8?B?WTVIK04xdTF4cXVScWxiM3piMnlneGFlaUFQTU1CVzJ4U0tWQnZIVGJYZnpo?=
 =?utf-8?B?UUlnR1NtcTUvVTJWSDNYSjh5ZjB5UEpZSkloUU5TY29mcUZ3dHdSU3AyRHhz?=
 =?utf-8?B?dkk0WjRESWxsbVBZZkpLME4xZlN3Sk5OL0VYRC9ibjRkN21RQjdrY3lvS0hi?=
 =?utf-8?B?Z1NoVjdBL0VFaEQ3WFVmWWlPVGF4U01HS2VhRHd0M09XTTVoM1NqK3FhVUUr?=
 =?utf-8?B?VHdQZTY3RnV2U1FxbEVGV1FqT1A4bWtGMG5SMzdmVUZMWVhyUkF3cE9qRUpu?=
 =?utf-8?B?ekxveTVnUG1GaEg3Y3NOY0g5SU5FZ1ZubnpTUmhXNDhHU1hsVUJXaDFnYm5r?=
 =?utf-8?B?VjFYS3VqeDAxbGE5Ni9CVnBzZWdBSjdnZHVHSGtmbkRJdWx1UUQycmJDTzRQ?=
 =?utf-8?B?QjlOYUVlUi9ieGVHcGR6Y1R6VTVpSnlPenRQdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHZ0SnlkaXF0RFpCcHVOMVJXR1JsVnluMnQrclo0ZTNpNy9Lemp2QldmTE1p?=
 =?utf-8?B?cURydFEyVGVwMERZTmhzZWcyZDlSdURocTRGenc5NytadTVEQTRCT0o3TkUy?=
 =?utf-8?B?dXp4V2E0WXI0cVhrcXZENkUxL1VBYjdsVlY4TlJodnhTWVhyQTNsTzJsdm5O?=
 =?utf-8?B?dTRCbU1ic1BUQkpOaS9UV0NBQ1B5YVdWUHJ6dm1oUkV4Tm9UdHRqeER3RlVD?=
 =?utf-8?B?dWtMa3NtWGRQUVVUa3NkMmttQm1LMU56eUtGNE53bDBlSlo1cFUvYnovUm1V?=
 =?utf-8?B?N2NRemFtdWZCNzJnOU1JMklNWUJDN3R6RzhHcHEycUZZbGpkV1VmVGdSbEdi?=
 =?utf-8?B?cVp4U0JOaUwrckZhQ1VPTnRic0NLbzFseW0rU0xlUDhKUHZ1OG0rclZ4aVhN?=
 =?utf-8?B?VmdJaTl2c2plT0FPbkJPSEtWMHBxcko1d1N4TWNQTGpaenI0U0gyOGJwU0py?=
 =?utf-8?B?c0ZKS05PUTJyandBRXJGSWhlWDJNc3JjRkNhZlhha29OSHNLN3BzUVNmV3FP?=
 =?utf-8?B?OFNuQVJCODJlSU1nVzI5TS9nVWswa3lJdHRBVkpwaGVEM1d4blJSV3Z5Ynd2?=
 =?utf-8?B?NDBDdFEvSW4zK2xCUTVpaXR3VS9ERHlIVkF6T0RQaFZQTExMUXpQVnU5alpp?=
 =?utf-8?B?d09oSU9PaTZ0M1IvejN2WmhlLzJyQW43VXArLyt3N0lRNnJYT29wbFNhZGdW?=
 =?utf-8?B?SGN3Y0YvMmhyc2RGbjNlZzFVRmlIbXhiWWg1ZnFxbERwWGhqRDFsZzhhWHJD?=
 =?utf-8?B?OFA5UU9qZ1VmUjVQWVp5dCt0K01BVHBCNEsxSnZoSXowYnltYStGZnNHM1RD?=
 =?utf-8?B?RFBmai9yZXlTYzdjUXBLSWd2bGVpSDlPYnVJUWljOGFLaTFrTnRvUHpwZDYw?=
 =?utf-8?B?czE0cUNiU1NvSnhoOFRPUURUWDltTHlIbDdpZE92KzhqNjVyd2pJMXNYOXdZ?=
 =?utf-8?B?OWpUV0NQV2lrY0UweGlvNW1UbWVDSmZtRHJBMVBDSEkrNEdGajlqNFVESUs3?=
 =?utf-8?B?bFYzaW5qWE5hMm8xUytUMWEyZVFGZFArYkVZaUczVGF1K3JabEk1b1RIbkVV?=
 =?utf-8?B?RDJpcU5NNm5LZW9wQ1pmNStGNDhaU0tjajZ4VmZxOWtkVlFOS0U3cFVXWXo3?=
 =?utf-8?B?TENIMzBtMitVZkhWNTgvMTBMZVprZXRpOHRmQ1NEdTFXa2Fza1BFWnR3MDQw?=
 =?utf-8?B?OVpVQTJOQTFzL252QTl3S3daN1NPRnI5bFpoWTNIT2wzZUhJY0EwQlA2eDV0?=
 =?utf-8?B?ZFpnT2pwTVM4V3VTTjA0RnY5MTRNN2YvS0xVSFFmbXJWMFlRMndrbjdlWG5N?=
 =?utf-8?B?a0JIWDVodUR3Z0tTOWtRb01TeVZ2Kzh0V1JqZHlIdi9KK3k5YkpQQ2tMcE5X?=
 =?utf-8?B?VHJNdm52TThLcFE4ekx0L3I5YklyTUdjNlJFUzlEMEszcDdwcnJzelNESE5D?=
 =?utf-8?B?eVJsbkxCU2FpRXhBeHpuUy9ReXZGQ1RDSWd6LzFzVHNuWVFsN3VwTHYrM3pZ?=
 =?utf-8?B?UXdDcExPbUJ2eE1UM0NXOXpoVStTLzY4emxVUG5oYisxTVhkLzJiVkZQak9Y?=
 =?utf-8?B?TVJrbDFoUkJRMGpOUjgyRmcwTjMrNVFuaFA5TUh2bnFUTHVmQUtOeHhMdlpC?=
 =?utf-8?B?WDZZbzVwMHROUTRjaTFYUTEvUFNycHZrMVppR0EwZXF5TEVxT016aXVwV2p3?=
 =?utf-8?B?Q08zZ2RTZFpOc1NCZXdRTjR3Z2J4bGZYeEZKYWZmSE11VVVaTEV0MVI1Q1o1?=
 =?utf-8?B?bk5ydVBCamZTYWZlbHFEL3hwSldGaWVSZmdOelA0RUgrdHAwTWJFS3BESkpR?=
 =?utf-8?B?TE9NdzFLL3poR3p0S3kyaVo4STVFUE1jQWRxUlRkc3V1akhqc01WVEovUmtM?=
 =?utf-8?B?cUNEc1U5ZGgwdG94SGRaSTlteW1iamtOU1QwSGYzT0xJbmduczVvaVN1Q2dS?=
 =?utf-8?B?QjBUd3dyZmRtKzhTNzFlYUxyekttdzV1RkE5QU0wRnVtOGEyWGJUTHRadGFT?=
 =?utf-8?B?TEh5cVpld2M2ZUFibnpnbjhrWGhlQi9JSW13Q0h5RHJ4Qk85S3Rkd1Axb3l5?=
 =?utf-8?B?aG9WcmV0bjZkb2JmcUNjMVZmMnVQREV6VFBjZCtvYkVBS1F5T0R0Y0VVNTRa?=
 =?utf-8?Q?NJrkvY5VESK3Ai9aTUN8Gz2kd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e836767-b030-463b-df1c-08de20c2fe31
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 01:38:19.3294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PVPLey8hNn2WmybrT2mEsFJ6Lible4q/q1kGksxS7JSoyBWjzB3AygS3UPRZdzpNT9hQO+DHMCrC5smgVonXDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
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

PiBGcm9tOiBXaW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDExLCAyMDI1IDk6MDUgQU0NCj4gKw0KPiArCS8qDQo+
ICsJICogQXMgdGhlIGhpZ2hlciBWRklPIGxheWVycyBhcmUgaG9sZGluZyBsb2NrcyBhY3Jvc3Mg
cmVzZXQgYW5kIHVzaW5nDQo+ICsJICogdGhvc2Ugc2FtZSBsb2NrcyB3aXRoIHRoZSBtbV9sb2Nr
IHdlIG5lZWQgdG8gcHJldmVudCBBQkJBDQo+IGRlYWRsb2NrDQo+ICsJICogd2l0aCB0aGUgc3Rh
dGVfbXV0ZXggYW5kIG1tX2xvY2suDQo+ICsJICogSW4gY2FzZSB0aGUgc3RhdGVfbXV0ZXggd2Fz
IHRha2VuIGFscmVhZHkgd2UgZGVmZXIgdGhlIGNsZWFudXANCj4gd29yaw0KPiArCSAqIHRvIHRo
ZSB1bmxvY2sgZmxvdyBvZiB0aGUgb3RoZXIgcnVubmluZyBjb250ZXh0Lg0KPiArCSAqLw0KPiAr
CXNwaW5fbG9jaygmeGVfdmRldi0+cmVzZXRfbG9jayk7DQo+ICsJeGVfdmRldi0+ZGVmZXJyZWRf
cmVzZXQgPSB0cnVlOw0KPiArCWlmICghbXV0ZXhfdHJ5bG9jaygmeGVfdmRldi0+c3RhdGVfbXV0
ZXgpKSB7DQo+ICsJCXNwaW5fdW5sb2NrKCZ4ZV92ZGV2LT5yZXNldF9sb2NrKTsNCj4gKwkJcmV0
dXJuOw0KPiArCX0NCj4gKwlzcGluX3VubG9jaygmeGVfdmRldi0+cmVzZXRfbG9jayk7DQo+ICsJ
eGVfdmZpb19wY2lfc3RhdGVfbXV0ZXhfdW5sb2NrKHhlX3ZkZXYpOw0KPiArDQo+ICsJeGVfdmZp
b19wY2lfcmVzZXQoeGVfdmRldik7DQo+ICt9DQoNCkphc29uIHN1Z2dlc3RlZCB0byBkbyB0aGlz
IGluIHRoZSBjb3JlIGdpdmVuIGl0J3MgY29tbW9uIFsxXS4NCg0KSWYgeW91IGRpc2FncmVlLCB0
aGVuIHBsZWFzZSByYWlzZSBpdCBhbmQgZ2V0IGNvbnNlbnN1cyBpbiB0aGF0IHRocmVhZA0KaW5z
dGVhZCBvZiBydXNoaW5nIHRvIHBvc3QgYSBuZXcgdmVyc2lvbi4uLg0KDQpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMTA4MDA0NzU0LkdEMTg1OTE3OEB6aWVwZS5jYS8NCg==
