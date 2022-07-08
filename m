Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC6956C19F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3ED10EED9;
	Fri,  8 Jul 2022 22:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A84D10EED3;
 Fri,  8 Jul 2022 22:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Goq4yuPe0M04NBwCvoYzYeklEDF/jXU5bz9sO2L5EVpQg654vJ+uPFQjitnxY+TqDT78Y+b0n4TEexdj0GORwFyNWT4JUyrSGSv3c91SJ8mPJb524/uEY6Pg3Co33dNcYdkxn3YkLfzKhd0Ie++vse3EsoillyupNvY/uqroMbYLeU4vSKhz+2ur+Z4M7C7t96Dcw91Kw5ATgbOjnXiyH+q8kCkzFlJ63OOw425rsFqHM0YxUd96wIcdqvxqb+KrhiKRXWMRekNWN87isxmZuspkepe3sMbWXgU1lNR76RQHE8CLADgkaofkW/PSIUZkPhGGaw0FVo6j/VnNMPWzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKTgHJGg5UHbdd7Ozc3zY7SfTzGo+6iV/wMuSdjES2Y=;
 b=DRojYB4FjOPQ7+GU5DNIVSWo0hMdVLOTiDjrpfpVy41BJqnTCHgYi4zGS9vyHZo9JMphtyvfEQP40dOIW13AEX9UyC8gLvdQyizEv0hDPcsQ+CeKef53IVfXscVFa5UocInAzCqSfgKaNkgUzeQFwzXqAFeviosDH41Jfl5pm1ysrxj5cfvpAGOxtrDUmjQeTOA6m/zZPln3aNC8a2Ywj27LQmaIx9hZjkfAnQJh6Fsc5bckLu4hIz+m40FxQrvkPIewbHMyt+LAYZ263XPnYLsJ0Xv60E+o1DAAzPoZsgAesV8qIW14TVdEJNI14DK7VPWqQFbK3Jgx7zRr7sZ8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKTgHJGg5UHbdd7Ozc3zY7SfTzGo+6iV/wMuSdjES2Y=;
 b=Hqq7+XoAMabBEFkficNm0hPo71wRK5Bq76MM+QEUjqIWD/lEk6FhKIxsbAZ5WLI4L1P9LEebCGZszTMGOvcpqKb+flE/zT5keVKCIJIfP28R9Ck2BlIf8h1O7sCeYX4IBIdPLjrM7Iaa7PKW/LULCX+lcVetXyrA5XC7dvFKuX///G1wLPsB72nBI1DlMVdS0RSkqMn/gSNV+vhitihXsTeBlirCrWuRYlnjAmVb74Bo8xZvgmo6T9qLRThK3XAqJXo5VnCi9E6OnHSAQQuNK6TRAM4WGBpxWLJDJNQuSomikBpowX3Str4lVMrU4NVcsWwU+NM9e3Oonb3OyOa92A==
Received: from MWH0EPF00056D0B.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:b) by BY5PR12MB3762.namprd12.prod.outlook.com
 (2603:10b6:a03:196::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 22:44:36 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by MWH0EPF00056D0B.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.7 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:35 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:35 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:34 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:33 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
 <gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
 <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>, <vneethv@linux.ibm.com>,
 <oberpar@linux.ibm.com>, <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
 <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <jgg@nvidia.com>, <kevin.tian@intel.com>, <hch@infradead.org>
Subject: [PATCH v3 02/10] drm/i915/gvt: Replace roundup with DIV_ROUND_UP
Date: Fri, 8 Jul 2022 15:44:20 -0700
Message-ID: <20220708224427.1245-3-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30db4118-9672-4402-48ef-08da61336ed0
X-MS-TrafficTypeDiagnostic: BY5PR12MB3762:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5OA9VHEcyeWGs2Hfc5tQJpnYcSFuEgms4qtqmTNOef+xp/Da3YIlP2ND7MdAWb1g6tVCWxs+n/rBzkYN7beRQgr8/hqULvkI4UpBB6jKEFi/HqnewLZ42UD28+wRy/2tKzOZVCP6wJB6lyZ7qy+2IeoczKAgwfNDe/fq+8xfPb3dTJmRcO+HQQsQkZst7wXcM69GfoI/07qNezQ2DbgoH6IszioprZdqKSfm0MQeSpgeb2epXuNDVQSQBl5WkWqZIK4fV6ckegcfcCsR1anWQNi/c4UeWm8qkmfYXctGIan+aN/ZMWJ0eAQOeSac90kT54vb/qCNi40XE2zvmdZI+xJYj+T/HCQR8JL5QHeZiWUzq4uasp1oFR5S2Add29mSsdTznu6fN4AsERJcPMfG3jCTaVdHxXtJ+s/tt5VWCMJiFMSsaCTMjdBIK3dV7gg0qGHDq2jlcycLGVr2RcKRYbqRGp0m9RLRBQhEQmYkwJizxichdvp5EjmpbFdvGC/k0GXi38zbWq2jdwH0A594igPSWGZCw4GLICFRWNgInc60/pC8xXRaLowKcoIQDYfiLw479DpNOrFxWcIHIrxJjcMcqBipy67LluKhDpSKXdJJ0OS6GJRAC2Y9QFBrpkWWkXNmbLkOyiSnj4dC18ifVe10NzT/aP6aDAmgNk9vKi4/SNu9L9NB8zsnvr38VvT025Z9EntXa0lK6ZbpLhZg1nQQ0AD9raSML/WTuIchO7AiRQ3czrPNjhJNMeY9rcix0YDQUdmggu/Kn8BRVRHkEyxwd2Sg6Fu3c3mcVSkctwNdwM3qL1KIE4X9XTwsb3PqyPTdiI3Z1VN+qTGovkX6Hg1qb6MQpwqGX//tPo/Fs3R63rlUhuBWjmxWUYX21IFF0WnQHRLCO0KZvYHdgKDl0bWlUVl7DXvPYAx5vpbagpE=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(40470700004)(36840700001)(7406005)(186003)(1076003)(26005)(316002)(5660300002)(2616005)(47076005)(7696005)(41300700001)(336012)(36860700001)(426003)(7416002)(82310400005)(86362001)(70586007)(478600001)(6666004)(4326008)(81166007)(110136005)(82740400003)(40480700001)(54906003)(83380400001)(2906002)(36756003)(70206006)(8936002)(40460700003)(921005)(356005)(8676002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:35.5466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30db4118-9672-4402-48ef-08da61336ed0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3762
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a bit redundant for the maths here using roundup.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 8c67c9aba82d..7ce7b09aa5b2 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -231,11 +231,9 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
-	int total_pages;
+	int total_pages = DIV_ROUND_UP(size, PAGE_SIZE);
 	int npage;
 
-	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
-
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
@@ -247,12 +245,11 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, struct page **page)
 {
+	int total_pages = DIV_ROUND_UP(size, PAGE_SIZE);
 	unsigned long base_pfn = 0;
-	int total_pages;
 	int npage;
 	int ret;
 
-	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
 	/*
 	 * We pin the pages one-by-one to avoid allocating a big arrary
 	 * on stack to hold pfns.
-- 
2.17.1

