Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B724AEBA64
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 16:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D81310EA4D;
	Fri, 27 Jun 2025 14:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="CweWkL2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023142.outbound.protection.outlook.com
 [40.107.162.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145CE10EA4D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 14:51:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qvx5Vl2WDhAQxudoPAQablb2HP2O9O9BWrkBGu3iPqB8ZRmmIJD5Vox3aV42Sk18sdIZ4Li3s2BXISgTvIZKsxxMrt+jP4VYnDM9IbOc1/XjrtLZ9zmjtzOcgNihQ9pLHfA7zGbFTtKBKvNbREnIF5YXYE4EmEDkZFko3wHrAy72hyS3jcBAlZg5HA7ds2zW/6D93ZX4KHwzUoH1oZsvpq+Fp0L7sQ7MTcwhf+mcFoUS4cEyeYpLxjJifSghwN/SkzvedrTh6Co1bd8H3xnwIqoeJuSvQT/HQCbxn25/ETAqLhlnWTXAJ6yKv4p0fOu4635vfFuh0pOMl8/bIGyaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZTXepwSzwTR/5+AzyiWN3NcPfBWsCpkN2h1AetbNAc=;
 b=JfHCoaKNXGQo+kVyUDVM1uq9icwt5vu7CRisMVhhPXXvfc5tHD+yl29+l38rTWz/i+xVvgmwqsbWghyLPR5n7gRT7MJ0nPcQZwsr9FQQZ7r3Xyb9BoqBMZ5haqVZ33Vwf2OgVjgIPyT8mRaYnJruWWbPseGqi1wvVp0nlTWKHoZM40JxVOC0b9NUgt8AsrsvOjScaxLuSOFUERIgq4CU5B7NCxQYud46exWAxNiVFEz5CbGXB0H6RFTLtnkXJ1/twHb66XOQlqLunA2wpVr/ctfGxHl/XzgS6Qk0HipUlB1GHfyx0hU7AsxV09dg3d56TO9IJuhKLrWslpVDUMfYlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZTXepwSzwTR/5+AzyiWN3NcPfBWsCpkN2h1AetbNAc=;
 b=CweWkL2Iy7x9QlmwtoiGt3fopzYFQ2TmWAgIcCFKEvQQRzydakFp/dFMKuae1AONFvxo/CAmWSwnnQ/4GFBkOVbiN/kAOEGawrSZmHHwgtyx1WeZSKcrG5l9i+8vzCP90uXSpOjL+c5DTDVcCDvt6TFLnlvrFA0oGG8EUwQYnwhZv9Av1mpmcnHv0K6it4tEHTh0KUdq5KsOGT6Nr+2t3DsPB6/24RamI2D2oXHIes5qLboRh0yQezOzoOBGjL+DE8UmDqR0m/4gTKK02RWxIeQlLEnV/9PX2vWbO56+nc+LggRorgXsuWLQce9h4AEnDIh3oqLPKewUlCoHxbWBEQ==
Received: from DU2PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:10:2b0::33)
 by AM7PR04MB7189.eurprd04.prod.outlook.com (2603:10a6:20b:116::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 14:51:14 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::9d) by DU2PR04CA0178.outlook.office365.com
 (2603:10a6:10:2b0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
 27 Jun 2025 14:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 14:51:12 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com (40.93.69.26) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Fri, 27 Jun 2025 14:51:11 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU4PR04MB10744.eurprd04.prod.outlook.com (2603:10a6:10:590::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 14:51:08 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 14:51:08 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Date: Fri, 27 Jun 2025 16:50:46 +0200
Message-ID: <20250627145058.6880-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0039.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::16) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU4PR04MB10744:EE_|DU6PEPF0000A7E0:EE_|AM7PR04MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6c5ea2-fe75-44ab-559c-08ddb58a0fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZWK5HsjuB0MtWGy6Fh2SErgEaiMWr5ZaD1NuVwxM+CijIbZGGoXc2X1kP/5o?=
 =?us-ascii?Q?UVOnJePqDbnuopYErGlMPBrKzmqIfirt0IfTUk10jAoL1/BzusGc2h+I3xb0?=
 =?us-ascii?Q?kp7oy4Vjtf3DOXca7kg+UeooNAmiInrBqj9E+jixSzhVRMs3oF9TAeStVQSj?=
 =?us-ascii?Q?ERYwRl/ZvFpBaOllSGG7bZLnkByGpnCGAeuLSnT4htsI5V+34NVT5BaYT84h?=
 =?us-ascii?Q?YjKtHyfiT8oC/TfsFU6n/Mzb1PtxY5D04/+jJtDi/X4xKih6WP3rjG42m15l?=
 =?us-ascii?Q?EXyBVE4hbGxLw9+alUq3ZcgR7RwxIedOYQCDJUrYZWAGG7u89E0C6+kbCcLk?=
 =?us-ascii?Q?2hFuRTM3RtTc6XSMAjdsqxjF0ztmomIcfeaF0T1SzdGlYx6pD/kbe01emZTa?=
 =?us-ascii?Q?esc07GvBKsPe+8k3hUl4om3JaHzq6o0ALFGruHOtBvjVJgkFIW5l+tOOM9Ye?=
 =?us-ascii?Q?rSMDeEwNXKvw5cMp/do2jmAboYSyvKvcYKkeRTHCBCiflWYelbJSKtjisspN?=
 =?us-ascii?Q?DUliWKx+GrF5WI0FFET4hvrOwIkjCAUnl/zj5QX21kQwuK3UBTEorYLR/qKX?=
 =?us-ascii?Q?s3S9HJMKj+3C+2ndujqV59PZKSbF4U2DTCrAogc+usxzK1OE7khEKQTERFTD?=
 =?us-ascii?Q?0PL4abg9FwrirZC0y9ngkUWCl+0+G83whsnEFEXJbPUrjwyS4mUUx0HPTeaT?=
 =?us-ascii?Q?xUPA3FmuFOPsu8RkICW8Ic75vt56mQPnKuxmDuXqpyvguJW2xJ8iLG2XwUdI?=
 =?us-ascii?Q?5T6p6CRtLg0cUNNBZhncd6APbZjNCNuOfKoQ8eB6kyAxZyeWH+KtipxkCjdU?=
 =?us-ascii?Q?obQmlAzxSJx6q0WY0fgb1hKI8CI6dEK6hh0tF1/f45ErSQVOZ6Kd9OhTa/yU?=
 =?us-ascii?Q?HP651M50fKj7iGOZ9rfWkjwfqAOf+D/ARZ8zo0XZsTFSds7AoGiP6T43Cxee?=
 =?us-ascii?Q?HXUKtiiidBv6pADxqbLCCk53p0uw+IJuy8SKHzksPiN1YndKla8lQJ4TrFVX?=
 =?us-ascii?Q?fHihkaIBxrV9xGsvYrAirosS4atPiAKhZW5A/aNcBcZkG39hmELqap4zGCuA?=
 =?us-ascii?Q?15Osp9OsR6awGZP0Zp2WJq5i2VWX9f46VuysfnrKDYq9irIfkYF8nETBrNT4?=
 =?us-ascii?Q?xnRhDvApDWaMUwdXQ900MtkDceBO84pl8f6PZT/pPKRTsh/rRJjBdzmfW5Y6?=
 =?us-ascii?Q?HHLQ7ViGqbsWdn920rBBjtkBo/BMojb75J/7R+KSQ+KFHm1ve9Qc0a2/TDHC?=
 =?us-ascii?Q?ojjKCJDLUFgbFiyRTqkrMGeLimj7dxhNsgeQv6N3zFbkVUFGAtr+M6xT4lKo?=
 =?us-ascii?Q?5wWCC5+mb/z06HKyNbEemJ/iJBlA9EXoSk4/gD6tmy8zFrZMK3OYhwJJrlEV?=
 =?us-ascii?Q?eY1kTAzkLSgpu3eiZbWbOWGLmR5DYLo5SBRkVWiYjqxnJkZuIWlY50xl1n6m?=
 =?us-ascii?Q?bjFYi1YvaplnVHApo+AZGEfYo7zR/cHi6pERn6ttKlrmCJmTx8MmUA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10744
X-CodeTwo-MessageID: 9306aa3e-5fdc-4f61-9e7b-c1ff678c0019.20250627145111@westeu12-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ed38b64f-ebf4-47f0-01a7-08ddb58a0ccb
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|82310400026|376014|7416014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nxsskxYUmBQLSB2QN2AJLNFZ6QSEfu+7GWAFm5QDPgjIsF7GUPYlsfL+ftWc?=
 =?us-ascii?Q?TuoGtHuAY+4Aw31Hnb+qeg07eh923jCSOn+JJXeNfVP1Wb2LRzyA/GDags8n?=
 =?us-ascii?Q?4lhxy3LDIgCzHyNveXh3o8CUxysDFYw5dqVWE4zQMZJqzXSknET5oyW40LRE?=
 =?us-ascii?Q?5ZudNnrglvaNaU0n2/HI8CKqMLH5lg8Ur7hQaFGjvHs/qle/tIxE0wCRUGPb?=
 =?us-ascii?Q?ePUzgwuQen+pEpG5reT3fmBeOo7j1Tjnwaycv1M/FAteBwTgce5cJZzSgfC4?=
 =?us-ascii?Q?mKuPugU+WLsmrHczfTiUlFYKALt8K6UtTrlzr+uuqjTxvR1ZtsjtA9AOH5N3?=
 =?us-ascii?Q?KnHK1ETKVLthDdh0/pnBtj8nYPja49PpgqWrofPY1Kcbk2ASbew4EM0N2Ecp?=
 =?us-ascii?Q?5I2xlos2RRcvB2ohCgH89i3AWZogUeFaVd1hcuCL6tBnlG8BOLsl7rnfGb/u?=
 =?us-ascii?Q?OA83BGNfQhHY/ziO9ZEN0XQlIO0tZTe97PWEtHY+azd+JMPjRmiTt4A5IZ/X?=
 =?us-ascii?Q?y18qxQgInseJOgkwAaqJMB6ps+GWFMTGT2ry/qzW2gQ4GZ38/DjrZsyHH8u9?=
 =?us-ascii?Q?iLSYsqnbWo1YFtO2IKAy588Sbhu02+HU7/XtvmS6inXPD/8nw7PlaL/7QaLt?=
 =?us-ascii?Q?E5POUWbG81Z7wPgmLQkxqRhqSx/vJ45GAY0sJ+h75MuBQHKiKGFsbFnCm2fL?=
 =?us-ascii?Q?XVUrDkSx3Zzmj/2MSTSN6CfyoWyhGcImcCH2Gr2A15ZMhq43aLCNLA/vJbBT?=
 =?us-ascii?Q?TqJLzZanpL6lk0+HDlR/N422jvqGoJvN7D2IU3NvUkIixdwjD4vLr43Yg4KL?=
 =?us-ascii?Q?SB6Nh89pA0kbsQ2xrIEppUQ1Q8w9FYJg5DtVAXuPJYBzuao0h0RBIDVjIsrW?=
 =?us-ascii?Q?tbUPG1ytz7MgBZ6NbxfZUCliZqRq1DR+cAcAaBaK6gLYtK09V7MMG4zW3m/T?=
 =?us-ascii?Q?J8VSxYx60y6PpkBpNOwTPBA7pg9DDg1KzUbx+VQU/IZ0hnl0UVG8D9B7SBAY?=
 =?us-ascii?Q?0oIH03rsfxOK53Up3DuoMWJnkTW7QF8OFCJE4dfMssV6EaV7+vcMK3dR7BI7?=
 =?us-ascii?Q?2x2PSPfiBfojYBb3Akt3lZv/HGG8WWe26vqwvHUWs6DLf9SVhnY+3rS2+I6D?=
 =?us-ascii?Q?YLlE8QRQxWHoVTmP+vAruWeBn1EFzOA5C4XtQ9yvg+GmHBbqg8/Ira9XCeYZ?=
 =?us-ascii?Q?DJg+m0fFq8PnQ6jeg/OGnpmbnmyWkqhNaCPKC2jUFM3wnaSYNsMrGe2sIw18?=
 =?us-ascii?Q?NkMQVggRRWq/g4zuQPMt3Zveypiq2+cHHklUE0+W0rokqR/uMP0hwbHWtBtQ?=
 =?us-ascii?Q?7XMgoca2TyEPNJOwhsTaRt+BrP/ak3s7dycNHpFtaOMNkbJLPouGSpuh3e7Q?=
 =?us-ascii?Q?foWRW5KLRtUn9r/F6rriYoNmsGEaSeSwLcbOAOKA6NdkLT/l787cUqT1TUeV?=
 =?us-ascii?Q?CDvnbLq/F0kQREUjxpltVHDsefo/3PVIHKlu+dcjG7XYnNpYRVNOyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(82310400026)(376014)(7416014)(1800799024)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 14:51:12.7350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6c5ea2-fe75-44ab-559c-08ddb58a0fa7
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189
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

XRGB8888 is the default mode that Xorg will want to use. Add support
for this to the Zynqmp DisplayPort driver, so that applications can use
32-bit framebuffers. This solves that the X server would fail to start
unless one provided an xorg.conf that sets DefaultDepth to 16.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynq=
mp_disp.c
index 80d1e499a18d..501428437000 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[=
] =3D {
 		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
 		.swap		=3D true,
 		.sf		=3D scaling_factors_888,
+	}, {
+		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
+		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
+		.swap		=3D true,
+		.sf		=3D scaling_factors_888,
 	}, {
 		.drm_fmt	=3D DRM_FORMAT_RGBA8888,
 		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,
--=20
2.43.0

base-commit: 67a993863163cb88b1b68974c31b0d84ece4293e
branch: linux-master-zynqmpdp-32bit

Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
