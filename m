Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E0C40521
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625C510EAE1;
	Fri,  7 Nov 2025 14:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="KX2k8lZV";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KX2k8lZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCF310EAE1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:25:58 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hM29V3WEqKhbPCKjYZXDjZhMW00/3JClakffenyAejIdbF830XIgQxNI7fXSh/yYeI5MxpKucslW+zNyYLxYudaU+djceeDyZ3bh/MZ5q9ybh7jDRd/2ct3hD4LGQ67WrpXaOCgka8EK0hJszMRGxhNlJiPH+LfUBUDsyVBhrVyuo8urp/DUjEag934a9dUby6M2uBmUL11t+plO7rRG1pvgrDe7BOYrKLQOxAyMqNQBml5S9PBhXH/72aQk3TEmJm6GE4rYhhs35nZnnUhTJaTcuez+OoptbMJjZNHU1Ad1/+bmlAV5m65WGxh4G2ofklyFpLhGEPgv77ChnTDXaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=LzdklouKADxypsVmIWrCgbTNEOmofxp1n0k+7i7ASdaf5YFP7efihW4c+3x3sRVH+4o+GYnx5dwOO/sjUlHvuVKXjdc8cRKvUBsiUDZSUD2aG3nBY2EA8hct5TgnWsydCp6HZEcCCMp16vulhARnp7Vk/QffnomZBS2PYR/j14THIPFrsk4ZLJY8CwPUUImnPFgSsAGvVBpTTb8S5t+ky7XN8ZB71+wMWi4sMtwSVDXjhoa3/JU9/FKFzScpo4WTX8mJH4qBC4x74J/8E9NABu+sZ6KBDfIQ5Gtz2RNyjC0O7WRlI38FAisa8yN4mm3uKzQi4QgWqqWR6xIHVC+qRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=KX2k8lZVAz2p1l5G3ahBZ2UTDg5WEg9IA81+Nko7wVQ4uMfLrNyHFv9ygSi51fRMRjDjEkSq3ob/f8CQpgkCnQrtkDyWx61LZoyIP64pQD9bOEWVrF0AUqTKTo/c07biqBWGmcNYwiSQuLWM89HzoOiR2G4mAMBgqM3j1Ut1bAI=
Received: from DU7P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::8) by
 AMDPR08MB11652.eurprd08.prod.outlook.com (2603:10a6:20b:73a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:52 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::49) by DU7P191CA0003.outlook.office365.com
 (2603:10a6:10:54e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 14:25:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 7 Nov 2025 14:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geAB+rZKlMyhQfzMB0jNKkm27AanDOyDUwnRJQ4looyrHQXrJ8iNzJk4dJ3SGiayRz0EaXwc/E9qD/S6xF6bGZwyseJAwIDeYxpZsXEh05UNbAVcCpP51+tRxb17C0Vj7qPQp5ozG7eOAKNROUnlGWR0hIBHiPwxSNrW31f74ewMu1MtAbHpeaOZ7WnaX4VaFGpx5wsTIuPtOkbXVcepC4yeeESEvJkOwtQ4PYM/tj7oNxfbEpSLLL5PYPAPjcC6aIyl2IbXWSJVCYfSLUlHpdYBqLj1V9kFTwSGq3I7msaxpYxwt5r3Y9EYdlQDDjXjmk3lDSNHXI7kiDRaC7zZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=iVMfMunNaNGAgAi21LDzLtPOGkmYteR2oeLDVlXGBdXhPFRd96A/UugWW+uH/U/yWM9l5wrpEUEZEP3YqzpqtxallKbshdQPEqc931qrooU7u6Q4ujuuy+NJbF38uObhvz3eThJQp+nXJRygV0myaPEQ6nMxdhUPOhJeOj7yjLWSJc3ialrPH8YWqyA81eYY4B4Nu7XGCzhTr5WNJ9n8Q+e9ey8cNvTMjOEraiyVZVF2+jO9C/DJH4GZUgSWwvbSCpH6L4RqQc/y/zK9hmFd7FR9hXK6erZmK7fKJTyxGI9fsuPfmAlE5nrIrAAjC93wsQUWCXKYUsH42gqsOlfyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wS6PRtgAhNisREd/aoz1oCMA9jgqJamgFreItyyyK8=;
 b=KX2k8lZVAz2p1l5G3ahBZ2UTDg5WEg9IA81+Nko7wVQ4uMfLrNyHFv9ygSi51fRMRjDjEkSq3ob/f8CQpgkCnQrtkDyWx61LZoyIP64pQD9bOEWVrF0AUqTKTo/c07biqBWGmcNYwiSQuLWM89HzoOiR2G4mAMBgqM3j1Ut1bAI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:18 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:18 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] drm/panthor: Implement soft reset via PWR_CONTROL
