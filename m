Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E85466639
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 16:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92C46E426;
	Thu,  2 Dec 2021 15:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6516E426
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 15:12:09 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id q64so183668qkd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5win83yfqpxb3G0uDT7ZMvmOCj3Tw1TRZr233dyvDuc=;
 b=mo+uivjzmHsuRBaFi8uHymmczEF4b/SLFl7A/ASUdGfiz9FYm3VHvfLfmvHEwQrhiE
 A9B+Q6R4HBswpJbv52KBTgTLuVgrceBao9La0Kj9ajy8Mb0jNAkXUoM93OvkRiYviWxf
 0u9xWvjCiOnuxPkwQAY6zmKDmY4Kl61B7jd6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5win83yfqpxb3G0uDT7ZMvmOCj3Tw1TRZr233dyvDuc=;
 b=yaEQFuxDwMRtLvUDOKbuqSvukBGEaQ3NAgCe6LhlTx1n0XZQLAlzPQEEmMsK2NUOIy
 tMT4IOp9KKttEpAzuf9QYHkARmHJkkczho4lQSnEEF2baoe/dqL9J+RLMBQBY5p1VYi8
 TXrEQMNzU8I/fjJ6ytNEeJ0ATZBr7JDdthxuYfHzelDK8ocvRZQqyafVZf+VrEFQeTYn
 BSC/H+OgPeVAsjJQzUM9Xl1/s4NMC5RNeIowln1BgG5iCtLmKKgagkx2E7WODUB7SxcO
 V808cAGDPuIrG16jhu68DaPgq0PS5OBeb6WN7/5Qz1lasL/WKytrHZJURqWcMQ33N6o6
 tKJw==
X-Gm-Message-State: AOAM532NaK+MqJlhujxVYOgTmcokTH27hl0VsT65mTkULqhM/Z0db874
 riIDmP4jxOa6Fa/KNLXVB7dtxykE7fVGCg==
X-Google-Smtp-Source: ABdhPJyKW64deXqmMjT9ZCpai94tANaoaVT4bykBTn5Yw2GwqCoFkWdSZwlMgR1aQYIkqnzgC7294w==
X-Received: by 2002:a37:6103:: with SMTP id v3mr12191774qkb.694.1638457928563; 
 Thu, 02 Dec 2021 07:12:08 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:f841:769c:df54:f26f])
 by smtp.gmail.com with ESMTPSA id k16sm1726988qtx.92.2021.12.02.07.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 07:12:08 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: send vblank event with the attached sequence rather than
 current
Date: Thu,  2 Dec 2021 10:11:55 -0500
Message-Id: <20211202151200.3125685-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
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
Cc: chunkuang.hu@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, tzungbi@google.com, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@chromium.org>, matthias.bgg@gmail.com,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
drm_handle_vblank_events loops over vblank_event_list to send any event
that is current or has passed.
More than 1 event could be pending with past sequence time that need to
be send. This can be a side effect of drivers without hardware vblank
counter and they depend on the difference in the timestamps and the
frame/field duration calculated in drm_update_vblank_count. This can
lead to 1 vblirq being ignored due to very small diff, resulting in a
subsequent vblank with 2 pending vblank events to be sent, each with a
unique sequence expected by user space.

[How]
Send each pending vblank event with the sequence it's waiting on instead
of assigning the current sequence to all of them.

Fixes igt@kms_flip "Unexpected frame sequence"
Tested on Jacuzzi (MT8183)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 3417e1ac79185..47da8056abc14 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1902,7 +1902,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 
 		list_del(&e->base.link);
 		drm_vblank_put(dev, pipe);
-		send_vblank_event(dev, e, seq, now);
+		send_vblank_event(dev, e, e->sequence, now);
 	}
 
 	if (crtc && crtc->funcs->get_vblank_timestamp)
-- 
2.34.0.rc2.393.gf8c9666880-goog

