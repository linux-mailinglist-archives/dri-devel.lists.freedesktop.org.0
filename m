Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E5B58D7E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 06:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9370910E568;
	Tue, 16 Sep 2025 04:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nm2voIH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B685010E568
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:55:43 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-ea3f0d9150eso2040634276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 21:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757998543; x=1758603343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBcjRbm3FVwYUlOZdbgLY3RSHrk0clAp1Nkb0I9SPZU=;
 b=nm2voIH3MFjBYnvhSMU3qmiYlJfvP62ccBXCh7DzEd88VJi25aRxSoBQuIumoTGv10
 b9N3lIGEEZHZcIw8AEN1Z0k/LPr51zVxWnW/5KU9pmfapeUBbfICkfW2csRp0QGzSc88
 iDwTMjiWzXVnCmbmCcywhf0ZjrcKRmgu8B7QS7iZNBpyDv+kuPtL+EZZcvjcSgVezeD/
 fqwYiMr1KItJS/xfduCsry2LTrss57XyLAkTKVzZe3ous3WBsqjwczD9FFIJgSF0i9d8
 fsMAPYxYpS/lcpOgwOBz3fuOklIzA72By7+isGOiHezOS6K//8hldbr4NNgVJRtPBDuq
 of6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757998543; x=1758603343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBcjRbm3FVwYUlOZdbgLY3RSHrk0clAp1Nkb0I9SPZU=;
 b=Iw04Xt+TBsk9ODSB02VpVZ+sG8Haoqppt8Pysc4Ei6wRIIFKU7bzefSNzlExIzKdz4
 U0q0Kzra7mO0oJl2O3/nuCL1NOH1K45tbwrZM3VfX7pZnENZ9KXy3i8FpY5i689nRJXF
 0zddYyMyBOHcMA7NvgwLKwhAbqrLzD5O2Cqypf88CHHmJXgwf+n3L3sK2CeNVklFm9Kl
 fvBiQL0k97S8og/1Y7Q42/UFLW2gWSFdOchoE41uS7sjkm257/P208KxX0kozYRcsitW
 hLv0p814o14blresSaOsN+ck0n9E/LJGM5MA8GRTj7NWZXiZ2038inrCPtxZGQaRuEHb
 YKBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdipbTBKU7mnUIu2mXHzQQElKw07zbVO4LNv6DSwGnBlBVR/zpGnug3Tq5D9jJ2N/OvKeG7ds2+N0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzssYqp3M2iAb+HgcDnqYtYfOoprIjyCWksLB8HzJbFmQQvpmPA
 8FL2KcjoQOqHvY82MfCTRzt1+jZUu1wVERGTPlXivyFnCV4Q77Yrc6ngQvS4S/LAiX7k6XmEKY4
 iIBOgfvtP2+AlOwcJ1pfrP9omxZam/GY=
X-Gm-Gg: ASbGncsXV0h4vK+DNg6N9+NlbYycemb4rTfLXwRsFsGgu5rKrW5bEjfCHiGgbZw/xdm
 WS1VS6lu8xqHeIeQNWba2U/HGvC0RnA9MDom1c+iiw6vhqCgO1CyfGfwG0HIimq0R9E9++iXKMH
 3nqyqXNAYCLGHfMpEkWxKK/6uwOgpxYeZaZ3DTdNeL6pYwXgIrPC9kbKM9QYag3uLO+VtuNHAFI
 S4uO/5fsOaf8Rm83gZx1BPKqN03NnObPYVtCNiwbgXbWsHK9n6LXC5PxNKIAZRarmAwq9kU
X-Google-Smtp-Source: AGHT+IFXVrlkAw4hIUMkjDUsgYvyK7EgpmYsPWpx/dWgsCW+cokg9VHakZyQIrCx9AHlixfNXCZ76u+Wtg35mXq2D/U=
X-Received: by 2002:a53:cb41:0:b0:612:891a:9ecc with SMTP id
 956f58d0204a3-627202230a3mr10138013d50.9.1757998542602; Mon, 15 Sep 2025
 21:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-5-779a8a3729d9@collabora.com>
 <CAPaKu7Q+KAzEtKBWy8KO2Kp+H4y-Mqo34uo=jgH1_iooaDq3hA@mail.gmail.com>
 <8577914.T7Z3S40VBb@workhorse>
In-Reply-To: <8577914.T7Z3S40VBb@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 15 Sep 2025 21:55:30 -0700
X-Gm-Features: AS18NWCUMIgi23a5SaUlUvMdo-ihykJDXaO9mGCW6rE2ZLrI7uXsuBJkrMkP79E
Message-ID: <CAPaKu7STDDp6D_fDGVfAKFrb5aWcxtwsT3nYtYDQQYCs7G9upA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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

