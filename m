Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143E9D70D5
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9740110E4FD;
	Sun, 24 Nov 2024 13:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p8qAGank";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D5710E4FC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:41:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7EB5C5C5768;
 Sun, 24 Nov 2024 13:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7CAC4CED3;
 Sun, 24 Nov 2024 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455670;
 bh=tNEtgZZlaWDdjHOifOd0efr1ZRGD7UE8MF/fMJhw1AA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8qAGank6tAKYWI4eClmMcZaU9zkEJKVCxi+Gs0YU+noJw/t57g4eZ0HaoyqECo2M
 EBG6oLt8qB5WM5ZxrlbAj+qDAZi6NN0FsByVBxNL3ww/3VJ7E6ulaMsMDmMTJkOaRE
 WsE6qdUq3UzsJHbluqBZnXBW4exAS1VNmCexGzuwk6sAX9mtkGvL0bgq/etTwEd9/K
 iW1QylrV7pZjRKRia7VETIzLo+AQUa8rtmRRiEjbh9jyA1J7mg575CSrTwBz0dvJtC
 NDbXyNuCWwX1zOjcfR2vPzzYADcCxaBzLihpj0DKO9N84DGHcGwbNkMEzM6ryEtfZB
 dUeuXaj8VcZWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dom Cobley <popcornmix@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 03/87] drm/vc4: hdmi: Avoid log spam for audio
 start failure
Date: Sun, 24 Nov 2024 08:37:41 -0500
Message-ID: <20241124134102.3344326-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

[ Upstream commit b4e5646178e86665f5caef2894578600f597098a ]

We regularly get dmesg error reports of:
[   18.184066] hdmi-audio-codec hdmi-audio-codec.3.auto: ASoC: error at snd_soc_dai_startup on i2s-hifi: -19
[   18.184098]  MAI: soc_pcm_open() failed (-19)

These are generated for any disconnected hdmi interface when pulseaudio
attempts to open the associated ALSA device (numerous times). Each open
generates a kernel error message, generating general log spam.

The error messages all come from _soc_pcm_ret in sound/soc/soc-pcm.c#L39
which suggests returning ENOTSUPP, rather that ENODEV will be quiet.
And indeed it is.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240621152055.4180873-5-dave.stevenson@raspberrypi.com
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cb424604484f1..5cb7ddec99a1f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1920,7 +1920,7 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 	}
 
 	if (!vc4_hdmi_audio_can_stream(vc4_hdmi)) {
-		ret = -ENODEV;
+		ret = -ENOTSUPP;
 		goto out_dev_exit;
 	}
 
-- 
2.43.0

