Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E08ABA071
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9C110EB10;
	Fri, 16 May 2025 15:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="j80WNTsw";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="j80WNTsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013002.outbound.protection.outlook.com
 [40.107.162.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828B10EB06
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:44 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IDqlhvzXs4gamYThPhr+OV9ToTld8fYOvGezI7worV9jVSRqXVSGyqkxVHq/spcLQtEqsf/4himAnchs342mxb856ke47AfxbDYqTmWkjQMIGoW5tZH8qK8ABvESJReI7AgyCzQ7pRmsDC1n7yn2tD95ArmFx2F784UktYx/QjLaEoCS8VVRqeW4+vLC3phPedNihber/I18W9nDQPjIJb+h3wW1Dvjj6au7sDoFgD35esF61E7csvvvODo4CGV2aT+TpkQ4bFEWixFALCIv3T917sNJ5ImVqkvPlfyVTWfL1VBjmzVvNFG7hHzb0Hdb5uZiC1UAm9dk8YaceGy4cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc/l/h2xY/LpZcJxCXCz//lkpkcdc48uaTzdmoQJPFc=;
 b=S9GPiWizlCMlVL0mnCH2PcTqn8x3WgImB+erjKFx8zqNAwa+Xbrq8fvTr8jNWpENDL5LroOaKDcDspe4foSxIZTD7tTEzTXY0arYTNvNatG6jU54Km77f7ZdkERvifIXKtwPlZGyOx7Mplyet+Iva2awPJDNxXrFri7hvcqcmU+EbyEMvSUa4S3Eke6jazAnSox2fA3eomV9TwBkahhBUcydZUuT4SN6CtaHALO9NdssgU02rS20IRxxH33cFOR2vFTl7TNBoNfCtSB+aEc5tE0xBnqiYVa/SpWehH7Yf23W/rkCHA6ZzmlXHmuyzHM6RTuz9SPk6Kn0Enrx33WjtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc/l/h2xY/LpZcJxCXCz//lkpkcdc48uaTzdmoQJPFc=;
 b=j80WNTswYL/kQX/7Gy9to9wCDHirjUNxMTb+i7NoKwwJDQ/CtLILD8V+MLz8dFDTu28dZGNrNKVO9SPUdKnLofwuJlEcIA0u9b1QO/UWESSAeJHbye9dU6h1rCmcb+Un8YqJeMlYAEz79guTXECIsw/s1w5mjB/7S83EEtZBdqY=
Received: from DB8P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::38)
 by DU5PR08MB10733.eurprd08.prod.outlook.com (2603:10a6:10:526::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 15:58:37 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::b4) by DB8P191CA0028.outlook.office365.com
 (2603:10a6:10:130::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.24 via Frontend Transport; Fri,
 16 May 2025 15:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:58:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrA7Dq0DDIEIlwVipVD5XqKdLF+Zy/x1njDzZy8XF4CFMk9NxKnJW2W3MvtIfisNnb7rS80huYPh2eMxMfA9FVzPOZ54e2jePdAUEija2L/SYfxHwHFXC4yY3nfE8i8wfsdpbB5TGuVZOEIe4ecVFuQWDdLZHnW4yEzPWik5RuOCwtTp3dzj9S6c+I858rWCNaWERVFwCH1eQIcLa9+9NWXeL2jxzH9cs9rdMXrBviKdddV9nqSVTx+YDGpPgwmeQF+LZIp0U8LyobmhzJ9otQJMjAV2NxblHOHZs2PlfOdTGvFWCiljeE9hDIXFinhD9hS/KwWAVef9N10JswDSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc/l/h2xY/LpZcJxCXCz//lkpkcdc48uaTzdmoQJPFc=;
 b=RXxMVzwYqqshdN5+uPTu+BiYMNb5+PHHQ/9ihNpKjFF+VY8exBEodRupK6y7KKR08ndqHIPo0AxKm1PdcbEwqfib5iDxDsNHNLgwbh4OLHXiVckSuEMJHl2oYZ9n3rlbX+9YJhD4lvLxPsrCiN/p7FpZaEem1QNLVmpKKNdxpg5BvglsdhoPuzNjjEU9qPuRUafeKwilzJfnLTszLloespuS7w8gSwf1NeTc6NQF4CCwT1pAFiDCK2d2C9UBsJx+8P2grlimQR6XISzOndKs2T7djGjpoaok6KxDzX1KmIVf21RGC+2tbZNLTFmRA6JKbcxMMxeddEQxh3kmh7lPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc/l/h2xY/LpZcJxCXCz//lkpkcdc48uaTzdmoQJPFc=;
 b=j80WNTswYL/kQX/7Gy9to9wCDHirjUNxMTb+i7NoKwwJDQ/CtLILD8V+MLz8dFDTu28dZGNrNKVO9SPUdKnLofwuJlEcIA0u9b1QO/UWESSAeJHbye9dU6h1rCmcb+Un8YqJeMlYAEz79guTXECIsw/s1w5mjB/7S83EEtZBdqY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 15:58:05 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:04 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH v4 1/7] drm/panthor: Add performance counter uAPI
