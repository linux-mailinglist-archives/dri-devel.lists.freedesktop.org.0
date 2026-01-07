Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D954ECFE817
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C243510E603;
	Wed,  7 Jan 2026 15:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="d3bg4FXz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d3bg4FXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FF810E603
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:14:52 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x3Bn43cL4lOCSWxXx2gnGFxz9segOR/vSJ0rFN5fg9lM6l8HK0hB6ZWWSwTDz5jAVXMqeXsfL4YagrkFjV0vp64ESdWbpxxmlL3TvUndHA/MuFIl2wmgWetHGzJYl4dZq1GR0Wu9Jt7QqXweYFtTzG5cQL4ZWnKn9pXMKFmSO1QuaXtBq9BXYYcMGvEF4/K1EI7kZseNtkPAiPqwqvhmumMQzgkW0bRAxgZsfoQmdhIa1C+7UbpjgH4P9SyZHJ+BBkr2td6nymLdL5U6Gzkb71yJBSb0slugfMCrwo8Xg2QSwXDCL7l4W3l6QUpwcbu5lWkY/b33MLKSiMJ6CrgLCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM7kgr1GxdWVzMMlOohatPmKvNwOF12heDJjqNIBbiI=;
 b=XJEZYAvv2EatXYsMWoYv28mqrBzF+hTsNR7Y5qhv+QpP5rBBF4xoeN+L6PBJqouTg9C4h8foRUXOD2Y9f6gJ4m87dFUApbAoFGLpKD+XBJl8k1kIqnIxuS1ASUJzEr2gq19kqfM4Su47JJVqumeltwA0YZvYiyL2Neq17f5CEn5Hr7qiaznrtWoE5h0M4Vs2S/ghyJtpjgHyWFw+TaE8lelfxVxLymN9fghX8K6lhVx9QgUJo2IA/rJ1cBeErLrCuTvRJS89rK4C7lPuIfDh/476Ra6EuqJjhLhjBCamvaxLR+RAJnqr6qI30Vqn3ho0z3tIQbud85YqLOVxXHJ7PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM7kgr1GxdWVzMMlOohatPmKvNwOF12heDJjqNIBbiI=;
 b=d3bg4FXzPMLTKAnvxCjeAVheHDgFK1BYCEmdMxsOBUAL+tL0yAlEY52ibeL6IZYX03QuoX0MkaBt6tV0GBrvqTQmrDjk0y+W3VBOqz1qv36SjzwEtRd7uUjknqNTHNV28zlpCKZPQp61+jdUMFeAxVseqKQ943CIgkk4Mv46vb4=
