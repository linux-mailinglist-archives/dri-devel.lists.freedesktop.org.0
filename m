Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E462CCAEDF8
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 05:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ECF10E47F;
	Tue,  9 Dec 2025 04:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BJ5azgfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D14B10E47F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 04:28:23 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3438231df5fso6539841a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 20:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765254503; x=1765859303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Pa1Xejftpj9ZCjaie2sXROdWsX12z9SbomyYLGQRdM=;
 b=BJ5azgfjRnd/vJQ+M4Jx3dnV8fcdQQ3u+4eTizNHEsuBhXjz7LQ0G5Iy9mz99ZBU+a
 kRAUtLsvF1r2XAX4+wKMGTgwGgBJredENBuFDB+ChkZuRV2Be/O/nYWZt2wTADYcFwsx
 XY2e64FnCABxHDg3surJQ9p5+H2wWcXpUCtwoLqIegxcYmzGyjtYK56IgH7cUrOK4UpC
 pxya8V3/pxHduYyjbFx/oqB86Kgn1M7NCS8CpopZPgtKsnOkht6Q78Pt4QXVVh2JsJTJ
 g+aj0sso3c0fEm/RpNf//XabDp8R9AhfaJcjfBFj6sBRSI9lTrxdhQWikCxr5xFDUEKT
 WWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765254503; x=1765859303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6Pa1Xejftpj9ZCjaie2sXROdWsX12z9SbomyYLGQRdM=;
 b=rZFiQXzEihsHdXcKsU+AH3vFIvoWit4exwlRXSm40SCEuzEcSHki3pGpNx/9yVTnvM
 84fHqxYB95bDXi2fanuq73+W1+Or5UjVch2yyPWqKr9uWEJwFI1a0XmFJtNgh9b137G8
 b2VzYe1dcAOMLOnCYEu0OnYQfKwyEBK//YEhurQEOu+qPeXesrM7ynCUua5QEGSUyT90
 Wj/Qx/ESqB7YPOweHuVoufDV47e+moBOHp01iTOJ6mMr/6F1wapLMkfqIgeKR2y+znXH
 AoA9jxuN/32Y758ePRmd3pgemdWZZeuFp/kYx7q9PbTaLHLIXcTI9TPIBqUhP9QPl6/t
 fj3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhQL87E87tYJeJO5JKtyPFfNdpJKEA5Gmn0BsLstSCGumW2HZFVZ5h5pP01R7uhRjpqWrI0A40t/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxGE2Ogs2q76HDSjg1xxUh/neQSAir73zm+ZZ207FZKCF+0lrs
 PTsuRlHmpFLu+Bv1p14dIkOs8n7H86CcxHNuFRQgMaNv5HkFfonXPTM2
X-Gm-Gg: ASbGncu4mjoMFXlRYjAyED1S2alIikBgBQCZPf6pXsLzYEZjU5jPcEeOK0pudKJMR4q
 w765Y68nXEDszCUu4h1G2gCV6w8zirPIpPUP0Hi6uSvhqvHEjUc16c3ZQb1I83AAl02O7TNPn5k
 gxzJiYLd7NCwrfCGfDBVxxwcZxwfNUC28Df3I4UzENl5kGalRXsIEO8Y62GNYtyotQhGGlCHHDk
 /Tt3mTt+17rfqqBsdHuvlBiSjJVIoSVfNBuB3+SCGCPmCOvHpWx3wtVpqGBqqQpLTpAUoux49k8
 niaPsVTMuWkayiwziHYeFhGw3IPuivN8UdQ61f+PLIRIAY7KyXrxWXvS6VwZPfcc+HHMcZUwt5S
 zlKxO4GaHUDhr1JW9CoEmbhbAFEjdudQpsc2Scuqi+rx9vYKLISe5uAB1iU5NfmT+UqpWhdu93Y
 ElnG28CWIX7ftXzoFGmgsOjrCzZ6Ga9KUgNNykIFXcgW8=
X-Google-Smtp-Source: AGHT+IEAgpMVzxFDELmSe1EcFgFHHrMmtin3pr01zEUtdDpWNY9djhS44HySFgwBkRAy8M6k41HDxw==
X-Received: by 2002:a17:90b:58c5:b0:340:e517:4e05 with SMTP id
 98e67ed59e1d1-349a256431bmr9237622a91.12.1765254503018; 
 Mon, 08 Dec 2025 20:28:23 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:b455:298d:48bb:1784])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 20:28:22 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 3/3] sh_mobile_lcdc: Guard overlay sysfs interfaces under
 CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:44 -0800
Message-ID: <20251209042744.7875-4-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
References: <20251209042744.7875-1-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SH Mobile LCDC driver exposes overlay configuration via sysfs.
These attributes depend on FB_DEVICE and cause build failures when
FB_DEVICE=n.

Wrap all overlay sysfs attribute definitions and group registrations
within CONFIG_FB_DEVICE. When FB_DEVICE is disabled, the driver still
loads but without sysfs entries.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..a46da10789c3 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1182,6 +1182,7 @@ static int __sh_mobile_lcdc_check_var(struct fb_var_screeninfo *var,
  * Frame buffer operations - Overlays
  */
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t
 overlay_alpha_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -1351,6 +1352,7 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	NULL,
 };
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
@@ -2637,7 +2639,9 @@ static int sh_mobile_lcdc_probe(struct platform_device *pdev)
 static struct platform_driver sh_mobile_lcdc_driver = {
 	.driver		= {
 		.name		= "sh_mobile_lcdc_fb",
+#ifdef CONFIG_FB_DEVICE
 		.dev_groups	= overlay_sysfs_groups,
+#endif
 		.pm		= &sh_mobile_lcdc_dev_pm_ops,
 	},
 	.probe		= sh_mobile_lcdc_probe,
-- 
2.43.0

