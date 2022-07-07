Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736F569FEB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF953112D61;
	Thu,  7 Jul 2022 10:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61D510F9F2;
 Thu,  7 Jul 2022 10:30:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDHtEciK1xGnWG8RUf2q+SvXwtkayp9yJHUtM7CAgtwCYMsbACRn8gXLeMyINMTOhyfE9FM89YmbHP5bUJnGtoINaKT6Y0NseoQm4RI8yolVtLkmSHlUSiFG8ZMq7Fz21/PSunKQOv34USoRhw7Z6NhsvkNLafzW0cFTu2/UQGiJO9ZYxwGEHB6MIQR72/7taAjtt654UWeF35KjGn3mFPwTay1m+SVRzO/klS83wJluLjfx/zb7a/gkI9sjvQcnnwR1RMZgMnMXPkDoBTVDgrQtNRpETy9OMqOfHOy86lZYM403GXkvHpPoHBOWJ5htC7tdj232YZkjddnS4zbiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq4OYKO+THEewQERtpbKpagudxI1MtuzUZyfnsdhE7w=;
 b=Fu/Gv9jtsXNF43xKfWi7Qxj39HNpMqtW1S36Q+wPDp8hz5MMwPPoXLTsRkfuo4JsXque14H4nEemtcioEDM6Ws1qZN2PpmNxzbE6Bj0jVz8/RMmCW3isnfZFMKX6zxoyJFF1MueQ3IR5toXGrvZ8vWqm/H/aM79RqJ/cJ6rgSXc1Nc9AqfgEmKnplbBu+BrO+Shln26E6AVwc9hL2EGduZjQTPA02gu1Y0dx+dacJ7SjOWawzT3l/yCIRa1FbQW8yDsyGMomppaU3lM3KN6l2s+2yQs8GJvKNCUGX2ZRONzdbW7wb6ofojl9h/efLbfGPSmkofk+lBwsfFDIuAO+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq4OYKO+THEewQERtpbKpagudxI1MtuzUZyfnsdhE7w=;
 b=B8uEzE64GCYX8UYPFTdOXMBl+IH0ggIZ1Tz+K4YKcg1tV6iOEj0h/kxPs+0WpNMyzxvrHwQul4bJ29rCzmdprxGhySqNibh6LSO+jACmyybP3IkOon37jYCXzNFlF3ldlcqUZjlx9RF7+KITsrg94iiGxn/j9qHsKUL+jl9Zl+s=
Received: from DM6PR07CA0125.namprd07.prod.outlook.com (2603:10b6:5:330::7) by
 MWHPR12MB1549.namprd12.prod.outlook.com (2603:10b6:301:10::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.17; Thu, 7 Jul 2022 10:30:00 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::df) by DM6PR07CA0125.outlook.office365.com
 (2603:10b6:5:330::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 10:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 10:29:59 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 05:29:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 03:29:58 -0700
Received: from dev-desktop.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 7 Jul 2022 05:29:54 -0500
From: jie1zhan <jesse.zhang@amd.com>
To: <broonie@kernel.org>, <dri-devel-bounces@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/syncobj: Fix sync syncobj issue
Date: Thu, 7 Jul 2022 18:29:53 +0800
Message-ID: <20220707102953.769684-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0867347c-502d-4f3b-f090-08da6003a521
X-MS-TrafficTypeDiagnostic: MWHPR12MB1549:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oEn7hMSiiTye1upN6zCHbSLCTbCxB8us8TyjK/19uogly1are26v5UTS7UNw?=
 =?us-ascii?Q?yK1t4gUtVnMfyHaefKdMcLemAOcjWft/CAJteqnVevaNTTpUmRQf/x1ThvFt?=
 =?us-ascii?Q?RYYH5Nsx0cAFLSgh5RxDzvkKY8D778qfV7DgLidWGw1dRurrLD9PTh7OKeXF?=
 =?us-ascii?Q?ThR/SRRjy0RenM/vZjF/GLmVrsBC7SDyzXlH18j860QvcQOgUokrYKvNOfo4?=
 =?us-ascii?Q?1r/FpoxCcBUbde4mMxXiqVd858EDhk3nk8QBQYEaiNp8lwSP0nJz/B6s2228?=
 =?us-ascii?Q?UJaUWcpZOcv2nWxeJrHaj8+IyMoaWaGeX8Ql01KUpouiyMLB32SlXkDDbHND?=
 =?us-ascii?Q?8OF8sHadQhIIMq1Dhlcw/TD+3+6FTAc4VgEfEo8RdittXDxS0K5KYi4F5c93?=
 =?us-ascii?Q?vi1QE2jGq/VaLQJHADCbp/H6YvOG5GfrgubcI+jaT3u+CtG2L7rmrWMx47E5?=
 =?us-ascii?Q?wx7HMnOVVGQMo1mcgNMj4JV4z40drxjye6zNEVP2z7N6S7lC9SmltJ9JrFFf?=
 =?us-ascii?Q?b/1gVWMkGA91IVkO5PS45spSMzY5NU4nFiC+diHHFEzKlxGrpjSeuAx111NQ?=
 =?us-ascii?Q?eJeIj5bf35gN5P/r45MtdO6DvD/kKXEsACKbhfucj0XT/GfvoKFFmj6ePzMk?=
 =?us-ascii?Q?jliD/LX/Khe0n2PI3IISSmq6OR1H8yjR5t04mP7WnreFNRDQoV8jtAIMzGfF?=
 =?us-ascii?Q?Hb0YDnq/7FmgzcfrN5hBm4MNRR1dfy1HqL0DgtV1ISvPwcQQzq6obEc6LWcv?=
 =?us-ascii?Q?ecR5LfrJckhjOevWfQNr7zcnirc2J5XD4ipgOmdC3JrA2oCH+d4U68bCX7qE?=
 =?us-ascii?Q?jMNnaYOwQkFaThaX4/vB9jpWq2dVCwc9qrw4FqdMMw1Hsw5A+EiYvje0vvF8?=
 =?us-ascii?Q?+Jo6u/NPhEr74JXtWdMprGd19PnqF6PL23564KnO0NkVdTCziB1dLmcj1JGG?=
 =?us-ascii?Q?YA7VkfLxaDjljr10HP0a1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(40470700004)(36840700001)(7696005)(8936002)(478600001)(40480700001)(36860700001)(7416002)(70206006)(2906002)(34020700004)(81166007)(356005)(4744005)(82740400003)(5660300002)(8676002)(4326008)(70586007)(36756003)(186003)(26005)(41300700001)(110136005)(40460700003)(47076005)(82310400005)(426003)(1076003)(2616005)(86362001)(336012)(316002)(54906003)(43062005)(36900700001)(414714003)(473944003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 10:29:59.6886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0867347c-502d-4f3b-f090-08da6003a521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1549
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 jie1zhan <jesse.zhang@amd.com>, lucas.demarchi@intel.com,
 open list <linux-kernel@vger.kernel.org>, lionel.g.landwerlin@intel.com,
 nirmoy.das@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Vijendar.Mukunda@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

enable signaling after flatten dma_fence_chains on transfer

Signed-off-by: jie1zhan <jesse.zhang@amd.com>
---
 drivers/gpu/drm/drm_syncobj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 7e48dcd1bee4..0d9d3577325f 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -920,6 +920,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 	if (ret)
 		goto err_free_fence;
 
+	dma_fence_enable_sw_signaling(fence);
 	chain = dma_fence_chain_alloc();
 	if (!chain) {
 		ret = -ENOMEM;
-- 
2.25.1

