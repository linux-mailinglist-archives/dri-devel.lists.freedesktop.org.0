Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152BB335C8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 07:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9010E33E;
	Mon, 25 Aug 2025 05:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4g7fPjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FCC10E33A;
 Mon, 25 Aug 2025 05:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756099481; x=1787635481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RhxOiFQRzD/ppg96hL+vjpwncTZk7CQk9OXNSBL5aXs=;
 b=H4g7fPjmQF7Yc7uKzsNqEyJHwytQ43XO+4QROZ+4XHuVIokNBwuLinsz
 Ogxk+EIOtkcy2kPoDqfyjHz9fESIXNI4FfWXl70rGkoLgcXXwHmF/Q66+
 yk2mWSjhA9QUe2PpT7BuygP1TCnu5g6HqTGLaWu8uk4+BBCVIygSvuChu
 xBJlC4tO+MzTVwWqaKZoW1Ia1IcK86W16sb3tBywZ/GeSDPTC+eKGKz/S
 xgj5hV/XX/h4fgZfYtfdRyKZ1Z1MblBCIT709owFFYdVY+9V27eCbJct8
 ABOCCx0tMpi9nYYRjNpt5AZ9j8fEpFQ/6ybxYJDB2COSpXog3FXQ0ZDGC w==;
X-CSE-ConnectionGUID: WaLFE82aTsatDWoIswIYXA==
X-CSE-MsgGUID: iExHr4jzTzC8bZ6rENT7Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69736599"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69736599"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 22:24:41 -0700
X-CSE-ConnectionGUID: tK+wqD35SdClGotnVnIEcw==
X-CSE-MsgGUID: GFQXZ3L/Qxm/yciWIOph1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168411369"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 22:24:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 22:24:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 24 Aug 2025 22:24:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.80)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 22:24:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3kT5XfCB/oAwCpq/g5tJHRruzIQNBnKGytbUtSfUp+xzWAZ4vylfwNfLbFFhrzGoXSgZy/tFl0b3SOoBMTcOrexTscojLHkub+le9EgGJ04ndR7lolSEh3IH1HBfL2DR7j6VBjZym7sUXQxJanYVD99EdyyAv95lWNP0qqgzS/lLsXuTxFRWTJxM4PQw8m1EQeLauqZAtmw6T7hDgrWuYFaAzf5p8tJWpirDkKY+JDXV4lLX/7W2y4WRd22YX9u5XGqFX7Z5UFFOrr7PPS68urVtgBNBz8nu1I1aQia/8pzZcp3Yd6kuFd13Na0bXHryRFagMcDJz7V0Fumwq5AQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5wZuzv2QHTZ0dn7C4g+g5SQut7270pew6qjI4XBpg0=;
 b=Lg4MGSl+ncKXEPWzriAdEBoxyFskj728lSmjBHrvPuV9YI/NUfbBaHJqWx7Crve7AQFAYQjznWpovdy2oqrheE+UpdDyfURhCoKxYXHGmJgn/GPwz4z9UdhZmv2DMKHkIiT4/mQ1yzTIYtr0xanvXqT3BVgwjGw3+QPbcBKOAsPWEB2FHYsozQcetYm+SA2+KfsoD4vinwhCMpm04iGRrjJ/pyx33pDj6Yab6StKJIDws7Dyf+BPJk6jNSkVesnd4VevxdPNmvOJgqN6MgUSb9i5wYGBN+xCnKG1VzErKSLf/66eMcPxluBS0r+8BPB4NnVTG0j7pBrvPgPca6J66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 05:24:37 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 05:24:37 +0000
