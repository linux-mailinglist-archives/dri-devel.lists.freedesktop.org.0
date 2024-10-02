Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF7098EA69
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F2510E7AD;
	Thu,  3 Oct 2024 07:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="mi8MhQND";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mi8MhQND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F4C10E6F7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 11:19:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZBnmIsSF2bi/94bbmkSq3O8PjKC1mcw0dEUiuMNWLEKCAZ6oIN+uWeYRaybHR0gNKb+VOQhpMlZFV9fAUwD/W+4MIYXpEgX2q76oOmYBN1ZHUhObLCeT7YE0yFDWudv1roeSSmkthmWQ8DHOByRmOp7C5Jxbu5V5UQtJC0FKePONOCcZw0/DOX4AwQHSDjWsyaHzgCk/QCP0AlyUbdea7+0pmptaINFqwXSQPB+QwOqrtcCHryIP2/IwG8IOk1Y8mMY90L0QgV9rLDWWSHUO2IMBdfJnaUJBDNgqymySYRsyWm0LxvAb9s1HjYGaX9bgds7BS3U/YilbAX/l8HxbfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjX6eACtDB9jEh5LKFdTlzl14TgfB3GajBKZTIBj+rE=;
 b=rVkh+28Mxj756qkrKG0OAyrZ4E/Hqvnlttj7VwGt/k6vtq05Ue3kouNg6RCgg9mSnNger/bqhaZnBYIPDhoZRWSWZWniLVoSE3MuEZL/smhcPydH6uL+BfSO3u/VefzrUg8dZtt0LDF+/8sH4GMR8tD96LW+lIumPUPkeMHwWlhB/E7cTN1OYe8nBt3DSH+t6ABxp4sLqpsvlFI/7CK9GN5llc9B94ULiF6PWNRJEuw62oq6kZoQXEft8J+9IN45XdQ/q4VAsx/KTBEnDXZ1KVI8aErdCgha1RvC+VJKU2VQiVSYf+dv6vVtxvB38RwZAjMnNTClsC6UrvA3PtfpDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjX6eACtDB9jEh5LKFdTlzl14TgfB3GajBKZTIBj+rE=;
 b=mi8MhQND5Eax03CZYOko+P4+5HbNi9J4YHbeSOAv8kn8/2pgSeq96XzoiEot995VyqVUp7p7LDjDlr7IsJas65QowZwxZw+IgVnZbj06n49Xd9JaiczdYVTWCFh7gu+zCNJUejH6HEqTCmrP7TfAAd1Mh8fElA5NS69ZrONpMyE=
