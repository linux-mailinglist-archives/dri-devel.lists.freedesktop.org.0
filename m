Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7F9B7014
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 23:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B186510E811;
	Wed, 30 Oct 2024 22:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="YzZPD23v";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YzZPD23v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AE010E811
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 22:54:52 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EHLT5xqeQ4e2KFDp2fMyKdNxvNuYxj2n+MDAlrkcuLfDqL0xdWzp8V1bDA44Pcd2bU/lXm+E4AosU2C6EaBdxaN/JTJ6WWy3oOWH6q/5w6BYRJY7zTXnzsFzZXlFUIE3D2AWqfb9pwcOMzaPs18xfyUP8wrR7/zx6uqgVDf4FG3/Dm8m8wR8P2S/b50uhkSFN+TFNTJ2xBDKShwMhb/QJ3fnSKoVe0Vx561GYS/FiB8/rZpBES00gpmdahhk2Y/EEKiUfs5oKA8TRyBjVn7Iu7JEb+Sx9PMpVDgAaWl3wZf+420+HHMAk4eqj6dCPgIzj2vcwz1DuUUCqPVCJYAFPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWueCNyZqVKU1U8x04wH5AvoTaQVzgpJQk+LfwKyuiM=;
 b=URicetilYVTRJai6ONmYnUur6BImHebZ6xps/0DNqvL/xWK29F+X0hoKwl8onQM8pT06LmHuonQE/I480Srqc8w593gZvWPtO2FDGVgi+x6tGpJQ93zLTBES8l5jOVOFnxSKM7lKSlGEcy+p81lNdljikUYnlIO+PUmNC2BcBR9YiZnbBvpyCRWFOwa7yhvxNA8Jj25TnGpcgnuEzYvnYRhkF/OhoFY+NGlIouCj+vShT+Tz9Amy9wblVR3sGaYuQGbRWEzXsxl6z6VJiGtmgRTSzbI3bJNC8kbnrHbpI7TiuL6o2gWXg4QZOokqhEtJLZYCDxUbkxIbKz/mZ5T8CA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWueCNyZqVKU1U8x04wH5AvoTaQVzgpJQk+LfwKyuiM=;
 b=YzZPD23vv0OK+rfzkyJXgCVFz2xaQ3XQ7V3uK6z3mwzgauUEiOVm1OfgAIl9lH1kmvoMaFb3e5PAPQUFGTWr5rnC1ejhng1AwABbukZBbhnFZ4pureWD2Owe5VH/sfOGXrJEUkzAUh3pzUhJfF4+zfhAQizW3Y+Q7XkowLHnLm4=
Received: from AS8PR04CA0172.eurprd04.prod.outlook.com (2603:10a6:20b:331::27)
 by DB9PR08MB7494.eurprd08.prod.outlook.com (2603:10a6:10:36d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:54:46 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:331:cafe::46) by AS8PR04CA0172.outlook.office365.com
 (2603:10a6:20b:331::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Wed, 30 Oct 2024 22:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 22:54:45 +0000
Received: ("Tessian outbound 373849c2df5a:v490");
 Wed, 30 Oct 2024 22:54:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1974b11ff324607
X-TessianGatewayMetadata: PttunnHR+72Uo1fcXjn3+Grq/JxzQyqai4/oDqYQZcAYiUjZGruWWFTVEhkJFuOUMv7iWRXg280im/pEw3wfj0CkR6Giwn7LOyLKzXyk9RsECV9tFmzGRgFV9s1B5z1EzQ7DuAomQ08g9xd0MW5VoPLDVUEFNiTCm3MYU0DSAmQ=
X-CR-MTA-TID: 64aa7808
Received: from Ld3d405e87095.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3FF211E-B71E-4BF7-A006-6FEBEC8435C1.1; 
 Wed, 30 Oct 2024 22:54:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld3d405e87095.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Oct 2024 22:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQBekIozVgpV2XgJI8D8ZNobUyRgNgoFVLGTuncpvs0PELSBDgEMdsJ3T21FBPYhRwIRwSt5iizN+ueGEW0LOkT2DOkarZFdqEm8KwOpFwRUNqK1mvd55kVwZ7G1vMeu2Batz7P5NzksjBJvpDXTgE0NvBIQeAvgLjlYN6Cs6+exM7ED3gOE/mB4e6UBbVOKmp38fTOwhfxmGG3ATe0/tBC24x+qphi+IhIVS2mgHviIu3njN77XCZ9bvrwmR82ms9gOKhySdMlcQMhbF4N7Zuh8oh8LAHaiQHXt6g5DFVwLdAcWr6yaD69/H0acxIFm9CB+USE+eGYQm99f5oV6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWueCNyZqVKU1U8x04wH5AvoTaQVzgpJQk+LfwKyuiM=;
 b=YbMA9LcD8sU6YKwVCOxoLRnbCatMuLeqVG/BZjAgCYgfL5M8t2mIyOeYZ1QkATLJzATEBbd2v4oSgM2KChI+YJvoRjkcu9IyM2yiBDffqZE3Ewefnp089w1E31sjfntfUIrs25Pxo0u69nu2x8Qg0zHgu0rF/Sf7wmWLcgGNMuO16CFcqAXdZKNiZzXdTEMSWHtBymtF8WDKQmsix6+7syHO04rlx9ny296RhcV2fk+hgDfyocoO+Yg3PA8kI8eo9v36A9sCGdGXC2yEEIMGhMqNbkz4gHYIm5SV9jsk7zN4wkZsFI1g7VXPHqtCooYd7sKnIHAnCh4Bs0oF7F9Srw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWueCNyZqVKU1U8x04wH5AvoTaQVzgpJQk+LfwKyuiM=;
 b=YzZPD23vv0OK+rfzkyJXgCVFz2xaQ3XQ7V3uK6z3mwzgauUEiOVm1OfgAIl9lH1kmvoMaFb3e5PAPQUFGTWr5rnC1ejhng1AwABbukZBbhnFZ4pureWD2Owe5VH/sfOGXrJEUkzAUh3pzUhJfF4+zfhAQizW3Y+Q7XkowLHnLm4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:54:31 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 22:54:31 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2 1/3] drm/panthor: Update memattr programing to align with
 GPU spec
