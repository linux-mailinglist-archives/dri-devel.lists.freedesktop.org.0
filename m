Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC36B65B1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5763910E372;
	Sun, 12 Mar 2023 12:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44A410E372;
 Sun, 12 Mar 2023 12:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPWLjHGRRZOOY3FtpCDJ7fduAUB5g0PjaehN+d1IJ3uFzU3T4y+TS2+IJlu9MBBPIdMBP0gGDdG0TE6SREPNH3xxASSIJTE0h2omb2UPi3R91vyNbw1Ngj16Cwyf339e+TZIgI+KYQRQFTNTOniG9roU9MxIlD3hc+coLCMs4oqyI9vuzAq+fvTdZq9mwOhEup7Bi8hOSuhANXIsw3OT60fNM1T6ubg7Comq7l3FmL/g1gTx9GalXgHWY/miOBsUPKN7TDsO0Xq0r6+qJex+ijFcuAMc+9BMDKQVRLmtr4AIPocY62mPcxFAoN0wWW/P/ClTEZHGAK824dDS8cAukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl4vhpfQhIyJx89i8nuCn4wVTGTo+7VCGWnMBqDbzaw=;
 b=BRh70aDNm5LizLpiaS4q+pKZUoUoDovjr6+WV4iazEi162g6dYUwOSEAje9qIQNjy3etxIgajuylvD2CZnW6pv8AmjepcFKQIAoy+4oa4nUthCSDtaDFT9L7ppDbLoyYdJIHIqSBBWM8M/11JSc5S7qm/PnAK9FgFBSI5kMPiqSRuNU4+5bf+G3R54j6jViNHqRVB4+Z5uWQ5WThgP6roByQRjgGjqSUco+1pjSgE3NyCDa710Vs2CcSy3oEQ0NoXn5uuhn64as1jK1pHIJeCsWTjJknstZz6IxnxwjPERVwwThjRUcjOYGRBpqlCzGrBIUFwUVsr/MzilMdyY+1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl4vhpfQhIyJx89i8nuCn4wVTGTo+7VCGWnMBqDbzaw=;
 b=mwWQIZQR/vThiLaNcdsPgIWb4qg5zDl9h/9r/9SlIcHAGizqBBbr8HWiDrVX+bCJ5GQ0xlTD9QTq+XpmXVmWIhTSnTvcVl7ja/NNa7PO9YyAiFlctM9VdSnmHAIUtEtWy2gdwTg7fQgiHTc91Q5rZm6ECnxvSG42m9TthlDYk0Y=
Received: from MW4PR03CA0273.namprd03.prod.outlook.com (2603:10b6:303:b5::8)
 by BN9PR12MB5210.namprd12.prod.outlook.com (2603:10b6:408:11b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 12:02:34 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::94) by MW4PR03CA0273.outlook.office365.com
 (2603:10b6:303:b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 12:02:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 12:02:34 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 07:02:27 -0500
From: Huang Rui <ray.huang@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 3/5] drm/amdgpu: set passthrough mode for xen pvh/hvm
Date: Sun, 12 Mar 2023 20:01:55 +0800
Message-ID: <20230312120157.452859-4-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312120157.452859-1-ray.huang@amd.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT018:EE_|BN9PR12MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 75556c49-7a07-4c63-bee5-08db22f1aa4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5+RHvAZfnEXSiAdLOrFGP0DZQRl9ikprfJj522OvG6Wshuox9/eQR7nU0SxVpGxcFSM2txtx4QuevgcsH7CRkC0Noc8XnOMzYJ4shzVKH+EqNRSp8znE4sdmqIzOgPXsIBYfkhpSMnAPlcCIKBMSrAIhVcWwArtWsCgDIMIqmQmYRiv7WbLCSqWEliIgE9sRJo+7jtXwq9dduZpjXv1s2Rj9k1EHSuHZxICMgAGSiDiqd4FvrVFACrL3PqvLuwbznd4tGGwy1E6anQluEucWo1K9MnsRg5lJyvTnVOWSGBQcvg1CUA4S3Eo6A6oiNHc11A4CqRrG3lTG59ARtlt4M1Njmth/dQYIC0r6pJK+jFPugIzXDLUPvayBvTMcbssJ8hvpcR+HRrhp1F7bMjQ0J5f9AenZtzPl542IGkCmxL9qt1BeLrfF/mBuCjcOKFx6R+19wXAD0gWQhLYIFzaTgs+B7ooMgnOReNNpKMcUs8pc2ErY87+W90SJoFf05cecL7wL0mtW3uhgDIPQqD8ksZlcGyQz7Xgojn0KbO00+SvpoaNnOgZTcB63vc+mN1l74LH04dKpOUKGxJr/z6UgdEeq0Et9Hc5EBQ8osDzwgbxAEShwpmE3mwbljkLelg8NIo6m8Qe8V1Oa49Ok8DHmdsckYbRdWQ+IQb9SEf188XVBTVeIuCsIx1Oc+wgPoF8i0fTXoleJKcikDclP9Iv88mTslZALQAF0dBzdbRreC0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(82740400003)(36860700001)(82310400005)(356005)(7696005)(2906002)(41300700001)(70206006)(70586007)(8676002)(40480700001)(4326008)(40460700003)(478600001)(316002)(110136005)(36756003)(54906003)(86362001)(81166007)(426003)(47076005)(5660300002)(26005)(1076003)(2616005)(336012)(186003)(16526019)(7416002)(6666004)(8936002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 12:02:34.0957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75556c49-7a07-4c63-bee5-08db22f1aa4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5210
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
Cc: Honglei Huang <honglei1.huang@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is an second stage translation between the guest machine address
and host machine address in Xen PVH/HVM. The PCI bar address in the xen
guest kernel are not translated at the second stage on Xen PVH/HVM, so
it's not the real physical address that hardware would like to know, so
we need to set passthrough mode for Xen PVH/HVM as well.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index f2e2cbaa7fde..7b4369eba19d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -743,7 +743,8 @@ void amdgpu_detect_virtualization(struct amdgpu_device *adev)
 
 	if (!reg) {
 		/* passthrough mode exclus sriov mod */
-		if (is_virtual_machine() && !xen_initial_domain())
+		if (is_virtual_machine() &&
+		    !(xen_initial_domain() && xen_pv_domain()))
 			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
 	}
 
-- 
2.25.1

