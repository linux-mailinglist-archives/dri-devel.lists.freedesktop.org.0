Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4622ABA06D
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86010EB08;
	Fri, 16 May 2025 15:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="j3JxRBRU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="j3JxRBRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E86710EB06
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OuHHO075N4r3J9GuluKB5Zrle8fEqHYePDi91N5kf4MzUU8y+rrNFyt1VN9lpug9a8RmIoIiRy5QAWhvzUsvy3j3dKexowa4MA3UUm85iF+72WgyHQ1dg1EyPQ7QnBSb3m0ZyT7rt0bVrPVzsAMv8V7z8f5QhDoJy7hO5RvLsP1MYsZctHN+36jEBIPMrqkqvd2Fa60DGKY4NMaBkSPNXkZUaCXmr0Z90537pqkoQxMF8TgP/0UUmpH3cH4enb7/4Spk7YXSNw+e1+tVXOzi2qn9mtc67j8WzsIarZKl7iTIDOpzYSwF4rPGZWqc4xKgtA4ElN7K8TERnTFXl2RIKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoYhHMtGrNSBdwjBj/Woz95Q411HnIbGQZp1B4YlTr0=;
 b=E6WzNMJYmclWYDbsgtHDfsksZweLVW1061GoQtkRqe2LRIvK3gi7XK3hhT2pulkkrfIJV8ZTAMwI/NUvl4pNP/ULkOu2SJNTH/To1W42hiq2lYKcwHkxR0Q1MA6It2M5b+y2kJa1jBpmBP9LhZrHIP9+HfnpOBKtVm3GqA1hsQpGO7heWQ+0RGFvjf2dgO/RZ7W004l9GA6cLJDSnrdxwuTg1ac+dSeZ3fBKiOhzxKnuWm71rbkPRiySXY8NIRElhsY/QmMlLGbiSF1KWogeS+hx50Z1K7HepH3cME7OKHgKDrL0iUDHPWrppyen7pdaDTQps6M4zZDafNhf7noiBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoYhHMtGrNSBdwjBj/Woz95Q411HnIbGQZp1B4YlTr0=;
 b=j3JxRBRUj5kkiia3lr2aYbwidvR1lPwY4/9g4QieDZE1h8vZT0v4A6DeCBvCOjIwmQH1P6zLUmxzx32OHbvhmjJgSt+L2n7bh//8C8r+KUrFbDq2DuQDMPmQZwhkuggeIqd6qtgyu0MwAkLvd8OqsdGXNQ5jrBgKFPuf/GrPpJ4=
