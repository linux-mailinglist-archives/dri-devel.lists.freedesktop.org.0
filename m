Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AGfOZbpnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155518B09B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CC10E612;
	Tue, 24 Feb 2026 18:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="PhR4mFQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A663510E60C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 18:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nX91dmNq6o3C5aVcENa/M4it8mSI6bsL7xfAN/6sGkP5lwwsavRC0L47FqxDQas0e7Q3uBShPZ4GgZsCh18OS5anMBBXiV02RJy98B87AiLr6Wvg/Uod4dlwFHGHfH4CTPoZwMoc7tBNxE1x1LT2iZuNMPxBYMT5vAJzUTL5PR6NEjZVC44PkwKI+a5peuMbWd3rQr53RGraA/CbOaBe8V846h4luln8m5SKLQGmXHgHzTDkvzHXWkmxsf/EJQOswMYaC+VZ69MRRZSqR+jqiOSFPNrp8aunJlEksrXU40rApF+IgJKsJm61pj3CFseGRK8Fx4NikKEg49dr0Pxyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/mEO8BkusD7E/gUbD1kDdbO9KqLysYi+oQFiCNhy00=;
 b=dScK/MqziMkh73zn1W8LHP4r8TsccE73amjXVFkCgrqJfYJZdl54PoKhmWjC18C6JwmfGb36qAZxSiubKq/mNNq3jIQtWOFpJiSduQdcQD2AwhgohUdwTeuvC9/nVv5DLs3s37lY8obbKcXQ55fFpg8qYlRdOpgNcil2cGggbxCYYRABw2IGAs77c3OKv0e4IVogC5QpOmIr1DrLNCy/fSSfE+VpbayndPGpuyGcEWfqQde+kwJE7+fbp+whmtQXKPffk5bJVKsK3RfOaFOgd2aGrpXa1GAm+PM2v5BDdOJkyShZGoTecRjJW9EQX9sQ9b6m4q/XwyaQbJkjKnrI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/mEO8BkusD7E/gUbD1kDdbO9KqLysYi+oQFiCNhy00=;
 b=PhR4mFQemVe5cViL9G9Sapq5o5uI5X+O0hGy5hVqTP28kg8zgxZDM6VtMyG/EzzAN/qjJuWnTwooz9bs+iVK3UFrhHzi5iFvpXRyhLuJB4t6hMhFNwKBbQOvFM2Hj4QkPDKw2TBPE1xpxv3R9+lKLdZvs/V2uZivuKNP8xj6Dxc=
Received: from BN1PR14CA0007.namprd14.prod.outlook.com (2603:10b6:408:e3::12)
 by IA6PR10MB997656.namprd10.prod.outlook.com (2603:10b6:208:5df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:10:24 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::f9) by BN1PR14CA0007.outlook.office365.com
 (2603:10b6:408:e3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:10:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 18:10:24 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:10:12 -0600
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com
 [128.247.81.112])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIABBV3186529;
 Tue, 24 Feb 2026 12:10:12 -0600
