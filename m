Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3AA70C05
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 22:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758D10E5FD;
	Tue, 25 Mar 2025 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Vmvmuy23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158A210E2A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742938128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4xLb8V8T6CZWLRFn4kKzM+FxRUrfETXJPEGmVxhSAE=;
 b=Vmvmuy23sGyKTUBSsh0sJ21mpEuVHwMfoNo7KJZHES60oqsRkPWmVLhVUinm8rVNjhNq4m
 vLidhU243aZg0EVB94AtHActEVl/GHwn4XNUWCWBL8mRu/wa/c+YBBcuJ3n8bjrcs5fTGk
 qKPzQAKbEZRSkSALdu1BsNP/8AURveo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-mekVL5PmOnOPqw1sBArMJQ-1; Tue,
 25 Mar 2025 17:28:42 -0400
X-MC-Unique: mekVL5PmOnOPqw1sBArMJQ-1
X-Mimecast-MFC-AGG-ID: mekVL5PmOnOPqw1sBArMJQ_1742938120
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F1BFA1801A00; Tue, 25 Mar 2025 21:28:39 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.20])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 878B219541A6; Tue, 25 Mar 2025 21:28:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH 1/2] drm/edid: Use unsigned int in drm_add_modes_noedid()
Date: Tue, 25 Mar 2025 17:27:04 -0400
Message-ID: <20250325212823.669459-2-lyude@redhat.com>
In-Reply-To: <20250325212823.669459-1-lyude@redhat.com>
References: <20250325212823.669459-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

A negative resolution doesn't really make any sense, no one goes into a TV
store and says "Hello sir, I would like a negative 4K TV please", that
would make everyone look at you funny.

So, let's make these parameters a bit more reasonable and ensure that
they're unsigned - which makes the resulting rust bindings for this
function a bit easier to understand and work with.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 include/drm/drm_edid.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17d..2e2e1d2347397 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -7099,7 +7099,7 @@ EXPORT_SYMBOL(drm_add_edid_modes);
  * Return: The number of modes added or 0 if we couldn't find any.
  */
 int drm_add_modes_noedid(struct drm_connector *connector,
-			int hdisplay, int vdisplay)
+			 unsigned int hdisplay, unsigned int vdisplay)
 {
 	int i, count, num_modes = 0;
 	struct drm_display_mode *mode;
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

