Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D182C03A72
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 00:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBCE10E971;
	Thu, 23 Oct 2025 22:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="LEqxUZvM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LEqxUZvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ED410E971
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:17:37 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zHrWoQPSGC36vLun6x6es1X1wsSUjOn42nnPWG02t4xMD0ZFAAJcRBJdWbFG42YeYp/65gG+i+QCZWq9To7MdRnrJPGczJ6pEUXGkhLefH+T79G6lonQZQoCvfuy46++id9Zg8F9EYz3BzwiX0Nj7G/n/jkPczZPu35irMkucfw47Mqdv3MA2407Evre/ISuEC80Egd1/uL2Ws2CA+3SiNpbphAB6N2Sgq2Ga/VZNLgZAN5PZ4xoHotky3tnoagKUKo1fty7boekps7n0A9SwAZgKmL+rYjrUnv/4SFtN+W7WCl778rueAuw46/qsDDbXQM/RoRnTBoLeJC4AoT2UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcDH7aYmxIOS28Jh5JmlLDqOVkQA+tfpzY6b+XoUdxo=;
 b=j69BeqfARpHdRX/q/nUdfGR61HHvjkDo62MiPcoSEJAr4R93q1tp5ufRo4B6v7O0azLiWWmS68es9TtTiffxJEv6AXJoGtNi99fRBPKnXGeM2s3aKNSsg7IXEyBotm14geRrrN1YTyBVQN3KJpzkmT7pe0S+HFgMB+Isg1w5Zs8fzj0aRmxFKgAAKKBbrIf5U+Rvtew6Xx8j29kLC5Z8PYJabRkr9kTI6vHgmWhSCX3kT3QIXWsWIBXhzQE8p06pLMJOIvjP+JSV3vgAIT+gbSW9SAUOiqEKsQehPRmnQKKV6uhWJIpsTzoUf0xssnlfnuPA9kzgbrOpuFm5Vr8oGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcDH7aYmxIOS28Jh5JmlLDqOVkQA+tfpzY6b+XoUdxo=;
 b=LEqxUZvMQgi4pKkdy2YyYBmuUZm2srcT5XtKZuVNQlJMhJIja/1evK8WIBFNYW92wmCSIG2geVVywj6+13citWVw8IcHnQLq435STat1Lggb/PVZfLfl7pH+egHt9/HdNDhGt2T5mDTSyshDvNba5UZBwS+b5SHneZ01bYXJysg=
