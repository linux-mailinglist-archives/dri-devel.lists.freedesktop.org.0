Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9785F1847
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E2510EE05;
	Sat,  1 Oct 2022 01:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6048110EE05
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664587173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDL/AgTFWdm+PP/N7/EovNn2CFq5LCV9poLaDqClvoQ=;
 b=WQhpMBxIBG1TlpdilNZtTa49/48WxSbXE5Ojw42LxhgeAJ3pT4bEKuwg67p6XlY//UkK2x
 C7QNnaRTrLotPzZQHOejUTYOuHYihnv7OLV0idqife3DrzK4WsbeqPMPzN2xxKwCQYUXi3
 9OTepbjsm+YCOV0uqHdm7SVG+EaVmRs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-aam0GDC7PbKrdg3viOnjuA-1; Fri, 30 Sep 2022 21:19:32 -0400
X-MC-Unique: aam0GDC7PbKrdg3viOnjuA-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so4640976edz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IDL/AgTFWdm+PP/N7/EovNn2CFq5LCV9poLaDqClvoQ=;
 b=jk3Sx1nsBrCqbSqoJcXD58ET3b9J3puulP6yOZ87EehJQckOLZVukewp1jN58D6Oge
 ogIVRs++nAsuMNYd8sCSUqSQxEwRLuzM3Z/nLjoaL+DH+Kydgsk4V/yxQjzpHxbYHwtg
 PVnB11Fwgyh4XzuLnARprKS/JmeP6FeKUKLkHRiYG+bd1Wro4WKxMQRPbZUh1Jze6gei
 wt7W3H3M3SIa04WR0p/1H8GZrMhSPd38b3/9mRFjQdba1kr1Eoe09ZZY2fzJhXm9nfYY
 +5nEZkzbWb7mBW9BO0KoWX/Jev1zJcF8bc91o6SDLaS9JcBfT08Ab3xucleVgduF6c42
 dN+g==
X-Gm-Message-State: ACrzQf309h31TBJwPILitO9aPTbWWQY7D4kSdgfdxxmSMoHGfm1Mp/PJ
 4lMMhT2BCvdpaxfW8tTH4toiciFLmA65J/b/Z+xInVOUMfQ6u55jKVwFJo0neHLuk0nfWgWaoxw
 D/H77tgaVIkPnjgK0/6Jq4OAddKKZ
X-Received: by 2002:a17:907:7f13:b0:783:6227:b939 with SMTP id
 qf19-20020a1709077f1300b007836227b939mr7826772ejc.416.1664587171146; 
 Fri, 30 Sep 2022 18:19:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wyZtxUwtQbZgS2YO5wic9h7BmWOQ9xCf4l19faoKnOUNoHKq43TyHpezKHLZZwq7kSKONgA==
X-Received: by 2002:a17:907:7f13:b0:783:6227:b939 with SMTP id
 qf19-20020a1709077f1300b007836227b939mr7826762ejc.416.1664587170962; 
 Fri, 30 Sep 2022 18:19:30 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 oz23-20020a170906cd1700b007724b8e6576sm1931950ejb.32.2022.09.30.18.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 18:19:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 6/7] drm/arm/hdlcd: debugfs: protect device
 resources after removal
Date: Sat,  1 Oct 2022 03:19:04 +0200
Message-Id: <20221001011905.433408-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001011905.433408-1-dakr@redhat.com>
References: <20221001011905.433408-1-dakr@redhat.com>
MIME-Version: 1.0
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e41def6d47cc..020c7d0c70a5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -204,11 +204,19 @@ static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *drm = node->minor->dev;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
-	unsigned long clkrate = clk_get_rate(hdlcd->clk);
-	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
+	unsigned long clkrate, mode_clock;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
+
+	clkrate = clk_get_rate(hdlcd->clk);
+	mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
+
+	drm_dev_exit(idx);
 	return 0;
 }
 
-- 
2.37.3

