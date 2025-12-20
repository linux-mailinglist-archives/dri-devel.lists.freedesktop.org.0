Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06193CD24A0
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 02:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAAE10E3B1;
	Sat, 20 Dec 2025 01:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GajMqWWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C1910E3B1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 01:04:34 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-64472121ad5so1653514d50.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 17:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766192673; x=1766797473; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=;
 b=GajMqWWyOMui3kAtL5SgI2pPP/59W268T4vNvPTOTlGICIqVeT4nZh6wAeUXK0WDOE
 1Hj5NMBaxslvqWQ7iTDImv9/Iph+EwkyiJVwISf4nBB+ZQPqVkq8v+oQec6bfNJ8RAhh
 +X3w2GQbEpuSIaA8nXJuV2u1q5JI8J/tiBUysRyeIM4uQ/J/yMQEcypjwQ6raN3plQsA
 yvVtjcpAYJ7c/YS8W0SXgLhHpaM7eame+uWU+ffft4yyQxjtJSqJje3P5Nc3Uw8+hwnG
 I5xZAgV4Qb2Vx+pwkesHlUb12emXj21JQL9WzH/k58Ic6JjR5mPkUcYCHyTG4vYKdasc
 plNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766192673; x=1766797473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=;
 b=nO1mIMyHhHOGb11ZSLA3qEi1TXQk0d44hf1DdYpd4dQ0rNRUeQX52UKu6vVm+QBUbW
 YfNGO5BPGoBtitG5BX4uZ6eqKSkFIPDbLhWnLYz6UNU327es2knr47q7Z7wJPG8XrSMV
 QKa2M+ir+rP0MscYYLLAfL9SSjcAda1HtlTm6B8fc8PVWV1C1If/UBhTL3cF9hCmFpwb
 KW9Jbvr0fmbGQQXRv2mHrO4b2laxm5Sp2m9gbrgU/4cMQ4B+PMYKq89N1JPnyqAr+sIm
 RDtyQslVZW81eUG8O3qeTA5QEnWB5GYKnCMTF2sX/ExZanb1BWkeMnCVbl+rq7drwCTG
 BWqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8+7mprP+8JBE2rzPr810px1yOaQOVDt3eWgxJRiY89Vz6tCzAOu7JhT4GQvXfIic+dcfmNzxV+O4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEIlTB+xUcAe7R8jv9JItFep3rIl+eMsg09iiE7PmpXPZoroQt
 qmd/GKmYB5YD2num9N79+dJrYWP9f8lJAeho6f6jqvAbh7b9aAnLVwDqrAT8d6OvxGTQlPTqC6M
 4hc+frR1B5lx5Tn8iH0ttadiv2op+kLo=
X-Gm-Gg: AY/fxX50FC6c1TjEhcqUiclV6Bo/yK9+CFeGPZOtlvQIY4ai8mb2vQK0dX6H7sEsViF
 BRlWawLMXu3g/MkTqrcuWjvzm6BZKISdsUMSiFSh9IDeh7HXPp1ojUJ4602W+9X/1TKy3i2Gb7I
 8CbM60aW+I4pIgrbNepe6RYlMt+VCh531IM8Ak3EanamS5zgfkC7Bv6HD/59wUKJabveNKj0d52
 guZNYfVo3pZzq5mYbVPoVr62CiDegAaxDk1h2xWNIM8v4eEJa+J5d9ji0i6fZz95ScM6vrOKJac
 2C6ewsDDjIZ91lS5L5EF59aCivz5
X-Google-Smtp-Source: AGHT+IEnRAac6u07uzA3LUk5jCrz4OGRvCsnGojqOSsZK7RLqvjo5JYP+wh5edVRUn03IOrbdzCAkAqdhNZxSYFsGbc=
X-Received: by 2002:a05:690e:3c9:b0:645:5467:29f3 with SMTP id
 956f58d0204a3-6466a859780mr2828699d50.39.1766192673550; Fri, 19 Dec 2025
 17:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-4-f6f8f3aa1e93@collabora.com>
