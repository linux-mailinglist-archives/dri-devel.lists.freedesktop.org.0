Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3776BBDD1E
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CAF10E307;
	Mon,  6 Oct 2025 10:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="DXKfJblB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEBE10E307
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759748347; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iOvQ6mYahmmVMXQ++JcW3wilLGuliEEbv1y4fvCwJR/qxc0jNgiP65+ibRgETu/4vpF2KK/MqEAIuqDbkrLgWLVRdl6laViirvOdhO2VlJzKujJwIwyoRwbWhX1ltLlwhZZ9YBPA1oXfAc8T8wdeCXl+PTWe+C24hMw/A7IEGZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759748347;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hF2F4bhzwx6QlYNz0jQgr/ulRUVveWKuJw7VGpizJCQ=; 
 b=fuhoPOyM1L7Il9/TfbiB6MFXeYwSwB1iIL2OF/JjxXwB8nBj4bgwl3m0bGtACXuWXwY5JBn2ga4BVnZJRZrerMWvUCSH/SwTGjYvwnOuGoa5MOV9VvumpUziDfx42nvcmz6bqvepYh4tIjW55iEXlixpAqsOrmzCk07ktYF6kgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759748347; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=hF2F4bhzwx6QlYNz0jQgr/ulRUVveWKuJw7VGpizJCQ=;
 b=DXKfJblBh63XZ9hnmtE1RCFkN+nj6Hb2UKuim9UtZ8cW6LvKNpKKIpKLvKUg1qsO
 g8n4oTuehkEEyJ+cOnO4D/5xA1I6KLj9FMb6iYszh3NYECFO/+yEI0qTgDWoPs9Eghp
 ZYUjyeulNJA0kZwKuXkeB5PcuPA15qtkzzSqCYRY=
Received: by mx.zohomail.com with SMTPS id 1759748344242745.9587665945361;
 Mon, 6 Oct 2025 03:59:04 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 7/7] pmdomain: mediatek: Add support for MFlexGraphics
Date: Mon, 06 Oct 2025 12:58:55 +0200
Message-ID: <8586490.T7Z3S40VBb@workhorse>
In-Reply-To: <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-7-76498ad61d9e@collabora.com>
 <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
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

On Friday, 3 October 2025 23:41:16 Central European Summer Time Chia-I Wu w=
rote:
> On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> > by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> > integration silicon is required to power on the GPU.
> >
> > This glue silicon is in the form of an embedded microcontroller running
> > special-purpose firmware, which autonomously adjusts clocks and
> > regulators.
> >
> > Implement a driver, modelled as a pmdomain driver with a
> > set_performance_state operation, to support these SoCs.
> I like this model a lot. Thanks!
>=20
> panthor might potentially need to interact with this driver beyond
> what pmdomain provides. I am thinking about querying
> GF_REG_SHADER_PRESENT. Not sure if we've heard back from the vendor.

We did. The vendor confirmed this value is read by the EB firmware
from an efuse, but considers the efuse address to be confidential.
Consequently, we are not allowed to know the efuse address, or any
of the other information required to read the efuse ourselves
directly, such as what clocks and power domains it depends on.

We therefore likely need to pass GF_REG_SHADER_PRESENT onward, but
I do have an idea for that: struct generic_pm_domain has a member
"cpumask_var_t cpus", which is there to communicate a mask of which
CPUs are attached to a power domain if the power domain has the flag
GENPD_FLAG_CPU_DOMAIN set. If the flag isn't set, the member is
unused.

This means we could overload its meaning, e.g. with a new flag, to
communicate such masks for other purposes, since it's already the
right type and all. This would be quite a generic way for hardware
other than cpus to communicate such core masks. I was planning to
develop and send out an RFC series for this, to gauge how much Ulf
Hansson hates that approach.

A different solution could be that mtk-mfg-pmdomain could act as an
nvmem provider, and then we integrate generic "shader_present is
stored in nvmem" support in panthor, and adjust the DT binding for
this.

