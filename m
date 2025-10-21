Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFCABF919F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4876410E66D;
	Tue, 21 Oct 2025 22:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKNWtlDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4382C10E66E;
 Tue, 21 Oct 2025 22:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086678; x=1792622678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Zt9w8Ks0MiMzY3yLjKIqgK6igZomHP7FAX2v6vELY/4=;
 b=CKNWtlDRW+hBKh7Nz17++6/jl2cHwR44XdkqqEI60IJA7eosN0ygI4Qg
 4qDk1AQCjEsDsm9antp7I9bi5AKZaRIW/gc3XPTs4yLTpigaxmsLo6Fwq
 OvggwfMp7TjynTbNn4bsg5HCTgu8cdbtTA54+xkhiwxuLfWS8MBtEExza
 c1nPsukPGmO9Qn5VtiV7XescdKCCiM+68TWzY9vr47VEnwDlv4k+dSBZF
 ecrxAaD3j9cGObI52oEoy6KE8i1mvKzHKlv1mQpvpJaLB7f+RMXomDmGT
 O/vqZCBOuBegbOrqkJgwbW9FjU2CPBJjAsmffIwAiTZ+G9UUsEDy4iv8S g==;
X-CSE-ConnectionGUID: I1ZGGKaFSmWfXbJls49H1Q==
X-CSE-MsgGUID: BMCmdJtfRyua4XJBb+c8qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62255885"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62255885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:38 -0700
X-CSE-ConnectionGUID: lnPs5sdOSIm81fmPa7IX8A==
X-CSE-MsgGUID: S042ZRE2TfapxKwxkVN6+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345881"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:44:37 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0z+TmXqD6b4YnI5DltBWtY/kXDJynQ6R7zbOs3Iw1q2QdSsfxFMFBlapO7RIFLoSzrLD98jeAa9knL87oJZ9BbNQ4VOrj51rEZBG0TsJ3a+TWqN4+O0Orkj6JB2jAn2RaPmrf3NAZwqHTH7qJhjka1Oa+ySE26U+lTCV5bNmAscCk99ZufsfHCUpIABL7L1XO8TudBkaXvX3HW6NaixM08WgSt/7cDHM1Y7FFHTuDf6W1yAMYLbgs1HzvnciPOdmCiw2OTGjqI8td4jpgYw93mVeV+27+FNJqWLqOYe5VjNOvZ6LAxQhAGkl8rbG/Ccy584nZXddI1sxKvXeab1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaD1CFdLzRkCtfQcsLU1gLDkWmKYfOqk/ZRme1pjjJk=;
 b=bjEalYzNR6gpRd6Y85awBJTJeTKX13eYVkYbGbVDApoJKkyBJ+oOyocYsORZpAibdVt7bAt0CpaIbqkIMjRK62hEVnIIb0TTr6dBhHL7TY1s6W2aDD+6mPFjjwYu0lyn4dTtcLfixULWc47rMW4ovwGvvCzPKC/CQOqvO3lHuoxOswjhGPy/XbkT66zXz51l4NL3Jnb6lP6Lb2NtP3RI2bHVIdQwEgllNk/nB9gatcYbqlbf44x6tl2BAeuqtNswDlyWWhzpMNV04SGVJPCSlFRRxHk3Vl/NzgXYWq9JnDWH4mWTywO540UoTOM6bhwNiWarzIRU+RNL1Cy3ug3vcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:44:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:44:34 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 25/26] drm/xe/pf: Export helpers for VFIO
