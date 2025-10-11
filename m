Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A58BCFBC9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180A410E356;
	Sat, 11 Oct 2025 19:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnA1bT9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CC010E356;
 Sat, 11 Oct 2025 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211700; x=1791747700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Bx1ANchQRvNkE4tktjjW//f2XiJhPgZMXUDniaxMrac=;
 b=RnA1bT9T6iZYwAVNO3Wl00JsJAWlccGvyEOwc2x528SSrRGZDaeHp+CF
 I5NEIOcPL71du7Zf9x0R4MyO52snrYNHLK4VXGXZ/J9j8G9y6keZ2WTr9
 S5m15k2WgnY1+Jg2hSD1RRArZN6G9QBoWk49Zz8PTxr3pTj4hgBgl8tZk
 ee41pF3IZ9eNCrj7k0HuhCp8wxKwUW5FVPW2oX2hwq34r/lFPIOiRmV0n
 OWdh2V7akA+XD6bzI4Z0f7YccDIOXsHqah58bHnKKl4dnrH9gOCqzJ9Wz
 lMCNHquZwzabKGRJhqMx0f3X+pT8YIvYlnknkcMSLRvnmADI3fYYtSQl9 Q==;
X-CSE-ConnectionGUID: OaoGG8FNQQ6GLaR5+9FdDA==
X-CSE-MsgGUID: BQnft80VQJSu6TyMEgto+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="79840919"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="79840919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:40 -0700
X-CSE-ConnectionGUID: 6aGp+ASjQ12efBmn5qeNMw==
X-CSE-MsgGUID: 4NfTfqx/QzWUYYiMEm2NtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="218344757"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpJHw1tAd8hIcHmPFEVqxACiE5kXQSpLt1k3t3ocATY+lqNYNoS1NZ4CiwFK5jcUVF9rNoHlRAZngH1DzILuLh94GD+A4joM7rkfR11W9KmI2eRqxPhHBbPdKm9XLCIHO4c/6PbH9J0nqnk6LtmPu/5m2TiviXTXMOaUT4iDfV78ny/e+bSZN/FpThsKNuQ0hXANO7XDfSQVJLpIAz3GcUdAQEy9N++6spnJDNlfwsK5ZfT0wvHNmnARo+293bGqy9VYOWe5vjGRAWFSNAhVaF4hWkOFe/+3oQmN9e0IJ8p7J3mBbvFzRZt7tkE5ll9KFc5Gi4p0mVvutjpGbKfZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgWvwJX8Hzc5kVFLwAntcfDF06cbW/3YipkCxgt0j3Q=;
 b=zH7n2ehVc0sxveYSDRMh6XFlSpIZkbIadR3dmdgtE91JtciNCnMSE7m2q9MVl+Asa8OfkgK+9F0hlHIKDpPVFOety4PwGE3kqxnLuyW1jtMhIpJjp02MHElvX3SS3OZrBWgmGMnmAFA5sI0gDCuQu1QQpqwhCfp+ARNkwLkwzz1MziTyA2D46KMlfHdd4tH+GC+9BGeoaKYmPgT6k1ZH6VuGHy5Sd7uNXfIsY4B1cohBfz/fUQS0QVydJEhfAGQqDf0vBGUUHXywZO6NY7ZPtnrxRltlwsaT90+q0IMBj8hOMJraYpsL9BS4mkpWpB4elr+VZLgApPzfCkgLjR2axQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:36 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:36 +0000
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
Subject: [PATCH 18/26] drm/xe/pf: Handle GGTT migration data as part of PF
 control
