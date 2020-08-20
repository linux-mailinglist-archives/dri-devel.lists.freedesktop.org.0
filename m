Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D824AD62
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 05:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7B6E02A;
	Thu, 20 Aug 2020 03:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B2B6E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 03:39:44 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u20so390766pfn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1Pl5M3ukYq8iQYrf+dpnwbhWHmgNw4KikJbcw2NDFaY=;
 b=vTe4qnU9syJCWAEG6DywC43aFT6u9KZAlrNQGmPhdjb381EGy/7CuoAm9utkz4bzrG
 4SG+ix3+/d12Nxe5oanUjOKPqMy5JQTG0Au7MQCx6D1b3h5hrYHptueFtC0w8E22GncH
 DB2Y7zUz/eoUKXh71v8MfxvstgAeMB+V62r5YgLgPyBICXwPYQHT/m3+h1M0Q2csztN0
 TCDTkwGAvRaH5KrhuFHXK1EGUaAK2H0SFsB9FNscx4D1VkVetzaiZddED0nXU/abKuOG
 Nx1wDsfslpX8BT0VVyTmT1fo8OBVjpFGcYyAarNIrOlWcuEFZHuQsf1Q6XNSoIPGiVFP
 4XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1Pl5M3ukYq8iQYrf+dpnwbhWHmgNw4KikJbcw2NDFaY=;
 b=fLPoPw7yl72YYbXerwNGDHt3MuEkOqDesa/rfPOR8kWsqxEbsyh+nH0hcpPC9tNX2K
 ovACDFtA9tmRlBKRknmmSVDWQILs/3/0b7ZasZgTB0w5ipPnYTxk9lB78SJbZD/SV83o
 9anZpsUbu5lO6S2aBj/7Z0YY3JNeXbTcLA6IvjZGmjnadkqNz5lT6mNwn7kEEwJIjjxl
 zR+ycPHVrNXYFsHP0kwvCvftDUW7lYh6Iax/NEhmCqctdoWkXQtR2JbcrSSezgFcR9D0
 0qDchkjI2KRaEooRUDL4vb3JPyx/aVvikdYVKYCqCU7+tkv9x5rMp9ItVeb6zS6dEyvP
 NTRg==
X-Gm-Message-State: AOAM533eekwV4ylNfVz/78BkBOEsJ9wuv6OV2mHltJwN1xRfxbv9zpbS
 O0NpAlc+oMGTuriJHFPmOC1D0Q==
X-Google-Smtp-Source: ABdhPJw7+wbEcxeGvP6s6ZJ+K9s54oBWBNNce+Q9YhzT/XYIL8Tlrz5uMXzYbvij9iHIj3eAZ0TnWg==
X-Received: by 2002:a63:5a1e:: with SMTP id o30mr1131758pgb.62.1597894784312; 
 Wed, 19 Aug 2020 20:39:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h9sm803062pfq.18.2020.08.19.20.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 20:39:43 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm: hikey9xx: Fix inconsistent compat string
Date: Thu, 20 Aug 2020 03:39:39 +0000
Message-Id: <20200820033939.127932-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is against Mauro's tree here:
https://gitlab.freedesktop.org/mchehab_kernel/hikey-970/-/commits/master/

A previous patch changed this string to be
"hisilicon,kirin960-dpe", but there are other place where the
code still expects "hisilicon,hi3660-dpe", so change it back.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Liwei Cai <cailiwei@hisilicon.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Chen Feng <puck.chen@hisilicon.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index 18fec5a1b59d..efa5727612f5 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -339,7 +339,7 @@ static int kirin_drm_platform_resume(struct platform_device *pdev)
 }
 
 static const struct of_device_id kirin_drm_dt_ids[] = {
-	{ .compatible = "hisilicon,kirin960-dpe",
+	{ .compatible = "hisilicon,hi3660-dpe",
 	  .data = &kirin960_dss_dc_ops,
 	},
 	{ .compatible = "hisilicon,kirin970-dpe",
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
