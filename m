Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA637A807C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A4810E4A9;
	Wed, 20 Sep 2023 12:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9922610E045
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695213447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/re3vPWoYJ/6xHLpunyVTZgfJ3oWhQoot3M15Xf93m8=;
 b=E2OP29vLDk4eh5/V7/D5SKXxSO5RoM5HB41hLgMOPlLhV8MOamYL82/noDOQ7QinN7z01b
 GJcmkR+B6Sdzp6HxJmm0yzG10cMMkjbDidnawKuLvMTyzjWPGYySM5RSLhZOun+lFRxBVY
 qZv07IqsnoFNJY3/U6zMZfFo1j+IOgw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-4QXxlugCMV6ZTWx0XNIWmA-1; Wed, 20 Sep 2023 08:37:25 -0400
X-MC-Unique: 4QXxlugCMV6ZTWx0XNIWmA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9a9cd336c9cso154954566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 05:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695213444; x=1695818244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/re3vPWoYJ/6xHLpunyVTZgfJ3oWhQoot3M15Xf93m8=;
 b=vvg/RD1IN0ygcp6hXWxojJhjGbXMBcFjYy4FModbBPOTLIYcvazdHwuPsFi0qZIeXN
 T5N7W0FHygZwfVVw+cKedZghmFBiD+ms/fEeLsZVUC8ozg2nI5VIRbdKRnCnuSCshfZD
 8uCu4RDxUKpzl9a0sEIZaBaR9U3rwv7RTW1vG4KgK9QPBSROh14gzmWtzSNvc9J6mwDZ
 75/+C1wcfAwWnAB46DlLsj2kxEeiAkRJHYnflwiY0DUPp+q5+pZCBEvTkgxLu8SfsA/s
 /7FRQY5UJVqzNgUibcMt/za9uS5bUlKp7nZRBW2m3lDiZRm+oIM53uMMyRF9ydrQMqbk
 pb1Q==
X-Gm-Message-State: AOJu0YyT/uhkn61s6MqJVPEmUxilBxCVYuyAL1YheCV4KsnCmfUaysC2
 Sj4ZqSUvKJ3yZwK3W0PZZX0jxVhh5ASEtUk0hdFFdsBQfaZ2snPxe5hsdyt7Kgmebj9L/SyeaLu
 GlJPkVjvGzBPUJeE4CT0IwaHfSyAS
X-Received: by 2002:a17:906:1d4:b0:9ad:f4d9:f6f2 with SMTP id
 20-20020a17090601d400b009adf4d9f6f2mr1978103ejj.5.1695213444580; 
 Wed, 20 Sep 2023 05:37:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhjndQs4UNSwfullLxNR+tIZdKn1iy3aRr+eKNx4dO54tFLsdtNfZQxNfsH7DoGs3jy6KzlA==
X-Received: by 2002:a17:906:1d4:b0:9ad:f4d9:f6f2 with SMTP id
 20-20020a17090601d400b009adf4d9f6f2mr1978090ejj.5.1695213444350; 
 Wed, 20 Sep 2023 05:37:24 -0700 (PDT)
Received: from fedorinator.. ([2a01:599:906:7772:a505:d891:dcff:9565])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a170906854b00b0099ccee57ac2sm9233184ejy.194.2023.09.20.05.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 05:37:19 -0700 (PDT)
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
Subject: [PATCH v3 5/5] drm: vmgfx_surface.c: copy user-array safely
Date: Wed, 20 Sep 2023 14:36:13 +0200
Message-ID: <20230920123612.16914-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920123612.16914-2-pstanner@redhat.com>
References: <20230920123612.16914-2-pstanner@redhat.com>
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
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5db403ee8261..9be185b094cb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -777,9 +777,9 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	       sizeof(metadata->mip_levels));
 	metadata->num_sizes = num_sizes;
 	metadata->sizes =
-		memdup_user((struct drm_vmw_size __user *)(unsigned long)
+		memdup_array_user((struct drm_vmw_size __user *)(unsigned long)
 			    req->size_addr,
-			    sizeof(*metadata->sizes) * metadata->num_sizes);
+			    metadata->num_sizes, sizeof(*metadata->sizes));
 	if (IS_ERR(metadata->sizes)) {
 		ret = PTR_ERR(metadata->sizes);
 		goto out_no_sizes;
-- 
2.41.0

