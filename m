Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913BB08F95
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE30910E832;
	Thu, 17 Jul 2025 14:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nFdovdje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892A510E832
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoL7raZ9wvf4hnRHJ5szHXG9iRKWO9lnWjbOUD+DwCaThzCgm7ud1BkI9lwtpHyD+g6VTl456T5N3tpiQNUQ0pdI5xVpJtwRgLkpR5d/WxS6IeHDX26/NTgIBo0rqhfffAz99uq7OLFz3ayyAaFGFE9cUaM62p4yN00dPVzK7C2DTsNbCzHVnvsfdHPzWWLVTI8oQRfttx9QYpOiW5LMF6BAs3Thb/6zq20iZqJj+VCJWY+8z51fsxJiGTRR18nLSfLeL9p+gUfqo5GRfNMKIUlQ4d6qlXkE52+7pK/8wO20X60ebbcbpqUvAvBFcxxvfLfoH8wjiv4Zvqai94IrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otxjxM68/vUNmqbjzOtayymd2XaiB1xLy5V/DOwLvUo=;
 b=oK4m6jE/rlUxNq77LpIBCnZMP16sxGAjJJRWgnBhYpR0ArFVwcVYda4Xmd0oSjq+J7yURE595CE819nG1541VpH6x0q4cX+Uvw5XvGD38hxqs+MMzMU7RHlwz1cTnvZHNb1GzTTawZsjolpW7PbRkhxxK8GP7cV82yIeXB8PcvmtXk6zPtYnJs9lwW7+bidO0aexSduTg1xKe8/ZpakcEkUJIas+DiYSv4Wyaqh3ugZdi+8Xsxs22keIJszX4G+8ugPQkZXClgxmOpgy0aZkwraSjBmANYGZLS+8MFY3gQJI1dt9zMDfjT1ri8xe03VGgaDjrLVv9jT1SpxDmgAYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otxjxM68/vUNmqbjzOtayymd2XaiB1xLy5V/DOwLvUo=;
 b=nFdovdje1kTqkN9fAuAdciNDdY1grzXC3GMf6PtErwrYdcW/FRo+e8hPf9NxiIQ1oUFvuhgNceA1X3H0GKFKZsTxcpZTKbKv9evh2I3CIi7OQJUYEw6mnqhd1ImLyS7gjhNBi5XwBoScON29S6OAb+TUu+RVBAcs2pOc4DCaShU=
