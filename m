Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79FF48A227
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 22:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2630F10E256;
	Mon, 10 Jan 2022 21:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C3110E21F;
 Mon, 10 Jan 2022 21:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqBnUwNrDidpwBkRsltfP5Vp3Fi6JMD9LyZTy7OQ7U3Gy8XoEiciXVXko8A6+Kbt4JcB5CNdZeac+YYaqkkkuVJRKcRaKYgNZ4GV6Y1VURbkxBoMQgM7mjp3QGakOpHEnqn7Dn7YOTln/yhf6Owfl8BbE523tRUvqtU42KrFSMLkv05KVzP56oB0XXpRI4wfhBKJ2pBhWC1Nsx67gntCxPXY9sFxAyV0Y8hZUdbg7CEN4yWcC+LaTyi5JJ5v52BCXmV/hrn9bwm5PKgzbd/rlkX1DqAdskjdZzCVUSZV515g81bN4m6bIXFvTGl1B/m1Kuw3/36p2UlHgaFBm9Bvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq0orgs6QiViCi88OlYCmzMJ0Tjtkpo6dc5guHgRDkg=;
 b=IUs4lYvyhEJXSoEVzlM+OEpOOxLTPzYkC57M7mEg0heCFTOg+Hur7MM6Uuh4m+qLBIY2pjhmyoJha5lE88Oenm3SGhrta8/d9xElWX7KIKnqxB72LBOBCMJZ1B3ezXDKepvnOwbg+VXL31ZD2gUqDzINQ8qYQO9fb3YwXJF+gMXOTMJmtA2hVEi3Sbc4uXJdYjfenafQPGKIZb36AwKj/XMZIBQVVCT9p+MHyNcrGl/5hWGXWc0MRfPOiNxtLkHWURyrwwidKoJeM+QvAjvLh/yYg6pfMFQ3D0X70VfN8NKSlUnLeo0azUIGEJj0ub2AZQk6uEMQ3qjILp8Idcl0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq0orgs6QiViCi88OlYCmzMJ0Tjtkpo6dc5guHgRDkg=;
 b=5mxfrwZMpxebG5yJ41inf4T7dTm6nji0yoUv+JXPo11Oj9OEtmfxM/l/FBnFP6YEYaaY2uDrwkLmt5JRwYJNMa8vhjg2Tywh8JokIjexABnZ/cGScosJApgrGfjokV/2kWQZyEKOB7nIWfFTCuoo6/no+EiOLm+GBJXqjQmDKJg=
Received: from DM6PR13CA0054.namprd13.prod.outlook.com (2603:10b6:5:134::31)
 by BN8PR12MB3315.namprd12.prod.outlook.com (2603:10b6:408:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 21:48:33 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::72) by DM6PR13CA0054.outlook.office365.com
 (2603:10b6:5:134::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.8 via Frontend
 Transport; Mon, 10 Jan 2022 21:48:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Mon, 10 Jan 2022 21:48:33 +0000
Received: from magnus.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 15:48:32 -0600
From: Daniel Phillips <daniel.phillips@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] Add test for hsaKmtAvailableMemory available memory
 inquiry
