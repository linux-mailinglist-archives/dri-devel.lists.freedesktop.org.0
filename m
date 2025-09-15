Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A0B57D58
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345D10E4BF;
	Mon, 15 Sep 2025 13:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="gWNKxYT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C4610E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 13:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757943268; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=c1F1G4DYgw5XKvAkAjRv2+e5pa6Kb4MHPVcAp86w2aDjx1S3PNpV+R4d2PE20vWnXdshV38JE96eMy9QpPWqUIcPAiYyrGl3S0rg/1+1kjcrHt/VPmFrD5CyzpPEEb0uebAGBlaFShFMz/8CxMh72Ajip+F05G1vwir9hp7GL80=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757943268;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=H9W8rcPrnhuT1ZCnz7GuLg7KS6O8tdbb1kw7ng7b4Ro=; 
 b=fh7Mxm5/miP8QtX8RWjc/ndyuvcb9GFt5WPMxKhDvC75f91FJkisG0607fl8TNS0C9BpZA+YFW5y3jhfMRuY25eKwXsJw/Yd0YnTNgiwJklqUCkkhsT9l8HVJ2RSygKSrZt1U3g03OiHPGLPQiUY3kfVDgRaSiroZpns/8k2m6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757943268; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=H9W8rcPrnhuT1ZCnz7GuLg7KS6O8tdbb1kw7ng7b4Ro=;
 b=gWNKxYT3iacQ5bX9zFR8huYqQ2axP5nqfG6MKE6J9ibXD4ixDM4UhqL4WDyWCtfH
 al312FY4BZubd/KRtEuOxsKXYi0jc0D1X6jaDnfeF3PwrPDRKLO2oykImMrec6F1VLd
 H2GbJCrY8iLvjsGNSl8AF+GQiMNOX6JXhYalw8K0=
Received: by mx.zohomail.com with SMTPS id 1757943266394997.9637917932183;
 Mon, 15 Sep 2025 06:34:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 05/10] mailbox: add MediaTek GPUEB IPI mailbox
Date: Mon, 15 Sep 2025 14:38:02 +0200
Message-ID: <8577914.T7Z3S40VBb@workhorse>
In-Reply-To: <CAPaKu7Q+KAzEtKBWy8KO2Kp+H4y-Mqo34uo=jgH1_iooaDq3hA@mail.gmail.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-5-779a8a3729d9@collabora.com>
 <CAPaKu7Q+KAzEtKBWy8KO2Kp+H4y-Mqo34uo=jgH1_iooaDq3hA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Saturday, 13 September 2025 00:11:10 Central European Summer Time Chia-I=
 Wu wrote:
> On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> <snipped>
> > +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> > +{
> > +       struct mtk_gpueb_mbox_chan *ch =3D data;
> > +       int status;
> > +
> > +       status =3D atomic_cmpxchg(&ch->rx_status,
> > +                               MBOX_FULL | MBOX_CLOGGED, MBOX_FULL);
> > +       if (status =3D=3D (MBOX_FULL | MBOX_CLOGGED)) {
> > +               mtk_gpueb_mbox_read_rx(ch);
> > +               writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_C=
LR);
> > +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num],
> > +                                       ch->rx_buf);
> Given what other drivers do, and how mtk_mfg consumes the data, we should
>=20
>   char buf[MAX_OF_RX_LEN]; //  MAX_OF_RX_LEN is 32; we can also
> allocate it during probe
>   mtk_gpueb_mbox_read_rx(ch);
>   mbox_chan_received_data(..., buf);
>=20
> mtx_mfg makes a copy eventually anyway.

We don't right now, at least not until after the callback returns.
So we need to have the copy in the mtk_mfg callback, not after the
completion. That's fine and I do want to do this as this is what
the mailbox framework seems to expect clients to do.

> We don't need to maintain any
> extra copy.
>=20
> Then we might not need rx_status.

