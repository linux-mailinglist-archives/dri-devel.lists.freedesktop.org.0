Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3965511218
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9B810E0B5;
	Wed, 27 Apr 2022 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3749A10E1C8;
 Tue, 26 Apr 2022 23:58:32 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C6C17320010B;
 Tue, 26 Apr 2022 19:58:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 26 Apr 2022 19:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651017507; x=1651103907; bh=BtMmL7n/JRGJ14Fmmq/dwVsCTg2ZxcEpq+r
 qW3S1p3A=; b=l/pSzQk4/Td483IRhu1k7tJ1TVQ232yVN5Dup90RCvvWdiwl7qS
 tEV+CYktZmkdtNEgHzPYugpqqNegKQg5iwBqPA9yrqJgpXEbuU+dOOkxFVeZGec+
 t6AgtgVI0Z7Yj3C5bqVsTiIseTcGa+VHYrLflHO71MP45hqmhbiQMHVzf6K4Ouc2
 +XqDsFaZCxYJD5N6qIMSDlhDYzaqSeU3FONhon+UcrfH2Gy4bfXuCHRj6aGwDH70
 uTWOhqN9WVM8XKKPCAvth+KP3Mo8gl5/uXsCvikSF1/yrErqTYstKWjj6O1PL4XT
 3W5MytOZQQuvTKl6G+7eFPss6D4wq5NwEeg==
X-ME-Sender: <xms:IodoYuFw54edr7sfwoPBUMp_SSCTkN9LpUN0xKzgmvbahtbrXOxDhg>
 <xme:IodoYvVRV0IpGIAGX5uoe4gqFoMkglqDzj0sOMl-YUyRVqAHn6BKHdEEtNvaLtFYv
 xAIzBhprYRcZw>
X-ME-Received: <xmr:IodoYoJbDK65vnlGW8r5Y0eZsdBYAQF59YkN6jn3pVFmlRf0CdcidZLN4NGndrysQsdv-27d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkedvjefg
 hefhteelkeeiveeihfektdegueehhfehvedvffehtedthfdtgfeufeelnecuffhomhgrih
 hnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
 hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:IodoYoEuNZIZmlaEHxSQrBCIiBHGsLAU6m6q9usPLfcU-hI4ddR0pg>
 <xmx:IodoYkV3nAE6sRw6vEV4043rVz_Yye_-9GQlvJRHWdZrvfHvh8-I5w>
 <xmx:IodoYrNiSY3O0pwr97lRuhLb3H9-urESbKAEQFY8BbtTVr4qUQBxpA>
 <xmx:I4doYglaXAIgwcBt1yKP2oeeaon2j4egYHnTCG4xeyNwFd_6L2U7gQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 19:58:24 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: do not use passthrough mode in Xen dom0
Date: Wed, 27 Apr 2022 01:57:15 +0200
Message-Id: <20220426235718.1634359-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Apr 2022 07:12:23 +0000
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
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 Bokun Zhang <bokun.zhang@amd.com>, Jingwen Chen <Jingwen.Chen2@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, stable@vger.kernel.org,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Bernard Zhao <bernard@vivo.com>, Alex Deucher <alexander.deucher@amd.com>,
 Candice Li <candice.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While technically Xen dom0 is a virtual machine too, it does have
access to most of the hardware so it doesn't need to be considered a
"passthrough". Commit b818a5d37454 ("drm/amdgpu/gmc: use PCI BARs for
APUs in passthrough") changed how FB is accessed based on passthrough
mode. This breaks amdgpu in Xen dom0 with message like this:

    [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting for DMUB idle: status=3

While the reason for this failure is unclear, the passthrough mode is
not really necessary in Xen dom0 anyway. So, to unbreak booting affected
kernels, disable passthrough mode in this case.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1985
Fixes: b818a5d37454 ("drm/amdgpu/gmc: use PCI BARs for APUs in passthrough")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index a025f080aa6a..5e3756643da3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 
 #include <drm/drm_drv.h>
+#include <xen/xen.h>
 
 #include "amdgpu.h"
 #include "amdgpu_ras.h"
@@ -710,7 +711,8 @@ void amdgpu_detect_virtualization(struct amdgpu_device *adev)
 		adev->virt.caps |= AMDGPU_SRIOV_CAPS_ENABLE_IOV;
 
 	if (!reg) {
-		if (is_virtual_machine())	/* passthrough mode exclus sriov mod */
+		/* passthrough mode exclus sriov mod */
+		if (is_virtual_machine() && !xen_initial_domain())
 			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
 	}
 
-- 
2.35.1

