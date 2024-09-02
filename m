Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A72969409
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 08:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288F310E37C;
	Tue,  3 Sep 2024 06:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="P4Xt4NVu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P4Xt4NVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1E110E31B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 14:29:33 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vVyGmElmdE2TZdIdLR54bAL4//gSYXQl2TGBJHgtEhGo2aWk7L2tW/aRKdRZcFBnTBzwn0534G1lClm061QpLYPivwPrciz422bEKuZMf1OtU0i2ZhLieWNBGHIJPiO7PjbX6Mh2K7fNTriszmu4bpDJ0KDNixHKqdXeslyg4cR/Dfr3UUmB6x8ARzFnzXky7wP1i/r+trFhjw3tTikRa2MsPTO2FKbrR+zZ2K/5TYvGHF2GMsyVdMUPkngyWij4Gi6f0N/x5cbexu43op2Vn10VzTqbDpHmfPSl9NcPLvmRoNO/us6k4ypVBt8RJVFpFQ3YRniYDuesbGxCxwduRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=mzbsQpZMLLxYHegsw6pkZN/xBl+ae+TYiElhVhNKeYXyfkJSWBfLR9Ps0iUydYdUmr2PMUdZa6PDGjkwrZkhrDtLLsd88VyMOb3bBPi0Y4zRTkajkJwWBumSBuhDsxoyLI9y/o+AOQMLFL2w8E0AKDCvzOOO5KiszzvKIvItd47KN7Qs3tgw0SSSLWGAoqfNKoN6PUYqoAhA4sBvZqI5Ba2i9td6q7YtWQHO/q/SboGynw0DSMYS9eYFozdIxOztyEeP+0Sj26/T4PHeEORHCqbqcAYL2ZKl1az61umgDn1KWGhXYIJVRtzJU3vW8Po1UYAtQPxZrH6pS8ayamXK8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=P4Xt4NVutTXy8HctqBNBweTWiG7woxUMShM31kkuTaeTLXUNyUtk7YjZb1z7omqEywVjbv1YlwnO02gWf3xUvR8RXigjrWFNxldw638lEdmwYjGJI1TLc2BlptMzVz7yB5ZNbQ+yBPZK20pSfVVTeKAwrrKmjJkhVBBrKehaejk=
