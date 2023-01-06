Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA71C65FFDB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 12:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD6A10E865;
	Fri,  6 Jan 2023 11:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513FB10E865
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TC2tcsPk9sMmis/tKueqApbpIw2ZvbmNWcD0JfzY8uw=; b=IHUDmxl4dXcYJBQQXqvYstibb1
 F6LoV2S2/qb5PEhWLU0hvvEEpwZmq8NQrS+Eb/sJ0g2yGCoTU/7qSPH+DrdzoNIbgqoB37gD1ETuN
 3mgTLV/dpOUYVyaQ3/ciW2zKJD2NJzJ3K7QzXT+zCPZBkXNEZ4DDGkfU54UWUzZsjQlnHEk7FDSZ0
 5+d7uVONkfr8WnniOmDAY4iflHwWK2T9fRs9Ypm7T1WFistdxqHKmaE1jSgUVz28V5z7kMQHTKLXW
 aIl+frl5yVwb9xf9gnUrZ9fDmI8q6lJZgdEyA1zzuD8aCosFCZ+Iq7PPshcYogJBxzw8QtH7GgIj/
 /8nWmksQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pDlMR-000oQY-Q6; Fri, 06 Jan 2023 12:58:12 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/vkms: reintroduce prepare_fb and cleanup_fb functions
Date: Fri,  6 Jan 2023 08:57:59 -0300
Message-Id: <20230106115759.213710-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
end}_fb_access with vmap"), the behavior of the shadow-plane helpers
changed and the vunmap is now performed at the end of
the current pageflip, instead of the end of the following pageflip.

By performing the vunmap at the end of the current pageflip, invalid
memory is accessed by the vkms during the plane composition, as the data
is being unmapped before being used, as reported by the following
warning:

 [  275.866047] BUG: unable to handle page fault for address: ffffb382814e8002
 [  275.866055] #PF: supervisor read access in kernel mode
 [  275.866058] #PF: error_code(0x0000) - not-present page
 [  275.866061] PGD 1000067 P4D 1000067 PUD 110a067 PMD 46e3067 PTE 0
 [  275.866066] Oops: 0000 [#1] PREEMPT SMP PTI
 [  275.866070] CPU: 2 PID: 49 Comm: kworker/u8:2 Not tainted 6.1.0-rc6-00018-gb357e7ac1b73-dirty #54
 [  275.866074] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37 04/01/2014
 [  275.866076] Workqueue: vkms_composer vkms_composer_worker [vkms]
 [  275.866084] RIP: 0010:XRGB8888_to_argb_u16+0x5c/0xa0 [vkms]
 [  275.866092] Code: bf 56 0a 0f af 56 70 48 8b 76 28 01 ca 49 83 f8 02
 41 b9 01 00 00 00 4d 0f 43 c8 48 01 f2 48 83 c2 02 31 f6 66 c7 04 f0 ff
 ff <0f> b6 0c b2 89 cf c1 e7 08 09 cf 66 89 7c f0 02 0f b6 4c b2 ff 89
 [  275.866095] RSP: 0018:ffffb382801b7db0 EFLAGS: 00010246
 [  275.866098] RAX: ffff896336ace000 RBX: ffff896310e293c0 RCX: 0000000000000000
 [  275.866101] RDX: ffffb382814e8002 RSI: 0000000000000000 RDI: ffffb382801b7de8
 [  275.866103] RBP: 0000000000001400 R08: 0000000000000280 R09: 0000000000000280
 [  275.866105] R10: 0000000000000010 R11: ffffffffc011d990 R12: ffff896302a1ece0
 [  275.866107] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000080008001
 [  275.866109] FS:  0000000000000000(0000) GS:ffff89637dd00000(0000) knlGS:0000000000000000
 [  275.866112] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 [  275.866114] CR2: ffffb382814e8002 CR3: 0000000003bb4000 CR4: 00000000000006e0
 [  275.866120] Call Trace:
 [  275.866123]  <TASK>
 [  275.866124]  compose_active_planes+0x1c4/0x380 [vkms]
 [  275.866132]  vkms_composer_worker+0x9f/0x130 [vkms]
 [  275.866139]  process_one_work+0x1c0/0x370
 [  275.866160]  worker_thread+0x221/0x410
 [  275.866164]  ? worker_clr_flags+0x50/0x50
 [  275.866167]  kthread+0xe1/0x100
 [  275.866172]  ? kthread_blkcg+0x30/0x30
 [  275.866176]  ret_from_fork+0x22/0x30
 [  275.866181]  </TASK>
 [  275.866182] Modules linked in: vkms
 [  275.866186] CR2: ffffb382814e8002
 [  275.866191] ---[ end trace 0000000000000000 ]---

Therefore, introduce again prepare_fb and cleanup_fb functions to the
vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
Let shadow-plane helpers prepare the plane's FB").

Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap")
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com/T/

- Add kernel oops to the commit description (Melissa Wen).
- s/introduce/reintroduce/ in the title (Melissa Wen).
- Add Thomas's Acked-by.

---
 drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index c3a845220e10..b3f8a115cc23 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
	return 0;
 }

+static int vkms_prepare_fb(struct drm_plane *plane,
+			   struct drm_plane_state *state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state;
+	struct drm_framebuffer *fb = state->fb;
+	int ret;
+
+	if (!fb)
+		return 0;
+
+	shadow_plane_state = to_drm_shadow_plane_state(state);
+
+	ret = drm_gem_plane_helper_prepare_fb(plane, state);
+	if (ret)
+		return ret;
+
+	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
+}
+
+static void vkms_cleanup_fb(struct drm_plane *plane,
+			    struct drm_plane_state *state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state;
+	struct drm_framebuffer *fb = state->fb;
+
+	if (!fb)
+		return;
+
+	shadow_plane_state = to_drm_shadow_plane_state(state);
+
+	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
+}
+
 static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
	.atomic_update		= vkms_plane_atomic_update,
	.atomic_check		= vkms_plane_atomic_check,
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.prepare_fb		= vkms_prepare_fb,
+	.cleanup_fb		= vkms_cleanup_fb,
 };

 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
--
2.39.0

