Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB255B7CEC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 00:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3A289A5C;
	Tue, 13 Sep 2022 22:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DA810E596
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 22:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663107323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDL/AgTFWdm+PP/N7/EovNn2CFq5LCV9poLaDqClvoQ=;
 b=E8R0xeYw7OT4sEuNdFOcN7ZQuLY6Cbp7++z+zes/bT0eyufK9nRhabUnmB4knPOLv9kqT3
 XgW8TeqF6HptZkBvcyieE9pw+FMuHrC2JFHjrk0m+zHw4DqZarhtFCbYt8xn2tU2lXuXo3
 EOMWNT4Kq+YBIsheZC7lgfo/QcTdzS0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-bY-B7-YNOjuh-tzIqq1Vcw-1; Tue, 13 Sep 2022 18:15:22 -0400
X-MC-Unique: bY-B7-YNOjuh-tzIqq1Vcw-1
Received: by mail-ej1-f72.google.com with SMTP id
 qw34-20020a1709066a2200b0077e0e8a55b4so3030891ejc.21
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IDL/AgTFWdm+PP/N7/EovNn2CFq5LCV9poLaDqClvoQ=;
 b=v5uxzWZ/suoLwN5CEPp0BXRTxReewho4ONda0Ib9rDEYj+R0py3v3NtytLMICG3LhG
 T/bTJIRN2HC8diQCQ2YE45VSsmIKPTG5fNqH2BTcOWzmbHP5pZwAd8u5oL9xwnnnesWW
 R7mZCMbeughOMJ7n1LNHY/0mkqiN1kyEr5HXeNaw27obSr/YjbaLmeU5jzOlHtzAsqxh
 h1zBpBne0ZBlFDr2I/+81MaENE8Za7joxeN2yr2awTr0NhAALtlbAJrmUgm46+WwrRuN
 R9ltMHxOuIIyQIb1WT3YFKTv847AkkBxUqaTQCpnf23AXlJWJyARE1ffEHcmu9wDYXje
 kzAw==
X-Gm-Message-State: ACgBeo0cGyhHGQUSrCB4A2oXUuheulc4D+dfYBbBbvHSHlCCPCD8E1SF
 AIRqhbIdq2+ZuLJpRkV/+Rf129NynyjU1y3UhIvUQg9Xp7YXpZ4Q0XmJ5/6GBfiZv0bl2g1/JTl
 fzCdLKktYp+WTe7POkTqpkmLwcuK0
X-Received: by 2002:a17:907:b0e:b0:77a:d97d:9afc with SMTP id
 h14-20020a1709070b0e00b0077ad97d9afcmr12925517ejl.199.1663107321099; 
 Tue, 13 Sep 2022 15:15:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4JrvdPCBd450Ne/WjVuyF2pyNqC+OiG8iXf5IJ2s1pVhR/kJe8SiZhf2Ce+d/6Pv1DDaJDow==
X-Received: by 2002:a17:907:b0e:b0:77a:d97d:9afc with SMTP id
 h14-20020a1709070b0e00b0077ad97d9afcmr12925509ejl.199.1663107320962; 
 Tue, 13 Sep 2022 15:15:20 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a170906c19100b0073dbc35a0desm6628493ejz.100.2022.09.13.15.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 15:15:20 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 6/6] drm/arm/hdlcd: debugfs: protect device
 resources after removal
Date: Wed, 14 Sep 2022 00:14:56 +0200
Message-Id: <20220913221456.147937-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913221456.147937-1-dakr@redhat.com>
References: <20220913221456.147937-1-dakr@redhat.com>
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

