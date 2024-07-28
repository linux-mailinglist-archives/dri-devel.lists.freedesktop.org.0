Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5C293E53B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 15:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC91F10E16E;
	Sun, 28 Jul 2024 13:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="AWjpf9vH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F2D10E16E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722171773; x=1722776573; i=wahrenst@gmx.net;
 bh=cmHYnLGXn5Yd/1OpHJBxm40cex9jafN03MDZJmc7bGI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AWjpf9vHzDdLEeRClvD2Dvyd/QflXEJ24IPsMhRydRtA30yewy1Nwjpj7Jv4cEPX
 y0+Nu+SzXC/i08o4XvGYV8mhq3yJNAFza6kBUPEtLzkERSHgdVbeShZGO2X/UreLX
 7WlM1C/6EX0BcRGjiCvLuVDZdKXlR4r3TAn2VzIV30OvrI0wDQ3P6TahVyyNMOzH9
 FlgwseZZoGtPHC2DBO5ecp77t1ovKnddCi567b/C7ABSg9v5XUeUCgYKFqwY8xBES
 FG0W8sShLJuSpnywglzBpcQ4QkKUzfe1JOI0QIhapo15iuKQxeo+K7pnstH61Wxx3
 IbglK31j341P4Evi5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhlV-1sNvC73mlT-002ZWL; Sun, 28
 Jul 2024 15:02:53 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 11/16] usb: dwc2: debugfs: Print parameter no_clock_gating
Date: Sun, 28 Jul 2024 15:00:24 +0200
Message-Id: <20240728130029.78279-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728130029.78279-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lSg1FCepvSIHTnFDP4f/Qf43QyaiFYaGcCE3gb4WJE++lpO3ow8
 mKRRPjAqJDuOezzMVEwD0IylhiXtT3JwqwD3GCqwyQ+nd6+rM8Or/2ieStUiEP7R/8mgZlv
 Yr49GNbtlAbIDwyjS5hsNh/zkgvcCe4t4yqp2Dt7VtgVRdVb5oWGsfy0qW7d2FB2ydw6J5v
 jBe24lvlOT18SLMBaQqUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z/NKxCFSSqc=;YAKYBHzrYzeRIKYgh6aUQlJ1EHf
 N5TmyI0+LC+Up/4ILpI8cx6GuKOvtP3fSjAJgQ4PB2GTo3FKRZlHBp3ZVNP6P6oxsmwsqdaj0
 b8QAZGButiZ8RZRG54JyWIZ1aB0EkPGut3oMUwOa27vvBvWOZrsOfUV4f1OG3w6dv+9QCYhRk
 mCW6tFp/vgdmkzUyz7uML6AaF9NME5f4ajTjDKPjPpnEAH6Gu1ppYrSmXDTrhd61jGt2VjCt/
 XoiNP5KNP9W1ID6sBmh155stsVj2f1lsIPj1jCmUYGSO34urhl8xftkdbInU6qSXtYVcuhJYU
 9u2nYgIXtpJjeTQjAE7NkEqmXyRl0l+2k6dmL45PHcqyO5dbrJP4eq12Ei59u4yAy3gTAfG3L
 JxCKJrWxWbr3PsYxct9jUb+VfkI8aicgGswDNqYFxGuzi/YRob+GMFsNzPIn6sqLxb45k/HCi
 vGdr1dnO26d6JBOtrEkMB1F662krY/wcInoqB6f42nBtW8GT71omtEwbufp2L39a32YGIebMb
 Ja7ZesDOPgKdcm+bT8o8WGZK++lKBC3B2KOjnaU2mCND8Gkflzv7rsW4m/neCoapZvzW6Ql9a
 viMDBkWki3r+VePuc4rwVbINMk/uA6eTBU1xVsXJGlU/oyvgJdtXMl7YNUJn6B289tEa31ZUu
 abp/AvIYjfBe5vB01lgtfVrIQN4iT992GS+yjU867ZejruHbON2VhzMKrm35Nt3IyJmrOkwKL
 WZXrGRnky27t8iYtkkfzFyOWG5a2rOjW4dv7I4zvaKxkv+6VYIFG/VwJSn4bDI07S7aQNd3sL
 /cC6hK2kvhFAVVpLCbxJro7w==
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

The commit c4a0f7a6ab54 ("usb: dwc2: Skip clock gating on Samsung
SoCs") introduced a parameter to skip enabling clock gating mode
even the hardware platform should supports it.

In order to make this more visible also print this in show
parameters of debugfs.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 drivers/usb/dwc2/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index 7c82ab590401..3116ac72747f 100644
=2D-- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -702,6 +702,7 @@ static int params_show(struct seq_file *seq, void *v)
 	print_param(seq, p, uframe_sched);
 	print_param(seq, p, external_id_pin_ctl);
 	print_param(seq, p, power_down);
+	print_param(seq, p, no_clock_gating);
 	print_param(seq, p, lpm);
 	print_param(seq, p, lpm_clock_gating);
 	print_param(seq, p, besl);
=2D-
2.34.1

