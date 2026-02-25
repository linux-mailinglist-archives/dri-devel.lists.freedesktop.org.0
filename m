Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GqqBwGLnmltWAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:39:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21121920D5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAF310E1B1;
	Wed, 25 Feb 2026 05:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="C35l4A/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409D110E14E;
 Wed, 25 Feb 2026 05:39:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3QNjpZLSDrcO0fXAfAg7KybRsgncOvPXmHFNGNss8kXSuBLr+VBkS2i+TygQv9xKE0ZU/OdDTvfUFdGG4YNP6J3NffFlQvMLLZE24bjecth92GHuQt5R5LGn96m72UvRYBccH7Pq7eu+7SJ+G34/NhtVOe87rv5pS502H8buo9dF5lOPO2/HSms956kFSM/s3W2ElaiB15VcwTRiR0O15DzjEpRHebPaUGjwPZhfOPmIZmm+o5wwYDwXHtST/aBrZIgZQH6Ze+MQLf8NIZ0KMNsuvjrSbCK3lf5US1y1B2ULPmEWdeJyGn2T5qX9+EKbEuU4Yj67kv7bdf1u+KZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MRyVCGymqkZlssLywbB6cWVHJpecDym47QTP5+TJLo=;
 b=rBHyTvG6LAVfGuq4+WWqkgV0U6iqKotEIPLhR7+P1MPQB0bQ6RIX9haNafBtOG0+r08zyk55XRq1rOBD2Sbr6lb/yCtkaEpKQRxoU8NjOBqHUa8jPxweqUBf6di9E7ReyZQo2k07+kM6JeDga5yLmV6qn9fBe/ybgdo87ovSsRKHgqWYLB3nSM33Bf7N6eoyX+nz+s4SE+GM+lqgWL85EcE2kT3ZLwqWRyEvSTBy1OLRFmt6g9lNCIrsdznLves28MCg1ucmibWIwSDjBCP/gwR9DOjdQUJSMiD6/pvFKJ8WLot7IePvXn9B6li05a1A+EIxXNyuoAyNH3rJQR/vAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MRyVCGymqkZlssLywbB6cWVHJpecDym47QTP5+TJLo=;
 b=C35l4A/Wdo6elaA5oMbC6MTiyUQamlqOf5czhQadkir+3GU7tocDCFpFp1vSaPU5fwVIuqoK6tQ2EIgFkBeQX7cqXxI5yUS38iIi52PRdjpdOQpq4L1YIkhKzrJXXdvEs7k/8nlBepgZtgRFv08UIZnxSGZBbGRp4Qs36U59bFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6230.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:183::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 05:39:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 05:39:02 +0000
Date: Wed, 25 Feb 2026 05:39:01 +0000
From: Gary Guo <gary@garyguo.net>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Dave Airlie
 <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Koen
 Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Nikola Djukic
 <ndjukic@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan
 Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Helge
 Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
 <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi
 <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang
 <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, Philipp Stanner
 <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 joel@joelfernandes.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v8 16/25] gpu: nova-core: mm: Add page table walker for
 MMU v2/v3