Date: Wed, 30 Oct 2024 22:54:05 +0000
Message-Id: <20241030225407.4077513-2-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030225407.4077513-1-akash.goel@arm.com>
References: <20241030225407.4077513-1-akash.goel@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0533.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::18) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB6182:EE_|AMS0EPF000001B7:EE_|DB9PR08MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 456d61ac-55b1-421e-09ce-08dcf935d99b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?wMXwZFs3DTFtroiX0TEFD9V32DNqCo/NXjekzLpLbdjaF5rW/LhpylStd7k5?=
 =?us-ascii?Q?6w5VQO1kkRQCJyLZdTQwESjS4tdMj5d81Hh+kU818iQnAhKZJLb7unplDYYI?=
 =?us-ascii?Q?Mbz+63FQX9JbENobhkTyNQ70Wiqox6S+gxTAqWQBSOXfdmCGKjYX0+yTtuHh?=
 =?us-ascii?Q?J/W/a9CyN9F9g0hZ+j01tkR5HyzTDvm3NC4cGeHTNkFJ08tlIHJqW+jOLQsn?=
 =?us-ascii?Q?GvC83emukVbHCWSg7VoebKgFr95xXXMwynR2OhaAu+BMWRgf7H86HgDq3uN4?=
 =?us-ascii?Q?Vz8jyaNOBcW/nxjE8X+HdPLXimJRBBDY4eLe7v1kpKlII5ZFRZgCbHd/o+y0?=
 =?us-ascii?Q?YxJ6adcKYPp/aoZZ9Yd/1BKU9v7yn4/grbYV4pahg2hqAIvYS2rom1aF39EE?=
 =?us-ascii?Q?h5q6Ybxg7yUHcNmog+aQB4WDDE4BmkQ8pohEfi0ImBGGpFY6r/ZLiWQKEOWi?=
 =?us-ascii?Q?kxiqn7D5BDG6cL/Bwm6Uhm5QWDmv152bUBzSRK1/jmT/2fX6szcHORokqxXw?=
 =?us-ascii?Q?yB5dl1JQw09xHyfCf7Ti8CbV2SOrmdYsSu4kuVbp12dtwgnuF9Yrx5lhhKDN?=
 =?us-ascii?Q?nDw8axJeexDFPa5wGQjVQ1CTSSoIcq1WMKhFMTzUIGvd/pU4qeQ5lipWL2VU?=
 =?us-ascii?Q?vXZwdBlAIa9uwus6vO2/uR2D22Jzej2y9EBPgSOKjqYs5nN/fMBv6tQn9cUE?=
 =?us-ascii?Q?Ng8keqW1hLXnzf2uoYf4TtBeirgAFm7uuIt1SB2VUpB2gWj9onmvSv0PuPmp?=
 =?us-ascii?Q?CZ6rljTakI8HISHfiaY16sv51MPpXEGyW8D5DdyvH1+gmZT8aQF64FpCl+ov?=
 =?us-ascii?Q?klPZhimdEkDePBpZwwrkBqTxnQ6eIHxIRt8dkc3CBTKsE/jFywJ6qMPm67PP?=
 =?us-ascii?Q?ubUE7R72+SUldy1vJTGu0I8erAIGcgEj2boDfFguz0BL82QWeZT7d94pDlZa?=
 =?us-ascii?Q?757l/MDRPjUGkQtRg394xrwX0j4oejv2AUpO3HdF5fguZBlCnbQ3u5NZ18VP?=
 =?us-ascii?Q?U5jvx/vb7fdAYZdYW2HsM6TY1jAJ6D2FIn6M8FewnH8WJIX8kwaNqncIyVOj?=
 =?us-ascii?Q?pLAUnNLZU7ACySrw6OtrbQy7B8Ucm12RWE/Wmt+1QJ8a8dNOKkMkzr21Os77?=
 =?us-ascii?Q?kwrDVVBVwOBJRFBxq+RaKLQMsfkWFwH7bGC1FfP/uUjAYQVzBCoSC/jpHHOP?=
 =?us-ascii?Q?C6B7/VXNgyDHBfPOQK3ClggaUXne5QGr41mjezAUfZkkY0mchDWvj9/2IgV1?=
 =?us-ascii?Q?27R1QnPJHEbLxEOYqVxXEMlBkyqdfc6UVLcaKVkRGwiC8jqrMwueGJGJJ5Su?=
 =?us-ascii?Q?SC5wrEXPjzs123u3YgPyZLtf?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 778ef862-344c-4838-dc93-08dcf935d0a9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/IxMKAvHwzviaJvNPJqahCvF2XkHETb9D4/rARO1+Sh9dyYrfj90YoYTnads?=
 =?us-ascii?Q?9PZ6IoWZ8gMIUxIXBOafVUBBqgi/YmAFteWcgJME+zp2ZbuZMgUFp/PhS72q?=
 =?us-ascii?Q?mdgH59AIJ+VHafq7cnb4HCbe8/jyMs8TjbM48geCVt41Tld9LwcGGJrXhxSa?=
 =?us-ascii?Q?tyNnFEWIznCWcQ62lY2akN3hkHyepHMRuFqNGSd57sDCsp6alkP7ckiHr85X?=
 =?us-ascii?Q?Pv3Q/laaUaHLnYBzyx/19gRtwlbUs6FFxZhI2NiqusGOmhv2HIFtDexyKnW1?=
 =?us-ascii?Q?3tEHDah/nGmo8nqhs/16VcnQ+0O77PxEPeWokMTy+4NSymhhJRAm10DaS++y?=
 =?us-ascii?Q?ivGptqTpVrDFYZSltCWrNXHZzma5KU5UmAh6Frb4uKfYnRZKcA1gcOaIgPVF?=
 =?us-ascii?Q?rZS7MwHIhEhIkHoYKPjmFn8DSvu51p4SbPVmJjVnlV/BTM7N7EX/1jRxMK9p?=
 =?us-ascii?Q?DJFpoTuknFNFOijFCAONDScuS5vxhuOsAosvz/j8ZrPI4A4gADO5au12fMMx?=
 =?us-ascii?Q?zG3CU5joGYWAUWDtmxYoha9VEdW8jDTswkIw6OMRbAWZ9TxB2WgY2DuuAmsz?=
 =?us-ascii?Q?TZcl1NC8f3CMeRCbhtnCe3jIjMTuhPw3fnVzp5ED8WXHDFz7mVZL2S2RqhWu?=
 =?us-ascii?Q?77HD9p2Mvvhx50kh1KWKzodplMexf8lTyYd8ajDVinx1qW6k/+QyliA9I0hG?=
 =?us-ascii?Q?YXPspbLPWQwT7mLl/YKqQ6VWCd3kFLFU2ztlAotRV8eiMrxMIBwBbhbia7Og?=
 =?us-ascii?Q?uX3vjeckh1G8+UyiU1p3kUrgvsckSMBBPi4dlFBlQuMGgkao5bdl9X0krWwO?=
 =?us-ascii?Q?nORBXLCYZdlGh0Rwekoz2xCzATpCtI7HDLXmhFhYyj/eMOhFQDnqh6Uy5n+d?=
 =?us-ascii?Q?O4mz+gRCmjTBL7pUYGGJNT661YS8ZJMV53zMeRikbMNrJq/wMZ4z0MNUiA8k?=
 =?us-ascii?Q?uah2d1ZPElhkPl4T3u6+EZyMPZn01TCmF6E0gtsPxIXHs1vu7qSV7CPnHDQq?=
 =?us-ascii?Q?myo+77fwUWux100LyUOQddQD0n3oaWNW44tfg7O0uf5cteaj+0fOQoECZIrC?=
 =?us-ascii?Q?rRAo0Fb4AZNX4sG5vZXVMrJtnUaxn5Ee/5ttUiPQdKquA2ZlDioVeTu3qN8/?=
 =?us-ascii?Q?0Sx+YpZAVv12pqVEZXlMZm5SspPIh00SacAbk4O4GCMdtqjmmpATqmSG2cSk?=
 =?us-ascii?Q?YMqnhHbjxGguEpishh+OmbUaSDOGh7shDSuOdLj5WzOufV34oBGqFpJy2jAp?=
 =?us-ascii?Q?Lc+87XTczmWI1qh/89zyuVi09NozvLn1RpRmFc067zag2QsVCZDn7zttmPEo?=
 =?us-ascii?Q?J0Iq/wzC3M4aSZwfftSjrE+3zPbHtpb+RNlero3xghaMFsnxMA7VhRPCTdMj?=
 =?us-ascii?Q?PSN5VMft6z1xl9xBlXxIuxTcB8NZf8ksKFzWFJzDu/xyhJmT9w=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 22:54:45.8698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 456d61ac-55b1-421e-09ce-08dcf935d99b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7494
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

