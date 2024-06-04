Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7598FB248
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 14:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA8F10E089;
	Tue,  4 Jun 2024 12:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="C8stc7o3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85C310E089
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 12:32:17 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7eb307de488so19835739f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 05:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717504337; x=1718109137;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUsH8v8smAyapS6jaJ9KM8hLOW31W230G6jfclFXri0=;
 b=C8stc7o3O5hv82gw8zC9p4gYpOTFEqRQxkZiXxIGPSmPwuuylpac+585xjqgKpBFgI
 A321PTkEb2q8KOEfh7jOdpWUlhKWRyrR61mIF+vmTAQN6o0OeBYqvEcP3MX8pQNxg645
 AENJsoFHMAS/b1CJoVbTbfoCqdLLvc2iUeCE1qMTv2wGuZVhCcZtdbmQ1Y6f0PBBkKu0
 QVPssWPxDsqBEYNoKqCN4E23jtdM2FiGBlPkcIo2107O6f9YY9I8JKOxpDwtta87T+kc
 QLExVJMtMS3Y67BuXTVFDDDM77tZjrMngUResejinq6IBuSXsY8MmJUJFUwjt8U9PXDZ
 b89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717504337; x=1718109137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUsH8v8smAyapS6jaJ9KM8hLOW31W230G6jfclFXri0=;
 b=KpoVkrj/tkCkS5eMt2sIeC9CmjJoiiN6Qe5OqXOxi1CNTXfWIWpf6iviZMhTuTFFqq
 ILImaU0O70nQA8N1pLJMR/nZQ1jY4SE6PsNRekAtOHIB0yFBlhWosSoUd4JtysTqvcfl
 vJy0ou9XwGyE6InxjamSadhfrrGFYIhkWbj9CC+bI3vOl3gOvmQkhjAEeRQoElb5ecaJ
 SulL1aGWCUnqsh+rdtlwqnqolsodzhQkJTE76KS/2eKF4CkHZ/Tz6tsudnzi0MLqkOdz
 fUcqdNmpUUqyVlnH1uln+mtZda/HXOz9yDHZXpwsuKnnmiG+GyieZcfAyhVvaRfdyEdG
 oSEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLlmCkfWFn0i/ZZL6A94w2ba+l7KehBfXzxvpAX0kj11xMYfZR3dl7ND6HVm0IsfY8YPDB4nyFxa9U2Bcm4tSACMDxeuzCDNdvOMDr8ySA
X-Gm-Message-State: AOJu0YyasgnnTi/eSUSwj8D3nugIZxMiNgVbDF+02oyXhSTx+1uUJEcM
 n7Av2v0pD1pkruYPHU15tpJG/OSlnZLkNkGWb2l8BIXJLLtYo2bnAxVwZMooLMIFRhNQ0WXwGUo
 y8WFo4/6aE8uHJH52yfJwrALSmkOddS2LVUWv
X-Google-Smtp-Source: AGHT+IHLXtlK8tw3G2TbiOQwV/e33mGggvIK1MynuUFvTgYoEhJ+OpdydVNApPW/Hw3rMcuWAdwVL34f1ekZi/o1XkI=
X-Received: by 2002:a05:6602:3406:b0:7ea:fbae:384c with SMTP id
 ca18e2360f4ac-7eaffea9258mr1552799739f.11.1717504335913; Tue, 04 Jun 2024
 05:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-8-panikiel@google.com>
 <6c9ffe4d-d00f-488f-87be-0370ce23eed2@xs4all.nl>
In-Reply-To: <6c9ffe4d-d00f-488f-87be-0370ce23eed2@xs4all.nl>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Tue, 4 Jun 2024 14:32:04 +0200
Message-ID: <CAM5zL5qNJfQCYAm9iUh5UgKouO_R9NxJpV-04EJz9wsV0n9deQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] media: intel: Add Displayport RX IP driver
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org, 
 robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 3, 2024 at 10:37=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 07/05/2024 17:54, Pawe=C5=82 Anikiel wrote:
> > Add v4l2 subdev driver for the Intel Displayport receiver FPGA IP.
> > It is a part of the DisplayPort Intel FPGA IP Core, and supports
> > DisplayPort 1.4, HBR3 video capture and Multi-Stream Transport.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  drivers/media/platform/intel/Kconfig      |   12 +
> >  drivers/media/platform/intel/Makefile     |    1 +
> >  drivers/media/platform/intel/intel-dprx.c | 2283 +++++++++++++++++++++
> >  3 files changed, 2296 insertions(+)
> >  create mode 100644 drivers/media/platform/intel/intel-dprx.c
> >
> > diff --git a/drivers/media/platform/intel/Kconfig b/drivers/media/platf=
orm/intel/Kconfig
> > index 724e80a9086d..eafcd47cce68 100644
> > --- a/drivers/media/platform/intel/Kconfig
> > +++ b/drivers/media/platform/intel/Kconfig
> > @@ -12,3 +12,15 @@ config VIDEO_PXA27x
> >       select V4L2_FWNODE
> >       help
> >         This is a v4l2 driver for the PXA27x Quick Capture Interface
> > +
> > +config VIDEO_INTEL_DPRX
> > +     tristate "Intel DisplayPort RX IP driver"
> > +     depends on V4L_PLATFORM_DRIVERS
> > +     depends on VIDEO_DEV
> > +     select V4L2_FWNODE
> > +     select CRC_DP
> > +     help
> > +       v4l2 subdev driver for Intel Displayport receiver FPGA IP.
> > +       It is a part of the DisplayPort Intel FPGA IP Core.
> > +       It implements a DisplayPort 1.4 receiver capable of HBR3
> > +       video capture and Multi-Stream Transport.
> > diff --git a/drivers/media/platform/intel/Makefile b/drivers/media/plat=
form/intel/Makefile
> > index 7e8889cbd2df..f571399f5aa8 100644
> > --- a/drivers/media/platform/intel/Makefile
> > +++ b/drivers/media/platform/intel/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_VIDEO_PXA27x) +=3D pxa_camera.o
> > +obj-$(CONFIG_VIDEO_INTEL_DPRX) +=3D intel-dprx.o
> > diff --git a/drivers/media/platform/intel/intel-dprx.c b/drivers/media/=
platform/intel/intel-dprx.c
> > new file mode 100644
> > index 000000000000..734f6c2395bc
> > --- /dev/null
> > +++ b/drivers/media/platform/intel/intel-dprx.c
> > @@ -0,0 +1,2283 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2023-2024 Google LLC.
> > + * Author: Pawe=C5=82 Anikiel <panikiel@google.com>
> > + */
> > +
> > +#include <linux/crc-dp.h>
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-dv-timings.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +#include <drm/display/drm_dp.h>
> > +#include <drm/display/drm_dp_mst.h>
> > +
> > +#define DPRX_MAX_EDID_BLOCKS 4
> > +
> > +/* DPRX registers */
> > +
> > +#define DPRX_RX_CONTROL                              0x000
> > +#define DPRX_RX_CONTROL_LINK_RATE_SHIFT              16
> > +#define DPRX_RX_CONTROL_LINK_RATE_MASK               0xff
> > +#define DPRX_RX_CONTROL_RECONFIG_LINKRATE    13
> > +#define DPRX_RX_CONTROL_TP_SHIFT             8
> > +#define DPRX_RX_CONTROL_TP_MASK                      0x7
> > +#define DPRX_RX_CONTROL_SCRAMBLER_DISABLE    7
> > +#define DPRX_RX_CONTROL_CHANNEL_CODING_SHIFT 5
> > +#define DPRX_RX_CONTROL_CHANNEL_CODING_8B10B 0x1
> > +#define DPRX_RX_CONTROL_LANE_COUNT_SHIFT     0
> > +#define DPRX_RX_CONTROL_LANE_COUNT_MASK              0x1f
> > +
> > +#define DPRX_RX_STATUS                               0x001
> > +#define DPRX_RX_STATUS_INTERLANE_ALIGN               8
> > +#define DPRX_RX_STATUS_SYM_LOCK_SHIFT                4
> > +#define DPRX_RX_STATUS_SYM_LOCK(i)           (4 + i)
> > +#define DPRX_RX_STATUS_CR_LOCK_SHIFT         0
> > +#define DPRX_RX_STATUS_CR_LOCK(i)            (0 + i)
> > +
> > +#define DPRX_MSA_HTOTAL(i)                   (0x022 + 0x20 * (i))
> > +#define DPRX_MSA_VTOTAL(i)                   (0x023 + 0x20 * (i))
> > +#define DPRX_MSA_HSP(i)                              (0x024 + 0x20 * (=
i))
> > +#define DPRX_MSA_HSW(i)                              (0x025 + 0x20 * (=
i))
> > +#define DPRX_MSA_HSTART(i)                   (0x026 + 0x20 * (i))
> > +#define DPRX_MSA_VSTART(i)                   (0x027 + 0x20 * (i))
> > +#define DPRX_MSA_VSP(i)                              (0x028 + 0x20 * (=
i))
> > +#define DPRX_MSA_VSW(i)                              (0x029 + 0x20 * (=
i))
> > +#define DPRX_MSA_HWIDTH(i)                   (0x02a + 0x20 * (i))
> > +#define DPRX_MSA_VHEIGHT(i)                  (0x02b + 0x20 * (i))
> > +#define DPRX_VBID(i)                         (0x02f + 0x20 * (i))
> > +#define DPRX_VBID_MSA_LOCK                   7
> > +
> > +#define DPRX_MST_CONTROL1                    0x0a0
> > +#define DPRX_MST_CONTROL1_VCPTAB_UPD_FORCE   31
> > +#define DPRX_MST_CONTROL1_VCPTAB_UPD_REQ     30
> > +#define DPRX_MST_CONTROL1_VCP_ID_SHIFT(i)    (4 + 4 * (i))
> > +#define DPRX_MST_CONTROL1_VCP_IDS_SHIFT              4
> > +#define DPRX_MST_CONTROL1_VCP_IDS_MASK               0xffff
> > +#define DPRX_MST_CONTROL1_MST_EN             0
> > +
> > +#define DPRX_MST_STATUS1                     0x0a1
> > +#define DPRX_MST_STATUS1_VCPTAB_ACT_ACK              30
> > +
> > +#define DPRX_MST_VCPTAB(i)                   (0x0a2 + i)
> > +
> > +#define DPRX_AUX_CONTROL                     0x100
> > +#define DPRX_AUX_CONTROL_IRQ_EN                      8
> > +#define DPRX_AUX_CONTROL_TX_STROBE           7
> > +#define DPRX_AUX_CONTROL_LENGTH_SHIFT                0
> > +#define DPRX_AUX_CONTROL_LENGTH_MASK         0x1f
> > +
> > +#define DPRX_AUX_STATUS                              0x101
> > +#define DPRX_AUX_STATUS_MSG_READY            31
> > +#define DPRX_AUX_STATUS_READY_TO_TX          30
> > +
> > +#define DPRX_AUX_COMMAND                     0x102
> > +
> > +#define DPRX_AUX_HPD                         0x119
> > +#define DPRX_AUX_HPD_IRQ                     12
> > +#define DPRX_AUX_HPD_EN                              11
> > +
> > +/* DDC defines */
> > +
> > +#define DDC_EDID_ADDR                0x50
> > +#define DDC_SEGMENT_ADDR     0x30
> > +
> > +struct dprx_training_control {
> > +     u8 volt_swing;
> > +     u8 pre_emph;
> > +     bool max_swing;
> > +     bool max_pre_emph;
> > +};
> > +
> > +struct dprx_sink {
> > +     u8 edid[128 * DPRX_MAX_EDID_BLOCKS];
> > +     int blocks;
> > +     int offset;
> > +     int segment;
> > +};
> > +
> > +struct msg_transaction_rxbuf {
> > +     u8 buf[256];
> > +     int len;
> > +};
> > +
> > +struct msg_transaction_txbuf {
> > +     u8 buf[256];
> > +     int len;
> > +     int written;
> > +};
> > +
> > +struct msg_transaction_meta {
> > +     u8 lct;
> > +     u8 rad[8];
> > +     bool seqno;
> > +};
> > +
> > +struct dprx {
> > +     struct device *dev;
> > +     void __iomem *iobase;
> > +
> > +     struct v4l2_subdev subdev;
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +     struct media_pad pads[5];
> > +
> > +     struct dprx_sink sinks[4];
> > +
> > +     int max_link_rate;
> > +     int max_lane_count;
> > +     bool multi_stream_support;
> > +     int max_stream_count;
> > +
> > +     u8 caps[16];
> > +     u8 guid[16];
> > +
> > +     struct dprx_training_control training_control[4];
> > +
> > +     u8 payload_allocate_set;
> > +     u8 payload_allocate_start_time_slot;
> > +     u8 payload_allocate_time_slot_count;
> > +     u8 payload_table[64];
> > +     u8 payload_table_updated;
> > +
> > +     u8  payload_id[4];
> > +     u32 payload_pbn[4];
> > +     u32 payload_pbn_total;
> > +
> > +     u8 irq_vector;
> > +
> > +     u8 down_req_buf[48];
> > +     u8 down_rep_buf[48];
> > +
> > +     struct msg_transaction_rxbuf mt_rxbuf[2];
> > +     struct msg_transaction_txbuf mt_txbuf[2];
> > +     struct msg_transaction_meta mt_meta[2];
> > +     bool mt_seqno;
> > +     bool mt_pending;
> > +     bool down_rep_pending;
> > +
> > +     spinlock_t lock;
> > +
> > +     bool hpd_state;
> > +};
> > +
> > +struct aux_buf {
> > +     u8 data[20];
> > +     int len;
> > +};
> > +
> > +struct aux_msg {
> > +     u8 cmd;
> > +     u32 addr;
> > +     u8 len;
> > +     u8 data[16];
> > +};
> > +
> > +struct sideband_msg {
> > +     u8 lct;
> > +     u8 lcr;
> > +     u8 rad[8];
> > +     bool broadcast;
> > +     bool path_msg;
> > +     bool somt;
> > +     bool eomt;
> > +     bool seqno;
> > +
> > +     u8 body[48];
> > +     u8 body_len;
> > +};
> > +
> > +static int dprx_pad_to_sink_idx(struct dprx *dprx, int pad)
> > +{
> > +     int sink_idx =3D pad - 1;
> > +
> > +     if (sink_idx < 0 || sink_idx >=3D dprx->max_stream_count)
> > +             return -1;
> > +     else
> > +             return sink_idx;
> > +}
> > +
> > +static void dprx_write(struct dprx *dprx, int addr, u32 val)
> > +{
> > +     writel(val, dprx->iobase + (addr * 4));
> > +}
> > +
> > +static u32 dprx_read(struct dprx *dprx, int addr)
> > +{
> > +     return readl(dprx->iobase + (addr * 4));
> > +}
> > +
> > +static void dprx_set_irq(struct dprx *dprx, int val)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_AUX_CONTROL);
> > +     reg |=3D ~(1 << DPRX_AUX_CONTROL_IRQ_EN);
> > +     reg |=3D val << DPRX_AUX_CONTROL_IRQ_EN;
> > +     dprx_write(dprx, DPRX_AUX_CONTROL, reg);
> > +}
> > +
> > +static void dprx_set_hpd(struct dprx *dprx, int val)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_AUX_HPD);
> > +     reg &=3D ~(1 << DPRX_AUX_HPD_EN);
> > +     reg |=3D val << DPRX_AUX_HPD_EN;
> > +     dprx_write(dprx, DPRX_AUX_HPD, reg);
> > +}
> > +
> > +static void dprx_pulse_hpd(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_AUX_HPD);
> > +     reg |=3D 1 << DPRX_AUX_HPD_IRQ;
> > +     dprx_write(dprx, DPRX_AUX_HPD, reg);
> > +}
> > +
> > +static void dprx_clear_vc_payload_table(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +     int i;
> > +
> > +     memset(dprx->payload_table, 0, sizeof(dprx->payload_table));
> > +
> > +     for (i =3D 0; i < 8; i++)
> > +             dprx_write(dprx, DPRX_MST_VCPTAB(i), 0);
> > +
> > +     reg =3D dprx_read(dprx, DPRX_MST_CONTROL1);
> > +     reg &=3D ~(DPRX_MST_CONTROL1_VCP_IDS_MASK << DPRX_MST_CONTROL1_VC=
P_IDS_SHIFT);
> > +     reg |=3D 1 << DPRX_MST_CONTROL1_VCPTAB_UPD_FORCE;
> > +     dprx_write(dprx, DPRX_MST_CONTROL1, reg);
> > +}
> > +
> > +static void dprx_set_vc_payload_table(struct dprx *dprx)
> > +{
> > +     int i, j;
> > +     u32 reg;
> > +     u8 val;
> > +
> > +     /*
> > +      * The IP core only accepts VC payload IDs of 1-4. Thus, we need =
to
> > +      * remap the 1-63 range allowed by DisplayPort into 1-4. However,=
 some
> > +      * hosts first set the VC payload table and then allocate the VC
> > +      * payload IDs, which means we can't remap the range immediately.
> > +      *
> > +      * It is probably possible to force a VC payload table update (wi=
thout
> > +      * waiting for a ACT trigger) when the IDs change, but for now we=
 just
> > +      * ignore IDs higher than 4.
> > +      */
> > +     for (i =3D 0; i < 8; i++) {
> > +             reg =3D 0;
> > +             for (j =3D 0; j < 8; j++) {
> > +                     val =3D dprx->payload_table[i*8+j];
> > +                     if (val <=3D 4)
> > +                             reg |=3D val << (j * 4);
> > +             }
> > +             dprx_write(dprx, DPRX_MST_VCPTAB(i), reg);
> > +     }
> > +
> > +     reg =3D dprx_read(dprx, DPRX_MST_CONTROL1);
> > +     reg |=3D 1 << DPRX_MST_CONTROL1_VCPTAB_UPD_REQ;
> > +     dprx_write(dprx, DPRX_MST_CONTROL1, reg);
> > +}
> > +
> > +static void dprx_set_vc_ids(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +     int i;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_MST_CONTROL1);
> > +     reg &=3D ~(DPRX_MST_CONTROL1_VCP_IDS_MASK << DPRX_MST_CONTROL1_VC=
P_IDS_SHIFT);
> > +     for (i =3D 0; i < dprx->max_stream_count; i++) {
> > +             if (dprx->payload_id[i] <=3D 4)
> > +                     reg |=3D dprx->payload_id[i] << DPRX_MST_CONTROL1=
_VCP_ID_SHIFT(i);
> > +     }
> > +     dprx_write(dprx, DPRX_MST_CONTROL1, reg);
> > +}
> > +
> > +static void dprx_allocate_vc_payload(struct dprx *dprx, u8 start, u8 c=
ount, u8 id)
> > +{
> > +     if (count > sizeof(dprx->payload_table) - start)
> > +             count =3D sizeof(dprx->payload_table) - start;
> > +     memset(dprx->payload_table + start, id, count);
> > +}
> > +
> > +static void dprx_deallocate_vc_payload(struct dprx *dprx, int start, u=
8 id)
> > +{
> > +     u8 to =3D start;
> > +     u8 i;
> > +
> > +     for (i =3D start; i < sizeof(dprx->payload_table); i++) {
> > +             if (dprx->payload_table[i] =3D=3D id)
> > +                     dprx->payload_table[i] =3D 0;
> > +             else
> > +                     dprx->payload_table[to++] =3D dprx->payload_table=
[i];
> > +     }
> > +}
> > +
> > +static u32 dprx_full_pbn(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +     u32 lane_count;
> > +     u32 link_rate;
> > +
> > +     if ((dprx_read(dprx, DPRX_RX_STATUS) >> DPRX_RX_STATUS_INTERLANE_=
ALIGN) & 1) {
> > +             /* link training done - get current bandwidth */
> > +             reg =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +             lane_count =3D (reg >> DPRX_RX_CONTROL_LANE_COUNT_SHIFT) =
&
> > +                          DPRX_RX_CONTROL_LANE_COUNT_MASK;
> > +             link_rate  =3D (reg >> DPRX_RX_CONTROL_LINK_RATE_SHIFT) &
> > +                          DPRX_RX_CONTROL_LINK_RATE_MASK;
> > +     } else {
> > +             /* link training not done - get max bandwidth */
> > +             lane_count =3D dprx->max_lane_count;
> > +             link_rate  =3D dprx->max_link_rate;
> > +     }
> > +
> > +     return lane_count * link_rate * 32;
> > +}
> > +
> > +static int dprx_port_number_to_sink_idx(struct dprx *dprx, u8 port_num=
ber)
> > +{
> > +     /* check if port number is valid */
> > +     if (port_number < DP_MST_LOGICAL_PORT_0 ||
> > +         port_number >=3D DP_MST_LOGICAL_PORT_0 + dprx->max_stream_cou=
nt)
> > +             return -1;
> > +
> > +     return port_number - DP_MST_LOGICAL_PORT_0;
> > +}
> > +
> > +static bool dprx_adjust_needed(struct dprx *dprx)
> > +{
> > +     u32 control;
> > +     u32 status;
> > +     u32 lane_count;
> > +     u32 lane_count_mask;
> > +     u32 pattern;
> > +
> > +     control =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +     status =3D dprx_read(dprx, DPRX_RX_STATUS);
> > +
> > +     pattern =3D (control >> DPRX_RX_CONTROL_TP_SHIFT) & DPRX_RX_CONTR=
OL_TP_MASK;
> > +     lane_count =3D (control >> DPRX_RX_CONTROL_LANE_COUNT_SHIFT) &
> > +                  DPRX_RX_CONTROL_LANE_COUNT_MASK;
> > +     lane_count_mask =3D (1 << lane_count) - 1;
> > +
> > +     if (pattern =3D=3D 0) {
> > +             /* link training not in progress */
> > +             return false;
> > +     } else if (pattern =3D=3D 1) {
> > +             /* link training CR phase - check CR lock */
> > +             return (~status) & (lane_count_mask << DPRX_RX_STATUS_CR_=
LOCK_SHIFT);
> > +     }
> > +     /* link training EQ phase - check synbol lock and interlane align=
 */
> > +     return (~status) & (lane_count_mask << DPRX_RX_STATUS_SYM_LOCK_SH=
IFT |
> > +                         1 << DPRX_RX_STATUS_INTERLANE_ALIGN);
> > +}
> > +
> > +/*
> > + * Return next allowed voltage swing, and pre-emphasis pair.
> > + * DisplayPort 1.2 spec, section 3.1.5.2
> > + */
> > +static void dprx_training_control_next(struct dprx_training_control *c=
tl,
> > +                                    u8 *next_volt_swing, u8 *next_pre_=
emph)
> > +{
> > +     u8 volt_swing =3D ctl->volt_swing;
> > +     u8 pre_emph =3D ctl->pre_emph;
> > +
> > +     pre_emph++;
> > +     if (pre_emph > 2) {
> > +             volt_swing++;
> > +             pre_emph =3D 0;
> > +     }
> > +
> > +     if (volt_swing > 2 || (volt_swing =3D=3D 2 && pre_emph =3D=3D 2))=
 {
> > +             volt_swing =3D 0;
> > +             pre_emph =3D 0;
> > +     }
> > +
> > +     *next_volt_swing =3D volt_swing;
> > +     *next_pre_emph =3D pre_emph;
> > +}
> > +
> > +static int dprx_i2c_read(struct dprx_sink *sink, u8 addr, u8 *buf, int=
 len)
