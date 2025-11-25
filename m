Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C1CC850AD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1221310E3D7;
	Tue, 25 Nov 2025 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="EoSqwJkR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EoSqwJkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A2210E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:56:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sQtjKGIxEHoO7pXXVwIbbdJyD6IPMVK5I8yaSky7cs0VBRIVwVUBO3oPXLtwYwRWrePz0T89DybbQmrBlZzamYVCcNhaKn09QPcbPigQmVOxihwuiVYno+SfanTt+pY+wtg8DfbZwmYdEx0a0p1QsGVIFe/5umvFpmPFIcRadEG7645Ovng0s5QjgOVXHuDoAUOS9iJs5efOmaS9SRsx88Dx8XyZhsUFNhMnMpRqq88JizmAUCmwooZXYtHVGEqdRVMyVavO6ej87A78p+wBjJJCyHniH1T5871a6unfkLWYaxEHoKCJ5t7DpWSBXrL5MoHl6EMLw1zUPpJlrurhow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaqvFe4+UF2DN+CnWtGW3Pvp3scI3DabKQuzsiPEytc=;
 b=fezzMLKy53KWasPFFOKsV8HjOInVwmzO239bKpOEsatvwniEgQw/oRBPtlrvFNkDUdrS82R5ZaVGsoBc3R5PRpl9VRCGdU0dqmT2PpN36YldyYQPUTCGu+82J/yIacX8n6J+A79vyoFnRxqwarpuLsK+5WWwfFSGOCU9PZCP9NT3j2eIR+gAe5QQ/FXjtMeq7HE4tfn+3fb9eEE1VhgtR4CSMqXXniHS0DidUkL+LDUbeppO+YhwJKqv9DbXu6HgFmNuwkXVEtSgiTYPTH9CjJc1QiNIxUq0f4TqKdS2ZdlC6bwpymugZ/9lcUqmeXCRZ3Vvbimre8K8jnk7C/WRog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaqvFe4+UF2DN+CnWtGW3Pvp3scI3DabKQuzsiPEytc=;
 b=EoSqwJkRUPyE7M9z3rgG3itV5qUFdITGywHQVScyukJrwuVKrX0QduKoKtfcZ0/5pL0Nh/t2ZyfQntI4s8V9CJfy56/+aWE2N4K1VKhUh4cFankt5pqy5WkCyBL2OqrCDBxmbmDYMV5Ja+HPCb8r4GeOiO0MuY0uv5dRTJrCn2A=