Received: from DU6P191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::23)
 by AM8PR08MB5666.eurprd08.prod.outlook.com (2603:10a6:20b:1de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 14:29:27 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::6e) by DU6P191CA0036.outlook.office365.com
 (2603:10a6:10:53f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Mon, 2 Sep 2024 14:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 2 Sep 2024 14:29:26 +0000
Received: ("Tessian outbound 901f45c3f9e8:v403");
 Mon, 02 Sep 2024 14:29:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84335adf86dc4128
X-CR-MTA-TID: 64aa7808
Received: from Lea1b76cc5504.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6878B68A-5520-446D-AC34-B9B43DC54BC6.1; 
 Mon, 02 Sep 2024 14:29:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lea1b76cc5504.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Sep 2024 14:29:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1cAK05zpJGHpM6KbZhHXxkWIWxgby4Tim6Vh7pQvjG1ir6NdRnN8ltadl9sXtTUI41bL/VDBHjXzXtoZR9qLJSoH75gdnvc77+OgbT6C8PyI5jgEKmaNpPj+ihEFEQusitEmsa5m9S1pRl+75z4p8znVyRZ/nonqE+I4jjHbQTzFTvRXvEnQUMPuKL7HEb/9XpwPaGZu9vjjYDN8pK2sm5RN4AdGWhauWVjcz/Q/yTaYKTWYn86JPYX8vzqooX8KnO6WAYRtDi+Whl/cFM1cf4+Vdx9a3j6h2qHfXXKvt/eJUJMSAZCOXMrN+A9cEnwxOGEm+H/tw8fG3X+4Qcevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=ZDmJNrueBh6tP+6ztHTG+Wl7mRgTANHlCcbPkiV/XHXzmlEiFkyJC7b0PLjXaopeQkcs+HvEDHmFkhKgA6qc2UPOVzErJPLeBP9Kt0JDglq7NAoffyJxqg9jzqkntsMnmQzWgLWvOA15iNGBPoS0ipuwhr7tcLfUbjWtEu05kST4H+kE+J2cLruWmR+zDtfz4wugVx2HvpbizFmloT9a7fSH/hXjMGoifh4MtS2uVEQ8EHw18INrGzfrB7kyS/cUNH8INKsoT/ejiHAAGxlZ27ZlLD4/bJq2xxJBIDCugTSAKqfKHucU1c9ICAEAVx2DdlafzQ+1g1FSfo/QCA4XTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=P4Xt4NVutTXy8HctqBNBweTWiG7woxUMShM31kkuTaeTLXUNyUtk7YjZb1z7omqEywVjbv1YlwnO02gWf3xUvR8RXigjrWFNxldw638lEdmwYjGJI1TLc2BlptMzVz7yB5ZNbQ+yBPZK20pSfVVTeKAwrrKmjJkhVBBrKehaejk=
Received: from DB8PR06CA0036.eurprd06.prod.outlook.com (2603:10a6:10:100::49)
 by AM0PR08MB5410.eurprd08.prod.outlook.com (2603:10a6:208:182::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 14:29:17 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::17) by DB8PR06CA0036.outlook.office365.com
 (2603:10a6:10:100::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Mon, 2 Sep 2024 14:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 2 Sep 2024 14:29:17 +0000
Received: from AZ-NEU-EXJ01.Arm.com (10.240.25.132) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Sep
 2024 14:29:15 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EXJ01.Arm.com
 (10.240.25.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Sep
 2024 14:29:14 +0000
Received: from e122338.kfn.arm.com (10.50.2.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport;
 Mon, 2 Sep 2024 14:29:12 +0000
From: Yulia Garbovich <yulia.garbovich@arm.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <liviu.dudau@arm.com>, <rosen.zhelev@arm.com>, Yulia Garbovich
 <yulia.garbovich@arm.com>
Subject: [PATCH v2] drm: drm_fourcc: adding 10/12/14 bit formats
Date: Mon, 2 Sep 2024 17:29:10 +0300
Message-ID: <20240902142910.2716380-1-yulia.garbovich@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9E:EE_|AM0PR08MB5410:EE_|DU2PEPF00028D0E:EE_|AM8PR08MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 50012445-78fa-4d05-5dff-08dccb5ba5b5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?KeOJf5FBCJTFEJMh+7qKntCOxoqjkOAM+gLni0oI644oi5wY5OfrSSTKCWZh?=
 =?us-ascii?Q?7UJzvyDxWuYUBbUlpCg31fFZXLwCv2uWT84lOtLfu0LbkkbNXkpMwicVMrkT?=
 =?us-ascii?Q?AdmFR9AwfU9Ign0NShA6pYR3wO7Fo/d05thpACMsaAx6Pr0L86HfOT8vBo6r?=
 =?us-ascii?Q?iXm2EStmKJhDVWIWyx4mWfG0P9xEv0lbv0ls5hzl5e+g014acIFOIAgA9VW8?=
 =?us-ascii?Q?xTB55eJ1OHKGJaL79VY9oUXZb37EtNRDicGOkMaWWsP6oqKvIqJjJSSnE4S6?=
 =?us-ascii?Q?fkadHBz6lSB9wiaRcj63KQjuS7To+U4zh4RSol7nYA1k9cV7tDFM3G5LOLeM?=
 =?us-ascii?Q?INwTOUUV7Oxw3GsXB1klet50lBnZbgcgjeJ1FzrcBdVshA+adTf7TDUqOWbM?=
 =?us-ascii?Q?9w7YN2gb00zrjnMLGmtgERJBvZ3PUHBmaFZ4I+7rP8fY2gAX0kVL288xgvur?=
 =?us-ascii?Q?KsJS3U8WAVQql6e35rp0JE3EGAgNr+Rgva6Q9RVBvcgoAxYBT9FfO5EtolZk?=
 =?us-ascii?Q?k19/cycYY6bT9yibPNJogM1lOVwMxIseYKC0M6zFHuV2t3NsQ2jxIvhuvoSM?=
 =?us-ascii?Q?OHKJoNsheW/bQaG3A15fTmcPYDznwvBNAnF/DvYm2aItlYQMpLAY2ySb7Hdd?=
 =?us-ascii?Q?YsTQv4tXDW59xmCRZalzIDWwQpMGBIosVabMnjcXmOPXVOn6mlflUDGdw8Nz?=
 =?us-ascii?Q?IXcH1bdlgAldRdwJUk6i17hNz1R3kpFAHJMg3fdzwDAtNWANH1Q+HRQO0bWa?=
 =?us-ascii?Q?nzUddiGN04n+OzmD1psh1KSLbUQT3UqGTvnfJ+Gi1jkgabRRlIWo3Aqm9xjz?=
 =?us-ascii?Q?gxbAXsc9tk0giCxeV6nQiV5XDQ6GhCc4v4fqhgF5eVn24/9wnnJCY4/nSnoi?=
 =?us-ascii?Q?4JD+s4Mfi6yHNICL0h/txpy7y4EGw6LHg62lM6thinLxb4TXP5+Xrp+ni65R?=
 =?us-ascii?Q?0XB/nYk5Pa4qEGnBfcvfKs13QDAEsBKBJWJP3YmwmoKfms6B0KAZAlXHCL7g?=
 =?us-ascii?Q?t+bCTDFQudYvmy+m3XaXAl4uX7rzaT+sRwO0j0GjNNU2lgMyoOScydxYt8uh?=
 =?us-ascii?Q?0yCKVKsMTVktYuw9j4giLGLpy3ABq7EcOiE2vRsGom2EDAmGuaOr8UklTdNK?=
 =?us-ascii?Q?RaZfNc/cHnBxTYIIPkDfdPR71v5uI471j71Qk+kUs73vd84PPEO1HdorvjEM?=
 =?us-ascii?Q?TKwdUkQ9ql8ZOfwWnPDg4JCdPZQGwtMlX7az26M0UaQLEZTAzzRrg893I206?=
 =?us-ascii?Q?L2JOCVJkMKSxmpSGRLWY4b22nuWa9lreuUutQnxLN+MvclAYAaEOp4DsCrkK?=
 =?us-ascii?Q?mCKo3CykSiXDbzfiHPuqdNgcxwVYRmdf3RZEnC+wn4kmHYobyTKLLvIa9TJ6?=
 =?us-ascii?Q?Wix25ehxzS3OzCQH71Y+UM6lfM8gyLUJt+DyE+S57Onskl5WeT7LuIH8CLMz?=
 =?us-ascii?Q?LUk3rxke8fTcV9IbyzibHsdIMVudBnQo?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5410
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:100::49];
 domain=DB8PR06CA0036.eurprd06.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: db327067-e1fd-4dd5-1706-08dccb5ba03f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|35042699022|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l/HCTm61TycqeIdCapMogH6pCeFhCqyAJOB0l3GYRDgPoOlIZ6IpBTaaljeO?=
 =?us-ascii?Q?3i/8058rFzBY72dXads7ts2K+b3DxGNOAcKpeWatK8imEH3LswOKN6pbC6+/?=
 =?us-ascii?Q?uTGVePoh+Rc6gv30uE8GQgX4xoycAnpOgzbJ+Jbpm/tsqFFwfG7XdWwbUrJn?=
 =?us-ascii?Q?I0KImIfU1PL5A4ErUq88FsollJs0qnipt+i4dtdnPPWvVxzksinHiG8uu5zb?=
 =?us-ascii?Q?l5eFoVBHZ5+36yVP3YzvICUEYh3F1pJENTBA9ZuUYopMdouO6L1NYEDDOBP6?=
 =?us-ascii?Q?Dm8nU7DD+mQvvZWfpaHXUti9weMZtTj0/QRiCqwM11Lw9007AHFqTpo5iPxj?=
 =?us-ascii?Q?np5IKV/EFE/Vpfn1a6Z7IpFdWqLNbgTZFzcLJGIwnc9p1B4vpnfzj/Siq/if?=
 =?us-ascii?Q?Xfjja9R7wSYmjwkig6aw0ceFN0cVgidqF9rrWA9uKNlHC4T2fkV6qzyQNFca?=
 =?us-ascii?Q?DZ41q2Hh55hogpzRV6J6MdOaXY4bWvr48dcimptkLxw4rrSg+5nKKLzq60YW?=
 =?us-ascii?Q?n2AfUrLYonxHdIMj5Vq9AbSekX3hb0h2KhnSb9Mgi/fxAWOAeLizp+2/1qIV?=
 =?us-ascii?Q?HDA8W1l+7lsbqn+hivn6D3PTV6YT5UtxKRnLx8xFrHl1sbSx4GTXYlS+ZAhh?=
 =?us-ascii?Q?wEwgKZeuprn4FzqzbUx22ZpyJLxTHgqvMCWkZ+Z9+z9eAOd1GJnELSlABSvs?=
 =?us-ascii?Q?VxtIJlLqE+CkHRRgIZXnKkiTlsPRDuu56ZwuLtMVHCDbtjkr7LvVZAxzKDNo?=
 =?us-ascii?Q?31HQ1Cst5E3s2YF1LWl0xAxy4KNNMwB4Xax3tNU+ssFRADAbFaBu7GT/OnTu?=
 =?us-ascii?Q?37jZrQYExDeq03fJsqSj61aXUHGDj9rIuEJUFi/mIj2WfH+oCv/6KscJV+W/?=
 =?us-ascii?Q?mjrP5G3Z+HCTCsCy9O3/x2AllCe9DZpXZcmDogessBgspjq/ZXCKMJuapPoW?=
 =?us-ascii?Q?bd/pDU9qVLBHrHOq3KPgm1LizXWSThwr/om+xSbjKKtg/5In4Xrhf/kLrrSW?=
 =?us-ascii?Q?chhwhji5U/wXb3FSbukhP6LCb25WlQ3e5+UHaEBFaCuU6saT7pLw5sPlxZd3?=
 =?us-ascii?Q?j8w6r8bqysP4ksirsAl2yxUcN69FBLVlBCoFCsfgrX8gvnLM0YtUoIPwhs8n?=
 =?us-ascii?Q?EEuhxBy3MiLaCuBNOpUzFRt5QBDAmHmeesr2tk55gDGdKPRS+l8fS5CncBhA?=
 =?us-ascii?Q?ZeHvGHLEpCnAZKDwLPOUkZGur17IrCQzI4KIzQgSUlRA5+xhHKsx8qJuFt2D?=
 =?us-ascii?Q?U6t6a5fZkALc4lwrc2wFCkBvHeZQX+cCkwhy8MuiRPVzg7I7Sr9od69bfYYW?=
 =?us-ascii?Q?Vzv3JioInDhpjSuX6UPBNGixOLaRTJJrgyNRRC7nmD8Uc+SB9DlcF4xAN65A?=
 =?us-ascii?Q?SoaR2NGgx7ArXmDjpy61zfwU67UlOwqQ+odJuxmt6tZHMBr3v2kSVp6FF0jN?=
 =?us-ascii?Q?/YoxMXm9/yYLxBK+C5+YdmjKZp/NgUML?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 14:29:26.2200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50012445-78fa-4d05-5dff-08dccb5ba5b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5666
X-Mailman-Approved-At: Tue, 03 Sep 2024 06:45:28 +0000
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

Adding the following formats
     - DRM_FORMAT_RX106
     - DRM_FORMAT_GXRX106106
     - DRM_FORMAT_RX124
     - DRM_FORMAT_GXRX124124
     - DRM_FORMAT_AXBXGXRX124124124124
     - DRM_FORMAT_RX142
     - DRM_FORMAT_GXRX142142
     - DRM_FORMAT_AXBXGXRX142142142142

They are useful for communicating Bayer data between ISPs and GPU by emulating GL_R16UI and GL_RG16UI formats

Signed-off-by: Yulia Garbovich <yulia.garbovich@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c  |  8 +++++
 include/uapi/drm/drm_fourcc.h | 61 +++++++++++++++++++++++++++++++++--
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 193cf8ed7912..cd5f467edfeb 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -170,6 +170,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R10,		.depth = 10, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R12,		.depth = 12, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX106,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX124,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX142,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGB332,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGR233,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XRGB4444,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
@@ -200,6 +203,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XBGR8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGBX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGRX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX106106,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX124124,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX142142,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGB565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_BGR565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB2101010,	.depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
@@ -219,6 +225,8 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_AXBXGXRX106106106106, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_AXBXGXRX124124124124, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_AXBXGXRX142142142142, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XBGR16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_ARGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 84d502e42961..7248b96ecf7e 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -146,6 +146,24 @@ extern "C" {
 /* 12 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12 little endian */
 
+/*
+ * 1-component 16 bpp format that has a 10-bit R component in the top 10 bits of the word
+ * in bytes 0..1 with the bottom 6 bits of the word unused
+ */
+#define DRM_FORMAT_RX106	fourcc_code('R', '0', '1', '0') /* [15:0] R:x 10:6 little endian */
+
+/*
+ * 1-component 16 bpp format that has a 12-bit R component in the top 12 bits of the word
+ * in bytes 0..1 with the bottom 4 bits of the word unused
+ */
+#define DRM_FORMAT_RX124	fourcc_code('R', '0', '1', '2') /* [15:0] R:x 12:4 little endian */
+
+/*
+ * 1-component 16 bpp format that has a 14-bit R component in the top 14 bits of the word
+ * in bytes 0..1 with the bottom 2 bits of the word unused
+ */
+#define DRM_FORMAT_RX142	fourcc_code('R', '0', '1', '4') /* [15:0] R:x 14:2 little endian */
+
 /* 16 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R16		fourcc_code('R', '1', '6', ' ') /* [15:0] R little endian */
 
@@ -157,6 +175,27 @@ extern "C" {
 #define DRM_FORMAT_RG1616	fourcc_code('R', 'G', '3', '2') /* [31:0] R:G 16:16 little endian */
 #define DRM_FORMAT_GR1616	fourcc_code('G', 'R', '3', '2') /* [31:0] G:R 16:16 little endian */
 
+ /*
+ * 2-component  32bpp  format that has a 10-bit R component in the top 10 bits of the word
+ * in bytes 0..1, and a 10-bit G component in the top 10 bits of the word in bytes 2..3,
+ * with the bottom 6 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX106106	fourcc_code('G', 'R', '1', '0') /* [31:0] G:x:R:x 10:6:10:6 little endian */
+
+/*
+ * 2-component  32bpp  format that has a 12-bit R component in the top 12 bits of the word
+ * in bytes 0..1, and a 12-bit G component in the top 12 bits of the word in bytes 2..3,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX124124	fourcc_code('G', 'R', '1', '2') /* [31:0] G:x:R:x 12:4:12:4 little endian */
+
+/*
+ * 2-component  32bpp  format that has a 14-bit R component in the top 14 bits of the word
+ * in bytes 0..1, and a 14-bit G component in the top 14 bits of the word in bytes 2..3,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX142142	fourcc_code('G', 'R', '1', '4') /* [31:0] G:x:R:x 14:2:14:2 little endian */
+
 /* 8 bpp RGB */
 #define DRM_FORMAT_RGB332	fourcc_code('R', 'G', 'B', '8') /* [7:0] R:G:B 3:3:2 */
 #define DRM_FORMAT_BGR233	fourcc_code('B', 'G', 'R', '8') /* [7:0] B:G:R 2:3:3 */
@@ -229,11 +268,29 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
- * of unused padding per component:
+ * 4-component, 64bpp format that has a 10-bit R component in the top 10 bits of the word in bytes 0..1,
+ * a 10-bit G component in the top 10 bits of the word in bytes 2..3, a 10-bit B component in the top 10 bits of the word
+ * in bytes 4..5, and a 10-bit A component in the top 10 bits of the word in bytes 6..7,
+ * with the bottom 6 bits of each word unused.
  */
 #define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
 
+/*
+ * 4-component, 64bpp format that has a 12-bit R component in the top 12bits of the word in bytes 0..1,
+ * a 12-bit G component in the top 12 bits of the word in bytes 2..3, a 12-bit B component in the top 12 bits of the word
+ * in bytes 4..5, and a 12-bit A component in the top 12 bits of the word in bytes 6..7,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX124124124124	fourcc_code('A', 'B', '1', '2') /* [63:0] A:x:B:x:G:x:R:x 12:4:12:4:12:4:12:4 little endian */
+
+/*
+ * 4-component, 64bpp format that has a 14-bit R component in the top 14 bits of the word in bytes 0..1,
+ * a 14-bit G component in the top 14 bits of the word in bytes 2..3, a 14-bit B component in the top 14 bits of the word
+ * in bytes 4..5, and a 14-bit A component in the top 14 bits of the word in bytes 6..7,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX142142142142	fourcc_code('A', 'B', '1', '4') /* [63:0] A:x:B:x:G:x:R:x 14:2:14:2:14:2:14:2 little endian */
+
 /* packed YCbCr */
 #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
-- 
2.34.1

