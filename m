Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628A9CA645B
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 07:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3D810EA1F;
	Fri,  5 Dec 2025 06:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="duocEECA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013071.outbound.protection.outlook.com
 [40.93.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AFE10EA21;
 Fri,  5 Dec 2025 06:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9+iK08odwBed+b0IYP9sFdKPsV+ukoVzVVpFO/k/wr5H8iQEYVyWfOKTl3Afh+L8PHMRoGfshhRTEBp8H5nIzjPEym6EMOSNUCPXf6Lx8xG2bbjgiLXVH7/hQby4maXRvvGk15Snz0RoS0Gd1EgBNChSXiQ99ElA6uFIFHB8CtEDHP3Zba19GkZWY11YJB5Jn/DXxwL894q3tyBRKQ48gFp3kyIyWIEv7G1pkdNOp0tbnIw3sw0JQlRFNQYgLX5xnsVQEsp9BgHY03xuYW91SQCZOF/vYTne+47sQ75fzA4OZxtLq6+avG5Qy6f/hTl26jHw2hWzDbKMgsbL9KxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vk8F8VXZ36TbwmEpubGLvH16VwC4GIk+CsBNo9+vtsw=;
 b=XhE93OfF17ftbXuCO2HgRMU1ZgLMuUgOJQvQju+lscQYVVMcqUsYHDHKYiaboVJofMTro96ZJ4TREBN8PTwbKq/3o/kTmnyBOEOiE2mZcgQk/HNT98U9orTAHF0IsBI46VdFfmXo82cgxUzZKeL+oTFfPpLJTfX3satb9DsTyhNq/BdwfIfn765efTChDqeMB0QydyqUBWLTxsZxnn5hIeaMt7dLg1mCq0XZxDlwvTls91tCNzltj4RoiRg3P7fK8i6B9Qs77IEbw/egSHcfwIH3h+lN1M0THn2eXt1MNdeyimLtHpsS8Ykt/4c12V/UcwsB2FNmO1hWYnQ1WTJ2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk8F8VXZ36TbwmEpubGLvH16VwC4GIk+CsBNo9+vtsw=;
 b=duocEECAE2jZnph7SOA+KsmiuUiv7acSG6pEioIA43Bl4MhTneizKAhfl2kI520rLtJO5hxijs/2mhdI2a+19ZF42Qp5CDeePU8mbLbDu+TFL/mvrvbi7kvMZXSPJlj0FwrmzvNKH6y/iqsfm4L7mVNZnmLsLT/EQ0sdOqIhbmA=
Received: from DM5PR07CA0087.namprd07.prod.outlook.com (2603:10b6:4:ae::16) by
 SJ5PPFEB07C8E34.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 06:52:21 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::2) by DM5PR07CA0087.outlook.office365.com
 (2603:10b6:4:ae::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 06:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:52:21 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 00:52:17 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 5 Dec 2025 14:50:58 +0800
Subject: [PATCH v5 5/5] Documentation/amdgpu: Add UMA carveout details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-vram-carveout-tuning-for-upstream-v5-5-1e87cf3b57be@amd.com>
References: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
In-Reply-To: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=5pP+01YJvt3qBcPPJfu3J806OWCdQrg5b42lmm7gfNI=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpMoEETPiCi5Uzcj0tqrK5Y6H1cet/E5s2ScqIR
 3AFTUV/gzOJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTKBBAAKCRBfF7GWSinu
 ho9bD/4jmqhOvfPUT5FvdW7pVAtmz4sChWHquPqAvsQ2E7iRmcOyQnAHfjMoi0gamEjWi7muVDT
 p1YZ8ECih3+CsH0zxU/9WUzlPfOYK8QF+WG8rgagOgpUiE7ecnH0z7EaZ97HTTv5IWyV5a9hycM
 Df7kfWu6ikSrxvqG+e++jjYnnzluBX605xLAPMz86RhefcSH+z8Pv492my9FewfQsuhDBmtySNK
 qU1OpHWJzXFee0BPqvIcftbyeX4XgeC59tmyb95tNBH4mysaY3OAqF5Sdvg6aYoxPxt2fm05iG1
 t3pUaBsACq+FBu6spM3WPGM306Ic11a7+R2NH6XfFSDtrR9/RzFpaDJI4OTDJE71a9vBTuiMsp5
 f9HCJ1en/SEAC8EG0jCw0zE7jyKAoEjTt23cQjr5By721oNicD2RP2UuqtEbbI4PYrBcx1DwzWV
 NTNN0FElQhiRig3IetlEWjXrUFJBukOrIMkqqXQmUcdj8UVzsjgGYyYi/tOz5Qc6TMFGvVZT1qs
 GtE+4uqq8Ynuq9LYbfDVktbDJ9TzifEKShrEiGQYeMY3CsD3RHwTsZpJ6E08QxvV8hO0qxX/IWQ
 VzAgRHmH7vgoNj+l/eBdSXmcEfaf9BXtMfW51kJhomn4UtKVt5sg/Uyrk8hKav2hi52gzWpuIYR
 h/Pt/QM9rsw+inw==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|SJ5PPFEB07C8E34:EE_
X-MS-Office365-Filtering-Correlation-Id: 805b414b-dbdd-467a-a4ed-08de33cad6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2R5UTFaOXF6OENxbC9mbVpRazVmaEZVZ05LVm5IbHE4Ym5NUmJlTDJIeVh6?=
 =?utf-8?B?S1hxRi9oZ0UyOGZTeHlBUHIyQWhtNzdiaEJESU5hbnpjcVhnZ1ZIeW52WGZM?=
 =?utf-8?B?QXdWaGZBdTRDTndzL3hBYjE3SGQ5R2o0VFVmTnBqRzdqRkhiUExFZ2hMR2U3?=
 =?utf-8?B?MEFNcTVFREtaOTlGU2IzSDNtY2NSV0ErRmh0WVVXYWt0cUxsUGZoaU5rZ2tB?=
 =?utf-8?B?ZDVpRFpXczhaT2ZtV3VnREZneURXek9DWE9aNitGYlFrOFE2eDVVTjdUTHRh?=
 =?utf-8?B?U09vN3dWZXczemxZK1FMZXBPaXNRaGd3aEVvTDNIQUR3RjljaWRWVmNHd3l1?=
 =?utf-8?B?ZlJmYnhKQ0hqbVdtSW1MbGRxQnVsaGFYUEV1ZkJjRW1Qa2ovMFNaeSt4ZHpO?=
 =?utf-8?B?aUtyUjdtbGlWL2pFQ3J5TkZqVnJTb2htZFB6WE5Oa3dDTHVSd1JmeDVScy9W?=
 =?utf-8?B?TjJQYnJ4V2ZCUHZ0d1VnNmVvUlRaTDNWdTdBYzlGTGwvRnB5cWVpQS9RVXo3?=
 =?utf-8?B?QkxRWGJWODIxQzRNYUUvVjZPNmpkMytvdWhvSkwyN2J4V1JESGFvVTZpQUkr?=
 =?utf-8?B?YUVUd3VnR1N0YTA1cVJ1azhVdHFaNkxOQ2lFTnZiUURnV2RxZERQQnZJcHpU?=
 =?utf-8?B?MFJ3U25YaC9oWFJWNUw4U3ZhbzU2RVZ2TWRSbnJKZlE2V1htRkhlbVgvWm9P?=
 =?utf-8?B?d2dDQ3dtWXM2U2JIY0JjNzNzdHFqSUk4MnlCZ2UwN2srSnN0bHNRdGFzZ3o0?=
 =?utf-8?B?Vk1SSE5PSEdGVzIyREw3K0VtSkhpV29CWjJwbzJlZGNraWROL1Q3UGxJdEE1?=
 =?utf-8?B?SVhDdERWN3VLbGJCMkxIbjZON01TWC8vQm5XWXdQcjlRUHpWZ0tFU3V6Qitq?=
 =?utf-8?B?am9DVHdBZjJrVFV2SEl3WU1teFhlNitLZ3JPcUV1ZVNzYVhIbUVaamI2bDNq?=
 =?utf-8?B?K09WV2ZUL1BJMitJQjBMalBiY25XVDRheWE3REhlRmtCb29PRUlMZVEwSDN2?=
 =?utf-8?B?ZUdhOVdaa3VQMWtSb2RvODhnNHExd0xvODQvZmFrbGdHM3dVQWo0Z3h5SFNN?=
 =?utf-8?B?b2oxZXQyaGFYLzJoQ2dKN3hId2FrVUxqMGk0ZGtwcGNEK1NNU0x2RXNuYm15?=
 =?utf-8?B?cFB6TWJqaGNiVW1URWZoZURvTExSMUx6Mk9MUSsxU1VTVmV5VXE1N2oxeXM5?=
 =?utf-8?B?NjA5eE9DcDJYZ0hqOU1lc3I0VHE1TFFNbVVFUDN0Q0dhTEtubjRGQWtJUnVp?=
 =?utf-8?B?VmlvNUJhWDdFNDczZjBBaHd2bEtINC9DMnRlMHFrdWIyMzdkWWt3R05TV2g5?=
 =?utf-8?B?QkdDOEN5ekdlcmt1ZE16L05XKzlidTNya2kzSElETE52WjhCY1NZbnd5dHNS?=
 =?utf-8?B?dC9pM3U0c0pwLzRDQTVyYWVlMVhrdWQ1cGgzeU5lZG5wVDlWQm53aU1YajlQ?=
 =?utf-8?B?ZnlPd3VhMVFOY1YyNS9NOFd1YnRyblR5cFpXZmpubjdQUXpKSkMrcWZrVTM3?=
 =?utf-8?B?eVltTTVJZUtFWXppRHdsY0g4YWtoWHZlck9YVWYweDlJeGNOWDJKRjJqQS9n?=
 =?utf-8?B?VVd2ZERGeWJ6SC9yN0plcXk4TllmRlJaUW80cVFhdW9DODMwSlFaSG52M1Jq?=
 =?utf-8?B?SkJ1NEU1QVlBU1NCOVZTenRacnlpc29ZZ09abG93RmdnYnlMa0ZXK3hZTGJN?=
 =?utf-8?B?dGJFWkNrZVk5ZFJjQS9EUWx2Yk5RY29pUFRlb3FLVklGVHJjejUzQnBzNngx?=
 =?utf-8?B?U0hqdVNxSk8vbVB2Y3BRSXlUdjJKNWR3WVFHV28wU2U1SXRqM0FqMWg1alZ5?=
 =?utf-8?B?Sk41ajY5cTBLLzZlNVczbVlKbzZucHFBdlZQblhLdmVMeFpzL3RPTFprU2pm?=
 =?utf-8?B?Rm1WcUF1Tit0Z3ZjYTY4eTZnY3IzamRLTHdRMFFwQTRYRE01YlpBaHpEZWJz?=
 =?utf-8?B?OFJGK2RmKysyT1NKN295bGZXaks2NWE2UWQ4UlZaZVFSWE5zcm5ERmxmSmpp?=
 =?utf-8?B?aEt2QlZBRFpjSmsvUnFoeVQ0TTNPQWtIcUs2bjBEdE5wbytqaEJ6VENMY3Zx?=
 =?utf-8?B?OVlyRTNHZDkxemhFa3R2aDZZYWo1enhaSlEvU2h1VjRkZ1VKS29jdFZKbEph?=
 =?utf-8?Q?RnHI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:52:21.5081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 805b414b-dbdd-467a-a4ed-08de33cad6f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEB07C8E34
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

Add documentation for the uma/carveout_options and uma/carveout
attributes in sysfs

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst   | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index 25b0c857816e..e1a964c3add2 100644
--- a/Documentation/gpu/amdgpu/driver-misc.rst
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -128,3 +128,29 @@ smartshift_bias
 
 .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: smartshift_bias
+
+UMA Carveout
+============
+
+Some versions of Atom ROM expose available options for the VRAM carveout sizes,
+and allow changes to the carveout size via the ATCS function code 0xA on supported
+BIOS implementations.
+
+For those platforms, users can use the following files under uma/ to set the
+carveout size, in a way similar to what Windows users can do in the "Tuning"
+tab in AMD Adrenalin.
+
+Note that for BIOS implementations that don't support this, these files will not
+be created at all.
+
+uma/carveout_options
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: uma/carveout_options
+
+uma/carveout
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: uma/carveout
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 979298d9c213..540f0781ca36 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -7837,6 +7837,24 @@ u64 amdgpu_device_get_uid(struct amdgpu_uid *uid_info,
 	return uid_info->uid[type][inst];
 }
 
+/**
+ * DOC: uma/carveout_options
+ *
+ * This is a read-only file that lists all available UMA allocation
+ * options and their corresponding indices. Example output::
+ *
+ *     $ cat uma/carveout_options
+ *     0: Minimum (512 MB)
+ *     1:  (1 GB)
+ *     2:  (2 GB)
+ *     3:  (4 GB)
+ *     4:  (6 GB)
+ *     5:  (8 GB)
+ *     6:  (12 GB)
+ *     7: Medium (16 GB)
+ *     8:  (24 GB)
+ *     9: High (32 GB)
+ */
 static ssize_t carveout_options_show(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
@@ -7869,6 +7887,17 @@ static ssize_t carveout_options_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(carveout_options);
 
+/**
+ * DOC: uma/carveout
+ *
+ * This file is both readable and writable. When read, it shows the
+ * index of the current setting. Writing a valid index to this file
+ * allows users to change the UMA carveout size to the selected option
+ * on the next boot.
+ *
+ * The available options and their corresponding indices can be read
+ * from the uma/carveout_options file.
+ */
 static ssize_t carveout_show(struct device *dev,
 			     struct device_attribute *attr,
 			     char *buf)

-- 
2.43.0

