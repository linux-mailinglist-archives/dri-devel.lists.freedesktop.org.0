Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61088B10A7F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB6610E268;
	Thu, 24 Jul 2025 12:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="U7DRW3sv";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="U7DRW3sv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BD110E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:43:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=guX1URgL4vbb7dHYCSMS+RrInzQZThA5AW2hDc1F39rrP2pmG3yhqEzoIIVBPdSgWgNjirsqVZzGRhk8EogzJGn+vHUf4JlzorQ/a+oVtcxKNkEoBBB3OnJo3WIgrafKTXZm5WjCeppPGpIF/Ds85MEs2dJpLt6jSaP0QVCJ+PglfgA+addlR/RaPMh6NI5V8rDlgdgolwUP5or+O6iaLh5ouHryrkJGiWnvYTiprZYZSekwyGgRacDDiy/Lz7IxBrCW9R7dlA6SLKhvCY/eHL4Fhcxr/zq2w4iUPJNfDva7fs33Enc7rdqwB77RUZJU+e51HtfZhqaw9TGw796JYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=qKwaDb6dQKMgSfctpZANz1fnkufu6UtzNgTJ67bI/9kyKP1xclB0CEZ4cdjWfwHa7mhZq9B7HehMmqWlvMdpXiWAW71G//vkxtDtHprt0ZfGzI9/EYIwi6Cjxq2AcfTUmZoRa2yWI8+daMKLTazEHrgmMgGeZZyNLUBFVTfHV00JCSGfaznKGbbps9MLNfovWcBBY38YL49puAZaH7m8rxdj/JztJiT+j966ynDXkhsTBkI2JuxTcBq/+nxU0ZialfCpFv2VqJHjAWq9Z5fwerpXS1Xajwi7Cf1e0XGV8QGdfNjgWvkAMjSUYa90tWXlnsXSUSQnJicLe0+6J9yArg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=U7DRW3svd7A5BmYO5O6mkOcOQBawWI4HpVle6wBuA9/WVIuBL+0K1r7vs2/moTfvvpREHveBKgKE4Vz8QA02MHCGUnB9yu1m3NnZ6SgH/CV9FbE1WJTIV8hegnVUysMQH/VfKr2m7cuuYGcEQj0FSSG7AAN5qmB/IF2INWr/Gu4=
