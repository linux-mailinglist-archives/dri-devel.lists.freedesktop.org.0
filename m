Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LLDNhGzomlc5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918B21C1A20
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD4B10E25C;
	Sat, 28 Feb 2026 09:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="OVqSr9gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E36A10EAF5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1772188539; x=1772447739;
 bh=P7jRVG2awdtnvkNGRL41RAX3AeTjovXVV6WiqUibkXM=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=OVqSr9giXOZRihXEvaHWLKLVUo7MrFxZvQwupf+D8/vgEjx32PDF3HaIH4tulTVwd
 jhbPsShyp2xT3Pc/ULjAg2L9D6/wr76klRF1QuKr44BT2ZC6Qwfz6mVPGabysF7w3a
 xlau8Tt58NLYKvlA2VTZVcynDMNdOG+ueFQBNZEBBYignvDAmp7S6/aof4kauoh2uE
 ymnNJ7sTO56eSbdchAH7Afi69BLSVaq1eu9/plifZMiP0r1Mx8bmUSTjCZE1DOgeMS
 JaFo3LM5KeAIepLozX2EoQEPouFwuiuKsd9fpXb3bmiotsiBsfuzl5rDFU3wbNgvpk
 fpCB7hYTRIukQ==
Date: Fri, 27 Feb 2026 10:35:32 +0000
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Hardik Phalet <hardik.phalet@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH] drm/virtio: Open-code drm_simple_encoder_init()
Message-ID: <20260227103515.413685-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 5e66828b35d0172477757075c415afd9d65f4af3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:18:41 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hardik.phalet@pm.me,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:hardik.phalet@gmail.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:hardik.phalet@pm.me,m:hardikphalet@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pm.me:mid,pm.me:dkim,pm.me:email]
X-Rspamd-Queue-Id: 918B21C1A20
X-Rspamd-Action: no action

drm_simple_encoder_init() is a thin wrapper around drm_encoder_init()
that only provides a minimal drm_encoder_funcs instance with
.destroy =3D drm_encoder_cleanup.

Inline the helper in virtgpu_display.c and provide a local
drm_encoder_funcs instance instead. This removes the unnecessary
indirection and prepares for the eventual removal of
drm_simple_encoder_init().

No functional changes intended.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/vir=
tio/virtgpu_display.c
index f1dae9569805..8bd6cdc6c16e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -232,6 +232,10 @@ static enum drm_mode_status virtio_gpu_conn_mode_valid=
(struct drm_connector *con
 =09return MODE_BAD;
 }
=20
+static const struct drm_encoder_funcs virtio_gpu_enc_cleanup_funcs =3D {
+=09.destroy =3D drm_encoder_cleanup
+};
+
 static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs =
=3D {
 =09.mode_set   =3D virtio_gpu_enc_mode_set,
 =09.enable     =3D virtio_gpu_enc_enable,
@@ -306,7 +310,8 @@ static int vgdev_output_init(struct virtio_gpu_device *=
vgdev, int index)
 =09if (vgdev->has_edid)
 =09=09drm_connector_attach_edid_property(connector);
=20
-=09drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+=09drm_encoder_init(dev, encoder, &virtio_gpu_enc_cleanup_funcs,
+=09=09=09 DRM_MODE_ENCODER_VIRTUAL, NULL);
 =09drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 =09encoder->possible_crtcs =3D 1 << index;
=20
--=20
2.53.0


