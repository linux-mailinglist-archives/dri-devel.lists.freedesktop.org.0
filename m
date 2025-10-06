Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E791ABBDE5E
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5AA10E34F;
	Mon,  6 Oct 2025 11:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="MMZpYfqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE3010E34F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759750843; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C8pwcjsJ+qowHJ37zlXp12Ma1w0Ko/I/NzluVBpY+/82lmGqlPpQvMpphsi4l9HCJpYdFV3dIJotUDRoRbIzK1u6ioMrJtEmt2FeIWl9tKwOqWP9xOq11BwfRRCYCeYEGXkX8gE5YRTUJrf9FsmKfBnMPytChaMtIyvSFrXRggk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759750843;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2zSa8t0BLFbE2sFL8sEge/sB6GfievzXdAQnRQjaaHE=; 
 b=npgMq/QsQ/ncrLWzA2MOJFVNkUM49rUnZfnuxYOiG++NPcP5dp0wk2W4d2JT/tcHCvch/mfY/S0OWF9kuMJn+j/C4pGf+UYoMPBPmGlIA9GsnOLlFulC9AVMVoXiifzsLZy5fTlu7FBrkE3xZCoVO3SnmPBdt1Y1q3JVC9oDafk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759750843; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=2zSa8t0BLFbE2sFL8sEge/sB6GfievzXdAQnRQjaaHE=;
 b=MMZpYfqpYfrc7dXHgD412byATIiTHhnz7W4rKmFMt2MG3Zl2+7d0+d0Ced8fa1W1
 iBcyNF/oSgkohtiQC+CM3LAixL1bPSoHqFOaTAqQP+eHRAE4iMk2jsDArs+EnEt5AiJ
 L4Jk/8QKvYFz2ARu1LgCLJ4C0C0B7pp+XYoUnv/o=
Received: by mx.zohomail.com with SMTPS id 1759750841484642.2099292517786;
 Mon, 6 Oct 2025 04:40:41 -0700 (PDT)
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
Date: Mon, 06 Oct 2025 13:40:35 +0200
Message-ID: <2323923.iZASKD2KPV@workhorse>
In-Reply-To: <8586490.T7Z3S40VBb@workhorse>
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
 <8586490.T7Z3S40VBb@workhorse>
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

On Monday, 6 October 2025 12:58:55 Central European Summer Time Nicolas Fra=
ttaroli wrote:
> On Friday, 3 October 2025 23:41:16 Central European Summer Time Chia-I Wu=
 wrote:
