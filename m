Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFB9404323
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38DD6E428;
	Thu,  9 Sep 2021 01:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB076E424
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:46:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75BFF60187;
 Thu,  9 Sep 2021 01:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631151989;
 bh=Cf5iJfPCfnqcbMi2dOm33gudUTASml1cZBfmccBtGLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S98u4TOtY28UB8L4vBkae49h3dxhfLTjbeLPAnC1nRkU3S851RUG1jgagG37waExr
 T52DI7a35Q6v2BhVgQcnQ24a9gr9bCcQgmFdIkJvKTVegCbGFGT4F4kYmrJZ+VDnH8
 Ct5ifgvQe38redfMmjktzlGydA/hhBfLbCE6QRetJ0eUBZqqqiMkoTAhTDYoILMHNU
 Xwa0UrtGp3ybjLLqZO0TMKcm17MGSJPysP1aaMk33B0oBGpKanvd16IyowI4RLFsDJ
 ACTYMWnPO6V2Npv8vYrGw+IGD+oVvnOOxzXoWLTwUhGN3bdXvfMktocVZ09jpLzMic
 0b1J2WuLBOWBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dom Cobley <popcornmix@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 004/252] drm/vc4: hdmi: Set HD_CTL_WHOLSMP and
 HD_CTL_CHALIGN_SET
Date: Wed,  8 Sep 2021 21:42:14 -0400
Message-Id: <20210909014623.128976-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909014623.128976-1-sashal@kernel.org>
References: <20210909014623.128976-1-sashal@kernel.org>
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
index c2876731ee2d..ad92dbb128b3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1372,7 +1372,9 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
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

