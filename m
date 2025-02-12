Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997EBA32210
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 10:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6562410E80D;
	Wed, 12 Feb 2025 09:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="mNzjOjst";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mNzjOjst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2089.outbound.protection.outlook.com [40.107.103.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888F710E80D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 09:26:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ul+LDKFmcIxOzOGD+SnLxBmMgdQoE5myOMZI5sSdZYIaJ0k5AfZ+NI0RA2F3jB9eH/P8oKUfuR8M72pCbugfrf+jU9WduGZeBhomaGxQi1x9ZZ1JZ2oaRnN7SoCeIR3wAx+nW0M3/gKzAk3kEZHYah4BmLcN7l/2pQw45gJ3/P2QD32SKfqU/TVJ2tbHGTqqqm8MhAMA9H86g46LkKJ+DVrUNAlAbEdIiUMcVMjZlxreNhM3z85Ye8ildLUR7VnTwXbqvieXQggASo7MmLZ4pw8dU6ITiEwS84K7R/ZjFOEHxJx/1b5loysNfyXl24EtoRwjXYXbJeXMENpTwmZFaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDR0tQPIipOTC4/8DEoG5zZvxLrIaVt8xMEEEZkOXhI=;
 b=raQWDXSN1z1xbmjNngWMQuB4+7fwoGfNwnvz7G7sUnew78geXUK/LC6EYjQL26A5Ito55LCNEsQ/TI+8R3dd86WBMTTJ/GJWPNY+w5XaH1fCYJpLatDh/MhkpnGme2gvnSDSP87BMxqkAz0QY+6CzlsgE53qbpFe0K8hXnSFJNbyiyM9a3thEMprpfOwX88HbQApk6vlhNGMtER3kUo0fooNTLn0uuEEpc1xj2NdgmOM8CxnV2FdLk9oj47amI7kvxfO5AfynkN53ZDv6w9wlvjEzBteKTa2WRyc7I42j9YKSde6jZjtg1sxPMvDCH8LuER3gBYsncGplwiAFp0gTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDR0tQPIipOTC4/8DEoG5zZvxLrIaVt8xMEEEZkOXhI=;
 b=mNzjOjstFIKNen5PJBRYyrY74frLTZkG5Yvqw4L81RAgV+u0u+efTxWRL+j0V5vmrTk74QZF0Wb9rsGwR3W9yva1FQQ7ySPJJDLw3810JbjId117XdRORspxmakttj5cL3kqDj+NZYai+OhrOdKuhDHqYgqtZ8X0wCinSTUZoLs=
Received: from DBBPR09CA0047.eurprd09.prod.outlook.com (2603:10a6:10:d4::35)
 by PAWPR08MB11142.eurprd08.prod.outlook.com (2603:10a6:102:46c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Wed, 12 Feb
 2025 09:26:11 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::65) by DBBPR09CA0047.outlook.office365.com
 (2603:10a6:10:d4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Wed,
 12 Feb 2025 09:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 09:26:10 +0000
Received: ("Tessian outbound c79bb2535b53:v567");
 Wed, 12 Feb 2025 09:26:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a938930bd7b7cfa
X-TessianGatewayMetadata: 7sjr9e34811stZqunmzXcq4Yuy3GpcaOqG0any+DrL5mv9ukbM6LgxYPiKP0uCCWmannYf0XnnfLiCL22dbcD4PUKvuveVDcZL+dMHA2caL9m/qbE7J3WCeDVCjRHLAxgW7gQlgtWhdKqng2f8SE3dTi2hU44dzq2b+WAF+Bhdg=
X-CR-MTA-TID: 64aa7808
Received: from Lb94be632a59a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9D3C303-6AF8-4455-B28A-281C8B9338AC.1; 
 Wed, 12 Feb 2025 09:26:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb94be632a59a.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Feb 2025 09:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8HvFL8w8NbH2ZlNYFFVjRQlHjjKay3USGYYkK/J6PDBI6DrqXFfYh5KZ1dumEhD2KX3U2P5UGhf8FmR/Je9gq/UKqKVL4r2ARORHjQU3/SSPFHqWmEwrrLvI8DxlnXU2D8loYkkqoxz98A9c/HNyJ1z3kVKwk2qSZn3JKQMXOyi9BFKuIwydfDfvtsamyxQwUJ8TICDYEqnXlCpQHIX3RHmESDUzV6L6SyGa2Py8pzz56V41V911D16+gdDQ+O60quzYPas5G4mztkPQG3u6WnzwooYWqvuDe6Jww//XqKFkrR4hnbv594ssvyvYkkyiZWrwAp8NMQhX7rmCqMWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDR0tQPIipOTC4/8DEoG5zZvxLrIaVt8xMEEEZkOXhI=;
 b=nUKJciV8DSPSWQSo3oBmo737OyPsvfbMMixtCWcHsJhmQ0Fek3UfQyzRrVvCvY1g0p5wBnCImyTmSlh057iKOt25Dsi0HzViijC7AN7am/i59RdH1B+5sFPmIqLO2KqN6x5o12L5WgD+s5pootf3WNUINUFO3kKp4RZ1Q2bm761nef2diKxvqhjO1w7jvwOh9hb3nNBQ9MHA88eJvuRMO+8VvKjd7W+9LdO0GVeeRsHrq2kH2+rzrpdjXsRu2mhzhTu3CENDXh4HMI6n63ppnal8T27PURQSAVCSjLhcewQfcKTMotnH+FR62U6Q/gaQMU0BZscRVM1vOIGm/Z+ZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDR0tQPIipOTC4/8DEoG5zZvxLrIaVt8xMEEEZkOXhI=;
 b=mNzjOjstFIKNen5PJBRYyrY74frLTZkG5Yvqw4L81RAgV+u0u+efTxWRL+j0V5vmrTk74QZF0Wb9rsGwR3W9yva1FQQ7ySPJJDLw3810JbjId117XdRORspxmakttj5cL3kqDj+NZYai+OhrOdKuhDHqYgqtZ8X0wCinSTUZoLs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 09:25:55 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 09:25:55 +0000
Message-ID: <02603a3f-73ac-46b7-a53c-744dc33555db@arm.com>
Date: Wed, 12 Feb 2025 09:25:54 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to Mali
 Valhall CSF binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
 <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
 <4b9deab1-e330-4c93-8260-75276c2bc9ff@arm.com>
 <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
 <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
 <922691a1-10d0-4ff1-a174-a456235e6487@kernel.org>
Content-Language: en-GB
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <922691a1-10d0-4ff1-a174-a456235e6487@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0373.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::18) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|AM7PR08MB5381:EE_|DB3PEPF00008859:EE_|PAWPR08MB11142:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3e310b-76fb-4634-f224-08dd4b47499d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NjdIUks5d3NHTDcyNTA3RE9RTml6bTJ2a09sOXVZa1MrVEtWcjBhL2Z4WUdV?=
 =?utf-8?B?dkpENzUrMGJ2QzVGNEFJUHdaeE16RGc3ZWIvSC9VM3pqaC9YTWROVk9oWkJr?=
 =?utf-8?B?YUlhQ0ZYeGtoTWtnaGtna0Q1L01WTW44VStZcVpVNlBaVWtsK3RKbGtaQTBp?=
 =?utf-8?B?UlZ2bURadkVnc2Myb0VNRUU3Y2Z4RU15aDFmekdQQmJhRENUcmVnQ2FKeDVl?=
 =?utf-8?B?NFRpRitwTGZQN2tjYTNyVnVtTWNTNkxKcm5lNG84OG5xTTcrbVVVa2poS1Bx?=
 =?utf-8?B?ZjgvbG9qbEduOW05ME5LZElQK245cE5SWmYxaXdIbk9mY3cvaE8rSEgrWVdL?=
 =?utf-8?B?Q1NaaWJuME1yY2xZNFQ0MFJIWEI2eUlqWlFkWWd2V0lXZ3paZE9taGZXU1U3?=
 =?utf-8?B?Y0x1T21ncnNYZEcxMU53RUhLZHcwZzl3d1hEK3RqTWkzRHJob2pwU3RDelV3?=
 =?utf-8?B?QXRzVlZzZEorSmFtVVF6QUF1MWM2RFlVM2tpRkJPMEJVUFVwWndCZTFyM3FM?=
 =?utf-8?B?ZHVKZzI1SXAzWXE5NlRpbXA4YkZlem94M1dtSFZOWnBmNUpwTU9Db015cUY5?=
 =?utf-8?B?VVNlcFVLamdhNmI4bE9aKzhLYkpWTTF4Mm9ha2FvZ2Z5Qlk1aGdWbFZCOEFS?=
 =?utf-8?B?YjBrZmIveGl3SUs0bFNWR1NRbVlWa3FkM0NCeVFhWUtFeEZhbWoxRERzUGVH?=
 =?utf-8?B?UjF3WG9VcU1paXJYK254V3N0YXdvTGxsRnVDdjFwSW5XU0xmdU1ucUc5Y1Mz?=
 =?utf-8?B?cUUrSGlZRGl4T0o0YkthRW95Y01VcUVRTEdyWnhtd1J4eDc1WE8vT0NLSjBF?=
 =?utf-8?B?cUVZSjBhYThoMUM4MjM0dS91R1pIN3J3bk90azhKZEJWdnZMSW5Ra0QyYUw5?=
 =?utf-8?B?cHhDcWJ3MHg0NC9GelN3dFNpcXc5cS9mZVp6cUc2TWZsdzFDdmo0dDVEZTNv?=
 =?utf-8?B?ZlpNbE1PNE1nTTVDT0dWS0RuTm9FTURQelp2Rk5CeHhYK1YwRGVZU3BtUzZF?=
 =?utf-8?B?RlQ2NGxRdVo4RFhtYkhtY0dLUEdHSCsrRHlWRXRIcWRzdGRxVzNKV3pzTGd0?=
 =?utf-8?B?WnJoNW8vUC94MUtNWi92cGJnVTMyQ1UyUFRoREt1cVR1cUdzVjJObnJjcG45?=
 =?utf-8?B?QUwyT1JDalRiQVY5OXFUVjdLVW1DTlZlNzJYNENZaFVVbk1CaWpFWk5HUXhP?=
 =?utf-8?B?NU9TUzhZRDVuWTM0dms0NGxSSFA5ZzdlbTdxUlFRQmxBZHpvTDRqaWpZZXpu?=
 =?utf-8?B?L0xKTjBsZDZGVk9LSC9vQTFoaHB1VTRZOHdGTm10VjBoenZoT0Irdm1RaXlk?=
 =?utf-8?B?VW5oS0doYVgwT09OVGRZa20wZnhMNTB5ejdQYW9WL3hta2lXYjA3ckpYQWZV?=
 =?utf-8?B?clM1OWJ2U1JBQU1OZUN4UGFoS1ZaTUgrdGU0b2RPZkZwTUVrbWIyd0lubkZz?=
 =?utf-8?B?NlVWWVp4emwwMEduVDdkZ1VTaUFXMWdXYmdabSt3REhzeWQ4M252YnFWVEZL?=
 =?utf-8?B?VlZ5KzdibUthU2cwN3RtdlBhODVjcW1uRlNTNFcySXRBczVtNUQ0TVpCVTYr?=
 =?utf-8?B?MEMrUlBHQUd5elZiT2liSTJnL1lGVy9jemNxeTZxSFJaTWgyK1BpMTdFWVlz?=
 =?utf-8?B?TVc5TWRwd1RrbkhZNXRISEdMOVNvcTNpenNoTUh3eUxNWTBxTFp0RW1IVzVj?=
 =?utf-8?B?UDRkSFY4RTFBRFBnVVJFblgrSFNoUkR5L211TUlSZkFBK1RSY1l5OEVtbWNH?=
 =?utf-8?B?Unh2VnFDLytBWmdJeSt3RlkzN1FlUk5wMURuTEVrVzFoZUJJc2FlZDJaQ3JQ?=
 =?utf-8?B?VnVrTU1KY0VQVzZjeWxZMlM0cUhQeHdZQ094aTgzN3dCY0lMckpPQ09xTFVh?=
 =?utf-8?Q?/JyMiyc9sCnI2?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];
 domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b63b7321-8de3-4085-143e-08dd4b4740aa
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|35042699022|376014|82310400026|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0kvbXhKTlJFUXhaeE5sM21GVElxbnE1OVBLN3V6bmlmV3FWYXNYZm5yOU5C?=
 =?utf-8?B?bDd1dDZNNHhrYUVYWHhITG9vcmZUSGJtYlZHZUxBYUtrcEt2Nm1jdFN0TXlW?=
 =?utf-8?B?NmszMDloa0tqVkpxTmdMQ2w3K1VvZDdiVnR5dDJ0SDZhb1Q5bEFWa0IrVG4y?=
 =?utf-8?B?WThYU3ZEWmVLWm03UE9UZWVYdUNZb2FkNVZGOE5maXhLRFZCVzhLSUVhNnlE?=
 =?utf-8?B?L2Vab2Zzek5Nc01KRUtVTkVtZ1NCN01xQlhibGxHbTkvMUJKczYvRHJYeUE4?=
 =?utf-8?B?S0FvZytTV0NtZUhtUStqOWZ6aUFhL1FDUFNUcnk3YzY1K2cwVU02dS9FZEwv?=
 =?utf-8?B?dUVLSkFLbFlIOUFsYW9UQ3BKczU0c3RxY09GSlJhUnk3eGNEeW5BK0pEMklY?=
 =?utf-8?B?SkVXY0x4NnRPZkVCV0RaaStCUjJQM0daNVcxNkgwclM4UTBXbkNRQmxNMU5k?=
 =?utf-8?B?ckpFNWZyUFhoVFpMVWdxQUk3M0RBdXR3YWZ1cVhaQXowdkZScjg4NEpRRHV3?=
 =?utf-8?B?R2E3VUh3V3JRb0F2U2h2Q3l4SURIWXRFTmFLR0QyUU1lMlROVUJyQ3ZYRnBG?=
 =?utf-8?B?YXhSdmdxWU83TS85Vm90N3lKZlJMYkRPV2NZQWw1Y3BHdTdRTmxXdkUySGY4?=
 =?utf-8?B?K2E2WlFjdk5KUld2ZkVFSG1RUDdkaTdUSDdhNUQzcFA3enhwZWdoY0UwN2VT?=
 =?utf-8?B?UU1vdXU2NlBiZnZYMmVEUzEwVXk5U3l1dGQ1R3FGVm9ESnpZSnp3RFNUT1No?=
 =?utf-8?B?em9FR2ZJWGFXL0lsS1ZyeVJTRkVkbEpNNVdlNHIrT0RHQTFNZFd3cG12Q2s4?=
 =?utf-8?B?Ykg2dmxjcGlkUCtOYTc0Y3hhRmhaRG5IaFYvTlcyeWVmVXBJN2kzZ1NkcDBz?=
 =?utf-8?B?ci93WnBHZEZvUU1QUVNGdmxRT05UampYQjRXTjBGaG43MFBrSEtqYnVvWmho?=
 =?utf-8?B?c3YzRG55REUzUkNHbDdHU2YrS3E0MnV5cnNtV28vWnBMRFEvc0Z6bnNsekhM?=
 =?utf-8?B?L21YRU56OXhNYlR1dVh5UlQ1N0tDeUxaVE5QMVdiVVFSUlQ5dVdhbFV6ejBN?=
 =?utf-8?B?eThJMkU0UzNVbGxuZ3VhVm8raG1NOGozT0VZd3NKR2tHSnU2ZzNjTG5IL2NW?=
 =?utf-8?B?R2pHalMva1RaU2ZIKzVLbWlaQW5jV0wvd3E0TmQxdURTbitMWC93TU1jN0Rw?=
 =?utf-8?B?M29GNkdtOXZaNTg3RGZ2OTM1dWZBMkdRQUV6RlhKSmFMTCtzMGZmZHBtVUNw?=
 =?utf-8?B?dXp3dUM4TzlSa3U5S1pkaDRyYnJvdHB1MzZhQlRnZE9SN1NJOW1yOHRoWWRF?=
 =?utf-8?B?ZmhJa2tRcC9qTVBaU01SRHptZ3hTdGViK21zazhzMW5TOG9PSXJpWW1TWUpJ?=
 =?utf-8?B?UmNXYzNwYU9SbHU0U1pLQWNJS21peWVxbGc5V1lHSFBDNGVKU2RrL25hNk5O?=
 =?utf-8?B?d2lHS0gweFBTaGxjbGRyQzY5R3M2RUFXWEt1L1ZicG5ydmZGaTdtRFEwMFNY?=
 =?utf-8?B?VUttYWhCU00zelVKTHZRUWdVWGhGOUk0WkY1VXZ3cEpzWDJ0RXRtR0dsSm5x?=
 =?utf-8?B?LzJneEdidjhQWGVHTUpzNituNVZYQlA5U3pHNVJSOGN5TTRleVBkdEFKdVVS?=
 =?utf-8?B?akZ4ekU1VjVwODRyUWdINlRvMTVQNm1kY0F4UThPejNkOStXZVltZ0wyMDFr?=
 =?utf-8?B?OUFKenArWHd3RjNtMFdVWXRudEI0RjFxTGlOYzRTQlFqQXhQemlyTVZrY0VW?=
 =?utf-8?B?cUUwUlBrYWNreGpWMXhHVE4vN1h4bkRSOCs5RTB2aXd3aEljNFdwMk50OWZR?=
 =?utf-8?B?bU04NmttS3JqcjFMaWJJcy82SDdSNmZRZXhUcldoQzIxQ3d5cTB2Y2dRT0NR?=
 =?utf-8?B?UVBDZ3lncENtdUFsRkF0a1BsYnZuTURXNndGVlZxbmZBYk84N1F2Q05YUE43?=
 =?utf-8?B?N1piMzVRa1N6VDJMV2E2UWk5N0ZWNXJMU0s2ejMyenZieTA0OWFQcjRTNXZM?=
 =?utf-8?B?RDNDMUUwT3hBPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(35042699022)(376014)(82310400026)(36860700013)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 09:26:10.5077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3e310b-76fb-4634-f224-08dd4b47499d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11142
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

