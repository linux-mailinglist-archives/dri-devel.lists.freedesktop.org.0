Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EFB566989
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FE810E750;
	Tue,  5 Jul 2022 11:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2248510E021
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 10:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657015363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sq1P6bjPwZGpMS6ut0qkpzOv+ePOi9aPiP7nYH2z6s0=;
 b=EGgk9PMxaNd/ceEtrMSo6RrykG37VIXGp/c602unfeiKvMR0UdA9mT750Kki1JiEStgeoL
 eYo4iO8NmzohPXfl5raUJrpG6fjTJM7Ob4VWuq7sGyg7uGNR4m2XVPqGTeTSOT7+z6W9/g
 A6SanFtLnifH58CoK3t9ryH8M53VA78=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-HExAWQQqO6O-aeWsfpGR4g-1; Tue, 05 Jul 2022 06:02:37 -0400
X-MC-Unique: HExAWQQqO6O-aeWsfpGR4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 m20-20020a05600c4f5400b003a03aad6bdfso5041443wmq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 03:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sq1P6bjPwZGpMS6ut0qkpzOv+ePOi9aPiP7nYH2z6s0=;
 b=TyzpIE7DqCatwJ/p8yQ7J8pTMlmSh0mxx16ITRVqYzsWNV90Z2k+WALViFsZegsJjE
 0z8OanXJgykzjTTBCE7Ch8i6mst1QSIhlyR+1gwTO51SBUPpCeFl19kZfMuHPPQPUJ1e
 XrGFT7L28F+PWzhFjmWiaiBTy0gvgKjV4OA3kEgLpiCjbH0nIBMPl1LtIizO7AXxl4mZ
 NdldMlUyjJ536yAtS1s7Hxm71Zwrzm/CkXSMmA5SPu/jFG6WP8luMklfN3MKyDV3mMeQ
 WpEv9SJVhX3i03qmKsb31U56WJJVT/HXIgeO0YtnqNs2Dto4WwuTk6My6RE47PyrijSl
 1bbQ==
X-Gm-Message-State: AJIora8yKpCjSKaDdrd+FJ8GdhWyUeyz9rmrCCJfICuZd6MJPAuXlQvU
 sgVUHXFLs4oK1+1kCLaUHDJ0mNRGcRHAsFeHWThEg2IAoQ0xYO6LSXcj6kCZRBSeatUbuTYYLyj
 FH6tdtQt1ijZTlp4Tz394Zgbdte45
X-Received: by 2002:adf:e889:0:b0:21d:6510:b750 with SMTP id
 d9-20020adfe889000000b0021d6510b750mr13203107wrm.498.1657015356428; 
 Tue, 05 Jul 2022 03:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8SE6G4/Be28Rs7e4q8Eg7G3RpZqKHzTQ9mDJPsqfzMfDXb7eIz1ukYB668iijCdejuSh1Mw==
X-Received: by 2002:adf:e889:0:b0:21d:6510:b750 with SMTP id
 d9-20020adfe889000000b0021d6510b750mr13203083wrm.498.1657015356198; 
 Tue, 05 Jul 2022 03:02:36 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020a0560001b0700b0021d68e1fd42sm6255192wrz.89.2022.07.05.03.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 03:02:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm: Use size_t type for len variable in
 drm_copy_field()
Date: Tue,  5 Jul 2022 12:02:13 +0200
Message-Id: <20220705100215.572498-2-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705100215.572498-1-javierm@redhat.com>
References: <20220705100215.572498-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The strlen() function returns a size_t which is an unsigned int on 32-bit
arches and an unsigned long on 64-bit arches. But in the drm_copy_field()
function, the strlen() return value is assigned to an 'int len' variable.

Later, the len variable is passed as copy_from_user() third argument that
is an unsigned long parameter as well.

In theory, this can lead to an integer overflow via type conversion. Since
the assignment happens to a signed int lvalue instead of a size_t lvalue.

In practice though, that's unlikely since the values copied are set by DRM
drivers and not controlled by userspace. But using a size_t for len is the
correct thing to do anyways.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v2:
- Add Peter Robinson Tested-by and Thomas Zimmermann Reviewed-by tags.

 drivers/gpu/drm/drm_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8faad23dc1d8..e1b9a03e619c 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -472,7 +472,7 @@ EXPORT_SYMBOL(drm_invalid_op);
  */
 static int drm_copy_field(char __user *buf, size_t *buf_len, const char *value)
 {
-	int len;
+	size_t len;
 
 	/* don't overflow userbuf */
 	len = strlen(value);
-- 
2.36.1

