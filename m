Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F09D506DCB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ECF10EFFD;
	Tue, 19 Apr 2022 13:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578D10EFFD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:42:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6221616D0;
 Tue, 19 Apr 2022 13:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82131C385AF;
 Tue, 19 Apr 2022 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375751;
 bh=VizbppVwzPYdQPDTL7NxrAMjSGA3HHnCFb6Pzlcg7cg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ewcomR5Y+ebhEER2jEsmmEKS/5FV86pDTEgeOQLxiozH7E0tm578fLHS1YYtVXf6Y
 D9fxFVuX1bjJa3WJD1rU9pxOwPFHjkiSj0XoD3GwlA9L252sd9q8N/PHPkjkvFCtAn
 k9k7I3mGsf29zuf2FaLzo9lrKBip8FJn5AMZkfh+pAPB7jcGBApFAL7YRSSvm96zlr
 UUQxLcM59kgkggbLPetkP6H/llR+WY7zHgb6OvzSaqxVdVRU74hWZ02nmqay1W/nN0
 Z36YNnqN7DBeFOPhQT8ZAba7fOItSy31B3qvefulS0ykv74DV92yrMGAp61HVmMz42
 +DpY44FhKTZZA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 39/41] [MERGED] ASoC: ti: osk5912: Make it CCF clk API
 compatible
Date: Tue, 19 Apr 2022 15:37:21 +0200
Message-Id: <20220419133723.1394715-40-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

v2: use clk_prepare_enable/clk_disable_unprepare() (Peter)

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/ti/osk5912.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 40e29dda7e7a..2790c8915f55 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -27,12 +27,12 @@ static struct clk *tlv320aic23_mclk;
 
 static int osk_startup(struct snd_pcm_substream *substream)
 {
-	return clk_enable(tlv320aic23_mclk);
+	return clk_prepare_enable(tlv320aic23_mclk);
 }
 
 static void osk_shutdown(struct snd_pcm_substream *substream)
 {
-	clk_disable(tlv320aic23_mclk);
+	clk_disable_unprepare(tlv320aic23_mclk);
 }
 
 static int osk_hw_params(struct snd_pcm_substream *substream,
-- 
2.29.2

