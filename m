Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED5C4A34C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08AD10E4CD;
	Tue, 11 Nov 2025 01:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPqOp/rX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466610E4D3;
 Tue, 11 Nov 2025 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823204; x=1794359204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zUX0JwTjSgSHRnQfI5pU2REeR1bplB1QTosyGH2RgQI=;
 b=ZPqOp/rXG+ew7GhMypcEOaACk3sBJjoDk21/65SYvspjRtjchp87h1X8
 95I9HNtQi1XH+9kXcW9IhBVqsYduVWNOF79wUaLpTQKWYpkgy5aYMIRXG
 rf8hYF0692ym0VOvwR/z3Jj6r8hu+EJLBvu4pJkWmpRvKAvQS3FYI1/E2
 U4S2pTVG3MltMUgLXWOdFRLBd8D45t2ucc9352ZxwnhOlH7mOa2+Z1OCT
 13dx0ZmDLzZtRvuoBG9TlTMd06CYbumGUxcxrL2WpiDRh5tbX3seL3lMj
 0dp6FtLjMNfjt+g2yL/Zwczg7gYc3dtp/ePROxb90itItuBMFCnMvlWEu Q==;
X-CSE-ConnectionGUID: uc4hESUTQ5agjkGYQ+XOWw==
X-CSE-MsgGUID: HAjw9bcKSdmyBCAtvPw/YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82277660"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="82277660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:43 -0800
X-CSE-ConnectionGUID: p5bSP+FKRFCDs3zyAbHN2g==
X-CSE-MsgGUID: Uhmhl3e2RRO0FVT3gT3Ljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188657287"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4isV9a/bulXOMoLhZHbMK5T6CVPkwqQFdUOrVoX+GhKjhWHYukIim08BRsPmFvs1Qo0eYzwXZ8Gt7DaOBAlDt1rU2BNRJwO8f4OmTsMc17EIUDnqBzc89RvTHv2AphIvqVrIxJdFs5aklpQPOFYoz6IkU1WSGpSjJfXozJJeL/L59qATE5f21sdydtWTj6tkD+YCQg+7H3QuwgQLda/bBlUloUi2n4c56cSpMp3iPu0H/piqNyWEwBIS3jejlD+BjcFPIIU7W18kkLy4TdGJjM/G47FdlOE4GlI81TVr+lepoP6RgDGSH+SpXNcXmGpcQ3mO3Hg/ZIJDOnB0XkIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S4ZxT1O0JJ3L7xBORv5XkxkwjYX5WS+FqrwCqRDquo=;
 b=ihyPbS3rbHR6iqkAFeijMwpUKP2p+3uZlB1OUjzSKVo0wSFCVddeBpT7Ps6ctQV7u57iL/3V9IHGuIur1b3GgW3PRPrdXFp+5FRKWmpv2U6fnx9s9InmLXpzhzRmARScn7peiLsrnpflMBLf8QJVX/rJEziLyBsdJmKEayTPq0FUw/M2VQMTjxnypzwEbemJGZvSuceKsLTQ5Y9hcqJPdSLjqYfx7zf4xExXPTa+Pd48ACD2oLj21CcRKtFVYfaRXbsXMkf5z4AxLKElG/UOXmet7veDfcdNRkI/OhP/F0tKl6mTHBV5/c1sejgrnMEOc+CRd9Xq+jPnLqNweEhdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:39 +0000
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
Subject: [PATCH v5 22/28] drm/xe/pf: Handle VRAM migration data as part of PF
 control
