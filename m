Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56507E7E12
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 18:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E97710E138;
	Fri, 10 Nov 2023 17:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F84810E129;
 Fri, 10 Nov 2023 17:19:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF72XYqPsfmFJ7G7lBWcrW/lB4+ivzEOix0/6K8Vo7qPg3dU4MVgpTanMy2w0IcDjlYnyxdLf+sPiJ8zeY5ieaLlT4XLlHn3mxGT361/ZsnOFNi/WexZliq01rkeognQZUOlyZua0EawGnukGOgE5Fr70JQBkqQi4F6/9sFT1MF9Og8z9D7rbg3nhSm5AE0ZEfCEx9PvPd5US5C0X3yxtPCeBp/mbOPPcQxcVhwOAdhcBFUoqjimcW5OGCZNBib6G5NbILac26IchHM1Gmrw7ql2jdliPWX0Z8hKV3YSGRgfc/z54EuV42azlRpe7+aEySnoAQmEAHyiL8aj7FuPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5weypW8vdwk+EgDFCm+WGqAPyettDVf8HvAEKL2Vx0=;
 b=CvGPQQxYUh6EEZfZ7EbvgDUqLbLcGJ9gG7hBcOP6MF3ULGRLAaFPFh4wM4gW0z5B5mYkUsdae5ZgG+DKBBTCiqDnP39N4ReSxqDSlMBqgJSp9XOtxXDdvCQpn+UXQnYvFbhGvdXKZq2Yt/UF0JxLmnfSLuJxtNWZd+drp5lRs9GbLxfHacby1pv1azQoP/m2TR1xgo1tQHs6ifBWazCi2L/yUImUknaScLgC20TICzEvFPtR+Tl2+YJIf4SZ1XscQvG3GTBBvbL7e5ZFw/FwD2wN1kWC/Wrpw8FjN3w4ey3LDRa4y1kLzrOsZXa3zZcSyBWIcuW1l/lRUBYYm0Ue+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5weypW8vdwk+EgDFCm+WGqAPyettDVf8HvAEKL2Vx0=;
 b=19/l+bRpq3cGE0hG29rth4qqi7LmD7FtDDdQjk6wT2fK5sXhkSxsnqeQBRzQpUoa5+HIgWAdwwT9+4gxn50skYpmcCxjgNcdEz+4mBwLQsnYWYa+tSkhTYepVlXf/PiA7gq7xNfYzHYkxjDmU+riwMtOWq7Ysrof0kvt4bLBdg4=