Date: Fri,  7 Nov 2025 14:24:37 +0000
Message-ID: <20251107142440.1134528-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7505:EE_|DU2PEPF00028D06:EE_|AMDPR08MB11652:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d0521a-88bd-4892-d577-08de1e098e3a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?asEXLgYRGjm4Qh/Y9Umph86XffGlrcDJk6OfJxGXxLRaxrAaxDJPmhE0JVGS?=
 =?us-ascii?Q?p62ezXLMVv97Xm1zGxDTMXBkBr5tCkg1d0lTiYoOML/1mQn/nRDs7CA1qYdn?=
 =?us-ascii?Q?Q/avu06Buu4pwtsReZ6pecCcGLcp/3zG/kvNiLrVDWmDTNeptV37qmbVa9ej?=
 =?us-ascii?Q?mzlSdBnouo4JcTFTyuafdvvUMaOuGJxu84RtV6ZPD3FH0LykBiRL3gqj2jn+?=
 =?us-ascii?Q?IcUjmOgpiNxIhS1kvfnOQZWg+Fe04GlDxxFcNiUyxtaLUxrXqGhi6AZb0Nhv?=
 =?us-ascii?Q?EkNqzoR2xgjLwzd6jBDkWT2o1T1rDGuXns/PfbIOcn1Y4FMJcLjZXl0srSTM?=
 =?us-ascii?Q?XgnZOatkMZjh1X2Nyr+WGng4eS4VdpTvVLBzPpyLuyvie7ZP+63xYxlJgsY4?=
 =?us-ascii?Q?l3ZkciCeAZ/Kcu61BEFnYm5N9lZi3MMTkaigV65KkZjyoMXpeYNJrA5ICq12?=
 =?us-ascii?Q?/gG+cLCC1/yNRJIbOOkhwRJpBvk9Fbqnurdi8JJisZ3emVn2B38bEU0ZZOtP?=
 =?us-ascii?Q?MWDlOUnLmGiOHlTNEZNqIh9Zs9MYEUqkB3mZjRiD9MKScdNNK7a0tY1R+x2l?=
 =?us-ascii?Q?EZ58RRbRcY1EJxCySiex1C6Az8s2dCi0rt3b11vq2aBEQ6RbmARKKwsWqJ8v?=
 =?us-ascii?Q?zKuwp/f+WLAjcPP+iyUztP2B0pjoaUT+V8wfuxmtJLHIeXqbrigJmsdelqg0?=
 =?us-ascii?Q?Iy7OlC4l+ocYRDfycvyCwlw5C3E9gXlTn9WQRLTkq6LTRKi8I8IZSeCC8Xjm?=
 =?us-ascii?Q?5Tzo/h+DvYStgQvLPPhNFJceY9o0ovkP65JJs6iU6jJm/tIBWNa6HrrZuDvn?=
 =?us-ascii?Q?L43GLlLGd2b1st3sbDrxcrQ3qXsET5gVir9IxA3J12dvveXXAzMsecPNd5Bm?=
 =?us-ascii?Q?EdhTRMUxJWR7aJeh152NZSTsYKDAjP+xTI4PKwhlZYWC1HSLoVRM+bnGnYod?=
 =?us-ascii?Q?OCFryLAAGdPEVBCxo3yNtQ/3nPQKCXBzlDV+zGGTqGYjXdYdFWqXfviR8pU7?=
 =?us-ascii?Q?LNyEtB+W9tHLJkdLZWh8iHt/KHnVH7lLE1P57sClpxVcq3wfE4/aFi1yqORl?=
 =?us-ascii?Q?oQFj21x3YHeyuNd+/rGmHfAqpUXsWm62JLKUGLOir8bYRH4+onRwcSi93lFn?=
 =?us-ascii?Q?77iRTiogQffnuzKcRq3IaEFxNMJKSAOjbOm/4QiQUcqCp5jhpLe4ms4LAXEF?=
 =?us-ascii?Q?pbqyopG+WllTNkIXWBps6hzBMEv4qNavxGkH48a2c27J3WTZoMIp3TkMoKGv?=
 =?us-ascii?Q?8YS/mADpizEC5oVEiTQ0E/NOks9ARBxaDQfT/RxKS86xFvpXzqGkxUFfqund?=
 =?us-ascii?Q?QjnOHprlQySX1nLZb8YPazxkWStOf0/tmYEpnnd2S5XrvjtkeTydP+DKrJmT?=
 =?us-ascii?Q?Zuv9GvlHM/fJLxdoMbUTEfS7SMH3tBBCJ+1V90yS/YRbbtuqpvNAZp21FSd1?=
 =?us-ascii?Q?wYoZkeNh8s3Gv+4I7RQhVAaHtCX2+l/B?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6c36b39f-4ceb-4710-4d49-08de1e0979bc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uL2ao20mvFN8u9FUm1BmqO2JRc5EGi0iBoh8u/7H2NfpCdcE9GX2lcDt8hkd?=
 =?us-ascii?Q?ZBGGJLDzJ5yHwEI/Paq9e/pB1NeWXKWh/0Z3WaORxr/7UX27kA/9X/wSWusU?=
 =?us-ascii?Q?wxgWesaqOC+SAExDyvH6z0krpbwWtXdhQ/JbH9QtXtAF+qjbXrqodA2lG2AG?=
 =?us-ascii?Q?Gaao2sPLHUg29WDfUIU6SnHGHJUL7zVk3HszXUpV70VuwJ/1U4n2VOI4Im6L?=
 =?us-ascii?Q?M3vo7CyvfO02cxGvaiAKtExBGEfA9R9IYNbJA7j144N76WPvh2Tyn2UlOynD?=
 =?us-ascii?Q?iq5WEVbjQ8bJujxl5erJ5hs1WghuyFr99t/3J2ecT6N8MZB79suKY1PHqoPw?=
 =?us-ascii?Q?qjHyZXyJaKoYbQ4IRnamFOSctnJdzEo5Xp8ZUYywJtGI/s+cNuE3bh87FKQ4?=
 =?us-ascii?Q?lqSO+PNDe7Ji+F9OdC9NQiE1+36uUOnvK9mxNh5tqemQbh7hGGZxgS+LmgwV?=
 =?us-ascii?Q?rrHWGNQWcxUisZInPz0/gBti1+vzBkp59fRjefr0PpYxkqnWVrZnljdLjh6h?=
 =?us-ascii?Q?/WraoF7GrPMzwQGOMHnpbxAr4IiWleTRfPyKmRya9L4TqPN8zjZl6gFYArTD?=
 =?us-ascii?Q?HGF6UxnM8flP+RJF3Suf6ESrs6n+id2p3xkYX7Fx/17La9aLt3gE+Tcu9aV4?=
 =?us-ascii?Q?PSTr+AKAlpNStA9e8ZhuRNCTRCeysP+f8ROQxd6cieweStSJBEApAQYygcDW?=
 =?us-ascii?Q?lZmaY4fC2QZw2gC0c/Pg8ZBE4aH7CO3kUMpPShLgmZxpRkwtftITelIvqfdP?=
 =?us-ascii?Q?w+nIsEMOL/7WWa2nQEEau9/du0Df2w5HlCrSCzLk/j7Q9fFQlJyUTM1SsEm4?=
 =?us-ascii?Q?zK9Ht05QdK6iqry1lPOX2cm+zcAjU/ECoHofkoqnoNAuaksMj1Y58JOZrj31?=
 =?us-ascii?Q?lLGWkS+IIno/SBTGiVMor9CWEuCjb703dbJhzmNIijuK9mL41S/gQRjE2ufr?=
 =?us-ascii?Q?74ZaWX8C3zbK0eeJW+DPTkFHiym91XNwOUEh/rICfLEzcovp3mm1hcQ7Y6+n?=
 =?us-ascii?Q?98XY7wBM3iQe+GuOa2/RPdo4rzFlJEDWHLjo68NbOHUTpt5vf/zKV2A966Ae?=
 =?us-ascii?Q?aqCd2t+BvXZTbip1AlYuRe4C1XRNCl5/JBKLJ1DDi7Ch5cBhdMqUhCZP2CsB?=
 =?us-ascii?Q?f40DKwfyqTyLX1rTDeK63jUaa1JnrZWZSFVUx6FiBn1bh25h8j9w+zNRtLnq?=
 =?us-ascii?Q?nXdX16jYdZUW9sN7ECwFcSlwayuH4A2ykta/YQNU4w2EXhdKJ/d7Z+BF+P09?=
 =?us-ascii?Q?Em7p+xR6sEqAOYrbDZF/SEIKEsIFv2f6xfq8C78PMdrXFdDhWZa/pTxG1n6z?=
 =?us-ascii?Q?HVR3i3j2HOYFldWgXjjv/8rkS6gHv1yjG2dTI0+/aGRuyc/p51UrMKh1LD1c?=
 =?us-ascii?Q?1Y8IYkC5rmALC8So+Sd6sHgURQeMevNPf2cSxoJe4ciwvOj6ftpRU8YThXj/?=
 =?us-ascii?Q?NXp/SErnuGYqtmFs5iwmMy/93dC/u2YJBquO8a8jJaXXcVa47NuNkr2IRzTo?=
 =?us-ascii?Q?v0b5NH/IxS02B97WhGi9y3VrVhkHGHwK5NJB8I8N5BULGD/UD+ssNLok7422?=
 =?us-ascii?Q?kGjPrcNrsQfHNJ9jWUc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(14060799003)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:52.1973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d0521a-88bd-4892-d577-08de1e098e3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11652
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

