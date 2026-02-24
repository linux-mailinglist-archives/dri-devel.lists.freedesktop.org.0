Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IQHD47pnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD918B07D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344A910E607;
	Tue, 24 Feb 2026 18:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vVvUhhp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BFB10E606
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 18:10:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuS2B0hU9qz/ysO1wjEJltWXtKQQ32wSdpRvksDPeKpLDBxERZWArhza2eWp345GK2GVSZ9VrsuD+NGIqjljT2Xt7pItOlZB/N0gyzi0siInKOPi86xUvJMiKEz3wU+wa8MzzwdXxy+t8xUJdjiLXVtqo8TgWeh8LW5Qk5+ZNRAzzIdv9u6iWVZ2TGy22/8jQbrWV32pve3lzo5xjrAj1bAFpzjzEDXF0+NKxTaDx6Y06V+vmsSL9UylMaDbzirTw39QGlSoU9fN3SC3EPETsv/iUJw/guwQ/hNkdlsEIbLGqChhzFggHf/se1Oz6aaz1pHIMv97fXpm9WVKZZWQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KTujgd2GJE1ySiwR+zZ2x9oUkM7F86lAUl6b/jYAvY=;
 b=D0ff0YNLYBqJ2zioc7upclWfCQgabHfe+4JmC8tmChlTbd0tUoZuYJi47bXm3NrTDR9/RfVhHs1EMlPddufWf7ypsjDS7HOQ+nS8YiCPSce6CSmCbV2i6CKx3Fy2H4jgewwirTeD2Edx2iKkUSC7WjOP2hekizPtXtpao+JVv13Xku0ZQUtw1TPFCEvB8AwkN4qU+glmngIjopIi/LWWvF3R1bzdxh52xrZ42QCsFaaagCZzllnDF55LXppSMa/Zz085yRGBpJ8uKZbFKlx2uKhrhg8xZA1SeDuDfsk/uMd8x49wBMziaRRpHiqAzrzsD7076+LBv9g58h6/8mPVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KTujgd2GJE1ySiwR+zZ2x9oUkM7F86lAUl6b/jYAvY=;
 b=vVvUhhp0mMHmtuIGtaCUyV1M1+WhAlla3+499IcfqeAHL5Unkojmj970ucV7aKRsH/BRt98Id02jooT5asOuAhOfEIJb4hKfNBX+42xQxhcAiEFJ67kioaMtygQ+akJjUV0s/91HpfSHUArSg/T0ivIqdbWmaY5qr+RzTCeCH+0=
Received: from BN9PR03CA0221.namprd03.prod.outlook.com (2603:10b6:408:f8::16)
 by MW5PR10MB5850.namprd10.prod.outlook.com (2603:10b6:303:190::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Tue, 24 Feb
 2026 18:10:13 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::e5) by BN9PR03CA0221.outlook.office365.com
 (2603:10b6:408:f8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:10:12 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:10:11 -0600
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com
 [128.247.81.112])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIABBT3186529;
 Tue, 24 Feb 2026 12:10:11 -0600
From: Antonios Christidis <a-christidis@ti.com>
Subject: [PATCH 0/5] drm/imagination: add support for j721e,j784s4,j722s,am62p
Date: Tue, 24 Feb 2026 12:09:14 -0600
Message-ID: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErpnWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMT3fSC0viUkmLdxCRjo2RTM4sUc1MzJaDqgqLUtMwKsEnRsbW1AHe
 CTmdZAAAA