Received: from AM0PR10CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::13)
 by AS1PR08MB7473.eurprd08.prod.outlook.com (2603:10a6:20b:4df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 15:58:32 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::18) by AM0PR10CA0003.outlook.office365.com
 (2603:10a6:208:17c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Fri,
 16 May 2025 15:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:58:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L698rD7DuI7BsPLPhdx9P+ueyiAEBKmC9nfIEqbEEYWcU64aRKkpI2jDt6QQuxltWso/dqTpaD3RYECz0qShDpJSum9h3cOxojjnbBNvyNsadMNZND9iDQimJcYHK1+NxZVj914QMn3cs5eqc0ICKKyqfVmgtXyI2iSUarq5QZHaDarGPeW4690uy4ODjjs2F46G0aHtoqigPCYHaAMmNGGQVL44OXfu2+JSAO842mMUobPmeBxUnF/T8CiVh5RFNay8x8tEQMgNqc6O45jEUCOtj4INJxKUrmO/YLrqkVXkCZ8s4lypxjVh8ZsE4FtA1DYNkoS/KgSSNlIng3HJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoYhHMtGrNSBdwjBj/Woz95Q411HnIbGQZp1B4YlTr0=;
 b=nE+JKimngXiCzfCoDY/WyZWFoseQ3PrlxPpMgqdF27v/zop3e+hnvEQZWgcDDXlFuTymeSMsBGVwi6PwWWXFPGVQeaF2SElSXQPMKGygcwyVDjjM1YyIgY1TX71VgQ+zZBT+KZUTp4HsE8PxuOmuzn7Vc8bvPvTH7mFBxGIviWpu+Jit8axViZwRHmd7XtxU+S799NlelvrQIXaTS4DXr3ERApo+Sl28zFRiElNLktsu2cn1f2mRAcu2jY/h1f5IbCBdVFmVtzwEJNQxgctQw1pvpNSKuLClE/rYxoF8Ia8YFh3k6YXXngLgPIzyNnrOJ2oPWCJu/EbGgTlFZiBy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoYhHMtGrNSBdwjBj/Woz95Q411HnIbGQZp1B4YlTr0=;
 b=j3JxRBRUj5kkiia3lr2aYbwidvR1lPwY4/9g4QieDZE1h8vZT0v4A6DeCBvCOjIwmQH1P6zLUmxzx32OHbvhmjJgSt+L2n7bh//8C8r+KUrFbDq2DuQDMPmQZwhkuggeIqd6qtgyu0MwAkLvd8OqsdGXNQ5jrBgKFPuf/GrPpJ4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 15:58:00 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:00 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v4 0/7] Performance counter implementation with single manual
 client support
Date: Fri, 16 May 2025 16:49:34 +0100
Message-Id: <cover.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::15) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU4PR08MB11174:EE_|AM2PEPF0001C70F:EE_|AS1PR08MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a8e6bd-b60d-46a1-d3cd-08dd949281fe
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aFBqRVpyTWFTV2k0OWtnN0NEb1NvR3k2N3R2SmxzcElzTHB4dkE0U05LQ3NZ?=
 =?utf-8?B?VmM2ZUp2RlhTMm96T0s0MExaV3NoZmZwT0k0eDBJY0NOMElOOG1pYkFUcitR?=
 =?utf-8?B?WFI0T2lhcUI2ZTl0cUVtWFZBNml3SWNPSWg3VlIxSDV5c2RYbS9kZ0JRODEz?=
 =?utf-8?B?dWlOd0ZRQ2drOU5BRzYyZjJNRXU4UUNta0k3U1I4VWNieFV2SFNmcjdCVUEv?=
 =?utf-8?B?Yk5yRWpxNlpXMXZUd0JVMU01YVhoZTFnWWR0cGd3enNVWTYxNlRNNTk3bkww?=
 =?utf-8?B?U0hyVnFmd2EvTVl0Szlpemd6T1AxODVnWWUxLy9KM3BQZDFSQ1grWGZadG00?=
 =?utf-8?B?SGt1enkzQ1AweCtmemNnWUxJSGRJdkdOcUF5SHpyeEpzcElMcjRQL1dmNzgw?=
 =?utf-8?B?OWJrQjlGNUJiK3ZxOWhtL3NkVFlPTEpLUkVCL0xhbGV1OXhwWFB6KzdlSmlj?=
 =?utf-8?B?WE8zZm5TMFpBdm1Xbzg2eVExUlBSLy9NbnN4alBtUE5aTDFMNFBCSENhaXdR?=
 =?utf-8?B?dmd5RE1SSkFGM2pnT1ZJYTNiZ3U1bkIwc1d1OW4zQzhkdlA5KzFoQzRJeERi?=
 =?utf-8?B?TVlqWms3REpjMW4xa1JobXdtcXcxbEtQRHpudnhiWjQrMUc2RkNwK3M2UVRH?=
 =?utf-8?B?YnZNVklOR05zeWI1QWdFR0JHYStuZm14MXJvTmVlRnZvZzQ1UEpra1lXY01l?=
 =?utf-8?B?eEpFTElwYmxHTzBhV3VoUTJZRW1aOHB3V1l5UHJKNzdTNjIwdy9YQkJpOWls?=
 =?utf-8?B?Rzd2bkFzWkR3ckZiM2lLaDRPczNQNndhaXlOdHBxM0hDT1V3eEFwQjhybklX?=
 =?utf-8?B?VU1aT0pNd2w5cVFzQ2V5SGxLNS9BMWozLzMrdW9qVXJxalBkWDk2Y0pFdE1D?=
 =?utf-8?B?aWNOcTgrc1lCbDYycVFDd3Y4VjJLRzEwNGxtYnpkQmpRV2l2eFNhM2RiQTl4?=
 =?utf-8?B?TEFnWlZVYzZyQ1k1RkJpMVNtUkdUajlxY1Fiem14T2NNOGhoTDVya0VaN0JL?=
 =?utf-8?B?ZXkzblhTT2RFeGFpeHhjRzhSYXZNR25WdCt6YXhlRnFuTFhSZFdRRzFWMjZG?=
 =?utf-8?B?Y0g0em5vaExZSUtNQk0vYjE4cGdiQlRnVnhyZE4raGVhVU1NMHpDaVpGeDlM?=
 =?utf-8?B?WWVJMFVUQTRCV2R6QzdhVVh3N3p4bW10d3h6ZzA5eVRXblNJWDRabUhNbG15?=
 =?utf-8?B?Umd2bnI1Zk5peHVIQmlKR05uTEFyaDduTEJXb0FudVhjeDBFMjY5cDhtOUdw?=
 =?utf-8?B?ZVRXMGJwS0toUVBMNzFGN3hKc3JhSTY3QngrN0dkdG9YL3hJNmZWODFwOVpw?=
 =?utf-8?B?aDIvYkNxWHVRN2RpMnZydWtOMC9iUlVndFdhNk1yN0ZleXRXVWlZU3BCT093?=
 =?utf-8?B?RFBtT3VOaWZ1QlhQNis2QTRJV3dockdrMm9LbGFtM0wvelpmbmdnL3M2VzNL?=
 =?utf-8?B?b1AzdFdzRGl6bU9SeE9uL2NPL3BpcU4vaXdhZXg5b0J6OGl3c1FtQUlvd3Fp?=
 =?utf-8?B?eXdSS0hpd1BzZnkzNkZBd2FZUlptN3IwMVR5MWU2Y2hXWEVVNTkrdjN6aHZM?=
 =?utf-8?B?V0lGRVNyVlVRYlNWTzdEVmpMV2hmREhSM2t5VENXQWZpTWs5VkhRZ0Z4UW9C?=
 =?utf-8?B?cFBwWEJLbzJPWFJJa29VUmJETExoK2Y0YldOcy84b2dld3RmZ3lZNVVIU1A5?=
 =?utf-8?B?WFJCb0tQSGZUYnU0SEtMcFBIekNiMjJUWFpwMXlCd0Q1VlNwWVh2dGg5Unpn?=
 =?utf-8?B?Y2w5OEh5eFl1YUY0aE92dmtkZklVQTk2YWNVdEU0SWxEcUZXNElGbDVkdnBC?=
 =?utf-8?B?NEJWREI1VHlvRjhjaTZlLzQ4czNvNll4UjVrQUFWNjVoZDMwOHcxOTExczdi?=
 =?utf-8?B?S1YzZTJYN1FMcFBMdHM1RjVwM0g4RmtTVXkyUC9nQmxFeTBKUHlRdWFFMkVy?=
 =?utf-8?Q?Cc5YrAwvnjY=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ba20624c-b87d-4745-f8ba-08dd94926ecd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|36860700013|1800799024|82310400026|14060799003|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDVpcXNnMWFWblgxQkN4R2oxZUFrbURkeGxmaUNMT2ZoWWJ5K09oMlZIdEhC?=
 =?utf-8?B?cUt3c0IvTlM3cy9tOTY0Wm1jVHJPbjVGc012T1VpODJZdzQyMmNDVHErU2Fh?=
 =?utf-8?B?UFB0MkJWeEdzRUs4a05IYThXRXNxeTV0bHVaNHVOaWJpNG5YYVJSeHZmcnJx?=
 =?utf-8?B?T0hZSzdqcjZZRzZGZUxKZ05JWTN3eFpjUmUweGRNbnFEdzJHVFFwdUR2bnZP?=
 =?utf-8?B?c3dzZ1hNLytGOHJLemFRaW5yZmZvTHNiZ0xuQjV2ekUvVFQrUnJvcG5HMVRL?=
 =?utf-8?B?VTNIUUVraTk2ZVU1UXNLSHJZUlF2b2F3MTZ1RXJtbkplUjdianEveHVjdno3?=
 =?utf-8?B?dzVKQnl5N2JFQVFSUFNKTlczZVQrYU45SXpCby9ob0dhWm5SaHF3dzJQSGZo?=
 =?utf-8?B?NWFBL0M1bVRwektFVTdlN0VvYzZIeGFWZXk4b2RFNmhDVkJLR3hDbXVLMUVy?=
 =?utf-8?B?ZUs0R2NyRlVkSmV1VTRKYzJmOVdhVHAvSW93UTZtYkRxenhyWTZ2T05xdXR4?=
 =?utf-8?B?bG8vNGdtRFd5S3J5Y0tiQUpja3hwc1EraWNDS28vY2pKVzdKWXhNWGZoenV5?=
 =?utf-8?B?b2xpeHZBR0VIdFFYSDYrTzMvN0xINWxLTGsrM1pWTHZnMy9GU1dwOFdMcEF4?=
 =?utf-8?B?RWVPSVMvYWUzeGQxNVhia1Y1TXZldytLWUdIQXNjUXp0SUtZT0lsWU5uMTRP?=
 =?utf-8?B?WFRVVWNtRlc2WVA3bTU2S2hXZlovMGoyTDZ6OHhJWno2M0lxZC9QMjgxQTk4?=
 =?utf-8?B?UkRCWXZGbVhPQitMOGZJdURMdUJlWi9maTN5QUJadlplcStzdWppWHR5TG5a?=
 =?utf-8?B?ZjY0QVIwUnhtMkxKd0swZFpjVmdwM0swSDJYaFdBcENFZ3FNMlQvak90R0do?=
 =?utf-8?B?MGREbkc3cnF0UWY4RUdBRE84ZUdDUkNrOWdMeFRWR2pvMUhUdDF3S0JjcU91?=
 =?utf-8?B?Umw0WFNNbHBKajNNTGJ5WmdMNjlHNEh0RTNSS2dXSUhTdVNXM3ZReFF5VkVw?=
 =?utf-8?B?SmhoQXVEOHdGVTlmMTcxekxCMG14N2hJSW9yZGpoSlVoWkdNRENDTHFNNkRu?=
 =?utf-8?B?VVZKbEJMcm8rN0RQVWltTTRieFZlcWphRmEyYkVpVmdwbkp1c0owQTIwV3Vn?=
 =?utf-8?B?ZmMyL096ODN1b0d0eWxiZEgvWEdISURMZTg2R01hOGRYbUI5YlNlRWZoYkxC?=
 =?utf-8?B?UjJjZTU3Sm5IRFBDVGxQUUh2cHB3Nm13RHBONGdXMVI5OXFBdDFpYnpmYWRl?=
 =?utf-8?B?d3FJM0dpenJzSWxjcEw2V0hqUTFMakNCNHpTVGFzN21xYmlubnIrOHNNYWgx?=
 =?utf-8?B?UTh6Y0xIc3l3SDhhTkROTGZkL2J3Sk5oS0FhTG54U3hZOWtWWWlCMG9jRExN?=
 =?utf-8?B?V1RsaGpTa1V0RXR5U2dWRmZvcG5FVjE1U2lOYlp4OXRXRVc5QnVybFpPZ056?=
 =?utf-8?B?NTlySm42NmM1Rkd0TldvTkUzRTBIcUNyWStrZGZUc0lDMTcyL2RYNE5JUXV1?=
 =?utf-8?B?eVNrQ2lSWk9jYVQ1YlJ3UUFCSmJRYjdzYXZEejQ2R2VQL1Nnd2NGenZhOUk0?=
 =?utf-8?B?bFcxL2lEZVFLTlVnd3Y5R050Y2NCdVhNbnBDWUJraHRQanFxUklDS0dzOXR5?=
 =?utf-8?B?ZEpsbTVHSitRZ3Q5eWNlZWc4NVdZalRmYVhXdkN1ckhNTnVZQVpJYzJTdHZr?=
 =?utf-8?B?bCtFMUpvL2tvMSs0ekpLd3pCUFRGL0E0T3RCMERENkhFeU9pemxUVGR2SHBJ?=
 =?utf-8?B?cnJZMDRIRll3UitQc2JmZUdZNmhobzJPQ2o4S0huYkZ5allRR0NGUTNxRzhI?=
 =?utf-8?B?YTlHUFU5TjlVQlVobkhBM01KY2QrSzBqalgzUXNhR3VWVUZtUkNJOStWeFNG?=
 =?utf-8?B?UlJzdWVwTkNmazNKdkMya1lvb2pMR0JWVFVnS1VZM2ZXT1VnUXNNSUhKM1ov?=
 =?utf-8?B?eHcxRmtQYlB3LzhUVGFGWFpkVHBhTmxJWmZFMWlTenUrNENhb3hjazJuTk9L?=
 =?utf-8?Q?1jWEqk5LECWABj3HxXxjf/pl9tVEZI=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(36860700013)(1800799024)(82310400026)(14060799003)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:32.2662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a8e6bd-b60d-46a1-d3cd-08dd949281fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7473
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

