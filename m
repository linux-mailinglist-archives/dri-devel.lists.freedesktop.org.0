Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7676541ED8E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481186E519;
	Fri,  1 Oct 2021 12:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE126E519
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 12:33:00 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g41so37933574lfv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MxegWTUqAg1wAtIssrheLi+x+LfQCMxJV5C3e9zY/So=;
 b=vcJ2g2ALAm0IVx2Fp7EMGVafelLUrjG16muU1pmyzR8hwXe/c7kdMENPYG2cKj/WKw
 BS+ZaaO+G4Uj5tvnRpwbititOE3WauKhPQkREVycG/Hvn9PHucIwhkZ/YUGB6qkv1U7f
 1ae2JiP2HDu+Leu75eZhP4gJWxxvYNIu0f5oDf3KGrt2A4kayT/47nyueEjFDqAxQPI0
 iTzo6lbag1DiAzbQ9jnlxf6WV5LlF4BTHECcT3A4vBoHPDuEldBEhV/YpniL1bV6yy2m
 l7uOA4/tbztxL4Zph+77Sg+DntIuch0Ry+Gguy/mz8lrNGeYY+1Vyk1/7itYYlfM8hOX
 BDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MxegWTUqAg1wAtIssrheLi+x+LfQCMxJV5C3e9zY/So=;
 b=3LVa/VLjyM5dKF5s6ss3fD2kNjutFHKvgEyS5bPAcLzfdiwNXsSPyEdw0AFPDWcRu4
 10qWvLlSjDvLvFWS9Fz0DsZkJpKvgkr9YemX4Ed/QVwfsY1gZt6XwiCjFaJcW1ASbErX
 GwHfiEc9KZWSYuwHcLRJTwNVI7x9Sb9R3Sc2pmZ4rZY9fw9A5SyZeYG6zaQAdCU99BdA
 /FVxwr9ww4I8Ifv/5kxMzfPNb8q7Jr3TMukkYtTMP5an8ebDhfr8b3sGt6omPhuoIclv
 H+miDBxXVLw1LbqYJfcc5RJ5tao9t3pVMaKbDNQ5h+kV3yQbs/WOvZzLYDtMf4xxgnYo
 AoFg==
X-Gm-Message-State: AOAM530MhL5Bo4cZl2t3mVC8dlkzgVpt2L1eQilkBrdziooY7fOfjHks
 RnZOMsUW4ZCAeKxJrTUCRKEpqqAjbNj7NHy28rsSvw==
X-Google-Smtp-Source: ABdhPJyfBm1RgU4LIN5CLjaq/tOmRfulY+xvfoc1wBqdFGGV+40L5VEoXJW9NfDQ0sTovAsPIzZgtcS+Jd2OZrom1nQ=
X-Received: by 2002:a05:6512:3fa5:: with SMTP id
 x37mr5557500lfa.233.1633091578379; 
 Fri, 01 Oct 2021 05:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-7-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-7-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 14:32:21 +0200
