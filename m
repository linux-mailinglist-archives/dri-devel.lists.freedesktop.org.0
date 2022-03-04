Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C964CDB4E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08D112C57;
	Fri,  4 Mar 2022 17:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2DA112C57
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646416275;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=pbJ/izb78bVdwuR4MYf9VVhUxqicsYulwbQkTTCSBwM=;
 b=katPOD+4huyK+8FoW/A8yCoviUIJ8FZhwehgLb5JN0/xTFQKFEKQNcy2bx+LAvg1hC
 6R9BZ4fKqOUNgHDPhGj7hbzAVHz7GrhCV5avWuiruyUrpmJuG8d39UgeAIdwExLMWRTG
 8pr06bxaZZlx6CnIzDwI6cKUxO4kSiTgZh3W3nfKL6vcGA5Ff+X9bfIYGWY/L1rlcGqP
 dgVcMjI3T0fihYNCZwY1HCkaJzmH0My83GEJ7yWj0bEStvtyrFvxAPgbtZ0VWxE6JCAy
 5o19otPyUIXmocoa4Fd9SpdLAZQdIGm32fYd565iCAfKBvCn6eiEQHuX39bPWK5TxgkJ
 BRAQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8QUWw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
 with ESMTPSA id n729cey24HpE7ZY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 4 Mar 2022 18:51:14 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <VYB88R.ATGIVGZ13PFM1@crapouillou.net>
Date: Fri, 4 Mar 2022 18:51:14 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <929BF693-D54F-40F0-BB61-520301D1C31F@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
 <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
 <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
 <RUI68R.Z009SPJAAD8N1@crapouillou.net>
 <F0F8F36B-3A0A-476C-8C7D-566255C629C6@goldelico.com>
 <a52702bd-c929-8170-8896-d34ba82aba3c@baylibre.com>
 <VYB88R.ATGIVGZ13PFM1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>,
 Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul, Neil,

> Am 04.03.2022 um 17:47 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> =46rom what I understood in Nikolaus' last message, HDMI hotplug is =
actually correctly detected, so there's no need for polling. What is =
missing is the call to drm_kms_helper_hotplug_event *somewhere*, so that =
the information is correctly relayed to userspace.

Exactly.

As Maxime pointed out it should already be called by =
drm_helper_hpd_irq_event() in dw_hdmi_irq() but isn't
because mode_config.poll_enabled isn't enabled.

So we can either
a) enable mode_config.poll_enabled so that it is called by =
drm_helper_hpd_irq_event() or

b) make drm_kms_helper_hotplug_event() being called explicitly in =
dw_hdmi_irq().
   We could guard that by mode_config.poll_enabled to avoid =
drm_kms_helper_hotplug_event()
   being called twice (but I think the "changed" mechanism will take =
care of).

> I think this issue can be fixed by calling =
drm_bridge_connector_enable_hpd() on the connector in ingenic-drm-drv.c.

I don't see yet how this would solve it, but it may work.

Anyways, this all is a missing feature (sometimes called "bug") of the =
*dw-hdmi driver* and IMHO
neither of the connector nor the ingenic-drm-drv.

So I think it should not be solved outside dw-hdmi.

BR and thanks,
Nikolaus

