Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B259B7012
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 23:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F0510E80F;
	Wed, 30 Oct 2024 22:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="k9VtfyeZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k9VtfyeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6E010E80F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 22:54:48 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t+o/bKGBT7p9kEYqoZ/pxytzxu3EOeQTKBhDqdOGF4/DDllmAxMr/0Pzptg6rRaPjYCKs0/FrYTQdzDWEzVP4CwlYNVQziTbmzXpkJtPdR+/kiNT1wM5RHS1JV24MYAWasse2HPAHw6W9ZjOaq8PjWlkqafyGXwb+xMXw+mmUdHOUKVftr0dzLcM51S47owJsyAeVuXSjrz4cv/b22WH4QGqJKmyEiwYy3qYzaRqqQ1X/mju/Pxf6enBgkKRmuELDmcd4cACz8qEdcjRcsDXzxplY52QijAadq+9/iNAQ8fXq0rYN7NBl6iwu66+llxrfSNm9Ji5nUdyg0DPQxzmvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMjEiFJDS7pfTQ12HBPYix4Wsu56U4W7SjBRDXijWKs=;
 b=F5H87Mk27sentn21TXovgU9/L3zmL4+v4Vh58+xe70aXo85ISnKGDeyh43HFj5Y4bcR3852vjqPZztq1ZoabSk/fLW4Sy5eLSRNxxgB3SbQ6x0SQsOiGVUEih9XD/u+NtO2SIEi5RhILziitV3QqIfS3jqRmrTPaGjyXJFc8J7UQXXMu5OcweYEkZ+0U3NEMQXQtrdNIz7NNu/LGjm0avOrkoow/UtHpDqEFKBfYY6a/eoWNNXDDY8/1YvGfHIMG9PIShuDrfR7QRweJblvGyZGGFVkbWH1RF/Zkcv0Lxlgr7LqYEF5M6cJv5jpij4weC2pGeiHotxECwmj5b089sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMjEiFJDS7pfTQ12HBPYix4Wsu56U4W7SjBRDXijWKs=;
 b=k9VtfyeZ3lyuuNbXrCKSEicvE7ljva8lMrTpanchBOgSXKqfZFsMg+nOuylzC5vt6SkKvywzpNN9WUe5gMXcy5YSDQIG99470+P8czwFgPvmcPJAKcYmy+O0PJPKER1hxVGe9RNbHBWwwlR40FD8EPxaHHLkznf3Hxa4D+jdtlQ=
Received: from DB9PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:10:1db::24)
 by DB9PR08MB6585.eurprd08.prod.outlook.com (2603:10a6:10:250::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:54:44 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::a0) by DB9PR06CA0019.outlook.office365.com
 (2603:10a6:10:1db::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Wed, 30 Oct 2024 22:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 22:54:42 +0000
Received: ("Tessian outbound 4f9bb016c0c5:v490");
 Wed, 30 Oct 2024 22:54:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d4efa4434dfa321
X-TessianGatewayMetadata: Rx3sBlQ52DKUc3Zt/UamjSRSV1wsJv49TempBwChk16twhk/pi2oNzg97zmHNbBYt9gOYIPcarHfxe7o/VaNPQiqVSIpmML8NNmK/zJvJDEic7tPGzBqG6ozWQkwrbrecHcaxAhHLPFpoXo2lGVtJ5Vho2FnHQNbNaQGxUI/Swc=
X-CR-MTA-TID: 64aa7808
Received: from Ldd73cf7404fa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3A86D0CC-2661-41AB-8984-6760F4569D3F.1; 
 Wed, 30 Oct 2024 22:54:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ldd73cf7404fa.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Oct 2024 22:54:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8rIGdu9iEA+obyC8FqNK1/cT25duO/ioqTNIzJKGouTCneJvAHAN4g0fAV2p6ZSoNfXPzcdeQzmrrjUwGR8jcJD7t+5mNbPStnTDuwv1nOb0lRX1n9w42BWR+8LCES9tqMug9PMP+D2vutza1HXCCOIAfkWn6SAhO49P1+GrYwWw94zOoua1q5sfCPFYocciSYnCgRxIw/XIVP2b/XAY46hXbw2+yXk0E6ygurDj5YdMfJDqFTeWeYcGZQFVDcvP8ZBIK7vZhMkZ8k8kMQm33rqglxuV9iNY0xtbzYw6pezCUCA+A9kILshXYYMxHCMtWjiUWCpT6AI3Rokczjcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMjEiFJDS7pfTQ12HBPYix4Wsu56U4W7SjBRDXijWKs=;
 b=Y3Q/h40UJA3SSIfDDoCKwuZN+BlxtWj+ZyNtZBF0HlXHbC8CkxMyaloZDlf5Rkd6TIbHU1wZsY+rWXD/6Hf65pvHRaLBNEv/ojzzyoD+2MqumXdvYc5ti2GP7uQepUB95rmPXVJDC15roFrM4S4cMBcVsAGs79WE8SP5C2yajViks7K2bO5wNDrGO01L14vWDucViev6Zt+WNvQHxn/3Njq9nYh87zFTt6s2JSQh/SFBBu8oHDjOrUePRLgkAYkNbmeren25bPVm9sIfu7okmsZzGKawdRkzyZXEy5xXRlMSXiUOzBQyw/jvqomtPZ4W7qpdJm5ohqmJ7sUlWe9E4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMjEiFJDS7pfTQ12HBPYix4Wsu56U4W7SjBRDXijWKs=;
 b=k9VtfyeZ3lyuuNbXrCKSEicvE7ljva8lMrTpanchBOgSXKqfZFsMg+nOuylzC5vt6SkKvywzpNN9WUe5gMXcy5YSDQIG99470+P8czwFgPvmcPJAKcYmy+O0PJPKER1hxVGe9RNbHBWwwlR40FD8EPxaHHLkznf3Hxa4D+jdtlQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:54:33 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 22:54:33 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2 2/3] drm/panthor: Explicitly set the coherency mode
