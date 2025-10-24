Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A050C0808F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF2610EB3A;
	Fri, 24 Oct 2025 20:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="llJMY1F8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="llJMY1F8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DFA10E225
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:10 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QeAa93/MdJiJAfvznC0cJadZt8HtpAhmjjQlf2ksgH5RarlBaiR8SVwvCclkhfhZLoTyjGcHLcTEMyYAPDhwFy6aKxlJZgmUicJM3hwQrJqOYIzl65uCMFUf66CnJ46WcDBJgn4WQ69AkO8zXP8X96cjmssdRmovB+v9H6yhIxxqh0Ka0B4IW2v8gbsuu8TgPC4OwxvgQprAeTCtHBW0UBf7Igj/uMH1zCPkBQINElubFRyUH30mpGN/UpmSPB3P7nvVKva06XjGJP/aOI0+d1gmPnQQy31kRg5hbHk5tiep681mBydnd8nHYM0iCcE5AjMInUCy2cctut/sDAEZXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=iNv81+zat0eNj1/gym9e/DFgL3U5BMbYZWUuExGCxWn/w7P9/GNCzp/bCLfj1kCZr2F9Rn5hNdi/Mkzjxgq2/9MOjc4I+/5XKHVEPOZSD12V4rDLjf4UoiRqonGigD/Bk99SkF80ed8De3QaiSdJ6yTPoiTPHuOiQASyMYmrHK58PM71E13fX3tGcs8xElThuvHb6Qn0mjisaAhxAt082N5RazyFZZ2H5HTigVUiim2j5lFeOAb3tjrRPeOVqXSXzha8rUrvxwPBG2kvghRM22gKjKw9Sog4HPujx6ILkUFZjEPlA4qAC5R2RTegfhhWIKAfgWcc5B4CUCc5gi34Aw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=llJMY1F8EVLZX0fQvVAZ0tuUY/yNMLFBRWu1Gv/E7yXv2gJmYJwGlZQJiJ82RvJemwiPd6ZOLPrKxbRbpkwtwY83DE9GZbZpzeXmEq1LafmHJOE2ciE8wUbDb7cf/4RF4MbXuUYnluUo+cJu4SXQnwmn+C7wZ8iGDgAzsqMFO+Q=
Received: from AM0PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:208:14::32)
 by DU0PR08MB9438.eurprd08.prod.outlook.com (2603:10a6:10:42e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:22:04 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::4d) by AM0PR03CA0019.outlook.office365.com
 (2603:10a6:208:14::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:22:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:22:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2YkXCFqPM9oAP880cxYLjABGLmg63v9C0kmhZEogKt3b/J69b1tPuDJLrLsmZSMNn/BRp/oln6KUzyC/VOCVtWDdSeZOGY+JfipCAC2m0ZnlHFpU9zMFWM9wnmeYbXvwfqx8yEH3iHUTsiinZRQPKt8J/bgULo4+LFNORIOFbAqIX1UdJHCYPebvXlaNNKuYdcFONYWK7ZbH51/JaBBIDmCJsGUU0lieBsjhIsP3zhi0EFjD6M6rSRbRRU7IKwBhBAwSWqP3CntCP9+68p4VB4ltWqXWVfugDehGeE04xQ+e9fXMq0VZUOYWUP4vi3z5KXuNViQ6vq0DKNwvgnZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=KgAcxzIyzGzZWXuMqoe2nFeLTQbnfe8m+U8LJ95bfc4d5exNGd50JlJ9paap4tGZmKkCWJpiCHHDVOtNHgWRsqH5LPprHKxKoj0LVXeIaufec/Gdeuxf6Mg9+32vxmeekVq3uNkWNbdnV9yXUbRWTa/YQ95ORBQuq+BEgyDFsRwOYq86yUPgg4PnQyc4opjNECvusND1XkjRDGTvVabKK2mVh+UjeXt0Ox44dHSwHPVVCHh1/dEiKDMTcPI2BeH+1lvBzkECZuLto0GDli5oRE9EZxXMhAAZ7252Y2JmB0pRk6oe8OBPec8md2UmD8BNFxpEzl9s7Ue/aE7ruOdAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn2YdCLgGNEnnzpHiNJ/Epr5k2AZPwdy7K9SGWKkaPc=;
 b=llJMY1F8EVLZX0fQvVAZ0tuUY/yNMLFBRWu1Gv/E7yXv2gJmYJwGlZQJiJ82RvJemwiPd6ZOLPrKxbRbpkwtwY83DE9GZbZpzeXmEq1LafmHJOE2ciE8wUbDb7cf/4RF4MbXuUYnluUo+cJu4SXQnwmn+C7wZ8iGDgAzsqMFO+Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:31 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:31 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] drm/panthor: Implement soft reset via PWR_CONTROL
