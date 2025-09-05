Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D35B47822
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B9210E421;
	Sat,  6 Sep 2025 22:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZyzocV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59AD10E2CB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 08:59:12 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-88432e31114so149499539f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 01:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757062752; x=1757667552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iiismeoj4wyWJdoXzOzbVQuhmPQIcwv/dKDxPtdo+5E=;
 b=UZyzocV1+Jm69ruN6q9bF4ptYss6FKPAFsgW4CwtUvnLsMjC6lfOF6oOzfhza7ThZ/
 VoaeoWbUIiJbzsNfr0w4kfqx4FLkk7x+LNudkWsYqRK9XS/6v9zDHXnF2O4As4bWzKI6
 lD3Rzn80tQu0SBtl+Qy1IjBumxW/CzhrjZqQxJvY4j6UMlmEpvRYLsqQfrkuFSDF2m5o
 it3BLqojQJf0+PsXsEOdFkUGIPCeE36urlI3PxEWKlvR6NZ2KhyVfceQJHlOtjH/B/l9
 mbP/UM/uayIGVCCun4se5OcY7VGhFifhYfBrULNlkLe/jLBWc4qwG/nqzBOggFdgoyWa
 Tgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757062752; x=1757667552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iiismeoj4wyWJdoXzOzbVQuhmPQIcwv/dKDxPtdo+5E=;
 b=lKyCOmZQ025e8ys+SryAeOGoFlgFxFWLT6+MQnZXKgijDDvvwc93PLbqhJ/Yp6Ig2b
 lSPOF6N3ZitUMmAzys3UXMTdP8nf9MA+/GODRPsO95nkmxQuvy/LPQtvS3L3IIQJYlJG
 MNgrhrKfZ3nY5W9iw1P6KyAvYN4VjMVTxYZXBUYX1KrYuorNIMhK+bL2/Um57Nl4/YX4
 txgY2YelB5u6rcaGh1RnP0SjABICbkuSeOODxDyiUmPZ6AHIOE9mIvRas9zWySoPbiFY
 u2itPdQ9HYKi/OOO7TmN0bsUWfrM7bQ9O72yVbTOoq7rSZAw6LXWPBFhAVUlMPnUnfCK
 aqfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe1NfqkmBiE4HSrOeJyDHwsi3lKgBx3ncXa364Rm8IYnA9PZgAEDwXbSCm4mlqwBLF7rEuRO1eNPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfE1aTZHFGM6J5pxyz1X8b+zfq0i1VdmMLPxQN1XGr0/ZEukQv
 fbmHLzmuoj9zIXc9wxQpWirxV++bnUFMvn49QrL1oo+8MTa0aVyF21x6gCPUdbIFZtuXED9zpWJ
 iKNGf5mjMxOTXKpNG7HypYtHjlUptHpc=
X-Gm-Gg: ASbGncsfKScKAnZapEeXzxLcI+H3DwOZOGOc+vS5zDloW8jEUHqEmIVotnHoTmfJK39
 VhRU1ekJHuMW5Ke+stY2mf5PfU48hirSywsYhL4m5EOOKAFckqEZPufbZU0ymHr5EmcXtZHBAqu
 99PkeIFX17nZDTJrgdD/Rlf7CeS9HAnHaDBrCfQKz8iHS/bZgs0jUK4g79FtcigbxDU2Pda1Loc
 3bf7Z0=
X-Google-Smtp-Source: AGHT+IEwzc2CDcYpI3xndtE/6ETJA+vU829vblh/ksDkK488o3afEswYfT7el2Q6znX6gr47bzPBWtl8+YHCtxay7As=
X-Received: by 2002:a05:6e02:168c:b0:3f1:6141:8a40 with SMTP id
 e9e14a558f8ab-3f4021cb5ffmr341671505ab.23.1757062751434; Fri, 05 Sep 2025
 01:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-3-syyang@lontium.com>
 <24rahlm4kkob7knapdxxnjixye3khx3nv2425y4kkirat4lmam@gjey7zqsnzks>
 <CAFQXuNZUfAJe4QEDfi+-1N99xO0_z5_Omnsn_-SXr2QPtvdL_g@mail.gmail.com>
 <7cyypk5j7o5fglmibshg45iysffpdl75m6rqvv4b5zntfevhiz@zlt7ybuzkvrg>
 <CAFQXuNb+Eq6KPFvsnmGvn7KKjn4WRtMy1x4pn4ZvZoQ-_S_fYQ@mail.gmail.com>
 <d3e3b838-26fa-491e-8c4f-63a1693f2391@linaro.org>
In-Reply-To: <d3e3b838-26fa-491e-8c4f-63a1693f2391@linaro.org>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Fri, 5 Sep 2025 16:58:59 +0800
X-Gm-Features: Ac12FXycPouBKQsOiD-rMdgGiRoPpZeehRTIfww98paalAak1XoSqCRhOax9Z2Y
Message-ID: <CAFQXuNbZfnySYmizY2=PJGLkk38WHOYbVcbPTRZvgY7bFdK8yg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] This patch adds a new DRM bridge driver for the
 Lontium LT9611C chip.
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 syyang <syyang@lontium.com>, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 xmzhu@lontium.com, llzhang@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

HI=EF=BC=8C

As a vendors , we have begun to attempt to contribute to the Linux,
and we are very willing to do so.
there are still many rules that we don't understand and need to learn.

<neil.armstrong@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=885=E6=97=A5=E5=
=91=A8=E4=BA=94 16:10=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> First, thanks for submitting a driver for this bridge, it's highly apprec=
iated
> vendors makes this effort.
>
> On 05/09/2025 04:55, =E6=9D=A8=E5=AD=99=E8=BF=90 wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B49=E6=9C=884=E6=97=A5=E5=91=A8=E5=9B=9B 22:39=E5=86=99=E9=81=93=EF=BC=
=9A
> >
> >>
> >> On Thu, Sep 04, 2025 at 06:48:13PM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 =
wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B49=E6=9C=884=E6=97=A5=E5=91=A8=E5=9B=9B 10:52=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Wed, Sep 03, 2025 at 05:38:25AM -0700, syyang wrote:
> >>>>> The following changes are included:
> >>>>>
> >>>>> - Updated Kconfig and Makefile to include the new driver
> >>>>> - Implementation of the bridge driver at
> >>>>>    drivers/gpu/drm/bridge/lontium-lt9611c.c
> >>>>
> >>>> This is really not interesting, it can be seen from the patch itself=
.
> >>>> Please read Documentation/process/submitting-patches.rst.
> >>>>
> >>> Sorry,  I will study submitting-patches.rst.
> >>>
>
> If you're unsure about the quality and acceptability of your patch,
> please submit them as RFC.
>
> If you have questions, you can discuss on IRC with linux developers
> on OFTC #dri-devel for example.
>
we will study it, thks.

