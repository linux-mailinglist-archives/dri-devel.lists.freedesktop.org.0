Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458F9E7F97
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 11:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8120310E215;
	Sat,  7 Dec 2024 10:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BDusMLbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E9510E215
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 10:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZLARswOq4vxTYQ5L/ALSx77d9uZfmI6AbW6OR4Er8WLOArUXFO0hX5DU9facAqstLizPTHp5VwQcxdc13/sgoRr/O9ButblsETIM5FjoJmbIFS+v/v6MTF5GnVI2CA85rOvUizSpUjKDOP0ZelfOiyZ9SoOlCdCeVELJXTq8/VWfq6nKvdrgq8vCWdidkvPXNcwC9m6aHjmw1Ge0eNygotFl7ZpRCKkPd5W39bEBUPydqObQRkVk07vIbuvvGL93l56lVK2wOXym6zwh2DU6LcpzIB2AVjvVgr+ucWgzAebMCCByAEukGGUFHb/Hujuemb+Kjl9dddUHGrVmRT1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3NJSEdVo5KlzEiay2XUDjqLBYgfkv1hWCm9vS9ugrs=;
 b=XQbXfEQnMn0L+hqWbQVA+i1IDB+h2VQrfxIbPokL/Q0lShXSJhAvuHgx5RYdEiGpuI94oBlxPKkLeRndjwbha9F/JogRHIKChNbZLKeNg1ZaPouD6kA81gWMADB45AIyuv9kyybfzhwHB1GPMmQWMZaAd3dIO5YmUUyPhGQQGw8DHCQI0hqfXIwNSQ20RTctnX5+eDnf0P9Rt3dSCqgCK4++hR1Wjfw5e5M6INdxd5t/HrsTjU+W1LpUo5b2BxVtBjtNlp5tZFDT4oVf61VX8F7A0xa3Zokhn908A+issxIxeEaKhlj2US4Vp0qOoeU+q9/n2R2kJNJSDyQb2upbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3NJSEdVo5KlzEiay2XUDjqLBYgfkv1hWCm9vS9ugrs=;
 b=BDusMLbwmyovvjH3FCjJApxWII0hXqBuGEqabqQq33Wa0NK7pp5hFPLUFYAg1MG/cdu0CDTvcRuBQwGTbyVjrR61Ti7ylC85G9dgMKx9vnDTh+jlycaxCAQhSnAWMast48IKDpgvZ+veYZDaUv7fJRkr3HhJYwbmRxYeMROrpa0=
