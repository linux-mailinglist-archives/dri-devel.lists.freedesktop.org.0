Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6FB2CC59
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F7010E64D;
	Tue, 19 Aug 2025 18:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="g+EvDrpq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154D910E64C;
 Tue, 19 Aug 2025 18:46:50 +0000 (UTC)
Received: from debian.intra.ispras.ru (unknown [10.10.165.10])
 by mail.ispras.ru (Postfix) with ESMTPSA id 36E214028386;
 Tue, 19 Aug 2025 18:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 36E214028386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1755629208;
 bh=oPSXv8RpyMOpJqM1Uz9uYy96Bhg7dBHMbsWbSICSFOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+EvDrpqIW5a+qQWMUK5cI0yebPbqDOyT3kaaw/jZMT9JiE+cRLbrdgB3Caq0QA72
 xOJg7K938QjAHlv4JxtePguVv/lwW6RDsjBO5JCFDlDMhRpW/GpBQE1YxyZG85O3UK
 WNjjQZ+HrDcouYARy/KUcYm4wrIoBnDZuhGgppFQ=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Alex Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hansg@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: [PATCH v2 2/2] drm/amd/display: fix leak of probed modes
Date: Tue, 19 Aug 2025 21:46:35 +0300
Message-ID: <20250819184636.232641-3-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819184636.232641-1-pchelkin@ispras.ru>
References: <20250819184636.232641-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

amdgpu_dm_connector_ddc_get_modes() reinitializes a connector's probed
modes list without cleaning it up. First time it is called during the
driver's initialization phase, then via drm_mode_getconnector() ioctl.
The leaks observed with Kmemleak are as following:

unreferenced object 0xffff88812f91b200 (size 128):
  comm "(udev-worker)", pid 388, jiffies 4294695475
  hex dump (first 32 bytes):
    ac dd 07 00 80 02 70 0b 90 0b e0 0b 00 00 e0 01  ......p.........
    0b 07 10 07 5c 07 00 00 0a 00 00 00 00 00 00 00  ....\...........
  backtrace (crc 89db554f):
    __kmalloc_cache_noprof+0x3a3/0x490
    drm_mode_duplicate+0x8e/0x2b0
    amdgpu_dm_create_common_mode+0x40/0x150 [amdgpu]
    amdgpu_dm_connector_add_common_modes+0x336/0x488 [amdgpu]
    amdgpu_dm_connector_get_modes+0x428/0x8a0 [amdgpu]
    amdgpu_dm_initialize_drm_device+0x1389/0x17b4 [amdgpu]
    amdgpu_dm_init.cold+0x157b/0x1a1e [amdgpu]
    dm_hw_init+0x3f/0x110 [amdgpu]
    amdgpu_device_ip_init+0xcf4/0x1180 [amdgpu]
    amdgpu_device_init.cold+0xb84/0x1863 [amdgpu]
    amdgpu_driver_load_kms+0x15/0x90 [amdgpu]
    amdgpu_pci_probe+0x391/0xce0 [amdgpu]
    local_pci_probe+0xd9/0x190
    pci_call_probe+0x183/0x540
    pci_device_probe+0x171/0x2c0
    really_probe+0x1e1/0x890

Found by Linux Verification Center (linuxtesting.org).

Fixes: acc96ae0d127 ("drm/amd/display: set panel orientation before drm_dev_register")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd0e2976e268..7ec1f9afc081 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8227,9 +8227,12 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
+	struct drm_display_mode *mode, *t;
 
 	if (drm_edid) {
 		/* empty probed_modes */
+		list_for_each_entry_safe(mode, t, &connector->probed_modes, head)
+			drm_mode_remove(connector, mode);
 		INIT_LIST_HEAD(&connector->probed_modes);
 		amdgpu_dm_connector->num_modes =
 				drm_edid_connector_add_modes(connector);
-- 
2.50.1

