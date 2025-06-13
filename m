Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CFAD945B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F0910E8DF;
	Fri, 13 Jun 2025 18:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jGVUGxD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B57310E8DF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 18:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCZikxjXFh2px5GFDIlKFEL1x6iKn7B9/atLaaGy68yaX48kKUFulQY9AJqBcKi7vZUIe+ail8PhSpmPIY14lI4r/4TrrQAekPk3HQeG1CciHVI19+woz1lhSEB6W6R51+zLSKkoK8TPRmuNgnp5FwWLwX17Ee0arBUQIoOMPJfVRpYcwQh9j34ylVG/eujd3KKIIdYRGdxRQNGZq701TCi3Cy/P6d+LVeN+ADPZrrGELD7fKbOT40u8AQEzVoF0d3mDX5SXCeVuPbarU6l3VI2aTYN65y6ZlJg1Lg+CrsHX65MJH2pxg7Q/5VJPf90TC0pr8RSF62IMnuzxOlE+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S/p0o31y9sg1s40Aie/Ay3zvEDQzY2GSOHTAicZV6M=;
 b=vJPCUB8ROpbZy2k+etOcSs6jY22td/ILrOr2SJ8GPhfwlsqizOWENzpFtAHcT8Wvn420dO75pRs0ri1ZZ9uojZg38A25LChsP+2iCl21MCTO5kp1VanHlDCnTjF1nCqCJ3/9G6mcKVxpe0nnSr0WUR3aVSqmIcksQL+xktfTRQGe9AyN0jt3N6IbIEZCdYwqjmYSfhJgwkZkeHXwOmUrTyvThJ6RoyV9vuhvzfpdDdl5hdAcRzj/asEEybOJ13gZa7fkClgo+gMnEF9I4SlbsPxm2Qpjn9Lwt/UfTQvncJucS1lrzluEYyXSPE0+C2PJqi8ULbeP/0CYB8p58UMGdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S/p0o31y9sg1s40Aie/Ay3zvEDQzY2GSOHTAicZV6M=;
 b=jGVUGxD+2QP2iYlZPe1oQLnxuaxRWzyo5DJZenAcu2yVhEyCzQfT30edx/kngARxEGqvyWoNBi3DgiAeGnSwi8BBhKIUXjXCOvtcR8XlsOg3OM/WUU5z7S0LySMyfWHYFs+ODtwk+/7viXHzypYwWnZRK5oJt+rF71J8ElfMiHY=
