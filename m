Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083BEB13409
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 07:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C21410E0FF;
	Mon, 28 Jul 2025 05:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M46I+g+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D596110E0FF;
 Mon, 28 Jul 2025 05:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVSTvgBxe+Sk9TKLVRAcA0dIjgKdo45C71rWpFBREXM663x5kWKnyqX/XcWSzYnvRssWP+5Ae7YmDaJ26qOfgmRuBNGYKYkxHBLhV9F9S+tBBC1wEe57rvhIcQRcQ9jkIMmsGTNkC+dy+6jj8Ncm1NGV8OJ667NFAexrdjud/q8s3Ld9cafmEtpIIIGa7H+9Qz/ubrxr3ndtEJFYqit0M60mvOSBfEmXHoabUFJ8JRa5dHwsKbRkl04H7Q7zPu7dzCOBYVqB37wkie8xTK13JLxaZA5Mtq5qmL1/aGlLCRMaMYtgtEiz+NC5DF+qLi942kX6X2oQNNtFh/cztyTM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCPkrq53EzNBqZWUWEfIoTjueUFeTp7G0mv7LDBxDgM=;
 b=EzrV2qoX6PGTey6t60/puxmKWvHeGUGOKrvcAHhgwwtnMrHPXcj5hNigvpyc6WxLuYSprb5Oq/jTSzSU3uNiIs69c4vK5P6edTkoGYYfOYW5hDThz1F4RUR5eDlREuC/3mLN9h+Y9hzFmKPSSPPlEk/nuxENEFMQSdHxmyfnqh/vugUQfxLgZ8fbV8EXEbYBDpUxL0cqLcLA2pFuo/MBoSiHsqx1w5tnKNqa2978Du13+R1NMz+SifTWPdjzNLT3ZxE+2THAUF2p6fTI8A88rxlT1WkuMiv+J1g916+tmT6q+t7dCJeMxFRGQl91EAf5DPp9fBkt/KI6DYJiTMAEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCPkrq53EzNBqZWUWEfIoTjueUFeTp7G0mv7LDBxDgM=;
 b=M46I+g+Gb/lrP2A3rmrHsIzH4m2XK1Golhf53lPeHw6Q+n94IWFPFh1dPK3LNbpXWZo7+kGk1fP/9wZgTrZYekjKslklE3CxojUfUAf/CJeDhY7FpXsW2KImJNtl66NZmKnhyYCn9fH0Et0TM5OK+iWaV7+UjVgv05hq3QJHXgS9MqEjZK2EHnBWk2kAb7mCSG7Rwds4yk5sTBIdKe79kEHMeXPx8NdHVIp2axxpnoxfd65vTXVypz+/a2AYc+m5CEnJM3Fzf1sDk5jqwTxn28W6iEo8XeVova9ZoQUMxydc5ODLhq3eERO1vdx6X5M8XQ27ao39l7+TKvK3Tu+e5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8789.namprd12.prod.outlook.com (2603:10b6:806:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 05:12:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 05:12:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 14:12:01 +0900
Message-Id: <DBNFIAFL8LAS.1W647VD2TIFP9@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 17/19] gpu: nova-core: register: add support for
 register arrays
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-17-7b6a762aa1cd@nvidia.com>
 <D0DDB132-68E8-43D0-B7EB-AA607C9BB72F@collabora.com>