Date: Sat, 11 Oct 2025 21:38:39 +0200
Message-ID: <20251011193847.1836454-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0077.eurprd02.prod.outlook.com
 (2603:10a6:802:14::48) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 187a44a3-3e9f-4843-be14-08de08fe309d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXl1MXNNU3U5T1d1d2E1K3hnOU9VZWN4dUp1R2tCK2xBU0tmeDJ0dXBpUGFY?=
 =?utf-8?B?RkZ0MVd6cUg4dW9QeXFyc3ZpVzdhRUN1NGVyM1BybGROY3Bwc2V4VmF1eHpa?=
 =?utf-8?B?MjhlbFJadkkwNXlLTzFnS1JLSG1XOXhKdnhBNWZzbGtQSmJkaWhyL0pzMWVC?=
 =?utf-8?B?bWdJM1BUcU01RnAvWkJ5OTJ6bThRMldjaENVVTRQdUNFMG05R0xvYks1aU44?=
 =?utf-8?B?TkhoR3dyT3A4Y21mUXVuMDJEZEo5WmgrUDNIMkxpWmpPUFROdzc5Sjc2alhU?=
 =?utf-8?B?d3NicUVEcTNNRFJSckFDcjBCOGFGWFBqTnFKM2trM0lrZFNwb0Y5MWMzUEE0?=
 =?utf-8?B?cmhjaEswUXJFZUcvcDUwdXJmOG9SZHo1SmNMUXk0aXRkVnVGMTlBSGIzcDQy?=
 =?utf-8?B?Sm4rcndKdGxaQnpNVGgwU3g0U0hNNVF6ZCtBbnQ4TGFGTzM4am1UMVVrdUZn?=
 =?utf-8?B?VlZEa1ljRU80UmJyNFUyeGhTRDlnWTNKeFlRMCtyTjMwdC9KVGRvbzdEU0Yw?=
 =?utf-8?B?dXQydmxnTW5iaEZIeUNqWlMzOFI4RSsrb2VucHp2V2tuSHVDRTE4YUZTVGx1?=
 =?utf-8?B?L2NxOENxK0NYeURTL2x4RnV2MlpYaXNHeDVxUll0UkNaWFVHN2QzUFlmUlcv?=
 =?utf-8?B?OWQ2bFNHNVlDbnpiM1VJbU5MMFBWY2djazd3UjRRN2FCcnQ4NHp0K1g4V0Ru?=
 =?utf-8?B?VnFZTFU0ZitvYXBaVjBqeVJHb0RoOHBuTDFpRnNOdkJsdFJIZ3A2L0I3MmNR?=
 =?utf-8?B?a2NiTGQ5NTVWWnlPMXlLUmZYd3R2Y1phUUJMQUVsWVl6MWVpOUtXSUpqa2R1?=
 =?utf-8?B?RjFlZ2Z0Nm05SlQxRm11K0lydk9vdW1xNkVqSm80bjIxMnZVSXVtb1dyMjUv?=
 =?utf-8?B?a0I2TVQ4WFFhT3RwODJNVnExWGNjTVlKUGRZczFIUlNwd3lTcHZxT2RpamZJ?=
 =?utf-8?B?cEpScllFZ2o3TTJ5ZGlvYmlvSXo0MVRuMTlJdkFTTHNNTytzdW8xNnZDYnVT?=
 =?utf-8?B?dGhMeE16L01MQ25tRWQxdklNcytVN1M3UWdYNlgwcGJzWFZkSnhnTEkwYitu?=
 =?utf-8?B?ZWMxRHFIb1FHaFY0dFJNZDJJM092STE0T2tOVnVFRXNVc0grK0tBYTJzc2xw?=
 =?utf-8?B?bkdzazZ6K3BEcDROOWZvbjZabEtyRGo0VWZaTWEvV0JPZzdTTDNLbngvWjhw?=
 =?utf-8?B?L3pkSmhWaC8rZWZsMTRQTlRhM0VqOG1IQ2R6TGFZeHgrYy8vL0k3Y0tWVG9F?=
 =?utf-8?B?QWZVc294VDdUdEZEcWQ0WWtKc1AvNE4zMUxwcE5UZVFiREpXclVxZXdlSVor?=
 =?utf-8?B?bWEyQW52c0w4WHB1V1FSTXlTd1dYclhjQ2FZazdlM0NLVmQ4ajhRWko1eHVv?=
 =?utf-8?B?bDFlejJZZjVzZ0VoVk1BYXRVM1IyOFVGcHQ3bitNM2R5S1E3YXJqK3hzNGhE?=
 =?utf-8?B?ZExubUVmVlAyaWdWdnQzeHdmYTVyMVEyb1pwbEs0cFN3T3FjUVhhTEZyc2RH?=
 =?utf-8?B?WVd1ajhRdHN4VEhLN0tWUWFXSjk5aDF4eXhEYjQvMDZ5UXRPdmNlZHUzUTRH?=
 =?utf-8?B?SGR1WjJ3MHFoKzR4bFV3NjdmVFNadStzVHNFZTUzRk0xM3NjL3lpZDZhWlFK?=
 =?utf-8?B?MSswVDFsTDI1MFluU2F6ajcvTUlpbGVUNENCZ2NOSVRucEN4MFJVRFhOM3Ax?=
 =?utf-8?B?QXh2NWNPY05ZZU9IK0pPck5TMVNvYnJqaWxzS0FXNytzenRjV0NvR2ViVTlI?=
 =?utf-8?B?bDlsWnZKNnFES0wrMkJ1b0hZbmNoeVc1WCtVb2RWZEVVMlRJZG1DVnFQR3VB?=
 =?utf-8?B?QncwZWZWSmZTN3BzT3RJdFhINEJMRmhHT0J1UUQ0eTRzTURQdnkzdXJqRUJT?=
 =?utf-8?B?dGE2YXRjait3d0o0ODh1WVVmSHJGenVIWFNHcGpTL0FES0gvRkF0dEV5U0d4?=
 =?utf-8?B?YXFpYU5rMEloOHV2N1pNYlJaSFNOS2h5cHZtcGJPaU1ZUUtrRlppbGU2blpO?=
 =?utf-8?Q?nTuK1KXKZ1HxIrNBk8CY63gnwcy1no=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0ZwMmdXM2tXeEZIL0Mra3IxVTJTcDVjaURxQlU1Y0s5L1pJbFUxYmU2VjR4?=
 =?utf-8?B?TG1ZRGVqMSt5U0t0MGZsSmVnMW4rYkRRcUlua29XSFIvc1k0NjQ3U20yUnlq?=
 =?utf-8?B?R0tMQ0hMNG5iN1E5am5lTGZRYmxESjJ0VmRXenFUbFRNOWlTWG9aL1RpdFZh?=
 =?utf-8?B?N2gwR1Q1MkdzUHNwZkpHUmtHU21GOUFWU1dhS3lZY3ZBMSttVFZ0RVBPTnU3?=
 =?utf-8?B?REJMRVh6YmprMFBvUTJpREdBalhYNW12c1B1bUtQNEpra2FLWkdVRGh3aGN6?=
 =?utf-8?B?OTJYMlFxNWtUTGNiQmFlaG1uRUFRYm50WDFHeDJOMWxJKzBxV3AxWXNNTFY2?=
 =?utf-8?B?Q3JjOStyeXhkSGprd3VhSmpqMWdycUZ4d2ttZ1pSVW9mY2p0K2tnQ05LVWht?=
 =?utf-8?B?b2RuUWNJUXd6RTRkRGJGc3llRTZPV0Mrd1V0ZEl0UmwzTENIV0xjSVVLSDBy?=
 =?utf-8?B?dmRvK0VnOHBtWmRUMWRvaUNDZVkwWnFQcU5hTVdRYzZYTStUYm5oM1M0dm15?=
 =?utf-8?B?Nmp2Qm02RHd3VTBYSGZCNjkxQnkvSlRKVWpFMk10YlVZSnlYb2c1bmVaN09W?=
 =?utf-8?B?N0dWRXhIU3JKY0w4OEZDNVdhK2RYRGNGb3BkNVRsZGt3TU1nbGZmV295dHhs?=
 =?utf-8?B?TWhaZTNpUnhHbHVJa0xDZlprTGdkcHVNTXl2cHNZakQ1N3dlVWxaOVNQcE9R?=
 =?utf-8?B?K2dSZGc2UkZnQ1NIeGdJaTU0QUdKSzdNKy9oU043d3R4MEFRZ2wvdFU5eVUw?=
 =?utf-8?B?cWFjcEI2ZTltNWQ2UjYzRThHK2diTDRaRDRVZG5UQ1NsMXRCQmpXRlBQTUlP?=
 =?utf-8?B?ekMxd0xoTkh0K2xzejA1N3ZPYjY5a1VpTVUyN0ZiN0FoU2xvRU5teXp3VGdr?=
 =?utf-8?B?bFEzOGZxazR5ajFBUG9BSTA2UThWWnpCRlpNQ053UFZ0T2tTT09PM2hoWWk4?=
 =?utf-8?B?UXliM3N3TlQvWFNPYUErU2FPL1hTVDdZdjkweVM3aTcrcmpPRVVtR3duK3lu?=
 =?utf-8?B?S2xiNWd2RjF2cUVnMTlVNlV4Q2N2NGdrUktvNmdXOTcrRGk4bHk5Q0EySnlP?=
 =?utf-8?B?SHUzM28wckJIU2hRTU11dXRFMXZ4ZmpkMXp4ZkJUbmFvaEYxSGRzRGdtZS81?=
 =?utf-8?B?T2dUYnhTdzM1NThSZW9ob3hTU3JqRmV1djBXRnJLUUo1QU95QWFVQUY4cThl?=
 =?utf-8?B?a3lHQXp5OUJid1M0NzI2eDBjbGZCa2pSNDhkcld3blN0dHBraW8xN2tucjFu?=
 =?utf-8?B?KzJwRGNJSENVODc2Z25zaTRITkN6NEFDNktDY1FXM1VKektTeUVZaWMrN245?=
 =?utf-8?B?TzFnS2VXY3ZzcEIrYTFEVW9hRWUwcnoyRnZFMHVzUWFKSHdzenFLazVjeWNa?=
 =?utf-8?B?cy9NNEZyZU9ncERDY3FQeG5aRU1RNEdqWGRoRXVyZkJpMjNZanJxUkFmVTVz?=
 =?utf-8?B?cmJnREdHUTFZRmFQZGdIYk0xSnZaM1I0aklNMDY3WkZDUUtzUkxOK2tGYmRD?=
 =?utf-8?B?YkdiU1l3ZVZNMGJwczM1OUpaMjVDZ0I2SitpRlpLTGhCTHBsS3NnZ3l6MUVF?=
 =?utf-8?B?QWpUTmpaQU13c1hKS2paWmJFUFpHMjBCcVdMNG9tT1JldnRjQmxleWFzb084?=
 =?utf-8?B?NFhGVUNoMzNOY0dqRGV5UFZ4eTFuMlA0VHJjYXMvZ3lNc2RaSHBMdm8vaHpW?=
 =?utf-8?B?citKREk4ZEtxT2U4d3hnVmYxY0k3WXptaXNka1BzZkJiT3VsQmhodnRla2ZL?=
 =?utf-8?B?NWpQUW1vbmFGbVUya25UdjBPNFlQTkt5ZjRyRSs1Ty9OL0h5K1VSWXRWa25j?=
 =?utf-8?B?WG9OdzZGWXM0L3RZR2VKcTlTVFJYUUNQZnFhY0VMU2Z5TENQVVc3cWVGMHVB?=
 =?utf-8?B?NXJyaG10QmRudCtxd1lBNVJJVkV2dDhhRk1idkxNRDF4TE41NEw1K2ZPSk9T?=
 =?utf-8?B?ZkFVSFJZYWZqUnk4VzRPYnY5bTZZc0kwYzlNcGpYSXNUbEFMQ2FYVGsvZFlH?=
 =?utf-8?B?bEFsbnVkV3llc0FZVGZWbExpQXp4YyszM1BzNFVJRXRuLzlpQm1ZVithQ0cy?=
 =?utf-8?B?cVhtRzMza1BVdjhMdy9ENWdjU3QxV0JUSVE4UGFtVUgzOUF1UXNNRGExck14?=
 =?utf-8?B?TlFlWWFyS0dzQ0M1bG5PK0FkOUVvQ1JzbW9EdmZGNUdIWm5aRWMxeWhWclJF?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 187a44a3-3e9f-4843-be14-08de08fe309d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:36.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zE5JINRWgtSOo96DQ/KSrdj7tdPNtW2pYrnaUgdoEmq8qi0V6ZCcAtIaxQ7YpYKJNW14gQgi9ng4wHyfHu374dvMMY84VKGog73H0z22PRg=
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