Received: from AM0PR10CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::27)
 by AM8PR08MB5649.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 22:17:31 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::e6) by AM0PR10CA0047.outlook.office365.com
 (2603:10a6:20b:150::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 22:17:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Thu, 23 Oct 2025 22:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnoZ+Out3gH60yorXBAYjKTeUSi/iilmNQxEdYcPJgiIR6JHvlLZAqPTs8uGeqkCw9+X4iSuEy9KT+OC28t9fVTaTOvX6tb8+EKqhNZVUqTBYdQ6OHMUCp5N21QluUOJb+d9pTkDBZm8kYbkY8Og2sB6KSNv6sqZ1FhwrXKuLHEI1rYzijoQwdci+E7/ca4YnyA1B7AQQV1d1h+fbk6yuBYISneioey8Lw6HOZ8AvaJSEF4GdFGj7Ii218Mawd8JV36jPo53nPewXegg87Qxuv7cO/I3aENw+GYuLfu8n0gEWzTSEz27SB3uzEEjqHhvh5sN2NlpdSZt+1/fstzpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcDH7aYmxIOS28Jh5JmlLDqOVkQA+tfpzY6b+XoUdxo=;
 b=QQkZNnLDR/oEXV36cHG1Okhk4ym0QAF/bJ03tR/byNSvMf/R9mHVvhSPtR0cy+uRuIUGv3SCotmGARfR0eEZZ2zh0ud9A3ML6jiVsalJTVsXhYmBj1wGawAYgskhMS4d0vSy1xb2hNEteqARrzjrxYxDsq8mCE9/YQS0bZY7NQnbG3htgfc+c6tWhv5vaZjQaR+EYyYsYq7zGQuUMuYiSwhEILjx+dNhDDTc92AHJhHogv1+/cEc1xQhQnifDfoLlnaSo00+F4g5/h4RcDhK74QGXuxuznJ7e/4Vw9Pg6804FlCx+iXm+qMVK+zB2Aenpp7oc6PTZWwmRPALpllZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcDH7aYmxIOS28Jh5JmlLDqOVkQA+tfpzY6b+XoUdxo=;
 b=LEqxUZvMQgi4pKkdy2YyYBmuUZm2srcT5XtKZuVNQlJMhJIja/1evK8WIBFNYW92wmCSIG2geVVywj6+13citWVw8IcHnQLq435STat1Lggb/PVZfLfl7pH+egHt9/HdNDhGt2T5mDTSyshDvNba5UZBwS+b5SHneZ01bYXJysg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 22:16:57 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:16:57 +0000
Message-ID: <a9cd1999-12d9-41cf-aef6-a6c3f1f23e4c@arm.com>
Date: Thu, 23 Oct 2025 23:16:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-7-karunika.choo@arm.com>
 <022e2ea5-74e3-4d53-9afe-8ead71853ee4@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <022e2ea5-74e3-4d53-9afe-8ead71853ee4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0127.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB8PR08MB5481:EE_|AM3PEPF0000A797:EE_|AM8PR08MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b318e87-0cf2-4c7f-719d-08de1281f52f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?enFTRG9mbUdvcXdJQnV5ZklHQytZd0RrT0lYZ1drOUhEbUMxYnNRRnppbDc3?=
 =?utf-8?B?V0JuY01OSTBuWDlMWi83N0w5bEZDNnN5MjMzK0FYQnhIZ1g4OGRWUm1CQnBp?=
 =?utf-8?B?T3YxMmNleTYyaCtXWVhZMGxUQXdET2dWbk85T0JmVlBnQkpNWldyNEtPN2xk?=
 =?utf-8?B?WXN6ZXZIejM2amQrajJudVoxYjB6Q0U0blI1bVpnc3dPMUo5bHhSODRpYzlK?=
 =?utf-8?B?M0FOLzBxTnZHWi8zUnh0U2NLRDBBM1FzUk9qSVdweW5LdXYvWDh6MSszeS9l?=
 =?utf-8?B?VnBoUlF2N1pGTklwOWhJR2YzaHB4dEk0dCtHUEl5L2drL0JZMjVJcE1XQ0V6?=
 =?utf-8?B?VmNPNFNQYjB4Zlplb0hhNnNUckNQSHA0TDExdFZZTlptdmZuOVhlWVJXRS83?=
 =?utf-8?B?cWxwczN0RW8wdW5ZaTJYK0J1akZMYUJjQXRFcmdFTTlzWDZDM0ZPL1g2dS9x?=
 =?utf-8?B?RkhmM1ZmaGlwLzIxcEZ0VzFYNElyK2Vyd25EVHBxTFJxY1hORU9BcGV3aEZx?=
 =?utf-8?B?RHAxWXBNdHc0bzRaVkh2aVBWZ2pVdHp4SWtMbTBqeCtTRUVHVUljaE9Nd2Nh?=
 =?utf-8?B?cEFhTWw3WEFPZGtGRTU0cm5hNzlqSzJ3aDF4YzZJTmIwaGNjWlVvYmMzdU5C?=
 =?utf-8?B?K3BsdFRkYXd2eWt5SHBXeWZPQWJOMktvZCtJcmU5SHgxZnc2MXFzUTNMcFR1?=
 =?utf-8?B?bkI3SElZMFByMldLSFhoUzU2TUQrWjQ3bzYwUTFkU3lUY0drNnVZQ2JEcW9H?=
 =?utf-8?B?RElhdEo2SkgxYnhEVHIvc1pLTVllbFZFcWpaTElJK1dvVHJJd3AxNlNLWTFP?=
 =?utf-8?B?YXNka1RyQWxIdUp6eHgrS1psUGY0SlpzZ1kwQkN6R0N6SGlzcEcxY0pGZ3E4?=
 =?utf-8?B?Q3J0dUtFTXFrbUNDYksyWDk5Smtlbk9JSHdMMVRFdnV3TElVMlB1SlA1UEZH?=
 =?utf-8?B?MWNLQ3ZVdlRRUG9VSWFTcVdNNEw2QkhxNDNHWnk3U0QvYWZOWXdOa0tiV29k?=
 =?utf-8?B?RTdQL3B5WDFGQXg4WXBvMTEzbXVIbVZicExyVkdaRHBtNzhlM1g1Sk9WVGNz?=
 =?utf-8?B?N1FNQllzYjR0ano4c3lPRTZTb21zTzlTNzFOWWNuUFB3Tk01N2JXNXFrQm9N?=
 =?utf-8?B?WDRJa0sxOWMxR29ZM1czajN0cVhFYVBteUY5TFFrU0RLd1UxSG15NnhxRFhp?=
 =?utf-8?B?K3lETWFnSFJpRDhNTFVuMUlHUU5ZRFA0UU9qdWZEbE9wU3J1R3JYZjVnd2Rr?=
 =?utf-8?B?eHFabWFDM0Y3US9lczFTdVlOZlpzY0dlZ0k3L3FBb1JGQTBEajVHN3lJblJU?=
 =?utf-8?B?NXc0SDNvVVpRejFiMWhRTmx3Si83ZkhITFg2Q28za2g3UStTQW5vbTlkdVV2?=
 =?utf-8?B?WWk3N2tsUnNOSnJFakVpdDA2ZThrNEN5ZnM0MWNSbUdVNTN1U3RkbUdldlpD?=
 =?utf-8?B?R0lIVG4xcS9IdkVUZDBwbHBuUGp5M2RjejN3NTd3MWZGNDJwNGRjNGY1WG9S?=
 =?utf-8?B?ejZNWDAycmJPelZ2MGdaU3ljazZib3dJVjFzRGRNUFBmRzNGUHFpdUo4K1Bs?=
 =?utf-8?B?K2t5RHRuMFRUOTVaWGtuYWVqOW9RT0M5TXdFTEt3YXFyYmpac0pUVWpGUUF3?=
 =?utf-8?B?K0ZpRk9PK3lMbEZ0YTlkOFNqbnBlWDI1WlRPSUZxdEsrMm9ZMHYrQ1JxSW9z?=
 =?utf-8?B?N0JidFY2UzBYcVFQRnpYc2l1bDUrT3hRaWlYRHc2V3hMejFnL3RZZ1N1SWJr?=
 =?utf-8?B?bCtvWmRYOEZnalBBM0QzcGkvdVhnSWk5bERHOFBmV2t2cEhlS21hYk15RDM1?=
 =?utf-8?B?ZGRSbkFyeEQ1ajFJVDNJQk84WmUxZ0VoNzBNR3F1RXZSL1dEbFNpekNQb2k4?=
 =?utf-8?B?cTRPUkxUQ1pMM003YWdvMVg0R1BTR0JkNm9oVmlWalMvdmVUMHRQN21ZUk05?=
 =?utf-8?Q?rPah3Pnf6BcUpj9cs66E3GnrXEkEl2nw?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5481
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf475320-b840-40cc-472a-08de1281e12d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?allTUjdqMnIxMitjVVdrOWtqZnJ1dHFlSWxIWGpibTNNOHY5R0crM1ZMWDU3?=
 =?utf-8?B?d2FEN1doVmtmaWhZSFUvMkg2RVZaaitrTmpTY1VpV2RIUS85di9YMDBYWkk0?=
 =?utf-8?B?cTEzT2JiWFFXdjl6Q0pIN3lScFNMdWRGQTVPQlZYOXg5TmNPeUVZa2RYMEFw?=
 =?utf-8?B?OFFsRE5ucFNKeG1PNkhaSC9lWmVrL1I3WVhEaXNOMlU1WCtEeUtGVkxGKzQ2?=
 =?utf-8?B?VnB6UTFsRFJRaUE1NWdqdmFMdFJ2UU1uRmd4MFlYUGVjSFJvRlhuN05aMXp2?=
 =?utf-8?B?T3hBMjI1YzR6N204ekVVQWNOTk15cnhka3poNjNMQVhHcXlRdDdKb2NjeCtv?=
 =?utf-8?B?cFhHR2s1UWdnNVZqUUMrTDNxR2hJKzZnSjJXa2ZQdUhKL1RFb1FXaXZXTmhU?=
 =?utf-8?B?MlBhMnhTWXNNVWZLdTRlS2lUNndKZllvYjJkK2hnRGVwbUowQ3NPSmpyMTVJ?=
 =?utf-8?B?M3ludkhSWGRBUm1OZVZ6Uk8yakl2MnV3Z051RnUvbDdxMFVnR2lpUjFFK1A4?=
 =?utf-8?B?NkRCWDFUdkJCQndua1FvZmVTYXV2NUNQMGttbjZibGNTcUQ3THRZTmE4MnFV?=
 =?utf-8?B?WElvU2lDdXM2cm5kTjhNU0xHYzI3aS93a3Zkbmxodk4vRHZJWEVBMXMvZ3Ex?=
 =?utf-8?B?ZWd3YmpMbFNsUEI2T0ZIbS84U2RoVzI1Z0hUUmhDcVp1N3FtK0RWRERxc1pR?=
 =?utf-8?B?eE1pYzhDb0NkZHh2cmR4eW9NSUpyWnllei80eFpBV2NCWDYvSE9uTVVyb1JH?=
 =?utf-8?B?ZmRTMXZXMGJyU3VLZURGYnMvaHZET0xsSmxOYkI4aWhRcGQrNWdyNFhQdDlU?=
 =?utf-8?B?ckxZTm9ibkFkRHp6Q3VYbnBUZjZoOHBkaXJZUGhXVk55Z2hsb1J1THMxeFlz?=
 =?utf-8?B?MDBYL0NHc01Pb005UE9oQmppWHdlMUtNaHBqNUNQYkNubnZTeGFkbGZBRGdm?=
 =?utf-8?B?YXUyelZHQ3RPME1YL05BeGppTDY1WCt1NFZPYmJqb2xHNFZUOUdpWE5FRWtI?=
 =?utf-8?B?M2xSaysvNWRwT0ttQ3oycisreDdXTmpaL3dVVHR4VG1pYTRHMHBKTUNEaEFC?=
 =?utf-8?B?R2tudUtkWXRidjg2WW5XZ09UN1NxTnFBYktXVmFGVmFxblVyZy91U1hDU0pj?=
 =?utf-8?B?L3hnZjlLaUQ2ZjJKL2pOMSswWG5oMlFsbktWMFUrME9kUHlIYzJKTXJPOGZj?=
 =?utf-8?B?UkZPVk9iMTJBQjJKUGg3YjJOdGhMSlNWb2pXKzJ3OEVxZ2ZBRnJhbTlhdDFS?=
 =?utf-8?B?QmlrZFg4WVFLd2x0SUo5c2xIY3dWMlVuMzRrcGEvanRiak9nWjFBdnRxWGd5?=
 =?utf-8?B?cGFWR0w4d3dqMFVDL205L1l0bHdQaFlja2REMXQ4bjFXUEdVdjVrQlB1bHpp?=
 =?utf-8?B?eC9zL21xZnZEeDNjYTM3d1R0Wlg3RzdPNVZlR2FjeG5qd3VtMmJ3eDdoS0ZV?=
 =?utf-8?B?dHplYWE3WWs5ZjNCenBXT20rZHFHTDZCNStlbnY1b2VtdU1ZRGg5WVpUUkNm?=
 =?utf-8?B?c292QW52QVo1L2VCdFluUUNvZ0h4MVd0eE5uU3lGQVcwRFp0cFVScThYVVpO?=
 =?utf-8?B?WmZMcEtWVkloa2N6OUpaZWpsTENWcXFaekNPSTBRU3cyZ1lPMEdaWHdDYVpx?=
 =?utf-8?B?eW1sVnBFZ0hia2M4MnhZYjJ3dFZWK1ZhVGJ5dExYZ212N1ZQL3ZWNlI2YkNr?=
 =?utf-8?B?bEcyTURnNHhEM0FTSG92R0lXTXA5NkhOcG9Ra2FmellabWFnY1ZjTXQzVkpq?=
 =?utf-8?B?YzJ5ZjM2SnA5bXhJemRFRVBIZ1g2Z05nWlN2dHhqNkx0R2lqZHJIc3FYQVVD?=
 =?utf-8?B?VDJoWGFXWHBoVjdRSUxFalI0RWNEMGY2dmt5dW5qaFdjdVUvYkUycndVWjFi?=
 =?utf-8?B?VittZGRTMVNMbG00aVNDOWVVREo5ejlSS1h1Q1doMDRPVmgwbDB5My92a1dw?=
 =?utf-8?B?Z0xodEtKREpoY1hnMjIzcTRQV1lPWE5BbVBFeU1Sd01pd0pUdzAraGZIZ3o3?=
 =?utf-8?B?YUgwWStvQzhzK3hZVGR3S2V3WjZNU1JDM3g0Wjk3d1Zxc3llN3B6dVlKVGFs?=
 =?utf-8?B?cXJtWTVLL0dSa3JKbE9weXhRU3BJUGN0TDJxSDdTL0Q4bm1vQXdrQi9makor?=
 =?utf-8?Q?xQwg=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(82310400026)(35042699022)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 22:17:30.5805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b318e87-0cf2-4c7f-719d-08de1281f52f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5649
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

On 20/10/2025 11:50, Steven Price wrote:
> On 14/10/2025 10:43, Karunika Choo wrote:
>> This patch adds common helpers to issue power commands, poll
>> transitions, and validate domain state, then wires them into the L2
>> on/off paths.
>>
>> The L2 power-on sequence now delegates control of the SHADER and TILER
>> domains to the MCU when allowed, while the L2 itself is never delegated.
>> On power-off, dependent domains beneath the L2 are checked, and if
>> necessary, retracted and powered down to maintain proper domain
>> ordering.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_pwr.c | 390 +++++++++++++++++++++++++-
>>  1 file changed, 388 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
>> index d07ad5b7953a..594181aba847 100644
>> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
>> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
>> @@ -23,6 +23,14 @@
>>  	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
>>  	 PWR_IRQ_COMMAND_INVALID)
>>  
>> +#define PWR_ALL_CORES_MASK		GENMASK(63, 0)
> 
> This isn't 32bit safe (I think that's what the kernel test robot is
> complaining about). Use GENMASK_U64().
> 
>> +
>> +#define PWR_DOMAIN_MAX_BITS		16
>> +
>> +#define PWR_TRANSITION_TIMEOUT_US	2000000
>> +
>> +#define PWR_RETRACT_TIMEOUT_US		2000
>> +
>>  /**
>>   * struct panthor_pwr - PWR_CONTROL block management data.
>>   */
>> @@ -59,6 +67,302 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
>>  }
>>  PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
>>  
>> +static u64 panthor_pwr_read_status(struct panthor_device *ptdev)
>> +{
>> +	return gpu_read64(ptdev, PWR_STATUS);
>> +}
>> +
>> +static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command, u64 args)
>> +{
>> +	if (args)
>> +		gpu_write64(ptdev, PWR_CMDARG, args);
>> +
>> +	gpu_write(ptdev, PWR_COMMAND, command);
>> +}
>> +
>> +static const char *get_domain_name(u8 domain)
>> +{
>> +	switch (domain) {
>> +	case PWR_COMMAND_DOMAIN_L2:
>> +		return "L2";
>> +	case PWR_COMMAND_DOMAIN_TILER:
>> +		return "Tiler";
>> +	case PWR_COMMAND_DOMAIN_SHADER:
>> +		return "Shader";
>> +	case PWR_COMMAND_DOMAIN_BASE:
>> +		return "Base";
>> +	case PWR_COMMAND_DOMAIN_STACK:
>> +		return "Stack";
>> +	}
>> +	return "Unknown";
>> +}
>> +
>> +static u32 get_domain_base(u8 domain)
>> +{
>> +	switch (domain) {
>> +	case PWR_COMMAND_DOMAIN_L2:
>> +		return PWR_L2_PRESENT;
>> +	case PWR_COMMAND_DOMAIN_TILER:
>> +		return PWR_TILER_PRESENT;
>> +	case PWR_COMMAND_DOMAIN_SHADER:
>> +		return PWR_SHADER_PRESENT;
>> +	case PWR_COMMAND_DOMAIN_BASE:
>> +		return PWR_BASE_PRESENT;
>> +	case PWR_COMMAND_DOMAIN_STACK:
>> +		return PWR_STACK_PRESENT;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static u32 get_domain_ready_reg(u32 domain)
>> +{
>> +	return get_domain_base(domain) + (PWR_L2_READY - PWR_L2_PRESENT);
>> +}
>> +
>> +static u32 get_domain_pwrtrans_reg(u32 domain)
>> +{
>> +	return get_domain_base(domain) + (PWR_L2_PWRTRANS - PWR_L2_PRESENT);
>> +}
>> +
>> +static bool is_valid_domain(u32 domain)
>> +{
>> +	return get_domain_base(domain) != 0;
>> +}
>> +
>> +static bool has_rtu(struct panthor_device *ptdev)
>> +{
>> +	return ptdev->gpu_info.gpu_features & GPU_FEATURES_RAY_TRAVERSAL;
> 
> Ok, I see why you added GPU_FEATURES_RAY_TRAVERSAL in a previous patch.
> It might be ok then to just explain in the commit message why that
> definition was included. Or you could move it to this patch where the
> usage is.
> 
>> +}
>> +
>> +static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
>> +{
>> +	if ((domain == PWR_COMMAND_DOMAIN_SHADER) && has_rtu(ptdev))
>> +		return PWR_COMMAND_SUBDOMAIN_RTU;
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_pwr_domain_wait_transition(struct panthor_device *ptdev, u32 domain,
>> +					      u32 timeout_us)
>> +{
>> +	u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
>> +	u64 val;
>> +	int ret = 0;
>> +
>> +	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val,
>> +				      !(PWR_ALL_CORES_MASK & val), 100,
>> +				      timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "%s domain power in transition, pwrtrans(0x%llx)",
>> +			get_domain_name(domain), val);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void panthor_pwr_info_show(struct panthor_device *ptdev)
>> +{
>> +	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", ptdev->gpu_info.gpu_features);
>> +	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
>> +	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
>> +	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
>> +	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
>> +	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
>> +	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
>> +	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
>> +	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
>> +	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx",
>> +		 gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
>> +	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));
> 
> Minor comments:
> 
>  * Put SHADER_PWRTRANS on one line - wrapping that differently just
> makes it harder to read.
> 
>  * Using the cached value for GPU_FEATURES is likely to lead to
> confusion. You're not using the cached _PRESENT values. This is
> debugging for when things have gone wrong, so if the FEATURES value has
> changed (e.g. the bus to the GPU is misbehaving) that would be a good
> thing to immediately see.
> 
>  * It might be worth a comment saying these are printed for debugging -
> I was about to complain this was too verbose until I spotted that the
> only call sites are when something has gone wrong.
> 

Thanks, I will address these and rename the function to
panthor_pwr_debug_info_show() to reflect its nature and use case.

>> +}
>> +
>> +static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
>> +					 u64 mask, u32 timeout_us)
>> +{
>> +	u32 ready_reg = get_domain_ready_reg(domain);
>> +	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
>> +	u64 expected_val = cmd == PWR_COMMAND_POWER_DOWN ? 0 : mask;
> 
> Yuk. Can we have a readable 'if' instead please? ;)
> 
>> +	u64 val;
>> +	int ret = 0;
>> +
>> +	if (!is_valid_domain(domain))
>> +		return -EINVAL;
> 
> Do we ever expect this to happen? I'd suggest a WARN_ON() here as this
> looks like a programming mistake if it happens.
> 
>> +
>> +	if (cmd != PWR_COMMAND_POWER_DOWN && cmd != PWR_COMMAND_POWER_UP) {
>> +		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
>> +		return -EINVAL;
>> +	}
> 
> Indeed combining with this 'if' we can have something like:
> 
> 	switch (cmd) {
> 	case PWR_COMMAND_POWER_DOWN:
> 		expected_val = 0;
> 		break;
> 	case PWR_COMMAND_POWER_UP:
> 		expected_val = mask;
> 		break;
> 	default:
> 		drm_err(...);
> 		return -EINVAL;
> 	}
> 
> which IMHO is much easier to read.
> 

