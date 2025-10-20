Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36365BEFFB2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C08710E03E;
	Mon, 20 Oct 2025 08:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="cqdD+0Da";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cqdD+0Da";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D5F10E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:35:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tcXEkIJNL7TsjXH7Mqft6uILLDDglMfAl6lJyopi3JFb2M5zM1NDdnrPsFT1omnUk7/tg+jhTe2Ipy9Oy1RMlf/RFDs2T7slvtEoF0RewJz14pmCXDbYy0SMZhx8FPW4508O/F28LShHuSO0MGrEjQeF+08MzbNvE9kxlQaPj52mgmzy6GTP+9LyFdyNnLvQiAgvDwG0IIknSc0ci1gNTg+d3N8sU+0mFdvuuMeDx3+8Jqs6oxxfKUjwyyxQtD7HglLKxLXmk8WRERl4/BQptMjDPRsL+g7Cn5pnqH9XGygXox/Ne/rVQNimEjkM5YP1154qFA2bWSBFWcfzZah6bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jutTOa4NMdl1yq9W05wREwN9bFbeP72pA3jDBvML90=;
 b=YW9UqCa/IgHvQg0UrJuNvjPk7OSdK59tBEkbmuAmR/cYD+eV0GNXXhxvi5DMIeV5jwonxoTu79dK+KR9IgxSFQRk88WVn2DL9GdRN5r8BkAmqjmUx6aseHFlV+WrrahNrQnPzlKq1F0z9WN6yMkCsgfmDQlsAU2F/9s+IUcCOMCbIsQMZYmf+ebdy2P9wvGzqT25tp9MTtRBvnLxtRRkmadTM7CZLEWuXeWaZPRGlZLZBJNmoiQEkEhC09zzNmQfXkLeUAbsjeSSlZ3DIsFgIsDN9t00HYdzRrJNNDK7MGDkmbkH2YO3JSq8xce/XEFRn2J4hKtn/c6xYOEzF2UguA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jutTOa4NMdl1yq9W05wREwN9bFbeP72pA3jDBvML90=;
 b=cqdD+0DazUYYUDRKEv3OPNXf2lCsmxOThBqf0AbjSI7EMXZpMV4gbK/32+NH6GLqpTcpp8sdQfG2JGvrOw/6r886iZxmIXAargXXKt6VEDPqN2wBXkqOmbysMM6Qa8knNZZrglg/K7gIzkJuOiSorR9r4K+xX0PNsyZJpNs6W1s=
