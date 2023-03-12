Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D86B65AE
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D1810E36F;
	Sun, 12 Mar 2023 12:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC6B10E36F;
 Sun, 12 Mar 2023 12:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLcG1DCf0wfu/lrin0oRaqN6QBNtywb+IplYk9O4zik25QQgD30bnT5J4gjZWzvYBeLG49mPrz1LTj0f0RQa84KkzSfkB+tSel4fFySSbClAr0nebZ6zoPY//DsoOU5Nv7LnrE+tcAH6wqq5rn+rHBZsjLfXpS8uR7EZ0/NnvccV2sqsFwOt0cY1IwXZUaB3qwLUvLGHbuWEU0DJNEDCcyxLt1o9uaECxJZuFXizlCHc9UtKQBwxPNVDcM+NtEOza92oxHxW1YGrqMA6bGjciChqBrZ/iFp4+osnHEpZ3f1mrawA9TwZzg31/LcvgGObBePO2mTTtwtqoVCtRPCOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vERtBQZO4btnLGfti3VSOefpivXiYTBUA9KHiM91onM=;
 b=mRUHowUkoibA+y3yuIucX9n/NuJ61VNiLm0wYNyJR2ZstnGN+xH/115+zj7Gh2v6/kZIWpMIM5osniFHhpBYjrLs+/JHaUR2oRtrE8K/wo6o8lLBqYthnTSXB2q6fxxocrVAPPy+F9ezhPml37Ct/KC5Ht2xupOUy77TjwR0jvosLlty9FYbm3ByTPNJ3sYNOS9RYG7O45WB0GSrG1aEOFlBoExDrYkES4qOgQ3YyIJrIWjgVMIMBwruQCqTVqMQb6RCO8jdQ+ix86Lcqb6lIjOgVrz0li+U/KmzINg4110ROG9cfMT36A8Npp7CkZRteWCKRIwOGuTciE8atv8SCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vERtBQZO4btnLGfti3VSOefpivXiYTBUA9KHiM91onM=;
 b=N1lgjq+qSA9Yor7xsm25sk5Z8A/clJPGoqZlmFyeipAjMwDXYwSn801X6o4aPVbaOJktX2/YmshQiRYrVztTtsqV2awjhsDfuAiktu4KAOjS9N9S565afWn8i0rN/ual76G2k2b74WsocP+TLTZehvc/OxSLsd4l5YgiawBmhUg=
Received: from MWH0EPF00056D0B.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:b) by IA1PR12MB6484.namprd12.prod.outlook.com
 (2603:10b6:208:3a7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Sun, 12 Mar
 2023 12:02:29 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by MWH0EPF00056D0B.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23 via Frontend
 Transport; Sun, 12 Mar 2023 12:02:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 12:02:28 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 07:02:23 -0500
From: Huang Rui <ray.huang@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 2/5] xen/grants: update initialization order of xen grant
 table
Date: Sun, 12 Mar 2023 20:01:54 +0800
Message-ID: <20230312120157.452859-3-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312120157.452859-1-ray.huang@amd.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a5f9d5-9c4d-4d38-5abb-08db22f1a6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMux3Bv4HXWKFfc1LCihWGJ726Lphqqk3roevqlcSWm466fAZx9I8APnJQi2dTwz2Y3WAj21pkO9JQwG/1kMmON8R3ybiXGy12FD98jNT3WdXXzobMHHoaxWBcE8O6WjpS0HKPkrzVkmNKvcV/9X2fcQ7tj9q99Cc8INvQJmWykQx6myPm/ylU8H40TAuqS+3GI0lEostDtgh6akAk/iUR3sQohLV6CYIRRx4YH3PaaTFR+YXfCOS9nRazoWQTxmEEmiL25+BcKRCkDfPHhl+NqBVLyvdl41Emq8WBobOZeSrn31xlucmNtQu//wkYXI40qtr/+iX/K/OtbSL6TUCcu75QEodfj+dZ9JIJ/5y3Rql8lrM9ZK4ErE5pQ2Zq2tinsrTcPXtxxSimckcH1mIh6GHRPfsr7B49P68rg1ksIbaLUxmr3iqbhIWVSV8k1EQezSDTa8qqGxReJy2M5wCiGzpH8IxUxOvbZV10PNjNPeUjKxnahOc86QNSwaNraIudjZyNFfnCXBNtVAqC+JDUEtjaRpFCHJ5PimMhPX1UlFSzNd+lLAQjH/ucRHDis4kHJEMhT3ztf6cOCpxg2CgJ+Tek4z7EFky27/MsjhxO9kKWkf5wk2GRcQlFwo6xnHuARBu1/BH/Yxc96IZuiuQyOPfFjhz1D4SkrZv3WJDR/FoYn7ac/CX05AhawvD0ygvPW7EQwLMTw9zyxyTxv0krdhj74w1fZe3ZoAXF/KKls=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(7696005)(426003)(478600001)(83380400001)(36860700001)(6666004)(82310400005)(36756003)(356005)(82740400003)(110136005)(47076005)(54906003)(1076003)(336012)(316002)(186003)(26005)(16526019)(7416002)(86362001)(40480700001)(81166007)(40460700003)(2906002)(2616005)(70206006)(41300700001)(8676002)(8936002)(4326008)(5660300002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 12:02:28.2302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a5f9d5-9c4d-4d38-5abb-08db22f1a6cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
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
Cc: Honglei Huang <honglei1.huang@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The xen grant table will be initialied before parsing the PCI resources,
so xen_alloc_unpopulated_pages() ends up using a range from the PCI
window because Linux hasn't parsed the PCI information yet.

So modify the initialization order to make sure the real PCI resources
are parsed before.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 arch/x86/xen/grant-table.c | 2 +-
 drivers/xen/grant-table.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
index 1e681bf62561..64a04d1e70f5 100644
--- a/arch/x86/xen/grant-table.c
+++ b/arch/x86/xen/grant-table.c
@@ -165,5 +165,5 @@ static int __init xen_pvh_gnttab_setup(void)
 }
 /* Call it _before_ __gnttab_init as we need to initialize the
  * xen_auto_xlat_grant_frames first. */
-core_initcall(xen_pvh_gnttab_setup);
+fs_initcall_sync(xen_pvh_gnttab_setup);
 #endif
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e1ec725c2819..6382112f3473 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1680,4 +1680,4 @@ static int __gnttab_init(void)
 }
 /* Starts after core_initcall so that xen_pvh_gnttab_setup can be called
  * beforehand to initialize xen_auto_xlat_grant_frames. */
-core_initcall_sync(__gnttab_init);
+rootfs_initcall(__gnttab_init);
-- 
2.25.1

