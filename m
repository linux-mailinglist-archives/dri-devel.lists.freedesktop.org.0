Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34561466805
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72796FB3A;
	Thu,  2 Dec 2021 16:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7246FB41
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:36 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z8so699708ljz.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=RSdFPmrUI402Dc09tnZNn97E4pEduqTRau2Nw1Et+vXSTSItuWqQ1qQgo5J+1BALkT
 pXeYg8IVZsh7XiyOPcIos4OYMocNv/sdZlmzqs+1PMFo80P1PiaMBMTREakOY97rlIj+
 p3xxiIOjPJznHICXuXtAWMYjNAjHr6j6o2B4QEe22j2cFRFAexLVMLKWAkcu68zI7Q1M
 nKy8m9/kVL9Sx9kILwW7DYiglMqhLFai685lmOyY+Dr588tiOYC0mEUmIsj3T5c3yoiC
 MoulSGSizoR0jg4ycDg4rR4xfpG3PxTpZjMFUyuRkb75Y0WvHCyAW8LcTScBOdBn3AmN
 UvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=2IUt+6GQSmLBzg2L/eAM7sl+AVuBhjleApFlyVV5PlxaGsOjLBBiUxJD9eXTdY5Y9s
 9s86FRTu8X7xFU1HcWfleiBYcWSOTJFwITiXtNE6qvyhtP4eD/92rzah+3nSn7g+jDFP
 hVCkaaRNjsZBIdZ4S8SVpM7aNcqrIBBZdHnmH65wRuTzSijf61bKYz7RZVrEpQLa9mbv
 3ybRtH+7lsPOklGSzu10sIecbQFob/WV4Q8kTq7DtV4/reqvoHMiKBzvwFSKVnEAuqLp
 IIJH00Mevvl5Q00e+9tVdSQOnLwquje9n95BJfFoVzGKBzPkdwovs89x7ocVdeogR4oB
 9O1Q==
X-Gm-Message-State: AOAM533b26r9yqV94z15r1UGOy0Av6H43ZIYepo9wNx+NtW4Ta1sGTv3
 KigGACy4+p60DtbH9Hz+vkc=
X-Google-Smtp-Source: ABdhPJwb+aZCkvsM06cfVFDqv3SaV4prBR7wmD5aUJuI1klW3QBgZtBrKJ0ooP/0EW5plBrMNXKWsg==
X-Received: by 2002:a2e:7c16:: with SMTP id x22mr12905096ljc.460.1638462334456; 
 Thu, 02 Dec 2021 08:25:34 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:34 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 20/20] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date: Thu,  2 Dec 2021 19:23:41 +0300
Message-Id: <20211202162341.1791-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable S/PDIF controller to enable HDMI audio support on Toshiba AC100.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Tested-by: Agneli <poczt@protonmail.ch>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 5b2260f61f05..921a811632a1 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -264,8 +264,16 @@ conf_ld17_0 {
 		};
 	};
 
+	spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	serial@70006000 {
-- 
2.33.1

