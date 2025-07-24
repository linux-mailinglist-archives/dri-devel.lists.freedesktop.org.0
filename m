Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72993B10A76
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B322C10E00E;
	Thu, 24 Jul 2025 12:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="jamoin+d";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jamoin+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04AF10E00E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:43:01 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HrffwUUMDz2CWtJY0w9lgxcDgY+VngiEh9rqQWE+JiXtjhAe7LoUEi7b7v/RmBu6x3Ex5PiEEjOqPyNoXVE4lSxgIKTDIHWQ9jQFAjCIWamgQP3n/oF/4TFnef2a2s4VG1b1GybEGwAUR8UWhWwI3ciOKEYqGI7E0mCE6g0losKdtJyVLx2ly/lwYa+vFZFTz5dzjZNO5f6zgmMWoSvNRv4ww+sB3qxQgmczbbixfLjorVgHAbIGtKzfbiOissMV3tEuyga+gG/U+jKyp+pyQlV0wR0/YjocOCXumWFFTTmmslmd/nyMgHB3YjfdbTGV3/snqVeUEwo/7RIZ1KjkjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIQLN08mZGtL5RCxR7PHJgvReQ69RlEcgAcwcs4lxao=;
 b=AuYkPb7Fzvac47FDzfiNLt4vRdL1C0iV6uUUst9VhZn36LiYmebq7KblJCc/vxKf4noxZy+BU89vI1+WY/iy3vhs4xN1SKZOjpkR86ZKBRGAXYAoOmOYWazNiQV0dENlZNrBUoyQhPr3B8bXxWwsiOF6X45tUgaOoMFE1lBgRCJlqwRsxQJn/b8GgI1iAdo6NcpuFeGZhaJVdjdoT5cBYmBFRc4w4/8Wgmnn0Edzwpv/Hp7knoLcWI3Min5z9mWeS+ZZm13wlO6Y6D9XyhNaVz5U4KUhWLgGMwKJ59tcIJwApg/FKfT6GJgjEUYnHbaQ3YtAo8ySKi+1m0m5kbmx5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIQLN08mZGtL5RCxR7PHJgvReQ69RlEcgAcwcs4lxao=;
 b=jamoin+dmiBCwKN1iLuJXMwCnpOweY9NQaOhttuNDQNLY6j/uv+m2qg52qreTE0JU3QXbkkRxwLLGl2Vqe4lxcKZkYhRFKWg05OFpzlzwtP2gg3T629nDxNW0Vr1QBe74kmz3wWgX9ORzNQ4j+WdB2HkIk5UrgvEeDkBTMcf664=