Date: Fri, 24 Oct 2025 21:21:14 +0100
Message-ID: <20251024202117.3241292-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|AMS0EPF000001A7:EE_|DU0PR08MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d1dabc-4e1e-4114-24e0-08de133afef8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?pk+DCZZ8qrGqRA9Z5iipJ8jsPcjXLKqQEmJPsUpgIn95JlFKTipzUk6HVs7Q?=
 =?us-ascii?Q?M+y30nKnjpmtY8RJM54zxflX5Y9tb5S/f1HJb7FS1iMfaxdZq5ZGU7eiJxE1?=
 =?us-ascii?Q?egzdZOKvNjOJfosKQ0C11+5Df6cwBExciY5WXpY8cNz9FGRI0liaq5K2/KjT?=
 =?us-ascii?Q?jDfPhphaZrGAtbN1sSPooo/yTg9PK6sL6+STNoXoH40RNiApmwZhxyLswylJ?=
 =?us-ascii?Q?HVcb0LfeJPE6xe5eEs+ZAXQa96nIadxxW/NdxDmOy4PGYEBPqZaCOBcJ85/w?=
 =?us-ascii?Q?R8NY89Y1Hgwo1eaBdHleWNjU+oZv7tEPb06yuFIYZltYvNnpYroeFxm9vfCg?=
 =?us-ascii?Q?Uzw/m5iD72+RiQ7qkjoooVOziTGAz00uWmIYBYFpuF5d5oB1my0DE8DeLQGG?=
 =?us-ascii?Q?NCGCz1VNrpHV6fFmkHNUxL830OHTcrrUvxYZw4nxzFNEn9pTvQmxC9+f00nb?=
 =?us-ascii?Q?6sd6gC1P7pXbh9Ejj0DiL0OBSeHtXUZgdk9kiD7YTzWZWZptDGgWVrYaXJoj?=
 =?us-ascii?Q?dy/o7Rv4oEBRevJ26pnjxKP4uuhdcF5aL0BCN0CXyRJveQEcbVgTAbzytY1z?=
 =?us-ascii?Q?ljB4gn2jBwkABhRjZ6h/CgLowMUVnsKlKqoC2AiVp81dG+sADvCDx7zO0Cpw?=
 =?us-ascii?Q?xFUygKZP2yOSKNEryekYmv4cuEvm38VHYK3s0PRLf3CG3wv5Oivk7NVHEGM9?=
 =?us-ascii?Q?irouut1JQm8zzrvLZ3I9WaGBTJtOXadic735CUKFHC36KW+uF/oaZ+OAGfIY?=
 =?us-ascii?Q?4859V4Y7lg5ra2b2gc6RXBWlcrB72fY0TVO1BTE4tQZ1GeZmKhmXf993/cfq?=
 =?us-ascii?Q?IgRgZcOpe8rsw8DOJgu+rbUTTuEGMn58JZU9QQRW5BeKaXyMa0xs3whfINst?=
 =?us-ascii?Q?x1WozbMAADLVqZSmXnx7kKwVH5DCzG3YdkYd1PpfnF3wuo6R2MVPj/nPhzyZ?=
 =?us-ascii?Q?I/4KYzsz57jCi2bHqeHyHRWc66mEOhz3NDAmiMgrZVGu8I7B4WNtFQA4CxZ0?=
 =?us-ascii?Q?ngKGkZ4MXTDheYDvywh3+3JSMMkpbetF0TIrN72o4hYC5pwnp80On5b1itoZ?=
 =?us-ascii?Q?59Zg7Z1nG8cQSaAojWGVhAhhx+T9S8u0S763452wn++F8M+dVKVRbyjJHbhc?=
 =?us-ascii?Q?U4BbH137AxS0lic5gIV/Lsp1ZzmXYO4t3JlIHj+sNbxKpPJ1jci5urNjfl/D?=
 =?us-ascii?Q?HmnjfGY7TlMYorQ534gAEgErXv+JWFjPCrflngtopdM4GuItCxNPkvUcFZlW?=
 =?us-ascii?Q?2cdmUa3TfF+FP1oYG6KgJtAtTfPCF0vWWl6UGPXvilDaIGZbRrBzb8opWDjP?=
 =?us-ascii?Q?oIQKMcROwhdHTis3UKlUkgA1R6SJWD9eEu4HR7UzSvhNHchEn3IHb/OkNMjb?=
 =?us-ascii?Q?HBzfAMHlLoXaqvc07EjBv6UGnq+I2DomD6RH2PjET0aRjXys5tspKZPiGheI?=
 =?us-ascii?Q?AcKJJ0i1zb7x7RqRtre18Pty0XlNivZt?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c13561ce-a261-4ac1-0c98-08de133aebaf
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S6Hb7pdo0izGuAKrnZqlbzevF+aE9qw6S9dDChePrmx8aSXL+xrXg3mSZEvw?=
 =?us-ascii?Q?IVX2fH4nu7pzLpwD4acBXchGE0umHDtmP1xI3Ory7FD4RIi3Ez/rKXtkT/II?=
 =?us-ascii?Q?UsS4gZfjGyVOkBU6V3pbli9PQ7b+Ckg3UHfOTuDDQkImsBNu2qrJhLGBGsAF?=
 =?us-ascii?Q?kLBO+o/wFFuiuMGp89UQw5V5BH/SQoEHCTTQPBF84NPEoFlB/aJhrE/DlOzt?=
 =?us-ascii?Q?OpL/73/sLmYZzjIWVIXqElaiaZ90dlGtdHscEZSoNFszPosq+nY3N9iXHvTt?=
 =?us-ascii?Q?OX5ld25/XyGYaCiQ32/+CLgYYa7z/sXp0NDqz5gRXStc3/VpO6Bes/MOvTAF?=
 =?us-ascii?Q?Wb5Q0MvNDfiJ3hGqX1x9E35IYncq5zrZe2/N874BmOaXTnzcBKW1r/fet3p6?=
 =?us-ascii?Q?G4tzrwfstejgmIoIdKoCz7wouoZy2MIWyAgpsnRb9uOod7OVBxNEfNeZmlzg?=
 =?us-ascii?Q?tsSe4FOgMRWXV2/nq+0hVZEfGngBO46ZEBN/GK+PswmWz31S8LwU6eWUePGs?=
 =?us-ascii?Q?2zsh4m3j90AEqiBm5I79dTHpHsc1PES4jsjEFbgs1VfeXOdxFtVp7tT59vuS?=
 =?us-ascii?Q?ink8tjhznhPIEfwG2RVT328ijfGVbnAIDEPI/8wj8KYzgF10/z0fUidDf9nz?=
 =?us-ascii?Q?MWLR4GKoxBkJPOt//VpyJCkmGAGi4EFKZjPLG9SUSF5ySb0eOKzHM+oVxey3?=
 =?us-ascii?Q?+muLnk8XrxLX5cAPHZNOKuBG/PUizWhEYQ0vfBfZV1w3OzB1z8DqSz9xN/KH?=
 =?us-ascii?Q?1D0HgWEATDg2hRakwxvde54EofL6KVvGAih/ATlVfdQLBX4TGDw5BzjVexod?=
 =?us-ascii?Q?ZDD8vcKoGhmMgrJXoY/b4ELHBUeC49YlvvoC9nEEoO33YuLxPvzEqexOl5cD?=
 =?us-ascii?Q?Q/Jtf+zTspRJqqtTNTCYTpUIYuVXpLa2OsLRugDqDeqLcURPYsimHsiMgOHq?=
 =?us-ascii?Q?yJVooKh2ljHmD2TrwhLT4I7POg812ClFFy3do+bPvcFl2y+ST3G6ohJOTQx4?=
 =?us-ascii?Q?RPlOOuvz0pqf4+RCOuCZ5xLhH1/eHZobv3t5b+rXY2tFXVhRUhxy5V6x4CQo?=
 =?us-ascii?Q?vOYVr4PNhmcmSdwOiUj40IYZEjZJma4F3W/OBUQhWQKYIrK95+oPd3KMHuFG?=
 =?us-ascii?Q?D71XdAUVjwgnWn7yYnMzY3vxw/6FarP24zS4mXH4PhJ2fNyNINMPi6DpIaj3?=
 =?us-ascii?Q?e53tbbsVP6VHS650oggbrD6I7yVrRXUPAnOnFejwvrpZi1JUUexgIRJfuPpa?=
 =?us-ascii?Q?1v1ITV7gl+3ISiG821NRe7oTcCj+PJlq4fMOgJ18z1ANKaDNgy/n93QP2eD5?=
 =?us-ascii?Q?J8fwoIjmhnBYI60vtm/pRJZxbnWKi6sKxYBaMFxgRrrpuW98+ktFgLfgwGlq?=
 =?us-ascii?Q?l95XOAGl+73XrRaCgi8jGiZ1GJTDCB29Rfb81orboBsNoect6r496pYrtI4Z?=
 =?us-ascii?Q?YQkd1fjBVQfXE+ihciXKxWfg7hkrM+tt4+wQgHqsQaeyZoTwI1ERKWmP2icG?=
 =?us-ascii?Q?fiNrI9UH9gmhnrWksNWM3IEQwcj3fQutAPwrEFVkxMuwfc5jxVYRrBxsOcqe?=
 =?us-ascii?Q?qnr2NOLTfYp55ecOgV4=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:03.8939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d1dabc-4e1e-4114-24e0-08de133afef8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9438
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

