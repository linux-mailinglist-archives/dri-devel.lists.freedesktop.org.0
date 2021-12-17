Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03847818F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3647510E2B4;
	Fri, 17 Dec 2021 00:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3458410E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXr/HtZEESykJ0yrpvW6NmyfmIq7N8POdE+7OtjF+Dk=;
 b=DRlxZPra3d6XO0CGbjCpB+I2fxyF8I082kJA0I4gdWiQLV0bdAaolQaimYPCHMSybeKCs6
 zCT2vkRmQ0qn0y7xhEJtJBc0cTZMkI+37e77Eqgf9OpQUGxAluODPXCJvMelqL8splaI8Y
 F1XTnf8llErJm60SHw9vP2N8mCiORWc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-ntkRsWdJOP-TP5GNWYsHSw-1; Thu, 16 Dec 2021 19:38:08 -0500
X-MC-Unique: ntkRsWdJOP-TP5GNWYsHSw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so2071325wms.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXr/HtZEESykJ0yrpvW6NmyfmIq7N8POdE+7OtjF+Dk=;
 b=zRPJ4XupkeE4kpysSm4re701cbl9tcup639Qvlrg+L/h72ZJ9Z6FbosZdgEOSVr+Rc
 yYZrNiUh9n034qC6xM94vjaZo9iQ4Ig5I0DURma67KAunRyY05XNqNrjo7f5y0gNUXMC
 Gmmv9d51eiPlbbnOmFq15mFL4hJpd6HY/ZckfCe+X4e1YglxumWH25eeGwEcXZpnxql+
 JxCLaN6QRPLt+0rbq5Z1jepHPbiDdVXDDnPi9SE8DL1iQVJp8JtzpBCigQuHEeW9OeA+
 F1WeJIGwMHh8u2TrWSbFaFrLvlozcYmM4La7L0vHvPS1RTV/W3DZYGc8JKJbYolyf5Dl
 vmSQ==
X-Gm-Message-State: AOAM532g27mRQ1nO4TvxrYyZMxHyN2MgeEqywZirP3hNaCT6rrYKatc1
 fDXKRGF16UQXdliz3YXaDQGka6rdnUfyaDb+HraqQXWEUEWrWYfDZNw6cPWX8Na0OisE8NK55gY
 1+GDPNyv18TZg5hE59CR1tSQiH0aq
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr385864wrm.610.1639701487602; 
 Thu, 16 Dec 2021 16:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL5lNujgVSFdCNn/5S3bABcjAD8WL3B8WlbuHybqLl5LcmMGybOejSQy/ignMv+b6T54BObQ==
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr385851wrm.610.1639701487445; 
 Thu, 16 Dec 2021 16:38:07 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/37] drm/hisilicon/kirin: Use
 drm_module_platform_driver() to register the driver
Date: Fri, 17 Dec 2021 01:37:24 +0100
Message-Id: <20211217003752.3946210-10-javierm@redhat.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 98ae9a48f3fe..2ac125edb0a1 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -307,7 +307,7 @@ static struct platform_driver kirin_drm_platform_driver = {
 	},
 };
 
-module_platform_driver(kirin_drm_platform_driver);
+drm_module_platform_driver(kirin_drm_platform_driver);
 
 MODULE_AUTHOR("Xinliang Liu <xinliang.liu@linaro.org>");
 MODULE_AUTHOR("Xinliang Liu <z.liuxinliang@hisilicon.com>");
-- 
2.33.1