Mali GPU Arch spec forbids the GPU PTEs to indicate Inner or Outer
shareability when no_coherency protocol is selected. Doing so results in
unexpected or undesired snooping of the CPU caches on some platforms,
such as Juno FPGA, causing functional issues. For example the boot of
MCU firmware fails as GPU ends up reading stale data for the FW memory
pages from the CPU's cache. The FW memory pages are initialized with
uncached mapping when the device is not reported to be dma-coherent.
The shareability bits are set to inner-shareable when IOMMU_CACHE flag
is passed to map_pages() callback and IOMMU_CACHE flag is passed by
Panthor driver when memory needs to be mapped as cached on the GPU side.

IOMMU_CACHE seems to imply cache coherent and is probably not fit for
purpose for the memory that is mapped as cached on GPU side but doesn't
need to remain coherent with the CPU.

This commit updates the programming of MEMATTR register to use
MIDGARD_INNER instead of CPU_INNER when coherency is disabled. That way
the inner-shareability specified in the GPU PTEs would map to Mali's
internal-shareable mode, which is always supported by the GPU regardless
of the coherency protocal and is required by the Userspace driver to
ensure coherency between the shader cores.

v2:
- Added R-b tags

Signed-off-by: Akash Goel <akash.goel@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index f3ee5d2753f1..f522a116c1b1 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1927,7 +1927,7 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 	return pool;
 }
 
