Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1479FB10605
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3212310E913;
	Thu, 24 Jul 2025 09:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="R5D0+rCH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="R5D0+rCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9969D10E911
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:27:29 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HMzZb4MbbO0jOq2czXBqJFJzaru1wGAmYYuswPM8p+brTFPDmUanSMoF8sdffutaIfY53foLKvCTVOxIxMxbyBqcaQdZV2M7Ne5aHxB0QSkd0rj2ovkZ+0I/vN9xgnOjdDLEXXX4Tqso/12RZh/794tcTnp4c9x4HvtuqEKlb4KcnacNmPQ8mPfIKFnFrAnsoSWhop31SCC2jNRK5gZ0p4dNJ3Tp9Cb6IXwNk3fJMdt1KFMF12Hk6JKK6p3Pn7BhC5kbseewP6B6nNiZpPcpFiN1tTs4dhmBNE0+rqAKozr0Y3m2FogUGEQDH4eI813cdpPI3YrlQB/rAxjocl974w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1zTlqMLo+VyMVTLYpkjk07VyQbxEaFlguBlIVAlwf8=;
 b=hRXFCl4zmiklpJEJDV5ylVl4kehbx9EhX20G8Oz4QP4+B7a8grjs6gqprW1rpc1wRBaJhQwzp6F5BXhqJfunKTSP2zfadXJJ9al9Ea0FpXRB2AgnYBPkQu0X5RwKyUyo9vxidiYks3CaUXx7ZjU1zyL2S04wtpM1ronXvbMfYLe1A8mXGh9Ayew5cAMMHvELNTCmHKASPn6hKKWu3aqcPSlAayTulVxP99uC6+k5xbeWaqjKnI/33kj9VCfY62zP6BtL9ezrs9gKCoMAjWcFVooKqdQ0Y/uOhYQuqG+aZUMKDrjnvnloN7lyL7VulnFH+b5VdKNyLLX0dLDWuPUppA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1zTlqMLo+VyMVTLYpkjk07VyQbxEaFlguBlIVAlwf8=;
 b=R5D0+rCHBnedOyfIfkPBwpuyYODTAzrjEuW7gdHV4tjo8rED9g5285w44+ZM2Tl0M50A6F4HbkECKSvvXKuIdXMBMXaLCM4nKhrA3pU1reHD5gsxyjDg1rYjY4m8tmPV73exJRFZGgRmK4sxvP+l2FqCJdXhKwqvmJLLa1GtHXw=
