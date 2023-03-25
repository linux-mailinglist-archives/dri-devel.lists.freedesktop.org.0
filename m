Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5EC6C8B9E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 07:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943AB10E120;
	Sat, 25 Mar 2023 06:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D05C10E120
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 06:17:28 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id n14so3513594qta.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 23:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679725047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59n4qo01SjOKO006Y7mcNS1vRpkpsDdd1F1qGktUjNI=;
 b=oaer94c2tf4mkM6D9BVutHrcGZKzMCvp9KX4fpYOBLJsDir5GD/61TGOoCXkZBtLnC
 SD5YpJyMR1fkdhKEo/1p8J/kVaRATru4DSDxGq2D1GOHK6uuzuFLHL5wiBI3Cii1Il1W
 dCvFst6CurugIVpQQfWFY1wCoC4TSkz/pR/bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679725047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59n4qo01SjOKO006Y7mcNS1vRpkpsDdd1F1qGktUjNI=;
 b=J55yhI7s07GyfAN/3UjBJMRrMtU2hqyiJDZSUeqi7KKV4vkyMlcEXxIY20dQp731RB
 feEZePxuQKDZFQOv9aiMdqRbEl6932GkiCoIYJ7IQ8iuwOZust9oD7fmhi6KS9d0vj/O
 vCy/68x3NtEpHzNz8w3VRO1ohQXDawHLcuRwffTgZ2KCsAq7Bh/7ageg6LNUj03VZl9l
 izt+GMcc0mx3a9gxJKCDlE6DPYp7XcDnHb8lL3+5Djd9oZoRBn6fEBZBPkyBDianr1gv
 eYc7hFVLPba//AqAnmJbqskP9uHBo4FJyPgVUb8n0o0mESYjghShwFbjo3Ro2P4bRhTx
 JFpg==
X-Gm-Message-State: AO0yUKXMYD+dg5TnijyPFubDP1cW7m6W+uXDIwMrmypk6VdecC4LFS0b
 ABn7Ka50x4fHD+Xs8BfoZ6VIoNZbjwtEGO//OkGNNA==
X-Google-Smtp-Source: AK7set9MMfqlrhs6XUQUONG7xwe5AX/mF0RQU+J7U0XnhiHvMiyCHfvHMtBORxjDESkNw68utqDGMR5mndN5zDupSog=
X-Received: by 2002:a05:622a:614:b0:3e2:60d6:4236 with SMTP id
 z20-20020a05622a061400b003e260d64236mr2067314qta.0.1679725046868; Fri, 24 Mar
 2023 23:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230324072958.2993946-1-hsinyi@chromium.org>
 <f4573a49-ae05-07bf-4e7c-70037b4596b9@intel.com>
 <CAJMQK-gzFc41kDxYHJQzuXtvaJnYN8zvsfHbam4TX+PaYoRE-w@mail.gmail.com>
