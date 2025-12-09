Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A8CB0ADD
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 18:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2FD10E204;
	Tue,  9 Dec 2025 17:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="m3XTSJeY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m3XTSJeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87A610E204
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 17:11:50 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D/vu5nCIr6472dd54a/qwpXRPHdfYaQUzcUQfoX8xf+XQL1I+Q8ZgmNXHNF9X3vvOylgq+5imQEcP4BhrivaSGsc/kVvng/8t83Pu2qD5/6nxSVNGKHsNPD2W80qsrnmXyNpK351P7Jpmrk55j9lFf1hiAC2kdCEVSzMPTQEiap0pdf1mk+dkduomAovUpf/Onu4a9vgUCgfPpbGEpPMoxQ9QVT6G4IeMT2nvx/5IunIhexmN8gPYALBvtuei/qOF1PxdhslnVR09yNzzmnH2tSkY8RN2hsH8OhGqT0WEINL/SANjg72hHPm6KcfFvtu56z9Brrjb+L1qyb7PUX2xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NvJhrmJ2fXz3uIKvSp0ko4szTBYHzaEKov6/X8gbE4=;
 b=L6RilvJaVkA7QY5yudEqev08a2HHeOqi11vZotSQN/8MDc3miDrNOgrnWwZzXrba5hvHd+lnPcOUPosDipLxSiUHEsPJDADsC9/UfOGA2v11qHkYmm2UoEU7U8BehjBjxd1ru810sUnYnBLBZVUtM5irRiRdpQlL445ucF78ZnF2lA79IwKjw6H3kUpxIk/eqAvX+naCYIXaBQsBg91hMF5Aqm9ttj/HcGYl8q2S1jw1Gq+CWrhcCWpIwg4IwgHPqJlP8OcLmBjeFv4lPe/w7Gma+xHMhLymg8j77OBfuokGK/phL1ixsnCEfaUaRSn74iGfWAXbjcAj+XdRDLHvng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NvJhrmJ2fXz3uIKvSp0ko4szTBYHzaEKov6/X8gbE4=;
 b=m3XTSJeY9vSrvZt7si06SCfFiYlG2jAvJ/F20IdErBM5TW2qPXYFpVkYtS1vWV3Y/zF5AsAQOEof3BlH/RKrPhURe66bdFUgjxsXq2GZwq11TV63SQeCUa3tAHcLy1D0ZUmo9Pijbku6hAWGjzlN6ytJcd22HQa8GhFyvPqZwfQ=