Date: Wed, 22 Oct 2025 00:41:32 +0200
Message-ID: <20251021224133.577765-26-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 1663d28d-f201-4bca-053e-08de10f3684f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDhYZDMyWXp5bjZTVmU0OUZGY0ozcTJhUm9BWlRQZURTM1pwQ0hJZmJiTDB3?=
 =?utf-8?B?eVV3WWlxNmtHdlRIOXRnTDUwUDZ3NHNJbGF3VGdmOVJoek1sbkU1VE0vN0k2?=
 =?utf-8?B?YjIwcW40akoxNytRdERjcWRvcm9zMFZWbzlON3JiRjVaQUljMkFkbS9seThL?=
 =?utf-8?B?ZEorSDhyTTlzY3NuMGtBOGx4TXpybWF1eWRyaGNxajFlQy82dHQ1Z3pkd1FF?=
 =?utf-8?B?R2R0WDVOdGQxMi9hTFZDM2hOT0ljYi94Wm1YUk0rL09jOTZpSis0TnhkREx6?=
 =?utf-8?B?SUNzNFJONy8rbm9QVDlyT1JyNm1sTVJvZU1vOHRpTnh1czlWcTBxTWNHUkNR?=
 =?utf-8?B?TTZtWFR0Ni84bi9ZeGhzQjIrWWYwQ3Z0ZWowS2ExUkpqZ1p2ckNTSnlHYWtO?=
 =?utf-8?B?QzA4Ym91N2pZOGxLc01tR2E2QlZEa3labUJ3aTR3S3BHb2Yxbzcva0lsMmts?=
 =?utf-8?B?L1h3RUptRW5KMm1RM3NyR1NadnJucC9rU0RmZS9MdWt0NGxWSXdhK0FXUXRn?=
 =?utf-8?B?cy9jTTMwdWRCam1WQUV1Yk11dkQwUTBVeEx1MWdvdjUxQ2xBeHQxQUdtQXR6?=
 =?utf-8?B?TWpGSEhRT084YXpGaG9teGFsc3FTb0QrWUQ3ZHRKQ3NGR0Q1Z0tLaFlGbnFZ?=
 =?utf-8?B?c1UwQ1oyZ0xZZzZvU2k2bGF1YkVhNnJEQ242bThnbU11R2ZzbHpkYzV0ZHVs?=
 =?utf-8?B?Z2dlY2YxVmVQZ05iVzdNT05WNEFWdzNkTFdGSytjWU9mYk1oNVB3UWxhbkVx?=
 =?utf-8?B?NnIyWmdYU1Mxb213dEpMN1lQU25HcSt1UGNjZFZ0N0hHTlJBbEoxNGhJVU9k?=
 =?utf-8?B?a281T1k4VVhNWjZCOTRIWUEyUHNVbEZEdTRiakhuMHVWN0svNzFRclRtdS95?=
 =?utf-8?B?cVNJYldkN1JKQjltTjJQbEFJS2FxNHk1TXJvRkNNcURkQ0hHbW1IR080OWNm?=
 =?utf-8?B?TlNYMHIzU21Pc2RydnkvWmxlM0xQOTFkeU84TWFzaWxvM0s1aGZId3BWaVRh?=
 =?utf-8?B?emNRT0lTVW9aQzVUSEZrdFJOanE4aCszNCtRZ1ZWZnhZQXRjMi9Fb3AyWWp6?=
 =?utf-8?B?Mys3LzFqd2x6TGI5dElsV1daczM4bUpwRjNMSjZNMFlxQUVaSC94WmJNMUNt?=
 =?utf-8?B?Yk81aGJYTzNtUG40bFljRFNQZVVNS3BuM3U1N2t6T3A1N2UxRmI1dms3bTdh?=
 =?utf-8?B?YS83Nis3T1k3WTRUMDRtY2lqUmxSb0RVSGpPNjZuNmdBeHY2ZC8vRWdjeTdD?=
 =?utf-8?B?K2kvdmtsaGpJN3UvZzFoVkxZcFZ3K3BOYnR0TGIxYjAxRnNWbFlhLzJmOWQ2?=
 =?utf-8?B?K0Mwa2lZZGNUZU5IdUo3N0lnWlU4MnRnWE8vbjE1SUMyaEp2allyQjJ2QnA3?=
 =?utf-8?B?K1greVVoeGcyMVJMeDkxY1IyMWVpOHQ5TUdGR3FjbHdzVmR1U3djS3VKZnZW?=
 =?utf-8?B?ZXRoL016WEhiMG1pbXdDT0JZdG5UTGhVdDRQK2JNRU53QjZDTmYzdlFhRng2?=
 =?utf-8?B?bjhZYVN4NU95b3RSclRLSG54RUNVUUN6cC9aMXlHOXd1UVJFbVFrM1RoeUp3?=
 =?utf-8?B?KzlBcjM1Z2ZPd1VweG05NFN2MWZrdnUzWWl2WTBRc2pUdjZ1dWNMR05jV25D?=
 =?utf-8?B?b3N0MkhsdEhPYURnekl5dUZWZHVoQ0xJdU50aHhWMStaRTQySnkwZ2dYNjl0?=
 =?utf-8?B?d0dUNkVINjM4bkNpZWxOamlwY1BneElIZERMSVk4MnlkZy9PaGxCU1V6VmZ3?=
 =?utf-8?B?dzE4bHpLWEswQ2tkTU1LRmhGOUFvVWhFbUtMc3BaUFhSNW8rK2RFeHRmcmtt?=
 =?utf-8?B?bWQ2Rzl3YUdkVEx4RjJUVVJLeTFkM3U1QkVlayt4MUNCVGh1a0xDejZKOUYw?=
 =?utf-8?B?ZERVNWk3SzQ2eXFZUk9WR0Z6M0tvekhwZld1Zi9mWlBlcEtEUHV1a2crUG4x?=
 =?utf-8?B?bnBFbUg5V2ZjMXI4ZEJ2aVNoMVJIejUvbW5SVThka0RPalRubnFJdnNUcDdj?=
 =?utf-8?Q?/0Tv6ziDt6idqrfz6kf8W1+rU+9ZrE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW9abUplVjVGenFTSXZFcGJOUWhNVkNoeU9hVW9uSnhReFJKZ241dHB3c3hB?=
 =?utf-8?B?OXRjSEdOWEw0djR4NUFGRlRrcE9EMXQySGpLYUttRGU4SkVrZHZLcWhHK3Ay?=
 =?utf-8?B?d25jTUQxTVB1WWNmcldXSm0yVkdnaHlzV3ZFMmEwR1ZRZEFCT2EzOUUrYUxl?=
 =?utf-8?B?b0dZWlJxUDJxM3dnSDVTZ2NjUkhvMmllVSt6cUUvVmNSbHVYMEoxOG8rbUdB?=
 =?utf-8?B?aWgxTk5nVzFkdGhhdC8za0x0a05abUkzOEl0eWxWZXFtZlREYkhDMVZmeWF2?=
 =?utf-8?B?Qzd5TFJBblFkQWF1SGt5dmgwVHJlODVEaSt0N2J0QnMrbHhSN1p3eUZyeTN4?=
 =?utf-8?B?MFY5TEMxOUx3RTRuMnozYW5ZYks4R08yWVAyaEw2cS9ROER5cEdGaXZMcGVT?=
 =?utf-8?B?bUVGQ2VLbGZ1M0l2L050cTBRbTFJQ0J1bTdaSlZodHlvWnB1ZWxBQTNLRnZ4?=
 =?utf-8?B?SVJhVFZWQUdGMlJrZnhHOWNJNFN5VGlYdWdvbFFYTk54SUY2c09yQVJnZFFn?=
 =?utf-8?B?OThHc2pLSmlZbGcwbFp4dmdYT2diVi9qSElDaGJwZlk3VUdmN2huMGVUOEly?=
 =?utf-8?B?aENHVVJIYkc1dSs1Ry9FZUpCUkF5MVlRVHdacWowSTRWcFhmU1dUK2tISVE1?=
 =?utf-8?B?aVFXL0pacDRBbTg3VlB1NWd0OUtZcmlJL1FuZGZIb1p1eitRKzFLakE4N3FS?=
 =?utf-8?B?NUMvd3hDTlF3K1B5cHRJaXA0aDlZbWJmdENJTlRmaFU2Q09aTWdsM25seSta?=
 =?utf-8?B?NFhWN3dZeEhkUTgrWXloMUE0TFMwRENNZ3luVWwxWFVvRS9zZndjd2NNek1C?=
 =?utf-8?B?Q2E1TXFjWFhrTG5OOW1UNm9mZmg0cFJNU0U3SWM3bHZFWTh2TllOUjV4bG94?=
 =?utf-8?B?NzVDU04yK1JUUmh5U0l3QVJQUUszV0pQeFdrc0NTWFpRL0dGSmxoL1JZSTVO?=
 =?utf-8?B?bHUwSXZjV0V0bGFJSGUyc2QrM1NqbFZrNWpkb0pQbng5bkY4RkNpWEU2dC9k?=
 =?utf-8?B?Q0VjTldLVXU3UjhqYjAwTkVzOXhWcDROZnN3UVN6ZkVvT21pdkJKUk03N2NB?=
 =?utf-8?B?RGl6UmhRTWdJRlNZQXZyS1NqYzROVUl2UDIvN2tMY3NydkZDWndiUjk1UmRk?=
 =?utf-8?B?eEZxUHB6QS8xOC9USmg2SFN3ZTBVdTl0akhRL3VKVlFQbS9ISHZTVTFVMnpE?=
 =?utf-8?B?cjdUWHhNUFRCUW5XNGlxWjhxYlRCbDB3WXBreDkyOFhIVEZkdFFMdjFkWnFh?=
 =?utf-8?B?c0JxbXh6OU9CQ3ZMeWlmMmxvSG9NaTFLeWkycjlOUmlBQ0FqRjlaMGNweklj?=
 =?utf-8?B?ZmZLUThqb2xZVlB6eDl1SXFkUEgzQjdycUprWTBOWEIzMHlIaWpydkp3bE5i?=
 =?utf-8?B?WmE2aGtpekZjZ2VPYTQrWnJxRi9CU1R2ck5NcXovcVBXWXZGSzdYUFREMXg5?=
 =?utf-8?B?bVVld0tMKzB5R0JRNzJXcGpUdytZbDlqTGNqYThCS215dm9haHk3am1mNjc0?=
 =?utf-8?B?OVRUUDFodTg3UFdVeGMrSXFXMWNqdmppaXJpa2lERUxER0E1NTFpQm85MnNU?=
 =?utf-8?B?ZkNaNUdXSDRmQXF5SElBYzVmbjA5SzJlVWwyZ1AwSU51YlltaGtHWTZLVDFT?=
 =?utf-8?B?aDVvT1IyNWE1NW1iSkJJTHdVY0NGSzFseWgwN0s4b0RaNnlVSFlyVTBqRDZC?=
 =?utf-8?B?b2FiMm1IaXAzZld1R25La1NXVGZjWUNnVmJmeTNLSmU1SjcwRGNkZk1XeEFn?=
 =?utf-8?B?TXRNQVY1MHBwNS9xQkZhQ29nQUZtbjJQN1FSbmd5YS9qZHJIM3RrR0dKaEtF?=
 =?utf-8?B?UUtLc3lXTVRIeW8xNlkvUXVSYlhvUkp2bW1aRjhzRmprL2ZSbkN5UzZlM2Fl?=
 =?utf-8?B?ejJrQ1M3NXJ6djkwU3ZZdHJzcGF5c0hrSTRWSkx1MEEwMW93cHBLUmlDb0hu?=
 =?utf-8?B?NHl3NGF2T1hJa3krcTdsbzZ4Q0dUOHlZVmQyZDVBWDFyaXJHdUR5UTVKZnYr?=
 =?utf-8?B?bnhYL1ZZSmpYOGtuU3o3UU1md1U4UEhxdnUwL2JaTFpNbEFYb2J2d3NhQVha?=
 =?utf-8?B?UUtTVWtMVVhBVUZyTDBaK1ZldTZ5eExBbmovU2xQR1Fzb1p1dWdOQWdCeFFs?=
 =?utf-8?B?cjVYalZ4MXp0SWFVMnVQbTMwcDh4N0lBVTd0RVBvdXkzM1hvZnpNYkhOOXli?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1663d28d-f201-4bca-053e-08de10f3684f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:44:34.7836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpXCkHQeN7qPpJQWWeGGZLvJAw8qufSn7pXiHBhYAYOsSztACD3u61ktjksJafS8hCLcFT8rTP4bxfHtF4U9stBBx/ZNIKfqQPATG+1FwtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