Date: Wed, 30 Oct 2024 22:54:06 +0000
Message-Id: <20241030225407.4077513-3-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030225407.4077513-1-akash.goel@arm.com>
References: <20241030225407.4077513-1-akash.goel@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::17) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB6182:EE_|DB1PEPF0003922F:EE_|DB9PR08MB6585:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afddb1e-2a30-48d6-695b-08dcf935d7c5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?jVF3gbCcPHnEAfLzsW8h6WTZOUNQKj8sDk4OvjxHNOWqYDCFqxT5WJHE0H0/?=
 =?us-ascii?Q?KX/hjmG/f5RbdOzvitOkKjrns8dKLfMX1XINaVBSlwS0bgEc6oFdRQbWIZa0?=
 =?us-ascii?Q?rfnIqwv0udr5uoLhU61R6GiqN46coXGUUCDBpBOh3KLEfvXGYRD64eC6wUUl?=
 =?us-ascii?Q?BxVQXELmgB0WHI5rLfqTl1nk7iAdhALXPr+9kQGV5Nwusi12bvMNedoYVJM7?=
 =?us-ascii?Q?nbplEXnhKs3oflrbW2KHukoo5QWaVSlAjo26KCCelrj8E+sIiIT86As3oDot?=
 =?us-ascii?Q?WoLo/l35tROZqPgVsmj7Kf6qGYhL+DKtW0W9aS7u1v/zPXu9VIpB2UQ97pBG?=
 =?us-ascii?Q?5ddPex0SzElPdbv5hAYnag65Vh8ZPjczPmqd/pj/wxM7rHgCDKANPRsb39bR?=
 =?us-ascii?Q?z/K5ZFdToTNVrKqBzeHgmE1Gc6U23nY9Fj0pAb1dg6gDO5ub/Dk+iw0f4R7N?=
 =?us-ascii?Q?43cIf7E/C1qt3HHM8VXnUD2Z3gRjnAoTiTMsqPx6JVcvkmVoiJkzHsPNAtlz?=
 =?us-ascii?Q?2J21C/GrwPDeatGh5CksJU9uRLCIja/AhU1WWGBsvyB1qIQTP6ic+PP1wW9q?=
 =?us-ascii?Q?TgYYoC/2QiQiXm6Oa04DSIhsh9ilYu7FBGG9QnJPrIkfaaRv6+CTC2OfMJd/?=
 =?us-ascii?Q?Pyjm1PORmA8nZ0YoVgzZdxHzXGmPCBcCnkT1pYPKblb/RZ2HeYHhpnPfItVq?=
 =?us-ascii?Q?ZMAuQRlpaApdWc3XxN6Sz9bSZ3KSom93++TWSJqLDB5lgH/w1DwCw4A96ErH?=
 =?us-ascii?Q?2rz/FCYQJsfpgB6cs4tU0FWHJlQr/IVCbBMO0UmrokN1d+9JWdKtVkE6+fr4?=
 =?us-ascii?Q?rY8UBFPpdxgG0/CQqr0tjqBHBAPKCk+Cu4LSAvV7xo4+3OBinr6vsRJ5jYz6?=
 =?us-ascii?Q?8Ouy7v8YvzKow0EpmIVAPyyrnXPXWVm9RlH1ziBHfwqq0E2/03vb+CBAFnRx?=
 =?us-ascii?Q?xqcRujn1F8Sugdgp1pf6FlIV7rfcsLLK8lVdMRG8w+LXg61y3/NXtDaP0TEd?=
 =?us-ascii?Q?REiKrhIGs23EdcZQGyZii7aeeimkeqQ3Oa85OjsPIjQO0MkyepbN7nc9Exkw?=
 =?us-ascii?Q?bdV9tZIIGBH34JbuZ5kPKSClQ7Hu17Lt1N+Bsxj9hWi+b68bMSAIPIMfHOjp?=
 =?us-ascii?Q?SLhS/jSn1whZlojrnkGE5edC0aTzLy4OU09jRRF1gDf+cwB7YkaNZ/ENNxSb?=
 =?us-ascii?Q?23sWWSUtocgm8Utu21EQhsPYtI1xhV8IMX9eEWSjq2QAZ7wt2nCn0m1+/y5r?=
 =?us-ascii?Q?Q80TVU81pzXIODo0f51y6ax9IhFBo2mh9aST9wM6HKBrn5LpN0YOlRIaLtK4?=
 =?us-ascii?Q?6o0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7fbaa608-e7b4-4f46-3ab2-08dcf935d231
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|35042699022|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2JLYIo4qr57330WdIcalM/HhLI23n76WTsuIF8FFlHkUr1FEeu5y3GF6cCY8?=
 =?us-ascii?Q?ejnjIqVIUp/y2esfSVDfhZQXzE8NB9vvabzzLoZOp6cBFMjJVZfLgk8F7c0Q?=
 =?us-ascii?Q?M3VLrOJc4vYuP+KizG9N3nG6crA7Cqy1yj/iDGCMUp2oMufd1RFah+v1zJNw?=
 =?us-ascii?Q?q7aTCHwIW1Kn057SpJ26W1bjwRXj5th+Mjrk7ERppk7GGgKICFFuK5ViyVAP?=
 =?us-ascii?Q?hTO4l6lMQ8Xmrheg7YZ+IbdXt4kyplnBGYc06+KDmT1D1wMUkanZ0OufSp2d?=
 =?us-ascii?Q?3Z1GIDUsq3PYMtX/c0T5yQnS2MJ35k/HXrKS0xaxq61Ex9mL3YM2GftnAg2o?=
 =?us-ascii?Q?NCWAVHG87OBeRstud1Fvf6Q7oDXZeMNmN768rrS1rptFltIb+wsKu1HUKJHz?=
 =?us-ascii?Q?gDV2ChkDEFCp4jF3po7elUJHYfpoxVM5qFifZ3rnl5Nm5xn3F+Vs3VU/zQmm?=
 =?us-ascii?Q?d9C2cuEgx2aVDtJIth64aHQGbvfD5volmsE+A60WKkzZBjL1U7W1SvTo6dH0?=
 =?us-ascii?Q?y46lbw6kwqYi4guI1EXh3WKG36WthO+FfwRH9BEZHtWFlhBGch3wOtfX9VPV?=
 =?us-ascii?Q?R+408+Y+2sKMydHAP246tR+Mv/E4ZICFjZ9aNsJsUgqsV6BucqppXhz6wdrN?=
 =?us-ascii?Q?LRcYlMt/0094pkXyNJJ4ybbTp2l0nGWKBCz9a4Uzz+1TlxQRNUd96ZEVo146?=
 =?us-ascii?Q?tHORGGHU5VRFBJXjNWR8B4Zp3lC8DZVcDrrxjhWO3DbLb5JmXFAety7jn1sl?=
 =?us-ascii?Q?aRmnP0Y66i1IVRLZL3wjRMPQPFo98O0TaicocXWuin3vvw2HMx9COgaIZ1bN?=
 =?us-ascii?Q?P5BYIaTjiDiNFSYe8rUqfmRdVo/2ggDYdRBB2QtUhMpTNVsrMi0qW8Cxpk32?=
 =?us-ascii?Q?9U4pfhD3DVzpBH5PJ2JbF2ZX8fqrscMZdzS1GAt2W4XMVqK6egoru7p727vC?=
 =?us-ascii?Q?PGNwWDywVluj3YquPakHhcViH3aqw2rkr/mY+JZmTJTvGE06zZAzh8hobn/l?=
 =?us-ascii?Q?+kzpXCfjNe/mhsTCxkBtM0S1KXpK9ngr6WLUpvChBHqHtcGYcxpxaJCb9XhZ?=
 =?us-ascii?Q?BWga3SOto3iBiPB4tzvYSY6LVR5ZFWTuygTTXgleWFvipXdTMyeilTaLWpru?=
 =?us-ascii?Q?iTQGI2OGH9vIHsIK4eRgfqRQ2vMSSdZ3n2N0GnwH4aNkqkJwJ1oL8EOSJxr+?=
 =?us-ascii?Q?jn/hZ3ZRTGcxvl2m5RyA0X4pjG1Rt2OtRof+od4+TWln3tRyIQ8swnLe4o8y?=
 =?us-ascii?Q?1JUrud8S5LwObcCPwD71JWjIxl1f0bCZvMb6XgBlbKTyfXAr/jJdQwNKqyRk?=
 =?us-ascii?Q?6cFeQ1wigBBVcqakZIQ4AU4hZrOZt/jETcaB3lPAL0PyH/kt2x03X2d7b3L3?=
 =?us-ascii?Q?L7WbLkVKq+rWISL7NubohMDVhM/jc1+8sG7VqeMfcqNRjVazqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 22:54:42.8389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afddb1e-2a30-48d6-695b-08dcf935d7c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6585
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

