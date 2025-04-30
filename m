Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56AEAA4AD7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0981310E078;
	Wed, 30 Apr 2025 12:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="NhTVswmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B3A10E078
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:17:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250430121708euoutp016a9a962d51f6ff3a98ab5441221f6a48~7F8f-90Js2250522505euoutp01A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:17:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250430121708euoutp016a9a962d51f6ff3a98ab5441221f6a48~7F8f-90Js2250522505euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1746015428;
 bh=4JLcjR3NKmbTIpY7Ig7hH0ZRadrUWtEC46toJgZbLXs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=NhTVswmMQv02s1uY+gGXLPKSJpvlx1hz3V8mjmWImF3d+PxOm3/bp2fjhFs5mpSYd
 igAKZrj/QEIw0Sgyj+Tj9++Gy/PjBL+1YlJ15GERqFWMcTvgU0crnNkP2WJXFoojxv
 exZn7DnTc+MtOuFlB87UbBNHAi736Y1vvgpXdi1I=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250430121707eucas1p2a9e61dc5accfb9784d6d1aa81028408c~7F8ff0M5F2650226502eucas1p2q;
 Wed, 30 Apr 2025 12:17:07 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250430121706eusmtip122471c36d7228758127881c4f8464ec5~7F8ecFgJI2844428444eusmtip1q;
 Wed, 30 Apr 2025 12:17:06 +0000 (GMT)
Message-ID: <5413f5c7-8049-4490-bdd6-8c03f6e2057f@samsung.com>
Date: Wed, 30 Apr 2025 14:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] pmdomain: thead: Add GPU-specific clock and
 reset handling for TH1520
To: Ulf Hansson <ulf.hansson@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
 Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAPDyKFqX5cjQe3-MX3W9wMoQW3gzwSvb0QMf-_sTJuq_TeGsCg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250430121707eucas1p2a9e61dc5accfb9784d6d1aa81028408c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288
X-EPHeader: CA
X-CMS-RootMailID: 20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288
References: <CGME20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288@eucas1p2.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-3-70c5af2af96c@samsung.com>
 <CAPDyKFqX5cjQe3-MX3W9wMoQW3gzwSvb0QMf-_sTJuq_TeGsCg@mail.gmail.com>
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



