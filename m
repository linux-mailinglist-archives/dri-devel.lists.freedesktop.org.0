Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBFCAFA5B
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 11:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BB210E4F6;
	Tue,  9 Dec 2025 10:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="iDbIMaiZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iDbIMaiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011051.outbound.protection.outlook.com
 [40.107.130.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE62B10E4F2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 10:33:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kdEvmmCJ6GocWcaNyc60tCuq4ylSoDFYSFC2STw+5e85JkTtCw38TtEfc8clSRImD+5+t8tjWdbRb+FHl2PKLzrFBcjh9M/7WdbMsjUYBPN2hywa3LtAZjvjOhRofxJqgDVs+pePuGSG7j88xGZ4u2woAhsIZr8df8Vb9BFgy8nb9mERQSnaYomqb42BKcFYw2WdXkw1SbPr92hgVmJFKhsk83qs+vYpKYL5MazQoN9nrFr5Ufe3PwQtyunATXTkHQ/5acoX2W51lpgMowio6gaLq4zmlfw20EAThH2nc3YKCgn5f8o5DeoQcEI5rsMSAgWfkvhs7nz8OCnA6rwicQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXbk0FjgJyeS8Wj9ZaIgb6l+llhmVJcyBZtbKBE98KU=;
 b=n72F4DesSPITUBvN9FONPSfnqG0B96ToHLgQYkgyF4r8lxOA8m8DoD3e6ijctePXINUxkMW6NmLTPVhKwW8D+GTqhIsp/KtDc0sKGVjhPTA4CZEkzPJXzXbioHWKXGkoagYqrmpUnd/S04RfiHvGxo0At4UzlMZm5MImiV869YrH/y5XN1r2ZUnYjNKaQtdiMSfHMlyiP1wwaL81dPBUbYiNL8egtzW8jbYfyMPmvKNcWNcT6enbsqN94W5nAt/jT6phukSGk7sahOKlmvOc8tdrDeO4iV3GZ3hLWTMA6nA6H6UP76WaKg4Y8h/5eR1Fh5cckNKJ2teBXsOEcsQiJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXbk0FjgJyeS8Wj9ZaIgb6l+llhmVJcyBZtbKBE98KU=;
 b=iDbIMaiZPEk353VAbq2bWkM7bShepG4V3YiFR73UklhyKjF5p/nDPjpDa7IG69EoKVVsg5KLqu4Pv2hndJmlq8CeUhmOGX3ytLFkbEEFbQcI6L1aaOYyuxF7PKt/3fT9vLP24mxaZ36a/ShcUC7iCgaScv77F1HLoK/FYgLJi2s=
Received: from CWLP265CA0502.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::16)
 by GVXPR08MB10809.eurprd08.prod.outlook.com (2603:10a6:150:158::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:33:12 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::e2) by CWLP265CA0502.outlook.office365.com
 (2603:10a6:400:18b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 10:33:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Tue, 9 Dec 2025 10:33:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+oaQXPoBaICnwqn6l6vKDPiQ7OdScbnMRjW+sz6DhbwykCjWn/uhs5WJEYIQWn54QLVEJIZw6+4xcDB5Iq91MhWGYhupEPtTh+F9wOf9sZl2sT0cavEsyRTddIicC9Nytq/1ZblyJBxKwxYkc5Nqr+yQiavsgAAycTCtbOPocSE2YmLm65kjX93J5N2QKwLwaEp8YZeBgI/4IQOLEXJj8WS+cAn/eVnduvtgvfMVeu+n17jG86DTbaML3KTMgdPXe9Zcs2C5Mrb4EVotwXKnzYPL3xZJhdR58Q4jufO9jKE8ziis1KNZGGIkilS4sLIvfy6No089iKRXxsLismVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXbk0FjgJyeS8Wj9ZaIgb6l+llhmVJcyBZtbKBE98KU=;
 b=pSIai2NViBttx5hn7ogbXYzuMOaZ3Q04x5DJ1eyS5SwPe0LbYfkgWmiImA8Z+ExiQ7//yp7lVdGcKrNkq8zdtIfRXjUwZ2ZzKkh/P3iOVrttjyms7Jwx4ThSTLUtJc8l1Qk5yPEQyFCp6Svb6vBySPhM3sgvTlE1MmybydpyKtAen74kn1qKE6UNqNVqHPDgtSkv1Gv08y5qwXw83RLVWLHDYKo7zQ0Tafzo0PGOoM3NsFq0SiqERqcBMsdmEUSE2YLJs16EwbagCHOayLDfnKtjipMaVGXkMZGnRV01S0F1Z5Zo0p2shhPcwL+BUdh8B7t++HX1D+/VUSpw83LqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXbk0FjgJyeS8Wj9ZaIgb6l+llhmVJcyBZtbKBE98KU=;
 b=iDbIMaiZPEk353VAbq2bWkM7bShepG4V3YiFR73UklhyKjF5p/nDPjpDa7IG69EoKVVsg5KLqu4Pv2hndJmlq8CeUhmOGX3ytLFkbEEFbQcI6L1aaOYyuxF7PKt/3fT9vLP24mxaZ36a/ShcUC7iCgaScv77F1HLoK/FYgLJi2s=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB10205.eurprd08.prod.outlook.com
 (2603:10a6:20b:64e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 10:32:06 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 10:32:06 +0000
Message-ID: <8841e5f3-cb1e-459b-b480-f4e5b7dec3b4@arm.com>
Date: Tue, 9 Dec 2025 10:32:04 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Content-Language: en-GB
To: Chia-I Wu <olvaffe@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <15112867.uLZWGnKmhe@workhorse>
 <CAPaKu7SQP9jYmq5UCA98_YmO50st6ChBjYNjYNON7-YAWozzaQ@mail.gmail.com>
 <10765657.nUPlyArG6x@workhorse>
 <CAPaKu7SjBemV8AGrtr-n22_Pq-2CSmeD-eH+B=3mA0B_qLQJ=A@mail.gmail.com>
In-Reply-To: <CAPaKu7SjBemV8AGrtr-n22_Pq-2CSmeD-eH+B=3mA0B_qLQJ=A@mail.gmail.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB10205:EE_|AMS1EPF0000003F:EE_|GVXPR08MB10809:EE_
X-MS-Office365-Filtering-Correlation-Id: be53ec7d-dd6c-4712-a46a-08de370e5a6b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eGEyY2dTdUFUcWdLamh2ejE0VGZzN0QvUldnZmpFcU54cDlVMWVQS1gvVi9X?=
 =?utf-8?B?RkdwZUM0S2J2Q2pmNVlXWkMwMlUzVkk2NHNQZkkwQUR4eTdhRTZrMk1mb0FM?=
 =?utf-8?B?ZXFveFBHYUoxa1M2RWJQWmVjTmltZzIvU24yYThnNjlQU0dZWkZGRHRralhM?=
 =?utf-8?B?NFAvVXRhQ0JKdnoySzN1cGNqcGRwekdkNjY4NXVlMmJZd1R6b2dJM3ZFTmhM?=
 =?utf-8?B?NjZNYndENU1EV3RiQlVXWldJYTVTOC9OV2RzVnlEcVphZ3p0OHU0eTRyK1dT?=
 =?utf-8?B?S1Z5S1NPZDNhU29NUS9JMis5dGxHMVVnUTMwekl2elVxSVkzN3pVbmJMMVJI?=
 =?utf-8?B?dXdOMlEydVYvVDZIUXMyNWc5ZUVrYlk4YWZteGJCaHFablZzNXl3V0hCVGhP?=
 =?utf-8?B?N081dEtiV0ZhWTRZc044Ty9OM1dMcnZUNytsWmVVVXlSNEQzaGo2cThFczhY?=
 =?utf-8?B?MFdyMjJZbFpXRWx4LzA1SHNOL2N5UHJQYkJsMFM2ckIzeGl5YUxPU2lxejlY?=
 =?utf-8?B?RlRtVlZjR3gvWHNZbUFLaWRxQjNGRmNaYmVOYXpubTZFSWhYeFBoUkxXbU1Q?=
 =?utf-8?B?Qnp4dE96YURyblJvY3M4Tk1FOU55Mm15ZTkvN1p0S3doNkxYdFMrZlcydjR2?=
 =?utf-8?B?ZEtoaFJwNzZBQnc0S09QWUk1Z2dHMWo3emtqQXRkcUFXSGJqM0RYTmdrUDJC?=
 =?utf-8?B?YUZFa0JjUFNTY01oQlFIcFVCZ0hMTXBrR1Z4emVWTXFHY3BQZHJoOWM5N1k5?=
 =?utf-8?B?WTZUbUNhalIwdlI1NmJ1VXI1UVU0YkZlTjljZGNSQnMxbDlRbHhQWXBPT3Qr?=
 =?utf-8?B?THF1ek9GeWFqUDdpVFRqOVJoSTlCWHVwSDFzSWV6TEhmZkRiSVhYblN2ZFJz?=
 =?utf-8?B?UVhQL3lQbHYzaXpaMW0zUUhLRFhFSk5saFF5Y3crWlJFaVlaM1MxQ0VuY2Iv?=
 =?utf-8?B?c1c2WEN0azluYjRLcHhzQXhqa1pJVWZOT0M1SW54N1dhUkFDTlNMYU9xQTA0?=
 =?utf-8?B?KzdLcWpQbDMzSlArR0swbVp0OVVNMkNtMVJ3dnNUZU5JcU5qN2Fsa3dhUXlh?=
 =?utf-8?B?NmhOY25HanBzazQ3aGJPRi9keHFueStFY050SjFmRitOd08xZ2svcXdEdkwx?=
 =?utf-8?B?bXE2RlM5NWZVUEpNa3RpY0hxSml3U0JRbm1YeGd3MlJDR04rdnB5MjlRbEl5?=
 =?utf-8?B?U1ROWlMwOG8yd20xU041R1lrWkNLU2hZZWdrWnNvOUdsTUVGcTVHV1V2Nnhq?=
 =?utf-8?B?eGZBYWxwZ1RFUFNQMlZxNUR2UVRWdEhENUdMdXZQOGxmc2crM3FBNElRT25J?=
 =?utf-8?B?WXcraGl5Ulg0RkcySjU5MFZMWG1ueC92ZXFGN1A3QzBabThyN0VQRG9mdzhS?=
 =?utf-8?B?YUIvRHNDcG4rVSs1bzZRdHBXYWlyUGtSTHFsYWZNZzhzK3p3cjEzUmk0VjVv?=
 =?utf-8?B?SWpFc0kyZVFpcFpyVmZNUGFBZkk0MTR6QUExRVgxUlJvTHZFUkYrSVpZNFB3?=
 =?utf-8?B?ZlphaHJ6WVltQy8vai92MUNFS2pJelhJcHpZdGpzU21xL3U3WmFDcVQvWGh3?=
 =?utf-8?B?ZGJiTmlFSFRvTFZNTzdUUmZUZVNyRUFxTVdOR2sxdlV1K0xnL1FXVXJYd3BP?=
 =?utf-8?B?Wmh4djZmVXpSOG5iUjNscUVQL3ZHeWZLTXFENUNTUEltbG5SOXZvK2tvSFVu?=
 =?utf-8?B?MHo2RTZUMUdrd3JYQk5KRk5KNThCQTZzaERyemhWQUVnUWFVZUFjRCtQRkNR?=
 =?utf-8?B?Y00rQ1QyNnVSTDBjeDZWaUFaaS9QYTQydjJnNkg1aUM1ODNEWWlyRG80cTBq?=
 =?utf-8?B?Sm54MUYzYTlsVjVTdk5LblNKMTlqTWl2cWpNQnMycUw2VTd1VkV2TitvWmg2?=
 =?utf-8?B?NXdzOFBENk8rdklvcWFZZjR1RTFZbXRsYW1ZdnJaNGxacGsyWEJxeE9SM1lI?=
 =?utf-8?B?R0Z5VFhtWWpNNGVYZ2RWc0JBU3E2aFQvNG9DQnZPUlEwTnlVVE10c0VxaWI0?=
 =?utf-8?B?dUNsdEZnYXFnPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10205
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 95b491ea-e751-471c-d435-08de370e331d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|36860700013|7416014|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFNzcEdGRHpZZGYyQzVMT3JBRDBQZ3NRL3V3b3cxUHVvZWNKNFFlM1V5NC9L?=
 =?utf-8?B?dENwSkhTZjJzMDFkZXpFMnB0cFdwUTBkV3NnanFHUUVKRXdRV3JhOFdDZy82?=
 =?utf-8?B?ZDVBYytRM1RwMnd3Y29FODVKL205YnlaUDhBcXRXQUdBVEFpY1A1UUtRbFgx?=
 =?utf-8?B?ZEhFZHhlZGJrMGlPdWpnN2RmazAxalRWWnRnNGR5YmM1L3Nqa1NTM3gza0Fa?=
 =?utf-8?B?N0M3RWl6L3ZKNkZBSGRSUW8vMlJHSVFUTGlKalhhYTlVWUp6dVJNankwU1lq?=
 =?utf-8?B?aUFKemJEakZTMVdjU1JDSXpnRHhhM2hlaG5tdThyRFZrd0c4MXVuRlV3N1Vn?=
 =?utf-8?B?U2xTczREY2RMdGtXUXNCa3NvdUh1VUp3K28xUXRiTlg3VDJYVytVa1NMWmo2?=
 =?utf-8?B?TnpzT3IyTU9GcGJ0bm5Ba1QxQTE0UmNwSktGWm5FWW1uWG10Mml2eU5SeWRW?=
 =?utf-8?B?Qk9LczlrdTFWWTlVSWVwRktxVmMzMWV3d0puYk41ZTd2L2V5R2R5WmlORjdm?=
 =?utf-8?B?dmRHMWVIemcwZXN2cHIzbUYvQzFmRUI0M05BWXplenJSQW50YUZXZ3NUSHE0?=
 =?utf-8?B?cFl2cXg4eGR4cnB3b1ZHU3NoZ3k2WGpBbGRtTUtISDR1NENPaDVNOVR6clRO?=
 =?utf-8?B?L3NpVmFwdm9FSjd2eE5mbXZlSmIvdDJPdTFhSys2YnVobXgzL2dGZFNnVmNJ?=
 =?utf-8?B?UmJZMm01MDVvK0RJaEZJa2FhZVdEMGtlN1Z6d1RZOFAwWVo3VWMzQnBCRWY5?=
 =?utf-8?B?TmlKODNHZDlDay9BdVkyTjZIN2ZKSXpoNVdxQXZjODNWWGZKZEFkM2xaY3Nw?=
 =?utf-8?B?UzkrK2Nab1VoNFJZdmtpOVpua3c4UzdLVFNvSXhCb0lOU2t6UnB5UTRsTm9H?=
 =?utf-8?B?OVE0Ukh3WlBYWXNCSk1FbHJvRGJ5QU5YZTgxdW01MW5MQjdZR2ZIVHJ6dzFV?=
 =?utf-8?B?UFNjUjB3WjZsTkQyb0NrNUlGbytQUEV4c3ROUFZtajZjVnBqalFYUmZsd0Z2?=
 =?utf-8?B?NmpFelR1TDhRYUtuT1RqdVJMOFJBVlBaUnlGTUVlWmNjQ1ordUxrb2lKV3RN?=
 =?utf-8?B?UERKN0s1OWdNTS9MMGJUM2tISGJ6eFl1OG5ZOGFWZWV0alA3NXdPVkhNMTF4?=
 =?utf-8?B?bGY5bklDbThUNHZtS0l1ZHhIWk9Bc0FQUUM5ZjJjSC90bG45Z0kvVmQxNHRz?=
 =?utf-8?B?SFVEU285T1B6UGFFc3Y0TTVhd0ZyWnJkQVVSZVk0dC9Sck1Vb2xEeUgxWGZa?=
 =?utf-8?B?KzFnemRPMW0ydnZuTm9Kb0FRdTFWVlI5cEpjaU1Pd0g2WEhjODFDNVcwVzFO?=
 =?utf-8?B?ZmNYbVlRbGRRWnlZT2NtRUk0d0xWVUVkUitibGFPYzJFVUhMYUJEak5QZXFx?=
 =?utf-8?B?aFU1cTBJM1ByK3JDZGN6L3hHU1hXaWdFbWhXTVV3Nk5aMmlHbkhUSEZPdzhQ?=
 =?utf-8?B?cndzNlhRcHo0U3RrbkI0aWdLYnZpTHRGclpDNE10WmtBYTVteVdMTzhBUURs?=
 =?utf-8?B?U1R5ZWE5aDR6MXlmNjNMbkhWZzhKZ25UQW5TVDBxOXFJd2NxTGJiMkVBaHA0?=
 =?utf-8?B?dEFEVHNyRktrZnpYNXd5MmJHa0N1NG15bUs0OFVORGhFUUErbERWVHNjMEFD?=
 =?utf-8?B?cFdCMTg1RTdQVjdxVEdhWXZhbmJEYVQ4WWs4R2lFYWU0V3VyK2E2ZGlZUE1v?=
 =?utf-8?B?RUVRVENlem50U3cvbjNodVdjMUY3UEIvN2FncmphcXNrY1g5Z1duUlV1OE1m?=
 =?utf-8?B?RVoyMUszcHNzbHNrcmVJYlJEOHRGeCtRU1FqL1dJUDFxcnlTRkhRNjNTMGZZ?=
 =?utf-8?B?S1BFQzVEWVpsK29kQ0dERDN3TjRYYm5RMmVtT0tFd1pKU0l5ZmxjZXVKMnc2?=
 =?utf-8?B?TWpnTDVvL2NXMHg1STltL08zb09iZVhzOVNuMUdkbTN5UGxCNUVWblpiamto?=
 =?utf-8?B?MzFjSTlINStTZWxwN2VTNEd6cUV4SjBsaWQ5MUQvNmg5QWxiTEhwc3o3c2pv?=
 =?utf-8?B?QVUwTjR1eVVnUkoyNGNJNndpVUM0bU1oWTAzeFJXZWh6SGtUU2I1R3hBdGtw?=
 =?utf-8?B?ZmNVMnBwNlJuOVBQVFJQUExoZmt2RjlFLzhBRXcxNDU3MllwRURDa0pLUENr?=
 =?utf-8?Q?70Sk=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(36860700013)(7416014)(82310400026)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:33:11.7600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be53ec7d-dd6c-4712-a46a-08de370e5a6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10809
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

On 08/12/2025 18:28, Chia-I Wu wrote:
> On Sun, Dec 7, 2025 at 11:49 PM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
>>
>> On Friday, 5 December 2025 22:16:44 Central European Standard Time Chia-I Wu wrote:
>>> On Fri, Dec 5, 2025 at 2:48 AM Nicolas Frattaroli
>>> <nicolas.frattaroli@collabora.com> wrote:
>>>>
>>>> On Thursday, 4 December 2025 21:21:08 Central European Standard Time Chia-I Wu wrote:
>>>>> On Wed, Dec 3, 2025 at 6:04 AM Nicolas Frattaroli
>>>>> <nicolas.frattaroli@collabora.com> wrote:
>>>>>>
>>>>>> Mali GPUs have three registers that indicate which parts of the hardware
>>>>>> are powered and active at any moment. These take the form of bitmaps. In
>>>>>> the case of SHADER_PWRACTIVE for example, a high bit indicates that the
>>>>>> shader core corresponding to that bit index is active. These bitmaps
>>>>>> aren't solely contiguous bits, as it's common to have holes in the
>>>>>> sequence of shader core indices, and the actual set of which cores are
>>>>>> present is defined by the "shader present" register.
>>>>>>
>>>>>> When the GPU finishes a power state transition, it fires a
>>>>>> GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
>>>>>> received, the PWRACTIVE registers will likely contain interesting new
>>>>>> information.
>>>>> I am seeing
>>>>>
>>>>>    irq/342-panthor-412     [000] .....   934.526754: gpu_power_active:
>>>>> shader_bitmap=0x0 tiler_bitmap=0x0 l2_bitmap=0x0
>>>>>    irq/342-panthor-412     [000] .....   936.640356: gpu_power_active:
>>>>> shader_bitmap=0x0 tiler_bitmap=0x0 l2_bitmap=0x0
>>>>>
>>>>> on a gpu-bound test. It does not look like collecting samples on
>>>>> GPU_IRQ_POWER_CHANGED_ALL gives too much info.
>>>>
>>>> On what GPU and SoC is that? If it's MT8196 then I wouldn't be
>>>> surprised if it just broke that hardware register, considering
>>>> what it did to the SHADER_PRESENT register.
>>> Indeed I was on mt8196.
>>
>> I don't have much faith in the Mali integration of that SoC being
>> representative of how the Mali hardware is supposed to work. The
>> SHADER_PRESENT thing is just the tip of the iceberg, I've also
>> noticed while developing mtk-mfg-pmdomain that it seemingly messes
>> with the Mali GPU's internal MCU from the GPUEB depending on the
>> commands you send it, and can get it into a broken state with
>> enough luck.
>>
>> Check if the registers ever read anything but 0, e.g. by dumping
>> them from sysfs like this:
>>
>> ---
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index d1d4c50da5bf..b0e67dc17c92 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1678,8 +1678,69 @@ static ssize_t profiling_store(struct device *dev,
>>
>>  static DEVICE_ATTR_RW(profiling);
>>
>> +static ssize_t print_active_bitmask(char *buf, ssize_t len, u64 present, u64 active)
>> +{
>> +       unsigned int i = 0;
>> +       u64 bit;
>> +
>> +       while (present) {
>> +               bit = BIT(i);
>> +               if (present & bit) {
>> +                       present &= ~bit;
>> +                       len += sysfs_emit_at(buf, len, "%s", (active & bit) ? "1" : "0");
>> +               } else {
>> +                       len += sysfs_emit_at(buf, len, "_");
>> +               }
>> +               i++;
>> +       }
>> +
>> +       return len;
>> +}
>> +
>> +static ssize_t power_active_show(struct device *dev, struct device_attribute *attr,
>> +                                char *buf)
>> +{
>> +       struct panthor_device *ptdev = dev_get_drvdata(dev);
>> +       ssize_t len = 0;
>> +       u64 present;
>> +       int ret;
>> +
>> +       if (pm_runtime_suspended(ptdev->base.dev))
>> +               return sysfs_emit(buf, "Shader:\t0\nTiler:\t0\nL2:\t0\n");
>> +
>> +       ret = pm_runtime_resume_and_get(ptdev->base.dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       len += sysfs_emit_at(buf, len, "Shader:\t");
>> +       len += print_active_bitmask(buf, len, gpu_read64(ptdev, GPU_SHADER_PRESENT),
>> +                                   gpu_read64(ptdev, SHADER_PWRACTIVE));
>> +       len += sysfs_emit_at(buf, len, "\n");
>> +
>> +       present = gpu_read64(ptdev, GPU_TILER_PRESENT);
>> +       if (present == 0x1) /* "Implementation defined", just try to dump all */
>> +               present = U64_MAX;
>> +       len += sysfs_emit_at(buf, len, "Tiler:\t");
>> +       len += print_active_bitmask(buf, len, present, gpu_read64(ptdev, TILER_PWRACTIVE));
>> +       len += sysfs_emit_at(buf, len, "\n");
>> +
>> +       present = gpu_read64(ptdev, GPU_L2_PRESENT);
>> +       if (present == 0x1) /* "Implementation defined", just try to dump all */
>> +               present = U64_MAX;
>> +       len += sysfs_emit_at(buf, len, "L2:\t");
>> +       len += print_active_bitmask(buf, len, present, gpu_read64(ptdev, L2_PWRACTIVE));
>> +       len += sysfs_emit_at(buf, len, "\n");
>> +
>> +       pm_runtime_put(ptdev->base.dev);
>> +
>> +       return len;
>> +}
>> +
>> +static DEVICE_ATTR_RO(power_active);
>> +
>>  static struct attribute *panthor_attrs[] = {
>>         &dev_attr_profiling.attr,
>> +       &dev_attr_power_active.attr,
>>         NULL,
>>  };
>> ---
>>
>> If they always read 0 regardless of whether you're running a GPU
>> workload or not, then it's just not properly wired up.
> They can be non-zero.
>>
>>>>
>>>> On RK3588 (v10), GPU_IRQ_POWER_CHANGED_ALL reliably fires when
>>>> there is new information available in those registers. I haven't
>>>> tried on MT8196 (v13) yet because that still doesn't boot with
>>>> mainline so testing anything is a pain.
>>>>
>>>> I don't have any v12 or v11 hardware to test with. From what I
>>>> understand, there's no open enough platform to do v11 testing on,
>>>> just the Pixel 8 and Pixel 9. I could look into the Cix SoC for v12
>>>> though some day, but I don't own one at the moment.
>>>>
>>>>>
>>>>> I think they are more useful to be collected periodically, such that
>>>>> we know that in the past X seconds, Y out of a total of Z samples
>>>>> indicates activities. That's best done in userspace, and panthor's
>>>>> role should be to provide an uapi such as
>>>>> https://lore.kernel.org/all/cover.1743517880.git.lukas.zapolskas@arm.com/.
>>>>
>>>> This wouldn't give you information on the time a power transition has
>>>> completed, which is one of the motivations. A periodically collected
>>>> PWRACTIVE would just be roughly correlated to how busy the GPU is,
>>>> which isn't very useful additional information as the performance
>>>> counters themselves are likely a better source of that kind of info.
>>> {SHADER,TILER,L2}_READY might be more appropriate if you want to trace
>>> power transitions?
>>
>> Depends, the documentation I have access to isn't explicit about
>> what "READY" means. Is a busy core non-ready? Is there ever a case
>> where a significant number of cores are READY but not PWRACTIVE?
>>
>> I can answer the first question with some more poking on RK3588,
>> but for the latter a simple experiment on one piece of hardware
>> isn't going to answer it. Plus, the core being active will probably
>> be more interesting than it either sitting idle but powered or
>> actually doing work.
> From what I can see, *_READY are non-zero when powered and *_PWRACTIVE
> are non-zero when powered and busy on mt8196.
> 
> If you want to generate a trace event upon GPU_IRQ_POWER_CHANGED_ALL,
> *_READY seems more appropriate at least on mt8196. If you want to
> track busyness with *_PWRACTIVE, you probably need to sample
> periodically.

Hello,

Just chiming in from the architecture perspective, *_PWRACTIVE indicates
which cores are currently active and processing data, while *_READY show
which cores are powered up.

So in essence, *_READY might be more suitable in this case as
*_PWRACTIVE can be zero if there is no work running.

Kind regards,
Karunika

> 
>>
>>>
>>>>
>>>> What I need to do is restrict this to <= v13 in the next revision
>>>> however, because v14 reworks this stuff.
>>>>
>>>> Kind regards,
>>>> Nicolas Frattaroli
>>>>
>>>>
>>>
>>
>>
>>
>>

