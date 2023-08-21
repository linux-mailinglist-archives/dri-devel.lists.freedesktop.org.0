Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF907831B0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 22:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BB510E29F;
	Mon, 21 Aug 2023 20:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F3610E293
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 20:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=astJaTqTugJOrR40rp6pwdODHmGVYL/fW+4fasD3wsh4ZqzqO/i1kb8HvsxftMbcCAzggMnP4cDuRU10/G9HVoTeW1PjNc10EdWbfW1r9l5WUYIfEzxf0gtQbEt8EtYRhh1Xg3Tjt/USY6j/YUHB8/xBmV8DfKO3Nl35It0Cn1y5rM3Ztx1mQjHwFhGhAo7DbBimThqMP7UNS9JH/QQnADu/xYeY0NedUAFcI9SPENHQyZYO8nf6A8aer8sQQvw8cFZCMzHrEScD2wkEGsW50W/VwKlPMeB2J3HWhI4W+GwLsPBjxVJGSObB2VzybEjC2UU3vzlTG5F6jfp9cXd85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLSZsl1LiFocSXr5ez9zazk2ROfKx5wST2a5DGnpjnI=;
 b=mCq62Kd6WRccrTAYyJB73tq1g7qYRHL6zJuU4MKKXZTGDEvHhyY+Ud4T5LFmUReiCCvv+1iW+q1DVbS5cf9YJk/x64xOzNJCd9JnwfCrCSQ4zbMa6jvT/wSHxVYqlIgapBvBErrJuy0XPU7r6rpr9EW8gREY8/qpyOHzHcLKLvLaBK/3itwhaoLj6eedBW2+Mn/b941OE8NsqCgG3Iyml4iS5r6kZ+ogeTX84Ri2CKRymNaNLeF9ps2VTLIitHYfmtKSv7jr4OEw9Zz5Jb+5d3s7XsnMyiedFdv1DGuEZyY4H/5NEf+GsxPaOYq5FKzb1hn2N9Jk9OiMAUhqBfQeMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLSZsl1LiFocSXr5ez9zazk2ROfKx5wST2a5DGnpjnI=;
 b=1nZPH8pyiXoigeQdPqnCPjJLsCKOBk2EC/u9taNc/tZJNm0DIo8V8PIWkBcXzrmzdw/fggUoz4zelTDpQ+jPG2TffnT/Ar7p2Q901OhgdKMPu542/v3faLCLRKOuCMjxQfhHVXhkzjiUT6D6j6Xtzk/Tc9QIoGOb1zUyGqSLpjI=
Received: from MW3PR06CA0029.namprd06.prod.outlook.com (2603:10b6:303:2a::34)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 20:02:24 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:2a:cafe::ea) by MW3PR06CA0029.outlook.office365.com
 (2603:10b6:303:2a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.22 via Frontend
 Transport; Mon, 21 Aug 2023 20:02:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Mon, 21 Aug 2023 20:02:24 +0000
Received: from Philip-Dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 15:02:23 -0500
From: Philip Yang <Philip.Yang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/prime: Support page array >= 4GB
Date: Mon, 21 Aug 2023 16:02:01 -0400
Message-ID: <20230821200201.24685-1-Philip.Yang@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: d7198be6-bf4c-4149-adba-08dba2818981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ay7/qnC7PHtLPUaLBqXPDvhN0Kx6a9JgLIM3ok42lQyVL984N5QLYdFQ+VdJI3qRM2EYWO0Kl+1NWbThUTHXojng7+VFPsL68e9NO9cXr37PJ0QTrAOlf0H1iFysf+vwyGwaatkmkUeP+++uU37j5VQM2ZWldMArmB9oRXwp1YaT2CNdzxFAFehvVsWLKn3cbUnBOntwJ3CV+EbeRmKC0mausbsQrSj9nrt6B7RI+0aP/fvZ8da8W7yjss4dPb51JIDKQ9ycgQ8AS8rhfs+TRFXzt7ynluLbqvKEzFvXOwUIiN4WdDne08Y6+cPx9i4wvw96Wv0ltHPo0PVaniaLUFhmzYFAQ1sPf+XbwUvZuVY728FLh5zB9oifrsxVBL/TJb69xAxMu2FM8rbjHOc4+Z8Vsg9wfUVhuPg+dtWf2rRew+wv93eXZkc2tkjI89cXaqAtDB16skaCxtgr2AIczaGqF9ozAEbWhJSducx2qflJ9Nw4wNcM7HknkQ7tJIZ8Gn0/UtC1gdsrULkkJQE1P93oDad/jlDo1vzF5XOjSLmqDfdzGLwnEV4YILOqZOTy8P3hloTSaVtHnnApxIh2/4HdpoLvtHHGVuAHgHPwN//zz6jA0Yz3xzD9YwKYKJfz04X8yLef7KyLK/X5ecVJDrsN5i9N0tE+tAdyD5X4f7GJPOXVAuxud9QDct1R8bzl0VBK2yXK0siSk/+sK+YxXN4yuPBemSnESOQwUEJGjoLJmXGiznUsfK+s6x7sogRMIJWrrz0SLG9oDB4E3Ikq3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199024)(82310400011)(1800799009)(186009)(46966006)(36840700001)(40470700004)(86362001)(5660300002)(70586007)(2616005)(41300700001)(4744005)(70206006)(316002)(2906002)(6916009)(54906003)(8676002)(478600001)(4326008)(8936002)(40460700003)(6666004)(7696005)(26005)(356005)(36756003)(82740400003)(47076005)(81166007)(16526019)(336012)(36860700001)(426003)(1076003)(83380400001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 20:02:24.3109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7198be6-bf4c-4149-adba-08dba2818981
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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
Cc: Philip Yang <Philip.Yang@amd.com>, Felix.Kuehling@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without unsigned long typecast, the size is passed in as zero if page
array size >= 4GB, nr_pages >= 0x100000, then sg list converted will
have the first and the last chunk lost.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index f924b8b4ab6b..2630ad2e504d 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -830,7 +830,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
 	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
-						nr_pages << PAGE_SHIFT,
+						(unsigned long)nr_pages << PAGE_SHIFT,
 						max_segment, GFP_KERNEL);
 	if (err) {
 		kfree(sg);
-- 
2.35.1

