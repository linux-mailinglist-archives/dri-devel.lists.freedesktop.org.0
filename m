Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D7FA6A4C2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF10A10E5F4;
	Thu, 20 Mar 2025 11:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="EsKQ0wxW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EsKQ0wxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013061.outbound.protection.outlook.com [52.101.67.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1419D10E5F0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:20 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rB/qIVVQmSRvV14m22qmeJ13P66cc+M5GMKona6aJzmqzp1lVwLDrgqRFzpGXbaoFpYFI15qdYvJJ8UhkT+fkKTsVZqaq2gXxzrPGHitmAfjNUYaPX1DRHiImIzsiABpgVMkfFkYVh792k4GqUadzxJQMCUx51N3zrj+HIV/piApTUMPjiuFuE4DWCkZX+md4qmULSSWVCoplQpzpyGbhlvpCbgy1yc9b6JJFWoTUHTMvo4zYfKZChTp52+rHVrmJv1b4mPx3cWT/VCR3iqYYocYUTLzlpk/UAtmRajM9iNuBAdaZifU17Y0pE6K+6CNw/ovH3NttFLK+L5uE/x/lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYfH2f2p0p7UsJOPYBI0S+h3GMsBmwKAfo3hC04ZXvs=;
 b=hb83l4HQsvNKG5Nc0ICYtBlk2AOuu/patcq4g4H2p++pucbIZp3c7F3C6ZMkq4B/QQO2WiBEUUHGyiUJ/JyufKUOij2u5yMNglU1d+pbICysIXp/Zf1ICwbdegzVynVd5Et3LnWXWLdmPq2UUb6AX3+eniCEx/iyzDKF/mwyuZ1GSWA+l7KSoe/1NSSVRJ7CwLH3xkxh+PGPsHIoA8F9uEdTYHfJnK+Z0dLa1WZKZetH6hYSbWIz5RYaiWmhIdiF6jtnp4N9i4GFqWMV0gG1P25GT/YeKXnDD8REwQ6vbeTl1mn0IKUkJpYtqugKntq473cu5JWutkcwhKV8qNsKLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYfH2f2p0p7UsJOPYBI0S+h3GMsBmwKAfo3hC04ZXvs=;
 b=EsKQ0wxW6O45Xx2dWDn/y+jTWSsKqQ5t/FtXEach85ybn3SUxksMzM/DLMzH9fqBzh/jMZqbjv4SBZVSGpjiCVHcbE/fmL5Jd7f5CB9QVO3sSqxtlERnNLYpX+dGpL3c8bb3J5dQ+vmbZBRCdbNLVglQrc4QhGbakF3vm95DB60=
