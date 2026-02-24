Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHouAJrpnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868C18B0A2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F6910E60A;
	Tue, 24 Feb 2026 18:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="CL25UWVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB26B10E60C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 18:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZGE45PSTWdUd9rpA8E7XbcrGLZmkpq4be4u31Ghke4o0hmoRhDK4vCFSSwJ6GUztiiOs3nSaS+juqEw0Ra7VrYJUUj+yh5RDG48g1cO5Zl7Ge4jrVKOo0a6d0tlq9ASzXr88uyg5QIVUzqeYhSlkyVNKbmtIj4fDmXri6iGSHGZ2w69Fnkori56Z6T6TTsK6pWGWKKGBlP1IyAf88GPnRUaK5GE3o+dFm7EVwGybf7JCVcJvO6vq4wDUJ6n9zO+2GADr0byjH3mkNefYGe/qimlBTTFGhnCzzHYftnMkmuPcRC/Jii3CatkpaL1EDVQc72lPPcT3xWLRTjrga7ikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/a5mKuw5AS6jnK/y5UxuaEDvLXRNvbjiD0qu7Bigxk=;
 b=qhP4+sm2OBGvqFR9Zew02InnKV2ojhrZOnFGoo0hioIW2mMEBE1tFVQlDodDmgMwHrqk+/MuI6n/KO0l/9X5GUj6aZzRIoiU+sYUMmgOXKte3+e7qp34cWjN8U1g9niH87KiXfH6kgOx4tcBboX4LpMFXpn+8XX/ZCDHNh1vd1hSqDnMVsLVfrX3AphLojxoVLbp3+CzTIiAjBCy28k+WqD+0Od4h9b8KWG6YNAh+laXRkhlKhot0M+qM+y/B2abWhkQKMsFf+m4A8qPAO4U2ZmngOfKTqMVVqstG5FBV1WmK80pwawwD8NWpLW9bAucYh7slEXHElXhtxe6kOEZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/a5mKuw5AS6jnK/y5UxuaEDvLXRNvbjiD0qu7Bigxk=;
 b=CL25UWVtcn5awzERxPEiaxcQkgHKeikrraXqZK/f/uYnIfjFMZtSqw35tUXC9n0MGvrLvMe5WAc4umSS/DwUl4akgRFH3AR98kWoWX1qTt27Jb46MzW1leE91NEAL+CaMRTBvbYX+j31bfI1UpMdONDUQeNpoRQv+Mf+uk4hZ24=
Received: from BN1PR14CA0021.namprd14.prod.outlook.com (2603:10b6:408:e3::26)
 by DM3PPF9E376D9DC.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Tue, 24 Feb
 2026 18:10:23 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::be) by BN1PR14CA0021.outlook.office365.com
 (2603:10b6:408:e3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 18:10:23 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:10:12 -0600
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com
 [128.247.81.112])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIABBW3186529;
 Tue, 24 Feb 2026 12:10:12 -0600
