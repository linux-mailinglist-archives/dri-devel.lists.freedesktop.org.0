Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670F832D35
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2317B10E9B7;
	Fri, 19 Jan 2024 16:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298D810E1A4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcUOtbKK9ynrWaraDSh8byi2DaxRVABW9VwkH1rkRsckn0QCro72S7HO/OhwU9EIlu5ZZkFBa3HsKxZYcq6ga4OGnrpTQe7+TzYmHWhvfAj7CpE7iQTQSNvi4XgQV3fKQbGBIUkf9PtacSPFCSQ7ghHHnp+8WK+D91sUYAjZ+Axz83I8k9ZUwQuSLKFMzL7UdIpWiGSwGaFyOGhwkXXNkHb0Nt1Aw1kxhDMONP04Im9jeC/JbmypHMTlEhWqnJUxHR9YHP3fb8U7m2h0SD78fbGpQ+6zt83+xIy6u8YLCOQEzLYixITpIep56+q9JxqOlWD2Sgz1p9wqg7MmBeuwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9C6FkLMKD2XzMi7rM60u+2RxGjbxZ/CVk+1Zi4t6AE=;
 b=bT8UQh0H3v7DMRr/EkuHlq3UyVUu9F0jcyhIjTdhLqlyt2jCRUTBHhmNvvt1YrnwoThKpkLH0Yce/nArZay7gACtE/VVuqHwR6Ul/Vhn0e26f2oxn6TNQNvz6LCFe2M7cssVFwiRo5S44a19VSoUo+wvy9duZQTEkxCrNLQVfeMmRgKSxfverQGkje5J7CK3fntcHw76YcFQW0XG1dajdN9WV84c3+HbFRloB6R+LG/zOVIPjz5YPto29xX5xyS3+ozQ1JYAzVrgZXAhmmFTxp0/JAwAgc17rQlIKDxSETFPPDPXKzYd2G7+DNNUcka3UEOh8ogNQB2locnEqHwVwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9C6FkLMKD2XzMi7rM60u+2RxGjbxZ/CVk+1Zi4t6AE=;
 b=l+FcsUTxDcuuYu1dmrj7JW9VxCklaPPUPHfExxigGD6QBiOUjpwvz2Cplmzn/cnYfrWfV/1yI+E7S5ymbkyrG9RWSrE0WqVjzRjiiVU0OYhSKi3J+VJipVwxBKyRu3RmUs17W65eqW3+0VZkXvJbBWx/Kt5wb1Mt6WMSQAIcgNla+9/vN2dqX5+vNHoaNvYNZXgEgo60jYLAydsIPhHy8YUUWMD0f5fCcriVXN1d6e8xyB0WpeeCq9JoqRB1yeaQ5QpKzB0XkFqT/v8+zyXFfXrUvTxNUnNejIehfJ7v9/D7g6z/mBLHCVT24iGrfQm+mK1M6E3H8jkD/CF+EHhyWQ==
Received: from MN2PR11CA0006.namprd11.prod.outlook.com (2603:10b6:208:23b::11)
 by IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 16:33:16 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::51) by MN2PR11CA0006.outlook.office365.com
 (2603:10b6:208:23b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26 via Frontend
 Transport; Fri, 19 Jan 2024 16:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Fri, 19 Jan 2024 16:33:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 19 Jan
 2024 08:32:55 -0800
Received: from precision-5760.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 19 Jan 2024 08:32:54 -0800
From: Erik Kurzinger <ekurzinger@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/syncobj: reject invalid flags in
 drm_syncobj_find_fence
Date: Fri, 19 Jan 2024 08:32:07 -0800
Message-ID: <20240119163208.3723457-2-ekurzinger@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119163208.3723457-1-ekurzinger@nvidia.com>
References: <20240119163208.3723457-1-ekurzinger@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|IA1PR12MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 832d9f5e-06c2-4cdc-d770-08dc190c56b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X10ObL9gQ3PTeK3GQCbHuPpOd2ajiv6D7+pZXy63C8mVAMTwuQU/tAfjGSNUYwO2DWW9nCdiWDLbDtgWBlkdgx23NIo1h0bYH9AAvOFyAqOr2kt+ch+NzZcYT0HAlFU2MlR0uW1zE5IevqPDzOigKpwArw/NCZdAeTQMFLDGqVbqJa8abO2m10AGbsXxUU5FdjkopCLGYhUUM2FXJoMwPwYO3x4TvQRUH64lxn3flLhpoCZ2SKqdS13FqJ9YTJM6VKJPS9NOJDjW+wReFXgaaIXh22jL4F6STB06fFBDTioUFomkWJyi8WKvj6PqEw94VZ5glulRce7svp3gKJwg0zhtzGV8/z8wLn92b5cmUDPOepsGRMo1ggZCHAI1ubtbErxwe6zvLvLvz2Er2BTBTgBuqiu73+OS551bk6um2aSQxYkYPiVtqQPFXDMGxuK946KZ+Mq2J8XVMFV07mm64HsqHuh9AJKqupO6+P/VixSeQVwQHsgDXqitpRgQHnCLozjODriWrnyA1uNhYh/E/pO2jVtPwVb/9fX9PZB0hD/8/aUrcENORr0qhd57dK1iw+N98WQ1/nHvuYlWzT98SyjoamHa+ZnZ86/u0zZhW4ouPUWbW2G6qKvBAxWtaFbH1uyxcs3pV8+i/m55SG3XT9qE1NdPaI3u8163EHCyQtP81pGnTB9aQNVI7zY8JIraOn11ECRpW7Q5HW0heMiX+VIufmM8/1a/TT2uLorkAbQKJruA1HFE+sYg6KilUlAD
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(16526019)(336012)(26005)(426003)(36860700001)(1076003)(107886003)(47076005)(54906003)(8936002)(8676002)(4326008)(5660300002)(2616005)(6666004)(4744005)(478600001)(2906002)(7696005)(6916009)(70206006)(70586007)(316002)(36756003)(86362001)(356005)(82740400003)(7636003)(41300700001)(40480700001)(40460700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 16:33:16.3083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832d9f5e-06c2-4cdc-d770-08dc190c56b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8467
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
Cc: david1.zhou@amd.com, Erik
 Kurzinger <ekurzinger@nvidia.com>, jajones@nvidia.com, kbrenneman@nvidia.com,
 ashafer@nvidia.com, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only flag that is meaningful to drm_syncobj_find_fence is
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT. It should return -EINVAL for any
other flag bits.

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 97be8b140599..c59bb02e2c07 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -448,6 +448,9 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 	u64 timeout = nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
 	int ret;
 
+	if (flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
+		return -EINVAL;
+
 	if (!syncobj)
 		return -ENOENT;
 
-- 
2.43.0

