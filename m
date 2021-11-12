Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88144E769
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CF989000;
	Fri, 12 Nov 2021 13:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581126E3D2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cq+5GX1LGAlrdEVaEfUGXIHfDu19zJU/Yjhmzl1bGJc=;
 b=ftPkMDPkFH2LtH4erVna264utLFW1xFDKfCiml9FTYD1XpTNwK+BumOQpSAUozvoPMk+fP
 n2WXm5OvFpsm2c9RY5q7u/9B8X8sdSEr7k/98dwurp/v+sqj297Uz3k8s5ex2g+C9BHhPC
 pCv72i3blL8L58QZJl/IUx0VcKkGM9A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-UjAFDLDaMCK0q6g7v_5Lfw-1; Fri, 12 Nov 2021 08:32:51 -0500
X-MC-Unique: UjAFDLDaMCK0q6g7v_5Lfw-1
Received: by mail-wr1-f70.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso1590047wrr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cq+5GX1LGAlrdEVaEfUGXIHfDu19zJU/Yjhmzl1bGJc=;
 b=JJDm1gaTnB1j8Po69LCOZlssthe/PA+Z33Czoyoc7cKwj4gXNO3MCE4Ko8sFrcKexq
 1mFtJVlZ4Pi1tpY8no9BdOt24o24Zt+XMbpeofKq8DsFchSc5vdNzjR809We+7N6SIrW
 o1zI78tIeUgC3dRugDa2YJh0R+iEISL2fuw78aCZkhl7ykBOhU0dOa/N7kCj89jB1iBx
 Tk+F0oQrL0dpxjAagah9nXOxn11Y/SrEZznbhnOo5iXIR1wNFgpesnaWKBY9qJthrc+v
 hX2n737CKHRkwcE2UTj4AsK4C2l/pukco9saOQdCjOPQc2eCvQaOiSjgLkZSm4EqcoU1
 8NKg==
X-Gm-Message-State: AOAM530DNy7loyxzBG1O/1rfc5PqMruYfExI86tBrumbOS6to6wuRw63
 xAL7OL58o73wgJOO3l2AWb/ANXhh6eBhIJKUO36W+09Ciow1EvEzu4YyhVqK1OJTfkpyOtFjljU
 awGFTs3bdZ6jYM6Gk5NDAcpCwDykC
X-Received: by 2002:a05:600c:5101:: with SMTP id
 o1mr34460065wms.81.1636723969979; 
 Fri, 12 Nov 2021 05:32:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoWQcfWmWVvV0JYnbwieSBAuTFS5D1rKq/HCQc0RO5OF48GRcTM2rvN71XU0UWSo8x16SIlA==
X-Received: by 2002:a05:600c:5101:: with SMTP id
 o1mr34460043wms.81.1636723969780; 
 Fri, 12 Nov 2021 05:32:49 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm5733470wrv.78.2021.11.12.05.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:32:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call
 vgacon_text_force()
Date: Fri, 12 Nov 2021 14:32:26 +0100
Message-Id: <20211112133230.1595307-3-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112133230.1595307-1-javierm@redhat.com>
References: <20211112133230.1595307-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is already handled by the console.h macro since a stub inline function
is defined for vgacon_text_force() if CONFIG_VGA_CONSOLE is not set.

There's no need to have ifdefery in the driver when calling the function.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/vboxvideo/vbox_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git drivers/gpu/drm/vboxvideo/vbox_drv.c drivers/gpu/drm/vboxvideo/vbox_drv.c
index a6c81af37345..fd7abb029c65 100644
--- drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -193,10 +193,8 @@ static const struct drm_driver driver = {
 
 static int __init vbox_init(void)
 {
-#ifdef CONFIG_VGA_CONSOLE
 	if (vgacon_text_force() && vbox_modeset == -1)
 		return -EINVAL;
-#endif
 
 	if (vbox_modeset == 0)
 		return -EINVAL;
-- 
2.33.1

