Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C300A4ED92
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1993610E6A5;
	Tue,  4 Mar 2025 19:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Kvh9gWt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A1610E287
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1741117160; x=1741721960; i=wahrenst@gmx.net;
 bh=YKYjKZx8w3A6sLa5TEwXKwSikZb7/+1yvyI0VrVHj+I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Kvh9gWt3yOtA3ZMI3qfi/M0rBNHLL3+sqZzi5VXsv4UVqEFja9mxeecsn1TqA8Nh
 DkgLZG7+zURJfltqereB0wBVFQCPGL4UebNDQuWGBdkLhnoCUYjbqaUf4caazabts
 9RU/7774HgbS3bJdX+ozkl/5NJ0wkUtLCid1TmUBBfBOr3YUDY1tsoIv4q7aHeciy
 vKsaryWx3Qyy5kVeU1DNrD3+upRDhqyjm/5xfPN3z2e7ZhtBDu1OOzVXa6WSemMQE
 dFeG/1AFCoQfDeZw4afzujhkMR0y8wnMVojFJeH0uUSGD6bpsqZ9jBXOvvqehPl+q
 VeTh3AjWs+zaTx6Kgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS5A-1tQyir3ySA-00eBFr; Tue, 04
 Mar 2025 20:39:20 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Turner <david.turner@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com,
 linux-sound@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio driver
Date: Tue,  4 Mar 2025 20:39:12 +0100
Message-Id: <20250304193912.5696-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304193912.5696-1-wahrenst@gmx.net>
References: <20250304193912.5696-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:828YawoCgxuPpSR9+9qJ96Z7jzk9roP007an1KW9tb+BK/LDHaY
 bjobejWuaK0fCgpdvbBqmi6cn8yXVO2SpZ/iJS/fh9ef+fYjiSZE1E7u33zMvm+WyNglG/Q
 wKgPxB10TirdtT/tFXxPHvTly/BwIV+dt+ZKG3Sy2/JBpHvvZxT+vwpmgTFm2aJLL+jXyrl
 TD0bPMeytBB3xkmJ0+3xQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8KsM8bDU6D0=;7cnyxoolrgQ8aLz45XRKIRtzeba
 rusVi5mA0zHkdWCG7KWMOThWvxKqeGQhuM4/dgleXqqlA4IWgvnMPWbJAXqUQIlBZjBIMd184
 6H4eZXkuEArd+ZSsWI+dyJZEd+O5e9C1agz9loz760JC9aU2foDvpSJ0nsLJ/2CQYCtHj96Wb
 RcstZiRxsPM4MvcTtJjDD8iivaXQ6L+bZ4Hx/W4hmP4LckSUsMHQ74/CdsBwVyqX7VLHhxC/r
 mOGQoaqfH6CyoOB1SaqKeuBpUSXM4bKoGFxvXP6fnSa1CJzCA7x+WaFizQXLXY1d2F2HCz3Ku
 iKt1wtsh3l75bXoLBZgiJCmrgX9CytR01AkiZTYSoByqU4U/DtMSHyi/6YRKYqU4tHgmZlpgY
 mUBErJnKI9Mjtmf39oZf8/NXiG9xyMklCd3MbvqINxbfyuThFOZQoSupCvwS3TO/pmakdTz29
 keShw8qRggglsO8iQ36pbO9FE/uxuJW/fUFqdiAWbC0vD06szt2TyWK5J0VekiNkFyl4z6Cqc
 uc228Wbxy0Z5LWSpSMLCDc9j+//bmy/gKhc30WgnZuQBBYxiCl9rRcmhoCzX00wsfdKGrSFFF
 6J6tcMvJjJOmIXofB6P+WW1uB/GI5oNjmpyGfiDlTgL+iIL71hLHUAYr+GSkVWQvsPzH+gg7o
 jZ2Nq3uEwF9HlsTbimH7891WOF4IJL880VT15ES/uC0m5YNYzfCv7QHEmCdlOeBvM6wqP4TwK
 s9DHUezlLcrk4NbA0Lu89BNCfm89GNStAEW5g8sBy64wTZDIHp+X+qpFSX0sMI925v4sqM33A
 HtVOpIY4tPu24dXnqcNtIrBk0zL6rQ5v2mwzpkvoVMnFuW4i9iYJ/ckCir6RK0I9fb9FgbUn/
 rhQqBLV8mhkoVw4aCiujiB3XcnBQ1XMv/CgdpH0c2bQvzx5yh99OQ/qFSLYPGCN5ELk8QGXCB
 fMcwSR5zVRzypai1sZ3Tf/jFD4mzXdlNwf5GmkAZfV4CPhZCuUQYFgzImQ39Ivs8wNVTKrhRT
 +m8R1aykJJWZ6vCqDF6OET401ATI+HZ942Vqp9Jjo8CYHSQIjHDAoaaWkwjkZ1TEWd550zpGZ
 dKWJqq35jsq0yb9mTwE08Qh/b0StUGiG7YrdAPlFiaqyJz7JtApq9br6B0RVnVgwRzNFQsLur
 I9Qr09UTPUcDtfJ+4o63a9W7AaGFafxDVn7R30DFuuDe18v1JXySaDAMHEB3ljVZK3JnTqqB9
 uwz5/0pY13FCPjpw5FChZdYcA77TTwZOcQMY4Q1eE6pBqP+8YM7FOQObDzgvRFKxwBHrIs5ea
 39K+YDYaCXKFkguQrrbhVl5nnXxZyoo9/oiyyF1zhb2HInNRcPlSnggTecEyofe/+LRcSdSKb
 m8449zMtWikQVOxm730V4u3wXJLCX1alY4BALPr5LxFXZvvb5HRgDl3MWH
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

