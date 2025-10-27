Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68A3C0CFFB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7EE10E441;
	Mon, 27 Oct 2025 10:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="m4llsUqJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m4llsUqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED79E10E069
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:44:22 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S/lUby1EC6JsZM6UY6CajZObqAzMcfHBN8MlK/6kGCqNAGMRraZwQFmJ3Ml9qezWRjhnBtI8hxhuPRrxFxDbPHGjDDa3PNd/w+e7sGnOalHguWsA4bhSG0bjrcXIjFYOWgAbjs1+WqxHjHXNynJHsIwNqzuQZjwwOCB/OFTFjR84ZENf3D4lZcPjObZuhn6YHP4h2PB3XLlX4UiEBI+Ln8QhPc43ydh9Yo8GnjF277Nc2vWQfIWh6omQqIKYg9cDEthRp++rIyCRERo7WoMPiSwP60MLDg+WMltMtK+3ahYD12YQZmvYE7ES88sg4IYtax/IwHWCnlvZyjAyFR+Dfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bngrSmFpbyyaS+XKkvYn2McUvwn2EhYmytkNsx9ZI0s=;
 b=aFdePOhhhd9WhGItJCrfaPw9sgVfUsv/gy3BR1WDj5f8/nU4qrNmtFe55t1VP3ONSFBaomwpQdWY5mrvokvxx/MRQfI6DwecpHNxpDA+bbYWmVHcgZ6M8J891PPkXglfLS+uoQErmDQz1LQKlQvkPF9wAZG7ccD/pcc1fw36+dpdTWdsmiCJvMim6L9vjwbogTkAya/VWwwrFhmae256dxuMUQsJKzxnhNmYMTDr9SUS/gmx1nuuGLWEH/tDzYM+FdD/lW4TfrhiE8y8MF2f8ZjQwXXvPAp4oN2i7dNQ1SB2b6FOsydfY+6dXKIlS6TD9YTVKMSL01teJV2P3It+8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bngrSmFpbyyaS+XKkvYn2McUvwn2EhYmytkNsx9ZI0s=;
 b=m4llsUqJnDeO5MA44M9SVnJ6WS/C11wTQnS/kh1qAghsFi2n6wjKQxZUX9ELRxy3pZjG8xGd1iQ40TF+CGUFhsrQNnZCxU/FBtV9XMj9TDTg3++p8wkwmEJMeXRTohAizFWx8JQHdoYq/oHvd0LWwFuOjcgusQWrqN7hwILz/Ks=
