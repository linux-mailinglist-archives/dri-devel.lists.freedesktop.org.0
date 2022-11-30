Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E663DFD3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 19:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D2D10E137;
	Wed, 30 Nov 2022 18:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE1010E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 18:50:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB5A061D89;
 Wed, 30 Nov 2022 18:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9EAC433D6;
 Wed, 30 Nov 2022 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669834251;
 bh=c72pU0lKPTDb1AMjAGwTPTIrii47UQAxQfe/Y1RNvus=;
 h=From:To:Cc:Subject:Date:From;
 b=acG3dsqbzFygpyxz0MLy/vdFb6tXI+7FIg2cdd1tdrQoIsYOne4gMBf6nsf10gt/V
 WjZ649rDzsNORKReyKi8FJAhqES8q5PItl8+zfiz9IQi5tVfbwX0dRHpninBaFh72d
 /B7uOgaUg8Xt6R9ep7eICDg1V18jUB5KdWsgKGkEkZq+IIPrDa7UngWKysa6H4N2Ls
 xsKT3+8sshE1/NjRc43HnNBlMWKysaIJ2YV9SCJVUT8MsInte/SsFvEqPvF0AOMhGU
 oNhXfNBbWssM2m7l+jY5UV1CNVVw6m10qCgRTXta5w+ZMt4fmu8EwGRGrE2coVC1eP
 fXPhBHNhhXFpg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH v1 0/2] ASoC/tda998x: Fix reporting of nonexistent capture
 streams
Date: Wed, 30 Nov 2022 18:46:42 +0000
Message-Id: <20221130184644.464820-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=broonie@kernel.org;
 h=from:subject; bh=c72pU0lKPTDb1AMjAGwTPTIrii47UQAxQfe/Y1RNvus=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjh6URwieLkg3d1z/EF8yTG1kMzpNwmuasEiCneHS2
 dFUs/mOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4elEQAKCRAk1otyXVSH0FS1B/
 4qjSdbeKeIxtIavIDYyo0CyyqV6314GSsYC/hDutdDkLGfeCSaoI9W3teV1Wh9pS+mxwmRZ+xMsuXD
 tF2luZKpv+eTwYimD7ig5X97OskX44/0aEI2gm1VAWnSdGv4sMSH20Bnxu0fEGl0sOTnMAbRtZhji+
 vNzKIjhuDxSH5zDi72uU9Z6JFWMhoxKtEyoPqyOcie6dkzpAnAqTeXzG8a7nAIY9lgeDJr7rUP5eDC
 EWkYjkZg1x5sqBShHnXsl5l7FtBixr/+klQUFtXYs3TzZHCM+mabmq+HOHzcN681bAFkhcDSA1rGpP
 yrOGd2Kb0/ZBpzOIKhCiQzKHwYp/BR
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

The recently added pcm-test selftest has pointed out that systems with
the tda998x driver end up advertising that they support capture when in
reality as far as I can see the tda998x devices are transmit only.  The
DAIs registered through hdmi-codec are bidirectional, meaning that for
I2S systems when combined with a typical bidrectional CPU DAI the
overall capability of the PCM is bidirectional.  In most cases the I2S
links will clock OK but no useful audio will be returned which isn't so
bad but we should still not advertise the useless capability, and some
systems may notice problems for example due to pinmux management.

This is happening due to the hdmi-codec helpers not providing any
mechanism for indicating unidirectional audio so add one and use it in
the tda998x driver.  It is likely other hdmi-codec users are also
affected but I don't have those systems to hand.

Mark Brown (2):
  ASoC: hdmi-codec: Allow playback and capture to be disabled
  drm: tda99x: Don't advertise non-existent capture support

 drivers/gpu/drm/i2c/tda998x_drv.c |  2 ++
 include/sound/hdmi-codec.h        |  4 ++++
 sound/soc/codecs/hdmi-codec.c     | 30 +++++++++++++++++++++++++-----
 3 files changed, 31 insertions(+), 5 deletions(-)


base-commit: f0c4d9fc9cc9462659728d168387191387e903cc
-- 
2.30.2

