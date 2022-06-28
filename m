Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524E855F0A0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308A310FC3E;
	Tue, 28 Jun 2022 21:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462CE10FF37
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453267;
 bh=FTS0WBHVw5mYjOegRVw3nfhyqrC1r3khqrbIVBtc0Ps=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iZ0bzg2mXMzU6Dvdho0Ht3Q3r/YfC278G9E7w1hr27YhewpJSJn5Mr4iPHYZT0j/J
 davbaQwvov4W6vZXZoedSnyU1ubrfcg721o+L8unydB3WeDxJjFielWAibu7ZaMY0O
 DPJDvtxdVmWLWwhQEYCpSkwWnZYtOvho3+toCScE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MG9kM-1nrxAE0J3s-00Gase; Tue, 28
 Jun 2022 23:54:27 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/32] drm/via: Add via_i2c.c
Date: Tue, 28 Jun 2022 16:52:29 -0500
Message-Id: <20220628215246.19706-16-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vJpt/Ek14KqmOmiTnZTFM6fgQDoMV5vj6gctqkE9+cTtzdV7Zpa
 Puulad9urbi9Liis39sMeRF1ukrOrWu84LNQxgW+NTIUnU8JkWfJmJqbw5kzt/yH7ac/Rb/
 QXRwuMG309nWLSVE3Z/U2hnw3JAQ50BYBspMF553um3GM8juTbPhEyVt4mtmZHQSwihCUJ8
 tUmXBmB19Hnn3ttf/fCOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JQ9faYLrH/4=:ScZ+bQ/f09u94G8ObEsgsm
 kD7ykwebp8/H45f6Ganq5/jnAAEFPCvh/1IaF2WJbGVQCYqqcAsKasHPPo/6Unt524pphSZeH
 Cmv27I9wlHxXhqqdT6qCtLn6jIXdVvhqvjlEANsjboDIHGyMoo8EgprNRprvMF2zJcxnOuTDg
 Kx0P5pXp7LfVCORt1RfE/sAuV5cqLOakQZCJtdp9XDPIp4hqx5qMM5q99t0tU5YtS5c8TL8Zd
 hxSRSPm/K57gnZtMLc/ouvlW4AWXotHHRQd2a6yZb3K+LocDLZD7BrKbBGthzHso/1p5VriOz
 7u23ow+AzK0JoSJ5z0ndG/n90Su2ZqwvXSr4Dl9KUQc3ASOEJ51M5FZ0SfIeD78SDoOp876s5
 bZTblkVDUPQGU++FC279Zn//Z/UJ//favTUANlvvpd9A5K7liJJGbc2W3Qb87+q+7uhIIKEJy
 MpADtbDHOEDlIZjr0S5jnMmCyQnbYkUmdlV2cOKoPNw+mymj0htUWz8imtAVOobtfImzBNQXz
 R/Yxb/YyXXfqgdTKpo/Wr6PjIuzbzwNOpW5OPlH3mGlWKSY9uUPWewDUaVANLZXpMRVr5FcF5
 TP1ls0bqNGq6Si3go+eggkH3UEJivTHiTdfsrN27omPyNgoHnEKE95NDGeuwQgvhz9yFhCyF/
 uCIB82oOp2IsPC5Ue52R4ucH3j4PNcYHljBKFitaVeYMMh9sx68YEDo4u4z2KhIzFoxPMaeJW
 ojvqfIYUwMPsc449TTldYl1aOF8w/WlGyQ9yIQiB4vfrXpJnWHYFtoTcK4feqUNs60x4xQlUB
 W8XoylXd6p3P7+1MdPhtdkIKOP+27rHm/IOjMpVnSql1eBDAZ64KugIp0Ug9LCaJGY1N97QIa
 kNvk+fx2AVdvt4W9GnwHi3aNdC7bO0iPR++DH6O7zdjWHqJtQRvzMjUCjQ2MzzvzvSpytH+ta
 5OgM5gGHPXY5WIK9U5uRVm/3MsBFnCDqG6eFv4XPxm1muY02XHehw7hoPJOAXpstfsVqq8JNa
 GyhMjXO5H5u8VSMYPDVDHpqcbZTtbyVWR+CTpdlMzDRc1tMCu88hLt/CLZG+igFquDkUubRrT
 DYuoUmGVsp/+ll3kBT8PNfULr8PJfxi1jcu0lX9nYOQ4rZ8lHAPg/tzGg==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Note that the code here is GPL based.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_i2c.c | 209 ++++++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_i2c.c

