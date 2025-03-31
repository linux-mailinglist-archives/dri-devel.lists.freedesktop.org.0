Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB24A770DC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D87C10E20F;
	Mon, 31 Mar 2025 22:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CDF9wBC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583010E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743459976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oL4VgFunpcFWrKBnGaiqT7XEJDD7E7ONd4E7vrw+V2I=;
 b=CDF9wBC8GrRtjUP35VQxkhK/WyG3tVUZAMy3cq/1IyJ52fztjgbWlA008V0S7hD9agf6N/
 sYbUcr9TrPGsjhZfXGwZHQjyTphPS2DQoARfemLo/T81fEYylUvSRV4SwAyWN/mGi8FO+4
 dlHbciw4VdXtr6lmW7HCPNMlJXJn1Gs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-IeKpkbiKPMyI3CUGjl4DMA-1; Mon,
 31 Mar 2025 18:26:11 -0400
X-MC-Unique: IeKpkbiKPMyI3CUGjl4DMA-1
X-Mimecast-MFC-AGG-ID: IeKpkbiKPMyI3CUGjl4DMA_1743459969
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2DAD2180AF50; Mon, 31 Mar 2025 22:26:08 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.91])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 102491955D81; Mon, 31 Mar 2025 22:26:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH v2 1/2] drm/edid: Use unsigned int in drm_add_modes_noedid()
Date: Mon, 31 Mar 2025 18:23:54 -0400
Message-ID: <20250331222556.454334-2-lyude@redhat.com>
In-Reply-To: <20250331222556.454334-1-lyude@redhat.com>
References: <20250331222556.454334-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

A negative resolution doesn't really make any sense, so let's make these
parameters unsigned. In C this doesn't make much of a difference, but Rust
is stricter about signed/unsigned casts and additionally can check for
arithmetic over/underflows if CONFIG_RUST_OVERFLOW_CHECKS is enabled.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

---

V2:
* Remove h/vdisplay < 0 checks in drm_add_modes_noedid()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_edid.c | 10 ++--------
 include/drm/drm_edid.h     |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17d..1e69326283dce 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -7099,18 +7099,12 @@ EXPORT_SYMBOL(drm_add_edid_modes);
  * Return: The number of modes added or 0 if we couldn't find any.
  */
 int drm_add_modes_noedid(struct drm_connector *connector,
-			int hdisplay, int vdisplay)
+			 unsigned int hdisplay, unsigned int vdisplay)
 {
-	int i, count, num_modes = 0;
+	int i, count = ARRAY_SIZE(drm_dmt_modes), num_modes = 0;
 	struct drm_display_mode *mode;
 	struct drm_device *dev = connector->dev;
 
-	count = ARRAY_SIZE(drm_dmt_modes);
-	if (hdisplay < 0)
-		hdisplay = 0;
-	if (vdisplay < 0)
-		vdisplay = 0;
-
 	for (i = 0; i < count; i++) {
 		const struct drm_display_mode *ptr = &drm_dmt_modes[i];
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index eaac5e665892a..b38409670868d 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -437,7 +437,7 @@ bool drm_detect_monitor_audio(const struct edid *edid);
 enum hdmi_quantization_range
 drm_default_rgb_quant_range(const struct drm_display_mode *mode);
 int drm_add_modes_noedid(struct drm_connector *connector,
-			 int hdisplay, int vdisplay);
+			 unsigned int hdisplay, unsigned int vdisplay);
 
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_is_valid(struct edid *edid);
-- 
2.48.1

