Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEdOLlEUj2mqHwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:08:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2D8135F27
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B1710E2ED;
	Fri, 13 Feb 2026 12:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TJUJT+r2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426EE10E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 12:08:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so7914725e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 04:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770984525; x=1771589325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXJX7nXY8BjcdSOfqiZmvYAlq9sn8uCtkrmoZSGXdnE=;
 b=TJUJT+r2CBK9XH/ws4utmZR+XquXSAHYPPdPb94PBkgq2N+QD2aWpYtJ5Z8Q6rQ7Ls
 3wGwC7cJ/pW69qCGt7xK0khbcZjBC4ksWXIlSnQoXGF3HuvHNK9isWgYEy3YA5j3YmCD
 eJX/Or2mvQ6GpE9Opv32KmdoSMj4E3AMWY2pmxmDSAIbFBtHss6lM9LLI3Xpy6nAtviH
 CayVYJkzF0bPiGMEnlbcCh69bpQdI5NLCVVo1hdOxSkCiXZb49XtdGTKOHs1frAqTElw
 GmAAaWPQVwhnRs27DZEGqU0g9EpNFoTgrypxMjQYLiI0ygZnppycDrdmL36JvLd2TQjx
 7NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770984525; x=1771589325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hXJX7nXY8BjcdSOfqiZmvYAlq9sn8uCtkrmoZSGXdnE=;
 b=Y3yCfOH2uWtFCnB/Mtic5mWU1eyV2oW7WEigqHDp+k2ZV++gyZbx4ikOLCwRjP8TLU
 d8f7+jU+HSdBVoayB8qhMnezvCZ5cyChuQFgqJCWL4hBRjk9uNN3FK4NYyO+ZCpsNQLT
 N0ZLarSbVaBp3cL27Hu28wWRZc7WD3fj+QhnR+QwJIpxVxAgOmxbmQN5K5jirwcN76AG
 ptQ/LPNvjRD/hLFau8vsO4xdbVlDho6/CYvbx+mtZnuFvCxRkeDul0VZXxvoUXIKIoNT
 XpqHmCsdsNp2lyGSbaGGjwNiS3TKV28uj/gwDp6OQyAlvZ+Yex3G7WjOE5j3a5cuzkYa
 rM4A==
X-Gm-Message-State: AOJu0YxxPM7jcYERRQDGJwjEX2/rpEetXE43lyFkdEK82ZLZsvAKQHH+
 CDgZ4uY8k6DtOcdm8qjRsJYvMSG0F97IGnbr91L+JO1/o7KsYf5/CZdu
X-Gm-Gg: AZuq6aK+zhQ05K/QStUtKlgXL/2V8yO0vUH2aaQ60uEaxQa1H4iNb45vWorNpesskBg
 3i3eVowDsa/UnE0jbLWfPouUQGlWlvPESOOA2mBRO0ru2fr3a2om3oEXEpNH1FmI7oae4BSXBXC
 HSH+gNgSHicBHvWU+b2nh3Z4K7OyoFA72ENnYXayOMIiax6QsmRqjLqOdcZrVc4wlcZKEYnQe3f
 j+Vjx7Pu7YIENfl4zzTP8+Y+7tcaPcq3uSKuApT9dIE1kSqIEasdQ3X0v5aF6GBY+8YeYZg6NKS
 2A215xuCtls9tdipPCfxiZkwtWSmjBHYwIJ6O1OurP7vNrOWwGhbv6Bw42P/Pb8KAYr2TtRQmzQ
 Dj9JQnqZXH5ptYaj6CGvPoQzMcoxOfJjko6Jk+85d4LVLhO4YIXpP+ywqlwM3VRfs8brGEqlwi8
 mJVa2IX7O63RWMukxubVlvnC87gXd5eovNG+telCpgh6Gb2eyxZB8TSFF4uT55H3rzhgCLqh8Bo
 oP4GAI=
X-Received: by 2002:a05:600c:4f4b:b0:477:98f7:2aec with SMTP id
 5b1f17b1804b1-48373a160b8mr29989545e9.3.1770984524690; 
 Fri, 13 Feb 2026 04:08:44 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99497asm289274955e9.6.2026.02.13.04.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 04:08:44 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v1 1/2] drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR to
 query fence error status
Date: Fri, 13 Feb 2026 12:08:34 +0000
Message-ID: <20260213120836.81283-2-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213120836.81283-1-yiconghui@gmail.com>
References: <20260213120836.81283-1-yiconghui@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4D2D8135F27
X-Rspamd-Action: no action

Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR to allow userspace to query the error
status of a fence held by a timeline/binary syncobj.

Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
 drivers/gpu/drm/drm_internal.h |  2 ++
 drivers/gpu/drm/drm_ioctl.c    |  2 ++
 drivers/gpu/drm/drm_syncobj.c  | 22 ++++++++++++++++++++++
 include/uapi/drm/drm.h         | 13 +++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index f893b1e3a596..d4d722983544 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -285,6 +285,8 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_private);
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private);
+int drm_syncobj_query_error_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file_private);
 
 /* drm_framebuffer.c */
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ff193155129e..61b114a6a65f 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -732,6 +732,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY_ERROR, drm_syncobj_query_error_ioctl,
+		      DRM_RENDER_ALLOW),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 2d4ab745fdad..2152cd029070 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1717,3 +1717,25 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+int drm_syncobj_query_error_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file_private)
+{
+	struct drm_syncobj_error *args = data;
+	struct dma_fence *fence;
+	int ret;
+
+	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
+		return -EOPNOTSUPP;
+
+	ret = drm_syncobj_find_fence(file_private, args->handle, args->point, 0, &fence);
+
+	if (ret)
+		return ret;
+
+	args->error = fence->error;
+
+	dma_fence_put(fence);
+
+	return 0;
+}
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d27..087c0f2120ec 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1051,6 +1051,11 @@ struct drm_syncobj_timeline_array {
 	__u32 flags;
 };
 
+struct drm_syncobj_error {
+	__u32 handle;
+	__s32 error;
+	__u64 point;
+};
 
 /* Query current scanout sequence number */
 struct drm_crtc_get_sequence {
@@ -1363,6 +1368,14 @@ extern "C" {
  */
 #define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
 
+/**
+ * DRM_IOCTL_SYNCOBJ_QUERY_ERROR - Query the error code from a failed drm_syncobj
+ *
+ * This ioctl provides userspace a way to query the error code of a binary and
+ * timeline drm_syncobj in the case that the submission fails.
+ */
+#define DRM_IOCTL_SYNCOBJ_QUERY_ERROR	DRM_IOWR(0xD3, struct drm_syncobj_error)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.53.0

