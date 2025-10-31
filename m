Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA604C23804
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 08:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EBD10E2C4;
	Fri, 31 Oct 2025 07:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="BmMjkhfB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BmMjkhfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCDA10E2C4;
 Fri, 31 Oct 2025 07:09:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PDMpqbFUPRhNO7SAxBzTLp1ejecz1Q3KKttIuxDn1pZeC7wRYwj1go+/BuMueIpRlOV96yWskJO2cXDFU43NnJeguwlfVQrUJygMeM7UKE/S5d770V64Ig7bzGn6p0gLCeLg/SWs8aHVYFeIM3xLJGKSHOdjOlKGqbOdOkkWlUzNvZjMkvpHolxDBDraG/q7TnYHQvjybtlCcr0FvxMrMyqGVXlpowGzwaOIpSIKEpkchpFW0m9Pi3dPIj4dBCOe2QcLpSxEo6vwzgVkgpzXYw1aHSfniU52ekC+aSVWcLy+vDfUHnojyMgAaYq77iDT7PCbjtup1Wgnojrr1f751Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CV+hig9yOtkrv3Lo3dxF/A7RqR5dkQIScCDzB4x/XvM=;
 b=oqsafjIys6vcYyLvJhmxWtiqIpA/1BP4zTSK4Qx9FAJbW527IebHm8Vc+WZCcLh5a+EJoJ068OWwlSOS7QUTcc1aBOrXscCKqsUAYRJz5KCWJzc40NdDEEYt5L0CpEyl6JZE0dxjiWmTDgMHt1u69IED3T7hKrOhCpuhq9d2EExVKnkI466L/wzYTpDn8NsIMW9a0kOVvSOVOIJu8SeWfMU70jV52Up+gdm7UIzKJ9HXdY0uANqTC2niCwQvRPgkDxoWLLhjbkB28iHCAmJoP137Ui3zq+zZtSiQKsbHdJv8eQ6vhcDJo2LoYhNEBNNL/XJapK1FrQiVNdOnSVFC2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV+hig9yOtkrv3Lo3dxF/A7RqR5dkQIScCDzB4x/XvM=;
 b=BmMjkhfBaa8XeuOb0lT3FZshVgHuApwA6bwdPtwb/FQjtNytshKpP3PV38rtqnuD4FdGei594ydfiSe0s9XgS37YfwUHh2jMiVAzU16CNhzroW8XUnmPxdDkGBqvzFcGBpCdlzCmd5VZLR6dlx+kD1mlRvCNWrqhv9miBz+nwrM=
