Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5F51B173
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 23:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EF010ED74;
	Wed,  4 May 2022 21:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C8210ED74
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 21:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651701404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuNgpe3lAKna2dZKI13IhuymSX1vIwYgln5kdRF+8fw=;
 b=M/ptRi54fr7BR9oyQq8gezKyYPE+IL4eFKCrCMwu4WKtWaLdkj3XgvI7b37p6Vf038K7lr
 I43Wuif6fNQo0uE8HB26n2K/0432eSwI+Rzc30mzKE/n4Bq4H2we/xxO2WfsFHHkomZ88j
 rrZ0uJs+TOjYgik+Q5wka3syTv8gFVo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-FNjRBeIENQ-uo6HsjX1cWg-1; Wed, 04 May 2022 17:56:41 -0400
X-MC-Unique: FNjRBeIENQ-uo6HsjX1cWg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o24-20020a05600c379800b003943412e81dso1100912wmr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 14:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuNgpe3lAKna2dZKI13IhuymSX1vIwYgln5kdRF+8fw=;
 b=HpSjIHGrlMf9BEFM1y88VGfrJEwYdGS/WXeJOWhW5DE7zHHcvzr0m4mufQAgJT9HyP
 tuKEWMMf5Qa4TVD+YFefjtbBqAuiv7/h50bZRzLPy7tCqPuvhmxfg6YoYftciuWCPQPL
 +l9tA8RYml1jEoZEugH7EFxx/SGnMH8GCHbugEIsU3EtsCBHxb5MpGd/ZBrFCBzMlkI5
 o/x1fi1ipKtWV8qvdQHNI4mWAg3AXLjs4ui5PqcYTBU2RZEU76GWml/ZrLd/UUO2raQl
 5+zJR9x/vs8vusAa2S5MCSccApqGv70kjEgVtwCujfSZvjKegQabKFlNDCMgMUseDsNX
 zGBA==
X-Gm-Message-State: AOAM531ppOuiyVDYuoNmvS4I+klfkcRF377+4ubh2neo1MJuBMMp0n94
 SeqqvPq8nG0Wr6R/khWqDAVTTBAX8j3SHD+cMiBTeFuPRn5VD781y5bfFNkNKVt7Hw06byT8Xj1
 zKi81T8SU6c7WnMehvykNsWHsV5Pf
X-Received: by 2002:adf:fc52:0:b0:20c:4c8a:e370 with SMTP id
 e18-20020adffc52000000b0020c4c8ae370mr18157754wrs.161.1651701399738; 
 Wed, 04 May 2022 14:56:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEPrShm5zua4UvoQHUdnN5BxXwamXBRJdW2Ea++RHDLWBCw+teWP2XtDDnUQk73fLTD222dQ==
X-Received: by 2002:adf:fc52:0:b0:20c:4c8a:e370 with SMTP id
 e18-20020adffc52000000b0020c4c8ae370mr18157745wrs.161.1651701399466; 
 Wed, 04 May 2022 14:56:39 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d920sm16164086wrd.108.2022.05.04.14.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:56:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] fbdev: Prevent possible use-after-free in fb_release()
Date: Wed,  4 May 2022 23:56:31 +0200
Message-Id: <20220504215631.56756-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504215151.55082-1-javierm@redhat.com>
References: <20220504215151.55082-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

Most fbdev drivers have issues with the fb_info lifetime, because call to
framebuffer_release() from their driver's .remove callback, rather than
doing from fbops.fb_destroy callback.

Doing that will destroy the fb_info too early, while references to it may
still exist, leading to a use-after-free error.

To prevent this, check the fb_info reference counter when attempting to
kfree the data structure in framebuffer_release(). That will leak it but
at least will prevent the mentioned error.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbsysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 26892940c213..82e31a2d845e 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -80,6 +80,10 @@ void framebuffer_release(struct fb_info *info)
 {
 	if (!info)
 		return;
+
+	if (WARN_ON(refcount_read(&info->count)))
+		return;
+
 	kfree(info->apertures);
 	kfree(info);
 }
-- 
2.35.1

