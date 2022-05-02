Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D63517008
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C31010EBDA;
	Mon,  2 May 2022 13:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5C410EBDA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651497004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WaotQP90v4LJiFV9U7D4wGlm3uQ+5ZZcBUavInrV48=;
 b=Tzin1PEe+V4rBQFV/H16r/+7bgyqJ4QMSDc8YHH1VMsfFbJKVbshY3lb73Sl87C06Qyu6B
 n5q8JjbFl0ehwCB5ywjSjvuSo2/gphrf7hNN4CIDenMitudip4SkU2kyjd6Gdo7+u8aFOB
 xloLKeVoBDizi7OorOwE6BHm8qMxtxk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-PuRCz2wxPISIFIxN756TJg-1; Mon, 02 May 2022 09:10:01 -0400
X-MC-Unique: PuRCz2wxPISIFIxN756TJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l7-20020adfbd87000000b0020ac0a4d23dso5320163wrh.17
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 06:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WaotQP90v4LJiFV9U7D4wGlm3uQ+5ZZcBUavInrV48=;
 b=L4g2x4EOScI/of913zKW0J7wmjv5axbnUZ3SDJOgPio063h6KOVCJuuPDuYT2pJRiI
 Glz+zk0YsKMRe5oqxhRUuqbmy+cCCNlVdNbV/qr1OF3baL/+2lABC7BlNLGDsejJeG/b
 WwhZvK7fthFBTPclxFKKZ+ImEznQb9yujwya48wr/tyn0oWqOROEtAPspeEhRZduxDRv
 7MMnqgjBqR/RPU5sjNzpp6VcAiYzMGi9nvOjdE0XLSrKKl9566YGRENuADHH0duhCHTX
 YEiSklSmOuLj6CDH3SPzwawHkcMfSgoarnkogPsoFwNixjc9A+yN2u8jXiV1TE61lyOo
 Yeyg==
X-Gm-Message-State: AOAM5312AyVAZ+QvH91/kBStmgN6/isYyad1JFPtCp++szIGhWjFfyjT
 PNqfBvkow1vm5WSlHVobDN8yPWV3oJBL0PQi05G36APKVJlvxSde51v7LPLOF54YesKBORxnTgZ
 S6ZmR8alfdYQyiZ/nPZvraCfg8syY
X-Received: by 2002:a05:6000:1707:b0:20c:660c:7c78 with SMTP id
 n7-20020a056000170700b0020c660c7c78mr2875392wrc.150.1651497000465; 
 Mon, 02 May 2022 06:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjmpu5DF0NDgIenLWQrfwWpzc9ggipOyyqoLLJb25FhgbRN0nzSaLoP3BCeGiVSQj+kuDHOA==
X-Received: by 2002:a05:6000:1707:b0:20c:660c:7c78 with SMTP id
 n7-20020a056000170700b0020c660c7c78mr2875372wrc.150.1651497000266; 
 Mon, 02 May 2022 06:10:00 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfc7d0000000b0020adc114136sm9302081wrg.0.2022.05.02.06.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 06:09:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] fbdev: Check in file_fb_info() if the fb_info was already
 been freed
Date: Mon,  2 May 2022 15:09:43 +0200
Message-Id: <20220502130944.363776-2-javierm@redhat.com>
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
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Helge Deller <deller@gmx.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If real driver probes, the fbdev core kicks out all drivers that are using
a framebuffer that were provided by the system firmware. But it could be a
user-space process still has a file descriptor for the fbdev device node.

This can lead to a NULL pointer dereference, if the framebuffer device is
unregistered and associated data freed, but later in the .release callback
is attempted to access its struct fb_info.

To prevent this, make file_fb_info() to also check the fb_info reference
counter and just return NULL if this equals zero. Since that means it has
already been freed.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbmem.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 84427470367b..20d8929df79f 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -751,8 +751,13 @@ static struct fb_info *file_fb_info(struct file *file)
 	int fbidx = iminor(inode);
 	struct fb_info *info = registered_fb[fbidx];
 
-	if (info != file->private_data)
-		info = NULL;
+	if (!info)
+		return NULL;
+
+	/* check that the fb_info has not changed or was already freed */
+	if (info != file->private_data || refcount_read(&info->count) == 0)
+		return NULL;
+
 	return info;
 }
 
-- 
2.35.1