Received: from DB9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:10:1db::7)
 by AS2PR08MB8669.eurprd08.prod.outlook.com (2603:10a6:20b:55c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:18:15 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::7) by DB9PR06CA0002.outlook.office365.com
 (2603:10a6:10:1db::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 11:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:14 +0000
Received: ("Tessian outbound bd61b317aaf8:v597");
 Thu, 20 Mar 2025 11:18:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: da76cda19740f846
X-TessianGatewayMetadata: DWQRoTS4sdgcjfZTI6/HL9yGyElUJY2GjRbonkkC8RUv1FBai2JWRyHpBjLJ8kJqV+s1lve9haVWiK+Zg8cHkqB2og5R7CH9yZ2YsmJti+mEbrnUjhUZd61n79hfKxAJjwYZ8Kbbg7bV3YwQbZZM2muBUXu32kRKDUs2WDS4RUA=
X-CR-MTA-TID: 64aa7808
Received: from Lb15e4ab9bcef.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD4CA556-94EC-425D-8086-CB9C36A430FD.1; 
 Thu, 20 Mar 2025 11:18:07 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb15e4ab9bcef.4 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdOAKenCejIwF+jQazhlqBE906y1e3FwA6MXaLgywbboOEASqKUIkQORKQhcJrucOz28xgE1f7DZi4TdwsH2CT63uUqlsUkUvTg1GKS+/HI60IhIPkMA2a+EIW+WQW987nmo1REwzrLO9Q6yTg/6b9zmq8UC5Q5haCypnmTqsHppK89PSARPKXQbXuNkCLMgkC/Pv9kDoDfkP2KjexWQhP9YUNvQFv1i+EpXAIO3QQZot7/S6+5xYUJp6mp9a+3dbZd1lP1Lwy+uYyqe9c1A+ypuR05xPMnma7uHFY+6OGA2Dfm5KFEXs4Hyh5SVa4Wdpaad7hhNeAEBFa5vJtbcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYfH2f2p0p7UsJOPYBI0S+h3GMsBmwKAfo3hC04ZXvs=;
 b=XMuVKKth38ZZ9Rw9aS39irc7NEA36W3wmW/m0tuQA1j9+eUlfzDBTOmlRiU8YuC80SXHZ2UmhXdkGV3C1oKdSIgRsMeal4QlU6D4Xj6Oue7VIABnVCBEG+E5IqRs13ClJFI/aiZx9k3UOhkrqyX01CM1uyM6LLG4xeWGVfK4qO2FPxCr4tEyiLVKmk6iw14ZeMVMSXaALNUn2NOCgUExwu5ikjIqCyGZoWmJ46tL1wt0TEYGHPKgqHlN6z/llaPi3/bicndUvEDClTips/U6zX6O3ZlvAtx8nhgXdi3O8Bf4P752OgIbuw1WOSzoAl1BhEOG+rSNMM7wgefH2c0g5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYfH2f2p0p7UsJOPYBI0S+h3GMsBmwKAfo3hC04ZXvs=;
 b=EsKQ0wxW6O45Xx2dWDn/y+jTWSsKqQ5t/FtXEach85ybn3SUxksMzM/DLMzH9fqBzh/jMZqbjv4SBZVSGpjiCVHcbE/fmL5Jd7f5CB9QVO3sSqxtlERnNLYpX+dGpL3c8bb3J5dQ+vmbZBRCdbNLVglQrc4QhGbakF3vm95DB60=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:18:05 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:18:05 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] drm/panthor: Add support for Mali-G710, Mali-G510,
 and Mali-G310
