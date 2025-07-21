Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF2FB0C26A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE81C10E50C;
	Mon, 21 Jul 2025 11:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="VjHM9Eif";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VjHM9Eif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AD410E50A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:14:36 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZukZhCKN0RuK5xA1BoIu8qaQbbr8ug5rwo8NCZCV21H1DQX5PDIDs8HVkkDDcdd9SyOLTuDWiktuiltODcC2g2MTzsrzDwUmT79gDcT4DIeu3V+F03mTWMGc88L9Sp4ckE699qnFIccNSjQvFxBHrT+vwlNVn8NQ6yPYYt/LFGtYP229vL6Ye1arSW9oBwZTXSzZURBbZIdOQRlrJ5e/pwyK4dyNW0//idJdH9Zr4mJ8ixdG8LmBSMYlBBpF2asP4NMdX0jQTpObrBrm0KppVHx5hjHWrDfZXzGv5m3Wi+96hJmtlOcamhAb/1ucdBjsE3c9WcDm3ik4rbdPLfcLxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=kMMVWx9gXBdKviCnFooFVInP0m01T7bAFhRKeDiDy9zqk4xXLBfj9KOxvXgadBfMhLdSXYTbulLmvbvssiN60Em5A+pKfr642PJ4OSP3WCD5t2wz+mwc7RHhSSBdVMykGKHrtd3OEE/Ec8A2JECY5guxnyQIGXKKoK3n2skNuWrjVd0p3NU2bZ8rtyJzvSzuegqb6OpcjsVy3HvMSSY+hnrQh+RhO/KqwpD727ffj76KYZX2RBrd+NHr4twvqO+ydl9YQxMMx/g0S18pth5PwlaHNaZhPQD5CPsovSu1NEd7LaS3W2EuEyVeVSoZCFbwTzsyIi1jkuzIu+I8+31jyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=VjHM9EifHfqy/Jb7CMlo8QmTzuxtKGe9TrG7WPLuyv+p8Eou1x2ddWxo9ezBeeybssN/aMW7C1Y7EKA738HQLCNFk1LxJOBRNHeymQvlE/AmpP9rc2k+dUR8xNZjYYN0VLeDx9w1lG94D3KTvIhFEkRmnnHSmt0IMKIVN8/QmrM=
Received: from DUZPR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::17) by AS8PR08MB6648.eurprd08.prod.outlook.com
 (2603:10a6:20b:39f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 11:14:33 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::7) by DUZPR01CA0023.outlook.office365.com
 (2603:10a6:10:46b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2whyp06AtfDC5ojKUM5hIjoxuW3B/AG4owt5INy9t5j09DIVTzwqe1c68Na2Kd6qAgZyXaP4q4IzeY5xF5wJPwvMHP2hKFAk147z/cAPN00CuvCkJLD3jZQV6vtbnNUWq17MzpBlss55tTFuwdlftbht1nruVPeFBQIMHbn3CHo3iefVt4F+ia+mHDjfI+K6X6GcMCen9Satzhu6Y8bWBso/XDOQiUewVh4AXrFf6HXxFnEw4fAdzhJLDU058VFwtI4axGzqqSW9wGzEzmTMgaQMD3f+2+Ueca5Xqu/ZDiabDuIvhkRniXbbh9q8Hk+IoDm6OcX+N1Pl3pJRTz7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=tXnaH/JshpW/6YIeMlZbUvI/S1bk78ZiITOc1/O8J70/ZGRF5bFrCrqqtoodeGbYKW+hnTjhBIle6I1sPH80Ctx12qnUd8yhwESf449BiZ6It1lep4JBMhHPqRwr0ASd4VtLCBsPPWtTuB/XyNRCfh7zUIKD3yfWf0D5wzRHcil/3RTYm2Sl9mvQ0PK47GpdZDICFDAUzlxxfdqT9tQUzFRrYo5AtIQzMsVFzb/tO5ZWCv5FxNz6bpvN4GUKvUeRJkuTAOLxbaooduh4iEzc5VnPR9HQ0LXFLOoXAuFbgAB6UnItf3q6tlj1gADVHx6jPBsBmakC+KPABqoIgm287w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Eoh+4uGvmgy8IGdSUKxLNaKHqYPdP9URzrLzCZ2u8=;
 b=VjHM9EifHfqy/Jb7CMlo8QmTzuxtKGe9TrG7WPLuyv+p8Eou1x2ddWxo9ezBeeybssN/aMW7C1Y7EKA738HQLCNFk1LxJOBRNHeymQvlE/AmpP9rc2k+dUR8xNZjYYN0VLeDx9w1lG94D3KTvIhFEkRmnnHSmt0IMKIVN8/QmrM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11012.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:13:59 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:13:59 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] drm/panthor: Add support for Mali-Gx20 and Mali-Gx25
 GPUs