I will clean this up in v2. Thanks.

>> +
>> +	ret = panthor_pwr_domain_wait_transition(ptdev, domain, timeout_us);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* domain already in target state, return early */
>> +	if ((gpu_read64(ptdev, ready_reg) & mask) == expected_val)
>> +		return 0;
>> +
>> +	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
>> +
>> +	ret = gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask & val) == expected_val, 100,
>> +				      timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "timeout waiting on %s power %s, cmd(0x%x), arg(0x%llx)",
>> +			get_domain_name(domain), cmd == PWR_COMMAND_POWER_DOWN ? "down" : "up",
> 
> I'd avoid this sort of ternary expression. If someone updates this
> function with a third action they're going to forget to update this. So
> either drop the pretty "up/down" text, assign the direction string in a
> switch above, or provide a helper function which decodes the command.
> 
> Or if you really want to stick with something like this then
> str_down_up(cmd == PWR_COMMAND_POWER_DOWN) which at least helps the
> linker with deduping.
> 

Will remove the "up" | "down" entirely as we can decode that from the
printed command.

>> +			pwr_cmd, mask);
>> +		panthor_pwr_info_show(ptdev);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask, __timeout_us)            \
>> +	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_DOWN, __domain, __mask, \
>> +				      __timeout_us)
>> +
>> +#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask, __timeout_us) \
>> +	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP, __domain, __mask, __timeout_us)
>> +
>> +/**
>> + * retract_domain() - Retract control of a domain from MCU
>> + * @ptdev: Device.
>> + * @domain: Domain to retract the control
>> + *
>> + * Retracting L2 domain is not expected since it won't be delegated.
>> + *
>> + * Return: 0 on success or retracted already.
>> + *         -EPERM if domain is L2.
>> + *         A negative error code otherwise.
>> + */
>> +static int retract_domain(struct panthor_device *ptdev, u32 domain)
>> +{
>> +	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_RETRACT, domain, 0);
>> +	const u32 pwr_status_reg = panthor_pwr_read_status(ptdev);
>> +	const u32 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
>> +	const u32 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
>> +	u64 val;
>> +	int ret;
>> +
>> +	if (WARN_ON(domain == PWR_COMMAND_DOMAIN_L2))
>> +		return -EINVAL;
> 
> The kerneldoc says -EPERM is the domain is L2.
> 
>> +
>> +	if (WARN_ON(pwr_status_reg & PWR_STATUS_DOMAIN_DELEGATED(PWR_COMMAND_DOMAIN_L2)))
>> +		return -EPERM;
> 
> But this is testing for the L2 being delegated? I'm not sure how this
> could happen, but maybe this should be WARN_ON_ONCE() as it doesn't seem
> like something that we're going to manage to resolve.
> 
>> +
>> +	if (!(pwr_status_reg & delegated_mask)) {
>> +		drm_dbg(&ptdev->base, "%s domain already retracted",
>> +			get_domain_name(domain));
>> +		return 0;
>> +	}
>> +
>> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
>> +				      !(PWR_STATUS_RETRACT_PENDING & val), 0,
>> +				      PWR_RETRACT_TIMEOUT_US);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "%s domain retract pending",
>> +			get_domain_name(domain));
>> +		return ret;
>> +	}
>> +
>> +	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
>> +
>> +	/*
>> +	 * On successful retraction
>> +	 * allow-flag will be set with delegated-flag being cleared.
>> +	 */
>> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
>> +				      ((delegated_mask | allow_mask) & val) == allow_mask,
>> +				      10, PWR_TRANSITION_TIMEOUT_US);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "Retracting %s domain timeout, cmd(0x%x)",
>> +			get_domain_name(domain), pwr_cmd);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * delegate_domain() - Delegate control of a domain to MCU
>> + * @ptdev: Device.
>> + * @domain: Domain to delegate the control
>> + *
>> + * Delegating L2 domain is prohibited.
>> + *
>> + * Return:
>> + * *       0 on success or delegated already.
>> + * *       -EPERM if domain is L2.
>> + * *       A negative error code otherwise.
>> + */
>> +static int delegate_domain(struct panthor_device *ptdev, u32 domain)
>> +{
>> +	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE, domain, 0);
>> +	const u32 pwr_status_reg = panthor_pwr_read_status(ptdev);
>> +	const u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
>> +	const u32 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
>> +	const u32 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
>> +	u64 val;
>> +	int ret;
>> +
>> +	if (WARN_ON_ONCE(domain == PWR_COMMAND_DOMAIN_L2))
>> +		return -EINVAL;
> 
> Why WARN_ON_ONCE? This is a programming error. Return code doesn't match
> kerneldoc.
> 
>> +
>> +	if (pwr_status_reg & delegated_mask) {
>> +		drm_dbg(&ptdev->base, "%s domain already delegated",
>> +			get_domain_name(domain));
>> +		return 0;
>> +	}
>> +
>> +	/* Check if the command is allowed before delegating. */
>> +	if (unlikely(!(pwr_status_reg & allow_mask))) {
>> +		drm_warn(&ptdev->base, "Delegating %s domain not allowed",
>> +			 get_domain_name(domain));
>> +		return -EPERM;
>> +	}
> 
> We usually only use unlikely() on hot paths.
> 
>> +
>> +	if (unlikely(gpu_read64(ptdev, pwrtrans_reg))) {
>> +		drm_warn(&ptdev->base, "%s domain power in transition",
>> +			 get_domain_name(domain));
>> +		return -EPERM;
> 
> -EPERM seems wrong, -EBUSY perhaps?
> 
>> +	}
>> +
>> +	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
>> +
>> +	/*
>> +	 * On successful delegation
>> +	 * allow-flag will be cleared with delegated-flag being set.
>> +	 */
>> +	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
>> +				      ((delegated_mask | allow_mask) & val) == delegated_mask,
>> +				      10, PWR_TRANSITION_TIMEOUT_US);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "Delegating %s domain timeout, cmd(0x%x)",
>> +			get_domain_name(domain), pwr_cmd);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_pwr_delegate_domains(struct panthor_device *ptdev)
>> +{
>> +	int ret;
>> +
>> +	if (!ptdev->pwr)
>> +		return 0;
>> +
>> +	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
>> +	if (ret)
>> +		return ret;
> 
> Given nothing actually handles these errors currently, do we have any
> problems if the shader cores are delegated, but the tiler cores fail? Do
> we need to unwind?
> 
> Generally the error handling seems a bit shaky here.
> 

Will update this to unwind on the second error.

>> +
>> +	return 0;
>> +}
>> +
>>  void panthor_pwr_unplug(struct panthor_device *ptdev)
>>  {
>>  	unsigned long flags;
>> @@ -110,12 +414,94 @@ int panthor_pwr_reset_soft(struct panthor_device *ptdev)
>>  
>>  int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
>>  {
>> -	return 0;
>> +	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
>> +	const u32 l2_pwrtrans_reg = get_domain_pwrtrans_reg(PWR_COMMAND_DOMAIN_L2);
>> +	unsigned long child_domain_mask = {
>> +		BIT(PWR_COMMAND_DOMAIN_SHADER) |
>> +		BIT(PWR_COMMAND_DOMAIN_TILER)
>> +	};
> 
> What's with the braces?
> 
>> +	u32 pwr_status, child_domain;
>> +	int ret = 0;
>> +
>> +	if (unlikely(!ptdev->pwr))
>> +		return -ENODEV;
>> +
>> +	pwr_status = panthor_pwr_read_status(ptdev);
>> +
>> +	/* Abort if L2 power off constraints are not satisfied */
>> +	if (!(pwr_status & l2_allow_mask)) {
>> +		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
>> +		return 0;
>> +	}
>> +
>> +	if (gpu_read64(ptdev, l2_pwrtrans_reg)) {
>> +		drm_warn(&ptdev->base, "L2 Power in transition");
>> +		return 0;
> 
> Isn't this an error? How are we handling this? Shouldn't we attempt to
> wait for the transition to complete?
> 
>> +	}
>> +
>> +	/* It is expected that when halting the MCU, it would power down its
>> +	 * delegated domains. However, an unresponsive or hung MCU may not do
>> +	 * so, which is why we need to check and retract the domains back into
>> +	 * host control to be powered down before powering down the L2.
>> +	 */
>> +	for_each_set_bit(child_domain, &child_domain_mask, PWR_DOMAIN_MAX_BITS) {
> 
> This feels overkill for two bits... Can we not just put this in a helper
> function and call it for both domains?
> 

Will do so in v2.

>> +		u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(child_domain));
>> +
>> +		if (domain_ready && (pwr_status & PWR_STATUS_DOMAIN_DELEGATED(child_domain))) {
>> +			drm_warn(&ptdev->base,
>> +				 "L2 power off: Delegated %s domain not powered down by MCU",
>> +				 get_domain_name(child_domain));
>> +			ret = retract_domain(ptdev, child_domain);
>> +			if (ret) {
>> +				drm_err(&ptdev->base, "Failed to retract %s domain",
>> +					get_domain_name(child_domain));
>> +				panthor_pwr_info_show(ptdev);
>> +				return ret;
>> +			}
>> +		}
>> +
>> +		ret = panthor_pwr_domain_power_off(ptdev, child_domain, domain_ready,
>> +						   PWR_TRANSITION_TIMEOUT_US);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
>> +					    ptdev->gpu_info.l2_present,
>> +					    PWR_TRANSITION_TIMEOUT_US);
> 
> Does this implicitly 'retract' the shader/tiler power domains? If so I
> think it's worth a comment. Otherwise it looks like we don't actually
> know the status of whether the shader/tiler power domains are retracted
> or not.
> 

panthor_pwr_l2_power_off() will only retract the shader/tiler domains if
they have not been powered down by the MCU. In cases where the MCU did
power down these child domains, delegate_domain() will exit early as
they would already be delegated. I understand the ambiguity here,
hopefully it is somewhat acceptable.

Kind regards,
Karunika Choo

> Thanks,
> Steve
> 
>>  }
>>  
>>  int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
>>  {
>> -	return 0;
>> +	const u32 pwr_status = panthor_pwr_read_status(ptdev);
>> +	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
>> +	const u32 l2_pwrtrans_reg = get_domain_pwrtrans_reg(PWR_COMMAND_DOMAIN_L2);
>> +	int ret;
>> +
>> +	if (!ptdev->pwr)
>> +		return 0;
>> +
>> +	if ((pwr_status & l2_allow_mask) == 0) {
>> +		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
>> +		return -EPERM;
>> +	}
>> +
>> +	if (gpu_read64(ptdev, l2_pwrtrans_reg)) {
>> +		drm_warn(&ptdev->base, "L2 Power is in transition");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2,
>> +					  ptdev->gpu_info.l2_present,
>> +					  PWR_TRANSITION_TIMEOUT_US);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Delegate control of the shader and tiler power domains to the MCU as
>> +	 * it can better manage which shader/tiler cores need to be powered up
>> +	 * or can be powered down based on currently running jobs.
>> +	 */
>> +	return panthor_pwr_delegate_domains(ptdev);
>>  }
>>  
>>  void panthor_pwr_suspend(struct panthor_device *ptdev)
> 



