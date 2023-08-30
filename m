Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D678D64C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 15:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBCE10E528;
	Wed, 30 Aug 2023 13:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C50E10E144
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693403199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOJpuwbwTVfs+j95sEE93OpkqtbclA96WzipEC/nM14=;
 b=M2J2AOzajbWxpOSlsTFsRiEYVhKK2zgfd14zlINFE9jhrRj0GKtWG4NxtPTI3Z6VJ3ioPn
 zHVYB+tdXs7gHK3ew+iH0TwicSodRc6z1earMnab8o9nLhRj3erHw5U0FY5KcwzJcRXZCc
 Yzhugu6EgC3zekLIfIVYbhl9ZeBAStg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-LfQ9GFDXPaOOYT6LYoHj_g-1; Wed, 30 Aug 2023 09:46:38 -0400
X-MC-Unique: LfQ9GFDXPaOOYT6LYoHj_g-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso19452211fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 06:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693403197; x=1694007997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOJpuwbwTVfs+j95sEE93OpkqtbclA96WzipEC/nM14=;
 b=UCbYQmiJkVcAU3S7VK9huwWA0eODfYrN4xl6yeoDU1p6+RGLuCgnOAw/LlU6TVxTYc
 o6x5hz1+vTJlLZ8p/YF+olyu7XFjoCv5AQ+i4ZLYwdE/5lTHuQdQXemPeYuvFXg+tVef
 UlkK/yPEZ9yQnVazebcm4IGCCsqK4Fp0nRnOjEDHXUEf8y53dmDjCHXVnK1e+dwUjN6/
 6Y4iA0dxe6932qYQcgmqkYAEpnDxpgOo0zlCHwszJeeP4GvhLPYSdG252yR633E65LIn
 9f8+Sk3w2zkrEzo5Ms+bQ5O+Bqz5ONHdnOLrCa5WjK0kBXyrBBl29rgB2FcRi+f51FRR
 jpIg==
X-Gm-Message-State: AOJu0YxOfV6C/h19lkMTwc0I1ch+Q0acq2ivYsDwCX6J8Z1JDkzRXR3Q
 ouoJvZYQcGbvsC4OIowu8ordgcAK6Kp90GV3/nHNFpg0/aN+izy1Z18A7rh/5aPlxFONFWfqXgi
 +InswsWjgwpOT8FpGRYqi0N87aGjv
X-Received: by 2002:a05:651c:1182:b0:2bc:fc2e:766c with SMTP id
 w2-20020a05651c118200b002bcfc2e766cmr1857333ljo.3.1693403196827; 
 Wed, 30 Aug 2023 06:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNBSsy/iFndvURQgQS9ZCnlQ9lW+9HBjOb1QIZNMn1l3Gt7cB24Ma8x0ITyx+CEVBlGHtj+A==
X-Received: by 2002:a05:651c:1182:b0:2bc:fc2e:766c with SMTP id
 w2-20020a05651c118200b002bcfc2e766cmr1857319ljo.3.1693403196642; 
 Wed, 30 Aug 2023 06:46:36 -0700 (PDT)
Received: from fedorinator.fritz.box ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 li22-20020a170906f99600b009a198078c53sm7167678ejb.214.2023.08.30.06.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 06:46:36 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: [PATCH 4/5] drm_lease.c: copy user-array safely
Date: Wed, 30 Aug 2023 15:45:55 +0200
Message-ID: <34e14523c9cea13e2f63afabf2938c89d2e84776.1693386602.git.pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693386602.git.pstanner@redhat.com>
References: <cover.1693386602.git.pstanner@redhat.com>
MIME-Version: 1.0
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
Cc: Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/drm_lease.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 150fe1555068..94375c6a5425 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -510,8 +510,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Handle leased objects, if any */
 	idr_init(&leases);
 	if (object_count != 0) {
-		object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
-					 array_size(object_count, sizeof(__u32)));
+		object_ids = memdup_array_user(u64_to_user_ptr(cl->object_ids),
+					       object_count, sizeof(__u32));
 		if (IS_ERR(object_ids)) {
 			ret = PTR_ERR(object_ids);
 			idr_destroy(&leases);
-- 
2.41.0