Received: from AM0PR10CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::20)
 by VI0PR08MB11450.eurprd08.prod.outlook.com (2603:10a6:800:303::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 12:56:52 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::9b) by AM0PR10CA0040.outlook.office365.com
 (2603:10a6:20b:150::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 12:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 12:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olpx5qrdSjGw5c0u0Q53+9IJV/FdOB6aXbz6/ZRPYei3z9wgqlRRGLkaDrqydKI9ldC4S065oLl95lAVN/qQVjqYBnwZ8zKhavH55bCUpe3aJ2QsQ8+3mqgpMWXlKbAMTYFpxui9De9aQs1/j2YLWyg/jYpv7ExKSLYQM1SLWzejM4tnkXPFOl739L+SyttsBDcaAiXOjTGt/tNFmcvXtIL320BzWJV/ERhtB7qcJta+tOW45pYvo+ZhozqTe9mrG8q9QXEjc/Q8ynuMn6oKkFB1uEIeqXLcKOrFupBAWRwkXnNUfc//njbnJb5EluuePf5scq8z1Nhdvw5tpP08QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaqvFe4+UF2DN+CnWtGW3Pvp3scI3DabKQuzsiPEytc=;
 b=Z6U2JoE5hYS7FiicFtmkqd5jBRiN+miZVQT6sybdUGQbVZyz/CKofThmbeQER3qWD4luAe34PVBT8kReMs1nA3H4HwVsk/OYTkdMATYq7blmNOaLhybQICoz07eX6tzxRqhxUW2eVYFX3T5xC0E3tY15HV7w9J+fvvBBHT7n8w52lrPuBl6OlkhHzG3ybdUBWoT3tcR72dw9DPvLdozFbKLMz44NrpFNf/DrOWb3T6Rdn36gTVDk0vZpTE3h27894w+fMuAVu2qieE1ZvtH8Er+10ASE5AIcqyKTuH52lNlm772i/d5lpphsYeAqaztlm6Co8CpIxmNFmPFNoSJBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaqvFe4+UF2DN+CnWtGW3Pvp3scI3DabKQuzsiPEytc=;
 b=EoSqwJkRUPyE7M9z3rgG3itV5qUFdITGywHQVScyukJrwuVKrX0QduKoKtfcZ0/5pL0Nh/t2ZyfQntI4s8V9CJfy56/+aWE2N4K1VKhUh4cFankt5pqy5WkCyBL2OqrCDBxmbmDYMV5Ja+HPCb8r4GeOiO0MuY0uv5dRTJrCn2A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:19 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:19 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
Date: Tue, 25 Nov 2025 12:55:43 +0000
Message-ID: <20251125125548.3282320-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB8937:EE_|AM3PEPF00009B9F:EE_|VI0PR08MB11450:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfd83d0-9819-4b7b-bee0-08de2c221afb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6OZmgbagX5ebkEr0f0QWIf9U0r/gHcNx8I9++2+BY1GdcrWTFBzH6rgt7+rW?=
 =?us-ascii?Q?6vjqbGZ/iSmoT0uB0Av3WSqDF2cm7XBlU3/4647OPwLPndEKgmPEn3ZlA4D5?=
 =?us-ascii?Q?Uen44quTnQcKwbhaT5N4cqaGPsGenIxxmU+W6f09qQQ+JtX6b8KAuZ/A0Fi3?=
 =?us-ascii?Q?zxAUUh0GdO8QXdqO4AGoRAMiX2uSzSTybrt+sXUycQ5OswVp+M8R2SQwMp6Z?=
 =?us-ascii?Q?poePYXFzLoFgSHKKdRRDtS1V2jXJpcK5lPVFXfgwGTwQTskCps69cKaXq+A+?=
 =?us-ascii?Q?RDAFVVdyksP24i+r6RCEYD3qr5oW81wAuftBFiCCI/FgENg26dX0YzOua1a2?=
 =?us-ascii?Q?LKIso0jeAWvJRd2gigWqj/t+hSSte6DSA5ptV1ioPyFkNdP3XkQA8dYMcAyb?=
 =?us-ascii?Q?nRJVqPDjKh6Zo6M2Bfr9oAiwNTUsMrjCHmz/t40+AN9IR1vBGKT1USs5dEai?=
 =?us-ascii?Q?kh5vVwDnlr5lcGEf+MNBRicLf98idCumJBGsPkK1DttUa/5t6eeapfYeRgCe?=
 =?us-ascii?Q?w400b8pb4qrUmCGoMISBbKToNiOgQSBjn5msVZqI5RiB1OKiexTCUSYK3SX4?=
 =?us-ascii?Q?L8WwJTMBONdEKjC7MQrCMkBXeAd+P1ll05IR8hzoI/EOHH872w6ssMuBTHwS?=
 =?us-ascii?Q?O/Iv18pUxaAkSq8qde0ANHrQvEaxc/1rn/Iyq/mTAAr16kYQcO0STGssKj7s?=
 =?us-ascii?Q?FP5U0+R0wf2/S+24LumJH7Fl4hAjxv22SzV9iputVHs4/foLzLK729c0UpTC?=
 =?us-ascii?Q?+bTLm80FB2BNGi2yhIaHAr3fTL/KZjco7fJOkrWU/O6cBchued9ddasvnWB5?=
 =?us-ascii?Q?qhMaIfE/hyAeGWZ8MZmLdg3dcPQ+RaeR4k93Sow6BoAdAZwl7Jt0GqNYBHYB?=
 =?us-ascii?Q?FFXzInMDhitlX/zbCfVIY5QenDR7bOT9pjdMhzlYFqN1Cj9GDfMPbHJ0yt5U?=
 =?us-ascii?Q?dYEuDxaDraRhAeR2I0N8saDw8mcW4QamZ2BqKu62JQUFOAcvcF2bSxwJtxD0?=
 =?us-ascii?Q?TIvUHwm50/PAFhuw6ziOsAZMV5V80Bo+VIeF7J4SeOGT8pObOCwOjhatsPSy?=
 =?us-ascii?Q?iFbrj5gppVpBkzhhNPQFvjb8H2PO8p+CtwxBB13f477rjuKVW1RItSVSpny1?=
 =?us-ascii?Q?NsgrYmevBHSS26alhMnFBBmSDuZumm22gQq6FSeyMntpH9vsKep6BjL6eIAS?=
 =?us-ascii?Q?u6u+rpAg2h05hIvguU0FB+CsSJlxqv7TXAa0rdxctSEmbPMKH9X7ucIwt8cG?=
 =?us-ascii?Q?+gKnF4RuAhX+OdKGgVijy01gNOpCRR6035LxEaBzPngpNIqNmtDZsd8IAAmy?=
 =?us-ascii?Q?L8kYMTfHL0mhvCwgnFOOdS/Vn1/q7xLFvE5jqawF0Fg4Btfdek8IxFx4eS61?=
 =?us-ascii?Q?/qd4af67rLGgaveH5tEyrTiXRSsc3Ax5xSjPFDwCnb7k7Aj/nKeaxnmJioHL?=
 =?us-ascii?Q?WjxvGhVXYr4Y5a8Twjru0ptij3vGih/s?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 728bcf40-2e38-4636-5abc-08de2c220746
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|35042699022|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kWapF7ew5K+yLWE1+NEKWzH0tK/pY2l/z6BrDaMNfSlU8xmNbRkjsDp60QOL?=
 =?us-ascii?Q?kICaWBsVFpARgrWLCb7XE6bpYHaZwLZ6k9PIt7OpP8M9eevcRy9bTRTw3+9i?=
 =?us-ascii?Q?n1QjGCPcER30CJzCzW4yYHgleaihz97mlf7a8czuUxPU5jeY88vCe1FKFArh?=
 =?us-ascii?Q?ler5ImktaqUaOaqTfYeh3RbE7MSOHKK1Fp9J20c7gyWs5wCzmhLVtUm8a41e?=
 =?us-ascii?Q?b6cED/qMflBbRr2jlXfR2aHGJ9ogU4RLWDBr754ZX96p4rNTullNQQ+py4pO?=
 =?us-ascii?Q?dn1HDRARBKoTbXVgJP6fFPkHw1zcON+XlrlyOB5nMgQa1qdmeyPUD6Gk53qF?=
 =?us-ascii?Q?KGDwX6Iv9JHkuU4NWNuKQrOgTl/nXS1MS8dmXkIDqtzNmgTeEoGXHZPwAOwi?=
 =?us-ascii?Q?RAhfywVUeY/2UQ/zjLbnP5uUKvXbfYz15mhzL5+ER71yzuxpuu5JsBjZNokL?=
 =?us-ascii?Q?BxDhG3Fwi+CDuoTSwgm7qY+PcrY34bJsOSYQzofjBB+srk1+4BXfrdVogvk4?=
 =?us-ascii?Q?4qSi7BY8Db8a9zsgTjqY7tXXHNtO/aKoGAYtE3EdXY+nJt1sKN9dO+B10mOv?=
 =?us-ascii?Q?/yxb3efxT88GsVNfWq0xnvz2X0s+jO+sCl5OmshG0nwdyUIkJ0DHRBRJXmhx?=
 =?us-ascii?Q?NlLbMbjpfB0mJOuvDB6gL6jMM9Azhd7zK0KpaBjPd96m8HCz20tYrdl90zVJ?=
 =?us-ascii?Q?D4jRb+XW1HmWWzMC68u3N1exg1vS9pwyBZEWgaNQcZlvMZfq9/+/7aP9dTOE?=
 =?us-ascii?Q?6ijvTvB31zZs583wrbJ+iIKoRF7v5v5fwwPpCDWiT009QA4q4uJMJi+CfXz+?=
 =?us-ascii?Q?4OHyC2OSZRl7Bk7GV5ygKsew3UQLVLlKiNQKU94jZ2TCOKiGT26CVU0IsdkQ?=
 =?us-ascii?Q?2pbx65DqkFbkEW3IGesHs1l3d2tg9B5600j+aHf/rOR72sThSXOH5eGdDDvx?=
 =?us-ascii?Q?kDlTFNSK94xyWpcFTmpl1G0MC6YUZREiAMBDHwLaoz1ktQf0YHjX7lWhPYwa?=
 =?us-ascii?Q?eDKZ3u1c2fs7NKndhM2AKAoJ0wYeWz96b9XbToqR2gGHulYNSxb0F+zZoWiA?=
 =?us-ascii?Q?z1/0nP9e5fSXRf8CQ6FKJPVz/POR25jWlUYNqKRrn+T78XFpRQM/aTOJgE11?=
 =?us-ascii?Q?fBRU3M+ej6QWQ6Z4Ip7WsYY4lX5Jl1Vm+b7DBu/MmZZUX5npyfxIixyG7oey?=
 =?us-ascii?Q?mkJtB6tKeKn465ClF5Aaf3n9pRD2C0MRMKLsgkYkiI+BYai14gkPrTE3Kkdk?=
 =?us-ascii?Q?2lUqdClW2xwF+WVzy6ZLu6KkxcPq/cCNluZ3jgD8NIGA4uJX8UPukXKLdtCn?=
 =?us-ascii?Q?xtA85c52V8JsVIBEVn6Lr2US/NeXvd4EiVxK/sNtAsVxwAhKs/ExuFRHBn36?=
 =?us-ascii?Q?4W7SECNbNYe3BlbQkcnOagyiAjbiTizEuQ25Rgp7VpuTkc5Uj+GhCWOtdhZZ?=
 =?us-ascii?Q?Jqq0yRZQU46G7ZfwgGBsi5QnYADAhkVNIoj6g/jNpBeZfT6gbQn99Ko5qdpG?=
 =?us-ascii?Q?43HJdgfxJaCtruKt6kImODcZZECGCA5TVqtfnhn7T8S4uXxNUryke7r7lWJo?=
 =?us-ascii?Q?DJzSj3KpvvGpN9Zh09o=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(35042699022)(376014)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:56:52.5314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfd83d0-9819-4b7b-bee0-08de2c221afb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11450
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

Add the new panthor_pwr module, which provides basic power control
management for Mali-G1 GPUs. The initial implementation includes
infrastructure for initializing the PWR_CONTROL block, requesting and
handling its IRQ, and checking for PWR_CONTROL support based on GPU
architecture.

The patch also integrates panthor_pwr with the device lifecycle (init,
suspend, resume, and unplug) through the new API functions. It also
registers the IRQ handler under the 'gpu' IRQ as the PWR_CONTROL block
is located within the GPU_CONTROL block.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v5:
 * Picked up R-b from Steve.
v4:
 * Reintroduced include for panthor_regs.h.
 * Add include for drm_print.h
v3:
 * Turned panthor_hw_has_pwr_ctrl() into a static inline function.
v2:
 * Removed stub functions.
 * Updated BIT() definitions for 64-bit fields to use BIT_U64() to
   address kernel test robot warnings for 32-bit systems.
 * Moved GPU_FEATURES_RAY_TRAVERSAL definition to the next patch where
   it is being used.
 * Drop the use of feature bits in favour of a function that performs a
   GPU_ARCH_MAJOR check instead.
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  14 ++-
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_hw.h     |   6 ++
 drivers/gpu/drm/panthor/panthor_pwr.c    | 121 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  17 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  78 +++++++++++++++
 7 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 02db21748c12..753a32c446df 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -10,6 +10,7 @@ panthor-y := \
 	panthor_heap.o \
 	panthor_hw.o \
 	panthor_mmu.o \
+	panthor_pwr.o \
 	panthor_sched.o

 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 0ecf552caa5c..e133b1e0ad6d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -21,6 +21,7 @@
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_mmu.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"

@@ -113,6 +114,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
 	panthor_gpu_unplug(ptdev);
+	panthor_pwr_unplug(ptdev);

 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
@@ -268,10 +270,14 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_rpm_put;

-	ret = panthor_gpu_init(ptdev);
+	ret = panthor_pwr_init(ptdev);
 	if (ret)
 		goto err_rpm_put;

+	ret = panthor_gpu_init(ptdev);
+	if (ret)
+		goto err_unplug_pwr;
+
 	ret = panthor_gpu_coherency_init(ptdev);
 	if (ret)
 		goto err_unplug_gpu;
@@ -312,6 +318,9 @@ int panthor_device_init(struct panthor_device *ptdev)
 err_unplug_gpu:
 	panthor_gpu_unplug(ptdev);

+err_unplug_pwr:
+	panthor_pwr_unplug(ptdev);
+
 err_rpm_put:
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
 	return ret;
@@ -465,6 +474,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
 {
 	int ret;

+	panthor_pwr_resume(ptdev);
 	panthor_gpu_resume(ptdev);
 	panthor_mmu_resume(ptdev);

@@ -474,6 +484,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)

 	panthor_mmu_suspend(ptdev);
 	panthor_gpu_suspend(ptdev);
+	panthor_pwr_suspend(ptdev);
 	return ret;
 }