Received: from AS4P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::15)
 by DBAPR08MB5720.eurprd08.prod.outlook.com (2603:10a6:10:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:27:25 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::e0) by AS4P250CA0025.outlook.office365.com
 (2603:10a6:20b:5e3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 09:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 09:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs2oe5kXIT0MeQIitNv2d1I8H+hig5KsL6hOl25lwjOfm3nLPyCs7jWcQClpYIzi/l98o8FWWc1kshautejRWC+nz8vjZaLSuB72DUluL/QMxKwqeM0CNdKCwD0+Bzvf36MGXJKulqrrtCU2n2u/XMty1NUF6sPyps/10yjGD51aDboYlk0Q4u9OtcFWmwfW8qy5cr06zhs0BTwVnK+tUHkh3ok6+8DrR8IzYvoBab6gZzcqYWQPbuKR/fLjRt2ShawKs0S6hITEUqLqbsIJkZ5hTA57x7C0PrTg2gAgb0qXbpU4UwL3w42PgxEPOqQuqo956cAnv3zoRutnzqgJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1zTlqMLo+VyMVTLYpkjk07VyQbxEaFlguBlIVAlwf8=;
 b=TO9I5dFs6ycJ0+mKevVd0/alM/aLDjhsTx+3VgMT2gZF7WWGVPjXkNgoHb75Ml8SFM9loEP1GxMtFTTANfThZmQb91uwoq/zX32w/nBQXR5tCfgo3RI81RG/b77vBC39vWXFPpRVe29GEBYOsJMwXFLxXTJh3CRFgIyCm+b5jWubSL1WKJhrSpyZMt0zGjtrNSPCgKgQgjrB1mWK4fkY/4UdssNRct1LomFQfZbLp1CC2aZHYjb9FkKDWkjNjDxN1XtGDt8B5qHW1GCjeaaqTIj+rybDhvHf1cukgerW7OiFVeFeupNAKUWxCaYgJLb8k+XSgVPwNpfYPKpcl2QlJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1zTlqMLo+VyMVTLYpkjk07VyQbxEaFlguBlIVAlwf8=;
 b=R5D0+rCHBnedOyfIfkPBwpuyYODTAzrjEuW7gdHV4tjo8rED9g5285w44+ZM2Tl0M50A6F4HbkECKSvvXKuIdXMBMXaLCM4nKhrA3pU1reHD5gsxyjDg1rYjY4m8tmPV73exJRFZGgRmK4sxvP+l2FqCJdXhKwqvmJLLa1GtHXw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB8418.eurprd08.prod.outlook.com
 (2603:10a6:20b:568::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 09:26:52 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:26:51 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v7 6/6] drm/panthor: Add support for Mali-Gx20 and Mali-Gx25
 GPUs
Date: Thu, 24 Jul 2025 10:26:00 +0100
Message-ID: <20250724092600.3225493-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724092600.3225493-1-karunika.choo@arm.com>
References: <20250724092600.3225493-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB8418:EE_|AMS1EPF00000045:EE_|DBAPR08MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d2cdfc-ede2-4909-aae5-08ddca944ce9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?flkLFmgwqH7e3SxkSt4yhl3FGENnQpkUWPeZ49r5zdiDr1nKgHEutTeRaz6I?=
 =?us-ascii?Q?gAA1nl915juxuMiny+sFQry4ExpscBU+Q/CPcvIWl/2NZOqvPa3bLkvCFCLy?=
 =?us-ascii?Q?XVHZw3DPiMTqt4l6XfpfwPJ7ajiE2gBWO68sTgZc70OpkIZpABLNWfBZqeZx?=
 =?us-ascii?Q?I10gA+x+ls2ePPvfBM2K2f/a0EZYDI2A34AwMQUInZklEGBjen+Q0yr4vJlt?=
 =?us-ascii?Q?lsO+BKGlHyVoH2P7VmZMEHV71jQi23PpHDNI/FhLh+Bqww4uAxOovzmjDBXn?=
 =?us-ascii?Q?TSIf5mrPX0mr7C1E9zqy42YLJgGtn9rN53auRAxM6d2xK3H346wmHGjTJt2+?=
 =?us-ascii?Q?+JR5Dk69y5X4GRDkSXOi7x0rhpcBK2JuTf4ol7re2pXdToOKEnwBl8BIbmj3?=
 =?us-ascii?Q?DUE2ROto10djWBd+mcsShOpBUDV9lWVpkAxGsg8IVPCH5CXAItCeMsvxHfrg?=
 =?us-ascii?Q?usOb0CUkd3VlIytOL/HdL/cNvh2TX2r3A89z1mYamq5eR+chTzL9X4ukEdoi?=
 =?us-ascii?Q?uWO3gKVEG0zCz20RopY0kS6swsuhR9hD4gOe27CvikHfNC+MqSlK2GBQXU+3?=
 =?us-ascii?Q?GKLtfkEar7ezV5QxCZ0lbRJIgENnDHqZGuJXvaciv5py2DcN0HadKjvp+vBD?=
 =?us-ascii?Q?DWJuPN7lGAYCfrfy5M81+B8DXQ75f/RCphq3X0jkhCJYSssb8w4PCjj7GYzQ?=
 =?us-ascii?Q?uP9/IH5VBzoqF7G5ZSw8q/YmmD+l5b0YZoSTDde5XcQwz2g3oKndsuc4l/0J?=
 =?us-ascii?Q?t0JgoT9nNBLX3OSDXvIlAt03aFx9aw+wvbKVPEQi/evQ6WHUdOTTAeCOpep5?=
 =?us-ascii?Q?JkPJ6I2PEnxS6jVHucylvEC5HubwBAb0TYyW6LnyHMy9B9gZyuV01frFKh+a?=
 =?us-ascii?Q?ygDKtH1ResF8UNxauCVqnaWyOe+nYUcwmwVmFmyAjSs6ELemV12FI5CP0W+Y?=
 =?us-ascii?Q?3ul6F5IO0WB2l9qJX3J+k11kmv8FY1avEijc0ES3ldCFa4yZjmXhXaNU9+e2?=
 =?us-ascii?Q?Egc8tYXKrnoMxhoFHIvikoPyZ3KnOxY7jyHuDnQTelR/yvCOpaK1okMe9Mkg?=
 =?us-ascii?Q?zwL1K3vu+Rj4r/yJjvX1tZnb2xCRqC1O1OAoQoYIzWTvj9s+L68J8os3Cucp?=
 =?us-ascii?Q?lxTJQTG0OZJiPEMnQKx+eLy2D+7PhKgkgJ++4Q4qR6JTTyAg4bLqHExsgsHH?=
 =?us-ascii?Q?9CKNB3qk4m90iXaEqClNXfUIZrd1KmbI9id9nWSH2wS9K6flP15Kx8utwXhy?=
 =?us-ascii?Q?iqPtpXFYTnDKx88XhsZsxklqKAGaGGiDiK9KYLWoZTJLivHH7+sOHhsauQ5f?=
 =?us-ascii?Q?OYZGNFV+5GxFduMJ+OXJkYfYdjVBJOP4n6jU+EcRaEEgfomi50m/9Ri7df78?=
 =?us-ascii?Q?/xWERpHwDs7HnJaVcaRpgJ7wXqIZ0U/92G05u+tKylCdIyTz3sAQrYgnfU54?=
 =?us-ascii?Q?q9QBFlWoUh4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8418
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9b0d2cea-e127-4496-5a5d-08ddca9438f3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+CdVE3nlntyNNWPu4QYNe+9Ss3s1PP3sZpj0CZ660SuQ0e7BOBw0nlJDElVu?=
 =?us-ascii?Q?cZmXg9pPJ1SlKS35ElbBScIhvCFloBWnuExtmFr/bcCumRYo8l+lpp70koVB?=
 =?us-ascii?Q?wQ/fPHHI71rxLunnLoNsFSq4IaXcWEAydrZ6EKt9fDb97VamyyaUvi7Fh3FE?=
 =?us-ascii?Q?CdG+txJupUbn9NHAKX7jIC3zzT9tKhtWh7SoT3Cxnanvija0qmjNethECrJC?=
 =?us-ascii?Q?wWP86TOFBoTvp3yYxnv5B7RJ5ZFpFGStFKjW92IPe9ktchZXziAgcAno6w3M?=
 =?us-ascii?Q?zmULE21ypH5y/5t5taNCfneXkKotifVmK7opiV1g1V53LROV5iqQTTYZAIhO?=
 =?us-ascii?Q?MPNILXhYEP94G16bGiPjWEMsGhmAgYHc48fAJsVTSXhFexQ4TrxSOaN4hYNR?=
 =?us-ascii?Q?LbU6o6I3adI3rX/wZhE2n8Wxu3ILRcRx3No8IVyFlOz5sKXrf8hiLFtilvxW?=
 =?us-ascii?Q?kxEBqOvuG2uJplL9Z89Rnz5eCeZwjgqlXa4q2b7x7tTUiobrcr+0ZhIIybzs?=
 =?us-ascii?Q?pr58G7XT9C44kGBkCLWV1MMEezFVHyG0WK7DJoMKXFSADhFAnhoWwnmY4s1Q?=
 =?us-ascii?Q?8LgTt7n0wXkG8bi2ZTo7dtgwElAQ+O2VSfHizEtK81z0WWDVfSmDdEMofroa?=
 =?us-ascii?Q?IyWrA6F0NM001u4lk0TcJQ1vgNMBfq/muNzFKgEM/MGxaSmgdcpY481ucoIP?=
 =?us-ascii?Q?tR3ov0g7EPD81OL3m+rL8Ir5X6/7th1pHB28dPwBXIOlpEhG7anqQjkPec/g?=
 =?us-ascii?Q?9W1Atxm7dw0MtUsusSPv/OXy6Q7FPBPLK2oGGbFnqluzdUcVvtDCVv6RnyCm?=
 =?us-ascii?Q?1va5FbEHIoKT+x2WUFPyIsoo9WCktUSyPKdmwBO5/2BnNHaCFWX+w+hBT7HA?=
 =?us-ascii?Q?3ERwLSUKNAysip1fYO8IWSHJ23Bp0uL4mUF79JwBGc6hvvdK4t1Hx7WB09pf?=
 =?us-ascii?Q?4l8qKKNRBq9tQAtNRlYY+RmyyyPYMcXE/eqRqam513oPADb/ug9Mkaae5JZj?=
 =?us-ascii?Q?nx0vEb9QVY+pe6Jqn1PU2axQsDof4GnLbfCF3q2TbSTNlSR68F2GaqPu7Yg5?=
 =?us-ascii?Q?jJx4n9YW+f84zsyt6crIlcjtvuWYuw332ffD1R/zDiGA3E2H4g9X2hYcRJat?=
 =?us-ascii?Q?F8HYYcb26bStC5TxoLPdqmEe1YDPUNIp9cJWAamh55mj/KeVJphynnafgfAZ?=
 =?us-ascii?Q?utoLk3MY8LYzniniKNCEjMEjEArWdrXf3CyuW3+2kTn3sPQjeDq25fuyAxyN?=
 =?us-ascii?Q?pM58iFJuhbCCdwBYKxQio//exW4bOH1rPYC2gB1c+yVzBJokPjuG+ez6kSy+?=
 =?us-ascii?Q?GMub7RTLgWvOLMZcYFesTT6oviaybEIeSi6PYvp/06KKZUsdVAmJA7+o0Ihd?=
 =?us-ascii?Q?+ZD7KBupsisE+6cWFbJQDGFLJyQ2eFOz9gAzcjM+LqM/oI38QFnqlpavZ2YB?=
 =?us-ascii?Q?ZYK8LXiwqMaF0obRFoKcuK3DgSdYk+uHdW2cUAj0Y/aOJFIk7qMPGkI67Def?=
 =?us-ascii?Q?kT8pM+swG9d7lcia/z52tqp3FMES/xHgLDQi?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:27:24.9838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d2cdfc-ede2-4909-aae5-08ddca944ce9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5720
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

This patch adds firmware binary and GPU model naming support for
Mali-Gx20 and Mali-Gx25 GPUs.

The GPU_COHERENCY_FEATURES macros are slightly reworked as the
assumption that FEATURE = BIT(PROTOCOL) no longer holds with the
introduction of the SHAREABLE_CACHE_SUPPORT, which is BIT(5) on the
GPU_COHERENCY_PROTOCOL register. As such, the feature bits are now
individually defined. Further changes were also made to enable
SHAREABLE_CACHE_SUPPORT if coherency is enabled and the feature is
supported.

This patch also fixes a minor bug that incorrectly writes ACE instead of
ACE_LITE to GPU_COHERENCY_PROTOCOL if coherency is enabled.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  3 +--
 drivers/gpu/drm/panthor/panthor_fw.c     |  2 ++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 14 ++++++++++++--
 drivers/gpu/drm/panthor/panthor_hw.c     | 18 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  5 ++++-
 5 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..b85a744d99f8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -33,8 +33,7 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 	/* Check if the ACE-Lite coherency protocol is actually supported by the GPU.
 	 * ACE protocol has never been supported for command stream frontend GPUs.
 	 */
-	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
-		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
+	if (ptdev->gpu_info.coherency_features & GPU_COHERENCY_FEATURE_ACE_LITE)
 		return 0;
 
 	drm_err(&ptdev->base, "Coherency not supported by the device");
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fa6e0b48a0b2..9bf06e55eaee 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 5e2c3173ae27..e8d8dbeefac7 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -45,8 +45,18 @@ struct panthor_gpu {
 
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
-	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
-		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
+	u32 coherency_protocol = GPU_COHERENCY_NONE;
+
+	if (ptdev->coherent) {
+		coherency_protocol = GPU_COHERENCY_ACE_LITE;
+
+		if (ptdev->gpu_info.coherency_features &
+		    GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT)
+			coherency_protocol |=
+				GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT;
+	}
+
+	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL, coherency_protocol);
 }
 
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index a7583342d797..3fcb69a6f959 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -35,6 +35,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(11, 3):
 		return "Mali-G615";
+	case GPU_PROD_ID_MAKE(12, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G720-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G720";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(12, 1):
+		return "Mali-G620";
+	case GPU_PROD_ID_MAKE(13, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G925-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G725";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(13, 1):
+		return "Mali-G625";
 	}
 
 	return "(Unknown Mali GPU)";
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf8..1beb365c0fec 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -111,12 +111,15 @@
 #define GPU_REVID					0x280
 
 #define GPU_COHERENCY_FEATURES				0x300
-#define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
+#define   GPU_COHERENCY_FEATURE_ACE_LITE		BIT(0)
+#define   GPU_COHERENCY_FEATURE_ACE			BIT(1)
+#define   GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT	BIT(5)
 
 #define GPU_COHERENCY_PROTOCOL				0x304
 #define   GPU_COHERENCY_ACE_LITE			0
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
+#define   GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT		BIT(5)
 
 #define MCU_CONTROL					0x700
 #define MCU_CONTROL_ENABLE				1
-- 
2.49.0