Add helpers to issue reset commands through the PWR_CONTROL interface
and wait for reset completion using IRQ signaling. This enables support
for RESET_SOFT operations with timeout handling and status verification.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Dropped RESET_FAST implementation as it is not currently being used.
 * Renamed reset_completed to reset_pending to align with underlying
   logic and fixed the logic of its callers accordingly.
 * Improved readability of panthor_pwr_reset() and removed inline
   ternary expressions.
---
 drivers/gpu/drm/panthor/panthor_pwr.c | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index cd529660a276..4edb818c7ac4 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -3,6 +3,7 @@

 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/wait.h>

@@ -31,6 +32,8 @@

 #define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)

+#define PWR_RESET_TIMEOUT_MS		500
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -75,6 +78,43 @@ static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command,
 	gpu_write(ptdev, PWR_COMMAND, command);
 }

+static bool reset_irq_raised(struct panthor_device *ptdev)
+{
+	return gpu_read(ptdev, PWR_INT_RAWSTAT) & PWR_IRQ_RESET_COMPLETED;
+}
+
+static bool reset_pending(struct panthor_device *ptdev)
+{
+	return (ptdev->pwr->pending_reqs & PWR_IRQ_RESET_COMPLETED);
+}
+
+static int panthor_pwr_reset(struct panthor_device *ptdev, u32 reset_cmd)
+{
+	scoped_guard(spinlock_irqsave, &ptdev->pwr->reqs_lock) {
+		if (reset_pending(ptdev)) {
+			drm_WARN(&ptdev->base, 1, "Reset already pending");
+		} else {
+			ptdev->pwr->pending_reqs |= PWR_IRQ_RESET_COMPLETED;
+			gpu_write(ptdev, PWR_INT_CLEAR, PWR_IRQ_RESET_COMPLETED);
+			panthor_pwr_write_command(ptdev, reset_cmd, 0);
+		}
+	}
+
+	if (!wait_event_timeout(ptdev->pwr->reqs_acked, !reset_pending(ptdev),
+				msecs_to_jiffies(PWR_RESET_TIMEOUT_MS))) {
+		guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
+
+		if (reset_pending(ptdev) && !reset_irq_raised(ptdev)) {
+			drm_err(&ptdev->base, "RESET timed out (0x%x)", reset_cmd);
+			return -ETIMEDOUT;
+		}
+
+		ptdev->pwr->pending_reqs &= ~PWR_IRQ_RESET_COMPLETED;
+	}
+
+	return 0;
+}
+
 static const char *get_domain_name(u8 domain)
 {
 	switch (domain) {
@@ -428,6 +468,16 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+int panthor_pwr_reset_soft(struct panthor_device *ptdev)
+{
+	if (!(gpu_read64(ptdev, PWR_STATUS) & PWR_STATUS_ALLOW_SOFT_RESET)) {
+		drm_err(&ptdev->base, "RESET_SOFT not allowed");
+		return -EOPNOTSUPP;
+	}
+
+	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
+}
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
 {
 	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index 3c834059a860..adf1f6136abc 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,8 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+int panthor_pwr_reset_soft(struct panthor_device *ptdev);
+
 void panthor_pwr_l2_power_off(struct panthor_device *ptdev);

 int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
--
2.49.0

