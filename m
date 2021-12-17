Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E494781B2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4628010E2AB;
	Fri, 17 Dec 2021 00:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7785F10E297
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lVDlvz5KshJ9xEp0fUDjyMKxN1Mip/awmP+ArPF4eY=;
 b=MVU0nqbzGFmbWSTS4IjTBWupT84rz0/jgyTRCJTMzi6PTdLAvEXZzyp6+A8Ehbo/5F3uCY
 ZQMbvv6VZpB6QZLNgA7VFXJ+a4yAKFHT1GcaQo738gx7mZ3dQnI8L66MP/sQ90FDVrJ9tw
 p17PCxnACzsl4Ho/DU/r38DssnXtUOk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-CRKyHjlyOcmwiXv2XEbL9w-1; Thu, 16 Dec 2021 19:38:33 -0500
X-MC-Unique: CRKyHjlyOcmwiXv2XEbL9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso2075374wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lVDlvz5KshJ9xEp0fUDjyMKxN1Mip/awmP+ArPF4eY=;
 b=Um+R012yYWp1W+QXL+Y/GhGQrteS6aeTjhmLtXCJ1GLvap4q0UlH8wedPkdMCNUsfR
 TPgNqv9qltVB+YzSlvTO1YL/VYbZjCACDIiXNj4zypxnpvL4ql1/dVWZhS9bXl5uUe7y
 ucDrHciwvo8S8Xs5DOgGiQyp41fOlPeGmPQMCatofuJmV8h+1OvhxR+NcguEX/PRQdXx
 jemVCwZi00Mif8deQJ6UjTi8gYN/Ca8CE1A9MBmchuwSwpeWzmAyjW5KqmcfW3LZzFKL
 xY+F+yz0I8mfKnMcfN4sbQ7eqAonnJIe1kA7KeFqWFgzke6TR/IfwEdZdeK92WOD/pN9
 h7GA==
X-Gm-Message-State: AOAM532a+34QI2to3Z3J34mOZq7hhkapLwkwEHP63ztPlngpj36UJrEz
 yV5BQbehRAqf8mWa/wowcLIx2crySUeBhaCGXU8O4gsC0+CQe8/ZnbxkF0ED0p4MpucYDShOYfM
 Sg1cyI1Hb98UXfJpnANBbXoo3l7SH
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr386739wrm.610.1639701511901; 
 Thu, 16 Dec 2021 16:38:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzO3TK+zySPyHhr762oSVAORB7oktel0HxoAPED3eWuduaxPT05zJHBzakbWjfgQEb8xwaVDg==
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr386729wrm.610.1639701511680; 
 Thu, 16 Dec 2021 16:38:31 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 35/37] drm/tegra: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:50 +0100
Message-Id: <20211217003752.3946210-36-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/tegra/drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 8d37d6b00562..48e35d686473 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1382,6 +1382,9 @@ static int __init host1x_drm_init(void)
 {
 	int err;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	err = host1x_driver_register(&host1x_drm_driver);
 	if (err < 0)
 		return err;
-- 
2.33.1