Received: from PA7P264CA0452.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:398::23)
 by PAWPR08MB9124.eurprd08.prod.outlook.com (2603:10a6:102:330::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:44:18 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:102:398:cafe::3c) by PA7P264CA0452.outlook.office365.com
 (2603:10a6:102:398::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 10:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 10:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YACfcAQNjiy/SQwXULt4MgSdqvBh6rp4QReEo+o8VGq0F8lHWUysEMei41TpMKenEUs3sKClFCRAM0asks1Jjqij2f6qguXXlSkzuXmQ1B7JqOd2mT6FrmSGklb5sJ/2pg0yugT3+cd/Wv5ZX80IIqORqDOms9f+jMbTI7KBwISujM1R3uMxw86sP/8J9+o5f0EshpOy1YX+2+SC4VZ1oaC7Tohjq1BgWpqlD1fQZlOrrhfIT5H4jcuxgaqg5Z6hcY8gHUuU9rPzy14m7d9AiNyBdsO4dBhROoes+QVQj502dBOEsFWqg2zrwOG5IhQ0/GgWMGJD44wFnalVIVbW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bngrSmFpbyyaS+XKkvYn2McUvwn2EhYmytkNsx9ZI0s=;
 b=nSDzjC5hARBhePmtLruou6D2yrjHcwugfsdhRMHEP3z1XLq458sigmHSOtdFIegJEGgQyeYZYo2kdvTH1HOnDVWNEfOdAXamYi7VyA/aDBcdrWKljO536wqc8paZV+5VopLn/xBuwbn4TS7Zf+enboOW4Gr3nEFlrA+rdKqSAa827CH2KGfXogpRohahM+X4GbFjPqrN/2ne0xVg7rw0lEd3wwMVgt8A5Ge85Ct8LxZxDvE+M5669RVJtlcCta/xkRPmpDtUZmWbgsOFYkCLlnY5UxKzvpCuNTtjHSoRX8cwfneH61HlcePFESU1e7sBgR4gYwNs79Owk4xI3++dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bngrSmFpbyyaS+XKkvYn2McUvwn2EhYmytkNsx9ZI0s=;
 b=m4llsUqJnDeO5MA44M9SVnJ6WS/C11wTQnS/kh1qAghsFi2n6wjKQxZUX9ELRxy3pZjG8xGd1iQ40TF+CGUFhsrQNnZCxU/FBtV9XMj9TDTg3++p8wkwmEJMeXRTohAizFWx8JQHdoYq/oHvd0LWwFuOjcgusQWrqN7hwILz/Ks=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB9057.eurprd08.prod.outlook.com
 (2603:10a6:10:429::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:43:44 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:43:44 +0000
Message-ID: <6c301d19-7f80-471d-a431-8b936d7eb362@arm.com>
Date: Mon, 27 Oct 2025 10:43:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] drm/panthor: Support GLB_REQ.STATE field for
 Mali-G1 GPUs
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251024202117.3241292-1-karunika.choo@arm.com>
 <20251024202117.3241292-7-karunika.choo@arm.com>
 <20251026092717.3aae3679@fedora>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20251026092717.3aae3679@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0045.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB9057:EE_|AM3PEPF0000A78D:EE_|PAWPR08MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: f039bac9-51e5-4cd2-4297-08de1545c790
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SlhKRWtYQXR5Q3h0V1c0aGtsd1lraWdNUmxTV05WWTNqTi8yc08rK3NHekFY?=
 =?utf-8?B?SlBGUHJnK3cvTmltVFFjY3YrWFMzdHovdTlBOWZtb2xlQzM5WXVaUkJwNmlw?=
 =?utf-8?B?cHFzQkdEMll2aHBUR3pEUXdKK2V4L3FHS2ptV0s4TFJKU2tHN3FzUnBNb2Ex?=
 =?utf-8?B?UzNLMnJxeGI4SlM4YmJrVEtQZ0toeHpYTDhrbE43VjJ5bEhBYk5FWmV3ZmFp?=
 =?utf-8?B?WmNtUTYxMDZvbnZMZWs4VW9NRkVlUGlzOWFUNmlBZE15RkZ3VGt0MzVVdWF4?=
 =?utf-8?B?aE4wWGxtWnNCZmgrTnVlQXVUSmtxckZNUnBzU2hBKzZ2SmoxUUw0cm9kaEVY?=
 =?utf-8?B?aGg1bndaYVJKa0Q1cEYrZDdJRDFoaHBEelMwVVdnejNqNnM4QnhGYVFZUXJI?=
 =?utf-8?B?cnBRQmJaWDJHNk9xaCtxeU9iWnZ3VEZCK3k3cE5rNnRSNmxWdnZZVE5kVmdq?=
 =?utf-8?B?MnhRb2I3NVN5a1QxYUNRQ0swOEdXV0VyWEhMWUpmbXhXQlViZm1zd3RnQXNm?=
 =?utf-8?B?cm1YZUd6WFRvSEc3bXNlZ0dvVkp0WmFRcmdLWXhEOGhWTFVaTGhoZ1Q4QUlB?=
 =?utf-8?B?OHV3QU9mdzR0V2NmL3pjam12S213ZjRaRXZqNVVqcDV4MUZvdHF6djhmeTVm?=
 =?utf-8?B?ZHB6SEh0emVaWjN4bnRCOHVnSFZzTXpjZGxnb2pBVlBaVkVldGhYYXZIZ3J1?=
 =?utf-8?B?SWlDbDc0bUl0R3Y4L0hWZzExUlNCNzJyQk9TekllREErYlgwZHF4WC9SUENq?=
 =?utf-8?B?SXpBUlNTc0E0dHVrTDNZS0t1TUFoWU91SklzcGdsNXNPSUZHQlpMNHE0citY?=
 =?utf-8?B?NkhQWG5rZXJoKzlheGtHMm9HcWw4dm40K0p1RVRsK2lJalZZNCtCSjJzSE1m?=
 =?utf-8?B?T2tnUHh1czBqd3JUcUpuSFEwUlovbWFHbEtHaVJlZTRFeGlUR2xUNXhpYzk5?=
 =?utf-8?B?TEVFZXFNaGFCVmF5N1IvYWNhVWxXd2RkWWtWS1VmOXc4MkVBSFJ1NW9aYjYx?=
 =?utf-8?B?TU1aMmZWSXJQMWhxVVdVY3ZPSm1DcGsvMXVlaEdod29ZQzhobVdGRHdhcUk0?=
 =?utf-8?B?aXJYdDluM29XR2I5VFdoeFU2S1U2dUtIcGRpRFNISUoxWDFkMnRpcjVFcS9R?=
 =?utf-8?B?eWh6SHN5cFYxRXFtWnhFdGVuWmp3MFkvQWRKNnR4dWJRU1RQRGp1anBHK3hC?=
 =?utf-8?B?WjJtbHVwaEd5Rm1maXlLNjg5czdEYVFhUGt4SUtGVk1hZWlUTHlLczNuemE1?=
 =?utf-8?B?aE9OdG5iTkRpYjFaVWcyQ0l1SmpGWU5wMEtnbXNNcEhNODQ5RUxINmxlOFBD?=
 =?utf-8?B?RzU0U1kzUjBoZzBNRUZkb3FmbGp0U1hWdVk4OG1rNjVOajRLQXNYVHp0Y1Qx?=
 =?utf-8?B?SG5XUXVwVDBibERaeUlOUXVIY0w2MSt2K281T2QxK1pxZFlwa0t1SDF4R09a?=
 =?utf-8?B?QWFJWG5vNEhmUktBS21qUVRONzVkU1Faalh2VWdrTC80czF6TGwvelFWZmdo?=
 =?utf-8?B?N05mVS9scVJydlNMeUhKMGc4WWVNTGJwVmtia0l6Tm82V1NuRG10c1Fid0pk?=
 =?utf-8?B?QTVpT2tkeG5SMnAzcE9ZQXpWQzlGa1NYbXdCalY3M3Z0UkpuWnoyMER2bmRl?=
 =?utf-8?B?VHBGRTA5RDl6QU11LzE1SHdmdDNsaWpjazFtdDRXUGl1K3pwYWEzdW1YVWlp?=
 =?utf-8?B?QytXeGFJMVZ5eGJBS3JuUmIxcGpBZzBqcHBSVmxqNmdOcXdteGVTeUlacWpE?=
 =?utf-8?B?WmhUWkpOMGxLQ3k3SjAxbGZmN2graVJGR291SHVEcDJERU5ieGxYei9BcVpi?=
 =?utf-8?B?YzZIeUNFWVE3Y3pTRlhGTjdBUjFFUkJINEx2Q2YvRTNkRVp1V0szSy9GdVVx?=
 =?utf-8?B?b0ZuU3BSeFlPc3ZRMGwrT0grMEltcW94UnpvRGtpR3I2SHRlYVlZcWs0d3Q5?=
 =?utf-8?Q?5ZUq+fKswdHB6LujPzWLND8y31OWAfNm?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9057
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f93f8ce-f68c-4cec-d28b-08de1545b3ba
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|82310400026|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yzlqczd1L1dFakxmTFdSTVFBTi9Pc3N4N29IRWFlLy9EME52bWlpQ0JjTFJ0?=
 =?utf-8?B?bVZaSkhIM0hYV2pySWVvcTdLVGZxNzYzM0VTVENnSytnOFhoNlJGSXpQRGZZ?=
 =?utf-8?B?OHhucHl3NTFtVlRRa3RhR3NqZFdVWHpBNUF1RTQvcGxBdktLM0RYSXJodTB0?=
 =?utf-8?B?VTdtbnBGSklGdzRsc1loN3NERlpsSStvTnFqSk4rTWRkbFhscnJjNzlJN0lk?=
 =?utf-8?B?aEdtRHB6bktYaWpJTWxTa2g4eUF0YTA3K1g2dC8xTjVEOUg2YVpqSEM2cUVV?=
 =?utf-8?B?elJJTTg0eFFxUjFnRHNuNWczNENIMDJMajB0YnYwU3VvNDN2Szl2bmc0RkpF?=
 =?utf-8?B?NUFLMmI1bHRiaUM0Sk93emZPWW5kalVQWFJNcmcvUVFsMWRsTndnSVBzSndl?=
 =?utf-8?B?SlFFR1ZRSjRYdWVJTE51a0hxN3g0Q2VwZnpHWEhUbTVXK0hsQ2VzbmJWMEtZ?=
 =?utf-8?B?SGZoZnQ3clNlSWxpamFJMnJtemZURnFqREdGMUJhdlpsOE9XalNsWldkYkV2?=
 =?utf-8?B?M05NNXZNcDFnM05qTGJrdzdLUGRBVXJaVm9zYjF5a0JYcll5b1FGeW01UXVQ?=
 =?utf-8?B?R3I1SXV2bDFoY2w5dmNaVC9ZVUVhbmVpYUdzWHNsdDhOaDlnRU01aHlxNEJ4?=
 =?utf-8?B?Q2dQNXpEUWdIYkk4dG1DV29WZkxVeVdYbXVJSVBVblBxQnZlR3VMY1R1OXNq?=
 =?utf-8?B?dlBtWGtZT09BSm1HczVtOG80UFVHZlVrTWNvWWdMQmw5b0lqRkdQMUVwR2V3?=
 =?utf-8?B?a2NzMXN1RmlvVk9mMDAyWXNNbjFzL0w4TXpSUU5qa3c4RkpQT1ZUbVBObWtq?=
 =?utf-8?B?bmZLRjU2ZEZKV3NabUVRWlFyZWp5L2VTUnNCVDRFZ01lYys0cWJiaXRwQ0xw?=
 =?utf-8?B?Z1dDVzhIMGtIWGFWZSswQWM0STJ1SGdnNU1RVE5ZSHdQTnZHSm9jMEFvVEdD?=
 =?utf-8?B?TjBKSzNkQVl6Ym52UWxRQjNNRXAyc2VVOFJXWWpxTmFRTE5qU1JWR2RmRXgz?=
 =?utf-8?B?TGx3ZWlURjN1NHUvaXNQTktOcDBHZE5pMnVReUxXVTA1dTkxcTJoOGhRYWhj?=
 =?utf-8?B?ZnVQdWhpQUF1R2Y2WnZQVFhGYmZEOGl3Mmkza0hxT1RBdEdQZnRIdi9EbTVC?=
 =?utf-8?B?KzRUNDRUdDl4MldzdkVITVVsVVF4eFMvakJWSHdFOVlvRW1rVjVtT2xyQkRN?=
 =?utf-8?B?aUJUdlRqQTdrdnpreFJ2aVJESGxzTEJXUHNiNE5JYnNHQ3lIeExMSkd3SGtj?=
 =?utf-8?B?T0RUUlUwU1dBY2RDNXV2N2UzRDZJU2cvZEpKeUZKcFhJOXZvWmJRUjhUa3Nx?=
 =?utf-8?B?UVpxZEFlb0Noc1ozYnF1ZWtiMSs4NEZnak5JVWp4bFVkZUtXUmI2Y2E2V2hH?=
 =?utf-8?B?MGMwOUVsTVhyMk93enltQnlvZitQZGZmNDdnUFFFaGV6eG1PYTlyY3ZzQmdl?=
 =?utf-8?B?c1NNdjBQdVNIWEs5dzg2Y0YwZk1SSkgyVGYxYmhiV0RJY203Z3BxL3ltSFc1?=
 =?utf-8?B?Z2ZFRGJnRUJkME9xWXZudmtUU21PdVhnQUg5dEpuSndERUduaVpoVWlTR2ZC?=
 =?utf-8?B?ZVo1SkNxOTIwNzFoSG5rMnhxL3VuZU8yYTRzamhOaCtweGN6dTJGM1hiSW42?=
 =?utf-8?B?S1ZVSnF0RDN1T2xGUVhDTXRQM1psMGtVYlVGRkw5aU9CSU96elRaTHdWQzBx?=
 =?utf-8?B?TjlSc1hpbVVJT2w4eURDYkpxaVZ3SytyalVuSitLUFBYRmVHS0hSeFc5WS94?=
 =?utf-8?B?d0QwV05NdXkyUW1LT0l4eFRFT0FlV2xxeGV2ZmU0cm15RkJIV3FuWVNhVjE4?=
 =?utf-8?B?WmJ6bCtzUEQ2R1greE5COElwbm90cTRtV2R1c0tFSEdUS0VVMU04dDVyOW9H?=
 =?utf-8?B?SDlzYXExRWZQTDBCWlVlKzA5WW5rUnpsV05zczJVSGw0U0t5MnhvN2d2dGpC?=
 =?utf-8?B?SEdVSzZBanE5MFdDVTAvN0tuYUU5dnduZDhFY3QyZStLQ3l3bk5sMitCUGhm?=
 =?utf-8?B?blNKRFNtbFRUcHhQT2pySm9RNWpmcDh4a2xZTzRyczI0bWw5bjBUZFE5cFE2?=
 =?utf-8?B?UjlTZnIvQkc5a2RxZTVMUnRlZW83dk1DQlFwMjUrNUZFT0dIZUY3MXlHZ3Yz?=
 =?utf-8?Q?aiT0=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 10:44:17.7413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f039bac9-51e5-4cd2-4297-08de1545c790
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9124
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

On 26/10/2025 08:27, Boris Brezillon wrote:
> On Fri, 24 Oct 2025 21:21:15 +0100
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> +static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +
>> +	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
>> +}
> 
> It's okay for now, but if we start having more of these, we probably
> want to automate the generation of those has_<featurex>() helpers with
> something like:
> 
> #define FW_FEATURE(feat_name, major, minor)						\
> static bool panthor_fw_has_ ## feat_name(struct panthor_device *ptdev) 			\
> {											\
> 	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev); 	\
> 											\
> 	return glb_iface->control->version >= CSF_IFACE_VERSION(major, minor, 0);	\
> }
> 
> Same goes for the HW features BTW.
> 

I wonder if at that point, would a bitmask as previously proposed be a
cleaner solution? I have a minor bone to pick with MACROs that generate
functions as they make finding its definition unnecessarily complicated
and obtuse. Not to mention if the conditions for a feature changes and
is disjoint from all the others, updating the macro to handle these
would cause additional churn that I would really hope to avoid.

>> +
>>  /**
>>   * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
>>   * @ptdev: Device.
>> @@ -995,6 +1003,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>>  					 GLB_IDLE_EN |
>>  					 GLB_IDLE;
>>
>> +	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0))
> 
> 	if (panthor_fw_has_glb_state(ptdev))
> 

Thanks for catching this. Will fix in v3.

Kind regards,
Karunika Choo

>> +		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
>> +
>>  	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
>>  	panthor_fw_toggle_reqs(glb_iface, req, ack,
>>  			       GLB_CFG_ALLOC_EN |
>> @@ -1068,6 +1079,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
>>  		drm_err(&ptdev->base, "Failed to stop MCU");
>>  }
> 

