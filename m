Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7CCB82F9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 08:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8EB10E57C;
	Fri, 12 Dec 2025 07:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="duanIC9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD310E566;
 Fri, 12 Dec 2025 07:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3WUs/+uCFQo5owC/jfJq5MV1PBKfiL7zIzrIjk0gHATviqGuyyXq+n9LEqMlsKTnt6jK+VmPtba2p0j+tCbDWKnKU6zTznyBs2r0hbPK8iM8qJQFdNJq9aJXCMpXPkhp6N3CthxPiH7qMOm9cSQl+0IF/putUOhZm9Lmqnq/yPsayvZIY/a5y0j8FIHOqWC2Iy7YiJe+SPMDO+Ggtr4fgn8IYaTT4cUamAnZIhf6FXPQYXAbTJ1TNDOWBfQ2iif/ZY8Vapr1VQwpekKbfyGOt+pEq5pCF1JgG0lhn2B5w0AnL21ZEbWWqfX9V96d2Nu2oMGtfLyPBynYwggNUWwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLqaZNEUJAHGWqY4zDoGQZISBNThGLcN9aUGmxhxhms=;
 b=O4IWSJt7d+rqYU/OQDfQNa0NX16LxOtC6md+fasygo+YJBZENlNYmc5st3gv5tZj+eoXATDsGnz0SzCG/DdID/ou+pwJ6+Xf1CILxJseSA51NS5qz2+sPR2UCUi4mH2YR2zHVilOyK8Y5QFqQwTYRjpiUkxjnDumKXrtOl5u64N/2RcKUAjjS6u2RxQhbkP4G3F7LxUM1ceuovfPh3cbjOhH2Dp6trGqJhnxGZOHo+kW110wSE1hamL6LA6yNpA2V0nOFz0bG6RSeuaGvLDAFOwOFoxVOfh0dNqlfok67JvsJyE+ElKHrhjpek12VxWPW8VXaBvy7diNTjy1vS4rXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLqaZNEUJAHGWqY4zDoGQZISBNThGLcN9aUGmxhxhms=;
 b=duanIC9UH4sQuyRNtcS6WuMww/8++bTJn0dR56LnU9800+q9idu+OTLMPvanHRX048c8lLAKauRdi6VycYYdZQkLiMMg2IbhZm8qRtN7jGeyv+sZRQP747fQCGS43yKn+PF5hsAaFKgzG1chjQ2Gi/ET6byWwe5nEF2vC+5xtUY=
