Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0AB0C232
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2926310E4EC;
	Mon, 21 Jul 2025 11:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="S3xKGiKi";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S3xKGiKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E820510E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:08:39 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=J4CC7Nz/M+OHC/WHVETKFb3TJfIIVWtVLXdv9wV340DX0VH3gQRyZmROSs9HzMi67WemkoWAV4Ynfu5S0NeKTtFufrmxaDWyTJjHJtHYw+P26bfwqI/bfyLEygilsJP81G54OeJmil3FcvcX/kR3T3Q8vhuTAowJ3XNnHAklqVhGmpPqawIrwFlhmuM34+Wty7LHQIBGO795vQh4G+H7j9uXBcsuEM7tCI3nGh9hBAVTxilwHbg+Yqr1rnvorX72gdjCCoPxqylfJq43PPhYWroeGycqUpajs3pV0j+bDBZZnW4Alm3pk6j5c8SfPnvPpcJMYASFEuSoC784O/x5mQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=T39FPFIrthSooO7MnLk/eEoSX9OqMC7izEcKUyY9+UeFAKQEOTahQqmY2w2JxzKIRxOO2xxAp/HvycLsF+wiSiWAZoxWl3e98y34jXMAMAlImMJrItSfgxGHbItqikY3o4aQFVlO5oiYnoOzZS5qm3UkpLxbTzYe1vDulXn2DnNDG4i3yM/lwvafYQvrGv5FTRUZyzA1LK/UaSOkbwmXte5YQeTJxrlsmNpKFlv4ISaiiqKmMsjtjOtoql3gt0M7ja10jhxH8vrlNeC7SG6YH/vEYR4xUofQ1mkScbd8bfOKlYGsenDZdbHdeHbnDUpX/pi80fUhFL+MbrqYIvkVJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=S3xKGiKi+OXnfsVk+yYObgUlJUi3Wa653f+u8ozGjGxIu3fPV0hSoN2Lw3M34+kq5CnoDDsZPbILjt2CniHBK8+2JTYsiPVf/kshmJp3S5ByIHF+AG30YxH3BaH5NV23rTdgjfQcTyqY7MOmEIa1iE4swH8mIYm2jCe/jh3on0k=