Message-ID: <43bbe8dc-d7e9-441c-b101-301ee843335d@intel.com>
Date: Mon, 25 Aug 2025 10:54:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/atomic: Return user readable error in
 atomic_ioctl
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, <naveen1.kumar@intel.com>, 
 <xaver.hugl@kde.org>, <uma.shankar@intel.com>, <harry.wentland@amd.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-3-13a0e8f2c581@intel.com>
 <dc5d62fc065b1273f04f07422be61e94a0d153f7@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <dc5d62fc065b1273f04f07422be61e94a0d153f7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: d290d168-2313-43fa-7b36-08dde397af3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEVnYVhDVWl3eWRyWUI4SlN6K0xzQzZ1bUMxY05YK0IwT3lJalk3UTBtTUJi?=
 =?utf-8?B?SlVJSzdJakVUUE83dFZUN3lPR0ltMFpnOEgzVUNIdzEwbGliOU9KaEVTQ0hN?=
 =?utf-8?B?S3ROcHUvVktWWUV1cVBUN3A4eEFYSktmcXB6cUZrZURoQWFnaXE3cnYxNjU3?=
 =?utf-8?B?OEFXclBIY3dMRUMvOGJzaEU5SlFmZmtJcjV1UmJzRHF2bU0yczB2R2dKN2ho?=
 =?utf-8?B?NVIxRXBPQk9HZm85c3d2YWl1dXN4QmtRa0NiQTNpWUhaQkZnazNPU3B5R0NR?=
 =?utf-8?B?YUE2V051NUJOakd6Zy9PR1ByTytFMitRWlF1UzhFY2w1c3JBaGNwYUNjOTFU?=
 =?utf-8?B?NFZGSHJhKzhJVXhsZityZGE1T0FWcmhsc25mZUJJZG9na2pUVVgxV3lpdXMz?=
 =?utf-8?B?UXJvbFdvbWVFeGc0cmtyQWhxcjNRUURJQmhhd0MwWStmeUZ1bGNmeXhOYlQw?=
 =?utf-8?B?Z3ZBalJHcG03L2trMi9tSk9MU0V2Y0hDamdYdHlqaURVMmhqNkxWYTB2V3Js?=
 =?utf-8?B?cWdUMWIxOUFaUy8zclpHcDdUMTdNNzZyazFtZzJkZnRCWkZpSmxlNlZTdzdj?=
 =?utf-8?B?aysvQko5YVF4S3grNGkwblhwdXd0NDErNW94V0M1ZnU3YW4zUjRvbGoxREJ4?=
 =?utf-8?B?Q1FCQURPVkRXemNJUFBaVVlSOW8vRktVV0ZJNHVMU3VVVXVhWGZYS2NtdVFN?=
 =?utf-8?B?cmoxbjNzTmZjc0U1TEZyK054d2ZrSTY4Z3ZhWXprL21laXg4U2R2c0xsTmM4?=
 =?utf-8?B?TXlvYkRJeFNYbDY3UFE0Rm9kY1ZuV09xWE0vTGV5NGRndHM0RVdPKzVwYUVU?=
 =?utf-8?B?bW1FMXQ2MHd4cHdUQVYyOHN6T2Z2UWVkQ2dhdGx3c3VTM1lLb0xrMW9sVzNM?=
 =?utf-8?B?NHIrZFdVb1NDM05sdnpUNjJlNWZ1eEc5NWNRMTd5T1FnbUVvYTA2UmZ4aUF5?=
 =?utf-8?B?T0pMUitHNlRuT1pXM2RhVFM3SmozVDA3aStvSXJwNjhXT0J6c0YwSkpMK3B4?=
 =?utf-8?B?eWtXcXRzb0xBYkg5eUdpNnpVOXEyUm15MzVPdWxGdXRqUVZWZmhlZ29sUGoz?=
 =?utf-8?B?Q3RMZjJSTXZMd2tSRzkyV3VGQzE0UFBpcHI2RWtRNy9vdWZMZDNCa21xOUV1?=
 =?utf-8?B?SXo3M29XUTkvMk4zNGgyZnptb2kzOEppL0FsK2MrOEdXVDBkbENZVkRGOFZS?=
 =?utf-8?B?ZGkyUnRnYjlESGNvcG42amlwWlFEcVZBbkcwSVRTTHN2Y3UrUmFvSUxueVBF?=
 =?utf-8?B?c0k4UEczL2JiWlptR0VpVDJlM05iVFY2Q0M1K2ZUblVObHlxeWhGK0w5RmdC?=
 =?utf-8?B?dmlxYWIyMG1sM1VLakVqYXluRXRrM29BUHYreW4wWnREb2kxekljeG41RzdS?=
 =?utf-8?B?MlJRd1djVFlmbkMyUXBBWkpjR0FCMUdIR3NkQTBKRDNHQ2svM04wL3RId3lt?=
 =?utf-8?B?bzlHUnRsMEZmSHIxSEZ4Q0Q5WHlUQXR3WXlHTTJZelV0QWQwdERjL3c1UkNY?=
 =?utf-8?B?UnorWUFrMkRVelFxeS9JemtsQWhodmFEL2hZQ2FGRFFWOXhNend3NkZ6MTJm?=
 =?utf-8?B?cWhpSFQ2YXNQYktrRnY1QVJYc0FPQ1hlVWxsak1yWnJncTFXKy95U052UEdt?=
 =?utf-8?B?RmRDaVNHOEpaajJCcnl1K1luNjE5aitGSm44Q0QzMmJYakxHSTlFMldlMkdE?=
 =?utf-8?B?RUdoQ3VWSVkxNHlLeVdseXZUT29VVW9vL0lyVCttUFFiUWZsaU5YUHpqRlZn?=
 =?utf-8?B?WEM4ZjBURG5HNDh2NDhHSVl5UU9ZSzN0MHdtWlNJV2pkdWZlRmw1KzNsNzls?=
 =?utf-8?B?VlpPSmJKWnFxVWo0eVBpUlVtT05sbUNmbFI2VmdVekVXdm9PU0pzcnJtTlF1?=
 =?utf-8?B?TlRDVEVMWCtjaTZzYjNKUzRNbUZYZFJaVG1CamhpdHl3Y0h1dGhWSFFpVm5H?=
 =?utf-8?Q?lrgmKZLd8y8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytSR3JtSEhuc0xtcHRNeFBhc2krVW5kOHJSQVdkMytJNEtUMjNHR0RWTGRK?=
 =?utf-8?B?UjJrdzR5ZjRueWJQU0FWZEtxalBZWTF2OVdJRCt3NkVjREtSVmhwOTgrRXBO?=
 =?utf-8?B?QUtYd0J0UDRnTGlyQ0ZJTFZJMkpXN3hBdlBQdDF6NkN6MUlRY2FwR1lEZFhZ?=
 =?utf-8?B?a3Z2NGpxL2RQdEJnRlM0bEJjaWFHakwzVDhJL0puUlBWbFBseENNdURDVzhN?=
 =?utf-8?B?ajVqb0YrTHUwdGtvcjVGam1ibHFsZUMvWHNWU3JrTmpxeFZINGZxM2wrcitJ?=
 =?utf-8?B?SlZvNmlTSlA5NzBCTitrMUZRMERlWnRjZzZ1M29NL3YrSjZCdE9ndE0za09v?=
 =?utf-8?B?eHFLTm00elZYdWZ4RjI5czZPYWIzZVZDbSsrNkw2QTR4UjJUUzRXVE9mV0gz?=
 =?utf-8?B?ckdDOUFQb1Y2U2FsbEtSR0VBVm5oMlh3WkJCcTIzYjh2bktDbllkWjU1cXpM?=
 =?utf-8?B?TCtKVEVqTW9leTlVSktwRDhNNUlrdzVMR1h0N3EyWURGK0IyZ2piT0JQQkRx?=
 =?utf-8?B?TWxHcnlZQ1pTVmxER2d6RzMwMXd0S0FJWkJXU0lPbGpkNllNUnJxQ1gzV2pl?=
 =?utf-8?B?MFpLUWdXUjBzbmhJSlE5RkxoWkxwdDhNWEo2T1VOb3FxUnFoQ2NOR0lIL1hR?=
 =?utf-8?B?eWNRSTNPNGFBTk81YjVKN0FiaWl1MnpGeTNxb25aSDhkREV6NWRaUjBWRWha?=
 =?utf-8?B?eGhKWDVRU0pqSEFRM3hBTkZJekJGZDYxdXI3M0NtSjZqOGQ5bkNPSFRKMHlv?=
 =?utf-8?B?aVFSRVUwdHh3V08wbGxHSW1YaHcwM1E0d3Z4NzIwcWxtY0JGM3RLakhKT2pI?=
 =?utf-8?B?Nk5iZXZPN0xQRDVkV2NOb3V6Z2I2cTY0ajBhUENabTExbk05bStGQzFwanp6?=
 =?utf-8?B?dklyUk83STF4UWh6WS9LT3dnWVk4ZFJXR2g2T0RhMU5lN0FYamcrSS9LTm8y?=
 =?utf-8?B?NmdlbU1vSi9TVGg1Vi9XalFLOXY4eVdMQmNWdXJ4aGZrUE9KZHlIK3o2Slps?=
 =?utf-8?B?ZElIT05VUUh0UDZaNFBCMVpUdUFpZWsyRzMvWXRrOXlSc1p4cDZwY25Qclhr?=
 =?utf-8?B?NnpoUnM2djVhUzM1TTVTZ3RYYTl0bmFNYWluMXVSNTNsdWtkb2tjR0YvWXht?=
 =?utf-8?B?bkJBdUZOaWQ0U2c3WmFRMkJacTNoTVAvWUovQ0Z0Z1Mvb3FsTjVrL3plbGt4?=
 =?utf-8?B?NThsMzV3b3A1dGhJOHRUbDhpSzJIaUV0T1pnd0wyaS92cEVveGJBbW9SMWx3?=
 =?utf-8?B?N1dtMFREc0JiamU5Nm1ZMDE1bTRwL0Z5WXN2OUVXcTZ2WmN5bG1WR0J3RVd3?=
 =?utf-8?B?YUhFc3d3UEZrSGR6TytLeFVCSnZSeHRUL0JUMEFGQ1hWT2VuWVdRN3JNdDBJ?=
 =?utf-8?B?T2xrWnV2Q0N1azMxdmMwZllxa1JzaVlTOVlZd1dvQ2ZTTEdnVnplUWY1MGFj?=
 =?utf-8?B?cUFDUnZGdE9QWnBKTlJxamttL0VzZjhhSStJcElRMlNkZWNyV3NWaHE4WjVU?=
 =?utf-8?B?UTArRVU2NzJMa1VWdHdwcnI0VHo4emp5aEVISmwxL2VUd3FTWGkvUjc1MmFU?=
 =?utf-8?B?TS82UVFOdE93elBhSHBWR201ekRkbElFaHZLUEs4czFRUEhHMHV2V1cxdGJ3?=
 =?utf-8?B?YXM4a3RGME9MTUhESTRURGlTSjMycHVlRlZVZkJtMStScmRXZSt1YlZkT1pQ?=
 =?utf-8?B?WlpJNTlyTTZZaGl5QW5HcmZYNG90WG5zMytBa09LaS9GKzNKSUVuL05Xb1pW?=
 =?utf-8?B?bnZITU9wSWxzRUJVb2pZSDdVTEk2WWhhOW5xa1dOcmN1RVhqQWk2cGNIVkI1?=
 =?utf-8?B?aDZYVE01MmZhb0pGaDR0bXM5Z2pKVm13UTFrRXpveDZ1SktZTFlPZUI3Smxx?=
 =?utf-8?B?UnJOZlhzYmhnNDNkcG9qOUl4ZU92TmM2RHo1QXVSL2x5dDVNbFovTUJMa1Vi?=
 =?utf-8?B?aW1vY2JIcXhiV3V0YVBxdmllWHYvY0RLK3Q3WjJ5WkIrMjhNY2pMU3V3Z0h6?=
 =?utf-8?B?Tko1Tlh4NGNpTzlvMnF0NVppcjV1d3RpWnNhT0F1L05SQ3dEODBSUENiMHpo?=
 =?utf-8?B?cUJuYlU4N1dQN08vdXJsMkpIMkt2bGVIMEs0UlVSaHdpMnpkTitmZzAzQnVH?=
 =?utf-8?B?NG9QTFBhWWlqQ3Qxam9lemdkSFJ2YlJMZXYzcmYvNDI2L3hnQ1hWdDhzLzd1?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d290d168-2313-43fa-7b36-08dde397af3e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 05:24:37.7779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkOSp73crG8iruJEJjz7iXc1Yr/SIhSBq+FCxp1AsUUc0jBY42DGG2I80t9RRrr0RW8YAv2ElsSHBHQtL1JfuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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