From: David Turner <david.turner@raspberrypi.com>

Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
when to add/remove HDMI audio devices.

Signed-off-by: David Turner <david.turner@raspberrypi.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 ++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi=
.c
index e4b027616d04..f46a135568b2 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -51,6 +51,7 @@
 #include <linux/reset.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/hdmi-codec.h>
+#include <sound/jack.h>
 #include <sound/pcm_drm_eld.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -2203,6 +2204,22 @@ static const struct drm_connector_hdmi_audio_funcs =
vc4_hdmi_audio_funcs =3D {
 	.shutdown =3D vc4_hdmi_audio_shutdown,
 };

+static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct vc4_hdmi *vc4_hdmi =3D snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component =3D snd_soc_rtd_to_codec(rtd, 0)->co=
mponent;
+	int ret;
+
+	ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &vc4_hdmi->hdmi_jack);
+	if (ret) {
+		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL)=
;
+}
+
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =3D
@@ -2316,6 +2333,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_=
hdmi)
 	dai_link->cpus->dai_name =3D dev_name(dev);
 	dai_link->codecs->name =3D dev_name(&vc4_hdmi->connector.hdmi_audio.code=
c_pdev->dev);
 	dai_link->platforms->name =3D dev_name(dev);
+	dai_link->init =3D vc4_hdmi_codec_init;

 	card->dai_link =3D dai_link;
 	card->num_links =3D 1;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi=
.h
index e3d989ca302b..a31157c99bee 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -4,6 +4,7 @@
 #include <drm/drm_connector.h>
 #include <media/cec.h>
 #include <sound/dmaengine_pcm.h>
+#include <sound/hdmi-codec.h>
 #include <sound/soc.h>

 #include "vc4_drv.h"
@@ -211,6 +212,12 @@ struct vc4_hdmi {
 	 * KMS hooks. Protected by @mutex.
 	 */
 	enum hdmi_colorspace output_format;
+
+	/**
+	 * @hdmi_jack: Represents the connection state of the HDMI plug, for
+	 * ALSA jack detection.
+	 */
+	struct snd_soc_jack hdmi_jack;
 };

 #define connector_to_vc4_hdmi(_connector)				\
=2D-
2.34.1