Received: from CH5PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610:1f0::29)
 by BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Sat, 7 Dec
 2024 10:51:14 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::d5) by CH5PR05CA0024.outlook.office365.com
 (2603:10b6:610:1f0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.11 via Frontend Transport; Sat,
 7 Dec 2024 10:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Sat, 7 Dec 2024 10:51:13 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:51:08 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
 <ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>, Zhu Lingshan
 <Lingshan.Zhu@amd.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Julia Zhang
 <julia.zhang@amd.com>
Subject: [PATCH 0/3] virtgpu: check if P2P is possiable or not
Date: Sat, 7 Dec 2024 18:50:20 +0800
Message-ID: <20241207105023.542399-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|BY5PR12MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: e51dea4b-ee44-41df-ebbf-08dd16ad11c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YFw/sjdbC4eGfb4g5dXVndGFO2L7uImwUJh7oHYCsJsfdwT79Q9INuj3739D?=
 =?us-ascii?Q?V/Pa8HVNLZY8szM8uwH1ZwMqywy2B5I8HTE0AWiMws2A8r+ICBNq7QBBmiVO?=
 =?us-ascii?Q?xbe1tqagwffnN0DZvHszJRZvqPxMZEVXgihgdhwGoVCziMf7c8AYBlPvWANc?=
 =?us-ascii?Q?7KbyiLzoYgUSPHafUYOJeoFb0/Za3HjMy3PoqzBteHqJrp6xE+3TvAQSBFyE?=
 =?us-ascii?Q?EwisEZFQTkMLIb//N2CJvr856XTijzc0NB4u0zccr2fw6wteXEK279gh/uUz?=
 =?us-ascii?Q?Z//6Qpb9EMu4Wg53Fuyd8VG9tdrwNH+EK1mtGuu5gAYkoUt3mOpb+KQJttzH?=
 =?us-ascii?Q?ql/9PpvSXAjMlPLnz+KnFcff9hmnDrCrSO9TuGmuUUl/WHu/GsujrEO98M3H?=
 =?us-ascii?Q?TnPyypJpsghiFhJfq1jzU22dLhUFdVfRSu+Pzb/YkzG/scZjsraKqUQJhzZv?=
 =?us-ascii?Q?uxmUzI5DptNq/6aLO0QrClZ1sTh+g4QZNavIPbcbyngdzamnMq5j8zIg+Fed?=
 =?us-ascii?Q?t3Zd04IsldfNnp0UxIHOY33wzTXOrOz3Y/ipIEBu+Ci2oh4INR5CS3hqzDDA?=
 =?us-ascii?Q?GGSveS3NAimtp1tYz3WDVnVT0F9DjXiAOnVH9MW43xkzbfhOpadXSSE5k2kH?=
 =?us-ascii?Q?jb0dpuDWswG9x1m/1futWep5fJD7zDwNrY4WZVo8YLFQm7uWwMHKebIX7lKe?=
 =?us-ascii?Q?g/nl24KGV1E+OtV4dvwG8asmZUHtkq50Lw1djYhVy9RplmOSDPEPPp5p0E9w?=
 =?us-ascii?Q?P8mesnyC5hVssTrw+Rj1dsn+aYqaxoozJVc8LdS7mE39U14Q8TgH6xZ0OeJE?=
 =?us-ascii?Q?DK6AECVmvDq5yPomM5RqHJBjvyXYdqIHLhHwQ3cJO4cv7XEfXu9i0aYOtVJv?=
 =?us-ascii?Q?f5+HoS+UECkT481tmb7UrbnyiTMvRDElpEEPdNxpJmBoU0yHGxxwvrgOd6ef?=
 =?us-ascii?Q?g7kKrsxY43n64exIJZZTtU/cPFMxExrttK1cCVtIS59+h7L2FL0zxEji4Gbb?=
 =?us-ascii?Q?t+dCeWYuOFKokLSlTe2x211ZOXXNOiVCFLUyB52cKhRnjrCZum2PzA3DwmI5?=
 =?us-ascii?Q?Krp6SvYUL6KMODM5g2BmEWLmo7reU373MD6qrI4zvsZMzDhM4dkkbr3RJIsg?=
 =?us-ascii?Q?AyyX4VhRzOHCUI8pdPgR38VTaOQN6r6vfPgc5v1b3BAAHL7DizpQGSYtBbfQ?=
 =?us-ascii?Q?1fKRTdAS6OtcDpFknWDUb6c9+RVXvuAetzj4wcHXGAJsnetkufGtNijoOJJB?=
 =?us-ascii?Q?4dWmH7rT2yjvYuR70DQoTeQTyF5ZtzZW6NDcqJ7qQzG06y+kEbj9UGGDIpkr?=
 =?us-ascii?Q?TQ89nkMXlyqKk8AkdXXtKRnec8HyBU7tmZr7NnUFi0MkhwgAgiHHvtNAXUNe?=
 =?us-ascii?Q?UBMaIrkqTcRkxvbmW0F21JTfbwEixNfXchqhP6qc+Dj4oMmu9uojn3tE8+tW?=
 =?us-ascii?Q?vwjqtZSqhAIh72urGZHbcJBybq9UngI+axNsetqo8p4msM5YPSJ1gg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:51:13.9074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e51dea4b-ee44-41df-ebbf-08dd16ad11c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148
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

To implement dGPU prime feature, virtgpu needs to import/export buffer
between virtio iGPU and passthrough dGPU. Before that, virtgpu should
check if P2P is possible or not. But calling function pci_p2pdma_distance
in guest VM will only get virtual p2pdma_distance instead of real physical
p2pdma_distance.
 
So this series introduce an implementation of virtgpu device_attach
callback to get p2pdma_distance. And also adds a new virtgpu command to
pass PCI notations from guest to host and a new xen privcmd to get physical
p2pdma_distance according to the PCI notations in host.

Julia Zhang (3):
  xen:get p2pdma_distance
  virtgpu: get p2pdma_distance
  drm/virtio: Implement device_attach

 drivers/gpu/drm/virtio/virtgpu_drv.h   | 17 ++++++++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 59 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 53 +++++++++++++++++++++++
 drivers/xen/privcmd.c                  | 42 ++++++++++++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++++++
 include/uapi/xen/privcmd.h             | 12 ++++++
 6 files changed, 201 insertions(+), 1 deletion(-)

-- 
2.34.1

