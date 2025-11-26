Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E612AC8A6AC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03C010E023;
	Wed, 26 Nov 2025 14:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="n+VMTnoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8854889E59
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1764168394; x=1795704394;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=RVR6LRriLPbGt1YuY67ohVq9MWiEIlBNzWu03zY6Yo4=;
 b=n+VMTnoM3KmUn2+Bexlm1wbCl0nEjvBx3ojJHzMSbkfTBnUxl/14zoCg
 ZHaPmmh8F+O3BxCH90OW6ganGWb+m1eYZq9JFhnNRctA+oNs3O+KREYdM
 J0RWg1yva9DAPEMFnnScm4IG9kbxhHkWuVEo/j3kkBH/QKCjDDj+Nk1iw
 Kf7BI0mRlfXp9z5T+NkZKIWPOsMFF7i1XfFh61aSKx0ETHR3LXQIOxAyw
 POC8QUsCKxajvcfHapCDFm9jcY5pIAVLVbbSoLKdW9ex/vtIHr1XgnSWj
 uw3e3CxV4lVxq60LN4EdkFa0WfRpC9Vb/46XrBKZSj9VKve7gr/9/DQFe A==;
X-CSE-ConnectionGUID: c5+hjRtrT5qEk7u/7wZ6JQ==
X-CSE-MsgGUID: gQ8sq8otQ0SScsGLs16vrw==
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="56295467"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:46:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 07:46:08 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 26 Nov 2025 07:46:06 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 0/3] revert the 8-byte pitch-alignment constraint for
 memory managers
Date: Wed, 26 Nov 2025 15:44:43 +0100
Message-ID: <20251126-lcd_pitch_alignment-v1-0-991610a1e369@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFsSJ2kC/zXOXQqDMBBG0a1InhtJAmqUUrqPIhLjqAMm2iQWq
 bj3+kMf7wdzmJV4cAieFNFKHHzQ42j34LeI6F7ZDig2exPBRMK5SOmgm2rCoPtKDdhZAzZQqRO
 dM9HWXKVkv5wctLic6qu82sF73vFwjcSA9+rEi+h+2EwKziTPuYyzPJMp5TR80RhwRln79LOHu
 IHHodfKA9WjMRiKyMIS6P85Um7bD+SvPXTSAAAA
X-Change-ID: 20251126-lcd_pitch_alignment-8c5c902fb1a6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Ludovic Desroches" <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2704;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=RVR6LRriLPbGt1YuY67ohVq9MWiEIlBNzWu03zY6Yo4=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpJxKv3WWzSZCAd8vgP7rQxvaQrnSo283nbgFXx
 GXHupDYitmJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaScSrwAKCRA+OeYT93tk
 LQcED/4qXrM6BtdA1jBl18kYNFulSHAYjMKqmqsJ1eehrPHPSf1DdcAD0heXEQsAV9WL37b1ZTy
 6u+Ii/1VEeKA4DdnOOg4cMkdjEFGPyTK35dQZLHYiuxMTkfi18/wr9yXcml9+dP1pe+1Eet1xDG
 xpfrjbmnnOxVbas+Mlr2yH1Jw95xzBr6fi0s6CdIfS0PD24bpxVRH7VOlXUBw6xtyAmX8vtmtuo
 WZoAkPFkH9T2Scq8JSKfUgASBmdK59TML+6BjFdVYkUsvJI1qxdk4V5BkY2HqzhPqcbLRxu7lzH
 K0RcmKaX94xFVUXflIN4FUrrK/4m3pK17I4YGFodVlTuEt/tlkkHjBc0sRyJ8HT3xzWUTKvPD6c
 0w6fBOm99xf/j1XgllhphYmZNC33WGT2z4zm25IUo6MRkmeZq70wIicIT/lolJbhducwDsK0iAy
 jd08wX+K8tHOsCEQnC8XJY8sTNRy7VjspwJ7focvyvDcOOL3hbAY86Kb23VW+xiatxiTI+CmXIW
 JI9tMjwsAosAyKj9t/2oyC7QFVYymUWrEaXHYKxmux2714S6kJc29xc4pYwm5oHFVdQYtTiG/Lz
 r8j8dIVCcg9obcpjVNFaYw87L6WvvI2wk0Wcc2AiTDxJxZjxnc0Q1UL1Nr4bNoY8z+IOva2xVig
 ofzbCSmaRefbV5A==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

The change in the pitch-alignment requirement may disrupt applications
that do not retrieve the pitch calculated by the kernel. Although these
applications are at fault, this can still introduce some regressions.

Moreover, if this new constraint isn’t actually necessary, the size of
the dumb buffers is increased for no good reason.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
Ludovic Desroches (3):
      drm/gem-dma: revert the 8-byte alignment constraint
      drm/gem-shmem: revert the 8-byte alignment constraint
      drm/gem-vram: revert the 8-byte alignment constraint

 drivers/gpu/drm/drm_gem_dma_helper.c   | 2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 14509f7d56d42d8847353fe483f84091be5199a9
change-id: 20251126-lcd_pitch_alignment-8c5c902fb1a6
prerequisite-message-id: <20250821081918.79786-1-tzimmermann@suse.de>
prerequisite-patch-id: b1c78eb783d0b3fb3cf63e4402782071d20449e7
prerequisite-patch-id: 321d1d3a7d30d0bc724ab408d9417d1a1885644c
prerequisite-patch-id: 4f9d2dc7675f1c08ef2a9f9bd27ff47892d8f1e8
prerequisite-patch-id: 2d9f278d56119da1825aab22bb8a6ec3c2a45696
prerequisite-patch-id: ff0c065b1774bba9e2b375ac16adbab1d44779ab
prerequisite-patch-id: b70a266e6876dd07ddc16fc982ddda98111bb5e8
prerequisite-patch-id: 59a80afc752822e352b662bf419b5c7862e9f07c
prerequisite-patch-id: 4822b326bab93d9b47fdca7660bddb68646f26ce
prerequisite-patch-id: 7ae8292f96e64edcb6f6684e2c8d3c0ee7ec94c8
prerequisite-patch-id: b06d15a09811f984a1e46b2fed09e7705f09c7df
prerequisite-patch-id: 76c1fdbdf4636bf2c2b67005a8ccba3670d613c0
prerequisite-patch-id: ebc25bdc0df5a714a63dcc311d4c283918f4aa4a
prerequisite-patch-id: f7c8dad90e8b9fa1b04801dd41d62269aafe9a5f
prerequisite-patch-id: 3ac15fa5280d34198b06add3628076b6002ae040
prerequisite-patch-id: bb6b891dd660f8efcd4f320d9832ea9b73e0582d
prerequisite-patch-id: 211a1b184494478a05cfa86401492e85a08fbe1e
prerequisite-patch-id: 7ee1ae23fc07a2fc093d882e186b98d479821d07
prerequisite-patch-id: 000809cb517d09fe5d29bc8091e9d9850e5d2257
prerequisite-patch-id: ac1b96c9e8d3153de9f8c3481b5a29490c294caa
prerequisite-patch-id: 5b1f19fe0a0a301d8256ff0aad1631edb7d33285
prerequisite-patch-id: adbddb54dcce63f7bda8bd924ae24233b6f1ece9
prerequisite-patch-id: dfe677d1204e4db7efe2eefcdf7bcf9dd02d2edb
prerequisite-patch-id: 8a71a1cba53b804bbf22bb3e91e19cda5d1643f4
prerequisite-patch-id: 0d7463bcc06ff83a921b6123aa7e0492ba6db16a
prerequisite-patch-id: 15518f62ee3502aa8baed5f7ba5a752e35e07c26

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>