In-Reply-To: <20260224225323.3312204-17-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-17-joelagnelf@nvidia.com>
Message-ID: <129e9988ff8d3e8747f724fbcc88c5cb@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: a41f55be-6868-4d02-d15f-08de74302ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vO/lTmsfCmCrxhjlZUgn4cikDCU4YtZXxieoxzZEeEAQiX8bnMwkmNpjVUw?=
 =?us-ascii?Q?igeKm+hUAuq1lB/7LbngD6bdB0UeFpESPXzdJcYOdQ10TGusnzO7vpPONO7P?=
 =?us-ascii?Q?Lz4wnxJYSe/xq/9LpBCbRottTBvr8I0QVRuAgEYE4woFYUC26d7Kw1de9mpS?=
 =?us-ascii?Q?Rsu6lkEC4HNbkgw8InofFDvBQZXVP3c1JsKRKi5UfdgnZhh06R86JJPPhcL0?=
 =?us-ascii?Q?Gh31dA/4USnmqZ3Z9dZt2jFq8/eeOKTnFLaPB9ZR1qEXT63/OIdZ88hJtwhX?=
 =?us-ascii?Q?NNCTySzY8H7e/r9YIQ65MgF3XEsKtphZfA77P6JPeRm9rEj9+dYJP5/cr8N9?=
 =?us-ascii?Q?c+oM/Mfdp9kxKGXTbaX5X5ixyoh1M1QCQ72TGKU+o/KTM5xq6C5jkiFSzLF+?=
 =?us-ascii?Q?alZdJSK7bm4qy4EgxVA8+OWyfC4bEfs2Jadq331b+IJ0aXBFbeQz5y0iB1Fb?=
 =?us-ascii?Q?s12+dDyPHztlrlTPnTeSonJvHd+hgWU7lMgIULlZZiDNyD+CIGCDfvRZE9aA?=
 =?us-ascii?Q?W65cFC0z+rB0QMpO17KVg/uoijtj2skX+YDEDRpLKmUNwgwCk76TRfomnz7s?=
 =?us-ascii?Q?NBDxVllgvfLaxEAHTLv+WDvFBcieNgugfCMjVtaW3qLiBVRVpnCk4pxEqY9l?=
 =?us-ascii?Q?HgeP3qUmPPTMzUrNQy4Ym2oZBzHOCIs5hSht5P+4oiUvbuMIcxKRnablNZgq?=
 =?us-ascii?Q?WjyADYRtAVR0CwkE8OgxTPdu1fc9cNiI1Ax2unAi+Y0k85LGwPRXl0QQUYEb?=
 =?us-ascii?Q?jp4/cjltHkEO28PMEX+LeehA2T6y9MvdrOBKEDYGfmvXNVt9KlWA9rUtal+w?=
 =?us-ascii?Q?t2ApGC1XOXnkyPsvZkYvtpyBz6acDiUU2iUBvIvylT7tyExBsUjdCeQND++3?=
 =?us-ascii?Q?bvyg0YKj6U0YUOf1rKkMShhtE0sedCB6N1n6aE6EjTZNutYViDMrL9OqUL6k?=
 =?us-ascii?Q?ND8eh3NVCswsqm/je1vnijvxpOb6VNAnZvPyqLIJGVj5PFtRE+y9BwAGXoJk?=
 =?us-ascii?Q?K0cLuqJ7550+geSRCpQCF1sPN0j7n5xFYEtR7btvsyNYv4rUoMZL/aAg9cGZ?=
 =?us-ascii?Q?txe+deepRp0hj5VilETReof2+hVNtaKy4BBb+DsO7E5MuWG8aFcUDLX3Env9?=
 =?us-ascii?Q?7UsOqPgwpixUhNDNGIJUg94M7kdEZYqnXPIu2IUYPNUeO3M2k7+7WWmTCg6O?=
 =?us-ascii?Q?/r1Q5SFLqvd16B35TVhAuyQn2oc9cARWallG3XaaD1A13frTGyKNd2BEQ5dJ?=
 =?us-ascii?Q?U2QggtAzouY+YU7tXWELrAs1XmbrXvvOEGJfujvP4w6yUrxF/xApSgQWnRQ4?=
 =?us-ascii?Q?q9iw/XkatNCbWmB2PjlMld9t11W9nULTn5ZnDtuJim3rt7g6MH8fEUlgwLnQ?=
 =?us-ascii?Q?QCijlKAg6utccKH2/TCUifpeH/+2cYs2NPi0Wa24Pyg0kTB34BfGdHbSnGkM?=
 =?us-ascii?Q?Py+WEpOpJh5uyTdUfG1qCZoisWfCbZttGJ3ukH6RW/JE7EPXJhaD+aLhMvZo?=
 =?us-ascii?Q?aocUXu3cHhjg1FjITFN3Rg5N3TeZ/B7VbjDEwyg70kf0toumTD8ikRZ1xXrG?=
 =?us-ascii?Q?HWk8cKqpAAwNey0HOyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ia2vhG67n7LUXvL205qtSxIZtw++poRj2XHAe+joSxnv6Ofn14c0yJsnvoR7?=
 =?us-ascii?Q?XuknafFgkrRDenON0xOnmPiStApqdOWhjIpxcd4Fj5O4KpBmwaWneU6jXah2?=
 =?us-ascii?Q?VkEl/u/KZ7dFtls+/FF8Qz1ZqwH82DvkWhze0HCv31Gk9cPBjJgyA5icM6yk?=
 =?us-ascii?Q?cc0UoTLiDyqsgrOe4HW3X98dGrFYdybzC+vSeV+JA09ey3YKJLdhAfYqa/Z3?=
 =?us-ascii?Q?yjTiRomC8N8+3zk3nVjDYhqAab+srnCF/s+/NV0LPk41I3RDCbw1jHDaJj7N?=
 =?us-ascii?Q?UKS0IVRPi7poW0yAdPdH+VIxw9UeV+6VDi0EciPxA3RdrWaI8zZlASdkawNX?=
 =?us-ascii?Q?l3B1Nqp3jqloyvX8Qz90mTfZ6PAxJVHDjFLl7Z9NSVBEVSTXokEs5DMth2qn?=
 =?us-ascii?Q?ecF8Cl6zgb4nQBUQ18vIXgT60PtMSVuMig1tAMb4O+KRB70rNgnbQ7VCPRM0?=
 =?us-ascii?Q?+NR9eOF/WepduP4X6pufnRYIw8pOzO+E3fUUCNk6iC8bCdFp3STIBhgKRQSm?=
 =?us-ascii?Q?y3lF86YGObSEf2NotL0mAuLDDj6qKYpk9HuGw0Gn6MPwHzXNVWupP3NWw4QO?=
 =?us-ascii?Q?xLagYGKV/Ju0+QlnAH8PK99L/Dz3fbAeK6wDUquM9cLIXO8ImA9GBl6Lbv71?=
 =?us-ascii?Q?O0tjHFD7bYrIN7MImQF2l5FvUR33C1kOeyNTXXqVa1QQ8y33ybQg72qL8/Dd?=
 =?us-ascii?Q?B9uNkRbtjbjyTi4oUpWvG2V8Lz6MRVebmF9vKCo2cJMO3sY7kNA3W/DbPyV2?=
 =?us-ascii?Q?nlRkTZabHQ7XwNJ3fPfwiCf9fi/ziXcXcc77MI1m7z+JX9GS0NIVDR+7YuYp?=
 =?us-ascii?Q?lF5Q/Cos7U8LyGf0AECM6pgkhDLunj4BHEGKn33G2OZgeA/Z/bE/27kjZY4X?=
 =?us-ascii?Q?hiScbGTbsmOzCtRTNmKkzNQzIolM6kRAl6aI8mzSX1A6s8c+hKd4eNYlzz6D?=
 =?us-ascii?Q?nKvjddLWgcwq21f5XvfTBOnmmjdVxk5EZLkU5dM+qtCSPO+1X4WK6SRamjgH?=
 =?us-ascii?Q?6xDK0FoKo01KCBtp16D8KaMGF8ut4k5iJ1NKEv0XAvGseBrUkVILS/KPvkVo?=
 =?us-ascii?Q?UKpLMtt2JUYPn0Tw2OO/Bbx84mmEmbICzVCGs2XI8ePac6jbH20RVRDslOou?=
 =?us-ascii?Q?SHbdP6dZdNHp0fOFPRsCEfzKwH0TAFCWlnFG8qObdDADOa3p7YSCJWm9M6t3?=
 =?us-ascii?Q?lSqBHAVBU0B9qlXijZrrw2rW/P/Htr9cPjrEUTLAHbjq/KM1oX/JcwAiEB2l?=
 =?us-ascii?Q?RUwhZ1P8OQNnN/Z+QSuRnDt2JYASngXirTfNB7pzYjIp/q6mGwIJHGEhpRy1?=
 =?us-ascii?Q?qk3UDwFwgIRykjIogWvIHrWWgjho1fo6vkW1Cvk41RhCNKO67jrHGiceTU1B?=
 =?us-ascii?Q?CV0Lh2aR1K920lxwaGPX2Qgoi5GkDtGE6qU8rd75+KghpG9EEdmVI7RWkasn?=
 =?us-ascii?Q?1ZwxGAwB+aJqX1ZomS5q4sAD4FQDxhrDwEh4oDTQnmdrxT6lQX5DpJmeOfx0?=
 =?us-ascii?Q?YYcCtjL9J57HwFfE1AF0WjYWqTsCBu2zGA1hLJkGSQXDeQYS8lABYga1ImiW?=
 =?us-ascii?Q?JnnRfOjb9VIa5RCKx/IpVUkuoQfo00TT+1shr+eaiOrlJrIstKLLiJiGje++?=
 =?us-ascii?Q?fLmzqFdOvt66ZVCzxAQxtHeEvxk9kB4MvY+Up6ACbgt+HXFuuD6WBpmc8ja9?=
 =?us-ascii?Q?P1e6TwBxp9i9OTSere6eP5Ev0mLkvZu3ReEd+i5gG5PBDNVFYBYUK06OjPVX?=
 =?us-ascii?Q?1NTwtveCXw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a41f55be-6868-4d02-d15f-08de74302ec7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 05:39:02.6954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0i/bEP1YLOHt3BqCSCKQoYgmXSrqgmkn2q63OwKI4lQcRp7chaZvr8S8X2tn2zHSuoHoYfyPUvaj59yCK11GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6230
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[56];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C21121920D5
X-Rspamd-Action: no action