Received: from AS9PR0301CA0044.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::16) by DB9PR08MB8674.eurprd08.prod.outlook.com
 (2603:10a6:10:3d2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Wed, 2 Oct
 2024 11:19:22 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:469:cafe::26) by AS9PR0301CA0044.outlook.office365.com
 (2603:10a6:20b:469::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Wed, 2 Oct 2024 11:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8026.11
 via Frontend Transport; Wed, 2 Oct 2024 11:19:21 +0000
Received: ("Tessian outbound 5b65fbeb7e07:v473");
 Wed, 02 Oct 2024 11:19:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e7239d62ac4fddf
X-TessianGatewayMetadata: vJr3rLWxMpPPyQjTeUESdiq/0x13L0cGmozwRiTMxlrfwgAdWjgHZFkvbY0McRdAWMhGz/nXhQBB0udgU+IyOPm7XiuLq+a1Pw8mfhHZA0mpoc5NQIvBS+ab9a8QtzdWAA9kriXpj2deXqKBmG/KjECLaR4HjQaDvetlm2tRsOwXd5JZXptaoAXP0R8SR0eH
X-CR-MTA-TID: 64aa7808
Received: from L329dbce2c226.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA42DAC1-828D-4A99-981D-E9CC06C39602.1; 
 Wed, 02 Oct 2024 11:19:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L329dbce2c226.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Oct 2024 11:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+dy03h5b5AIgdv8kFouKFgG4fQ93H6rDxFT5qPJ31w9/75mY9mMVDVMF+HsH7jm3nhi7b6+y2lsMHN0EEymg4k42bPHiP+r0kJGiGa8o7Xm0+zP0KwxB8CgXvYYYKi0zuivNxcYMadPA9pVQTnxE+02ariiyWewvVEoaOB9qmrnLFJMvA/a2M0XeGA3yYGWEWftq7r5gXUApGERDYbeYga/L0agmnZd3YeBB/4y29ydy7WAbfbYB3750jJxoF0CffsQFH3hFN4kpoM9wOxozFr0anpOrfJ9S7WMGYo4xrqx8Zs7T8fvjzp/2UlkdsbziZPSdH6wxJ755MiujLDG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjX6eACtDB9jEh5LKFdTlzl14TgfB3GajBKZTIBj+rE=;
 b=iY/vPy+apJw30P4+YcMub8UpWccvAACV9zuHzs90VQBHQxOtMYQLqj+URNZ3PoIYaMHbtxA8N9PhK8jneBAfve8XoXIS8FlajFg9LmcKv4uoWFNhZtER0/jxcQUrZwmqgNA3SNG5hgrZKPcHvqB003lUKQXd0o30x4XXBwM+j7/VX2YgQMg5wgOgIPT4e0bAZvYHwv+cn7WF+y//Bhwl4b5csnwauD3Vamcqv1UEqM7i7Vif1Fku2u4LRsil0PbPrQpBsl49hM+YMY+W9we+WTFL5q0veRSDnwxiOuUMafkdTeHWW9yFDUatSnnixcvciUuu1gCT0d5rxeDFhTiMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjX6eACtDB9jEh5LKFdTlzl14TgfB3GajBKZTIBj+rE=;
 b=mi8MhQND5Eax03CZYOko+P4+5HbNi9J4YHbeSOAv8kn8/2pgSeq96XzoiEot995VyqVUp7p7LDjDlr7IsJas65QowZwxZw+IgVnZbj06n49Xd9JaiczdYVTWCFh7gu+zCNJUejH6HEqTCmrP7TfAAd1Mh8fElA5NS69ZrONpMyE=
Received: from AS9PR06CA0278.eurprd06.prod.outlook.com (2603:10a6:20b:45a::18)
 by DBBPR08MB6172.eurprd08.prod.outlook.com (2603:10a6:10:1f4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 11:19:11 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:45a:cafe::f0) by AS9PR06CA0278.outlook.office365.com
 (2603:10a6:20b:45a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Wed, 2 Oct 2024 11:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Wed, 2 Oct 2024 11:19:11 +0000
Received: from AZ-NEU-EXJ01.Arm.com (10.240.25.132) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Oct
 2024 11:19:10 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EXJ01.Arm.com
 (10.240.25.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Oct
 2024 11:19:08 +0000
Received: from e124178.cambridge.arm.com (10.2.10.35) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Oct 2024 11:19:08 +0000
From: Iason Paraskevopoulos <iason.paraskevopoulos@arm.com>
To: <dri-devel@lists.freedesktop.org>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <liviu.dudau@arm.com>, <brian.starkey@arm.com>, <rosen.zhelev@arm.com>,
 <nd@arm.com>, Iason Paraskevopoulos <iason.paraskevopoulos@arm.com>
Subject: [PATCH libdrm] drm/fourcc: extend 12 and 14 bit YUV formats
Date: Wed, 2 Oct 2024 12:17:14 +0100
Message-ID: <20241002111714.739929-1-iason.paraskevopoulos@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|DBBPR08MB6172:EE_|AMS1EPF00000046:EE_|DB9PR08MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec0d400-6b19-43b5-f77a-08dce2d4105c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?j1zzVeC1eh4pHAzIC9RMX+dTqZPL6vvCHpJ5LWzFkYg4/bVegGpQKxHM5oeV?=
 =?us-ascii?Q?jFJb1W10NWoFNXJ2oxJrwqECztrbhCAznPHuli37C6GsxMaDQyrRh2iGZzQm?=
 =?us-ascii?Q?wKGdOK0UdbANLrkTmfJTOYFqtGTEJrG4TtmT3J6qD1wEwpXS5BO5RpfSuZe8?=
 =?us-ascii?Q?N3HM1qocHLfhSnUiSeXVDjRsgHhmuMja0MSv4PDAEuQt6z1/Klyp6L9UuP04?=
 =?us-ascii?Q?Jffre70uGsKatUnUw/SbXhUHHwWrlktS4djZCEvBp17FoJCp0tLOBmOtVPS4?=
 =?us-ascii?Q?XrPUJAnJ/vj9fnoLtMOh7xeimbb0HSQmGinzidMosv3HjZFtf/6UKnNTFEpn?=
 =?us-ascii?Q?WvyFunEiTLVkeUgpX04IzQ4ZQeNcGpjF6QO26A2wbF829VD3MESAcOUizqXi?=
 =?us-ascii?Q?pvLzDLjGSS8lhCU68hsx7AZykS25auLbKztWF/g9rpAEAJT0qri+44778ZjW?=
 =?us-ascii?Q?psLDP9bYMJvkyfUtVt4xumxsfLxRl9Op5MChcfiVClDbXb397mes5N07KmcH?=
 =?us-ascii?Q?EomiKljoocoHm+9busfkMcAhBClJJhxvbX4vg01oELd+ku6xDWoLSEgsfBkN?=
 =?us-ascii?Q?GG+yHLbZ05qtHFpe4v3PvKfq2oNskuNabOm1HIPuECa8OyX0cKgWEM9dG9WM?=
 =?us-ascii?Q?BSSYBq17Eha//tym1N5PXJ7IRqaGPd0M9LZqtaOosDQIJVzgYse5dvp8Vq93?=
 =?us-ascii?Q?36HRsxSWR+wmnh3aszU1xHisJ7QDC1nlt1rym23rl0GZKGQ7KfD2kZ6W+7vZ?=
 =?us-ascii?Q?vsCuFeO6wUbo6tmV/6/8gEvRv691g2QWdu97VaRKZI52thDri38LxMefDhsw?=
 =?us-ascii?Q?skSWntpyvF1tygLmoHXK5qhwfQGczKbEXZc0MRxqru4dk624jz/GqbuM8B/z?=
 =?us-ascii?Q?R4edMC6OMMXT7oMFbbVP8Kb6BADUUX/BelKPBTgGiefnbhPHkJq+cXaUfRMc?=
 =?us-ascii?Q?2j+DJdhUEKDId3d9MXO7X7lPXjhwW9rwJYkUPbkXl+J422tVfpkKcv2PMjfM?=
 =?us-ascii?Q?T7wv9M4vAOI+xZR5A5Yt7sDVqTi4y8b3jpEagu9TJK643/bhfgcYOMQyJ5aH?=
 =?us-ascii?Q?8UlDixz/WDv+KUHHSaPNx5Usn8jLTYSCDkc2mAa34AhuLtOEheLP+MvnEkUo?=
 =?us-ascii?Q?HIXu+aASXiPFa5fq9RqXcdwLZyEDRXD6Wt1Qx0uKPbhwQfEG3+Vm57BM5NuT?=
 =?us-ascii?Q?+RDqnt0iupfIg111NiaDfb+wl1sbc53EVBkbkJzz1wDUvVGZ0oFdgY0ksm3l?=
 =?us-ascii?Q?Lepkual7WPiT75UQbmexxNb89uZ3nEgYvM049wVShVHX4yXfGkz+7r2SIJ44?=
 =?us-ascii?Q?nLQkfDsTmHlYckChHUHHRaOwvKwjipeEuJmdwXdJBQ5ux06lmZiuuVi5b0fc?=
 =?us-ascii?Q?ox0RnPIx9TmSVqOkr2Bv1nuSTrga?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6172
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:45a::18];
 domain=AS9PR06CA0278.eurprd06.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3b6476fa-6c7c-4a4e-f0b5-08dce2d40a3b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D/KhODKr3VuSE2WGvjNmy37mAQjOFSRP7blvkajYUeW+9HXBoePIgpeIjUny?=
 =?us-ascii?Q?zW1rkhwduQbys8T4nYYxkRIStxVfocUUx1mQA1jGhS3t44fRRFamHgdim9mt?=
 =?us-ascii?Q?CPm1kHgM2su/rrANvcjqc6FnUW4dg2AJ18IhBITTCWf3HRcCcGs4SyShxfn3?=
 =?us-ascii?Q?A01Gg/V096BtF3x1x9zi4Nv/LXXye+sgwNP4IgPZ8NW6mMYUN1XH0LBmEW07?=
 =?us-ascii?Q?vm6PyftH5PhadUoY9WnFIwTvnAMT7qu/RemQS/wH/9fPsx4tZWtNMuepU+Wz?=
 =?us-ascii?Q?H/C3CsbO6QQpLeJWkpglczZ7xxRQ0rciffGk1Rlev3smbACEMbX4pl/x0sye?=
 =?us-ascii?Q?YsX7JGib5RJ14aYa9P+FPhg2g8NbmPNw+rmebv7Bmg1GjaCHtVu2IkdYcIa6?=
 =?us-ascii?Q?xzXw1doxMs3Y499zL75GJS39D1ALKmzfObinrYX8MKjwQdh8idj6jFkCZFxy?=
 =?us-ascii?Q?uMNKBfb130Wl0ao0VLruUkXWxnxzNmBoS+Hc6IGccZ5L0Ti5DhYsKD6kZWTJ?=
 =?us-ascii?Q?r1ovZCB5lGUxXo+zDqslVDJgPKsAZZNrbf+C21ptHMpirYMEqCM3bIaO+xHo?=
 =?us-ascii?Q?qfSgdjKZlPyK8g002YOptASgn1Kujj4fKttQNMK+Ybk72GLnqdCfivnumAby?=
 =?us-ascii?Q?/KY2bXfoCctNUrM4bDwsGfU9roxbmqGyibLQl5XzllRNaMpdpXKaUYdusjwr?=
 =?us-ascii?Q?y6N0p/WvjiFWu4DOk3Ls6owQ8s0Il3AEEs+wgAR361/ah79QNONVsni+tW7t?=
 =?us-ascii?Q?t2nlqOqpE3L0pYhGGvcbBias6BcRC4X86YMAcZh/vYbOPYvG3jnrHUN1ZYbj?=
 =?us-ascii?Q?NAZ/HKtehQt49ZcRjS7lNCLT1AOhdfcU7Ge7Z0rUYfBRkKjDNEoibYd60eeD?=
 =?us-ascii?Q?BMRm1EnNYJ6rFR+R3CxyDvA9Lz1EuB4hjU4CpeoByvn+PcF/mWlIxoX+XBfa?=
 =?us-ascii?Q?CANWt9vx8hs2wdCvSVF9KF43xUpkO4FY5SW58jbw1LgLIoB7W1pXtXv01mHI?=
 =?us-ascii?Q?U2TH7o1OAfleYHkH+pyqqcKKe6cGNUCZ9nC8hoqBqHmkIdHbpGFQXKl6P+fP?=
 =?us-ascii?Q?tgWOqcRbVeFm7eUCR+JFo38gdOTfNwoY+KB6Xg0yG/FUZ93IrDSNu99Jaasu?=
 =?us-ascii?Q?hbF0q44ToeS2eoN3DEA5dSnJJCrL5eaydGY0M/U/zv4a4BIIFMBoInNLYfzk?=
 =?us-ascii?Q?7JfJ01h9kl74lQ1RMH9f5bN9sO9KRwBliPLim8t+oyxe7K8pbDZt+7wv/mvE?=
 =?us-ascii?Q?wXN/BDjbQnZk0/4Rt3gSCwyL2rFkCLiNLugH27+ddUyvoa/T/xUCCULO3EVo?=
 =?us-ascii?Q?MWirRe8ReFaZ4sq0as9HOH+ZIFykEXsXQJ7YIdCm1aoDR+SbUVWCRT7IN7n1?=
 =?us-ascii?Q?LrlYwslg2kHT+CAgOAPhSpszFCPl?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(82310400026)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 11:19:21.4771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec0d400-6b19-43b5-f77a-08dce2d4105c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8674
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

Extends the 12 and 14 bit YUV formats with:
    - P014: two plane 4:2:0 YUV with 14bits per channel.
    - P212: two plane 4:2:2 YUV with 12bits per channel.
    - P214: two plane 4:2:2 YUV with 14bits per channel.

Signed-off-by: Iason Paraskevopoulos <iason.paraskevopoulos@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 13 ++++++++++++-
 include/uapi/drm/drm_fourcc.h | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 193cf8ed7912..76a9733fc24a 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -278,7 +278,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
 		{ .format = DRM_FORMAT_P012,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 2, 4, 0 }, .block_w = { 1, 1, 0 }, .block_h = { 1, 1, 0 },
-		   .hsub = 2, .vsub = 2, .is_yuv = true},
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_P014,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 2, 4, 0 }, .block_w = { 1, 1, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
 		{ .format = DRM_FORMAT_P016,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 2, 4, 0 }, .block_w = { 1, 1, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
@@ -286,6 +289,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 2, .char_per_block = { 2, 4, 0 },
 		  .block_w = { 1, 1, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
 		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_P212,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 2, 4, 0 },
+		  .block_w = { 1, 1, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_P214,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 2, 4, 0 },
+		  .block_w = { 1, 1, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_VUY101010,	.depth = 0,
 		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 1, .vsub = 1,
 		  .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 78abd819fd62..aa7b4cd0a116 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -333,6 +333,20 @@ extern "C" {
  */
 #define DRM_FORMAT_P210		fourcc_code('P', '2', '1', '0') /* 2x1 subsampled Cr:Cb plane, 10 bit per channel */
 
+/*
+ * 2 plane YCbCr MSB aligned
+ * index 0 = Y plane, [15:0] Y:x [12:4] little endian
+ * index 1 = Cr:Cb plane, [31:0] Cr:x:Cb:x [12:4:12:4] little endian
+ */
+#define DRM_FORMAT_P212		fourcc_code('P', '2', '1', '2') /* 2x1 subsampled Cr:Cb plane 12 bits per channel */
+
+/*
+ * 2 plane YCbCr MSB aligned
+ * index 0 = Y plane, [15:0] Y:x [14:2] little endian
+ * index 1 = Cr:Cb plane, [31:0] Cr:x:Cb:x [14:2:14:2] little endian
+ */
+#define DRM_FORMAT_P214		fourcc_code('P', '2', '1', '4') /* 2x1 subsampled Cr:Cb plane 14 bits per channel */
+
 /*
  * 2 plane YCbCr MSB aligned
  * index 0 = Y plane, [15:0] Y:x [10:6] little endian
@@ -347,6 +361,13 @@ extern "C" {
  */
 #define DRM_FORMAT_P012		fourcc_code('P', '0', '1', '2') /* 2x2 subsampled Cr:Cb plane 12 bits per channel */
 
+/*
+ * 2 plane YCbCr MSB aligned
+ * index 0 = Y plane, [15:0] Y:x [14:2] little endian
+ * index 1 = Cr:Cb plane, [31:0] Cr:x:Cb:x [14:2:14:2] little endian
+ */
+#define DRM_FORMAT_P014		fourcc_code('P', '0', '1', '4') /* 2x2 subsampled Cr:Cb plane 14 bits per channel */
+
 /*
  * 2 plane YCbCr MSB aligned
  * index 0 = Y plane, [15:0] Y little endian
-- 
2.25.1