Add helpers to issue reset commands through the PWR_CONTROL interface
and wait for reset completion using IRQ signaling. This enables support
for RESET_SOFT operations with timeout handling and status verification.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v2:
 * Dropped RESET_FAST implementation as it is not currently being used.
 * Renamed reset_completed to reset_pending to align with underlying
   logic and fixed the logic of its callers accordingly.
 * Improved readability of panthor_pwr_reset() and removed inline
   ternary expressions.
---
 drivers/gpu/drm/panthor/panthor_pwr.c | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index 6dff5daf77d2..57cfc7ce715b 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -3,6 +3,7 @@

 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/wait.h>

@@ -32,6 +33,8 @@

 #define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)

+#define PWR_RESET_TIMEOUT_MS		500
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -76,6 +79,43 @@ static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command,
 	gpu_write(ptdev, PWR_COMMAND, command);
 }

+static bool reset_irq_raised(struct panthor_device *ptdev)
+{
+	return gpu_read(ptdev, PWR_INT_RAWSTAT) & PWR_IRQ_RESET_COMPLETED;
+}
+
+static bool reset_pending(struct panthor_device *ptdev)
+{
+	return (ptdev->pwr->pending_reqs & PWR_IRQ_RESET_COMPLETED);
+}
+
+static int panthor_pwr_reset(struct panthor_device *ptdev, u32 reset_cmd)
+{
+	scoped_guard(spinlock_irqsave, &ptdev->pwr->reqs_lock) {
+		if (reset_pending(ptdev)) {
+			drm_WARN(&ptdev->base, 1, "Reset already pending");
+		} else {
+			ptdev->pwr->pending_reqs |= PWR_IRQ_RESET_COMPLETED;
+			gpu_write(ptdev, PWR_INT_CLEAR, PWR_IRQ_RESET_COMPLETED);
+			panthor_pwr_write_command(ptdev, reset_cmd, 0);
+		}
+	}
+
+	if (!wait_event_timeout(ptdev->pwr->reqs_acked, !reset_pending(ptdev),
+				msecs_to_jiffies(PWR_RESET_TIMEOUT_MS))) {
+		guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
+
+		if (reset_pending(ptdev) && !reset_irq_raised(ptdev)) {
+			drm_err(&ptdev->base, "RESET timed out (0x%x)", reset_cmd);
+			return -ETIMEDOUT;
+		}
+
+		ptdev->pwr->pending_reqs &= ~PWR_IRQ_RESET_COMPLETED;
+	}
+
+	return 0;
+}
+
 static const char *get_domain_name(u8 domain)
 {
 	switch (domain) {
@@ -429,6 +469,16 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+int panthor_pwr_reset_soft(struct panthor_device *ptdev)
+{
+	if (!(gpu_read64(ptdev, PWR_STATUS) & PWR_STATUS_ALLOW_SOFT_RESET)) {
+		drm_err(&ptdev->base, "RESET_SOFT not allowed");
+		return -EOPNOTSUPP;
+	}
+
+	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
+}
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
 {
 	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index 3c834059a860..adf1f6136abc 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,8 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+int panthor_pwr_reset_soft(struct panthor_device *ptdev);
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev);

 int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
--
2.49.0