On 2026-02-24 22:53, Joel Fernandes wrote:
> Add the page table walker implementation that traverses the page table
> hierarchy for both MMU v2 (5-level) and MMU v3 (6-level) to resolve
> virtual addresses to physical addresses or find PTE locations.
> 
> Currently only v2 has been tested (nova-core currently boots pre-hopper)
> with some initial prepatory work done for v3.
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/mm/pagetable.rs      |   1 +
>  drivers/gpu/nova-core/mm/pagetable/walk.rs | 218 +++++++++++++++++++++
>  2 files changed, 219 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/mm/pagetable/walk.rs
> 
> diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
> index 33acb7053fbe..7ebea4cb8437 100644
> --- a/drivers/gpu/nova-core/mm/pagetable.rs
> +++ b/drivers/gpu/nova-core/mm/pagetable.rs
> @@ -9,6 +9,7 @@
>  #![expect(dead_code)]
>  pub(crate) mod ver2;
>  pub(crate) mod ver3;
> +pub(crate) mod walk;
>  
>  use kernel::prelude::*;
>  
> diff --git a/drivers/gpu/nova-core/mm/pagetable/walk.rs b/drivers/gpu/nova-core/mm/pagetable/walk.rs
> new file mode 100644
> index 000000000000..023226af8816
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/pagetable/walk.rs
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Page table walker implementation for NVIDIA GPUs.
> +//!
> +//! This module provides page table walking functionality for MMU v2 and v3.
> +//! The walker traverses the page table hierarchy to resolve virtual addresses
> +//! to physical addresses or to find PTE locations.
> +//!
> +//! # Page Table Hierarchy
> +//!
> +//! ## MMU v2 (Turing/Ampere/Ada) - 5 levels
> +//!
> +//! ```text
> +//!     +-------+     +-------+     +-------+     +---------+     +-------+
> +//!     | PDB   |---->|  L1   |---->|  L2   |---->| L3 Dual |---->|  L4   |
> +//!     | (L0)  |     |       |     |       |     | PDE     |     | (PTE) |
> +//!     +-------+     +-------+     +-------+     +---------+     +-------+
> +//!       64-bit        64-bit        64-bit        128-bit         64-bit
> +//!        PDE           PDE           PDE        (big+small)        PTE
> +//! ```
> +//!
> +//! ## MMU v3 (Hopper+) - 6 levels

I think this is called "4 levels" and "5 levels" in kernel MM rather than
"5 levels" and "6 levels".

Best,
Gary

> +//!
> +//! ```text
> +//!     +-------+     +-------+     +-------+     +-------+     +---------+     +-------+
> +//!     | PDB   |---->|  L1   |---->|  L2   |---->|  L3   |---->| L4 Dual |---->|  L5   |
> +//!     | (L0)  |     |       |     |       |     |       |     | PDE     |     | (PTE) |
> +//!     +-------+     +-------+     +-------+     +-------+     +---------+     +-------+
> +//!       64-bit        64-bit        64-bit        64-bit        128-bit         64-bit
> +//!        PDE           PDE           PDE           PDE        (big+small)        PTE
> +//! ```
> +//!
> +//! # Result of a page table walk
> +//!
> +//! The walker returns a [`WalkResult`] indicating the outcome.
