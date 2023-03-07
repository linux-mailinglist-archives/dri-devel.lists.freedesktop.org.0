Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B56AE426
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5310E584;
	Tue,  7 Mar 2023 15:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5B10E501;
 Tue,  7 Mar 2023 15:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFu/SgCB746MMYRhC9xS//6dOfI8MPXiIv4JQXiG7YQB9qHlEHEfxgZwvS8zQEtAmiHWrqd3cqynzXlxfoH0hK4wnuPQ+9U5G/2jtazeS8pwUQGfnyj98OJrln2fjAQ2dP5xNAqXXud0+yj6mA4o7yd/ANa+py/aCabEBEKCO3LPh7VYdHDnmKtF9hCCkyLWM9BnJ0VembPGj4CKuRttFfRnBFpOWu6HArhuc4ITJPY0zZemJ2zw7Pd1AmD9FhlAiQKIF+FewTxCeYv6HR4gA9Ho/nADqtWHQRb/5A5rDwu0bELsInAbIStxnoJUt7JmYZ2xi3ZThqAxxSBrofQVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPUydsJ57swfTrqdb7Iz7Vi0iJfmOTUroLX4rBCHUS4=;
 b=NgwkUBQ/SEwaBmMo1oYwotof08Iq4rOZAvun4wUOC4Czyzsbl1Wftr54HLibHQ0gMbzj++wrPXAXw6uLnmp5JncrS/ZBfuhQK+iyd3Jdz+E4nA7ICKGaUV//zXmlNkVULjwRmHED/wOEddK+yzQf1RfIUI/67v/ankIEhIjZ3mdyCZgvGd6IsGie/8TyK/N2vVdhNZpn/rUs/LIchJiqZzV0s0RoCjM8h7xnwiviOu/wm9UlRRu5ktkq9slYDdXsq8FYmiFm6BahbicKH0IonrEB4DOSGp+VcRJ45VzMRJs+6GGufjZHfmY3gQbEoNBWLiDVfqXdYCwxON327aDH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPUydsJ57swfTrqdb7Iz7Vi0iJfmOTUroLX4rBCHUS4=;
 b=OwDH6+HupvW/3U+5MNGjXKSqi/0cyUzxmM3cfps5mTRwmu4rtQVwlfBgqD1gMDkAYuvZX9AizSPPnhQUxSf5eJaCbeXP1YDScDsGsBC/QVvLnh3aa7cmAQfkE5W8Cmeue01Kh5pWzEQHpfOhehq6tYx69Cux8a7QwYOUUX4UFjM=
Received: from DM6PR17CA0030.namprd17.prod.outlook.com (2603:10b6:5:1b3::43)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 15:11:30 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::9e) by DM6PR17CA0030.outlook.office365.com
 (2603:10b6:5:1b3::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:28 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:27 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 14/17] drm/amd/display: Add debugfs for testing output
 colorspace