On 22-08-2025 16:20, Jani Nikula wrote:
> On Fri, 22 Aug 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> Add user readable error codes for failure cases in drm_atomic_ioctl() so
>> that user can decode the error code and take corrective measurements.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c      |  6 ++++
>>   drivers/gpu/drm/drm_atomic_uapi.c | 60 ++++++++++++++++++++++++++++++++-------
>>   2 files changed, 56 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index cd15cf52f0c9144711da5879da57884674aea9e4..5f25e6d3cf6cf246f83a8c39450b410e97fe45bb 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -1513,6 +1513,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>>   			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
>>   				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
>>   					       crtc->base.id, crtc->name);
>> +				state->error_code->failure_flags =
>> +					DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
> It says flags, implying multiple, but you're just adding one there
> anyway. Just like it was a regular enum.
Yes its a enum!
>
>> +
>>   				return -EINVAL;
>>   			}
>>   		}
>> @@ -1537,8 +1540,11 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>>   		drm_dbg_atomic(dev,
>>   			       "driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
>>   			       requested_crtc, affected_crtc);
>> +		state->error_code->failure_flags = DRM_MODE_ATOMIC_NEED_FULL_MODESET;
>>   		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
>>   		     requested_crtc, affected_crtc);
>> +
>> +		return -EINVAL;
> This changes behaviour.
Will get it corrected in the next version!
>
>>   	}
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index ecc73d52bfae41a7ef455a7e13649ec56c690b90..94eaf9c98eb4ac2455799f1416010d366e1b5bbc 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1058,6 +1058,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>   			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
>>   							   prop, &old_val);
>>   			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
>> +			if (ret)
>> +				state->error_code->failure_flags =
>> +					DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED;
>>   			break;
>>   		}
>>   
>> @@ -1089,6 +1092,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>   
>>   			/* ask the driver if this non-primary plane is supported */
>>   			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> +				state->error_code->failure_flags =
>> +					DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE;
>>   				ret = -EINVAL;
>>   
>>   				if (plane_funcs && plane_funcs->atomic_async_check)
>> @@ -1380,6 +1385,13 @@ set_async_flip(struct drm_atomic_state *state)
>>   	}
>>   }
>>   
>> +#define FAILURE_REASON(flag, reason) #reason,
>> +const char *drm_mode_atomic_failure_string[] = {
>> +	DRM_MODE_ATOMIC_FAILURE_REASON
>> +};
>> +
>> +#undef FAILURE_REASON
>> +
>>   int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   			  void *data, struct drm_file *file_priv)
>>   {
>> @@ -1389,9 +1401,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	uint32_t __user *props_ptr = (uint32_t __user *)(unsigned long)(arg->props_ptr);
>>   	uint64_t __user *prop_values_ptr = (uint64_t __user *)(unsigned long)(arg->prop_values_ptr);
>>   	unsigned int copied_objs, copied_props;
>> -	struct drm_atomic_state *state;
>> +	struct drm_atomic_state *state = NULL;
>>   	struct drm_modeset_acquire_ctx ctx;
>>   	struct drm_out_fence_state *fence_state;
>> +	struct drm_mode_atomic_err_code error_code;
>> +	struct drm_mode_atomic_err_code __user *error_code_ptr;
>>   	int ret = 0;
>>   	unsigned int i, j, num_fences;
>>   	bool async_flip = false;
>> @@ -1400,6 +1414,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>>   		return -EOPNOTSUPP;
>>   
>> +	if (!arg->reserved)
>> +		drm_err(dev, "memory not allocated for drm_atomic error reporting\n");
> This right here makes me suspect you never really tried this with your
> regular desktop environment.
>
>> +
>> +	memset(&error_code, 0, sizeof(struct drm_mode_atomic_err_code));
>> +
>>   	/* disallow for userspace that has not enabled atomic cap (even
>>   	 * though this may be a bit overkill, since legacy userspace
>>   	 * wouldn't know how to call this ioctl)
>> @@ -1407,24 +1426,25 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	if (!file_priv->atomic) {
>>   		drm_dbg_atomic(dev,
>>   			       "commit failed: atomic cap not enabled\n");
>> -		return -EINVAL;
>> +		error_code.failure_flags = DRM_MODE_ATOMIC_CAP_NOT_ENABLED;
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>   
>>   	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
>>   		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	if (arg->reserved) {
>> -		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
>> -		return -EINVAL;
>> +		error_code.failure_flags = DRM_MODE_ATOMIC_INVALID_FLAG;
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>   
>>   	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
>>   		if (!dev->mode_config.async_page_flip) {
>>   			drm_dbg_atomic(dev,
>>   				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
>> -			return -EINVAL;
>> +			error_code.failure_flags = DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC;
>> +			ret = -EINVAL;
>> +			goto out;
>>   		}
>>   
>>   		async_flip = true;
>> @@ -1435,7 +1455,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
>>   		drm_dbg_atomic(dev,
>>   			       "commit failed: page-flip event requested with test-only commit\n");
>> -		return -EINVAL;
>> +		error_code.failure_flags = DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY;
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>   
>>   	state = drm_atomic_state_alloc(dev);
>> @@ -1446,6 +1468,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	state->acquire_ctx = &ctx;
>>   	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>>   
>> +	state->error_code = &error_code;
>> +
>>   retry:
>>   	copied_objs = 0;
>>   	copied_props = 0;
>> @@ -1542,6 +1566,22 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	}
>>   
>>   out:
>> +	/* update the error code if any error to allow user handling it */
>> +	if (ret < 0 && arg->reserved) {
>> +		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
>> +				 (unsigned long)arg->reserved;
>> +
>> +		strscpy_pad(error_code.failure_string,
>> +			    drm_mode_atomic_failure_string[error_code.failure_flags],
>> +			    sizeof(error_code.failure_string));
>> +
>> +		if (copy_to_user(error_code_ptr, &error_code, sizeof(error_code)))
>> +			return -EFAULT;
>> +	}
>> +
>> +	if (!state)
>> +		return ret;
>> +
>>   	complete_signaling(dev, state, fence_state, num_fences, !ret);
>>   
>>   	if (ret == -EDEADLK) {