X-Change-ID: 20260224-gpu_dts-ab32c568d756
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
 <linux-clk@vger.kernel.org>, Antonios Christidis <a-christidis@ti.com>,
 Michael Walle <mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Randolph Sapp <rs@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771956611; l=2340;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=UysF8M/CD4aYNApAn0ZJ+R7JTxTsskSLKCah46cE1Qc=;
 b=j1TUQIIt9OHkhed1gNfwaA3mcaH4y4jfp7BrjnEGeL5PDLCedaItzSNBrP/c85Yoi/qHaP3eI
 3vh4Fi/jDKyCjYNcTlkwcxqNB6hfi4loGO0MATO0wLCLSgPtC2RBqG8
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|MW5PR10MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcd69a6-5682-46bb-e594-08de73cff463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MS9Lczk1SVFDNXg4U2QvN0JUSGZremdNZ21tZEpDVTg1clNjSzV5NGd1T2xp?=
 =?utf-8?B?bHVoVjJ3bklFb3FpN2FrQmFGUGR0a1pTMEZ1K0dwK00vTU55OWJ6ekdCOGtS?=
 =?utf-8?B?SVQvdTFsUGJGemphR2xlV0RtRCtnamJBMWdkK3Y3amp5V0hTTVFTWVlVSElh?=
 =?utf-8?B?RWw4aGozOW9DQ1Y4RXNzeno1UFUwV2dyOWJBK0JMYjN3VEw0aTB4L1RpYVZ4?=
 =?utf-8?B?bmdSZGV4Skk1V1BOK0M3N1V2SmVoMjBXdFFJc2VOMXhibkd1R0JuMVMrZ2d6?=
 =?utf-8?B?blFuNHNaVTFZZ3FoQ29ZVWlUb2dUQWc2RzdoRUVqeE9TVVMvdVljV3ZwcVRB?=
 =?utf-8?B?T0NrcEQzbWRhNXo3YjJsMC9zNjNhakwrUWVGVWo2cC9TbER6aWpqQ2JiL05r?=
 =?utf-8?B?L1RWWnk3OTlMVGNPOU0wbm1SQ3hIazVvMGo0dU4zaTFwLy9JbXo0UVZ4ZXh0?=
 =?utf-8?B?cEZtRDNJNVM3R1IrRkZLd3ZBMXBib1M5ZCtZdzlGTTNpUFZOdnZTVm9BRFha?=
 =?utf-8?B?akZqelNuQlIzV1piYmpIc1J3TGFhSWIwbC9VTW9LbEVSMHJrSDlxWGNuOGg5?=
 =?utf-8?B?RmN1TUtIZHJDb1crQ3dZTEltdTBQdFE2alZlUFJrNmhHOUYrZkZOLzY1ZzFK?=
 =?utf-8?B?MU9qZC9reXdjMU55M3lMVzFFL0xTTWM1aVhiSFBSUmFYOFBVeWRHZU40eVcx?=
 =?utf-8?B?Qi9pKzVadkZWeW0rbDJrQzhaVUE1bnBiUmcyQjUzUWVxaW15aURDWk5abkR5?=
 =?utf-8?B?VFUzdkMrcThqM3E3N2F0NGduZmg3MERNVzM1cjFHR2N4KzA4T3BJNzR5YnpU?=
 =?utf-8?B?QU80b2tCeENSNTZMU3JmazN1MHNzZzJiK0lOVm9TWFRDSEwzYVQ3cGROZFFO?=
 =?utf-8?B?aThjMk9JVjdRN29EM3piMzFlSHRqYktLcHRuS3MrNHVrYWRTNXlsL0ZHQ3FS?=
 =?utf-8?B?M3VBcnQzZTRFblBza1JIZExOSTl2ZU9PaTErWWtSK0lQRVl4TzdxeVR3TDRa?=
 =?utf-8?B?bjJ0QTFZcHlTakZVdEs4bHM2ZThlN3d0b3QyK095OEFZWFhKbDRzMzZXVE9k?=
 =?utf-8?B?ZzhUb0JxUklhMUFKVS93UVd5Y2hmMlg1QjN5KzcxWWdweUdiaHd5dUZReldk?=
 =?utf-8?B?a0d0eFlPM2RoVEhHRWlJcmN6bnV4ejc4cHkzVTAxR2xnMGFsTU84SEdKR1Ex?=
 =?utf-8?B?TjZRYUFBNXlxaVI5ampEYlpHQ2JJODVnWUpUTzVHU0hmSXNVaERtQThNWnJW?=
 =?utf-8?B?ZXllVzIxSlNkR3FiNUZUV2xwSFZnakk5OXVxaS8xSEEzeG9kQ1F3aUV2eGY0?=
 =?utf-8?B?RHBxaktYQnVCZjlUdGZTR3VDcW45d3ZRY2FIWGYvTkdwZUR0K3I5blI1cDBE?=
 =?utf-8?B?VllocEZ3YXErUGVkMFFKaklaa3gwN0lpTDJJK2Nza3JZejZsZktFd0tzekF5?=
 =?utf-8?B?WWE4MHRIZHpraTNvZFA1L2JWWDNVS0hzSDlKcm9GTloxdDhhVXEvWDNTSzNh?=
 =?utf-8?B?RmJ1VGpNV2dSejRxYWdoRHRqUzZuOUhRTjFFTkJjajg4eXBSU1dNR3FwRWZM?=
 =?utf-8?B?MmtNYVVLRXNXd3AramFUOTBuR2dpcTl1K1BRbkVicmVKbUlXQ3RsbHMzR0hP?=
 =?utf-8?B?SFJvMzUxQjRSellHdDc5L2xnaHFlbHRIM29aaUg1bXVGT01JTFlVbk53bTdU?=
 =?utf-8?B?WFgrWTd5UGVsK2U5em1oRVFpc3E5aG9VT2svOGRBcjBObzBPZTFJcXZHbUY4?=
 =?utf-8?B?RGpiUFgzNVJUTGo4S3RGejhmdDBRQys4cFFKUHVMdVhkS1h1b2dNQ2IxYkQr?=
 =?utf-8?B?c2ZDVDZBcFRpT1V2QWdIeVk3aVFTTElSVFJzcWJ6dGE0eVB0RWFtRC9va1k0?=
 =?utf-8?B?eEYrZjd6djhKckwySHZGYkNGam94dHVKNXFqUnN3MG5PMUYrMWphbE9XQTVp?=
 =?utf-8?B?NlMwSGJGMndDNlA0U0FzQnVGRDVXL1pReW42YUQrdGplN05yMTYvRmZ4SXUw?=
 =?utf-8?B?WGRxb2hKdFczMG9GM1hMYk5SdmJSODNnM1hNMzNPTzVINEhLQTBhMXAyc1Bz?=
 =?utf-8?B?Qit6RVZPcXJmclljYnJobTErM2ZUeHVaalpLL0lFYzVaeHhpWjQzeUdYdWN3?=
 =?utf-8?B?N1FyeUloUXlQd0t5QmN2QlZUODJRak0yY0E2V2M5RUxpNHBXMnJXSUI1NWVT?=
 =?utf-8?B?SFh2YktycDgxNFFSSnJyNmRhRThldjNwRS9DYmpSWEpWMDkrdzh0aThmckRC?=
 =?utf-8?Q?eC11KK8N2ckQiSLLuo4ZdO/zBncGNS/b95+7nVBOew=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ynw7cTDEIrdiPtjKwdanpVspgNsEC6MpUPR2mZj+MOtEYd6RahWcGCP8A0erHrqtJuB9tqnHio8IS7YsZYG4W65/EW19Hi4jgBiEu2rg6UHqvvOhI4CWINZnkrEmXdMZR17pJi0F76eeH0kc9wEXc8TbKOM2vipmKaYBMp2pl96Owl2cOIE/B0krz3ms35X9mnJwYVHvBjpukXHR403lymO8CL8pW8b1ELLUJEGov3lRLQAJeRow1wsO545VlmCMoBFLXKi9fdl8lSHM+72b0ZF+Ftf+7NxRXhHGpP+h6oehQhv2mdW8g0PW31cQa+6UrrkGtcHf4Owl4hVXaLc/odp8uZ3cfJKrkPyCDauBULWq7/kWxNteqDyZHqbhAOVqr7ndJNT3dGca3iD6Dz4fdq1ATBas8qhzeEF06feYtgSgRczpFIom4A6VBokmnLhy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:10:12.7563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcd69a6-5682-46bb-e594-08de73cff463
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5850
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
	FORGED_RECIPIENTS(0.00)[m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:a-christidis@ti.com,m:mwalle@kernel.org,m:khilman@baylibre.com,m:rs@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:mid,ti.com:dkim,ti.com:url,ti.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 28CD918B07D
X-Rspamd-Action: no action

Hello all,

Some TI/IMG dts GPU nodes are not present upstream, while others are. This
series adds support for missing devices upstream.

Including patches ([1][2]) from Michael Walle, that did not get picked up.
That add support j722s and am62p.

In regards to the j721e patch:

The clock[3] and power[4] info was captured from docs listed below.  While
interrupt info was captured from [5], TI downstream binding in commit
6ae5ecfde2f2 ("arm64: dts: ti: k3-j721e-main: add gpu node").

In regards to the j784s4 patch:

The clock[6] and power[7] info was captured from docs listed below.  While
interrupt info was captured from [8], looking at "Interrupts (inputs)" and
"GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0".

[1]: https://lore.kernel.org/all/20251223124729.2482877-3-mwalle@kernel.org/
[2]: https://lore.kernel.org/all/20251223124729.2482877-4-mwalle@kernel.org/
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721e/clocks.html#clocks-for-gpu0-gpu-0-device
[4]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721e/devices.html
[5]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[6]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html#clocks-for-j7aep-gpu-bxs464-wrap0-gpu-ss-0-device
[7]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j784s4/devices.html
[8]: https://www.ti.com/lit/zip/spruj52

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
Antonios Christidis (3):
      arm64: dts: ti: k3-j721e: Add GPU node
      dt-bindings: gpu: img: Add J721e SoC specific compatible
      arm64: dts: ti: k3-j784s4: Add GPU node

Michael Walle (2):
      arm64: dts: ti: add GPU node
      clk: keystone: don't cache clock rate

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml         |  7 ++++++-
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 11 +++++++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                  | 14 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi                 | 14 ++++++++++++++
 drivers/clk/keystone/sci-clk.c                             |  8 ++++++++
 5 files changed, 53 insertions(+), 1 deletion(-)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260224-gpu_dts-ab32c568d756

Best regards,
-- 
Antonios Christidis <a-christidis@ti.com>

