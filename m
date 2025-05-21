Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D5ABF72C
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF9510E855;
	Wed, 21 May 2025 14:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SWzwukWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1F910E7B3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al5rpiClbpi0ZdNJYI2RoLIF2xd7aNHIcBWt9qsZj6x47DaidSxrdeFv1scRQiifAE6zI/e7LfWh2z5+4//ZtPzkSbrMIrd74TPXkuY5yIw6G/uUh51b3aglyZrTdObip1gk7CZvLkqA6MSZKoJeZbXP0RxA7rRdQBnVTv54sLC91y8xxuMSd/2ovzmiJclsFnUW6DzQfk9Gi1tLf90K5w+FGCTwLj2PeQh6OfFlJkq7yAWo2yBFSNzqOWGnNfXDEvqvbzTqh/xpSeQW2dn66URCOIInFzIZKx/bR15KkeGlq29h7yQW4pHYKjeXC8e9cWmXrKJhfsNgROj+tNt4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fizyO18cp3oJuQ6sj3NB+ujQQFeSpGcL5r8M57i/E+Y=;
 b=J5sevAwrR3doeMTDzUUKQO9ShxogjbSHw2Rm9bg+XTVhf1BhY8X8rgm5fqKRUo3XN4+pGFZ2mu+MscErJIJo/EZ7WasvIDUDzGgj3bGkxeHrzCkmSpav9akgXSNWWwy3u4xk1uqDqd5p7uM/Hkvyn9PNWE6v9537c9x1MkBFNj6yJeQVjxwmRvT9X4IB30vpvnP24T2qpwSJuayMMFh1QsgSEs+IfkJ3aUEaID4he5uRrzqqhvux7Zeu9Jc762qOETf2ArpCkLm6xdscCvcbCGpVR+SIZY7zrlJtiKPi0Jx+Pxk3J5kTbb6+O4dC/hsHKndRMgj/btBOsnAKcPKGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fizyO18cp3oJuQ6sj3NB+ujQQFeSpGcL5r8M57i/E+Y=;
 b=SWzwukWMPLHTQqK4cRiPSbMU5nrTbTHIJKc9B8zMSBGtONtoY1EA5eAaGL5LtnD2X0s19P7QDe1zPSH4kC4HoWWbq4lz9+gYUUMK1l024vJhBMkxoxR10SZT+VyjfZpc+WVSZmEraazp0X39bjPseJsh3ugAaCV7Wdapl6JYtCA=
