Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2002FB446
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1226E856;
	Tue, 19 Jan 2021 08:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5F899F2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 04:42:37 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id 36so7080961otp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 20:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEGHa/fw+pXIBREv347tt5onnQ/KqN9oFmmcQKWLUbk=;
 b=xPxjbryp22HRmb8+ZYS9I7l0hi8pYHA5ePzpgkS6UYYEpN/jiV88/B+3gx3BuxiYoy
 GrwapJ3pmku3FfPj1n74s9jhefYdICmKIEZ3zsdWzcLgXSqk2ZHAtlkrBFcBFJSOS9Ti
 6IJuuIkPPFYJzVfwdtrCSO47BCyraDTdYEr2EY94v5mSQ2awnssGxkUapkJYTCodHODA
 1BrEDMh3sSGoINMl7w8HlZEZxy6FU068TI5p+2ngPpjYdyejQx4vKkP/jMLv8l8nq6Yd
 lUwb6YilPWhhc+wK3Q4UpRrkmorMcmC47Cs4YO5ILjVLsTckR+6kwmliEMFmaglxpnPt
 AX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEGHa/fw+pXIBREv347tt5onnQ/KqN9oFmmcQKWLUbk=;
 b=PmVIbMGz02EuGgWBTregZND0Nbf/fbKuP2fLkYu5SBFajH88UyXPIEL0/aqR8Rpe/I
 3mRvIzey/Rtyz5JikUTZSI6VzNqbAbpiW+TqddhQtALGTu/4YLd63q472fiOJQAAVh6a
 fgvQNC8F/juR1JAXkqDvnQDZ2zj462bEO2iQ9k3M0N2P8xlIeQvG5m908qrTni9C89/p
 TmwQwNspelMG0ftNpCkyPY8VP/Zj2JXvmZaFbDsVvSWmRVVJMlRknDSTyDZjCcLHGwAs
 HmmH+t0GbgEBwf0mzB2yQpfNFliZQ4MmKZzV3hTm0pmy2U6nbH0zf1rYiMR+2Yi29hXb
 n1+w==
X-Gm-Message-State: AOAM531tJCepFisbXP3OWwIaszEtwfLxK717s9oZPSrWNjqorhBNS5J0
 ogb45yaB23Hr/b5jb9zTVMiJSA==
X-Google-Smtp-Source: ABdhPJytkVwYJyjW3NPbkDVvL8+Dw0n40mrQBKACtAcutScv90A86ExydUH6m4vm8AS+/cwkWGubyw==
X-Received: by 2002:a9d:22a6:: with SMTP id y35mr2134126ota.20.1611031356353; 
 Mon, 18 Jan 2021 20:42:36 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com.
 [66.175.222.153])
 by smtp.gmail.com with ESMTPSA id r26sm2236901oij.3.2021.01.18.20.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 20:42:05 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
To: a.hajda@samsung.com,
	john.stultz@linaro.org
Subject: [PATCH] drm: bridge: adv7511: Add set_jack handler
Date: Tue, 19 Jan 2021 12:41:57 +0800
Message-Id: <20210119044157.3801598-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: architt@codeaurora.org, kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 broonie@kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 bogdan.togorean@analog.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With commit 55c5cc63ab, the hdmi_codec_set_jack() will report unsupport
failure if set_jack handler is missing. Add set_jack handler to resolve
this failure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../gpu/drm/bridge/adv7511/adv7511_audio.c    | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index f101dd2819b5..16de1a8ca7a0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -217,22 +217,35 @@ static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
 	return -EINVAL;
 }
 
+static int adv7511_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
+					    hdmi_codec_plugged_cb fn,
+					    struct device *codec_dev)
+{
+	struct adv7511 *adv7511 = data;
+	bool plugged = adv7511->connector.status == connector_status_connected;
+
+	fn(codec_dev, plugged);
+	return 0;
+}
+
 static const struct hdmi_codec_ops adv7511_codec_ops = {
 	.hw_params	= adv7511_hdmi_hw_params,
 	.audio_shutdown = audio_shutdown,
 	.audio_startup	= audio_startup,
 	.get_dai_id	= adv7511_hdmi_i2s_get_dai_id,
-};
-
-static const struct hdmi_codec_pdata codec_data = {
-	.ops = &adv7511_codec_ops,
-	.max_i2s_channels = 2,
-	.i2s = 1,
-	.spdif = 1,
+	.hook_plugged_cb = adv7511_hdmi_i2s_hook_plugged_cb,
 };
 
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
 {
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &adv7511_codec_ops,
+		.max_i2s_channels = 2,
+		.i2s = 1,
+		.spdif = 1,
+		.data = adv7511,
+	};
+
 	adv7511->audio_pdev = platform_device_register_data(dev,
 					HDMI_CODEC_DRV_NAME,
 					PLATFORM_DEVID_AUTO,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