Received: from DU2P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::35)
 by PAXPR08MB6511.eurprd08.prod.outlook.com (2603:10a6:102:12d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 11:08:33 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::d6) by DU2P250CA0030.outlook.office365.com
 (2603:10a6:10:231::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 11:08:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Mon, 21 Jul 2025 11:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNeyFYYqQcYbVytLrg6Qn5FBwyH50iAnWTCOQDrIMUaE8G3epOeRDDTolLs51AxnJ/dKWP3l4lTtQjM+f60ldLd7Ety3GH4Wl6q5MtN8HO2cAYihnwUPb57vw8QmbWCl9gnVgxoqp+G4ny/9hloNKC07Eq6voq/WzylqvuWPY+fBZXaIgEfukEWGPFW17E0VZKbexeEuBbY7sqYcA4YslZMY7hXHvYXvSWJWFCysBB0ibSR2SAJ5VeI2rfED33Uh2fJxCbE9/XJCdKpzkz5PmU0Bk4eHYAwB1Uv8KZECnYlhmZLb2JjYNoWM7oMQweWWcXVKJYg69vOakpiuQ/U+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=re1YPyA8U9UbKJENt3Kkpi/bKA7UC4l2az6gV/2hdA1MS2SRXi1qrwDB7BK/adj7LxrUwc7yqNb6XfZdRdv6AMF54KNa9fne3uW3SEwaIsysNYsaQNrg97uxH+8o44ETpLFpaM0WY3OukUSzY/DIBvxSO94CHPGLa4KxzOL16u3p3aX4klBDgLB75K/w4tn1HBRdOQx1lC/eFyupPcXDxmraJA9U9wxUXVocKoqwgnyIU9a5CApjs9WMAbmc2SSFPxyB0x8gwYaGu9DklsGA1hA5vwkiWVUKW0Z4dVfpLGfQ04cRAuYa/KcPotOAPGGeE0vWJgFHDPUOIQx0aU4OrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=S3xKGiKi+OXnfsVk+yYObgUlJUi3Wa653f+u8ozGjGxIu3fPV0hSoN2Lw3M34+kq5CnoDDsZPbILjt2CniHBK8+2JTYsiPVf/kshmJp3S5ByIHF+AG30YxH3BaH5NV23rTdgjfQcTyqY7MOmEIa1iE4swH8mIYm2jCe/jh3on0k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7904.eurprd08.prod.outlook.com
 (2603:10a6:20b:51f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:08:01 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:08:01 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs
Date: Mon, 21 Jul 2025 12:07:25 +0100
Message-ID: <20250721110725.1595387-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721110725.1595387-1-karunika.choo@arm.com>
References: <20250721110725.1595387-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0456.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::11) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7904:EE_|DU2PEPF0001E9C1:EE_|PAXPR08MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 882cf40b-fdf6-4daa-3e63-08ddc846eee5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?rJr7vfemwEF82KBOoFB0NgKv6euvOh8PRxK/0zyx/J44jKnihocNym2OSlBR?=
 =?us-ascii?Q?W3sgXKhBQGNIpSFPre+k6CrQty4fdrD98d7hr0Ch6iywPEAZr/uONGp0pRZA?=
 =?us-ascii?Q?iLjkYX9bZukIDXmxJh7oawVF/IDcjVZsGivHQZQj6CEpcsawivklbXU3/NN4?=
 =?us-ascii?Q?tsVfBUyf6DIRMShoV6FA9ohFMFA4xxFwqhb1zT2eys3jT05IvSNeZw1blYSo?=
 =?us-ascii?Q?4IGFIjRbJBfZt8f+DRgyOppue5AStPgnAfEUvd6e6WVIv/wwFYdDNZqFAkVn?=
 =?us-ascii?Q?SdWnphcSi9Yr8LJY6JQ1/20AYneNtB9uG1Kxl/Is/qBfkiCtXe1ap5cPu1sA?=
 =?us-ascii?Q?vrM6MlqILk9hGgzDND0k2Sxoew5r+93YYHWIm2MJPlzpPPDyXHrrB/pks8Hb?=
 =?us-ascii?Q?WVM12HeQ9MeXTGcDEeTqcUGg0UcOn0neGN10u1hH/ALO7KIXiWU7+ta1RzDA?=
 =?us-ascii?Q?FfvJALqchpr7JECViKCO3PJDq9piWCamziJGxPajVhEQrytQIR5BiV6hH05w?=
 =?us-ascii?Q?+OC9VICwBYPm8/k424G93r5U0jsQ1zpM9KjDGhsTmjAtAlfgTIXpOTdsHnCW?=
 =?us-ascii?Q?9o9rz9HrxwvuutumbK/xpDylk1Qw/FHuLVSB8QnQoDN4YMbURp9TnQ4Q4W1R?=
 =?us-ascii?Q?lahxizRSs/U5fUecVMfcUgsHd7CeGZRneR6YBohcpBMDXBW1+UYTHsD2c/8k?=
 =?us-ascii?Q?WM0Wdom7cx3LNTBhahvLtuRP07b9hwjB5MF+DFN1taSdZ5PpH/gwgPWhTJ2j?=
 =?us-ascii?Q?AbxmwBRQJRbSoZGWWz/BzFWuZdguSEiMKVWcuw4u9se3/Dq71KNUaX/nNuJV?=
 =?us-ascii?Q?kdW4drEIE/lMSfY1Xdg6LHbY29G2rX85CebjQpYlq67MbdsLETYS6tuALRKT?=
 =?us-ascii?Q?cAxc8EB0X6fqv3XCV71MgwaQEhjF4vCmPoJjpz4SQYuO3KEkIIBc6jKM1c/z?=
 =?us-ascii?Q?PDbFIeK5wTGYNpSzDtGMxymJVR7XVnZYrvjtPSxlWW3FQIstKS0LHRmO/vzJ?=
 =?us-ascii?Q?+fX48pt1p5XbIB3UoblG7taJOkyiff205ApWt93dCri8rrR2xmVyRRO06Svt?=
 =?us-ascii?Q?EfbHSi2SGMksuYDp8qveFz3le4K5PlT6BmL62H//ZPXJm4CjOLUN7dxC5ekO?=
 =?us-ascii?Q?ulag2TIFrSfGCG8XfUvuJ3LN037erd6Exf+JtuwB1c/0FBiR8w/Jq5gEY9po?=
 =?us-ascii?Q?ASlpZ9E9MUaNZ6Mpa4BgScjOD8A8DmA2WASNqUxfc3UHgPi5D5YqIfYfHMqT?=
 =?us-ascii?Q?yXEwmXD7hLvTpmcdkLZAjCRtyQkyhZhNwIxFjOTXvslucxipHslyBA+3Unj9?=
 =?us-ascii?Q?TAtWniaPgVLXCI5J+Q0aniGLE/BJiZcd/C6D7AsWNDifJaQBFqDXMXY1K7z+?=
 =?us-ascii?Q?w2Q+D9dZW4xUYoK6yk5OZVnuSqunAZO+gMZqqRPTBqmbBgDdeUrQcGKPIwSF?=
 =?us-ascii?Q?7OF1FImKGcg=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b08dd61-b6d0-41c7-12a7-08ddc846db3f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|376014|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rPVB38jDXzP/x9+MDPD9XMOh3ZdyauaZVtu7f8D+Vyk5OzB8IEJLbTAN49YT?=
 =?us-ascii?Q?KnyLMvb1m2F95YO2BU5N7TxSB+wbWppERKzUJqavUpvIQe/FoLAb2tmdku0u?=
 =?us-ascii?Q?nO2hwIVK4lbXGMek9igkjBKQdw2TOzoMf7ZRnimJtke7JKygQUFd2uUzb8ug?=
 =?us-ascii?Q?LR/3lnASuGaGrT5e9kBZvQq8Hs3pEvjCgrTnrblOH8YgTTB106tssfVavaIf?=
 =?us-ascii?Q?y5CYCWU1/d49i7whL7MTYTjx6P0aNXGYqiJ161mzd7UHHre+yVE0JmU1MycT?=
 =?us-ascii?Q?/kWUjck5Yy9bVH+1t8ihHXS1sJO8/3+OMCZ3O2UeRro59RPoJR7EI0NsQNeB?=
 =?us-ascii?Q?2NWgp0i2s+Zim4AZQxnaVysBspvD+t40MQzJadSE+I5fZacZ++/azRhpUFXG?=
 =?us-ascii?Q?Z5fZbzFsWWqZxGAv8ialdyUNqiEbzm+NHNXJ29hwgPEsaRCv+I1ZVW+YLIq0?=
 =?us-ascii?Q?nMLybzPgDOkZ8sZdyexKqmoMoP6Z8qSHd47N6f1f6A5jnm6dpguXGoud08VV?=
 =?us-ascii?Q?r21AEgMGV9iNc8qhUp1wpCMJ0ETbMatf66I1cv8U60mMMOkggLiA0xPQLQPT?=
 =?us-ascii?Q?1mHwrwQZsOox4pW+WlThiBawdFPxkjv7ZLW+26HlGFqoSV/YystXqAW1JR2c?=
 =?us-ascii?Q?H2CvQAzRz1Uw9tei4QO6yvGyxYELW6IKVZ9tlTRfq2hgxe3ahnCDWv+2PJiD?=
 =?us-ascii?Q?lG/tHBYnQ+kbscCDDWhAGowOtFnGyIIP8x1XoT5TzuNjQX57fq/eE0EWlx+R?=
 =?us-ascii?Q?36dncoKOknSQpRMzqdHb3dchSY87yJ3MPbLJqHWfFncYidXWLDUIIOw+vEKa?=
 =?us-ascii?Q?vhPavqtL8/2UOJ16Xqq3n3JqXvR9Gb+j+BiFXGcAgfOJE8UO6wyhsg8aV5Gz?=
 =?us-ascii?Q?GAt8tzPSn+IaCUMLrIj0UkU1a3wtMFnagDDKehjRHhzhfwjOHpUMTwdTqjTK?=
 =?us-ascii?Q?yYsOxZLDk0JUWRdnCDVcRL12ZF226j4CRnUm2lKMsStrWFrcJLoqfpPcO8lg?=
 =?us-ascii?Q?YU9RQuU9TAcVC6BvWDF1ZhriDLaiKH9RUz0eT/LRYxtG+ClH2dY/sWjfEujg?=
 =?us-ascii?Q?0UN613upzPlV76QXvypFT0J7VMbNV2L0H4rVCIUzxl6tJVMEt4tLrBmgJ96I?=
 =?us-ascii?Q?FbRC090BNLH9l/Vo19a6fbs1Cs0Nqjaosd25ZVDLsDGR8yvOQeS3DT9vAAfj?=
 =?us-ascii?Q?sCLeP3tFmeVK/Emkv5clfbnjn+Z2hhsWlPhH0bHIGxESLkG7Xi8vPn39eqAz?=
 =?us-ascii?Q?hBifvwDkQJ2Wc3c0cjWzRAOm8i14lXQ3N0kv6BFejO3xkhRI/YdmHBECCes2?=
 =?us-ascii?Q?cbEdyQlnJu7JrljM25gQXOKDMSQcFTfXDZvZEhlatst56ptTd3jTr1v7L8Fn?=
 =?us-ascii?Q?AsCehD40rSw9YRJkTmFJ8L4wO5rxkZidSC8QovD7V9gLfPPGOyoWUfRE/xDm?=
 =?us-ascii?Q?G3vHEt1G3qq3kiom7kh/+KKR3ZGSorgnE4n0eTx4iezA7KHJgv7LBRk2wmFB?=
 =?us-ascii?Q?SMgd0XjHNKI+VHFKRn8ZFrEEvIXj25r9lRt5?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(376014)(1800799024)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:08:33.6657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 882cf40b-fdf6-4daa-3e63-08ddc846eee5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6511
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

It also introduces the following registers:
- GPU_COMMAND_ARG0~1
- SHADER_PWRFEATURES
- MCU_FEATURES

The GPU_COHERENCY_FEATURES macros are slightly reworked as the
assumption that FEATURE = BIT(PROTOCOL) no longer holds with the
introduction of the SHAREABLE_CACHE_SUPPORT, which is BIT(5) on the
GPU_COHERENCY_PROTOCOL register. As such, the feature bits are now
individually defined. Further changes were also made to enable
SHAREABLE_CACHE_SUPPORT if coherency is enabled and the feature is
supported.

This patch also fixes a minor bug that incorrectly writes ACE instead of
ACE_LITE to GPU_COHERENCY_PROTOCOL if coherency is enabled.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |  2 ++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 14 ++++++++++++--
 drivers/gpu/drm/panthor/panthor_hw.c     | 18 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h   | 11 ++++++++++-
 5 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..f547aa4159ec 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -34,7 +34,7 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 	 * ACE protocol has never been supported for command stream frontend GPUs.
 	 */
 	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
-		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
+	     GPU_COHERENCY_FEATURE_ACE_LITE))
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
index 5e2c3173ae27..df2419706fe0 100644
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
+		if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
+		     GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT))
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
index e4c34f70a880..a9ea32e5fe39 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -87,6 +87,8 @@
 
 #define GPU_DOORBELL_FEATURES				0xC0
 
+#define GPU_COMMAND_ARG(n)				(0xD0 + ((n) * 8))
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -96,6 +98,8 @@
 #define L2_READY					0x160
 
 #define SHADER_PWRON					0x180
+#define SHADER_PWRFEATURES				0x188
+#define   SHADER_PWRFEATURES_RAY_TRACING_UNIT		BIT(0)
 #define TILER_PWRON					0x190
 #define L2_PWRON					0x1A0
 
@@ -116,12 +120,15 @@
 #define GPU_ASN_HASH(n)				(0x2C0 + ((n) * 4))
 
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
 
 #define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
 #define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
@@ -137,6 +144,8 @@
 #define MCU_STATUS_HALT					2
 #define MCU_STATUS_FATAL				3
 
+#define MCU_FEATURES					0x708
+
 /* Job Control regs */
 #define JOB_INT_RAWSTAT					0x1000
 #define JOB_INT_CLEAR					0x1004
-- 
2.49.0