Date: Tue, 11 Nov 2025 02:04:33 +0100
Message-ID: <20251111010439.347045-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: a9eb6c75-6742-422c-4ab5-08de20be91ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cURXdFdiczV6WjJPaWpnazNjZWN3OEMyMUtpcFVQRFZUdGdIdEx4clBqeTNi?=
 =?utf-8?B?TXd1NUhtRFlCZ0JLVTBScVYyQnlzMm81NVpKcUpFRXdKQU1jL21qTnlKbUpm?=
 =?utf-8?B?Q051V1NEaTUvajcyMUpZcjh2Q3pNa1BiWTQxdWo5WFIwVWxkSHI2dWR6eUVp?=
 =?utf-8?B?bFFZQlgwRVpUandkVklGZzlPRVg4MVo3Z3dFMmxJTVNGZ01nU3g0RGN4QjhB?=
 =?utf-8?B?QkFLQ3BFNFNKVHR1MndPK05iOWM0QURIdEVPT0xkVy9WWWdZZUNvV2dCUHRn?=
 =?utf-8?B?QzFBRk11bnNhSTFaVkordWJDVDYrYmgvQnExUVhhaXN1MzYyelo0WjlLdkFl?=
 =?utf-8?B?M1VMNGZzdjdORTlUblErQzVxV1JBZGZRK2RrVThtdERhdVc0NHFER0YycDE0?=
 =?utf-8?B?ODdtRFVnSFZFZFJUdmxMK1FJYkc5bmJ4dmVMNWpJcmdSR1g0U1FIVXovejc4?=
 =?utf-8?B?T092cndVRXNkeGw0bkdoSXJzVEVRaFVGVnduMk4zb0RGZjFaU0MzNUhDeDVE?=
 =?utf-8?B?M0hmbHNyY3RlK0lZZWpGODc1WXhmVkZxaUMwNVBVUHExeU1PMXVzNWd1NDBC?=
 =?utf-8?B?UzVkQThmNGZUYm9LTzk5SWMrSXZlczdEeDN1YjdxWXdUVCtNMk5wTEkzdlZy?=
 =?utf-8?B?OHMxclpJQ1g1MkVaMlNEcWdXVXJES0lMekt0aitEWlBQODA0eS9SMzZKZ0U4?=
 =?utf-8?B?anRyTzZ4WU1ncDJPVkJ3YWtJNWFsU1FIcjk1SWtWUWVTNk9VNjV5ZTZ5RFRx?=
 =?utf-8?B?RjFTNUVmSVRuSDU2SVhydVJ4TmhITzhvTitDdjVmaDBCSDkyUVl6Ymx0dy8y?=
 =?utf-8?B?czF2SE9JVXBSMk83RUk4Z1kxa041bFRGR3ZJT01XbnQzb0p5UGhJVVNSWnBx?=
 =?utf-8?B?Zi9BNk1BOXlhMUNuNjdnRS9TVXo4YVhsaHFWb2E0NlNRblgrSTNMN1ovVjRG?=
 =?utf-8?B?RnRQN2pLank3WmhtR1Q3N2prcFFqTGYwTUZqL3RrT1paa09meVArKy81bERS?=
 =?utf-8?B?VHFNVk8za3I3SklLdVczS2ZYTVRXL3FHMUs2VVZWQU56VUQ5cW5CeWJFOFhC?=
 =?utf-8?B?S3N4eTc1Y0tQc1pTNnU1cWw4M3ZPWDFRem54YmU0aEVGUTFqM0hieFl1NDJV?=
 =?utf-8?B?QmdvMjcwN0duVm5PYzFMNm9LdkJuamo4ZFNyeXVaVzA0QkpNWitXUlJIU1dK?=
 =?utf-8?B?QVN4ZVNjK1JUQUd2ZTV3M0FucFJjbW4rQlNrbFpSN1ExUS83Um1lbFVXTFpj?=
 =?utf-8?B?K0QzR3VFdGQ5YkRwL3UySlJQRC9PRmF2NWhqZElVTHVVNHdLWmtMdUtOSXlp?=
 =?utf-8?B?NUJaSkRJVjlhTnVRcG8vYk92aTFxMHl5R1pPa1oycDJDQVh0ZkZ4K3E5Z1JF?=
 =?utf-8?B?eUg3SzBTSDJxa1YrTDlIZ1ROZ01aMU9HeldOa2hKRHAyNzR4NkNXNTR0Yk4x?=
 =?utf-8?B?N2FkR2RuRzBoUVdRd2RIY1I0aU5lcmw5NVcrdE5KdWJkZGlWUEZOeUY1eWtq?=
 =?utf-8?B?disrNEhEeDVoakh1MmdFanJ0U1dCL3VMejNLQVdsZkJPMEdSZmdNTEZuMExF?=
 =?utf-8?B?bjlnZEIwYmQ2SFVjc01RS1k5cVVDSVp6L2c5MWJTejZiZCtQamFPOXpZSUpJ?=
 =?utf-8?B?SVYydFI1aUFKMzJURmo3bEppRlRuMWxSUkF0b3dpZlNEWXFiUnZhLzhESklo?=
 =?utf-8?B?TGpvMXRWZFRxMmFmQ0RWSVBZZXlRN0VJa09LTzcvcmsydVZWMDlMdXVoWHZS?=
 =?utf-8?B?Yi9FMUE0eGVBYXpPY1NHN2l2elNBSWtpdkdVRVl6MUt2Zi9kc0M3VHFXemZs?=
 =?utf-8?B?K3U5R0VXMlJuNForZkd4NnZiMkZvTmMzRGR2djArN2hVNk51b1ErUlpEVXVx?=
 =?utf-8?B?aEMyTFIycTJzamt1bVVsakVNeGhVM0ZpRUdOR0pQN0ZTUlByU0RsSG5NU3lT?=
 =?utf-8?B?TndkaHNMZnhEM0lzZXNZcVVqRnJUUGxXMTJDM1ZuUWl6S213TGlOMHAxaTdD?=
 =?utf-8?Q?rehHu+uH1xLAVdWOmA8hEF0Z+qNoLU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXB3ejhjKzkvQk1EZ0FVNlBvclJPM0tsV3FSdlRHTlVtMCsyK1RkbjBMVFpB?=
 =?utf-8?B?bVFZbDQzN2VFME0wcGwxZmcvNnZRM0tQR0pzZUtoMHNoVkNhaEVqTUgvb1U2?=
 =?utf-8?B?Rkh3M0FGNHlwNmNhUlhBMzNlUjJhbmw0SVRQbzN4NEExQUkvcWJYNm9maDJJ?=
 =?utf-8?B?TlhaaDBIZ2pCUFFuZmN4Qlhrc0FvWVFaUmYyQ2wzMWpTaFhhZGI3MWN3OVpL?=
 =?utf-8?B?MzdVRVRnNHVOU3BoMzBoZDhtQW9tZGVNS1hjUEV6K2JmY0dkQzhBTzVab2Za?=
 =?utf-8?B?cGROSjRqMmpIcytCVkZ5WnZCY1R1YkhyTDVOODQwSm1FQ3piTFl4V21ET082?=
 =?utf-8?B?T1Q4N3hCd1NtMG4xRUE1cE5sT2tXV211MmN4dVR0WDM5QldyZW9UUk15NjBv?=
 =?utf-8?B?akRsdHQ3dTdUdEhsaVNiRW5wdlVvUCsvSkR3bG5vYUhTbzdXaFR5Vmo0ckkw?=
 =?utf-8?B?T1JPNVR6eG9VV1VTemkxby9ydnY5VnVNdzVUMFhoczJGMERwRCtiRGprUUJj?=
 =?utf-8?B?M0NOcnlyTDE1NkFzQldQQ2NtVS9DemthbFdlV0NuK2NVNVViR1d5dWJ1dG05?=
 =?utf-8?B?eHVSYU83ZnpEblhpNlBUTnZPUkF2bUtKSnUrUjZBRXV3RnlnUTFaUi9JNWhJ?=
 =?utf-8?B?S0tNMkc2NVZUb3BQZDRBWERJVHlIT2ROY0E1MlRHbXBiWG1sNHNVQi8zTU1q?=
 =?utf-8?B?UDRzWDl6THpydUpjZ1VrNHdKVUpqaDBOcDhpU1loZy8vMWJzQjFCZFRPdFFG?=
 =?utf-8?B?c215c3RMa1RQNDAxSjZEZXl5UklzVVA0UXVIVmxKSElJempNcWNxVUpwS2Vq?=
 =?utf-8?B?UWRBbm9rWVh6L1Z0dmRFdkxLVzZtNnVCRmlJbmFiYThNNDVIbDBOU0xGWFBU?=
 =?utf-8?B?ZWxmZy96Skduc2dMZWpZNFZCTk1xOU1ZL0JBM3JVb2VMbmFJL0JiNHNrRzFK?=
 =?utf-8?B?ZWtReXF0enpDU0w5NXRJMWkwTU5SQVBjd2VneFZ0OHgyRkVTM2Y5d0lGRkVY?=
 =?utf-8?B?cER3MHNxUnJrK3RzdUZORGhhRFpzc0tTTkgxaVUweVZkbEJ5VndTRjk5MzlF?=
 =?utf-8?B?T1J3d2tKUEZaUEZyRWdDdnFCR3gyNXF2UnJtRHd5WC9RV2V1V3Qxd3pTdEpF?=
 =?utf-8?B?cGZlV1JYMGxINUdnYXZOR0pBczRUclR3LzUvZU1BT2dDTVJ2TUwzeWQ2bFVV?=
 =?utf-8?B?bDcrOGxHd0RoTzdjR1A1ZVYyMlZrai8wZ0VqNGpqNzBHRUNLSU9RTjRacVBq?=
 =?utf-8?B?N1k4amV3d3o0RGNLRG1jQ1dXYWs0dmEybkhUV0VnZGtYMzl2VEwvVXNJTzJW?=
 =?utf-8?B?N0pNL0ptMnBQU205ZXRBbnppY0hVblcyT3E5K29UbGpiandJRDJYdUhuT1d0?=
 =?utf-8?B?WmtabldjVUE5N2Y2N3JDN0p3d0U5N1gwQmZXLzlRbkp1clNtTS9rRHhJRExG?=
 =?utf-8?B?bVM4UFMxZEJOeWVPN21UajNPTjdPS0tyMngxbHExWEExQ01JaEdLWmt2Qmww?=
 =?utf-8?B?L2NOYzlVZ0RCalBOaTFZalFSdGhMSnlBZkxEbGdkSys3TXJsK3JGWmRCcVQ2?=
 =?utf-8?B?amJFZWFVbUxDbGtPazdYbjNEa3VZNGI5UEthRlhOell0NFpwUlRMOVFiRGlq?=
 =?utf-8?B?bUVsUHNZNVJ5T1RsOHltMlZ6aEZ3SjErcjU4ckVNODd4MXR4ZmFxaTNJVFpn?=
 =?utf-8?B?cTdDZzE4MjVJSllGQnlMTGloRTQyMkpVU00xM09YTi9rQTB1eWgzM0JZWGd6?=
 =?utf-8?B?U2Q2dEZUcWRCbDdrdnRPT3NYdnNlallQTzI2MWZ1WVpBcndKRlB2UG1XNlNB?=
 =?utf-8?B?YUN0SVVva2Rad1ZEMGpzRzRQcFNjNHdWZ09FRm41ZFZZcHNrMXllaUUzZGs3?=
 =?utf-8?B?RGFaMTRzbmpqNHZQb1hqK1ZIRm03UzBXUldLRHQ3ZW5xVi9WZm1CaitzZTNQ?=
 =?utf-8?B?Q1pGWHVIQ0J2c096L1V1NVV2UWRrdmJHVUxqSUlRR0tyem12VFNSZENzQytE?=
 =?utf-8?B?YlFLa1FqVEc5UFJqbkRhU0YxNFdxVXg3NTZKblR1RUpvYlAyWXU4aVhYcERq?=
 =?utf-8?B?Qk5xVkFtRVpEam5vMTVrMFdleUNxRVVKOGRQS2RlSDRPeWhDTnFUR0tvWDFk?=
 =?utf-8?B?dE9qZjlDOG9DbGpyalhrZXc4dXFDd3JnY2ZlaFpJQ05iYUVzSVVJZzE1UXIv?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eb6c75-6742-422c-4ab5-08de20be91ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:39.6626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKEOIsEcywscpHUIny97ykvPoBVH/UPOL7/5o95Z2LvWAnr8pyScMyP+yVNUzRCDp2ZSq+QFq5nfXbpmUBLQUQ6MOtCLORQyoUvtzAQSS2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