Received: from DM6PR13CA0060.namprd13.prod.outlook.com (2603:10b6:5:134::37)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 17:19:34 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:134:cafe::e8) by DM6PR13CA0060.outlook.office365.com
 (2603:10b6:5:134::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Fri, 10 Nov 2023 17:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 17:19:34 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 11:19:22 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: add a debugfs interface for the DMUB trace
 mask
Date: Fri, 10 Nov 2023 12:18:07 -0500
Message-ID: <20231110171811.11656-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 295a8b01-338f-42ec-5ecf-08dbe21135b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1IIy0KjIqIxb4xtyzQSrOewx3V4OqZlxyHtylukp+2+bY6+S2Z1KhzXDc7T0utgK7/2N78+HgJ6CZIf3rHq1CZvEOYm8UARSDMhmIIVpCt8KBwYk+xf4drap8vJaW9JJHyCrfiqDJHq1ly410+QIobRZij5AINZ89MHhyv+ItpqWaWRl4xLuMHqJsMjjcv2HZ0OPl2x0xiQALlxG31RKxaMz0SAos2tbtJ5VsJYfsthWEHLQa8KIkeDjBhX8hFci5YyjJDE8OtMMGWqYZY7Aol2DhqHO4VzlImVRRawaKRNEEPQRHJc9hZzD9+o7h966gEXRER+FbnaCM8m9W9lXupPpoGJa5tDt9VEsDitj76e6Gao2v7YliaOkVffGT2fIo1xHXQzK6Q9hjRkwfnKfVO2WTKGSl7wTtahRWBdmem2r8dAXxbbAmMRxLP2hmw103UUT2bYSzCK3XDe5b73FQKaaRcO9dI5BUahxmsryECdnBVuHPfrsnn/sxvsThYok6O4L9qrnSaoRP9ECqCQUNuuFMNis1dZ/3jq+yHz0f2zLZ1+DZWEjZm+U0FKr3Swmh9kUlQvtDJKPhdyoWRltQPoB+Iut7SIsNmUlyTpRzEvyZ0j3Xjr40XP3mIk+SxKUFBbiokJ6RmbpmzlRjVLgpsn2XHYS1Bqode+iR2mr1T1Q1NOiRj/vglUIP2p4/kT1HUW8cM/PwkTPBdcR+BUzXe9zGsHQcv7JekQnSXzVer9x1lH5AUWvauoQSoSAWFaSW8Q8KuioV3KUNFXWc18OOAdAmUJczZOxrFwT9bzUXrtgDs52fyjw5SqM3zaDdkG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(186009)(64100799003)(82310400011)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(1076003)(478600001)(44832011)(47076005)(7416002)(41300700001)(70586007)(6666004)(316002)(336012)(4326008)(8936002)(426003)(8676002)(36860700001)(16526019)(2616005)(6916009)(5660300002)(70206006)(26005)(356005)(2906002)(82740400003)(83380400001)(81166007)(86362001)(40460700003)(36756003)(40480700001)(54906003)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 17:19:34.5010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 295a8b01-338f-42ec-5ecf-08dbe21135b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216
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
Cc: linux-doc@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Reza Amini <reza.amini@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Anthony Koo <anthony.koo@amd.com>, Mustapha Ghaddar <mghaddar@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Wenjing
 Liu <wenjing.liu@amd.com>, Tony Tascioglu <tony.tascioglu@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Maxime Ripard <mripard@kernel.org>, Hersen Wu <hersenxs.wu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For features that are implemented primarily in DMUB (e.g. PSR), it is
useful to be able to trace them at a DMUB level from the kernel,
especially when debugging issues. So, introduce a debugfs interface that
is able to read and set the DMUB trace mask dynamically at runtime and
document how to use it.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 Documentation/gpu/amdgpu/display/dc-debug.rst | 41 +++++++++
 .../gpu/amdgpu/display/trace-groups-table.csv | 29 ++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 91 +++++++++++++++++++
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   | 40 +++++++-
 4 files changed, 199 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/trace-groups-table.csv

diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
index 40c55a618918..817631b1dbf3 100644
--- a/Documentation/gpu/amdgpu/display/dc-debug.rst
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -75,3 +75,44 @@ change in real-time by using something like::
 
 When reporting a bug related to DC, consider attaching this log before and
 after you reproduce the bug.
+
+DMUB Firmware Debug
+===================
+
+Sometimes, dmesg logs aren't enough. This is especially true if a feature is
+implemented primarily in DMUB firmware. In such cases, all we see in dmesg when
+an issue arises is some generic timeout error. So, to get more relevant
+information, we can trace DMUB commands by enabling the relevant bits in
+`amdgpu_dm_dmub_trace_mask`.
+
+Currently, we support the tracing of the following groups:
+
+Trace Groups
+------------
+
+.. csv-table::
+   :header-rows: 1
+   :widths: 1, 1
+   :file: ./trace-groups-table.csv
+
+**Note: Not all ASICs support all of the listed trace groups**
+
+So, to enable just PSR tracing you can use the following command::
+
+  # echo 0x8020 > /sys/kernel/debug/dri/0/amdgpu_dm_dmub_trace_mask
+
+Then, you need to enable logging trace events to the buffer, which you can do
+using the following::
+
+  # echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
+
+Lastly, after you are able to reproduce the issue you are trying to debug,
+you can disable tracing and read the trace log by using the following::
+
+  # echo 0 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
+  # cat /sys/kernel/debug/dri/0/amdgpu_dm_dmub_tracebuffer
+
+So, when reporting bugs related to features such as PSR and ABM, consider
+enabling the relevant bits in the mask before reproducing the issue and
+attach the log that you obtain from the trace buffer in any bug reports that you
+create.
diff --git a/Documentation/gpu/amdgpu/display/trace-groups-table.csv b/Documentation/gpu/amdgpu/display/trace-groups-table.csv
new file mode 100644
index 000000000000..3f6a50d1d883
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/trace-groups-table.csv
@@ -0,0 +1,29 @@
+Name, Mask Value
+INFO, 0x1
+IRQ SVC, 0x2
+VBIOS, 0x4
+REGISTER, 0x8
+PHY DBG, 0x10
+PSR, 0x20
+AUX, 0x40
+SMU, 0x80
+MALL, 0x100
+ABM, 0x200
+ALPM, 0x400
+TIMER, 0x800
+HW LOCK MGR, 0x1000
+INBOX1, 0x2000
+PHY SEQ, 0x4000
+PSR STATE, 0x8000
+ZSTATE, 0x10000
+TRANSMITTER CTL, 0x20000
+PANEL CNTL, 0x40000
+FAMS, 0x80000
+DPIA, 0x100000
+SUBVP, 0x200000
+INBOX0, 0x400000
+SDP, 0x4000000
+REPLAY, 0x8000000
+REPLAY RESIDENCY, 0x20000000
+CURSOR INFO, 0x80000000
+IPS, 0x100000000
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 13a177d34376..06a73f283e9d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -2971,6 +2971,94 @@ static int allow_edp_hotplug_detection_set(void *data, u64 val)
 	return 0;
 }
 
