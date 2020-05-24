Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7B1E07D3
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5B989ECD;
	Mon, 25 May 2020 07:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EF189DD5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:52:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c11so16247045ljn.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
 b=qFbpAYGm2ctEH/cC83guZs3dwS5irE0qdb6SQG2jOfs74P0SJmeFLRgzhWG2eCE88Z
 9IG7Mdrywrc6/34gr1/fCDip09Xxn2K1L/Kud49oxmA1TLyRFBADa6tXVL6VD35Knlef
 r8Qc+Dlai0N12/dbzZQfKKhgvsAJIOA75Z/B2jpEQInWxPEol/uksDQwvC3kIWyCXDjl
 vmmRUc7g3GdY/vWj1Iq0+6bQz9aZovLpotnihjQQzFasUCo1DvGiwwZNTCfIk88ZJttB
 5mXjAgDKC00EpzLlmI5sIpPqDHvmugmKfjsQXA0Manh0J42KocWSPNSrKRKw6AtskJfW
 httA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
 b=AnUH5BB3Ge/+knhWNPHGIN/Xu8we7fpt6oUO4b6vif6wcoRhfZvbQ7xKJZOMptZDCn
 5EFQikokf2DOpph4luRlIQBTgzlJoaBo+WboU/Xcg0fICNZ27Ic1v+vSfSnhmaAsaANC
 Sy7xFqRzm4fQxO3SfskFuzNfV1bTTokb6NjwwAZbsP5lADV/hPyx+8tb+7CwXc8mFQ/D
 4L5mLHbQj0et58NA1rk+9PyyFEUOxrx7eOAbM+ndjVxtcfaxASZoIRMm8FakPGSBOzYa
 GjTBen9O8Nlf4zqAA5XsZ/R73c6uzIMrarQ1foLGDjHa2Piit+qHmDEbyjQN4qeMuJHk
 DcxQ==
X-Gm-Message-State: AOAM533ZWWBxiIWYBXx+EgFa3A6rrDwJ8jDBIbcKpyZTh6v0BhIwPpFV
 T3K6RPTAGPedj8FvEw/mJds=
X-Google-Smtp-Source: ABdhPJzzT3pdVktptKpAh2SToU/NOmklk6NdnbF+ydEgCUs1DHwV6vUPb6SLAa4FKS75PWQlahl9Nw==
X-Received: by 2002:a2e:7d17:: with SMTP id y23mr11878027ljc.105.1590342767222; 
 Sun, 24 May 2020 10:52:47 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:52:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 3/4] gpu: host1x: debug: Fix multiple channels emitting
 messages simultaneously
Date: Sun, 24 May 2020 20:50:59 +0300
Message-Id: <20200524175100.9334-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200524175100.9334-1-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once channel's job is hung, it dumps the channel's state into KMSG before
tearing down the offending job. If multiple channels hang at once, then
they dump messages simultaneously, making the debug info unreadable, and
thus, useless. This patch adds mutex which allows only one channel to emit
debug messages at a time.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/debug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index c0392672a842..1b4997bda1c7 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -16,6 +16,8 @@
 #include "debug.h"
 #include "channel.h"
 
+static DEFINE_MUTEX(debug_lock);
+
 unsigned int host1x_debug_trace_cmdbuf;
 
 static pid_t host1x_debug_force_timeout_pid;
@@ -52,12 +54,14 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 	struct output *o = data;
 
 	mutex_lock(&ch->cdma.lock);
+	mutex_lock(&debug_lock);
 
 	if (show_fifo)
 		host1x_hw_show_channel_fifo(m, ch, o);
 
 	host1x_hw_show_channel_cdma(m, ch, o);
 
+	mutex_unlock(&debug_lock);
 	mutex_unlock(&ch->cdma.lock);
 
 	return 0;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