Received: from MN2PR04CA0010.namprd04.prod.outlook.com (2603:10b6:208:d4::23)
 by IA0PPFACF832414.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 07:59:48 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::12) by MN2PR04CA0010.outlook.office365.com
 (2603:10b6:208:d4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Fri,
 12 Dec 2025 07:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 07:59:48 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 01:59:45 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 12 Dec 2025 15:59:16 +0800
Subject: [PATCH v6 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-vram-carveout-tuning-for-upstream-v6-4-50c02fd180c9@amd.com>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
In-Reply-To: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Tsao, Anson"
 <anson.tsao@amd.com>, "Mario Limonciello (AMD) (kernel.org)"
 <superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5664; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=xAN4woqIXrhKqCpDsmtzoCL+uRodRN9h9QCPgxEdI+w=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpO8tiFHfJFYCqk2v9WfIHsqCQq3znPVsOFL5hR
 8/PbeNZ8QaJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTvLYgAKCRBfF7GWSinu
 hvEiEACntsr5/3uB+25YKltcbnuwIDkij6DP1dZh1T5vftjaJnESQrvUW0p4MFpiyXf8LiPpW3d
 +dBevV9mzzHCox0kz8rEQNlCA7BWvZxnhMdXpuzJOLNoK2NuYewmcZIPeb4yWbYsCEgvY15mrfk
 QexqTyvfsMIcEGFQpCRIOhmo6VaAjzdJq3DO1aQn17PT62fx+NVCkF6irizIMtNmXvqidbI7rTi
 IYmgFaBYMj42ihVOC3xoB762BIbNOqaiMIaL8CsUQq6StUiaLSCGjFIV1qyVoyCZsFihOsKi77k
 pscgn91UTStg8UMBrvgFZvb+RHiWPqwjrkmkf3u+0Pra7VaZD4NbZP7PJQER1QY+w+HMGvCPUP1
 W1kdcTD7VU4zw7FiWWC3KpeGUtue6YrNEUk9xBUxyAybKJIn0daTqrca+z7tao3kBT+Cmvsb8c5
 IL+6ebC6gVSwDdUZUYl1a3exHyIkvhutOJyKI+KRsYN+wGZ8dHw24b0HJUVOKvWIvvBcuzREtoP
 k05jRODZVFLzwrGZ0Ctb+U/FimeZhpBKNqHISrjvCeNxZQo/h9dCWK451xMPt+fvc1ouh+2cU7F
 JUfgkP1OnC3yXYQKnIBqNT+0BZ5CjecZX6t/KYNPnjj46Qfc7jjQnW9x3HdvnR8FBcvI+rqG298
 yqQppJDAz2OSCxQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|IA0PPFACF832414:EE_
X-MS-Office365-Filtering-Correlation-Id: 667a3a63-5343-4389-334f-08de39546c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clA0QVNTUk4vdzJia2J0ejJzTzhTaEplaWgwaU9ZZFMxL25HeUFmQnhKWk9z?=
 =?utf-8?B?cnU3dGNXL0lJdVIzQWxMczhpUW9LOG9VdDVrTWRieWs1OTlDY2RqaEZwbzZm?=
 =?utf-8?B?WUxXenZCYk5RZGFhcDBBL3lRQXgxM0pibkJQWHFQbUZTcVlkWUxXZ0hTb3Qy?=
 =?utf-8?B?YVBsc0JtSjVjYk53QW1IcVFNZStKMDR4cjRSc2xabW9ZK3hhUy8zUTlwMnlN?=
 =?utf-8?B?RnZiTUIweDc1RXFFTjhnei8xMERTdCtnUzd2OXUvUnRoeEJnVUFYR1hqblNX?=
 =?utf-8?B?S1hmUGp4UGxzRWlEdmw5VzV0azFYdlFsUVJ1Q2xKeWduTjdoZDlEVEgzb0pm?=
 =?utf-8?B?Q1BqQzFKbzBRdjM5RHZ3Rk9BRjh4TkFiV1dnQ1RKQXhubTlsMTBDRmhjaFVE?=
 =?utf-8?B?aDBwbEI3UGFIbzhkTUg1WmZndVlCL3RjK25oU09qMjBzQ3ZSMm41dVEwT1N5?=
 =?utf-8?B?T1lsOFpyMmhhTXNreStTSURxNXdzYkVNekFYZzV1Zy9KOTNDWjQ4Y05GSUQ3?=
 =?utf-8?B?SGU0TzZXMXdqTFNIRWQxTU5BRjVScmNaQ1czUVg5KzNqazdMc3kwV1ZzTWE0?=
 =?utf-8?B?NEprdEVTWmNxTUdpNGVuL3crc0FoUHZ2Yll6MFc0R2lYRUd2Y01qU1J5ZVlY?=
 =?utf-8?B?U2xTWHV2SjZQZmJLWnR4NWc3b3A2UnU5N1hzdmF1YnJZMG5NYUxadUZqUnJm?=
 =?utf-8?B?UWJtcm5SR21wOTVhNkg3SFJQeWs2VXNkRTU4NXZGRFRJc2FVZWMyaUxGOTRa?=
 =?utf-8?B?cTdpUmxMYXpGa2pCQlJvQTJmOXR2K3hTV1dDaTVNbFZOUjcrcmJScWNGQ3Rs?=
 =?utf-8?B?bjhJRjlCS1NYVEtNeWdhL29FTGZjVjM3OHIwOElCeXRVNE51VXVsckMrTkJZ?=
 =?utf-8?B?NkVkWkRiWHZWME9oRjllRFlCSUxoWjZaSXR1cTl4SGNOVWJNWnNLWktqa1ND?=
 =?utf-8?B?YjlOZnBGZTlEZ1JUUFo2enRrUXcvQ0RjTXYxZERCV3NaSWZma0dmamZWWlgv?=
 =?utf-8?B?SzdHS3dCcWRLWGlxOWRvY2VZUWlUR2dlUWZrYlIrMktibGk4c3F6QVlxNzRB?=
 =?utf-8?B?SGtFQlBjNnZyOFB6UUE2M2YyL0Zha2d3Vi9XZTByZzdhMlZMV05yWEFES3hL?=
 =?utf-8?B?a1Y0emo1VHl6cjl5ZU1QQWV6RE9zTDZtYjE5TGtydFUvcG9peFVva0czdjJW?=
 =?utf-8?B?NkJZSS9QcW1qSUozUlJlbEkydXRXVjdseVJxcDk3WnpNNExPWVVrMzIyN3o3?=
 =?utf-8?B?aDVnYVZMMEU2blI5WWZiTlprWHZhblFFdXIzK1EzaFZDcUkrUlhUS2NGZ3pJ?=
 =?utf-8?B?djFaYWplclJEOVJmUnJsRmVxb0xNU0R2STZIZ2FlWThXOFdEWmJ4ZkU3ZS83?=
 =?utf-8?B?TTVsTlREVmpscGU1TW5ybHZteUl5S1lLKzJ0MVJvNTFtUG4zMHQwUk1tQW0y?=
 =?utf-8?B?bEJJQVp5YmlBa2xkRkNPZ0F6UXFFK1g4SG9tTmVROXRtM0xFM3VDNzN6emU5?=
 =?utf-8?B?dzIrUThqMmJQaFNvMXAxVHBJZjRrUUlteU03MWp0dlV3U3lQdXpEMmx2T0ky?=
 =?utf-8?B?d0tqdnRleXJWRkxKU1FXOTQ1M0tuci9wRjZZMHdVcTZPbWVlTTJsR3lNcno4?=
 =?utf-8?B?djBiRFJ5Ykl5QW1JRktnNFcxYmw2TVg3dzBNajZkZWk5Z1NDOXQ2a0x6dXBL?=
 =?utf-8?B?SDR5d1B5WUtOQU05NVpwSXh2ZHRrTnh0NXN6OHpaWTlVQUtoQWprazJGUGhp?=
 =?utf-8?B?SytucVBEV3U1U0F6Z1lzWFB1VSsrNDgzVFZ0dC9STElDVlMyM0lBRksrcFEy?=
 =?utf-8?B?RVJWV2V6RWNwRm9oUVA3bk9INjZGWDUzYnVCNWZqM2EyallGZ3N2OFJzZDhM?=
 =?utf-8?B?RTYyTW9CQWQwajFUbjJheXZFUUhPYWI3UGNWQW9mNzd1REtuRFBpeGJ2TWpq?=
 =?utf-8?B?MVFBc1BBemtrZENRc2g5RmsyVW5TLzZWNFBhMEcxeHpLNUtBM1kvVE9YeEs0?=
 =?utf-8?B?UDdxbGV6SWJ4cEd0RXo3dmtUTUZhb2FvcyttQXhXS1RWNnZIZi9sYURVUVhj?=
 =?utf-8?B?RGU4YkJJVmpybDJWZzRuRnNMMjJXVWRFeGVjSVVuU0pSVGVFUXNtNXprOThw?=
 =?utf-8?Q?PSVI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 07:59:48.6902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667a3a63-5343-4389-334f-08de39546c21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFACF832414
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

Add a uma/ directory containing two sysfs files as interfaces to
inspect or change UMA carveout size. These files are:

- uma/carveout_options: a read-only file listing all the available
  UMA allocation options and their index.

- uma/carveout: a file that is both readable and writable. On read,
  it shows the index of the current setting. Writing a valid index
  into this file allows users to change the UMA carveout size to that
  option on the next boot.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 143 +++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 903c4706040d..e78e6982312c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -36,6 +36,7 @@
 #include <linux/pci.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/apple-gmux.h>
+#include <linux/nospec.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_event.h>
@@ -417,6 +418,146 @@ static const struct attribute_group amdgpu_board_attrs_group = {
 	.is_visible = amdgpu_board_attrs_is_visible
 };
 
+static ssize_t carveout_options_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
+	uint32_t memory_carved;
+	ssize_t size = 0;
+
+	if (!uma_info || !uma_info->num_entries)
+		return -ENODEV;
+
+	for (int i = 0; i < uma_info->num_entries; i++) {
+		memory_carved = uma_info->entries[i].memory_carved_mb;
+		if (memory_carved >= SZ_1G/SZ_1M) {
+			size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
+					      i,
+					      uma_info->entries[i].name,
+					      memory_carved >> 10);
+		} else {
+			size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
+					      i,
+					      uma_info->entries[i].name,
+					      memory_carved);
+		}
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RO(carveout_options);
+
+static ssize_t carveout_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+
+	return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);
+}
+
+static ssize_t carveout_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
+	struct amdgpu_uma_carveout_option *opt;
+	unsigned long val;
+	uint8_t flags;
+	int r;
+
+	r = kstrtoul(buf, 10, &val);
+	if (r)
+		return r;
+
+	if (val >= uma_info->num_entries)
+		return -EINVAL;
+
+	val = array_index_nospec(val, uma_info->num_entries);
+	opt = &uma_info->entries[val];
+
+	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
+	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
+		drm_err_once(ddev, "Option %lu not supported due to lack of Custom/Auto flag", val);
+		return -EINVAL;
+	}
+
+	flags = opt->flags;
+	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
+
+	guard(mutex)(&uma_info->update_lock);
+
+	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
+	if (r)
+		return r;
+
+	uma_info->uma_option_index = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(carveout);
+
+static struct attribute *amdgpu_uma_attrs[] = {
+	&dev_attr_carveout.attr,
+	&dev_attr_carveout_options.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_uma_attr_group = {
+	.name = "uma",
+	.attrs = amdgpu_uma_attrs
+};
+
+static void amdgpu_uma_sysfs_init(struct amdgpu_device *adev)
+{
+	int rc;
+
+	if (!(adev->flags & AMD_IS_APU))
+		return;
+
+	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
+		return;
+
+	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev->uma_info);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev),
+			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
+		goto out_info;
+	}
+
+	mutex_init(&adev->uma_info.update_lock);
+
+	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
+		goto out_attr;
+	}
+
+	return;
+
+out_attr:
+	mutex_destroy(&adev->uma_info.update_lock);
+out_info:
+	return;
+}
+
+static void amdgpu_uma_sysfs_fini(struct amdgpu_device *adev)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
+
+	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
+		return;
+
+	mutex_destroy(&uma_info->update_lock);
+	uma_info->num_entries = 0;
+}
+
 static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
 
 /**
@@ -4492,6 +4633,7 @@ static int amdgpu_device_sys_interface_init(struct amdgpu_device *adev)
 	amdgpu_fru_sysfs_init(adev);
 	amdgpu_reg_state_sysfs_init(adev);
 	amdgpu_xcp_sysfs_init(adev);
+	amdgpu_uma_sysfs_init(adev);
 
 	return r;
 }
@@ -4507,6 +4649,7 @@ static void amdgpu_device_sys_interface_fini(struct amdgpu_device *adev)
 
 	amdgpu_reg_state_sysfs_fini(adev);
 	amdgpu_xcp_sysfs_fini(adev);
+	amdgpu_uma_sysfs_fini(adev);
 }
 
 /**

-- 
2.43.0

