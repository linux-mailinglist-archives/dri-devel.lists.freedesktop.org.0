Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7F20CCCE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BCC6E0DE;
	Mon, 29 Jun 2020 06:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210EB6E3FE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 03:18:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s16so2790744lfp.12
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 20:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
 b=p49v+FPYkBRH68n3b+EU9KvFMaxtmf5OTVWi83Bpl1meRQUxtnDN60ZdW5IPY/L3YL
 YRHpn9HE+x/gPEoXsMz1G5aUAyR0AF6HVRG6q9yd8WTCzPG3vqxBUJTnUx9A9uKkYGP6
 3MTK8pAqPpe5peUixM/ukcwWiwyqjneNFr/PW/UQs28bq4YTqwt6+Nl/0xc1wdZPNyzo
 pKqJXw9/W/HeNxNQWOIiwdNOjmdIHEaE0SpQdvaUDOOPpp2EA/smycOR6M+DOEPTzcwa
 HJfLSRa1Lj40bhRs9PMp+1a6iEKUYNq3MM2fVFRQee6dQ1t/kx3yt8je/e5qLt4COVMV
 tRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
 b=Q0vMlULDWS7xE5xezdaPz0GNVJ6757LbL4FFRQzInXKwqZxTBY9E0e+2o8N0x9vLDr
 LEL1CugZv+GBbYZm3bDmOA9Y795M6vtPO0yodDmQXe9ftMupUQ9Ct6Q0dd3lmAznNv6V
 dCoxdw2wBFU383pqlgizSA1gr9qpaW2C2plV3KM58sDDtA7IncIY4K3JgfjzNJEF9Uzd
 C4gH0xPGLCjSlbZhEdqTiKRT6+Mn9vd/Ga9SESLrAQrqz85QT4C86WnaX7Bo+49Ib1gm
 uWSh/OhZF4EAzPwpz2o+y4hKwBz8ga8ooSlqOCU0t7KTdJ3y5SYblhq5QoqIV/I5VXTb
 Duhg==
X-Gm-Message-State: AOAM533XFDrrpaHRjCin7JLYT/9c4mwCLfumAOzIFMT8SN891fS2P/ZM
 SHWbEKPAm346jSay+wVcqnI=
X-Google-Smtp-Source: ABdhPJwYVItOG/zb6BAYDE5utvXV9e9+AuvGGwgUmMtOXhB580DEEwhUq0pN1XIfY/euSgHLLA7Vsw==
X-Received: by 2002:ac2:5295:: with SMTP id q21mr7946895lfm.185.1593400736609; 
 Sun, 28 Jun 2020 20:18:56 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:18:56 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v2 5/6] gpu: host1x: debug: Fix multiple channels emitting
 messages simultaneously
Date: Mon, 29 Jun 2020 06:18:41 +0300
Message-Id: <20200629031842.32463-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