This approach would again be generic across vendors from panthor's
perspective. It would, however, leak into DT the fact that we have
to implement this in the gpufreq device, rather than having the
efuse read directly.

> Have you considered moving this to drivers/soc/mediatek such that we
> can provide include/linux/mtk-mfg.h to panthor?

Having panthor read data structures from mtk-mfg-pmdomain would be a
last resort for me if none of the other approaches work out, as I'm
not super keen on adding vendor-specific code paths to panthor
itself. A new generic code path in panthor that is only used by one
vendor for now is different in that it has the potential to be used
by a different vendor's integration logic in the future as well.

So for now I'd like to keep it out of public includes and panthor as
much as possible, unless the two other approaches don't work out for
us.

> >
> > The driver also exposes the actual achieved clock rate, as read back
> > from the MCU, as common clock framework clocks, by acting as a clock
> > provider as well.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/pmdomain/mediatek/Kconfig            |   16 +
> >  drivers/pmdomain/mediatek/Makefile           |    1 +
> >  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 1027 ++++++++++++++++++=
++++++++
> >  3 files changed, 1044 insertions(+)
> [...]
> > +static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
> > +{
> > +       struct device *dev =3D &mfg->pdev->dev;
> > +       struct mtk_mfg_ipi_msg msg =3D {};
> > +       int ret;
> > +
> > +       dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", mfg-=
>shared_mem_size);
> > +       memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
> > +
> > +       msg.cmd =3D CMD_INIT_SHARED_MEM;
> > +       msg.u.shared_mem.base =3D mfg->shared_mem_phys;
> > +       msg.u.shared_mem.size =3D mfg->shared_mem_size;
> > +
> > +       ret =3D mtk_mfg_send_ipi(mfg, &msg);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (readl(mfg->shared_mem) !=3D GPUEB_MEM_MAGIC) {
> Add the offset GF_REG_MAGIC, even though it is 0.

Good catch, will do!

>=20
> > +               dev_err(dev, "EB did not initialise shared memory corre=
ctly\n");
> > +               return -EIO;
> > +       }
> > +
> > +       return 0;
> > +}
> [...]
> > +static int mtk_mfg_mt8196_init(struct mtk_mfg *mfg)
> > +{
> > +       void __iomem *e2_base;
> > +
> > +       e2_base =3D devm_platform_ioremap_resource_byname(mfg->pdev, "h=
w-revision");
> > +       if (IS_ERR(e2_base))
> > +               return dev_err_probe(&mfg->pdev->dev, PTR_ERR(e2_base),
> > +                                    "Couldn't get hw-revision register=
\n");
> > +
> > +       if (readl(e2_base) =3D=3D MFG_MT8196_E2_ID)
> > +               mfg->ghpm_en_reg =3D RPC_DUMMY_REG_2;
> > +       else
> > +               mfg->ghpm_en_reg =3D RPC_GHPM_CFG0_CON;
> > +
> > +       return 0;
> > +};
> Extraneous semicolon.

Good catch, will fix!

>=20
> > +static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
> > +{
> > +       struct device *dev =3D &mfg->pdev->dev;
> > +       struct mtk_mfg_mbox *gf;
> > +       struct mtk_mfg_mbox *slp;
> > +
> > +       gf =3D devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
> > +       if (!gf)
> > +               return -ENOMEM;
> > +
> > +       gf->rx_data =3D devm_kzalloc(dev, GPUEB_MBOX_MAX_RX_SIZE, GFP_K=
ERNEL);
> It looks like gfx->rx_data can simply be "struct mtk_mfg_ipi_msg rx_data;=
".

Hmmm, good point. I'll change it to that.

>=20
> > +       if (!gf->rx_data)
> > +               return -ENOMEM;
> > +
> > +       gf->mfg =3D mfg;
> > +       init_completion(&gf->rx_done);
> > +       gf->cl.dev =3D dev;
> > +       gf->cl.rx_callback =3D mtk_mfg_mbox_rx_callback;
> > +       gf->cl.tx_tout =3D GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> > +       gf->ch =3D mbox_request_channel_byname(&gf->cl, "gpufreq");
> > +       if (IS_ERR(gf->ch))
> > +               return PTR_ERR(gf->ch);
> > +
> > +       mfg->gf_mbox =3D gf;
> > +
> > +       slp =3D devm_kzalloc(dev, sizeof(*slp), GFP_KERNEL);
> > +       if (!slp)
> > +               return -ENOMEM;
> > +
> > +       slp->mfg =3D mfg;
> > +       init_completion(&slp->rx_done);
> > +       slp->cl.dev =3D dev;
> > +       slp->cl.tx_tout =3D GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> > +       slp->cl.tx_block =3D true;
> > +       slp->ch =3D mbox_request_channel_byname(&slp->cl, "sleep");
> > +       if (IS_ERR(slp->ch))
> > +               return PTR_ERR(slp->ch);
> Free gf->ch.

Good catch! Will do.

> > +
> > +       mfg->slp_mbox =3D slp;
> > +
> > +       return 0;
> > +}
> > +
> > +static int mtk_mfg_init_clk_provider(struct mtk_mfg *mfg)
> > +{
> > +       struct device *dev =3D &mfg->pdev->dev;
> > +       struct clk_hw_onecell_data *clk_data;
> > +       int ret;
> > +
> > +       clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, 2), G=
=46P_KERNEL);
> > +       if (!clk_data)
> > +               return -ENOMEM;
> > +
> > +       clk_data->num =3D 2;
> > +
> > +       mfg->clk_core_hw.init =3D &mtk_mfg_clk_gpu_init;
> > +       mfg->clk_stack_hw.init =3D &mtk_mfg_clk_stack_init;
> > +
> > +       ret =3D devm_clk_hw_register(dev, &mfg->clk_core_hw);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Couldn't register GPU c=
ore clock\n");
> > +
> > +       ret =3D devm_clk_hw_register(dev, &mfg->clk_stack_hw);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Couldn't register GPU s=
tack clock\n");
> > +
> > +       clk_data->hws[0] =3D &mfg->clk_core_hw;
> > +       clk_data->hws[1] =3D &mfg->clk_stack_hw;
> > +
> > +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,=
 clk_data);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Couldn't register clock=
 provider\n");
