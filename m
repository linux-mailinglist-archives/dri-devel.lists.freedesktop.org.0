Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6D80A7FB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9CA10E27E;
	Fri,  8 Dec 2023 15:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 438 seconds by postgrey-1.36 at gabe;
 Fri, 08 Dec 2023 15:56:50 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61D410E27E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:56:50 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1702050569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=juCIKsOlSX2wDTW1S1v9bUaTdgo42s0VBtiTPZnusxI=;
 b=Y3Pb+AHg+e/B+KFo6RhPjnjAT9uufkJH/wmuUin/ii/RkL12Xb2LhbwMU/slOoW1zVWfvy
 3rtjqclt32IQoZln60DXTVkf9ZEeHYlHN5+ZUMlKpfQOQclzKYWoIgmA7FH2YMR91J15CS
 MezsCBKRTiV4bTMqtHaAXu3JDO5QIvXFpREpHh0M9nU4cTTuAeug6upCWZxzg+fUpva7ZA
 GI3z++jXDeIzjQs22W+ERv+BVjRBAktw0cI3t7dVIlV/8oEdeO5vL/723dD9gCzHGBpEJO
 KGVc128do0lHRtNowz5Gn5UYy5Fv1/xN5obeFLZ97lUUpgDAZNdow5LwZDKSOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1702050569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=juCIKsOlSX2wDTW1S1v9bUaTdgo42s0VBtiTPZnusxI=;
 b=Eu6uS/85eE+nCL+E90qXegkkjbKO7V0Thb4Yh5ee/9SQH4n9uJOPkkfQPemqOnndB/6QWH
 b2rAtS9HnxV/kkDQ==
To: Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Subject: Re: [DO NOT MERGE v5 16/37] irqchip: Add SH7751 INTC driver
In-Reply-To: <bdf5a5e2fb6de07e739a390665e5109e4165dc3d.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <bdf5a5e2fb6de07e739a390665e5109e4165dc3d.1701768028.git.ysato@users.sourceforge.jp>
Date: Fri, 08 Dec 2023 16:49:28 +0100
Message-ID: <874jgssnhz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05 2023 at 18:45, Yoshinori Sato wrote:
> +static void endisable_irq(struct irq_data *data, int enable)

bool enable?

> +{
> +	struct sh7751_intc_priv *priv;
> +	unsigned int irq;
> +
> +	priv = irq_data_to_priv(data);
> +
> +	irq = irqd_to_hwirq(data);
> +	if (!is_valid_irq(irq)) {
> +		/* IRQ out of range */
> +		pr_warn_once("%s: IRQ %u is out of range\n", __FILE__, irq);
> +		return;
> +	}
> +
> +	if (irq <= MAX_IRL && !priv->irlm)
> +		/* IRL encoded external interrupt */
> +		/* disable for SR.IMASK */
> +		update_sr_imask(irq - IRQ_START, enable);
> +	else
> +		/* Internal peripheral interrupt */
> +		/* mask for IPR priority 0 */
> +		update_ipr(priv, irq, enable);

Lacks curly brackets on the if/else

> +static int irq_sh7751_map(struct irq_domain *h, unsigned int virq,
> +			  irq_hw_number_t hw_irq_num)
> +{
> +	irq_set_chip_and_handler(virq, &sh7751_irq_chip, handle_level_irq);
> +	irq_get_irq_data(virq)->chip_data = h->host_data;
> +	irq_modify_status(virq, IRQ_NOREQUEST, IRQ_NOPROBE);
> +	return 0;
> +}
> +static const struct irq_domain_ops irq_ops = {

Newline before 'static ...'

> +	.map    = irq_sh7751_map,
> +	.xlate  = irq_domain_xlate_onecell,
> +};
> +
> +static int __init load_ipr_map(struct device_node *intc,
> +			       struct sh7751_intc_priv *priv)
> +{
> +	struct property *ipr_map;
> +	unsigned int num_ipr, i;
> +	struct ipr *ipr;
> +	const __be32 *p;
> +	u32 irq;
> +
> +	ipr_map = of_find_property(intc, "renesas,ipr-map", &num_ipr);
> +	if (IS_ERR(ipr_map))
> +		return PTR_ERR(ipr_map);
> +	num_ipr /= sizeof(u32);
> +	/* 3words per entry. */
> +	if (num_ipr % 3)

Three words per ... But you can spare the comment by doing:

        if (num_ipr % WORDS_PER_ENTRY)

> +		goto error1;
> +	num_ipr /= 3;
> +static int __init sh7751_intc_of_init(struct device_node *intc,
> +				      struct device_node *parent)
> +{
> +	struct sh7751_intc_priv *priv;
> +	void __iomem *base, *base2;
> +	struct irq_domain *domain;
> +	u16 icr;
> +	int ret;
> +
> +	base = of_iomap(intc, 0);
> +	base2 = of_iomap(intc, 1);
> +	if (!base || !base2) {
> +		pr_err("%pOFP: Invalid register definition\n", intc);

What unmaps 'base' if 'base' is valid and base2 == NULL?

> +		return -EINVAL;
> +	}
> +
> +	priv = kzalloc(sizeof(struct sh7751_intc_priv), GFP_KERNEL);
> +	if (priv == NULL)
> +		return -ENOMEM;

Leaks base[2] maps, no?

> +	ret = load_ipr_map(intc, priv);
> +	if (ret < 0) {
> +		kfree(priv);
> +		return ret;
> +	}
> +
> +	priv->base = base;
> +	priv->intpri00 = base2;
> +
> +	if (of_property_read_bool(intc, "renesas,irlm")) {
> +		priv->irlm = true;
> +		icr = __raw_readw(priv->base + R_ICR);
> +		icr |= ICR_IRLM;
> +		__raw_writew(icr, priv->base + R_ICR);
> +	}
> +
> +	domain = irq_domain_add_linear(intc, NR_IRQS, &irq_ops, priv);
> +	if (domain == NULL) {
> +		pr_err("%pOFP: cannot initialize irq domain\n", intc);
> +		kfree(priv);
> +		return -ENOMEM;
> +	}
> +
> +	irq_set_default_host(domain);
> +	pr_info("%pOFP: SH7751 Interrupt controller (%s external IRQ)",
> +		intc, priv->irlm ? "4 lines" : "15 level");
> +	return 0;
> +}
> +
> +IRQCHIP_DECLARE(sh_7751_intc,
> +		"renesas,sh7751-intc", sh7751_intc_of_init);

One line please.

Thanks,

        tglx
