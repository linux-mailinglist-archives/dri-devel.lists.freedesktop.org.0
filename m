Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD23003A1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7389E0D;
	Fri, 22 Jan 2021 13:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334E189E0D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:01:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i63so4234933wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0ng+OZa3Vuf9YdIl1xtH1whS14V+BAXkcJKtu9qil4=;
 b=LXlZLfwJlLR08wLynX4+9UKOdiejRTjAGFeteUdPwwTtFfGze69EjLcTnHIivc2oE0
 pWyeJ5TOi/AmJ/V/Y+RAG+o85BEeP01Sae3w2FPv5ZAAXjzi/5IjFCdfUm912gi1gmdr
 5jQsaQUCnkfISv7/pwttFGpQfK7kgff4Wpuy4zz5TBnAzpfCdL6YM5xcyYiL1wNDEKpw
 VInLcbeeehceKdChTuiYQSZbh6W87GC6ZwAAyft8TEEh7GokL5EV2BpWGU7KWzsp9HAr
 H2DBne6G3oOWM4eybQLbWOe8DumaaGT2I/6mg98kfj9Dtn6jKgJQlOJTRyL5GXY+9gpn
 a93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0ng+OZa3Vuf9YdIl1xtH1whS14V+BAXkcJKtu9qil4=;
 b=H1crXew14R+5/24ynt7EKR3Cyib4jO+g5v7Sf9r+rIumr8yWj9zKVj6wlzc0HX2I3J
 XudxDw3x0CYzMQZ/vosrl5Tg8GHNWzbNrwC4qim6mwvMcf0pczawLCjOx3otP0Oons/5
 yw+CqtyuG41Yb6/wlXh2/vUZfj3CAzOsMw3GW0p40X473aKM2zJZFX3Mhtw5kCq2IQ9x
 dnIefAQcDn6Oux0j0FTK3Sb23ReCXNgvSMyWgLBiCxZcBNAQQi4zZODk07z2f2bjVYeZ
 Ao8tTNRcrWkxNoDjEVwJLPvzH0NItGx6fTZAuRCjlNwwUsoiC3mYR3SEu/fP5W/rdnH7
 C8rA==
X-Gm-Message-State: AOAM533bWbE6iTZoBs1WueVa1Suk50IqC4uVD0/f6ySIKABaKBMlVl0I
 TahN34QjKE8ZU2oFcMeYxV3f7XyLs5HNX+aj9TzCIg==
X-Google-Smtp-Source: ABdhPJzF7RWNhnyFcB3wiTOL99LPVoNx7wnkjoc35sgnKb4ToGcGD0ixlxJvCoN6a77ExsSS9LXd0zUSejjp8Wsij9U=
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr3906940wmi.116.1611320488755; 
 Fri, 22 Jan 2021 05:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-10-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-10-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 Jan 2021 13:01:13 +0000
Message-ID: <CAPY8ntC7OwDwtWE+j+VwktpMgX_abvkKqPrWvsY-6T9ay7gMJw@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] drm/vc4: hdmi: Split the interrupt handlers
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 has two different interrupt sources to transmit and receive
> CEC messages, provided through an external interrupt chip shared between
> the two HDMI interrupt controllers.
>
> The rest of the CEC controller is identical though so we need to change
> a bit the code organisation to share the code as much as possible, yet
> still allowing to register independant handlers.

s/independant/independent

>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

With that
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 86 +++++++++++++++++++++++++---------
>  1 file changed, 65 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 7b5c92df8f1b..12ca5f3084af 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1454,15 +1454,22 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  }
>
>  #ifdef CONFIG_DRM_VC4_HDMI_CEC
> -static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
> +static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
>  {
>         struct vc4_hdmi *vc4_hdmi = priv;
>
> -       if (vc4_hdmi->cec_irq_was_rx) {
> -               if (vc4_hdmi->cec_rx_msg.len)
> -                       cec_received_msg(vc4_hdmi->cec_adap,
> -                                        &vc4_hdmi->cec_rx_msg);
> -       } else if (vc4_hdmi->cec_tx_ok) {
> +       if (vc4_hdmi->cec_rx_msg.len)
> +               cec_received_msg(vc4_hdmi->cec_adap,
> +                                &vc4_hdmi->cec_rx_msg);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t vc4_cec_irq_handler_tx_thread(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +
> +       if (vc4_hdmi->cec_tx_ok) {
>                 cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
>                                   0, 0, 0, 0);
>         } else {
> @@ -1476,6 +1483,19 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +       irqreturn_t ret;
> +
> +       if (vc4_hdmi->cec_irq_was_rx)
> +               ret = vc4_cec_irq_handler_rx_thread(irq, priv);
> +       else
> +               ret = vc4_cec_irq_handler_tx_thread(irq, priv);
> +
> +       return ret;
> +}
> +
>  static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
>  {
>         struct drm_device *dev = vc4_hdmi->connector.dev;
> @@ -1500,31 +1520,55 @@ static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
>         }
>  }
>
> +static irqreturn_t vc4_cec_irq_handler_tx_bare(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +       u32 cntrl1;
> +
> +       cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
> +       vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
> +       cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +
> +       return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t vc4_cec_irq_handler_rx_bare(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +       u32 cntrl1;
> +
> +       vc4_hdmi->cec_rx_msg.len = 0;
> +       cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
> +       vc4_cec_read_msg(vc4_hdmi, cntrl1);
> +       cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +       cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> +
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +
> +       return IRQ_WAKE_THREAD;
> +}
> +
>  static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
>  {
>         struct vc4_hdmi *vc4_hdmi = priv;
>         u32 stat = HDMI_READ(HDMI_CEC_CPU_STATUS);
> -       u32 cntrl1, cntrl5;
> +       irqreturn_t ret;
> +       u32 cntrl5;
>
>         if (!(stat & VC4_HDMI_CPU_CEC))
>                 return IRQ_NONE;
> -       vc4_hdmi->cec_rx_msg.len = 0;
> -       cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
> +
>         cntrl5 = HDMI_READ(HDMI_CEC_CNTRL_5);
>         vc4_hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
> -       if (vc4_hdmi->cec_irq_was_rx) {
> -               vc4_cec_read_msg(vc4_hdmi, cntrl1);
> -               cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> -               HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> -               cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> -       } else {
> -               vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
> -               cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
> -       }
> -       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +       if (vc4_hdmi->cec_irq_was_rx)
> +               ret = vc4_cec_irq_handler_rx_bare(irq, priv);
> +       else
> +               ret = vc4_cec_irq_handler_tx_bare(irq, priv);
> +
>         HDMI_WRITE(HDMI_CEC_CPU_CLEAR, VC4_HDMI_CPU_CEC);
> -
> -       return IRQ_WAKE_THREAD;
> +       return ret;
>  }
>
>  static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