Received: from DB9PR06CA0027.eurprd06.prod.outlook.com (2603:10a6:10:1db::32)
 by AS8PR08MB6439.eurprd08.prod.outlook.com (2603:10a6:20b:338::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Mon, 20 Oct
 2025 08:35:42 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::c6) by DB9PR06CA0027.outlook.office365.com
 (2603:10a6:10:1db::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.15 via Frontend Transport; Mon,
 20 Oct 2025 08:35:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via
 Frontend Transport; Mon, 20 Oct 2025 08:35:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWwtuyciDWRcj8etscbV7EU6EXqVZaDDDUXLbDQpnnC8xIMGRMRxtN9iMDStPXtQ/SbJ5pyH4bFKgs/3EwI0UB3Z4Cz4gTS3DHySPPi8YqITDeV9QIbRQv9OIE80dKBtlZdYSJL7x7Bu1/9ParFFj0o79gPpJDt8PWtEcJKFj3IUVlcFSAmt2l1/0Ean7LqepI6C4ipeqDROYqjOw80kEnqj8+rHe3jFOC5S/I+hCHesM66PsqBmYGqblhGRKnDLz7PRFOyXeMHK2czQ8ML+A171MFeKsgyO6XrcZ6X313xECHPME4Pbe9bODYSc7bTxBZ+mPf72DD7U58NTVbtxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jutTOa4NMdl1yq9W05wREwN9bFbeP72pA3jDBvML90=;
 b=l3Drq5Ktb2tLboGAYdYLPG7456jrcafAoMrPQC8Qmynhf75kpxCf8IAdXYAtIW5xcMuT/wNy/EtdKwdjnmHEFwn2eidNaoaZU3JUPGGMYYWeFF0C1VscLOIgKUGE30RW3SsCbObxtXLq2sFj3WXa72rbkGQegSrv2b0WwYh+yFKtRsWk3O/K5EYrJ+5Cll3VHgwMpBvJTskcqBWA7Ig2q+LjnKEzJwRQyMax321GvAzUuQxW5njmNLqgt5dECK3T6U6Mlgi+ruh+uOK8CBPWku4PhW+Qt4TOKdyxid2KK06FCg6seS9JBUUCkY4USi4qWAhfy+EtxeaL4n+BQKrLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jutTOa4NMdl1yq9W05wREwN9bFbeP72pA3jDBvML90=;
 b=cqdD+0DazUYYUDRKEv3OPNXf2lCsmxOThBqf0AbjSI7EMXZpMV4gbK/32+NH6GLqpTcpp8sdQfG2JGvrOw/6r886iZxmIXAargXXKt6VEDPqN2wBXkqOmbysMM6Qa8knNZZrglg/K7gIzkJuOiSorR9r4K+xX0PNsyZJpNs6W1s=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB6007.eurprd08.prod.outlook.com
 (2603:10a6:20b:29e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 08:35:07 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 08:35:07 +0000
Message-ID: <386ca96d-34b6-4aab-844d-ea720099cf6b@arm.com>
Date: Mon, 20 Oct 2025 09:35:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] drm/panthor: Use existing OPP table if present
Content-Language: en-GB
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, nd@arm.com
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-4-98fc1cc566a1@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20251017-mt8196-gpufreq-v8-4-98fc1cc566a1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB6007:EE_|DU6PEPF0000A7DE:EE_|AS8PR08MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 048cfe89-44c8-43e6-7d79-08de0fb3a6a5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WUc1VkNvMVQrbVhOUmluWi9aUmlpMDZWdnAzWmZhOXh1bThFUlNkcVB2Mm9S?=
 =?utf-8?B?eUJtcjhVWVJ2UjNWQldBVElNZWdMVEFFYmJWaXRHYUR1SzlyS3hTT3BzcTZT?=
 =?utf-8?B?OVMzUVZUY3FqdEZhcnl3dFBSNVhLMm5Db1BINmUyY0FPK1lXWkNFWmFYdGxt?=
 =?utf-8?B?WWNmV0dKRFZZUVVWRHcxeWNxMWZlZHRRQWJ5VnhXSWw1c0svc1BmQWc5VGN0?=
 =?utf-8?B?UHJWbCtBUzd5VVk5bWJENzhJZllNU0szN0dRcFdHUzRzcDBUaGxrTlZKb0cz?=
 =?utf-8?B?L0U2ZGt4eS9DWlJSZ3U0bkVDMW9iWUI0eXNFQkwwU0JpaS9mNjcyUnUwVkpT?=
 =?utf-8?B?OFU5aHdnTzd6RDMyZUM5UkN1MXVqSldtanlvQkRpbm8vSTU1SzF6bCtlSWxx?=
 =?utf-8?B?VkRPVjRxRE9ZcWdUK1BRVjhkUGIzOXBPU0xaTXFiR1Ftei82N2FNVkE3MTZQ?=
 =?utf-8?B?ZEtad2tWZUJaSkRlOGp3US9EdDNTOFRVdFJ3NEdxb3d4U0ZoajBRbnVEeVJ6?=
 =?utf-8?B?Vm0vTVBCY2JFMTl3MEJjSWk1VEVmSWNBRVY0SkZHRnRLOUJyUFh0L1Bwb0Zp?=
 =?utf-8?B?WFNCbUZqRGJQSUJpa1ZkVUZOT2MyQ2p3RTBCTHY4a2pOL3dUVjJUd1hOWjEy?=
 =?utf-8?B?M2p5V3ZKT2c0bG1PdDRuR1M1dm1qSzlHaWtmbjRjUkxZTTJoVnpiMExvRDNL?=
 =?utf-8?B?bHFaZFlDdnMxWEJCVWhHVnJLZDVzb1hxeFh2dHY4NXlKejJ5a0dZd081YU16?=
 =?utf-8?B?Q3M5S01nMWk0UFNLVW1tWmY0c1VWaDJIdmJqdW9PaTZzb3JDUGJnSEV4VWpk?=
 =?utf-8?B?N2V6cktabVAyOFoxT00xb1YrR0NBd3l4UEs4ZEo4bTRUSGRXSzdGRDhydHF0?=
 =?utf-8?B?ZHduTUZKeGxSdXRmbHV1Q1c0cytPeDlRazhPUVkyVkp0QWF0aHNHTGxUVnkx?=
 =?utf-8?B?Nmp0cnJLS1k2VERSdFZuejlBSmlNc0hRTWhOSmFpSWF2N2FNTjVIdTkrVXM0?=
 =?utf-8?B?OFR6dXBaMWJFYkVKRUZvamJ0M1pYbWE3cFZyNXBnRFFVKzJCYkZwVlRKN3dB?=
 =?utf-8?B?UENLYklCK0F1Z1dlS1N1cTVZVThiZEdYdlZHVVlaNmFWOVdoYUV6TzVPeHdi?=
 =?utf-8?B?UXhWand4WWZlcFk5Vjk1cDJUWTJsYzFJUGFNWFdRVGZuU0xMc2lwNCtYTUZ5?=
 =?utf-8?B?UUNRVkNrbUY1NHFCODAwQ09taStJREZIdk1ENXBIV3BURDdGcXYwQjVjZGJ0?=
 =?utf-8?B?VWxqSU55TjlnS292Q0Rycm9VZDFqREhsbzJxNndOYXJGbGRuQUVwa3lXNE9K?=
 =?utf-8?B?MFpJVUZxWUJqTHQ4YzEwUzMxQ0VUR0UzRkpTMGQ2S241ZEczMkRYM0pZV2Jw?=
 =?utf-8?B?MjhxK3huZlFyRFdkRS8rRHJXQU53V25yRVljdENXWGU1MzJuWmJrYVoxMkU4?=
 =?utf-8?B?amR0Y1BLNHBMZVdkYSs3NWdRM2FtR3hsUHc0dUpkUy90SmZ4NHFybHM2ZEoz?=
 =?utf-8?B?bVZ0ZzVvZmM5bTVveE1zSEdMNHovWFVLOTBxNjVSc2xaUkprcm04R0xYcFp3?=
 =?utf-8?B?Wml2eDlHTTIrMlBXamljS3NXREY4UlBEa1ZQcG1aeXBnZGRaUDRxak4vY2sz?=
 =?utf-8?B?Z2NDTTRnK1R1SE9GeGYrdmdQT3RrbkJjSElVaGdDbFZ0bjBDVVBpYjRVcVkz?=
 =?utf-8?B?S09LdEkyZEN2UWo5QkVlcThrdUpLZlNtMG5SdlR6SnhSV2Z6RHlTMm40UVBw?=
 =?utf-8?B?YmxudDM5RC8vTDEzZXlxd2FsclJyTU9NNzcrZDRsZVg1TWQxakpDSzhFTHox?=
 =?utf-8?B?UTdUWURZZFhXUVN3MkVvSW1iOXhtYVJtYmRXblY4YmFGdXgvQzE0OGlFTUU2?=
 =?utf-8?B?OWxUTFlWbXBrblRBa3prUTBrcHg4NmtQMUpPY2U4UmJYRjd4TXZlZjdSRXJD?=
 =?utf-8?B?djVwRmFDU1FnZVorQVQxMERVNjdGQ0krZ2JLNmhVQndMOVhOUW5kNVNXREpw?=
 =?utf-8?Q?M7KfOWKWJ/LSvkaml1Puxv39difD+4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6007
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 33f52f95-c65e-4bea-f00b-08de0fb392a4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|14060799003|7416014|376014|36860700013|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVQzRnYzUG9nZXl1bWFxZGhRZlB0UCtrQkNic2tld0gyaHlpWXg5UXRQNDdK?=
 =?utf-8?B?NHV4R2YzbEJrT1doU0dhcUFMbmhkekVCWW9kZzFuUFZ6VlRUY3gxUkxheVVq?=
 =?utf-8?B?dEIwWkJUaE9KVWtOVTZiWU5RaHcwVGg0dTBnY1BhaHBHeklSU0l4L3NaWkp5?=
 =?utf-8?B?VEZCZzJzZW5oaUlUSnp0QmVVZ3E1Q1k0dElCU1RaS3FOZEJQM0Ivb25kL1Fz?=
 =?utf-8?B?Y0RBUCtwdEJ0Ym5hNnJQMW9CT2RxYkx3SjQ0cnhUQVdMS095b0FJc2N3TDNs?=
 =?utf-8?B?dmVEZHlhd3M4TDc3aXJMYkJkS095S2VETHZhb0g3RFZ5bFdabXhKRm9hSVBI?=
 =?utf-8?B?OVFHWHhsWHZTY1lxV2NPTWt4WDhUMXlvRDg5WGxGU1VLMUtzRzhiNElDalNF?=
 =?utf-8?B?d2xJK3Z3QUw5Z0RTSEtIb2cvdXpxc1IvaGlqcWVzQkVxMFdrMkxwNmhLWk5r?=
 =?utf-8?B?NStzalpWSUl4VUoxL2N4Q0FUSStZNHA1ZExsWkxhK0VQQ0lDeW1kVUNuTHhV?=
 =?utf-8?B?WGhBdzNtZkg0RHNZUzFPM051eUlQaWpTOHlFMDZYYktjTkQxQnBZdkpuZk1h?=
 =?utf-8?B?OXMrNjJYNTk3d2ZlMXAxdnpqbmtCZFFiRDZ6VkMrT0YyN1NqOHpodDd0WElh?=
 =?utf-8?B?RkgxdFFzRUFtTU9zendCTkxiVDl2dnpraE11WFF3VmVCMjlmeGtTSFh4Snda?=
 =?utf-8?B?MTdZVDBIQVF4NGdRV1ZXaWorVm1jK2wzNFQvM3ZqSnNrZ1VPd3Foa01oN2Mz?=
 =?utf-8?B?V3l0UEY5alFBbFZEUW0yQXZYRmdFd1Y5dWFBUFRJZityc29IVUlpRFFyY01J?=
 =?utf-8?B?NW9sYmtmdDVRWTZjQ0VMSVM3UGJpRHprNXFVQ0tMaXZ6RHdEREF0OTJycWV6?=
 =?utf-8?B?S1B2TGhCWnFvYmF5T2hhekZ0S3Z6MkVPaWRqdzNsMUJkQmJNS1dXLzRMczY3?=
 =?utf-8?B?ZTlYT3JyN1JBbFo1SWJFVFNxM0tyTTkzSHRjdExxcW5pMlVHRDFTZjZvQnhm?=
 =?utf-8?B?QlpmQURPMzlIZVVVcmFCY0dTZTI1a0lKZGNjYWMrWkVwdm45WUtkUUdGTHZz?=
 =?utf-8?B?K3lSN09sNHh5VUI5MjJqVWhhWkkvU0k0Uk05UWRzQWswYjNuVFd2bXAwb29s?=
 =?utf-8?B?OUF5a0F1MVYwU3NybVduemNpWHRnT2poYk8xcHJUc3lOdDltY0RyTHRUaThN?=
 =?utf-8?B?Y1Z4SW9Ea1l5SXpPVDVZWFBkK3piRDEza0xwRkJmbTRVQ1lrekpvcHNhTHhB?=
 =?utf-8?B?WkxVbHFIOUhmNWp2QzhkVXgwK1I2Mk5tcDN2R0F4U1ZPbG1YRDYvc0R4YkZY?=
 =?utf-8?B?aU90aGpIaFQxeXJuby9HQkI4M09OZWsvWWpkUzJlNmVFVVZMdmhaT29Wdkla?=
 =?utf-8?B?aHpnM243amtGMWx1NFc1andvVXdyTHdkUDdGQnhBK29DbGduVEErSGJzR0Fs?=
 =?utf-8?B?KzJRNlk4anpWMHdBb0F5SDh1aExFRGRscmNKUWswMitKaWNSMWl4eDRtUGdE?=
 =?utf-8?B?NzFRQTZmRXEyN2I2a2Z0a1k5UEpraFUxYlJabE1TaHYxT2gxSW5FWGNSY1Nj?=
 =?utf-8?B?NFF5Zm5wdzZZVmRDcTB3OUNva1ZUVDg0YWpnWms0bU44MDZBY0d1dEI4eUlT?=
 =?utf-8?B?Ujd3aVg3bU5jeG1HZGtBdDZmeFpSWSs4NTRkbHNaRGYxd1c4NFhRTmxCczc0?=
 =?utf-8?B?NnJKR0ludWkvTEZkb1pKaGdoYUN1SndncGIvUGo5OVdUYjc0TVBjWTV6TWgr?=
 =?utf-8?B?M2xHVCt2eHFxK3lONGdNZHUrelFCUG8wdzdDdStDSk9zZjVrd3R3cDJUVDQ4?=
 =?utf-8?B?ejYvZlB0MVc1ejIxVkRPTFNXdEJHU2NlODFKeGk5cXlmalQvK3M5NDgzanpk?=
 =?utf-8?B?cFZ3aHlvQnBBUk1hU2E5Yk1kM1BxV2lvbS9UcGM0MHV6YnNuQU84bGF2V0hJ?=
 =?utf-8?B?eUthT2NISjV4elp5VXI4WlBHWk44dk8zS0hPR3I5SjExNzJ5SHUveEV4WGYv?=
 =?utf-8?B?S21qbnNoRUxFOWxoNEJlY1J0czA5REVMNGFCNjZlZ3M3Qlh4a0NaUDAxWjFP?=
 =?utf-8?B?UTJ6L01wdVphM0Z6eEFVbCs2ZXVEVmNFU2hHVHVJbWl4QzNNa3pkaThNdmRm?=
 =?utf-8?Q?F2MONxcl1Wi8jp6QwE8rfW64V?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(14060799003)(7416014)(376014)(36860700013)(82310400026)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 08:35:40.1526 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 048cfe89-44c8-43e6-7d79-08de0fb3a6a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6439
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

On 17/10/2025 16:31, Nicolas Frattaroli wrote:
> On SoCs where the GPU's power-domain is in charge of setting performance
> levels, the OPP table of the GPU node will have already been populated
> during said power-domain's attach_dev operation.
> 
> To avoid initialising an OPP table twice, only set the OPP regulator and
> the OPPs from DT if there's no OPP table present.
> 
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index a6dca599f0a5..ec63e27f4883 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -141,6 +141,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	struct thermal_cooling_device *cooling;
>  	struct device *dev = ptdev->base.dev;
>  	struct panthor_devfreq *pdevfreq;
> +	struct opp_table *table;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
>  	unsigned long freq = ULONG_MAX;
> @@ -152,17 +153,30 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  
>  	ptdev->devfreq = pdevfreq;
>  
> -	ret = devm_pm_opp_set_regulators(dev, reg_names);
> -	if (ret && ret != -ENODEV) {
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> -		return ret;
> +	/*
> +	 * The power domain associated with the GPU may have already added an
> +	 * OPP table, complete with OPPs, as part of the platform bus
> +	 * initialization. If this is the case, the power domain is in charge of
> +	 * also controlling the performance, with a set_performance callback.
> +	 * Only add a new OPP table from DT if there isn't such a table present
> +	 * already.
> +	 */
> +	table = dev_pm_opp_get_opp_table(dev);
> +	if (IS_ERR_OR_NULL(table)) {
> +		ret = devm_pm_opp_set_regulators(dev, reg_names);
> +		if (ret && ret != -ENODEV) {

Is there a reason to not fail on -ENODEV? I would assume it is a valid 
failure path. 

Kind regards,
Karunika Choo

> +			if (ret != -EPROBE_DEFER)
> +				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> +			return ret;
> +		}
> +
> +		ret = devm_pm_opp_of_add_table(dev);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_pm_opp_put_opp_table(table);
>  	}
>  
> -	ret = devm_pm_opp_of_add_table(dev);
> -	if (ret)
> -		return ret;
> -
>  	spin_lock_init(&pdevfreq->lock);
>  
>  	panthor_devfreq_reset(pdevfreq);
> 

