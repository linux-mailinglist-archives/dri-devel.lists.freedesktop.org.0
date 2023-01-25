Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 070DE67B451
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC7410E7DC;
	Wed, 25 Jan 2023 14:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509510E7CE;
 Wed, 25 Jan 2023 14:24:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhISj5eIV+PI5jRSzv95QNGRAoz26/4GJUVAO9B3yCMOunNN+jgzmbPpUgL6af4IgRhqNnF0DvjvDrpDfR3g3d6rEyzpOzvAgZualR2H1HcX7Y+WfA4glglGGLBjT5Dr5oD8EPLlKi825e3GbMrXwL5RSNVRooQpq19nnHL33Qf5VbRA7SP8lqyqDdYYkacBWpTDILn9/dWZulNdeKelItk4cSE2pyMtDa6h5XQkEjl71Ulq4udonmkx2xtEOcWlto+CXyPpZNoB37vgYVI9BPFCF0nwFvGTFwS7cwdM9f/lyiIsANUbv65KA2LbDRhICHdvwzzu+mL7AVO8b/z/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv7WdxW4NMV7v/aQnlNtlMMCM+ZwG8AikB0wrfN79ls=;
 b=OcG2D4emwGKh3o1+n7R4gWP53NS7pw367CNccePGBGDGBGk+6XvHI2+XS74790IiprWDc7WP2sDQ1e4xOIByRFcRxXLqDguZv1Sq61IU0WK/i79C0F1GTfpNwRaRRBTM+PKzftJ1scEt8AfjyhRsJUVIhWq3RK30Xw0Q+ioeSo3cftvqASTJarAoMV8QwTlOKo8D6GvIUCpzb4WZygkUjCJkWz4IBr3zYJSxibu64Q3K/p6w1jsDcnAOYUvqqq3EpKf2eswaQOa7XnS0rQpW/E2pOAALKZm7VJ3gUcQjOWvCsrrVF+WlSe9tQcDgmexnud3GaZNsvO++/zQKzAHLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv7WdxW4NMV7v/aQnlNtlMMCM+ZwG8AikB0wrfN79ls=;
 b=2WE478/ktTWUeSLavDiIHFflvHMAcMdZN8gZCtR5+AUKtg+sdea+z7BsjkWtxLSgiBRZ0mLrhZ5Ycm0xndZNdtInyDeB8M+uYWcgdINzpKWA5V6g0gJDIa2LDBW1//bMZLpAaFTOJ/kyOyRZRA+UwZ0LQh02cTV0z+BL4ovLvzE=
Received: from DM6PR03CA0036.namprd03.prod.outlook.com (2603:10b6:5:40::49) by
 BL3PR12MB6403.namprd12.prod.outlook.com (2603:10b6:208:3b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 14:24:55 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:40:cafe::e2) by DM6PR03CA0036.outlook.office365.com
 (2603:10b6:5:40::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 14:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 14:24:53 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 08:24:50 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 3/4] drm/amdgpu: Movie the amdgpu_gtt_mgr start and size
 from pages to bytes
Date: Wed, 25 Jan 2023 19:54:14 +0530
Message-ID: <20230125142415.18546-3-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
References: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|BL3PR12MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ee456d-eba5-4cc5-6630-08dafedfed67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rD9EA7tN4OqKZf6xHA8KTlVMYlxTuTFdp06leerAP768CZ3ibdfvTisqrMNic/VQHvXt8fS5nvqmJiEidKFB903MkNBnHtW91BUZ6L5ztq4xYLCqf5MmwJ1FJs+0rDz7QkSsmhsLCVKuk65AqgaqSVcG009l+bBCgPE5NGokAZNWa2cW9RHaX4EGfD0NUN9Y7KKLY9Ud1QnmJMGGeatp5g/sP0GuK2x8NM1sCSpIAQFHNWC1GTjq3NWn5z/c7ITuwBxC6q8E2zfqsqTBej5EVwHtBQBZuNldb+dQ7/Ke67fp1aG3puDFqJzZMRdu/yDnKvVWUlFbgX6DMQk/781PkH3EOB/i5eAaIjhbO16CX06ms9il7k19+Rt2N8ah6nQuwENH0UkA6kqAx/TghskBw9SipqDZ/vC6U1HDi/jrnRl3SzmO7SW0C6L3wMQAFUJXlFvtkcTOnpa+GbdVDh5yTMnjqUzxVYjKO0yRRVOyGOP18bie/iIHbe2nMqo9QC7lQwOFxFxVjfZ1EwAJNsESh9CERrXWzdH2vd7oEXS6ZdzxLEOKn+SjEGHKVYI+YVckCRERvf6Jod1mxDDX4vH8MLgYrPPPcfn5R+XcoYI8vSExZ3E+g7ih1/xawq8xCnOs7dCA0xVIzBeVe9sAvEr30NjZwP7CvPLiSx5DpFdOg37TFojMRLi83kYcinpTBPEmKtIgGPqzWTV3FmE7xjSSFttUekhLT471GQWmkuJwjHo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199018)(36840700001)(46966006)(40470700004)(36756003)(40480700001)(40460700003)(86362001)(316002)(110136005)(54906003)(478600001)(7696005)(6666004)(70206006)(4326008)(8936002)(8676002)(70586007)(2906002)(450100002)(41300700001)(16526019)(82740400003)(36860700001)(1076003)(81166007)(2616005)(186003)(356005)(83380400001)(26005)(82310400005)(5660300002)(47076005)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:24:53.9703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ee456d-eba5-4cc5-6630-08dafedfed67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6403
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support GTT manager amdgpu_res_first, amdgpu_res_next
from pages to bytes and clean up PAGE_SHIFT operation.
v1 -> v2: reorder patch sequence

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 5c4f93ee0c57..5c78f0b09351 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 		while (start >= node->size << PAGE_SHIFT)
 			start -= node++->size << PAGE_SHIFT;
 
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->start = node->start + start;
+		cur->size = min(node->size - start, size);
 		cur->remaining = size;
 		cur->node = node;
 		break;
@@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		node = cur->node;
 
 		cur->node = ++node;
-		cur->start = node->start << PAGE_SHIFT;
-		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		cur->start = node->start;
+		cur->size = min(node->size, cur->remaining);
 		break;
 	default:
 		return;
-- 
2.32.0