Connect the helpers to allow save and restore of GGTT migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 119 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   4 +
 4 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index f73a3bf40037c..a74f6feca4830 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -188,6 +188,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(MIGRATION_DATA_WIP);
 	CASE2STR(SAVE_WIP);
 	CASE2STR(SAVE_DATA_GUC);
+	CASE2STR(SAVE_DATA_GGTT);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
 	CASE2STR(RESTORE_WIP);
@@ -803,6 +804,7 @@ void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
+	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
 	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
 }
@@ -843,6 +845,13 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 		return true;
 	}
 
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT)) {
+		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
+		if (ret)
+			goto err;
+		return true;
+	}
+
 	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
 	pf_exit_vf_save_wip(gt, vfid);
 	pf_enter_vf_saved(gt, vfid);
@@ -862,6 +871,8 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_enter_vf_wip(gt, vfid);
 		if (xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0)
 			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
+		if (xe_gt_sriov_pf_migration_ggtt_size(gt, vfid) > 0)
+			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -970,6 +981,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
 				     struct xe_sriov_pf_migration_data *data)
 {
 	switch (data->type) {
+	case XE_SRIOV_MIG_DATA_GGTT:
+		return xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
 	case XE_SRIOV_MIG_DATA_GUC:
 		return xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 	default:
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index b9787c425d9f6..c94ff0258306a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -72,6 +72,7 @@ enum xe_gt_sriov_control_bits {
 
 	XE_GT_SRIOV_STATE_SAVE_WIP,
 	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
+	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 0c10284f0b09a..92ecf47e71bc7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,7 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
@@ -37,6 +38,117 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
 	}
 }
 
+static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration_data *data;
+	size_t size;
+	int ret;
+
+	size = xe_gt_sriov_pf_config_get_ggtt(gt, vfid);
+	if (size == 0)
+		return 0;
+	size = size / XE_PAGE_SIZE * sizeof(u64);
+
+	data = xe_sriov_pf_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_pf_migration_data_init(data, gt->tile->id, gt->info.id,
+					      XE_SRIOV_MIG_DATA_GGTT, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
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
+	xe_gt_sriov_err(gt, "Unable to save VF%u GGTT data (%d)\n", vfid, ret);
+	return ret;
+}
+
+static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_pf_migration_data *data)
+{
+	size_t size;
+	int ret;
+
+	size = xe_gt_sriov_pf_config_get_ggtt(gt, vfid) / XE_PAGE_SIZE * sizeof(u64);
+	if (size != data->hdr.size)
+		return -EINVAL;
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, size);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_size() - Get the size of VF GGTT migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (gt != xe_root_mmio_gt(gt_to_xe(gt)))
+		return 0;
+
+	return xe_gt_sriov_pf_config_get_ggtt(gt, vfid) / XE_PAGE_SIZE * sizeof(u64);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_ggtt_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -290,6 +402,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = xe_gt_sriov_pf_migration_ggtt_size(gt, vfid);
+	if (size < 0)
+		return size;
+	else if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 5df64449232bc..5bb8cba2ea0cb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -16,6 +16,10 @@ ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_pf_migration_data *data);
+ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.50.1

