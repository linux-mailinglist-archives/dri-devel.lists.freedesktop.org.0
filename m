Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB8607F81
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 22:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F2210E2F7;
	Fri, 21 Oct 2022 20:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4679610E2F7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 20:07:31 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so7631479pjq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vh4YIgtLxUw6WgoDzxlF5MErsV4sylhzFrfQBBr3GjE=;
 b=in9tvOX8bP32FVB9PxADmtd00bHTP0G4N3hxe3LC3/czC3+AWMUbkfNVT5VKN6rpMn
 /FRxKs2wOQFDbegwIP+zAXvI1//2TkDnk8DmFTbVZOInjumlV9KGNaPX4xjgQ0/ocm8P
 h8TDMtEEctwPCFhtwjSSryElS7YDqI2e3aV+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vh4YIgtLxUw6WgoDzxlF5MErsV4sylhzFrfQBBr3GjE=;
 b=ovFX8hK8aG2HSOTlhv3Q7rxqDRc03xvYxUgGtnGq7T0mS+Z1VKHUpSeBcgkh2F7DXx
 PG2AuI2iWowxqe3cF+mUsPj8Q/knC+AfQPGfd5fESvUh3e/PWRosGKy5WW7i11XksEVc
 /A5RHfuUdm9v4bAyPpuHEWV8a98bs1/Z3GiQwIvmWPh00igi5AB1NWGH0XiZgTVepzTf
 sdBdFpg0W4q5ofJsDloSeUyQi2kftuA2ELib1cUNYZqa6aaClNovFleS1/pROZzBxu2/
 Po4xbaYm7P3LcULSbNY/Y2caXQ90eg7YdpLhuiDeSd1zoJPEVKRdZVgXJ2Jsl5+zh62Q
 gx7Q==
X-Gm-Message-State: ACrzQf1pa2vIv68mQe+QCUZxuVA1LQQKSzgUSlAf/rpMNrEKkOZ7sFBw
 d8Yk1kdGjxvSsmyiYdYKbgykLsG78h84EH4r
X-Google-Smtp-Source: AMsMyM57zE472B2sgzDvVJYufYcmqXY3A2Omv5vWUX4NlKuHUPlbj7J/SwqISYDA6oDu0wnOsPRy2Q==
X-Received: by 2002:a17:902:e1cd:b0:184:aa71:217d with SMTP id
 t13-20020a170902e1cd00b00184aa71217dmr20515106pla.77.1666382851068; 
 Fri, 21 Oct 2022 13:07:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:361c:b732:581f:2329])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b0017a032d7ae4sm10209137plg.104.2022.10.21.13.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 13:07:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Dump the EDID when drm_edid_get_panel_id() has an
 error
Date: Fri, 21 Oct 2022 13:07:07 -0700
Message-Id: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we fail to get a valid panel ID in drm_edid_get_panel_id() we'd
like to see the EDID that was read so we have a chance of
understanding what's wrong. There's already a function for that, so
let's call it in the error case.

NOTE: edid_block_read() has a retry loop in it, so actually we'll only
print the block read back from the final attempt. This still seems
better than nothing.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_edid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 47465b9765f1..d63e26ec88b1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2721,6 +2721,8 @@ u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
 
 	if (edid_block_status_valid(status, edid_block_tag(base_block)))
 		panel_id = edid_extract_panel_id(base_block);
+	else
+		edid_block_dump(KERN_NOTICE, base_block, 0);
 
 	kfree(base_block);
 
-- 
2.38.0.135.g90850a2211-goog