From: Antonios Christidis <a-christidis@ti.com>
Date: Tue, 24 Feb 2026 12:09:17 -0600
Subject: [PATCH 3/5] arm64: dts: ti: k3-j784s4: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-gpu_dts-v1-3-cc5ddffe140c@ti.com>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
In-Reply-To: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Frank
 Binns" <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-clk@vger.kernel.org>, Antonios Christidis <a-christidis@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771956611; l=1133;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=ZEGXcD9RiCkkCSNbGGtAJ4lyP/lyoBhmFfDbCbyu7ps=;
 b=uBFSJrdkTUlEAECypB75dO1RJWpSuqJ4lB9uv3U8pNgrn4SqcEsQ85es9Izcg6rdb4AHLf3Mc
 lA9zS6u+da/ChX1UJ18I5ni637vE0aG5pCR3Hm88mqid3Dbj625Yv8m
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DM3PPF9E376D9DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 97be5ce0-85c8-43f4-94a6-08de73cffab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFRlc29QMkVCS0w5dlZEQU1JbFJrL0NxbTZIbDhhVWk4OUVPcml5OXlLUnh1?=
 =?utf-8?B?U3I1SzdSL29zU1kvSjlxNlB6bmtvVElTeEZWNkhwbmRpWm81Q3ZIazRHbUFa?=
 =?utf-8?B?NTV1WmptcUNxZXZnTWRQWFdMNEZJbUw5dWY2L2RhWG5Kemg2ZUxzQWpMQjR4?=
 =?utf-8?B?ckhZNERVbkVOMGNMYW5nalhEL1VmN0QzMFB5aGU1Znk0YUdmbDBZVm94MWxU?=
 =?utf-8?B?R0lyTVVVbHlQRmJJYWtoMUVSQXJPU0pSSGRXdjlUd2hKa2czc0hJeGE2MmRS?=
 =?utf-8?B?c2xKWjhlMTZIYzV1T3BsM0xFRGtudk44N3FtMU13eGd5a3BpSjd6b3FCelE5?=
 =?utf-8?B?SUZxYVpVVTFPL0lBbVlCNzUwYUNHNUsyQmV1QUFVcXRLd3d0WkswL3dJTVUx?=
 =?utf-8?B?dUZ2K0g3RWM5MmpLVkF4SmxRclFEWjAzK2pWRU1VYlFvdWdaTng0cHVjcE9m?=
 =?utf-8?B?VjJUTm13QUczUm9OelBrU2hFc0lYSHFlUVVoL3lMQkZqWXZyL0ZIVGIyTUJZ?=
 =?utf-8?B?RDZxWFhEOFZlVjBUeElzc253TEZDcWlmTk1MTHMvSnppR2hjYWphZzM5anRE?=
 =?utf-8?B?VmFTajNvT1cvK2VrNUZjczNhUStwQ1AxK1MyRnU2Y25nZUJmN1lRQ0EvYjQ4?=
 =?utf-8?B?c2ZNbXIzcFFkd0E4Q3ZrdGpWTk9Ray9CSlIwU3p6NkxWTXVIM3YzVXl1WHNX?=
 =?utf-8?B?ZXQzOVQ1WllVY2QyQVBGL3hTRkJYUElxMlE3Vlc3UHFiOGQzb1V2UUFCMG5v?=
 =?utf-8?B?Q1Q2S3lOSmFWZGFzK2paYTJPOFdlMVMrUUh4cUhXZlhjUkphNjE1VisrOUFB?=
 =?utf-8?B?NnliYnh4MzlTNE5ydWhXcGdLU1VzWUNDOGJXMzdMYnJvTUtrc0NBaURKcndp?=
 =?utf-8?B?OFBLNzkzaWVtWStXZVFKK05JZXpEY3VkQUJuUGRVcUdQdTljWStFeG1HbU9j?=
 =?utf-8?B?Nk5rRkdtMyszSU1jbW84blVlZVVtNFJ0MWFKNThWcjZkS0gvZll0b3JOamlN?=
 =?utf-8?B?VCtVNFhIQ0hiYnhTbE4yeG9Sci9ZRDlvVzYvSG5qa1Jpb3prS3JNOWd5TXY4?=
 =?utf-8?B?d25KbkRNZzdQc0VHZXY4WXFOMjcyUWVwdFJMQ1Q3RXM2OG81NU52akVUVzRB?=
 =?utf-8?B?czVPemtPUUNTb3loN203SWRieFYwSkp4SXdrOWdhLzlPclBPVCtXc0ZtaWt6?=
 =?utf-8?B?NHJNRjdrQVZmU1J1ZjE1VHBTYjZDbkVvcWplVUR4Q0pGcHQ2b2xTYjNUUUNS?=
 =?utf-8?B?a3kzR0NrSlE4Yy9XRkhFU3hpeDZFc0dkb1lqczIvYVhHbS80ekU2T0lYSzNn?=
 =?utf-8?B?UUtqc1pXQndhaE8rVjJUaEcvMXY3SEJUZXIxaUY2ay9jZFhLMWxGNHJHRFlX?=
 =?utf-8?B?L1lKV1I3NXVDZ3dURm5PMTVqczNVWjArbURiYXMwcHI1N3dncHJYK0RVcFFw?=
 =?utf-8?B?bVhTOHdPS1R4MkxFRVluclVTZ1pyWG9xVy9NNW5uT3o0NEd2TGVhcHltTGVw?=
 =?utf-8?B?WkxNRnQyVS9vcS9JVW1zcWw2bzFmNzJZL3JYN0tzTmtXNFEyNkxIbG44Y3Zq?=
 =?utf-8?B?Mk52ZkV0YjFoOVlScThZYnBLMEtHbElJOWhqREVZQk9ZSDBHTUNyMkhvRStF?=
 =?utf-8?B?RHhQbGF5VFZCVnNpTHlSYTg1NjNBanRiMklldGNjdWZKV09jMWlsWEVEaDhN?=
 =?utf-8?B?MmlDUllYdjZLbEVOY3lmZHN3bFpzSXp1QjBJQkovVVZsMlE2cS9tT1pteEJL?=
 =?utf-8?B?RkhDWDVMZU05K2EyNUNsb2toSHZRa1ljQ1RJTEo2TzA4ZkF3NGFKZ2JHbkhF?=
 =?utf-8?B?eWJBUzM3OGJYWjJOTTk2VmxUQ21SejlLa0JlY2ZLQ1BNU1hwYjB1ZVpSY3c5?=
 =?utf-8?B?aGFiME1JL2M0aS8wTGc5Z0FRWXhYai9mNU8yTVVaT3FQa2E4ZXg3aUxPYXkx?=
 =?utf-8?B?YlVPNDcxOTRXcHRvSzJFOVRPN0U2WW1PK1p4U2Qrc0VrT1dlVE9VbGlzeGtY?=
 =?utf-8?B?WFBRQ3oraVNWNFdwTU9Db0tEb1BPTEdMelFPSC9TTzJZb0M2TDBMTHZFbVp6?=
 =?utf-8?B?S09ZQVBpRW9qcjJiMXpHdHQ4dDF3Z0Q2c3NRd1AweXZPMDMrZ2cvSU1CbTNJ?=
 =?utf-8?B?RmlQZS9PdXZGdVQrUWw4K2FXOUFvSSthVFNsbXdJRDhhb0hSNHlQYTN6NWRr?=
 =?utf-8?B?Zi9xVk01dTJGT0ZpNXJWZnE0QjBjUUxxWXlZUE5pdHVOdFcxSU5qdUtrYTJ0?=
 =?utf-8?B?blpSckY2ZjE3a05Gbm1FVGhKRitRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qDDGxh8VW8DDho533WG+CzNPX3iZpepDdHRqZDsZP8Xqu9s1er7hPuOQLqyVbx18uaV+SbnyGDdTN2l9m0eydyilMZXVX/Wyqecma7Eom2xrQL/02C+UvGv9ZdcEzqHNJwJKfr6YxZblDuvU3SCXSIZjtjXDdXExt4dZBf6CJfFxkg0ESqMfjyOP0RCsLdTn9LzwYJ4sPkioioANoh6eebG+WP5mEW4HtoCAIdH86S3j/3v7Dp3Jg2OhOZhrcBojzqcYRvA/H4HSzEOuN5hAXKhlvYx6ypjY9+wvoW8T+tIkdV1NiP75owVkICLt++8E0PQoMBrXc5dWBHm15qUMc2ROO3BPjb0dsXEAMzP/kiyS4GST0dsYjx1HMavTmD9PY+BqOiOXWEQAkn69QVFwC7CVCS5LsQa4u0TRX6D5Fh+D3JUFZRAPx5wEsrhYpucN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:10:23.3523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97be5ce0-85c8-43f4-94a6-08de73cffab4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9E376D9DC
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:a-christidis@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,4e20000000:email,0.76.153.96:email,4.10.139.192:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5868C18B0A2
X-Rspamd-Action: no action

Add the Series BXS GPU node for j784s4 device tree.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abc..ddb9385cd942 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -137,6 +137,20 @@ serdes2: serdes@5020000 {
 		};
 	};
 
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 181 1>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 181 1>;
+		assigned-clock-rates = <800000000>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 181 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
+
 	c71_3: dsp@67800000 {
 		compatible = "ti,j721s2-c71-dsp";
 		reg = <0x00 0x67800000 0x00 0x00080000>,

-- 
2.34.1