Date: Tue, 7 Mar 2023 10:11:04 -0500
Message-ID: <20230307151107.49649-15-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: ed336f66-7e2c-4bf0-b3f9-08db1f1e3b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yz0gWNIQDtvdnocT9YuQTKEyACMFEpu60klOloHn8eYsJWpK1Un5UEpHa9XHOkWggiTOS5mWhPxgdWPXbxloIIMa/e7rLDU2w+CYajeFhozjLaSPOVYkitJSG4qRHO64GxSb7gwLOQ3EbUr4V0lbPdl/TTy4iYMJOVuJP7FyW3wL7F6yEORmRmapJr86on4ur4O9detzl3z8xdz/hpbh49pQAlwhat5xRk8SljEuGLxkTpNHvP0olwRQSSZwySRplmHjgoUuT4KhjiaKd+HY1ZZ4mfNNNNARMV3keuZ7jTgEXq38uzrOWoGthSb+Or2q9nUuqMi9MNCN9kTX+fM26kjgcinkjnS8EOTXem4pzLqmXhWIYuEJw9pl2K95ylK7fXD1/LuELSXwOz/qG+HSnQyZb35jalDccfMzsQLHXdvz+O7LvIk253+VFRW7jifZ0PTZRnNkptbhmgc8265QgqItyjIfvwJuCnbQ1jwF5TcFXk8NSx+NZmpn2d5S1t5qtGmjUuCrBTYFRQgYfIaqu70Lk8EpACgSz/lUYFe/yB2ALpLDmg1J/oyjgVmKuNC4AD7mPEMlWnt1UBKAaiiny9Xd5wWukeWhtAPewdHa3qbXwUNkYQFdpU4+nuA3fq8+A2X4leN1xiqv3J9mlIatJmmVlRHYx9ty11xML5dAD7s8StjTftsWFBgsmsWJni6eTZEQ/Mzx4mcFUld6fk9ZKTv6tm0pemu/YcWSGMOhc6A25PUhrUjvh9CmFvqHoofox+sH2Vt2gCQGpPdrftEKuGM7rhFbEN1FerNhrmzyLpk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(8936002)(5660300002)(44832011)(70206006)(70586007)(2906002)(8676002)(4326008)(54906003)(110136005)(316002)(478600001)(36756003)(426003)(6666004)(36860700001)(1076003)(47076005)(26005)(41300700001)(83380400001)(82310400005)(2616005)(81166007)(40480700001)(82740400003)(356005)(86362001)(40460700003)(186003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:30.6835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed336f66-7e2c-4bf0-b3f9-08db1f1e3b4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to IGT test colorspace we'll want to print
the currently enabled colorspace on a stream. We add
a new debugfs to do so, using the same scheme as
current bpc reporting.

This might also come in handy when debugging display
issues.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 4a5dae578d97..f0022c16b708 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -906,6 +906,61 @@ static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
 
+/*
+ * Returns the current bpc for the crtc.
+ * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_colorspace
+ */
+static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
+{
+	struct drm_crtc *crtc = m->private;
+	struct drm_device *dev = crtc->dev;
+	struct dm_crtc_state *dm_crtc_state = NULL;
+	int res = -ENODEV;
+
+	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock(&crtc->mutex, NULL);
+	if (crtc->state == NULL)
+		goto unlock;
+
+	dm_crtc_state = to_dm_crtc_state(crtc->state);
+	if (dm_crtc_state->stream == NULL)
+		goto unlock;
+
+	switch (dm_crtc_state->stream->output_color_space) {
+	case COLOR_SPACE_SRGB:
+		seq_printf(m, "RGB");
+		break;
+	case COLOR_SPACE_YCBCR601:
+	case COLOR_SPACE_YCBCR601_LIMITED:
+		seq_printf(m, "BT601_YCC");
+		break;
+	case COLOR_SPACE_YCBCR709:
+	case COLOR_SPACE_YCBCR709_LIMITED:
+		seq_printf(m, "BT709_YCC");
+		break;
+	case COLOR_SPACE_ADOBERGB:
+		seq_printf(m, "opRGB");
+		break;
+	case COLOR_SPACE_2020_RGB_FULLRANGE:
+		seq_printf(m, "BT2020_RGB");
+		break;
+	case COLOR_SPACE_2020_YCBCR:
+		seq_printf(m, "BT2020_YCC");
+		break;
+	default:
+		goto unlock;
+	}
+	res = 0;
+
+unlock:
+	drm_modeset_unlock(&crtc->mutex);
+	mutex_unlock(&dev->mode_config.mutex);
+
+	return res;
+}
+DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
+
+
 /*
  * Example usage:
  * Disable dsc passthrough, i.e.,: have dsc decoding at converver, not external RX
@@ -3235,6 +3290,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 #endif
 	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
 			    crtc, &amdgpu_current_bpc_fops);
+	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_colorspace_fops);
 }
 
 /*
-- 
2.39.2