On Mon, Sep 15, 2025 at 6:34=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Saturday, 13 September 2025 00:11:10 Central European Summer Time Chia=
-I Wu wrote:
> > On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > <snipped>
> > > +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> > > +{
> > > +       struct mtk_gpueb_mbox_chan *ch =3D data;
> > > +       int status;
> > > +
> > > +       status =3D atomic_cmpxchg(&ch->rx_status,
> > > +                               MBOX_FULL | MBOX_CLOGGED, MBOX_FULL);
> > > +       if (status =3D=3D (MBOX_FULL | MBOX_CLOGGED)) {
> > > +               mtk_gpueb_mbox_read_rx(ch);
> > > +               writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ=
_CLR);
> > > +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num]=
,
> > > +                                       ch->rx_buf);
> > Given what other drivers do, and how mtk_mfg consumes the data, we shou=
ld
> >
> >   char buf[MAX_OF_RX_LEN]; //  MAX_OF_RX_LEN is 32; we can also
> > allocate it during probe
> >   mtk_gpueb_mbox_read_rx(ch);
> >   mbox_chan_received_data(..., buf);
> >
> > mtx_mfg makes a copy eventually anyway.
>
> We don't right now, at least not until after the callback returns.
> So we need to have the copy in the mtk_mfg callback, not after the
> completion. That's fine and I do want to do this as this is what
> the mailbox framework seems to expect clients to do.
>
> > We don't need to maintain any
> > extra copy.
> >
> > Then we might not need rx_status.
>
> We can probably get rid of it if we keep the per-channel
> interrupt handler. Otherwise, we may still need clogged,
> as we don't want to process interrupts on channels we have
> no user for.
>
> >
> > > +               atomic_set(&ch->rx_status, 0);
> > > +               return IRQ_HANDLED;
> > > +       }
> > > +
> > > +       return IRQ_NONE;
> > > +}
> > > +
> > > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *da=
ta)
> > > +{
> > > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > > +       int i;
> > > +       u32 *values =3D data;
> > > +
> > > +       if (atomic_read(&ch->rx_status))
> > > +               return -EBUSY;
> > > +
> > > +       /*
> > > +        * We don't want any fancy nonsense, just write the 32-bit va=
lues in
> > > +        * order. memcpy_toio/__iowrite32_copy don't work here, becau=
se fancy.
> > > +        */
> > > +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> > > +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_=
offset + i);
> > > +
> > > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
> > > +{
> > > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > > +       int ret;
> > > +
> > > +       atomic_set(&ch->rx_status, 0);
> > > +
> > > +       ret =3D clk_enable(ch->ebm->clk);
> > > +       if (ret) {
> > > +               dev_err(ch->ebm->dev, "Failed to enable EB clock: %pe=
\n",
> > > +                       ERR_PTR(ret));
> > > +               goto err_clog;
> > > +       }
> > > +
> > > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > > +
> > > +       ret =3D devm_request_threaded_irq(ch->ebm->dev, ch->ebm->irq,=
 mtk_gpueb_mbox_isr,
> > > +                                       mtk_gpueb_mbox_thread, IRQF_S=
HARED | IRQF_ONESHOT,
> > > +                                       ch->full_name, ch);
> > I don't think this warrants a per-channel irq thread.
> >
> > mbox_chan_received_data is atomic. I think wecan start simple with
> > just a devm_request_irq for all channels. mtk_gpueb_mbox_isr can
> >
> >   read bits from MBOX_CTL_RX_STS
> >   for each bit set:
> >     read data from rx
> >     mbox_chan_received_data
> >   write bits to MBOX_CTL_IRQ_CLR
> >
>
> I don't like this approach. It brings us back to having to process
> multiple channels per ISR, keep track of when the interrupt should
> be enabled and disabled based on how many channels are in use, and
> also is not in line with what e.g. omap-mailbox.c does.
>
> Remember that `mbox_chan_received_data` synchronously calls the
> mailbox client's rx_callback. In mediatek_mfg's case, this is
> fairly small, though with the request to not make the rx buffer
> persist beyond the rx_callback it will gain an additional memory
> copy. But we can't guarantee that someone isn't going to put a
> slow operation in the path. Sure, it's going to be atomic, but
> waiting for a spinlock is atomic and not something an ISR would
> enjoy. I don't think mailbox clients would expect that if they
> take their time they'll stall the interrupt handler for every
> other channel.
>
> So we'd keep the interrupt disabled for all channels until the
> client that received a message has processed it.
>
> I can see myself getting rid of the handler and just having the
> thread function as the bottom half, but I'd really like to keep
> the one-IRQ-request-per-channel thing I've got going now as it
> made the code a lot easier to reason about. However, doing this
> would mean the interrupt is re-enabled after the generic upper
> half, when all the business logic that needs to not run
> concurrently for an individual channel is in the bottom half.
>
> As far as I can tell, this would then mean we'd have to add
> some concurrency exclusion mechanism to the bottom half.
>
> Moving all the logic into the upper half handler function
> would make that handler somewhat longer, and I don't know
> if IRQF_ONESHOT masks the interrupt for all users of that
> IRQ number or just for those with that dev_id. If it's per
> dev_id, then I'm fine with moving stuff up there. But from
> my reading of the core IRQ handling code, that does not
> appear to be the case; one channel getting a reply would
> mask *all* channels of the mailbox until the upper half is
> completed, and if the upper half calls into a driver
> callback synchronously, that may take a hot minute.
>
> Put differently: Is there a problem with one thread per used
> channel, or are we going off vibes here? The way it currently
> works uses the shared interrupt to mark just that one channel
> as busy with rx_status before letting the IRQ for all channels
> be unmasked again, which seems ideal to me.
No, one thread per used channel can work. I can't say I like it, but I
also don't know the hw as well as you do.