Date: Mon, 10 Jan 2022 13:48:22 -0800
Message-ID: <20220110214822.3175297-1-daniel.phillips@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53c54945-00a0-48f9-aabd-08d9d482f2c1
X-MS-TrafficTypeDiagnostic: BN8PR12MB3315:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB33157798AE198BB1BD4C5737E3509@BN8PR12MB3315.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tkx62pyJvuaHKQy9dQeNVCq5oRIu9cy91tWPHNXOqWqfKy8CVvy6WTsi2s2P705UecJ9b6IAKpYsdB7EEgrv5z/JUrBvpmEHomdtWUfSOXPb9gkf9hnRp8AxDl+xNTw+XHHm11XE9bzHFxpnSQ5nnBFQKopQYkJJaBblAqtL4ekBpIgmlP+qPQuZCjJx6rAOe5KT57UDlhuAiehlYqnhI90sf/u2oQZCL5FQ3OAk6rhRoiASLut73+jGmOw/MOadkOeHJcjkI8TLTNMQiIxPM/i8X58O/qGgGE3Cix9FAVTHH0aeuJQe4AkBiwAdoyL4chn/2ukyG+Ou6Lsrg/Low5IFgjdhjk/hV65VkPtmf/7lHfK23WjiZwqFruGA/XPuDa3LjbRgzMwuH+5fQ5WUO2KgrY4tWRfxOZB1lJOgFHBAeFEZ7dkUDCTYEQYA3xMA40Lu8oiVFUtI+7SmvXlrv/lpuKQ1s+XRcLoru5CZHj+RGhyK9TLcyhXAihQCjoAPJhWaTCXy/3FgVTsk+9lZXRMSDat+2wyryj2l7vmPsLHzC+NsL0pNrg6OLI5c0qmvQ7BnpvL1Z/CXBC8T/R35ziZ8nvMk2ss/v+gMZOaPUlPwjm6xbmM1Ad0aDLWk0kWhg3MmEIKXuSGbll9u+V9cVDy6+9iKeqMq8XudFdC9HR3LRklu6Fqz6TLxi86Z1AW5MNkRrQnNbvf0LTOjpZ1OvSzZXRw6AtEDNQWrSvUBzbOMLOd+4Gpe4BDm3fIqtPCERE9vhZ+pUMgUGeo283KgL5/b1J8lbYYmDxkZG+AxIZJ6L/ErV687evDVNYkExrZT42qoyKFVS8tN/215BQ4qgegtiBywz2GnH5IXwoxtIO0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(508600001)(4326008)(83380400001)(110136005)(8936002)(16526019)(81166007)(86362001)(356005)(186003)(44832011)(36860700001)(47076005)(8676002)(6666004)(5660300002)(36756003)(70586007)(82310400004)(316002)(70206006)(450100002)(1076003)(2906002)(336012)(7696005)(26005)(2616005)(426003)(19627235002)(40460700001)(131093003)(145543001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 21:48:33.2470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c54945-00a0-48f9-aabd-08d9d482f2c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3315
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
Cc: Daniel Phillips <daniel.phillips@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Basic test for the new hsaKmtAvailableMemory library call. This is
a standalone test, does not modify any of the other tests just to
be on the safe side. More elaborate tests coming soon.

Change-Id: I738600d4b74cc5dba6b857e4c793f6b14b7d2283
Signed-off-by: Daniel Phillips <daniel.phillips@amd.com>
---
 tests/kfdtest/src/KFDMemoryTest.cpp | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kfdtest/src/KFDMemoryTest.cpp b/tests/kfdtest/src/KFDMemoryTest.cpp
index 9f62727..1f93928 100644
--- a/tests/kfdtest/src/KFDMemoryTest.cpp
+++ b/tests/kfdtest/src/KFDMemoryTest.cpp
@@ -595,6 +595,23 @@ TEST_F(KFDMemoryTest, MemoryAlloc) {
     TEST_END
 }
 
+// Basic test for hsaKmtAllocMemory
+TEST_F(KFDMemoryTest, MemoryAllocAll) {
+    TEST_START(TESTPROFILE_RUNALL)
+
+    unsigned int* pBig = NULL;
+    unsigned int* pSmall = NULL;
+    m_MemoryFlags.ui32.NoNUMABind = 1;
+    HSAuint64 available;
+    EXPECT_SUCCESS(hsaKmtAvailableMemory(0 /* system */, &available));
+    EXPECT_SUCCESS(hsaKmtAllocMemory(0 /* system */, available, m_MemoryFlags, reinterpret_cast<void**>(&pBig)));
+    EXPECT_NE(HSAKMT_STATUS_SUCCESS, hsaKmtAllocMemory(0 /* system */, PAGE_SIZE, m_MemoryFlags, reinterpret_cast<void**>(&pSmall)));
+    EXPECT_SUCCESS(hsaKmtFreeMemory(pBig, available));
+    EXPECT_SUCCESS(hsaKmtAllocMemory(0 /* system */, PAGE_SIZE, m_MemoryFlags, reinterpret_cast<void**>(&pSmall)));
+
+    TEST_END
+}
+
 TEST_F(KFDMemoryTest, AccessPPRMem) {
     TEST_START(TESTPROFILE_RUNALL)
 
-- 
2.34.1