Connect the helpers to allow save and restore of VRAM migration data in
stop_copy / resume device state.

Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  17 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 211 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
 5 files changed, 236 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 25b77007767d5..bf48b05797de7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -892,6 +892,20 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_VRAM)) {
+		ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
+		if (ret == -EAGAIN)
+			return -EAGAIN;
+		else if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_VRAM);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1130,6 +1144,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_PACKET_TYPE_VRAM:
+		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
+		break;
 	default:
 		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n",
 				   vfid, data->hdr.type);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 31c7f207ac5bd..6ad948e96fd45 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -19,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
@@ -502,6 +503,205 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
 }
 
+static ssize_t pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
+}
+
+static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
+						struct xe_bo *vram, u64 vram_offset,
+						struct xe_bo *sysmem, u64 sysmem_offset,
+						size_t size, bool save)
+{
+	struct dma_fence *ret = NULL;
+	struct drm_exec exec;
+	int err;
+
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+
+		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+	}
+
+	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
+					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
+
+err:
+	drm_exec_fini(&exec);
+
+	return ret;
+}
+
+#define PF_VRAM_SAVE_RESTORE_TIMEOUT (5 * HZ)
+static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
+			      struct xe_bo *src_vram, u64 src_vram_offset,
+			      size_t size)
+{
+	struct xe_sriov_packet *data;
+	struct dma_fence *fence;
+	int ret;
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_VRAM, src_vram_offset,
+				   size);
+	if (ret)
+		goto fail;
+
+	fence = __pf_save_restore_vram(gt, vfid,
+				       src_vram, src_vram_offset,
+				       data->bo, 0, size, true);
+
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto fail;
+	}
+
+	pf_dump_mig_data(gt, vfid, data, "VRAM data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	return ret;
+}
+
+#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
+static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	loff_t *offset = &migration->save.vram_offset;
+	struct xe_bo *vram;
+	size_t vram_size, chunk_size;
+	int ret;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	vram_size = xe_bo_size(vram);
+
+	xe_gt_assert(gt, *offset < vram_size);
+
+	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
+
+	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
+	if (ret)
+		goto fail;
+
+	*offset += chunk_size;
+
+	xe_bo_put(vram);
+
+	if (*offset < vram_size)
+		return -EAGAIN;
+
+	return 0;
+
+fail:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	u64 end = data->hdr.offset + data->hdr.size;
+	struct dma_fence *fence;
+	struct xe_bo *vram;
+	size_t size;
+	int ret = 0;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	size = xe_bo_size(vram);
+
+	if (end > size || end < data->hdr.size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	pf_dump_mig_data(gt, vfid, data, "VRAM data restore");
+
+	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
+				       data->bo, 0, data->hdr.size, false);
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto err;
+	}
+
+	return 0;
+err:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_vram_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_vram_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -541,6 +741,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_packet_hdr);
 	total += size;
 
+	size = pf_migration_vram_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -603,6 +810,7 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
 
 	migration->save.data_remaining = 0;
+	migration->save.vram_offset = 0;
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
@@ -612,6 +820,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_MMIO);
+
+	if (pf_migration_vram_size(gt, vfid) > 0)
+		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_VRAM);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 04b3ed0d2aa23..181207a637b93 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -25,6 +25,9 @@ int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9f24878690d9c..f50c64241e9c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -20,6 +20,8 @@ struct xe_gt_sriov_migration_data {
 	struct {
 		/** @save.data_remaining: bitmap of migration types that need to be saved */
 		unsigned long data_remaining;
+		/** @save.vram_offset: last saved offset within VRAM, used for chunked VRAM save */
+		loff_t vram_offset;
 	} save;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 7789d9e1409c9..86668bd4213e0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
@@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 		return ret;
 
 	for_each_gt(gt, xe, id) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
+
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
 			return ret;
-- 
2.51.2

