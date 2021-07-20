Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749713CFDA2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1084F89C33;
	Tue, 20 Jul 2021 15:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D924789C33
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:33:54 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4GTjRj1DxWz50MKT
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:33:53 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="Xg4qOYPU"
Date: Tue, 20 Jul 2021 15:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1626795229;
 bh=d9Q3moj/2J34xlyehWoq/C7zP8ek1tDX6NiP55RbvIw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Xg4qOYPUk793e8ucsxhhTPL54VmfiqV/0bzSeQbgFfxV8qKVM5NUA24rdBHPJ4e5Y
 AaGfTk2+TPzflGIxx6u7Ij+n1ruwAtqH0fHGQMD7onBeH5v7m0g34KQTLuSHtczYBI
 0n95i5OOHJpze7akWJI1R8Gm0UHmMU53ssJeinMs=
To: Caleb Connolly <caleb@connolly.tech>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 3/5] drm/panel/samsung-sofef00: make gpio optional
Message-ID: <20210720153125.43389-4-caleb@connolly.tech>
In-Reply-To: <20210720153125.43389-1-caleb@connolly.tech>
References: <20210720153125.43389-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OnePlus 6T panel fails to initialise if it has been reset,
workaround this by allowing panels to not specify a reset GPIO.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/dr=
m/panel/panel-samsung-sofef00.c
index 8cb1853574bb..a20a5af14653 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -44,6 +44,8 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *=
panel)

 static void sofef00_panel_reset(struct sofef00_panel *ctx)
 {
+=09if (!ctx->reset_gpio)
+=09=09return;
 =09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 =09usleep_range(5000, 6000);
 =09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
@@ -137,7 +139,8 @@ static int sofef00_panel_prepare(struct drm_panel *pane=
l)
 =09ret =3D sofef00_panel_on(ctx);
 =09if (ret < 0) {
 =09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
-=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09=09if (ctx->reset_gpio)
+=09=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 =09=09return ret;
 =09}

@@ -276,7 +279,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *=
dsi)
 =09=09return ret;
 =09}

-=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+=09ctx->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIG=
H);
 =09if (IS_ERR(ctx->reset_gpio)) {
 =09=09ret =3D PTR_ERR(ctx->reset_gpio);
 =09=09dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
--
2.32.0


