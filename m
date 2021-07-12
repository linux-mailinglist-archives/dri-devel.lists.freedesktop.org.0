Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F3E3C63FB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 21:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E7389D5C;
	Mon, 12 Jul 2021 19:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3A989D5C;
 Mon, 12 Jul 2021 19:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkQF2LSKMPM3Sb87qd++JXBlu0zOLcsKjuGy/9+lrZJvhl/E1m55hmvOcjoWIlvW0CPBysuQt7dmDvln9KAeFrWRXg7I3E4ibX4+7OqmzXFgpTjExcniWRnof4bX38UKPEV+h9MXlEWYD9BtpB1IWYD3Izzbg9TV48aRjQaahe/aezZBG9YAz4FBuZVQ/5ITPEqWIfy0Ri2ECjM1/NwxYsUPdMAKP74xrWkWxAGR3sClnKY1aceVqQBIzsDK2V9UZLZNgrSWkVIaIYzIpv8YT63mN5bLgxTUa1mB5aO5WwSfA4KCUXMNmZ5LHr9XL2ctCtyxEESLCfQJp61GJ9LdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sn0gU1Zxa0ZRSXwB9h4t1vAhLYh9wDK+XHUnqoVKT4Q=;
 b=SlVlCn9+NvFhJGI7My8R0MeVJguSvTmorWdiU9i2kHig6n+/7vCMQTsbOCT6G7JG5MrIDTzYYRi6DdL3T8kl59zmoUJtOfDVojyklceYMafQnce//g/W8M9V9enag3rai1Cu0Z8jeO+wzXMcJ23ISR6FS+bwLA1lUVUwStfe7BIGm57loDKzJO/m66ATqTGb/73qgs9fsS9qz8PojAT6wx5ziIGrif4taKJomwaZdBOcxnL1v5dZDvofU6NKvwNiuB66ywOCncG7HVDkLW6inCElARERAtXe5hGCO7HitJELvD3DJLMxpUTuKA6sgzDcfGL9fWnJyjfIJeYJeLyf9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sn0gU1Zxa0ZRSXwB9h4t1vAhLYh9wDK+XHUnqoVKT4Q=;
 b=akEK317xkVpeqi3Ik1UcTQRhbBPYO4gotTI5DVOrcmZb3VG59U7aIi92dAEaYnZqLctQsQIqEStLLpJvcVOr1NZRow1fUhLigEdXOySkZHMGBLxIgNd8uJQAIetCtfIocIgOyqlQjwgeJDgHsuQQW3rcgyIskX8w+2NRJGADC28=
Received: from MWHPR03CA0022.namprd03.prod.outlook.com (2603:10b6:300:117::32)
 by MWHPR12MB1134.namprd12.prod.outlook.com (2603:10b6:300:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 19:46:44 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::b0) by MWHPR03CA0022.outlook.office365.com
 (2603:10b6:300:117::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 19:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 19:46:44 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 12 Jul
 2021 14:46:42 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] drm/amdgpu: modernize virtual display feature
Date: Mon, 12 Jul 2021 12:46:26 -0700
Message-ID: <20210712194629.4569-1-Ryan.Taylor@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1401052-dcad-4a2b-d287-08d9456dc707
X-MS-TrafficTypeDiagnostic: MWHPR12MB1134:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1134A263E3B9F0E9E6B78B88EA159@MWHPR12MB1134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WA3ec+41zMvXOs9Y5ECrrAgdyxzUDICLEy8moBMXut2tyUf235QwRk/qOtPTd6rh7LIq8AkITWE4g1KENNmRiC1lfYyal9VQqY2IrwrVOzAyQwGLVghWNgQEBKJPnBu56q8q0bGr3xHv75oZIAMUxdhuqUn7ENangUyyOmuhT8Roar0KmDCsyafxI2T6s1ZHwGRuFZyTff1o9yIgZIBUK6drh3aprJ9xC4MiEKUwFMsel/ZKml83G1INCARXb/WPR9qs8jA1UjParf0/IEdeZg7W8+CQPot3E93/dso7fUNEU5ri+lOWKaHTdqLBVmavZEse6S1TK5Tp+ifWHM7wE/6kwyjhmMTHUOHh7JUHaQKxQNlPHmt7e6wIkSe7TcgDWWil/z/FJe6O+aMFsxJoPooaAeVDibvQkv/l3Af2T6h7k1rzyRjxtzpikjpRUiR6ypYx707zW9MohTCbT0SsEKbGix9kjGYVL3LUp2dWMdeB4RQnJdUdPmDmqdl/9wf5M6VkcVNU/ng10UML+Thqh5bghiy4KS08uDHa1W0Vx65eErMk+f8yDA8T9s46bG+KFXyVPEt6FO4/3psYv2ZI8QXKV/1KSl/6E7LaThhCUzi1hMUkgRWyyY494MHsybWCq0c8PYGmLSj18kM3vNSAxDktaKqS+Mlfhga4J7378PpzDiNC8AHzclzTSNUu/cPlWmFnJdfuf5N4jw5KZ45X+4t5CJlqBF8yy4WnxjLpiIw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36840700001)(110136005)(47076005)(54906003)(316002)(1076003)(83380400001)(7696005)(70586007)(86362001)(36860700001)(5660300002)(82310400003)(2616005)(26005)(4326008)(81166007)(70206006)(16526019)(356005)(82740400003)(8676002)(336012)(426003)(36756003)(6666004)(8936002)(186003)(478600001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:46:44.0847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1401052-dcad-4a2b-d287-08d9456dc707
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1134
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, rodrigo.siqueira@amd.com,
 Ryan Taylor <Ryan.Taylor@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu vkms interface provides a virtual KMS interface for several use
cases: devices without display hardware, platforms where the actual display
hardware is not useful (e.g., servers), SR-IOV virtual functions, device
emulation/simulation, and device bring up prior to display hardware being
usable. We previously emulated a legacy KMS interface, but there was a desire
to move to the atomic KMS interface. The vkms driver did everything we
needed, but we wanted KMS support natively in the driver without buffer
sharing and the ability to support an instance of VKMS per device. We first
looked at splitting vkms into a stub driver and a helper module that other
drivers could use to implement a virtual display, but this strategy ended up
being messy due to driver specific callbacks needed for buffer management.
Ultimately, it proved easier to import the vkms code as it mostly used core
drm helpers anyway.

Ryan Taylor (3):
  drm/amdgpu: create amdgpu_vkms
  drm/amdgpu: cleanup dce_virtual
  drm/amdgpu: replace dce_virtual with amdgpu_vkms

 drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 605 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |  26 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 780 -----------------------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 -
 drivers/gpu/drm/amd/amdgpu/nv.c          |  20 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
 drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
 11 files changed, 657 insertions(+), 835 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h

-- 
2.32.0