Date: Fri, 16 May 2025 16:49:35 +0100
Message-Id: <654f9c0b60ff6af813b901538b74b67685ce99a5.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1747148172.git.lukas.zapolskas@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0565.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::19) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU4PR08MB11174:EE_|DU6PEPF0000B61C:EE_|DU5PR08MB10733:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ce9d38-31e3-4540-5a40-08dd949284cf
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?zU2hKL78ct35LeP8V41OFam8yxtyFTSD6v7BtacekJajU1D6vBBeZ9FX8NCe?=
 =?us-ascii?Q?djR7wtteNfBI6/U3UgJ7daj3OPxHWmsEyyZ3WEZtSTUOLjShsU89a6NBD83v?=
 =?us-ascii?Q?9lZhpWCpfooHcNb3U3xxnuapjREu9mhsH+dycttJcfOWL+uxK/tmglaayeoJ?=
 =?us-ascii?Q?d8ECPiTaqHuqa1/tJjhMS0UlQV9czZCTm2dJ8urNGARtrDybsM0ef1dZdVJ7?=
 =?us-ascii?Q?sp/RhefSge0kg11v4hla1lJvR0YMlbxVAFK3pA+JDbweazmzHIHjCpeVx8Cv?=
 =?us-ascii?Q?J1qzVefQbE2mer6WG+pIuLOX9ngPU4lpwoCPHJnnMMdtdrNDW+KzB8EH+fWv?=
 =?us-ascii?Q?8zYmDMfdXMCcNAQa66BYg7MqM21W22XuO81+CAFG3buiojLAtvUUopRiU8Hz?=
 =?us-ascii?Q?lS8TuhTLraFVth6vNdiee2fMTB61aLagIBglxc06Y5xt37RlUBjbtPk5LAMq?=
 =?us-ascii?Q?xA/ynJYczCg2Ld0vJ2NH2hEqUbYd70CiAHTkeTq3BsU4gpO2gM/IG0bu0CFj?=
 =?us-ascii?Q?O1xCfLHRGDao6CIGOkMeuccIEsCxwRpn/M+rwESi6Bz86szR7IjKdLYphTKL?=
 =?us-ascii?Q?Ltwa8s96oG12BFexYymgwWEWRAWmaZ16PVC5O1WH7xzNvgeWtwaXHwMDalQU?=
 =?us-ascii?Q?gAclcWJ3ihPIObHJbaMcGjL+AxgykN2hCvikktKykDeyOjynLB85raBdigsG?=
 =?us-ascii?Q?lxr/kGZrzeRqOeXK2Fnq9tYG4SCXvq9idApNg6RgtFcRHWzveHL2vdGZOg1n?=
 =?us-ascii?Q?BTdG5U9D0VIYdl6qkFLhxuixmhX7nfBjzd3XhrJgONPwVtqzsIloYwReTyly?=
 =?us-ascii?Q?kaGKXlJfGWP3Kcd7+X22xRyAaD80niy8+CddLSeFidxaGMfKGoZ4zSM+wFhU?=
 =?us-ascii?Q?Cf9ngZT86qprYROQk+wh8fWYe26u7oBqQN6HjpzVJL80OHEQcfdRc2+ejUt6?=
 =?us-ascii?Q?LipBMvji+dQ/Gh+Ct/XJwb9q5go0Qu9nAqIUrfpx/RIOeAK75RwvghiwQDmI?=
 =?us-ascii?Q?xQldUZMp97oBO6gPO2BFncgUtcSa6qrLt89QOrCTCDoqvec6QS3MOD+khJje?=
 =?us-ascii?Q?/+QwOzbvXH16D5pkxDOrY6Jw2W3Bm7MtYg6R54hRxugVX03GVfZjb2JQ964h?=
 =?us-ascii?Q?PKBpC4VwWt2uQRTPyBL0dPsszGC/Ht69mQXQBmbc7qmfV7REfk62JLYqNlPt?=
 =?us-ascii?Q?pQn5YTx4XKvKw1A0a7SPdOLwgdpLQfBq0zOAglzJ8t1yr4mdJ1d5ecsHSAF6?=
 =?us-ascii?Q?HmOK23NgLWihAG+c/rQcn/f67ehpkz3GTouGGoQE5xkV7NAWR5kHM4qwqr8H?=
 =?us-ascii?Q?FRivD4T5pO0njeQGFQZ+l2LIn2PndNjoviSnsm08GplewSlNfZGf5xWzCk2C?=
 =?us-ascii?Q?2vmNk3g9oHu3HpOY/Iq/42tFAk93hjXN+TA+Pd3489P3RA/ZlOFYiyKVlsA0?=
 =?us-ascii?Q?eZwrkhrysbimlODegLg37L3jEIgq+TScpRYsr1GGMqt/d+IcLfzZ3g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: dbd73629-5064-4b6d-f68e-08dd94927186
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|35042699022|82310400026|14060799003|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?samVF6ylDXAzWb3431NNhDBxhH/5g6qcb9WkI648FqwByDt0e1eLpHOiG+iy?=
 =?us-ascii?Q?S9Z6cqg32jnzRtY7kVDpsce4eld5A7uus+Z+kapnNrl/NLk9A07PgwlZ1XJl?=
 =?us-ascii?Q?lP/5ZSqw2u4YJvybllkA5MTs+0E4JdYyP6shc3RSIG3pdodGWXohXue3iF5d?=
 =?us-ascii?Q?wwMVrHnObji5Da4atRWNlhyjLpK8uiGCh/CjSNLi4OQVlvb52akYDooyzF+f?=
 =?us-ascii?Q?PIfH/n0W+0U/TMxAtNowqS4QaKog86DCt7FvFK4pQFm3mVZR74BtTPJRoupW?=
 =?us-ascii?Q?GSYvnyvO98/hoBfz6CITyrvSpLB3RhZY2svX5OvmoTKfBG99kXbsNBKG8lqf?=
 =?us-ascii?Q?mdH15TZ4hCZE1/BNo40zgwFIiWq4cBfXf+mvNMQYS52/1HILhkFqOq2R1rDf?=
 =?us-ascii?Q?cc3UBYOUska3VxWbCyOZm95BmeYqcQdXhkNgCAYv2YaVlDhYe2qdeMfS6/yq?=
 =?us-ascii?Q?MToBBDxAodWgiGvWSvxtvucPN7AficA8IRtb0lBG5/tNRTN84IrEfrikgh5M?=
 =?us-ascii?Q?hr7mjJ4VtowELAoqZFsrRKsytLx6pYhI9d2EhgevP7Y7pcBR9+yYV+XELtIS?=
 =?us-ascii?Q?FhremJLR2Z75IORE6OJKk8qtVLjbkSEz3nkRQ1LPMAnlycPo+VJo7WvHYoxW?=
 =?us-ascii?Q?qBVkURL31bDnciS6hahp/3KH7vx7jxE+sqM6bp3lvco6I6aOHexIBBDMDQVe?=
 =?us-ascii?Q?cpoF+qm20mMttvuQwJ6dlLwLe5oDRqOm+24WyFuQPdiMtdGxyDdCPVYd+/G5?=
 =?us-ascii?Q?S5at/Md0g7n/FJD4s+aJ0A+4AgjgjDXG3utqLAIyv040zB1JfjztXCt70wAW?=
 =?us-ascii?Q?XOQYv73YC1DYQOS2pVFFpPAmRFOIyi+ru530VlSet6EnGrPE45XQx9jda/U7?=
 =?us-ascii?Q?HNwFBAZVg21MVyp8G08kyg6ScxGU58rfjewxyiolg/PaJLKntUrZSejWcaDN?=
 =?us-ascii?Q?224btMYSeBO0Al+6FeMkZwsxsJ3K5k6PhTtcukzQydmblpBL46jaHHooEA+2?=
 =?us-ascii?Q?hbnCKZ5YmQ3ci1MO51zy+zjb1B6vmk9UEiRHmlj3ChtsiarD+eMZNoCIhNwk?=
 =?us-ascii?Q?3taB/p0TWEdPlg4B7SGvhtqmY9a7AaZF4pbqOOFLUPSMXxKdkGIUg7B04f5v?=
 =?us-ascii?Q?f+1F7HGi52p+eSFonuBhs2T3kTGdmzTSvRf4ti6ZRumglWVSE7QfCKcwZPPB?=
 =?us-ascii?Q?Ju2T2TVzfLT2yus2n/XXH/EIM7Boe53kB56jQhao3H4zeSHaz6dAdBNqBvKi?=
 =?us-ascii?Q?c4D2henpNu8M5buUgqHqdi3cfdL02Zll3WRAawwNZHMfQe/de8mmFnA4/J0H?=
 =?us-ascii?Q?8S2ipLk7kMh+FNId85hZit+oZM8BqHF4XSM6HmLeHFWA5hVkKVCTzhVDGsE6?=
 =?us-ascii?Q?siQ3SX+N/3AnjCxHFoJsdlMtkxicKtF39qsGcxkTx9DSa5CdY/iyJpVBBuLc?=
 =?us-ascii?Q?1ndi98shbB0hxIgMC8hnopogRObs5Ea9KqDG650HS2qX/+tji8ClO8IGCl/w?=
 =?us-ascii?Q?kvaVj68fBQKQwh1QAaCeQi7fn81CFZ8iDks1chqs7q/a0Bfmd4JsOkchrw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:36.9671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ce9d38-31e3-4540-5a40-08dd949284cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10733
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

