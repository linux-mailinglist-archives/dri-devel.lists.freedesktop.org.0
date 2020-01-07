Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD96133CC9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CD26E859;
	Wed,  8 Jan 2020 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F396E14C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 23:06:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z3so1435770wru.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 15:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXJ/0vyPOcylwX7dQ7AqYqzbWcm6Xny6nu2+z0FOmf4=;
 b=SzQP3MkkW9JiVVLB0Q5AWl9ynYczk1eWo56lKzhjHMYAgL4dqVwYVe+d4zLq7IGG+E
 6sjyRLDJcEljD4GDsoPqvuOXsfPBIXaZlV/7JQOkyCuXehAwjJhNybHUYy5Z5vlzNnDZ
 ojm8VASMXfBBnvdvuzRV37VlFgzD5KE4fzvicM94upMV58FI4Iz7SwtNdHRMPFmsse7V
 TAIL1Kz1SjxRxXsrpRd8sbRc/pyYzPY08UVCol5DeDNVgOzhjeB1iuSUkO+ZbVO0xDl8
 rT/WVhULD1GLl7l7FXJord3q/+308mnMIkdoHgox2+tnRgVZhARDTbdy+O32aBsGmQQM
 Mkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXJ/0vyPOcylwX7dQ7AqYqzbWcm6Xny6nu2+z0FOmf4=;
 b=Z77qVpGCy07VOS7r4p3mrQlkosotoTVQBR0+pYvvf5XPF+M456Tuc8xAWiSV2Cg2uT
 KIGQmd5GnitesR7dhzDx+m9Nk9pHqQd7ne46B0xOMfi5HFSiVi88in6JgqEk9+NmT8yt
 3ojlFUXGuKcdeC6uJQ+cT5rWXbsUp2er3LuH3AEjSTPZASaxeqp6EbNuitGWEzKFZllY
 vlk1lq9UArajRTXY22EGF4EhrD5xSlRIn3CP77B4erLgrS5bKZ7VGuq5nYhxdtKrm4VK
 B/lzhdDFP3xJjU/EJPzBJPR0LKZ0rnISjXbV7wgOgw8h1OW7+c/Y6dAC21QvJwm20oOu
 dafA==
X-Gm-Message-State: APjAAAV4uTa28DVx+DNn04YOSfnyXU5rdPCY/4Lyb2E+3hdRijwWnn0t
 lSZOoK9XzpDYpDH6CaEu+P41M7ABW1A=
X-Google-Smtp-Source: APXvYqyTpkD+YLeAxyWAoG8+IkEVG2zuH4q7SHZOXRueqxuzGo3+htimrqNb87QNSjKXFAZDdhKYXw==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr1253219wrq.137.1578438411229; 
 Tue, 07 Jan 2020 15:06:51 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g21sm1335912wmh.17.2020.01.07.15.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:06:50 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v1 3/3] drm/panfrost: Use the mali-supply regulator for
 control again
Date: Wed,  8 Jan 2020 00:06:26 +0100
Message-Id: <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dev_pm_opp_set_rate() needs a reference to the regulator which should be
updated when updating the GPU frequency. The name of the regulator has
to be passed at initialization-time using dev_pm_opp_set_regulators().
Add the call to dev_pm_opp_set_regulators() so dev_pm_opp_set_rate()
will update the GPU regulator when updating the frequency (just like
we did this manually before when we open-coded dev_pm_opp_set_rate()).

Fixes: 221bc77914cbcc ("drm/panfrost: Use generic code for devfreq")
Reported-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 22 ++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 170f6c8c9651..4f7999c7b44c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -74,6 +74,7 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
 int panfrost_devfreq_init(struct panfrost_device *pfdev)
 {
 	int ret;
+	struct opp_table *opp_table;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	struct device *dev = &pfdev->pdev->dev;
@@ -84,9 +85,24 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		/* Optional, continue without devfreq */
 		return 0;
 
+	opp_table = dev_pm_opp_set_regulators(dev,
+					      (const char *[]){ "mali" },
+					      1);
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
+
+		/* Continue if the optional regulator is missing */
+		if (ret != -ENODEV)
+			return ret;
+	} else {
+		pfdev->devfreq.regulators_opp_table = opp_table;
+	}
+
 	ret = dev_pm_opp_of_add_table(dev);
-	if (ret)
+	if (ret) {
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 		return ret;
+	}
 
 	panfrost_devfreq_reset(pfdev);
 
@@ -95,6 +111,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
 	if (IS_ERR(opp)) {
 		dev_pm_opp_of_remove_table(dev);
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 		return PTR_ERR(opp);
 	}
 
@@ -106,6 +123,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	if (IS_ERR(devfreq)) {
 		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
 		dev_pm_opp_of_remove_table(dev);
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 		return PTR_ERR(devfreq);
 	}
 	pfdev->devfreq.devfreq = devfreq;
@@ -124,6 +142,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
+	if (pfdev->devfreq.regulators_opp_table)
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 06713811b92c..4878b239e301 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -85,6 +85,7 @@ struct panfrost_device {
 
 	struct {
 		struct devfreq *devfreq;
+		struct opp_table *regulators_opp_table;
 		struct thermal_cooling_device *cooling;
 		ktime_t busy_time;
 		ktime_t idle_time;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