@@ -587,6 +598,7 @@ int panthor_device_suspend(struct device *dev)
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
 		panthor_gpu_suspend(ptdev);
+		panthor_pwr_suspend(ptdev);
 		drm_dev_exit(cookie);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f0b143732ea0..f35e52b9546a 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -29,6 +29,7 @@ struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
 struct panthor_perfcnt;
+struct panthor_pwr;
 struct panthor_vm;
 struct panthor_vm_pool;

@@ -138,6 +139,9 @@ struct panthor_device {
 	/** @hw: GPU-specific data. */
 	struct panthor_hw *hw;

+	/** @pwr: Power control management data. */
+	struct panthor_pwr *pwr;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 64616caa6f05..56c68c1e9c26 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -5,6 +5,7 @@
 #define __PANTHOR_HW_H__

 #include "panthor_device.h"
+#include "panthor_regs.h"

 /**
  * struct panthor_hw_ops - HW operations that are specific to a GPU
@@ -47,4 +48,9 @@ static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
 	ptdev->hw->ops.l2_power_off(ptdev);
 }

+static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
+{
+	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
+}
+
 #endif /* __PANTHOR_HW_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
new file mode 100644
index 000000000000..66dc72b29116
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/wait.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_pwr.h"
+#include "panthor_regs.h"
+
+#define PWR_INTERRUPTS_MASK \
+	(PWR_IRQ_POWER_CHANGED_SINGLE | \
+	 PWR_IRQ_POWER_CHANGED_ALL | \
+	 PWR_IRQ_DELEGATION_CHANGED | \
+	 PWR_IRQ_RESET_COMPLETED | \
+	 PWR_IRQ_RETRACT_COMPLETED | \
+	 PWR_IRQ_INSPECT_COMPLETED | \
+	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
+	 PWR_IRQ_COMMAND_INVALID)
+
+/**
+ * struct panthor_pwr - PWR_CONTROL block management data.
+ */
+struct panthor_pwr {
+	/** @irq: PWR irq. */
+	struct panthor_irq irq;
+
+	/** @reqs_lock: Lock protecting access to pending_reqs. */
+	spinlock_t reqs_lock;
+
+	/** @pending_reqs: Pending PWR requests. */
+	u32 pending_reqs;
+
+	/** @reqs_acked: PWR request wait queue. */
+	wait_queue_head_t reqs_acked;
+};
+
+static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
+{
+	spin_lock(&ptdev->pwr->reqs_lock);
+	gpu_write(ptdev, PWR_INT_CLEAR, status);
+
+	if (unlikely(status & PWR_IRQ_COMMAND_NOT_ALLOWED))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_NOT_ALLOWED");
+
+	if (unlikely(status & PWR_IRQ_COMMAND_INVALID))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_INVALID");
+
+	if (status & ptdev->pwr->pending_reqs) {
+		ptdev->pwr->pending_reqs &= ~status;
+		wake_up_all(&ptdev->pwr->reqs_acked);
+	}
+	spin_unlock(&ptdev->pwr->reqs_lock);
+}
+PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
+
+void panthor_pwr_unplug(struct panthor_device *ptdev)
+{
+	unsigned long flags;
+
+	if (!ptdev->pwr)
+		return;
+
+	/* Make sure the IRQ handler is not running after that point. */
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+
+	/* Wake-up all waiters. */
+	spin_lock_irqsave(&ptdev->pwr->reqs_lock, flags);
+	ptdev->pwr->pending_reqs = 0;
+	wake_up_all(&ptdev->pwr->reqs_acked);
+	spin_unlock_irqrestore(&ptdev->pwr->reqs_lock, flags);
+}
+
+int panthor_pwr_init(struct panthor_device *ptdev)
+{
+	struct panthor_pwr *pwr;
+	int err, irq;
+
+	if (!panthor_hw_has_pwr_ctrl(ptdev))
+		return 0;
+
+	pwr = drmm_kzalloc(&ptdev->base, sizeof(*pwr), GFP_KERNEL);
+	if (!pwr)
+		return -ENOMEM;
+
+	spin_lock_init(&pwr->reqs_lock);
+	init_waitqueue_head(&pwr->reqs_acked);
+	ptdev->pwr = pwr;
+
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
+	if (irq < 0)
+		return irq;
+
+	err = panthor_request_pwr_irq(ptdev, &pwr->irq, irq, PWR_INTERRUPTS_MASK);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void panthor_pwr_suspend(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+}
+
+void panthor_pwr_resume(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
new file mode 100644
index 000000000000..b325e5b7eba3
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_PWR_H__
+#define __PANTHOR_PWR_H__
+
+struct panthor_device;
+
+void panthor_pwr_unplug(struct panthor_device *ptdev);
+
+int panthor_pwr_init(struct panthor_device *ptdev);
+
+void panthor_pwr_suspend(struct panthor_device *ptdev);
+
+void panthor_pwr_resume(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PWR_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8fa69f33e911..e47a89f24900 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -209,4 +209,82 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0

+/* PWR Control registers */
+
+#define PWR_CONTROL_BASE				0x800
+#define PWR_CTRL_REG(x)					(PWR_CONTROL_BASE + (x))
+
+#define PWR_INT_RAWSTAT					PWR_CTRL_REG(0x0)
+#define PWR_INT_CLEAR					PWR_CTRL_REG(0x4)
+#define PWR_INT_MASK					PWR_CTRL_REG(0x8)
+#define PWR_INT_STAT					PWR_CTRL_REG(0xc)
+#define   PWR_IRQ_POWER_CHANGED_SINGLE			BIT(0)
+#define   PWR_IRQ_POWER_CHANGED_ALL			BIT(1)
+#define   PWR_IRQ_DELEGATION_CHANGED			BIT(2)
+#define   PWR_IRQ_RESET_COMPLETED			BIT(3)
+#define   PWR_IRQ_RETRACT_COMPLETED			BIT(4)
+#define   PWR_IRQ_INSPECT_COMPLETED			BIT(5)
+#define   PWR_IRQ_COMMAND_NOT_ALLOWED			BIT(30)
+#define   PWR_IRQ_COMMAND_INVALID			BIT(31)
+
+#define PWR_STATUS					PWR_CTRL_REG(0x20)
+#define   PWR_STATUS_ALLOW_L2				BIT_U64(0)
+#define   PWR_STATUS_ALLOW_TILER			BIT_U64(1)
+#define   PWR_STATUS_ALLOW_SHADER			BIT_U64(8)
+#define   PWR_STATUS_ALLOW_BASE				BIT_U64(14)
+#define   PWR_STATUS_ALLOW_STACK			BIT_U64(15)
+#define   PWR_STATUS_DOMAIN_ALLOWED(x)			BIT_U64(x)
+#define   PWR_STATUS_DELEGATED_L2			BIT_U64(16)
+#define   PWR_STATUS_DELEGATED_TILER			BIT_U64(17)
+#define   PWR_STATUS_DELEGATED_SHADER			BIT_U64(24)
+#define   PWR_STATUS_DELEGATED_BASE			BIT_U64(30)
+#define   PWR_STATUS_DELEGATED_STACK			BIT_U64(31)
+#define   PWR_STATUS_DELEGATED_SHIFT			16
+#define   PWR_STATUS_DOMAIN_DELEGATED(x)		BIT_U64((x) + PWR_STATUS_DELEGATED_SHIFT)
+#define   PWR_STATUS_ALLOW_SOFT_RESET			BIT_U64(33)
+#define   PWR_STATUS_ALLOW_FAST_RESET			BIT_U64(34)
+#define   PWR_STATUS_POWER_PENDING			BIT_U64(41)
+#define   PWR_STATUS_RESET_PENDING			BIT_U64(42)
+#define   PWR_STATUS_RETRACT_PENDING			BIT_U64(43)
+#define   PWR_STATUS_INSPECT_PENDING			BIT_U64(44)
+
+#define PWR_COMMAND					PWR_CTRL_REG(0x28)
+#define   PWR_COMMAND_POWER_UP				0x10
+#define   PWR_COMMAND_POWER_DOWN			0x11
+#define   PWR_COMMAND_DELEGATE				0x20
+#define   PWR_COMMAND_RETRACT				0x21
+#define   PWR_COMMAND_RESET_SOFT			0x31
+#define   PWR_COMMAND_RESET_FAST			0x32
+#define   PWR_COMMAND_INSPECT				0xF0
+#define   PWR_COMMAND_DOMAIN_L2				0
+#define   PWR_COMMAND_DOMAIN_TILER			1
+#define   PWR_COMMAND_DOMAIN_SHADER			8
+#define   PWR_COMMAND_DOMAIN_BASE			14
+#define   PWR_COMMAND_DOMAIN_STACK			15
+#define   PWR_COMMAND_SUBDOMAIN_RTU			BIT(0)
+#define   PWR_COMMAND_DEF(cmd, domain, subdomain)	\
+	(((subdomain) << 16) | ((domain) << 8) | (cmd))
+
+#define PWR_CMDARG					PWR_CTRL_REG(0x30)
+
+#define PWR_L2_PRESENT					PWR_CTRL_REG(0x100)
+#define PWR_L2_READY					PWR_CTRL_REG(0x108)
+#define PWR_L2_PWRTRANS					PWR_CTRL_REG(0x110)
+#define PWR_L2_PWRACTIVE				PWR_CTRL_REG(0x118)
+#define PWR_TILER_PRESENT				PWR_CTRL_REG(0x140)
+#define PWR_TILER_READY					PWR_CTRL_REG(0x148)
+#define PWR_TILER_PWRTRANS				PWR_CTRL_REG(0x150)
+#define PWR_TILER_PWRACTIVE				PWR_CTRL_REG(0x158)
+#define PWR_SHADER_PRESENT				PWR_CTRL_REG(0x200)
+#define PWR_SHADER_READY				PWR_CTRL_REG(0x208)
+#define PWR_SHADER_PWRTRANS				PWR_CTRL_REG(0x210)
+#define PWR_SHADER_PWRACTIVE				PWR_CTRL_REG(0x218)
+#define PWR_BASE_PRESENT				PWR_CTRL_REG(0x380)
+#define PWR_BASE_READY					PWR_CTRL_REG(0x388)
+#define PWR_BASE_PWRTRANS				PWR_CTRL_REG(0x390)
+#define PWR_BASE_PWRACTIVE				PWR_CTRL_REG(0x398)
+#define PWR_STACK_PRESENT				PWR_CTRL_REG(0x3c0)
+#define PWR_STACK_READY					PWR_CTRL_REG(0x3c8)
+#define PWR_STACK_PWRTRANS				PWR_CTRL_REG(0x3d0)
+
 #endif
--
2.49.0

