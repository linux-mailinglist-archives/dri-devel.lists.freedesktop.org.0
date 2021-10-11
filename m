Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9142973E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 21:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531866E945;
	Mon, 11 Oct 2021 19:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E176E945;
 Mon, 11 Oct 2021 19:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diG6yvOpQnAVVRw4yI9qhqwhgFko6jDYW5VOxHSc+uoHow7bI/7ZYQJDXXU4VM31pfxQCZNZKeby5rt6fqMKX7vPikch/GbmClTLFRWhHbRgMUjph5g8AGsU6rtmy+V63VP1Zkquf/kUAa+CBAh7bOp4xGYWbr8e5jgbaOWTeAHN96etvzMkHwb26HV8CVeJ9HWimYTIfaQvn855GB4rGwYlbwwc1NHBDbkkNtZN3AQlqVjXbigZQ3n5aehwtxzwIHupVrW17uMVYFnUQNqj4fGK1th4JfXK7nTOhZOuQvDdRzGlS+NO2dMXlI+vK7mo+3Y467TbloUCLe2x4C1cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJn9PqxMg/y/vSZoIWS7vSi6gYsAT6gVYondgUrv9NY=;
 b=iDoNiejwlxn15lCVd8kBn/jOAKfipxWj1qHuDSk+Z+P3sf0l2OexyaRgXEg5YcfI7qhW7N74Ud+RybUOI/eYz8M2pannpHQ/DnshJiFQkScMynVZpCDxDmvfbYripQKfF7TY/WRTaZZTtT8hxsvkH68+pSNAG7TJ3rhn/xjPre3baEhlfS0tJPBi+AD/A00vt+4V11YERpfZmB+oJk+moTdY2xV5NMkafpoSZ7oBe4sebqU1YFsEI6M64BL3KVMzykc3xG8jRxlGwqf8TXTXBnjYgLUhLSc3w3B1Vj8jGcu7usjRX2xlOxubCCdDXhHzPhQLOoWQ+dPGwea8exL2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJn9PqxMg/y/vSZoIWS7vSi6gYsAT6gVYondgUrv9NY=;
 b=FAVnAg7ISgauys1XGII+8GYHO0fY9QNXxHr9zcc4+BfbwVGOOWgm5RXMMkm8fLqz6vi7LN4VsvIrhUUtRDClNYnXmq6zIVOxHHfp+kC3Fx1MJ3uEe5qk/5pmH6P0kRnG7VuRgm/Il/v0LDxhrfstcnpL+A06yiiP54rmRfayJ6Y=
Received: from DM6PR08CA0050.namprd08.prod.outlook.com (2603:10b6:5:1e0::24)
 by BL0PR12MB4866.namprd12.prod.outlook.com (2603:10b6:208:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 19:06:24 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::90) by DM6PR08CA0050.outlook.office365.com
 (2603:10b6:5:1e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 19:06:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 19:06:23 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 14:06:20 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/4] dri: do not check for NULL debugfs dentry
Date: Mon, 11 Oct 2021 21:06:04 +0200
Message-ID: <20211011190607.104618-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a000ee3-2f91-437b-aa73-08d98cea37f6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4866:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4866926C24E29705F03831CB8BB59@BL0PR12MB4866.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRZ+Bg8WyTwKIvMVV8lfi+uxgM17neR/trjjDEcVLaU+9uNjF233mXUUcYczHO8OZLgVh2tGfvgEtNoao3POMeIDjp00hSojBKDMZEin+m5+Swwkq6N3M4kyIMmZ51nrLwNYS0Fae8aoFvHI8/B7Kv3D0RBGHafISnsYjGdub8greirrnMZmAgzrz8sy9IDxXAW7ATc3CfE3C1SsrFg40IP8ePSalOu28lnyROWlh3HgBB5/0qMlmAPGpVupWyRxA1Qlp42b1iegwhrxuem0M0vgHKCpPsi7UOMp0WqSWQOz9LCcJ5BaUCjySd2vgAD3nW4eeDdzd+A1H9uGw45j7Wb18Lf9OgF/ytOERNogTVnLejjQkyxpMNh5u5kCPWL/VQiJiV7QIejdd3g3EfV9Mc53jDCJfDJl3wy0Adbetlhv+9J20Ja3C7zqgsYcNzI5EWa4sL6pxaVgBzBjuvhx7hJx6z4yuiPsiZRfKXlboH+Cyugxy444FUwX0HlVxX7aoKdineTiyz6FC88CW4krK0s2WvkkIR1p0R3U1630XKp9h6APtFgd6LAxb9brpxrrrzH9jVrPmXsr30RhFL/HoDh3wEWtt7NDvPoLIca+vfGgbnXznzw47lasgGKZz7abCuMclbsxWnRDNlcFFToHcNoaaXrfnLf3rfitGUfBHl8jAwyTVOx5DrFcZgITqjQYjJpdSu+6D3uERvSFdANxHMLjukFe1k+EJgIemhsjeVA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(186003)(36756003)(7696005)(316002)(16526019)(54906003)(1076003)(47076005)(8676002)(8936002)(5660300002)(70206006)(4326008)(6666004)(2616005)(86362001)(356005)(83380400001)(6916009)(426003)(2906002)(336012)(82310400003)(36860700001)(81166007)(44832011)(70586007)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 19:06:23.7994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a000ee3-2f91-437b-aa73-08d98cea37f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4866
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

Debugfs APIs returns encoded error on failure instead of NULL
and for drm primary/minor debugfs directories, we save the
returned value in the dentry pointer and pass it on to drm
drivers to further create debugfs files/directories. Error
conditions are handled by debugfs APIs, so no need to check
for NULL, as saved dentry pointers will either contain a
valid pointer or an error code.

CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index b0a826489488..0073854a4383 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -272,9 +272,6 @@ static void drm_debugfs_remove_all_files(struct drm_minor *minor)

 void drm_debugfs_cleanup(struct drm_minor *minor)
 {
-	if (!minor->debugfs_root)
-		return;
-
 	drm_debugfs_remove_all_files(minor);

 	debugfs_remove_recursive(minor->debugfs_root);
@@ -419,9 +416,6 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root;

-	if (!minor->debugfs_root)
-		return;
-
 	root = debugfs_create_dir(connector->name, minor->debugfs_root);
 	connector->debugfs_entry = root;

@@ -440,9 +434,6 @@ void drm_debugfs_connector_add(struct drm_connector *connector)

 void drm_debugfs_connector_remove(struct drm_connector *connector)
 {
-	if (!connector->debugfs_entry)
-		return;
-
 	debugfs_remove_recursive(connector->debugfs_entry);

 	connector->debugfs_entry = NULL;
--
2.32.0

