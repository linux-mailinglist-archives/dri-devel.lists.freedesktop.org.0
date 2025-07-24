Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17412B10606
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D69010E910;
	Thu, 24 Jul 2025 09:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="KlbQeYhC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KlbQeYhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012054.outbound.protection.outlook.com [52.101.71.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195A10E911
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:27:30 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H4cupwyUo+UV4UzTOfGHQZYbZvforFquByAWbwTwbgAn7N7N61l3JXz+mmlLP/Sbyas2jfYvSFjndm/SSrf8zKKjk0oDmj1JC0ywbuQmhZBQND+7z+1owN5VVc8iBpLwvTfBs9uxyr8zD3yAcOodUYTWy/u+24Oy+LHu4+xCsUSW4g2JXWhxVUQBNnyufvgkJ/cY0VQoG2Ph9rF5yGsK4kTKDIN7MmDA9f/wBjmja0nS/OQxh6BI8DenqFHNHGuyGBf8VRmzpWHiaD75lpf9zMfFmfLIHB83uLK1Bv22u2/2AB8FKUJWZjPPIhZL3gzy25YdSPzvBhW+WgRnskrtkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AWHMCYucFoi7FnrnNz97+Rs++SFBNhGj7vOrY/sowM=;
 b=P/pBHtXAp405DvrYmYNvdaglnWL/tArtUckZoDmJpb+pnI7/7TRNMX1kQyoTtIy4T3txHNc9oVu4GKdsxd3CybALzSiRh1NyTMGr0qp35lZlENb1IOLUqJc9lpEVC+zyJsCiD+ahp4N3BCHJBvXPn2967NLS9Z1E5PBg5oumGGJ/Bj0+FbZU5Igry2NFL43VOadoe3l9Jd4Q7Ph6tgIXiToKG4U5+p7R9fj4RWYlQvLUT8DZl6bVGSrIRjK5CDtQK6ixxQkiTrmtKvp1ocs48seV6bgRCn0u5ri3BqqciCYkihWO5m4QDZfXWcKx5QAc4r3hGyPZNE7t1jsTsiorHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AWHMCYucFoi7FnrnNz97+Rs++SFBNhGj7vOrY/sowM=;
 b=KlbQeYhChO6T33kUQmZJSiTAeoVGSxt0fCsmW4wGPJj1gSQzp9FITM4+/pGB2ApBHHK42mNLT86GKXoOexYJcjLCv3XR0Pj61DSjz5gfFfA3fHya0ml/WdoJ0HEw8+bR5Bba0ADQvt+O5aMmmYevKyYzp1DlmD+j+iARBM/bM8c=
