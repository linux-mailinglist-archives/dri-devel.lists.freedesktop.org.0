Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB47CA1A2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E0010E140;
	Mon, 16 Oct 2023 08:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3788110E140
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1697445049; x=1728981049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+1f5BtiUqqnQfmvtwIzIJCZuTj8la0qyw1ORIX1BqYU=;
 b=pguOF9QzNOyqrdtp5GBcKSLqBpPG1hbuWGlQyEnH0EbKd6NC+Euvvkok
 5+lBgD85JDfDwH9d/0THhV+jTbrRejOEIQEpJz6V25QPx6AhkghjWX400
 ULN0/Jqp86JiYiw3MOzKduSkuhz5HCfJjowE15eZ0bCGrezvCrfTNpcoC
 a1dv4nNROg2cb+zeVis+1Y3S5LEMMfJ8z6/PJ3cAmrlNFzMbC9egj4FR3
 1dQZ+6hvQMqIQoVSWF2HLaKXgrf2bTMatseY+vQqDeDTAIfoMBKPyXhAh
 zDsRQGSm2MIpeOuST6NYPFjkbreDtIP65IGR3rxv6nPzQPrkLFcTjkWmA g==;
X-IronPort-AV: E=Sophos;i="6.03,228,1694728800"; d="scan'208";a="33475305"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Oct 2023 10:30:46 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 80CFA280082;
 Mon, 16 Oct 2023 10:30:46 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists
 .infradead.org" <linux-phy@lists.infradead.org>, Sandor Yu <sandor.yu@nxp.com>
Subject: Re: [PATCH v10 1/7] drm: bridge: Cadence: Creat mhdp helper driver
Date: Mon, 16 Oct 2023 10:30:48 +0200
Message-ID: <3258050.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB9448AC9D8090E1F5F7E39C0EF4D7A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1697162990.git.Sandor.yu@nxp.com>
 <8621221.DvuYhMxLoT@steina-w>
 <PAXPR04MB9448AC9D8090E1F5F7E39C0EF4D7A@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

