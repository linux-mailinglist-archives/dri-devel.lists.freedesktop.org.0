Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B28C63DFD7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 19:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E7110E11C;
	Wed, 30 Nov 2022 18:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A095510E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 18:50:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43F32B81CB3;
 Wed, 30 Nov 2022 18:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23760C43144;
 Wed, 30 Nov 2022 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669834255;
 bh=7rchmQwwpf0qyHWnrfpjZ55imPhKUM7g/iOAEeSrAZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SGWXV98zY7hb6M2PfO82HH5l/bJFjmNx97q7L9XtTtr4/PTvg9AKJWsVkIm7JJJlm
 +4ZOWjxJqopTH9DJaqplGyGpfkBtW9e5gdjshMCBc0jyL+Pa4AGKCx8d1IgkvpVGAd
 H6m1Ti55DJEGnfmh98KtUszTPBdFWFhzEs1ygDj2VgitynaV3BG8A2w1iTdSWNX/a9
 AgfwZkiupO/npHVgsoL1ImM4hgUgngAKgZyTZkC2CdWlhcAEpv4ndYNlj4F9eQ8m5p
 HDp8KsdPJFp5JQxdjloimKhYhY4HLMe2HOdM0+IjtSGIcWktmgL40BPtTBw8/oGoeK
 kVxkeFL7T2xLg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH v1 2/2] drm: tda99x: Don't advertise non-existent capture
 support
Date: Wed, 30 Nov 2022 18:46:44 +0000
Message-Id: <20221130184644.464820-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130184644.464820-1-broonie@kernel.org>
References: <20221130184644.464820-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=798; i=broonie@kernel.org;
 h=from:subject; bh=7rchmQwwpf0qyHWnrfpjZ55imPhKUM7g/iOAEeSrAZY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjh6UTedNv0xVqTR7Dw1xzmjfKdGNa9K5/CBent9LN
 wMp7dAKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4elEwAKCRAk1otyXVSH0AYqB/
 46oFKO98t1TlWfUOCgLyoWn4Cvg8+vjFQwPlheEw48l55Du9rYCeD2gp9R9KFle+DjuvrSNQzfXx3k
 sQYSLWy471HwAMVtpiyNdBy9WyDlve/KJmP9motnF8gk0y0Tpsjo9DkNrc1ib1iy6y3/Ji8TRDjova
 GzpVz0DYBCEsC7tSW9yWUdBkNJ1GEg2hqllztZvO+SBZ3gq4bGKr7b0SJ7KD2dsgXkUYRz8qT0wJLY
 4vwumBp+nPwaP9bOX65TjCc9QW1bhjwEsbqtaMRQ4Dh5IA1lPGb8B57wODdnHaJ3YU9vdav1X4vj7+
 +IIRUmfdRSs0Bugt51pOlis80t9Ydt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As far as I can tell none of the tda998x devices support audio capture so
don't advertise support for it, ensuring that we don't confuse userspace.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index d444e7fffb54..a14d2896aebb 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1174,6 +1174,8 @@ static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 2,
+		.no_i2s_capture = 1,
+		.no_spdif_capture = 1,
 	};
 
 	if (priv->audio_port_enable[AUDIO_ROUTE_I2S])
-- 
2.30.2