> > +
> > +       return 0;
> > +}
> > +
> > +static int mtk_mfg_probe(struct platform_device *pdev)
> > +{
> > +       struct device_node *shmem __free(device_node);
> > +       struct mtk_mfg *mfg;
> > +       struct device *dev =3D &pdev->dev;
> > +       const struct mtk_mfg_variant *data =3D of_device_get_match_data=
(dev);
> > +       struct resource res;
> > +       int ret, i;
> > +
> > +       mfg =3D devm_kzalloc(dev, sizeof(*mfg), GFP_KERNEL);
> > +       if (!mfg)
> > +               return -ENOMEM;
> > +
> > +       mfg->pdev =3D pdev;
> > +       mfg->variant =3D data;
> > +
> > +       dev_set_drvdata(dev, mfg);
> > +
> > +       mfg->gpr =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(mfg->gpr))
> > +               return dev_err_probe(dev, PTR_ERR(mfg->gpr),
> > +                                    "Couldn't retrieve GPR MMIO regist=
ers\n");
> > +
> > +       mfg->rpc =3D devm_platform_ioremap_resource(pdev, 1);
> > +       if (IS_ERR(mfg->rpc))
> > +               return dev_err_probe(dev, PTR_ERR(mfg->rpc),
> > +                                    "Couldn't retrieve RPC MMIO regist=
ers\n");
> > +
> > +       mfg->clk_eb =3D devm_clk_get(dev, "eb");
> > +       if (IS_ERR(mfg->clk_eb))
> > +               return dev_err_probe(dev, PTR_ERR(mfg->clk_eb),
> > +                                    "Couldn't get 'eb' clock\n");
> > +
> > +       mfg->gpu_clks =3D devm_kcalloc(dev, data->num_clks, sizeof(*mfg=
=2D>gpu_clks),
> > +                                    GFP_KERNEL);
> > +       if (!mfg->gpu_clks)
> > +               return -ENOMEM;
> > +
> > +       for (i =3D 0; i < data->num_clks; i++)
> > +               mfg->gpu_clks[i].id =3D data->clk_names[i];
> > +
> > +       ret =3D devm_clk_bulk_get(dev, data->num_clks, mfg->gpu_clks);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Couldn't get GPU clocks=
\n");
> > +
> > +       mfg->gpu_regs =3D devm_kcalloc(dev, data->num_regulators,
> > +                                    sizeof(*mfg->gpu_regs), GFP_KERNEL=
);
> > +       if (!mfg->gpu_regs)
> > +               return -ENOMEM;
> > +
> > +       for (i =3D 0; i < data->num_regulators; i++)
> > +               mfg->gpu_regs[i].supply =3D data->regulator_names[i];
> > +
> > +       ret =3D devm_regulator_bulk_get(dev, data->num_regulators, mfg-=
>gpu_regs);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Couldn't get GPU regula=
tors\n");
> > +
> > +       ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &re=
s);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Couldn't get GPUEB shar=
ed memory\n");
> > +
> > +       mfg->shared_mem =3D devm_ioremap(dev, res.start, resource_size(=
&res));
> > +       if (!mfg->shared_mem)
> > +               return dev_err_probe(dev, -ENOMEM, "Can't ioremap GPUEB=
 shared memory\n");
> > +       mfg->shared_mem_size =3D resource_size(&res);
> > +       mfg->shared_mem_phys =3D res.start;
> > +
> > +       if (data->init) {
> > +               ret =3D data->init(mfg);
> > +               if (ret)
> > +                       return dev_err_probe(dev, ret, "Variant init fa=
iled\n");
> > +       }
> > +
> > +       mfg->pd.name =3D dev_name(dev);
> > +       mfg->pd.attach_dev =3D mtk_mfg_attach_dev;
> > +       mfg->pd.detach_dev =3D mtk_mfg_detach_dev;
> > +       mfg->pd.power_off =3D mtk_mfg_power_off;
> > +       mfg->pd.power_on =3D mtk_mfg_power_on;
> > +       mfg->pd.set_performance_state =3D mtk_mfg_set_performance;
> > +       mfg->pd.flags =3D GENPD_FLAG_OPP_TABLE_FW;
> > +
> > +       ret =3D pm_genpd_init(&mfg->pd, NULL, false);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Failed to initialise po=
wer domain\n");
> We need to clean up mgf->md on errors from this point on. Maybe we can
> move this to a later point?
>=20
> > +
> > +       ret =3D mtk_mfg_init_mbox(mfg);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Couldn't initialise mai=
lbox\n");
> We need to free the mboxes from this point on.
>=20

=46or this and the one above, does .remove not get called on probe failure?=
 If not,
I'll definitely do this. Otherwise it seems redundant, though with the added
concern that .remove does not check before calling those functions.

> > +       ret =3D mtk_mfg_power_on(&mfg->pd);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Failed to power on MFG\=
n");
> > +
> > +       ret =3D mtk_mfg_init_shared_mem(mfg);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "Couldn't initialize EB shared =
memory\n");
> > +               goto out;
> > +       }
> > +
> > +       ret =3D mtk_mfg_read_opp_tables(mfg);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "Error reading OPP tables from =
EB\n");
> > +               goto out;
> > +       }
> > +
> > +       ret =3D mtk_mfg_init_clk_provider(mfg);
> > +       if (ret)
> > +               goto out;
> > +
> > +       ret =3D of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "Failed to add pmdomain provide=
r\n");
> > +               goto out;
> > +       }
> > +
> > +       return 0;
> > +
> > +out:
> > +       mtk_mfg_power_off(&mfg->pd);
> > +       return ret;
> > +}
>=20

Thanks for the review!

Kind regards,
Nicolas Frattaroli


