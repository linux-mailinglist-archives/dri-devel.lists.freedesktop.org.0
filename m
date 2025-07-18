Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29615B0A690
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7725010E9D3;
	Fri, 18 Jul 2025 14:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J6KvWmhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3513C10E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 14:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuMluZPeo0g6GA5d2wqJSBI8QZcQd/kusQRu6FcE6r4Nnf2f4lPTd6fnYUxlbBMekcRzHeG2StCLSDUitKRxMm4HPd7PuI5RlHXvVgQH07M00vOva9Vs13vWtYiU7nPaoD7DxzLB5whhRcegTkA1woodTASK6C3xt47Dwr6a7Lp1u1bg563fWJb5B9qxUDgEyITKMbdm4vCmY/a24HPTDFbHLPGxx6MQ8ASQZdnNk0/DdGOJnbSbKfGAXbKAQJU8SgLXhOHnzqTqO4vulePjFDtKsMU1QPZEIt5a41Sc+mv0DNPx8JnzaYkZIYxZaMEoTqscbckCajozCOQFejKPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FACYR25BDJbTj9Kdlntk75MISpLJ3uMrDuJsf806clI=;
 b=ojQ9SFH4bgWs5OLkuzmPoAdBHHWM9g8cyt4W29zal6gpjHDllw68Trkdq11EwkNxQaiExdXsR/KJrwmIRcpQP2LSfMFzfumJHjhYJAdrAwHDrT7trA7UHKtozs5nLLtt7//RnZuJ1bTbc6zDSZBS5RAhY6Rl3EoUqd91lKsaIWiAepls+Q0Av545g8c0LB8kFheJlpLHSWZsvFOxAGlezqO0rs+5xShvTe1jeWV2J4rB+JZQIouW+pPvucrLQJKuInw3L3wmgySyHoMmeSUWHBQsggk638ga3pHCMX3TwRzL55OR0l/mPCX/lvyu5M267VwjAt5KcReboEnEJr4DyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FACYR25BDJbTj9Kdlntk75MISpLJ3uMrDuJsf806clI=;
 b=J6KvWmhsy0lFoVm1pt6/tUdVhdqVsMnJwByzKZqQxVgUK0PLR9MDu7h8epJYn+PqcUpOgfE+lC83m2JPwE8fKFQB/nyZxoKeJOqdZNqTmYCGcnTcf+0AO00h8evpBA1Nxo64c0Z/cgFlbB0PFLHqyi6feS1A3GOLuFgCkkEj/wA=
