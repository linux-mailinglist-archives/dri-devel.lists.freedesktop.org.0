Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA693200B9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 22:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A20E6EC6A;
	Fri, 19 Feb 2021 21:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A826EC59
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 21:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DW+iB7cPyvTS+W1v3rgVH6HcGBRdmo2WikAbUw64DdY=;
 b=cfzUYFkX/XVeq1+35IH5ZDn0p7dqMFO7XrSawyZScM/aunPOatsHZM1x5PaA8zf240iUea
 Zchnn8vSgxAB+RF7kLpu3tZ2aeNvLbyg9R+1y6RFh18krvPsWw4C5GP7vDefTCa3QICYM6
 3vtcdp+PBh2DZzPHEEh8pzG6dvaLP7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-UAMbAVtgONG0oVJoALt_oQ-1; Fri, 19 Feb 2021 16:55:01 -0500
X-MC-Unique: UAMbAVtgONG0oVJoALt_oQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30AFE18A08C0;
 Fri, 19 Feb 2021 21:54:59 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6BE46A03C;
 Fri, 19 Feb 2021 21:54:57 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 18/30] drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
Date: Fri, 19 Feb 2021 16:53:14 -0500
Message-Id: <20210219215326.2227596-19-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to move drm_dp_helper.c over to drm_dbg_*(), we'll want
to make sure that we can also add ratelimited versions of these macros in
order to retain some of the previous debugging output behavior we had.

However, as I was preparing to do this I noticed that the current
rate limited macros we have are kind of bogus. It looks like when I wrote
these, I didn't notice that we'd always be calling __ratelimit() even if
the debugging message we'd be printing would normally be filtered out due
to the relevant DRM debugging category being disabled.

So, let's fix this by making sure to check drm_debug_enabled() in our
ratelimited macros before calling __ratelimit(), and start using
drm_dev_printk() in order to print debugging messages since that will save
us from doing a redundant drm_debug_enabled() check. And while we're at it,
let's move the code for this into another macro that we can reuse for
defining new ratelimited DRM debug macros more easily.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/drm/drm_print.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f32d179e139d..3a0c3fe4d292 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -524,16 +524,20 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG_DP(fmt, ...)						\
 	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
 
-
-#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
-({									\
-	static DEFINE_RATELIMIT_STATE(_rs,				\
-				      DEFAULT_RATELIMIT_INTERVAL,       \
-				      DEFAULT_RATELIMIT_BURST);         \
-	if (__ratelimit(&_rs))						\
-		drm_dev_dbg(NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__);	\
+#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)                                    \
+({                                                                                               \
+	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST); \
+	const struct drm_device *drm_ = (drm);                                                   \
+                                                                                                 \
+	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))                         \
+		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);        \
 })
 
+#define drm_dbg_kms_ratelimited(drm, fmt, ...) \
+	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
+
+#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
+
 /*
  * struct drm_device based WARNs
  *
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
