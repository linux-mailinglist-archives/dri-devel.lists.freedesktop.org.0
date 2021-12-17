Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461C3479713
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC47B10E59B;
	Fri, 17 Dec 2021 22:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C87710E476;
 Fri, 17 Dec 2021 22:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moDTOe8RunI3nLUyW4dMU5S0Lt8lRsJezTcik+Wp5HQudKxSoAKp7/t7GdIt2lKXYcRGM/EBjpkL1Phn9rDRYGHU8r3a/94XaD232SD6Zr21wv4gTch9qgFlpcjar44y8Q69PLqR/ApJRWyFhb7thxUVxNm97NMzMtFLiAhLSAXEy/RY+kkOhVULC5DpOn4MWXhziOpUyLyJ3aFoKkvIAzoEkcx1aHgDRruozHMOCUJLDCqY7P4CdfbZyi+NwYhwss5RBHQEo2kz1CXWRaHg21nfGGpj3eW/pPxEg4EHr+4AWzm5xaYqlMs/KX25CvrRxfMNbfnijjIIVH7+yiVQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiU6Dlu72J8ziU34UuyzBLkKJjk+lbJAaJtvtOq8y1E=;
 b=jtF6yXQi5PgXDCwJNUoGl03KyO9oS+H070mARNMZut7VFYIOAjDj2rDNimNmEKukD6Bbqs7n6K1iHrUcGT1W4NPHp4sI2BmzEIZ5j/YUfsXD1tANquYTo48r8OD1UG6VD9kpm56cfwbeYAPmsUyPdkBN/F4Ez042bHo4bDMfN1JRwWJebqa7ZYGlF9Bz8WRvVQ1ID5+8VPng6FCw6QbtIIFCIfl89MtvMylLs21KwWV5M6BVj93FC79myrxuCAsuYeO81+pI5L2dxZGdd5ehOfwM/Jo9y5aCsKUdc8ekZWjPBHvXlZkzWQe05JXZD0+iPMPAD0d7ge6QQ8faRzJtpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiU6Dlu72J8ziU34UuyzBLkKJjk+lbJAaJtvtOq8y1E=;
 b=b1652BMcepjr01t4WgVc98Q66M1YqIWlSzrIBo01k5AuZfBB+uxux1Temel6g0S0O7JzBkl5McoXIV+8N3eUP+5nW627tPNx/jHHLTmEaW4eCzZkKgRroSIXfZmFtS2hPA7g61q1xq1OcUU1GOKjiPvRtepkbE7mAaHs7lYBo6w=
Received: from BN6PR13CA0070.namprd13.prod.outlook.com (2603:10b6:404:11::32)
 by DM5PR12MB1225.namprd12.prod.outlook.com (2603:10b6:3:7a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.16; Fri, 17 Dec
 2021 22:28:09 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::fa) by BN6PR13CA0070.outlook.office365.com
 (2603:10b6:404:11::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.7 via Frontend
 Transport; Fri, 17 Dec 2021 22:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 22:28:08 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 16:28:07 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC 0/6] Define and use reset domain for GPU recovery in amdgpu
Date: Fri, 17 Dec 2021 17:27:39 -0500
Message-ID: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58ad9de5-760e-449c-30cf-08d9c1ac80ce
X-MS-TrafficTypeDiagnostic: DM5PR12MB1225:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB12253C849632D8763C5EBDA8EA789@DM5PR12MB1225.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfUyNnl2DK1IjYdCHyhDZgrYqwlhFP1/dRUUC5E0eYkj27+735SWL18Kv6iKCb7gSG5aGcQngJavZmIuxvgc3gFex5AELeMY1Bj1IOBYISQAvLQXzZY3rCmRqD+1yQcS6LvtH2Byz9OOXHe2Hc67hrmlfq2yAC6/1hC8g2iC6aRMtOSIGL+fBs52a3wkobTfNZeAFyMkA0aaPp6j3IeZReLBI8LNiIuTWKqUnAszylFKs/U4vSA48LT5MRqL92cvnNYfeAUDnYQ3WcxhrXKnw4dyKlHNnotQimyVaNEUPX7rKAEASLIZOl0SxrPUrlnKppEq2WJU13bLrsm/3+NzXKD5u0IG80HJWeXWragiacv7O7T3orNVC762a5hwYfp0T9NwYNALBGqrViYZyBvLgmxthe4AqTAHZNAYAq+E7rsQFzOqO0FWBgsSKT7d1amfzRxheFR67ScGpa9jIjB66XxHrQTW7rNaJGOgijpX5EKXAY2bicZ4SFKgRCqweLOxTXkSzXQZMVvAa07yfqbl5YyVsreiV2mWTDLdwke78a6CtoiXE4r9Zr3eUP8fCHv5/CdScxhiJFjgPnDw9MUR1LbMhneblOgrViEuQ5/q9my94nloLzcUbWIoprWKt/sq6LSchHgqFrvRsxYlYhdur+wf3QMcczp1nlc1GjhANucdN7lcTM2YjUqvS23VTpwHiL8cDcRP2uQm7J5Z6KfJ93NKRog0UVHmwZUc69aBHTk9OKkhryrccD3vBNQfOS1aTNlfr6hMNmdjU+pLpn/rDD5tpcWT0BlhMLGAXqxz91oGZ3uXW8/Pu9p7QVcS0kCWebppqD+7cZ/qkFq2Uf9OpodLF+MAes9/wtjTerLhQXwdV02v+FEdib4QgYycw7RM
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(336012)(26005)(81166007)(7696005)(966005)(86362001)(16526019)(83380400001)(186003)(508600001)(47076005)(6666004)(70586007)(2906002)(70206006)(316002)(54906003)(4326008)(8676002)(110136005)(40460700001)(36860700001)(1076003)(8936002)(82310400004)(356005)(36756003)(2616005)(426003)(44832011)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 22:28:08.8699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ad9de5-760e-449c-30cf-08d9c1ac80ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1225
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is based on earlier work by Boris[1] that allowed to have an
ordered workqueue at the driver level that will be used by the different
schedulers to queue their timeout work. On top of that I also serialized
any GPU reset we trigger from within amdgpu code to also go through the same
ordered wq and in this way simplify somewhat our GPU reset code so we don't need
to protect from concurrency by multiple GPU reset triggeres such as TDR on one
hand and sysfs trigger or RAS trigger on the other hand.

As advised by Christian and Daniel I defined a reset_domain struct such that
all the entities that go through reset together will be serialized one against
another. 

TDR triggered by multiple entities within the same domain due to the same reason will not
be triggered as the first such reset will cancel all the pending resets. This is
relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
those will still happen after the in flight resets finishes.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/

P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.

Andrey Grodzovsky (6):
  drm/amdgpu: Init GPU reset single threaded wq
  drm/amdgpu: Move scheduler init to after XGMI is ready
  drm/amdgpu: Fix crash on modprobe
  drm/amdgpu: Serialize non TDR gpu recovery with TDRs
  drm/amdgpu: Drop hive->in_reset
  drm/amdgpu: Drop concurrent GPU reset protection for device

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 206 +++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  36 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |   3 +-
 7 files changed, 132 insertions(+), 136 deletions(-)

-- 
2.25.1