In-Reply-To: <D0DDB132-68E8-43D0-B7EB-AA607C9BB72F@collabora.com>
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: a48a947b-5e5e-4f9d-e17e-08ddcd954b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ty9vUzBqYTZySzJ0YldTMEsxUnVYYW5mRElzSjI5VlBFODJFVXE4dTRpZHN2?=
 =?utf-8?B?Si9ocnlwTExKUS9Wd3htbVBqdWd3c20ydjVPN2lDaW1TRTIxMTloeXFpdXVa?=
 =?utf-8?B?RVJGanRzMXpvRGV2cmVIbE5VUzlOSHEvWGlrTkxRdngrMEVBcWQrUDJSMkpx?=
 =?utf-8?B?Lzc2WVBvSXU1ZVJXTEh3anZXNHcxOS9GNk9DdnhOQmpzKzVENDZyWlEycEVk?=
 =?utf-8?B?Nk5tdElZUDJlNkgrVk5lV2dkNjFFemRlVWwwd3FYckdNbklYSUhKM2lBK2Nj?=
 =?utf-8?B?Q05tdk5vTjgzR2srMFFEMENROVZINUpNTnAzaTVndVl1Q3VZdlFjdG54V3g0?=
 =?utf-8?B?SlJzMjc3Q0xrbHZyanNWcjlteEQwQ3pIUzEzcktMUWVIQm5nUWVoUFlXcE42?=
 =?utf-8?B?QVZSTGEwRHNxclRPVUVpc1VOZ1UvdXRwOVRnTGVNd2tDWk1iSklDZjB0RjQ3?=
 =?utf-8?B?b0ZCU1JBQVlUTEl1QmVyd2ZDZ1Q5dlltNEg0cjRRMHF1bm9SSyt1d2djWVpM?=
 =?utf-8?B?SFcyalNMUTROYTlSZ1htMHc5RXpkMzFVYWgydndwVk91TjNZWnpzR2NjRFRm?=
 =?utf-8?B?SnUvU1AwTW04cGRxN2NKVkhmY1E2d3lFREJWMzJWZXFjU3Y4RDVka3kwL3dK?=
 =?utf-8?B?Q3dqVlZBUXNLVVgzZGFBM2xjb1JYQU9tNEdTcDVGL0dPNHZIbjhLNDZudWU5?=
 =?utf-8?B?c2tVZWZXUmFuRElyREw2UkNLVGdxNTZOT2p2RThwZHlHSmVLS2EwYkZ0SlJi?=
 =?utf-8?B?V1VaZWN4K2kzS1ZaWXFoQ2RrZkVGWHZ0aFNGK092OEJLWUVlcGttY2RXcVIx?=
 =?utf-8?B?RXpWcEh2UTc5ZnpDVUlwTjY4Y285TEV5d3Yva3dEbW5XQ21SYjJHbjVMZDNU?=
 =?utf-8?B?eGU0N1B4WnhWWjd0UVdrcXpNRXhpc1hFMjJrVzY1eDRvNXlaYks5RDE3NHg0?=
 =?utf-8?B?c3BnQnkxTThZYmVNSkNpclNmd0J0L1phODFscU1Lays2T1NBR05XSFoyeGtU?=
 =?utf-8?B?RFgrYmZYcUVtRGZiZUhjUXNjcVdBV3kwMVA0cUJjL3p0NnRKN0duQmVUMDZn?=
 =?utf-8?B?UERERE9NSitqSTZ1bmsrTnhTaEwvL1V6N0R0WG9EQ3cvWE1PVEYzS2RReGcz?=
 =?utf-8?B?a0lQaldYQkhhZnZsWEdwSWYxbE03MkVPQkpGQWNYNU5KZ052VVMyRnhOL3hr?=
 =?utf-8?B?WW80akRSb2lYOWdvODBKSmV5MEM3Y1BJWGtVZFd3RC9zWjNkWlhTdnVydExC?=
 =?utf-8?B?WnprbVVqWWFHNTN0enRrNThUcko5U3F0NFhzdXlGV3EzV2lhTkU4QkRlSi9K?=
 =?utf-8?B?MU4vUjk5NVh4MjZ1bXlBMXhwdUxtc0xZMVFXaDVGVUp0cFlNSDRWaFJvenpU?=
 =?utf-8?B?RklmY2J6dWpMM1N6MDErQkpNei9idkgyUzVlYlRNa0pSYkVpeE5DY01tYnA1?=
 =?utf-8?B?QkxUVjUrelVvWlNQdEhMVUtQMUowVkhMWE9rM29lV01kWWF1d2RENUY4RC9h?=
 =?utf-8?B?SUl3SngwdDYzc1V2WGlxQ3NmK0IzQUg3VU1ramt0V0sreERXTTNqRWtybWtP?=
 =?utf-8?B?VUszSEx4VGdJSi8yd0NOSXM2bUQ2TElMbGlwVHRtbFNPK0F2VUVobUNDNU8w?=
 =?utf-8?B?WTVYWUQyeDl2V0tmVmhsUFI2UzhTRklncXhKUGlMZnpFVHFOS0tITU5jQ1pQ?=
 =?utf-8?B?WlNtRGlkcXd2ZnV6TXJSRTdjd1JzY0tIMERQVGxJV3NMNVpBK1RDU3liTzg3?=
 =?utf-8?B?dVpIQU5QNkFBZ2tGTUFNeHhDa2pLS0hFVlhFQkJYZkZJMVVUWk9uUjhBN2I5?=
 =?utf-8?B?T3NRaTA0NjVseXhUbVFRc2R3THBFY3E5blkvTlRoczZOK1hGeUo1RlN3YUNh?=
 =?utf-8?B?Y3N1TmJzTHNyYjlzbXAvOU95Nk84azVXU2hqUWxQQXVCVnllMDg5NUpkUjNk?=
 =?utf-8?Q?PyGH0HP8uW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW96K1VxS2RWVUpwK2U3dVo4bWZmOUxTdW14eVJPYlQ3eCtNaW1SY2FLVFFB?=
 =?utf-8?B?WGZ0czFSTEZOUWgrNE1ZQ3VOeFVEbzJxaDl2ZUx5akVhK2R4MWtpeUV5ZGtr?=
 =?utf-8?B?dVhYNWY5UFBtS0U3Q1V5SmJaaW0yeTdwM2g5aG94a0IyYjlOSi92MnljT1Yx?=
 =?utf-8?B?Unljek5rT1pzbkF5QnpoSUpCSjVuL2J5L2FyVmNVV0p1Y3RFZTJVSGtWRlNp?=
 =?utf-8?B?SmdTSWZueXlIdi9QNWhvaEFVUnVxUFJwdnR4UjZtZEZ0S0dpaEFUdG1YbjBv?=
 =?utf-8?B?T1VvcmFGNUtqbnVYUmJtL2oyMU9hZTZhdUpybWpqWGlLdVd6RStxVGdjNEg2?=
 =?utf-8?B?M09lUmR6dTlBZXd6Wi9ScUZnQk9JemFxbXNtQ0EvTEUxeStmeEFFY3p3ZitW?=
 =?utf-8?B?RG04NCtpUXY4dHRqMkJJTzdsVVRZRUpaZkticW53YnRJZDBTOEg1T3Y3cmt2?=
 =?utf-8?B?SFRJZEtIekhTVzMrcWszaU1YVE1GdDd2MDRFWVVlTUN1cVVGcTZYZkMvSzBB?=
 =?utf-8?B?MGlRVWZURHFBZXVTWWxROEZMdEN0V0ZNTWhnYkVQNVNabFovR1JJSEFWR1kv?=
 =?utf-8?B?UHRJSXBxZEpQd3l1WVA2NEtvb1BTS25kTW1XRFQ3SGVRU1hJbGZmdVlydENo?=
 =?utf-8?B?eEZyaWJJeWpZSkYwRFR5cWNodEo5M3NxRnVYRGJsWk11dEdKYVl6Y2xEaEhV?=
 =?utf-8?B?KzE2azdhZ2wrZWUwUUtxbEZPbFJka1FmQUtBdnkydlRueW5KSFBURk5xajlJ?=
 =?utf-8?B?Y1c5b20zZjlvUlZQOUY1VlczVUJaQWtONFRFTU1zZHlGZkNqeDk2VTlZR1ZR?=
 =?utf-8?B?RWhUYWxMUURqQUlNSEQrZ3hJVTZYb3p2b3puZ0ZDcXdDcXJsTTJZczlkRDln?=
 =?utf-8?B?enJwN3lZL25BL3JlbTZFaGl4RWFrMWtvUGV5OVBZa01JVHk2VlVvQnZYaU52?=
 =?utf-8?B?NU1aZEJNcG9aRWt2K1BrWlZiR054aUNvQUQ4a2E0VmlocGF6WFdWeDNrRHFZ?=
 =?utf-8?B?YTVjWFVSVi9LYkdSeHkzMGxqZS9ZMFZuQm9SYVE1YURLNHFwMENaRjY4ZzFy?=
 =?utf-8?B?WlJoRFEzRjNZeTFFU3lEUTA5WEFvS0lsZFdQWGo5NlBjSFlsM1JVRzNkUXZM?=
 =?utf-8?B?a3FKQktHZzRPZXFTUlovam40NU5aOUpwMkZEV1FUU3kwOC9vQnJMQkc5M2Y5?=
 =?utf-8?B?ZWVuemtiUlZyV1FiZm5na1dGUWtTcTM5L1o5dG53VXhDR2o0RGIwdG9CRkZn?=
 =?utf-8?B?Rjl2S05WRGxnSy9LeXI0c2VzVlVUcmRQY0F6YjVQNHVLTUg2cFVRR1NDR2Zm?=
 =?utf-8?B?Rm9NaUNPUHR1V0RoVEQxdGxNY043clZYRzVLRUVDTkJGQUhqOGc2S1c4eXVJ?=
 =?utf-8?B?elQ3WmZ0NmxuaHpJT2JPY0xnckJxOTZ0VzhrZGFzYm5zS280SHpRWHYzeTJs?=
 =?utf-8?B?c3VleFNma1Z0OUZTeDZNUTl0b2ptY3RFUDdIcWVhMzhiQ1AyeVhxMGFTQWpj?=
 =?utf-8?B?K0xuTDcvYkpoN25rTEpqa2M2WmxCeW9JaTU3dW9xbmF4YmNUWTJ2dEV4Q2FS?=
 =?utf-8?B?amJDcXpoYUl3NFBrRldaOW1mdy85K1ByMytTUXo2TG1WSTh2L1o3enltWHk2?=
 =?utf-8?B?TTJTSlNISThpbk9QQVp2bVhrRE1NOS9aRk9LZFFHdUhGMU9kanZ2MjRsOWZ1?=
 =?utf-8?B?Q3hFbFdKdisxL0Q1enBEbzluL2NvZnhQS0c0ZHNTSWtseWRmWVd5TU52RGI4?=
 =?utf-8?B?M1BRaHhEb0JOMCtkUG8xTGlra0RUaGFGMWJLazQ1ZFZLQXQrNzNOanFtSjhQ?=
 =?utf-8?B?ZFNMbkJsaTJ0RHdEZ0VKODBtN0RzMXM1TTU5Q1UvRy92ZjNqcWg5MFBBY3Bt?=
 =?utf-8?B?Y25rdUZMVTY2clBmYU1LbVZ2V1k1ZCtlbHlpdkdBNzJEUFA0TDVCRHBPcG5y?=
 =?utf-8?B?MzNJdkM1L3pWUUdlc0RUTk9jVlFZZUJ1YVk0Yi9YSzlaNDNuWkl6UVBpNFJi?=
 =?utf-8?B?UWtnY0JBdG5uV1ZtRWU1ZlBLQUU3MWVPbHJRbTAyY05kQ3dSK1VoTGdlUzA2?=
 =?utf-8?B?aE5qdVlDS25qcUcrWk1nK1Z2SnBOdE1OTWhuVFJRTlp3dUVoN2FTZ1lEZVB6?=
 =?utf-8?B?Mk5vSDFnU2YrTDB4U0x1RmVzbEVjY2JpM3ZVTGhRQXhLTlZpNU0yQldiUWJl?=
 =?utf-8?Q?vs8+9cTacgUqHTjm6SWBM7jZgIvmx/qnWRSfMLdH/8Rj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48a947b-5e5e-4f9d-e17e-08ddcd954b17
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:12:05.3317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA2DqNYFcSas0IMpZz0bLHj1yX3DdMIJuwukEzjcofEiqIp+79te0eNU3SOnUMck8kmBz3RPuFiYrW7xKLWi3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8789
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