Received: from DB6PR0301CA0086.eurprd03.prod.outlook.com (2603:10a6:6:30::33)
 by DU4PR08MB11030.eurprd08.prod.outlook.com (2603:10a6:10:576::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 12:42:57 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::1f) by DB6PR0301CA0086.outlook.office365.com
 (2603:10a6:6:30::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 12:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 12:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qh940eT1GVTCkbjfWfhB9PFhyOPj8JdOOOAWf1z+wmn6OEQZbpSDMlXLoz79A7Ybyp6Erlx7CZri443HDkc7r0USfGQxhDAxDHDnpImAlSgam04vt1ZRYjCdadf8oFk6STBFJ0jc5TThF+z+KDT4/7oNLyvaLILdNTrEXyil5iypgs67UqGzZfnQev5dMJ44S4/d5YqmUZI4Xt5bXKy4sz5wluVzpNBDcMGCC9vioI9stgpkfLk6JM4agvUM0mowYzLOpWhH6wR2aA/l6DjrHSeyiWtsdBVTgCsutjYL0HRDtiw+Gx0OtywwkGemlD4TcrrPi627XfROE68qq52mTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIQLN08mZGtL5RCxR7PHJgvReQ69RlEcgAcwcs4lxao=;
 b=SN0L1aYKR0pMFP6dRujmVCihDF+bMWj8Rehs/VvLqheGBIOFCq8AW3vqG3QDiTkNB8UxRttYKAbGK9XNp4LnutxRI9+8vhE27dpDKp8ykhuf0zDZ/rB/zWBTqCeNRh619Af0AF2uMcpJOwZ1fRlnOQeTKSbbDwXbbM/raZuzukLvEVnVMaeSjkPOUR/huClKA6WIUAnDjVtrVgaXlp5xxDdzT77wd/G9vUjV3sx2iG+hP3fXWJ27ZYQzvauL9TV7XKaRHtl6V5Ki6mqhO3Kv5kL5BfJ2+PJNjnvlZ1g0fHv0s0lhWy4CkBgBp1WXKs2ivgwvbkN8HZIPxjistrZCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIQLN08mZGtL5RCxR7PHJgvReQ69RlEcgAcwcs4lxao=;
 b=jamoin+dmiBCwKN1iLuJXMwCnpOweY9NQaOhttuNDQNLY6j/uv+m2qg52qreTE0JU3QXbkkRxwLLGl2Vqe4lxcKZkYhRFKWg05OFpzlzwtP2gg3T629nDxNW0Vr1QBe74kmz3wWgX9ORzNQ4j+WdB2HkIk5UrgvEeDkBTMcf664=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by DU0PR08MB8496.eurprd08.prod.outlook.com
 (2603:10a6:10:403::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:42:24 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 12:42:22 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/6] Add support for new Mali GPUs
Date: Thu, 24 Jul 2025 13:42:04 +0100
Message-ID: <20250724124210.3675094-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0510.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::17) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|DU0PR08MB8496:EE_|DB5PEPF00014B99:EE_|DU4PR08MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4a0469-35e6-4fec-2fbd-08ddcaaf9db8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9iXJ93KY0kki2hVm7dzo54rRN1UzohF1s0RvhDbluZhDkn5RVUSJ0Czrc7Yp?=
 =?us-ascii?Q?fdKSIOMZopJiB4It4HC5VHWHK7f+xl3wZGbXNpe1ZMYJ38ZBllupfus6pxK5?=
 =?us-ascii?Q?GTubCjnUZVYn/wlckgNicLN27j83K8uQzY/IHmOw4yvP20kZEGvPbrJw+qGZ?=
 =?us-ascii?Q?5A7q5FRJdfYQVokMaSdSfXOXTC4ybuQlnOky3UHw5tBofJ9rhe/mVV13zUgk?=
 =?us-ascii?Q?L/nA/q6RRgQRA1hWgt+Ljdkm9CctXdWqkCFFHwHkU1ZH3Vy3T6MxBzavR33r?=
 =?us-ascii?Q?XrqiAGjZSf7KeN7UqXHI/cXyhekKl9S2VG6KCxcXAyrdIR1IRpt4f2JazwqY?=
 =?us-ascii?Q?06dQ9A2s8tfoo/IzeTcsdsF1RleGbG3hJ93K9x6dMZghMJrdsTjHcLdQzrBd?=
 =?us-ascii?Q?UGbbO60QodCJQikbXyg14Im7YZ4h3Y9064+U6YWSMB2HDzUYSP2Ew0SKbsau?=
 =?us-ascii?Q?Kg2mj/6ZHxsKAklT6iuXyBcVsll31D9MBZTD+mvnNhUNv9cEr+vA1hu+PXN3?=
 =?us-ascii?Q?diB6n12UrT/QGQQOscrp9f7gX/rwPYfYuAZotTsOPCGSfMs/oMz9xB7yjVnz?=
 =?us-ascii?Q?tvtDZPXl4VcPWAmZeqsr9pBR2mHlZ4bB3bu9JOQAzbA3MOkShbqAJKfffdGW?=
 =?us-ascii?Q?gOiFeSHZFl1rXbape/n+05pjPiESt+M2egppWM0K0wztzyyRHaEdpe5o62iG?=
 =?us-ascii?Q?kTFV4PFmaRg6MlWzvcyLt7Mx1BHQa6c80QrUN55gPst+qtxzZkzFigKhyHfU?=
 =?us-ascii?Q?gcuzSbfVXymTnHrbk9rIShNfOrrztvnKK3ROBTIKTnededfFTxe/ELGzqTBS?=
 =?us-ascii?Q?SYdj7xWRI/DLH5zw8OQ6O0V5RwBSz0EFE0DMJiuZc8x+U0JiDXulClS4rzg+?=
 =?us-ascii?Q?xAOJIxv4hjXp5gHtTEuAWqAmCZpEpU1UhcFIpD31TivmQvZ9Tkp2uAGt1PhI?=
 =?us-ascii?Q?gn72b1FBD6rY52QqlDzLHTumgjKNfENvMvbwK6ZoedIetQrYyOVQZEraCK9f?=
 =?us-ascii?Q?9BKt85ChKD7bshnE0+ysLCd7NQUtDHGvK2sUpGXWJMZwcygWCVa/ZgzamQKI?=
 =?us-ascii?Q?a6wT5znuZCz+QIz+nKVhm+dE5U81yFyvTqBD0r7rFbccTqtY8lajDPD6lDEi?=
 =?us-ascii?Q?xl0LiDyoDjOSBw2SD6ny7mM6SCiIqKS81M+1cX9Drr+JUgGYQctofJZttE2j?=
 =?us-ascii?Q?GzPp9MnmYbHR9auAfA1BUEolyhPb3mF3uT0qRSiYhKUw2Z5KUEvHJ+8FhrCs?=
 =?us-ascii?Q?bWoj8fYFhShj+GpbPkNodxYjy4hrh2VWjvwFq/VqUadIgQdYJ63UxHFNJddh?=
 =?us-ascii?Q?FBVxi04XUBk8f2coCsspmfRPC+sIxgZPMyZ8S07yRNnqZVCTCVywU88wDoy9?=
 =?us-ascii?Q?uzje1X1pTrqkhgcyXRuKnqrC9J+LHRmq/N2SRDU+zCztz/UFkb8ZQJEzr4HV?=
 =?us-ascii?Q?ZvobAxhTqiY=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a6c586ee-969e-496d-918a-08ddcaaf8916
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|1800799024|36860700013|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?17X6dSa6vwmmjFOkS3IBV372zojdZKfY0qmmpZTaK4ZoRavaHVA+J70+9EnQ?=
 =?us-ascii?Q?1bjCGbfzlJm/tISS2OX18tbCm3Ycx1rwqkXWOtHdZxyIk99eEyT/4pa3aRsd?=
 =?us-ascii?Q?9ZxkKGfuiM9A5JSisSgeFUjURzF7MQWNar70h4YeqfWBWFCY/KncvxuCawx+?=
 =?us-ascii?Q?QPLY0UP6P82PD95JGijgK72BmcbQ/Ct5wzcptvd9dUApTvbbX+NFc3+5I8Va?=
 =?us-ascii?Q?cEepN1jMRbRx20hSmXxBrBtaljW6GSbjzs93tc95l7VsT+kA0f3c4PSgE24l?=
 =?us-ascii?Q?WzxrEt9TKmy7aWqHmrZaHmu/pA6SZxXFLs2hfxTcU8NpZtk7ddIJe1gZaAYD?=
 =?us-ascii?Q?PMrtddkF7T3zdP+QvyqXv1Ev/MXfwn7EMYzq71T97iTr018gD8TaOryX1F7Y?=
 =?us-ascii?Q?/mkm2gNtU+baWbS5KQ5BZ26O+yBs1lMaG0ErASbhPT5AuvwevIybCYgAUk5O?=
 =?us-ascii?Q?meMXOPRNd+RY/CQNkBY4tBRcTM3IYQKn8UuP6SkZU1qlFPUGcik5hXUSoRPp?=
 =?us-ascii?Q?cLFo+W1ZEC7ydrbAlkAlAx6viUWTjY+q7vfx7ITtUZHm/pQgLySV2PSFK1+h?=
 =?us-ascii?Q?4T5hV55Dbi72gaYVox1q7KwxOtS2QfFR9kCeEs+mD8ib+8cYr1Ge39S09Wnm?=
 =?us-ascii?Q?1KdnZiVWD40uLeUkK+bQbf73ja6tf5JDysx7HY0FRvpWiow0UV2w/JJw5hyd?=
 =?us-ascii?Q?8E8YnHiGsqFx2uxVAdNaPnC/xlJhKj3+6opOG++CqMUyrRGjsdgBxHj0TUiC?=
 =?us-ascii?Q?KII6Kg/4J+EgMncMFdQ5ugo3lCFXCha5xPC7RjvfjYqQ79dkmuaS2ipKQFsV?=
 =?us-ascii?Q?B3eVPf2GsrkaC/XJAFdrG2CorKqWD0MX4nHLrSu9Bbmw5sUwheABgKC4Grt3?=
 =?us-ascii?Q?CKMgcvOmOyIeFn9wWqn4cvqkpXrdC0ElutQU0ggOVFJ6TcHzRIcClhp9C/tK?=
 =?us-ascii?Q?UUuGIxaIG33nuEWl3bs6FKJY/qjUQirbCembBY3XujV6js/XBoMHCAex+9Gq?=
 =?us-ascii?Q?lk3iFyFE6p4rnJbwlQZQtE6ul/jS1HT4HfH/0mGnKgwuxK2HzqviW/APjwcd?=
 =?us-ascii?Q?Y83FGAhE1gwivcDH/kUEXoYRBRjKdsL9/iTW3D7+LLzKP8Eil6lgcqM3J5r4?=
 =?us-ascii?Q?ueyirUfgPCVsvtBufnHOGc2Sc8B1pT1RXAmERT2jSCja7ioDNXpoWYdyps9w?=
 =?us-ascii?Q?OU8llo0Hw0r1rpdKeduXnF1NKEKORqddRuniByfDVLgE/4W8M94BfFm5Fac0?=
 =?us-ascii?Q?DuchZmzdqzfrrGv5LE0u5NnZj1W5Wk2BBFnVu7c1Cvjs3VlD0awtVZhqqJE5?=
 =?us-ascii?Q?seWPAs6Mu/Leg6wyExhUGn7Pv+l8k4h/qnPXkyhkCkTEqX2pKScgxJhAFBza?=
 =?us-ascii?Q?ycD/USHvkXhHJpUX82IbK6MIGQ/FfgNAMWyJb3Q8lAs1kreWP+RWyUa59qjR?=
 =?us-ascii?Q?XKnDAASs2Qjg4ttXrYPUcS6B1CjB5NAAX3Bjqoc6MU9MCrfEy+MX4aj0onXI?=
 =?us-ascii?Q?iyqGfeFSA0eflMxYJV/Jx/RjT4SHzRnJa/+46sJWNRizQ168k4tFeekjqA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(376014)(14060799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:42:56.9520 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4a0469-35e6-4fec-2fbd-08ddcaaf9db8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11030
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

This patch series introduces some minor refactoring to enable support
for new Mali GPUs.

Key changes:
- Addition of cache maintenance via the FLUSH_CACHES GPU command for all
  supported GPUs in place of FLUSH_MEM and FLUSH_PT MMU_AS commands.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Adds panthor_hw and refactors gpu_info initialization into
             it, laying the foundation for subsequent changes.
[PATCH 2]:   Simplifies the method of determining the GPU model name
             while making it more extensible.
[PATCH 3]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 4]:   Adds support for Mali-Gx15 GPUs.
[PATCH 5]:   Adds cache maintenance via FLUSH_CACHES GPU command due to
             the deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards. This feature is extended to all
             previous GPUs as this method of cache maintenance is
             already supported.