Hi Nicolas and Krzysztof,

On 09/02/2025 11:56, Krzysztof Kozlowski wrote:
> On 06/02/2025 22:21, Nicolas Dufresne wrote:
>> Le mercredi 05 février 2025 à 10:13 +0100, Krzysztof Kozlowski a écrit :
>>> On 03/02/2025 16:31, Florent Tomasin wrote:
>>>> Hi Krzysztof
>>>>
>>>> On 30/01/2025 13:25, Krzysztof Kozlowski wrote:
>>>>> On 30/01/2025 14:08, Florent Tomasin wrote:
>>>>>> Allow mali-valhall-csf driver to retrieve a protected
>>>>>> heap at probe time by passing the name of the heap
>>>>>> as attribute to the device tree GPU node.
>>>>>
>>>>> Please wrap commit message according to Linux coding style / submission
>>>>> process (neither too early nor over the limit):
>>>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>>> Apologies, I think I made quite few other mistakes in the style of the
>>>> patches I sent. I will work on improving this aspect, appreciated
>>>>
>>>>> Why this cannot be passed by phandle, just like all reserved regions?
>>>>>
>>>>> From where do you take these protected heaps? Firmware? This would
>>>>> explain why no relation is here (no probe ordering, no device links,
>>>>> nothing connecting separate devices).
>>>>
>>>> The protected heap is generaly obtained from a firmware (TEE) and could
>>>> sometimes be a carved-out memory with restricted access.
>>>
>>> Which is a reserved memory, isn't it?
>>>
>>>>
>>>> The Panthor CSF kernel driver does not own or manage the protected heap
>>>> and is instead a consumer of it (assuming the heap is made available by
>>>> the system integrator).
>>>>
>>>> I initially used a phandle, but then I realised it would introduce a new
>>>> API to share the heap across kernel driver. In addition I found this
>>>> patch series:
>>>> -
>>>> https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t
>>>>
>>>> which introduces a DMA Heap API to the rest of the kernel to find a
>>>> heap by name:
>>>> - dma_heap_find()
>>>>
>>>> I then decided to follow that approach to help isolate the heap
>>>> management from the GPU driver code. In the Panthor driver, if the
>>>> heap is not found at probe time, the driver will defer the probe until
>>>> the exporter made it available.
>>>
>>>
>>> I don't talk here really about the driver but even above mediatek
>>> patchset uses reserved memory bindings.
>>>
>>> You explained some things about driver yet you did not answer the
>>> question. This looks like reserved memory. If it does not, bring
>>> arguments why this binding cannot be a reserved memory, why hardware is
>>> not a carve out memory.
>>
>> I think the point is that from the Mali GPU view, the memory does not need to be
>> within the range the Linux Kernel actually see, even though current integration
> 
> 
> Do I get it right:
> Memory can be outside of kernel address range but you put it to the
> bindings as reserved memory? If yes, then I still do not understand why
> DT should keep that information. Basically, you can choose whatever
> memory is there, because it anyway won't interfere with Linux, right?
> Linux does not have any reasonable way to access it.
> 
> It might interfere with firmware or other processors, but then it's the
> job of firmware which has discoverable interfaces for this.
> 
> The binding says it is about protected heap name, but it explains
> nothing what is that protected heap. You pass it to some firmware as
> string? Does not look like, rather looks like Linux thingy, but this
> again is neither explained in commit msg nor actually correct: Linux
> thingies do not belong to DT.

Indeed, the protected heap name refers to a Linux concept: the DMA heap
name. I understand the confusion introduced by this patch. I added a SW
concept in the DTB, where it is meant to describe the HW.

Following a discussion with Boris, we agreed to remove the DTB entry,
and instead rely on an alternative way to get the name of the heap
in the Panthor kernel driver. I will prepare a v2 of the RFC which
will rely on a module parameter.

Regards,
Florent

