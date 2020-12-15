Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B41E2DABCA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 12:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631B889932;
	Tue, 15 Dec 2020 11:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBC689932
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:23:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w5so15737217wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 03:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EfMSQatGMWNZ2UIzROdV1pX/rfI9pwbGhSWYVlJrJZE=;
 b=eXE+Lb4dOZbQV4Mve43qbM4rizFy7cQaqgbo9Sd7txHpXvnvKlsSwuS31p4dUt3g8l
 TY3A5NbK0k+xkwNjyzP36ek+RmXOTppJsTgpEBkdidDJ4Y/gC6k8qL5F3T5ck+3kti35
 tGgnqHmmOMCTtdJV8eSX4EwlxPBd9yK7CNhn+abP3TuwP0EhoRP3IKB7Vt/Hbof/elpP
 WiF+a0xQrLncak0A9c5ijvEEeeNYVGUsT9Sa7lrLjSrfaI/adqRARKGxBLa5YZqG7l+M
 X5fp0UKriviDiWVmxgGunA/ylIAXMF59Ahka6iyGuuRHzednnNENC+Eb5oHwKMQIXFgF
 /zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EfMSQatGMWNZ2UIzROdV1pX/rfI9pwbGhSWYVlJrJZE=;
 b=RWPTGxC3Mwf/kZo0IG8NeCo/k4gLffE3cLtQLu/pLx9t3/JgWQvJIIAJYzygquJFkX
 Ladjryco7/nzydfNxfBE4BA6R/aly7Pq6WhTtU3KcWN3ult5jSWv38TkTvMvX0qducYR
 EPhWsNxmud1F1fyxrfxVpgZni0nG37QeVoUX/o0ZB2+0qeXcp80CsublrCxmcNJsPSUR
 cwL+IT6w0ZpR9SQHZDDDUKSGFpG6pZFgQxLgLzDx9npLvonTeKRbgRAho7t8uKsBRrS5
 oGobQelHFUca7K5/FI8wmaoEKyHkGZTwDMJrVuWsLCyqmKsZnxOccse/lGTT2SZCu6/p
 C06w==
X-Gm-Message-State: AOAM530GhqQ7ThTujfu4KJIX/3MjqCbRLB+74T4BwK2p/Yk/sqGteqho
 QqMzzBKcQq/fUnwucOrpurDHt0o3ykKoUDF325kVMA==
X-Google-Smtp-Source: ABdhPJx+sM7fMbriohJGobmth2ydPm3qvpHoTFwjRws9SUq0A20IN0zEsSlLodomgkvY6en9cyG7kd2SKzCFtcfG9e8=
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr11821446wrq.47.1608031418169; 
 Tue, 15 Dec 2020 03:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-4-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Dec 2020 11:23:22 +0000
Message-ID: <CAPY8ntAijv1qdOz8qWkofXSpCa85cEOPSiuUacLrM2xOSkjWYw@mail.gmail.com>
Subject: Re: [PATCH 03/15] drm/vc4: hdmi: Fix register offset with longer CEC
 messages
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Jason Cooper <jason@lakedaemon.net>, David Airlie <airlied@linux.ie>,
 Marc Zyngier <maz@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dom & Maxime

On Thu, 10 Dec 2020 at 13:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> The code prior to 311e305fdb4e ("drm/vc4: hdmi: Implement a register
> layout abstraction") was relying on the fact that the register offset
> was incremented by 4 for each readl call. That worked since the register
> width is 4 bytes.
>
> However, since that commit the HDMI_READ macro is now taking an enum,
> and the offset doesn't increment by 4 but 1 now. Divide the index by 4
> to fix this.
>
> Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 3df1747dd917..28b78ea885ea 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1434,13 +1434,20 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
>
>  static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
>  {
> +       struct drm_device *dev = vc4_hdmi->connector.dev;
>         struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
>         unsigned int i;
>
>         msg->len = 1 + ((cntrl1 & VC4_HDMI_CEC_REC_WRD_CNT_MASK) >>
>                                         VC4_HDMI_CEC_REC_WRD_CNT_SHIFT);
> +
> +       if (msg->len > 16) {
> +               drm_err(dev, "Attempting to read too much data (%d)\n", msg->len);
> +               return;
> +       }
> +
>         for (i = 0; i < msg->len; i += 4) {
> -               u32 val = HDMI_READ(HDMI_CEC_RX_DATA_1 + i);
> +               u32 val = HDMI_READ(HDMI_CEC_RX_DATA_1 + (i >> 2));
>
>                 msg->msg[i] = val & 0xff;
>                 msg->msg[i + 1] = (val >> 8) & 0xff;
> @@ -1533,11 +1540,17 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>                                       u32 signal_free_time, struct cec_msg *msg)
>  {
>         struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
> +       struct drm_device *dev = vc4_hdmi->connector.dev;
>         u32 val;
>         unsigned int i;
>
> +       if (msg->len > 16) {
> +               drm_err(dev, "Attempting to transmit too much data (%d)\n", msg->len);
> +               return -ENOMEM;
> +       }
> +
>         for (i = 0; i < msg->len; i += 4)
> -               HDMI_WRITE(HDMI_CEC_TX_DATA_1 + i,
> +               HDMI_WRITE(HDMI_CEC_TX_DATA_1 + (i >> 2),
>                            (msg->msg[i]) |
>                            (msg->msg[i + 1] << 8) |
>                            (msg->msg[i + 2] << 16) |
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
