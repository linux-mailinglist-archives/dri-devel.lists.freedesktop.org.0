Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704EC62F7C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EAC10E305;
	Mon, 17 Nov 2025 08:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="tmOtTaSV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4UuJKWAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 478 seconds by postgrey-1.36 at gabe;
 Mon, 17 Nov 2025 08:50:42 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFF910E306;
 Mon, 17 Nov 2025 08:50:42 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1763368962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g4qn0Y0Rqw592PoX51rNKaez6SCV9aIVGkzVEoBovC4=;
 b=tmOtTaSVCbbVvIQ0hI4PV9v/+wkYZRQB3MPYY+eZrDEJFs7MDGKTGbitxKjwk9emE88bef
 US/esNzQdfll9rzljPjVjfRObXr7Y9hOx4mOVFdibqGreyF93gzPY8z+exraEU8+uF7i0m
 NqMklN4w/8JbDR3qaYtW+WIjb9Jzl5HUrvr43Ak1g1X747CNGuVhT+EYpY8SlaXqh/FLtB
 rvKVCu4p3kIsyfdhUs/CicCRsCRMcF4xqZ0Gv4LxV1wz3xUkMLmKPh7LwF4qOrvlDCEA5r
 GnIvidIlM/Va8dJZQ0UDaMcemwkVwMMg60BkdBeJ8kG0T0hoT+SNtu8B5axgww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1763368962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g4qn0Y0Rqw592PoX51rNKaez6SCV9aIVGkzVEoBovC4=;
 b=4UuJKWArM+/eV98WyjvhEQNFpcfXVUQHdGTBxpuKxo5nB0yRp0rCbgHa2gSsK9bfFMEhY/
 5EBf69eVzWqzJiCQ==
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nam Cao <namcao@linutronix.de>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] nouveau/firmware: Add missing kfree() of nvkm_falcon_fw::boot
Date: Mon, 17 Nov 2025 08:42:31 +0000
Message-ID: <20251117084231.2910561-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

nvkm_falcon_fw::boot is allocated, but no one frees it. This causes a
kmemleak warning.

Make sure this data is deallocated.

Fixes: 2541626cfb79 ("drm/nouveau/acr: use common falcon HS FW code for ACR=
 FWs")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nou=
veau/nvkm/falcon/fw.c
index cac6d64ab67d..4e8b3f1c7e25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
@@ -159,6 +159,8 @@ nvkm_falcon_fw_dtor(struct nvkm_falcon_fw *fw)
 	nvkm_memory_unref(&fw->inst);
 	nvkm_falcon_fw_dtor_sigs(fw);
 	nvkm_firmware_dtor(&fw->fw);
+	kfree(fw->boot);
+	fw->boot =3D NULL;
 }
=20
 static const struct nvkm_firmware_func
--=20
2.51.0

