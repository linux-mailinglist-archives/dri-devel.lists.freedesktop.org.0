Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CF478188
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2710E243;
	Fri, 17 Dec 2021 00:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934AA10E216
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q91daTY2WtTyWMwxe7dlWper7f8gM/2aqRN6262ZYts=;
 b=FpJgqieinP5gHOQWzp5kGbs/o++lUK2yy5Wz/4r+o7IjzSLPsO51G8d9/rTGvWcdblAipb
 98tLxhfKdGrcnIlUoJKPf/E7MR7WQLdjcpcs5fc08cpvf/IxlcjnzObNydXPiWT76NZ0aM
 AXzVPyw1t2sNlDjjRoora5p8YWtDjm0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-EX4bFBFpNKayXK4x6IuRjw-1; Thu, 16 Dec 2021 19:38:24 -0500
X-MC-Unique: EX4bFBFpNKayXK4x6IuRjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so395144wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q91daTY2WtTyWMwxe7dlWper7f8gM/2aqRN6262ZYts=;
 b=dsp5RU3HMHhDiVWtmKr+sn+BlvT7vNy9q9mIVeKr/3J9NZjWm1YswutWF7gtSRnxfk
 SbpRazOmcR+redziX8tlTquaZLWoozO1pQu9J6PoDe+92xcaFxKqe2quWSY8Qq/O94Iu
 lA/AD5xER2lVX9M+Lnk0asNmasIL2FLItOvb/8CDmbVxIWPZ1m7OgJSz/WIVIGF17b+r
 EAkSh8o8oT8m8B8CPp4ygrDnGKA9jIRtY2n7idkhB2f1otJzbazAxcehK2Po15iFjlre
 4Tih/H7Ij8OnWiz3Nh24SS/fOK0otgkEARXY/OqZd8ZhegZY/PKahsXOk5+b3JXNe2dS
 A+UA==
X-Gm-Message-State: AOAM533bjsyFf0PQouj8JEjmENnKhpI8sjEYRpZi5JedmhCMc8Lw1BiB
 XwTyOu2QhrS3gmz3pdjmnFRTlD7uYkOXqiZNlZjy5cKiLSz/KiRxg3QiqKrbAAmy3pRbK4Q+PgA
 le+EXWsp48t402oGw3w7N184DpCTA
X-Received: by 2002:a7b:c306:: with SMTP id k6mr363064wmj.15.1639701503010;
 Thu, 16 Dec 2021 16:38:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvoXeGW2jrccEvR48MqZL+8tJylA7p6Q3ao3iqhCsaxM7OjBhKzQDvzh60KoN1/spon9TghQ==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr363045wmj.15.1639701502768;
 Thu, 16 Dec 2021 16:38:22 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 25/37] drm/imx: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:40 +0100
Message-Id: <20211217003752.3946210-26-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/imx/imx-drm-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index cb685fe2039b..a57812ec36b1 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -341,6 +341,9 @@ static struct platform_driver * const drivers[] = {
 
 static int __init imx_drm_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 }
 module_init(imx_drm_init);
-- 
2.33.1