> > +{
> > +     int offset;
> > +
> > +     if (len =3D=3D 0)
> > +             return 0;
> > +
> > +     switch (addr) {
> > +     case DDC_EDID_ADDR:
> > +             offset =3D sink->offset + sink->segment * 256;
> > +             if (len + offset > sink->blocks * 128)
> > +                     return -1;
> > +             memcpy(buf, sink->edid + offset, len);
> > +             sink->offset +=3D len;
> > +             break;
> > +     case DDC_SEGMENT_ADDR:
> > +             if (len > 1)
> > +                     return -1;
> > +             buf[0] =3D sink->segment;
> > +             break;
> > +     default:
> > +             return -1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dprx_i2c_write(struct dprx_sink *sink, u8 addr, u8 *buf, in=
t len)
> > +{
> > +     if (len =3D=3D 0)
> > +             return 0;
> > +     if (len > 1)
> > +             return -1;
> > +
> > +     switch (addr) {
> > +     case DDC_EDID_ADDR:
> > +             sink->offset =3D buf[0];
> > +             break;
> > +     case DDC_SEGMENT_ADDR:
> > +             sink->segment =3D buf[0];
> > +             break;
> > +     default:
> > +             return -1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void dprx_i2c_stop(struct dprx_sink *sink)
> > +{
> > +     sink->segment =3D 0;
> > +}
> > +
> > +static void dprx_write_nak(struct dprx *dprx,
> > +                        struct drm_dp_sideband_msg_reply_body *rep,
> > +                        u8 req_type, u8 reason)
> > +{
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_NAK;
> > +     rep->req_type =3D req_type;
> > +
> > +     memcpy(rep->u.nak.guid, dprx->guid, sizeof(dprx->guid));
> > +     rep->u.nak.reason =3D reason;
> > +     rep->u.nak.nak_data =3D 0;
> > +}
> > +
> > +static void dprx_execute_link_address(struct dprx *dprx,
> > +                                   struct drm_dp_sideband_msg_req_body=
 *req,
> > +                                   struct drm_dp_sideband_msg_reply_bo=
dy *rep)
> > +{
> > +     struct drm_dp_link_address_ack_reply *link_address =3D &rep->u.li=
nk_addr;
> > +     struct drm_dp_link_addr_reply_port *port =3D link_address->ports;
> > +     int i;
> > +
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_LINK_ADDRESS;
> > +
> > +     memcpy(link_address->guid, dprx->guid, sizeof(dprx->guid));
> > +     link_address->nports =3D dprx->max_stream_count + 1;
> > +
> > +     /* Port 0: input (physical) */
> > +     port->input_port =3D true;
> > +     port->peer_device_type =3D DP_PEER_DEVICE_SOURCE_OR_SST;
> > +     port->port_number =3D 0;
> > +     port->mcs =3D false;
> > +     port->ddps =3D true;
> > +     port++;
> > +
> > +     for (i =3D 0; i < dprx->max_stream_count; i++) {
> > +             /* Port 8 + n: internal sink number n (logical) */
> > +             port->input_port =3D false;
> > +             port->port_number =3D DP_MST_LOGICAL_PORT_0 + i;
> > +             port->mcs =3D false;
> > +             if (dprx->sinks[i].blocks > 0) {
> > +                     port->peer_device_type =3D DP_PEER_DEVICE_SST_SIN=
K;
> > +                     port->ddps =3D true;
> > +             } else {
> > +                     port->peer_device_type =3D DP_PEER_DEVICE_NONE;
> > +                     port->ddps =3D false;
> > +             }
> > +             port->legacy_device_plug_status =3D false;
> > +             port->dpcd_revision =3D 0;
> > +             memset(port->peer_guid, 0, 16);
> > +             port->num_sdp_streams =3D 0;
> > +             port->num_sdp_stream_sinks =3D 0;
> > +             port++;
> > +     }
> > +}
> > +
> > +static void dprx_execute_connection_status_notify(struct dprx *dprx,
> > +                                               struct drm_dp_sideband_=
msg_req_body *req,
> > +                                               struct drm_dp_sideband_=
msg_reply_body *rep)
> > +{
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_CONNECTION_STATUS_NOTIFY;
> > +}
> > +
> > +static void dprx_execute_enum_path_resources(struct dprx *dprx,
> > +                                          struct drm_dp_sideband_msg_r=
eq_body *req,
> > +                                          struct drm_dp_sideband_msg_r=
eply_body *rep)
> > +{
> > +     u32 full_pbn =3D dprx_full_pbn(dprx);
> > +
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_ENUM_PATH_RESOURCES;
> > +
> > +     rep->u.path_resources.port_number =3D req->u.port_num.port_number=
;
> > +     rep->u.path_resources.fec_capable =3D false;
> > +     rep->u.path_resources.full_payload_bw_number =3D full_pbn;
> > +     if (dprx->payload_pbn_total > full_pbn)
> > +             rep->u.path_resources.avail_payload_bw_number =3D 0;
> > +     else
> > +             rep->u.path_resources.avail_payload_bw_number =3D full_pb=
n - dprx->payload_pbn_total;
> > +}
> > +
> > +static void dprx_execute_allocate_payload(struct dprx *dprx,
> > +                                       struct drm_dp_sideband_msg_req_=
body *req,
> > +                                       struct drm_dp_sideband_msg_repl=
y_body *rep)
> > +{
> > +     struct drm_dp_allocate_payload *a_req =3D &req->u.allocate_payloa=
d;
> > +     struct drm_dp_allocate_payload_ack_reply *a_rep =3D &rep->u.alloc=
ate_payload;
> > +     int sink_idx;
> > +
> > +     sink_idx =3D dprx_port_number_to_sink_idx(dprx, a_req->port_numbe=
r);
> > +     if (sink_idx =3D=3D -1) {
> > +             dprx_write_nak(dprx, rep, req->req_type, DP_NAK_BAD_PARAM=
);
> > +             return;
> > +     }
> > +
> > +     if (a_req->vcpi =3D=3D 0) {
> > +             dprx_write_nak(dprx, rep, req->req_type, DP_NAK_BAD_PARAM=
);
> > +             return;
> > +     }
> > +
> > +     if (a_req->pbn > 0) {
> > +             if (dprx->payload_pbn[sink_idx] =3D=3D 0) {
> > +                     /* New payload ID */
> > +                     dprx->payload_id[sink_idx] =3D a_req->vcpi;
> > +             } else if (dprx->payload_id[sink_idx] !=3D a_req->vcpi) {
> > +                     /* At most one payload ID is allowed per sink */
> > +                     dprx_write_nak(dprx, rep, req->req_type, DP_NAK_A=
LLOCATE_FAIL);
> > +                     return;
> > +             }
> > +     }
> > +     WARN_ON_ONCE(dprx->payload_pbn_total < dprx->payload_pbn[sink_idx=
]);
> > +     dprx->payload_pbn_total -=3D dprx->payload_pbn[sink_idx];
> > +     dprx->payload_pbn_total +=3D a_req->pbn;
> > +     dprx->payload_pbn[sink_idx] =3D a_req->pbn;
> > +
> > +     dprx_set_vc_ids(dprx);
> > +
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_ALLOCATE_PAYLOAD;
> > +
> > +     a_rep->port_number =3D a_req->port_number;
> > +     a_rep->vcpi =3D a_req->vcpi;
> > +     a_rep->allocated_pbn =3D a_req->pbn;
> > +}
> > +
> > +static void dprx_execute_clear_payload_id_table(struct dprx *dprx,
> > +                                             struct drm_dp_sideband_ms=
g_req_body *req,
> > +                                             struct drm_dp_sideband_ms=
g_reply_body *rep)
> > +{
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_CLEAR_PAYLOAD_ID_TABLE;
> > +
> > +     dprx_clear_vc_payload_table(dprx);
> > +}
> > +
> > +static void dprx_execute_remote_dpcd_read(struct dprx *dprx,
> > +                                       struct drm_dp_sideband_msg_req_=
body *req,
> > +                                       struct drm_dp_sideband_msg_repl=
y_body *rep)
> > +{
> > +     struct drm_dp_remote_dpcd_read *read_req =3D &req->u.dpcd_read;
> > +     struct drm_dp_remote_dpcd_read_ack_reply *read_rep =3D &rep->u.re=
mote_dpcd_read_ack;
> > +
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_REMOTE_DPCD_READ;
> > +
> > +     read_rep->port_number =3D read_req->port_number;
> > +     read_rep->num_bytes =3D read_req->num_bytes;
> > +     memset(read_rep->bytes, 0, read_req->num_bytes);
> > +}
> > +
> > +static void dprx_execute_remote_i2c_read(struct dprx *dprx,
> > +                                      struct drm_dp_sideband_msg_req_b=
ody *req,
> > +                                      struct drm_dp_sideband_msg_reply=
_body *rep)
> > +{
> > +     struct drm_dp_remote_i2c_read *read_req =3D &req->u.i2c_read;
> > +     struct drm_dp_remote_i2c_read_ack_reply *read_rep =3D &rep->u.rem=
ote_i2c_read_ack;
> > +     struct drm_dp_remote_i2c_read_tx *tx;
> > +     struct dprx_sink *sink;
> > +     int sink_idx;
> > +     int res;
> > +     int i;
> > +
> > +     sink_idx =3D dprx_port_number_to_sink_idx(dprx, read_req->port_nu=
mber);
> > +     if (sink_idx =3D=3D -1) {
> > +             dprx_write_nak(dprx, rep, req->req_type, DP_NAK_BAD_PARAM=
);
> > +             return;
> > +     }
> > +     sink =3D &dprx->sinks[sink_idx];
> > +
> > +     for (i =3D 0; i < read_req->num_transactions; i++) {
> > +             tx =3D &read_req->transactions[i];
> > +             res =3D dprx_i2c_write(sink, tx->i2c_dev_id, tx->bytes, t=
x->num_bytes);
> > +             if (res)
> > +                     goto i2c_err;
> > +             if (!tx->no_stop_bit)
> > +                     dprx_i2c_stop(sink);
> > +     }
> > +
> > +     res =3D dprx_i2c_read(sink, read_req->read_i2c_device_id,
> > +                               read_rep->bytes, read_req->num_bytes_re=
ad);
> > +     if (res)
> > +             goto i2c_err;
> > +     dprx_i2c_stop(sink);
> > +
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_REMOTE_I2C_READ;
> > +
> > +     read_rep->port_number =3D read_req->port_number;
> > +     read_rep->num_bytes =3D read_req->num_bytes_read;
> > +     return;
> > +
> > +i2c_err:
> > +     dprx_i2c_stop(sink);
> > +     dprx_write_nak(dprx, rep, req->req_type, DP_NAK_I2C_NAK);
> > +}
> > +
> > +static void dprx_execute_remote_i2c_write(struct dprx *dprx,
> > +                                       struct drm_dp_sideband_msg_req_=
body *req,
> > +                                       struct drm_dp_sideband_msg_repl=
y_body *rep)
> > +{
> > +     struct drm_dp_remote_i2c_write *write_req =3D &req->u.i2c_write;
> > +     struct drm_dp_remote_i2c_write_ack_reply *write_rep =3D &rep->u.r=
emote_i2c_write_ack;
> > +     struct dprx_sink *sink;
> > +     int sink_idx;
> > +     int res;
> > +
> > +     sink_idx =3D dprx_port_number_to_sink_idx(dprx, write_req->port_n=
umber);
> > +     if (sink_idx =3D=3D -1) {
> > +             dprx_write_nak(dprx, rep, req->req_type, DP_NAK_BAD_PARAM=
);
> > +             return;
> > +     }
> > +     sink =3D &dprx->sinks[sink_idx];
> > +
> > +     res =3D dprx_i2c_write(sink, write_req->write_i2c_device_id,
> > +                                write_req->bytes, write_req->num_bytes=
);
> > +     dprx_i2c_stop(sink);
> > +     if (res) {
> > +             dprx_write_nak(dprx, rep, req->req_type, DP_NAK_I2C_NAK);
> > +             return;
> > +     }
> > +
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_REMOTE_I2C_WRITE;
> > +     write_rep->port_number =3D write_req->port_number;
> > +}
> > +
> > +static void dprx_execute_power_up_phy(struct dprx *dprx,
> > +                                   struct drm_dp_sideband_msg_req_body=
 *req,
> > +                                   struct drm_dp_sideband_msg_reply_bo=
dy *rep)
> > +{
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_POWER_UP_PHY;
> > +     rep->u.port_number.port_number =3D req->u.port_num.port_number;
> > +}
> > +
> > +static void dprx_execute_power_down_phy(struct dprx *dprx,
> > +                                     struct drm_dp_sideband_msg_req_bo=
dy *req,
> > +                                     struct drm_dp_sideband_msg_reply_=
body *rep)
> > +{
> > +     rep->reply_type =3D DP_SIDEBAND_REPLY_ACK;
> > +     rep->req_type =3D DP_POWER_DOWN_PHY;
> > +     rep->u.port_number.port_number =3D req->u.port_num.port_number;
> > +}
> > +
> > +static void dprx_encode_sideband_msg(struct sideband_msg *msg, u8 *buf=
)
> > +{
> > +     int idx =3D 0;
> > +     int i;
> > +     u8 crc4;
> > +
> > +     buf[idx++] =3D ((msg->lct & 0xf) << 4) | (msg->lcr & 0xf);
> > +     for (i =3D 0; i < (msg->lct / 2); i++)
> > +             buf[idx++] =3D msg->rad[i];
> > +     buf[idx++] =3D (msg->broadcast << 7) | (msg->path_msg << 6) |
> > +             ((msg->body_len + 1) & 0x3f);
> > +     buf[idx++] =3D (msg->somt << 7) | (msg->eomt << 6) | (msg->seqno =
<< 4);
> > +
> > +     crc4 =3D crc_dp_msg_header(buf, (idx * 2) - 1);
> > +     buf[idx - 1] |=3D (crc4 & 0xf);
> > +
> > +     memcpy(&buf[idx], msg->body, msg->body_len);
> > +     idx +=3D msg->body_len;
> > +     buf[idx] =3D crc_dp_msg_data(msg->body, msg->body_len);
> > +}
> > +
> > +static bool dprx_decode_sideband_msg(struct sideband_msg *msg, u8 *buf=
, int buflen)
> > +{
> > +     u8 hdr_crc;
> > +     u8 hdr_len;
> > +     u8 body_crc;
> > +     int i;
> > +     u8 idx;
> > +
> > +     if (buf[0] =3D=3D 0)
> > +             return false;
> > +     hdr_len =3D 3;
> > +     hdr_len +=3D ((buf[0] & 0xf0) >> 4) / 2;
> > +     if (hdr_len > buflen)
> > +             return false;
> > +     hdr_crc =3D crc_dp_msg_header(buf, (hdr_len * 2) - 1);
> > +     if ((hdr_crc & 0xf) !=3D (buf[hdr_len - 1] & 0xf))
> > +             return false;
> > +
> > +     msg->lct =3D (buf[0] & 0xf0) >> 4;
> > +     msg->lcr =3D (buf[0] & 0xf);
> > +     idx =3D 1;
> > +     for (i =3D 0; i < (msg->lct / 2); i++)
> > +             msg->rad[i] =3D buf[idx++];
> > +     msg->broadcast =3D (buf[idx] >> 7) & 0x1;
> > +     msg->path_msg =3D (buf[idx] >> 6) & 0x1;
> > +     msg->body_len =3D (buf[idx] & 0x3f) - 1;
> > +     idx++;
> > +     msg->somt =3D (buf[idx] >> 7) & 0x1;
> > +     msg->eomt =3D (buf[idx] >> 6) & 0x1;
> > +     msg->seqno =3D (buf[idx] >> 4) & 0x1;
> > +     idx++;
> > +
> > +     if (hdr_len + msg->body_len + 1 !=3D buflen)
> > +             return false;
> > +
> > +     body_crc =3D crc_dp_msg_data(&buf[idx], msg->body_len);
> > +     if (body_crc !=3D buf[idx + msg->body_len])
> > +             return false;
> > +
> > +     memcpy(msg->body, &buf[idx], msg->body_len);
> > +     idx +=3D msg->body_len;
> > +
> > +     return true;
> > +}
> > +
> > +static bool dprx_decode_port_number_req(struct drm_dp_port_number_req =
*port_num, u8 *buf, int len)
> > +{
> > +     if (len !=3D 1)
> > +             return false;
> > +
> > +     port_num->port_number =3D buf[0] >> 4;
> > +
> > +     return true;
> > +}
> > +
> > +static bool
> > +dprx_decode_connection_status_notify_req(struct drm_dp_connection_stat=
us_notify *conn_stat,
> > +                                      u8 *buf, int len)
> > +{
> > +     int idx =3D 0;
> > +
> > +     if (len !=3D 18)
> > +             return false;
> > +
> > +     conn_stat->port_number =3D buf[idx++];
> > +     memcpy(conn_stat->guid, &buf[idx], 16);
> > +     idx +=3D 16;
> > +     conn_stat->legacy_device_plug_status =3D (buf[idx] >> 6) & 1;
> > +     conn_stat->displayport_device_plug_status =3D (buf[idx] >> 5) & 1=
;
> > +     conn_stat->message_capability_status =3D (buf[idx] >> 4) & 1;
> > +     conn_stat->input_port =3D (buf[idx] >> 3) & 1;
> > +     conn_stat->peer_device_type =3D buf[idx] & 0x7;
> > +
> > +     return true;
> > +}
> > +
> > +static bool dprx_decode_allocate_payload_req(struct drm_dp_allocate_pa=
yload *alloc_payload,
> > +                                          u8 *buf, int len)
> > +{
> > +     int idx =3D 0;
> > +     int i;
> > +
> > +     if (len < 4)
> > +             return false;
> > +
> > +     alloc_payload->port_number =3D buf[idx] >> 4;
> > +     alloc_payload->number_sdp_streams =3D buf[idx++] & 0xf;
> > +     alloc_payload->vcpi =3D buf[idx++] & 0x7f;
> > +     alloc_payload->pbn =3D buf[idx] << 8 | buf[idx + 1];
> > +     idx +=3D 2;
> > +
> > +     if (len !=3D idx + (alloc_payload->number_sdp_streams + 1) / 2)
> > +             return false;
> > +
> > +     for (i =3D 0; i < alloc_payload->number_sdp_streams; i++) {
> > +             if ((i & 1) =3D=3D 0) {
> > +                     alloc_payload->sdp_stream_sink[i] =3D buf[idx] >>=
 4;
> > +             } else {
> > +                     alloc_payload->sdp_stream_sink[i] =3D buf[idx] & =
0xf;
> > +                     idx++;
> > +             }
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +static bool dprx_decode_remote_dpcd_read_req(struct drm_dp_remote_dpcd=
_read *dpcd_read,
> > +                                          u8 *buf, int len)
> > +{
> > +     if (len !=3D 4)
> > +             return false;
> > +
> > +     dpcd_read->port_number =3D buf[0] >> 4;
> > +     dpcd_read->dpcd_address =3D (buf[0] & 0xf) << 16 | buf[1] << 8 | =
buf[2];
> > +     dpcd_read->num_bytes =3D buf[3];
> > +
> > +     return true;
> > +}
> > +
> > +static bool dprx_decode_remote_i2c_read_req(struct drm_dp_remote_i2c_r=
ead *i2c_read,
> > +                                         u8 *buf, int len)
> > +{
> > +     struct drm_dp_remote_i2c_read_tx *tx;
> > +     int idx =3D 0;
> > +     int i;
> > +
> > +     if (len < 1)
> > +             return false;
> > +
> > +     i2c_read->port_number =3D buf[idx] >> 4;
> > +     i2c_read->num_transactions =3D buf[idx] & 0x3;
> > +     idx++;
> > +
> > +     for (i =3D 0; i < i2c_read->num_transactions; i++) {
> > +             tx =3D &i2c_read->transactions[i];
> > +             if (len < idx + 2)
> > +                     return false;
> > +             tx->i2c_dev_id =3D buf[idx++] & 0x7f;
> > +             tx->num_bytes =3D buf[idx++];
> > +             if (len < idx + tx->num_bytes + 1)
> > +                     return -1;
> > +             tx->bytes =3D &buf[idx];
> > +             idx +=3D tx->num_bytes;
> > +             tx->no_stop_bit =3D (buf[idx] >> 4) & 1;
> > +             tx->i2c_transaction_delay =3D buf[idx] & 0xf;
> > +             idx++;
> > +     }
> > +
> > +     if (len !=3D idx + 2)
> > +             return false;
> > +
> > +     i2c_read->read_i2c_device_id =3D buf[idx++] & 0x7f;
> > +     i2c_read->num_bytes_read =3D buf[idx++];
> > +
> > +     return true;
> > +}
> > +
> > +static bool dprx_decode_remote_i2c_write_req(struct drm_dp_remote_i2c_=
write *i2c_write,
> > +                                          u8 *buf, int len)
> > +{
> > +     int idx =3D 0;
> > +
> > +     if (len < 3)
> > +             return false;
> > +
> > +     i2c_write->port_number =3D buf[idx++] >> 4;
> > +     i2c_write->write_i2c_device_id =3D buf[idx++] & 0x7f;
> > +     i2c_write->num_bytes =3D buf[idx++];
> > +
> > +     if (len !=3D idx + i2c_write->num_bytes)
> > +             return false;
> > +
> > +     i2c_write->bytes =3D &buf[idx];
> > +
> > +     return true;
> > +}
> > +
> > +static bool dprx_decode_sideband_req(struct drm_dp_sideband_msg_req_bo=
dy *req, u8 *buf, int len)
> > +{
> > +     if (len =3D=3D 0)
> > +             return false;
> > +
> > +     req->req_type =3D buf[0] & 0x7f;
> > +     buf++;
> > +     len--;
> > +
> > +     switch (req->req_type) {
> > +     case DP_LINK_ADDRESS:
> > +     case DP_CLEAR_PAYLOAD_ID_TABLE:
> > +             return len =3D=3D 0; /* no request data */
> > +     case DP_ENUM_PATH_RESOURCES:
> > +     case DP_POWER_UP_PHY:
> > +     case DP_POWER_DOWN_PHY:
> > +             return dprx_decode_port_number_req(&req->u.port_num, buf,=
 len);
> > +     case DP_CONNECTION_STATUS_NOTIFY:
> > +             return dprx_decode_connection_status_notify_req(&req->u.c=
onn_stat, buf, len);
> > +     case DP_ALLOCATE_PAYLOAD:
> > +             return dprx_decode_allocate_payload_req(&req->u.allocate_=
payload, buf, len);
> > +     case DP_REMOTE_DPCD_READ:
> > +             return dprx_decode_remote_dpcd_read_req(&req->u.dpcd_read=
, buf, len);
> > +     case DP_REMOTE_I2C_READ:
> > +             return dprx_decode_remote_i2c_read_req(&req->u.i2c_read, =
buf, len);
> > +     case DP_REMOTE_I2C_WRITE:
> > +             return dprx_decode_remote_i2c_write_req(&req->u.i2c_write=
, buf, len);
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +static void dprx_encode_sideband_rep(struct drm_dp_sideband_msg_reply_=
body *rep, u8 *buf, int *len)
> > +{
> > +     int idx =3D 0;
> > +     int i;
> > +
> > +     buf[idx++] =3D (rep->reply_type & 0x1) << 7 | (rep->req_type & 0x=
7f);
> > +
> > +     if (rep->reply_type) {
> > +             memcpy(&buf[idx], rep->u.nak.guid, 16);
> > +             idx +=3D 16;
> > +             buf[idx++] =3D rep->u.nak.reason;
> > +             buf[idx++] =3D rep->u.nak.nak_data;
> > +             *len =3D idx;
> > +             return;
> > +     }
> > +
> > +     switch (rep->req_type) {
> > +     case DP_LINK_ADDRESS: {
> > +             struct drm_dp_link_address_ack_reply *link_addr =3D &rep-=
>u.link_addr;
> > +             struct drm_dp_link_addr_reply_port *port;
> > +
> > +             memcpy(&buf[idx], link_addr->guid, 16);
> > +             idx +=3D 16;
> > +             buf[idx++] =3D link_addr->nports;
> > +             for (i =3D 0; i < link_addr->nports; i++) {
> > +                     port =3D &link_addr->ports[i];
> > +                     buf[idx++] =3D port->input_port << 7 | port->peer=
_device_type << 4 |
> > +                                  port->port_number;
> > +                     if (port->input_port =3D=3D 0) {
> > +                             buf[idx++] =3D port->mcs << 7 | port->ddp=
s << 6 |
> > +                                          port->legacy_device_plug_sta=
tus << 5;
> > +                             buf[idx++] =3D port->dpcd_revision;
> > +                             memcpy(&buf[idx], port->peer_guid, 16);
> > +                             idx +=3D 16;
> > +                             buf[idx++] =3D port->num_sdp_streams << 4=
 |
> > +                                          port->num_sdp_stream_sinks;
> > +                     } else {
> > +                             buf[idx++] =3D port->mcs << 7 | port->ddp=
s << 6;
> > +                     }
> > +             }
> > +             break;
> > +     }
> > +     case DP_ENUM_PATH_RESOURCES: {
> > +             struct drm_dp_enum_path_resources_ack_reply *path_res =3D=
 &rep->u.path_resources;
> > +
> > +             buf[idx++] =3D path_res->port_number << 4 | path_res->fec=
_capable;
> > +             buf[idx++] =3D path_res->full_payload_bw_number >> 8;
> > +             buf[idx++] =3D path_res->full_payload_bw_number & 0xff;
> > +             buf[idx++] =3D path_res->avail_payload_bw_number >> 8;
> > +             buf[idx++] =3D path_res->avail_payload_bw_number & 0xff;
> > +             break;
> > +     }
> > +     case DP_ALLOCATE_PAYLOAD: {
> > +             struct drm_dp_allocate_payload_ack_reply *alloc_payload =
=3D &rep->u.allocate_payload;
> > +
> > +             buf[idx++] =3D alloc_payload->port_number << 4;
> > +             buf[idx++] =3D alloc_payload->vcpi & 0x3f;
> > +             buf[idx++] =3D alloc_payload->allocated_pbn >> 8;
> > +             buf[idx++] =3D alloc_payload->allocated_pbn & 0xff;
> > +             break;
> > +     }
> > +     case DP_REMOTE_DPCD_READ: {
> > +             struct drm_dp_remote_dpcd_read_ack_reply *dpcd_read =3D &=
rep->u.remote_dpcd_read_ack;
> > +
> > +             buf[idx++] =3D dpcd_read->port_number & 0xf;
> > +             buf[idx++] =3D dpcd_read->num_bytes;
> > +             memcpy(&buf[idx], dpcd_read->bytes, dpcd_read->num_bytes)=
;
> > +             idx +=3D dpcd_read->num_bytes;
> > +             break;
> > +     }
> > +     case DP_REMOTE_I2C_READ: {
> > +             struct drm_dp_remote_i2c_read_ack_reply *i2c_read =3D &re=
p->u.remote_i2c_read_ack;
> > +
> > +             buf[idx++] =3D i2c_read->port_number & 0xf;
> > +             buf[idx++] =3D i2c_read->num_bytes;
> > +             memcpy(&buf[idx], i2c_read->bytes, i2c_read->num_bytes);
> > +             idx +=3D i2c_read->num_bytes;
> > +             break;
> > +     }
> > +     case DP_REMOTE_I2C_WRITE:
> > +             buf[idx++] =3D rep->u.remote_i2c_write_ack.port_number & =
0xf;
> > +             break;
> > +     case DP_POWER_UP_PHY:
> > +     case DP_POWER_DOWN_PHY:
> > +             buf[idx++] =3D rep->u.port_number.port_number << 4;
> > +             break;
> > +     }
> > +     *len =3D idx;
> > +}
> > +
> > +static void dprx_execute_msg_transaction(struct dprx *dprx,
> > +                                      struct drm_dp_sideband_msg_req_b=
ody *req,
> > +                                      struct drm_dp_sideband_msg_reply=
_body *rep)
> > +{
> > +     switch (req->req_type) {
> > +     case DP_LINK_ADDRESS:
> > +             dprx_execute_link_address(dprx, req, rep);
> > +             break;
> > +     case DP_CONNECTION_STATUS_NOTIFY:
> > +             dprx_execute_connection_status_notify(dprx, req, rep);
> > +             break;
> > +     case DP_ENUM_PATH_RESOURCES:
> > +             dprx_execute_enum_path_resources(dprx, req, rep);
> > +             break;
> > +     case DP_ALLOCATE_PAYLOAD:
> > +             dprx_execute_allocate_payload(dprx, req, rep);
> > +             break;
> > +     case DP_CLEAR_PAYLOAD_ID_TABLE:
> > +             dprx_execute_clear_payload_id_table(dprx, req, rep);
> > +             break;
> > +     case DP_REMOTE_DPCD_READ:
> > +             dprx_execute_remote_dpcd_read(dprx, req, rep);
> > +             break;
> > +     case DP_REMOTE_I2C_READ:
> > +             dprx_execute_remote_i2c_read(dprx, req, rep);
> > +             break;
> > +     case DP_REMOTE_I2C_WRITE:
> > +             dprx_execute_remote_i2c_write(dprx, req, rep);
> > +             break;
> > +     case DP_POWER_UP_PHY:
> > +             dprx_execute_power_up_phy(dprx, req, rep);
> > +             break;
> > +     case DP_POWER_DOWN_PHY:
> > +             dprx_execute_power_down_phy(dprx, req, rep);
> > +             break;
> > +     default:
> > +             dprx_write_nak(dprx, rep, req->req_type, DP_NAK_BAD_PARAM=
);
> > +             break;
> > +     }
> > +}
> > +
> > +static void dprx_handle_msg_transaction(struct dprx *dprx,
> > +                                     struct msg_transaction_rxbuf *rxb=
uf,
> > +                                     struct msg_transaction_txbuf *txb=
uf)
> > +{
> > +     bool decoded;
> > +     struct drm_dp_sideband_msg_req_body req;
> > +     struct drm_dp_sideband_msg_reply_body rep;
> > +
> > +     decoded =3D dprx_decode_sideband_req(&req, rxbuf->buf, rxbuf->len=
);
> > +     if (decoded)
> > +             dprx_execute_msg_transaction(dprx, &req, &rep);
> > +     else
> > +             dprx_write_nak(dprx, &rep, req.req_type, DP_NAK_BAD_PARAM=
);
> > +     dprx_encode_sideband_rep(&rep, txbuf->buf, &txbuf->len);
> > +     txbuf->written =3D 0;
> > +}
> > +
> > +static void dprx_msg_transaction_append(struct msg_transaction_rxbuf *=
rxbuf,
> > +                                     struct msg_transaction_meta *meta=
,
> > +                                     struct sideband_msg *msg)
> > +{
> > +     int append_len;
> > +
> > +     append_len =3D min(msg->body_len, sizeof(rxbuf->buf) - rxbuf->len=
);
> > +     memcpy(rxbuf->buf + rxbuf->len, msg->body, append_len);
> > +     rxbuf->len +=3D append_len;
> > +
> > +     if (msg->somt) {
> > +             meta->lct =3D msg->lct;
> > +             memcpy(meta->rad, msg->rad, msg->lct / 2);
> > +             meta->seqno =3D msg->seqno;
> > +     }
> > +}
> > +
> > +static void dprx_msg_transaction_extract(struct msg_transaction_txbuf =
*txbuf,
> > +                                      struct msg_transaction_meta *met=
a,
> > +                                      struct sideband_msg *msg)
> > +{
> > +     int hdr_len =3D 3 + meta->lct / 2;
> > +     int body_len;
> > +     bool somt;
> > +     bool eomt;
> > +
> > +     body_len =3D txbuf->len - txbuf->written;
> > +     /* trim body_len so that the sideband msg fits into 48 bytes */
> > +     body_len =3D min(body_len, 48 - 1 - hdr_len);
> > +
> > +     somt =3D (txbuf->written =3D=3D 0);
> > +     eomt =3D (txbuf->written + body_len =3D=3D txbuf->len);
> > +
> > +     msg->lct =3D meta->lct;
> > +     msg->lcr =3D meta->lct - 1;
> > +     memcpy(msg->rad, meta->rad, meta->lct / 2);
> > +     msg->broadcast =3D false;
> > +     msg->path_msg =3D false;
> > +     msg->somt =3D somt;
> > +     msg->eomt =3D eomt;
> > +     msg->seqno =3D meta->seqno;
> > +
> > +     memcpy(msg->body, txbuf->buf + txbuf->written, body_len);
> > +     msg->body_len =3D body_len;
> > +
> > +     txbuf->written +=3D body_len;
> > +}
> > +
> > +static void dprx_msg_transaction_clear_rxbuf(struct msg_transaction_rx=
buf *rxbuf)
> > +{
> > +     rxbuf->len =3D 0;
> > +}
> > +
> > +static void dprx_msg_transaction_clear_txbuf(struct msg_transaction_tx=
buf *txbuf)
> > +{
> > +     txbuf->len =3D 0;
> > +     txbuf->written =3D 0;
> > +}
> > +
> > +static bool dprx_msg_transaction_txbuf_empty(struct msg_transaction_tx=
buf *txbuf)
> > +{
> > +     return txbuf->written =3D=3D txbuf->len;
> > +}
> > +
> > +static void dprx_write_pending_sideband_msg(struct dprx *dprx)
> > +{
> > +     struct msg_transaction_txbuf *txbuf;
> > +     struct msg_transaction_meta *meta;
> > +     struct sideband_msg msg;
> > +
> > +     if (WARN_ON_ONCE(!dprx->mt_pending))
> > +             return;
> > +
> > +     txbuf =3D &dprx->mt_txbuf[dprx->mt_seqno];
> > +     meta =3D &dprx->mt_meta[dprx->mt_seqno];
> > +
> > +     dprx_msg_transaction_extract(txbuf, meta, &msg);
> > +     if (dprx_msg_transaction_txbuf_empty(txbuf)) {
> > +             dprx->mt_seqno =3D !dprx->mt_seqno;
> > +             txbuf =3D &dprx->mt_txbuf[dprx->mt_seqno];
> > +             if (dprx_msg_transaction_txbuf_empty(txbuf))
> > +                     dprx->mt_pending =3D false;
> > +     }
> > +
> > +     dprx_encode_sideband_msg(&msg, dprx->down_rep_buf);
> > +}
> > +
> > +static void dprx_signal_irq(struct dprx *dprx, int irq)
> > +{
> > +     dprx->irq_vector |=3D irq;
> > +     dprx_pulse_hpd(dprx);
> > +}
> > +
> > +static void dprx_handle_sideband_msg(struct dprx *dprx, struct sideban=
d_msg *msg)
> > +{
> > +     struct msg_transaction_rxbuf *rxbuf =3D &dprx->mt_rxbuf[msg->seqn=
o];
> > +     struct msg_transaction_txbuf *txbuf =3D &dprx->mt_txbuf[msg->seqn=
o];
> > +     struct msg_transaction_meta *meta =3D &dprx->mt_meta[msg->seqno];
> > +
> > +     if (msg->somt)
> > +             dprx_msg_transaction_clear_rxbuf(rxbuf);
> > +     dprx_msg_transaction_append(rxbuf, meta, msg);
> > +
> > +     if (msg->eomt) {
> > +             /* drop the message if txbuf isn't empty */
> > +             if (!dprx_msg_transaction_txbuf_empty(txbuf))
> > +                     return;
> > +             dprx_handle_msg_transaction(dprx, rxbuf, txbuf);
> > +
> > +             if (!dprx->mt_pending) {
> > +                     dprx->mt_pending =3D true;
> > +                     dprx->mt_seqno =3D msg->seqno;
> > +                     if (!dprx->down_rep_pending) {
> > +                             dprx_write_pending_sideband_msg(dprx);
> > +                             dprx_signal_irq(dprx, DP_DOWN_REP_MSG_RDY=
);
> > +                             dprx->down_rep_pending =3D true;
> > +                     }
> > +             }
> > +     }
> > +}
> > +
> > +static void dprx_init_caps(struct dprx *dprx)
> > +{
> > +     memset(dprx->caps, 0, sizeof(dprx->caps));
> > +     dprx->caps[DP_DPCD_REV]                 =3D DP_DPCD_REV_14;
> > +     dprx->caps[DP_MAX_LINK_RATE]            =3D dprx->max_link_rate;
> > +     dprx->caps[DP_MAX_LANE_COUNT]           =3D DP_ENHANCED_FRAME_CAP=
 | DP_TPS3_SUPPORTED |
> > +                                               dprx->max_lane_count;
> > +     dprx->caps[DP_MAX_DOWNSPREAD]           =3D DP_TPS4_SUPPORTED | D=
P_MAX_DOWNSPREAD_0_5;
> > +     dprx->caps[DP_MAIN_LINK_CHANNEL_CODING] =3D DP_CAP_ANSI_8B10B;
> > +     dprx->caps[DP_RECEIVE_PORT_0_CAP_0]     =3D DP_LOCAL_EDID_PRESENT=
;
> > +}
> > +
> > +static u8 dprx_read_caps(struct dprx *dprx, u32 offset)
> > +{
> > +     return dprx->caps[offset];
> > +}
> > +
> > +static u8 dprx_read_mstm_cap(struct dprx *dprx)
> > +{
> > +     return dprx->multi_stream_support;
> > +}
> > +
> > +static u8 dprx_read_guid(struct dprx *dprx, u32 offset)
> > +{
> > +     return dprx->guid[offset];
> > +}
> > +
> > +static void dprx_write_guid(struct dprx *dprx, u32 offset, u8 val)
> > +{
> > +     dprx->guid[offset] =3D val;
> > +}
> > +
> > +static u8 dprx_read_link_bw(struct dprx *dprx)
> > +{
> > +     u32 reg =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +
> > +     return (reg >> DPRX_RX_CONTROL_LINK_RATE_SHIFT) & DPRX_RX_CONTROL=
_LINK_RATE_MASK;
> > +}
> > +
> > +static void dprx_write_link_bw(struct dprx *dprx, u8 val)
> > +{
> > +     u32 reg;
> > +
> > +     if (val !=3D DP_LINK_BW_1_62 && val !=3D DP_LINK_BW_2_7 &&
> > +         val !=3D DP_LINK_BW_5_4  && val !=3D DP_LINK_BW_8_1)
> > +             return;
> > +
> > +     if (val > dprx->max_link_rate)
> > +             return;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +     reg &=3D ~(DPRX_RX_CONTROL_LINK_RATE_MASK << DPRX_RX_CONTROL_LINK=
_RATE_SHIFT);
> > +     reg |=3D val << DPRX_RX_CONTROL_LINK_RATE_SHIFT;
> > +     reg |=3D 1 << DPRX_RX_CONTROL_RECONFIG_LINKRATE;
> > +     dprx_write(dprx, DPRX_RX_CONTROL, reg);
> > +}
> > +
> > +static u8 dprx_read_lane_count(struct dprx *dprx)
> > +{
> > +     u32 reg =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +
> > +     return (reg >> DPRX_RX_CONTROL_LANE_COUNT_SHIFT) & DPRX_RX_CONTRO=
L_LANE_COUNT_MASK;
> > +}
> > +
> > +static void dprx_write_lane_count(struct dprx *dprx, u8 val)
> > +{
> > +     u32 reg;
> > +     u8 lane_count;
> > +
> > +     lane_count =3D val & DP_LANE_COUNT_MASK;
> > +
> > +     if (lane_count !=3D 1 && lane_count !=3D 2 && lane_count !=3D 4)
> > +             return;
> > +
> > +     if (lane_count > dprx->max_lane_count)
> > +             return;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +     reg &=3D ~(DPRX_RX_CONTROL_LANE_COUNT_MASK << DPRX_RX_CONTROL_LAN=
E_COUNT_SHIFT);
> > +     reg |=3D lane_count << DPRX_RX_CONTROL_LANE_COUNT_SHIFT;
> > +     dprx_write(dprx, DPRX_RX_CONTROL, reg);
> > +}
> > +
> > +static u8 dprx_read_training_pattern(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +     u32 pattern;
> > +     u32 scrambler_disable;
> > +     u8 result =3D 0;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +     pattern =3D (reg >> DPRX_RX_CONTROL_TP_SHIFT) & DPRX_RX_CONTROL_T=
P_MASK;
> > +     scrambler_disable =3D (reg >> DPRX_RX_CONTROL_SCRAMBLER_DISABLE) =
& 1;
> > +
> > +     if (scrambler_disable)
> > +             result |=3D DP_LINK_SCRAMBLING_DISABLE;
> > +     result |=3D pattern;
> > +
> > +     return result;
> > +}
> > +
> > +static void dprx_write_training_pattern(struct dprx *dprx, u8 val)
> > +{
> > +     u8 pattern;
> > +     u8 scrambler_disable;
> > +     u32 reg;
> > +
> > +     pattern =3D val & DP_TRAINING_PATTERN_MASK_1_4;
> > +     scrambler_disable =3D !!(val & DP_LINK_SCRAMBLING_DISABLE);
> > +
> > +     reg =3D dprx_read(dprx, DPRX_RX_CONTROL);
> > +     reg &=3D ~(DPRX_RX_CONTROL_TP_MASK << DPRX_RX_CONTROL_TP_SHIFT);
> > +     reg |=3D pattern << DPRX_RX_CONTROL_TP_SHIFT;
> > +     reg &=3D ~(1 << DPRX_RX_CONTROL_SCRAMBLER_DISABLE);
> > +     reg |=3D scrambler_disable << DPRX_RX_CONTROL_SCRAMBLER_DISABLE;
> > +     dprx_write(dprx, DPRX_RX_CONTROL, reg);
> > +}
> > +
> > +static u8 dprx_read_training_lane(struct dprx *dprx, u32 offset)
> > +{
> > +     struct dprx_training_control *ctl =3D &dprx->training_control[off=
set];
> > +     u8 result =3D 0;
> > +
> > +     result |=3D ctl->volt_swing << DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > +     if (ctl->max_swing)
> > +             result |=3D DP_TRAIN_MAX_SWING_REACHED;
> > +     result |=3D ctl->pre_emph << DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > +     if (ctl->max_pre_emph)
> > +             result |=3D DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> > +
> > +     return result;
> > +}
> > +
> > +static void dprx_write_training_lane(struct dprx *dprx, u32 offset, u8=
 val)
> > +{
> > +     struct dprx_training_control *ctl =3D &dprx->training_control[off=
set];
> > +
> > +     ctl->volt_swing   =3D (val & DP_TRAIN_VOLTAGE_SWING_MASK) >> DP_T=
RAIN_VOLTAGE_SWING_SHIFT;
> > +     ctl->max_swing    =3D (val & DP_TRAIN_MAX_SWING_REACHED);
> > +     ctl->pre_emph     =3D (val & DP_TRAIN_PRE_EMPHASIS_MASK) >> DP_TR=
AIN_PRE_EMPHASIS_SHIFT;
> > +     ctl->max_pre_emph =3D (val & DP_TRAIN_MAX_PRE_EMPHASIS_REACHED);
> > +}
> > +
> > +static u8 dprx_read_mstm_ctrl(struct dprx *dprx)
> > +{
> > +     return (dprx_read(dprx, DPRX_MST_CONTROL1) >> DPRX_MST_CONTROL1_M=
ST_EN) & 1;
> > +}
> > +
> > +static void dprx_write_mstm_ctrl(struct dprx *dprx, u8 val)
> > +{
> > +     u8 mst_en =3D !!(val & DP_MST_EN);
> > +     u32 reg;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_MST_CONTROL1);
> > +     reg &=3D ~(1 << DPRX_MST_CONTROL1_MST_EN);
> > +     reg |=3D mst_en << DPRX_MST_CONTROL1_MST_EN;
> > +     dprx_write(dprx, DPRX_MST_CONTROL1, reg);
> > +}
> > +
> > +static void dprx_handle_payload_allocate(struct dprx *dprx)
> > +{
> > +     u8 id =3D dprx->payload_allocate_set;
> > +     u8 start =3D dprx->payload_allocate_start_time_slot;
> > +     u8 count =3D dprx->payload_allocate_time_slot_count;
> > +
> > +     if (id =3D=3D 0 && start =3D=3D 0 && count =3D=3D 0x3f) {
> > +             dprx_clear_vc_payload_table(dprx);
> > +     } else {
> > +             if (count =3D=3D 0)
> > +                     dprx_deallocate_vc_payload(dprx, start, id);
> > +             else
> > +                     dprx_allocate_vc_payload(dprx, start, count, id);
> > +             dprx_set_vc_payload_table(dprx);
> > +     }
> > +     dprx->payload_table_updated =3D 1;
> > +}
> > +
> > +static u8 dprx_read_payload_allocate_set(struct dprx *dprx)
> > +{
> > +     return dprx->payload_allocate_set;
> > +}
> > +
> > +static void dprx_write_payload_allocate_set(struct dprx *dprx, u8 val)
> > +{
> > +     dprx->payload_allocate_set =3D val & DP_PAYLOAD_ALLOCATE_SET_MASK=
;
> > +}
> > +
> > +static u8 dprx_read_payload_allocate_start_time_slot(struct dprx *dprx=
)
> > +{
> > +     return dprx->payload_allocate_start_time_slot;
> > +}
> > +
> > +static void dprx_write_payload_allocate_start_time_slot(struct dprx *d=
prx, u8 val)
> > +{
> > +     dprx->payload_allocate_start_time_slot =3D val & DP_PAYLOAD_ALLOC=
ATE_START_TIME_SLOT_MASK;
> > +}
> > +
> > +static u8 dprx_read_payload_allocate_time_slot_count(struct dprx *dprx=
)
> > +{
> > +     return dprx->payload_allocate_time_slot_count;
> > +}
> > +
> > +static void dprx_write_payload_allocate_time_slot_count(struct dprx *d=
prx, u8 val)
> > +{
> > +     dprx->payload_allocate_time_slot_count =3D val & DP_PAYLOAD_ALLOC=
ATE_TIME_SLOT_COUNT_MASK;
> > +     dprx_handle_payload_allocate(dprx);
> > +}
> > +
> > +static u8 dprx_read_sink_count(struct dprx *dprx)
> > +{
> > +     return dprx->max_stream_count;
> > +}
> > +
> > +static u8 dprx_read_device_service_irq_vector(struct dprx *dprx)
> > +{
> > +     return dprx->irq_vector;
> > +}
> > +
> > +static void dprx_write_device_service_irq_vector(struct dprx *dprx, u8=
 val)
> > +{
> > +     dprx->irq_vector &=3D ~val;
> > +
> > +     if (val & DP_DOWN_REP_MSG_RDY) {
> > +             if (dprx->mt_pending) {
> > +                     dprx_write_pending_sideband_msg(dprx);
> > +                     dprx_signal_irq(dprx, DP_DOWN_REP_MSG_RDY);
> > +             } else {
> > +                     dprx->down_rep_pending =3D false;
> > +             }
> > +     }
> > +}
> > +
> > +static u8 dprx_read_lane0_1_status(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +     u8 res =3D 0;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_RX_STATUS);
> > +     if ((reg >> DPRX_RX_STATUS_CR_LOCK(0)) & 1)
> > +             res |=3D DP_LANE_CR_DONE;
> > +     if ((reg >> DPRX_RX_STATUS_CR_LOCK(1)) & 1)
> > +             res |=3D DP_LANE_CR_DONE << 4;
> > +     if ((reg >> DPRX_RX_STATUS_SYM_LOCK(0)) & 1)
> > +             res |=3D DP_LANE_CHANNEL_EQ_DONE | DP_LANE_SYMBOL_LOCKED;
> > +     if ((reg >> DPRX_RX_STATUS_SYM_LOCK(1)) & 1)
> > +             res |=3D (DP_LANE_CHANNEL_EQ_DONE | DP_LANE_SYMBOL_LOCKED=
) << 4;
> > +
> > +     return res;
> > +}
> > +
> > +static u8 dprx_read_lane2_3_status(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +     u8 res =3D 0;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_RX_STATUS);
> > +     if ((reg >> DPRX_RX_STATUS_CR_LOCK(2)) & 1)
> > +             res |=3D DP_LANE_CR_DONE;
> > +     if ((reg >> DPRX_RX_STATUS_CR_LOCK(3)) & 1)
> > +             res |=3D DP_LANE_CR_DONE << 4;
> > +     if ((reg >> DPRX_RX_STATUS_SYM_LOCK(2)) & 1)
> > +             res |=3D DP_LANE_CHANNEL_EQ_DONE | DP_LANE_SYMBOL_LOCKED;
> > +     if ((reg >> DPRX_RX_STATUS_SYM_LOCK(3)) & 1)
> > +             res |=3D (DP_LANE_CHANNEL_EQ_DONE | DP_LANE_SYMBOL_LOCKED=
) << 4;
> > +
> > +     return res;
> > +}
> > +
> > +static u8 dprx_read_lane_align_status(struct dprx *dprx)
> > +{
> > +     return (dprx_read(dprx, DPRX_RX_STATUS) >> DPRX_RX_STATUS_INTERLA=
NE_ALIGN) & 1;
> > +}
> > +
> > +static u8 dprx_read_sink_status(struct dprx *dprx)
> > +{
> > +     return (dprx_read(dprx, DPRX_VBID(0)) >> DPRX_VBID_MSA_LOCK) & 1;
> > +}
> > +
> > +static u8 dprx_read_adjust_request(struct dprx *dprx,
> > +                                struct dprx_training_control *ctl0,
> > +                                struct dprx_training_control *ctl1)
> > +{
> > +     u8 next_volt_swing0;
> > +     u8 next_pre_emph0;
> > +     u8 next_volt_swing1;
> > +     u8 next_pre_emph1;
> > +
> > +     if (dprx_adjust_needed(dprx)) {
> > +             dprx_training_control_next(ctl0, &next_volt_swing0, &next=
_pre_emph0);
> > +             dprx_training_control_next(ctl1, &next_volt_swing1, &next=
_pre_emph1);
> > +     } else {
> > +             next_volt_swing0 =3D ctl0->volt_swing;
> > +             next_pre_emph0 =3D ctl0->pre_emph;
> > +             next_volt_swing1 =3D ctl1->volt_swing;
> > +             next_pre_emph1 =3D ctl1->pre_emph;
> > +     }
> > +
> > +     return next_volt_swing0 << DP_ADJUST_VOLTAGE_SWING_LANE0_SHIFT |
> > +            next_pre_emph0   << DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT  |
> > +            next_volt_swing1 << DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT |
> > +            next_pre_emph1   << DP_ADJUST_PRE_EMPHASIS_LANE1_SHIFT;
> > +}
> > +
> > +static u8 dprx_read_adjust_request_lane0_1(struct dprx *dprx)
> > +{
> > +     return dprx_read_adjust_request(dprx,
> > +                                     &dprx->training_control[0],
> > +                                     &dprx->training_control[1]);
> > +}
> > +
> > +static u8 dprx_read_adjust_request_lane2_3(struct dprx *dprx)
> > +{
> > +     return dprx_read_adjust_request(dprx,
> > +                                     &dprx->training_control[2],
> > +                                     &dprx->training_control[3]);
> > +}
> > +
> > +static u8 dprx_read_payload_table_update_status(struct dprx *dprx)
> > +{
> > +     u32 reg;
> > +     u32 act_handled;
> > +     u8 result =3D 0;
> > +
> > +     reg =3D dprx_read(dprx, DPRX_MST_STATUS1);
> > +     act_handled =3D (reg >> DPRX_MST_STATUS1_VCPTAB_ACT_ACK) & 1;
> > +
> > +     if (dprx->payload_table_updated)
> > +             result |=3D DP_PAYLOAD_TABLE_UPDATED;
> > +     if (act_handled)
> > +             result |=3D DP_PAYLOAD_ACT_HANDLED;
> > +
> > +     return result;
> > +}
> > +
> > +static void dprx_write_payload_table_update_status(struct dprx *dprx, =
u8 val)
> > +{
> > +     u32 reg;
> > +
> > +     if (val & DP_PAYLOAD_TABLE_UPDATED) {
> > +             dprx->payload_table_updated =3D 0;
> > +             reg =3D dprx_read(dprx, DPRX_MST_CONTROL1);
> > +             reg &=3D ~(1 << DPRX_MST_CONTROL1_VCPTAB_UPD_REQ);
> > +             dprx_write(dprx, DPRX_MST_CONTROL1, reg);
> > +     }
> > +}
> > +
> > +static u8 dprx_read_vc_payload_id_slot(struct dprx *dprx, u32 offset)
> > +{
> > +     return dprx->payload_table[offset + 1];
> > +}
> > +
> > +static u8 dprx_read_down_req(struct dprx *dprx, u32 offset)
> > +{
> > +     return dprx->down_req_buf[offset];
> > +}
> > +
> > +static void dprx_write_down_req(struct dprx *dprx, u32 offset, u8 val)
> > +{
> > +     struct sideband_msg msg;
> > +
> > +     dprx->down_req_buf[offset] =3D val;
> > +     if (dprx_decode_sideband_msg(&msg, dprx->down_req_buf, offset + 1=
))
> > +             dprx_handle_sideband_msg(dprx, &msg);
> > +}
> > +
> > +static u8 dprx_read_down_rep(struct dprx *dprx, u32 offset)
> > +{
> > +     return dprx->down_rep_buf[offset];
> > +}
> > +
> > +struct dprx_dpcd_handler {
> > +     u32 addr;
> > +     u32 range_len;
> > +     union {
> > +             u8 (*point)(struct dprx *dprx);
> > +             u8 (*range)(struct dprx *dprx, u32 offset);
> > +     } read;
> > +     union {
> > +             void (*point)(struct dprx *dprx, u8 val);
> > +             void (*range)(struct dprx *dprx, u32 offset, u8 val);
> > +     } write;
> > +};
> > +
> > +static void dprx_write_noop(struct dprx *dprx, u8 val)
> > +{
> > +}
> > +
> > +static void dprx_write_noop_range(struct dprx *dprx, u32 offset, u8 va=
l)
> > +{
> > +}
> > +
> > +static struct dprx_dpcd_handler dprx_dpcd_handlers[] =3D {
> > +     { 0x00000, 16,  { .range =3D dprx_read_caps },
> > +                     { .range =3D dprx_write_noop_range } },
> > +     { 0x00021, 0,   { .point =3D dprx_read_mstm_cap },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x00030, 16,  { .range =3D dprx_read_guid },
> > +                     { .range =3D dprx_write_guid } },
> > +     { 0x00100, 0,   { .point =3D dprx_read_link_bw },
> > +                     { .point =3D dprx_write_link_bw } },
> > +     { 0x00101, 0,   { .point =3D dprx_read_lane_count },
> > +                     { .point =3D dprx_write_lane_count } },
> > +     { 0x00102, 0,   { .point =3D dprx_read_training_pattern },
> > +                     { .point =3D dprx_write_training_pattern } },
> > +     { 0x00103, 4,   { .range =3D dprx_read_training_lane },
> > +                     { .range =3D dprx_write_training_lane } },
> > +     { 0x00111, 0,   { .point =3D dprx_read_mstm_ctrl },
> > +                     { .point =3D dprx_write_mstm_ctrl } },
> > +     { 0x001c0, 0,   { .point =3D dprx_read_payload_allocate_set },
> > +                     { .point =3D dprx_write_payload_allocate_set } },
> > +     { 0x001c1, 0,   { .point =3D dprx_read_payload_allocate_start_tim=
e_slot },
> > +                     { .point =3D dprx_write_payload_allocate_start_ti=
me_slot } },
> > +     { 0x001c2, 0,   { .point =3D dprx_read_payload_allocate_time_slot=
_count },
> > +                     { .point =3D dprx_write_payload_allocate_time_slo=
t_count } },
> > +     { 0x00200, 0,   { .point =3D dprx_read_sink_count },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x00201, 0,   { .point =3D dprx_read_device_service_irq_vector =
},
> > +                     { .point =3D dprx_write_device_service_irq_vector=
 } },
> > +     { 0x00202, 0,   { .point =3D dprx_read_lane0_1_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x00203, 0,   { .point =3D dprx_read_lane2_3_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x00204, 0,   { .point =3D dprx_read_lane_align_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x00205, 0,   { .point =3D dprx_read_sink_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x00206, 0,   { .point =3D dprx_read_adjust_request_lane0_1 },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x00207, 0,   { .point =3D dprx_read_adjust_request_lane2_3 },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x002c0, 0,   { .point =3D dprx_read_payload_table_update_statu=
s },
> > +                     { .point =3D dprx_write_payload_table_update_stat=
us } },
> > +     { 0x002c1, 63,  { .range =3D dprx_read_vc_payload_id_slot },
> > +                     { .range =3D dprx_write_noop_range } },
> > +     { 0x01000, 48,  { .range =3D dprx_read_down_req },
> > +                     { .range =3D dprx_write_down_req } },
> > +     { 0x01400, 48,  { .range =3D dprx_read_down_rep },
> > +                     { .range =3D dprx_write_noop_range } },
> > +     /* Event Status Indicator is a copy of 200h - 205h */
> > +     { 0x02002, 0,   { .point =3D dprx_read_sink_count },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x02003, 0,   { .point =3D dprx_read_device_service_irq_vector =
},
> > +                     { .point =3D dprx_write_device_service_irq_vector=
 } },
> > +     { 0x0200c, 0,   { .point =3D dprx_read_lane0_1_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x0200d, 0,   { .point =3D dprx_read_lane2_3_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x0200e, 0,   { .point =3D dprx_read_lane_align_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     { 0x0200f, 0,   { .point =3D dprx_read_sink_status },
> > +                     { .point =3D dprx_write_noop } },
> > +     /* Extended Receiver Capability is a copy of 0h - 0fh */
> > +     { 0x02200, 16,  { .range =3D dprx_read_caps },
> > +                     { .range =3D dprx_write_noop_range } },
> > +};
> > +
> > +static bool dprx_dpcd_handler_match(struct dprx_dpcd_handler *handler,=
 u32 addr)
> > +{
> > +     if (handler->range_len =3D=3D 0)
> > +             return addr =3D=3D handler->addr;
> > +     else
> > +             return addr >=3D handler->addr && addr < handler->addr + =
handler->range_len;
> > +}
> > +
> > +static void dprx_dpcd_handler_run(struct dprx_dpcd_handler *handler,
> > +                               struct dprx *dprx, u32 addr, u8 *val, b=
ool read)
> > +{
> > +     if (read) {
> > +             if (handler->range_len =3D=3D 0)
> > +                     *val =3D handler->read.point(dprx);
> > +             else
> > +                     *val =3D handler->read.range(dprx, addr - handler=
->addr);
> > +     } else {
> > +             if (handler->range_len =3D=3D 0)
> > +                     handler->write.point(dprx, *val);
> > +             else
> > +                     handler->write.range(dprx, addr - handler->addr, =
*val);
> > +     }
> > +}
> > +
> > +static void dprx_dpcd_access(struct dprx *dprx, u32 addr, u8 *val, boo=
l read)
> > +{
> > +     struct dprx_dpcd_handler *handler;
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(dprx_dpcd_handlers); i++) {
> > +             handler =3D &dprx_dpcd_handlers[i];
> > +             if (dprx_dpcd_handler_match(handler, addr)) {
> > +                     dprx_dpcd_handler_run(handler, dprx, addr, val, r=
ead);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     /* for unsupported registers, writes are ignored and reads return=
 0. */
> > +     if (read)
> > +             *val =3D 0;
> > +}
> > +
> > +static void dprx_handle_native_aux(struct dprx *dprx, struct aux_msg *=
req, struct aux_msg *rep)
> > +{
> > +     bool read =3D req->cmd & 1;
> > +     u8 *data;
> > +     int i;
> > +
> > +     rep->cmd =3D DP_AUX_NATIVE_REPLY_ACK;
> > +     if (read) {
> > +             rep->len =3D req->len;
> > +             data =3D rep->data;
> > +     } else {
> > +             rep->len =3D 0;
> > +             data =3D req->data;
> > +     }
> > +
> > +     for (i =3D 0; i < req->len; i++)
> > +             dprx_dpcd_access(dprx, req->addr + i, data + i, read);
> > +}
> > +
> > +static void dprx_handle_i2c_read(struct dprx *dprx, struct aux_msg *re=
q, struct aux_msg *rep)
> > +{
> > +     int res;
> > +
> > +     res =3D dprx_i2c_read(&dprx->sinks[0], req->addr, rep->data, req-=
>len);
> > +     if (!res) {
> > +             rep->cmd =3D DP_AUX_I2C_REPLY_ACK;
> > +             rep->len =3D req->len;
> > +     } else {
> > +             rep->cmd =3D DP_AUX_I2C_REPLY_NACK;
> > +             rep->len =3D 0;
> > +     }
> > +}
> > +
> > +static void dprx_handle_i2c_write(struct dprx *dprx, struct aux_msg *r=
eq, struct aux_msg *rep)
> > +{
> > +     int res;
> > +
> > +     res =3D dprx_i2c_write(&dprx->sinks[0], req->addr, req->data, req=
->len);
> > +     if (!res)
> > +             rep->cmd =3D DP_AUX_I2C_REPLY_ACK;
> > +     else
> > +             rep->cmd =3D DP_AUX_I2C_REPLY_NACK;
> > +     rep->len =3D 0;
> > +}
> > +
> > +static void dprx_decode_aux_request(struct aux_msg *req, struct aux_bu=
f *buf)
> > +{
> > +     req->cmd =3D buf->data[0] >> 4;
> > +     req->addr =3D (buf->data[0] & 0xf) << 16 | buf->data[1] << 8 | bu=
f->data[2];
> > +     if (buf->len < 4) {
> > +             req->len =3D 0;
> > +     } else {
> > +             req->len =3D buf->data[3] + 1;
> > +             memcpy(req->data, &buf->data[4], req->len);
> > +     }
> > +}
> > +
> > +static void dprx_encode_aux_reply(struct aux_msg *rep, struct aux_buf =
*buf)
> > +{
> > +     buf->data[0] =3D rep->cmd << 4;
> > +     memcpy(&buf->data[1], rep->data, rep->len);
> > +     buf->len =3D rep->len + 1;
> > +}
> > +
> > +static void dprx_handle_aux(struct dprx *dprx, struct aux_buf *req_buf=
, struct aux_buf *rep_buf)
> > +{
> > +     struct aux_msg req;
> > +     struct aux_msg rep;
> > +
> > +     dprx_decode_aux_request(&req, req_buf);
> > +
> > +     if (req.cmd & 8) {
> > +             dprx_handle_native_aux(dprx, &req, &rep);
> > +     } else {
> > +             if (req.cmd & 1)
> > +                     dprx_handle_i2c_read(dprx, &req, &rep);
> > +             else
> > +                     dprx_handle_i2c_write(dprx, &req, &rep);
> > +             if (!(req.cmd & DP_AUX_I2C_MOT))
> > +                     dprx_i2c_stop(&dprx->sinks[0]);
> > +     }
> > +
> > +     dprx_encode_aux_reply(&rep, rep_buf);
> > +}
> > +
> > +static int dprx_read_aux(struct dprx *dprx, struct aux_buf *buf)
> > +{
> > +     u32 control =3D dprx_read(dprx, DPRX_AUX_CONTROL);
> > +     int i;
> > +
> > +     /* check MSG_READY */
> > +     if (!((dprx_read(dprx, DPRX_AUX_STATUS) >> DPRX_AUX_STATUS_MSG_RE=
ADY) & 1))
> > +             return -1;
> > +
> > +     /* read LENGTH */
> > +     buf->len =3D (control >> DPRX_AUX_CONTROL_LENGTH_SHIFT) & DPRX_AU=
X_CONTROL_LENGTH_MASK;
> > +     if (buf->len > 20)
> > +             buf->len =3D 20;
> > +
> > +     /* read request */
> > +     for (i =3D 0; i < buf->len; i++)
> > +             buf->data[i] =3D dprx_read(dprx, DPRX_AUX_COMMAND + i);
> > +
> > +     return 0;
> > +}
> > +
> > +static void dprx_write_aux(struct dprx *dprx, struct aux_buf *buf)
> > +{
> > +     u32 reg;
> > +     int i;
> > +
> > +     if (!((dprx_read(dprx, DPRX_AUX_STATUS) >> DPRX_AUX_STATUS_READY_=
TO_TX) & 1))
> > +             return;
> > +
> > +     if (buf->len > 17)
> > +             buf->len =3D 17;
> > +     for (i =3D 0; i < buf->len; i++)
> > +             dprx_write(dprx, DPRX_AUX_COMMAND + i, buf->data[i]);
> > +
> > +     reg =3D dprx_read(dprx, DPRX_AUX_CONTROL);
> > +     reg &=3D ~(DPRX_AUX_CONTROL_LENGTH_MASK << DPRX_AUX_CONTROL_LENGT=
H_SHIFT);
> > +     reg |=3D buf->len << DPRX_AUX_CONTROL_LENGTH_SHIFT;
> > +     reg |=3D 1 << DPRX_AUX_CONTROL_TX_STROBE;
> > +     dprx_write(dprx, DPRX_AUX_CONTROL, reg);
> > +}
> > +
> > +static irqreturn_t dprx_isr(int irq, void *data)
> > +{
> > +     struct dprx *dprx =3D data;
> > +     struct aux_buf request;
> > +     struct aux_buf reply;
> > +
> > +     if (!dprx_read_aux(dprx, &request)) {
> > +             spin_lock(&dprx->lock);
> > +             dprx_handle_aux(dprx, &request, &reply);
> > +             spin_unlock(&dprx->lock);
> > +             dprx_write_aux(dprx, &reply);
> > +     }
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static void dprx_reset_hw(struct dprx *dprx)
> > +{
> > +     int i;
> > +
> > +     /* set link rate to 1.62 Gbps and lane count to 1 */
> > +     dprx_write(dprx, DPRX_RX_CONTROL,
> > +                DP_LINK_BW_1_62 << DPRX_RX_CONTROL_LINK_RATE_SHIFT |
> > +                1 << DPRX_RX_CONTROL_RECONFIG_LINKRATE |
> > +                DPRX_RX_CONTROL_CHANNEL_CODING_8B10B << DPRX_RX_CONTRO=
L_CHANNEL_CODING_SHIFT |
> > +                1 << DPRX_RX_CONTROL_LANE_COUNT_SHIFT);
> > +     /* clear VC payload ID table */
> > +     for (i =3D 0; i < 8; i++)
> > +             dprx_write(dprx, DPRX_MST_VCPTAB(i), 0);
> > +     dprx_write(dprx, DPRX_MST_CONTROL1, 1 << DPRX_MST_CONTROL1_VCPTAB=
_UPD_FORCE);
> > +}
> > +
> > +static void dprx_reset(struct dprx *dprx)
> > +{
> > +     int i;
> > +
> > +     memset(dprx->guid, 0, sizeof(dprx->guid));
> > +     memset(dprx->training_control, 0, sizeof(dprx->training_control))=
;
> > +
> > +     dprx->payload_allocate_set =3D 0;
> > +     dprx->payload_allocate_start_time_slot =3D 0;
> > +     dprx->payload_allocate_time_slot_count =3D 0;
> > +     memset(dprx->payload_table, 0, sizeof(dprx->payload_table));
> > +     dprx->payload_table_updated =3D 0;
> > +
> > +     memset(dprx->payload_id, 0, sizeof(dprx->payload_id));
> > +     memset(dprx->payload_pbn, 0, sizeof(dprx->payload_pbn));
> > +     dprx->payload_pbn_total =3D 0;
> > +
> > +     dprx->irq_vector =3D 0;
> > +
> > +     memset(dprx->down_req_buf, 0, sizeof(dprx->down_req_buf));
> > +     memset(dprx->down_rep_buf, 0, sizeof(dprx->down_rep_buf));
> > +
> > +     for (i =3D 0; i < 2; i++) {
> > +             dprx_msg_transaction_clear_rxbuf(&dprx->mt_rxbuf[i]);
> > +             dprx_msg_transaction_clear_txbuf(&dprx->mt_txbuf[i]);
> > +     }
> > +     dprx->mt_seqno =3D 0;
> > +     dprx->mt_pending =3D false;
> > +     dprx->down_rep_pending =3D false;
> > +
> > +     dprx_reset_hw(dprx);
> > +}
> > +
> > +#define to_dprx(sd) container_of(sd, struct dprx, subdev)
> > +
> > +static int dprx_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edi=
d)
> > +{
> > +     struct dprx *dprx =3D to_dprx(sd);
> > +     struct dprx_sink *sink;
> > +     int sink_idx;
> > +     u32 end_block =3D edid->start_block + edid->blocks;
> > +     unsigned long flags;
> > +     int res =3D 0;
> > +
> > +     memset(edid->reserved, 0, sizeof(edid->reserved));
> > +
> > +     sink_idx =3D dprx_pad_to_sink_idx(dprx, edid->pad);
> > +     if (sink_idx < 0)
> > +             return -EINVAL;
> > +     sink =3D &dprx->sinks[sink_idx];
> > +
> > +     spin_lock_irqsave(&dprx->lock, flags);
> > +
> > +     if (edid->start_block =3D=3D 0 && edid->blocks =3D=3D 0) {
> > +             edid->blocks =3D sink->blocks;
> > +             goto out;
> > +     }
> > +     if (sink->blocks =3D=3D 0) {
> > +             res =3D -ENODATA;
> > +             goto out;
> > +     }
> > +     if (edid->start_block >=3D sink->blocks) {
> > +             res =3D -EINVAL;
> > +             goto out;
> > +     }
> > +     if (end_block > sink->blocks) {
> > +             end_block =3D sink->blocks;
> > +             edid->blocks =3D end_block - edid->start_block;
> > +     }
> > +
> > +     memcpy(edid->edid, sink->edid + edid->start_block * 128, edid->bl=
ocks * 128);
> > +
> > +out:
> > +     spin_unlock_irqrestore(&dprx->lock, flags);
> > +
> > +     return res;
> > +}
> > +
> > +static int dprx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edi=
d)
> > +{
> > +     struct dprx *dprx =3D to_dprx(sd);
> > +     struct dprx_sink *sink;
> > +     int sink_idx;
> > +     bool prev_hpd;
> > +     bool cur_hpd;
> > +     unsigned long flags;
> > +
> > +     memset(edid->reserved, 0, sizeof(edid->reserved));
> > +
> > +     sink_idx =3D dprx_pad_to_sink_idx(dprx, edid->pad);
> > +     if (sink_idx < 0)
> > +             return -EINVAL;
> > +     sink =3D &dprx->sinks[sink_idx];
> > +
> > +     if (edid->start_block !=3D 0)
> > +             return -EINVAL;
> > +     if (edid->blocks > DPRX_MAX_EDID_BLOCKS) {
> > +             edid->blocks =3D DPRX_MAX_EDID_BLOCKS;
> > +             return -E2BIG;
> > +     }
> > +
> > +     prev_hpd =3D dprx->hpd_state;
> > +     /*
> > +      * This is an MST DisplayPort device, which means that one HPD
> > +      * line controls all the video streams. The way this is handled
> > +      * in s_edid is that the HPD line is controlled by the presence
> > +      * of only the first stream's EDID. This allows, for example, to
> > +      * first set the second streams's EDID and then the first one in
> > +      * order to reduce the amount of AUX communication.
> > +      */
> > +     if (sink_idx =3D=3D 0)
> > +             dprx->hpd_state =3D edid->blocks > 0;
> > +     cur_hpd =3D dprx->hpd_state;
> > +
> > +     if (prev_hpd)
> > +             dprx_set_hpd(dprx, 0);
> > +
> > +     spin_lock_irqsave(&dprx->lock, flags);
> > +     sink->blocks =3D edid->blocks;
> > +     memcpy(sink->edid, edid->edid, edid->blocks * 128);
> > +     if (cur_hpd)
> > +             dprx_reset(dprx);
> > +     spin_unlock_irqrestore(&dprx->lock, flags);
> > +
> > +     if (cur_hpd) {
> > +             if (prev_hpd) {
> > +                     /*
> > +                      * Some DisplayPort sources are not happy with 10=
0ms
> > +                      * HPD pulses. Looking at the AUX message log, it
> > +                      * seemed the source was waiting for values of so=
me
> > +                      * DPCD registers to change when it shouldn't be.
> > +                      *
> > +                      * Not sure whose fault that is, but 500ms appear=
s
> > +                      * to be a safe duration for the source to "forge=
t"
> > +                      * about the sink.
> > +                      */
> > +                     msleep(500);
> > +             }
> > +             dprx_set_hpd(dprx, 1);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dprx_query_dv_timings(struct v4l2_subdev *sd, unsigned int =
pad,
> > +                              struct v4l2_dv_timings *timings)
> > +{
> > +     struct dprx *dprx =3D to_dprx(sd);
> > +     int sink_idx;
> > +     u32 htotal, vtotal;
> > +     u32 hsp, hsw;
> > +     u32 hstart, vstart;
> > +     u32 vsp, vsw;
> > +     u32 hwidth, vheight;
> > +
> > +     sink_idx =3D dprx_pad_to_sink_idx(dprx, pad);
> > +     if (sink_idx < 0)
> > +             return -EINVAL;
> > +
> > +     if (!((dprx_read(dprx, DPRX_VBID(sink_idx)) >> DPRX_VBID_MSA_LOCK=
) & 1))
> > +             return -ENOLINK;
> > +
> > +     htotal  =3D dprx_read(dprx, DPRX_MSA_HTOTAL(sink_idx));
> > +     vtotal  =3D dprx_read(dprx, DPRX_MSA_VTOTAL(sink_idx));
> > +     hsp     =3D dprx_read(dprx, DPRX_MSA_HSP(sink_idx));
> > +     hsw     =3D dprx_read(dprx, DPRX_MSA_HSW(sink_idx));
> > +     hstart  =3D dprx_read(dprx, DPRX_MSA_HSTART(sink_idx));
> > +     vstart  =3D dprx_read(dprx, DPRX_MSA_VSTART(sink_idx));
> > +     vsp     =3D dprx_read(dprx, DPRX_MSA_VSP(sink_idx));
> > +     vsw     =3D dprx_read(dprx, DPRX_MSA_VSW(sink_idx));
> > +     hwidth  =3D dprx_read(dprx, DPRX_MSA_HWIDTH(sink_idx));
> > +     vheight =3D dprx_read(dprx, DPRX_MSA_VHEIGHT(sink_idx));
> > +
> > +     memset(timings, 0, sizeof(*timings));
> > +     timings->type =3D V4L2_DV_BT_656_1120;
> > +     timings->bt.width =3D hwidth;
> > +     timings->bt.height =3D vheight;
> > +     timings->bt.polarities =3D (!vsp) | (!hsp) << 1;
> > +     timings->bt.pixelclock =3D htotal * vtotal * 24;
> > +     timings->bt.hfrontporch =3D htotal - hstart - hwidth;
> > +     timings->bt.hsync =3D hsw;
> > +     timings->bt.hbackporch =3D hstart - hsw;
> > +     timings->bt.vfrontporch =3D vtotal - vstart - vheight;
> > +     timings->bt.vsync =3D vsw;
> > +     timings->bt.vbackporch =3D vstart - vsw;
> > +
> > +     return 0;
> > +}
> > +
> > +/* DisplayPort 1.4 capabilities */
> > +
> > +static const struct v4l2_dv_timings_cap dprx_timings_cap =3D {
> > +     .type =3D V4L2_DV_BT_656_1120,
> > +     .bt =3D {
> > +             .min_width =3D 640,
> > +             .max_width =3D 7680,
> > +             .min_height =3D 480,
> > +             .max_height =3D 4320,
> > +             .min_pixelclock =3D 25000000,
> > +             .max_pixelclock =3D 1080000000,
> > +             .standards =3D V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT=
 |
> > +                     V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
> > +             .capabilities =3D V4L2_DV_BT_CAP_PROGRESSIVE |
> > +                     V4L2_DV_BT_CAP_REDUCED_BLANKING |
> > +                     V4L2_DV_BT_CAP_CUSTOM,
> > +     },
> > +};
> > +
> > +static int dprx_enum_dv_timings(struct v4l2_subdev *sd, struct v4l2_en=
um_dv_timings *timings)
> > +{
> > +     return v4l2_enum_dv_timings_cap(timings, &dprx_timings_cap,
> > +                                     NULL, NULL);
> > +}
> > +
> > +static int dprx_dv_timings_cap(struct v4l2_subdev *sd, struct v4l2_dv_=
timings_cap *cap)
> > +{
> > +     *cap =3D dprx_timings_cap;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops dprx_pad_ops =3D {
> > +     .get_edid =3D dprx_get_edid,
> > +     .set_edid =3D dprx_set_edid,
> > +     .dv_timings_cap =3D dprx_dv_timings_cap,
> > +     .enum_dv_timings =3D dprx_enum_dv_timings,
> > +     .query_dv_timings =3D dprx_query_dv_timings,
> > +};
> > +
> > +static const struct v4l2_subdev_ops dprx_subdev_ops =3D {
> > +     .pad =3D &dprx_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations dprx_entity_ops =3D {
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +     .get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> > +};
> > +
> > +static int dprx_parse_bus_cfg(struct dprx *dprx, struct v4l2_fwnode_en=
dpoint *bus_cfg)
> > +{
> > +     u64 max_freq =3D 0;
> > +     int i;
> > +
> > +     for (i =3D 0; i < bus_cfg->nr_of_link_frequencies; i++) {
> > +             if (max_freq < bus_cfg->link_frequencies[i])
> > +                     max_freq =3D bus_cfg->link_frequencies[i];
> > +     }
> > +
> > +     switch (max_freq) {
> > +     case 1620000000:
> > +             dprx->max_link_rate =3D 0x06;
> > +             break;
> > +     case 2700000000:
> > +             dprx->max_link_rate =3D 0x0a;
> > +             break;
> > +     case 5400000000:
> > +             dprx->max_link_rate =3D 0x14;
> > +             break;
> > +     case 8100000000:
> > +             dprx->max_link_rate =3D 0x1e;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     dprx->max_lane_count =3D bus_cfg->bus.displayport.num_data_lanes;
> > +     dprx->multi_stream_support =3D bus_cfg->bus.displayport.multi_str=
eam_support;
> > +
> > +     return 0;
> > +}
> > +
> > +static int dprx_parse_fwnode(struct dprx *dprx)
> > +{
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(dprx->dev);
> > +     struct fwnode_handle *endpoint;
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_DISPLAYPORT
> > +     };
> > +     int res;
> > +
> > +     /* get input port node */
> > +     endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +     if (!endpoint)
> > +             return -EINVAL;
> > +
> > +     res =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > +     if (res) {
> > +             fwnode_handle_put(endpoint);
> > +             return res;
> > +     }
> > +
> > +     res =3D dprx_parse_bus_cfg(dprx, &bus_cfg);
> > +     if (res) {
> > +             v4l2_fwnode_endpoint_free(&bus_cfg);
> > +             fwnode_handle_put(endpoint);
> > +             return res;
> > +     }
> > +
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +     /* count the number of output port nodes */
> > +     endpoint =3D fwnode_graph_get_next_endpoint(fwnode, endpoint);
> > +     dprx->max_stream_count =3D 0;
> > +     while (endpoint) {
> > +             endpoint =3D fwnode_graph_get_next_endpoint(fwnode, endpo=
int);
> > +             dprx->max_stream_count++;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dprx_probe(struct platform_device *pdev)
> > +{
> > +     struct dprx *dprx;
> > +     int irq;
> > +     int res;
> > +     int i;
> > +
> > +     dprx =3D devm_kzalloc(&pdev->dev, sizeof(*dprx), GFP_KERNEL);
> > +     if (!dprx)
> > +             return -ENOMEM;
> > +     dprx->dev =3D &pdev->dev;
> > +     platform_set_drvdata(pdev, dprx);
> > +
> > +     dprx->iobase =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(dprx->iobase))
> > +             return PTR_ERR(dprx->iobase);
> > +
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     res =3D devm_request_irq(dprx->dev, irq, dprx_isr, 0, "intel-dprx=
", dprx);
> > +     if (res)
> > +             return res;
> > +
> > +     res =3D dprx_parse_fwnode(dprx);
> > +     if (res)
> > +             return res;
> > +
> > +     dprx_init_caps(dprx);
> > +
> > +     dprx->subdev.owner =3D THIS_MODULE;
> > +     dprx->subdev.dev =3D &pdev->dev;
> > +     v4l2_subdev_init(&dprx->subdev, &dprx_subdev_ops);
> > +     v4l2_set_subdevdata(&dprx->subdev, &pdev->dev);
> > +     snprintf(dprx->subdev.name, sizeof(dprx->subdev.name), "%s %s",
> > +              KBUILD_MODNAME, dev_name(&pdev->dev));
> > +     dprx->subdev.flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +
> > +     dprx->subdev.entity.function =3D MEDIA_ENT_F_DV_DECODER;
> > +     dprx->subdev.entity.ops =3D &dprx_entity_ops;
> > +
> > +     v4l2_ctrl_handler_init(&dprx->ctrl_handler, 1);
> > +     v4l2_ctrl_new_std(&dprx->ctrl_handler, NULL,
> > +                       V4L2_CID_DV_RX_POWER_PRESENT, 0, 1, 0, 0);
>
> You are creating this control, but it is never set to 1 when the driver d=
etects
> that a source is connected. I am wondering if POWER_PRESENT makes sense f=
or a
> DisplayPort connector. Is there a clean way for a sink driver to detect i=
f a
> source is connected? For HDMI it detects the 5V pin, but it is not clear =
if
> there is an equivalent to that in the DP spec.

The DP spec says the source can be detected using the AUX lines:

"The Downstream devices must very weakly pull up AUX+ line and very
weakly pull down AUX- line with 1M=CE=A9 (+/-5%) resistors between the
Downstream device Connector and the AC-coupling capacitors. When AUX+
line DC voltage is L level, it means a DisplayPort Upstream device is
connected. When AUX- line DC voltage is H level, it means that a
powered DisplayPort Upstream device is connected."

This exact IP has two input signals: rx_cable_detect, and
rx_pwr_detect, which are meant to be connected to the AUX+/AUX- lines
via 10k resistors (or rather that's what the reference design does).
They're exposed to software via status registers, but there's no way
to get interrupts from them, so it wouldn't be possible to set the
control exactly when a source gets plugged in.

>
> If there is no good way to detect if a source is connected, then it might=
 be
> better to drop POWER_PRESENT support.
>
> This control is supposed to signal that a source is connected as early as=
 possible,
> ideally before link training etc. starts.
>
> It helps the software detect that there is a source, and report an error =
if a source
> is detected, but you never get a stable signal (e.g. link training fails)=
.

This poses another problem, because the chameleon board doesn't have
this detection circuitry, and instead sets the rx_cable_detect and
rx_pwr_detect signals to always logical high. That would make the
control read "always plugged in", which IIUC is not desired.

>
> If this control is dropped, then we just accept the v4l2-compliance warni=
ng.
>
> Regards,
>
>         Hans
>
> > +     res =3D dprx->ctrl_handler.error;
> > +     if (res)
> > +             goto handler_free;
> > +
> > +     dprx->subdev.ctrl_handler =3D &dprx->ctrl_handler;
> > +
> > +     dprx->pads[0].flags =3D MEDIA_PAD_FL_SINK;
> > +     for (i =3D 1; i <=3D dprx->max_stream_count; i++)
> > +             dprx->pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +     res =3D media_entity_pads_init(&dprx->subdev.entity,
> > +                                  dprx->max_stream_count + 1, dprx->pa=
ds);
> > +     if (res)
> > +             goto handler_free;
> > +
> > +     res =3D v4l2_async_register_subdev(&dprx->subdev);
> > +     if (res)
> > +             goto entity_cleanup;
> > +
> > +     dprx->hpd_state =3D 0;
> > +     dprx_set_hpd(dprx, 0);
> > +     dprx_reset_hw(dprx);
> > +
> > +     dprx_set_irq(dprx, 1);
> > +
> > +     return 0;
> > +
> > +entity_cleanup:
> > +     media_entity_cleanup(&dprx->subdev.entity);
> > +handler_free:
> > +     v4l2_ctrl_handler_free(&dprx->ctrl_handler);
> > +
> > +     return res;
> > +}
> > +
> > +static void dprx_remove(struct platform_device *pdev)
> > +{
> > +     struct dprx *dprx =3D platform_get_drvdata(pdev);
> > +
> > +     /* disable interrupts */
> > +     dprx_set_irq(dprx, 0);
> > +
> > +     v4l2_async_unregister_subdev(&dprx->subdev);
> > +     media_entity_cleanup(&dprx->subdev.entity);
> > +     v4l2_ctrl_handler_free(&dprx->ctrl_handler);
> > +}
> > +
> > +static const struct of_device_id dprx_match_table[] =3D {
> > +     { .compatible =3D "intel,dprx-20.0.1" },
> > +     { },
> > +};
> > +

> > +static struct platform_driver dprx_platform_driver =3D {
> > +     .probe =3D dprx_probe,
> > +     .remove_new =3D dprx_remove,
> > +     .driver =3D {
> > +             .name =3D "intel-dprx",
> > +             .of_match_table =3D dprx_match_table,
> > +     },
> > +};
> > +
> > +module_platform_driver(dprx_platform_driver);
> > +
> > +MODULE_AUTHOR("Pawe=C5=82 Anikiel <panikiel@google.com>");
> > +MODULE_DESCRIPTION("Intel DisplayPort RX IP core driver");
> > +MODULE_LICENSE("GPL");
>
