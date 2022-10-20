Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0427605E5F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 13:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F2510E435;
	Thu, 20 Oct 2022 11:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E380210E435
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 11:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmr0OuvVFJ+0kRNDQ+7RBCsLNQEWNJzpz1wsWkSmx5Yin20EYjnRnUXAk0FWcHpgkRRv7TJoOTLE4LBv/FLo6n72mS8HmX0rlUu11YdwYp1zITGplwAhB6aze/1gP9FbMAPCEEMebX1c/EQImISjp3r3ZF0ohD9GaWOGUtVSho16AWmC+mR5gJmQB3Dym+fkWci3BRtFnX6YvOFuGszQjII7bYxfC3IwsVyX93Xw87/I3WITo26mV8pfZwGpMrffsiqmB03awdNgCOnE4Wy9Qi50Iq2LXn/BRql8JGrKVtthzVt9DOakmtCDqMRZSh4FqMiUkpVU65d3UXzBQ01y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9gXseAVEO4QsLPZNzUqKIFl/L2H49J1TsOZzGDObJ8=;
 b=eX1/r0yVc6yYzXv8H/x4auglgfIxAR8X7G4xaS5aXPpGZF6tgXHv+f1r7ijH0SlpRe0hxor1nDJ1fAJ1Xnd7tIPLpSQrlW/IRp0DZ3mqFXrS42qGSXu12v6ch3Yl1QE7oV65hMJ9I7+EH72kEkdCVtE0Sk4wFKn6WfbEBE3HucqFSAYHnpP8dFRxjGU6relEaUOCIC6McJsQFfOAXEaFgsKPtlDsQSAUeYvEsx1Hj6npOVPRBc/SiZlBF8Ecv7lMswmQZcQG3txeMpCD4fC7IbQTZ3F9x4hzkEVftI6w3wOkfPM8Hm2+smoloMkwsLjSth/7rd3wJjLzILp22e5Log==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9gXseAVEO4QsLPZNzUqKIFl/L2H49J1TsOZzGDObJ8=;
 b=47/hEmvNncdPSEDBPImjziOAAK9I1Jk1SSvJ+eLjiGJ5pjT6+0S2a2iGuo7HheiywNX127r4UWlSEIt5AxHqHW7zKJRwTwtx0AIvb6upxu6ZCwbxNg+UGb7EO1b/WkzcjQaB0dK15n673jteeqazA8mWEZVVDIlfOZPPI59ztoE=
Received: from MW2PR16CA0037.namprd16.prod.outlook.com (2603:10b6:907:1::14)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 11:01:38 +0000
Received: from CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::44) by MW2PR16CA0037.outlook.office365.com
 (2603:10b6:907:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Thu, 20 Oct 2022 11:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT093.mail.protection.outlook.com (10.13.175.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 11:01:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 06:01:34 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/syncobj : Enable signaling on fence for syncobj
Date: Thu, 20 Oct 2022 16:30:03 +0530
Message-ID: <20221020110003.582831-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT093:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb5a56e-b450-4892-6dfa-08dab28a763d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSi4awRTTd2PinARDbrzhI8wo7a2L0X0ApcmYOg2lBneNJ8SGmRA+qaLQd3fRzlFt4aL27WqFDr8ALwoX1R9kjT3v570rT6o4XZWIRiFFZz7M3+v6GvdcPU9bSu4lLmKVVx72xFT3Xkz5PpbhVGuMM32WPGP9Bfj8bU9K5HdO9YiBdJ6jeXt8nCW/iFjyq7jlkUho82xywwH/DN9J0i2FyzSoF41sPANCTu6oKAS0ShE+S3fq3kn2SjvvxejjVfHSCeZliAKJzx35GSgYM5B80tmtqLgqNyjFbDfq0575xxDB9Bjja/yKbvG1tgKn9UWKJxCRZqnd1lMRtAPYuBc9TDwUV2G2E+O9MVQNUpzjmp5MqR/GvEkyOctE4gDP9+nK5t1M299SSO/O7mVJDbZNhiCShxx0gx8N6udCXLlmnXgnidnImuXAqEooKTrGS3VqHGVjcZwH7wx7Vm9a00Nnc4xVeCyDfOd0xkOJY0KHD6gY6W1HTVuHt1R99n68u2QsfS89DXSYu8XOEhmlE/0HPqz3adBWOVbXRuBvVch1xEvGr28NmkDaA5mpp+RrPJaP9drojLae9BukPSf2Cn7evuL7CtLeKu65K8YQRfbGlhWc2Wb6bIdsupGa5RvYDhYc2i23JakEo6ZJqemLJvBTQxSM64VQhLll9a7QfN9Ys/qujOq0Z8aJ5rhmBsOkkkMVtCMkIZGjuBd1c5OyNYXaMrrGqQaxbPPAAUM2sxGFdOuT3LZ3Lf7AzhTkiFgzfYf/W0nrfWVNb3a/DD0XaKovRVbeLb6TGk7aN/XiaCRWiO6dA6PWpB9XHPfbZVB7xififBl3RmdioaNISbrz9Ig0WsjHgMjpj0zfRjHP6cJDhk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(316002)(4744005)(336012)(426003)(110136005)(26005)(2906002)(1076003)(2616005)(41300700001)(7696005)(186003)(16526019)(36756003)(5660300002)(40460700003)(83380400001)(6666004)(4326008)(8936002)(40480700001)(70586007)(70206006)(47076005)(82310400005)(8676002)(921005)(82740400003)(36860700001)(356005)(86362001)(478600001)(81166007)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 11:01:38.3752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb5a56e-b450-4892-6dfa-08dab28a763d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's enabling software signaling on fence for syncobj.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/drm_syncobj.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..2ab7a1a9eeb4 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -302,6 +302,8 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 	dma_fence_chain_init(chain, prev, fence, point);
 	rcu_assign_pointer(syncobj->fence, &chain->base);
 
+	dma_fence_enable_sw_signaling(&chain->base);
+
 	list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
 		syncobj_wait_syncobj_func(syncobj, cur);
 	spin_unlock(&syncobj->lock);
-- 
2.25.1

