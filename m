Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A953991D25C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 17:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830E810E296;
	Sun, 30 Jun 2024 15:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="X7aik6t4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F3510E281
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1719761841; x=1720366641; i=wahrenst@gmx.net;
 bh=4r6Hb3gvtnU8vTL9qCacD/NYc/kZfSz2IGu4cIiUycI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=X7aik6t4uOtmi1FCRIFUupfyyTLgagoIq7hhRty+/4yPBBwYYNy6kibUV/P4dDvz
 3DVT2dWV3Fhl14S5VlVhZQUif/I4o6x6S57hYdb0qt02WXNTjesd/uu/bHbMVLnoz
 jjZ84GvzEi7gry6K4jLAVo5DRtrhMBtbI1JwGLYhsEGV5EqmK3Fumsoek082N/5QT
 POtPk+3tLrYIRnSZpjRekiAF8bXqcNtljOYH4OEScH0zg1Ct2y6yA9msU7RVuN4dJ
 YVrjYD4uboyoTthXotFaHDOrWOtwkjuTmcaHuUU/OvzyFXnruZ0cdj+mr8SZQRXYW
 7dPtbj18gvi3vRpoCA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1sAG1H2vzq-00t1Ll; Sun, 30
 Jun 2024 17:37:21 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 05/11] irqchip/bcm2835: Enable SKIP_SET_WAKE and
 MASK_ON_SUSPEND
Date: Sun, 30 Jun 2024 17:36:46 +0200
Message-Id: <20240630153652.318882-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
References: <20240630153652.318882-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gG2zMh+5jv70iXOh5vFMJHOoLe5umeeOapkAwXLaixUOKZ+w9QA
 jPqoLpaAOuyJxVXORl0vegF1SRPmg4dQxiGU8L7EH9QB/4Iz219fGjQXz8DwSGSKM66yRXr
 vnStIUjEtjuzJgL5OnFe2GRajHR2k6x/xHH4MarDtqWy6tVBMieMywmH14JIEdqGeNs3PgU
 XqknQyYVH7TRn7AyZjuHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kq6aJGVKb94=;BpeGVYzb1ZqeBqbopRubsnmH5ax
 bfoCiueu4CjcjLXZqr3WtEX2tERwkAFYxJP/aQQQ1ojQA3+bsxkQoAH/ojzLQIOHuLKP4XPAc
 PVgiBTqos9NLSBi+/Xv0YpPxTvJGupp//SFJjyqj4Q7FG2tkr1mG2Zlr0vJlUZSXQgZEK9vWW
 aEKsjAfBXct9DD+JcXevmysY/sO5N12Perafl3iY1mVumAySBHh0xOv1wrN4d5eavdYi8D0nq
 VdsG4kfE6nx3o3pkcOFo4REsD+nIXEW3kiMPyzof0uk6e+rA0xJVxe2AgPkmcCfzGIwXmmzow
 KgWcg+s29ZVRXJjDxEvxK3LPWrvWVfrRA98sq876H7KB2rkqEmfMsnWVQnCQFvN1uS+qooUzJ
 L8iiBIWRQ3KKNvIyX6yW+DcOrh+qz2oh1JuixG68LlNouCGAPPl5FlTdW6zbxqXicYhZvsJ7C
 q/n6LSVxb6bxweJlN2HLWEIEhBI57OEvPgQUBjIFslAP/2xVbBOqYsYTo7bXWS8mEeKyceJbh
 rmEWYJ8Yl7tEZZL4JlPyO22is1EbNRtKO1pcwLJ0X3Igb22rk9e4GbwUk3STI9Wj/6DLIQAmq
 WsqlUXHWR+1/rj0KTlQeLszN2nzIkuLQBdiUxkjqJiRw2DPsw9jl2HUn/es64EDRjVI+oL7Dh
 XzBhIbs7rYrrcC0zKHr1C67qXW71zhy6ZGGgYWq2kpIAhQa/lGQ0xAqeVD0dti8yme6Nxr4NF
 sEm1K1J3fThW8EXVaHpon1QQO+XAThqSD1IiUIslRPDG5I4OUmnWJqKR80tKncoNLLLqazLfW
 +F/fKvsXndGa6dgyAok+CecJ2A2ytKP4v/QEeRwH6wEaA=
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

The BCM2835 ARMCTRL interrupt controller doesn't provide any facility
to configure the wakeup sources. That's the reason why this
implementation lacks the irq_set_wake implementation. But this prevent
us from properly entering power management states like "suspend to
idle".

So enable the flags IRQCHIP_SKIP_SET_WAKE and
IRQCHIP_MASK_ON_SUSPEND to let the irqchip core allows and handles
the power management.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/irqchip/irq-bcm2835.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-bcm2835.c b/drivers/irqchip/irq-bcm2835.c
index e94e2882286c..6c20604c2242 100644
=2D-- a/drivers/irqchip/irq-bcm2835.c
+++ b/drivers/irqchip/irq-bcm2835.c
@@ -102,7 +102,9 @@ static void armctrl_unmask_irq(struct irq_data *d)
 static struct irq_chip armctrl_chip =3D {
 	.name =3D "ARMCTRL-level",
 	.irq_mask =3D armctrl_mask_irq,
-	.irq_unmask =3D armctrl_unmask_irq
+	.irq_unmask =3D armctrl_unmask_irq,
+	.flags =3D IRQCHIP_MASK_ON_SUSPEND |
+		 IRQCHIP_SKIP_SET_WAKE,
 };

 static int armctrl_xlate(struct irq_domain *d, struct device_node *ctrlr,
=2D-
2.34.1

