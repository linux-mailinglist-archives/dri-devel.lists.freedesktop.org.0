Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F6404A7E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAF06E57A;
	Thu,  9 Sep 2021 11:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76FC6E57A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:46:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1CBF6113E;
 Thu,  9 Sep 2021 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188000;
 bh=5ANBYZHGT6lDyKTeylFDsecgH0x2gUQwZcIgDogmUro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDYjS8fltVmpLJaqTnPrxPYZSDZAoI/QUUrXOH7X4FpHwXu/DDlOW2XZQQvvki5rO
 jK0LhbsyTW+7QQxznpj75iKW5aGBpZa6sTnBVqYSivh35GY4MirigqHbKI9eOIapQM
 ZPnj9OYWE11hZf6Yw9cltRUo0hGdOsbSSi14X8dnNX/bSfcVDrv0oCNLLXIxE6XSP+
 nyKursH+xGce8dKiMkGe9jADNUAMf/f8CzTzlKskmCC7wvxSG8Qwd8OheUVo+OOzMF
 a5gpWFH7l5cwJLG2cULiinTZ64ceSRX3QdAiBlWpvfOIT4AnKO20Ms+YvQXByPUtnU
 0/qmrln3FUquQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dom Cobley <popcornmix@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.13 003/219] drm/vc4: hdmi: Set HD_CTL_WHOLSMP and
 HD_CTL_CHALIGN_SET
Date: Thu,  9 Sep 2021 07:42:59 -0400
Message-Id: <20210909114635.143983-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

[ Upstream commit 1698ecb218eb82587dbfc71a2e26ded66e5ecf59 ]

Symptom is random switching of speakers when using multichannel.

Repeatedly running speakertest -c8 occasionally starts with
channels jumbled. This is fixed with HD_CTL_WHOLSMP.

The other bit looks beneficial and apears harmless in testing so
I'd suggest adding it too.

Documentation says: HD_CTL_WHILSMP_SET
Wait for whole sample. When this bit is set MAI transmit will start
only when there is at least one whole sample available in the fifo.

Documentation says: HD_CTL_CHALIGN_SET
Channel Align When Overflow. This bit is used to realign the audio
channels in case of an overflow.
If this bit is set, after the detection of an overflow, equal
amount of dummy words to the missing words will be written to fifo,
filling up the broken sample and maintaining alignment.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210525132354.297468-7-maxime@cerno.tech
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index edee565334d8..155f305e7c4e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1205,7 +1205,9 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 		HDMI_WRITE(HDMI_MAI_CTL,
 			   VC4_SET_FIELD(vc4_hdmi->audio.channels,
 					 VC4_HD_MAI_CTL_CHNUM) |
-			   VC4_HD_MAI_CTL_ENABLE);
+					 VC4_HD_MAI_CTL_WHOLSMP |
+					 VC4_HD_MAI_CTL_CHALIGN |
+					 VC4_HD_MAI_CTL_ENABLE);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		HDMI_WRITE(HDMI_MAI_CTL,
-- 
2.30.2

