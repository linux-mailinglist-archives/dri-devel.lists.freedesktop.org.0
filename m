Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B5CADE58
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 18:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508E510E4B2;
	Mon,  8 Dec 2025 17:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="AduW43hE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AduW43hE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6314D10E4B2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 17:22:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fon2oQ3bKAmbizOheztfCFRJMLEk6kxY8Sz4xwPNlHDXK13uLMp/C4giI7WWjd3JTznzNkLqLW58d7WDipVLLQ+/Rvn9P6GUVnUi8DhhMom2VD6vTFcj0Q6Kto8mmdq/yeommPmDxymKp55Sl4GXnrZcL1chLNdPAVvt/V/ikb5DN5tWnQeyjdR1T0t3zczNduMiy7Sfu63Q1XV3ZKyaEBZ38JHto1Dn0pHoVEo2bRk2Bcfsb6ve5Pr2IvCTNhRt4WbDbwPEEE9jGtmmGNVA5ny3F7BzFc34AVTA1c99u0AoJkMLqGzelKMs+YUlcolhHxo2Y7khGpTSj+oRPeussA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3AcI2g3W1wHf+cSqaRBZLFNJeo8tUpeUaT8JX+SnMY=;
 b=fCveyVoxb5MNaPkiNCxpsSvJMNmvfT52JOCjEWvcJ1DxX3Ih4sTNhmdH9VxWdlJzSp2cECy9pZiuDGhj1HhEVlMABY7gu2c9gxup+ell32XkEDM/vPNDA3ZSetVbCI+s1zfI49YsOG1U7426g6tauShUqdMW1feWePkqE1E+54xnXlIyMfbgauu95Ckn4IrRHWfCLLlpIcM2LSyMhcmi3NRQCz+iOwKNGR8bEaBRo0b644DWI6kZHLkId0tHfoLoQNAfH7uKnxBynCxAe8wTkY33i0QxmiYQu2vc+odbaUDN66kFHNM/Ks6T3HwL5s1QbrHPFYb9O064IAQ8eL/JPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3AcI2g3W1wHf+cSqaRBZLFNJeo8tUpeUaT8JX+SnMY=;
 b=AduW43hEVS1wAk/XPaL7I4ZQmu8lLStc4/LpF8Y+yhdp6nmwaQ+qjMgrytdBscuGtkhYxJcJzNuuP70azeHQbb+DP9+ToV6qsFny8ELkCD1o328Lh3ult41ZfzZjN7negyGzk2ij5vO86fqwMbInNYMgapQopJ3nMTnyLv6HLcI=