Message-ID: <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The Clock-and-Reset controller resides in a core power domain on NVIDIA
> Tegra SoCs.  In order to support voltage scaling of the core power domain,
> we hook up DVFS-capable clocks to the core GENPD for managing of the
> GENPD's performance state based on the clock changes.
>
> Some clocks don't have any specific physical hardware unit that backs
> them, like root PLLs and system clock and they have theirs own voltage
> requirements.  This patch adds new clk-device driver that backs the clocks
> and provides runtime PM functionality for them.  A virtual clk-device is
> created for each such DVFS-capable clock at the clock's registration time
> by the new tegra_clk_register() helper.  Driver changes clock's device
> GENPD performance state based on clk-rate notifications.
>
> In result we have this sequence of events:
>
>   1. Clock driver creates virtual device for selective clocks, enables
>      runtime PM for the created device and registers the clock.
>   2. Clk-device driver starts to listen to clock rate changes.
>   3. Something changes clk rate or enables/disables clk.
>   4. CCF core propagates the change through the clk tree.
>   5. Clk-device driver gets clock rate-change notification or GENPD core
>      handles prepare/unprepare of the clock.
>   6. Clk-device driver changes GENPD performance state on clock rate
>      change.
>   7. GENPD driver changes voltage regulator state change.
>   8. The regulator state is committed to hardware via I2C.
>
> We rely on fact that DVFS is not needed for Tegra I2C and that Tegra I2C
> driver already keeps clock always-prepared.  Hence I2C subsystem stays
> independent from the clk power management and there are no deadlock spots
> in the sequence.
>
> Currently all clocks are registered very early during kernel boot when the
> device driver core isn't available yet.  The clk-device can't be created
> at that time.  This patch splits the registration of the clocks in two
> phases:
>
>   1. Register all essential clocks which don't use RPM and are needed
>      during early boot.
>
>   2. Register at a later boot time the rest of clocks.
>
> This patch adds power management support for Tegra20 and Tegra30 clocks.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/Makefile      |   1 +
>  drivers/clk/tegra/clk-device.c  | 230 ++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-pll.c     |   2 +-
>  drivers/clk/tegra/clk-super.c   |   2 +-
>  drivers/clk/tegra/clk-tegra20.c |  77 ++++++++---
>  drivers/clk/tegra/clk-tegra30.c | 116 +++++++++++-----
>  drivers/clk/tegra/clk.c         |  75 ++++++++++-
>  drivers/clk/tegra/clk.h         |   2 +
>  8 files changed, 451 insertions(+), 54 deletions(-)
>  create mode 100644 drivers/clk/tegra/clk-device.c
>
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 7b1816856eb5..a0715cdfc1a4 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y                                  += clk.o
>  obj-y                                  += clk-audio-sync.o
> +obj-y                                  += clk-device.o
>  obj-y                                  += clk-dfll.o
>  obj-y                                  += clk-divider.o
>  obj-y                                  += clk-periph.o
> diff --git a/drivers/clk/tegra/clk-device.c b/drivers/clk/tegra/clk-device.c
> new file mode 100644
> index 000000000000..830bc0ba25d3
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-device.c
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/common.h>
> +
> +#include "clk.h"
> +
> +/*
> + * This driver manages performance state of the core power domain for the
> + * independent PLLs and system clocks.  We created a virtual clock device
> + * for such clocks, see tegra_clk_dev_register().
> + */
> +
> +struct tegra_clk_device {
> +       struct notifier_block clk_nb;
> +       struct device *dev;
> +       struct clk_hw *hw;
> +       struct mutex lock;
> +};
> +
> +static int tegra_clock_set_pd_state(struct tegra_clk_device *clk_dev,
> +                                   unsigned long rate)
> +{
> +       struct device *dev = clk_dev->dev;
> +       struct dev_pm_opp *opp;
> +       unsigned int pstate;
> +
> +       opp = dev_pm_opp_find_freq_ceil(dev, &rate);
> +       if (opp == ERR_PTR(-ERANGE)) {
> +               dev_dbg(dev, "failed to find ceil OPP for %luHz\n", rate);
> +               opp = dev_pm_opp_find_freq_floor(dev, &rate);
> +       }
> +
> +       if (IS_ERR(opp)) {
> +               dev_err(dev, "failed to find OPP for %luHz: %pe\n", rate, opp);
> +               return PTR_ERR(opp);
> +       }
> +
> +       pstate = dev_pm_opp_get_required_pstate(opp, 0);
> +       dev_pm_opp_put(opp);
> +
> +       return dev_pm_genpd_set_performance_state(dev, pstate);

The above code certainly looks like it can be made generic through a
common opp helper. I know we have discussed this before, so I am not
saying you should change right now.

Let's instead see what I think (and Viresh), when I have reviewed the
entire series.

> +}
> +
> +static int tegra_clock_change_notify(struct notifier_block *nb,
> +                                    unsigned long msg, void *data)
> +{
> +       struct clk_notifier_data *cnd = data;
> +       struct tegra_clk_device *clk_dev;
> +       int err = 0;
> +
> +       clk_dev = container_of(nb, struct tegra_clk_device, clk_nb);
> +
> +       mutex_lock(&clk_dev->lock);
> +       switch (msg) {
> +       case PRE_RATE_CHANGE:
> +               if (cnd->new_rate > cnd->old_rate)
> +                       err = tegra_clock_set_pd_state(clk_dev, cnd->new_rate);
> +               break;
> +
> +       case ABORT_RATE_CHANGE:
> +               err = tegra_clock_set_pd_state(clk_dev, cnd->old_rate);
> +               break;
> +
> +       case POST_RATE_CHANGE:
> +               if (cnd->new_rate < cnd->old_rate)
> +                       err = tegra_clock_set_pd_state(clk_dev, cnd->new_rate);
> +               break;
> +
> +       default:
> +               break;
> +       }
> +       mutex_unlock(&clk_dev->lock);
> +
> +       return notifier_from_errno(err);
> +}
> +
> +static int tegra_clock_sync_pd_state(struct tegra_clk_device *clk_dev)
> +{
> +       unsigned long rate;
> +       int ret = 0;
> +
> +       mutex_lock(&clk_dev->lock);
> +
> +       if (!pm_runtime_status_suspended(clk_dev->dev)) {
> +               rate = clk_hw_get_rate(clk_dev->hw);
> +               ret = tegra_clock_set_pd_state(clk_dev, rate);

Don't we need to sync the performance state even when the device is
runtime suspended?

Perhaps the clock, via a child-clock for example, can get
prepared/enabled (hence its device gets runtime resumed) before there
is a clock rate update for it. Then there is no performance state set
for it, right? Or maybe that isn't a problem?

> +       }
> +
> +       mutex_unlock(&clk_dev->lock);
> +
> +       return ret;
> +}
> +
> +static int tegra_clock_probe(struct platform_device *pdev)
> +{
> +       struct tegra_core_opp_params opp_params = {};
> +       struct tegra_clk_device *clk_dev;
> +       struct device *dev = &pdev->dev;
> +       struct clk *clk;
> +       int err;
> +
> +       if (!dev->pm_domain)
> +               return -EINVAL;
> +
> +       clk_dev = devm_kzalloc(dev, sizeof(*clk_dev), GFP_KERNEL);
> +       if (!clk_dev)
> +               return -ENOMEM;
> +
> +       clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       clk_dev->dev = dev;
> +       clk_dev->hw = __clk_get_hw(clk);
> +       clk_dev->clk_nb.notifier_call = tegra_clock_change_notify;
> +       mutex_init(&clk_dev->lock);
> +
> +       platform_set_drvdata(pdev, clk_dev);
> +
> +       /*
> +        * Runtime PM was already enabled for this device by the parent clk
> +        * driver and power domain state should be synced under clk_dev lock,
> +        * hence we don't use the common OPP helper that initializes OPP
> +        * state. For some clocks common OPP helper may fail to find ceil
> +        * rate, it's handled by this driver.
> +        */
> +       err = devm_tegra_core_dev_init_opp_table(dev, &opp_params);
> +       if (err)
> +               return err;
> +
> +       err = clk_notifier_register(clk, &clk_dev->clk_nb);
> +       if (err) {
> +               dev_err(dev, "failed to register clk notifier: %d\n", err);
> +               return err;
> +       }
> +
> +       /*
> +        * The driver is attaching to a potentially active/resumed clock, hence
> +        * we need to sync the power domain performance state in a accordance to
> +        * the clock rate if clock is resumed.
> +        */
> +       err = tegra_clock_sync_pd_state(clk_dev);
> +       if (err)
> +               goto unreg_clk;
> +
> +       return 0;
> +
> +unreg_clk:
> +       clk_notifier_unregister(clk, &clk_dev->clk_nb);
> +
> +       return err;
> +}
> +
> +static __maybe_unused int tegra_clock_pm_suspend(struct device *dev)
> +{
> +       struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
> +
> +       /*
> +        * Power management of the clock is entangled with the Tegra PMC
> +        * GENPD because PMC driver enables/disables clocks for toggling
> +        * of the PD's on/off state.
> +        *
> +        * The PMC GENPD is resumed in NOIRQ phase, before RPM of the clocks
> +        * becomes available, hence PMC can't use clocks at the early resume
> +        * phase if RPM is involved. For example when 3d clock is enabled,
> +        * it may enable the parent PLL clock that needs to be RPM-resumed.
> +        *
> +        * Secondly, the PLL clocks may be enabled by the low level suspend
> +        * code, so we need to assume that PLL is in enabled state during
> +        * suspend.
> +        *
> +        * We will keep PLLs and system clock resumed during suspend time.
> +        * All PLLs on all SoCs are low power and system clock is always-on,
> +        * so practically not much is changed here.
> +        */
> +
> +       return clk_prepare(clk_dev->hw->clk);

I am trying to understand, more exactly, what you intend to achieve
with the clk_prepare() here. It looks a bit weird, to me. Can you try
to elaborate a bit more on the use case?

Is this rather about making sure that the clock's corresponding PM
domain stays powered on during system suspend? In that case, I think
there may be an alternative option....

> +}
> +
> +static __maybe_unused int tegra_clock_pm_resume(struct device *dev)
> +{
> +       struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
> +
> +       clk_unprepare(clk_dev->hw->clk);
> +
> +       return 0;
> +}
> +
> +static void tegra_clock_shutdown(struct platform_device *pdev)
> +{
> +       struct tegra_clk_device *clk_dev = platform_get_drvdata(pdev);
> +
> +       clk_prepare(clk_dev->hw->clk);
> +}
> +
> +static const struct dev_pm_ops tegra_clock_pm = {
> +       SET_SYSTEM_SLEEP_PM_OPS(tegra_clock_pm_suspend,
> +                               tegra_clock_pm_resume)
> +};

[...]

Kind regards
Uffe