We can probably get rid of it if we keep the per-channel
interrupt handler. Otherwise, we may still need clogged,
as we don't want to process interrupts on channels we have
no user for.

>=20
> > +               atomic_set(&ch->rx_status, 0);
> > +               return IRQ_HANDLED;
> > +       }
> > +
> > +       return IRQ_NONE;
> > +}
> > +
> > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > +       int i;
> > +       u32 *values =3D data;
> > +
> > +       if (atomic_read(&ch->rx_status))
> > +               return -EBUSY;
> > +
> > +       /*
> > +        * We don't want any fancy nonsense, just write the 32-bit valu=
es in
> > +        * order. memcpy_toio/__iowrite32_copy don't work here, because=
 fancy.
> > +        */
> > +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> > +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_of=
fset + i);
> > +
> > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
> > +{
> > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > +       int ret;
> > +
> > +       atomic_set(&ch->rx_status, 0);
> > +
> > +       ret =3D clk_enable(ch->ebm->clk);
> > +       if (ret) {
> > +               dev_err(ch->ebm->dev, "Failed to enable EB clock: %pe\n=
",
> > +                       ERR_PTR(ret));
> > +               goto err_clog;
> > +       }
> > +
> > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > +
> > +       ret =3D devm_request_threaded_irq(ch->ebm->dev, ch->ebm->irq, m=
tk_gpueb_mbox_isr,
> > +                                       mtk_gpueb_mbox_thread, IRQF_SHA=
RED | IRQF_ONESHOT,
> > +                                       ch->full_name, ch);
> I don't think this warrants a per-channel irq thread.
>=20
> mbox_chan_received_data is atomic. I think wecan start simple with
> just a devm_request_irq for all channels. mtk_gpueb_mbox_isr can
>=20
>   read bits from MBOX_CTL_RX_STS
>   for each bit set:
>     read data from rx
>     mbox_chan_received_data
>   write bits to MBOX_CTL_IRQ_CLR
>=20

I don't like this approach. It brings us back to having to process
multiple channels per ISR, keep track of when the interrupt should
be enabled and disabled based on how many channels are in use, and
also is not in line with what e.g. omap-mailbox.c does.

Remember that `mbox_chan_received_data` synchronously calls the
mailbox client's rx_callback. In mediatek_mfg's case, this is
fairly small, though with the request to not make the rx buffer
persist beyond the rx_callback it will gain an additional memory
copy. But we can't guarantee that someone isn't going to put a
slow operation in the path. Sure, it's going to be atomic, but
waiting for a spinlock is atomic and not something an ISR would
enjoy. I don't think mailbox clients would expect that if they
take their time they'll stall the interrupt handler for every
other channel.

So we'd keep the interrupt disabled for all channels until the
client that received a message has processed it.

I can see myself getting rid of the handler and just having the
thread function as the bottom half, but I'd really like to keep
the one-IRQ-request-per-channel thing I've got going now as it
made the code a lot easier to reason about. However, doing this
would mean the interrupt is re-enabled after the generic upper
half, when all the business logic that needs to not run
concurrently for an individual channel is in the bottom half.

As far as I can tell, this would then mean we'd have to add
some concurrency exclusion mechanism to the bottom half.

Moving all the logic into the upper half handler function
would make that handler somewhat longer, and I don't know
if IRQF_ONESHOT masks the interrupt for all users of that
IRQ number or just for those with that dev_id. If it's per
dev_id, then I'm fine with moving stuff up there. But from
my reading of the core IRQ handling code, that does not
appear to be the case; one channel getting a reply would
mask *all* channels of the mailbox until the upper half is
completed, and if the upper half calls into a driver
callback synchronously, that may take a hot minute.

Put differently: Is there a problem with one thread per used
channel, or are we going off vibes here? The way it currently
works uses the shared interrupt to mark just that one channel
as busy with rx_status before letting the IRQ for all channels
be unmasked again, which seems ideal to me.