Received: from DUZPR01CA0298.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::15) by GV1PR08MB7378.eurprd08.prod.outlook.com
 (2603:10a6:150:22::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 09:27:20 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::b9) by DUZPR01CA0298.outlook.office365.com
 (2603:10a6:10:4b7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Thu,
 24 Jul 2025 09:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 09:27:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLrVwsgPM572gd+k4Rj8boEsBfelCg+ozwsalwS5NZ9OPXEXZiL7GFtXt7/vVpsexXHNwuTfsXr7oTISCP1V34LjxjR7HkDfPykmofx0SWOBAUFw0SXk8bsL2z3KUyJXO6bGb3j7+FNfwvYvHGZQoJ91YTq6JSJy12bo93oItj4IobiIOHIL+jnXYCilJJD+pr34TWLrTbCsw45LSoH44Xy5yWIMpDUxVkx/AxQ7GvIE1CX5jil+b0Z/6TI4gvRYqcRUEwN+E7wBWhjJhRVSHXlpfnMowxkzzj38QOyvMnYMTg57HGfrCjl5WRhH1zlAM1hSoJJgDtK4EiLxeMIQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AWHMCYucFoi7FnrnNz97+Rs++SFBNhGj7vOrY/sowM=;
 b=U/1vntDio8FRt9/yPM9tUw5UEsqtHwvH1iumo/sZomp5UkYQgXAVJYiqSb2b7bBtBJjB8NP2VtvN+INL8Hz9WRjd1KQUU18AVJm+0SwfI0X4DeH5qq+I9NoFjf7TQM/spox6Xv6LLVtOsdh/rsAfsLMsJVViW92vciP0+VQTbX2ftxqjrRipH4Q4wwS0hJt4QPGRw77PU+GyfU64s1C8QaOO9wLky0D8/V3I++ut849+l9C6keHQT1WiXyGDRGhTds5Pd01cc0rHcbowWlmUEia+nugQz6LS58WTHdlMbtmiCbdAQcEKJG7UrDaNFdDxAR40Dfc/4UAf4RMXorqXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AWHMCYucFoi7FnrnNz97+Rs++SFBNhGj7vOrY/sowM=;
 b=KlbQeYhChO6T33kUQmZJSiTAeoVGSxt0fCsmW4wGPJj1gSQzp9FITM4+/pGB2ApBHHK42mNLT86GKXoOexYJcjLCv3XR0Pj61DSjz5gfFfA3fHya0ml/WdoJ0HEw8+bR5Bba0ADQvt+O5aMmmYevKyYzp1DlmD+j+iARBM/bM8c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB8418.eurprd08.prod.outlook.com
 (2603:10a6:20b:568::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 09:26:45 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:26:45 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v7 4/6] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Thu, 24 Jul 2025 10:25:58 +0100
Message-ID: <20250724092600.3225493-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724092600.3225493-1-karunika.choo@arm.com>
References: <20250724092600.3225493-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB8418:EE_|DB1PEPF000509E3:EE_|GV1PR08MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e2e13e-4493-430c-d464-08ddca9448fa
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?gzg9LJfEnAZEyiKM5HnQbytrgzR9VEw/70lb8MTAkHVobVHzzB538m0FOSRZ?=
 =?us-ascii?Q?pK+D/9vtTai+t25S3hIlqlFWRkWnL6LTfJUU/8iplwAiZZ/exJ6WhXHcv0lT?=
 =?us-ascii?Q?aTcDT1WaEnWomwb0qAu6HI+pmB0SI4QdLLPs2DVXOU78M/YEDqWOMsDe+CKX?=
 =?us-ascii?Q?GWIanIiaHyaqvmqs7wvnWJPaFoYIWrLk75tc1zOA5eFNtHYknrAhFPQtl3xY?=
 =?us-ascii?Q?7gwsisxnt7OEYSU8O+sRAmbNlvGnYg92fZI9IGOH37RPWonxYoNXvUUYy4GK?=
 =?us-ascii?Q?HK9bigAcJKHmM3R3/sFNVPAiuMjERcH4a1Fywlku1DcZ1/cBEbRKLAZYQu0l?=
 =?us-ascii?Q?WnY8yojMyZYjks4zAuqj6ciUm09oMc+spZsiaoUikAHDUyQGQqq/7lPV859U?=
 =?us-ascii?Q?cVYs5ZZBVRZgc5y9EVUJpXj+7fkKaRV4QVgn55oIzOQM8AyNrGr9936MEtvA?=
 =?us-ascii?Q?gxI2kkxuvagb359hvr2z9s87GvfSuyPiSAWlSt59MrTyYN4YwY4z4gjn6IoR?=
 =?us-ascii?Q?HFm2fFc/6Y/wnQ6RbBY8+UHyok28VCt3s3P4cfaPH1FirfhhPMMzEAMV4hHw?=
 =?us-ascii?Q?HQGaGsJwYoq0IaM+k/3/PZ7mZe+7mx4HmY2DdKQAkDhda5ANUccir7hHdJMm?=
 =?us-ascii?Q?g8lRbL7+s8Y3KNqTi811RgJyG8N4Qni9+THRPx5Ux3nHV0pkHtzn8zyZ1fjU?=
 =?us-ascii?Q?eqZGMQ4KsE5BfXnMiGmvQCl0p9xJRA/sil9ok0GVnUklpo3uNX4K/BiY0/mk?=
 =?us-ascii?Q?CLs1qYD9Qi1ka8med3rhebDyBLVMO1ciw/dSjLlugkeg4f6/UgoRXC3gxKws?=
 =?us-ascii?Q?1y5M2MO3w8WBQGM1AymhZl2IC1JviBhKZqdRYFIpFarErVJ1wvex8yBPcU0w?=
 =?us-ascii?Q?ls+yLmFTlAQpaVqZHVFSavxmsfqbrJqi+dCgkH8qh1T8UIYsRmM3iaiBThd5?=
 =?us-ascii?Q?Cz8nTP8KT5WZTP4Mnm4P0yXySpSqKwrAhpmku3w/ZUmepeYCTHY2QQDG9lqE?=
 =?us-ascii?Q?8Xp1ETXzQUlqw/pXgqktBMh0LhXIklVoVTVwZliDwFbI/HUpr3Mt4lP7WYZz?=
 =?us-ascii?Q?cLv5h4Wb+ruxgaoTRF2RW6eIQZNb5kSQYJF9hooE+L6yqbM9ca8XKUbQaY9e?=
 =?us-ascii?Q?+/S06ptjNuRTZ/0f5gqOrn3h4ZyjBoYMscho8DQfJLLLEvf0LKxG/CSKaCV5?=
 =?us-ascii?Q?AU8+CzssJLLo3gXxEtq/nbhl9Tlppt+w6J0rg9ngNAGhIgDDCUXZ32jUSh2g?=
 =?us-ascii?Q?VrnlC4r8JVj7g4rRKokB8VMYBFK1qp0VR7JQ7THpiMAbvJWMkvz3xmTGwBkA?=
 =?us-ascii?Q?qbbQ5rpcUWVLk/VoypKAu9dKMXgtioA8/gH7RxxAdMdAvBBS5YLZXfOSAoEK?=
 =?us-ascii?Q?M9JgmRRIgPU2T/tI+aBq/ok0Os/bL8/2Qv660q7tYf7nZiImYg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8418
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a32e5b25-1eeb-46ca-12fc-08ddca943547
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|376014|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hXbBPmHPC3uwP7JQMjnW++Ny773+P0vIotfILDxgQwMOhZRKLkQrrkdWFciB?=
 =?us-ascii?Q?L3o5ot/cWQ2nkK9PljREPS5mQ9hVZ0d5IYu6SyDplTdvA4YMle8GIQUBkjFo?=
 =?us-ascii?Q?DUA3tofVJiuTB1uKNfVeCZ8cdpgcmd8ZSdBxIDU/kr2vo1aPQOeb8Z4i+sud?=
 =?us-ascii?Q?GxyQo1/UzdAvt1XXBCtSMDAm1hNkbNeJgBag/ImjbmrCZXF0YbWQ5+jvr4iq?=
 =?us-ascii?Q?YLXqvTLu+yDAEnqrSNApVb/lGv6pp5cAcjhEjy6Yl9IlsbjAsulmIYUL20Id?=
 =?us-ascii?Q?rANLXoWzTeD8LUCPtHTgtpWwMX/fryWk4FkWBkytfb1YpdkBAUd/fou7GtRS?=
 =?us-ascii?Q?5w7t/V3GRcZjlOmc3/7iQDA9gemZjXkhO9RJjFzXwHMy9y+C732aJWQWUCap?=
 =?us-ascii?Q?g9Rk1FX/sepTPYbyxeEfoH7wsR6oWaZYI8fPkPZxA4aGbq6yt7lS2vCdA5CQ?=
 =?us-ascii?Q?H0ZxHQaXn9hDryhPBlYdyppbuGD5yF+zQiJE7qv6uiBvmMc5Dnt/imF3L3QO?=
 =?us-ascii?Q?wJXt8lo1kuPgvbD5WK7nuikKa4caWmHQLYPAq22TqMDcP0mMdRXlrwpq+9AG?=
 =?us-ascii?Q?s7i6wlvY7lR7bKK9zRC5bPlEr2NiUlkUiJ/TKYJkYJY01zletqMq3j1+glkP?=
 =?us-ascii?Q?5KUygz2Ap1mIY/9Vgoi3x2dMBm/TgnMvj6cXVXfT32SDpUPN8JW+2iaO0pul?=
 =?us-ascii?Q?dt8zDtNS2sAy0d+/7BpIuIZbKZczjDr5aeiGYva/P/cTFEZ7KF6M+dcb7ntZ?=
 =?us-ascii?Q?GXsdAtyVhXb0kRkfLg5hjAIEwsz47wyNjyyPuN5Os71kRb08XQuPetl7q/Wc?=
 =?us-ascii?Q?qvLHOTDr3ohpLLMesUf4jrO8kZjyHpZ8iuM+313z7F8MHeUtO4cEyzTpp/Z1?=
 =?us-ascii?Q?UrHEvayr27PLAYdBic73nPoGj3VQwJzHFre1I7ZHrFfF8vkrrhIOyqvejfvC?=
 =?us-ascii?Q?O3mzxDLQj8L4O9eaMLnMCoU3uv0xty+E9lJAaE2Ul+/AU7s7fAu+pArIqcf3?=
 =?us-ascii?Q?4Oy5t1bETc7ooyEHkkIk0ogut0ZbuK+nKm25hht40ku6/bgLPvwQFBp4LH35?=
 =?us-ascii?Q?XNxKASDPl+ToL6DuQkqlIMxz9QheOeZqJHDPC8h3No7LF+ZnJhZ8UIWSQRyL?=
 =?us-ascii?Q?iteGsBPH8XwS3Tdas/dXrN/lROygsxwca0KUUmd6R2JJJWmXFlYgCfZ2yJcT?=
 =?us-ascii?Q?Eq+O7b0Bf8/S8niT7+Uz265jDiC4q+ZEYqeZo67e2UP0865tI2TeW4oChBCG?=
 =?us-ascii?Q?2CYUEG9i621nyRfkPZ44Z7To3HJvrK7zjlUDby+8D9QEA9NUZQ6DpErhVDUh?=
 =?us-ascii?Q?vjIcBZR1cBqMnQG2kZa4bMMxd4uw/U9iqPrBHAejg2py8naPlt/6OlMPDhLR?=
 =?us-ascii?Q?ZidBhTdcVLnqi2Nr2K/3e7Q8FcOL8iPDU1hqRzIQcONKzxXVdGjDgq3E45KY?=
 =?us-ascii?Q?fOzzJ9msyjqpuY+ORjqIH3hvjWz0SHwzM7cVw4kXBRZ2Ooe7DkBJy+QfPF/V?=
 =?us-ascii?Q?5C+prHz4nS8erqKQPA8HpnmnGA9MFgrjIPTp?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(376014)(82310400026)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:27:18.3833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e2e13e-4493-430c-d464-08ddca9448fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7378
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

Mali-Gx15 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info.

Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for Mali-Gx15 GPUs.
- arch 11.8 FW binary support

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b7b454d16f12..fa6e0b48a0b2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 7f138974d43b..a7583342d797 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		return "Mali-G510";
 	case GPU_PROD_ID_MAKE(10, 4):
 		return "Mali-G310";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..8bee76d01bf8 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -70,6 +70,9 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..467d365ed7ba 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

