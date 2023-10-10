Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC77BF16A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 05:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5462C10E14B;
	Tue, 10 Oct 2023 03:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374D810E14B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 03:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpE+1n7ihfioPRWx3vrQzKRZNoEBaB/0EqU/yK5QyvoXF3udUMChn8tjWJ1GE0T0y85cEcie2J+zyXWdAOQJA/9Y6LIqAjcwKpjNwOQKLMC8s2Qseh09+yKP8DNWyAmGrWfWW+9MMq2oFZcZGsMf+Y6d6cwO59C6OBZ8ssiFNow3Qwco0JVyBqg5XmnOYDK/SBawN/N3mNThcF25K/2k/i6CHbM+nOE8BJh4kpBfkwM7V0BjH1n8PQA85RPcSOdGfRwEvfLZ3Lo/d3hJzggnVT9ojzQOrq86U8RlnfFUp/WuZwfJT4dy4U15PR/Yt8CCvmm/BHZrKcf3jJbn4Cz3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et+fq3nfjxlGJxUzlfGr/Goh0j0iLTLdafj12ws0ABs=;
 b=oKO7H/Z5IWZTm6ACtcq0Hwkrzm5SEORRlGuidGLsicZKlwN5Bt3nQamkEE2+G84PI5qZ6pn8ltQ+jpv974I+dIJb2abhaKHvWiOiZrnwDNDEewKZ/PNjveLCq15e0aHyEfu/HFjFZ2BpJdA5sH023t4XwvKQVnDrxDBB+KXj6DAIll6xlkXIRvzmJJSZPa5QWCBUj4NACWYqNxdi6pT2K38UsectKvdQM3gl2JX1p/OJJDfjmfywUuFkS9SRoJ9IYb+YyV2rrHhC3UvvaRUsUv9QZvgjAzV3+eeJTUQSAShvQFntWjNy5fHlVlx3RZOGdI/hgtY2hSAVUzbNaoBF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et+fq3nfjxlGJxUzlfGr/Goh0j0iLTLdafj12ws0ABs=;
 b=R7wPVzMn7SjpecVMQqRcBotkIynEVDb8qSw7cUmc6IRYoGEWT6ifxfK9EvhDErP/r/u437N7z03woyT/tVy41xlArD3c/JFiLNzaCn6zbRzyY4gE1Yp5S0av9u4dXVNiPo5x88LkvddWk4ZrqS6dIKOEq5pEFYgZ3nD09U5HspI=
Received: from SA9PR13CA0072.namprd13.prod.outlook.com (2603:10b6:806:23::17)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 03:26:34 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::3a) by SA9PR13CA0072.outlook.office365.com
 (2603:10b6:806:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.23 via Frontend
 Transport; Tue, 10 Oct 2023 03:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 10 Oct 2023 03:26:33 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 22:26:10 -0500
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Akihiko Odaki
 <akihiko.odaki@daynix.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Subject: [PATCH v2] drm/virtio: add definitions for gfxstream and venus capset
Date: Tue, 10 Oct 2023 11:25:53 +0800
Message-ID: <20231010032553.1138036-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 9115cc3c-f431-46b3-9c26-08dbc940b417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EO4a92buXPodC0iJDlszWlYIYb4zOMnGepNS9EKT87Bmf7uBYJNScIE0WDTv6o0oqOjd+D40n84JU+IIOwqlF5ZIbxPb0KVEoluGrHb+Yi930pLAoVfQwRNm8o94tJGUu47+CzSeLFQWlN5EvQAcDaoRX7K3k1Qt3aLTkki+UAWAt+OGG+/gIE2UnUR+Ectzb+9LQf+n8M0XfZ0S6Ywsd0tntTp6e0kRxlcWh5Yzx7w59pH+a1Wudx0rSh8DPLkeBGfrlYlro2X94Vjwi8XWaJxdey3iPy3GPPFcGew9rRMmU26UOWGaraSVv+R+t4PPah1L87BUGskPJ2CFonR6Z8mRm8MI1PSotz/c8A/Q+AWsh6bjTVYOuH9u1NkYcxRHSDPQbm49YI4Xs/q4yZgIInZho2YjeozWMwxY6eDCFy1Pd4MzaV+VsO2cgmrUZ5++3FO/H8supa7SPhI+fiJO+55SwpYOP/O0dIJo5yimDiQzyteAZ4MS3o9A1FudWvGd4QOYXXFYhYLnbVdogCagNW2/shMYpevrtnGMPgGB1m0je8m7ZyqLybb1gB+ctPyPldfYFQxmPJGXxKDE3AJsi3X4ge6LatuBPF8a0cXQM5/9hr42VS+f+qvmq/i+TfnzGCgPT+gY1ZwJroodZfI1dgxhxqpnSh4V/+P3uzOqL+Kr8xYLGyCskDdsiUcTyPBiWEOUpc5KYTk71og7WFRB66vPZ/5L76gY7nN9Jy0ouf8ACeYk0ZN2lbA3z+Pj/ovfMoTp/BOMYpC9VGaZmV/SQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799009)(186009)(46966006)(36840700001)(40470700004)(40480700001)(2906002)(316002)(70206006)(40460700003)(2616005)(336012)(1076003)(426003)(70586007)(16526019)(47076005)(36860700001)(26005)(54906003)(7416002)(110136005)(4326008)(8676002)(5660300002)(41300700001)(7696005)(966005)(82740400003)(4744005)(478600001)(8936002)(6666004)(36756003)(356005)(81166007)(921005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 03:26:33.8968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9115cc3c-f431-46b3-9c26-08dbc940b417
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Julia Zhang <julia.zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These definitions are used fro qemu, and qemu imports this marco in the
headers to enable gfxstream or venus for virtio gpu. So it should add it
even kernel doesn't use this.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Changes V1 -> V2:
- Add all capsets including gfxstream and venus in kernel header (Dmitry Osipenko)

v1: https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/

 include/uapi/linux/virtio_gpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index f556fde07b76..327792658bdc 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
 
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
+#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
+#define VIRTIO_GPU_CAPSET_VENUS 4
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.25.1