Received: from DS7PR03CA0165.namprd03.prod.outlook.com (2603:10b6:5:3b2::20)
 by IA1PR12MB8556.namprd12.prod.outlook.com (2603:10b6:208:452::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 18:24:03 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::16) by DS7PR03CA0165.outlook.office365.com
 (2603:10b6:5:3b2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 18:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 18:24:02 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 13:23:54 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
Date: Fri, 13 Jun 2025 14:23:37 -0400
Message-ID: <20250613182337.3767389-4-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613182337.3767389-1-David.Francis@amd.com>
References: <20250613182337.3767389-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|IA1PR12MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c86a96a-72e5-4cc6-2b53-08ddaaa77978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e6ZDScgLAw1sNR/i6917EqopA+fKRzsuszFLGh3XcmyhSIRe2KgbiZ6NYQy4?=
 =?us-ascii?Q?SW/A7LuhC9v2wBf5fi3RIQda8G6smfHFieyBcCF+sfS7Q0u1H45GW4BzvGXB?=
 =?us-ascii?Q?WjYAu5+xxG2W+Y4EDnaIvZzPQTsnUydtaw51sA52mQAb20pymfUCUXh+LWAM?=
 =?us-ascii?Q?nYoJA8/pYhnBQsSsdTZDC2O3EdB3W5YAIYoHFBUKE6qt8sTHEcJzqBFOilfa?=
 =?us-ascii?Q?9ET5V2/+AdWUY07wNTfKUN967IKf46fpkKstrzmMttkFng7uYMmdnzMl2IQz?=
 =?us-ascii?Q?luF11mERNqQAR6sUDnrCsoO5pvxytU+BrhZAz9c8E9p4DtS5eJCOltEPLVh5?=
 =?us-ascii?Q?l3+Ne5gPcfTL5i/W5eVBqDvStKzt5Wli3xdUVZZzVztAoQRr0QgUwGK1mgnH?=
 =?us-ascii?Q?hElvSWKYQrX8OTKtdb9EJQnE3K14Rsu3h7nCvWOAEuUjLskJJhpnMWIi9dWt?=
 =?us-ascii?Q?IQPyIq5JzaIez8EbRx5oUFaejSTJKLd26LUYOZSUVDI0kMoiHx1O7Tkehtu+?=
 =?us-ascii?Q?f5kuAV630Qx+jMKDlqmY2XihjadS3kZvWPbX0TRdFGKhSDSzU73aIxRhcD5/?=
 =?us-ascii?Q?i6oDaMTjk6bkxyuyzPS20smEewtHQ1pjvO/lGnL48cB4TP4h5UvjkPWExN9h?=
 =?us-ascii?Q?Dpveh/yZg5rrYd2qnKlzmZBrc/uflhkDfSYyp34lBtdx2O5APis8gYZ5rXeq?=
 =?us-ascii?Q?fi8zqBqE8LPyUwmt7CITOUkouGmriCxI+jiU8gO/xmGzfAXcXqqA1PhTLHMO?=
 =?us-ascii?Q?oOprLbCY3CXludYefpeCjhpCs/9jsHM4ByczuM4iq6OlhQRuodU4xEcr4nDR?=
 =?us-ascii?Q?ZPhSaO0pdv3SLpCLH1ZkfzmPUQGLXazYNbIDWQs8o/2VT0wDIVcJEtD6RLjL?=
 =?us-ascii?Q?UHaHcO4VXl7TTy6diPOPkJ4DSmTIj5LstsmJ3ppmTm7T6htHqveefXsaN4qR?=
 =?us-ascii?Q?BGxCSliYBKlOtWtLUOQcRqDuHBfuUP93dr8gfyt7sPPju/7boL5Xx81ymVsr?=
 =?us-ascii?Q?bBNY2jGCO5l0xZlCy+vXNxxnMWwQ6HYFifHYeOisethVxa0VeHp8cM+eqPiE?=
 =?us-ascii?Q?dW3gjErAGb8LswmrRlTlv++ARLLXFsMDzEMj72mB2DhFQwonNuPo4dIrQJ+S?=
 =?us-ascii?Q?Lv07MwCc3OuebI+5at5i64xXRJIuLVJbZfq3rXbaLZH1KmNOZcs3XACZPnCV?=
 =?us-ascii?Q?rzRQ3YCu3RE/nuYYdy2lRHT94ip2OPwQ43wpyHVqEZ1DMbPi3Glx/1FtZmye?=
 =?us-ascii?Q?UPNkyPkDGeqORNXp23GMz5opKQNOyxdYqqBgXLuUvlCh9gL4ZdILyu7FRAxH?=
 =?us-ascii?Q?1tS2h07ub+DXNdOB9zbLL1RIIJwIN2gEhwSesfjID+Ha26l4oIodwvbwuSUs?=
 =?us-ascii?Q?LPgKFsNoONXezcV04pwNt9f+lsEVh3IW5nd5oSumpifhbuy4AtB2q+8/Shbe?=
 =?us-ascii?Q?uzxAncxppMvAaInmBVeljZxVCiOjrFU/dOEams9XkMP2cyclz1qOaCfBKQqx?=
 =?us-ascii?Q?HnkVaRKpD//t0/catfy8e39K8rDKLjLGPo42?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:24:02.9852 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c86a96a-72e5-4cc6-2b53-08ddaaa77978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8556
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

The kfd CRIU checkpoint ioctl would return an error if trying
to checkpoint a process with no kfd buffer objects.

This is a normal case and should not be an error.

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a8cf2d4580cc..9617c696d5b6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2569,8 +2569,8 @@ static int criu_restore(struct file *filep,
 	pr_debug("CRIU restore (num_devices:%u num_bos:%u num_objects:%u priv_data_size:%llu)\n",
 		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
 
-	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
-	    !args->num_devices || !args->num_bos)
+	if ((args->num_bos > 0 && !args->bos) || !args->devices || !args->priv_data ||
+	    !args->priv_data_size || !args->num_devices)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
-- 
2.34.1

