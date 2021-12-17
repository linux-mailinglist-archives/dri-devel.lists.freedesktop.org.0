Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884F947817B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4C910E219;
	Fri, 17 Dec 2021 00:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F2710E1F0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/GvonJ2NqZfXSQGClXdvnbTmZF4yYJy2D12acQMdHo=;
 b=Ic2NMilk1hLjdmQrSP+TJ86zUq5G0CErtxw8m/OrtAnWbRaDV+5xEQ3tIOz6tLjzh6KSpV
 nZ961quFPPh3gUs7533ppyRNTcwWauXX9KEMFA32XzyOZ0ugj81SIlDUWBE6kcEhpmtyYz
 e6WjxyWCWpdximOXz0/12NIbP1niIco=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-CB-Sb8FCNn-5ejAZFSlAgg-1; Thu, 16 Dec 2021 19:38:10 -0500
X-MC-Unique: CB-Sb8FCNn-5ejAZFSlAgg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so153715wrd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/GvonJ2NqZfXSQGClXdvnbTmZF4yYJy2D12acQMdHo=;
 b=1U73ppEGE27M73qlmGGlL3GH+/yssdWKVE05i5PjeMGDS7yaupQoUgByC9I/o3lynL
 EO56NkUccZ5yQH3USfO35Qz/GBdYoQadpZhacOY7tv9IqtMD0/7foUF6jzRGIgwjFc0F
 hzWLA0i/pK5kWS2JtRzkm1TuPaorulwW03k4DpIp27nuFFjKtpF5cJNejW6EcAoXDK9x
 t9/BuZpApO+IHayk354BwFa6cleiMJH1QVU5vldbz0D8bUaoL9+5PHdv1ihFYFyc6xvC
 klZky2wd2EaLco4uSuEwMNeedv3SyMuu4vX3yHdmvExsyk3Uhsponu2UZSOLLvqe9eWF
 /2tQ==
X-Gm-Message-State: AOAM532ncNql4b2WR+kByn2sKERHuXesdn9Vy6vLaGczEip+KP4TR6qi
 t3XP0IxH3iGuNrcqmH3mTucPg+m3oq6nYMSqNx+LEIb4i8T6yvcNGqbfkyHr7jiI3tIqS2phM0T
 5rg1R4rMib8Bt+u6Ed91OLYZPrQ1v
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr402260wrs.270.1639701489158;
 Thu, 16 Dec 2021 16:38:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfLsvA2QaVHBD6DAMzBCXtLFy/U3iM87lNHcw8gWbPySLfAC8QpFJ3Cyc324OOY+OgCJZKxw==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr402251wrs.270.1639701489002;
 Thu, 16 Dec 2021 16:38:09 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/37] drm/kmb: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:26 +0100
Message-Id: <20211217003752.3946210-12-javierm@redhat.com>
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/kmb/kmb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index ed2424350773..4a835f90fe3a 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -628,7 +628,7 @@ static struct platform_driver kmb_platform_driver = {
 	},
 };
 
-module_platform_driver(kmb_platform_driver);
+drm_module_platform_driver(kmb_platform_driver);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Keembay Display driver");
-- 
2.33.1