Received: from DB8P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::15)
 by AS8PR08MB8184.eurprd08.prod.outlook.com (2603:10a6:20b:561::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:22:11 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::6f) by DB8P191CA0005.outlook.office365.com
 (2603:10a6:10:130::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 17:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 8 Dec 2025 17:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u52rWRyEGOhxMPibCkIF4sBW6zO7h53UuQGm5lVII6m95W2LibrspfeEy0admU9qMg3kBwMKo4jKASslNUw3bLQUFUJjuKDUiqZVttao8VCdh6C7aVecoILp7c8qO48/97I3PSJ6DHngekaB5XTJOEda5h9s5YEfiigjNQGDHbPcp24qkM8X1zwiXob/2jdKd7XQCsfLS9uDbFHHEHSsuz3PU80gtkQ/fZgQoK4+278gs17c5wXSZQ5Z27bS5t1IvLHp1CXiJo0HJgvBuIPedHgOQJY0wBC3ivnRwmdNolwN9BBAYsNBAy6iWKYG+eG5ByEqLnA0BeMNvx4QN4QJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3AcI2g3W1wHf+cSqaRBZLFNJeo8tUpeUaT8JX+SnMY=;
 b=BOFk3RYUoHkdigigYazd0eY3sCsFRW8ZQN+UYeUoHHzg3tgZYj98tBanBbfoi70BQSewhPKX18P/AkjrNka2vH/hsLUlAwxTO7oOlPeeyHuyXOkXcinfqa/ETjVGt9viAcXcJgefWJ/oeHTiytFK2KjNevWp3zcWZbehphcV4BIMPd0D52oPrnspv4drdZIzwXyCIggD1SHcNSzS/x+sue2Rca8Ps2EX8axQg+DnQpWTX2D16UVkMq5+h8HOSR+fXbv9VfMGBb6AT+C3t4UhzVL8LvAKlhB4M8OJSF4rYIomJ1U5a+jTiDjO1Vo/thg/KwXO+O1OBdq0ZrzuV/sYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3AcI2g3W1wHf+cSqaRBZLFNJeo8tUpeUaT8JX+SnMY=;
 b=AduW43hEVS1wAk/XPaL7I4ZQmu8lLStc4/LpF8Y+yhdp6nmwaQ+qjMgrytdBscuGtkhYxJcJzNuuP70azeHQbb+DP9+ToV6qsFny8ELkCD1o328Lh3ult41ZfzZjN7negyGzk2ij5vO86fqwMbInNYMgapQopJ3nMTnyLv6HLcI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PAVPR08MB9114.eurprd08.prod.outlook.com
 (2603:10a6:102:327::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:21:08 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 17:21:08 +0000
Message-ID: <fb6cac11-6166-42c5-a5c2-afce1a902437@arm.com>
Date: Mon, 8 Dec 2025 17:21:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Content-Language: en-GB
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
In-Reply-To: <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PAVPR08MB9114:EE_|DB5PEPF00014B8D:EE_|AS8PR08MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b6b957-d558-44cf-2a31-08de367e525a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?cC9EbFB2ZnRsTFlQWGsyZytzd2dWZkl4aUpaRGh2UHJ1QmZLeFdKRDByNTll?=
 =?utf-8?B?clV0Nmwzd1BWR1NCdEF6UkpYRUFKdEE2cmJGRUVCYU5ETC94VEhhQnl3Sm9u?=
 =?utf-8?B?Si9VMGxJWlErcHZsbVFOVlNkOTc5UUtyYmhrdkwwWnVqTFVXZmxwaHplUkdV?=
 =?utf-8?B?R0g0ckJqUG9oZThiUVBHZGJwRFdVVFFlVng1TG5oU1E1OVY0VGlqLzNzRHZn?=
 =?utf-8?B?VDNWcjBmMFJJdDMzK1RaWGJGQUpOalpFU2xsVS9la0pESFMya2hQNllyWFVZ?=
 =?utf-8?B?MGJhZm9VdFhMbnNYTmQ0TjVhNWlMclZPeFM4MTBNOUlxbTA3cjdVczVyUi9O?=
 =?utf-8?B?bU8zQ0dBZzM1L1NXUTBubjY2SWErTzBzNVc4NHFiQXlVMmlKRk5id2ZHdUZR?=
 =?utf-8?B?UWpsWnFvMGpqWmFrT01NSml6bUR5NGpVVDZmZmZYT2VybHVvN3pXMkZsWW5I?=
 =?utf-8?B?MFJxSndqdCtQU2wvZWlVdGh5aUN6dnNuRlp1cGlINTFrUlNyNHRDSXpBOXZp?=
 =?utf-8?B?dWxGc3NEcjlKTTIvQlZzUVozRFBxdU93dTJZSXY3WGhqZFJUVGhlMG5WcSsz?=
 =?utf-8?B?L1U2Vkp2SjR2ZmQvN21hQVNWNElEUFZaa01Zc3NQRkRoaVRBQy9QWXdOdXZa?=
 =?utf-8?B?UC8rNWw2L0FIUlFvL2ttZDU3bkZ3VXFydHdFMGxKUnF5ZFVXRHpMbUhYVXZK?=
 =?utf-8?B?dnRSKzdCcy9EeE0vcjFadzdWWXlUOEptQ3NCRmZBdVUrUHh4RnR0VW1wS3d0?=
 =?utf-8?B?YzNiRVdLckVSTWV3NWh0RmJ5cUJwM0hxcEVjZitJV3ltQzR0THlVbC9pTUdO?=
 =?utf-8?B?Y0dJK1FKYjdwTGQ3YUZaSFZsb2JOOFF6cVh1cG9peHh6TVlqYk4ybjRaR3Y4?=
 =?utf-8?B?OEo1L3BZNkVBR1lITTFSUEtpSDcyRkF1QS9pa0tBVkdQVmlOMitZNEtiRSt6?=
 =?utf-8?B?aVdOWDBNTEZPT2VEcW5PYm8wb2xrSUxJbnF0bHdHVUg3M0RIWHNEOG1OckpF?=
 =?utf-8?B?YTliYnRYM2FHZzFrYndYOUVjait4MlVaLzNyei9reS9xWmpnbDlCS2dvcXlU?=
 =?utf-8?B?ZWowVjhGZHJqTUdqSTlZRWoxUE9iV1JKY2x0OUQ0clpTWmZLUkdqTTNVczVO?=
 =?utf-8?B?Z0ZFY1I0bTlEZ21rMm9wMmdrY2h2ZmdVWkJVRm1kVmxUOW5WMHVZVDg3MGpS?=
 =?utf-8?B?WXkxZFVyMDV0RFE5dUxpSkFuRFBPQXZWVkx3TVRBMGZPT0oxdk0ySjhRL2RG?=
 =?utf-8?B?MitGZTNzVlVGZERSZnNhNXBZZ0x6d2FxaWVEb2NiSlBlRmFIUnY0QzgzalNa?=
 =?utf-8?B?U29xcjNIdk9EZVhqTFZ3MlpjRDlVNzJ0Mzc1YzB6MHYrUkJkdm5vMWxTb01V?=
 =?utf-8?B?aTFaQTEzZURVeVpuWHRWTlB4OWlvUEhKSEY1MTV1akcxVnlTak1HU2k4VEw5?=
 =?utf-8?B?SHBZUzJrTElWYkNyTWxnTmhWYk5haHZZQ3IxRTVCdUk0Y25pZE1zWEFoUWc1?=
 =?utf-8?B?cnhIT2RVUXo0R2p3MVNFNGVKN0pnVFE5Nm9LbTAxeGNKQmgrNU5Kb1pwU0hx?=
 =?utf-8?B?UmtxVVZXTEFWM1RXZTU3REwrZGE5dnd4NExpODB2MXhBRHBZdTFUV01HMUxV?=
 =?utf-8?B?Yk5JSlhtU2ZTYTBZUUVGZjB1bTB5bkQxQVlaWndBV295Qnd2UjhTVWxsa0ZU?=
 =?utf-8?B?c1kvaVVXejFWTE0xdG5qaTcyQ1VXN2gxS1dpQ0ZNS0Z2SkVDUlZuNEhhbW8x?=
 =?utf-8?B?ZW1LSjVHM1VZL0E4ODJVem1INVk0bW5sQjhBdzJhRjNqT1RIZlBEWE5yOHI1?=
 =?utf-8?B?RG9qcm1KMVR2SDNIczB5Vk1OUEY1eE5hSlRtU1FKV085N1pNbGVhTHhjOWR5?=
 =?utf-8?B?MTFmRUNNWm5VaGxLSlBHdC95U2d3ZEVFa1FqUzhNVjNwUW5EYVM4MXFlVUVR?=
 =?utf-8?Q?md1vrMOvYn2QO1/nfjikV/6MrIDOhA86?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9114
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0f7be844-1c4d-46b6-5da4-08de367e2cc3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|82310400026|14060799003|30052699003|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTFER3JvN1Y0WmFMcVpHaVhpMTBuNDBNeVFtWnJlTGE2RTFFWjR2UDF1c1Uv?=
 =?utf-8?B?RkdDdkRkZ3BqVWhjMGZaSk9UUVZ3S080UmJsNDdSWHpNZ2QweG9GbFpRQnly?=
 =?utf-8?B?ZWRTQzlncmRaQlQzUktCM0d1YmNqK2t2bUMwVDJiTEZQdExTK1FjTkxMcXBK?=
 =?utf-8?B?VGZaQkpja3JWNEM4UWV2KzF2WDdOUGRnWDFEUWJkRFpMRDAxaDE3aDV3dkw2?=
 =?utf-8?B?Sk84MFdMbmptRmlkMVNDNEhGTkRqck5IQnE4b21IQzUwZVpUYzVFZmNvRTZq?=
 =?utf-8?B?YlM3UDJjMXFvdGszSXZGWkE3S3NXMTI5SjhFRy9ncEVjeFFmOFd2QWE4ZXpW?=
 =?utf-8?B?ODg5elptZHF2Z2RSb1k5a3RUVVVhRDNBQUx4NHlpODFTb2xibGJYLzZ1Vy85?=
 =?utf-8?B?K3gyYWFlTHVSeHJuSTFYaTQ5VjFGR0VZeEVpN293Z2IvTUFhN0FSd1dsMmtI?=
 =?utf-8?B?ZzlRejhtSWJKaUplQVRtQ0xsWEJLN0xuU21IZ2x5VGdpaVg3NDNORFM1b3Ax?=
 =?utf-8?B?MnZBTVAzUXY4amlSWDNYR3htdUM4V1lOeVpOK1MzL3A4UTMyMHN1ZmFsWGRF?=
 =?utf-8?B?MW5qbUZtYkszT2dRY1lKRTcySXVuWG13czkyclhMTG5YT0dBMTI2OVpBRFBn?=
 =?utf-8?B?QlhqZkRwTjRNMmMwWm5yL3F3SklNamlCazVsaUxDc3JSY2hYcVdYd2hqRkVS?=
 =?utf-8?B?ak5YSW84QTBnTHRBTVd2dXQ5UUxuNW9mWm1VOG9OVThzaWhNc25hSCtYWVBF?=
 =?utf-8?B?a0x1cCs2cjJ0S0tJeFIvQUhKT01wcmZJZkF6MkcyV3F2ZVZQcjkxTkFQeDA2?=
 =?utf-8?B?bmpXUDlYUzRPZC81R2VvS0dXZnlCTldHS3FlanlzMGNTR1dIWUxnVW1nY1Zh?=
 =?utf-8?B?RGFiWGYzSDEzMm13YkVzMFU3VWVkWjFvYng3TnowTnVYYXk2WmJFZ1RNTVlp?=
 =?utf-8?B?Y0h0bVZ2b2oxRURVRjRZTXJzRTB6c0djUENaVkNDVWh5TXBXa0QzOXQ3SjBX?=
 =?utf-8?B?VUowcTY3eURVd2ZTczd2U0NKdm93Sm5zbXo4SzdDOTVzdENheGhHZmFTR1dB?=
 =?utf-8?B?a3g4SGJtT1BDaWJVQ20rRlNnRm9QVFZUUjFtSVpyNmtjRlZ2V2ZjRzZWZDhB?=
 =?utf-8?B?djlldmRZMzNrQjhoVmFUT0paOFV1aUlRUmRLandlRGx5bll6SFpyV0dTSTg3?=
 =?utf-8?B?bERrWWs2T1R5WjBpdDMweHN2ckduemUwVnNxVEs5UnRYd21wNkVBYlB0ZmlD?=
 =?utf-8?B?QlM2aTJ3WGxNRTlMN3NYUjBkbmxZVmJmR2NmMktEOE9vbk9BMFkwL01TenNu?=
 =?utf-8?B?K2lWN1BiNDVjbk0xd0RHc0l6ak1VMTA5T2d6NE1Pell6YmdxMDVRWmVYcGg0?=
 =?utf-8?B?Z1N2R2VLcjFMMXRLWmFCOG5zeW50aXV2R2JiSGMvWjFHcW53R2ZvL2w1Y0Zr?=
 =?utf-8?B?cmZIQ2QySHJ4MXZNNXFpM3ZCQllWc2p4amFvWGRIOFRMN1BwR3AzdVNOa2JJ?=
 =?utf-8?B?NTA3bFVwbXRucjA3bjl5MXRMM2xKa2hMZzhiL0IrcnlSOUkwMmEvNS91MjFi?=
 =?utf-8?B?aWZzcjdPQTZVYk9YYVNicU1PVTBDSUpJcFVJeHc2c3hicnhSWWhRWWFXRG5W?=
 =?utf-8?B?T1Q4THVzd0lVTjZnelhzQmZFTWlmazV4VmszU2hhQmdZTWQ1M0VicU1kb1BJ?=
 =?utf-8?B?cFBTV2V1UkxZNFBaaVUvTEZtOUNuZUNjNWJJazJSaWJiYkVGMG0wUTl5bVdL?=
 =?utf-8?B?VGJoZWw0L1NaeEllKzJodFI2RGorVVUzSC9GWHI2T3B6STB2b1loT3cwZnJK?=
 =?utf-8?B?SmRkbW1ESTF5T3FDZ2VIbmViZ2NaaWNoVjBUREwvTmYzZDRRa242ZmtWM2RV?=
 =?utf-8?B?bWZBb2Jza2FPWEorVDhxUTNQaXhld3JnMUU5amJJa2ZFcy9ERnFBdnYvQWE2?=
 =?utf-8?B?Q1pNS3IxOGsrMjhXcUlQYnhvS2FNMjU0RW0vWkZrTkdHaTBtYkJpMWU5Rkkw?=
 =?utf-8?B?WU9nRVlldkVLRXFQbXkxRUJVWjRzNlU3ZFRVSmRyN1dpUWQrTEd6QzJIYnlp?=
 =?utf-8?B?WDNHZ1haZ3JEd3EyUnVRUEU4TGxYdFJnNVJ4M29RanA5VUhEeTVPY3RTS3pC?=
 =?utf-8?Q?TyXo=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(82310400026)(14060799003)(30052699003)(7416014)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 17:22:10.7491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b6b957-d558-44cf-2a31-08de367e525a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8184
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

On 03/12/2025 13:56, Nicolas Frattaroli wrote:
> Mali GPUs have three registers that indicate which parts of the hardware
> are powered and active at any moment. These take the form of bitmaps. In
> the case of SHADER_PWRACTIVE for example, a high bit indicates that the
> shader core corresponding to that bit index is active. These bitmaps
> aren't solely contiguous bits, as it's common to have holes in the
> sequence of shader core indices, and the actual set of which cores are
> present is defined by the "shader present" register.
> 
> When the GPU finishes a power state transition, it fires a
> GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> received, the PWRACTIVE registers will likely contain interesting new
> information.
> 
> This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> which is something related to Mali v14+'s power control logic. The
> PWRACTIVE registers and corresponding interrupts are already available
> in v9 and onwards.
> 
> Expose this as a tracepoint to userspace. This allows users to debug
> various scenarios and gather interesting information, such as: knowing
> how much hardware is lit up at any given time, correlating graphics
> corruption with a specific active shader core, measuring when hardware
> is allowed to go to an inactive state again, and so on.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  1 +
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
>  drivers/gpu/drm/panthor/panthor_trace.h  | 38 ++++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index e133b1e0ad6d..a3cb934104b8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -548,6 +548,7 @@ int panthor_device_resume(struct device *dev)
>  			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
>  	mutex_unlock(&ptdev->pm.mmio_lock);
> +
>  	return 0;
>  
>  err_suspend_devfreq:
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 9cb5dee93212..8830aa9a5c4b 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -22,6 +22,9 @@
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "panthor_trace.h"
> +
>  /**
>   * struct panthor_gpu - GPU block management data.
>   */
> @@ -46,6 +49,7 @@ struct panthor_gpu {
>  	(GPU_IRQ_FAULT | \
>  	 GPU_IRQ_PROTM_FAULT | \
>  	 GPU_IRQ_RESET_COMPLETED | \
> +	 GPU_IRQ_POWER_CHANGED_ALL | \

Also, we've seen customers complain about too many IRQs originating
from this event, is there any chance we can enable this conditionally
i.e. only when the trace point is enabled?

Kind regards,
Karunika

>  	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
>  
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
> @@ -97,6 +101,11 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		wake_up_all(&ptdev->gpu->reqs_acked);
>  	}
>  	spin_unlock(&ptdev->gpu->reqs_lock);
> +
> +	if (status & GPU_IRQ_POWER_CHANGED_ALL)
> +		trace_gpu_power_active(gpu_read64(ptdev, SHADER_PWRACTIVE),
> +				       gpu_read64(ptdev, TILER_PWRACTIVE),
> +				       gpu_read64(ptdev, L2_PWRACTIVE));
>  }
>  PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> new file mode 100644
> index 000000000000..01013f81e68a
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 Collabora ltd. */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM panthor
> +
> +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __PANTHOR_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +TRACE_EVENT(gpu_power_active,
> +	TP_PROTO(u64 shader_bitmap, u64 tiler_bitmap, u64 l2_bitmap),
> +	TP_ARGS(shader_bitmap, tiler_bitmap, l2_bitmap),
> +	TP_STRUCT__entry(
> +		__field(u64, shader_bitmap)
> +		__field(u64, tiler_bitmap)
> +		__field(u64, l2_bitmap)
> +	),
> +	TP_fast_assign(
> +		__entry->shader_bitmap	= shader_bitmap;
> +		__entry->tiler_bitmap	= tiler_bitmap;
> +		__entry->l2_bitmap	= l2_bitmap;
> +	),
> +	TP_printk("shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
> +		  __entry->shader_bitmap, __entry->tiler_bitmap, __entry->l2_bitmap
> +	)
> +);
> +
> +#endif /* __PANTHOR_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE panthor_trace
> +
> +#include <trace/define_trace.h>
> 

