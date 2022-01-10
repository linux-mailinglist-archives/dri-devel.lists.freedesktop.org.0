Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058EB48A2DE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030A010E2DE;
	Mon, 10 Jan 2022 22:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6FD10E38A;
 Mon, 10 Jan 2022 22:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK8HDs+RD7t1s6C//7qIiwFsPGzl2sxScZmSJY4hReRjjUd/s5GLWWn8X+9Dmaq3m1juJTi62gulRfzJ0TdlIl1vAqu7nT3La2XN07fZX4ofvOIWHykKcqghHuhSb2f4Ik1l/64x3wD3fIpe1VLt7x7T3QHxH5xcqRWiW69bIwDYgzWvjT6HkvpKzJ+2je13a+EDPl2hzfIKfAfFm411yddmM5sIVmbIahTJyoomRSZDnplx6XQHcYMzgEvfM1s9jFi30In9tveQ/5bReZD6b/CO6b+gr6Xamj9bAUDmASYyznmhoYCPMuuTcWm8/gJ92ud8zzqMtFlbfPBFN/tm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCjffP+SLGBP+BPzjKXa0wwbDZVs3L1+wYtZx6zZPY0=;
 b=JT6ajjG/TR4/EpukFpiVTf/56mxXMfAfqv8HIqpyQioNfYmhub9cGa6ItiHw9VuYX+aP7dgxzlF9eTSM+K+A/VnszXRuLWBJpsJQ7BJzNnn73JWAcX6pyXc00UQvXE3AzJHFhEAvjt0UwRfneNYv6HR4NbvnbHdVFug0TqZQxZiXrotpp/ERPDfosg4my+zzLCFCAb4/VPO6hcRFOfN5Q7hrIWa9gK6ODa7BBy4y08I728njzMp4hhL48D3PUGYnyIouPwTBHOk34ynzoDJKQfh6b6hgzKaJMVZ4mxAYz2aqywUAogu//IVfpiAy7lfB4JTXZKbiXevgB1+yFmLQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCjffP+SLGBP+BPzjKXa0wwbDZVs3L1+wYtZx6zZPY0=;
 b=Y0purfcJGylh5kjE9r7RnrQzmp5mpdFSuTkOR5AmL9uKF22FOhszaVCtJ5P8FoCmK/R1LSsyUit3fiDVo2LnnejfS6TOxOfPoxOIec4KTDnONDIi9AsuI9YO4WVnzlPH+kfLK6eUGvjvAj+vyLZdY8WQV/h85R8R7ebk/owW/M8=
Received: from BN0PR04CA0143.namprd04.prod.outlook.com (2603:10b6:408:ed::28)
 by BN6PR12MB1777.namprd12.prod.outlook.com (2603:10b6:404:104::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:32:14 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::9f) by BN0PR04CA0143.outlook.office365.com
 (2603:10b6:408:ed::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Mon, 10 Jan 2022 22:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 22:32:14 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:32:13 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v3 03/10] mm/gup: fail get_user_pages for LONGTERM dev
 coherent type
Date: Mon, 10 Jan 2022 16:31:54 -0600
Message-ID: <20220110223201.31024-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220110223201.31024-1-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a6ba3b-82c1-44c8-53ea-08d9d4890ced
X-MS-TrafficTypeDiagnostic: BN6PR12MB1777:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1777ECF9C6C4F63FD98ADC53FD509@BN6PR12MB1777.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b0Bre5YQqOktrimM9m1UhZY/Km1NSg7qNXpURhHSg6wIG/n2SjaLqV3XiHrcpqIVJ6NfDXB9Q8TV+n8Qmd6WE2ARdAustwL2xhf10AzKk7ci60tADs+5r/dxGs7vobjFvgl8q1OtB9LmTOKtk18eJqWzUklt7FMFWuP8Jy5RimbnAgQTNAgeuS2Y70VPZztbFSsUYWGryrHeiSygIJUyryo02/UdyisoToK/3iMfXczRFgYUVStCGqjseyepIEWr331yqT2WWxwpAJZe3/GfoQDvyb+lVRJq33ZqYMkq5lDvm8Wzs4Ma2JeT1VqJSi1DfFz5c/7n9OH9kj9ql7o7lf4WH/0ibXW/O5+BsN/yJvUXbPtYJ5pY1N653C9AmZSEXRfLd8TpnEsoaKBSj+x8nT0Xe3OT1qQNKWYfhZXcu+rfDhFCbDho3Ui/Fbjao/tSdWBlNC6qpoKFeD52NNNOKctdW1KlVRpSQVDYGM5nF+KNgQHZqIMYNq396yTSqPDnMyZHVO8qbfOPMCjpuw8w3MKCwcPN9FPqm/whRg5PonQiET3VcdHQpfMhVYceoh/Z3NTTxQIKDzF8JScm1rClRx0GieH6A9RfxrSmTKS7S9UHxffwywMt2B1eA+foezwrB0Ql5gsnfM8XPec0qDCThpD63zSoi+uwOxMUBhj7SCD+W4XN9H/wPuYPNPqNBTPTU88vVMtA272vpEQVKNGDBuinKlgyluLisukZfIrAOsKFSG8YE6ylYiKG4TbfmjtIGV7kiNPmTtHQjmFRITnG6QVmzz3gOiEi0bRukZ+bWDg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(508600001)(40460700001)(36756003)(8936002)(81166007)(5660300002)(86362001)(316002)(6666004)(1076003)(356005)(54906003)(7416002)(7696005)(110136005)(4326008)(8676002)(44832011)(2616005)(70206006)(426003)(2906002)(70586007)(336012)(186003)(26005)(16526019)(36860700001)(47076005)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:32:14.1655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a6ba3b-82c1-44c8-53ea-08d9d4890ced
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1777
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
---
 mm/gup.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 886d6148d3d0..9c8a075d862d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1720,6 +1720,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 		 * If we get a movable page, since we are going to be pinning
 		 * these entries, try to move them out if possible.
 		 */
+		if (is_device_page(head)) {
+			WARN_ON_ONCE(is_device_private_page(head));
+			ret = -EFAULT;
+			goto unpin_pages;
+		}
+
 		if (!is_pinnable_page(head)) {
 			if (PageHuge(head)) {
 				if (!isolate_huge_page(head, &movable_page_list))
@@ -1750,6 +1756,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	if (list_empty(&movable_page_list) && !isolation_error_count)
 		return nr_pages;
 
+unpin_pages:
 	if (gup_flags & FOLL_PIN) {
 		unpin_user_pages(pages, nr_pages);
 	} else {
-- 
2.32.0

