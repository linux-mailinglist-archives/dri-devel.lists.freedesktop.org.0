Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5685A02AF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0F0C756D;
	Wed, 24 Aug 2022 20:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2117.outbound.protection.outlook.com [40.107.215.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2C1AF32D;
 Tue, 23 Aug 2022 06:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0Ckb+cz3qC6tsD8/TbERIbudGuBZk3F5EhlHr/2TccvRZQ+XFeg2XnpsmkRUcKUlCB3nZ231sCFg2og4Z/D6+s5Pea1cXoGl+g68HrmjRhwNAgLDQEF3ETLdpF1G+JZPBFTWZrvZgBsVs2s8kwLyNp2bKSBTLJ1ea00nqIP1rEkFCcKrn3vQ+tZdZ4+FZlECB7mKE1JkKFhfrydpqzV+LvTgHiqSE2dGWnTteFV+01u6cGgu/ub580jiXjwPY7llpowyhKB2xk1FZot8jX+5EebFBbdeI+P0MeC1jKhBeLPixb4NuGmAqUMMywBuj4IVL9r9v19h7BCuuiwaHAQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLAmHDTIj3rAamIyZ57Hfnvyte+Mzmk8LD35IIj5LQQ=;
 b=DSrVY88nXfVBhB/UCEh2vnhZEEBHbYHzaEWIvwBv3Mrlech8puBXN/DdIDap+5qTPOv/ux6PWEdAWgqyUoAFVj0ppQZabm/v5n/05PuuLRnU/5U0Mt/bc9BfmqHsFrogb2QF3K1U9/NxuhhMjM0gcmk+Q7DYuCNaeZpF/QprvnZPBfjuD9xxB8/1sCiYRl/hIxP5PIn40rDJ+oQ5YHWLLOSI2UqW0A/D6j/lDACrrmBEtFBNGsk5Bpqol4OPJEzZSwnQeNhTxGTgqvx7ZsXvd+1ucsieajWuz3hdTeRM1TUwYHwFrqkD46mPR7yytlG0Mo8v/0yrjrMEuioJKuUPEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLAmHDTIj3rAamIyZ57Hfnvyte+Mzmk8LD35IIj5LQQ=;
 b=bSxqqk+4NUfs3JaW8/FSEjeidXBs++PMO9JXajcerdax2g8Rp++Whl6Kii+6UtHXxIvtGt2GNsm4EyHtir3w9gsQXi/ZADkEPuzjpXYDJLT+drpK4AlbFEWs+KgOXMEAKltsYqD+Q3ORY7v2+odzxuTzgO+z79yV3vWJZrVtVMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by SL2PR06MB3193.apcprd06.prod.outlook.com (2603:1096:100:34::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 06:41:51 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0%9]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 06:41:51 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Nikola Cornij <nikola.cornij@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: remove possible condition with no effect (if == else)
Date: Mon, 22 Aug 2022 23:41:31 -0700
Message-Id: <20220823064137.13726-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:404:a6::32) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e717a7b-e704-4ecb-39bb-08da84d28fbb
X-MS-TrafficTypeDiagnostic: SL2PR06MB3193:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ppVQq5Xcuh5HqE1W3krVn3fpAuz86IALcdCPFdYCVm10FK+/6hW1KuLuOuPe5r3BC1xwi1Jvo98a3sMUKpeNkNaGVVZ4tuOgXxYnfA1Cmz4xKy2lAUADyKWz/7H17bVQ5Ly7gla1Zk20azIp07dswzVEoAp6dUbPIyqlmgkdmyI6ENyojWDWXb6oSJyvTUXG00BtnUnfT3WwCAAkl1ZsKZH2Q2RfgYX130qLtzLi/2B8kLMi7p1r887e/TUpE+svEkdjqelC6Ej0nUlZV6QBZIWSw1DeLSqfL1iA1xB+79ZgU98jBdhmzwEa8Lg7wSTPTX5KdSznJAL083zlWNaQN0bY5YAcy7lmtbsJSdp1sEl3fyLZxFDj3S6jsd3UoZ7FcK9joPq3K6nZSBqk0XaiZaPOWkZlbznVWMifacEBxne97Zv2mBhJ1UwnWVsiaYsqiGP+0YgyDCf9z2W6YZx4MR3tJjyKnKbBHTWa6MfbDg3fZJtucgHDTMnRPXahMYGQ2HTun7q4RPUltHfKZLdRhuAw0yriKryRLboEoRKjVBzg1EJI9b+2dStgTv4RDFcbxISN/Ka/XcjG1h0dDC3+ycjy9YbstvQ0Peal0E4MbrcJb3PnSgqHxmMRGZi2Zu4/bl6j7q/4aNZ40w81oUOE29r8u5GufVnEcsLFej1Gy0Mefi3Ntp+zBciecByaHmwXo5OfObYnDdAsX7WzeCoPmMqiV87Uy68yCJLvu++hjMge/pCw5H9GKaJ4OLo62QMzYmFc+xWYeabBBosvdvH5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(2616005)(1076003)(5660300002)(4744005)(4326008)(6486002)(6506007)(186003)(8676002)(7416002)(66946007)(66476007)(8936002)(66556008)(26005)(478600001)(83380400001)(107886003)(36756003)(6512007)(6666004)(52116002)(41300700001)(86362001)(110136005)(316002)(2906002)(921005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7kMPLtRZgFQ6vc4IVHT2RVCMLBHnkdzZdH1NQYxh9Zg9Hpd0ItdV+irwVAMt?=
 =?us-ascii?Q?6Q0CYs1vIlNme8uiP+uUchwSXNUo5+4zMNxL1UiONDwO9YMYL8Iizf5SDb7Z?=
 =?us-ascii?Q?8XGgnsPp5hfCyehvdKGjwZkvrRXqoLt/7xFTbCe7XX9l1wt9KIL1cjWUmWvj?=
 =?us-ascii?Q?xHfpvElnyFbroXE/iKTOAwQbRJ7n3D7/b62RS4VM3LNE5fwmS6kutatgRQUx?=
 =?us-ascii?Q?OOBen/vuqg4IyTKPU1FVx85a0xkrBUELM1vr7evf7gc47PGXQ6Q+E4NNOR9Z?=
 =?us-ascii?Q?/vlpKlU7xQcmRclDEFv7NiJ4hwslIsdRwnTe8n11iHojq9zP3iWW/IcnP9iO?=
 =?us-ascii?Q?qp6RdSk8s7KSIZWXkCPAtB6Uzw09ZNYy4WR5hm1l1kNvgVb8iPem1H2ClEm7?=
 =?us-ascii?Q?5ntG7HCa937fnwbizKuoga13ZOi6M7roFyedABtyXmRuDOPDBGE/W0nYw9wb?=
 =?us-ascii?Q?eUf+S9nKG+BcemnSMboWKabWpRSDt+xEAr5AEdh9goXqZby6F0YI/leiPjsY?=
 =?us-ascii?Q?xMZkQ0l7nokjECmuXcB3VmkL3V1RHFdCV8plBZfFYx6hNVMgcpJ1+rjNQUwv?=
 =?us-ascii?Q?CnbyZEIy40KMJvJLhENpEzlTXAXQjjrjuxu2a32AMSfXHXlewV1CEMh1FjLv?=
 =?us-ascii?Q?Rn2VdmfbltcX4mwlYSKXMRWKQth2WdpIvIVoU50lbBFO6HmMrvIZTH/Z1e4V?=
 =?us-ascii?Q?FROAcIjB0YbjbfcR9Vdz4B8zto8/ddHQNLHYMqBTnOmhS3jjALDtwShLRrNw?=
 =?us-ascii?Q?dWK4BfxJSsAKVbp66EJOIeBPGNO1UQKdH3UZiPzeWvmEsWr3HhcOO8Ffy8FN?=
 =?us-ascii?Q?O1li/BiueEvxPgPlSShZCnxAKCEKPZ5tFNcC6As/kpdqEh8XEhYcHC1JeoSr?=
 =?us-ascii?Q?x4E3sBzixo4k2sXOwGTsC0bVcsZODQZpBIWyk3eHOoyio4edm0vMYhVEZCBI?=
 =?us-ascii?Q?+DsoiWVxq0bvwV4R8tT1vh1s+btXJaVkPB4PVT977Qafb6yGyQm+64W0ZSlL?=
 =?us-ascii?Q?Letf82G78uCTSGRFibu4BufljfESBRAUaaQB6/YZp2qGGnJci4oRPnkYTsTk?=
 =?us-ascii?Q?xGpY+v898b2UAKfv3EXy78OwzbFVlzAAAmsug7nn6EvzMuQDrhHpCxKx0bE9?=
 =?us-ascii?Q?IvXcV7GJqoxkK4NSnnXTd/u9BY3+mKo9vpiOQsu/Jtx9v5rBtd4/9llErkfx?=
 =?us-ascii?Q?MABg65xpdFLyM3QzaXzgTxmAcvE5PCXnE45tQH+9rIFtYPfwBWhDNOOt1Lp2?=
 =?us-ascii?Q?NuRcrHyOq8SCfvMy0qalqNsWdHFv4KYyGCorRkoK0Ri6mEzhCB5OIhDyaAyV?=
 =?us-ascii?Q?+Y42FNc9s88h5DME1YTftw9sxMBnQdLDES7mv4o5X4DfKCR/ThUl8uDEV7c/?=
 =?us-ascii?Q?o7mT7WDfIdESXIgXbmk5N4L7nuEWIeZMJF/90ml6CnaM2P0G/wB+rvx9xRKY?=
 =?us-ascii?Q?2xrCmgKFeCUdEnKJOoLI+Ig7IVe/+EdO9qFE6LF1oFMaPvsvjQJDGk4oAUTJ?=
 =?us-ascii?Q?dRSSBv4oEMKsruRi53nVjV1MY318UzL+ZE+qZba61jfiUeUxqlAC+eFRt+ha?=
 =?us-ascii?Q?zzUcvSv3r8V+7/dwAyS29kfBAAcoXPG4oyE71cSq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e717a7b-e704-4ecb-39bb-08da84d28fbb
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 06:41:51.8424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2p921TSjtkxebFoDtlmwqNXEQBMX+28g8AEv3uKrIA2+7FMjzF9/0z8RtbY5pAzMNHiq0/g/9qOuTGYztsIfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3193
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
Cc: Bernard Zhao <bernard@vivo.com>, zhaojunkui2008@126.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fix cocci warning:
drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c:1816:6-8:
WARNING: possible condition with no effect (if == else).

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index 85f32206a766..dccc9794e6a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -1813,8 +1813,6 @@ static bool dcn314_resource_construct(
 
 	if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
 		dc->debug = debug_defaults_drv;
-	else if (dc->ctx->dce_environment == DCE_ENV_FPGA_MAXIMUS)
-		dc->debug = debug_defaults_diags;
 	else
 		dc->debug = debug_defaults_diags;
 	// Init the vm_helper
-- 
2.33.1

