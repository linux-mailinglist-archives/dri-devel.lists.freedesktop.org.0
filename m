Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1DD790E63
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B2C10E21E;
	Sun,  3 Sep 2023 21:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B565810E21E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5007f3d3235so1289661e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777318; x=1694382118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1gyG4EA+KF88AUvqDVJpMyc5ibJn0KvVHVwRSeTDTM=;
 b=L+jSU94kHfmwi7ZZab1UKuB7ywIzXOYjMlK69Of5TFhWflQHzx3jGvFMfNyfhPjs87
 5mQYTEaX1pW2qyCgYTpRmTLGrf/zKWtwgZwOsgqY5N4UrDbb8xclp3jrMhmY/xN13T75
 gvxUdejrv0tIZxxRZ48P2pJgniQgWsv4j0JUFCXg4EtXXmRUua9X3MhDFZDbvZUtOS8R
 MwV3hzeY3NzZRaPsMVoi7OW53+r7wneReRkich3JjfK/me+XYuWCtI4h3dnechRTmony
 l0iQ6AIlxLaeawTRtrsM3XhqzUn8l3jRNZrwLKolXsxGfsvAFyjM8bLgsSuC8CrAvxI6
 lLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777318; x=1694382118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1gyG4EA+KF88AUvqDVJpMyc5ibJn0KvVHVwRSeTDTM=;
 b=BCHXJQXWhRnFFa9eseK9Z8dyVe75hF0z5XJUaNXJ9BEDKsVJ289rhGEWwKP8MjRzEK
 +z9tmJ1GQxxe2FYkAh8jqmhiG+usAfznc6a0/0cq0TLJiOgyF8HQT3xq7B9j2fImbkkM
 9n8VC7Gpnbm07bk4byIDHqIznOteoHWnBT1rhxtlfePF/09uxxKCFGBgf/+Vtt3st05D
 E5PUlVrS1HZbvZTI0Sx64PC8ygiIk29cV8G1YDkI6OcmjWrH8udkQc5gJhQCIWXvUMVN
 UYsj0/432HldViZ4TcUK36IqXekSgEM9wNWi++L04UhRDoy4UN06v4gb30pfl3xCRuKb
 VoAg==
X-Gm-Message-State: AOJu0Yxu6tsmGrdEvujGkAXvFpP00m8QS2ObO9d+oXxMKXjZpHxcMv72
 d6+3F+Af97Dh/zidi7a2OnbXpg==
X-Google-Smtp-Source: AGHT+IFeimZforUo3xm2aTW6r+gvYdhOH4RX08O1w99CKPaCyS3lubUtNJ5cXMhhp/mnVE4/u6CHlg==
X-Received: by 2002:a05:6512:3b8a:b0:4f8:7055:6f7e with SMTP id
 g10-20020a0565123b8a00b004f870556f7emr6244283lfv.44.1693777317966; 
 Sun, 03 Sep 2023 14:41:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH v1 09/12] usb: typec: tcpm: support generating Type-C port
 names for userspace
Date: Mon,  4 Sep 2023 00:41:47 +0300
Message-Id: <20230903214150.2877023-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need a way to generate and return the Type-C port device names. For
example, it is going to be used by the DRM to provide PATH property for
DisplayPort connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++++++++
 include/linux/usb/tcpm.h      |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d962f67c95ae..9709b56a3046 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5539,6 +5539,20 @@ bool tcpm_port_is_toggling(struct tcpm_port *port)
 }
 EXPORT_SYMBOL_GPL(tcpm_port_is_toggling);
 
+/**
+ * tcpm_port_get_name - get the name of the corresponding USB Type-C port
+ * @port: TCPM port instance
+ *
+ * Returns a name of the USB Type-C port correponding to the passed TCPM port
+ * instance on success or NULL when the port has not been enumerated yet. The
+ * resulting string should be freed by the caller.
+ */
+char *tcpm_port_get_name(struct tcpm_port *port)
+{
+	return typec_port_get_name(port->typec_port);
+}
+EXPORT_SYMBOL_GPL(tcpm_port_get_name);
+
 static void tcpm_enable_frs_work(struct kthread_work *work)
 {
 	struct tcpm_port *port = container_of(work, struct tcpm_port, enable_frs);
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index ab7ca872950b..623c34788680 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -161,6 +161,8 @@ struct tcpm_port;
 struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc);
 void tcpm_unregister_port(struct tcpm_port *port);
 
+char *tcpm_port_get_name(struct tcpm_port *port);
+
 void tcpm_vbus_change(struct tcpm_port *port);
 void tcpm_cc_change(struct tcpm_port *port);
 void tcpm_sink_frs(struct tcpm_port *port);
-- 
2.39.2