Received: from AS4PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::19)
 by VE1PR08MB5616.eurprd08.prod.outlook.com (2603:10a6:800:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 17:11:45 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::a9) by AS4PR09CA0021.outlook.office365.com
 (2603:10a6:20b:5d4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 17:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Tue, 9 Dec 2025 17:11:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THBXKXuQRow79hQGAFhO19IpwuZWdZ1sdaj//HxRH9T3R32zGOiCXOpckQZR/Bo4GY2U+fmynbMeXAnkR2Y9GMcbJ6fned6DmzQkk9un9jqUK8TD/9MH+BJUoFu5rsI2kfbYQS1I2Xqd+7Lqv6qlR4ALzejMYGC5iA0vDumFuLy8woi2vqHeL8pqzOpRwa6swJerFSHk3cHT2Yv+Yc85Ci7A5fWKAibFBho0hx7/9GctPXa1qZ6y8z/OXKMc0KvCbi1DgMSNSLnlKMz3uhCN/xZQNGgIgHDFnMqiMxOGoZ1ZgQ8MATR/qwlIeAcniSDM/V+jN+MyI9UT9gFEsuN2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NvJhrmJ2fXz3uIKvSp0ko4szTBYHzaEKov6/X8gbE4=;
 b=Yq9i6FNQQbvpJFVzR9qxbhl1av1TJrjFSdIP6SFL07L8lktnk+uICidjJZC0ydhmV8rH9kfdbzCId7QCWmLiIQWrDQyD0F+OQWp1yri4z0s2KQlUvRadsHtb4WEPNoI/u/bYy83pWj0cwjNw3Ha+zEQj9c6wjto+ErzIMH5lBb3yzR/SAJS8HSuZIFEotir91GlXM2UtUfwJOWz/2thXgJKoZHfkdskFvA8YkwfiGtzFqoEg/hfLSUlj6LH7mJGap5KUUe7AybiBpTJHHvVPm/mbE2bjmXjJqWnuewmTqtZpurwb1tb/XVY1SijXHuc6J/tpA4c7d7Nzplpr1DyOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NvJhrmJ2fXz3uIKvSp0ko4szTBYHzaEKov6/X8gbE4=;
 b=m3XTSJeY9vSrvZt7si06SCfFiYlG2jAvJ/F20IdErBM5TW2qPXYFpVkYtS1vWV3Y/zF5AsAQOEof3BlH/RKrPhURe66bdFUgjxsXq2GZwq11TV63SQeCUa3tAHcLy1D0ZUmo9Pijbku6hAWGjzlN6ytJcd22HQa8GhFyvPqZwfQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6440.eurprd08.prod.outlook.com (2603:10a6:20b:33f::9)
 by DU0PR08MB7541.eurprd08.prod.outlook.com (2603:10a6:10:312::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 17:10:40 +0000
Received: from AS8PR08MB6440.eurprd08.prod.outlook.com
 ([fe80::c5b9:7014:641d:50]) by AS8PR08MB6440.eurprd08.prod.outlook.com
 ([fe80::c5b9:7014:641d:50%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 17:10:40 +0000
Date: Tue, 9 Dec 2025 18:10:35 +0100
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nd@arm.com
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Message-ID: <aThYCyJty16qCWXb@e129842.arm.com>
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
 <4363e055-c1f9-49c6-81dd-c2e5f8307310@arm.com>
 <3726594.R56niFO833@workhorse>
 <dc889696-64c1-420f-9f31-9f9ad730c807@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc889696-64c1-420f-9f31-9f9ad730c807@arm.com>
X-ClientProxiedBy: LO4P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::10) To AS8PR08MB6440.eurprd08.prod.outlook.com
 (2603:10a6:20b:33f::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6440:EE_|DU0PR08MB7541:EE_|AM2PEPF0001C716:EE_|VE1PR08MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fe6cec-6356-44e5-8ba0-08de3746077f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?SOgWnXEWFQSOiQPPWiubg7nRF3wsRpnjILqSSmXUUT2fvU4ZDlM/q+4O5vsM?=
 =?us-ascii?Q?osIVbgS+xOa0yz+YZ59MsTtzzxCZQEHaDbFUR2F28Ue1ZNOpCqTur36LlsW2?=
 =?us-ascii?Q?YvrBh0cZCwqijiVXPaqKNkh9FcXLrzMvJTo+lx+kJ7eCIB41tJ/hZatC8NMo?=
 =?us-ascii?Q?4MWOjbWJhyggPaY68/ebq81c94lUsxD7DbPyh7HTuC8ukUeBsWKNASSChbvK?=
 =?us-ascii?Q?aLbO70jr0X3gwicgYiwJSPkP+RFjyCXM/T3h+qw7drsfNB4OzQGjc8lzTq3M?=
 =?us-ascii?Q?ncPWuXBya/g480aiNNcUU8+L2tiOkalCfKy0v7PXXNpyBuzsT9G74IbUtHwr?=
 =?us-ascii?Q?Mh31ZZTYRHyMjhiN+FzdoxA8xLkDTCNImt9D4pyydLJXMOMpWDoi6dy5OwgI?=
 =?us-ascii?Q?bwFSDFbvQrqcBs8PJTh6kQu0W9F65NK35yJM5iUlXfIsEAZV0sx8aQJFLTd8?=
 =?us-ascii?Q?3wwq3rdsSt7uVvCRBfZOihVkJMbapGsX5NCbfQuEiuI7csR7L2x71ocsFifP?=
 =?us-ascii?Q?mSYjtonB3jL3znofezGCNb+lPffBbfWejEwQFyrcJeg+FTkenA04Ga8O2T3i?=
 =?us-ascii?Q?chSTdPeLwIoCl0rh3krGr1TVPUY0/ftz6y/rr5aQnCwvwTa0S8s29ysiczoO?=
 =?us-ascii?Q?xiE49h2adyHPMXozixW7b5g0UZmG77H5woXS9B3IN1VzDhgNcWmh+7fcgCmM?=
 =?us-ascii?Q?FhVJ9HD4cAY4QIkE1DH11H0pn/zVuGOhMFLOjPzQYiJRJ+kSZ4URtacpReyg?=
 =?us-ascii?Q?p6DbYcIkwGW8Hu1OPxMfsOpvASWF4loTNzxJ/4Jw+m6IUiiOLXTAXjdR2EHz?=
 =?us-ascii?Q?VFgJEEO3E7C1cH71tmRyKywwd8RRXmB5NRzp4hHuFN3VUZtHyNubfmRtdiA3?=
 =?us-ascii?Q?ySkIvNlkm7StnFuhw9x5pLzOZ9V3lv+c+/Y2f+Yj1E4KBzrEMRZbjk9F1rZI?=
 =?us-ascii?Q?mZFloZoDWW6xroufnRQpLG0f7FIH5iOY72PviNoy2cPSHtbXlwbU39+HuLz7?=
 =?us-ascii?Q?B8H68obDDGOPElaG/8Sm1Fp8bywa2jl7RKgYFtr28mZvs1YvYqiBKLApzUJz?=
 =?us-ascii?Q?lig8j3hZ/DdgcnQXGI8X+p575+rCOeXnLnyWKZhGH7XtSS6tXt34AVoMD/zr?=
 =?us-ascii?Q?zwJs0WdBmN1T91Trri1oGLqC5OKni2GSDb8g7Or9egJe+KeMe1QwOkNrjh8C?=
 =?us-ascii?Q?uacBWt11Wn1xow4NgzsfUb97MF4BPiGt2XuQHU8kK1JYciLEyqzWCZQqkpQk?=
 =?us-ascii?Q?GD6zVNh1yPC27bD7e3nwIam79irF9HOthIyV4niFDCZBeMFbsQL4ituS1WMO?=
 =?us-ascii?Q?m+EF1+eMBXSbk+7ZDfzuy3u0KQoUWma1WD5jGUe9CNLdZNSkDtwR0EbkEBjQ?=
 =?us-ascii?Q?zNIEm8l3sKp2EcKe6uJFNvezJ9e+ZcmMM9XN+fs8Dm+Vsnl3W/Ub8nkeEQ3d?=
 =?us-ascii?Q?h8Ny+6bD9uml6IUJsqj7ofr6kwnvwqmV?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6440.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7541
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad016a95-ca52-45b8-af41-08de3745e0df
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|82310400026|1800799024|7416014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u60/CThsTAi4eC6HsQQ9Eec9qQiRthIgTVKwC0AWeMJmQzkjcgCVAi5bP/sH?=
 =?us-ascii?Q?9hPNSocCe2sfkVfRlYSbUcAaCa6IxBf/my3i9AlfBUxsOx94/3nstyacdhMj?=
 =?us-ascii?Q?kfi1GVvFIsWdtGMJcFHlUNQdE81TmmPpbokfc1B9QoLrkbWi+XPzxDLbCzXr?=
 =?us-ascii?Q?NIfqYo9teGJt7oV8gcLHIifl6tgr7rHJ5BnmLDYQ8QY5EO5+pwencJVrBeFr?=
 =?us-ascii?Q?HfIfaN51Bnpn7/aZiXRDJ+oRETHSUACNuSFIpg/8nM72CYZ+gusKb371GRvI?=
 =?us-ascii?Q?vx1MvBrin6sWWC9q3CUawDtvJIWJ2uRMeB+cLOVmab0CW2BW4dbsM0pPW/Kh?=
 =?us-ascii?Q?Pv6d/U8pA9LYPoicSLWTSRZXg0Q0YTVLx8UkmPImtuWjU/PJw7k8nc36SO6Y?=
 =?us-ascii?Q?6i/2HJMw4qILPpp0mzIY01c8KKb8DoMR2ukzPeBRjgKgOYeIuUuPeBF68bDk?=
 =?us-ascii?Q?nOlX9MgIpJ2Rnnrsy0KeZi8cuzJzOlfQRoMl88ruCGh4LS8yztBLC539gM7O?=
 =?us-ascii?Q?S8rpVWqqIdxNYPd/EeCRhhvD66G0YFTptsh1QzaLZAjfoCtNOiOlywJMY3RK?=
 =?us-ascii?Q?VNj8ftz82vldfPuubIGL/v6TJyGuEikiLw4s9isYLf3JqzbGCW9C2/0qUThq?=
 =?us-ascii?Q?noXsLkZa0+PyMgRw36KZjiAQ+2rIIwKhWJ+jo/P70XOUzKD4eDpYTfAdeZEI?=
 =?us-ascii?Q?shUrBXhW9BXlJH3QZcwr8hHIOANk7MaR7RcDrqllYKINQmGWzQ2dK5d5YNGR?=
 =?us-ascii?Q?jyoCXPjl6ZfBUR5MAalp+EnLQpgt8byeZuo7ZVQGvNPBvqo91aY8Wm4vYckE?=
 =?us-ascii?Q?QU9VL6Q9m6fY0wdnXCzXWBEY5C3BgpwKzl1jqOoMah/4Bh1vnJGXXk5V+zFO?=
 =?us-ascii?Q?+RBxeDowM1dpX46Iapz0VlJiSlVx9jpk/d3Bahyn3dEZHktvp0GfpjPBgKCI?=
 =?us-ascii?Q?KGlQIhoTjN7+9zjqsebyxcQ9ppTFyKDTKJ0CH6yJAhuQUXe2n2m/lq6q3dhL?=
 =?us-ascii?Q?tXDJMNVRUB0Mnke0Zt/gG4M55oa7UEwhLYWSdFxk/LUWuOgp1CBDUFexGjkt?=
 =?us-ascii?Q?F9P/JLVrHCe2wiK+MoTWa/Ai1l09Vyl3jibvShRAqXmgNHkF9pOZNHn00P8e?=
 =?us-ascii?Q?9/gDm6NAvF3YNyCAMgFXQllXq6N/Af/YU+S0TBMuQohWX8s/MDwm00kZq9fM?=
 =?us-ascii?Q?nH4ihJh5wBs4PIhaDY/K03Giq6TjMVA9JDLQqmvyy9rhuaZkEn6BvRo89eW6?=
 =?us-ascii?Q?5HEoKawViFnbXXcXaUgToW0CZKpk/jqMaibI0olPQi1RFxpytTCL+VZ1jE/g?=
 =?us-ascii?Q?mCPJ2cD1q0jyKVi4LKjURiNWaJN8bNuf0QAxEH4O0V80c3WCRFF1lncHmCm8?=
 =?us-ascii?Q?TuZ3ozP9CPQswjQpNbl3JOAmux/cEjobUCLh6ewWPR5bAc5/pNJCilw9jyhw?=
 =?us-ascii?Q?2pYNN8WXY9utzLyo1ygx6L842Y0kkz+nskmDsq3/d6Ri3SFpwJMQ8WnSTHjp?=
 =?us-ascii?Q?LCyqIEZ6q47om+wfp+nr4r6qg1P9QEjCRT4pl/74JOcio/hF8/k6fy/VFLVx?=
 =?us-ascii?Q?5zXOogqXKoMWX9oLT94=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(82310400026)(1800799024)(7416014)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:11:44.5366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fe6cec-6356-44e5-8ba0-08de3746077f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5616
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

On Tue, Dec 09, 2025 at 04:22:15PM +0000, Karunika Choo wrote:
> On 09/12/2025 13:01, Nicolas Frattaroli wrote:
> > On Monday, 8 December 2025 18:14:53 Central European Standard Time Karunika Choo wrote:
> >> On 03/12/2025 13:56, Nicolas Frattaroli wrote:
> >>> [... snip ...]
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> >>> new file mode 100644
> >>> index 000000000000..01013f81e68a
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> >>> @@ -0,0 +1,38 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> >>> +/* Copyright 2025 Collabora ltd. */
> >>> +
> >>> +#undef TRACE_SYSTEM
> >>> +#define TRACE_SYSTEM panthor
> >>> +
> >>> +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> >>> +#define __PANTHOR_TRACE_H__
> >>> +
> >>> +#include <linux/tracepoint.h>
> >>> +#include <linux/types.h>
> >>> +
> >>> +TRACE_EVENT(gpu_power_active,
> >>> +	TP_PROTO(u64 shader_bitmap, u64 tiler_bitmap, u64 l2_bitmap),
> >>
> >> nit: if you want to add tracing can we also add the device name as
> >> well? Something like:
> >>
> >>   TP_PROTO(struct device *dev, ...),
> >>   TP_ARGS(dev, ...),
> >>   TP_STRUCT__ENTRY(
> >>           __string(dev_name, dev_name(dev))
> >>           ...
> >>   ).
> >>   ...
> > 
> > This is a great idea, will do. Any specific reason to pass the
> > device in the tracepoint rather than a const char*?
> > 
> 
> Nope, totaly fine to do it that way as well.

If you store any pointer into the trace buffer, then by the time
it will be dereferenced (TP_printk below), the object behind it may
be already freed. __string/__assign_str prevents this use-after-free
by embedding a full copy of the string in the trace buffer.

Cheers,
Marcin
