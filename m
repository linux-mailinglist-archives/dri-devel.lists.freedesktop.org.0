Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A051700C
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C61510EC22;
	Mon,  2 May 2022 13:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027CE10EC22
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651497012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jDUUd5wUXo34iLbUpw6jbiGIGpSLkimligm8emfXD8=;
 b=YLTuc9uMgCqtdFWRk86x5oOJJBU/384cB9nj1KaHLkdeN7ulYmoDTJYFgHqqsdx5uQzgeH
 Zs6x/mDHV4fj1LCJH/uaRjvu6AFol/1jaV+tKxEbZb0HajqiHTrfdNy9yF8qKoJ/Ziyhvd
 +n6jpvwIkroDNXjpeEejOmp3OesLePA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-fpiPrYamMfqhHOXic2_Buw-1; Mon, 02 May 2022 09:10:03 -0400
X-MC-Unique: fpiPrYamMfqhHOXic2_Buw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bh7-20020a05600c3d0700b003940829b48dso7486492wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 06:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jDUUd5wUXo34iLbUpw6jbiGIGpSLkimligm8emfXD8=;
 b=mWfT1oy4rEVejsFtlJX+JTeXLjchh9pmeiDswxxFrY8qRgFah79ULKs7bJ1j0hDNb9
 xiHNUGiPizlZ+DSrW3L07XLcGvncVB9Ku3++hd6EcVf0sAj+BPTZjkKoDG0P4OIW8ENW
 FFJ5llNb7VWrKCfHOTFIE+GgKMXGMIwn0ULo49ENsHbFCHuI8ODua5Ipwsp62FexXZLo
 pl8M3/nsGtQyt+mPSuR8hq2ZWlf7mJFZa04B3AFeN9KC++t+a8WHpn4vLxxii9LM128/
 6MjhWCFw37laensGuNCgBZxHCR44xFSAou5rvQWKude11tSzv5DYtydLyADbYWeClBPm
 lbeQ==
X-Gm-Message-State: AOAM532tZxMp5/EyrGE4+MWoiNF6Ro079UiTp29ZW9JHRCwZl5S9qGZo
 EOufXeubSqbBnEry6INfXk8rtvjlkbVdmtQGbWxkcQ/Nazzuvr4E6oryPP3X/IIlP3qR8VtBZ2U
 WgPLfDNTusPUXv6xm7WIVeK48b6uS
X-Received: by 2002:adf:d1c9:0:b0:203:c225:d042 with SMTP id
 b9-20020adfd1c9000000b00203c225d042mr9246069wrd.630.1651497001633; 
 Mon, 02 May 2022 06:10:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOkTguHAtECK69/s/1UYa4VaS8/fQLKinHt0F/MRa24f9/shVWIWvvemP/4uJ44EqjTVqlaQ==
X-Received: by 2002:adf:d1c9:0:b0:203:c225:d042 with SMTP id
 b9-20020adfd1c9000000b00203c225d042mr9246054wrd.630.1651497001394; 
 Mon, 02 May 2022 06:10:01 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfc7d0000000b0020adc114136sm9302081wrg.0.2022.05.02.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 06:10:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
Date: Mon,  2 May 2022 15:09:44 +0200
Message-Id: <20220502130944.363776-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502130944.363776-1-javierm@redhat.com>
References: <20220502130944.363776-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Zheyu Ma <zheyuma97@gmail.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A reference to the framebuffer device struct fb_info is stored in the file
private data, but this reference could no longer be valid and must not be
accessed directly. Instead, the file_fb_info() accessor function must be
used since it does sanity checking to make sure that the fb_info is valid.

This can happen for example if the fbdev driver was one that is using a
framebuffer provided by the system firmware. In that case, the fbdev core
could unregister the framebuffer device if a real video driver is probed.

Reported-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 20d8929df79f..d68097105f93 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1439,7 +1439,10 @@ fb_release(struct inode *inode, struct file *file)
 __acquires(&info->lock)
 __releases(&info->lock)
 {
-	struct fb_info * const info = file->private_data;
+	struct fb_info * const info = file_fb_info(file);
+
+	if (!info)
+		return -ENODEV;
 
 	lock_fb_info(info);
 	if (info->fbops->fb_release)
-- 
2.35.1

