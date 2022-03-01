Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41F4C840A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 07:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32EF10E640;
	Tue,  1 Mar 2022 06:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB0110E640;
 Tue,  1 Mar 2022 06:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cln+Y6UKRthRM138t++MVR3MugkZsS9OCaZrsMY1zgVSv8R1mp09ODJ00rhtm2jwMlW8jVAEHZyG2Cmc3vge9J9YoFaE7q37ZlXlLbHs0RTrrwUcvU+lP/i6r/GOoZRgzOKlujJl0Vocq6fddSxe0JsgiOYWuFowk2uy4rShEnIww+A9+gMc7ZgCPQIu6PqQGtPLHhVIYH/ctTl6oXEbwgYPWvSnbLD7y7AEHSPZCgT1ixZ0NRkwQwqGz4KrnukmZZfqw0Ddy6VV6hOc4ptoVgTrbyd6m+SxiM91oc/xaEr/z23AAeQNRX4QkyO8/GJ7fpinWSXyjxW230o5YpnqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvfb3cj2ewAlU2nkD5sKHfs2g8DmVJiNq4/hAPtomys=;
 b=U+W+zyN6vFWOH/rmbiyUiSLdPrxKK4Vj5cKWBi76MDoMh3gIuxlUGlK9He5oJtJ9kFqJhQOQnDG7FGuWi02qK4YGSTJSX76mgR0yzoma2Po0SaGQqTYrk8gkYONhUDKpu/kPdccuJihgIZiT8wcaMa8E98ip4b3vo+ZJgU8jWb/fEt/ZEILrob5TEt4bNq/jwfW6FhHR4eOVoK9YDZl88PfJpu3vky2HzKk5AWZM0L4a7Sxr6+fM3VrfxvoTz5YYRP53mW0hUsDLYbvyDtmGX9yJu3ifypU+yXzCa19APXJraz6wkXvPJbWT1lBIwbdbdFBWfyfAQ7UsMhp1WVo/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvfb3cj2ewAlU2nkD5sKHfs2g8DmVJiNq4/hAPtomys=;
 b=snoHW+7scYhSxWeX1SrhnbzLYRbvQkBJMwl7zGTTTfXOTnK9NBMrlqXd83u/vYCLwTJkL2HK7phF6/TDcH5/Er/AdYi397Dk8igNnrRkX+JedawkUpHLlEQMTpXw1hayifClVdNlh4TtifD7eRTu6UBWUe4/cIBjwR6bGORVbw0=
Received: from MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::6) by
 DM6PR12MB2969.namprd12.prod.outlook.com (2603:10b6:5:115::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Tue, 1 Mar 2022 06:28:40 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::7) by MW4P223CA0001.outlook.office365.com
 (2603:10b6:303:80::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 1 Mar 2022 06:28:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 06:28:39 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Mar
 2022 00:28:35 -0600
From: Qiang Yu <qiang.yu@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Qiang Yu <qiang.yu@amd.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Subject: [PATCH] drm/amdgpu: fix suspend/resume hang regression
Date: Tue, 1 Mar 2022 14:26:54 +0800
Message-ID: <20220301062655.232955-1-qiang.yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b0fdbd2-69ab-4d04-4d6b-08d9fb4cb9b7
X-MS-TrafficTypeDiagnostic: DM6PR12MB2969:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB296945D764AA581635AC1D108F029@DM6PR12MB2969.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zc+4Gqt6zrQPT+9Y5Y5h6mZctZgklzvLzm2Nm4XDP9Ast3bKT15S9RSR3Cgm7I7L4seQGjQ1qA+6oAvPHC0CCbSX/Dr0I1TACPsMdBYeN6+fMVF6jJ//w29w3FvRuI/QsfmDzXaWFJwX7FEvmyIhc0giZee173EAU6gUX5KFp6r7ZO3fhrURnMWAW2pz2KhIE72Vr+2JIMT+iWRbBSs4J5BsfsBIEpIqE9CbbLiuWzk7YztbfUkB1remWJMeog1Pm13yYaAtkDOVhyAepr/zm2TtrFOIhnsVhylvEc4hqP7G8wKTYmVs1RXvNHyxkAJac6SgItznKPTroB0wSQwRHFXgc17yDtLRiBBYqNGnYJkDVYYSxgZgHQAckyFOYzvCHLIxzSO5CODd0UHAZ2rDSoiPCKJkAYIFBdCLiUytHig6KpgfqtFJlv/2h5kDGvqUISPWO7EovVcWPskgudNsAvzVYXNOHZwKZRYJeeFLpuem/jA16KQYgK67MtZvSMr1vBMtnmUa66RkubgoFahL2Whap1fppnA3mNcankNDEgL+brn9ZKjpALyXXfu5DSxpkeBRyXdah8msLoepcP1OISzDaLou8ggRcaGQSiPBeBEk7IQYrajhbGWmhJbIVS6S3aIc9Br8XOWeMz/h/TDBBbBc8CZwOTbd/hfb04skANU1GGGxJEljGMciUVtPDmrh+1p97fJ2A7oKTOzUl530jA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(44832011)(6666004)(508600001)(1076003)(54906003)(966005)(110136005)(86362001)(8676002)(186003)(16526019)(4326008)(8936002)(70586007)(4744005)(70206006)(2906002)(5660300002)(15650500001)(26005)(83380400001)(2616005)(81166007)(356005)(36860700001)(40460700003)(47076005)(316002)(336012)(426003)(36756003)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 06:28:39.9488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0fdbd2-69ab-4d04-4d6b-08d9fb4cb9b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2969
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Regression has been reported that suspend/resume may hang with
the previous vm ready check commit:
https://gitlab.freedesktop.org/drm/amd/-/issues/1915#note_1278198

So bring back the evicted list check as a temp fix.

Fixes: cc8dd2cc1a97 ("drm/amdgpu: check vm ready by amdgpu_vm->evicting flag")
Signed-off-by: Qiang Yu <qiang.yu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 2cd9f1a2e5fa..fc4563cf2828 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -779,7 +779,8 @@ bool amdgpu_vm_ready(struct amdgpu_vm *vm)
 	amdgpu_vm_eviction_lock(vm);
 	ret = !vm->evicting;
 	amdgpu_vm_eviction_unlock(vm);
-	return ret;
+
+	return ret && list_empty(&vm->evicted);
 }
 
 /**
-- 
2.25.1

