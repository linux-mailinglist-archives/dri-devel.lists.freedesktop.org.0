Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C245BDCFE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 08:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E475010E2A1;
	Tue, 20 Sep 2022 06:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DE110E2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 06:17:02 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d82so1771685pfd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 23:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=B6hSOiP8g8zcB6u4AKVglZyJoOdoT3fhziHHZ2QNmtU=;
 b=es8BM0wHkkzQAHxB0FX0GkmJEUxTn7K2VBAKKB3V5Bk5RYldxiY1m/fyt7ORwTs7Sw
 csjSUYauRJ+zWLh+31MhKh1QzaG4X2QflkslS3Y/R6eq0RtQsDNF482Pvyx95yEB2h2v
 u++rZmqHdt9U4myFqAn+aqKWT6ORWPMZkRK4xisBADSw4nOutil1IZOlVAZ8JJ2hPGGD
 CBe2me9EEDC1VuuzhhUkCsuI6roiSSWN8m4N6roaRxJ+rRA3pFvXig9IFw5i5lpSPTIU
 HxTQn916nob2CMwjr6VmXfGxkOtfohiNsN3Aj2l0FtreW0PLFlZGuGLpoPpQC45mI56z
 H7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=B6hSOiP8g8zcB6u4AKVglZyJoOdoT3fhziHHZ2QNmtU=;
 b=r51pxywPHcbj2qFo2GoF2ke/7lTcFYU9OZl30+Lp/HsbeN98RKPb/I843V9I4QzvUk
 U09Nd55EADAh2Q+OTSBFUdWtec+5Dalik5R+Mp7wokCMOL+ck01b4r3c0utkovnUEiKR
 uX/lx84wJfCGMqyPGN6WOig7EDauREx6E7BBeqZepWiiyUanxA2wY/BXSImVO+qmHg7n
 Hg0i5flD7/JXef3aSz6c383O4HcHXr5oVi7NFWFYMyXn2SFDmS9UljGLYcQst9BEWzgq
 JPEcw4HRnH5HemUz94iWsuAg3UR6krz9NkLVfFgwmjZtqnNFRi73b1j7yb4MbWyGB2pI
 8lNw==
X-Gm-Message-State: ACrzQf39rc2sChboHTXcXsOl6cMPFbpc840ZVo09N7Y2VrGl4OX9fSHB
 xYPPw6V5Af30qAZ9BBKhhAk=
X-Google-Smtp-Source: AMsMyM7otqRaKgalLurxjXjKVQ0peXA1t+7Kmgwpb0wvpEVxfKpohw0FQbPrQWluYT96xGyZzbbHcg==
X-Received: by 2002:a63:4918:0:b0:439:1802:dda3 with SMTP id
 w24-20020a634918000000b004391802dda3mr18537836pga.467.1663654621642; 
 Mon, 19 Sep 2022 23:17:01 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e1d100b001708c4ebbaesm461317pla.309.2022.09.19.23.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 23:17:00 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: andrzej.hajda@intel.com
Subject: [PATCH V2] drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more
 robust and safer
Date: Tue, 20 Sep 2022 06:16:55 +0000
Message-Id: <20220920061655.214785-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: neil.armstrong@linaro.org, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

The implementation of strscpy() is more robust and safer.

That's now the recommended way to copy NUL terminated strings.

Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
v1->v2
using DRIVER_NAME instead of "DW-HDMI".
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 7d2ed0ed2fe2..8cb6177f976d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -542,8 +542,8 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	strlcpy(card->driver, DRIVER_NAME, sizeof(card->driver));
-	strlcpy(card->shortname, "DW-HDMI", sizeof(card->shortname));
+	strscpy(card->driver, DRIVER_NAME, sizeof(card->driver));
+	strscpy(card->shortname, DRIVER_NAME, sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s rev 0x%02x, irq %d", card->shortname, revision,
 		 data->irq);
@@ -561,7 +561,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 
 	dw->pcm = pcm;
 	pcm->private_data = dw;
-	strlcpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
+	strscpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_dw_hdmi_ops);
 
 	/*
-- 
2.25.1