[PATCH 6]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs.

v8:
- Fixed missing new line at the end of panthor_hw.c
- Reordered Mali-Gx10 GPU names in arch_major, product_major order.
- Remove the coherency fix and SHAREABLE_CACHE feature from PATCH 6 to
  be upstreamed as a separate patch at a later time.
- Picked up R-bs from Steven.
- Reset R-bs for PATCH 6.
- link to v7: https://lore.kernel.org/all/20250724092600.3225493-1-karunika.choo@arm.com/
v7:
- Picked up R-bs from Chia-I Wu.
- Replaced GPU_COHERENCY_FEATURES register read with the value from
  gpu_info->coherency_features in PATCH 6.
- Link to v6: https://lore.kernel.org/all/20250721213528.2885035-1-karunika.choo@arm.com/
v6:
- Picked up R-bs from Liviu.
- Removed unused register definitions for PATCH 4 and 6.
- Link to v5: https://lore.kernel.org/all/20250721111344.1610250-1-karunika.choo@arm.com/
v5:
- Removed all of the GPU-specific initialization boilerplate as it was
  not being used.
- Merged [PATCH 1/7] and [PATCH 2/7] into one.
- Fixed issue with getting model name before the gpu_info struct is
  populated.
- Merged AMBA_FEATURES and AMBA_ENABLE into GPU_COHERENCY_FEATURES and
  GPU_COHERENCY_PROTOCOL registers respectively. Reworked the fields of
  GPU_COHERENCY_FEATURES and added SHAREABLE_CACHE support.
- Link to v4: https://lore.kernel.org/all/20250602143216.2621881-1-karunika.choo@arm.com/
v4:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v3:
- Kindly ignore this patch series as there were duplicate patches being
  included.
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Karunika Choo (6):
  drm/panthor: Add panthor_hw and move gpu_info initialization into it
  drm/panthor: Simplify getting the GPU model name
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-Gx15 family of GPUs
  drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
  drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -----------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 125 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  33 ++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |   3 +
 include/uapi/drm/panthor_drm.h           |   3 +
 9 files changed, 186 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.49.0