Received: from CH0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:610:b1::13)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 14:48:39 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::57) by CH0PR13CA0008.outlook.office365.com
 (2603:10b6:610:b1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.15 via Frontend Transport; Fri,
 18 Jul 2025 14:48:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 14:48:37 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 09:48:36 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [PATCH v8] Add CRIU support for amdgpu dmabuf
Date: Fri, 18 Jul 2025 10:48:20 -0400
Message-ID: <20250718144823.1157760-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 9841fa87-2c3d-47c6-be19-08ddc60a2de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZYMbUBhgctSZBG6AOJ8keoZWOwyXWLvkIVRWEV8+zj02664KiOWT6ujXVTja?=
 =?us-ascii?Q?b60p1MvwWscPQXwI2qP58Q/3X43cD1l5kVKiSNmeP3gFkN9nBBxnZhQ3e1XG?=
 =?us-ascii?Q?zyrIcr47uyib/CPc7MRxWYyCldCPy0nBDjQM5msEvrYxEIL4kSqCDquk0aCu?=
 =?us-ascii?Q?De2csh+P+rJ5mYpzah4nbbPO2EFBHm4HB4z0hfN3mfCJIqWg8dzLm1b6bV25?=
 =?us-ascii?Q?oQvz/q/riZTtbNAwBqT/+up7JxVwm7lfyYlcatXPfAVv5cBGZyTyW6m/L1W0?=
 =?us-ascii?Q?V3/nNKAP40oB7d4GneHEIwozYrtIph4jP/h8L4/1KntlrtzPIzQGqD48QnnP?=
 =?us-ascii?Q?gGlygODmT6CJY3cBuGmSIIMGU6lTlvmghHTIDnxY8mnCgd/FEkQxC9riId6K?=
 =?us-ascii?Q?2aF9kzDQ6nigBtlWhlBdarWS9yB3HMZzQ5RkpuNJPzsAoM+4YIv2sg7spSNq?=
 =?us-ascii?Q?fyLB4ctaaggfHg5JSNrItUeXiVG8VKpw/X7xkJx18ota3erJ+FKTQVlR84no?=
 =?us-ascii?Q?dYY7oWQ53J+/EAGuPzgDFSwbTIi8vyDuZ5hB+Ia8hLm57mP0e9M8jlhi/n3F?=
 =?us-ascii?Q?AXSTmkdBdOKffikNdqwhr6SmvAEtmPw13STUZb2X3qAJf9pjrXILvB++VPua?=
 =?us-ascii?Q?9591+0IE2xS4vXKEJvufO+FrTy/C7i7fxaArfA6+NG/PnJ5sTih7VQZ7XO/z?=
 =?us-ascii?Q?ojZNrhWAnxo+51QGyj6NfVTWoJF3k3mEg7gkFTqex83p9c8ZGK5qpR23N3pp?=
 =?us-ascii?Q?C2U1vp9BlcGLc/WlpqttO7DQjmBGhLd9dL31LjbIuBWeiDe0LlyNnNkybr2o?=
 =?us-ascii?Q?zTBF6WGeKU3ZGIOzYijZrFaYGTQmVbqhmHWjMsOeeW4XsAg95pogorVMxQKg?=
 =?us-ascii?Q?HjejuBpmH0ipIHIp5mL1cr04FcMK74L0dg7qohcT+Tx9t3SAptPHSt4pBlAp?=
 =?us-ascii?Q?s/TsaI3mytVJ0ywq6rYxBho+U5e5Ig1BYXGBq6L+YOylhAJVF3QBtWCO5Fmk?=
 =?us-ascii?Q?Y9cmSugLBFKgSk81TNTraBuciS3K8lKj7dJ8Xai0qqBRLrT+BpmL+rBHKf3+?=
 =?us-ascii?Q?7dZXWudExPfxlPjVwWfTc6J8w4lxjxbpQ0YD9n03Hm2tPcYJxM6SeoRa36lV?=
 =?us-ascii?Q?6TbfjoDBhacwbhlOXNaFx5y2RGqYP8s8QPThOTpHsuyK5Dh3kJFBQ3Esi+h8?=
 =?us-ascii?Q?APGImzvhiate0UDSz9IL9y9ze/nkTu1ZVCYGJMW/j3p/t0is6XTz3zJhW0yl?=
 =?us-ascii?Q?44t0bkNyTIea3Ukn80ol8et7Xl16W/aCxWs9zVt7jvehJvbglCef6PEYBode?=
 =?us-ascii?Q?+5PsL/QLGAxwobhAFKrfH6s5o/wdKcE9+SWSyHzqwkgOr2HIOaiS2uwR8pGl?=
 =?us-ascii?Q?jKiVTef45c35jDI55Or5RcJ5swHfwM1fxKQqpw57/YDA7/pkdWgAcwotrq01?=
 =?us-ascii?Q?1OiqtByaDU33PytXpSawyPwuAO4yi63I8A+fK3RHzFfbcQr5x6lwhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 14:48:37.7350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9841fa87-2c3d-47c6-be19-08ddc60a2de7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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

This patch series adds support for CRIU checkpointing of processes that
share memory with the amdgpu dmabuf interface.

This v8 incorporates the vm mapping rework, which it depends on.
(https://lore.kernel.org/amd-gfx/880855c5-dede-4497-8ca1-916bd0dbd08a@amd.com/T/#u)

Accompanying CRIU changes:
https://github.com/checkpoint-restore/criu/pull/2613