On Sat Jul 26, 2025 at 4:12 AM JST, Daniel Almeida wrote:
<snip>
>> macro_rules! register {
>>     // Creates a register at a fixed offset of the MMIO space.
>>     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt=
)* } ) =3D> {
>> @@ -187,6 +238,35 @@ macro_rules! register {
>>         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
>>     };
>>=20
>> +    // Creates an array of registers at a fixed offset of the MMIO spac=
e.
>> +    (
>> +        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] $(,=
 $comment:literal)? {
>> +            $($fields:tt)*
>> +        }
>> +    ) =3D> {
>> +        static_assert!(::core::mem::size_of::<u32>() <=3D $stride);
>
> Perhaps a TODO here would be nice, since you=E2=80=99ll want to change it=
 when/if
> this macros get to support non-u32 types (which is apparently on the road=
map
> IIUC).

There are many `u32`s sprinkled across that code, it would be a bit
tedious to have a TODO for each of them. And when we start making them
generic the code won't compile unless they are all replaced anyway, so I
think we are safe. :)

>
>> +        register!(@core $name $(, $comment)? { $($fields)* } );
>> +        register!(@io_array $name @ $offset [ $size ; $stride ]);
>> +    };
>> +
>> +    // Shortcut for contiguous array of registers (stride =3D=3D size o=
f element).
>> +    (
>> +        $name:ident @ $offset:literal [ $size:expr ] $(, $comment:liter=
al)? {
>> +            $($fields:tt)*
>> +        }
>> +    ) =3D> {
>> +        register!($name @ $offset [ $size ; ::core::mem::size_of::<u32>=
() ] $(, $comment)? {
>
> Same here.
>
>> +            $($fields)*
>> +        } );
>> +    };
>> +
>> +    // Creates an alias of register `idx` of array of registers `alias`=
 with its own fields.
>> +    ($name:ident =3D> $alias:ident [ $idx:expr ] $(, $comment:literal)?=
 { $($fields:tt)* }) =3D> {
>> +        static_assert!($idx < $alias::SIZE);
>> +        register!(@core $name $(, $comment)? { $($fields)* } );
>> +        register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STR=
IDE );
>
> Why is this @io_fixed?

Because once you index a register (which the alias does), you obtain
what is effectively a fixed-address register, so these are the correct
I/O accessors here.