From: Antonios Christidis <a-christidis@ti.com>
Date: Tue, 24 Feb 2026 12:09:16 -0600
Subject: [PATCH 2/5] dt-bindings: gpu: img: Add J721e SoC specific compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771956611; l=1197;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=jxX9t3Nz4eJGsBRpRM0mHumR+fpSGmk+1odR1fX2+Ow=;
 b=yGWNvQYwFSGBssBcqkkqOEnH2cNRtcVJpPRIyTrN1C5AeZO0+0xHD5z3faGC1aG3IEoDOL6S3
 yTKH7FXXi3WB6em1EB5Ik6z5jPJrpWZtNAep+xHAzyqAdnw956EHXSK
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|IA6PR10MB997656:EE_
X-MS-Office365-Filtering-Correlation-Id: 457f4bd6-535b-41ad-28c3-08de73cffb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTZKTERtb1EwVUt5cVQ3VzhCZkxYOU1qWFl4ZVpEcGJjbklxTTRSWW9pNzEz?=
 =?utf-8?B?VGlINVhRQnpZdCsvaHNXVzVseHZnYkJyeVdwNHp6c3ZqVHhPbmlRY0ZaT21Y?=
 =?utf-8?B?ZmZlSE05NlpwTWhHbXlzSU11TzJCQU1pRzFOeTEwZHIvbUdTS1Zqc2RuSGdX?=
 =?utf-8?B?M1QwOUpvUE1nL3FxU1FOL2xNRmdBcHNXM3d4R2M0WktSb3VzUlJJQWs5ZVJz?=
 =?utf-8?B?NnhtalVZS2hteU1NR0grY1hHbk16Y2tPTi9IdGNQWndYb3VCbk5FeUs4L21S?=
 =?utf-8?B?TURpZ1kzVzV1dSt4N1ZISHpZSXlVTXYyUVF2MHJveVVzOXNPaVpDV0k0WHdL?=
 =?utf-8?B?WWxXVzNxSGNucDdiY0VGS25YZGJqRGtZeHJjV3dQTXhNRUNMbDNhYURvVU43?=
 =?utf-8?B?cWVMbG4yUDJ2TnFNY3p1UE4xbjhWNDdaemQ3UGxtUE5TS1l4M3VuYVgycVJi?=
 =?utf-8?B?dkh0RXNGRUQxUWJybXNHai94dklsMWMrMWhFRHFiaVI4R1BtZUYvbFY0M3d4?=
 =?utf-8?B?K2ZNQ2lEakFJQlBmTXoydDJWVTFrWithRndtRXR3RjJ3TVEwRkNFekNpMEpE?=
 =?utf-8?B?cDJ3V212ODZwaUhzbVVNOEtDT254aVozVkw1Zm9QQVFFeURFSGp3ZUtjb0lP?=
 =?utf-8?B?elRUT1hCWC9Udlo0SDBnaUswejhESlgySDBVVGt1b2FxUVdKOGxGdmtaQjVK?=
 =?utf-8?B?cHgrY3J2N05qMXE2c1MzbG1FaG8wNjlNNjJIVFhzY2FFSFk2R0NNcWdOSUV2?=
 =?utf-8?B?K29OY3J1dzM1c2ZJTldTeC9UR3FyeFFSQnE0NFdLc3VUMU9JdG5YdlJXWk9a?=
 =?utf-8?B?OWVkU09JYSsxTERwOFBuYW9vZU03VTM2MnJIQ0pHZXA0ZVViaEd4cm1iZ1l2?=
 =?utf-8?B?YU5sanFEcTFScTJGeUJKVUpDTU1ld3dFang2WTZrTTljYk9ld25Eek5Oa3d3?=
 =?utf-8?B?TElJeXI1Y3IrWmtTak9hOVBJL3M3NGFJK1h2U08rODBQNzQ5RTFWcW5OblJG?=
 =?utf-8?B?a1NzQ1pzYyttTDlqd0xaNnY2MDdjMzF0L2NrRk9ReWx1YnVMUCtKWEp5TzVT?=
 =?utf-8?B?QlFPdEIyNFhrc0JrWUdVMU5xWEJjWGp1UUVabVFrWUtvSWdLTFVCUVJ0a01S?=
 =?utf-8?B?NWl3WjlEUlVoa3Q5WTFZQUgwWnMwQXNTOTh1SFRWL3NPNStWWG5QcVkweFBC?=
 =?utf-8?B?ZHZYWUQ5eXN2ZHpsZmVpaHV6YTQ4bTU0TVRWdFR5Q2tERzNuK1d5QmUwUXJL?=
 =?utf-8?B?U0dnVW0wSHhaTExuK1VjYmpFSDgzOEdzekVYN0luSE84L1Q2TkxxcDF5Nnpl?=
 =?utf-8?B?VGR1MmdOYjFNa1FBb0tma1Flc1lJenQ3YkY5UmticUZBTDhLR1NRMHRsdlg3?=
 =?utf-8?B?aVlreGlyNkhXak92bW9nYkhuY2hBcG81dVowZ0t1YXNlZ2dCS1IvZlZZN2lG?=
 =?utf-8?B?QmNrNkdXMHpqbUx5WFhYRWd3OEg2WUJEaDlGOFhSUFdXbkpmR1AwSVJLaXVT?=
 =?utf-8?B?UUovS2JxUDFMZWJBdCtSL25URWx1SzlVT1hPTlE1bHdlTXJPWUdCVWpqNklV?=
 =?utf-8?B?Q3BmeE5OVEcwL3FNTTJFUWM3MzFmYVdsdmFYNG9BVExRYU9GWnRLNjdraitG?=
 =?utf-8?B?WHM3MmxtdXFqTzhtYk1pRGF0Wkp5M3JzQ0lhV3JEWGVwQTFMRmpuV2xkaGFC?=
 =?utf-8?B?TVZCdFY0Y1lpLzRqak1QQ3JSTC9pZ0YrTFZtMHdPOXdpTGhkdU9rRkJvNmYz?=
 =?utf-8?B?ODVhOVZkZk1EOGZKaTE0UzBhRFBnU0xYTU5wUlAzUmJWNVZMQzE4ZUtMUldx?=
 =?utf-8?B?cGloeVhtZ3ZGMVNTTW15Z3p2YlhPeDJvWmxEbzhtbHE1WUdpNWNiMkw2NkpF?=
 =?utf-8?B?NTVCZ3ZnTzJwZW1CalRCVUNCb0xnb0NkaFNGU044eFdDMnVYNzgyNEV2U01I?=
 =?utf-8?B?azI3MEsrRU5MU2pLTkltbGEwOVZ1Y2hkd1JTclpLMXNoZGw0V1dTRWZJbXBZ?=
 =?utf-8?B?Nkc4V1M5aTdXS1J4cmc3RnJ6SWd2UENEUHNzSmoyd0dnak9HWDY3TG5tUGVJ?=
 =?utf-8?B?Wno0VHR4cGtNcnJySXlQa2N3dWZ0bVVVck9WV3VMODFvWmhPelRFeDB4NHVh?=
 =?utf-8?B?aWs5Si9QNi9tc2xxemhMa3FDdm4zWTJBSG1SQ0M3K1ppU2E5dFVJOEFiVXJV?=
 =?utf-8?B?MnVIM2MzRmthWHg1TEtsYk9DUTZzVHY3OWZtUTRoK3NyR2VvVnZ3eE1vQ2lE?=
 =?utf-8?Q?mVal6ZRydamqz5+fqX9WBij1Y6igpmsAedSC4WIITk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +dnAr2lhTp8EEiwT4lpdbR+w9QFwEcHKR561SvIF93ZDt/hLxSMJ8udIUrzZjz3kCXt0w7eB/RNl/jCMRlAn15fiTdPPg1Y9Jc9Z4cCkEQ34zcIviWlJBZqUZ3uLbRWLFTIfTZTXfoOIBxz1k3/lta8JJgySP5FvP4VuEOW1EQxX87euhPcSk5O0a+XJjFV69opAm+1VpfMF/XQIt3Ykq79ZHD2gDcKe5RhZwQseVAYUiRuVnf6nOHDFmse1dZwI4sOHRmjufiV5GwG6v17wl9pfzP8FZN8FwUURls1BMLRWsguw86VWp0z2EhZIlCzgGDSJz4OjbVKZ4X0uwj2C+Rgu30gz0mjjiJZBVAw2jTqghAONRAqqgfDuDNTnxQ6FjGzCLvc3YYv8OCeVc1p4m7S8FQTJak9tngKjvW+WYQ5oLlQ5PqGrj3GfQi91Ly5D
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:10:24.0685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 457f4bd6-535b-41ad-28c3-08de73cffb22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997656
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8155518B09B
X-Rspamd-Action: no action

Add J721e SoC specific compatible.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a1f54dbae3f3..56249d1e65aa 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -44,7 +44,11 @@ properties:
               - ti,j721s2-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
-
+      - items:
+          - enum:
+              - ti,j721e-gpu
+          - const: img,img-ge8430
+          - const: img,img-rogue
       # This legacy combination of compatible strings was introduced early on
       # before the more specific GPU identifiers were used.
       - items:
@@ -103,6 +107,7 @@ allOf:
               - ti,am62-gpu
               - ti,am62p-gpu
               - ti,j721s2-gpu
+              - ti,j721e-gpu
     then:
       properties:
         clocks:

-- 
2.34.1