Received: from DUZPR01CA0194.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::19) by AS8PR08MB8874.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 07:08:59 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::1f) by DUZPR01CA0194.outlook.office365.com
 (2603:10a6:10:4b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 07:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 31 Oct 2025 07:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucdERrePDUVClr7CtAiFHwCbfQmd5SwieAD8aiPqCW6iPlfe9NHX/pz5JJGJlfM9oqZrUAd5p/6bx82Vbz3iB4/kcxViCdm96WmwLOEr45Lkybt26KiePcYR8HEurs6ItDgXsQDBA9J4d76bFzN/RynweN8rmgl8Q9g++KvsU3bnAgViSLQ4k4x5F7NtZH0bzk0IJoQT5zH7L5FPK4h8VWzFZ1PNDloRBmI2l4Fng21LqbbjrhdL5RFMMfGDXmGSSMp6vEfmp3ekJflMcwtR+UeBy9ZU7rF7M4R7N7RkwqayDduCa1s7CIOVOKRdWHb4t7SPynh9PAGx3zJKxuUYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CV+hig9yOtkrv3Lo3dxF/A7RqR5dkQIScCDzB4x/XvM=;
 b=cVnctPxP7hxs25FBesxdw3SJmVOcFiTS0YYQbRze6UmKDgskD8qmOapSpt4RrHZv/ei/jg+/mWBREKkhEgO/stsiuGp3+yMJyd0ADDmkY8htOyQ4hY2fnvIlS5alGSMzSxzmodYXlQGm1E67YcCMXEK54SzaJoLYzpEqE2/GvxlDNVdDQ+ukrUUaVnax5C5izXWyiFKozlXOF01jKsIUjQDF3OATsLkzwFTIMEm7UD7AO2IJTRLSOhFsgMyTBaKHNKenvRMRwj/wOdJfXspmG7H/Gea8LVg7W8VWAb+EFi1MuB2xd4CZSO1KrCQNzN8KtjDjk2IVqa42leQP9h8jTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV+hig9yOtkrv3Lo3dxF/A7RqR5dkQIScCDzB4x/XvM=;
 b=BmMjkhfBaa8XeuOb0lT3FZshVgHuApwA6bwdPtwb/FQjtNytshKpP3PV38rtqnuD4FdGei594ydfiSe0s9XgS37YfwUHh2jMiVAzU16CNhzroW8XUnmPxdDkGBqvzFcGBpCdlzCmd5VZLR6dlx+kD1mlRvCNWrqhv9miBz+nwrM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PA6PR08MB10694.eurprd08.prod.outlook.com (2603:10a6:102:3d7::6)
 by PAVPR08MB9842.eurprd08.prod.outlook.com (2603:10a6:102:31e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 07:08:26 +0000
Received: from PA6PR08MB10694.eurprd08.prod.outlook.com
 ([fe80::3e92:fa93:753f:8405]) by PA6PR08MB10694.eurprd08.prod.outlook.com
 ([fe80::3e92:fa93:753f:8405%6]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 07:08:25 +0000
Date: Fri, 31 Oct 2025 08:08:20 +0100
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
Subject: Re: [PATCH v5 13/16] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Message-ID: <aQRgZDWo0Jc2-YrX@e129842.arm.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-14-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030140525.366636-14-boris.brezillon@collabora.com>
X-ClientProxiedBy: LO4P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::9) To PA6PR08MB10694.eurprd08.prod.outlook.com
 (2603:10a6:102:3d7::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PA6PR08MB10694:EE_|PAVPR08MB9842:EE_|DB5PEPF00014B9F:EE_|AS8PR08MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: e823436c-4299-413d-a538-08de184c5ce7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?LxFnH4s7QkBXu2v7NmH+DG1X1URzyn5z5dBky7HmBMy31yo0fRUoDjKv2TuD?=
 =?us-ascii?Q?iZ3I/lzFSY5eYy3TqCZ8mcbTGnYKW2ASwq7aaEA8yzESxR2bZj0jR1WOIYHt?=
 =?us-ascii?Q?J3C5Ois8a64mLeUIAdZfvHGTX2YV8stu0QYSJH/GqrnMD+v5btiW29VKcuK+?=
 =?us-ascii?Q?ANBJ9LnsXUe5jo0638hz85yaAUAe0bi5VqvAYbirUZx1CvVNGJcDztZ2eHz8?=
 =?us-ascii?Q?RRCMoKz+9qwMNMAX0dxdlbtWoJ3eSQ9rAKK1IURIxg9HDV3vY+UvLaD1W9G4?=
 =?us-ascii?Q?qFMTpw/YbFFz9fmK3jDq331la0JdehkLco76PRmHFqzaHoAqPy7pvy1WXkVz?=
 =?us-ascii?Q?C0ax1lTH1IMpj26dpsTxyar3+j25JjOyx3B73dsrLgHkjpgCr8I5gsBguOyZ?=
 =?us-ascii?Q?IIFU7Ky63owfq+eWrOU5xkvT+ZzI/bEnH2Oyup7hFtyXRViXSPL3mzucFpCG?=
 =?us-ascii?Q?PHEZkmHMUn9FCwzeNdwG6/zjnN1o9Iyc/xva7pCymlmVM9rytAXLDcR7Y9oN?=
 =?us-ascii?Q?e04rbb78tpYsnjsvDRKTFIag3F3pJLT2pxOLdhu4FY+7mVmDxa3k0c1Ni5qy?=
 =?us-ascii?Q?XOAnhVifE4r9pdBvXqaZLVDjR1Ak5MZ5m+1+t4SDXdVhqWrX2sNPxSu0zjBV?=
 =?us-ascii?Q?xAIeLFRWpdbeswwEjwyQGm/hMPRUpbCxXtuIRZnogMG1RKr9iqL+w3RyHkIh?=
 =?us-ascii?Q?M16+o4GrgTrv/eM/H0zmaP1XsHS5rc36DYLxbVYwdIry1kEZmeacvIJ0if9o?=
 =?us-ascii?Q?JWTT3veDbLUgKdsZwMVwb2L1ZRv/B7Jwwa2bX7LW+q6/dw9MbKKsDBX1vVGf?=
 =?us-ascii?Q?kJ5i9vH5+3NN5yeFejj6kTvDZgOkN5nrxxfMaRDmTuXKXqg/bbl0kq6rchr5?=
 =?us-ascii?Q?M2a4TPYjKznFvolgKCjR56Fs1Au2My4G91a7J9M7tdJg3jPtUq20baq7dk1l?=
 =?us-ascii?Q?MtDnH0CzMj7TXxRQXZD/SF61K9dDvwEnydhKgnknvb3AbbnBY50mthYCQw+h?=
 =?us-ascii?Q?V/sH61tN2fak5aiyew3gDnm3KtTUBR++ZuVF1GrjG28+XX2tpLlAA81wIbqi?=
 =?us-ascii?Q?N/r47Tp2a09iR10I03jAdVfLtSsVIoCbF7L+TbEYaY66JUlu7ZN2gP6EiI11?=
 =?us-ascii?Q?Fbq5phiaa+t9hZ5OZSQdrrAyXdW6ckS56A5sW0kYvPDSJKGUCXB9tfxqNcD1?=
 =?us-ascii?Q?vfpBr+dAUP0S+lWnD9GyaN4bf+FUU/vt2A3+42oYP+zkY1OruMYiktEoiga6?=
 =?us-ascii?Q?LX5Jgvz115ezcOMX2i06iOJtUKa8fTg2kB0xoZuQHQabpkf3E3AdR8L59kCJ?=
 =?us-ascii?Q?KXTCRr/vHQ4ro2zEm25c5H+iQTihZy2kOOqBZMgZJr44Vgvd5B8jY23cqMMR?=
 =?us-ascii?Q?h9O50wAnviYlqGSzXtclNi8zVPwPBqehdzdY6VMUBz/vxlu1qhRfUlRyisiH?=
 =?us-ascii?Q?fZuvEARTi9AyYYiM/zWsbibybVJna9pp?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PA6PR08MB10694.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9842
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c54b09e-aab2-47e0-f65a-08de184c48a3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|82310400026|14060799003|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+8a/6848aiyjjpSSzsQZ9WexNfTxJ6rM4rcWgwSVI6QKGbeSizA/cm4VYkif?=
 =?us-ascii?Q?VftY24Rc1Ms1P63ZRR292SENA7YtJmwiNaBPyPLgwQKtwZu+oS9j1EkdSPoz?=
 =?us-ascii?Q?4mROjDnDmvCthrDR8kzKGxsdR6W4yd+Gs9pXlqvk510BRusFhDjQ0LoQgGsG?=
 =?us-ascii?Q?tdq/dmB+95wIMFUzOZ3JqyKn17C8p9ieARaDlS1TYzmZInulYqsOOfSZgaHM?=
 =?us-ascii?Q?GhYEJDnNOhFlCmn1BVq4QJIxyJTxU7RUMqPb8xpPljXI8tvvuh+bA0TOoXDC?=
 =?us-ascii?Q?ximteKMczqmSeomMzMsx/we9nZRnqiJqxKgfAHo+EDqPVDgZPclx30um01RH?=
 =?us-ascii?Q?GG0yM0zHW5PnOs4tPioaNqTlCeLotO+cUVKKD2et/VLT6p92pABAjdxfWqSQ?=
 =?us-ascii?Q?NohwOxn1k4htubYNGQ7nSH0nffWqpw21OJQI2kM+v/zuxUplvmI5OqoX2BcV?=
 =?us-ascii?Q?VAF0Hu2FyuJouTeGrsd9DSWNKu4sp2Rjv2vz3EfCSCBXX/aJoziOOudzGh2N?=
 =?us-ascii?Q?c0ok53ZIoWTMUZ1Y0QoChdiIA07NuII+DXEi9ZgY7FJ3u1pPgrpDURQ7VWCD?=
 =?us-ascii?Q?FfpVHfOFfMmIwJzcW59saIr9EFo5kzdIvZQlYTVVQosNrCwIN9f3x6ONc6Oy?=
 =?us-ascii?Q?cGeRLMR+KAQ3NcJPP0ftry79idl1jo6Nr7R2zLn0ghwenWG0L/Il9+vl99iY?=
 =?us-ascii?Q?t7F5umwuhJFHH6b7gZI/c9Ln/beEdxhSCNXc0x+5Z1wXq/g/3LtRXiLIbkRE?=
 =?us-ascii?Q?7frY3HcWaLLPQkt3KJH0ZPFFAXhBGByIQkEUAZeaA+EV/aUahyh02zD1/+AM?=
 =?us-ascii?Q?zEtVpfh1yQPoRRuoQXeH/GQUZjagNGtrRT6IckM4bT1yUGMhVCEfFTq2JkND?=
 =?us-ascii?Q?hyuUPdYsAhXQRB+qFGIjlZwMvlyC+2w3xeurTXCpQC7NMUt4xHc7K2nA+X8V?=
 =?us-ascii?Q?StennbubFmk7QD7FNlasFu9pxX29K5EpSviG+HD8wqCrOnPpxE1bw4EzK9kw?=
 =?us-ascii?Q?gfzDtYS2kPIlVmBX3i6/husZrEzRdrPz4rF9enMRZbHMK+peV+j+s0rGgNx4?=
 =?us-ascii?Q?bJhWl6iEsZf1l4f/MCkdlkpZi2r8Nf2J3Yy9K4EfizkDWWrOo3evgkqf4nca?=
 =?us-ascii?Q?eI5HdZZSDIRLk7Ym2HcxOdt24FNtcjZdj7NJqDjLIz7PNHWOT1JljnyT6/Sp?=
 =?us-ascii?Q?VWdaDCYTIXEMuFbDp8PAi+8S8LqXGKr4peoTNMMrs14IE5hEw5uHjvyqVbYn?=
 =?us-ascii?Q?OtvJlm7avWWY0KbwFDEu3d5Jm6EzP+youB+G2JpjOE2okBTmsEhP03vtPFNE?=
 =?us-ascii?Q?YUtHEQO5cgKRwhU1HPTepPTXxpdyhw1oSGWLSia+QKoPL3SoxeSSNQjrzAff?=
 =?us-ascii?Q?fQTtDmKEKbF2md9vzw1Yad7mHDNBiHkseW/ZGLxS8JmTlNKzl5NNe/1S/qDh?=
 =?us-ascii?Q?/WwdLkUXRj8qR+al+UQmzLXk7nwZKSlIsFIFWmn8mojuu7dbTkXkhleAk3Er?=
 =?us-ascii?Q?VFB3Oew6DXzWsdVXetQyhUoXFTevcv81rvhy+nKhBS9S+V9cixecyKWqca1c?=
 =?us-ascii?Q?K+v34c0nMJqInSlvA84=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(82310400026)(14060799003)(36860700013)(7416014)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 07:08:58.7471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e823436c-4299-413d-a538-08de184c5ce7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8874
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

On Thu, Oct 30, 2025 at 03:05:22PM +0100, Boris Brezillon wrote:
> +static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
> +				  struct drm_file *file)
> +{
> +	struct drm_panfrost_sync_bo *args = data;
> +	struct drm_panfrost_bo_sync_op *ops;
> +	struct drm_gem_object *obj;
> +	int ret;
> +	u32 i;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	ops = kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
> +	if (!ops) {
> +		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
> +		return -ENOMEM;
> +	}
> +
> +	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
> +			   args->op_count * sizeof(*ops))) {
> +		DRM_DEBUG("Failed to copy in BO sync ops\n");
> +		ret = -EFAULT;
> +		goto err_ops;
> +	}
> +
> +	for (i = 0; i < args->op_count; i++) {
> +		obj = drm_gem_object_lookup(file, ops[i].handle);
> +		if (!obj) {
> +			ret = -ENOENT;
> +			goto err_ops;
> +		}
> +
> +		ret = panfrost_gem_sync(obj, ops[i].type,
> +					ops[i].offset, ops[i].size);
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

This function will still return garbage if args->op_count is 0.

> +}
> +