diff --git a/drivers/gpu/drm/via/via_i2c.c b/drivers/gpu/drm/via/via_i2c.c
new file mode 100644
index 000000000000..f2e8b118754e
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_i2c.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ * Copyright 1998-2009 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2008 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * Author(s):
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/delay.h>
+
+#include "via_drv.h"
+
+enum viafb_i2c_adap;
+
+#include <linux/via_i2c.h>
+
+#define SERIAL	0
+#define	GPIO	1
+
+static struct via_i2c_stuff via_i2c_par[5];
+
+static void via_i2c_setsda(void *data, int state)
+{
+	struct via_i2c_stuff *i2c =3D data;
+	struct drm_device *dev =3D i2c_get_adapdata(&i2c->adapter);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u8 value, mask;
+
+	if (i2c->is_active =3D=3D GPIO) {
+		mask =3D state ? BIT(6) : BIT(6) | BIT(4);
+		value =3D state ? 0x00 : BIT(6);
+	} else {
+		value =3D state ? BIT(4) | BIT(0) : BIT(0);
+		mask =3D BIT(4) | BIT(0);
+	}
+
+	svga_wseq_mask(VGABASE, i2c->i2c_port, value, mask);
+}
+
+static void via_i2c_setscl(void *data, int state)
+{
+	struct via_i2c_stuff *i2c =3D data;
+	struct drm_device *dev =3D i2c_get_adapdata(&i2c->adapter);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u8 value, mask;
+
+	if (i2c->is_active =3D=3D GPIO) {
+		mask =3D state ? BIT(7) : BIT(7) | BIT(5);
+		value =3D state ? 0x00 : BIT(7);
+	} else {
+		value =3D state ? BIT(5) | BIT(0) : BIT(0);
+		mask =3D BIT(5) | BIT(0);
+	}
+
+	svga_wseq_mask(VGABASE, i2c->i2c_port, value, mask);
+}
+
+static int via_i2c_getsda(void *data)
+{
+	struct via_i2c_stuff *i2c =3D data;
+	struct drm_device *dev =3D i2c_get_adapdata(&i2c->adapter);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	return vga_rseq(VGABASE, i2c->i2c_port) & BIT(2);
+}
+
+static int via_i2c_getscl(void *data)
+{
+	struct via_i2c_stuff *i2c =3D data;
+	struct drm_device *dev =3D i2c_get_adapdata(&i2c->adapter);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	return vga_rseq(VGABASE, i2c->i2c_port) & BIT(3);
+}
+
+struct i2c_adapter *via_find_ddc_bus(int port)
+{
+	struct i2c_adapter *adapter =3D NULL;
+	int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(via_i2c_par); i++) {
+		struct via_i2c_stuff *i2c =3D &via_i2c_par[i];
+
+		if (i2c->i2c_port =3D=3D port) {
+			adapter =3D &i2c->adapter;
+			break;
+		}
+	}
+	return adapter;
+}
+
+static int create_i2c_bus(struct drm_device *dev,
+				struct via_i2c_stuff *i2c_par)
+{
+	struct i2c_adapter *adapter =3D &i2c_par->adapter;
+	struct i2c_algo_bit_data *algo =3D &i2c_par->algo;
+
+	algo->setsda =3D via_i2c_setsda;
+	algo->setscl =3D via_i2c_setscl;
+	algo->getsda =3D via_i2c_getsda;
+	algo->getscl =3D via_i2c_getscl;
+	algo->udelay =3D 15;
+	algo->timeout =3D usecs_to_jiffies(2200); /* from VESA */
+	algo->data =3D i2c_par;
+
+	sprintf(adapter->name, "via i2c bit bus 0x%02x", i2c_par->i2c_port);
+	adapter->owner =3D THIS_MODULE;
+	adapter->class =3D I2C_CLASS_DDC;
+	adapter->algo_data =3D algo;
+	i2c_set_adapdata(adapter, dev);
+
+	/* Raise SCL and SDA */
+	via_i2c_setsda(i2c_par, 1);
+	via_i2c_setscl(i2c_par, 1);
+	udelay(20);
+
+	return i2c_bit_add_bus(adapter);
+}
+
+void via_i2c_readbytes(struct i2c_adapter *adapter,
+			u8 slave_addr, char offset,
+			u8 *buffer, unsigned int size)
+{
+	u8 out_buf[2];
+	u8 in_buf[2];
+	struct i2c_msg msgs[] =3D {
+		{
+			.addr =3D slave_addr,
+			.flags =3D 0,
+			.len =3D 1,
+			.buf =3D out_buf,
+		},
+		{
+			.addr =3D slave_addr,
+			.flags =3D I2C_M_RD,
+			.len =3D size,
+			.buf =3D in_buf,
+		}
+	};
+
+	out_buf[0] =3D offset;
+	out_buf[1] =3D 0;
+
+	if (i2c_transfer(adapter, msgs, 2) !=3D 2)
+		printk(KERN_WARNING "%s failed\n", __func__);
+	else
+		*buffer =3D in_buf[0];
+}
+
+void via_i2c_writebytes(struct i2c_adapter *adapter,
+			u8 slave_addr, char offset,
+			u8 *data, unsigned int size)
+{
+	struct i2c_msg msg =3D { 0 };
+	u8 *out_buf;
+
+	out_buf =3D kzalloc(size + 1, GFP_KERNEL);
+	out_buf[0] =3D offset;
+	memcpy(&out_buf[1], data, size);
+	msg.addr =3D slave_addr;
+	msg.flags =3D 0;
+	msg.len =3D size + 1;
+	msg.buf =3D out_buf;
+
+	if (i2c_transfer(adapter, &msg, 1) !=3D 1)
+		printk(KERN_WARNING "%s failed\n", __func__);
+
+	kfree(out_buf);
+}
+
+void via_i2c_reg_init(struct via_drm_priv *dev_priv)
+{
+	svga_wseq_mask(VGABASE, 0x31, 0x30, 0x30);
+	svga_wseq_mask(VGABASE, 0x26, 0x30, 0x30);
+	vga_wseq(VGABASE, 0x2C, 0xc2);
+	vga_wseq(VGABASE, 0x3D, 0xc0);
+	svga_wseq_mask(VGABASE, 0x2C, 0x30, 0x30);
+	svga_wseq_mask(VGABASE, 0x3D, 0x30, 0x30);
+}
+
+int via_i2c_init(struct drm_device *dev)
+{
+	int types[] =3D { SERIAL, SERIAL, GPIO, GPIO, GPIO };
+	int ports[] =3D { 0x26, 0x31, 0x25, 0x2C, 0x3D };
+	int count =3D ARRAY_SIZE(via_i2c_par), ret, i;
+	struct via_i2c_stuff *i2c =3D via_i2c_par;
+
+	for (i =3D 0; i < count; i++) {
+		i2c->is_active =3D types[i];
+		i2c->i2c_port =3D ports[i];
+
+		ret =3D create_i2c_bus(dev, i2c);
+		if (ret < 0)
+			DRM_ERROR("cannot create i2c bus %x:%d\n",
+					ports[i], ret);
+		i2c++;
+	}
+	return 0;
+}
+
+void via_i2c_exit(void)
+{
+	int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(via_i2c_par); i++)
+		i2c_del_adapter(&via_i2c_par->adapter);
+}
=2D-
2.35.1