Date: Thu, 20 Mar 2025 11:17:41 +0000
Message-ID: <20250320111741.1937892-10-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::8) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB6715:EE_|DU6PEPF0000B61C:EE_|AS2PR08MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 81aea27f-b02f-4898-9d7b-08dd67a0e857
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?jb5DvYkWRoDjhVYmdkHqnE/gLTwcoiYw/muO8M83JP+xWaRwSnkgfhDVeTqC?=
 =?us-ascii?Q?J02iG91TwIx404iWW+OpmPW/48WfEW68bwda8eBdSQ9TZ7WxzCZgMCqCUBJz?=
 =?us-ascii?Q?pofeiUX2VJrqEopiKyl61o3LmxzrtZuwIezS+jEMAn8F4QiokQsEZxfzr5v9?=
 =?us-ascii?Q?wveO6s+A68eCg5sV0LWzWtcoG9KEDZR/ysI+PtGtuZpf4kJmJYLdQpwz+Hi+?=
 =?us-ascii?Q?eDelKetikUsK9rmsDU3o6gCz7amxmMKb48LlSpvmWTDUVty9pVnJuQFJlK7p?=
 =?us-ascii?Q?0FKyShXzt7LZZA4iRR1rnmpULgz1ZWpZi6qjTr+dcnk7hapgtqV/lz0IfxKA?=
 =?us-ascii?Q?ahhobMzXL5zhbOIrxbj8MQwWwQ+I7kxEuLo80ZlV6V65Bmpa5H9vu9dJ4vdj?=
 =?us-ascii?Q?KzVPSBbBxK0Zm3PaXzPJ23sUo+ZZesO5r4L+WqvxanW/cCnLpCLyhvLniW99?=
 =?us-ascii?Q?sprjy6aB18idyywcxmc9hPsxIS6J4i1iYmu8fwBPE7i/2I7SECzm30Aw7n72?=
 =?us-ascii?Q?MQZdu/qXFgbgirgyoZhqX5ty5U1PbRLT/O4VJIHz2NnVhEw67JEMYckMt45d?=
 =?us-ascii?Q?ZtgsNiv8wYhaT+kTQw8FSUnx9mVS8lPitj/0KkgqLKQKmWpgB8gSSJpM7pSn?=
 =?us-ascii?Q?0EYgzR1BCKhH7VqGxS0wB4kz8GGwFc1HDHD6hmAXu5QiLYA45nVVjE1HwKv7?=
 =?us-ascii?Q?fO2YWxC65H5JTU2/BRk2TugookLFoNbnMpLBY2yu8fS/hjj3V9jR6pMMckEt?=
 =?us-ascii?Q?yJZF3ygY2zV9eOM3WDpN5qniSEcp5Hzd78uJdZuGHnVo7g9uWaOGm9jQq9tU?=
 =?us-ascii?Q?+iUCHto2rOukr0dRM12syVaGBQOncFwTjLUmaywfoMp95nkgPfmxBkM1iBSW?=
 =?us-ascii?Q?3Ve/Gx3e/jTl9qVEfw+8jFHTeDCKuFlBCGOo3saE2uuaJDXtfof4Qmvvl2Xs?=
 =?us-ascii?Q?jY5V1UZRVJmlpUxutMwkde4z1OvV25Fsq0pJ0vCa66l/4wtxA/bUmlmu9C90?=
 =?us-ascii?Q?M7j8+6DGe91tZr16R/q8KkOW8oDTWUfRKX/5s5k8c4II7DCAV7V3ZOhlNXkd?=
 =?us-ascii?Q?Hxf9hzDZVmZbOu6HSwTladOm4FYZgw6hNn0wwAVwqV7UUpnkMZiJdK4rckUA?=
 =?us-ascii?Q?oSQN599DIV5fnd2lSFzuMBt+17Z46Zm24O6ePgu2vMt/YFkOyZFu/y0BDDpe?=
 =?us-ascii?Q?uUeU32XugUBfl90Tb5MkUz8ffjirkE52YMF0h+BEQ3pZ04EvzIQEbfizgYP2?=
 =?us-ascii?Q?0fjqUFESt13XZLLdMM6fsStg6a23S2Xjh28s6x0PFmm6vznsUa7qBPiptOom?=
 =?us-ascii?Q?IbD07EgXuZUN8OvBjGXzcDl6Yai/wW4pMIx8TvQnAh+SZMN2D1m2dtBGNDiU?=
 =?us-ascii?Q?frhJ78W1fpLTc08tUgU7/MfG7+uj?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 407acb58-ef67-4834-f9af-08dd67a0e27f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|376014|14060799003|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1zrfcwt+uWL5buYFwdL9PNf9cYbTyxTblXTNBxG6h5vdjhmmF4FwHOQ480dk?=
 =?us-ascii?Q?bo1iRpcztoB4+oloDwz9Cfs8IivzhJbM51kUQMu77MAiEvYgs4GlbMuXVFBG?=
 =?us-ascii?Q?iArttT/6ek7cbxqcb8ziD+8Cj598/GlgFSzxw9EhLONfoRZsrMpokEAcWLDs?=
 =?us-ascii?Q?dpqkpLPhQcOC3reHvWBfVh5n5+Wa0fsm3HhZHe/ziE0LCVW8+1X4NLQsCW+I?=
 =?us-ascii?Q?XdtUvBtADAwf7cK5LAEGAIpzaL06Dtg4F6fzM6plpC+YyTcbCD2lQb+5BDz7?=
 =?us-ascii?Q?kLUamDz3k+N/rRMzHQ4DdRXU4+76y5yIWpVst6WnzxiPCY7NEqQzZPN6gLTq?=
 =?us-ascii?Q?JURZ9BJcBkFO8sCp4NLBCAdCL+s1KBAikRg9s3qiMUjFtzV5zHCN1u4m1qOO?=
 =?us-ascii?Q?A1c2CCA53WQiYIRLQ40vQ9Kl4PZkgvv3Lwk+yz6NUOOdOPR/jZFN99M8nkGB?=
 =?us-ascii?Q?xXsop2AfWPaSx57KmpO9vNxdpOAsPYNFIMNExF28N2SWSErIOpihjmOW2pGA?=
 =?us-ascii?Q?3d5k9Yh3RM16ZCpiifm8Hz3JiY9nmbqWHpqx/DSyFlHb8XoIGblTHFE25WBT?=
 =?us-ascii?Q?XbHSYvmjFuLoOaHe6yZq1h4nNFFW+5WJqkhW9uQQ2jocJCMInpt/Ptzs8LAZ?=
 =?us-ascii?Q?YPQi1Zk10uKPljxZ48cIgVc/TvdWwFxd98hKQ1VupI/wd0nn2guASaFfnrLL?=
 =?us-ascii?Q?oJBYXhonn9rFj+nwaPVu2w3nQpR8gHfVxcjSrI/2wITffq//QgC7qE56Px2G?=
 =?us-ascii?Q?G1c4dVF7/FRVFX3qT0U7DDorR3zNA0nKAcGFTg8ANqw/g8l0Mod0JqTpWup8?=
 =?us-ascii?Q?yHI8oeHsfUtmYw61nmkaUzSWNlS6EY4TZWylAvXZi1SY9tyJC+vrR1cuVtVK?=
 =?us-ascii?Q?E1wZWOsg34G1Nf6JdRFMay0ZtgNfoP6l2TYiZYQbAFXTbUD03XrbFawhFXJl?=
 =?us-ascii?Q?Qnj1GdNla78EM/fhZhNnyVSrHiDpo60cQoap7WsmnDU2hnWE4yA9i8ukf3Zh?=
 =?us-ascii?Q?tv769blXDd9vYYjObeUn9ZL8VRXZ905tDE9OAF5E+T+KnZFRSyh37W96+alv?=
 =?us-ascii?Q?JQqbl3ZY3IFI9sYO815NOVW0q/5yJaevYQhv3RLnbQdbnbagJjxRRIXip50/?=
 =?us-ascii?Q?u4bht9QbiVUg98/AJjG5C7BP1SUIUr638hslosLKMEMK6nu0alvRMqSgHxju?=
 =?us-ascii?Q?Tnn9MC2ABnLvFwcyDRHMzhsZsqzBl3UDSMjIID+2mXavIpqTREIkntNJHwHp?=
 =?us-ascii?Q?c/0Xh8ekLs2+4LiTyOH/CdPg60WTgWVQyh4YfxcsNrBCgYu100IvwP7TwLyG?=
 =?us-ascii?Q?++UxjMVx57TRDe1EgGWkMQPyCO9poE8lAQ6/yez7C/LcHIxHVVZApL9mVDeh?=
 =?us-ascii?Q?xdS9RnKUhT+67RqWlpZJ8ltBSHUUldKoAed15P8Fq4AudA/A3kqnuwODkjRc?=
 =?us-ascii?Q?Dwcau6DS3gMRrBywSkmF4OkGF/C3fOvvgA5XyQpr74k6DA3VPhNbhKb8O+Ox?=
 =?us-ascii?Q?OOgY7gA6TaiVef4=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(376014)(14060799003)(82310400026)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:14.6806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aea27f-b02f-4898-9d7b-08dd67a0e857
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8669
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 8a967af0e2b4..7050adfaa8b6 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1398,6 +1398,8 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index e6354304bbef..6f18b7420f90 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -49,8 +49,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	case GPU_PROD_ID_MAKE(11, 2):
 		if (shader_core_count > 10 && ray_intersection)
 			return "Mali-G715-Immortalis";
-- 
2.47.1

