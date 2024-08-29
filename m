Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56B9648D0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE5D10E6C5;
	Thu, 29 Aug 2024 14:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ipD4JSHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B561210E6C5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:43:12 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6b8d96aa4c3so6507147b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724942591; x=1725547391; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hxc+NHU9oUAbveDZJZPbI9Xh3bTMDWHunp8NB3pKW1Q=;
 b=ipD4JSHr1TILIOe0ibC7WVDri6WceQJdsrx9t00X+3ObVyrDNuEvicf7etwEHjRwlU
 BcdKvIssq42u5i1g2YHNictPyJBwAKnHvp4in621ZSc2pkH52ZdMurojzjJ1aJKl7VmR
 mQNMmAlYBs1waMcVrsAUdcmofyChwmIgyaBKiDvPutnF0PuVFSyq10xPbm9sWvMFZs+N
 SKtCbM4MqBQpj6QXtAnVM0Ppc5Dcir6WcfUNxQGQdkGvg+2yEdQli/meaC27PQbmZGvk
 JrXZH0TgyYJo56IGCM5c2no4TVweNI5sdn8fcp7PcBotMCEzFi11uWeoQR7QclaFUO+D
 o6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724942591; x=1725547391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hxc+NHU9oUAbveDZJZPbI9Xh3bTMDWHunp8NB3pKW1Q=;
 b=mzrMldWHRASHg/+MWIE3002jU7J0I58++4qlhPwjhjsi5JusQwxZ0O966zSNN++Uh4
 ijy/QtoB3/Z76pt8x1BZAzR7jZOLoZ7qdNaMvqEdiRMhPIpraYWWHTTyzHASj7jlNvSV
 8G7/4FrG0t/UDBqDJMsq9tL4HhoSALuyIoqqj2t9bTGYJ7GOHiyiDi8IdTAaqROUShFg
 xkyv2OK8Z+kcfg4krRnN7pyX3jZud+OCu96k57/0tlOhaEj8EsySOx7xywi8svOhFlmo
 C+jl2breydN2pLfy6JyZ12fajGGs3WkGNPqfmVa/AW1aq5lOq39EKp20kw/LyxPy/3bt
 nE3A==
X-Gm-Message-State: AOJu0YxE/gj9licBXQlKjwjYh6UMhP6eQCmVq4l1YHTXmPgOFGUro/HX
 gHIl+r2QNHbo1VWXsL6+6kbqakejYS6DeTV2/wWRloQ5Kkddx6R4eSQObjcGUrbJrkzRS08uXij
 WDHOTkk67r1IUqkTydWeeoEi7rltYcslOHYDfgyBsBCxcm3kD
X-Google-Smtp-Source: AGHT+IE0QAxr5uSw6bzxFuqpiZY45fdqjTolioyNdFgZ4rC08Rpcn1+v4k915+1LwXdfaWMLo6r5+XfLeeWwY6imEtU=
X-Received: by 2002:a05:690c:4444:b0:632:12b:8315 with SMTP id
 00721157ae682-6d2769e281emr32492957b3.22.1724942591450; Thu, 29 Aug 2024
 07:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240829090916.1288854-1-thierry.reding@gmail.com>
In-Reply-To: <20240829090916.1288854-1-thierry.reding@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 29 Aug 2024 16:42:35 +0200
Message-ID: <CAPDyKFrzviaCMCoHbquHYjuNhxwdA-WGWp6oaSgS03HHV3+xjQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/tegra: gr3d: Convert into
 dev_pm_domain_attach|detach_list()"
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
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

On Thu, 29 Aug 2024 at 11:09, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> This reverts commit f790b5c09665cab0d51dfcc84832d79d2b1e6c0e. An updated
> version of patch was applied to the PM tree. Sorry for the mixup.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

If not too late, feel free to add:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/gpu/drm/tegra/gr3d.c | 46 ++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index 4de1ea0fc7c0..00c8564520e7 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -46,7 +46,6 @@ struct gr3d {
>         unsigned int nclocks;
>         struct reset_control_bulk_data resets[RST_GR3D_MAX];
>         unsigned int nresets;
> -       struct dev_pm_domain_list *pd_list;
>
>         DECLARE_BITMAP(addr_regs, GR3D_NUM_REGS);
>  };
> @@ -370,12 +369,18 @@ static int gr3d_power_up_legacy_domain(struct device *dev, const char *name,
>         return 0;
>  }
>
> +static void gr3d_del_link(void *link)
> +{
> +       device_link_del(link);
> +}
> +
>  static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
>  {
> -       struct dev_pm_domain_attach_data pd_data = {
> -               .pd_names = (const char *[]) { "3d0", "3d1" },
> -               .num_pd_names = 2,
> -       };
> +       static const char * const opp_genpd_names[] = { "3d0", "3d1", NULL };
> +       const u32 link_flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
> +       struct device **opp_virt_devs, *pd_dev;
> +       struct device_link *link;
> +       unsigned int i;
>         int err;
>
>         err = of_count_phandle_with_args(dev->of_node, "power-domains",
> @@ -409,10 +414,29 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
>         if (dev->pm_domain)
>                 return 0;
>
> -       err = dev_pm_domain_attach_list(dev, &pd_data, &gr3d->pd_list);
> -       if (err < 0)
> +       err = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_devs);
> +       if (err)
>                 return err;
>
> +       for (i = 0; opp_genpd_names[i]; i++) {
> +               pd_dev = opp_virt_devs[i];
> +               if (!pd_dev) {
> +                       dev_err(dev, "failed to get %s power domain\n",
> +                               opp_genpd_names[i]);
> +                       return -EINVAL;
> +               }
> +
> +               link = device_link_add(dev, pd_dev, link_flags);
> +               if (!link) {
> +                       dev_err(dev, "failed to link to %s\n", dev_name(pd_dev));
> +                       return -EINVAL;
> +               }
> +
> +               err = devm_add_action_or_reset(dev, gr3d_del_link, link);
> +               if (err)
> +                       return err;
> +       }
> +
>         return 0;
>  }
>
> @@ -503,13 +527,13 @@ static int gr3d_probe(struct platform_device *pdev)
>
>         err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
>         if (err)
> -               goto err;
> +               return err;
>
>         err = host1x_client_register(&gr3d->client.base);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "failed to register host1x client: %d\n",
>                         err);
> -               goto err;
> +               return err;
>         }
>
>         /* initialize address register map */
> @@ -517,9 +541,6 @@ static int gr3d_probe(struct platform_device *pdev)
>                 set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
>
>         return 0;
> -err:
> -       dev_pm_domain_detach_list(gr3d->pd_list);
> -       return err;
>  }
>
>  static void gr3d_remove(struct platform_device *pdev)
> @@ -528,7 +549,6 @@ static void gr3d_remove(struct platform_device *pdev)
>
>         pm_runtime_disable(&pdev->dev);
>         host1x_client_unregister(&gr3d->client.base);
> -       dev_pm_domain_detach_list(gr3d->pd_list);
>  }
>
>  static int __maybe_unused gr3d_runtime_suspend(struct device *dev)
> --
> 2.45.2
>
