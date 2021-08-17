Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C813EE266
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A656E0BC;
	Tue, 17 Aug 2021 01:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA966E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t9so38198865lfc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yDP03amDwCEY6IiivIbDG+60+C+xV/Pv6sR1LEywSYo=;
 b=gphWv3FSo4qRIr1+4cndtzGHAzH8uRp+6O2Jh/43ADFQ2pMlS0Zsrs64oMYobqkS1+
 b+r1h2TK1Crc9j6X+uN6vCFja8kkAditXl7nED2zfthme0nAVoLLOVblgLJT5JpVCj+R
 LfR3EOcOZfOce670ecAaUWKoQT2BaRWlSGfqtNf9gkptV64SWk8Yy2LhjWaPNS4B/2yg
 ZH9n6SVsQ7h3ArNvDfuvdoWMQFNpXwFKw9JH3cLFSFGg1bwXydGhSafUNRFrJguIIS+g
 hCdIcrxq+8nkeUjCdcCINJHyWfD/w5VpOJW5k8PzB+MFD+1UOWPCYR9812fnRTSW/ori
 Susw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDP03amDwCEY6IiivIbDG+60+C+xV/Pv6sR1LEywSYo=;
 b=dxxykZ5a0D3Pi1Qolu6xcj+ktpvfEOlXH/nMOPn/2x76hFlMPpQe/ORuU3VEI0b8Ok
 owvMZ5VaRvPngoK+9OmGZAu8ilVfsuFXuL8X3OG3+2qufm/Prm8HRrmbCVQQ9U/O9qQg
 LfZu0pZCRN7Z4YND79qMXaxZcNmne8Uf4Jx2E9SP/NebiOqRBp6I0B5IsYYpHHKzL3wg
 tyNvVI+v+sOq+V1uH6W1edICsjbmq+eC2sre53yap62sqO43gSkFSeWbFbD8W/emjkXJ
 oWKvbpYovoaVheC67AvjL/cfp8IToT8PU3zpFLun8OKfBP2c0rhGoqOSKJyA75r+Q2uj
 jyPA==
X-Gm-Message-State: AOAM531Hh4SUssBF21Jrd68p4XxzzOwbCx5AnPl+Y0l3/ELZooyfXYqv
 lqS3tVyDXjE86qtStJqsXtY=
X-Google-Smtp-Source: ABdhPJzjQdDYehMh8DidNPOdRzuxuexyxo18C/Mv3HZHO/OdC52KIqt+4g3AhPBU7HeUyOcC1z48Rw==
X-Received: by 2002:a05:6512:39d1:: with SMTP id
 k17mr506834lfu.464.1629163813455; 
 Mon, 16 Aug 2021 18:30:13 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 10/34] gpu: host1x: Add host1x_channel_stop()
Date: Tue, 17 Aug 2021 04:27:30 +0300
Message-Id: <20210817012754.8710-11-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add host1x_channel_stop() which waits till channel becomes idle and then
stops the channel hardware. This is needed for supporting suspend/resume
by host1x drivers since the hardware state is lost after power-gating,
thus the channel needs to be stopped before client enters into suspend.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/channel.c | 8 ++++++++
 include/linux/host1x.h       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 4cd212bb570d..2a9a3a8d5931 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -75,6 +75,14 @@ struct host1x_channel *host1x_channel_get_index(struct host1x *host,
 	return ch;
 }
 
+void host1x_channel_stop(struct host1x_channel *channel)
+{
+	struct host1x *host = dev_get_drvdata(channel->dev->parent);
+
+	host1x_hw_cdma_stop(host, &channel->cdma);
+}
+EXPORT_SYMBOL(host1x_channel_stop);
+
 static void release_channel(struct kref *kref)
 {
 	struct host1x_channel *channel =
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 7bccf589aba7..66473b5be0af 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -181,6 +181,7 @@ struct host1x_job;
 
 struct host1x_channel *host1x_channel_request(struct host1x_client *client);
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
+void host1x_channel_stop(struct host1x_channel *channel);
 void host1x_channel_put(struct host1x_channel *channel);
 int host1x_job_submit(struct host1x_job *job);
 
-- 
2.32.0