> > On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > Various MediaTek SoCs use GPU integration silicon named "MFlexGraphic=
s"
> > > by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> > > integration silicon is required to power on the GPU.
> > >
> > > This glue silicon is in the form of an embedded microcontroller runni=
ng
> > > special-purpose firmware, which autonomously adjusts clocks and
> > > regulators.
> > >
> > > Implement a driver, modelled as a pmdomain driver with a
> > > set_performance_state operation, to support these SoCs.
> [...]
> > > +static int mtk_mfg_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device_node *shmem __free(device_node);
> > > +       struct mtk_mfg *mfg;
> > > +       struct device *dev =3D &pdev->dev;
> > > +       const struct mtk_mfg_variant *data =3D of_device_get_match_da=
ta(dev);
> > > +       struct resource res;
> > > +       int ret, i;
> > > +
> > > +       mfg =3D devm_kzalloc(dev, sizeof(*mfg), GFP_KERNEL);
> > > +       if (!mfg)
> > > +               return -ENOMEM;
> > > +
> > > +       mfg->pdev =3D pdev;
> > > +       mfg->variant =3D data;
> > > +
> > > +       dev_set_drvdata(dev, mfg);
> > > +
> > > +       mfg->gpr =3D devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(mfg->gpr))
> > > +               return dev_err_probe(dev, PTR_ERR(mfg->gpr),
> > > +                                    "Couldn't retrieve GPR MMIO regi=
sters\n");
> > > +
> > > +       mfg->rpc =3D devm_platform_ioremap_resource(pdev, 1);
> > > +       if (IS_ERR(mfg->rpc))
> > > +               return dev_err_probe(dev, PTR_ERR(mfg->rpc),
> > > +                                    "Couldn't retrieve RPC MMIO regi=
sters\n");
> > > +
> > > +       mfg->clk_eb =3D devm_clk_get(dev, "eb");
> > > +       if (IS_ERR(mfg->clk_eb))
> > > +               return dev_err_probe(dev, PTR_ERR(mfg->clk_eb),
> > > +                                    "Couldn't get 'eb' clock\n");
> > > +
> > > +       mfg->gpu_clks =3D devm_kcalloc(dev, data->num_clks, sizeof(*m=
fg->gpu_clks),
> > > +                                    GFP_KERNEL);
> > > +       if (!mfg->gpu_clks)
> > > +               return -ENOMEM;
> > > +
> > > +       for (i =3D 0; i < data->num_clks; i++)
> > > +               mfg->gpu_clks[i].id =3D data->clk_names[i];
> > > +
> > > +       ret =3D devm_clk_bulk_get(dev, data->num_clks, mfg->gpu_clks);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Couldn't get GPU cloc=
ks\n");
> > > +
> > > +       mfg->gpu_regs =3D devm_kcalloc(dev, data->num_regulators,
> > > +                                    sizeof(*mfg->gpu_regs), GFP_KERN=
EL);
> > > +       if (!mfg->gpu_regs)
> > > +               return -ENOMEM;
> > > +
> > > +       for (i =3D 0; i < data->num_regulators; i++)
> > > +               mfg->gpu_regs[i].supply =3D data->regulator_names[i];
> > > +
> > > +       ret =3D devm_regulator_bulk_get(dev, data->num_regulators, mf=
g->gpu_regs);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Couldn't get GPU regu=
lators\n");
> > > +
> > > +       ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &=
res);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Couldn't get GPUEB sh=
ared memory\n");
> > > +
> > > +       mfg->shared_mem =3D devm_ioremap(dev, res.start, resource_siz=
e(&res));
> > > +       if (!mfg->shared_mem)
> > > +               return dev_err_probe(dev, -ENOMEM, "Can't ioremap GPU=
EB shared memory\n");
> > > +       mfg->shared_mem_size =3D resource_size(&res);
> > > +       mfg->shared_mem_phys =3D res.start;
> > > +
> > > +       if (data->init) {
> > > +               ret =3D data->init(mfg);
> > > +               if (ret)
> > > +                       return dev_err_probe(dev, ret, "Variant init =
failed\n");
> > > +       }
> > > +
> > > +       mfg->pd.name =3D dev_name(dev);
> > > +       mfg->pd.attach_dev =3D mtk_mfg_attach_dev;
> > > +       mfg->pd.detach_dev =3D mtk_mfg_detach_dev;
> > > +       mfg->pd.power_off =3D mtk_mfg_power_off;
> > > +       mfg->pd.power_on =3D mtk_mfg_power_on;
> > > +       mfg->pd.set_performance_state =3D mtk_mfg_set_performance;
> > > +       mfg->pd.flags =3D GENPD_FLAG_OPP_TABLE_FW;
> > > +
> > > +       ret =3D pm_genpd_init(&mfg->pd, NULL, false);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Failed to initialise =
power domain\n");
> > We need to clean up mgf->md on errors from this point on. Maybe we can
> > move this to a later point?
> >=20
> > > +
> > > +       ret =3D mtk_mfg_init_mbox(mfg);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Couldn't initialise m=
ailbox\n");
> > We need to free the mboxes from this point on.
> >=20
>=20
> For this and the one above, does .remove not get called on probe failure?=
 If not,
> I'll definitely do this. Otherwise it seems redundant, though with the ad=
ded
> concern that .remove does not check before calling those functions.
>=20

Alright nevermind, I'm being confused by devres vs. remove callback.

=2Eremove does not get called if the probe function fails, but devres
handlers still do get called.

Sorry for the confusion, will fix things accordingly.