Am Montag, 16. Oktober 2023, 05:05:54 CEST schrieb Sandor Yu:
> Hi Alexander,
>=20
> Thanks your comments,
>=20
> > Hi Sandor,
> >=20
> > thanks for the updated series.
> >=20
> > Am Freitag, 13. Oktober 2023, 05:24:20 CEST schrieb Sandor Yu:
> > > MHDP8546 mailbox access functions will be share to other mhdp driver
> > > and Cadence HDP-TX HDMI/DP PHY drivers.
> > > Create a new mhdp helper driver and move all those functions into.
> > >=20
> > > cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(), because
> > > it use the DPTX command ID DPTX_WRITE_REGISTER.
> > >=20
> > > New cdns_mhdp_reg_write() is created with the general command ID
> > > GENERAL_REGISTER_WRITE.
> > >=20
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > ---
> > >=20
> > > v9->v10:
> > >  *use mhdp helper driver to replace macro functions,  move maibox
> > >=20
> > > access function and mhdp hdmi/dp common API  functions into the
> > > driver.
> > >=20
> > >  drivers/gpu/drm/bridge/cadence/Kconfig        |   4
> > >  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
> > >  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 306 ++++++++++++++
> > >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 383 +++-------------=
=2D-
> > >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
> > >  include/drm/bridge/cdns-mhdp-helper.h         |  96 +++++
> > >  6 files changed, 473 insertions(+), 361 deletions(-)  create mode
> > >=20
> > > 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > >=20
> > >  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > b/drivers/gpu/drm/bridge/cadence/Kconfig index
> > > ec35215a20034..0b7b4626a7af0
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > > @@ -20,6 +20,9 @@ config DRM_CDNS_DSI_J721E
> > >=20
> > >         the routing of the DSS DPI signal to the Cadence DSI.
> > > =20
> > >  endif
> > >=20
> > > +config CDNS_MHDP_HELPER
> > > +     tristate
> > > +
> > >=20
> > >  config DRM_CDNS_MHDP8546
> > > =20
> > >       tristate "Cadence DPI/DP bridge"
> > >       select DRM_DISPLAY_DP_HELPER
> > >=20
> > > @@ -27,6 +30,7 @@ config DRM_CDNS_MHDP8546
> > >=20
> > >       select DRM_DISPLAY_HELPER
> > >       select DRM_KMS_HELPER
> > >       select DRM_PANEL_BRIDGE
> > >=20
> > > +     select CDNS_MHDP_HELPER
> > >=20
> > >       depends on OF
> > >       help
> > >      =20
> > >         Support Cadence DPI to DP bridge. This is an internal diff
> > >=20
> > > --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > > b/drivers/gpu/drm/bridge/cadence/Makefile index
> > > c95fd5b81d137..087dc074820d7 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > > @@ -2,6 +2,7 @@
> > >=20
> > >  obj-$(CONFIG_DRM_CDNS_DSI) +=3D cdns-dsi.o  cdns-dsi-y :=3D
> > >=20
> > > cdns-dsi-core.o
> > >=20
> > >  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D cdns-dsi-j721e.o
> > >=20
> > > +obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D cdns-mhdp-helper.o
> > >=20
> > >  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
> >=20
> > cdns-mhdp8546-y
> >=20
> > > :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> > > :
> > >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> > >=20
> > > cdns-mhdp8546-j721e.o diff --git
> > > a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c new file mode
> > > 100644 index 0000000000000..2e3eee40494f0
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > > @@ -0,0 +1,306 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > > + *
> > > + */
> > > +#include <drm/bridge/cdns-mhdp-helper.h> #include
> > > +<linux/dev_printk.h> #include <linux/module.h>
> > > +
> > > +/* Mailbox helper functions */
> > > +int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base) {
> > > +     int ret, empty;
> > > +
> > > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
> > > +
> > > +     ret =3D readx_poll_timeout(readl, base->regs +
> >=20
> > CDNS_MAILBOX_EMPTY,
> >=20
> > > +                              empty, !empty, MAILBOX_RETRY_US,
> > > +                              MAILBOX_TIMEOUT_US);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     return readl(base->regs + CDNS_MAILBOX_RX_DATA) & 0xff; }
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_read);
> >=20
> > No need to export this. You can make this function actually static.
>=20
> OK, I will change it to static in the next version.
>=20
> > > +
> > > +int cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val) {
> > > +     int ret, full;
> > > +
> > > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
> > > +
> > > +     ret =3D readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_FUL=
L,
> > > +                              full, !full, MAILBOX_RETRY_US,
> > > +                              MAILBOX_TIMEOUT_US);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     writel(val, base->regs + CDNS_MAILBOX_TX_DATA);
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_write);
> >=20
> > No need to export that one as well. You can make this function actually
> > static as these two functions are only called from the helper itself.
>=20
> mhdp8546 driver need this function.

True, cdns_mhdp_set_firmware_active() needs this. But this call seems a bit=
=20
fishy. Couldn't this be written as follow?

=2D--8<--
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/
gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 0582a5e42763f..c0364d05406cd 100644
=2D-- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -78,22 +78,16 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bri=
dge=20
*bridge)
 static
 int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enab=
le)
 {
=2D       u8 msg[5];
+       u8 msg[1];
        int ret, i;
=20
=2D       msg[0] =3D GENERAL_MAIN_CONTROL;
=2D       msg[1] =3D MB_MODULE_ID_GENERAL;
=2D       msg[2] =3D 0;
=2D       msg[3] =3D 1;
=2D       msg[4] =3D enable ? FW_ACTIVE : FW_STANDBY;
+       msg[0] =3D enable ? FW_ACTIVE : FW_STANDBY;
=20
        mutex_lock(&mhdp->mbox_mutex);
=20
=2D       for (i =3D 0; i < sizeof(msg); i++) {
=2D               ret =3D cdns_mhdp_mailbox_write(&mhdp->base, msg[i]);
=2D               if (ret)
=2D                       goto out;
=2D       }
+       ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
+                                    GENERAL_MAIN_CONTROL,
+                                    sizeof(msg), msg);
=20
        /* read the firmware state */
        ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, msg, sizeof(msg));
=2D--8<--

AFAICS cdns_mhdp_mailbox_send() is only a sequence of writes, writing 4 byt=
e=20
header and 1 byte data in this case.