On 4/25/25 10:50, Ulf Hansson wrote:
> + Bartosz
> 
> On Mon, 14 Apr 2025 at 20:53, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> Extend the TH1520 power domain driver to manage GPU related clocks and
>> resets via generic PM domain start/stop callbacks.
>>
>> The TH1520 GPU requires a special sequence to correctly initialize:
>> - Enable the GPU clocks
>> - Deassert the GPU clkgen reset
>> - Delay for a few cycles to satisfy hardware requirements
>> - Deassert the GPU core reset
>>
>> This sequence is SoC-specific and must be abstracted away from the
>> Imagination GPU driver, which expects only a standard single reset
>> interface. Following discussions with kernel maintainers [1], this
>> logic is placed inside a PM domain, rather than polluting the clock or
>> reset frameworks, or the GPU driver itself.
> 
> Speaking about special sequences for power-on/off devices like this
> one, that's a known common problem. We actually have a generic
> subsystem for this now, drivers/power/sequencing/*.
> 
> Perhaps it's worth having a look at that, it should allow us to
> abstract things, so the GPU driver can stay more portable.
> 
> Kind regards
> Uffe


Hi Ulf, Bartosz,

Thank you very much for your suggestion, Ulf. I took a look at the
drivers/power/sequencing/ API and agree that it seems like a suitable
framework to model the specific power-on/off sequence required for the
TH1520 GPU, allowing for better abstraction than embedding the logic
directly in genpd callbacks.

My plan is to refactor the series based on this approach. Here's how I
envision the implementation:

1) Provider (th1520-pm-domains.c): This driver will register as both a
generic power domain provider and a power sequencer provider for the GPU
domain.

2) pwrseq target Definition: A pwrseq target will be defined within the
provider to encapsulate the required sequence (enable clocks, deassert
clkgen reset, delay, deassert GPU core reset). The target will be
named using the GPU's first compatible string with a "-power" suffix.

Example GPU DT node, adhering to convention introduced here [1].
gpu: gpu@ffef400000 {
	compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
	             "img,img-bxm", "img-rogue";
};

[1] - https://lore.kernel.org/all/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com/#t

3) Consumer (drm/imagination): In its probe function, the driver will
read the first compatible string of the device node. It will then
attempt devm_pwrseq_get(dev, compatible_string_with_suffix) (e.g.
devm_pwrseq_get(dev, "thead,th1520-gpu-power")). The result
pvr_dev->pwrseq_desc will be stored (it will be NULL if no suitable
provider/target is found, or a valid descriptor if successful). The
driver will still acquire its necessary clock/reset handles via
devm_*_get in probe for potential use outside of RPM (like devfreq).

4) Consumer Runtime PM Callbacks
(pvr_power_device_resume/suspend): These functions will check if
pvr_dev->pwrseq_desc is valid. If valid: Call pwrseq_power_on() in
resume and pwrseq_power_off() in suspend. The driver will not perform
its own clock/reset enabling/disabling for resources managed by the
sequence. If NULL: Execute the existing fallback logic (manually
enabling/disabling clocks/resets using the handles acquired in probe).
Unconditional logic (like FW booting/shutdown) will remain within the
RPM callbacks, executed after successful power on or before power off,
respectively.

5) Resource Handling (via genpd callbacks): To allow the provider
(th1520-pm-domains.c) to access resources defined in the consumer's DT
node (specifically the clocks and gpu_reset needed in the sequence), I
plan to keep the attach_dev / detach_dev genpd callbacks as implemented
in the previous patch version. attach_dev will acquire the consumer's
resources (using the consumer_dev pointer) and store the handles in the
provider's context. The pwrseq unit callbacks will then access these
stored handles via the shared context. detach_dev will release these
resources. This seems necessary as the pwrseq API itself doesn't
currently provide a direct hook for the provider to get the consumer's
device pointer or manage its resources across the pwrseq_get/put
lifecycle.

This approach uses the pwrseq framework for the sequence logic as
suggested, keeps the generic consumer driver free of SoC-specific
sequence details (by using the compatible string lookup for this), and
retains the genpd attach/detach mechanism to handle cross-node resource
dependencies.

Please let me know if this plan sounds reasonable.

Thanks !

> 
>>
>> To support this, the TH1520 PM domain implements `attach_dev` and
>> `detach_dev` callbacks, allowing it to dynamically acquire clock and
>> reset resources from the GPU device tree node at runtime. This allows to
>> maintain the separation between generic drivers and SoC-specific
>> integration logic.
>>
>> As a result, the PM domain not only handles power sequencing but also
>> effectively acts as the SoC specific "glue driver" for the GPU device,
>> encapsulating all TH1520-specific clock and reset management.
>>
>> This approach improves maintainability and aligns with the broader
>> direction of treating PM domains as lightweight SoC-specific power
>> management drivers [2].
>>
>> [1] - https://lore.kernel.org/all/CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com/
>> [2] - https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/pmdomain/thead/th1520-pm-domains.c | 199 +++++++++++++++++++++++++++++
>>  1 file changed, 199 insertions(+)
>>
>> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
>> index f702e20306f469aeb0ed15e54bd4f8309f28018c..75412efb195eb534c2e8ff10ced65ed4c4d2452c 100644
>> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
>> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
>> @@ -5,10 +5,13 @@
>>   * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>>   */
>>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>>  #include <linux/firmware/thead/thead,th1520-aon.h>
>>  #include <linux/slab.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_domain.h>
>> +#include <linux/reset.h>
>>
>>  #include <dt-bindings/power/thead,th1520-power.h>
>>
>> @@ -16,6 +19,15 @@ struct th1520_power_domain {
>>         struct th1520_aon_chan *aon_chan;
>>         struct generic_pm_domain genpd;
>>         u32 rsrc;
>> +
>> +       /* PM-owned reset */
>> +       struct reset_control *clkgen_reset;
>> +
>> +       /* Device-specific resources */
>> +       struct device *attached_dev;
>> +       struct clk_bulk_data *clks;
>> +       int num_clks;
>> +       struct reset_control *gpu_reset;
>>  };
>>
>>  struct th1520_power_info {
>> @@ -61,6 +73,177 @@ static int th1520_pd_power_off(struct generic_pm_domain *domain)
>>         return th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
>>  }
>>
>> +static int th1520_gpu_init_consumer_clocks(struct device *dev,
>> +                                          struct th1520_power_domain *pd)
>> +{
>> +       static const char *const clk_names[] = { "core", "sys" };
>> +       int i, ret;
>> +
>> +       pd->num_clks = ARRAY_SIZE(clk_names);
>> +       pd->clks = devm_kcalloc(dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
>> +       if (!pd->clks)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < pd->num_clks; i++)
>> +               pd->clks[i].id = clk_names[i];
>> +
>> +       ret = devm_clk_bulk_get(dev, pd->num_clks, pd->clks);
>> +       if (ret)
>> +               return dev_err_probe(dev, ret, "Failed to get GPU clocks\n");
>> +
>> +       return 0;
>> +}
>> +
>> +static int th1520_gpu_init_consumer_reset(struct device *dev,
>> +                                         struct th1520_power_domain *pd)
>> +{
>> +       int ret;
>> +
>> +       pd->gpu_reset = reset_control_get_exclusive(dev, NULL);
>> +       if (IS_ERR(pd->gpu_reset)) {
>> +               ret = PTR_ERR(pd->gpu_reset);
>> +               pd->gpu_reset = NULL;
>> +               return dev_err_probe(dev, ret, "Failed to get GPU reset\n");
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int th1520_gpu_init_pm_reset(struct device *dev,
>> +                                   struct th1520_power_domain *pd)
>> +{
>> +       pd->clkgen_reset = devm_reset_control_get_exclusive(dev, "gpu-clkgen");
>> +       if (IS_ERR(pd->clkgen_reset))
>> +               return dev_err_probe(dev, PTR_ERR(pd->clkgen_reset),
>> +                                    "Failed to get GPU clkgen reset\n");
>> +
>> +       return 0;
>> +}
>> +
>> +static int th1520_gpu_domain_attach_dev(struct generic_pm_domain *genpd,
>> +                                       struct device *dev)
>> +{
>> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
>> +       int ret;
>> +
>> +       /* Enforce 1:1 mapping - only one device can be attached. */
>> +       if (pd->attached_dev)
>> +               return -EBUSY;
>> +
>> +       /* Initialize clocks using the consumer device */
>> +       ret = th1520_gpu_init_consumer_clocks(dev, pd);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Initialize consumer reset using the consumer device */
>> +       ret = th1520_gpu_init_consumer_reset(dev, pd);
>> +       if (ret) {
>> +               if (pd->clks) {
>> +                       clk_bulk_put(pd->num_clks, pd->clks);
>> +                       kfree(pd->clks);
>> +                       pd->clks = NULL;
>> +                       pd->num_clks = 0;
>> +               }
>> +               return ret;
>> +       }
>> +
>> +       /* Mark device as platform PM driver managed */
>> +       device_platform_resources_set_pm_managed(dev, true);
>> +       pd->attached_dev = dev;
>> +
>> +       return 0;
>> +}
>> +
>> +static void th1520_gpu_domain_detach_dev(struct generic_pm_domain *genpd,
>> +                                        struct device *dev)
>> +{
>> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
>> +
>> +       /* Ensure this is the device we have attached */
>> +       if (pd->attached_dev != dev) {
>> +               dev_warn(dev,
>> +                        "tried to detach from GPU domain but not attached\n");
>> +               return;
>> +       }
>> +
>> +       /* Remove PM managed flag when detaching */
>> +       device_platform_resources_set_pm_managed(dev, false);
>> +
>> +       /* Clean up the consumer-owned resources */
>> +       if (pd->gpu_reset) {
>> +               reset_control_put(pd->gpu_reset);
>> +               pd->gpu_reset = NULL;
>> +       }
>> +
>> +       if (pd->clks) {
>> +               clk_bulk_put(pd->num_clks, pd->clks);
>> +               kfree(pd->clks);
>> +               pd->clks = NULL;
>> +               pd->num_clks = 0;
>> +       }
>> +
>> +       pd->attached_dev = NULL;
>> +}
>> +
>> +static int th1520_gpu_domain_start(struct device *dev)
>> +{
>> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
>> +       int ret;
>> +
>> +       /* Check if we have all required resources */
>> +       if (pd->attached_dev != dev || !pd->clks || !pd->gpu_reset ||
>> +           !pd->clkgen_reset)
>> +               return -ENODEV;
>> +
>> +       ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = reset_control_deassert(pd->clkgen_reset);
>> +       if (ret)
>> +               goto err_disable_clks;
>> +
>> +       /*
>> +        * According to the hardware manual, a delay of at least 32 clock
>> +        * cycles is required between de-asserting the clkgen reset and
>> +        * de-asserting the GPU reset. Assuming a worst-case scenario with
>> +        * a very high GPU clock frequency, a delay of 1 microsecond is
>> +        * sufficient to ensure this requirement is met across all
>> +        * feasible GPU clock speeds.
>> +        */
>> +       udelay(1);
>> +
>> +       ret = reset_control_deassert(pd->gpu_reset);
>> +       if (ret)
>> +               goto err_assert_clkgen;
>> +
>> +       return 0;
>> +
>> +err_assert_clkgen:
>> +       reset_control_assert(pd->clkgen_reset);
>> +err_disable_clks:
>> +       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>> +       return ret;
>> +}
>> +
>> +static int th1520_gpu_domain_stop(struct device *dev)
>> +{
>> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
>> +
>> +       /* Check if we have all required resources and if this is the attached device */
>> +       if (pd->attached_dev != dev || !pd->clks || !pd->gpu_reset ||
>> +           !pd->clkgen_reset)
>> +               return -ENODEV;
>> +
>> +       reset_control_assert(pd->gpu_reset);
>> +       reset_control_assert(pd->clkgen_reset);
>> +       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>> +
>> +       return 0;
>> +}
>> +
>>  static struct generic_pm_domain *th1520_pd_xlate(const struct of_phandle_args *spec,
>>                                                  void *data)
>>  {
>> @@ -99,6 +282,22 @@ th1520_add_pm_domain(struct device *dev, const struct th1520_power_info *pi)
>>         pd->genpd.power_off = th1520_pd_power_off;
>>         pd->genpd.name = pi->name;
>>
>> +       /* there are special callbacks for the GPU */
>> +       if (pi == &th1520_pd_ranges[TH1520_GPU_PD]) {
>> +               /* Initialize the PM-owned reset */
>> +               ret = th1520_gpu_init_pm_reset(dev, pd);
>> +               if (ret)
>> +                       return ERR_PTR(ret);
>> +
>> +               /* No device attached yet */
>> +               pd->attached_dev = NULL;
>> +
>> +               pd->genpd.dev_ops.start = th1520_gpu_domain_start;
>> +               pd->genpd.dev_ops.stop = th1520_gpu_domain_stop;
>> +               pd->genpd.attach_dev = th1520_gpu_domain_attach_dev;
>> +               pd->genpd.detach_dev = th1520_gpu_domain_detach_dev;
>> +       }
>> +
>>         ret = pm_genpd_init(&pd->genpd, NULL, true);
>>         if (ret)
>>                 return ERR_PTR(ret);
>>
>> --
>> 2.34.1
>>
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
