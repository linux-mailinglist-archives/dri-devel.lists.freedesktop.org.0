Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A7D522484
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 21:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0989010E0AE;
	Tue, 10 May 2022 19:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87D10E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 19:08:32 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 126so87081qkm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4jRHmDRiTYtUVm3F2TV/cnHc4gTZpNzxAskWEMeHjb0=;
 b=ijenj0F+shWYlWKOKoPsXSieljDL6aNFFf7PrQL/Ej9MqigLI+I6PoyAgdCgspqEi+
 KaYJt1YKojvXmOyLRcurUzYjQNByqWE5QGLU4tFziqofD8iwTfE++UmBGqlM9vGMECpc
 kSbky1WTM4ldI7ijbwPOiqKJtJFWLDuHt7BmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4jRHmDRiTYtUVm3F2TV/cnHc4gTZpNzxAskWEMeHjb0=;
 b=AF5w1BjD0oBkpNYNEbjmc3vYbv8GXVV8GVXhR4GpVd4d1OqV1G23+dAkaItCIkO/X0
 jSAaLE9kZ0MvRm+cwY/s/V+VLaG+FLCulw4QrUnkn0ZwFVh28aQ2hLZT28seF74RE8yZ
 gKZRcezlBdu+qHC5hn4IKFFtoDJ/mzlwLUIeAFgQ6jtipynlqkV2QQ2siD7Bd3K/UjKq
 t1fwMqPOqoMhYvhGSXsa7MohigKM4qqZTIszYAfS/W7RAl3Y/zOcgjDRv9Qrv5iR2W/E
 BEOjG3O/UNjg0AAAQ/tZh3B4QHpu+cED4Bo4qkQsl8QanUlv8d5h8a/X4OHwFduZ3ZS1
 GFMA==
X-Gm-Message-State: AOAM531falcvDSafBVHMjPqo+NCVAAJATfQnvoZJjtZixuAtSadDaAeM
 N0s+SMY9hRW1Bpp38wYWUir50w==
X-Google-Smtp-Source: ABdhPJxhZMWvFMdDp5OOtpLRcQsMnI7cLWD8+vbJIItoETMs2u7GJzxM3szzCaPCWDdg9jrbJat/WA==
X-Received: by 2002:a05:620a:4083:b0:6a0:9d07:5127 with SMTP id
 f3-20020a05620a408300b006a09d075127mr7404455qko.51.1652209711777; 
 Tue, 10 May 2022 12:08:31 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:141d:f589:29f6:2a25])
 by smtp.gmail.com with ESMTPSA id
 x8-20020ac87a88000000b002f39b99f6b1sm9590931qtr.75.2022.05.10.12.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 12:08:31 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Subject: [PATCH] drm: Create support for Write-Only property blob
Date: Tue, 10 May 2022 15:08:21 -0400
Message-Id: <20220510190823.1552920-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
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
Cc: David Airlie <airlied@linux.ie>, markyacoub@chromium.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
User space might need to inject data into the kernel without allowing it
to be read again by any user space.
An example of where this is particularly useful is secret keys fetched
by user space and injected into the kernel to enable content protection.

[How]
Create a DRM_MODE_CREATE_BLOB_WRITE_ONLY flag used by user space to
create a blob and mark the blob as write only.
On reading back the blob, data will be not be copied if it's a write
only blob

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
 drivers/gpu/drm/drm_property.c | 3 ++-
 include/drm/drm_property.h     | 2 ++
 include/uapi/drm/drm_mode.h    | 6 ++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index dfec479830e4..afedf7109d00 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -765,7 +765,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
 	if (!blob)
 		return -ENOENT;
 
-	if (out_resp->length == blob->length) {
+	if (out_resp->length == blob->length && !blob->is_write_only) {
 		if (copy_to_user(u64_to_user_ptr(out_resp->data),
 				 blob->data,
 				 blob->length)) {
@@ -800,6 +800,7 @@ int drm_mode_createblob_ioctl(struct drm_device *dev,
 		ret = -EFAULT;
 		goto out_blob;
 	}
+	blob->is_write_only = out_resp->flags & DRM_MODE_CREATE_BLOB_WRITE_ONLY;
 
 	/* Dropping the lock between create_blob and our access here is safe
 	 * as only the same file_priv can remove the blob; at this point, it is
diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 65bc9710a470..700782f021b9 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -205,6 +205,7 @@ struct drm_property {
  * 	&drm_mode_config.property_blob_list.
  * @head_file: entry on the per-file blob list in &drm_file.blobs list.
  * @length: size of the blob in bytes, invariant over the lifetime of the object
+ * @is_write_only: user space can't read the blob data.
  * @data: actual data, embedded at the end of this structure
  *
  * Blobs are used to store bigger values than what fits directly into the 64
@@ -219,6 +220,7 @@ struct drm_property_blob {
 	struct list_head head_global;
 	struct list_head head_file;
 	size_t length;
+	bool is_write_only;
 	void *data;
 };
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 0a0d56a6158e..de192d3813e9 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1107,6 +1107,9 @@ struct drm_format_modifier {
 	__u64 modifier;
 };
 
+#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
+	(1 << 0) /* data of the blob can't be read by user space */
+
 /**
  * struct drm_mode_create_blob - Create New blob property
  *
@@ -1120,6 +1123,9 @@ struct drm_mode_create_blob {
 	__u32 length;
 	/** @blob_id: Return: new property ID. */
 	__u32 blob_id;
+	/** Flags for special handling. */
+	__u32 flags;
+	__u32 pad;
 };
 
 /**
-- 
2.36.0.512.ge40c2bad7a-goog

