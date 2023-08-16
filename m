Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9A77D94E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 05:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A589010E2BB;
	Wed, 16 Aug 2023 03:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C756310E2B9;
 Wed, 16 Aug 2023 03:56:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgLf44dAijU/DsPRZ2q7cyT+KyCL9LgZeNeSKOEKvGzRo6SLslUOnpb9NrKhLpSyRNXkUMVPCMXFb61icOV74qsWvRCkofm2jjTgO2aBW1CWNETA3p5hspXDRGi0wjKykQzOcGKK0VGLxjVIxqWNDe1q+n6CbXnF23GrZb6IozM5mctcRRL4VqHf0tXG44T1p26CyXOQ+RiQxRESehATSJFZLkACxhXwpKzbrUHAKvv3aXzIdw2tn3/tEmh0lVdI3+lAvn15Qn5LM36tq5YGvGVd/GlGa5PUHmJVE0NxzydXUrW7p3M5YJeV0k8icS+HLupMkIdmHIz55lo2UNr1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttxEZj6OlG2UJH/4Q2dHbHHKHsE4X4cszGeSXmhZCAI=;
 b=FUCp6tsKb2zSe2XPOEilc7QtLEEK/ljSfzU1uCU3OkltbxkFKRnEBk4LN3kodQWzGPm0Pw41W7BFE/Q34gOIPFFhfKI/X3CDUVf5FB+yxvY+X2IVK2/XwnEXjDjoRY9RTD3znXwpAO2ApSX4nchhBERdNbLNmtn6QyziXIoTPwrYYQhqKtesQtYPmYMX3hEpICEBzcpPWqdSqHTBLfg1pJp9ynLwUSLfFtDgOgEqjS0HCLl+oGKbmM9RKdomx96svqdxAnHAaB+z5H0Q4iWPcPAr/RX+QqXxgIfz93VmVMmALuZX3kEqmGjttuOF6OI7FLEdDqOAwdklX5sXpODvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttxEZj6OlG2UJH/4Q2dHbHHKHsE4X4cszGeSXmhZCAI=;
 b=BCJlgs54V43IP9Uz19Gad955Z3LlsQJn02gEcBb59oM13R3cc+Ipv6ff0zTdKHbb4EdRem/ymV+qYpZXfsEbkxek7kzlu2+3X3II9pBpldVu4+4hzTGM9UiM+KrbxTXA2HqFTIs8hmQalx1DosoqI+pH2Qd5Av/jnGgM3oET838=
Received: from CY5PR15CA0061.namprd15.prod.outlook.com (2603:10b6:930:18::24)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 03:56:22 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:18:cafe::e9) by CY5PR15CA0061.outlook.office365.com
 (2603:10b6:930:18::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 03:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Wed, 16 Aug 2023 03:56:21 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 22:56:19 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Documentation/gpu: Update amdgpu documentation
Date: Wed, 16 Aug 2023 09:26:03 +0530
Message-ID: <20230816035603.690383-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f987b9-913c-4784-7379-08db9e0cc12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+ha7H/JMoyMiq7v1QLKAORuiq/B6CocBqae6Zm2rA+OxhuYia9s25S49uLkAwT2S5M98+9WTvQAdXJD+6wtkrq0py/rs/vCkS9ziODmERrh335ku6bndnjx3Rn28RZ56ZiMrO6w6PtmsdneOiDgsx/eyu7tR3UDd918AvfUv1IWEGkwF7SmBxwBCsNNNCsYfTKyQEMUIvsSCoe/lyNHkZcFj92kqbngFrKtTZmV4FnNr0CLX7c7JgmQZ6rJztq78D8Rh/cxDuWgcY4vvhp9yC6vQN2rWrv8P5GYn0YDxOORZX7D7uBJsAAZ0eXMHLGqmnV90wSbgkstnXBZH9eW1K901Dxs9iSHUCqAZ2xPH0vGx54i1WjyVoVHNKku5i+CQGDbz7fFVXN9QRiNPQkx2Hdr8hga8FpQMGpOh6DzsEPM7PU6vfZGqh0MCo3v4Q/3V7+q+n8VsGI17bbCPBJ12mydW7Zllrxy3kcBKDxiTZdystrz5I4wTHDMSv8tRxvWtd9H7qekem+Gckl/ZMtp0hqJgR7HVi3ky02ZDfLYaIZs4GrlaRSl5WzqLdnq2MacDRx2P5xdBZzg5ThG5iJTUJJ3A5RSJn5W62NCTd8BebdrEu19ue/zcHYLKHR+6SxVNgh7WJgEObBvliDHgyB+49BWrhvHFQeXZpBVYvTyNf57dVo5T9oN7vdKa/QMjCzjw7uqf4VC1fTBvg457u4IzTsHkkCJmK3jeVKpOakT0ygkVlvvAHN57MTnGYFJ5VRr1i2rUrpk+WkAQ3yAHPsF8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(6666004)(54906003)(70586007)(70206006)(7696005)(2906002)(478600001)(15650500001)(16526019)(1076003)(336012)(426003)(26005)(6916009)(5660300002)(2616005)(83380400001)(41300700001)(316002)(47076005)(44832011)(36860700001)(8936002)(4326008)(82740400003)(8676002)(81166007)(356005)(40460700003)(36756003)(86362001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 03:56:21.9544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f987b9-913c-4784-7379-08db9e0cc12a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549
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
Cc: Alexander.Deucher@amd.com, sfr@canb.auug.org.au, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

7957ec80ef97 ("drm/amdgpu: Add FRU sysfs nodes only if needed") moved
the documentation for some of the sysfs nodes to amdgpu_fru_eeprom.c.
Update the documentation accordingly.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index be131e963d87..26334e54447b 100644
--- a/Documentation/gpu/amdgpu/driver-misc.rst
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -11,19 +11,19 @@ via sysfs
 product_name
 ------------
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
    :doc: product_name
 
 product_number
 --------------
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
    :doc: product_name
 
 serial_number
 -------------
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
    :doc: serial_number
 
 unique_id
-- 
2.25.1

