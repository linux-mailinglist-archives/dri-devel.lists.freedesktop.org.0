Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08042842A54
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B267010F91C;
	Tue, 30 Jan 2024 17:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172C2112DE6;
 Tue, 30 Jan 2024 17:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dj8Z39f5uxMcK/cS7eQh5VyPCj60AOlq5/xddmLeOcmMSZw4+x0fgwDxnnE3CxaLKtALgbPZg7ZlrlJrYTgA07Iix4dUxQkR0KSDqsgiasIAz3OEbuODU6MtVeHnQg3qNdttdoXveSY8hNIbkCKqGKYZ/yfKntm6WST/dNoXuvLnDfeIiDPz+PVcCMRBMPmHyiU3Rq/mf9glcih5aWNO9v9g81LSFNkTCO8HDzq9jpheNMfZ6KqHlRPAKjjXYr5qI2Fi4A9d57OiPBHtRLmdSi/UVACRKWDr161s0hSouN0kGFFmdH+80MQQUUFE2BUpSzii//NZ5tb8Zz5TDiA7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yPE90Bv8Eo1imS8RopD4ZNhb1mToayZ/qz8hC8zZLk=;
 b=fS0lVY5++bw2xuUNSmDDzQAWN8+uLlCAlGOFm3JVCbV8zeMcVWV9EgQwsGVF9Tq5QTkkpqkkeNLp7c0HRfvpxw+fsCVmNMr+AS/H7DDBpEuNPkHO5anrOSJk+faax7H9Dj5h13JoIEpp0y5FkogW9TNyIUI1X/5WDe8j+Gu/kbG4564c7vVDB+MmVWfoPLEKNbX0LuFqltIV2+20fIhyhGQM4aqwmW9TGdwjutGjIWyAweb+JkXJA1W9r1yXekbqkAowZlS95ZbgzjKuv9Dx9573pDkzz5p1zb4V44eIx/UDKCB0sW3FzPN0UEsHYQ61raarUY4tVm770dlN93qLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yPE90Bv8Eo1imS8RopD4ZNhb1mToayZ/qz8hC8zZLk=;
 b=IXwsei964OPcrb/T7R8iGIK3M+w2CJAMZPWFgF2b7Uxx6yKZHGF9ZxOqFaC7aw6kRlLi7I8owDgQZDBgkqVoOh0kQ9BI+xBXRknC/z6eBucSjX8sTCUxIQaN+OsPtjEd6ua2EypCNjuiYkFj5BQTHSjd71exdkAxdP+K12hyhVs=
Received: from CH0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:610:11a::22)
 by LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 16:13:27 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::92) by CH0PR03CA0331.outlook.office365.com
 (2603:10b6:610:11a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 16:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 16:13:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 10:13:25 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
Subject: [PATCH 1/6] Documentation/gpu: Update documentation on drm-shared-*
Date: Tue, 30 Jan 2024 11:12:30 -0500
Message-ID: <20240130161235.3237122-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130161235.3237122-1-alexander.deucher@amd.com>
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 66be9625-606e-4246-9bfa-08dc21ae6462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dq3JKnQBZLfQ6sWdf052XLQI7fjjfYWayiMFHcgUYFZkqQuIEGg0Mu7x17nNcyOrZGzSPLrrd4Tiphb54Fb3xss/NBJfPPYsnylmku9vnSXOrlkpdSRwAPQKPGLzPets1/zlCBngLBcJXze+Uf8x6RNSP92Wn8gU0yRwtij5jeLBs/1UK8H6KBaobuch/I7CRfn9/xD5hfxaSUfCSNMGU8fhhPmZzDAY1VBVpIZWoVC5rcRq9E4Qw1EyzyPQGU0Avw3AvyHVTZEAmxfRDbsDCDFyqEawfcoDNbiAhgRZDw4RqitK64K0G7JF9RY+S5rnycybi4L/TBFZDa5CeWjIATuxcttmIkLZ56taA+iyI2KrqqUDVc9Pi+vCJrY5X+mLZSdArNA0IQ+1akBMQJPmHY0TrZC2qP0aMoNCkZ1mpL+9B438Vz0J8dRJzut3sOlEEZMNutj0bEYglrvx+EpoBabn292jTEhRV8o+kXAWGjlRrWlBTHRPktHX6etaKNNLopIFVEVKgUJrlaAm5oxfJvlbNcTiPDDVBXwDLheVS6U8znueKaWYvFJmgwPcWLjTh77gkJyFGVMEszw2zNmI9g9gny82h+nF61cf8LGQ63Vzyinv4ox3LGKAfjjYgz+UaSwCyEEQpwhdtHanUKBpl1XRFueMSlzsCUdsNm9M2ULJtYEUT3dk2HB+8t7q0WBxxHoYgGTf7sEAaJrMkZElxPcwGiQ4+XNsPkt63VBYBVMeFd/jNrD5CF4Iy1AaX6wTxvkyrRNHnPsS0Ke9dke7tg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(16526019)(426003)(6666004)(7696005)(336012)(1076003)(83380400001)(36756003)(86362001)(82740400003)(26005)(356005)(41300700001)(4744005)(5660300002)(4326008)(36860700001)(15650500001)(478600001)(2616005)(316002)(47076005)(8936002)(110136005)(70206006)(2906002)(81166007)(966005)(8676002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:13:27.1196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66be9625-606e-4246-9bfa-08dc21ae6462
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clarify the documentaiton in preparation for updated
helpers which check the handle count as well as whether
a dma-buf has been attached.

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 Documentation/gpu/drm-usage-stats.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 7aca5c7a7b1d..6dc299343b48 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -138,7 +138,7 @@ indicating kibi- or mebi-bytes.
 
 - drm-shared-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that are shared with another file (ie. have more
+The total size of buffers that are shared with another file (e.g., have more
 than a single handle).
 
 - drm-total-<region>: <uint> [KiB|MiB]
-- 
2.42.0

