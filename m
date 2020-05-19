Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F01DAC4F
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C756E58E;
	Wed, 20 May 2020 07:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2355 seconds by postgrey-1.36 at gabe;
 Tue, 19 May 2020 10:20:36 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455EB6E530
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 10:20:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04J9bCoK002859; Tue, 19 May 2020 11:41:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=8umFBsqpXSyvV7P7Pt39jOOMGvMU9GE2G14TF8W9jgU=;
 b=CjcChvegMRR43kcF7VLmveYY3LeTbNP17nhluegroU/5+HEvQtGYduaZa4aBSWaz6hbm
 jZkaPjuVERGrfu3I5Yzf2SpMK08NSarRsty9Ffp1fxTff6Y9ykpSKjGNjQ+Fm1gsk5JX
 a5r0LvSOqXWI6MVOOIv45q9zV1YlsTKD6p5udChBW/fCXtow3Arj7pG2JAAlDk1wZopb
 g+ZOGREMtPrvN2goEFx4njwzqBHI12NAb5+vQVcm2rm1xKbqJrHKVRV09x8D1HHetv6r
 nzHbked10gKBadtATbbVKu2HXMNM1edJW6VQxNNNvfdTBXoB+UQa8Uv1wz3xLmcvikNB 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3125xxs1b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 11:41:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D257310002A;
 Tue, 19 May 2020 11:41:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD9F12B1881;
 Tue, 19 May 2020 11:41:10 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 May 2020 11:41:10
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@st.com>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 1/1] serial: stm32: add no_console_suspend support
Date: Tue, 19 May 2020 11:41:04 +0200
Message-ID: <20200519094104.27082-1-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_03:2020-05-19,
 2020-05-19 signatures=0
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Erwan Le Ray <erwan.leray@st.com>,
 linux-serial@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to display console messages in low power mode, console pins
must be kept active after suspend call.

---
Initial patch "serial: stm32: add support for no_console_suspend" was part
of "STM32 usart power improvement" series, but as dependancy to
console_suspend pinctl state has been removed to fit with Rob comment [1],
this patch has no more dependancy with any other patch of this series.

[1] https://lkml.org/lkml/2019/7/9/451

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 9cfcf355567a..5afd29162f6c 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1425,7 +1425,18 @@ static int __maybe_unused stm32_serial_suspend(struct device *dev)
 	else
 		stm32_serial_enable_wakeup(port, false);
 
-	pinctrl_pm_select_sleep_state(dev);
+	/*
+	 * When "no_console_suspend" is enabled, keep the pinctrl default state
+	 * and rely on bootloader stage to restore this state upon resume.
+	 * Otherwise, apply the idle or sleep states depending on wakeup
+	 * capabilities.
+	 */
+	if (console_suspend_enabled || !uart_console(port)) {
+		if (device_may_wakeup(dev))
+			pinctrl_pm_select_idle_state(dev);
+		else
+			pinctrl_pm_select_sleep_state(dev);
+	}
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