> <snip>
>
> >>>>> +
> >>>>> +static unsigned int bits_reverse(u32 in_val, u8 bits)
> >>>>> +{
> >>>>> +     u32 out_val =3D 0;
> >>>>> +     u8 i;
> >>>>> +
> >>>>> +     for (i =3D 0; i < bits; i++) {
> >>>>> +             if (in_val & (1 << i))
> >>>>> +                     out_val |=3D 1 << (bits - 1 - i);
> >>>>> +     }
> >>>>> +
> >>>>> +     return out_val;
> >>>>> +}
> >>>>> +
> >>>>> +static unsigned int get_crc(struct crc_info type, const u8 *buf, u=
64 buf_len)
> >>>>
> >>>> Use library functions for that.
> >>>>
> >>>
> >>> I'm not sure whether the algorithms in the llibrary functions are
> >>> consistent with those designed in our chip.
> >>> If either of them changes, it will cause the firmware updated to the
> >>> chip to fail to run.
> >>
> >> CRC polynoms don't change that easily
> >>
> >>> I think it's safer to implement it using our own code.
> >>
> >> No, it's not.
> >>
> > If we calculate CRC_1 using the library function and then burn it
> > together with the firmware into the chip, when the chip boot, it will
> > use the internal hardware to calculate the firmware CRC_2.
> > If CRC_1 is not equal to CRC_2, the chip will fail to boot. The
> > library function will not be changed. I'm worried that the algorithm
> > in our chip's hardware is different from the library function. I'll
> > research it.
>
> We very well know how checksum checking works, Linux has pretty solid
> CRC library functions that can accomodate any polynomial & init values.
>
> Please look at source/include/linux/crc8.h and use them accordingly.
>
> If some changes would still be needed to generate the required CRC
> then the library functions should be updated.
>
> >
> >>> I'll check it.
> >>>
> >>>>> +{
> >>>>> +     u8 width =3D type.width;
> >>>>> +     u32 poly =3D type.poly;
> >>>>> +     u32 crc =3D type.crc_init;
> >>>>> +     u32 xorout =3D type.xor_out;
> >>>>> +     bool refin =3D type.refin;
> >>>>> +     bool refout =3D type.refout;
> >>>>> +     u8 n;
> >>>>> +     u32 bits;
> >>>>> +     u32 data;
> >>>>> +     u8 i;
> >>>>> +
> >>>>> +     n =3D (width < 8) ? 0 : (width - 8);
> >>>>> +     crc =3D (width < 8) ? (crc << (8 - width)) : crc;
> >>>>> +     bits =3D (width < 8) ? 0x80 : (1 << (width - 1));
> >>>>> +     poly =3D (width < 8) ? (poly << (8 - width)) : poly;
> >>>>> +     while (buf_len--) {
> >>>>> +             data =3D *(buf++);
> >>>>> +             if (refin)
> >>>>> +                     data =3D bits_reverse(data, 8);
> >>>>> +             crc ^=3D (data << n);
> >>>>> +             for (i =3D 0; i < 8; i++) {
> >>>>> +                     if (crc & bits)
> >>>>> +                             crc =3D (crc << 1) ^ poly;
> >>>>> +                     else
> >>>>> +                             crc =3D crc << 1;
> >>>>> +             }
> >>>>> +     }
> >>>>> +     crc =3D (width < 8) ? (crc >> (8 - width)) : crc;
> >>>>> +     if (refout)
> >>>>> +             crc =3D bits_reverse(crc, width);
> >>>>> +     crc ^=3D xorout;
> >>>>> +
> >>>>> +     return (crc & ((2 << (width - 1)) - 1));
> >>>>> +}
> >>>>> +
> >>>>> +static u8 calculate_crc(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct crc_info type =3D {
> >>>>> +             .width =3D 8,
> >>>>> +             .poly =3D 0x31,
> >>>>> +             .crc_init =3D 0,
> >>>>> +             .xor_out =3D 0,
> >>>>> +             .refout =3D false,
> >>>>> +             .refin =3D false,
> >>>>> +     };
> >>>>> +     const u8 *upgrade_data;
> >>>>> +     u64 len;
> >>>>> +     u64 crc_size =3D FW_SIZE - 1;
> >>>>> +     u8 default_val =3D 0xFF;
> >>>>> +
> >>>>> +     if (!lt9611c->fw || !lt9611c->fw->data || lt9611c->fw->size =
=3D=3D 0) {
> >>>>> +             dev_err(lt9611c->dev, "firmware data not available fo=
r CRC\n");
> >>>>> +             return 0;
> >>>>> +     }
> >>>>> +
> >>>>> +     upgrade_data =3D lt9611c->fw->data;
> >>>>> +     len =3D lt9611c->fw->size;
> >>>>> +
> >>>>> +     type.crc_init =3D get_crc(type, upgrade_data, len);
> >>>>> +
> >>>>> +     crc_size -=3D len;
> >>>>> +     while (crc_size--)
> >>>>> +             type.crc_init =3D get_crc(type, &default_val, 1);
> >>>>> +
> >>>>> +     return type.crc_init;
> >>>>> +}
> >>>>> +
> >>>>> +static int i2c_write_byte(struct lt9611c *lt9611c, u8 reg, u8 val)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret =3D 0;
> >>>>> +
> >>>>> +     ret =3D regmap_write(lt9611c->regmap, reg, val);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev,
> >>>>> +                     "regmap_write error: i2c addr=3D0x%02x, reg a=
ddr=3D0x%02x, error=3D%d",
> >>>>> +                     lt9611c->client->addr, reg, ret);
> >>>>> +     }
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int i2c_read_byte(struct lt9611c *lt9611c, u8 reg, u8 *val)
> >>>>
> >>>> Drop these two wrappers, they provide no extra functionality.
> >>>>
> >>>
> >>> I will consider fixing this issue. thanks.
>
> Please avoid dead code and useless wrappers, and make debug code as minim=
al
> as possible and print only when strictly needed, and consider using _dbg
> prints.
>
> >>>
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret =3D 0;
> >>>>> +     unsigned int tmp;
> >>>>> +
> >>>>> +     if (!val)
> >>>>> +             return -EINVAL;
> >>>>> +
> >>>>> +     ret =3D regmap_read(lt9611c->regmap, reg, &tmp);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev,
> >>>>> +                     "regmap_read error: i2c addr=3D0x%02x, reg ad=
dr=3D0x%02x, error=3D%d",
> >>>>> +                     lt9611c->client->addr, reg, ret);
> >>>>> +
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     *val =3D (u8)tmp;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int i2c_read_write_flow(struct lt9611c *lt9611c, u8 *params=
,
> >>>>> +                            unsigned int param_count, u8 *return_b=
uffer,
> >>>>> +                            unsigned int return_count)
> >>>>> +{
> >>>>> +     int count, i;
> >>>>> +     u8 temp;
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
> >>>>> +     i2c_write_byte(lt9611c, 0xDE, 0x01);
> >>>>
> >>>> - lowercase all hex values
> >>>
> >>> i will fix , thanks.
> >>>
> >>>> - use paged writes as implemented for LT9611 and LT9611UXC
> >>>>
> >>> Don't understand.
> >>
> >> Use 16-bit addressing as done by those two drivers. This way 0xff
> >> becomes a page switch.
> >>
> > i will research it.
>
> Regmap supports page switching internally, check out how the other lontiu=
m drivers are designed.
>
> >
> >>>
> >>>>> +
> >>>>> +     count =3D 0;
> >>>>> +     do {
> >>>>> +             i2c_read_byte(lt9611c, 0xAE, &temp);
> >>>>> +             usleep_range(1000, 2000);
> >>>>> +             count++;
> >>>>> +     } while (count < 100 && temp !=3D 0x01);
> >>>>> +
> >>>>> +     if (temp !=3D 0x01)
> >>>>> +             return -1;
> >>>>> +
> >>>>> +     for (i =3D 0; i < param_count; i++) {
> >>>>> +             if (i > 0xDD - 0xB0)
> >>>>> +                     break;
> >>>>> +
> >>>>> +             i2c_write_byte(lt9611c, 0xB0 + i, params[i]);
> >>>>> +     }
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xDE, 0x02);
> >>>>> +
> >>>>> +     count =3D 0;
> >>>>> +     do {
> >>>>> +             i2c_read_byte(lt9611c, 0xAE, &temp);
> >>>>> +             usleep_range(1000, 2000);
> >>>>> +             count++;
> >>>>> +     } while (count < 100 && temp !=3D 0x02);
> >>>>> +
> >>>>> +     if (temp !=3D 0x02)
> >>>>> +             return -2;
> >>>>> +
> >>>>> +     for (i =3D 0; i < return_count; i++)
> >>>>> +             i2c_read_byte(lt9611c, 0x85 + i, &return_buffer[i]);
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_prepare_firmware_data(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     /* ensure filesystem ready */
> >>>>> +     msleep(3000);
> >>>>
> >>>> No. If the firmware is necessary and it's not ready, return
> >>>> -EPROBE_DEFER.
> >>>>
> >>> The firmware is unnecessary . This part of the code is for customers
> >>> who need to upgrade the chip firmware.
> >>>
> >>> Due to the different designs of the platform, the firmware used by
> >>> each customer may be different.
> >>
> >> Well... That's a very bad way to go. We have had this issue with
> >> LT9611UXC at one of my previous jobs. Our customers have had various
> >> kinds of issues because of the wrong firmware.
> >>
> >> Please provide some reference, which works in a DSI-to-HDMI case and
> >> make it _tunable_ rather than requiring to replace the firmware
> >> completely.
> >>
> > i will research it.
> > Yes, you worked together with my colleagues to handle the issue of
> > LT9611UXC. (At that time, you used dmitry.baryshkov@linaro.org)
> >
> >>>
> >>> Therefore, when they need to update the firmware, they only need to
> >>> compile the firmware into the /lib/firmware directory during the
> >>> compilation
> >>> process, and then burn the image into the platform.
> >>>
> >>> Once reboot platform, the firmware upgrade can be automatically compl=
eted.
> >>
> >> The firmware upgrade must be triggered by user, unless the FW is
> >> completely empty.
> >>
> > Is it necessary for the authorities to insist on doing so?
>
> If by authorities you mean the DRM Bridge Maintainers, then since I'm one
> of the maintainers yes I insist you follow this scheme.
>
> But as Dmitry said, if the bridge can work nominally without a firmware u=
pgrade
> then it's simpler to add the firmware update in a second time.
>
> >
> >>>
> >>> When there is no need to upgrade the firmware, this part of the code
> >>> will not affect the operation of the driver.
> >>>
> >>>>> +     ret =3D request_firmware(&lt9611c->fw, FW_FILE, dev);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(dev, "failed load file '%s', error type %d\n"=
, FW_FILE, ret);
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     if (lt9611c->fw->size > FW_SIZE - 1) {
> >>>>> +             dev_err(dev, "firmware too large (%zu > %d)\n", lt961=
1c->fw->size, FW_SIZE - 1);
> >>>>> +             lt9611c->fw =3D NULL;
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>> +
> >>>>> +     dev_info(dev, "firmware size: %zu bytes\n", lt9611c->fw->size=
);
> >>>>> +
> >>>>> +     lt9611c->fw_crc =3D calculate_crc(lt9611c);
> >>>>> +
> >>>>> +     dev_info(dev, "LT9611C.bin crc: 0x%02X\n", lt9611c->fw_crc);
> >>>>
> >>>> No spamming with the unnecessary info. If you want, print the versio=
n
> >>>> of the firmware.
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_config_parameters(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
> >>>>> +     i2c_write_byte(lt9611c, 0xEE, 0x01);
> >>>>> +     //fifo_rst_n
> >>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE1);
> >>>>> +     i2c_write_byte(lt9611c, 0x03, 0x3F);
> >>>>> +     i2c_write_byte(lt9611c, 0x03, 0xFF);
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
> >>>>> +     i2c_write_byte(lt9611c, 0x5E, 0xC1);
> >>>>> +     i2c_write_byte(lt9611c, 0x58, 0x00);
> >>>>> +     i2c_write_byte(lt9611c, 0x59, 0x50);
> >>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x10);
> >>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x00);
> >>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_flash_to_fifo(struct lt9611c *lt9611c, u64 add=
r)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0x5e, 0x5f);
> >>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x20);
> >>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x00);
> >>>>> +     i2c_write_byte(lt9611c, 0x5b, ((addr & 0xFF0000) >> 16));
> >>>>> +     i2c_write_byte(lt9611c, 0x5c, ((addr & 0xFF00) >> 8));
> >>>>> +     i2c_write_byte(lt9611c, 0x5d, (addr & 0xFF));
> >>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x10);
> >>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x00);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_wren(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x04);
> >>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x00);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_wrdi(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
> >>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x08);
> >>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x00);
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_upgrade_judgment(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +     u8 flash_crc;
> >>>>> +
> >>>>> +     if (!lt9611c)
> >>>>> +             return -EINVAL;
> >>>>
> >>>> How can it be NULL here?
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     lt9611c_config_parameters(lt9611c);
> >>>>> +     lt9611c_flash_to_fifo(lt9611c, FW_SIZE - 1);
> >>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
> >>>>> +
> >>>>> +     ret =3D i2c_read_byte(lt9611c, 0x5f, &flash_crc);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "failed to read flash crc\n");
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     dev_info(dev, "flash firmware crc=3D0x%02X, expected crc=3D0x=
%02X",
> >>>>> +              flash_crc, lt9611c->fw_crc);
> >>>>
> >>>> dev_dbg()
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     lt9611c_wrdi(lt9611c);
> >>>>> +
> >>>>> +     return (flash_crc =3D=3D lt9611c->fw_crc) ? NOT_UPGRADE : UPG=
RADE;
> >>>>> +}
> >>>>> +
> >>>>> +static int read_flash_reg_status(struct lt9611c *lt9611c, u8 *stat=
us)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     //fifo_rst_n
> >>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE1);
> >>>>> +     i2c_write_byte(lt9611c, 0x03, 0x3F);
> >>>>> +     i2c_write_byte(lt9611c, 0x03, 0xFF);
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
> >>>>> +     i2c_write_byte(lt9611c, 0x5e, 0x40);
> >>>>> +     i2c_write_byte(lt9611c, 0x56, 0x05);
> >>>>> +     i2c_write_byte(lt9611c, 0x55, 0x25);
> >>>>> +     i2c_write_byte(lt9611c, 0x55, 0x01);
> >>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
> >>>>> +
> >>>>> +     ret =3D i2c_read_byte(lt9611c, 0x5f, status);
> >>>>> +     if (ret < 0)
> >>>>> +             dev_err(dev, "failed to read flash register status\n"=
);
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_block_erase(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     u32 i =3D 0;
> >>>>> +     u8 flash_status =3D 0;
> >>>>> +     u8 block_num =3D 0x00;
> >>>>> +     u32 flash_addr =3D 0x00;
> >>>>> +
> >>>>> +     for (block_num =3D 0; block_num < 2; block_num++) {
> >>>>> +             flash_addr =3D (block_num * 0x008000);
> >>>>> +             i2c_write_byte(lt9611c, 0xFF, 0xE0);
> >>>>> +             i2c_write_byte(lt9611c, 0xEE, 0x01);
> >>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x04);
> >>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x00);
> >>>>> +             i2c_write_byte(lt9611c, 0x5B, flash_addr >> 16);
> >>>>> +             i2c_write_byte(lt9611c, 0x5C, flash_addr >> 8);
> >>>>> +             i2c_write_byte(lt9611c, 0x5D, flash_addr);
> >>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x01);
> >>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x00);
> >>>>> +             msleep(100);
> >>>>> +             i =3D 0;
> >>>>> +             while (1) {
> >>>>> +                     read_flash_reg_status(lt9611c, &flash_status)=
;
> >>>>> +                     if ((flash_status & 0x01) =3D=3D 0)
> >>>>> +                             break;
> >>>>> +
> >>>>> +                     if (i > 50)
> >>>>> +                             break;
> >>>>> +
> >>>>> +                     i++;
> >>>>> +                     msleep(50);
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     dev_info(dev, "erase flash done.\n");
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_crc_to_sram(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0x51, 0x00);
> >>>>> +     i2c_write_byte(lt9611c, 0x55, 0xc0);
> >>>>> +     i2c_write_byte(lt9611c, 0x55, 0x80);
> >>>>> +     i2c_write_byte(lt9611c, 0x5e, 0xc0);
> >>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_data_to_sram(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0x51, 0xff);
> >>>>> +     i2c_write_byte(lt9611c, 0x55, 0x80);
> >>>>> +     i2c_write_byte(lt9611c, 0x5e, 0xc0);
> >>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_sram_to_flash(struct lt9611c *lt9611c, u64 add=
r)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0x5b, ((addr & 0xFF0000) >> 16));
> >>>>> +     i2c_write_byte(lt9611c, 0x5c, ((addr & 0xFF00) >> 8));
> >>>>> +     i2c_write_byte(lt9611c, 0x5d, (addr & 0xFF));
> >>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x30);
> >>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x00);
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_write_data(struct lt9611c *lt9611c, u64 addr)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +     int page =3D 0, num =3D 0, i =3D 0;
> >>>>> +     const u8 *data;
> >>>>> +     u64 size, index;
> >>>>> +     u8 value;
> >>>>> +
> >>>>> +     data =3D lt9611c->fw->data;
> >>>>> +     size =3D lt9611c->fw->size;
> >>>>> +
> >>>>> +     page =3D (size + LT_PAGE_SIZE - 1) / LT_PAGE_SIZE;
> >>>>> +
> >>>>> +     if (page * LT_PAGE_SIZE > 64 * 1024) {
> >>>>> +             dev_err(dev, "firmware size out of range\n");
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>> +
> >>>>> +     dev_info(dev, "%u pages, total size %llu byte\n", page, size)=
;
> >>>>
> >>>>
> >>>> dev_dbg()
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     for (num =3D 0; num < page; num++) {
> >>>>> +             lt9611c_data_to_sram(lt9611c);
> >>>>> +
> >>>>> +             for (i =3D 0; i < LT_PAGE_SIZE; i++) {
> >>>>> +                     index =3D num * LT_PAGE_SIZE + i;
> >>>>> +                     value =3D (index < size) ? data[index] : 0xFF=
;
> >>>>> +
> >>>>> +                     ret =3D i2c_write_byte(lt9611c, 0x59, value);
> >>>>> +                     if (ret < 0) {
> >>>>> +                             dev_err(dev, "write error at page %u,=
 index %u\n", num, i);
> >>>>> +                             return ret;
> >>>>> +                     }
> >>>>> +             }
> >>>>> +
> >>>>> +             lt9611c_wren(lt9611c);
> >>>>> +             lt9611c_sram_to_flash(lt9611c, addr);
> >>>>> +
> >>>>> +             addr +=3D LT_PAGE_SIZE;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c_wrdi(lt9611c);
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_write_crc(struct lt9611c *lt9611c, u64 addr)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +     u8 crc;
> >>>>> +
> >>>>> +     crc =3D lt9611c->fw_crc;
> >>>>> +     lt9611c_crc_to_sram(lt9611c);
> >>>>> +     ret =3D i2c_write_byte(lt9611c, 0x59, crc);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "failed to write CRC\n");
> >>>>> +             return -1;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c_wren(lt9611c);
> >>>>> +     lt9611c_sram_to_flash(lt9611c, addr);
> >>>>> +     lt9611c_wrdi(lt9611c);
> >>>>> +
> >>>>> +     dev_info(dev, "CRC 0x%02X written to flash at addr 0x%llX\n",=
 crc, addr);
> >>>>
> >>>> dev_dbg
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     dev_info(dev, "starting firmware upgrade, size: %zu bytes\n",=
 lt9611c->fw->size);
> >>>>
> >>>> dev_dbg
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     lt9611c_config_parameters(lt9611c);
> >>>>> +     lt9611c_block_erase(lt9611c);
> >>>>> +
> >>>>> +     ret =3D lt9611c_write_data(lt9611c, 0);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "Failed to write firmware data\n");
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D lt9611c_write_crc(lt9611c, FW_SIZE - 1);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "Failed to write firmware CRC\n");
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_upgrade_result(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     u8 crc_result;
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
> >>>>> +     i2c_read_byte(lt9611c, 0x21, &crc_result);
> >>>>> +
> >>>>> +     if (crc_result =3D=3D lt9611c->fw_crc) {
> >>>>> +             dev_info(dev, "LT9611C firmware upgrade success, CRC=
=3D0x%02X\n", crc_result);
> >>>>
> >>>> dev_dbg
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +             return 0;
> >>>>> +     }
> >>>>> +
> >>>>> +     dev_err(dev, "LT9611C firmware upgrade failed, expected CRC=
=3D0x%02X, read CRC=3D0x%02X\n",
> >>>>> +             lt9611c->fw_crc, crc_result);
> >>>>> +     return -EIO;
> >>>>> +}
> >>>>> +
> >>>>> +static struct lt9611c *bridge_to_lt9611c(struct drm_bridge *bridge=
)
> >>>>> +{
> >>>>> +     return container_of(bridge, struct lt9611c, bridge);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_lock(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     mutex_lock(&lt9611c->ocm_lock);
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_unlock(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0xee, 0x00);
> >>>>> +     mutex_unlock(&lt9611c->ocm_lock);
> >>>>> +}
> >>>>> +
> >>>>> +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_i=
d)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D dev_id;
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +     u8 irq_status;
> >>>>> +     u8 cmd[5] =3D {0x52, 0x48, 0x31, 0x3a, 0x00};
> >>>>> +     u8 data[5];
> >>>>> +
> >>>>> +     mutex_lock(&lt9611c->ocm_lock);
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_read_byte(lt9611c, 0x84, &irq_status);
> >>>>> +
> >>>>> +     if (!(irq_status & BIT(0))) {
> >>>>> +             mutex_unlock(&lt9611c->ocm_lock);
> >>>>> +             return IRQ_HANDLED;
> >>>>> +     }
> >>>>> +     dev_info(dev, "HPD interrupt triggered.\n");
> >>>>
> >>>> Nice joke. dev_dbg().
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xdf, irq_status & BIT(0));
> >>>>> +     usleep_range(10000, 12000);
> >>>>
> >>>> Why?
> >>>>
> >>> Our chip design specification requires that this be done when clearin=
g
> >>> the interrupt.
> >>
> >> Add a comment.
> >>
> > i will add comment, thks
> >
> >>>
> >>>>> +     i2c_write_byte(lt9611c, 0xdf, irq_status & (~BIT(0)));
> >>>>> +
> >>>>> +     ret =3D i2c_read_write_flow(lt9611c, cmd, 5, data, 5);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(dev, "failed to read HPD status\n");
> >>>>> +     } else {
> >>>>> +             lt9611c->hdmi_connected =3D (data[4] =3D=3D 0x02);
> >>>>> +             dev_info(dev, "HDMI %s\n", lt9611c->hdmi_connected ? =
"connected" : "disconnected");
> >>>>
> >>>> dev_dbg()
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c->audio_status =3D lt9611c->hdmi_connected ?
> >>>>> +                     connector_status_connected :
> >>>>> +                     connector_status_disconnected;
> >>>>
> >>>> What is it being used for? Why do you need separate status for audio=
?
> >>>>
> >>> Used to update the connection status of the audio.
> >>> The separate status indicators make it clearer for the readers.
> >>>
> >>>>> +
> >>>>> +     schedule_work(&lt9611c->work);
> >>>>> +
> >>>>> +     mutex_unlock(&lt9611c->ocm_lock);
> >>>>> +
> >>>>> +     return IRQ_HANDLED;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_hpd_work(struct work_struct *work)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D container_of(work, struct lt9611c=
, work);
> >>>>> +     bool connected;
> >>>>> +
> >>>>> +     mutex_lock(&lt9611c->ocm_lock);
> >>>>> +     connected =3D lt9611c->hdmi_connected;
> >>>>> +     mutex_unlock(&lt9611c->ocm_lock);
> >>>>> +
> >>>>> +     drm_bridge_hpd_notify(&lt9611c->bridge,
> >>>>> +                           connected ?
> >>>>> +                      connector_status_connected :
> >>>>> +                      connector_status_disconnected);
> >>>>
> >>>> Incorrect indentation.
> >>>>
> >>> ?   The checkpatch.pl did not detect it.
> >>
> >> use --strict.
> >>
> > i will , thks
> >
> >>>
> >>>>> +
> >>>>> +     lt9611c_audio_update_connector_status(lt9611c);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_reset(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> >>>>> +     msleep(20);
> >>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> >>>>> +     msleep(20);
> >>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> >>>>> +     msleep(400);
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_regulator_init(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     lt9611c->supplies[0].supply =3D "vcc";
> >>>>> +     lt9611c->supplies[1].supply =3D "vdd";
> >>>>> +
> >>>>> +     ret =3D devm_regulator_bulk_get(dev, 2, lt9611c->supplies);
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_regulator_enable(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     ret =3D regulator_enable(lt9611c->supplies[0].consumer);
> >>>>> +     if (ret < 0)
> >>>>> +             return ret;
> >>>>> +
> >>>>> +     usleep_range(5000, 10000);
> >>>>> +
> >>>>> +     ret =3D regulator_enable(lt9611c->supplies[1].consumer);
> >>>>> +     if (ret < 0) {
> >>>>> +             regulator_disable(lt9611c->supplies[0].consumer);
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_regulator_disable(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     ret =3D regulator_disable(lt9611c->supplies[0].consumer);
> >>>>> +     if (ret < 0)
> >>>>> +             return ret;
> >>>>> +
> >>>>> +     usleep_range(5000, 10000);
> >>>>> +
> >>>>> +     ret =3D regulator_disable(lt9611c->supplies[1].consumer);
> >>>>> +     if (ret < 0)
> >>>>> +             return ret;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static struct mipi_dsi_device *lt9611c_attach_dsi(struct lt9611c *=
lt9611c,
> >>>>> +                                               struct device_node =
*dsi_node)
> >>>>> +{
> >>>>> +     const struct mipi_dsi_device_info info =3D { "lt9611c", 0, NU=
LL };
> >>>>> +     struct mipi_dsi_device *dsi;
> >>>>> +     struct mipi_dsi_host *host;
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     host =3D of_find_mipi_dsi_host_by_node(dsi_node);
> >>>>> +     if (!host)
> >>>>> +             return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER, "fai=
led to find dsi host\n"));
> >>>>> +
> >>>>> +     dsi =3D devm_mipi_dsi_device_register_full(dev, host, &info);
> >>>>> +     if (IS_ERR(dsi)) {
> >>>>> +             dev_err(dev, "failed to create dsi device\n");
> >>>>> +             return dsi;
> >>>>> +     }
> >>>>> +
> >>>>> +     dsi->lanes =3D 4;
> >>>>> +     dsi->format =3D MIPI_DSI_FMT_RGB888;
> >>>>> +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO=
_SYNC_PULSE |
> >>>>> +                      MIPI_DSI_MODE_VIDEO_HSE;
> >>>>> +
> >>>>> +     ret =3D devm_mipi_dsi_attach(dev, dsi);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "failed to attach dsi to host\n");
> >>>>> +             return ERR_PTR(ret);
> >>>>> +     }
> >>>>> +
> >>>>> +     return dsi;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_bridge_attach(struct drm_bridge *bridge,
> >>>>> +                              struct drm_encoder *encoder,
> >>>>> +                              enum drm_bridge_attach_flags flags)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D bridge_to_lt9611c(bridge);
> >>>>> +
> >>>>> +     return drm_bridge_attach(encoder, lt9611c->next_bridge,
> >>>>> +                              bridge, flags);
> >>>>> +}
> >>>>> +
> >>>>> +static enum drm_mode_status lt9611c_bridge_mode_valid(struct drm_b=
ridge *bridge,
> >>>>> +                                                   const struct dr=
m_display_info *info,
> >>>>> +                      const struct drm_display_mode *mode)
> >>>>> +{
> >>>>> +     u32 pixclk;
> >>>>> +
> >>>>> +     pixclk =3D (mode->htotal * mode->vtotal * drm_mode_vrefresh(m=
ode)) / 1000000;
> >>>>> +
> >>>>> +     if (pixclk >=3D 25 && pixclk <=3D 340)
> >>>>
> >>>> Use .hdmi_tmds_char_rate_valid() for that.
> >>>>
> >>> I will check and test, thanks
> >>>
> >>>>> +             return MODE_OK;
> >>>>> +     else
> >>>>> +             return MODE_BAD;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_bridge_mode_set(struct drm_bridge *bridge,
> >>>>> +                                 const struct drm_display_mode *mo=
de,
> >>>>> +                              const struct drm_display_mode *adj_m=
ode)
> >>>>
> >>>> - Wrong indentation
> >>> will fix, thanks
> >>>
> >>>> - mode_set callback is deprecated and should not be used for new
> >>>>    drivers.
> >>>>
> >>> I found that kernel 6.17 is still in use mode_set callback.
> >>
> >> Check the documentation in drm_bridge_funcs.
> >>
> > i will research.
> >
> >>>
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D bridge_to_lt9611c(bridge);
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +     u32 h_total, hactive, hsync_len, hfront_porch, hback_porch;
> >>>>> +     u32 v_total, vactive, vsync_len, vfront_porch, vback_porch;
> >>>>> +     u8 video_timing_set_cmd[26] =3D {0x57, 0x4D, 0x33, 0x3A};
> >>>>> +     u8 return_timing_set_param[3];
> >>>>> +     u8 framerate;
> >>>>> +     u8 vic =3D 0x00;
> >>>>> +
> >>>>
> >>>>> +     hsync_len =3D mode->hsync_end - mode->hsync_start;
> >>>>> +     hfront_porch =3D mode->hsync_start - mode->hdisplay;
> >>>>> +     hback_porch =3D mode->htotal - mode->hsync_end;
> >>>>> +
> >>>>> +     v_total =3D mode->vtotal;
> >>>>> +     vactive =3D mode->vdisplay;
> >>>>> +     vsync_len =3D mode->vsync_end - mode->vsync_start;
> >>>>> +     vfront_porch =3D mode->vsync_start - mode->vdisplay;
> >>>>> +     vback_porch =3D mode->vtotal - mode->vsync_end;
> >>>>> +     framerate =3D drm_mode_vrefresh(mode);
> >>>>> +     vic =3D drm_match_cea_mode(mode);
> >>>>> +
> >>>>> +     dev_info(dev, "Out video info:\n");
> >>>>> +     dev_info(dev,
> >>>>> +              "h_total=3D%d, hactive=3D%d, hsync_len=3D%d, hfront_=
porch=3D%d, hback_porch=3D%d\n",
> >>>>> +     h_total, hactive, hsync_len, hfront_porch, hback_porch);
> >>>>> +     dev_info(dev,
> >>>>> +              "v_total=3D%d, vactive=3D%d, vsync_len=3D%d, vfront_=
porch=3D%d, vback_porch=3D%d\n",
> >>>>> +     v_total, vactive, vsync_len, vfront_porch, vback_porch);
> >>>>
> >>>>
> >>>> Fix indentation
> >>> The indentation issue was not detected by checkpatch.pl.
> >>
> >> The indentation issue is detected by the brain and eye.
> >>
> > sorry, i will research.
> >
> >>>
> >>>> Use dev_dbg / drm_dbg_kms() all over the driver. Your code is too
> >>>> spammy.
> >>>>
> >>> i will fix, thanks
> >>>
> >>>>> +
> >>>>> +     dev_info(dev, "framerate=3D%d\n", framerate);
> >>>>> +     dev_info(dev, "vic =3D 0x%02X\n", vic);
> >>>>> +
> >>>>> +     video_timing_set_cmd[4] =3D (h_total >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[5] =3D h_total & 0xFF;
> >>>>> +     video_timing_set_cmd[6] =3D (hactive >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[7] =3D hactive & 0xFF;
> >>>>> +     video_timing_set_cmd[8] =3D (hfront_porch >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[9] =3D hfront_porch & 0xFF;
> >>>>> +     video_timing_set_cmd[10] =3D (hsync_len >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[11] =3D hsync_len & 0xFF;
> >>>>> +     video_timing_set_cmd[12] =3D (hback_porch >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[13] =3D hback_porch & 0xFF;
> >>>>> +     video_timing_set_cmd[14] =3D (v_total >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[15] =3D v_total & 0xFF;
> >>>>> +     video_timing_set_cmd[16] =3D (vactive >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[17] =3D vactive & 0xFF;
> >>>>> +     video_timing_set_cmd[18] =3D (vfront_porch >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[19] =3D vfront_porch & 0xFF;
> >>>>> +     video_timing_set_cmd[20] =3D (vsync_len >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[21] =3D vsync_len & 0xFF;
> >>>>> +     video_timing_set_cmd[22] =3D (vback_porch >> 8) & 0xFF;
> >>>>> +     video_timing_set_cmd[23] =3D vback_porch & 0xFF;
> >>>>> +     video_timing_set_cmd[24] =3D framerate;
> >>>>> +     video_timing_set_cmd[25] =3D vic;
> >>>>> +
> >>>>> +     mutex_lock(&lt9611c->ocm_lock);
> >>>>> +     ret =3D i2c_read_write_flow(lt9611c, video_timing_set_cmd, 26=
, return_timing_set_param, 3);
> >>>>> +     if (ret)
> >>>>> +             dev_err(dev, "video set failed\n");
> >>>>> +     mutex_unlock(&lt9611c->ocm_lock);
> >>>>> +}
> >>>>> +
> >>>>> +static enum drm_connector_status lt9611c_bridge_detect(struct drm_=
bridge *bridge,
> >>>>> +                                                    struct drm_con=
nector *connector)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D bridge_to_lt9611c(bridge);
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +     bool connected =3D false;
> >>>>> +     u8 cmd[5] =3D {0x52, 0x48, 0x31, 0x3a, 0x00};
> >>>>> +     u8 data[5];
> >>>>> +
> >>>>> +     mutex_lock(&lt9611c->ocm_lock);
> >>>>> +     ret =3D i2c_read_write_flow(lt9611c, cmd, 5, data, 5);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(dev, "Failed to read HPD status, cannot deter=
mine HDMI connection (err=3D%d)\n",
> >>>>> +                     ret);
> >>>>> +     } else {
> >>>>> +             connected =3D (data[4] =3D=3D 0x02);
> >>>>> +     }
> >>>>
> >>>> THere is no need to put single-line statements in brackets. Drop tho=
se.
> >>>>
> >>> yes, i will fix, thks
> >>>
> >>>>> +
> >>>>> +     lt9611c->hdmi_connected =3D connected;
> >>>>> +
> >>>>> +     if (lt9611c->hdmi_connected)
> >>>>> +             lt9611c->audio_status =3D connector_status_connected;
> >>>>> +     else
> >>>>> +             lt9611c->audio_status =3D connector_status_disconnect=
ed;
> >>>>> +
> >>>>> +     mutex_unlock(&lt9611c->ocm_lock);
> >>>>> +
> >>>>> +     return connected ? connector_status_connected :
> >>>>> +                             connector_status_disconnected;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_read_edid(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret, i, bytes_to_copy, offset =3D 0;
> >>>>> +     u8 packets_num;
> >>>>> +     u8 read_edid_data_cmd[5] =3D {0x52, 0x48, 0x33, 0x3A, 0x00};
> >>>>> +     u8 return_edid_data[37];
> >>>>> +     u8 read_edid_byte_num_cmd[5] =3D {0x52, 0x48, 0x32, 0x3A, 0x0=
0};
> >>>>> +     u8 return_edid_byte_num[6];
> >>>>> +
> >>>>> +     ret =3D i2c_read_write_flow(lt9611c, read_edid_byte_num_cmd, =
5, return_edid_byte_num, 6);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(dev, "Failed to read EDID byte number\n");
> >>>>> +             lt9611c->edid_valid =3D false;
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c->edid_len =3D (return_edid_byte_num[4] << 8) | return=
_edid_byte_num[5];
> >>>>> +
> >>>>> +     if (!lt9611c->edid_buf || lt9611c->edid_len > (lt9611c->edid_=
valid ?
> >>>>> +                             lt9611c->edid_len : 0)) {
> >>>>> +             kfree(lt9611c->edid_buf);
> >>>>> +             lt9611c->edid_buf =3D kzalloc(lt9611c->edid_len, GFP_=
KERNEL);
> >>>>> +             if (!lt9611c->edid_buf) {
> >>>>> +                     dev_err(dev, "Failed to allocate EDID buffer\=
n");
> >>>>> +                     lt9611c->edid_len =3D 0;
> >>>>> +                     lt9611c->edid_valid =3D false;
> >>>>> +                     return -ENOMEM;
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     packets_num =3D (lt9611c->edid_len % 32) ? (lt9611c->edid_len=
 / 32 + 1) :
> >>>>> +             (lt9611c->edid_len / 32);
> >>>>> +     for (i =3D 0; i < packets_num; i++) {
> >>>>> +             read_edid_data_cmd[4] =3D (u8)i;
> >>>>> +             ret =3D i2c_read_write_flow(lt9611c, read_edid_data_c=
md, 5, return_edid_data, 37);
> >>>>> +             if (ret) {
> >>>>> +                     dev_err(dev, "Failed to read EDID packet %d\n=
", i);
> >>>>> +                     lt9611c->edid_valid =3D false;
> >>>>> +                     return -EIO;
> >>>>> +             }
> >>>>> +             offset =3D i * 32;
> >>>>> +             bytes_to_copy =3D min(32, lt9611c->edid_len - offset)=
;
> >>>>> +             memcpy(lt9611c->edid_buf + offset, &return_edid_data[=
5], bytes_to_copy);
> >>>>
> >>>> Don't store EDID in the long-term structures. Read it on demand.
> >>>>
> >>> I will think about this issue.
> >>>
> >>>>> +             }
> >>>>> +
> >>>>> +     lt9611c->edid_valid =3D true;
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_get_edid_block(void *data, u8 *buf, unsigned in=
t block, size_t len)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D data;
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     unsigned int total_blocks;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     if (len > 128)
> >>>>> +             return -EINVAL;
> >>>>> +
> >>>>> +     guard(mutex)(&lt9611c->ocm_lock);
> >>>>> +     if (block =3D=3D 0 || !lt9611c->edid_valid) {
> >>>>> +             ret =3D lt9611c_read_edid(lt9611c);
> >>>>> +             if (ret) {
> >>>>> +                     dev_err(dev, "EDID read failed\n");
> >>>>> +                     return ret;
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     total_blocks =3D lt9611c->edid_len / 128;
> >>>>> +     if (!total_blocks) {
> >>>>> +             dev_err(dev, "No valid EDID blocks\n");
> >>>>> +             return -EIO;
> >>>>> +     }
> >>>>> +
> >>>>> +     if (block >=3D total_blocks) {
> >>>>> +             dev_err(dev,  "Requested block %u exceeds total block=
s %u\n",
> >>>>> +                     block, total_blocks);
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>> +
> >>>>> +     memcpy(buf, lt9611c->edid_buf + block * 128, len);
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static const struct drm_edid *lt9611c_bridge_edid_read(struct drm_=
bridge *bridge,
> >>>>> +                                                    struct drm_con=
nector *connector)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D bridge_to_lt9611c(bridge);
> >>>>> +
> >>>>> +     usleep_range(10000, 20000);
> >>>>
> >>>> Why?
> >>>>
> >>> Delay for a while to ensure that EDID is ready.
> >>
> >> Your other chip had interrupt status to note that EDID is ready. I hop=
e
> >> you have that one too. Blindly calling usleep_range() is a bad idea.
> >>
> > Different chips have different logic. i will research it.
> >
> >>>
> >>>>> +     return drm_edid_read_custom(connector, lt9611c_get_edid_block=
, lt9611c);
> >>>>> +}
> >>>>> +
> >>>>> +static const struct drm_bridge_funcs lt9611c_bridge_funcs =3D {
> >>>>> +     .attach =3D lt9611c_bridge_attach,
> >>>>> +     .mode_valid =3D lt9611c_bridge_mode_valid,
> >>>>> +     .mode_set =3D lt9611c_bridge_mode_set,
> >>>>> +     .detect =3D lt9611c_bridge_detect,
> >>>>> +     .edid_read =3D lt9611c_bridge_edid_read,
> >>>>> +};
> >>>>> +
> >>>>> +static int lt9611c_parse_dt(struct device *dev,
> >>>>> +                         struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     lt9611c->dsi0_node =3D of_graph_get_remote_node(dev->of_node,=
 0, -1);
> >>>>> +     if (!lt9611c->dsi0_node) {
> >>>>> +             dev_err(dev, "failed to get remote node for primary d=
si\n");
> >>>>> +             return -ENODEV;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c->dsi1_node =3D of_graph_get_remote_node(dev->of_node,=
 1, -1);
> >>>>> +
> >>>>> +     return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL,=
 &lt9611c->next_bridge);
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_gpio_init(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +
> >>>>> +     lt9611c->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OU=
T_LOW);
> >>>>> +     if (IS_ERR(lt9611c->reset_gpio)) {
> >>>>> +             dev_err(dev, "failed to acquire reset gpio\n");
> >>>>> +             return PTR_ERR(lt9611c->reset_gpio);
> >>>>> +     }
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_read_version(struct lt9611c *lt9611c, u64 *ver=
sion)
> >>>>> +{
> >>>>> +     u8 val;
> >>>>> +     u64 ver =3D 0;
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
> >>>>> +
> >>>>> +     i2c_read_byte(lt9611c, 0x80, &val);
> >>>>> +     ver =3D val;
> >>>>> +
> >>>>> +     i2c_read_byte(lt9611c, 0x81, &val);
> >>>>> +     ver =3D (ver << 8) | val;
> >>>>> +
> >>>>> +     *version =3D ver;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_read_chipid(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     u8 val =3D 0;
> >>>>> +
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
> >>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
> >>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe1);
> >>>>> +
> >>>>> +     i2c_read_byte(lt9611c, 0x00, &val);
> >>>>> +     if (val !=3D 0x23)
> >>>>> +             return -ENODEV;
> >>>>> +
> >>>>> +     i2c_read_byte(lt9611c, 0x01, &val);
> >>>>> +     if (val !=3D 0x06)
> >>>>> +             return -ENODEV;
> >>>>> +
> >>>>> +     dev_info(dev, "ChipId =3D 0x2306\n");
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_hdmi_hw_params(struct device *dev, void *data,
> >>>>> +                               struct hdmi_codec_daifmt *fmt,
> >>>>> +                              struct hdmi_codec_params *hparms)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> >>>>> +
> >>>>> +      dev_info(lt9611c->dev, "SOC sample_rate: %d, sample_width: %=
d, fmt: %d\n",
> >>>>> +               hparms->sample_rate, hparms->sample_width, fmt->fmt=
);
> >>>>> +
> >>>>> +     switch (hparms->sample_rate) {
> >>>>> +     case 32000:
> >>>>> +     case 44100:
> >>>>> +     case 48000:
> >>>>> +     case 88200:
> >>>>> +     case 96000:
> >>>>> +     case 176400:
> >>>>> +     case 192000:
> >>>>> +             break;
> >>>>> +     default:
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>> +
> >>>>> +     switch (hparms->sample_width) {
> >>>>> +     case 16:
> >>>>> +     case 18:
> >>>>> +     case 20:
> >>>>> +     case 24:
> >>>>> +             break;
> >>>>> +     default:
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>> +
> >>>>> +     switch (fmt->fmt) {
> >>>>> +     case HDMI_I2S:
> >>>>> +     case HDMI_SPDIF:
> >>>>> +             break;
> >>>>> +     default:
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>
> >>>> Does that add anything on top of the limitations of hdmi-codec.c?
> >>>>
> >>> The parameters supported in the hdmi-codec.c may not be supported by
> >>> my chip. Therefore, we can exclude the parameters that are not
> >>> supported by the chip.
> >>
> >> Are they?
> >>
> > The firmware handles all parameter adaptation autonomously. This code
> > merely needs to expose the chip's capabilities to hdmi-codec.c.
> >
> >>>
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_audio_shutdown(struct device *dev, void *data)
> >>>>> +{
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_audio_startup(struct device *dev, void *data)
> >>>>> +{
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_audio_update_connector_status(struct lt9611c *=
lt9611c)
> >>>>> +{
> >>>>> +     enum drm_connector_status status;
> >>>>> +
> >>>>> +     status =3D lt9611c->audio_status;
> >>>>> +     if (lt9611c->plugged_cb && lt9611c->codec_dev)
> >>>>> +             lt9611c->plugged_cb(lt9611c->codec_dev,
> >>>>> +                              status =3D=3D connector_status_conne=
cted);
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_hdmi_audio_hook_plugged_cb(struct device *dev,
> >>>>> +                                           void *data,
> >>>>> +                                      hdmi_codec_plugged_cb fn,
> >>>>> +                                      struct device *codec_dev)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D data;
> >>>>> +
> >>>>> +     lt9611c->plugged_cb =3D fn;
> >>>>> +     lt9611c->codec_dev =3D codec_dev;
> >>>>> +     lt9611c_audio_update_connector_status(lt9611c);
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static const struct hdmi_codec_ops lt9611c_codec_ops =3D {
> >>>>> +     .hw_params      =3D lt9611c_hdmi_hw_params,
> >>>>> +     .audio_shutdown =3D lt9611c_audio_shutdown,
> >>>>> +     .audio_startup =3D lt9611c_audio_startup,
> >>>>> +     .hook_plugged_cb =3D lt9611c_hdmi_audio_hook_plugged_cb,
> >>>>> +};
> >>>>
> >>>> No, we have HDMI audio helpers for that. Drop this and use the helpe=
rs
> >>>> instead.
> >>>>
> >>> =EF=BC=9F=EF=BC=9F=EF=BC=9F I don't understand.
> >>
> >> See <drm/display/drm_hdmi_audio_helper.h> and
> >> https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce17=
93acf@oss.qualcomm.com/
> >>
> > i will research, thks.
> > Could you please share the latest driver file for lt9611uxc.c that you
> > have written? (to this email: syyang@lontium.com)
>
> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/lont=
ium-lt9611uxc.c
>
> >
> >>>
> >>>>> +
> >>>>> +static int lt9611c_audio_init(struct device *dev, struct lt9611c *=
lt9611c)
> >>>>> +{
> >>>>> +     struct hdmi_codec_pdata codec_data =3D {
> >>>>> +             .ops =3D &lt9611c_codec_ops,
> >>>>> +             .max_i2s_channels =3D 2,
> >>>>> +             .i2s =3D 1,
> >>>>> +             .data =3D lt9611c,
> >>>>> +     };
> >>>>> +
> >>>>> +     lt9611c->audio_pdev =3D
> >>>>> +             platform_device_register_data(dev, HDMI_CODEC_DRV_NAM=
E,
> >>>>> +                                           PLATFORM_DEVID_AUTO,
> >>>>> +                                      &codec_data, sizeof(codec_da=
ta));
> >>>>> +
> >>>>> +     return PTR_ERR_OR_ZERO(lt9611c->audio_pdev);
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_audio_exit(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     if (lt9611c->audio_pdev) {
> >>>>> +             platform_device_unregister(lt9611c->audio_pdev);
> >>>>> +             lt9611c->audio_pdev =3D NULL;
> >>>>> +     }
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_firmware_update_store(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     lt9611c_lock(lt9611c);
> >>>>> +     ret =3D lt9611c_prepare_firmware_data(lt9611c);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "Failed prepare firmware data: %d\n", re=
t);
> >>>>> +             goto out;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D lt9611c_firmware_upgrade(lt9611c);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "upgrade failure\n");
> >>>>> +             goto out;
> >>>>> +     }
> >>>>> +     lt9611c_reset(lt9611c);
> >>>>> +     ret =3D lt9611c_upgrade_result(lt9611c);
> >>>>> +     if (ret < 0)
> >>>>> +             goto out;
> >>>>> +
> >>>>> +out:
> >>>>> +     lt9611c_unlock(lt9611c);
> >>>>> +     lt9611c_reset(lt9611c);
> >>>>> +     if (lt9611c->fw) {
> >>>>> +             release_firmware(lt9611c->fw);
> >>>>> +             lt9611c->fw =3D NULL;
> >>>>> +     }
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static ssize_t lt9611c_firmware_store(struct device *dev, struct d=
evice_attribute *attr,
> >>>>> +                                   const char *buf, size_t len)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     ret =3D lt9611c_firmware_update_store(lt9611c);
> >>>>
> >>>> Inline
> >>>>
> >>> i will fix,  thks
> >>>
> >>>>> +     if (ret < 0)
> >>>>> +             return ret;
> >>>>> +     return len;
> >>>>> +}
> >>>>> +
> >>>>> +static ssize_t lt9611c_firmware_show(struct device *dev, struct de=
vice_attribute *attr, char *buf)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> >>>>> +
> >>>>> +     return sysfs_emit(buf, "0x%04llx\n", lt9611c->fw_version);
> >>>>> +}
> >>>>> +
> >>>>> +static DEVICE_ATTR_RW(lt9611c_firmware);
> >>>>> +
> >>>>> +static struct attribute *lt9611c_attrs[] =3D {
> >>>>> +     &dev_attr_lt9611c_firmware.attr,
> >>>>> +     NULL,
> >>>>> +};
> >>>>> +
> >>>>> +static const struct attribute_group lt9611c_attr_group =3D {
> >>>>> +     .attrs =3D lt9611c_attrs,
> >>>>> +};
> >>>>> +
> >>>>> +static const struct attribute_group *lt9611c_attr_groups[] =3D {
> >>>>> +     &lt9611c_attr_group,
> >>>>> +     NULL,
> >>>>> +};
> >>>>> +
> >>>>> +static void lt9611c_cleanup_resources(struct lt9611c *lt9611c)
> >>>>> +{
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +
> >>>>> +     if (lt9611c->work_inited) {
> >>>>> +             cancel_work_sync(&lt9611c->work);
> >>>>> +             lt9611c->work_inited =3D false;
> >>>>> +             dev_err(dev, "work cancelled\n");
> >>>>
> >>>> Why???
> >>>>
> >>> ?? I don't understand.
> >>
> >> Why do you need to be so spammy?
> >>
> > i will fix, thks
> >
> >>>
> >>>>> +     }
> >>>>> +
> >>>>> +     if (lt9611c->bridge_added) {
> >>>>> +             drm_bridge_remove(&lt9611c->bridge);
> >>>>> +             lt9611c->bridge_added =3D false;
> >>>>> +             dev_err(dev, "DRM bridge removed\n");
> >>>>> +     }
> >>>>> +
> >>>>> +     if (lt9611c->regulators_enabled) {
> >>>>> +             regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies),=
 lt9611c->supplies);
> >>>>> +             lt9611c->regulators_enabled =3D false;
> >>>>> +             dev_err(dev, "regulators disabled\n");
> >>>>> +     }
> >>>>> +
> >>>>> +     if (lt9611c->audio_pdev)
> >>>>> +             lt9611c_audio_exit(lt9611c);
> >>>>> +
> >>>>> +     if (lt9611c->fw) {
> >>>>
> >>>> You definitely don't need firmware when the bridge is up and running=
.
> >>>>
> >>> The previous text has already described the working logic of the firm=
ware.
> >>
> >> It's another topic: you are storing the firmware in memory while the
> >> driver is bound. It's not necessary. You can release it after updating
> >> it on the chip.
> >>
> > I understand what you mean.
> > Based on the above conversation, your intention is that when the
> > customer needs to upgrade the firmware, they should modify the
> > comparison conditions of the version, then compile and burn the
> > kernel, and then perform the firmware upgrade, just like the LT9611UXC
> > driver. Instead of loading the firmware every time.
> > My design intention is to avoid the need for recompiling the driver
> > when upgrading. Instead, a file named "LT9611C.bin" can be directly
> > sent to the "/lib/firmware" directory via scp. Then you can either
> > perform a reboot for the upgrade or execute the command manually for
> > the upgrade.
> > Perhaps you are suggesting that we could follow the design approach of
> > the LT9611UXC driver?
>
> Yes no need to rebuild, just use sysfs to trigger an update.
>
I think you haven't attempted to understand the intention behind my design.

If during the debugging process, the customer discovers that a certain
parameter in the chip's firmware is not suitable for the current
situation, then he requests a perfect firmware from our company to be
updated onto the chip.

When there are hundreds or tens of thousands of devices that need to
be updated, simply use sysfs to trigger the update. It is a very bad
thing.

If you want to use version number comparison as the upgrade condition
like in lt9611uxc.c, then the customer will need to modify the version
number comparison condition and rebuild the driver. This method is not
as simple as the one I have designed.

> >
> >>>
> >>>>> +             release_firmware(lt9611c->fw);
> >>>>> +             lt9611c->fw =3D NULL;
> >>>>> +             dev_err(dev, "firmware released\n");
> >>>>> +     }
> >>>>> +
> >>>>> +     if (lt9611c->dsi0_node) {
> >>>>> +             of_node_put(lt9611c->dsi0_node);
> >>>>> +             lt9611c->dsi0_node =3D NULL;
> >>>>> +             dev_err(dev, "dsi0 node released\n");
> >>>>> +     }
> >>>>> +
> >>>>> +     if (lt9611c->dsi1_node) {
> >>>>> +             of_node_put(lt9611c->dsi1_node);
> >>>>> +             lt9611c->dsi1_node =3D NULL;
> >>>>> +             dev_err(dev, "dsi1 node released\n");
> >>>>> +     }
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_main(void *data)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D data;
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +     struct i2c_client *client =3D lt9611c->client;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     lt9611c->work_inited =3D false;
> >>>>> +     lt9611c->bridge_added =3D false;
> >>>>> +     lt9611c->regulators_enabled =3D false;
> >>>>> +
> >>>>> +     ret =3D lt9611c_parse_dt(dev, lt9611c);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(dev, "failed to parse device tree\n");
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D lt9611c_gpio_init(lt9611c);
> >>>>> +     if (ret < 0)
> >>>>> +             goto err_cleanup;
> >>>>> +
> >>>>> +     ret =3D lt9611c_regulator_init(lt9611c);
> >>>>> +     if (ret < 0)
> >>>>> +             goto err_cleanup;
> >>>>> +
> >>>>> +     ret =3D lt9611c_regulator_enable(lt9611c);
> >>>>> +     if (ret)
> >>>>> +             goto err_cleanup;
> >>>>> +
> >>>>> +     lt9611c->regulators_enabled =3D true;
> >>>>> +
> >>>>> +     lt9611c_reset(lt9611c);
> >>>>> +
> >>>>> +     ret =3D lt9611c_read_chipid(lt9611c);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "failed to read chip id.\n");
> >>>>> +             goto err_cleanup;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c_lock(lt9611c);
> >>>>> +     lt9611c_read_version(lt9611c, &lt9611c->fw_version);
> >>>>> +
> >>>>> +     ret =3D lt9611c_prepare_firmware_data(lt9611c);
> >>>>> +     if (ret =3D=3D 0 && lt9611c_upgrade_judgment(lt9611c) =3D=3D =
UPGRADE) {
> >>>>> +             dev_info(dev, "firmware upgrade needed\n");
> >>>>> +
> >>>>> +             ret =3D lt9611c_firmware_upgrade(lt9611c);
> >>>>> +             if (ret < 0) {
> >>>>> +                     dev_err(dev, "firmware upgrade failed\n");
> >>>>> +                     lt9611c_unlock(lt9611c);
> >>>>> +                     goto err_cleanup;
> >>>>> +             }
> >>>>> +
> >>>>> +             lt9611c_reset(lt9611c);
> >>>>> +             ret =3D lt9611c_upgrade_result(lt9611c);
> >>>>> +             if (ret < 0) {
> >>>>> +                     lt9611c_unlock(lt9611c);
> >>>>> +                     goto err_cleanup;
> >>>>> +             }
> >>>>> +
> >>>>> +             lt9611c_read_version(lt9611c, &lt9611c->fw_version);
> >>>>> +             lt9611c_unlock(lt9611c);
> >>>>> +
> >>>>> +     } else {
> >>>>> +             dev_info(dev, "skip firmware upgrade, using chip inte=
rnal firmware\n");
> >>>>> +             lt9611c_unlock(lt9611c);
> >>>>> +     }
> >>>>> +
> >>>>> +     if (lt9611c->fw) {
> >>>>> +             release_firmware(lt9611c->fw);
> >>>>> +             lt9611c->fw =3D NULL;
> >>>>> +     }
> >>>>> +     dev_info(dev, "current version:0x%04llx", lt9611c->fw_version=
);
> >>>>> +
> >>>>> +     INIT_WORK(&lt9611c->work, lt9611c_hpd_work);
> >>>>> +     lt9611c->work_inited =3D true;
> >>>>> +
> >>>>> +     if (!client->irq) {
> >>>>> +             dev_err(dev, "failed to get INTP IRQ\n");
> >>>>> +             ret =3D -ENODEV;
> >>>>> +             goto err_cleanup;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D devm_request_threaded_irq(&client->dev, client->irq, =
NULL,
> >>>>> +                                     lt9611c_irq_thread_handler,
> >>>>> +                                     IRQF_TRIGGER_HIGH | IRQF_ONES=
HOT |
> >>>>> +                                     IRQF_NO_AUTOEN,
> >>>>> +                                     "lt9611c", lt9611c);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(dev, "failed to request irq\n");
> >>>>> +             goto err_cleanup;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c->bridge.funcs =3D &lt9611c_bridge_funcs;
> >>>>> +     lt9611c->bridge.of_node =3D lt9611c->client->dev.of_node;
> >>>>> +     lt9611c->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_=
EDID | DRM_BRIDGE_OP_HPD;
> >>>>> +     lt9611c->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> >>>>> +
> >>>>> +     drm_bridge_add(&lt9611c->bridge);
> >>>>> +     lt9611c->bridge_added =3D true;
> >>>>
> >>>> No unnecessary flags, please. Implement proper cleanup path, unwindi=
ng
> >>>> resources one by one.
> >>>>
> >>> I will consider this issue. thks
> >>>
> >>>>> +
> >>>>> +     /* Attach primary DSI */
> >>>>> +     lt9611c->dsi0 =3D lt9611c_attach_dsi(lt9611c, lt9611c->dsi0_n=
ode);
> >>>>> +     if (IS_ERR(lt9611c->dsi0)) {
> >>>>> +             ret =3D PTR_ERR(lt9611c->dsi0);
> >>>>> +             dev_err(dev, "Failed to attach primary DSI, error=3D%=
d\n", ret);
> >>>>> +             goto err_cleanup;
> >>>>> +     }
> >>>>> +
> >>>>> +     /* Attach secondary DSI, if specified */
> >>>>> +     if (lt9611c->dsi1_node) {
> >>>>> +             lt9611c->dsi1 =3D lt9611c_attach_dsi(lt9611c, lt9611c=
->dsi1_node);
> >>>>> +             if (IS_ERR(lt9611c->dsi1)) {
> >>>>> +                     ret =3D PTR_ERR(lt9611c->dsi1);
> >>>>> +                     dev_err(dev, "Failed to attach secondary DSI,=
 error=3D%d\n", ret);
> >>>>> +                     goto err_cleanup;
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c->audio_status =3D connector_status_disconnected;
> >>>>> +
> >>>>> +     ret =3D lt9611c_audio_init(dev, lt9611c);
> >>>>> +     if (ret < 0) {
> >>>>> +             dev_err(dev, "audio init failed\n");
> >>>>> +             goto err_cleanup;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c_reset(lt9611c);
> >>>>> +     enable_irq(lt9611c->client->irq);
> >>>>> +
> >>>>> +     return 0;
> >>>>> +
> >>>>> +err_cleanup:
> >>>>> +     lt9611c_cleanup_resources(lt9611c);
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_probe(struct i2c_client *client)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c;
> >>>>> +     struct device *dev =3D &client->dev;
> >>>>> +
> >>>>> +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) =
{
> >>>>> +             dev_err(dev, "device doesn't support I2C\n");
> >>>>> +             return -ENODEV;
> >>>>> +     }
> >>>>> +
> >>>>> +     lt9611c =3D devm_kzalloc(dev, sizeof(*lt9611c), GFP_KERNEL);
> >>>>
> >>>> devm_drm_bridge_alloc()
> >>>>
> >>> i will fix, thks
> >>>
> >>>>> +     if (!lt9611c)
> >>>>> +             return -ENOMEM;
> >>>>> +
> >>>>> +     lt9611c->dev =3D dev;
> >>>>> +     lt9611c->client =3D client;
> >>>>> +     mutex_init(&lt9611c->ocm_lock);
> >>>>> +
> >>>>> +     lt9611c->regmap =3D devm_regmap_init_i2c(client, &lt9611c_reg=
map_config);
> >>>>> +     if (IS_ERR(lt9611c->regmap)) {
> >>>>> +             dev_err(dev, "regmap i2c init failed\n");
> >>>>> +             return PTR_ERR(lt9611c->regmap);
> >>>>> +     }
> >>>>> +
> >>>>> +     i2c_set_clientdata(client, lt9611c);
> >>>>> +
> >>>>> +     lt9611c->kthread =3D kthread_run(lt9611c_main, lt9611c, "lt96=
11c");
> >>>>
> >>>> Why do you need extra kthread for that???
> >
> > Upgrading the firmware takes time. execute it sequentially in the
> > probe function, it will block the system boot.
> > Using the kthread method will not block the system boot.
>
> Just follow the drivers/gpu/drm/bridge/lontium-lt9611uxc.c way to do this=
.
>
In fact, I think the method in lontium-lt9611uxc.c is a very bad one.
My clients often encounter situations where the system gets blocked
during the firmware upgrade process, and they have no idea what has
happened.

> >
> >>>>
> >>>>> +     if (IS_ERR(lt9611c->kthread)) {
> >>>>> +             dev_err(dev, "Failed to create kernel thread\n");
> >>>>> +             return PTR_ERR(lt9611c->kthread);
> >>>>> +     }
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void lt9611c_remove(struct i2c_client *client)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D i2c_get_clientdata(client);
> >>>>> +     struct device *dev =3D lt9611c->dev;
> >>>>> +
> >>>>> +     kfree(lt9611c->edid_buf);
> >>>>> +     disable_irq(client->irq);
> >>>>> +     lt9611c_cleanup_resources(lt9611c);
> >>>>> +     mutex_destroy(&lt9611c->ocm_lock);
> >>>>> +     dev_info(dev, "remove driver\n");
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_bridge_suspend(struct device *dev)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     dev_info(lt9611c->dev, "suspend\n");
> >>>>> +     disable_irq(lt9611c->client->irq);
> >>>>> +     ret =3D lt9611c_regulator_disable(lt9611c);
> >>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int lt9611c_bridge_resume(struct device *dev)
> >>>>> +{
> >>>>> +     struct lt9611c *lt9611c =3D dev_get_drvdata(dev);
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     ret =3D lt9611c_regulator_enable(lt9611c);
> >>>>> +     lt9611c_reset(lt9611c);
> >>>>> +     enable_irq(lt9611c->client->irq);
> >>>>> +     dev_info(lt9611c->dev, "resume\n");
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static const struct dev_pm_ops lt9611c_bridge_pm_ops =3D {
> >>>>> +     SET_SYSTEM_SLEEP_PM_OPS(lt9611c_bridge_suspend,
> >>>>> +                             lt9611c_bridge_resume)
> >>>>> +};
> >>>>> +
> >>>>> +static struct i2c_device_id lt9611c_id[] =3D {
> >>>>> +     { "lontium,lt9611c", 0 },
> >>>>> +     { /* sentinel */ }
> >>>>> +};
> >>>>> +
> >>>>> +static const struct of_device_id lt9611c_match_table[] =3D {
> >>>>> +     { .compatible =3D "lontium,lt9611c" },
> >>>>
> >>>> Your schema also had lt9611uxd
> >>>>
> >>> i will fix, thks
> >>>
> >>>>> +     { /* sentinel */ }
> >>>>> +};
> >>>>> +MODULE_DEVICE_TABLE(of, lt9611c_match_table);
> >>>>> +
> >>>>> +static struct i2c_driver lt9611c_driver =3D {
> >>>>> +     .driver =3D {
> >>>>> +             .name =3D "lt9611c",
> >>>>> +             .of_match_table =3D lt9611c_match_table,
> >>>>> +             .pm =3D &lt9611c_bridge_pm_ops,
> >>>>> +             .dev_groups =3D lt9611c_attr_groups,
> >>>>> +     },
> >>>>> +     .probe =3D lt9611c_probe,
> >>>>> +     .remove =3D lt9611c_remove,
> >>>>> +     .id_table =3D lt9611c_id,
> >>>>> +};
> >>>>> +module_i2c_driver(lt9611c_driver);
> >>>>> +
> >>>>> +MODULE_AUTHOR("syyang <syyang@lontium.com>");
> >>>>> +MODULE_LICENSE("GPL v2");
> >>>>> +
> >>>>> +MODULE_FIRMWARE(FW_FILE);
> >>>>> --
> >>>>> 2.25.1
> >>>>>
> >>>>
> >>>> --
> >>>> With best wishes
> >>>> Dmitry
> >>>
> >>> Dmitry, thank you very much
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