In-Reply-To: <20251217-mt8196-shader-present-v1-4-f6f8f3aa1e93@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 19 Dec 2025 17:04:22 -0800
X-Gm-Features: AQt7F2pOYJ6wtBd4hNgFJlclGwmWabkkUpx6tjcAEWdTtCs7JRe062F7FH3q2go
Message-ID: <CAPaKu7TVeaEFRWBt7rF_uVUyYO72GHqFwKi7D52juPTRAk7URw@mail.gmail.com>
Subject: Re: [PATCH 4/4] pmdomain: mediatek: mtk-mfg: Expose shader_present as
 nvmem cell
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
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

On Wed, Dec 17, 2025 at 9:04=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Implement nvmem-provider functionality in mtk-mfg-pmdomain, such that it
> can expose its GF_REG_SHADER_PRESENT value in the shared memory as an
> nvmem cell for panthor.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 57 ++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 9bad577b3ae4..725ebc678f1b 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/container_of.h>
>  #include <linux/iopoll.h>
> +#include <linux/nvmem-provider.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -872,6 +873,58 @@ static int mtk_mfg_init_clk_provider(struct mtk_mfg =
*mfg)
>         return 0;
>  }
>
> +static int mtk_mfg_read_nvmem(void *priv, unsigned int offset, void *val=
, size_t bytes)
> +{
> +       struct mtk_mfg *mfg =3D priv;
> +       u32 *buf =3D val;
> +
> +       if (bytes !=3D 4)
> +               return -EINVAL;
> +
> +       if (!mfg->shared_mem)
> +               return -ENODEV;
> +
> +       if (offset + bytes >=3D mfg->shared_mem_size)
> +               return -EINVAL;
> +
> +       *buf =3D readl(mfg->shared_mem + offset);
> +
> +       return 0;
> +}
> +
> +static int mtk_mfg_init_nvmem_provider(struct mtk_mfg *mfg)
> +{
> +       struct device *dev =3D &mfg->pdev->dev;
> +       struct nvmem_cell_info cell =3D {};
> +       struct nvmem_config config =3D {};
> +       struct nvmem_device *nvdev;
> +       int ret;
> +
> +       config.reg_read =3D mtk_mfg_read_nvmem;
> +       config.dev =3D dev;
> +       config.read_only =3D true;
> +       config.priv =3D mfg;
> +       config.size =3D 4;
> +       config.word_size =3D 4;
> +
> +       nvdev =3D devm_nvmem_register(dev, &config);
> +       of_node_put(config.of_node);
This looks like a dead line.
> +       if (IS_ERR(nvdev))
> +               return dev_err_probe(dev, PTR_ERR(nvdev), "Couldn't regis=
ter nvmem provider\n");
> +
> +       cell.name =3D "shader-present";
> +       cell.offset =3D GF_REG_SHADER_PRESENT;
> +       cell.bytes =3D 4;
> +       cell.np =3D of_get_child_by_name(dev->of_node, cell.name);
> +
> +       ret =3D nvmem_add_one_cell(nvdev, &cell);
> +       /* cell.np purposefully not put as nvmem_add_one_cell does not in=
crease refcount */
I think you still need to of_node_put on errors.
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't add cell %s\n", =
cell.name);
> +
> +       return 0;
> +}
> +
>  static int mtk_mfg_probe(struct platform_device *pdev)
>  {
>         struct mtk_mfg *mfg;
> @@ -984,6 +1037,10 @@ static int mtk_mfg_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 goto err_power_off;
>
> +       ret =3D mtk_mfg_init_nvmem_provider(mfg);
> +       if (ret)
> +               goto err_power_off;
> +
>         ret =3D of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
>         if (ret) {
>                 dev_err_probe(dev, ret, "Failed to add pmdomain provider\=
n");
>
> --
> 2.52.0
>
