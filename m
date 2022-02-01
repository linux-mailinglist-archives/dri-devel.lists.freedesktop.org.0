Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39A4A60A6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DB410E6AB;
	Tue,  1 Feb 2022 15:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D7710E69E;
 Tue,  1 Feb 2022 15:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpLC1zr9+lNrW1h4YPnfpuoPmOY4fggZGpsjcmByQmn8SwSJnNVBxMmLPs9+8A2E613DgFHWtZTza6RNJg/N6HiRp/cx58nttCMAwODoS3nHb9LwRnEh/LTPWwbrSl3c7M4nBu+d/AlMcK5LwE9l68Nrg6cnKDvLYRELWvIAMMETeOZBhJpJWgCgNiWLpCbJhGWziHa8pN6F4ns26V4rvUlCcTCXSTv4HDqP0vN7lloY7s9ImTvAbWeh5Jyxbb1zXyIwUfUnFnn+wTQ/QCX3Mc3Jc1tojaLgAxRWditLY4fse/y50GSU7epx9+PuWvHJFypDyuJQLTacrcHEng9hKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8c+snyg1lETNsdQ8VpQ4cgA8WAjjh8EpLlh6CLuAWAg=;
 b=fpz1sG10LX48K0Nmpj4CD813jzPS9rUs/1aXB5RDByvjuiGdPjqTHwQzTX+3Te5NgMVTxA3weY0OrMOPDSfFzmaVDLVWPlHMpfudhyS6c0JgfMOPt9b8SQLoK5yWiyliUM32brEqMvzd0AxQlylBjyTJvTS33PYS0RC1WMJxMYNcxgcKWN6XNoO07RmmMlDP+SK70oab9iNZUnCfy+135qMz473KoHW2ccgKnutQhDRiMXw3WLpUmnO2oQbEgUR1TYwjmwJWNPh4oSks/HBuV/feOo3xid0WxJsUm5xDWxIiMOiTGghXbjFE19K8ynY1+x/utqWku5v8V1uYmBw1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c+snyg1lETNsdQ8VpQ4cgA8WAjjh8EpLlh6CLuAWAg=;
 b=Pky2H2XWsD1tWeuvIStPVda6qmGiVe3w4fE/vyzBzUjU2dePHyZk9L8wRm+OiDm/MXjsiuZz3ErRHXPcOnzRIbe1ULaLPWnry3CbmVy8plIqNHLKOJaFzWxSWJhh69HdWShU9Eobos2yXDvYQT51goTu4gIMdIFnHlfJEuqQY9M=
Received: from BN0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:e8::25)
 by BL1PR12MB5029.namprd12.prod.outlook.com (2603:10b6:208:310::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 15:49:15 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::1a) by BN0PR04CA0050.outlook.office365.com
 (2603:10b6:408:e8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 1 Feb 2022 15:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:49:15 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:49:13 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 03/10] mm/gup: fail get_user_pages for LONGTERM dev
 coherent type
Date: Tue, 1 Feb 2022 09:48:54 -0600
Message-ID: <20220201154901.7921-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201154901.7921-1-alex.sierra@amd.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62171b14-3a04-40fb-0270-08d9e59a669c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5029:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB502916C0CE34D7F16359CEBBFD269@BL1PR12MB5029.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsjwECF0oe/Z5/yZvzizo06o4zbyMLd34IFeEwDMY3GYY5p8y15N0b9i1dkhCRsLSahRW2xs7bn+A4RVziD6yAME8LGVkNskimwXG/OM4LdK2PkhssOYi42OruEHvU/WBkesg9Wex0Z7/4AL+/qvq+Hx1hCeiy6ucSwCkhOAJrJ/bwcPKXS+RFBtSSP/c1nuWlnxRzqwwZkbmI+OnJrEIByH+slqA9f0FNpd6c0tpOcHvTkcYB5INuXJfVEkxUFvykWYcn1ElbUw4/0oeOi4pnei8+keQqEQcwew8nW2Ft6B8Oj6LIf1FUMVgemP8sJDAZgw7IE1TumcnQo4LtGAEYIuWijkyhprPypPDsoLeDy7h5AbltgSMWBVRCR23jjwETV+G3pMxt7jb8OUyiR9DvUoEuYjBC7NrzOJBo3W/Soy9IODSwohU4TTOB4A3Na87Jh7nbA2aH4OCAI7MMYjtTTzwBdSi66ZmaGlcRmm+ieNxLK7MQD23yFdK1edIIH/PSmskgDQw+9aXQrCD0WQsnPgFCCoTC0o3E4HO3Fii+EzlJQTHSdADHdP2umJ5FYMhi9jFauIcifwkFtOOiuexxOETjub2VpHCroa3AhUgtPXemHs9KvkPZwA1ekVEKOr7vh6j/ieeV6r8cfFQsxqEb8LG5FcTF9zyUqAJN3JQmrvQ6TGEG/R71Tq8E/xH8VGm9mpw9TMfLi3Qn3Yr9jBow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4326008)(8676002)(36860700001)(2906002)(8936002)(40460700003)(47076005)(70206006)(70586007)(82310400004)(7696005)(6666004)(186003)(356005)(336012)(26005)(81166007)(1076003)(54906003)(44832011)(16526019)(2616005)(316002)(5660300002)(426003)(86362001)(110136005)(36756003)(508600001)(7416002)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:15.8235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62171b14-3a04-40fb-0270-08d9e59a669c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5029
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid long term pinning for Coherent device type pages. This could
interfere with their own device memory manager. For now, we are just
returning error for PIN_LONGTERM Coherent device type pages. Eventually,
these type of pages will get migrated to system memory, once the device
migration pages support is added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
---
 mm/gup.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index f0af462ac1e2..f596b932d7d7 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1864,6 +1864,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 		 * If we get a movable page, since we are going to be pinning
 		 * these entries, try to move them out if possible.
 		 */
+		if (is_dev_private_or_coherent_page(head)) {
+			WARN_ON_ONCE(is_device_private_page(head));
+			ret = -EFAULT;
+			goto unpin_pages;
+		}
+
 		if (!is_pinnable_page(head)) {
 			if (PageHuge(head)) {
 				if (!isolate_huge_page(head, &movable_page_list))
@@ -1894,6 +1900,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	if (list_empty(&movable_page_list) && !isolation_error_count)
 		return nr_pages;
 
+unpin_pages:
 	if (gup_flags & FOLL_PIN) {
 		unpin_user_pages(pages, nr_pages);
 	} else {
-- 
2.32.0

