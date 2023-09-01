Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D558F790413
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE95A10E062;
	Fri,  1 Sep 2023 23:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222F010E062
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:40:56 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6bcac140aaaso2017390a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611654; x=1694216454;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MjN3sfEO+JM922O5awQYKULh62YjERT8p0jq8P8wGb0=;
 b=hYgpjjpGxcp3f1zTN9MnJAG5gwohCPZgwz7SiWKxOFoH8UcTfK/zo5vQ6ikN312dEw
 NmwOZv4LSrtYgWWfQapk42tMesg6oozihJC6q0ITZsH548tYJynzprOWXrtVIGc9iJ8d
 GHxDXy3HikTtopYHCCjk3pqAJH5aTfH1LnbLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611654; x=1694216454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MjN3sfEO+JM922O5awQYKULh62YjERT8p0jq8P8wGb0=;
 b=Kcyp57ZKjXPcUBdEUuda7ML35G0D4B7dbKbS3gnq5XmWqwhSEIzI9VlONjzgtD2A0p
 KcaazyV9wQQkRP3mzRoyiGTxAkzR3YKHpFBTAULh9lslq8Abad6wl8ThKyLI7q0Re2G1
 yNC8yxCv/64+w6iOB1mAHT2gdsCqGuM7rFIlK0/aBHpe5BYzzMwWNaeMFl6V1qW2M10Q
 QRKyD5c3bWiHH+DiRcCozN3YnAa+cWdOPErSC00JlNnoP62f4IVyEWM2Zko+hbhVJbih
 dap1ltqt1ZklzwcqSqMZj7DYoNPJey5AUOC8BZgfTVKDAUM6PBY3+rXPiqTRyEE4SmpF
 Bq7w==
X-Gm-Message-State: AOJu0YxSj3RWe38ZT7QEHaKDF+HywqPgkFzA0t2a2/+cOWw9CCEAvpyN
 dR+qo+hon8muYfgb8toio1vVuln/wf/V6udXBpxMEQ1o
X-Google-Smtp-Source: AGHT+IHtZYYm3kAb6nsZHXag2Hv09GGqSDmAQq+JJIcuHqOc1L2+l/u8XFzy1Ix3zXRbzhU1ARWddg==
X-Received: by 2002:a05:6870:4290:b0:1bc:3f6:579b with SMTP id
 y16-20020a056870429000b001bc03f6579bmr4478955oah.22.1693611654700; 
 Fri, 01 Sep 2023 16:40:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:40:53 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 4/6] drm/ssd130x: Call drm_atomic_helper_shutdown() at
 remove time
Date: Fri,  1 Sep 2023 16:39:55 -0700
Message-ID: <20230901163944.RFT.4.I4752a39ad9f8fd08b32c2b78a8a3e40491bfb5eb@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
References: <20230901234015.566018-1-dianders@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown() at remove time. Let's
add it.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS driver remove comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

NOTE: I'm not 100% sure this is the correct thing to do, but I _think_
so. Please shout if you know better.

 drivers/gpu/drm/solomon/ssd130x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 5a80b228d18c..dc06fd82fd30 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1131,6 +1131,7 @@ EXPORT_SYMBOL_GPL(ssd130x_probe);
 void ssd130x_remove(struct ssd130x_device *ssd130x)
 {
 	drm_dev_unplug(&ssd130x->drm);
+	drm_atomic_helper_shutdown(&ssd130x->drm);
 }
 EXPORT_SYMBOL_GPL(ssd130x_remove);
 
-- 
2.42.0.283.g2d96d420d3-goog

