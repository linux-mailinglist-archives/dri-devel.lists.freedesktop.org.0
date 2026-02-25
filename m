Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKKiMR/vnmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F21978C1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0F110E08B;
	Wed, 25 Feb 2026 12:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iqIeg/u0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91E410E08B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:46:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so64162025e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 04:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772023575; x=1772628375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+KQvjhscMe6Lv4Y64pMFon0ThUQ6wiTUNs+4/NtON0=;
 b=iqIeg/u0hs7H6lEw+i7oM7Fp2nZUbmEyiQzI8wJeXD/mFgpiGPwYfbS5UTV/n7RpEP
 FBVfw04EfvWzUVXJNdUX/HXInOo1ktIpvgfgS8MHyyh3V3fCxZX1mWHCqrVHsuTjsWNh
 /UzcThO3AsV6AjDK9wTOJTfObZdLG0HaRXaZDSNPAluLhBXCH7scUo4DTBcEb5yfelcN
 xNliMWhEbhJO/knr6CsSTnQynR9AY9ZN2QVjzGSnQN3XalWuWI4Ar8Q2jwaJL6mIBSfT
 mMFKabzP6ALRUh/lBRMSbmAxO6SPmGXXhIVCgDNDWoa7EuJEwAjbZMAAHwaumNNlK0lZ
 p2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772023575; x=1772628375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d+KQvjhscMe6Lv4Y64pMFon0ThUQ6wiTUNs+4/NtON0=;
 b=Ex7yuozZ+n+QIuMkTUc1WhOSwlHrU/hzX1E7/QnPh0TrGInvtL51bc/yFSMXb3YaPh
 Xak2MRu27h2Vkoy3xvX1+eT7lRdGdHL6d3hC7btUsxik2QVUZ2+gQdK83OQwzu+E7qRx
 h0UlrG/D/UyYjoq4yH3Zkx990OIlOwXOvqmowadRVJ006IQXXrTrx64DuiEBoISpX1Xv
 f4laLVzH0o5BnDYZNfwNDR4zrECl2ik+uKXndLI7LsXCy3bZj1RlzuFolhZJkUG6UbIJ
 GpnBco1vl4Ae3bSS5fMmtBrPmADFFVVl1NeLGe4Ss5bREIldMZV/2PBbGQoAL/d2on4w
 AIjA==
X-Gm-Message-State: AOJu0YwWuvRagAqJkN+Xh63QG2HO3NuMTjv1/Ry5LSl2CZKsuV0Kgoo9
 YdCe1ws0y/J4vbTIv1YDrYQYWuX3Nmo3Tc86qXpbiJJ7IaSaqVgNeGTbCCZfIId0
X-Gm-Gg: ATEYQzygzCHz9Fs0mOTfLFkAdJoOyWmP+/JIpMp35/te4EmLAyF8B/JQypAB0UxEGzo
 QDSwHBtqwLgjG8mnhmrTSRkYnAwZV5Vcqt7O0SQbTbFKhA6yhL75tTkQjRcFJk7EpwSUN+WWBRY
 RnCquNzjemCE3RULM/WHEqZ0Eek5yvQbMgyaUJ5KAdBJEhCPZjPjmbUf2i/BbLbhp+enlxMrRTN
 TqnHxvVC+z0J6HqKX1sB7zrTpFQpv4xpeHbCkUCtnQW5K4Qm0WGvu62o/YstcNNPSNlqi6BRb3j
 tG6thl1FCPP70WoY2IgpAv/a6U733tPD9Dl1kagJKGgMsXxDeLJPnFZMUC5eX4SvsSggkk+dt/R
 ce9R8dwaUW/JJKWcYqfk9WCnK6V2xFS9DEMuQHHWfVnKZPa3CFOzaO6kc8twmkbUdZImkUsBD8e
 GGUicMD4Njr/pJnZS0IcKVmHgNs8S0a5EWjfykO5YHYZXGKso1Zp07Z+B3qWiGZw7QqvoG
X-Received: by 2002:a05:600d:8450:20b0:483:b505:9db4 with SMTP id
 5b1f17b1804b1-483b5059e2dmr123888355e9.31.1772023575009; 
 Wed, 25 Feb 2026 04:46:15 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcb9b97sm18419995e9.7.2026.02.25.04.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 04:46:14 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v3 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
Date: Wed, 25 Feb 2026 12:46:07 +0000
Message-ID: <20260225124609.968505-2-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225124609.968505-1-yiconghui@gmail.com>
References: <20260225124609.968505-1-yiconghui@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 335F21978C1
X-Rspamd-Action: no action

Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to make the
DRM_IOCTL_SYNCOBJ_QUERY ioctl fill out the handles array with the
error code of the first fence found per syncobj and 0 if one is not
found and maintain the normal return value in points.

Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
Changes in v3:
* Fixed inline comments by converting to multi-line comments in
accordance to kernel style guidelines.
* No longer using a separate superfluous function to walk the fence
chain, and instead queries the last signaled fence in in the chain for
its error code
* Fixed types for error and handles array.


 drivers/gpu/drm/drm_syncobj.c | 22 ++++++++++++++++++++--
 include/uapi/drm/drm.h        |  5 +++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 2d4ab745fdad..b74e491f9d8b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
+	unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
+				   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
+	uint32_t __user *handles = u64_to_user_ptr(args->handles);
 	uint32_t i;
-	int ret;
+	int ret, error;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
 		return -EOPNOTSUPP;
 
-	if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
+	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
 	if (args->count_handles == 0)
@@ -1681,6 +1684,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 
 		fence = drm_syncobj_fence_get(syncobjs[i]);
 		chain = to_dma_fence_chain(fence);
+
 		if (chain) {
 			struct dma_fence *iter, *last_signaled =
 				dma_fence_get(fence);
@@ -1688,6 +1692,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			if (args->flags &
 			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
 				point = fence->seqno;
+				error = dma_fence_get_status(fence);
+
 			} else {
 				dma_fence_chain_for_each(iter, fence) {
 					if (iter->context != fence->context) {
@@ -1702,16 +1708,28 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 				point = dma_fence_is_signaled(last_signaled) ?
 					last_signaled->seqno :
 					to_dma_fence_chain(last_signaled)->prev_seqno;
+
+				error = dma_fence_get_status(last_signaled);
 			}
 			dma_fence_put(last_signaled);
 		} else {
 			point = 0;
+			error = fence ? dma_fence_get_status(fence) : 0;
 		}
 		dma_fence_put(fence);
+
 		ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
 		ret = ret ? -EFAULT : 0;
 		if (ret)
 			break;
+
+		if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {
+			ret = copy_to_user(&handles[i], &error, sizeof(*handles));
+
+			ret = ret ? -EFAULT : 0;
+			if (ret)
+				break;
+		}
 	}
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d27..213b4dc9b612 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1044,6 +1044,11 @@ struct drm_syncobj_array {
 };
 
 #define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0) /* last available point on timeline syncobj */
+/*
+ * Copy the status of the fence as output into the handles array.
+ * The handles array is overwritten by that.
+ */
+#define DRM_SYNCOBJ_QUERY_FLAGS_ERROR (1 << 1)
 struct drm_syncobj_timeline_array {
 	__u64 handles;
 	__u64 points;
-- 
2.53.0

