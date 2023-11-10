Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B697E79AF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 08:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE2110E6A6;
	Fri, 10 Nov 2023 07:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A76F10E6A0;
 Fri, 10 Nov 2023 07:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlCzEPXbvMCZRXVVOXqvg5O/BUQYHhtLXr5fHqo53IdXlXm1d5Jhca86jznJEPZQSViqFeKTrsYjtRWvOzrEtmq0ngf6OYJhkCA58XrD5t9ZvPVHkdu/di5p+ioTEUDe4PRc7b/RStTeXThmKvqK0a7WGmUQw5gcJ5mMJGTs/dPY1bwB9KyftLIjBRyYzmoZHGpDHZoHaafXZAVGPQV0q+PJ0tlvvZWC1X6FKKt1olfsHymMJRryDqZrOTud3p0NPOy+6v7oCo1ypa6rRvlsuQgKN+ZxhteoAh/o9rx1cVLzfI9Qt501yq7LL1QdMZHznuRr+4aPFs4K3mbhLaSH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq7/cKFN1f+HNAcAQKknLCIVYUptrCayshJDgblJ0Vg=;
 b=ADsEmdNO5aQLPK1kzNNJ+QJejcQ7bY3daVl+TJpmxlyKJvVt8TS0SF42NUiCvDOq20JWHFHrTr8hN/vkZnpidIHD1DTqNDs0v0dP5Bg3tNSv6V+7M7tsubRdieOj6gQU+OGzUGkMjtEHhWJr04834IXPwBGor0aUvudDUjy2d1chtE2lLeiSBSstDlhsAItDUS5UScD3uElmP1dOqUq2dwq7ORc47x8Qq9HG3isAP35+SJCdIYH3rrQkErbbs3PgiUb13jSpQbQVhuLAXvB0Bk3qptt7OJPqMZRQORg6+k0we/oifWGzMKXKjCHHaqu1H7j7ikciCE6TgleuQXXu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq7/cKFN1f+HNAcAQKknLCIVYUptrCayshJDgblJ0Vg=;
 b=YvyJU1fBrJ53rgM9vTdf5/2LIyKAWcrbuoN9BhTWCx459zs7aE4/Z0jGR1o92H1GRAgSMfrbBe9O9rhO9cpbgBUjMZKsvCu1voszF+ZYIkaV7rtRIdwT3aZs8JGgUEW+q3Htp7CzpTDjV8qWqsvrkBEHyTBsvuzhcluklLnfzw4=
Received: from MW2PR16CA0007.namprd16.prod.outlook.com (2603:10b6:907::20) by
 LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 07:16:56 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:907:0:cafe::20) by MW2PR16CA0007.outlook.office365.com
 (2603:10b6:907::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 07:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 07:16:56 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 01:16:50 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH 0/2] Add RESOURCE_GET_LAYOUT ioctl
Date: Fri, 10 Nov 2023 15:16:30 +0800
Message-ID: <20231110071632.24612-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: b99b1a3b-07e9-497a-0841-08dbe1bd05e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9z6gnFQOBw7Mt9AvShFTwJFi1RXYYrjzg3BkM/3eUpOVl3c7xOWzU1KDtwGkiZodZUJWgAKSsK7VZe4BZXV6M0p9VsSqz24Xl7hNeepg17i74Yp4VW9/YDelpsEVsCl6TI23R80ELPyVh384p3rWHt7qEgj9P5FLRfLfFETZLbIAHFaoOpcGQzojdmpKGr7w6iwLubB5RYRgdqVyShYZBOYy9oxQD+UHzHTmWW+UVxuXRL55tYkq35PYdaPXFaz/+91Sj7NV57cF4NqI5ckTUZCgX8TFBL6v6Qk9Ya6nAEJuy4lqQIQ0Uxn3DTYgSaL5GVlB0LMMO0OuQicih4WmUnH2JsjLEqRRYTtiwtTNP5Ao1yKWvCTZNog52zQcZ/giXfBjzxWXXT15h6EGSzvhsM5h0O8tVnTzcHWD1+UfoeJmH4ifUGa72sy6Q88iZPSC2xjunGG1rJY6TYb089mvWUYrAtVuhzUdxTWM4DyFJ2lfjf+zLeo09NsWRa6NaqoA7HFGuhrx08La+oT+55JCeyC3cZagd+T1vmxiWMjnuRr4RQCP24wXTPagvV6EPHh1rpPoeiM1JJkss3KB0BCRMaYZSElipXnZV/PzI3IqGEDq7XG5m/B8sviuif47wt5ZS8qbBOSU3BbqY61Xe9lITixqkYPZCjoUUyI+kinOLK2QRgWVxQwl7U/gzbTlsJSyq5p76KFkzH3vQxe8yGwP4nj0lym8NbDCeq5b9MuplIA0MHvYqUjJpZ8qJu/Vx/r
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(82310400011)(64100799003)(1800799009)(451199024)(186009)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(83380400001)(36860700001)(47076005)(36756003)(86362001)(4326008)(44832011)(41300700001)(4744005)(8676002)(8936002)(2906002)(478600001)(356005)(16526019)(966005)(6666004)(82740400003)(81166007)(7696005)(5660300002)(110136005)(70206006)(7416002)(316002)(426003)(26005)(2616005)(336012)(70586007)(1076003)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 07:16:56.5524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b99b1a3b-07e9-497a-0841-08dbe1bd05e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is to add a new ioctl RESOURCE_GET_LAYOUT to virtio-gpu to get the
information about how the host has actually allocated the buffer. It is
implemented to query the stride of linear buffer for dGPU prime on guest VM,
related mesa mr: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23896

Daniel Stone (1):
  drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl

Julia Zhang (1):
  drm/virtio: Modify RESOURCE_GET_LAYOUT ioctl

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 22 ++++++++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 66 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  8 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 63 ++++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h         | 21 ++++++++
 include/uapi/linux/virtio_gpu.h        | 30 ++++++++++++
 7 files changed, 208 insertions(+), 3 deletions(-)

-- 
2.34.1