This commit fixes the potential misalignment between the value of device
tree property "dma-coherent" and default value of COHERENCY_ENABLE
register.
Panthor driver didn't explicitly program the COHERENCY_ENABLE register
with the desired coherency mode. The default value of COHERENCY_ENABLE
register is implementation defined, so it may not be always aligned with
the "dma-coherent" property value.
The commit also checks the COHERENCY_FEATURES register to confirm that
the coherency protocol is actually supported or not.

v2:
- Added R-b tags

Signed-off-by: Akash Goel <akash.goel@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  9 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4082c8f2951d..984615f4ed27 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -22,6 +22,24 @@
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
+static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
+{
+	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
+
+	if (!ptdev->coherent)
+		return 0;
+
+	/* Check if the ACE-Lite coherency protocol is actually supported by the GPU.
+	 * ACE protocol has never been supported for command stream frontend GPUs.
+	 */
+	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
+		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
+		return 0;
+
+	drm_err(&ptdev->base, "Coherency not supported by the device");
+	return -ENOTSUPP;
+}
+
 static int panthor_clk_init(struct panthor_device *ptdev)
 {
 	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
@@ -156,7 +174,9 @@ int panthor_device_init(struct panthor_device *ptdev)
 	struct page *p;
 	int ret;
 
-	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
+	ret = panthor_gpu_coherency_init(ptdev);
+	if (ret)
+		return ret;
 
 	init_completion(&ptdev->unplug.done);
 	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 5251d8764e7d..1e24f08a519a 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -77,6 +77,12 @@ static const struct panthor_model gpu_models[] = {
 	 GPU_IRQ_RESET_COMPLETED | \
 	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
 
+static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
+{
+	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
+		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
+}
+
 static void panthor_gpu_init_info(struct panthor_device *ptdev)
 {
 	const struct panthor_model *model;
@@ -365,6 +371,9 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
 			      hweight64(ptdev->gpu_info.shader_present));
 	}
 
+	/* Set the desired coherency mode before the power up of L2 */
+	panthor_gpu_coherency_set(ptdev);
+
 	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
 }
 
-- 
2.25.1

