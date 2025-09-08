Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4160B48CD0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CBC10E4D7;
	Mon,  8 Sep 2025 12:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="enOSjJUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC33410E4D7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:05:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757333114; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fwi8FJOl6mvelR+XqWpeg0MkcWyKjt9sal7ACIe4cUfDfR0xjaWqAwhNsyPa+9hf4Y8CghW1tV5Et2Rm0ZpwEZ++juzARRJw5ohVeHcdjMnOVdbQhN6mIOf9yKgKeO9WmYqXkB+0Z1AXPuM1OF6H0YYSQtVrxGDEG/wvnYYCajI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757333114;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=I9rZ3d8EMRlGLHfWRe9wMpV16pDXMhWX5ESo3BO7/WA=; 
 b=WnXggBoOh0ucK1WGPTro59OrVuZ1/qvF3oGDjLmTp2x6wA36/fDCUgisKK/53HB4SB7Z1gQ8gO3h5UGHYVPGT+uXRBRPjM7ii5prDJ7bdTP5lv1VCZsQsymxxhEavmGrv27w/16JJIE3I+Uc1lVBjff7wJTdasqIfcPi0+LlxYE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757333114; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=I9rZ3d8EMRlGLHfWRe9wMpV16pDXMhWX5ESo3BO7/WA=;
 b=enOSjJUicizZ4eADZz53gBldVW80SHGJER79glDLzB0j4qALuUS6nrUge64Wk1LM
 AihHTD1HaAHt7sAhTG4UKcDXDICMq3Ze2goYEIXgvfZc+P9LLIp988DQ2620fFg13lO
 SbYM3SG8vCnkLF4VKrBdBSiq0dTPiYcsYWSThr08=
Received: by mx.zohomail.com with SMTPS id 1757333112565883.1464946521103;
 Mon, 8 Sep 2025 05:05:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 05/10] mailbox: add MediaTek GPUEB IPI mailbox
Date: Mon, 08 Sep 2025 14:05:05 +0200
Message-ID: <7865698.EvYhyI6sBW@workhorse>
In-Reply-To: <27159dc0-96f1-4d99-bf5e-cda0f9c7d307@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-5-7b6c2d6be221@collabora.com>
 <27159dc0-96f1-4d99-bf5e-cda0f9c7d307@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

On Monday, 8 September 2025 12:06:01 Central European Summer Time AngeloGioacchino Del Regno wrote:
> Il 05/09/25 12:23, Nicolas Frattaroli ha scritto:
> > The MT8196 SoC uses an embedded MCU to control frequencies and power of
> > the GPU. This controller is referred to as "GPUEB".
> > 
> > It communicates to the application processor, among other ways, through
> > a mailbox.
> > 
> > The mailbox exposes one interrupt, which appears to only be fired when a
> > response is received, rather than a transaction is completed. For us,
> > this means we unfortunately need to poll for txdone.
> > 
> > The mailbox also requires the EB clock to be on when touching any of the
> > mailbox registers.
> > 
> > Add a simple driver for it based on the common mailbox framework.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Only a few nits in this, check below.
> 
> [...]
> > +
> > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(chan->mbox->dev);
> > +	unsigned int *num = chan->con_priv;
> > +	int i;
> 
> int i, j;
> 
> > +	u32 *values = data;
> > +
> > +	if (*num >= ebm->v->num_channels)
> > +		return -ECHRNG;
> > +
> > +	if (!ebm->v->channels[*num].no_response &&
> > +	    atomic_read(&ebm->rx_status[*num]))
> > +		return -EBUSY;
> > +
> > +	writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > +
> > +	/*
> > +	 * We don't want any fancy nonsense, just write the 32-bit values in
> > +	 * order. memcpy_toio/__iowrite32_copy don't work here, because fancy.
> > +	 */
> > +	for (i = 0; i < ebm->v->channels[*num].tx_len; i += 4) {
> 
> Just use an additional `j` index, so that you can avoid division.

The `/ 4` division here is equivalent to a `>> 2` which comes free with
almost every instruction on arm64, I don't think having two separate
indices makes the code any clearer? Unless I misunderstand how you'd
want me to use j here.

Like this?

  j = 0;
  for (i = 0; i < ebm->v->channels[*num].tx_len; i += 4) {
    writel(values[j++], ebm->mbox_mmio + ebm->v->channels[*num].tx_offset + i);
  }

This makes the relationship between the values index and i less clear. (And
in my rendition, assumes the reader knows how postincrement works, but I
think assuming people know C is fine.)

> [...]
>
> > +
> > +	ebm->clk = devm_clk_get_enabled(ebm->dev, NULL);
> > +	if (IS_ERR(ebm->clk))
> > +		return dev_err_probe(ebm->dev, PTR_ERR(ebm->clk),
> > +				     "Failed to get 'eb' clock\n");
> > +
> > +	ebm->mbox_mmio = devm_platform_ioremap_resource_byname(pdev, "mbox");
> 
> I'd say that "chan" and "ctl" are more descriptive as resource names, but then,
> do we really need to search by name?

In the binding, it was proposed to change "mbox" to something like "data",
which is fine by me, and to drop the "mbox" prefix of "ctl".

> 
> Doing that by index is also an option, as you can write the MMIO names and their
> full description in the bindings instead.

Yeah in the driver I think I'll switch to doing indices until some second
compatible forces us to actually rely on names because it adds a bunch of
other ranges.

> [...]

thanks for the feedback, assume that anything I didn't directly respond
to will be fixed in the next revision.

Kind regards,
Nicolas Frattaroli


