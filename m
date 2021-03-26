Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE5A34B060
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 21:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857516F4A1;
	Fri, 26 Mar 2021 20:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F76F499
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 20:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wxiAhLE6+mGSfph2Jw1p5mKe4Z7xPGN/REbaqef4NI=;
 b=GDf9bGL4UW6apWDsgTnEHpmy/4zbfVADxA8oPLjgbWvL5+pCoH/hQwAkX+RkgSa4K52Jda
 pqc5LpWkb9xwk3KUEd3MoDoxXfHDH/zgOdPqpRjXoEeH8ZnQBX+049kDezagfBMefz/piD
 doX5QviF7DAleuk0TgL9OKKEnD+1vfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-AVxqTZ6fPvm5f8MLFanzFg-1; Fri, 26 Mar 2021 16:39:10 -0400
X-MC-Unique: AVxqTZ6fPvm5f8MLFanzFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99962107ACCA;
 Fri, 26 Mar 2021 20:39:07 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E5145DAA5;
 Fri, 26 Mar 2021 20:39:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/20] drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
Date: Fri, 26 Mar 2021 16:37:54 -0400
Message-Id: <20210326203807.105754-8-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
References: <20210326203807.105754-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>
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

v2:
* Make sure to use tabs where possible in __DRM_DEFINE_DBG_RATELIMITED()

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Robert Foss <robert.foss@linaro.org>
---
 include/drm/drm_print.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f32d179e139d..a3c58c941bdc 100644
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
+#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
+({												\
+	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
+	const struct drm_device *drm_ = (drm);							\
+												\
+	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
+		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