-static u64 mair_to_memattr(u64 mair)
+static u64 mair_to_memattr(u64 mair, bool coherent)
 {
 	u64 memattr = 0;
 	u32 i;
@@ -1946,14 +1946,21 @@ static u64 mair_to_memattr(u64 mair)
 				   AS_MEMATTR_AARCH64_SH_MIDGARD_INNER |
 				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(false, false);
 		} else {
-			/* Use SH_CPU_INNER mode so SH_IS, which is used when
-			 * IOMMU_CACHE is set, actually maps to the standard
-			 * definition of inner-shareable and not Mali's
-			 * internal-shareable mode.
-			 */
 			out_attr = AS_MEMATTR_AARCH64_INNER_OUTER_WB |
-				   AS_MEMATTR_AARCH64_SH_CPU_INNER |
 				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(inner & 1, inner & 2);
+			/* Use SH_MIDGARD_INNER mode when device isn't coherent,
+			 * so SH_IS, which is used when IOMMU_CACHE is set, maps
+			 * to Mali's internal-shareable mode. As per the Mali
+			 * Spec, inner and outer-shareable modes aren't allowed
+			 * for WB memory when coherency is disabled.
+			 * Use SH_CPU_INNER mode when coherency is enabled, so
+			 * that SH_IS actually maps to the standard definition of
+			 * inner-shareable.
+			 */
+			if (!coherent)
+				out_attr |= AS_MEMATTR_AARCH64_SH_MIDGARD_INNER;
+			else
+				out_attr |= AS_MEMATTR_AARCH64_SH_CPU_INNER;
 		}
 
 		memattr |= (u64)out_attr << (8 * i);
@@ -2325,7 +2332,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 		goto err_sched_fini;
 
 	mair = io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg.arm_lpae_s1_cfg.mair;
-	vm->memattr = mair_to_memattr(mair);
+	vm->memattr = mair_to_memattr(mair, ptdev->coherent);
 
 	mutex_lock(&ptdev->mmu->vm.lock);
 	list_add_tail(&vm->node, &ptdev->mmu->vm.list);
-- 
2.25.1

