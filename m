Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EF50737E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C9010EC9F;
	Tue, 19 Apr 2022 16:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55B10EC9F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:43:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A12661874;
 Tue, 19 Apr 2022 16:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A3AC385AE;
 Tue, 19 Apr 2022 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386605;
 bh=jVLr/dnEKwuj3c1vrZ91YoCk9HDGqp70ixnIySjnCzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mWT14rZK6S8SuCBdSeUZzPrc9E19Tfk5z+4e9Xxz5EV84KlZjRCrsV4OOzxS7dHS6
 4iexBwIyE7R2Bpu6+i2RCf1afkBlvNseI9hOFpc1KtSAzBYh231hgSqMVDhA681sMd
 tSc90K1WjgKGfBNbN2rCf9UAT41xofayQcYjRr5RlfcxKZzE9DwCXzhkkSatqU7rJA
 Txl8iVGB3rULKEKOFMBXqDJviTOWOEw+/wfcvwIbK1jtrAzCoSC461ZPz5HedxyzbB
 zEfwanqzKNV6A15RBOC7RVLcka+KDcF2taZlmtRD7tt/hSaNrcpYJnLCOHouG9UN5P
 xWRdDk2j4rGQQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 35/48] ARM: pxa: remove get_clk_frequency_khz()
Date: Tue, 19 Apr 2022 18:37:57 +0200
Message-Id: <20220419163810.2118169-36-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

get_clk_frequency_khz() is not a proper name for a global function,
and there is only one caller.

Convert viper to use the properly namespaced
pxa25x_get_clk_frequency_khz() and remove the other references.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.c      | 15 ---------------
 arch/arm/mach-pxa/generic.h      |  1 -
 arch/arm/mach-pxa/viper.c        |  2 +-
 drivers/cpufreq/pxa2xx-cpufreq.c |  2 --
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index fe1d55d328e5..2c2c82fcf9cb 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -55,21 +55,6 @@ void __init pxa_timer_init(void)
 	pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000));
 }
 
-/*
- * Get the clock frequency as reflected by CCCR and the turbo flag.
- * We assume these values have been applied via a fcs.
- * If info is not 0 we also display the current settings.
- */
-unsigned int get_clk_frequency_khz(int info)
-{
-	if (cpu_is_pxa25x())
-		return pxa25x_get_clk_frequency_khz(info);
-	else if (cpu_is_pxa27x())
-		return pxa27x_get_clk_frequency_khz(info);
-	return 0;
-}
-EXPORT_SYMBOL(get_clk_frequency_khz);
-
 void pxa_smemc_set_pcmcia_timing(int sock, u32 mcmem, u32 mcatt, u32 mcio)
 {
 	__raw_writel(mcmem, MCMEM(sock));
diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index 67925d3ea026..2f706ef97357 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -11,7 +11,6 @@
 
 struct irq_data;
 
-extern unsigned int get_clk_frequency_khz(int info);
 extern void __init pxa_dt_irq_init(int (*fn)(struct irq_data *,
 					     unsigned int));
 extern void __init pxa_map_io(void);
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index 600d9e80b00c..0782f0ed5a6e 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -851,7 +851,7 @@ static void __init viper_init_vcore_gpios(void)
 		goto err_dir;
 
 	/* c/should assume redboot set the correct level ??? */
-	viper_set_core_cpu_voltage(get_clk_frequency_khz(0), 1);
+	viper_set_core_cpu_voltage(pxa25x_get_clk_frequency_khz(0), 1);
 
 	return;
 
diff --git a/drivers/cpufreq/pxa2xx-cpufreq.c b/drivers/cpufreq/pxa2xx-cpufreq.c
index 0f0e676ff781..e74d36d6f78d 100644
--- a/drivers/cpufreq/pxa2xx-cpufreq.c
+++ b/drivers/cpufreq/pxa2xx-cpufreq.c
@@ -107,8 +107,6 @@ static struct pxa_freqs pxa27x_freqs[] = {
 static struct cpufreq_frequency_table
 	pxa27x_freq_table[NUM_PXA27x_FREQS+1];
 
-extern unsigned get_clk_frequency_khz(int info);
-
 #ifdef CONFIG_REGULATOR
 
 static int pxa_cpufreq_change_voltage(const struct pxa_freqs *pxa_freq)
-- 
2.29.2

