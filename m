Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31A453D66
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 02:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1733B6E086;
	Wed, 17 Nov 2021 01:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE476E086
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 01:01:59 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 8so1025742pfo.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 17:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7oBWSRNQYBuq7Ls3gyfcTUAoT98uMmIpA6cFr+2S8n4=;
 b=EZJQ7Twy4XtkBJ6xmo89ZWKnjdJLgaA3wXyheo9LZEbzFGTAQmOMWJg2xOjkrJBKDH
 ViFYr2WxemnUPyVm3IaFVIu+zMDFclBvDH6CWOJK8V1dilbcjXGXPnGiUybnkIMyf6h9
 a7dO+c4Xsqi9W1oIRaL8OXXRbrQmquaEiDoDHyoVAhxIAw3q3MIFx4D2A5Eij8gGYi6o
 xxcyrqrvcoB4pI8mace58ycUAGnfw+geB9QrVhwthiIV2eFZHeTSroJ3pnSPLwp5hgIk
 VHHttRT0hf4PElkieAKn6dBFeYsTT+6LwXnBKd8qBStynGKlqZh/0PunSqO5t/M5DDLl
 uFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7oBWSRNQYBuq7Ls3gyfcTUAoT98uMmIpA6cFr+2S8n4=;
 b=4LN5P8aobpZV0/Y6kcMocZpNeGYRaDPvG/KQisINkuVSPI2VAAG4INMsv8ZeQos0XC
 +K5MjI7h7XhfSl6Yy0WEZUfcWWz76JtgA39LXt5jj6lBms3SYuGaj5GrNnzfVRE7H0qA
 Zr0K3SyaCpTMnl7GJ1FV10iqNo4PaW1Ul/5nhdAFudPXPw0b6/a9V51ZZRGE3y10YGeJ
 ObDc4EyPGcBDNOk+McDdk+DPYyGC+E9ehcEm+75fxrM2br8t1ROq6oP9ccNUGMvAMVpW
 wVUn503iKqRFNlueQaw447CZ4ne3CTqW39KKDPMW5D5bEH9sL08DMruBzZueeT4PfKuy
 e4Nw==
X-Gm-Message-State: AOAM5306FXBIQ2yorJCFKCiS4JOxMXDDxt8MuAUnT0QI8DBPUXQCXidN
 2YK9qxjXEgEqO5Ix+IovL/8=
X-Google-Smtp-Source: ABdhPJxVNb6EQTVlevYB6oIqe9z7J2nPJJPRnxGhpFM+o8goSZBR6EVRZM4t4zBNoARvAGM8clrGhw==
X-Received: by 2002:a63:8048:: with SMTP id j69mr2385989pgd.135.1637110917919; 
 Tue, 16 Nov 2021 17:01:57 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id p19sm22517713pfo.92.2021.11.16.17.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 17:01:57 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Oskar Senft <osk@google.com>
Subject: [PATCH] drm/aspeed: Fix vga_pw sysfs output
Date: Wed, 17 Nov 2021 09:01:45 +0800
Message-Id: <20211117010145.297253-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrew Jeffery <andrew@aj.id.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before the drm driver had support for this file there was a driver that
exposed the contents of the vga password register to userspace. It would
present the entire register instead of interpreting it.

The drm implementation chose to mask of the lower bit, without explaining
why. This breaks the existing userspace, which is looking for 0xa8 in
the lower byte.

Change our implementation to expose the entire register.

Fixes: 696029eb36c0 ("drm/aspeed: Add sysfs for output settings")
Reported-by: Oskar Senft <osk@google.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index b53fee6f1c17..65f172807a0d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -291,7 +291,7 @@ vga_pw_show(struct device *dev, struct device_attribute *attr, char *buf)
 	if (rc)
 		return rc;
 
-	return sprintf(buf, "%u\n", reg & 1);
+	return sprintf(buf, "%u\n", reg);
 }
 static DEVICE_ATTR_RO(vga_pw);
 
-- 
2.33.0

