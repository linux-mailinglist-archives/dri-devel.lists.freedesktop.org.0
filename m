Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D8EC238AD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 08:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997F110E95A;
	Fri, 31 Oct 2025 07:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="HOUv4Xyq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HOUv4Xyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013067.outbound.protection.outlook.com
 [52.101.83.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BAF10E2B1;
 Fri, 31 Oct 2025 07:26:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lucOYV3U6Bki10o6MHKegR98p2CtI+Uo6AW63laLKCERI4CZhbt+U4n7CBjyUpOsU0Eh6oTw79kXkiGxSNYFoC3yZo7M05hTPlXu6djuLlDqhi78eKIn0TpTbKHK5Oo5tm+/Yf4HXSRrt3PnkNT/r/MgeJ7aMIlPpsvEHz8fNkqt4Z+Jo8jMhFj9YCFZJhQpZ01Xaep7bbS49KWrc4CgVoVAK8/A6++mDZ5Zzc+49rVNDTbeXu8oToWDTO0v/oJb/qDprR/LyX5ShITUGQZfFH8z5sBTGXCU/MlUwetBDKN+Pf2wXiAK4ZJpvuo2LVXBaFFM6BuoTxDk8Ak4rH6Xzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3jaK4ngm0qmBSfkR0E3lV6FsEcYm4Dh9qvHnM9nUkc=;
 b=EgM698MLTfEH1LQS8G1744G9pv9UgoCEQoLQVGWchKR5b9JXMs5teKwuEfm/rjIosoUqdm/qGoQBB3o7syX2Lw++MKQ99s5KdkrmaSh95GvbON4ehmMp3M2t9DeWlF+YCRP0E8xfopOVBfhCn5z+cmTpnA6XgTaC//IOWAGXB/soxDF9mx6vGEDpuusaCJVrW0P+hYh/CQLaEerkr0UB2ingd0xOUfZxov8yDHuqkYCKh74et1gP6KloSUJO74vfs4+IOYRfXxc3ILmtratdHvP5wRBmz8zLV8foQ6PohGJ7AVs+8qpyDmIEWS4EuKs4NQ6ev5PLZPUTNSnYfcMHJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3jaK4ngm0qmBSfkR0E3lV6FsEcYm4Dh9qvHnM9nUkc=;
 b=HOUv4XyqITURfnYCqm1wHIIgljdYVazLCyRR2OfdQmEhMU1YjRIRIfzMFplAQNfNP0cwea2SA1ZIzZH3KCkMvyc1PwqGbYnxeCT1UTsCRweYopOyLHwvD/hOfJ9yPVn6Z8VavMsCM/qDBrWOHbdANXgXnmi5ZYyD09ZUf2IwO1U=
Received: from CWLP123CA0180.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::17)
 by PAXPR08MB7466.eurprd08.prod.outlook.com (2603:10a6:102:2b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 07:26:06 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::83) by CWLP123CA0180.outlook.office365.com
 (2603:10a6:400:19b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 07:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 31 Oct 2025 07:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5AX0GyiHyhLVhqDTuJ6BE5L6ggDdFdQ6hrMTeMmGB736dDlMUGQL8MDcivsUWEocbW5q325KMV+p32hp/VyW3rQr0qz3hc4RkvNt/f44kTnk7+1b9KLSQGuNrHOqkHwzP8gQ3tHaQnLfg3v0fdTlWxjV2I6ZiWfUEe8PsHMpBtfmNvAGtWy6JDdbPMHddfY1ChPdGaIH6Kbl8haBja4XTTr3IVm7rAXAknZMKCdKe0+j/xs4B4JNLM6yh10Op7Giu/v7Wwn9drjnVNOPPuJntyVGN5LaKk1CdaqJZZT5Jup9O6P1fc0IRgOGoJdwHFwEidA4D+80xlvu7SOCNQsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3jaK4ngm0qmBSfkR0E3lV6FsEcYm4Dh9qvHnM9nUkc=;
 b=MSKmHwb07r96u3mX5Eh9O2UUDhImjkF9szwQ57ExYHkAWohJ52v7lM4aWHeOF6epnjF7YjZa/qqWSCH1ymseh/+rbULH++Xu4x0OoS9muc8EK/GjDm5eDEyKwO+IMh+lKJYWUtDJeRH93aGL/0aVH9v3CsHcINa1//eRYUY+5ffy7q1lUCKrc/ty2OEg2yHR6SQDl1Mqcc+5lDWlVegECEhjwa0mdKrGYBk20kzCuCmmKRyaybXvyQyKetFzPgulqtMNvJOhq8HsbYxL2xwWtJzOypk4UDCUb2LXrSyUj45B5azn9A4YfB2AImWoWpKK68OuXONhreCzIU0PTuuCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3jaK4ngm0qmBSfkR0E3lV6FsEcYm4Dh9qvHnM9nUkc=;
 b=HOUv4XyqITURfnYCqm1wHIIgljdYVazLCyRR2OfdQmEhMU1YjRIRIfzMFplAQNfNP0cwea2SA1ZIzZH3KCkMvyc1PwqGbYnxeCT1UTsCRweYopOyLHwvD/hOfJ9yPVn6Z8VavMsCM/qDBrWOHbdANXgXnmi5ZYyD09ZUf2IwO1U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PA6PR08MB10694.eurprd08.prod.outlook.com (2603:10a6:102:3d7::6)
 by DB4PR08MB8077.eurprd08.prod.outlook.com (2603:10a6:10:387::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 07:25:30 +0000
Received: from PA6PR08MB10694.eurprd08.prod.outlook.com
 ([fe80::3e92:fa93:753f:8405]) by PA6PR08MB10694.eurprd08.prod.outlook.com
 ([fe80::3e92:fa93:753f:8405%6]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 07:25:30 +0000
Date: Fri, 31 Oct 2025 08:25:25 +0100
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v5 07/16] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
Message-ID: <aQRkZb7qIkgywNXG@e129842.arm.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-8-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030140525.366636-8-boris.brezillon@collabora.com>
X-ClientProxiedBy: LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::19) To PA6PR08MB10694.eurprd08.prod.outlook.com
 (2603:10a6:102:3d7::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PA6PR08MB10694:EE_|DB4PR08MB8077:EE_|AMS0EPF000001AE:EE_|PAXPR08MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f287f3-9f5c-4f6d-03df-08de184ec0e5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Si9l3lrS5PfdFxQ4eAGEP+nMZvVecy9EulvDPwMT3ebCeVkcse3FQBZVq7j/?=
 =?us-ascii?Q?jyTcsLeBaAfNjuzSBIf4JEiNjfknWJ/A11fADjv81d1skPxwVgZYwa1XdBMv?=
 =?us-ascii?Q?CSiky2PF/6jWT103dH7ys5I4SmrJzVjx/90Snu0bhpGIupaQBFAFmsdY65cJ?=
 =?us-ascii?Q?K5K9c9EbpuViGj/bJ45COOui6HgORGwZUBuZBjm2w/NjEgahEnkLbIoo5M9p?=
 =?us-ascii?Q?CLLU7o+yp57Ul1hKKUkFxkr1OAaASt8aB9/vg6CRhrFwMcf0GzAXyvXgyyYn?=
 =?us-ascii?Q?eFaenGzFwF57xbbs8oyeKW+NVtI/Nw0aQXHzQXBNNsLNuXg339KYhcXh7Oun?=
 =?us-ascii?Q?kO67i78JWWl+q+aA3twjEwIutw6GENUH4w8vlyp80hCb3+WMXhx0VmChIvCq?=
 =?us-ascii?Q?nSCLWSO9wrpY2IzxN1dB2brtGM5ZT7y5A/i/V1K8ychpCZdJdDneZPVMMw14?=
 =?us-ascii?Q?Sxtf96iJ1L10k1pszWo10NxqCQQP3jFQVI4Yd0xCkPhs6DtnVdyJsLZqtp9K?=
 =?us-ascii?Q?WCoqXFXqcSaR4snLnMUmAxYhXMl2bOw3NHIWu7RrsN+ia7+jI3mkJyfeqBuN?=
 =?us-ascii?Q?MWw2GNKDON5ebEvvIet8onElswNo+p4fbA9e7HzU7SPru3gWOLjCIBobRlwB?=
 =?us-ascii?Q?KyxbHNqy0IFrCzhA+roS78e8OA7Dw7yHs2fiUnFxk0OSQmE5lDGNsEnoJyjg?=
 =?us-ascii?Q?AwcbJswbkqxAXbfznKBwgXWSkxCMrClpnXokZwVBHXNftCSRxwp/jnQcIDVk?=
 =?us-ascii?Q?thW6v4zPQGIZSDe6TsDGsQNKh0x4O+TkPV1fyf8kLYdMPJxyKKA2suRf6eS6?=
 =?us-ascii?Q?ZVT9RquvtYpi+F0PmtwvbwDFN0dcNNUQbtj2UrphotGL/go+ALVBRGuBq8mb?=
 =?us-ascii?Q?tVGJg2qZJ1k0cr0Be4xWE8oknhLKRCInS9Ms3I9Adk9Xdl+i0YdPXgVpGXhE?=
 =?us-ascii?Q?pS04PTx8LSXAIjTNPwzwjuUfnGLW2Faejab7tg4OimX0Hly5F6AA29NnUa2z?=
 =?us-ascii?Q?53L5xJvDOZjuGzdJEk6LsqmW2lpwRQh5sgs/es+IyMi/OhmO7cX27OFCTk1d?=
 =?us-ascii?Q?DPF9UhetVEmDwtUzz1yY97FA/YeBQPtrjJwRcc556q4gLY1cLeyw8iOKY67E?=
 =?us-ascii?Q?3V41azMbpQBLTh8R/MgE3ZP2p+8N0gZPxRmT35wQqcb095SXrxzUv4sYRIog?=
 =?us-ascii?Q?EWJpnhZqfO/BtT6WDjd/aTuaFjnipVqphfB5tfw5GTJJ+EyGhKLD9mr4erML?=
 =?us-ascii?Q?A5eqf+hLpehhozV5fcx01LtsrZAxlX+H0ZJmX820+CWUoPU8XdnqKEKGcu5B?=
 =?us-ascii?Q?K+6SFPWXQrqYk76TA1XtBoKIBuoexu3nF0Khkot3Y2cL2iOXDrebR+jI+71q?=
 =?us-ascii?Q?avYw1H4e5JL81EiMGP6umWhh4Ge1qdvcHg65S+fz1+O9o/j33W1ai4labyej?=
 =?us-ascii?Q?6dz4oxpudnkiEifCkBjcQB9y1DP/kEXG?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PA6PR08MB10694.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8077
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 22b7ee33-7a41-4690-86ef-08de184eabd7
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|14060799003|7416014|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9l2GiM2wtuor36mxoCuteMgCyORWodNNR5U0XfXLz227/Z2YsaBNBlSivTxK?=
 =?us-ascii?Q?dB0JEnllubJCsRtFwYxlO78LfMrp7ILv7Bw5U54D4aVkNO9j5oF24I3rO82J?=
 =?us-ascii?Q?j5UV16dSbnKcGjI3BR3R0THX2D8+K8ssexl7lIV8PLYLkSZ6Ul1JipKOERK5?=
 =?us-ascii?Q?ZalGoRiGkfO49GTNJ8irJftEVDwhFV3Kts0SQXtAWL/t6XQDBZ/Zd2Q3can3?=
 =?us-ascii?Q?8UapUZppLN2hcDWoCzi4W+PjSJUeWjnnpKsAP2qMOVxCqI3bbebhm0n9riqK?=
 =?us-ascii?Q?UbnBL7aD6Wzv9bJEwZ2+3sl7N33sdb9L7GHYEZs4reSmiVJTpkELStB/Y45e?=
 =?us-ascii?Q?AthgcF4Q7UPZYaw01YDt0yGhNoF+maC/jLkWw2mvj1rvzYsz5ThuHJQ1T6s8?=
 =?us-ascii?Q?Z7WLwsf3RfbC0wLSw7PI0LJaMOss/mhr4ZGNHggFIHxrcudaJYMjQ4tAfUm+?=
 =?us-ascii?Q?PKwMW+9XwS+ec/706+7HwNX5lLp8jdqY563UmLx/03Qy7K47igNk3uxgn8n/?=
 =?us-ascii?Q?F09ZWHZ8xIqDSvAqfpnbdlRbdhVO1uuu4kbESHfxpgwLjaCv0OGnRnshU5Ud?=
 =?us-ascii?Q?XIZGl0TlVFBYrXIUFioBoq7WPKAjubD8eDolaDfZZa+cb308EIfE+u6Fr8oL?=
 =?us-ascii?Q?slqiBerEmOIInGWm6JP9DK5KhhdDztXmF9trR18/uWJj4MtsUDCXJaApUc2P?=
 =?us-ascii?Q?xHrz9zZpXoWEGx5YYINyq/0MWL7kLaKtqQcK4YIAReA9pLv8fMSZO5jwLpWL?=
 =?us-ascii?Q?OGp8rwS5zYv4oArwjqgYFqouNOB0tcwByuU4wVlj0r06Dfxr15bYcq0Mp9R4?=
 =?us-ascii?Q?aG/fMXOm+2dM5ep0SgH12yQ6HS7QkiPgn1ZVdZIY7vAmhu10lB2HtlqS5SVH?=
 =?us-ascii?Q?21MpvH20KSVPBVLwh7kn2vpH/mbg+vhGnGDxp1wgyosiZOAvrxT0pVGcNplJ?=
 =?us-ascii?Q?+LOECB7LziFaBJ1ZOx/eMf4DAk3PkJ/lyc8CEfbWb0fcjMIs29NyyvUNBfEk?=
 =?us-ascii?Q?oM6NsKQnpUruyna1Juwnlsemqe7AOZmjG4YD2TpXwyy4T3b5ZXSK9yeglI9d?=
 =?us-ascii?Q?G0n4EfCp+vuS/PlTvb9okSTyyJFblBEhvJpiMkNM08hmv3ukeVFrU69UIpOy?=
 =?us-ascii?Q?u2ugZAWPDvPrqZ8+5fqDsM8QpoFDUr/EadtVNiNGKDB+AnzGaqwP+gVhZBK2?=
 =?us-ascii?Q?43uZ9I1b+08w6k0JHAVklxmqgRfEtR7DxlF2lfXpds1GUu2hJx0H+5JWNA6M?=
 =?us-ascii?Q?L6+Q2CsWFDA2rPVw/9dMRz4EVcX/8gCmFSkDcfrAcsX1Ef6+WMayRWH2in2C?=
 =?us-ascii?Q?16SiPt+FbbMT6dUzjaKaEWRQjUMEF9tPFsiSA113Vmn3L49wcU61koVS8Elm?=
 =?us-ascii?Q?AR8pQ3WqQy8OXgw7W7kXpY2BnhedmOGCRM+KfWwLk7ZZDaSjAUJfqBdQTSBQ?=
 =?us-ascii?Q?uGCkXm6IUHtP65qsAC//NgxQkKitydgCGaIX6zgdKzbF8WCq9/AjYkXOs523?=
 =?us-ascii?Q?CkxHBponUV5yEBeXnd4c3Sh5H0GfIUH+oGWZCYz7uFX8FXmZrwwO9LqZKP0l?=
 =?us-ascii?Q?+kprnIUTkb6003AweLk=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(14060799003)(7416014)(376014)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 07:26:05.5077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f287f3-9f5c-4f6d-03df-08de184ec0e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7466
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

On Thu, Oct 30, 2025 at 03:05:16PM +0100, Boris Brezillon wrote:
> +static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
> +				 struct drm_file *file)
> +{
> +	struct drm_panthor_bo_sync *args = data;
> +	struct drm_panthor_bo_sync_op *ops;
> +	struct drm_gem_object *obj;
> +	int ret = 0;

Not needed initialization.

> +
> +	ret = PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
> +	if (ret)
> +		return ret;
> +
> +	for (u32 i = 0; i < args->ops.count; i++) {
> +		obj = drm_gem_object_lookup(file, ops[i].handle);
> +		if (!obj) {
> +			ret = -ENOENT;
> +			goto err_ops;
> +		}
> +
> +		ret = panthor_gem_sync(obj, ops[i].type, ops[i].offset,
> +				       ops[i].size);
> +
> +		drm_gem_object_put(obj);
> +
> +		if (ret)
> +			goto err_ops;
> +	}
> +
> +err_ops:
> +	kvfree(ops);
> +
> +	return ret;
> +}