Best regards,
Alexander

>=20
> > > +
> > > +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> > > +                               u8 module_id, u8 opcode,
> > > +                               u16 req_size) {
> > > +     u32 mbox_size, i;
> > > +     u8 header[4];
> > > +     int ret;
> > > +
> > > +     /* read the header of the message */
> > > +     for (i =3D 0; i < sizeof(header); i++) {
> > > +             ret =3D cdns_mhdp_mailbox_read(base);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             header[i] =3D ret;
> > > +     }
> > > +
> > > +     mbox_size =3D get_unaligned_be16(header + 2);
> > > +
> > > +     if (opcode !=3D header[0] || module_id !=3D header[1] ||
> > > +         req_size !=3D mbox_size) {
> > > +             /*
> > > +              * If the message in mailbox is not what we want, we
> > > + need
> >=20
> > to
> >=20
> > > +              * clear the mailbox by reading its contents.
> > > +              */
> > > +             for (i =3D 0; i < mbox_size; i++)
> > > +                     if (cdns_mhdp_mailbox_read(base) < 0)
> > > +                             break;
> > > +
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_header);
> > > +
> > > +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> > > +                             u8 *buff, u16 buff_size) {
> > > +     u32 i;
> > > +     int ret;
> > > +
> > > +     for (i =3D 0; i < buff_size; i++) {
> > > +             ret =3D cdns_mhdp_mailbox_read(base);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             buff[i] =3D ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_data);
> > > +
> > > +int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8
> >=20
> > module_id,
> >=20
> > > +                        u8 opcode, u16 size, u8 *message) {
> > > +     u8 header[4];
> > > +     int ret, i;
> > > +
> > > +     header[0] =3D opcode;
> > > +     header[1] =3D module_id;
> > > +     put_unaligned_be16(size, header + 2);
> > > +
> > > +     for (i =3D 0; i < sizeof(header); i++) {
> > > +             ret =3D cdns_mhdp_mailbox_write(base, header[i]);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     for (i =3D 0; i < size; i++) {
> > > +             ret =3D cdns_mhdp_mailbox_write(base, message[i]);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
> > > +
> > > +/* General helper functions */
> > > +int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32
> > > +*value) {
> > > +     u8 msg[4], resp[8];
> > > +     int ret;
> > > +
> > > +     put_unaligned_be32(addr, msg);
> > > +
> > > +     mutex_lock(base->mbox_mutex);
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
> > > +                                  GENERAL_REGISTER_READ,
> > > +                                  sizeof(msg), msg);
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> >=20
> > MB_MODULE_ID_GENERAL,
> >=20
> > > +
> >=20
> > GENERAL_REGISTER_READ,
> >=20
> > > +                                         sizeof(resp));
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, resp, sizeof(resp));
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     /* Returned address value should be the same as requested */
> > > +     if (memcmp(msg, resp, sizeof(msg))) {
> > > +             ret =3D -EINVAL;
> > > +             goto out;
> > > +     }
> > > +
> > > +     *value =3D get_unaligned_be32(resp + 4);
> > > +
> > > +out:
> > > +     mutex_unlock(base->mbox_mutex);
> > > +     if (ret) {
> > > +             dev_err(base->dev, "Failed to read register\n");
> > > +             *value =3D 0;
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
> > > +
> > > +int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32
> > > +val) {
> > > +     u8 msg[8];
> > > +     int ret;
> > > +
> > > +     put_unaligned_be32(addr, msg);
> > > +     put_unaligned_be32(val, msg + 4);
> > > +
> > > +     mutex_lock(base->mbox_mutex);
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
> > > +                                  GENERAL_REGISTER_WRITE,
> > > +                                  sizeof(msg), msg);
> > > +
> > > +     mutex_unlock(base->mbox_mutex);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
> > > +
> > > +/* DPTX helper functions */
> > > +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> >=20
> > u32
> >=20
> > > +val) {
> > > +     u8 msg[6];
> > > +     int ret;
> > > +
> > > +     put_unaligned_be16(addr, msg);
> > > +     put_unaligned_be32(val, msg + 2);
> > > +
> > > +     mutex_lock(base->mbox_mutex);
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > +                                  DPTX_WRITE_REGISTER,
> >=20
> > sizeof(msg),
> > msg);
> >=20
> > > +
> > > +     mutex_unlock(base->mbox_mutex);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
> > > +
> > > +int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
> > > +                            u8 start_bit, u8 bits_no, u32 val) {
> > > +     u8 field[8];
> > > +     int ret;
> > > +
> > > +     put_unaligned_be16(addr, field);
> > > +     field[2] =3D start_bit;
> > > +     field[3] =3D bits_no;
> > > +     put_unaligned_be32(val, field + 4);
> > > +
> > > +     mutex_lock(base->mbox_mutex);
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > +                                  DPTX_WRITE_FIELD,
> >=20
> > sizeof(field),
> > field);
> >=20
> > > +
> > > +     mutex_unlock(base->mbox_mutex);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
> > > +
> > > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > > +                     u32 addr, u8 *data, u16 len) {
> > > +     u8 msg[5], reg[5];
> > > +     int ret;
> > > +
> > > +     put_unaligned_be16(len, msg);
> > > +     put_unaligned_be24(addr, msg + 2);
> > > +
> > > +     mutex_lock(base->mbox_mutex);
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > +                                  DPTX_READ_DPCD, sizeof(msg),
> >=20
> > msg);
> >=20
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> >=20
> > MB_MODULE_ID_DP_TX,
> >=20
> > > +                                         DPTX_READ_DPCD,
> > > +                                         sizeof(reg) + len);
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, data, len);
> > > +
> > > +out:
> > > +     mutex_unlock(base->mbox_mutex);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
> > > +
> > > +int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8
> > > +value) {
> > > +     u8 msg[6], reg[5];
> > > +     int ret;
> > > +
> > > +     put_unaligned_be16(1, msg);
> > > +     put_unaligned_be24(addr, msg + 2);
> > > +     msg[5] =3D value;
> > > +
> > > +     mutex_lock(base->mbox_mutex);
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > +                                  DPTX_WRITE_DPCD,
> >=20
> > sizeof(msg),
> > msg);
> >=20
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> >=20
> > MB_MODULE_ID_DP_TX,
> >=20
> > > +                                         DPTX_WRITE_DPCD,
> >=20
> > sizeof(reg));
> >=20
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     if (addr !=3D get_unaligned_be24(reg + 2))
> > > +             ret =3D -EINVAL;
> > > +
> > > +out:
> > > +     mutex_unlock(base->mbox_mutex);
> > > +
> > > +     if (ret)
> > > +             dev_err(base->dev, "dpcd write failed: %d\n", ret);
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
> > > +
> > > +MODULE_DESCRIPTION("Cadence MHDP Helper driver");
> > > +MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
> > > +MODULE_LICENSE("GPL");
> > > [...]
> > > diff --git a/include/drm/bridge/cdns-mhdp-helper.h
> > > b/include/drm/bridge/cdns-mhdp-helper.h new file mode 100644 index
> > > 0000000000000..b89db9e842266
> > > --- /dev/null
> > > +++ b/include/drm/bridge/cdns-mhdp-helper.h
> > > @@ -0,0 +1,96 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > > + */
> > > +#ifndef __CDNS_MHDP_HELPER_H__
> > > +#define __CDNS_MHDP_HELPER_H__
> > > +
> > > +#include <asm/unaligned.h>
> > > +#include <linux/iopoll.h>
> > > +
> > > +/* mailbox regs offset */
> > > +#define CDNS_MAILBOX_FULL                    0x00008
> > > +#define CDNS_MAILBOX_EMPTY                   0x0000c
> > > +#define CDNS_MAILBOX_TX_DATA                 0x00010
> > > +#define CDNS_MAILBOX_RX_DATA                 0x00014
> > > +
> > > +#define MAILBOX_RETRY_US                     1000
> > > +#define MAILBOX_TIMEOUT_US                   2000000
> > > +
> > > +/* Module ID Code */
> > > +#define MB_MODULE_ID_DP_TX                   0x01
> > > +#define MB_MODULE_ID_HDMI_TX                 0x03
> > > +#define MB_MODULE_ID_HDCP_TX                 0x07
> > > +#define MB_MODULE_ID_HDCP_RX                 0x08
> > > +#define MB_MODULE_ID_HDCP_GENERAL            0x09
> > > +#define MB_MODULE_ID_GENERAL                 0x0A
> > > +
> > > +/* General Commands */
> > > +#define GENERAL_MAIN_CONTROL                 0x01
> > > +#define GENERAL_TEST_ECHO                    0x02
> > > +#define GENERAL_BUS_SETTINGS                 0x03
> > > +#define GENERAL_TEST_ACCESS                  0x04
> > > +#define GENERAL_REGISTER_WRITE                       0x05
> > > +#define GENERAL_WRITE_FIELD                  0x06
> > > +#define GENERAL_REGISTER_READ                        0x07
> > > +#define GENERAL_GET_HPD_STATE                        0x11
> > > +
> > > +/* DPTX Commands */
> > > +#define DPTX_SET_POWER_MNG                   0x00
> > > +#define DPTX_SET_HOST_CAPABILITIES           0x01
> > > +#define DPTX_GET_EDID                                0x02
> > > +#define DPTX_READ_DPCD                               0x03
> > > +#define DPTX_WRITE_DPCD                              0x04
> > > +#define DPTX_ENABLE_EVENT                    0x05
> > > +#define DPTX_WRITE_REGISTER                  0x06
> > > +#define DPTX_READ_REGISTER                   0x07
> > > +#define DPTX_WRITE_FIELD                     0x08
> > > +#define DPTX_TRAINING_CONTROL                        0x09
> > > +#define DPTX_READ_EVENT                              0x0a
> > > +#define DPTX_READ_LINK_STAT                  0x0b
> > > +#define DPTX_SET_VIDEO                               0x0c
> > > +#define DPTX_SET_AUDIO                               0x0d
> > > +#define DPTX_GET_LAST_AUX_STAUS                      0x0e
> > > +#define DPTX_SET_LINK_BREAK_POINT            0x0f
> > > +#define DPTX_FORCE_LANES                     0x10
> > > +#define DPTX_HPD_STATE                               0x11
> > > +#define DPTX_ADJUST_LT                               0x12
> > > +
> > > +/* HDMI TX Commands */
> > > +#define HDMI_TX_READ                         0x00
> > > +#define HDMI_TX_WRITE                                0x01
> > > +#define HDMI_TX_UPDATE_READ                  0x02
> > > +#define HDMI_TX_EDID                         0x03
> > > +#define HDMI_TX_EVENTS                               0x04
> > > +#define HDMI_TX_HPD_STATUS                   0x05
> > > +
> > > +struct cdns_mhdp_base {
> > > +     struct device *dev;
> > > +     void __iomem *regs;
> > > +     /* protect mailbox communications with the firmware */
> > > +     struct mutex *mbox_mutex;
> > > +};
> > > +
> > > +/* Mailbox helper functions */
> > > +int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base); int
> > > +cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val);
> >=20
> > You can remove these two declarations.
>=20
> cdns_mhdp_mailbox_read will be removed. Thanks!
>=20
> B.R
> Sandor
>=20
> > Best regards,
> > Alexander
> >=20
> > Best regards,
> >=20
> > > +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> > > +                               u8 module_id, u8 opcode, u16
> >=20
> > req_size);
> >=20
> > > +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> > > +                             u8 *buff, u16 buff_size); int
> > > +cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
> > > +                        u8 opcode, u16 size, u8 *message);
> > > +
> > > +/* General commands helper functions */ int cdns_mhdp_reg_read(struct
> > > +cdns_mhdp_base *base, u32 addr, u32 *value); int
> > > +cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val);
> > > +
> > > +/* DPTX commands helper functions */
> > > +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> >=20
> > u32
> >=20
> > > +val); int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16
> > > +addr, +
> > >=20
> > >       u8 start_bit, u8 bits_no, u32 val);
> > >=20
> > > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > > +                     u32 addr, u8 *data, u16 len); int
> > > +cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8
> > > +value);
> > > +
> > > +#endif /* __CDNS_MHDP_HELPER_H__ */
> >=20
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