Hello,

This patch set implements initial support for performance counter
sampling in Panthor, as a follow-up for Adrián Larumbe's patch
set [1]. This version of the patch series fixes a number of issues,
including FW ring buffer wrapping and IRQ handling for the
performance counter IRQs. The size of the sample is also added
to the uAPI, allowing for the PERF_INFO DEV_QUERY to be sufficient
to handle backwards and forwards compatibility of the interface.
The Mesa implementation is also now available [3].

Existing performance counter workflows, such as those in game
engines, and user-space power models/governor implementations
require the ability to simultaneously obtain counter data. The
hardware and firmware interfaces support a single global
configuration, meaning the kernel must allow for the multiplexing.
It is also in the best position to supplement the counter data
with contextual information about elapsed sampling periods,
information on the power state transitions undergone during
the sampling period, and cycles elapsed on specific clocks chosen
by the integrator.

Each userspace client creates a session, providing an enable
mask of counter values it requires, a BO for a ring buffer,
and a separate BO for the insert and extract indices, along with
an eventfd to signal counter capture, all of which are kept fixed
for the lifetime of the session. When emitting a sample for a
session, counters that were not requested are stripped out,
and non-counter information needed to interpret counter values
is added to either the sample header, or the block header,
which are stored in-line with the counter values in the sample.