This patch extends the DEV_QUERY ioctl to return information about the
performance counter setup for userspace, and introduces the new
ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
performance counters.

The new design is inspired by the perf aux ringbuffer, with the insert
and extract indices being mapped to userspace, allowing multiple samples
to be exposed at any given time. To avoid pointer chasing, the sample
metadata and block metadata are inline with the elements they
describe.

Userspace is responsible for passing in resources for samples to be
exposed, including the event file descriptor for notification of new
sample availability, the ringbuffer BO to store samples, and the
control BO along with the offset for mapping the insert and extract
indices. Though these indices are only a total of 8 bytes, userspace
can then reuse the same physical page for tracking the state of
multiple buffers by giving different offsets from the BO start to
map them.

Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
 1 file changed, 565 insertions(+)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..a74eabcabbcb 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
+	DRM_PANTHOR_PERF_CONTROL,
 };
 
 /**
@@ -226,6 +229,9 @@ enum drm_panthor_dev_query_type {
 	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
 	 */
 	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
+	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
 };
 
 /**
@@ -379,6 +385,135 @@ struct drm_panthor_group_priorities_info {
 	__u8 pad[3];
 };
 
+/**
+ * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
+ */
+enum drm_panthor_perf_feat_flags {
+	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
+	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
+};
+
+/**
+ * enum drm_panthor_perf_block_type - Performance counter supported block types.
+ */
+enum drm_panthor_perf_block_type {
+	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_CSHW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
+	DRM_PANTHOR_PERF_BLOCK_TILER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
+	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
+	DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
+};
+
+/**
+ * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
+ * in a given block.
+ *
+ * Since the integrator has the choice of using one or more clocks, there may be some confusion
+ * as to which blocks are counted by which clock values unless this information is explicitly
+ * provided as part of every block sample. Not every single clock here can be used: in the simplest
+ * case, all cycle counts will be associated with the top-level clock.
+ */
+enum drm_panthor_perf_clock {
+	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
+	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
+
+	/**
+	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
+	 * caches and the tiler.
+	 */
+	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
+
+	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
+	DRM_PANTHOR_PERF_CLOCK_SHADER,
+};
+
+/**
+ * struct drm_panthor_perf_info - Performance counter interface information
+ *
+ * Structure grouping all queryable information relating to the performance counter
+ * interfaces.
+ */
+struct drm_panthor_perf_info {
+	/**
+	 * @counters_per_block: The number of 8-byte counters available in a block.
+	 */
+	__u32 counters_per_block;
+
+	/**
+	 * @sample_header_size: The size of the header struct available at the beginning
+	 * of every sample.
+	 */
+	__u32 sample_header_size;
+
+	/**
+	 * @block_header_size: The size of the header struct inline with the counters for a
+	 * single block.
+	 */
+	__u32 block_header_size;
+
+	/**
+	 * @sample_size: The size of a fully annotated sample, starting with a sample header
+	 *               of size @sample_header_size bytes, and all available blocks for the current
+	 *               configuration, each comprised of @counters_per_block 64-bit counters and
+	 *               a block header of @block_header_size bytes.
+	 *
+	 *               The user must use this field to allocate size for the ring buffer. In
+	 *               the case of new blocks being added, an old userspace can always use
+	 *               this field and ignore any blocks it does not know about.
+	 */
+	__u32 sample_size;
+
+	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
+	__u32 flags;
+
+	/**
+	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
+	 *
+	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
+	 *
+	 * For the same GPU, different implementers may have different clocks for the same hardware
+	 * block. At the moment, up to four clocks are supported, and any clocks that are present
+	 * will be reported here.
+	 */
+	__u32 supported_clocks;
+
+	/** @fw_blocks: Number of FW blocks available. */
+	__u32 fw_blocks;
+
+	/** @cshw_blocks: Number of CSHW blocks available. */
+	__u32 cshw_blocks;
+
+	/** @tiler_blocks: Number of tiler blocks available. */
+	__u32 tiler_blocks;
+
+	/** @memsys_blocks: Number of memsys blocks available. */
+	__u32 memsys_blocks;
+
+	/** @shader_blocks: Number of shader core blocks available. */
+	__u32 shader_blocks;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
@@ -977,6 +1112,434 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * DOC: Performance counter decoding in userspace.
+ *
+ * Each sample will be exposed to userspace in the following manner:
+ *
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ * | Sample | Block  |        Block           | Block  |         Block           | ... |
+ * | header | header |        counters        | header |         counters        |     |
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ *
+ * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
+ * providing sample-wide information like the start and end timestamps, the counter set currently
+ * configured, and any errors that may have occurred during sampling.
+ *
+ * After the fixed size header, the sample will consist of blocks of
+ * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
+ * header of its own, indicating source block type, as well as the cycle count needed to normalize
+ * cycle values within that block, and a clock source identifier.
+ */
+
+/**
+ * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
+ * hardware block went through in a sampling period.
+ *
+ * Because the sampling period is controlled from userspace, the block may undergo multiple
+ * state transitions, so this must be interpreted as one or more such transitions occurring.
+ */
+enum drm_panthor_perf_block_state {
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
+	 * sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
+};
+
+/**
+ * struct drm_panthor_perf_block_header - Header present before every block in the
+ * sample ringbuffer.
+ */
+struct drm_panthor_perf_block_header {
+	/** @block_type: Type of the block. */
+	__u8 block_type;
+
+	/** @block_idx: Block index. */
+	__u8 block_idx;
+
+	/**
+	 * @block_states: Coarse-grained block transitions, bitmask of enum
+	 * drm_panthor_perf_block_states.
+	 */
+	__u8 block_states;
+
+	/**
+	 * @clock: Clock used to produce the cycle count for this block, taken from
+	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
+	 */
+	__u8 clock;
+
+	/** @pad: MBZ. */
+	__u8 pad[4];
+
+	/** @enable_mask: Bitmask of counters requested during the session setup. */
+	__u64 enable_mask[2];
+};
+
+/**
+ * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
+ * period.
+ */
+enum drm_panthor_perf_sample_flags {
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
+	 * of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
+	 * the sample duration.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
+};
+
+/**
+ * struct drm_panthor_perf_sample_header - Header present before every sample.
+ */
+struct drm_panthor_perf_sample_header {
+	/**
+	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_start_ns;
+
+	/**
+	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_end_ns;
+
+	/** @block_set: Set of performance counter blocks. */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[3];
+
+	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
+	__u32 flags;
+
+	/**
+	 * @user_data: User data provided as part of the command that triggered this sample.
+	 *
+	 * - Automatic samples (periodic ones or those around non-counting periods or power state
+	 * transitions) will be tagged with the user_data provided as part of the
+	 * DRM_PANTHOR_PERF_COMMAND_START call.
+	 * - Manual samples will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
+	 * - A session's final automatic sample will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
+	 */
+	__u64 user_data;
+
+	/**
+	 * @toplevel_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 toplevel_clock_cycles;
+
+	/**
+	 * @coregroup_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 coregroup_clock_cycles;
+
+	/**
+	 * @shader_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 shader_clock_cycles;
+};
+
+/**
+ * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
+ * IOCTL.
+ */
+enum drm_panthor_perf_command {
+	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_SETUP,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_START,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_STOP,
+
+	/**
+	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
+	 *
+	 * When the sampling session is configured with a non-zero sampling frequency, any
+	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
+	 * -EINVAL.
+	 */
+	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
+};
+
+/**
+ * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
+ */
+struct drm_panthor_perf_control {
+	/** @cmd: Command from enum drm_panthor_perf_command. */
+	__u32 cmd;
+
+	/**
+	 * @handle: session handle.
+	 *
+	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
+	 * It must be used in subsequent commands for the same context.
+	 */
+	__u32 handle;
+
+	/**
+	 * @size: size of the command structure.
+	 *
+	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
+	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
+	 * struct_size) to the pointer and update the size accordingly.
+	 */
+	__u64 size;
+
+	/**
+	 * @pointer: user pointer to a command type struct, such as
+	 *            @struct drm_panthor_perf_cmd_start.
+	 */
+	__u64 pointer;
+};
+
+/**
+ * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
+ *
+ * The hardware supports a single performance counter set at a time, so requesting any set other
+ * than the primary may fail if another process is sampling at the same time.
+ *
+ * If in doubt, the primary counter set has the most commonly used counters and requires no
+ * additional permissions to open.
+ */
+enum drm_panthor_perf_counter_set {
+	/**
+	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
+	 *
+	 * This is the only set for which all counters in all blocks are defined.
+	 */
+	DRM_PANTHOR_PERF_SET_PRIMARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will
+	 * have the UNAVAILABLE block state permanently set in the block header.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_SECONDARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will have
+	 * the UNAVAILABLE block state permanently set in the block header. Note that the
+	 * tertiary set has the fewest defined counter blocks.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_TERTIARY,
+};
+
+/**
+ * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
+ *                                           into memory shared between user and kernel.
+ *
+ */
+struct drm_panthor_perf_ringbuf_control {
+	/**
+	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
+	 *               modifiable by userspace.
+	 */
+	__u64 extract_idx;
+
+	/**
+	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modiable by
+	 *               modifiable by the kernel.
+	 */
+	__u64 insert_idx;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
+ */
+struct drm_panthor_perf_cmd_setup {
+	/**
+	 * @block_set: Set of performance counter blocks, member of
+	 *             enum drm_panthor_perf_block_set.
+	 *
+	 * This is a global configuration and only one set can be active at a time. If
+	 * another client has already requested a counter set, any further requests
+	 * for a different counter set will fail and return an -EBUSY.
+	 *
+	 * If the requested set does not exist, the request will fail and return an -EINVAL.
+	 *
+	 * Some sets have additional requirements to be enabled, and the setup request will
+	 * fail with an -EACCES if these requirements are not satisfied.
+	 */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[7];
+
+	/** @fd: eventfd for signalling the availability of a new sample. */
+	__u32 fd;
+
+	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
+	__u32 ringbuf_handle;
+
+	/**
+	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
+	 * insert and extract indices for the ringbuffer.
+	 */
+	__u32 control_handle;
+
+	/**
+	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
+	 * a power of 2.
+	 *
+	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
+	 */
+	__u32 sample_slots;
+
+	/**
+	 * @control_offset: Offset into the control BO where the insert and extract indices are
+	 * located.
+	 */
+	__u64 control_offset;
+
+	/**
+	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
+	 * disables automatic collection and all collection must be done through explicit calls
+	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
+	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
+	 *
+	 * This disables software-triggered periodic sampling, but hardware will still trigger
+	 * automatic samples on certain events, including shader core power transitions, and
+	 * entries to and exits from non-counting periods. The final stop command will also
+	 * trigger a sample to ensure no data is lost.
+	 */
+	__u64 sample_freq_ns;
+
+	/**
+	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 fw_enable_mask[2];
+
+	/**
+	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 cshw_enable_mask[2];
+
+	/**
+	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit
+	 * 0 corresponds to counter 0.
+	 */
+	__u64 tiler_enable_mask[2];
+
+	/**
+	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 memsys_enable_mask[2];
+
+	/**
+	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
+	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 * Bit 0 corresponds to counter 0.
+	 */
+	__u64 shader_enable_mask[2];
+};
+
+/**
+ * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
+ */
+struct drm_panthor_perf_cmd_start {
+	/**
+	 * @user_data: User provided data that will be attached to automatic samples collected
+	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
+ */
+struct drm_panthor_perf_cmd_stop {
+	/**
+	 * @user_data: User provided data that will be attached to the automatic sample collected
+	 * at the end of this sampling session.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
+ */
+struct drm_panthor_perf_cmd_sample {
+	/** @user_data: User provided data that will be attached to the sample.*/
+	__u64 user_data;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1019,6 +1582,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
 	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_PERF_CONTROL =
+		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
 };
 
 #if defined(__cplusplus)
-- 
2.33.0.dirty