Vendor-specific VFIO driver for Xe will implement VF migration.
Export everything that's needed for migration ops.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   2 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 296 +++++++++++++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h  |  28 +++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3d72db9e528e4..de3778f51ce7e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -182,6 +182,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_service.o \
 	xe_tile_sriov_pf_debugfs.o
 
+xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
new file mode 100644
index 0000000000000..4f2a7c2b5d61c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/intel/xe_sriov_vfio.h>
+
+#include "xe_pm.h"
+#include "xe_sriov.h"
+#include "xe_sriov_migration_data.h"
+#include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+#include "xe_sriov_types.h"
+
+/**
+ * xe_sriov_vfio_migration_supported() - Check if migration is supported.
+ * @pdev: the PF &pci_dev device
+ *
+ * Return: true if migration is supported, false otherwise.
+ */
+bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	return xe_sriov_pf_migration_supported(xe);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will wait until VF FLR is processed by PF on all tiles (or
+ * until timeout occurs).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_wait_flr(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop() - Stop VF.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will pause VF on all tiles/GTs.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_pause_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_run() - Run VF.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will resume VF on all tiles.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_resume_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_run, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_enter() - Initiate a VF device migration data restore.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_exit() - Finish a VF device migration data restore.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_error() - Move VF device to error state.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Reset is needed to move it out of error state.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_stop_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_read() - Read migration data from the VF device.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
+				char __user *buf, size_t len)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_migration_data_read(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_write() - Write migration data to the VF device.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
+				 const char __user *buf, size_t len)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_migration_data_write(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
+ * @pdev: the PF &pci_dev device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_migration_size(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
new file mode 100644
index 0000000000000..cf4ef7a1cfbbe
--- /dev/null
+++ b/include/drm/intel/xe_sriov_vfio.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VFIO_H_
+#define _XE_SRIOV_VFIO_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+
+bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
+int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid);
+ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
+				char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
+				 const char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid);
+
+#endif
-- 
2.50.1