The proposed uAPI specifies two major sources of supplemental
information:
- coarse-grained block state transitions are provided on newer
  FW versions which support the metadata block, a FW-provided
  counter block which indicates the reason a sample was taken
  when entering or exiting a non-counting region, or when a
  shader core has powered down.
- the clock assignments to individual blocks is done by
  integrators, and in order to normalize counter values
  which count cycles, userspace must know both the clock
  cycles elapsed over the sampling period, and which
  of the clocks that particular block is associated
  with.

All of the sessions are then aggregated by the sampler, which
handles the programming of the FW interface and subsequent
handling of the samples coming from FW.

v2:
- Fixed offset issues into FW ring buffer
- Fixed sparse shader core handling
- Added pre- and post- reset handlers
- Added module param to control size of FW ring buffer
- Clarified naming on sampler functions
- Added error logging for PERF_SETUP

v3:
- Added sample size to the uAPI.
- Clarified the bit-to-counter mapping for enable masks.
- Fixed IRQ handling: the PERFCNT_THRESHOLD and PERFCNT_OVERFLOW
  interrupts can be handled by checking the difference between the
  REQ and ACK bits, whereas PERFCNT_SAMPLE needs external data to
  validate.
- FW ring buffer indices are now only wrapped when reading the buffer
  and are otherwise left in their pre-wrapped form.