Date: Mon, 21 Jul 2025 12:13:44 +0100
Message-ID: <20250721111344.1610250-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721111344.1610250-1-karunika.choo@arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0042.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11012:EE_|DU6PEPF0000B622:EE_|AS8PR08MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be8487d-9999-435f-c60c-08ddc847c471
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?TRVqscL1qid5pYwWMxcPWJ+rCKRzigWhlIH2Epp8yj6HbTu/5cddicTXIPEn?=
 =?us-ascii?Q?8k0/KGX30t2XxNY9iyF/x/GLHTdGNXBCFd60Cb9KztTAQfUG9OsyjHDx2jeF?=
 =?us-ascii?Q?IdZ6VGvILKIWt+b+XWpB3qFtkJWtyd+WCCmu1fIBQT2DVGFlE6XfFSAdU3EE?=
 =?us-ascii?Q?Ktcs/j0eZ1hgYXrUZH4lKFhDEOTqvrdUIdzx6QQpdqMuK1zHkD8z+O7VbvA/?=
 =?us-ascii?Q?r0qR/1kr2/jC7LmBPTyoXPHbx7qjELH4I3X4CYihxPUyMSh+eIKO5gFZblyp?=
 =?us-ascii?Q?OMDd8ZRAYdl0OXj76caZWcsGFAiMTXlgt0YM4tvMcmHAmcaja64Gb01/7YxY?=
 =?us-ascii?Q?lUs1YPyMTTZjYD2XBhqZ2b0FXBaT8ZDy8Wm/MIk9oa2lkDg1QJd7uOCBQxJE?=
 =?us-ascii?Q?ve+JeafZd1T7zjFNCyWcFglkWUP3GF+/oSf+/erdOz2QX7OhKc4zNo+f3gRw?=
 =?us-ascii?Q?F+Ovqe6odYWUxPZDkWLu3VXHCIbgB88Q4R2f3lTxYa0R+S0DcNj9f0uafHwN?=
 =?us-ascii?Q?tIwaWOSPHMLQin/4SK1ZA4t7S4wRZ7SfQWMGdFOTt+hS6Xkj4g/PyOanNlLF?=
 =?us-ascii?Q?40FKgsHWbO7T9tffLNDabtRhbrYAkD2oVZAs71GgHwfAPkzZOH5AETb03ruT?=
 =?us-ascii?Q?x3eaEw6XNyMTEIMLa6IggbHy1RflUSzOJ+gH1KdyuC2y7hEvv1Ia6St+p7yP?=
 =?us-ascii?Q?5fS4ynldnf2MhRYqWxRTDkLFyOyiUegrCZbyPly1LaWPTRbFsqjxGn/fZDio?=
 =?us-ascii?Q?WQUrMIVcYG7T0cao2hyjPZpUegBaNZJtB7qX2YL9zB710llpCmdW7KXCWdNa?=
 =?us-ascii?Q?3QqcxLcO3x64eCMvRrfdc4LVvwQSkJp+6wISb6aIM5ofOcNSciepU+BJD79x?=
 =?us-ascii?Q?9bnRMdya6y7dlzQ2TamtwRacOEVwP9yc34LEhbGaDt2/KI2wVYgE9rbwwnig?=
 =?us-ascii?Q?xALj+mwVA8NwGb6/N+tmoB5iraap0MAaJeuPO66uqRq81VYVqVKGECTziler?=
 =?us-ascii?Q?vcMrEeO+PlmsHM3A1tU1XaBsPxDgYNNsoJHpa/MYVX4z9niXJLRDR/f05t8m?=
 =?us-ascii?Q?wDvGg9hyRTOqgjvHMa+W++3gd2og4cq15NIr3MYUq58hshjM95PcCatn4A0f?=
 =?us-ascii?Q?Nru9o/8OHwgrVI5rVd6841xtdUptesULmI8zKfO9g+7g3uzfI63obsvIreLC?=
 =?us-ascii?Q?/DkgQpCrvL3Qm8pzX4Vt82jC0U4pY2sZsJv2R/HxAGhyE0Xi1VLkE07sSY9l?=
 =?us-ascii?Q?iTDQ1KMJpcoKKjN4bQB0J+UUcU0pYRS3xsCtLBMsxt+xQpqGKrqe/MsTBm75?=
 =?us-ascii?Q?jyvi2XFxZ42JHNaFJzWtzDLSUFgirtyKlGGinD85iCDUdAYsPGhqifsCp7RV?=
 =?us-ascii?Q?uLvovZsg88Q+aPTlvb8GvADjaiTuGBdzT+k3+l36TNykNXPjYQLd/8mqarhr?=
 =?us-ascii?Q?IUShRiNi1e0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7f8f14d3-6d51-448e-c5ff-08ddc847b116
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|14060799003|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ffy9FV/YaOuIrvvWLVRQfUYvpCqhmPzMJ4tR2pNrO3jHPiorYSic+sPorpF?=
 =?us-ascii?Q?ONknGyEWHGUVRpQhp7uMPF6m6YK69mqOJeCmHnlfNcm95ti33C2FXoCZqzT/?=
 =?us-ascii?Q?pGZpgFHkyQJ3FcFHiCs9Dx4v080EVSF1ZHYnaHyZk63KgtG+t2LAfAAUTfnY?=
 =?us-ascii?Q?rYnjb1Tuy8//3S3OmZ1l7hnCiiPi59qzGSkjdGGJhH6Cvp1yzkR6pQgOoY0V?=
 =?us-ascii?Q?IXxOOjdSj5HUk+K4+9oWAhzyMVGY6SQXjYIIieg0Lqzjob9jfxz9y4v0bGmQ?=
 =?us-ascii?Q?utXlnC4wS/AXKjyTaJHbZas66yS7D6Tn/PqyFHpXFkoX5LTrO2TWxZAer8Eo?=
 =?us-ascii?Q?mSxMSb3EfxzerLdE+iDRAOCGBZtxBury03R0f1PBpzwMhleNEHGwzsX/txYt?=
 =?us-ascii?Q?vjT83LqJe1aLmekuotrsURqNmrwa+/hTLJgVmsK5dR2wkINWgwwicBOq28+M?=
 =?us-ascii?Q?FSeuiJVIaYCZJohnMpHI9zuuEdBB16tMXPz6ZjGNyCUdqnQ+1bGRrYOmsEQa?=
 =?us-ascii?Q?ko8HgYxS8cUop6tBcOVoPTjc89SYJJr40uAX3suclMrxZ9dsXt9SyCyfRiYz?=
 =?us-ascii?Q?zkxOWRIe6aW/i1zMENorDA0zNaiWqoUtxvQ01n17TiEpmIfNPTiwwbXCGESh?=
 =?us-ascii?Q?Z7pKgSiWADQVG91WNdTXkQWMb/sOIpO5crF89xYBFyME1kZkuDAN2SjH+gLS?=
 =?us-ascii?Q?h0BENRRJxpgInB8Q8fBsKzwvkOnc+5YZaXcuTz1Qi4e6k7fNQcYE7PVEoQPW?=
 =?us-ascii?Q?VcjGcoOoCXVWITvXgS6DVtYzKbyhUbRMtME+ZZDlKGlgzsNhA95yLm3QJsUs?=
 =?us-ascii?Q?QU3m1c3lAwEbxpvgKO6w/VoqZ5dxkgqw/fKy/l2bypv0b5O6nV8O/AA/nCam?=
 =?us-ascii?Q?oABFmG5LKGPZjKHGxgqIeIdgHnnWmBzE1Ix1Tg09ds6hogOx3I1UpOskpOG4?=
 =?us-ascii?Q?+JErYmchZRT0r1/nsAomu86Ayh7GuLk8WuHDQPwrTodQfznMp34PGNx/e4fp?=
 =?us-ascii?Q?YQOYf0cyNDk5Q5vH+QsDPlSp5DQ9QpletCrDzXVT2U8+XN+Tb3msQz88FCdQ?=
 =?us-ascii?Q?A+VT6gGUGe+S78CqajF6i+RiriDUtbSbcUDEiTBx6Es/IRerCzgciKS0bqVh?=
 =?us-ascii?Q?dqpYQS9JCSzXe0BtOeTCaCYo5jMuIDxu/uuG9ge0MwNLsHh/4K9dDl8Tx26G?=
 =?us-ascii?Q?wzNAk+Qqn9ogRY1Bgrt6GUDEsWYV0S1YEWFZs01BaEgsTlkdMpgG/OPpA5ZJ?=
 =?us-ascii?Q?q8q8ahMhbE+GN/SAijSaZe12OGsGm8DBMf8UGivonvYzk9AYUIqzlJriNdaj?=
 =?us-ascii?Q?G+xJn7qMcf5v9B6G0dAIBQds5Fgq2QKEUuTL0kYWMd/tBZ8FFz/vHynM6snW?=
 =?us-ascii?Q?ax1pXdYWUuFkRv6ZDbxQ7QM77lOaH0EqJzbtIaq7Wgm+qAngxSoaKz8HHjKE?=
 =?us-ascii?Q?uPVY+/ZXVw+IbToKw7F2GuGfipyamlgsC73o5TWDfqZyjWttpC5JYzZBMqJq?=
 =?us-ascii?Q?L1eQUbsWQzKBj70A+kPLzHt4FHEkl3VyIvjz?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(14060799003)(36860700013)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:14:31.9394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be8487d-9999-435f-c60c-08ddc847c471
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6648
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

