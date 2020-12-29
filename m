Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4E2E71DC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 16:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF75E892A0;
	Tue, 29 Dec 2020 15:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D41A892A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:37:34 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1McpaE-1kKfOc48AM-00Zv78; Tue, 29 Dec 2020 16:37:29 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
Date: Tue, 29 Dec 2020 16:36:50 +0100
Message-Id: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:/ke2IL3pG84yh0TYoQhPSKuh3XUYq3L7zVkr/LBpvLQNF7Ao2I5
 26an2MmlHy3PS9NTltIygGG8DTcyq8hg3dRv/ni2FkpxK2Pa0i3BfswFlFAttJ3YcOGZF0h
 0eODzdpWAKzzEh7wPluyNmOKeAzQwEqA+qonqDNbTxAsEtmkZ8YIFV5UGLlEUjngWaMG8i3
 wn1zh7xf+XLrDwjaI6gEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OwIBFkQlLQQ=:ARREXKtdKus1TAP2v53Ws5
 vgAbqwkI07eIUG5zVY7xiRSCWNYxFNTcU23UHZziQLR90KU/8jg8w2EftlZDR1+BeEkubdLbo
 qNYrYuroUJhu1kEjmKoWD8FRVGK63VzD9x3IYxEzwrIKN+ynFrOUWwH0atUs1ddLOmDlgRf/m
 e6nhih2Ztn1jErZQXGYV0FP9f5pjgU2DNGlQaFGE+Sp5YB8CmlCRj7dLPdRYaJO3oJKXlO+Mj
 8WiZfkXt3H4ZtKEnuQ1AmQP4NvWhsNR0oL/CfzahCWZ8UbsBA0Zzi6feBmJsgi7LIIZG8jtO/
 OUtFLayjmQrwHEm2j3jmBouV5xcycx+fBmUXj4qzoPSzA/EH06mD0dN3pwVYdsinjqJtqZh9V
 yOGdo+bKXBdeHuYC7oJq2OKJy+3fy0SfOpJRkWEP+zRLud4jcaNiuGoK8mfJ3hjTcu1q3QLFT
 +yamjBRxIA==
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During startup of Raspberry Pi 4 there seems to be a race between
VC4 probing and Pulseaudio trying to open its PCM device:

    ASoC: error at snd_soc_dai_startup on fef05700.hdmi: -19

Avoid these errors by returning EPROBE_DEFER in this situation.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5551062..e0f9357 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -909,12 +909,14 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 
 	vc4_hdmi->audio.substream = substream;
 
+	if (!encoder->crtc)
+		return -EPROBE_DEFER;
+
 	/*
-	 * If the HDMI encoder hasn't probed, or the encoder is
-	 * currently in DVI mode, treat the codec dai as missing.
+	 * If the HDMI encoder is currently in DVI mode,
+	 * treat the codec dai as missing.
 	 */
-	if (!encoder->crtc || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
-				VC4_HDMI_RAM_PACKET_ENABLE))
+	if (!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) & VC4_HDMI_RAM_PACKET_ENABLE))
 		return -ENODEV;
 
 	ret = snd_pcm_hw_constraint_eld(substream->runtime, connector->eld);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