- Accumulation index is now bumped after the first copy.
- All insert and extract index reads now use the proper, full-width
  type.
- L2 slices are now computed via a macro to extract the relevant
  bits from the MEM_FEATURES register. This macro was moved from
  the uAPI due to changes in the register making it unstable.
- Consistently take the sampler lock to check if a sample has been
  requested.

[1]: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6
[2]: https://lore.kernel.org/lkml/20241211165024.490748-1-lukas.zapolskas@arm.com/
[3]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35024

Adrián Larumbe (1):
  drm/panthor: Implement the counter sampler and sample handling

Lukas Zapolskas (6):
  drm/panthor: Add performance counter uAPI
  drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
  drm/panthor: Add panthor perf initialization and termination
  drm/panthor: Introduce sampling sessions to handle userspace clients
  drm/panthor: Add suspend, resume and reset handling
  drm/panthor: Expose the panthor perf ioctls

base-commit: 96c85e428ebaeacd2c640eba075479ab92072ccd

Adrián Larumbe (1):
  drm/panthor: Implement the counter sampler and sample handling

Lukas Zapolskas (6):
  drm/panthor: Add performance counter uAPI
  drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
  drm/panthor: Add panthor perf initialization and termination
  drm/panthor: Introduce sampling sessions to handle userspace clients
  drm/panthor: Add suspend, resume and reset handling
  drm/panthor: Expose the panthor perf ioctls

 drivers/gpu/drm/panthor/Makefile         |    1 +
 drivers/gpu/drm/panthor/panthor_device.c |   14 +-
 drivers/gpu/drm/panthor/panthor_device.h |   11 +-
 drivers/gpu/drm/panthor/panthor_drv.c    |  150 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |    6 +
 drivers/gpu/drm/panthor/panthor_fw.h     |    9 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 1982 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   40 +
 drivers/gpu/drm/panthor/panthor_regs.h   |    1 +
 include/uapi/drm/panthor_drm.h           |  565 ++++++
 10 files changed, 2774 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h


base-commit: 96c85e428ebaeacd2c640eba075479ab92072ccd
--
2.33.0.dirty