In-Reply-To: <CAJMQK-gzFc41kDxYHJQzuXtvaJnYN8zvsfHbam4TX+PaYoRE-w@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Sat, 25 Mar 2023 14:17:00 +0800
Message-ID: <CAJMQK-jGNTEpyRTh+VaenjSfr6eMeysJZFzOvvX6WQT9GyEzfw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Add lock for it6505 i2c bank
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kenneth.hung@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 11:34=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
>
> On Fri, Mar 24, 2023 at 8:18=E2=80=AFPM Andrzej Hajda <andrzej.hajda@inte=
l.com> wrote:
> >
> >
> >
> > On 24.03.2023 08:29, Hsin-Yi Wang wrote:
> > > From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> > >
> > > When the i2c bank register (REG_BANK_SEL) is set to 1,
> > > only the registers belong to bank 1 can be written.
> > > There will be a race condition when a process is writing
> > > bank 0 registers while another process set the bank to 1.
> > > Add a mutex to handle regmap read/write locking for
> > > registers in multiple i2c bank. Since the driver now
> > > owns the lock, there's no need to use regmap API's lock.
> > >
> > > Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.=
com>
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >   drivers/gpu/drm/bridge/ite-it6505.c | 72 ++++++++++++++++++++++----=
---
> > >   1 file changed, 55 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/br=
idge/ite-it6505.c
> > > index bc451b2a77c28..1a8dcc49fc1ee 100644
> > > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > > @@ -258,12 +258,12 @@
> > >   #define REG_AUD_INFOFRAM_SUM 0xFB
> > >
> > >   /* the following six registers are in bank1 */
> > > -#define REG_DRV_0_DB_800_MV 0x7E
> > > -#define REG_PRE_0_DB_800_MV 0x7F
> > > -#define REG_PRE_3P5_DB_800_MV 0x81
> > > -#define REG_SSC_CTRL0 0x88
> > > -#define REG_SSC_CTRL1 0x89
> > > -#define REG_SSC_CTRL2 0x8A
> > > +#define REG_DRV_0_DB_800_MV 0x17E
> > > +#define REG_PRE_0_DB_800_MV 0x17F
> > > +#define REG_PRE_3P5_DB_800_MV 0x181
> > > +#define REG_SSC_CTRL0 0x188
> > > +#define REG_SSC_CTRL1 0x189
> > > +#define REG_SSC_CTRL2 0x18A
> > >
> > >   #define RBR DP_LINK_BW_1_62
> > >   #define HBR DP_LINK_BW_2_7
> > > @@ -414,12 +414,14 @@ struct it6505 {
> > >       struct mutex extcon_lock;
> > >       struct mutex mode_lock; /* used to bridge_detect */
> > >       struct mutex aux_lock; /* used to aux data transfers */
> > > +     struct mutex bank_lock; /* used to protect i2c bank access */
> > >       struct regmap *regmap;
> > >       struct drm_display_mode source_output_mode;
> > >       struct drm_display_mode video_info;
> > >       struct notifier_block event_nb;
> > >       struct extcon_dev *extcon;
> > >       struct work_struct extcon_wq;
> > > +     int bank_state;   /* 1 indicates bank 1, 0 indicates bank 0 */
> > >       int extcon_state;
> > >       enum drm_connector_status connector_status;
> > >       enum link_train_status link_state;
> > > @@ -502,8 +504,22 @@ static const struct regmap_config it6505_regmap_=
config =3D {
> > >       .val_bits =3D 8,
> > >       .volatile_table =3D &it6505_bridge_volatile_table,
> > >       .cache_type =3D REGCACHE_NONE,
> > > +     .disable_locking =3D true,
> > > +     .can_sleep =3D true,
> > >   };
> > >
> > > +static int it6505_config_bank(struct it6505 *it6505, unsigned int re=
g_addr)
> > > +{
> > > +     int err =3D 0, target =3D !!(reg_addr > 0xff);
> > > +
> > > +     if (target !=3D it6505->bank_state) {
> >
> > It would be better to return if equal, this way you can avoid indentati=
on.
> >
> Will fix in v2.
> > > +             err =3D regmap_write(it6505->regmap, REG_BANK_SEL, targ=
et);
> > > +             if (!err)
> > > +                     it6505->bank_state =3D target;
> > > +     }
> > > +     return err;
> > > +}
> > > +
> > >   static int it6505_read(struct it6505 *it6505, unsigned int reg_addr=
)
> > >   {
> > >       unsigned int value;
> > > @@ -513,7 +529,10 @@ static int it6505_read(struct it6505 *it6505, un=
signed int reg_addr)
> > >       if (!it6505->powered)
> > >               return -ENODEV;
> > >
> > > -     err =3D regmap_read(it6505->regmap, reg_addr, &value);
> > > +     mutex_lock(&it6505->bank_lock);
> > > +     err =3D it6505_config_bank(it6505, reg_addr);
> > > +     err |=3D regmap_read(it6505->regmap, reg_addr & 0xff, &value);
> >
> > Shoudn't be rather if (!err) err =3D regmap_read(...) ?
> >
> Will fix in v2.
> > > +     mutex_unlock(&it6505->bank_lock);
> > >       if (err < 0) {
> > >               dev_err(dev, "read failed reg[0x%x] err: %d", reg_addr,=
 err);
> > >               return err;
> > > @@ -531,8 +550,10 @@ static int it6505_write(struct it6505 *it6505, u=
nsigned int reg_addr,
> > >       if (!it6505->powered)
> > >               return -ENODEV;
> > >
> > > -     err =3D regmap_write(it6505->regmap, reg_addr, reg_val);
> > > -
> > > +     mutex_lock(&it6505->bank_lock);
> > > +     err =3D it6505_config_bank(it6505, reg_addr);
> > > +     err |=3D regmap_write(it6505->regmap, reg_addr & 0xff, reg_val)=
;
> > > +     mutex_unlock(&it6505->bank_lock);
> > >       if (err < 0) {
> > >               dev_err(dev, "write failed reg[0x%x] =3D 0x%x err =3D %=
d",
> > >                       reg_addr, reg_val, err);
> > > @@ -551,7 +572,10 @@ static int it6505_set_bits(struct it6505 *it6505=
, unsigned int reg,
> > >       if (!it6505->powered)
> > >               return -ENODEV;
> > >
> > > -     err =3D regmap_update_bits(it6505->regmap, reg, mask, value);
> > > +     mutex_lock(&it6505->bank_lock);
> > > +     err =3D it6505_config_bank(it6505, reg);
> > > +     err |=3D regmap_update_bits(it6505->regmap, reg & 0xff, mask, v=
alue);
> > > +     mutex_unlock(&it6505->bank_lock);
> > >       if (err < 0) {
> > >               dev_err(dev, "write reg[0x%x] =3D 0x%x mask =3D 0x%x fa=
iled err %d",
> > >                       reg, value, mask, err);
> > > @@ -892,7 +916,10 @@ static void it6505_aux_reset(struct it6505 *it65=
05)
> > >
> > >   static void it6505_reset_logic(struct it6505 *it6505)
> > >   {
> > > +     mutex_lock(&it6505->bank_lock);
> > > +     it6505_config_bank(it6505, REG_RESET_CTRL);
> > >       regmap_write(it6505->regmap, REG_RESET_CTRL, ALL_LOGIC_RESET);
> > > +     mutex_unlock(&it6505->bank_lock);
> >
> > Why not call it6505_write ?
> Will fix in v2.
> > >       usleep_range(1000, 1500);
> > >   }
> > >
> > > @@ -972,9 +999,14 @@ static ssize_t it6505_aux_operation(struct it650=
5 *it6505,
> > >       it6505_write(it6505, REG_AUX_ADR_16_19,
> > >                    ((address >> 16) & 0x0F) | ((size - 1) << 4));
> > >
> > > -     if (cmd =3D=3D CMD_AUX_NATIVE_WRITE)
> > > +     if (cmd =3D=3D CMD_AUX_NATIVE_WRITE) {
> > > +             mutex_lock(&it6505->bank_lock);
> > > +             it6505_config_bank(it6505, REG_AUX_OUT_DATA0);
> > >               regmap_bulk_write(it6505->regmap, REG_AUX_OUT_DATA0, bu=
ffer,
> > >                                 size);
> > > +             mutex_unlock(&it6505->bank_lock);
> > > +     }
> > > +
> > >
> > >       /* Aux Fire */
> > >       it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
> > > @@ -1197,9 +1229,12 @@ static int it6505_send_video_infoframe(struct =
it6505 *it6505,
> > >       if (err)
> > >               return err;
> > >
> > > -     err =3D regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
> > > +     mutex_lock(&it6505->bank_lock);
> > > +     err =3D it6505_config_bank(it6505, REG_AVI_INFO_DB1);
> > > +     err |=3D regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
> > >                               buffer + HDMI_INFOFRAME_HEADER_SIZE,
> > >                               frame->length);
> > > +     mutex_unlock(&it6505->bank_lock);
> >
> > Common code with it6505_aux_operation, maybe it6505_bulk_write ?
> Will fix in v2.
> >
> > Have you checked if regmap does not support banking? IMO it should be
> > implemented there.
>
> Thanks for the suggestion. Do you mean regmap_field*? I think the
> banking in that series of API is different to the use case here. Since
> we would need to additionally set REG_BANK_SEL to 0 or 1, we still
> need a similar approach to this patch.
> We can also use regmap_multi_reg_write() to carry REG_BANK_SEL and the
> reg we want to write but that would have set REG_BANK_SEL multiple
> times unnecessarily (eg. a consequent write on 2 regs on bank 0
> doesn't need to write REG_BANK_SEL to 0 again on the second one.)
>
We should set selector_reg which should solve the issue.

>
> >
> > Regards
> > Andrzej
> >
> > >       if (err)
> > >               return err;
> > >
> > > @@ -1267,7 +1302,6 @@ static void it6505_init(struct it6505 *it6505)
> > >       it6505_write(it6505, REG_TIME_STMP_CTRL,
> > >                    EN_SSC_GAT | EN_ENHANCE_VID_STMP | EN_ENHANCE_AUD_=
STMP);
> > >       it6505_write(it6505, REG_INFOFRAME_CTRL, 0x00);
> > > -     it6505_write(it6505, REG_BANK_SEL, 0x01);
> > >       it6505_write(it6505, REG_DRV_0_DB_800_MV,
> > >                    afe_setting_table[it6505->afe_setting][0]);
> > >       it6505_write(it6505, REG_PRE_0_DB_800_MV,
> > > @@ -1277,7 +1311,6 @@ static void it6505_init(struct it6505 *it6505)
> > >       it6505_write(it6505, REG_SSC_CTRL0, 0x9E);
> > >       it6505_write(it6505, REG_SSC_CTRL1, 0x1C);
> > >       it6505_write(it6505, REG_SSC_CTRL2, 0x42);
> > > -     it6505_write(it6505, REG_BANK_SEL, 0x00);
> > >   }
> > >
> > >   static void it6505_video_disable(struct it6505 *it6505)
> > > @@ -1506,11 +1539,9 @@ static void it6505_setup_ssc(struct it6505 *it=
6505)
> > >       it6505_set_bits(it6505, REG_TRAIN_CTRL0, SPREAD_AMP_5,
> > >                       it6505->enable_ssc ? SPREAD_AMP_5 : 0x00);
> > >       if (it6505->enable_ssc) {
> > > -             it6505_write(it6505, REG_BANK_SEL, 0x01);
> > >               it6505_write(it6505, REG_SSC_CTRL0, 0x9E);
> > >               it6505_write(it6505, REG_SSC_CTRL1, 0x1C);
> > >               it6505_write(it6505, REG_SSC_CTRL2, 0x42);
> > > -             it6505_write(it6505, REG_BANK_SEL, 0x00);
> > >               it6505_write(it6505, REG_SP_CTRL0, 0x07);
> > >               it6505_write(it6505, REG_IP_CTRL1, 0x29);
> > >               it6505_write(it6505, REG_IP_CTRL2, 0x03);
> > > @@ -1983,8 +2014,11 @@ static int it6505_setup_sha1_input(struct it65=
05 *it6505, u8 *sha1_input)
> > >       it6505_set_bits(it6505, REG_HDCP_CTRL2, HDCP_EN_M0_READ,
> > >                       HDCP_EN_M0_READ);
> > >
> > > -     err =3D regmap_bulk_read(it6505->regmap, REG_M0_0_7,
> > > +     mutex_lock(&it6505->bank_lock);
> > > +     err =3D it6505_config_bank(it6505, REG_M0_0_7);
> > > +     err |=3D regmap_bulk_read(it6505->regmap, REG_M0_0_7,
> > >                              sha1_input + msg_count, 8);
> > > +     mutex_unlock(&it6505->bank_lock);
> > >
> > >       it6505_set_bits(it6505, REG_HDCP_CTRL2, HDCP_EN_M0_READ, 0x00);
> > >
> > > @@ -2577,6 +2611,9 @@ static int it6505_poweron(struct it6505 *it6505=
)
> > >       }
> > >
> > >       it6505->powered =3D true;
> > > +     mutex_lock(&it6505->bank_lock);
> > > +     it6505->bank_state =3D 0;
> > > +     mutex_unlock(&it6505->bank_lock);
> > >       it6505_reset_logic(it6505);
> > >       it6505_int_mask_enable(it6505);
> > >       it6505_init(it6505);
> > > @@ -3359,6 +3396,7 @@ static int it6505_i2c_probe(struct i2c_client *=
client)
> > >       mutex_init(&it6505->extcon_lock);
> > >       mutex_init(&it6505->mode_lock);
> > >       mutex_init(&it6505->aux_lock);
> > > +     mutex_init(&it6505->bank_lock);
> > >
> > >       it6505->bridge.of_node =3D client->dev.of_node;
> > >       it6505->connector_status =3D connector_status_disconnected;
> >