Received: from BL1PR13CA0270.namprd13.prod.outlook.com (2603:10b6:208:2ba::35)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 14:07:12 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::97) by BL1PR13CA0270.outlook.office365.com
 (2603:10b6:208:2ba::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Wed,
 21 May 2025 14:07:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 14:07:12 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 09:07:11 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
Date: Wed, 21 May 2025 10:06:49 -0400
Message-ID: <20250521140649.4058526-4-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521140649.4058526-1-David.Francis@amd.com>
References: <20250521140649.4058526-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 0623cc0f-aa4c-48f1-5a48-08dd9870c8c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wZUEwJ05Z6oyxBSKrc44PZnURQqhMKY1w3Kyr1OO8xlZErZ8h/OdLps3PdNZ?=
 =?us-ascii?Q?CR/updrIFe4X9Oya4RZMiCz9qyfM9qM374WakPHOcSLrNB9G00sKAQfNGJ7z?=
 =?us-ascii?Q?vG7vyDa+RDtBEz8eMbaz1KAPkogKFz6kHnSMtl5LPvDtVu5P5Yevx6wKUhwF?=
 =?us-ascii?Q?Qa86wTRF+CsvS6LxY3fuWyqkNiCWt5JqCHsInvy8lW21NURmrwTS+6ABHQ9B?=
 =?us-ascii?Q?BwF6HEkpNO0EfqiOVNroW3/nEmaJFvrAxuvwrcuHk4WURDT58I6eTudLrKgK?=
 =?us-ascii?Q?5VlA2XNoFCQHf8phFtGu5wxSIuxBOd1FxPAAO9afbqpbGy4iAR/ZNG829njh?=
 =?us-ascii?Q?nsJ+uGFFBqzFRwS4uLpGwhE/I9P2PEpT1j0AkF3qTJYrXwcx4wkXLr3UrxEm?=
 =?us-ascii?Q?9IUzsxdSsUAWtQ442t1Uv/Q9qFTNM9FL/ZF5dre+htmAyafyakRD65GCd5lf?=
 =?us-ascii?Q?aubCmHP/ZKXv4gbIF7lIh3abqDJca6+j9qU0uWO2FbNaWJOMSMvooTwWOv9V?=
 =?us-ascii?Q?O8kJ2It6Y+tyepU4WBKp+/KRKZemU7xGsmWM/cdI8C52EhblCsH/p5bzW7nf?=
 =?us-ascii?Q?BSgoHEVN5LJu5Q83mgpbRQNp7B0EqxW8fs2YtxFDyWdcx4CkqqB5SV4h2OA4?=
 =?us-ascii?Q?ufYWk7NWPVaLTC57UCeE+ziTcYNhvKYiZ4MTm4HOEaIEAZE+SAFFZPGNKBgV?=
 =?us-ascii?Q?j3UH7KFslFHAtwkqX+hk2+AT2DTq3hS+X/WgQdvcZUam9Jbq0MFkC4PeLFUe?=
 =?us-ascii?Q?Kf+DHQYQfEDCBLa9i5f46v/E6mCrtGxI0kMaLKAtNBaFgJcj0KWn1ebgs0mZ?=
 =?us-ascii?Q?x4DWfVV44HZcgVZ07jDQFB6JYCuvrbpQpinyED00JMTfUmkCbYmXkoK6tZYX?=
 =?us-ascii?Q?q4rkFNGtMcRQxjpW3hYWR6nqO9PAmHFiu4dO45kEm2o8yZ6VZ2r0ls1do3wg?=
 =?us-ascii?Q?Z7Ho2+I6fTFqBlTI7o3rBimcSuayVNp+uwUmF5W1WAxrRc5GO2wywCBYdeZX?=
 =?us-ascii?Q?g3AD2qaozXjgi1UKMAmnhIHJMQvyFuGJge/Pa9l1/sBUxVhm7d5qaYG/7TzV?=
 =?us-ascii?Q?+uFReUqNb+CAoWjJS6j750z2eQYCed5MEOhTrcu0AF+L/AFksOL99NEQ6xxJ?=
 =?us-ascii?Q?MFLwSmyiO+98q2Iy9fFzcsF7gw/+JraXuftPzRknObxJ6o6BiMNpX32hT4e6?=
 =?us-ascii?Q?ayEhjOTHvK8sp5RdDAVs0o2X5kTxo5DiqFbjFxCmfNaZKSxWXTpBtbkwC7uT?=
 =?us-ascii?Q?RqFVOUCfXnC31kteACb4AK8aW+T9afTiIsf5/6BxeGc5eaiUv10oXN6awG5p?=
 =?us-ascii?Q?lY2owzPHIKVBYHs2/kP+J12xmz/dwszAh9B3iu3Vr1XoKkm0nEqUUI2WV5L9?=
 =?us-ascii?Q?8ph3EU8lOcRyqVF9ByqoLfM8zzdPL9KUrBcz4CyvCpsFUZoYWFPpV9CkD58m?=
 =?us-ascii?Q?0xGcCddX3boA00FBHuZyd290jJaxln50POfupICtOaQk3OBmUTjedAhNAZ28?=
 =?us-ascii?Q?YuaM8YOEGvQzupOgXSkS6k67co0hVj/5Ztjo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:07:12.8232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0623cc0f-aa4c-48f1-5a48-08dd9870c8c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507
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
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a8cf2d4580cc..7aa34bd15958 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2570,7 +2570,7 @@ static int criu_restore(struct file *filep,
 		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
 
 	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
-	    !args->num_devices || !args->num_bos)
+	    !args->num_devices)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
-- 
2.34.1

