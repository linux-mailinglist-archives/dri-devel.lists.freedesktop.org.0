Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2A68F886
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 21:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD40210E095;
	Wed,  8 Feb 2023 20:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBB510E009;
 Wed,  8 Feb 2023 20:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNNAD7QCripbzdoP247wYb+zvS2aebKkhgPTw/E/d2JvSwUAXPQU3Poem3W1R85cGiaI6uzN3z9B2S0GqkiP4Q+9pT6Eb9ZWgb69sv4nIiYHC7KBdlTOLCm4uTRfxFlnmHgRJ1/svX02wEgxaKq8xtdwS+KOl8VFAx3roh4SZjt2ISY7Cdqg9ZIa3alDgjJ5pfRt8ywaiFgMVz+9boxpPyCY9WWRb87QsL5zVMWUyAl01wg4QWtDsBkbHH5ubCKnNZj4gOIOP9Nb8uLEFt1l6nJH8N3LZdW3H500eQVogmZaYosKss8QvKd9mC6bvGlMFznxwTGlT0Ve5uPnTe7uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtvdjedlPMkCGqZ7pVJflhxoojAupnrLjVubVvcvJCg=;
 b=imsWXfWSW/tcwHxU8sEO43AeeCQ4ZIuquHZmeumOn7TB3Qoc31XxVEHHfw+wd6/XQWLbSpOOy9HAx/jFy2yOOOMV3EJH7Hm3ejFaXxSi/rPQPxcYTtlBG5F2cXkKjkSyyMd2bOXvinhJPwUyWLY6e1qxAWWnwa7Jdkw2lh7iOtkKt+W1mVBjf3+92ABXBzhysu3ddnww9YXm4VAVappbDhrFkANqBpZldueMwrrV2XM7W0xmBfhrJktHEkvuNWCr1Y9CaWdzgAmHkfi3ZBLbtPBaqMWmVkbNJg0hvR+wuC1OY/QXoZZ/oPZbU6JR84YmYhMpipsqw8u0+tD53ihezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtvdjedlPMkCGqZ7pVJflhxoojAupnrLjVubVvcvJCg=;
 b=jWXgt3WBi8Ki6P5xL6R9HjI5RjdEG0tq74bLlZDvbe/uQ6tF9gP9foPk6XI/KgVAC+xYKQTxPUsgxOUiHu4qX3l+VGLdEvZpKijQUd1jbDXzUjCFbuj1eQhqZYWPe5OWDHhlmfz9+O5TDZNe7iut+HyYP3GKtd1IMZhT0FCQXOs=
Received: from MN2PR19CA0045.namprd19.prod.outlook.com (2603:10b6:208:19b::22)
 by IA0PR12MB8253.namprd12.prod.outlook.com (2603:10b6:208:402::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 20:01:00 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:19b:cafe::c2) by MN2PR19CA0045.outlook.office365.com
 (2603:10b6:208:19b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 20:01:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 20:01:00 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 14:00:58 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: don't call dc_interrupt_set() for disabled
 crtcs
Date: Wed, 8 Feb 2023 15:01:47 -0500
Message-ID: <20230208200150.155684-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|IA0PR12MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc9d203-dce0-4a2a-3e0c-08db0a0f331c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iLPsA+YtaZSl+pbkYc8UHU2aeYyXTkerXaiXXW9Sb0jbHF+FRlET3ogk1z2fpLN/PEJn+zGm6ulZv4phV6MpjTgdEQAJLC1sywL9Qfeyz0p6Yubz0o3Km2PqXMl9fZz1HKoa09wu6K/gHeA/7ZNFvtudN2yKoVqbP86PAKnvzsNzZzZPFdSLQ26aqsEZbfSEAEe3qnkuXdxsZ4vuaaygyhXzYo2XQ9lLaoaQRRQpMOs7r/PU0ZR9WhfgaplJYgfcYQZKP8zT7OcL6dP8YcQNSMpiGErH7AJhz7jHhwKnvvbCELCQGX3TjHQ/nYGksNRe6ZUFCbk40OE+Xy7JAz5uTQjuCu/KiVK4+FjTkyyyly8b7ey5gg23nPEYas1sDP8Wl7fL5maL8PcMAxldFJqFyoyT5PkeFw5cjp2muTmBHa7JwZhfTiKDtOpBw+cXjsTfCWHtCW1tvN/CRgcvIlG+iw/cJTa/6j/awme9/X0oYm70WiduSAaZg9r4CXClSIE64OtCLI3qgIpv30gVuCnz+Ix5738k0LON9woaWS8xp2cMqjBZNf4OSfIyPg7yYZiM+q+zdZqsCC6Iy1rvUytDmM1YxOnRpN1oXrZAWTeRqEMYTr97bwkI+Y2iU3sv+oNkF/OjlJ48mG5BjxLYGXIlsMJjafU59IrLlTHq3ijiDPAiEYzyskCumoRR9SJs/YFoANT1MXeCJBTf059kGNvDS2Ut5ulYxs51wvEVm/OZCuYt5UIzqQ/zvihBQzt2jLFZL2MMe99xdJRHPZi97fFdrRX8L8MUrD2Z/VBK26FQqN0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(82740400003)(41300700001)(356005)(81166007)(2906002)(36860700001)(47076005)(82310400005)(6916009)(70586007)(4326008)(8676002)(70206006)(83380400001)(8936002)(426003)(316002)(26005)(5660300002)(40480700001)(186003)(54906003)(336012)(2616005)(86362001)(1076003)(44832011)(40460700003)(16526019)(478600001)(36756003)(6666004)(17423001)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 20:01:00.1020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc9d203-dce0-4a2a-3e0c-08db0a0f331c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8253
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Deepak R Varma <drv@mailo.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As made mention of in commit 4ea7fc09539b ("drm/amd/display: Do not
program interrupt status on disabled crtc"), we shouldn't program
disabled crtcs. So, filter out disabled crtcs in dm_set_vupdate_irq()
and dm_set_vblank().

Fixes: 589d2739332d ("drm/amd/display: Use crtc enable/disable_vblank hooks")
Fixes: d2574c33bb71 ("drm/amd/display: In VRR mode, do DRM core vblank handling at end of vblank. (v2)")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 1e39d0939700..dc4f37240beb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -77,6 +77,9 @@ int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	int rc;
 
+	if (acrtc->otg_inst == -1)
+		return 0;
+
 	irq_source = IRQ_TYPE_VUPDATE + acrtc->otg_inst;
 
 	rc = dc_interrupt_set(adev->dm.dc, irq_source, enable) ? 0 : -EBUSY;
@@ -151,6 +154,9 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 	struct vblank_control_work *work;
 	int rc = 0;
 
+	if (acrtc->otg_inst == -1)
+		goto skip;
+
 	if (enable) {
 		/* vblank irq on -> Only need vupdate irq in vrr mode */
 		if (amdgpu_dm_vrr_active(acrtc_state))
@@ -168,6 +174,7 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 	if (!dc_interrupt_set(adev->dm.dc, irq_source, enable))
 		return -EBUSY;
 
+skip:
 	if (amdgpu_in_reset(adev))
 		return 0;
 
-- 
2.39.1