Received: from MW4PR04CA0169.namprd04.prod.outlook.com (2603:10b6:303:85::24)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:36:14 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:85:cafe::34) by MW4PR04CA0169.outlook.office365.com
 (2603:10b6:303:85::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 17 Jul 2025 14:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 14:36:12 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 09:36:11 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: Add CHANGE_HANDLE ioctl for drm gem v3
Date: Thu, 17 Jul 2025 10:35:54 -0400
Message-ID: <20250717143556.857893-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: f7546cec-72fa-4aee-fca4-08ddc53f4743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/I4Or4CKe+jihyI4ssj0ap48Q+GcFkfsj60xHBLlbZNYOxEtkXJ4fCrAdrSk?=
 =?us-ascii?Q?1waMtL0PEZApppCbQjuQLZQ6NFprTefMTcNlXKs4HwqeDp8Qe6jwr+9EgtpQ?=
 =?us-ascii?Q?S8bw5r8F6wqNoTgbjrtqN6E1wcVsZhpl4wXi2LEKv/Y4sLMJbeRWj48ptXlA?=
 =?us-ascii?Q?ToXOlzFnyqpBiWHC7SgH59uGL886Aot1qr47e/1nzRAq43Iq4qlmSdLBFP+Q?=
 =?us-ascii?Q?kZ0427LtiEsbtmgDYm3kDOlTCvX2udQ3ACVLbwTE7H/cJ+/n3uAcXxGIXFw8?=
 =?us-ascii?Q?rwh7RAAHnGOOQLCHjvXs9ZS+0jIJQ5E6wpcbZWPFJknPoal/DxspCaoRGL9i?=
 =?us-ascii?Q?u8eoYt2PnMcT6jvdn3FD648dWojCen+3LWv6Q924QgWvfIIsSzUGg/4fl0xQ?=
 =?us-ascii?Q?o0ZOi83C2v39k8KmrbhqYLdmZaFZ4MmKbJEtvmAvtvyFAP46t9D92HnUWTsI?=
 =?us-ascii?Q?gX0iXwSa9bpU+gV8UJ9tPDHs5eC47jp8vllFkJvG9qeknw6zpawsBSpcFJ+O?=
 =?us-ascii?Q?puJWykzO54W81jsEAqOif4t6fTedV0/ZGTQUqrm0uEsihnRVnnukQEbyY+un?=
 =?us-ascii?Q?EV4LGuQo0X8GwSgeMQILWLANagP8IXDnaPZ76wpA9XTJkZDAp5HawF0MUQ9J?=
 =?us-ascii?Q?bpPp2yV7mYoFoInlbcKR7xMkmRT3Ciydzm+HP+cQgYCoOSztSb8tzTLm9PoA?=
 =?us-ascii?Q?BlRUR7GsBtUTLpaJvtfDYYqHFw7C5o380WCAkUriOXySPMVEcbw/Rdw6u7m3?=
 =?us-ascii?Q?mlF+jXlPzBtsw8ho43s0X/QnGc+k9VGw0eu8bWY9UBT1mAwfSVv811HkdOl+?=
 =?us-ascii?Q?YPKqmpbgr18sTL1FPO0IbKzaf8g0W9jxSXupIo76jWgFX6IYhLHpcS0crVCg?=
 =?us-ascii?Q?Wc5YnkIPcG5C5ismpU4gFyPqlhxBhY8dI20oQ2IiRJJxKiZedHoQoUkGb3ij?=
 =?us-ascii?Q?2Y9lGv6znC8YvVZm4JqILnf7E9IrwoyYXU1GQkD4hHF2Ye99Yh0uS+Tsepom?=
 =?us-ascii?Q?ZZx2p7MH+fG+8ZZlQajsgF8NgrCWWwqWJ+j13pewnSDKfJkdl2a96ptwytZz?=
 =?us-ascii?Q?iVGNxhYco5kkxh4Fws11fn2eoeo29VmvTG5NsIAzUEaQgYC9Yucyu0uCSd7L?=
 =?us-ascii?Q?3Gxuj7LjRpk+fUAy31uBIP1Ao+96nm+7wDXGUaKCZH7mcIETRXJc2L6oscJU?=
 =?us-ascii?Q?jdjYKps6ibQrF1SOzTOCV3txkQfQhNUspAUgUmv8N2KFV8E8FfOUfdSqphr8?=
 =?us-ascii?Q?cvywMpSTrJL6NlMi3dQ2PWXdFzWXZ3XypG1C87kO6v08IkJhJRQ2l3yH6zpK?=
 =?us-ascii?Q?eE77SK3AG+8NApHjEs7ZYZxLJrP6+l/PNly5roUJnubcnibnEZK7ovgX/v+T?=
 =?us-ascii?Q?OlVI6JosD35Q5DtYkRjmQHoSK0ZKt/R8Z/yqD3hKNT14anvwVHgX3+3MOauP?=
 =?us-ascii?Q?XefHR7dFicN7XTb3wF5S5ufcQOpJrbwyBFqiGwtOw/JPUoFyzCpbEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:36:12.4390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7546cec-72fa-4aee-fca4-08ddc53f4743
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176
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

This patch adds a new ioctl GEM_CHANGE_HANDLE which is needed by
amdgpu CRIU for dmabuf.

The ioctl allows a user to move a gem object to a new handle.

v2: Move documentation for this and other drm_gem ioctls to drm.h
v3: After testing with IGT, fixed return value on success

Accompanying changes:
kernel (for dmabuf CRIU support)
https://lists.freedesktop.org/archives/dri-devel/2025-June/510996.html
igt (for this ioctl)
https://gitlab.freedesktop.org/fdavid-amd/igt-gpu-tools
CRIU (for dmabuf CRIU support)
https://github.com/checkpoint-restore/criu/pull/2613


