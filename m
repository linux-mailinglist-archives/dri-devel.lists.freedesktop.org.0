Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBA1DE037
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0446E348;
	Fri, 22 May 2020 06:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D56C6E850
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:39:49 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04KDZUki013233; Wed, 20 May 2020 15:39:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Ra6W9fZReLRTQrx+lu7bVII6kYd76LIwYkwWDAY0Cqo=;
 b=L3lFrasvXkvpYdrWyPK63OLsSj360TP3KX1jqMA1OYkfPfFg5x7bT4/Ad0J+1XuhTBY9
 6WvSEt9LMyK06Yt1nEwXV6AOFuk/fTCRZBgSqdRmC03uPiw2ADxAPEYEQ6njiJAv1fhJ
 V9yBftCK6A1UFE2Pdx5tgFvQTmR9kE0p/nMArswPm2lF6SsF3Bo6/GpffqLXvinxOAfX
 eKIEpVbyAIlCgV1i7CcJMl3KuODXi0sTIeVlCFMVsjfUK367TvdNmWbjKZXvwp/qWHSM
 toBRKt6rM74mhhV51wulH22H22wVznKZyjFqIxjPdOiyOyidIvI7mzmfbKGA3/gKTYbQ WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3125xy0jfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 15:39:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72FE310002A;
 Wed, 20 May 2020 15:39:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B0B32C38AA;
 Wed, 20 May 2020 15:39:42 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May 2020 15:39:41
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 2/2] serial: stm32: Use generic DT binding for announcing
 RTS/CTS lines
Date: Wed, 20 May 2020 15:39:32 +0200
Message-ID: <20200520133932.30441-3-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520133932.30441-1-erwan.leray@st.com>
References: <20200520133932.30441-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_09:2020-05-20,
 2020-05-20 signatures=0
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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

Add support of generic DT binding for annoucing RTS/CTS lines. The initial
binding 'st,hw-flow-control' is not needed anymore since generic binding
is available, but is kept for backward compatibility.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 17c2f3276888..9cfcf355567a 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1033,8 +1033,9 @@ static struct stm32_port *stm32_of_get_stm32_port(struct platform_device *pdev)
 	if (WARN_ON(id >= STM32_MAX_PORTS))
 		return NULL;
 
-	stm32_ports[id].hw_flow_control = of_property_read_bool(np,
-							"st,hw-flow-ctrl");
+	stm32_ports[id].hw_flow_control =
+		of_property_read_bool (np, "st,hw-flow-ctrl") /*deprecated*/ ||
+		of_property_read_bool (np, "uart-has-rtscts");
 	stm32_ports[id].port.line = id;
 	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
 	stm32_ports[id].cr3_irq = 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
