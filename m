Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A24FB513
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D253A10EFA8;
	Mon, 11 Apr 2022 07:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4D010EF5E;
 Mon, 11 Apr 2022 07:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmLvxZrN6CE/9k6iN+F4tTq3hug3qaoTW6XS7Lh9kiSSlWbmeayT+edSbZsydwLcafThkJU0Xi3jq7rQKqkcV/uRmkC7yElE7hSy1ZUlaw5k0lNwcavVM5nfLgm4yOYpUwCaLXfOkaQtO2NRz2XFfzzwXt/XAM72ZcPo7sKvDdDQgJ5i1wzWUrfhVRC+hV3FIaL5jWLw/JI3+0V78V0cTI0QTPmdvkIDQ3IXTxL2F498gvgi6hDIhFITosXR04Ru0cHUU7z9V3/hkFKZ7/upai5Hj8gccpv9CsTKKCYZ1pqyJO2mSMCtHgSZc777U6ls4Df7ZKgFk3Z+6F0+nb5CRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ww6cDEbA2/QZ+Mj00BdP57RQ8B1hpiC78gGMVIcRhw=;
 b=HWSWYKhuwB1ma6/v3x29B2ftFaAEbcGxRK16jLkAKho0jQwRrkiwKyfZzhWsHSwDGv0FgERHKh73SpZZ3AIF+734HWfl+0UfDA1qRhKC6XrwOJMcyC4D2dWZPHuu9S6t1EUcuPupeeII2n1n1jVi+ITbTzFO/t3zVE9wAi2f48+gGodLApt5xF2g1PThBMBnnywd+/k8iwTM+fqoT2l566bTBDzQ4r3OdjOrW3PctjEWD52ZV04be+FoqXU22otua6I8/4Yq46BfJ+XG0X2J1UDfV4Ef3ahFFk1XsFBdxKexUd0G87f60SJXLPdD8DYgHRym2Va69HDrBrijN0mVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ww6cDEbA2/QZ+Mj00BdP57RQ8B1hpiC78gGMVIcRhw=;
 b=upPbENfSNuK+PZh/4YuS/VgKlWvOa26XlndeuZ0pcRuxDyd/tZ4g+SGmj425cm8hLcHtV/quvrfvkchVXDyqbj/6ab+QjkTnySAPcBkegSeStxcnfWC6KiiZMEyMTyp6VjB3ksi3w9teWL78cPpPg/gqE4kZIRH6cv3JYXcs9VA=
Received: from DS7PR03CA0026.namprd03.prod.outlook.com (2603:10b6:5:3b8::31)
 by DM5PR12MB1289.namprd12.prod.outlook.com (2603:10b6:3:79::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 07:38:58 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::ed) by DS7PR03CA0026.outlook.office365.com
 (2603:10b6:5:3b8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 07:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 07:38:58 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 02:38:53 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3] drm: add a check to verify the size alignment
Date: Mon, 11 Apr 2022 13:08:34 +0530
Message-ID: <20220411073834.15210-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4194203e-cc99-40d6-23e4-08da1b8e56f1
X-MS-TrafficTypeDiagnostic: DM5PR12MB1289:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB128938ACF1390028359471BEE4EA9@DM5PR12MB1289.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RpSQ6jvbT3CbLoO/26qDGLzDtIgBdEelqvzhWf0Fn3y0V7Z8GXg5vqxkuzZfSjgqPlYt0oa3zqjloJaMQWqn1XTMkXPdzgcpNsj8UObZnSU49D3zTUQ7q1NGdBcKnUdLrs1ed5xQ+PbdTcr+lSXbjyej8b5jMAbWFQYABreayVnix9faHGlCo7Zsk9k43Mxopk63Fsk0OVvkwCNNOZ6DyGaojqaMIRQmAHF5judl/+aoOTNMmJhitMjnNln2IJ4/kBiZVsYrl16w1MGJ8Y+h0NqzjOb1D2cjg3fjDjx3DK5QK6eLMJZQypwJFTclYPYB9bgHcRJMMZ94LeolgM/zn4CgytWRhAtU7TpCXL4qSD5oUSR455+cT34aako/oOq6iN95dWIjG9brKk89bY3YGo9QJxi4+Icq2nsVwvslCgGs18E0nMVxe6VI9qcoGsm/bU0XIBbdmrbmhkaOvcMqBB5QuYVhWHrG0Jydj5cc8bAfv9xQ/e7wEQOy562PCWjX5tvC1kPWEHbg7xK3ZQCkUm/TOrY+rXF6ne6LvCou5RYiSBnBIYoPpTpVNq0YSVBn+Etl/zzgoL4WAMQK/rpFGddSaH7dK4zWB//qKTJLEEM6SN2cXj2Uw+zXeAcCErnyFDsJUvzc/fKMzuzUzT/gnGjq3/nPbNsHnJ2MIfCatMI3n3m20GAARrGOLehqWnMzARJjMrPuqJRZbUF7nW7phw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(70206006)(8936002)(5660300002)(47076005)(36860700001)(2616005)(1076003)(82310400005)(426003)(7696005)(186003)(16526019)(26005)(6666004)(336012)(508600001)(36756003)(2906002)(40460700003)(86362001)(110136005)(54906003)(83380400001)(8676002)(356005)(4326008)(81166007)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 07:38:58.3358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4194203e-cc99-40d6-23e4-08da1b8e56f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1289
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a simple check to reject any size not aligned to the
min_page_size.

when size is not aligned to min_page_size, driver module
should handle in their own way either to round_up() the
size value to min_page_size or just to enable WARN_ON().

If we dont handle the alignment properly, we may hit the
following bug, Unigine Heaven has allocation requests for
example required pages are 257 and alignment request is 256.
To allocate the left over 1 page, continues the iteration to
find the order value which is 0 and when it compares with
min_order = 8, triggers the BUG_ON(order < min_order).

v2: add more commit description
v3: remove WARN_ON()

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72f52f293249..11bb59399471 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -665,6 +665,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	if (start + size == end)
 		return __drm_buddy_alloc_range(mm, start, size, blocks);
 
+	if (!IS_ALIGNED(size, min_page_size))
+		return -EINVAL;
+
 	pages = size >> ilog2(mm->chunk_size);
 	order = fls(pages) - 1;
 	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);

base-commit: 4dcdb745569d8eef8db09e24e8ff2e5dffc0664c
-- 
2.25.1