Received: from PR1P264CA0133.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2ce::18)
 by AS8PR08MB9888.eurprd08.prod.outlook.com (2603:10a6:20b:5ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 24 Jul
 2025 12:43:15 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:102:2ce:cafe::64) by PR1P264CA0133.outlook.office365.com
 (2603:10a6:102:2ce::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 12:43:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 12:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfBDvhJxC467joTWcus65FUA+dCz9QtoqvL2Xm2wfq/lu+3FJ2ZtAkmtJ/WpG3AR2uJevH1Jx+nBLRjn9dt6iWQdfQB6tDo4ZJWph5xJda8SVCEhcI+1ostnexSFXCDX+cgv/sL1tmhIB2/Jh+eu8VfPGa9KiUmD+FDFZg6Xjm17y6jZauNN5WA/IbL4bJ1D1BSOn/RsJFZqweUzvwfLgQUokLerN/03aQ68ZdhkyADIBp2o0CWQ+wo3TFnNuNRzemhDpnfrAc1tNNDPZCp4f0zy4HtykuvTp8qXAo2vvHQFqfbxTb5HcgSpiJZi+qKiReo67ulOGDeDCBvczlQPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=P99vUj20fMv0mkMdF9uFLgfQ05cf6uNv1th3S8XmsN4YNiGyPPKE9xoNJkFm6H+manjApN3ZRugD6toDrqGreZ4in/gVkTY69ZzPTLQw7df2MELlcOTVWz05kluokkKymK/BH8cYyGD3UJI1Ca8T4xL597uEvapifT6LPCZoSoMCYI22T2ps1cGAIJ0pCrSzOBZhlU+BOTVhZe0JXlQc7sY8IzkIQOdTqiXDvSJz72oLx5U5e1TsUcpBvi+IU5zz5kwWEQBEhHvbPnyVnmm05M7QxcoMA+acSjIDL2Kou8lNs6vzm7c+wmqKKm0VqnKwQpQst0psgRLm70UKL0YQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=U7DRW3svd7A5BmYO5O6mkOcOQBawWI4HpVle6wBuA9/WVIuBL+0K1r7vs2/moTfvvpREHveBKgKE4Vz8QA02MHCGUnB9yu1m3NnZ6SgH/CV9FbE1WJTIV8hegnVUysMQH/VfKr2m7cuuYGcEQj0FSSG7AAN5qmB/IF2INWr/Gu4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by DU0PR08MB8496.eurprd08.prod.outlook.com
 (2603:10a6:10:403::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:42:42 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 12:42:42 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v8 5/6] drm/panthor: Make MMU cache maintenance use
 FLUSH_CACHES command
Date: Thu, 24 Jul 2025 13:42:09 +0100
Message-ID: <20250724124210.3675094-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724124210.3675094-1-karunika.choo@arm.com>
References: <20250724124210.3675094-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0292.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::9) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|DU0PR08MB8496:EE_|AMS1EPF0000003F:EE_|AS8PR08MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6f413a-e0b2-451b-e0fd-08ddcaafa86d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?TTGnTvAGglcntmWE1mBoltvwOnxOJtxzzffQOfTDVMoig5hxzKxTnk8+AU/n?=
 =?us-ascii?Q?tkmvyhLr1GyeNd2tdzJsUKXvvUgk/xT3yJeKuBWEJ4pM75CO+x4v0a9EbQwc?=
 =?us-ascii?Q?EiaJcG1se0TP9mXDGTQ/WrUoBSW/4BttuPD37hb/3KF53Qd6br1kfNgMnFzI?=
 =?us-ascii?Q?K5Q/DLeiGjVGJ52OFBwHUThKXkLej+94FOO0O94JrrgQbVLdXg1+jP/a333j?=
 =?us-ascii?Q?FQIZs++capVPydRbrTQ+nbJVeYQA3o4ZQ+fKO8MxVQvpL+kT9oJBCGrLDrCt?=
 =?us-ascii?Q?fPet29YQSTxXI5cGg4UTZBPJbHQ2sCEF/wJa4QwwfvPzI5EcFIDBKXIqPASc?=
 =?us-ascii?Q?XvZNjCOz2k32p3+z6Skl7g7vZXDPMlHPvSa0Xb7OHgY8ITf6HEin97vvP6Tb?=
 =?us-ascii?Q?ez3XKQoQdK5L9YMc3rSxe7j+ZWXfJhAKtIRE4cVZj7jxEO7SjpXl2WB2YtV8?=
 =?us-ascii?Q?Cw/PuGDgmRjg3gMNYMWXoJ1e/0wXEkTpwnLa4pONrLh0cCmQbKoJQJIIQFtw?=
 =?us-ascii?Q?SUTwoFbDOupZCzCwOGo9pPcyjDpUTqPoO12/IyXJPLr3660961qQYaNkOJ4h?=
 =?us-ascii?Q?lSRY3NZAoJhbaKgJNnnHUproOkmzpOo2Kw17TERRnwUWs/ETLwS2lymOglB2?=
 =?us-ascii?Q?SJyQRUZFj4aeno/0osdVFOm7aplvwevRv14qHHtqmISyelYbqbIEOJ7jVz7s?=
 =?us-ascii?Q?pIR3w3XyQpfKh9HGs+P32HZdr3XN373yqwZEWJeBFRS2a/IJp8ZsHzMiYJ9p?=
 =?us-ascii?Q?8BW8/WBaM1CztmMhWgEgZwxXSDIafcrQVDQyxJHy/7CvijurcL7CA8so5W3e?=
 =?us-ascii?Q?xXdUQK73XYkDelMNFrq1Vtg0D6Xe47mEu5S51A38CAiRpZEEu0DFpcWOi8Ii?=
 =?us-ascii?Q?8isefD/iBPK1UlurNK5rxrEA9XC1IFwgHZZ82TwJ9/sndTA5gLnrL/QbNlzZ?=
 =?us-ascii?Q?N2M/MtRDuDpRKH7nU1BjzDhr6/KmAV6Vk7cIv6iC/oqvhgtnX3iEFjTZOLmG?=
 =?us-ascii?Q?8F7/zKFkYB9hDyij+PdaTeTNEe5/Smg30ILFmcywkQU1KDWVTr+uiQJqje5Q?=
 =?us-ascii?Q?8D+4OBQExoIzpkjQzkdSqtM5aRGOk2cLZLJAmbHFTNz9323NGkOJODjbRrQS?=
 =?us-ascii?Q?BHXFjDbHzdVnVb0SXj4kZWJGH5ZNOeGNMgRLw0LxDtDzOkGTw8yuLMOO1yW/?=
 =?us-ascii?Q?MJQ2+pRayf3+Y+57gzKmLchxnNy4FYbFRntiOmVxMPH4pOWIuG9vgNeLrDZX?=
 =?us-ascii?Q?nUKr7yFWZYPRa6qSrubie9BeGDRISR01rgCs+11VO+nD/SRfbabkCa0o2d+t?=
 =?us-ascii?Q?frjwfNhTsWEbeTiSbMQgbMv3MkVRIsKxjXg/JFIYusEA4dJelY0ncJ9Nm1cq?=
 =?us-ascii?Q?TgDHpsa/6Cah+gXFD79dzKb1e0rzFTLh2Ufp1Gz8NP3s8E6Pnw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0029393d-e4cd-4e5e-9f69-08ddcaaf94a4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|35042699022|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J1FmQmB/irnbkZf6SHMnRACJ2FkeG2fEnih5vygN5Pf2aAm6KWmmDZJzbZ9M?=
 =?us-ascii?Q?ojoRiTmEDeX+e7ifTTF5OLHuXDU1o5HCtgfpkFzAFKm95NHA4l7a8dkL/U7i?=
 =?us-ascii?Q?O9WJNyqbtAr9WbUhXFb9i/eqRSovoSwWUVtrBE+XvccgkqTPPOnIOEIAJroO?=
 =?us-ascii?Q?hvnVqJOJMIaXVNP3EjLchhs4bXgmdp7C5afrlCJ78xGF1YWjht0mY0UwaI4j?=
 =?us-ascii?Q?oyKKGldAogBk8bcQI90y/o2DRX1i0+1+ABoXsF8VDlvkkpaVFY6CFOXNN8N7?=
 =?us-ascii?Q?vTEIxV4mA9I47lVtn3SoU1ZjqjhlDbWznFuQ8qgxnQNIa6U1RkmCKBMpFIKL?=
 =?us-ascii?Q?s1JV+Q92y2IjCtaVuhEqd3d0KGpX+pf/GpbeAUyiFJwOJEGiCZeLtHSvXJMJ?=
 =?us-ascii?Q?I/skUdJME20KhXVKbDNCkCMhtTw/2JECk8wUWhvK2KkILpw0EbOr+mLMeLw2?=
 =?us-ascii?Q?mlvOoZ8fDx79CrZhTBuSt5hVeTl1tZkjwCyBfJIFqxh4GTTuE8efaMyBKyLX?=
 =?us-ascii?Q?MOa9heNj35BSY7DX+Q+GfHPqhweTZGdkko16Hq935Wu3EGhEOG91CEBjIVn7?=
 =?us-ascii?Q?4B0sIc2Ks8xsIKK5L5UxzU/aKmt4idXjfMvjWYtyU55+HqJz5ceHTPLmnkCi?=
 =?us-ascii?Q?GeHPDUq3YY21DCEWU7Myt5BjdmISYGN0EvUq/RwbwBdsdyQ7UblvWhuC8Fza?=
 =?us-ascii?Q?Dw3LLnrpLaJ4AQUntLKBLPf8xqjZH95zPkJfnFSezJI4fL9+j23LfG94jxd7?=
 =?us-ascii?Q?7+kMYKN1/nUuMKrdImmRlvX8MprdeTCDNGpZaQ4vOvdFYG2237ct6BoHolNm?=
 =?us-ascii?Q?aQYxWf8yDcRjnUtDTj9Eb2x2M+0z/f+ZBJ6yUIQ4OmWWWY1w6jovpkRsib0D?=
 =?us-ascii?Q?ijpXWd0TiPqFfAvMr24N+e1GQC0ZaM4gWgQHg2qu6uZ+GCfTBwAQlEZpOZyz?=
 =?us-ascii?Q?eadehi+yADPJbiGuE9zDZ6ttb8KX3aZT8vj84VgMk/Ck+fp+ll5H8ILSZNOk?=
 =?us-ascii?Q?XB/m9+0znBs97Y4J6BTOV7I+jF/YGG6ptdavKPo3Wo1gp1h9jyfqTLnIipxk?=
 =?us-ascii?Q?XE4WstMVsACh78W6x6+7Ob+Ekna0dw5tzsC03jnR1EbbDBB5DprpOnWFZVn/?=
 =?us-ascii?Q?0TKF3xyTDZi4Yv7pIWjdjhWcrrWt784dE0QlxjbbNEW/1tnNA087HUhRXnZY?=
 =?us-ascii?Q?asLywbLiY6pqRaIajGISOJ9qTfq0kRjQh/CQYaq+ZrLTC9DOFHVDzyENPast?=
 =?us-ascii?Q?2QvfDJvglpN1VHiu5OBEkiQ5PdplAkHQZGL+2iW+k8JPvop6tpntaGa1Jur9?=
 =?us-ascii?Q?r7NVa2qrRNzXONyagUEkS8nB/xhzw2L3Qhtau568Ji5aBBQ8cQWsvILx+o03?=
 =?us-ascii?Q?G6RrFZgnwAarRshNOUiAV4fCxWRx9EZrURzgvWK30p7JMoq4McBeP+TkT5Zh?=
 =?us-ascii?Q?+CmnFdCq8TS35qv1M4a8mkETprHUkHeyjH2SK0LHIg1j10exx/leMzK0qU0r?=
 =?us-ascii?Q?H0AFeBazVjek6IA5VIJvP9oLWR2emOr+a43S?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(35042699022)(36860700013)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:43:14.9409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6f413a-e0b2-451b-e0fd-08ddcaafa86d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9888
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

As the FLUSH_MEM and FLUSH_PT MMU_AS commands are deprecated in GPUs
from Mali-Gx20 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_COMMAND in place of
FLUSH_MEM and FLUSH_PT commands.

Mali-Gx10 and Mali-Gx15 GPUs also has support for the FLUSH_CACHES
command and will also use this by default going forward.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5a..367c89aca558 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,6 +29,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
@@ -568,6 +569,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +615,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.49.0