+static int dmub_trace_mask_set(void *data, u64 val)
+{
+	struct amdgpu_device *adev = data;
+	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
+	enum dmub_gpint_command cmd;
+	enum dmub_status status;
+	u64 mask = 0xffff;
+	u8 shift = 0;
+	u32 res;
+	int i;
+
+	if (!srv->fw_version)
+		return -EINVAL;
+
+	for (i = 0;  i < 4; i++) {
+		res = (val & mask) >> shift;
+
+		switch (i) {
+		case 0:
+			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD0;
+			break;
+		case 1:
+			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1;
+			break;
+		case 2:
+			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD2;
+			break;
+		case 3:
+			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD3;
+			break;
+		}
+
+		status = dmub_srv_send_gpint_command(srv, cmd, res, 30);
+
+		if (status != DMUB_STATUS_OK)
+			return -ETIMEDOUT;
+
+		usleep_range(100, 1000);
+
+		mask <<= 16;
+		shift += 16;
+	}
+
+	return 0;
+}
+
+static int dmub_trace_mask_show(void *data, u64 *val)
+{
+	enum dmub_gpint_command cmd = DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD0;
+	struct amdgpu_device *adev = data;
+	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
+	enum dmub_status status;
+	u8 shift = 0;
+	u64 raw = 0;
+	u64 res = 0;
+	int i = 0;
+
+	if (!srv->fw_version)
+		return -EINVAL;
+
+	while (i < 4) {
+		status = dmub_srv_send_gpint_command(srv, cmd, 0, 30);
+
+		if (status == DMUB_STATUS_OK) {
+			status = dmub_srv_get_gpint_response(srv, (u32 *) &raw);
+
+			if (status != DMUB_STATUS_OK)
+				return -ETIMEDOUT;
+		} else {
+			return -ETIMEDOUT;
+		}
+
+		usleep_range(100, 1000);
+
+		cmd++;
+		res |= (raw << shift);
+		shift += 16;
+		i++;
+	}
+
+	*val = res;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(dmub_trace_mask_fops, dmub_trace_mask_show,
+			 dmub_trace_mask_set, "0x%llx\n");
+
 /*
  * Set dmcub trace event IRQ enable or disable.
  * Usage to enable dmcub trace event IRQ: echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
@@ -3880,6 +3968,9 @@ void dtn_debugfs_init(struct amdgpu_device *adev)
 	debugfs_create_file_unsafe("amdgpu_dm_force_timing_sync", 0644, root,
 				   adev, &force_timing_sync_ops);
 
+	debugfs_create_file_unsafe("amdgpu_dm_dmub_trace_mask", 0644, root,
+				   adev, &dmub_trace_mask_fops);
+
 	debugfs_create_file_unsafe("amdgpu_dm_dmcub_trace_event_en", 0644, root,
 				   adev, &dmcub_trace_event_state_fops);
 
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index ed4379c04715..aa6e6923afed 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -818,18 +818,54 @@ enum dmub_gpint_command {
 	 * RETURN: Lower 32-bit mask.
 	 */
 	DMUB_GPINT__UPDATE_TRACE_BUFFER_MASK = 101,
+
 	/**
-	 * DESC: Updates the trace buffer lower 32-bit mask.
+	 * DESC: Updates the trace buffer mask bit0~bit15.
 	 * ARGS: The new mask
 	 * RETURN: Lower 32-bit mask.
 	 */
 	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD0 = 102,
+
 	/**
-	 * DESC: Updates the trace buffer mask bi0~bit15.
+	 * DESC: Updates the trace buffer mask bit16~bit31.
 	 * ARGS: The new mask
 	 * RETURN: Lower 32-bit mask.
 	 */
 	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1 = 103,
+
+	/**
+	 * DESC: Updates the trace buffer mask bit32~bit47.
+	 * ARGS: The new mask
+	 * RETURN: Lower 32-bit mask.
+	 */
+	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD2 = 114,
+
+	/**
+	 * DESC: Updates the trace buffer mask bit48~bit63.
+	 * ARGS: The new mask
+	 * RETURN: Lower 32-bit mask.
+	 */
+	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD3 = 115,
+
+	/**
+	 * DESC: Read the trace buffer mask bi0~bit15.
+	 */
+	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD0 = 116,
+
+	/**
+	 * DESC: Read the trace buffer mask bit16~bit31.
+	 */
+	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD1 = 117,
+
+	/**
+	 * DESC: Read the trace buffer mask bi32~bit47.
+	 */
+	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD2 = 118,
+
+	/**
+	 * DESC: Updates the trace buffer mask bit32~bit63.
+	 */
+	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD3 = 119,
 };
 
 /**
-- 
2.42.0