Received: from DUZPR01CA0250.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::6) by AS8PR08MB8568.eurprd08.prod.outlook.com
 (2603:10a6:20b:565::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 15:14:45 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::3b) by DUZPR01CA0250.outlook.office365.com
 (2603:10a6:10:4b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 15:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via
 Frontend Transport; Wed, 7 Jan 2026 15:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahIzL4M+jwZczVXxeoqb3KIPLVvtagHpuwVt+W8tik1W/aFbvyj9zZTAYgqoYU+qmAUGYHj2rqfIQ9EVcBrj/8QM+cl6QHN/pL059OtpLlEgg3Y3j1Cl2lCVTubnjqOHP5mp47LFa85je8K8bjzataHbCnnoVsuRA5qh3UYb4UN6BNubfZrLRqMkQGGJJJU6MwDdPmAa49zJO8jshkKzU1gi5boxIAGVQLxQt66B+avWHK6IaCmORZa/+Q7CZrV0F/jwxP+LuIhqh8k5PiId+Vl9NyuTd00mamASUEHc47gYGRY2oxJ5/QJGseIeQMaRS/Zp8H5PMhX+Mqx2/izpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM7kgr1GxdWVzMMlOohatPmKvNwOF12heDJjqNIBbiI=;
 b=pBu6oggfJkSWbPx8oKwvgdZwL2+cXKNI7uAuZMMpvyhmMjI2y9WtJm8E1v9SBsjDhaK/4gNdOpk6wyzHYIxG0Twn0q8YFxeD80Zk36AFYK9ZLKyjYZyW/ez0N9aPcu+lbMYG18lUR/hr+Vmw45QwQmqf67k8sqvrH0aDALmZ1xtHRTJc4FJEgHAfH89VaUKYjZxZN2NNYn8U9rN1jXDFfyxz2NTq5zXh8AefDcHnvEPGVhNRazdHa8Rpq3pWFN8K7PQJMCxu70yb1BIkveECPPfLXsAAX/FYIwcycd5cIQkyZbxxI+rOfjBOhIPP6vz2sdIGyO3t2rOL8nIWeytlbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM7kgr1GxdWVzMMlOohatPmKvNwOF12heDJjqNIBbiI=;
 b=d3bg4FXzPMLTKAnvxCjeAVheHDgFK1BYCEmdMxsOBUAL+tL0yAlEY52ibeL6IZYX03QuoX0MkaBt6tV0GBrvqTQmrDjk0y+W3VBOqz1qv36SjzwEtRd7uUjknqNTHNV28zlpCKZPQp61+jdUMFeAxVseqKQ943CIgkk4Mv46vb4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB4787.eurprd08.prod.outlook.com (2603:10a6:20b:c9::12)
 by MRWPR08MB11233.eurprd08.prod.outlook.com (2603:10a6:501:77::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 15:13:40 +0000
Received: from AM6PR08MB4787.eurprd08.prod.outlook.com
 ([fe80::dde9:c555:e55f:bda4]) by AM6PR08MB4787.eurprd08.prod.outlook.com
 ([fe80::dde9:c555:e55f:bda4%5]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 15:13:39 +0000
Message-ID: <a642cad5-fd6f-4d5c-8259-41e68d5eba99@arm.com>
Date: Wed, 7 Jan 2026 15:13:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-2-lukas.zapolskas@arm.com>
 <20251217153751.5fbc68ea@fedora>
Content-Language: en-GB
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <20251217153751.5fbc68ea@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::13) To AM6PR08MB4787.eurprd08.prod.outlook.com
 (2603:10a6:20b:c9::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4787:EE_|MRWPR08MB11233:EE_|DU6PEPF00009526:EE_|AS8PR08MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 24138ead-4fad-4468-2f44-08de4dff7c70
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ald6U2U5MU95aWJzNXR6RVBEczZxeHp4MGpjY1JUeEorSmZiV2FlaDNFMmxB?=
 =?utf-8?B?RGd6aS9paExHNWlHVkI0L2tmOTdUV2VTQ2w3aGZRUVZxUlQ5T0xOU3FDWnNo?=
 =?utf-8?B?LzRSZmhhM0hCYm82M0U3alc1Mm9veGxkdUZGZ2JMakZEeW8zbE90YmJDZDRE?=
 =?utf-8?B?ZXlicXpaYkE2cEVaWHBMQ2NWQUdNSTNYRXQyMW13ZDFxdTBrcGx1Y3RPdDFI?=
 =?utf-8?B?UGRDSDJsTzBPanlGODh3YWdiSGlOTFlIKzVyckdtRFV6YkxQSGFYbE02YlJP?=
 =?utf-8?B?S2xaeVpXbENIb2s3VG00MWFDVElRRGRFSTdBKzE4L1c5ZUZlVW1JaHBOY2Nw?=
 =?utf-8?B?d2E5ejJKU1NueG5kUnBkR3YzWVBoa2pEVEZwblZ4R0lOUXdKZEtJYUZpSzl4?=
 =?utf-8?B?bXAyZ1Bta1lYS1RyVG5IeWpKQnVaQk1UTTBwNDBZbkdrV3FqY01aQ2tVUzgz?=
 =?utf-8?B?UEc2R1VZRldNS0dyZENRQ0Z2ZnlhK3gwcnVLRXhYemdkakZiZlk2dGRXWTZO?=
 =?utf-8?B?a2dXa3ZqODBjaE5sRE5sV1lzaE5mZDh6V05tZ1c1WVlFaWd1dDBtdFgrbG9U?=
 =?utf-8?B?N2p5bFdCK01wM3RvTElVaUlhcUdnUUJKTjlBSmEwRXIvUFV6c01INkdnRk9Z?=
 =?utf-8?B?QXlkYzNkTkE0UUJyTUg4N3ZVMnM2ZXNnY0VYdHlXaWE5Wmk3MkpjNEhQTXVR?=
 =?utf-8?B?ejVJVjdHc3V1RlVoRUVieUtyNHhiMm9pbU9SaVo0OVNkVTBmTjhWWDJPU1hx?=
 =?utf-8?B?ejcra2E2eHVqSzZBa0MvcXhObUdCWjN6amRvTUcrL0w2bEFsVFoxYTFXemoy?=
 =?utf-8?B?blVkcXFMUmx1cCs1RWM2ZGlnZUdWWGE3bk5UVE5TOUZ1ZlZKbjMxbmRWWEpY?=
 =?utf-8?B?cDJmN2lhUWt1NVhFWGl6b2VydDNpelhUQzZxQ1lSeXNMVmZUcnk2aGo2aFJW?=
 =?utf-8?B?SUxvcWU1NmVGS2ZkbVA0dzVlWWpqUytPTXdUZjRCb3dYTDNlcFB5QzA4N0dv?=
 =?utf-8?B?WVdYMjdwY3htUW5UektiQTJYRXI5Z0JzWmc1cDcyZ2tCU3RNRlVvdjF4dWVT?=
 =?utf-8?B?YTIrWnFPSUdoNVVRQnAyRUJwcE5FdVI2TkJpMzg5QWpISmZac0tLaTJzRWkz?=
 =?utf-8?B?M2lyL3RCcmpDVTZDV2JuSEZDNWt0dDJtZEw2OG5DTnoxSEZWM3l3RFVKNnlv?=
 =?utf-8?B?eGRtQTQwTVlUT2FJR1U5Q2FUaytMMDhzK2hRZ1FXNllvWEtrMHNadmdpcFJP?=
 =?utf-8?B?VTRGcWd2RVVmcm1oRExwbDNDblNMVHVXaW5qTjdRcGYzMVcwdHJJV1JaQ1Vn?=
 =?utf-8?B?N29aQkdUcndETnVyWk5va2RwTnhtY3JBRkpCZnh6TlNFOS9VaDBqalNGVXF2?=
 =?utf-8?B?ditaUElSdkFMZmZreHB2Q2U3eURqTmR1K3AreEh2OGlwQmN5ZHdGRE9oVmNT?=
 =?utf-8?B?RGZHQmU3d3dBbHV3SmE1MzgzUDNuUHk5S2U2RUhRS3RrTnhiU3czeWdPdXR0?=
 =?utf-8?B?SlVEdzl2SGd2cEFoTm9Fb056VTRkeWdqVVh3TllZRFB1aDNWSmxQSmthZnRa?=
 =?utf-8?B?STVJVG9xNllkUXdLTklhdzhNNm1TSDgrbkk0ejlqeFkwNWxwWTA2TEhzVXQx?=
 =?utf-8?B?eDZnSG40Vmxia1RYWTZ5Wm5TSHJxZWNXckE5dUs5T0xBWkZ0ZThod3B5djZx?=
 =?utf-8?B?SmVmdXNBRzRNRUhqRTZJRUdkQ3ZUaXhmT0FPQ1AyZFYvZ3NQUHJmNWNxVkNh?=
 =?utf-8?B?UEh1a2VNM0s3TGVVN05tOGt4bUZLb1JidHVDTFRERC8zUHFDTjA2UENza0gv?=
 =?utf-8?B?SXZSWFJncmErSm5mdm1rT2gzWkF1UGtKanBOWG42dmJsaFBoeEY5UDdnM0Rq?=
 =?utf-8?B?UkQ0bWdrV3k0S0FHNHJRbTNhb1NlZjBJeGlkaXFHMlRkTEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB4787.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11233
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8993c548-047e-4efc-1052-08de4dff567e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|376014|1800799024|82310400026|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVhERVFSeWdVQm5ma2twMHZVYkwxK1JUTHRhdjNzbmU2RlNyRjhXa04vNDR4?=
 =?utf-8?B?NHhHaVk5eGZYcld3OFNqUTJ5ZGRYN3ljNnM0ZGJCV2RpSGRVU1RwajR6Wmg2?=
 =?utf-8?B?ZWtTbWVoZ29jdmE1ZU4zOWNtaHhoWloxSFBrQ0xSNExmZ3lUeC85NFljWW5B?=
 =?utf-8?B?NXZPYTgwbjdKRzcxWmtvaFF6enkxd0g5TEozTW1YcWRHUzhzd1hKY25LaEs5?=
 =?utf-8?B?UGNXOFhnaDdRalRRSDhmVER4UmxhK0NqVlRxWE9rQXBVTDVzMXBBbDF6ZlRL?=
 =?utf-8?B?MGFWeFF0SkJFdytERXhDejZ4VlRMZzJOREtTRFBpcGQyU0ZBTW0xRUxYQ3pX?=
 =?utf-8?B?SjE0bmJCN3RJZVdJWDYyWHRoMWVGNGVVRnVRWHd2c0dmU0ZnbXR0eGRvLy82?=
 =?utf-8?B?V1BMdlNLVGMzK2VpaHEzak1DK0xzVVZhWW93U0lHK01SVGltT0JNbTZsODZ0?=
 =?utf-8?B?cUdqd2o2Zms1TDkreXpWMUJKTW5OSTBBNEF6Q1FRbjNBbW9yRmpIalRGL3BX?=
 =?utf-8?B?V3FjQWxENFlaZ1cwYXdyU2VEL2JpT2R6NnFkVkp2SnE2WFdBNEZVdm10OFdh?=
 =?utf-8?B?aTFaUW9nNEs1OGFZMHF0N0lJcDVISUl1YnJMZGN2TmdMSVBMcm4zOHRvK0dL?=
 =?utf-8?B?di9mdFE4U3MrdmhiWXMrcXpRWWFPYjN0REpFK1pwdWxNKzJhNXdNUG4yZ3M1?=
 =?utf-8?B?WjdIWjZMdUxSczBNRVd5VXpXWGhKV0RZNVFIcHlJeFVlTU45dStDRW9WM3Yr?=
 =?utf-8?B?bi9tcFdMamQvUmtkNVY2OE5WNHBEZzZoS0hPS1ZFU0lkNEovTUlEaU1GQjBP?=
 =?utf-8?B?TEpUSTNSWGVUQlcwN0ZFMDhqbHExRjNSNG9iamo0RENTMm4yekMwam5yK1F3?=
 =?utf-8?B?TXlpLzFQaFRPMmo0bEFLMHdScWdOTStXazZVdHdNQmhlWmZJRGVSSDhsOTdL?=
 =?utf-8?B?c0R2RWUvUXNHYWNQMzFkWlJKcEwzV1JMdG9YMG94V2xBSlhPbXlNK2ZpeWhX?=
 =?utf-8?B?di9ydTZhWmk4ZW14K2ZySE1GT2d1OFVoRHZKV2VTdWp6L1VPRVQ3ZkU4OFpm?=
 =?utf-8?B?Y1JKekthSkhmWlg2UUJtNExvVE1nbHlrR2NGNlZ2RUU5eWJCSnpwSDlnS25l?=
 =?utf-8?B?U0FWQjNmYXhPUGFLK2tHcDd1RmJ3d05IZ3JHRmFTSXJqaVlaSDZXRFJHQjBw?=
 =?utf-8?B?TGpMK3BSY3pNYXJGbXhhUi9zejZmbWt4UlBQRGFDamEzYk5JbUZFcTNZb2Zq?=
 =?utf-8?B?RW5MVTlJbEFtUVE1T0F5L3phNDlrU2tlMTRrbzhWcEdVeVNhSnhKUVdXOHVN?=
 =?utf-8?B?WE9wWjhQWVc3ZytMQU1vQ1pDM1BJR1hoS21TSVRKNlA4anBod1kvN3RUd2dD?=
 =?utf-8?B?UkdLaWh1QXpRMTJYOWZXTW0xYnY1VHhDeXhxZ3FJTWJ1cEYrY20rVlNGMWFQ?=
 =?utf-8?B?RmkyYUhQajh0T09TZUoyMlo5SG1YN3dHeGVJUGNKZXZLK0Y4aTErRE9VeWFv?=
 =?utf-8?B?WlpWSDdlSXRDeW94anBUNG9uMlh4YjVkTDJxb08yaWZMMG5XU0lIVklFZ0tu?=
 =?utf-8?B?K1dLTGhubm52dnNSdjArR3NjVlMwZUJVYzFrYzd0aktZeTNDL04wT0FtTXNY?=
 =?utf-8?B?R2hKSWZ3T2h5SG1uT2FQSmczcmpvazJYUU1HZEJJWGpUKytWN3NtWnhHa1dB?=
 =?utf-8?B?YjJBcWJ6WUtrbW11eWFQRGlRQjZlRG9PcWZwUjgxbGxxUkhwUjVWY01MM2Rm?=
 =?utf-8?B?NG1MR09oK0pIek54R09KRi9WdjkzVjFUbWJhK1AxRUpCUnhncEZjcm4zTFBv?=
 =?utf-8?B?UjA4eWtzYkVNUHoyWVp5bnpVVGwvbno0TkViejQ0ajh1Y1dUQ05kQ3M0d0NH?=
 =?utf-8?B?dGFnQ1RpVGd6bzJ4eTdMUDlHTVROQUJJWWxCa2llTkNLendVY1VpUFdKY3Fs?=
 =?utf-8?B?bCtBR0xWcFdmK0gwVTZPalozbDJQdW1MNWRHM0dSY1VrQU01SWYvQnAwSnlL?=
 =?utf-8?B?RkJFbDdNNzRrMlRxKzdrbmFOdldjamRmYmpmQjB3ZHVpNzdwejc0eXdEbFRv?=
 =?utf-8?Q?7jk63s?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(376014)(1800799024)(82310400026)(14060799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 15:14:43.1827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24138ead-4fad-4468-2f44-08de4dff7c70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8568
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

Hello Boris,

On 17/12/2025 14:37, Boris Brezillon wrote:
> Hi Lukas,
> 
> On Mon, 15 Dec 2025 17:14:47 +0000
> Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:
> 
>> This patch extends the DEV_QUERY ioctl to return information about the
>> performance counter setup for userspace, and introduces the new
>> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
>> performance counters.
>>
>> The new design is inspired by the perf aux ringbuffer [0], with the
>> insert and extract indices being mapped to userspace, allowing
>> multiple samples to be exposed at any given time. To avoid pointer
>> chasing, the sample metadata and block metadata are inline with
>> the elements they describe.
>>
>> Userspace is responsible for passing in resources for samples to be
>> exposed, including the event file descriptor for notification of new
>> sample availability, the ringbuffer BO to store samples, and the
>> control BO along with the offset for mapping the insert and extract
>> indices. Though these indices are only a total of 8 bytes, userspace
>> can then reuse the same physical page for tracking the state of
>> multiple buffers by giving different offsets from the BO start to
>> map them.
>>
>> [0]: https://docs.kernel.org/userspace-api/perf_ring_buffer.html
>>
>> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
>> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
>>  1 file changed, 565 insertions(+)
>>
>> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
>> index e238c6264fa1..d1a92172e878 100644
>> --- a/include/uapi/drm/panthor_drm.h
>> +++ b/include/uapi/drm/panthor_drm.h
>> @@ -154,6 +154,9 @@ enum drm_panthor_ioctl_id {
>>  	 * This is useful for imported BOs.
>>  	 */
>>  	DRM_PANTHOR_BO_QUERY_INFO,
>> +
>> +	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
>> +	DRM_PANTHOR_PERF_CONTROL,
>>  };
>>  
>>  /**
>> @@ -253,6 +256,9 @@ enum drm_panthor_dev_query_type {
>>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
>>  	 */
>>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
>> +
>> +	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
>> +	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
>>  };
>>  
>>  /**
>> @@ -445,6 +451,135 @@ struct drm_panthor_group_priorities_info {
>>  	__u8 pad[3];
>>  };
>>  
>> +/**
>> + * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
>> + */
>> +enum drm_panthor_perf_feat_flags {
>> +	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
>> +	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_block_type - Performance counter supported block types.
>> + */
>> +enum drm_panthor_perf_block_type {
>> +	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_FW,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_TILER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
>> +};
> 
> I'd really prefer if we were not exposing block types as uAPI if those
> are not truly needed for the UMD/KMD to agree on things. The counter
> block knowledge exists in userspace (because it has to if we want to
> attach meaning to counters), and I don't really see the need to
> standardize it here. In my experience, any definition that's not
> absolutely required might become a liability at some point. In that
> case, I can already imagine new GPUs shuffling the block IDs, getting
> rid of some, adding new ones, ... If we have to accommodate the enum
> for those changes it will become a mess. On the other hand, if we make
> the block ID an opaque u8, it just becomes HW knowledge that the
> UMD/perfcnt lib has already (GPU_ID, plus other PERFCNT specific dev
> queries if some stuff are implementation-defined).
> 

These IDs are not being provided from the HW, but rather attached to the segment 
in the kernel. Identifying the blocks in userspace was much easier in JM, since 
they were more or less fixed in the layout. In CSF, on the other hand, the layout
can be a lot more dynamic, and it's not always obvious from the buffer alone 
whether a particular block type is available or not. It would require exposing 
more of the FW values directly to the user.

>> +
>> +/**
>> + * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
>> + * in a given block.
>> + *
>> + * Since the integrator has the choice of using one or more clocks, there may be some confusion
>> + * as to which blocks are counted by which clock values unless this information is explicitly
>> + * provided as part of every block sample. Not every single clock here can be used: in the simplest
>> + * case, all cycle counts will be associated with the top-level clock.
>> + */
>> +enum drm_panthor_perf_clock {
>> +	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
>> +	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
>> +	 * caches and the tiler.
>> +	 */
>> +	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
>> +
>> +	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
>> +	DRM_PANTHOR_PERF_CLOCK_SHADER,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_info - Performance counter interface information
>> + *
>> + * Structure grouping all queryable information relating to the performance counter
>> + * interfaces.
>> + */
>> +struct drm_panthor_perf_info {
>> +	/**
>> +	 * @counters_per_block: The number of 8-byte counters available in a block.
>> +	 */
>> +	__u32 counters_per_block;
>> +
>> +	/**
>> +	 * @sample_header_size: The size of the header struct available at the beginning
>> +	 * of every sample.
>> +	 */
>> +	__u32 sample_header_size;
>> +
>> +	/**
>> +	 * @block_header_size: The size of the header struct inline with the counters for a
>> +	 * single block.
>> +	 */
>> +	__u32 block_header_size;
> 
> Are those things not directly deducible from the arch major/minor? If
> those things are implementation-defined, I guess that's fine to expose
> them, but otherwise I'd rely on the knowledge that exists in the UMD.
> 

They are implementation-defined, so the sizes may be the same for several different arch major/minors
and then change for all of them. 

>> +
>> +	/**
>> +	 * @sample_size: The size of a fully annotated sample, starting with a sample header
>> +	 *               of size @sample_header_size bytes, and all available blocks for the current
>> +	 *               configuration, each comprised of @counters_per_block 64-bit counters and
>> +	 *               a block header of @block_header_size bytes.
> 
> Let's keep the kernel doc formatting consistent and drop the alignment
> on the field name (IIRC, it also generate weird indentation in the
> final htmldoc if we do that.
> 

Will do! 

>> +	 *
>> +	 *               The user must use this field to allocate size for the ring buffer. In
>> +	 *               the case of new blocks being added, an old userspace can always use
>> +	 *               this field and ignore any blocks it does not know about.
>> +	 */
>> +	__u32 sample_size;
> 
> Same thing for the sample_size, it looks like something the UMD should
> know already, given a specific config.
> 

Not necessarily. One of the use-cases we have is libGPUCounters[0], which gets embedded in applications
at a particular version with the expectation of it functioning in a forwards compatible fashion, i.e., 
running the application with an old version of the library against a new KMD. In that case, the UMD
cannot infer the size of the sample purely from the fields that were previously exposed to the UMD.

>> +
>> +	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
>> +	__u32 flags;
>> +
>> +	/**
>> +	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
>> +	 *
>> +	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
>> +	 *
>> +	 * For the same GPU, different implementers may have different clocks for the same hardware
>> +	 * block. At the moment, up to three clocks are supported, and any clocks that are present
>> +	 * will be reported here.
>> +	 */
>> +	__u32 supported_clocks;
>> +
>> +	/** @fw_blocks: Number of FW blocks available. */
>> +	__u32 fw_blocks;
>> +
>> +	/** @cshw_blocks: Number of CSHW blocks available. */
>> +	__u32 cshw_blocks;
>> +
>> +	/** @tiler_blocks: Number of tiler blocks available. */
>> +	__u32 tiler_blocks;
>> +
>> +	/** @memsys_blocks: Number of memsys blocks available. */
>> +	__u32 memsys_blocks;
>> +
>> +	/** @shader_blocks: Number of shader core blocks available. */
>> +	__u32 shader_blocks;
> 
> Again, if it's fixed per arch <major,minor>, I'd refrain from exposing
> that. And if the variants are truly implementation-defined, and we go
> through opaque block IDs, I guess we'd need another DEV_QUERY, to get
> the number of variants supported by a specific HW (might even have to
> be a bitmask if there can be holes).

The reasoning behind exposing these here is the same as it was for the sample size: 
an old UMD may not be able to interpret new fields from the other DEV_QUERIES to get this 
information. 

>> +};
>> +
>>  /**
>>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>>   */
>> @@ -1187,6 +1322,434 @@ struct drm_panthor_bo_query_info {
>>  	__u32 pad;
>>  };
>>  
>> +/**
>> + * DOC: Performance counter decoding in userspace.
>> + *
>> + * Each sample will be exposed to userspace in the following manner:
>> + *
>> + * +--------+--------+------------------------+--------+-------------------------+-----+
>> + * | Sample | Block  |        Block           | Block  |         Block           | ... |
>> + * | header | header |        counters        | header |         counters        |     |
>> + * +--------+--------+------------------------+--------+-------------------------+-----+
>> + *
>> + * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
>> + * providing sample-wide information like the start and end timestamps, the counter set currently
>> + * configured, and any errors that may have occurred during sampling.
> 
> Okay, that part has to be uAPI, because it's purely SW-defined IIUC.
> 

That's right. 

>> + *
>> + * After the fixed size header, the sample will consist of blocks of
>> + * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
>> + * header of its own, indicating source block type, as well as the cycle count needed to normalize
>> + * cycle values within that block, and a clock source identifier.
> 
> The rest is HW-defined (or FW-defined), and can be deduced from arch
> <major,minor>+queries for impl-defined stuff, so I would just treat
> that at opaque data in the uAPI.
> 
>> + */
>> +
>> +/**
>> + * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
>> + * hardware block went through in a sampling period.
>> + *
>> + * Because the sampling period is controlled from userspace, the block may undergo multiple
>> + * state transitions, so this must be interpreted as one or more such transitions occurring.
>> + */
>> +enum drm_panthor_perf_block_state {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
>> +	 * the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
>> +	 * the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
>> +	 * sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
>> +	 * some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
>> +	 * some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
>> +	 * for some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
>> +	 * for some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_block_header - Header present before every block in the
>> + * sample ringbuffer.
>> + */
>> +struct drm_panthor_perf_block_header {
>> +	/** @block_type: Type of the block. */
>> +	__u8 block_type;
>> +
>> +	/** @block_idx: Block index. */
>> +	__u8 block_idx;
> 
> I first thought this was the block_set, but it looks like it's
> something else. I imagine it's here to workaround the 128-counters
> per-block limitation that exists because of the size of the
> enable_mask field. If that's the case, this should probably be
> documented.
> 

The idea is to have a stable identifier for each block of the same type. For instance, 
if you have a sparse mask of four shader cores, the populated counter blocks will always be 
numbered sequentially 0-3 while skipping the blocks corresponding to the non-existent 
shader cores.

>> +
>> +	/**
>> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
>> +	 * drm_panthor_perf_block_states.
>> +	 */
>> +	__u8 block_states;
> 
> I'd rather make that state a __u32, so we're not blocked if other
> events are added.
> 

Sure, can expand this.

>> +
>> +	/**
>> +	 * @clock: Clock used to produce the cycle count for this block, taken from
>> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
>> +	 */
>> +	__u8 clock;
>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[4];
>> +
>> +	/** @enable_mask: Bitmask of counters requested during the session setup. */
>> +	__u64 enable_mask[2];
> 
> I'm a worried that this breaks if new GPUs expose more than 128
> counters per-block. I'm also unsure why we need it here. Isn't the
> ENABLE mask also part of the per-block HW sample header. If we could
> pass that to the UMD directly, we wouldn't have to account for such
> changes, because the per-HW layout knowledge exists on the libperf side
> too.

Checked, and it looks like we're not actually using this anywhere, so it can be dropped.

> 
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
>> + * period.
>> + */
>> +enum drm_panthor_perf_sample_flags {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
>> +	 * of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
>> +	 * the sample duration.
>> +	 */
>> +	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_sample_header - Header present before every sample.
>> + */
>> +struct drm_panthor_perf_sample_header {
>> +	/**
>> +	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
>> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
>> +	 */
>> +	__u64 timestamp_start_ns;
>> +
>> +	/**
>> +	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
>> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
>> +	 */
>> +	__u64 timestamp_end_ns;
>> +
>> +	/** @block_set: Set of performance counter blocks. */
>> +	__u8 block_set;
> 
> Is this the same as drm_panthor_perf_block_header::block_idx? If it is,
> we need to choose a name and stick to it, otherwise it's confusing.
> 

This is different. The block set corresponds to the PRFCNT_SET that's globally configured.

>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[3];
>> +
>> +	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
>> +	__u32 flags;
>> +
>> +	/**
>> +	 * @user_data: User data provided as part of the command that triggered this sample.
>> +	 *
>> +	 * - Automatic samples (periodic ones or those around non-counting periods or power state
>> +	 * transitions) will be tagged with the user_data provided as part of the
>> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
>> +	 * - Manual samples will be tagged with the user_data provided with the
>> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
>> +	 * - A session's final automatic sample will be tagged with the user_data provided with the
>> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
>> +	 */
>> +	__u64 user_data;
>> +
>> +	/**
>> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 toplevel_clock_cycles;
>> +
>> +	/**
>> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 coregroup_clock_cycles;
>> +
>> +	/**
>> +	 * @shader_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 shader_clock_cycles;
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
>> + * IOCTL.
>> + */
>> +enum drm_panthor_perf_command {
>> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
>> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
>> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
>> +	DRM_PANTHOR_PERF_COMMAND_START,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
>> +	DRM_PANTHOR_PERF_COMMAND_STOP,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
>> +	 *
>> +	 * When the sampling session is configured with a non-zero sampling frequency, any
>> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
>> +	 * -EINVAL.
>> +	 */
>> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
>> + */
>> +struct drm_panthor_perf_control {
>> +	/** @cmd: Command from enum drm_panthor_perf_command. */
>> +	__u32 cmd;
>> +
>> +	/**
>> +	 * @handle: session handle.
>> +	 *
>> +	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
>> +	 * It must be used in subsequent commands for the same context.
>> +	 */
>> +	__u32 handle;
> 
> I'll comment on the patch adding an implementation for that, but I'd
> like to understand if there's a need for having more than one perf
> session per FD. If not, we can probably drop this handle, attach the
> perf-session directly to panthor_file, and have all commands target the
> only perf session that exists on this FD-context.
> 
> Even if there's a need for multiple perf sessions per FD, I think we
> should make this handle/ID per FD to simplify things.
> 

The use case is to have both a periodic and a manual sampler on the same process, 
looking at different events. More broadly, since the performance counters may be 
sampled via an external library, this prevents multiple tools from clashing and 
preventing the others from working.

We can definitely make the IDs per-FD, that would be a lot simpler.

>> +
>> +	/**
>> +	 * @size: size of the command structure.
>> +	 *
>> +	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
>> +	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
>> +	 * struct_size) to the pointer and update the size accordingly.
>> +	 */
>> +	__u64 size;
> 
> I'm wondering if we wouldn't be better off adding multiple ioctl()
> instead of doing the demux here. That's basically what we do for other
> blocks (see VM_{CREATE,DESTROY,BIND}, GROUP_{CREATE,DESTROY,SUBMIT},
> ...). This would save an extra deref, and some additional complexity.
> 
> I think we have enough driver-specific ioctl()s to add a five more
> for the perfcnt stuff.
> 

The initial worry was that it'd be too much to add five new ioctls, but if you're
fine with it, I can separate them out. 

>> +
>> +	/**
>> +	 * @pointer: user pointer to a command type struct, such as
>> +	 *            @struct drm_panthor_perf_cmd_start.
> 
> Same alignment issue I mentioned above.
> 

Ack.

>> +	 */
>> +	__u64 pointer;
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
>> + *
>> + * The hardware supports a single performance counter set at a time, so requesting any set other
>> + * than the primary may fail if another process is sampling at the same time.
>> + *
>> + * If in doubt, the primary counter set has the most commonly used counters and requires no
>> + * additional permissions to open.
>> + */
>> +enum drm_panthor_perf_counter_set {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
>> +	 *
>> +	 * This is the only set for which all counters in all blocks are defined.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_PRIMARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will
>> +	 * have the UNAVAILABLE block state permanently set in the block header.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_SECONDARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will have
>> +	 * the UNAVAILABLE block state permanently set in the block header. Note that the
>> +	 * tertiary set has the fewest defined counter blocks.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_TERTIARY,
>> +};
> 
> Same remark I made for block types, I believe this should be opaque,
> since libperf knows about those sets already.
> 

I've erred on the side of being explicit, specifically to avoid breaking old userspace applications running 
against new KMDs. Since the HW registers are not necessarily backwards compatible, having the SW translation
ensures that this continues to work. 

>> +
>> +/**
>> + * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
>> + *                                           into memory shared between user and kernel.
>> + *
>> + */
>> +struct drm_panthor_perf_ringbuf_control {
>> +	/**
>> +	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
>> +	 *               modifiable by userspace.
> 
> Same formatting inconsistency.
> 
>> +	 */
>> +	__u64 extract_idx;
>> +
>> +	/**
>> +	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modifiable by
>> +	 *               modifiable by the kernel.
>> +	 */
>> +	__u64 insert_idx;
>> +};
> 
> I'll stop here for today, but I'll try to finish reviewing this patch
> and patch 3 before the end of the week.
> 
> Regards,
> 
> Boris

Thanks for taking a look!


Kind regards,
Lukas

[0]: https://github.com/ARM-software/libGPUCounters


